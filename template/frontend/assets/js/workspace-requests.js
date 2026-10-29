(function () {
  'use strict';
  const script = document.currentScript || Array.from(document.scripts).find(s => s.src.includes('workspace-requests.js'));
  const base = script.src.split('/template/frontend/')[0];
  const labels = {draft:'Chưa gửi',sent:'Đã gửi',processing:'Đang xử lý',completed:'Đã xử lý',rejected:'Bị từ chối'};
  const escape = value => String(value == null ? '' : value).replace(/[&<>"']/g, ch => ({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}[ch]));
  const badge = status => '<span class="status-tag '+(Object.hasOwn(labels,status) ? status : 'sent')+'">'+escape(labels[status] || status)+'</span>';
  const rows = document.getElementById('workspace-request-rows');
  if (!rows) return;
  const state = document.createElement('p'); state.className='text-muted'; state.style.cssText='font-size:12px;margin:10px 20px'; state.setAttribute('aria-live','polite');
  rows.closest('.data-table-card').appendChild(state);
  let fetching = false;
  async function json(url) { const response=await fetch(url,{credentials:'same-origin',cache:'no-store'}); if(!response.ok) throw new Error('connection'); return response.json(); }
  function detail(row, history) {
    renderRequestDetail(row);
    const attachment=document.getElementById('md_attachment');
    const prefix=base+'/uploads/files/';
    if(row.attachment_url && row.attachment_url.startsWith(prefix)){ attachment.href=row.attachment_url; attachment.style.display='inline-flex'; }
    else { attachment.removeAttribute('href'); attachment.style.display='none'; }
    const historyBox=document.getElementById('md_history'); historyBox.replaceChildren();
    const title=document.createElement('h6'); title.textContent='Lịch sử xử lý và phản hồi'; historyBox.appendChild(title);
    (history || []).forEach(entry=>{ const box=document.createElement('div'); box.style.cssText='padding:12px;border:1px solid #e2e8f0;border-radius:8px;margin-bottom:8px;white-space:pre-wrap;overflow-wrap:anywhere';
      const heading=document.createElement('strong'); heading.textContent=entry.admin_name+' · '+entry.created_at; box.appendChild(heading);
      const status=document.createElement('div'); status.textContent=entry.action==='reply'?'Phản hồi':entry.action==='legacy'?'Nội dung xử lý trước đây':(labels[entry.from_status]||entry.from_status)+' → '+(labels[entry.to_status]||entry.to_status); box.appendChild(status);
      const content=document.createElement('div'); content.textContent=entry.content; box.appendChild(content); historyBox.appendChild(box);
    });
    if(!history || !history.length){const empty=document.createElement('p');empty.textContent='Chưa có lịch sử xử lý.';historyBox.appendChild(empty);}
  }
  window.viewRequestDetail = async function (id, silent) {
    id=Number(typeof id==='object'?id.id:id); if(!id)return;
    window.workspaceRequestId=id;
    try { const data=await json(base+'/api/requestdetail?id='+id); if(window.workspaceRequestId!==id)return;
      if(Number(data.status)!==200){closeViewDetailModal();if(!silent)alert(data.message);return;}
      detail(data.request,data.history);
    } catch (_) { if(!silent)alert('Không thể tải chi tiết yêu cầu. Vui lòng thử lại.'); }
  };
  rows.addEventListener('click',event=>{const button=event.target.closest('[data-request-id]');if(button)window.viewRequestDetail(button.dataset.requestId,false);});
  async function refresh() {
    if(fetching || document.hidden)return; fetching=true;
    try {
      const query=new URLSearchParams(location.search); query.delete('rt');
      const data=await json(base+'/api/workspacerequests?'+query);
      if(Number(data.status)!==200){state.textContent=data.message;return;}
      rows.innerHTML=data.requests.map(row=>'<tr><td style="padding-left:20px;font-weight:700;color:#0284c7">'+escape(row.request_code)+'</td><td>'+escape(row.created_at)+'</td><td><strong>'+escape(row.title)+'</strong><div><span class="service-badge">'+escape(row.service_type)+'</span> '+escape({Urgent:'Khẩn cấp',High:'Ưu tiên cao'}[row.priority]||'')+'</div></td><td><strong>'+escape(row.user_name)+'</strong><div>'+escape(row.department)+'</div></td><td style="text-align:center">'+badge(row.status)+'</td><td style="text-align:center"><button type="button" class="btn-detail-view" data-request-id="'+Number(row.id)+'" title="Xem chi tiết"><i class="fa-solid fa-eye"></i></button></td></tr>').join('') || '<tr><td colspan="6" style="text-align:center;padding:40px">Chưa có yêu cầu phù hợp.</td></tr>';
      document.querySelectorAll('[data-workspace-stat]').forEach(element=>{element.textContent=Number(data.stats[element.dataset.workspaceStat]||0);});
      state.textContent='Cập nhật lúc '+new Date().toLocaleTimeString('vi-VN')+' · Tự động đồng bộ mỗi 20 giây';
      if(window.workspaceRequestId) await window.viewRequestDetail(window.workspaceRequestId,true);
    } catch (_) { state.textContent='Chưa thể đồng bộ. Hệ thống sẽ thử lại; bạn có thể tải lại trang.'; }
    finally { fetching=false; }
  }
  setInterval(refresh,20000);
  document.addEventListener('visibilitychange',()=>{if(!document.hidden)refresh();});
  window.addEventListener('focus',refresh);
  refresh();
})();
