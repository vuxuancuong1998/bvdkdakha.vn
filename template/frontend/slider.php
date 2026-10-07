<!-- ============================================================
       MAIN CONTENT
       ============================================================ -->
  <main id="main-content" role="main">

    <!-- ============================================================
         ANNOUNCEMENT MARQUEE
         ============================================================ -->
    <section class="announcements-bar" aria-label="Thông báo mới">
      <div class="container">
        <div class="announcements-inner">
          <span class="announcements-label" aria-hidden="true"><i class="fa-solid fa-bullhorn"></i> Thông báo</span>
          <div class="marquee-track" role="marquee" aria-live="polite" aria-label="Thông báo cuộn">
            <div class="marquee-content">
              <?php $thong_bao_text = $this->helper->get_config('thong_bao'); ?>
              <span class="marquee-item"><?php echo $thong_bao_text; ?></span>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- ============================================================
         HERO BANNER SLIDER
         ============================================================ -->
    <section class="hero" aria-label="Banner trang chủ" itemscope itemtype="https://schema.org/ImageObject">
      <div class="slider-wrapper" role="region" aria-roledescription="slideshow" aria-label="Ảnh banner">

        <!-- Slide 1 -->
        <article class="slide active" role="group" aria-roledescription="slide" aria-label="Slide 1 / 3">
          <div class="slide-bg" style="background-image: url('<?php echo XC_URL;?>/uploads/slider/banner_01.png');" role="img" aria-label="Bệnh viện đa khoa khu vực Đắk Hà — Cơ sở vật chất hiện đại"></div>
          <div class="slide-overlay" aria-hidden="true"></div>
          <!-- <div class="container">
            <div class="slide-content">
              <div class="slide-tag">Chào mừng đến với Bệnh viện đa khoa khu vực Đắk Hà</div>
              <h1 class="slide-title">
                Chăm sóc sức khỏe toàn diện<br>
                <mark style="background:none;color:#7dd8ff;">cho mọi người dân</mark>
              </h1>
              <p class="slide-desc">
                Đơn vị y tế công lập hàng đầu huyện Đắk Hà, tỉnh Kon Tum — nơi đội ngũ
                y bác sĩ tận tâm, trang thiết bị hiện đại cùng dịch vụ khám chữa bệnh đa khoa phục vụ nhân dân.
              </p>
              <div class="slide-cta">
                <a href="pages/dat-lich.html" class="btn btn-accent btn-lg" id="hero-btn-datlich">
                  <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" aria-hidden="true">
                    <rect x="3" y="4" width="18" height="18" rx="2" ry="2"/>
                    <line x1="16" y1="2" x2="16" y2="6"/>
                    <line x1="8" y1="2" x2="8" y2="6"/>
                    <line x1="3" y1="10" x2="21" y2="10"/>
                  </svg>
                  Đăng nhập ngay
                </a>
                <a href="pages/dich-vu-y-te.html" class="btn btn-ghost btn-lg" id="hero-btn-dichvu">
                  Xem dịch vụ y tế
                  <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" aria-hidden="true">
                    <polyline points="9 18 15 12 9 6"/>
                  </svg>
                </a>
              </div>
            </div>
          </div> -->
        </article>

        <!-- Slide 2 -->
        <article class="slide" role="group" aria-roledescription="slide" aria-label="Slide 2 / 3">
          <div class="slide-bg" style="background-image: url('<?php echo XC_URL;?>/template/frontend/assets/images/banner-02.jpg');" role="img" aria-label="Cơ sở hạ tầng và trang thiết bị y tế hiện đại"></div>
          <div class="slide-overlay" aria-hidden="true"></div>
          <div class="container">
            <div class="slide-content">
              <div class="slide-tag">Cơ sở vật chất hiện đại</div>
              <h2 class="slide-title" style="font-size:clamp(1.75rem,4vw,2.75rem);font-weight:800;line-height:1.2;color:#fff;">
                Trang thiết bị y tế<br>
                <mark style="background:none;color:#7dd8ff;">tiên tiến hàng đầu</mark>
              </h2>
              <p class="slide-desc">
                Hệ thống máy chẩn đoán hình ảnh, xét nghiệm, phẫu thuật hiện đại —
                đảm bảo chẩn đoán chính xác và điều trị hiệu quả cho bệnh nhân.
              </p>
              <div class="slide-cta">
                <a href="pages/gioi-thieu.html" class="btn btn-primary btn-lg" id="hero-btn-gioithieu">Tìm hiểu thêm</a>
                <a href="pages/lien-he.html" class="btn btn-ghost btn-lg" id="hero-btn-lienhe">Liên hệ ngay</a>
              </div>
            </div>
          </div>
        </article>

        <!-- Slide 3 -->
        <article class="slide" role="group" aria-roledescription="slide" aria-label="Slide 3 / 3">
          <div class="slide-bg" style="background-image: url('<?php echo XC_URL;?>/template/frontend/assets/images/banner-03.jpg');" role="img" aria-label="Đội ngũ y tế phục vụ cộng đồng huyện Đắk Hà"></div>
          <div class="slide-overlay" aria-hidden="true"></div>
          <div class="container">
            <div class="slide-content">
              <div class="slide-tag">Y tế cộng đồng</div>
              <h2 class="slide-title" style="font-size:clamp(1.75rem,4vw,2.75rem);font-weight:800;line-height:1.2;color:#fff;">
                Vì sức khỏe cộng đồng<br>
                <mark style="background:none;color:#7dd8ff;">vùng cao Tây Nguyên</mark>
              </h2>
              <p class="slide-desc">
                Chúng tôi đẩy mạnh công tác y tế dự phòng, tuyên truyền phòng chống dịch bệnh và
                chăm sóc sức khỏe ban đầu cho đồng bào các dân tộc thiểu số.
              </p>
              <div class="slide-cta">
                <a href="pages/tin-tuc.html?cat=cong-dong" class="btn btn-accent btn-lg" id="hero-btn-ytecongdong">Tin y tế cộng đồng</a>
                <a href="pages/hoat-dong.html" class="btn btn-ghost btn-lg" id="hero-btn-hoatdong">Hoạt động của chúng tôi</a>
              </div>
            </div>
          </div>
        </article>

        <!-- Controls -->
        <button class="slider-prev" id="slider-prev" aria-label="Slide trước">
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" aria-hidden="true">
            <polyline points="15 18 9 12 15 6"/>
          </svg>
        </button>
        <button class="slider-next" id="slider-next" aria-label="Slide tiếp theo">
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" aria-hidden="true">
            <polyline points="9 18 15 12 9 6"/>
          </svg>
        </button>

        <!-- Dots -->
        <div class="slider-dots" role="tablist" aria-label="Chọn slide">
          <button class="slider-dot active" id="dot-0" role="tab" aria-selected="true"  aria-label="Slide 1" aria-controls="slide-1"></button>
          <button class="slider-dot"        id="dot-1" role="tab" aria-selected="false" aria-label="Slide 2" aria-controls="slide-2"></button>
          <button class="slider-dot"        id="dot-2" role="tab" aria-selected="false" aria-label="Slide 3" aria-controls="slide-3"></button>
        </div>

      </div><!-- /slider-wrapper -->
    </section>
