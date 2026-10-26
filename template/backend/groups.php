<?php require "header.php"; ?>
<script>
jQuery(function($){
 $('#table-group').on('click','.btn-delete-group',function(){
  var id=$(this).data('id');
  Swal.fire({icon:'warning',title:'Xóa nhóm quyền?',text:'Thao tác chỉ thực hiện khi nhóm chưa có tài khoản.',showCancelButton:true,confirmButtonText:'Xóa',cancelButtonText:'Hủy'}).then(function(confirm){
   if(!confirm.isConfirmed) return;
   $.ajax({type:'POST',url:'<?php echo XC_URL; ?>/api/deletegroup',data:{id:id,csrf_token:'<?php echo htmlspecialchars($admin_csrf_token, ENT_QUOTES, 'UTF-8'); ?>'},dataType:'json'}).done(function(result){
    if(Number(result.status)===200){ Swal.fire({icon:'success',title:result.message,timer:1200,showConfirmButton:false}).then(function(){location.reload();}); }
    else Swal.fire({icon:'error',title:'Không thể xóa',text:result.message});
   });
  });
 });
});
</script>
<div class="container-fluid content-inner mt-n5 py-0"><div class="row"><div class="col-xl-12"><div class="card">
 <div class="card-header d-flex justify-content-between align-items-center"><div><h4 class="card-title mb-1"><?php echo htmlspecialchars($pagetitle, ENT_QUOTES, 'UTF-8'); ?></h4><small class="text-muted">Phân quyền truy cập Admin theo từng menu.</small></div><a href="<?php echo XC_URL; ?>/admin/groups/add" class="btn btn-primary btn-sm">Thêm nhóm quyền</a></div>
 <div class="card-body"><div class="table-responsive"><table id="table-group" class="table table-bordered table-hover">
  <thead class="bg-light text-dark fw-bold"><tr><th style="width:50px;" class="text-center">STT</th><th>Tên nhóm quyền</th><th style="width:140px;" class="text-center">Quyền menu</th><th style="width:130px;" class="text-center">Số tài khoản</th><th style="width:120px;" class="text-center">Trạng thái</th><th style="width:130px;" class="text-center">Thao tác</th></tr></thead><tbody>
  <?php if(isset($groups) && is_array($groups)): $stt=1; foreach($groups as $item): $super=(int)$item->id===1; $frontend=in_array((int)$item->id,array(2,3,4),true); ?>
   <tr>
<td class="text-center fw-bold text-muted"><?php echo $stt++; ?></td>
<td><strong><?php echo htmlspecialchars($item->group_name, ENT_QUOTES, 'UTF-8'); ?></strong> <?php if($super): ?><span class="badge bg-primary-subtle text-primary border border-primary-subtle ms-1">Super Admin</span><?php elseif($frontend): ?><span class="badge bg-secondary-subtle text-secondary border border-secondary-subtle ms-1">Nhóm frontend</span><?php endif; ?></td>
<td class="text-center"><span class="badge bg-light text-dark border"><?php echo $super ? 'Toàn bộ' : (int)$item->permission_count; ?></span></td>
<td class="text-center"><span class="badge bg-info-subtle text-info border border-info-subtle"><?php echo (int)$item->user_count; ?> tài khoản</span></td>
<td class="text-center"><span class="badge bg-success-subtle text-success border border-success-subtle"><i class="fa-solid fa-circle-check me-1"></i>Hoạt động</span></td>
<td class="text-center">
<div class="btn-action-group justify-content-center">
<a class="btn-action is-view" href="<?php echo XC_URL; ?>/admin/groups/edit/<?php echo (int)$item->id; ?>" title="<?php echo ($super || $frontend) ? 'Xem quyền' : 'Phân quyền'; ?>">
<i class="fa-solid fa-shield-halved"></i>
</a>
<?php if(!$super && !$frontend): ?>
<button class="btn-action is-delete btn-delete-group" data-id="<?php echo (int)$item->id; ?>" title="Xóa">
<i class="fa-regular fa-trash-can"></i>
</button>
<?php endif; ?>
</div>
</td>
</tr>
  <?php endforeach; else: ?><tr><td colspan="6" class="text-center">Chưa có nhóm quyền</td></tr><?php endif; ?>
  </tbody></table></div></div>
</div></div></div></div>
<?php require "footer.php"; ?>
