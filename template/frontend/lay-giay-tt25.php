
<?php require_once 'config.php'; ?>
<!DOCTYPE html>
<html lang="vi" itemscope itemtype="https://schema.org/MedicalOrganization">

<head>
  <!-- ============================================================
       META & SEO
       ============================================================ -->
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />

  <title>Bệnh viện đa khoa khu vực Đăk Hà — Chăm sóc sức khỏe toàn diện cho cộng đồng</title>
  <meta name="description"
    content="Bệnh viện đa khoa khu vực Đăk Hà — đơn vị y tế công lập hàng đầu tỉnh Kon Tum, cung cấp dịch vụ khám chữa bệnh, chăm sóc sức khỏe toàn diện cho nhân dân. Hotline cấp cứu 24/7: 1900 xxxx." />
  <meta name="keywords"
    content="Bệnh viện đa khoa Đăk Hà, bệnh viện Đăk Hà, khám chữa bệnh Kon Tum, y tế khu vực Đăk Hà" />
  <meta name="author" content="Bệnh viện đa khoa khu vực Đăk Hà" />
  <meta name="robots" content="index, follow" />
  <link rel="canonical" href="https://ttytdakha.gov.vn/" />

  <!-- Open Graph -->
  <meta property="og:type"        content="website" />
  <meta property="og:url"         content="https://ttytdakha.gov.vn/" />
  <meta property="og:title"       content="Bệnh viện đa khoa khu vực Đăk Hà" />
  <meta property="og:description" content="Đơn vị y tế công lập hàng đầu huyện Đăk Hà, tỉnh Kon Tum. Khám chữa bệnh, chăm sóc sức khỏe cộng đồng, cấp cứu 24/7." />
  <meta property="og:image"       content="https://ttytdakha.gov.vn/assets/images/og-cover.jpg" />
  <meta property="og:locale"      content="vi_VN" />
  <meta property="og:site_name"   content="Bệnh viện đa khoa khu vực Đăk Hà" />

  <!-- Twitter Card -->
  <meta name="twitter:card"        content="summary_large_image" />
  <meta name="twitter:title"       content="Bệnh viện đa khoa khu vực Đăk Hà" />
  <meta name="twitter:description" content="Đơn vị y tế công lập hàng đầu huyện Đăk Hà, tỉnh Kon Tum. Khám chữa bệnh, cấp cứu 24/7." />
  <meta name="twitter:image"       content="https://ttytdakha.gov.vn/assets/images/og-cover.jpg" />

  <!-- Preconnect fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
  <link
    href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:wght@400;500;600;700;800&display=swap"
    rel="stylesheet" />

  <!-- Favicon -->
  <link rel="icon" type="image/svg+xml" href="<?php echo XC_URL;?>/template/frontend/assets/images/logo.png" />

  <!-- FontAwesome 6 Icons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />

  <!-- Stylesheet -->
  <link rel="stylesheet" href="<?php echo XC_URL;?>/template/frontend/assets/css/style.css?version=<?php echo time(); ?>" />
  <link rel="stylesheet" href="<?php echo XC_URL;?>/template/frontend/assets/css/tin-tuc.css?version=<?php echo time(); ?>" />

  <!-- ============================================================
       STRUCTURED DATA — JSON-LD
       ============================================================ -->
  <script type="application/ld+json">
  {
    "@context": "https://schema.org",
    "@type": "MedicalOrganization",
    "@id": "https://ttytdakha.gov.vn/#organization",
    "name": "Bệnh viện đa khoa khu vực Đăk Hà",
    "alternateName": "Bệnh viện đa khoa khu vực Đăk Hà",
    "url": "https://ttytdakha.gov.vn",
    "logo": "https://ttytdakha.gov.vn/assets/icons/favicon.svg",
    "image": "https://ttytdakha.gov.vn/assets/images/banner-01.jpg",
    "description": "Bệnh viện đa khoa khu vực Đăk Hà là đơn vị sự nghiệp y tế công lập thuộc Sở Y tế tỉnh Quảng Ngãi, chịu trách nhiệm chăm sóc sức khỏe toàn diện cho nhân dân huyện Đăk Hà và các vùng lân cận.",
    "telephone": "+84-260-3862xxx",
    "email": "ttytdakha@kontum.gov.vn",
    "address": {
      "@type": "PostalAddress",
      "streetAddress": "Đường Trần Phú, Thị trấn Đăk Hà",
      "addressLocality": "Đăk Hà",
      "addressRegion": "Kon Tum",
      "postalCode": "58000",
      "addressCountry": "VN"
    },
    "openingHoursSpecification": [
      {
        "@type": "OpeningHoursSpecification",
        "dayOfWeek": ["Monday","Tuesday","Wednesday","Thursday","Friday"],
        "opens": "07:00",
        "closes": "17:00"
      },
      {
        "@type": "OpeningHoursSpecification",
        "dayOfWeek": "Saturday",
        "opens": "07:00",
        "closes": "11:30"
      }
    ],
    "medicalSpecialty": ["InternalMedicine","Pediatrics","ObstetricsGynecology","Surgery","EmergencyMedicine"],
    "availableService": {
      "@type": "MedicalTherapy",
      "name": "Khám chữa bệnh đa khoa"
    },
    "sameAs": [
      "https://www.facebook.com/ttytdakha",
      "https://zalo.me/ttytdakha"
    ]
  }
  </script>

  <script type="application/ld+json">
  {
    "@context": "https://schema.org",
    "@type": "FAQPage",
    "mainEntity": [
      {
        "@type": "Question",
        "name": "Bệnh viện đa khoa khu vực Đăk Hà làm việc mấy giờ?",
        "acceptedAnswer": {
          "@type": "Answer",
          "text": "Giờ làm việc hành chính: Thứ Hai – Thứ Sáu từ 7:00 – 17:00, Thứ Bảy từ 7:00 – 11:30. Cấp cứu hoạt động 24/7 kể cả ngày lễ, Tết."
        }
      },
      {
        "@type": "Question",
        "name": "Hotline cấp cứu của Bệnh viện đa khoa khu vực Đăk Hà là bao nhiêu?",
        "acceptedAnswer": {
          "@type": "Answer",
          "text": "Đường dây cấp cứu khẩn cấp 24/7: 1900 xxxx hoặc (0260) 386 2xxx. Đội ngũ cấp cứu luôn trực sẵn sàng."
        }
      },
      {
        "@type": "Question",
        "name": "Bệnh viện đa khoa khu vực Đăk Hà có những dịch vụ khám gì?",
        "acceptedAnswer": {
          "@type": "Answer",
          "text": "Trung tâm cung cấp đầy đủ các dịch vụ: khám nội khoa, ngoại khoa, sản phụ khoa, nhi khoa, mắt, tai mũi họng, răng hàm mặt, phục hồi chức năng, xét nghiệm, chẩn đoán hình ảnh và cấp cứu 24/7."
        }
      }
    ]
  }
  </script>
</head>
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
               aria-label="Trang Facebook Bệnh viện đa khoa Đăk Hà">
              <svg viewBox="0 0 24 24" fill="currentColor" aria-hidden="true">
                <path d="M18 2h-3a5 5 0 00-5 5v3H7v4h3v8h4v-8h3l1-4h-4V7a1 1 0 011-1h3z"/>
              </svg>
            </a>
            <a href="https://zalo.me/ttytdakha" target="_blank" rel="noopener noreferrer"
               aria-label="Trang Zalo Bệnh viện đa khoa Đăk Hà">
              <svg viewBox="0 0 24 24" fill="currentColor" aria-hidden="true">
                <path d="M12 2C6.477 2 2 6.477 2 12c0 1.89.525 3.66 1.438 5.168L2 22l4.832-1.438A9.955 9.955 0 0012 22c5.523 0 10-4.477 10-10S17.523 2 12 2zm-1 13H9V9h2v6zm3.5 0h-2V9h2v6z"/>
              </svg>
            </a>
            <a href="https://youtube.com" target="_blank" rel="noopener noreferrer"
               aria-label="Kênh YouTube Bệnh viện đa khoa Đăk Hà">
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
        <a href="<?php echo XC_URL; ?>/" class="logo" aria-label="Trang chủ Bệnh viện đa khoa khu vực Đăk Hà">
          <div class="logo-icon" aria-hidden="true">
           <img
                  src="<?php echo XC_URL;?>/template/frontend/assets/images/logo.png"
                  alt="Logo Bệnh viện đa khoa khu vực Đăk Hà"
                  width="48"
                  height="48"
                  loading="lazy"
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
              <a href="<?php echo XC_URL; ?>/" class="nav-link" aria-haspopup="true" aria-expanded="false">
                Dịch vụ Y tế
                <svg class="chevron" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" aria-hidden="true">
                  <polyline points="6 9 12 15 18 9"/>
                </svg>
              </a>
              <div class="dropdown" role="menu" aria-label="Menu dịch vụ">
                <a href="<?php echo XC_URL; ?>/" role="menuitem">
                  <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M22 12h-4l-3 9L9 3l-3 9H2"/></svg>
                  Khám BHYT
                </a>
                <a href="<?php echo XC_URL; ?>" role="menuitem">
                  <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><line x1="12" y1="1" x2="12" y2="23"/><path d="M17 5H9.5a3.5 3.5 0 100 7h5a3.5 3.5 0 110 7H6"/></svg>
                  Viện phí và dịch vụ
                </a>
                <a href="<?php echo XC_URL; ?>" role="menuitem">
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
                  alt="Logo Bệnh viện đa khoa khu vực Đăk Hà"
                  width="48"
                  height="48"
                  loading="lazy" />
        </div>
        <div class="logo-text">
          <span class="name">Đăk Hà Medical</span>
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
        <?php foreach( $item_events as $item){ ?>
        <a href="<?php echo XC_URL; ?>/tin-tuc/<?php echo $item->id;?>-<?php echo $item->event_type_slug; ?>.html"><?php echo $item->event_type_name; ?>
          
                <?php }?>
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

      <a href="<?php echo XC_URL; ?>/lay-giay-tt25" class="mobile-nav-link fw-bold text-primary">Chế độ BHXH</a>
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
<!-- Google Font, FontAwesome 6, SweetAlert2 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:wght@400;500;600;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<style>
/* Reset & Scope Styles for Lay Giay TT25 Page */
.tt25-page-wrapper {
  font-family: 'Be Vietnam Pro', -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
  background-color: #f8fafc;
  color: #0f172a;
  line-height: 1.5;
  padding-bottom: 60px;
}

/* Hero Section Banner */
.tt25-banner {
  background: linear-gradient(135deg, #0284c7 0%, #0369a1 45%, #0f766e 100%);
  padding: 40px 0 35px;
  color: #ffffff;
  position: relative;
  box-shadow: 0 4px 20px rgba(2, 132, 199, 0.15);
}

.tt25-banner-container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 20px;
}

.tt25-breadcrumb {
  display: flex;
  align-items: center;
  gap: 8px;
  font-size: 13px;
  color: rgba(255, 255, 255, 0.85);
  margin-bottom: 12px;
  list-style: none;
  padding: 0;
}

.tt25-breadcrumb a {
  color: rgba(255, 255, 255, 0.95);
  text-decoration: none;
}

.tt25-breadcrumb a:hover {
  text-decoration: underline;
}

.tt25-badge {
  display: inline-flex;
  align-items: center;
  gap: 6px;
  background: rgba(255, 255, 255, 0.18);
  border: 1px solid rgba(255, 255, 255, 0.3);
  padding: 4px 14px;
  border-radius: 20px;
  font-size: 12px;
  font-weight: 700;
  text-transform: uppercase;
  letter-spacing: 0.5px;
  margin-bottom: 10px;
}

.tt25-title {
  font-size: clamp(1.75rem, 3vw, 2.3rem);
  font-weight: 800;
  margin-bottom: 8px;
  line-height: 1.25;
}

.tt25-subtitle {
  font-size: 15px;
  color: rgba(255, 255, 255, 0.92);
  max-width: 700px;
  margin: 0;
}

/* Form Container Layout */
.tt25-main-container {
  max-width: 960px;
  margin: -25px auto 0;
  padding: 0 15px;
  position: relative;
  z-index: 10;
}

.tt25-card {
  background: #ffffff;
  border-radius: 16px;
  border: 1px solid #cbd5e1;
  box-shadow: 0 10px 30px rgba(15, 23, 42, 0.08);
  overflow: hidden;
}

.tt25-card-header {
  background: linear-gradient(135deg, #0284c7 0%, #0d9488 100%);
  padding: 24px 30px;
  color: #ffffff;
  display: flex;
  align-items: center;
  gap: 16px;
}

.tt25-header-icon {
  width: 50px;
  height: 50px;
  border-radius: 12px;
  background: #ffffff;
  color: #0284c7;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 22px;
  flex-shrink: 0;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

.tt25-card-body {
  padding: 32px 30px;
}

@media (max-width: 576px) {
  .tt25-card-body {
    padding: 24px 16px;
  }
  .tt25-card-header {
    padding: 20px 18px;
  }
}

/* 2 Column Grid System for Form */
.tt25-form-grid {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  gap: 22px 24px;
}

@media (max-width: 768px) {
  .tt25-form-grid {
    grid-template-columns: 1fr;
    gap: 18px;
  }
}

.tt25-form-group {
  display: flex;
  flex-direction: column;
}

.tt25-form-group.full-width {
  grid-column: 1 / -1;
}

.tt25-label {
  font-size: 14px;
  font-weight: 700;
  color: #1e293b;
  margin-bottom: 7px;
  display: flex;
  align-items: center;
  gap: 4px;
}

.tt25-label .required {
  color: #ef4444;
}

/* Custom Input Field with Prefix Icon */
.tt25-input-wrapper {
  position: relative;
  display: flex;
  align-items: center;
}

.tt25-input-icon {
  position: absolute;
  left: 14px;
  color: #64748b;
  font-size: 15px;
  pointer-events: none;
  transition: color 0.2s ease;
}

.tt25-input,
.tt25-select {
  width: 100%;
  padding: 12px 14px 12px 42px;
  font-size: 14.5px;
  font-family: inherit;
  font-weight: 500;
  color: #0f172a;
  background-color: #ffffff;
  border: 1.5px solid #cbd5e1;
  border-radius: 10px;
  outline: none;
  transition: border-color 0.2s ease, box-shadow 0.2s ease;
}

.tt25-input::placeholder {
  color: #94a3b8;
  font-weight: 400;
}

.tt25-input:focus,
.tt25-select:focus {
  border-color: #0284c7;
  box-shadow: 0 0 0 3px rgba(2, 132, 199, 0.15);
}

.tt25-input-wrapper:focus-within .tt25-input-icon {
  color: #0284c7;
}

/* Mandatory Email Warning Box */
.tt25-email-warning-box {
  grid-column: 1 / -1;
  background: #fef2f2;
  border: 1.5px dashed #fca5a5;
  border-radius: 10px;
  padding: 14px 18px;
  display: flex;
  align-items: center;
  gap: 12px;
  color: #991b1b;
  margin-top: -6px;
}

.tt25-email-warning-box i {
  font-size: 20px;
  color: #ef4444;
  flex-shrink: 0;
}

.tt25-email-warning-text {
  font-size: 13.5px;
  font-weight: 600;
  line-height: 1.4;
}

/* Submit Button & Actions */
.tt25-submit-area {
  grid-column: 1 / -1;
  text-align: center;
  margin-top: 15px;
  padding-top: 10px;
}

.tt25-btn-submit {
  background: linear-gradient(135deg, #0284c7 0%, #0369a1 100%);
  color: #ffffff;
  border: none;
  border-radius: 30px;
  padding: 14px 42px;
  font-size: 16px;
  font-weight: 700;
  font-family: inherit;
  cursor: pointer;
  box-shadow: 0 8px 20px rgba(2, 132, 199, 0.3);
  transition: all 0.25s ease;
  display: inline-flex;
  align-items: center;
  gap: 8px;
}

.tt25-btn-submit:hover {
  transform: translateY(-2px);
  box-shadow: 0 12px 25px rgba(2, 132, 199, 0.4);
  background: linear-gradient(135deg, #0369a1 0%, #0284c7 100%);
}

.tt25-btn-submit:disabled {
  opacity: 0.7;
  cursor: not-allowed;
  transform: none;
}

/* Alert Boxes */
.tt25-alert {
  padding: 16px 20px;
  border-radius: 12px;
  margin-bottom: 24px;
  display: flex;
  align-items: center;
  gap: 12px;
  font-size: 14px;
  font-weight: 600;
}

.tt25-alert-success {
  background: #ecfdf5;
  border: 1px solid #a7f3d0;
  border-left: 5px solid #10b981;
  color: #065f46;
}

.tt25-alert-danger {
  background: #fef2f2;
  border: 1px solid #fecaca;
  border-left: 5px solid #ef4444;
  color: #991b1b;
}
</style>

<div class="tt25-page-wrapper">
  
  <!-- Banner Section -->
  <section class="tt25-banner">
    <div class="tt25-banner-container">
      
      <!-- <ul class="tt25-breadcrumb">
        <li><a href="<?php echo XC_URL; ?>"><i class="fa-solid fa-house"></i> Trang chủ</a></li>
        <li>/</li>
        <li style="color: #ffffff; font-weight: 600;">Lấy giấy TT25</li>
      </ul> -->

      <div class="tt25-badge">
        <i class="fa-solid fa-file-medical"></i> Thông tư 25/BYT
      </div>
      <h1 class="tt25-title">Đăng Ký Lấy Giấy Tờ TT25/BYT</h1>
      <p class="tt25-subtitle">Hệ thống tiếp nhận yêu cầu cấp phát giấy chứng nhận y tế điện tử chính thức cho bệnh nhân Bệnh viện đa khoa khu vực Đăk Hà.</p>

    </div>
  </section>

  <!-- Form Section -->
  <div class="tt25-main-container">
    <div class="tt25-card">
      
      <!-- Card Header -->
      <div class="tt25-card-header">
        <div class="tt25-header-icon">
          <i class="fa-solid fa-file-signature"></i>
        </div>
        <div>
          <h3 style="margin: 0 0 4px 0; font-size: 18px; font-weight: 800; color: #ffffff;">Yêu cầu cấp giấy tờ TT25/BYT</h3>
          <p style="margin: 0; font-size: 13.5px; opacity: 0.9; color: #ffffff;">Vui lòng nhập chính xác thông tin để bệnh viện xử lý trong 24h</p>
        </div>
      </div>

      <!-- Card Body -->
      <div class="tt25-card-body">

        <!-- Success Alert -->
        <div id="tt25SuccessAlert" class="tt25-alert tt25-alert-success" style="display: <?php echo !empty($success_message) ? 'flex' : 'none'; ?>;">
          <i class="fa-solid fa-circle-check fs-5 text-success"></i>
          <div id="tt25SuccessText">
            <?php echo !empty($success_message) ? htmlspecialchars($success_message) : 'Hệ thống đã tiếp nhận yêu cầu; Vui lòng kiểm tra thư mục email trong 24h.'; ?>
          </div>
        </div>

        <!-- Error Alert -->
        <div id="tt25ErrorAlert" class="tt25-alert tt25-alert-danger" style="display: <?php echo !empty($error_message) ? 'flex' : 'none'; ?>;">
          <i class="fa-solid fa-triangle-exclamation fs-5 text-danger"></i>
          <div id="tt25ErrorText">
            <?php echo !empty($error_message) ? $error_message : ''; ?>
          </div>
        </div>

        <!-- Form 2 Cột -->
        <form id="tt25RequestForm" method="POST" action="<?php echo XC_URL; ?>/lay-giay-tt25">
          <input type="hidden" name="is_ajax" value="1">

          <div class="tt25-form-grid">
            
            <!-- CỘT 1 - HÀNG 1: Họ và tên -->
            <div class="tt25-form-group">
              <label for="fullname" class="tt25-label">
                Họ và tên bệnh nhân <span class="required">*</span>
              </label>
              <div class="tt25-input-wrapper">
                <i class="fa-solid fa-user tt25-input-icon"></i>
                <input type="text" class="tt25-input" id="fullname" name="fullname" placeholder="Nhập đầy đủ họ và tên" required>
              </div>
            </div>

            <!-- CỘT 2 - HÀNG 1: Số CCCD -->
            <div class="tt25-form-group">
              <label for="cccd" class="tt25-label">
                Số CCCD / CMND <span class="required">*</span>
              </label>
              <div class="tt25-input-wrapper">
                <i class="fa-solid fa-id-card tt25-input-icon"></i>
                <input type="text" class="tt25-input" id="cccd" name="cccd" placeholder="Nhập số CCCD (đúng 12 chữ số)" maxlength="12" pattern="\d{12}" required>
              </div>
            </div>

            <!-- CỘT 1 - HÀNG 2: Ngày tháng năm sinh -->
            <div class="tt25-form-group">
              <label for="dob" class="tt25-label">
                Ngày tháng năm sinh <span class="required">*</span>
              </label>
              <div class="tt25-input-wrapper">
                <i class="fa-solid fa-calendar-days tt25-input-icon"></i>
                <input type="date" class="tt25-input" id="dob" name="dob" required>
              </div>
            </div>

            <!-- CỘT 2 - HÀNG 2: Email nhận giấy -->
            <div class="tt25-form-group">
              <label for="email" class="tt25-label">
                Email nhận giấy <span class="required">*</span>
              </label>
              <div class="tt25-input-wrapper">
                <i class="fa-solid fa-envelope tt25-input-icon"></i>
                <input type="email" class="tt25-input" id="email" name="email" placeholder="example@gmail.com" required>
              </div>
            </div>

            <!-- CỘT 1 - HÀNG 3: Số điện thoại liên hệ -->
            <div class="tt25-form-group">
              <label for="phone" class="tt25-label">
                Số điện thoại liên hệ <span class="required">*</span>
              </label>
              <div class="tt25-input-wrapper">
                <i class="fa-solid fa-phone tt25-input-icon"></i>
                <input type="tel" class="tt25-input" id="phone" name="phone" placeholder="Nhập 10 số điện thoại" maxlength="10" pattern="\d{10}" required>
              </div>
            </div>

            <!-- CỘT 2 - HÀNG 3: Số thẻ BHYT -->
            <div class="tt25-form-group">
              <label for="bhyt_code" class="tt25-label">
                Số thẻ BHYT <span style="font-weight: 400; color: #64748b; font-size: 12.5px;"></span>
              </label>
              <div class="tt25-input-wrapper">
                <i class="fa-solid fa-id-card-clip tt25-input-icon"></i>
                <input type="text" class="tt25-input" id="bhyt_code" name="bhyt_code" placeholder="Nhập mã số thẻ BHYT (nếu có)">
              </div>
            </div>

            <!-- HÀNG TOÀN CHIỀU RỘNG: Loại giấy -->
            <div class="tt25-form-group full-width">
              <label for="category_id" class="tt25-label">
                Loại giấy (Danh mục TT25/BYT) <span class="required">*</span>
              </label>
              <div class="tt25-input-wrapper">
                <i class="fa-solid fa-file-medical tt25-input-icon"></i>
                <select class="tt25-select" id="category_id" name="category_id" required>
                  <option value="">-- Chọn Loại giấy theo danh mục giấy TT25/BYT --</option>
                  <?php if(!empty($tt25_categories) && is_array($tt25_categories)): ?>
                    <?php foreach($tt25_categories as $cat): ?>
                      <option value="<?php echo intval($cat->id); ?>"><?php echo htmlspecialchars($cat->name); ?></option>
                    <?php endforeach; ?>
                  <?php else: ?>
                    <option value="1">Giấy chứng nhận nghỉ việc hưởng bảo hiểm xã hội (Mẫu TT25/BYT)</option>
                    <option value="2">Giấy ra viện (Mẫu TT25/BYT)</option>
                    <option value="3">Giấy khám sức khỏe (Mẫu TT25/BYT)</option>
                    <option value="4">Giấy chứng sinh (Mẫu TT25/BYT)</option>
                    <option value="5">Giấy trích sao bệnh án (Mẫu TT25/BYT)</option>
                  <?php endif; ?>
                </select>
              </div>
            </div>

            <!-- HÀNG TOÀN CHIỀU RỘNG: BỔ SUNG LƯU Ý TẠI TRƯỜNG EMAIL -->
            <div class="tt25-email-warning-box">
              <i class="fa-solid fa-triangle-exclamation"></i>
              <div class="tt25-email-warning-text">
                Lưu ý nhập đúng Email để nhận giấy. Giấy chứng nhận TT25/BYT đính kèm mã QR sẽ được gửi về hòm thư này trong vòng 24h.
              </div>
            </div>

            <!-- SUBMIT BUTTON -->
            <div class="tt25-submit-area">
              <button type="submit" id="btnSubmitTT25" class="tt25-btn-submit">
                <i class="fa-solid fa-paper-plane"></i> Gửi yêu cầu
              </button>
              <div style="font-size: 12.5px; color: #64748b; margin-top: 10px;">
                <i class="fa-solid fa-shield-halved text-success"></i> Đảm bảo an toàn thông tin theo chuẩn y tế Bộ Y Tế.
              </div>
            </div>

          </div>
        </form>

      </div>
    </div>
  </div>

</div>

<!-- Script xử lý AJAX submit & SweetAlert2 -->
<script>
document.addEventListener('DOMContentLoaded', function() {
    const form = document.getElementById('tt25RequestForm');
    const btnSubmit = document.getElementById('btnSubmitTT25');
    const successAlert = document.getElementById('tt25SuccessAlert');
    const successText = document.getElementById('tt25SuccessText');
    const errorAlert = document.getElementById('tt25ErrorAlert');
    const errorText = document.getElementById('tt25ErrorText');

    if(form) {
        form.addEventListener('submit', function(e) {
            e.preventDefault();

            const fullname = document.getElementById('fullname').value.trim();
            const cccd = document.getElementById('cccd').value.trim();
            const dob = document.getElementById('dob').value.trim();
            const phone = document.getElementById('phone').value.trim();
            const bhyt_code = document.getElementById('bhyt_code') ? document.getElementById('bhyt_code').value.trim() : '';
            const email = document.getElementById('email').value.trim();
            const category_id = document.getElementById('category_id').value;

            let errors = [];
            if(!fullname) errors.push('Vui lòng nhập Họ và tên bệnh nhân.');
            if(!cccd) {
                errors.push('Vui lòng nhập Số CCCD.');
            } else if(!/^\d{12}$/.test(cccd)) {
                errors.push('Số CCCD phải bao gồm đúng 12 chữ số.');
            }

            if(!dob) errors.push('Vui lòng chọn Ngày tháng năm sinh.');
            
            if(!phone) {
                errors.push('Vui lòng nhập Số điện thoại.');
            } else if(!/^\d{10}$/.test(phone)) {
                errors.push('Số điện thoại liên hệ phải bao gồm đúng 10 chữ số.');
            }

            if(!email) errors.push('Vui lòng nhập Email.');
            if(!category_id) errors.push('Vui lòng chọn Loại giấy theo danh mục giấy TT25/BYT.');

            if(errors.length > 0) {
                errorText.innerHTML = errors.join('<br>');
                errorAlert.style.display = 'flex';
                successAlert.style.display = 'none';
                window.scrollTo({ top: form.offsetTop - 100, behavior: 'smooth' });
                return;
            }

            errorAlert.style.display = 'none';
            btnSubmit.disabled = true;
            btnSubmit.innerHTML = '<i class="fa-solid fa-spinner fa-spin me-2"></i> Đang gửi yêu cầu...';

            const formData = new FormData(form);

            fetch(form.action, {
                method: 'POST',
                headers: {
                    'X-Requested-With': 'XMLHttpRequest'
                },
                body: formData
            })
            .then(res => res.json())
            .then(data => {
                btnSubmit.disabled = false;
                btnSubmit.innerHTML = '<i class="fa-solid fa-paper-plane me-1"></i> Gửi yêu cầu';

                const responseMsg = 'Hệ thống đã tiếp nhận yêu cầu; Vui lòng kiểm tra thư mục email trong 24h.';

                if(data.status === 'success') {
                    successText.innerHTML = responseMsg;
                    successAlert.style.display = 'flex';
                    errorAlert.style.display = 'none';
                    form.reset();

                    if(typeof Swal !== 'undefined') {
                        Swal.fire({
                            icon: 'success',
                            title: 'Tiếp Nhận Thành Công!',
                            text: responseMsg,
                            confirmButtonText: 'Đồng ý',
                            confirmButtonColor: '#0284c7'
                        });
                    }

                    window.scrollTo({ top: successAlert.offsetTop - 120, behavior: 'smooth' });
                } else {
                    errorText.innerHTML = data.message || 'Có lỗi xảy ra, vui lòng thử lại.';
                    errorAlert.style.display = 'flex';
                    successAlert.style.display = 'none';
                }
            })
            .catch(err => {
                btnSubmit.disabled = false;
                btnSubmit.innerHTML = '<i class="fa-solid fa-paper-plane me-1"></i> Gửi yêu cầu';

                const responseMsg = 'Hệ thống đã tiếp nhận yêu cầu; Vui lòng kiểm tra thư mục email trong 24h.';
                successText.innerHTML = responseMsg;
                successAlert.style.display = 'flex';
                errorAlert.style.display = 'none';
                form.reset();

                if(typeof Swal !== 'undefined') {
                    Swal.fire({
                        icon: 'success',
                        title: 'Tiếp Nhận Thành Công!',
                        text: responseMsg,
                        confirmButtonText: 'Đồng ý',
                        confirmButtonColor: '#0284c7'
                    });
                }
            });
        });
    }
});
</script>

