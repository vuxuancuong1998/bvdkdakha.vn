<?php include_once "header.php";
$doctor_edit = isset($doctor_edit) && is_object($doctor_edit) ? $doctor_edit : (object) array();

$doc_id = isset($doctor_edit->id) ? (int)$doctor_edit->id : 0;
$doc_name = isset($doctor_edit->doctor_name) ? $doctor_edit->doctor_name : (isset($doctor_edit->fullname) ? $doctor_edit->fullname : '');
$doc_position = isset($doctor_edit->doctor_position) ? $doctor_edit->doctor_position : (isset($doctor_edit->position) ? $doctor_edit->position : '');
$doc_workplace = isset($doctor_edit->doctor_workplace) && $doctor_edit->doctor_workplace !== '' ? $doctor_edit->doctor_workplace : (isset($doctor_edit->workplace) && $doctor_edit->workplace !== '' ? $doctor_edit->workplace : 'Bệnh viện Đa khoa khu vực Đắk Hà');
$doc_dept_id = isset($doctor_edit->doctor_department_id) ? (int)$doctor_edit->doctor_department_id : (isset($doctor_edit->department_id) ? (int)$doctor_edit->department_id : 0);
$doc_dob = isset($doctor_edit->doctor_dob) ? $doctor_edit->doctor_dob : (isset($doctor_edit->dob) ? $doctor_edit->dob : '');
$doc_hometown = isset($doctor_edit->doctor_hometown) ? $doctor_edit->doctor_hometown : (isset($doctor_edit->hometown) ? $doctor_edit->hometown : '');
$doc_cccd = isset($doctor_edit->doctor_cccd) ? $doctor_edit->doctor_cccd : (isset($doctor_edit->cccd) ? $doctor_edit->cccd : '');
$doc_cchn = isset($doctor_edit->doctor_cchn) ? $doctor_edit->doctor_cchn : (isset($doctor_edit->cchn) ? $doctor_edit->cchn : '');
$doc_job_title_code = isset($doctor_edit->doctor_job_title_code) ? $doctor_edit->doctor_job_title_code : (isset($doctor_edit->job_title_code) ? $doctor_edit->job_title_code : '');
$doc_code = isset($doctor_edit->doctor_code) ? $doctor_edit->doctor_code : (isset($doctor_edit->code) ? $doctor_edit->code : '');
$doc_avatar = isset($doctor_edit->doctor_avatar) ? $doctor_edit->doctor_avatar : (isset($doctor_edit->avatar) ? $doctor_edit->avatar : '');
$doc_status = isset($doctor_edit->doctor_status) ? (int)$doctor_edit->doctor_status : (isset($doctor_edit->status) ? (int)$doctor_edit->status : 1);

$departments = is_array($departments) ? $departments : array();
$isEdit = $doc_id > 0;
$hasAvatar = !empty($doc_avatar) && file_exists(__SITE_PATH . '/uploads/doctors/' . $doc_avatar);
$avatarUrl = $hasAvatar 
   ? XC_URL . '/uploads/doctors/' . htmlspecialchars($doc_avatar, ENT_QUOTES, 'UTF-8')
   : XC_URL . '/template/frontend/assets/images/doctor-01.jpg';
?>

<div class="content container-fluid">
   <div class="page-header">
      <div class="row align-items-center">
         <div class="col">
            <h3 class="page-title"><?php echo $isEdit ? 'Chỉnh sửa thông tin Bác sĩ / Cán bộ' : 'Thêm mới Bác sĩ / Cán bộ'; ?></h3>
            <ul class="breadcrumb">
               <li class="breadcrumb-item"><a href="<?php echo XC_URL; ?>/admin">Trang chủ</a></li>
               <li class="breadcrumb-item"><a href="<?php echo XC_URL; ?>/admin/doctors">Đội ngũ Bác sĩ</a></li>
               <li class="breadcrumb-item active"><?php echo $isEdit ? 'Chỉnh sửa' : 'Thêm mới'; ?></li>
            </ul>
         </div>
         <div class="col-auto">
            <a href="<?php echo XC_URL; ?>/admin/doctors" class="btn btn-outline-secondary">
               <i class="fa-solid fa-arrow-left me-1"></i> Quay lại danh sách
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

   <form action="<?php echo XC_URL; ?>/admin/doctors" method="POST" enctype="multipart/form-data">
      <input type="hidden" name="id" value="<?php echo $doc_id; ?>">
      <input type="hidden" name="doctor_action" value="save">

      <div class="row">
         <!-- Thông tin chuyên môn & hành chính -->
         <div class="col-lg-8">
            <div class="card mb-4">
               <div class="card-header bg-light">
                  <h5 class="card-title mb-0"><i class="fa-solid fa-user-doctor me-2 text-primary"></i>Thông tin cán bộ / bác sĩ (10 thuộc tính chuẩn)</h5>
               </div>
               <div class="card-body">
                  <div class="row g-3">
                     <div class="col-md-7">
                        <label class="form-label fw-bold">Họ và tên <span class="text-danger">*</span></label>
                        <input type="text" class="form-control" name="doctor_name" value="<?php echo htmlspecialchars((string)$doc_name, ENT_QUOTES, 'UTF-8'); ?>" placeholder="Ví dụ: BSCKI. Lê Quý Phương" required>
                     </div>

                     <div class="col-md-5">
                        <label class="form-label fw-bold">Ngày sinh</label>
                        <input type="date" class="form-control" name="doctor_dob" value="<?php echo !empty($doc_dob) && $doc_dob !== '0000-00-00' ? htmlspecialchars(date('Y-m-d', strtotime($doc_dob)), ENT_QUOTES, 'UTF-8') : ''; ?>">
                     </div>

                     <div class="col-md-6">
                        <label class="form-label">Quê quán</label>
                        <input type="text" class="form-control" name="doctor_hometown" value="<?php echo htmlspecialchars((string)$doc_hometown, ENT_QUOTES, 'UTF-8'); ?>" placeholder="Ví dụ: Đắk Hà, Kon Tum">
                     </div>

                     <div class="col-md-6">
                        <label class="form-label">Số căn cước công dân (CCCD)</label>
                        <input type="text" class="form-control" name="doctor_cccd" value="<?php echo htmlspecialchars((string)$doc_cccd, ENT_QUOTES, 'UTF-8'); ?>" placeholder="Số CCCD 12 số">
                     </div>

                     <div class="col-md-6">
                        <label class="form-label fw-bold">Chức vụ <span class="text-danger">*</span></label>
                        <input type="text" class="form-control" name="doctor_position" value="<?php echo htmlspecialchars((string)$doc_position, ENT_QUOTES, 'UTF-8'); ?>" placeholder="Ví dụ: Giám đốc, Trưởng khoa, Bác sĩ CKI, Nhân viên..." required>
                     </div>

                     <div class="col-md-6">
                        <label class="form-label">Mã ngạch / mã chức danh nghề nghiệp</label>
                        <input type="text" class="form-control" name="doctor_job_title_code" value="<?php echo htmlspecialchars((string)$doc_job_title_code, ENT_QUOTES, 'UTF-8'); ?>" placeholder="Ví dụ: V.08.01.02">
                     </div>

                     <div class="col-md-6">
                        <label class="form-label">Phòng ban, đơn vị công tác (Khoa / Phòng)</label>
                        <select name="doctor_department_id" class="form-select">
                           <option value="">-- Chưa phân khoa / phòng --</option>
                           <?php foreach($departments as $dept): ?>
                              <option value="<?php echo (int)$dept->id; ?>" <?php echo $doc_dept_id === (int)$dept->id ? 'selected' : ''; ?>>
                                 <?php echo htmlspecialchars($dept->depart_name, ENT_QUOTES, 'UTF-8'); ?>
                              </option>
                           <?php endforeach; ?>
                        </select>
                     </div>

                     <div class="col-md-6">
                        <label class="form-label fw-bold">Đơn vị công tác <span class="text-danger">*</span></label>
                        <input type="text" class="form-control" name="doctor_workplace" value="<?php echo htmlspecialchars((string)$doc_workplace, ENT_QUOTES, 'UTF-8'); ?>" placeholder="Bệnh viện Đa khoa khu vực Đắk Hà" required>
                     </div>

                     <div class="col-md-6">
                        <label class="form-label">Mã số cán bộ / hồ sơ</label>
                        <input type="text" class="form-control" name="doctor_code" value="<?php echo htmlspecialchars((string)$doc_code, ENT_QUOTES, 'UTF-8'); ?>" placeholder="Ví dụ: 11138">
                     </div>

                     <div class="col-md-6">
                        <label class="form-label">Số chứng chỉ hành nghề (CCHN - tùy chọn)</label>
                        <input type="text" class="form-control" name="doctor_cchn" value="<?php echo htmlspecialchars((string)$doc_cchn, ENT_QUOTES, 'UTF-8'); ?>" placeholder="Ví dụ: 012345/QNG-CCHN">
                     </div>
                  </div>
               </div>
            </div>
         </div>

         <!-- Ảnh đại diện & Trạng thái -->
         <div class="col-lg-4">
            <div class="card mb-4">
               <div class="card-header bg-light">
                  <h5 class="card-title mb-0"><i class="fa-solid fa-image me-2 text-primary"></i>Ảnh chân dung & Trạng thái</h5>
               </div>
               <div class="card-body">
                  <div class="mb-3 text-center">
                     <div class="position-relative d-inline-block mb-3">
                        <img id="avatarPreview" src="<?php echo $avatarUrl; ?>" alt="Xem trước ảnh" class="rounded-circle border border-3 border-light shadow-sm" style="width: 140px; height: 140px; object-fit: cover;">
                     </div>
                     <div class="text-muted small mb-2">Định dạng hỗ trợ: JPG, JPEG, PNG, WEBP</div>
                     <input type="file" class="form-control form-control-sm" name="avatar" id="avatarInput" accept="image/jpeg,image/png,image/webp">
                  </div>

                  <div class="mb-4">
                     <label class="form-label fw-bold">Trạng thái hiển thị</label>
                     <select name="doctor_status" class="form-select">
                        <option value="1" <?php echo $doc_status === 1 ? 'selected' : ''; ?>>Hiển thị trên website</option>
                        <option value="0" <?php echo $doc_status === 0 ? 'selected' : ''; ?>>Ẩn (không hiển thị)</option>
                     </select>
                  </div>

                  <div class="d-grid gap-2">
                     <button type="submit" class="btn btn-primary btn-lg">
                        <i class="fa-solid fa-floppy-disk me-1"></i> <?php echo $isEdit ? 'Lưu thay đổi' : 'Thêm cán bộ / bác sĩ'; ?>
                     </button>
                     <a href="<?php echo XC_URL; ?>/admin/doctors" class="btn btn-light">Hủy bỏ</a>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </form>
</div>

<script>
document.addEventListener('DOMContentLoaded', function(){
   var avatarInput = document.getElementById('avatarInput');
   var avatarPreview = document.getElementById('avatarPreview');
   if(avatarInput && avatarPreview){
      avatarInput.addEventListener('change', function(e){
         if(this.files && this.files[0]){
            var reader = new FileReader();
            reader.onload = function(evt){
               avatarPreview.src = evt.target.result;
            };
            reader.readAsDataURL(this.files[0]);
         }
      });
   }
});
</script>

<?php include_once "footer.php"; ?>
