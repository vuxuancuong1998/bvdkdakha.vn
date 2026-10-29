<?php require 'header.php'; $esc=function($v){return htmlspecialchars((string)$v,ENT_QUOTES,'UTF-8');}; ?>
<div class="container-fluid content-inner mt-n5 py-0">
 <div class="card"><div class="card-header"><h4>Quản lý yêu cầu hỗ trợ</h4><p class="text-muted mb-0">Tiếp nhận và phản hồi yêu cầu từ Không gian làm việc số. Bản nháp chỉ hiển thị cho người tạo.</p></div>
 <div class="card-body">
  <div class="row g-3 mb-4"><?php foreach(array('total_all'=>'Tất cả','total_processing'=>'Chờ / Đang xử lý','total_completed'=>'Đã xử lý','total_rejected'=>'Bị từ chối') as $key=>$label): ?><div class="col-6 col-lg-3"><div class="border rounded p-3"><div class="text-muted"><?php echo $label; ?></div><strong class="fs-4"><?php echo (int)$support_stats->$key; ?></strong></div></div><?php endforeach; ?></div>
  <form method="get" class="row g-2 mb-3"><div class="col-md-6"><input class="form-control" name="q" aria-label="Tìm yêu cầu" placeholder="Mã yêu cầu, tiêu đề, người yêu cầu, khoa phòng" value="<?php echo $esc($support_filter['q']); ?>"></div><div class="col-md-4"><select class="form-select" name="status" aria-label="Lọc trạng thái"><option value="">Tất cả trạng thái</option><?php foreach($support_statuses as $key=>$label): if($key==='draft') continue; ?><option value="<?php echo $key; ?>" <?php if($support_filter['status']===$key) echo 'selected'; ?>><?php echo $key==='processing' ? 'Chờ / Đang xử lý' : $label; ?></option><?php endforeach; ?></select></div><div class="col-md-2"><button class="btn btn-primary w-100">Lọc yêu cầu</button></div></form>
  <div class="table-responsive"><table class="table align-middle" style="min-width:1050px"><thead><tr><th>Mã / Thời gian</th><th>Yêu cầu</th><th>Người gửi / Khoa phòng</th><th>Ưu tiên</th><th>Trạng thái</th><th>Thao tác</th></tr></thead><tbody>
   <?php foreach($support_rows as $item): ?><tr>
    <td><a href="<?php echo XC_URL.'/admin/supportrequests/detail/'.(int)$item->id; ?>"><?php echo $esc($item->request_code); ?></a><small class="d-block text-muted"><?php echo date('H:i d/m/Y',strtotime($item->created_at)); ?></small></td>
    <td style="max-width:300px;white-space:normal"><strong><?php echo $esc($item->title); ?></strong><small class="d-block text-muted"><?php echo $esc($item->service_type); ?></small></td>
    <td style="max-width:220px;white-space:normal"><?php echo $esc($item->user_name); ?><small class="d-block text-muted"><?php echo $esc($item->department); ?></small></td>
    <td><?php echo $esc(array('Urgent'=>'Khẩn cấp','High'=>'Cao','Normal'=>'Bình thường','Low'=>'Thấp')[$item->priority] ?? $item->priority); ?></td>
    <td><span class="badge <?php echo array('completed'=>'bg-success','rejected'=>'bg-danger','processing'=>'bg-primary','sent'=>'bg-secondary')[$item->status] ?? 'bg-secondary'; ?>"><?php echo $esc($support_statuses[$item->status] ?? $item->status); ?></span></td>
    <td><div class="d-flex gap-2"><a class="btn btn-sm btn-outline-primary" href="<?php echo XC_URL.'/admin/supportrequests/detail/'.(int)$item->id; ?>">Chi tiết</a><button type="button" class="btn btn-sm btn-primary support-action-open" data-id="<?php echo (int)$item->id; ?>">Xử lý / Phản hồi</button></div></td>
   </tr><?php endforeach; ?>
   <?php if(!$support_rows): ?><tr><td colspan="6" class="text-center py-5">Không có yêu cầu phù hợp.</td></tr><?php endif; ?>
  </tbody></table></div>
  <div class="d-flex justify-content-between align-items-center mt-3 flex-wrap gap-2"><span><?php echo (int)$support_total; ?> yêu cầu · Trang <?php echo (int)$support_page; ?>/<?php echo (int)$support_pages; ?></span><div class="d-flex gap-2"><?php if($support_page>1): ?><a class="btn btn-sm btn-outline-secondary" href="?<?php echo $esc(http_build_query(array_merge($support_filter,array('page'=>$support_page-1)))); ?>">Trang trước</a><?php endif; ?><?php if($support_page<$support_pages): ?><a class="btn btn-sm btn-outline-secondary" href="?<?php echo $esc(http_build_query(array_merge($support_filter,array('page'=>$support_page+1)))); ?>">Trang sau</a><?php endif; ?></div></div>
 </div></div>
</div>
<?php require 'support-request-actions.php'; require 'footer.php'; ?>
