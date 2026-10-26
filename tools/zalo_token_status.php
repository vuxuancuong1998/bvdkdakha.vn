<?php
if(PHP_SAPI !== 'cli'){ http_response_code(404); exit; }
require_once dirname(__DIR__).'/config.php';
mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);
try {
    $conn = new mysqli(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME, defined('DB_PORT') ? intval(DB_PORT) : 3306);
    $res = $conn->query("SELECT config_key, config_value FROM hicrm_configs WHERE config_key LIKE 'zalo_oa_%'");
    $out = array('database' => DB_NAME, 'table' => 'hicrm_configs', 'config' => array());
    while($row = $res->fetch_assoc()){
        $key = $row['config_key'];
        $out['config'][$key] = in_array($key, array('zalo_oa_enabled','zalo_oa_access_token_expires_at','zalo_oa_token_updated_at'))
            ? $row['config_value'] : (trim($row['config_value']) === '' ? 'MISSING' : 'CONFIGURED');
    }
    echo json_encode($out, JSON_PRETTY_PRINT).PHP_EOL;
} catch(Throwable $e) { fwrite(STDERR, "Database inspection failed.\n"); exit(1); }
