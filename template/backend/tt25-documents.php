<?php require "header.php"; ?>

<div class="container-fluid content-inner py-4">
  <div class="row">
    <div class="col-sm-12">
      
      <!-- Flash Alert -->
      <?php if(!empty($tt25_flash)): ?>
        <div class="alert alert-<?php echo htmlspecialchars($tt25_flash['type']); ?> alert-dismissible fade show mb-4 shadow-sm" role="alert" style="border-radius: 10px;">
          <i class="fa-solid fa-circle-info me-2"></i>
          <?php echo htmlspecialchars($tt25_flash['message']); ?>
          <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
      <?php endif; ?>

      <div class="card border-0 shadow-sm" style="border-radius: 16px;">
        <!-- Card Header -->
        <div class="card-header d-flex justify-content-between align-items-center flex-wrap gap-3 bg-white py-3 border-bottom" style="border-radius: 16px 16px 0 0;">
          <div>
            <h4 class="card-title fw-bold mb-1 text-primary" style="font-size: 1.25rem;">
              <i class="fa-solid fa-file-medical me-2"></i> Quản Lý Giấy Tờ TT25
            </h4>
            <p class="mb-0 text-muted small">Danh sách bệnh nhân đăng ký cấp giấy tờ theo Thông tư 25/BYT (Sắp xếp mới nhất trước)</p>
          </div>
          
          <!-- Summary Counters -->
          <div class="d-flex align-items-center gap-2 flex-wrap">
            <span class="badge bg-soft-primary text-primary px-3 py-2" style="font-size: 13px; border-radius: 20px;">
              Tổng số: <strong><?php echo isset($tt25_status_counts['all']) ? $tt25_status_counts['all'] : 0; ?></strong>
            </span>
            <span class="badge bg-soft-warning text-warning px-3 py-2" style="font-size: 13px; border-radius: 20px;">
              Mới tiếp nhận: <strong><?php echo isset($tt25_status_counts['0']) ? $tt25_status_counts['0'] : 0; ?></strong>
            </span>
            <span class="badge bg-soft-success text-success px-3 py-2" style="font-size: 13px; border-radius: 20px;">
              Hoàn thành: <strong><?php echo isset($tt25_status_counts['1']) ? $tt25_status_counts['1'] : 0; ?></strong>
            </span>
            <span class="badge bg-soft-danger text-danger px-3 py-2" style="font-size: 13px; border-radius: 20px;">
              Từ chối: <strong><?php echo isset($tt25_status_counts['2']) ? $tt25_status_counts['2'] : 0; ?></strong>
            </span>
          </div>
        </div>

        <!-- Filter & Search Bar -->
        <div class="card-body bg-light-subtle py-3 border-bottom">
          <form method="GET" action="<?php echo XC_URL; ?>/admin/tt25documents" class="row g-2 align-items-center">
            
            <!-- Status Filter Tabs / Buttons -->
            <div class="col-lg-6 col-md-12">
              <div class="btn-group w-100 shadow-sm" role="group" style="border-radius: 10px; overflow: hidden;">
                <a href="<?php echo XC_URL; ?>/admin/tt25documents?status=all<?php echo !empty($tt25_keyword) ? '&keyword='.urlencode($tt25_keyword) : ''; ?>" 
                   class="btn btn-sm <?php echo ($tt25_status_filter === 'all' || $tt25_status_filter === '') ? 'btn-primary fw-bold' : 'btn-outline-secondary bg-white'; ?>">
                   Tất cả
                </a>
                <a href="<?php echo XC_URL; ?>/admin/tt25documents?status=0<?php echo !empty($tt25_keyword) ? '&keyword='.urlencode($tt25_keyword) : ''; ?>" 
                   class="btn btn-sm <?php echo ($tt25_status_filter === '0') ? 'btn-warning text-dark fw-bold' : 'btn-outline-secondary bg-white'; ?>">
                   Mới tiếp nhận (<?php echo isset($tt25_status_counts['0']) ? $tt25_status_counts['0'] : 0; ?>)
                </a>
                <a href="<?php echo XC_URL; ?>/admin/tt25documents?status=1<?php echo !empty($tt25_keyword) ? '&keyword='.urlencode($tt25_keyword) : ''; ?>" 
                   class="btn btn-sm <?php echo ($tt25_status_filter === '1') ? 'btn-success fw-bold' : 'btn-outline-secondary bg-white'; ?>">
                   Hoàn thành (<?php echo isset($tt25_status_counts['1']) ? $tt25_status_counts['1'] : 0; ?>)
                </a>
                <a href="<?php echo XC_URL; ?>/admin/tt25documents?status=2<?php echo !empty($tt25_keyword) ? '&keyword='.urlencode($tt25_keyword) : ''; ?>" 
                   class="btn btn-sm <?php echo ($tt25_status_filter === '2') ? 'btn-danger fw-bold' : 'btn-outline-secondary bg-white'; ?>">
                   Từ chối (<?php echo isset($tt25_status_counts['2']) ? $tt25_status_counts['2'] : 0; ?>)
                </a>
              </div>
            </div>

            <!-- Search Keyword input -->
            <div class="col-lg-6 col-md-12">
              <div class="input-group shadow-sm" style="border-radius: 10px; overflow: hidden;">
                <input type="hidden" name="status" value="<?php echo htmlspecialchars($tt25_status_filter); ?>">
                <span class="input-group-text bg-white border-end-0"><i class="fa-solid fa-magnifying-glass text-muted"></i></span>
                <input type="text" class="form-control border-start-0 ps-0" name="keyword" value="<?php echo htmlspecialchars($tt25_keyword); ?>" placeholder="Tìm theo tên bệnh nhân, CCCD, SĐT, Email, loại giấy...">
                <button type="submit" class="btn btn-primary px-4 fw-bold">Tìm kiếm</button>
                <?php if(!empty($tt25_keyword)): ?>
                  <a href="<?php echo XC_URL; ?>/admin/tt25documents?status=<?php echo htmlspecialchars($tt25_status_filter); ?>" class="btn btn-secondary"><i class="fa-solid fa-xmark"></i></a>
                <?php endif; ?>
              </div>
            </div>

          </form>
        </div>

        <!-- Table Body -->
        <div class="card-body p-0">
          <div class="table-responsive">
            <table class="table table-hover table-striped align-middle mb-0" style="min-width: 1000px;">
              <thead class="table-light text-uppercase text-secondary" style="font-size: 12px; letter-spacing: 0.5px;">
                <tr>
                  <th style="width: 50px;" class="text-center">STT</th>
                  <th style="min-width: 180px;">Họ và tên bệnh nhân</th>
                  <th style="min-width: 130px;">Số CCCD</th>
                  <th style="min-width: 110px;">Ngày sinh</th>
                  <th style="min-width: 190px;">Liên hệ (SĐT / Email)</th>
                  <th style="min-width: 220px;">Loại giấy TT25/BYT</th>
                  <th style="min-width: 140px;">Thời gian tạo</th>
                  <th style="min-width: 130px;" class="text-center">Trạng thái</th>
                  <th style="min-width: 160px;" class="text-center">Thao tác</th>
                </tr>
              </thead>
              <tbody>
                <?php if(!empty($tt25_requests) && is_array($tt25_requests)): ?>
                  <?php 
                    $stt = ($tt25_page - 1) * $tt25_per_page + 1;
                    foreach($tt25_requests as $item): 
                      $status = intval($item->status);
                  ?>
                    <tr id="row-tt25-<?php echo $item->id; ?>">
                      <td class="text-center fw-bold text-muted"><?php echo $stt++; ?></td>
                      
                      <!-- Họ tên -->
                      <td>
                        <div class="fw-bold text-dark" style="font-size: 14px;"><?php echo htmlspecialchars($item->fullname); ?></div>
                        <small class="text-muted">ID: #<?php echo $item->id; ?></small>
                      </td>

                      <!-- CCCD -->
                      <td>
                        <span class="badge bg-light text-dark border px-2 py-1" style="font-size: 13px; font-family: monospace;">
                          <i class="fa-solid fa-id-card me-1 text-primary"></i><?php echo htmlspecialchars($item->cccd); ?>
                        </span>
                      </td>

                      <!-- Ngày sinh -->
                      <td>
                        <span class="text-secondary" style="font-size: 13.5px;">
                          <?php echo !empty($item->dob) ? date('d/m/Y', strtotime($item->dob)) : '---'; ?>
                        </span>
                      </td>

                      <!-- SĐT & Email -->
                      <td>
                        <div class="fw-semibold text-dark" style="font-size: 13.5px;">
                          <i class="fa-solid fa-phone me-1 text-success small"></i><?php echo htmlspecialchars($item->phone); ?>
                        </div>
                        <div class="small text-muted text-truncate" style="max-width: 180px;" title="<?php echo htmlspecialchars($item->email); ?>">
                          <i class="fa-solid fa-envelope me-1 text-info small"></i><?php echo htmlspecialchars($item->email); ?>
                        </div>
                      </td>

                      <!-- Loại giấy -->
                      <td>
                        <span class="fw-semibold text-primary" style="font-size: 13.5px; display: inline-block; max-width: 230px; line-height: 1.3;">
                          <i class="fa-solid fa-file-lines me-1 text-primary"></i><?php echo htmlspecialchars($item->category_name); ?>
                        </span>
                      </td>

                      <!-- Ngày tạo -->
                      <td>
                        <span class="small text-muted" title="<?php echo $item->created_at; ?>">
                          <i class="fa-regular fa-clock me-1"></i><?php echo !empty($item->created_at) ? date('d/m/Y H:i', strtotime($item->created_at)) : '---'; ?>
                        </span>
                      </td>

                      <!-- Trạng thái -->
                      <td class="text-center" id="status-cell-<?php echo $item->id; ?>">
                        <?php if($status === 1): ?>
                          <span class="badge bg-soft-success text-success px-3 py-2 fw-bold" style="font-size: 12px; border-radius: 12px;">
                            <i class="fa-solid fa-circle-check me-1"></i> Hoàn thành
                          </span>
                        <?php elseif($status === 2): ?>
                          <span class="badge bg-soft-danger text-danger px-3 py-2 fw-bold" style="font-size: 12px; border-radius: 12px;" title="<?php echo htmlspecialchars($item->note); ?>">
                            <i class="fa-solid fa-circle-xmark me-1"></i> Từ chối
                          </span>
                        <?php else: ?>
                          <span class="badge bg-soft-warning text-warning px-3 py-2 fw-bold" style="font-size: 12px; border-radius: 12px;">
                            <i class="fa-solid fa-clock me-1"></i> Mới tiếp nhận
                          </span>
                        <?php endif; ?>
                      </td>

                      <!-- Thao tác -->
                      <td class="text-center">
                        <div class="d-flex align-items-center justify-content-center gap-1">
                          
                          <!-- NÚT TÍCH HOÀN THÀNH QUICK CHECK -->
                          <button type="button" 
                                  class="btn btn-sm btn-outline-success btn-complete-tt25 shadow-sm" 
                                  data-id="<?php echo $item->id; ?>" 
                                  data-name="<?php echo htmlspecialchars($item->fullname); ?>"
                                  title="Tích chuyển sang trạng thái Hoàn thành" 
                                  style="width: 34px; height: 34px; border-radius: 50%; padding: 0; display: inline-flex; align-items: center; justify-content: center; <?php echo ($status === 1) ? 'background: #10b981; color: #fff; border-color: #10b981;' : ''; ?>">
                            <i class="fa-solid fa-check fs-6"></i>
                          </button>

                          <!-- Nút Chi tiết / Modal -->
                          <button type="button" 
                                  class="btn btn-sm btn-outline-info shadow-sm btn-detail-tt25" 
                                  data-id="<?php echo $item->id; ?>"
                                  data-fullname="<?php echo htmlspecialchars($item->fullname); ?>"
                                  data-cccd="<?php echo htmlspecialchars($item->cccd); ?>"
                                  data-dob="<?php echo !empty($item->dob) ? date('d/m/Y', strtotime($item->dob)) : ''; ?>"
                                  data-phone="<?php echo htmlspecialchars($item->phone); ?>"
                                  data-bhyt="<?php echo htmlspecialchars(isset($item->bhyt_code) ? $item->bhyt_code : ''); ?>"
                                  data-email="<?php echo htmlspecialchars($item->email); ?>"
                                  data-category="<?php echo htmlspecialchars($item->category_name); ?>"
                                  data-created="<?php echo !empty($item->created_at) ? date('d/m/Y H:i:s', strtotime($item->created_at)) : ''; ?>"
                                  data-status="<?php echo $status; ?>"
                                  data-note="<?php echo htmlspecialchars($item->note); ?>"
                                  title="Xem chi tiết bệnh nhân"
                                  style="width: 34px; height: 34px; border-radius: 50%; padding: 0; display: inline-flex; align-items: center; justify-content: center;">
                            <i class="fa-solid fa-eye fs-6"></i>
                          </button>

                          <!-- Nút Từ chối -->
                          <button type="button" 
                                  class="btn btn-sm btn-outline-warning shadow-sm btn-reject-tt25" 
                                  data-id="<?php echo $item->id; ?>" 
                                  data-name="<?php echo htmlspecialchars($item->fullname); ?>"
                                  title="Từ chối yêu cầu"
                                  style="width: 34px; height: 34px; border-radius: 50%; padding: 0; display: inline-flex; align-items: center; justify-content: center;">
                            <i class="fa-solid fa-ban fs-6"></i>
                          </button>

                          <!-- Nút Xóa -->
                          <button type="button" 
                                  class="btn btn-sm btn-outline-danger shadow-sm btn-delete-tt25" 
                                  data-id="<?php echo $item->id; ?>" 
                                  data-name="<?php echo htmlspecialchars($item->fullname); ?>"
                                  title="Xóa yêu cầu"
                                  style="width: 34px; height: 34px; border-radius: 50%; padding: 0; display: inline-flex; align-items: center; justify-content: center;">
                            <i class="fa-solid fa-trash fs-6"></i>
                          </button>

                        </div>
                      </td>

                    </tr>
                  <?php endforeach; ?>
                <?php else: ?>
                  <tr>
                    <td colspan="9" class="text-center py-5">
                      <div class="py-4">
                        <i class="fa-solid fa-folder-open text-muted opacity-50 display-4 mb-3 d-block"></i>
                        <h6 class="text-muted fw-bold mb-1">Chưa có yêu cầu giấy TT25 nào</h6>
                        <p class="text-muted small">Dữ liệu bệnh nhân gửi yêu cầu sẽ xuất hiện ở đây.</p>
                      </div>
                    </td>
                  </tr>
                <?php endif; ?>
              </tbody>
            </table>
          </div>
        </div>

        <!-- Card Footer & Pagination -->
        <?php if($tt25_total_pages > 1): ?>
          <div class="card-footer bg-white border-top py-3 d-flex justify-content-between align-items-center flex-wrap gap-2" style="border-radius: 0 0 16px 16px;">
            <div class="text-muted small">
              Hiển thị <strong><?php echo count($tt25_requests); ?></strong> trên tổng số <strong><?php echo $tt25_total; ?></strong> bản ghi (Trang <?php echo $tt25_page; ?>/<?php echo $tt25_total_pages; ?>)
            </div>
            
            <nav aria-label="Page navigation">
              <ul class="pagination pagination-sm mb-0">
                <li class="page-item <?php echo ($tt25_page <= 1) ? 'disabled' : ''; ?>">
                  <a class="page-link" href="<?php echo XC_URL; ?>/admin/tt25documents?page=<?php echo $tt25_page - 1; ?>&status=<?php echo htmlspecialchars($tt25_status_filter); ?>&keyword=<?php echo urlencode($tt25_keyword); ?>">Trước</a>
                </li>
                <?php for($i = 1; $i <= $tt25_total_pages; $i++): ?>
                  <li class="page-item <?php echo ($i == $tt25_page) ? 'active' : ''; ?>">
                    <a class="page-link" href="<?php echo XC_URL; ?>/admin/tt25documents?page=<?php echo $i; ?>&status=<?php echo htmlspecialchars($tt25_status_filter); ?>&keyword=<?php echo urlencode($tt25_keyword); ?>"><?php echo $i; ?></a>
                  </li>
                <?php endfor; ?>
                <li class="page-item <?php echo ($tt25_page >= $tt25_total_pages) ? 'disabled' : ''; ?>">
                  <a class="page-link" href="<?php echo XC_URL; ?>/admin/tt25documents?page=<?php echo $tt25_page + 1; ?>&status=<?php echo htmlspecialchars($tt25_status_filter); ?>&keyword=<?php echo urlencode($tt25_keyword); ?>">Sau</a>
                </li>
              </ul>
            </nav>
          </div>
        <?php endif; ?>

      </div>

    </div>
  </div>
</div>

<!-- Modal Xem Chi Tiết Bệnh Nhân -->
<div class="modal fade" id="modalDetailTT25" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content border-0 shadow-lg" style="border-radius: 16px;">
      <div class="modal-header bg-primary text-white" style="border-radius: 16px 16px 0 0;">
        <h5 class="modal-title fw-bold text-white"><i class="fa-solid fa-id-card me-2"></i> Chi Tiết Yêu Cầu Cấp Giấy</h5>
        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body p-4">
        <div class="table-responsive">
          <table class="table table-bordered mb-0">
            <tbody>
              <tr><th style="width: 140px;" class="bg-light">Họ và tên:</th><td id="dt-fullname" class="fw-bold text-dark"></td></tr>
              <tr><th class="bg-light">Số CCCD:</th><td id="dt-cccd" class="fw-bold text-primary"></td></tr>
              <tr><th class="bg-light">Ngày sinh:</th><td id="dt-dob"></td></tr>
              <tr><th class="bg-light">Số điện thoại:</th><td id="dt-phone"></td></tr>
              <tr><th class="bg-light">Số thẻ BHYT:</th><td id="dt-bhyt" class="fw-bold text-info"></td></tr>
              <tr><th class="bg-light">Email:</th><td id="dt-email"></td></tr>
              <tr><th class="bg-light">Loại giấy TT25:</th><td id="dt-category" class="fw-bold text-success"></td></tr>
              <tr><th class="bg-light">Thời gian gửi:</th><td id="dt-created"></td></tr>
              <tr><th class="bg-light">Trạng thái:</th><td id="dt-status"></td></tr>
              <tr id="dt-note-row" style="display:none;"><th class="bg-light">Ghi chú/Lý do:</th><td id="dt-note" class="text-danger"></td></tr>
            </tbody>
          </table>
        </div>
      </div>
      <div class="modal-footer bg-light" style="border-radius: 0 0 16px 16px;">
        <button type="button" class="btn btn-secondary px-4" data-bs-dismiss="modal">Đóng</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal Từ Chối -->
<div class="modal fade" id="modalRejectTT25" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content border-0 shadow-lg" style="border-radius: 16px;">
      <form id="formRejectTT25" method="POST" action="<?php echo XC_URL; ?>/admin/tt25documents">
        <input type="hidden" name="tt25_action" value="reject">
        <input type="hidden" name="id" id="reject-id" value="">
        <div class="modal-header bg-danger text-white" style="border-radius: 16px 16px 0 0;">
          <h5 class="modal-title fw-bold text-white"><i class="fa-solid fa-ban me-2"></i> Từ Chối Yêu Cầu Cấp Giấy</h5>
          <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body p-4">
          <p class="mb-3" style="font-size: 14.5px;">Bạn có chắc chắn muốn chuyển trạng thái yêu cầu của bệnh nhân <strong id="reject-name" class="text-danger"></strong> sang <strong>Từ chối</strong>?</p>
          <div class="mb-3">
            <label for="reject-note" class="form-label fw-bold">Lý do từ chối (Ghi chú):</label>
            <textarea class="form-control" id="reject-note" name="note" rows="3" placeholder="Nhập lý do từ chối (VD: Hồ sơ chưa hợp lệ, Thiếu thông tin khám...)" required></textarea>
          </div>
        </div>
        <div class="modal-footer bg-light" style="border-radius: 0 0 16px 16px;">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
          <button type="submit" class="btn btn-danger px-4 fw-bold">Xác nhận Từ Chối</button>
        </div>
      </form>
    </div>
  </div>
</div>

<!-- Form Submit Ẩn cho Ajax/Action -->
<form id="formActionTT25" method="POST" action="<?php echo XC_URL; ?>/admin/tt25documents" style="display:none;">
  <input type="hidden" name="tt25_action" id="action-type" value="">
  <input type="hidden" name="id" id="action-id" value="">
</form>

<script>
document.addEventListener('DOMContentLoaded', function() {
    const adminUrl = "<?php echo XC_URL; ?>/admin/tt25documents";

    // 1. THAO TÁC NÚT TÍCH HOÀN THÀNH QUICK CHECK
    document.querySelectorAll('.btn-complete-tt25').forEach(function(btn) {
        btn.addEventListener('click', function() {
            const reqId = this.getAttribute('data-id');
            const patientName = this.getAttribute('data-name') || 'Bệnh nhân';

            if(typeof Swal !== 'undefined') {
                Swal.fire({
                    title: 'Xác nhận hoàn thành?',
                    text: 'Cập nhật trạng thái yêu cầu của "' + patientName + '" sang "Hoàn thành"?',
                    icon: 'question',
                    showCancelButton: true,
                    confirmButtonColor: '#10b981',
                    cancelButtonColor: '#6b7280',
                    confirmButtonText: 'Đồng ý, hoàn thành!',
                    cancelButtonText: 'Hủy'
                }).then((result) => {
                    if (result.isConfirmed) {
                        postTT25Action('complete', reqId);
                    }
                });
            } else {
                if(confirm('Xác nhận cập nhật trạng thái yêu cầu của "' + patientName + '" sang "Hoàn thành"?')) {
                    postTT25Action('complete', reqId);
                }
            }
        });
    });

    // 2. NÚT XEM CHI TIẾT
    document.querySelectorAll('.btn-detail-tt25').forEach(function(btn) {
        btn.addEventListener('click', function() {
            document.getElementById('dt-fullname').innerText = this.getAttribute('data-fullname') || '---';
            document.getElementById('dt-cccd').innerText = this.getAttribute('data-cccd') || '---';
            document.getElementById('dt-dob').innerText = this.getAttribute('data-dob') || '---';
            document.getElementById('dt-phone').innerText = this.getAttribute('data-phone') || '---';
            document.getElementById('dt-bhyt').innerText = this.getAttribute('data-bhyt') || 'Chưa cung cấp';
            document.getElementById('dt-email').innerText = this.getAttribute('data-email') || '---';
            document.getElementById('dt-category').innerText = this.getAttribute('data-category') || '---';
            document.getElementById('dt-created').innerText = this.getAttribute('data-created') || '---';
            
            const st = parseInt(this.getAttribute('data-status'));
            let stHtml = '<span class="badge bg-warning text-dark">Mới tiếp nhận</span>';
            if(st === 1) {
                stHtml = '<span class="badge bg-success">Hoàn thành</span>';
            } else if(st === 2) {
                stHtml = '<span class="badge bg-danger">Từ chối</span>';
            }
            document.getElementById('dt-status').innerHTML = stHtml;

            const note = this.getAttribute('data-note');
            const noteRow = document.getElementById('dt-note-row');
            if(note && note.trim() !== '') {
                document.getElementById('dt-note').innerText = note;
                noteRow.style.display = '';
            } else {
                noteRow.style.display = 'none';
            }

            const modal = new bootstrap.Modal(document.getElementById('modalDetailTT25'));
            modal.show();
        });
    });

    // 3. NÚT TỪ CHỐI
    document.querySelectorAll('.btn-reject-tt25').forEach(function(btn) {
        btn.addEventListener('click', function() {
            const reqId = this.getAttribute('data-id');
            const patientName = this.getAttribute('data-name') || '';

            document.getElementById('reject-id').value = reqId;
            document.getElementById('reject-name').innerText = patientName;
            document.getElementById('reject-note').value = '';

            const modal = new bootstrap.Modal(document.getElementById('modalRejectTT25'));
            modal.show();
        });
    });

    // 4. NÚT XÓA
    document.querySelectorAll('.btn-delete-tt25').forEach(function(btn) {
        btn.addEventListener('click', function() {
            const reqId = this.getAttribute('data-id');
            const patientName = this.getAttribute('data-name') || 'Bệnh nhân';

            if(typeof Swal !== 'undefined') {
                Swal.fire({
                    title: 'Xác nhận xóa?',
                    text: 'Bạn có chắc chắn muốn xóa bản ghi yêu cầu của "' + patientName + '"?',
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#ef4444',
                    cancelButtonColor: '#6b7280',
                    confirmButtonText: 'Đồng ý xóa!',
                    cancelButtonText: 'Hủy'
                }).then((result) => {
                    if (result.isConfirmed) {
                        postTT25Action('delete', reqId);
                    }
                });
            } else {
                if(confirm('Bạn có chắc chắn muốn xóa bản ghi yêu cầu của "' + patientName + '"?')) {
                    postTT25Action('delete', reqId);
                }
            }
        });
    });

    function postTT25Action(action, id) {
        const formData = new FormData();
        formData.append('tt25_action', action);
        formData.append('id', id);
        formData.append('is_ajax', '1');

        fetch(adminUrl, {
            method: 'POST',
            headers: {
                'X-Requested-With': 'XMLHttpRequest'
            },
            body: formData
        })
        .then(res => res.json())
        .then(data => {
            if(data.status === 'success') {
                if(typeof Swal !== 'undefined') {
                    Swal.fire({
                        icon: 'success',
                        title: 'Thành công!',
                        text: data.message,
                        timer: 1500,
                        showConfirmButton: false
                    }).then(() => {
                        window.location.reload();
                    });
                } else {
                    window.location.reload();
                }
            } else {
                alert(data.message || 'Có lỗi xảy ra.');
            }
        })
        .catch(err => {
            // Fallback submit form
            document.getElementById('action-type').value = action;
            document.getElementById('action-id').value = id;
            document.getElementById('formActionTT25').submit();
        });
    }
});
</script>

<?php require "footer.php"; ?>
