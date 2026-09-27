<?php include_once "header.php";
$doctors = is_array($doctors) ? $doctors : array();
$departments = is_array($departments) ? $departments : array();
$page = isset($doctor_page) ? (int)$doctor_page : 1;
$per_page = isset($doctor_per_page) ? (int)$doctor_per_page : 20;
$total_results = isset($doctor_total) ? (int)$doctor_total : count($doctors);
$total_pages = isset($doctor_total_pages) ? (int)$doctor_total_pages : 1;
$row_offset = max(0, ($page - 1) * $per_page);
$selected_department_id = isset($selected_department_id) ? (int)$selected_department_id : 0;
$selected_status = isset($selected_status) ? (int)$selected_status : -1;
$keyword = isset($keyword) ? (string)$keyword : '';

if (!function_exists('backendDoctorPageUrl')) {
	function backendDoctorPageUrl($targetPage, $keyword, $deptId, $status) {
		$params = array('page' => (int)$targetPage);
		if ($keyword !== '') { $params['keyword'] = $keyword; }
		if ($deptId > 0) { $params['department_id'] = $deptId; }
		if ($status >= 0) { $params['status'] = $status; }
		return XC_URL.'/admin/doctors?' . http_build_query($params);
	}
}

if (!function_exists('backendDoctorPaginationItems')) {
	function backendDoctorPaginationItems($currentPage, $totalPages) {
		$currentPage = max(1, (int)$currentPage);
		$totalPages = max(1, (int)$totalPages);
		if ($totalPages <= 7) { return range(1, $totalPages); }
		if ($currentPage <= 4) { return array(1, 2, 3, 4, 5, 'ellipsis', $totalPages); }
		if ($currentPage >= $totalPages - 3) { return array(1, 'ellipsis', $totalPages - 4, $totalPages - 3, $totalPages - 2, $totalPages - 1, $totalPages); }
		return array(1, 'ellipsis', $currentPage - 1, $currentPage, $currentPage + 1, 'ellipsis', $totalPages);
	}
}
?>

<div class="content container-fluid">
   <div class="page-header">
      <div class="row align-items-center">
         <div class="col">
            <h3 class="page-title">Quản lý đội ngũ Bác sĩ / Cán bộ y tế</h3>
            <ul class="breadcrumb">
               <li class="breadcrumb-item"><a href="<?php echo XC_URL; ?>/admin">Trang chủ</a></li>
               <li class="breadcrumb-item active">Đội ngũ Bác sĩ</li>
            </ul>
         </div>
         <div class="col-auto">
            <a href="<?php echo XC_URL; ?>/admin/doctors/add" class="btn btn-primary">
               <i class="fa-solid fa-plus me-1"></i> Thêm bác sĩ mới
            </a>
         </div>
      </div>
   </div>

   <?php if(!empty($doctor_flash)): ?>
      <div class="alert alert-<?php echo $doctor_flash['type'] == 'success' ? 'success' : 'danger'; ?> alert-dismissible fade show" role="alert">
         <?php echo htmlspecialchars($doctor_flash['message']); ?>
         <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
      </div>
   <?php endif; ?>

   <!-- Bộ lọc & Tìm kiếm -->
   <div class="card mb-3">
      <div class="card-body">
         <form method="get" action="<?php echo XC_URL; ?>/admin/doctors" class="row g-2 align-items-center">
            <div class="col-md-4">
               <div class="input-group">
                  <span class="input-group-text"><i class="fa fa-search"></i></span>
                  <input type="text" name="keyword" class="form-control" placeholder="Tìm tên, CCCD, mã số, chức vụ, quê quán..." value="<?php echo htmlspecialchars($keyword, ENT_QUOTES, 'UTF-8'); ?>">
               </div>
            </div>
            <div class="col-md-3">
               <select name="department_id" class="form-select">
                  <option value="0">-- Tất cả Khoa / Phòng --</option>
                  <?php foreach($departments as $dept): ?>
                     <option value="<?php echo (int)$dept->id; ?>" <?php echo $selected_department_id === (int)$dept->id ? 'selected' : ''; ?>>
                        <?php echo htmlspecialchars($dept->depart_name, ENT_QUOTES, 'UTF-8'); ?>
                     </option>
                  <?php endforeach; ?>
               </select>
            </div>
            <div class="col-md-3">
               <select name="status" class="form-select">
                  <option value="-1">-- Tất cả trạng thái --</option>
                  <option value="1" <?php echo $selected_status === 1 ? 'selected' : ''; ?>>Đang hoạt động (Hiển thị)</option>
                  <option value="0" <?php echo $selected_status === 0 ? 'selected' : ''; ?>>Đang ẩn</option>
               </select>
            </div>
            <div class="col-md-2 d-flex gap-2">
               <button type="submit" class="btn btn-info text-white flex-grow-1"><i class="fa fa-filter me-1"></i> Lọc</button>
               <a href="<?php echo XC_URL; ?>/admin/doctors" class="btn btn-outline-secondary" title="Đặt lại"><i class="fa fa-rotate-left"></i></a>
            </div>
         </form>
      </div>
   </div>

   <!-- Bảng danh sách bác sĩ -->
   <div class="card card-table">
      <div class="card-body">
         <div class="table-responsive">
            <table class="table table-hover table-center mb-0 align-middle">
               <thead class="table-light">
                  <tr>
                     <th style="width: 50px;">STT</th>
                     <th style="width: 70px;">Ảnh</th>
                     <th>Họ và tên</th>
                     <th>Ngày sinh</th>
                     <th>Quê quán</th>
                     <th>Số CCCD</th>
                     <th>Chức vụ</th>
                     <th>Mã ngạch/CDNN</th>
                     <th>Phòng ban</th>
                     <th>Đơn vị công tác</th>
                     <th>Mã số</th>
                     <th>Trạng thái</th>
                     <th style="width: 130px;" class="text-end">Thao tác</th>
                  </tr>
               </thead>
               <tbody>
                  <?php if (!empty($doctors)): ?>
                     <?php $stt = $row_offset + 1; foreach($doctors as $item): 
                        $itemName = !empty($item->doctor_name) ? $item->doctor_name : (!empty($item->fullname) ? $item->fullname : '');
                        $itemPosition = !empty($item->doctor_position) ? $item->doctor_position : (!empty($item->position) ? $item->position : '');
                        $itemWorkplace = !empty($item->doctor_workplace) ? $item->doctor_workplace : (!empty($item->workplace) ? $item->workplace : 'Bệnh viện Đa khoa khu vực Đắk Hà');
                        $itemAvatar = !empty($item->doctor_avatar) ? $item->doctor_avatar : (!empty($item->avatar) ? $item->avatar : '');
                        $itemDob = !empty($item->doctor_dob) ? $item->doctor_dob : (!empty($item->dob) ? $item->dob : '');
                        $itemHometown = !empty($item->doctor_hometown) ? $item->doctor_hometown : (!empty($item->hometown) ? $item->hometown : '');
                        $itemCccd = !empty($item->doctor_cccd) ? $item->doctor_cccd : (!empty($item->cccd) ? $item->cccd : '');
                        $itemJobCode = !empty($item->doctor_job_title_code) ? $item->doctor_job_title_code : (!empty($item->job_title_code) ? $item->job_title_code : '');
                        $itemCode = !empty($item->doctor_code) ? $item->doctor_code : (!empty($item->code) ? $item->code : '');
                        $itemStatus = isset($item->doctor_status) ? (int)$item->doctor_status : (isset($item->status) ? (int)$item->status : 1);

                        $hasAvatar = !empty($itemAvatar) && file_exists(__SITE_PATH . '/uploads/doctors/' . $itemAvatar);
                        $avatarSrc = $hasAvatar 
                           ? XC_URL . '/uploads/doctors/' . htmlspecialchars($itemAvatar, ENT_QUOTES, 'UTF-8')
                           : XC_URL . '/template/frontend/assets/images/doctor-01.jpg';
                     ?>
                        <tr>
                           <td><?php echo $stt++; ?></td>
                           <td>
                              <img src="<?php echo $avatarSrc; ?>" alt="<?php echo htmlspecialchars($itemName, ENT_QUOTES, 'UTF-8'); ?>" class="rounded-circle border" style="width: 44px; height: 44px; object-fit: cover;">
                           </td>
                           <td>
                              <span class="fw-bold text-dark d-block"><?php echo htmlspecialchars($itemName, ENT_QUOTES, 'UTF-8'); ?></span>
                              <?php if(!empty($itemCode)): ?>
                                 <small class="badge bg-light text-secondary border">Mã: <?php echo htmlspecialchars($itemCode, ENT_QUOTES, 'UTF-8'); ?></small>
                              <?php endif; ?>
                           </td>
                           <td>
                              <?php echo !empty($itemDob) && $itemDob !== '0000-00-00' ? htmlspecialchars(date('d/m/Y', strtotime($itemDob)), ENT_QUOTES, 'UTF-8') : '<span class="text-muted">-</span>'; ?>
                           </td>
                           <td>
                              <?php echo !empty($itemHometown) ? htmlspecialchars($itemHometown, ENT_QUOTES, 'UTF-8') : '<span class="text-muted">-</span>'; ?>
                           </td>
                           <td>
                              <?php echo !empty($itemCccd) ? htmlspecialchars($itemCccd, ENT_QUOTES, 'UTF-8') : '<span class="text-muted">-</span>'; ?>
                           </td>
                           <td>
                              <span class="badge bg-primary-subtle text-primary border border-primary-subtle px-2 py-1">
                                 <?php echo htmlspecialchars($itemPosition, ENT_QUOTES, 'UTF-8'); ?>
                              </span>
                           </td>
                           <td>
                              <?php echo !empty($itemJobCode) ? '<span class="badge bg-info-subtle text-info border border-info-subtle">' . htmlspecialchars($itemJobCode, ENT_QUOTES, 'UTF-8') . '</span>' : '<span class="text-muted">-</span>'; ?>
                           </td>
                           <td>
                              <span class="fw-semibold text-secondary">
                                 <?php echo htmlspecialchars($item->depart_name ?: 'Chưa phân khoa', ENT_QUOTES, 'UTF-8'); ?>
                              </span>
                           </td>
                           <td>
                              <small class="text-muted"><?php echo htmlspecialchars($itemWorkplace, ENT_QUOTES, 'UTF-8'); ?></small>
                           </td>
                           <td>
                              <?php echo !empty($itemCode) ? htmlspecialchars($itemCode, ENT_QUOTES, 'UTF-8') : '<span class="text-muted">-</span>'; ?>
                           </td>
                           <td>
                              <?php if($itemStatus === 1): ?>
                                 <span class="badge bg-success">Hoạt động</span>
                              <?php else: ?>
                                 <span class="badge bg-secondary">Đang ẩn</span>
                              <?php endif; ?>
                           </td>
                           <td class="text-end">
                              <div class="d-flex align-items-center justify-content-end gap-1">
                                 <a class="btn btn-sm btn-outline-warning" href="<?php echo XC_URL; ?>/admin/doctors/toggle/<?php echo (int)$item->id; ?>" title="<?php echo $itemStatus === 1 ? 'Bấm để ẩn' : 'Bấm để hiển thị'; ?>">
                                    <i class="fa-solid <?php echo $itemStatus === 1 ? 'fa-eye-slash' : 'fa-eye'; ?>"></i>
                                 </a>
                                 <a class="btn btn-sm btn-outline-primary" href="<?php echo XC_URL; ?>/admin/doctors/edit/<?php echo (int)$item->id; ?>" title="Chỉnh sửa">
                                    <i class="fa-solid fa-pen-to-square"></i>
                                 </a>
                                 <a class="btn btn-sm btn-outline-danger" href="<?php echo XC_URL; ?>/admin/doctors/delete/<?php echo (int)$item->id; ?>" onclick="return confirm('Bạn có chắc chắn muốn xóa cán bộ / bác sĩ này không?');" title="Xóa">
                                    <i class="fa-solid fa-trash"></i>
                                 </a>
                              </div>
                           </td>
                        </tr>
                     <?php endforeach; ?>
                  <?php else: ?>
                     <tr>
                        <td colspan="13" class="text-center py-4 text-muted">
                           <i class="fa fa-info-circle me-1"></i> Chưa có dữ liệu bác sĩ nào phù hợp điều kiện lọc.
                        </td>
                     </tr>
                  <?php endif; ?>
               </tbody>
            </table>
         </div>

         <!-- Phân trang -->
         <?php if ($total_pages > 1): ?>
            <div class="card-footer d-flex align-items-center justify-content-between flex-wrap gap-2">
               <div class="text-muted small">
                  Hiển thị từ <strong><?php echo $row_offset + 1; ?></strong> đến <strong><?php echo min($row_offset + $per_page, $total_results); ?></strong> trong tổng số <strong><?php echo $total_results; ?></strong> cán bộ/bác sĩ
               </div>
               <nav aria-label="Phân trang danh sách bác sĩ">
                  <ul class="pagination pagination-sm mb-0">
                     <li class="page-item <?php echo $page <= 1 ? 'disabled' : ''; ?>">
                        <a class="page-link" href="<?php echo backendDoctorPageUrl(max(1, $page - 1), $keyword, $selected_department_id, $selected_status); ?>" aria-label="Trang trước">
                           &laquo;
                        </a>
                     </li>
                     <?php foreach(backendDoctorPaginationItems($page, $total_pages) as $pageItem): ?>
                        <?php if ($pageItem === 'ellipsis'): ?>
                           <li class="page-item disabled"><span class="page-link">…</span></li>
                        <?php else: ?>
                           <li class="page-item <?php echo (int)$pageItem === $page ? 'active' : ''; ?>">
                              <a class="page-link" href="<?php echo backendDoctorPageUrl($pageItem, $keyword, $selected_department_id, $selected_status); ?>">
                                 <?php echo $pageItem; ?>
                              </a>
                           </li>
                        <?php endif; ?>
                     <?php endforeach; ?>
                     <li class="page-item <?php echo $page >= $total_pages ? 'disabled' : ''; ?>">
                        <a class="page-link" href="<?php echo backendDoctorPageUrl(min($total_pages, $page + 1), $keyword, $selected_department_id, $selected_status); ?>" aria-label="Trang sau">
                           &raquo;
                        </a>
                     </li>
                  </ul>
               </nav>
            </div>
         <?php endif; ?>
      </div>
   </div>
</div>

<?php include_once "footer.php"; ?>
