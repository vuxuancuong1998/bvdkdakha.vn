<div class="modal fade" id="supportActionModal" tabindex="-1" aria-labelledby="supportActionTitle" aria-hidden="true"><div class="modal-dialog modal-dialog-centered"><div class="modal-content">
 <form id="supportActionForm"><div class="modal-header"><h5 class="modal-title" id="supportActionTitle">Xử lý yêu cầu</h5><button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Đóng"></button></div>
 <div class="modal-body"><p id="supportActionSummary" class="text-muted"></p><input type="hidden" name="id" id="supportActionId"><input type="hidden" name="expected_status" id="supportExpectedStatus"><input type="hidden" name="csrf_token" value="<?php echo htmlspecialchars($admin_csrf_token,ENT_QUOTES,'UTF-8'); ?>">
  <label class="form-label" for="supportAction">Thao tác</label><select class="form-select mb-3" id="supportAction" name="action" required></select>
  <label class="form-label" for="supportNote">Phản hồi / Kết quả xử lý / Lý do từ chối</label><textarea id="supportNote" name="resolution_note" class="form-control" rows="5" maxlength="10000"></textarea><p id="supportActionHint" class="small text-muted mt-2"></p>
 </div><div class="modal-footer"><button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Hủy</button><button class="btn btn-primary" id="supportSave">Lưu cập nhật</button></div></form>
</div></div></div>
<script>
jQuery(function($){
 var rows=<?php echo json_encode(array_values($support_rows),JSON_HEX_TAG|JSON_HEX_AMP|JSON_HEX_APOS|JSON_HEX_QUOT|JSON_INVALID_UTF8_SUBSTITUTE); ?>;
 var labels={processing:'Tiếp nhận / Mở lại xử lý',completed:'Hoàn tất xử lý',rejected:'Từ chối yêu cầu',reply:'Gửi phản hồi',delete:'Xóa yêu cầu'};
 $('.support-action-open').on('click',function(){ var id=Number($(this).data('id')),row=rows.find(function(r){return Number(r.id)===id;}); if(!row)return;
  $('#supportActionSummary').text(row.request_code+' · '+row.title); $('#supportActionId').val(id); $('#supportExpectedStatus').val(row.status); $('#supportNote').val(''); var $select=$('#supportAction').empty();
  ['processing','completed','rejected','reply','delete'].forEach(function(action){if(action===row.status || (['completed','rejected'].includes(row.status)&&['completed','rejected'].includes(action)))return; $('<option>').val(action).text(labels[action]).appendTo($select);});
  $select.trigger('change'); bootstrap.Modal.getOrCreateInstance(document.getElementById('supportActionModal')).show();
 });
 $('#supportAction').on('change',function(){var action=this.value; $('#supportNote').prop('required',['completed','rejected','reply'].includes(action)); $('#supportActionHint').text(action==='delete'?'Yêu cầu sẽ chuyển vào Sọt rác và không còn hiển thị tại frontend.':action==='processing'?'Tiếp nhận yêu cầu hoặc mở lại yêu cầu đã kết thúc.':'Nội dung này sẽ được hiển thị cho người gửi trong Không gian làm việc số.'); $('#supportSave').toggleClass('btn-danger',action==='delete').toggleClass('btn-primary',action!=='delete');});
 $('#supportActionForm').on('submit',function(e){e.preventDefault(); if(!this.reportValidity())return; var $button=$('#supportSave');if($button.prop('disabled'))return;$button.prop('disabled',true);
  $.ajax({type:'POST',url:<?php echo json_encode(XC_URL.'/api/supportrequestaction'); ?>,data:$(this).serialize(),dataType:'json'}).done(function(result){
   if(Number(result.status)===200){location.href=Number($('#supportActionId').val())&&$('#supportAction').val()==='delete'?<?php echo json_encode(XC_URL.'/admin/supportrequests'); ?>:location.href;}
   else Swal.fire({icon:'error',title:'Chưa thể cập nhật',text:result.message});
  }).fail(function(){Swal.fire({icon:'error',title:'Lỗi kết nối',text:'Vui lòng thử lại.'});}).always(function(){$button.prop('disabled',false);});
 });
});
</script>
