<?php

require_once 'header.php';

?>
<div id="home-design">
<main id="main-content" class="home-flow">

    <!-- 2. THANH ĐẶT LỊCH KHÁM NHANH (QUICK BOOKING BAR) -->
    <section id="dat-lich-nhanh" class="relative z-30 <?php echo !empty($siteSlides) ? '-mt-16 sm:-mt-20' : 'mt-8'; ?> container" data-reveal>
      <div class="bg-white rounded-3xl shadow-floating border border-medical-100 p-6 sm:p-8">
        <div class="flex flex-wrap items-center justify-between gap-3 mb-5 pb-4 border-b border-slate-100">
          <div class="flex items-center gap-3">
            <div class="w-10 h-10 rounded-xl bg-medical-700 text-white flex items-center justify-center shadow-sm">
              <i class="fa-regular fa-calendar-check text-lg"></i>
            </div>
            <div>
              <h2 class="font-extrabold text-lg sm:text-xl text-medical-900">ĐẶT LỊCH KHÁM NHANH TRỰC TUYẾN</h2>
              <p class="text-xs sm:text-sm text-slate-500">Điền đủ thông tin đăng ký. Bệnh viện sẽ liên hệ xác nhận lịch khám.</p>
            </div>
          </div>
          <span class="text-xs font-bold text-medical-700 bg-medical-50 px-3.5 py-1.5 rounded-full border border-medical-200">
            <i class="fa-solid fa-phone-volume mr-1"></i> Hotline: <?php echo $siteEsc($siteContact['hotline']); ?>
          </span>
        </div>

        <form id="quick-booking-form" data-quick-appointment method="post" action="<?php echo XC_URL; ?>/api/submitQuickAppointment" onsubmit="submitQuickBooking(event)" class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-5 gap-4" novalidate>
          <div>
            <label for="booking-name" class="block text-xs font-bold text-slate-600 uppercase mb-1.5">Họ và tên *</label>
            <input type="text" id="booking-name" name="full_name" required minlength="2" maxlength="120" autocomplete="name" aria-describedby="booking-error-full_name" placeholder="Nhập họ và tên..." class="w-full px-3.5 py-3 rounded-xl bg-pearl-soft border border-slate-200 focus:border-medical-700 focus:bg-white focus:outline-none text-sm" />
            <p id="booking-error-full_name" class="booking-field-error" aria-live="polite"></p>
          </div>

          <div>
            <label for="booking-citizen-id" class="block text-xs font-bold text-slate-600 uppercase mb-1.5">Căn cước công dân *</label>
            <input type="text" id="booking-citizen-id" name="citizen_id" required inputmode="numeric" pattern="[0-9]{12}" minlength="12" maxlength="12" aria-describedby="booking-error-citizen_id" placeholder="Nhập 12 chữ số CCCD..." class="w-full px-3.5 py-3 rounded-xl bg-pearl-soft border border-slate-200 focus:border-medical-700 focus:bg-white focus:outline-none text-sm" />
            <p id="booking-error-citizen_id" class="booking-field-error" aria-live="polite"></p>
          </div>

          <div>
            <label for="booking-phone" class="block text-xs font-bold text-slate-600 uppercase mb-1.5">Số điện thoại *</label>
            <input type="tel" id="booking-phone" name="phone" required maxlength="13" autocomplete="tel" aria-describedby="booking-error-phone" placeholder="Nhập số điện thoại..." class="w-full px-3.5 py-3 rounded-xl bg-pearl-soft border border-slate-200 focus:border-medical-700 focus:bg-white focus:outline-none text-sm" />
            <p id="booking-error-phone" class="booking-field-error" aria-live="polite"></p>
          </div>

          <div>
            <label for="booking-date" class="block text-xs font-bold text-slate-600 uppercase mb-1.5">Ngày khám *</label>
            <input type="date" id="booking-date" name="exam_date" required min="<?php echo QuickAppointment::today(); ?>" aria-describedby="booking-error-exam_date" class="w-full px-3.5 py-3 rounded-xl bg-pearl-soft border border-slate-200 focus:border-medical-700 focus:bg-white focus:outline-none text-sm font-medium" />
            <p id="booking-error-exam_date" class="booking-field-error" aria-live="polite"></p>
          </div>

          <div class="flex items-end">
            <button type="submit" class="w-full h-[46px] rounded-xl bg-medical-gradient hover:opacity-95 text-white font-bold text-sm shadow-md transition flex items-center justify-center gap-2">
              <i class="fa-solid fa-paper-plane"></i>
              <span>GỬI ĐĂNG KÝ</span>
            </button>
          </div>
        </form>
        <p id="booking-error-summary" class="booking-field-error" role="alert"></p>
      </div>
    </section>

    <!-- 2.5. SECTION GIỚI THIỆU BỆNH VIỆN (PHÍA TRÊN GIÁ TRỊ CỐT LÕI) -->
    <section id="gioi-thieu-benh-vien" class="pt-16 sm:pt-24 pb-14 section-pearl"><div class="container">
      <div class="grid grid-cols-1 lg:grid-cols-12 gap-10 lg:gap-12 items-center">
        <!-- Cột trái: Tổ hợp hình ảnh & Huy hiệu nổi -->
        <div class="lg:col-span-6 relative" data-reveal>
          <div class="relative rounded-3xl overflow-hidden border-4 border-white shadow-floating bg-medical-100">
            <img src="https://images.unsplash.com/photo-1586773860418-d37222d8fce3?auto=format&fit=crop&w=1000&q=80" width="1000" height="750" loading="lazy" decoding="async"
                 onerror="this.onerror=null;this.src='https://placehold.co/800x600/0056b3/ffffff?text=Benh+Vien+Da+Khoa+Khu+Vuc+Dak+Ha'"
                 alt="Toàn cảnh Bệnh viện đa khoa khu vực Đăk Hà"
                 class="w-full h-[360px] sm:h-[450px] object-cover hover:scale-105 transition duration-700" />
            <div class="absolute inset-0 bg-gradient-to-t from-medical-900/75 via-transparent to-transparent"></div>

            <!-- Caption dưới đáy ảnh -->
            <div class="absolute bottom-5 left-5 right-5 flex flex-wrap items-center justify-between gap-3 text-white">
              <div class="flex items-center gap-3">
                <span class="w-11 h-11 rounded-2xl bg-sky-400/25 backdrop-blur-md border border-sky-300/40 flex items-center justify-center text-sky-300 text-lg">
                  <i class="fa-solid fa-hospital"></i>
                </span>
                <div>
                  <span class="text-[11px] uppercase tracking-wider text-sky-200 font-bold block">Đơn vị y tế công lập</span>
                  <p class="font-bold text-sm sm:text-base">Trực thuộc Sở Y tế tỉnh Quảng Ngãi</p>
                </div>
              </div>
            </div>
          </div>

          <!-- Huy hiệu nổi góc trên trái -->
          <div class="hidden sm:flex absolute -top-5 -left-5 bg-medical-gradient text-white p-4 rounded-2xl shadow-floating border-2 border-white items-center gap-3.5">
            <div class="w-12 h-12 rounded-xl bg-white/15 flex items-center justify-center text-2xl font-extrabold text-sky-200">
              30+
            </div>
            <div>
              <span class="block font-extrabold text-sm leading-tight">Năm Hình Thành</span>
              <span class="block text-[11px] text-sky-200">&amp; Phát Triển Bền Vững</span>
            </div>
          </div>

          <!-- Thẻ nổi góc dưới phải: Sẵn sàng cấp cứu & Chẩn đoán kỹ thuật cao -->
          <div class="mt-4 sm:mt-0 sm:absolute -bottom-6 -right-4 bg-white rounded-2xl p-4 shadow-floating border border-medical-100 max-w-xs flex items-center gap-3.5">
            <div class="w-12 h-12 rounded-2xl bg-emerald-50 text-emerald-600 flex items-center justify-center text-xl shrink-0">
              <i class="fa-solid fa-shield-heart"></i>
            </div>
            <div>
              <div class="flex items-center gap-1.5">
                <span class="w-2 h-2 rounded-full bg-emerald-500 animate-ping"></span>
                <span class="text-[11px] font-bold uppercase text-emerald-700">Tiếp đón &amp; Cấp cứu 24/7</span>
              </div>
              <p class="text-xs font-bold text-medical-900 mt-0.5">Khám BHYT thông tuyến</p>
            </div>
          </div>
        </div>

        <!-- Cột phải: Nội dung giới thiệu & 4 Bộ đếm số liệu -->
        <div class="lg:col-span-6 space-y-5" data-reveal>
          <div class="inline-flex items-center gap-2 px-3.5 py-1.5 rounded-full bg-medical-50 border border-medical-200 text-medical-700 text-xs font-bold uppercase tracking-widest">
            <i class="fa-solid fa-staff-snake"></i>
            <span>VỀ CHÚNG TÔI</span>
          </div>

          <h3 class="font-extrabold text-2xl sm:text-3xl lg:text-4xl text-medical-900 leading-tight">
            BỆNH VIỆN ĐA KHOA KHU VỰC ĐĂK HÀ — <span class="text-medical-700">Nơi gửi trọn niềm tin sức khỏe</span>
          </h3>

          <p class="text-slate-600 text-sm sm:text-base leading-relaxed">
            Là đơn vị sự nghiệp y tế công lập trọng điểm khu vực trực thuộc Sở Y tế, <strong>Bệnh viện đa khoa khu vực Đăk Hà</strong> đảm nhận sứ mệnh khám chữa bệnh, cấp cứu 24/7 và chăm sóc sức khỏe toàn diện cho nhân dân huyện Đăk Hà cùng các địa phương lân cận.
          </p>

          <p class="text-slate-600 text-sm sm:text-base leading-relaxed">
            Với phương châm <strong>“Tận tâm – Chuẩn mực – Hiện đại”</strong>, Bệnh viện không ngừng đầu tư đồng bộ hệ thống trang thiết bị chẩn đoán hình ảnh, xét nghiệm tự động thế hệ mới, đẩy mạnh chuyển đổi số toàn diện và quy tụ đội ngũ y bác sĩ giàu y đức, chuyên môn sâu.
          </p>

          <!-- 4 Ô thống kê năng lực (Animated Counter khi Scroll) -->
          <div id="about-stats-counter" class="grid grid-cols-2 sm:grid-cols-4 gap-3.5 pt-2">
            <div class="bg-white p-4 rounded-2xl border border-medical-100 shadow-pearl text-center">
              <div class="text-2xl sm:text-3xl font-extrabold text-medical-700">
                <span data-about-count="150">0</span>+
              </div>
              <span class="block text-[11px] sm:text-xs font-semibold text-slate-600 mt-1">Giường bệnh nội trú</span>
            </div>

            <div class="bg-white p-4 rounded-2xl border border-medical-100 shadow-pearl text-center">
              <div class="text-2xl sm:text-3xl font-extrabold text-medical-700">
                <span data-about-count="10">0</span>+
              </div>
              <span class="block text-[11px] sm:text-xs font-semibold text-slate-600 mt-1">Khoa &amp; Phòng chức năng</span>
            </div>

            <div class="bg-white p-4 rounded-2xl border border-medical-100 shadow-pearl text-center">
              <div class="text-2xl sm:text-3xl font-extrabold text-medical-700">
                <span data-about-count="90">0</span>+
              </div>
              <span class="block text-[11px] sm:text-xs font-semibold text-slate-600 mt-1">Y bác sĩ &amp; Nhân sự</span>
            </div>

            <div class="bg-white p-4 rounded-2xl border border-medical-100 shadow-pearl text-center">
              <div class="text-2xl sm:text-3xl font-extrabold text-medical-700">
                <span data-about-count="30">0</span>K+
              </div>
              <span class="block text-[11px] sm:text-xs font-semibold text-slate-600 mt-1">Lượt khám mỗi năm</span>
            </div>
          </div>

          <!-- CTA Buttons -->
          <div class="flex flex-wrap items-center gap-3.5 pt-2">
            <a href="<?php echo XC_URL; ?>/trang/gioi-thieu.html" class="px-6 py-3.5 rounded-xl bg-medical-gradient hover:opacity-95 text-white font-bold text-xs sm:text-sm shadow-md transition flex items-center gap-2">
              <span>Tìm hiểu chi tiết</span>
              <i class="fa-solid fa-arrow-right"></i>
            </a>
          </div>
        </div>
      </div>
    </div>
    </section>

    <!-- 3. VỀ CHÚNG TÔI & 5 GIÁ TRỊ CỐT LÕI (BỐ CỤC THIỆN NHÂN HOSPITAL) -->
    <section id="gia-tri-cot-loi" class="py-16 sm:py-24 section-mist"><div class="container-fluid">
      <div class="text-center max-w-3xl mx-auto mb-12" data-reveal>
        <h2 class="text-xs font-bold uppercase tracking-widest text-medical-700 bg-medical-50 px-3.5 py-1.5 rounded-full border border-medical-200">
         5 GIÁ TRỊ CỐT LÕI
      </h2>
        <p class="text-slate-600 text-sm sm:text-base mt-2">
          Lấy người bệnh làm trung tâm, chuẩn hóa chất lượng chẩn đoán và điều trị toàn diện
        </p>
      </div>

      <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-5 gap-5" data-stagger-group>
        <!-- Giá trị 1 -->
        <div data-reveal class="bg-white rounded-3xl p-6 border border-medical-100 shadow-pearl hover:shadow-pearl-hover hover:-translate-y-2 transition duration-300 group">
          <div class="flex justify-between items-start mb-4">
            <div class="w-13 h-13 p-3.5 rounded-2xl bg-medical-50 group-hover:bg-medical-700 text-medical-700 group-hover:text-white transition">
              <i class="fa-solid fa-heart-circle-check text-2xl"></i>
            </div>
            <span class="font-extrabold text-3xl text-slate-200 group-hover:text-medical-300 transition">01</span>
          </div>
          <h3 class="font-bold text-lg text-medical-900 mb-2">Điều trị hiệu quả</h3>
          <p class="text-slate-600 text-xs sm:text-sm leading-relaxed">
            Áp dụng phác đồ điều trị chuẩn Bộ Y tế và hội chẩn chuyên môn sâu giúp phục hồi sức khỏe nhanh chóng.
          </p>
        </div>

        <!-- Giá trị 2 -->
        <div data-reveal class="bg-white rounded-3xl p-6 border border-medical-100 shadow-pearl hover:shadow-pearl-hover hover:-translate-y-2 transition duration-300 group">
          <div class="flex justify-between items-start mb-4">
            <div class="w-13 h-13 p-3.5 rounded-2xl bg-medical-50 group-hover:bg-medical-700 text-medical-700 group-hover:text-white transition">
              <i class="fa-solid fa-comments text-2xl"></i>
            </div>
            <span class="font-extrabold text-3xl text-slate-200 group-hover:text-medical-300 transition">02</span>
          </div>
          <h3 class="font-bold text-lg text-medical-900 mb-2">Tư vấn kỹ càng</h3>
          <p class="text-slate-600 text-xs sm:text-sm leading-relaxed">
            Bác sĩ giải thích tận tình nguyên nhân bệnh lý, phác đồ điều trị và hướng dẫn dinh dưỡng dự phòng.
          </p>
        </div>

        <!-- Giá trị 3 -->
        <div data-reveal class="bg-white rounded-3xl p-6 border border-medical-100 shadow-pearl hover:shadow-pearl-hover hover:-translate-y-2 transition duration-300 group">
          <div class="flex justify-between items-start mb-4">
            <div class="w-13 h-13 p-3.5 rounded-2xl bg-medical-50 group-hover:bg-medical-700 text-medical-700 group-hover:text-white transition">
              <i class="fa-solid fa-crosshairs text-2xl"></i>
            </div>
            <span class="font-extrabold text-3xl text-slate-200 group-hover:text-medical-300 transition">03</span>
          </div>
          <h3 class="font-bold text-lg text-medical-900 mb-2">Chẩn đoán chính xác</h3>
          <p class="text-slate-600 text-xs sm:text-sm leading-relaxed">
            Hệ thống X-quang &amp; Xét nghiệm – Chẩn đoán chính xác
          </p>
        </div>

        <!-- Giá trị 4 -->
        <div data-reveal class="bg-white rounded-3xl p-6 border border-medical-100 shadow-pearl hover:shadow-pearl-hover hover:-translate-y-2 transition duration-300 group">
          <div class="flex justify-between items-start mb-4">
            <div class="w-13 h-13 p-3.5 rounded-2xl bg-medical-50 group-hover:bg-medical-700 text-medical-700 group-hover:text-white transition">
              <i class="fa-solid fa-bolt text-2xl"></i>
            </div>
            <span class="font-extrabold text-3xl text-slate-200 group-hover:text-medical-300 transition">04</span>
          </div>
          <h3 class="font-bold text-lg text-medical-900 mb-2">Thủ tục nhanh chóng</h3>
          <p class="text-slate-600 text-xs sm:text-sm leading-relaxed">
            Đăng ký khám bằng CCCD gắn chip/VNeID, đặt hẹn trực tuyến và trả kết quả xét nghiệm nhanh gọn.
          </p>
        </div>

        <!-- Giá trị 5 -->
        <div data-reveal class="bg-white rounded-3xl p-6 border border-medical-100 shadow-pearl hover:shadow-pearl-hover hover:-translate-y-2 transition duration-300 group sm:col-span-2 lg:col-span-1">
          <div class="flex justify-between items-start mb-4">
            <div class="w-13 h-13 p-3.5 rounded-2xl bg-medical-50 group-hover:bg-medical-700 text-medical-700 group-hover:text-white transition">
              <i class="fa-solid fa-hand-holding-dollar text-2xl"></i>
            </div>
            <span class="font-extrabold text-3xl text-slate-200 group-hover:text-medical-300 transition">05</span>
          </div>
          <h3 class="font-bold text-lg text-medical-900 mb-2">Chi phí hợp lý nhất</h3>
          <p class="text-slate-600 text-xs sm:text-sm leading-relaxed">
            Niêm yết viện phí công khai, thanh toán Bảo hiểm Y tế thông tuyến đảm bảo tối đa quyền lợi người bệnh.
          </p>
        </div>
      </div>
    </div>
    </section>

    <!-- ============================================================
         3.5. DẤU ẤN CHUYỂN ĐỔI SỐ (SMART HUB TURBINE - PHÍA DƯỚI GIÁ TRỊ CỐT LÕI)
         ============================================================ -->
    <section id="dau-an-chuyen-doi-so" class="relative pearl-tech-bg overflow-hidden" data-reveal>
      <!-- Thanh điều khiển trực quan (Interactive Control Bar) -->
      <div class="bg-white/85 backdrop-blur-md border-b border-slate-200/80 shadow-sm">
      </div>

      <!-- Nội dung chính Smart Hub Turbine -->
      <div class="relative py-12 lg:py-16 flex flex-col justify-center">
        <!-- Lớp lưới công nghệ mờ trên nền trắng ngọc -->
        <div class="absolute inset-0 tech-grid-overlay pointer-events-none"></div>

        <div class="container w-full relative z-10">

          <!-- 1. HEADER TIÊU ĐỀ SANG TRỌNG -->
          <div class="text-center max-w-3xl mx-auto mb-6 lg:mb-4">
            <div class="inline-flex items-center gap-2 px-4 py-1.5 rounded-full bg-white/90 border border-sapphire-200 shadow-sm mb-3">
              <span class="w-2 h-2 rounded-full bg-accent"></span>
              <span class="text-xs font-extrabold uppercase tracking-widest text-sapphire">
                Hệ Sinh Thái Y Tế Số Toàn Diện
              </span>
            </div>
            <h2 class="text-2xl sm:text-4xl lg:text-[40px] font-extrabold text-sapphire-dark tracking-tight uppercase leading-tight">
              DẤU ẤN CHUYỂN ĐỔI SỐ
            </h2>
          </div>

          <!-- 3. KHU VỰC QUẠT GIÓ XOAY TRÒN (DESKTOP TURBINE STAGE - lg trở lên) -->
          <div class="hidden lg:flex items-center justify-center relative my-2">
            <div id="turbineWrapper" class="relative w-[960px] h-[880px] flex items-center justify-center select-none">

              <!-- Vòng hào quang nền tĩnh phía sau -->
              <div class="absolute w-[740px] h-[740px] rounded-full border border-sapphire-200/50 pointer-events-none"></div>
              <div class="absolute w-[520px] h-[520px] rounded-full border border-dashed border-cyber-light/40 pointer-events-none"></div>

              <!-- 3.1. LỚP SVG ĐƯỜNG KẾT NỐI XOAY ĐỒNG BỘ CÙNG CÁNH QUẠT -->
              <svg id="connectionsSvg" viewBox="0 0 960 880" class="absolute inset-0 w-full h-full pointer-events-none z-10 overflow-visible">
                <defs>
                  <linearGradient id="spokeGrad" x1="0%" y1="0%" x2="100%" y2="100%">
                    <stop offset="0%" stop-color="#0284c7" stop-opacity="0.85" />
                    <stop offset="60%" stop-color="#38bdf8" stop-opacity="0.55" />
                    <stop offset="100%" stop-color="#1760a5" stop-opacity="0.9" />
                  </linearGradient>

                  <linearGradient id="spokeActiveGrad" x1="0%" y1="0%" x2="100%" y2="100%">
                    <stop offset="0%" stop-color="#e36928" stop-opacity="1" />
                    <stop offset="50%" stop-color="#0284c7" stop-opacity="0.95" />
                    <stop offset="100%" stop-color="#e36928" stop-opacity="1" />
                  </linearGradient>

                  <filter id="glowLine" x="-20%" y="-20%" width="140%" height="140%">
                    <feGaussianBlur stdDeviation="3" result="blur" />
                    <feComposite in="SourceGraphic" in2="blur" operator="over" />
                  </filter>
                </defs>

                <!-- Nhóm toàn bộ cánh quạt, lưới đa giác & đường kết nối xoay quanh tâm (480, 440) -->
                <g id="svgRotatingGroup">
                  <polygon id="outerWebPolygon" points="" fill="none" stroke="#bae0fd" stroke-width="1.5" stroke-dasharray="5 5" opacity="0.85" />
                  <circle cx="480" cy="440" r="335" fill="none" stroke="#7dd3fc" stroke-width="1.2" stroke-opacity="0.5" />
                  <circle cx="480" cy="440" r="215" fill="none" stroke="#93c5fd" stroke-width="1" stroke-dasharray="3 6" stroke-opacity="0.65" />

                  <g id="turbineBladesGroup"></g>
                  <g id="spokesGroup"></g>
                  <g id="pulsesGroup"></g>
                </g>
              </svg>

              <!-- 3.2. TRUNG TÂM SMART HUB (ĐỨNG YÊN VỮNG CHÃI Ở TÂM) -->
              <div class="relative z-30 w-[236px] h-[236px] rounded-full flex items-center justify-center">
                <!-- Sóng lan tỏa Sonar -->
                <div class="absolute inset-0 rounded-full border-2 border-cyber-light/40 hub-sonar pointer-events-none"></div>
                <div class="absolute inset-0 rounded-full border border-sapphire/30 hub-sonar-delay pointer-events-none"></div>

                <!-- Vòng vỏ ngọc trai lớn bên ngoài Smart Hub -->
                <div class="w-full h-full rounded-full smart-hub-shell p-3.5 flex items-center justify-center relative border-2 border-white">

                  <!-- Vòng HUD công nghệ xoay chiều kim đồng hồ -->
                  <svg viewBox="0 0 220 220" class="absolute inset-1.5 w-[calc(100%-12px)] h-[calc(100%-12px)] hud-ring-cw pointer-events-none">
                    <circle cx="110" cy="110" r="102" fill="none" stroke="#0284c7" stroke-width="2" stroke-dasharray="18 10 4 10" stroke-opacity="0.45" />
                    <circle cx="110" cy="110" r="95" fill="none" stroke="#1760a5" stroke-width="1" stroke-dasharray="4 8" stroke-opacity="0.3" />
                  </svg>

                  <!-- Vòng HUD công nghệ xoay ngược chiều kim đồng hồ -->
                  <svg viewBox="0 0 220 220" class="absolute inset-3 w-[calc(100%-24px)] h-[calc(100%-24px)] hud-ring-ccw pointer-events-none">
                    <circle cx="110" cy="110" r="88" fill="none" stroke="#38bdf8" stroke-width="2.5" stroke-dasharray="32 22" stroke-opacity="0.6" />
                  </svg>

                  <!-- Lõi Xanh Sapphire phát sáng chứa nội dung SMART HUB -->
                  <div onclick="openHubOverviewModal()" class="w-[168px] h-[168px] rounded-full smart-hub-core text-white flex flex-col items-center justify-center text-center p-4 relative cursor-pointer group transition-transform duration-300 hover:scale-105 border-2 border-sky-200/80">
                    <div class="w-11 h-11 rounded-2xl bg-white/15 backdrop-blur-sm border border-white/30 flex items-center justify-center mb-1.5 shadow-inner group-hover:bg-accent group-hover:border-white transition-colors">
                      <i id="centerHubIcon" class="fa-solid fa-hospital-user text-2xl text-sky-100 group-hover:text-white"></i>
                    </div>
                    <span class="text-[10px] font-extrabold uppercase tracking-[0.2em] text-sky-200">
                      Bệnh viện
                    </span>
                    <h3 class="text-lg font-black tracking-tight text-white leading-none my-0.5">
                     Thông minh
                    </h3>
                    <span id="centerHubSub" class="text-[10px] font-semibold text-sky-100/90 mt-1">
                      Kết nối: HIS
                    </span>
                  </div>
                </div>
              </div>

              <!-- 3.3. 8 BOX DẤU ẤN CHUYỂN ĐỔI SỐ XOAY QUANH SMART HUB -->
              <div id="nodesContainer" class="absolute inset-0 pointer-events-none z-20"></div>

            </div>
          </div>

          <!-- 4. GIAO DIỆN MOBILE & TABLET (SMART HUB VERTICAL NETWORK - < lg) -->
          <div class="lg:hidden mt-6">
            <div onclick="openHubOverviewModal()" class="pearl-card rounded-3xl p-5 mb-6 border-2 border-sapphire-200 text-center relative overflow-hidden cursor-pointer">
              <div class="w-16 h-16 rounded-2xl smart-hub-core text-white flex items-center justify-center mx-auto mb-3 shadow-lg">
                <i class="fa-solid fa-hospital-user text-2xl"></i>
              </div>
              <h3 class="text-xl font-black text-sapphire-dark mt-0.5">
                Bệnh viện thông minh
              </h3>
            </div>

            <div id="mobileNodesContainer" class="relative pl-6 sm:pl-8 space-y-4 before:content-[''] before:absolute before:left-2.5 sm:before:left-3.5 before:top-3 before:bottom-3 before:w-0.5 before:bg-gradient-to-b before:from-sapphire before:via-cyber-light before:to-accent"></div>
          </div>

        </div>
      </div>

      <!-- MODAL CHI TIẾT DẤU ẤN & BÁO CÁO SMART HUB -->
      <div id="milestoneModal" class="hidden fixed inset-0 z-[70] items-center justify-center p-4 sm:p-6" role="dialog" aria-modal="true" aria-labelledby="modalTitle">
        <div class="absolute inset-0 bg-slate-900/60 backdrop-blur-sm" onclick="closeModal()"></div>
        <div class="relative w-full max-w-xl bg-white rounded-3xl shadow-2xl border border-sapphire-100 p-6 sm:p-8 z-10">
          <div class="flex items-start justify-between gap-4 pb-4 mb-4 border-b border-slate-100">
            <div class="flex items-center gap-3.5">
              <div class="w-12 h-12 rounded-2xl smart-hub-core text-white flex items-center justify-center shadow-md shrink-0">
                <i id="modalIcon" class="fa-solid fa-hospital-user text-xl"></i>
              </div>
              <div>
                <span id="modalCodeBadge" class="inline-block text-[11px] font-extrabold uppercase tracking-wider px-2.5 py-0.5 rounded-full bg-sapphire-50 text-sapphire border border-sapphire-200">
                  DẤU ẤN #HIS
                </span>
                <h3 id="modalTitle" class="text-lg sm:text-xl font-extrabold text-sapphire-dark mt-1">
                  HỆ THỐNG HIS THÔNG MINH
                </h3>
              </div>
            </div>
            <button type="button" onclick="closeModal()" aria-label="Đóng" class="w-9 h-9 rounded-full bg-slate-100 hover:bg-slate-200 text-slate-600 flex items-center justify-center transition">
              <i class="fa-solid fa-xmark"></i>
            </button>
          </div>

          <p id="modalDescription" class="text-sm text-slate-600 leading-relaxed mb-5"></p>

          <div id="modalMetricsList" class="grid grid-cols-1 sm:grid-cols-2 gap-2.5 mb-6"></div>

          <div class="flex justify-end">
            <button type="button" onclick="closeModal()" class="px-6 py-2.5 rounded-xl bg-sapphire hover:bg-sapphire-dark text-white font-bold text-xs sm:text-sm transition">
              Đóng
            </button>
          </div>
        </div>
      </div>
    </section>

    <!-- 5. HỆ THỐNG CHUYÊN KHOA MŨI NHỌN -->
    <?php
    $resolveSpecialtyVisual = function ($departmentName, $departmentImage) {
      $image = trim((string)$departmentImage);
      $nameLower = mb_strtolower(trim((string)$departmentName), 'UTF-8');

      // Kiểm tra nếu đã có file hình ảnh hợp lệ trong uploads/images/
      if ($image !== '' && !preg_match('/\bfa-[a-z0-9-]+\b/i', $image)) {
        $candidatePath = __SITE_PATH . '/uploads/images/' . ltrim($image, '/');
        if (is_file($candidatePath)) {
          return array('file' => $image, 'desc' => 'Khám, chẩn đoán và điều trị chuyên sâu với đội ngũ y bác sĩ giàu kinh nghiệm.');
        }
      }

      // Ánh xạ hình ảnh chuyên khoa phù hợp theo tên khoa/phòng
      if (mb_strpos($nameLower, 'cấp cứu') !== false || mb_strpos($nameLower, 'khám bệnh') !== false || mb_strpos($nameLower, 'hồi sức') !== false) {
        return array(
          'file' => 'khoa-cap-cuu-hoi-suc.svg',
          'desc' => 'Tiếp đón khám bệnh đa khoa, trực cấp cứu 24/7, hồi sức tích cực, chống độc và điều trị liên chuyên khoa.'
        );
      }
      if (mb_strpos($nameLower, 'nội tổng hợp') !== false || mb_strpos($nameLower, 'nhi') !== false || mb_strpos($nameLower, 'truyền nhiễm') !== false) {
        return array(
          'file' => 'khoa-noi-nhi-truyen-nhiem.svg',
          'desc' => 'Khám và điều trị bệnh lý nội khoa tổng hợp, chăm sóc bệnh nhi, tư vấn dinh dưỡng và kiểm soát bệnh truyền nhiễm.'
        );
      }
      if (mb_strpos($nameLower, 'ngoại') !== false && (mb_strpos($nameLower, 'sản') !== false || mb_strpos($nameLower, 'phụ') !== false)) {
        return array(
          'file' => 'khoa-ngoai-phu-san.svg',
          'desc' => 'Thực hiện phẫu thuật, thủ thuật ngoại khoa và chăm sóc sức khỏe thai sản, sản phụ khoa an toàn toàn diện.'
        );
      }
      if (mb_strpos($nameLower, 'y học cổ truyền') !== false || mb_strpos($nameLower, 'phục hồi chức năng') !== false) {
        return array(
          'file' => 'khoa-yhct-phcn.svg',
          'desc' => 'Kết hợp tinh hoa Y học cổ truyền với vật lý trị liệu, phục hồi chức năng vận động chuyên sâu.'
        );
      }
      if (mb_strpos($nameLower, 'cận lâm sàng') !== false || mb_strpos($nameLower, 'kiểm soát nhiễm khuẩn') !== false || mb_strpos($nameLower, 'xét nghiệm') !== false) {
        return array(
          'file' => is_file(__SITE_PATH . '/uploads/images/khoa-can-lam-sang-ksnk.svg') ? 'khoa-can-lam-sang-ksnk.svg' : 'cls1.png',
          'desc' => 'Hệ thống xét nghiệm sinh hóa – huyết học tự động, chẩn đoán hình ảnh kỹ thuật số và kiểm soát nhiễm khuẩn.'
        );
      }
      if (mb_strpos($nameLower, 'dược') !== false || mb_strpos($nameLower, 'vật tư') !== false || mb_strpos($nameLower, 'thiết bị') !== false) {
        return array(
          'file' => 'khoa-duoc-vtyt.svg',
          'desc' => 'Cung ứng đầy đủ thuốc thiết yếu, dược lâm sàng chuẩn mực và quản lý vật tư, trang thiết bị y tế hiện đại.'
        );
      }
      if (mb_strpos($nameLower, 'sản') !== false) {
        return array(
          'file' => 'sankhoa.png',
          'desc' => 'Theo dõi thai kỳ, đỡ sinh an toàn và chăm sóc sức khỏe bà mẹ – trẻ sơ sinh tận tâm.'
        );
      }
      if (mb_strpos($nameLower, 'ngoại') !== false) {
        return array(
          'file' => 'ngoaikhoa.png',
          'desc' => 'Khám, đánh giá chấn thương, xử trí thủ thuật và can thiệp ngoại khoa hiệu quả.'
        );
      }
      if (mb_strpos($nameLower, 'nội') !== false) {
        return array(
          'file' => 'noikhoa.png',
          'desc' => 'Chẩn đoán và điều trị chuyên sâu các bệnh lý tim mạch, hô hấp, tiêu hóa, nội tiết và thần kinh.'
        );
      }

      return array(
        'file' => 'khoa-cap-cuu-hoi-suc.svg',
        'desc' => 'Đáp ứng đầy đủ nhu cầu khám chữa bệnh nội trú, ngoại trú và chăm sóc sức khỏe nhân dân.'
      );
    };
    ?>
    <section id="dich-vu-noi-bat" class="py-16 sm:py-24 bg-pearl-gradient">
      <div class="container">
        <div class="text-center max-w-3xl mx-auto mb-10" data-reveal>
          <h2 class="text-xs font-bold uppercase tracking-widest text-medical-700 bg-medical-50 px-3.5 py-1.5 rounded-full border border-medical-200" style="background:none;">
            CHUYÊN KHOA
          </h2>
          <p class="text-slate-600 text-sm sm:text-base mt-2">
            Hệ thống chuyên khoa đồng bộ, đáp ứng toàn diện nhu cầu khám chữa bệnh và cấp cứu 24/7
          </p>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-7" data-stagger-group>
<?php foreach ($homeDepartments as $department):
 $departmentName = (string)$department->depart_name;
 $specialtyVisual = $resolveSpecialtyVisual($departmentName, $department->depart_image ?? '');
 $departmentImageUrl = $homeAsset($specialtyVisual['file'], 'uploads/images/');
?>
          <article data-reveal data-department-id="<?php echo (int)$department->id; ?>" class="pkg-card bg-white rounded-3xl overflow-hidden border border-medical-100 shadow-pearl hover:shadow-pearl-hover hover:-translate-y-2 transition duration-300 flex flex-col group">
            <div class="relative h-52 overflow-hidden bg-medical-50 flex items-center justify-center p-6">
              <img <?php echo site_image_attributes($departmentImageUrl, '(max-width: 767px) calc(100vw - 40px), (max-width: 1023px) 45vw, 380px', false, true); ?>
                   alt="<?php echo $siteEsc($departmentName); ?>"
                   class="w-full h-full object-contain group-hover:scale-105 transition duration-500" />
            </div>
            <div class="p-6 flex-1 flex flex-col justify-between space-y-4">
              <div>
                <h3 class="font-bold text-lg text-medical-900 leading-snug"><?php echo $siteEsc($departmentName); ?></h3>
                <p class="text-xs sm:text-sm text-slate-600 mt-2 leading-relaxed"><?php echo $siteEsc($specialtyVisual['desc']); ?></p>
              </div>
              <div class="pt-4 border-t border-slate-100 flex items-center justify-between">
                <span class="text-xs font-semibold text-slate-500 flex items-center gap-1.5">
                  <i class="fa-solid fa-circle-check text-emerald-600"></i> Khám BHYT &amp; Dịch vụ
                </span>
                <button type="button" onclick="selectServiceForBooking(<?php echo $siteEsc(json_encode($departmentName, JSON_UNESCAPED_UNICODE)); ?>)" class="text-xs font-bold text-medical-700 hover:text-medical-900 flex items-center gap-1 transition">
                  <span>Đặt lịch khám</span>
                  <i class="fa-solid fa-arrow-right"></i>
                </button>
              </div>
            </div>
          </article>
<?php endforeach; ?>
        </div>
      </div>
    </section>

    <!-- 6. ĐỘI NGŨ CHUYÊN GIA - BÁC SĨ -->
    <section id="doi-ngu-bac-si" class="py-16 sm:py-24">
      <div class="med-team-decoration" aria-hidden="true">
        <span class="med-team-cross med-team-cross-one">+</span>
        <span class="med-team-cross med-team-cross-two">+</span>
        <svg class="med-team-hex" viewBox="0 0 300 240" fill="none" stroke="currentColor" stroke-width="1.5"><path d="M75 20l52 30v60l-52 30-52-30V50z M179 20l52 30v60l-52 30-52-30V50z M127 110l52 30v60l-52 30-52-30v-60z M231 110l52 30v60l-52 30-52-30v-60z"/></svg>
        <svg class="med-team-ecg" viewBox="0 0 1440 110" fill="none" preserveAspectRatio="none"><path d="M0 65H240l18-20 22 35 30-65 32 85 24-35h300l18-20 22 35 30-65 32 85 24-35h300l18-20 22 35 30-65 32 85 24-35h252" stroke="currentColor" stroke-width="2"/></svg>
      </div>
      <div class="container">
        <div class="flex flex-col md:flex-row md:items-end justify-between mb-12 gap-6" data-reveal>
          <div>
            <h3 class="med-team-subtitle text-center">
              Đội Ngũ Y Bác Sĩ
            </h3>
          </div>
          <div class="flex items-center gap-3 self-start md:self-auto">
            <button type="button" onclick="doctorSlide(-1)" aria-label="Bác sĩ trước" class="doc-arrow"><i class="fa-solid fa-arrow-left"></i></button>
            <button type="button" onclick="doctorSlide(1)" aria-label="Bác sĩ tiếp theo" class="doc-arrow"><i class="fa-solid fa-arrow-right"></i></button>
            <a href="<?php echo XC_URL; ?>/trang/bac-si" class="med-team-view-all">
            Xem thêm 
          </a>
          </div>
        </div>

        <div id="doctor-slider" class="doc-viewport" data-reveal aria-roledescription="carousel" aria-label="Đội ngũ y bác sĩ">
          <div id="doctor-track" class="doc-track"></div>
        </div>
      </div>
    </section>

    <!-- ============================================================
         7. HỆ THỐNG TRANG THIẾT BỊ Y TẾ HIỆN ĐẠI (.container-fluid - 6 THẺ)
         ============================================================ -->
    <?php require 'home-equipment.php'; ?>

    <!-- 8. TIN TỨC & SỰ KIỆN -->
    <section id="tin-tuc-noi-bat" class="home-news" aria-labelledby="home-news-heading">
      <div class="container">
        <h2 id="home-news-heading" class="home-news-heading">TIN TỨC NỔI BẬT</h2>
        <div class="home-news-grid">
<?php foreach (array_slice(is_array($home_featured_news ?? null) ? $home_featured_news : array(), 0, 4) as $newsIndex => $news):
 $newsUrl = $this->url->permalink($news->id, 'event_detail');
 $newsImage = $homeAsset($news->thumbnail_url ?? '', 'uploads/events/');
 $newsExcerpt = trim(preg_replace('/\s+/u', ' ', html_entity_decode(strip_tags((string)($news->description ?? '')), ENT_QUOTES, 'UTF-8')));
?>
          <article class="home-news-item<?php echo $newsIndex === 0 ? ' home-news-featured' : ''; ?>" data-reveal>
            <a class="home-news-image" href="<?php echo $siteEsc($newsUrl); ?>" tabindex="-1" aria-hidden="true">
              <img <?php echo site_image_attributes($newsImage, $newsIndex === 0 ? '(max-width: 767px) calc(100vw - 40px), (max-width: 1023px) 46vw, 600px' : '(max-width: 479px) 110px, 180px', false, true); ?> alt="" />
            </a>
            <div class="home-news-copy">
              <h3><a href="<?php echo $siteEsc($newsUrl); ?>"><?php echo $siteEsc($news->title); ?></a></h3>
              <?php if ($newsExcerpt !== ''): ?><p><?php echo $siteEsc($newsExcerpt); ?></p><?php endif; ?>
            </div>
          </article>
<?php endforeach; ?>
        </div>
      </div>
    </section>

  </main>

  <!-- MODAL THÔNG TIN CHI TIẾT CÁN BỘ / BÁC SĨ -->
  <div id="doctor-modal" class="hidden fixed inset-0 z-[70] items-center justify-center p-4 sm:p-6" role="dialog" aria-modal="true" aria-labelledby="dm-heading">
    <div class="absolute inset-0 bg-slate-900/50 backdrop-blur-sm" onclick="closeDoctorModal()"></div>
    <div data-lenis-prevent class="dm-panel relative w-full max-w-4xl max-h-[92vh] overflow-y-auto bg-white rounded-3xl shadow-2xl p-5 sm:p-8">
      <div class="flex items-center justify-between pb-4 mb-5 border-b border-slate-100">
        <h3 id="dm-heading" class="flex items-center gap-3 text-lg sm:text-xl font-bold text-[#0b86c7]">
          <i class="fa-solid fa-id-card text-xl"></i> Thông tin chi tiết
        </h3>
        <button type="button" onclick="closeDoctorModal()" aria-label="Đóng" class="w-10 h-10 rounded-full bg-slate-100 hover:bg-slate-200 text-slate-500 flex items-center justify-center transition">
          <i class="fa-solid fa-xmark"></i>
        </button>
      </div>

      <div class="grid grid-cols-1 md:grid-cols-[260px_1fr] gap-6 md:gap-8">
        <div>
          <div class="rounded-2xl overflow-hidden border border-slate-200 shadow-lg bg-slate-50 aspect-[3/4] max-w-[260px] mx-auto md:max-w-none">
            <img id="dm-photo" src="" alt="" class="w-full h-full object-cover object-top" />
          </div>
          <div id="dm-status" class="mt-4 max-w-[260px] mx-auto md:max-w-none flex items-center justify-center gap-2 py-2.5 rounded-full bg-emerald-50 border border-emerald-200 text-emerald-600 text-sm font-bold">
            <i class="fa-solid fa-circle-check"></i><span id="dm-status-text">Đang công tác</span>
          </div>
        </div>

        <div class="min-w-0">
          <h4 id="dm-name" class="text-2xl sm:text-3xl font-extrabold text-slate-900 leading-tight"></h4>
          <span id="dm-role" class="inline-block mt-3 px-4 py-1.5 rounded-full bg-sky-100 text-sky-800 text-sm font-bold"></span>

          <dl class="mt-5 text-sm sm:text-[15px]">
            <div class="dm-row"><dt><i class="fa-solid fa-building-user"></i>Phòng ban, đơn vị</dt><dd id="dm-dept"></dd></div>
            <div class="dm-row"><dt><i class="fa-solid fa-hospital"></i>Đơn vị công tác</dt><dd id="dm-unit"></dd></div>
            <div class="dm-row"><dt><i class="fa-solid fa-calendar"></i>Ngày sinh</dt><dd id="dm-dob"></dd></div>
            <div class="dm-row"><dt><i class="fa-solid fa-map-location-dot"></i>Quê quán</dt><dd id="dm-home"></dd></div>
            <div class="dm-row"><dt><i class="fa-solid fa-barcode"></i>Mã số</dt><dd id="dm-code"></dd></div>
          </dl>
        </div>
      </div>

      <div class="flex flex-wrap items-center justify-end gap-3 pt-5 mt-6 border-t border-slate-100">
        <button type="button" onclick="closeDoctorModal()" class="px-7 py-2.5 rounded-full bg-slate-50 hover:bg-slate-100 border border-slate-300 text-slate-700 font-bold text-sm transition">Đóng</button>
      </div>
    </div>
  </div>
</div>

<?php require_once 'home-footer.php'; ?>
