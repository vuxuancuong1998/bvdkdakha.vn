-- Preserve slider visibility separately from its soft-delete state.
SET @trash_slider_sql = IF(
  EXISTS(SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'hicrm_sliders' AND COLUMN_NAME = 'status'),
  'SELECT 1',
  'ALTER TABLE hicrm_sliders ADD COLUMN status TINYINT NOT NULL DEFAULT 1'
);
PREPARE trash_slider_stmt FROM @trash_slider_sql;
EXECUTE trash_slider_stmt;
DEALLOCATE PREPARE trash_slider_stmt;
