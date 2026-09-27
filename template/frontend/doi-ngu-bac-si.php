<?php require_once "header.php"; 
$doctors = is_array($doctors) ? $doctors : array();
$departments = is_array($departments) ? $departments : array();
$selected_dept = isset($selected_dept) ? (int)$selected_dept : 0;
$keyword = isset($keyword) ? (string)$keyword : '';
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
            $hasAvatar = !empty($doc->avatar) && file_exists(__SITE_PATH . '/uploads/doctors/' . $doc->avatar);
            $avatarSrc = $hasAvatar 
              ? XC_URL . '/uploads/doctors/' . htmlspecialchars($doc->avatar, ENT_QUOTES, 'UTF-8')
              : XC_URL . '/template/frontend/assets/images/doctor-0' . (($idx % 3) + 1) . '.jpg';
          ?>
          <article class="doctor-card" itemscope itemtype="https://schema.org/Physician">
            <div class="doctor-img-wrap">
              <img 
                src="<?php echo $avatarSrc; ?>" 
                alt="<?php echo htmlspecialchars($doc->position . ' ' . $doc->fullname, ENT_QUOTES, 'UTF-8'); ?>"
                class="doctor-img" 
                loading="lazy">
              <div class="doctor-overlay" aria-hidden="true">
                <a href="<?php echo XC_URL; ?>/lien-he" class="doctor-overlay-btn">Đặt lịch khám</a>
              </div>
            </div>

            <div class="doctor-info">
              <span class="doctor-badge"><?php echo htmlspecialchars($doc->position, ENT_QUOTES, 'UTF-8'); ?></span>
              <h3 class="doctor-name" itemprop="name"><?php echo htmlspecialchars($doc->fullname, ENT_QUOTES, 'UTF-8'); ?></h3>
              <p class="doctor-spec" itemprop="medicalSpecialty">
                <i class="fa-solid fa-stethoscope"></i> <?php echo htmlspecialchars($doc->depart_name ?: 'Bệnh viện Đắk Hà', ENT_QUOTES, 'UTF-8'); ?>
              </p>

              <?php if(!empty($doc->cchn)): ?>
                <div class="doctor-cchn-tag">
                  <i class="fa-solid fa-certificate"></i> CCHN: <?php echo htmlspecialchars($doc->cchn, ENT_QUOTES, 'UTF-8'); ?>
                </div>
              <?php endif; ?>

              <div class="doctor-card-footer">
                <span class="doctor-status-text">
                  <i class="fa-solid fa-circle-check"></i> Đang công tác
                </span>
                <a href="<?php echo XC_URL; ?>/lien-he" class="doctor-contact-link">
                  Liên hệ <i class="fa-solid fa-arrow-right"></i>
                </a>
              </div>
            </div>
          </article>
          <?php endforeach; ?>
        </div>
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
  margin: 0 0 6px 0;
  color: #0f172a;
}

.doctors-page-grid .doctor-spec {
  font-size: 13px;
  color: #0284c7;
  font-weight: 600;
  margin: 0 0 10px 0;
  display: flex;
  align-items: center;
  gap: 6px;
}

.doctor-cchn-tag {
  display: inline-flex;
  align-items: center;
  gap: 6px;
  background: #fffbeb;
  color: #b45309;
  border: 1px solid #fef3c7;
  border-radius: 6px;
  padding: 4px 8px;
  font-size: 11px;
  font-weight: 600;
  margin-bottom: 12px;
}

.doctor-card-footer {
  margin-top: auto;
  padding-top: 12px;
  border-top: 1px solid #f1f5f9;
  display: flex;
  align-items: center;
  justify-content: space-between;
}

.doctor-status-text {
  font-size: 11px;
  color: #16a34a;
  font-weight: 600;
  display: inline-flex;
  align-items: center;
  gap: 4px;
}

.doctor-contact-link {
  font-size: 12px;
  color: #0284c7;
  font-weight: 600;
  text-decoration: none;
  display: inline-flex;
  align-items: center;
  gap: 4px;
  transition: transform 0.2s, color 0.2s;
}

.doctor-contact-link:hover {
  color: #0369a1;
  transform: translateX(2px);
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
}
</style>

<?php require_once "footer.php"; ?>
