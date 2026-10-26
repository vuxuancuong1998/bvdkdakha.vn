<?php
if (PHP_SAPI !== 'cli') { http_response_code(404); exit; }
session_save_path(sys_get_temp_dir());
require dirname(__DIR__).'/config.php';
require dirname(__DIR__).'/application/database.class.php';
$db = Database::getInstance();
$db->query(file_get_contents(dirname(__DIR__).'/database/migrations/20261024_quick_appointments.sql'));
echo "Quick appointments table ready.".PHP_EOL;
