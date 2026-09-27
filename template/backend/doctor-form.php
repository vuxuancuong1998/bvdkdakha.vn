<?php include_once "header.php";
$doctor_edit = isset($doctor_edit) && is_object($doctor_edit) ? $doctor_edit : (object) array(
	'id' => 0,
	'department_id' => 0,
	'fullname' => '',
	'dob' => '',
	'hometown' => '',
	'cccd' => '',
	'cchn' => '',
	'position' => '',
	'job_title_code' => '',
	'workplace' => 'Bệnh viện Đa khoa Khu vực Đắk Hà',
	'code' => '',
	'avatar' => '',
	'status' => 1
);
$departments = is_array($departments) ? $departments : array();
$isEdit = (int)$doctor_edit->id > 0;
$hasAvatar = !empty($doctor_edit->avatar) && file_exists(__SITE_PATH . '/uploads/doctors/' . $doctor_edit->avatar);
$avatarUrl = $hasAvatar 
   ? XC_URL . '/uploads/doctors/' . htmlspecialchars($doctor_edit->avatar, ENT_QUOTES, 'UTF-8')
   : XC_URL . '/template/frontend/assets/images/doctor-01.jpg';
?>

<div class="content container-fluid">
   <div class="page-header">
      <div class="row align-items-center">
         <div class="col">
            <h3 class="page-title"><?php echo $isEdit ? 'Cập nhật thông tin Bác sĩ' : 'Thêm Bác sĩ mới'; ?></h3>
            <ul class="breadcrumb">
               <li class="breadcrumb-item"><a href="<?php echo XC_URL; ?>/admin/doctors">Đội ngũ Bác sĩ</a></li>
               <li class="breadcrumb-item active"><?php echo $isEdit ? 'Cập nhật' : 'Thêm mới'; ?></li>
            </ul>
         </div>
      </div>
   </div>

   <?php if(!empty($doctor_flash)): ?>
      <div class="alert alert-<?php echo $doctor_flash['type'] == 'success' ? 'success' : 'danger'; ?> alert-dismissible fade show" role="alert">
         <?php echo htmlspecialchars($doctor_flash['message']); ?>
         <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
      </div>
   <?php endif; ?>

   <form method="post" action="<?php echo XC_URL; ?>/admin/doctors" enctype="multipart/form-data">
      <input type="hidden" name="id" value="<?php echo (int)$doctor_edit->id; ?>">
      <input type="hidden" name="doctor_action" value="save">

      <div class="row">
         <!-- Thông tin chuyên môn & hành chính -->
         <div class="col-lg-8">
            <div class="card mb-4">
               <div class="card-header bg-light">
                  <h5 class="card-title mb-0"><i class="fa-solid fa-user-doctor me-2 text-primary"></i>Thông tin bác sĩ (Theo biểu mẫu)</h5>
               </div>
               <div class="card-body">
                  <div class="row g-3">
                     <div class="col-md-7">
                        <label class="form-label fw-bold">Họ và tên <span class="text-danger">*</span></label>
                        <input type="text" class="form-control" name="fullname" value="<?php echo htmlspecialchars((string)$doctor_edit->fullname, ENT_QUOTES, 'UTF-8'); ?>" placeholder="Ví dụ: BSCKI. Nguyễn Văn An" required>
                     </div>

                     <div class="col-md-5">
                        <label class="form-label fw-bold">Ngày sinh</label>
                        <input type="date" class="form-control" name="dob" value="<?php echo !empty($doctor_edit->dob) && $doctor_edit->dob !== '0000-00-00' ? htmlspecialchars(date('Y-m-d', strtotime($doctor_edit->dob)), ENT_QUOTES, 'UTF-8') : ''; ?>">
                     </div>

                     <div class="col-md-6">
                        <label class="form-label">Quê quán</label>
                        <input type="text" class="form-control" name="hometown" value="<?php echo htmlspecialchars((string)(isset($doctor_edit->hometown) ? $doctor_edit->hometown : ''), ENT_QUOTES, 'UTF-8'); ?>" placeholder="Ví dụ: Đắk Hà, Kon Tum">
                     </div>

                     <div class="col-md-6">
                        <label class="form-label">Số căn cước công dân (CCCD)</label>
                        <input type="text" class="form-control" name="cccd" value="<?php echo htmlspecialchars((string)$doctor_edit->cccd, ENT_QUOTES, 'UTF-8'); ?>" placeholder="Số CCCD 12 số">
                     </div>

                     <div class="col-md-6">
                        <label class="form-label fw-bold">Chức vụ <span class="text-danger">*</span></label>
                        <input type="text" class="form-control" name="position" value="<?php echo htmlspecialchars((string)$doctor_edit->position, ENT_QUOTES, 'UTF-8'); ?>" placeholder="Ví dụ: Giám đốc, Trưởng khoa, Bác sĩ CKI..." required>
                     </div>

                     <div class="col-md-6">
                        <label class="form-label">Mã ngạch / mã chức danh nghề nghiệp</label>
                        <input type="text" class="form-control" name="job_title_code" value="<?php echo htmlspecialchars((string)(isset($doctor_edit->job_title_code) ? $doctor_edit->job_title_code : ''), ENT_QUOTES, 'UTF-8'); ?>" placeholder="Ví dụ: V.08.01.02">
                     </div>

                     <div class="col-md-6">
                        <label class="form-label fw-bold">Phòng ban, đơn vị công tác (Khoa/Phòng) <span class="text-danger">*</span></label>
                        <select name="department_id" class="form-select" required>
                           <option value="">-- Chọn Khoa / Phòng ban --</option>
                           <?php foreach($departments as $dept): ?>
                              <option value="<?php echo (int)$dept->id; ?>" <?php echo (int)$doctor_edit->department_id === (int)$dept->id ? 'selected' : ''; ?>>
                                 <?php echo htmlspecialchars($dept->depart_name, ENT_QUOTES, 'UTF-8'); ?>
                              </option>
                           <?php endforeach; ?>
                        </select>
                     </div>

                     <div class="col-md-6">
                        <label class="form-label">Đơn vị công tác</label>
                        <input type="text" class="form-control" name="workplace" value="<?php echo htmlspecialchars((string)(isset($doctor_edit->workplace) ? $doctor_edit->workplace : 'Bệnh viện Đa khoa Khu vực Đắk Hà'), ENT_QUOTES, 'UTF-8'); ?>" placeholder="Bệnh viện Đa khoa Khu vực Đắk Hà">
                     </div>

                     <div class="col-md-6">
                        <label class="form-label">Mã số (Mã nhân viên / Mã hồ sơ)</label>
                        <input type="text" class="form-control" name="code" value="<?php echo htmlspecialchars((string)(isset($doctor_edit->code) ? $doctor_edit->code : ''), ENT_QUOTES, 'UTF-8'); ?>" placeholder="Ví dụ: BS-001 hoặc số mã số">
                     </div>

                     <div class="col-md-6">
                        <label class="form-label">Số chứng chỉ hành nghề (CCHN - tùy chọn)</label>
                        <input type="text" class="form-control" name="cchn" value="<?php echo htmlspecialchars((string)$doctor_edit->cchn, ENT_QUOTES, 'UTF-8'); ?>" placeholder="Ví dụ: 012345/QNG-CCHN">
                     </div>
                  </div>
               </div>
            </div>
         </div>

         <!-- Ảnh đại diện & Trạng thái -->
         <div class="col-lg-4">
            <div class="card mb-4">
               <div class="card-header bg-light">
                  <h5 class="card-title mb-0"><i class="fa-solid fa-image me-2 text-primary"></i>Ảnh đại diện & Xuất bản</h5>
               </div>
               <div class="card-body">
                  <div class="mb-3 text-center">
                     <div class="position-relative d-inline-block mb-3">
                        <img id="avatarPreview" src="<?php echo $avatarUrl; ?>" alt="Xem trước ảnh" class="rounded-circle border border-3 border-light shadow-sm" style="width: 140px; height: 140px; object-fit: cover;">
                     </div>
                     <div class="text-muted small mb-2">Định dạng hỗ trợ: JPG, PNG, WEBP (tối đa 5MB)</div>
                     <input type="file" class="form-control form-control-sm" name="avatar" id="avatarInput" accept="image/jpeg,image/png,image/webp">
                  </div>

                  <div class="mb-4">
                     <label class="form-label fw-bold">Trạng thái hiển thị</label>
                     <select name="status" class="form-select">
                        <option value="1" <?php echo (int)$doctor_edit->status === 1 ? 'selected' : ''; ?>>Hiển thị trên website</option>
                        <option value="0" <?php echo (int)$doctor_edit->status === 0 ? 'selected' : ''; ?>>Ẩn (không hiển thị)</option>
                     </select>
                  </div>

                  <div class="d-grid gap-2">
                     <button type="submit" class="btn btn-primary btn-lg">
                        <i class="fa-solid fa-floppy-disk me-1"></i> <?php echo $isEdit ? 'Lưu thay đổi' : 'Thêm bác sĩ'; ?>
                     </button>
                     <a href="<?php echo XC_URL; ?>/admin/doctors" class="btn btn-outline-secondary">
                        <i class="fa-solid fa-arrow-left me-1"></i> Quay lại danh sách
                     </a>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </form>
</div>

<script>
document.addEventListener('DOMContentLoaded', function () {
   var avatarInput = document.getElementById('avatarInput');
   var avatarPreview = document.getElementById('avatarPreview');
   if (avatarInput && avatarPreview) {
      avatarInput.addEventListener('change', function (e) {
         var file = e.target.files[0];
         if (file) {
            var reader = new FileReader();
            reader.onload = function (evt) {
               avatarPreview.src = evt.target.result;
            };
            reader.readAsDataURL(file);
         }
      });
   }
});
</script>

<?php include_once "footer.php"; ?>
