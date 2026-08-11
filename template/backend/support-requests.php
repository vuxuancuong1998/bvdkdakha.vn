<?php require "header.php"; ?>

<div class="conatiner-fluid content-inner mt-n5 py-0">
   <div class="row">
      <div class="col-sm-12">
         <div class="card shadow-sm border-0">
            <div class="card-header d-flex justify-content-between align-items-center flex-wrap gap-3 bg-white py-3">
               <div>
                  <h4 class="card-title text-primary font-weight-bold mb-1">
                     <i class="fa-solid fa-headset me-2"></i>Quản lý Yêu cầu Hỗ trợ (Tickets CMS)
                  </h4>
                  <p class="text-muted small mb-0">Quản lý, phân loại, đổi trạng thái và nhập nội dung mô tả đã xử lý cho các yêu cầu từ cán bộ nhân viên.</p>
               </div>
            </div>
            <div class="card-body">
               
               <!-- Filter & Search Bar -->
               <form method="GET" action="<?php echo XC_URL; ?>/admin/supportrequests" class="row g-3 mb-4 align-items-center">
                  <div class="col-md-5">
                     <div class="input-group">
                        <span class="input-group-text bg-light border-end-0"><i class="fa-solid fa-magnifying-glass text-muted"></i></span>
                        <input type="text" name="q" class="form-control border-start-0" placeholder="Tìm theo mã YC, tiêu đề, người tạo, phòng ban..." value="<?php echo htmlspecialchars($search); ?>">
                     </div>
                  </div>
                  <div class="col-md-4">
                     <select name="status" class="form-select">
                        <option value="">-- Tất cả trạng thái --</option>
                        <option value="sent" <?php echo ($status_filter === 'sent') ? 'selected' : ''; ?>>Đã gửi (Chờ tiếp nhận)</option>
                        <option value="processing" <?php echo ($status_filter === 'processing') ? 'selected' : ''; ?>>Đang xử lý</option>
                        <option value="completed" <?php echo ($status_filter === 'completed') ? 'selected' : ''; ?>>Đã hoàn thành</option>
                        <option value="draft" <?php echo ($status_filter === 'draft') ? 'selected' : ''; ?>>Chờ gửi (Nháp)</option>
                        <option value="rejected" <?php echo ($status_filter === 'rejected') ? 'selected' : ''; ?>>Từ chối xử lý</option>
                     </select>
                  </div>
                  <div class="col-md-3 d-flex gap-2">
                     <button type="submit" class="btn btn-primary btn-sm px-3"><i class="fa-solid fa-filter me-1"></i> Lọc</button>
                     <?php if(!empty($search) || !empty($status_filter)): ?>
                        <a href="<?php echo XC_URL; ?>/admin/supportrequests" class="btn btn-outline-secondary btn-sm px-3"><i class="fa-solid fa-rotate-left me-1"></i> Xóa lọc</a>
                     <?php endif; ?>
                  </div>
               </form>

               <!-- Data Table -->
               <div class="table-responsive">
                  <table class="table table-hover align-middle border text-nowrap">
                     <thead class="bg-light text-dark fw-bold">
                        <tr>
                           <th width="50" class="text-center">#</th>
                           <th>Mã Yêu Cầu</th>
                           <th>Ngày tạo</th>
                           <th>Tiêu đề / Nội dung ngắn</th>
                           <th>Người tạo & Khoa phòng</th>
                           <th class="text-center">Trạng thái xử lý</th>
                           <th class="text-center" width="140">Thao tác</th>
                        </tr>
                     </thead>
                     <tbody>
                        <?php if(!empty($requests)): ?>
                           <?php $stt = ($page - 1) * $per_page + 1; foreach($requests as $item): ?>
                              <tr>
                                 <td class="text-center fw-bold text-muted"><?php echo $stt++; ?></td>
                                 <td>
                                    <strong class="font-monospace text-primary"><?php echo htmlspecialchars($item->request_code); ?></strong>
                                 </td>
                                 <td class="small text-muted">
                                    <?php echo date('H:i d/m/Y', strtotime($item->created_at)); ?>
                                 </td>
                                 <td>
                                    <div class="fw-bold text-dark mb-1"><?php echo htmlspecialchars($item->title); ?></div>
                                    <div class="small text-muted">
                                       <span class="badge bg-soft-info text-info me-1"><?php echo htmlspecialchars($item->service_type); ?></span>
                                       <span class="badge bg-soft-secondary text-secondary"><?php echo htmlspecialchars($item->priority); ?></span>
                                    </div>
                                 </td>
                                 <td>
                                    <div class="fw-bold text-dark"><?php echo htmlspecialchars($item->user_name); ?></div>
                                    <div class="small text-muted"><?php echo !empty($item->department) ? htmlspecialchars($item->department) : 'Chưa phân khoa'; ?></div>
                                 </td>
                                 <td class="text-center">
                                    <?php if($item->status === 'completed'): ?>
                                       <span class="badge bg-success rounded-pill px-3 py-1"><i class="fa-solid fa-circle-check me-1"></i>Đã hoàn thành</span>
                                    <?php elseif($item->status === 'processing'): ?>
                                       <span class="badge bg-primary rounded-pill px-3 py-1"><i class="fa-solid fa-spinner me-1"></i>Đang xử lý</span>
                                    <?php elseif($item->status === 'sent'): ?>
                                       <span class="badge bg-info rounded-pill px-3 py-1"><i class="fa-solid fa-paper-plane me-1"></i>Đã gửi</span>
                                    <?php elseif($item->status === 'draft'): ?>
                                       <span class="badge bg-warning text-dark rounded-pill px-3 py-1"><i class="fa-solid fa-file-pen me-1"></i>Chờ gửi (Nháp)</span>
                                    <?php else: ?>
                                       <span class="badge bg-danger rounded-pill px-3 py-1"><i class="fa-solid fa-circle-xmark me-1"></i>Từ chối xử lý</span>
                                    <?php endif; ?>
                                 </td>
                                 <td class="text-center">
                                    <button type="button" class="btn btn-sm btn-primary rounded-pill px-3 shadow-sm" onclick="openProcessModal(<?php echo htmlspecialchars(json_encode($item)); ?>)">
                                       <i class="fa-solid fa-pen-to-square me-1"></i> Xử lý
                                    </button>
                                 </td>
                              </tr>
                           <?php endforeach; ?>
                        <?php else: ?>
                           <tr>
                              <td colspan="7" class="text-center py-5 text-muted">
                                 <i class="fa-solid fa-headset fa-3x mb-3 text-secondary"></i>
                                 <p class="mb-0">Chưa có yêu cầu hỗ trợ nào trong danh sách.</p>
                              </td>
                           </tr>
                        <?php endif; ?>
                     </tbody>
                  </table>
               </div>

               <!-- Pagination -->
               <?php if($total_pages > 1): ?>
                  <div class="d-flex justify-content-between align-items-center mt-3 flex-wrap gap-2">
                     <div class="small text-muted">Hiển thị <?php echo count($requests); ?> / tổng số <?php echo $total_items; ?> yêu cầu</div>
                     <nav>
                        <ul class="pagination pagination-sm mb-0">
                           <li class="page-item <?php echo ($page <= 1) ? 'disabled' : ''; ?>">
                              <a class="page-link" href="<?php echo XC_URL; ?>/admin/supportrequests?page=<?php echo ($page-1); ?>&q=<?php echo urlencode($search); ?>&status=<?php echo urlencode($status_filter); ?>">Trước</a>
                           </li>
                           <?php for($i = 1; $i <= $total_pages; $i++): ?>
                              <li class="page-item <?php echo ($page == $i) ? 'active' : ''; ?>">
                                 <a class="page-link" href="<?php echo XC_URL; ?>/admin/supportrequests?page=<?php echo $i; ?>&q=<?php echo urlencode($search); ?>&status=<?php echo urlencode($status_filter); ?>"><?php echo $i; ?></a>
                              </li>
                           <?php endfor; ?>
                           <li class="page-item <?php echo ($page >= $total_pages) ? 'disabled' : ''; ?>">
                              <a class="page-link" href="<?php echo XC_URL; ?>/admin/supportrequests?page=<?php echo ($page+1); ?>&q=<?php echo urlencode($search); ?>&status=<?php echo urlencode($status_filter); ?>">Sau</a>
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

<!-- Modal Process Request / Change Status & Input Resolution Note -->
<div class="modal fade" id="modalProcessRequest" tabindex="-1" aria-hidden="true">
   <div class="modal-dialog modal-lg">
      <div class="modal-content">
         <form id="formProcessRequest">
            <input type="hidden" name="id" id="req_id" value="0">
            <div class="modal-header bg-primary text-white">
               <h5 class="modal-title text-white font-weight-bold" id="modalProcessTitle">Xử lý Yêu cầu Hỗ trợ</h5>
               <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
               <div class="p-3 bg-light rounded mb-3 border">
                  <div class="d-flex justify-content-between mb-1">
                     <span class="fw-bold text-primary" id="req_code_text"></span>
                     <span class="small text-muted" id="req_date_text"></span>
                  </div>
                  <h5 class="fw-bold text-dark mb-2" id="req_title_text"></h5>
                  <div class="small text-muted mb-2"><strong>Người gửi:</strong> <span id="req_user_text"></span> (<span id="req_dept_text"></span>)</div>
                  <div class="p-2 border rounded bg-white small" id="req_content_text"></div>
               </div>

               <!-- Form Inputs -->
               <div class="mb-3">
                  <label class="form-label fw-bold text-dark">Đổi Trạng Thái Yêu Cầu <span class="text-danger">*</span></label>
                  <select name="status" id="req_status" class="form-select form-select-lg fw-bold text-primary">
                     <option value="sent">Đã gửi (Chờ tiếp nhận)</option>
                     <option value="processing">Đang xử lý</option>
                     <option value="completed">Đã hoàn thành</option>
                     <option value="draft">Chờ gửi (Bản nháp)</option>
                     <option value="rejected">Từ chối xử lý</option>
                  </select>
               </div>

               <div class="mb-3">
                  <label class="form-label fw-bold text-dark">Mô tả nội dung đã xử lý (Ghi chú kỹ thuật / Admin) <span class="text-danger">*</span></label>
                  <textarea name="resolution_note" id="req_resolution_note" class="form-control" rows="4" placeholder="Nhập kết quả xử lý, nguyên nhân sự cố hoặc lý do từ chối..."></textarea>
                  <div class="form-text">Nội dung này sẽ hiển thị trực tiếp cho người dùng trong Không gian làm việc số.</div>
               </div>
            </div>
            <div class="modal-footer">
               <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
               <button type="submit" id="btnSaveProcess" class="btn btn-primary px-4 font-weight-bold">
                  <i class="fa-solid fa-floppy-disk me-1"></i> Lưu trạng thái & Nội dung xử lý
               </button>
            </div>
         </form>
      </div>
   </div>
</div>

<script>
function openProcessModal(req) {
   $('#req_id').val(req.id);
   $('#req_code_text').text('Mã YC: ' + req.request_code);
   $('#req_date_text').text('Ngày tạo: ' + req.created_at);
   $('#req_title_text').text(req.title);
   $('#req_user_text').text(req.user_name);
   $('#req_dept_text').text(req.department || 'Bệnh viện');
   $('#req_content_text').text(req.content || 'Không có chi tiết');
   
   $('#req_status').val(req.status);
   $('#req_resolution_note').val(req.resolution_note || '');

   $('#modalProcessRequest').modal('show');
}

$('#formProcessRequest').on('submit', function(e) {
   e.preventDefault();
   $('#btnSaveProcess').prop('disabled', true).html('<i class="fa-solid fa-spinner fa-spin me-1"></i> Đang lưu...');

   $.ajax({
      url: '<?php echo XC_URL; ?>/api/updaterequeststatus',
      type: 'POST',
      data: $(this).serialize(),
      dataType: 'json',
      success: function(res) {
         $('#btnSaveProcess').prop('disabled', false).html('<i class="fa-solid fa-floppy-disk me-1"></i> Lưu trạng thái & Nội dung xử lý');
         if(res.status == 200) {
            Swal.fire('Thành công', res.message, 'success').then(() => {
               location.reload();
            });
         } else {
            Swal.fire('Lỗi', res.message, 'error');
         }
      },
      error: function() {
         $('#btnSaveProcess').prop('disabled', false).html('<i class="fa-solid fa-floppy-disk me-1"></i> Lưu trạng thái & Nội dung xử lý');
         Swal.fire('Lỗi', 'Không thể kết nối đến máy chủ', 'error');
      }
   });
});
</script>

<?php require "footer.php"; ?>
