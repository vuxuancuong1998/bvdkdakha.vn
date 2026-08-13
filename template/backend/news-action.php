<?php require "header.php"; ?>

<!-- Include CKEditor 5 Super Build and Cropper.js -->
<script src="https://cdn.ckeditor.com/ckeditor5/39.0.1/super-build/ckeditor.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.6.1/cropper.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/cropperjs/1.6.1/cropper.min.js"></script>

<?php
$is_btv = (intval($_SESSION['user']['group']) === 5);
$is_qtv = (intval($_SESSION['user']['group']) === 1);
?>

<div class="conatiner-fluid content-inner mt-n5 py-0">
   <div class="row">
      <div class="col-sm-12">
         <div class="card shadow-sm border-0">
            <div class="card-header d-flex justify-content-between align-items-center bg-white py-3">
               <div>
                  <h4 class="card-title text-primary font-weight-bold mb-1">
                     <i class="fa-solid fa-file-pen me-2"></i><?php echo ($method == 'edit') ? 'Chỉnh sửa bài viết' : 'Thêm mới bài viết'; ?>
                  </h4>
                  <p class="text-muted small mb-0">Viết tin hoạt động, hướng dẫn sức khỏe hoặc lên kế hoạch tổ chức sự kiện - hội thảo.</p>
               </div>
               <a href="<?php echo XC_URL; ?>/admin/news" class="btn btn-outline-secondary btn-sm rounded-pill px-3">
                  <i class="fa-solid fa-arrow-left me-1"></i> Quay lại danh sách
               </a>
            </div>
            <div class="card-body">
               
               <form id="formNewsAction">
                  <input type="hidden" name="nid" value="<?php echo (!empty($new_detail)) ? $new_detail->id : 0; ?>">
                  <input type="hidden" name="method" value="<?php echo $method; ?>">
                  <input type="hidden" name="cropped_thumbnail" id="cropped_thumbnail">
                  
                  <div class="row g-3 mb-4">
                     <!-- Left Column -->
                     <div class="col-lg-8">
                        <div class="card bg-light border-0 p-3 mb-3">
                           <div class="mb-3">
                              <label class="form-label fw-bold text-dark">Tiêu đề bài viết <span class="text-danger">*</span></label>
                              <input type="text" name="title" id="news_title" class="form-control form-control-lg" placeholder="Nhập tiêu đề tin tức/sự kiện..." value="<?php echo (!empty($new_detail)) ? htmlspecialchars($new_detail->title) : ''; ?>" required>
                           </div>
                           
                           <div class="mb-3">
                              <label class="form-label fw-bold text-dark">Đường dẫn tĩnh (Slug) <span class="text-danger">*</span></label>
                              <input type="text" name="slug" id="news_slug" class="form-control" placeholder="Ví dụ: chien-dich-tiem-chung-mo-rong-2026" value="<?php echo (!empty($new_detail)) ? htmlspecialchars($new_detail->slug) : ''; ?>" required>
                              <div class="form-text">Đường dẫn thân thiện hiển thị trên URL. Tự động sinh nếu để trống.</div>
                           </div>

                           <div class="mb-3">
                              <label class="form-label fw-bold text-dark">Mô tả ngắn (Description) <span class="text-danger">*</span></label>
                              <textarea name="description" rows="3" class="form-control" placeholder="Tóm tắt ngắn gọn nội dung bài viết..." required><?php echo (!empty($new_detail)) ? htmlspecialchars($new_detail->description) : ''; ?></textarea>
                           </div>
                        </div>

                        <!-- CKEditor Container -->
                        <div class="card bg-light border-0 p-3">
                           <label class="form-label fw-bold text-dark mb-2">Nội dung chi tiết <span class="text-danger">*</span></label>
                           <textarea id="editor_content" name="content" style="display:none;"><?php echo (!empty($new_detail)) ? $new_detail->content : ''; ?></textarea>
                           <div id="editor-container" class="border rounded bg-white"></div>
                        </div>
                     </div>

                     <!-- Right Column -->
                     <div class="col-lg-4">
                        <!-- Category, Scheduling & Options -->
                        <div class="card border p-3 mb-3 bg-white shadow-xs">
                           <h5 class="h6 mb-3 border-bottom pb-2 font-weight-bold"><i class="fa-solid fa-gear text-primary"></i> Phân loại & Tùy chọn</h5>
                           
                           <div class="mb-3">
                              <label class="form-label fw-bold">Chuyên mục bài viết <span class="text-danger">*</span></label>
                              <select name="new_category" id="new_category" class="form-select" required>
                                 <option value="">-- Chọn danh mục --</option>
                                 <?php if(!empty($categories)): foreach($categories as $cat): ?>
                                    <option value="<?php echo $cat->id; ?>" <?php echo (!empty($new_detail) && intval($new_detail->new_category) === intval($cat->id)) ? 'selected' : ''; ?>>
                                       <?php echo htmlspecialchars($cat->name); ?>
                                    </option>
                                 <?php endforeach; endif; ?>
                              </select>
                           </div>

                           <!-- Dynamic Event Scheduler Form Block -->
                           <div id="eventDetailsBlock" class="p-3 mb-3 rounded bg-light border-start border-3 border-info d-none">
                              <h6 class="text-info mb-2 fw-bold"><i class="fa-solid fa-calendar-days"></i> Chi tiết Sự kiện / Hội thảo</h6>
                              <div class="mb-2">
                                 <label class="form-label small">Thời gian bắt đầu</label>
                                 <input type="datetime-local" name="event_start_at" class="form-control form-control-sm" value="<?php echo (!empty($new_detail) && !empty($new_detail->event_start_at)) ? date('Y-m-d\TH:i', strtotime($new_detail->event_start_at)) : ''; ?>">
                              </div>
                              <div class="mb-2">
                                 <label class="form-label small">Thời gian kết thúc</label>
                                 <input type="datetime-local" name="event_end_at" class="form-control form-control-sm" value="<?php echo (!empty($new_detail) && !empty($new_detail->event_end_at)) ? date('Y-m-d\TH:i', strtotime($new_detail->event_end_at)) : ''; ?>">
                              </div>
                              <div class="mb-0">
                                 <label class="form-label small">Địa điểm tổ chức</label>
                                 <input type="text" name="event_location" class="form-control form-control-sm" placeholder="Ví dụ: Hội trường tầng 3 nhà A" value="<?php echo (!empty($new_detail)) ? htmlspecialchars($new_detail->event_location ?? '') : ''; ?>">
                              </div>
                           </div>

                           <div class="mb-3">
                              <label class="form-label fw-bold">Thời gian phát hành</label>
                              <input type="datetime-local" name="published_at" class="form-control" value="<?php echo (!empty($new_detail) && !empty($new_detail->published_at)) ? date('Y-m-d\TH:i', strtotime($new_detail->published_at)) : date('Y-m-d\TH:i'); ?>">
                              <div class="form-text small">Đặt lịch phát hành trong tương lai.</div>
                           </div>

                           <div class="mb-3">
                              <label class="form-label fw-bold d-block">Trạng thái bài viết</label>
                              <select name="status" class="form-select" <?php echo $is_btv ? 'disabled' : ''; ?>>
                                 <option value="1" <?php echo (!empty($new_detail) && intval($new_detail->status) === 1) ? 'selected' : ''; ?>>Nháp</option>
                                 <option value="2" <?php echo (!empty($new_detail) && intval($new_detail->status) === 2) ? 'selected' : ''; ?>>Chờ phê duyệt</option>
                                 <?php if ($is_qtv): ?>
                                    <option value="3" <?php echo (!empty($new_detail) && intval($new_detail->status) === 3) ? 'selected' : ''; ?>>Phê duyệt</option>
                                    <option value="4" <?php echo (!empty($new_detail) && intval($new_detail->status) === 4) ? 'selected' : ''; ?>>Công khai / Phát hành</option>
                                 <?php endif; ?>
                              </select>
                              <?php if($is_btv): ?>
                                 <input type="hidden" name="status" value="<?php echo (!empty($new_detail)) ? $new_detail->status : 1; ?>">
                                 <div class="form-text small text-muted"><i class="fa-solid fa-lock"></i> Biên tập viên chỉ được lưu dưới dạng Nháp.</div>
                              <?php endif; ?>
                           </div>

                           <div class="form-check form-switch mb-0">
                              <input class="form-check-input" type="checkbox" name="is_featured" id="is_featured" value="1" <?php echo (!empty($new_detail) && intval($new_detail->is_featured) === 1) ? 'checked' : ''; ?>>
                              <label class="form-check-label fw-bold" for="is_featured">Ghim bài nổi bật</label>
                           </div>
                        </div>

                        <!-- 16:9 Image Cropper Widget -->
                        <div class="card border p-3 bg-white shadow-xs">
                           <h5 class="h6 mb-3 border-bottom pb-2 font-weight-bold"><i class="fa-solid fa-image text-primary"></i> Ảnh đại diện (16:9)</h5>
                           <div class="mb-3 text-center bg-light p-2 border rounded">
                              <img id="thumbnail_preview" 
                                   src="<?php echo (!empty($new_detail) && !empty($new_detail->thumbnail_url)) ? XC_URL . htmlspecialchars($new_detail->thumbnail_url) : '#'; ?>" 
                                   class="img-fluid border rounded <?php echo (!empty($new_detail) && !empty($new_detail->thumbnail_url)) ? '' : 'd-none'; ?>" 
                                   style="max-height: 180px; object-fit: cover;" alt="Preview" />
                              <div id="no_img_placeholder" class="<?php echo (!empty($new_detail) && !empty($new_detail->thumbnail_url)) ? 'd-none' : ''; ?> text-muted py-4">
                                 <i class="fa-regular fa-image fa-3x d-block mb-2"></i>
                                 <span>Chưa có ảnh đại diện</span>
                              </div>
                           </div>
                           <div class="mb-0">
                              <label for="thumbnail_file" class="form-label small fw-bold">Chọn ảnh mới</label>
                              <input type="file" id="thumbnail_file" class="form-control form-control-sm" accept="image/*">
                           </div>
                        </div>
                     </div>
                  </div>

                  <!-- Action Buttons -->
                  <div class="d-flex justify-content-end gap-2 border-top pt-3">
                     <a href="<?php echo XC_URL; ?>/admin/news" class="btn btn-light rounded-pill px-4">Hủy bỏ</a>
                     <button type="submit" id="btnSubmitNews" class="btn btn-primary rounded-pill px-4 shadow-sm">
                        <i class="fa-solid fa-floppy-disk me-1"></i> Lưu bài viết
                     </button>
                  </div>
               </form>

            </div>
         </div>
      </div>
   </div>
</div>

<!-- Cropper Modal -->
<div class="modal fade" id="cropperModal" tabindex="-1" aria-labelledby="cropperModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-centered">
    <div class="modal-content border-0 shadow-lg">
      <div class="modal-header bg-primary text-white">
        <h5 class="modal-title text-white" id="cropperModalLabel"><i class="fa-solid fa-crop me-2"></i>Cắt ảnh đại diện (Tỷ lệ 16:9)</h5>
        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body p-0 bg-dark text-center">
        <div class="img-container" style="max-height: 480px; overflow:hidden;">
          <img id="cropperImage" src="" style="max-width: 100%; display:block;" />
        </div>
      </div>
      <div class="modal-footer bg-light">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
        <button type="button" id="btnCropAndSave" class="btn btn-primary"><i class="fa-solid fa-circle-check me-1"></i> Xác nhận cắt</button>
      </div>
    </div>
  </div>
</div>

<script>
// Dynamic Category display block
$('#new_category').on('change', function() {
   if (parseInt($(this).val()) === 3) {
      $('#eventDetailsBlock').removeClass('d-none');
   } else {
      $('#eventDetailsBlock').addClass('d-none');
   }
});
// Trigger on page load in edit mode
if (parseInt($('#new_category').val()) === 3) {
   $('#eventDetailsBlock').removeClass('d-none');
}

// Slug helper auto generate
$('#news_title').on('keyup', function() {
   if ($('#news_slug').val() === '' || '<?php echo $method; ?>' === 'add') {
      let slug = $(this).val().toLowerCase()
         .normalize('NFD').replace(/[\u0300-\u036f]/g, '')
         .replace(/[đĐ]/g, 'd')
         .replace(/[^a-z0-9\s-]/g, '')
         .trim()
         .replace(/\s+/g, '-');
      $('#news_slug').val(slug);
   }
});

// Cropper.js logic
let cropper;
let cropperImage = document.getElementById('cropperImage');
let cropperModal = new bootstrap.Modal(document.getElementById('cropperModal'));

$('#thumbnail_file').on('change', function(e) {
   let files = e.target.files;
   if (files && files.length > 0) {
      let reader = new FileReader();
      reader.onload = function(e) {
         cropperImage.src = e.target.result;
         cropperModal.show();
      };
      reader.readAsDataURL(files[0]);
   }
});

$('#cropperModal').on('shown.bs.modal', function () {
   cropper = new Cropper(cropperImage, {
      aspectRatio: 16 / 9,
      viewMode: 1,
      autoCropArea: 1,
   });
}).on('hidden.bs.modal', function () {
   if (cropper) {
      cropper.destroy();
      cropper = null;
   }
   $('#thumbnail_file').val(''); // Reset file input
});

$('#btnCropAndSave').on('click', function() {
   let canvas = cropper.getCroppedCanvas({
      width: 800,
      height: 450
   });
   let base64data = canvas.toDataURL('image/jpeg');
   $('#cropped_thumbnail').val(base64data);
   $('#thumbnail_preview').attr('src', base64data).removeClass('d-none');
   $('#no_img_placeholder').addClass('d-none');
   cropperModal.hide();
});

// CKEditor 5 Super Build Initialization
let editorInstance;
CKEDITOR.ClassicEditor.create(document.querySelector('#editor-container'), {
   toolbar: {
      items: [
         'heading', '|',
         'bold', 'italic', 'underline', 'strikethrough', 'subscript', 'superscript', 'removeFormat', '|',
         'bulletedList', 'numberedList', 'todoList', '|',
         'outdent', 'indent', 'alignment', '|',
         'fontSize', 'fontColor', 'fontBackgroundColor', 'highlight', '|',
         'link', 'uploadImage', 'insertTable', 'mediaEmbed', 'blockQuote', 'codeBlock', 'htmlEmbed', '|',
         'undo', 'redo'
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
         { model: 'heading3', view: 'h3', title: 'Heading 3', class: 'ck-heading_heading3' }
      ]
   },
   fontSize: {
      options: [ 10, 12, 14, 'default', 18, 20, 22 ],
      supportAllValues: true
   },
   ckfinder: {
      uploadUrl: '<?php echo XC_URL; ?>/api/newsimageupload'
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
   placeholder: 'Viết nội dung bài viết ở đây...',
   initialData: document.querySelector('#editor_content').value
}).then(editor => {
   editorInstance = editor;
}).catch(error => {
   console.error(error);
});

// Submit Form
$('#formNewsAction').on('submit', function(e) {
   e.preventDefault();
   
   if (editorInstance) {
      $('#editor_content').val(editorInstance.getData());
   }
   
   if ($('#editor_content').val().trim() === '') {
      Swal.fire('Lỗi', 'Vui lòng nhập nội dung chi tiết bài viết!', 'warning');
      return;
   }

   let formData = new FormData(this);
   
   $('#btnSubmitNews').prop('disabled', true).html('<i class="fa-solid fa-spinner fa-spin me-1"></i> Đang lưu...');

   $.ajax({
      url: '<?php echo XC_URL; ?>/api/news',
      type: 'POST',
      data: formData,
      contentType: false,
      processData: false,
      dataType: 'json',
      success: function(res) {
         $('#btnSubmitNews').prop('disabled', false).html('<i class="fa-solid fa-floppy-disk me-1"></i> Lưu bài viết');
         if (res.status == 200) {
            Swal.fire('Thành công', res.message, 'success').then(() => {
               window.location.href = res.returnUrl || '<?php echo XC_URL; ?>/admin/news';
            });
         } else {
            Swal.fire('Lỗi', res.message, 'error');
         }
      },
      error: function() {
         $('#btnSubmitNews').prop('disabled', false).html('<i class="fa-solid fa-floppy-disk me-1"></i> Lưu bài viết');
         Swal.fire('Lỗi', 'Không thể kết nối đến server. Vui lòng thử lại!', 'error');
      }
   });
});
</script>

<?php require "footer.php"; ?>
