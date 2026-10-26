<?php
require_once dirname(__DIR__).'/application/quick_appointment.class.php';
trait AdminQuickAppointmentActions
{
    public function quickappointments($para = array())
    {
        if (!$this->prepareAdminAccess('quick_appointments')) return;
        global $db;
        header('Cache-Control: no-store');
        if (!$this->adminTableExists('hicrm_quick_appointments')) {
            $this->renderAdminNotice('Đặt lịch khám nhanh','Chạy tools/setup-quick-appointments.php để cài đặt chức năng.','quick_appointments'); return;
        }
        $action = (string)($para[1] ?? ''); $id = (int)($para[2] ?? 0);
        $item = null;
        if ($id > 0) {
            $db->query('SELECT * FROM hicrm_quick_appointments WHERE status <> 99 AND id='.$id.' LIMIT 1');
            $item = $db->fetch_object(true);
        }
        $this->view->data['active_menu'] = 'quick_appointments';
        $this->view->data['appointment_errors'] = array();
        if ((in_array($action,array('edit','delete'),true) || ($action === 'save' && $id > 0)) && !$item) {
            http_response_code(404); exit('Không tìm thấy lịch khám.');
        }
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $token = $_POST['csrf_token'] ?? null;
            if (!is_string($token) || !hash_equals((string)$_SESSION['admin_csrf_token'], $token)) {
                http_response_code(403); exit('Phiên làm việc không hợp lệ.');
            }
            if ($action === 'delete' && $item) {
                $db->query('UPDATE hicrm_quick_appointments SET status=99 WHERE id='.$id);
                $this->setAdminFlash('success','Đã chuyển lịch khám vào Sọt rác.');
                $this->adminRedirect('/admin/quickappointments'); return;
            }
            if ($action !== 'save') { http_response_code(400); exit('Yêu cầu không hợp lệ.'); }
            // Keep past appointments editable without permitting new past dates.
            $allowPast = $item && is_string($_POST['exam_date'] ?? null) && $_POST['exam_date'] === $item->exam_date;
            $validation = QuickAppointment::validate($_POST, $allowPast);
            if (!$validation['errors'] && QuickAppointment::duplicate($db,$validation['data'],$id)) {
                $validation['errors']['exam_date'] = 'Căn cước công dân này đã đăng ký khám trong ngày đã chọn.';
            }
            if ($validation['errors']) {
                http_response_code(422);
                $this->view->data['appointment_errors'] = $validation['errors'];
                $this->view->data['appointment_item'] = (object)array_merge($validation['data'],array('id'=>$id));
                $this->view->data['appointment_min_date'] = $allowPast ? $item->exam_date : QuickAppointment::today();
                $this->view->admintmp('quick-appointment-form'); return;
            }
            if (!QuickAppointment::save($db,$validation['data'],$id)) {
                $this->setAdminFlash('danger','Không thể lưu lịch khám. Vui lòng kiểm tra trùng lịch hoặc thử lại.');
                $this->adminRedirect('/admin/quickappointments'); return;
            }
            $this->setAdminFlash('success',$id ? 'Đã cập nhật lịch khám.' : 'Đã thêm lịch khám.');
            $this->adminRedirect('/admin/quickappointments'); return;
        }
        if (in_array($action,array('save','delete'),true)) { http_response_code(405); exit('Vui lòng sử dụng biểu mẫu.'); }
        if ($action === 'add' || $action === 'edit') {
            $this->view->data['appointment_item'] = $item;
            $this->view->data['appointment_min_date'] = $item && $item->exam_date < QuickAppointment::today() ? $item->exam_date : QuickAppointment::today();
            $this->view->admintmp('quick-appointment-form'); return;
        }
        if ($action !== '') { http_response_code(404); exit('Không tìm thấy trang.'); }
        $keyword = isset($_GET['q']) && is_string($_GET['q']) ? mb_substr(trim($_GET['q']),0,120) : '';
        $where = 'status <> 99';
        if ($keyword !== '') {
            $like = $db->escapestring('%'.str_replace(array('!','%','_'),array('!!','!%','!_'),$keyword).'%');
            $where .= " AND (full_name LIKE '".$like."' ESCAPE '!' OR citizen_id LIKE '".$like."' ESCAPE '!' OR phone LIKE '".$like."' ESCAPE '!')";
        }
        $filters = array(); $filterErrors = array();
        foreach (array('exam_from','exam_to','registered_from','registered_to') as $field) {
            $raw = $_GET[$field] ?? '';
            $filters[$field] = is_string($raw) ? trim($raw) : '';
            if ($raw === '') continue;
            $date = is_string($raw) && preg_match('/^[0-9]{4}-[0-9]{2}-[0-9]{2}$/D', $filters[$field])
                ? DateTimeImmutable::createFromFormat('!Y-m-d', $filters[$field]) : false;
            if (!$date || $date->format('Y-m-d') !== $filters[$field] || substr($filters[$field],0,4) < '1000') {
                $filterErrors[] = 'Ngày lọc không hợp lệ. Vui lòng chọn lại ngày.';
            }
        }
        foreach (array('exam'=>'ngày khám','registered'=>'ngày đăng ký') as $prefix=>$label) {
            if ($filters[$prefix.'_from'] !== '' && $filters[$prefix.'_to'] !== '' && $filters[$prefix.'_from'] > $filters[$prefix.'_to']) {
                $filterErrors[] = 'Khoảng '.$label.': ngày bắt đầu phải nhỏ hơn hoặc bằng ngày kết thúc.';
            }
        }
        if ($filterErrors) {
            $where .= ' AND 1=0';
        } else {
            foreach (array('exam_from'=>array('exam_date','>=',''), 'exam_to'=>array('exam_date','<=',''),
                'registered_from'=>array('created_at','>=',' 00:00:00'), 'registered_to'=>array('created_at','<=',' 23:59:59')) as $field=>$condition) {
                if ($filters[$field] !== '') $where .= ' AND '.$condition[0].' '.$condition[1]." '".$db->escapestring($filters[$field].$condition[2])."'";
            }
        }
        $this->view->data['appointment_filters'] = $filters;
        $this->view->data['appointment_filter_errors'] = array_unique($filterErrors);
        $db->query('SELECT COUNT(*) AS total FROM hicrm_quick_appointments WHERE '.$where);
        $total = (int)$db->fetch_object(true)->total;
        $pages = max(1,(int)ceil($total/25));
        $page = max(1,min($pages,(int)($_GET['page'] ?? 1)));
        $db->query('SELECT * FROM hicrm_quick_appointments WHERE '.$where.' ORDER BY exam_date DESC,id DESC LIMIT 25 OFFSET '.(($page-1)*25));
        $this->view->data['appointment_rows'] = $db->fetch_object();
        $this->view->data['appointment_flash'] = $this->getAdminFlash();
        $this->view->data['appointment_keyword'] = $keyword;
        $this->view->data['appointment_page'] = $page;
        $this->view->data['appointment_pages'] = $pages;
        $this->view->data['appointment_total'] = $total;
        $this->view->admintmp('quick-appointments');
    }
}
