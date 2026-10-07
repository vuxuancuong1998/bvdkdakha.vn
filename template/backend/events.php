<?php
include_once "header.php";
$events = is_array($events) ? $events : array();
$page = isset($page) ? (int) $page : 1;
$per_page = isset($per_page) ? (int) $per_page : 20;
$total_events = isset($total_events) ? (int) $total_events : count($events);
$total_pages = isset($total_pages) ? (int) $total_pages : 1;
$row_offset = max(0, ($page - 1) * $per_page);
$can_event_approve = !empty($can_event_approve);
$can_event_publish = !empty($can_event_publish);
$current_user_id = isset($_SESSION['user']['id']) ? (int)$_SESSION['user']['id'] : 0;
$event_status_labels = array(1=>'Bản nháp', 2=>'Chờ phê duyệt', 3=>'Đã phê duyệt', 4=>'Đã công khai');

if (!function_exists('backendEventTitleExcerpt')) {
	function backendEventTitleExcerpt($value, $limit = 60) {
		$value = trim((string) $value);
		if ($value === '') {
			return '';
		}
		if (function_exists('mb_strlen') && function_exists('mb_substr')) {
			return mb_strlen($value, 'UTF-8') > $limit ? mb_substr($value, 0, $limit, 'UTF-8').'...' : $value;
		}
		return strlen($value) > $limit ? substr($value, 0, $limit).'...' : $value;
	}
}

if (!function_exists('backendEventBuildUrl')) {
	function backendEventBuildUrl($targetPage) {
		return XC_URL.'/admin/events?page='.(int) $targetPage;
	}
}

if (!function_exists('backendEventPaginationItems')) {
	function backendEventPaginationItems($currentPage, $totalPages) {
		$currentPage = max(1, (int) $currentPage);
		$totalPages = max(1, (int) $totalPages);
		if ($totalPages <= 7) {
			return range(1, $totalPages);
		}
		if ($currentPage <= 4) {
			return array(1, 2, 3, 4, 5, 'ellipsis', $totalPages);
		}
		if ($currentPage >= $totalPages - 3) {
			return array(1, 'ellipsis', $totalPages - 4, $totalPages - 3, $totalPages - 2, $totalPages - 1, $totalPages);
		}
		return array(1, 'ellipsis', $currentPage - 1, $currentPage, $currentPage + 1, 'ellipsis', $totalPages);
	}
}
?>
<script src="https://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.min.js" type="text/javascript"></script>
<script>
		$(document).ready(function(){
		$('#table-events').on('click', '.btn-event-workflow', function(e){
			e.preventDefault();
			var button = $(this), action = button.data('action'), reason = '';
			if(action === 'return'){
				reason = window.prompt('Nhập lý do trả về:') || '';
				if(!$.trim(reason)){ return; }
			}
			$.post('<?php echo XC_URL; ?>/api/eventWorkflow', {id:button.data('id'), action:action, reason:reason}, function(resp){
				if(resp.status == 200){ Swal.fire({icon:'success',title:resp.message,timer:1300,showConfirmButton:false}); setTimeout(function(){location.reload();},1400); }
				else { Swal.fire({icon:'error',title:'Không thể thực hiện',text:resp.message || 'Có lỗi xảy ra'}); }
			}, 'json');
		});
		 $.validator.addMethod("alpha", function(value, element){

        return this.optional(element) || value == value.match(/^[0-9, '']+$/);

    }, "Vui lòng nhập ký tự số!");
	$("#frm-action").validate({
		onfocusout: false,
		onkeyup: false,
		onclick: false,
		rules: {
			"employee_phone": {
				required: true,
				alpha: true,
				maxlength: 15,
				minlength: 8
			},
			"employee_national_id": {
				required: true,
				alpha: true,
				maxlength: 15,
				minlength: 5
			},
			"employee_name":{
				required: true
			},
			"employee_branch":{
				required: true
			},
			"employee_position":{
				required: true
			},
			"employee_address":{
				required: true
			},
			"employee_birthday":{
				required: true
			},
			"employee_gender":{
				required: true
			},
			"employee_email":{
				required: true
			},
			"employee_department":{
				required: true
			},
			"employee_issue_date":{
				required: true
			},
			"employee_issue_by":{
				required: true
			},
			"employee_issue_date":{
				required: true
			}
			
			
			
		},
		messages:{
				employee_national_id: {
					required: "Vui lòng số CMND",
					minlength: "số CMND phải vượt quá 5 ký tự",
					maxlength: "số CMND phải ngắn hơn 15 ký tự"
				},
				employee_phone: {
					required: "Vui lòng nhập số điện thoại",
					minlength: "Số điện thoại phải vượt quá 8 ký tự",
					maxlength: "Số điện thoại phải ngắn hơn 15 ký tự"
				},
				employee_name: "Vui lòng nhập tên nhân viên",
				employee_branch: "Vui lòng chọn đơn vị",
				employee_position: "Vui lòng chọn chức danh",
				employee_address: "Vui lòng nhập địa chỉ",
				employee_birthday: "Vui lòng nhập ngày sinh",
				employee_gender: "Vui lòng chọn giới tính",
				employee_email: "Vui lòng nhập email",
				employee_department: "Vui lòng chọn phòng ban",
				employee_issue_date: "Vui lòng nhập ngày cấp",
				employee_issue_by: "Vui lòng nhập nơi cấp"
				
			}
	});
		$("#table-events").on('click', '.btn-delete-event', function(e) {
			var id = $(this).attr("data-id");
			var event_status =  $(this).attr("data-status");
			$.ajax({
				"type": "POST",
				"url": "<?php echo XC_URL; ?>/api/deleteEvent",
				"data": {
					'id': id,
					'event_status': event_status
				},
				"dataType":'json',
				success:function(data){
					if(data.status == 200){
						Swal.fire({
						  icon: 'success',
						  title: "Xoá thành công",
						  footer: '<a href=""></a>',
						  timer: 1700
						})
						setTimeout(function(){ location.reload();     }, 2000);
					}else{
						Swal.fire({
						  icon: 'error',
						  title: "Lỗi",
						  text: data.message,
						  footer: '<a href=""></a>'
						})
					}
				}
			
			});
			return false;
		});
		$("#table-employee").on('click', '.btn-calendar-employee', function(e) {
			$('#employee_id').val($(this).data('id'));

		});
		$('#updateCalendarEmployee').click(function(e) {
			var eid =  $('#employee_id').val();
			var employee_calendar =  $('#employee_calendar').val();
			var employee_shift = $('#employee_shift').val();
			$.ajax({
				"type": "POST",
				"url": "<?php echo XC_URL; ?>/api/calendarEmployee",
				"data": {
					'eid': eid,
					'employee_shift': employee_shift,
					'employee_calendar': employee_calendar
				},
				"dataType":'json',
				success:function(data){
					if(data.status == 200){
						Swal.fire({
						  icon: 'success',
						  title: "Lưu thành công",
						  footer: '<a href=""></a>',
						  timer: 1700
						})
						setTimeout(function(){ location.reload();     }, 2000);
					}else{
						Swal.fire({
						  icon: 'error',
						  title: "Lỗi",
						  text: data.message,
						  footer: '<a href=""></a>'
						})
					}
				}
			
			});
			return false;
		});
		
		
		$("#table-employee").on('click', '.btn-duplicate-employee', function(e) {
			var eid = $(this).attr("data-id");
			$.ajax({
				"type": "POST",
				"url": "<?php echo XC_URL; ?>/api/duplicateEmployee",
				"data": {
					'eid': eid
				},
				"dataType":'json',
				success:function(data){
					if(data.status == 200){
						Swal.fire({
						  icon: 'success',
						  title: "Nhân bản thành công",
						  text: "Mã Khách hàng/NCC mới: " + data.event_employee_code,
						  footer: '<a href=""></a>',
						  timer: 1700
						})
						setTimeout(function(){ location.reload();     }, 2000);
					}else{
						Swal.fire({
						  icon: 'error',
						  title: "Lỗi",
						  text: data.message,
						  footer: '<a href=""></a>'
						})
					}
				}
			
			});
			return false;
		});
	
		
	
		
	});
</script>
<style>
::placeholder{
	font-size:12px;
	font-style: italic;
}
.btn-search{
	background-color:white;
	border:none;
}
label.error{
	color:red;
}
.event-title-cell{
	width: 30%;
}
.event-title-text{
	display: -webkit-box;
	max-width: 100%;
	font-weight: 600;
	color: #213547;
	white-space: normal;
	overflow: hidden;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
	line-height: 1.35;
	vertical-align: middle;
}
.events-card .table-responsive{overflow-x:visible}
.events-card{font-size:12px}
.events-card .card-body{padding:0}
.page-header{margin-bottom:14px}
.page-header .page-title{font-size:20px;line-height:1.25;margin-bottom:3px}
.page-header .breadcrumb{font-size:11px;margin-bottom:0}
.page-header .btn{font-size:12px;padding:7px 12px}
#table-events{width:100%;table-layout:fixed;margin:0;font-size:12px}
#table-events th{padding:9px 7px;font-size:11px;line-height:1.2;white-space:normal;text-transform:uppercase;letter-spacing:.02em;color:#52657a}
#table-events td{padding:7px;line-height:1.35;vertical-align:middle;overflow-wrap:anywhere}
#table-events tbody tr{height:62px}
.event-thumb{display:block;width:58px;height:44px;object-fit:cover;border-radius:7px;border:1px solid #e2e8f0;background:#f8fafc}
.event-date-cell{white-space:nowrap;font-size:11px;color:#64748b}
.event-type-cell{font-size:11px;line-height:1.3}
.event-status-badge{display:inline-flex;align-items:center;justify-content:center;max-width:100%;padding:5px 7px;font-size:10px;line-height:1.2;white-space:normal;text-align:center;border-radius:999px}
.event-action-group{
	display: flex;
	align-items: center;
	justify-content:flex-start;
	gap: 4px;
	flex-wrap: wrap;
}
.event-icon-btn{
	order:30;
	width: 29px;
	height: 29px;
	padding:0;
	border-radius: 8px;
	display: inline-flex;
	align-items: center;
	justify-content: center;
	border: 1px solid rgba(58, 79, 114, 0.12);
	background: #fff;
	color: #314866;
	transition: all .2s ease;
}
.event-icon-btn i{font-size:12px}
.event-icon-btn.is-view{order:10;color:#2563eb;background:#eff6ff}
.event-icon-btn.is-edit{order:20;background:#ecfdf5}
.event-icon-btn.is-delete{order:90;background:#fff1f2}
.event-icon-btn[data-action="submit"]{color:#7c3aed;background:#f5f3ff}
.event-icon-btn[data-action="cancel_submit"]{color:#b45309;background:#fffbeb}
.event-icon-btn[data-action="approve"]{color:#15803d;background:#f0fdf4}
.event-icon-btn[data-action="return"]{color:#c2410c;background:#fff7ed}
.event-icon-btn[data-action="publish"]{color:#0369a1;background:#f0f9ff}
.event-icon-btn[data-action="unpublish"]{color:#475569;background:#f1f5f9}
.event-icon-btn:hover{
	transform: translateY(-1px);
	color: #079aa2;
	border-color: rgba(7, 154, 162, 0.35);
}
.event-icon-btn.is-edit{
	color: #0d8b4c;
}
.event-icon-btn.is-delete{
	color: #dc3545;
}
.event-icon-btn.is-delete:hover{
	color: #b42318;
	border-color: rgba(220, 53, 69, 0.35);
}
@media (max-width:1199px){
	#table-events{font-size:11px}
	#table-events th,#table-events td{padding-left:5px;padding-right:5px}
	.event-icon-btn{width:27px;height:27px}
	.event-thumb{width:52px;height:40px}
}
</style>
<div class="content container-fluid">
   
   <div class="page-header">
      <div class="row align-items-center">
         <div class="col">
            <h3 class="page-title">Danh sách Tin tức & Sự kiện</h3>
            <ul class="breadcrumb">
               <!-- <li class="breadcrumb-item"><a href="<?php echo XC_URL?>">CloudERP</a></li> -->
               <li class="breadcrumb-item active">Tin tức & Sự kiện</li>
            </ul>
         </div>
         <div class="col-auto">
             <a href="<?php echo XC_URL; ?>/admin/events/add" class="btn btn-primary" data-method = 'add' data-toggle="" data-target=".bd-example-modal-lg" >
            Thêm mới
            </a>
            <!-- <a class="btn btn-primary filter-btn" href="javascript:void(0);" id="filter_search">
            <i class="fas fa-filter"></i>
            </a> -->
         </div>
      </div>
   </div>
   
   </div>
   <div class="row">
      <div class="col-sm-12">
         <div class="card card-table events-card">
            <div class="card-body">
               <div class="table-responsive">
                  <table id="table-events" class="table table-center table-hover">
                     <colgroup>
                        <col style="width:4%"><col style="width:29%"><col style="width:8%"><col style="width:11%">
                        <col style="width:11%"><col style="width:12%"><col style="width:11%"><col style="width:14%">
                     </colgroup>
                     <thead class="thead-light">
                        <tr>
                           <th>STT</th>
                           <th>Tiêu đề</th>
						   <th>Ảnh đại diện</th>
						   <th>Ngày đăng</th>
						   <th>Tác giả</th>
						   <th>Loại tin</th>
                           <th>Trạng thái</th>
                           <th>Thao tác</th>
                        </tr>
                     </thead>
                     <tbody>
                        <?php 
							$i = $row_offset + 1;
							foreach($events as $event)
                           {
                           ?>
                        <tr>
                           <td>
                              <?php echo $i;?>
                           </td>
						   
                           <td class="event-title-cell">
                              <span class="event-title-text" title="<?php echo htmlspecialchars($event->event_name, ENT_QUOTES, 'UTF-8'); ?>">
                                 <?php echo htmlspecialchars(backendEventTitleExcerpt($event->event_name, 60), ENT_QUOTES, 'UTF-8'); ?>
                              </span>
                           </td>
						    <td id='image'>
							<?php if($event->event_image != null){?>
							<img class="event-thumb" src="<?php echo XC_URL . '/uploads/events/' . $event->event_image; ?>" alt=""/></td>
							<?php }else{?>
							<img class="event-thumb" src="<?php echo XC_URL . '/uploads/events/event_default.png'; ?>" alt=""/></td>
							<?php }?>
                           <td class="event-date-cell"><?php echo date('d/m/Y', strtotime($event->event_created_date)); ?><br><small><?php echo date('H:i', strtotime($event->event_created_date)); ?></small></td>
                           <td><?php echo htmlspecialchars((string)($event->author_name ?? ''), ENT_QUOTES, 'UTF-8'); ?></td>
                           <td class="event-type-cell"><?php echo htmlspecialchars((string)($event->category_name ?? 'Chưa phân loại'), ENT_QUOTES, 'UTF-8'); ?></td>
                           <td><span class="badge event-status-badge bg-<?php echo (int)$event->event_status === 4 ? 'success' : ((int)$event->event_status === 2 ? 'warning' : ((int)$event->event_status === 3 ? 'info' : 'secondary')); ?>"><?php echo $event_status_labels[(int)$event->event_status] ?? 'Không xác định'; ?></span></td>
                           <td>
                              <div class="event-action-group">
								    <a href="<?php echo XC_URL; ?>/admin/events/detail/<?php echo $event->eid;?>" class="event-icon-btn is-view" title="Xem chi tiết" aria-label="Xem chi tiết">
									   <i class="fa-regular fa-eye"></i>
									</a>
								    <?php $is_owner = (int)$event->event_user_created === $current_user_id || (isset($_SESSION['user']['group']) && (int)$_SESSION['user']['group'] === 1); if((int)$event->event_status === 1 && $is_owner): ?>
								    <a href="<?php echo XC_URL; ?>/admin/events/edit/<?php echo $event->eid;?>" data-method='update' class="event-icon-btn is-edit btn-edit" title="Sửa" aria-label="Sửa">
									   <i class="fa-regular fa-pen-to-square"></i>
									</a>
									  <a class="event-icon-btn is-delete btn-delete-event" data-id="<?php echo $event->eid;?>" href="#" data-status="<?php echo $event->event_status;?>" title="Xóa" aria-label="Xóa">
									     <i class="fa-regular fa-trash-can"></i>
									  </a>
									  <button class="event-icon-btn btn-event-workflow" data-id="<?php echo $event->eid;?>" data-action="submit" title="Gửi phê duyệt"><i class="fa-solid fa-paper-plane"></i></button>
									  <?php elseif((int)$event->event_status === 2 && $is_owner): ?><button class="event-icon-btn btn-event-workflow" data-id="<?php echo $event->eid;?>" data-action="cancel_submit" title="Hủy gửi phê duyệt"><i class="fa-solid fa-rotate-left"></i></button><?php endif; ?>
									  <?php if((int)$event->event_status === 2 && $can_event_approve): ?><button class="event-icon-btn btn-event-workflow" data-id="<?php echo $event->eid;?>" data-action="approve" title="Phê duyệt"><i class="fa-solid fa-check"></i></button><button class="event-icon-btn btn-event-workflow" data-id="<?php echo $event->eid;?>" data-action="return" title="Trả về"><i class="fa-solid fa-reply"></i></button><?php endif; ?>
									  <?php if((int)$event->event_status === 3 && $can_event_approve): ?><button class="event-icon-btn btn-event-workflow" data-id="<?php echo $event->eid;?>" data-action="return" title="Trả về"><i class="fa-solid fa-reply"></i></button><?php endif; ?>
									  <?php if((int)$event->event_status === 3 && $can_event_publish): ?><button class="event-icon-btn btn-event-workflow" data-id="<?php echo $event->eid;?>" data-action="publish" title="Công khai"><i class="fa-solid fa-globe"></i></button><?php endif; ?>
									  <?php if((int)$event->event_status === 4 && $can_event_publish): ?><button class="event-icon-btn btn-event-workflow" data-id="<?php echo $event->eid;?>" data-action="unpublish" title="Hủy công khai"><i class="fa-solid fa-eye-slash"></i></button><?php endif; ?>
								</div>
                           </td>
                        </tr>
                        <?php
							$i++;
                           }
                           ?>
                     </tbody>
                  </table>
               </div>
               <?php if ($total_pages > 1): ?>
                  <div class="px-4 py-3 border-top d-flex flex-wrap justify-content-between align-items-center gap-3">
                     <small class="text-muted">Tổng cộng <?php echo number_format($total_events, 0, ',', '.'); ?> tin, hiển thị <?php echo $per_page; ?> tin mỗi trang.</small>
                     <nav aria-label="Phân trang tin tức">
                        <ul class="pagination mb-0 justify-content-end flex-wrap">
                           <li class="page-item <?php echo $page <= 1 ? 'disabled' : ''; ?>">
                              <a class="page-link" href="<?php echo $page <= 1 ? '#' : htmlspecialchars(backendEventBuildUrl($page - 1), ENT_QUOTES, 'UTF-8'); ?>">Trước</a>
                           </li>
                           <?php foreach (backendEventPaginationItems($page, $total_pages) as $pagination_item): ?>
                              <?php if ($pagination_item === 'ellipsis'): ?>
                                 <li class="page-item disabled"><span class="page-link">...</span></li>
                              <?php else: ?>
                                 <li class="page-item <?php echo (int) $pagination_item === $page ? 'active' : ''; ?>">
                                    <a class="page-link" href="<?php echo htmlspecialchars(backendEventBuildUrl($pagination_item), ENT_QUOTES, 'UTF-8'); ?>"><?php echo (int) $pagination_item; ?></a>
                                 </li>
                              <?php endif; ?>
                           <?php endforeach; ?>
                           <li class="page-item <?php echo $page >= $total_pages ? 'disabled' : ''; ?>">
                              <a class="page-link" href="<?php echo $page >= $total_pages ? '#' : htmlspecialchars(backendEventBuildUrl($page + 1), ENT_QUOTES, 'UTF-8'); ?>">Sau</a>
                           </li>
                        </ul>
                     </nav>
                  </div>
               <?php endif; ?>
            </div>
         </div>
      </div>
   </div>
   
		</div>



<?php include_once "footer.php";?>
