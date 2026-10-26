<?php
trait AdminEquipmentActions
{
    public function equipment($para = array())
    {
        if (!$this->prepareAdminAccess('equipment')) return;
        global $db;
        if (!$this->adminTableExists('hicrm_equipment')) {
            $this->renderAdminNotice('Quản lý trang thiết bị', 'Chạy tools/setup-equipment.php để cài đặt dữ liệu trang thiết bị.', 'equipment');
            return;
        }
        $action = (string)($para[1] ?? '');
        $id = (int)($para[2] ?? 0);
        $item = null;
        if ($id > 0) {
            $db->query('SELECT * FROM hicrm_equipment WHERE status <> 99 AND id='.$id.' LIMIT 1');
            $item = $db->fetch_object(true);
        }
        if (in_array($action, array('edit', 'delete'), true) && !$item) {
            http_response_code(404); exit('Không tìm thấy trang thiết bị.');
        }
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            if (!is_string($_POST['csrf_token'] ?? null) || !hash_equals((string)$_SESSION['admin_csrf_token'], $_POST['csrf_token'])) {
                http_response_code(403); exit('Phiên làm việc không hợp lệ.');
            }
            if ($action === 'delete' && $item) {
                $db->query('UPDATE hicrm_equipment SET status=99 WHERE id='.$id);
                $this->setAdminFlash('success', 'Đã chuyển trang thiết bị vào Sọt rác.');
                $this->adminRedirect('/admin/equipment');
                return;
            }
            if ($action !== 'save') { http_response_code(400); exit('Yêu cầu không hợp lệ.'); }
            if ($id > 0 && !$item) { http_response_code(404); exit('Không tìm thấy trang thiết bị.'); }
            $back = '/admin/equipment'.($id ? '/edit/'.$id : '/add');
            $values = array();
            foreach (array('name'=>255, 'manufacturer'=>120, 'origin'=>120, 'description'=>10000) as $field=>$limit) {
                $value = $_POST[$field] ?? '';
                if (!is_string($value) || mb_strlen(trim($value)) > $limit || ($field === 'name' && trim($value) === '')) {
                    $this->setAdminFlash('danger', 'Vui lòng nhập tên và kiểm tra độ dài các trường.');
                    $this->adminRedirect($back); return;
                }
                $values[$field] = trim($value);
            }
            $image = $item ? $item->image_path : '';
            if (isset($_FILES['image']) && (int)$_FILES['image']['error'] !== UPLOAD_ERR_NO_FILE) {
                $file = $_FILES['image'];
                if ((int)$file['error'] !== UPLOAD_ERR_OK || (int)$file['size'] > 5242880 || !is_uploaded_file($file['tmp_name'])) {
                    $this->setAdminFlash('danger', 'Ảnh tải lên không hợp lệ hoặc vượt quá 5 MB.'); $this->adminRedirect($back); return;
                }
                $mime = (new finfo(FILEINFO_MIME_TYPE))->file($file['tmp_name']);
                $types = array('image/jpeg'=>'jpg', 'image/png'=>'png', 'image/webp'=>'webp');
                if (!isset($types[$mime]) || !getimagesize($file['tmp_name'])) {
                    $this->setAdminFlash('danger', 'Chỉ nhận ảnh JPG, PNG hoặc WebP.'); $this->adminRedirect($back); return;
                }
                $folder = dirname(__DIR__).'/uploads/equipment';
                if (!is_dir($folder) && !mkdir($folder, 0755, true)) {
                    $this->setAdminFlash('danger', 'Không tạo được thư mục ảnh.'); $this->adminRedirect($back); return;
                }
                $filename = bin2hex(random_bytes(16)).'.'.$types[$mime];
                if (!move_uploaded_file($file['tmp_name'], $folder.'/'.$filename)) {
                    $this->setAdminFlash('danger', 'Không lưu được ảnh.'); $this->adminRedirect($back); return;
                }
                $image = 'uploads/equipment/'.$filename;
            }
            if ($image === '') {
                $this->setAdminFlash('danger', 'Vui lòng chọn ảnh trang thiết bị.'); $this->adminRedirect($back); return;
            }
            $values['image_path'] = $image;
            $fields = array();
            foreach ($values as $field=>$value) $fields[] = $field."='".$db->escapestring($value)."'";
            $fields[] = 'sort_order='.max(0, min(99999, (int)($_POST['sort_order'] ?? 0)));
            $fields[] = 'status='.(!empty($_POST['is_active']) ? 1 : 0);
            $db->query(($item ? 'UPDATE hicrm_equipment SET ' : 'INSERT INTO hicrm_equipment SET ').implode(',', $fields).($item ? ' WHERE id='.$id : ''));
            $this->setAdminFlash('success', $item ? 'Đã cập nhật trang thiết bị.' : 'Đã thêm trang thiết bị.');
            $this->adminRedirect('/admin/equipment'); return;
        }
        if (in_array($action, array('save','delete'), true)) { http_response_code(405); exit('Vui lòng sử dụng biểu mẫu.'); }
        $this->view->data['active_menu'] = 'equipment';
        $this->view->data['equipment_flash'] = $this->getAdminFlash();
        if ($action === 'add' || $action === 'edit') {
            $this->view->data['equipment_item'] = $item;
            $this->view->admintmp('equipment-form'); return;
        }
        if ($action !== '') { http_response_code(404); exit('Không tìm thấy trang.'); }
        $db->query('SELECT * FROM hicrm_equipment WHERE status <> 99 ORDER BY sort_order ASC,id ASC');
        $this->view->data['equipment_rows'] = $db->fetch_object();
        $this->view->admintmp('equipment');
    }
}
