<?php require "header.php"; ?>
<?php
global $db;

// Lấy dữ liệu thống kê bệnh viện thực tế
$stat_doctors = 0;
$stat_events = 0;
$stat_tt25 = 0;
$stat_tt25_pending = 0;
$stat_feedbacks = 0;
$stat_activities = 0;
$stat_pages = 0;
$stat_users = 0;

if($db){
    $r = $db->query("SELECT COUNT(*) AS c FROM hicrm_doctors WHERE doctor_status = 1");
    $stat_doctors = $r ? (int)($db->fetch_object(true)->c ?? 0) : 0;

    $r = $db->query("SELECT COUNT(*) AS c FROM hicrm_events WHERE event_status = 4");
    $stat_events = $r ? (int)($db->fetch_object(true)->c ?? 0) : 0;

    $r = $db->query("SELECT COUNT(*) AS c FROM hicrm_tt25_requests");
    $stat_tt25 = $r ? (int)($db->fetch_object(true)->c ?? 0) : 0;

    $r = $db->query("SELECT COUNT(*) AS c FROM hicrm_tt25_requests WHERE status = 0");
    $stat_tt25_pending = $r ? (int)($db->fetch_object(true)->c ?? 0) : 0;

    $r = $db->query("SELECT COUNT(*) AS c FROM hicrm_customer_feedback");
    $stat_feedbacks = $r ? (int)($db->fetch_object(true)->c ?? 0) : 0;

    $r = $db->query("SELECT COUNT(*) AS c FROM hicrm_activities");
    $stat_activities = $r ? (int)($db->fetch_object(true)->c ?? 0) : 0;

    $r = $db->query("SELECT COUNT(*) AS c FROM hicrm_static_pages WHERE page_status = 1");
    $stat_pages = $r ? (int)($db->fetch_object(true)->c ?? 0) : 0;

    $r = $db->query("SELECT COUNT(*) AS c FROM hicrm_users WHERE user_status = 1");
    $stat_users = $r ? (int)($db->fetch_object(true)->c ?? 0) : 0;
}

$current_admin_name = isset($_SESSION['user']['full_name']) && !empty($_SESSION['user']['full_name']) ? $_SESSION['user']['full_name'] : 'Quản trị viên';
$current_role_name = isset($_SESSION['user']['group_name']) ? $_SESSION['user']['group_name'] : 'Ban quản trị';
?>

<div class="content container-fluid">
    
    <!-- Welcome Header Banner -->
    <div class="card border-0 mb-4" style="background: linear-gradient(135deg, #0284c7 0%, #0369a1 100%); color: #ffffff; border-radius: 16px; box-shadow: 0 10px 25px rgba(2, 132, 199, 0.22);">
        <div class="card-body p-4">
            <div class="row align-items-center">
                <div class="col-lg-8">
                    <div class="d-flex align-items-center gap-3 mb-2">
                        <span class="badge bg-white text-primary px-3 py-1 fw-bold" style="font-size: 11.5px; border-radius: 999px;">
                            <i class="fa-solid fa-hospital me-1"></i> Bệnh viện Đa khoa Khu vực Đăk Hà
                        </span>
                        <span class="text-white-50 small"><i class="fa-regular fa-calendar-check me-1"></i> <?php echo date('d/m/Y'); ?></span>
                    </div>
                    <h2 class="text-white fw-bold mb-1" style="font-size: 24px;">Xin chào, <?php echo htmlspecialchars($current_admin_name); ?>!</h2>
                    <p class="text-white-50 mb-0" style="font-size: 13.5px;">
                        Chào mừng bạn quay trở lại bảng điều khiển quản trị. Theo dõi các chỉ số hoạt động và nội dung cần xử lý trong ngày.
                    </p>
                </div>
                <div class="col-lg-4 text-lg-end mt-3 mt-lg-0">
                    <a href="<?php echo XC_URL; ?>/admin/tt25documents" class="btn btn-light px-3 py-2 fw-semibold text-primary shadow-sm" style="border-radius: 10px;">
                        <i class="fa-solid fa-file-medical me-1"></i> Xử lý hồ sơ TT25
                        <?php if($stat_tt25_pending > 0): ?>
                            <span class="badge bg-danger text-white ms-1 rounded-pill"><?php echo $stat_tt25_pending; ?></span>
                        <?php endif; ?>
                    </a>
                </div>
            </div>
        </div>
    </div>

    <!-- Quick Stats Grid -->
    <div class="dashboard-stats-grid mb-4">
        <!-- Bác sĩ -->
        <a href="<?php echo XC_URL; ?>/admin/doctors" class="modern-stat-card" style="--card-accent: #0284c7; --card-accent-subtle: #f0f9ff;">
            <div class="stat-card-info">
                <div class="stat-card-title">Đội ngũ Bác sĩ</div>
                <div class="stat-card-value"><?php echo number_format($stat_doctors); ?></div>
                <div class="stat-card-subtitle"><i class="fa-solid fa-user-doctor text-primary me-1"></i> Đang hoạt động</div>
            </div>
            <div class="stat-card-icon">
                <i class="fa-solid fa-user-doctor"></i>
            </div>
        </a>

        <!-- Giấy tờ TT25 -->
        <a href="<?php echo XC_URL; ?>/admin/tt25documents" class="modern-stat-card" style="--card-accent: #10b981; --card-accent-subtle: #ecfdf5;">
            <div class="stat-card-info">
                <div class="stat-card-title">Hồ sơ Giấy TT25</div>
                <div class="stat-card-value"><?php echo number_format($stat_tt25); ?></div>
                <div class="stat-card-subtitle">
                    <?php if($stat_tt25_pending > 0): ?>
                        <span class="text-danger fw-bold"><i class="fa-solid fa-clock me-1"></i> <?php echo $stat_tt25_pending; ?> chờ duyệt</span>
                    <?php else: ?>
                        <span class="text-success"><i class="fa-solid fa-circle-check me-1"></i> Đã xử lý xong</span>
                    <?php endif; ?>
                </div>
            </div>
            <div class="stat-card-icon" style="color: #10b981; background: #ecfdf5;">
                <i class="fa-solid fa-file-waveform"></i>
            </div>
        </a>

        <!-- Tin tức & Sự kiện -->
        <a href="<?php echo XC_URL; ?>/admin/events" class="modern-stat-card" style="--card-accent: #f59e0b; --card-accent-subtle: #fffbeb;">
            <div class="stat-card-info">
                <div class="stat-card-title">Tin tức - Sự kiện</div>
                <div class="stat-card-value"><?php echo number_format($stat_events); ?></div>
                <div class="stat-card-subtitle"><i class="fa-solid fa-newspaper text-warning me-1"></i> Đã công khai</div>
            </div>
            <div class="stat-card-icon" style="color: #f59e0b; background: #fffbeb;">
                <i class="fa-solid fa-newspaper"></i>
            </div>
        </a>

        <!-- Phản hồi khách hàng -->
        <a href="<?php echo XC_URL; ?>/admin/customerfeedbacks" class="modern-stat-card" style="--card-accent: #8b5cf6; --card-accent-subtle: #f5f3ff;">
            <div class="stat-card-info">
                <div class="stat-card-title">Ý kiến đóng góp</div>
                <div class="stat-card-value"><?php echo number_format($stat_feedbacks); ?></div>
                <div class="stat-card-subtitle"><i class="fa-solid fa-envelope-open-text text-primary me-1"></i> Phản hồi người dân</div>
            </div>
            <div class="stat-card-icon" style="color: #8b5cf6; background: #f5f3ff;">
                <i class="fa-solid fa-comments"></i>
            </div>
        </a>

        <!-- Lịch công tác & Hoạt động -->
        <a href="<?php echo XC_URL; ?>/admin/activities/schedules" class="modern-stat-card" style="--card-accent: #0ea5e9; --card-accent-subtle: #f0f9ff;">
            <div class="stat-card-info">
                <div class="stat-card-title">Lịch công tác</div>
                <div class="stat-card-value"><?php echo number_format($stat_activities); ?></div>
                <div class="stat-card-subtitle"><i class="fa-solid fa-calendar-days text-info me-1"></i> Kế hoạch & hoạt động</div>
            </div>
            <div class="stat-card-icon" style="color: #0ea5e9; background: #f0f9ff;">
                <i class="fa-solid fa-calendar-check"></i>
            </div>
        </a>

        <!-- Tài khoản hệ thống -->
        <a href="<?php echo XC_URL; ?>/admin/users" class="modern-stat-card" style="--card-accent: #64748b; --card-accent-subtle: #f1f5f9;">
            <div class="stat-card-info">
                <div class="stat-card-title">Tài khoản Quản trị</div>
                <div class="stat-card-value"><?php echo number_format($stat_users); ?></div>
                <div class="stat-card-subtitle"><i class="fa-solid fa-user-shield text-secondary me-1"></i> Phân quyền truy cập</div>
            </div>
            <div class="stat-card-icon" style="color: #64748b; background: #f1f5f9;">
                <i class="fa-solid fa-users-gear"></i>
            </div>
        </a>
    </div>

    <!-- Quick Shortcuts & System Overview -->
    <div class="row g-3">
        <!-- Quick Actions Panel -->
        <div class="col-lg-6">
            <div class="card h-100 mb-0">
                <div class="card-header d-flex align-items-center justify-content-between">
                    <h5 class="card-title fw-bold text-dark mb-0">
                        <i class="fa-solid fa-bolt text-warning me-2"></i>Thao tác nhanh
                    </h5>
                    <span class="text-muted small">Truy cập tiện ích</span>
                </div>
                <div class="card-body">
                    <div class="row g-2">
                        <div class="col-sm-6">
                            <a href="<?php echo XC_URL; ?>/admin/news/add" class="d-flex align-items-center gap-3 p-3 rounded border text-decoration-none bg-light text-dark h-100 transition" style="transition: all .15s ease;">
                                <div class="rounded-circle bg-primary-subtle text-primary d-flex align-items-center justify-content-center" style="width: 40px; height: 40px; flex-shrink: 0;">
                                    <i class="fa-solid fa-pen-nib"></i>
                                </div>
                                <div>
                                    <div class="fw-bold" style="font-size: 13px;">Thêm bài viết mới</div>
                                    <small class="text-muted">Đăng tin tức y tế</small>
                                </div>
                            </a>
                        </div>
                        <div class="col-sm-6">
                            <a href="<?php echo XC_URL; ?>/admin/doctors/add" class="d-flex align-items-center gap-3 p-3 rounded border text-decoration-none bg-light text-dark h-100 transition" style="transition: all .15s ease;">
                                <div class="rounded-circle bg-success-subtle text-success d-flex align-items-center justify-content-center" style="width: 40px; height: 40px; flex-shrink: 0;">
                                    <i class="fa-solid fa-user-plus"></i>
                                </div>
                                <div>
                                    <div class="fw-bold" style="font-size: 13px;">Thêm bác sĩ / cán bộ</div>
                                    <small class="text-muted">Cập nhật danh sách</small>
                                </div>
                            </a>
                        </div>
                        <div class="col-sm-6">
                            <a href="<?php echo XC_URL; ?>/admin/activities/add?type=work_schedule" class="d-flex align-items-center gap-3 p-3 rounded border text-decoration-none bg-light text-dark h-100 transition" style="transition: all .15s ease;">
                                <div class="rounded-circle bg-info-subtle text-info d-flex align-items-center justify-content-center" style="width: 40px; height: 40px; flex-shrink: 0;">
                                    <i class="fa-solid fa-calendar-plus"></i>
                                </div>
                                <div>
                                    <div class="fw-bold" style="font-size: 13px;">Lập lịch công tác</div>
                                    <small class="text-muted">Lịch tuần lãnh đạo</small>
                                </div>
                            </a>
                        </div>
                        <div class="col-sm-6">
                            <a href="<?php echo XC_URL; ?>/admin/sliders/add" class="d-flex align-items-center gap-3 p-3 rounded border text-decoration-none bg-light text-dark h-100 transition" style="transition: all .15s ease;">
                                <div class="rounded-circle bg-warning-subtle text-warning d-flex align-items-center justify-content-center" style="width: 40px; height: 40px; flex-shrink: 0;">
                                    <i class="fa-solid fa-images"></i>
                                </div>
                                <div>
                                    <div class="fw-bold" style="font-size: 13px;">Banner & Slider</div>
                                    <small class="text-muted">Giao diện trang chủ</small>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- System Status & Security -->
        <div class="col-lg-6">
            <div class="card h-100 mb-0">
                <div class="card-header d-flex align-items-center justify-content-between">
                    <h5 class="card-title fw-bold text-dark mb-0">
                        <i class="fa-solid fa-shield-halved text-success me-2"></i>Thông tin Hệ thống & Bảo mật
                    </h5>
                    <span class="badge bg-success-subtle text-success border border-success-subtle">Trực tuyến</span>
                </div>
                <div class="card-body">
                    <ul class="list-group list-group-flush" style="font-size: 13px;">
                        <li class="list-group-item d-flex justify-content-between align-items-center px-0 py-2">
                            <span class="text-muted"><i class="fa-solid fa-server me-2 text-primary"></i>Tên website</span>
                            <span class="fw-semibold text-dark"><?php echo htmlspecialchars($this->helper->get_config('website_name') ?? 'Apache / PHP'); ?></span>
                        </li>
                        
                        <li class="list-group-item d-flex justify-content-between align-items-center px-0 py-2">
                            <span class="text-muted"><i class="fa-solid fa-database me-2 text-primary"></i>Cơ sở dữ liệu</span>
                            <span class="badge bg-light text-dark border">MySQL / MariaDB</span>
                        </li>
                        <li class="list-group-item d-flex justify-content-between align-items-center px-0 py-2">
                            <span class="text-muted"><i class="fa-solid fa-user-lock me-2 text-primary"></i>Phiên đăng nhập</span>
                            <span class="fw-semibold text-success"><i class="fa-solid fa-circle-check me-1"></i>Hợp lệ (<?php echo htmlspecialchars($current_role_name); ?>)</span>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

</div>

<?php require "footer.php"; ?>
