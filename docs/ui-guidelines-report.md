# Áp dụng CODEX_UI_GUIDELINES — 26/10/2026

Đã áp dụng cho giao diện người dùng đang hoạt động trong `template/frontend`, bao gồm trang TT25 có header riêng. Giữ PHP hiện tại, dữ liệu và nghiệp vụ; không đổi database, không áp dụng CSS frontend vào quản trị hoặc các giao diện lưu trữ `frontend_old`.

## File và thay đổi

- `template/frontend/assets/css/ui-foundation.css`: Montserrat tự lưu, token cỡ chữ, responsive, nội dung dài, form, menu, reveal và giảm chuyển động. Thay font/weight tại nguồn ở `style.css`, `tin-tuc.css`, `home-design.css`, `home-utilities.css`, `yeu-cau-cntt.css` và CSS nhúng trong các trang để tránh xung đột.
- `template/frontend/ui-assets.php`, `header.php`, `lay-giay-tt25.php`: nạp font preload (Latin & Vietnamese 400), `lenis.css`, `ui-foundation.css`, `lenis.min.js` và `ui-effects.js` một lần cho mỗi layout; bỏ Google Fonts cũ. CSS/JS dùng `filemtime` thay URL đổi theo từng giây.
- `template/frontend/assets/js/ui-effects.js`: một instance Lenis (v1.3.27, duration 1.15, cubic ease-out, `smoothWheel: true`, `syncTouch: false`, `autoRaf: false`), một vòng RAF thủ công; API `SiteUI.register(root)` cho nội dung tĩnh & AJAX, `SiteUI.scrollTo(target)` cho điều hướng, `SiteUI.stop()`/`SiteUI.start()` đồng bộ khóa cuộn popup, `data-lenis-prevent` cho khung cuộn riêng, offset header thực tế, focus và reduced motion.
- `assets/js/main.js`, `assets/js/home.js`, `footer.php`, `home-footer.php`: nạp `main.js` đầy đủ ở cả `footer.php` và trang chủ; dùng bộ cuộn/reveal chung, bỏ reveal trùng; dừng tự chạy khi giảm chuyển động. Menu mobile cập nhật `aria-hidden` và khóa/mở khóa Lenis khi đóng/mở.
- `template/frontend/ui-images.php`: chỉ dùng file dẫn xuất có thật, kiểm tra mtime/kích thước nguồn, xuất srcset/sizes/dimensions; ảnh mới hoặc nguồn thay đổi tự dùng lại ảnh gốc. Xử lý đường dẫn banner cũ `assets/images/...` khi đúng file tồn tại trong template. Ảnh rich text được bổ sung thuộc tính lúc render, dữ liệu CMS không đổi.
- Các component ảnh trong `index.php`, `slider.php`, `menu.php`, `footer.php`, `home-footer.php`, `home-equipment.php`, `doi-ngu-bac-si.php`, `tin-tuc.php`, `tin-tuc-detail.php`, `trangtinh.php`, `dich-vu-detail.php`, `chien-dich-y-te.php`, `chien-dich-y-te-detail.php`, `hoat-dong.php`: tích hợp ảnh responsive theo layout. Avatar bác sĩ tạo bằng JS nhận srcset từ PHP.
- `breadcrumb.php`, các tiêu đề trang: bổ sung H1 phù hợp cho các trang danh sách trước đây chỉ có breadcrumb, giữ nguyên nội dung tiêu đề.
- `tools/optimize-ui-images.cjs`, `tools/ui-image-report.json`, `assets/images/optimized/manifest.json`: công cụ tạo ảnh và số liệu từng nguồn. Chạy `node tools/optimize-ui-images.cjs` với package `sharp` có sẵn trong Node hoặc NODE_PATH. Không ghi đè ảnh gốc, không phóng ảnh nhỏ.
- `assets/images/optimized/.htaccess`: cache dài chỉ cho WebP có tên hash. Không cache dài HTML, tài khoản hay API.
- `config.php`: yêu cầu qua localhost/127.0.0.1 dùng base URL localhost và subfolder thực tế; địa chỉ Cloudflare công khai đã có vẫn giữ nguyên khi truy cập qua host khác.

## Typography

Montserrat WOFF2 từ `@fontsource/montserrat@5.2.8`, có các subset Latin, Latin Extended, Vietnamese và weight 400/600/700; lưu giấy phép SIL OFL trong `assets/fonts/montserrat/OFL.txt`. `font-display: swap`, chỉ preload Latin Regular, không fake-bold. Không lấy font từ website tham khảo.

- Root 100%; nội dung chính 1rem/1.6; chữ chính #1f2937, chữ phụ #4b5563, giữ các màu thương hiệu của từng component.
- Desktop trên 1024px: H1/H2/H3 40/32/24px.
- Tablet 768–1024px: 34/28/22px.
- Mobile dưới 768px: 28/24/20px; tên card 16px, mô tả 16px, chú thích 14px.
- Menu 16px/600; form tối thiểu 16px, nút 15–16px tùy component. Đoạn bài viết khoảng 70ch và căn trái.
- Header chuyển menu dạng drawer khi thiếu không gian ở ≤1320px; nội dung không bị cắt khi phóng to chữ.

## Motion và ảnh

Lenis tự lưu bản 1.3.27 kèm CSS/giấy phép, duration 1.15, cubic ease-out, smoothWheel true, syncTouch false, autoRaf false. Khi reduced motion thay đổi, hủy/tạo lại Lenis và vòng RAF tương ứng. Thiếu thư viện thì dùng cuộn trình duyệt. Khung menu, popup, dropdown, textarea dùng data-lenis-prevent; khóa cuộn nền hiện có được đồng bộ stop/start.

Reveal chỉ đánh dấu pending sau khi observer hoạt động và chỉ cho nội dung dưới màn hình đầu: opacity + translateY 20px, 550ms, một lần. Ảnh cache/lỗi đều xử lý load/error; timeout 8 giây đảm bảo không ẩn vĩnh viễn. Focus vào card sẽ hiện ngay. Không JS/không observer/reduced motion đều hiển thị nội dung. Banner có img/srcset trong HTML, eager và không reveal; ảnh dưới trang dùng native lazy loading và decoding async.

Đã kiểm tra 300 ảnh nguồn và tạo bản WebP cho 225 ảnh có lợi về dung lượng. Tổng nguồn của nhóm này 99.416.677 byte; tổng các bản dẫn xuất lớn nhất theo từng nguồn 9.507.260 byte. Đây là tổng file trên đĩa, không phải số byte tải trên một trang.

| Banner nguồn | Trước | Bản lớn sau | Các chiều rộng |
| --- | ---: | ---: | --- |
| uploads/slider/banner_01.png | 1.891.943 B | 119.384 B | 400/800/1200/1376 |
| uploads/slider/banner_02.png | 7.178.277 B | 208.782 B | 400/800/1200/1920 |
| uploads/slider/slide_470605151ec431a553c3e593.png | 1.763.881 B | 214.836 B | 400/800/1200/1920 |
| uploads/slider/slide_588b82ae49a2dceaa7944e39.png | 1.891.943 B | 119.384 B | 400/800/1200/1376 |

Một số banner trùng nội dung dùng chung file hash. SVG và ảnh gốc được giữ nguyên. Ảnh bên ngoài như Unsplash và placeholder hiện có vẫn cần kết nối mạng.

## Kiểm tra thực tế

- PHP lint: 24 file PHP của frontend và config.php, không lỗi cú pháp; Node --check cho main.js, home.js, ui-effects.js và công cụ tạo WebP đều đạt.
- Chromium: 18 URL từ menu/footer × 375/768/1024/1440px = 72 lượt. Không tràn ngang trang, không lỗi JavaScript, không tài nguyên nội bộ bị 404 trong các lượt kiểm tra cuối.
- Đã xem ảnh chụp desktop/mobile của trang chủ, Giới thiệu, bác sĩ, tin tức. Font Montserrat tiếng Việt tải thành công. srcset banner chọn WebP phù hợp viewport; trang chủ chỉ có một ảnh fetchpriority high ở cấu hình slider hiện tại.
- Menu mobile và popup bác sĩ: Lenis dừng khi khóa nền, chạy lại khi đóng; Escape hoạt động. Anchor cập nhật hash và focus, target nằm cách đầu viewport 88px với header 72px; Back khôi phục lịch sử.
- Phóng chữ 200% trên viewport mobile: body 32px, không tràn ngang. Reduced motion tắt Lenis và xóa pending; đổi ngược lại khởi tạo được Lenis. Không JS vẫn hiện slide đầu và nội dung liên hệ; giả lập không IntersectionObserver không lỗi và không còn phần tử pending. Thêm card AJAX với ảnh lỗi và focus vẫn hiện card.
- HTTP kiểm tra WebP: 200, image/webp, Cache-Control public/max-age=31536000/immutable.
- Một lượt đo Performance API trên localhost/Chromium 1440×1000: LCP 880ms, CLS 0, DOMContentLoaded 463ms. Tài nguyên ngoài localhost bị chặn để phép kiểm tra lặp lại được. Đây không phải Lighthouse, không có số Lighthouse trước/sau, không đo INP thực tế và không đại diện kết quả ngoài internet. So sánh trước/sau đáng tin cậy ở đây là dung lượng file ảnh.

## Các giới hạn còn lại

Bốn URL menu/footer trả 404 do không tìm thấy trang nội dung đang xuất bản: `/trang/vien-phi-goi-dich-vu.html`, `/trang/goi-kham-suc-khoe.html`, `/trang/chinh-sach-bao-mat.html`, `/trang/dieu-khoan-su-dung.html`. Không tự tạo nội dung, thay URL hay sửa trạng thái database. Các trang 404 cũng nhận bộ typography mới và không có cảnh báo PHP.

Apache hiện tắt mod_deflate/mod_filter trong cấu hình máy chủ. Chưa bật gzip/Brotli vì cần thay cấu hình XAMPP ngoài dự án; không thêm cấu hình giả. Không kiểm chứng dữ liệu Core Web Vitals thực tế, tài khoản đăng nhập đầy đủ, hoặc gửi thử form tạo dữ liệu. Không tuyên bố đạt điểm Lighthouse/Core Web Vitals.

Nguồn thư viện: https://github.com/darkroomengineering/lenis/tree/v1.3.27 ; https://cdn.jsdelivr.net/npm/@fontsource/montserrat@5.2.8/ . Giấy phép kèm từng tài nguyên trong dự án.
