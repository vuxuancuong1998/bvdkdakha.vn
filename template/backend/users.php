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
            { targets: [0, 6], orderable: false },
            { targets: 6, searchable: false }
         ],
         language: {
            search: 'Tìm kiếm:',
            lengthMenu: 'Hiển thị _MENU_ tài khoản admin',
            info: 'Hiển thị _START_ - _END_ trong _TOTAL_ tài khoản admin',
            infoEmpty: 'Không có tài khoản admin',
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

            api.columns([3, 4, 5]).every(function () {
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

   $(document).on('click', '.reset-password-btn', function () {
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
      $('#assignAdminGroupModal').modal('show');
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
      }).always(function () { $button.prop('disabled', false); });
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
               $('#deleteUserModal').modal('hide');
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

<div class="conatiner-fluid content-inner mt-n5 py-0">
   <div>
      <div class="row">
         <div class="col-sm-12">
            <div class="card">
               <div class="card-header d-flex justify-content-between align-items-center">
                  <div class="header-title">
                     <h4 class="card-title mb-0">Danh sách tài khoản Admin</h4>
                     <small class="text-muted">Chỉ hiển thị các tài khoản có thể đăng nhập vào trang quản trị và được gắn nhóm quyền admin.</small>
                  </div>

                  <div>
                     <a href="<?php echo XC_URL;?>/admin/users/add" class="btn btn-success rounded-pill px-4 shadow-sm d-flex align-items-center gap-2">
                        <svg width="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                           <path d="M12 5V19" stroke="currentColor" stroke-width="2" stroke-linecap="round"/>
                           <path d="M5 12H19" stroke="currentColor" stroke-width="2" stroke-linecap="round"/>
                        </svg>
                        <span>Thêm tài khoản Admin</span>
                     </a>
                  </div>
               </div>

               <div class="card-body p-0">
                  <div class="table-responsive">
                     <table id="user-list-table" class="table table-hover mb-0 align-middle" role="grid">
                        <thead>
                           <tr>
                              <th style="width: 45px;" class="text-center">#</th>
                              <th>Tài khoản & Email</th>
                              <th>Khoa phòng</th>
                              <th>Nhóm quyền</th>
                              <th style="width: 120px;" class="text-center">Trạng thái</th>
                              <th style="width: 150px;" class="text-end">Thao tác</th>
                           </tr>
                           <tr class="user-filter-row bg-light">
                              <th></th>
                              <th>
                                 <input type="search" class="form-control form-control-sm user-column-search" data-column="1" placeholder="Tìm tài khoản, email...">
                              </th>
                              <th>
                                 <select class="form-select form-select-sm">
                                    <option value="">Tất cả khoa phòng</option>
                                 </select>
                              </th>
                              <th>
                                 <select class="form-select form-select-sm">
                                    <option value="">Tất cả nhóm</option>
                                 </select>
                              </th>
                              <th>
                                 <select class="form-select form-select-sm">
                                    <option value="">Tất cả trạng thái</option>
                                 </select>
                              </th>
                              <th></th>
                           </tr>
                        </thead>
                        <tbody>
                           <?php $i = 1; ?>
                           <?php foreach($users as $user): ?>
                           <tr>
                              <td class="text-center text-muted fw-bold"><?php echo $i; ?></td>
                              <td>
                                 <div class="fw-bold text-dark" style="font-size: 13.5px;"><?php echo htmlspecialchars($user->user_username, ENT_QUOTES, 'UTF-8'); ?></div>
                                 <div class="cell-meta"><i class="fa-regular fa-envelope text-muted me-1"></i><?php echo htmlspecialchars($user->user_email, ENT_QUOTES, 'UTF-8'); ?></div>
                              </td>
                              <td>
                                 <span class="text-secondary small fw-semibold">
                                    <i class="fa-solid fa-hospital-user text-muted me-1"></i><?php echo htmlspecialchars($user->depart_name ?? 'Chưa cấu hình', ENT_QUOTES, 'UTF-8'); ?>
                                 </span>
                              </td>
                              <td>
                                 <span class="badge bg-primary-subtle text-primary border border-primary-subtle">
                                    <i class="fa-solid fa-shield-halved me-1"></i><?php echo htmlspecialchars($user->group_name, ENT_QUOTES, 'UTF-8'); ?>
                                 </span>
                              </td>
                              <td class="text-center">
                                 <?php if((int)$user->user_status === 1){ ?>
                                    <span class="badge bg-success"><i class="fa-solid fa-circle-check me-1"></i>Hoạt động</span>
                                 <?php } elseif((int)$user->user_status === 2) { ?>
                                    <span class="badge bg-warning text-dark"><i class="fa-solid fa-lock me-1"></i>Tạm khóa</span>
                                 <?php } else { ?>
                                    <span class="badge bg-secondary"><?php echo htmlspecialchars($user->status_label ?? 'Không xác định', ENT_QUOTES, 'UTF-8'); ?></span>
                                 <?php } ?>
                              </td>
                              <td class="text-end">
                                 <div class="btn-action-group">
                                    <a class="btn-action is-edit" href="<?php echo XC_URL; ?>/admin/users/edit/<?php echo $user->uid; ?>" title="Chỉnh sửa tài khoản">
                                       <i class="fa-solid fa-pen-to-square"></i>
                                    </a>

                                    <a class="btn-action btn-soft-info" href="<?php echo XC_URL; ?>/admin/users/role/<?php echo $user->uid; ?>" title="Phân quyền menu">
                                       <i class="fa-solid fa-key"></i>
                                    </a>

                                    <?php if((int)$user->uid !== (int)$_SESSION['user']['id']): ?>
                                    <button type="button" class="btn-action btn-soft-primary btn-assign-admin-group" data-user-id="<?php echo (int)$user->uid; ?>" data-group-id="<?php echo (int)$user->user_group; ?>" title="Gán nhóm quyền">
                                       <i class="fa-solid fa-user-shield"></i>
                                    </button>
                                    <?php endif; ?>

                                    <a class="btn-action btn-soft-warning btn-toggle-lock"
                                       href="#"
                                       data-id="<?php echo $user->uid; ?>"
                                       data-status="<?php echo $user->user_status; ?>"
                                       title="<?php echo ((int)$user->user_status === 2) ? 'Mở khóa tài khoản' : 'Khóa tài khoản'; ?>">
                                       <i class="fa-solid <?php echo ((int)$user->user_status === 2) ? 'fa-lock-open' : 'fa-lock'; ?>"></i>
                                    </a>

                                    <a class="btn-action btn-soft-secondary reset-password-btn"
                                       href="#"
                                       data-id="<?php echo $user->uid; ?>"
                                       title="Reset mật khẩu">
                                       <i class="fa-solid fa-rotate-left"></i>
                                    </a>

                                    <a class="btn-action is-delete btn-open-delete-user"
                                       data-bs-toggle="modal"
                                       data-bs-target="#deleteUserModal"
                                       data-user-id="<?php echo $user->uid; ?>"
                                       data-user-status="<?php echo isset($user->user_status) ? $user->user_status : ''; ?>"
                                       href="#"
                                       title="Xóa tài khoản">
                                       <i class="fa-solid fa-trash"></i>
                                    </a>
                                 </div>
                              </td>
                           </tr>
                           <?php $i++; endforeach; ?>
                        </tbody>
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
            Bạn chắc chắn muốn xóa tài khoản admin này?
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
