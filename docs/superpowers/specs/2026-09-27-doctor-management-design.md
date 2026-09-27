# Kế Hoạch Thiết Kế & Triển Khai Chức Năng Quản Lý Và Hiển Thị Bác Sĩ

**Dự án:** Website Bệnh viện Đa khoa Khu vực Đắk Hà (`bvdkdakha.vn`)  
**Ngày lập:** 27/09/2026  
**Trạng thái:** Bản kế hoạch chốt cuối cùng (Final Design Spec)

---

## 1. Mục tiêu và Phạm vi (Scope & Objectives)
* **Quản trị Admin (Backend):** Cung cấp giao diện quản lý danh sách bác sĩ (xem, tìm kiếm, lọc theo khoa), thêm mới, cập nhật thông tin, bật/tắt hiển thị (`status`) và xóa bác sĩ. Hỗ trợ tải lên ảnh đại diện lưu vào thư mục `uploads/doctors/`.
* **Giao diện Người dùng (Frontend):** 
  * Cập nhật khối "Bác sĩ tiêu biểu" trên Trang chủ (`template/frontend/index.php`) lấy dữ liệu động từ CSDL.
  * Xây dựng trang danh sách đầy đủ đội ngũ y bác sĩ (`/page/doctors`) có bộ lọc theo Chuyên khoa/Khoa phòng.
  * Tích hợp điều hướng trên Menu website và Menu quản trị Admin.

---

## 2. Thiết kế Cơ sở Dữ liệu (Database Design)

### 2.1. Cấu trúc bảng `hicrm_doctors`
Tuân thủ cấu trúc trường dữ liệu theo đúng yêu cầu:

```sql
CREATE TABLE IF NOT EXISTS `hicrm_doctors` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `department_id` INT(11) NOT NULL COMMENT 'ID Khoa phòng (liên kết hicrm_departments.id)',
  `fullname` VARCHAR(255) NOT NULL COMMENT 'Họ và tên bác sĩ',
  `dob` DATE DEFAULT NULL COMMENT 'Ngày tháng năm sinh',
  `cccd` VARCHAR(20) DEFAULT NULL COMMENT 'Căn cước công dân (NULL)',
  `cchn` VARCHAR(100) DEFAULT NULL COMMENT 'Chứng chỉ hành nghề (NULL)',
  `position` VARCHAR(255) NOT NULL COMMENT 'Chức vụ / Học hàm học vị',
  `avatar` VARCHAR(255) DEFAULT NULL COMMENT 'Tên file ảnh lưu tại uploads/doctors/',
  `status` TINYINT(1) NOT NULL DEFAULT 1 COMMENT '1: Hoạt động/Hiển thị, 0: Ẩn',
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_department` (`department_id`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
```

### 2.2. Cơ chế tự động khởi tạo (Auto-migration)
Tích hợp hàm tự động kiểm tra và tạo bảng `hicrm_doctors` trong `adminController.php` (tương tự như `ensureAdminFeatureTables()`), đảm bảo hệ thống tự kích hoạt ngay khi truy cập trang quản trị mà không cần thao tác tay vào phpMyAdmin.

---

## 3. Thiết kế Phía Quản Trị (Backend / Admin)

### 3.1. Routing & Xử lý Controller (`controller/adminController.php`)
Bổ sung action `doctors($para = array())`:
* **Danh sách (`/admin/doctors`):**
  * Bảng hiển thị: ID, Ảnh đại diện, Họ tên, Ngày sinh, CCCD, CCHN, Chức vụ, Khoa phòng (`depart_name`), Trạng thái hoạt động, Nút thao tác.
  * Tìm kiếm theo từ khóa (Tên, CCCD, CCHN) và lọc theo Khoa phòng (`hicrm_departments`).
  * Phân trang danh sách nếu số lượng lớn.
* **Thêm mới (`/admin/doctors/add`) & Sửa (`/admin/doctors/edit/{id}`):**
  * Form nhập liệu: Họ tên (bắt buộc), Khoa phòng (dropdown từ `hicrm_departments`, bắt buộc), Chức vụ (bắt buộc), Ngày sinh (date picker), CCCD (text, tùy chọn), CCHN (text, tùy chọn), Ảnh đại diện (file upload).
  * Upload xử lý: Tự động tạo thư mục `./uploads/doctors/` nếu chưa tồn tại; đổi tên file ngẫu nhiên an toàn (`md5(time() . uniqid()) . '.' . $ext`) để chống trùng lặp; dọn dẹp file cũ khi cập nhật ảnh mới.
  * Validation: Kiểm tra các trường bắt buộc, thông báo flash message thành công/lỗi.
* **Bật/Tắt trạng thái (`/admin/doctors/toggle/{id}`):** Chuyển đổi nhanh giữa trạng thái 1 (Hiển thị) và 0 (Ẩn).
* **Xóa (`/admin/doctors/delete/{id}`):** Xóa bản ghi trong CSDL và xóa file ảnh liên quan trong `uploads/doctors/`.

### 3.2. Giao diện Admin (Views)
* `template/backend/doctors.php`: Giao diện danh sách bác sĩ với thiết kế Bootstrap chuẩn của hệ thống, nút "Thêm bác sĩ mới", bộ lọc và bảng dữ liệu.
* `template/backend/doctor-form.php`: Giao diện form thêm/sửa thông tin bác sĩ, có khu vực xem trước ảnh (image preview) khi chọn file.
* `template/backend/header.php`: Bổ sung menu **"Đội ngũ Bác sĩ"** vào thanh điều hướng bên trái (Sidebar).

---

## 4. Thiết kế Phía Người Dùng (Frontend Website)

### 4.1. Khối "Bác sĩ tiêu biểu" trên Trang Chủ
* **Vị trí:** `<section class="bg-alt" aria-labelledby="doctors-heading">` trong `template/frontend/index.php`.
* **Xử lý Controller:** Tại `controller/indexController.php`, thực hiện truy vấn:
  ```php
  $db->query("SELECT doc.*, dep.depart_name 
              FROM hicrm_doctors doc 
              LEFT JOIN hicrm_departments dep ON doc.department_id = dep.id 
              WHERE doc.status = 1 
              ORDER BY doc.id DESC LIMIT 8");
  $this->view->data['featured_doctors'] = $db->fetch_object();
  ```
* **Hiển thị giao diện:**
  * Lặp qua danh sách `$featured_doctors`.
  * Ảnh: Hiển thị file từ `uploads/doctors/{avatar}`, nếu chưa có ảnh sẽ hiển thị avatar y tế mặc định.
  * Huy hiệu: Hiển thị chức vụ (`position`).
  * Tên: Hiển thị họ tên (`fullname`).
  * Chuyên khoa: Hiển thị tên khoa (`depart_name`).
  * Nút "Xem tất cả đội ngũ": Dẫn đến trang `/page/doctors`.

### 4.2. Trang Danh Sách Chi Tiết Đội Ngũ Bác Sĩ (`/page/doctors`)
* **Controller:** Bổ sung phương thức `doctors()` trong `controller/pageController.php`.
* **Giao diện (`template/frontend/doi-ngu-bac-si.php`):**
  * Banner tiêu đề trang: "Đội ngũ Y Bác sĩ — Bệnh viện Đa khoa Khu vực Đắk Hà".
  * Bộ lọc phân loại Khoa/Phòng (Tất cả, Khoa Nội, Khoa Ngoại, Sản khoa, Cận lâm sàng...).
  * Lưới thẻ bác sĩ (Doctor Cards Grid) hiển thị chi tiết: Ảnh đại diện, Chức danh & Họ tên, Khoa phòng, Số Chứng chỉ hành nghề (CCHN).
* **Tích hợp Menu chính:** Bổ sung liên kết đến trang Đội ngũ bác sĩ vào thanh menu trên đầu trang (`template/frontend/menu.php`).

---

## 5. Kế Hoạch Triển Khai (Implementation Steps)

| Bước | Hạng mục công việc | Tệp tin liên quan |
| :--- | :--- | :--- |
| **Bước 1** | Khởi tạo bảng `hicrm_doctors` và logic Auto-init | `controller/adminController.php` |
| **Bước 2** | Xây dựng logic Quản trị Admin (List, Add, Edit, Toggle, Delete, Upload ảnh) | `controller/adminController.php` |
| **Bước 3** | Xây dựng giao diện danh sách và form Admin | `template/backend/doctors.php`, `template/backend/doctor-form.php` |
| **Bước 4** | Tích hợp menu "Đội ngũ Bác sĩ" vào sidebar Admin | `template/backend/header.php` |
| **Bước 5** | Nạp dữ liệu động và render Bác sĩ trên Trang chủ | `controller/indexController.php`, `template/frontend/index.php` |
| **Bước 6** | Xây dựng trang danh sách Bác sĩ chi tiết và gắn Menu | `controller/pageController.php`, `template/frontend/doi-ngu-bac-si.php`, `template/frontend/menu.php` |
| **Bước 7** | Kiểm thử luồng dữ liệu (Thêm bác sĩ có ảnh -> Kiểm tra hiển thị Trang chủ & Trang danh sách -> Bật/Tắt trạng thái) | Kiểm thử trực tiếp trên môi trường XAMPP |
