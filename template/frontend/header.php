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

  <title>Bệnh viện đa khoa khu vực Đắk Hà — Chăm sóc sức khỏe toàn diện cho cộng đồng</title>
  <meta name="description"
    content="Bệnh viện đa khoa khu vực Đắk Hà — đơn vị y tế công lập hàng đầu tỉnh Kon Tum, cung cấp dịch vụ khám chữa bệnh, chăm sóc sức khỏe toàn diện cho nhân dân. Hotline cấp cứu 24/7: 1900 xxxx." />
  <meta name="keywords"
    content="Bệnh viện đa khoa Đắk Hà, bệnh viện Đắk Hà, khám chữa bệnh Kon Tum, y tế khu vực Đắk Hà" />
  <meta name="author" content="Bệnh viện đa khoa khu vực Đắk Hà" />
  <meta name="robots" content="index, follow" />
  <link rel="canonical" href="https://ttytdakha.gov.vn/" />

  <!-- Open Graph -->
  <meta property="og:type"        content="website" />
  <meta property="og:url"         content="https://ttytdakha.gov.vn/" />
  <meta property="og:title"       content="Bệnh viện đa khoa khu vực Đắk Hà" />
  <meta property="og:description" content="Đơn vị y tế công lập hàng đầu huyện Đắk Hà, tỉnh Kon Tum. Khám chữa bệnh, chăm sóc sức khỏe cộng đồng, cấp cứu 24/7." />
  <meta property="og:image"       content="https://ttytdakha.gov.vn/assets/images/og-cover.jpg" />
  <meta property="og:locale"      content="vi_VN" />
  <meta property="og:site_name"   content="Bệnh viện đa khoa khu vực Đắk Hà" />

  <!-- Twitter Card -->
  <meta name="twitter:card"        content="summary_large_image" />
  <meta name="twitter:title"       content="Bệnh viện đa khoa khu vực Đắk Hà" />
  <meta name="twitter:description" content="Đơn vị y tế công lập hàng đầu huyện Đắk Hà, tỉnh Kon Tum. Khám chữa bệnh, cấp cứu 24/7." />
  <meta name="twitter:image"       content="https://ttytdakha.gov.vn/assets/images/og-cover.jpg" />

  <!-- Preconnect fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
  <link
    href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:wght@400;500;600;700;800&display=swap"
    rel="stylesheet" />

  <!-- Favicon -->
  <link rel="icon" type="image/svg+xml" href="<?php echo XC_URL;?>/template/frontend/assets/icons/favicon.svg" />

  <!-- FontAwesome 6 Icons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />

  <!-- Stylesheet -->
  <link rel="stylesheet" href="<?php echo XC_URL;?>/template/frontend/assets/css/style.css?version=<?php echo time(); ?>" />

  <!-- ============================================================
       STRUCTURED DATA — JSON-LD
       ============================================================ -->
  <script type="application/ld+json">
  {
    "@context": "https://schema.org",
    "@type": "MedicalOrganization",
    "@id": "https://ttytdakha.gov.vn/#organization",
    "name": "Bệnh viện đa khoa khu vực Đắk Hà",
    "alternateName": "Bệnh viện đa khoa khu vực Đắk Hà",
    "url": "https://ttytdakha.gov.vn",
    "logo": "https://ttytdakha.gov.vn/assets/icons/favicon.svg",
    "image": "https://ttytdakha.gov.vn/assets/images/banner-01.jpg",
    "description": "Bệnh viện đa khoa khu vực Đắk Hà là đơn vị sự nghiệp y tế công lập thuộc Sở Y tế tỉnh Quảng Ngãi, chịu trách nhiệm chăm sóc sức khỏe toàn diện cho nhân dân huyện Đắk Hà và các vùng lân cận.",
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
        "name": "Bệnh viện đa khoa khu vực Đắk Hà làm việc mấy giờ?",
        "acceptedAnswer": {
          "@type": "Answer",
          "text": "Giờ làm việc hành chính: Thứ Hai – Thứ Sáu từ 7:00 – 17:00, Thứ Bảy từ 7:00 – 11:30. Cấp cứu hoạt động 24/7 kể cả ngày lễ, Tết."
        }
      },
      {
        "@type": "Question",
        "name": "Hotline cấp cứu của Bệnh viện đa khoa khu vực Đắk Hà là bao nhiêu?",
        "acceptedAnswer": {
          "@type": "Answer",
          "text": "Đường dây cấp cứu khẩn cấp 24/7: 1900 xxxx hoặc (0260) 386 2xxx. Đội ngũ cấp cứu luôn trực sẵn sàng."
        }
      },
      {
        "@type": "Question",
        "name": "Bệnh viện đa khoa khu vực Đắk Hà có những dịch vụ khám gì?",
        "acceptedAnswer": {
          "@type": "Answer",
          "text": "Trung tâm cung cấp đầy đủ các dịch vụ: khám nội khoa, ngoại khoa, sản phụ khoa, nhi khoa, mắt, tai mũi họng, răng hàm mặt, phục hồi chức năng, xét nghiệm, chẩn đoán hình ảnh và cấp cứu 24/7."
        }
      }
    ]
  }
  </script>
</head>
<?php require_once 'menu.php'; ?>