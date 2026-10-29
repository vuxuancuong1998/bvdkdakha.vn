<?php
require_once dirname(__DIR__).'/application/admin_users.class.php';
trait AdminUserActions
{
    public function userAction()
    {
        global $db;
        if (!$this->requireAdminApiPermission('users')) return;
        AdminUsers::ensureSchema($db);
        $method = (string)($_POST['method'] ?? '');
        $id = (int)($_POST['user_id'] ?? 0);
        $name = trim((string)($_POST['full_name'] ?? ''));
        $cccd = trim((string)($_POST['user_cccd'] ?? ''));
        $phone = trim((string)($_POST['user_phone'] ?? ''));
        $department = (int)($_POST['user_department'] ?? 0);
        $type = (string)($_POST['is_admin'] ?? '');
        $group = (int)($_POST['user_group'] ?? 0);
        $fail = function ($status, $message) { echo json_encode(array('status'=>$status, 'message'=>$message)); };
        if (!in_array($method, array('add', 'edit'), true)) { $fail(400, 'Thao tác không hợp lệ'); return; }
        if ($name === '' || mb_strlen($name) > 255) { $fail(400, 'Vui lòng nhập họ và tên, tối đa 255 ký tự'); return; }
        if (!preg_match('/^[0-9]{12}$/D', $cccd)) { $fail(400, 'Căn cước công dân phải gồm đúng 12 chữ số'); return; }
        if (!preg_match('/^0[0-9]{9,10}$/D', $phone)) { $fail(400, 'Số điện thoại phải gồm 10 hoặc 11 chữ số và bắt đầu bằng 0'); return; }
        if (!in_array($type, array('0', '1'), true)) { $fail(400, 'Vui lòng chọn đối tượng Admin hoặc Người dùng'); return; }
        $target = null;
        if ($method === 'edit') {
            $db->query("SELECT * FROM hicrm_users WHERE id = '$id' AND user_status <> 99 LIMIT 1");
            $target = $db->fetch_object(true);
            if (!$target) { $fail(404, 'Tài khoản không tồn tại'); return; }
            if ((int)$target->user_group === 1 && !$this->currentAdminIsSuperAdmin()) { $fail(403, 'Không thể chỉnh sửa tài khoản Super Admin'); return; }
            if ($id === (int)$_SESSION['user']['id'] && ((int)$type !== (int)$target->is_admin || ($type === '1' && $group !== (int)$target->user_group))) {
                $fail(403, 'Không thể tự thay đổi đối tượng hoặc nhóm quyền của tài khoản đang đăng nhập'); return;
            }
        }
        if ($department <= 0) { $fail(400, 'Vui lòng chọn khoa phòng'); return; }
        $db->query("SELECT id FROM hicrm_departments WHERE id = '$department' AND depart_status <> 99 LIMIT 1");
        if (!$db->num_row()) { $fail(400, 'Khoa phòng không tồn tại hoặc đã bị xóa'); return; }
        if ($type === '1') {
            $db->query("SELECT id FROM hicrm_user_groups WHERE id = '$group' AND group_status <> 99 LIMIT 1");
            if (!$db->num_row() || !$this->adminAccountHasAccess($group)) { $fail(400, 'Vui lòng chọn nhóm có quyền truy cập Admin'); return; }
            if ($group === 1 && !$this->currentAdminIsSuperAdmin()) { $fail(403, 'Chỉ Super Admin mới được gán nhóm Super Admin'); return; }
        } else {
            $db->query("SELECT g.id FROM hicrm_user_groups g WHERE g.group_status <> 99 AND g.id <> 1 AND g.group_name = 'Người dùng' LIMIT 1");
            $normalGroup = $db->fetch_object(true);
            if (!$normalGroup) { $fail(400, 'Chưa cấu hình nhóm Người dùng'); return; }
            $group = (int)$normalGroup->id;
        }
        $excludedId = $target ? $id : 0;
        $db->query("SELECT id FROM hicrm_users WHERE (user_cccd = '$cccd' OR user_username = '$cccd') AND id <> '$excludedId' LIMIT 1");
        if ($db->num_row()) { $fail(400, 'Căn cước công dân đã được sử dụng bởi tài khoản khác'); return; }
        $escapedName = $db->escapestring($name);
        $email = trim((string)($_POST['user_email'] ?? ($target->user_email ?? '')));
        if ($email !== '' && !filter_var($email, FILTER_VALIDATE_EMAIL)) { $fail(400, 'Email không hợp lệ'); return; }
        if ($type === '1' && $group === 1 && $this->adminTwoFactorConfigEnabled() && $email === '') {
            $fail(400, 'Nhóm Super Admin cần email để nhận mã xác thực đăng nhập'); return;
        }
        $escapedEmail = $db->escapestring($email);
        if ($email !== '') {
            $db->query("SELECT id FROM hicrm_users WHERE user_email = '$escapedEmail' AND id <> '$excludedId' LIMIT 1");
            if ($db->num_row()) { $fail(400, 'Email đã được sử dụng bởi tài khoản khác'); return; }
        }
        if ($method === 'add') {
            $password = AdminUsers::password();
            $hash = md5($db->escapestring($password));
            $date = date('Y-m-d');
            $saved = $db->tryQuery("INSERT INTO hicrm_users (user_username, full_name, user_cccd, user_phone, user_department, is_admin, user_group, user_password, user_email, user_avatar_url, user_status, user_created_date)
                VALUES ('$cccd', '$escapedName', '$cccd', '$phone', '$department', '$type', '$group', '$hash', '$escapedEmail', '', 1, '$date')");
        } else {
            // Keep existing login names and passwords; CCCD is an additional login identifier.
            $saved = $db->tryQuery("UPDATE hicrm_users SET full_name = '$escapedName', user_cccd = '$cccd', user_phone = '$phone', user_email = '$escapedEmail', user_department = '$department', is_admin = '$type', user_group = '$group' WHERE id = '$id' AND user_status <> 99 LIMIT 1");
        }
        if (!$saved) { $fail(500, 'Không thể lưu tài khoản. Vui lòng kiểm tra CCCD và thử lại'); return; }
        $result = array('status'=>200, 'message'=>$method === 'add' ? 'Thêm tài khoản thành công' : 'Cập nhật tài khoản thành công', 'url'=>XC_URL.'/admin/users');
        if ($method === 'add') { $result['username'] = $cccd; $result['new_password'] = $password; }
        echo json_encode($result);
    }
}
