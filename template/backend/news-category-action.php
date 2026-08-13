<?php require "header.php"; ?>

<div class="conatiner-fluid content-inner mt-n5 py-0">
   <div class="row">
      <div class="col-sm-12">
         <div class="card shadow-sm border-0">
            <div class="card-header d-flex justify-content-between align-items-center bg-white py-3">
               <div>
                  <h4 class="card-title text-primary font-weight-bold mb-1">
                     <i class="fa-solid fa-folder-open me-2"></i>Chỉnh sửa danh mục
                  </h4>
                  <p class="text-muted small mb-0">Cập nhật thông tin phân loại chuyên mục tin tức/sự kiện.</p>
               </div>
               <a href="<?php echo XC_URL; ?>/admin/news-categories" class="btn btn-outline-secondary btn-sm rounded-pill px-3">
                  <i class="fa-solid fa-arrow-left me-1"></i> Quay lại danh sách
               </a>
            </div>
            <div class="card-body">
               
               <form id="formNewsCategoryAction" class="row g-3" style="max-width: 600px;">
                  <input type="hidden" name="id" value="<?php echo (!empty($category)) ? $category->id : 0; ?>">
                  
                  <div class="col-12">
                     <label class="form-label fw-bold text-dark">Tên danh mục chuyên mục <span class="text-danger">*</span></label>
                     <input type="text" name="name" class="form-control" placeholder="Ví dụ: Tin tức hoạt động..." value="<?php echo (!empty($category)) ? htmlspecialchars($category->name) : ''; ?>" required>
                  </div>

                  <div class="col-12">
                     <label class="form-label fw-bold text-dark">Mã định danh (Slug - Không cho phép sửa)</label>
                     <input type="text" class="form-control bg-light" value="<?php echo (!empty($category)) ? htmlspecialchars($category->code) : ''; ?>" readonly>
                     <div class="form-text">Mã định danh được sử dụng làm URL phân loại và không nên chỉnh sửa để đảm bảo SEO.</div>
                  </div>

                  <div class="col-md-6">
                     <label class="form-label fw-bold text-dark">Icon Class (FontAwesome)</label>
                     <input type="text" name="icon" class="form-control" placeholder="Ví dụ: fa-solid fa-newspaper" value="<?php echo (!empty($category)) ? htmlspecialchars($category->icon) : ''; ?>">
                     <div class="form-text small">Tìm mã icon trên website FontAwesome 6.</div>
                  </div>

                  <div class="col-md-6">
                     <label class="form-label fw-bold text-dark">Thứ tự sắp xếp</label>
                     <input type="number" name="sort_order" class="form-control" value="<?php echo (!empty($category)) ? intval($category->sort_order) : 0; ?>">
                  </div>

                  <div class="col-12">
                     <label class="form-label fw-bold text-dark">Trạng thái hoạt động</label>
                     <select name="status" class="form-select">
                        <option value="1" <?php echo (!empty($category) && intval($category->status) === 1) ? 'selected' : ''; ?>>Hiển thị</option>
                        <option value="0" <?php echo (!empty($category) && intval($category->status) === 0) ? 'selected' : ''; ?>>Ẩn danh mục</option>
                     </select>
                  </div>

                  <!-- Action Buttons -->
                  <div class="col-12 d-flex gap-2 border-top pt-3 mt-4">
                     <button type="submit" id="btnSubmitCategory" class="btn btn-primary rounded-pill px-4 shadow-sm">
                        <i class="fa-solid fa-floppy-disk me-1"></i> Lưu thông tin
                     </button>
                     <a href="<?php echo XC_URL; ?>/admin/news-categories" class="btn btn-light rounded-pill px-4">Hủy bỏ</a>
                  </div>
               </form>

            </div>
         </div>
      </div>
   </div>
</div>

<script>
$('#formNewsCategoryAction').on('submit', function(e) {
   e.preventDefault();
   
   let formData = $(this).serialize();
   $('#btnSubmitCategory').prop('disabled', true).html('<i class="fa-solid fa-spinner fa-spin me-1"></i> Đang lưu...');

   $.ajax({
      url: '<?php echo XC_URL; ?>/api/savenewscategory',
      type: 'POST',
      data: formData,
      dataType: 'json',
      success: function(res) {
         $('#btnSubmitCategory').prop('disabled', false).html('<i class="fa-solid fa-floppy-disk me-1"></i> Lưu thông tin');
         if (res.status == 200) {
            Swal.fire('Thành công', res.message, 'success').then(() => {
               window.location.href = res.returnUrl || '<?php echo XC_URL; ?>/admin/news-categories';
            });
         } else {
            Swal.fire('Lỗi', res.message, 'error');
         }
      },
      error: function() {
         $('#btnSubmitCategory').prop('disabled', false).html('<i class="fa-solid fa-floppy-disk me-1"></i> Lưu thông tin');
         Swal.fire('Lỗi', 'Không thể lưu thông tin. Vui lòng thử lại!', 'error');
      }
   });
});
</script>

<?php require "footer.php"; ?>
