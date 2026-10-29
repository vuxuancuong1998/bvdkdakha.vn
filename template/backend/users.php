<?php require "header.php"; ?>
<script>
$(document).ready(function () {
   var $userTable = $('#user-list-table');

   if ($.fn.DataTable && $userTable.length) {
      var userTable = $userTable.DataTable({
         dom: '<"row align-items-center mb-3"<"col-md-6"l><"col-md-6"f>><"table-responsive border-bottom"rt><"row align-items-center mt-3"<"col-md-6"i><"col-md-6"p>><"clear">',
         pageLength: 10,
         order: [[1, 'asc']],
         orderCellsTop: true,
         columnDefs: [
            { targets: [0, 8], orderable: false },
            { targets: 8, searchable: false }
         ],
         language: {
            search: 'Tìm kiếm:',
            lengthMenu: 'Hiển thị _MENU_ tài khoản',
            info: 'Hiển thị _START_ - _END_ trong _TOTAL_ tài khoản',
            infoEmpty: 'Không có tài khoản',
            infoFiltered: '(lọc từ _MAX_ tài khoản)',
            zeroRecords: 'Không tìm thấy tài khoản phù hợp',
            paginate: {
               first: 'Đầu',
               last: 'Cuối',
               next: 'Sau',
               previous: 'Trước'
            }
         },
         initComplete: function () {
            var api = this.api();

            api.columns([4, 5, 6, 7]).every(function () {
               var column = this;
               var $select = $('#user-list-table thead .user-filter-row th')
                  .eq(column.index())
                  .find('select');

               column.data().unique().sort().each(function (value) {
                  var text = $('<div>').html(value).text().trim();
                  if (text) {
                     $select.append($('<option>').val(text).text(text));
                  }
               });

               $select.on('change', function () {
                  var value = $.fn.dataTable.util.escapeRegex(this.value);
                  column.search(value ? '^' + value + '$' : '', true, false).draw();
               });
            });
         }
      });

      $('#user-list-table thead').on('keyup change', '.user-column-search', function () {
         userTable.column($(this).data('column')).search(this.value).draw();
      });

      userTable.on('order.dt search.dt draw.dt', function () {
         userTable.column(0, { search: 'applied', order: 'applied' }).nodes().each(function (cell, index) {
            cell.innerHTML = index + 1;
         });
      }).draw();
   }

   $(document).on('click', '.reset-password-btn', function (e) {
      e.preventDefault();
      var id = $(this).data('id');

      $.ajax({
         type: "POST",
         url: "<?php echo XC_URL; ?>/api/resetpassword",
         data: { id: id, csrf_token: '<?php echo htmlspecialchars($admin_csrf_token, ENT_QUOTES, 'UTF-8'); ?>' },
         dataType: "json",
         success: function (data) {
            if (Number(data.status) === 200) {
               Swal.fire({
                  icon: 'success',
                  title: 'Reset mật khẩu thành công',
                  html: '<div class="d-flex flex-column align-items-center gap-3">' +
                        '  <div>Mật khẩu mới ngẫu nhiên:</div>' +
                        '  <div class="p-2 border rounded bg-light w-100 text-center font-monospace" style="font-size:20px; color:#10b981; font-weight:800;" id="new-pwd-txt">' + data.new_password + '</div>' +
                        '  <button type="button" class="btn btn-outline-primary btn-sm px-3" id="copy-pwd-btn">' +
                        '    <i class="fa-solid fa-copy me-1"></i> Sao chép mật khẩu' +
                        '  </button>' +
                        '</div>',
                  allowOutsideClick: false,
                  showConfirmButton: true,
                  confirmButtonText: 'Đóng'
               });

               // Handle copy action
               $(document).off('click', '#copy-pwd-btn').on('click', '#copy-pwd-btn', function() {
                  var $temp = $("<input>");
                  $("body").append($temp);
                  $temp.val(data.new_password).select();
                  document.execCommand("copy");
                  $temp.remove();
                  
                  $(this).html('<i class="fa-solid fa-check me-1"></i> Đã sao chép!').removeClass('btn-outline-primary').addClass('btn-success');
               });
            } else {
               Swal.fire({
                  icon: 'error',
                  title: 'Lỗi',
                  text: data.message || 'Không thể reset mật khẩu'
               });
            }
         },
         error: function () {
            Swal.fire({
               icon: 'error',
               title: 'Lỗi',
               text: 'Có lỗi xảy ra khi gọi API reset mật khẩu'
            });
         }
      });
   });

   $(document).on('click', '.btn-toggle-lock', function (e) {
      e.preventDefault();
      var id = $(this).data('id');
      var currentStatus = $(this).data('status');
      var actionText = (Number(currentStatus) === 2) ? 'mở khóa' : 'khóa';

      Swal.fire({
         title: 'Xác nhận',
         text: 'Bạn có chắc chắn muốn ' + actionText + ' tài khoản này?',
         icon: 'question',
         showCancelButton: true,
         confirmButtonText: 'Đồng ý',
         cancelButtonText: 'Hủy'
      }).then((result) => {
         if (result.isConfirmed) {
            $.ajax({
               type: "POST",
               url: "<?php echo XC_URL; ?>/api/toggleuserstatus",
               data: { id: id, csrf_token: '<?php echo htmlspecialchars($admin_csrf_token, ENT_QUOTES, 'UTF-8'); ?>' },
               dataType: "json",
               success: function (data) {
                  if (Number(data.status) === 200) {
                     Swal.fire({
                        icon: 'success',
                        title: 'Thành công',
                        text: data.message,
                        timer: 1500,
                        showConfirmButton: false
                     });
                     setTimeout(function () { location.reload(); }, 1600);
                  } else {
                     Swal.fire({
                        icon: 'error',
                        title: 'Lỗi',
                        text: data.message || 'Không thể thực hiện thao tác'
                     });
                  }
               },
               error: function () {
                  Swal.fire({
                     icon: 'error',
                     title: 'Lỗi',
                     text: 'Có lỗi xảy ra khi kết nối máy chủ'
                  });
               }
            });
         }
      });
   });

   $(document).on('click', '.btn-assign-admin-group', function () {
      var userId = $(this).data('user-id');
      var currentGroup = String($(this).data('group-id'));
      $('#assign_admin_user_id').val(userId);
      $('#assign_admin_group_id').val(currentGroup);
      bootstrap.Modal.getOrCreateInstance(document.getElementById('assignAdminGroupModal')).show();
   });

   $('#saveAdminGroupBtn').on('click', function () {
      var $button = $(this).prop('disabled', true);
      $.ajax({
         type: 'POST',
         url: '<?php echo XC_URL; ?>/api/assignAdminGroup',
         data: {
            user_id: $('#assign_admin_user_id').val(),
            user_group: $('#assign_admin_group_id').val(),
            csrf_token: '<?php echo htmlspecialchars($admin_csrf_token, ENT_QUOTES, 'UTF-8'); ?>'
         },
         dataType: 'json'
      }).done(function (result) {
         if (Number(result.status) === 200) location.reload();
         else Swal.fire({icon:'error', title:'Không thể phân quyền', text:result.message});
      }).fail(function () { Swal.fire({icon:'error', title:'Không thể phân quyền', text:'Kết nối máy chủ bị lỗi. Vui lòng thử lại.'}); }).always(function () { $button.prop('disabled', false); });
   });

   $(document).on('click', '.btn-open-delete-user', function (e) {
      e.preventDefault();
      $('#delete_user_id').val($(this).data('user-id'));
      $('#delete_user_status').val($(this).data('user-status'));
   });

   $('#confirmDeleteUserBtn').on('click', function () {
      var id = $('#delete_user_id').val();
      var user_status = $('#delete_user_status').val();
      if (!id) return;

      var $btn = $(this);
      $btn.prop('disabled', true);

      $.ajax({
         type: "POST",
         url: "<?php echo XC_URL; ?>/api/deleteuser",
         data: {
            id: id,
            user_status: user_status,
            csrf_token: '<?php echo htmlspecialchars($admin_csrf_token, ENT_QUOTES, 'UTF-8'); ?>'
         },
         dataType: "json",
         success: function (data) {
            if (Number(data.status) === 200) {
               bootstrap.Modal.getOrCreateInstance(document.getElementById('deleteUserModal')).hide();
               Swal.fire({
                  icon: 'success',
                  title: 'Xóa thành công',
                  timer: 1700,
                  showConfirmButton: false
               });
               setTimeout(function () { location.reload(); }, 1800);
            } else {
               Swal.fire({
                  icon: 'error',
                  title: 'Lỗi',
                  text: data.message || 'Không thể xóa tài khoản'
               });
            }
         },
         error: function () {
            Swal.fire({
               icon: 'error',
               title: 'Lỗi',
               text: 'Có lỗi xảy ra khi gọi API xóa'
            });
         },
         complete: function () {
            $btn.prop('disabled', false);
         }
      });
   });
});
</script>
<style>
#user-list-table { width:100% !important; min-width:1250px; }
#user-list-table td:nth-child(2), #user-list-table td:nth-child(5), #user-list-table td:nth-child(7) { white-space:normal; min-width:150px; overflow-wrap:anywhere; }
#user-list-table td:nth-child(3), #user-list-table td:nth-child(4) { white-space:nowrap; font-variant-numeric:tabular-nums; }
#user-list-table th:last-child, #user-list-table td:last-child { min-width:220px; }
#user-list-table .btn-action-group { flex-wrap:nowrap; }
#user-list-table .user-filter-row .form-control, #user-list-table .user-filter-row .form-select { width:100%; min-width:100px; }
</style>

<div class="conatiner-fluid content-inner mt-n5 py-0">
   <div>
      <div class="row">
         <div class="col-sm-12">
            <div class="card">
               <div class="card-header d-flex justify-content-between align-items-center">
                  <div class="header-title">
                     <h4 class="card-title mb-0">Danh sách tài khoản</h4>
                     <small class="text-muted">Quản lý thông tin, đối tượng và quyền truy cập của tài khoản.</small>
                  </div>

                  <div>
                     <a href="<?php echo XC_URL;?>/admin/users/add" class="btn btn-success rounded-pill px-4 shadow-sm d-flex align-items-center gap-2">
                        <svg width="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                           <path d="M12 5V19" stroke="currentColor" stroke-width="2" stroke-linecap="round"/>
                           <path d="M5 12H19" stroke="currentColor" stroke-width="2" stroke-linecap="round"/>
                        </svg>
                        <span>Thêm tài khoản</span>
                     </a>
                  </div>
               </div>

               <div class="card-body p-0">
                  <div class="table-responsive">
                     <table id="user-list-table" class="table table-hover mb-0 align-middle" role="grid">
 <thead><tr><th>#</th><th>Họ và tên</th><th>Căn cước công dân</th><th>Số điện thoại</th><th>Khoa phòng</th><th>Đối tượng</th><th>Nhóm quyền</th><th>Trạng thái</th><th class="text-end">Thao tác</th></tr>
 <tr class="user-filter-row bg-light">
  <th></th><th><input aria-label="Lọc họ tên" class="form-control form-control-sm user-column-search" data-column="1" placeholder="Tìm họ tên"></th>
  <th><input aria-label="Lọc CCCD" class="form-control form-control-sm user-column-search" data-column="2" placeholder="Tìm CCCD"></th>
  <th><input aria-label="Lọc số điện thoại" class="form-control form-control-sm user-column-search" data-column="3" placeholder="Tìm số điện thoại"></th>
  <th><select aria-label="Lọc khoa phòng" class="form-select form-select-sm"><option value="">Tất cả khoa phòng</option></select></th>
  <th><select aria-label="Lọc đối tượng" class="form-select form-select-sm"><option value="">Tất cả đối tượng</option></select></th>
  <th><select aria-label="Lọc nhóm quyền" class="form-select form-select-sm"><option value="">Tất cả nhóm quyền</option></select></th>
  <th><select aria-label="Lọc trạng thái" class="form-select form-select-sm"><option value="">Tất cả trạng thái</option></select></th><th></th>
 </tr></thead>
 <tbody><?php $i=1; foreach((is_array($users) ? $users : array()) as $user): $uid=(int)$user->uid; $self=$uid===(int)$_SESSION['user']['id']; $esc=function($v){return htmlspecialchars((string)$v, ENT_QUOTES, 'UTF-8');}; ?>
 <tr>
  <td><?php echo $i++; ?></td>
  <td><div class="fw-bold"><?php echo $esc($user->full_name ?: $user->user_username); ?></div></td>
  <td><?php echo $esc($user->user_cccd ?? ''); ?></td><td><?php echo $esc($user->user_phone); ?></td>
  <td><?php echo $esc($user->depart_name ?? 'Chưa cấu hình'); ?></td>
  <td><?php echo (int)$user->is_admin===1 ? 'Admin' : 'Người dùng'; ?></td>
  <td><?php echo $esc($user->group_name ?? 'Chưa phân nhóm'); ?></td>
  <td><?php echo (int)$user->user_status===1 ? 'Hoạt động' : ((int)$user->user_status===2 ? 'Tạm khóa' : $esc($user->status_label ?? 'Không xác định')); ?></td>
  <td><div class="btn-action-group">
   <a class="btn-action is-edit" href="<?php echo XC_URL.'/admin/users/edit/'.$uid; ?>" title="Chỉnh sửa tài khoản" aria-label="Chỉnh sửa tài khoản"><i class="fa-solid fa-pen-to-square"></i></a>
   <?php if((int)$user->is_admin===1): ?>
   <a class="btn-action btn-soft-info" href="<?php echo XC_URL.'/admin/users/role/'.$uid; ?>" title="Phân quyền menu" aria-label="Phân quyền menu"><i class="fa-solid fa-key"></i></a>
   <?php if(!$self): ?><button type="button" class="btn-action btn-soft-primary btn-assign-admin-group" data-user-id="<?php echo $uid; ?>" data-group-id="<?php echo (int)$user->user_group; ?>" title="Gán nhóm quyền" aria-label="Gán nhóm quyền"><i class="fa-solid fa-user-shield"></i></button><?php endif; ?>
   <?php endif; ?>
   <?php if(!$self): ?><a class="btn-action btn-soft-warning btn-toggle-lock" href="#" data-id="<?php echo $uid; ?>" data-status="<?php echo (int)$user->user_status; ?>" title="<?php echo (int)$user->user_status===2 ? 'Mở khóa tài khoản' : 'Khóa tài khoản'; ?>"><i class="fa-solid <?php echo (int)$user->user_status===2 ? 'fa-lock-open' : 'fa-lock'; ?>"></i></a><?php endif; ?>
   <a class="btn-action btn-soft-secondary reset-password-btn" href="#" data-id="<?php echo $uid; ?>" title="Đặt lại mật khẩu" aria-label="Đặt lại mật khẩu"><i class="fa-solid fa-rotate-left"></i></a>
   <?php if(!$self): ?><a class="btn-action is-delete btn-open-delete-user" data-bs-toggle="modal" data-bs-target="#deleteUserModal" data-user-id="<?php echo $uid; ?>" data-user-status="<?php echo (int)$user->user_status; ?>" href="#" title="Xóa tài khoản" aria-label="Xóa tài khoản"><i class="fa-solid fa-trash"></i></a><?php endif; ?>
  </div></td>
 </tr><?php endforeach; ?></tbody>
</table>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>

<div class="modal fade" id="assignAdminGroupModal" tabindex="-1" aria-hidden="true">
 <div class="modal-dialog modal-dialog-centered"><div class="modal-content">
  <div class="modal-header"><h5 class="modal-title">Gán nhóm quyền Admin</h5><button type="button" class="btn-close" data-bs-dismiss="modal"></button></div>
  <div class="modal-body"><input type="hidden" id="assign_admin_user_id"><label class="form-label" for="assign_admin_group_id">Nhóm quyền</label><select class="form-select" id="assign_admin_group_id">
   <?php foreach((isset($admin_groups) && is_array($admin_groups)) ? $admin_groups : array() as $adminGroup): ?><option value="<?php echo (int)$adminGroup->id; ?>"><?php echo htmlspecialchars($adminGroup->group_name, ENT_QUOTES, 'UTF-8'); ?></option><?php endforeach; ?>
  </select><small class="text-muted d-block mt-2">Chỉ hiển thị các nhóm đã có ít nhất một quyền Admin.</small></div>
  <div class="modal-footer"><button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button><button type="button" class="btn btn-primary" id="saveAdminGroupBtn">Lưu</button></div>
 </div></div>
</div>

<div class="modal fade" id="deleteUserModal" tabindex="-1" aria-labelledby="deleteUserModalLabel" aria-hidden="true">
   <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
         <div class="modal-header">
            <h5 class="modal-title" id="deleteUserModalLabel">Xác nhận xóa</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
         </div>
         <div class="modal-body">
            Bạn chắc chắn muốn xóa tài khoản này?
            <input type="hidden" id="delete_user_id" value="">
            <input type="hidden" id="delete_user_status" value="">
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
            <button type="button" class="btn btn-danger" id="confirmDeleteUserBtn">Xác nhận</button>
         </div>
      </div>
   </div>
</div>

<?php require "footer.php"; ?>
