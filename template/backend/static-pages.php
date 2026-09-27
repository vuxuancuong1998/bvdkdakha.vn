<?php $active_menu = 'staticpages'; require "header.php"; ?>

<div class="conatiner-fluid content-inner mt-n5 py-0">
   <div class="row">
      <div class="col-sm-12">
         <div class="card shadow-sm border-0">
            <div class="card-header d-flex justify-content-between align-items-center flex-wrap gap-3 bg-white py-3">
               <div>
                  <h4 class="card-title text-primary font-weight-bold mb-1">
                     <i class="fa-solid fa-file-lines me-2"></i>Quản lý Trang tĩnh (CMS Landing Pages)
                  </h4>
                  <p class="text-muted small mb-0">Tạo và quản lý các trang tĩnh như Giới thiệu, Cơ cấu tổ chức, Quy trình...</p>
               </div>
               <div>
                  <a href="<?php echo XC_URL; ?>/admin/staticpages/add" class="btn btn-primary btn-sm rounded-pill px-3 shadow-sm">
                     <i class="fa-solid fa-plus me-1"></i> Thêm trang tĩnh mới
                  </a>
               </div>
            </div>
            <div class="card-body">
               
               <!-- Filter & Search Bar -->
               <form method="GET" action="<?php echo XC_URL; ?>/admin/staticpages" class="row g-3 mb-4 align-items-center">
                  <div class="col-md-5">
                     <div class="input-group">
                        <span class="input-group-text bg-light border-end-0"><i class="fa-solid fa-magnifying-glass text-muted"></i></span>
                        <input type="text" name="q" class="form-control border-start-0" placeholder="Tìm kiếm tên trang, hashtag hoặc slug..." value="<?php echo htmlspecialchars($search); ?>">
                     </div>
                  </div>
                  <div class="col-md-4">
                     <select name="cat" class="form-select">
                        <option value="0">-- Tất cả danh mục trang --</option>
                        <?php if(!empty($categories)): foreach($categories as $cat): ?>
                           <option value="<?php echo $cat->id; ?>" <?php echo ($cat_filter == $cat->id) ? 'selected' : ''; ?>>
                              <?php echo htmlspecialchars($cat->category_name); ?>
                           </option>
                        <?php endforeach; endif; ?>
                     </select>
                  </div>
                  <div class="col-md-3 d-flex gap-2">
                     <button type="submit" class="btn btn-primary btn-sm px-3"><i class="fa-solid fa-filter me-1"></i> Lọc</button>
                     <?php if(!empty($search) || $cat_filter > 0): ?>
                        <a href="<?php echo XC_URL; ?>/admin/staticpages" class="btn btn-outline-secondary btn-sm px-3"><i class="fa-solid fa-rotate-left me-1"></i> Xóa lọc</a>
                     <?php endif; ?>
                  </div>
               </form>

               <!-- Data Table -->
               <div class="table-responsive">
                  <table class="table table-hover align-middle border text-nowrap">
                     <thead class="bg-light text-dark fw-bold">
                        <tr>
                           <th width="50" class="text-center">#</th>
                           <th>Tên trang tĩnh</th>
                           <th>Hashtag / Slug</th>
                           <th>Danh mục</th>
                           <th>Link URL</th>
                           <th class="text-center">Trạng thái</th>
                           <th class="text-center" width="160">Thao tác</th>
                        </tr>
                     </thead>
                     <tbody>
                        <?php if(!empty($pages)): ?>
                           <?php $stt = ($page - 1) * $per_page + 1; foreach($pages as $item): ?>
                              <tr>
                                 <td class="text-center fw-bold text-muted"><?php echo $stt++; ?></td>
                                 <td>
                                    <div class="d-flex align-items-center gap-2">
                                       <?php if(!empty($item->banner_image)): ?>
                                          <img src="<?php echo XC_URL . '/' . $item->banner_image; ?>" alt="Banner" class="rounded border" style="width: 45px; height: 45px; object-fit: cover;">
                                       <?php else: ?>
                                          <div class="rounded bg-soft-primary d-flex align-items-center justify-content-center text-primary fw-bold" style="width: 45px; height: 45px; font-size: 18px;">
                                             <i class="fa-solid fa-file-lines"></i>
                                          </div>
                                       <?php endif; ?>
                                       <div>
                                          <a href="<?php echo XC_URL; ?>/admin/staticpages/edit/<?php echo $item->id; ?>" class="fw-bold text-dark text-decoration-none">
                                             <?php echo htmlspecialchars($item->page_title); ?>
                                          </a>
                                          <div class="small text-muted">Tạo lúc: <?php echo date('H:i d/m/Y', strtotime($item->created_at)); ?></div>
                                       </div>
                                    </div>
                                 </td>
                                 <td>
                                    <?php if(!empty($item->hashtag)): ?>
                                       <span class="badge bg-soft-info text-info rounded-pill px-2 py-1"><?php echo htmlspecialchars($item->hashtag); ?></span>
                                    <?php endif; ?>
                                    <div class="small text-muted font-monospace"><?php echo htmlspecialchars($item->page_slug); ?></div>
                                 </td>
                                 <td>
                                    <span class="badge bg-soft-primary text-primary px-2 py-1">
                                       <?php echo !empty($item->category_name) ? htmlspecialchars($item->category_name) : 'Chưa phân loại'; ?>
                                    </span>
                                 </td>
                                 <td>
                                    <?php if(!empty($item->link_url)): ?>
                                       <a href="<?php echo (strpos($item->link_url, 'http') === 0) ? $item->link_url : XC_URL . $item->link_url; ?>" target="_blank" class="small text-primary text-decoration-none">
                                          <i class="fa-solid fa-link me-1"></i><?php echo htmlspecialchars($item->link_url); ?>
                                       </a>
                                    <?php else: ?>
                                       <a href="<?php echo XC_URL; ?>/trang/<?php echo $item->page_slug; ?>" target="_blank" class="small text-primary text-decoration-none">
                                          <i class="fa-solid fa-arrow-up-right-from-square me-1"></i>/trang/<?php echo $item->page_slug; ?>
                                       </a>
                                    <?php endif; ?>
                                 </td>
                                 <td class="text-center">
                                    <?php if($item->page_status == 1): ?>
                                       <span class="badge bg-success rounded-pill px-2 py-1"><i class="fa-solid fa-eye me-1"></i>Hiển thị</span>
                                    <?php else: ?>
                                       <span class="badge bg-secondary rounded-pill px-2 py-1"><i class="fa-solid fa-eye-slash me-1"></i>Ẩn</span>
                                    <?php endif; ?>
                                 </td>
                                 <td class="text-center">
                                    <div class="d-flex align-items-center justify-content-center gap-1">
                                       <a href="<?php echo XC_URL; ?>/trang/<?php echo $item->page_slug; ?>" target="_blank" class="btn btn-sm btn-icon btn-soft-info" title="Xem ngoài Frontend">
                                          <i class="fa-solid fa-globe"></i>
                                       </a>
                                       <a href="<?php echo XC_URL; ?>/admin/staticpages/edit/<?php echo $item->id; ?>" class="btn btn-sm btn-icon btn-soft-warning" title="Chỉnh sửa nội dung">
                                          <i class="fa-solid fa-pen-to-square"></i>
                                       </a>
                                       <button type="button" onclick="deleteStaticPage(<?php echo $item->id; ?>, '<?php echo addslashes(htmlspecialchars($item->page_title)); ?>')" class="btn btn-sm btn-icon btn-soft-danger" title="Xóa trang">
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
                                 <p class="mb-0">Chưa có trang tĩnh nào. Hãy nhấn <strong>"Thêm trang tĩnh mới"</strong> để bắt đầu!</p>
                              </td>
                           </tr>
                        <?php endif; ?>
                     </tbody>
                  </table>
               </div>

               <!-- Pagination -->
               <?php if($total_pages > 1): ?>
                  <div class="d-flex justify-content-between align-items-center mt-3 flex-wrap gap-2">
                     <div class="small text-muted">Hiển thị <?php echo count($pages); ?> / tổng số <?php echo $total_items; ?> trang tĩnh</div>
                     <nav>
                        <ul class="pagination pagination-sm mb-0">
                           <li class="page-item <?php echo ($page <= 1) ? 'disabled' : ''; ?>">
                              <a class="page-link" href="<?php echo XC_URL; ?>/admin/staticpages?page=<?php echo ($page-1); ?>&q=<?php echo urlencode($search); ?>&cat=<?php echo $cat_filter; ?>">Trước</a>
                           </li>
                           <?php for($i = 1; $i <= $total_pages; $i++): ?>
                              <li class="page-item <?php echo ($page == $i) ? 'active' : ''; ?>">
                                 <a class="page-link" href="<?php echo XC_URL; ?>/admin/staticpages?page=<?php echo $i; ?>&q=<?php echo urlencode($search); ?>&cat=<?php echo $cat_filter; ?>"><?php echo $i; ?></a>
                              </li>
                           <?php endfor; ?>
                           <li class="page-item <?php echo ($page >= $total_pages) ? 'disabled' : ''; ?>">
                              <a class="page-link" href="<?php echo XC_URL; ?>/admin/staticpages?page=<?php echo ($page+1); ?>&q=<?php echo urlencode($search); ?>&cat=<?php echo $cat_filter; ?>">Sau</a>
                           </li>
                        </ul>
                     </nav>
                  </div>
               <?php endif; ?>

            </div>
         </div>
      </div>
   </div>
</div>

<script>
function deleteStaticPage(id, title) {
   Swal.fire({
      title: 'Xác nhận xóa?',
      html: `Bạn có chắc chắn muốn xóa trang tĩnh <strong>"${title}"</strong> không?`,
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#d33',
      cancelButtonColor: '#6c757d',
      confirmButtonText: 'Có, xóa ngay!',
      cancelButtonText: 'Hủy'
   }).then((result) => {
      if (result.isConfirmed) {
         $.ajax({
            url: '<?php echo XC_URL; ?>/api/deletestaticpage',
            type: 'POST',
            data: { id: id },
            dataType: 'json',
            success: function(res) {
               if (res.status == 200) {
                  Swal.fire('Thành công', res.message, 'success').then(() => {
                     location.reload();
                  });
               } else {
                  Swal.fire('Lỗi', res.message, 'error');
               }
            },
            error: function() {
               Swal.fire('Lỗi', 'Không thể gửi yêu cầu tới server', 'error');
            }
         });
      }
   });
}
</script>

<?php require "footer.php"; ?>
