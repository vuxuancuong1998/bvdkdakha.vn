<?php
if (PHP_SAPI !== 'cli') { http_response_code(404); exit; }
session_save_path(sys_get_temp_dir());
require dirname(__DIR__).'/config.php';
require dirname(__DIR__).'/application/database.class.php';
require dirname(__DIR__).'/application/admin_trash.class.php';
require dirname(__DIR__).'/controller/admin-equipment.php';
class EquipmentTestView {
    public $data = array();
    public $template;
    public function admintmp($template) { $this->template = $template; }
}
class EquipmentTestController {
    use AdminEquipmentActions;
    public $view;
    public $flash;
    public $redirect;
    public $allowed = true;
    public function __construct() { $this->view = new EquipmentTestView(); }
    private function prepareAdminAccess($key) { if ($key !== 'equipment') throw new Exception('Wrong permission'); return $this->allowed; }
    private function adminTableExists($table) { return true; }
    private function setAdminFlash($type,$message) { $this->flash = array($type,$message); }
    private function getAdminFlash() { return $this->flash; }
    private function adminRedirect($path) { $this->redirect = $path; }
}
function equipmentCheck($ok, $message) { if (!$ok) throw new Exception($message); echo "PASS: ".$message.PHP_EOL; }
function equipmentRow($id) { global $db; $db->query('SELECT * FROM hicrm_equipment WHERE id='.(int)$id); return $db->fetch_object(true); }
function equipmentRender() {
    $siteEsc = function($value) { return htmlspecialchars((string)$value, ENT_QUOTES, 'UTF-8'); };
    $homeAsset = function($path) { return XC_URL.'/'.$path; };
    ob_start(); require dirname(__DIR__).'/template/frontend/home-equipment.php'; return ob_get_clean();
}
$db=Database::getInstance();
$db->query('START TRANSACTION');
try {
    $_SESSION['admin_csrf_token'] = 'equipment-test-token';
    $_SERVER['REQUEST_METHOD'] = 'GET';
    $controller = new EquipmentTestController();
    $controller->equipment(array('equipment'));
    equipmentCheck($controller->view->template === 'equipment', 'Admin listing renders');
    $rows=$controller->view->data['equipment_rows'];
    equipmentCheck(count($rows) >= 6, 'Sample records are available');
    $id=(int)$rows[0]->id;
    $controller->equipment(array('equipment','edit',$id));
    equipmentCheck($controller->view->template === 'equipment-form', 'Edit form receives existing record');
    $_SERVER['REQUEST_METHOD']='POST';
    $_POST=array('csrf_token'=>'equipment-test-token','name'=>'Thiết bị <script>test</script>', 'manufacturer'=>"Hãng O'Reilly", 'origin'=>'Việt Nam','description'=>'Mô tả thử nghiệm','sort_order'=>0,'is_active'=>1);
    $controller->equipment(array('equipment','save',$id));
    equipmentCheck(equipmentRow($id)->manufacturer === "Hãng O'Reilly", 'Edits persist with SQL escaping');
    $html=equipmentRender();
    equipmentCheck(strpos($html,'Thiết bị &lt;script&gt;test&lt;/script&gt;') !== false && strpos($html,'<script>test</script>') === false, 'Homepage escapes database content');
    equipmentCheck(strpos($html,'Thiết bị &lt;script&gt;test&lt;/script&gt;') < strpos($html,$rows[1]->name), 'Homepage follows configured ordering');
    unset($_POST['is_active']);
    $controller->equipment(array('equipment','save',$id));
    equipmentCheck((int)equipmentRow($id)->status === 0 && strpos(equipmentRender(),'Thiết bị &lt;script&gt;test') === false, 'Hidden equipment is excluded from homepage');
    $_POST['name']='';
    $controller->equipment(array('equipment','save',$id));
    equipmentCheck(equipmentRow($id)->name === 'Thiết bị <script>test</script>' && $controller->flash[0] === 'danger', 'Invalid name leaves stored record unchanged');
    $controller->equipment(array('equipment','delete',$id));
    equipmentCheck((int)equipmentRow($id)->status === 99, 'Delete moves equipment to trash');
    $trash = new AdminTrash($db, array('equipment'));
    $trash->act('restore','hicrm_equipment',$id);
    equipmentCheck((int)equipmentRow($id)->status !== 99, 'Equipment can be restored from trash');
    $denied = new EquipmentTestController(); $denied->allowed=false;
    $denied->equipment(array('equipment'));
    equipmentCheck($denied->view->template === null, 'Permission denial stops equipment actions');
} finally {
    $db->query('ROLLBACK');
}
