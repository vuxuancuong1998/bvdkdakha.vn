# Kế Hoạch Triển Khai Chức Năng Quản Lý Và Hiển Thị Bác Sĩ

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Xây dựng tính năng quản lý bác sĩ trong trang Admin (danh sách, thêm, sửa, đổi trạng thái, xóa, upload ảnh đại diện vào `uploads/doctors/`) và hiển thị bác sĩ động trên trang chủ website (`index.php`) cùng trang danh sách chi tiết (`/bac-si`).

**Architecture:** Sử dụng kiến trúc MVC thuần của dự án (`router.class.php` -> Controller -> Database -> Template View). Cơ chế auto-init tự động khởi tạo bảng `hicrm_doctors` nếu chưa tồn tại khi truy cập module Admin. Khối giao diện frontend kế thừa style hiện tại của website bệnh viện Đắk Hà.

**Tech Stack:** PHP 7/8, MariaDB/MySQL, Bootstrap 5 (Backend Hope UI), HTML5/CSS3 (Frontend Vanilla CSS/Responsive).

## Global Constraints
- Cấu trúc bảng `hicrm_doctors`: `id`, `department_id`, `fullname`, `dob`, `cccd` (NULL), `cchn` (NULL), `position`, `avatar` (NULL), `status` (default 1), `created_at`, `updated_at`.
- Thư mục lưu trữ ảnh đại diện: `./uploads/doctors/`. Tên file mã hóa ngẫu nhiên an toàn.
- Tuân thủ nguyên tắc Ponytail: code ngắn gọn, tái sử dụng các helper có sẵn trong codebase (`$db->escapestring`, `$this->prepareAdminAccess`, `$this->view->admintmp`, `$this->view->show`).

---

### Task 1: Khởi Tạo Bảng Cơ Sở Dữ Liệu `hicrm_doctors` & Đăng Ký Quyền Menu Admin

**Files:**
- Modify: `controller/adminController.php:30-65` (thêm quyền `doctors` vào `getAdminMenuDefinitions()`)
- Modify: `controller/adminController.php:575-630` (thêm `CREATE TABLE IF NOT EXISTS hicrm_doctors` vào `ensureAdminFeatureTables()`)
- Test: `scratch/test_doctor_table.php`

**Interfaces:**
- Consumes: `hicrm_departments` (`id`, `depart_name`)
- Produces: Bảng `hicrm_doctors` trong MySQL và quyền `doctors` trong `hicrm_admin_menu_permissions`

- [ ] **Step 1: Viết test kiểm tra khởi tạo bảng `hicrm_doctors`**

Tạo file `scratch/test_doctor_table.php`:
```php
<?php
define('__SITE_PATH', realpath(__DIR__ . '/..'));
require_once __DIR__ . '/../config.php';
require_once __DIR__ . '/../application/database.class.php';

$db = Database::getInstance();
$db->query("SHOW TABLES LIKE 'hicrm_doctors'");
$exists = $db->num_row() > 0;
echo "Table hicrm_doctors exists: " . ($exists ? "YES" : "NO") . "\n";
if ($exists) {
    $db->query("DESCRIBE hicrm_doctors");
    $columns = $db->fetch_object();
    $colNames = array_map(function($c) { return $c->Field; }, (array)$columns);
    echo "Columns: " . implode(', ', $colNames) . "\n";
    $expected = array('id', 'department_id', 'fullname', 'dob', 'cccd', 'cchn', 'position', 'avatar', 'status');
    $missing = array_diff($expected, $colNames);
    if (empty($missing)) {
        echo "ALL REQUIRED COLUMNS PRESENT!\n";
    } else {
        echo "MISSING COLUMNS: " . implode(', ', $missing) . "\n";
    }
}
```

- [ ] **Step 2: Chạy test để xác nhận ban đầu bảng chưa tồn tại**

Chạy: `d:\xampp\php\php.exe scratch/test_doctor_table.php`
Kỳ vọng: Output ghi `Table hicrm_doctors exists: NO`

- [ ] **Step 3: Cập nhật `adminController.php` để đăng ký quyền và auto-init bảng**

Trong `controller/adminController.php`:
1. Tại `getAdminMenuDefinitions()`: thêm:
```php
array('key' => 'doctors', 'name' => 'Quản lý đội ngũ bác sĩ', 'parent' => '', 'sort' => 52),
```
2. Tại `ensureAdminFeatureTables()`: thêm lệnh tạo bảng `hicrm_doctors`:
```php
$db->query("CREATE TABLE IF NOT EXISTS hicrm_doctors (
    id int(11) unsigned NOT NULL AUTO_INCREMENT,
    department_id int(11) NOT NULL,
    fullname varchar(255) NOT NULL,
    dob date DEFAULT NULL,
    cccd varchar(20) DEFAULT NULL,
    cchn varchar(100) DEFAULT NULL,
    position varchar(255) NOT NULL,
    avatar varchar(255) DEFAULT NULL,
    status tinyint(1) NOT NULL DEFAULT 1,
    created_at datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    KEY idx_department (department_id),
    KEY idx_status (status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci");
```

- [ ] **Step 4: Chạy script kích hoạt và kiểm tra lại test**

Tạo script gọi hàm khởi tạo hoặc trigger qua scratch:
Chạy: `d:\xampp\php\php.exe -r "define('__SITE_PATH', realpath('.')); require_once 'config.php'; require_once 'application/database.class.php'; require_once 'application/controller_base.class.php'; require_once 'controller/adminController.php'; $reg = new stdClass(); $reg->db = Database::getInstance(); $admin = new adminController($reg); $ref = new ReflectionMethod('adminController', 'ensureAdminFeatureTables'); $ref->setAccessible(true); $ref->invoke($admin);"`
Sau đó chạy: `d:\xampp\php\php.exe scratch/test_doctor_table.php`
Kỳ vọng: `ALL REQUIRED COLUMNS PRESENT!`

- [ ] **Step 5: Commit Task 1**

```bash
git add controller/adminController.php scratch/test_doctor_table.php
git commit -m "feat(admin): register doctor permission and auto-create hicrm_doctors table"
```

---

### Task 2: Xây Dựng Logic Xử Lý Controller Admin (`adminController::doctors`)

**Files:**
- Modify: `controller/adminController.php` (thêm phương thức `public function doctors($para = array())`)
- Test: `scratch/test_doctor_crud.php`

**Interfaces:**
- Consumes: `$_POST`, `$_FILES`, `hicrm_departments`
- Produces: Các action `/admin/doctors`, `/admin/doctors/add`, `/admin/doctors/edit/{id}`, `/admin/doctors/toggle/{id}`, `/admin/doctors/delete/{id}`

- [ ] **Step 1: Viết test CRUD Bác sĩ mô phỏng qua database**

Tạo `scratch/test_doctor_crud.php`:
```php
<?php
define('__SITE_PATH', realpath(__DIR__ . '/..'));
require_once __DIR__ . '/../config.php';
require_once __DIR__ . '/../application/database.class.php';

$db = Database::getInstance();
// 1. Thử chèn bác sĩ mẫu
$db->query("INSERT INTO hicrm_doctors(department_id, fullname, dob, cccd, cchn, position, avatar, status) 
            VALUES (1, 'BS Test Nguyen Van A', '1985-05-20', '060085000123', '012345/QNG-CCHN', 'Bác sĩ CKI', 'test.jpg', 1)");
$id = $db->last_insert_id();
echo "Inserted doctor ID: $id\n";

// 2. Đọc lại dữ liệu
$db->query("SELECT d.*, dept.depart_name FROM hicrm_doctors d LEFT JOIN hicrm_departments dept ON d.department_id = dept.id WHERE d.id = '$id'");
$doc = $db->fetch_object(true);
assert($doc !== null && $doc->fullname === 'BS Test Nguyen Van A', 'Doctor fetch failed');
echo "Fetched doctor: " . $doc->fullname . " (" . $doc->depart_name . ")\n";

// 3. Đổi trạng thái (toggle)
$db->query("UPDATE hicrm_doctors SET status = 0 WHERE id = '$id'");
$db->query("SELECT status FROM hicrm_doctors WHERE id = '$id'");
assert($db->fetch_object(true)->status == 0, 'Status toggle failed');
echo "Status toggle OK\n";

// 4. Xóa bản ghi test
$db->query("DELETE FROM hicrm_doctors WHERE id = '$id'");
echo "Cleaned up test doctor. ALL CRUD LOGIC PASS!\n";
```

- [ ] **Step 2: Chạy test CRUD để xác minh logic DB**

Chạy: `d:\xampp\php\php.exe scratch/test_doctor_crud.php`
Kỳ vọng: `Cleaned up test doctor. ALL CRUD LOGIC PASS!`

- [ ] **Step 3: Cài đặt phương thức `public function doctors($para = array())` trong `adminController.php`**

Bao gồm:
- Kiểm tra quyền: `$this->prepareAdminAccess('doctors')`.
- Đảm bảo bảng tồn tại: `$this->ensureAdminFeatureTables()`.
- Xử lý các action POST (`doctor_action = 'save'`):
  - Lấy và escape: `department_id`, `fullname`, `dob`, `cccd`, `cchn`, `position`, `status`.
  - Validate: `fullname`, `department_id`, `position` không được để trống.
  - Xử lý upload `$_FILES['avatar']`: tạo thư mục `uploads/doctors/` nếu chưa có, sinh tên file ngẫu nhiên an toàn `md5(time() . uniqid()) . '.' . $ext`, upload thành công thì lưu tên file vào cột `avatar`. Nếu là chế độ `edit` có ảnh mới thì xóa ảnh cũ.
  - Thực hiện lệnh `INSERT` hoặc `UPDATE`.
  - Flash message: `$this->setAdminFlash('success', '...')` và redirect về danh sách.
- Xử lý GET action:
  - `$method === 'toggle'`: Đổi trạng thái `status = 1 - status` và redirect về `/admin/doctors`.
  - `$method === 'delete'`: Xóa file ảnh trong `uploads/doctors/`, xóa bản ghi trong CSDL và redirect về `/admin/doctors`.
  - `$method === 'add'`: Lấy danh sách `hicrm_departments` và gọi `$this->view->admintmp("doctor-form")`.
  - `$method === 'edit'`: Lấy bản ghi bác sĩ theo `$id`, lấy danh sách `hicrm_departments` và gọi `$this->view->admintmp("doctor-form")`.
  - Mặc định: Lọc theo từ khóa (`keyword`), lọc theo khoa (`department_id`), phân trang (20 bác sĩ / trang), lấy danh sách và gọi `$this->view->admintmp("doctors")`.

- [ ] **Step 4: Chạy linter kiểm tra cú pháp PHP của `adminController.php`**

Chạy: `d:\xampp\php\php.exe -l controller/adminController.php`
Kỳ vọng: `No syntax errors detected in controller/adminController.php`

- [ ] **Step 5: Commit Task 2**

```bash
git add controller/adminController.php scratch/test_doctor_crud.php
git commit -m "feat(admin): implement doctors CRUD and image upload handling in adminController"
```

---

### Task 3: Xây Dựng Giao Diện Quản Trị (Views) & Menu Sidebar Admin

**Files:**
- Create: `template/backend/doctors.php`
- Create: `template/backend/doctor-form.php`
- Modify: `template/backend/header.php:140-155` (thêm menu "Đội ngũ Bác sĩ")

**Interfaces:**
- Consumes: `$doctors`, `$doctor_edit`, `$departments`, `$doctor_flash`, `$doctor_page`, `$doctor_total_pages` từ `$this->view->data`
- Produces: Giao diện quản trị danh sách và form thêm/sửa bác sĩ

- [ ] **Step 1: Tạo tệp `template/backend/doctors.php`**

Nội dung bao gồm:
- Header trang: Tiêu đề "Quản lý đội ngũ Bác sĩ", breadcrumb, nút "+ Thêm bác sĩ mới" trỏ tới `XC_URL/admin/doctors/add`.
- Khối thông báo flash alert nếu có.
- Card bộ lọc: Input tìm kiếm (Tên, CCCD, CCHN) + Dropdown chọn Khoa/Phòng + Nút Tìm kiếm & Nút Đặt lại.
- Bảng danh sách:
  - Cột: STT / ID, Ảnh đại diện (thumbnail tròn nhỏ hoặc avatar mặc định), Họ và tên, Chức vụ, Khoa / Phòng ban, Ngày sinh, CCCD, CCHN, Trạng thái (badge xanh "Đang hoạt động" / xám "Ẩn"), Thao tác.
  - Nút thao tác: Sửa (link tới `edit/{id}`), Đổi trạng thái (link tới `toggle/{id}` kèm icon mắt / bật tắt), Xóa (nút xóa có confirm SweetAlert2 hoặc confirm JS).
- Phân trang pagination (nếu tổng số trang > 1).

- [ ] **Step 2: Tạo tệp `template/backend/doctor-form.php`**

Nội dung bao gồm:
- Tiêu đề: "Thêm bác sĩ mới" hoặc "Cập nhật thông tin bác sĩ".
- Breadcrumb dẫn về Danh sách bác sĩ.
- Form method POST có `enctype="multipart/form-data"`:
  - Input hidden `id` và hidden `doctor_action = 'save'`.
  - Cột trái (col-md-8):
    - Họ và tên (bắt buộc).
    - Chức vụ (bắt buộc, ví dụ: *Bác sĩ CKI*, *Bác sĩ CKII*, *Trưởng khoa*, *Bác sĩ điều trị*...).
    - Khoa / Phòng ban (dropdown select từ `$departments`, bắt buộc).
    - Ngày tháng năm sinh (input date).
    - Số CCCD (input text, tùy chọn).
    - Số Chứng chỉ hành nghề CCHN (input text, tùy chọn).
  - Cột phải (col-md-4):
    - Trạng thái hiển thị (Select: 1 - Hiển thị trên website, 0 - Ẩn).
    - Ảnh đại diện: File input + Box xem trước ảnh (Preview Box) hiển thị ảnh hiện tại hoặc ảnh placeholder.
  - Nút: "Lưu thông tin" & "Quay lại danh sách".

- [ ] **Step 3: Cập nhật Menu Sidebar tại `template/backend/header.php`**

Thêm mục menu "Đội ngũ Bác sĩ" có kiểm tra quyền `$adminCan('doctors')`:
```php
<?php if($adminCan('doctors')): ?>
<li class="nav-item">
    <a class="nav-link <?php echo (isset($active_menu) && $active_menu == 'doctors') ? 'active' : ''; ?>" href="<?php echo XC_URL;?>/admin/doctors">
        <i class="fa-solid fa-user-doctor"></i>
        <span class="item-name">Đội ngũ Bác sĩ</span>
    </a>
</li>
<?php endif; ?>
```

- [ ] **Step 4: Kiểm tra cú pháp PHP các tệp view backend vừa tạo**

Chạy:
`d:\xampp\php\php.exe -l template/backend/doctors.php`
`d:\xampp\php\php.exe -l template/backend/doctor-form.php`
`d:\xampp\php\php.exe -l template/backend/header.php`
Kỳ vọng: `No syntax errors detected` cho cả 3 file.

- [ ] **Step 5: Commit Task 3**

```bash
git add template/backend/doctors.php template/backend/doctor-form.php template/backend/header.php
git commit -m "feat(admin): add doctor list view, add/edit form, and sidebar navigation menu"
```

---

### Task 4: Tích Hợp Hiển Thị Động Bác Sĩ Tiêu Biểu Trên Trang Chủ

**Files:**
- Modify: `controller/indexController.php:160-175` (truy vấn danh sách bác sĩ)
- Modify: `template/frontend/index.php:360-465` (thay thế thẻ tĩnh bằng vòng lặp PHP động)
- Modify: `application/router.class.php:210-230` (thêm routing `/bac-si`, `/doi-ngu-bac-si`)

**Interfaces:**
- Consumes: `hicrm_doctors`, `hicrm_departments`
- Produces: Dữ liệu `$featured_doctors` hiển thị trên trang chủ

- [ ] **Step 1: Viết test truy vấn dữ liệu bác sĩ trang chủ**

Tạo `scratch/test_home_doctors_query.php`:
```php
<?php
define('__SITE_PATH', realpath(__DIR__ . '/..'));
require_once __DIR__ . '/../config.php';
require_once __DIR__ . '/../application/database.class.php';

$db = Database::getInstance();
$db->query("SELECT d.*, dept.depart_name 
            FROM hicrm_doctors d 
            LEFT JOIN hicrm_departments dept ON d.department_id = dept.id 
            WHERE d.status = 1 
            ORDER BY d.id DESC LIMIT 8");
$doctors = $db->fetch_object();
echo "Featured doctors query successful. Count: " . (is_array($doctors) ? count($doctors) : 0) . "\n";
```

- [ ] **Step 2: Chạy test để xác minh cú pháp query**

Chạy: `d:\xampp\php\php.exe scratch/test_home_doctors_query.php`
Kỳ vọng: `Featured doctors query successful.`

- [ ] **Step 3: Cập nhật `controller/indexController.php`**

Trước lệnh `$this->view->show("index");`, thêm truy vấn lấy bác sĩ tiêu biểu:
```php
$db->query("SELECT d.*, dept.depart_name 
            FROM hicrm_doctors d 
            LEFT JOIN hicrm_departments dept ON d.department_id = dept.id 
            WHERE d.status = 1 
            ORDER BY d.id DESC LIMIT 8");
$this->view->data['featured_doctors'] = $db->fetch_object();
```

- [ ] **Step 4: Cập nhật `template/frontend/index.php`**

Tại `<section class="bg-alt" aria-labelledby="doctors-heading">`:
- Thay thế các thẻ tĩnh bằng vòng lặp:
```php
<?php if(!empty($featured_doctors) && is_array($featured_doctors)): ?>
  <div class="doctors-track">
    <?php foreach($featured_doctors as $index => $doc): 
      $avatarUrl = !empty($doc->avatar) && file_exists(__SITE_PATH . '/uploads/doctors/' . $doc->avatar)
          ? XC_URL . '/uploads/doctors/' . htmlspecialchars($doc->avatar, ENT_QUOTES, 'UTF-8')
          : XC_URL . '/template/frontend/assets/images/doctor-01.jpg';
    ?>
    <article class="doctor-card" data-animate data-animate-delay="<?php echo ($index * 100); ?>" itemscope itemtype="https://schema.org/Physician">
      <div class="doctor-img-wrap">
        <img
          src="<?php echo $avatarUrl; ?>"
          alt="<?php echo htmlspecialchars($doc->position . ' ' . $doc->fullname, ENT_QUOTES, 'UTF-8'); ?>"
          class="doctor-img"
          loading="lazy"
          width="280"
          height="373"
          itemprop="image" />
        <div class="doctor-overlay" aria-hidden="true">
          <a href="<?php echo XC_URL; ?>/bac-si?khoa=<?php echo (int)$doc->department_id; ?>" class="doctor-overlay-btn">Xem hồ sơ</a>
        </div>
      </div>
      <div class="doctor-info">
        <span class="doctor-badge"><?php echo htmlspecialchars($doc->position, ENT_QUOTES, 'UTF-8'); ?></span>
        <h3 class="doctor-name" itemprop="name"><?php echo htmlspecialchars($doc->fullname, ENT_QUOTES, 'UTF-8'); ?></h3>
        <p class="doctor-spec" itemprop="medicalSpecialty"><?php echo htmlspecialchars($doc->depart_name ?: 'Chuyên khoa', ENT_QUOTES, 'UTF-8'); ?></p>
      </div>
    </article>
    <?php endforeach; ?>
  </div>
<?php else: ?>
  <!-- Hiển thị mặc định nếu chưa có bác sĩ nào trong CSDL -->
<?php endif; ?>
```
- Sửa nút *"Xem tất cả đội ngũ"* trỏ tới `<?php echo XC_URL; ?>/bac-si`.

- [ ] **Step 5: Thêm định tuyến URL trong `application/router.class.php`**

Thêm các alias URL thân thiện cho trang bác sĩ:
```php
elseif($segment0 == "bac-si" || $segment0 == "bac-si.html" || $segment0 == "doi-ngu-bac-si" || $segment0 == "doi-ngu-bac-si.html")
{
    $this->controller = "page";
    $this->action = "doctors";
    if(isset($parts[1])) {
        $this->args = $packArgs($parts, 1);
    }
}
```

- [ ] **Step 6: Kiểm tra cú pháp PHP**

Chạy:
`d:\xampp\php\php.exe -l controller/indexController.php`
`d:\xampp\php\php.exe -l template/frontend/index.php`
`d:\xampp\php\php.exe -l application/router.class.php`
Kỳ vọng: `No syntax errors detected` cho cả 3 file.

- [ ] **Step 7: Commit Task 4**

```bash
git add controller/indexController.php template/frontend/index.php application/router.class.php scratch/test_home_doctors_query.php
git commit -m "feat(frontend): integrate dynamic doctors on homepage and configure router aliases"
```

---

### Task 5: Xây Dựng Trang Danh Sách Bác Sĩ Chi Tiết (`/bac-si`) & Menu Website

**Files:**
- Modify: `controller/pageController.php` (thêm phương thức `public function doctors($para = array())`)
- Create: `template/frontend/doi-ngu-bac-si.php` (trang giao diện danh sách đầy đủ)
- Modify: `template/frontend/menu.php:85-100` (thêm liên kết Đội ngũ Bác sĩ vào menu)

**Interfaces:**
- Consumes: Request param `khoa` hoặc `department`
- Produces: Trang web danh sách bác sĩ chuẩn y tế, có lọc theo Khoa phòng

- [ ] **Step 1: Bổ sung action `doctors` trong `controller/pageController.php`**

```php
public function doctors($para = array())
{
    global $db;
    
    // Lấy danh sách chuyên khoa đang hoạt động
    $db->query("SELECT * FROM hicrm_departments WHERE depart_status != 99 ORDER BY depart_name ASC");
    $departments = $db->fetch_object();
    
    // Lọc theo khoa nếu có
    $dept_id = isset($_GET['khoa']) ? intval($_GET['khoa']) : (isset($_GET['department']) ? intval($_GET['department']) : 0);
    $whereSql = "WHERE d.status = 1";
    if($dept_id > 0) {
        $whereSql .= " AND d.department_id = '".$dept_id."'";
    }
    
    $keyword = isset($_GET['q']) ? trim($_GET['q']) : '';
    if($keyword !== '') {
        $kw_esc = $db->escapestring($keyword);
        $whereSql .= " AND (d.fullname LIKE '%".$kw_esc."%' OR d.position LIKE '%".$kw_esc."%' OR d.cchn LIKE '%".$kw_esc."%')";
    }
    
    $db->query("SELECT d.*, dept.depart_name 
                FROM hicrm_doctors d 
                LEFT JOIN hicrm_departments dept ON d.department_id = dept.id 
                ".$whereSql." 
                ORDER BY d.id DESC");
    $doctors = $db->fetch_object();
    
    $this->view->data['departments'] = is_array($departments) ? $departments : array();
    $this->view->data['doctors'] = is_array($doctors) ? $doctors : array();
    $this->view->data['selected_dept'] = $dept_id;
    $this->view->data['keyword'] = $keyword;
    $this->view->show("doi-ngu-bac-si");
}
```

- [ ] **Step 2: Tạo tệp `template/frontend/doi-ngu-bac-si.php`**

Nội dung bao gồm:
- Header & Topbar (`require_once 'header.php'; require_once 'menu.php';`).
- Breadcrumb banner chuẩn website: "Trang chủ / Đội ngũ y bác sĩ".
- Thanh lọc chuyên khoa (Filter Pills/Tabs):
  - Nút "Tất cả khoa phòng"
  - Các nút chuyên khoa: Nội khoa, Ngoại khoa, Sản khoa, Cận lâm sàng...
  - Input tìm kiếm nhanh theo tên bác sĩ.
- Lưới thẻ bác sĩ (Cards Grid):
  - Ảnh đại diện bác sĩ (có xử lý fallback nếu chưa có ảnh).
  - Huy hiệu chức vụ (`position`).
  - Họ và tên (`fullname`).
  - Khoa phòng công tác (`depart_name`).
  - Chứng chỉ hành nghề (`cchn`) hiển thị icon khi có dữ liệu.
  - Thông báo thân thiện nếu khoa phòng chưa có bác sĩ nào.
- Footer trang (`require_once 'footer.php';`).

- [ ] **Step 3: Cập nhật liên kết trong `template/frontend/menu.php`**

Trong menu dropdown "Giới thiệu" tại `template/frontend/menu.php`:
Bổ sung liên kết:
```html
<a href="<?php echo XC_URL; ?>/bac-si" role="menuitem">
  <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M16 21v-2a4 4 0 0 0-4-4H6a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M22 21v-2a4 4 0 0 0-3-3.87"/><path d="M16 3.13a4 4 0 0 1 0 7.75"/></svg>
  Đội ngũ Y Bác sĩ
</a>
```

- [ ] **Step 4: Kiểm tra cú pháp PHP**

Chạy:
`d:\xampp\php\php.exe -l controller/pageController.php`
`d:\xampp\php\php.exe -l template/frontend/doi-ngu-bac-si.php`
`d:\xampp\php\php.exe -l template/frontend/menu.php`
Kỳ vọng: `No syntax errors detected`.

- [ ] **Step 5: Commit Task 5**

```bash
git add controller/pageController.php template/frontend/doi-ngu-bac-si.php template/frontend/menu.php
git commit -m "feat(frontend): create full doctors catalog page with department filter and menu integration"
```

---

### Task 6: Kiểm Thử Toàn Diện Luồng Bác Sĩ (End-to-End Verification)

**Files:**
- Create: `scratch/test_e2e_doctor_flow.php`

**Interfaces:**
- Kiểm thử tích hợp toàn bộ chu trình từ CSDL, Controller Admin đến hiển thị Frontend

- [ ] **Step 1: Viết kịch bản test tích hợp toàn diện**

Tạo `scratch/test_e2e_doctor_flow.php`:
- 1. Chèn 2 bác sĩ thử nghiệm vào 2 khoa khác nhau (Nội khoa & Sản khoa).
- 2. Giả lập truy vấn dữ liệu trang chủ (`indexController`): xác nhận dữ liệu trả về đủ các trường `fullname`, `position`, `depart_name`, `avatar`.
- 3. Giả lập truy vấn trang danh sách (`pageController`): kiểm tra lọc theo khoa (lọc khoa 1 trả về đúng 1 bác sĩ).
- 4. Thử nghiệm đổi trạng thái `status = 0`: kiểm tra trang chủ không còn hiển thị bác sĩ đã bị ẩn.
- 5. Dọn dẹp dữ liệu thử nghiệm.

- [ ] **Step 2: Chạy test tích hợp**

Chạy: `d:\xampp\php\php.exe scratch/test_e2e_doctor_flow.php`
Kỳ vọng: `E2E DOCTOR FLOW TEST PASSED 100%!`

- [ ] **Step 3: Commit Task 6 & Hoàn tất**

```bash
git add scratch/test_e2e_doctor_flow.php
git commit -m "test: add end-to-end integration test for doctor management and display"
```
