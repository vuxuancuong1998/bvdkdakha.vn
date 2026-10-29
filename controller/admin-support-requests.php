<?php
require_once dirname(__DIR__).'/application/support_requests.class.php';
trait AdminSupportRequestActions
{
    public function supportrequests($para=array())
    {
        if (!$this->prepareAdminAccess('support_requests')) return;
        global $db;
        SupportRequests::ensureSchema($db);
        header('Cache-Control: no-store');
        $this->view->data['active_menu']='support_requests';
        $this->view->data['support_statuses']=SupportRequests::statuses();
        $id=(int)($para[2] ?? 0);
        if (($para[1] ?? '')==='detail') {
            $db->query("SELECT * FROM hicrm_support_requests WHERE id=$id AND status NOT IN ('99','draft') LIMIT 1");
            $item=$db->fetch_object(true);
            if (!$item) { http_response_code(404); $this->renderAdminNotice('Yêu cầu hỗ trợ','Không tìm thấy yêu cầu đã gửi hoặc yêu cầu đã bị xóa.','support_requests'); return; }
            $this->view->data['support_item']=$item;
            $this->view->data['support_history']=SupportRequests::history($db,$id);
            $this->view->admintmp('support-request-detail'); return;
        }
        $status=is_string($_GET['status'] ?? null) ? $_GET['status'] : '';
        if ($status==='draft' || !isset(SupportRequests::statuses()[$status])) $status='';
        $q=is_string($_GET['q'] ?? null) ? trim($_GET['q']) : '';
        $base="status NOT IN ('99','draft')";
        $where=SupportRequests::listing($db,$base,$status,$q);
        $db->query("SELECT COUNT(*) total FROM hicrm_support_requests WHERE $where");
        $total=(int)$db->fetch_object(true)->total; $pages=max(1,(int)ceil($total/25)); $page=max(1,min($pages,(int)($_GET['page'] ?? 1)));
        $db->query("SELECT * FROM hicrm_support_requests WHERE $where ORDER BY FIELD(priority,'Urgent','High','Normal','Low'), created_at DESC,id DESC LIMIT 25 OFFSET ".(($page-1)*25));
        $this->view->data['support_rows']=$db->fetch_object();
        $this->view->data['support_stats']=SupportRequests::stats($db,$base);
        $this->view->data['support_filter']=array('status'=>$status,'q'=>$q);
        $this->view->data['support_page']=$page; $this->view->data['support_pages']=$pages; $this->view->data['support_total']=$total;
        $this->view->admintmp('support-requests');
    }
}
