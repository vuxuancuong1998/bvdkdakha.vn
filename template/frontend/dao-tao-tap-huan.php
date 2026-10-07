<?php require_once 'header.php';?>
<div id="eoffice-training-root" class="w-full bg-[#f4f6f9] text-[#212529] font-sans text-[13px] leading-normal p-3 sm:p-5 select-text">

  <!-- Thư viện Font chữ & Tailwind CSS để hỗ trợ hiển thị độc lập -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Segoe+UI:wght@400;600;700&family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
  <script src="https://cdn.tailwindcss.com"></script>

  <style>
    #eoffice-training-root {
      font-family: 'Segoe UI', Roboto, Helvetica, Arial, sans-serif;
      width: min(1280px, calc(100% - 30px));
      max-width: 1280px;
      margin: 24px auto 40px;
      box-sizing: border-box;
    }
    @media (max-width: 767px) {
      #eoffice-training-root {
        width: calc(100% - 20px);
        margin-top: 16px;
        margin-bottom: 28px;
      }
    }
    /* Kiểu dáng đường viền bảng eOffice chuẩn công văn */
    #eoffice-training-root .eoffice-table {
      border-collapse: separate;
      border-spacing: 0;
      width: 100%;
      border: 1px solid #c2c9d1;
    }
    #eoffice-training-root .eoffice-table th {
      background-color: #1760a5;
      color: #ffffff;
      font-weight: 600;
      font-size: 12.5px;
      padding: 7px 8px;
      border-right: 1px solid #124b82;
      border-bottom: 1px solid #124b82;
      text-align: center;
      vertical-align: middle;
      user-select: none;
    }
    #eoffice-training-root .eoffice-table th:last-child {
      border-right: none;
    }
    #eoffice-training-root .eoffice-table td {
      padding: 7px 9px;
      border-right: 1px solid #e1e6eb;
      border-bottom: 1px solid #e1e6eb;
      vertical-align: middle;
      background-color: #ffffff;
    }
    #eoffice-training-root .eoffice-table tr:hover td {
      background-color: #f0f7ff;
    }
    #eoffice-training-root .eoffice-table tr.selected-row td {
      background-color: #e6f0fa;
    }
    #eoffice-training-root .eoffice-table tr:last-child td {
      border-bottom: none;
    }
    #eoffice-input {
      font-size: 13px;
      height: 30px;
    }
    .btn-eoffice {
      display: inline-flex;
      align-items: center;
      justify-content: center;
      gap: 5px;
      padding: 4px 12px;
      height: 30px;
      font-size: 12.5px;
      font-weight: 500;
      border-radius: 3px;
      cursor: pointer;
      transition: all 0.15s ease-in-out;
      white-space: nowrap;
    }
    .btn-eoffice:active {
      transform: translateY(1px);
    }
    /* Chú giải nhãn */
    .badge-status {
      display: inline-flex;
      align-items: center;
      gap: 4px;
      padding: 2px 8px;
      border-radius: 3px;
      font-size: 11.5px;
      font-weight: 600;
    }
  </style>

  <div class="bg-white border border-[#c2c9d1] rounded-[4px] shadow-xs mb-3 p-2.5">
    
    <!-- Hàng lọc thời gian, từ khóa và các nút chức năng -->
    <div class="flex flex-wrap items-center justify-between gap-2">
      
      <!-- Cụm Lọc Thời Gian Từ Ngày -> Đến Ngày -->
      <div class="flex flex-wrap items-center gap-1.5">
        
        <!-- Dropdown Mốc thời gian -->
        <div class="relative">
          <select id="flt-date-type" class="h-[30px] text-[12.5px] bg-[#fafafa] border border-[#bdc3c7] hover:border-[#95a5a6] rounded-[3px] px-2 py-1 text-slate-700 focus:outline-none focus:border-[#1760a5]">
            <option value="start">Thời gian bắt đầu</option>
            <option value="end">Thời gian kết thúc</option>
            <option value="all" selected>Tất cả thời gian</option>
          </select>
        </div>

        <span class="text-slate-600 text-xs font-medium">Từ ngày:</span>
        <input 
          type="date" 
          id="flt-from-date" 
          value="2026-01-01"
          onchange="applyEofficeFilters()" 
          class="h-[30px] text-[12px] bg-white border border-[#bdc3c7] rounded-[3px] px-2 text-slate-700 focus:outline-none focus:border-[#1760a5]">

        <span class="text-slate-600 text-xs font-medium">Đến ngày:</span>
        <input 
          type="date" 
          id="flt-to-date" 
          value="2026-12-31"
          onchange="applyEofficeFilters()" 
          class="h-[30px] text-[12px] bg-white border border-[#bdc3c7] rounded-[3px] px-2 text-slate-700 focus:outline-none focus:border-[#1760a5]">

        <span class="text-slate-400 mx-0.5">|</span>

        <!-- Lọc Trạng thái: Hiệu lực / Đã hết -->
        <span class="text-slate-600 text-xs font-medium">Trạng thái:</span>
        <select 
          id="flt-status" 
          onchange="applyEofficeFilters()" 
          class="h-[30px] text-[12.5px] bg-white border border-[#bdc3c7] rounded-[3px] px-2 py-0.5 text-slate-700 font-medium focus:outline-none focus:border-[#1760a5]">
          <option value="all">-- Tất cả trạng thái --</option>
          <option value="active">Hiệu lực</option>
          <option value="expired">Đã hết</option>
        </select>

      </div>

      <!-- Cụm Tìm Kiếm & Các Nút Tác Vụ -->
      <div class="flex items-center gap-1.5 flex-1 sm:flex-initial justify-end">
        
        <!-- Nhóm tìm kiếm gộp kiểu eOffice -->
        <div class="flex items-center border border-[#bdc3c7] rounded-[3px] overflow-hidden h-[30px] bg-white">
          <select id="search-type" class="bg-[#f8f9fa] border-r border-[#bdc3c7] text-[12px] text-slate-700 h-full px-2 focus:outline-none">
            <option value="name">Tên đào tạo</option>
            <option value="code">Mã khóa / Số</option>
            <option value="unit">Đơn vị tổ chức</option>
          </select>
          <input 
            type="text" 
            id="flt-keyword" 
            onkeyup="if(event.key === 'Enter') applyEofficeFilters()" 
            placeholder="Nhập từ khoá..." 
            class="px-2.5 text-[12.5px] text-slate-800 placeholder-slate-400 focus:outline-none w-44 sm:w-56 h-full">
          <button 
            onclick="applyEofficeFilters()" 
            class="bg-[#1760a5] hover:bg-[#124b82] text-white px-3 h-full flex items-center justify-center transition-colors" 
            title="Tìm kiếm">
            <svg class="w-3.5 h-3.5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2.2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"/></svg>
          </button>
        </div>

        

        

      </div>

    </div>

    <!-- Panel Tìm kiếm Nâng cao (Có thể thu phóng) -->
    

    <!-- Dòng chú giải chuẩn giao diện eOffice -->
    <div class="flex flex-wrap items-center justify-between text-[11.5px] text-slate-600 pt-2 border-t border-[#e2e6ea] gap-2">
      
      <div class="text-[11px] italic text-[#1760a5]">
        (Dữ liệu chuẩn hóa Đào tạo & Chỉ đạo tuyến năm 2026 - BVĐK Khu Vực Đăk Hà)
      </div>
    </div>

  </div>

  <div class="overflow-x-auto shadow-xs border border-[#c2c9d1] rounded-[3px] bg-white">
    <table class="eoffice-table">
      <thead>
        <tr>
          <!-- Checkbox chọn tất cả -->
          <th style="width: 32px;" class="!px-1">
            <input type="checkbox" id="check-all" onchange="toggleSelectAllRows(this.checked)" class="w-3.5 h-3.5 cursor-pointer accent-[#1760a5]">
          </th>
          <!-- Cột Kẹp ghim File -->
          <th style="width: 36px;" title="Tài liệu đính kèm" class="!px-1">
            <svg class="w-4 h-4 mx-auto text-blue-200" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15.172 7l-6.586 6.586a2 2 0 102.828 2.828l6.414-6.586a4 4 0 00-5.656-5.656l-6.415 6.585a6 6 0 108.486 8.486L20.5 13"/>
            </svg>
          </th>
          <!-- STT (#) - Đã bỏ cột ngôi sao và mã khóa -->
          <th style="width: 44px;"># ⬍</th>
          <!-- Cột chính: TÊN ĐÀO TẠO & TẬP HUẤN -->
          <th style="min-width: 380px;" class="!text-left !pl-3">TÊN ĐÀO TẠO & TẬP HUẤN ⬍</th>
          <!-- THỜI GIAN: TỪ NGÀY -->
          <th style="width: 110px;">TỪ NGÀY ⬍</th>
          <!-- THỜI GIAN: ĐẾN NGÀY -->
          <th style="width: 110px;">ĐẾN NGÀY ⬍</th>
          <!-- Cột chính: TRẠNG THÁI (HIỆU LỰC / ĐÃ HẾT) -->
          <th style="width: 115px;">TRẠNG THÁI ⬍</th>
          <!-- Đơn vị tổ chức -->
          <th style="width: 175px;">ĐƠN VỊ TỔ CHỨC ⬍</th>
          <!-- Cột Thao tác bổ sung mới -->
          <th style="width: 95px;" class="!text-center">THAO TÁC</th>
        </tr>
      </thead>
      <tbody id="training-tbody">
        <!-- Render động danh sách các hàng dữ liệu từ JS -->
      </tbody>
    </table>
  </div>

  <div class="mt-2.5 bg-white border border-[#c2c9d1] rounded-[3px] px-3 py-2 flex flex-col sm:flex-row items-center justify-between text-xs text-slate-600 gap-2">
    <div class="flex items-center gap-2">
      <span>Hiển thị</span>
      <select id="page-size" onchange="changePageSize(this.value)" class="h-[26px] bg-slate-50 border border-[#bdc3c7] rounded-[2px] px-2 py-0.5 text-xs">
        <option value="5">5</option>
        <option value="10" selected>10</option>
        <option value="20">20</option>
        <option value="50">50</option>
      </select>
      <span>bản ghi / trang &bull;</span>
      <span>Tổng số: <b id="total-records-count" class="text-slate-900">0</b> khóa đào tạo</span>
    </div>

    <div class="flex items-center gap-1 select-none">
      <button onclick="gotoPage(1)" class="px-2 py-1 border border-[#c2c9d1] hover:bg-slate-100 rounded-[2px] text-slate-600" title="Trang đầu">&laquo;</button>
      <button onclick="gotoPage(currentPage - 1)" class="px-2 py-1 border border-[#c2c9d1] hover:bg-slate-100 rounded-[2px] text-slate-600" title="Trang trước">&lsaquo;</button>
      
      <div id="pagination-pages" class="flex items-center gap-1">
        <!-- Số trang sinh tự động -->
      </div>

      <button onclick="gotoPage(currentPage + 1)" class="px-2 py-1 border border-[#c2c9d1] hover:bg-slate-100 rounded-[2px] text-slate-600" title="Trang sau">&rsaquo;</button>
      <button onclick="gotoPage(totalPages)" class="px-2 py-1 border border-[#c2c9d1] hover:bg-slate-100 rounded-[2px] text-slate-600" title="Trang cuối">&raquo;</button>
    </div>
  </div>

  <div id="eoff-toast" class="fixed bottom-5 right-5 z-50 bg-[#1c2833] text-white px-3.5 py-2.5 rounded shadow-lg flex items-center gap-2.5 transform translate-y-12 opacity-0 pointer-events-none transition-all duration-300 text-xs border border-slate-700">
    <span id="eoff-toast-icon" class="text-emerald-400">✓</span>
    <span id="eoff-toast-msg">Thông báo thành công</span>
  </div>

  <script>
    // =========================================================================
    // DỮ LIỆU ĐÀO TẠO & TẬP HUẤN (CHUẨN HÀNH CHÍNH / EOFFICE BỆNH VIỆN ĐĂK HÀ)
    // =========================================================================
    const rawTrainingData = <?php echo json_encode(is_array($training_plans??null)?$training_plans:array(), JSON_UNESCAPED_UNICODE|JSON_UNESCAPED_SLASHES|JSON_HEX_TAG|JSON_HEX_AMP|JSON_HEX_APOS|JSON_HEX_QUOT); ?>;

    // Trạng thái phân trang & lọc
    let currentData = [...rawTrainingData];
    let currentPage = 1;
    let pageSize = 10;
    let totalPages = 1;
    let expandedRowIds = new Set();
    let selectedRowIds = new Set();

    // =========================================================================
    // HÀM ĐỊNH DẠNG NGÀY THÁNG dd/mm/yyyy
    // =========================================================================
    function formatDateVN(dateStr) {
      if (!dateStr) return '';
      const [y, m, d] = dateStr.split('-');
      return `${d}/${m}/${y}`;
    }

    // =========================================================================
    // BỘ LỌC ĐA NĂNG (TỪ NGÀY - ĐẾN NGÀY, TRẠNG THÁI, TỪ KHÓA)
    // =========================================================================
    function applyEofficeFilters() {
      const fromDate = document.getElementById('flt-from-date').value;
      const toDate = document.getElementById('flt-to-date').value;
      const dateType = document.getElementById('flt-date-type').value;
      const status = document.getElementById('flt-status').value;
      const searchType = document.getElementById('search-type').value;
      const keyword = document.getElementById('flt-keyword').value.trim().toLowerCase();
      const trainingFormEl = document.getElementById('adv-form');
      const certificateTypeEl = document.getElementById('adv-cme');
      const departmentEl = document.getElementById('adv-dept');
      const trainingForm = trainingFormEl ? trainingFormEl.value : '';
      const certificateType = certificateTypeEl ? certificateTypeEl.value : '';
      const department = departmentEl ? departmentEl.value.trim().toLowerCase() : '';

      currentData = rawTrainingData.filter(item => {
        // 1. Lọc theo trạng thái
        if (status !== 'all' && item.status !== status) {
          return false;
        }
        if (trainingForm && item.trainingForm !== trainingForm) return false;
        if (certificateType && item.certificateType !== certificateType) return false;
        if (department && !(item.department || '').toLowerCase().includes(department)) return false;

        // 2. Lọc theo khoảng thời gian
        if (fromDate) {
          if (dateType === 'start' && item.startDate < fromDate) return false;
          if (dateType === 'end' && item.endDate < fromDate) return false;
          if (dateType === 'all' && item.endDate < fromDate) return false;
        }
        if (toDate) {
          if (dateType === 'start' && item.startDate > toDate) return false;
          if (dateType === 'end' && item.endDate > toDate) return false;
          if (dateType === 'all' && item.startDate > toDate) return false;
        }

        // 3. Lọc theo từ khóa
        if (keyword) {
          if (searchType === 'name' && !item.name.toLowerCase().includes(keyword) && !item.summary.toLowerCase().includes(keyword)) {
            return false;
          }
          if (searchType === 'code' && !item.code.toLowerCase().includes(keyword)) {
            return false;
          }
          if (searchType === 'unit' && !item.organizer.toLowerCase().includes(keyword)) {
            return false;
          }
        }

        return true;
      });

      currentPage = 1;
      renderTable();
      showToast(`Đã lọc: Tìm thấy ${currentData.length} khóa đào tạo`);
    }

    function resetFilters() {
      document.getElementById('flt-from-date').value = '2026-01-01';
      document.getElementById('flt-to-date').value = '2026-12-31';
      document.getElementById('flt-status').value = 'all';
      document.getElementById('flt-keyword').value = '';
      const trainingFormEl = document.getElementById('adv-form');
      const certificateTypeEl = document.getElementById('adv-cme');
      const departmentEl = document.getElementById('adv-dept');
      if (trainingFormEl) trainingFormEl.value = '';
      if (certificateTypeEl) certificateTypeEl.value = '';
      if (departmentEl) departmentEl.value = '';
      applyEofficeFilters();
    }

    function toggleAdvancedSearch() {
      const box = document.getElementById('advanced-search-box');
      box.classList.toggle('hidden');
    }

    // =========================================================================
    // RENDER BẢNG DỮ LIỆU CHUẨN EOFFICE VỚI EXPANDED PDF VIEWER
    // =========================================================================
    function renderTable() {
      const tbody = document.getElementById('training-tbody');
      const totalCountEl = document.getElementById('total-records-count');
      if (!tbody) return;

      totalCountEl.textContent = currentData.length;
      totalPages = Math.max(1, Math.ceil(currentData.length / pageSize));

      const startIndex = (currentPage - 1) * pageSize;
      const pageRows = currentData.slice(startIndex, startIndex + pageSize);

      if (pageRows.length === 0) {
        tbody.innerHTML = `
          <tr>
            <td colspan="9" class="text-center py-10 text-slate-500 italic bg-white">
              Không tìm thấy chương trình đào tạo & tập huấn nào phù hợp với điều kiện tìm kiếm.
            </td>
          </tr>
        `;
        renderPagination();
        return;
      }

      let html = '';
      pageRows.forEach((row, index) => {
        const rowNum = startIndex + index + 1;
        const isExpanded = expandedRowIds.has(row.id);
        const isSelected = selectedRowIds.has(row.id);

        // Badge Trạng thái: Hiệu lực / Đã hết
        let statusBadge = '';
        if (row.status === 'active') {
          statusBadge = `
            <span class="badge-status bg-emerald-50 text-emerald-800 border border-emerald-300">
              <span class="w-2 h-2 rounded-full bg-emerald-600 inline-block animate-pulse"></span>
              Hiệu lực
            </span>
          `;
        } else {
          statusBadge = `
            <span class="badge-status bg-slate-100 text-slate-600 border border-slate-300">
              <span class="w-2 h-2 rounded-full bg-slate-400 inline-block"></span>
              Đã hết
            </span>
          `;
        }

        html += `
          <!-- HÀNG CHÍNH DỮ LIỆU KHÓA ĐÀO TẠO -->
          <tr class="${isSelected ? 'selected-row' : ''} transition-colors" id="row-${row.id}">
            
            <!-- Checkbox -->
            <td class="text-center !px-1">
              <input 
                type="checkbox" 
                ${isSelected ? 'checked' : ''} 
                onchange="toggleSelectRow(${row.id}, this.checked)"
                class="w-3.5 h-3.5 cursor-pointer accent-[#1760a5]">
            </td>

            <!-- Icon kẹp ghim: Click để mở xem/tải file đính kèm ngay phía dưới -->
            <td class="text-center !px-1">
              <button 
                onclick="toggleInlinePdfRow(${row.id})" 
                class="text-[#1760a5] hover:text-[#0d3863] p-1 rounded hover:bg-blue-100/60 inline-flex items-center justify-center transition-colors"
                title="Bấm để mở tệp văn bản đính kèm">
                <svg class="w-4 h-4 transform ${isExpanded ? 'rotate-45 text-red-600' : ''}" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2.2" d="M15.172 7l-6.586 6.586a2 2 0 102.828 2.828l6.414-6.586a4 4 0 00-5.656-5.656l-6.415 6.585a6 6 0 108.486 8.486L20.5 13"/>
                </svg>
              </button>
            </td>

            <!-- STT (#) -->
            <td class="text-center font-mono text-slate-500 text-xs font-semibold">
              ${rowNum}
            </td>

            <!-- TÊN ĐÀO TẠO & TẬP HUẤN -->
            <td class="!text-left">
              <div class="space-y-1">
                <a 
                  href="javascript:void(0)" 
                  onclick="toggleInlinePdfRow(${row.id})"
                  class="font-bold text-[#1760a5] hover:text-[#0e3b66] hover:underline block leading-snug">
                  ${row.name}
                </a>
                <div class="text-[12px] text-slate-600 line-clamp-2">
                  ${row.summary}
                </div>
                
              </div>
            </td>

            <!-- THỜI GIAN: TỪ NGÀY -->
            <td class="text-center whitespace-nowrap font-mono text-xs text-slate-700">
              ${formatDateVN(row.startDate)}
            </td>

            <!-- THỜI GIAN: ĐẾN NGÀY -->
            <td class="text-center whitespace-nowrap font-mono text-xs text-slate-700">
              ${formatDateVN(row.endDate)}
            </td>

            <!-- TRẠNG THÁI: HIỆU LỰC / ĐÃ HẾT -->
            <td class="text-center">
              ${statusBadge}
            </td>

            <!-- ĐƠN VỊ TỔ CHỨC -->
            <td class="text-slate-700 text-xs">
              <div class="font-medium text-slate-800">${row.organizer}</div>
            </td>

            <!-- CỘT THAO TÁC: NÚT XEM (#1760a5) -->
            <td class="text-center whitespace-nowrap !px-1">
              <button 
                onclick="toggleInlinePdfRow(${row.id})"
                class="btn-eoffice !h-[26px] !px-2.5 !text-[11.5px] font-semibold text-white ${isExpanded ? 'bg-slate-700 hover:bg-slate-800 border-slate-700' : 'bg-[#1760a5] hover:bg-[#124b82] border-[#124b82]'} border rounded-[3px] shadow-xs inline-flex items-center gap-1.5 transition-colors"
                title="${isExpanded ? 'Bấm để thu gọn xem văn bản' : 'Bấm để mở xem văn bản đính kèm'}">
                <svg class="w-3.5 h-3.5 text-blue-100" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  ${isExpanded 
                    ? '<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"/>' 
                    : '<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"/><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z"/>'
                  }
                </svg>
                <span>${isExpanded ? 'Thu gọn' : 'Xem'}</span>
              </button>
            </td>

          </tr>

          <!-- HÀNG MỞ RỘNG XEM VÀ TẢI TỆP TIN PDF TRỰC TIẾP NGAY PHÍA DƯỚI DÒNG -->
          ${isExpanded ? `
            <tr class="bg-[#f0f4f9]">
              <td colspan="9" class="!p-0 border-b-2 border-[#1760a5]">
                
                <!-- Thanh tác vụ File đính kèm: Nút Xem (#1760a5) và Nút Tải về (#e36928) bên phải -->
                <div class="p-3 bg-[#e9f2fb] border-y border-[#cbe0f5] flex flex-col sm:flex-row sm:items-center justify-between gap-3">
                  
                  <!-- Thông tin tệp tin chuẩn hình mẫu -->
                  <div class="flex items-center gap-2.5 min-w-0">
                    <span class="w-7 h-7 rounded bg-red-100 text-red-600 flex items-center justify-center shrink-0 border border-red-200">
                      <svg class="w-4 h-4" viewBox="0 0 24 24" fill="currentColor"><path d="M7 2a2 2 0 00-2 2v16a2 2 0 002 2h10a2 2 0 002-2V8.828a2 2 0 00-.586-1.414l-4.828-4.828A2 2 0 0012.172 2H7zm5 1.5V8a1 1 0 001 1h4.5L12 3.5z"/></svg>
                    </span>
                    <div class="truncate">
                      <span class="font-bold text-red-600 text-[13px]">
                        ${row.fileName}
                      </span>
                      <span class="text-xs text-slate-500 ml-1.5">
                        (Người gửi: ${row.fileSender} &bull; ${row.fileSize})
                      </span>
                    </div>
                  </div>

                  <!-- 2 Nút thao tác bên phải chuẩn màu sắc -->
                  <div class="flex items-center gap-2 shrink-0 self-end sm:self-auto">
                    <!-- Nút Xem (Màu xanh dương #1760a5) -->
                    <button 
                      onclick="toggleInlinePdfViewer(${row.id})"
                      id="btn-view-toggle-${row.id}"
                      class="inline-flex items-center gap-1.5 px-3 py-1.5 text-xs font-semibold text-white bg-[#1760a5] hover:bg-[#124b82] rounded-[3px] shadow-xs transition-colors">
                      <svg class="w-3.5 h-3.5 text-blue-100" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"/>
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z"/>
                      </svg>
                      <span id="txt-view-toggle-${row.id}">Ẩn văn bản</span>
                    </button>

                    <!-- Nút Tải về (Màu cam #e36928) -->
                    <a 
                      href="${row.fileUrl || '#'}"
                      download="${row.fileName}"
                      onclick="showToast('Đang tải xuống: ${row.fileName}')"
                      class="inline-flex items-center gap-1.5 px-3 py-1.5 text-xs font-semibold text-white bg-[#e36928] hover:bg-[#cb591a] rounded-[3px] shadow-xs transition-colors">
                      <svg class="w-3.5 h-3.5 text-orange-100" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-4l-4 4m0 0l-4-4m4 4V4"/>
                      </svg>
                      <span>Tải về</span>
                    </a>

                    <!-- Nút Đóng hàng mở rộng -->
                    <button 
                      onclick="toggleInlinePdfRow(${row.id})"
                      class="px-2 py-1.5 text-xs text-slate-500 hover:text-slate-800 bg-white hover:bg-slate-200 border border-[#c2c9d1] rounded-[3px]"
                      title="Đóng khung">
                      ✕
                    </button>
                  </div>

                </div>

                <!-- Khung hiển thị PDF nhúng trực tiếp ngay phía dưới thanh nút -->
                <div id="pdf-viewer-box-${row.id}" class="w-full bg-slate-900 border-t border-[#c2c9d1]">
                  <div class="px-3 py-1.5 bg-slate-800 text-slate-300 text-xs flex items-center justify-between">
                    <span class="font-mono text-emerald-400">● Trình xem văn bản Kế hoạch Đào tạo đính kèm (${row.code})</span>
                    <div class="flex items-center gap-2">
                      <button data-url="${row.fileUrl || ''}" onclick="if(this.dataset.url) window.open(this.dataset.url, '_blank')" class="text-[11px] text-slate-300 hover:text-white underline">Mở tab mới</button>
                    </div>
                  </div>
                  <div style="height: 480px;" class="w-full">
                    <iframe 
                      src="${row.fileUrl ? row.fileUrl + '#toolbar=1' : 'about:blank'}" 
                      class="w-full h-full border-0 bg-white" 
                      title="Xem file đào tạo">
                    </iframe>
                  </div>
                </div>

              </td>
            </tr>
          ` : ''}
        `;
      });

      tbody.innerHTML = html;
      renderPagination();
    }

    // =========================================================================
    // XỬ LÝ ĐÓNG / MỞ KHUNG XEM PDF TRỰC TIẾP
    // =========================================================================
    function toggleInlinePdfRow(id) {
      if (expandedRowIds.has(id)) {
        expandedRowIds.delete(id);
      } else {
        expandedRowIds.add(id);
      }
      renderTable();
    }

    function toggleInlinePdfViewer(id) {
      const viewer = document.getElementById(`pdf-viewer-box-${id}`);
      const txt = document.getElementById(`txt-view-toggle-${id}`);
      if (!viewer) return;

      if (viewer.classList.contains('hidden')) {
        viewer.classList.remove('hidden');
        if (txt) txt.textContent = 'Ẩn văn bản';
      } else {
        viewer.classList.add('hidden');
        if (txt) txt.textContent = 'Xem';
      }
    }

    // =========================================================================
    // CHỌN HÀNG HÀNG LOẠT (CHECKBOX)
    // =========================================================================
    function toggleSelectAllRows(checked) {
      if (checked) {
        currentData.forEach(r => selectedRowIds.add(r.id));
      } else {
        selectedRowIds.clear();
      }
      renderTable();
    }

    function toggleSelectRow(id, checked) {
      if (checked) {
        selectedRowIds.add(id);
      } else {
        selectedRowIds.delete(id);
      }
      document.getElementById('check-all').checked = selectedRowIds.size === currentData.length && currentData.length > 0;
      const rowEl = document.getElementById(`row-${id}`);
      if (rowEl) {
        rowEl.classList.toggle('selected-row', checked);
      }
    }

    // =========================================================================
    // PHÂN TRANG CHUẨN EOFFICE
    // =========================================================================
    function renderPagination() {
      const container = document.getElementById('pagination-pages');
      if (!container) return;

      let html = '';
      for (let p = 1; p <= totalPages; p++) {
        if (p === currentPage) {
          html += `<span class="px-2.5 py-1 bg-[#1760a5] text-white font-bold rounded-[2px] text-xs border border-[#1760a5]">${p}</span>`;
        } else {
          html += `<button onclick="gotoPage(${p})" class="px-2.5 py-1 hover:bg-slate-100 text-slate-700 rounded-[2px] text-xs border border-[#c2c9d1]">${p}</button>`;
        }
      }
      container.innerHTML = html;
    }

    function gotoPage(page) {
      if (page < 1 || page > totalPages) return;
      currentPage = page;
      renderTable();
    }

    function changePageSize(size) {
      pageSize = parseInt(size, 10);
      currentPage = 1;
      renderTable();
    }

    // =========================================================================
    // CÁC TIỆN ÍCH XUẤT EXCEL & THÔNG BÁO TOAST
    // =========================================================================
    function exportTrainingExcel() {
      showToast(`Đang kết xuất ${currentData.length} bản ghi đào tạo ra tệp Excel (.xlsx)...`);
    }

    function showToast(msg) {
      const toast = document.getElementById('eoff-toast');
      const text = document.getElementById('eoff-toast-msg');
      if (!toast || !text) return;

      text.textContent = msg;
      toast.classList.remove('opacity-0', 'translate-y-12', 'pointer-events-none');
      setTimeout(() => {
        toast.classList.add('opacity-0', 'translate-y-12', 'pointer-events-none');
      }, 2800);
    }

    // Khởi tạo bảng ban đầu
    applyEofficeFilters();
  </script>

</div>
<?php require_once 'footer.php';?>
