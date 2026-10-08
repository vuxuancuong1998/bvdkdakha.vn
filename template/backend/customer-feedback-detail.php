<?php include_once 'header.php';
$item = isset($customer_feedback_detail) ? $customer_feedback_detail : null;
$labels = array(0 => 'Chờ xử lý', 1 => 'Đã xử lý', 2 => 'Không tiếp nhận');
$badges = array(0 => 'warning', 1 => 'success', 2 => 'secondary');
$escape = function($value){ return htmlspecialchars((string)$value, ENT_QUOTES, 'UTF-8'); };
?>
<div class="content container-fluid">
   <div class="page-header">
      <div class="row align-items-center">
         <div class="col">
            <h3 class="page-title">Chi tiết góp ý / phản ánh</h3>
            <ul class="breadcrumb">
               <li class="breadcrumb-item"><a href="<?php echo XC_URL; ?>/admin/customerfeedbacks">Danh sách phản hồi</a></li>
               <li class="breadcrumb-item active">Chi tiết</li>
            </ul>
         </div>
         <div class="col-auto"><a class="btn btn-light border" href="<?php echo XC_URL; ?>/admin/customerfeedbacks">Quay lại danh sách</a></div>
      </div>
   </div>

   <?php if(!empty($customer_feedback_flash)): ?>
      <div class="alert alert-<?php echo $customer_feedback_flash['type'] === 'success' ? 'success' : 'info'; ?>"><?php echo $escape($customer_feedback_flash['message']); ?></div>
   <?php endif; ?>

   <div class="card"><div class="card-body">
      <?php if($item): $status = (int)$item->status; ?>
         <div class="d-flex align-items-center gap-2 mb-4">
            <strong>Trạng thái:</strong>
            <span class="badge bg-<?php echo $badges[$status]; ?>"><?php echo $escape($labels[$status]); ?></span>
         </div>
         <div class="row g-4">
            <div class="col-md-6">
               <label class="form-label text-muted">Họ và tên</label>
               <div class="fw-semibold"><?php echo $escape($item->customer_name); ?></div>
            </div>
            <div class="col-md-6">
               <label class="form-label text-muted">Ngày gửi</label>
               <div><?php echo $escape(date('d/m/Y H:i', strtotime($item->create_date))); ?></div>
            </div>
            <div class="col-md-6">
               <label class="form-label text-muted">Số điện thoại</label>
               <div><a href="tel:<?php echo $escape(preg_replace('/[^+0-9]/', '', $item->customer_phone)); ?>"><?php echo $escape($item->customer_phone); ?></a></div>
            </div>
            <div class="col-md-6">
               <label class="form-label text-muted">Email</label>
               <div><?php if($item->customer_email !== ''): ?><a href="mailto:<?php echo $escape($item->customer_email); ?>"><?php echo $escape($item->customer_email); ?></a><?php else: ?>—<?php endif; ?></div>
            </div>
            <?php if(trim((string)$item->customer_address) !== ''): ?>
               <div class="col-12">
                  <label class="form-label text-muted">Địa chỉ</label>
                  <div><?php echo $escape($item->customer_address); ?></div>
               </div>
            <?php endif; ?>
            <div class="col-12">
               <label class="form-label text-muted">Nội dung phản hồi</label>
               <div class="border rounded-3 p-3 bg-light"><?php echo nl2br($escape($item->content)); ?></div>
            </div>
            <div class="col-12">
               <form method="post" class="row g-2 align-items-end">
                  <input type="hidden" name="csrf_token" value="<?php echo $escape($admin_csrf_token); ?>">
                  <input type="hidden" name="id" value="<?php echo (int)$item->id; ?>">
                  <div class="col-sm-auto">
                     <label class="form-label" for="feedback-status">Cập nhật trạng thái</label>
                     <select class="form-select" id="feedback-status" name="status">
                        <?php foreach($labels as $code => $label): ?>
                           <option value="<?php echo $code; ?>"<?php echo $status === $code ? ' selected' : ''; ?>><?php echo $escape($label); ?></option>
                        <?php endforeach; ?>
                     </select>
                  </div>
                  <div class="col-sm-auto"><button class="btn btn-primary" type="submit" name="customer_feedback_action" value="update_status">Lưu trạng thái</button></div>
               </form>
            </div>
            <div class="col-12 border-top pt-4">
               <form method="post" onsubmit="return confirm('Xóa vĩnh viễn phản hồi này?');">
                  <input type="hidden" name="csrf_token" value="<?php echo $escape($admin_csrf_token); ?>">
                  <input type="hidden" name="id" value="<?php echo (int)$item->id; ?>">
                  <button class="btn btn-danger" type="submit" name="customer_feedback_action" value="delete">Xóa phản hồi</button>
               </form>
            </div>
         </div>
      <?php else: ?>
         <div class="text-muted">Không tìm thấy phản hồi.</div>
      <?php endif; ?>
   </div></div>
</div>
<?php include_once 'footer.php'; ?>