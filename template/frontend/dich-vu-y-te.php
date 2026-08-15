<?php require_once "header.php"; ?>

<main id="main-content" role="main" class="services-page py-4">

  <!-- ============================================================
       HERO & BREADCRUMBS SECTION
       ============================================================ -->
  <section class="services-hero py-4 mb-4" style="background: linear-gradient(135deg, #075985 0%, #0369a1 100%); color: #fff; border-radius: 12px;">
    <div class="container">
      <nav class="services-breadcrumbs mb-2" aria-label="Điều hướng trang">
        <ol class="breadcrumb bg-transparent p-0 m-0" style="font-size: 14px;">
          <li class="breadcrumb-item"><a href="<?php echo XC_URL; ?>" class="text-white-50 text-decoration-none"><i class="fa-solid fa-house me-1"></i> Trang chủ</a></li>
          <li class="breadcrumb-item active text-white" aria-current="page">Dịch vụ Y tế</li>
        </ol>
      </nav>
      <div class="row align-items-center">
        <div class="col-lg-8">
          <h1 class="h2 font-weight-extrabold mb-2" style="font-weight: 800;">Dịch Vụ Y Tế Chuyên Khoa</h1>
          <p class="lead mb-0 text-white-50" style="font-size: 15px;">
            Bệnh viện Đa khoa Khu vực Đắk Hà cung cấp đầy đủ các dịch vụ khám, chữa bệnh chất lượng cao với đội ngũ y bác sĩ giàu kinh nghiệm và trang thiết bị hiện đại.
          </p>
        </div>
      </div>
    </div>
  </section>

  <!-- ============================================================
       SERVICES GRID SECTION (Matching exact boxes from user image)
       ============================================================ -->
  <section class="services-grid-section py-4">
    <div class="container">

      <div class="row g-4">

        <!-- Card 1: Khám nội khoa -->
        <div class="col-lg-4 col-md-6">
          <div class="service-box-card h-100 p-4 bg-white border rounded-4 shadow-sm position-relative d-flex flex-column justify-content-between">
            <div>
              <div class="service-icon-wrap rounded-3 d-flex align-items-center justify-content-center mb-3" style="width: 54px; height: 54px; background-color: #e0f2fe; color: #0284c7;">
                <svg viewBox="0 0 24 24" width="26" height="26" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round">
                  <polyline points="22 12 18 12 15 21 9 3 6 12 2 12"/>
                </svg>
              </div>
              <h3 class="service-box-title h5 font-weight-bold text-dark mb-3" style="font-weight: 700; font-size: 1.25rem;">Khám nội khoa</h3>
              <p class="service-box-desc text-secondary mb-4" style="font-size: 0.925rem; line-height: 1.65; color: #475569;">
                Chẩn đoán và điều trị các bệnh lý nội khoa phổ biến như tim mạch, hô hấp, tiêu hóa, nội tiết và thần kinh. Đội ngũ bác sĩ chuyên khoa dày dặn kinh nghiệm.
              </p>
            </div>
            <div>
              <a href="<?php echo XC_URL; ?>/dich-vu-y-te/kham-noi-khoa.html" class="service-detail-link font-weight-bold text-decoration-none d-inline-flex align-items-center gap-1" style="color: #0284c7; font-weight: 600; font-size: 0.925rem;">
                <span>Xem chi tiết</span>
                <i class="fa-solid fa-chevron-right style-icon-arrow" style="font-size: 0.8rem; margin-left: 2px;"></i>
              </a>
            </div>
          </div>
        </div>

        <!-- Card 2: Ngoại khoa & Phẫu thuật -->
        <div class="col-lg-4 col-md-6">
          <div class="service-box-card h-100 p-4 bg-white border rounded-4 shadow-sm position-relative d-flex flex-column justify-content-between">
            <div>
              <div class="service-icon-wrap rounded-3 d-flex align-items-center justify-content-center mb-3" style="width: 54px; height: 54px; background-color: #e0f2fe; color: #0284c7;">
                <svg viewBox="0 0 24 24" width="26" height="26" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round">
                  <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/>
                </svg>
              </div>
              <h3 class="service-box-title h5 font-weight-bold text-dark mb-3" style="font-weight: 700; font-size: 1.25rem;">Ngoại khoa & Phẫu thuật</h3>
              <p class="service-box-desc text-secondary mb-4" style="font-size: 0.925rem; line-height: 1.65; color: #475569;">
                Thực hiện các ca phẫu thuật ngoại khoa với trang thiết bị phòng mổ hiện đại, đội ngũ phẫu thuật viên có kinh nghiệm và hệ thống theo dõi hậu phẫu 24/7.
              </p>
            </div>
            <div>
              <a href="<?php echo XC_URL; ?>/dich-vu-y-te/ngoai-khoa-phau-thuat.html" class="service-detail-link font-weight-bold text-decoration-none d-inline-flex align-items-center gap-1" style="color: #0284c7; font-weight: 600; font-size: 0.925rem;">
                <span>Xem chi tiết</span>
                <i class="fa-solid fa-chevron-right style-icon-arrow" style="font-size: 0.8rem; margin-left: 2px;"></i>
              </a>
            </div>
          </div>
        </div>

        <!-- Card 3: Sản phụ khoa -->
        <div class="col-lg-4 col-md-6">
          <div class="service-box-card h-100 p-4 bg-white border rounded-4 shadow-sm position-relative d-flex flex-column justify-content-between">
            <div>
              <div class="service-icon-wrap rounded-3 d-flex align-items-center justify-content-center mb-3" style="width: 54px; height: 54px; background-color: #e0f2fe; color: #0284c7;">
                <svg viewBox="0 0 24 24" width="26" height="26" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round">
                  <path d="M20.84 4.61a5.5 5.5 0 00-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 00-7.78 7.78l1.06 1.06L12 21.23l8.72-8.72 1.06-1.06a5.5 5.5 0 000-7.78z"/>
                </svg>
              </div>
              <h3 class="service-box-title h5 font-weight-bold text-dark mb-3" style="font-weight: 700; font-size: 1.25rem;">Sản phụ khoa</h3>
              <p class="service-box-desc text-secondary mb-4" style="font-size: 0.925rem; line-height: 1.65; color: #475569;">
                Chăm sóc thai sản, theo dõi thai kỳ, đỡ đẻ và các dịch vụ phụ khoa. Khu vực sinh đẻ được trang bị đầy đủ đảm bảo an toàn cho mẹ và bé.
              </p>
            </div>
            <div>
              <a href="<?php echo XC_URL; ?>/dich-vu-y-te/san-phu-khoa.html" class="service-detail-link font-weight-bold text-decoration-none d-inline-flex align-items-center gap-1" style="color: #0284c7; font-weight: 600; font-size: 0.925rem;">
                <span>Xem chi tiết</span>
                <i class="fa-solid fa-chevron-right style-icon-arrow" style="font-size: 0.8rem; margin-left: 2px;"></i>
              </a>
            </div>
          </div>
        </div>

        <!-- Card 4: Nhi khoa -->
        <div class="col-lg-4 col-md-6">
          <div class="service-box-card h-100 p-4 bg-white border rounded-4 shadow-sm position-relative d-flex flex-column justify-content-between">
            <div>
              <div class="service-icon-wrap rounded-3 d-flex align-items-center justify-content-center mb-3" style="width: 54px; height: 54px; background-color: #e0f2fe; color: #0284c7;">
                <svg viewBox="0 0 24 24" width="26" height="26" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round">
                  <circle cx="12" cy="8" r="6"/>
                  <path d="M15.477 12.89L17 22l-5-3-5 3 1.523-9.11"/>
                </svg>
              </div>
              <h3 class="service-box-title h5 font-weight-bold text-dark mb-3" style="font-weight: 700; font-size: 1.25rem;">Nhi khoa</h3>
              <p class="service-box-desc text-secondary mb-4" style="font-size: 0.925rem; line-height: 1.65; color: #475569;">
                Khám và điều trị bệnh cho trẻ em từ sơ sinh đến 15 tuổi. Bác sĩ nhi khoa chuyên nghiệp, cơ sở thân thiện và an toàn cho trẻ.
              </p>
            </div>
            <div>
              <a href="<?php echo XC_URL; ?>/dich-vu-y-te/nhi-khoa.html" class="service-detail-link font-weight-bold text-decoration-none d-inline-flex align-items-center gap-1" style="color: #0284c7; font-weight: 600; font-size: 0.925rem;">
                <span>Xem chi tiết</span>
                <i class="fa-solid fa-chevron-right style-icon-arrow" style="font-size: 0.8rem; margin-left: 2px;"></i>
              </a>
            </div>
          </div>
        </div>

        <!-- Card 5: Cấp cứu 24/7 -->
        <div class="col-lg-4 col-md-6">
          <div class="service-box-card h-100 p-4 bg-white border rounded-4 shadow-sm position-relative d-flex flex-column justify-content-between">
            <div>
              <div class="service-icon-wrap rounded-3 d-flex align-items-center justify-content-center mb-3" style="width: 54px; height: 54px; background-color: #e0f2fe; color: #0284c7;">
                <svg viewBox="0 0 24 24" width="26" height="26" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round">
                  <polyline points="22 12 18 12 15 21 9 3 6 12 2 12"/>
                </svg>
              </div>
              <h3 class="service-box-title h5 font-weight-bold text-dark mb-3" style="font-weight: 700; font-size: 1.25rem;">Cấp cứu 24/7</h3>
              <p class="service-box-desc text-secondary mb-4" style="font-size: 0.925rem; line-height: 1.65; color: #475569;">
                Đội ngũ cấp cứu trực 24/7 với xe cứu thương, máy thở và thiết bị hồi sức hiện đại. Tiếp nhận và xử lý mọi trường hợp khẩn cấp nhanh nhất có thể.
              </p>
            </div>
            <div>
              <a href="<?php echo XC_URL; ?>/dich-vu-y-te/cap-cuu-247.html" class="service-detail-link font-weight-bold text-decoration-none d-inline-flex align-items-center gap-1" style="color: #0284c7; font-weight: 600; font-size: 0.925rem;">
                <span>Xem chi tiết</span>
                <i class="fa-solid fa-chevron-right style-icon-arrow" style="font-size: 0.8rem; margin-left: 2px;"></i>
              </a>
            </div>
          </div>
        </div>

        <!-- Card 6: Xét nghiệm & Chẩn đoán -->
        <div class="col-lg-4 col-md-6">
          <div class="service-box-card h-100 p-4 bg-white border rounded-4 shadow-sm position-relative d-flex flex-column justify-content-between">
            <div>
              <div class="service-icon-wrap rounded-3 d-flex align-items-center justify-content-center mb-3" style="width: 54px; height: 54px; background-color: #e0f2fe; color: #0284c7;">
                <svg viewBox="0 0 24 24" width="26" height="26" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round">
                  <rect x="3" y="3" width="18" height="18" rx="3" ry="3"/>
                  <line x1="3" y1="12" x2="21" y2="12"/>
                  <line x1="12" y1="3" x2="12" y2="21"/>
                </svg>
              </div>
              <h3 class="service-box-title h5 font-weight-bold text-dark mb-3" style="font-weight: 700; font-size: 1.25rem;">Xét nghiệm & Chẩn đoán</h3>
              <p class="service-box-desc text-secondary mb-4" style="font-size: 0.925rem; line-height: 1.65; color: #475569;">
                Hệ thống xét nghiệm máu, nước tiểu, vi sinh, siêu âm, X-quang hiện đại. Kết quả nhanh, chính xác, hỗ trợ chẩn đoán bệnh kịp thời.
              </p>
            </div>
            <div>
              <a href="<?php echo XC_URL; ?>/dich-vu-y-te/xet-nghiem-chan-doan.html" class="service-detail-link font-weight-bold text-decoration-none d-inline-flex align-items-center gap-1" style="color: #0284c7; font-weight: 600; font-size: 0.925rem;">
                <span>Xem chi tiết</span>
                <i class="fa-solid fa-chevron-right style-icon-arrow" style="font-size: 0.8rem; margin-left: 2px;"></i>
              </a>
            </div>
          </div>
        </div>

      </div><!-- /row -->

    </div>
  </section>

  <!-- ============================================================
       QUICK BOOKING BANNER SECTION
       ============================================================ -->
  <section class="services-cta-banner py-5 mt-4">
    <div class="container">
      <div class="p-4 p-md-5 rounded-4 shadow-sm text-white d-flex flex-column flex-md-row align-items-center justify-content-between gap-4" style="background: linear-gradient(135deg, #0284c7 0%, #0369a1 100%);">
        <div>
          <h2 class="h3 font-weight-bold mb-2" style="font-weight: 800;">Cần Tư Vấn Hoặc Đặt Lịch Khám?</h2>
          <p class="mb-0 text-white-50" style="font-size: 15px;">
            Đội ngũ tư vấn y tế sẵn sàng hỗ trợ giải đáp mọi thắc mắc và xếp lịch hẹn khám nhanh chóng.
          </p>
        </div>
        <div class="d-flex flex-wrap gap-3 flex-shrink-0">
          <a href="tel:1900xxxx" class="btn btn-light btn-lg font-weight-bold px-4 text-primary rounded-pill shadow-sm" style="font-weight: 700; font-size: 15px;">
            <i class="fa-solid fa-phone me-2"></i> Gọi Hotline 1900 xxxx
          </a>
          <a href="<?php echo XC_URL; ?>/lien-he.html" class="btn btn-outline-light btn-lg font-weight-bold px-4 rounded-pill" style="font-weight: 700; font-size: 15px;">
            Đặt Lịch Ngay
          </a>
        </div>
      </div>
    </div>
  </section>

</main>

<style>
.service-box-card {
  transition: transform 0.3s ease, box-shadow 0.3s ease, border-color 0.3s ease;
  border-radius: 16px !important;
}
.service-box-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 12px 28px rgba(2, 132, 199, 0.12) !important;
  border-color: #7dd3fc !important;
}
.service-detail-link:hover {
  color: #0369a1 !important;
}
.service-detail-link:hover .style-icon-arrow {
  transform: translateX(4px);
}
.style-icon-arrow {
  transition: transform 0.2s ease;
}
</style>

<?php require_once "footer.php"; ?>
