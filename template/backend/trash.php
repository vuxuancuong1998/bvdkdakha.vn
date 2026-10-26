<?php require 'header.php';
$h = function($value){ return htmlspecialchars((string)$value, ENT_QUOTES, 'UTF-8'); };
$listing = $trash_listing;
$url = function($page) use ($trash_category, $trash_search){ return XC_URL.'/admin/trash?'.http_build_query(array('category'=>$trash_category, 'q'=>$trash_search, 'page'=>$page)); };
?>
<div class="conatiner-fluid content-inner mt-n5 py-0">
  <div class="card">
    <div class="card-header d-flex flex-wrap justify-content-between align-items-center gap-3">
      <div><h4 class="card-title mb-1">Sọt rác</h4><p class="text-muted mb-0">Tổng hợp bản ghi đã xóa theo danh mục. Khôi phục đưa trạng thái về 1.</p></div>
      <span class="badge bg-light text-dark"><?php echo (int)$listing['total']; ?> bản ghi phù hợp</span>
    </div>
    <div class="card-body">
      <?php if($trash_flash): ?><div class="alert alert-<?php echo $h($trash_flash['type']); ?>" role="status"><?php echo $h($trash_flash['message']); ?></div><?php endif; ?>
      <?php if($trash_error): ?><div class="alert alert-danger" role="alert"><?php echo $h($trash_error); ?></div><?php endif; ?>
      <form method="get" action="<?php echo XC_URL; ?>/admin/trash" class="row g-2 mb-4">
        <div class="col-md-4"><label for="trashCategory" class="form-label">Danh mục</label><select id="trashCategory" name="category" class="form-select"><option value="">Tất cả danh mục</option>
          <?php foreach($trash_categories as $key=>$category): ?><option value="<?php echo $h($key); ?>" <?php echo $trash_category === $key ? 'selected' : ''; ?>><?php echo $h($category['label']).' ('.(int)$category['total'].')'; ?></option><?php endforeach; ?>
        </select></div>
        <div class="col-md-5"><label for="trashSearch" class="form-label">Tìm kiếm</label><input id="trashSearch" type="search" name="q" value="<?php echo $h($trash_search); ?>" class="form-control" placeholder="Tên, nội dung hoặc mã bản ghi..."></div>
        <div class="col-md-3 d-flex align-items-end gap-2"><button class="btn btn-primary" type="submit">Lọc</button><a class="btn btn-light" href="<?php echo XC_URL; ?>/admin/trash">Đặt lại</a></div>
      </form>
      <div class="table-responsive"><table class="table table-hover align-middle">
        <thead class="bg-light"><tr><th>STT</th><th>Danh mục</th><th style="min-width:240px">Thông tin chi tiết</th><th style="min-width:210px">Thao tác</th></tr></thead>
        <tbody>
        <?php foreach($listing['rows'] as $index=>$row): ?>
          <tr>
            <td><?php echo ($listing['page'] - 1) * 20 + $index + 1; ?></td>
            <td><span class="badge bg-light text-dark"><?php echo $h($trash_categories[$row->category]['label']); ?></span></td>
            <td class="text-break"><strong><?php echo $h(trim((string)$row->title) !== '' ? $row->title : 'Bản ghi #'.$row->id); ?></strong>
              <div class="small text-muted">Mã: #<?php echo (int)$row->id; ?><?php if($row->record_date): ?> · Cập nhật: <?php echo $h(date('d/m/Y H:i', strtotime($row->record_date))); ?><?php endif; ?></div>
              <?php if(trim((string)$row->details) !== ''): ?><div class="small mt-1"><?php echo $h(mb_substr(strip_tags($row->details), 0, 300, 'UTF-8')); ?></div><?php endif; ?>
            </td>
            <td><div class="d-flex flex-wrap gap-2">
              <form method="post" action="<?php echo $h($url($listing['page'])); ?>" class="m-0" onsubmit="return confirm('Khôi phục bản ghi này về trạng thái 1?');">
                <input type="hidden" name="csrf_token" value="<?php echo $h($admin_csrf_token); ?>"><input type="hidden" name="category" value="<?php echo $h($row->category); ?>"><input type="hidden" name="id" value="<?php echo (int)$row->id; ?>"><input type="hidden" name="trash_action" value="restore">
                <button class="btn btn-sm btn-outline-success" type="submit"><i class="fa-solid fa-rotate-left me-1"></i>Khôi phục</button>
              </form>
              <form method="post" action="<?php echo $h($url($listing['page'])); ?>" class="m-0" onsubmit="return confirm('Xóa VĨNH VIỄN bản ghi này khỏi database? Thao tác không thể hoàn tác.');">
                <input type="hidden" name="csrf_token" value="<?php echo $h($admin_csrf_token); ?>"><input type="hidden" name="category" value="<?php echo $h($row->category); ?>"><input type="hidden" name="id" value="<?php echo (int)$row->id; ?>"><input type="hidden" name="trash_action" value="purge">
                <button class="btn btn-sm btn-outline-danger" type="submit"><i class="fa-regular fa-trash-can me-1"></i>Xóa vĩnh viễn</button>
              </form>
            </div></td>
          </tr>
        <?php endforeach; ?>
        <?php if(!$listing['rows']): ?><tr><td colspan="4" class="text-center text-muted py-5">Không có bản ghi đã xóa phù hợp.</td></tr><?php endif; ?>
        </tbody>
      </table></div>
    </div>
    <?php if($listing['pages'] > 1): ?><div class="card-footer d-flex justify-content-between align-items-center"><a class="btn btn-outline-primary <?php echo $listing['page'] <= 1 ? 'disabled' : ''; ?>" href="<?php echo $h($url(max(1,$listing['page']-1))); ?>">Trang trước</a><span>Trang <?php echo $listing['page']; ?> / <?php echo $listing['pages']; ?></span><a class="btn btn-outline-primary <?php echo $listing['page'] >= $listing['pages'] ? 'disabled' : ''; ?>" href="<?php echo $h($url(min($listing['pages'],$listing['page']+1))); ?>">Trang sau</a></div><?php endif; ?>
  </div>
</div>
<?php require 'footer.php'; ?>
