<?php require_once "header.php";?>

<?php
// Safety fallback for controller variables
$events_list = isset($events_list) && is_array($events_list) ? $events_list : (isset($news_list) && is_array($news_list) ? $news_list : []);
$featured_event = isset($featured_event) ? $featured_event : (!empty($events_list) ? $events_list[0] : null);
$popular_events = isset($popular_events) && is_array($popular_events) ? $popular_events : (isset($popular_news) && is_array($popular_news) ? $popular_news : []);
$total = isset($total) ? intval($total) : count($events_list);
$page = isset($page) ? max(1, intval($page)) : 1;
$total_pages = isset($total_pages) ? max(1, intval($total_pages)) : 1;
$start_record = isset($start_record) ? intval($start_record) : ($total > 0 ? 1 : 0);
$end_record = isset($end_record) ? intval($end_record) : count($events_list);
$sort = isset($sort) ? $sort : 'newest';
$q = isset($q) ? $q : '';
$event_type = isset($event_type) ? intval($event_type) : 0;
$current_type_slug = isset($current_type_slug) ? $current_type_slug : '';



// Helper function to get image path
if (!function_exists('get_event_img_url')) {
    function get_event_img_url($item, $default_banner = '/template/frontend/assets/images/banner-01.jpg') {
        if ($item && !empty($item->event_image)) {
            if (strpos($item->event_image, 'http') === 0) {
                return $item->event_image;
            }
            return XC_URL . '/uploads/events/' . $item->event_image;
        }
        return XC_URL . $default_banner;
    }
}

// Badge mappings for category/type
$badge_names = [
    1 => html_entity_decode('Ho&#7841;t &#273;&#7897;ng n&#7897;i b&#7897;', ENT_HTML5, 'UTF-8'),
    2 => html_entity_decode('S&#7921; ki&#7879;n - H&#7897;i th&#7843;o', ENT_HTML5, 'UTF-8'),
    3 => html_entity_decode('Th&#244;ng b&#225;o - H&#432;&#7899;ng d&#7851;n', ENT_HTML5, 'UTF-8'),
    4 => html_entity_decode('Y t&#7871; c&#7897;ng &#273;&#7891;ng', ENT_HTML5, 'UTF-8'),
];
$badge_classes = [
    1 => 'badge-blue',
    2 => 'badge-orange',
    3 => 'badge-purple',
    4 => 'badge-green',
];
?>

    <!-- ============================================================
         MAIN CONTENT AREA: Posts + Sidebar
         ============================================================ -->
    <div class="news-main-wrapper">
      <div class="container">
        <div class="news-layout" id="news-list">

          <!-- ==================================================
               LEFT COLUMN: POST LIST
               ================================================== -->
          <main class="news-posts-col" aria-label="Danh sách bài viết">

            <!-- Posts Filter Bar -->
            <div class="posts-filter-bar">
              <div class="posts-count">
                <span>Hiển thị <strong><?php echo $start_record; ?>–<?php echo $end_record; ?></strong> trong tổng số <strong><?php echo $total; ?></strong> bài viết</span>
              </div>
              <!-- <div class="posts-sort">
                <label for="sort-select" class="sr-only">Sáº¯p xáº¿p theo</label>
                <select id="sort-select" class="sort-select" aria-label="Sáº¯p xáº¿p Bài viết" onchange="window.location.href='<?php echo XC_URL; ?>/tin-tuc<?php echo !empty($current_type_slug) ? '/'.$current_type_slug : ''; ?>?sort=' + this.value + '<?php echo $q !== '' ? '&q='.urlencode($q) : ''; ?>';">
                  <option value="newest" <?php echo $sort === 'newest' ? 'selected' : ''; ?>>Má»›i nháº¥t</option>
                  <option value="oldest" <?php echo $sort === 'oldest' ? 'selected' : ''; ?>>CÅ© nháº¥t</option>
                  <option value="popular" <?php echo $sort === 'popular' ? 'selected' : ''; ?>>Phá»• biáº¿n nháº¥t</option>
                </select>
              </div> -->
            </div>

            <!-- ====================================================
                 FEATURED POST (Bài viết ná»•i báº­t â€” dáº¡ng ngang lá»›n)
                 ==================================================== -->
            <?php if ($featured_event): 
              $feat_url = $this->helper->permalink($featured_event->id,'event_detail');
              $feat_img = get_event_img_url($featured_event, '/template/frontend/assets/images/banner-03.jpg');
              $type_id = intval($featured_event->event_type ?? 1);
              $cat_name = $badge_names[$type_id] ?? 'Y táº¿ cá»™ng Ä‘á»“ng';
              $badge_cls = $badge_classes[$type_id] ?? 'badge-green';
              $date_str = !empty($featured_event->event_created_date) ? date('d/m/Y', strtotime($featured_event->event_created_date)) : date('d/m/Y');
              $datetime_str = !empty($featured_event->event_created_date) ? date('Y-m-d', strtotime($featured_event->event_created_date)) : date('Y-m-d');
            ?>
            <article class="post-featured" aria-label="Bài viết ná»•i báº­t" itemscope itemtype="https://schema.org/NewsArticle">
              <div class="post-featured-inner">
                <div class="post-featured-img-wrap">
                  <a href="<?php echo $feat_url; ?>" aria-label="Xem Bài viết ná»•i báº­t">
                    <img src="<?php echo $feat_img; ?>"
                         alt="<?php echo htmlspecialchars($featured_event->event_name, ENT_QUOTES, 'UTF-8'); ?>"
                         class="post-featured-img"
                         loading="eager" width="680" height="400"
                         itemprop="image" />
                    <!-- <span class="post-cat-badge <?php echo $badge_cls; ?>"><?php echo htmlspecialchars($cat_name, ENT_QUOTES, 'UTF-8'); ?></span> -->
                  </a>
                </div>
                <div class="post-featured-content">
                  <div class="post-meta">
                    <!-- <span class="post-cat-tag">
                      <svg viewBox="0 0 24 24" width="12" height="12" fill="currentColor" aria-hidden="true"><path d="M10 4H4c-1.1 0-2 .9-2 2v12c0 1.1.9 2 2 2h16c1.1 0 2-.9 2-2V8c0-1.1-.9-2-2-2h-8l-2-2z"/></svg>
                      <?php echo htmlspecialchars($cat_name, ENT_QUOTES, 'UTF-8'); ?>
                    </span> -->
                    <time class="post-date" datetime="<?php echo $datetime_str; ?>" itemprop="datePublished"><?php echo $date_str; ?></time>
                    <!-- <span class="post-read-time">
                      <svg viewBox="0 0 24 24" width="12" height="12" fill="currentColor" aria-hidden="true"><path d="M11.99 2C6.47 2 2 6.48 2 12s4.47 10 9.99 10C17.52 22 22 17.52 22 12S17.52 2 11.99 2zM12 20c-4.42 0-8-3.58-8-8s3.58-8 8-8 8 3.58 8 8-3.58 8-8 8zm.5-13H11v6l5.25 3.15.75-1.23-4.5-2.67V7z"/></svg>
                      5 phÃºt Ä‘á»c
                    </span> -->
                  </div>
                  <h2 class="post-featured-title" itemprop="headline">
                    <a href="<?php echo $feat_url; ?>" itemprop="url">
                      <?php echo htmlspecialchars($featured_event->event_name, ENT_QUOTES, 'UTF-8'); ?>
                    </a>
                  </h2>
                  <p class="post-featured-excerpt" itemprop="description">
                    <?php echo htmlspecialchars(mb_strimwidth(strip_tags($featured_event->event_description ?? ''), 0, 220, '...'), ENT_QUOTES, 'UTF-8'); ?>
                  </p>
                  <div class="post-featured-footer">
                    <div class="post-author">
                      <div class="author-avatar-wrap" aria-hidden="true">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M20 21v-2a4 4 0 00-4-4H8a4 4 0 00-4 4v2"/><circle cx="12" cy="7" r="4"/></svg>
                      </div>
                      <span itemprop="author">Ban biên tập</span>
                    </div>
                    <a href="<?php echo $feat_url; ?>" class="btn btn-primary btn-sm" id="featured-readmore">
                      Đọc Bài viết
                      <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" aria-hidden="true"><polyline points="9 18 15 12 9 6"/></svg>
                    </a>
                  </div>
                </div>
              </div>
            </article>
            <?php endif; ?>

            <!-- ====================================================
                 POSTS GRID (3 columns)
                 ==================================================== -->
            <div class="posts-grid" role="list">
              <?php 
              if (!empty($events_list)):
                $card_index = 1;
                foreach ($events_list as $ev):
                  $item_url = $this->helper->permalink($ev->id,'event_detail');
                  $item_img = get_event_img_url($ev);
                  $type_id = intval($ev->event_type ?? 1);
                  $cat_name = $badge_names[$type_id] ?? 'Hoáº¡t Ä‘á»™ng';
                  $badge_cls = $badge_classes[$type_id] ?? '';
                  $date_str = !empty($ev->event_created_date) ? date('d/m/Y', strtotime($ev->event_created_date)) : date('d/m/Y');
                  $datetime_str = !empty($ev->event_created_date) ? date('Y-m-d', strtotime($ev->event_created_date)) : date('Y-m-d');
              ?>
              <article class="post-card" id="post-<?php echo $card_index; ?>" role="listitem" itemscope itemtype="https://schema.org/NewsArticle">
                <div class="post-thumbnail">
                  <a href="<?php echo $item_url; ?>" tabindex="-1" aria-hidden="true">
                    <img src="<?php echo $item_img; ?>"
                         alt="<?php echo htmlspecialchars($ev->event_name, ENT_QUOTES, 'UTF-8'); ?>"
                         loading="lazy" width="380" height="230" itemprop="image" />
                    <!-- <span class="post-cat-badge <?php echo $badge_cls; ?>"><?php echo htmlspecialchars($cat_name, ENT_QUOTES, 'UTF-8'); ?></span> -->
                  </a>
                </div>
                <div class="post-body">
                  <div class="post-meta">
                    <time datetime="<?php echo $datetime_str; ?>" itemprop="datePublished"><?php echo $date_str; ?></time>
                    <!-- <span class="post-sep" aria-hidden="true">â€¢</span> -->
                    
                  </div>
                  <h3 class="post-title" itemprop="headline">
                    <a href="<?php echo $item_url; ?>" itemprop="url">
                      <?php echo htmlspecialchars($ev->event_name, ENT_QUOTES, 'UTF-8'); ?>
                    </a>
                  </h3>
                  <p class="post-excerpt" itemprop="description">
                    <?php echo htmlspecialchars(mb_strimwidth(strip_tags($ev->event_description ?? ''), 0, 130, '...'), ENT_QUOTES, 'UTF-8'); ?>
                  </p>
                  <div class="post-footer">
                    <!-- <span class="post-views">
                      <svg viewBox="0 0 24 24" width="13" height="13" fill="none" stroke="currentColor" stroke-width="2" aria-hidden="true"><path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"/><circle cx="12" cy="12" r="3"/></svg>
                      LÆ°á»£t xem
                    </span> -->
                    <a href="<?php echo $item_url; ?>" class="read-more-link" id="readmore-post-<?php echo $card_index; ?>">Đọc tiếp →</a>
                  </div>
                </div>
              </article>
              <?php 
                $card_index++;
                endforeach;
              else:
              ?>
              <div class="no-posts" style="grid-column: 1 / -1; padding: 40px 0; text-align: center; color: #64748b;">
                <p>KhÃ´ng tÃ¬m tháº¥y Bài viết nÃ o phÃ¹ há»£p.</p>
              </div>
              <?php endif; ?>
            </div><!-- /posts-grid -->

            <!-- ====================================================
                 PAGINATION
                 ==================================================== -->
            <?php if ($total_pages > 1): 
              $query_params = [];
              if ($q !== '') $query_params['q'] = $q;
              if ($sort !== 'newest') $query_params['sort'] = $sort;
              
              if (!function_exists('build_page_link')) {
                  function build_page_link($p, $query_params, $current_type_slug = '') {
                      $query_params['page'] = $p;
                      $base_url = XC_URL . '/tin-tuc';
                      if (!empty($current_type_slug)) {
                          $base_url .= '/' . $current_type_slug;
                      }
                      return $base_url . '?' . http_build_query($query_params);
                  }
              }
            ?>
            <nav class="pagination-nav" aria-label="PhÃ¢n trang Bài viết">
              <div class="pagination-links">
                <?php if ($page > 1): ?>
                <a class="page-btn page-prev" href="<?php echo build_page_link($page - 1, $query_params, $current_type_slug); ?>" aria-label="Trang trÆ°á»›c" style="margin-right:4px;">
                  <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" aria-hidden="true" style="transform:rotate(180deg);"><polyline points="9 18 15 12 9 6"/></svg>
                </a>
                <?php endif; ?>

                <?php 
                $range = 2;
                for ($p = 1; $p <= $total_pages; $p++):
                  if ($p == 1 || $p == $total_pages || ($p >= $page - $range && $p <= $page + $range)):
                    if ($p == $page):
                ?>
                      <span class="page-btn active" aria-current="page" aria-label="Trang <?php echo $p; ?>"><?php echo $p; ?></span>
                    <?php else: ?>
                      <a class="page-btn" href="<?php echo build_page_link($p, $query_params, $current_type_slug); ?>" aria-label="Trang <?php echo $p; ?>"><?php echo $p; ?></a>
                    <?php endif;
                  elseif ($p == 2 && $page - $range > 2): ?>
                    <span class="page-dots" aria-hidden="true">..</span>
                  <?php elseif ($p == $total_pages - 1 && $page + $range < $total_pages - 1): ?>
                    <span class="page-dots" aria-hidden="true">..</span>
                  <?php endif;
                endfor; 
                ?>

                <?php if ($page < $total_pages): ?>
                <a class="page-btn page-next" href="<?php echo build_page_link($page + 1, $query_params, $current_type_slug); ?>" aria-label="Trang tiáº¿p theo">
                  <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" aria-hidden="true"><polyline points="9 18 15 12 9 6"/></svg>
                </a>
                <?php endif; ?>
              </div>
            </nav>
            <?php endif; ?>

          </main><!-- /news-posts-col -->

          <!-- ==================================================
               RIGHT COLUMN: SIDEBAR
               ================================================== -->
          <aside class="news-sidebar" aria-label="Thanh bÃªn tin tá»©c">

            <!-- Widget: Tìm kiếm -->
            <div class="widget widget-search">
              <h2 class="widget-title">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" aria-hidden="true" width="16" height="16"><circle cx="11" cy="11" r="8"/><line x1="21" y1="21" x2="16.65" y2="16.65"/></svg>
                Tìm kiếm
              </h2>
              <form class="search-form" role="search" action="<?php echo XC_URL; ?>/tin-tuc<?php echo !empty($current_type_slug) ? '/'.$current_type_slug : ''; ?>" method="get" aria-label="Tìm kiếm Bài viết">
                <div class="search-input-wrap">
                  <label for="search-input" class="sr-only">Nhập từ khóa Tìm kiếm</label>
                  <input type="search" id="search-input" name="q" class="search-input"
                         placeholder="Tìm kiếm Bài viết..." autocomplete="off"
                         value="<?php echo htmlspecialchars($q, ENT_QUOTES, 'UTF-8'); ?>"
                         aria-label="Tìm kiếm" />
                  <button type="submit" class="search-btn" aria-label="Thực hiện Tìm kiếm">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" aria-hidden="true" width="18" height="18"><circle cx="11" cy="11" r="8"/><line x1="21" y1="21" x2="16.65" y2="16.65"/></svg>
                  </button>
                </div>
              </form>
            </div>

            <!-- Widget: Äáº·t lá»‹ch khÃ¡m nhanh -->
            <!-- <div class="widget widget-appointment">
              <h2 class="widget-title">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" aria-hidden="true" width="16" height="16"><rect x="3" y="4" width="18" height="18" rx="2" ry="2"/><line x1="16" y1="2" x2="16" y2="6"/><line x1="8" y1="2" x2="8" y2="6"/><line x1="3" y1="10" x2="21" y2="10"/></svg>
                Äáº·t lá»‹ch khÃ¡m nhanh
              </h2>
              <div class="widget-body">
                <p class="widget-desc">Äáº·t lá»‹ch khÃ¡m trá»±c tuyáº¿n nhanh chÃ³ng, khÃ´ng cáº§n chá» Ä‘á»£i.</p>
                <form class="widget-form" id="sidebar-appointment-form" novalidate aria-label="Form Ä‘áº·t lá»‹ch nhanh">
                  <div class="widget-form-group">
                    <input type="text" id="appt-name" placeholder="Há» vÃ  tÃªn *" required aria-label="Há» vÃ  tÃªn" class="widget-input" autocomplete="name" />
                  </div>
                  <div class="widget-form-group">
                    <input type="tel" id="appt-phone" placeholder="Sá»‘ Ä‘iá»‡n thoáº¡i *" required aria-label="Sá»‘ Ä‘iá»‡n thoáº¡i" class="widget-input" autocomplete="tel" />
                  </div>
                  <div class="widget-form-group">
                    <select id="appt-service" aria-label="Chá»n dá»‹ch vá»¥" class="widget-input">
                      <option value="">-- Chá»n chuyÃªn khoa --</option>
                      <option>Ná»™i khoa tá»•ng quÃ¡t</option>
                      <option>Ngoáº¡i khoa</option>
                      <option>Sáº£n phá»¥ khoa</option>
                      <option>Nhi khoa</option>
                      <option>Máº¯t</option>
                      <option>Tai mÅ©i há»ng</option>
                      <option>RÄƒng hÃ m máº·t</option>
                      <option>XÃ©t nghiá»‡m - Cháº©n Ä‘oÃ¡n</option>
                    </select>
                  </div>
                  <div class="widget-form-group">
                    <input type="date" id="appt-date" aria-label="NgÃ y khÃ¡m mong muá»‘n" class="widget-input" />
                  </div>
                  <button type="submit" class="btn btn-accent" style="width:100%;justify-content:center;" id="sidebar-appt-submit">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" aria-hidden="true" width="16" height="16"><rect x="3" y="4" width="18" height="18" rx="2" ry="2"/><line x1="16" y1="2" x2="16" y2="6"/><line x1="8" y1="2" x2="8" y2="6"/><line x1="3" y1="10" x2="21" y2="10"/></svg>
                    Äáº·t lá»‹ch ngay
                  </button>
                </form>
              </div>
            </div> -->

            <!-- Widget: Danh mục tin tức -->
            <div class="widget widget-categories">
              <h2 class="widget-title">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" aria-hidden="true" width="16" height="16"><path d="M22 19a2 2 0 01-2 2H4a2 2 0 01-2-2V5a2 2 0 012-2h5l2 3h9a2 2 0 012 2z"/></svg>
               Chuyên mục tin tức
              </h2>
              <nav aria-label="Danh mục tin tức">
                <ul class="cat-menu-list">
                  
                  <li class="cat-menu-item <?php echo $event_type === 1 ? 'active' : ''; ?>">
                    <a href="<?php echo XC_URL; ?>/tin-tuc/1-tin-hoat-dong.html">
                      <span class="cat-menu-icon" aria-hidden="true">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="15" height="15"><path d="M14 2H6a2 2 0 00-2 2v16a2 2 0 002 2h12a2 2 0 002-2V8z"/></svg>
                      </span>
                      <span>Hoạt động nội bộ</span>
                    </a>
                  </li>
                  <li class="cat-menu-item <?php echo $event_type === 4 ? 'active' : ''; ?>">
                    <a href="<?php echo XC_URL; ?>/tin-tuc/2-y-te-cong-dong.html">
                      <span class="cat-menu-icon" aria-hidden="true">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="15" height="15"><path d="M17 21v-2a4 4 0 00-4-4H5a4 4 0 00-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M23 21v-2a4 4 0 00-3-3.87M16 3.13a4 4 0 010 7.75"/></svg>
                      </span>
                      <span>Y tế cộng đồng</span>
                    </a>
                  </li>
                  <li class="cat-menu-item <?php echo $event_type === 3 ? 'active' : ''; ?>">
                    <a href="<?php echo XC_URL; ?>/tin-tuc/3-thong-bao-huong-dan.html">
                      <span class="cat-menu-icon" aria-hidden="true">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="15" height="15"><path d="M18 8A6 6 0 006 8c0 7-3 9-3 9h18s-3-2-3-9M13.73 21a2 2 0 01-3.46 0"/></svg>
                      </span>
                      <span>Thông báo - Hướng dẫn</span>
                    </a>
                  </li>
                  <li class="cat-menu-item <?php echo $event_type === 2 ? 'active' : ''; ?>">
                    <a href="<?php echo XC_URL; ?>/tin-tuc/4-su-kien-hoi-thao.html">
                      <span class="cat-menu-icon" aria-hidden="true">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" width="15" height="15"><rect x="3" y="4" width="18" height="18" rx="2"/><line x1="16" y1="2" x2="16" y2="6"/><line x1="8" y1="2" x2="8" y2="6"/><line x1="3" y1="10" x2="21" y2="10"/></svg>
                      </span>
                      <span>Sự kiện - Hội thảo</span>
                    </a>
                  </li>
                </ul>
              </nav>
            </div>

            <!-- Widget: Tin ná»•i báº­t -->
            <div class="widget widget-featured">
              <h2 class="widget-title">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" aria-hidden="true" width="16" height="16"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"/></svg>
               Tin nổi bật
              </h2>
              <div class="widget-body">
                <ol class="popular-posts" aria-label="Danh sách tin nổi bật">
                  <?php 
                  if (!empty($popular_events)):
                    $pop_rank = 1;
                    foreach ($popular_events as $pop):
                      $pop_url = $this->helper->permalink($pop->id,'event_detail');
                      $pop_img = get_event_img_url($pop);
                      $pop_date = !empty($pop->event_created_date) ? date('d/m/Y', strtotime($pop->event_created_date)) : date('d/m/Y');
                      $pop_datetime = !empty($pop->event_created_date) ? date('Y-m-d', strtotime($pop->event_created_date)) : date('Y-m-d');
                  ?>
                  <li class="popular-post-item">
                    <a href="<?php echo $pop_url; ?>" class="popular-post-link" id="popular-<?php echo $pop_rank; ?>">
                      <div class="popular-post-img-wrap">
                        <img src="<?php echo $pop_img; ?>" alt="<?php echo htmlspecialchars($pop->event_name, ENT_QUOTES, 'UTF-8'); ?>" loading="lazy" width="70" height="52" class="popular-post-img" />
                        <span class="popular-rank" aria-label="Vá»‹ trÃ­ <?php echo $pop_rank; ?>"><?php echo $pop_rank; ?></span>
                      </div>
                      <div class="popular-post-text">
                        <span><?php echo htmlspecialchars($pop->event_name, ENT_QUOTES, 'UTF-8'); ?></span>
                        <time datetime="<?php echo $pop_datetime; ?>"><?php echo $pop_date; ?></time>
                      </div>
                    </a>
                  </li>
                  <?php 
                    $pop_rank++;
                    endforeach;
                  endif; 
                  ?>
                </ol>
              </div>
            </div>

            

            <!-- Widget: Hotline & Liên hệ -->
            <div class="widget widget-hotline">
              <h2 class="widget-title">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" aria-hidden="true" width="16" height="16"><path d="M22 16.92v3a2 2 0 01-2.18 2 19.79 19.79 0 01-8.63-3.07A19.5 19.5 0 013.07 10.8 19.79 19.79 0 01.01 2.18 2 2 0 012 0h3a2 2 0 012 1.72c.127.96.361 1.903.7 2.81a2 2 0 01-.45 2.11L6.09 7.91a16 16 0 006 6l1.27-1.27a2 2 0 012.11-.45c.907.339 1.85.573 2.81.7A2 2 0 0122 16.92z"/></svg>
                Liên hệ tư vấn
              </h2>
              <div class="widget-body hotline-body">
                <p class="widget-desc">Đội ngũ tư vấn y tế sẵn sàng hỗ trợ bạn trong giờ hành chính và cấp cứu 24/7.</p>
                <a href="tel:1900xxxx" class="hotline-link hotline-main" id="sidebar-hotline-main">
                  <span class="hotline-link-icon" aria-hidden="true">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M22 16.92v3a2 2 0 01-2.18 2 19.79 19.79 0 01-8.63-3.07A19.5 19.5 0 013.07 10.8 19.79 19.79 0 01.01 2.18 2 2 0 012 0h3a2 2 0 012 1.72c.127.96.361 1.903.7 2.81a2 2 0 01-.45 2.11L6.09 7.91a16 16 0 006 6l1.27-1.27a2 2 0 012.11-.45c.907.339 1.85.573 2.81.7A2 2 0 0122 16.92z"/></svg>
                  </span>
                  <span>
                    <strong>1900 xxxx</strong>
                    <small>Đường dây tư vấn & đặt lịch</small>
                  </span>
                </a>
                <a href="tel:02603862xxx" class="hotline-link hotline-emergency" id="sidebar-hotline-emergency">
                  <span class="hotline-link-icon" aria-hidden="true">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="22 12 18 12 15 21 9 3 6 12 2 12"/></svg>
                  </span>
                  <span>
                    <strong>(0260) 386 2xxx</strong>
                    <small>Cáº¥p cá»©u 24/7</small>
                  </span>
                </a>
              </div>
            </div>

          </aside><!-- /news-sidebar -->

        </div><!-- /news-layout -->
      </div><!-- /container -->
    </div><!-- /news-main-wrapper -->

  </main>
<?php require_once "footer.php"; ?>
