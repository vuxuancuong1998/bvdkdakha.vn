ALTER TABLE `hicrm_medical_campaigns`
  ADD COLUMN IF NOT EXISTS `content` LONGTEXT NULL AFTER `summary`;
