<?php require_once "header.php"; ?>

<?php
// Service database dictionary for UI rendering
$all_services = [
    'kham-noi-khoa' => [
        'slug' => 'kham-noi-khoa',
        'title' => 'Khám nội khoa',
        'subtitle' => 'Chẩn đoán & điều trị toàn diện các bệnh lý nội khoa',
        'icon' => '<svg viewBox="0 0 24 24" width="28" height="28" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round"><polyline points="22 12 18 12 15 21 9 3 6 12 2 12"/></svg>',
        'description' => 'Chẩn đoán và điều trị các bệnh lý nội khoa phổ biến như tim mạch, hô hấp, tiêu hóa, nội tiết và thần kinh. Đội ngũ bác sĩ chuyên khoa dày dặn kinh nghiệm.',
        'image' => XC_URL . '/template/frontend/assets/images/banner-01.jpg',
        'offerings' => [
            'Khám và quản lý bệnh lý Tim mạch & Huyết áp (Tăng huyết áp, xơ vữa động mạch, rối loạn nhịp tim...)',
            'Khám & điều trị bệnh Tiêu hóa - Gan mật (Viêm dạ dày, loét tá tràng, trào ngược, viêm gan, đại tràng...)',
            'Khám bệnh Hô hấp & Phổi (Viêm phế quản, hen suyễn, bệnh phổi tắc nghẽn mạn tính COPD...)',
            'Khám Nội tiết - Chuyển hóa (Đái tháo đường, rối loạn tuyến giáp, gút, mỡ máu...)',
            'Khám Nội thần kinh & Cơ xương khớp (Đau đầu, mất ngủ, tai biến mạch máu não, thoái hóa khớp...)'
        ]
    ],
    'ngoai-khoa-phau-thuat' => [
        'slug' => 'ngoai-khoa-phau-thuat',
        'title' => 'Ngoại khoa & Phẫu thuật',
        'subtitle' => 'Phẫu thuật an toàn với công nghệ phòng mổ hiện đại',
        'icon' => '<svg viewBox="0 0 24 24" width="28" height="28" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/></svg>',
        'description' => 'Thực hiện các ca phẫu thuật ngoại khoa với trang thiết bị phòng mổ hiện đại, đội ngũ phẫu thuật viên có kinh nghiệm và hệ thống theo dõi hậu phẫu 24/7.',
        'image' => XC_URL . '/template/frontend/assets/images/banner-02.jpg',
        'offerings' => [
            'Phẫu thuật Ngoại tiêu hóa (Viêm ruột thừa, sỏi mật, thoát vị bẹn, trĩ...)',
            'Ngoại Chấn thương - Chỉnh hình (Phẫu thuật kết hợp xương, xử lý vết thương phần mềm, nắn chỉnh gãy xương...)',
            'Ngoại Thận - Tiết niệu (Sỏi thận, sỏi bàng quang, phì đại tuyến tiền liệt...)',
            'Hệ thống Phòng mổ vô trùng áp lực dương đạt chuẩn kiểm soát nhiễm khuẩn',
            'Chăm sóc và theo dõi hậu phẫu 24/7 với trang thiết bị hồi sức hiện đại'
        ]
    ],
    'san-phu-khoa' => [
        'slug' => 'san-phu-khoa',
        'title' => 'Sản phụ khoa',
        'subtitle' => 'Chăm sóc thai sản trọn gói & sức khỏe phụ nữ',
        'icon' => '<svg viewBox="0 0 24 24" width="28" height="28" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round"><path d="M20.84 4.61a5.5 5.5 0 00-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 00-7.78 7.78l1.06 1.06L12 21.23l8.72-8.72 1.06-1.06a5.5 5.5 0 000-7.78z"/></svg>',
        'description' => 'Chăm sóc thai sản, theo dõi thai kỳ, đỡ đẻ và các dịch vụ phụ khoa. Khu vực sinh đẻ được trang bị đầy đủ đảm bảo an toàn cho mẹ và bé.',
        'image' => XC_URL . '/template/frontend/assets/images/banner-03.jpg',
        'offerings' => [
            'Chăm sóc thai sản trọn gói & Quản lý thai kỳ định kỳ (Siêu âm 4D/5D, sàng lọc dị tật bẩm sinh...)',
            'Dịch vụ Đỡ đẻ thường & Phẫu thuật mổ bắt con an toàn, êm ái',
            'Khám & Điều trị bệnh Phụ khoa (Viêm nhiễm phụ khoa, u xơ tử cung, u nang buồng trứng...)',
            'Sàng lọc sớm Ung thư cổ tử cung & Ung thư vú',
            'Tư vấn sức khỏe sinh sản, Kế hoạch hóa gia đình & Tiền hôn nhân'
        ]
    ],
    'nhi-khoa' => [
        'slug' => 'nhi-khoa',
        'title' => 'Nhi khoa',
        'subtitle' => 'Chăm sóc sức khỏe toàn diện cho bé yêu',
        'icon' => '<svg viewBox="0 0 24 24" width="28" height="28" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="8" r="6"/><path d="M15.477 12.89L17 22l-5-3-5 3 1.523-9.11"/></svg>',
        'description' => 'Khám và điều trị bệnh cho trẻ em từ sơ sinh đến 15 tuổi. Bác sĩ nhi khoa chuyên nghiệp, cơ sở thân thiện và an toàn cho trẻ.',
        'image' => XC_URL . '/template/frontend/assets/images/banner-01.jpg',
        'offerings' => [
            'Khám & điều trị bệnh lý đường Hô hấp nhi (Viêm phế quản, viêm phổi, hen phế quản, viêm tai giữa...)',
            'Điều trị bệnh Tiêu hóa & Dinh dưỡng nhi (Tiêu chảy, rối loạn hấp thu, biếng ăn, suy dinh dưỡng...)',
            'Khám và tư vấn Tiêm chủng vắc-xin cho trẻ em',
            'Theo dõi sự phát triển thể chất và tinh thần theo mốc tăng trưởng của trẻ',
            'Khu vực khám nhi sinh động, thân thiện giúp trẻ giảm cảm giác sợ hãi'
        ]
    ],
    'cap-cuu-247' => [
        'slug' => 'cap-cuu-247',
        'title' => 'Cấp cứu 24/7',
        'subtitle' => 'Tiếp nhận & xử lý khẩn cấp 24 giờ mỗi ngày',
        'icon' => '<svg viewBox="0 0 24 24" width="28" height="28" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round"><polyline points="22 12 18 12 15 21 9 3 6 12 2 12"/></svg>',
        'description' => 'Đội ngũ cấp cứu trực 24/7 với xe cứu thương, máy thở và thiết bị hồi sức hiện đại. Tiếp nhận và xử lý mọi trường hợp khẩn cấp nhanh nhất có thể.',
        'image' => XC_URL . '/template/frontend/assets/images/banner-02.jpg',
        'offerings' => [
            'Đội ngũ y bác sĩ & điều dưỡng trực cấp cứu 24/7 kể cả ngày lễ, Tết',
            'Xe cứu thương chuyên dụng sẵn sàng xuất phát ngay khi nhận cuộc gọi',
            'Hệ thống thiết bị Hồi sức - Cấp cứu hiện đại (Máy thở, máy sốc tim, máy theo dõi Monitor 5 thông số...)',
            'Quy trình Phân loại bệnh nhân cấp cứu (Triage) nhanh chóng, ưu tiên can thiệp sinh mạng ngay lập tức',
            'Phối hợp liên khoa cấp cứu ngoại khoa, nội khoa, chấn thương cấp tốc'
        ]
    ],
    'xet-nghiem-chan-doan' => [
        'slug' => 'xet-nghiem-chan-doan',
        'title' => 'Xét nghiệm & Chẩn đoán',
        'subtitle' => 'Kết quả xét nghiệm & chẩn đoán hình ảnh chính xác, nhanh chóng',
        'icon' => '<svg viewBox="0 0 24 24" width="28" height="28" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round"><rect x="3" y="3" width="18" height="18" rx="3" ry="3"/><line x1="3" y1="12" x2="21" y2="12"/><line x1="12" y1="3" x2="12" y2="21"/></svg>',
        'description' => 'Hệ thống xét nghiệm máu, nước tiểu, vi sinh, siêu âm, X-quang hiện đại. Kết quả nhanh, chính xác, hỗ trợ chẩn đoán bệnh kịp thời.',
        'image' => XC_URL . '/template/frontend/assets/images/banner-03.jpg',
        'offerings' => [
            'Xét nghiệm Huyết học - Sinh hóa - Miễn dịch (Công thức máu, đường huyết, mỡ máu, chức năng gan thận...)',
            'Xét nghiệm Vi sinh - Sàng lọc bệnh truyền nhiễm (Sốt xuất huyết, Cúm, Viêm gan B/C...)',
            'Chẩn đoán hình ảnh: Siêu âm màu 4D, Siêu âm tim - mạch máu, Siêu âm tổng quát',
            'X-quang Kỹ thuật số (CR/DR) liều tia thấp, hình ảnh sắc nét',
            'Quy trình kiểm chuẩn chất lượng xét nghiệm chặt chẽ, trả kết quả nhanh chóng & chính xác'
        ]
    ]
];

// Determine current active service slug from controller variable or URL
$current_slug = isset($service_slug) && !empty($service_slug) ? $service_slug : 'kham-noi-khoa';
if (!isset($all_services[$current_slug])) {
    $current_slug = 'kham-noi-khoa';
}
$service = $all_services[$current_slug];
?>

<main id="main-content" role="main" class="service-detail-page py-4">

  <!-- ============================================================
       HERO & BREADCRUMBS SECTION
       ============================================================ -->
  <section class="service-hero py-4 mb-4" style="background: linear-gradient(135deg, #075985 0%, #0369a1 100%); color: #fff; border-radius: 12px;">
    <div class="container">
      <nav class="service-breadcrumbs mb-2" aria-label="Điều hướng trang">
        <ol class="breadcrumb bg-transparent p-0 m-0" style="font-size: 14px;">
          <li class="breadcrumb-item"><a href="<?php echo XC_URL; ?>" class="text-white-50 text-decoration-none"><i class="fa-solid fa-house me-1"></i> Trang chủ</a></li>
          <li class="breadcrumb-item"><a href="<?php echo XC_URL; ?>/dich-vu-y-te.html" class="text-white-50 text-decoration-none">Dịch vụ Y tế</a></li>
          <li class="breadcrumb-item active text-white" aria-current="page"><?php echo htmlspecialchars($service['title'], ENT_QUOTES, 'UTF-8'); ?></li>
        </ol>
      </nav>
      <div class="d-flex align-items-center gap-3">
        <div class="service-detail-icon-wrap rounded-3 d-flex align-items-center justify-content-center flex-shrink-0" style="width: 58px; height: 58px; background: rgba(255, 255, 255, 0.15); color: #fff;">
          <?php echo $service['icon']; ?>
        </div>
        <div>
          <h1 class="h2 font-weight-extrabold mb-1" style="font-weight: 800;"><?php echo htmlspecialchars($service['title'], ENT_QUOTES, 'UTF-8'); ?></h1>
          <p class="lead mb-0 text-white-50" style="font-size: 15px;"><?php echo htmlspecialchars($service['subtitle'], ENT_QUOTES, 'UTF-8'); ?></p>
        </div>
      </div>
    </div>
  </section>

  <!-- ============================================================
       MAIN CONTENT: Service Detail & Sidebar
       ============================================================ -->
  <div class="container py-3">
    <div class="row g-4">

      <!-- LEFT COLUMN: Main Detail Content -->
      <div class="col-lg-8">
        <div class="bg-white p-4 p-md-5 border rounded-4 shadow-sm">

          <!-- Feature Image -->
          <div class="service-banner-img-wrap mb-4 overflow-hidden rounded-3">
            <img src="<?php echo $service['image']; ?>" 
                 alt="<?php echo htmlspecialchars($service['title'], ENT_QUOTES, 'UTF-8'); ?>"
                 class="img-fluid w-100" 
                 style="max-height: 400px; object-fit: cover;" />
          </div>

          <!-- Description Intro -->
          <h2 class="h4 font-weight-bold text-dark mb-3" style="font-weight: 700;">Giới Thiệu Chuyên Khoa</h2>
          <p class="text-secondary mb-4" style="font-size: 1rem; line-height: 1.7; color: #334155;">
            <?php echo htmlspecialchars($service['description'], ENT_QUOTES, 'UTF-8'); ?>
          </p>

          <!-- List of Offerings / Sub-services -->
          <h3 class="h5 font-weight-bold text-dark mb-3" style="font-weight: 700;">Danh Mục Dịch Vụ Khám & Điều Trị</h3>
          <ul class="list-unstyled mb-4 d-flex flex-column gap-3">
            <?php foreach ($service['offerings'] as $offering): ?>
            <li class="d-flex align-items-start gap-3 p-3 rounded-3" style="background-color: #f8fafc; border-left: 4px solid #0284c7;">
              <i class="fa-solid fa-circle-check text-primary mt-1" style="font-size: 16px; color: #0284c7 !important;"></i>
              <span style="font-size: 15px; color: #1e293b; font-weight: 500; line-height: 1.5;"><?php echo htmlspecialchars($offering, ENT_QUOTES, 'UTF-8'); ?></span>
            </li>
            <?php endforeach; ?>
          </ul>

          <!-- Examination Process (Quy trình 4 bước) -->
          <h3 class="h5 font-weight-bold text-dark mt-4 mb-3" style="font-weight: 700;">Quy Trình Khám Chữa Bệnh Chuẩn Y Khoa</h3>
          <div class="row g-3 mb-4">
            <div class="col-sm-6">
              <div class="p-3 border rounded-3 h-100 bg-white shadow-xs">
                <div class="badge bg-primary text-white mb-2 px-2 py-1" style="font-size: 11px;">Bước 1</div>
                <h4 class="h6 font-weight-bold mb-1" style="font-weight: 700;">Đăng ký & Đo sinh hiệu</h4>
                <p class="small text-muted mb-0" style="font-size: 13px;">Tiếp nhận thông tin bệnh nhân, làm sổ khám và kiểm tra mạch, huyết áp, cân nặng.</p>
              </div>
            </div>
            <div class="col-sm-6">
              <div class="p-3 border rounded-3 h-100 bg-white shadow-xs">
                <div class="badge bg-primary text-white mb-2 px-2 py-1" style="font-size: 11px;">Bước 2</div>
                <h4 class="h6 font-weight-bold mb-1" style="font-weight: 700;">Bác sĩ khám chuyên khoa</h4>
                <p class="small text-muted mb-0" style="font-size: 13px;">Bác sĩ lâm sàng tư vấn, khám trực tiếp và chỉ định xét nghiệm/chẩn đoán hình ảnh cần thiết.</p>
              </div>
            </div>
            <div class="col-sm-6">
              <div class="p-3 border rounded-3 h-100 bg-white shadow-xs">
                <div class="badge bg-primary text-white mb-2 px-2 py-1" style="font-size: 11px;">Bước 3</div>
                <h4 class="h6 font-weight-bold mb-1" style="font-weight: 700;">Thực hiện cận lâm sàng</h4>
                <p class="small text-muted mb-0" style="font-size: 13px;">Bệnh nhân tiến hành xét nghiệm máu/nước tiểu, siêu âm, X-quang theo chỉ định.</p>
              </div>
            </div>
            <div class="col-sm-6">
              <div class="p-3 border rounded-3 h-100 bg-white shadow-xs">
                <div class="badge bg-primary text-white mb-2 px-2 py-1" style="font-size: 11px;">Bước 4</div>
                <h4 class="h6 font-weight-bold mb-1" style="font-weight: 700;">Tư vấn phác đồ & Đơn thuốc</h4>
                <p class="small text-muted mb-0" style="font-size: 13px;">Bác sĩ giải thích kết quả cận lâm sàng, tư vấn phác đồ điều trị, kê đơn thuốc và hẹn tái khám.</p>
              </div>
            </div>
          </div>

          <!-- Bottom Action Button -->
          <div class="p-4 rounded-3 text-center" style="background-color: #f0f9ff; border: 1px dashed #7dd3fc;">
            <h4 class="h6 font-weight-bold text-dark mb-2" style="font-weight: 700;">Bạn cần đặt lịch khám chuyên khoa này?</h4>
            <p class="small text-secondary mb-3">Vui lòng đăng ký trước để được phục vụ ưu tiên và không phải chờ đợi lâu.</p>
            <a href="tel:1900xxxx" class="btn btn-primary px-4 py-2 font-weight-bold rounded-pill shadow-sm" style="font-weight: 600;">
              <i class="fa-solid fa-calendar-check me-2"></i> Đặt Lịch Hẹn Khám
            </a>
          </div>

        </div>
      </div>

      <!-- RIGHT COLUMN: Sidebar -->
      <div class="col-lg-4">
        
        <!-- Widget: Navigation list of other services -->
        <div class="widget mb-4 p-3 border rounded-4 bg-white shadow-sm">
          <h3 class="h6 font-weight-bold pb-2 border-bottom d-flex align-items-center gap-2 mb-3" style="font-weight: 700;">
            <i class="fa-solid fa-briefcase-medical text-primary"></i> Tất Cả Dịch Vụ Y Tế
          </h3>
          <div class="list-group list-group-flush border-0">
            <?php foreach ($all_services as $s_slug => $s_item): 
              $is_curr = ($s_slug === $current_slug);
            ?>
            <a href="<?php echo XC_URL; ?>/dich-vu-y-te/<?php echo $s_slug; ?>.html" 
               class="list-group-item list-group-item-action d-flex align-items-center justify-content-between py-2 px-3 border-0 rounded-3 mb-1 <?php echo $is_curr ? 'bg-primary text-white fw-bold' : 'text-dark'; ?>"
               style="font-size: 14px;">
              <span><?php echo htmlspecialchars($s_item['title'], ENT_QUOTES, 'UTF-8'); ?></span>
              <i class="fa-solid fa-chevron-right" style="font-size: 11px; opacity: <?php echo $is_curr ? '1' : '0.5'; ?>;"></i>
            </a>
            <?php endforeach; ?>
          </div>
        </div>

        <!-- Widget: Fast Consultation Form -->
        <div class="widget mb-4 p-4 border rounded-4 bg-white shadow-sm">
          <h3 class="h6 font-weight-bold pb-2 border-bottom d-flex align-items-center gap-2 mb-3" style="font-weight: 700;">
            <i class="fa-solid fa-user-doctor text-primary"></i> Đăng Ký Tư Vấn Nhanh
          </h3>
          <form onsubmit="event.preventDefault(); alert('Cảm ơn bạn đã đăng ký tư vấn! Nhân viên y tế sẽ liên hệ trong thời gian sớm nhất.');">
            <div class="mb-3">
              <input type="text" class="form-control" placeholder="Họ và tên *" required style="font-size: 13px;">
            </div>
            <div class="mb-3">
              <input type="tel" class="form-control" placeholder="Số điện thoại *" required style="font-size: 13px;">
            </div>
            <div class="mb-3">
              <select class="form-select" style="font-size: 13px;">
                <option value=""><?php echo htmlspecialchars($service['title'], ENT_QUOTES, 'UTF-8'); ?></option>
                <?php foreach ($all_services as $s_slug => $s_item): ?>
                  <option value="<?php echo $s_slug; ?>"><?php echo htmlspecialchars($s_item['title'], ENT_QUOTES, 'UTF-8'); ?></option>
                <?php endforeach; ?>
              </select>
            </div>
            <button type="submit" class="btn btn-primary w-100 font-weight-bold py-2 rounded-3" style="font-weight: 600; font-size: 14px;">
              Gửi Đăng Ký
            </button>
          </form>
        </div>

        <!-- Widget: Emergency Callout -->
        <div class="widget p-4 border rounded-4 text-white shadow-sm" style="background: linear-gradient(135deg, #0284c7 0%, #0369a1 100%);">
          <div class="d-flex align-items-center gap-3 mb-2">
            <i class="fa-solid fa-truck-medical text-warning" style="font-size: 28px;"></i>
            <div>
              <h4 class="h6 font-weight-bold mb-0 text-white" style="font-weight: 700;">Tổng Đài Cấp Cứu 24/7</h4>
              <small class="text-white-50" style="font-size: 12px;">Hỗ trợ phương tiện & xe cấp cứu khẩn cấp</small>
            </div>
          </div>
          <a href="tel:1900xxxx" class="btn btn-warning w-100 font-weight-bold mt-2 text-dark shadow-sm" style="font-weight: 800; font-size: 16px;">
            <i class="fa-solid fa-phone me-1"></i> 1900 xxxx
          </a>
        </div>

      </div>

    </div>
  </div>

</main>

<?php require_once "footer.php"; ?>
