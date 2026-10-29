<?php
require_once dirname(__DIR__).'/application/support_requests.class.php';
trait ApiSupportRequestActions
{
    private function supportJson($data)
    {
        header('Content-Type: application/json; charset=utf-8');
        header('Cache-Control: no-store');
        echo json_encode($data,JSON_UNESCAPED_UNICODE|JSON_INVALID_UTF8_SUBSTITUTE);
    }

    public function supportrequestaction()
    {
        if (!$this->requireAdminApiPermission('support_requests')) return;
        global $db;
        if (($_SERVER['REQUEST_METHOD'] ?? '')!=='POST') { $this->supportJson(array('status'=>405,'message'=>'Vui lòng sử dụng POST')); return; }
        SupportRequests::ensureSchema($db);
        $actor=SupportRequests::actor($db);
        if (!$actor || (int)$actor->is_admin!==1) { $this->supportJson(array('status'=>403,'message'=>'Không có quyền xử lý yêu cầu')); return; }
        $this->supportJson(SupportRequests::act($db,(int)($_POST['id'] ?? 0),(string)($_POST['action'] ?? ''), (string)($_POST['resolution_note'] ?? ''),$actor,(string)($_POST['expected_status'] ?? '')));
    }

    public function updaterequeststatus()
    {
        $_POST['action']=$_POST['status'] ?? '';
        $this->supportrequestaction();
    }

    public function workspacerequests()
    {
        global $db;
        $actor=SupportRequests::actor($db);
        if (!$actor) { $this->supportJson(array('status'=>401,'message'=>'Vui lòng đăng nhập lại')); return; }
        SupportRequests::ensureSchema($db);
        $scope=SupportRequests::scope($db,$actor);
        $status=is_string($_GET['status'] ?? null) ? $_GET['status'] : '';
        $q=is_string($_GET['q'] ?? null) ? trim($_GET['q']) : '';
        $where=SupportRequests::listing($db,$scope,$status,$q);
        $db->query("SELECT * FROM hicrm_support_requests WHERE $where ORDER BY id DESC");
        $rows=$db->fetch_object();
        foreach ($rows as $row) $row->attachment_url=SupportRequests::attachmentUrl($row->attachment);
        $this->supportJson(array('status'=>200,'requests'=>$rows,'stats'=>SupportRequests::stats($db,$scope)));
    }

    public function requestdetail()
    {
        global $db;
        $actor=SupportRequests::actor($db);
        if (!$actor) { $this->supportJson(array('status'=>401,'message'=>'Vui lòng đăng nhập lại')); return; }
        SupportRequests::ensureSchema($db);
        $id=(int)($_GET['id'] ?? 0);
        $scope=SupportRequests::scope($db,$actor);
        $db->query("SELECT * FROM hicrm_support_requests WHERE id=$id AND $scope LIMIT 1");
        $row=$db->fetch_object(true);
        if (!$row) { $this->supportJson(array('status'=>404,'message'=>'Yêu cầu không còn tồn tại hoặc bạn không có quyền xem')); return; }
        $row->attachment_url=SupportRequests::attachmentUrl($row->attachment);
        $this->supportJson(array('status'=>200,'request'=>$row,'history'=>SupportRequests::history($db,$id)));
    }

    public function submitrequest()
    {
        global $db;
        $actor=SupportRequests::actor($db);
        if (!$actor) { $this->supportJson(array('status'=>401,'message'=>'Vui lòng đăng nhập để gửi yêu cầu')); return; }
        $token=(string)($_POST['csrf_token'] ?? '');
        if (($_SERVER['REQUEST_METHOD'] ?? '')!=='POST' || $token==='' || !hash_equals((string)($_SESSION['workspace_csrf_token'] ?? ''),$token)) {
            $this->supportJson(array('status'=>419,'message'=>'Phiên thao tác đã hết hạn. Vui lòng tải lại trang')); return;
        }
        SupportRequests::ensureSchema($db);
        $title=trim((string)($_POST['title'] ?? ''));
        $content=trim((string)($_POST['content'] ?? ''));
        $name=trim((string)($_POST['user_name'] ?? '')) ?: ($actor->full_name ?: $actor->user_username);
        $service=trim((string)($_POST['service_type'] ?? 'CNTT'));
        $priority=(string)($_POST['priority'] ?? 'Normal');
        $status=(string)($_POST['action_status'] ?? 'sent');
        if ($title==='' || mb_strlen($title)>255 || mb_strlen($content)>20000 || mb_strlen($name)>255 || $service==='' || mb_strlen($service)>100 || !in_array($priority,array('Normal','Low','High','Urgent'),true) || !in_array($status,array('sent','draft'),true)) {
            $this->supportJson(array('status'=>400,'message'=>'Kiểm tra tiêu đề (tối đa 255 ký tự), nội dung (tối đa 20.000 ký tự), mức ưu tiên và trạng thái gửi')); return;
        }
        $attachment=''; $target='';
        $file=$_FILES['attachment'] ?? null;
        if ($file && (int)$file['error']!==UPLOAD_ERR_NO_FILE) {
            $ext=strtolower(pathinfo($file['name'],PATHINFO_EXTENSION));
            if ((int)$file['error']!==UPLOAD_ERR_OK || (int)$file['size']>10*1024*1024 || !in_array($ext,array('pdf','png','jpg','jpeg','gif','webp','doc','docx','zip'),true)) {
                $this->supportJson(array('status'=>400,'message'=>'Tệp đính kèm phải là ảnh, PDF, Word hoặc ZIP, tối đa 10 MB')); return;
            }
            $attachment='uploads/files/request_'.bin2hex(random_bytes(12)).'.'.$ext;
            $target=dirname(__DIR__).'/'.$attachment;
            if (!move_uploaded_file($file['tmp_name'],$target)) { $this->supportJson(array('status'=>500,'message'=>'Không thể lưu tệp đính kèm')); return; }
        }
        $values=array('YC-'.date('Ymd').'-'.strtoupper(bin2hex(random_bytes(4))),$name,(string)$actor->user_email,(string)($actor->depart_name ?? ''),$service,$priority,$title,$content,$attachment,$status);
        $v=array_map(function($value) use ($db){return "'".$db->escapestring($value)."'";},$values);
        $sql="INSERT INTO hicrm_support_requests(request_code,user_name,user_email,department,service_type,priority,title,content,attachment,status,user_id,created_at,updated_at) VALUES (".implode(',',$v).','.(int)$actor->id.',NOW(),NOW())';
        if (!$db->tryQuery($sql)) { if ($target!=='' && is_file($target)) unlink($target); $this->supportJson(array('status'=>500,'message'=>'Không thể lưu yêu cầu')); return; }
        $this->supportJson(array('status'=>200,'request_code'=>$values[0],'message'=>$status==='draft'?'Đã lưu bản nháp':'Đã gửi yêu cầu hỗ trợ','returnUrl'=>XC_URL.'/khong-gian-lam-viec-so'));
    }
}
