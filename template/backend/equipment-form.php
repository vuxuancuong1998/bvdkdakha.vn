<?php require 'header.php';
$equipmentH = function($value) { return htmlspecialchars((string)$value, ENT_QUOTES, 'UTF-8'); };
$item = $equipment_item ?? null;
?>
<div class="content container-fluid">
 <div class="page-header"><div class="row"><div class="col"><h3 class="page-title"><?php echo $item ? 'Sửa trang thiết bị' : 'Thêm trang thiết bị'; ?></h3></div><div class="col-auto"><a class="btn btn-outline-secondary" href="<?php echo XC_URL; ?>/admin/equipment">Quay lại</a></div></div></div>
 <?php if(!empty($equipment_flash)): ?><div class="alert alert-<?php echo $equipmentH($equipment_flash['type']); ?>"><?php echo $equipmentH($equipment_flash['message']); ?></div><?php endif; ?>
 <form class="card" method="post" enctype="multipart/form-data" action="<?php echo XC_URL; ?>/admin/equipment/save<?php echo $item ? '/'.(int)$item->id : ''; ?>">
 <input type="hidden" name="csrf_token" value="<?php echo $equipmentH($admin_csrf_token); ?>">
 <div class="card-body row g-3">
 <div class="col-12"><label class="form-label" for="equipment-name">Tên thiết bị *</label><input class="form-control" id="equipment-name" name="name" maxlength="255" required value="<?php echo $equipmentH($item->name ?? ''); ?>"></div>
 <div class="col-md-6"><label class="form-label" for="equipment-manufacturer">Hãng sản xuất</label><input class="form-control" id="equipment-manufacturer" name="manufacturer" maxlength="120" value="<?php echo $equipmentH($item->manufacturer ?? ''); ?>"></div>
 <div class="col-md-6"><label class="form-label" for="equipment-origin">Xuất xứ</label><input class="form-control" id="equipment-origin" name="origin" maxlength="120" value="<?php echo $equipmentH($item->origin ?? ''); ?>"></div>
 <?php if($item): ?><div class="col-12"><img src="<?php echo XC_URL.'/'.$equipmentH($item->image_path); ?>" alt="" style="max-width:260px;max-height:220px;object-fit:contain"></div><?php endif; ?>
 <div class="col-12"><label class="form-label" for="equipment-image">Hình ảnh <?php echo $item ? '(để trống để giữ ảnh hiện tại)' : '*'; ?></label><input class="form-control" id="equipment-image" type="file" name="image" accept="image/jpeg,image/png,image/webp" <?php echo $item ? '' : 'required'; ?>><div class="form-text">JPG, PNG hoặc WebP, tối đa 5 MB. Ảnh được hiển thị trọn vẹn trong khung.</div></div>
 <div class="col-12"><label class="form-label" for="equipment-description">Mô tả</label><textarea class="form-control" id="equipment-description" name="description" maxlength="10000" rows="5"><?php echo $equipmentH($item->description ?? ''); ?></textarea></div>
 <div class="col-md-4"><label class="form-label" for="equipment-order">Thứ tự hiển thị</label><input class="form-control" id="equipment-order" type="number" name="sort_order" min="0" max="99999" value="<?php echo (int)($item->sort_order ?? 10); ?>"></div>
 <div class="col-md-8 d-flex align-items-end"><label class="form-check"><input class="form-check-input" type="checkbox" name="is_active" value="1" <?php echo !$item || (int)$item->status === 1 ? 'checked' : ''; ?>><span class="form-check-label">Hiển thị trên trang chủ</span></label></div>
 </div><div class="card-footer text-end"><button class="btn btn-primary" type="submit">Lưu thiết bị</button></div>
 </form>
</div>
<?php require 'footer.php'; ?>
