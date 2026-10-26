<?php require 'header.php';
$rows = is_array($slides ?? null) ? $slides : array();
$csrf = htmlspecialchars($admin_csrf_token ?? '', ENT_QUOTES, 'UTF-8');
function sliderAdminH($value){ return htmlspecialchars((string)$value, ENT_QUOTES, 'UTF-8'); }
?>
<div class="content container-fluid">
  <div class="page-header"><div class="row align-items-center"><div class="col"><h3 class="page-title">Quản lý Slider</h3><p class="text-muted mb-0">Banner hiển thị trên các trang giao diện người xem.</p></div><div class="col-auto"><a href="<?php echo XC_URL; ?>/admin/sliders/add" class="btn btn-primary"><i class="fa-solid fa-plus me-1"></i> Thêm banner</a></div></div></div>
  <?php if(!empty($slider_flash)): ?><div class="alert alert-<?php echo sliderAdminH($slider_flash['type']); ?>"><?php echo sliderAdminH($slider_flash['message']); ?></div><?php endif; ?>
  <div class="card"><div class="card-body table-responsive"><table class="table table-hover align-middle"><thead class="bg-light text-dark fw-bold"><tr><th style="width:60px;" class="text-center">Thứ tự</th><th style="width:180px;">Hình ảnh banner</th><th>Tiêu đề & Nội dung</th><th style="min-width:220px">Thiết bị hiển thị</th><th style="width:120px;" class="text-center">Trạng thái</th><th style="width:90px;" class="text-center">Thao tác</th></tr></thead><tbody>
  <?php foreach($rows as $row): ?>
    <tr>
<td class="text-center fw-bold text-muted"><?php echo intval($row->sort_order); ?></td>
<td><img src="<?php echo XC_URL.'/'.sliderAdminH($row->image_path); ?>" alt="" style="width:160px;max-width:100%;aspect-ratio:16/6;object-fit:cover;border-radius:8px" class="border shadow-2xs"></td>
<td><strong class="text-dark"><?php echo sliderAdminH($row->title ?: $row->alt_text); ?></strong><div class="text-muted small"><?php echo sliderAdminH($row->eyebrow); ?></div></td>
<td>
<form method="post" action="<?php echo XC_URL; ?>/admin/sliders/device/<?php echo (int)$row->id; ?>" class="d-flex gap-2 align-items-center">
<input type="hidden" name="csrf_token" value="<?php echo $csrf; ?>">
<select class="form-select form-select-sm" name="device" aria-label="Thiết bị hiển thị banner <?php echo (int)$row->id; ?>">
<?php foreach(array('pc'=>'Desktop','mobile'=>'Mobile','all'=>'Desktop và Mobile') as $deviceValue=>$deviceLabel): ?>
<option value="<?php echo $deviceValue; ?>" <?php echo ($row->device ?? 'all') === $deviceValue ? 'selected' : ''; ?>><?php echo $deviceLabel; ?></option>
<?php endforeach; ?>
</select><button type="submit" class="btn btn-sm btn-outline-primary">Lưu</button>
</form>
</td>
<td class="text-center"><?php if(intval($row->is_active)): ?><span class="badge bg-success-subtle text-success border border-success-subtle"><i class="fa-solid fa-circle-check me-1"></i>Hiển thị</span><?php else: ?><span class="badge bg-secondary-subtle text-secondary border border-secondary-subtle"><i class="fa-solid fa-eye-slash me-1"></i>Ẩn</span><?php endif; ?></td>
<td class="text-center">
<div class="btn-action-group justify-content-center">
<a class="btn-action is-edit" href="<?php echo XC_URL; ?>/admin/sliders/edit/<?php echo intval($row->id); ?>" title="Chỉnh sửa banner"><i class="fa-solid fa-pen-to-square"></i></a>
<form method="post" action="<?php echo XC_URL; ?>/admin/sliders/delete/<?php echo intval($row->id); ?>" class="d-inline m-0" onsubmit="return confirm('Xóa banner này?')"><input type="hidden" name="csrf_token" value="<?php echo $csrf; ?>"><button class="btn-action is-delete" type="submit" title="Xóa banner"><i class="fa-regular fa-trash-can"></i></button></form>
</div>
</td>
</tr>
  <?php endforeach; ?>
  <?php if(!$rows): ?><tr><td colspan="6" class="text-center text-muted py-4">Chưa có banner. Hãy thêm banner đầu tiên.</td></tr><?php endif; ?>
  </tbody></table></div></div>
</div>
<?php require 'footer.php'; ?>
