<?php require 'header.php';
$h = function($value){ return htmlspecialchars((string)$value, ENT_QUOTES, 'UTF-8'); };
$csrf = $h($admin_csrf_token);
$formVisible = $file_edit || $file_error || isset($_GET['add']);
$pageUrl = function($number) use ($file_search){ return XC_URL.'/admin/files?'.http_build_query(array('q'=>$file_search, 'page'=>$number)); };
?>
<div class="conatiner-fluid content-inner mt-n5 py-0">
  <div class="card">
    <div class="card-header d-flex flex-wrap justify-content-between align-items-center gap-3">
      <div><h4 class="card-title mb-1">Quản lý file</h4><p class="text-muted mb-0"><?php echo (int)$total_files; ?> file</p></div>
      <a href="<?php echo XC_URL; ?>/admin/files?add=1" class="btn btn-success rounded-pill px-4"><i class="fa-solid fa-plus me-2"></i>Thêm file</a>
    </div>
    <div class="card-body">
      <?php if($file_flash): ?><div class="alert alert-<?php echo $h($file_flash['type']); ?>" role="status"><?php echo $h($file_flash['message']); ?></div><?php endif; ?>
      <?php if($file_error): ?><div class="alert alert-danger" role="alert"><?php echo $h($file_error); ?></div><?php endif; ?>
      <?php if($formVisible): ?>
      <form method="post" enctype="multipart/form-data" action="<?php echo XC_URL; ?>/admin/files" class="border rounded p-3 mb-4">
        <h5 class="mb-3"><?php echo $file_edit ? 'Sửa file' : 'Thêm file'; ?></h5>
        <input type="hidden" name="csrf_token" value="<?php echo $csrf; ?>">
        <input type="hidden" name="file_action" value="save">
        <input type="hidden" name="id" value="<?php echo (int)($file_edit->id ?? 0); ?>">
        <div class="row g-3">
          <div class="col-md-6"><label for="fileName" class="form-label">Tên file <span class="text-danger">*</span></label><input id="fileName" name="file_name" class="form-control" required maxlength="255" value="<?php echo $h($_POST['file_name'] ?? ($file_edit->file_name ?? '')); ?>"></div>
          <div class="col-md-6"><label for="fileUpload" class="form-label"><?php echo $file_edit ? 'Thay file (để trống để giữ file hiện tại)' : 'Chọn file *'; ?></label><input id="fileUpload" type="file" name="file_upload" class="form-control" accept=".pdf,.doc,.docx,.xls,.xlsx,.ppt,.pptx,.txt,.csv,.zip,.rar,.7z,.jpg,.jpeg,.png,.gif,.webp,.mp3,.mp4" <?php echo $file_edit ? '' : 'required'; ?>></div>
          <div class="col-12"><small class="text-muted">Hỗ trợ tài liệu Office, PDF, TXT, CSV, ZIP, RAR, 7Z, ảnh JPG/PNG/GIF/WebP, MP3, MP4. Tối đa 20 MB hoặc giới hạn máy chủ (upload_max_filesize: <?php echo $h(ini_get('upload_max_filesize')); ?>; post_max_size: <?php echo $h(ini_get('post_max_size')); ?>).</small><?php if($file_edit): ?><p class="mb-0 mt-2">File hiện tại: <?php echo $h($file_edit->original_name); ?></p><?php endif; ?></div>
          <div class="col-12 d-flex gap-2"><button type="submit" class="btn btn-primary">Lưu file</button><a class="btn btn-light" href="<?php echo XC_URL; ?>/admin/files">Hủy</a></div>
        </div>
      </form>
      <?php endif; ?>
      <form method="get" action="<?php echo XC_URL; ?>/admin/files" class="d-flex gap-2 mb-4"><input type="search" name="q" class="form-control" style="max-width:430px" placeholder="Tìm theo tên file..." aria-label="Tìm theo tên file" value="<?php echo $h($file_search); ?>"><button class="btn btn-primary">Tìm kiếm</button></form>
      <div id="copyFeedback" class="d-none alert" role="status"></div>
      <div class="table-responsive"><table class="table table-hover align-middle">
        <thead class="bg-light"><tr><th>STT</th><th>Tên file</th><th>Dung lượng</th><th>Ngày thêm</th><th>Thao tác</th></tr></thead>
        <tbody><?php foreach($files as $index => $file): $url = XC_URL.'/Uploads/files/'.rawurlencode($file->file_path); ?>
          <tr><td><?php echo ($page - 1) * 20 + $index + 1; ?></td><td><strong><?php echo $h($file->file_name); ?></strong><div class="small text-muted text-break"><?php echo $h($file->original_name); ?></div><a class="small" href="<?php echo $h($url); ?>" download>Tải file</a></td><td><?php echo number_format($file->file_size / 1024, 1); ?> KB</td><td><?php echo $h(date('d/m/Y H:i', strtotime($file->created_at))); ?></td>
          <td><div class="d-flex gap-2">
            <button type="button" class="btn btn-sm btn-outline-primary copy-file" data-url="<?php echo $h($url); ?>" title="Copy đường dẫn file"><i class="fa-regular fa-copy"></i><span class="visually-hidden">Copy đường dẫn</span></button>
            <a class="btn btn-sm btn-outline-warning" href="<?php echo XC_URL; ?>/admin/files?edit=<?php echo (int)$file->id; ?>" title="Sửa file"><i class="fa-solid fa-pen-to-square"></i><span class="visually-hidden">Sửa</span></a>
            <form method="post" action="<?php echo XC_URL; ?>/admin/files" class="m-0" onsubmit="return confirm('Bạn có chắc muốn xóa file này?');"><input type="hidden" name="csrf_token" value="<?php echo $csrf; ?>"><input type="hidden" name="file_action" value="delete"><input type="hidden" name="id" value="<?php echo (int)$file->id; ?>"><button class="btn btn-sm btn-outline-danger" title="Xóa file"><i class="fa-regular fa-trash-can"></i><span class="visually-hidden">Xóa</span></button></form>
          </div></td></tr>
        <?php endforeach; ?>
        <?php if(!$files): ?><tr><td colspan="5" class="text-center text-muted py-5">Chưa có file phù hợp.</td></tr><?php endif; ?></tbody>
      </table></div>
    </div>
    <?php if($total_pages > 1): ?><div class="card-footer d-flex justify-content-between align-items-center"><a class="btn btn-outline-primary <?php echo $page <= 1 ? 'disabled' : ''; ?>" href="<?php echo $h($pageUrl(max(1, $page - 1))); ?>">Trang trước</a><span>Trang <?php echo $page; ?> / <?php echo $total_pages; ?></span><a class="btn btn-outline-primary <?php echo $page >= $total_pages ? 'disabled' : ''; ?>" href="<?php echo $h($pageUrl(min($total_pages, $page + 1))); ?>">Trang sau</a></div><?php endif; ?>
  </div>
</div>
<script>
document.querySelectorAll('.copy-file').forEach(function(button) {
  button.addEventListener('click', async function() {
    var url = button.dataset.url, success = false;
    try { if(navigator.clipboard && window.isSecureContext) { await navigator.clipboard.writeText(url); success = true; } } catch(e) {}
    if(!success) {
      var field = document.createElement('textarea'); field.value = url; field.style.position = 'fixed'; field.style.opacity = '0'; document.body.appendChild(field); field.select();
      try { success = document.execCommand('copy'); } catch(e) {} field.remove();
    }
    var feedback = document.getElementById('copyFeedback'); feedback.className = 'alert ' + (success ? 'alert-success' : 'alert-warning');
    feedback.textContent = success ? 'Đã copy đường dẫn file.' : 'Không thể copy tự động. Đường dẫn: ' + url;
  });
});
</script>
<?php require 'footer.php'; ?>
