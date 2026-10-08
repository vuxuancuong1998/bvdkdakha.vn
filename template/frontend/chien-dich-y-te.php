<?php require_once 'header.php';$campaignRows=is_array($medical_campaigns??null)?$medical_campaigns:array();function campaignFrontH($v){return htmlspecialchars((string)$v,ENT_QUOTES,'UTF-8');}function campaignFrontDate($v){return $v&&strtotime($v)?date('d/m/Y',strtotime($v)):'';}?>
<style>
  /* Root reset & scope */
  #campaigns-component {
    font-family: var(--font-primary);
    color: #1e293b;
    background-color: #f8fafc;
    padding: 24px 16px;
    box-sizing: border-box;
    width: min(1280px, calc(100% - 30px));
    max-width: 1280px;
    margin: 24px auto 40px;
  }
  #campaigns-component * {
    box-sizing: border-box;
  }
  @media (max-width: 767px) {
    #campaigns-component {
      width: calc(100% - 20px);
      margin-top: 16px;
      margin-bottom: 28px;
      padding: 18px 10px;
    }
  }

  /* Header Section */
  .cp-header {
    margin-bottom: 24px;
  }
  .cp-title {
    font-size: 22px;
    font-weight: 700;
    color: #0f172a;
    text-transform: uppercase;
    letter-spacing: 0.5px;
    margin: 0 0 6px 0;
    display: flex;
    align-items: center;
    gap: 10px;
  }
  .cp-title::before {
    content: "";
    display: inline-block;
    width: 5px;
    height: 24px;
    background-color: #1760a5;
    border-radius: 3px;
  }
  .cp-subtitle {
    font-size: 14px;
    color: #64748b;
    margin: 0;
  }

  /* Filter & Search Bar */
  .cp-filter-bar {
    display: flex;
    flex-wrap: wrap;
    align-items: center;
    justify-content: space-between;
    gap: 12px;
    background: #ffffff;
    padding: 14px 16px;
    border-radius: 8px;
    border: 1px solid #e2e8f0;
    margin-bottom: 24px;
    box-shadow: 0 1px 3px rgba(0,0,0,0.04);
  }
  .cp-tabs {
    display: flex;
    gap: 8px;
    flex-wrap: wrap;
  }
  .cp-tab-btn {
    padding: 7px 16px;
    font-size: 13px;
    font-weight: 600;
    border-radius: 6px;
    border: 1px solid #cbd5e1;
    background: #ffffff;
    color: #475569;
    cursor: pointer;
    transition: all 0.2s ease;
  }
  .cp-tab-btn:hover {
    background: #f1f5f9;
    color: #0f172a;
  }
  .cp-tab-btn.active {
    background: #1760a5;
    color: #ffffff;
    border-color: #1760a5;
  }

  .cp-search-box {
    display: flex;
    align-items: center;
    gap: 8px;
    min-width: 280px;
  }
  .cp-input {
    width: 100%;
    padding: 8px 12px;
    font-size: 13px;
    border: 1px solid #cbd5e1;
    border-radius: 6px;
    outline: none;
    transition: border-color 0.2s;
  }
  .cp-input:focus {
    border-color: #1760a5;
    box-shadow: 0 0 0 3px rgba(23, 96, 165, 0.15);
  }

  /* Grid Layout for Boxes */
  .cp-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(320px, 1fr));
    gap: 20px;
  }

  /* Campaign Box / Card */
  .cp-card {
    background: #ffffff;
    border: 1px solid #e2e8f0;
    border-radius: 10px;
    overflow: hidden;
    display: flex;
    flex-direction: column;
    box-shadow: 0 2px 4px rgba(0,0,0,0.03);
    transition: transform 0.2s, box-shadow 0.2s;
  }
  .cp-card:hover {
    transform: translateY(-3px);
    box-shadow: 0 8px 16px rgba(0,0,0,0.08);
  }

  .cp-card-img-wrap {
    position: relative;
    width: 100%;
    height: 180px;
    background-color: #e2e8f0;
    overflow: hidden;
  }
  .cp-card-img {
    width: 100%;
    height: 100%;
    object-fit: cover;
  }

  /* Badge / Label */
  .cp-badge {
    position: absolute;
    top: 12px;
    left: 12px;
    padding: 4px 10px;
    border-radius: 4px;
    font-size: 11px;
    font-weight: 700;
    text-transform: uppercase;
    letter-spacing: 0.5px;
    color: #ffffff;
    box-shadow: 0 2px 4px rgba(0,0,0,0.2);
  }
  .cp-badge-truyenthong {
    background-color: #1760a5; /* Xanh y tế */
  }
  .cp-badge-nhandao {
    background-color: #e36928; /* Cam nhân đạo */
  }

  /* Card Body */
  .cp-card-body {
    padding: 16px;
    display: flex;
    flex-direction: column;
    flex-grow: 1;
  }
  .cp-card-title {
    font-size: 16px;
    font-weight: 700;
    line-height: 1.4;
    color: #0f172a;
    margin: 0 0 10px 0;
    min-height: 44px;
  }

  /* Info items: Thời gian, Địa điểm */
  .cp-meta-list {
    display: flex;
    flex-direction: column;
    gap: 6px;
    margin-bottom: 12px;
  }
  .cp-meta-item {
    display: flex;
    align-items: flex-start;
    gap: 8px;
    font-size: 13px;
    color: #475569;
  }
  .cp-meta-icon {
    width: 16px;
    height: 16px;
    flex-shrink: 0;
    margin-top: 2px;
    color: #64748b;
  }

  /* Short description */
  .cp-desc {
    font-size: 13px;
    color: #64748b;
    line-height: 1.5;
    margin: 0 0 16px 0;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    overflow: hidden;
  }

  /* File attachment & Actions */
  .cp-file-row {
    background: #f8fafc;
    border: 1px dashed #cbd5e1;
    border-radius: 6px;
    padding: 8px 10px;
    margin-top: auto;
    display: flex;
    flex-direction: column;
    gap: 8px;
  }
  .cp-file-info {
    display: flex;
    align-items: center;
    gap: 6px;
    font-size: 12px;
    color: #334155;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
  }
  .cp-pdf-icon {
    width: 14px;
    height: 14px;
    color: #dc2626;
    flex-shrink: 0;
  }
  .cp-file-actions {
    display: flex;
    gap: 6px;
  }

  /* Action Buttons */
  .btn-cp {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: 5px;
    padding: 5px 12px;
    font-size: 12px;
    font-weight: 600;
    border-radius: 4px;
    border: none;
    cursor: pointer;
    text-decoration: none;
    transition: all 0.15s ease;
  }
  .btn-cp-view {
    background-color: #1760a5;
    color: #ffffff;
    flex: 1;
  }
  .btn-cp-view:hover {
    background-color: #104c84;
  }
  .btn-cp-download {
    background-color: #e36928;
    color: #ffffff;
    flex: 1;
  }
  .btn-cp-download:hover {
    background-color: #c55418;
  }

  /* Inline PDF Reader Frame */
  .cp-viewer-container {
    display: none;
    margin-top: 10px;
    background: #1e293b;
    border-radius: 6px;
    overflow: hidden;
    border: 1px solid #cbd5e1;
  }
  .cp-viewer-container.active {
    display: block;
  }
  .cp-viewer-header {
    background: #0f172a;
    color: #e2e8f0;
    padding: 6px 10px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    font-size: 11px;
  }
  .cp-viewer-frame {
    width: 100%;
    height: 280px;
    border: none;
    background: #ffffff;
  }
</style>

<div id="campaigns-component">
  <!-- Header -->
  <div class="cp-header">
    <h2 class="cp-title">Các Chiến Dịch Truyền Thông Y Tế & Khám Chữa Bệnh Nhân Đạo</h2>
    <p class="cp-subtitle">Kế hoạch triển khai công tác tuyên truyền phòng chống dịch bệnh và chăm sóc sức khỏe cộng đồng</p>
  </div>

  <!-- Bộ lọc & Tìm kiếm -->
  <div class="cp-filter-bar">
    <div class="cp-tabs">
      <button class="cp-tab-btn active" onclick="filterCampaigns('all', this)">Tất cả</button>
      <button class="cp-tab-btn" onclick="filterCampaigns('truyenthong', this)">Chiến dịch truyền thông</button>
      <button class="cp-tab-btn" onclick="filterCampaigns('nhandao', this)">Khám chữa bệnh nhân đạo</button>
    </div>

    <div class="cp-search-box">
      <input type="text" id="cpSearchInput" class="cp-input" placeholder="Tìm theo tên chiến dịch, địa điểm..." onkeyup="searchCampaigns()">
    </div>
  </div>

  <!-- Danh sách Grid các Box chiến dịch -->
  <div class="cp-grid" id="campaignsGrid">

    <?php foreach($campaignRows as $campaign):
      $campaignId=intval($campaign->id);
      $isHumanitarian=$campaign->campaign_type==='nhandao';
      $typeLabel=$isHumanitarian?'Khám chữa bệnh nhân đạo':'Chiến dịch truyền thông';
      $imageUrl=XC_URL.'/uploads/medical-campaigns/'.rawurlencode($campaign->image_path);
      $fileUrl=XC_URL.'/uploads/medical-campaigns/'.rawurlencode($campaign->attachment_path);
      $dateLabel=campaignFrontDate($campaign->start_date);
      if($campaign->end_date&&$campaign->end_date!==$campaign->start_date){$dateLabel.=' - '.campaignFrontDate($campaign->end_date);}
    ?>
    <div class="cp-card" data-category="<?php echo campaignFrontH($campaign->campaign_type);?>">
      <div class="cp-card-img-wrap">
        <span class="cp-badge cp-badge-<?php echo $isHumanitarian?'nhandao':'truyenthong';?>"><?php echo $typeLabel;?></span>
        <img class="cp-card-img" src="<?php echo campaignFrontH($imageUrl);?>" alt="<?php echo campaignFrontH($campaign->title);?>">
      </div>
      <div class="cp-card-body">
        <h3 class="cp-card-title"><a href="<?php echo XC_URL.'/hoat-dong/chien-dich-y-te/'.$campaignId.'.html';?>" style="color:inherit;text-decoration:none"><?php echo campaignFrontH($campaign->title);?></a></h3>
        <div class="cp-meta-list">
          <div class="cp-meta-item"><svg class="cp-meta-icon" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"/></svg><span><strong>Thời gian:</strong> <?php echo campaignFrontH($dateLabel);?></span></div>
          <div class="cp-meta-item"><svg class="cp-meta-icon" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"/><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"/></svg><span><strong>Địa điểm:</strong> <?php echo campaignFrontH($campaign->location);?></span></div>
        </div>
        
      </div>
    </div>
    <?php endforeach;?>

    <?php if(false): ?>

    <!-- BOX 1: Khám bệnh nhân đạo -->
    <div class="cp-card" data-category="nhandao">
      <div class="cp-card-img-wrap">
        <span class="cp-badge cp-badge-nhandao">Khám chữa bệnh nhân đạo</span>
        <img class="cp-card-img" src="https://images.unsplash.com/photo-1576091160399-112ba8d25d1d?w=600&auto=format&fit=crop&q=80" alt="Khám bệnh nhân đạo">
      </div>
      <div class="cp-card-body">
        <h3 class="cp-card-title">Khám bệnh, tư vấn sức khỏe và cấp thuốc miễn phí cho người cao tuổi</h3>
        <div class="cp-meta-list">
          <div class="cp-meta-item">
            <svg class="cp-meta-icon" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"/></svg>
            <span><strong>Thời gian:</strong> 15/10/2026 - 18/10/2026</span>
          </div>
          <div class="cp-meta-item">
            <svg class="cp-meta-icon" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"/><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"/></svg>
            <span><strong>Địa điểm:</strong> Trạm Y tế xã Đăk Hring, huyện Đăk Hà</span>
          </div>
        </div>
        <p class="cp-desc">Tổ chức đo huyết áp, siêu âm tổng quát, kiểm tra đường huyết và cấp phát 500 suất quà, thuốc bổ cho các đối tượng chính sách và hộ nghèo.</p>
        
        <!-- Tệp đính kèm -->
        <div class="cp-file-row">
          <div class="cp-file-info" title="Ke_hoach_kham_nhan_dao_DakHring_2026.pdf">
            <svg class="cp-pdf-icon" viewBox="0 0 24 24" fill="currentColor"><path d="M19 3H5c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm-9.5 8.5h-2v3h-1.5v-6h3.5c1.1 0 2 .9 2 2s-.9 1-2 1zm7.5 0h-2v3H13.5v-6h3.5c1.1 0 2 .9 2 2s-.9 1-2 1z"/></svg>
            <span>Ke_hoach_kham_nhan_dao_DakHring.pdf</span>
          </div>
          <div class="cp-file-actions">
            <button class="btn-cp btn-cp-view" onclick="toggleViewer('pdf1', this)">
              <svg width="14" height="14" fill="currentColor" viewBox="0 0 24 24"><path d="M12 4.5C7 4.5 2.73 7.61 1 12c1.73 4.39 6 7.5 11 7.5s9.27-3.11 11-7.5c-1.73-4.39-6-7.5-11-7.5zm0 12.5c-2.76 0-5-2.24-5-5s2.24-5 5-5 5 2.24 5 5-2.24 5-5 5z"/></svg>
              Xem
            </button>
            <a href="#" class="btn-cp btn-cp-download" download>
              <svg width="14" height="14" fill="currentColor" viewBox="0 0 24 24"><path d="M19.35 10.04C18.67 6.59 15.64 4 12 4 9.11 4 6.6 5.64 5.35 8.04 2.34 8.36 0 10.91 0 14c0 3.31 2.69 6 6 6h13c2.76 0 5-2.24 5-5 0-2.64-2.05-4.78-4.65-4.96zM17 13l-5 5-5-5h3V9h4v4h3z"/></svg>
              Tải về
            </a>
          </div>
          <!-- Khung xem PDF inline trực tiếp -->
          <div id="pdf1" class="cp-viewer-container">
            <div class="cp-viewer-header">
              <span>Bản xem trực tuyến</span>
              <span style="cursor:pointer;" onclick="toggleViewer('pdf1')">✕ Đóng</span>
            </div>
            <iframe class="cp-viewer-frame" src="about:blank"></iframe>
          </div>
        </div>
      </div>
    </div>

    <!-- BOX 2: Chiến dịch truyền thông -->
    <div class="cp-card" data-category="truyenthong">
      <div class="cp-card-img-wrap">
        <span class="cp-badge cp-badge-truyenthong">Chiến dịch truyền thông</span>
        <img class="cp-card-img" src="https://images.unsplash.com/photo-1584515979956-d9f6e5d09982?w=600&auto=format&fit=crop&q=80" alt="Truyền thông y tế">
      </div>
      <div class="cp-card-body">
        <h3 class="cp-card-title">Chiến dịch truyền thông phòng chống dịch bệnh sốt xuất huyết và tay chân miệng</h3>
        <div class="cp-meta-list">
          <div class="cp-meta-item">
            <svg class="cp-meta-icon" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"/></svg>
            <span><strong>Thời gian:</strong> 20/10/2026 - 30/10/2026</span>
          </div>
          <div class="cp-meta-item">
            <svg class="cp-meta-icon" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"/><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"/></svg>
            <span><strong>Địa điểm:</strong> Các trường học và cụm dân cư huyện Đăk Hà</span>
          </div>
        </div>
        <p class="cp-desc">Tuyên truyền diệt lăng quăng, bọ gậy, giữ gìn vệ sinh môi trường gia đình và trường mầm non nhằm ngăn ngừa bùng phát dịch bệnh mùa mưa.</p>
        
        <!-- Tệp đính kèm -->
        <div class="cp-file-row">
          <div class="cp-file-info" title="Ke_hoach_truyen_thong_sxh_2026.pdf">
            <svg class="cp-pdf-icon" viewBox="0 0 24 24" fill="currentColor"><path d="M19 3H5c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm-9.5 8.5h-2v3h-1.5v-6h3.5c1.1 0 2 .9 2 2s-.9 1-2 1zm7.5 0h-2v3H13.5v-6h3.5c1.1 0 2 .9 2 2s-.9 1-2 1z"/></svg>
            <span>Ke_hoach_truyen_thong_sxh_2026.pdf</span>
          </div>
          <div class="cp-file-actions">
            <button class="btn-cp btn-cp-view" onclick="toggleViewer('pdf2', this)">
              <svg width="14" height="14" fill="currentColor" viewBox="0 0 24 24"><path d="M12 4.5C7 4.5 2.73 7.61 1 12c1.73 4.39 6 7.5 11 7.5s9.27-3.11 11-7.5c-1.73-4.39-6-7.5-11-7.5zm0 12.5c-2.76 0-5-2.24-5-5s2.24-5 5-5 5 2.24 5 5-2.24 5-5 5z"/></svg>
              Xem
            </button>
            <a href="#" class="btn-cp btn-cp-download" download>
              <svg width="14" height="14" fill="currentColor" viewBox="0 0 24 24"><path d="M19.35 10.04C18.67 6.59 15.64 4 12 4 9.11 4 6.6 5.64 5.35 8.04 2.34 8.36 0 10.91 0 14c0 3.31 2.69 6 6 6h13c2.76 0 5-2.24 5-5 0-2.64-2.05-4.78-4.65-4.96zM17 13l-5 5-5-5h3V9h4v4h3z"/></svg>
              Tải về
            </a>
          </div>
          <div id="pdf2" class="cp-viewer-container">
            <div class="cp-viewer-header">
              <span>Bản xem trực tuyến</span>
              <span style="cursor:pointer;" onclick="toggleViewer('pdf2')">✕ Đóng</span>
            </div>
            <iframe class="cp-viewer-frame" src="about:blank"></iframe>
          </div>
        </div>
      </div>
    </div>

    <!-- BOX 3: Khám bệnh nhân đạo -->
    <div class="cp-card" data-category="nhandao">
      <div class="cp-card-img-wrap">
        <span class="cp-badge cp-badge-nhandao">Khám chữa bệnh nhân đạo</span>
        <img class="cp-card-img" src="https://images.unsplash.com/photo-1516549655169-df83a0774514?w=600&auto=format&fit=crop&q=80" alt="Hiến máu nhân đạo">
      </div>
      <div class="cp-card-body">
        <h3 class="cp-card-title">Ngày hội Hiến máu tình nguyện "Giọt hồng blouse trắng Đăk Hà"</h3>
        <div class="cp-meta-list">
          <div class="cp-meta-item">
            <svg class="cp-meta-icon" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"/></svg>
            <span><strong>Thời gian:</strong> 05/11/2026</span>
          </div>
          <div class="cp-meta-item">
            <svg class="cp-meta-icon" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"/><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"/></svg>
            <span><strong>Địa điểm:</strong> Hội trường BVĐK Khu Vực Đăk Hà</span>
          </div>
        </div>
        <p class="cp-desc">Chương trình vận động y bác sĩ và người dân trên địa bàn hiến máu cứu người, mục tiêu tiếp nhận tối thiểu 300 đơn vị máu an toàn.</p>
        
        <!-- Tệp đính kèm -->
        <div class="cp-file-row">
          <div class="cp-file-info" title="Ke_hoach_hien_mau_tinh_nguyen_2026.pdf">
            <svg class="cp-pdf-icon" viewBox="0 0 24 24" fill="currentColor"><path d="M19 3H5c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm-9.5 8.5h-2v3h-1.5v-6h3.5c1.1 0 2 .9 2 2s-.9 1-2 1zm7.5 0h-2v3H13.5v-6h3.5c1.1 0 2 .9 2 2s-.9 1-2 1z"/></svg>
            <span>Ke_hoach_hien_mau_tinh_nguyen_2026.pdf</span>
          </div>
          <div class="cp-file-actions">
            <button class="btn-cp btn-cp-view" onclick="toggleViewer('pdf3', this)">
              <svg width="14" height="14" fill="currentColor" viewBox="0 0 24 24"><path d="M12 4.5C7 4.5 2.73 7.61 1 12c1.73 4.39 6 7.5 11 7.5s9.27-3.11 11-7.5c-1.73-4.39-6-7.5-11-7.5zm0 12.5c-2.76 0-5-2.24-5-5s2.24-5 5-5 5 2.24 5 5-2.24 5-5 5z"/></svg>
              Xem
            </button>
            <a href="#" class="btn-cp btn-cp-download" download>
              <svg width="14" height="14" fill="currentColor" viewBox="0 0 24 24"><path d="M19.35 10.04C18.67 6.59 15.64 4 12 4 9.11 4 6.6 5.64 5.35 8.04 2.34 8.36 0 10.91 0 14c0 3.31 2.69 6 6 6h13c2.76 0 5-2.24 5-5 0-2.64-2.05-4.78-4.65-4.96zM17 13l-5 5-5-5h3V9h4v4h3z"/></svg>
              Tải về
            </a>
          </div>
          <div id="pdf3" class="cp-viewer-container">
            <div class="cp-viewer-header">
              <span>Bản xem trực tuyến</span>
              <span style="cursor:pointer;" onclick="toggleViewer('pdf3')">✕ Đóng</span>
            </div>
            <iframe class="cp-viewer-frame" src="about:blank"></iframe>
          </div>
        </div>
      </div>
    </div>

    <!-- BOX 4: Chiến dịch truyền thông -->
    <div class="cp-card" data-category="truyenthong">
      <div class="cp-card-img-wrap">
        <span class="cp-badge cp-badge-truyenthong">Chiến dịch truyền thông</span>
        <img class="cp-card-img" src="https://images.unsplash.com/photo-1532938911079-1b06ac7ceec7?w=600&auto=format&fit=crop&q=80" alt="Khám sàng lọc">
      </div>
      <div class="cp-card-body">
        <h3 class="cp-card-title">Truyền thông giáo dục sức khỏe sinh sản và dinh dưỡng cho bà mẹ trẻ em</h3>
        <div class="cp-meta-list">
          <div class="cp-meta-item">
            <svg class="cp-meta-icon" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"/></svg>
            <span><strong>Thời gian:</strong> 12/11/2026 - 15/11/2026</span>
          </div>
          <div class="cp-meta-item">
            <svg class="cp-meta-icon" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"/><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"/></svg>
            <span><strong>Địa điểm:</strong> Xã Ngọk Réo, huyện Đăk Hà</span>
          </div>
        </div>
        <p class="cp-desc">Hướng dẫn chế độ dinh dưỡng 1000 ngày đầu đời của trẻ, tiêm chủng đầy đủ và phòng chống suy dinh dưỡng trẻ em vùng đồng bào dân tộc thiểu số.</p>
        
        <!-- Tệp đính kèm -->
        <div class="cp-file-row">
          <div class="cp-file-info" title="Ke_hoach_truyen_thong_dinh_duong.pdf">
            <svg class="cp-pdf-icon" viewBox="0 0 24 24" fill="currentColor"><path d="M19 3H5c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zm-9.5 8.5h-2v3h-1.5v-6h3.5c1.1 0 2 .9 2 2s-.9 1-2 1zm7.5 0h-2v3H13.5v-6h3.5c1.1 0 2 .9 2 2s-.9 1-2 1z"/></svg>
            <span>Ke_hoach_truyen_thong_dinh_duong.pdf</span>
          </div>
          <div class="cp-file-actions">
            <button class="btn-cp btn-cp-view" onclick="toggleViewer('pdf4', this)">
              <svg width="14" height="14" fill="currentColor" viewBox="0 0 24 24"><path d="M12 4.5C7 4.5 2.73 7.61 1 12c1.73 4.39 6 7.5 11 7.5s9.27-3.11 11-7.5c-1.73-4.39-6-7.5-11-7.5zm0 12.5c-2.76 0-5-2.24-5-5s2.24-5 5-5 5 2.24 5 5-2.24 5-5 5z"/></svg>
              Xem
            </button>
            <a href="#" class="btn-cp btn-cp-download" download>
              <svg width="14" height="14" fill="currentColor" viewBox="0 0 24 24"><path d="M19.35 10.04C18.67 6.59 15.64 4 12 4 9.11 4 6.6 5.64 5.35 8.04 2.34 8.36 0 10.91 0 14c0 3.31 2.69 6 6 6h13c2.76 0 5-2.24 5-5 0-2.64-2.05-4.78-4.65-4.96zM17 13l-5 5-5-5h3V9h4v4h3z"/></svg>
              Tải về
            </a>
          </div>
          <div id="pdf4" class="cp-viewer-container">
            <div class="cp-viewer-header">
              <span>Bản xem trực tuyến</span>
              <span style="cursor:pointer;" onclick="toggleViewer('pdf4')">✕ Đóng</span>
            </div>
            <iframe class="cp-viewer-frame" src="about:blank"></iframe>
          </div>
        </div>
      </div>
    </div>

    <?php endif; ?>
  </div>
</div>

<script>
  // Lọc theo Tab (Tất cả / Chiến dịch truyền thông / Khám chữa bệnh nhân đạo)
  function filterCampaigns(category, btnElement) {
    const tabs = document.querySelectorAll('.cp-tab-btn');
    tabs.forEach(tab => tab.classList.remove('active'));
    if(btnElement) btnElement.classList.add('active');

    const cards = document.querySelectorAll('.cp-card');
    cards.forEach(card => {
      const cardCat = card.getAttribute('data-category');
      if (category === 'all' || cardCat === category) {
        card.style.display = 'flex';
      } else {
        card.style.display = 'none';
      }
    });
  }

  // Tìm kiếm theo tên hoặc địa điểm
  function searchCampaigns() {
    const keyword = document.getElementById('cpSearchInput').value.toLowerCase().trim();
    const cards = document.querySelectorAll('.cp-card');

    cards.forEach(card => {
      const text = card.textContent.toLowerCase();
      if (text.includes(keyword)) {
        card.style.display = 'flex';
      } else {
        card.style.display = 'none';
      }
    });
  }

  // Bật / tắt chế độ xem trực tiếp file PDF bên dưới box
  function toggleViewer(containerId, btn) {
    const container = document.getElementById(containerId);
    if (!container) return;

    const isActive = container.classList.contains('active');
    if (isActive) {
      container.classList.remove('active');
      if (btn) btn.innerHTML = `<svg width="14" height="14" fill="currentColor" viewBox="0 0 24 24"><path d="M12 4.5C7 4.5 2.73 7.61 1 12c1.73 4.39 6 7.5 11 7.5s9.27-3.11 11-7.5c-1.73-4.39-6-7.5-11-7.5zm0 12.5c-2.76 0-5-2.24-5-5s2.24-5 5-5 5 2.24 5 5-2.24 5-5 5z"/></svg> Xem`;
    } else {
      container.classList.add('active');
      const iframe = container.querySelector('iframe');
      if (iframe && iframe.dataset.src) {
        iframe.src = iframe.dataset.src + '#toolbar=1';
      } else if (iframe && iframe.src === 'about:blank') {
        iframe.srcdoc = `
          <body style="font-family:sans-serif;margin:0;padding:20px;color:#333;background:#fafafa;">
            <div style="border:1px solid #ddd;padding:15px;background:#fff;border-radius:4px;box-shadow:0 1px 3px rgba(0,0,0,0.1);">
              <h4 style="margin:0 0 10px 0;color:#1760a5;text-align:center;">CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM<br><small>Độc lập - Tự do - Hạnh phúc</small></h4>
              <hr style="border:none;border-top:1px solid #eee;margin:10px 0;">
              <p style="font-weight:bold;text-align:center;">KẾ HOẠCH TRIỂN KHAI HOẠT ĐỘNG CHUYÊN MÔN NĂM 2026</p>
              <p style="font-size:13px;line-height:1.6;">Nội dung chi tiết về danh mục thuốc cấp phát, lịch phân công y bác sĩ lâm sàng và phương tiện hỗ trợ khám chữa bệnh nhân đạo...</p>
            </div>
          </body>`;
      }
      if (btn) btn.innerHTML = `✕ Thu gọn`;
    }
  }
</script>
<?php require_once 'footer.php';?>
