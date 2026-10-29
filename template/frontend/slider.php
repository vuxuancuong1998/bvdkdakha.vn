<!-- ============================================================
       HERO BANNER SLIDER
       ============================================================ -->
        <?php
    global $db;
    $siteSlides = array();
    $db->query("SHOW TABLES LIKE 'hicrm_sliders'");
    if ($db->num_row() > 0) {
      $db->query("SHOW COLUMNS FROM hicrm_sliders LIKE 'device'");
      $hasSliderDevice = $db->num_row() > 0;
      $db->query("SHOW COLUMNS FROM hicrm_sliders LIKE 'status'");
      $hasSliderStatus = $db->num_row() > 0;
      $db->query('SELECT * FROM hicrm_sliders WHERE is_active=1'.($hasSliderStatus ? ' AND status <> 99' : '').($hasSliderDevice ? " AND device IN ('pc','mobile','all')" : '').' ORDER BY sort_order ASC,id ASC');
      $siteSlides = $db->fetch_object();
      // An empty slider table can accompany an existing installation's banner files.
      // Do not use fallbacks when managed slides exist but have been disabled.
      if (empty($siteSlides)) {
        $db->query('SELECT COUNT(*) AS total FROM hicrm_sliders');
        $sliderCount = $db->fetch_object(true);
        if ((int)$sliderCount->total === 0) {
          foreach (array('banner_01.png', 'banner_02.png') as $bannerFile) {
            if (!is_file(__SITE_PATH.'/uploads/slider/'.$bannerFile)) continue;
            $siteSlides[] = (object)array(
              'image_path' => 'uploads/slider/'.$bannerFile,
              'device' => 'all',
              'alt_text' => 'Bệnh viện đa khoa khu vực Đăk Hà',
              'eyebrow' => '', 'title' => '', 'description' => '',
              'button_label' => '', 'button_url' => ''
            );
          }
        }
      }
    }
    if (!is_array($siteSlides)) $siteSlides = array();
    ?>
    <?php if ($siteSlides): ?>
    <section class="hero" aria-label="Banner trang chủ">
      <div class="slider-wrapper" role="region" aria-roledescription="slideshow" aria-label="Ảnh banner">
        <?php $initialDevices = array(); foreach ($siteSlides as $index => $banner):
          $image = $homeAsset($banner->image_path);
          $bannerDevice = (string)($banner->device ?? 'all');
          $initialPc = $bannerDevice !== 'mobile' && empty($initialDevices['pc']);
          $initialMobile = $bannerDevice !== 'pc' && empty($initialDevices['mobile']);
          if ($initialPc) $initialDevices['pc'] = true;
          if ($initialMobile) $initialDevices['mobile'] = true;
          $buttonUrl = trim((string)$banner->button_url);
          if ($buttonUrl !== '' && !preg_match('~^https?://~i', $buttonUrl)) $buttonUrl = XC_URL.'/'.ltrim($buttonUrl, '/');
        ?>
        <article class="slide" data-initial-pc="<?php echo $initialPc ? 1 : 0; ?>" data-initial-mobile="<?php echo $initialMobile ? 1 : 0; ?>" data-device="<?php echo htmlspecialchars((string)($banner->device ?? 'all'), ENT_QUOTES, 'UTF-8'); ?>" id="slide-<?php echo $index + 1; ?>" role="group" aria-roledescription="slide" aria-label="Slide <?php echo $index + 1; ?> / <?php echo count($siteSlides); ?>" hidden>
          <img class="slide-bg" <?php echo site_image_attributes($image, '100vw', $index === 0 ? true : ($initialPc || $initialMobile ? 'eager' : false)); ?> alt="<?php echo htmlspecialchars((string)$banner->alt_text, ENT_QUOTES, 'UTF-8'); ?>">
          <div class="slide-overlay" aria-hidden="true"></div>
          <?php if ($banner->eyebrow || $banner->title || $banner->description || ($banner->button_label && $buttonUrl)): ?>
          <div class="container"><div class="slide-content">
            <?php if ($banner->eyebrow): ?><div class="slide-tag"><?php echo htmlspecialchars((string)$banner->eyebrow, ENT_QUOTES, 'UTF-8'); ?></div><?php endif; ?>
            <?php if ($banner->title): ?><h2 class="slide-title"><?php echo htmlspecialchars((string)$banner->title, ENT_QUOTES, 'UTF-8'); ?></h2><?php endif; ?>
            <?php if ($banner->description): ?><p class="slide-desc"><?php echo htmlspecialchars((string)$banner->description, ENT_QUOTES, 'UTF-8'); ?></p><?php endif; ?>
            <?php if ($banner->button_label && $buttonUrl): ?><div class="slide-cta"><a class="btn btn-accent btn-lg" href="<?php echo htmlspecialchars($buttonUrl, ENT_QUOTES, 'UTF-8'); ?>"><?php echo htmlspecialchars((string)$banner->button_label, ENT_QUOTES, 'UTF-8'); ?></a></div><?php endif; ?>
          </div></div>
          <?php endif; ?>
        </article>
        <?php endforeach; ?>
        <?php if (count($siteSlides) > 1): ?>
        <button class="slider-prev" id="slider-prev" aria-label="Slide trước"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" aria-hidden="true"><polyline points="15 18 9 12 15 6"/></svg></button>
        <button class="slider-next" id="slider-next" aria-label="Slide tiếp theo"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" aria-hidden="true"><polyline points="9 18 15 12 9 6"/></svg></button>
        <div class="slider-dots" role="tablist" aria-label="Chọn slide">
          <?php foreach ($siteSlides as $index => $banner): ?><button class="slider-dot<?php echo $index === 0 ? ' active' : ''; ?>" id="dot-<?php echo $index; ?>" role="tab" aria-selected="<?php echo $index === 0 ? 'true' : 'false'; ?>" aria-label="Slide <?php echo $index + 1; ?>" aria-controls="slide-<?php echo $index + 1; ?>"></button><?php endforeach; ?>
        </div>
        <?php endif; ?>
      </div>
    </section>
    <?php endif; ?>
    <?php require_once 'breadcrumb.php'; ?>
