CREATE TABLE IF NOT EXISTS hicrm_files (
  id int(11) NOT NULL AUTO_INCREMENT,
  file_name varchar(255) NOT NULL,
  file_path varchar(255) NOT NULL,
  original_name varchar(255) NOT NULL,
  file_size bigint unsigned NOT NULL DEFAULT 0,
  created_at datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  status int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (id),
  KEY idx_status_id (status, id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
