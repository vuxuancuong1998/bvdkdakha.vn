<?php require "header.php"; ?>

<?php
$is_btv = (intval($_SESSION['user']['group']) === 5);
$is_qtv = (intval($_SESSION['user']['group']) === 1);
$current_user_id = intval($_SESSION['user']['id']);
?>

<div class="conatiner-fluid content-inner mt-n5 py-0">
   <div class="row">
      <div class="col-sm-12">
         <div class="card shadow-sm border-0">
            <div class="card-header d-flex justify-content-between align-items-center flex-wrap gap-3 bg-white py-3">
               <div>
                  <h4 class="card-title text-primary font-weight-bold mb-1">
                     <i class="fa-solid fa-newspaper me-2"></i>Quản lý Tin tức - Sự kiện
                  </h4>
                  <p class="text-muted small mb-0">Tạo, phê duyệt, phát hành bài viết và sự kiện y tế cộng đồng.</p>
               </div>
               <div>
                  <a href="<?php echo XC_URL; ?>/admin/news/add" class="btn btn-primary btn-sm rounded-pill px-3 shadow-sm">
                     <i class="fa-solid fa-plus me-1"></i> Thêm bài viết mới
                  </a>
               </div>
            </div>
            <div class="card-body">
               
               <!-- Filter & Search Bar -->
               <form method="GET" action="<?php echo XC_URL; ?>/admin/news" class="row g-3 mb-4 align-items-center">
                  <div class="col-md-4">
                     <div class="input-group">
                        <span class="input-group-text bg-light border-end-0"><i class="fa-solid fa-magnifying-glass text-muted"></i></span>
                        <input type="text" name="title" class="form-control border-start-0" placeholder="Tìm kiếm tiêu đề bài viết..." value="<?php echo htmlspecialchars($filter_title); ?>">
                     </div>
                  </div>
                  <div class="col-md-3">
                     <select name="category" class="form-select">
                        <option value="0">-- Tất cả danh mục --</option>
                        <?php if(!empty($categories)): foreach($categories as $cat): ?>
                           <option value="<?php echo $cat->id; ?>" <?php echo ($filter_cat == $cat->id) ? 'selected' : ''; ?>>
                              <?php echo htmlspecialchars($cat->name); ?>
                           </option>
                        <?php endforeach; endif; ?>
                     </select>
                  </div>
                  <div class="col-md-2">
                     <select name="status" class="form-select">
                        <option value="0">-- Tất cả trạng thái --</option>
                        <option value="1" <?php echo ($filter_status == 1) ? 'selected' : ''; ?>>Nháp</option>
                        <option value="2" <?php echo ($filter_status == 2) ? 'selected' : ''; ?>>Chờ phê duyệt</option>
                        <option value="3" <?php echo ($filter_status == 3) ? 'selected' : ''; ?>>Đã phê duyệt</option>
                        <option value="4" <?php echo ($filter_status == 4) ? 'selected' : ''; ?>>Đã phát hành</option>
                        <option value="98" <?php echo ($filter_status == 98) ? 'selected' : ''; ?>>Từ chối</option>
                     </select>
                  </div>
                  <div class="col-md-3 d-flex gap-2">
                     <button type="submit" class="btn btn-primary btn-sm px-3"><i class="fa-solid fa-filter me-1"></i> Lọc</button>
                     <?php if(!empty($filter_title) || $filter_cat > 0 || $filter_status > 0): ?>
                        <a href="<?php echo XC_URL; ?>/admin/news" class="btn btn-outline-secondary btn-sm px-3"><i class="fa-solid fa-rotate-left me-1"></i> Xóa lọc</a>
                     <?php endif; ?>
                  </div>
               </form>

               <!-- Bulk Actions Panel (Hidden by default, shown when checkboxes are checked) -->
               <div id="bulkActionsPanel" class="alert alert-light border d-none justify-content-between align-items-center py-2 px-3 mb-3">
                  <div class="d-flex align-items-center gap-2">
                     <span class="text-muted"><i class="fa-solid fa-check-double text-primary"></i> Đã chọn <strong id="checkedCount">0</strong> bài viết:</span>
                  </div>
                  <div class="d-flex align-items-center gap-2">
                     <?php if ($is_qtv): ?>
                     <button type="button" onclick="triggerBulkAction('status_4')" class="btn btn-success btn-sm"><i class="fa-solid fa-upload me-1"></i> Phát hành</button>
                     <button type="button" onclick="triggerBulkAction('status_3')" class="btn btn-info btn-sm text-white"><i class="fa-solid fa-circle-check me-1"></i> Phê duyệt</button>
                     <button type="button" onclick="triggerBulkAction('status_1')" class="btn btn-secondary btn-sm"><i class="fa-solid fa-rotate-left me-1"></i> Gỡ xuống</button>
                     <?php endif; ?>
                     <button type="button" onclick="triggerBulkAction('delete')" class="btn btn-danger btn-sm"><i class="fa-solid fa-trash me-1"></i> Xóa đã chọn</button>
                  </div>
               </div>

               <!-- Data Table -->
               <div class="table-responsive">
                  <table class="table table-hover align-middle border text-nowrap">
                     <thead class="bg-light text-dark fw-bold">
                        <tr>
                           <th width="40" class="text-center">
                              <input type="checkbox" class="form-check-input" id="checkAllNews">
                           </th>
                           <th width="80">Ảnh</th>
                           <th>Tiêu đề bài viết</th>
                           <th>Danh mục</th>
                           <th>Tác giả</th>
                           <th class="text-center">Lượt xem</th>
                           <th>Ngày đăng / Phát hành</th>
                           <th class="text-center">Trạng thái</th>
                           <th class="text-center" width="160">Thao tác</th>
                        </tr>
                     </thead>
                     <tbody>
                        <?php if(!empty($news) && is_array($news)): foreach($news as $item): 
                           $badge_color = 'bg-secondary';
                           if(intval($item->status) === 2) $badge_color = 'bg-warning text-dark';
                           elseif(intval($item->status) === 3) $badge_color = 'bg-info text-white';
                           elseif(intval($item->status) === 4) $badge_color = 'bg-success text-white';
                           elseif(intval($item->status) === 98) $badge_color = 'bg-danger text-white';

                           $frontend_url = $this->url->permalink($item->id, 'news');
                        ?>
                           <tr id="row-news-<?php echo $item->id; ?>">
                              <td class="text-center">
                                 <input type="checkbox" class="form-check-input check-news-item" value="<?php echo $item->id; ?>">
                              </td>
                              <td>
                                 <img src="<?php echo !empty($item->thumbnail_url) ? XC_URL . htmlspecialchars($item->thumbnail_url) : XC_URL . '/template/frontend/assets/images/banner-01.jpg'; ?>" 
                                      alt="Thumbnail" class="rounded border" style="width: 60px; height: 38px; object-fit: cover;">
                              </td>
                              <td style="max-width: 300px; white-space: normal;">
                                 <div class="fw-bold text-dark mb-0"><?php echo htmlspecialchars($item->title); ?></div>
                                 <small class="text-muted"><i class="fa-solid fa-link"></i> <a href="<?php echo $frontend_url; ?>" target="_blank"><?php echo $item->slug; ?></a></small>
                              </td>
                              <td>
                                 <span class="badge bg-light text-dark border"><?php echo htmlspecialchars($item->category_name ?? 'Không'); ?></span>
                              </td>
                              <td>
                                 <span class="small"><i class="fa-solid fa-user-pen text-muted me-1"></i><?php echo htmlspecialchars($item->author_name ?? 'Ban biên tập'); ?></span>
                              </td>
                              <td class="text-center small"><?php echo number_format($item->views_count); ?></td>
                              <td class="small">
                                 <div><i class="fa-solid fa-calendar-day text-muted me-1"></i><?php echo date('d/m/Y H:i', strtotime($item->published_at ?? $item->created_at)); ?></div>
                                 <?php if(intval($item->new_category) === 3 && !empty($item->event_start_at)): ?>
                                    <span class="badge bg-light text-primary border" style="font-size:10px;"><i class="fa-solid fa-calendar-check me-1"></i>Sự kiện</span>
                                 <?php endif; ?>
                              </td>
                              <td class="text-center">
                                 <span class="badge <?php echo $badge_color; ?>"><?php echo htmlspecialchars($item->status_label ?? 'Không xác định'); ?></span>
                              </td>
                              <td class="text-center">
                                 <div class="d-inline-flex gap-2">
                                    <!-- View Frontend link -->
                                    <a href="<?php echo $frontend_url; ?>" target="_blank" class="btn btn-sm btn-outline-info" title="Xem trên website">
                                       <i class="fa-solid fa-eye"></i>
                                    </a>

                                    <?php 
                                    // Permissions Check
                                    $can_edit = true;
                                    if ($is_btv) {
                                       if (intval($item->author_id) !== $current_user_id || intval($item->status) === 3 || intval($item->status) === 4) {
                                          $can_edit = false;
                                       }
                                    }
                                    ?>

                                    <?php if ($can_edit): ?>
                                    <a href="<?php echo XC_URL; ?>/admin/news/edit/<?php echo $item->id; ?>" class="btn btn-sm btn-outline-primary" title="Chỉnh sửa">
                                       <i class="fa-solid fa-pen-to-square"></i>
                                    </a>
                                    <?php endif; ?>

                                    <!-- Quick State Action Buttons -->
                                    <?php if ($is_btv && intval($item->author_id) === $current_user_id): ?>
                                       <?php if (intval($item->status) === 1 || intval($item->status) === 98): ?>
                                          <button type="button" onclick="updateNewsStatus(<?php echo $item->id; ?>, 'submit')" class="btn btn-sm btn-warning text-dark" title="Gửi yêu cầu phê duyệt">
                                             <i class="fa-solid fa-paper-plane"></i>
                                          </button>
                                       <?php elseif (intval($item->status) === 2): ?>
                                          <button type="button" onclick="updateNewsStatus(<?php echo $item->id; ?>, 'cancel')" class="btn btn-sm btn-outline-warning" title="Hủy yêu cầu phê duyệt">
                                             <i class="fa-solid fa-ban"></i>
                                          </button>
                                       <?php endif; ?>
                                    <?php endif; ?>

                                    <?php if ($is_qtv): ?>
                                       <?php if (intval($item->status) === 2): ?>
                                          <button type="button" onclick="updateNewsStatus(<?php echo $item->id; ?>, 'approve')" class="btn btn-sm btn-info text-white" title="Phê duyệt">
                                             <i class="fa-solid fa-circle-check"></i>
                                          </button>
                                          <button type="button" onclick="updateNewsStatus(<?php echo $item->id; ?>, 'reject')" class="btn btn-sm btn-outline-danger" title="Từ chối">
                                             <i class="fa-solid fa-circle-xmark"></i>
                                          </button>
                                       <?php elseif (intval($item->status) === 3 || intval($item->status) === 1): ?>
                                          <button type="button" onclick="updateNewsStatus(<?php echo $item->id; ?>, 'publish')" class="btn btn-sm btn-success" title="Phát hành">
                                             <i class="fa-solid fa-upload"></i>
                                          </button>
                                       <?php elseif (intval($item->status) === 4): ?>
                                          <button type="button" onclick="updateNewsStatus(<?php echo $item->id; ?>, 'submit')" class="btn btn-sm btn-secondary" title="Hạ xuống nháp">
                                             <i class="fa-solid fa-arrow-down-long"></i>
                                          </button>
                                       <?php endif; ?>
                                    <?php endif; ?>

                                    <!-- Delete Button -->
                                    <?php if ($is_qtv || ($is_btv && intval($item->author_id) === $current_user_id && (intval($item->status) === 1 || intval($item->status) === 98))): ?>
                                    <button type="button" onclick="deleteNews(<?php echo $item->id; ?>)" class="btn btn-sm btn-outline-danger" title="Xóa bài viết">
                                       <i class="fa-solid fa-trash"></i>
                                    </button>
                                    <?php endif; ?>
                                 </div>
                              </td>
                           </tr>
                        <?php endforeach; else: ?>
                           <tr>
                              <td colspan="9" class="text-center py-4 text-muted">
                                 <i class="fa-regular fa-folder-open fa-2xl mb-3 d-block"></i>
                                 Không tìm thấy bài viết nào phù hợp.
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

<script>
// Checkbox control logic
$('#checkAllNews').on('change', function() {
   $('.check-news-item').prop('checked', this.checked);
   toggleBulkPanel();
});

$('.check-news-item').on('change', function() {
   toggleBulkPanel();
});

function toggleBulkPanel() {
   let checkedBoxes = $('.check-news-item:checked');
   let count = checkedBoxes.length;
   $('#checkedCount').text(count);
   if(count > 0) {
      $('#bulkActionsPanel').removeClass('d-none').addClass('d-flex');
   } else {
      $('#bulkActionsPanel').removeClass('d-flex').addClass('d-none');
   }
}

// Single Action update status
function updateNewsStatus(id, action) {
   let actionLabels = {
      'submit': 'Gửi yêu cầu phê duyệt',
      'cancel': 'Hủy gửi phê duyệt',
      'approve': 'Phê duyệt bài viết',
      'reject': 'Từ chối bài viết',
      'publish': 'Phát hành bài viết'
   };
   
   Swal.fire({
      title: 'Xác nhận',
      text: 'Bạn có chắc chắn muốn ' + (actionLabels[action] || 'thực hiện thao tác này') + '?',
      icon: 'question',
      showCancelButton: true,
      confirmButtonText: 'Đồng ý',
      cancelButtonText: 'Hủy'
   }).then((result) => {
      if(result.isConfirmed) {
         $.ajax({
            url: '<?php echo XC_URL; ?>/api/updatenewsstatus',
            type: 'POST',
            data: { id: id, action: action },
            dataType: 'json',
            success: function(res) {
               if(res.status == 200) {
                  Swal.fire('Thành công', res.message, 'success').then(() => {
                     location.reload();
                  });
               } else {
                  Swal.fire('Thất bại', res.message, 'error');
               }
            },
            error: function() {
               Swal.fire('Lỗi', 'Không thể kết nối đến server. Thử lại sau!', 'error');
            }
         });
      }
   });
}

// Single delete
function deleteNews(id) {
   Swal.fire({
      title: 'Cảnh báo',
      text: 'Bạn có chắc chắn muốn xóa bài viết này?',
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#d33',
      confirmButtonText: 'Xóa ngay',
      cancelButtonText: 'Hủy'
   }).then((result) => {
      if(result.isConfirmed) {
         $.ajax({
            url: '<?php echo XC_URL; ?>/api/updatenewsstatus',
            type: 'POST',
            data: { id: id, action: 'delete' },
            dataType: 'json',
            success: function(res) {
               if(res.status == 200) {
                  Swal.fire('Thành công', res.message, 'success').then(() => {
                     $('#row-news-' + id).remove();
                  });
               } else {
                  Swal.fire('Thất bại', res.message, 'error');
               }
            },
            error: function() {
               Swal.fire('Lỗi', 'Không thể kết nối đến server. Thử lại sau!', 'error');
            }
         });
      }
   });
}

// Bulk action triggers
function triggerBulkAction(action) {
   let checkedBoxes = $('.check-news-item:checked');
   let ids = [];
   checkedBoxes.each(function() {
      ids.push($(this).val());
   });

   if(ids.length === 0) return;

   let text = 'Bạn có muốn thực hiện hành động hàng loạt này?';
   if(action === 'delete') {
      text = 'Cảnh báo: Hành động này sẽ xóa tất cả bài viết đã chọn!';
   }

   Swal.fire({
      title: 'Thao tác hàng loạt',
      text: text,
      icon: action === 'delete' ? 'warning' : 'question',
      showCancelButton: true,
      confirmButtonText: 'Đồng ý',
      cancelButtonText: 'Hủy'
   }).then((result) => {
      if(result.isConfirmed) {
         $.ajax({
            url: '<?php echo XC_URL; ?>/api/bulknewsaction',
            type: 'POST',
            data: { ids: ids, action: action },
            dataType: 'json',
            success: function(res) {
               if(res.status == 200) {
                  Swal.fire('Thành công', res.message, 'success').then(() => {
                     location.reload();
                  });
               } else {
                  Swal.fire('Thất bại', res.message, 'error');
               }
            },
            error: function() {
               Swal.fire('Lỗi', 'Không thể kết nối đến server. Thử lại sau!', 'error');
            }
         });
      }
   });
}
</script>

<?php require "footer.php"; ?>
