CREATE TABLE IF NOT EXISTS `hicrm_sliders` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `image_path` VARCHAR(500) NOT NULL,
  `alt_text` VARCHAR(255) NOT NULL,
  `eyebrow` VARCHAR(120) DEFAULT NULL,
  `title` VARCHAR(255) DEFAULT NULL,
  `description` TEXT DEFAULT NULL,
  `button_label` VARCHAR(100) DEFAULT NULL,
  `button_url` VARCHAR(500) DEFAULT NULL,
  `sort_order` INT NOT NULL DEFAULT 0,
  `is_active` TINYINT(1) NOT NULL DEFAULT 1,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_slider_public` (`is_active`, `sort_order`, `id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `hicrm_sliders` (`image_path`, `alt_text`, `eyebrow`, `title`, `description`, `button_label`, `button_url`, `sort_order`, `is_active`)
SELECT 'uploads/slider/banner_01.png', 'Bệnh viện đa khoa khu vực Đắk Hà — Cơ sở vật chất hiện đại', NULL, NULL, NULL, NULL, NULL, 10, 1
WHERE NOT EXISTS (SELECT 1 FROM `hicrm_sliders` LIMIT 1);

INSERT INTO `hicrm_sliders` (`image_path`, `alt_text`, `eyebrow`, `title`, `description`, `button_label`, `button_url`, `sort_order`, `is_active`)
SELECT 'template/frontend/assets/images/banner-02.jpg', 'Cơ sở hạ tầng và trang thiết bị y tế hiện đại', 'Cơ sở vật chất hiện đại', 'Trang thiết bị y tế tiên tiến hàng đầu', 'Hệ thống máy chẩn đoán hình ảnh, xét nghiệm, phẫu thuật hiện đại — đảm bảo chẩn đoán chính xác và điều trị hiệu quả cho bệnh nhân.', 'Tìm hiểu thêm', 'gioi-thieu.html', 20, 1
WHERE NOT EXISTS (SELECT 1 FROM `hicrm_sliders` WHERE `image_path` = 'template/frontend/assets/images/banner-02.jpg');

INSERT INTO `hicrm_sliders` (`image_path`, `alt_text`, `eyebrow`, `title`, `description`, `button_label`, `button_url`, `sort_order`, `is_active`)
SELECT 'template/frontend/assets/images/banner-03.jpg', 'Đội ngũ y tế phục vụ cộng đồng huyện Đắk Hà', 'Y tế cộng đồng', 'Vì sức khỏe cộng đồng vùng cao Tây Nguyên', 'Chúng tôi đẩy mạnh công tác y tế dự phòng, tuyên truyền phòng chống dịch bệnh và chăm sóc sức khỏe ban đầu cho đồng bào các dân tộc thiểu số.', 'Tin y tế cộng đồng', 'tin-tuc.html', 30, 1
WHERE NOT EXISTS (SELECT 1 FROM `hicrm_sliders` WHERE `image_path` = 'template/frontend/assets/images/banner-03.jpg');
