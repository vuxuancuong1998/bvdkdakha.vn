<?php
define('__SITE_PATH', realpath(__DIR__ . '/..'));
require_once __DIR__ . '/../config.php';
require_once __DIR__ . '/../application/database.class.php';

$db = Database::getInstance();
$db->query("SHOW TABLES LIKE 'hicrm_doctors'");
$exists = $db->num_row() > 0;
echo "Table hicrm_doctors exists: " . ($exists ? "YES" : "NO") . "\n";
if ($exists) {
    $db->query("DESCRIBE hicrm_doctors");
    $columns = $db->fetch_object();
    $colNames = array_map(function($c) { return $c->Field; }, (array)$columns);
    echo "Columns: " . implode(', ', $colNames) . "\n";
    $expected = array('id', 'department_id', 'fullname', 'dob', 'cccd', 'cchn', 'position', 'avatar', 'status');
    $missing = array_diff($expected, $colNames);
    if (empty($missing)) {
        echo "ALL REQUIRED COLUMNS PRESENT!\n";
    } else {
        echo "MISSING COLUMNS: " . implode(', ', $missing) . "\n";
    }
}
