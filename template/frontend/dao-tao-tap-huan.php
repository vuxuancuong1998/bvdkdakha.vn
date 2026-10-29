<?php require_once 'header.php'; ?>
<div id="eoffice-training-root">

  <style>
    #eoffice-training-root {
      --et-primary: #0b57a4;
      --et-primary-dark: #084380;
      --et-primary-light: #ebf4ff;
      --et-accent: #e36928;
      --et-accent-dark: #c85619;
      --et-bg: #f4f7fb;
      --et-surface: #ffffff;
      --et-border: #dce4ee;
      --et-border-strong: #c5d2e2;
      --et-text: #1e293b;
      --et-text-secondary: #475569;
      --et-text-muted: #64748b;
      --et-radius-lg: 14px;
      --et-radius-md: 10px;
      --et-radius-sm: 8px;
      --et-shadow-sm: 0 2px 8px rgba(15, 23, 42, 0.04);
      --et-shadow-md: 0 8px 24px rgba(11, 87, 164, 0.07);

      font-family: var(--font-primary, 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif);
      font-size: 14px;
      line-height: 1.5;
      color: var(--et-text);
      width: 100%;
      max-width: var(--container-max, 1280px);
      padding: 28px var(--space-6, 24px);
      margin: 0 auto 48px;
      box-sizing: border-box;
      user-select: text;
    }

    #eoffice-training-root *,
    #eoffice-training-root *::before,
    #eoffice-training-root *::after {
      box-sizing: border-box;
    }

    /* Header & Thống kê nhanh */
    #eoffice-training-root .et-page-header {
      display: flex;
      flex-wrap: wrap;
      align-items: center;
      justify-content: space-between;
      gap: 16px;
      margin-bottom: 18px;
      padding: 18px 22px;
      background: linear-gradient(135deg, #0b57a4 0%, #156ec7 100%);
      border-radius: var(--et-radius-lg);
      color: #ffffff;
      box-shadow: var(--et-shadow-md);
    }

    #eoffice-training-root .et-header-info {
      display: flex;
      align-items: center;
      gap: 14px;
      min-width: 0;
    }

    #eoffice-training-root .et-header-icon {
      width: 46px;
      height: 46px;
      border-radius: 12px;
      background: rgba(255, 255, 255, 0.16);
      border: 1px solid rgba(255, 255, 255, 0.28);
      display: flex;
      align-items: center;
      justify-content: center;
      flex-shrink: 0;
    }

    #eoffice-training-root .et-header-title {
      font-size: clamp(1.05rem, 1.8vw, 1.3rem);
      font-weight: 700;
      margin: 0 0 3px;
      letter-spacing: -0.01em;
      color: #ffffff;
    }

    #eoffice-training-root .et-header-subtitle {
      font-size: 12.5px;
      color: rgba(255, 255, 255, 0.86);
      margin: 0;
    }

    #eoffice-training-root .et-stats-group {
      display: flex;
      flex-wrap: wrap;
      align-items: center;
      gap: 10px;
    }

    #eoffice-training-root .et-stat-pill {
      display: inline-flex;
      align-items: center;
      gap: 8px;
      padding: 7px 13px;
      border-radius: 999px;
      background: rgba(255, 255, 255, 0.14);
      border: 1px solid rgba(255, 255, 255, 0.24);
      font-size: 12.5px;
      font-weight: 500;
      color: #ffffff;
      backdrop-filter: blur(4px);
    }

    #eoffice-training-root .et-stat-pill strong {
      font-weight: 700;
      font-size: 13.5px;
      padding: 1px 7px;
      border-radius: 999px;
      background: rgba(255, 255, 255, 0.22);
    }

    /* Bộ lọc tìm kiếm */
    #eoffice-training-root .et-filter-card {
      background: var(--et-surface);
      border: 1px solid var(--et-border);
      border-radius: var(--et-radius-lg);
      box-shadow: var(--et-shadow-sm);
      padding: 18px 20px;
      margin-bottom: 18px;
    }

    #eoffice-training-root .et-filter-grid {
      display: grid;
      grid-template-columns: repeat(12, minmax(0, 1fr));
      gap: 14px;
      align-items: end;
    }

    #eoffice-training-root .et-field {
      display: flex;
      flex-direction: column;
      gap: 6px;
      min-width: 0;
    }

    #eoffice-training-root .et-col-date-type { grid-column: span 2; }
    #eoffice-training-root .et-col-from { grid-column: span 2; }
    #eoffice-training-root .et-col-to { grid-column: span 2; }
    #eoffice-training-root .et-col-status { grid-column: span 2; }
    #eoffice-training-root .et-col-search { grid-column: span 4; }

    #eoffice-training-root .et-label {
      font-size: 12px;
      font-weight: 600;
      color: var(--et-text-secondary);
      display: inline-flex;
      align-items: center;
      gap: 5px;
      white-space: nowrap;
    }

    #eoffice-training-root .et-control {
      width: 100%;
      height: 40px !important;
      min-height: 40px !important;
      padding: 0 12px;
      font-size: 13.5px !important;
      font-family: inherit;
      color: var(--et-text);
      background-color: #f8fafc;
      border: 1px solid var(--et-border-strong);
      border-radius: var(--et-radius-sm);
      transition: all 0.18s ease;
      outline: none;
    }

    #eoffice-training-root .et-control:hover {
      border-color: #94a3b8;
      background-color: #ffffff;
    }

    #eoffice-training-root .et-control:focus {
      background-color: #ffffff;
      border-color: var(--et-primary);
      box-shadow: 0 0 0 3px rgba(11, 87, 164, 0.14);
    }

    /* Nhóm ô tìm kiếm kết hợp */
    #eoffice-training-root .et-search-group {
      display: flex;
      align-items: stretch;
      width: 100%;
      height: 40px;
      border: 1px solid var(--et-border-strong);
      border-radius: var(--et-radius-sm);
      background: #ffffff;
      overflow: hidden;
      transition: all 0.18s ease;
    }

    #eoffice-training-root .et-search-group:focus-within {
      border-color: var(--et-primary);
      box-shadow: 0 0 0 3px rgba(11, 87, 164, 0.14);
    }

    #eoffice-training-root .et-search-select {
      height: 100% !important;
      min-height: 0 !important;
      border: 0 !important;
      border-right: 1px solid var(--et-border) !important;
      background: #f1f5f9;
      padding: 0 10px;
      font-size: 13px !important;
      font-weight: 500;
      color: var(--et-text-secondary);
      outline: none;
      flex-shrink: 0;
      cursor: pointer;
    }

    #eoffice-training-root .et-search-input {
      flex: 1;
      min-width: 0;
      height: 100% !important;
      min-height: 0 !important;
      border: 0 !important;
      padding: 0 12px;
      font-size: 13.5px !important;
      color: var(--et-text);
      background: transparent;
      outline: none;
    }

    #eoffice-training-root .et-search-input::placeholder {
      color: #94a3b8;
    }

    /* Thanh chân bộ lọc: Chú giải + Nút thao tác */
    #eoffice-training-root .et-filter-footer {
      display: flex;
      flex-wrap: wrap;
      align-items: center;
      justify-content: space-between;
      gap: 12px;
      margin-top: 14px;
      padding-top: 14px;
      border-top: 1px dashed var(--et-border);
    }

    #eoffice-training-root .et-filter-note {
      display: inline-flex;
      align-items: center;
      gap: 7px;
      font-size: 12.5px;
      color: var(--et-primary);
      font-weight: 500;
    }

    #eoffice-training-root .et-filter-actions {
      display: flex;
      align-items: center;
      gap: 8px;
      flex-wrap: wrap;
    }

    /* Hệ thống nút bấm */
    #eoffice-training-root .btn-eoffice {
      display: inline-flex;
      align-items: center;
      justify-content: center;
      gap: 6px;
      height: 38px;
      padding: 0 15px;
      font-size: 13px;
      font-weight: 600;
      font-family: inherit;
      border-radius: var(--et-radius-sm);
      border: 1px solid transparent;
      cursor: pointer;
      transition: all 0.16s ease;
      white-space: nowrap;
      text-decoration: none;
    }

    #eoffice-training-root .btn-eoffice:active {
      transform: translateY(1px);
    }

    #eoffice-training-root .btn-eoffice-primary {
      background: var(--et-primary);
      color: #ffffff;
      border-color: var(--et-primary);
      box-shadow: 0 2px 6px rgba(11, 87, 164, 0.2);
    }

    #eoffice-training-root .btn-eoffice-primary:hover {
      background: var(--et-primary-dark);
      border-color: var(--et-primary-dark);
    }

    #eoffice-training-root .btn-eoffice-secondary {
      background: #f8fafc;
      color: var(--et-text-secondary);
      border-color: var(--et-border-strong);
    }

    #eoffice-training-root .btn-eoffice-secondary:hover {
      background: #f1f5f9;
      color: var(--et-text);
      border-color: #94a3b8;
    }

    #eoffice-training-root .btn-eoffice-orange {
      background: var(--et-accent);
      color: #ffffff;
      border-color: var(--et-accent);
    }

    #eoffice-training-root .btn-eoffice-orange:hover {
      background: var(--et-accent-dark);
      border-color: var(--et-accent-dark);
    }

    #eoffice-training-root .btn-eoffice-sm {
      height: 32px;
      padding: 0 11px;
      font-size: 12.5px;
      border-radius: 6px;
    }

    /* Khung Bảng dữ liệu */
    #eoffice-training-root .et-table-card {
      background: var(--et-surface);
      border: 1px solid var(--et-border);
      border-radius: var(--et-radius-lg);
      box-shadow: var(--et-shadow-sm);
      overflow: hidden;
    }

    #eoffice-training-root .et-table-scroll {
      width: 100%;
      overflow-x: auto;
      -webkit-overflow-scrolling: touch;
    }

    #eoffice-training-root .eoffice-table {
      width: 100%;
      border-collapse: separate;
      border-spacing: 0;
    }

    #eoffice-training-root .eoffice-table thead th {
      background: linear-gradient(180deg, #125da8 0%, #0d4f92 100%);
      color: #ffffff;
      font-weight: 600;
      font-size: 12.5px;
      text-transform: uppercase;
      letter-spacing: 0.03em;
      padding: 13px 12px;
      border-right: 1px solid rgba(255, 255, 255, 0.12);
      border-bottom: 1px solid #093e74;
      text-align: center;
      vertical-align: middle;
      user-select: none;
      white-space: nowrap;
    }

    #eoffice-training-root .eoffice-table thead th:last-child {
      border-right: none;
    }

    #eoffice-training-root .eoffice-table tbody td {
      padding: 14px 12px;
      border-right: 1px solid #edf2f7;
      border-bottom: 1px solid #e2e8f0;
      vertical-align: middle;
      background-color: #ffffff;
      color: var(--et-text);
      transition: background-color 0.15s ease;
    }

    #eoffice-training-root .eoffice-table tbody td:last-child {
      border-right: none;
    }

    #eoffice-training-root .eoffice-table tbody tr.et-main-row:hover td {
      background-color: #f4f9ff;
    }

    #eoffice-training-root .eoffice-table tbody tr.selected-row td {
      background-color: #e8f2ff;
    }

    #eoffice-training-root .eoffice-table tbody tr:last-child td {
      border-bottom: none;
    }

    /* Các thành phần bên trong ô dữ liệu */
    #eoffice-training-root .et-checkbox {
      width: 16px !important;
      height: 16px !important;
      min-height: 16px !important;
      cursor: pointer;
      accent-color: var(--et-primary);
      vertical-align: middle;
    }

    #eoffice-training-root .et-clip-btn {
      width: 32px;
      height: 32px;
      border-radius: 8px;
      border: 1px solid transparent;
      background: #f0f7ff;
      color: var(--et-primary);
      display: inline-flex;
      align-items: center;
      justify-content: center;
      cursor: pointer;
      transition: all 0.16s ease;
    }

    #eoffice-training-root .et-clip-btn:hover {
      background: #dbeafe;
      border-color: #bfdbfe;
    }

    #eoffice-training-root .et-clip-btn.is-active {
      background: #fee2e2;
      color: #dc2626;
      border-color: #fecaca;
    }

    #eoffice-training-root .et-stt-badge {
      display: inline-flex;
      align-items: center;
      justify-content: center;
      min-width: 28px;
      height: 26px;
      padding: 0 7px;
      border-radius: 6px;
      background: #f1f5f9;
      color: #475569;
      font-weight: 700;
      font-size: 12px;
      font-family: ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, monospace;
    }

    #eoffice-training-root .et-title-cell {
      display: flex;
      flex-direction: column;
      gap: 6px;
      text-align: left;
    }

    #eoffice-training-root .et-meta-row {
      display: flex;
      flex-wrap: wrap;
      align-items: center;
      gap: 6px;
    }

    #eoffice-training-root .et-code-pill {
      display: inline-flex;
      align-items: center;
      padding: 2px 8px;
      border-radius: 5px;
      background: #eff6ff;
      color: #1d4ed8;
      border: 1px solid #bfdbfe;
      font-size: 11.5px;
      font-weight: 700;
      font-family: ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, monospace;
    }

    #eoffice-training-root .et-tag-pill {
      display: inline-flex;
      align-items: center;
      padding: 2px 8px;
      border-radius: 5px;
      background: #f8fafc;
      color: #475569;
      border: 1px solid #e2e8f0;
      font-size: 11.5px;
      font-weight: 500;
    }

    #eoffice-training-root .et-course-link {
      font-size: 14.5px;
      font-weight: 700;
      color: var(--et-primary);
      text-decoration: none;
      line-height: 1.4;
      transition: color 0.15s ease;
    }

    #eoffice-training-root .et-course-link:hover {
      color: var(--et-primary-dark);
      text-decoration: underline;
    }

    #eoffice-training-root .et-course-summary {
      font-size: 13px;
      color: var(--et-text-secondary);
      line-height: 1.45;
      display: -webkit-box;
      -webkit-line-clamp: 2;
      -webkit-box-orient: vertical;
      overflow: hidden;
    }

    #eoffice-training-root .et-date-badge {
      display: inline-flex;
      align-items: center;
      gap: 5px;
      padding: 4px 9px;
      border-radius: 6px;
      background: #f8fafc;
      border: 1px solid #e2e8f0;
      font-family: ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, monospace;
      font-size: 12.5px;
      font-weight: 600;
      color: #334155;
      white-space: nowrap;
    }

    /* Chú giải nhãn trạng thái */
    #eoffice-training-root .badge-status {
      display: inline-flex;
      align-items: center;
      justify-content: center;
      gap: 6px;
      padding: 4px 10px;
      border-radius: 999px;
      font-size: 12px;
      font-weight: 600;
      white-space: nowrap;
    }

    #eoffice-training-root .badge-status-active {
      background: #ecfdf5;
      color: #047857;
      border: 1px solid #a7f3d0;
    }

    #eoffice-training-root .badge-status-expired {
      background: #f1f5f9;
      color: #475569;
      border: 1px solid #cbd5e1;
    }

    #eoffice-training-root .et-dot {
      width: 7px;
      height: 7px;
      border-radius: 50%;
      display: inline-block;
    }

    #eoffice-training-root .et-dot-active {
      background: #10b981;
      box-shadow: 0 0 0 3px rgba(16, 185, 129, 0.2);
    }

    #eoffice-training-root .et-dot-expired {
      background: #94a3b8;
    }

    #eoffice-training-root .et-organizer {
      font-size: 13px;
      font-weight: 600;
      color: #1e293b;
      line-height: 1.4;
    }

    /* Khung mở rộng PDF đính kèm */
    #eoffice-training-root .et-expand-row td {
      padding: 0 !important;
      background: #f1f5f9 !important;
      border-bottom: 2px solid var(--et-primary) !important;
    }

    #eoffice-training-root .et-pdf-toolbar {
      display: flex;
      flex-wrap: wrap;
      align-items: center;
      justify-content: space-between;
      gap: 12px;
      padding: 12px 16px;
      background: linear-gradient(90deg, #e8f2fd 0%, #f0f7ff 100%);
      border-bottom: 1px solid #cfe2f7;
    }

    #eoffice-training-root .et-file-info {
      display: flex;
      align-items: center;
      gap: 10px;
      min-width: 0;
    }

    #eoffice-training-root .et-file-icon {
      width: 34px;
      height: 34px;
      border-radius: 8px;
      background: #fee2e2;
      color: #dc2626;
      border: 1px solid #fecaca;
      display: flex;
      align-items: center;
      justify-content: center;
      flex-shrink: 0;
    }

    #eoffice-training-root .et-file-meta {
      min-width: 0;
    }

    #eoffice-training-root .et-file-name {
      font-weight: 700;
      color: #b91c1c;
      font-size: 13.5px;
      word-break: break-word;
    }

    #eoffice-training-root .et-file-sub {
      font-size: 12px;
      color: #64748b;
      margin-left: 6px;
    }

    #eoffice-training-root .et-pdf-actions {
      display: flex;
      flex-wrap: wrap;
      align-items: center;
      gap: 8px;
    }

    #eoffice-training-root .et-pdf-viewer-box {
      width: 100%;
      background: #0f172a;
    }

    #eoffice-training-root .et-pdf-viewer-BoxHidden,
    #eoffice-training-root .hidden {
      display: none !important;
    }

    #eoffice-training-root .et-pdf-statusbar {
      padding: 8px 16px;
      background: #1e293b;
      color: #cbd5e1;
      font-size: 12px;
      display: flex;
      flex-wrap: wrap;
      align-items: center;
      justify-content: space-between;
      gap: 8px;
    }

    #eoffice-training-root .et-pdf-frame-wrap {
      width: 100%;
      height: clamp(340px, 68vh, 520px);
      background: #ffffff;
    }

    #eoffice-training-root .et-pdf-frame-wrap iframe {
      width: 100%;
      height: 100%;
      border: 0;
      display: block;
    }

    /* Thanh phân trang */
    #eoffice-training-root .et-pagination-bar {
      margin-top: 14px;
      background: var(--et-surface);
      border: 1px solid var(--et-border);
      border-radius: var(--et-radius-lg);
      padding: 12px 18px;
      display: flex;
      flex-wrap: wrap;
      align-items: center;
      justify-content: space-between;
      gap: 12px;
      font-size: 13px;
      color: var(--et-text-secondary);
      box-shadow: var(--et-shadow-sm);
    }

    #eoffice-training-root .et-page-info {
      display: flex;
      flex-wrap: wrap;
      align-items: center;
      gap: 8px;
    }

    #eoffice-training-root .et-page-select {
      height: 32px !important;
      min-height: 32px !important;
      padding: 0 8px;
      border-radius: 6px;
      border: 1px solid var(--et-border-strong);
      background: #f8fafc;
      font-size: 12.5px !important;
      font-weight: 600;
      color: var(--et-text);
      outline: none;
    }

    #eoffice-training-root .et-page-nav {
      display: flex;
      align-items: center;
      gap: 5px;
      flex-wrap: wrap;
    }

    #eoffice-training-root .et-page-btn {
      min-width: 32px;
      height: 32px;
      padding: 0 9px;
      border-radius: 6px;
      border: 1px solid var(--et-border-strong);
      background: #ffffff;
      color: var(--et-text-secondary);
      font-size: 12.5px;
      font-weight: 600;
      display: inline-flex;
      align-items: center;
      justify-content: center;
      cursor: pointer;
      transition: all 0.15s ease;
    }

    #eoffice-training-root .et-page-btn:hover:not(:disabled) {
      background: #f1f5f9;
      border-color: #94a3b8;
      color: var(--et-text);
    }

    #eoffice-training-root .et-page-btn.is-active {
      background: var(--et-primary);
      border-color: var(--et-primary);
      color: #ffffff;
      box-shadow: 0 2px 5px rgba(11, 87, 164, 0.25);
    }

    /* Toast thông báo */
    #eoffice-training-root .et-toast {
      position: fixed;
      bottom: 20px;
      right: 20px;
      z-index: 9999;
      background: #0f172a;
      color: #ffffff;
      padding: 11px 16px;
      border-radius: 10px;
      box-shadow: 0 10px 25px rgba(15, 23, 42, 0.25);
      display: flex;
      align-items: center;
      gap: 10px;
      font-size: 13px;
      font-weight: 500;
      border: 1px solid #334155;
      transform: translateY(20px);
      opacity: 0;
      pointer-events: none;
      transition: all 0.25s ease;
    }

    #eoffice-training-root .et-toast.is-visible {
      transform: translateY(0);
      opacity: 1;
    }

    /* =========================================================================
       RESPONSIVE BREAKPOINTS (TABLET & MOBILE)
       ========================================================================= */
    @media (max-width: 1199px) {
      #eoffice-training-root .et-col-date-type { grid-column: span 3; }
      #eoffice-training-root .et-col-from { grid-column: span 3; }
      #eoffice-training-root .et-col-to { grid-column: span 3; }
      #eoffice-training-root .et-col-status { grid-column: span 3; }
      #eoffice-training-root .et-col-search { grid-column: span 12; }
    }

    @media (max-width: 859px) {
      #eoffice-training-root {
        padding: 18px var(--space-4, 16px);
        margin-bottom: 32px;
      }

      #eoffice-training-root .et-page-header {
        padding: 16px;
      }

      #eoffice-training-root .et-col-date-type { grid-column: span 6; }
      #eoffice-training-root .et-col-status { grid-column: span 6; }
      #eoffice-training-root .et-col-from { grid-column: span 6; }
      #eoffice-training-root .et-col-to { grid-column: span 6; }
      #eoffice-training-root .et-col-search { grid-column: span 12; }

      /* Biến bảng thành danh sách Card trên Mobile & Tablet dọc */
      #eoffice-training-root .et-table-card {
        background: transparent;
        border: 0;
        box-shadow: none;
        overflow: visible;
      }

      #eoffice-training-root .et-table-scroll {
        overflow: visible;
      }

      #eoffice-training-root .eoffice-table,
      #eoffice-training-root .eoffice-table tbody {
        display: block;
        width: 100%;
      }

      #eoffice-training-root .eoffice-table thead {
        display: none;
      }

      #eoffice-training-root .eoffice-table tbody tr.et-main-row {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 10px 12px;
        background: #ffffff;
        border: 1px solid var(--et-border);
        border-radius: var(--et-radius-lg);
        padding: 16px;
        margin-bottom: 14px;
        box-shadow: var(--et-shadow-sm);
      }

      #eoffice-training-root .eoffice-table tbody tr.et-main-row.selected-row {
        border-color: var(--et-primary);
        background: #f8fbff;
      }

      #eoffice-training-root .eoffice-table tbody tr.et-main-row td {
        display: block;
        padding: 0 !important;
        border: 0 !important;
        background: transparent !important;
        text-align: left !important;
      }

      /* Ẩn cột checkbox và icon kẹp ghim riêng lẻ trên card mobile để gọn gàng */
      #eoffice-training-root .eoffice-table tbody tr.et-main-row td.et-cell-check,
      #eoffice-training-root .eoffice-table tbody tr.et-main-row td.et-cell-clip {
        display: none;
      }

      /* Dòng đầu Card: STT + Trạng thái */
      #eoffice-training-root .eoffice-table tbody tr.et-main-row td.et-cell-stt {
        grid-column: 1 / 2;
        order: 1;
        align-self: center;
      }

      #eoffice-training-root .eoffice-table tbody tr.et-main-row td.et-cell-status {
        grid-column: 2 / 3;
        order: 2;
        justify-self: end;
        align-self: center;
      }

      /* Tiêu đề & tóm tắt khóa học chiếm trọn chiều ngang */
      #eoffice-training-root .eoffice-table tbody tr.et-main-row td.et-cell-title {
        grid-column: 1 / -1;
        order: 3;
        padding: 8px 0 6px !important;
        border-top: 1px dashed #e2e8f0 !important;
        border-bottom: 1px dashed #e2e8f0 !important;
      }

      /* Từ ngày & Đến ngày chia 2 cột trên Card */
      #eoffice-training-root .eoffice-table tbody tr.et-main-row td.et-cell-start {
        grid-column: 1 / 2;
        order: 4;
      }

      #eoffice-training-root .eoffice-table tbody tr.et-main-row td.et-cell-end {
        grid-column: 2 / 3;
        order: 5;
      }

      /* Đơn vị tổ chức */
      #eoffice-training-root .eoffice-table tbody tr.et-main-row td.et-cell-org {
        grid-column: 1 / -1;
        order: 6;
      }

      /* Nút thao tác dưới cùng của Card */
      #eoffice-training-root .eoffice-table tbody tr.et-main-row td.et-cell-action {
        grid-column: 1 / -1;
        order: 7;
        padding-top: 8px !important;
        border-top: 1px solid #f1f5f9 !important;
      }

      #eoffice-training-root .eoffice-table tbody tr.et-main-row td.et-cell-action .btn-eoffice {
        width: 100%;
        height: 38px;
      }

      /* Nhãn data-label trên mobile */
      #eoffice-training-root .eoffice-table tbody tr.et-main-row td[data-label]::before {
        content: attr(data-label);
        display: block;
        font-size: 11px;
        font-weight: 600;
        text-transform: uppercase;
        letter-spacing: 0.03em;
        color: #64748b;
        margin-bottom: 4px;
      }

      /* Khung mở rộng PDF trên mobile */
      #eoffice-training-root .eoffice-table tbody tr.et-expand-row {
        display: block;
        margin-top: -10px;
        margin-bottom: 16px;
        border: 1px solid var(--et-primary);
        border-radius: var(--et-radius-lg);
        overflow: hidden;
        box-shadow: var(--et-shadow-md);
      }

      #eoffice-training-root .eoffice-table tbody tr.et-expand-row td {
        display: block;
        width: 100%;
        border: 0 !important;
      }
    }

    @media (max-width: 575px) {
      #eoffice-training-root .et-filter-card {
        padding: 14px;
      }

      #eoffice-training-root .et-col-date-type,
      #eoffice-training-root .et-col-status,
      #eoffice-training-root .et-col-from,
      #eoffice-training-root .et-col-to,
      #eoffice-training-root .et-col-search {
        grid-column: span 12;
      }

      #eoffice-training-root .et-search-group {
        flex-direction: column;
        height: auto;
      }

      #eoffice-training-root .et-search-select {
        width: 100%;
        height: 38px !important;
        border-right: 0 !important;
        border-bottom: 1px solid var(--et-border) !important;
      }

      #eoffice-training-root .et-search-input {
        width: 100%;
        height: 40px !important;
      }

      #eoffice-training-root .et-filter-footer {
        flex-direction: column;
        align-items: stretch;
      }

      #eoffice-training-root .et-filter-actions {
        width: 100%;
      }

      #eoffice-training-root .et-filter-actions .btn-eoffice {
        flex: 1;
      }

      #eoffice-training-root .et-pagination-bar {
        flex-direction: column;
        align-items: center;
        text-align: center;
      }

      #eoffice-training-root .et-page-info {
        justify-content: center;
      }
    }
  </style>

  <!-- Banner Tiêu đề & Thống kê nhanh -->
  
  <!-- Bộ lọc tìm kiếm đa năng -->
  <div class="et-filter-card">
    <div class="et-filter-grid">

      <!-- 1. Loại mốc thời gian -->
      <div class="et-field et-col-date-type">
        <label for="flt-date-type" class="et-label">Mốc thời gian</label>
        <select id="flt-date-type" onchange="applyEofficeFilters()" class="et-control">
          <option value="all" selected>Tất cả thời gian</option>
          <option value="start">Thời gian bắt đầu</option>
          <option value="end">Thời gian kết thúc</option>
        </select>
      </div>

      <!-- 2. Từ ngày -->
      <div class="et-field et-col-from">
        <label for="flt-from-date" class="et-label">Từ ngày</label>
        <input
          type="date"
          id="flt-from-date"
          value="2026-01-01"
          onchange="applyEofficeFilters()"
          class="et-control">
      </div>

      <!-- 3. Đến ngày -->
      <div class="et-field et-col-to">
        <label for="flt-to-date" class="et-label">Đến ngày</label>
        <input
          type="date"
          id="flt-to-date"
          value="2026-12-31"
          onchange="applyEofficeFilters()"
          class="et-control">
      </div>

      <!-- 4. Trạng thái -->
      <div class="et-field et-col-status">
        <label for="flt-status" class="et-label">Trạng thái</label>
        <select id="flt-status" onchange="applyEofficeFilters()" class="et-control">
          <option value="all">Tất cả trạng thái</option>
          <option value="active">Đang hiệu lực</option>
          <option value="expired">Đã hết hạn</option>
        </select>
      </div>

      <!-- 5. Từ khóa tra cứu -->
      <div class="et-field et-col-search">
        <label for="flt-keyword" class="et-label">Tra cứu thông tin</label>
        <div class="et-search-group">
          <select id="search-type" class="et-search-select" aria-label="Tiêu chí tìm kiếm">
            <option value="name">Tên đào tạo</option>
            <option value="code">Mã khóa / Số</option>
            <option value="unit">Đơn vị tổ chức</option>
          </select>
          <input
            type="text"
            id="flt-keyword"
            onkeyup="if(event.key === 'Enter') applyEofficeFilters()"
            placeholder="Nhập tên khóa học, số kế hoạch, đơn vị..."
            class="et-search-input">
        </div>
      </div>

    </div>

    <!-- Chân bộ lọc: Chú thích & Nút thao tác -->
    <div class="et-filter-footer">
      <div class="et-filter-note">
        <svg width="15" height="15" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"/>
        </svg>
        <span>Bấm vào tên chương trình hoặc nút <b>Xem</b> để mở trực tiếp văn bản kế hoạch PDF đính kèm.</span>
      </div>

      <div class="et-filter-actions">
        <button type="button" onclick="resetFilters()" class="btn-eoffice btn-eoffice-secondary" title="Đặt lại bộ lọc mặc định">
          <svg width="15" height="15" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 4v5h.582m15.356 2A8.001 8.001 0 004.582 9m0 0H9m11 11v-5h-.581m0 0a8.003 8.003 0 01-15.357-2m15.357 2H15"/>
          </svg>
          <span>Đặt lại</span>
        </button>

        <button type="button" onclick="applyEofficeFilters()" class="btn-eoffice btn-eoffice-primary" title="Thực hiện lọc dữ liệu">
          <svg width="15" height="15" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2.2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"/>
          </svg>
          <span>Tìm kiếm</span>
        </button>
      </div>
    </div>
  </div>

  <!-- Bảng dữ liệu Đào tạo & Tập huấn -->
  <div class="et-table-card">
    <div class="et-table-scroll">
      <table class="eoffice-table">
        <thead>
          <tr>
            <th style="width: 42px;">
              <input type="checkbox" id="check-all" onchange="toggleSelectAllRows(this.checked)" class="et-checkbox" aria-label="Chọn tất cả">
            </th>
            <th style="width: 46px;" title="Tài liệu đính kèm">
              <svg width="16" height="16" style="margin: 0 auto; display: block;" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15.172 7l-6.586 6.586a2 2 0 102.828 2.828l6.414-6.586a4 4 0 00-5.656-5.656l-6.415 6.585a6 6 0 108.486 8.486L20.5 13"/>
              </svg>
            </th>
            <th style="width: 54px;">STT</th>
            <th style="min-width: 340px; text-align: left; padding-left: 16px;">Tên Đào Tạo &amp; Tập Huấn</th>
            <th style="width: 125px;">Từ Ngày</th>
            <th style="width: 125px;">Đến Ngày</th>
            <th style="width: 130px;">Trạng Thái</th>
            <th style="width: 190px;">Đơn Vị Tổ Chức</th>
            <th style="width: 115px;">Thao Tác</th>
          </tr>
        </thead>
        <tbody id="training-tbody">
          <!-- Render động danh sách các hàng dữ liệu từ JS -->
        </tbody>
      </table>
    </div>
  </div>

  <!-- Thanh Phân trang -->
  <div class="et-pagination-bar">
    <div class="et-page-info">
      <span>Hiển thị</span>
      <select id="page-size" onchange="changePageSize(this.value)" class="et-page-select" aria-label="Số bản ghi mỗi trang">
        <option value="5">5</option>
        <option value="10" selected>10</option>
        <option value="20">20</option>
        <option value="50">50</option>
      </select>
      <span>bản ghi / trang &bull;</span>
      <span>Tổng số: <b id="total-records-count" style="color: #0b57a4;">0</b> khóa đào tạo</span>
    </div>

    <div class="et-page-nav">
      <button type="button" onclick="gotoPage(1)" class="et-page-btn" title="Trang đầu">&laquo;</button>
      <button type="button" onclick="gotoPage(currentPage - 1)" class="et-page-btn" title="Trang trước">&lsaquo;</button>

      <div id="pagination-pages" class="et-page-nav">
        <!-- Số trang sinh tự động -->
      </div>

      <button type="button" onclick="gotoPage(currentPage + 1)" class="et-page-btn" title="Trang sau">&rsaquo;</button>
      <button type="button" onclick="gotoPage(totalPages)" class="et-page-btn" title="Trang cuối">&raquo;</button>
    </div>
  </div>

  <!-- Toast Thông báo -->
  <div id="eoff-toast" class="et-toast" role="status" aria-live="polite">
    <span id="eoff-toast-icon" style="color: #34d399; font-weight: 700;">✓</span>
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
      if (!dateStr) return '—';
      const parts = String(dateStr).split('-');
      if (parts.length !== 3) return dateStr;
      const [y, m, d] = parts;
      return `${d}/${m}/${y}`;
    }

    function updateQuickStats(list) {
      const totalEl = document.getElementById('stat-total-count');
      const activeEl = document.getElementById('stat-active-count');
      const expiredEl = document.getElementById('stat-expired-count');
      const activeCount = list.filter(item => item.status === 'active').length;
      const expiredCount = list.length - activeCount;
      if (totalEl) totalEl.textContent = list.length;
      if (activeEl) activeEl.textContent = activeCount;
      if (expiredEl) expiredEl.textContent = expiredCount;
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
          const nameStr = (item.name || '').toLowerCase();
          const summaryStr = (item.summary || '').toLowerCase();
          const codeStr = (item.code || '').toLowerCase();
          const unitStr = (item.organizer || '').toLowerCase();

          if (searchType === 'name' && !nameStr.includes(keyword) && !summaryStr.includes(keyword)) {
            return false;
          }
          if (searchType === 'code' && !codeStr.includes(keyword)) {
            return false;
          }
          if (searchType === 'unit' && !unitStr.includes(keyword)) {
            return false;
          }
        }

        return true;
      });

      currentPage = 1;
      updateQuickStats(currentData);
      renderTable();
      showToast(`Đã lọc: Tìm thấy ${currentData.length} khóa đào tạo`);
    }

    function resetFilters() {
      document.getElementById('flt-date-type').value = 'all';
      document.getElementById('flt-from-date').value = '2026-01-01';
      document.getElementById('flt-to-date').value = '2026-12-31';
      document.getElementById('flt-status').value = 'all';
      document.getElementById('search-type').value = 'name';
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
      if (box) box.classList.toggle('hidden');
    }

    // =========================================================================
    // RENDER BẢNG DỮ LIỆU CHUẨN EOFFICE VỚI EXPANDED PDF VIEWER
    // =========================================================================
    function renderTable() {
      const tbody = document.getElementById('training-tbody');
      const totalCountEl = document.getElementById('total-records-count');
      if (!tbody) return;

      if (totalCountEl) totalCountEl.textContent = currentData.length;
      totalPages = Math.max(1, Math.ceil(currentData.length / pageSize));

      const startIndex = (currentPage - 1) * pageSize;
      const pageRows = currentData.slice(startIndex, startIndex + pageSize);

      if (pageRows.length === 0) {
        tbody.innerHTML = `
          <tr>
            <td colspan="9" style="text-align: center; padding: 42px 20px; color: #64748b; background: #ffffff; border-radius: 12px;">
              <div style="font-weight: 600; font-size: 15px; color: #334155; margin-bottom: 4px;">Không tìm thấy chương trình đào tạo phù hợp</div>
              <div style="font-size: 13px;">Vui lòng thử điều chỉnh lại khoảng thời gian hoặc từ khóa tìm kiếm.</div>
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
        const statusBadge = row.status === 'active'
          ? `<span class="badge-status badge-status-active"><span class="et-dot et-dot-active"></span>Hiệu lực</span>`
          : `<span class="badge-status badge-status-expired"><span class="et-dot et-dot-expired"></span>Đã hết</span>`;

        // Các nhãn phụ nếu có
        const codePill = row.code ? `<span class="et-code-pill">${row.code}</span>` : '';
        const formPill = row.trainingForm ? `<span class="et-tag-pill">${row.trainingForm}</span>` : '';
        const cmePill = row.certificateType ? `<span class="et-tag-pill">${row.certificateType}</span>` : '';

        html += `
          <!-- HÀNG CHÍNH DỮ LIỆU KHÓA ĐÀO TẠO -->
          <tr class="et-main-row ${isSelected ? 'selected-row' : ''}" id="row-${row.id}">

            <!-- Checkbox -->
            <td class="et-cell-check" style="text-align: center;">
              <input
                type="checkbox"
                ${isSelected ? 'checked' : ''}
                onchange="toggleSelectRow(${row.id}, this.checked)"
                class="et-checkbox"
                aria-label="Chọn dòng ${rowNum}">
            </td>

            <!-- Icon kẹp ghim -->
            <td class="et-cell-clip" style="text-align: center;">
              <button
                type="button"
                onclick="toggleInlinePdfRow(${row.id})"
                class="et-clip-btn ${isExpanded ? 'is-active' : ''}"
                title="Bấm để mở tệp văn bản đính kèm">
                <svg width="16" height="16" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15.172 7l-6.586 6.586a2 2 0 102.828 2.828l6.414-6.586a4 4 0 00-5.656-5.656l-6.415 6.585a6 6 0 108.486 8.486L20.5 13"/>
                </svg>
              </button>
            </td>

            <!-- STT (#) -->
            <td class="et-cell-stt" style="text-align: center;">
              <span class="et-stt-badge">#${rowNum}</span>
            </td>

            <!-- TÊN ĐÀO TẠO & TẬP HUẤN -->
            <td class="et-cell-title" style="padding-left: 16px;">
              <div class="et-title-cell">
                ${(codePill || formPill || cmePill) ? `<div class="et-meta-row">${codePill}${formPill}${cmePill}</div>` : ''}
                <a
                  href="javascript:void(0)"
                  onclick="toggleInlinePdfRow(${row.id})"
                  class="et-course-link">
                  ${row.name}
                </a>
                ${row.summary ? `<div class="et-course-summary">${row.summary}</div>` : ''}
              </div>
            </td>

            <!-- THỜI GIAN: TỪ NGÀY -->
            <td class="et-cell-start" data-label="Từ ngày" style="text-align: center;">
              <span class="et-date-badge">${formatDateVN(row.startDate)}</span>
            </td>

            <!-- THỜI GIAN: ĐẾN NGÀY -->
            <td class="et-cell-end" data-label="Đến ngày" style="text-align: center;">
              <span class="et-date-badge">${formatDateVN(row.endDate)}</span>
            </td>

            <!-- TRẠNG THÁI -->
            <td class="et-cell-status" style="text-align: center;">
              ${statusBadge}
            </td>

            <!-- ĐƠN VỊ TỔ CHỨC -->
            <td class="et-cell-org" data-label="Đơn vị tổ chức">
              <div class="et-organizer">${row.organizer || '—'}</div>
            </td>

            <!-- CỘT THAO TÁC -->
            <td class="et-cell-action" style="text-align: center;">
              <button
                type="button"
                onclick="toggleInlinePdfRow(${row.id})"
                class="btn-eoffice btn-eoffice-sm ${isExpanded ? 'btn-eoffice-secondary' : 'btn-eoffice-primary'}"
                title="${isExpanded ? 'Bấm để thu gọn văn bản' : 'Bấm để mở xem văn bản đính kèm'}">
                <svg width="14" height="14" fill="none" stroke="currentColor" viewBox="0 0 24 24">
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
            <tr class="et-expand-row">
              <td colspan="9">
                <div class="et-pdf-toolbar">
                  <div class="et-file-info">
                    <span class="et-file-icon">
                      <svg width="18" height="18" viewBox="0 0 24 24" fill="currentColor">
                        <path d="M7 2a2 2 0 00-2 2v16a2 2 0 002 2h10a2 2 0 002-2V8.828a2 2 0 00-.586-1.414l-4.828-4.828A2 2 0 0012.172 2H7zm5 1.5V8a1 1 0 001 1h4.5L12 3.5z"/>
                      </svg>
                    </span>
                    <div class="et-file-meta">
                      <span class="et-file-name">${row.fileName || 'Tài liệu đính kèm.pdf'}</span>
                      <span class="et-file-sub">(Người gửi: ${row.fileSender || 'Phòng KHTH'} &bull; ${row.fileSize || 'PDF'})</span>
                    </div>
                  </div>

                  <div class="et-pdf-actions">
                    <button
                      type="button"
                      onclick="toggleInlinePdfViewer(${row.id})"
                      id="btn-view-toggle-${row.id}"
                      class="btn-eoffice btn-eoffice-sm btn-eoffice-primary">
                      <svg width="14" height="14" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"/>
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z"/>
                      </svg>
                      <span id="txt-view-toggle-${row.id}">Ẩn văn bản</span>
                    </button>

                    <a
                      href="${row.fileUrl || '#'}"
                      download="${row.fileName || ''}"
                      onclick="showToast('Đang tải xuống: ${row.fileName || 'tệp đính kèm'}')"
                      class="btn-eoffice btn-eoffice-sm btn-eoffice-orange">
                      <svg width="14" height="14" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-4l-4 4m0 0l-4-4m4 4V4"/>
                      </svg>
                      <span>Tải về</span>
                    </a>

                    <button
                      type="button"
                      onclick="toggleInlinePdfRow(${row.id})"
                      class="btn-eoffice btn-eoffice-sm btn-eoffice-secondary"
                      title="Đóng khung xem văn bản">
                      ✕
                    </button>
                  </div>
                </div>

                <div id="pdf-viewer-box-${row.id}" class="et-pdf-viewer-box">
                  <div class="et-pdf-statusbar">
                    <span style="color: #34d399; font-family: monospace;">● Trình xem văn bản Kế hoạch Đào tạo đính kèm (${row.code || 'PDF'})</span>
                    <button
                      type="button"
                      data-url="${row.fileUrl || ''}"
                      onclick="if(this.dataset.url) window.open(this.dataset.url, '_blank')"
                      style="background: transparent; border: 0; color: #93c5fd; text-decoration: underline; font-size: 12px; cursor: pointer;">
                      Mở trong tab mới ↗
                    </button>
                  </div>
                  <div class="et-pdf-frame-wrap">
                    <iframe
                      src="${row.fileUrl ? row.fileUrl + '#toolbar=1' : 'about:blank'}"
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
      const checkAllEl = document.getElementById('check-all');
      if (checkAllEl) {
        checkAllEl.checked = selectedRowIds.size === currentData.length && currentData.length > 0;
      }
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
          html += `<span class="et-page-btn is-active">${p}</span>`;
        } else {
          html += `<button type="button" onclick="gotoPage(${p})" class="et-page-btn">${p}</button>`;
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
      toast.classList.add('is-visible');
      setTimeout(() => {
        toast.classList.remove('is-visible');
      }, 2800);
    }

    // Khởi tạo bảng ban đầu
    applyEofficeFilters();
  </script>

</div>
<?php require_once 'home-footer.php'; ?>
