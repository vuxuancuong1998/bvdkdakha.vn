ALTER TABLE `hicrm_activities`
  ADD COLUMN IF NOT EXISTS `work_week` VARCHAR(100) NULL AFTER `slug`,
  ADD COLUMN IF NOT EXISTS `organization_block` VARCHAR(30) NULL AFTER `work_week`;

CREATE INDEX IF NOT EXISTS `idx_activity_schedule_week`
  ON `hicrm_activities` (`activity_type`, `work_week`, `status`);
