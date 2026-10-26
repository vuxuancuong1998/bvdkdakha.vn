<?php
if (PHP_SAPI !== 'cli') { http_response_code(404); exit; }
session_save_path(sys_get_temp_dir());
require dirname(__DIR__).'/config.php';
require dirname(__DIR__).'/application/database.class.php';
require dirname(__DIR__).'/application/admin_trash.class.php';
require dirname(__DIR__).'/controller/admin-quick-appointments.php';
require dirname(__DIR__).'/controller/api-quick-appointments.php';
class AppointmentTestView {
    public $data = array(); public $template;
    public function admintmp($name) { $this->template=$name; }
}
class AppointmentTestAdmin {
    use AdminQuickAppointmentActions;
    public $view; public $flash; public $redirect; public $allowed=true;
    public function __construct() { $this->view=new AppointmentTestView(); }
    private function prepareAdminAccess($key) { if($key!=='quick_appointments') throw new Exception('Wrong permission'); return $this->allowed; }
    private function adminTableExists($table) { return true; }
    private function setAdminFlash($type,$message) { $this->flash=array($type,$message); }
    private function getAdminFlash() { return $this->flash; }
    private function adminRedirect($path) { $this->redirect=$path; }
}
class AppointmentTestApi { use ApiQuickAppointmentActions; }
$results=array();
function bookingCheck($condition,$message) { global $results; if(!$condition) throw new Exception($message); $results[]='PASS: '.$message; }
function bookingApi($post,$method='POST') {
    $_POST=$post; $_SERVER['REQUEST_METHOD']=$method; http_response_code(200);
    ob_start(); (new AppointmentTestApi())->submitQuickAppointment(); $json=ob_get_clean();
    return json_decode($json,true,512,JSON_THROW_ON_ERROR);
}
function bookingRow($id) { global $db; $db->query('SELECT * FROM hicrm_quick_appointments WHERE id='.(int)$id); return $db->fetch_object(true); }
$db=Database::getInstance(); $db->query('START TRANSACTION');
try {
    $_SESSION['quick_appointment_csrf']='test-token';
    $_SESSION['admin_csrf_token']='admin-test-token';
    unset($_SESSION['quick_appointment_last_sent']);
    $valid=array('csrf_token'=>'test-token','full_name'=>'Nguyễn Văn Kiểm Thử','citizen_id'=>'000000000001','phone'=>'0912345678','exam_date'=>QuickAppointment::today());
    bookingCheck(!QuickAppointment::validate($valid)['errors'],'Valid Vietnamese name, CCCD, phone and today accepted');
    $cases=array(
      array('full_name','<script>test</script>'),array('full_name','1'),array('full_name',array()),
      array('citizen_id','123'),array('citizen_id','00000000000A'),array('citizen_id',array()),
      array('phone','0123456789'),array('phone','123'),array('phone',array()),
      array('exam_date','2027-02-30'),array('exam_date',"2027-01-01\0"),array('exam_date',array()),
      array('exam_date',(new DateTimeImmutable(QuickAppointment::today()))->modify('-1 day')->format('Y-m-d'))
    );
    foreach($cases as $case) { $input=$valid; $input[$case[0]]=$case[1]; bookingCheck(isset(QuickAppointment::validate($input)['errors'][$case[0]]),'Invalid '.$case[0].' rejected'); }
    $input=$valid; $input['phone']='+84912345678'; bookingCheck(QuickAppointment::validate($input)['data']['phone']==='0912345678','Country prefix normalized');
    $input=$valid; $input['phone']='02603822115'; bookingCheck(!QuickAppointment::validate($input)['errors'],'Landline accepted');
    bookingCheck(bookingApi(array(),'GET')['status']===405,'API rejects GET');
    bookingCheck(bookingApi(array())['status']===403,'API rejects missing CSRF');
    $response=bookingApi(array('csrf_token'=>'test-token'));
    bookingCheck($response['status']===422 && count($response['errors'])===4,'API reports all required field errors');
    bookingCheck(bookingApi($valid)['status']===200,'API creates appointment');
    $id=(int)$db->insert_id();
    bookingCheck(bookingRow($id)->citizen_id==='000000000001','CCCD leading zeros retained');
    bookingCheck(bookingApi($valid)['status']===429,'API enforces session rate limit');
    unset($_SESSION['quick_appointment_last_sent']);
    bookingCheck(bookingApi($valid)['status']===422,'Duplicate appointment rejected');
    bookingCheck(!QuickAppointment::save($db,$valid),'Database prevents concurrent duplicate insertion');
    $admin=new AppointmentTestAdmin(); $_SERVER['REQUEST_METHOD']='GET'; $_GET=array('q'=>'000000000001');
    $admin->quickappointments(array('quickappointments'));
    bookingCheck($admin->view->data['appointment_total']===1,'Admin searches by CCCD');
    $_GET=array('q'=>'%'); $admin->quickappointments(array('quickappointments'));
    bookingCheck($admin->view->data['appointment_total']===0,'Search treats wildcard as literal');
    $_POST=$valid; $_POST['csrf_token']='admin-test-token'; $_POST['citizen_id']='000000000002';
    $_SERVER['REQUEST_METHOD']='POST';
    $admin->quickappointments(array('quickappointments','save'));
    $second=(int)$db->insert_id();
    bookingCheck(bookingRow($second)->citizen_id==='000000000002','Admin creates appointment');
    $_POST['full_name']="Nguyễn O'Neil";
    $admin->quickappointments(array('quickappointments','save',$second));
    bookingCheck(bookingRow($second)->full_name==="Nguyễn O'Neil",'Admin edits with escaped apostrophe');
    $_POST['phone']='bad';
    $admin->quickappointments(array('quickappointments','save',$second));
    bookingCheck(isset($admin->view->data['appointment_errors']['phone']) && bookingRow($second)->phone==='0912345678','Admin validation retains input without changing record');
    $admin->quickappointments(array('quickappointments','delete',$second));
    bookingCheck((int)bookingRow($second)->status===99,'Admin deletes into trash');
    $trash=new AdminTrash($db,array('quick_appointments')); $trash->act('restore','hicrm_quick_appointments',$second);
    bookingCheck((int)bookingRow($second)->status===1,'Trash restores appointment');
    $_SERVER['REQUEST_METHOD']='GET';
    $today=QuickAppointment::today();
    $tomorrow=(new DateTimeImmutable($today))->modify('+1 day')->format('Y-m-d');
    $db->query("UPDATE hicrm_quick_appointments SET created_at='".$today." 23:59:59' WHERE id=".$second);
    $_GET=array('q'=>'000000000002','exam_from'=>$today,'exam_to'=>$today,'registered_from'=>$today,'registered_to'=>$today);
    $admin->quickappointments(array('quickappointments'));
    bookingCheck($admin->view->data['appointment_total']===1,'Combined date filters include registration at end of day');
    $_GET['registered_from']=$tomorrow; $_GET['registered_to']='';
    $admin->quickappointments(array('quickappointments'));
    bookingCheck($admin->view->data['appointment_total']===0,'Registration lower bound excludes earlier records');
    $_GET=array('q'=>'000000000002','exam_from'=>$tomorrow);
    $admin->quickappointments(array('quickappointments'));
    bookingCheck($admin->view->data['appointment_total']===0,'Exam lower bound excludes earlier appointments');
    $_GET=array('exam_from'=>$tomorrow,'exam_to'=>$today);
    $admin->quickappointments(array('quickappointments'));
    bookingCheck(!empty($admin->view->data['appointment_filter_errors']) && $admin->view->data['appointment_total']===0,'Reversed date range reports error');
    $_GET=array('registered_to'=>'2027-02-30');
    $admin->quickappointments(array('quickappointments'));
    bookingCheck(!empty($admin->view->data['appointment_filter_errors']),'Impossible filter date rejected');
    $denied=new AppointmentTestAdmin(); $denied->allowed=false;
    $denied->quickappointments(array('quickappointments'));
    bookingCheck($denied->view->template===null,'Permission denial blocks admin action');
} finally { $db->query('ROLLBACK'); }
echo implode(PHP_EOL,$results).PHP_EOL;
