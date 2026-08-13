<?php 
Class userModel extends baseModel
{
	
	public function get_user_list(){
		global $db;
		$db->query("SELECT u.*, u.id as uid, g.group_name, d.depart_name, s.status_label FROM hicrm_users as u 
		LEFT JOIN hicrm_user_groups as g ON u.user_group = g.id
		LEFT JOIN hicrm_departments as d ON u.user_department = d.id
		LEFT JOIN hicrm_status as s ON u.user_status = s.id
		WHERE u.user_status NOT IN(99)
		ORDER BY u.id DESC");
		return $db->fetch_object();
	}
	public function get_user_category(){
		global $db;
		$db->query("SELECT * FROM hicrm_user_category WHERE user_category_status NOT IN(99)");
		return $db->fetch_object();
	}
	public function role_user(){
		global $db;
		$db->query("SELECT * FROM hicrm_user_groups WHERE group_status NOT IN(99)");
		return $db->fetch_object();
	}
	public function role_user_detail($id){
		global $db;
		$db->query("SELECT * FROM hicrm_user_groups WHERE id = '".$id."'");
		return $db->fetch_object(true);
	}
	public function get_user_role(){
		global $db;
		$db->query("SELECT * FROM hicrm_user_role WHERE role_status NOT IN(99)");
		return $db->fetch_object();
	}
	public function get_user($id){
		global $db;
		$db->query("SELECT u.*, u.id as uid, g.group_name, d.depart_name FROM hicrm_users as u 
		LEFT JOIN hicrm_user_groups as g ON u.user_group = g.id
		LEFT JOIN hicrm_departments as d ON u.user_department = d.id
		LEFT JOIN hicrm_status as s ON u.user_status = s.id
		WHERE u.user_status NOT IN(99) AND u.id = '".$id."'");
		return $db->fetch_object(true);
	}
}
?>
