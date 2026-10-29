<?php
require 'header.php';
$esc = function($value){ return htmlspecialchars((string)$value, ENT_QUOTES, 'UTF-8'); };
$editing = ($method ?? '') === 'edit';
$value = function($key, $default = '') use (&$user){ return isset($user) ? ($user->$key ?? $default) : $default; };
?>
<div class="container-fluid content-inner mt-n5 py-0">
 <div class="card">
  <div class="card-header"><h4 class="card-title"><?php echo $esc($pagetitle); ?></h4></div>
  <div class="card-body">
   <form id="frm-action" method="post">
    <input type="hidden" name="method" value="<?php echo $editing ? 'edit' : 'add'; ?>">
    <input type="hidden" name="user_id" value="<?php echo (int)$value('uid', 0); ?>">
    <input type="hidden" name="csrf_token" value="<?php echo $esc($admin_csrf_token); ?>">
    <div class="row g-3">
     <div class="col-md-6"><label for="full_name" class="form-label">Họ và tên <span class="text-danger">*</span></label><input id="full_name" name="full_name" class="form-control" required maxlength="255" autocomplete="name" value="<?php echo $esc($value('full_name') ?: $value('user_username')); ?>"></div>
     <div class="col-md-6"><label for="user_cccd" class="form-label">Căn cước công dân <span class="text-danger">*</span></label><input id="user_cccd" name="user_cccd" class="form-control" required inputmode="numeric" pattern="[0-9]{12}" minlength="12" maxlength="12" title="Nhập đúng 12 chữ số CCCD" value="<?php echo $esc($value('user_cccd')); ?>"></div>
     <div class="col-md-6"><label for="user_phone" class="form-label">Số điện thoại <span class="text-danger">*</span></label><input type="tel" id="user_phone" name="user_phone" class="form-control" required pattern="0[0-9]{9,10}" minlength="10" maxlength="11" title="Nhập 10 hoặc 11 chữ số, bắt đầu bằng 0" autocomplete="tel" value="<?php echo $esc($value('user_phone')); ?>"></div>
     <div class="col-md-6"><label for="user_department" class="form-label">Khoa phòng <span class="text-danger">*</span></label><select id="user_department" name="user_department" class="form-select" required><option value="">Chọn khoa phòng</option><?php foreach($departments as $dept): ?><option value="<?php echo (int)$dept->id; ?>" <?php if((int)$value('user_department') === (int)$dept->id) echo 'selected'; ?>><?php echo $esc($dept->depart_name); ?></option><?php endforeach; ?></select></div>
     <div class="col-md-6"><label for="is_admin" class="form-label">Đối tượng <span class="text-danger">*</span></label><select id="is_admin" name="is_admin" class="form-select" required><option value="0" <?php if((int)$value('is_admin', 0) === 0) echo 'selected'; ?>>Người dùng</option><option value="1" <?php if((int)$value('is_admin', 0) === 1) echo 'selected'; ?>>Admin</option></select></div>
     <div class="col-md-6" id="admin-group-field"><label for="user_group" class="form-label">Nhóm quyền Admin <span class="text-danger">*</span></label><select id="user_group" name="user_group" class="form-select"><option value="">Chọn nhóm quyền</option><?php foreach($roles as $role): if((int)$role->id === 1 && (int)($current_admin_user->user_group ?? 0) !== 1) continue; ?><option value="<?php echo (int)$role->id; ?>" <?php if((int)$value('user_group') === (int)$role->id) echo 'selected'; ?>><?php echo $esc($role->group_name); ?></option><?php endforeach; ?></select></div>
     <div class="col-md-6" id="admin-email-field"><label for="user_email" class="form-label">Email nhận mã xác thực (Admin)</label><input type="email" id="user_email" name="user_email" class="form-control" maxlength="255" value="<?php echo $esc($value('user_email')); ?>"><small class="text-muted">Cần cho nhóm Super Admin khi bật xác thực đăng nhập qua email.</small></div>
    </div>
    <p class="text-muted mt-3"><?php echo $editing ? 'Giữ nguyên mật khẩu hiện tại. Dùng Đặt lại mật khẩu tại danh sách nếu cần đổi.' : 'CCCD là tên đăng nhập. Mật khẩu được tạo tự động và hiển thị một lần sau khi lưu.'; ?></p>
    <div class="d-flex justify-content-end gap-2 mt-4"><a class="btn btn-outline-secondary" href="<?php echo XC_URL; ?>/admin/users">Quay lại</a><button type="submit" id="send_DB" class="btn btn-primary">Lưu tài khoản</button></div>
   </form>
  </div>
 </div>
</div>
<script>
jQuery(function($){
 var $form = $('#frm-action'), $button = $('#send_DB');
 function toggleGroup(){ var admin = $('#is_admin').val() === '1'; $('#admin-group-field, #admin-email-field').toggle(admin); $('#user_group').prop('required', admin).prop('disabled', !admin); }
 $('#is_admin').on('change', toggleGroup); toggleGroup();
 $form.on('submit', function(e){
  e.preventDefault(); if(!this.reportValidity() || $button.prop('disabled')) return;
  $button.prop('disabled', true);
  $.ajax({url: <?php echo json_encode(XC_URL.'/api/userAction'); ?>, type: 'POST', data: $form.serialize(), dataType: 'json'})
   .done(function(result){
    if(Number(result.status) !== 200){ Swal.fire({icon:'error',title:'Không thể lưu tài khoản',text:result.message}); return; }
    var message = result.new_password ? 'Tên đăng nhập: ' + result.username + '\nMật khẩu: ' + result.new_password + '\nHãy lưu lại thông tin này trước khi đóng.' : result.message;
    Swal.fire({icon:'success',title:result.message,text:message,confirmButtonText:'Đã lưu thông tin',allowOutsideClick:false}).then(function(){ location.href=result.url; });
   }).fail(function(){ Swal.fire({icon:'error',title:'Không thể lưu tài khoản',text:'Kết nối máy chủ bị lỗi. Vui lòng thử lại.'}); })
   .always(function(){ $button.prop('disabled', false); });
 });
});
</script>
<?php require 'footer.php'; ?>
