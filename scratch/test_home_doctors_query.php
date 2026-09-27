<?php
define('__SITE_PATH', realpath(__DIR__ . '/..'));
require_once __DIR__ . '/../config.php';
require_once __DIR__ . '/../application/database.class.php';

$db = Database::getInstance();
$db->query("SELECT d.*, dept.depart_name 
            FROM hicrm_doctors d 
            LEFT JOIN hicrm_departments dept ON d.department_id = dept.id 
            WHERE d.status = 1 
            ORDER BY d.id DESC LIMIT 8");
$doctors = $db->fetch_object();
echo "Featured doctors query successful. Count: " . (is_array($doctors) ? count($doctors) : 0) . "\n";
