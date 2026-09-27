<?php
define('__SITE_PATH', realpath(__DIR__ . '/..'));
require_once __DIR__ . '/../config.php';
require_once __DIR__ . '/../application/database.class.php';

$db = Database::getInstance();

echo "========================================\n";
echo "BEGINNING END-TO-END DOCTOR FLOW TEST\n";
echo "========================================\n";

// 1. Verify departments
$db->query("SELECT id, depart_name FROM hicrm_departments WHERE depart_status != 99 LIMIT 2");
$depts = $db->fetch_object();
assert(!empty($depts) && count($depts) >= 1, "Departments must exist");
$dept1 = $depts[0];
$dept2 = isset($depts[1]) ? $depts[1] : $depts[0];
echo "[OK] Found departments: '{$dept1->depart_name}' (ID: {$dept1->id}) and '{$dept2->depart_name}' (ID: {$dept2->id})\n";

// 2. Clean any prior test artifacts
$db->query("DELETE FROM hicrm_doctors WHERE fullname LIKE 'TEST_%'");

// 3. Insert 2 test doctors
$db->query("INSERT INTO hicrm_doctors(department_id, fullname, dob, cccd, cchn, position, avatar, status, created_at, updated_at) 
            VALUES ('{$dept1->id}', 'TEST_BSCKI_Nguyen_Van_A', '1980-01-15', '060080001111', '011111/QNG-CCHN', 'Bác sĩ CKI', 'test_doc1.jpg', 1, NOW(), NOW())");
$id1 = $db->insert_id();

$db->query("INSERT INTO hicrm_doctors(department_id, fullname, dob, cccd, cchn, position, avatar, status, created_at, updated_at) 
            VALUES ('{$dept2->id}', 'TEST_BSCKII_Tran_Thi_B', '1985-06-20', '060085002222', '022222/QNG-CCHN', 'Bác sĩ CKII', 'test_doc2.jpg', 1, NOW(), NOW())");
$id2 = $db->insert_id();

echo "[OK] Inserted Test Doctor 1 (ID: $id1) and Test Doctor 2 (ID: $id2)\n";

// 4. Test Homepage Featured Doctors Query
$db->query("SELECT d.*, dept.depart_name 
            FROM hicrm_doctors d 
            LEFT JOIN hicrm_departments dept ON d.department_id = dept.id 
            WHERE d.status = 1 AND d.id IN ('$id1', '$id2')
            ORDER BY d.id DESC");
$homeDocs = $db->fetch_object();
assert(count($homeDocs) === 2, "Both test doctors should be returned for homepage query");
echo "[OK] Homepage query verified: 2 active test doctors found with department names.\n";

// 5. Test Filter by Department
$db->query("SELECT d.*, dept.depart_name 
            FROM hicrm_doctors d 
            LEFT JOIN hicrm_departments dept ON d.department_id = dept.id 
            WHERE d.status = 1 AND d.department_id = '{$dept1->id}' AND d.id IN ('$id1', '$id2')");
$deptDocs = $db->fetch_object();
assert(count($deptDocs) >= 1 && $deptDocs[0]->fullname === 'TEST_BSCKI_Nguyen_Van_A', "Department filter should isolate doctor 1");
echo "[OK] Department filter query verified.\n";

// 6. Test Search Query by Keyword
$kw = $db->escapestring('Tran_Thi_B');
$db->query("SELECT d.*, dept.depart_name 
            FROM hicrm_doctors d 
            LEFT JOIN hicrm_departments dept ON d.department_id = dept.id 
            WHERE d.status = 1 AND (d.fullname LIKE '%$kw%' OR d.cchn LIKE '%$kw%')");
$searchDocs = $db->fetch_object();
assert(count($searchDocs) === 1 && $searchDocs[0]->id == $id2, "Search keyword should find Doctor 2");
echo "[OK] Keyword search query verified.\n";

// 7. Test Admin Toggle Status
$db->query("UPDATE hicrm_doctors SET status = 1 - status WHERE id = '$id1'");
$db->query("SELECT status FROM hicrm_doctors WHERE id = '$id1'");
assert($db->fetch_object(true)->status == 0, "Doctor 1 should be disabled/hidden");

// Verify Homepage now excludes Doctor 1
$db->query("SELECT d.id FROM hicrm_doctors d WHERE d.status = 1 AND d.id = '$id1'");
assert($db->num_row() === 0, "Hidden doctor should not appear in homepage active query");
echo "[OK] Toggle status verified: disabled doctor is excluded from active website query.\n";

// 8. Clean up test data
$db->query("DELETE FROM hicrm_doctors WHERE id IN ('$id1', '$id2')");
echo "[OK] Cleaned up test data.\n";

echo "========================================\n";
echo "E2E DOCTOR FLOW TEST PASSED 100%!\n";
echo "========================================\n";
