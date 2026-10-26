<?php
// This script must not be callable through the website.
if(PHP_SAPI !== 'cli'){ http_response_code(404); exit; }
define('__SITE_PATH', dirname(__DIR__));
require_once __SITE_PATH.'/config.php';
require_once __SITE_PATH.'/application/database.class.php';
require_once __SITE_PATH.'/application/zalo_oa.class.php';
$db = Database::getInstance();
try {
    $result = ZaloOA::getInstance()->maintainTokens();
    echo json_encode($result, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES).PHP_EOL;
    exit(!empty($result['success']) ? 0 : 1);
} catch(Throwable $e) {
    // SQL exceptions can contain credentials; do not print the exception.
    fwrite(STDERR, "Zalo OA maintenance failed; check database connectivity/configuration.\n");
    exit(1);
}
