<?php require_once 'header.php'; ?>
<?php require_once 'menu.php'; ?>

<!-- ============================================================
     HERO BANNER TRANG TĨNH
     ============================================================ -->
<section class="news-hero" style="background: linear-gradient(135deg, var(--color-primary-dark) 0%, var(--color-primary) 50%, var(--color-teal) 100%); padding: var(--space-12) 0 var(--space-8); color: #fff; position: relative;">
  <div class="container" style="position: relative; z-index: 2;">
    <!-- Breadcrumbs -->
    <nav aria-label="breadcrumb" style="margin-bottom: var(--space-4);">
      <ol class="breadcrumb" style="display: flex; gap: var(--space-2); font-size: var(--font-size-xs); color: rgba(255,255,255,.8); margin: 0; padding: 0; list-style: none;">
        <li><a href="<?php echo XC_URL; ?>" style="color: rgba(255,255,255,.9); text-decoration: none;"><i class="fa-solid fa-house"></i> Trang chủ</a></li>
        <li style="opacity: .6;">/</li>
        <?php if(!empty($page->category_name)): ?>
          <li style="color: rgba(255,255,255,.9);"><?php echo htmlspecialchars($page->category_name); ?></li>
          <li style="opacity: .6;">/</li>
        <?php endif; ?>
        <li style="color: #fff; font-weight: 600;"><?php echo !empty($page) ? htmlspecialchars($page->page_title) : 'Trang tĩnh'; ?></li>
      </ol>
    </nav>

    <div class="hero-content" style="max-width: 850px;">
      <?php if(!empty($page->hashtag)): ?>
        <span class="badge" style="background: rgba(255,255,255,.2); color: #fff; border: 1px solid rgba(255,255,255,.3); border-radius: 20px; padding: 4px 14px; font-size: 12px; font-weight: 600; text-transform: uppercase; letter-spacing: 0.05em; display: inline-block; margin-bottom: 12px;">
          <?php echo htmlspecialchars($page->hashtag); ?>
        </span>
      <?php endif; ?>
      <h1 style="font-size: clamp(1.8rem, 3.5vw, 2.6rem); font-weight: 800; line-height: 1.25; margin-bottom: 12px; text-shadow: 0 2px 10px rgba(0,0,0,.2);">
        <?php echo !empty($page) ? htmlspecialchars($page->page_title) : 'Trang thông tin'; ?>
      </h1>
      <?php if(!empty($page->page_summary)): ?>
        <p style="font-size: var(--font-size-base); color: rgba(255,255,255,.9); line-height: 1.6; margin: 0;">
          <?php echo htmlspecialchars($page->page_summary); ?>
        </p>
      <?php endif; ?>
    </div>
  </div>
</section>

<!-- ============================================================
     MAIN CONTENT AREA
     ============================================================ -->
<main style="padding: var(--space-12) 0; background: var(--color-bg);">
  <div class="container">
    <div class="row" style="display: flex; gap: var(--space-8); flex-wrap: wrap;">
      
      <!-- Article Content (Left Column) -->
      <div class="col-lg-8" style="flex: 1; min-width: 300px;">
        <article class="static-article" style="background: #fff; border-radius: var(--radius-xl); padding: var(--space-8); box-shadow: var(--shadow-card); border: 1px solid var(--color-border-light);">
          
          <?php if(!empty($page->banner_image)): ?>
            <div class="article-banner mb-4" style="border-radius: var(--radius-lg); overflow: hidden; margin-bottom: var(--space-6);">
              <img src="<?php echo XC_URL . '/' . $page->banner_image; ?>" alt="<?php echo htmlspecialchars($page->page_title); ?>" style="width: 100%; height: auto; max-height: 420px; object-fit: cover;">
            </div>
          <?php endif; ?>

          <!-- Rich Content from CKEditor 5 -->
          <div class="ck-content" style="font-size: var(--font-size-base); line-height: 1.8; color: var(--color-text);">
            <?php if(!empty($page->page_content)): ?>
              <?php echo $page->page_content; ?>
            <?php else: ?>
              <p class="text-muted">Nội dung trang tĩnh đang được cập nhật...</p>
            <?php endif; ?>
          </div>

          <!-- Bottom Tags / Social share -->
          <div style="margin-top: var(--space-8); padding-top: var(--space-6); border-top: 1px solid var(--color-border-light); display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap; gap: var(--space-4);">
            <div>
              <span style="font-weight: 600; color: var(--color-text-muted); font-size: var(--font-size-sm); margin-right: 8px;">Chia sẻ trang:</span>
              <a href="https://www.facebook.com/sharer/sharer.php?u=<?php echo urlencode(XC_URL . '/trang/' . ($page ? $page->page_slug : '')); ?>" target="_blank" style="display: inline-flex; align-items: center; justify-content: center; width: 34px; height: 34px; border-radius: 50%; background: #1877F2; color: #fff; text-decoration: none; margin-right: 6px;">
                <i class="fa-brands fa-facebook-f"></i>
              </a>
              <a href="https://zalo.me" target="_blank" style="display: inline-flex; align-items: center; justify-content: center; width: 34px; height: 34px; border-radius: 50%; background: #0068FF; color: #fff; text-decoration: none;">
                <i class="fa-solid fa-comment"></i>
              </a>
            </div>
            <a href="javascript:history.back()" style="font-size: var(--font-size-sm); color: var(--color-primary); text-decoration: none; font-weight: 600;">
              <i class="fa-solid fa-arrow-left me-1"></i> Quay lại
            </a>
          </div>

        </article>
      </div>

      <!-- Right Sidebar -->
      <div class="col-lg-4" style="width: 320px; flex-shrink: 0;">
        
        <!-- Other Static Pages Widget -->
        <div class="sidebar-widget mb-4" style="background: #fff; border-radius: var(--radius-xl); padding: var(--space-6); box-shadow: var(--shadow-card); border: 1px solid var(--color-border-light); margin-bottom: var(--space-6);">
          <h3 style="font-size: var(--font-size-lg); font-weight: 700; color: var(--color-primary-dark); margin-bottom: var(--space-4); padding-bottom: var(--space-2); border-bottom: 2px solid var(--color-primary);">
            <i class="fa-solid fa-list-ul me-2"></i>Trang liên quan
          </h3>
          <ul style="list-style: none; padding: 0; margin: 0;">
            <?php if(!empty($other_pages)): foreach($other_pages as $op): ?>
              <li style="margin-bottom: 10px;">
                <a href="<?php echo (!empty($op->link_url)) ? (strpos($op->link_url, 'http')===0 ? $op->link_url : XC_URL . $op->link_url) : XC_URL . '/trang/' . $op->page_slug; ?>" 
                   style="display: flex; align-items: center; gap: 8px; font-size: var(--font-size-sm); color: <?php echo (!empty($page) && $page->id == $op->id) ? 'var(--color-primary)' : 'var(--color-text)'; ?>; font-weight: <?php echo (!empty($page) && $page->id == $op->id) ? '700' : '500'; ?>; text-decoration: none; padding: 8px 12px; border-radius: var(--radius-md); background: <?php echo (!empty($page) && $page->id == $op->id) ? 'var(--color-bg-alt)' : 'transparent'; ?>; transition: all 0.2s;">
                  <i class="fa-solid fa-angle-right" style="color: var(--color-primary); font-size: 12px;"></i>
                  <span><?php echo htmlspecialchars($op->page_title); ?></span>
                </a>
              </li>
            <?php endforeach; else: ?>
              <li style="color: var(--color-text-muted); font-size: 14px;">Chưa có trang tĩnh khác.</li>
            <?php endif; ?>
          </ul>
        </div>

        <!-- Emergency & Booking Callout -->
        <div class="sidebar-widget" style="background: linear-gradient(135deg, var(--color-primary) 0%, var(--color-teal) 100%); border-radius: var(--radius-xl); padding: var(--space-6); color: #fff; box-shadow: var(--shadow-md);">
          <div style="display: flex; align-items: center; gap: 12px; margin-bottom: 12px;">
            <div style="width: 44px; height: 44px; border-radius: 50%; background: rgba(255,255,255,.2); display: flex; align-items: center; justify-content: center; font-size: 20px;">
              <i class="fa-solid fa-phone-volume"></i>
            </div>
            <div>
              <div style="font-size: 12px; text-transform: uppercase; letter-spacing: 0.05em; opacity: .9;">Cấp cứu 24/7</div>
              <a href="tel:1900xxxx" style="font-size: 20px; font-weight: 800; color: #fff; text-decoration: none;">1900 xxxx</a>
            </div>
          </div>
          <p style="font-size: 13px; opacity: .9; margin-bottom: 16px; line-height: 1.5;">
            Bệnh viện đa khoa khu vực Đắk Hà phục vụ khám chữa bệnh và cấp cứu 24/7 cho toàn thể nhân dân.
          </p>
          <a href="<?php echo XC_URL; ?>/pages/dat-lich.html" class="btn btn-accent btn-sm w-100" style="display: block; text-align: center; text-decoration: none; border-radius: 20px; font-weight: 700;">
            <i class="fa-solid fa-calendar-check me-1"></i> Đăng ký khám bệnh
          </a>
        </div>

      </div>

    </div>
  </div>
</main>

<style>
/* Styling for CKEditor HTML content on Frontend */
.ck-content h1, .ck-content h2, .ck-content h3, .ck-content h4 {
  color: var(--color-primary-dark);
  font-weight: 700;
  margin-top: 1.4em;
  margin-bottom: 0.6em;
  line-height: 1.3;
}
.ck-content h1 { font-size: 1.8rem; border-bottom: 2px solid var(--color-border-light); padding-bottom: 8px; }
.ck-content h2 { font-size: 1.5rem; }
.ck-content h3 { font-size: 1.25rem; }
.ck-content p { margin-bottom: 1rem; }
.ck-content ul, .ck-content ol { padding-left: 1.5rem; margin-bottom: 1rem; }
.ck-content li { margin-bottom: 0.4rem; }
.ck-content blockquote {
  border-left: 4px solid var(--color-primary);
  background: var(--color-bg-alt);
  padding: 12px 20px;
  margin: 1.5rem 0;
  border-radius: 0 8px 8px 0;
  font-style: italic;
  color: var(--color-text-muted);
}
.ck-content table {
  width: 100% !important;
  border-collapse: collapse;
  margin: 1.5rem 0;
  border-radius: 8px;
  overflow: hidden;
}
.ck-content table th, .ck-content table td {
  border: 1px solid var(--color-border);
  padding: 10px 14px;
}
.ck-content table th {
  background: var(--color-primary);
  color: #fff;
  font-weight: 700;
}
.ck-content table tr:nth-child(even) {
  background: var(--color-bg-alt);
}
.ck-content img {
  max-width: 100%;
  height: auto;
  border-radius: 8px;
  margin: 1rem 0;
}
</style>

<?php require_once 'footer.php'; ?>
