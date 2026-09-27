<?php
define('__SITE_PATH', realpath(__DIR__ . '/..'));
require_once __DIR__ . '/../config.php';
require_once __DIR__ . '/../application/database.class.php';

$db = Database::getInstance();
// 1. Thử chèn bác sĩ mẫu
$db->query("INSERT INTO hicrm_doctors(department_id, fullname, dob, cccd, cchn, position, avatar, status) 
            VALUES (1, 'BS Test Nguyen Van A', '1985-05-20', '060085000123', '012345/QNG-CCHN', 'Bác sĩ CKI', 'test.jpg', 1)");
$id = $db->insert_id();
echo "Inserted doctor ID: $id\n";

// 2. Đọc lại dữ liệu
$db->query("SELECT d.*, dept.depart_name FROM hicrm_doctors d LEFT JOIN hicrm_departments dept ON d.department_id = dept.id WHERE d.id = '$id'");
$doc = $db->fetch_object(true);
assert($doc !== null && $doc->fullname === 'BS Test Nguyen Van A', 'Doctor fetch failed');
echo "Fetched doctor: " . $doc->fullname . " (" . $doc->depart_name . ")\n";

// 3. Đổi trạng thái (toggle)
$db->query("UPDATE hicrm_doctors SET status = 0 WHERE id = '$id'");
$db->query("SELECT status FROM hicrm_doctors WHERE id = '$id'");
assert($db->fetch_object(true)->status == 0, 'Status toggle failed');
echo "Status toggle OK\n";

// 4. Xóa bản ghi test
$db->query("DELETE FROM hicrm_doctors WHERE id = '$id'");
echo "Cleaned up test doctor. ALL CRUD LOGIC PASS!\n";
