<?php
if (PHP_SAPI!=='cli') { http_response_code(404); exit; }
session_save_path(sys_get_temp_dir());
require dirname(__DIR__).'/config.php';
require dirname(__DIR__).'/application/database.class.php';
require dirname(__DIR__).'/application/controller_base.class.php';
require dirname(__DIR__).'/controller/apiController.php';
require dirname(__DIR__).'/application/admin_trash.class.php';
require dirname(__DIR__).'/controller/admin-support-requests.php';
require dirname(__DIR__).'/controller/pageController.php';
$db=Database::getInstance(); SupportRequests::ensureSchema($db);
set_error_handler(function($level,$message,$file,$line){throw new ErrorException($message,0,$level,$file,$line);});
function ticketCheck($ok,$message){if(!$ok)throw new RuntimeException($message);fwrite(STDOUT,'PASS: '.$message.PHP_EOL);}
function ticketCall($api,$method,$post=array(),$get=array()) { $_POST=$post;$_GET=$get;ob_start();try{$api->$method();$output=ob_get_contents();}finally{ob_end_clean();}$result=json_decode($output,true);if(!is_array($result))throw new RuntimeException('Invalid JSON');return $result; }
class SupportFixtureView { public $data=array(); public $template; public function admintmp($name){$this->template=$name;} public function show($name){$this->template=$name;} }
class SupportFixtureAdmin { use AdminSupportRequestActions; public $view; public function __construct(){$this->view=new SupportFixtureView();} private function prepareAdminAccess($key){return $key==='support_requests';} private function renderAdminNotice($a,$b,$c){$this->view->template='notice';} }
// Temporary tables shadow live tables on this connection only; transactions in production actions can commit safely.
foreach(array('hicrm_support_requests','hicrm_support_request_history','hicrm_users') as $table) {
    $db->query("SHOW CREATE TABLE $table"); $ddl=$db->fetch_array(true);
    $db->query(str_replace('CREATE TABLE','CREATE TEMPORARY TABLE',$ddl['Create Table']));
}
$db->query("SELECT id,depart_name FROM hicrm_departments WHERE depart_status<>99 LIMIT 1");$dept=$db->fetch_object(true);
if(!$dept)throw new RuntimeException('No local department');
$db->query("INSERT INTO hicrm_users(id,user_username,full_name,user_password,user_department,user_avatar_url,is_admin,user_phone,user_email,user_group,user_status,user_created_date) VALUES
 (990001,'Fixture Admin','Fixture Admin','x',".(int)$dept->id.",'',1,'','',1,1,CURRENT_DATE),
 (990002,'Fixture Staff','Fixture Staff','x',".(int)$dept->id.",'',0,'','',5,1,CURRENT_DATE),
 (990003,'Fixture Other','Fixture Other','x',0,'',0,'','',5,1,CURRENT_DATE)");
$_SERVER['REQUEST_METHOD']='POST';$_FILES=array();$_SESSION['user']=array('id'=>990002);
$_SESSION['workspace_csrf_token']='workspace-fixture';$_SESSION['admin_csrf_token']='admin-fixture';
$api=(new ReflectionClass('apiController'))->newInstanceWithoutConstructor();
$post=array('title'=>'Fixture <script>alert(1)</script>', 'content'=>"Nội dung ' kiểm thử",'service_type'=>'CNTT','priority'=>'High','action_status'=>'sent','csrf_token'=>'workspace-fixture');
$created=ticketCall($api,'submitrequest',$post); ticketCheck($created['status']===200,'Staff submits authenticated request');
$db->query('SELECT * FROM hicrm_support_requests ORDER BY id DESC LIMIT 1');$request=$db->fetch_object(true);$id=(int)$request->id;
ticketCheck((int)$request->user_id===990002 && $request->department===$dept->depart_name,'Owner and department come from authenticated account');
ticketCheck(ticketCall($api,'submitrequest',array_merge($post,array('action_status'=>'completed')))['status']===400,'Staff cannot self-complete request');
ticketCheck(ticketCall($api,'submitrequest',array_merge($post,array('csrf_token'=>'invalid')))['status']===419,'Submission requires valid CSRF');
ticketCheck(ticketCall($api,'requestdetail',array(),array('id'=>$id))['status']===200,'Sender can see request detail');
$_SESSION['user']=array('id'=>990003);
ticketCheck(ticketCall($api,'requestdetail',array(),array('id'=>$id))['status']===404,'Other department cannot read request');
ticketCheck(ticketCall($api,'supportrequestaction',array('id'=>$id,'action'=>'completed','resolution_note'=>'x','csrf_token'=>'admin-fixture'))['status']===403,'Normal account cannot process requests');
$_SESSION['user']=array('id'=>990001);$actor=SupportRequests::actor($db);
$action=array('id'=>$id,'action'=>'processing','csrf_token'=>'admin-fixture','expected_status'=>'sent');
ticketCheck(ticketCall($api,'supportrequestaction',array_merge($action,array('csrf_token'=>'bad')))['status']===419,'Admin actions require valid CSRF');
ticketCheck(ticketCall($api,'supportrequestaction',$action)['status']===200,'Admin accepts request for processing');
ticketCheck(SupportRequests::act($db,$id,'completed','',$actor)['status']===400,'Completion requires a result');
ticketCheck(SupportRequests::act($db,$id,'rejected','',$actor)['status']===400,'Rejection requires a reason');
ticketCheck(SupportRequests::act($db,$id,'reply','',$actor)['status']===400,'Empty replies are rejected');
ticketCheck(SupportRequests::act($db,$id,'reply','Phản hồi lần 1',$actor,'processing')['status']===200,'Reply preserves current state');
ticketCheck(SupportRequests::act($db,$id,'completed','Đã xử lý xong',$actor,'sent')['status']===409,'Detect stale status from another admin');
ticketCheck(SupportRequests::act($db,$id,'completed','Đã xử lý xong',$actor,'processing')['status']===200,'Complete with processing result');
$_SESSION['user']=array('id'=>990002);
$detail=ticketCall($api,'requestdetail',array(),array('id'=>$id));
ticketCheck($detail['request']['status']==='completed' && $detail['request']['resolution_note']==='Đã xử lý xong','Completed state and result synchronized to frontend API');
ticketCheck(count($detail['history'])===3 && $detail['history'][1]['content']==='Phản hồi lần 1','History retains replies and status changes');
$listing=ticketCall($api,'workspacerequests',array(),array('status'=>'completed'));
ticketCheck(count($listing['requests'])===1 && (int)$listing['stats']['total_completed']===1,'Completed filter and frontend counts agree');
$admin=new SupportFixtureAdmin();$_GET=array('status'=>'completed');$admin->supportrequests(array('supportrequests'));
ticketCheck($admin->view->template==='support-requests' && (int)$admin->view->data['support_total']===1,'Admin controller binds filtered list and pagination');
$admin->supportrequests(array('supportrequests','detail',$id));
ticketCheck($admin->view->template==='support-request-detail' && count($admin->view->data['support_history'])===3,'Admin detail binds current state and history');
$page=(new ReflectionClass('pageController'))->newInstanceWithoutConstructor(); $view=new SupportFixtureView(); $property=new ReflectionProperty('baseController','view');$property->setValue($page,$view);
$_GET=array('status'=>'completed');$page->workspace(array());
ticketCheck($view->template==='khonggian_lamviec_so' && count($view->data['requests'])===1 && (int)$view->data['stats']->total_completed===1,'Frontend page uses same completed state and counts as admin');
ticketCheck(SupportRequests::act($db,$id,'rejected','Sai yêu cầu',$actor)['status']===409,'Cannot change final outcome without reopening');
ticketCheck(SupportRequests::act($db,$id,'processing','Kiểm tra lại',$actor)['status']===200,'Reopen completed request');
ticketCheck(SupportRequests::act($db,$id,'rejected','Không thuộc phạm vi hỗ trợ',$actor)['status']===200,'Reject with explanation');
$rejected=ticketCall($api,'workspacerequests',array(),array('status'=>'rejected'));
ticketCheck(count($rejected['requests'])===1 && (int)$rejected['stats']['total_rejected']===1,'Rejected state synchronized to frontend filter and counts');
ticketCheck(SupportRequests::act($db,$id,'reply','Hướng dẫn bổ sung',$actor)['status']===200,'Can append reply after rejection');
ticketCheck(SupportRequests::act($db,$id,'delete','',$actor)['status']===200,'Soft delete request');
ticketCheck(ticketCall($api,'requestdetail',array(),array('id'=>$id))['status']===404,'Deleted request hidden from frontend detail');
ticketCheck(count(ticketCall($api,'workspacerequests')['requests'])===0,'Deleted request removed from frontend rows and counts');
ticketCheck(SupportRequests::act($db,$id,'processing','',$actor)['status']===404,'Deleted request cannot be processed');
$trash=new AdminTrash($db,array('support_requests'));
$trash->act('restore','hicrm_support_requests',$id);
$restored=ticketCall($api,'requestdetail',array(),array('id'=>$id));
ticketCheck($restored['status']===200 && $restored['request']['status']==='rejected','Trash restores previous rejected status and frontend visibility');
ticketCheck(SupportRequests::act($db,$id,'delete','',$actor)['status']===200,'Restored request can be soft-deleted again');
$draft=ticketCall($api,'submitrequest',array_merge($post,array('action_status'=>'draft')));ticketCheck($draft['status']===200,'Staff can save own draft');
$db->query("SELECT id FROM hicrm_support_requests WHERE status='draft' LIMIT 1");$draftId=(int)$db->fetch_object(true)->id;
ticketCheck(SupportRequests::act($db,$draftId,'processing','',$actor)['status']===404,'Unsent draft cannot be processed by admin');
$_SESSION['user']=array('id'=>990001);
ticketCheck(ticketCall($api,'requestdetail',array(),array('id'=>$draftId))['status']===404,'Coworkers cannot see private drafts');
ticketCheck(SupportRequests::attachmentUrl('uploads/files/request_fixture.pdf')!=='' && SupportRequests::attachmentUrl('uploads/files/test.php')==='' && SupportRequests::attachmentUrl('https://example.com/x.pdf')==='','Only supported local attachments are linked');
$db->query("INSERT INTO hicrm_support_requests(request_code,user_id,user_name,title,status,resolution_note) VALUES ('LEGACY-FIXTURE',990002,'Fixture Staff','Legacy fixture','processing','Kết quả xử lý cũ')");
$legacyId=(int)$db->insert_id();
ticketCheck(SupportRequests::act($db,$legacyId,'reply','Phản hồi bổ sung',$actor)['status']===200,'Append reply to an existing legacy request');
$legacyHistory=SupportRequests::history($db,$legacyId);
ticketCheck(count($legacyHistory)===2 && $legacyHistory[0]->content==='Kết quả xử lý cũ','Preserve previous processing note in history before first update');
unset($_SESSION['user']);
ticketCheck(ticketCall($api,'submitrequest',$post)['status']===401 && ticketCall($api,'workspacerequests')['status']===401,'Guests cannot submit or read requests');
$page->workspace(array());ticketCheck(!isset($_SESSION['user']),'Workspace never creates a fake login session');
foreach(array('hicrm_support_requests','hicrm_support_request_history','hicrm_users') as $table) $db->query("DROP TEMPORARY TABLE $table");
fwrite(STDOUT,"Temporary fixtures removed; live requests and users unchanged.\n");
