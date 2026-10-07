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
            <section class="attachments-box" aria-labelledby="attachmentHeading">
              <div class="attachments-heading">
                <h2 id="attachmentHeading">Tài liệu đính kèm</h2>
                <span>Thao tác</span>
              </div>
              <div class="attachment-list">
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
                  <div class="attachment-item">
                    <div class="attachment-info">
                      <span class="attachment-file-icon"><i class="fa-solid <?php echo $icon; ?>"></i></span>
                      <div class="attachment-name-wrap">
                        <strong title="<?php echo htmlspecialchars($att->file_name, ENT_QUOTES, 'UTF-8'); ?>"><?php echo htmlspecialchars($att->file_name); ?></strong>
                        <?php if(!empty($size_str)): ?><span class="attachment-size"><?php echo $size_str; ?></span><?php endif; ?>
                      </div>
                    </div>
                    <div class="attachment-actions">
                      <button type="button" class="attachment-view-btn"
                              data-url="<?php echo htmlspecialchars($file_url, ENT_QUOTES, 'UTF-8'); ?>"
                              data-name="<?php echo htmlspecialchars($att->file_name, ENT_QUOTES, 'UTF-8'); ?>"
                              data-ext="<?php echo htmlspecialchars($ext, ENT_QUOTES, 'UTF-8'); ?>"
                              onclick="showInlineAttachment(this)">
                        <i class="fa-regular fa-eye"></i><span>Xem</span>
                      </button>
                      <a href="<?php echo htmlspecialchars($file_url, ENT_QUOTES, 'UTF-8'); ?>" download="<?php echo htmlspecialchars($att->file_name, ENT_QUOTES, 'UTF-8'); ?>" class="attachment-download-btn">
                        <i class="fa-solid fa-download"></i><span>Tải về</span>
                      </a>
                    </div>
                  </div>
                <?php endforeach; ?>
              </div>
              <div id="inlineDocumentViewer" class="inline-document-viewer" hidden>
                <div class="inline-viewer-toolbar">
                  <div><i class="fa-solid fa-file-lines"></i><strong id="inlineViewerTitle">Tài liệu</strong></div>
                  <div class="inline-viewer-controls">
                    <a id="inlineViewerNewTab" href="#" target="_blank" rel="noopener" title="Mở trong tab mới"><i class="fa-solid fa-up-right-from-square"></i><span>Tab mới</span></a>
                    <button type="button" onclick="closeInlineAttachment()" title="Đóng trình xem"><i class="fa-solid fa-xmark"></i><span>Đóng</span></button>
                  </div>
                </div>
                <div id="inlineViewerBody" class="inline-viewer-body"></div>
              </div>
            </section>
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
      <!--  -->

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

/* Attachment list and inline eOffice-style document viewer */
.attachments-box{margin:28px 0;border:1px solid #d9e1ec;border-radius:14px;background:#fff;overflow:hidden}
.attachments-heading{min-height:50px;padding:0 14px;display:flex;align-items:center;justify-content:space-between;background:#f8fafc;border-bottom:1px solid #d9e1ec;color:#60708a;text-transform:uppercase;letter-spacing:.02em}
.attachments-heading h2,.attachments-heading span{margin:0;font-size:14px;font-weight:600}
.attachment-list{display:flex;flex-direction:column}
.attachment-item{min-height:84px;padding:14px;display:flex;align-items:center;justify-content:space-between;gap:18px;border-bottom:1px solid #edf1f6}
.attachment-item:last-child{border-bottom:0}
.attachment-info{display:flex;align-items:center;gap:14px;min-width:0;flex:1}
.attachment-file-icon{width:45px;height:45px;border-radius:7px;background:#fff0f0;display:inline-flex;align-items:center;justify-content:center;font-size:20px;flex:0 0 auto}
.attachment-name-wrap{display:flex;align-items:center;gap:10px;min-width:0}
.attachment-name-wrap strong{font-size:16px;font-weight:500;color:#0f172a;overflow:hidden;text-overflow:ellipsis;white-space:nowrap}
.attachment-size{padding:4px 9px;border-radius:999px;background:#f4f7fb;color:#8b9ab0;font-size:12px;white-space:nowrap}
.attachment-actions{display:flex;align-items:center;gap:10px;flex:0 0 auto}
.attachment-view-btn,.attachment-download-btn{height:38px;padding:0 16px;border-radius:8px;display:inline-flex;align-items:center;justify-content:center;gap:8px;font-size:14px;font-weight:500;text-decoration:none;cursor:pointer;transition:.2s}
.attachment-view-btn{border:1px solid #8db9ff;background:#fff;color:#0757b7}
.attachment-view-btn:hover,.attachment-view-btn.active{background:#eff6ff;border-color:#3b82f6;color:#0757b7}
.attachment-download-btn{border:1px solid #f15b25;background:#f15b25;color:#fff}
.attachment-download-btn:hover{background:#d94715;color:#fff}
.inline-document-viewer{border-top:1px solid #d9e1ec;background:#eef2f7}
.inline-viewer-toolbar{min-height:52px;padding:8px 14px;display:flex;align-items:center;justify-content:space-between;gap:14px;background:#fff;border-bottom:1px solid #d9e1ec}
.inline-viewer-toolbar>div{display:flex;align-items:center;gap:9px;min-width:0}
.inline-viewer-toolbar strong{font-size:14px;color:#24344d;overflow:hidden;text-overflow:ellipsis;white-space:nowrap}
.inline-viewer-controls a,.inline-viewer-controls button{border:1px solid #d5deea;background:#fff;color:#52657a;border-radius:7px;padding:7px 11px;display:inline-flex;align-items:center;gap:6px;text-decoration:none;font-size:12px;cursor:pointer}
.inline-viewer-body{height:min(76vh,820px);min-height:520px;background:#525659;position:relative;overflow:auto}
.inline-viewer-body iframe,.inline-viewer-body object{display:block;width:100%;height:100%;border:0;background:#fff}
.inline-viewer-loading,.inline-viewer-message{height:100%;display:flex;flex-direction:column;align-items:center;justify-content:center;gap:10px;text-align:center;padding:30px;background:#fff;color:#64748b}
.inline-viewer-image{min-height:100%;display:flex;align-items:flex-start;justify-content:center;padding:22px;background:#27303c}
.inline-viewer-image img{max-width:100%;height:auto;box-shadow:0 8px 30px rgba(0,0,0,.35)}
@media(max-width:640px){.attachments-heading>span{display:none}.attachment-item{align-items:flex-start;flex-direction:column}.attachment-actions{width:100%}.attachment-view-btn,.attachment-download-btn{flex:1}.attachment-name-wrap{align-items:flex-start;flex-direction:column;gap:5px;width:100%}.attachment-name-wrap strong{max-width:100%}.inline-viewer-controls span{display:none}.inline-viewer-body{height:68vh;min-height:420px}}
</style>

<script>
function viewerEscape(value) {
  return String(value || '').replace(/[&<>'"]/g, function(char) {
    return {'&':'&amp;','<':'&lt;','>':'&gt;',"'":'&#39;','"':'&quot;'}[char];
  });
}

function showInlineAttachment(button) {
  const url = button.dataset.url || '';
  const name = button.dataset.name || 'Tài liệu';
  const ext = (button.dataset.ext || '').toLowerCase();
  const viewer = document.getElementById('inlineDocumentViewer');
  const body = document.getElementById('inlineViewerBody');
  const title = document.getElementById('inlineViewerTitle');
  const newTab = document.getElementById('inlineViewerNewTab');

  document.querySelectorAll('.attachment-view-btn').forEach(function(item){ item.classList.remove('active'); });
  button.classList.add('active');
  title.textContent = name;
  newTab.href = url;
  body.innerHTML = '<div class="inline-viewer-loading"><i class="fa-solid fa-circle-notch fa-spin fa-2x text-primary"></i><span>Đang nạp tài liệu...</span></div>';
  viewer.hidden = false;

  const safeUrl = viewerEscape(url);
  const safeName = viewerEscape(name);
  let content = '';
  if (ext === 'pdf') {
    const pdfJsViewer = '<?php echo XC_URL; ?>/template/frontend_old/assets/pdfjs/web/viewer.html?file=' + encodeURIComponent(url);
    content = '<iframe src="' + viewerEscape(pdfJsViewer) + '" title="' + safeName + ' - PDF.js"></iframe>';
  } else if (['jpg','jpeg','png','gif','webp','svg'].includes(ext)) {
    content = '<div class="inline-viewer-image"><img src="' + safeUrl + '" alt="' + safeName + '"></div>';
  } else if (['txt','csv','xml','json'].includes(ext)) {
    content = '<iframe src="' + safeUrl + '" title="' + safeName + '"></iframe>';
  } else if (['doc','docx','xls','xlsx','ppt','pptx'].includes(ext) && !['localhost','127.0.0.1'].includes(window.location.hostname)) {
    const absoluteUrl = new URL(url, window.location.href).href;
    const officeViewer = 'https://view.officeapps.live.com/op/embed.aspx?src=' + encodeURIComponent(absoluteUrl);
    content = '<iframe src="' + viewerEscape(officeViewer) + '" title="' + safeName + ' - Microsoft Office Viewer"></iframe>';
  } else {
    const message = ['doc','docx','xls','xlsx','ppt','pptx'].includes(ext)
      ? 'Trình xem Microsoft Office chỉ truy cập được khi website sử dụng tên miền công khai. Trên máy nội bộ, vui lòng tải tệp để mở bằng ứng dụng Office.'
      : 'Định dạng .' + viewerEscape(ext.toUpperCase()) + ' chưa hỗ trợ xem trực tiếp trên trình duyệt.';
    content = '<div class="inline-viewer-message"><i class="fa-solid fa-file-arrow-down fa-3x text-primary"></i><strong>Không thể xem trực tiếp</strong><p>' + message + '</p><a href="' + safeUrl + '" download="' + safeName + '" class="attachment-download-btn"><i class="fa-solid fa-download"></i>Tải tệp về</a></div>';
  }
  body.innerHTML = content;
  viewer.scrollIntoView({behavior:'smooth', block:'start'});
}

function closeInlineAttachment() {
  const viewer = document.getElementById('inlineDocumentViewer');
  viewer.hidden = true;
  document.getElementById('inlineViewerBody').innerHTML = '';
  document.querySelectorAll('.attachment-view-btn').forEach(function(item){ item.classList.remove('active'); });
}
</script>

<?php require_once 'footer.php'; ?>
