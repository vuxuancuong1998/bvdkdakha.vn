<?php $active_menu = 'staticpage_form'; require "header.php"; ?>

<!-- CKEditor 5 Super Build – Full MS Word–like rich text editing -->
<script src="https://cdn.ckeditor.com/ckeditor5/39.0.1/super-build/ckeditor.js"></script>

<style>
/* ── CKEditor min-height ── */
.ck-editor__editable_inline { min-height: 460px; font-size: 15px; line-height: 1.8; }

/* ── Attachment drop-zone ── */
#dropZone {
   border: 2px dashed #a0aec0; border-radius: 12px;
   background: #f8faff; transition: all .25s ease; cursor: pointer;
}
#dropZone.dragover, #dropZone:hover { border-color: #4e73df; background: #eef2ff; }

/* ── Attach item ── */
.attach-item {
   display:flex; align-items:center; gap:10px;
   padding:8px 12px; border-radius:8px;
   background:#fff; border:1px solid #e2e8f0;
   margin-bottom:8px; transition:box-shadow .2s;
}
.attach-item:hover { box-shadow:0 2px 8px rgba(78,115,223,.15); }
.attach-item .a-icon  { font-size:20px; width:28px; text-align:center; flex-shrink:0; }
.attach-item .a-name  { flex:1; font-size:13px; word-break:break-all; color:#2d3748; }
.attach-item .a-size  { font-size:11px; color:#718096; white-space:nowrap; }
.attach-item .btn-rm  {
   border:none; background:none; color:#e53e3e;
   padding:2px 6px; cursor:pointer; border-radius:6px; transition:background .2s;
}
.attach-item .btn-rm:hover { background:#fff5f5; }
.saved-att { background:#f0fff4; border-color:#9ae6b4; }
.saved-att .a-icon { color:#38a169; }

/* ── Section label ── */
.sec-label {
   font-size:12px; font-weight:700; text-transform:uppercase;
   letter-spacing:.06em; color:#4a5568;
   display:flex; align-items:center; gap:8px; margin-bottom:12px;
}
.sec-label::after { content:''; flex:1; height:1px; background:#e2e8f0; }

/* ── Char counter ── */
.char-c { font-size:11px; color:#a0aec0; text-align:right; }

/* ── Sticky sidebar ── */
@media(min-width:992px){ .sticky-sb { position:sticky; top:76px; } }
</style>

<div class="conatiner-fluid content-inner mt-n5 py-0">
   <div class="row">
      <div class="col-sm-12">
         <div class="card shadow-sm border-0">

            <!-- Header -->
            <div class="card-header d-flex justify-content-between align-items-center bg-white py-3 border-bottom">
               <div>
                  <h4 class="card-title text-primary font-weight-bold mb-1">
                     <i class="fa-solid fa-file-pen me-2"></i>
                     <?php echo ($method == 'edit') ? 'Chỉnh sửa Trang Tĩnh (CMS)' : 'Thêm mới Trang Tĩnh (CMS)'; ?>
                  </h4>
                  <p class="text-muted small mb-0">Soạn thảo nội dung landing page / trang tĩnh với đầy đủ định dạng như MS Word.</p>
               </div>
               <a href="<?php echo XC_URL; ?>/admin/staticpages" class="btn btn-outline-secondary btn-sm rounded-pill px-3">
                  <i class="fa-solid fa-arrow-left me-1"></i> Quay lại
               </a>
            </div>

            <div class="card-body py-4">
               <form id="formStaticPage" enctype="multipart/form-data" novalidate>
                  <input type="hidden" name="id"     value="<?php echo (!empty($page_detail)) ? $page_detail->id : 0; ?>">
                  <input type="hidden" name="method" value="<?php echo $method ?? 'add'; ?>">

                  <div class="row g-4">

                     <!-- ════════════════════════════════════════
                          LEFT – Title | Content | Attachments
                          ════════════════════════════════════════ -->
                     <div class="col-lg-8">

                        <!-- ① Tiêu đề & thông tin cơ bản -->
                        <div class="card border-0 bg-light p-3 mb-3 rounded-3">
                           <div class="sec-label"><i class="fa-solid fa-heading text-primary"></i> Thông tin cơ bản</div>

                           <div class="mb-3">
                              <label class="form-label fw-bold text-dark" for="page_title">
                                 Tiêu đề trang tĩnh <span class="text-danger">*</span>
                              </label>
                              <input type="text" id="page_title" name="page_title"
                                     class="form-control form-control-lg"
                                     placeholder="Ví dụ: Giới thiệu Bệnh viện, Cơ cấu tổ chức..."
                                     value="<?php echo (!empty($page_detail)) ? htmlspecialchars($page_detail->page_title) : ''; ?>"
                                     maxlength="255" required>
                              <div class="d-flex justify-content-between mt-1">
                                 <div class="form-text">Hiển thị ở đầu trang và thanh trình duyệt.</div>
                                 <span class="char-c" id="cTitle">0 / 255</span>
                              </div>
                           </div>

                           <div class="row g-3 mb-3">
                              <div class="col-md-6">
                                 <label class="form-label fw-bold text-dark">Hashtag trang</label>
                                 <input type="text" name="hashtag" class="form-control"
                                        placeholder="#gioi-thieu, #co-cau-to-chuc"
                                        value="<?php echo (!empty($page_detail)) ? htmlspecialchars($page_detail->hashtag) : ''; ?>">
                                 <div class="form-text">Từ khóa nhận diện / nổi bật.</div>
                              </div>
                              <div class="col-md-6">
                                 <label class="form-label fw-bold text-dark">Link URL tùy chỉnh</label>
                                 <input type="text" name="link_url" class="form-control"
                                        placeholder="/trang/gioi-thieu"
                                        value="<?php echo (!empty($page_detail)) ? htmlspecialchars($page_detail->link_url) : ''; ?>">
                                 <div class="form-text">Đường dẫn frontend tùy chỉnh.</div>
                              </div>
                           </div>

                           <div class="mb-0">
                              <label class="form-label fw-bold text-dark">Mô tả ngắn (Summary)</label>
                              <textarea name="page_summary" class="form-control" rows="3"
                                        placeholder="Tóm tắt ngắn gọn nội dung trang tĩnh..."
                                        maxlength="500"><?php echo (!empty($page_detail)) ? htmlspecialchars($page_detail->page_summary) : ''; ?></textarea>
                              <span class="char-c" id="cSummary">0 / 500</span>
                           </div>
                        </div>

                        <!-- ② CKEditor 5 – Nội dung chi tiết -->
                        <div class="card border-0 bg-light p-3 mb-3 rounded-3">
                           <div class="sec-label">
                              <i class="fa-solid fa-pen-nib text-primary"></i> Nội dung chi tiết
                              <span class="badge bg-primary bg-opacity-10 text-primary fw-normal ms-1">
                                 <i class="fa-solid fa-wand-magic-sparkles me-1"></i>CKEditor 5 – Full Word
                              </span>
                           </div>
                           <!-- Textarea luôn hiển thị sẵn, CKEditor sẽ tự động gắn lên nếu load thành công -->
                           <textarea name="page_content" id="editor_content" class="form-control" rows="12" style="min-height:400px; font-size:15px; line-height:1.6;" placeholder="Nhập nội dung chi tiết trang tĩnh tại đây (bảng, hình ảnh, văn bản, mã nhúng)..."><?php echo (!empty($page_detail)) ? htmlspecialchars($page_detail->page_content) : ''; ?></textarea>
                        </div>

                        <!-- ③ File đính kèm -->
                        <div class="card border-0 bg-light p-3 rounded-3">
                           <div class="sec-label">
                              <i class="fa-solid fa-paperclip text-primary"></i> File đính kèm
                              <span class="badge bg-secondary fw-normal ms-1" id="attachBadge">0 file</span>
                           </div>

                           <!-- Drop zone -->
                           <div id="dropZone" class="text-center py-4 px-3 mb-3"
                                onclick="document.getElementById('attachInput').click()">
                              <i class="fa-solid fa-cloud-arrow-up fa-2x text-primary mb-2 d-block"></i>
                              <p class="mb-1 fw-bold text-primary">Kéo &amp; thả hoặc nhấn để chọn file</p>
                              <p class="text-muted small mb-0">PDF, Word, Excel, PowerPoint, hình ảnh, ZIP... · Tối đa 20 MB/file</p>
                           </div>
                           <input type="file" id="attachInput" name="attachments[]" multiple style="display:none;"
                                  accept=".pdf,.doc,.docx,.xls,.xlsx,.ppt,.pptx,.txt,.csv,.zip,.rar,.jpg,.jpeg,.png,.gif,.webp">

                           <!-- New files list -->
                           <div id="newFileList"></div>

                           <!-- Saved attachments (edit mode) -->
                           <?php if (!empty($page_attachments) && is_array($page_attachments)): ?>
                           <div id="savedFileList" class="mt-2">
                              <p class="sec-label"><i class="fa-solid fa-folder-open text-success"></i> File đã lưu</p>
                              <?php foreach ($page_attachments as $att): ?>
                              <div class="attach-item saved-att" id="satt_<?php echo $att->id; ?>">
                                 <span class="a-icon">📎</span>
                                 <span class="a-name">
                                    <a href="<?php echo XC_URL . '/' . $att->file_path; ?>" target="_blank"
                                       class="text-success text-decoration-none">
                                       <?php echo htmlspecialchars($att->file_name); ?>
                                    </a>
                                 </span>
                                 <span class="a-size"><?php echo number_format(($att->file_size ?? 0)/1024, 1); ?> KB</span>
                                 <button type="button" class="btn-rm btn-rm-saved" data-aid="<?php echo $att->id; ?>" title="Xóa">
                                    <i class="fa-solid fa-trash-can"></i>
                                 </button>
                              </div>
                              <?php endforeach; ?>
                           </div>
                           <div id="deletedContainer"></div>
                           <?php endif; ?>
                        </div>

                     </div><!-- /col-lg-8 -->

                     <!-- ════════════════════════════════════════
                          RIGHT – Settings | Banner | SEO
                          ════════════════════════════════════════ -->
                     <div class="col-lg-4">
                        <div class="sticky-sb">

                           <!-- Thiết lập -->
                           <div class="card border p-3 mb-3 bg-white shadow-sm rounded-3">
                              <div class="sec-label"><i class="fa-solid fa-sliders text-primary"></i> Thiết lập trang</div>

                              <div class="mb-3">
                                 <label class="form-label fw-bold text-dark">Danh mục trang tĩnh</label>
                                 <select name="category_id" class="form-select">
                                    <option value="0">-- Chưa chọn danh mục --</option>
                                    <?php if(!empty($categories)): foreach($categories as $cat): ?>
                                    <option value="<?php echo $cat->id; ?>"
                                       <?php echo (!empty($page_detail) && $page_detail->category_id == $cat->id) ? 'selected' : ''; ?>>
                                       <?php echo htmlspecialchars($cat->category_name); ?>
                                    </option>
                                    <?php endforeach; endif; ?>
                                 </select>
                              </div>

                              <div class="mb-3">
                                 <label class="form-label fw-bold text-dark">URL Slug</label>
                                 <div class="input-group">
                                    <span class="input-group-text text-muted small">/trang/</span>
                                    <input type="text" name="page_slug" id="page_slug"
                                           class="form-control font-monospace"
                                           placeholder="tu-dong-tao-tu-tieu-de"
                                           value="<?php echo (!empty($page_detail)) ? htmlspecialchars($page_detail->page_slug) : ''; ?>">
                                 </div>
                                 <div class="form-text">Tự động sinh từ tiêu đề nếu để trống.</div>
                              </div>

                              <div class="mb-3">
                                 <label class="form-label fw-bold text-dark">Trạng thái</label>
                                 <select name="page_status" class="form-select">
                                    <option value="1" <?php echo (empty($page_detail) || $page_detail->page_status == 1) ? 'selected' : ''; ?>>✅ Hiển thị</option>
                                    <option value="0" <?php echo (!empty($page_detail) && $page_detail->page_status == 0) ? 'selected' : ''; ?>>🔒 Ẩn</option>
                                 </select>
                              </div>

                              <div class="mb-0">
                                 <label class="form-label fw-bold text-dark">Thứ tự sắp xếp</label>
                                 <input type="number" name="sort_order" class="form-control" min="0"
                                        value="<?php echo (!empty($page_detail)) ? (int)$page_detail->sort_order : 0; ?>">
                              </div>
                           </div>

                           <!-- Banner -->
                           <div class="card border p-3 mb-3 bg-white shadow-sm rounded-3">
                              <div class="sec-label"><i class="fa-solid fa-image text-primary"></i> Ảnh Banner</div>

                              <div id="bannerWrap" class="mb-3 text-center border rounded-2 p-2 bg-light <?php echo empty($page_detail->banner_image) ? 'd-none' : ''; ?>">
                                 <img id="bannerPrev"
                                      src="<?php echo (!empty($page_detail->banner_image)) ? XC_URL.'/'.$page_detail->banner_image : ''; ?>"
                                      class="img-fluid rounded-2" style="max-height:140px;object-fit:cover;" alt="Banner">
                                 <div class="small text-muted mt-1">Ảnh hiện tại</div>
                              </div>
                              <?php if (empty($page_detail->banner_image)): ?>
                              <div id="noBanner" class="mb-3 text-center text-muted border rounded-2 py-4 bg-light">
                                 <i class="fa-regular fa-image fa-2x d-block mb-2"></i>
                                 <span class="small">Chưa có ảnh banner</span>
                              </div>
                              <?php endif; ?>

                              <div>
                                 <label class="form-label fw-bold text-dark small">Tải ảnh mới (JPEG / PNG / WebP)</label>
                                 <input type="file" name="banner_image" id="bannerInput"
                                        class="form-control form-control-sm" accept="image/*">
                              </div>
                           </div>

                           <!-- SEO -->
                           <div class="card border p-3 bg-white shadow-sm rounded-3">
                              <div class="sec-label"><i class="fa-solid fa-magnifying-glass-chart text-primary"></i> Tối ưu SEO</div>

                              <div class="mb-3">
                                 <label class="form-label fw-bold text-dark">Meta Title</label>
                                 <input type="text" name="meta_title" class="form-control"
                                        placeholder="Tiêu đề trên Google..."
                                        value="<?php echo (!empty($page_detail)) ? htmlspecialchars($page_detail->meta_title) : ''; ?>">
                              </div>
                              <div class="mb-3">
                                 <label class="form-label fw-bold text-dark">Meta Keywords</label>
                                 <input type="text" name="meta_keywords" class="form-control"
                                        placeholder="Từ khóa, phân cách bằng dấu phẩy..."
                                        value="<?php echo (!empty($page_detail)) ? htmlspecialchars($page_detail->meta_keywords) : ''; ?>">
                              </div>
                              <div class="mb-0">
                                 <label class="form-label fw-bold text-dark">Meta Description</label>
                                 <textarea name="meta_description" class="form-control" rows="3"
                                           placeholder="Mô tả SEO (tối đa 160 ký tự)..."
                                           maxlength="160"><?php echo (!empty($page_detail)) ? htmlspecialchars($page_detail->meta_description) : ''; ?></textarea>
                                 <span class="char-c" id="cMeta">0 / 160</span>
                              </div>
                           </div>

                        </div><!-- /sticky-sb -->
                     </div><!-- /col-lg-4 -->

                  </div><!-- /row -->

                  <!-- Action buttons -->
                  <div class="border-top pt-3 mt-3 d-flex justify-content-between align-items-center">
                     <div class="text-muted small">
                        <i class="fa-solid fa-circle-info me-1 text-primary"></i>
                        Trường có <span class="text-danger fw-bold">*</span> là bắt buộc.
                     </div>
                     <div class="d-flex gap-2">
                        <a href="<?php echo XC_URL; ?>/admin/staticpages" class="btn btn-outline-secondary px-4 rounded-pill">
                           <i class="fa-solid fa-xmark me-1"></i>Hủy bỏ
                        </a>
                        <button type="submit" id="btnSubmitPage" class="btn btn-primary px-5 shadow-sm rounded-pill">
                           <i class="fa-solid fa-floppy-disk me-1"></i>
                           <?php echo ($method == 'edit') ? 'Lưu cập nhật' : 'Đăng trang tĩnh'; ?>
                        </button>
                     </div>
                  </div>

               </form>
            </div><!-- /card-body -->
         </div>
      </div>
   </div>
</div>

<!-- =====================================================
     JavaScript
     ===================================================== -->
<script>
'use strict';

/* ─────────────────────────────────────────────────────
   1. CKEditor 5 Super Build – Full MS Word Toolbar
   ───────────────────────────────────────────────────── */
let editorInstance;
document.addEventListener('DOMContentLoaded', function () {

   // Đọc nội dung ban đầu từ textarea (PHP đã render)
   var initialContent = document.getElementById('editor_content').textContent || '';

   // Kiểm tra CKEDITOR có tồn tại
   if (typeof CKEDITOR === 'undefined' || typeof CKEDITOR.ClassicEditor === 'undefined') {
      console.warn('CKEditor Super Build chưa load, người dùng tiếp tục với textarea chuẩn.');
      return;
   }

   CKEDITOR.ClassicEditor.create(document.querySelector('#editor_content'), {
      toolbar: {
         items: [
            'findAndReplace', 'selectAll', '|',
            'heading', '|',
            'bold', 'italic', 'underline', 'strikethrough', 'code',
            'subscript', 'superscript', 'removeFormat', '|',
            'bulletedList', 'numberedList', 'todoList', '|',
            'outdent', 'indent', '|',
            'undo', 'redo', '|',
            'fontSize', 'fontFamily', 'fontColor', 'fontBackgroundColor', 'highlight', '|',
            'alignment', '|',
            'link', 'uploadImage', 'blockQuote',
            'insertTable', 'mediaEmbed', 'codeBlock', 'htmlEmbed', '|',
            'specialCharacters', 'horizontalLine', 'pageBreak', '|',
            'sourceEditing'
         ],
         shouldNotGroupWhenFull: true
      },
      list: { properties: { styles: true, startIndex: true, reversed: true } },
      heading: {
         options: [
            { model: 'paragraph', title: 'Đoạn văn',   class: 'ck-heading_paragraph' },
            { model: 'heading1',  view: 'h1', title: 'Tiêu đề 1', class: 'ck-heading_heading1' },
            { model: 'heading2',  view: 'h2', title: 'Tiêu đề 2', class: 'ck-heading_heading2' },
            { model: 'heading3',  view: 'h3', title: 'Tiêu đề 3', class: 'ck-heading_heading3' },
            { model: 'heading4',  view: 'h4', title: 'Tiêu đề 4', class: 'ck-heading_heading4' },
            { model: 'heading5',  view: 'h5', title: 'Tiêu đề 5', class: 'ck-heading_heading5' }
         ]
      },
      fontFamily: {
         options: [
            'default',
            'Be Vietnam Pro, sans-serif',
            'Arial, Helvetica, sans-serif',
            'Courier New, Courier, monospace',
            'Georgia, serif',
            'Tahoma, Geneva, sans-serif',
            'Times New Roman, Times, serif',
            'Trebuchet MS, Helvetica, sans-serif',
            'Verdana, Geneva, sans-serif'
         ],
         supportAllValues: true
      },
      fontSize: {
         options: [10, 11, 12, 13, 14, 'default', 16, 18, 20, 22, 24, 28, 32, 36, 48],
         supportAllValues: true
      },
      image: {
         toolbar: [
            'imageTextAlternative', 'toggleImageCaption',
            'imageStyle:inline', 'imageStyle:block', 'imageStyle:side',
            '|', 'resizeImage'
         ]
      },
      table: {
         contentToolbar: [
            'tableColumn', 'tableRow', 'mergeTableCells',
            'tableProperties', 'tableCellProperties'
         ]
      },
      htmlSupport: { allow: [{ name: /.*/, attributes: true, classes: true, styles: true }] },
      placeholder: 'Nhập nội dung chi tiết trang tĩnh tại đây...',
      removePlugins: [
         'CKBox','CKFinder','EasyImage',
         'RealTimeCollaborativeComments','RealTimeCollaborativeTrackChanges',
         'RealTimeCollaborativeRevisionHistory','PresenceList',
         'Comments','TrackChanges','TrackChangesData',
         'RevisionHistory','Pagination','WProofreader','MathType'
      ]
   }).then(function (ed) {
      editorInstance = ed;
      console.log('CKEditor 5 đã khởi tạo thành công!');
   }).catch(function (err) {
      console.error('Lỗi khi mở CKEditor:', err);
   });

}); // end DOMContentLoaded


/* ─────────────────────────────────────────────────────
   2. Auto-slug + Char counters
   ───────────────────────────────────────────────────── */
let slugLocked = <?php echo (!empty($page_detail->page_slug)) ? 'true' : 'false'; ?>;

$('#page_title').on('input', function () {
   $('#cTitle').text(this.value.length + ' / 255');
   if (!slugLocked) {
      $('#page_slug').val(
         this.value.toLowerCase()
            .normalize('NFD').replace(/[\u0300-\u036f]/g,'')
            .replace(/[đĐ]/g,'d')
            .replace(/[^a-z0-9\s-]/g,'')
            .trim().replace(/\s+/g,'-')
      );
   }
});
$('#page_slug').on('input', function(){ slugLocked = this.value.trim() !== ''; });
$('textarea[name="page_summary"]').on('input', function(){ $('#cSummary').text(this.value.length+' / 500'); });
$('textarea[name="meta_description"]').on('input', function(){ $('#cMeta').text(this.value.length+' / 160'); });

// Init counters
(function(){
   $('#cTitle').text(<?php echo (!empty($page_detail)) ? mb_strlen($page_detail->page_title) : 0; ?>+' / 255');
   $('#cSummary').text($('textarea[name="page_summary"]').val().length+' / 500');
   $('#cMeta').text($('textarea[name="meta_description"]').val().length+' / 160');
})();


/* ─────────────────────────────────────────────────────
   3. Banner preview
   ───────────────────────────────────────────────────── */
$('#bannerInput').on('change', function(){
   const f = this.files[0]; if(!f) return;
   const r = new FileReader();
   r.onload = e => {
      $('#bannerPrev').attr('src', e.target.result);
      $('#bannerWrap').removeClass('d-none');
      $('#noBanner').addClass('d-none');
   };
   r.readAsDataURL(f);
});


/* ─────────────────────────────────────────────────────
   4. File attachments – drag & drop | multi-upload | remove
   ───────────────────────────────────────────────────── */
const MAX_BYTES = 20 * 1024 * 1024;
let newFiles = [];   // [{file, uid}]

const iconMap = {
   pdf:'📄', doc:'📝', docx:'📝', xls:'📊', xlsx:'📊',
   ppt:'📽️', pptx:'📽️', txt:'🗒️', csv:'📋',
   zip:'🗜️', rar:'🗜️', jpg:'🖼️', jpeg:'🖼️',
   png:'🖼️', gif:'🖼️', webp:'🖼️'
};
function extOf(n){ return n.split('.').pop().toLowerCase(); }
function iconOf(n){ return iconMap[extOf(n)] || '📎'; }
function fmtSize(b){
   return b<1024 ? b+' B' : b<1048576 ? (b/1024).toFixed(1)+' KB' : (b/1048576).toFixed(2)+' MB';
}
function updateBadge(){
   const saved = $('#savedFileList .attach-item:visible').length || 0;
   $('#attachBadge').text((newFiles.length + saved) + ' file');
}
function syncInput(){
   const dt = new DataTransfer();
   newFiles.forEach(o => dt.items.add(o.file));
   document.getElementById('attachInput').files = dt.files;
}
function renderFile(o){
   $('#newFileList').append(`
      <div class="attach-item" id="nf_${o.uid}">
         <span class="a-icon">${iconOf(o.file.name)}</span>
         <span class="a-name">${$('<span>').text(o.file.name).html()}</span>
         <span class="a-size">${fmtSize(o.file.size)}</span>
         <button type="button" class="btn-rm btn-rm-new" data-uid="${o.uid}" title="Bỏ file">
            <i class="fa-solid fa-xmark"></i>
         </button>
      </div>`);
}
function addFiles(files){
   let tooBig = [];
   Array.from(files).forEach(f => {
      if(f.size > MAX_BYTES){ tooBig.push(f.name); return; }
      const uid = Date.now()+'_'+Math.random().toString(36).substr(2,6);
      newFiles.push({file:f, uid});
      renderFile({file:f, uid});
   });
   if(tooBig.length) Swal.fire('Quá dung lượng','Các file vượt 20 MB:<br>'+tooBig.join('<br>'),'warning');
   syncInput(); updateBadge();
}

// Click select
$('#attachInput').on('change', function(){ addFiles(this.files); this.value=''; });

// Drag & drop
const dz = document.getElementById('dropZone');
dz.addEventListener('dragover', e=>{ e.preventDefault(); dz.classList.add('dragover'); });
dz.addEventListener('dragleave', ()=> dz.classList.remove('dragover'));
dz.addEventListener('drop', e=>{ e.preventDefault(); dz.classList.remove('dragover'); addFiles(e.dataTransfer.files); });

// Remove new file
$(document).on('click','.btn-rm-new', function(){
   const uid = $(this).data('uid');
   newFiles = newFiles.filter(o => o.uid !== String(uid));
   $('#nf_'+uid).remove();
   syncInput(); updateBadge();
});

// Remove saved file (edit mode)
$(document).on('click','.btn-rm-saved', function(){
   const aid = $(this).data('aid');
   Swal.fire({
      title:'Xóa file đính kèm?',
      text:'File sẽ bị xóa vĩnh viễn sau khi lưu!',
      icon:'warning', showCancelButton:true,
      confirmButtonText:'Xóa', cancelButtonText:'Hủy',
      confirmButtonColor:'#e53e3e'
   }).then(r => {
      if(r.isConfirmed){
         $('#satt_'+aid).addClass('d-none');
         $('#deletedContainer').append(`<input type="hidden" name="delete_attachments[]" value="${aid}">`);
         updateBadge();
      }
   });
});

updateBadge();


/* ─────────────────────────────────────────────────────
   5. AJAX Form Submit
   ───────────────────────────────────────────────────── */
$('#formStaticPage').on('submit', function(e){
   e.preventDefault();

   // Sync CKEditor
   if(editorInstance) document.querySelector('#editor_content').value = editorInstance.getData();

   // Validate
   if(!$('#page_title').val().trim()){
      Swal.fire('Thiếu thông tin','Vui lòng nhập Tiêu đề trang tĩnh!','warning');
      $('#page_title').focus(); return;
   }

   const formData = new FormData(this);

   // Đảm bảo đưa toàn bộ file đính kèm mới (kể cả chọn file hoặc kéo thả) vào FormData
   formData.delete('attachments[]');
   newFiles.forEach(function(o){
      formData.append('attachments[]', o.file);
   });

   const $btn = $('#btnSubmitPage');
   $btn.prop('disabled',true).html('<i class="fa-solid fa-spinner fa-spin me-1"></i> Đang lưu...');

   $.ajax({
      url: '<?php echo XC_URL; ?>/api/staticpages',
      type: 'POST',
      data: formData,
      contentType: false,
      processData: false,
      dataType: 'json',
      success(res){
         $btn.prop('disabled',false).html('<i class="fa-solid fa-floppy-disk me-1"></i> <?php echo ($method=="edit")?"Lưu cập nhật":"Đăng trang tĩnh"; ?>');
         if(res.status==200){
            Swal.fire('Thành công!', res.message,'success').then(()=>{
               window.location.href = res.returnUrl || '<?php echo XC_URL; ?>/admin/staticpages';
            });
         } else {
            Swal.fire('Lỗi', res.message,'error');
         }
      },
      error(){
         $btn.prop('disabled',false).html('<i class="fa-solid fa-floppy-disk me-1"></i> <?php echo ($method=="edit")?"Lưu cập nhật":"Đăng trang tĩnh"; ?>');
         Swal.fire('Lỗi kết nối','Không thể kết nối đến server!','error');
      }
   });
});
</script>

<?php require "footer.php"; ?>
