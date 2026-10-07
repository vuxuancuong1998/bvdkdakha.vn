<?php

/**
 * Zalo OA OAuth v4 and Group Messaging integration.
 *
 * Configuration keys in hicrm_configs:
 * zalo_oa_enabled, zalo_oa_app_id, zalo_oa_secret_key,
 * zalo_oa_group_id, zalo_oa_access_token, zalo_oa_refresh_token,
 * zalo_oa_access_token_expires_at (Unix timestamp, updated automatically).
 *
 * Usage: $result = zalo_oa_send_group_message('Noi dung thong bao');
 */
class ZaloOA
{
    private static $instance;
    private $db;
    private $config = array();

    private function __construct()
    {
        global $db;
        $this->db = $db;
        $this->ensureConfigKeys();
        $this->reloadConfig();
    }

    public static function getInstance()
    {
        if(!self::$instance){
            self::$instance = new self();
        }
        return self::$instance;
    }

    public function sendGroupText($text)
    {
        $this->reloadConfig();
        if($this->getConfig('zalo_oa_enabled') !== '1'){
            return array('success' => false, 'message' => 'Chuc nang Zalo OA dang tat.');
        }

        $missing = array();
        foreach(array('zalo_oa_app_id', 'zalo_oa_secret_key', 'zalo_oa_group_id') as $key){
            if($this->getConfig($key) === ''){ $missing[] = $key; }
        }
        if(!empty($missing)){
            return array('success' => false, 'message' => 'Thieu cau hinh: '.implode(', ', $missing).'.');
        }
        if(trim((string)$text) === ''){
            return array('success' => false, 'message' => 'Noi dung Zalo OA dang rong.');
        }

        $tokens = $this->getUsableTokens(false);
        if(empty($tokens['access_token'])){
            return array('success' => false, 'message' => isset($tokens['message']) ? $tokens['message'] : 'Khong co Zalo OA access token.');
        }

        $response = $this->callGroupMessageApi($text, $tokens['access_token']);
        if($this->isSuccessResponse($response)){
            return array('success' => true, 'data' => $response['json']);
        }

        if($this->isTokenError($response)){
            $tokens = $this->getUsableTokens(true);
            if(!empty($tokens['access_token'])){
                $response = $this->callGroupMessageApi($text, $tokens['access_token']);
                if($this->isSuccessResponse($response)){
                    return array('success' => true, 'data' => $response['json']);
                }
            }
        }

        return array('success' => false, 'message' => $this->safeErrorMessage($response));
    }

    private function callGroupMessageApi($text, $accessToken)
    {
        return $this->postJson(
            'https://openapi.zalo.me/v3.0/oa/group/message',
            array(
                'recipient' => array('group_id' => $this->getConfig('zalo_oa_group_id')),
                'message' => array('text' => (string)$text)
            ),
            array('access_token: '.$accessToken)
        );
    }

    private function ensureConfigKeys()
    {
        $defaults = array(
            'zalo_oa_enabled' => '0',
            'zalo_oa_app_id' => '',
            'zalo_oa_secret_key' => '',
            'zalo_oa_group_id' => '',
            'zalo_oa_access_token' => '',
            'zalo_oa_refresh_token' => '',
            'zalo_oa_access_token_expires_at' => ''
        );
        foreach($defaults as $key => $value){
            $safeKey = $this->db->escapestring($key);
            $safeValue = $this->db->escapestring($value);
            $this->db->query("INSERT INTO hicrm_configs (config_key, config_value)
                SELECT '".$safeKey."', '".$safeValue."'
                WHERE NOT EXISTS (SELECT 1 FROM hicrm_configs WHERE config_key = '".$safeKey."')");
        }
    }

    private function reloadConfig()
    {
        $keys = array(
            'zalo_oa_enabled', 'zalo_oa_app_id', 'zalo_oa_secret_key',
            'zalo_oa_group_id', 'zalo_oa_access_token', 'zalo_oa_refresh_token',
            'zalo_oa_access_token_expires_at'
        );
        $quoted = array();
        foreach($keys as $key){ $quoted[] = "'".$this->db->escapestring($key)."'"; }

        $this->config = array();
        $this->db->query("SELECT config_key, config_value FROM hicrm_configs WHERE config_key IN (".implode(',', $quoted).")");
        $rows = $this->db->fetch_object();
        if(is_array($rows)){
            foreach($rows as $row){
                $this->config[(string)$row->config_key] = trim((string)$row->config_value);
            }
        }
    }

    private function getConfig($key)
    {
        return isset($this->config[$key]) ? trim((string)$this->config[$key]) : '';
    }

    private function setConfig($key, $value)
    {
        $safeKey = $this->db->escapestring($key);
        $safeValue = $this->db->escapestring((string)$value);
        $this->db->query("UPDATE hicrm_configs SET config_value = '".$safeValue."' WHERE config_key = '".$safeKey."'");
        $this->config[$key] = (string)$value;
    }

    private function getUsableTokens($forceRefresh)
    {
        $accessToken = $this->getConfig('zalo_oa_access_token');
        $refreshToken = $this->getConfig('zalo_oa_refresh_token');
        $expiresAt = intval($this->getConfig('zalo_oa_access_token_expires_at'));
        $needsRefresh = $forceRefresh || $accessToken === '' || ($expiresAt > 0 && $expiresAt <= (time() + 300));

        if(!$needsRefresh){
            return array('access_token' => $accessToken, 'refresh_token' => $refreshToken, 'expires_at' => $expiresAt);
        }
        if($refreshToken === ''){
            return array('message' => 'Chua cau hinh zalo_oa_refresh_token.');
        }

        $lockName = 'zalo_oa_refresh_'.substr(sha1($this->getConfig('zalo_oa_app_id')), 0, 20);
        $this->db->query("SELECT GET_LOCK('".$this->db->escapestring($lockName)."', 10) AS locked");
        $lock = $this->db->fetch_object(true);
        if(!$lock || intval($lock->locked) !== 1){
            return array('message' => 'Khong the khoa tien trinh refresh Zalo OA token.');
        }

        try {
            $refreshTokenBeforeLock = $refreshToken;
            $this->reloadConfig();
            $latestAccess = $this->getConfig('zalo_oa_access_token');
            $latestRefresh = $this->getConfig('zalo_oa_refresh_token');
            $latestExpiry = intval($this->getConfig('zalo_oa_access_token_expires_at'));

            if($latestRefresh !== '' && $latestRefresh !== $refreshTokenBeforeLock && $latestAccess !== ''){
                return array('access_token' => $latestAccess, 'refresh_token' => $latestRefresh, 'expires_at' => $latestExpiry);
            }
            if(!$forceRefresh && $latestAccess !== '' && $latestExpiry > (time() + 300)){
                return array('access_token' => $latestAccess, 'refresh_token' => $latestRefresh, 'expires_at' => $latestExpiry);
            }
            if($latestRefresh === ''){
                return array('message' => 'Chua cau hinh zalo_oa_refresh_token.');
            }

            $refreshed = $this->refreshTokens($latestRefresh);
            if(empty($refreshed['access_token']) || empty($refreshed['refresh_token'])){
                return array('message' => isset($refreshed['message']) ? $refreshed['message'] : 'Zalo khong tra ve token moi.');
            }

            $expiresIn = isset($refreshed['expires_in']) ? max(300, intval($refreshed['expires_in'])) : 90000;
            $newExpiry = time() + $expiresIn;
            $this->setConfig('zalo_oa_access_token', $refreshed['access_token']);
            $this->setConfig('zalo_oa_refresh_token', $refreshed['refresh_token']);
            $this->setConfig('zalo_oa_access_token_expires_at', (string)$newExpiry);

            return array('access_token' => $refreshed['access_token'], 'refresh_token' => $refreshed['refresh_token'], 'expires_at' => $newExpiry);
        } finally {
            $this->db->query("SELECT RELEASE_LOCK('".$this->db->escapestring($lockName)."')");
        }
    }

    private function refreshTokens($refreshToken)
    {
        $response = $this->postForm(
            'https://oauth.zaloapp.com/v4/oa/access_token',
            array(
                'refresh_token' => $refreshToken,
                'app_id' => $this->getConfig('zalo_oa_app_id'),
                'grant_type' => 'refresh_token'
            ),
            array('secret_key: '.$this->getConfig('zalo_oa_secret_key'))
        );
        if(isset($response['json']['access_token'], $response['json']['refresh_token'])){
            return $response['json'];
        }
        return array('message' => $this->safeErrorMessage($response));
    }

    private function postJson($url, $body, $headers)
    {
        $headers[] = 'Content-Type: application/json';
        return $this->request($url, json_encode($body, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES), $headers);
    }

    private function postForm($url, $body, $headers)
    {
        $headers[] = 'Content-Type: application/x-www-form-urlencoded';
        return $this->request($url, http_build_query($body, '', '&'), $headers);
    }

    private function request($url, $body, $headers)
    {
        if(!function_exists('curl_init')){
            return array('http_code' => 0, 'json' => null, 'curl_error' => 'PHP cURL extension is not enabled.');
        }
        $ch = curl_init($url);
        curl_setopt_array($ch, array(
            CURLOPT_POST => true,
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CONNECTTIMEOUT => 5,
            CURLOPT_TIMEOUT => 12,
            CURLOPT_HTTPHEADER => $headers,
            CURLOPT_POSTFIELDS => $body
        ));
        $raw = curl_exec($ch);
        $curlError = curl_error($ch);
        $httpCode = intval(curl_getinfo($ch, CURLINFO_HTTP_CODE));
        curl_close($ch);
        return array(
            'http_code' => $httpCode,
            'json' => is_string($raw) ? json_decode($raw, true) : null,
            'curl_error' => $curlError
        );
    }

    private function isSuccessResponse($response)
    {
        return isset($response['json']['error']) && intval($response['json']['error']) === 0;
    }

    private function isTokenError($response)
    {
        if(isset($response['http_code']) && intval($response['http_code']) === 401){ return true; }
        $message = isset($response['json']['message']) ? strtolower((string)$response['json']['message']) : '';
        return strpos($message, 'token') !== false || strpos($message, 'access') !== false;
    }

    private function safeErrorMessage($response)
    {
        if(!empty($response['curl_error'])){
            return 'Loi ket noi Zalo OA: '.$response['curl_error'];
        }
        if(isset($response['json']['error']) || isset($response['json']['message'])){
            $error = isset($response['json']['error']) ? (string)$response['json']['error'] : 'unknown';
            $message = isset($response['json']['message']) ? (string)$response['json']['message'] : 'Zalo OA API error';
            return 'Zalo OA API error '.$error.': '.$message;
        }
        return 'Zalo OA khong tra ve phan hoi hop le (HTTP '.intval(isset($response['http_code']) ? $response['http_code'] : 0).').';
    }
}

/** Single public entry point for all Zalo OA integration code. */
function zalo_oa_send_group_message($message)
{
    return ZaloOA::getInstance()->sendGroupText($message);
}

