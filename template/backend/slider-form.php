<?php require 'header.php';
$editing = !empty($slide);
function sliderFormH($value){ return htmlspecialchars((string)$value, ENT_QUOTES, 'UTF-8'); }
?>
<div class="content container-fluid">
  <div class="page-header"><div class="row align-items-center"><div class="col"><h3 class="page-title"><?php echo $editing ? 'Sửa banner' : 'Thêm banner'; ?></h3><p class="text-muted mb-0">Ảnh ngang khuyến nghị tỷ lệ khoảng 16:6, dung lượng tối đa 5 MB.</p></div><div class="col-auto"><a href="<?php echo XC_URL; ?>/admin/sliders" class="btn btn-outline-secondary">Quay lại</a></div></div></div>
  <?php if(!empty($slider_flash)): ?><div class="alert alert-<?php echo sliderFormH($slider_flash['type']); ?>"><?php echo sliderFormH($slider_flash['message']); ?></div><?php endif; ?>
  <form method="post" enctype="multipart/form-data" action="<?php echo XC_URL; ?>/admin/sliders/save<?php echo $editing ? '/'.intval($slide->id) : ''; ?>" class="card"><div class="card-body row g-3">
    <input type="hidden" name="csrf_token" value="<?php echo sliderFormH($admin_csrf_token ?? ''); ?>">
    <?php if($editing): ?><div class="col-12"><img src="<?php echo XC_URL.'/'.sliderFormH($slide->image_path); ?>" alt="" style="max-width:420px;width:100%;border-radius:8px"></div><?php endif; ?>
    <div class="col-12"><label class="form-label">Ảnh banner <?php echo $editing ? '(để trống nếu giữ ảnh cũ)' : '*'; ?></label><input class="form-control" type="file" name="image" accept="image/jpeg,image/png,image/webp" <?php echo $editing ? '' : 'required'; ?>></div>
    <div class="col-md-6"><label class="form-label">Mô tả ảnh *</label><input class="form-control" name="alt_text" maxlength="255" required value="<?php echo sliderFormH($slide->alt_text ?? ''); ?>"></div>
    <div class="col-md-6"><label class="form-label">Nhãn nhỏ</label><input class="form-control" name="eyebrow" maxlength="120" value="<?php echo sliderFormH($slide->eyebrow ?? ''); ?>"></div>
    <div class="col-12"><label class="form-label">Tiêu đề trên ảnh</label><input class="form-control" name="title" maxlength="255" value="<?php echo sliderFormH($slide->title ?? ''); ?>"></div>
    <div class="col-12"><label class="form-label">Mô tả ngắn</label><textarea class="form-control" name="description" rows="3"><?php echo sliderFormH($slide->description ?? ''); ?></textarea></div>
    <div class="col-md-6"><label class="form-label">Chữ trên nút</label><input class="form-control" name="button_label" maxlength="100" value="<?php echo sliderFormH($slide->button_label ?? ''); ?>"></div>
    <div class="col-md-6"><label class="form-label">Liên kết nút</label><input class="form-control" name="button_url" maxlength="500" placeholder="gioi-thieu.html hoặc https://..." value="<?php echo sliderFormH($slide->button_url ?? ''); ?>"></div>
    <div class="col-md-3"><label class="form-label">Thứ tự</label><input class="form-control" type="number" min="0" max="99999" name="sort_order" value="<?php echo intval($slide->sort_order ?? 10); ?>"></div>
    <div class="col-md-9 d-flex align-items-end"><label class="form-check"><input class="form-check-input" type="checkbox" name="is_active" value="1" <?php echo !$editing || intval($slide->is_active) ? 'checked' : ''; ?>><span class="form-check-label">Hiển thị trên website</span></label></div>
  </div><div class="card-footer text-end"><button class="btn btn-primary px-4" type="submit">Lưu banner</button></div></form>
</div>
<?php require 'footer.php'; ?>
