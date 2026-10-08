<?php require_once "header.php"; 
$doctors = is_array($doctors) ? $doctors : array();
$departments = is_array($departments) ? $departments : array();
$selected_dept = isset($selected_dept) ? (int)$selected_dept : 0;
$keyword = isset($keyword) ? (string)$keyword : '';
$page = isset($doctor_page) ? (int)$doctor_page : 1;
$per_page = isset($doctor_per_page) ? (int)$doctor_per_page : 8;
$total_doctors = isset($doctor_total) ? (int)$doctor_total : count($doctors);
$total_pages = isset($doctor_total_pages) ? (int)$doctor_total_pages : 1;
$row_offset = max(0, ($page - 1) * $per_page);

$selectedDeptName = '';
if ($selected_dept > 0) {
	foreach ($departments as $dept) {
		if ((int)$dept->id === $selected_dept) {
			$selectedDeptName = $dept->depart_name;
			break;
		}
	}
}

if (!function_exists('frontendDoctorPageUrl')) {
	function frontendDoctorPageUrl($targetPage, $deptId, $keyword) {
		$params = array();
		if ((int)$targetPage > 1) {
			$params['page'] = (int)$targetPage;
		}
		if ((int)$deptId > 0) {
			$params['khoa'] = (int)$deptId;
		}
		if (trim((string)$keyword) !== '') {
			$params['q'] = trim((string)$keyword);
		}
		return XC_URL . '/bac-si' . (!empty($params) ? '?' . http_build_query($params) : '');
	}
}

if (!function_exists('frontendDoctorPaginationItems')) {
	function frontendDoctorPaginationItems($currentPage, $totalPages) {
		$currentPage = max(1, (int)$currentPage);
		$totalPages = max(1, (int)$totalPages);
		if ($totalPages <= 7) { return range(1, $totalPages); }
		if ($currentPage <= 4) { return array(1, 2, 3, 4, 5, 'ellipsis', $totalPages); }
		if ($currentPage >= $totalPages - 3) { return array(1, 'ellipsis', $totalPages - 4, $totalPages - 3, $totalPages - 2, $totalPages - 1, $totalPages); }
		return array(1, 'ellipsis', $currentPage - 1, $currentPage, $currentPage + 1, 'ellipsis', $totalPages);
	}
}
?>

<main id="main-content" role="main" class="doctors-page py-4">
  <div class="container">

    <!-- ============================================================
         HERO & BREADCRUMBS
         ============================================================ -->
    <section class="doctor-hero-banner">
      <div class="doctor-hero-content">
        <h1 class="doctor-hero-title">Đội Ngũ Y Bác Sĩ</h1>
        <p class="doctor-hero-desc">
          Đội ngũ thầy thuốc tận tâm, giàu y đức và chuyên môn cao tại Bệnh viện Đa khoa Khu vực Đắk Hà, luôn sẵn sàng đồng hành cùng sức khỏe nhân dân.
        </p>
      </div>
    </section>

    <!-- ============================================================
         PROFESSIONAL FILTER & SEARCH PANEL
         ============================================================ -->
    <section class="doctor-filter-panel" aria-label="Bộ lọc và tìm kiếm bác sĩ">
      <div class="doctor-filter-top">
        <div class="doctor-filter-title">
          <i class="fa-solid fa-sliders"></i>
          <span>Bộ lọc & Tìm kiếm bác sĩ</span>
        </div>
        <div class="doctor-filter-stat">
          <i class="fa-solid fa-user-doctor"></i>
          <span>Tìm thấy <strong><?php echo $total_doctors; ?></strong> nhân sự</span>
        </div>
      </div>

      <form method="get" action="<?php echo XC_URL; ?>/bac-si" class="doctor-filter-form">
        <!-- Search Input Box -->
        <div class="doctor-filter-field doctor-filter-search">
          <label for="doctor-search-input" class="doctor-field-label">Từ khóa tìm kiếm</label>
          <div class="doctor-input-container">
            <i class="fa-solid fa-magnifying-glass doctor-field-icon"></i>
            <input 
              type="text" 
              id="doctor-search-input"
              name="q" 
              class="doctor-search-input" 
              placeholder="Nhập tên bác sĩ, chức danh, học vị..." 
              value="<?php echo htmlspecialchars($keyword, ENT_QUOTES, 'UTF-8'); ?>"
              autocomplete="off">
            <?php if($keyword !== ''): ?>
              <button type="button" class="doctor-input-clear-btn" onclick="document.getElementById('doctor-search-input').value=''; this.form.submit();" title="Xóa từ khóa">
                <i class="fa-solid fa-xmark"></i>
              </button>
            <?php endif; ?>
          </div>
        </div>

        <!-- Department Dropdown Box -->
        <div class="doctor-filter-field doctor-filter-dept">
          <label for="doctor-dept-select" class="doctor-field-label">Chuyên khoa / Phòng ban</label>
          <div class="doctor-select-container">
            <i class="fa-solid fa-hospital-user doctor-field-icon"></i>
            <select name="khoa" id="doctor-dept-select" class="doctor-dept-select" onchange="this.form.submit()">
              <option value="0">Tất cả chuyên khoa & phòng ban (<?php echo count($departments); ?> khoa/phòng)</option>
              <?php foreach($departments as $dept): ?>
                <option value="<?php echo (int)$dept->id; ?>" <?php echo $selected_dept === (int)$dept->id ? 'selected' : ''; ?>>
                  <?php echo htmlspecialchars($dept->depart_name, ENT_QUOTES, 'UTF-8'); ?>
                </option>
              <?php endforeach; ?>
            </select>
            <i class="fa-solid fa-chevron-down doctor-select-arrow" aria-hidden="true"></i>
          </div>
        </div>

        <!-- Action Buttons -->
        <div class="doctor-filter-actions">
          <button type="submit" class="doctor-btn-search">
            <i class="fa-solid fa-magnifying-glass"></i>
            <span>Tìm kiếm</span>
          </button>

          <?php if($selected_dept > 0 || $keyword !== ''): ?>
            <a href="<?php echo XC_URL; ?>/bac-si" class="doctor-btn-clear" title="Xóa toàn bộ bộ lọc">
              <i class="fa-solid fa-arrow-rotate-left"></i>
              <span>Đặt lại</span>
            </a>
          <?php endif; ?>
        </div>
      </form>

      <!-- Active Filter Tags (if any filter is applied) -->
      <?php if($selected_dept > 0 || $keyword !== ''): ?>
        <div class="doctor-active-tags-bar">
          <span class="doctor-active-tags-label"><i class="fa-solid fa-filter"></i> Đang lọc theo:</span>
          <div class="doctor-active-tags-list">
            <?php if($selected_dept > 0 && !empty($selectedDeptName)): ?>
              <span class="doctor-active-tag">
                <i class="fa-solid fa-hospital-user"></i>
                Khoa: <strong><?php echo htmlspecialchars($selectedDeptName, ENT_QUOTES, 'UTF-8'); ?></strong>
                <a href="<?php echo XC_URL; ?>/bac-si<?php echo $keyword !== '' ? '?q='.urlencode($keyword) : ''; ?>" title="Bỏ lọc khoa này">
                  <i class="fa-solid fa-xmark"></i>
                </a>
              </span>
            <?php endif; ?>

            <?php if($keyword !== ''): ?>
              <span class="doctor-active-tag">
                <i class="fa-solid fa-magnifying-glass"></i>
                Từ khóa: <strong>"<?php echo htmlspecialchars($keyword, ENT_QUOTES, 'UTF-8'); ?>"</strong>
                <a href="<?php echo XC_URL; ?>/bac-si<?php echo $selected_dept > 0 ? '?khoa='.(int)$selected_dept : ''; ?>" title="Bỏ từ khóa này">
                  <i class="fa-solid fa-xmark"></i>
                </a>
              </span>
            <?php endif; ?>

            <a href="<?php echo XC_URL; ?>/bac-si" class="doctor-clear-all-link">
              Xóa tất cả bộ lọc
            </a>
          </div>
        </div>
      <?php endif; ?>
    </section>

    <!-- ============================================================
         DOCTORS GRID
         ============================================================ -->
    <section class="doctors-grid-section">
      <?php if (!empty($doctors)): ?>
        <div class="doctors-page-grid">
          <?php foreach($doctors as $idx => $doc): 
            $docName = !empty($doc->doctor_name) ? $doc->doctor_name : (!empty($doc->fullname) ? $doc->fullname : '');
            $docPosition = !empty($doc->doctor_position) ? $doc->doctor_position : (!empty($doc->position) ? $doc->position : 'Cán bộ y tế');
            $docWorkplace = !empty($doc->doctor_workplace) ? $doc->doctor_workplace : (!empty($doc->workplace) ? $doc->workplace : 'Bệnh viện Đa khoa khu vực Đắk Hà');
            $docAvatar = !empty($doc->doctor_avatar) ? $doc->doctor_avatar : (!empty($doc->avatar) ? $doc->avatar : '');
            $docDob = !empty($doc->doctor_dob) ? $doc->doctor_dob : (!empty($doc->dob) ? $doc->dob : '');
            $docHometown = !empty($doc->doctor_hometown) ? $doc->doctor_hometown : (!empty($doc->hometown) ? $doc->hometown : '');
            $docCccd = !empty($doc->doctor_cccd) ? $doc->doctor_cccd : (!empty($doc->cccd) ? $doc->cccd : '');
            $docJobCode = !empty($doc->doctor_job_title_code) ? $doc->doctor_job_title_code : (!empty($doc->job_title_code) ? $doc->job_title_code : (!empty($doc->doctor_cchn) ? $doc->doctor_cchn : ''));
            $docCode = !empty($doc->doctor_code) ? $doc->doctor_code : (!empty($doc->code) ? $doc->code : '');

            $hasAvatar = !empty($docAvatar) && file_exists(__SITE_PATH . '/uploads/doctors/' . $docAvatar);
            $avatarSrc = $hasAvatar 
              ? XC_URL . '/uploads/doctors/' . htmlspecialchars($docAvatar, ENT_QUOTES, 'UTF-8')
              : XC_URL . '/template/frontend/assets/images/doctor-0' . (($idx % 3) + 1) . '.jpg';
            
            $docData = array(
              'fullname' => (string)$docName,
              'dob' => (!empty($docDob) && $docDob !== '0000-00-00') ? date('d/m/Y', strtotime($docDob)) : 'Chưa cập nhật',
              'hometown' => !empty($docHometown) ? (string)$docHometown : 'Chưa cập nhật',
              'cccd' => !empty($docCccd) ? (string)$docCccd : 'Chưa cập nhật',
              'position' => (string)$docPosition,
              'job_title_code' => !empty($docJobCode) ? (string)$docJobCode : 'Chưa cập nhật',
              'department' => !empty($doc->depart_name) ? (string)$doc->depart_name : 'Bệnh viện Đa khoa khu vực Đắk Hà',
              'workplace' => (string)$docWorkplace,
              'code' => !empty($docCode) ? (string)$docCode : 'Chưa cập nhật',
              'avatar' => $avatarSrc
            );
          ?>
          <article class="doctor-card doctor-card-clickable" 
                   data-doctor='<?php echo htmlspecialchars(json_encode($docData, JSON_UNESCAPED_UNICODE), ENT_QUOTES, 'UTF-8'); ?>'
                   onclick="openDoctorModal(this)"
                   role="button"
                   tabindex="0"
                   onkeydown="if(event.key==='Enter') openDoctorModal(this)"
                   itemscope itemtype="https://schema.org/Physician">
            <div class="doctor-avatar-circle">
              <img 
                src="<?php echo $avatarSrc; ?>" 
                alt="<?php echo htmlspecialchars($docName, ENT_QUOTES, 'UTF-8'); ?>"
                class="doctor-avatar-img" 
                loading="lazy"
                itemprop="image">
            </div>

            <div class="doctor-card-content">
              <h3 class="doctor-card-name" itemprop="name"><?php echo htmlspecialchars($docName, ENT_QUOTES, 'UTF-8'); ?></h3>
              
              <div class="doctor-card-dept">
                <span>Chuyên khoa: <b><?php echo htmlspecialchars($doc->depart_name ?: 'Đa khoa', ENT_QUOTES, 'UTF-8'); ?></b></span>
              </div>

              <div class="doctor-card-action">
                <span class="doctor-card-link">Xem thêm bác sĩ <i class="fa-solid fa-angles-right"></i></span>
              </div>
            </div>
          </article>
          <?php endforeach; ?>
        </div>

        <!-- ============================================================
             PAGINATION BAR (8 BÁC SĨ / TRANG)
             ============================================================ -->
        <?php if ($total_pages > 1): ?>
          <div class="doctor-pagination-wrap">
            <nav class="doctor-pagination-nav" aria-label="Phân trang đội ngũ bác sĩ">
              <ul class="doctor-pagination-list">
                <?php if ($page > 1): ?>
                  <li class="doctor-page-item">
                    <a href="<?php echo frontendDoctorPageUrl($page - 1, $selected_dept, $keyword); ?>" class="doctor-page-link prev" aria-label="Trang trước">
                      <i class="fa-solid fa-chevron-left"></i> Trước
                    </a>
                  </li>
                <?php else: ?>
                  <li class="doctor-page-item disabled">
                    <span class="doctor-page-link prev"><i class="fa-solid fa-chevron-left"></i> Trước</span>
                  </li>
                <?php endif; ?>

                <?php foreach(frontendDoctorPaginationItems($page, $total_pages) as $pItem): ?>
                  <?php if ($pItem === 'ellipsis'): ?>
                    <li class="doctor-page-item ellipsis"><span class="doctor-page-link">…</span></li>
                  <?php else: ?>
                    <li class="doctor-page-item <?php echo (int)$pItem === $page ? 'active' : ''; ?>">
                      <?php if ((int)$pItem === $page): ?>
                        <span class="doctor-page-link" aria-current="page"><?php echo $pItem; ?></span>
                      <?php else: ?>
                        <a href="<?php echo frontendDoctorPageUrl($pItem, $selected_dept, $keyword); ?>" class="doctor-page-link">
                          <?php echo $pItem; ?>
                        </a>
                      <?php endif; ?>
                    </li>
                  <?php endif; ?>
                <?php endforeach; ?>

                <?php if ($page < $total_pages): ?>
                  <li class="doctor-page-item">
                    <a href="<?php echo frontendDoctorPageUrl($page + 1, $selected_dept, $keyword); ?>" class="doctor-page-link next" aria-label="Trang tiếp">
                      Sau <i class="fa-solid fa-chevron-right"></i>
                    </a>
                  </li>
                <?php else: ?>
                  <li class="doctor-page-item disabled">
                    <span class="doctor-page-link next">Sau <i class="fa-solid fa-chevron-right"></i></span>
                  </li>
                <?php endif; ?>
              </ul>
            </nav>
          </div>
        <?php endif; ?>
      <?php else: ?>
        <div class="doctor-empty-state">
          <div class="doctor-empty-icon">
            <i class="fa-solid fa-user-doctor"></i>
          </div>
          <h3 class="doctor-empty-title">Chưa tìm thấy bác sĩ phù hợp</h3>
          <p class="doctor-empty-desc">Hiện không có thông tin bác sĩ nào khớp với điều kiện tìm kiếm của bạn.</p>
          <a href="<?php echo XC_URL; ?>/bac-si" class="doctor-btn-primary">
            <i class="fa-solid fa-list"></i> Xem tất cả danh sách bác sĩ
          </a>
        </div>
      <?php endif; ?>
    </section>

    <!-- ============================================================
         DOCTOR DETAIL MODAL POPUP
         ============================================================ -->
    <div id="doctorDetailModal" class="doctor-modal-backdrop" onclick="if(event.target === this) closeDoctorModal();" aria-hidden="true" role="dialog" aria-labelledby="modalDoctorName">
      <div class="doctor-modal-dialog">
        <button type="button" class="doctor-modal-close" aria-label="Đóng" onclick="closeDoctorModal()">&times;</button>
        
        <div class="doctor-modal-header">
          <h3 class="doctor-modal-main-title"><i class="fa-solid fa-address-card"></i> Thông Tin Chi Tiết Cán Bộ / Bác Sĩ</h3>
        </div>

        <div class="doctor-modal-body">
          <div class="doctor-modal-grid">
            <div class="doctor-modal-avatar-col">
              <div class="doctor-modal-avatar-wrap">
                <img id="modalDoctorImg" src="" alt="" class="doctor-modal-avatar">
              </div>
              <div class="doctor-modal-status-badge">
                <i class="fa-solid fa-circle-check"></i> Đang công tác
              </div>
            </div>

            <div class="doctor-modal-info-col">
              <h2 id="modalDoctorName" class="doctor-modal-name"></h2>
              <div id="modalDoctorPosition" class="doctor-modal-pos-badge"></div>

              <table class="doctor-modal-table">
                <tbody>
                  <tr>
                    <th scope="row"><i class="fa-solid fa-hospital-user"></i> Phòng ban, đơn vị</th>
                    <td id="modalDoctorDept"></td>
                  </tr>
                  <tr>
                    <th scope="row"><i class="fa-solid fa-hospital"></i> Đơn vị công tác</th>
                    <td id="modalDoctorWorkplace"></td>
                  </tr>
                  <tr>
                    <th scope="row"><i class="fa-solid fa-calendar-day"></i> Năm sinh</th>
                    <td id="modalDoctorDob"></td>
                  </tr>
                  <tr>
                    <th scope="row"><i class="fa-solid fa-map-location-dot"></i> Quê quán</th>
                    <td id="modalDoctorHometown"></td>
                  </tr>
                  <!-- <tr>
                    <th scope="row"><i class="fa-solid fa-id-badge"></i> CDNN / CCHN</th>
                    <td id="modalDoctorJobCode"></td>
                  </tr> -->
                  <tr>
                    <th scope="row"><i class="fa-solid fa-barcode"></i> Mã số</th>
                    <td id="modalDoctorCode"></td>
                  </tr>
                  <!-- <tr>
                    <th scope="row"><i class="fa-solid fa-id-card"></i> Số CCCD</th>
                    <td id="modalDoctorCccd"></td>
                  </tr> -->
                </tbody>
              </table>
            </div>
          </div>
        </div>

        <div class="doctor-modal-footer">
          <button type="button" class="doctor-modal-btn-close" onclick="closeDoctorModal()">Đóng</button>
        </div>
      </div>
    </div>

  </div>
</main>

<style>
/* ============================================================
   PAGE STYLES: ĐỘI NGŨ Y BÁC SĨ (100% Native CSS, No Bootstrap dependencies)
   ============================================================ */
.doctors-page {
  padding-top: var(--space-6);
  padding-bottom: var(--space-12);
}

/* Hero Banner */
.doctor-hero-banner {
  background: linear-gradient(135deg, #075985 0%, #0284c7 100%);
  color: #fff;
  border-radius: var(--radius-xl);
  padding: 32px 28px;
  margin-bottom: 24px;
  box-shadow: 0 10px 25px -5px rgba(2, 132, 199, 0.25);
}

.doctor-breadcrumbs {
  font-size: 13px;
  color: rgba(255, 255, 255, 0.75);
  margin-bottom: 12px;
  display: flex;
  align-items: center;
  gap: 8px;
}

.doctor-breadcrumbs a {
  color: rgba(255, 255, 255, 0.85);
  text-decoration: none;
  transition: color 0.2s;
}

.doctor-breadcrumbs a:hover {
  color: #fff;
  text-decoration: underline;
}

.doctor-breadcrumbs .sep {
  opacity: 0.5;
}

.doctor-breadcrumbs .cur {
  color: #fff;
  font-weight: 600;
}

.doctor-hero-title {
  font-size: clamp(24px, 4vw, 32px);
  font-weight: 800;
  color: #fff;
  margin: 0 0 8px 0;
  line-height: 1.25;
}

.doctor-hero-desc {
  font-size: 15px;
  color: rgba(255, 255, 255, 0.88);
  margin: 0;
  max-width: 800px;
  line-height: 1.6;
}

/* ============================================================
   PROFESSIONAL FILTER & SEARCH SUITE
   ============================================================ */
.doctor-filter-panel {
  background: #ffffff;
  border: 1px solid #e2e8f0;
  border-radius: 20px;
  padding: 22px 26px;
  margin-bottom: 32px;
  box-shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.04), 0 2px 8px rgba(0, 0, 0, 0.02);
  position: relative;
}

.doctor-filter-top {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 18px;
  padding-bottom: 12px;
  border-bottom: 1px solid #f1f5f9;
}

.doctor-filter-title {
  font-size: 15px;
  font-weight: 700;
  color: #1e293b;
  display: inline-flex;
  align-items: center;
  gap: 8px;
}

.doctor-filter-title i {
  color: #0284c7;
  font-size: 15px;
}

.doctor-filter-stat {
  font-size: 13.5px;
  color: #64748b;
  display: inline-flex;
  align-items: center;
  gap: 6px;
}

.doctor-filter-stat strong {
  color: #0284c7;
  font-weight: 700;
}

.doctor-filter-form {
  display: flex;
  gap: 16px;
  align-items: flex-end;
  flex-wrap: wrap;
}

.doctor-filter-field {
  display: flex;
  flex-direction: column;
  gap: 6px;
}

.doctor-filter-search {
  flex: 1 1 320px;
}

.doctor-filter-dept {
  flex: 1.1 1 340px;
}

.doctor-field-label {
  font-size: 13px;
  font-weight: 700;
  color: #334155;
  display: block;
}

.doctor-input-container,
.doctor-select-container {
  position: relative;
  display: flex;
  align-items: center;
  width: 100%;
}

.doctor-field-icon {
  position: absolute;
  left: 16px;
  top: 50%;
  transform: translateY(-50%);
  color: #94a3b8;
  font-size: 15px;
  pointer-events: none;
  transition: color 0.2s ease;
  z-index: 2;
}

.doctor-search-input,
.doctor-dept-select {
  width: 100%;
  height: 48px;
  padding: 0 16px 0 46px;
  border: 1.5px solid #cbd5e1;
  border-radius: 12px;
  font-size: 14px;
  font-family: inherit;
  color: #1e293b;
  background: #f8fafc;
  outline: none;
  transition: all 0.2s ease;
  box-sizing: border-box;
}

.doctor-search-input:focus,
.doctor-dept-select:focus {
  background: #ffffff;
  border-color: #0284c7;
  box-shadow: 0 0 0 3px rgba(2, 132, 199, 0.15);
}

.doctor-input-container:focus-within .doctor-field-icon,
.doctor-select-container:focus-within .doctor-field-icon {
  color: #0284c7;
}

.doctor-dept-select {
  appearance: none;
  -webkit-appearance: none;
  -moz-appearance: none;
  cursor: pointer;
  padding-right: 42px;
  font-weight: 500;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}

.doctor-select-arrow {
  position: absolute;
  right: 16px;
  top: 50%;
  transform: translateY(-50%);
  color: #64748b;
  font-size: 13px;
  pointer-events: none;
  transition: transform 0.2s ease, color 0.2s ease;
}

.doctor-select-container:focus-within .doctor-select-arrow {
  color: #0284c7;
  transform: translateY(-50%) rotate(180deg);
}

.doctor-input-clear-btn {
  position: absolute;
  right: 12px;
  top: 50%;
  transform: translateY(-50%);
  background: #e2e8f0;
  border: none;
  color: #64748b;
  width: 24px;
  height: 24px;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 12px;
  cursor: pointer;
  transition: all 0.2s;
  padding: 0;
}

.doctor-input-clear-btn:hover {
  background: #cbd5e1;
  color: #0f172a;
}

.doctor-filter-actions {
  display: flex;
  gap: 10px;
  align-items: center;
}

.doctor-btn-search {
  height: 48px;
  padding: 0 24px;
  background: linear-gradient(135deg, #0284c7 0%, #0369a1 100%);
  color: #ffffff;
  border: none;
  border-radius: 12px;
  font-size: 14px;
  font-weight: 600;
  font-family: inherit;
  cursor: pointer;
  display: inline-flex;
  align-items: center;
  gap: 8px;
  transition: all 0.2s ease;
  box-shadow: 0 2px 8px rgba(2, 132, 199, 0.25);
  white-space: nowrap;
}

.doctor-btn-search:hover {
  background: linear-gradient(135deg, #0369a1 0%, #075985 100%);
  transform: translateY(-1px);
  box-shadow: 0 4px 14px rgba(2, 132, 199, 0.35);
  color: #ffffff;
}

.doctor-btn-clear {
  height: 48px;
  padding: 0 18px;
  background: #f1f5f9;
  color: #475569;
  border: 1.5px solid #cbd5e1;
  border-radius: 12px;
  font-size: 14px;
  font-weight: 600;
  cursor: pointer;
  display: inline-flex;
  align-items: center;
  gap: 6px;
  text-decoration: none;
  transition: all 0.2s ease;
  white-space: nowrap;
  box-sizing: border-box;
}

.doctor-btn-clear:hover {
  background: #e2e8f0;
  color: #0f172a;
  border-color: #94a3b8;
}

/* Active Filter Tags */
.doctor-active-tags-bar {
  margin-top: 18px;
  padding-top: 14px;
  border-top: 1px solid #f1f5f9;
  display: flex;
  align-items: center;
  gap: 12px;
  flex-wrap: wrap;
}

.doctor-active-tags-label {
  font-size: 13px;
  font-weight: 700;
  color: #64748b;
  display: inline-flex;
  align-items: center;
  gap: 6px;
}

.doctor-active-tags-list {
  display: flex;
  align-items: center;
  gap: 8px;
  flex-wrap: wrap;
}

.doctor-active-tag {
  display: inline-flex;
  align-items: center;
  gap: 6px;
  background: #e0f2fe;
  color: #0369a1;
  border: 1px solid #bae6fd;
  padding: 5px 12px;
  border-radius: 9999px;
  font-size: 13px;
  font-weight: 500;
}

.doctor-active-tag strong {
  color: #075985;
  font-weight: 700;
}

.doctor-active-tag a {
  color: #0284c7;
  display: inline-flex;
  align-items: center;
  justify-content: center;
  width: 16px;
  height: 16px;
  border-radius: 50%;
  transition: all 0.15s;
  margin-left: 2px;
  text-decoration: none;
}

.doctor-active-tag a:hover {
  background: #0284c7;
  color: #ffffff;
}

.doctor-clear-all-link {
  font-size: 13px;
  color: #ef4444;
  font-weight: 600;
  text-decoration: none;
  margin-left: 4px;
  transition: color 0.15s;
}

.doctor-clear-all-link:hover {
  color: #dc2626;
  text-decoration: underline;
}

/* Grid layout */
.doctors-page-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(260px, 1fr));
  gap: 24px;
}

/* ============================================================
   DOCTOR CARD (CIRCULAR AVATAR DESIGN)
   ============================================================ */
.doctors-page-grid .doctor-card {
  background: #ffffff;
  border-radius: 20px;
  border: 1px solid #e2e8f0;
  padding: 28px 20px 22px 20px;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: space-between;
  text-align: center;
  box-shadow: 0 4px 16px rgba(0, 0, 0, 0.04);
  transition: all 0.3s cubic-bezier(0.16, 1, 0.3, 1);
  position: relative;
  width: 100%;
  height: 100%;
  box-sizing: border-box;
}

.doctor-card-clickable {
  cursor: pointer;
  user-select: none;
}

.doctor-card-clickable:hover,
.doctors-page-grid .doctor-card:hover {
  transform: translateY(-6px);
  box-shadow: 0 16px 32px rgba(2, 132, 199, 0.12), 0 4px 12px rgba(0, 0, 0, 0.04);
  border-color: #cbd5e1;
}

/* Circular Avatar Frame */
.doctor-avatar-circle {
  width: 190px;
  height: 190px;
  max-width: 100%;
  border-radius: 50%;
  overflow: hidden;
  margin: 0 auto 18px auto;
  border: 4px solid #f8fafc;
  box-shadow: 0 4px 14px rgba(0, 0, 0, 0.06);
  display: flex;
  align-items: center;
  justify-content: center;
  background: #f1f5f9;
  flex-shrink: 0;
}

.doctor-avatar-img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  object-position: center 15%;
  border-radius: 50%;
  display: block;
  transition: transform 0.4s ease;
}

.doctor-card:hover .doctor-avatar-img {
  transform: scale(1.05);
}

/* Card Content Body */
.doctor-card-content {
  display: flex;
  flex-direction: column;
  align-items: center;
  width: 100%;
  flex-grow: 1;
}

/* Doctor Name */
.doctor-card-name {
  font-family: inherit;
  font-size: 19px;
  font-weight: 800;
  color: #1e293b;
  text-transform: uppercase;
  margin: 0 0 10px 0;
  line-height: 1.35;
  letter-spacing: -0.01em;
  text-align: center;
}

/* Specialty / Department Line */
.doctor-card-dept {
  font-size: 15px;
  color: #475569;
  text-align: center;
  line-height: 1.45;
  margin-bottom: 22px;
}

.doctor-card-dept b {
  color: #1e293b;
  font-weight: 700;
}

/* Card Bottom Action Link */
.doctor-card-action {
  margin-top: auto;
  text-align: center;
  padding-top: 4px;
}

.doctor-card-link {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  gap: 8px;
  font-size: 15px;
  font-weight: 700;
  color: #2b5292;
  text-decoration: none;
  transition: color 0.2s ease;
}

.doctor-card-link i {
  font-size: 13px;
  transition: transform 0.2s ease;
}

.doctor-card:hover .doctor-card-link {
  color: #0284c7;
}

.doctor-card:hover .doctor-card-link i {
  transform: translateX(4px);
}

@media (max-width: 575px) {
  .doctors-page-grid .doctor-card {
    padding: 22px 16px 18px 16px;
  }
  .doctor-avatar-circle {
    width: 165px;
    height: 165px;
    margin-bottom: 14px;
  }
  .doctor-card-name {
    font-size: 17px;
  }
  .doctor-card-dept {
    font-size: 14px;
    margin-bottom: 16px;
  }
}

/* Empty State */
.doctor-empty-state {
  text-align: center;
  padding: 60px 20px;
  background: #fff;
  border: 1px solid var(--color-border-light);
  border-radius: var(--radius-xl);
  box-shadow: var(--shadow-card);
}

.doctor-empty-icon {
  font-size: 48px;
  color: #cbd5e1;
  margin-bottom: 16px;
}

.doctor-empty-title {
  font-size: 20px;
  font-weight: 700;
  color: #1e293b;
  margin: 0 0 8px 0;
}

.doctor-empty-desc {
  font-size: 14px;
  color: #64748b;
  margin: 0 0 24px 0;
}

/* ============================================================
   DOCTOR MODAL STYLES (100% Native CSS)
   ============================================================ */
.doctor-modal-backdrop {
  position: fixed;
  inset: 0;
  background: rgba(15, 23, 42, 0.7);
  backdrop-filter: blur(5px);
  -webkit-backdrop-filter: blur(5px);
  z-index: 999999;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 16px;
  opacity: 0;
  visibility: hidden;
  transition: opacity 0.25s ease, visibility 0.25s ease;
}

.doctor-modal-backdrop.active {
  opacity: 1;
  visibility: visible;
}

.doctor-modal-dialog {
  background: #ffffff;
  border-radius: 20px;
  max-width: 720px;
  width: 100%;
  max-height: 90vh;
  overflow-y: auto;
  position: relative;
  box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.3);
  transform: translateY(20px) scale(0.96);
  transition: transform 0.25s cubic-bezier(0.16, 1, 0.3, 1);
  padding: 24px 28px;
  box-sizing: border-box;
}

.doctor-modal-backdrop.active .doctor-modal-dialog {
  transform: translateY(0) scale(1);
}

.doctor-modal-close {
  position: absolute;
  top: 16px;
  right: 18px;
  width: 36px;
  height: 36px;
  border-radius: 50%;
  background: #f1f5f9;
  border: none;
  font-size: 24px;
  line-height: 1;
  color: #64748b;
  cursor: pointer;
  display: flex;
  align-items: center;
  justify-content: center;
  transition: all 0.2s ease;
}

.doctor-modal-close:hover {
  background: #e2e8f0;
  color: #0f172a;
}

.doctor-modal-header {
  border-bottom: 2px solid #f1f5f9;
  padding-bottom: 14px;
  margin-bottom: 20px;
}

.doctor-modal-main-title {
  font-size: 18px;
  font-weight: 700;
  color: #0284c7;
  margin: 0;
  display: flex;
  align-items: center;
  gap: 8px;
}

.doctor-modal-grid {
  display: grid;
  grid-template-columns: 210px 1fr;
  gap: 24px;
  align-items: start;
}

.doctor-modal-avatar-wrap {
  width: 100%;
  aspect-ratio: 3/4;
  border-radius: 14px;
  overflow: hidden;
  box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
  border: 1px solid #e2e8f0;
  background: #f8fafc;
}

.doctor-modal-avatar {
  width: 100%;
  height: 100%;
  object-fit: cover;
  display: block;
}

.doctor-modal-status-badge {
  margin-top: 12px;
  text-align: center;
  background: #f0fdf4;
  color: #16a34a;
  border: 1px solid #bbf7d0;
  padding: 6px 12px;
  border-radius: 9999px;
  font-size: 12px;
  font-weight: 600;
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 6px;
}

.doctor-modal-name {
  font-size: 22px;
  font-weight: 800;
  color: #0f172a;
  margin: 0 0 8px 0;
  line-height: 1.25;
}

.doctor-modal-pos-badge {
  display: inline-block;
  background: #e0f2fe;
  color: #0369a1;
  font-size: 13px;
  font-weight: 700;
  padding: 4px 12px;
  border-radius: 9999px;
  margin-bottom: 16px;
}

.doctor-modal-table {
  width: 100%;
  border-collapse: collapse;
  font-size: 13.5px;
}

.doctor-modal-table th {
  text-align: left;
  padding: 8px 10px;
  font-weight: 600;
  color: #475569;
  width: 44%;
  background: #f8fafc;
  border-bottom: 1px solid #edf2f7;
  white-space: nowrap;
}

.doctor-modal-table th i {
  color: #0284c7;
  width: 16px;
  margin-right: 6px;
}

.doctor-modal-table td {
  padding: 8px 10px;
  color: #1e293b;
  font-weight: 500;
  border-bottom: 1px solid #edf2f7;
}

.doctor-modal-footer {
  margin-top: 20px;
  padding-top: 14px;
  border-top: 1px solid #f1f5f9;
  display: flex;
  justify-content: flex-end;
}

.doctor-modal-btn-close {
  background: #f1f5f9;
  color: #475569;
  border: 1px solid #cbd5e1;
  border-radius: 9999px;
  padding: 8px 22px;
  font-size: 14px;
  font-weight: 600;
  cursor: pointer;
  transition: all 0.2s;
}

.doctor-modal-btn-close:hover {
  background: #e2e8f0;
  color: #0f172a;
}

/* ============================================================
   PAGINATION STYLES (8 BÁC SĨ / TRANG)
   ============================================================ */
.doctor-pagination-wrap {
  margin-top: 40px;
  margin-bottom: 20px;
  padding: 0;
  background: transparent;
  border: none;
  box-shadow: none;
  display: flex;
  align-items: center;
  justify-content: center;
}

.doctor-pagination-nav {
  display: flex;
  justify-content: center;
}

.doctor-pagination-list {
  display: flex;
  align-items: center;
  justify-content: center;
  list-style: none;
  margin: 0;
  padding: 0;
  gap: 8px;
  flex-wrap: wrap;
}

.doctor-page-item {
  display: inline-block;
  margin: 0;
  padding: 0;
}

.doctor-page-link {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  min-width: 38px;
  height: 38px;
  padding: 0 10px;
  font-size: 14px;
  font-weight: 600;
  color: #334155;
  background: #f8fafc;
  border: 1px solid #e2e8f0;
  border-radius: 8px;
  text-decoration: none;
  transition: all 0.2s ease;
  user-select: none;
}

a.doctor-page-link:hover {
  background: #0284c7;
  color: #ffffff;
  border-color: #0284c7;
  box-shadow: 0 4px 10px rgba(2, 132, 199, 0.25);
  transform: translateY(-1px);
}

.doctor-page-link.prev,
.doctor-page-link.next {
  padding: 0 14px;
  gap: 6px;
  font-weight: 600;
}

.doctor-page-item.active .doctor-page-link {
  background: linear-gradient(135deg, #0284c7 0%, #0369a1 100%);
  color: #ffffff;
  border-color: #0284c7;
  box-shadow: 0 4px 12px rgba(2, 132, 199, 0.35);
  cursor: default;
}

.doctor-page-item.disabled .doctor-page-link {
  background: #f1f5f9;
  color: #94a3b8;
  border-color: #e2e8f0;
  cursor: not-allowed;
  opacity: 0.65;
  pointer-events: none;
}

.doctor-page-item.ellipsis .doctor-page-link {
  background: transparent;
  border-color: transparent;
  color: #94a3b8;
  cursor: default;
  min-width: 28px;
  padding: 0;
}

@media (max-width: 768px) {
  .doctor-filter-panel {
    padding: 18px 16px;
  }
  .doctor-filter-top {
    flex-direction: column;
    align-items: flex-start;
    gap: 8px;
  }
  .doctor-filter-form {
    flex-direction: column;
    align-items: stretch;
    gap: 12px;
  }
  .doctor-filter-search,
  .doctor-filter-dept {
    flex: 1 1 100%;
    width: 100%;
  }
  .doctor-filter-actions {
    flex-direction: row;
    width: 100%;
  }
  .doctor-btn-search {
    flex: 1;
    justify-content: center;
  }
  .doctor-btn-clear {
    justify-content: center;
  }
  .doctors-page-grid {
    grid-template-columns: 1fr;
  }
  .doctor-modal-grid {
    grid-template-columns: 1fr;
    gap: 16px;
  }
  .doctor-modal-avatar-col {
    max-width: 180px;
    margin: 0 auto;
  }
  .doctor-modal-table th {
    width: 46%;
    white-space: normal;
  }
  .doctor-pagination-wrap {
    margin-top: 28px;
    margin-bottom: 12px;
    padding: 0;
  }
  .doctor-pagination-list {
    justify-content: center;
    gap: 6px;
  }
  .doctor-page-link {
    min-width: 34px;
    height: 34px;
    font-size: 13px;
    padding: 0 8px;
  }
  .doctor-page-link.prev,
  .doctor-page-link.next {
    padding: 0 10px;
  }
}

/* Refined presentation; filtering, pagination and modal behavior stay unchanged. */
.doctors-page {
  background: #f6f9fc;
  padding-top: 32px;
  padding-bottom: 64px;
}

.doctor-hero-banner {
  position: relative;
  isolation: isolate;
  overflow: hidden;
  min-height: 190px;
  display: flex;
  align-items: center;
  padding: 36px clamp(24px, 4vw, 52px);
  margin-bottom: 22px;
  border: 1px solid #d9e8f4;
  border-radius: 18px;
  background: linear-gradient(115deg, #eaf5fc 0%, #f8fbfe 58%, #e7f3fa 100%);
  box-shadow: 0 12px 32px rgba(20, 72, 112, .06);
}

.doctor-hero-banner::after {
  content: '';
  position: absolute;
  right: -36px;
  top: -115px;
  width: 360px;
  height: 360px;
  border: 45px solid rgba(2, 132, 199, .055);
  border-radius: 50%;
  z-index: -1;
}

.doctor-hero-content { max-width: 820px; }
.doctor-hero-title {
  color: #123d61;
  font-size: clamp(27px, 3vw, 38px);
  letter-spacing: -.025em;
  margin-bottom: 12px;
}
.doctor-hero-desc {
  color: #486176;
  font-size: 15px;
  line-height: 1.75;
  max-width: 720px;
}

.doctor-filter-panel {
  padding: 22px 26px 24px;
  margin-bottom: 26px;
  border: 1px solid #dfebf4;
  border-radius: 16px;
  box-shadow: 0 8px 26px rgba(17, 57, 92, .045);
}
.doctor-filter-top { padding-bottom: 16px; margin-bottom: 20px; border-color: #e8eef4; }
.doctor-filter-title { color: #173b5b; font-size: 16px; }
.doctor-filter-title i { color: #0879b4; }
.doctor-filter-stat {
  padding: 6px 12px;
  border-radius: 99px;
  background: #eef7fc;
  color: #3d6078;
}
.doctor-field-label { color: #38516a; }
.doctor-search-input, .doctor-dept-select {
  background: #fff;
  border-color: #d6e1ea;
  border-radius: 9px;
}
.doctor-search-input:hover, .doctor-dept-select:hover { border-color: #a9c5d9; }
.doctor-btn-search { background: #0879b4; border-radius: 9px; box-shadow: none; }
.doctor-btn-search:hover { background: #08669a; box-shadow: 0 7px 16px rgba(8, 102, 154, .18); }
.doctor-btn-clear { background: #fff; border-color: #d6e1ea; border-radius: 9px; }

.doctors-grid-section { padding: 0; }
.doctors-page-grid {
  grid-template-columns: repeat(auto-fill, minmax(255px, 1fr));
  gap: 20px;
}
.doctors-page-grid .doctor-card {
  align-items: stretch;
  justify-content: flex-start;
  padding: 0;
  overflow: hidden;
  text-align: left;
  border-color: #e0e9f1;
  border-radius: 16px;
  box-shadow: 0 6px 20px rgba(24, 58, 86, .055);
}
.doctor-card-clickable:hover, .doctors-page-grid .doctor-card:hover {
  transform: translateY(-4px);
  border-color: #bed9ea;
  box-shadow: 0 16px 30px rgba(17, 75, 118, .12);
}
.doctor-card-clickable:focus-visible {
  outline: 3px solid #0284c7;
  outline-offset: 3px;
}
.doctor-avatar-circle {
  width: 100%;
  max-width: none;
  height: 228px;
  margin: 0;
  border: 0;
  border-radius: 0;
  box-shadow: none;
  background: #eaf2f7;
}
.doctor-avatar-img {
  border-radius: 0;
  object-position: center 18%;
}
.doctor-card-content {
  align-items: stretch;
  padding: 20px 22px 18px;
}
.doctor-card-name {
  color: #153a58;
  font-size: 18px;
  letter-spacing: 0;
  text-transform: none;
  text-align: left;
  margin-bottom: 12px;
}
.doctor-card-dept {
  align-self: flex-start;
  margin-bottom: 20px;
  padding: 6px 10px;
  border-radius: 7px;
  background: #edf6fb;
  color: #4a6378;
  font-size: 13px;
  text-align: left;
}
.doctor-card-dept b { color: #17648e; }
.doctor-card-action {
  width: 100%;
  padding-top: 14px;
  border-top: 1px solid #e8eff4;
  text-align: left;
}
.doctor-card-link { color: #0879b4; font-size: 13px; }
.doctor-card:hover .doctor-card-link { color: #065a8a; }

.doctor-modal-dialog { border-radius: 18px; box-shadow: 0 28px 65px rgba(8, 33, 55, .26); }
.doctor-modal-header { border-color: #e8eef4; }
.doctor-modal-main-title { color: #174e78; }
.doctor-modal-avatar-wrap { border-radius: 12px; }
.doctor-modal-table th, .doctor-modal-table td { padding-block: 11px; }
.doctor-page-link { background: #fff; border-color: #dce8f1; }

@media (min-width: 600px) and (max-width: 900px) {
  .doctors-page-grid { grid-template-columns: repeat(2, minmax(0, 1fr)); }
}
@media (max-width: 599px) {
  .doctors-page { padding-top: 20px; padding-bottom: 42px; }
  .doctor-hero-banner { min-height: 0; padding: 28px 22px; }
  .doctor-hero-banner::after { right: -170px; }
  .doctor-hero-title { font-size: 27px; }
  .doctor-filter-panel { padding: 18px; }
  .doctor-filter-stat { padding: 0; background: transparent; }
  .doctors-page-grid { grid-template-columns: 1fr; gap: 16px; }
  .doctor-avatar-circle { height: 240px; }
}
</style>

<script>
function openDoctorModal(cardEl) {
  try {
    var raw = cardEl.getAttribute('data-doctor');
    if (!raw) return;
    var data = JSON.parse(raw);
    
    document.getElementById('modalDoctorImg').src = data.avatar || '';
    document.getElementById('modalDoctorImg').alt = data.fullname || '';
    document.getElementById('modalDoctorName').textContent = data.fullname || '';
    document.getElementById('modalDoctorPosition').textContent = data.position || '';
    document.getElementById('modalDoctorDept').textContent = data.department || '-';
    document.getElementById('modalDoctorWorkplace').textContent = data.workplace || '-';
    document.getElementById('modalDoctorDob').textContent = data.dob ? String(data.dob).trim().slice(-4) : '-';
    document.getElementById('modalDoctorHometown').textContent = data.hometown || '-';
    document.getElementById('modalDoctorCode').textContent = data.code || '-';
    
    var modal = document.getElementById('doctorDetailModal');
    if (modal) {
      modal.classList.add('active');
      document.body.style.overflow = 'hidden';
    }
  } catch (err) {
    console.error('Error opening doctor modal:', err);
  }
}

function closeDoctorModal() {
  var modal = document.getElementById('doctorDetailModal');
  if (modal) {
    modal.classList.remove('active');
    document.body.style.overflow = '';
  }
}

document.addEventListener('keydown', function(e) {
  if (e.key === 'Escape') {
    closeDoctorModal();
  }
});
</script>

<?php require_once "footer.php"; ?>
