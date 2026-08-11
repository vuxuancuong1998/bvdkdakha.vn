<?php require_once 'header.php'; ?>
  <style>
    /* Page-specific styles */
    .page-hero {
      background: linear-gradient(135deg, var(--color-primary-dark) 0%, var(--color-primary) 100%);
      padding: var(--space-16) 0 var(--space-10);
      color: #fff;
      text-align: center;
      position: relative;
      overflow: hidden;
    }
    .page-hero::before {
      content: '';
      position: absolute;
      inset: 0;
      background: url("data:image/svg+xml,%3Csvg width='60' height='60' viewBox='0 0 60 60' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='none' fill-rule='evenodd'%3E%3Cg fill='%23ffffff' fill-opacity='0.04'%3E%3Cpath d='M36 34v-4h-2v4h-4v2h4v4h2v-4h4v-2h-4zm0-30V0h-2v4h-4v2h4v4h2V6h4V4h-4zM6 34v-4H4v4H0v2h4v4h2v-4h4v-2H6zM6 4V0H4v4H0v2h4v4h2V6h4V4H6z'/%3E%3C/g%3E%3C/g%3E%3C/svg%3E");
    }
    .page-hero h1 {
      font-size: var(--font-size-5xl);
      font-weight: 800;
      color: #fff;
      margin-bottom: var(--space-3);
      position: relative;
    }
    .page-hero p {
      color: rgba(255,255,255,.8);
      font-size: var(--font-size-lg);
      position: relative;
    }

    /* Emergency block */
    .emergency-block {
      background: var(--color-danger);
      color: #fff;
      border-radius: var(--radius-xl);
      padding: var(--space-8);
      text-align: center;
      box-shadow: 0 8px 32px rgba(217,48,37,.3);
      margin-bottom: var(--space-8);
    }
    .emergency-block .emg-icon {
      width: 64px; height: 64px;
      background: rgba(255,255,255,.15);
      border-radius: 50%;
      display: flex; align-items: center; justify-content: center;
      margin: 0 auto var(--space-4);
    }
    .emergency-block .emg-icon svg { width: 32px; height: 32px; }
    .emergency-block h2 { font-size: var(--font-size-2xl); font-weight: 800; margin-bottom: var(--space-2); color:#fff; }
    .emergency-block .emg-number {
      font-size: clamp(2rem, 6vw, 3.5rem);
      font-weight: 800;
      letter-spacing: 0.06em;
      display: block;
      color: #fff;
      text-decoration: none;
      transition: opacity var(--transition-fast);
      animation: pulse-badge 2s infinite;
    }
    .emergency-block .emg-number:hover { opacity: .85; }
    .emergency-block p { color: rgba(255,255,255,.85); margin-top: var(--space-2); }

    /* Contact cards */
    .contact-info-grid {
      display: grid;
      grid-template-columns: repeat(3, 1fr);
      gap: var(--space-5);
      margin-bottom: var(--space-8);
    }
    .contact-info-card {
      background: var(--color-bg);
      border-radius: var(--radius-xl);
      padding: var(--space-6);
      box-shadow: var(--shadow-card);
      border: 1px solid var(--color-border-light);
      transition: all var(--transition-normal);
      text-align: center;
    }
    .contact-info-card:hover {
      box-shadow: var(--shadow-hover);
      transform: translateY(-3px);
    }
    .contact-info-card .ci-icon {
      width: 56px; height: 56px;
      border-radius: var(--radius-md);
      background: var(--color-bg-alt);
      display: flex; align-items: center; justify-content: center;
      margin: 0 auto var(--space-4);
      transition: all var(--transition-normal);
    }
    .contact-info-card:hover .ci-icon { background: var(--color-primary); }
    .contact-info-card .ci-icon svg { width: 26px; height: 26px; color: var(--color-primary); }
    .contact-info-card:hover .ci-icon svg { color: #fff; }
    .contact-info-card h3 { font-size: var(--font-size-sm); font-weight: 700; color: var(--color-text-muted); text-transform: uppercase; letter-spacing: .05em; margin-bottom: var(--space-2); }
    .contact-info-card p, .contact-info-card a { font-size: var(--font-size-base); font-weight: 600; color: var(--color-text); line-height: 1.5; }
    .contact-info-card a:hover { color: var(--color-primary); }

    /* Form card */
    .contact-form-card {
      background: var(--color-bg);
      border-radius: var(--radius-xl);
      padding: var(--space-10) var(--space-10);
      box-shadow: var(--shadow-lg);
      border: 1px solid var(--color-border-light);
    }

    .form-success-msg {
      display: none;
      background: #e6f9ee;
      border: 1.5px solid var(--color-accent);
      border-radius: var(--radius-md);
      padding: var(--space-4) var(--space-5);
      color: var(--color-accent-dark);
      font-weight: 600;
      margin-bottom: var(--space-5);
      align-items: center;
      gap: var(--space-3);
    }
    .form-success-msg.show { display: flex; }
    .form-success-msg svg { width: 22px; height: 22px; flex-shrink:0; }

    .contact-layout {
      display: grid;
      grid-template-columns: 1fr 1.2fr;
      gap: var(--space-10);
      align-items: start;
    }

    .hours-table { width: 100%; border-collapse: collapse; margin-top: var(--space-4); font-size: var(--font-size-sm); }
    .hours-table td { padding: var(--space-2) var(--space-3); border-bottom: 1px solid var(--color-border-light); }
    .hours-table tr:last-child td { border-bottom: none; }
    .hours-table td:first-child { color: var(--color-text-muted); font-weight: 600; }
    .hours-table td:last-child { color: var(--color-text); font-weight: 700; }
    .badge-247 {
      display: inline-block;
      background: var(--color-danger);
      color: #fff;
      font-size: 10px;
      font-weight: 700;
      padding: 2px 8px;
      border-radius: var(--radius-full);
    }

    @media (max-width: 768px) {
      .contact-info-grid { grid-template-columns: 1fr; }
      .contact-layout { grid-template-columns: 1fr; }
      .contact-form-card { padding: var(--space-6); }
      .page-hero h1 { font-size: var(--font-size-3xl); }
    }
    @media (max-width: 1024px) {
      .contact-info-grid { grid-template-columns: repeat(2, 1fr); }
      .contact-layout { grid-template-columns: 1fr; }
    }
  </style>
  <script type="application/ld+json">
  {
    "@context": "https://schema.org",
    "@type": "MedicalOrganization",
    "name": "Trung tâm Y tế khu vực Đắk Hà",
    "url": "https://ttytdakha.gov.vn",
    "telephone": "+84-260-3862xxx",
    "email": "ttytdakha@kontum.gov.vn",
    "address": {
      "@type": "PostalAddress",
      "streetAddress": "Đường Trần Phú, Thị trấn Đắk Hà",
      "addressLocality": "Đắk Hà",
      "addressRegion": "Kon Tum",
      "postalCode": "58000",
      "addressCountry": "VN"
    },
    "openingHoursSpecification": [
      {"@type": "OpeningHoursSpecification","dayOfWeek": ["Monday","Tuesday","Wednesday","Thursday","Friday"],"opens": "07:00","closes": "17:00"},
      {"@type": "OpeningHoursSpecification","dayOfWeek": "Saturday","opens": "07:00","closes": "11:30"}
    ]
  }
  </script>

  <!-- BREADCRUMB -->
  <nav class="breadcrumb" aria-label="breadcrumb">
    <div class="container">
      <ol class="breadcrumb-list" itemscope itemtype="https://schema.org/BreadcrumbList">
        <li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem">
          <a href="../index.html" itemprop="item"><span itemprop="name">Trang chủ</span></a>
          <meta itemprop="position" content="1" />
        </li>
        <li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem">
          <span itemprop="name">Liên hệ</span>
          <meta itemprop="position" content="2" />
        </li>
      </ol>
    </div>
  </nav>

  <!-- MAIN CONTENT -->
  <main id="main-content" role="main">

    <!-- Page Hero -->
    <section class="page-hero" aria-labelledby="page-title">
      <div class="container">
        <h1 id="page-title">Liên hệ với chúng tôi</h1>
        <p>Chúng tôi luôn sẵn sàng lắng nghe và hỗ trợ bạn. Đừng ngần ngại liên hệ khi cần.</p>
      </div>
    </section>

    <!-- Contact Section -->
    <section aria-labelledby="contact-section-title">
      <div class="container">
        <h2 id="contact-section-title" class="sr-only">Thông tin liên hệ và form góp ý</h2>

        <!-- Emergency Block -->
        <div class="emergency-block" data-animate role="alert">
          <div class="emg-icon" aria-hidden="true">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5">
              <path d="M22 16.92v3a2 2 0 01-2.18 2 19.79 19.79 0 01-8.63-3.07A19.5 19.5 0 013.07 10.8 19.79 19.79 0 01.01 2.18 2 2 0 012 0h3a2 2 0 012 1.72c.127.96.361 1.903.7 2.81a2 2 0 01-.45 2.11L6.09 7.91a16 16 0 006 6l1.27-1.27a2 2 0 012.11-.45c.907.339 1.85.573 2.81.7A2 2 0 0122 16.92z"/>
            </svg>
          </div>
          <h2>🚨 Đường dây cấp cứu khẩn cấp 24/7</h2>
          <a href="tel:1900xxxx" class="emg-number">1900 xxxx</a>
          <p>Hoạt động 24 giờ / 7 ngày, kể cả ngày lễ và Tết Nguyên Đán</p>
        </div>

        <!-- Quick Contact Info Cards -->
        <div class="contact-info-grid" data-animate>
          <article class="contact-info-card">
            <div class="ci-icon" aria-hidden="true">
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                <path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0118 0z"/><circle cx="12" cy="10" r="3"/>
              </svg>
            </div>
            <h3>Địa chỉ</h3>
            <p>Đường Trần Phú, Thị trấn Đắk Hà<br>Huyện Đắk Hà, tỉnh Kon Tum</p>
          </article>

          <article class="contact-info-card">
            <div class="ci-icon" aria-hidden="true">
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                <path d="M22 16.92v3a2 2 0 01-2.18 2 19.79 19.79 0 01-8.63-3.07A19.5 19.5 0 013.07 10.8 19.79 19.79 0 01.01 2.18 2 2 0 012 0h3a2 2 0 012 1.72c.127.96.361 1.903.7 2.81a2 2 0 01-.45 2.11L6.09 7.91a16 16 0 006 6l1.27-1.27a2 2 0 012.11-.45c.907.339 1.85.573 2.81.7A2 2 0 0122 16.92z"/>
              </svg>
            </div>
            <h3>Điện thoại</h3>
            <a href="tel:02603862xxx">Hành chính: (0260) 386 2xxx</a><br>
            <a href="tel:1900xxxx" style="color:var(--color-danger);">Cấp cứu: 1900 xxxx</a>
          </article>

          <article class="contact-info-card">
            <div class="ci-icon" aria-hidden="true">
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                <path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"/><polyline points="22,6 12,13 2,6"/>
              </svg>
            </div>
            <h3>Email</h3>
            <a href="mailto:ttytdakha@kontum.gov.vn">ttytdakha@kontum.gov.vn</a>
          </article>
        </div>

        <!-- Main Layout: Hours + Form -->
        <div class="contact-layout">

          <!-- Left: Hours + Map -->
          <div>
            <div style="background:var(--color-bg);border-radius:var(--radius-xl);padding:var(--space-8);box-shadow:var(--shadow-card);border:1px solid var(--color-border-light);margin-bottom:var(--space-6);" data-animate>
              <h2 style="font-size:var(--font-size-xl);font-weight:700;margin-bottom:var(--space-4);color:var(--color-text);">
                Giờ làm việc
              </h2>
              <table class="hours-table" aria-label="Lịch làm việc">
                <caption class="sr-only">Giờ làm việc của Trung tâm Y tế khu vực Đắk Hà</caption>
                <tbody>
                  <tr><td>Thứ Hai – Thứ Sáu</td><td>07:00 – 17:00</td></tr>
                  <tr><td>Thứ Bảy</td><td>07:00 – 11:30</td></tr>
                  <tr><td>Chủ Nhật</td><td>Nghỉ (trừ cấp cứu)</td></tr>
                  <tr><td>Cấp cứu</td><td><span class="badge-247">24/7</span> Kể cả lễ, Tết</td></tr>
                </tbody>
              </table>

              <div style="margin-top:var(--space-6);padding-top:var(--space-5);border-top:1px solid var(--color-border-light);">
                <h3 style="font-size:var(--font-size-base);font-weight:700;margin-bottom:var(--space-3);">Mạng xã hội</h3>
                <div style="display:flex;gap:var(--space-3);">
                  <a href="https://www.facebook.com/ttytdakha" target="_blank" rel="noopener noreferrer"
                     class="btn btn-primary btn-sm" id="social-facebook">
                    Facebook
                  </a>
                  <a href="https://zalo.me/ttytdakha" target="_blank" rel="noopener noreferrer"
                     class="btn btn-outline btn-sm" id="social-zalo">
                    Zalo OA
                  </a>
                </div>
              </div>
            </div>

            <!-- Map -->
            <div style="border-radius:var(--radius-xl);overflow:hidden;box-shadow:var(--shadow-md);height:300px;" data-animate data-animate-delay="200">
              <div class="map-lazy-wrap"
                   style="width:100%;height:100%;background:var(--color-bg-alt);display:flex;align-items:center;justify-content:center;flex-direction:column;gap:var(--space-3);"
                   data-src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3867!2d107.9!3d14.7!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2zMTTCsDQyJzAwLjAiTiAxMDfCsDU0JzAwLjAiRQ!5e0!3m2!1svi!2svn!4v1"
                   aria-label="Bản đồ vị trí Trung tâm Y tế khu vực Đắk Hà">
                <svg viewBox="0 0 24 24" width="48" height="48" fill="none" stroke="var(--color-primary)" stroke-width="1.5" aria-hidden="true">
                  <path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0118 0z"/><circle cx="12" cy="10" r="3"/>
                </svg>
                <p style="color:var(--color-text-muted);font-size:var(--font-size-sm);text-align:center;">
                  Đường Trần Phú, TT. Đắk Hà<br>
                  <a href="https://goo.gl/maps/example" target="_blank" rel="noopener noreferrer" style="color:var(--color-primary);">Xem trên Google Maps →</a>
                </p>
              </div>
            </div>
          </div>

          <!-- Right: Feedback Form -->
          <div class="contact-form-card" data-animate data-animate-delay="100">
            <h2 style="font-size:var(--font-size-2xl);font-weight:800;color:var(--color-text);margin-bottom:var(--space-2);">
              Gửi góp ý / Phản ánh
            </h2>
            <p style="color:var(--color-text-muted);margin-bottom:var(--space-6);">
              Ý kiến của bạn giúp chúng tôi cải thiện dịch vụ. Mọi phản ánh sẽ được tiếp nhận và xử lý trong vòng 3 ngày làm việc.
            </p>

            <!-- Success message -->
            <div class="form-success-msg" id="form-success" role="alert">
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" aria-hidden="true">
                <path d="M22 11.08V12a10 10 0 11-5.93-9.14"/>
                <polyline points="22 4 12 14.01 9 11.01"/>
              </svg>
              Cảm ơn bạn! Phản ánh của bạn đã được gửi thành công. Chúng tôi sẽ liên hệ lại trong 3 ngày làm việc.
            </div>

            <form id="contact-form" novalidate aria-label="Form góp ý phản ánh">
              <div style="display:grid;grid-template-columns:1fr 1fr;gap:var(--space-4);">
                <div class="form-group">
                  <label class="form-label" for="contact-name">
                    Họ và tên <span class="required" aria-label="bắt buộc">*</span>
                  </label>
                  <input type="text" id="contact-name" name="name" class="form-control"
                         placeholder="Nguyễn Văn A"
                         autocomplete="name" aria-required="true" />
                  <span class="form-error" aria-live="polite"></span>
                </div>
                <div class="form-group">
                  <label class="form-label" for="contact-phone">
                    Số điện thoại <span class="required" aria-label="bắt buộc">*</span>
                  </label>
                  <input type="tel" id="contact-phone" name="phone" class="form-control"
                         placeholder="0912 345 678"
                         autocomplete="tel" aria-required="true" />
                  <span class="form-error" aria-live="polite"></span>
                </div>
              </div>

              <div class="form-group">
                <label class="form-label" for="contact-email">Địa chỉ Email</label>
                <input type="email" id="contact-email" name="email" class="form-control"
                       placeholder="example@email.com"
                       autocomplete="email" />
                <span class="form-error" aria-live="polite"></span>
              </div>

              <div class="form-group">
                <label class="form-label" for="contact-subject">
                  Tiêu đề <span class="required" aria-label="bắt buộc">*</span>
                </label>
                <input type="text" id="contact-subject" name="subject" class="form-control"
                       placeholder="Nội dung góp ý của bạn về..."
                       aria-required="true" />
                <span class="form-error" aria-live="polite"></span>
              </div>

              <div class="form-group">
                <label class="form-label" for="feedback-category">Phân loại</label>
                <select id="feedback-category" name="category" class="form-control">
                  <option value="">-- Chọn loại phản ánh --</option>
                  <option value="chat-luong">Chất lượng dịch vụ</option>
                  <option value="thai-do">Thái độ nhân viên</option>
                  <option value="co-so-vat-chat">Cơ sở vật chất</option>
                  <option value="tu-van">Tư vấn y tế</option>
                  <option value="khac">Ý kiến khác</option>
                </select>
              </div>

              <div class="form-group">
                <label class="form-label" for="contact-message">
                  Nội dung góp ý <span class="required" aria-label="bắt buộc">*</span>
                </label>
                <textarea id="contact-message" name="message" class="form-control"
                          placeholder="Vui lòng mô tả chi tiết ý kiến, góp ý hoặc phản ánh của bạn..."
                          rows="5" aria-required="true"></textarea>
                <span class="form-error" aria-live="polite"></span>
              </div>

              <div style="margin-bottom:var(--space-5);">
                <label style="display:flex;align-items:flex-start;gap:var(--space-3);font-size:var(--font-size-sm);color:var(--color-text-muted);cursor:pointer;">
                  <input type="checkbox" id="agree-privacy" required
                         style="margin-top:3px;accent-color:var(--color-primary);" />
                  Tôi đồng ý với <a href="/chinh-sach-bao-mat" style="color:var(--color-primary);">Chính sách bảo mật</a> và cho phép Trung tâm sử dụng thông tin để xử lý yêu cầu.
                </label>
              </div>

              <button type="submit" class="btn btn-primary btn-lg" id="submit-contact" style="width:100%;justify-content:center;">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" aria-hidden="true">
                  <line x1="22" y1="2" x2="11" y2="13"/><polygon points="22 2 15 22 11 13 2 9 22 2"/>
                </svg>
                Gửi góp ý
              </button>
            </form>
          </div>
        </div>
      </div>
    </section>

  </main>
<?php require_once 'footer.php'; ?>
