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
    <?php
    global $db;
    $siteSlides = array();
    $db->query("SHOW TABLES LIKE 'hicrm_sliders'");
    if ($db->num_row() > 0) {
      $db->query('SELECT * FROM hicrm_sliders WHERE is_active=1 ORDER BY sort_order ASC,id ASC');
      $siteSlides = $db->fetch_object();
    }
    if (!is_array($siteSlides)) $siteSlides = array();
    ?>
    <?php if ($siteSlides): ?>
    <section class="hero" aria-label="Banner trang chủ">
      <div class="slider-wrapper" role="region" aria-roledescription="slideshow" aria-label="Ảnh banner">
        <?php foreach ($siteSlides as $index => $banner):
          $image = XC_URL.'/'.ltrim((string)$banner->image_path, '/');
          $buttonUrl = trim((string)$banner->button_url);
          if ($buttonUrl !== '' && !preg_match('~^https?://~i', $buttonUrl)) $buttonUrl = XC_URL.'/'.ltrim($buttonUrl, '/');
        ?>
        <article class="slide<?php echo $index === 0 ? ' active' : ''; ?>" id="slide-<?php echo $index + 1; ?>" role="group" aria-roledescription="slide" aria-label="Slide <?php echo $index + 1; ?> / <?php echo count($siteSlides); ?>">
          <div class="slide-bg" style="background-image:url('<?php echo htmlspecialchars($image, ENT_QUOTES, 'UTF-8'); ?>')" role="img" aria-label="<?php echo htmlspecialchars((string)$banner->alt_text, ENT_QUOTES, 'UTF-8'); ?>"></div>
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
