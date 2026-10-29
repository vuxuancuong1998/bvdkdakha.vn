<?php
if (PHP_SAPI !== 'cli') { http_response_code(404); exit; }
session_save_path(sys_get_temp_dir());
require dirname(__DIR__).'/config.php';
require dirname(__DIR__).'/application/database.class.php';
require dirname(__DIR__).'/application/controller_base.class.php';
require dirname(__DIR__).'/controller/apiController.php';
$db = Database::getInstance();
AdminUsers::ensureSchema($db);
set_error_handler(function($severity,$message,$file,$line){ throw new ErrorException($message,0,$severity,$file,$line); });
function usersCheck($ok,$message){ if(!$ok) throw new RuntimeException($message); fwrite(STDOUT,'PASS: '.$message.PHP_EOL); }
function usersCall($api,$method,$data){ $_POST=$data; ob_start(); try{$api->$method();$output=ob_get_contents();}finally{ob_end_clean();} $result=json_decode($output,true); if(!is_array($result)) throw new RuntimeException('Invalid JSON response'); return $result; }
function usersRow($id){ global $db; $db->query("SELECT * FROM hicrm_users WHERE id = '".(int)$id."'"); return $db->fetch_object(true); }
$db->query("SELECT id FROM hicrm_users WHERE user_group=1 AND is_admin=1 AND user_status=1 LIMIT 1");
$actor=$db->fetch_object(true); if(!$actor) throw new RuntimeException('No local test actor');
$db->query("SELECT id FROM hicrm_departments WHERE depart_status<>99 LIMIT 1");
$department=$db->fetch_object(true); if(!$department) throw new RuntimeException('No department');
$_SESSION['user']=array('id'=>$actor->id); $_SESSION['admin_csrf_token']=bin2hex(random_bytes(16));
$api=(new ReflectionClass('apiController'))->newInstanceWithoutConstructor();
$cccd='099'.str_pad((string)random_int(0,999999999),9,'0',STR_PAD_LEFT);
$data=array('method'=>'add','full_name'=>"Người thử O'Neil",'user_cccd'=>$cccd,'user_phone'=>'0900000000','user_department'=>$department->id,'is_admin'=>'0','csrf_token'=>$_SESSION['admin_csrf_token']);
$db->query('START TRANSACTION');
try {
 $db->query("SET SESSION sql_mode='STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION'");
 $result=usersCall($api,'userAction',$data); usersCheck($result['status']===200,'Create normal user with five required fields: '.($result['message'] ?? ''));
 $db->query("SELECT * FROM hicrm_users WHERE user_cccd='$cccd'"); $saved=$db->fetch_object(true); $id=(int)$saved->id;
 usersCheck($saved->full_name===$data['full_name'] && $saved->user_cccd===$cccd && $saved->user_phone===$data['user_phone'] && (int)$saved->is_admin===0,'Save profile and normal user type');
 usersCheck($saved->user_username===$cccd && $saved->user_password===md5($result['new_password']),'Generated credentials match stored password');
 $login=usersCall($api,'login',array('email'=>$cccd,'password'=>$result['new_password'],'login_context'=>'frontend'));
 usersCheck($login['status']===200 && (int)$_SESSION['user']['id']===$id,'Normal user can log in with CCCD and generated password');
 usersCheck(usersCall($api,'toggleuserstatus',array('id'=>$id,'csrf_token'=>$_SESSION['admin_csrf_token']))['status']===403,'Normal user cannot call admin APIs');
 $_SESSION['user']=array('id'=>$actor->id);
 usersCheck(usersCall($api,'userAction',$data)['status']===400,'Reject duplicate CCCD');
 foreach(array('full_name'=>'','user_cccd'=>'123','user_phone'=>'abc','user_department'=>0,'is_admin'=>'2','method'=>'invalid') as $field=>$value) usersCheck(usersCall($api,'userAction',array_merge($data,array($field=>$value)))['status']===400,'Validate '.$field);
 usersCheck(usersCall($api,'userAction',array_merge($data,array('csrf_token'=>'invalid')))['status']===419,'Reject invalid CSRF');
 $edit=array_merge($data,array('method'=>'edit','user_id'=>$id,'full_name'=>'Tên đã sửa'));
 usersCheck(usersCall($api,'userAction',$edit)['status']===200,'Edit user profile');
 usersCheck(usersRow($id)->user_password===$saved->user_password,'Editing preserves password');
 $admin=array_merge($edit,array('is_admin'=>'1','user_group'=>1,'user_email'=>'regression-'.$cccd.'@example.invalid'));
 usersCheck(usersCall($api,'userAction',$admin)['status']===200 && (int)usersRow($id)->is_admin===1,'Switch type to Admin and assign admin group');
 $action=array('id'=>$id,'csrf_token'=>$_SESSION['admin_csrf_token']);
 usersCheck(usersCall($api,'toggleuserstatus',$action)['new_status']===2,'Lock account');
 usersCheck(usersCall($api,'toggleuserstatus',$action)['new_status']===1,'Unlock account');
 $reset=usersCall($api,'resetpassword',$action); usersCheck($reset['status']===200 && usersRow($id)->user_password===md5($reset['new_password']),'Reset password persists usable generated password');
 usersCheck(usersCall($api,'assignAdminGroup',array('user_id'=>$id,'user_group'=>1,'csrf_token'=>$_SESSION['admin_csrf_token']))['status']===200,'Assign group through permission action');
 usersCheck(usersCall($api,'assignAdminGroup',array('user_id'=>$actor->id,'user_group'=>1,'csrf_token'=>$_SESSION['admin_csrf_token']))['status']===403,'Prevent self group change');
 usersCheck(usersCall($api,'toggleuserstatus',array('id'=>$actor->id,'csrf_token'=>$_SESSION['admin_csrf_token']))['status']===400,'Prevent self lock');
 usersCheck(usersCall($api,'deleteuser',array('id'=>$actor->id,'csrf_token'=>$_SESSION['admin_csrf_token']))['status']===403,'Prevent self delete');
 usersCheck(usersCall($api,'userAction',$edit)['status']===200 && (int)usersRow($id)->is_admin===0,'Switch back to normal user');
 usersCheck(usersCall($api,'assignAdminGroup',array('user_id'=>$id,'user_group'=>1,'csrf_token'=>$_SESSION['admin_csrf_token']))['status']===400,'Prevent assigning admin menus to normal user');
 usersCheck(usersCall($api,'deleteuser',$action)['status']===200 && (int)usersRow($id)->user_status===99,'Soft delete account');
 usersCheck(usersCall($api,'toggleuserstatus',$action)['status']===404,'Cannot unlock deleted account');
 usersCheck(usersCall($api,'resetpassword',$action)['status']===403,'Cannot reset deleted account');
 usersCheck(usersCall($api,'userAction',array_merge($edit,array('user_id'=>2147483647)))['status']===404,'Reject missing edit target');
} finally { $db->query('ROLLBACK'); }
$db->query("SELECT id FROM hicrm_users WHERE user_cccd='$cccd'"); usersCheck($db->num_row()===0,'Rollback leaves no test account');
