<body>

  <!-- ============================================================
       TOP BAR
       ============================================================ -->
  <!-- -->

  <!-- ============================================================
       HEADER
       ============================================================ -->
  <header class="site-header<?php echo !empty($_SESSION['user']['id']) ? ' is-authenticated' : ''; ?>" id="site-header" role="banner">
    <div class="container">
      <div class="header-inner">

        <!-- Logo -->
        <a href="<?php echo XC_URL; ?>/" class="logo" aria-label="Trang chủ Bệnh viện đa khoa khu vực Đăk Hà">
          <div class="logo-icon" aria-hidden="true">
           <img
                  <?php echo site_image_attributes(XC_URL.'/template/frontend/assets/images/logo.png', '80px', 'eager', false); ?>
                  alt="Logo Bệnh viện đa khoa khu vực Đăk Hà"
                  width="48"
                  height="48"
                  itemprop="logo" />
          </div>
          <div class="logo-text" itemprop="name">
            <span class="name">Bệnh viện đa khoa khu vực Đăk Hà</span>
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
                <a href="<?php echo XC_URL; ?>/trang/gioi-thieu.html" role="menuitem">
                  <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="10"/><polyline points="12 6 12 12 16 14"/></svg>
                  Về chúng tôi
                </a>
                <a href="<?php echo XC_URL; ?>/trang/co-cau-to-chuc.html" role="menuitem">
                  <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M17 21v-2a4 4 0 00-4-4H5a4 4 0 00-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M23 21v-2a4 4 0 00-3-3.87M16 3.13a4 4 0 010 7.75"/></svg>
                  Cơ cấu & Sơ đồ tổ chức
                </a>
                <a href="<?php echo XC_URL; ?>/bac-si" role="menuitem">
                  <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M16 21v-2a4 4 0 0 0-4-4H6a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M22 21v-2a4 4 0 0 0-3-3.87"/><path d="M16 3.13a4 4 0 0 1 0 7.75"/></svg>
                  Đội ngũ Y Bác sĩ
                </a>
              </div>
            </li>

            <li class="nav-item">
              <?php global $db;
                  $db->query("SELECT * FROM hicrm_event_type WHERE event_type_status NOT IN(99) ORDER BY event_stt ASC");
                  $item_events = $db->fetch_object();
                  
              ?>
              <a href="#" class="nav-link" aria-haspopup="true" aria-expanded="false">
                Tin tức - Sự kiện
                <svg class="chevron" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" aria-hidden="true">
                  <polyline points="6 9 12 15 18 9"/>
                </svg>
              </a>
            
              <div class="dropdown" role="menu" aria-label="Menu tin tức">
                  <?php foreach( $item_events as $item){ ?>
                <a href="<?php echo XC_URL; ?>/tin-tuc/<?php echo $item->id;?>-<?php echo $item->event_type_slug; ?>.html" role="menuitem">
                  <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M14 2H6a2 2 0 00-2 2v16a2 2 0 002 2h12a2 2 0 002-2V8z"/><polyline points="14 2 14 8 20 8"/></svg>
                  <?php echo $item->event_type_name; ?>
                </a>
                <?php }?>
              </div>
            </li>

            <li class="nav-item">
              <a href="#" class="nav-link" aria-haspopup="true" aria-expanded="false">
                Dịch vụ Y tế
                <svg class="chevron" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" aria-hidden="true">
                  <polyline points="6 9 12 15 18 9"/>
                </svg>
              </a>
              <div class="dropdown" role="menu" aria-label="Menu dịch vụ">
                <a href="<?php echo XC_URL; ?>/trang/kham-bhyt.html" role="menuitem">
                  <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M22 12h-4l-3 9L9 3l-3 9H2"/></svg>
                  Khám BHYT
                </a>
                <a href="<?php echo XC_URL; ?>/trang/vien-phi-goi-dich-vu.html" role="menuitem">
                  <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><line x1="12" y1="1" x2="12" y2="23"/><path d="M17 5H9.5a3.5 3.5 0 100 7h5a3.5 3.5 0 110 7H6"/></svg>
                  Viện phí và dịch vụ
                </a>
                <a href="<?php echo XC_URL; ?>/trang/goi-kham-suc-khoe.html" role="menuitem">
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
              <a href="<?php echo XC_URL; ?>/hoat-dong/lich-cong-tac.html" class="nav-link" aria-haspopup="true" aria-expanded="false">
                Hoạt động
                <svg class="chevron" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" aria-hidden="true">
                  <polyline points="6 9 12 15 18 9"/>
                </svg>
              </a>
              <div class="dropdown" role="menu" aria-label="Menu hoạt động">
                <a href="<?php echo XC_URL; ?>/hoat-dong/lich-cong-tac.html" role="menuitem">
                  <i class="fa-regular fa-calendar-days"></i> Lịch công tác
                </a>
                <a href="<?php echo XC_URL; ?>/hoat-dong/dao-tao-tap-huan.html" role="menuitem">
                  <i class="fa-solid fa-list-check"></i> Kế hoạch
                </a>
                <a href="<?php echo XC_URL; ?>/hoat-dong/chien-dich-y-te.html" role="menuitem">
                  <i class="fa-solid fa-hand-holding-medical"></i> Chiến dịch
                </a>
              </div>
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
              <button class="user-avatar-btn" type="button" onclick="toggleUserMenu(event)" aria-label="Tài khoản <?php echo htmlspecialchars($u_name, ENT_QUOTES, 'UTF-8'); ?>" aria-haspopup="true" aria-controls="userMenuDropdown">
                <?php if(!empty($u_avatar)): ?>
                  <img <?php echo site_image_attributes(XC_URL . '/' . $u_avatar, '64px', 'eager', true); ?> alt="<?php echo htmlspecialchars($u_name); ?>" class="user-avatar-img">
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
            <button type="button" class="btn btn-primary shadow-sm  " onclick="openLoginModal()" style="display: inline-flex; align-items: center; gap: 6px; font-weight: 600; padding: 8px 18px; border-radius: 20px;">
              <i class="fa-solid fa-right-to-bracket"></i>
              <span>Đăng nhập</span>
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
  <nav class="mobile-nav" id="mobile-nav" data-lenis-prevent aria-label="Menu mobile" aria-hidden="true">
    <div class="mobile-nav-header">
      <a href="<?php echo XC_URL; ?>/" class="logo">
        <div class="logo-icon" aria-hidden="true">
          <img
                  <?php echo site_image_attributes(XC_URL.'/template/frontend/assets/images/logo.png', '80px', 'eager', false); ?>
                  alt="Logo Bệnh viện đa khoa khu vực Đăk Hà"
                  width="48"
                  height="48" />
        </div>
        <div class="logo-text">
          <span class="name">Bệnh viện đa khoa khu vực Đăk Hà</span>
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
            <img <?php echo site_image_attributes(XC_URL . '/' . $u_avatar, '64px', 'eager', true); ?> alt="<?php echo htmlspecialchars($u_name); ?>" style="width: 40px; height: 40px; border-radius: 50%; object-fit: cover; border: 2px solid #fff;">
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
        <a href="<?php echo XC_URL; ?>/trang/gioi-thieu.html">Giới thiệu bệnh viện</a>
        <a href="<?php echo XC_URL; ?>/trang/co-cau-to-chuc.html">Sơ đồ tổ chức</a>
        <a href="<?php echo XC_URL; ?>/trang/bac-si">Đội ngũ Y/bác sĩ</a>
      </div>

      <button class="mobile-nav-link" data-submenu="sub-tintuc" aria-expanded="false">
        Tin tức - Sự kiện
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" aria-hidden="true">
          <polyline points="9 18 15 12 9 6"/>
        </svg>
      </button>
      <div class="mobile-submenu" id="sub-tintuc" role="menu">
        <?php foreach( $item_events as $item){ ?>
        <a href="<?php echo XC_URL; ?>/tin-tuc/<?php echo $item->id;?>-<?php echo $item->event_type_slug; ?>.html"><?php echo $item->event_type_name; ?></a>
          
                <?php }?>
        </div>

      <button class="mobile-nav-link" data-submenu="sub-dichvu" aria-expanded="false">
        Dịch vụ Y tế
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" aria-hidden="true">
          <polyline points="9 18 15 12 9 6"/>
        </svg>
      </button>
      <div class="mobile-submenu" id="sub-dichvu" role="menu">
        <a href="<?php echo XC_URL; ?>/trang/kham-bhyt.html">Khám BHYT</a>
        <a href="<?php echo XC_URL; ?>/trang/vien-phi-goi-dich-vu.html">Viện phí & dịch vụ</a>
        <a href="<?php echo XC_URL; ?>/trang/goi-kham-suc-khoe.html">Gói khám sức khỏe</a>
      </div>

      <a href="<?php echo XC_URL; ?>/lay-giay-tt25" class="mobile-nav-link fw-bold text-primary">Chế độ BHXH</a>
      <button class="mobile-nav-link" data-submenu="sub-hoatdong" aria-expanded="false">
        Hoạt động
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" aria-hidden="true">
          <polyline points="9 18 15 12 9 6"/>
        </svg>
      </button>
      <div class="mobile-submenu" id="sub-hoatdong" role="menu">
        <a href="<?php echo XC_URL; ?>/hoat-dong/lich-cong-tac.html">Lịch công tác</a>
        <a href="<?php echo XC_URL; ?>/hoat-dong/dao-tao-tap-huan.html">Kế hoạch</a>
        <a href="<?php echo XC_URL; ?>/hoat-dong/chien-dich-y-te.html">Chiến dịch</a>
      </div>
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
      <a href="tel:<?php echo $siteEsc($siteContact['hotline_tel']); ?>" class="btn btn-danger w-100" style="border-radius: 12px; display: flex; align-items: center; justify-content: center; gap: 8px; font-weight: 600; padding: 12px 18px;">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" aria-hidden="true" style="width: 18px; height: 18px;">
          <path d="M22 16.92v3a2 2 0 01-2.18 2 19.79 19.79 0 01-8.63-3.07A19.5 19.5 0 013.07 10.8 19.79 19.79 0 01.01 2.18 2 2 0 012 0h3a2 2 0 012 1.72c.127.96.361 1.903.7 2.81a2 2 0 01-.45 2.11L6.09 7.91a16 16 0 006 6l1.27-1.27a2 2 0 012.11-.45c.907.339 1.85.573 2.81.7A2 2 0 0122 16.92z"/>
        </svg>
        Gọi cấp cứu: <?php echo $siteEsc($siteContact['hotline']); ?>
      </a>
    </div>
  </nav>

  <div class="nav-overlay" id="nav-overlay" aria-hidden="true"></div>

  <!-- ============================================================
       NVYT LOGIN MODAL
       ============================================================ -->
  <div class="custom-modal-overlay" id="modalLogin" data-lenis-prevent tabindex="-1" aria-hidden="true">
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
              <span class="custom-modal-subtitle">Bệnh viện đa khoa khu vực Đăk Hà</span>
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
<?php  require_once "slider.php";?>
