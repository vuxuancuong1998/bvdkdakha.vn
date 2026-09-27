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
      <nav class="doctor-breadcrumbs" aria-label="Điều hướng trang">
        <a href="<?php echo XC_URL; ?>/"><i class="fa-solid fa-house"></i> Trang chủ</a>
        <span class="sep">/</span>
        <span class="cur">Đội ngũ Y Bác sĩ</span>
      </nav>
      <div class="doctor-hero-content">
        <h1 class="doctor-hero-title">Đội Ngũ Y Bác Sĩ</h1>
        <p class="doctor-hero-desc">
          Đội ngũ thầy thuốc tận tâm, giàu y đức và chuyên môn cao tại Bệnh viện Đa khoa Khu vực Đắk Hà, luôn sẵn sàng đồng hành cùng sức khỏe nhân dân.
        </p>
      </div>
    </section>

    <!-- ============================================================
         FILTER & SEARCH PANEL
         ============================================================ -->
    <section class="doctor-filter-panel">
      <form method="get" action="<?php echo XC_URL; ?>/bac-si" class="doctor-search-bar">
        <div class="doctor-input-wrap">
          <i class="fa-solid fa-magnifying-glass doctor-search-icon"></i>
          <input 
            type="text" 
            name="q" 
            class="doctor-search-input" 
            placeholder="Tìm tên bác sĩ, chức danh, số CCHN..." 
            value="<?php echo htmlspecialchars($keyword, ENT_QUOTES, 'UTF-8'); ?>"
            autocomplete="off">
          <?php if($selected_dept > 0): ?>
            <input type="hidden" name="khoa" value="<?php echo $selected_dept; ?>">
          <?php endif; ?>
        </div>

        <button type="submit" class="doctor-btn-primary">
          <i class="fa-solid fa-filter"></i> Tìm kiếm
        </button>

        <?php if($selected_dept > 0 || $keyword !== ''): ?>
          <a href="<?php echo XC_URL; ?>/bac-si" class="doctor-btn-reset" title="Đặt lại bộ lọc">
            <i class="fa-solid fa-rotate-left"></i> Tất cả
          </a>
        <?php endif; ?>
      </form>

      <!-- Department Filter Pills -->
      <div class="doctor-pills-bar">
        <span class="doctor-pills-label">
          <i class="fa-solid fa-hospital-user"></i> Chuyên khoa:
        </span>
        <div class="doctor-pills-list">
          <a href="<?php echo XC_URL; ?>/bac-si<?php echo $keyword !== '' ? '?q='.urlencode($keyword) : ''; ?>" 
             class="doctor-pill <?php echo $selected_dept === 0 ? 'active' : ''; ?>">
            Tất cả
          </a>
          <?php foreach($departments as $dept): ?>
            <a href="<?php echo XC_URL; ?>/bac-si?khoa=<?php echo (int)$dept->id; ?><?php echo $keyword !== '' ? '&q='.urlencode($keyword) : ''; ?>" 
               class="doctor-pill <?php echo $selected_dept === (int)$dept->id ? 'active' : ''; ?>">
              <?php echo htmlspecialchars($dept->depart_name, ENT_QUOTES, 'UTF-8'); ?>
            </a>
          <?php endforeach; ?>
        </div>
      </div>
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
                   itemscope itemtype="https://schema.org/Physician">
            <div class="doctor-img-wrap">
              <img 
                src="<?php echo $avatarSrc; ?>" 
                alt="<?php echo htmlspecialchars($docPosition . ' ' . $docName, ENT_QUOTES, 'UTF-8'); ?>"
                class="doctor-img" 
                loading="lazy">
              <div class="doctor-overlay" aria-hidden="true">
                <span class="doctor-overlay-btn"><i class="fa-solid fa-circle-info"></i> Xem chi tiết</span>
              </div>
            </div>

            <div class="doctor-info">
              <span class="doctor-badge"><?php echo htmlspecialchars($docPosition, ENT_QUOTES, 'UTF-8'); ?></span>
              <h3 class="doctor-name" itemprop="name"><?php echo htmlspecialchars($docName, ENT_QUOTES, 'UTF-8'); ?></h3>
              
              <div class="doctor-workplace-box">
                <div class="doctor-dept-line">
                  <i class="fa-solid fa-hospital-user"></i>
                  <span><?php echo htmlspecialchars($doc->depart_name ?: 'Bệnh viện Đắk Hà', ENT_QUOTES, 'UTF-8'); ?></span>
                </div>
                <div class="doctor-workplace-line">
                  <i class="fa-solid fa-hospital"></i>
                  <span><?php echo htmlspecialchars($docWorkplace, ENT_QUOTES, 'UTF-8'); ?></span>
                </div>
              </div>

              <div class="doctor-card-footer">
                <span class="doctor-view-detail-btn">
                  <i class="fa-solid fa-id-card"></i> Xem chi tiết hồ sơ
                </span>
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
                    <th scope="row"><i class="fa-solid fa-calendar-day"></i> Ngày sinh</th>
                    <td id="modalDoctorDob"></td>
                  </tr>
                  <tr>
                    <th scope="row"><i class="fa-solid fa-map-location-dot"></i> Quê quán</th>
                    <td id="modalDoctorHometown"></td>
                  </tr>
                  <tr>
                    <th scope="row"><i class="fa-solid fa-id-badge"></i> Mã ngạch / CDNN</th>
                    <td id="modalDoctorJobCode"></td>
                  </tr>
                  <tr>
                    <th scope="row"><i class="fa-solid fa-barcode"></i> Mã số</th>
                    <td id="modalDoctorCode"></td>
                  </tr>
                  <tr>
                    <th scope="row"><i class="fa-solid fa-id-card"></i> Số CCCD</th>
                    <td id="modalDoctorCccd"></td>
                  </tr>
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

/* Filter Panel */
.doctor-filter-panel {
  background: #fff;
  border: 1px solid var(--color-border-light);
  border-radius: var(--radius-xl);
  padding: 20px 24px;
  margin-bottom: 32px;
  box-shadow: var(--shadow-card);
}

.doctor-search-bar {
  display: flex;
  gap: 12px;
  align-items: center;
  flex-wrap: wrap;
}

.doctor-input-wrap {
  position: relative;
  flex: 1 1 300px;
}

.doctor-search-icon {
  position: absolute;
  left: 16px;
  top: 50%;
  transform: translateY(-50%);
  color: #94a3b8;
  font-size: 15px;
  pointer-events: none;
}

.doctor-search-input {
  width: 100%;
  padding: 12px 16px 12px 42px;
  border: 1px solid #cbd5e1;
  border-radius: var(--radius-full);
  font-size: 14px;
  font-family: inherit;
  color: var(--color-text);
  background: #f8fafc;
  outline: none;
  transition: all 0.2s ease;
  box-sizing: border-box;
}

.doctor-search-input:focus {
  background: #fff;
  border-color: #0284c7;
  box-shadow: 0 0 0 3px rgba(2, 132, 199, 0.15);
}

.doctor-btn-primary {
  background: #0284c7;
  color: #fff;
  border: none;
  border-radius: var(--radius-full);
  padding: 12px 24px;
  font-size: 14px;
  font-weight: 600;
  font-family: inherit;
  cursor: pointer;
  display: inline-flex;
  align-items: center;
  gap: 8px;
  text-decoration: none;
  transition: all 0.2s ease;
  box-shadow: 0 2px 8px rgba(2, 132, 199, 0.25);
  white-space: nowrap;
}

.doctor-btn-primary:hover {
  background: #0369a1;
  transform: translateY(-1px);
  box-shadow: 0 4px 12px rgba(2, 132, 199, 0.35);
  color: #fff;
}

.doctor-btn-reset {
  background: #f1f5f9;
  color: #475569;
  border: 1px solid #cbd5e1;
  border-radius: var(--radius-full);
  padding: 11px 18px;
  font-size: 14px;
  font-weight: 500;
  cursor: pointer;
  display: inline-flex;
  align-items: center;
  gap: 6px;
  text-decoration: none;
  transition: all 0.2s ease;
  white-space: nowrap;
}

.doctor-btn-reset:hover {
  background: #e2e8f0;
  color: #1e293b;
}

/* Pills Bar */
.doctor-pills-bar {
  border-top: 1px solid #f1f5f9;
  margin-top: 16px;
  padding-top: 16px;
  display: flex;
  align-items: center;
  gap: 12px;
  flex-wrap: wrap;
}

.doctor-pills-label {
  font-size: 13px;
  font-weight: 700;
  color: #64748b;
  display: inline-flex;
  align-items: center;
  gap: 6px;
}

.doctor-pills-list {
  display: flex;
  gap: 8px;
  flex-wrap: wrap;
  align-items: center;
}

.doctor-pill {
  display: inline-block;
  background: #f8fafc;
  color: #475569;
  border: 1px solid #e2e8f0;
  border-radius: var(--radius-full);
  padding: 6px 16px;
  font-size: 13px;
  font-weight: 500;
  text-decoration: none;
  transition: all 0.2s ease;
}

.doctor-pill:hover {
  background: #e0f2fe;
  color: #0284c7;
  border-color: #bae6fd;
}

.doctor-pill.active {
  background: #0284c7;
  color: #fff;
  border-color: #0284c7;
  font-weight: 600;
  box-shadow: 0 2px 6px rgba(2, 132, 199, 0.25);
}

/* Grid layout */
.doctors-page-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(260px, 1fr));
  gap: 24px;
}

/* Clickable card */
.doctor-card-clickable {
  cursor: pointer;
  transition: transform 0.2s ease, box-shadow 0.2s ease;
}

.doctor-card-clickable:hover {
  transform: translateY(-6px);
  box-shadow: 0 16px 32px rgba(2, 132, 199, 0.12);
}

/* Card customizations for list */
.doctors-page-grid .doctor-card {
  display: flex;
  flex-direction: column;
  height: 100%;
}

.doctors-page-grid .doctor-info {
  display: flex;
  flex-direction: column;
  flex-grow: 1;
  padding: 18px 16px 14px 16px;
  text-align: left;
}

.doctors-page-grid .doctor-name {
  font-size: 17px;
  font-weight: 700;
  margin: 0 0 8px 0;
  color: #0f172a;
}

.doctor-workplace-box {
  margin-bottom: 12px;
  display: flex;
  flex-direction: column;
  gap: 4px;
}

.doctor-dept-line {
  font-size: 13px;
  color: #0284c7;
  font-weight: 600;
  display: flex;
  align-items: center;
  gap: 6px;
}

.doctor-workplace-line {
  font-size: 12px;
  color: #64748b;
  font-weight: 500;
  display: flex;
  align-items: center;
  gap: 6px;
}

.doctor-card-footer {
  margin-top: auto;
  padding-top: 10px;
  border-top: 1px solid #f1f5f9;
}

.doctor-view-detail-btn {
  font-size: 12px;
  color: #0284c7;
  font-weight: 700;
  display: inline-flex;
  align-items: center;
  gap: 6px;
  transition: color 0.2s;
}

.doctor-card:hover .doctor-view-detail-btn {
  color: #0369a1;
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

@media (max-width: 640px) {
  .doctor-search-bar {
    flex-direction: column;
    align-items: stretch;
  }
  .doctor-btn-primary, .doctor-btn-reset {
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
    document.getElementById('modalDoctorDob').textContent = data.dob || '-';
    document.getElementById('modalDoctorHometown').textContent = data.hometown || '-';
    document.getElementById('modalDoctorJobCode').textContent = data.job_title_code || '-';
    document.getElementById('modalDoctorCode').textContent = data.code || '-';
    document.getElementById('modalDoctorCccd').textContent = data.cccd || '-';
    
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
