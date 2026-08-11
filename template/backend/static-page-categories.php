<?php require "header.php"; ?>

<div class="conatiner-fluid content-inner mt-n5 py-0">
   <div class="row">
      <div class="col-sm-12">
         <div class="card shadow-sm border-0">
            <div class="card-header d-flex justify-content-between align-items-center bg-white py-3">
               <div>
                  <h4 class="card-title text-primary font-weight-bold mb-1">
                     <i class="fa-solid fa-folder-tree me-2"></i>Danh mục Trang tĩnh
                  </h4>
                  <p class="text-muted small mb-0">Quản lý phân loại danh mục cho các trang tĩnh (Giới thiệu, Sơ đồ tổ chức, Hướng dẫn...)</p>
               </div>
               <button type="button" onclick="openCatModal(0, '', '', '', 1)" class="btn btn-primary btn-sm rounded-pill px-3 shadow-sm">
                  <i class="fa-solid fa-plus me-1"></i> Thêm danh mục mới
               </button>
            </div>
            <div class="card-body">
               
               <div class="table-responsive">
                  <table class="table table-hover align-middle border text-nowrap">
                     <thead class="bg-light text-dark fw-bold">
                        <tr>
                           <th width="50" class="text-center">#</th>
                           <th>Tên danh mục</th>
                           <th>Slug URL</th>
                           <th>Mô tả</th>
                           <th class="text-center">Số trang tĩnh</th>
                           <th class="text-center">Trạng thái</th>
                           <th class="text-center" width="120">Thao tác</th>
                        </tr>
                     </thead>
                     <tbody>
                        <?php if(!empty($categories)): ?>
                           <?php $stt = 1; foreach($categories as $cat): ?>
                              <tr>
                                 <td class="text-center fw-bold text-muted"><?php echo $stt++; ?></td>
                                 <td>
                                    <strong class="text-dark"><?php echo htmlspecialchars($cat->category_name); ?></strong>
                                 </td>
                                 <td>
                                    <code class="text-primary"><?php echo htmlspecialchars($cat->category_slug); ?></code>
                                 </td>
                                 <td>
                                    <span class="text-muted small"><?php echo !empty($cat->category_description) ? htmlspecialchars($cat->category_description) : '---'; ?></span>
                                 </td>
                                 <td class="text-center">
                                    <span class="badge bg-soft-info text-info rounded-pill px-2 py-1">
                                       <?php echo (int)$cat->total_pages; ?> trang
                                    </span>
                                 </td>
                                 <td class="text-center">
                                    <?php if($cat->category_status == 1): ?>
                                       <span class="badge bg-success rounded-pill px-2 py-1">Hoạt động</span>
                                    <?php else: ?>
                                       <span class="badge bg-secondary rounded-pill px-2 py-1">Tạm ẩn</span>
                                    <?php endif; ?>
                                 </td>
                                 <td class="text-center">
                                    <div class="d-flex align-items-center justify-content-center gap-1">
                                       <button type="button" onclick="openCatModal(<?php echo $cat->id; ?>, '<?php echo addslashes(htmlspecialchars($cat->category_name)); ?>', '<?php echo addslashes(htmlspecialchars($cat->category_slug)); ?>', '<?php echo addslashes(htmlspecialchars($cat->category_description)); ?>', <?php echo $cat->category_status; ?>)" class="btn btn-sm btn-icon btn-soft-warning" title="Chỉnh sửa">
                                          <i class="fa-solid fa-pen-to-square"></i>
                                       </button>
                                       <button type="button" onclick="deleteCategory(<?php echo $cat->id; ?>, '<?php echo addslashes(htmlspecialchars($cat->category_name)); ?>')" class="btn btn-sm btn-icon btn-soft-danger" title="Xóa danh mục">
                                          <i class="fa-solid fa-trash-can"></i>
                                       </button>
                                    </div>
                                 </td>
                              </tr>
                           <?php endforeach; ?>
                        <?php else: ?>
                           <tr>
                              <td colspan="7" class="text-center py-5 text-muted">
                                 <i class="fa-solid fa-folder-open fa-3x mb-3 text-secondary"></i>
                                 <p class="mb-0">Chưa có danh mục trang tĩnh nào. Nhấn <strong>"Thêm danh mục mới"</strong> để tạo!</p>
                              </td>
                           </tr>
                        <?php endif; ?>
                     </tbody>
                  </table>
               </div>

            </div>
         </div>
      </div>
   </div>
</div>

<!-- Modal Add/Edit Category -->
<div class="modal fade" id="modalCategory" tabindex="-1" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <form id="formCategory">
            <div class="modal-header bg-primary text-white">
               <h5 class="modal-title text-white font-weight-bold" id="catModalTitle">Thêm danh mục trang tĩnh</h5>
               <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
               <input type="hidden" name="id" id="cat_id" value="0">
               
               <div class="mb-3">
                  <label class="form-label fw-bold">Tên danh mục <span class="text-danger">*</span></label>
                  <input type="text" name="category_name" id="cat_name" class="form-control" placeholder="Ví dụ: Giới thiệu, Tổ chức - Bộ máy..." required>
               </div>

               <div class="mb-3">
                  <label class="form-label fw-bold">Slug URL</label>
                  <input type="text" name="category_slug" id="cat_slug" class="form-control font-monospace" placeholder="Tự động tạo từ tên danh mục...">
               </div>

               <div class="mb-3">
                  <label class="form-label fw-bold">Mô tả danh mục</label>
                  <textarea name="category_description" id="cat_desc" class="form-control" rows="3" placeholder="Mô tả ngắn về danh mục này..."></textarea>
               </div>

               <div class="mb-3">
                  <label class="form-label fw-bold">Trạng thái</label>
                  <select name="category_status" id="cat_status" class="form-select">
                     <option value="1">Hoạt động (Active)</option>
                     <option value="0">Tạm ẩn (Hidden)</option>
                  </select>
               </div>
            </div>
            <div class="modal-footer">
               <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
               <button type="submit" id="btnSubmitCat" class="btn btn-primary px-4"><i class="fa-solid fa-floppy-disk me-1"></i> Lưu danh mục</button>
            </div>
         </form>
      </div>
   </div>
</div>

<script>
function openCatModal(id, name, slug, desc, status) {
   $('#cat_id').val(id);
   $('#cat_name').val(name);
   $('#cat_slug').val(slug);
   $('#cat_desc').val(desc);
   $('#cat_status').val(status);

   if(id > 0) {
      $('#catModalTitle').text('Chỉnh sửa danh mục trang tĩnh');
   } else {
      $('#catModalTitle').text('Thêm danh mục trang tĩnh mới');
   }

   $('#modalCategory').modal('show');
}

$('#cat_name').on('input', function() {
   if($('#cat_id').val() == 0) {
      let title = $(this).val();
      let slug = title.toLowerCase()
         .normalize('NFD').replace(/[\u0300-\u066f]/g, '')
         .replace(/[đĐ]/g, 'd')
         .replace(/[^a-z0-9\s-]/g, '')
         .trim()
         .replace(/\s+/g, '-');
      $('#cat_slug').val(slug);
   }
});

$('#formCategory').on('submit', function(e) {
   e.preventDefault();
   $('#btnSubmitCat').prop('disabled', true).html('<i class="fa-solid fa-spinner fa-spin me-1"></i> Đang lưu...');

   $.ajax({
      url: '<?php echo XC_URL; ?>/api/staticpagecategories',
      type: 'POST',
      data: $(this).serialize(),
      dataType: 'json',
      success: function(res) {
         $('#btnSubmitCat').prop('disabled', false).html('<i class="fa-solid fa-floppy-disk me-1"></i> Lưu danh mục');
         if(res.status == 200) {
            Swal.fire('Thành công', res.message, 'success').then(() => {
               location.reload();
            });
         } else {
            Swal.fire('Lỗi', res.message, 'error');
         }
      },
      error: function() {
         $('#btnSubmitCat').prop('disabled', false).html('<i class="fa-solid fa-floppy-disk me-1"></i> Lưu danh mục');
         Swal.fire('Lỗi', 'Không thể kết nối tới máy chủ', 'error');
      }
   });
});

function deleteCategory(id, name) {
   Swal.fire({
      title: 'Xác nhận xóa?',
      html: `Bạn có chắc muốn xóa danh mục <strong>"${name}"</strong>?`,
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#d33',
      confirmButtonText: 'Có, xóa ngay!',
      cancelButtonText: 'Hủy'
   }).then((result) => {
      if (result.isConfirmed) {
         window.location.href = '<?php echo XC_URL; ?>/admin/staticpagecategories/delete/' + id;
      }
   });
}
</script>

<?php require "footer.php"; ?>
