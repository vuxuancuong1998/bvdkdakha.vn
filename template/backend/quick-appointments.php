<?php require 'header.php';
$bookingH = function($v) { return htmlspecialchars((string)$v, ENT_QUOTES, 'UTF-8'); };
$filters = $appointment_filters ?? array();
$pageQuery = array_merge(array('q'=>$appointment_keyword), $filters);
?>
<div class="content container-fluid">
 <div class="page-header"><div class="row align-items-center"><div class="col"><h3 class="page-title">Đặt lịch khám nhanh</h3><p class="text-muted mb-0">Tổng số: <?php echo (int)$appointment_total; ?> đăng ký.</p></div><div class="col-auto"><a class="btn btn-primary" href="<?php echo XC_URL; ?>/admin/quickappointments/add">Thêm lịch khám</a></div></div></div>
 <?php if(!empty($appointment_flash)): ?><div class="alert alert-<?php echo $bookingH($appointment_flash['type']); ?>"><?php echo $bookingH($appointment_flash['message']); ?></div><?php endif; ?>
 <form method="get" class="card mb-3" action="<?php echo XC_URL; ?>/admin/quickappointments">
 <div class="card-body row g-3">
 <div class="col-12"><label class="form-label" for="appointment-search">Tìm kiếm</label><input id="appointment-search" class="form-control" name="q" maxlength="120" placeholder="Họ tên, CCCD hoặc điện thoại" value="<?php echo $bookingH($appointment_keyword); ?>"></div>
 <?php foreach (array('exam_from'=>'Ngày khám từ','exam_to'=>'Ngày khám đến','registered_from'=>'Ngày đăng ký từ','registered_to'=>'Ngày đăng ký đến') as $field=>$label): ?>
 <div class="col-sm-6 col-xl-3"><label class="form-label" for="filter-<?php echo $field; ?>"><?php echo $label; ?></label><input type="date" class="form-control" id="filter-<?php echo $field; ?>" name="<?php echo $field; ?>" value="<?php echo $bookingH($filters[$field] ?? ''); ?>"></div>
 <?php endforeach; ?>
 <div class="col-12 d-flex gap-2"><button class="btn btn-primary" type="submit">Lọc danh sách</button><a class="btn btn-outline-secondary" href="<?php echo XC_URL; ?>/admin/quickappointments">Xóa bộ lọc</a></div>
 </div></form>
 <?php if(!empty($appointment_filter_errors)): ?><div class="alert alert-danger" role="alert"><?php foreach($appointment_filter_errors as $filterError): ?><div><?php echo $bookingH($filterError); ?></div><?php endforeach; ?></div><?php endif; ?>
 <div class="card"><div class="card-body table-responsive"><table class="table table-hover align-middle"><thead><tr><th>Họ và tên</th><th>Căn cước công dân</th><th>Số điện thoại</th><th>Ngày khám</th><th>Ngày đăng ký</th><th>Thao tác</th></tr></thead><tbody>
 <?php foreach (($appointment_rows ?: array()) as $row): ?><tr>
 <td><?php echo $bookingH($row->full_name); ?></td><td><?php echo $bookingH($row->citizen_id); ?></td><td><?php echo $bookingH($row->phone); ?></td><td><?php echo date('d/m/Y',strtotime($row->exam_date)); ?></td><td><?php echo date('d/m/Y H:i',strtotime($row->created_at)); ?></td>
 <td><div class="d-flex gap-2"><a class="btn btn-sm btn-outline-primary" href="<?php echo XC_URL; ?>/admin/quickappointments/edit/<?php echo (int)$row->id; ?>">Sửa</a><form method="post" action="<?php echo XC_URL; ?>/admin/quickappointments/delete/<?php echo (int)$row->id; ?>" onsubmit="return confirm('Chuyển lịch khám này vào Sọt rác?')"><input type="hidden" name="csrf_token" value="<?php echo $bookingH($admin_csrf_token); ?>"><button class="btn btn-sm btn-outline-danger" type="submit">Xóa</button></form></div></td>
 </tr><?php endforeach; ?>
 <?php if(empty($appointment_rows)): ?><tr><td colspan="6" class="text-center text-muted py-4">Không có lịch khám phù hợp.</td></tr><?php endif; ?>
 </tbody></table></div></div>
 <nav class="d-flex align-items-center gap-3" aria-label="Phân trang lịch khám">
 <?php if($appointment_page > 1): ?><a class="btn btn-outline-secondary" href="?<?php echo $bookingH(http_build_query(array_merge($pageQuery,array('page'=>$appointment_page-1)))); ?>">Trang trước</a><?php endif; ?>
 <span>Trang <?php echo (int)$appointment_page; ?> / <?php echo (int)$appointment_pages; ?></span>
 <?php if($appointment_page < $appointment_pages): ?><a class="btn btn-outline-secondary" href="?<?php echo $bookingH(http_build_query(array_merge($pageQuery,array('page'=>$appointment_page+1)))); ?>">Trang sau</a><?php endif; ?>
 </nav>
</div>
<?php require 'footer.php'; ?>
