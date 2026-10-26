-- Existing banners continue to display on both devices. Safe to run again.
SET @slider_device_sql = IF(
  EXISTS(SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'hicrm_sliders' AND COLUMN_NAME = 'device'),
  'SELECT 1',
  'ALTER TABLE hicrm_sliders ADD COLUMN device ENUM(''all'',''pc'',''mobile'') NOT NULL DEFAULT ''all'' AFTER image_path'
);
PREPARE slider_device_stmt FROM @slider_device_sql;
EXECUTE slider_device_stmt;
DEALLOCATE PREPARE slider_device_stmt;
