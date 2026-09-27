<?php require_once "header.php"; 
$doctors = is_array($doctors) ? $doctors : array();
$departments = is_array($departments) ? $departments : array();
$selected_dept = isset($selected_dept) ? (int)$selected_dept : 0;
$keyword = isset($keyword) ? (string)$keyword : '';
?>

<main id="main-content" role="main" class="doctors-page py-4">

  <!-- ============================================================
       HERO & BREADCRUMBS SECTION
       ============================================================ -->
  <section class="services-hero py-4 mb-4" style="background: linear-gradient(135deg, #075985 0%, #0284c7 100%); color: #fff; border-radius: 12px;">
    <div class="container">
      <nav class="services-breadcrumbs mb-2" aria-label="Điều hướng trang">
        <ol class="breadcrumb bg-transparent p-0 m-0" style="font-size: 14px;">
          <li class="breadcrumb-item"><a href="<?php echo XC_URL; ?>" class="text-white-50 text-decoration-none"><i class="fa-solid fa-house me-1"></i> Trang chủ</a></li>
          <li class="breadcrumb-item active text-white" aria-current="page">Đội ngũ Y Bác sĩ</li>
        </ol>
      </nav>
      <div class="row align-items-center">
        <div class="col-lg-8">
          <h1 class="h2 font-weight-extrabold mb-2" style="font-weight: 800; color: #fff;">Đội Ngũ Y Bác Sĩ</h1>
          <p class="lead mb-0 text-white-50" style="font-size: 15px;">
            Đội ngũ thầy thuốc tận tâm, giàu y đức và chuyên môn cao tại Bệnh viện Đa khoa Khu vực Đắk Hà, luôn sẵn sàng đồng hành cùng sức khỏe cộng đồng.
          </p>
        </div>
      </div>
    </div>
  </section>

  <!-- ============================================================
       FILTER & SEARCH BAR
       ============================================================ -->
  <section class="py-3 mb-4">
    <div class="container">
      <div class="bg-white p-3 border rounded-4 shadow-sm">
        <form method="get" action="<?php echo XC_URL; ?>/bac-si" class="row g-2 align-items-center">
          <!-- Thanh tìm kiếm -->
          <div class="col-lg-5 col-md-6">
            <div class="input-group">
              <span class="input-group-text bg-light border-end-0"><i class="fa-solid fa-magnifying-glass text-muted"></i></span>
              <input type="text" name="q" class="form-control border-start-0" placeholder="Tìm tên bác sĩ, chức danh, CCHN..." value="<?php echo htmlspecialchars($keyword, ENT_QUOTES, 'UTF-8'); ?>">
              <?php if($selected_dept > 0): ?>
                <input type="hidden" name="khoa" value="<?php echo $selected_dept; ?>">
              <?php endif; ?>
            </div>
          </div>

          <!-- Lọc chuyên khoa Dropdown trên mobile/tablet -->
          <div class="col-lg-5 col-md-6 d-md-none">
            <select name="khoa" class="form-select" onchange="this.form.submit()">
              <option value="0">-- Tất cả chuyên khoa --</option>
              <?php foreach($departments as $dept): ?>
                <option value="<?php echo (int)$dept->id; ?>" <?php echo $selected_dept === (int)$dept->id ? 'selected' : ''; ?>>
                  <?php echo htmlspecialchars($dept->depart_name, ENT_QUOTES, 'UTF-8'); ?>
                </option>
              <?php endforeach; ?>
            </select>
          </div>

          <div class="col-lg-2 col-md-6 d-flex gap-2">
            <button type="submit" class="btn btn-primary flex-grow-1" style="background-color: #0284c7; border-color: #0284c7;">
              <i class="fa-solid fa-filter me-1"></i> Tìm kiếm
            </button>
            <?php if($selected_dept > 0 || $keyword !== ''): ?>
              <a href="<?php echo XC_URL; ?>/bac-si" class="btn btn-outline-secondary" title="Xem tất cả">
                <i class="fa-solid fa-rotate-left"></i>
              </a>
            <?php endif; ?>
          </div>
        </form>

        <!-- Chuyên khoa Filter Pills trên Desktop -->
        <div class="d-none d-md-flex flex-wrap gap-2 mt-3 pt-3 border-top align-items-center">
          <span class="small fw-bold text-muted me-2"><i class="fa-solid fa-hospital me-1"></i> Chuyên khoa:</span>
          <a href="<?php echo XC_URL; ?>/bac-si<?php echo $keyword !== '' ? '?q='.urlencode($keyword) : ''; ?>" 
             class="btn btn-sm <?php echo $selected_dept === 0 ? 'btn-primary' : 'btn-outline-secondary'; ?>" 
             style="<?php echo $selected_dept === 0 ? 'background-color:#0284c7; border-color:#0284c7;' : ''; ?> border-radius: 20px; font-size: 13px;">
            Tất cả
          </a>
          <?php foreach($departments as $dept): ?>
            <a href="<?php echo XC_URL; ?>/bac-si?khoa=<?php echo (int)$dept->id; ?><?php echo $keyword !== '' ? '&q='.urlencode($keyword) : ''; ?>" 
               class="btn btn-sm <?php echo $selected_dept === (int)$dept->id ? 'btn-primary' : 'btn-outline-secondary'; ?>" 
               style="<?php echo $selected_dept === (int)$dept->id ? 'background-color:#0284c7; border-color:#0284c7;' : ''; ?> border-radius: 20px; font-size: 13px;">
              <?php echo htmlspecialchars($dept->depart_name, ENT_QUOTES, 'UTF-8'); ?>
            </a>
          <?php endforeach; ?>
        </div>
      </div>
    </div>
  </section>

  <!-- ============================================================
       DOCTORS GRID SECTION
       ============================================================ -->
  <section class="doctors-grid-section py-2 mb-5">
    <div class="container">
      <?php if (!empty($doctors)): ?>
        <div class="row g-4">
          <?php foreach($doctors as $idx => $doc): 
            $hasAvatar = !empty($doc->avatar) && file_exists(__SITE_PATH . '/uploads/doctors/' . $doc->avatar);
            $avatarSrc = $hasAvatar 
              ? XC_URL . '/uploads/doctors/' . htmlspecialchars($doc->avatar, ENT_QUOTES, 'UTF-8')
              : XC_URL . '/template/frontend/assets/images/doctor-0' . (($idx % 3) + 1) . '.jpg';
          ?>
          <div class="col-lg-3 col-md-6 col-sm-6">
            <div class="card h-100 border-0 shadow-sm rounded-4 overflow-hidden position-relative doctor-card-hover" style="transition: transform 0.25s ease, box-shadow 0.25s ease;">
              
              <!-- Ảnh đại diện -->
              <div class="position-relative overflow-hidden" style="height: 280px; background-color: #f1f5f9;">
                <img 
                  src="<?php echo $avatarSrc; ?>" 
                  alt="<?php echo htmlspecialchars($doc->position . ' ' . $doc->fullname, ENT_QUOTES, 'UTF-8'); ?>"
                  class="w-100 h-100" 
                  style="object-fit: cover; object-position: top center;"
                  loading="lazy">
                
                <span class="badge position-absolute top-0 start-0 m-3 px-3 py-2 rounded-pill shadow-sm" style="background: rgba(2, 132, 199, 0.9); backdrop-filter: blur(4px); font-size: 12px; font-weight: 600;">
                  <?php echo htmlspecialchars($doc->position, ENT_QUOTES, 'UTF-8'); ?>
                </span>
              </div>

              <!-- Thông tin bác sĩ -->
              <div class="card-body p-3 d-flex flex-column justify-content-between">
                <div>
                  <h3 class="h5 fw-bold text-dark mb-1" style="font-size: 1.15rem;">
                    <?php echo htmlspecialchars($doc->fullname, ENT_QUOTES, 'UTF-8'); ?>
                  </h3>
                  
                  <div class="text-primary small fw-semibold mb-2" style="color: #0284c7 !important;">
                    <i class="fa-solid fa-stethoscope me-1"></i><?php echo htmlspecialchars($doc->depart_name ?: 'Bệnh viện Đắk Hà', ENT_QUOTES, 'UTF-8'); ?>
                  </div>

                  <?php if(!empty($doc->cchn)): ?>
                    <div class="small text-muted mb-2" style="font-size: 12px;">
                      <i class="fa-solid fa-certificate text-warning me-1"></i>CCHN: <span class="fw-medium text-dark"><?php echo htmlspecialchars($doc->cchn, ENT_QUOTES, 'UTF-8'); ?></span>
                    </div>
                  <?php endif; ?>
                </div>

                <div class="pt-2 border-top mt-2 d-flex align-items-center justify-content-between">
                  <span class="badge bg-success-subtle text-success border border-success-subtle rounded-pill px-2 py-1" style="font-size: 11px;">
                    <i class="fa-solid fa-circle-check me-1"></i>Đang công tác
                  </span>
                  <a href="<?php echo XC_URL; ?>/lien-he" class="btn btn-sm btn-outline-primary rounded-pill px-3" style="font-size: 12px; color: #0284c7; border-color: #0284c7;">
                    Đặt lịch khám
                  </a>
                </div>
              </div>

            </div>
          </div>
          <?php endforeach; ?>
        </div>
      <?php else: ?>
        <div class="text-center py-5 bg-white border rounded-4 shadow-sm my-4">
          <div class="mb-3 text-muted opacity-50">
            <i class="fa-solid fa-user-doctor fa-4x" style="color: #0284c7;"></i>
          </div>
          <h4 class="fw-bold text-dark mb-2">Không tìm thấy bác sĩ phù hợp</h4>
          <p class="text-muted small mb-4">Rất tiếc, hiện tại chưa có thông tin bác sĩ nào khớp với điều kiện tìm kiếm của bạn.</p>
          <a href="<?php echo XC_URL; ?>/bac-si" class="btn btn-primary rounded-pill px-4" style="background-color: #0284c7; border-color: #0284c7;">
            <i class="fa-solid fa-list me-1"></i> Xem tất cả danh sách bác sĩ
          </a>
        </div>
      <?php endif; ?>
    </div>
  </section>

</main>

<style>
.doctor-card-hover:hover {
  transform: translateY(-5px);
  box-shadow: 0 12px 24px rgba(0, 0, 0, 0.08) !important;
}
</style>

<?php require_once "footer.php"; ?>
