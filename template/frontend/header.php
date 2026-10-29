<?php
require_once 'config.php';
require_once __DIR__.'/ui-images.php';
$siteContact = $this->helper->get_site_contact();
$siteEsc = function ($value) { return htmlspecialchars((string)$value, ENT_QUOTES, 'UTF-8'); };
$siteJson = function ($value) { return json_encode($value, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES | JSON_HEX_TAG | JSON_HEX_AMP | JSON_HEX_APOS | JSON_HEX_QUOT); };
$siteSameAs = array_values(array_filter(array($siteContact['facebook_url'], $siteContact['zalo_url'])));
$siteEmergencyDescription = 'Đường dây cấp cứu khẩn cấp 24/7: ' . implode(' hoặc ', array_filter(array($siteContact['hotline'], $siteContact['phone']))) . '. Đội ngũ cấp cứu luôn trực sẵn sàng.';
$isHomeDesign = true;
$homeAsset = function ($path, $folder = '') {
 $path = trim((string)$path);
 if ($path === '') return XC_URL.'/template/frontend/assets/images/banner-02.jpg';
 if (preg_match('~^https?://~i', $path)) return $path;
 return XC_URL.'/'.($path[0] === '/' || strpos($path,'uploads/') === 0 ? ltrim($path,'/') : $folder.$path);
};
require_once __SITE_PATH.'/application/quick_appointment.class.php';
if (empty($_SESSION['quick_appointment_csrf'])) $_SESSION['quick_appointment_csrf'] = bin2hex(random_bytes(32));
global $db;
$db->query("SELECT id, depart_name, depart_image FROM hicrm_departments WHERE depart_status = 1 AND (depart_name LIKE 'Khoa %' OR depart_name IN ('Nội khoa','Ngoại khoa','Sản khoa','Cận lâm Sàng')) ORDER BY id ASC");
$homeDepartments = $db->fetch_object();
if (!is_array($homeDepartments)) $homeDepartments = array();
$homeDoctors = array();
foreach ((is_array($featured_doctors ?? null) ? $featured_doctors : array()) as $doctor) {
 $homeDoctors[] = array('name'=>$doctor->doctor_name, 'role'=>$doctor->doctor_position, 'dept'=>$doctor->depart_name ?? '', 'unit'=>$doctor->doctor_workplace ?? '', 'img'=>$homeAsset($doctor->doctor_avatar ?? '', 'uploads/doctors/'), 'srcset'=>site_image_srcset($homeAsset($doctor->doctor_avatar ?? '', 'uploads/doctors/')), 'desc'=>$doctor->depart_name ?? '', 'service'=>$doctor->depart_name ?? '', 'code'=>$doctor->doctor_code ?? '');
}
?>

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
    content="Bệnh viện đa khoa khu vực Đăk Hà — đơn vị y tế công lập hàng đầu tỉnh Kon Tum, cung cấp dịch vụ khám chữa bệnh, chăm sóc sức khỏe toàn diện cho nhân dân. Hotline cấp cứu 24/7: <?php echo $siteEsc($siteContact['hotline']); ?>." />
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

  <!-- Favicon -->
  <link rel="icon" type="image/svg+xml" href="<?php echo XC_URL;?>/template/frontend/assets/images/logo.png" />

  <!-- FontAwesome 6 Icons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />

  <!-- Stylesheet -->
  <link rel="stylesheet" href="<?php echo XC_URL;?>/template/frontend/assets/css/style.css?version=<?php echo filemtime(__DIR__.'/assets/css/style.css'); ?>" />
  <link rel="stylesheet" href="<?php echo XC_URL;?>/template/frontend/assets/css/tin-tuc.css?version=<?php echo filemtime(__DIR__.'/assets/css/tin-tuc.css'); ?>" />

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
    "telephone": <?php echo $siteJson($siteContact['phone']); ?>,
    "email": <?php echo $siteJson($siteContact['email']); ?>,
    "address": {
      "@type": "PostalAddress",
      "streetAddress": <?php echo $siteJson($siteContact['address']); ?>,
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
    "sameAs": <?php echo $siteJson($siteSameAs); ?>
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
          "text": <?php echo $siteJson($siteEmergencyDescription); ?>
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
<?php if (!empty($isHomeDesign)): ?>
<link rel="stylesheet" href="<?php echo XC_URL; ?>/template/frontend/assets/css/home-design.css?v=<?php echo filemtime(__DIR__.'/assets/css/home-design.css'); ?>">
<link rel="stylesheet" href="<?php echo XC_URL; ?>/template/frontend/assets/css/home-utilities.css?v=<?php echo filemtime(__DIR__.'/assets/css/home-utilities.css'); ?>">
<?php endif; ?>
<?php require __DIR__.'/ui-assets.php'; ?>
</head>
<?php require_once 'menu.php'; ?>
