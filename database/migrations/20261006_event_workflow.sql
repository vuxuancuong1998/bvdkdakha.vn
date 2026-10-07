ALTER TABLE hicrm_events
  ADD COLUMN IF NOT EXISTS event_rejection_reason TEXT NULL,
  ADD COLUMN IF NOT EXISTS event_attachment VARCHAR(255) NULL,
  ADD COLUMN IF NOT EXISTS event_attachment_name VARCHAR(255) NULL,
  ADD COLUMN IF NOT EXISTS event_submitted_by INT(11) NULL,
  ADD COLUMN IF NOT EXISTS event_submitted_at DATETIME NULL,
  ADD COLUMN IF NOT EXISTS event_reviewed_by INT(11) NULL,
  ADD COLUMN IF NOT EXISTS event_reviewed_at DATETIME NULL,
  ADD COLUMN IF NOT EXISTS event_published_by INT(11) NULL,
  ADD COLUMN IF NOT EXISTS event_published_at DATETIME NULL;

UPDATE hicrm_events SET event_status = 1 WHERE event_status = 0;

INSERT INTO hicrm_admin_menu_permissions
  (permission_key, permission_name, parent_key, sort_order, permission_status)
VALUES
  ('events_approve', 'Phê duyệt tin tức', 'news_section', 50, 1),
  ('events_publish', 'Công khai tin tức', 'news_section', 50, 1)
ON DUPLICATE KEY UPDATE
  permission_name = VALUES(permission_name),
  parent_key = VALUES(parent_key),
  sort_order = VALUES(sort_order),
  permission_status = 1;
