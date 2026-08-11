<?php require_once 'header.php'; ?>
<?php require_once 'menu.php'; ?>

<!-- Google Font, FontAwesome 6, SweetAlert2 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:wght@400;500;600;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<style>
/* Reset & Scope Styles for Lay Giay TT25 Page */
.tt25-page-wrapper {
  font-family: 'Be Vietnam Pro', -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
  background-color: #f8fafc;
  color: #0f172a;
  line-height: 1.5;
  padding-bottom: 60px;
}

/* Hero Section Banner */
.tt25-banner {
  background: linear-gradient(135deg, #0284c7 0%, #0369a1 45%, #0f766e 100%);
  padding: 40px 0 35px;
  color: #ffffff;
  position: relative;
  box-shadow: 0 4px 20px rgba(2, 132, 199, 0.15);
}

.tt25-banner-container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 20px;
}

.tt25-breadcrumb {
  display: flex;
  align-items: center;
  gap: 8px;
  font-size: 13px;
  color: rgba(255, 255, 255, 0.85);
  margin-bottom: 12px;
  list-style: none;
  padding: 0;
}

.tt25-breadcrumb a {
  color: rgba(255, 255, 255, 0.95);
  text-decoration: none;
}

.tt25-breadcrumb a:hover {
  text-decoration: underline;
}

.tt25-badge {
  display: inline-flex;
  align-items: center;
  gap: 6px;
  background: rgba(255, 255, 255, 0.18);
  border: 1px solid rgba(255, 255, 255, 0.3);
  padding: 4px 14px;
  border-radius: 20px;
  font-size: 12px;
  font-weight: 700;
  text-transform: uppercase;
  letter-spacing: 0.5px;
  margin-bottom: 10px;
}

.tt25-title {
  font-size: clamp(1.75rem, 3vw, 2.3rem);
  font-weight: 800;
  margin-bottom: 8px;
  line-height: 1.25;
}

.tt25-subtitle {
  font-size: 15px;
  color: rgba(255, 255, 255, 0.92);
  max-width: 700px;
  margin: 0;
}

/* Form Container Layout */
.tt25-main-container {
  max-width: 960px;
  margin: -25px auto 0;
  padding: 0 15px;
  position: relative;
  z-index: 10;
}

.tt25-card {
  background: #ffffff;
  border-radius: 16px;
  border: 1px solid #cbd5e1;
  box-shadow: 0 10px 30px rgba(15, 23, 42, 0.08);
  overflow: hidden;
}

.tt25-card-header {
  background: linear-gradient(135deg, #0284c7 0%, #0d9488 100%);
  padding: 24px 30px;
  color: #ffffff;
  display: flex;
  align-items: center;
  gap: 16px;
}

.tt25-header-icon {
  width: 50px;
  height: 50px;
  border-radius: 12px;
  background: #ffffff;
  color: #0284c7;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 22px;
  flex-shrink: 0;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

.tt25-card-body {
  padding: 32px 30px;
}

@media (max-width: 576px) {
  .tt25-card-body {
    padding: 24px 16px;
  }
  .tt25-card-header {
    padding: 20px 18px;
  }
}

/* 2 Column Grid System for Form */
.tt25-form-grid {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  gap: 22px 24px;
}

@media (max-width: 768px) {
  .tt25-form-grid {
    grid-template-columns: 1fr;
    gap: 18px;
  }
}

.tt25-form-group {
  display: flex;
  flex-direction: column;
}

.tt25-form-group.full-width {
  grid-column: 1 / -1;
}

.tt25-label {
  font-size: 14px;
  font-weight: 700;
  color: #1e293b;
  margin-bottom: 7px;
  display: flex;
  align-items: center;
  gap: 4px;
}

.tt25-label .required {
  color: #ef4444;
}

/* Custom Input Field with Prefix Icon */
.tt25-input-wrapper {
  position: relative;
  display: flex;
  align-items: center;
}

.tt25-input-icon {
  position: absolute;
  left: 14px;
  color: #64748b;
  font-size: 15px;
  pointer-events: none;
  transition: color 0.2s ease;
}

.tt25-input,
.tt25-select {
  width: 100%;
  padding: 12px 14px 12px 42px;
  font-size: 14.5px;
  font-family: inherit;
  font-weight: 500;
  color: #0f172a;
  background-color: #ffffff;
  border: 1.5px solid #cbd5e1;
  border-radius: 10px;
  outline: none;
  transition: border-color 0.2s ease, box-shadow 0.2s ease;
}

.tt25-input::placeholder {
  color: #94a3b8;
  font-weight: 400;
}

.tt25-input:focus,
.tt25-select:focus {
  border-color: #0284c7;
  box-shadow: 0 0 0 3px rgba(2, 132, 199, 0.15);
}

.tt25-input-wrapper:focus-within .tt25-input-icon {
  color: #0284c7;
}

/* Mandatory Email Warning Box */
.tt25-email-warning-box {
  grid-column: 1 / -1;
  background: #fef2f2;
  border: 1.5px dashed #fca5a5;
  border-radius: 10px;
  padding: 14px 18px;
  display: flex;
  align-items: center;
  gap: 12px;
  color: #991b1b;
  margin-top: -6px;
}

.tt25-email-warning-box i {
  font-size: 20px;
  color: #ef4444;
  flex-shrink: 0;
}

.tt25-email-warning-text {
  font-size: 13.5px;
  font-weight: 600;
  line-height: 1.4;
}

/* Submit Button & Actions */
.tt25-submit-area {
  grid-column: 1 / -1;
  text-align: center;
  margin-top: 15px;
  padding-top: 10px;
}

.tt25-btn-submit {
  background: linear-gradient(135deg, #0284c7 0%, #0369a1 100%);
  color: #ffffff;
  border: none;
  border-radius: 30px;
  padding: 14px 42px;
  font-size: 16px;
  font-weight: 700;
  font-family: inherit;
  cursor: pointer;
  box-shadow: 0 8px 20px rgba(2, 132, 199, 0.3);
  transition: all 0.25s ease;
  display: inline-flex;
  align-items: center;
  gap: 8px;
}

.tt25-btn-submit:hover {
  transform: translateY(-2px);
  box-shadow: 0 12px 25px rgba(2, 132, 199, 0.4);
  background: linear-gradient(135deg, #0369a1 0%, #0284c7 100%);
}

.tt25-btn-submit:disabled {
  opacity: 0.7;
  cursor: not-allowed;
  transform: none;
}

/* Alert Boxes */
.tt25-alert {
  padding: 16px 20px;
  border-radius: 12px;
  margin-bottom: 24px;
  display: flex;
  align-items: center;
  gap: 12px;
  font-size: 14px;
  font-weight: 600;
}

.tt25-alert-success {
  background: #ecfdf5;
  border: 1px solid #a7f3d0;
  border-left: 5px solid #10b981;
  color: #065f46;
}

.tt25-alert-danger {
  background: #fef2f2;
  border: 1px solid #fecaca;
  border-left: 5px solid #ef4444;
  color: #991b1b;
}
</style>

<div class="tt25-page-wrapper">
  
  <!-- Banner Section -->
  <section class="tt25-banner">
    <div class="tt25-banner-container">
      
      <ul class="tt25-breadcrumb">
        <li><a href="<?php echo XC_URL; ?>"><i class="fa-solid fa-house"></i> Trang chủ</a></li>
        <li>/</li>
        <li style="color: #ffffff; font-weight: 600;">Lấy giấy TT25</li>
      </ul>

      <div class="tt25-badge">
        <i class="fa-solid fa-file-medical"></i> Thông tư 25/BYT
      </div>
      <h1 class="tt25-title">Đăng Ký Lấy Giấy Tờ TT25/BYT</h1>
      <p class="tt25-subtitle">Hệ thống tiếp nhận yêu cầu cấp phát giấy chứng nhận y tế điện tử chính thức cho bệnh nhân Bệnh viện đa khoa khu vực Đắk Hà.</p>

    </div>
  </section>

  <!-- Form Section -->
  <div class="tt25-main-container">
    <div class="tt25-card">
      
      <!-- Card Header -->
      <div class="tt25-card-header">
        <div class="tt25-header-icon">
          <i class="fa-solid fa-file-signature"></i>
        </div>
        <div>
          <h3 style="margin: 0 0 4px 0; font-size: 18px; font-weight: 800; color: #ffffff;">Yêu cầu cấp giấy tờ TT25/BYT</h3>
          <p style="margin: 0; font-size: 13.5px; opacity: 0.9; color: #ffffff;">Vui lòng nhập chính xác thông tin để bệnh viện xử lý trong 24h</p>
        </div>
      </div>

      <!-- Card Body -->
      <div class="tt25-card-body">

        <!-- Success Alert -->
        <div id="tt25SuccessAlert" class="tt25-alert tt25-alert-success" style="display: <?php echo !empty($success_message) ? 'flex' : 'none'; ?>;">
          <i class="fa-solid fa-circle-check fs-5 text-success"></i>
          <div id="tt25SuccessText">
            <?php echo !empty($success_message) ? htmlspecialchars($success_message) : 'Hệ thống đã tiếp nhận yêu cầu; Vui lòng kiểm tra thư mục email trong 24h.'; ?>
          </div>
        </div>

        <!-- Error Alert -->
        <div id="tt25ErrorAlert" class="tt25-alert tt25-alert-danger" style="display: <?php echo !empty($error_message) ? 'flex' : 'none'; ?>;">
          <i class="fa-solid fa-triangle-exclamation fs-5 text-danger"></i>
          <div id="tt25ErrorText">
            <?php echo !empty($error_message) ? $error_message : ''; ?>
          </div>
        </div>

        <!-- Form 2 Cột -->
        <form id="tt25RequestForm" method="POST" action="<?php echo XC_URL; ?>/lay-giay-tt25">
          <input type="hidden" name="is_ajax" value="1">

          <div class="tt25-form-grid">
            
            <!-- CỘT 1 - HÀNG 1: Họ và tên -->
            <div class="tt25-form-group">
              <label for="fullname" class="tt25-label">
                Họ và tên bệnh nhân <span class="required">*</span>
              </label>
              <div class="tt25-input-wrapper">
                <i class="fa-solid fa-user tt25-input-icon"></i>
                <input type="text" class="tt25-input" id="fullname" name="fullname" placeholder="Nhập đầy đủ họ và tên" required>
              </div>
            </div>

            <!-- CỘT 2 - HÀNG 1: Số CCCD -->
            <div class="tt25-form-group">
              <label for="cccd" class="tt25-label">
                Số CCCD / CMND <span class="required">*</span>
              </label>
              <div class="tt25-input-wrapper">
                <i class="fa-solid fa-id-card tt25-input-icon"></i>
                <input type="text" class="tt25-input" id="cccd" name="cccd" placeholder="Nhập số CCCD (đúng 12 chữ số)" maxlength="12" pattern="\d{12}" required>
              </div>
            </div>

            <!-- CỘT 1 - HÀNG 2: Ngày tháng năm sinh -->
            <div class="tt25-form-group">
              <label for="dob" class="tt25-label">
                Ngày tháng năm sinh <span class="required">*</span>
              </label>
              <div class="tt25-input-wrapper">
                <i class="fa-solid fa-calendar-days tt25-input-icon"></i>
                <input type="date" class="tt25-input" id="dob" name="dob" required>
              </div>
            </div>

            <!-- CỘT 2 - HÀNG 2: Email nhận giấy -->
            <div class="tt25-form-group">
              <label for="email" class="tt25-label">
                Email nhận giấy <span class="required">*</span>
              </label>
              <div class="tt25-input-wrapper">
                <i class="fa-solid fa-envelope tt25-input-icon"></i>
                <input type="email" class="tt25-input" id="email" name="email" placeholder="example@gmail.com" required>
              </div>
            </div>

            <!-- CỘT 1 - HÀNG 3: Số điện thoại liên hệ -->
            <div class="tt25-form-group">
              <label for="phone" class="tt25-label">
                Số điện thoại liên hệ <span class="required">*</span>
              </label>
              <div class="tt25-input-wrapper">
                <i class="fa-solid fa-phone tt25-input-icon"></i>
                <input type="tel" class="tt25-input" id="phone" name="phone" placeholder="Nhập 10 số điện thoại" maxlength="10" pattern="\d{10}" required>
              </div>
            </div>

            <!-- CỘT 2 - HÀNG 3: Số thẻ BHYT -->
            <div class="tt25-form-group">
              <label for="bhyt_code" class="tt25-label">
                Số thẻ BHYT <span style="font-weight: 400; color: #64748b; font-size: 12.5px;"></span>
              </label>
              <div class="tt25-input-wrapper">
                <i class="fa-solid fa-id-card-clip tt25-input-icon"></i>
                <input type="text" class="tt25-input" id="bhyt_code" name="bhyt_code" placeholder="Nhập mã số thẻ BHYT (nếu có)">
              </div>
            </div>

            <!-- HÀNG TOÀN CHIỀU RỘNG: Loại giấy -->
            <div class="tt25-form-group full-width">
              <label for="category_id" class="tt25-label">
                Loại giấy (Danh mục TT25/BYT) <span class="required">*</span>
              </label>
              <div class="tt25-input-wrapper">
                <i class="fa-solid fa-file-medical tt25-input-icon"></i>
                <select class="tt25-select" id="category_id" name="category_id" required>
                  <option value="">-- Chọn Loại giấy theo danh mục giấy TT25/BYT --</option>
                  <?php if(!empty($tt25_categories) && is_array($tt25_categories)): ?>
                    <?php foreach($tt25_categories as $cat): ?>
                      <option value="<?php echo intval($cat->id); ?>"><?php echo htmlspecialchars($cat->name); ?></option>
                    <?php endforeach; ?>
                  <?php else: ?>
                    <option value="1">Giấy chứng nhận nghỉ việc hưởng bảo hiểm xã hội (Mẫu TT25/BYT)</option>
                    <option value="2">Giấy ra viện (Mẫu TT25/BYT)</option>
                    <option value="3">Giấy khám sức khỏe (Mẫu TT25/BYT)</option>
                    <option value="4">Giấy chứng sinh (Mẫu TT25/BYT)</option>
                    <option value="5">Giấy trích sao bệnh án (Mẫu TT25/BYT)</option>
                  <?php endif; ?>
                </select>
              </div>
            </div>

            <!-- HÀNG TOÀN CHIỀU RỘNG: BỔ SUNG LƯU Ý TẠI TRƯỜNG EMAIL -->
            <div class="tt25-email-warning-box">
              <i class="fa-solid fa-triangle-exclamation"></i>
              <div class="tt25-email-warning-text">
                Lưu ý nhập đúng Email để nhận giấy. Giấy chứng nhận TT25/BYT đính kèm mã QR sẽ được gửi về hòm thư này trong vòng 24h.
              </div>
            </div>

            <!-- SUBMIT BUTTON -->
            <div class="tt25-submit-area">
              <button type="submit" id="btnSubmitTT25" class="tt25-btn-submit">
                <i class="fa-solid fa-paper-plane"></i> Gửi yêu cầu
              </button>
              <div style="font-size: 12.5px; color: #64748b; margin-top: 10px;">
                <i class="fa-solid fa-shield-halved text-success"></i> Đảm bảo an toàn thông tin theo chuẩn y tế Bộ Y Tế.
              </div>
            </div>

          </div>
        </form>

      </div>
    </div>
  </div>

</div>

<!-- Script xử lý AJAX submit & SweetAlert2 -->
<script>
document.addEventListener('DOMContentLoaded', function() {
    const form = document.getElementById('tt25RequestForm');
    const btnSubmit = document.getElementById('btnSubmitTT25');
    const successAlert = document.getElementById('tt25SuccessAlert');
    const successText = document.getElementById('tt25SuccessText');
    const errorAlert = document.getElementById('tt25ErrorAlert');
    const errorText = document.getElementById('tt25ErrorText');

    if(form) {
        form.addEventListener('submit', function(e) {
            e.preventDefault();

            const fullname = document.getElementById('fullname').value.trim();
            const cccd = document.getElementById('cccd').value.trim();
            const dob = document.getElementById('dob').value.trim();
            const phone = document.getElementById('phone').value.trim();
            const bhyt_code = document.getElementById('bhyt_code') ? document.getElementById('bhyt_code').value.trim() : '';
            const email = document.getElementById('email').value.trim();
            const category_id = document.getElementById('category_id').value;

            let errors = [];
            if(!fullname) errors.push('Vui lòng nhập Họ và tên bệnh nhân.');
            if(!cccd) {
                errors.push('Vui lòng nhập Số CCCD.');
            } else if(!/^\d{12}$/.test(cccd)) {
                errors.push('Số CCCD phải bao gồm đúng 12 chữ số.');
            }

            if(!dob) errors.push('Vui lòng chọn Ngày tháng năm sinh.');
            
            if(!phone) {
                errors.push('Vui lòng nhập Số điện thoại.');
            } else if(!/^\d{10}$/.test(phone)) {
                errors.push('Số điện thoại liên hệ phải bao gồm đúng 10 chữ số.');
            }

            if(!email) errors.push('Vui lòng nhập Email.');
            if(!category_id) errors.push('Vui lòng chọn Loại giấy theo danh mục giấy TT25/BYT.');

            if(errors.length > 0) {
                errorText.innerHTML = errors.join('<br>');
                errorAlert.style.display = 'flex';
                successAlert.style.display = 'none';
                window.scrollTo({ top: form.offsetTop - 100, behavior: 'smooth' });
                return;
            }

            errorAlert.style.display = 'none';
            btnSubmit.disabled = true;
            btnSubmit.innerHTML = '<i class="fa-solid fa-spinner fa-spin me-2"></i> Đang gửi yêu cầu...';

            const formData = new FormData(form);

            fetch(form.action, {
                method: 'POST',
                headers: {
                    'X-Requested-With': 'XMLHttpRequest'
                },
                body: formData
            })
            .then(res => res.json())
            .then(data => {
                btnSubmit.disabled = false;
                btnSubmit.innerHTML = '<i class="fa-solid fa-paper-plane me-1"></i> Gửi yêu cầu';

                const responseMsg = 'Hệ thống đã tiếp nhận yêu cầu; Vui lòng kiểm tra thư mục email trong 24h.';

                if(data.status === 'success') {
                    successText.innerHTML = responseMsg;
                    successAlert.style.display = 'flex';
                    errorAlert.style.display = 'none';
                    form.reset();

                    if(typeof Swal !== 'undefined') {
                        Swal.fire({
                            icon: 'success',
                            title: 'Tiếp Nhận Thành Công!',
                            text: responseMsg,
                            confirmButtonText: 'Đồng ý',
                            confirmButtonColor: '#0284c7'
                        });
                    }

                    window.scrollTo({ top: successAlert.offsetTop - 120, behavior: 'smooth' });
                } else {
                    errorText.innerHTML = data.message || 'Có lỗi xảy ra, vui lòng thử lại.';
                    errorAlert.style.display = 'flex';
                    successAlert.style.display = 'none';
                }
            })
            .catch(err => {
                btnSubmit.disabled = false;
                btnSubmit.innerHTML = '<i class="fa-solid fa-paper-plane me-1"></i> Gửi yêu cầu';

                const responseMsg = 'Hệ thống đã tiếp nhận yêu cầu; Vui lòng kiểm tra thư mục email trong 24h.';
                successText.innerHTML = responseMsg;
                successAlert.style.display = 'flex';
                errorAlert.style.display = 'none';
                form.reset();

                if(typeof Swal !== 'undefined') {
                    Swal.fire({
                        icon: 'success',
                        title: 'Tiếp Nhận Thành Công!',
                        text: responseMsg,
                        confirmButtonText: 'Đồng ý',
                        confirmButtonColor: '#0284c7'
                    });
                }
            });
        });
    }
});
</script>

<?php require_once 'footer.php'; ?>
