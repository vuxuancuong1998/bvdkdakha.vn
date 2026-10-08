<?php require 'header.php';
$rows = is_array($slides ?? null) ? $slides : array();
$csrf = htmlspecialchars($admin_csrf_token ?? '', ENT_QUOTES, 'UTF-8');
function sliderAdminH($value){ return htmlspecialchars((string)$value, ENT_QUOTES, 'UTF-8'); }
?>
<div class="content container-fluid">
  <div class="page-header"><div class="row align-items-center"><div class="col"><h3 class="page-title">Quản lý Slider</h3><p class="text-muted mb-0">Banner hiển thị trên các trang giao diện người xem.</p></div><div class="col-auto"><a href="<?php echo XC_URL; ?>/admin/sliders/add" class="btn btn-primary"><i class="fa-solid fa-plus me-1"></i> Thêm banner</a></div></div></div>
  <?php if(!empty($slider_flash)): ?><div class="alert alert-<?php echo sliderAdminH($slider_flash['type']); ?>"><?php echo sliderAdminH($slider_flash['message']); ?></div><?php endif; ?>
  <div class="card"><div class="card-body table-responsive"><table class="table table-hover align-middle"><thead><tr><th>Thứ tự</th><th>Ảnh</th><th>Nội dung</th><th>Trạng thái</th><th class="text-end">Thao tác</th></tr></thead><tbody>
  <?php foreach($rows as $row): ?>
    <tr><td><?php echo intval($row->sort_order); ?></td><td><img src="<?php echo XC_URL.'/'.sliderAdminH($row->image_path); ?>" alt="" style="width:160px;max-width:100%;aspect-ratio:16/6;object-fit:cover;border-radius:6px"></td><td><strong><?php echo sliderAdminH($row->title ?: $row->alt_text); ?></strong><div class="text-muted small"><?php echo sliderAdminH($row->eyebrow); ?></div></td><td><span class="badge bg-<?php echo intval($row->is_active) ? 'success' : 'secondary'; ?>"><?php echo intval($row->is_active) ? 'Đang hiển thị' : 'Đã ẩn'; ?></span></td><td class="text-end"><a class="btn btn-outline-primary btn-sm" href="<?php echo XC_URL; ?>/admin/sliders/edit/<?php echo intval($row->id); ?>">Sửa</a> <form method="post" action="<?php echo XC_URL; ?>/admin/sliders/delete/<?php echo intval($row->id); ?>" class="d-inline" onsubmit="return confirm('Xóa banner này?')"><input type="hidden" name="csrf_token" value="<?php echo $csrf; ?>"><button class="btn btn-outline-danger btn-sm">Xóa</button></form></td></tr>
  <?php endforeach; ?>
  <?php if(!$rows): ?><tr><td colspan="5" class="text-center text-muted py-4">Chưa có banner. Hãy thêm banner đầu tiên.</td></tr><?php endif; ?>
  </tbody></table></div></div>
</div>
<?php require 'footer.php'; ?>
