
<?php require_once 'header.php'; ?>

  
    <!-- ============================================================
         QUICK INFO BAR
         ============================================================ -->
    <section class="quick-info-bar" aria-label="Thông tin nhanh">
      <div class="container">
        <div class="quick-info-inner">

          <article class="quick-info-item">
            <div class="quick-info-icon" aria-hidden="true">
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                <path d="M22 16.92v3a2 2 0 01-2.18 2 19.79 19.79 0 01-8.63-3.07A19.5 19.5 0 013.07 10.8 19.79 19.79 0 01.01 2.18 2 2 0 012 0h3a2 2 0 012 1.72c.127.96.361 1.903.7 2.81a2 2 0 01-.45 2.11L6.09 7.91a16 16 0 006 6l1.27-1.27a2 2 0 012.11-.45c.907.339 1.85.573 2.81.7A2 2 0 0122 16.92z"/>
              </svg>
            </div>
            <div class="quick-info-text">
              <strong>Hotline cấp cứu 24/7</strong>
              <span><a href="tel:1900xxxx" style="color:var(--color-danger);font-weight:700;">1900 xxxx</a></span>
            </div>
          </article>

          <article class="quick-info-item">
            <div class="quick-info-icon" aria-hidden="true">
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                <circle cx="12" cy="12" r="10"/>
                <polyline points="12 6 12 12 16 14"/>
              </svg>
            </div>
            <div class="quick-info-text">
              <strong>Giờ làm việc</strong>
              <span>T2–T6: 7:00–17:00 | T7: 7:00–11:30</span>
            </div>
          </article>

          <article class="quick-info-item">
            <div class="quick-info-icon" aria-hidden="true">
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                <path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0118 0z"/>
                <circle cx="12" cy="10" r="3"/>
              </svg>
            </div>
            <div class="quick-info-text">
              <strong>Địa chỉ</strong>
              <span>Đường Trần Phú, TT. Đắk Hà, Kon Tum</span>
            </div>
          </article>

          <article class="quick-info-item">
            <div class="quick-info-icon" aria-hidden="true">
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                <rect x="3" y="4" width="18" height="18" rx="2" ry="2"/>
                <line x1="16" y1="2" x2="16" y2="6"/>
                <line x1="8" y1="2" x2="8" y2="6"/>
                <line x1="3" y1="10" x2="21" y2="10"/>
              </svg>
            </div>
            <div class="quick-info-text">
              <strong>Đăng nhập</strong>
              <span><a href="pages/dat-lich.html" style="color:var(--color-accent);font-weight:600;">Đăng nhập →</a></span>
            </div>
          </article>

        </div>
      </div>
    </section>

    <!-- ============================================================
         STATISTICS / NUMBERS
         ============================================================ -->
    <section class="stats-section" aria-labelledby="stats-heading">
      <div class="container">
        <h2 id="stats-heading" class="sr-only">Số liệu thống kê nổi bật</h2>
        <div class="stats-grid">

          <article class="stat-card" data-animate>
            <div class="stat-icon" aria-hidden="true">
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                <path d="M17 21v-2a4 4 0 00-4-4H5a4 4 0 00-4 4v2"/>
                <circle cx="9" cy="7" r="4"/>
                <path d="M23 21v-2a4 4 0 00-3-3.87M16 3.13a4 4 0 010 7.75"/>
              </svg>
            </div>
            <div class="stat-number">
              <span data-count="45000" data-suffix="+">0</span>
            </div>
            <p class="stat-label">Bệnh nhân khám/năm</p>
          </article>

          <article class="stat-card" data-animate data-animate-delay="200">
            <div class="stat-icon" aria-hidden="true">
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                <path d="M22 12h-4l-3 9L9 3l-3 9H2"/>
              </svg>
            </div>
            <div class="stat-number">
              <span data-count="120" data-suffix="+">0</span>
            </div>
            <p class="stat-label">Y bác sĩ & nhân viên</p>
          </article>

          <article class="stat-card" data-animate data-animate-delay="300">
            <div class="stat-icon" aria-hidden="true">
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                <path d="M3 9l9-7 9 7v11a2 2 0 01-2 2H5a2 2 0 01-2-2z"/>
                <polyline points="9 22 9 12 15 12 15 22"/>
              </svg>
            </div>
            <div class="stat-number">
              <span data-count="15" data-suffix="+">0</span>
            </div>
            <p class="stat-label">Khoa/Phòng chuyên môn</p>
          </article>

          <article class="stat-card" data-animate data-animate-delay="400">
            <div class="stat-icon" aria-hidden="true">
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                <circle cx="12" cy="12" r="10"/>
                <polyline points="12 6 12 12 16 14"/>
              </svg>
            </div>
            <div class="stat-number">
              <span data-count="30" data-suffix=" năm">0</span>
            </div>
            <p class="stat-label">Kinh nghiệm phục vụ</p>
          </article>

        </div>
      </div>
    </section>

    <!-- ============================================================
         ABOUT PREVIEW
         ============================================================ -->
    <section class="bg-alt" aria-labelledby="about-heading">
      <div class="container">
        <div class="about-preview">

          <figure class="about-img-wrap" data-animate>
            <img
              src="<?php echo XC_URL; ?>/template/frontend/assets/images/banner-02.jpg"
              alt="Cơ sở vật chất và trang thiết bị y tế hiện đại của Bệnh viện đa khoa khu vực Đắk Hà"
              class="about-img"
              loading="lazy"
              width="700"
              height="525" />
            <figcaption class="about-badge">
              <strong>30+</strong>
              <span>Năm phục vụ</span>
            </figcaption>
          </figure>

          <div class="about-content" data-animate data-animate-delay="200">
            <div class="section-header">
              <p class="section-label">Về chúng tôi</p>
              <h2 class="section-title" id="about-heading">
                Bệnh viện đa khoa khu vực Đắk Hà — Tận tâm vì sức khỏe cộng đồng
              </h2>
              <p class="section-desc">
                Bệnh viện đa khoa khu vực Đắk Hà là đơn vị sự nghiệp y tế công lập thuộc
                Sở Y tế tỉnh Quảng Ngãi, đảm nhận chức năng khám chữa bệnh, chăm sóc sức
                khỏe toàn diện cho nhân dân huyện Đắk Hà và các vùng lân cận.
              </p>
            </div>

            <div class="about-features">
              <div class="about-feature">
                <div class="about-feature-icon" aria-hidden="true">
                  <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/>
                  </svg>
                </div>
                <div class="about-feature-text">
                  <h3>Đội ngũ chuyên gia tận tâm</h3>
                  <p>Hơn 120 y bác sĩ, điều dưỡng có trình độ chuyên môn cao, giàu kinh nghiệm, luôn đặt bệnh nhân lên hàng đầu.</p>
                </div>
              </div>

              <div class="about-feature">
                <div class="about-feature-icon" aria-hidden="true">
                  <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <rect x="2" y="3" width="20" height="14" rx="2" ry="2"/>
                    <line x1="8" y1="21" x2="16" y2="21"/>
                    <line x1="12" y1="17" x2="12" y2="21"/>
                  </svg>
                </div>
                <div class="about-feature-text">
                  <h3>Trang thiết bị hiện đại</h3>
                  <p>Hệ thống máy chẩn đoán hình ảnh, xét nghiệm, phẫu thuật tiên tiến đáp ứng nhu cầu khám chữa bệnh của nhân dân.</p>
                </div>
              </div>

              <div class="about-feature">
                <div class="about-feature-icon" aria-hidden="true">
                  <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M17 21v-2a4 4 0 00-4-4H5a4 4 0 00-4 4v2"/>
                    <circle cx="9" cy="7" r="4"/>
                    <path d="M23 21v-2a4 4 0 00-3-3.87M16 3.13a4 4 0 010 7.75"/>
                  </svg>
                </div>
                <div class="about-feature-text">
                  <h3>Phục vụ toàn diện cộng đồng</h3>
                  <p>Triển khai đầy đủ các chương trình y tế quốc gia, tiêm chủng, phòng chống dịch bệnh và chăm sóc sức khỏe ban đầu.</p>
                </div>
              </div>
            </div>

            <div style="margin-top: var(--space-8); display:flex; gap:var(--space-4); flex-wrap:wrap;">
              <a href="pages/gioi-thieu.html" class="btn btn-primary btn-lg" id="btn-gioithieu">Tìm hiểu thêm</a>
              <a href="pages/ban-lanh-dao.html" class="btn btn-outline btn-lg" id="btn-lanhdao">Ban lãnh đạo</a>
            </div>
          </div>

        </div>
      </div>
    </section>

    <!-- ============================================================
         SERVICES SECTION
         ============================================================ -->
    <section aria-labelledby="services-heading">
      <div class="container">
        <header class="section-header centered" data-animate>
          <p class="section-label">Dịch vụ y tế</p>
          <h2 class="section-title" id="services-heading">Các dịch vụ khám chữa bệnh</h2>
          <p class="section-desc">
            Trung tâm cung cấp đầy đủ các chuyên khoa và dịch vụ y tế, đáp ứng nhu cầu chăm sóc sức khỏe của toàn thể cộng đồng.
          </p>
        </header>

        <div class="services-grid">

          <article class="service-card" data-animate>
            <div class="service-icon" aria-hidden="true">
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                <path d="M22 12h-4l-3 9L9 3l-3 9H2"/>
              </svg>
            </div>
            <h3 class="service-title">Khám nội khoa</h3>
            <p class="service-desc">
              Chẩn đoán và điều trị các bệnh lý nội khoa phổ biến như tim mạch, hô hấp, tiêu hóa, nội tiết và thần kinh. Đội ngũ bác sĩ chuyên khoa dày dạn kinh nghiệm.
            </p>
            <a href="pages/dich-vu-y-te.html#noi-khoa" class="service-link" id="link-noi-khoa">
              Xem chi tiết
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" aria-hidden="true">
                <polyline points="9 18 15 12 9 6"/>
              </svg>
            </a>
          </article>

          <article class="service-card" data-animate data-animate-delay="100">
            <div class="service-icon" aria-hidden="true">
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/>
              </svg>
            </div>
            <h3 class="service-title">Ngoại khoa & Phẫu thuật</h3>
            <p class="service-desc">
              Thực hiện các ca phẫu thuật ngoại khoa với trang thiết bị phòng mổ hiện đại, đội ngũ phẫu thuật viên có kinh nghiệm và hệ thống theo dõi hậu phẫu 24/7.
            </p>
            <a href="pages/dich-vu-y-te.html#ngoai-khoa" class="service-link" id="link-ngoai-khoa">
              Xem chi tiết
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" aria-hidden="true">
                <polyline points="9 18 15 12 9 6"/>
              </svg>
            </a>
          </article>

          <article class="service-card" data-animate data-animate-delay="200">
            <div class="service-icon" aria-hidden="true">
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                <path d="M20.84 4.61a5.5 5.5 0 00-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 00-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 000-7.78z"/>
              </svg>
            </div>
            <h3 class="service-title">Sản phụ khoa</h3>
            <p class="service-desc">
              Chăm sóc thai sản, theo dõi thai kỳ, đỡ đẻ và các dịch vụ phụ khoa. Khu vực sinh đẻ được trang bị đầy đủ đảm bảo an toàn cho mẹ và bé.
            </p>
            <a href="pages/dich-vu-y-te.html#san-phu-khoa" class="service-link" id="link-san-khoa">
              Xem chi tiết
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" aria-hidden="true">
                <polyline points="9 18 15 12 9 6"/>
              </svg>
            </a>
          </article>

          <article class="service-card" data-animate data-animate-delay="100">
            <div class="service-icon" aria-hidden="true">
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                <circle cx="12" cy="8" r="7"/>
                <polyline points="8.21 13.89 7 23 12 20 17 23 15.79 13.88"/>
              </svg>
            </div>
            <h3 class="service-title">Nhi khoa</h3>
            <p class="service-desc">
              Khám và điều trị bệnh cho trẻ em từ sơ sinh đến 15 tuổi. Bác sĩ nhi khoa chuyên nghiệp, cơ sở thân thiện và an toàn cho trẻ.
            </p>
            <a href="pages/dich-vu-y-te.html#nhi-khoa" class="service-link" id="link-nhi-khoa">
              Xem chi tiết
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" aria-hidden="true">
                <polyline points="9 18 15 12 9 6"/>
              </svg>
            </a>
          </article>

          <article class="service-card" data-animate data-animate-delay="200">
            <div class="service-icon" aria-hidden="true">
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                <polyline points="22 12 18 12 15 21 9 3 6 12 2 12"/>
              </svg>
            </div>
            <h3 class="service-title">Cấp cứu 24/7</h3>
            <p class="service-desc">
              Đội ngũ cấp cứu trực 24/7 với xe cứu thương, máy thở và thiết bị hồi sức hiện đại. Tiếp nhận và xử lý mọi trường hợp khẩn cấp nhanh nhất có thể.
            </p>
            <a href="pages/dich-vu-y-te.html#cap-cuu" class="service-link" id="link-cap-cuu">
              Xem chi tiết
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" aria-hidden="true">
                <polyline points="9 18 15 12 9 6"/>
              </svg>
            </a>
          </article>

          <article class="service-card" data-animate data-animate-delay="300">
            <div class="service-icon" aria-hidden="true">
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                <path d="M9 3H5a2 2 0 00-2 2v4m6-6h10a2 2 0 012 2v4M9 3v18m0 0h10a2 2 0 002-2V9M9 21H5a2 2 0 01-2-2V9m0 0h18"/>
              </svg>
            </div>
            <h3 class="service-title">Xét nghiệm & Chẩn đoán</h3>
            <p class="service-desc">
              Hệ thống xét nghiệm máu, nước tiểu, vi sinh, siêu âm, X-quang hiện đại. Kết quả nhanh, chính xác, hỗ trợ chẩn đoán bệnh kịp thời.
            </p>
            <a href="pages/dich-vu-y-te.html#xet-nghiem" class="service-link" id="link-xet-nghiem">
              Xem chi tiết
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" aria-hidden="true">
                <polyline points="9 18 15 12 9 6"/>
              </svg>
            </a>
          </article>

        </div>

        <div style="text-align:center; margin-top:var(--space-10);">
          <a href="pages/dich-vu-y-te.html" class="btn btn-primary btn-lg" id="btn-xem-het-dv">
            Xem tất cả dịch vụ
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" aria-hidden="true">
              <polyline points="9 18 15 12 9 6"/>
            </svg>
          </a>
        </div>

      </div>
    </section>

    <!-- ============================================================
         DOCTORS SECTION
         ============================================================ -->
    <section class="bg-alt" aria-labelledby="doctors-heading">
      <div class="container">
        <header class="section-header centered" data-animate>
          <p class="section-label">Đội ngũ y bác sĩ</p>
          <h2 class="section-title" id="doctors-heading">Bác sĩ tiêu biểu</h2>
          <p class="section-desc">
            Đội ngũ y bác sĩ của chúng tôi là những chuyên gia tận tâm với nhiều năm kinh nghiệm, luôn đặt sức khỏe bệnh nhân lên hàng đầu.
          </p>
        </header>

        <div class="doctors-track">
        <?php if (!empty($featured_doctors) && is_array($featured_doctors)): ?>
          <?php foreach($featured_doctors as $idx => $doc): 
            $delay = ($idx % 4) * 100;
            $docName = !empty($doc->doctor_name) ? $doc->doctor_name : (!empty($doc->fullname) ? $doc->fullname : '');
            $docPosition = !empty($doc->doctor_position) ? $doc->doctor_position : (!empty($doc->position) ? $doc->position : 'Cán bộ y tế');
            $docWorkplace = !empty($doc->doctor_workplace) ? $doc->doctor_workplace : (!empty($doc->workplace) ? $doc->workplace : 'Bệnh viện Đa khoa khu vực Đắk Hà');
            $docAvatar = !empty($doc->doctor_avatar) ? $doc->doctor_avatar : (!empty($doc->avatar) ? $doc->avatar : '');
            $docDob = !empty($doc->doctor_dob) ? $doc->doctor_dob : (!empty($doc->dob) ? $doc->dob : '');
            $docHometown = !empty($doc->doctor_hometown) ? $doc->doctor_hometown : (!empty($doc->hometown) ? $doc->hometown : '');
            $docCccd = !empty($doc->doctor_cccd) ? $doc->doctor_cccd : (!empty($doc->cccd) ? $doc->cccd : '');
            $docJobCode = !empty($doc->doctor_job_title_code) ? $doc->doctor_job_title_code : (!empty($doc->job_title_code) ? $doc->job_title_code : (!empty($doc->doctor_cchn) ? $doc->doctor_cchn : ''));
            $docCode = !empty($doc->doctor_code) ? $doc->doctor_code : (!empty($doc->code) ? $doc->code : '');

            $hasAvatar = !empty($docAvatar) && file_exists(__SITE_PATH . '/uploads/doctors/' . $docAvatar);
            $avatarUrl = $hasAvatar 
              ? XC_URL . '/uploads/doctors/' . htmlspecialchars($docAvatar, ENT_QUOTES, 'UTF-8')
              : XC_URL . '/template/frontend/assets/images/doctor-0' . (($idx % 3) + 1) . '.jpg';
            
            $docData = array(
              'fullname' => (string)$docName,
              'dob' => (!empty($docDob) && $docDob !== '0000-00-00') ? date('d/m/Y', strtotime($docDob)) : 'Chưa cập nhật',
              'hometown' => !empty($docHometown) ? (string)$docHometown : 'Chưa cập nhật',
              'cccd' => !empty($docCccd) ? (string)$docCccd : 'Chưa cập nhật',
              'position' => (string)$docPosition,
              'job_title_code' => !empty($docJobCode) ? (string)$docJobCode : 'Chưa cập nhật',
              'department' => !empty($doc->depart_name) ? (string)$doc->depart_name : 'Bệnh viện Đa khoa khu vực Đắk Hà',
              'workplace' => (string)$docWorkplace,
              'code' => !empty($docCode) ? (string)$docCode : 'Chưa cập nhật',
              'avatar' => $avatarUrl
            );
          ?>
          <article class="doctor-card doctor-card-clickable" 
                   data-doctor='<?php echo htmlspecialchars(json_encode($docData, JSON_UNESCAPED_UNICODE), ENT_QUOTES, 'UTF-8'); ?>'
                   onclick="openDoctorModal(this)"
                   data-animate <?php echo $delay > 0 ? 'data-animate-delay="'.$delay.'"' : ''; ?> 
                   itemscope itemtype="https://schema.org/Physician">
            <div class="doctor-img-wrap">
              <img
                src="<?php echo $avatarUrl; ?>"
                alt="<?php echo htmlspecialchars($docPosition . ' ' . $docName, ENT_QUOTES, 'UTF-8'); ?>"
                class="doctor-img"
                loading="lazy"
                width="280"
                height="373"
                itemprop="image" />
              <div class="doctor-overlay" aria-hidden="true">
                <span class="doctor-overlay-btn"><i class="fa-solid fa-circle-info"></i> Xem chi tiết</span>
              </div>
            </div>
            <div class="doctor-info">
              <span class="doctor-badge"><?php echo htmlspecialchars($docPosition, ENT_QUOTES, 'UTF-8'); ?></span>
              <h3 class="doctor-name" itemprop="name"><?php echo htmlspecialchars($docName, ENT_QUOTES, 'UTF-8'); ?></h3>
              
              <div class="doctor-workplace-box">
                <div class="doctor-dept-line">
                  <i class="fa-solid fa-hospital-user"></i>
                  <span><?php echo htmlspecialchars($doc->depart_name ?: 'Bệnh viện Đắk Hà', ENT_QUOTES, 'UTF-8'); ?></span>
                </div>
                <div class="doctor-workplace-line">
                  <i class="fa-solid fa-hospital"></i>
                  <span><?php echo htmlspecialchars($docWorkplace, ENT_QUOTES, 'UTF-8'); ?></span>
                </div>
              </div>

              <div class="doctor-card-footer">
                <span class="doctor-view-detail-btn">
                  <i class="fa-solid fa-id-card"></i> Xem chi tiết hồ sơ
                </span>
              </div>
            </div>
          </article>
          <?php endforeach; ?>
        <?php else: ?>
          <article class="doctor-card" data-animate itemscope itemtype="https://schema.org/Physician">
            <div class="doctor-img-wrap">
              <img
                src="<?php echo XC_URL; ?>/template/frontend/assets/images/doctor-01.jpg"
                alt="Bác sĩ CKI Nguyễn Văn An — Chuyên khoa Nội tổng quát"
                class="doctor-img"
                loading="lazy"
                width="280"
                height="373"
                itemprop="image" />
              <div class="doctor-overlay" aria-hidden="true">
                <span class="doctor-overlay-btn"><i class="fa-solid fa-circle-info"></i> Xem chi tiết</span>
              </div>
            </div>
            <div class="doctor-info">
              <span class="doctor-badge">Bác sĩ CKI</span>
              <h3 class="doctor-name" itemprop="name">Nguyễn Văn An</h3>
              <div class="doctor-workplace-box">
                <div class="doctor-dept-line">
                  <i class="fa-solid fa-hospital-user"></i>
                  <span>Nội khoa tổng quát</span>
                </div>
                <div class="doctor-workplace-line">
                  <i class="fa-solid fa-hospital"></i>
                  <span>Bệnh viện Đa khoa Khu vực Đắk Hà</span>
                </div>
              </div>
            </div>
          </article>
        <?php endif; ?>
        </div>

        <div style="text-align:center; margin-top:var(--space-10);">
          <a href="<?php echo XC_URL; ?>/bac-si" class="btn btn-outline btn-lg" id="btn-xem-het-bs">Xem tất cả đội ngũ</a>
        </div>

        <!-- DOCTOR DETAIL MODAL POPUP FOR HOMEPAGE -->
        <div id="doctorDetailModal" class="doctor-modal-backdrop" onclick="if(event.target === this) closeDoctorModal();" aria-hidden="true" role="dialog" aria-labelledby="modalDoctorName">
          <div class="doctor-modal-dialog">
            <button type="button" class="doctor-modal-close" aria-label="Đóng" onclick="closeDoctorModal()">&times;</button>
            
            <div class="doctor-modal-header">
              <h3 class="doctor-modal-main-title"><i class="fa-solid fa-address-card"></i> Thông Tin Chi Tiết Cán Bộ / Bác Sĩ</h3>
            </div>

            <div class="doctor-modal-body">
              <div class="doctor-modal-grid">
                <div class="doctor-modal-avatar-col">
                  <div class="doctor-modal-avatar-wrap">
                    <img id="modalDoctorImg" src="" alt="" class="doctor-modal-avatar">
                  </div>
                  <div class="doctor-modal-status-badge">
                    <i class="fa-solid fa-circle-check"></i> Đang công tác
                  </div>
                </div>

                <div class="doctor-modal-info-col">
                  <h2 id="modalDoctorName" class="doctor-modal-name"></h2>
                  <div id="modalDoctorPosition" class="doctor-modal-pos-badge"></div>

                  <table class="doctor-modal-table">
                    <tbody>
                      <tr>
                        <th scope="row"><i class="fa-solid fa-hospital-user"></i> Phòng ban, đơn vị</th>
                        <td id="modalDoctorDept"></td>
                      </tr>
                      <tr>
                        <th scope="row"><i class="fa-solid fa-hospital"></i> Đơn vị công tác</th>
                        <td id="modalDoctorWorkplace"></td>
                      </tr>
                      <tr>
                        <th scope="row"><i class="fa-solid fa-calendar-day"></i> Ngày sinh</th>
                        <td id="modalDoctorDob"></td>
                      </tr>
                      <tr>
                        <th scope="row"><i class="fa-solid fa-map-location-dot"></i> Quê quán</th>
                        <td id="modalDoctorHometown"></td>
                      </tr>
                      <tr>
                        <th scope="row"><i class="fa-solid fa-id-badge"></i> Mã ngạch / CDNN</th>
                        <td id="modalDoctorJobCode"></td>
                      </tr>
                      <tr>
                        <th scope="row"><i class="fa-solid fa-barcode"></i> Mã số</th>
                        <td id="modalDoctorCode"></td>
                      </tr>
                      <tr>
                        <th scope="row"><i class="fa-solid fa-id-card"></i> Số CCCD</th>
                        <td id="modalDoctorCccd"></td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>

            <div class="doctor-modal-footer">
              <button type="button" class="doctor-modal-btn-close" onclick="closeDoctorModal()">Đóng</button>
            </div>
          </div>
        </div>

      </div>
    </section>

    <script>
    function openDoctorModal(cardEl) {
      try {
        var raw = cardEl.getAttribute('data-doctor');
        if (!raw) return;
        var data = JSON.parse(raw);
        
        document.getElementById('modalDoctorImg').src = data.avatar || '';
        document.getElementById('modalDoctorImg').alt = data.fullname || '';
        document.getElementById('modalDoctorName').textContent = data.fullname || '';
        document.getElementById('modalDoctorPosition').textContent = data.position || '';
        document.getElementById('modalDoctorDept').textContent = data.department || '-';
        document.getElementById('modalDoctorWorkplace').textContent = data.workplace || '-';
        document.getElementById('modalDoctorDob').textContent = data.dob || '-';
        document.getElementById('modalDoctorHometown').textContent = data.hometown || '-';
        document.getElementById('modalDoctorJobCode').textContent = data.job_title_code || '-';
        document.getElementById('modalDoctorCode').textContent = data.code || '-';
        document.getElementById('modalDoctorCccd').textContent = data.cccd || '-';
        
        var modal = document.getElementById('doctorDetailModal');
        if (modal) {
          modal.classList.add('active');
          document.body.style.overflow = 'hidden';
        }
      } catch (err) {
        console.error('Error opening doctor modal:', err);
      }
    }

    function closeDoctorModal() {
      var modal = document.getElementById('doctorDetailModal');
      if (modal) {
        modal.classList.remove('active');
        document.body.style.overflow = '';
      }
    }

    document.addEventListener('keydown', function(e) {
      if (e.key === 'Escape') {
        closeDoctorModal();
      }
    });
    </script>

    <!-- ============================================================
         NEWS SECTION
         ============================================================ -->
    <section aria-labelledby="news-heading">
      <div class="container">
        <header class="section-header flex-between" data-animate>
          <div>
            <p class="section-label">Tin tức mới nhất</p>
            <h2 class="section-title" id="news-heading">Tin tức & Sự kiện</h2>
          </div>
          <a href="<?php echo XC_URL; ?>/tin-tuc" class="btn btn-outline" id="btn-xem-het-tin" style="flex-shrink:0;">
            Xem tất cả →
          </a>
        </header>

        <div class="news-grid" data-animate>
          <?php 
          if (!empty($home_featured_news) && is_array($home_featured_news)): 
             $first_news = $home_featured_news[0];
             $side_news = array_slice($home_featured_news, 1);
             $first_url = $this->url->permalink($first_news->id, 'event_detail');
             $first_img = !empty($first_news->thumbnail_url) ? (strpos($first_news->thumbnail_url, 'http') === 0 ? $first_news->thumbnail_url : (strpos($first_news->thumbnail_url, '/') === 0 ? XC_URL . $first_news->thumbnail_url : XC_URL . '/uploads/events/' . htmlspecialchars($first_news->thumbnail_url, ENT_QUOTES, 'UTF-8'))) : XC_URL . '/template/frontend/assets/images/banner-03.jpg';
          ?>
          <!-- Featured news -->
          <article class="news-card news-featured" itemscope itemtype="https://schema.org/NewsArticle">
            <div class="news-card-img-wrap">
              <a href="<?php echo $first_url; ?>">
                <img
                  src="<?php echo $first_img; ?>"
                  alt="<?php echo htmlspecialchars($first_news->title ?? $first_news->event_name ?? '', ENT_QUOTES, 'UTF-8'); ?>"
                  class="news-card-img"
                  loading="lazy"
                  width="700"
                  height="394"
                  itemprop="image" />
              </a>
              <span class="news-cat-badge"><?php echo htmlspecialchars($first_news->category_name ?? 'Tin tức', ENT_QUOTES, 'UTF-8'); ?></span>
            </div>
            <div class="news-card-body">
              <div class="news-card-meta">
                <time datetime="<?php echo date('Y-m-d', strtotime($first_news->published_at ?? $first_news->event_created_date ?? $first_news->created_at)); ?>" itemprop="datePublished">
                  <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" aria-hidden="true">
                    <rect x="3" y="4" width="18" height="18" rx="2" ry="2"/>
                    <line x1="16" y1="2" x2="16" y2="6"/>
                    <line x1="8" y1="2" x2="8" y2="6"/>
                    <line x1="3" y1="10" x2="21" y2="10"/>
                  </svg>
                  <?php echo date('d/m/Y', strtotime($first_news->published_at ?? $first_news->event_created_date ?? $first_news->created_at)); ?>
                </time>
                <span>Ban biên tập</span>
              </div>
              <h3 class="news-card-title" itemprop="headline">
                <a href="<?php echo $first_url; ?>" itemprop="url">
                  <?php echo htmlspecialchars($first_news->title ?? $first_news->event_name ?? '', ENT_QUOTES, 'UTF-8'); ?>
                </a>
              </h3>
              <p class="news-card-excerpt" itemprop="description">
                <?php echo htmlspecialchars($first_news->description ?? $first_news->event_description ?? '', ENT_QUOTES, 'UTF-8'); ?>
              </p>
              <div class="news-card-footer">
                <a href="<?php echo $first_url; ?>" class="read-more" id="readmore-01">
                  Đọc tiếp
                  <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" aria-hidden="true">
                    <polyline points="9 18 15 12 9 6"/>
                  </svg>
                </a>
              </div>
            </div>
          </article>

          <!-- Side news list -->
          <aside class="news-side-list" aria-label="Tin tức khác">
            <?php foreach ($side_news as $s_item): 
              $s_url = $this->url->permalink($s_item->id, 'event_detail');
              $s_img = !empty($s_item->thumbnail_url) ? (strpos($s_item->thumbnail_url, 'http') === 0 ? $s_item->thumbnail_url : (strpos($s_item->thumbnail_url, '/') === 0 ? XC_URL . $s_item->thumbnail_url : XC_URL . '/uploads/events/' . htmlspecialchars($s_item->thumbnail_url, ENT_QUOTES, 'UTF-8'))) : XC_URL . '/template/frontend/assets/images/banner-01.jpg';
            ?>
            <article class="news-side-item" itemscope itemtype="https://schema.org/NewsArticle">
              <a href="<?php echo $s_url; ?>">
                <img
                  src="<?php echo $s_img; ?>"
                  alt="<?php echo htmlspecialchars($s_item->title ?? $s_item->event_name ?? '', ENT_QUOTES, 'UTF-8'); ?>"
                  class="news-side-thumb"
                  loading="lazy"
                  width="100"
                  height="80" />
              </a>
              <div class="news-side-body">
                <time datetime="<?php echo date('Y-m-d', strtotime($s_item->published_at ?? $s_item->event_created_date ?? $s_item->created_at)); ?>" itemprop="datePublished">
                  <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" aria-hidden="true" style="width:12px;height:12px;color:var(--color-primary);flex-shrink:0;">
                    <rect x="3" y="4" width="18" height="18" rx="2" ry="2"/>
                    <line x1="16" y1="2" x2="16" y2="6"/>
                    <line x1="8" y1="2" x2="8" y2="6"/>
                    <line x1="3" y1="10" x2="21" y2="10"/>
                  </svg>
                  <?php echo date('d/m/Y', strtotime($s_item->published_at ?? $s_item->event_created_date ?? $s_item->created_at)); ?>
                </time>
                <h3>
                  <a href="<?php echo $s_url; ?>" itemprop="url">
                    <?php echo htmlspecialchars($s_item->title ?? $s_item->event_name ?? '', ENT_QUOTES, 'UTF-8'); ?>
                  </a>
                </h3>
              </div>
            </article>
            <?php endforeach; ?>
          </aside>
          <?php else: ?>
          <div class="w-100 text-center text-muted p-4">Chưa có tin tức mới.</div>
          <?php endif; ?>
        </div>
      </div>
    </section>

    <!-- ============================================================
         FAQ SECTION
         ============================================================ -->
    <section class="bg-alt" aria-labelledby="faq-heading" itemscope itemtype="https://schema.org/FAQPage">
      <div class="container">
        <div class="faq-grid">

          <div class="faq-intro-col">
            <div class="section-header" data-animate>
              <p class="section-label">Câu hỏi thường gặp</p>
              <h2 class="section-title" id="faq-heading">Bạn cần biết</h2>
              <p class="section-desc">
                Tìm câu trả lời nhanh cho các thắc mắc thường gặp về quy trình khám, dịch vụ và giờ làm việc.
              </p>
            </div>
            <div class="faq-cta-wrap">
              <a href="pages/lien-he.html" class="btn btn-primary btn-lg" id="btn-gop-y">
                Gửi câu hỏi của bạn →
              </a>
            </div>
          </div>

          <div class="faq-list" data-animate data-animate-delay="200">

            <article class="faq-item" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
              <button class="faq-question" aria-expanded="false" id="faq-q1" itemprop="name">
                Bệnh viện đa khoa khu vực Đắk Hà làm việc mấy giờ?
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" aria-hidden="true">
                  <line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/>
                </svg>
              </button>
              <div class="faq-answer" aria-labelledby="faq-q1" itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer">
                <div class="faq-answer-inner" itemprop="text">
                  <strong>Giờ làm việc hành chính:</strong> Thứ Hai – Thứ Sáu từ 7:00 – 17:00, Thứ Bảy từ 7:00 – 11:30 (nghỉ Chủ Nhật và ngày lễ). <strong>Cấp cứu:</strong> hoạt động 24/7, kể cả ngày lễ, Tết. Đăng nhập trước qua hotline 1900 xxxx.
                </div>
              </div>
            </article>

            <article class="faq-item" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
              <button class="faq-question" aria-expanded="false" id="faq-q2" itemprop="name">
                Hotline cấp cứu của Trung tâm là bao nhiêu?
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" aria-hidden="true">
                  <line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/>
                </svg>
              </button>
              <div class="faq-answer" aria-labelledby="faq-q2" itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer">
                <div class="faq-answer-inner" itemprop="text">
                  Đường dây cấp cứu khẩn cấp 24/7: <strong>1900 xxxx</strong> hoặc trực tiếp: <strong>(0260) 386 2xxx</strong>. Đội ngũ cấp cứu luôn trực sẵn sàng tiếp nhận và xử lý mọi tình huống khẩn cấp.
                </div>
              </div>
            </article>

            <article class="faq-item" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
              <button class="faq-question" aria-expanded="false" id="faq-q3" itemprop="name">
                Làm sao để Đăng nhập trực tuyến?
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" aria-hidden="true">
                  <line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/>
                </svg>
              </button>
              <div class="faq-answer" aria-labelledby="faq-q3" itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer">
                <div class="faq-answer-inner" itemprop="text">
                  Bạn có thể Đăng nhập qua 3 cách: (1) Trực tuyến tại trang <a href="pages/dat-lich.html">Đăng nhập</a> trên website này; (2) Gọi hotline 1900 xxxx; (3) Đến trực tiếp tại quầy tiếp nhận bệnh nhân. Vui lòng mang theo CCCD và thẻ BHYT (nếu có).
                </div>
              </div>
            </article>

            <article class="faq-item" itemscope itemprop="mainEntity" itemtype="https://schema.org/Question">
              <button class="faq-question" aria-expanded="false" id="faq-q4" itemprop="name">
                Trung tâm có tiếp nhận bảo hiểm y tế không?
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" aria-hidden="true">
                  <line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/>
                </svg>
              </button>
              <div class="faq-answer" aria-labelledby="faq-q4" itemscope itemprop="acceptedAnswer" itemtype="https://schema.org/Answer">
                <div class="faq-answer-inner" itemprop="text">
                  Có, Bệnh viện đa khoa khu vực Đắk Hà là cơ sở khám chữa bệnh BHYT tuyến huyện. Bệnh nhân có thẻ BHYT đúng tuyến được hưởng 80–100% chi phí khám chữa bệnh theo quy định của Luật BHYT hiện hành.
                </div>
              </div>
            </article>

          </div>
        </div>
      </div>
    </section>

    <!-- ============================================================
         CTA BAND
         ============================================================ -->
    <!-- <section class="cta-band" aria-labelledby="cta-heading" data-animate>
      <div class="container">
        <div class="cta-band-inner">
          <div class="cta-band-text">
            <h2 id="cta-heading">Đăng nhập ngay hôm nay</h2>
            <p>Chăm sóc sức khỏe của bạn và gia đình không cần chờ đợi — đặt lịch nhanh chóng, tiện lợi.</p>
          </div>
          <div class="cta-band-actions">
            <a href="pages/dat-lich.html" class="btn btn-ghost btn-lg" id="cta-btn-datlich">
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" aria-hidden="true">
                <rect x="3" y="4" width="18" height="18" rx="2" ry="2"/>
                <line x1="16" y1="2" x2="16" y2="6"/>
                <line x1="8" y1="2" x2="8" y2="6"/>
                <line x1="3" y1="10" x2="21" y2="10"/>
              </svg>
              Đăng nhập
            </a>
            <a href="tel:1900xxxx" class="btn btn-lg" style="background:#fff;color:var(--color-danger);font-weight:700;" id="cta-btn-hotline">
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" aria-hidden="true">
                <path d="M22 16.92v3a2 2 0 01-2.18 2 19.79 19.79 0 01-8.63-3.07A19.5 19.5 0 013.07 10.8 19.79 19.79 0 01.01 2.18 2 2 0 012 0h3a2 2 0 012 1.72c.127.96.361 1.903.7 2.81a2 2 0 01-.45 2.11L6.09 7.91a16 16 0 006 6l1.27-1.27a2 2 0 012.11-.45c.907.339 1.85.573 2.81.7A2 2 0 0122 16.92z"/>
              </svg>
              Gọi 1900 xxxx
            </a>
          </div>
        </div>
      </div>
    </section> -->

  </main>
<?php require_once 'footer.php'; ?>