<?php require "header.php"; ?>

<div class="conatiner-fluid content-inner mt-n5 py-0">
   <div class="row">
      <div class="col-sm-12">
         <div class="card shadow-sm border-0">
            <div class="card-header d-flex justify-content-between align-items-center bg-white py-3">
               <div>
                  <h4 class="card-title text-primary font-weight-bold mb-1">
                     <i class="fa-solid fa-folder-tree me-2"></i>Quản lý Danh mục Tin tức
                  </h4>
                  <p class="text-muted small mb-0">Cấu hình các chuyên mục phân loại tin tức & sự kiện trên website.</p>
               </div>
            </div>
            <div class="card-body">
               
               <div class="table-responsive">
                  <table class="table table-hover align-middle border text-nowrap">
                     <thead class="bg-light text-dark fw-bold">
                        <tr>
                           <th width="60" class="text-center">ID</th>
                           <th width="60" class="text-center">Icon</th>
                           <th>Tên chuyên mục</th>
                           <th>Mã định danh (Slug)</th>
                           <th width="120" class="text-center">Thứ tự sắp xếp</th>
                           <th width="120" class="text-center">Trạng thái hiển thị</th>
                           <th width="100" class="text-center">Thao tác</th>
                        </tr>
                     </thead>
                     <tbody>
                        <?php if(!empty($categories) && is_array($categories)): foreach($categories as $cat): ?>
                           <tr>
                              <td class="text-center font-weight-bold text-muted"><?php echo $cat->id; ?></td>
                              <td class="text-center">
                                 <div class="bg-light text-primary rounded p-2 d-inline-block" style="width: 38px; height: 38px;">
                                    <i class="<?php echo htmlspecialchars($cat->icon ?? 'fa-solid fa-folder'); ?> fa-lg"></i>
                                 </div>
                              </td>
                              <td class="fw-bold text-dark"><?php echo htmlspecialchars($cat->name); ?></td>
                              <td><code class="small text-danger bg-light px-2 py-1 rounded"><?php echo htmlspecialchars($cat->code); ?></code></td>
                              <td class="text-center">
                                 <span class="badge bg-light text-dark border"><?php echo intval($cat->sort_order); ?></span>
                              </td>
                              <td class="text-center">
                                 <?php if(intval($cat->status) === 1): ?>
                                    <span class="badge bg-success"><i class="fa-solid fa-circle-check me-1"></i> Hiển thị</span>
                                 <?php else: ?>
                                    <span class="badge bg-secondary"><i class="fa-solid fa-eye-slash me-1"></i> Ẩn</span>
                                 <?php endif; ?>
                              </td>
                              <td class="text-center">
                                 <a href="<?php echo XC_URL; ?>/admin/news-categories/edit/<?php echo $cat->id; ?>" class="btn btn-sm btn-outline-primary" title="Chỉnh sửa danh mục">
                                    <i class="fa-solid fa-pen-to-square me-1"></i> Sửa
                                 </a>
                              </td>
                           </tr>
                        <?php endforeach; else: ?>
                           <tr>
                              <td colspan="7" class="text-center py-4 text-muted">Không có danh mục nào.</td>
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

<?php require "footer.php"; ?>
