<?php require_once 'header.php'; ?>
<?php require_once 'menu.php'; ?>

<!-- ============================================================
     WORKSPACE DEDICATED STYLES (PURE CSS)
     ============================================================ -->
<style>
.workspace-page-wrapper {
  background-color: #f8fafc;
  min-height: 80vh;
  font-family: var(--font-primary, 'Be Vietnam Pro', sans-serif);
  color: #0f172a;
}

.workspace-hero {
  background: linear-gradient(135deg, #0369a1 0%, #0284c7 50%, #0d9488 100%);
  padding: 36px 0 30px;
  color: #ffffff;
  box-shadow: 0 4px 20px rgba(2, 132, 199, 0.15);
}

.workspace-hero-inner {
  display: flex;
  justify-content: space-between;
  align-items: center;
  flex-wrap: wrap;
  gap: 20px;
}

.workspace-badge-tag {
  display: inline-flex;
  align-items: center;
  gap: 6px;
  background: rgba(255, 255, 255, 0.2);
  color: #ffffff;
  font-weight: 600;
  padding: 4px 12px;
  border-radius: 20px;
  font-size: 12px;
  letter-spacing: 0.05em;
  backdrop-filter: blur(4px);
}

.workspace-user-badge {
  display: inline-flex;
  align-items: center;
  background: #10b981;
  color: #ffffff;
  font-weight: 600;
  padding: 4px 10px;
  border-radius: 20px;
  font-size: 12px;
}

.btn-create-req {
  background: #ffffff;
  color: #0369a1;
  font-weight: 700;
  font-size: 14.5px;
  padding: 12px 24px;
  border-radius: 30px;
  border: 2px solid #ffffff;
  box-shadow: 0 4px 14px rgba(0, 0, 0, 0.15);
  cursor: pointer;
  display: inline-flex;
  align-items: center;
  gap: 8px;
  transition: all 0.25s ease;
}

.btn-create-req:hover {
  background: #f8fafc;
  color: #0284c7;
  transform: translateY(-2px);
  box-shadow: 0 6px 20px rgba(0, 0, 0, 0.2);
}

.workspace-main {
  padding: 35px 0 60px;
}

.workspace-layout {
  display: flex;
  gap: 25px;
  align-items: flex-start;
}

.workspace-sidebar {
  width: 280px;
  flex-shrink: 0;
}

.workspace-content {
  flex: 1;
  min-width: 0;
}

/* Sidebar Styling */
.sidebar-card {
  background: #ffffff;
  border-radius: 16px;
  border: 1px solid #e2e8f0;
  box-shadow: 0 4px 16px rgba(15, 23, 42, 0.05);
  overflow: hidden;
}

.sidebar-card-header {
  background: linear-gradient(135deg, #0284c7 0%, #0369a1 100%);
  color: #ffffff;
  padding: 16px 20px;
  font-weight: 700;
  font-size: 15px;
  display: flex;
  align-items: center;
  gap: 10px;
}

.sidebar-menu-list {
  padding: 10px;
  display: flex;
  flex-direction: column;
  gap: 4px;
}

.sidebar-menu-item {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 11px 14px;
  border-radius: 10px;
  font-size: 14px;
  font-weight: 600;
  color: #334155;
  text-decoration: none;
  transition: all 0.2s ease;
}

.sidebar-menu-item:hover {
  background: #f1f5f9;
  color: #0284c7;
}

.sidebar-menu-item.active {
  background: rgba(2, 132, 199, 0.1);
  color: #0284c7;
  font-weight: 700;
}

.sidebar-count-badge {
  font-size: 11.5px;
  font-weight: 700;
  padding: 3px 9px;
  border-radius: 20px;
  color: #ffffff;
}

.sidebar-count-badge.bg-info { background: #0284c7; }
.sidebar-count-badge.bg-success { background: #10b981; }
.sidebar-count-badge.bg-warning { background: #f59e0b; color: #ffffff; }
.sidebar-count-badge.bg-danger { background: #ef4444; }

.sidebar-footer-btn {
  padding: 16px;
  border-top: 1px solid #f1f5f9;
  background: #f8fafc;
}

.btn-sidebar-new {
  width: 100%;
  background: #0284c7;
  color: #ffffff;
  border: none;
  font-weight: 700;
  font-size: 14px;
  padding: 10px 16px;
  border-radius: 30px;
  cursor: pointer;
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 8px;
  transition: all 0.2s ease;
}

.btn-sidebar-new:hover {
  background: #0369a1;
}

/* KPI Cards Grid */
.kpi-summary-grid {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 16px;
  margin-bottom: 24px;
}

.kpi-card-item {
  background: #ffffff;
  border-radius: 14px;
  border: 1px solid #e2e8f0;
  box-shadow: 0 4px 14px rgba(15, 23, 42, 0.05);
  padding: 18px 20px;
  display: flex;
  align-items: center;
  justify-content: space-between;
  transition: transform 0.2s ease;
}

.kpi-card-item:hover {
  transform: translateY(-2px);
}

.kpi-card-item.kpi-completed { border-left: 4px solid #10b981; }
.kpi-card-item.kpi-processing { border-left: 4px solid #0284c7; }
.kpi-card-item.kpi-draft { border-left: 4px solid #f59e0b; }
.kpi-card-item.kpi-rejected { border-left: 4px solid #ef4444; }

.kpi-text-label {
  font-size: 11.5px;
  font-weight: 700;
  text-transform: uppercase;
  color: #64748b;
  letter-spacing: 0.03em;
}

.kpi-text-number {
  font-size: 26px;
  font-weight: 800;
  margin-top: 4px;
  line-height: 1.1;
}

.kpi-icon-wrapper {
  width: 46px;
  height: 46px;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 20px;
  flex-shrink: 0;
}

.kpi-icon-wrapper.icon-success { background: rgba(16, 185, 129, 0.12); color: #10b981; }
.kpi-icon-wrapper.icon-primary { background: rgba(2, 132, 199, 0.12); color: #0284c7; }
.kpi-icon-wrapper.icon-warning { background: rgba(245, 158, 11, 0.12); color: #f59e0b; }
.kpi-icon-wrapper.icon-danger { background: rgba(239, 68, 68, 0.12); color: #ef4444; }

/* Main Data Card & Table */
.data-table-card {
  background: #ffffff;
  border-radius: 16px;
  border: 1px solid #e2e8f0;
  box-shadow: 0 4px 16px rgba(15, 23, 42, 0.05);
  overflow: hidden;
}

.data-table-header {
  padding: 18px 24px;
  border-bottom: 1px solid #e2e8f0;
  display: flex;
  align-items: center;
  justify-content: space-between;
  flex-wrap: wrap;
  gap: 16px;
}

.data-table-title {
  font-size: 17px;
  font-weight: 700;
  color: #0284c7;
  margin: 0;
  display: flex;
  align-items: center;
  gap: 10px;
}

.search-form-box {
  display: flex;
  align-items: center;
  gap: 8px;
  max-width: 380px;
  width: 100%;
}

.search-form-input {
  flex: 1;
  padding: 8px 14px;
  border: 1.5px solid #cbd5e1;
  border-radius: 8px;
  font-size: 13.5px;
  outline: none;
  background: #ffffff;
}

.search-form-input:focus {
  border-color: #0284c7;
  box-shadow: 0 0 0 3px rgba(2, 132, 199, 0.15);
}

.search-form-btn {
  background: #0284c7;
  color: #ffffff;
  border: none;
  padding: 8px 16px;
  border-radius: 8px;
  cursor: pointer;
  transition: background 0.2s ease;
}

.search-form-btn:hover { background: #0369a1; }

.table-responsive-wrapper {
  width: 100%;
  overflow-x: auto;
}

.req-data-table {
  width: 100%;
  border-collapse: collapse;
  text-align: left;
}

.req-data-table th {
  background: #f8fafc;
  color: #334155;
  font-weight: 700;
  font-size: 13px;
  padding: 14px 18px;
  border-bottom: 1.5px solid #e2e8f0;
  white-space: nowrap;
}

.req-data-table td {
  padding: 14px 18px;
  border-bottom: 1px solid #f1f5f9;
  font-size: 14px;
  color: #1e293b;
  vertical-align: middle;
}

.req-data-table tbody tr:hover {
  background: #f8fafc;
}

.status-tag {
  display: inline-flex;
  align-items: center;
  gap: 6px;
  padding: 4px 12px;
  border-radius: 20px;
  font-size: 12px;
  font-weight: 600;
  white-space: nowrap;
}

.status-tag.completed { background: rgba(16, 185, 129, 0.12); color: #047857; }
.status-tag.processing { background: rgba(2, 132, 199, 0.12); color: #0369a1; }
.status-tag.sent { background: rgba(14, 165, 233, 0.12); color: #0284c7; }
.status-tag.draft { background: rgba(245, 158, 11, 0.15); color: #b45309; }
.status-tag.rejected { background: rgba(239, 68, 68, 0.12); color: #b91c1c; }

.service-badge {
  display: inline-block;
  padding: 2px 8px;
  border-radius: 6px;
  font-size: 11.5px;
  font-weight: 600;
  background: #e0f2fe;
  color: #0369a1;
}

.priority-badge-urgent { background: #fee2e2; color: #dc2626; font-size: 11px; font-weight: 700; padding: 2px 8px; border-radius: 6px; }
.priority-badge-high { background: #fef3c7; color: #d97706; font-size: 11px; font-weight: 700; padding: 2px 8px; border-radius: 6px; }

.btn-detail-view {
  background: rgba(2, 132, 199, 0.1);
  color: #0284c7;
  border: none;
  width: 36px;
  height: 36px;
  border-radius: 8px;
  display: inline-flex;
  align-items: center;
  justify-content: center;
  cursor: pointer;
  transition: all 0.2s ease;
}

.btn-detail-view:hover {
  background: #0284c7;
  color: #ffffff;
}

/* Modal Fallback Overlay Styles */
.ws-custom-modal {
  position: fixed;
  top: 0; left: 0; width: 100vw; height: 100vh;
  background: rgba(15, 23, 42, 0.65);
  backdrop-filter: blur(6px);
  z-index: 9999;
  display: none;
  align-items: center;
  justify-content: center;
  padding: 16px;
  overflow-y: auto;
}

.ws-custom-modal.show {
  display: flex !important;
  animation: wsModalFadeIn 0.2s ease forwards;
}

@keyframes wsModalFadeIn {
  from { opacity: 0; }
  to   { opacity: 1; }
}

.ws-modal-container {
  width: 100%;
  max-width: 720px;
  background: #ffffff;
  border-radius: 20px;
  box-shadow: 0 20px 50px rgba(0,0,0,0.2);
  overflow: hidden;
  margin: auto;
}

.ws-modal-topbar {
  background: linear-gradient(135deg, #0369a1 0%, #0284c7 100%);
  color: #ffffff;
  padding: 20px 24px;
  display: flex;
  align-items: center;
  justify-content: space-between;
}

.ws-modal-topbar-title {
  margin: 0;
  font-size: 18px;
  font-weight: 700;
  color: #ffffff;
  display: flex;
  align-items: center;
  gap: 10px;
}

.ws-modal-topbar-close {
  background: rgba(255, 255, 255, 0.2);
  border: none;
  color: #ffffff;
  width: 32px;
  height: 32px;
  border-radius: 50%;
  cursor: pointer;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 16px;
}

.ws-modal-topbar-close:hover { background: rgba(255, 255, 255, 0.35); }

.ws-modal-content-body {
  padding: 24px;
}

.ws-modal-action-footer {
  padding: 16px 24px;
  background: #f8fafc;
  border-top: 1px solid #e2e8f0;
  display: flex;
  align-items: center;
  justify-content: flex-end;
  gap: 12px;
}

.ws-grid-2col {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  gap: 16px;
  margin-bottom: 16px;
}

.ws-form-field {
  margin-bottom: 16px;
}

.ws-field-label {
  display: block;
  font-size: 13.5px;
  font-weight: 700;
  color: #1e293b;
  margin-bottom: 6px;
}

.ws-field-control {
  width: 100%;
  padding: 10px 14px;
  border: 1.5px solid #cbd5e1;
  border-radius: 10px;
  font-size: 14px;
  outline: none;
  font-family: inherit;
  background: #ffffff;
}

.ws-field-control:focus {
  border-color: #0284c7;
  box-shadow: 0 0 0 3px rgba(2, 132, 199, 0.15);
}

.btn-ws-cancel {
  background: #e2e8f0;
  color: #475569;
  border: none;
  font-weight: 600;
  padding: 10px 20px;
  border-radius: 10px;
  cursor: pointer;
}

.btn-ws-draft {
  background: #fef3c7;
  color: #b45309;
  border: 1px solid #fde68a;
  font-weight: 700;
  padding: 10px 20px;
  border-radius: 10px;
  cursor: pointer;
}

.btn-ws-submit {
  background: #0284c7;
  color: #ffffff;
  border: none;
  font-weight: 700;
  padding: 10px 24px;
  border-radius: 10px;
  cursor: pointer;
}
.btn-ws-submit:hover { background: #0369a1; }

/* Responsive Grid Adjustments */
@media (max-width: 1024px) {
  .kpi-summary-grid { grid-template-columns: repeat(2, 1fr); }
  .workspace-layout { flex-direction: column; }
  .workspace-sidebar { width: 100%; }
}

@media (max-width: 640px) {
  .kpi-summary-grid { grid-template-columns: 1fr; }
  .ws-grid-2col { grid-template-columns: 1fr; }
  .workspace-hero-inner { flex-direction: column; align-items: flex-start; }
}
</style>

<div class="workspace-page-wrapper">
  <!-- ============================================================
       HERO BANNER - KHÔNG GIAN LÀM VIỆC SỐ
       ============================================================ -->
  <section class="workspace-hero">
    <div class="container">
      <div class="workspace-hero-inner">
        <div>
          <div style="display: flex; align-items: center; gap: 8px; margin-bottom: 8px;">
            <span class="workspace-badge-tag">
              <i class="fa-solid fa-laptop-medical"></i> KHÔNG GIAN LÀM VIỆC SỐ
            </span>
            <span class="workspace-user-badge">NVYT Workspace</span>
          </div>
          <h1 style="font-size: clamp(1.6rem, 3vw, 2.2rem); font-weight: 800; margin: 0 0 8px; line-height: 1.25;">
            Hệ thống Quản lý Yêu cầu & Hỗ trợ Kỹ thuật
          </h1>
          <p style="margin: 0; opacity: 0.9; font-size: 15px;">
            Xin chào, <strong><?php echo htmlspecialchars($_SESSION['user']['full_name']); ?></strong> (Cán bộ / Nhân viên Y tế)
          </p>
        </div>

        <!-- Top Right "Tạo Yêu Cầu" Button -->
        <div>
          <button type="button" class="btn-create-req" onclick="openCreateRequestModal()">
            <i class="fa-solid fa-circle-plus" style="font-size: 18px; color: #0284c7;"></i>
            <span>Tạo Yêu Cầu Mới</span>
          </button>
        </div>
      </div>
    </div>
  </section>

  <!-- ============================================================
       MAIN WORKSPACE BODY
       ============================================================ -->
  <main class="workspace-main">
    <div class="container">
      <div class="workspace-layout">

        <!-- LEFT SIDEBAR MENU: Quản lý yêu cầu -->
        <aside class="workspace-sidebar">
          <div class="sidebar-card">
            <div class="sidebar-card-header">
              <i class="fa-solid fa-sliders"></i>
              <span>Quản lý Yêu cầu</span>
            </div>

            <div class="sidebar-menu-list">
              <a href="<?php echo XC_URL; ?>/khong-gian-lam-viec-so" class="sidebar-menu-item <?php echo empty($status_filter) ? 'active' : ''; ?>">
                <span><i class="fa-solid fa-chart-pie me-2"></i>Trang chủ Dashboard</span>
              </a>
              <a href="<?php echo XC_URL; ?>/khong-gian-lam-viec-so?status=processing" class="sidebar-menu-item <?php echo ($status_filter=='processing') ? 'active' : ''; ?>">
                <span><i class="fa-solid fa-spinner me-2 text-info"></i>Đang & Chưa xử lý</span>
                <span class="sidebar-count-badge bg-info"><?php echo (int)$stats->total_processing; ?></span>
              </a>
              <a href="<?php echo XC_URL; ?>/khong-gian-lam-viec-so?status=completed" class="sidebar-menu-item <?php echo ($status_filter=='completed') ? 'active' : ''; ?>">
                <span><i class="fa-solid fa-circle-check me-2 text-success"></i>Đã xử lý xong</span>
                <span class="sidebar-count-badge bg-success"><?php echo (int)$stats->total_completed; ?></span>
              </a>
              <a href="<?php echo XC_URL; ?>/khong-gian-lam-viec-so?status=draft" class="sidebar-menu-item <?php echo ($status_filter=='draft') ? 'active' : ''; ?>">
                <span><i class="fa-solid fa-file-pen me-2 text-warning"></i>Bản nháp (Chờ gửi)</span>
                <span class="sidebar-count-badge bg-warning"><?php echo (int)$stats->total_draft; ?></span>
              </a>
              <a href="<?php echo XC_URL; ?>/khong-gian-lam-viec-so?status=rejected" class="sidebar-menu-item <?php echo ($status_filter=='rejected') ? 'active' : ''; ?>">
                <span><i class="fa-solid fa-circle-xmark me-2 text-danger"></i>Từ chối xử lý</span>
                <span class="sidebar-count-badge bg-danger"><?php echo (int)$stats->total_rejected; ?></span>
              </a>
            </div>

            <div class="sidebar-footer-btn">
              <button type="button" class="btn-sidebar-new" onclick="openCreateRequestModal()">
                <i class="fa-solid fa-plus"></i> Tạo yêu cầu mới
              </button>
            </div>
          </div>
        </aside>

        <!-- RIGHT CONTENT AREA -->
        <div class="workspace-content">
          
          <!-- KPI STATS CARDS -->
          <div class="kpi-summary-grid">
            <!-- Card Completed -->
            <div class="kpi-card-item kpi-completed">
              <div>
                <div class="kpi-text-label">Yêu cầu đã xử lý</div>
                <div class="kpi-text-number" style="color: #10b981;"><?php echo (int)$stats->total_completed; ?></div>
              </div>
              <div class="kpi-icon-wrapper icon-success">
                <i class="fa-solid fa-check-double"></i>
              </div>
            </div>

            <!-- Card Processing -->
            <div class="kpi-card-item kpi-processing">
              <div>
                <div class="kpi-text-label">Đang & Chưa xử lý</div>
                <div class="kpi-text-number" style="color: #0284c7;"><?php echo (int)$stats->total_processing; ?></div>
              </div>
              <div class="kpi-icon-wrapper icon-primary">
                <i class="fa-solid fa-clock-rotate-left"></i>
              </div>
            </div>

            <!-- Card Draft -->
            <div class="kpi-card-item kpi-draft">
              <div>
                <div class="kpi-text-label">Chưa gửi / Bản nháp</div>
                <div class="kpi-text-number" style="color: #f59e0b;"><?php echo (int)$stats->total_draft; ?></div>
              </div>
              <div class="kpi-icon-wrapper icon-warning">
                <i class="fa-solid fa-file-lines"></i>
              </div>
            </div>

            <!-- Card Rejected -->
            <div class="kpi-card-item kpi-rejected">
              <div>
                <div class="kpi-text-label">Từ chối xử lý</div>
                <div class="kpi-text-number" style="color: #ef4444;"><?php echo (int)$stats->total_rejected; ?></div>
              </div>
              <div class="kpi-icon-wrapper icon-danger">
                <i class="fa-solid fa-circle-xmark"></i>
              </div>
            </div>
          </div>

          <!-- REQUESTS LIST TABLE CARD -->
          <div class="data-table-card">
            <div class="data-table-header">
              <h5 class="data-table-title">
                <i class="fa-solid fa-list-check"></i> Danh Sách Yêu Cầu Hỗ Trợ
              </h5>
              
              <form method="GET" action="<?php echo XC_URL; ?>/khong-gian-lam-viec-so" class="search-form-box">
                <input type="hidden" name="status" value="<?php echo htmlspecialchars($status_filter); ?>">
                <input type="text" name="q" class="search-form-input" placeholder="Tìm theo mã, tiêu đề, phòng..." value="<?php echo htmlspecialchars($search_q); ?>">
                <button type="submit" class="search-form-btn"><i class="fa-solid fa-magnifying-glass"></i></button>
              </form>
            </div>

            <div class="table-responsive-wrapper">
              <table class="req-data-table">
                <thead>
                  <tr>
                    <th width="130" style="padding-left: 20px;">Mã YC</th>
                    <th width="130">Ngày tạo</th>
                    <th>Nội dung ngắn / Tiêu đề</th>
                    <th>Người tạo & Khoa phòng</th>
                    <th style="text-align: center;" width="140">Trạng thái</th>
                    <th style="text-align: center;" width="100">Chi tiết</th>
                  </tr>
                </thead>
                <tbody>
                  <?php if(!empty($requests)): foreach($requests as $req): ?>
                    <tr>
                      <td style="padding-left: 20px; font-weight: 700; font-family: monospace; color: #0284c7;">
                        <?php echo htmlspecialchars($req->request_code); ?>
                      </td>
                      <td style="color: #64748b; font-size: 13px;">
                        <?php echo date('H:i d/m/Y', strtotime($req->created_at)); ?>
                      </td>
                      <td>
                        <strong style="display: block; color: #0f172a; margin-bottom: 4px;"><?php echo htmlspecialchars($req->title); ?></strong>
                        <div style="display: flex; gap: 6px; align-items: center;">
                          <span class="service-badge"><?php echo htmlspecialchars($req->service_type); ?></span>
                          <?php if($req->priority==='Urgent'): ?>
                            <span class="priority-badge-urgent">Khẩn cấp</span>
                          <?php elseif($req->priority==='High'): ?>
                            <span class="priority-badge-high">Ưu tiên cao</span>
                          <?php endif; ?>
                        </div>
                      </td>
                      <td>
                        <div style="font-weight: 700; color: #0f172a;"><?php echo htmlspecialchars($req->user_name); ?></div>
                        <div style="font-size: 12.5px; color: #64748b;"><?php echo !empty($req->department) ? htmlspecialchars($req->department) : 'Bệnh viện Đắk Hà'; ?></div>
                      </td>
                      <td style="text-align: center;">
                        <?php if($req->status === 'completed'): ?>
                          <span class="status-tag completed"><i class="fa-solid fa-circle-check"></i> Đã xử lý</span>
                        <?php elseif($req->status === 'processing'): ?>
                          <span class="status-tag processing"><i class="fa-solid fa-spinner"></i> Đang xử lý</span>
                        <?php elseif($req->status === 'sent'): ?>
                          <span class="status-tag sent"><i class="fa-solid fa-paper-plane"></i> Đã gửi</span>
                        <?php elseif($req->status === 'draft'): ?>
                          <span class="status-tag draft"><i class="fa-solid fa-file-pen"></i> Chưa gửi</span>
                        <?php else: ?>
                          <span class="status-tag rejected"><i class="fa-solid fa-circle-xmark"></i> Từ chối</span>
                        <?php endif; ?>
                      </td>
                      <td style="text-align: center;">
                        <button type="button" class="btn-detail-view" onclick="viewRequestDetail(<?php echo htmlspecialchars(json_encode($req)); ?>)" title="Xem chi tiết">
                          <i class="fa-solid fa-eye"></i>
                        </button>
                      </td>
                    </tr>
                  <?php endforeach; else: ?>
                    <tr>
                      <td colspan="6" style="text-align: center; padding: 40px; color: #64748b;">
                        <i class="fa-solid fa-inbox" style="font-size: 40px; color: #cbd5e1; margin-bottom: 10px; display: block;"></i>
                        <p style="margin: 0;">Chưa có yêu cầu nào trong hệ thống.</p>
                      </td>
                    </tr>
                  <?php endif; ?>
                </tbody>
              </table>
            </div>
          </div>

        </div>
      </div>
    </div>
  </main>
</div>

<!-- ============================================================
     MODAL TẠO YÊU CẦU MỚI
     ============================================================ -->
<div class="ws-custom-modal" id="modalCreateRequest" tabindex="-1" aria-hidden="true">
  <div class="ws-modal-container">
    <form id="formCreateRequest" enctype="multipart/form-data">
      <div class="ws-modal-topbar">
        <h5 class="ws-modal-topbar-title">
          <i class="fa-solid fa-paper-plane"></i> Tạo Yêu Cầu Hỗ Trợ Mới (Kỹ thuật / Y tế)
        </h5>
        <button type="button" class="ws-modal-topbar-close" onclick="closeCreateRequestModal()" aria-label="Đóng">
          <i class="fa-solid fa-xmark"></i>
        </button>
      </div>
      
      <div class="ws-modal-content-body">
        <div class="ws-grid-2col">
          <div class="ws-form-field">
            <label class="ws-field-label">Họ và tên người yêu cầu <span style="color: #ef4444;">*</span></label>
            <input type="text" name="user_name" class="ws-field-control" value="<?php echo htmlspecialchars($_SESSION['user']['full_name']); ?>" required>
          </div>
          <div class="ws-form-field">
            <label class="ws-field-label">Khoa / Phòng ban <span style="color: #ef4444;">*</span></label>
            <input type="text" name="department" class="ws-field-control" placeholder="Ví dụ: Khoa Khám bệnh, Phòng Kế hoạch..." required>
          </div>
        </div>

        <div class="ws-grid-2col">
          <div class="ws-form-field">
            <label class="ws-field-label">Loại dịch vụ / Hỗ trợ <span style="color: #ef4444;">*</span></label>
            <select name="service_type" class="ws-field-control" required>
              <option value="Phần mềm Y tế (HIS/LIS)">Phần mềm Y tế (HIS, LIS, Bệnh án điện tử)</option>
              <option value="Phần cứng & Máy tính">Phần cứng (Máy tính, Máy in, Máy quét barcode)</option>
              <option value="Mạng & Internet">Mạng Internet & Truyền số liệu Y tế</option>
              <option value="Thiết bị Y tế / Điện tử">Thiết bị Y tế / Điện tử chuyên dụng</option>
              <option value="Khác">Yêu cầu hỗ trợ kỹ thuật khác</option>
            </select>
          </div>
          <div class="ws-form-field">
            <label class="ws-field-label">Mức độ ưu tiên</label>
            <select name="priority" class="ws-field-control">
              <option value="Normal" selected>Bình thường</option>
              <option value="Low">Thấp</option>
              <option value="High">Cao (Ảnh hưởng công việc)</option>
              <option value="Urgent">Khẩn cấp (Ảnh hưởng đến hoạt động KCB)</option>
            </select>
          </div>
        </div>

        <div class="ws-form-field">
          <label class="ws-field-label">Tiêu đề / Nội dung ngắn <span style="color: #ef4444;">*</span></label>
          <input type="text" name="title" class="ws-field-control" placeholder="Nhập tóm tắt sự cố hoặc yêu cầu cần hỗ trợ..." required>
        </div>

        <div class="ws-form-field">
          <label class="ws-field-label">Mô tả chi tiết nội dung sự cố / yêu cầu</label>
          <textarea name="content" class="ws-field-control" rows="4" placeholder="Mô tả hiện tượng sự cố, thông báo lỗi hoặc các nội dung chi tiết..."></textarea>
        </div>

        <div class="ws-form-field">
          <label class="ws-field-label">Tệp đính kèm (Ảnh chụp màn hình lỗi, tài liệu)</label>
          <input type="file" name="attachment" class="ws-field-control" accept="image/*,.pdf,.doc,.docx,.zip">
        </div>
      </div>

      <div class="ws-modal-action-footer">
        <input type="hidden" name="action_status" id="action_status" value="sent">
        <button type="button" class="btn-ws-cancel" onclick="closeCreateRequestModal()">Hủy</button>
        <button type="button" onclick="submitRequestForm('draft')" class="btn-ws-draft">
          <i class="fa-solid fa-file-pen"></i> Lưu nháp (Chờ gửi)
        </button>
        <button type="button" onclick="submitRequestForm('sent')" class="btn-ws-submit">
          <i class="fa-solid fa-paper-plane"></i> Gửi Yêu Cầu Ngay
        </button>
      </div>
    </form>
  </div>
</div>

<!-- ============================================================
     MODAL XEM CHI TIẾT YÊU CẦU
     ============================================================ -->
<div class="ws-custom-modal" id="modalViewDetail" tabindex="-1" aria-hidden="true">
  <div class="ws-modal-container">
    <div class="ws-modal-topbar">
      <h5 class="ws-modal-topbar-title" id="md_code">Chi tiết yêu cầu</h5>
      <button type="button" class="ws-modal-topbar-close" onclick="closeViewDetailModal()" aria-label="Đóng">
        <i class="fa-solid fa-xmark"></i>
      </button>
    </div>
    <div class="ws-modal-content-body">
      <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 16px;">
        <h4 style="font-weight: 800; color: #0f172a; margin: 0; font-size: 20px;" id="md_title"></h4>
        <span id="md_status_badge"></span>
      </div>
      <div class="ws-grid-2col" style="background: #f8fafc; padding: 14px; border-radius: 12px; font-size: 13.5px; border: 1px solid #e2e8f0;">
        <div><strong>Người tạo:</strong> <span id="md_user"></span></div>
        <div><strong>Khoa/Phòng:</strong> <span id="md_dept"></span></div>
        <div><strong>Loại dịch vụ:</strong> <span id="md_type"></span></div>
        <div><strong>Ngày tạo:</strong> <span id="md_date"></span></div>
      </div>
      <div class="ws-form-field" style="margin-top: 16px;">
        <h6 style="font-weight: 700; color: #0284c7; margin-bottom: 8px;">Nội dung chi tiết yêu cầu:</h6>
        <div style="padding: 14px; border: 1px solid #e2e8f0; border-radius: 10px; background: #ffffff; white-space: pre-line; font-size: 14px;" id="md_content"></div>
      </div>

      <!-- RESOLUTION NOTE FROM ADMIN -->
      <div style="margin-top: 16px; padding: 14px; border-radius: 12px; background: #f0fdf4; border: 1px solid #bbf7d0;">
        <h6 style="font-weight: 700; color: #047857; margin: 0 0 8px;"><i class="fa-solid fa-user-check me-2"></i>Mô tả nội dung đã xử lý (Bộ phận Kỹ thuật / Admin):</h6>
        <div id="md_resolution_note" style="font-style: italic; color: #1e293b; font-size: 13.5px;">Chưa có thông tin xử lý từ Admin/Kỹ thuật viên.</div>
      </div>
    </div>
    <div class="ws-modal-action-footer">
      <button type="button" class="btn-ws-cancel" onclick="closeViewDetailModal()">Đóng</button>
    </div>
  </div>
</div>

<script>
function openCreateRequestModal() {
  var modalEl = document.getElementById('modalCreateRequest');
  if (modalEl) {
    if (window.$ && $.fn && $.fn.modal) {
      $('#modalCreateRequest').modal('show');
    } else {
      modalEl.classList.add('show');
      document.body.style.overflow = 'hidden';
    }
  }
}

function closeCreateRequestModal() {
  var modalEl = document.getElementById('modalCreateRequest');
  if (modalEl) {
    if (window.$ && $.fn && $.fn.modal) {
      $('#modalCreateRequest').modal('hide');
    }
    modalEl.classList.remove('show');
    document.body.style.overflow = '';
  }
}

function closeViewDetailModal() {
  var modalEl = document.getElementById('modalViewDetail');
  if (modalEl) {
    if (window.$ && $.fn && $.fn.modal) {
      $('#modalViewDetail').modal('hide');
    }
    modalEl.classList.remove('show');
    document.body.style.overflow = '';
  }
}

function submitRequestForm(statusType) {
  var actionStatus = document.getElementById('action_status');
  if (actionStatus) actionStatus.value = statusType;
  var form = document.getElementById('formCreateRequest');
  var formData = new FormData(form);

  if (window.$ && $.ajax) {
    $.ajax({
      url: '<?php echo XC_URL; ?>/api/submitrequest',
      type: 'POST',
      data: formData,
      contentType: false,
      processData: false,
      dataType: 'json',
      success: function(res) {
        if(res.status == 200) {
          if (window.Swal) {
            Swal.fire('Thành công', res.message, 'success').then(() => { location.reload(); });
          } else {
            alert('Thành công: ' + res.message);
            location.reload();
          }
        } else {
          if (window.Swal) Swal.fire('Lỗi', res.message, 'error');
          else alert('Lỗi: ' + res.message);
        }
      },
      error: function() {
        if (window.Swal) Swal.fire('Lỗi', 'Không thể kết nối đến máy chủ', 'error');
        else alert('Không thể kết nối đến máy chủ');
      }
    });
  } else {
    fetch('<?php echo XC_URL; ?>/api/submitrequest', {
      method: 'POST',
      body: formData
    })
    .then(r => r.json())
    .then(res => {
      if (res.status == 200) {
        alert('Thành công: ' + res.message);
        location.reload();
      } else {
        alert('Lỗi: ' + res.message);
      }
    })
    .catch(() => alert('Không thể kết nối đến máy chủ'));
  }
}

function viewRequestDetail(req) {
  document.getElementById('md_code').innerText = 'Chi tiết yêu cầu: ' + (req.request_code || '');
  document.getElementById('md_title').innerText = req.title || '';
  document.getElementById('md_user').innerText = req.user_name || '';
  document.getElementById('md_dept').innerText = req.department || 'Phòng ban chung';
  document.getElementById('md_type').innerText = req.service_type || '';
  document.getElementById('md_date').innerText = req.created_at || '';
  document.getElementById('md_content').innerText = req.content || 'Không có mô tả thêm';
  document.getElementById('md_resolution_note').innerText = req.resolution_note || 'Chưa có thông tin xử lý từ Admin / Bộ phận Kỹ thuật.';

  var stHTML = '';
  if(req.status === 'completed') stHTML = '<span class="status-tag completed"><i class="fa-solid fa-circle-check"></i> Đã xử lý</span>';
  else if(req.status === 'processing') stHTML = '<span class="status-tag processing"><i class="fa-solid fa-spinner"></i> Đang xử lý</span>';
  else if(req.status === 'sent') stHTML = '<span class="status-tag sent"><i class="fa-solid fa-paper-plane"></i> Đã gửi</span>';
  else if(req.status === 'draft') stHTML = '<span class="status-tag draft"><i class="fa-solid fa-file-pen"></i> Chưa gửi</span>';
  else stHTML = '<span class="status-tag rejected"><i class="fa-solid fa-circle-xmark"></i> Từ chối</span>';

  document.getElementById('md_status_badge').innerHTML = stHTML;

  var modalEl = document.getElementById('modalViewDetail');
  if (modalEl) {
    if (window.$ && $.fn && $.fn.modal) {
      $('#modalViewDetail').modal('show');
    } else {
      modalEl.classList.add('show');
      document.body.style.overflow = 'hidden';
    }
  }
}

document.addEventListener('click', function(e) {
  var m1 = document.getElementById('modalCreateRequest');
  var m2 = document.getElementById('modalViewDetail');
  if (m1 && m1.classList.contains('show') && e.target === m1) closeCreateRequestModal();
  if (m2 && m2.classList.contains('show') && e.target === m2) closeViewDetailModal();
});
</script>

<?php require_once 'footer.php'; ?>
