<?php require "header.php"; ?>

<!-- Include CKEditor 5 Super Build for full MS Word-like rich text editing -->
<script src="https://cdn.ckeditor.com/ckeditor5/39.0.1/super-build/ckeditor.js"></script>

<div class="conatiner-fluid content-inner mt-n5 py-0">
   <div class="row">
      <div class="col-sm-12">
         <div class="card shadow-sm border-0">
            <div class="card-header d-flex justify-content-between align-items-center bg-white py-3">
               <div>
                  <h4 class="card-title text-primary font-weight-bold mb-1">
                     <i class="fa-solid fa-file-pen me-2"></i><?php echo ($method == 'edit') ? 'Chỉnh sửa Trang Tĩnh (CMS)' : 'Thêm mới Trang Tĩnh (CMS)'; ?>
                  </h4>
                  <p class="text-muted small mb-0">Soạn thảo nội dung landing page/trang tĩnh với đầy đủ định dạng như MS Word.</p>
               </div>
               <a href="<?php echo XC_URL; ?>/admin/staticpages" class="btn btn-outline-secondary btn-sm rounded-pill px-3">
                  <i class="fa-solid fa-arrow-left me-1"></i> Quay lại danh sách
               </a>
            </div>
            <div class="card-body">
               
               <form id="formStaticPage" enctype="multipart/form-data">
                  <input type="hidden" name="id" value="<?php echo (!empty($page_detail)) ? $page_detail->id : 0; ?>">
                  
                  <div class="row g-3 mb-4">
                     <!-- Left Column -->
                     <div class="col-lg-8">
                        <div class="card bg-light border-0 p-3 mb-3">
                           <div class="mb-3">
                              <label class="form-label fw-bold text-dark">Tên trang tĩnh <span class="text-danger">*</span></label>
                              <input type="text" name="page_title" id="page_title" class="form-control form-control-lg" placeholder="Ví dụ: Giới thiệu Bệnh viện, Cơ cấu tổ chức..." value="<?php echo (!empty($page_detail)) ? htmlspecialchars($page_detail->page_title) : ''; ?>" required>
                           </div>
                           
                           <div class="row g-3 mb-3">
                              <div class="col-md-6">
                                 <label class="form-label fw-bold text-dark">Hashtag trang</label>
                                 <input type="text" name="hashtag" class="form-control" placeholder="Ví dụ: #gioi-thieu, #so-do-to-chuc" value="<?php echo (!empty($page_detail)) ? htmlspecialchars($page_detail->hashtag) : ''; ?>">
                                 <div class="form-text">Thẻ hashtag nhận diện hoặc làm từ khóa nổi bật.</div>
                              </div>
                              <div class="col-md-6">
                                 <label class="form-label fw-bold text-dark">Link URL tùy chỉnh (Landing Page)</label>
                                 <input type="text" name="link_url" class="form-control" placeholder="Ví dụ: /trang/gioi-thieu hoặc link đầy đủ" value="<?php echo (!empty($page_detail)) ? htmlspecialchars($page_detail->link_url) : ''; ?>">
                                 <div class="form-text">Đường dẫn tùy chỉnh cho trang tĩnh ngoài Frontend.</div>
                              </div>
                           </div>

                           <div class="mb-3">
                              <label class="form-label fw-bold text-dark">Mô tả ngắn (Summary)</label>
                              <textarea name="page_summary" class="form-control" rows="3" placeholder="Tóm tắt ngắn gọn nội dung trang tĩnh..."><?php echo (!empty($page_detail)) ? htmlspecialchars($page_detail->page_summary) : ''; ?></textarea>
                           </div>
                        </div>

                        <!-- CKEditor 5 Detailed Content -->
                        <div class="mb-3">
                           <label class="form-label fw-bold text-dark d-flex justify-content-between align-items-center">
                              <span>Nội dung chi tiết (CKEditor 5 - Full MS Word Features) <span class="text-danger">*</span></span>
                              <span class="badge bg-soft-info text-info"><i class="fa-solid fa-wand-magic-sparkles me-1"></i>Trình soạn thảo cao cấp</span>
                           </label>
                           <textarea name="page_content" id="editor_content"><?php echo (!empty($page_detail)) ? $page_detail->page_content : ''; ?></textarea>
                        </div>
                     </div>

                     <!-- Right Column (Sidebar Settings & SEO) -->
                     <div class="col-lg-4">
                        <div class="card border p-3 mb-3">
                           <h5 class="fw-bold text-primary mb-3"><i class="fa-solid fa-sliders me-2"></i>Thiết lập trang</h5>
                           
                           <div class="mb-3">
                              <label class="form-label fw-bold text-dark">Danh mục trang tĩnh</label>
                              <select name="category_id" class="form-select">
                                 <option value="0">-- Chưa chọn danh mục --</option>
                                 <?php if(!empty($categories)): foreach($categories as $cat): ?>
                                    <option value="<?php echo $cat->id; ?>" <?php echo (!empty($page_detail) && $page_detail->category_id == $cat->id) ? 'selected' : ''; ?>>
                                       <?php echo htmlspecialchars($cat->category_name); ?>
                                    </option>
                                 <?php endforeach; endif; ?>
                              </select>
                           </div>

                           <div class="mb-3">
                              <label class="form-label fw-bold text-dark">URL Slug (Đường dẫn tĩnh)</label>
                              <input type="text" name="page_slug" id="page_slug" class="form-control font-monospace" placeholder="Tự động tạo từ tên trang..." value="<?php echo (!empty($page_detail)) ? htmlspecialchars($page_detail->page_slug) : ''; ?>">
                           </div>

                           <div class="mb-3">
                              <label class="form-label fw-bold text-dark">Trạng thái hiển thị</label>
                              <select name="page_status" class="form-select">
                                 <option value="1" <?php echo (empty($page_detail) || $page_detail->page_status == 1) ? 'selected' : ''; ?>>Hiển thị (Active)</option>
                                 <option value="0" <?php echo (!empty($page_detail) && $page_detail->page_status == 0) ? 'selected' : ''; ?>>Ẩn (Hidden)</option>
                              </select>
                           </div>

                           <div class="mb-3">
                              <label class="form-label fw-bold text-dark">Thứ tự sắp xếp</label>
                              <input type="number" name="sort_order" class="form-control" value="<?php echo (!empty($page_detail)) ? (int)$page_detail->sort_order : 0; ?>">
                           </div>

                           <div class="mb-3">
                              <label class="form-label fw-bold text-dark">Ảnh Banner / Minh họa</label>
                              <input type="file" name="banner_image" class="form-control" accept="image/*">
                              <?php if(!empty($page_detail->banner_image)): ?>
                                 <div class="mt-2 text-center border rounded p-2 bg-light">
                                    <img src="<?php echo XC_URL . '/' . $page_detail->banner_image; ?>" alt="Banner Preview" class="img-fluid rounded" style="max-height: 120px;">
                                    <div class="small text-muted mt-1">Ảnh hiện tại</div>
                                 </div>
                              <?php endif; ?>
                           </div>
                        </div>

                        <!-- SEO Metadata Accordion / Card -->
                        <div class="card border p-3">
                           <h5 class="fw-bold text-primary mb-3"><i class="fa-solid fa-magnifying-glass-chart me-2"></i>Tối ưu SEO</h5>
                           <div class="mb-3">
                              <label class="form-label fw-bold text-dark">SEO Meta Title</label>
                              <input type="text" name="meta_title" class="form-control" placeholder="Tiêu đề hiển thị trên Google..." value="<?php echo (!empty($page_detail)) ? htmlspecialchars($page_detail->meta_title) : ''; ?>">
                           </div>
                           <div class="mb-3">
                              <label class="form-label fw-bold text-dark">SEO Keywords</label>
                              <input type="text" name="meta_keywords" class="form-control" placeholder="Từ khóa phân cách bằng dấu phẩy..." value="<?php echo (!empty($page_detail)) ? htmlspecialchars($page_detail->meta_keywords) : ''; ?>">
                           </div>
                           <div class="mb-3">
                              <label class="form-label fw-bold text-dark">SEO Meta Description</label>
                              <textarea name="meta_description" class="form-control" rows="3" placeholder="Mô tả chuẩn SEO..."><?php echo (!empty($page_detail)) ? htmlspecialchars($page_detail->meta_description) : ''; ?></textarea>
                           </div>
                        </div>

                     </div>
                  </div>

                  <!-- Submit Action Buttons -->
                  <div class="border-top pt-3 d-flex justify-content-end gap-2">
                     <a href="<?php echo XC_URL; ?>/admin/staticpages" class="btn btn-secondary px-4">Hủy bỏ</a>
                     <button type="submit" id="btnSubmitPage" class="btn btn-primary px-4 shadow-sm">
                        <i class="fa-solid fa-floppy-disk me-1"></i> <?php echo ($method == 'edit') ? 'Lưu cập nhật' : 'Đăng trang tĩnh'; ?>
                     </button>
                  </div>
               </form>

            </div>
         </div>
      </div>
   </div>
</div>

<script>
let editorInstance;

// Initialize CKEditor 5 Super Build with full Word-like capabilities
CKEDITOR.ClassicEditor.create(document.querySelector('#editor_content'), {
   toolbar: {
      items: [
         'exportPDF','exportWord', '|',
         'findAndReplace', 'selectAll', '|',
         'heading', '|',
         'bold', 'italic', 'strikethrough', 'underline', 'code', 'subscript', 'superscript', 'removeFormat', '|',
         'bulletedList', 'numberedList', 'todoList', '|',
         'outdent', 'indent', '|',
         'undo', 'redo', '|',
         'fontSize', 'fontFamily', 'fontColor', 'fontBackgroundColor', 'highlight', '|',
         'alignment', '|',
         'link', 'insertImage', 'blockQuote', 'insertTable', 'mediaEmbed', 'codeBlock', 'htmlEmbed', '|',
         'specialCharacters', 'horizontalLine', 'pageBreak', '|',
         'sourceEditing', 'fullScreen'
      ],
      shouldNotGroupWhenFull: true
   },
   list: {
      properties: {
         styles: true,
         startIndex: true,
         reversed: true
      }
   },
   heading: {
      options: [
         { model: 'paragraph', title: 'Paragraph', class: 'ck-heading_paragraph' },
         { model: 'heading1', view: 'h1', title: 'Heading 1', class: 'ck-heading_heading1' },
         { model: 'heading2', view: 'h2', title: 'Heading 2', class: 'ck-heading_heading2' },
         { model: 'heading3', view: 'h3', title: 'Heading 3', class: 'ck-heading_heading3' },
         { model: 'heading4', view: 'h4', title: 'Heading 4', class: 'ck-heading_heading4' }
      ]
   },
   placeholder: 'Nhập nội dung chi tiết trang tĩnh tại đây (hỗ trợ chèn bảng, định dạng chữ, hình ảnh, trích dẫn)...',
   fontFamily: {
      options: [
         'default',
         'Be Vietnam Pro, sans-serif',
         'Arial, Helvetica, sans-serif',
         'Courier New, Courier, monospace',
         'Georgia, serif',
         'Lucida Sans Unicode, Lucida Grande, sans-serif',
         'Tahoma, Geneva, sans-serif',
         'Times New Roman, Times, serif',
         'Trebuchet MS, Helvetica, sans-serif',
         'Verdana, Geneva, sans-serif'
      ],
      supportAllValues: true
   },
   fontSize: {
      options: [ 10, 12, 14, 'default', 18, 20, 22, 24, 28, 32, 36 ],
      supportAllValues: true
   },
   htmlSupport: {
      allow: [
         {
            name: /.*/,
            attributes: true,
            classes: true,
            styles: true
         }
      ]
   },
   removePlugins: [
      'CKBox',
      'CKFinder',
      'EasyImage',
      'RealTimeCollaborativeComments',
      'RealTimeCollaborativeTrackChanges',
      'RealTimeCollaborativeRevisionHistory',
      'PresenceList',
      'Comments',
      'TrackChanges',
      'TrackChangesData',
      'RevisionHistory',
      'Pagination',
      'WProofreader',
      'MathType'
   ]
}).then(editor => {
   editorInstance = editor;
}).catch(error => {
   console.error(error);
});

// Auto slug generator from title
$('#page_title').on('input', function() {
   let title = $(this).val();
   let slug = title.toLowerCase()
      .normalize('NFD').replace(/[\u0300-\u066f]/g, '')
      .replace(/[đĐ]/g, 'd')
      .replace(/[^a-z0-9\s-]/g, '')
      .trim()
      .replace(/\s+/g, '-');
   $('#page_slug').val(slug);
});

// AJAX Form Submit
$('#formStaticPage').on('submit', function(e) {
   e.preventDefault();
   
   if (editorInstance) {
      $('#editor_content').val(editorInstance.getData());
   }

   let formData = new FormData(this);
   $('#btnSubmitPage').prop('disabled', true).html('<i class="fa-solid fa-spinner fa-spin me-1"></i> Đang lưu...');

   $.ajax({
      url: '<?php echo XC_URL; ?>/api/staticpages',
      type: 'POST',
      data: formData,
      contentType: false,
      processData: false,
      dataType: 'json',
      success: function(res) {
         $('#btnSubmitPage').prop('disabled', false).html('<i class="fa-solid fa-floppy-disk me-1"></i> Lưu trang tĩnh');
         if (res.status == 200) {
            Swal.fire('Thành công', res.message, 'success').then(() => {
               window.location.href = res.returnUrl || '<?php echo XC_URL; ?>/admin/staticpages';
            });
         } else {
            Swal.fire('Lỗi', res.message, 'error');
         }
      },
      error: function() {
         $('#btnSubmitPage').prop('disabled', false).html('<i class="fa-solid fa-floppy-disk me-1"></i> Lưu trang tĩnh');
         Swal.fire('Lỗi', 'Không thể kết nối đến server. Vui lòng thử lại!', 'error');
      }
   });
});
</script>

<?php require "footer.php"; ?>
