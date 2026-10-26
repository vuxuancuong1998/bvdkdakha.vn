<?php
// Run once via PHP CLI; safe to rerun without duplicating or overwriting records.
if (PHP_SAPI !== 'cli') { http_response_code(404); exit; }
session_save_path(sys_get_temp_dir());
require dirname(__DIR__).'/config.php';
require dirname(__DIR__).'/application/database.class.php';
$db = Database::getInstance();
$db->query(file_get_contents(dirname(__DIR__).'/database/migrations/20261024_equipment.sql'));
$samples = json_decode(file_get_contents(dirname(__DIR__).'/database/templates/equipment-samples.json'), true, 512, JSON_THROW_ON_ERROR);
foreach ($samples as $sample) {
    $fields = array();
    foreach ($sample as $field=>$value) $fields[] = $field."='".$db->escapestring((string)$value)."'";
    $db->query('INSERT INTO hicrm_equipment SET '.implode(',', $fields).' ON DUPLICATE KEY UPDATE sample_code=VALUES(sample_code)');
}
$db->query('SELECT COUNT(*) AS total FROM hicrm_equipment WHERE status=1');
echo 'Equipment ready: '.(int)$db->fetch_object(true)->total.' visible records.'.PHP_EOL;
