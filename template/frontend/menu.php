<body>

  <!-- ============================================================
       TOP BAR
       ============================================================ -->
  <aside class="topbar" role="banner" aria-label="Thanh thông tin nhanh">
    <div class="container">
      <div class="topbar-inner">
        <div class="topbar-hotline">
          <span class="hotline-badge">Cấp cứu</span>
          <span>Đường dây nóng:</span>
          <a href="tel:1900xxxx" aria-label="Gọi hotline cấp cứu 1900 xxxx">1900 xxxx</a>
        </div>
        <div class="topbar-right">
          <nav class="topbar-socials" aria-label="Mạng xã hội">
            <a href="https://www.facebook.com/ttytdakha" target="_blank" rel="noopener noreferrer"
               aria-label="Trang Facebook Bệnh viện đa khoa Đắk Hà">
              <svg viewBox="0 0 24 24" fill="currentColor" aria-hidden="true">
                <path d="M18 2h-3a5 5 0 00-5 5v3H7v4h3v8h4v-8h3l1-4h-4V7a1 1 0 011-1h3z"/>
              </svg>
            </a>
            <a href="https://zalo.me/ttytdakha" target="_blank" rel="noopener noreferrer"
               aria-label="Trang Zalo Bệnh viện đa khoa Đắk Hà">
              <svg viewBox="0 0 24 24" fill="currentColor" aria-hidden="true">
                <path d="M12 2C6.477 2 2 6.477 2 12c0 1.89.525 3.66 1.438 5.168L2 22l4.832-1.438A9.955 9.955 0 0012 22c5.523 0 10-4.477 10-10S17.523 2 12 2zm-1 13H9V9h2v6zm3.5 0h-2V9h2v6z"/>
              </svg>
            </a>
            <a href="https://youtube.com" target="_blank" rel="noopener noreferrer"
               aria-label="Kênh YouTube Bệnh viện đa khoa Đắk Hà">
              <svg viewBox="0 0 24 24" fill="currentColor" aria-hidden="true">
                <path d="M22.54 6.42a2.78 2.78 0 00-1.94-1.96C18.88 4 12 4 12 4s-6.88 0-8.6.46A2.78 2.78 0 001.46 6.42 29 29 0 001 12a29 29 0 00.46 5.58 2.78 2.78 0 001.94 1.96C5.12 20 12 20 12 20s6.88 0 8.6-.46a2.78 2.78 0 001.94-1.96A29 29 0 0023 12a29 29 0 00-.46-5.58z"/>
                <polygon points="9.75 15.02 15.5 12 9.75 8.98 9.75 15.02" fill="white"/>
              </svg>
            </a>
          </nav>
          <!-- <div class="topbar-lang" role="button" tabindex="0" aria-label="Chuyển đổi ngôn ngữ">
            <svg viewBox="0 0 24 24" width="14" height="14" fill="none" stroke="currentColor" stroke-width="2">
              <circle cx="12" cy="12" r="10"/>
              <line x1="2" y1="12" x2="22" y2="12"/>
              <path d="M12 2a15.3 15.3 0 010 20M12 2a15.3 15.3 0 000 20"/>
            </svg>
            VI | EN
          </div> -->
        </div>
      </div>
    </div>
  </aside>

  <!-- ============================================================
       HEADER
       ============================================================ -->
  <header class="site-header" id="site-header" role="banner">
    <div class="container">
      <div class="header-inner">

        <!-- Logo -->
        <a href="<?php echo XC_URL; ?>/" class="logo" aria-label="Trang chủ Bệnh viện đa khoa khu vực Đắk Hà">
          <div class="logo-icon" aria-hidden="true">
           <img
                  src="<?php echo XC_URL;?>/template/frontend/assets/images/logo.png"
                  alt="Logo Bệnh viện đa khoa khu vực Đắk Hà"
                  width="48"
                  height="48"
                  loading="lazy"
                  itemprop="logo" />
          </div>
          <div class="logo-text" itemprop="name">
            <span class="name">Bệnh viện đa khoa khu vực Đắk Hà</span>
            <span class="sub">Sở Y tế tỉnh Quảng Ngãi</span>
          </div>
        </a>

        <!-- Main Navigation -->
        <nav class="main-nav" aria-label="Menu chính" role="navigation">
          <ul class="nav-list" role="list">

            <li class="nav-item">
              <a href="<?php echo XC_URL; ?>/" class="nav-link active" aria-current="page">Trang chủ</a>
            </li>

            <li class="nav-item">
              <a href="<?php echo XC_URL; ?>/trang/gioi-thieu" class="nav-link" aria-haspopup="true" aria-expanded="false">
                Giới thiệu
                <svg class="chevron" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" aria-hidden="true">
                  <polyline points="6 9 12 15 18 9"/>
                </svg>
              </a>
              <div class="dropdown" role="menu" aria-label="Menu giới thiệu">
                <a href="<?php echo XC_URL; ?>/trang/gioi-thieu" role="menuitem">
                  <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="10"/><polyline points="12 6 12 12 16 14"/></svg>
                  Giới thiệu bệnh viện
                </a>
                <a href="<?php echo XC_URL; ?>/trang/co-cau-to-chuc" role="menuitem">
                  <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M17 21v-2a4 4 0 00-4-4H5a4 4 0 00-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M23 21v-2a4 4 0 00-3-3.87M16 3.13a4 4 0 010 7.75"/></svg>
                  Cơ cấu & Sơ đồ tổ chức
                </a>
              </div>
            </li>

            <li class="nav-item">
              <a href="<?php echo XC_URL; ?>/tin-tuc-su-kien.html" class="nav-link" aria-haspopup="true" aria-expanded="false">
                Tin tức - Sự kiện
                <svg class="chevron" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" aria-hidden="true">
                  <polyline points="6 9 12 15 18 9"/>
                </svg>
              </a>
              <div class="dropdown" role="menu" aria-label="Menu tin tức">
                <a href="<?php echo XC_URL; ?>/tin-tuc-su-kien.html?cat=hoat-dong" role="menuitem">
                  <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M14 2H6a2 2 0 00-2 2v16a2 2 0 002 2h12a2 2 0 002-2V8z"/><polyline points="14 2 14 8 20 8"/></svg>
                  Tin hoạt động nội bộ
                </a>
                <a href="<?php echo XC_URL; ?>/tin-tuc-su-kien.html?cat=cong-dong" role="menuitem">
                  <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M17 21v-2a4 4 0 00-4-4H5a4 4 0 00-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M23 21v-2a4 4 0 00-3-3.87"/></svg>
                  Tin y tế cộng đồng
                </a>
                <a href="<?php echo XC_URL; ?>/tin-tuc-su-kien.html?cat=thong-bao" role="menuitem">
                  <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M18 8A6 6 0 006 8c0 7-3 9-3 9h18s-3-2-3-9M13.73 21a2 2 0 01-3.46 0"/></svg>
                  Thông báo
                </a>
                <a href="<?php echo XC_URL; ?>/tin-tuc-su-kien.html?cat=su-kien" role="menuitem">
                  <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="3" y="4" width="18" height="18" rx="2" ry="2"/><line x1="16" y1="2" x2="16" y2="6"/><line x1="8" y1="2" x2="8" y2="6"/><line x1="3" y1="10" x2="21" y2="10"/></svg>
                  Sự kiện - Hội thảo
                </a>
              </div>
            </li>

            <li class="nav-item">
              <a href="<?php echo XC_URL; ?>/dich-vu-y-te.html" class="nav-link" aria-haspopup="true" aria-expanded="false">
                Dịch vụ Y tế
                <svg class="chevron" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" aria-hidden="true">
                  <polyline points="6 9 12 15 18 9"/>
                </svg>
              </a>
              <div class="dropdown" role="menu" aria-label="Menu dịch vụ">
                <a href="<?php echo XC_URL; ?>/dich-vu-y-te.html#kham-chua-benh" role="menuitem">
                  <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M22 12h-4l-3 9L9 3l-3 9H2"/></svg>
                  Khám chữa bệnh
                </a>
                <a href="<?php echo XC_URL; ?>/dich-vu-y-te.html#bang-gia" role="menuitem">
                  <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><line x1="12" y1="1" x2="12" y2="23"/><path d="M17 5H9.5a3.5 3.5 0 100 7h5a3.5 3.5 0 110 7H6"/></svg>
                  Bảng giá dịch vụ
                </a>
                <a href="<?php echo XC_URL; ?>/dich-vu-y-te.html#goi-kham" role="menuitem">
                  <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/></svg>
                  Gói khám sức khỏe
                </a>
              </div>
            </li>

            <li class="nav-item">
              <a href="<?php echo XC_URL; ?>/lay-giay-tt25" class="nav-link fw-bold text-primary" style="color: #0284c7 !important;">
                <i class="fa-solid fa-file-medical me-1"></i> Chế độ BHXH
              </a>
            </li>

            <li class="nav-item">
              <a href="<?php echo XC_URL; ?>/hoat-dong.html" class="nav-link">Hoạt động</a>
            </li>

            <!-- <li class="nav-item">
              <a href="<?php echo XC_URL; ?>/trang/van-ban" class="nav-link">Văn bản</a>
            </li> -->

            <li class="nav-item">
              <a href="<?php echo XC_URL; ?>/lien-he.html" class="nav-link">Liên hệ</a>
            </li>

          </ul>
        </nav>

        <!-- Header CTA & User Account Dropdown -->
        <?php
        if(!function_exists('getUserInitials')){
            function getUserInitials($name) {
                $name = trim($name);
                if(empty($name)) return 'U';
                $words = preg_split('/\s+/', $name);
                if(count($words) >= 2) {
                    $first = mb_substr($words[0], 0, 1, 'UTF-8');
                    $last = mb_substr($words[count($words) - 1], 0, 1, 'UTF-8');
                    return mb_strtoupper($first . $last, 'UTF-8');
                }
                return mb_strtoupper(mb_substr($name, 0, 2, 'UTF-8'), 'UTF-8');
            }
        }
        ?>
        <div class="header-cta">
          <?php if(isset($_SESSION['user']['id']) && !empty($_SESSION['user']['id'])): ?>
            <?php 
              $u_name = isset($_SESSION['user']['full_name']) ? $_SESSION['user']['full_name'] : 'Tài khoản';
              $u_group = isset($_SESSION['user']['group']) ? intval($_SESSION['user']['group']) : 0;
              $u_avatar = isset($_SESSION['user']['avatar']) ? $_SESSION['user']['avatar'] : '';
              $u_initials = getUserInitials($u_name);
            ?>
            <div class="header-user-dropdown">
              <button class="user-avatar-btn" type="button" onclick="toggleUserMenu(event)">
                <?php if(!empty($u_avatar)): ?>
                  <img src="<?php echo XC_URL . '/' . $u_avatar; ?>" alt="<?php echo htmlspecialchars($u_name); ?>" class="user-avatar-img">
                <?php else: ?>
                  <div class="user-initials-avatar">
                    <?php echo htmlspecialchars($u_initials); ?>
                  </div>
                <?php endif; ?>
                <span class="user-name-text">
                  <?php echo htmlspecialchars($u_name); ?>
                </span>
                <i class="fa-solid fa-chevron-down user-chevron"></i>
              </button>

              <div class="user-dropdown-menu" id="userMenuDropdown">
                <div class="user-dropdown-header">
                  <div class="fw-bold text-dark" style="font-size: 14px; color: #0f172a;"><?php echo htmlspecialchars($u_name); ?></div>
                  <div style="font-size: 12px; color: #64748b;"><?php echo isset($_SESSION['user']['email']) ? htmlspecialchars($_SESSION['user']['email']) : ''; ?></div>
                  <span class="badge-group mt-1">
                    <?php echo ($u_group == 2) ? 'Cán bộ / Nhân viên' : 'Thành viên'; ?>
                  </span>
                </div>

                <?php if($u_group == 2): ?>
                  <a class="user-dropdown-item primary-item" href="<?php echo XC_URL; ?>/khong-gian-lam-viec-so">
                    <i class="fa-solid fa-laptop-medical"></i>
                    <span>Không gian làm việc số</span>
                  </a>
                <?php endif; ?>

                <a class="user-dropdown-item" href="javascript:void(0)" onclick="openUserInfoModal()">
                  <i class="fa-solid fa-user-gear"></i>
                  <span>Thông tin tài khoản</span>
                </a>

                <a class="user-dropdown-item danger-item" href="<?php echo XC_URL; ?>/member/logout">
                  <i class="fa-solid fa-right-from-bracket"></i>
                  <span>Đăng xuất</span>
                </a>
              </div>
            </div>

          <?php else: ?>
            <button type="button" class="btn btn-accent btn-sm shadow-sm" onclick="openLoginModal()" style="display: inline-flex; align-items: center; gap: 6px; font-weight: 600; padding: 8px 18px; border-radius: 20px;">
              <i class="fa-solid fa-right-to-bracket"></i>
              <span>Đăng nhập NVYT</span>
            </button>
          <?php endif; ?>
        </div>

        <!-- Hamburger (mobile) -->
        <button class="hamburger" id="hamburger-btn"
                aria-label="Mở menu điều hướng"
                aria-expanded="false"
                aria-controls="mobile-nav">
          <span></span>
          <span></span>
          <span></span>
        </button>

      </div>
    </div>
  </header>

  <!-- Mobile Navigation Drawer -->
  <nav class="mobile-nav" id="mobile-nav" aria-label="Menu mobile" aria-hidden="true">
    <div class="mobile-nav-header">
      <a href="<?php echo XC_URL; ?>/" class="logo">
        <div class="logo-icon" aria-hidden="true">
          <img
                  src="<?php echo XC_URL; ?>/template/frontend/assets/images/logo.png"
                  alt="Logo Bệnh viện đa khoa khu vực Đắk Hà"
                  width="48"
                  height="48"
                  loading="lazy" />
        </div>
        <div class="logo-text">
          <span class="name">Đắk Hà Medical</span>
          <span class="sub">Menu chính</span>
        </div>
      </a>
      <button class="mobile-nav-close" id="mobile-nav-close" aria-label="Đóng menu mobile">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
          <line x1="18" y1="6" x2="6" y2="18"/>
          <line x1="6" y1="6" x2="18" y2="18"/>
        </svg>
      </button>
    </div>

    <div class="mobile-nav-body">
      <?php if(isset($_SESSION['user']['id']) && !empty($_SESSION['user']['id'])): ?>
        <div class="mobile-user-box" style="padding: 12px 14px; margin-bottom: 12px; background: rgba(2, 132, 199, 0.08); border-radius: 12px; border: 1px solid rgba(2, 132, 199, 0.15); display: flex; align-items: center; gap: 12px;">
          <?php if(!empty($u_avatar)): ?>
            <img src="<?php echo XC_URL . '/' . $u_avatar; ?>" alt="<?php echo htmlspecialchars($u_name); ?>" style="width: 40px; height: 40px; border-radius: 50%; object-fit: cover; border: 2px solid #fff;">
          <?php else: ?>
            <div style="width: 40px; height: 40px; border-radius: 50%; background: linear-gradient(135deg, var(--color-primary) 0%, var(--color-teal) 100%); color: #fff; display: flex; align-items: center; justify-content: center; font-weight: 700; font-size: 14px; border: 2px solid #fff;">
              <?php echo htmlspecialchars($u_initials); ?>
            </div>
          <?php endif; ?>
          <div style="line-height: 1.3;">
            <div style="font-weight: 700; font-size: 14px; color: #0f172a;"><?php echo htmlspecialchars($u_name); ?></div>
            <small style="font-size: 12px; color: #64748b;"><?php echo ($u_group == 2) ? 'Cán bộ / NVYT' : 'Thành viên'; ?></small>
          </div>
        </div>
        <?php if($u_group == 2): ?>
          <a href="<?php echo XC_URL; ?>/khong-gian-lam-viec-so" class="mobile-nav-link fw-bold text-primary" style="background: rgba(2, 132, 199, 0.06); border-radius: 10px; margin-bottom: 6px; display: flex; align-items: center; gap: 8px;">
            <i class="fa-solid fa-laptop-medical text-primary"></i>
            <span>Không gian làm việc số</span>
          </a>
        <?php endif; ?>
      <?php endif; ?>

      <a href="<?php echo XC_URL; ?>/" class="mobile-nav-link">Trang chủ</a>

      <button class="mobile-nav-link" data-submenu="sub-gioi-thieu" aria-expanded="false">
        Giới thiệu
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" aria-hidden="true">
          <polyline points="9 18 15 12 9 6"/>
        </svg>
      </button>
      <div class="mobile-submenu" id="sub-gioi-thieu" role="menu">
        <a href="<?php echo XC_URL; ?>/trang/gioi-thieu#lich-su">Lịch sử hình thành</a>
        <a href="<?php echo XC_URL; ?>/trang/gioi-thieu#chuc-nang">Chức năng nhiệm vụ</a>
        <a href="<?php echo XC_URL; ?>/trang/co-cau-to-chuc">Sơ đồ tổ chức</a>
        <a href="<?php echo XC_URL; ?>/trang/ban-lanh-dao">Ban lãnh đạo</a>
      </div>

      <button class="mobile-nav-link" data-submenu="sub-tintuc" aria-expanded="false">
        Tin tức - Sự kiện
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" aria-hidden="true">
          <polyline points="9 18 15 12 9 6"/>
        </svg>
      </button>
      <div class="mobile-submenu" id="sub-tintuc" role="menu">
        <a href="<?php echo XC_URL; ?>/tin-tuc-su-kien.html?cat=hoat-dong">Tin hoạt động nội bộ</a>
        <a href="<?php echo XC_URL; ?>/tin-tuc-su-kien.html?cat=cong-dong">Tin y tế cộng đồng</a>
        <a href="<?php echo XC_URL; ?>/tin-tuc-su-kien.html?cat=thong-bao">Thông báo</a>
        <a href="<?php echo XC_URL; ?>/tin-tuc-su-kien.html?cat=su-kien">Sự kiện - Hội thảo</a>
      </div>

      <button class="mobile-nav-link" data-submenu="sub-dichvu" aria-expanded="false">
        Dịch vụ Y tế
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" aria-hidden="true">
          <polyline points="9 18 15 12 9 6"/>
        </svg>
      </button>
      <div class="mobile-submenu" id="sub-dichvu" role="menu">
        <a href="<?php echo XC_URL; ?>/dich-vu-y-te.html#kham-chua-benh">Khám chữa bệnh</a>
        <a href="<?php echo XC_URL; ?>/dich-vu-y-te.html#bang-gia">Bảng giá dịch vụ</a>
        <a href="<?php echo XC_URL; ?>/dich-vu-y-te.html#goi-kham">Gói khám sức khỏe</a>
      </div>

      <a href="<?php echo XC_URL; ?>/lay-giay-tt25" class="mobile-nav-link fw-bold text-primary">Lấy giấy TT25</a>
      <a href="<?php echo XC_URL; ?>/hoat-dong.html" class="mobile-nav-link">Hoạt động</a>
      <a href="<?php echo XC_URL; ?>/trang/van-ban" class="mobile-nav-link">Văn bản</a>
      <a href="<?php echo XC_URL; ?>/lien-he.html" class="mobile-nav-link">Liên hệ</a>
    </div>

    <div class="mobile-nav-footer">
      <?php if(isset($_SESSION['user']['id']) && !empty($_SESSION['user']['id'])): ?>
        <a href="<?php echo XC_URL; ?>/member/logout" class="btn btn-accent w-100 mb-2" style="border-radius: 12px; display: flex; align-items: center; justify-content: center; gap: 8px; font-weight: 600;">
          <i class="fa-solid fa-right-from-bracket"></i> Đăng xuất
        </a>
      <?php else: ?>
        <button type="button" class="btn btn-accent w-100 mb-2" onclick="openLoginModal(); if(window.closeMobileNav) window.closeMobileNav();" style="border-radius: 12px; display: flex; align-items: center; justify-content: center; gap: 8px; font-weight: 600; padding: 12px 18px;">
          <i class="fa-solid fa-right-to-bracket"></i> Đăng nhập NVYT
        </button>
      <?php endif; ?>
      <a href="tel:1900xxxx" class="btn btn-danger w-100" style="border-radius: 12px; display: flex; align-items: center; justify-content: center; gap: 8px; font-weight: 600; padding: 12px 18px;">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" aria-hidden="true" style="width: 18px; height: 18px;">
          <path d="M22 16.92v3a2 2 0 01-2.18 2 19.79 19.79 0 01-8.63-3.07A19.5 19.5 0 013.07 10.8 19.79 19.79 0 01.01 2.18 2 2 0 012 0h3a2 2 0 012 1.72c.127.96.361 1.903.7 2.81a2 2 0 01-.45 2.11L6.09 7.91a16 16 0 006 6l1.27-1.27a2 2 0 012.11-.45c.907.339 1.85.573 2.81.7A2 2 0 0122 16.92z"/>
        </svg>
        Gọi cấp cứu: 1900 xxxx
      </a>
    </div>
  </nav>

  <div class="nav-overlay" id="nav-overlay" aria-hidden="true"></div>

  <!-- ============================================================
       NVYT LOGIN MODAL
       ============================================================ -->
  <div class="custom-modal-overlay" id="modalLogin" tabindex="-1" aria-hidden="true">
    <div class="custom-modal-dialog">
      <div class="custom-modal-content">
        
        <!-- Modal Header -->
        <div class="custom-modal-header">
          <div class="custom-modal-header-info">
            <div class="custom-modal-icon">
              <i class="fa-solid fa-hospital-user"></i>
            </div>
            <div class="custom-modal-title-group">
              <h5 class="custom-modal-title">Đăng nhập Cán bộ / NVYT</h5>
              <span class="custom-modal-subtitle">Bệnh viện đa khoa khu vực Đắk Hà</span>
            </div>
          </div>
          <button type="button" class="custom-modal-close" onclick="closeLoginModal()" aria-label="Đóng">
            <i class="fa-solid fa-xmark"></i>
          </button>
        </div>

        <!-- Modal Body -->
        <div class="custom-modal-body">
          <form action="<?php echo XC_URL; ?>/admin/login" method="POST" id="formLoginNVYT">
            
            <div class="custom-form-group">
              <label for="loginUsername" class="custom-form-label">Tên đăng nhập / Mã cán bộ</label>
              <div class="custom-input-box">
                <span class="custom-input-icon"><i class="fa-solid fa-user"></i></span>
                <input type="text" class="custom-form-input" id="loginUsername" name="username" placeholder="Nhập tên đăng nhập hoặc email..." required>
              </div>
            </div>

            <div class="custom-form-group">
              <div class="custom-form-label-row">
                <label for="loginPassword" class="custom-form-label">Mật khẩu</label>
                <a href="<?php echo XC_URL; ?>/quen-mat-khau" class="custom-forgot-link">Quên mật khẩu?</a>
              </div>
              <div class="custom-input-box">
                <span class="custom-input-icon"><i class="fa-solid fa-lock"></i></span>
                <input type="password" class="custom-form-input" id="loginPassword" name="password" placeholder="Nhập mật khẩu..." required>
              </div>
            </div>

            <div class="custom-checkbox-group">
              <input class="custom-checkbox-input" type="checkbox" id="rememberMe" name="remember" checked>
              <label class="custom-checkbox-label" for="rememberMe">
                Ghi nhớ đăng nhập trên thiết bị này
              </label>
            </div>

            <button type="submit" class="custom-submit-btn">
              <i class="fa-solid fa-right-to-bracket"></i> Đăng nhập hệ thống
            </button>
          </form>

          <div class="custom-modal-footer-notice">
            <i class="fa-solid fa-shield-halved"></i>
            <span>Cổng thông tin & làm việc số nội bộ dành cho Cán bộ, Nhân viên Y tế.</span>
          </div>
        </div>
      </div>
    </div>
  </div>

  <script>
  function toggleUserMenu(event) {
    if (event) event.stopPropagation();
    var dropdownMenu = document.getElementById('userMenuDropdown');
    var container = document.querySelector('.header-user-dropdown');
    if (dropdownMenu && container) {
      var isShow = dropdownMenu.classList.contains('show');
      dropdownMenu.classList.toggle('show', !isShow);
      container.classList.toggle('open', !isShow);
    }
  }

  function openLoginModal() {
    var modalEl = document.getElementById('modalLogin');
    if (!modalEl) return;
    modalEl.classList.add('show');
    document.body.style.overflow = 'hidden';
  }

  function closeLoginModal() {
    var modalEl = document.getElementById('modalLogin');
    if (!modalEl) return;
    modalEl.classList.remove('show');
    document.body.style.overflow = '';
  }

  document.addEventListener('click', function(e) {
    var container = document.querySelector('.header-user-dropdown');
    var dropdownMenu = document.getElementById('userMenuDropdown');
    if (container && dropdownMenu && !container.contains(e.target)) {
      dropdownMenu.classList.remove('show');
      container.classList.remove('open');
    }

    var modalEl = document.getElementById('modalLogin');
    if (modalEl && modalEl.classList.contains('show') && e.target === modalEl) {
      closeLoginModal();
    }
  });

  document.addEventListener('DOMContentLoaded', function() {
    var formLogin = document.getElementById('formLoginNVYT');
    if (formLogin) {
      formLogin.addEventListener('submit', function(e) {
        e.preventDefault();
        var username = document.getElementById('loginUsername').value;
        var password = document.getElementById('loginPassword').value;
        var submitBtn = formLogin.querySelector('button[type="submit"]');
        var errorAlert = document.getElementById('loginModalAlert');
        if (!errorAlert) {
          errorAlert = document.createElement('div');
          errorAlert.id = 'loginModalAlert';
          errorAlert.style.cssText = 'padding: 10px 14px; margin-bottom: 16px; border-radius: 10px; font-size: 13px; display: none;';
          formLogin.insertBefore(errorAlert, formLogin.firstChild);
        }

        submitBtn.disabled = true;
        var origHtml = submitBtn.innerHTML;
        submitBtn.innerHTML = '<i class="fa-solid fa-spinner fa-spin"></i> Đang đăng nhập...';
        errorAlert.style.display = 'none';

        var bodyData = new URLSearchParams();
        bodyData.append('email', username);
        bodyData.append('password', password);
        bodyData.append('login_context', 'frontend');

        fetch('<?php echo XC_URL; ?>/api/login', {
          method: 'POST',
          headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
          body: bodyData.toString()
        })
        .then(function(res) { return res.json(); })
        .then(function(data) {
          if (data.status === 200) {
            submitBtn.style.background = '#10b981';
            submitBtn.innerHTML = '<i class="fa-solid fa-check"></i> Thành công! Đang chuyển hướng...';
            setTimeout(function() {
              window.location.href = data.return_url || '<?php echo XC_URL; ?>/khong-gian-lam-viec-so';
            }, 600);
          } else {
            errorAlert.style.background = '#fef2f2';
            errorAlert.style.color = '#dc2626';
            errorAlert.style.border = '1px solid #fecaca';
            errorAlert.innerHTML = '<i class="fa-solid fa-triangle-exclamation me-1"></i> ' + (data.message || 'Tên đăng nhập hoặc mật khẩu không đúng.');
            errorAlert.style.display = 'block';
            submitBtn.disabled = false;
            submitBtn.innerHTML = origHtml;
          }
        })
        .catch(function(err) {
          errorAlert.style.background = '#fef2f2';
          errorAlert.style.color = '#dc2626';
          errorAlert.style.border = '1px solid #fecaca';
          errorAlert.innerHTML = '<i class="fa-solid fa-triangle-exclamation me-1"></i> Không thể kết nối tới máy chủ. Vui lòng thử lại.';
          errorAlert.style.display = 'block';
          submitBtn.disabled = false;
          submitBtn.innerHTML = origHtml;
        });
      });
    }
  });
  </script>
