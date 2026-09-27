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
            <h3 class="page-title">Quản lý đội ngũ Bác sĩ</h3>
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
                  <input type="text" name="keyword" class="form-control" placeholder="Tìm tên, CCCD, CCHN, chức vụ..." value="<?php echo htmlspecialchars($keyword, ENT_QUOTES, 'UTF-8'); ?>">
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
                        $hasAvatar = !empty($item->avatar) && file_exists(__SITE_PATH . '/uploads/doctors/' . $item->avatar);
                        $avatarSrc = $hasAvatar 
                           ? XC_URL . '/uploads/doctors/' . htmlspecialchars($item->avatar, ENT_QUOTES, 'UTF-8')
                           : XC_URL . '/template/frontend/assets/images/doctor-01.jpg';
                     ?>
                        <tr>
                           <td><?php echo $stt++; ?></td>
                           <td>
                              <img src="<?php echo $avatarSrc; ?>" alt="<?php echo htmlspecialchars($item->fullname, ENT_QUOTES, 'UTF-8'); ?>" class="rounded-circle border" style="width: 44px; height: 44px; object-fit: cover;">
                           </td>
                           <td>
                              <span class="fw-bold text-dark d-block"><?php echo htmlspecialchars($item->fullname, ENT_QUOTES, 'UTF-8'); ?></span>
                              <?php if(!empty($item->code)): ?>
                                 <small class="badge bg-light text-secondary border">Mã: <?php echo htmlspecialchars($item->code, ENT_QUOTES, 'UTF-8'); ?></small>
                              <?php endif; ?>
                           </td>
                           <td>
                              <?php echo !empty($item->dob) && $item->dob !== '0000-00-00' ? htmlspecialchars(date('d/m/Y', strtotime($item->dob)), ENT_QUOTES, 'UTF-8') : '<span class="text-muted">-</span>'; ?>
                           </td>
                           <td>
                              <?php echo !empty($item->hometown) ? htmlspecialchars($item->hometown, ENT_QUOTES, 'UTF-8') : '<span class="text-muted">-</span>'; ?>
                           </td>
                           <td>
                              <?php echo !empty($item->cccd) ? htmlspecialchars($item->cccd, ENT_QUOTES, 'UTF-8') : '<span class="text-muted">-</span>'; ?>
                           </td>
                           <td>
                              <span class="badge bg-primary-subtle text-primary border border-primary-subtle px-2 py-1">
                                 <?php echo htmlspecialchars($item->position, ENT_QUOTES, 'UTF-8'); ?>
                              </span>
                           </td>
                           <td>
                              <?php echo !empty($item->job_title_code) ? '<span class="badge bg-info-subtle text-info border border-info-subtle">' . htmlspecialchars($item->job_title_code, ENT_QUOTES, 'UTF-8') . '</span>' : '<span class="text-muted">-</span>'; ?>
                           </td>
                           <td>
                              <span class="fw-semibold text-secondary">
                                 <?php echo htmlspecialchars($item->depart_name ?: 'Chưa phân khoa', ENT_QUOTES, 'UTF-8'); ?>
                              </span>
                           </td>
                           <td>
                              <small class="text-muted"><?php echo htmlspecialchars(!empty($item->workplace) ? $item->workplace : 'BVĐK Đắk Hà', ENT_QUOTES, 'UTF-8'); ?></small>
                           </td>
                           <td>
                              <?php echo !empty($item->code) ? htmlspecialchars($item->code, ENT_QUOTES, 'UTF-8') : (!empty($item->cchn) ? htmlspecialchars($item->cchn, ENT_QUOTES, 'UTF-8') : '<span class="text-muted">-</span>'); ?>
                           </td>
                           <td>
                              <?php if((int)$item->status === 1): ?>
                                 <span class="badge bg-success">Hoạt động</span>
                              <?php else: ?>
                                 <span class="badge bg-secondary">Đang ẩn</span>
                              <?php endif; ?>
                           </td>
                           <td class="text-end">
                              <div class="d-flex align-items-center justify-content-end gap-1">
                                 <a class="btn btn-sm btn-outline-warning" href="<?php echo XC_URL; ?>/admin/doctors/toggle/<?php echo (int)$item->id; ?>" title="<?php echo (int)$item->status === 1 ? 'Bấm để ẩn' : 'Bấm để hiển thị'; ?>">
                                    <i class="fa-solid <?php echo (int)$item->status === 1 ? 'fa-eye-slash' : 'fa-eye'; ?>"></i>
                                 </a>
                                 <a class="btn btn-sm btn-outline-info" href="<?php echo XC_URL; ?>/admin/doctors/edit/<?php echo (int)$item->id; ?>" title="Sửa thông tin">
                                    <i class="fa-solid fa-pen-to-square"></i>
                                 </a>
                                 <a class="btn btn-sm btn-outline-danger" href="<?php echo XC_URL; ?>/admin/doctors/delete/<?php echo (int)$item->id; ?>" onclick="return confirm('Bạn có chắc chắn muốn xóa bác sĩ \'<?php echo addslashes($item->fullname); ?>\'? Hành động này không thể hoàn tác.')" title="Xóa bác sĩ">
                                    <i class="fa-solid fa-trash"></i>
                                 </a>
                              </div>
                           </td>
                        </tr>
                     <?php endforeach; ?>
                  <?php else: ?>
                     <tr>
                        <td colspan="10" class="text-center text-muted py-4">
                           <i class="fa-solid fa-user-doctor fa-2x mb-2 d-block text-secondary opacity-50"></i>
                           Chưa có dữ liệu bác sĩ nào phù hợp.
                        </td>
                     </tr>
                  <?php endif; ?>
               </tbody>
            </table>
         </div>

         <!-- Phân trang -->
         <?php if ($total_pages > 1): ?>
            <div class="d-flex justify-content-between align-items-center mt-4">
               <div class="text-muted small">
                  Hiển thị <?php echo count($doctors); ?> / <?php echo $total_results; ?> bác sĩ
               </div>
               <nav aria-label="Phân trang bác sĩ">
                  <ul class="pagination mb-0">
                     <?php foreach (backendDoctorPaginationItems($page, $total_pages) as $paginationItem): ?>
                        <?php if ($paginationItem === 'ellipsis'): ?>
                           <li class="page-item disabled"><span class="page-link">...</span></li>
                        <?php elseif ((int)$paginationItem === $page): ?>
                           <li class="page-item active"><span class="page-link"><?php echo (int)$paginationItem; ?></span></li>
                        <?php else: ?>
                           <li class="page-item"><a class="page-link" href="<?php echo htmlspecialchars(backendDoctorPageUrl((int)$paginationItem, $keyword, $selected_department_id, $selected_status), ENT_QUOTES, 'UTF-8'); ?>"><?php echo (int)$paginationItem; ?></a></li>
                        <?php endif; ?>
                     <?php endforeach; ?>
                  </ul>
               </nav>
            </div>
         <?php endif; ?>
      </div>
   </div>
</div>

<?php include_once "footer.php"; ?>
