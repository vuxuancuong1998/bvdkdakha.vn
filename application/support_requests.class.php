<?php
class SupportRequests
{
    public static function statuses()
    {
        return array('draft'=>'Bản nháp','sent'=>'Đã gửi','processing'=>'Đang xử lý','completed'=>'Đã xử lý','rejected'=>'Bị từ chối');
    }

    public static function ensureSchema($db)
    {
        $db->query("CREATE TABLE IF NOT EXISTS hicrm_support_requests (
            id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, request_code VARCHAR(50) NOT NULL,
            user_id INT NOT NULL DEFAULT 0, user_name VARCHAR(255) NOT NULL, user_email VARCHAR(255) DEFAULT NULL,
            department VARCHAR(255) DEFAULT NULL, service_type VARCHAR(100) NOT NULL DEFAULT 'CNTT',
            priority VARCHAR(50) NOT NULL DEFAULT 'Normal', title VARCHAR(255) NOT NULL, content TEXT DEFAULT NULL,
            attachment VARCHAR(255) DEFAULT NULL, resolution_note TEXT DEFAULT NULL, status VARCHAR(50) NOT NULL DEFAULT 'sent',
            created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
            KEY idx_user_id(user_id), KEY idx_status(status)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");
        $db->query("CREATE TABLE IF NOT EXISTS hicrm_support_request_history (
            id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, request_id INT NOT NULL, admin_id INT NOT NULL,
            admin_name VARCHAR(255) NOT NULL, action VARCHAR(30) NOT NULL, from_status VARCHAR(50) NOT NULL,
            to_status VARCHAR(50) NOT NULL, content TEXT NOT NULL, created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
            KEY idx_request_history(request_id,id)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");
    }

    public static function actor($db)
    {
        $id = (int)($_SESSION['user']['id'] ?? 0);
        if ($id <= 0) return null;
        $db->query("SELECT u.*, d.depart_name FROM hicrm_users u LEFT JOIN hicrm_departments d ON d.id=u.user_department WHERE u.id=$id AND u.user_status=1 LIMIT 1");
        return $db->fetch_object(true);
    }

    public static function scope($db, $actor)
    {
        $scope = 'user_id='.(int)$actor->id;
        if (trim((string)($actor->depart_name ?? '')) !== '') {
            $scope .= " OR (status <> 'draft' AND department='".$db->escapestring($actor->depart_name)."')";
        }
        return '(' . $scope . ") AND status <> '99'";
    }

    public static function listing($db, $where, $status = '', $q = '')
    {
        if ($status === 'processing') $where .= " AND status IN ('sent','processing')";
        elseif (isset(self::statuses()[$status])) $where .= " AND status='".$db->escapestring($status)."'";
        if ($q !== '') {
            $like = $db->escapestring('%'.str_replace(array('!','%','_'),array('!!','!%','!_'),mb_substr($q,0,120)).'%');
            $where .= " AND (request_code LIKE '$like' ESCAPE '!' OR title LIKE '$like' ESCAPE '!' OR user_name LIKE '$like' ESCAPE '!' OR department LIKE '$like' ESCAPE '!')";
        }
        return $where;
    }

    public static function stats($db, $where)
    {
        $db->query("SELECT COUNT(*) total_all, COALESCE(SUM(status='completed'),0) total_completed,
            COALESCE(SUM(status IN ('sent','processing')),0) total_processing, COALESCE(SUM(status='draft'),0) total_draft,
            COALESCE(SUM(status='rejected'),0) total_rejected FROM hicrm_support_requests WHERE $where");
        return $db->fetch_object(true);
    }

    public static function history($db, $id)
    {
        $db->query('SELECT id, admin_name, action, from_status, to_status, content, created_at FROM hicrm_support_request_history WHERE request_id='.(int)$id." AND action <> 'delete' ORDER BY id ASC");
        return $db->fetch_object();
    }

    public static function attachmentUrl($path)
    {
        $path = (string)$path;
        return preg_match('~^uploads/files/[a-zA-Z0-9_.-]+\.(pdf|png|jpg|jpeg|gif|webp|doc|docx|zip)$~iD', $path) ? XC_URL.'/'.$path : '';
    }

    public static function act($db, $id, $action, $note, $actor, $expectedStatus = '')
    {
        $fail = function($code,$message){ return array('status'=>$code,'message'=>$message); };
        $note = trim($note);
        if ($id <= 0 || !in_array($action,array('processing','completed','rejected','reply','delete'),true)) return $fail(400,'Thao tác hoặc mã yêu cầu không hợp lệ');
        if (mb_strlen($note)>10000) return $fail(400,'Nội dung phản hồi tối đa 10.000 ký tự');
        if (in_array($action,array('completed','rejected','reply'),true) && $note==='') return $fail(400,'Vui lòng nhập nội dung phản hồi, kết quả xử lý hoặc lý do từ chối');
        $db->query('START TRANSACTION');
        try {
            $db->query('SELECT * FROM hicrm_support_requests WHERE id='.(int)$id.' FOR UPDATE');
            $row=$db->fetch_object(true);
            if (!$row || in_array($row->status,array('draft','99'),true)) { $db->query('ROLLBACK'); return $fail(404,'Không tìm thấy yêu cầu đã gửi'); }
            if ($expectedStatus!=='' && $row->status!==$expectedStatus) { $db->query('ROLLBACK'); return $fail(409,'Yêu cầu đã thay đổi trạng thái. Vui lòng tải lại trước khi xử lý'); }
            $status=$action==='reply' ? $row->status : ($action==='delete' ? '99' : $action);
            if ($action!=='reply' && $row->status===$status) { $db->query('ROLLBACK'); return $fail(409,'Yêu cầu đã ở trạng thái này'); }
            if (in_array($row->status,array('completed','rejected'),true) && in_array($action,array('completed','rejected'),true)) { $db->query('ROLLBACK'); return $fail(409,'Hãy mở lại xử lý trước khi đổi kết quả của yêu cầu đã kết thúc'); }
            $eNote=$db->escapestring($note); $eName=$db->escapestring($actor->full_name ?: $actor->user_username);
            $eFrom=$db->escapestring($row->status);
            if (trim((string)$row->resolution_note)!=='') {
                $db->query('SELECT id FROM hicrm_support_request_history WHERE request_id='.(int)$id.' LIMIT 1');
                if (!$db->num_row()) {
                    $legacy=$db->escapestring($row->resolution_note); $date=$db->escapestring($row->updated_at ?: $row->created_at);
                    if (!$db->tryQuery("INSERT INTO hicrm_support_request_history(request_id,admin_id,admin_name,action,from_status,to_status,content,created_at) VALUES (".(int)$id.",0,'Thông tin xử lý trước đây','legacy','$eFrom','$eFrom','$legacy','$date')")) throw new RuntimeException('legacy');
                }
            }
            $noteSql=$note!=='' && $action!=='delete' ? ", resolution_note='$eNote'" : '';
            if (!$db->tryQuery("UPDATE hicrm_support_requests SET status='$status', updated_at=NOW() $noteSql WHERE id=".(int)$id)) throw new RuntimeException('save');
            if (!$db->tryQuery("INSERT INTO hicrm_support_request_history(request_id,admin_id,admin_name,action,from_status,to_status,content) VALUES (".(int)$id.','.(int)$actor->id.", '$eName','$action','$eFrom','$status','$eNote')")) throw new RuntimeException('history');
            $db->query('COMMIT');
            return array('status'=>200,'message'=>'Đã cập nhật yêu cầu','request_status'=>$status);
        } catch (Throwable $e) {
            $db->query('ROLLBACK'); return $fail(500,'Không thể lưu yêu cầu. Vui lòng thử lại');
        }
    }
}
