<?php include_once 'header.php';
$items = isset($customer_feedbacks) && is_array($customer_feedbacks) ? $customer_feedbacks : array();
$page = (int)$customer_feedback_page;
$perPage = (int)$customer_feedback_per_page;
$total = (int)$customer_feedback_total;
$totalPages = (int)$customer_feedback_total_pages;
$keyword = (string)$customer_feedback_keyword;
$escape = function($value){ return htmlspecialchars((string)$value, ENT_QUOTES, 'UTF-8'); };
$pageUrl = function($target) use ($keyword){
   return XC_URL.'/admin/customerfeedbacks?'.http_build_query(array('page' => $target, 'keyword' => $keyword));
};
$excerpt = function($value){
   $value = trim((string)$value);
   return function_exists('mb_strimwidth') ? mb_strimwidth($value, 0, 90, '…', 'UTF-8') : (strlen($value) > 90 ? substr($value, 0, 90).'...' : $value);
};
?>
<style>
.feedback-page .page-header { margin-bottom: 1rem; }
.feedback-page .feedback-toolbar { display:flex; align-items:center; gap:.75rem; flex-wrap:wrap; }
.feedback-page .feedback-toolbar form { display:flex; gap:.5rem; flex:1; max-width:540px; }
.feedback-page .feedback-toolbar input { min-width:0; }
.feedback-page .feedback-list { border:1px solid #e6e9ed; border-radius:.75rem; overflow:hidden; }
.feedback-page .feedback-row { display:grid; grid-template-columns:minmax(0,1.25fr) minmax(0,1fr) minmax(0,1.8fr) auto; align-items:center; gap:1rem; padding:.7rem 1rem; border-bottom:1px solid #edf0f2; }
.feedback-page .feedback-row:last-child { border-bottom:0; }
.feedback-page .feedback-row:hover { background:#f8fafc; }
.feedback-page .feedback-cell { min-width:0; }
.feedback-page .feedback-ellipsis { overflow:hidden; text-overflow:ellipsis; white-space:nowrap; }
.feedback-page .feedback-meta, #feedbackDetailModal .feedback-meta { color:#64748b; font-size:.82rem; }
.feedback-page .feedback-actions { display:flex; align-items:center; gap:.4rem; white-space:nowrap; }
#feedbackDetailModal .feedback-content { white-space:pre-wrap; overflow-wrap:anywhere; }
@media (max-width: 1100px) {
   .feedback-page .feedback-row { grid-template-columns:minmax(0,1.2fr) minmax(0,1fr) auto; }
   .feedback-page .feedback-preview { display:none; }
}
@media (max-width: 700px) {
   .feedback-page .feedback-row { grid-template-columns:minmax(0,1fr) auto; gap:.5rem; }
   .feedback-page .feedback-contact { display:none; }
   .feedback-page .feedback-actions { flex-wrap:wrap; justify-content:flex-end; }
}
</style>
<div class="content container-fluid feedback-page">
   <div class="page-header">
      <div class="row align-items-center">
         <div class="col">
            <h3 class="page-title">Góp ý / Phản ánh</h3>
            <div class="text-muted small">Tổng cộng <?php echo number_format($total); ?> góp ý</div>
         </div>
      </div>
   </div>

   <?php if(!empty($customer_feedback_flash)): ?>
      <div class="alert alert-<?php echo $customer_feedback_flash['type'] === 'success' ? 'success' : 'info'; ?> py-2"><?php echo $escape($customer_feedback_flash['message']); ?></div>
   <?php endif; ?>

   <div class="card mb-0"><div class="card-body p-3">
      <div class="feedback-toolbar mb-3">
         <form method="get" action="<?php echo XC_URL; ?>/admin/customerfeedbacks">
            <input class="form-control" type="search" name="keyword" value="<?php echo $escape($keyword); ?>" placeholder="Tìm tên, SĐT, email hoặc nội dung" aria-label="Tìm góp ý">
            <button class="btn btn-primary" type="submit">Tìm</button>
         </form>
         <?php if($keyword !== ''): ?><a class="btn btn-light border" href="<?php echo XC_URL; ?>/admin/customerfeedbacks">Xóa lọc</a><?php endif; ?>
      </div>

      <div class="feedback-list">
         <?php if($items): ?>
            <?php foreach($items as $index => $item):
               $date = !empty($item->create_date) ? date('d/m/Y H:i', strtotime($item->create_date)) : '';
               $payload = json_encode(array(
                  'id' => (int)$item->id,
                  'name' => (string)$item->customer_name,
                  'phone' => (string)$item->customer_phone,
                  'email' => (string)$item->customer_email,
                  'address' => (string)$item->customer_address,
                  'content' => (string)$item->content,
                  'date' => $date
               ), JSON_UNESCAPED_UNICODE | JSON_HEX_TAG | JSON_HEX_AMP | JSON_HEX_APOS | JSON_HEX_QUOT);
            ?>
               <div class="feedback-row">
                  <div class="feedback-cell">
                     <div class="fw-semibold feedback-ellipsis"><?php echo $escape($item->customer_name); ?></div>
                     <div class="feedback-meta">#<?php echo (int)$item->id; ?> · <?php echo $escape($date); ?></div>
                  </div>
                  <div class="feedback-cell feedback-contact">
                     <div class="feedback-ellipsis"><?php echo $escape($item->customer_phone); ?></div>
                     <div class="feedback-meta feedback-ellipsis"><?php echo $escape($item->customer_email); ?></div>
                  </div>
                  <div class="feedback-cell feedback-preview feedback-ellipsis"><?php echo $escape($excerpt($item->content)); ?></div>
                  <div class="feedback-actions">
                     <button class="btn btn-sm btn-outline-primary" type="button" data-bs-toggle="modal" data-bs-target="#feedbackDetailModal" data-feedback="<?php echo $escape($payload); ?>">Xem chi tiết</button>
                     <form method="post" onsubmit="return confirm('Xóa vĩnh viễn góp ý này?');">
                        <input type="hidden" name="csrf_token" value="<?php echo $escape($admin_csrf_token); ?>">
                        <input type="hidden" name="id" value="<?php echo (int)$item->id; ?>">
                        <button class="btn btn-sm btn-outline-danger" name="customer_feedback_action" value="delete" type="submit">Xóa</button>
                     </form>
                  </div>
               </div>
            <?php endforeach; ?>
         <?php else: ?>
            <div class="text-center text-muted py-5">Không có góp ý phù hợp.</div>
         <?php endif; ?>
      </div>

      <?php if($totalPages > 1): ?>
         <nav class="mt-3" aria-label="Phân trang góp ý"><ul class="pagination pagination-sm justify-content-end mb-0">
            <?php for($i = 1; $i <= $totalPages; $i++): ?>
               <li class="page-item<?php echo $i === $page ? ' active' : ''; ?>"><a class="page-link" href="<?php echo $escape($pageUrl($i)); ?>"><?php echo $i; ?></a></li>
            <?php endfor; ?>
         </ul></nav>
      <?php endif; ?>
   </div></div>
</div>

<div class="modal fade" id="feedbackDetailModal" tabindex="-1" aria-labelledby="feedbackDetailTitle" aria-hidden="true">
   <div class="modal-dialog modal-lg modal-dialog-centered modal-dialog-scrollable">
      <div class="modal-content">
         <div class="modal-header">
            <h5 class="modal-title" id="feedbackDetailTitle">Chi tiết góp ý</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Đóng"></button>
         </div>
         <div class="modal-body">
            <div class="row g-3">
               <div class="col-sm-6"><div class="feedback-meta">Họ và tên</div><strong id="feedbackModalName"></strong></div>
               <div class="col-sm-6"><div class="feedback-meta">Ngày gửi</div><div id="feedbackModalDate"></div></div>
               <div class="col-sm-6"><div class="feedback-meta">Số điện thoại</div><div id="feedbackModalPhone"></div></div>
               <div class="col-sm-6"><div class="feedback-meta">Email</div><div id="feedbackModalEmail"></div></div>
               <div class="col-12" id="feedbackModalAddressWrap"><div class="feedback-meta">Địa chỉ</div><div id="feedbackModalAddress"></div></div>
               <div class="col-12"><div class="feedback-meta mb-1">Nội dung góp ý</div><div class="border rounded p-3 feedback-content" id="feedbackModalContent"></div></div>
            </div>
         </div>
         <div class="modal-footer">
            <form method="post" class="me-auto" onsubmit="return confirm('Xóa vĩnh viễn góp ý này?');">
               <input type="hidden" name="csrf_token" value="<?php echo $escape($admin_csrf_token); ?>">
               <input type="hidden" name="id" id="feedbackModalDeleteId">
               <button class="btn btn-outline-danger" name="customer_feedback_action" value="delete" type="submit">Xóa góp ý</button>
            </form>
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
         </div>
      </div>
   </div>
</div>

<script>
(function() {
   var modal = document.getElementById('feedbackDetailModal');
   if (!modal) return;
   modal.addEventListener('show.bs.modal', function(event) {
      var button = event.relatedTarget;
      if (!button) return;
      var data = JSON.parse(button.getAttribute('data-feedback'));
      document.getElementById('feedbackDetailTitle').textContent = 'Chi tiết góp ý #' + data.id;
      document.getElementById('feedbackModalName').textContent = data.name;
      document.getElementById('feedbackModalDate').textContent = data.date;
      document.getElementById('feedbackModalPhone').textContent = data.phone;
      document.getElementById('feedbackModalEmail').textContent = data.email || '—';
      document.getElementById('feedbackModalAddress').textContent = data.address;
      document.getElementById('feedbackModalAddressWrap').style.display = data.address ? '' : 'none';
      document.getElementById('feedbackModalContent').textContent = data.content;
      document.getElementById('feedbackModalDeleteId').value = data.id;
   });
})();
</script>
<?php include_once 'footer.php'; ?>