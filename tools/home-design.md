Trang chủ sử dụng header/menu và JavaScript hệ thống hiện có. CSS và JavaScript riêng chỉ nạp tại trang chủ. Footer mới nằm trong `template/frontend/home-footer.php`; các trang khác tiếp tục dùng footer chung.

Biên dịch lại CSS sau khi đổi class trong template hoặc home.js:

```powershell
npx --yes tailwindcss@3.4.17 -c tools/home-tailwind.config.cjs -i tools/home-tailwind.input.css -o template/frontend/assets/css/home-utilities.css --minify
```

Không cần Node.js hoặc Tailwind CDN khi vận hành website. CSS đã được biên dịch sẵn và giới hạn trong `#home-design`, không bật Tailwind preflight.

Nguồn dữ liệu: slider quản trị (bao gồm thiết bị PC/mobile), bác sĩ đang công tác, chuyên khoa hoạt động, tin đã duyệt, cấu hình liên hệ và thống kê truy cập hiện có. Form nhanh gửi đăng ký qua `api/submitQuickAppointment`; nhân viên tiếp nhận trong mục Đặt lịch khám nhanh tại `/admin/quickappointments`. Đăng ký chờ bệnh viện liên hệ xác nhận.

Các nội dung giới thiệu, giá trị cốt lõi, chuyển đổi số và gói khám là nội dung từ mẫu đính kèm.

Trang thiết bị được quản lý tại `/admin/equipment` với quyền `equipment`. Có thể thêm/sửa tên, hãng, xuất xứ, mô tả, ảnh; đặt thứ tự, bật/tắt hiển thị và chuyển vào Sọt rác để khôi phục. Chỉ các bản ghi `status=1` được tải trong `home-equipment.php`.

Cài bảng và 6 bản ghi mẫu khi triển khai trên máy khác:

```powershell
D:\xampp\php\php.exe tools/setup-equipment.php
```

Script chỉ chạy từ CLI, có thể chạy lại mà không nhân bản hoặc ghi đè dữ liệu đã chỉnh sửa. Dữ liệu mẫu nằm ở `database/templates/equipment-samples.json`, ảnh SVG minh họa lấy từ mẫu HTML ban đầu. Ảnh người quản trị tải lên nhận JPG, PNG hoặc WebP tối đa 5 MB. Tài khoản quản trị cấp cao có quyền truy cập; nhóm khác cần cấp quyền Quản lý trang thiết bị trong quản lý nhóm quyền.

Kiểm tra tích hợp với database đã cài đặt (tự rollback các thay đổi thử nghiệm):

```powershell
D:\xampp\php\php.exe tools/test-equipment.php
```

Đặt lịch khám nhanh dùng bảng `hicrm_quick_appointments` và quyền `quick_appointments`. Cài đặt khi triển khai:

```powershell
D:\xampp\php\php.exe tools/setup-quick-appointments.php
D:\xampp\php\php.exe tools/test-quick-appointments.php
```

Form và máy chủ kiểm tra đủ 4 trường: họ tên 2–120 ký tự chữ và dấu phân cách tên; CCCD đúng 12 số (giữ số 0 đầu); điện thoại Việt Nam di động 10 số hoặc cố định đầu 02 gồm 11 số, chấp nhận mã +84/84; ngày khám hợp lệ từ ngày hiện tại theo múi giờ Việt Nam. Admin vẫn sửa được thông tin của lịch cũ khi giữ nguyên ngày khám cũ. Cùng một CCCD không thể có hai lịch đang tồn tại trong cùng ngày, kể cả gửi đồng thời; lịch trong Sọt rác không chiếm lịch. Khôi phục lịch trùng sẽ được Sọt rác từ chối.

API kiểm tra CSRF, chỉ nhận POST và giới hạn mỗi phiên 30 giây sau một lần gửi thành công. Admin có tìm kiếm, phân trang, thêm/sửa, xóa vào Sọt rác và khôi phục. Script kiểm thử tự rollback dữ liệu giả, không tạo đăng ký mẫu lâu dài.
