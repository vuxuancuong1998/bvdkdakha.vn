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
       BREADCRUMBS & BACKGROUND HEADER
       ============================================================ -->
  <section class="news-hero news-detail-hero" style="padding: 24px 0; background: linear-gradient(135deg, #075985 0%, #0369a1 100%);">
    <div class="container">
      <nav class="news-breadcrumbs" aria-label="Điều hướng trang">
        <ol class="news-breadcrumbs-list" itemscope itemtype="https://schema.org/BreadcrumbList">
          <li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem">
            <a href="<?php echo XC_URL; ?>" itemprop="item"><span itemprop="name">Trang chủ</span></a>
            <meta itemprop="position" content="1" />
          </li>
          <li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem">
            <a href="<?php echo XC_URL; ?>/tin-tuc" itemprop="item"><span itemprop="name">Tin tức - Sự kiện</span></a>
            <meta itemprop="position" content="2" />
          </li>
          <li itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem">
            <span itemprop="name" style="color:rgba(255,255,255,0.7); display:inline-block; max-width:300px; overflow:hidden; text-overflow:ellipsis; white-space:nowrap; vertical-align:bottom;"><?php echo htmlspecialchars($title, ENT_QUOTES, 'UTF-8'); ?></span>
            <meta itemprop="position" content="3" />
          </li>
        </ol>
      </nav>
    </div>
  </section>

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

          <!-- 5. event_content (Nội dung chi tiết bài viết) -->
          <div class="news-detail-body post-content text-dark mb-5" style="font-size:16px; line-height:1.8;" itemprop="articleBody">
            <?php echo $content; ?>
          </div>

          <!-- Social Share widget -->
          <div class="news-detail-share d-flex align-items-center gap-2 pb-3 mb-5 border-bottom border-top pt-3">
            <span class="text-muted fw-bold me-2" style="font-size:13px;"><i class="fa-solid fa-share-nodes"></i> Chia sẻ bài viết:</span>
            
            <a href="https://www.facebook.com/sharer/sharer.php?u=<?php echo urlencode($current_url); ?>" 
               target="_blank" rel="noopener noreferrer" 
               class="btn btn-sm text-white d-flex align-items-center gap-1 px-3" 
               style="background:#1877f2; font-size:12px; border-radius:4px;">
              <i class="fa-brands fa-facebook-f"></i> Facebook
            </a>
            
            <button onclick="copyArticleLink()" 
                    class="btn btn-sm btn-outline-secondary d-flex align-items-center gap-1 px-3" 
                    style="font-size:12px; border-radius:4px;">
              <i class="fa-regular fa-copy"></i> Sao chép link
            </button>
          </div>

          <!-- RELATED ARTICLES (Khối "Tin liên quan") -->
          <?php if (!empty($related_news) && is_array($related_news)): ?>
          <div class="news-related">
            <h3 class="h6 border-bottom pb-2 mb-3" style="font-weight:700;"><i class="fa-solid fa-link text-primary"></i> Tin liên quan</h3>
            <div class="row">
              <?php foreach ($related_news as $rel): 
                $rel_slug = isset($rel->event_name) ? general::getInstance()->bodau($rel->event_name) : (isset($rel->title) ? general::getInstance()->bodau($rel->title) : 'bai-viet');
                $rel_url = XC_URL . '/tin-tuc/' . $rel->id . '-' . $rel_slug . '.html';
                $rel_title = $rel->event_name ?? $rel->title;
                $rel_date = !empty($rel->event_created_date) ? date('d/m/Y', strtotime($rel->event_created_date)) : (!empty($rel->published_at) ? date('d/m/Y', strtotime($rel->published_at)) : '');
                $rel_img = !empty($rel->event_image) ? (strpos($rel->event_image, 'http') === 0 ? $rel->event_image : XC_URL . '/uploads/events/' . $rel->event_image) : (!empty($rel->thumbnail_url) ? XC_URL . $rel->thumbnail_url : XC_URL . '/template/frontend/assets/images/banner-01.jpg');
              ?>
              <div class="col-md-6 mb-3">
                <div class="card h-100 border-0 bg-light rounded overflow-hidden">
                  <div class="row g-0 align-items-center h-100">
                    <div class="col-4 h-100" style="aspect-ratio:4/3; overflow:hidden;">
                      <a href="<?php echo $rel_url; ?>">
                        <img src="<?php echo $rel_img; ?>" 
                             alt="<?php echo htmlspecialchars($rel_title, ENT_QUOTES, 'UTF-8'); ?>"
                             style="width:100%; height:100%; object-fit:cover;" />
                      </a>
                    </div>
                    <div class="col-8">
                      <div class="card-body p-2" style="font-size:12px;">
                        <time class="text-muted" style="font-size:10px;"><?php echo $rel_date; ?></time>
                        <h4 class="card-title h6 mb-0 mt-1" style="font-size:13px; line-height:1.3; font-weight:600; display:-webkit-box; -webkit-line-clamp:2; -webkit-box-orient:vertical; overflow:hidden;">
                          <a href="<?php echo $rel_url; ?>" class="text-dark text-decoration-none"><?php echo htmlspecialchars($rel_title, ENT_QUOTES, 'UTF-8'); ?></a>
                        </h4>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <?php endforeach; ?>
            </div>
          </div>
          <?php endif; ?>

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
    alert('Đã sao chép liên kết thành công!');
}
</script>

<?php require_once 'footer.php'; ?>
