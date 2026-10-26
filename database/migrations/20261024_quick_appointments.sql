CREATE TABLE IF NOT EXISTS hicrm_quick_appointments (
 id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
 full_name VARCHAR(120) NOT NULL,
 citizen_id CHAR(12) NOT NULL,
 phone VARCHAR(11) NOT NULL,
 exam_date DATE NOT NULL,
 status TINYINT NOT NULL DEFAULT 1,
 created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 active_citizen_id CHAR(12) GENERATED ALWAYS AS (CASE WHEN status=99 THEN NULL ELSE citizen_id END) STORED,
 PRIMARY KEY (id),
 UNIQUE KEY uniq_active_appointment (active_citizen_id,exam_date),
 KEY idx_appointments_date (status,exam_date,id),
 KEY idx_appointments_citizen (citizen_id,exam_date,status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
