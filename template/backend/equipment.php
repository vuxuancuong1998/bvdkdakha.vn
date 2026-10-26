<?php require 'header.php';
$equipmentH = function($value) { return htmlspecialchars((string)$value, ENT_QUOTES, 'UTF-8'); };
$rows = is_array($equipment_rows ?? null) ? $equipment_rows : array();
?>
<div class="content container-fluid">
 <div class="page-header"><div class="row align-items-center"><div class="col"><h3 class="page-title">Quản lý trang thiết bị</h3><p class="text-muted">Các thiết bị được bật hiển thị sẽ xuất hiện trên trang chủ theo thứ tự.</p></div><div class="col-auto"><a class="btn btn-primary" href="<?php echo XC_URL; ?>/admin/equipment/add">Thêm thiết bị</a></div></div></div>
 <?php if(!empty($equipment_flash)): ?><div class="alert alert-<?php echo $equipmentH($equipment_flash['type']); ?>"><?php echo $equipmentH($equipment_flash['message']); ?></div><?php endif; ?>
 <div class="card"><div class="card-body table-responsive"><table class="table table-hover align-middle">
 <thead><tr><th>Thứ tự</th><th>Hình ảnh</th><th>Tên thiết bị</th><th>Hãng / Xuất xứ</th><th>Trạng thái</th><th>Thao tác</th></tr></thead><tbody>
 <?php foreach($rows as $row): ?><tr>
 <td><?php echo (int)$row->sort_order; ?></td>
 <td><img src="<?php echo XC_URL.'/'.$equipmentH($row->image_path); ?>" alt="" style="width:100px;height:90px;object-fit:contain"></td>
 <td><strong><?php echo $equipmentH($row->name); ?></strong><?php if($row->sample_code): ?><div class="small text-muted">Dữ liệu mẫu</div><?php endif; ?></td>
 <td><?php echo $equipmentH($row->manufacturer); ?><div class="text-muted"><?php echo $equipmentH($row->origin); ?></div></td>
 <td><span class="badge bg-<?php echo (int)$row->status === 1 ? 'success' : 'secondary'; ?>"><?php echo (int)$row->status === 1 ? 'Hiển thị' : 'Ẩn'; ?></span></td>
 <td><div class="d-flex gap-2"><a class="btn btn-sm btn-outline-primary" href="<?php echo XC_URL; ?>/admin/equipment/edit/<?php echo (int)$row->id; ?>">Sửa</a>
 <form method="post" action="<?php echo XC_URL; ?>/admin/equipment/delete/<?php echo (int)$row->id; ?>" onsubmit="return confirm('Chuyển thiết bị này vào Sọt rác?')"><input type="hidden" name="csrf_token" value="<?php echo $equipmentH($admin_csrf_token); ?>"><button class="btn btn-sm btn-outline-danger" type="submit">Xóa</button></form></div></td>
 </tr><?php endforeach; ?>
 <?php if(!$rows): ?><tr><td colspan="6" class="text-center text-muted py-4">Chưa có trang thiết bị.</td></tr><?php endif; ?>
 </tbody></table></div></div>
</div>
<?php require 'footer.php'; ?>
