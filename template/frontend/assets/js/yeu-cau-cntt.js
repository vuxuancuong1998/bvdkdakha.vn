/**
 * YÊU CẦU CNTT - Main JavaScript
 * Handles multi-step form, validation, file upload, and table filtering.
 */

document.addEventListener('DOMContentLoaded', () => {
  'use strict';

  // --- 1. MULTI-STEP FORM NAVIGATION ---
  const form = document.getElementById('cntt-form');
  const steps = [
    document.getElementById('step-1'),
    document.getElementById('step-2'),
    document.getElementById('step-3')
  ];
  const stepIndicators = [
    document.getElementById('step-indicator-1'),
    document.getElementById('step-indicator-2'),
    document.getElementById('step-indicator-3')
  ];
  const stepperBar = document.getElementById('stepper-bar');

  const btnStep1Next = document.getElementById('btn-step1-next');
  const btnStep2Prev = document.getElementById('btn-step2-prev');
  const btnStep2Next = document.getElementById('btn-step2-next');
  const btnStep3Prev = document.getElementById('btn-step3-prev');
  const btnSubmitOpen = document.getElementById('btn-submit-open');

  let currentStep = 0;

  function updateStepUI() {
    // Show current step, hide others
    steps.forEach((step, index) => {
      if (index === currentStep) {
        step.hidden = false;
        step.classList.add('active');
      } else {
        step.hidden = true;
        step.classList.remove('active');
      }
    });

    // Update stepper indicators
    stepIndicators.forEach((indicator, index) => {
      indicator.classList.remove('active', 'completed');
      indicator.removeAttribute('aria-current');
      if (index === currentStep) {
        indicator.classList.add('active');
        indicator.setAttribute('aria-current', 'step');
      } else if (index < currentStep) {
        indicator.classList.add('completed');
      }
    });

    // Update progress bar width
    // 0 -> 0%, 1 -> 50%, 2 -> 100%
    const progress = (currentStep / (steps.length - 1)) * 100;
    stepperBar.style.width = `${progress}%`;

    // Scroll to top of form smoothly on step change
    if (currentStep > 0) {
      document.querySelector('.cntt-form-section').scrollIntoView({ behavior: 'smooth', block: 'start' });
    }
  }

  // Next/Prev Buttons
  btnStep1Next.addEventListener('click', () => {
    if (validateStep(1)) {
      currentStep = 1;
      updateStepUI();
    }
  });

  btnStep2Prev.addEventListener('click', () => {
    currentStep = 0;
    updateStepUI();
  });

  btnStep2Next.addEventListener('click', () => {
    if (validateStep(2)) {
      populateReview();
      currentStep = 2;
      updateStepUI();
    }
  });

  btnStep3Prev.addEventListener('click', () => {
    currentStep = 1;
    updateStepUI();
  });


  // --- 2. VALIDATION LOGIC ---
  function validateStep(stepNum) {
    let isValid = true;
    const requiredFields = steps[stepNum - 1].querySelectorAll('[aria-required="true"]');
    
    // Clear old errors in this step
    steps[stepNum - 1].querySelectorAll('.field-error').forEach(el => el.textContent = '');
    steps[stepNum - 1].querySelectorAll('.form-control').forEach(el => el.classList.remove('invalid', 'valid'));
    // Radio priority group special case
    const priorityGroup = document.getElementById('priority-group');
    if (priorityGroup) {
       priorityGroup.classList.remove('invalid');
       document.getElementById('err-mucdo').textContent = '';
    }

    requiredFields.forEach(field => {
      let fieldValid = true;
      let errorMsg = '';

      if (field.tagName === 'INPUT' || field.tagName === 'SELECT' || field.tagName === 'TEXTAREA') {
        const val = field.value.trim();
        
        if (!val) {
          fieldValid = false;
          errorMsg = 'Trường này là bắt buộc.';
        } else {
          // Specific format validations
          if (field.type === 'tel') {
            const phoneRegex = /^(0|\+84)[3|5|7|8|9][0-9]{8}$/;
            if (!phoneRegex.test(val.replace(/\s+/g, ''))) {
              fieldValid = false;
              errorMsg = 'Số điện thoại không hợp lệ.';
            }
          } else if (field.type === 'email') {
             const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
             if (!emailRegex.test(val)) {
                fieldValid = false;
                errorMsg = 'Email không hợp lệ.';
             }
          }
        }

        if (!fieldValid) {
          isValid = false;
          field.classList.add('invalid');
          const errEl = document.getElementById(`err-${field.name}`);
          if (errEl) errEl.textContent = errorMsg;
        } else {
           field.classList.add('valid');
        }
      }
      
      // Radio group validation (Priority)
      if (field.getAttribute('role') === 'radiogroup') {
         const checkedRadio = field.querySelector('input[type="radio"]:checked');
         if (!checkedRadio) {
             isValid = false;
             field.classList.add('invalid');
             const errEl = document.getElementById('err-mucdo');
             if(errEl) errEl.textContent = 'Vui lòng chọn mức độ ưu tiên.';
         }
      }
    });

    return isValid;
  }
  
  // Real-time validation clear on input
  form.addEventListener('input', (e) => {
      if (e.target.classList.contains('form-control') || e.target.type === 'radio') {
          e.target.classList.remove('invalid');
          if (e.target.type !== 'radio') e.target.classList.remove('valid');
          
          let errId = `err-${e.target.name}`;
          const errEl = document.getElementById(errId);
          if (errEl) errEl.textContent = '';
          
          if(e.target.name === 'mucdo') {
              document.getElementById('err-mucdo').textContent = '';
          }
      }
  });


  // --- 3. TEXTAREA CHIPS & CHAR COUNTER ---
  const titleInput = document.getElementById('f-tieude');
  const titleCounter = document.getElementById('counter-tieude');
  const descInput = document.getElementById('f-mota');
  const chips = document.querySelectorAll('.chip-btn');

  if (titleInput && titleCounter) {
    titleInput.addEventListener('input', () => {
      const len = titleInput.value.length;
      titleCounter.textContent = `${len} / 120`;
      
      titleCounter.classList.remove('warn', 'over');
      if (len > 100 && len <= 120) titleCounter.classList.add('warn');
      if (len > 120) titleCounter.classList.add('over'); // Should be prevented by maxlength though
    });
  }

  chips.forEach(chip => {
    chip.addEventListener('click', () => {
      const textToInsert = chip.getAttribute('data-insert');
      const start = descInput.selectionStart;
      const end = descInput.selectionEnd;
      const text = descInput.value;
      
      descInput.value = text.substring(0, start) + textToInsert + text.substring(end);
      descInput.focus();
      descInput.selectionStart = descInput.selectionEnd = start + textToInsert.length;
      
      // Trigger input event to clear validation errors
      descInput.dispatchEvent(new Event('input'));
    });
  });


  // --- 4. FILE UPLOAD LOGIC ---
  const fileInput = document.getElementById('f-files');
  const uploadArea = document.getElementById('upload-area');
  const uploadPlaceholder = document.getElementById('upload-placeholder');
  const uploadPreview = document.getElementById('upload-preview');
  const errFiles = document.getElementById('err-files');
  const uploadBrowseBtn = document.getElementById('upload-browse');
  
  let selectedFiles = [];
  const MAX_FILES = 5;
  const MAX_SIZE_MB = 10;
  
  // Forward click from browse button to actual file input
  if (uploadBrowseBtn) {
      uploadBrowseBtn.addEventListener('click', (e) => {
          e.preventDefault();
          e.stopPropagation();
          fileInput.click();
      });
  }

  // Drag and Drop
  ['dragenter', 'dragover', 'dragleave', 'drop'].forEach(eventName => {
    uploadArea.addEventListener(eventName, preventDefaults, false);
  });

  function preventDefaults(e) {
    e.preventDefault();
    e.stopPropagation();
  }

  ['dragenter', 'dragover'].forEach(eventName => {
    uploadArea.addEventListener(eventName, () => uploadArea.classList.add('drag-over'), false);
  });

  ['dragleave', 'drop'].forEach(eventName => {
    uploadArea.addEventListener(eventName, () => uploadArea.classList.remove('drag-over'), false);
  });

  uploadArea.addEventListener('drop', (e) => {
    const dt = e.dataTransfer;
    const files = dt.files;
    handleFiles(files);
  });

  fileInput.addEventListener('change', function() {
    handleFiles(this.files);
  });

  function handleFiles(files) {
    errFiles.textContent = '';
    const newFiles = Array.from(files);
    
    // Check total files
    if (selectedFiles.length + newFiles.length > MAX_FILES) {
       errFiles.textContent = `Chỉ được tải lên tối đa ${MAX_FILES} tệp.`;
       return;
    }

    // Filter valid files
    const validFiles = newFiles.filter(file => {
      const ext = file.name.split('.').pop().toLowerCase();
      const validExts = ['jpg', 'jpeg', 'png', 'gif', 'pdf', 'doc', 'docx', 'xls', 'xlsx'];
      
      if (!validExts.includes(ext)) {
        errFiles.textContent = `Tệp ${file.name} không đúng định dạng cho phép.`;
        return false;
      }
      
      if (file.size > MAX_SIZE_MB * 1024 * 1024) {
        errFiles.textContent = `Tệp ${file.name} vượt quá dung lượng ${MAX_SIZE_MB}MB.`;
        return false;
      }
      
      return true;
    });

    selectedFiles = [...selectedFiles, ...validFiles];
    renderPreviews();
  }

  function renderPreviews() {
    uploadPreview.innerHTML = '';
    
    if (selectedFiles.length > 0) {
      uploadPlaceholder.hidden = true;
      uploadPreview.hidden = false;
      
      selectedFiles.forEach((file, index) => {
        const li = document.createElement('li');
        li.className = 'upload-file-item';
        
        // Thumbnail logic
        let thumbHtml = '';
        if (file.type.startsWith('image/')) {
           const url = URL.createObjectURL(file);
           thumbHtml = `<div class="file-thumb"><img src="${url}" alt="${file.name}"></div>`;
        } else {
           let icon = '📄';
           if(file.name.endsWith('.pdf')) icon = '📕';
           else if(file.name.includes('.doc')) icon = '📘';
           else if(file.name.includes('.xls')) icon = '📗';
           thumbHtml = `<div class="file-thumb-icon">${icon}</div>`;
        }

        const sizeKb = (file.size / 1024).toFixed(1);
        const sizeStr = sizeKb > 1024 ? (sizeKb/1024).toFixed(2) + ' MB' : sizeKb + ' KB';

        li.innerHTML = `
          ${thumbHtml}
          <div class="file-info">
            <span class="file-name" title="${file.name}">${file.name}</span>
            <span class="file-size">${sizeStr}</span>
          </div>
          <button type="button" class="file-remove" data-index="${index}" aria-label="Xóa ${file.name}">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><line x1="18" y1="6" x2="6" y2="18"/><line x1="6" y1="6" x2="18" y2="18"/></svg>
          </button>
        `;
        uploadPreview.appendChild(li);
      });
      
      // Bind remove buttons
      document.querySelectorAll('.file-remove').forEach(btn => {
         btn.addEventListener('click', (e) => {
             e.stopPropagation();
             const idx = parseInt(btn.getAttribute('data-index'));
             selectedFiles.splice(idx, 1);
             renderPreviews();
         });
      });
      
    } else {
      uploadPlaceholder.hidden = false;
      uploadPreview.hidden = true;
      // Clear input so same file can be selected again
      fileInput.value = '';
    }
  }


  // --- 5. POPULATE REVIEW (Step 3) ---
  function populateReview() {
    const rPerson = document.getElementById('review-person');
    const rIssue = document.getElementById('review-issue');
    const rDesc = document.getElementById('review-desc');
    const rFilesWrap = document.getElementById('review-files-wrap');
    const rFiles = document.getElementById('review-files');
    
    // Get text from selects
    const khoaSelect = document.getElementById('f-khoa');
    const khoaText = khoaSelect.options[khoaSelect.selectedIndex].text;
    
    const chucvuSelect = document.getElementById('f-chucvu');
    const chucvuText = chucvuSelect.value ? chucvuSelect.options[chucvuSelect.selectedIndex].text : 'Không xác định';

    const loaiSelect = document.getElementById('f-loaiyc');
    const loaiText = loaiSelect.options[loaiSelect.selectedIndex].text.replace(/^[^\s]+\s/, ''); // Remove emoji

    const hethongSelect = document.getElementById('f-hethong');
    const hethongText = hethongSelect.options[hethongSelect.selectedIndex].text;

    // Get priority
    const priorityRadio = document.querySelector('input[name="mucdo"]:checked');
    let priorityText = 'Chưa xác định';
    if(priorityRadio) {
        if(priorityRadio.value === 'thap') priorityText = 'Thấp';
        else if(priorityRadio.value === 'trung-binh') priorityText = 'Trung bình';
        else if(priorityRadio.value === 'cao') priorityText = 'Cao';
        else if(priorityRadio.value === 'khan-cap') priorityText = 'Khẩn cấp';
    }

    rPerson.innerHTML = `
      <div class="review-row"><dt class="review-dt">Khoa / Phòng</dt><dd class="review-dd">${khoaText}</dd></div>
      <div class="review-row"><dt class="review-dt">Họ và tên</dt><dd class="review-dd">${document.getElementById('f-hoten').value}</dd></div>
      <div class="review-row"><dt class="review-dt">Chức vụ</dt><dd class="review-dd">${chucvuText}</dd></div>
      <div class="review-row"><dt class="review-dt">Số điện thoại</dt><dd class="review-dd">${document.getElementById('f-sdt').value}</dd></div>
      <div class="review-row"><dt class="review-dt">Email</dt><dd class="review-dd">${document.getElementById('f-email').value || 'Không có'}</dd></div>
    `;

    const thoigian = document.getElementById('f-thoigian').value;
    let timeStr = 'Không rõ';
    if(thoigian) {
        const d = new Date(thoigian);
        timeStr = d.toLocaleString('vi-VN', {hour: '2-digit', minute:'2-digit', day: '2-digit', month: '2-digit', year: 'numeric'});
    }

    rIssue.innerHTML = `
      <div class="review-row"><dt class="review-dt">Loại sự cố</dt><dd class="review-dd">${loaiText}</dd></div>
      <div class="review-row"><dt class="review-dt">Hệ thống</dt><dd class="review-dd">${hethongText}</dd></div>
      <div class="review-row"><dt class="review-dt">Mức ưu tiên</dt><dd class="review-dd"><span class="prio-badge prio-${priorityRadio ? priorityRadio.value : 'tb'}">${priorityText}</span></dd></div>
      <div class="review-row"><dt class="review-dt">Tiêu đề</dt><dd class="review-dd"><strong>${document.getElementById('f-tieude').value}</strong></dd></div>
      <div class="review-row"><dt class="review-dt">Vị trí/Thiết bị</dt><dd class="review-dd">${document.getElementById('f-vitri').value || 'Không rõ'}</dd></div>
      <div class="review-row"><dt class="review-dt">Thời điểm</dt><dd class="review-dd">${timeStr}</dd></div>
    `;

    rDesc.textContent = document.getElementById('f-mota').value;

    if (selectedFiles.length > 0) {
       rFilesWrap.hidden = false;
       rFiles.innerHTML = selectedFiles.map(f => {
           let icon = `<svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" style="width:14px;height:14px"><path d="M21 15v4a2 2 0 01-2 2H5a2 2 0 01-2-2v-4"/><polyline points="17 8 12 3 7 8"/><line x1="12" y1="3" x2="12" y2="15"/></svg>`;
           return `<li class="review-file-badge">${icon} ${f.name}</li>`;
       }).join('');
    } else {
       rFilesWrap.hidden = true;
    }
  }


  // --- 6. DIALOG CONFIRMATION ---
  const confirmDialog = document.getElementById('confirm-dialog');
  const dialogCancel = document.getElementById('dialog-cancel');
  const dialogConfirm = document.getElementById('dialog-confirm');
  const priorityNotice = document.getElementById('dialog-priority-notice');
  const successOverlay = document.getElementById('success-overlay');

  btnSubmitOpen.addEventListener('click', () => {
     // Check if urgent
     const priorityRadio = document.querySelector('input[name="mucdo"]:checked');
     if(priorityRadio && priorityRadio.value === 'khan-cap') {
         priorityNotice.hidden = false;
     } else {
         priorityNotice.hidden = true;
     }
     confirmDialog.showModal();
  });

  dialogCancel.addEventListener('click', () => {
     confirmDialog.close();
  });

  dialogConfirm.addEventListener('click', () => {
      // Fake submit process
      confirmDialog.close();
      
      // Show success overlay
      successOverlay.hidden = false;
      document.body.style.overflow = 'hidden'; // prevent scrolling behind
  });

  // Handle new request reset
  document.getElementById('btn-new-request').addEventListener('click', () => {
      successOverlay.hidden = true;
      document.body.style.overflow = '';
      
      form.reset();
      selectedFiles = [];
      renderPreviews();
      
      // Reset chips/counters
      if(titleCounter) titleCounter.textContent = '0 / 120';
      
      // Go back to step 1
      currentStep = 0;
      updateStepUI();
  });


  // --- 7. TABLE FILTERING TABS ---
  const tableTabs = document.querySelectorAll('.table-filter-tabs .tab-btn');
  const tableRows = document.querySelectorAll('#requests-tbody tr');

  tableTabs.forEach(tab => {
    tab.addEventListener('click', () => {
       // Update active state
       tableTabs.forEach(t => {
           t.classList.remove('active');
           t.setAttribute('aria-selected', 'false');
       });
       tab.classList.add('active');
       tab.setAttribute('aria-selected', 'true');

       const filter = tab.getAttribute('data-filter');

       // Filter rows
       tableRows.forEach(row => {
          if (filter === 'all' || row.getAttribute('data-filter') === filter) {
              row.hidden = false;
          } else {
              row.hidden = true;
          }
       });
    });
  });

});
