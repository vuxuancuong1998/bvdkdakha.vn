<?php
class AdminUsers
{
    public static function ensureSchema($db)
    {
        $db->query("SHOW COLUMNS FROM hicrm_users LIKE 'user_cccd'");
        if (!$db->num_row()) {
            $db->query("ALTER TABLE hicrm_users ADD COLUMN user_cccd VARCHAR(12) NULL DEFAULT NULL, ADD UNIQUE KEY uniq_users_cccd (user_cccd)");
        }
    }

    public static function password()
    {
        return 'Aa!'.bin2hex(random_bytes(8));
    }
}
