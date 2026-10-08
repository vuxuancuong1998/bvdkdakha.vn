<?php require_once 'header.php'; ?>
<link rel="stylesheet" href="<?php echo XC_URL; ?>/template/frontend/assets/css/tin-tuc.css" />

<?php
$current_url = (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on' ? "https" : "http") . "://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";

// Image URL helper
$img_src = '';
if (!empty($news_detail->event_image)) {
    $img_src = (strpos($news_detail->event_image, 'http') === 0) ? $news_detail->event_image : XC_URL . '/uploads/events/' . $news_detail->event_image;
} elseif (!empty($news_detail->thumbnail_url)) {
    $img_src = (strpos($news_detail->thumbnail_url, 'http') === 0) ? $news_detail->thumbnail_url : XC_URL . $news_detail->thumbnail_url;
}

$title = $news_detail->event_name ?? $news_detail->title ?? '';
$description = $news_detail->event_description ?? $news_detail->description ?? '';
$content = $news_detail->event_content ?? $news_detail->content ?? '';
$created_date = $news_detail->event_created_date ?? $news_detail->published_at ?? $news_detail->created_at ?? '';
?>

<main id="main-content" role="main" class="news-page news-detail-page">
  <div class="news-main-wrapper">
    <div class="container">
      <div class="news-layout news-detail-layout">
        <article class="news-posts-col news-article" itemscope itemtype="https://schema.org/NewsArticle">
          <header class="news-article-header">
            <span class="news-article-kicker"><i class="fa-regular fa-newspaper" aria-hidden="true"></i> Tin tức &amp; sự kiện</span>
            <h1 class="news-detail-title" itemprop="headline"><?php echo htmlspecialchars($title, ENT_QUOTES, 'UTF-8'); ?></h1>
            <div class="news-detail-meta">
              <span><i class="fa-regular fa-calendar-days" aria-hidden="true"></i> <time datetime="<?php echo !empty($created_date) ? date('Y-m-d', strtotime($created_date)) : ''; ?>" itemprop="datePublished"><?php echo !empty($created_date) ? date('d/m/Y H:i', strtotime($created_date)) : 'Chưa cập nhật'; ?></time></span>
              <span><i class="fa-regular fa-user" aria-hidden="true"></i> <?php echo htmlspecialchars($news_detail->author_name ?? 'Ban biên tập', ENT_QUOTES, 'UTF-8'); ?></span>
            </div>
            <?php if (!empty($description)): ?>
              <p class="news-detail-summary" itemprop="description"><?php echo htmlspecialchars($description, ENT_QUOTES, 'UTF-8'); ?></p>
            <?php endif; ?>
          </header>

          <?php if (!empty($img_src)): ?>
            <figure class="news-detail-thumbnail">
              <img src="<?php echo htmlspecialchars($img_src, ENT_QUOTES, 'UTF-8'); ?>" alt="<?php echo htmlspecialchars($title, ENT_QUOTES, 'UTF-8'); ?>" itemprop="image" fetchpriority="high">
            </figure>
          <?php endif; ?>

          <div class="news-detail-body post-content" itemprop="articleBody"><?php echo $content; ?></div>

          <?php if (!empty($news_detail->event_attachment)): ?>
            <div class="news-attachment">
              <span class="news-attachment-icon"><i class="fa-solid fa-paperclip" aria-hidden="true"></i></span>
              <div><strong>Tệp đính kèm</strong><a href="<?php echo XC_URL.'/uploads/events/'.htmlspecialchars($news_detail->event_attachment, ENT_QUOTES, 'UTF-8'); ?>" target="_blank" rel="noopener"><?php echo htmlspecialchars($news_detail->event_attachment_name ?: 'Xem tệp đính kèm', ENT_QUOTES, 'UTF-8'); ?></a></div>
            </div>
          <?php endif; ?>

          <div class="news-detail-share">
            <span>Chia sẻ bài viết</span>
            <div class="news-share-actions">
              <a href="https://www.facebook.com/sharer/sharer.php?u=<?php echo urlencode($current_url); ?>" target="_blank" rel="noopener noreferrer" class="news-share-button news-share-facebook"><i class="fa-brands fa-facebook-f" aria-hidden="true"></i> Facebook</a>
              <button type="button" class="news-share-button news-share-copy" onclick="copyArticleLink(this)"><i class="fa-regular fa-copy" aria-hidden="true"></i> Sao chép liên kết</button>
            </div>
          </div>
        </article>
        <aside class="news-sidebar news-detail-sidebar" aria-label="Tin tức mới">
          <div class="news-popular-panel">
            <div class="news-popular-heading"><span class="news-popular-icon"><i class="fa-regular fa-clock" aria-hidden="true"></i></span><div><span>Cập nhật gần đây</span><h2>Tin tức mới</h2></div></div>
            <?php
              $type_labels = array(1 => 'Hoạt động nội bộ', 2 => 'Sự kiện - Hội thảo', 3 => 'Thông báo - Hướng dẫn', 4 => 'Y tế cộng đồng');
              $latest_items = isset($latest_news) && is_array($latest_news) ? $latest_news : array();
            ?>
            <?php if ($latest_items): ?>
              <ol class="news-popular-list">
                <?php foreach ($latest_items as $item):
                  $item_url = $this->helper->permalink($item->id, 'event_detail');
                  $item_title = $item->event_name ?? '';
                  $item_type = $type_labels[(int)($item->event_type ?? 0)] ?? 'Tin tức';
                  $item_img = !empty($item->event_image) ? (strpos($item->event_image, 'http') === 0 ? $item->event_image : XC_URL . '/uploads/events/' . $item->event_image) : XC_URL . '/template/frontend/assets/images/banner-01.jpg';
                ?>
                  <li><a class="news-popular-link" href="<?php echo htmlspecialchars($item_url, ENT_QUOTES, 'UTF-8'); ?>">
                    <span class="news-popular-image"><img src="<?php echo htmlspecialchars($item_img, ENT_QUOTES, 'UTF-8'); ?>" alt="" loading="lazy"><span class="news-popular-category"><?php echo htmlspecialchars($item_type, ENT_QUOTES, 'UTF-8'); ?></span></span>
                    <span class="news-popular-copy"><strong><?php echo htmlspecialchars($item_title, ENT_QUOTES, 'UTF-8'); ?></strong><?php if (!empty($item->event_created_date)): ?><time datetime="<?php echo date('Y-m-d', strtotime($item->event_created_date)); ?>"><?php echo date('d/m/Y', strtotime($item->event_created_date)); ?></time><?php endif; ?></span>
                  </a></li>
                <?php endforeach; ?>
              </ol>
            <?php else: ?>
              <p class="news-popular-empty">Chưa có tin mới.</p>
            <?php endif; ?>
            <a class="news-popular-more" href="<?php echo XC_URL; ?>/tin-tuc.html">Xem tất cả tin tức <i class="fa-solid fa-arrow-right" aria-hidden="true"></i></a>
          </div>
        </aside>


      </div>
    </div>
  </div>
<?php
// ============================================================
// TIN LIÊN QUAN — Slider (15 tin mới nhất cùng event_type)
// ============================================================
$related_news_list = isset($related_news) && is_array($related_news) ? $related_news : [];
if (!empty($related_news_list)):
?>
<section class="related-news-section" aria-label="Tin liên quan">
  <div class="container">
    <div class="related-news-header">
      <span class="related-news-badge">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" width="16" height="16" aria-hidden="true"><path d="M13 2L3 14h9l-1 8 10-12h-9l1-8z"/></svg>
      </span>
      <h2 class="related-news-title">Tin liên quan</h2>
      <div class="related-nav-btns">
        <button class="related-nav-btn" id="related-prev" aria-label="Tin trước">
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" width="18" height="18" aria-hidden="true"><polyline points="15 18 9 12 15 6"/></svg>
        </button>
        <button class="related-nav-btn" id="related-next" aria-label="Tin tiếp">
          <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" width="18" height="18" aria-hidden="true"><polyline points="9 18 15 12 9 6"/></svg>
        </button>
      </div>
    </div>

    <div class="related-slider-outer">
      <div class="related-slider-track" id="related-slider-track">
        <?php foreach ($related_news_list as $rel):
          $rel_url      = $this->helper->permalink($rel->id, 'event_detail');
          $rel_img      = !empty($rel->event_image)
                          ? (strpos($rel->event_image, 'http') === 0 ? $rel->event_image : XC_URL . '/uploads/events/' . $rel->event_image)
                          : XC_URL . '/template/frontend/assets/images/banner-01.jpg';
          $rel_title    = htmlspecialchars($rel->event_name ?? '', ENT_QUOTES, 'UTF-8');
          $rel_desc     = htmlspecialchars(mb_strimwidth(strip_tags($rel->event_description ?? ''), 0, 90, '…'), ENT_QUOTES, 'UTF-8');
          $rel_date     = !empty($rel->event_created_date) ? date('d/m/Y', strtotime($rel->event_created_date)) : date('d/m/Y');
          $rel_datetime = !empty($rel->event_created_date) ? date('Y-m-d', strtotime($rel->event_created_date)) : date('Y-m-d');
        ?>
        <div class="related-slide">
          <article class="related-card" itemscope itemtype="https://schema.org/NewsArticle">
            <a href="<?php echo $rel_url; ?>" class="related-card-img-link" tabindex="-1" aria-hidden="true">
              <img src="<?php echo $rel_img; ?>"
                   alt="<?php echo $rel_title; ?>"
                   class="related-card-img"
                   loading="lazy" width="320" height="200"
                   itemprop="image" />
            </a>
            <div class="related-card-body">
              <time class="related-card-date" datetime="<?php echo $rel_datetime; ?>" itemprop="datePublished"><?php echo $rel_date; ?></time>
              <h3 class="related-card-title" itemprop="headline">
                <a href="<?php echo $rel_url; ?>" itemprop="url"><?php echo $rel_title; ?></a>
              </h3>
              <p class="related-card-desc" itemprop="description"><?php echo $rel_desc; ?></p>
            </div>
          </article>
        </div>
        <?php endforeach; ?>
      </div>
    </div>

    <div class="related-dots" id="related-dots" aria-label="Điều hướng slider"></div>
  </div>
</section>

<script>
(function() {
  var track    = document.getElementById('related-slider-track');
  var prevBtn  = document.getElementById('related-prev');
  var nextBtn  = document.getElementById('related-next');
  var dotsWrap = document.getElementById('related-dots');
  if (!track || !prevBtn || !nextBtn) return;

  var slides    = track.querySelectorAll('.related-slide');
  var total     = slides.length;
  var current   = 0;
  var autoTimer = null;
  var AUTO_DELAY = 4500;

  function getVisible() {
    var w = window.innerWidth;
    if (w >= 1200) return 4;
    if (w >= 900)  return 3;
    if (w >= 600)  return 2;
    return 1;
  }

  function maxIndex() { return Math.max(0, total - getVisible()); }

  function updateSlider() {
    var vis    = getVisible();
    var pct    = 100 / vis;
    var offset = current * pct;
    track.style.transform = 'translateX(-' + offset + '%)';
    slides.forEach(function(s) { s.style.flex = '0 0 ' + pct + '%'; s.style.maxWidth = pct + '%'; });
    if (dotsWrap) {
      dotsWrap.innerHTML = '';
      for (var i = 0; i <= maxIndex(); i++) {
        var d = document.createElement('button');
        d.className = 'related-dot' + (i === current ? ' active' : '');
        d.setAttribute('aria-label', 'Slide ' + (i + 1));
        d.setAttribute('data-idx', i);
        d.addEventListener('click', onDotClick);
        dotsWrap.appendChild(d);
      }
    }
    prevBtn.disabled = (current === 0);
    nextBtn.disabled = (current >= maxIndex());
    prevBtn.classList.toggle('disabled', current === 0);
    nextBtn.classList.toggle('disabled', current >= maxIndex());
  }

  function onDotClick(e) {
    current = parseInt(e.currentTarget.getAttribute('data-idx'));
    updateSlider(); resetAuto();
  }
  function goNext() { current = current >= maxIndex() ? 0 : current + 1; updateSlider(); }
  function goPrev() { current = current <= 0 ? maxIndex() : current - 1; updateSlider(); }
  function startAuto() { clearInterval(autoTimer); autoTimer = setInterval(goNext, AUTO_DELAY); }
  function resetAuto() { clearInterval(autoTimer); startAuto(); }

  prevBtn.addEventListener('click', function() { goPrev(); resetAuto(); });
  nextBtn.addEventListener('click', function() { goNext(); resetAuto(); });

  var touchStartX = 0;
  track.addEventListener('touchstart', function(e) { touchStartX = e.touches[0].clientX; }, {passive:true});
  track.addEventListener('touchend', function(e) {
    var diff = touchStartX - e.changedTouches[0].clientX;
    if (Math.abs(diff) > 40) { diff > 0 ? goNext() : goPrev(); resetAuto(); }
  });
  window.addEventListener('resize', function() {
    if (current > maxIndex()) current = maxIndex();
    updateSlider();
  });

  updateSlider();
  startAuto();
})();
</script>
<?php endif; ?>

</main>

<script>
function copyArticleLink(button) {
  navigator.clipboard.writeText(window.location.href).then(function () {
    var label = button.innerHTML;
    button.innerHTML = '<i class="fa-solid fa-check" aria-hidden="true"></i> Đã sao chép';
    setTimeout(function () { button.innerHTML = label; }, 2500);
  });
}</script>

<?php require_once 'footer.php'; ?>
