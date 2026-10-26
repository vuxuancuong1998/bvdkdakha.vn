<?php $active_menu = 'staticpage_form'; require "header.php"; ?>

<!-- CKEditor 5 Super Build – Full MS Word–like rich text editing -->
<script src="https://cdn.ckeditor.com/ckeditor5/39.0.1/super-build/ckeditor.js"></script>

<style>
.static-page-form { max-width: 1080px; margin: 0 auto; }
.static-page-form .ck-editor__editable_inline { min-height: 380px; }
.static-page-form .ck-editor { width: 100%; min-width: 0; }
.static-page-form .ck-content { overflow-wrap: anywhere; }
#dropZone { border: 2px dashed #cbd5e1; border-radius: 10px; background: #f8fafc; cursor: pointer; }
#dropZone:hover, #dropZone.dragover { border-color: #4e73df; background: #eef2ff; }
.attach-item { display: flex; align-items: center; gap: 10px; padding: 8px 12px; border: 1px solid #e2e8f0; border-radius: 8px; margin-bottom: 8px; }
.attach-item .a-name { flex: 1; overflow-wrap: anywhere; }
.attach-item .a-size { color: #667085; font-size: 12px; }
.attach-item .btn-rm { border: 0; background: none; color: #dc3545; }
#bannerPrev { max-width: 100%; max-height: 180px; object-fit: contain; }
.code-template-source { min-width: 260px; min-height: 160px; font-family: Consolas, monospace; font-size: 13px; white-space: pre; }
</style>
<div class="conatiner-fluid content-inner mt-n5 py-0">
  <div class="static-page-form card border-0 shadow-sm">
    <div class="card-header bg-white border-bottom py-3 d-flex flex-wrap gap-3 justify-content-between align-items-center">
      <div><h4 class="card-title mb-1"><?php echo ($method == 'edit') ? 'Chỉnh sửa trang tĩnh' : 'Thêm trang tĩnh'; ?></h4><p class="text-muted small mb-0">Thông tin và nội dung hiển thị trên trang.</p></div>
      <div class="d-flex gap-2 flex-shrink-0">
        <button type="button" class="btn btn-outline-primary btn-sm" data-bs-toggle="modal" data-bs-target="#codeTemplatesModal"><i class="fa-solid fa-code me-1"></i>Code mẫu</button>
        <a href="<?php echo XC_URL; ?>/admin/staticpages" class="btn btn-outline-secondary btn-sm">Quay lại</a>
      </div>
    </div>
    <div class="card-body p-3 p-md-4">
      <form id="formStaticPage" enctype="multipart/form-data" novalidate>
        <input type="hidden" name="id" value="<?php echo (int)($page_detail->id ?? 0); ?>">
        <input type="hidden" name="method" value="<?php echo htmlspecialchars($method ?? 'add', ENT_QUOTES, 'UTF-8'); ?>">
        <input type="hidden" name="category_id" value="<?php echo (int)($page_detail->category_id ?? 0); ?>">
        <input type="hidden" name="page_slug" id="page_slug" value="<?php echo htmlspecialchars($page_detail->page_slug ?? '', ENT_QUOTES, 'UTF-8'); ?>">
        <input type="hidden" name="page_status" value="<?php echo (int)($page_detail->page_status ?? 1); ?>">
        <input type="hidden" name="sort_order" value="<?php echo (int)($page_detail->sort_order ?? 0); ?>">
        <input type="hidden" name="hashtag" value="<?php echo htmlspecialchars($page_detail->hashtag ?? '', ENT_QUOTES, 'UTF-8'); ?>">
        <input type="hidden" name="page_summary" value="<?php echo htmlspecialchars($page_detail->page_summary ?? '', ENT_QUOTES, 'UTF-8'); ?>">
        <input type="hidden" name="meta_title" value="<?php echo htmlspecialchars($page_detail->meta_title ?? '', ENT_QUOTES, 'UTF-8'); ?>">
        <input type="hidden" name="meta_keywords" value="<?php echo htmlspecialchars($page_detail->meta_keywords ?? '', ENT_QUOTES, 'UTF-8'); ?>">
        <input type="hidden" name="meta_description" value="<?php echo htmlspecialchars($page_detail->meta_description ?? '', ENT_QUOTES, 'UTF-8'); ?>">
        <div class="row g-4">
          <div class="col-12">
            <label for="page_title" class="form-label fw-bold">Tên trang tĩnh <span class="text-danger">*</span></label>
            <input type="text" id="page_title" name="page_title" class="form-control" maxlength="255" required placeholder="Nhập tên trang tĩnh" value="<?php echo htmlspecialchars($page_detail->page_title ?? '', ENT_QUOTES, 'UTF-8'); ?>">
          </div>
          <div class="col-12">
            <label for="link_url" class="form-label fw-bold">Link URL</label>
            <input type="text" id="link_url" name="link_url" class="form-control" placeholder="/trang/gioi-thieu" value="<?php echo htmlspecialchars($page_detail->link_url ?? '', ENT_QUOTES, 'UTF-8'); ?>">
            <div class="form-text">Để trống nếu dùng đường dẫn được tạo từ tên trang.</div>
          </div>
          <div class="col-12">
            <label for="editor_content" class="form-label fw-bold">Mô tả chi tiết</label>
            <textarea name="page_content" id="editor_content" class="form-control" rows="14" placeholder="Nhập nội dung chi tiết..."><?php echo htmlspecialchars($page_detail->page_content ?? '', ENT_QUOTES, 'UTF-8'); ?></textarea>
            <div id="editorNotice" class="alert alert-warning mt-2 d-none" role="status"></div>
          </div>
          <div class="col-md-7">
            <label class="form-label fw-bold">File đính kèm <span class="badge bg-light text-secondary" id="attachBadge">0 file</span></label>
            <div id="dropZone" class="text-center p-4 mb-3" onclick="document.getElementById('attachInput').click()">
              <i class="fa-solid fa-cloud-arrow-up text-primary d-block mb-2"></i><strong>Chọn hoặc kéo thả file vào đây</strong>
              <div class="small text-muted mt-1">Tối đa 20 MB mỗi file</div>
            </div>
            <input type="file" id="attachInput" name="attachments[]" multiple class="d-none" accept=".pdf,.doc,.docx,.xls,.xlsx,.ppt,.pptx,.txt,.csv,.zip,.rar,.jpg,.jpeg,.png,.gif,.webp">
            <div id="newFileList"></div>
            <?php if (!empty($page_attachments) && is_array($page_attachments)): ?>
            <div id="savedFileList">
              <?php foreach ($page_attachments as $att): ?>
              <div class="attach-item" id="satt_<?php echo (int)$att->id; ?>">
                <span class="a-icon">📎</span>
                <span class="a-name"><a href="<?php echo htmlspecialchars(XC_URL . '/' . $att->file_path, ENT_QUOTES, 'UTF-8'); ?>" target="_blank"><?php echo htmlspecialchars($att->file_name, ENT_QUOTES, 'UTF-8'); ?></a></span>
                <span class="a-size"><?php echo number_format(($att->file_size ?? 0)/1024, 1); ?> KB</span>
                <button type="button" class="btn-rm btn-rm-saved" data-aid="<?php echo (int)$att->id; ?>" title="Xóa file"><i class="fa-solid fa-trash-can"></i></button>
              </div>
              <?php endforeach; ?>
            </div>
            <?php endif; ?>
            <div id="deletedContainer"></div>
          </div>
          <div class="col-md-5">
            <label for="bannerInput" class="form-label fw-bold">Ảnh banner</label>
            <div id="bannerWrap" class="border rounded p-2 mb-2 <?php echo empty($page_detail->banner_image) ? 'd-none' : ''; ?>">
              <img id="bannerPrev" src="<?php echo !empty($page_detail->banner_image) ? htmlspecialchars(XC_URL . '/' . $page_detail->banner_image, ENT_QUOTES, 'UTF-8') : ''; ?>" alt="Ảnh banner">
            </div>
            <div id="noBanner" class="text-muted small mb-2 <?php echo !empty($page_detail->banner_image) ? 'd-none' : ''; ?>">Chưa có ảnh banner</div>
            <input type="file" name="banner_image" id="bannerInput" class="form-control" accept="image/*">
          </div>
        </div>
        <div class="border-top mt-4 pt-3 d-flex justify-content-end gap-2">
          <a href="<?php echo XC_URL; ?>/admin/staticpages" class="btn btn-outline-secondary">Hủy</a>
          <button type="submit" id="btnSubmitPage" class="btn btn-primary px-4"><i class="fa-solid fa-floppy-disk me-1"></i><?php echo ($method == 'edit') ? 'Lưu cập nhật' : 'Lưu trang tĩnh'; ?></button>
        </div>
      </form>
    </div>
  </div>
</div>
<div class="modal fade" id="codeTemplatesModal" tabindex="-1" aria-labelledby="codeTemplatesTitle" aria-hidden="true">
  <div class="modal-dialog modal-xl modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="codeTemplatesTitle">Danh sách code mẫu</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Đóng"></button>
      </div>
      <div class="modal-body">
        <p class="text-muted small">Copy mã HTML và dán vào chế độ chỉnh sửa mã nguồn của trường Mô tả chi tiết.</p>
        <div id="codeTemplateCopyFeedback" class="d-none alert" role="status" aria-live="polite"></div>
        <div class="table-responsive">
          <table class="table table-bordered align-middle">
            <thead class="bg-light"><tr><th style="width:22%">Tên code mẫu</th><th>Code HTML</th><th style="width:100px">Thao tác</th></tr></thead>
            <tbody>
              <?php foreach(($code_templates ?? array()) as $codeTemplate): ?>
              <tr>
                <td><?php echo htmlspecialchars($codeTemplate->template_name, ENT_QUOTES, 'UTF-8'); ?></td>
                <td><textarea readonly class="form-control code-template-source" id="codeTemplateSource_<?php echo (int)$codeTemplate->id; ?>" aria-label="<?php echo htmlspecialchars('Code HTML: '.$codeTemplate->template_name, ENT_QUOTES, 'UTF-8'); ?>" spellcheck="false"><?php echo htmlspecialchars($codeTemplate->code, ENT_QUOTES, 'UTF-8'); ?></textarea></td>
                <td><button type="button" class="btn btn-outline-primary btn-sm copy-code-template" data-source="codeTemplateSource_<?php echo (int)$codeTemplate->id; ?>"><i class="fa-regular fa-copy me-1"></i>Copy</button></td>
              </tr>
              <?php endforeach; ?>
              <?php if(empty($code_templates)): ?><tr><td colspan="3" class="text-center text-muted py-4">Chưa có code mẫu.</td></tr><?php endif; ?>
            </tbody>
          </table>
        </div>
      </div>
      <div class="modal-footer"><button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button></div>
    </div>
  </div>
</div>
<script>
document.querySelectorAll('.copy-code-template').forEach(function(button) {
   button.addEventListener('click', async function() {
      const source = document.getElementById(button.dataset.source);
      const feedback = document.getElementById('codeTemplateCopyFeedback');
      let copied = false;
      try {
         if(navigator.clipboard && window.isSecureContext) {
            await navigator.clipboard.writeText(source.value);
            copied = true;
         }
      } catch(error) {}
      if(!copied) {
         source.focus(); source.select(); source.setSelectionRange(0, source.value.length);
         try { copied = document.execCommand('copy'); } catch(error) {}
      }
      feedback.className = 'alert ' + (copied ? 'alert-success' : 'alert-warning');
      feedback.textContent = copied ? 'Đã copy code HTML.' : 'Không thể copy tự động. Mã đã được chọn, hãy nhấn Ctrl+C hoặc chọn Sao chép.';
      if(copied) button.focus();
   });
});
</script>
<!-- =====================================================
     JavaScript
     ===================================================== -->
<script>
'use strict';

/* ─────────────────────────────────────────────────────
   1. CKEditor 5 Super Build – Full MS Word Toolbar
   ───────────────────────────────────────────────────── */
let editorInstance;
let editorLoading = true;
function showEditorNotice(message) {
   var notice = document.getElementById('editorNotice');
   notice.textContent = message;
   notice.classList.remove('d-none');
}
class StaticPageImageUploadAdapter {
   constructor(loader) { this.loader = loader; this.controller = new AbortController(); }
   async upload() {
      const file = await this.loader.file;
      const body = new FormData();
      body.append('upload', file);
      const response = await fetch(<?php echo json_encode(XC_URL.'/api/newsimageupload'); ?>, {
         method: 'POST', body: body, credentials: 'same-origin', signal: this.controller.signal
      });
      const result = await response.json();
      if(!response.ok || !result.url) throw new Error(result.error?.message || 'Không thể tải ảnh lên.');
      return { default: result.url };
   }
   abort() { this.controller.abort(); }
}
function staticPageImageUploadPlugin(editor) {
   editor.plugins.get('FileRepository').createUploadAdapter = loader => new StaticPageImageUploadAdapter(loader);
}
document.addEventListener('DOMContentLoaded', function () {

   // Kiểm tra CKEDITOR có tồn tại
   if (typeof CKEDITOR === 'undefined' || typeof CKEDITOR.ClassicEditor === 'undefined') {
      editorLoading = false;
      showEditorNotice('Không tải được CKEditor. Vui lòng tải lại trang để dùng đầy đủ công cụ; nội dung hiện tại vẫn được giữ trong ô bên dưới.');
      return;
   }

   CKEDITOR.ClassicEditor.create(document.querySelector('#editor_content'), {
      extraPlugins: [staticPageImageUploadPlugin],
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
            'link', 'insertImage', 'blockQuote',
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
            { model: 'heading5',  view: 'h5', title: 'Tiêu đề 5', class: 'ck-heading_heading5' },
            { model: 'heading6', view: 'h6', title: 'Tiêu đề 6', class: 'ck-heading_heading6' }
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
      link: { addTargetToExternalLinks: true, defaultProtocol: 'https://' },
      placeholder: 'Nhập nội dung chi tiết trang tĩnh tại đây...',
      removePlugins: [
         'CKBox','CKFinder','EasyImage','Base64UploadAdapter',
         'ExportPdf','ExportWord','AIAssistant','OpenAIAssistant',
         'SlashCommand','Template','DocumentOutline','FormatPainter',
         'TableOfContents','PasteFromOfficeEnhanced',
         'RealTimeCollaborativeComments','RealTimeCollaborativeTrackChanges',
         'RealTimeCollaborativeRevisionHistory','PresenceList',
         'Comments','TrackChanges','TrackChangesData',
         'RevisionHistory','Pagination','WProofreader','MathType'
      ]
   }).then(function (ed) {
      editorInstance = ed;
      editorLoading = false;
   }).catch(function (err) {
      editorLoading = false;
      showEditorNotice('Không khởi tạo được CKEditor. Vui lòng tải lại trang; nội dung hiện tại vẫn được giữ trong ô nhập.');
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

// Init counters
(function(){
   $('#cTitle').text(<?php echo (!empty($page_detail)) ? mb_strlen($page_detail->page_title) : 0; ?>+' / 255');
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

   if(editorLoading){
      Swal.fire('Đang tải trình soạn thảo', 'Vui lòng chờ CKEditor khởi tạo xong.', 'info'); return;
   }
   if(editorInstance && editorInstance.plugins.get('PendingActions').hasAny){
      Swal.fire('Đang tải ảnh', 'Vui lòng chờ tải ảnh hoàn tất trước khi lưu.', 'info'); return;
   }

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
