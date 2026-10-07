<?php

class router {
 /*
 * @the registry
 */
 private $registry;

 /*
 * @the controller path
 */
 private $path;

 private $args = array();

 public $file;

 public $controller;

 public $action; 

 function __construct($registry) {
        $this->registry = $registry;
 }

 /**
 *
 * @set controller directory path
 *
 * @param string $path
 *
 * @return void
 *
 */
 function setPath($path) {

	/*** check if path i sa directory ***/
	if (is_dir($path) == false)
	{
		throw new Exception ('Invalid controller path: `' . $path . '`');
	}
	/*** set the path ***/
 	$this->path = $path;
}


 /**
 *
 * @load the controller
 *
 * @access public
 *
 * @return void
 *
 */
 public function loader()
 {
	/*** check the route ***/
	$this->getController();

	/*** if the file is not there diaf ***/
	if (is_readable($this->file) == false)
	{
		$this->file = $this->path.'/error404.php';
                $this->controller = 'error404';
	}

	/*** include the controller ***/
	include $this->file;

	/*** a new controller class instance ***/
	$class = $this->controller . 'Controller';
	$controller = new $class($this->registry);

	/*** check if the action is callable ***/
	if (is_callable(array($controller, $this->action)) == false)
	{
		$action = 'index';
	}
	else
	{
		$action = $this->action;
	}
	/*** run the action ***/
	$controller->$action($this->args);
	/*
	if(!empty($this->args))
		$controller->$action($this->args);
	else
	{
		$this->args = array();
		$controller->$action();
	}
	*/
 }


 /**
 *
 * @get the controller
 *
 * @access private
 *
 * @return void 
 *
 */
private function getController() {

	/*** get the route from the url ***/
	$route = (empty($_GET['rt'])) ? '' : trim($_GET['rt'], '/');

	if (empty($route) || $route === 'index' || $route === 'index.html' || $route === 'index.php')
	{
		$this->controller = 'index';
		$this->action = 'index';
	}
	else
	{
		/*** get the parts of the route ***/
		$parts = explode('/', $route);
		$segment0 = strtolower($parts[0]);

		// Helper to pack args starting from a given segment index
		$packArgs = function($parts, $startIndex = 1) {
			$args = array();
			$count = count($parts);
			$k = 1;
			for($i = $startIndex; $i < $count; $i++) {
				$args[$k++] = $parts[$i];
			}
			return $args;
		};

		if($segment0 == "login" || $segment0 == "login.html" || $segment0 == "dang-nhap" || $segment0 == "dang-nhap.html")
		{
			$this->controller = "member";
			$this->action = "login";
			if(isset($parts[1])) {
				$this->args = $packArgs($parts, 1);
			}
		}
		elseif($segment0 == "logout" || $segment0 == "logout.html" || $segment0 == "dang-xuat")
		{
			$this->controller = "member";
			$this->action = "logout";
			if(isset($parts[1])) {
				$this->args = $packArgs($parts, 1);
			}
		}
		elseif($segment0 == "khong-gian-lam-viec-so" || $segment0 == "khong-gian-lam-viec-so.html" || $segment0 == "workspace")
		{
			$this->controller = "page";
			$this->action = "workspace";
			if(isset($parts[1])) {
				$this->args = $packArgs($parts, 1);
			}
		}
		elseif($segment0 == "trang" || $segment0 == "trang-tinh")
		{
			$this->controller = "page";
			$this->action = "static_page";
			if(isset($parts[1])) {
				$this->args = $packArgs($parts, 1);
			}
		}
		elseif($segment0 == "gioi-thieu" || $segment0 == "gioi-thieu.html")
		{
			$this->controller = "page";
			$this->action = "static_page";
			$this->args = array(1 => "gioi-thieu");
		}
		elseif($segment0 == "co-cau-to-chuc" || $segment0 == "co-cau-to-chuc.html" || $segment0 == "so-do-to-chuc" || $segment0 == "so-do-to-chuc.html")
		{
			$this->controller = "page";
			$this->action = "static_page";
			$this->args = array(1 => "co-cau-to-chuc");
		}
		elseif($segment0 == "ban-lanh-dao" || $segment0 == "ban-lanh-dao.html")
		{
			$this->controller = "page";
			$this->action = "static_page";
			$this->args = array(1 => "ban-lanh-dao");
		}
		elseif($segment0 == "chuc-nang-nhiem-vu" || $segment0 == "chuc-nang-nhiem-vu.html")
		{
			$this->controller = "page";
			$this->action = "static_page";
			$this->args = array(1 => "chuc-nang-nhiem-vu");
		}
		elseif($segment0 == "chinh-sach-bao-mat" || $segment0 == "chinh-sach-bao-mat.html")
		{
			$this->controller = "page";
			$this->action = "static_page";
			$this->args = array(1 => "chinh-sach-bao-mat");
		}
		elseif($segment0 == "dieu-khoan-su-dung" || $segment0 == "dieu-khoan-su-dung.html")
		{
			$this->controller = "page";
			$this->action = "static_page";
			$this->args = array(1 => "dieu-khoan-su-dung");
		}
		elseif($segment0 == "van-ban" || $segment0 == "van-ban.html")
		{
			$this->controller = "page";
			$this->action = "static_page";
			$this->args = array(1 => "van-ban");
		}
		elseif($segment0 == "dich-vu-y-te.html" || $segment0 == "dich-vu-y-te" || $segment0 == "dich-vu" || $segment0 == "dich-vu.html")
		{
			$this->controller = "page";
			$this->action = "services";
			if(isset($parts[1])) {
				$this->args = $packArgs($parts, 1);
			}
		}
		elseif($segment0 == "bac-si" || $segment0 == "bac-si.html" || $segment0 == "doi-ngu-bac-si" || $segment0 == "doi-ngu-bac-si.html")
		{
			$this->controller = "page";
			$this->action = "doctors";
			if(isset($parts[1])) {
				$this->args = $packArgs($parts, 1);
			}
		}
		elseif($segment0 == "tin-tuc-su-kien.html" || $segment0 == "tin-tuc-su-kien" || $segment0 == "tin-tuc.html" || $segment0 == "tin-tuc")
		{
			$this->controller = "home";
			$this->action = "events";
			if(isset($parts[1])) {
				$this->args = $packArgs($parts, 1);
			}
		}
		elseif($segment0 == "chi-tiet-tin-tuc")
		{
			$this->controller = "home";
			$this->action = "news_detail";
			if(isset($parts[1])) {
				$this->args = $packArgs($parts, 1);
			}
		}
		elseif($segment0 == "hoat-dong" || $segment0 == "hoat-dong.html")
		{
			$this->controller = "home";
			$this->action = "activities";
			if(isset($parts[1])) {
				$this->args = $packArgs($parts, 1);
			}
		}
		elseif($segment0 == "lien-he.html" || $segment0 == "lien-he")
		{
			$this->controller = "home";
			$this->action = "contact";
			if(isset($parts[1])) {
				$this->args = $packArgs($parts, 1);
			}
		}
		elseif($segment0 == "lay-giay-tt25" || $segment0 == "lay-giay-tt25.html")
		{
			$this->controller = "home";
			$this->action = "lay_giay_tt25";
			if(isset($parts[1])) {
				$this->args = $packArgs($parts, 1);
			}
		}
		elseif($segment0 == "dang-ky-tai-khoan.html" || $segment0 == "dang-ky-tai-khoan" || $segment0 == "dang-ky")
		{
			$this->controller = "home";
			$this->action = "register";
			if(isset($parts[1])) {
				$this->args = $packArgs($parts, 1);
			}
		}
		elseif($segment0 == "quen-mat-khau" || $segment0 == "quen-mat-khau.html" || $segment0 == "quen-mat-khau.php")
		{
			$this->controller = "home";
			$this->action = "forgot_password";
			if(isset($parts[1])) {
				$this->args = $packArgs($parts, 1);
			}
		}
		elseif($segment0 == "doi-mat-khau" || $segment0 == "doi-mat-khau.html" || $segment0 == "doi-mat-khau.php")
		{
			$this->controller = "home";
			$this->action = "reset_password";
			if(isset($parts[1])) {
				$this->args = $packArgs($parts, 1);
			}
		}
		elseif($segment0 == "verify_email")
		{
			$this->controller = "home";
			$this->action = "verify_email";
			if(isset($parts[1])) {
				$this->args = $packArgs($parts, 1);
			}
		}
		elseif($segment0 == "tai-khoan-chua-xac-thuc.html" || $segment0 == "tai-khoan-chua-xac-thuc")
		{
			$this->controller = "home";
			$this->action = "unverified_account";
			if(isset($parts[1])) {
				$this->args = $packArgs($parts, 1);
			}
		}
		elseif($segment0 == "upcode.html" || $segment0 == "upcode")
		{
			$this->controller = "page";
			$this->action = "upcode";
			if(isset($parts[1])) {
				$this->args = $packArgs($parts, 1);
			}
		}
		elseif($segment0 == "quan-ly-viec-lam.html" || $segment0 == "quan-ly-viec-lam")
		{
			$this->controller = "home";
			$this->action = "manage_jobs";
			if(isset($parts[1])) {
				$this->args = $packArgs($parts, 1);
			}
		}
		elseif($segment0 == "quan-ly-ung-vien.html" || $segment0 == "quan-ly-ung-vien")
		{
			$this->controller = "home";
			$this->action = "manage_applicants";
			if(isset($parts[1])) {
				$this->args = $packArgs($parts, 1);
			}
		}
		elseif($segment0 == "chi-tiet-viec-lam")
		{
			$this->controller = "home";
			$this->action = "job_detail";
			if(isset($parts[1])) {
				$this->args = $packArgs($parts, 1);
			}
		}
		elseif($segment0 == "chi-tiet-ung-vien")
		{
			$this->controller = "home";
			$this->action = "candidate_detail";
			if(isset($parts[1])) {
				$this->args = $packArgs($parts, 1);
			}
		}
		elseif($segment0 == "gioi-thieu-san-viec-lam.html" || $segment0 == "gioi-thieu-san-viec-lam")
		{
			$this->controller = "home";
			$this->action = "introduce_jobs";
			if(isset($parts[1])) {
				$this->args = $packArgs($parts, 1);
			}
		}
		elseif($segment0 == "quy-trinh-san-viec-lam.html" || $segment0 == "quy-trinh-san-viec-lam")
		{
			$this->controller = "home";
			$this->action = "introduce_process";
			if(isset($parts[1])) {
				$this->args = $packArgs($parts, 1);
			}
		}
		elseif($segment0 == "ket-qua-san-viec-lam.html" || $segment0 == "ket-qua-san-viec-lam")
		{
			$this->controller = "home";
			$this->action = "results_jobs";
			if(isset($parts[1])) {
				$this->args = $packArgs($parts, 1);
			}
		}
		elseif($segment0 == "san-viec-lam-online.html" || $segment0 == "san-viec-lam-online")
		{
			$this->controller = "home";
			$this->action = "online_jobs";
			if(isset($parts[1])) {
				$this->args = $packArgs($parts, 1);
			}
		}
		elseif($segment0 == "huong-dan.html" || $segment0 == "huong-dan")
		{
			$this->controller = "home";
			$this->action = "guidelines";
			if(isset($parts[1])) {
				$this->args = $packArgs($parts, 1);
			}
		}
		elseif($segment0 == "quan-ly-nha-tuyen-dung.html" || $segment0 == "quan-ly-nha-tuyen-dung")
		{
			$this->controller = "home";
			$this->action = "employers";
			if(isset($parts[1])) {
				$this->args = $packArgs($parts, 1);
			}
		}
		elseif($segment0 == "quan-ly-ho-so-ung-vien.html" || $segment0 == "quan-ly-ho-so-ung-vien")
		{
			$this->controller = "home";
			$this->action = "candidateDashboard";
			if(isset($parts[1])) {
				$this->args = $packArgs($parts, 1);
			}
		}
		else 
		{
			$this->controller = $parts[0];
			if(isset($parts[1]))
			{
				$this->action = $parts[1];
				if($segment0 == "admin" && $parts[1] == "news-categories") {
					$this->action = "newsCategories";
				}
			}
			if(isset($parts[2]) && $parts[2] != "")
			{
				$this->args = $packArgs($parts, 2);
			}
			else
			{
				$this->args = array();
			}
		} 
	}

	if (empty($this->controller))
	{
		$this->controller = 'index';
	}

	/*** Get action ***/
	if (empty($this->action))
	{
		$this->action = 'index';
	}

	/*** set the file path ***/
	$this->file = $this->path .'/'. $this->controller . 'Controller.php';
}


}

?>
