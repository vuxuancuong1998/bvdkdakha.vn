<?php require_once 'header.php'; ?>
<?php require_once 'menu.php'; ?>
<main style="padding: var(--space-12) 0; background: var(--color-bg);">
  <div class="container">
    <div class="row" style="display: flex; gap: var(--space-8); flex-wrap: wrap;">
      
      <!-- Article Content (Left Column) -->
      <div class="col-lg-8" style="flex: 1; min-width: 300px;">
        <article class="static-article" style="background: #fff; border-radius: var(--radius-xl); padding: var(--space-8); box-shadow: var(--shadow-card); border: 1px solid var(--color-border-light);">
          
          <?php if(!empty($page->page_title)): ?>
            <h1 style="font-size: 24px; font-weight: 700; color: #1e293b; margin-bottom: 20px; line-height: 1.35; padding-bottom: 12px; border-bottom: 2px solid #e2e8f0;">
              <?php echo htmlspecialchars($page->page_title); ?>
            </h1>
          <?php endif; ?>

          <?php if(!empty($page->banner_image)): ?>
            <div class="article-banner mb-4" style="border-radius: var(--radius-lg); overflow: hidden; margin-bottom: var(--space-6);">
              <img src="<?php echo XC_URL . '/' . $page->banner_image; ?>" alt="<?php echo htmlspecialchars($page->page_title ?? 'Banner'); ?>" style="width: 100%; height: auto; max-height: 420px; object-fit: cover;">
            </div>
          <?php endif; ?>

          <!-- 1. Rich Content (Kiểm tra có mới hiển thị, không thì để rỗng) -->
          <?php if(!empty($page->page_content) && trim(strip_tags($page->page_content)) !== ''): ?>
            <div class="ck-content mb-4" style="font-size: var(--font-size-base); line-height: 1.8; color: var(--color-text);">
              <?php echo $page->page_content; ?>
            </div>
          <?php endif; ?>

          <!-- 2. File đính kèm (Có mới hiển thị, bổ sung nút Xem & Tải về) -->
          <?php if(!empty($attachments) && is_array($attachments) && count($attachments) > 0): ?>
            <div class="attachments-box my-4 p-3 rounded-3" style="background: #f8fafc; border: 1px solid #e2e8f0;">
              <h5 class="fw-bold mb-3 text-primary d-flex align-items-center gap-2" style="font-size: 16px;">
                <i class="fa-solid fa-paperclip"></i>
                <span>Tài liệu &amp; File đính kèm</span>
                <span class="badge bg-primary rounded-pill small" style="font-size: 12px;"><?php echo count($attachments); ?></span>
              </h5>
              <div class="d-flex flex-column gap-2">
                <?php foreach($attachments as $att): 
                  $ext = strtolower(pathinfo($att->file_name ?? $att->file_path, PATHINFO_EXTENSION));
                  $icon = 'fa-file text-secondary';
                  if (in_array($ext, ['pdf'])) $icon = 'fa-file-pdf text-danger';
                  elseif (in_array($ext, ['doc','docx'])) $icon = 'fa-file-word text-primary';
                  elseif (in_array($ext, ['xls','xlsx'])) $icon = 'fa-file-excel text-success';
                  elseif (in_array($ext, ['ppt','pptx'])) $icon = 'fa-file-powerpoint text-warning';
                  elseif (in_array($ext, ['jpg','jpeg','png','gif','webp'])) $icon = 'fa-file-image text-info';
                  elseif (in_array($ext, ['zip','rar'])) $icon = 'fa-file-zipper text-secondary';

                  $size_str = '';
                  if (!empty($att->file_size)) {
                    $bytes = (int)$att->file_size;
                    if ($bytes >= 1048576) $size_str = number_format($bytes / 1048576, 1) . ' MB';
                    elseif ($bytes >= 1024) $size_str = number_format($bytes / 1024, 0) . ' KB';
                    else $size_str = $bytes . ' bytes';
                  }
                  $file_url = XC_URL . '/' . ltrim($att->file_path, '/');
                ?>
                  <div class="attachment-item p-2 px-3 bg-white rounded border d-flex align-items-center justify-content-between flex-wrap gap-2">
                    <div class="d-flex align-items-center gap-3" style="min-width: 220px; max-width: 70%;">
                      <i class="fa-solid <?php echo $icon; ?> fa-2x"></i>
                      <div class="text-truncate">
                        <div class="fw-bold text-dark text-truncate" style="font-size: 14px;"><?php echo htmlspecialchars($att->file_name); ?></div>
                        <?php if(!empty($size_str)): ?>
                          <div class="text-muted small"><?php echo $size_str; ?></div>
                        <?php endif; ?>
                      </div>
                    </div>
                    <div class="d-flex gap-2 align-items-center">
                      <!-- Nút Xem (View trực tiếp trên trang - eOffice style) -->
                      <button type="button" 
                              onclick="openInPageViewer('<?php echo $file_url; ?>', '<?php echo addslashes(htmlspecialchars($att->file_name)); ?>', '<?php echo $ext; ?>')" 
                              class="btn btn-sm btn-outline-primary rounded-pill px-3" 
                              style="font-size: 13px;">
                        <i class="fa-solid fa-eye me-1"></i> Xem
                      </button>
                      <!-- Nút Tải về (Download) -->
                      <a href="<?php echo $file_url; ?>" download="<?php echo htmlspecialchars($att->file_name); ?>" class="btn btn-sm btn-primary rounded-pill px-3" style="font-size: 13px;">
                        <i class="fa-solid fa-download me-1"></i> Tải về
                      </a>
                    </div>
                  </div>
                <?php endforeach; ?>
              </div>
            </div>
          <?php endif; ?>

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
            Bệnh viện đa khoa khu vực Đăk Hà phục vụ khám chữa bệnh và cấp cứu 24/7 cho toàn thể nhân dân.
          </p>
          <a href="<?php echo XC_URL; ?>/pages/dat-lich.html" class="btn btn-accent btn-sm w-100" style="display: block; text-align: center; text-decoration: none; border-radius: 20px; font-weight: 700;">
            <i class="fa-solid fa-calendar-check me-1"></i> Liên hệ
          </a>
        </div>

      </div>

    </div>
  </div>
</main>

<!-- =====================================================
     Document Viewer Modal (eOffice Style Direct In-Page Viewer)
     ===================================================== -->
<div id="docViewerModal" class="doc-viewer-overlay">
  <div class="doc-viewer-container">
    <div class="doc-viewer-header">
      <div class="d-flex align-items-center gap-2 text-truncate" style="max-width: 65%;">
        <i class="fa-solid fa-file-contract text-primary" style="font-size: 20px;"></i>
        <span id="docViewerTitle" class="fw-bold text-dark text-truncate" style="font-size: 16px;">Tên tài liệu</span>
      </div>
      <div class="d-flex align-items-center gap-2">
        <a id="docViewerDownload" href="#" download="" class="btn btn-sm btn-primary rounded-pill px-3" style="font-size: 13px;">
          <i class="fa-solid fa-download me-1"></i> Tải về
        </a>
        <a id="docViewerExternal" href="#" target="_blank" class="btn btn-sm btn-outline-secondary rounded-pill px-3" style="font-size: 13px;" title="Mở trong tab mới">
          <i class="fa-solid fa-arrow-up-right-from-square me-1"></i> Tab mới
        </a>
        <button type="button" onclick="closeDocViewer()" class="btn-close-viewer" title="Đóng cửa sổ">
          <i class="fa-solid fa-xmark"></i>
        </button>
      </div>
    </div>
    <div id="docViewerBody" class="doc-viewer-body">
      <!-- Dynamic viewer content (iframe / img) loaded here -->
    </div>
  </div>
</div>

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

/* Document Viewer Modal Overlay Style (eOffice) */
.doc-viewer-overlay {
  position: fixed;
  top: 0; left: 0; width: 100%; height: 100%;
  background: rgba(15, 23, 42, 0.75);
  backdrop-filter: blur(4px);
  z-index: 99999;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 20px;
  opacity: 0;
  visibility: hidden;
  transition: all 0.25s ease-in-out;
}
.doc-viewer-overlay.active {
  opacity: 1;
  visibility: visible;
}
.doc-viewer-container {
  width: 95%;
  max-width: 1200px;
  height: 88vh;
  background: #ffffff;
  border-radius: 16px;
  box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.35);
  display: flex;
  flex-direction: column;
  overflow: hidden;
  transform: scale(0.96);
  transition: transform 0.25s ease-in-out;
}
.doc-viewer-overlay.active .doc-viewer-container {
  transform: scale(1);
}
.doc-viewer-header {
  height: 60px;
  padding: 12px 20px;
  background: #ffffff;
  border-bottom: 1px solid #e2e8f0;
  display: flex;
  align-items: center;
  justify-content: space-between;
  flex-shrink: 0;
}
.btn-close-viewer {
  width: 36px;
  height: 36px;
  border-radius: 50%;
  border: none;
  background: #f1f5f9;
  color: #64748b;
  display: inline-flex;
  align-items: center;
  justify-content: center;
  cursor: pointer;
  font-size: 18px;
  transition: all 0.2s;
}
.btn-close-viewer:hover {
  background: #fee2e2;
  color: #ef4444;
}
.doc-viewer-body {
  flex: 1;
  background: #f8fafc;
  position: relative;
  overflow: hidden;
}
.doc-viewer-loading {
  position: absolute;
  top: 50%; left: 50%;
  transform: translate(-50%, -50%);
  text-align: center;
  color: #64748b;
  font-weight: 500;
}
</style>

<script>
function openInPageViewer(url, name, ext) {
  ext = (ext || '').toLowerCase();
  const modal = document.getElementById('docViewerModal');
  const body = document.getElementById('docViewerBody');
  const title = document.getElementById('docViewerTitle');
  const downloadBtn = document.getElementById('docViewerDownload');
  const externalBtn = document.getElementById('docViewerExternal');

  title.textContent = name;
  downloadBtn.setAttribute('href', url);
  downloadBtn.setAttribute('download', name);
  externalBtn.setAttribute('href', url);

  body.innerHTML = '<div class="doc-viewer-loading"><i class="fa-solid fa-circle-notch fa-spin fa-2x text-primary mb-2"></i><div>Đang nạp tài liệu...</div></div>';

  let viewerHtml = '';
  if (ext === 'pdf') {
    viewerHtml = `<iframe src="${url}#toolbar=1&navpanes=1" width="100%" height="100%" style="border:none;"></iframe>`;
  } else if (['doc', 'docx', 'xls', 'xlsx', 'ppt', 'pptx'].includes(ext)) {
    const absUrl = url.startsWith('http') ? url : (window.location.origin + url);
    const googleViewer = `https://docs.google.com/gview?url=${encodeURIComponent(absUrl)}&embedded=true`;
    viewerHtml = `<iframe src="${googleViewer}" width="100%" height="100%" style="border:none;"></iframe>`;
  } else if (['jpg', 'jpeg', 'png', 'gif', 'webp'].includes(ext)) {
    viewerHtml = `<div style="display:flex; align-items:center; justify-content:center; height:100%; padding:20px; background:#0f172a;"><img src="${url}" alt="${name}" style="max-width:100%; max-height:100%; object-fit:contain; border-radius:8px; box-shadow: 0 10px 30px rgba(0,0,0,0.5);"></div>`;
  } else if (['txt', 'csv'].includes(ext)) {
    viewerHtml = `<iframe src="${url}" width="100%" height="100%" style="border:none; background:#fff; padding:15px;"></iframe>`;
  } else {
    viewerHtml = `<div class="p-5 text-center bg-white h-100 d-flex flex-column align-items-center justify-content-center">
      <i class="fa-solid fa-file-arrow-down fa-3x text-primary mb-3"></i>
      <h5>Tập tin định dạng .${ext.toUpperCase()}</h5>
      <p class="text-muted small mb-3">Định dạng tập tin này chưa hỗ trợ xem trực tiếp. Bạn có thể tải file về máy để xem.</p>
      <a href="${url}" download="${name}" class="btn btn-primary rounded-pill px-4"><i class="fa-solid fa-download me-1"></i> Tải về ngay</a>
    </div>`;
  }

  setTimeout(() => {
    body.innerHTML = viewerHtml;
  }, 250);

  modal.classList.add('active');
  document.body.style.overflow = 'hidden';
}

function closeDocViewer() {
  const modal = document.getElementById('docViewerModal');
  modal.classList.remove('active');
  document.getElementById('docViewerBody').innerHTML = '';
  document.body.style.overflow = '';
}

// Đóng modal khi nhấn phím ESC hoặc click bên ngoài container
document.addEventListener('keydown', function(e) {
  if (e.key === 'Escape') {
    closeDocViewer();
  }
});
document.getElementById('docViewerModal').addEventListener('click', function(e) {
  if (e.target === this) {
    closeDocViewer();
  }
});
</script>

<?php require_once 'footer.php'; ?>
