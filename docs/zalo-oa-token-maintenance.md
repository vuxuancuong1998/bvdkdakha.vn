# Zalo OA token maintenance

Run every 5 minutes:
```powershell
C:\xampp\php\php.exe C:\xampp\htdocs\bvdkdakha.vn\tools\refresh_zalo_token.php
```

The command only refreshes tokens; it never sends messages. Web access is blocked.
Configure zalo_oa_enabled=1, zalo_oa_app_id, zalo_oa_secret_key and an initial valid zalo_oa_refresh_token in hicrm_configs.
Missing or unknown expiry triggers refresh. The threshold is 10 minutes.
Refresh writes access_token, refresh_token, access_token_expires_at and token_updated_at in one UPDATE, under the existing MySQL advisory lock.
Initial OA authorization and reauthorization after invalid/revoked refresh tokens require the OA administrator.
Inspect configuration without printing secrets with tools/zalo_token_status.php.

Windows scheduler (run under an account that can read application configuration):
```powershell
schtasks /Create /TN "BVDK-ZaloOA-TokenRefresh" /SC MINUTE /MO 5 /TR '"C:\xampp\php\php.exe" "C:\xampp\htdocs\bvdkdakha.vn\tools\refresh_zalo_token.php"'
```
On Linux use */5 * * * * php /path/to/project/tools/refresh_zalo_token.php.
No schema alteration is required: config_value is TEXT. The maintenance service inserts missing configuration keys without overwriting existing values.
