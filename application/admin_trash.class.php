<?php
/** Only registered tables/columns may be used in trash queries. */
class AdminTrash
{
    private $db;
    private $sources = array();

    public function __construct($db, $permissions)
    {
        $this->db = $db;
        $definitions = array(
            'hicrm_news'=>array('Tin tức', 'events', 'status'),
            'hicrm_events'=>array('Tin tức & sự kiện', 'events', 'event_status'),
            'hicrm_images'=>array('Hình ảnh', 'images', 'image_status'),
            'hicrm_files'=>array('File', 'files', 'status'),
            'hicrm_doctors'=>array('Bác sĩ', 'doctors', 'doctor_status'),
            'hicrm_sliders'=>array('Slider', 'sliders', 'status'),
            'hicrm_equipment'=>array('Trang thiết bị', 'equipment', 'status'),
            'hicrm_quick_appointments'=>array('Đặt lịch khám nhanh', 'quick_appointments', 'status'),
            'hicrm_videos'=>array('Video', 'videos', 'video_status'),
            'hicrm_static_pages'=>array('Trang tĩnh', 'staticpages', 'page_status'),
            'hicrm_static_page_categories'=>array('Danh mục trang tĩnh', 'staticpage_categories', 'category_status'),
            'hicrm_static_page_code_templates'=>array('Code mẫu', 'staticpages', 'status'),
            'hicrm_activities'=>array('Hoạt động', 'activities', 'status'),
            'hicrm_training_plans'=>array('Đào tạo, tập huấn', 'activities', 'status'),
            'hicrm_medical_campaigns'=>array('Chiến dịch', 'activities', 'status'),
            'hicrm_event_comments'=>array('Bình luận sự kiện', 'news_comments', 'status'),
            'hicrm_news_comments'=>array('Bình luận tin tức', 'news_comments', 'comment_status'),
            'hicrm_news_categories'=>array('Danh mục tin tức', 'events', 'status'),
            'hicrm_event_type'=>array('Loại sự kiện', 'events', 'event_type_status'),
            'hicrm_customer_feedback'=>array('Phản hồi khách hàng', 'customer_feedbacks', 'status'),
            'hicrm_tt25_requests'=>array('Giấy tờ TT25', 'tt25_documents', 'status'),
            'hicrm_tt25_categories'=>array('Danh mục TT25', 'tt25_documents', 'status'),
            'hicrm_market_results'=>array('Kết quả sàn', 'market_results', 'result_status'),
            'hicrm_candidates'=>array('Ứng viên', 'candidates', 'status'),
            'hicrm_job_posts'=>array('Bài đăng tuyển dụng', 'employer_posts', 'status'),
            'hicrm_support_requests'=>array('Yêu cầu hỗ trợ', 'job_support_customers', 'status'),
            'hicrm_google_meets'=>array('Sàn việc làm online', 'google_meet', 'status'),
            'hicrm_users'=>array('Tài khoản', 'users', 'user_status'),
            'hicrm_user_groups'=>array('Nhóm quyền', 'groups', 'group_status'),
            'hicrm_user_role'=>array('Vai trò', 'groups', 'role_status'),
            'hicrm_user_category'=>array('Danh mục tài khoản', 'users', 'user_category_status'),
            'hicrm_departments'=>array('Khoa / phòng', 'settings', 'depart_status'),
            'hicrm_staff'=>array('Nhân sự', 'settings', 'staff_status'),
            'hicrm_accounts'=>array('Tài khoản nghiệp vụ', 'settings', 'account_status'),
            'hicrm_banks'=>array('Ngân hàng', 'settings', 'bank_status'),
            'hicrm_bank_accounts'=>array('Tài khoản ngân hàng', 'settings', 'ba_status'),
            'hicrm_bookings'=>array('Lịch hẹn', 'settings', 'booking_status'),
            'hicrm_categories'=>array('Danh mục dịch vụ', 'settings', 'category_status'),
            'hicrm_customers'=>array('Khách hàng', 'settings', 'customer_status'),
            'hicrm_customer_groups'=>array('Nhóm khách hàng', 'settings', 'group_status'),
            'hicrm_orders'=>array('Đơn hàng', 'settings', 'order_status'),
            'hicrm_products'=>array('Sản phẩm', 'settings', 'product_status'),
            'hicrm_promotions'=>array('Khuyến mãi', 'settings', 'promo_status'),
            'hicrm_service'=>array('Dịch vụ', 'settings', 'service_status'),
            'hicrm_template_types'=>array('Loại biểu mẫu', 'settings', 'template_type_status'),
            'hicrm_type'=>array('Danh mục loại', 'settings', 'type_status'),
            'system_page'=>array('Trang hệ thống', 'settings', 'page_status')
        );
        $db->query('SELECT TABLE_NAME, COLUMN_NAME FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = DATABASE()');
        $columns = array();
        foreach($db->fetch_object() as $column){ $columns[$column->TABLE_NAME][] = $column->COLUMN_NAME; }
        foreach($definitions as $table => $definition){
            if(!in_array('*', $permissions, true) && !in_array($definition[1], $permissions, true)){ continue; }
            $fields = $columns[$table] ?? array();
            if(!in_array('id', $fields, true) || !in_array($definition[2], $fields, true)){ continue; }
            $titles = array();
            foreach(array('title','page_title','image_name','file_name','doctor_name','video_name','video_title','template_name','plan_name','campaign_name','full_name','fullname','customer_name','name','category_name','event_title','event_name','group_name','user_username','depart_name','company_name','product_name','service_name','type_name','alt_text','content','comment_content','meeting_time','request_code') as $candidate){
                if(in_array($candidate, $fields, true)){ $titles[] = "NULLIF(TRIM(LEFT(CAST(`".$candidate."` AS CHAR), 255)), '')"; }
            }
            $title = $titles ? 'COALESCE('.implode(',', $titles).', CAST(id AS CHAR))' : 'CAST(id AS CHAR)';
            $details = array();
            foreach(array('original_name','doctor_position','page_slug','slug','plan_code','campaign_code','description','content','image_url','file_path') as $candidate){
                if(in_array($candidate, $fields, true)){ $details[] = "LEFT(COALESCE(`".$candidate."`, ''), 300)"; }
            }
            $date = 'NULL';
            foreach(array('updated_at','doctor_updated_at','updated_date','created_at','doctor_created_at','image_created_date','created_date') as $candidate){
                if(in_array($candidate, $fields, true)){ $date = '`'.$candidate.'`'; break; }
            }
            $this->sources[$table] = array('label'=>$definition[0], 'status'=>$definition[2], 'title'=>$title, 'details'=>$details ? "CONCAT_WS(' · ', ".implode(',', $details).")" : "''", 'date'=>$date);
        }
    }

    public function categories()
    {
        $result = array();
        foreach($this->sources as $table => $source){
            $this->db->query('SELECT COUNT(*) AS total FROM `'.$table.'` WHERE `'.$source['status']."` = '99'");
            $result[$table] = array('label'=>$source['label'], 'total'=>(int)$this->db->fetch_object(true)->total);
        }
        return $result;
    }

    public function listing($category, $search, $page)
    {
        if($category !== '' && !isset($this->sources[$category])){ throw new Exception('Danh mục không hợp lệ hoặc chưa được cấp quyền.'); }
        $parts = array();
        foreach($this->sources as $table => $source){
            if($category !== '' && $category !== $table){ continue; }
            $parts[] = "SELECT id, '".$table."' AS category, ".$source['title']." AS title, ".$source['details'].' AS details, '.$source['date'].' AS record_date FROM `'.$table.'` WHERE `'.$source['status']."` = '99'";
        }
        if(!$parts){ return array('rows'=>array(), 'total'=>0, 'page'=>1, 'pages'=>1); }
        $from = ' FROM ('.implode(' UNION ALL ', $parts).') AS trash';
        if($search !== ''){ $keyword = $this->db->escapestring($search); $from .= " WHERE (title LIKE '%".$keyword."%' OR details LIKE '%".$keyword."%' OR CAST(id AS CHAR) = '".$keyword."')"; }
        $this->db->query('SELECT COUNT(*) AS total'.$from);
        $total = (int)$this->db->fetch_object(true)->total;
        $pages = max(1, (int)ceil($total / 20));
        $page = min($pages, max(1, (int)$page));
        $this->db->query('SELECT *'.$from.' ORDER BY record_date DESC, category ASC, id DESC LIMIT '.(($page - 1) * 20).',20');
        return array('rows'=>$this->db->fetch_object(), 'total'=>$total, 'page'=>$page, 'pages'=>$pages);
    }

    public function act($action, $category, $id)
    {
        if(!isset($this->sources[$category]) || $id <= 0 || !in_array($action, array('restore','purge'), true)){ throw new Exception('Thao tác không hợp lệ hoặc chưa được cấp quyền.'); }
        $source = $this->sources[$category];
        $where = ' WHERE id = '.(int)$id.' AND `'.$source['status']."` = '99'";
        $this->db->query('SELECT id FROM `'.$category.'`'.$where.' LIMIT 1');
        if(!$this->db->fetch_object(true)){ throw new Exception('Bản ghi không còn trong Sọt rác. Vui lòng tải lại trang.'); }
        // Uploaded files remain on disk; this operation removes only the DB record.
        $sql = $action === 'restore' ? 'UPDATE `'.$category.'` SET `'.$source['status'].'` = 1'.$where.' LIMIT 1' : 'DELETE FROM `'.$category.'`'.$where.' LIMIT 1';
        if(!$this->db->tryQuery($sql)){ throw new Exception('Không thể thực hiện do dữ liệu trùng hoặc đang được liên kết với bản ghi khác.'); }
    }
}
