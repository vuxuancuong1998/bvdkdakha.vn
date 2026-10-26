CREATE TABLE IF NOT EXISTS hicrm_static_page_code_templates (
  id int(11) NOT NULL AUTO_INCREMENT,
  template_name varchar(255) NOT NULL,
  code longtext NOT NULL,
  sort_order int(11) NOT NULL DEFAULT 0,
  status int(11) NOT NULL DEFAULT 1,
  created_at datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  KEY idx_status_sort (status, sort_order, id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
