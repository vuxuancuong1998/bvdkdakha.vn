<?php require 'header.php';
$bookingH = function($v) { return htmlspecialchars((string)$v, ENT_QUOTES, 'UTF-8'); };
$item = $appointment_item ?? null;
$errors = $appointment_errors ?? array();
?>
<div class="content container-fluid">
 <div class="page-header"><div class="row"><div class="col"><h3 class="page-title"><?php echo !empty($item->id) ? 'Sửa lịch khám' : 'Thêm lịch khám'; ?></h3></div><div class="col-auto"><a class="btn btn-outline-secondary" href="<?php echo XC_URL; ?>/admin/quickappointments">Quay lại</a></div></div></div>
 <?php if($errors): ?><div class="alert alert-danger" role="alert">Vui lòng kiểm tra thông tin được đánh dấu bên dưới.</div><?php endif; ?>
 <form class="card" data-quick-appointment data-booking-today="<?php echo QuickAppointment::today(); ?>" data-original-date="<?php echo $bookingH(!empty($item->id) ? $item->exam_date : ''); ?>" novalidate method="post" action="<?php echo XC_URL; ?>/admin/quickappointments/save<?php echo !empty($item->id) ? '/'.(int)$item->id : ''; ?>">
 <input type="hidden" name="csrf_token" value="<?php echo $bookingH($admin_csrf_token); ?>">
 <div class="card-body row g-3">
 <?php foreach (array('full_name'=>'Họ và tên','citizen_id'=>'Căn cước công dân','phone'=>'Số điện thoại','exam_date'=>'Ngày khám') as $field=>$label): ?>
 <div class="col-md-6"><label class="form-label" for="appointment-<?php echo $field; ?>"><?php echo $label; ?> *</label>
 <input class="form-control <?php echo isset($errors[$field]) ? 'is-invalid' : ''; ?>" id="appointment-<?php echo $field; ?>" name="<?php echo $field; ?>" required value="<?php echo $bookingH($item->$field ?? ''); ?>"
 <?php if($field === 'full_name'): ?>type="text" minlength="2" maxlength="120" autocomplete="name"
 <?php elseif($field === 'citizen_id'): ?>type="text" inputmode="numeric" pattern="[0-9]{12}" minlength="12" maxlength="12" title="Căn cước công dân gồm đúng 12 chữ số"
 <?php elseif($field === 'phone'): ?>type="tel" maxlength="13" pattern="(0[35789][0-9]{8}|02[0-9]{9}|(\+84|84)([35789][0-9]{8}|2[0-9]{9}))" title="Số điện thoại Việt Nam hợp lệ" autocomplete="tel"
 <?php else: ?>type="date" min="<?php echo $bookingH($appointment_min_date); ?>"
 <?php endif; ?> aria-describedby="error-<?php echo $field; ?>" <?php echo isset($errors[$field]) ? 'aria-invalid="true"' : ''; ?>>
 <div id="error-<?php echo $field; ?>" class="invalid-feedback"><?php echo $bookingH($errors[$field] ?? ''); ?></div></div>
 <?php endforeach; ?>
 </div><div class="card-footer text-end"><button class="btn btn-primary" type="submit">Lưu lịch khám</button></div>
 </form>
</div>
<script src="<?php echo XC_URL; ?>/template/frontend/assets/js/quick-appointment-validation.js?v=<?php echo filemtime(__SITE_PATH.'/template/frontend/assets/js/quick-appointment-validation.js'); ?>" defer></script>
<?php require 'footer.php'; ?>
