<?php require 'header.php';
$activities=is_array($activities??null)?$activities:array();
$labels=array('work_schedule'=>'Lịch công tác','training_plan'=>'Đào tạo & tập huấn','medical_campaign'=>'Truyền thông & khám nhân đạo');
$statuses=array(1=>'Bản nháp',2=>'Chờ phê duyệt',3=>'Đã phê duyệt',4=>'Đã công khai');
$statusClasses=array(1=>'secondary',2=>'warning',3=>'info',4=>'success');
$uid=intval($_SESSION['user']['id']??0); $isSuper=intval($current_admin_user->user_group??0)===1; $csrf=htmlspecialchars($admin_csrf_token??'',ENT_QUOTES,'UTF-8');
$scopeRoutes=array('schedules'=>'/admin/activities/schedules','plans'=>'/admin/activities/plans','campaigns'=>'/admin/activities/campaigns');
$scopeRoute=$scopeRoutes[$activity_scope??'']??'/admin/activities/schedules';
?>
<style>.activity-title{max-width:390px;white-space:normal;line-height:1.35}.activity-actions{display:flex;gap:5px;flex-wrap:wrap}.activity-actions .btn{width:31px;height:31px;padding:0;display:inline-flex;align-items:center;justify-content:center}@media(max-width:767px){#activity-table thead{display:none}#activity-table,#activity-table tbody,#activity-table tr,#activity-table td{display:block;width:100%}#activity-table tr{border:1px solid #e7eaf0;border-radius:12px;margin-bottom:12px;padding:10px}#activity-table td{border:0;padding:5px 4px}#activity-table td:before{content:attr(data-label);font-weight:700;display:inline-block;min-width:105px;color:#64748b}}</style>
<div class="content container-fluid">
 <div class="page-header"><div class="row align-items-center"><div class="col"><h3 class="page-title"><?php echo htmlspecialchars($activity_scope_title??'Quản lý hoạt động',ENT_QUOTES,'UTF-8');?></h3><p class="text-muted mb-1"><?php echo htmlspecialchars($activity_scope_description??'',ENT_QUOTES,'UTF-8');?></p><ul class="breadcrumb"><li class="breadcrumb-item"><a href="<?php echo XC_URL;?>/admin">Trang chủ</a></li><li class="breadcrumb-item">Quản lý hoạt động</li><li class="breadcrumb-item active"><?php echo htmlspecialchars($activity_scope_title??'',ENT_QUOTES,'UTF-8');?></li></ul></div><div class="col-auto"><a class="btn btn-primary" href="<?php echo XC_URL.'/admin/activities/add?type='.urlencode($activity_scope_type??'work_schedule');?>"><i class="fa-solid fa-plus me-1"></i> Khởi tạo <?php echo htmlspecialchars(mb_strtolower($activity_scope_title??'hoạt động','UTF-8'),ENT_QUOTES,'UTF-8');?></a></div></div></div>
 <div class="card"><div class="card-body">
  <form class="row g-2 mb-3" method="get" action="<?php echo XC_URL.$scopeRoute;?>">
   <div class="col-md-6"><input class="form-control" name="keyword" value="<?php echo htmlspecialchars($filter_keyword??'',ENT_QUOTES,'UTF-8');?>" placeholder="Tìm tiêu đề, đơn vị..."></div>
   <div class="col-md-4"><select class="form-select" name="status"><option value="0">Tất cả trạng thái</option><?php foreach($statuses as $key=>$label):?><option value="<?php echo $key;?>" <?php echo intval($filter_status??0)===$key?'selected':'';?>><?php echo $label;?></option><?php endforeach;?></select></div>
   <div class="col-md-2 d-grid"><button class="btn btn-outline-primary"><i class="fa-solid fa-filter me-1"></i>Lọc dữ liệu</button></div>
  </form>
  <div class="table-responsive"><table class="table table-hover align-middle" id="activity-table"><thead><tr><th>Tiêu đề</th><th><?php echo ($activity_scope??'')==='schedules'?'Thời gian/tuần':'Thời gian thực hiện';?></th><th>Người tạo</th><th>Trạng thái</th><th>Tệp</th><th>Thao tác</th></tr></thead><tbody>
  <?php if(!$activities):?><tr><td colspan="6" class="text-center text-muted py-5">Chưa có dữ liệu <?php echo htmlspecialchars(mb_strtolower($activity_scope_title??'hoạt động','UTF-8'),ENT_QUOTES,'UTF-8');?>.</td></tr><?php endif;?>
  <?php foreach($activities as $row): $status=intval($row->status);$owner=intval($row->created_by)===$uid||$isSuper; ?>
   <tr><td data-label="Tiêu đề"><div class="activity-title fw-semibold"><?php echo htmlspecialchars($row->title,ENT_QUOTES,'UTF-8');?></div><small class="text-muted"><?php echo htmlspecialchars($row->department_name??'',ENT_QUOTES,'UTF-8');?></small></td>
   <td data-label="Thời gian"><?php if(($activity_scope??'')==='schedules'):?><strong><?php echo htmlspecialchars($row->work_week??'—',ENT_QUOTES,'UTF-8');?></strong><br><small class="text-muted"><?php echo ($row->organization_block??'')==='leadership'?'Ban lãnh đạo':((($row->organization_block??'')==='departments')?'Các khoa phòng':'—');?></small><?php else:?><?php echo $row->start_at?date('d/m/Y H:i',strtotime($row->start_at)):'—';?><?php endif;?></td>
   <td data-label="Người tạo"><?php echo htmlspecialchars($row->author_name??'',ENT_QUOTES,'UTF-8');?></td>
   <td data-label="Trạng thái"><span class="badge bg-<?php echo $statusClasses[$status]??'dark';?>"><?php echo $statuses[$status]??'Không xác định';?></span></td>
   <td data-label="Tệp"><?php echo intval($row->attachment_count);?></td>
   <td data-label="Thao tác"><div class="activity-actions">
    <a class="btn btn-outline-primary btn-sm" href="<?php echo XC_URL.'/admin/activities/detail/'.intval($row->id);?>" title="Xem"><i class="fa-regular fa-eye"></i></a>
    <?php if($status===1&&$owner):?><a class="btn btn-outline-success btn-sm" href="<?php echo XC_URL.'/admin/activities/edit/'.intval($row->id);?>" title="Sửa"><i class="fa-regular fa-pen-to-square"></i></a><button class="btn btn-outline-secondary btn-sm activity-workflow" data-id="<?php echo intval($row->id);?>" data-action="submit" title="Gửi duyệt"><i class="fa-solid fa-paper-plane"></i></button><button class="btn btn-outline-danger btn-sm activity-delete" data-id="<?php echo intval($row->id);?>" title="Xóa"><i class="fa-regular fa-trash-can"></i></button><?php endif;?>
    <?php if($status===2&&$owner):?><button class="btn btn-outline-warning btn-sm activity-workflow" data-id="<?php echo intval($row->id);?>" data-action="cancel_submit" title="Hủy gửi"><i class="fa-solid fa-rotate-left"></i></button><?php endif;?>
    <?php if($status===2&&!empty($can_activity_approve)):?><button class="btn btn-success btn-sm activity-workflow" data-id="<?php echo intval($row->id);?>" data-action="approve" title="Phê duyệt"><i class="fa-solid fa-check"></i></button><button class="btn btn-outline-danger btn-sm activity-workflow" data-id="<?php echo intval($row->id);?>" data-action="return" title="Trả lại"><i class="fa-solid fa-reply"></i></button><?php endif;?>
    <?php if($status===3&&!empty($can_activity_publish)):?><button class="btn btn-primary btn-sm activity-workflow" data-id="<?php echo intval($row->id);?>" data-action="publish" title="Công khai"><i class="fa-solid fa-globe"></i></button><?php endif;?>
    <?php if($status===4&&!empty($can_activity_publish)):?><button class="btn btn-outline-secondary btn-sm activity-workflow" data-id="<?php echo intval($row->id);?>" data-action="unpublish" title="Hủy công khai"><i class="fa-solid fa-eye-slash"></i></button><?php endif;?>
   </div></td></tr>
  <?php endforeach;?></tbody></table></div>
  <?php if(($total_pages??1)>1):?><nav><ul class="pagination justify-content-center"><?php for($p=1;$p<=$total_pages;$p++):?><li class="page-item <?php echo $p===$page?'active':'';?>"><a class="page-link" href="?<?php echo http_build_query(array_merge($_GET,array('page'=>$p)));?>"><?php echo $p;?></a></li><?php endfor;?></ul></nav><?php endif;?>
 </div></div>
</div>
<script>
$(function(){function act(id,action,reason){$.post('<?php echo XC_URL;?>/api/activityWorkflow',{id:id,action:action,reason:reason||'',csrf_token:'<?php echo $csrf;?>'},function(r){if(r.status==200){Swal.fire({icon:'success',title:r.message,timer:1200,showConfirmButton:false});setTimeout(function(){location.reload()},1250)}else Swal.fire({icon:'error',title:'Không thể thực hiện',text:r.message})},'json')}
$('.activity-workflow').on('click',function(){var a=$(this).data('action'),reason='';if(a==='return'){reason=prompt('Nhập lý do trả lại:')||'';if(!reason.trim())return;}act($(this).data('id'),a,reason)});
$('.activity-delete').on('click',function(){var id=$(this).data('id');Swal.fire({icon:'warning',title:'Xóa hoạt động?',showCancelButton:true,confirmButtonText:'Xóa',cancelButtonText:'Hủy'}).then(function(x){if(!x.isConfirmed)return;$.post('<?php echo XC_URL;?>/api/activityDelete',{id:id,csrf_token:'<?php echo $csrf;?>'},function(r){if(r.status==200)location.reload();else Swal.fire('Lỗi',r.message,'error')},'json')})});});
</script>
<?php require 'footer.php';?>
