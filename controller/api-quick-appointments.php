<?php
require_once dirname(__DIR__).'/application/quick_appointment.class.php';
trait ApiQuickAppointmentActions
{
    public function submitQuickAppointment()
    {
        global $db;
        header('Content-Type: application/json; charset=utf-8');
        header('Cache-Control: no-store');
        $respond = function($status, $message, $errors = array()) {
            http_response_code($status);
            echo json_encode(array('status'=>$status,'message'=>$message,'errors'=>$errors), JSON_UNESCAPED_UNICODE);
        };
        if ($_SERVER['REQUEST_METHOD'] !== 'POST') { $respond(405,'Phương thức không được hỗ trợ.'); return; }
        $token = $_POST['csrf_token'] ?? null;
        if (!is_string($token) || empty($_SESSION['quick_appointment_csrf']) || !hash_equals($_SESSION['quick_appointment_csrf'], $token)) {
            $respond(403,'Phiên đăng ký hết hạn. Vui lòng tải lại trang.'); return;
        }
        $validation = QuickAppointment::validate($_POST);
        if ($validation['errors']) { $respond(422,'Vui lòng kiểm tra các trường thông tin.', $validation['errors']); return; }
        if (!empty($_SESSION['quick_appointment_last_sent']) && time() - $_SESSION['quick_appointment_last_sent'] < 30) {
            $respond(429,'Vui lòng đợi 30 giây trước khi gửi yêu cầu tiếp theo.'); return;
        }
        $db->query("SHOW TABLES LIKE 'hicrm_quick_appointments'");
        if (!$db->num_row()) { $respond(503,'Chức năng đặt lịch đang được bảo trì. Vui lòng thử lại sau.'); return; }
        if (QuickAppointment::duplicate($db, $validation['data'])) {
            $respond(422,'Không thể gửi đăng ký. Vui lòng kiểm tra thông tin hoặc liên hệ bệnh viện.', array('exam_date'=>'Vui lòng kiểm tra lại lịch đăng ký hoặc liên hệ bệnh viện.')); return;
        }
        if (!QuickAppointment::save($db, $validation['data'])) {
            $respond(409,'Không thể lưu đăng ký. Vui lòng kiểm tra lịch đã gửi hoặc thử lại sau.'); return;
        }
        $_SESSION['quick_appointment_last_sent'] = time();
        $respond(200,'Đã tiếp nhận đăng ký. Bệnh viện sẽ liên hệ xác nhận lịch khám.');
    }
}
