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

  
  <!-- ============================================================
       MAIN CONTENT: Article body & Sidebar
       ============================================================ -->
  <div class="news-main-wrapper py-5">
    <div class="container">
      <div class="news-layout row">

        <!-- ==================================================
             LEFT COLUMN: ARTICLE DETAILS (thứ tự: event_name, event_description, event_created_date, event_image, event_content)
             ================================================== -->
        <article class="news-posts-col col-lg-8 bg-white p-4 border rounded shadow-sm" itemscope itemtype="https://schema.org/NewsArticle">
          
          <!-- 1. event_name (Tiêu đề bài viết) -->
          <h1 class="news-detail-title h2 font-weight-extrabold text-dark mt-2 mb-3" style="line-height:1.3; font-weight:800;" itemprop="headline">
            <?php echo htmlspecialchars($title, ENT_QUOTES, 'UTF-8'); ?>
          </h1>

          <!-- 2. event_description (Mô tả / Tóm tắt) -->
          <?php if (!empty($description)): ?>
          <div class="news-detail-summary p-3 mb-3 rounded bg-light text-dark font-italic" style="font-size:15px; border-left: 4px solid #075985; line-height:1.6;" itemprop="description">
            <strong>Tóm tắt:</strong> <?php echo htmlspecialchars($description, ENT_QUOTES, 'UTF-8'); ?>
          </div>
          <?php endif; ?>

          <!-- 3. Ngày xuất bản: event_created_date -->
          <div class="news-detail-meta text-muted d-flex align-items-center flex-wrap gap-3 pb-3 mb-4 border-bottom" style="font-size:13px;">
            <span class="d-flex align-items-center gap-1">
              <i class="fa-regular fa-calendar-days text-primary"></i> 
              Ngày xuất bản: <?php echo !empty($created_date) ? date('d/m/Y H:i', strtotime($created_date)) : date('d/m/Y'); ?>
            </span>
            <span class="d-flex align-items-center gap-1">
              <i class="fa-regular fa-user text-primary"></i> 
              Tác giả: <?php echo htmlspecialchars($news_detail->author_name ?? 'Ban biên tập', ENT_QUOTES, 'UTF-8'); ?>
            </span>
          </div>

          <!-- 4. event_image (Hình ảnh bài viết) -->
          <?php if (!empty($img_src)): ?>
          <div class="news-detail-thumbnail mb-4 text-center">
            <img src="<?php echo htmlspecialchars($img_src, ENT_QUOTES, 'UTF-8'); ?>" 
                 alt="<?php echo htmlspecialchars($title, ENT_QUOTES, 'UTF-8'); ?>"
                 class="img-fluid rounded shadow-sm" 
                 style="max-height: 480px; width: 100%; object-fit: cover;"
                 itemprop="image" />
          </div>
          <?php endif; ?>
          <p></p>
          <!-- 5. event_content (Nội dung chi tiết bài viết) -->
          <div class="news-detail-body post-content text-dark mb-5" style="font-size:16px; line-height:1.8;" itemprop="articleBody">
            <?php echo $content; ?>
          </div>
          <?php if (!empty($news_detail->event_attachment)): ?>
          <div class="news-attachment mb-4 p-3 border rounded bg-light">
            <strong><i class="fa-solid fa-paperclip me-2"></i>Tệp đính kèm:</strong>
            <a href="<?php echo XC_URL.'/uploads/events/'.htmlspecialchars($news_detail->event_attachment, ENT_QUOTES, 'UTF-8'); ?>" target="_blank" rel="noopener">
              <?php echo htmlspecialchars($news_detail->event_attachment_name ?: 'Tải tệp', ENT_QUOTES, 'UTF-8'); ?>
            </a>
          </div>
          <?php endif; ?>

          <!-- Social Share widget -->
          <div class="news-detail-share d-flex align-items-center gap-2 pb-3 mb-5 border-bottom border-top pt-3">
            <span class="text-muted fw-bold me-2" style="font-size:13px;"><i class="fa-solid fa-share-nodes"></i> Chia sẻ bài viết:</span>
            
            <a href="https://www.facebook.com/sharer/sharer.php?u=<?php echo urlencode($current_url); ?>" 
               target="_blank" rel="noopener noreferrer" 
               class="btn btn-sm text-white d-flex align-items-center gap-1 px-3" 
               style="background:#1877f2; font-size:12px; border-radius:4px;color: #fff;">
              <i class="fa-brands fa-facebook-f"></i> Facebook
            </a>
            
            <button onclick="copyArticleLink()" 
                    class="btn btn-sm btn-outline-secondary d-flex align-items-center gap-1 px-3" 
                    style="font-size:12px; border-radius:4px;">
              <i class="fa-regular fa-copy"></i> Sao chép link
            </button>
          </div> 
          

        </article><!-- /news-posts-col -->
    
        <!-- ==================================================
             RIGHT COLUMN: SIDEBAR (Hiển thị các tin tức nổi bật khác)
             ================================================== -->
        <aside class="news-sidebar col-lg-4 mt-4 mt-lg-0">
          
          <!-- Widget: Tin nổi bật khác -->
          <?php if (!empty($popular_news) && is_array($popular_news)): ?>
          <div class="widget widget-featured mb-4 p-3 border rounded bg-white shadow-sm">
            <h2 class="widget-title h6 pb-2 border-bottom d-flex align-items-center gap-2 mb-3" style="font-weight:700;">
              <i class="fa-solid fa-star text-primary"></i> Tin tức nổi bật khác
            </h2>
            <div class="widget-body">
              <ol class="popular-posts list-unstyled mb-0 d-flex flex-column gap-3" aria-label="Danh sách tin nổi bật khác">
                <?php 
                $rank = 1;
                foreach ($popular_news as $pop_item): 
                  $pop_slug = isset($pop_item->event_name) ? general::getInstance()->bodau($pop_item->event_name) : (isset($pop_item->title) ? general::getInstance()->bodau($pop_item->title) : 'bai-viet');
                  $pop_url = XC_URL . '/tin-tuc/' . $pop_item->id . '-' . $pop_slug . '.html';
                  $pop_title = $pop_item->event_name ?? $pop_item->title;
                  $pop_date = !empty($pop_item->event_created_date) ? date('d/m/Y', strtotime($pop_item->event_created_date)) : (!empty($pop_item->published_at) ? date('d/m/Y', strtotime($pop_item->published_at)) : '');
                  $pop_img = !empty($pop_item->event_image) ? (strpos($pop_item->event_image, 'http') === 0 ? $pop_item->event_image : XC_URL . '/uploads/events/' . $pop_item->event_image) : (!empty($pop_item->thumbnail_url) ? XC_URL . $pop_item->thumbnail_url : XC_URL . '/template/frontend/assets/images/banner-01.jpg');
                ?>
                <li class="popular-post-item">
                  <a href="<?php echo $pop_url; ?>" class="popular-post-link d-flex text-decoration-none text-dark gap-2">
                    <div class="popular-post-img-wrap position-relative" style="width: 70px; height: 52px; flex-shrink:0; border-radius:4px; overflow:hidden;">
                      <img src="<?php echo $pop_img; ?>" alt="<?php echo htmlspecialchars($pop_title, ENT_QUOTES, 'UTF-8'); ?>" style="width:100%; height:100%; object-fit:cover;" />
                      <span class="popular-rank bg-primary text-white position-absolute top-0 start-0 px-1" style="font-size:10px; font-weight:800; border-bottom-right-radius:4px; min-width:18px; text-align:center;"><?php echo $rank++; ?></span>
                    </div>
                    <div class="popular-post-text d-flex flex-column" style="font-size:12px;">
                      <span class="fw-medium" style="display:-webkit-box; -webkit-line-clamp:2; -webkit-box-orient:vertical; overflow:hidden; line-height:1.3; font-weight:600;"><?php echo htmlspecialchars($pop_title, ENT_QUOTES, 'UTF-8'); ?></span>
                      <time datetime="<?php echo date('Y-m-d', strtotime($pop_item->event_created_date ?? $pop_item->published_at ?? 'now')); ?>" class="text-muted" style="font-size:10px; margin-top:3px;"><?php echo $pop_date; ?></time>
                    </div>
                  </a>
                </li>
                <?php endforeach; ?>
              </ol>
            </div>
          </div>
          <?php endif; ?>

        </aside><!-- /news-sidebar -->

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
function copyArticleLink() {
    var dummy = document.createElement('input'),
    text = window.location.href;
    document.body.appendChild(dummy);
    dummy.value = text;
    dummy.select();
    document.execCommand('copy');
    document.body.removeChild(dummy);
    alert('\u0110\u00e3 sao ch\u00e9p li\u00ean k\u1ebft th\u00e0nh c\u00f4ng!');
}
</script>

<?php require_once 'footer.php'; ?>
