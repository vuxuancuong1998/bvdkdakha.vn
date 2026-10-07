CREATE TABLE IF NOT EXISTS `hicrm_activities` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `activity_type` VARCHAR(30) NOT NULL,
  `title` VARCHAR(255) NOT NULL,
  `slug` VARCHAR(255) NOT NULL,
  `summary` TEXT NULL,
  `content` LONGTEXT NULL,
  `thumbnail` VARCHAR(255) NULL,
  `department_name` VARCHAR(255) NULL,
  `location` VARCHAR(255) NULL,
  `start_at` DATETIME NULL,
  `end_at` DATETIME NULL,
  `contact_info` TEXT NULL,
  `is_featured` TINYINT(1) NOT NULL DEFAULT 0,
  `status` TINYINT NOT NULL DEFAULT 1,
  `created_by` INT NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` INT NULL,
  `updated_at` DATETIME NULL,
  `submitted_by` INT NULL,
  `submitted_at` DATETIME NULL,
  `approved_by` INT NULL,
  `approved_at` DATETIME NULL,
  `published_by` INT NULL,
  `published_at` DATETIME NULL,
  `rejection_reason` TEXT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_activity_slug` (`slug`),
  KEY `idx_activity_type_status` (`activity_type`, `status`),
  KEY `idx_activity_status_published` (`status`, `published_at`),
  KEY `idx_activity_start` (`start_at`),
  KEY `idx_activity_created_by` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `hicrm_activity_schedule_items` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `activity_id` BIGINT UNSIGNED NOT NULL,
  `work_date` DATE NOT NULL,
  `start_time` TIME NULL,
  `end_time` TIME NULL,
  `work_content` TEXT NOT NULL,
  `location` VARCHAR(255) NULL,
  `chairperson` VARCHAR(255) NULL,
  `participants` TEXT NULL,
  `preparation_unit` VARCHAR(255) NULL,
  `note` TEXT NULL,
  `target_group` VARCHAR(30) NULL,
  `sort_order` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_schedule_activity_date` (`activity_id`, `work_date`, `start_time`),
  CONSTRAINT `fk_activity_schedule_activity` FOREIGN KEY (`activity_id`) REFERENCES `hicrm_activities` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `hicrm_activity_attachments` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `activity_id` BIGINT UNSIGNED NOT NULL,
  `file_name` VARCHAR(255) NOT NULL,
  `file_path` VARCHAR(500) NOT NULL,
  `file_type` VARCHAR(100) NULL,
  `file_size` BIGINT NOT NULL DEFAULT 0,
  `uploaded_by` INT NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sort_order` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_attachment_activity` (`activity_id`, `sort_order`),
  CONSTRAINT `fk_activity_attachment_activity` FOREIGN KEY (`activity_id`) REFERENCES `hicrm_activities` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `hicrm_activity_workflow_logs` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `activity_id` BIGINT UNSIGNED NOT NULL,
  `action` VARCHAR(30) NOT NULL,
  `from_status` TINYINT NULL,
  `to_status` TINYINT NULL,
  `note` TEXT NULL,
  `acted_by` INT NOT NULL,
  `acted_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_address` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  KEY `idx_workflow_activity` (`activity_id`, `acted_at`),
  CONSTRAINT `fk_activity_workflow_activity` FOREIGN KEY (`activity_id`) REFERENCES `hicrm_activities` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `hicrm_admin_menu_permissions`
  (`permission_key`, `permission_name`, `parent_key`, `sort_order`, `permission_status`)
VALUES
  ('activities', 'Quản lý hoạt động', NULL, 52, 1),
  ('activities_approve', 'Phê duyệt hoạt động', 'activities', 53, 1),
  ('activities_publish', 'Công khai hoạt động', 'activities', 54, 1)
ON DUPLICATE KEY UPDATE
  `permission_name` = VALUES(`permission_name`),
  `parent_key` = VALUES(`parent_key`),
  `sort_order` = VALUES(`sort_order`),
  `permission_status` = 1;
