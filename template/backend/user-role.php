<?php
require 'header.php';
$esc = function($v){ return htmlspecialchars((string)$v, ENT_QUOTES, 'UTF-8'); };
$permissionNames = array(1 => array('Toàn bộ menu quản trị'));
foreach(($group_permissions ?? array()) as $permission) $permissionNames[(int)$permission->group_id][] = $permission->permission_name;
?>
<div class="container-fluid content-inner mt-n5 py-0"><div class="card">
 <div class="card-header"><h4>Phân quyền tài khoản</h4><p class="mb-0"><?php echo $esc($user->full_name ?: $user->user_username); ?></p></div>
 <div class="card-body">
  <?php if((int)$user->is_admin !== 1): ?>
   <div class="alert alert-info">Tài khoản Người dùng không có quyền quản trị. Chuyển đối tượng sang Admin tại form chỉnh sửa trước khi phân quyền.</div>
   <a class="btn btn-primary" href="<?php echo XC_URL.'/admin/users/edit/'.(int)$user->uid; ?>">Chỉnh sửa tài khoản</a>
  <?php else: ?>
   <form id="frm-role">
    <input type="hidden" name="user_id" value="<?php echo (int)$user->uid; ?>">
    <input type="hidden" name="csrf_token" value="<?php echo $esc($admin_csrf_token); ?>">
    <label class="form-label" for="role-group">Nhóm quyền Admin</label>
    <select class="form-select" id="role-group" name="user_group" required><option value="">Chọn nhóm quyền</option><?php foreach($roles as $role): if((int)$role->id === 1 && (int)($current_admin_user->user_group ?? 0) !== 1) continue; ?><option value="<?php echo (int)$role->id; ?>" <?php if((int)$user->user_group === (int)$role->id) echo 'selected'; ?>><?php echo $esc($role->group_name); ?></option><?php endforeach; ?></select>
    <h6 class="mt-4">Menu được phép truy cập</h6><ul id="permission-preview"></ul>
    <button class="btn btn-primary" type="submit" <?php if((int)$user->uid === (int)$_SESSION['user']['id']) echo 'disabled'; ?>>Lưu phân quyền</button>
    <?php if((int)$user->uid === (int)$_SESSION['user']['id']): ?><p class="text-muted mt-2">Không thể tự thay đổi nhóm quyền của tài khoản đang đăng nhập.</p><?php endif; ?>
   </form>
  <?php endif; ?>
  <a class="btn btn-outline-secondary mt-3" href="<?php echo XC_URL; ?>/admin/users">Quay lại</a>
 </div>
</div></div>
<script>
jQuery(function($){
 var permissions = <?php echo json_encode($permissionNames, JSON_HEX_TAG | JSON_HEX_AMP | JSON_HEX_APOS | JSON_HEX_QUOT); ?>;
 function preview(){ var $list=$('#permission-preview').empty(); (permissions[$('#role-group').val()] || ['Chưa có quyền truy cập']).forEach(function(name){ $('<li>').text(name).appendTo($list); }); }
 $('#role-group').on('change',preview); preview();
 $('#frm-role').on('submit',function(e){ e.preventDefault(); if(!this.reportValidity()) return; var $button=$(this).find('button[type=submit]'); $button.prop('disabled',true);
  $.ajax({type:'POST',url:<?php echo json_encode(XC_URL.'/api/assignAdminGroup'); ?>,data:$(this).serialize(),dataType:'json'}).done(function(result){
   Swal.fire({icon:Number(result.status)===200?'success':'error',title:result.message}).then(function(){if(Number(result.status)===200) location.href=result.url;});
  }).fail(function(){Swal.fire({icon:'error',title:'Không thể lưu phân quyền',text:'Vui lòng thử lại.'});}).always(function(){$button.prop('disabled',false);});
 });
});
</script>
<?php require 'footer.php'; ?>