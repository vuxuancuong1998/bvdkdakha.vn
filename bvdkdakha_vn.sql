-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th9 27, 2026 lúc 09:32 AM
-- Phiên bản máy phục vụ: 10.4.21-MariaDB
-- Phiên bản PHP: 7.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `bvdkdakha.vn`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hicrm_accounts`
--

CREATE TABLE `hicrm_accounts` (
  `id` int(11) NOT NULL,
  `account_number` varchar(10) NOT NULL,
  `account_name` varchar(255) NOT NULL,
  `account_type` int(11) NOT NULL DEFAULT 1 COMMENT '1 - dư nợ, 2 - dư có, 3 - lưỡng tính',
  `account_name_en` varchar(255) NOT NULL,
  `account_description` text DEFAULT NULL,
  `account_status` int(11) NOT NULL DEFAULT 1 COMMENT '1 - đang sử dụng, 2 - ngưng sử dụng',
  `account_parent` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `hicrm_accounts`
--

INSERT INTO `hicrm_accounts` (`id`, `account_number`, `account_name`, `account_type`, `account_name_en`, `account_description`, `account_status`, `account_parent`) VALUES
(1, '111', 'Tiền mặt', 1, 'Cash in hand', NULL, 1, 0),
(2, '1111', 'Tiền Việt Nam', 1, 'Vietnam dong', NULL, 1, 1),
(3, '1112', 'Ngoại tệ', 1, 'Foreign currency', NULL, 1, 1),
(4, '112', 'Tiền gửi Ngân hàng', 1, 'Cash in bank', NULL, 1, 0),
(5, '1121', 'Tiền Việt Nam', 1, 'Vietnam dong', NULL, 1, 4),
(6, '1122', 'Ngoại tệ', 1, 'Foreign currency', NULL, 1, 4),
(7, '121', 'Chứng khoán kinh doanh', 1, 'Trading securities', NULL, 1, 4),
(8, '128', 'Đầu tư nắm giữ đến ngày đáo hạn', 1, 'Held to maturity investment', NULL, 1, 0),
(9, '1281', 'Tiền gửi có kỳ hạn', 1, 'Term deposits', NULL, 1, 8),
(10, '1288', 'Các khoản đầu tư khác nắm giữ đến ngày đáo hạn', 1, 'Other held to maturity investments', NULL, 1, 8),
(11, '131', 'Phải thu của khách hàng', 3, 'Receivables from customers', NULL, 1, 8),
(12, '133', 'Thuế GTGT được khấu trừ', 1, 'VAT receivable', NULL, 1, 0),
(13, '1331', 'Thuế GTGT được khấu trừ của hàng hóa, dịch vụ', 1, 'VAT receivable - goods and services', NULL, 1, 12),
(14, '1332', 'Thuế GTGT được khấu trừ của TSCĐ', 1, 'VAT receivable - fixed assets', NULL, 1, 12),
(15, '136', 'Phải thu nội bộ', 1, 'Internal receivables', NULL, 1, 0),
(16, '1361', 'Vốn kinh doanh ở đơn vị trực thuộc', 1, 'Investment in equity of subsidiaries', NULL, 1, 15),
(17, '1368', 'Phải thu nội bộ khác', 1, 'Other internal receivables', NULL, 1, 15),
(18, '138', 'Phải thu khác', 3, 'Other receivable', NULL, 1, 0),
(19, '1381', 'Tài sản thiếu chờ xử lý', 3, 'Shortage of assets awaiting resolution', NULL, 1, 18),
(20, '1386', 'Cầm cố, thế chấp, ký quỹ, ký cược', 1, 'Deposits, mortgages and collateral', NULL, 1, 18),
(21, '1388', 'Phải thu khác', 3, 'Other receivable', NULL, 1, 18),
(22, '141', 'Tạm ứng', 1, 'Advances', NULL, 1, 18),
(23, '151', 'Hàng mua đang đi đường', 1, 'Goods in transit', NULL, 1, 0),
(24, '152', 'Nguyên liệu, vật liệu', 1, 'Raw materials', NULL, 1, 0),
(25, '153', 'Công cụ, dụng cụ', 1, 'Tools and equipments', NULL, 1, 0),
(26, '154', 'Chi phí sản xuất, kinh doanh dở dang', 1, 'Work in progress', NULL, 1, 0),
(27, '155', 'Thành phẩm', 1, 'Finished goods', NULL, 1, 0),
(28, '156', 'Hàng hóa', 1, 'Goods', NULL, 1, 0),
(29, '157', 'Hàng gửi đi bán', 1, 'Goods on consignment', NULL, 1, 0),
(30, '211', 'Tài sản cố định', 1, 'Long-term assets', NULL, 1, 0),
(31, '2111', 'TSCĐ hữu hình', 1, 'House, building', NULL, 1, 30),
(32, '21111', 'Nhà cửa, vật kiến trúc', 1, 'House, building', NULL, 1, 31),
(33, '21112', 'Máy móc thiết bị', 1, 'Equipment & machines', NULL, 1, 31),
(34, '21113', 'Phương tiện vận tải truyền dẫn', 1, 'Means of transport, conveyance equipment', NULL, 1, 31),
(35, '21114', 'Thiết bị dụng cụ quản lý', 1, 'Managerial equipment and instruments', NULL, 1, 31),
(36, '21115', 'Cây lâu năm, súc vật làm việc và cho sản phẩm', 1, 'Plants and livestocks', NULL, 1, 31),
(37, '21116', 'Các TSCĐ là kết cấu hạ tầng, có giá trị lớn do Nhà nước ĐTXD từ NSNN giao cho các tổ chức kinh tế quản lý, khai thác, sử dụng', 1, 'Fixed assets are high value infrastructure funded from State Budget, transferred to business entities to manage, exploit, use', NULL, 1, 31),
(38, '21118', 'TSCĐ khác', 1, 'Other tangible fixed assets', NULL, 1, 31),
(39, '2112', 'TSCĐ thuê tài chính', 1, 'Machinery, equipments', NULL, 1, 30),
(40, '2113', 'TSCĐ vô hình', 1, 'Intangible fixed assets', NULL, 1, 30),
(41, '21131', 'Quyền sử dụng đất', 1, 'Right of land use', NULL, 1, 40),
(42, '21132', 'Quyền phát hành', 1, 'Publishing rights', NULL, 1, 40),
(43, '21133', 'Bản quyền, bằng sáng chế', 1, 'Copyright, patents', NULL, 1, 40),
(44, '21134', 'Nhãn hiệu hàng hóa', 1, 'Trademark', NULL, 1, 40),
(45, '21135', 'Phần mềm máy vi tính', 1, 'Software', NULL, 1, 40),
(46, '21136', 'Giấy phép và giấy chuyển nhượng quyền', 1, 'License and right concession permits', NULL, 1, 40),
(47, '21138', 'TSCĐ vô hình khác', 1, 'Other intangible fixed assets', NULL, 1, 40),
(48, '214', 'Hao mòn TSCĐ', 2, 'Accumulated depreciation - fixed assets', NULL, 1, 0),
(49, '2141', 'Hao mòn TSCĐ hữu hình', 2, 'Accumulated depreciation - tangible fixed assets', NULL, 1, 48),
(50, '2142', 'Hao mòn TSCĐ thuê tài chính', 2, 'Accumulated depreciation - financial leasing fixed assets', NULL, 1, 48),
(51, '2143', 'Hao mòn TSCĐ vô hình', 2, 'Accumulated depreciation - intangible fixed assets', NULL, 1, 48),
(52, '2147', 'Hao mòn bất động sản đầu tư', 2, 'Accumulated depreciation - investment property', NULL, 1, 48),
(53, '217', 'Bất động sản đầu tư', 1, 'Investmet property', NULL, 1, 0),
(54, '228', 'Đầu tư góp vốn vào đơn vị khác', 1, 'Equity investments in other entities', NULL, 1, 0),
(55, '2281', 'Đầu tư vào công ty liên doanh, liên kết', 1, 'Investments in joint ventures and associates', NULL, 1, 54),
(56, '2288', 'Đầu tư khác', 1, 'Other investments', NULL, 1, 54),
(57, '229', 'Dự phòng tổn thất tài sản', 2, 'Provisions for impairment of assets', NULL, 1, 0),
(58, '2291', 'Dự phòng giảm giá chứng khoán kinh doanh', 2, 'Provision for diminution in the value of trading securities ', NULL, 1, 57),
(59, '2292', 'Dự phòng tổn thất đầu tư vào đơn vị khác', 2, 'Provisions for impairment of investments in other entities', NULL, 1, 57),
(60, '2293', 'Dự phòng phải thu khó đòi', 2, 'Provisions for doubtful debts', NULL, 1, 57),
(61, '2294', 'Dự phòng giảm giá hàng tồn kho', 2, 'Provisions for inventories', NULL, 1, 57),
(62, '241', 'Xây dựng cơ bản dở dang', 1, 'Construction in process', NULL, 1, 0),
(63, '2411', 'Mua sắm TSCĐ', 1, 'Fixed assets purchases', NULL, 1, 62),
(64, '2412', 'Xây dựng cơ bản', 1, 'Construction in process', NULL, 1, 62),
(65, '2413', 'Sửa chữa lớn TSCĐ', 1, 'Major repair of fixed assets', NULL, 1, 62),
(66, '242', 'Chi phí trả trước', 1, 'Prepaid expenses', NULL, 1, 0),
(67, '331', 'Phải trả cho người bán', 3, 'Payable to suppliers', NULL, 1, 0),
(68, '333', 'Thuế và các khoản phải nộp Nhà nước', 3, 'Taxes and payable to state budget', NULL, 1, 0),
(69, '3331', 'Thuế giá trị gia tăng phải nộp', 3, 'Value Added Tax payables', NULL, 1, 68),
(70, '33311', 'Thuế GTGT đầu ra', 3, 'VAT output', NULL, 1, 69),
(71, '33312', 'Thuế GTGT hàng nhập khẩu', 3, 'VAT for imported goods', NULL, 1, 69),
(72, '3332', 'Thuế tiêu thụ đặc biệt', 3, 'Special consumption tax', NULL, 1, 68),
(73, '3333', 'Thuế xuất, nhập khẩu', 3, 'Import & export duties', NULL, 1, 68),
(74, '3334', 'Thuế thu nhập doanh nghiệp', 3, 'Company income tax', NULL, 1, 68),
(75, '3335', 'Thuế thu nhập cá nhân', 3, 'Personal income tax', NULL, 1, 68),
(76, '3336', 'Thuế tài nguyên', 3, 'Natural resource tax', NULL, 1, 68),
(77, '3337', 'Thuế nhà đất, tiền thuê đất', 3, 'Land & housing tax, land rental charges', NULL, 1, 68),
(78, '3338', 'Thuế bảo vệ môi trường và các loại thuế khác', 3, 'Environment protection tax and other taxes', NULL, 1, 68),
(79, '33381', 'Thuế bảo vệ môi trường', 3, 'Environment protection tax', NULL, 1, 78),
(80, '33382', 'Các loại thuế khác', 3, 'Other taxes', NULL, 1, 78),
(81, '3339', 'Phí, lệ phí và các khoản phải nộp khác', 3, 'Fee & charge & other payables', NULL, 1, 68),
(82, '334', 'Phải trả người lao động', 2, 'Payable to employees', NULL, 1, 0),
(83, '335', 'Chi phí phải trả', 2, 'Payable expenses', NULL, 1, 0),
(84, '336', 'Phải trả nội bộ', 2, 'Internal payables', NULL, 1, 0),
(85, '3361', 'Phải trả nội bộ về vốn kinh doanh', 2, 'Internal payables for operating capital received', NULL, 1, 84),
(86, '3368', 'Phải trả nội bộ khác', 2, 'Other Internal payables', NULL, 1, 84),
(87, '338', 'Phải trả, phải nộp khác', 3, 'Other payable', NULL, 1, 0),
(88, '3381', 'Tài sản thừa chờ giải quyết', 3, 'Surplus assets awaiting for resolution', NULL, 1, 87),
(89, '3382', 'Kinh phí công đoàn', 3, 'Trade Union fees', NULL, 1, 87),
(90, '3383', 'Bảo hiểm xã hội', 3, 'Social insurance', NULL, 1, 87),
(91, '3384', 'Bảo hiểm y tế', 3, 'Health insurance', NULL, 1, 87),
(92, '3385', 'Bảo hiểm thất nghiệp', 3, 'Unemployment insurance', NULL, 1, 87),
(93, '3386', 'Nhận ký quỹ, ký cược', 3, 'Collaterals, deposits received', NULL, 1, 87),
(94, '3387', 'Doanh thu chưa thực hiện', 3, 'Unrealised revenue', NULL, 1, 87),
(95, '3388', 'Phải trả, phải nộp khác', 3, 'Other payable', NULL, 1, 87),
(96, '341', 'Vay và nợ thuê tài chính', 2, 'Borrowings and financial lease liabilities', NULL, 1, 0),
(97, '3411', 'Các khoản đi vay', 2, 'Borrowing', NULL, 1, 96),
(98, '3412', 'Nợ thuê tài chính', 2, 'Financial lease liabilities', NULL, 1, 96),
(99, '352', 'Dự phòng phải trả', 2, 'Provisions for payables', NULL, 1, 0),
(100, '3521', 'Dự phòng bảo hành sản phẩm hàng hóa', 2, 'Product warranty provisions', NULL, 1, 99),
(101, '3522', 'Dự phòng bảo hành công trình xây dựng', 2, 'Construction warranty provisions', NULL, 1, 99),
(102, '3524', 'Dự phòng phải trả khác', 2, 'Other provisions', NULL, 1, 99),
(103, '353', 'Quỹ khen thưởng, phúc lợi', 2, 'Bonus & welfare funds', NULL, 1, 0),
(104, '3531', 'Quỹ khen thưởng', 2, 'Bonus fund', NULL, 1, 103),
(105, '3532', 'Quỹ phúc lợi', 2, 'Welfare fund', NULL, 1, 103),
(106, '3533', 'Quỹ phúc lợi đã hình thành TSCĐ', 2, 'Welfare fund used to acquire fixed assets', NULL, 1, 103),
(107, '3534', 'Quỹ thưởng ban quản lý điều hành công ty', 2, 'Management bonus fund', NULL, 1, 103),
(108, '356', 'Quỹ phát triển khoa học và công nghệ', 2, 'Science and technology development fund', NULL, 1, 0),
(109, '3561', 'Quỹ phát triển khoa học và công nghệ', 2, 'Science and technology development fund', NULL, 1, 108),
(110, '3562', 'Quỹ phát triển khoa học và công nghệ đã hình thành TSCĐ', 2, 'Science and technology development fund used for fixed asset acquisition', NULL, 1, 108),
(111, '411', 'Vốn đầu tư của chủ sở hữu', 2, 'Contributed legal capital', NULL, 1, 0),
(112, '4111', 'Vốn góp của chủ sở hữu', 2, 'Contributed capital ', NULL, 1, 111),
(113, '4112', 'Thặng dư vốn cổ phần', 2, 'Share capital surplus', NULL, 1, 111),
(114, '4118', 'Vốn khác', 2, 'Other capital', NULL, 1, 111),
(115, '413', 'Chênh lệch tỷ giá hối đoái', 3, 'Foreign exchange differences', NULL, 1, 111),
(116, '418', 'Các quỹ thuộc vốn chủ sở hữu', 2, 'Other funds', NULL, 1, 0),
(117, '419', 'Cổ phiếu quỹ', 1, 'Treasury share', NULL, 1, 0),
(118, '421', 'Lợi nhuận sau thuế chưa phân phối', 3, 'Undistributed earnings', NULL, 1, 0),
(119, '4211', 'Lợi nhuận sau thuế chưa phân phối năm trước', 3, 'Previous year undistributed earnings', NULL, 1, 118),
(120, '4212', 'Lợi nhuận sau thuế chưa phân phối năm nay', 3, 'This year undistributed earnings', NULL, 1, 118),
(121, '511', 'Doanh thu bán hàng và cung cấp dịch vụ', 3, 'Revenue from sales of goods and provision of services', NULL, 1, 0),
(122, '5111', 'Doanh thu bán hàng hóa', 3, 'Revenue from sales of goods', NULL, 1, 121),
(123, '5112', 'Doanh thu bán thành phẩm', 3, 'Revenue from sales of finished goods', NULL, 1, 121),
(124, '5113', 'Doanh thu cung cấp dịch vụ', 3, 'Revenue from provision of services', NULL, 1, 121),
(125, '5118', 'Doanh thu khác', 3, 'Other revenues', NULL, 1, 121),
(126, '515', 'Doanh thu hoạt động tài chính', 3, 'Revenue from financial operations', NULL, 1, 0),
(127, '611', 'Mua hàng', 3, 'Cost of purchases', NULL, 1, 0),
(128, '631', 'Giá thành sản xuất', 3, 'Cost of production', NULL, 1, 0),
(129, '632', 'Giá vốn hàng bán', 3, 'Cost of goods sold', NULL, 1, 0),
(130, '635', 'Chi phí tài chính', 3, 'Financial activities expenses', NULL, 1, 0),
(131, '642', 'Chi phí quản lý kinh doanh', 3, 'Business management expenses', NULL, 1, 0),
(132, '6421', 'Chi phí bán hàng', 3, 'Selling expenses', NULL, 1, 131),
(133, '6422', 'Chi phí quản lý doanh nghiệp', 3, 'General & administration expenses', NULL, 1, 131),
(134, '711', 'Thu nhập khác', 3, 'Other income', NULL, 1, 0),
(135, '811', 'Chi phí khác', 3, 'Other expenses', NULL, 1, 0),
(136, '821', 'Chi phí thuế thu nhập doanh nghiệp', 3, 'Business Income tax charge', NULL, 1, 0),
(137, '911', 'Xác định kết quả kinh doanh', 3, 'Evaluation of business results', NULL, 1, 0),
(138, '0001', 'Tài khoản thử', 2, 'Test Account 1', 'Test account', 99, 2),
(139, '0001112', 'Tài khoản thử', 2, 'Test Account', 'Test account', 99, 2),
(140, '0002112', 'Tài khoản thử', 2, 'Test Account', 'Test account', 1, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hicrm_admin_menu_permissions`
--

CREATE TABLE `hicrm_admin_menu_permissions` (
  `id` int(11) NOT NULL,
  `permission_key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permission_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_key` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `permission_status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `hicrm_admin_menu_permissions`
--

INSERT INTO `hicrm_admin_menu_permissions` (`id`, `permission_key`, `permission_name`, `parent_key`, `sort_order`, `permission_status`) VALUES
(1, 'dashboard', 'Trang chủ', '', 10, 1),
(2, 'employers', 'Quản lý nhà tuyển dụng', 'employer_section', 20, 1),
(3, 'employer_posts', 'Quản lý bài đăng tuyển dụng', 'employer_section', 21, 1),
(4, 'candidates', 'Quản lý ứng viên', '', 30, 1),
(5, 'students', 'Quản lý sinh viên', '', 40, 1),
(6, 'events', 'Quản lý tin tức & sự kiện', 'news_section', 50, 1),
(7, 'news_comments', 'Quản lý bình luận tin tức', 'news_section', 51, 1),
(8, 'google_meet', 'Sàn việc làm online', '', 60, 1),
(9, 'users', 'Quản lý tài khoản', 'account_section', 70, 1),
(10, 'groups', 'Quản lý nhóm quyền', 'account_section', 71, 1),
(11, 'images', 'Thư viện hình ảnh', '', 80, 1),
(12, 'videos', 'Thư viện video', '', 90, 1),
(13, 'config', 'Danh mục tham số', 'system_section', 100, 1),
(14, 'settings', 'Cài đặt hệ thống', 'system_section', 101, 1),
(1576, 'customer_feedbacks', 'Quản lý phản hồi khách hàng', '', 54, 1),
(1577, 'job_support_customers', 'Quản lý khách hàng hỗ trợ tìm việc', '', 55, 1),
(1578, 'market_results', 'Quản lý kết quả sàn', '', 56, 1),
(7900, 'staticpages', 'Quản lý trang tĩnh CMS', 'staticpages_section', 53, 1),
(7901, 'staticpage_categories', 'Danh mục trang tĩnh', 'staticpages_section', 54, 1),
(7902, 'support_requests', 'Quản lý yêu cầu hỗ trợ (Tickets)', 'support_section', 55, 0),
(8161, 'tt25_documents', 'Quản lý giấy tờ TT25', '', 55, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hicrm_banks`
--

CREATE TABLE `hicrm_banks` (
  `id` int(11) NOT NULL,
  `bank_name` text NOT NULL,
  `bank_name_en` text NOT NULL,
  `bank_code` varchar(30) NOT NULL,
  `bank_logo` text DEFAULT NULL,
  `bank_description` varchar(255) DEFAULT NULL,
  `bank_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `hicrm_banks`
--

INSERT INTO `hicrm_banks` (`id`, `bank_name`, `bank_name_en`, `bank_code`, `bank_logo`, `bank_description`, `bank_status`) VALUES
(3, 'Ngân hàng TMCP Á Châu', 'Asia Commercial Joint Stock Bank', 'ACB', NULL, NULL, 0),
(4, 'Ngân hàng TMCP Tiên Phong', 'Tien Phong Commercial Joint Stock Bank', 'TPBank', NULL, NULL, 0),
(5, 'Ngân hàng TMCP Đông Á', 'Dong A Commercial Joint Stock Bank', 'DAB', NULL, NULL, 0),
(6, 'Ngân Hàng TMCP Đông Nam Á', 'Southeast Asia Commercial Joint Stock Bank', 'SeABank', NULL, NULL, 0),
(7, 'Ngân hàng TMCP An Bình', 'An Binh Commercial Joint Stock Bank', 'ABBANK', NULL, NULL, 0),
(8, 'Ngân hàng TMCP Bắc Á', 'Bac A Commercial Joint Stock Bank', 'BacABank', NULL, NULL, 0),
(9, 'Ngân hàng TMCP Bản Việt', 'Vietcapital Commercial Joint Stock Bank', 'VietCapitalBank', NULL, NULL, 0),
(10, 'Ngân hàng TMCP Hàng hải Việt Nam', 'Vietnam Maritime Joint – Stock Commercial Bank', 'MSB', NULL, NULL, 0),
(11, 'Ngân hàng TMCP Kỹ Thương Việt Nam', 'VietNam Technological and Commercial Joint Stock Bank', 'TCB', NULL, NULL, 0),
(12, 'Ngân hàng TMCP Kiên Long', 'Kien Long Commercial Joint Stock Bank', 'KienLongBank', NULL, NULL, 0),
(13, 'Ngân hàng TMCP Nam Á', 'Nam A Comercial Join Stock Bank', 'Nam A Bank', NULL, NULL, 0),
(14, 'Ngân hàng TMCP Quốc Dân', 'National Citizen Commercial Joint Stock Bank', 'NCB', NULL, NULL, 0),
(15, 'Ngân hàng TMCP Việt Nam Thịnh Vượng', 'Vietnam Prosperity Joint Stock Commercial Bank', 'VPBank', NULL, NULL, 0),
(16, 'Ngân hàng TMCP Phát triển Thành phố Hồ Chí Minh', 'Ho Chi Minh City Housing Development Bank', 'HDBank', NULL, NULL, 0),
(17, 'Ngân hàng TMCP Việt Nam Thịnh Vượng', 'Vietnam Prosperity Joint Stock Commercial Bank', 'VPBank', NULL, NULL, 0),
(18, 'Ngân hàng TMCP Phát triển Thành phố Hồ Chí Minh', 'Ho Chi Minh City Housing Development Bank', 'HDBank', NULL, NULL, 0),
(19, 'Ngân hàng TMCP Phương Đông', 'Orient Commercial Joint Stock Bank', 'OCB', NULL, NULL, 0),
(20, 'Ngân hàng TMCP Quân đội', 'Military Commercial Joint Stock Bank', 'MB', NULL, NULL, 0),
(21, 'Ngân hàng TMCP Đại chúng', 'Vietnam Public Joint Stock Commercial Bank', 'PVcombank', NULL, NULL, 0),
(22, 'Ngân hàng TMCP Quốc tế Việt Nam', 'Vietnam International and Commercial Joint Stock Bank', 'VIB', NULL, NULL, 0),
(23, 'Ngân hàng TMCP Sài Gòn', 'Sai Gon Joint Stock Commercial Bank', 'SCB', NULL, NULL, 0),
(24, 'Ngân hàng TMCP Sài Gòn Công Thương', 'Saigon Bank for Industry and Trade', 'SGB', NULL, NULL, 0),
(25, 'Ngân hàng TMCP Sài Gòn – Hà Nội', 'Saigon – Hanoi Commercial Joint Stock Bank', 'SHB', NULL, NULL, 0),
(26, 'Ngân hàng TMCP Sài Gòn Thương Tín', 'Sai Gon Thuong Tin Commercial Joint Stock Bank', 'Sacombank', NULL, NULL, 0),
(27, 'Ngân hàng TMCP Việt Á', 'Vietnam Asia Commercial Joint Stock Bank', 'VietABank', NULL, NULL, 0),
(28, 'Ngân hàng TMCP Bảo Việt', 'Bao Viet Joint Stock Commercial Bank', 'BaoVietBank', NULL, NULL, 0),
(29, 'Ngân hàng TMCP Việt Nam Thương Tín', 'Vietnam Thuong Tin Commercial Joint Stock Bank', 'VietBank', NULL, NULL, 0),
(30, 'Ngân Hàng TMCP Xăng Dầu Petrolimex', 'Joint Stock Commercia Petrolimex Bank', 'PG Bank', NULL, NULL, 0),
(31, 'Ngân Hàng TMCP Xuất Nhập khẩu Việt Nam', 'Vietnam Joint Stock Commercia lVietnam Export Import Bank', 'EIB', NULL, NULL, 0),
(32, 'Ngân Hàng TMCP Bưu điện Liên Việt', 'Joint stock commercial Lien Viet postal bank', 'LPB', NULL, NULL, 0),
(33, 'Ngân Hàng TMCP Ngoại thương Việt Nam', 'JSC Bank for Foreign Trade of Vietnam', 'VCB', NULL, NULL, 0),
(34, 'Ngân Hàng TMCP Công Thương Việt Nam', 'Vietnam Joint Stock Commercial Bank for Industry and Trade', 'VietinBank', NULL, NULL, 0),
(35, 'Ngân Hàng TMCP Đầu tư và Phát triển Việt Nam', 'JSC Bank for Investment and Development of Vietnam', 'BIDV', NULL, NULL, 0),
(36, 'Ngân hàng Chính sách xã hội', 'Vietnam Bank for Social Policies', 'NHCSXH', NULL, NULL, 0),
(37, 'Ngân hàng Phát triển Việt Nam', 'Vietnam Development Bank', 'VDB', NULL, NULL, 0),
(38, 'Ngân hàng Thương mại TNHH MTV Xây dựng Việt Nam', 'Construction Bank', 'CB', NULL, NULL, 0),
(39, 'Ngân hàng Thương mại TNHH MTV Đại Dương', 'Ocean Commercial One Member Limited Liability Bank', 'Oceanbank', NULL, NULL, 0),
(40, 'Ngân hàng Thương mại TNHH MTV Dầu Khí Toàn Cầu', 'Global Petro Commercial Joint Stock Bank', 'GPBank', NULL, NULL, 0),
(41, 'Ngân hàng Nông nghiệp và Phát triển Nông thôn Việt Nam', 'Vietnam Bank for Agriculture and Rural Development', 'Agribank', NULL, NULL, 0),
(42, 'Ngân hàng TNHH MTV ANZ (Việt Nam)', 'Australia And Newzealand Bank', '', NULL, NULL, 0),
(43, 'Deutsche Bank Việt Nam', 'Deutsche Bank AG', '', NULL, NULL, 0),
(44, 'Ngân hàng Citibank Việt Nam', 'Citibank', 'Citibank', NULL, NULL, 0),
(45, 'Ngân hàng TNHH MTV HSBC (Việt Nam)', 'HSBC', '', NULL, NULL, 0),
(46, 'Ngân hàng TNHH MTV Standard Chartered (Việt Nam)', 'Standard Chartered Bank (Vietnam) Limited', 'Standard Chartered', NULL, NULL, 0),
(47, 'Ngân hàng TNHH MTV Shinhan Việt Nam', 'Shinhan Vietnam Bank Limited', 'SHBVN', NULL, NULL, 0),
(48, 'Ngân hàng Hong Leong Việt Nam', 'Hong Leong Bank Vietnam Limited – HLBVN', '', NULL, NULL, 0),
(49, 'Ngân hàng Đầu tư và Phát triển Campuchia', '', 'BIDC', NULL, NULL, 0),
(50, 'Ngân Hàng Mizuho Bank', '', 'Mizuhobank', NULL, NULL, 0),
(51, 'Ngân hàng Tokyo-Mitsubishi UFJ', '', '', NULL, NULL, 0),
(52, 'Ngân hàng Sumitomo Mitsui Bank', '', '', NULL, NULL, 0),
(53, 'Ngân hàng TNHH MTV Public Việt Nam', '', 'PBBVN', NULL, NULL, 0),
(54, 'Ngân hàng Commonwealth Bank Việt Nam', '', '', NULL, NULL, 0),
(55, 'Ngân hàng United Overseas Bank Việt Nam', '', 'UOB', NULL, NULL, 0),
(56, 'Ngân hàng Bank of China', '', '', NULL, NULL, 0),
(57, 'Ngân hàng Maybank Việt Nam', '', '', NULL, NULL, 0),
(58, 'Ngân Hàng Công Thương Trung Quốc (ICBC)', '', ' ICBC', NULL, NULL, 0),
(59, 'Ngân hàng Scotiabank', '', '', NULL, NULL, 0),
(60, 'Ngân hàng Commercial Siam Bank Việt Nam', '', '', NULL, NULL, 0),
(61, 'Ngân Hàng Bnp Paribas', '', '', NULL, NULL, 0),
(62, 'Ngân hàng Bankok bank Việt Nam', '', '', NULL, NULL, 0),
(63, 'Ngân hàng Worldbank Việt Nam', '', '', NULL, NULL, 0),
(64, 'Ngân hàng Woori bank Việt Nam', '', '', NULL, NULL, 0),
(65, 'Ngân hàng RHB (Malaysia) tại Việt Nam', '', '', NULL, NULL, 0),
(66, 'Ngân hàng Intesa Sanpaolo (Italia) tại Việt Nam', '', '', NULL, NULL, 0),
(67, 'Ngân hàng JP Morgan Chase Bank (Mỹ) tại Việt Nam', '', '', NULL, NULL, 0),
(68, 'Ngân hàng Wells Fargo (Mỹ) tại Việt Nam', '', '', NULL, NULL, 0),
(69, 'Ngân hàng BHF – Bank Aktiengesellschaft (Đức) tại Việt Nam', '', '', NULL, NULL, 0),
(70, 'Ngân hàng Unicredit Bank AG (Đức) tại Việt Nam', '', '', NULL, NULL, 0),
(71, 'Ngân hàng Landesbank Baden-Wuerttemberg (Đức) tại Việt Nam', '', '', NULL, NULL, 0),
(72, 'Ngân hàng Commerzbank AG (Đức) tại Việt Nam', '', '', NULL, NULL, 0),
(73, 'Ngân hàng Bank Sinopac (Đài Loan) tại Việt Nam', '', '', NULL, NULL, 0),
(74, 'Ngân hàng Chinatrust Commercial Bank (Đài Loan) tại Việt Nam', '', '', NULL, NULL, 0),
(75, 'Ngân hàng Union Bank of Taiwan (Đài Loan) tại Việt Nam', '', '', NULL, NULL, 0),
(76, 'Ngân hàng Hua Nan Commercial Bank  Ltd (Đài Loan) tại Việt Nam', '', '', NULL, NULL, 0),
(77, 'Ngân hàng Cathay United Bank (Đài Loan) tại Việt Nam', '', '', NULL, NULL, 0),
(78, 'Ngân hàng Taishin International Bank (Đài Loan) tại Việt Nam', '', '', NULL, NULL, 0),
(79, 'Ngân hàng Land Bank of Taiwan (Đài Loan) tại Việt Nam', '', '', NULL, NULL, 0),
(80, 'Ngân hàng The Shanghai Commercial and Savings Bank Ltd (Đài Loan) tại Việt Nam', '', '', NULL, NULL, 0),
(81, 'Ngân hàng Taiwan Shin Kong Commercial Bank (Đài Loan) tại Việt Nam', '', '', NULL, NULL, 0),
(82, 'Ngân hàng E.Sun Commercial Bank (Đài Loan) tại Việt Nam', '', '', NULL, NULL, 0),
(83, 'Ngân hàng Natixis Banque BFCE (Pháp) tại Việt Nam', '', '', NULL, NULL, 0),
(84, 'Ngân hàng Société Générale Bank – tại TP. HCM (Pháp) tại Việt Nam', '', '', NULL, NULL, 0),
(85, 'Ngân hàng Fortis Bank (Bỉ) tại Việt Nam', '', '', NULL, NULL, 0),
(86, 'Ngân hàng RBI (Áo) tại Việt Nam', '', '', NULL, NULL, 0),
(87, 'Ngân hàng Phongsavanh (Lào) tại Việt Nam', '', '', NULL, NULL, 0),
(88, 'Ngân hàng Acom Co., Ltd (Nhật) tại Việt Nam', '', '', NULL, NULL, 0),
(89, 'Ngân hàng Mitsubishi UFJ Lease & Finance Company Limited (Nhật) tại Việt Nam', '', '', NULL, NULL, 0),
(90, 'Ngân hàng Industrial Bank of Korea (Hàn Quốc) tại Việt Nam', '', '', NULL, NULL, 0),
(91, 'Ngân hàng Korea Exchange Bank (Hàn Quốc) tại Việt Nam', '', '', NULL, NULL, 0),
(92, 'Ngân hàng Kookmin Bank (Hàn Quốc) tại Việt Nam', '', '', NULL, NULL, 0),
(93, 'Ngân hàng Hana Bank (Hàn Quốc) tại Việt Nam', '', '', NULL, NULL, 0),
(94, 'Ngân hàng Bank of India (Ấn Độ) tại Việt Nam', '', '', NULL, NULL, 0),
(95, 'Ngân hàng Indian Oversea Bank (Ấn Độ) tại Việt Nam', '', '', NULL, NULL, 0),
(96, 'Ngân hàng Rothschild Limited (Singapore) tại Việt Nam', '', '', NULL, NULL, 0),
(97, 'Ngân hàng The Export-Import Bank of Korea (Hàn Quốc) tại Việt Nam', '', '', NULL, NULL, 0),
(98, 'Ngân hàng Busan – (Hàn Quốc) tại Việt Nam', '', '', NULL, NULL, 0),
(99, 'Ngân hàng Ogaki Kyorítu (Nhật Bản) tại Việt Nam', '', '', NULL, NULL, 0),
(100, 'Ngân hàng Phát triển Hàn Quốc (Hàn Quốc) tại Việt Nam', '', '', NULL, NULL, 0),
(101, 'Ngân hàng Phát triển Châu Á và Việt Nam', '', '', NULL, NULL, 0),
(102, 'Ngân hàng Oversea-Chinese Banking Corporation LTD', '', ' OCBC', NULL, NULL, 0),
(103, 'Ngân hàng TNHH Indovina', '', 'IVB', NULL, NULL, 0),
(104, 'Ngân hàng Liên doanh Việt – Nga', '', 'VRB', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hicrm_bank_accounts`
--

CREATE TABLE `hicrm_bank_accounts` (
  `id` int(11) NOT NULL,
  `bank_id` int(11) NOT NULL,
  `ba_branch_id` int(11) NOT NULL,
  `ba_account` varchar(30) NOT NULL,
  `ba_holder` varchar(255) NOT NULL,
  `ba_branch` text NOT NULL,
  `ba_description` text DEFAULT NULL,
  `ba_status` int(11) NOT NULL,
  `ba_primary` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `hicrm_bank_accounts`
--

INSERT INTO `hicrm_bank_accounts` (`id`, `bank_id`, `ba_branch_id`, `ba_account`, `ba_holder`, `ba_branch`, `ba_description`, `ba_status`, `ba_primary`) VALUES
(1, 5, 1, '501320555942', 'Vũ Xuân Cương', 'Huyện Kongchro, Tỉnh Gia Lai', '', 1, 0),
(2, 5, 0, '50132055591', 'Vũ Xuân Cương', 'Huyện Kongchro, Tỉnh Gia Lai', 'TEst a', 99, 0),
(3, 5, 0, '501320555943', 'Vũ Xuân Cương', 'Huyện Kongchro, Tỉnh Gia Lai', 'Nhân bản', 2, 0),
(4, 3, 0, '501320555944', 'Vũ Xuân Cương', 'Huyện Kongchro, Tỉnh Gia Lai', 'Nhân bản 2', 99, 0),
(5, 4, 0, '1 1 1111111111111', 'haauj', 'gia lai', '', 99, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hicrm_bookings`
--

CREATE TABLE `hicrm_bookings` (
  `id` bigint(20) NOT NULL,
  `booking_person_name` varchar(255) DEFAULT NULL,
  `booking_person_gender` int(11) NOT NULL,
  `booking_person_year` int(11) NOT NULL,
  `booking_person_address` varchar(255) DEFAULT NULL,
  `booking_person_phone` varchar(255) NOT NULL,
  `booking_doctor` int(11) DEFAULT 0,
  `booking_date` date DEFAULT NULL,
  `booking_hour` varchar(255) NOT NULL,
  `booking_title` varchar(255) DEFAULT NULL,
  `booking_description` text DEFAULT NULL,
  `booking_created_date` datetime DEFAULT NULL,
  `booking_status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hicrm_booking_status`
--

CREATE TABLE `hicrm_booking_status` (
  `id` int(11) NOT NULL,
  `bk_status_label` varchar(80) NOT NULL,
  `bk_status_class` varchar(100) DEFAULT NULL,
  `bk_status_icon` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `hicrm_booking_status`
--

INSERT INTO `hicrm_booking_status` (`id`, `bk_status_label`, `bk_status_class`, `bk_status_icon`) VALUES
(1, 'Mới', 'primary ', ''),
(2, 'Đã duyệt', 'success', NULL),
(3, 'Đã hủy', 'danger', NULL),
(4, 'Khác', 'warning', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hicrm_candidates`
--

CREATE TABLE `hicrm_candidates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `full_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Họ và tên',
  `date_of_birth` date DEFAULT NULL,
  `gender` enum('male','female','other') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_url` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `province_id` int(11) DEFAULT NULL COMMENT 'Địa chỉ hiện tại',
  `address_detail` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `degree` enum('high_school','intermediate','college','university','postgraduate','other') COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Bằng cấp cao nhất',
  `major` int(11) DEFAULT NULL COMMENT 'Chuyên ngành',
  `graduation_year` year(4) DEFAULT NULL,
  `school_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Trường đã học',
  `soft_skills` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JSON: [{skill, level}]',
  `career_goal` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mục tiêu',
  `career_goal_short` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `career_goal_long` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desired_position` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Vị trí muốn ứng tuyển',
  `desired_salary` int(11) DEFAULT NULL COMMENT 'Mức lương mong muốn',
  `desired_province_id` int(11) DEFAULT NULL COMMENT 'Địa điểm làm việc mong muốn',
  `desired_work_type` enum('full_time','part_time','remote','hybrid','any') COLLATE utf8mb4_unicode_ci DEFAULT 'any',
  `cv_url` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'File CV (PDF/DOCX)',
  `cv_uploaded_at` datetime DEFAULT NULL,
  `is_seeking` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'Đang tìm việc',
  `profile_completeness` tinyint(3) UNSIGNED DEFAULT 0 COMMENT 'Phần trăm hoàn thiện hồ sơ',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=draft, 1=pending, 2=approved, 3=needs_update'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Hồ sơ ứng viên/sinh viên tìm việc';

--
-- Đang đổ dữ liệu cho bảng `hicrm_candidates`
--

INSERT INTO `hicrm_candidates` (`id`, `user_id`, `full_name`, `date_of_birth`, `gender`, `phone`, `avatar_url`, `province_id`, `address_detail`, `degree`, `major`, `graduation_year`, `school_name`, `soft_skills`, `career_goal`, `career_goal_short`, `career_goal_long`, `desired_position`, `desired_salary`, `desired_province_id`, `desired_work_type`, `cv_url`, `cv_uploaded_at`, `is_seeking`, `profile_completeness`, `created_at`, `updated_at`, `status`) VALUES
(1, 32, 'Cương Vũ Xuân', '1998-09-27', 'male', '0828228339', 'uploads/candidate-profiles/avatar_1_20260725014131_b9daeb1e1a50365a0c4ad9d6.png', 22, 'Hoàn Văn Thụ - Kon Tum', 'postgraduate', 1, 2024, 'Phân hiệu Đại học Đà Nẵng tại Kon Tum', '[\"excel\",\"english\",\"php\",\"python\",\"sql.\"]', 'Trở thành lập trình viên Backend vững chuyên môn, thành thạo PHP, MySQL và RESTful API, tham gia phát triển các hệ thống quản lý doanh nghiệp, không ngừng học hỏi công nghệ mới và nâng cao chất lượng mã nguồn', 'Trở thành lập trình viên Backend vững chuyên môn, thành thạo PHP, MySQL và RESTful API, tham gia phát triển các hệ thống quản lý doanh nghiệp, không ngừng học hỏi công nghệ mới và nâng cao chất lượng mã nguồn', 'Trở thành lập trình viên Backend vững chuyên môn, thành thạo PHP, MySQL và RESTful API, tham gia phát triển các hệ thống quản lý doanh nghiệp, không ngừng học hỏi công nghệ mới và nâng cao chất lượng mã nguồn', 'Nhân viên CNTT', 9, 22, 'full_time', 'uploads/candidate-profiles/cv_1_20260725014131_5de93b22fa1579aa16bf9655.pdf', '2026-07-25 01:41:31', 1, 100, '2026-06-20 09:15:37', '2026-07-24 18:43:14', 3),
(2, 47, 'Vũ Xuân Cương', '1998-09-27', 'male', '0828228339', 'uploads/candidate-profiles/avatar_2_20260725013511_49f9a2073ac1dab211d5cf18.png', 22, 'Hoàn văn thụ - Kon tum', 'postgraduate', 1, 2024, 'Phân hiệu đại học đà nẵng Tại Kon Tum', '[\"excel\",\"english\",\"php\",\"python\",\"sql.\"]', 'Trở thành lập trình viên Backend vững chuyên môn, thành thạo PHP, MySQL và RESTful API, tham gia phát triển các hệ thống quản lý doanh nghiệp, không ngừng học hỏi công nghệ mới và nâng cao chất lượng mã nguồn', 'Trở thành lập trình viên Backend vững chuyên môn, thành thạo PHP, MySQL và RESTful API, tham gia phát triển các hệ thống quản lý doanh nghiệp, không ngừng học hỏi công nghệ mới và nâng cao chất lượng mã nguồn', 'Trở thành lập trình viên Backend vững chuyên môn, thành thạo PHP, MySQL và RESTful API, tham gia phát triển các hệ thống quản lý doanh nghiệp, không ngừng học hỏi công nghệ mới và nâng cao chất lượng mã nguồn', 'Nhân viên CNTT', 8, 22, 'any', 'uploads/candidate-profiles/cv_2_20260725013511_5f536e14f813d2e382247713.pdf', '2026-07-25 01:35:11', 1, 100, '2026-06-21 02:05:31', '2026-07-24 18:35:11', 99),
(3, 48, 'Phan Hùng Phúc', NULL, NULL, '0336579210', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'any', NULL, NULL, 1, 20, '2026-06-24 03:03:03', '2026-07-24 16:57:58', 99),
(4, 1, 'Vũ Xuân Cương', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'any', NULL, NULL, 1, 15, '2026-06-28 06:53:56', '2026-07-24 16:58:24', 99),
(5, 50, 'Vũ Xuân Cương test', NULL, NULL, '0828228339', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'any', NULL, NULL, 1, 20, '2026-07-06 13:59:12', '2026-07-24 16:58:04', 99),
(6, 55, 'Hà Phú Quý', '1998-09-27', 'male', '08643616497', 'uploads/candidate-profiles/avatar_6_20260719154512_f6ed01d7e18311252ada8030.png', 32, 'Hoàn văn thụ - Kon tum', 'high_school', 66, 2026, 'Trường Cao đẳng Kon Tum', '[\"excel\",\"english\",\"php\",\"python\",\"sql.\"]', 'Trở thành quản lý trong 3 năm tới', 'Tôi mong muốn tìm được công việc và mức lương mong muốn', 'Trở thành quản lý trong 3 năm tới', 'Nhân viên CNTT', 8, 32, 'remote', 'uploads/candidate-profiles/avatar_6_20260719154512_f6ed01d7e18311252ada8030.png', '2026-07-19 15:45:12', 1, 100, '2026-07-10 15:40:08', '2026-08-02 13:57:56', 1),
(7, 60, 'Công Hải', '2004-02-07', 'male', '0353878958', 'uploads/candidate-profiles/avatar_7_20260724012055_ec0d8ab3389c48a17c15aad3.png', 28, '48 Nguyễn Bặc, Phường Đắk Bla, Tỉnh Quảng Ngãi', 'university', 66, 2026, 'Phân hiệu Đại học Đà Nẵng tại Kon Tum', '[\"Thành thạo Word\",\"Thành thạo Excel\"]', 'Với kinh nghiệm và nền tảng hiện tại, mục tiêu của tôi là vừa làm việc vừa học hỏi, tích cực trao đổi kiến ​​thức và kinh nghiệm khi gia nhập công ty, nhằm không ngừng nâng cao kỹ năng chuyên môn.', 'Với kinh nghiệm và nền tảng hiện tại, mục tiêu của tôi là vừa làm việc vừa học hỏi, tích cực trao đổi kiến ​​thức và kinh nghiệm khi gia nhập công ty, nhằm không ngừng nâng cao kỹ năng chuyên môn.', 'Với kinh nghiệm và nền tảng hiện tại, mục tiêu của tôi là vừa làm việc vừa học hỏi, tích cực trao đổi kiến ​​thức và kinh nghiệm khi gia nhập công ty, nhằm không ngừng nâng cao kỹ năng chuyên môn.', 'THỰC TẬP SINH CNTT', 11, 22, 'full_time', 'uploads/candidate-profiles/cv_7_20260724012055_3fc8a6d2d783cf0ad455ae5f.pdf', '2026-07-24 01:20:55', 1, 100, '2026-07-23 15:28:32', '2026-07-25 19:50:16', 3),
(8, 65, 'Phan Hoàng Anh', '2004-08-30', 'male', '0976543218', 'uploads/candidate-profiles/avatar_8_20260725014726_ca227482c2b2d7668ed6d57c.jpg', 28, '42 Đại lộ Bình Dương, TP. Thủ Dầu Một, Bình Dương', 'college', 20, 2026, 'Cao đẳng Việt Nam - Singapore', '[\"Đàm phán\",\"Giao tiếp\",\"Chăm sóc khách hàng\",\"Excel\",\"Bán hàng\"]', 'Trở thành Trưởng nhóm Kinh doanh, xây dựng đội ngũ bán hàng chuyên nghiệp.', 'Hoàn thành vượt chỉ tiêu doanh số, mở rộng mạng lưới khách hàng doanh nghiệp.', 'Trở thành Trưởng nhóm Kinh doanh, xây dựng đội ngũ bán hàng chuyên nghiệp.', 'Nhân viên Kinh doanh', 6, 28, 'full_time', 'uploads/candidate-profiles/cv_8_20260725014726_52ce36f609ec9325affd7d74.pdf', '2026-07-25 01:47:26', 1, 100, '2026-07-23 15:50:52', '2026-07-24 18:47:36', 3),
(9, 63, 'Lương Văn Sang', '2004-04-18', 'male', '0987654322', 'uploads/candidate-profiles/avatar_9_20260724000609_453b0ca0682547c43c59d527.png', 22, 'Phường Kon Tum, Tỉnh Quảng Ngãi', 'university', 1, 2026, 'Phân hiệu Đại học Đà Nẵng tại Kon Tum', '[\"Thành thạo Word\",\"Thành thạo Excel\"]', 'Sinh viên năm cuối ngành Công nghệ Thông tin đang tìm kiếm vị trí thực tập sinh CNTT để áp dụng kiến ​​thức nền tảng về lập trình, cơ sở dữ liệu và phát triển phần mềm trong môi trường làm việc thực tế. Ở giai đoạn đầu, tôi mong muốn tích lũy kinh nghiệm thực tế, nâng cao kỹ năng kỹ thuật và phát triển thành Lập trình viên Junior trong tương lai.', 'Sinh viên năm cuối ngành Công nghệ Thông tin đang tìm kiếm vị trí thực tập sinh CNTT để áp dụng kiến ​​thức nền tảng về lập trình, cơ sở dữ liệu và phát triển phần mềm trong môi trường làm việc thực tế. Ở giai đoạn đầu, tôi mong muốn tích lũy kinh nghiệm thực tế, nâng cao kỹ năng kỹ thuật và phát triển thành Lập trình viên Junior trong tương lai.', 'Sinh viên năm cuối ngành Công nghệ Thông tin đang tìm kiếm vị trí thực tập sinh CNTT để áp dụng kiến ​​thức nền tảng về lập trình, cơ sở dữ liệu và phát triển phần mềm trong môi trường làm việc thực tế. Ở giai đoạn đầu, tôi mong muốn tích lũy kinh nghiệm thực tế, nâng cao kỹ năng kỹ thuật và phát triển thành Lập trình viên Junior trong tương lai.', 'THỰC TẬP SINH CNTT', 11, 28, 'full_time', 'uploads/candidate-profiles/cv_9_20260724000609_3bea6cc0d74c407201dea74a.pdf', '2026-07-24 00:06:09', 1, 100, '2026-07-23 15:51:01', '2026-07-23 17:06:17', 3),
(10, 64, 'Đỗ Trúc Quyên', '2001-10-28', 'female', '0333940715', 'uploads/candidate-profiles/avatar_10_20260724002059_f799f8c04bd0c484cce15958.png', 21, 'Hà Huy Tập, Xuân Hà, Thanh Khê, Đà Nẵng', 'university', 44, 2023, 'Đại học Ngoại ngữ Huế', '[\"Thành thạo Word\",\"Thành thạo Excel\"]', 'Gắn bó lâu dài với công việc. Cống hiến năng lực, kinh nghiệm của bản thân để đảm bảo đem lại những lợi ích thiết thực cho khách hàng và giúp doanh nghiệm mở rộng tập khách hàng', 'Trở thành Nhân viên Lễ tân xuất sắc. Xử lý tốt các công việc của cấp trên giao và giải quyết yêu cầu\r\ntừ khách hàng.', 'Gắn bó lâu dài với công việc. Cống hiến năng lực, kinh nghiệm của bản thân để đảm bảo đem lại những lợi ích thiết thực cho khách hàng và giúp doanh nghiệm mở rộng tập khách hàng', 'NHÂN VIÊN LỄ TÂN', 11, 21, 'full_time', 'uploads/candidate-profiles/cv_10_20260724002059_b374d035fc3640213192a71f.pdf', '2026-07-24 00:20:59', 1, 100, '2026-07-23 15:51:08', '2026-07-23 17:23:48', 3),
(11, 61, 'Đỗ Quỳnh Nhi', '2004-08-30', 'female', '0338110734', 'uploads/candidate-profiles/avatar_11_20260723231356_8c44d48d6547acbc144b87a5.jpg', 22, 'Lý Thường Kiệt, thành phố Hồ Chí Minh', 'university', 48, 2026, 'Đại học Duy Tân', '[\"Ngoại ngữ tiếng Anh và Trung\",\"Thành thạo Excel\",\"word\"]', 'Mục tiêu dài hạn: Trong 2- 3 năm trở thành chuyên viên Content Marketing chuyên nghiệp,\r\ncó khả năng xây dựng chiến lược nội dung hiệu quả và phát triển lên các vị trí quản lý trong\r\nlĩnh vực Marketing.', 'Mục tiêu ngắn hạn: 3 - 6 tháng đầu phát huy khả năng sáng tạo nội dung, học hỏi kinh\r\nnghiệm thực tế và nâng cao kỹ năng SEO, Social Media, Content Marketing.', 'Mục tiêu dài hạn: Trong 2- 3 năm trở thành chuyên viên Content Marketing chuyên nghiệp,\r\ncó khả năng xây dựng chiến lược nội dung hiệu quả và phát triển lên các vị trí quản lý trong\r\nlĩnh vực Marketing.', 'CONTENT MARKETING', 11, 28, 'full_time', 'uploads/candidate-profiles/cv_11_20260723231356_839d61ff701ef6493f21e708.pdf', '2026-07-23 23:13:56', 1, 100, '2026-07-23 15:51:17', '2026-07-23 16:21:53', 3),
(12, 72, 'Nguyễn Minh Trang', '2003-12-06', 'female', '034612 6612', 'uploads/candidate-profiles/avatar_12_20260724231207_5e6ae6ab0817107ba5d18560.jpg', 1, 'Thanh Xuân, Hà Nội', 'university', 13, 2025, 'Đại học Ngoại thương Hà Nội', '[\"Thành thạo Word\"]', 'Xây dựng sự nghiệp trong lĩnh vực Kiểm toán và Tài chính, trong môi trường làm việc chuyên nghiệp.', 'Là một sinh viên năm cuối trường đại học Ngoại thương, tự tin với khả năng nghiên cứu, phân tích và tổng hợp thông tin; khả năng giao tiếp và truyền cảm hứng, luôn đề cao kỷ luật và trách nhiệm trong công việc.\r\nMục tiêu ngắn hạn:\r\nĐạt 8.0 IELTS; Tốt nghiệp đại học Ngoại thương bằng Xuất sắc\r\nThành công gia nhập một công ty có môi trường làm việc chuyên nghiệp trong lĩnh vực Kiểm toán.', 'Xây dựng sự nghiệp trong lĩnh vực Kiểm toán và Tài chính, trong môi trường làm việc chuyên nghiệp.', 'Audit intern', 5, 1, 'full_time', 'uploads/candidate-profiles/cv_12_20260724231207_bad84cacfbe96a5c34dd1b53.pdf', '2026-07-24 23:12:07', 1, 100, '2026-07-24 15:28:29', '2026-07-24 16:13:25', 3),
(13, 69, 'Đào Nguyễn Quốc Chân', '2001-02-13', 'male', '0839219271', 'uploads/candidate-profiles/avatar_13_20260724233326_2390e8f03970189fadd3130b.png', 28, 'Số762, CMT8,phường Phong Toàn, thành phố Bà Rịa Vũng Tàu', 'college', 25, 2021, 'Cao đẳng Dầu Khí', '[\"Thành thạo Word\"]', 'Trở thành chuyên gia vận hành hệ thống, có khả năng quản lý và tối ưu hạ tầng CNTT, ứng dụng tự động hóa trong vận hành, góp phần nâng cao tính ổn định, bảo mật và hiệu quả của hệ thống, đồng thời phát triển lên vị trí quản lý kỹ thuật trong tương lai.', 'Nắm vững quy trình vận hành hệ thống, đảm bảo hệ thống hoạt động ổn định, xử lý sự cố nhanh chóng, nâng cao chất lượng hỗ trợ người dùng và chuẩn hóa quy trình vận hành.', 'Trở thành chuyên gia vận hành hệ thống, có khả năng quản lý và tối ưu hạ tầng CNTT, ứng dụng tự động hóa trong vận hành, góp phần nâng cao tính ổn định, bảo mật và hiệu quả của hệ thống, đồng thời phát triển lên vị trí quản lý kỹ thuật trong tương lai.', 'Nhân viên vận hành hệ thống', 7, 28, 'full_time', 'uploads/candidate-profiles/cv_13_20260724233326_e8f14989847d2ab5da0716ae.pdf', '2026-07-24 23:33:26', 1, 100, '2026-07-24 16:14:50', '2026-07-24 16:35:29', 3),
(14, 70, 'NGUYỄN LÊ BẢO NGỌC', '2000-04-19', 'female', '0353878959', 'uploads/candidate-profiles/avatar_14_20260724235608_3f6d11358274278469ddbba3.png', 28, '11 Doan Van Bo, Quận 4, Hồ Chí Minh, Việt Nam', 'university', 2, 2020, 'Đại học Kinh tế Quốc Dân', '[\"Thành thạo Word\",\"Thành thạo Excel\"]', 'Tôi là một người quản lý sản phẩm năng động và có tầm nhìn xa, với 7 năm kinh nghiệm trong môi trường SaaS năng động. Tôi rất mong muốn hỗ trợ đội ngũ của SefTech bằng vai trò lãnh đạo và hướng dẫn trong nhiều nỗ lực phát triển sản phẩm. Trong các vai trò trước đây, tôi đã giảm thời gian giao hàng xuống 20% ​​và điều phối được 95% tiến độ hoàn thành sản phẩm theo đúng lộ trình của công ty.', 'Tôi là một người quản lý sản phẩm năng động và có tầm nhìn xa, với 7 năm kinh nghiệm trong môi trường SaaS năng động. Tôi rất mong muốn hỗ trợ đội ngũ của SefTech bằng vai trò lãnh đạo và hướng dẫn trong nhiều nỗ lực phát triển sản phẩm. Trong các vai trò trước đây, tôi đã giảm thời gian giao hàng xuống 20% ​​và điều phối được 95% tiến độ hoàn thành sản phẩm theo đúng lộ trình của công ty.', 'Tôi là một người quản lý sản phẩm năng động và có tầm nhìn xa, với 7 năm kinh nghiệm trong môi trường SaaS năng động. Tôi rất mong muốn hỗ trợ đội ngũ của SefTech bằng vai trò lãnh đạo và hướng dẫn trong nhiều nỗ lực phát triển sản phẩm. Trong các vai trò trước đây, tôi đã giảm thời gian giao hàng xuống 20% ​​và điều phối được 95% tiến độ hoàn thành sản phẩm theo đúng lộ trình của công ty.', 'Quản lý sản phẩm cấp cao', 8, 28, 'full_time', 'uploads/candidate-profiles/cv_14_20260724235608_c8bc8ed75921943e475f5ef1.pdf', '2026-07-24 23:56:08', 1, 100, '2026-07-24 16:47:07', '2026-07-24 16:56:36', 3),
(15, 71, 'Nguyễn Văn Minh', '1999-08-15', 'male', '0983124567', 'uploads/candidate-profiles/avatar_15_20260725005134_d37ab4bc524c9ad3eda419ca.jpg', 28, '120 Nguyễn Văn Linh, Phường Tân Thuận, TP. Hồ Chí Minh', 'university', 1, 2022, 'Đại học Công nghiệp TP. Hồ Chí Minh', '[\"Giao tiếp\",\"Làm việc nhóm\",\"Tin học văn phòng\",\"Excel\",\"Tiếng Anh\",\"Giải quyết vấn đề\"]', 'Trở thành Quản trị hệ thống hoặc DevOps Engineer, tham gia xây dựng hạ tầng CNTT quy mô lớn.', 'Tích lũy kinh nghiệm vận hành và quản trị hệ thống doanh nghiệp, nâng cao kỹ năng xử lý sự cố.', 'Trở thành Quản trị hệ thống hoặc DevOps Engineer, tham gia xây dựng hạ tầng CNTT quy mô lớn.', 'Nhân viên Vận hành Hệ thống', 7, 28, 'full_time', 'uploads/candidate-profiles/cv_15_20260725005134_95e727e41cb215dd426714bd.pdf', '2026-07-25 00:51:34', 1, 100, '2026-07-24 16:59:41', '2026-07-24 17:52:15', 3),
(16, 59, 'Trần Thị Lan', '2000-11-20', 'female', '0915678234', 'uploads/candidate-profiles/avatar_16_20260725011936_877ef380c09f903055b1495f.jpg', 21, '52 Lê Duẩn, Hải Châu, Đà Nẵng', 'university', 11, 2023, 'Đại học Kinh tế Đà Nẵng', '[\"Excel\",\"Giao tiếp\",\"Làm việc nhóm\",\"Cẩn thận\",\"Quản lý thời gian\"]', 'Phát triển lên vị trí Kế toán trưởng và có chứng chỉ CPA.', 'Trở thành nhân viên kế toán tổng hợp, nâng cao kỹ năng nghiệp vụ và sử dụng thành thạo phần mềm kế toán.', 'Phát triển lên vị trí Kế toán trưởng và có chứng chỉ CPA.', 'Nhân viên Kế toán', 6, 21, 'full_time', 'uploads/candidate-profiles/cv_16_20260725011936_ca98802331af8283404878a3.pdf', '2026-07-25 01:19:36', 1, 100, '2026-07-24 18:15:39', '2026-07-24 18:19:56', 3),
(17, 68, 'Lê Quốc Huy', '1998-04-03', 'male', '0968234561', 'uploads/candidate-profiles/avatar_17_20260725012521_d66a637184bd24d84980750a.jpg', 1, '86 Cầu Giấy, Hà Nội', 'university', 2, 2021, 'Đại học FPT', '[\"PHP\",\"Laravel\",\"MySQL\",\"Git\",\"Giao tiếp\",\"Làm việc nhóm\"]', 'Trở thành Technical Leader, dẫn dắt đội ngũ phát triển phần mềm.', 'Tham gia các dự án phần mềm thực tế, nâng cao kỹ năng backend và tối ưu hệ thống.', 'Trở thành Technical Leader, dẫn dắt đội ngũ phát triển phần mềm.', 'Lập trình viên PHP Backend', 8, 1, 'full_time', 'uploads/candidate-profiles/cv_17_20260725012521_da4c71328c61fbedaae1cd28.pdf', '2026-07-25 01:25:21', 1, 100, '2026-07-24 18:20:54', '2026-07-24 18:25:37', 3),
(19, 54, 'Lý Thu Yến', NULL, NULL, '0935423978', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'any', NULL, NULL, 1, 20, '2026-07-25 20:51:09', '2026-07-25 20:51:09', 1),
(21, 62, 'Phan Hoàng Anh', '2004-08-30', 'male', '0976543218', 'uploads/candidate-profiles/avatar_8_20260725014726_ca227482c2b2d7668ed6d57c.jpg', 28, '42 Đại lộ Bình Dương, TP. Thủ Dầu Một, Bình Dương', 'college', 20, 2026, 'Cao đẳng Việt Nam - Singapore', '[\"Đàm phán\",\"Giao tiếp\",\"Chăm sóc khách hàng\",\"Excel\",\"Bán hàng\"]', 'Trở thành Trưởng nhóm Kinh doanh, xây dựng đội ngũ bán hàng chuyên nghiệp.', 'Hoàn thành vượt chỉ tiêu doanh số, mở rộng mạng lưới khách hàng doanh nghiệp.', 'Trở thành Trưởng nhóm Kinh doanh, xây dựng đội ngũ bán hàng chuyên nghiệp.', 'Nhân viên Kinh doanh', 6, 28, 'full_time', 'uploads/candidate-profiles/cv_8_20260725014726_52ce36f609ec9325affd7d74.pdf', '2026-07-25 01:47:26', 1, 100, '2026-07-23 15:50:52', '2026-07-24 18:47:36', 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hicrm_candidate_certificates`
--

CREATE TABLE `hicrm_candidate_certificates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `candidate_id` bigint(20) UNSIGNED NOT NULL,
  `cert_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Tên chứng chỉ/bằng cấp ngắn hạn',
  `issuer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Tổ chức cấp',
  `issued_date` date DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `cert_url` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'File/link chứng chỉ',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Chứng chỉ của ứng viên';

--
-- Đang đổ dữ liệu cho bảng `hicrm_candidate_certificates`
--

INSERT INTO `hicrm_candidate_certificates` (`id`, `candidate_id`, `cert_name`, `issuer`, `issued_date`, `expiry_date`, `cert_url`, `created_at`) VALUES
(1, 11, 'HSK2', 'Trung tâm huấn luyện và khảo thí Duy Tân LTC', NULL, NULL, '', '2026-07-23 16:13:56'),
(2, 10, 'Chứng chỉ tiếng Anh B1', '', NULL, NULL, '', '2026-07-23 17:20:59'),
(3, 10, 'Chứng chỉ tiếng Trung trình độ B2', '', NULL, NULL, '', '2026-07-23 17:20:59'),
(5, 7, 'HSK2', 'Trung tâm huấn luyện và khảo thí Duy Tân LTC', NULL, '2027-01-01', '', '2026-07-23 18:20:55'),
(6, 12, 'IELTS', 'IDP Education (Việt Nam)', '2025-01-01', '2027-01-01', '', '2026-07-24 16:12:07'),
(7, 17, 'TOEIC 780', '', NULL, NULL, '', '2026-07-24 18:25:21'),
(14, 2, 'Chứng chỉ Lập trình Web Full Stack', '', NULL, NULL, '', '2026-07-24 18:35:11'),
(15, 2, 'Chứng chỉ Google Cybersecurity Foundations', '', NULL, NULL, '', '2026-07-24 18:35:11'),
(16, 2, 'TOEIC 780', '', NULL, NULL, '', '2026-07-24 18:35:11'),
(17, 1, 'TOEIC 780', '', NULL, NULL, '', '2026-07-24 18:41:31'),
(18, 1, 'Chứng chỉ Google Cybersecurity Foundations', '', NULL, NULL, '', '2026-07-24 18:41:31'),
(19, 1, 'Chứng chỉ Lập trình Web Full Stack', '', NULL, NULL, '', '2026-07-24 18:41:31'),
(20, 8, 'Chứng chỉ Kỹ năng bán hàng chuyên nghiệp', '', NULL, NULL, '', '2026-07-24 18:47:26'),
(21, 8, 'TOEIC 650', '', NULL, NULL, '', '2026-07-24 18:47:26');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hicrm_candidate_experiences`
--

CREATE TABLE `hicrm_candidate_experiences` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `candidate_id` bigint(20) UNSIGNED NOT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Tên công ty cũ',
  `position` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Vị trí/chức danh',
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL COMMENT 'NULL = hiện tại',
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mô tả nhiệm vụ chính',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Kinh nghiệm làm việc của ứng viên';

--
-- Đang đổ dữ liệu cho bảng `hicrm_candidate_experiences`
--

INSERT INTO `hicrm_candidate_experiences` (`id`, `candidate_id`, `company_name`, `position`, `start_date`, `end_date`, `description`, `created_at`) VALUES
(2, 11, 'TRUNG TÂM RAKURAKU - DU HỌC VÀ LÀM VIỆC NHẬT BẢN', 'Content Creator', '2025-04-01', '2025-09-01', '• Lên kế hoạch và sản xuất trung bình 15–20 bài đăng/tháng cho Fanpage và TikTok của\r\ntrung tâm.\r\n• Viết nội dung về khóa học tiếng Nhật, kinh nghiệm học JLPT và văn hóa Nhật Bản, đạt\r\ntrung bình 1.000–3.000 lượt tiếp cận/bài viết.\r\n• Phối hợp xây dựng hơn 30 video ngắn phục vụ hoạt động tuyển sinh và quảng bá thương\r\nhiệu.\r\n• Quản lý lịch đăng tải nội dung, đảm bảo 100% bài đăng đúng tiến độ theo kế hoạch\r\nmarketing.\r\n• Hỗ trợ triển khai 2–3 chiến dịch tuyển sinh, thu hút hơn 200 lượt đăng ký tư vấn từ các\r\nkênh trực tuyến.\r\n• Theo dõi và phân tích hiệu quả nội dung, góp phần tăng 30% lượng tương tác Fanpage\r\ntrong 6 tháng.\r\n• Tương tác với học viên và khách hàng , hỗ trợ phản hồi trung bình 20–30 tin nhắn/bình\r\nluận mỗi tuần', '2026-07-23 16:13:56'),
(3, 11, 'CÔNG TY TNHH DO AGENCY (Dự án TikTok Olay Miền Trung)', 'Content Marketing Intern', '2026-01-01', '2026-03-01', '• Quản lý lịch đăng tải cho 5+ kênh TikTok khách hàng, đảm bảo nội dung được triển khai\r\nđúng kế hoạch.\r\n• Nghiên cứu đối thủ để định hướng tuyến nội dung video ngắn theo mô hình Hook – Story –\r\nCTA nhằm tối ưu khả năng giữ chân người xem.\r\n• Phối hợp với đội ngũ Media trong quá trình quay dựng và chỉnh sửa video, đảm bảo sản\r\nxuất 3–5 video/tuần đúng tiến độ. Đạt trung bình 500+ lượt xem/video, nhiều video vượt\r\nmốc 1.000 lượt xem tự nhiên.\r\n• Triển khai xây dựng và quản lý Content Calendar theo tuần/tháng cho kênh TikTok Olay\r\nMiền Trung, đảm bảo sản xuất và đăng tải 15–20 nội dung/tháng đúng kế hoạch.', '2026-07-23 16:13:56'),
(4, 11, 'VIỆT DIAMOND - HAIR SALON', 'Freelancer', '2025-11-01', NULL, '• Hỗ trợ tư vấn khách hàng trên fanpage, xử lý trung bình 20–30 tin nhắn và bình luận mỗi\r\ntuần.\r\n• Phối hợp quay dựng và biên tập video Reels, trong đó nhiều video đạt 1.000 – 5.000 lượt\r\nxem tự nhiên.\r\n• Giúp fanpage tăng hơn 500 lượt theo dõi', '2026-07-23 16:13:56'),
(7, 9, 'VNPT Kon Tum', 'Thực tập sinh CNTT', '2025-01-01', '2025-03-01', '• Hỗ trợ vận hành và bảo trì hệ thống CNTT tại Trung tâm Công nghệ Thông tin.\r\n• Nghiên cứu các dịch vụ CNTT nội bộ và cơ sở hạ tầng công nghệ doanh nghiệp. • Có kinh nghiệm thực tế với cơ sở dữ liệu, hệ thống quản lý mã nguồn và các công cụ phát triển phần mềm.\r\n• Hỗ trợ quản lý hệ thống CNTT cơ bản và các nhiệm vụ vận hành.\r\n• Biên soạn và hoàn thành báo cáo thực tập.', '2026-07-23 17:06:09'),
(8, 9, 'FPT Telecom', 'Thực tập sinh Mạng', '2025-11-01', '2026-01-01', '• Hỗ trợ triển khai và cài đặt dịch vụ Internet và viễn thông.\r\n• Hỗ trợ khắc phục sự cố kết nối mạng và các vấn đề kỹ thuật.\r\n• Học hỏi và làm việc với cơ sở hạ tầng mạng doanh nghiệp và các thiết bị mạng.\r\n• Sử dụng các công cụ và phần mềm kỹ thuật để hỗ trợ vận hành và bảo trì hệ thống.\r\n• Phát triển kỹ năng làm việc nhóm, giao tiếp và kỹ năng kỹ thuật thực tiễn.', '2026-07-23 17:06:09'),
(9, 10, 'Trung tâm tiếng Trung 3H', 'Trợ giảng', '2022-10-01', NULL, 'Trợ giảng, tư vấn cho lớp học gồm 10 - 12 học viên\r\nLiên hệ, chăm sóc học viên trong suốt khoá học bằng\r\nFacebook, Zalo...', '2026-07-23 17:20:59'),
(10, 10, 'Lei Beauty Center', 'NHÂN VIÊN TƯ VẤN - CHĂM SÓC KHÁCH HÀNG', '2023-06-01', NULL, 'Đón tiếp, hướng dẫn trực tiếp trung bình 10 - 15 khách/\r\nngày đến sử dụng dịch vụ\r\nGiải đáp thắc mắc, tư vấn các dịch vụ làm đẹp trung\r\nbình 30-35 khách/ngày qua điện thoại, Facebook, Zalo.\r\nGọi điện, nhắn tin chăm sóc khách hàng tận tình trong\r\nvà sau quá trình sử dụng dịch vụ.\r\nPhân tích thông tin và nhu cầu khách hàng, giới thiệu\r\ndịch vụ phù hợp.\r\nMang về doanh thu 50 triệu/ tháng với dịch vụ giá trị 4-5\r\ntriệu/ gói.\r\nĐạt KPI liên tiếp trong vòng 3 tháng\r\nNhận được 85-90% phản hồi tốt về cách tư vấn và\r\nchăm sóc từ khách hàng.\r\nTỉ lệ khách hàng quay lại sử dụng dịch vụ lần 2 chiếm\r\nhơn 50% sau quá trình chăm sóc.', '2026-07-23 17:20:59'),
(13, 7, 'Công ty Cổ phần Viễn thông FPT - Chi nhánh Kon Tum', 'Thực tập sinh CNTT', '2025-11-10', '2026-01-18', 'Hỗ trợ cài đặt, cấu hình và bảo trì dịch vụ internet và mạng cho khách hàng.\r\nHỗ trợ nhân viên kỹ thuật khắc phục sự cố kết nối, modem và router.\r\nHỗ trợ giám sát hiệu suất mạng và lập báo cáo dịch vụ.', '2026-07-23 18:20:55'),
(14, 7, 'Trung tâm Công nghệ Thông tin – VNPT Kon Tum', 'Thực tập sinh CNTT', '0005-07-01', '0025-02-08', 'Cung cấp hỗ trợ kỹ thuật cho việc cài đặt, cấu hình và bảo trì máy tính và thiết bị mạng.\r\nHỗ trợ khắc phục sự cố phần cứng, phần mềm và các vấn đề mạng cơ bản.\r\nHỗ trợ giám sát hệ thống, sao lưu dữ liệu và bảo trì cơ sở hạ tầng CNTT.\r\nGhi chép các quy trình kỹ thuật và báo cáo các hoạt động thực tập hàng ngày.', '2026-07-23 18:20:55'),
(15, 12, 'Phê la cà phê', 'Nhân viên Bán hàng part-time', '2025-09-15', NULL, 'Thu ngân và hướng dẫn khách hàng', '2026-07-24 16:12:07'),
(16, 13, 'NHÀ MÁY PHÂN BÓN CA MAU', 'Thực tập', '2024-05-13', '2024-07-19', '- Học và hiểu hệ thống điện của nhà máy phân bón Ca Mau - Học phong cách làm việc của công ty về an toàn nhà máy, sự siêng năng trong công việc\r\n- Học bảo dưỡng động cơ, tháo lắp và đánh giá\r\ntình trạng hoạt động của động cơ. - Tìm hiểu các bước sửa chữa nhỏ, vừa và lớn của\r\nđộng cơ', '2026-07-24 16:33:26'),
(17, 13, 'CÔNG TY NĂNG LƯỢNG THỦY HẢI', 'Nhân viên vận hành', '2024-09-05', NULL, '- Vị trí làm việc: Nhân viên vận hành sản xuất hơi nước\r\n- Vận hành thiết bị động cơ - Kiểm tra động cơ\r\n- Giám sát và đánh giá các thông số vận hành\r\n- Tham gia bảo trì và vận hành', '2026-07-24 16:33:26'),
(18, 14, 'Navigos Group VN', 'Senior Product Manager', '2016-11-11', '2024-09-13', 'Quản lý sản phẩm lành nghề và giàu kinh nghiệm, có kinh nghiệm trong tiếp thị sản phẩm, giới thiệu sản phẩm và quản lý toàn bộ vòng đời sản phẩm từ khâu ý tưởng đến khi hoàn thiện. Có kinh nghiệm trong việc đánh giá mong muốn và yêu cầu của khách hàng và tạo ra sản phẩm đáp ứng thành công các tiêu chuẩn đó.', '2026-07-24 16:56:08'),
(19, 15, 'Công ty TNHH ABI', 'Nhân viên IT Helpdesk', '2022-06-12', NULL, 'Hỗ trợ người dùng.\r\nCài đặt phần mềm.\r\nQuản lý máy tính và mạng nội bộ.\r\nXử lý sự cố hệ thống.', '2026-07-24 17:51:34'),
(20, 16, 'Công ty CP Minh Phát', 'Nhân viên Kế toán', '2024-08-15', NULL, 'Hạch toán chứng từ.\r\nTheo dõi công nợ.\r\nLập báo cáo thuế.\r\nĐối chiếu ngân hàng.', '2026-07-24 18:19:36'),
(21, 17, 'Công ty Hamo Software', 'Lập trình viên Backend', '2021-07-07', '2023-09-19', 'Thời gian: 07/2021 - Nay\r\nPhát triển API.\r\nThiết kế CSDL.\r\nBảo trì hệ thống ERP.\r\nTối ưu hiệu năng.', '2026-07-24 18:25:21'),
(24, 2, 'Công ty TNHH Giải pháp Công nghệ Sao Việt', 'Lập trình viên', '2024-06-19', '2026-06-20', 'Phát triển hệ thống quản lý doanh nghiệp bằng PHP MVC và MySQL.\r\nThiết kế và xây dựng RESTful API.\r\nThiết kế cơ sở dữ liệu và tối ưu truy vấn SQL.\r\nPhân quyền người dùng, xác thực và bảo mật hệ thống.\r\nBảo trì, sửa lỗi và nâng cấp các chức năng theo yêu cầu khách hàng.\r\nSử dụng Git để quản lý mã nguồn và phối hợp với nhóm phát triển.', '2026-07-24 18:35:11'),
(25, 1, 'Công ty TNHH Giải pháp Công nghệ Sao Việt', 'Lập trình viên', '2024-06-19', '2025-06-20', 'Phát triển hệ thống quản lý doanh nghiệp bằng PHP MVC và MySQL.\r\nThiết kế và xây dựng RESTful API.\r\nThiết kế cơ sở dữ liệu và tối ưu truy vấn SQL.\r\nPhân quyền người dùng, xác thực và bảo mật hệ thống.\r\nBảo trì, sửa lỗi và nâng cấp các chức năng theo yêu cầu khách hàng.\r\nSử dụng Git để quản lý mã nguồn và phối hợp với nhóm phát triển.', '2026-07-24 18:41:31'),
(26, 8, 'Công ty TNHH Hoàng Gia', 'Nhân viên Kinh doanh', '2024-05-19', NULL, 'Tìm kiếm khách hàng.\r\nChăm sóc khách hàng hiện hữu.\r\nTư vấn sản phẩm.\r\nĐàm phán và ký kết hợp đồng.', '2026-07-24 18:47:26');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hicrm_categories`
--

CREATE TABLE `hicrm_categories` (
  `id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `category_description` text DEFAULT NULL,
  `category_parent` int(11) NOT NULL,
  `category_orderby` int(11) DEFAULT 0,
  `category_status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `hicrm_categories`
--

INSERT INTO `hicrm_categories` (`id`, `category_name`, `category_description`, `category_parent`, `category_orderby`, `category_status`) VALUES
(1, 'Tin nhà tuyển dụng', NULL, 5, NULL, 1),
(2, 'Tin ứng viên', NULL, 1, NULL, 1),
(3, 'Tin của trang', NULL, 1, NULL, 1),
(4, 'Cơ sở hạ tầng', NULL, 1, NULL, 99),
(5, 'Tại sao chọn chúng tôi?', NULL, 1, 0, 99),
(6, ' Khám chữa bệnh dịch vụ', '', 3, 0, 99),
(7, 'Khám chữa bệnh BHYT', '', 3, 0, 99),
(8, 'Giới thiệu nhà thuốc', NULL, 4, 0, 99),
(9, 'Chính sách bán hàng', NULL, 4, 0, 99),
(10, 'Đo chỉ số cân nặng - Chiều cao (BMI) Online', NULL, 0, 0, 99);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hicrm_configs`
--

CREATE TABLE `hicrm_configs` (
  `id` int(11) NOT NULL,
  `config_key` varchar(255) NOT NULL,
  `config_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `hicrm_configs`
--

INSERT INTO `hicrm_configs` (`id`, `config_key`, `config_value`) VALUES
(1, 'won_rate', '3765123123'),
(2, 'website_name', 'Bệnh viện đa khoa Khu vực Đăk Hà'),
(3, 'website_description', 'Bệnh viện đa khoa Khu vực Đăk Hà'),
(4, 'admin_email', 'vuxuancuong98gl@gmail.com'),
(5, 'smtp_server', ''),
(6, 'smtp_port', ''),
(7, 'smtp_protocol', ''),
(8, 'smtp_password', ''),
(9, 'sms_api_key', ''),
(10, 'agency_prefix', 'CMAG'),
(11, 'deposite_prefix', 'CMC'),
(12, 'minimun_fee', '10000'),
(13, 'admin_email.site_email', ''),
(14, 'site_phone', '02603.861.450'),
(15, 'site_email', 'admin@trungtamytedakha.vn'),
(16, 'site_address', '05 Đào Duy Từ,xã Đăk Hà, tỉnh Quảng Ngãi'),
(17, 'deposite_branch', ''),
(18, 'deposite_bank', 'vcb'),
(19, 'deposite_account', '8 6666 8888 1688'),
(20, 'deposite_holder', 'Xuan Cuong'),
(21, 'income_prefix', 'ALI'),
(22, 'customer_prefix', 'KH'),
(23, 'employee_prefix', 'BS'),
(24, 'warehouse_prefix', 'MK'),
(25, 'order_prefix', 'DH'),
(26, 'company_name', 'Xuan Cuong Development'),
(27, 'company_email', 'info@earthbornholistic.com.vn'),
(28, 'site_hotline', '02603.822.128.'),
(29, 'company_tax_id', '0315422622'),
(30, 'company_address', 'Kon Tum, Quảng Ngãi'),
(31, 'QUOTE_PREFIX', 'VMQ'),
(32, 'site_facebook', 'https://www.facebook.com/'),
(33, 'site_phonezalo', '0839995775'),
(34, 'P2A', '0'),
(35, 'facebook_url', 'https://www.facebook.com/');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hicrm_customers`
--

CREATE TABLE `hicrm_customers` (
  `id` bigint(20) NOT NULL,
  `customer_uid` int(11) NOT NULL,
  `customer_branch_id` int(11) DEFAULT NULL,
  `customer_code` varchar(25) NOT NULL,
  `customer_tax_code` varchar(20) DEFAULT NULL,
  `customer_name` mediumtext DEFAULT NULL,
  `customer_title` varchar(20) DEFAULT NULL,
  `customer_address` mediumtext DEFAULT NULL,
  `customer_phone` varchar(20) NOT NULL,
  `customer_email` varchar(255) NOT NULL,
  `customer_group` int(11) NOT NULL DEFAULT 1,
  `customer_type` int(11) NOT NULL DEFAULT 1,
  `customer_is_vendor` int(11) NOT NULL DEFAULT 0,
  `customer_loyalty_point` int(11) NOT NULL DEFAULT 0,
  `customer_staff` int(11) DEFAULT NULL,
  `customer_note` text DEFAULT NULL,
  `customer_payment_policy` int(11) NOT NULL,
  `customer_debit` int(11) NOT NULL,
  `customer_credit` int(11) NOT NULL,
  `customer_debt` decimal(20,2) NOT NULL DEFAULT 0.00,
  `customer_created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `customer_last_update` datetime DEFAULT NULL,
  `customer_status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `hicrm_customers`
--

INSERT INTO `hicrm_customers` (`id`, `customer_uid`, `customer_branch_id`, `customer_code`, `customer_tax_code`, `customer_name`, `customer_title`, `customer_address`, `customer_phone`, `customer_email`, `customer_group`, `customer_type`, `customer_is_vendor`, `customer_loyalty_point`, `customer_staff`, `customer_note`, `customer_payment_policy`, `customer_debit`, `customer_credit`, `customer_debt`, `customer_created_date`, `customer_last_update`, `customer_status`) VALUES
(1, 1, 1, 'KH0000001', '5901157710', 'Công ty TNHH Công nghệ và Đầu tư VCF', 'Thái Đình Sang', '86 Cách Mạng Tháng Tám, P. Hoa Lư, TP. Pleiku, Gia Lai', '02693883456', 'info@vcfmedia.com', 1, 1, 1, 0, 1, NULL, 1, 1111, 1111, '0.00', '2021-08-18 21:41:08', NULL, 1),
(2, 0, 0, 'KH0000002', '5901157710', 'Công ty TNHH Công nghệ và Đầu tư VCF', '', '86 Cách Mạng Tháng Tám, P. Hoa Lư, TP. Pleiku, Gia Lai', '02693883456', 'info@vcfmedia.com', 1, 1, 1, 0, 1, '', 1, 1111, 1111, '0.00', '2021-08-18 23:33:50', NULL, 99),
(3, 0, 0, 'KH0000003', '5901157710', 'Công ty TNHH Công nghệ và Đầu tư VCF', '', '86 Cách Mạng Tháng Tám, P. Hoa Lư, TP. Pleiku, Gia Lai', '02693883456', 'info@vcfmedia.com', 1, 1, 1, 0, 1, '', 1, 1111, 1111, '0.00', '2021-08-18 23:34:21', NULL, 99),
(4, 1, 0, 'KH0000004', '5901157710', 'Công ty TNHH Công nghệ và Đầu tư Phần mềm', '', '86 Cách Mạng Tháng Tám, P. Hoa Lư, TP. Pleiku, Gia Lai', '02693883456', 'info@vcfmedia.com', 1, 1, 1, 0, 1, '', 1, 1111, 1111, '0.00', '2021-08-18 23:35:06', NULL, 1),
(5, 0, 0, 'KH0000005', '5901157710', 'Công ty TNHH Công nghệ và Đầu tư VCF', '', '86 Cách Mạng Tháng Tám, P. Hoa Lư, TP. Pleiku, Gia Lai', '02693883456', 'info@vcfmedia.com', 1, 1, 1, 0, 1, '', 1, 1111, 1111, '0.00', '2021-08-19 00:05:33', NULL, 1),
(6, 0, 0, 'KH0000006', '5901157710', 'Công ty TNHH Công nghệ và Đầu tư VCF', '', '86 Cách Mạng Tháng Tám, P. Hoa Lư, TP. Pleiku, Gia Lai', '02693883456', 'info@vcfmedia.com', 1, 1, 1, 0, 1, '', 1, 1111, 1111, '0.00', '2021-08-19 00:13:11', NULL, 2),
(7, 0, 0, 'KH0000007', '5901157710', 'Công ty TNHH Công nghệ và Đầu tư VCF', '', '86 Cách Mạng Tháng Tám, P. Hoa Lư, TP. Pleiku, Gia Lai', '02693883456', 'info@vcfmedia.com', 1, 1, 1, 0, 1, '', 1, 1111, 1111, '0.00', '2021-08-19 00:13:15', NULL, 1),
(8, 0, 0, 'KH0000008', '5901157710', 'Công ty TNHH Công nghệ và Đầu tư VCF', '', '86 Cách Mạng Tháng Tám, P. Hoa Lư, TP. Pleiku, Gia Lai', '02693883456', 'info@vcfmedia.com', 2, 1, 1, 0, 1, '', 1, 1111, 1111, '0.00', '2021-08-19 00:13:21', NULL, 1),
(9, 0, 0, 'KH0000009', '7712312', 'Vcf Media', 'Nguyễn Trần Nhân Hậu', '86, Cách mạng tháng 8, Pleiku', '0997123123', 'Vuxuancuong@gmail.com', 1, 2, 2, 0, 1, 'Ghi chú ghi ở đây', 1, 1111, 1111, '0.00', '2021-08-19 13:57:47', '2021-08-19 13:57:47', 1),
(10, 0, 0, 'KH0000009', '7712312', 'Vcf Media', 'Nguyễn Trần Nhân Hậu', '86, Cách mạng tháng 8, Pleiku', '0997123123', 'Vuxuancuong@gmail.com', 1, 2, 2, 0, 1, 'Ghi chú ghi ở đây', 1, 1111, 1111, '0.00', '2021-08-19 13:58:18', '2021-08-19 13:58:18', 1),
(11, 0, 0, 'KH0000010', '77123122', 'Công ty TNHH Vcf Media Tây Nguyên', 'Nguyễn Trần Nhân Hậu', '86 - CMT8 - Hoa Lư - Pleiku', '0927123123', 'nguyentrannhanhau@gmail.com', 1, 2, 2, 0, 1, 'Nôi dung 1', 1, 1111, 1111, '0.00', '2021-08-19 14:05:32', '2021-08-19 14:05:32', 1),
(12, 0, 0, 'KH0000011', '5901157710', 'Công ty TNHH Công nghệ và Đầu tư VCF', '', '86 Cách Mạng Tháng Tám, P. Hoa Lư, TP. Pleiku, Gia Lai', '02693883456', 'info@vcfmedia.com', 1, 1, 1, 0, 1, '', 1, 1111, 1111, '0.00', '2021-08-20 10:06:18', NULL, 1),
(13, 0, 0, 'KH0000012', '77123122', 'Công ty TNHH Vcf Media Tây Nguyên', 'Nguyễn Trần Nhân Hậu', '86 - CMT8 - Hoa Lư - Pleiku', '0927123123', 'nguyentrannhanhau@gmail.com', 1, 2, 2, 0, 1, 'Nôi dung 1', 1, 1111, 1111, '0.00', '2021-08-21 10:49:21', NULL, 1),
(14, 0, 0, 'KH0000013', '5901157710', 'Công ty TNHH Công nghệ và Đầu tư VCF', '', '86 Cách Mạng Tháng Tám, P. Hoa Lư, TP. Pleiku, Gia Lai', '02693883456', 'info@vcfmedia.com', 1, 1, 1, 0, 1, '', 1, 1111, 1111, '0.00', '2021-08-22 15:32:28', NULL, 1),
(15, 0, 0, 'KH0000014', '7712312', 'Công ty TNHH Công nghệ và Đầu tư VCF', 'Nguyễn Trần Nhân Hậu', '86 Cách Mạng Tháng Tám, P. Hoa Lư, TP. Pleiku, Gia Lai', '02693883456', 'info@vcfmedia.com', 1, 1, 0, 0, 1, '', 1, 1111, 1111, '0.00', '2021-08-23 10:13:48', '2021-09-07 13:35:39', 1),
(16, 0, 0, 'KH0000015', '5901157710', 'Công ty TNHH Công nghệ và Đầu tư VCF', '', '86 Cách Mạng Tháng Tám, P. Hoa Lư, TP. Pleiku, Gia Lai', '02693883456', 'info@vcfmedia.com', 1, 1, 1, 0, 1, '', 1, 1111, 1111, '0.00', '2021-09-07 10:15:18', NULL, 99),
(17, 24, NULL, 'KH0000016', '7712312', 'Công ty TNHH Công nghệ và Đầu tư VCF', 'Nguyễn Trần Nhân Hậu', '86 Cách Mạng Tháng Tám, P. Hoa Lư, TP. Pleiku, Gia Lai', '02693883456', 'info@vcfmedia.com', 1, 1, 0, 0, 1, '', 1, 1111, 1111, '0.00', '2025-11-19 22:54:28', NULL, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hicrm_customer_banks`
--

CREATE TABLE `hicrm_customer_banks` (
  `id` int(11) NOT NULL,
  `cid` bigint(20) NOT NULL,
  `bank_account` varchar(50) NOT NULL,
  `bank_holder` varchar(255) NOT NULL,
  `bank_id` int(11) NOT NULL,
  `bank_branch` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hicrm_customer_feedback`
--

CREATE TABLE `hicrm_customer_feedback` (
  `id` int(11) NOT NULL,
  `customer_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `customer_phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `customer_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `customer_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL COMMENT '0: Chờ duyệt, 1: Đã duyệt, 2: Không duyệt 99: Ẩn',
  `rating` int(11) DEFAULT 0 COMMENT '1-5 sao',
  `create_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `hicrm_customer_feedback`
--

INSERT INTO `hicrm_customer_feedback` (`id`, `customer_name`, `customer_phone`, `customer_email`, `customer_address`, `content`, `status`, `rating`, `create_date`) VALUES
(1, 'vũ Xuân CƯơng', '0929981213', 'asb_a@gmail.com', 'aasdasd ', '0', 0, 0, '2026-03-01 22:18:05'),
(2, 'Vũ Xuân Cương', '0828228339', 'vuxuancuong98gl@gmail.com', 'Kon Tum, Quảng Ngãi', '0', 0, 0, '2026-03-04 23:17:38'),
(3, 'NNT', '0963719679', 'vuxuancuong98gl@gmail.com', 'Quảng Ngãi', 'Tôi rất hài lòng', 0, 0, '2026-03-04 23:21:55');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hicrm_customer_groups`
--

CREATE TABLE `hicrm_customer_groups` (
  `id` int(11) NOT NULL,
  `group_code` varchar(30) NOT NULL,
  `group_name` varchar(255) NOT NULL,
  `group_color` varchar(20) DEFAULT NULL,
  `group_description` text DEFAULT NULL,
  `group_status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `hicrm_customer_groups`
--

INSERT INTO `hicrm_customer_groups` (`id`, `group_code`, `group_name`, `group_color`, `group_description`, `group_status`) VALUES
(1, 'KHTN', 'Khách hàng tiềm năng', 'green', 'Diễn giải', 1),
(2, 'KHTN', 'Khách hàng tiềm năng', 'green', '', 99),
(3, 'KHTT', 'Khách hàng trung thành', '#000080', 'Khách hàng trung thành mua hàng', 2),
(4, 'KHTC', 'Khách hàng tiềm năng', '#C0C0C0', '', 99),
(5, 'KHNN', 'Khách hàng ngẫu nhiên', '#008080', '', 99),
(6, '', '', '', '', 99),
(7, 'KHTC', 'Khách hàng tiềm năng', 'red', '', 99),
(8, 'KHTN', 'Test', 'green', '', 99),
(9, 'T', 'Test', '00991', '', 99),
(10, 'KHTN', 'Khách hàng tiềm năng', '#000000', 'Khách hàng tiềm năng chốt sale', 1),
(11, '', '', '', '', 99),
(12, '', '', '', '', 99),
(13, '', '', '', '', 99),
(14, '', '', '', '', 99),
(15, '', '', '', '', 99),
(16, 'KHTN', 'Khách hàng tiềm năng', '#000080', '', 99),
(17, 'KHTT', 'Khách hàng tiềm năng', '#000080', '', 99),
(18, '00998', '', '', '', 99),
(19, 'TEST', 'Test new module a', '#cccc', 'Test New Module', 99);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hicrm_departments`
--

CREATE TABLE `hicrm_departments` (
  `id` int(11) NOT NULL,
  `depart_name` varchar(255) NOT NULL,
  `depart_image` varchar(255) DEFAULT NULL,
  `depart_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `hicrm_departments`
--

INSERT INTO `hicrm_departments` (`id`, `depart_name`, `depart_image`, `depart_status`) VALUES
(1, 'Nội khoa', 'noikhoa.png', 1),
(2, 'Sản khoa', 'sankhoa.png', 1),
(15, 'Cận lâm Sàng', 'cls1.png', 1),
(19, 'Ngoại khoa', 'ngoaikhoa.png', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hicrm_district`
--

CREATE TABLE `hicrm_district` (
  `id` int(11) NOT NULL,
  `province_id` int(11) NOT NULL,
  `district_code` varchar(10) NOT NULL,
  `district_name` varchar(100) NOT NULL,
  `district_keyword` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `hicrm_district`
--

INSERT INTO `hicrm_district` (`id`, `province_id`, `district_code`, `district_name`, `district_keyword`, `created_at`) VALUES
(1, 1, '00004', 'Phường Ba Đình', 'ba_dinh', '2026-05-26 04:45:34'),
(2, 1, '00008', 'Phường Ngọc Hà', 'ngoc_ha', '2026-05-26 04:45:34'),
(3, 1, '00025', 'Phường Giảng Võ', 'giang_vo', '2026-05-26 04:45:34'),
(4, 1, '00070', 'Phường Hoàn Kiếm', 'hoan_kiem', '2026-05-26 04:45:34'),
(5, 1, '00082', 'Phường Cửa Nam', 'cua_nam', '2026-05-26 04:45:34'),
(6, 1, '00091', 'Phường Phú Thượng', 'phu_thuong', '2026-05-26 04:45:34'),
(7, 1, '00097', 'Phường Hồng Hà', 'hong_ha', '2026-05-26 04:45:34'),
(8, 1, '00103', 'Phường Tây Hồ', 'tay_ho', '2026-05-26 04:45:34'),
(9, 1, '00118', 'Phường Bồ Đề', 'bo_de', '2026-05-26 04:45:34'),
(10, 1, '00127', 'Phường Việt Hưng', 'viet_hung', '2026-05-26 04:45:34'),
(11, 1, '00136', 'Phường Phúc Lợi', 'phuc_loi', '2026-05-26 04:45:34'),
(12, 1, '00145', 'Phường Long Biên', 'long_bien', '2026-05-26 04:45:34'),
(13, 1, '00160', 'Phường Nghĩa Đô', 'nghia_do', '2026-05-26 04:45:34'),
(14, 1, '00166', 'Phường Cầu Giấy', 'cau_giay', '2026-05-26 04:45:34'),
(15, 1, '00175', 'Phường Yên Hòa', 'yen_hoa', '2026-05-26 04:45:34'),
(16, 1, '00190', 'Phường Ô Chợ Dừa', 'o_cho_dua', '2026-05-26 04:45:34'),
(17, 1, '00199', 'Phường Láng', 'lang', '2026-05-26 04:45:34'),
(18, 1, '00226', 'Phường Văn Miếu - Quốc Tử Giám', 'van_mieu_quoc_tu_giam', '2026-05-26 04:45:34'),
(19, 1, '00229', 'Phường Kim Liên', 'kim_lien', '2026-05-26 04:45:34'),
(20, 1, '00235', 'Phường Đống Đa', 'dong_da', '2026-05-26 04:45:34'),
(21, 1, '00256', 'Phường Hai Bà Trưng', 'hai_ba_trung', '2026-05-26 04:45:34'),
(22, 1, '00283', 'Phường Vĩnh Tuy', 'vinh_tuy', '2026-05-26 04:45:34'),
(23, 1, '00292', 'Phường Bạch Mai', 'bach_mai', '2026-05-26 04:45:34'),
(24, 1, '00301', 'Phường Vĩnh Hưng', 'vinh_hung', '2026-05-26 04:45:34'),
(25, 1, '00316', 'Phường Định Công', 'dinh_cong', '2026-05-26 04:45:34'),
(26, 1, '00322', 'Phường Tương Mai', 'tuong_mai', '2026-05-26 04:45:34'),
(27, 1, '00328', 'Phường Lĩnh Nam', 'linh_nam', '2026-05-26 04:45:34'),
(28, 1, '00331', 'Phường Hoàng Mai', 'hoang_mai', '2026-05-26 04:45:34'),
(29, 1, '00337', 'Phường Hoàng Liệt', 'hoang_liet', '2026-05-26 04:45:34'),
(30, 1, '00340', 'Phường Yên Sở', 'yen_so', '2026-05-26 04:45:34'),
(31, 1, '00352', 'Phường Phương Liệt', 'phuong_liet', '2026-05-26 04:45:34'),
(32, 1, '00364', 'Phường Khương Đình', 'khuong_dinh', '2026-05-26 04:45:34'),
(33, 1, '00367', 'Phường Thanh Xuân', 'thanh_xuan', '2026-05-26 04:45:34'),
(34, 1, '00376', 'Xã Sóc Sơn', 'soc_son', '2026-05-26 04:45:34'),
(35, 1, '00382', 'Xã Kim Anh', 'kim_anh', '2026-05-26 04:45:34'),
(36, 1, '00385', 'Xã Trung Giã', 'trung_gia', '2026-05-26 04:45:34'),
(37, 1, '00430', 'Xã Đa Phúc', 'da_phuc', '2026-05-26 04:45:34'),
(38, 1, '00433', 'Xã Nội Bài', 'noi_bai', '2026-05-26 04:45:34'),
(39, 1, '00454', 'Xã Đông Anh', 'dong_anh', '2026-05-26 04:45:34'),
(40, 1, '00466', 'Xã Phúc Thịnh', 'phuc_thinh', '2026-05-26 04:45:34'),
(41, 1, '00475', 'Xã Thư Lâm', 'thu_lam', '2026-05-26 04:45:34'),
(42, 1, '00493', 'Xã Thiên Lộc', 'thien_loc', '2026-05-26 04:45:34'),
(43, 1, '00508', 'Xã Vĩnh Thanh', 'vinh_thanh', '2026-05-26 04:45:34'),
(44, 1, '00541', 'Xã Phù Đổng', 'phu_dong', '2026-05-26 04:45:34'),
(45, 1, '00562', 'Xã Thuận An', 'thuan_an', '2026-05-26 04:45:34'),
(46, 1, '00565', 'Xã Gia Lâm', 'gia_lam', '2026-05-26 04:45:34'),
(47, 1, '00577', 'Xã Bát Tràng', 'bat_trang', '2026-05-26 04:45:34'),
(48, 1, '00592', 'Phường Từ Liêm', 'tu_liem', '2026-05-26 04:45:34'),
(49, 1, '00598', 'Phường Thượng Cát', 'thuong_cat', '2026-05-26 04:45:34'),
(50, 1, '00602', 'Phường Đông Ngạc', 'dong_ngac', '2026-05-26 04:45:34'),
(51, 1, '00611', 'Phường Xuân Đỉnh', 'xuan_dinh', '2026-05-26 04:45:34'),
(52, 1, '00613', 'Phường Tây Tựu', 'tay_tuu', '2026-05-26 04:45:34'),
(53, 1, '00619', 'Phường Phú Diễn', 'phu_dien', '2026-05-26 04:45:34'),
(54, 1, '00622', 'Phường Xuân Phương', 'xuan_phuong', '2026-05-26 04:45:34'),
(55, 1, '00634', 'Phường Tây Mỗ', 'tay_mo', '2026-05-26 04:45:34'),
(56, 1, '00637', 'Phường Đại Mỗ', 'dai_mo', '2026-05-26 04:45:34'),
(57, 1, '00640', 'Xã Thanh Trì', 'thanh_tri', '2026-05-26 04:45:34'),
(58, 1, '00643', 'Phường Thanh Liệt', 'thanh_liet', '2026-05-26 04:45:34'),
(59, 1, '00664', 'Xã Đại Thanh', 'dai_thanh', '2026-05-26 04:45:34'),
(60, 1, '00679', 'Xã Ngọc Hồi', 'ngoc_hoi', '2026-05-26 04:45:34'),
(61, 1, '00685', 'Xã Nam Phù', 'nam_phu', '2026-05-26 04:45:34'),
(62, 1, '04930', 'Xã Yên Xuân', 'yen_xuan', '2026-05-26 04:45:34'),
(63, 1, '08974', 'Xã Quang Minh', 'quang_minh', '2026-05-26 04:45:34'),
(64, 1, '08980', 'Xã Yên Lãng', 'yen_lang', '2026-05-26 04:45:34'),
(65, 1, '08995', 'Xã Tiến Thắng', 'tien_thang', '2026-05-26 04:45:34'),
(66, 1, '09022', 'Xã Mê Linh', 'me_linh', '2026-05-26 04:45:34'),
(67, 1, '09552', 'Phường Kiến Hưng', 'kien_hung', '2026-05-26 04:45:34'),
(68, 1, '09556', 'Phường Hà Đông', 'ha_dong', '2026-05-26 04:45:34'),
(69, 1, '09562', 'Phường Yên Nghĩa', 'yen_nghia', '2026-05-26 04:45:34'),
(70, 1, '09568', 'Phường Phú Lương', 'phu_luong', '2026-05-26 04:45:34'),
(71, 1, '09574', 'Phường Sơn Tây', 'son_tay', '2026-05-26 04:45:34'),
(72, 1, '09604', 'Phường Tùng Thiện', 'tung_thien', '2026-05-26 04:45:34'),
(73, 1, '09616', 'Xã Đoài Phương', 'doai_phuong', '2026-05-26 04:45:34'),
(74, 1, '09619', 'Xã Quảng Oai', 'quang_oai', '2026-05-26 04:45:34'),
(75, 1, '09634', 'Xã Cổ Đô', 'co_do', '2026-05-26 04:45:34'),
(76, 1, '09661', 'Xã Minh Châu', 'minh_chau', '2026-05-26 04:45:34'),
(77, 1, '09664', 'Xã Vật Lại', 'vat_lai', '2026-05-26 04:45:34'),
(78, 1, '09676', 'Xã Bất Bạt', 'bat_bat', '2026-05-26 04:45:34'),
(79, 1, '09694', 'Xã Suối Hai', 'suoi_hai', '2026-05-26 04:45:34'),
(80, 1, '09700', 'Xã Ba Vì', 'ba_vi', '2026-05-26 04:45:34'),
(81, 1, '09706', 'Xã Yên Bài', 'yen_bai', '2026-05-26 04:45:34'),
(82, 1, '09715', 'Xã Phúc Thọ', 'phuc_tho', '2026-05-26 04:45:34'),
(83, 1, '09739', 'Xã Phúc Lộc', 'phuc_loc', '2026-05-26 04:45:34'),
(84, 1, '09772', 'Xã Hát Môn', 'hat_mon', '2026-05-26 04:45:34'),
(85, 1, '09784', 'Xã Đan Phượng', 'dan_phuong', '2026-05-26 04:45:34'),
(86, 1, '09787', 'Xã Liên Minh', 'lien_minh', '2026-05-26 04:45:34'),
(87, 1, '09817', 'Xã Ô Diên', 'o_dien', '2026-05-26 04:45:34'),
(88, 1, '09832', 'Xã Hoài Đức', 'hoai_duc', '2026-05-26 04:45:34'),
(89, 1, '09856', 'Xã Dương Hòa', 'duong_hoa', '2026-05-26 04:45:34'),
(90, 1, '09871', 'Xã Sơn Đồng', 'son_dong', '2026-05-26 04:45:34'),
(91, 1, '09877', 'Xã An Khánh', 'an_khanh', '2026-05-26 04:45:34'),
(92, 1, '09886', 'Phường Dương Nội', 'duong_noi', '2026-05-26 04:45:34'),
(93, 1, '09895', 'Xã Quốc Oai', 'quoc_oai', '2026-05-26 04:45:34'),
(94, 1, '09910', 'Xã Kiều Phú', 'kieu_phu', '2026-05-26 04:45:34'),
(95, 1, '09931', 'Xã Hưng Đạo', 'hung_dao', '2026-05-26 04:45:34'),
(96, 1, '09952', 'Xã Phú Cát', 'phu_cat', '2026-05-26 04:45:34'),
(97, 1, '09955', 'Xã Thạch Thất', 'thach_that', '2026-05-26 04:45:34'),
(98, 1, '09982', 'Xã Hạ Bằng', 'ha_bang', '2026-05-26 04:45:34'),
(99, 1, '09988', 'Xã Hòa Lạc', 'hoa_lac', '2026-05-26 04:45:34'),
(100, 1, '10003', 'Xã Tây Phương', 'tay_phuong', '2026-05-26 04:45:34'),
(101, 1, '10015', 'Phường Chương Mỹ', 'chuong_my', '2026-05-26 04:45:34'),
(102, 1, '10030', 'Xã Phú Nghĩa', 'phu_nghia', '2026-05-26 04:45:34'),
(103, 1, '10045', 'Xã Xuân Mai', 'xuan_mai', '2026-05-26 04:45:34'),
(104, 1, '10072', 'Xã Quảng Bị', 'quang_bi', '2026-05-26 04:45:34'),
(105, 1, '10081', 'Xã Trần Phú', 'tran_phu', '2026-05-26 04:45:34'),
(106, 1, '10096', 'Xã Hòa Phú', 'hoa_phu', '2026-05-26 04:45:34'),
(107, 1, '10114', 'Xã Thanh Oai', 'thanh_oai', '2026-05-26 04:45:34'),
(108, 1, '10126', 'Xã Bình Minh', 'binh_minh', '2026-05-26 04:45:34'),
(109, 1, '10144', 'Xã Tam Hưng', 'tam_hung', '2026-05-26 04:45:34'),
(110, 1, '10180', 'Xã Dân Hòa', 'dan_hoa', '2026-05-26 04:45:34'),
(111, 1, '10183', 'Xã Thường Tín', 'thuong_tin', '2026-05-26 04:45:34'),
(112, 1, '10210', 'Xã Hồng Vân', 'hong_van', '2026-05-26 04:45:34'),
(113, 1, '10231', 'Xã Thượng Phúc', 'thuong_phuc', '2026-05-26 04:45:34'),
(114, 1, '10237', 'Xã Chương Dương', 'chuong_duong', '2026-05-26 04:45:34'),
(115, 1, '10273', 'Xã Phú Xuyên', 'phu_xuyen', '2026-05-26 04:45:34'),
(116, 1, '10279', 'Xã Phượng Dực', 'duc', '2026-05-26 04:45:34'),
(117, 1, '10330', 'Xã Chuyên Mỹ', 'chuyen_my', '2026-05-26 04:45:34'),
(118, 1, '10342', 'Xã Đại Xuyên', 'dai_xuyen', '2026-05-26 04:45:34'),
(119, 1, '10354', 'Xã Vân Đình', 'van_dinh', '2026-05-26 04:45:34'),
(120, 1, '10369', 'Xã Ứng Thiên', 'ung_thien', '2026-05-26 04:45:34'),
(121, 1, '10402', 'Xã Ứng Hòa', 'ung_hoa', '2026-05-26 04:45:34'),
(122, 1, '10417', 'Xã Hòa Xá', 'hoa_xa', '2026-05-26 04:45:34'),
(123, 1, '10441', 'Xã Mỹ Đức', 'my_duc', '2026-05-26 04:45:34'),
(124, 1, '10459', 'Xã Phúc Sơn', 'phuc_son', '2026-05-26 04:45:34'),
(125, 1, '10465', 'Xã Hồng Sơn', 'hong_son', '2026-05-26 04:45:34'),
(126, 1, '10489', 'Xã Hương Sơn', 'huong_son', '2026-05-26 04:45:34'),
(127, 2, '01273', 'Phường Thục Phán', 'thuc_phan', '2026-05-26 04:45:34'),
(128, 2, '01279', 'Phường Nùng Trí Cao', 'nung_tri_cao', '2026-05-26 04:45:34'),
(129, 2, '01288', 'Phường Tân Giang', 'tan_giang', '2026-05-26 04:45:34'),
(130, 2, '01290', 'Xã Bảo Lâm', 'bao_lam', '2026-05-26 04:45:34'),
(131, 2, '01294', 'Xã Lý Bôn', 'ly_bon', '2026-05-26 04:45:34'),
(132, 2, '01297', 'Xã Nam Quang', 'nam_quang', '2026-05-26 04:45:34'),
(133, 2, '01304', 'Xã Quảng Lâm', 'quang_lam', '2026-05-26 04:45:34'),
(134, 2, '01318', 'Xã Yên Thổ', 'yen_tho', '2026-05-26 04:45:34'),
(135, 2, '01321', 'Xã Bảo Lạc', 'bao_lac', '2026-05-26 04:45:34'),
(136, 2, '01324', 'Xã Cốc Pàng', 'coc_pang', '2026-05-26 04:45:34'),
(137, 2, '01327', 'Xã Cô Ba', 'co_ba', '2026-05-26 04:45:34'),
(138, 2, '01336', 'Xã Khánh Xuân', 'khanh_xuan', '2026-05-26 04:45:34'),
(139, 2, '01339', 'Xã Xuân Trường', 'xuan_truong', '2026-05-26 04:45:34'),
(140, 2, '01351', 'Xã Hưng Đạo', 'hung_dao', '2026-05-26 04:45:34'),
(141, 2, '01354', 'Xã Huy Giáp', 'huy_giap', '2026-05-26 04:45:34'),
(142, 2, '01360', 'Xã Sơn Lộ', 'son_lo', '2026-05-26 04:45:34'),
(143, 2, '01363', 'Xã Thông Nông', 'thong_nong', '2026-05-26 04:45:34'),
(144, 2, '01366', 'Xã Cần Yên', 'can_yen', '2026-05-26 04:45:34'),
(145, 2, '01387', 'Xã Thanh Long', 'thanh_long', '2026-05-26 04:45:34'),
(146, 2, '01392', 'Xã Trường Hà', 'truong_ha', '2026-05-26 04:45:34'),
(147, 2, '01393', 'Xã Lũng Nặm', 'lung_nam', '2026-05-26 04:45:34'),
(148, 2, '01414', 'Xã Tổng Cọt', 'tong_cot', '2026-05-26 04:45:34'),
(149, 2, '01438', 'Xã Hà Quảng', 'ha_quang', '2026-05-26 04:45:34'),
(150, 2, '01447', 'Xã Trà Lĩnh', 'tra_linh', '2026-05-26 04:45:34'),
(151, 2, '01456', 'Xã Quang Hán', 'quang_han', '2026-05-26 04:45:34'),
(152, 2, '01465', 'Xã Quang Trung', 'quang_trung', '2026-05-26 04:45:34'),
(153, 2, '01477', 'Xã Trùng Khánh', 'trung_khanh', '2026-05-26 04:45:34'),
(154, 2, '01489', 'Xã Đình Phong', 'dinh_phong', '2026-05-26 04:45:34'),
(155, 2, '01501', 'Xã Đàm Thủy', 'dam_thuy', '2026-05-26 04:45:34'),
(156, 2, '01525', 'Xã Đoài Dương', 'doai_duong', '2026-05-26 04:45:34'),
(157, 2, '01537', 'Xã Lý Quốc', 'ly_quoc', '2026-05-26 04:45:34'),
(158, 2, '01552', 'Xã Quang Long', 'quang_long', '2026-05-26 04:45:34'),
(159, 2, '01558', 'Xã Hạ Lang', 'ha_lang', '2026-05-26 04:45:34'),
(160, 2, '01561', 'Xã Vinh Quý', 'vinh_quy', '2026-05-26 04:45:34'),
(161, 2, '01576', 'Xã Quảng Uyên', 'quang_uyen', '2026-05-26 04:45:34'),
(162, 2, '01594', 'Xã Độc Lập', 'doc_lap', '2026-05-26 04:45:34'),
(163, 2, '01618', 'Xã Hạnh Phúc', 'hanh_phuc', '2026-05-26 04:45:34'),
(164, 2, '01636', 'Xã Bế Văn Đàn', 'be_van_dan', '2026-05-26 04:45:34'),
(165, 2, '01648', 'Xã Phục Hòa', 'phuc_hoa', '2026-05-26 04:45:34'),
(166, 2, '01654', 'Xã Hòa An', 'hoa_an', '2026-05-26 04:45:34'),
(167, 2, '01660', 'Xã Nam Tuấn', 'nam_tuan', '2026-05-26 04:45:34'),
(168, 2, '01699', 'Xã Nguyễn Huệ', 'nguyen_hue', '2026-05-26 04:45:34'),
(169, 2, '01708', 'Xã Bạch Đằng', 'bach_dang', '2026-05-26 04:45:34'),
(170, 2, '01726', 'Xã Nguyên Bình', 'nguyen_binh', '2026-05-26 04:45:34'),
(171, 2, '01729', 'Xã Tĩnh Túc', 'tinh_tuc', '2026-05-26 04:45:34'),
(172, 2, '01738', 'Xã Ca Thành', 'ca_thanh', '2026-05-26 04:45:34'),
(173, 2, '01747', 'Xã Minh Tâm', 'minh_tam', '2026-05-26 04:45:34'),
(174, 2, '01768', 'Xã Phan Thanh', 'phan_thanh', '2026-05-26 04:45:34'),
(175, 2, '01774', 'Xã Tam Kim', 'tam_kim', '2026-05-26 04:45:34'),
(176, 2, '01777', 'Xã Thành Công', 'thanh_cong', '2026-05-26 04:45:34'),
(177, 2, '01786', 'Xã Đông Khê', 'dong_khe', '2026-05-26 04:45:34'),
(178, 2, '01789', 'Xã Canh Tân', 'canh_tan', '2026-05-26 04:45:34'),
(179, 2, '01792', 'Xã Kim Đồng', 'kim_dong', '2026-05-26 04:45:34'),
(180, 2, '01795', 'Xã Minh Khai', 'minh_khai', '2026-05-26 04:45:34'),
(181, 2, '01807', 'Xã Thạch An', 'thach_an', '2026-05-26 04:45:34'),
(182, 2, '01822', 'Xã Đức Long', 'duc_long', '2026-05-26 04:45:34'),
(183, 3, '00691', 'Phường Hà Giang 2', 'ha_giang_2', '2026-05-26 04:45:34'),
(184, 3, '00694', 'Phường Hà Giang 1', 'ha_giang_1', '2026-05-26 04:45:34'),
(185, 3, '00700', 'Xã Ngọc Đường', 'ngoc_duong', '2026-05-26 04:45:34'),
(186, 3, '00706', 'Xã Phú Linh', 'phu_linh', '2026-05-26 04:45:34'),
(187, 3, '00715', 'Xã Lũng Cú', 'lung_cu', '2026-05-26 04:45:34'),
(188, 3, '00721', 'Xã Đồng Văn', 'dong_van', '2026-05-26 04:45:34'),
(189, 3, '00733', 'Xã Sà Phìn', 'sa_phin', '2026-05-26 04:45:34'),
(190, 3, '00745', 'Xã Phố Bảng', 'pho_bang', '2026-05-26 04:45:34'),
(191, 3, '00763', 'Xã Lũng Phìn', 'lung_phin', '2026-05-26 04:45:34'),
(192, 3, '00769', 'Xã Mèo Vạc', 'meo_vac', '2026-05-26 04:45:34'),
(193, 3, '00778', 'Xã Sơn Vĩ', 'son_vi', '2026-05-26 04:45:34'),
(194, 3, '00787', 'Xã Sủng Máng', 'sung_mang', '2026-05-26 04:45:34'),
(195, 3, '00802', 'Xã Khâu Vai', 'khau_vai', '2026-05-26 04:45:34'),
(196, 3, '00808', 'Xã Tát Ngà', 'tat_nga', '2026-05-26 04:45:34'),
(197, 3, '00817', 'Xã Niêm Sơn', 'niem_son', '2026-05-26 04:45:34'),
(198, 3, '00820', 'Xã Yên Minh', 'yen_minh', '2026-05-26 04:45:34'),
(199, 3, '00829', 'Xã Thắng Mố', 'thang_mo', '2026-05-26 04:45:34'),
(200, 3, '00832', 'Xã Bạch Đích', 'bach_dich', '2026-05-26 04:45:34'),
(201, 3, '00847', 'Xã Mậu Duệ', 'mau_due', '2026-05-26 04:45:34'),
(202, 3, '00859', 'Xã Ngọc Long', 'ngoc_long', '2026-05-26 04:45:34'),
(203, 3, '00865', 'Xã Đường Thượng', 'duong_thuong', '2026-05-26 04:45:34'),
(204, 3, '00871', 'Xã Du Già', 'du_gia', '2026-05-26 04:45:34'),
(205, 3, '00874', 'Xã Quản Bạ', 'quan_ba', '2026-05-26 04:45:34'),
(206, 3, '00883', 'Xã Cán Tỷ', 'can_ty', '2026-05-26 04:45:34'),
(207, 3, '00889', 'Xã Nghĩa Thuận', 'nghia_thuan', '2026-05-26 04:45:34'),
(208, 3, '00892', 'Xã Tùng Vài', 'tung_vai', '2026-05-26 04:45:34'),
(209, 3, '00901', 'Xã Lùng Tám', 'lung_tam', '2026-05-26 04:45:34'),
(210, 3, '00913', 'Xã Vị Xuyên', 'vi_xuyen', '2026-05-26 04:45:34'),
(211, 3, '00919', 'Xã Minh Tân', 'minh_tan', '2026-05-26 04:45:34'),
(212, 3, '00922', 'Xã Thuận Hoà', 'thuan_hoa', '2026-05-26 04:45:34'),
(213, 3, '00925', 'Xã Tùng Bá', 'tung_ba', '2026-05-26 04:45:34'),
(214, 3, '00928', 'Xã Thanh Thủy', 'thanh_thuy', '2026-05-26 04:45:34'),
(215, 3, '00937', 'Xã Lao Chải', 'lao_chai', '2026-05-26 04:45:34'),
(216, 3, '00952', 'Xã Cao Bồ', 'cao_bo', '2026-05-26 04:45:34'),
(217, 3, '00958', 'Xã Thượng Sơn', 'thuong_son', '2026-05-26 04:45:34'),
(218, 3, '00967', 'Xã Việt Lâm', 'viet_lam', '2026-05-26 04:45:34'),
(219, 3, '00970', 'Xã Linh Hồ', 'linh_ho', '2026-05-26 04:45:34'),
(220, 3, '00976', 'Xã Bạch Ngọc', 'bach_ngoc', '2026-05-26 04:45:34'),
(221, 3, '00982', 'Xã Minh Sơn', 'minh_son', '2026-05-26 04:45:34'),
(222, 3, '00985', 'Xã Giáp Trung', 'giap_trung', '2026-05-26 04:45:34'),
(223, 3, '00991', 'Xã Bắc Mê', 'bac_me', '2026-05-26 04:45:34'),
(224, 3, '00994', 'Xã Minh Ngọc', 'minh_ngoc', '2026-05-26 04:45:34'),
(225, 3, '01006', 'Xã Yên Cường', 'yen_cuong', '2026-05-26 04:45:34'),
(226, 3, '01012', 'Xã Đường Hồng', 'duong_hong', '2026-05-26 04:45:34'),
(227, 3, '01021', 'Xã Hoàng Su Phì', 'hoang_su_phi', '2026-05-26 04:45:34'),
(228, 3, '01024', 'Xã Bản Máy', 'ban_may', '2026-05-26 04:45:34'),
(229, 3, '01033', 'Xã Thàng Tín', 'thang_tin', '2026-05-26 04:45:34'),
(230, 3, '01051', 'Xã Tân Tiến', 'tan_tien', '2026-05-26 04:45:34'),
(231, 3, '01057', 'Xã Pờ Ly Ngài', 'po_ly_ngai', '2026-05-26 04:45:34'),
(232, 3, '01075', 'Xã Nậm Dịch', 'nam_dich', '2026-05-26 04:45:34'),
(233, 3, '01084', 'Xã Hồ Thầu', 'ho_thau', '2026-05-26 04:45:34'),
(234, 3, '01090', 'Xã Thông Nguyên', 'thong_nguyen', '2026-05-26 04:45:34'),
(235, 3, '01096', 'Xã Pà Vầy Sủ', 'pa_vay_su', '2026-05-26 04:45:34'),
(236, 3, '01108', 'Xã Xín Mần', 'xin_man', '2026-05-26 04:45:34'),
(237, 3, '01117', 'Xã Trung Thịnh', 'trung_thinh', '2026-05-26 04:45:34'),
(238, 3, '01141', 'Xã Nấm Dẩn', 'nam_dan', '2026-05-26 04:45:34'),
(239, 3, '01144', 'Xã Quảng Nguyên', 'quang_nguyen', '2026-05-26 04:45:34'),
(240, 3, '01147', 'Xã Khuôn Lùng', 'khuon_lung', '2026-05-26 04:45:34'),
(241, 3, '01153', 'Xã Bắc Quang', 'bac_quang', '2026-05-26 04:45:34'),
(242, 3, '01156', 'Xã Vĩnh Tuy', 'vinh_tuy', '2026-05-26 04:45:34'),
(243, 3, '01165', 'Xã Đồng Tâm', 'dong_tam', '2026-05-26 04:45:34'),
(244, 3, '01171', 'Xã Tân Quang', 'tan_quang', '2026-05-26 04:45:34'),
(245, 3, '01180', 'Xã Bằng Hành', 'bang_hanh', '2026-05-26 04:45:34'),
(246, 3, '01192', 'Xã Liên Hiệp', 'lien_hiep', '2026-05-26 04:45:34'),
(247, 3, '01201', 'Xã Hùng An', 'hung_an', '2026-05-26 04:45:34'),
(248, 3, '01216', 'Xã Đồng Yên', 'dong_yen', '2026-05-26 04:45:34'),
(249, 3, '01225', 'Xã Tiên Nguyên', 'tien_nguyen', '2026-05-26 04:45:34'),
(250, 3, '01234', 'Xã Yên Thành', 'yen_thanh', '2026-05-26 04:45:34'),
(251, 3, '01237', 'Xã Quang Bình', 'quang_binh', '2026-05-26 04:45:34'),
(252, 3, '01243', 'Xã Tân Trịnh', 'tan_trinh', '2026-05-26 04:45:34'),
(253, 3, '01246', 'Xã Bằng Lang', 'bang_lang', '2026-05-26 04:45:34'),
(254, 3, '01255', 'Xã Xuân Giang', 'xuan_giang', '2026-05-26 04:45:34'),
(255, 3, '01261', 'Xã Tiên Yên', 'tien_yen', '2026-05-26 04:45:34'),
(256, 3, '02212', 'Phường Nông Tiến', 'nong_tien', '2026-05-26 04:45:34'),
(257, 3, '02215', 'Phường Minh Xuân', 'minh_xuan', '2026-05-26 04:45:34'),
(258, 3, '02221', 'Xã Nà Hang', 'na_hang', '2026-05-26 04:45:34'),
(259, 3, '02239', 'Xã Thượng Nông', 'thuong_nong', '2026-05-26 04:45:34'),
(260, 3, '02245', 'Xã Côn Lôn', 'con_lon', '2026-05-26 04:45:34'),
(261, 3, '02248', 'Xã Yên Hoa', 'yen_hoa', '2026-05-26 04:45:34'),
(262, 3, '02260', 'Xã Hồng Thái', 'hong_thai', '2026-05-26 04:45:34'),
(263, 3, '02266', 'Xã Lâm Bình', 'lam_binh', '2026-05-26 04:45:34'),
(264, 3, '02269', 'Xã Thượng Lâm', 'thuong_lam', '2026-05-26 04:45:34'),
(265, 3, '02287', 'Xã Chiêm Hoá', 'chiem_hoa', '2026-05-26 04:45:34'),
(266, 3, '02296', 'Xã Bình An', 'binh_an', '2026-05-26 04:45:34'),
(267, 3, '02302', 'Xã Minh Quang', 'minh_quang', '2026-05-26 04:45:34'),
(268, 3, '02305', 'Xã Trung Hà', 'trung_ha', '2026-05-26 04:45:34'),
(269, 3, '02308', 'Xã Tân Mỹ', 'tan_my', '2026-05-26 04:45:34'),
(270, 3, '02317', 'Xã Yên Lập', 'yen_lap', '2026-05-26 04:45:34'),
(271, 3, '02320', 'Xã Tân An', 'tan_an', '2026-05-26 04:45:34'),
(272, 3, '02332', 'Xã Kiên Đài', 'kien_dai', '2026-05-26 04:45:34'),
(273, 3, '02350', 'Xã Kim Bình', 'kim_binh', '2026-05-26 04:45:34'),
(274, 3, '02353', 'Xã Hoà An', 'hoa_an', '2026-05-26 04:45:34'),
(275, 3, '02359', 'Xã Tri Phú', 'tri_phu', '2026-05-26 04:45:34'),
(276, 3, '02365', 'Xã Yên Nguyên', 'yen_nguyen', '2026-05-26 04:45:34'),
(277, 3, '02374', 'Xã Hàm Yên', 'ham_yen', '2026-05-26 04:45:34'),
(278, 3, '02380', 'Xã Bạch Xa', 'bach_xa', '2026-05-26 04:45:34'),
(279, 3, '02392', 'Xã Phù Lưu', 'phu_luu', '2026-05-26 04:45:34'),
(280, 3, '02398', 'Xã Yên Phú', 'yen_phu', '2026-05-26 04:45:34'),
(281, 3, '02404', 'Xã Bình Xa', 'binh_xa', '2026-05-26 04:45:34'),
(282, 3, '02407', 'Xã Thái Sơn', 'thai_son', '2026-05-26 04:45:34'),
(283, 3, '02419', 'Xã Thái Hoà', 'thai_hoa', '2026-05-26 04:45:34'),
(284, 3, '02425', 'Xã Hùng Đức', 'hung_duc', '2026-05-26 04:45:34'),
(285, 3, '02434', 'Xã Lực Hành', 'luc_hanh', '2026-05-26 04:45:34'),
(286, 3, '02437', 'Xã Kiến Thiết', 'kien_thiet', '2026-05-26 04:45:34'),
(287, 3, '02449', 'Xã Xuân Vân', 'xuan_van', '2026-05-26 04:45:34'),
(288, 3, '02455', 'Xã Hùng Lợi', 'hung_loi', '2026-05-26 04:45:34'),
(289, 3, '02458', 'Xã Trung Sơn', 'trung_son', '2026-05-26 04:45:34'),
(290, 3, '02470', 'Xã Tân Long', 'tan_long', '2026-05-26 04:45:34'),
(291, 3, '02473', 'Xã Yên Sơn', 'yen_son', '2026-05-26 04:45:34'),
(292, 3, '02494', 'Xã Thái Bình', 'thai_binh', '2026-05-26 04:45:34'),
(293, 3, '02509', 'Phường Mỹ Lâm', 'my_lam', '2026-05-26 04:45:34'),
(294, 3, '02512', 'Phường An Tường', 'an_tuong', '2026-05-26 04:45:34'),
(295, 3, '02524', 'Phường Bình Thuận', 'binh_thuan', '2026-05-26 04:45:34'),
(296, 3, '02530', 'Xã Nhữ Khê', 'nhu_khe', '2026-05-26 04:45:34'),
(297, 3, '02536', 'Xã Sơn Dương', 'son_duong', '2026-05-26 04:45:34'),
(298, 3, '02545', 'Xã Tân Trào', 'tan_trao', '2026-05-26 04:45:34'),
(299, 3, '02548', 'Xã Bình Ca', 'binh_ca', '2026-05-26 04:45:34'),
(300, 3, '02554', 'Xã Minh Thanh', 'minh_thanh', '2026-05-26 04:45:34'),
(301, 3, '02572', 'Xã Đông Thọ', 'dong_tho', '2026-05-26 04:45:34'),
(302, 3, '02578', 'Xã Tân Thanh', 'tan_thanh', '2026-05-26 04:45:34'),
(303, 3, '02608', 'Xã Hồng Sơn', 'hong_son', '2026-05-26 04:45:34'),
(304, 3, '02611', 'Xã Phú Lương', 'phu_luong', '2026-05-26 04:45:34'),
(305, 3, '02620', 'Xã Sơn Thuỷ', 'son_thuy', '2026-05-26 04:45:34'),
(306, 3, '02623', 'Xã Trường Sinh', 'truong_sinh', '2026-05-26 04:45:34'),
(307, 4, '03127', 'Phường Điện Biên Phủ', 'dien_bien_phu', '2026-05-26 04:45:34'),
(308, 4, '03151', 'Phường Mường Lay', 'muong_lay', '2026-05-26 04:45:34'),
(309, 4, '03158', 'Xã Sín Thầu', 'sin_thau', '2026-05-26 04:45:34'),
(310, 4, '03160', 'Xã Mường Nhé', 'muong_nhe', '2026-05-26 04:45:34'),
(311, 4, '03162', 'Xã Nậm Kè', 'nam_ke', '2026-05-26 04:45:34'),
(312, 4, '03163', 'Xã Mường Toong', 'muong_toong', '2026-05-26 04:45:34'),
(313, 4, '03164', 'Xã Quảng Lâm', 'quang_lam', '2026-05-26 04:45:34'),
(314, 4, '03166', 'Xã Mường Chà', 'muong_cha', '2026-05-26 04:45:34'),
(315, 4, '03169', 'Xã Nà Hỳ', 'na_hy', '2026-05-26 04:45:34'),
(316, 4, '03172', 'Xã Na Sang', 'na_sang', '2026-05-26 04:45:34'),
(317, 4, '03175', 'Xã Chà Tở', 'cha_to', '2026-05-26 04:45:34'),
(318, 4, '03176', 'Xã Nà Bủng', 'na_bung', '2026-05-26 04:45:34'),
(319, 4, '03181', 'Xã Mường Tùng', 'muong_tung', '2026-05-26 04:45:34'),
(320, 4, '03193', 'Xã Pa Ham', 'pa_ham', '2026-05-26 04:45:34'),
(321, 4, '03194', 'Xã Nậm Nèn', 'nam_nen', '2026-05-26 04:45:34'),
(322, 4, '03199', 'Xã Si Pa Phìn', 'si_pa_phin', '2026-05-26 04:45:34'),
(323, 4, '03202', 'Xã Mường Pồn', 'muong_pon', '2026-05-26 04:45:34'),
(324, 4, '03203', 'Xã Na Son', 'na_son', '2026-05-26 04:45:34'),
(325, 4, '03208', 'Xã Xa Dung', 'xa_dung', '2026-05-26 04:45:34'),
(326, 4, '03214', 'Xã Mường Luân', 'muong_luan', '2026-05-26 04:45:34'),
(327, 4, '03217', 'Xã Tủa Chùa', 'tua_chua', '2026-05-26 04:45:34'),
(328, 4, '03220', 'Xã Tủa Thàng', 'tua_thang', '2026-05-26 04:45:34'),
(329, 4, '03226', 'Xã Sín Chải', 'sin_chai', '2026-05-26 04:45:34'),
(330, 4, '03241', 'Xã Sính Phình', 'sinh_phinh', '2026-05-26 04:45:34'),
(331, 4, '03244', 'Xã Sáng Nhè', 'sang_nhe', '2026-05-26 04:45:34'),
(332, 4, '03253', 'Xã Tuần Giáo', 'tuan_giao', '2026-05-26 04:45:34'),
(333, 4, '03256', 'Xã Mường Ảng', 'muong_ang', '2026-05-26 04:45:34'),
(334, 4, '03260', 'Xã Pú Nhung', 'pu_nhung', '2026-05-26 04:45:34'),
(335, 4, '03268', 'Xã Mường Mùn', 'muong_mun', '2026-05-26 04:45:34'),
(336, 4, '03283', 'Xã Chiềng Sinh', 'chieng_sinh', '2026-05-26 04:45:34'),
(337, 4, '03295', 'Xã Quài Tở', 'quai_to', '2026-05-26 04:45:34'),
(338, 4, '03301', 'Xã Búng Lao', 'bung_lao', '2026-05-26 04:45:34'),
(339, 4, '03313', 'Xã Mường Lạn', 'muong_lan', '2026-05-26 04:45:34'),
(340, 4, '03316', 'Xã Nà Tấu', 'na_tau', '2026-05-26 04:45:34'),
(341, 4, '03325', 'Xã Mường Phăng', 'muong_phang', '2026-05-26 04:45:34'),
(342, 4, '03328', 'Xã Thanh Nưa', 'thanh_nua', '2026-05-26 04:45:34'),
(343, 4, '03334', 'Phường Mường Thanh', 'muong_thanh', '2026-05-26 04:45:34'),
(344, 4, '03349', 'Xã Thanh Yên', 'thanh_yen', '2026-05-26 04:45:34'),
(345, 4, '03352', 'Xã Thanh An', 'thanh_an', '2026-05-26 04:45:34'),
(346, 4, '03356', 'Xã Sam Mứn', 'sam_mun', '2026-05-26 04:45:34'),
(347, 4, '03358', 'Xã Núa Ngam', 'nua_ngam', '2026-05-26 04:45:34'),
(348, 4, '03368', 'Xã Mường Nhà', 'muong_nha', '2026-05-26 04:45:34'),
(349, 4, '03370', 'Xã Pu Nhi', 'pu_nhi', '2026-05-26 04:45:34'),
(350, 4, '03382', 'Xã Phình Giàng', 'phinh_giang', '2026-05-26 04:45:34'),
(351, 4, '03385', 'Xã Tìa Dình', 'tia_dinh', '2026-05-26 04:45:34'),
(352, 5, '03388', 'Phường Đoàn Kết', 'doan_ket', '2026-05-26 04:45:34'),
(353, 5, '03390', 'Xã Bình Lư', 'binh_lu', '2026-05-26 04:45:34'),
(354, 5, '03394', 'Xã Sin Suối Hồ', 'sin_suoi_ho', '2026-05-26 04:45:34'),
(355, 5, '03405', 'Xã Tả Lèng', 'ta_leng', '2026-05-26 04:45:34'),
(356, 5, '03408', 'Phường Tân Phong', 'tan_phong', '2026-05-26 04:45:34'),
(357, 5, '03424', 'Xã Bản Bo', 'ban_bo', '2026-05-26 04:45:34'),
(358, 5, '03430', 'Xã Khun Há', 'khun_ha', '2026-05-26 04:45:34'),
(359, 5, '03433', 'Xã Bum Tở', 'bum_to', '2026-05-26 04:45:34'),
(360, 5, '03434', 'Xã Nậm Hàng', 'nam_hang', '2026-05-26 04:45:34'),
(361, 5, '03439', 'Xã Thu Lũm', 'thu_lum', '2026-05-26 04:45:34'),
(362, 5, '03442', 'Xã Pa Ủ', 'pa_u', '2026-05-26 04:45:34'),
(363, 5, '03445', 'Xã Mường Tè', 'muong_te', '2026-05-26 04:45:34'),
(364, 5, '03451', 'Xã Mù Cả', 'mu_ca', '2026-05-26 04:45:34'),
(365, 5, '03460', 'Xã Hua Bum', 'hua_bum', '2026-05-26 04:45:34'),
(366, 5, '03463', 'Xã Tà Tổng', 'ta_tong', '2026-05-26 04:45:34'),
(367, 5, '03466', 'Xã Bum Nưa', 'bum_nua', '2026-05-26 04:45:34'),
(368, 5, '03472', 'Xã Mường Mô', 'muong_mo', '2026-05-26 04:45:34'),
(369, 5, '03478', 'Xã Sìn Hồ', 'sin_ho', '2026-05-26 04:45:34'),
(370, 5, '03487', 'Xã Lê Lợi', 'le_loi', '2026-05-26 04:45:34'),
(371, 5, '03503', 'Xã Pa Tần', 'pa_tan', '2026-05-26 04:45:34'),
(372, 5, '03508', 'Xã Hồng Thu', 'hong_thu', '2026-05-26 04:45:34'),
(373, 5, '03517', 'Xã Nậm Tăm', 'nam_tam', '2026-05-26 04:45:34'),
(374, 5, '03529', 'Xã Tủa Sín Chải', 'tua_sin_chai', '2026-05-26 04:45:34'),
(375, 5, '03532', 'Xã Pu Sam Cáp', 'pu_sam_cap', '2026-05-26 04:45:34'),
(376, 5, '03538', 'Xã Nậm Mạ', 'nam_ma', '2026-05-26 04:45:34'),
(377, 5, '03544', 'Xã Nậm Cuổi', 'nam_cuoi', '2026-05-26 04:45:34'),
(378, 5, '03549', 'Xã Phong Thổ', 'phong_tho', '2026-05-26 04:45:34'),
(379, 5, '03562', 'Xã Sì Lở Lầu', 'si_lo_lau', '2026-05-26 04:45:34'),
(380, 5, '03571', 'Xã Dào San', 'dao_san', '2026-05-26 04:45:34'),
(381, 5, '03583', 'Xã Khổng Lào', 'khong_lao', '2026-05-26 04:45:34'),
(382, 5, '03595', 'Xã Than Uyên', 'than_uyen', '2026-05-26 04:45:34'),
(383, 5, '03598', 'Xã Tân Uyên', 'tan_uyen', '2026-05-26 04:45:34'),
(384, 5, '03601', 'Xã Mường Khoa', 'muong_khoa', '2026-05-26 04:45:34'),
(385, 5, '03613', 'Xã Nậm Sỏ', 'nam_so', '2026-05-26 04:45:34'),
(386, 5, '03616', 'Xã Pắc Ta', 'pac_ta', '2026-05-26 04:45:34'),
(387, 5, '03618', 'Xã Mường Than', 'muong_than', '2026-05-26 04:45:34'),
(388, 5, '03637', 'Xã Mường Kim', 'muong_kim', '2026-05-26 04:45:34'),
(389, 5, '03640', 'Xã Khoen On', 'khoen_on', '2026-05-26 04:45:34'),
(390, 6, '03646', 'Phường Tô Hiệu', 'to_hieu', '2026-05-26 04:45:34'),
(391, 6, '03664', 'Phường Chiềng An', 'chieng_an', '2026-05-26 04:45:34'),
(392, 6, '03670', 'Phường Chiềng Cơi', 'chieng_coi', '2026-05-26 04:45:34'),
(393, 6, '03679', 'Phường Chiềng Sinh', 'chieng_sinh', '2026-05-26 04:45:34'),
(394, 6, '03688', 'Xã Mường Chiên', 'muong_chien', '2026-05-26 04:45:34'),
(395, 6, '03694', 'Xã Mường Giôn', 'muong_gion', '2026-05-26 04:45:34'),
(396, 6, '03703', 'Xã Quỳnh Nhai', 'quynh_nhai', '2026-05-26 04:45:34'),
(397, 6, '03712', 'Xã Mường Sại', 'muong_sai', '2026-05-26 04:45:34'),
(398, 6, '03721', 'Xã Thuận Châu', 'thuan_chau', '2026-05-26 04:45:34'),
(399, 6, '03724', 'Xã Bình Thuận', 'binh_thuan', '2026-05-26 04:45:34'),
(400, 6, '03727', 'Xã Mường É', 'muong_e', '2026-05-26 04:45:34'),
(401, 6, '03754', 'Xã Chiềng La', 'chieng_la', '2026-05-26 04:45:34'),
(402, 6, '03757', 'Xã Mường Khiêng', 'muong_khieng', '2026-05-26 04:45:34'),
(403, 6, '03760', 'Xã Mường Bám', 'muong_bam', '2026-05-26 04:45:34'),
(404, 6, '03763', 'Xã Long Hẹ', 'long_he', '2026-05-26 04:45:34'),
(405, 6, '03781', 'Xã Co Mạ', 'co_ma', '2026-05-26 04:45:34'),
(406, 6, '03784', 'Xã Nậm Lầu', 'nam_lau', '2026-05-26 04:45:34'),
(407, 6, '03799', 'Xã Muổi Nọi', 'muoi_noi', '2026-05-26 04:45:34'),
(408, 6, '03808', 'Xã Mường La', 'muong_la', '2026-05-26 04:45:34'),
(409, 6, '03814', 'Xã Chiềng Lao', 'chieng_lao', '2026-05-26 04:45:34'),
(410, 6, '03820', 'Xã Ngọc Chiến', 'ngoc_chien', '2026-05-26 04:45:34'),
(411, 6, '03847', 'Xã Mường Bú', 'muong_bu', '2026-05-26 04:45:34'),
(412, 6, '03850', 'Xã Chiềng Hoa', 'chieng_hoa', '2026-05-26 04:45:34'),
(413, 6, '03856', 'Xã Bắc Yên', 'bac_yen', '2026-05-26 04:45:34'),
(414, 6, '03862', 'Xã Xím Vàng', 'xim_vang', '2026-05-26 04:45:34'),
(415, 6, '03868', 'Xã Tà Xùa', 'ta_xua', '2026-05-26 04:45:34'),
(416, 6, '03871', 'Xã Pắc Ngà', 'pac_nga', '2026-05-26 04:45:34'),
(417, 6, '03880', 'Xã Tạ Khoa', 'ta_khoa', '2026-05-26 04:45:34'),
(418, 6, '03892', 'Xã Chiềng Sại', 'chieng_sai', '2026-05-26 04:45:34'),
(419, 6, '03901', 'Xã Suối Tọ', 'suoi_to', '2026-05-26 04:45:34'),
(420, 6, '03907', 'Xã Mường Cơi', 'muong_coi', '2026-05-26 04:45:34'),
(421, 6, '03910', 'Xã Phù Yên', 'phu_yen', '2026-05-26 04:45:34'),
(422, 6, '03922', 'Xã Gia Phù', 'gia_phu', '2026-05-26 04:45:34'),
(423, 6, '03943', 'Xã Mường Bang', 'muong_bang', '2026-05-26 04:45:34'),
(424, 6, '03958', 'Xã Tường Hạ', 'tuong_ha', '2026-05-26 04:45:34'),
(425, 6, '03961', 'Xã Kim Bon', 'kim_bon', '2026-05-26 04:45:34'),
(426, 6, '03970', 'Xã Tân Phong', 'tan_phong', '2026-05-26 04:45:34'),
(427, 6, '03979', 'Phường Mộc Sơn', 'moc_son', '2026-05-26 04:45:34'),
(428, 6, '03980', 'Phường Mộc Châu', 'moc_chau', '2026-05-26 04:45:34'),
(429, 6, '03982', 'Phường Thảo Nguyên', 'thao_nguyen', '2026-05-26 04:45:34'),
(430, 6, '03985', 'Xã Chiềng Sơn', 'chieng_son', '2026-05-26 04:45:34'),
(431, 6, '03997', 'Xã Tân Yên', 'tan_yen', '2026-05-26 04:45:34'),
(432, 6, '04000', 'Xã Đoàn Kết', 'doan_ket', '2026-05-26 04:45:34'),
(433, 6, '04006', 'Xã Song Khủa', 'song_khua', '2026-05-26 04:45:34'),
(434, 6, '04018', 'Xã Tô Múa', 'to_mua', '2026-05-26 04:45:34'),
(435, 6, '04033', 'Phường Vân Sơn', 'van_son', '2026-05-26 04:45:34'),
(436, 6, '04045', 'Xã Lóng Sập', 'long_sap', '2026-05-26 04:45:34'),
(437, 6, '04048', 'Xã Vân Hồ', 'van_ho', '2026-05-26 04:45:34'),
(438, 6, '04057', 'Xã Xuân Nha', 'xuan_nha', '2026-05-26 04:45:34'),
(439, 6, '04075', 'Xã Yên Châu', 'yen_chau', '2026-05-26 04:45:34'),
(440, 6, '04078', 'Xã Chiềng Hặc', 'chieng_hac', '2026-05-26 04:45:34'),
(441, 6, '04087', 'Xã Yên Sơn', 'yen_son', '2026-05-26 04:45:34'),
(442, 6, '04096', 'Xã Lóng Phiêng', 'long_phieng', '2026-05-26 04:45:34'),
(443, 6, '04099', 'Xã Phiêng Khoài', 'phieng_khoai', '2026-05-26 04:45:34'),
(444, 6, '04105', 'Xã Mai Sơn', 'mai_son', '2026-05-26 04:45:34'),
(445, 6, '04108', 'Xã Chiềng Sung', 'chieng_sung', '2026-05-26 04:45:34'),
(446, 6, '04117', 'Xã Mường Chanh', 'muong_chanh', '2026-05-26 04:45:34'),
(447, 6, '04123', 'Xã Chiềng Mung', 'chieng_mung', '2026-05-26 04:45:34'),
(448, 6, '04132', 'Xã Chiềng Mai', 'chieng_mai', '2026-05-26 04:45:34'),
(449, 6, '04136', 'Xã Tà Hộc', 'ta_hoc', '2026-05-26 04:45:34'),
(450, 6, '04144', 'Xã Phiêng Cằm', 'phieng_cam', '2026-05-26 04:45:34'),
(451, 6, '04159', 'Xã Phiêng Pằn', 'phieng_pan', '2026-05-26 04:45:34'),
(452, 6, '04168', 'Xã Sông Mã', 'song_ma', '2026-05-26 04:45:34'),
(453, 6, '04171', 'Xã Bó Sinh', 'bo_sinh', '2026-05-26 04:45:34'),
(454, 6, '04183', 'Xã Mường Lầm', 'muong_lam', '2026-05-26 04:45:34'),
(455, 6, '04186', 'Xã Nậm Ty', 'nam_ty', '2026-05-26 04:45:34'),
(456, 6, '04195', 'Xã Chiềng Sơ', 'chieng_so', '2026-05-26 04:45:34'),
(457, 6, '04204', 'Xã Chiềng Khoong', 'chieng_khoong', '2026-05-26 04:45:34'),
(458, 6, '04210', 'Xã Huổi Một', 'huoi_mot', '2026-05-26 04:45:34'),
(459, 6, '04219', 'Xã Mường Hung', 'muong_hung', '2026-05-26 04:45:34'),
(460, 6, '04222', 'Xã Chiềng Khương', 'chieng_khuong', '2026-05-26 04:45:34'),
(461, 6, '04228', 'Xã Púng Bánh', 'pung_banh', '2026-05-26 04:45:34'),
(462, 6, '04231', 'Xã Sốp Cộp', 'sop_cop', '2026-05-26 04:45:34'),
(463, 6, '04240', 'Xã Mường Lèo', 'muong_leo', '2026-05-26 04:45:34'),
(464, 6, '04246', 'Xã Mường Lạn', 'muong_lan', '2026-05-26 04:45:34'),
(465, 7, '02647', 'Phường Lào Cai', 'lao_cai', '2026-05-26 04:45:34'),
(466, 7, '02671', 'Phường Cam Đường', 'cam_duong', '2026-05-26 04:45:34'),
(467, 7, '02680', 'Xã Hợp Thành', 'hop_thanh', '2026-05-26 04:45:34'),
(468, 7, '02683', 'Xã Bát Xát', 'bat_xat', '2026-05-26 04:45:34'),
(469, 7, '02686', 'Xã A Mú Sung', 'a_mu_sung', '2026-05-26 04:45:34'),
(470, 7, '02695', 'Xã Trịnh Tường', 'trinh_tuong', '2026-05-26 04:45:34'),
(471, 7, '02701', 'Xã Y Tý', 'y_ty', '2026-05-26 04:45:34'),
(472, 7, '02707', 'Xã Dền Sáng', 'den_sang', '2026-05-26 04:45:34'),
(473, 7, '02725', 'Xã Bản Xèo', 'ban_xeo', '2026-05-26 04:45:34'),
(474, 7, '02728', 'Xã Mường Hum', 'muong_hum', '2026-05-26 04:45:34'),
(475, 7, '02746', 'Xã Cốc San', 'coc_san', '2026-05-26 04:45:34'),
(476, 7, '02752', 'Xã Pha Long', 'pha_long', '2026-05-26 04:45:34'),
(477, 7, '02761', 'Xã Mường Khương', 'muong_khuong', '2026-05-26 04:45:34'),
(478, 7, '02782', 'Xã Cao Sơn', 'cao_son', '2026-05-26 04:45:34'),
(479, 7, '02788', 'Xã Bản Lầu', 'ban_lau', '2026-05-26 04:45:34'),
(480, 7, '02809', 'Xã Si Ma Cai', 'si_ma_cai', '2026-05-26 04:45:34'),
(481, 7, '02824', 'Xã Sín Chéng', 'sin_cheng', '2026-05-26 04:45:34'),
(482, 7, '02839', 'Xã Bắc Hà', 'bac_ha', '2026-05-26 04:45:34'),
(483, 7, '02842', 'Xã Tả Củ Tỷ', 'ta_cu_ty', '2026-05-26 04:45:34'),
(484, 7, '02848', 'Xã Lùng Phình', 'lung_phinh', '2026-05-26 04:45:34'),
(485, 7, '02869', 'Xã Bản Liền', 'ban_lien', '2026-05-26 04:45:34'),
(486, 7, '02890', 'Xã Bảo Nhai', 'bao_nhai', '2026-05-26 04:45:34'),
(487, 7, '02896', 'Xã Cốc Lầu', 'coc_lau', '2026-05-26 04:45:34'),
(488, 7, '02902', 'Xã Phong Hải', 'phong_hai', '2026-05-26 04:45:34'),
(489, 7, '02905', 'Xã Bảo Thắng', 'bao_thang', '2026-05-26 04:45:34'),
(490, 7, '02908', 'Xã Tằng Loỏng', 'tang_loong', '2026-05-26 04:45:34'),
(491, 7, '02923', 'Xã Gia Phú', 'gia_phu', '2026-05-26 04:45:34'),
(492, 7, '02926', 'Xã Xuân Quang', 'xuan_quang', '2026-05-26 04:45:34'),
(493, 7, '02947', 'Xã Bảo Yên', 'bao_yen', '2026-05-26 04:45:34'),
(494, 7, '02953', 'Xã Nghĩa Đô', 'nghia_do', '2026-05-26 04:45:34'),
(495, 7, '02962', 'Xã Xuân Hòa', 'xuan_hoa', '2026-05-26 04:45:34'),
(496, 7, '02968', 'Xã Thượng Hà', 'thuong_ha', '2026-05-26 04:45:34'),
(497, 7, '02989', 'Xã Bảo Hà', 'bao_ha', '2026-05-26 04:45:34'),
(498, 7, '02998', 'Xã Phúc Khánh', 'phuc_khanh', '2026-05-26 04:45:34'),
(499, 7, '03004', 'Xã Ngũ Chỉ Sơn', 'ngu_chi_son', '2026-05-26 04:45:34'),
(500, 7, '03006', 'Phường Sa Pa', 'sa_pa', '2026-05-26 04:45:34'),
(501, 7, '03013', 'Xã Tả Phìn', 'ta_phin', '2026-05-26 04:45:34'),
(502, 7, '03037', 'Xã Tả Van', 'ta_van', '2026-05-26 04:45:34'),
(503, 7, '03043', 'Xã Mường Bo', 'muong_bo', '2026-05-26 04:45:34'),
(504, 7, '03046', 'Xã Bản Hồ', 'ban_ho', '2026-05-26 04:45:34'),
(505, 7, '03061', 'Xã Võ Lao', 'vo_lao', '2026-05-26 04:45:34'),
(506, 7, '03076', 'Xã Nậm Chày', 'nam_chay', '2026-05-26 04:45:34'),
(507, 7, '03082', 'Xã Văn Bàn', 'van_ban', '2026-05-26 04:45:34'),
(508, 7, '03085', 'Xã Nậm Xé', 'nam_xe', '2026-05-26 04:45:34'),
(509, 7, '03091', 'Xã Chiềng Ken', 'chieng_ken', '2026-05-26 04:45:34'),
(510, 7, '03103', 'Xã Khánh Yên', 'khanh_yen', '2026-05-26 04:45:34'),
(511, 7, '03106', 'Xã Dương Quỳ', 'duong_quy', '2026-05-26 04:45:34'),
(512, 7, '03121', 'Xã Minh Lương', 'minh_luong', '2026-05-26 04:45:34'),
(513, 7, '04252', 'Phường Yên Bái', 'yen_bai', '2026-05-26 04:45:34'),
(514, 7, '04273', 'Phường Nam Cường', 'nam_cuong', '2026-05-26 04:45:34'),
(515, 7, '04279', 'Phường Văn Phú', 'van_phu', '2026-05-26 04:45:34'),
(516, 7, '04288', 'Phường Nghĩa Lộ', 'nghia_lo', '2026-05-26 04:45:34'),
(517, 7, '04303', 'Xã Lục Yên', 'luc_yen', '2026-05-26 04:45:34'),
(518, 7, '04309', 'Xã Lâm Thượng', 'lam_thuong', '2026-05-26 04:45:34'),
(519, 7, '04336', 'Xã Tân Lĩnh', 'tan_linh', '2026-05-26 04:45:34'),
(520, 7, '04342', 'Xã Khánh Hòa', 'khanh_hoa', '2026-05-26 04:45:34'),
(521, 7, '04345', 'Xã Mường Lai', 'muong_lai', '2026-05-26 04:45:34'),
(522, 7, '04363', 'Xã Phúc Lợi', 'phuc_loi', '2026-05-26 04:45:34'),
(523, 7, '04375', 'Xã Mậu A', 'mau_a', '2026-05-26 04:45:34'),
(524, 7, '04381', 'Xã Lâm Giang', 'lam_giang', '2026-05-26 04:45:34'),
(525, 7, '04387', 'Xã Châu Quế', 'chau_que', '2026-05-26 04:45:34'),
(526, 7, '04399', 'Xã Đông Cuông', 'dong_cuong', '2026-05-26 04:45:34'),
(527, 7, '04402', 'Xã Phong Dụ Hạ', 'phong_du_ha', '2026-05-26 04:45:34'),
(528, 7, '04423', 'Xã Phong Dụ Thượng', 'phong_du_thuong', '2026-05-26 04:45:34'),
(529, 7, '04429', 'Xã Tân Hợp', 'tan_hop', '2026-05-26 04:45:34'),
(530, 7, '04441', 'Xã Xuân Ái', 'xuan_ai', '2026-05-26 04:45:34'),
(531, 7, '04450', 'Xã Mỏ Vàng', 'mo_vang', '2026-05-26 04:45:34'),
(532, 7, '04456', 'Xã Mù Cang Chải', 'mu_cang_chai', '2026-05-26 04:45:34'),
(533, 7, '04462', 'Xã Nậm Có', 'nam_co', '2026-05-26 04:45:34'),
(534, 7, '04465', 'Xã Khao Mang', 'khao_mang', '2026-05-26 04:45:34'),
(535, 7, '04474', 'Xã Lao Chải', 'lao_chai', '2026-05-26 04:45:34'),
(536, 7, '04489', 'Xã Chế Tạo', 'che_tao', '2026-05-26 04:45:34'),
(537, 7, '04492', 'Xã Púng Luông', 'pung_luong', '2026-05-26 04:45:34'),
(538, 7, '04498', 'Xã Trấn Yên', 'tran_yen', '2026-05-26 04:45:34'),
(539, 7, '04531', 'Xã Quy Mông', 'quy_mong', '2026-05-26 04:45:34'),
(540, 7, '04537', 'Xã Lương Thịnh', 'luong_thinh', '2026-05-26 04:45:34'),
(541, 7, '04543', 'Phường Âu Lâu', 'au_lau', '2026-05-26 04:45:34'),
(542, 7, '04564', 'Xã Việt Hồng', 'viet_hong', '2026-05-26 04:45:34'),
(543, 7, '04576', 'Xã Hưng Khánh', 'hung_khanh', '2026-05-26 04:45:34'),
(544, 7, '04585', 'Xã Hạnh Phúc', 'hanh_phuc', '2026-05-26 04:45:34'),
(545, 7, '04603', 'Xã Tà Xi Láng', 'ta_xi_lang', '2026-05-26 04:45:34'),
(546, 7, '04606', 'Xã Trạm Tấu', 'tram_tau', '2026-05-26 04:45:34'),
(547, 7, '04609', 'Xã Phình Hồ', 'phinh_ho', '2026-05-26 04:45:34'),
(548, 7, '04630', 'Xã Tú Lệ', 'tu_le', '2026-05-26 04:45:34'),
(549, 7, '04636', 'Xã Gia Hội', 'gia_hoi', '2026-05-26 04:45:34'),
(550, 7, '04651', 'Xã Sơn Lương', 'son_luong', '2026-05-26 04:45:34'),
(551, 7, '04660', 'Xã Liên Sơn', 'lien_son', '2026-05-26 04:45:34'),
(552, 7, '04663', 'Phường Trung Tâm', 'trung_tam', '2026-05-26 04:45:34'),
(553, 7, '04672', 'Xã Văn Chấn', 'van_chan', '2026-05-26 04:45:34'),
(554, 7, '04681', 'Phường Cầu Thia', 'cau_thia', '2026-05-26 04:45:34'),
(555, 7, '04693', 'Xã Cát Thịnh', 'cat_thinh', '2026-05-26 04:45:34'),
(556, 7, '04699', 'Xã Chấn Thịnh', 'chan_thinh', '2026-05-26 04:45:34'),
(557, 7, '04705', 'Xã Thượng Bằng La', 'thuong_bang_la', '2026-05-26 04:45:34'),
(558, 7, '04711', 'Xã Nghĩa Tâm', 'nghia_tam', '2026-05-26 04:45:34'),
(559, 7, '04714', 'Xã Yên Bình', 'yen_binh', '2026-05-26 04:45:34'),
(560, 7, '04717', 'Xã Thác Bà', 'thac_ba', '2026-05-26 04:45:34'),
(561, 7, '04726', 'Xã Cảm Nhân', 'cam_nhan', '2026-05-26 04:45:34'),
(562, 7, '04744', 'Xã Yên Thành', 'yen_thanh', '2026-05-26 04:45:34'),
(563, 7, '04750', 'Xã Bảo Ái', 'bao_ai', '2026-05-26 04:45:34'),
(564, 8, '01840', 'Phường Đức Xuân', 'duc_xuan', '2026-05-26 04:45:34'),
(565, 8, '01843', 'Phường Bắc Kạn', 'bac_kan', '2026-05-26 04:45:34'),
(566, 8, '01849', 'Xã Phong Quang', 'phong_quang', '2026-05-26 04:45:34'),
(567, 8, '01864', 'Xã Bằng Thành', 'bang_thanh', '2026-05-26 04:45:34'),
(568, 8, '01879', 'Xã Cao Minh', 'cao_minh', '2026-05-26 04:45:34'),
(569, 8, '01882', 'Xã Nghiên Loan', 'nghien_loan', '2026-05-26 04:45:34'),
(570, 8, '01894', 'Xã Phúc Lộc', 'phuc_loc', '2026-05-26 04:45:34'),
(571, 8, '01906', 'Xã Ba Bể', 'ba_be', '2026-05-26 04:45:34'),
(572, 8, '01912', 'Xã Chợ Rã', 'cho_ra', '2026-05-26 04:45:34'),
(573, 8, '01921', 'Xã Thượng Minh', 'thuong_minh', '2026-05-26 04:45:34'),
(574, 8, '01933', 'Xã Đồng Phúc', 'dong_phuc', '2026-05-26 04:45:34'),
(575, 8, '01936', 'Xã Nà Phặc', 'na_phac', '2026-05-26 04:45:34'),
(576, 8, '01942', 'Xã Bằng Vân', 'bang_van', '2026-05-26 04:45:34'),
(577, 8, '01954', 'Xã Ngân Sơn', 'ngan_son', '2026-05-26 04:45:34'),
(578, 8, '01957', 'Xã Thượng Quan', 'thuong_quan', '2026-05-26 04:45:34'),
(579, 8, '01960', 'Xã Hiệp Lực', 'hiep_luc', '2026-05-26 04:45:34'),
(580, 8, '01969', 'Xã Phủ Thông', 'phu_thong', '2026-05-26 04:45:34'),
(581, 8, '01981', 'Xã Vĩnh Thông', 'vinh_thong', '2026-05-26 04:45:34'),
(582, 8, '02008', 'Xã Cẩm Giàng', 'cam_giang', '2026-05-26 04:45:34'),
(583, 8, '02014', 'Xã Bạch Thông', 'bach_thong', '2026-05-26 04:45:34'),
(584, 8, '02020', 'Xã Chợ Đồn', 'cho_don', '2026-05-26 04:45:34'),
(585, 8, '02026', 'Xã Nam Cường', 'nam_cuong', '2026-05-26 04:45:34'),
(586, 8, '02038', 'Xã Quảng Bạch', 'quang_bach', '2026-05-26 04:45:34'),
(587, 8, '02044', 'Xã Yên Thịnh', 'yen_thinh', '2026-05-26 04:45:34'),
(588, 8, '02071', 'Xã Nghĩa Tá', 'nghia_ta', '2026-05-26 04:45:34'),
(589, 8, '02083', 'Xã Yên Phong', 'yen_phong', '2026-05-26 04:45:34'),
(590, 8, '02086', 'Xã Chợ Mới', 'cho_moi', '2026-05-26 04:45:34'),
(591, 8, '02101', 'Xã Thanh Mai', 'thanh_mai', '2026-05-26 04:45:34'),
(592, 8, '02104', 'Xã Tân Kỳ', 'tan_ky', '2026-05-26 04:45:34'),
(593, 8, '02107', 'Xã Thanh Thịnh', 'thanh_thinh', '2026-05-26 04:45:34'),
(594, 8, '02116', 'Xã Yên Bình', 'yen_binh', '2026-05-26 04:45:34'),
(595, 8, '02143', 'Xã Văn Lang', 'van_lang', '2026-05-26 04:45:34'),
(596, 8, '02152', 'Xã Cường Lợi', 'cuong_loi', '2026-05-26 04:45:34'),
(597, 8, '02155', 'Xã Na Rì', 'na_ri', '2026-05-26 04:45:34'),
(598, 8, '02176', 'Xã Trần Phú', 'tran_phu', '2026-05-26 04:45:34'),
(599, 8, '02185', 'Xã Côn Minh', 'con_minh', '2026-05-26 04:45:34'),
(600, 8, '02191', 'Xã Xuân Dương', 'xuan_duong', '2026-05-26 04:45:34'),
(601, 8, '05443', 'Phường Phan Đình Phùng', 'phan_dinh_phung', '2026-05-26 04:45:34'),
(602, 8, '05455', 'Phường Quyết Thắng', 'quyet_thang', '2026-05-26 04:45:34'),
(603, 8, '05467', 'Phường Gia Sàng', 'gia_sang', '2026-05-26 04:45:34'),
(604, 8, '05482', 'Phường Quan Triều', 'quan_trieu', '2026-05-26 04:45:34'),
(605, 8, '05488', 'Xã Đại Phúc', 'dai_phuc', '2026-05-26 04:45:34'),
(606, 8, '05500', 'Phường Tích Lương', 'tich_luong', '2026-05-26 04:45:34'),
(607, 8, '05503', 'Xã Tân Cương', 'tan_cuong', '2026-05-26 04:45:34'),
(608, 8, '05518', 'Phường Sông Công', 'song_cong', '2026-05-26 04:45:34'),
(609, 8, '05528', 'Phường Bách Quang', 'bach_quang', '2026-05-26 04:45:34'),
(610, 8, '05533', 'Phường Bá Xuyên', 'ba_xuyen', '2026-05-26 04:45:34'),
(611, 8, '05542', 'Xã Lam Vỹ', 'lam_vy', '2026-05-26 04:45:34'),
(612, 8, '05551', 'Xã Kim Phượng', 'kim_phuong', '2026-05-26 04:45:34'),
(613, 8, '05563', 'Xã Phượng Tiến', 'tien', '2026-05-26 04:45:34'),
(614, 8, '05569', 'Xã Định Hóa', 'dinh_hoa', '2026-05-26 04:45:34'),
(615, 8, '05581', 'Xã Trung Hội', 'trung_hoi', '2026-05-26 04:45:34'),
(616, 8, '05587', 'Xã Bình Yên', 'binh_yen', '2026-05-26 04:45:34'),
(617, 8, '05602', 'Xã Phú Đình', 'phu_dinh', '2026-05-26 04:45:34'),
(618, 8, '05605', 'Xã Bình Thành', 'binh_thanh', '2026-05-26 04:45:34'),
(619, 8, '05611', 'Xã Phú Lương', 'phu_luong', '2026-05-26 04:45:34'),
(620, 8, '05620', 'Xã Yên Trạch', 'yen_trach', '2026-05-26 04:45:34'),
(621, 8, '05632', 'Xã Hợp Thành', 'hop_thanh', '2026-05-26 04:45:34'),
(622, 8, '05641', 'Xã Vô Tranh', 'vo_tranh', '2026-05-26 04:45:34'),
(623, 8, '05662', 'Xã Trại Cau', 'trai_cau', '2026-05-26 04:45:34'),
(624, 8, '05665', 'Xã Văn Lăng', 'van_lang', '2026-05-26 04:45:34'),
(625, 8, '05674', 'Xã Quang Sơn', 'quang_son', '2026-05-26 04:45:34'),
(626, 8, '05680', 'Xã Văn Hán', 'van_han', '2026-05-26 04:45:34'),
(627, 8, '05692', 'Xã Đồng Hỷ', 'dong_hy', '2026-05-26 04:45:34'),
(628, 8, '05707', 'Xã Nam Hòa', 'nam_hoa', '2026-05-26 04:45:34'),
(629, 8, '05710', 'Phường Linh Sơn', 'linh_son', '2026-05-26 04:45:34'),
(630, 8, '05716', 'Xã Võ Nhai', 'vo_nhai', '2026-05-26 04:45:34'),
(631, 8, '05719', 'Xã Sảng Mộc', 'sang_moc', '2026-05-26 04:45:34'),
(632, 8, '05722', 'Xã Nghinh Tường', 'nghinh_tuong', '2026-05-26 04:45:34'),
(633, 8, '05725', 'Xã Thần Sa', 'than_sa', '2026-05-26 04:45:34'),
(634, 8, '05740', 'Xã La Hiên', 'la_hien', '2026-05-26 04:45:34'),
(635, 8, '05746', 'Xã Tràng Xá', 'trang_xa', '2026-05-26 04:45:34'),
(636, 8, '05755', 'Xã Dân Tiến', 'dan_tien', '2026-05-26 04:45:34'),
(637, 8, '05773', 'Xã Phú Xuyên', 'phu_xuyen', '2026-05-26 04:45:34'),
(638, 8, '05776', 'Xã Đức Lương', 'duc_luong', '2026-05-26 04:45:34'),
(639, 8, '05788', 'Xã Phú Lạc', 'phu_lac', '2026-05-26 04:45:34'),
(640, 8, '05800', 'Xã Phú Thịnh', 'phu_thinh', '2026-05-26 04:45:34'),
(641, 8, '05809', 'Xã An Khánh', 'an_khanh', '2026-05-26 04:45:34'),
(642, 8, '05818', 'Xã La Bằng', 'la_bang', '2026-05-26 04:45:34'),
(643, 8, '05830', 'Xã Đại Từ', 'dai_tu', '2026-05-26 04:45:34'),
(644, 8, '05845', 'Xã Vạn Phú', 'van_phu', '2026-05-26 04:45:34'),
(645, 8, '05851', 'Xã Quân Chu', 'quan_chu', '2026-05-26 04:45:34'),
(646, 8, '05857', 'Phường Phúc Thuận', 'phuc_thuan', '2026-05-26 04:45:34'),
(647, 8, '05860', 'Phường Phổ Yên', 'pho_yen', '2026-05-26 04:45:34'),
(648, 8, '05881', 'Xã Thành Công', 'thanh_cong', '2026-05-26 04:45:34'),
(649, 8, '05890', 'Phường Vạn Xuân', 'van_xuan', '2026-05-26 04:45:34'),
(650, 8, '05899', 'Phường Trung Thành', 'trung_thanh', '2026-05-26 04:45:34'),
(651, 8, '05908', 'Xã Phú Bình', 'phu_binh', '2026-05-26 04:45:34'),
(652, 8, '05917', 'Xã Tân Khánh', 'tan_khanh', '2026-05-26 04:45:34'),
(653, 8, '05923', 'Xã Tân Thành', 'tan_thanh', '2026-05-26 04:45:34'),
(654, 8, '05941', 'Xã Điềm Thụy', 'diem_thuy', '2026-05-26 04:45:34'),
(655, 8, '05953', 'Xã Kha Sơn', 'kha_son', '2026-05-26 04:45:34'),
(656, 9, '05977', 'Phường Đông Kinh', 'dong_kinh', '2026-05-26 04:45:34'),
(657, 9, '05983', 'Phường Lương Văn Tri', 'luong_van_tri', '2026-05-26 04:45:34'),
(658, 9, '05986', 'Phường Tam Thanh', 'tam_thanh', '2026-05-26 04:45:34'),
(659, 9, '06001', 'Xã Đoàn Kết', 'doan_ket', '2026-05-26 04:45:34'),
(660, 9, '06004', 'Xã Quốc Khánh', 'quoc_khanh', '2026-05-26 04:45:34'),
(661, 9, '06019', 'Xã Tân Tiến', 'tan_tien', '2026-05-26 04:45:34'),
(662, 9, '06037', 'Xã Kháng Chiến', 'khang_chien', '2026-05-26 04:45:34'),
(663, 9, '06040', 'Xã Thất Khê', 'that_khe', '2026-05-26 04:45:34'),
(664, 9, '06046', 'Xã Tràng Định', 'trang_dinh', '2026-05-26 04:45:34'),
(665, 9, '06058', 'Xã Quốc Việt', 'quoc_viet', '2026-05-26 04:45:34'),
(666, 9, '06073', 'Xã Hoa Thám', 'hoa_tham', '2026-05-26 04:45:34'),
(667, 9, '06076', 'Xã Quý Hòa', 'quy_hoa', '2026-05-26 04:45:34'),
(668, 9, '06079', 'Xã Hồng Phong', 'hong_phong', '2026-05-26 04:45:34'),
(669, 9, '06085', 'Xã Thiện Hòa', 'thien_hoa', '2026-05-26 04:45:34'),
(670, 9, '06091', 'Xã Thiện Thuật', 'thien_thuat', '2026-05-26 04:45:34'),
(671, 9, '06103', 'Xã Thiện Long', 'thien_long', '2026-05-26 04:45:34'),
(672, 9, '06112', 'Xã Bình Gia', 'binh_gia', '2026-05-26 04:45:34'),
(673, 9, '06115', 'Xã Tân Văn', 'tan_van', '2026-05-26 04:45:34'),
(674, 9, '06124', 'Xã Na Sầm', 'na_sam', '2026-05-26 04:45:34'),
(675, 9, '06148', 'Xã Thụy Hùng', 'thuy_hung', '2026-05-26 04:45:34'),
(676, 9, '06151', 'Xã Hội Hoan', 'hoi_hoan', '2026-05-26 04:45:34'),
(677, 9, '06154', 'Xã Văn Lãng', 'van_lang', '2026-05-26 04:45:34'),
(678, 9, '06172', 'Xã Hoàng Văn Thụ', 'hoang_van_thu', '2026-05-26 04:45:34'),
(679, 9, '06184', 'Xã Đồng Đăng', 'dong_dang', '2026-05-26 04:45:34'),
(680, 9, '06187', 'Phường Kỳ Lừa', 'ky_lua', '2026-05-26 04:45:34'),
(681, 9, '06196', 'Xã Ba Sơn', 'ba_son', '2026-05-26 04:45:34'),
(682, 9, '06211', 'Xã Cao Lộc', 'cao_loc', '2026-05-26 04:45:34'),
(683, 9, '06220', 'Xã Công Sơn', 'cong_son', '2026-05-26 04:45:34'),
(684, 9, '06253', 'Xã Văn Quan', 'van_quan', '2026-05-26 04:45:34'),
(685, 9, '06280', 'Xã Điềm He', 'diem_he', '2026-05-26 04:45:34'),
(686, 9, '06286', 'Xã Khánh Khê', 'khanh_khe', '2026-05-26 04:45:34'),
(687, 9, '06298', 'Xã Yên Phúc', 'yen_phuc', '2026-05-26 04:45:34'),
(688, 9, '06313', 'Xã Tri Lễ', 'tri_le', '2026-05-26 04:45:34'),
(689, 9, '06316', 'Xã Tân Đoàn', 'tan_doan', '2026-05-26 04:45:34'),
(690, 9, '06325', 'xã Bắc Sơn', 'bac_son', '2026-05-26 04:45:34'),
(691, 9, '06337', 'Xã Tân Tri', 'tan_tri', '2026-05-26 04:45:34'),
(692, 9, '06349', 'Xã Hưng Vũ', 'hung_vu', '2026-05-26 04:45:34'),
(693, 9, '06364', 'Xã Vũ Lễ', 'vu_le', '2026-05-26 04:45:34'),
(694, 9, '06367', 'Xã Vũ Lăng', 'vu_lang', '2026-05-26 04:45:34'),
(695, 9, '06376', 'Xã Nhất Hòa', 'nhat_hoa', '2026-05-26 04:45:34'),
(696, 9, '06385', 'Xã Hữu Lũng', 'huu_lung', '2026-05-26 04:45:34'),
(697, 9, '06391', 'Xã Yên Bình', 'yen_binh', '2026-05-26 04:45:34'),
(698, 9, '06400', 'Xã Hữu Liên', 'huu_lien', '2026-05-26 04:45:34'),
(699, 9, '06415', 'Xã Vân Nham', 'van_nham', '2026-05-26 04:45:34'),
(700, 9, '06427', 'Xã Cai Kinh', 'cai_kinh', '2026-05-26 04:45:34'),
(701, 9, '06436', 'Xã Thiện Tân', 'thien_tan', '2026-05-26 04:45:34'),
(702, 9, '06445', 'Xã Tân Thành', 'tan_thanh', '2026-05-26 04:45:34'),
(703, 9, '06457', 'Xã Tuấn Sơn', 'tuan_son', '2026-05-26 04:45:34'),
(704, 9, '06463', 'Xã Chi Lăng', 'chi_lang', '2026-05-26 04:45:34'),
(705, 9, '06475', 'Xã Bằng Mạc', 'bang_mac', '2026-05-26 04:45:34'),
(706, 9, '06481', 'Xã Chiến Thắng', 'chien_thang', '2026-05-26 04:45:34'),
(707, 9, '06496', 'Xã Nhân Lý', 'nhan_ly', '2026-05-26 04:45:34'),
(708, 9, '06505', 'Xã Vạn Linh', 'van_linh', '2026-05-26 04:45:34'),
(709, 9, '06517', 'Xã Quan Sơn', 'quan_son', '2026-05-26 04:45:34'),
(710, 9, '06526', 'Xã Na Dương', 'na_duong', '2026-05-26 04:45:34'),
(711, 9, '06529', 'Xã Lộc Bình', 'loc_binh', '2026-05-26 04:45:34'),
(712, 9, '06541', 'Xã Mẫu Sơn', 'mau_son', '2026-05-26 04:45:34'),
(713, 9, '06565', 'Xã Khuất Xá', 'khuat_xa', '2026-05-26 04:45:34'),
(714, 9, '06577', 'Xã Thống Nhất', 'thong_nhat', '2026-05-26 04:45:34'),
(715, 9, '06601', 'Xã Lợi Bác', 'loi_bac', '2026-05-26 04:45:34'),
(716, 9, '06607', 'Xã Xuân Dương', 'xuan_duong', '2026-05-26 04:45:34'),
(717, 9, '06613', 'Xã Đình Lập', 'dinh_lap', '2026-05-26 04:45:34'),
(718, 9, '06616', 'Xã Thái Bình', 'thai_binh', '2026-05-26 04:45:34'),
(719, 9, '06625', 'Xã Kiên Mộc', 'kien_moc', '2026-05-26 04:45:34'),
(720, 9, '06637', 'Xã Châu Sơn', 'chau_son', '2026-05-26 04:45:34'),
(721, 10, '06652', 'Phường Hà Tu', 'ha_tu', '2026-05-26 04:45:34'),
(722, 10, '06658', 'Phường Cao Xanh', 'cao_xanh', '2026-05-26 04:45:34'),
(723, 10, '06661', 'Phường Việt Hưng', 'viet_hung', '2026-05-26 04:45:34'),
(724, 10, '06673', 'Phường Bãi Cháy', 'bai_chay', '2026-05-26 04:45:34'),
(725, 10, '06676', 'Phường Hà Lầm', 'ha_lam', '2026-05-26 04:45:34'),
(726, 10, '06685', 'Phường Hồng Gai', 'hong_gai', '2026-05-26 04:45:34'),
(727, 10, '06688', 'Phường Hạ Long', 'ha_long', '2026-05-26 04:45:34'),
(728, 10, '06706', 'Phường Tuần Châu', 'tuan_chau', '2026-05-26 04:45:34'),
(729, 10, '06709', 'Phường Móng Cái 2', 'mong_cai_2', '2026-05-26 04:45:34'),
(730, 10, '06712', 'Phường Móng Cái 1', 'mong_cai_1', '2026-05-26 04:45:34'),
(731, 10, '06724', 'Xã Hải Sơn', 'hai_son', '2026-05-26 04:45:34');
INSERT INTO `hicrm_district` (`id`, `province_id`, `district_code`, `district_name`, `district_keyword`, `created_at`) VALUES
(732, 10, '06733', 'Xã Hải Ninh', 'hai_ninh', '2026-05-26 04:45:34'),
(733, 10, '06736', 'Phường Móng Cái 3', 'mong_cai_3', '2026-05-26 04:45:34'),
(734, 10, '06757', 'Xã Vĩnh Thực', 'vinh_thuc', '2026-05-26 04:45:34'),
(735, 10, '06760', 'Phường Mông Dương', 'mong_duong', '2026-05-26 04:45:34'),
(736, 10, '06778', 'Phường Quang Hanh', 'quang_hanh', '2026-05-26 04:45:34'),
(737, 10, '06781', 'Phường Cửa Ông', 'cua_ong', '2026-05-26 04:45:34'),
(738, 10, '06793', 'Phường Cẩm Phả', 'cam_pha', '2026-05-26 04:45:34'),
(739, 10, '06799', 'Xã Hải Hòa', 'hai_hoa', '2026-05-26 04:45:34'),
(740, 10, '06811', 'Phường Uông Bí', 'uong_bi', '2026-05-26 04:45:34'),
(741, 10, '06820', 'Phường Vàng Danh', 'vang_danh', '2026-05-26 04:45:34'),
(742, 10, '06832', 'Phường Yên Tử', 'yen_tu', '2026-05-26 04:45:34'),
(743, 10, '06838', 'Xã Bình Liêu', 'binh_lieu', '2026-05-26 04:45:34'),
(744, 10, '06841', 'Xã Hoành Mô', 'hoanh_mo', '2026-05-26 04:45:34'),
(745, 10, '06856', 'Xã Lục Hồn', 'luc_hon', '2026-05-26 04:45:34'),
(746, 10, '06862', 'Xã Tiên Yên', 'tien_yen', '2026-05-26 04:45:34'),
(747, 10, '06874', 'Xã Điền Xá', 'dien_xa', '2026-05-26 04:45:34'),
(748, 10, '06877', 'Xã Đông Ngũ', 'dong_ngu', '2026-05-26 04:45:34'),
(749, 10, '06886', 'Xã Hải Lạng', 'hai_lang', '2026-05-26 04:45:34'),
(750, 10, '06895', 'Xã Đầm Hà', 'dam_ha', '2026-05-26 04:45:34'),
(751, 10, '06913', 'Xã Quảng Tân', 'quang_tan', '2026-05-26 04:45:34'),
(752, 10, '06922', 'Xã Quảng Hà', 'quang_ha', '2026-05-26 04:45:34'),
(753, 10, '06931', 'Xã Quảng Đức', 'quang_duc', '2026-05-26 04:45:34'),
(754, 10, '06946', 'Xã Đường Hoa', 'duong_hoa', '2026-05-26 04:45:34'),
(755, 10, '06967', 'Xã Cái Chiên', 'cai_chien', '2026-05-26 04:45:34'),
(756, 10, '06970', 'Xã Ba Chẽ', 'ba_che', '2026-05-26 04:45:34'),
(757, 10, '06979', 'Xã Kỳ Thượng', 'ky_thuong', '2026-05-26 04:45:34'),
(758, 10, '06985', 'Xã Lương Minh', 'luong_minh', '2026-05-26 04:45:34'),
(759, 10, '06994', 'Đặc khu Vân Đồn', 'van_don', '2026-05-26 04:45:34'),
(760, 10, '07030', 'Phường Hoành Bồ', 'hoanh_bo', '2026-05-26 04:45:34'),
(761, 10, '07054', 'Xã Quảng La', 'quang_la', '2026-05-26 04:45:34'),
(762, 10, '07060', 'Xã Thống Nhất', 'thong_nhat', '2026-05-26 04:45:34'),
(763, 10, '07069', 'Phường Mạo Khê', 'mao_khe', '2026-05-26 04:45:34'),
(764, 10, '07081', 'Phường Bình Khê', 'binh_khe', '2026-05-26 04:45:34'),
(765, 10, '07090', 'Phường An Sinh', 'an_sinh', '2026-05-26 04:45:34'),
(766, 10, '07093', 'Phường Đông Triều', 'dong_trieu', '2026-05-26 04:45:34'),
(767, 10, '07114', 'Phường Hoàng Quế', 'hoang_que', '2026-05-26 04:45:34'),
(768, 10, '07132', 'Phường Quảng Yên', 'quang_yen', '2026-05-26 04:45:34'),
(769, 10, '07135', 'Phường Đông Mai', 'dong_mai', '2026-05-26 04:45:34'),
(770, 10, '07147', 'Phường Hiệp Hòa', 'hiep_hoa', '2026-05-26 04:45:34'),
(771, 10, '07168', 'Phường Hà An', 'ha_an', '2026-05-26 04:45:34'),
(772, 10, '07180', 'Phường Liên Hòa', 'lien_hoa', '2026-05-26 04:45:34'),
(773, 10, '07183', 'Phường Phong Cốc', 'phong_coc', '2026-05-26 04:45:34'),
(774, 10, '07192', 'Đặc khu Cô Tô', 'co_to', '2026-05-26 04:45:34'),
(775, 11, '07210', 'Phường Bắc Giang', 'bac_giang', '2026-05-26 04:45:34'),
(776, 11, '07228', 'Phường Đa Mai', 'da_mai', '2026-05-26 04:45:34'),
(777, 11, '07246', 'Xã Xuân Lương', 'xuan_luong', '2026-05-26 04:45:34'),
(778, 11, '07264', 'Xã Tam Tiến', 'tam_tien', '2026-05-26 04:45:34'),
(779, 11, '07282', 'Xã Đồng Kỳ', 'dong_ky', '2026-05-26 04:45:34'),
(780, 11, '07288', 'Xã Yên Thế', 'yen_the', '2026-05-26 04:45:34'),
(781, 11, '07294', 'Xã Bố Hạ', 'bo_ha', '2026-05-26 04:45:34'),
(782, 11, '07306', 'Xã Nhã Nam', 'nha_nam', '2026-05-26 04:45:34'),
(783, 11, '07330', 'Xã Phúc Hòa', 'phuc_hoa', '2026-05-26 04:45:34'),
(784, 11, '07333', 'Xã Quang Trung', 'quang_trung', '2026-05-26 04:45:34'),
(785, 11, '07339', 'Xã Tân Yên', 'tan_yen', '2026-05-26 04:45:34'),
(786, 11, '07351', 'Xã Ngọc Thiện', 'ngoc_thien', '2026-05-26 04:45:34'),
(787, 11, '07375', 'Xã Lạng Giang', 'lang_giang', '2026-05-26 04:45:34'),
(788, 11, '07381', 'Xã Tiên Lục', 'tien_luc', '2026-05-26 04:45:34'),
(789, 11, '07399', 'Xã Kép', 'kep', '2026-05-26 04:45:34'),
(790, 11, '07420', 'Xã Mỹ Thái', 'my_thai', '2026-05-26 04:45:34'),
(791, 11, '07432', 'Xã Tân Dĩnh', 'tan_dinh', '2026-05-26 04:45:34'),
(792, 11, '07444', 'Xã Lục Nam', 'luc_nam', '2026-05-26 04:45:34'),
(793, 11, '07450', 'Xã Đông Phú', 'dong_phu', '2026-05-26 04:45:34'),
(794, 11, '07462', 'Xã Bảo Đài', 'bao_dai', '2026-05-26 04:45:34'),
(795, 11, '07486', 'Xã Nghĩa Phương', 'nghia_phuong', '2026-05-26 04:45:34'),
(796, 11, '07489', 'Xã Trường Sơn', 'truong_son', '2026-05-26 04:45:34'),
(797, 11, '07492', 'Xã Lục Sơn', 'luc_son', '2026-05-26 04:45:34'),
(798, 11, '07498', 'Xã Bắc Lũng', 'bac_lung', '2026-05-26 04:45:34'),
(799, 11, '07519', 'Xã Cẩm Lý', 'cam_ly', '2026-05-26 04:45:34'),
(800, 11, '07525', 'Phường Chũ', 'chu', '2026-05-26 04:45:34'),
(801, 11, '07531', 'Xã Tân Sơn', 'tan_son', '2026-05-26 04:45:34'),
(802, 11, '07534', 'Xã Sa Lý', 'sa_ly', '2026-05-26 04:45:34'),
(803, 11, '07537', 'Xã Biên Sơn', 'bien_son', '2026-05-26 04:45:34'),
(804, 11, '07543', 'Xã Sơn Hải', 'son_hai', '2026-05-26 04:45:34'),
(805, 11, '07552', 'Xã Kiên Lao', 'kien_lao', '2026-05-26 04:45:34'),
(806, 11, '07573', 'Xã Biển Động', 'bien_dong', '2026-05-26 04:45:34'),
(807, 11, '07582', 'Xã Lục Ngạn', 'luc_ngan', '2026-05-26 04:45:34'),
(808, 11, '07594', 'Xã Đèo Gia', 'deo_gia', '2026-05-26 04:45:34'),
(809, 11, '07603', 'Xã Nam Dương', 'nam_duong', '2026-05-26 04:45:34'),
(810, 11, '07612', 'Phường Phượng Sơn', 'phuong_son', '2026-05-26 04:45:34'),
(811, 11, '07615', 'Xã Sơn Động', 'son_dong', '2026-05-26 04:45:34'),
(812, 11, '07616', 'Xã Tây Yên Tử', 'tay_yen_tu', '2026-05-26 04:45:34'),
(813, 11, '07621', 'Xã Vân Sơn', 'van_son', '2026-05-26 04:45:34'),
(814, 11, '07627', 'Xã Đại Sơn', 'dai_son', '2026-05-26 04:45:34'),
(815, 11, '07642', 'Xã Yên Định', 'yen_dinh', '2026-05-26 04:45:34'),
(816, 11, '07654', 'Xã An Lạc', 'an_lac', '2026-05-26 04:45:34'),
(817, 11, '07663', 'Xã Tuấn Đạo', 'tuan_dao', '2026-05-26 04:45:34'),
(818, 11, '07672', 'Xã Dương Hưu', 'duong_huu', '2026-05-26 04:45:34'),
(819, 11, '07681', 'Phường Yên Dũng', 'yen_dung', '2026-05-26 04:45:34'),
(820, 11, '07682', 'Phường Tân An', 'tan_an', '2026-05-26 04:45:34'),
(821, 11, '07696', 'Phường Tiền Phong', 'tien_phong', '2026-05-26 04:45:34'),
(822, 11, '07699', 'Phường Tân Tiến', 'tan_tien', '2026-05-26 04:45:34'),
(823, 11, '07735', 'Xã Đồng Việt', 'dong_viet', '2026-05-26 04:45:34'),
(824, 11, '07738', 'Phường Cảnh Thụy', 'canh_thuy', '2026-05-26 04:45:34'),
(825, 11, '07774', 'Phường Tự Lạn', 'tu_lan', '2026-05-26 04:45:34'),
(826, 11, '07777', 'Phường Việt Yên', 'viet_yen', '2026-05-26 04:45:34'),
(827, 11, '07795', 'Phường Nếnh', 'nenh', '2026-05-26 04:45:34'),
(828, 11, '07798', 'Phường Vân Hà', 'van_ha', '2026-05-26 04:45:34'),
(829, 11, '07822', 'Xã Hoàng Vân', 'hoang_van', '2026-05-26 04:45:34'),
(830, 11, '07840', 'Xã Hiệp Hoà', 'hiep_hoa', '2026-05-26 04:45:34'),
(831, 11, '07864', 'Xã Hợp Thịnh', 'hop_thinh', '2026-05-26 04:45:34'),
(832, 11, '07870', 'Xã Xuân Cẩm', 'xuan_cam', '2026-05-26 04:45:34'),
(833, 11, '09169', 'Phường Vũ Ninh', 'vu_ninh', '2026-05-26 04:45:34'),
(834, 11, '09187', 'Phường Kinh Bắc', 'kinh_bac', '2026-05-26 04:45:34'),
(835, 11, '09190', 'Phường Võ Cường', 'vo_cuong', '2026-05-26 04:45:34'),
(836, 11, '09193', 'Xã Yên Phong', 'yen_phong', '2026-05-26 04:45:34'),
(837, 11, '09202', 'Xã Tam Giang', 'tam_giang', '2026-05-26 04:45:34'),
(838, 11, '09205', 'Xã Yên Trung', 'yen_trung', '2026-05-26 04:45:34'),
(839, 11, '09208', 'Xã Tam Đa', 'tam_da', '2026-05-26 04:45:34'),
(840, 11, '09238', 'Xã Văn Môn', 'van_mon', '2026-05-26 04:45:34'),
(841, 11, '09247', 'Phường Quế Võ', 'que_vo', '2026-05-26 04:45:34'),
(842, 11, '09253', 'Phường Nhân Hòa', 'nhan_hoa', '2026-05-26 04:45:34'),
(843, 11, '09265', 'Phường Phương Liễu', 'phuong_lieu', '2026-05-26 04:45:34'),
(844, 11, '09286', 'Phường Nam Sơn', 'nam_son', '2026-05-26 04:45:34'),
(845, 11, '09292', 'Xã Phù Lãng', 'phu_lang', '2026-05-26 04:45:34'),
(846, 11, '09295', 'Phường Bồng Lai', 'bong_lai', '2026-05-26 04:45:34'),
(847, 11, '09301', 'Phường Đào Viên', 'dao_vien', '2026-05-26 04:45:34'),
(848, 11, '09313', 'Xã Chi Lăng', 'chi_lang', '2026-05-26 04:45:34'),
(849, 11, '09319', 'Xã Tiên Du', 'tien_du', '2026-05-26 04:45:34'),
(850, 11, '09325', 'Phường Hạp Lĩnh', 'hap_linh', '2026-05-26 04:45:34'),
(851, 11, '09334', 'Xã Liên Bão', 'lien_bao', '2026-05-26 04:45:34'),
(852, 11, '09340', 'Xã Đại Đồng', 'dai_dong', '2026-05-26 04:45:34'),
(853, 11, '09343', 'Xã Tân Chi', 'tan_chi', '2026-05-26 04:45:34'),
(854, 11, '09349', 'Xã Phật Tích', 'phat_tich', '2026-05-26 04:45:34'),
(855, 11, '09367', 'Phường Từ Sơn', 'tu_son', '2026-05-26 04:45:34'),
(856, 11, '09370', 'Phường Tam Sơn', 'tam_son', '2026-05-26 04:45:34'),
(857, 11, '09379', 'Phường Phù Khê', 'phu_khe', '2026-05-26 04:45:34'),
(858, 11, '09385', 'Phường Đồng Nguyên', 'dong_nguyen', '2026-05-26 04:45:34'),
(859, 11, '09400', 'Phường Thuận Thành', 'thuan_thanh', '2026-05-26 04:45:34'),
(860, 11, '09409', 'Phường Mão Điền', 'mao_dien', '2026-05-26 04:45:34'),
(861, 11, '09427', 'Phường Trí Quả', 'tri_qua', '2026-05-26 04:45:34'),
(862, 11, '09430', 'Phường Trạm Lộ', 'tram_lo', '2026-05-26 04:45:34'),
(863, 11, '09433', 'Phường Song Liễu', 'song_lieu', '2026-05-26 04:45:34'),
(864, 11, '09445', 'Phường Ninh Xá', 'ninh_xa', '2026-05-26 04:45:34'),
(865, 11, '09454', 'Xã Gia Bình', 'gia_binh', '2026-05-26 04:45:34'),
(866, 11, '09466', 'Xã Cao Đức', 'cao_duc', '2026-05-26 04:45:34'),
(867, 11, '09469', 'Xã Đại Lai', 'dai_lai', '2026-05-26 04:45:34'),
(868, 11, '09475', 'Xã Nhân Thắng', 'nhan_thang', '2026-05-26 04:45:34'),
(869, 11, '09487', 'Xã Đông Cứu', 'dong_cuu', '2026-05-26 04:45:34'),
(870, 11, '09496', 'Xã Lương Tài', 'luong_tai', '2026-05-26 04:45:34'),
(871, 11, '09499', 'Xã Trung Kênh', 'trung_kenh', '2026-05-26 04:45:34'),
(872, 11, '09523', 'Xã Trung Chính', 'trung_chinh', '2026-05-26 04:45:34'),
(873, 11, '09529', 'Xã Lâm Thao', 'lam_thao', '2026-05-26 04:45:34'),
(874, 12, '04792', 'Phường Tân Hòa', 'tan_hoa', '2026-05-26 04:45:34'),
(875, 12, '04795', 'Phường Hòa Bình', 'hoa_binh', '2026-05-26 04:45:34'),
(876, 12, '04828', 'Phường Thống Nhất', 'thong_nhat', '2026-05-26 04:45:34'),
(877, 12, '04831', 'Xã Đà Bắc', 'da_bac', '2026-05-26 04:45:34'),
(878, 12, '04846', 'Xã Đức Nhàn', 'duc_nhan', '2026-05-26 04:45:34'),
(879, 12, '04849', 'Xã Tân Pheo', 'tan_pheo', '2026-05-26 04:45:34'),
(880, 12, '04873', 'Xã Quy Đức', 'quy_duc', '2026-05-26 04:45:34'),
(881, 12, '04876', 'Xã Cao Sơn', 'cao_son', '2026-05-26 04:45:34'),
(882, 12, '04891', 'Xã Tiền Phong', 'tien_phong', '2026-05-26 04:45:34'),
(883, 12, '04894', 'Phường Kỳ Sơn', 'ky_son', '2026-05-26 04:45:34'),
(884, 12, '04897', 'Xã Thịnh Minh', 'thinh_minh', '2026-05-26 04:45:34'),
(885, 12, '04924', 'Xã Lương Sơn', 'luong_son', '2026-05-26 04:45:34'),
(886, 12, '04960', 'Xã Liên Sơn', 'lien_son', '2026-05-26 04:45:34'),
(887, 12, '04978', 'Xã Kim Bôi', 'kim_boi', '2026-05-26 04:45:34'),
(888, 12, '04990', 'Xã Nật Sơn', 'nat_son', '2026-05-26 04:45:34'),
(889, 12, '05014', 'Xã Mường Động', 'muong_dong', '2026-05-26 04:45:34'),
(890, 12, '05047', 'Xã Cao Dương', 'cao_duong', '2026-05-26 04:45:34'),
(891, 12, '05068', 'Xã Hợp Kim', 'hop_kim', '2026-05-26 04:45:34'),
(892, 12, '05086', 'Xã Dũng Tiến', 'dung_tien', '2026-05-26 04:45:34'),
(893, 12, '05089', 'Xã Cao Phong', 'cao_phong', '2026-05-26 04:45:34'),
(894, 12, '05092', 'Xã Thung Nai', 'thung_nai', '2026-05-26 04:45:34'),
(895, 12, '05116', 'Xã Mường Thàng', 'muong_thang', '2026-05-26 04:45:34'),
(896, 12, '05128', 'Xã Tân Lạc', 'tan_lac', '2026-05-26 04:45:34'),
(897, 12, '05134', 'Xã Mường Hoa', 'muong_hoa', '2026-05-26 04:45:34'),
(898, 12, '05152', 'Xã Vân Sơn', 'van_son', '2026-05-26 04:45:34'),
(899, 12, '05158', 'Xã Mường Bi', 'muong_bi', '2026-05-26 04:45:34'),
(900, 12, '05191', 'Xã Toàn Thắng', 'toan_thang', '2026-05-26 04:45:34'),
(901, 12, '05200', 'Xã Mai Châu', 'mai_chau', '2026-05-26 04:45:34'),
(902, 12, '05206', 'Xã Tân Mai', 'tan_mai', '2026-05-26 04:45:34'),
(903, 12, '05212', 'Xã Pà Cò', 'pa_co', '2026-05-26 04:45:34'),
(904, 12, '05245', 'Xã Bao La', 'bao_la', '2026-05-26 04:45:34'),
(905, 12, '05251', 'Xã Mai Hạ', 'mai_ha', '2026-05-26 04:45:34'),
(906, 12, '05266', 'Xã Lạc Sơn', 'lac_son', '2026-05-26 04:45:34'),
(907, 12, '05287', 'Xã Mường Vang', 'muong_vang', '2026-05-26 04:45:34'),
(908, 12, '05290', 'Xã Nhân Nghĩa', 'nhan_nghia', '2026-05-26 04:45:34'),
(909, 12, '05293', 'Xã Thượng Cốc', 'thuong_coc', '2026-05-26 04:45:34'),
(910, 12, '05305', 'Xã Yên Phú', 'yen_phu', '2026-05-26 04:45:34'),
(911, 12, '05323', 'Xã Quyết Thắng', 'quyet_thang', '2026-05-26 04:45:34'),
(912, 12, '05329', 'Xã Ngọc Sơn', 'ngoc_son', '2026-05-26 04:45:34'),
(913, 12, '05347', 'Xã Đại Đồng', 'dai_dong', '2026-05-26 04:45:34'),
(914, 12, '05353', 'Xã Yên Thủy', 'yen_thuy', '2026-05-26 04:45:34'),
(915, 12, '05362', 'Xã Lạc Lương', 'lac_luong', '2026-05-26 04:45:34'),
(916, 12, '05386', 'Xã Yên Trị', 'yen_tri', '2026-05-26 04:45:34'),
(917, 12, '05392', 'Xã Lạc Thủy', 'lac_thuy', '2026-05-26 04:45:34'),
(918, 12, '05395', 'Xã An Nghĩa', 'an_nghia', '2026-05-26 04:45:34'),
(919, 12, '05425', 'Xã An Bình', 'an_binh', '2026-05-26 04:45:34'),
(920, 12, '07894', 'Phường Nông Trang', 'nong_trang', '2026-05-26 04:45:34'),
(921, 12, '07900', 'Phường Việt Trì', 'viet_tri', '2026-05-26 04:45:34'),
(922, 12, '07909', 'Phường Thanh Miếu', 'thanh_mieu', '2026-05-26 04:45:34'),
(923, 12, '07918', 'Phường Vân Phú', 'van_phu', '2026-05-26 04:45:34'),
(924, 12, '07942', 'Phường Phú Thọ', 'phu_tho', '2026-05-26 04:45:34'),
(925, 12, '07948', 'Phường Âu Cơ', 'au_co', '2026-05-26 04:45:34'),
(926, 12, '07954', 'Phường Phong Châu', 'phong_chau', '2026-05-26 04:45:34'),
(927, 12, '07969', 'Xã Đoan Hùng', 'doan_hung', '2026-05-26 04:45:34'),
(928, 12, '07996', 'Xã Bằng Luân', 'bang_luan', '2026-05-26 04:45:34'),
(929, 12, '07999', 'Xã Chí Đám', 'chi_dam', '2026-05-26 04:45:34'),
(930, 12, '08023', 'Xã Tây Cốc', 'tay_coc', '2026-05-26 04:45:34'),
(931, 12, '08038', 'Xã Chân Mộng', 'chan_mong', '2026-05-26 04:45:34'),
(932, 12, '08053', 'Xã Hạ Hòa', 'ha_hoa', '2026-05-26 04:45:34'),
(933, 12, '08071', 'Xã Đan Thượng', 'dan_thuong', '2026-05-26 04:45:34'),
(934, 12, '08110', 'Xã Hiền Lương', 'hien_luong', '2026-05-26 04:45:34'),
(935, 12, '08113', 'Xã Yên Kỳ', 'yen_ky', '2026-05-26 04:45:34'),
(936, 12, '08134', 'Xã Văn Lang', 'van_lang', '2026-05-26 04:45:34'),
(937, 12, '08143', 'Xã Vĩnh Chân', 'vinh_chan', '2026-05-26 04:45:34'),
(938, 12, '08152', 'Xã Thanh Ba', 'thanh_ba', '2026-05-26 04:45:34'),
(939, 12, '08173', 'Xã Quảng Yên', 'quang_yen', '2026-05-26 04:45:34'),
(940, 12, '08203', 'Xã Hoàng Cương', 'hoang_cuong', '2026-05-26 04:45:34'),
(941, 12, '08209', 'Xã Đông Thành', 'dong_thanh', '2026-05-26 04:45:34'),
(942, 12, '08218', 'Xã Chí Tiên', 'chi_tien', '2026-05-26 04:45:34'),
(943, 12, '08227', 'Xã Liên Minh', 'lien_minh', '2026-05-26 04:45:34'),
(944, 12, '08230', 'Xã Phù Ninh', 'phu_ninh', '2026-05-26 04:45:34'),
(945, 12, '08236', 'Xã Phú Mỹ', 'phu_my', '2026-05-26 04:45:34'),
(946, 12, '08245', 'Xã Trạm Thản', 'tram_than', '2026-05-26 04:45:34'),
(947, 12, '08254', 'Xã Dân Chủ', 'dan_chu', '2026-05-26 04:45:34'),
(948, 12, '08275', 'Xã Bình Phú', 'binh_phu', '2026-05-26 04:45:34'),
(949, 12, '08290', 'Xã Yên Lập', 'yen_lap', '2026-05-26 04:45:34'),
(950, 12, '08296', 'Xã Sơn Lương', 'son_luong', '2026-05-26 04:45:34'),
(951, 12, '08305', 'Xã Xuân Viên', 'xuan_vien', '2026-05-26 04:45:34'),
(952, 12, '08311', 'Xã Trung Sơn', 'trung_son', '2026-05-26 04:45:34'),
(953, 12, '08323', 'Xã Thượng Long', 'thuong_long', '2026-05-26 04:45:34'),
(954, 12, '08338', 'Xã Minh Hòa', 'minh_hoa', '2026-05-26 04:45:34'),
(955, 12, '08341', 'Xã Cẩm Khê', 'cam_khe', '2026-05-26 04:45:34'),
(956, 12, '08344', 'Xã Tiên Lương', 'tien_luong', '2026-05-26 04:45:34'),
(957, 12, '08377', 'Xã Vân Bán', 'van_ban', '2026-05-26 04:45:34'),
(958, 12, '08398', 'Xã Phú Khê', 'phu_khe', '2026-05-26 04:45:34'),
(959, 12, '08416', 'Xã Hùng Việt', 'hung_viet', '2026-05-26 04:45:34'),
(960, 12, '08431', 'Xã Đồng Lương', 'dong_luong', '2026-05-26 04:45:34'),
(961, 12, '08434', 'Xã Tam Nông', 'tam_nong', '2026-05-26 04:45:34'),
(962, 12, '08443', 'Xã Hiền Quan', 'hien_quan', '2026-05-26 04:45:34'),
(963, 12, '08467', 'Xã Vạn Xuân', 'van_xuan', '2026-05-26 04:45:34'),
(964, 12, '08479', 'Xã Thọ Văn', 'tho_van', '2026-05-26 04:45:34'),
(965, 12, '08494', 'Xã Lâm Thao', 'lam_thao', '2026-05-26 04:45:34'),
(966, 12, '08500', 'Xã Xuân Lũng', 'xuan_lung', '2026-05-26 04:45:34'),
(967, 12, '08515', 'Xã Hy Cương', 'hy_cuong', '2026-05-26 04:45:34'),
(968, 12, '08521', 'Xã Phùng Nguyên', 'phung_nguyen', '2026-05-26 04:45:34'),
(969, 12, '08527', 'Xã Bản Nguyên', 'ban_nguyen', '2026-05-26 04:45:34'),
(970, 12, '08542', 'Xã Thanh Sơn', 'thanh_son', '2026-05-26 04:45:34'),
(971, 12, '08545', 'Xã Thu Cúc', 'thu_cuc', '2026-05-26 04:45:34'),
(972, 12, '08560', 'Xã Lai Đồng', 'lai_dong', '2026-05-26 04:45:34'),
(973, 12, '08566', 'Xã Tân Sơn', 'tan_son', '2026-05-26 04:45:34'),
(974, 12, '08584', 'Xã Võ Miếu', 'vo_mieu', '2026-05-26 04:45:34'),
(975, 12, '08590', 'Xã Xuân Đài', 'xuan_dai', '2026-05-26 04:45:34'),
(976, 12, '08593', 'Xã Minh Đài', 'minh_dai', '2026-05-26 04:45:34'),
(977, 12, '08611', 'Xã Văn Miếu', 'van_mieu', '2026-05-26 04:45:34'),
(978, 12, '08614', 'Xã Cự Đồng', 'cu_dong', '2026-05-26 04:45:34'),
(979, 12, '08620', 'Xã Long Cốc', 'long_coc', '2026-05-26 04:45:34'),
(980, 12, '08632', 'Xã Hương Cần', 'huong_can', '2026-05-26 04:45:34'),
(981, 12, '08635', 'Xã Khả Cửu', 'kha_cuu', '2026-05-26 04:45:34'),
(982, 12, '08656', 'Xã Yên Sơn', 'yen_son', '2026-05-26 04:45:34'),
(983, 12, '08662', 'Xã Đào Xá', 'dao_xa', '2026-05-26 04:45:34'),
(984, 12, '08674', 'Xã Thanh Thủy', 'thanh_thuy', '2026-05-26 04:45:34'),
(985, 12, '08686', 'Xã Tu Vũ', 'tu_vu', '2026-05-26 04:45:34'),
(986, 12, '08707', 'Phường Vĩnh Yên', 'vinh_yen', '2026-05-26 04:45:34'),
(987, 12, '08716', 'Phường Vĩnh Phúc', 'vinh_phuc', '2026-05-26 04:45:34'),
(988, 12, '08740', 'Phường Phúc Yên', 'phuc_yen', '2026-05-26 04:45:34'),
(989, 12, '08746', 'Phường Xuân Hòa', 'xuan_hoa', '2026-05-26 04:45:34'),
(990, 12, '08761', 'Xã Lập Thạch', 'lap_thach', '2026-05-26 04:45:34'),
(991, 12, '08770', 'Xã Hợp Lý', 'hop_ly', '2026-05-26 04:45:34'),
(992, 12, '08773', 'Xã Yên Lãng', 'yen_lang', '2026-05-26 04:45:34'),
(993, 12, '08782', 'Xã Hải Lựu', 'hai_luu', '2026-05-26 04:45:34'),
(994, 12, '08788', 'Xã Thái Hòa', 'thai_hoa', '2026-05-26 04:45:34'),
(995, 12, '08812', 'Xã Liên Hòa', 'lien_hoa', '2026-05-26 04:45:34'),
(996, 12, '08824', 'Xã Tam Sơn', 'tam_son', '2026-05-26 04:45:34'),
(997, 12, '08842', 'Xã Tiên Lữ', 'tien_lu', '2026-05-26 04:45:34'),
(998, 12, '08848', 'Xã Sông Lô', 'song_lo', '2026-05-26 04:45:34'),
(999, 12, '08866', 'Xã Sơn Đông', 'son_dong', '2026-05-26 04:45:34'),
(1000, 12, '08869', 'Xã Tam Dương', 'tam_duong', '2026-05-26 04:45:34'),
(1001, 12, '08872', 'Xã Tam Dương Bắc', 'tam_duong_bac', '2026-05-26 04:45:34'),
(1002, 12, '08896', 'Xã Hoàng An', 'hoang_an', '2026-05-26 04:45:34'),
(1003, 12, '08905', 'Xã Hội Thịnh', 'hoi_thinh', '2026-05-26 04:45:34'),
(1004, 12, '08911', 'Xã Tam Đảo', 'tam_dao', '2026-05-26 04:45:34'),
(1005, 12, '08914', 'Xã Đạo Trù', 'dao_tru', '2026-05-26 04:45:34'),
(1006, 12, '08923', 'Xã Đại Đình', 'dai_dinh', '2026-05-26 04:45:34'),
(1007, 12, '08935', 'Xã Bình Nguyên', 'binh_nguyen', '2026-05-26 04:45:34'),
(1008, 12, '08944', 'Xã Bình Tuyền', 'binh_tuyen', '2026-05-26 04:45:34'),
(1009, 12, '08950', 'Xã Bình Xuyên', 'binh_xuyen', '2026-05-26 04:45:34'),
(1010, 12, '08971', 'Xã Xuân Lãng', 'xuan_lang', '2026-05-26 04:45:34'),
(1011, 12, '09025', 'Xã Yên Lạc', 'yen_lac', '2026-05-26 04:45:34'),
(1012, 12, '09040', 'Xã Tề Lỗ', 'te_lo', '2026-05-26 04:45:34'),
(1013, 12, '09043', 'Xã Tam Hồng', 'tam_hong', '2026-05-26 04:45:34'),
(1014, 12, '09052', 'Xã Nguyệt Đức', 'nguyet_duc', '2026-05-26 04:45:34'),
(1015, 12, '09064', 'Xã Liên Châu', 'lien_chau', '2026-05-26 04:45:34'),
(1016, 12, '09076', 'Xã Vĩnh Tường', 'vinh_tuong', '2026-05-26 04:45:34'),
(1017, 12, '09079', 'Xã Vĩnh An', 'vinh_an', '2026-05-26 04:45:34'),
(1018, 12, '09100', 'Xã Vĩnh Hưng', 'vinh_hung', '2026-05-26 04:45:34'),
(1019, 12, '09106', 'Xã Vĩnh Thành', 'vinh_thanh', '2026-05-26 04:45:34'),
(1020, 12, '09112', 'Xã Thổ Tang', 'tho_tang', '2026-05-26 04:45:34'),
(1021, 12, '09154', 'Xã Vĩnh Phú', 'vinh_phu', '2026-05-26 04:45:34'),
(1022, 13, '10507', 'Phường Thành Đông', 'thanh_dong', '2026-05-26 04:45:34'),
(1023, 13, '10525', 'Phường Hải Dương', 'hai_duong', '2026-05-26 04:45:34'),
(1024, 13, '10532', 'Phường Lê Thanh Nghị', 'le_thanh_nghi', '2026-05-26 04:45:34'),
(1025, 13, '10537', 'Phường Tân Hưng', 'tan_hung', '2026-05-26 04:45:34'),
(1026, 13, '10543', 'Phường Việt Hòa', 'viet_hoa', '2026-05-26 04:45:34'),
(1027, 13, '10546', 'Phường Chí Linh', 'chi_linh', '2026-05-26 04:45:34'),
(1028, 13, '10549', 'Phường Chu Văn An', 'chu_van_an', '2026-05-26 04:45:34'),
(1029, 13, '10552', 'Phường Nguyễn Trãi', 'nguyen_trai', '2026-05-26 04:45:34'),
(1030, 13, '10570', 'Phường Trần Hưng Đạo', 'tran_hung_dao', '2026-05-26 04:45:34'),
(1031, 13, '10573', 'Phường Trần Nhân Tông', 'tran_nhan_tong', '2026-05-26 04:45:34'),
(1032, 13, '10603', 'Phường Lê Đại Hành', 'le_dai_hanh', '2026-05-26 04:45:34'),
(1033, 13, '10606', 'Xã Nam Sách', 'nam_sach', '2026-05-26 04:45:34'),
(1034, 13, '10615', 'Xã Hợp Tiến', 'hop_tien', '2026-05-26 04:45:34'),
(1035, 13, '10633', 'Xã Trần Phú', 'tran_phu', '2026-05-26 04:45:34'),
(1036, 13, '10642', 'Xã Thái Tân', 'thai_tan', '2026-05-26 04:45:34'),
(1037, 13, '10645', 'Xã An Phú', 'an_phu', '2026-05-26 04:45:34'),
(1038, 13, '10660', 'Phường Ái Quốc', 'ai_quoc', '2026-05-26 04:45:34'),
(1039, 13, '10675', 'Phường Kinh Môn', 'kinh_mon', '2026-05-26 04:45:34'),
(1040, 13, '10678', 'Phường Bắc An Phụ', 'bac_an_phu', '2026-05-26 04:45:34'),
(1041, 13, '10705', 'Xã Nam An Phụ', 'nam_an_phu', '2026-05-26 04:45:34'),
(1042, 13, '10714', 'Phường Nhị Chiểu', 'nhi_chieu', '2026-05-26 04:45:34'),
(1043, 13, '10726', 'Phường Phạm Sư Mạnh', 'pham_su_manh', '2026-05-26 04:45:34'),
(1044, 13, '10729', 'Phường Trần Liễu', 'tran_lieu', '2026-05-26 04:45:34'),
(1045, 13, '10744', 'Phường Nguyễn Đại Năng', 'nguyen_dai_nang', '2026-05-26 04:45:34'),
(1046, 13, '10750', 'Xã Phú Thái', 'phu_thai', '2026-05-26 04:45:34'),
(1047, 13, '10756', 'Xã Lai Khê', 'lai_khe', '2026-05-26 04:45:34'),
(1048, 13, '10792', 'Xã An Thành', 'an_thanh', '2026-05-26 04:45:34'),
(1049, 13, '10804', 'Xã Kim Thành', 'kim_thanh', '2026-05-26 04:45:34'),
(1050, 13, '10813', 'Xã Thanh Hà', 'thanh_ha', '2026-05-26 04:45:34'),
(1051, 13, '10816', 'Xã Hà Bắc', 'ha_bac', '2026-05-26 04:45:34'),
(1052, 13, '10837', 'Phường Nam Đồng', 'nam_dong', '2026-05-26 04:45:34'),
(1053, 13, '10843', 'Xã Hà Nam', 'ha_nam', '2026-05-26 04:45:34'),
(1054, 13, '10846', 'Xã Hà Tây', 'ha_tay', '2026-05-26 04:45:34'),
(1055, 13, '10882', 'Xã Hà Đông', 'ha_dong', '2026-05-26 04:45:34'),
(1056, 13, '10888', 'Xã Cẩm Giang', 'cam_giang', '2026-05-26 04:45:34'),
(1057, 13, '10891', 'Phường Tứ Minh', 'tu_minh', '2026-05-26 04:45:34'),
(1058, 13, '10903', 'Xã Cẩm Giàng', 'cam_giang', '2026-05-26 04:45:34'),
(1059, 13, '10909', 'Xã Tuệ Tĩnh', 'tue_tinh', '2026-05-26 04:45:34'),
(1060, 13, '10930', 'Xã Mao Điền', 'mao_dien', '2026-05-26 04:45:34'),
(1061, 13, '10945', 'Xã Kẻ Sặt', 'ke_sat', '2026-05-26 04:45:34'),
(1062, 13, '10966', 'Xã Bình Giang', 'binh_giang', '2026-05-26 04:45:34'),
(1063, 13, '10972', 'Xã Đường An', 'duong_an', '2026-05-26 04:45:34'),
(1064, 13, '10993', 'Xã Thượng Hồng', 'thuong_hong', '2026-05-26 04:45:34'),
(1065, 13, '10999', 'Xã Gia Lộc', 'gia_loc', '2026-05-26 04:45:34'),
(1066, 13, '11002', 'Phường Thạch Khôi', 'thach_khoi', '2026-05-26 04:45:34'),
(1067, 13, '11020', 'Xã Yết Kiêu', 'yet_kieu', '2026-05-26 04:45:34'),
(1068, 13, '11050', 'Xã Gia Phúc', 'gia_phuc', '2026-05-26 04:45:34'),
(1069, 13, '11065', 'Xã Trường Tân', 'truong_tan', '2026-05-26 04:45:34'),
(1070, 13, '11074', 'Xã Tứ Kỳ', 'tu_ky', '2026-05-26 04:45:34'),
(1071, 13, '11086', 'Xã Đại Sơn', 'dai_son', '2026-05-26 04:45:34'),
(1072, 13, '11113', 'Xã Tân Kỳ', 'tan_ky', '2026-05-26 04:45:34'),
(1073, 13, '11131', 'Xã Chí Minh', 'chi_minh', '2026-05-26 04:45:34'),
(1074, 13, '11140', 'Xã Lạc Phượng', 'lac_phuong', '2026-05-26 04:45:34'),
(1075, 13, '11146', 'Xã Nguyên Giáp', 'nguyen_giap', '2026-05-26 04:45:34'),
(1076, 13, '11164', 'Xã Vĩnh Lại', 'vinh_lai', '2026-05-26 04:45:34'),
(1077, 13, '11167', 'Xã Tân An', 'tan_an', '2026-05-26 04:45:34'),
(1078, 13, '11203', 'Xã Ninh Giang', 'ninh_giang', '2026-05-26 04:45:34'),
(1079, 13, '11218', 'Xã Hồng Châu', 'hong_chau', '2026-05-26 04:45:34'),
(1080, 13, '11224', 'Xã Khúc Thừa Dụ', 'khuc_thua_du', '2026-05-26 04:45:34'),
(1081, 13, '11239', 'Xã Thanh Miện', 'thanh_mien', '2026-05-26 04:45:34'),
(1082, 13, '11242', 'Xã Nguyễn Lương Bằng', 'nguyen_luong_bang', '2026-05-26 04:45:34'),
(1083, 13, '11254', 'Xã Bắc Thanh Miện', 'bac_thanh_mien', '2026-05-26 04:45:34'),
(1084, 13, '11257', 'Xã Hải Hưng', 'hai_hung', '2026-05-26 04:45:34'),
(1085, 13, '11284', 'Xã Nam Thanh Miện', 'nam_thanh_mien', '2026-05-26 04:45:34'),
(1086, 13, '11311', 'Phường Hồng Bàng', 'hong_bang', '2026-05-26 04:45:34'),
(1087, 13, '11329', 'Phường Ngô Quyền', 'ngo_quyen', '2026-05-26 04:45:34'),
(1088, 13, '11359', 'Phường Gia Viên', 'gia_vien', '2026-05-26 04:45:34'),
(1089, 13, '11383', 'Phường Lê Chân', 'le_chan', '2026-05-26 04:45:34'),
(1090, 13, '11407', 'Phường An Biên', 'an_bien', '2026-05-26 04:45:34'),
(1091, 13, '11411', 'Phường Đông Hải', 'dong_hai', '2026-05-26 04:45:34'),
(1092, 13, '11413', 'Phường Hải An', 'hai_an', '2026-05-26 04:45:34'),
(1093, 13, '11443', 'Phường Kiến An', 'kien_an', '2026-05-26 04:45:34'),
(1094, 13, '11446', 'Phường Phù Liễn', 'phu_lien', '2026-05-26 04:45:34'),
(1095, 13, '11455', 'Phường Đồ Sơn', 'do_son', '2026-05-26 04:45:34'),
(1096, 13, '11473', 'Phường Bạch Đằng', 'bach_dang', '2026-05-26 04:45:34'),
(1097, 13, '11488', 'Phường Lưu Kiếm', 'luu_kiem', '2026-05-26 04:45:34'),
(1098, 13, '11503', 'Xã Việt Khê', 'viet_khe', '2026-05-26 04:45:34'),
(1099, 13, '11506', 'Phường Lê Ích Mộc', 'le_ich_moc', '2026-05-26 04:45:34'),
(1100, 13, '11533', 'Phường Hòa Bình', 'hoa_binh', '2026-05-26 04:45:34'),
(1101, 13, '11542', 'Phường Nam Triệu', 'nam_trieu', '2026-05-26 04:45:34'),
(1102, 13, '11557', 'Phường Thiên Hương', 'thien_huong', '2026-05-26 04:45:34'),
(1103, 13, '11560', 'Phường Thủy Nguyên', 'thuy_nguyen', '2026-05-26 04:45:34'),
(1104, 13, '11581', 'Phường An Dương', 'an_duong', '2026-05-26 04:45:34'),
(1105, 13, '11593', 'Phường An Phong', 'an_phong', '2026-05-26 04:45:34'),
(1106, 13, '11602', 'Phường Hồng An', 'hong_an', '2026-05-26 04:45:34'),
(1107, 13, '11617', 'Phường An Hải', 'an_hai', '2026-05-26 04:45:34'),
(1108, 13, '11629', 'Xã An Lão', 'an_lao', '2026-05-26 04:45:34'),
(1109, 13, '11635', 'Xã An Trường', 'an_truong', '2026-05-26 04:45:34'),
(1110, 13, '11647', 'Xã An Quang', 'an_quang', '2026-05-26 04:45:34'),
(1111, 13, '11668', 'Xã An Khánh', 'an_khanh', '2026-05-26 04:45:34'),
(1112, 13, '11674', 'Xã An Hưng', 'an_hung', '2026-05-26 04:45:34'),
(1113, 13, '11680', 'Xã Kiến Thụy', 'kien_thuy', '2026-05-26 04:45:34'),
(1114, 13, '11689', 'Phường Hưng Đạo', 'hung_dao', '2026-05-26 04:45:34'),
(1115, 13, '11692', 'Phường Dương Kinh', 'duong_kinh', '2026-05-26 04:45:34'),
(1116, 13, '11713', 'Xã Nghi Dương', 'nghi_duong', '2026-05-26 04:45:34'),
(1117, 13, '11725', 'Xã Kiến Minh', 'kien_minh', '2026-05-26 04:45:34'),
(1118, 13, '11728', 'Xã Kiến Hưng', 'kien_hung', '2026-05-26 04:45:34'),
(1119, 13, '11737', 'Phường Nam Đồ Sơn', 'nam_do_son', '2026-05-26 04:45:34'),
(1120, 13, '11749', 'Xã Kiến Hải', 'kien_hai', '2026-05-26 04:45:34'),
(1121, 13, '11755', 'Xã Tiên Lãng', 'tien_lang', '2026-05-26 04:45:34'),
(1122, 13, '11761', 'Xã Quyết Thắng', 'quyet_thang', '2026-05-26 04:45:34'),
(1123, 13, '11779', 'Xã Tân Minh', 'tan_minh', '2026-05-26 04:45:34'),
(1124, 13, '11791', 'Xã Tiên Minh', 'tien_minh', '2026-05-26 04:45:34'),
(1125, 13, '11806', 'Xã Chấn Hưng', 'chan_hung', '2026-05-26 04:45:34'),
(1126, 13, '11809', 'Xã Hùng Thắng', 'hung_thang', '2026-05-26 04:45:34'),
(1127, 13, '11824', 'Xã Vĩnh Bảo', 'vinh_bao', '2026-05-26 04:45:34'),
(1128, 13, '11836', 'Xã Vĩnh Thịnh', 'vinh_thinh', '2026-05-26 04:45:34'),
(1129, 13, '11842', 'Xã Vĩnh Thuận', 'vinh_thuan', '2026-05-26 04:45:34'),
(1130, 13, '11848', 'Xã Vĩnh Hòa', 'vinh_hoa', '2026-05-26 04:45:34'),
(1131, 13, '11875', 'Xã Vĩnh Hải', 'vinh_hai', '2026-05-26 04:45:34'),
(1132, 13, '11887', 'Xã Vĩnh Am', 'vinh_am', '2026-05-26 04:45:34'),
(1133, 13, '11911', 'Xã Nguyễn Bỉnh Khiêm', 'nguyen_binh_khiem', '2026-05-26 04:45:34'),
(1134, 13, '11914', 'Đặc khu Cát Hải', 'cat_hai', '2026-05-26 04:45:34'),
(1135, 13, '11948', 'Đặc khu Bạch Long Vĩ', 'bach_long_vi', '2026-05-26 04:45:34'),
(1136, 14, '11953', 'Phường Phố Hiến', 'pho_hien', '2026-05-26 04:45:34'),
(1137, 14, '11977', 'Xã Tân Hưng', 'tan_hung', '2026-05-26 04:45:34'),
(1138, 14, '11980', 'Phường Hồng Châu', 'hong_chau', '2026-05-26 04:45:34'),
(1139, 14, '11983', 'Phường Sơn Nam', 'son_nam', '2026-05-26 04:45:34'),
(1140, 14, '11992', 'Xã Lạc Đạo', 'lac_dao', '2026-05-26 04:45:34'),
(1141, 14, '11995', 'Xã Đại Đồng', 'dai_dong', '2026-05-26 04:45:34'),
(1142, 14, '12004', 'Xã Như Quỳnh', 'nhu_quynh', '2026-05-26 04:45:34'),
(1143, 14, '12019', 'Xã Văn Giang', 'van_giang', '2026-05-26 04:45:34'),
(1144, 14, '12025', 'Xã Phụng Công', 'phung_cong', '2026-05-26 04:45:34'),
(1145, 14, '12031', 'Xã Nghĩa Trụ', 'nghia_tru', '2026-05-26 04:45:34'),
(1146, 14, '12049', 'Xã Mễ Sở', 'me_so', '2026-05-26 04:45:34'),
(1147, 14, '12064', 'Xã Nguyễn Văn Linh', 'nguyen_van_linh', '2026-05-26 04:45:34'),
(1148, 14, '12070', 'Xã Hoàn Long', 'hoan_long', '2026-05-26 04:45:34'),
(1149, 14, '12073', 'Xã Yên Mỹ', 'yen_my', '2026-05-26 04:45:34'),
(1150, 14, '12091', 'Xã Việt Yên', 'viet_yen', '2026-05-26 04:45:34'),
(1151, 14, '12103', 'Phường Mỹ Hào', 'my_hao', '2026-05-26 04:45:34'),
(1152, 14, '12127', 'Phường Thượng Hồng', 'thuong_hong', '2026-05-26 04:45:34'),
(1153, 14, '12133', 'Phường Đường Hào', 'duong_hao', '2026-05-26 04:45:34'),
(1154, 14, '12142', 'Xã Ân Thi', 'an_thi', '2026-05-26 04:45:34'),
(1155, 14, '12148', 'Xã Phạm Ngũ Lão', 'pham_ngu_lao', '2026-05-26 04:45:34'),
(1156, 14, '12166', 'Xã Xuân Trúc', 'xuan_truc', '2026-05-26 04:45:34'),
(1157, 14, '12184', 'Xã Nguyễn Trãi', 'nguyen_trai', '2026-05-26 04:45:34'),
(1158, 14, '12196', 'Xã Hồng Quang', 'hong_quang', '2026-05-26 04:45:34'),
(1159, 14, '12205', 'Xã Khoái Châu', 'khoai_chau', '2026-05-26 04:45:34'),
(1160, 14, '12223', 'Xã Triệu Việt Vương', 'trieu_viet_vuong', '2026-05-26 04:45:34'),
(1161, 14, '12238', 'Xã Việt Tiến', 'viet_tien', '2026-05-26 04:45:34'),
(1162, 14, '12247', 'Xã Châu Ninh', 'chau_ninh', '2026-05-26 04:45:34'),
(1163, 14, '12271', 'Xã Chí Minh', 'chi_minh', '2026-05-26 04:45:34'),
(1164, 14, '12280', 'Xã Lương Bằng', 'luong_bang', '2026-05-26 04:45:34'),
(1165, 14, '12286', 'Xã Nghĩa Dân', 'nghia_dan', '2026-05-26 04:45:34'),
(1166, 14, '12313', 'Xã Đức Hợp', 'duc_hop', '2026-05-26 04:45:34'),
(1167, 14, '12322', 'Xã Hiệp Cường', 'hiep_cuong', '2026-05-26 04:45:34'),
(1168, 14, '12337', 'Xã Hoàng Hoa Thám', 'hoang_hoa_tham', '2026-05-26 04:45:34'),
(1169, 14, '12361', 'Xã Tiên Hoa', 'tien_hoa', '2026-05-26 04:45:34'),
(1170, 14, '12364', 'Xã Tiên Lữ', 'tien_lu', '2026-05-26 04:45:34'),
(1171, 14, '12391', 'Xã Quang Hưng', 'quang_hung', '2026-05-26 04:45:34'),
(1172, 14, '12406', 'Xã Đoàn Đào', 'doan_dao', '2026-05-26 04:45:34'),
(1173, 14, '12424', 'Xã Tiên Tiến', 'tien_tien', '2026-05-26 04:45:34'),
(1174, 14, '12427', 'Xã Tống Trân', 'tong_tran', '2026-05-26 04:45:34'),
(1175, 14, '12452', 'Phường Trần Hưng Đạo', 'tran_hung_dao', '2026-05-26 04:45:34'),
(1176, 14, '12454', 'Phường Trần Lãm', 'tran_lam', '2026-05-26 04:45:34'),
(1177, 14, '12466', 'Phường Vũ Phúc', 'vu_phuc', '2026-05-26 04:45:34'),
(1178, 14, '12472', 'Xã Quỳnh Phụ', 'quynh_phu', '2026-05-26 04:45:34'),
(1179, 14, '12499', 'Xã A Sào', 'a_sao', '2026-05-26 04:45:34'),
(1180, 14, '12511', 'Xã Minh Thọ', 'minh_tho', '2026-05-26 04:45:34'),
(1181, 14, '12517', 'Xã Ngọc Lâm', 'ngoc_lam', '2026-05-26 04:45:34'),
(1182, 14, '12523', 'Xã Phụ Dực', 'phu_duc', '2026-05-26 04:45:34'),
(1183, 14, '12526', 'Xã Đồng Bằng', 'dong_bang', '2026-05-26 04:45:34'),
(1184, 14, '12532', 'Xã Nguyễn Du', 'nguyen_du', '2026-05-26 04:45:34'),
(1185, 14, '12577', 'Xã Quỳnh An', 'quynh_an', '2026-05-26 04:45:34'),
(1186, 14, '12583', 'Xã Tân Tiến', 'tan_tien', '2026-05-26 04:45:34'),
(1187, 14, '12586', 'Xã Hưng Hà', 'hung_ha', '2026-05-26 04:45:34'),
(1188, 14, '12595', 'Xã Ngự Thiên', 'ngu_thien', '2026-05-26 04:45:34'),
(1189, 14, '12613', 'Xã Long Hưng', 'long_hung', '2026-05-26 04:45:34'),
(1190, 14, '12619', 'Xã Diên Hà', 'dien_ha', '2026-05-26 04:45:34'),
(1191, 14, '12631', 'Xã Thần Khê', 'than_khe', '2026-05-26 04:45:34'),
(1192, 14, '12634', 'Xã Tiên La', 'tien_la', '2026-05-26 04:45:34'),
(1193, 14, '12676', 'Xã Lê Quý Đôn', 'le_quy_don', '2026-05-26 04:45:34'),
(1194, 14, '12685', 'Xã Hồng Minh', 'hong_minh', '2026-05-26 04:45:34'),
(1195, 14, '12688', 'Xã Đông Hưng', 'dong_hung', '2026-05-26 04:45:34'),
(1196, 14, '12694', 'Xã Bắc Đông Hưng', 'bac_dong_hung', '2026-05-26 04:45:34'),
(1197, 14, '12700', 'Xã Bắc Tiên Hưng', 'bac_tien_hung', '2026-05-26 04:45:34'),
(1198, 14, '12736', 'Xã Đông Tiên Hưng', 'dong_tien_hung', '2026-05-26 04:45:34'),
(1199, 14, '12745', 'Xã Bắc Đông Quan', 'bac_dong_quan', '2026-05-26 04:45:34'),
(1200, 14, '12754', 'Xã Tiên Hưng', 'tien_hung', '2026-05-26 04:45:34'),
(1201, 14, '12763', 'Xã Nam Tiên Hưng', 'nam_tien_hung', '2026-05-26 04:45:34'),
(1202, 14, '12775', 'Xã Nam Đông Hưng', 'nam_dong_hung', '2026-05-26 04:45:34'),
(1203, 14, '12793', 'Xã Đông Quan', 'dong_quan', '2026-05-26 04:45:34'),
(1204, 14, '12817', 'Phường Trà Lý', 'tra_ly', '2026-05-26 04:45:34'),
(1205, 14, '12826', 'Xã Thái Thụy', 'thai_thuy', '2026-05-26 04:45:34'),
(1206, 14, '12850', 'Xã Tây Thụy Anh', 'tay_thuy_anh', '2026-05-26 04:45:34'),
(1207, 14, '12859', 'Xã Bắc Thụy Anh', 'bac_thuy_anh', '2026-05-26 04:45:34'),
(1208, 14, '12862', 'Xã Đông Thụy Anh', 'dong_thuy_anh', '2026-05-26 04:45:34'),
(1209, 14, '12865', 'Xã Thụy Anh', 'thuy_anh', '2026-05-26 04:45:34'),
(1210, 14, '12904', 'Xã Nam Thụy Anh', 'nam_thuy_anh', '2026-05-26 04:45:34'),
(1211, 14, '12916', 'Xã Bắc Thái Ninh', 'bac_thai_ninh', '2026-05-26 04:45:34'),
(1212, 14, '12919', 'Xã Tây Thái Ninh', 'tay_thai_ninh', '2026-05-26 04:45:34'),
(1213, 14, '12922', 'Xã Thái Ninh', 'thai_ninh', '2026-05-26 04:45:34'),
(1214, 14, '12943', 'Xã Đông Thái Ninh', 'dong_thai_ninh', '2026-05-26 04:45:34'),
(1215, 14, '12961', 'Xã Nam Thái Ninh', 'nam_thai_ninh', '2026-05-26 04:45:34'),
(1216, 14, '12970', 'Xã Tiền Hải', 'tien_hai', '2026-05-26 04:45:34'),
(1217, 14, '12988', 'Xã Đông Tiền Hải', 'dong_tien_hai', '2026-05-26 04:45:34'),
(1218, 14, '13003', 'Xã Đồng Châu', 'dong_chau', '2026-05-26 04:45:34'),
(1219, 14, '13021', 'Xã Ái Quốc', 'ai_quoc', '2026-05-26 04:45:34'),
(1220, 14, '13039', 'Xã Tây Tiền Hải', 'tay_tien_hai', '2026-05-26 04:45:34'),
(1221, 14, '13057', 'Xã Nam Cường', 'nam_cuong', '2026-05-26 04:45:34'),
(1222, 14, '13063', 'Xã Nam Tiền Hải', 'nam_tien_hai', '2026-05-26 04:45:34'),
(1223, 14, '13066', 'Xã Hưng Phú', 'hung_phu', '2026-05-26 04:45:34'),
(1224, 14, '13075', 'Xã Kiến Xương', 'kien_xuong', '2026-05-26 04:45:34'),
(1225, 14, '13093', 'Xã Trà Giang', 'tra_giang', '2026-05-26 04:45:34'),
(1226, 14, '13096', 'Xã Bình Nguyên', 'binh_nguyen', '2026-05-26 04:45:34'),
(1227, 14, '13120', 'Xã Lê Lợi', 'le_loi', '2026-05-26 04:45:34'),
(1228, 14, '13132', 'Xã Quang Lịch', 'quang_lich', '2026-05-26 04:45:34'),
(1229, 14, '13141', 'Xã Vũ Quý', 'vu_quy', '2026-05-26 04:45:34'),
(1230, 14, '13159', 'Xã Hồng Vũ', 'hong_vu', '2026-05-26 04:45:34'),
(1231, 14, '13183', 'Xã Bình Thanh', 'binh_thanh', '2026-05-26 04:45:34'),
(1232, 14, '13186', 'Xã Bình Định', 'binh_dinh', '2026-05-26 04:45:34'),
(1233, 14, '13192', 'Xã Vũ Thư', 'vu_thu', '2026-05-26 04:45:34'),
(1234, 14, '13219', 'Xã Vạn Xuân', 'van_xuan', '2026-05-26 04:45:34'),
(1235, 14, '13222', 'Xã Thư Trì', 'thu_tri', '2026-05-26 04:45:34'),
(1236, 14, '13225', 'Phường Thái Bình', 'thai_binh', '2026-05-26 04:45:34'),
(1237, 14, '13246', 'Xã Tân Thuận', 'tan_thuan', '2026-05-26 04:45:34'),
(1238, 14, '13264', 'Xã Thư Vũ', 'thu_vu', '2026-05-26 04:45:34'),
(1239, 14, '13279', 'Xã Vũ Tiên', 'vu_tien', '2026-05-26 04:45:34'),
(1240, 15, '13285', 'Phường Phủ Lý', 'phu_ly', '2026-05-26 04:45:34'),
(1241, 15, '13291', 'Phường Phù Vân', 'phu_van', '2026-05-26 04:45:34'),
(1242, 15, '13318', 'Phường Châu Sơn', 'chau_son', '2026-05-26 04:45:34'),
(1243, 15, '13324', 'Phường Duy Tiên', 'duy_tien', '2026-05-26 04:45:34'),
(1244, 15, '13330', 'Phường Duy Tân', 'duy_tan', '2026-05-26 04:45:34'),
(1245, 15, '13336', 'Phường Duy Hà', 'duy_ha', '2026-05-26 04:45:34'),
(1246, 15, '13348', 'Phường Đồng Văn', 'dong_van', '2026-05-26 04:45:34'),
(1247, 15, '13363', 'Phường Tiên Sơn', 'tien_son', '2026-05-26 04:45:34'),
(1248, 15, '13366', 'Phường Hà Nam', 'ha_nam', '2026-05-26 04:45:34'),
(1249, 15, '13384', 'Phường Kim Bảng', 'kim_bang', '2026-05-26 04:45:34'),
(1250, 15, '13393', 'Phường Lê Hồ', 'le_ho', '2026-05-26 04:45:34'),
(1251, 15, '13396', 'Phường Nguyễn Uý', 'nguyen_uy', '2026-05-26 04:45:34'),
(1252, 15, '13402', 'Phường Kim Thanh', 'kim_thanh', '2026-05-26 04:45:34'),
(1253, 15, '13420', 'Phường Tam Chúc', 'tam_chuc', '2026-05-26 04:45:34'),
(1254, 15, '13435', 'Phường Lý Thường Kiệt', 'ly_thuong_kiet', '2026-05-26 04:45:34'),
(1255, 15, '13444', 'Phường Liêm Tuyền', 'liem_tuyen', '2026-05-26 04:45:34'),
(1256, 15, '13456', 'Xã Liêm Hà', 'liem_ha', '2026-05-26 04:45:34'),
(1257, 15, '13474', 'Xã Tân Thanh', 'tan_thanh', '2026-05-26 04:45:34'),
(1258, 15, '13483', 'Xã Thanh Bình', 'thanh_binh', '2026-05-26 04:45:34'),
(1259, 15, '13489', 'Xã Thanh Lâm', 'thanh_lam', '2026-05-26 04:45:34'),
(1260, 15, '13495', 'Xã Thanh Liêm', 'thanh_liem', '2026-05-26 04:45:34'),
(1261, 15, '13501', 'Xã Bình Mỹ', 'binh_my', '2026-05-26 04:45:34'),
(1262, 15, '13504', 'Xã Bình Lục', 'binh_luc', '2026-05-26 04:45:34'),
(1263, 15, '13531', 'Xã Bình Giang', 'binh_giang', '2026-05-26 04:45:34'),
(1264, 15, '13540', 'Xã Bình An', 'binh_an', '2026-05-26 04:45:34'),
(1265, 15, '13558', 'Xã Bình Sơn', 'binh_son', '2026-05-26 04:45:34'),
(1266, 15, '13573', 'Xã Lý Nhân', 'ly_nhan', '2026-05-26 04:45:34'),
(1267, 15, '13579', 'Xã Bắc Lý', 'bac_ly', '2026-05-26 04:45:34'),
(1268, 15, '13591', 'Xã Nam Xang', 'nam_xang', '2026-05-26 04:45:34'),
(1269, 15, '13594', 'Xã Trần Thương', 'tran_thuong', '2026-05-26 04:45:34'),
(1270, 15, '13597', 'Xã Vĩnh Trụ', 'vinh_tru', '2026-05-26 04:45:34'),
(1271, 15, '13609', 'Xã Nhân Hà', 'nhan_ha', '2026-05-26 04:45:34'),
(1272, 15, '13627', 'Xã Nam Lý', 'nam_ly', '2026-05-26 04:45:34'),
(1273, 15, '13669', 'Phường Nam Định', 'nam_dinh', '2026-05-26 04:45:34'),
(1274, 15, '13684', 'Phường Thiên Trường', 'thien_truong', '2026-05-26 04:45:34'),
(1275, 15, '13693', 'Phường Đông A', 'dong_a', '2026-05-26 04:45:34'),
(1276, 15, '13699', 'Phường Thành Nam', 'thanh_nam', '2026-05-26 04:45:34'),
(1277, 15, '13708', 'Phường Mỹ Lộc', 'my_loc', '2026-05-26 04:45:34'),
(1278, 15, '13741', 'Xã Vụ Bản', 'vu_ban', '2026-05-26 04:45:34'),
(1279, 15, '13750', 'Xã Minh Tân', 'minh_tan', '2026-05-26 04:45:34'),
(1280, 15, '13753', 'Xã Hiển Khánh', 'hien_khanh', '2026-05-26 04:45:34'),
(1281, 15, '13777', 'Phường Trường Thi', 'truong_thi', '2026-05-26 04:45:34'),
(1282, 15, '13786', 'Xã Liên Minh', 'lien_minh', '2026-05-26 04:45:34'),
(1283, 15, '13795', 'Xã Ý Yên', 'y_yen', '2026-05-26 04:45:34'),
(1284, 15, '13807', 'Xã Tân Minh', 'tan_minh', '2026-05-26 04:45:34'),
(1285, 15, '13822', 'Xã Phong Doanh', 'phong_doanh', '2026-05-26 04:45:34'),
(1286, 15, '13834', 'Xã Vũ Dương', 'vu_duong', '2026-05-26 04:45:34'),
(1287, 15, '13864', 'Xã Vạn Thắng', 'van_thang', '2026-05-26 04:45:34'),
(1288, 15, '13870', 'Xã Yên Cường', 'yen_cuong', '2026-05-26 04:45:34'),
(1289, 15, '13879', 'Xã Yên Đồng', 'yen_dong', '2026-05-26 04:45:34'),
(1290, 15, '13891', 'Xã Nghĩa Hưng', 'nghia_hung', '2026-05-26 04:45:34'),
(1291, 15, '13894', 'Xã Rạng Đông', 'rang_dong', '2026-05-26 04:45:34'),
(1292, 15, '13900', 'Xã Đồng Thịnh', 'dong_thinh', '2026-05-26 04:45:34'),
(1293, 15, '13918', 'Xã Nghĩa Sơn', 'nghia_son', '2026-05-26 04:45:34'),
(1294, 15, '13927', 'Xã Hồng Phong', 'hong_phong', '2026-05-26 04:45:34'),
(1295, 15, '13939', 'Xã Quỹ Nhất', 'quy_nhat', '2026-05-26 04:45:34'),
(1296, 15, '13957', 'Xã Nghĩa Lâm', 'nghia_lam', '2026-05-26 04:45:34'),
(1297, 15, '13966', 'Xã Nam Trực', 'nam_truc', '2026-05-26 04:45:34'),
(1298, 15, '13972', 'Phường Vị Khê', 'vi_khe', '2026-05-26 04:45:34'),
(1299, 15, '13984', 'Phường Hồng Quang', 'hong_quang', '2026-05-26 04:45:34'),
(1300, 15, '13987', 'Xã Nam Hồng', 'nam_hong', '2026-05-26 04:45:34'),
(1301, 15, '14005', 'Xã Nam Ninh', 'nam_ninh', '2026-05-26 04:45:34'),
(1302, 15, '14011', 'Xã Nam Minh', 'nam_minh', '2026-05-26 04:45:34'),
(1303, 15, '14014', 'Xã Nam Đồng', 'nam_dong', '2026-05-26 04:45:34'),
(1304, 15, '14026', 'Xã Cổ Lễ', 'co_le', '2026-05-26 04:45:34'),
(1305, 15, '14038', 'Xã Ninh Giang', 'ninh_giang', '2026-05-26 04:45:34'),
(1306, 15, '14053', 'Xã Trực Ninh', 'truc_ninh', '2026-05-26 04:45:34'),
(1307, 15, '14056', 'Xã Cát Thành', 'cat_thanh', '2026-05-26 04:45:34'),
(1308, 15, '14062', 'Xã Quang Hưng', 'quang_hung', '2026-05-26 04:45:34'),
(1309, 15, '14071', 'Xã Minh Thái', 'minh_thai', '2026-05-26 04:45:34'),
(1310, 15, '14077', 'Xã Ninh Cường', 'ninh_cuong', '2026-05-26 04:45:34'),
(1311, 15, '14089', 'Xã Xuân Trường', 'xuan_truong', '2026-05-26 04:45:34'),
(1312, 15, '14095', 'Xã Xuân Hồng', 'xuan_hong', '2026-05-26 04:45:34'),
(1313, 15, '14104', 'Xã Xuân Giang', 'xuan_giang', '2026-05-26 04:45:34'),
(1314, 15, '14122', 'Xã Xuân Hưng', 'xuan_hung', '2026-05-26 04:45:34'),
(1315, 15, '14161', 'Xã Giao Minh', 'giao_minh', '2026-05-26 04:45:34'),
(1316, 15, '14167', 'Xã Giao Thuỷ', 'giao_thuy', '2026-05-26 04:45:34'),
(1317, 15, '14179', 'Xã Giao Hưng', 'giao_hung', '2026-05-26 04:45:34'),
(1318, 15, '14182', 'Xã Giao Hoà', 'giao_hoa', '2026-05-26 04:45:34'),
(1319, 15, '14194', 'Xã Giao Bình', 'giao_binh', '2026-05-26 04:45:34'),
(1320, 15, '14203', 'Xã Giao Phúc', 'giao_phuc', '2026-05-26 04:45:34'),
(1321, 15, '14212', 'Xã Giao Ninh', 'giao_ninh', '2026-05-26 04:45:34'),
(1322, 15, '14215', 'Xã Hải Hậu', 'hai_hau', '2026-05-26 04:45:34'),
(1323, 15, '14218', 'Xã Hải Tiến', 'hai_tien', '2026-05-26 04:45:34'),
(1324, 15, '14221', 'Xã Hải Thịnh', 'hai_thinh', '2026-05-26 04:45:34'),
(1325, 15, '14236', 'Xã Hải Anh', 'hai_anh', '2026-05-26 04:45:34'),
(1326, 15, '14248', 'Xã Hải Hưng', 'hai_hung', '2026-05-26 04:45:34'),
(1327, 15, '14281', 'Xã Hải An', 'hai_an', '2026-05-26 04:45:34'),
(1328, 15, '14287', 'Xã Hải Quang', 'hai_quang', '2026-05-26 04:45:34'),
(1329, 15, '14308', 'Xã Hải Xuân', 'hai_xuan', '2026-05-26 04:45:34'),
(1330, 15, '14329', 'Phường Hoa Lư', 'hoa_lu', '2026-05-26 04:45:34'),
(1331, 15, '14359', 'Phường Nam Hoa Lư', 'nam_hoa_lu', '2026-05-26 04:45:34'),
(1332, 15, '14362', 'Phường Tam Điệp', 'tam_diep', '2026-05-26 04:45:34'),
(1333, 15, '14365', 'Phường Trung Sơn', 'trung_son', '2026-05-26 04:45:34'),
(1334, 15, '14371', 'Phường Yên Sơn', 'yen_son', '2026-05-26 04:45:34'),
(1335, 15, '14389', 'Xã Gia Lâm', 'gia_lam', '2026-05-26 04:45:34'),
(1336, 15, '14401', 'Xã Gia Tường', 'gia_tuong', '2026-05-26 04:45:34'),
(1337, 15, '14404', 'Xã Cúc Phương', 'cuc_phuong', '2026-05-26 04:45:34'),
(1338, 15, '14407', 'Xã Phú Sơn', 'phu_son', '2026-05-26 04:45:34'),
(1339, 15, '14428', 'Xã Nho Quan', 'nho_quan', '2026-05-26 04:45:34'),
(1340, 15, '14434', 'Xã Thanh Sơn', 'thanh_son', '2026-05-26 04:45:34'),
(1341, 15, '14452', 'Xã Quỳnh Lưu', 'quynh_luu', '2026-05-26 04:45:34'),
(1342, 15, '14458', 'Xã Phú Long', 'phu_long', '2026-05-26 04:45:34'),
(1343, 15, '14464', 'Xã Gia Viễn', 'gia_vien', '2026-05-26 04:45:34'),
(1344, 15, '14482', 'Xã Gia Hưng', 'gia_hung', '2026-05-26 04:45:34'),
(1345, 15, '14488', 'Xã Gia Vân', 'gia_van', '2026-05-26 04:45:34'),
(1346, 15, '14494', 'Xã Gia Trấn', 'gia_tran', '2026-05-26 04:45:34'),
(1347, 15, '14500', 'Xã Đại Hoàng', 'dai_hoang', '2026-05-26 04:45:34'),
(1348, 15, '14524', 'Xã Gia Phong', 'gia_phong', '2026-05-26 04:45:34'),
(1349, 15, '14533', 'Phường Tây Hoa Lư', 'tay_hoa_lu', '2026-05-26 04:45:34'),
(1350, 15, '14560', 'Xã Yên Khánh', 'yen_khanh', '2026-05-26 04:45:34'),
(1351, 15, '14563', 'Xã Khánh Thiện', 'khanh_thien', '2026-05-26 04:45:34'),
(1352, 15, '14566', 'Phường Đông Hoa Lư', 'dong_hoa_lu', '2026-05-26 04:45:34'),
(1353, 15, '14608', 'Xã Khánh Trung', 'khanh_trung', '2026-05-26 04:45:34'),
(1354, 15, '14611', 'Xã Khánh Nhạc', 'khanh_nhac', '2026-05-26 04:45:34'),
(1355, 15, '14614', 'Xã Khánh Hội', 'khanh_hoi', '2026-05-26 04:45:34'),
(1356, 15, '14620', 'Xã Phát Diệm', 'phat_diem', '2026-05-26 04:45:34'),
(1357, 15, '14623', 'Xã Bình Minh', 'binh_minh', '2026-05-26 04:45:34'),
(1358, 15, '14638', 'Xã Kim Sơn', 'kim_son', '2026-05-26 04:45:34'),
(1359, 15, '14647', 'Xã Quang Thiện', 'quang_thien', '2026-05-26 04:45:34'),
(1360, 15, '14653', 'Xã Chất Bình', 'chat_binh', '2026-05-26 04:45:34'),
(1361, 15, '14674', 'Xã Lai Thành', 'lai_thanh', '2026-05-26 04:45:34'),
(1362, 15, '14677', 'Xã Định Hóa', 'dinh_hoa', '2026-05-26 04:45:34'),
(1363, 15, '14698', 'Xã Kim Đông', 'kim_dong', '2026-05-26 04:45:34'),
(1364, 15, '14701', 'Xã Yên Mô', 'yen_mo', '2026-05-26 04:45:34'),
(1365, 15, '14725', 'Phường Yên Thắng', 'yen_thang', '2026-05-26 04:45:34'),
(1366, 15, '14728', 'Xã Yên Từ', 'yen_tu', '2026-05-26 04:45:34'),
(1367, 15, '14743', 'Xã Yên Mạc', 'yen_mac', '2026-05-26 04:45:34'),
(1368, 15, '14746', 'Xã Đồng Thái', 'dong_thai', '2026-05-26 04:45:34'),
(1369, 16, '14758', 'Phường Hàm Rồng', 'ham_rong', '2026-05-26 04:45:34'),
(1370, 16, '14797', 'Phường Hạc Thành', 'hac_thanh', '2026-05-26 04:45:34'),
(1371, 16, '14812', 'Phường Bỉm Sơn', 'bim_son', '2026-05-26 04:45:34'),
(1372, 16, '14818', 'Phường Quang Trung', 'quang_trung', '2026-05-26 04:45:34'),
(1373, 16, '14845', 'Xã Mường Lát', 'muong_lat', '2026-05-26 04:45:34'),
(1374, 16, '14848', 'Xã Tam Chung', 'tam_chung', '2026-05-26 04:45:34'),
(1375, 16, '14854', 'Xã Mường Lý', 'muong_ly', '2026-05-26 04:45:34'),
(1376, 16, '14857', 'Xã Trung Lý', 'trung_ly', '2026-05-26 04:45:34'),
(1377, 16, '14860', 'Xã Quang Chiểu', 'quang_chieu', '2026-05-26 04:45:34'),
(1378, 16, '14863', 'Xã Pù Nhi', 'pu_nhi', '2026-05-26 04:45:34'),
(1379, 16, '14864', 'Xã Nhi Sơn', 'nhi_son', '2026-05-26 04:45:34'),
(1380, 16, '14866', 'Xã Mường Chanh', 'muong_chanh', '2026-05-26 04:45:34'),
(1381, 16, '14869', 'Xã Hồi Xuân', 'hoi_xuan', '2026-05-26 04:45:34'),
(1382, 16, '14872', 'Xã Trung Thành', 'trung_thanh', '2026-05-26 04:45:34'),
(1383, 16, '14875', 'Xã Trung Sơn', 'trung_son', '2026-05-26 04:45:34'),
(1384, 16, '14878', 'Xã Phú Lệ', 'phu_le', '2026-05-26 04:45:34'),
(1385, 16, '14890', 'Xã Phú Xuân', 'phu_xuan', '2026-05-26 04:45:34'),
(1386, 16, '14896', 'Xã Hiền Kiệt', 'hien_kiet', '2026-05-26 04:45:34'),
(1387, 16, '14902', 'Xã Nam Xuân', 'nam_xuan', '2026-05-26 04:45:34'),
(1388, 16, '14908', 'Xã Thiên Phủ', 'thien_phu', '2026-05-26 04:45:34'),
(1389, 16, '14923', 'Xã Bá Thước', 'ba_thuoc', '2026-05-26 04:45:34'),
(1390, 16, '14932', 'Xã Điền Quang', 'dien_quang', '2026-05-26 04:45:34'),
(1391, 16, '14950', 'Xã Điền Lư', 'dien_lu', '2026-05-26 04:45:34'),
(1392, 16, '14953', 'Xã Quý Lương', 'quy_luong', '2026-05-26 04:45:34'),
(1393, 16, '14956', 'Xã Pù Luông', 'pu_luong', '2026-05-26 04:45:34'),
(1394, 16, '14959', 'Xã Cổ Lũng', 'co_lung', '2026-05-26 04:45:34'),
(1395, 16, '14974', 'Xã Văn Nho', 'van_nho', '2026-05-26 04:45:34'),
(1396, 16, '14980', 'Xã Thiết Ống', 'thiet_ong', '2026-05-26 04:45:34'),
(1397, 16, '15001', 'Xã Trung Hạ', 'trung_ha', '2026-05-26 04:45:34'),
(1398, 16, '15007', 'Xã Tam Thanh', 'tam_thanh', '2026-05-26 04:45:34'),
(1399, 16, '15010', 'Xã Sơn Thủy', 'son_thuy', '2026-05-26 04:45:34'),
(1400, 16, '15013', 'Xã Na Mèo', 'na_meo', '2026-05-26 04:45:34'),
(1401, 16, '15016', 'Xã Quan Sơn', 'quan_son', '2026-05-26 04:45:34'),
(1402, 16, '15019', 'Xã Tam Lư', 'tam_lu', '2026-05-26 04:45:34'),
(1403, 16, '15022', 'Xã Sơn Điện', 'son_dien', '2026-05-26 04:45:34'),
(1404, 16, '15025', 'Xã Mường Mìn', 'muong_min', '2026-05-26 04:45:34'),
(1405, 16, '15031', 'Xã Yên Khương', 'yen_khuong', '2026-05-26 04:45:34'),
(1406, 16, '15034', 'Xã Yên Thắng', 'yen_thang', '2026-05-26 04:45:34'),
(1407, 16, '15043', 'Xã Giao An', 'giao_an', '2026-05-26 04:45:34'),
(1408, 16, '15049', 'Xã Văn Phú', 'van_phu', '2026-05-26 04:45:34'),
(1409, 16, '15055', 'Xã Linh Sơn', 'linh_son', '2026-05-26 04:45:34'),
(1410, 16, '15058', 'Xã Đồng Lương', 'dong_luong', '2026-05-26 04:45:34'),
(1411, 16, '15061', 'Xã Ngọc Lặc', 'ngoc_lac', '2026-05-26 04:45:34'),
(1412, 16, '15085', 'Xã Thạch Lập', 'thach_lap', '2026-05-26 04:45:34'),
(1413, 16, '15091', 'Xã Ngọc Liên', 'ngoc_lien', '2026-05-26 04:45:34'),
(1414, 16, '15106', 'Xã Nguyệt Ấn', 'nguyet_an', '2026-05-26 04:45:34'),
(1415, 16, '15112', 'Xã Kiên Thọ', 'kien_tho', '2026-05-26 04:45:34'),
(1416, 16, '15124', 'Xã Minh Sơn', 'minh_son', '2026-05-26 04:45:34'),
(1417, 16, '15127', 'Xã Cẩm Thủy', 'cam_thuy', '2026-05-26 04:45:34'),
(1418, 16, '15142', 'Xã Cẩm Thạch', 'cam_thach', '2026-05-26 04:45:34'),
(1419, 16, '15148', 'Xã Cẩm Tú', 'cam_tu', '2026-05-26 04:45:34'),
(1420, 16, '15163', 'Xã Cẩm Vân', 'cam_van', '2026-05-26 04:45:34'),
(1421, 16, '15178', 'Xã Cẩm Tân', 'cam_tan', '2026-05-26 04:45:34'),
(1422, 16, '15187', 'Xã Kim Tân', 'kim_tan', '2026-05-26 04:45:34'),
(1423, 16, '15190', 'Xã Vân Du', 'van_du', '2026-05-26 04:45:34'),
(1424, 16, '15199', 'Xã Thạch Quảng', 'thach_quang', '2026-05-26 04:45:34'),
(1425, 16, '15211', 'Xã Thạch Bình', 'thach_binh', '2026-05-26 04:45:34'),
(1426, 16, '15229', 'Xã Thành Vinh', 'thanh_vinh', '2026-05-26 04:45:34'),
(1427, 16, '15250', 'Xã Ngọc Trạo', 'ngoc_trao', '2026-05-26 04:45:34'),
(1428, 16, '15271', 'Xã Hà Trung', 'ha_trung', '2026-05-26 04:45:34'),
(1429, 16, '15274', 'Xã Hà Long', 'ha_long', '2026-05-26 04:45:34'),
(1430, 16, '15286', 'Xã Hoạt Giang', 'hoat_giang', '2026-05-26 04:45:34'),
(1431, 16, '15298', 'Xã Lĩnh Toại', 'linh_toai', '2026-05-26 04:45:34'),
(1432, 16, '15316', 'Xã Tống Sơn', 'tong_son', '2026-05-26 04:45:34'),
(1433, 16, '15349', 'Xã Vĩnh Lộc', 'vinh_loc', '2026-05-26 04:45:34'),
(1434, 16, '15361', 'Xã Tây Đô', 'tay_do', '2026-05-26 04:45:34'),
(1435, 16, '15382', 'Xã Biện Thượng', 'bien_thuong', '2026-05-26 04:45:34'),
(1436, 16, '15409', 'Xã Yên Phú', 'yen_phu', '2026-05-26 04:45:34'),
(1437, 16, '15412', 'Xã Quý Lộc', 'quy_loc', '2026-05-26 04:45:34'),
(1438, 16, '15421', 'Xã Yên Trường', 'yen_truong', '2026-05-26 04:45:34');
INSERT INTO `hicrm_district` (`id`, `province_id`, `district_code`, `district_name`, `district_keyword`, `created_at`) VALUES
(1439, 16, '15442', 'Xã Yên Ninh', 'yen_ninh', '2026-05-26 04:45:34'),
(1440, 16, '15448', 'Xã Định Hòa', 'dinh_hoa', '2026-05-26 04:45:34'),
(1441, 16, '15457', 'Xã Định Tân', 'dinh_tan', '2026-05-26 04:45:34'),
(1442, 16, '15469', 'Xã Yên Định', 'yen_dinh', '2026-05-26 04:45:34'),
(1443, 16, '15499', 'Xã Thọ Xuân', 'tho_xuan', '2026-05-26 04:45:34'),
(1444, 16, '15505', 'Xã Thọ Long', 'tho_long', '2026-05-26 04:45:34'),
(1445, 16, '15520', 'Xã Xuân Hòa', 'xuan_hoa', '2026-05-26 04:45:34'),
(1446, 16, '15544', 'Xã Lam Sơn', 'lam_son', '2026-05-26 04:45:34'),
(1447, 16, '15553', 'Xã Sao Vàng', 'sao_vang', '2026-05-26 04:45:34'),
(1448, 16, '15568', 'Xã Thọ Lập', 'tho_lap', '2026-05-26 04:45:34'),
(1449, 16, '15574', 'Xã Xuân Tín', 'xuan_tin', '2026-05-26 04:45:34'),
(1450, 16, '15592', 'Xã Xuân Lập', 'xuan_lap', '2026-05-26 04:45:34'),
(1451, 16, '15607', 'Xã Bát Mọt', 'bat_mot', '2026-05-26 04:45:34'),
(1452, 16, '15610', 'Xã Yên Nhân', 'yen_nhan', '2026-05-26 04:45:34'),
(1453, 16, '15622', 'Xã Vạn Xuân', 'van_xuan', '2026-05-26 04:45:34'),
(1454, 16, '15628', 'Xã Lương Sơn', 'luong_son', '2026-05-26 04:45:34'),
(1455, 16, '15634', 'Xã Luận Thành', 'luan_thanh', '2026-05-26 04:45:34'),
(1456, 16, '15643', 'Xã Thắng Lộc', 'thang_loc', '2026-05-26 04:45:34'),
(1457, 16, '15646', 'Xã Thường Xuân', 'thuong_xuan', '2026-05-26 04:45:34'),
(1458, 16, '15658', 'Xã Xuân Chinh', 'xuan_chinh', '2026-05-26 04:45:34'),
(1459, 16, '15661', 'Xã Tân Thành', 'tan_thanh', '2026-05-26 04:45:34'),
(1460, 16, '15664', 'Xã Triệu Sơn', 'trieu_son', '2026-05-26 04:45:34'),
(1461, 16, '15667', 'Xã Thọ Bình', 'tho_binh', '2026-05-26 04:45:34'),
(1462, 16, '15682', 'Xã Hợp Tiến', 'hop_tien', '2026-05-26 04:45:34'),
(1463, 16, '15715', 'Xã Tân Ninh', 'tan_ninh', '2026-05-26 04:45:34'),
(1464, 16, '15724', 'Xã Đồng Tiến', 'dong_tien', '2026-05-26 04:45:34'),
(1465, 16, '15754', 'Xã Thọ Ngọc', 'tho_ngoc', '2026-05-26 04:45:34'),
(1466, 16, '15763', 'Xã Thọ Phú', 'tho_phu', '2026-05-26 04:45:34'),
(1467, 16, '15766', 'Xã An Nông', 'an_nong', '2026-05-26 04:45:34'),
(1468, 16, '15772', 'Xã Thiệu Hóa', 'thieu_hoa', '2026-05-26 04:45:34'),
(1469, 16, '15778', 'Xã Thiệu Tiến', 'thieu_tien', '2026-05-26 04:45:34'),
(1470, 16, '15796', 'Xã Thiệu Quang', 'thieu_quang', '2026-05-26 04:45:34'),
(1471, 16, '15820', 'Xã Thiệu Toán', 'thieu_toan', '2026-05-26 04:45:34'),
(1472, 16, '15835', 'Xã Thiệu Trung', 'thieu_trung', '2026-05-26 04:45:34'),
(1473, 16, '15853', 'Phường Đông Tiến', 'dong_tien', '2026-05-26 04:45:34'),
(1474, 16, '15865', 'Xã Hoằng Hóa', 'hoang_hoa', '2026-05-26 04:45:34'),
(1475, 16, '15880', 'Xã Hoằng Giang', 'hoang_giang', '2026-05-26 04:45:34'),
(1476, 16, '15889', 'Xã Hoằng Phú', 'hoang_phu', '2026-05-26 04:45:34'),
(1477, 16, '15910', 'Xã Hoằng Sơn', 'hoang_son', '2026-05-26 04:45:34'),
(1478, 16, '15925', 'Phường Nguyệt Viên', 'nguyet_vien', '2026-05-26 04:45:34'),
(1479, 16, '15961', 'Xã Hoằng Lộc', 'hoang_loc', '2026-05-26 04:45:34'),
(1480, 16, '15976', 'Xã Hoằng Châu', 'hoang_chau', '2026-05-26 04:45:34'),
(1481, 16, '15991', 'Xã Hoằng Tiến', 'hoang_tien', '2026-05-26 04:45:34'),
(1482, 16, '16000', 'Xã Hoằng Thanh', 'hoang_thanh', '2026-05-26 04:45:34'),
(1483, 16, '16012', 'Xã Hậu Lộc', 'hau_loc', '2026-05-26 04:45:34'),
(1484, 16, '16021', 'Xã Triệu Lộc', 'trieu_loc', '2026-05-26 04:45:34'),
(1485, 16, '16033', 'Xã Đông Thành', 'dong_thanh', '2026-05-26 04:45:34'),
(1486, 16, '16072', 'Xã Hoa Lộc', 'hoa_loc', '2026-05-26 04:45:34'),
(1487, 16, '16078', 'Xã Vạn Lộc', 'van_loc', '2026-05-26 04:45:34'),
(1488, 16, '16093', 'Xã Nga Sơn', 'nga_son', '2026-05-26 04:45:34'),
(1489, 16, '16108', 'Xã Tân Tiến', 'tan_tien', '2026-05-26 04:45:34'),
(1490, 16, '16114', 'Xã Nga Thắng', 'nga_thang', '2026-05-26 04:45:34'),
(1491, 16, '16138', 'Xã Hồ Vương', 'ho_vuong', '2026-05-26 04:45:34'),
(1492, 16, '16144', 'Xã Nga An', 'nga_an', '2026-05-26 04:45:34'),
(1493, 16, '16171', 'Xã Ba Đình', 'ba_dinh', '2026-05-26 04:45:34'),
(1494, 16, '16174', 'Xã Như Xuân', 'nhu_xuan', '2026-05-26 04:45:34'),
(1495, 16, '16177', 'Xã Xuân Bình', 'xuan_binh', '2026-05-26 04:45:34'),
(1496, 16, '16186', 'Xã Hóa Quỳ', 'hoa_quy', '2026-05-26 04:45:34'),
(1497, 16, '16213', 'Xã Thanh Phong', 'thanh_phong', '2026-05-26 04:45:34'),
(1498, 16, '16222', 'Xã Thanh Quân', 'thanh_quan', '2026-05-26 04:45:34'),
(1499, 16, '16225', 'Xã Thượng Ninh', 'thuong_ninh', '2026-05-26 04:45:34'),
(1500, 16, '16228', 'Xã Như Thanh', 'nhu_thanh', '2026-05-26 04:45:34'),
(1501, 16, '16234', 'Xã Xuân Du', 'xuan_du', '2026-05-26 04:45:34'),
(1502, 16, '16249', 'Xã Mậu Lâm', 'mau_lam', '2026-05-26 04:45:34'),
(1503, 16, '16258', 'Xã Xuân Thái', 'xuan_thai', '2026-05-26 04:45:34'),
(1504, 16, '16264', 'Xã Yên Thọ', 'yen_tho', '2026-05-26 04:45:34'),
(1505, 16, '16273', 'Xã Thanh Kỳ', 'thanh_ky', '2026-05-26 04:45:34'),
(1506, 16, '16279', 'Xã Nông Cống', 'nong_cong', '2026-05-26 04:45:34'),
(1507, 16, '16297', 'Xã Trung Chính', 'trung_chinh', '2026-05-26 04:45:34'),
(1508, 16, '16309', 'Xã Thắng Lợi', 'thang_loi', '2026-05-26 04:45:34'),
(1509, 16, '16342', 'Xã Thăng Bình', 'thang_binh', '2026-05-26 04:45:34'),
(1510, 16, '16348', 'Xã Trường Văn', 'truong_van', '2026-05-26 04:45:34'),
(1511, 16, '16363', 'Xã Tượng Lĩnh', 'tuong_linh', '2026-05-26 04:45:34'),
(1512, 16, '16369', 'Xã Công Chính', 'cong_chinh', '2026-05-26 04:45:34'),
(1513, 16, '16378', 'Phường Đông Sơn', 'dong_son', '2026-05-26 04:45:34'),
(1514, 16, '16417', 'Phường Đông Quang', 'dong_quang', '2026-05-26 04:45:34'),
(1515, 16, '16438', 'Xã Lưu Vệ', 'luu_ve', '2026-05-26 04:45:34'),
(1516, 16, '16480', 'Xã Quảng Yên', 'quang_yen', '2026-05-26 04:45:34'),
(1517, 16, '16489', 'Xã Quảng Chính', 'quang_chinh', '2026-05-26 04:45:34'),
(1518, 16, '16498', 'Xã Quảng Ngọc', 'quang_ngoc', '2026-05-26 04:45:34'),
(1519, 16, '16516', 'Phường Nam Sầm Sơn', 'nam_sam_son', '2026-05-26 04:45:34'),
(1520, 16, '16522', 'Phường Quảng Phú', 'quang_phu', '2026-05-26 04:45:34'),
(1521, 16, '16531', 'Phường Sầm Sơn', 'sam_son', '2026-05-26 04:45:34'),
(1522, 16, '16540', 'Xã Quảng Ninh', 'quang_ninh', '2026-05-26 04:45:34'),
(1523, 16, '16543', 'Xã Quảng Bình', 'quang_binh', '2026-05-26 04:45:34'),
(1524, 16, '16549', 'Xã Tiên Trang', 'tien_trang', '2026-05-26 04:45:34'),
(1525, 16, '16561', 'Phường Tĩnh Gia', 'tinh_gia', '2026-05-26 04:45:34'),
(1526, 16, '16576', 'Phường Ngọc Sơn', 'ngoc_son', '2026-05-26 04:45:34'),
(1527, 16, '16591', 'Xã Các Sơn', 'cac_son', '2026-05-26 04:45:34'),
(1528, 16, '16594', 'Phường Tân Dân', 'tan_dan', '2026-05-26 04:45:34'),
(1529, 16, '16597', 'Phường Hải Lĩnh', 'hai_linh', '2026-05-26 04:45:34'),
(1530, 16, '16609', 'Phường Đào Duy Từ', 'dao_duy_tu', '2026-05-26 04:45:34'),
(1531, 16, '16624', 'Phường Trúc Lâm', 'truc_lam', '2026-05-26 04:45:34'),
(1532, 16, '16636', 'Xã Trường Lâm', 'truong_lam', '2026-05-26 04:45:34'),
(1533, 16, '16645', 'Phường Hải Bình', 'hai_binh', '2026-05-26 04:45:34'),
(1534, 16, '16654', 'Phường Nghi Sơn', 'nghi_son', '2026-05-26 04:45:34'),
(1535, 17, '16681', 'Phường Thành Vinh', 'thanh_vinh', '2026-05-26 04:45:34'),
(1536, 17, '16690', 'Phường Trường Vinh', 'truong_vinh', '2026-05-26 04:45:34'),
(1537, 17, '16702', 'Phường Vinh Phú', 'vinh_phu', '2026-05-26 04:45:34'),
(1538, 17, '16708', 'Phường Vinh Lộc', 'vinh_loc', '2026-05-26 04:45:34'),
(1539, 17, '16732', 'Phường Cửa Lò', 'cua_lo', '2026-05-26 04:45:34'),
(1540, 17, '16738', 'Xã Quế Phong', 'que_phong', '2026-05-26 04:45:34'),
(1541, 17, '16744', 'Xã Thông Thụ', 'thong_thu', '2026-05-26 04:45:34'),
(1542, 17, '16750', 'Xã Tiền Phong', 'tien_phong', '2026-05-26 04:45:34'),
(1543, 17, '16756', 'Xã Tri Lễ', 'tri_le', '2026-05-26 04:45:34'),
(1544, 17, '16774', 'Xã Mường Quàng', 'muong_quang', '2026-05-26 04:45:34'),
(1545, 17, '16777', 'Xã Quỳ Châu', 'quy_chau', '2026-05-26 04:45:34'),
(1546, 17, '16792', 'Xã Châu Tiến', 'chau_tien', '2026-05-26 04:45:34'),
(1547, 17, '16801', 'Xã Hùng Chân', 'hung_chan', '2026-05-26 04:45:34'),
(1548, 17, '16804', 'Xã Châu Bình', 'chau_binh', '2026-05-26 04:45:34'),
(1549, 17, '16813', 'Xã Mường Xén', 'muong_xen', '2026-05-26 04:45:34'),
(1550, 17, '16816', 'Xã Mỹ Lý', 'my_ly', '2026-05-26 04:45:34'),
(1551, 17, '16819', 'Xã Bắc Lý', 'bac_ly', '2026-05-26 04:45:34'),
(1552, 17, '16822', 'Xã Keng Đu', 'keng_du', '2026-05-26 04:45:34'),
(1553, 17, '16828', 'Xã Huồi Tụ', 'huoi_tu', '2026-05-26 04:45:34'),
(1554, 17, '16831', 'Xã Mường Lống', 'muong_long', '2026-05-26 04:45:34'),
(1555, 17, '16834', 'Xã Na Loi', 'na_loi', '2026-05-26 04:45:34'),
(1556, 17, '16837', 'Xã Nậm Cắn', 'nam_can', '2026-05-26 04:45:34'),
(1557, 17, '16849', 'Xã Hữu Kiệm', 'huu_kiem', '2026-05-26 04:45:34'),
(1558, 17, '16855', 'Xã Chiêu Lưu', 'chieu_luu', '2026-05-26 04:45:34'),
(1559, 17, '16858', 'Xã Mường Típ', 'muong_tip', '2026-05-26 04:45:34'),
(1560, 17, '16870', 'Xã Na Ngoi', 'na_ngoi', '2026-05-26 04:45:34'),
(1561, 17, '16876', 'Xã Tương Dương', 'tuong_duong', '2026-05-26 04:45:34'),
(1562, 17, '16882', 'Xã Nhôn Mai', 'nhon_mai', '2026-05-26 04:45:34'),
(1563, 17, '16885', 'Xã Hữu Khuông', 'huu_khuong', '2026-05-26 04:45:34'),
(1564, 17, '16903', 'Xã Nga My', 'nga_my', '2026-05-26 04:45:34'),
(1565, 17, '16906', 'Xã Lượng Minh', 'luong_minh', '2026-05-26 04:45:34'),
(1566, 17, '16909', 'Xã Yên Hòa', 'yen_hoa', '2026-05-26 04:45:34'),
(1567, 17, '16912', 'Xã Yên Na', 'yen_na', '2026-05-26 04:45:34'),
(1568, 17, '16933', 'Xã Tam Quang', 'tam_quang', '2026-05-26 04:45:34'),
(1569, 17, '16936', 'Xã Tam Thái', 'tam_thai', '2026-05-26 04:45:34'),
(1570, 17, '16939', 'Phường Thái Hòa', 'thai_hoa', '2026-05-26 04:45:34'),
(1571, 17, '16941', 'Xã Nghĩa Đàn', 'nghia_dan', '2026-05-26 04:45:34'),
(1572, 17, '16951', 'Xã Nghĩa Lâm', 'nghia_lam', '2026-05-26 04:45:34'),
(1573, 17, '16969', 'Xã Nghĩa Thọ', 'nghia_tho', '2026-05-26 04:45:34'),
(1574, 17, '16972', 'Xã Nghĩa Hưng', 'nghia_hung', '2026-05-26 04:45:34'),
(1575, 17, '16975', 'Xã Nghĩa Mai', 'nghia_mai', '2026-05-26 04:45:34'),
(1576, 17, '17011', 'Phường Tây Hiếu', 'tay_hieu', '2026-05-26 04:45:34'),
(1577, 17, '17017', 'Xã Đông Hiếu', 'dong_hieu', '2026-05-26 04:45:34'),
(1578, 17, '17029', 'Xã Nghĩa Lộc', 'nghia_loc', '2026-05-26 04:45:34'),
(1579, 17, '17032', 'Xã Nghĩa Khánh', 'nghia_khanh', '2026-05-26 04:45:34'),
(1580, 17, '17035', 'Xã Quỳ Hợp', 'quy_hop', '2026-05-26 04:45:34'),
(1581, 17, '17044', 'Xã Châu Hồng', 'chau_hong', '2026-05-26 04:45:34'),
(1582, 17, '17056', 'Xã Châu Lộc', 'chau_loc', '2026-05-26 04:45:34'),
(1583, 17, '17059', 'Xã Tam Hợp', 'tam_hop', '2026-05-26 04:45:34'),
(1584, 17, '17071', 'Xã Minh Hợp', 'minh_hop', '2026-05-26 04:45:34'),
(1585, 17, '17077', 'Xã Mường Ham', 'muong_ham', '2026-05-26 04:45:34'),
(1586, 17, '17089', 'Xã Mường Chọng', 'muong_chong', '2026-05-26 04:45:34'),
(1587, 17, '17110', 'Phường Hoàng Mai', 'hoang_mai', '2026-05-26 04:45:34'),
(1588, 17, '17125', 'Phường Quỳnh Mai', 'quynh_mai', '2026-05-26 04:45:34'),
(1589, 17, '17128', 'Phường Tân Mai', 'tan_mai', '2026-05-26 04:45:34'),
(1590, 17, '17143', 'Xã Quỳnh Văn', 'quynh_van', '2026-05-26 04:45:34'),
(1591, 17, '17149', 'Xã Quỳnh Tam', 'quynh_tam', '2026-05-26 04:45:34'),
(1592, 17, '17170', 'Xã Quỳnh Sơn', 'quynh_son', '2026-05-26 04:45:34'),
(1593, 17, '17176', 'Xã Quỳnh Anh', 'quynh_anh', '2026-05-26 04:45:34'),
(1594, 17, '17179', 'Xã Quỳnh Lưu', 'quynh_luu', '2026-05-26 04:45:34'),
(1595, 17, '17212', 'Xã Quỳnh Phú', 'quynh_phu', '2026-05-26 04:45:34'),
(1596, 17, '17224', 'Xã Quỳnh Thắng', 'quynh_thang', '2026-05-26 04:45:34'),
(1597, 17, '17230', 'Xã Bình Chuẩn', 'binh_chuan', '2026-05-26 04:45:34'),
(1598, 17, '17239', 'Xã Mậu Thạch', 'mau_thach', '2026-05-26 04:45:34'),
(1599, 17, '17242', 'Xã Cam Phục', 'cam_phuc', '2026-05-26 04:45:34'),
(1600, 17, '17248', 'Xã Châu Khê', 'chau_khe', '2026-05-26 04:45:34'),
(1601, 17, '17254', 'Xã Con Cuông', 'con_cuong', '2026-05-26 04:45:34'),
(1602, 17, '17263', 'Xã Môn Sơn', 'mon_son', '2026-05-26 04:45:34'),
(1603, 17, '17266', 'Xã Tân Kỳ', 'tan_ky', '2026-05-26 04:45:34'),
(1604, 17, '17272', 'Xã Tân Phú', 'tan_phu', '2026-05-26 04:45:34'),
(1605, 17, '17278', 'Xã Giai Xuân', 'giai_xuan', '2026-05-26 04:45:34'),
(1606, 17, '17284', 'Xã Nghĩa Đồng', 'nghia_dong', '2026-05-26 04:45:34'),
(1607, 17, '17287', 'Xã Tiên Đồng', 'tien_dong', '2026-05-26 04:45:34'),
(1608, 17, '17305', 'Xã Tân An', 'tan_an', '2026-05-26 04:45:34'),
(1609, 17, '17326', 'Xã Nghĩa Hành', 'nghia_hanh', '2026-05-26 04:45:34'),
(1610, 17, '17329', 'Xã Anh Sơn', 'anh_son', '2026-05-26 04:45:34'),
(1611, 17, '17335', 'Xã Thành Bình Thọ', 'thanh_binh_tho', '2026-05-26 04:45:34'),
(1612, 17, '17344', 'Xã Nhân Hòa', 'nhan_hoa', '2026-05-26 04:45:34'),
(1613, 17, '17357', 'Xã Vĩnh Tường', 'vinh_tuong', '2026-05-26 04:45:34'),
(1614, 17, '17365', 'Xã Anh Sơn Đông', 'anh_son_dong', '2026-05-26 04:45:34'),
(1615, 17, '17380', 'Xã Yên Xuân', 'yen_xuan', '2026-05-26 04:45:34'),
(1616, 17, '17395', 'Xã Hùng Châu', 'hung_chau', '2026-05-26 04:45:34'),
(1617, 17, '17416', 'Xã Đức Châu', 'duc_chau', '2026-05-26 04:45:34'),
(1618, 17, '17419', 'Xã Hải Châu', 'hai_chau', '2026-05-26 04:45:34'),
(1619, 17, '17443', 'Xã Quảng Châu', 'quang_chau', '2026-05-26 04:45:34'),
(1620, 17, '17464', 'Xã Diễn Châu', 'dien_chau', '2026-05-26 04:45:34'),
(1621, 17, '17476', 'Xã Minh Châu', 'minh_chau', '2026-05-26 04:45:34'),
(1622, 17, '17479', 'Xã An Châu', 'an_chau', '2026-05-26 04:45:34'),
(1623, 17, '17488', 'Xã Tân Châu', 'tan_chau', '2026-05-26 04:45:34'),
(1624, 17, '17506', 'Xã Yên Thành', 'yen_thanh', '2026-05-26 04:45:34'),
(1625, 17, '17515', 'Xã Bình Minh', 'binh_minh', '2026-05-26 04:45:34'),
(1626, 17, '17521', 'Xã Quang Đồng', 'quang_dong', '2026-05-26 04:45:34'),
(1627, 17, '17524', 'Xã Giai Lạc', 'giai_lac', '2026-05-26 04:45:34'),
(1628, 17, '17530', 'Xã Đông Thành', 'dong_thanh', '2026-05-26 04:45:34'),
(1629, 17, '17560', 'Xã Vân Du', 'van_du', '2026-05-26 04:45:34'),
(1630, 17, '17569', 'Xã Quan Thành', 'quan_thanh', '2026-05-26 04:45:34'),
(1631, 17, '17605', 'Xã Hợp Minh', 'hop_minh', '2026-05-26 04:45:34'),
(1632, 17, '17611', 'Xã Vân Tụ', 'van_tu', '2026-05-26 04:45:34'),
(1633, 17, '17623', 'Xã Bạch Ngọc', 'bach_ngoc', '2026-05-26 04:45:34'),
(1634, 17, '17641', 'Xã Lương Sơn', 'luong_son', '2026-05-26 04:45:34'),
(1635, 17, '17662', 'Xã Đô Lương', 'do_luong', '2026-05-26 04:45:34'),
(1636, 17, '17677', 'Xã Văn Hiến', 'van_hien', '2026-05-26 04:45:34'),
(1637, 17, '17689', 'Xã Thuần Trung', 'thuan_trung', '2026-05-26 04:45:34'),
(1638, 17, '17707', 'Xã Bạch Hà', 'bach_ha', '2026-05-26 04:45:34'),
(1639, 17, '17713', 'Xã Đại Đồng', 'dai_dong', '2026-05-26 04:45:34'),
(1640, 17, '17722', 'Xã Hạnh Lâm', 'hanh_lam', '2026-05-26 04:45:34'),
(1641, 17, '17728', 'Xã Cát Ngạn', 'cat_ngan', '2026-05-26 04:45:34'),
(1642, 17, '17743', 'Xã Tam Đồng', 'tam_dong', '2026-05-26 04:45:34'),
(1643, 17, '17759', 'Xã Sơn Lâm', 'son_lam', '2026-05-26 04:45:34'),
(1644, 17, '17770', 'Xã Hoa Quân', 'hoa_quan', '2026-05-26 04:45:34'),
(1645, 17, '17779', 'Xã Xuân Lâm', 'xuan_lam', '2026-05-26 04:45:34'),
(1646, 17, '17791', 'Xã Kim Bảng', 'kim_bang', '2026-05-26 04:45:34'),
(1647, 17, '17818', 'Xã Bích Hào', 'bich_hao', '2026-05-26 04:45:34'),
(1648, 17, '17827', 'Xã Nghi Lộc', 'nghi_loc', '2026-05-26 04:45:34'),
(1649, 17, '17833', 'Xã Hải Lộc', 'hai_loc', '2026-05-26 04:45:34'),
(1650, 17, '17842', 'Xã Thần Lĩnh', 'than_linh', '2026-05-26 04:45:34'),
(1651, 17, '17854', 'Xã Văn Kiều', 'van_kieu', '2026-05-26 04:45:34'),
(1652, 17, '17857', 'Xã Phúc Lộc', 'phuc_loc', '2026-05-26 04:45:34'),
(1653, 17, '17866', 'Xã Trung Lộc', 'trung_loc', '2026-05-26 04:45:34'),
(1654, 17, '17878', 'Xã Đông Lộc', 'dong_loc', '2026-05-26 04:45:34'),
(1655, 17, '17920', 'Phường Vinh Hưng', 'vinh_hung', '2026-05-26 04:45:34'),
(1656, 17, '17935', 'Xã Nam Đàn', 'nam_dan', '2026-05-26 04:45:34'),
(1657, 17, '17944', 'Xã Đại Huệ', 'dai_hue', '2026-05-26 04:45:34'),
(1658, 17, '17950', 'Xã Vạn An', 'van_an', '2026-05-26 04:45:34'),
(1659, 17, '17971', 'Xã Kim Liên', 'kim_lien', '2026-05-26 04:45:34'),
(1660, 17, '17989', 'Xã Thiên Nhẫn', 'thien_nhan', '2026-05-26 04:45:34'),
(1661, 17, '18001', 'Xã Hưng Nguyên', 'hung_nguyen', '2026-05-26 04:45:34'),
(1662, 17, '18007', 'Xã Yên Trung', 'yen_trung', '2026-05-26 04:45:34'),
(1663, 17, '18028', 'Xã Hưng Nguyên Nam', 'hung_nguyen_nam', '2026-05-26 04:45:34'),
(1664, 17, '18040', 'Xã Lam Thành', 'lam_thanh', '2026-05-26 04:45:34'),
(1665, 18, '18073', 'Phường Thành Sen', 'thanh_sen', '2026-05-26 04:45:34'),
(1666, 18, '18100', 'Phường Trần Phú', 'tran_phu', '2026-05-26 04:45:34'),
(1667, 18, '18115', 'Phường Bắc Hồng Lĩnh', 'bac_hong_linh', '2026-05-26 04:45:34'),
(1668, 18, '18118', 'Phường Nam Hồng Lĩnh', 'nam_hong_linh', '2026-05-26 04:45:34'),
(1669, 18, '18133', 'Xã Hương Sơn', 'huong_son', '2026-05-26 04:45:34'),
(1670, 18, '18160', 'Xã Sơn Hồng', 'son_hong', '2026-05-26 04:45:34'),
(1671, 18, '18163', 'Xã Sơn Tiến', 'son_tien', '2026-05-26 04:45:34'),
(1672, 18, '18172', 'Xã Sơn Tây', 'son_tay', '2026-05-26 04:45:34'),
(1673, 18, '18184', 'Xã Sơn Giang', 'son_giang', '2026-05-26 04:45:34'),
(1674, 18, '18196', 'Xã Sơn Kim 1', 'son_kim_1', '2026-05-26 04:45:34'),
(1675, 18, '18199', 'Xã Sơn Kim 2', 'son_kim_2', '2026-05-26 04:45:34'),
(1676, 18, '18202', 'Xã Tứ Mỹ', 'tu_my', '2026-05-26 04:45:34'),
(1677, 18, '18223', 'Xã Kim Hoa', 'kim_hoa', '2026-05-26 04:45:34'),
(1678, 18, '18229', 'Xã Đức Thọ', 'duc_tho', '2026-05-26 04:45:34'),
(1679, 18, '18244', 'Xã Đức Minh', 'duc_minh', '2026-05-26 04:45:34'),
(1680, 18, '18262', 'Xã Đức Quang', 'duc_quang', '2026-05-26 04:45:34'),
(1681, 18, '18277', 'Xã Đức Thịnh', 'duc_thinh', '2026-05-26 04:45:34'),
(1682, 18, '18304', 'Xã Đức Đồng', 'duc_dong', '2026-05-26 04:45:34'),
(1683, 18, '18313', 'Xã Vũ Quang', 'vu_quang', '2026-05-26 04:45:34'),
(1684, 18, '18322', 'Xã Mai Hoa', 'mai_hoa', '2026-05-26 04:45:34'),
(1685, 18, '18328', 'Xã Thượng Đức', 'thuong_duc', '2026-05-26 04:45:34'),
(1686, 18, '18352', 'Xã Nghi Xuân', 'nghi_xuan', '2026-05-26 04:45:34'),
(1687, 18, '18364', 'Xã Đan Hải', 'dan_hai', '2026-05-26 04:45:34'),
(1688, 18, '18373', 'Xã Tiên Điền', 'tien_dien', '2026-05-26 04:45:34'),
(1689, 18, '18394', 'Xã Cổ Đạm', 'co_dam', '2026-05-26 04:45:34'),
(1690, 18, '18406', 'Xã Can Lộc', 'can_loc', '2026-05-26 04:45:34'),
(1691, 18, '18409', 'Xã Hồng Lộc', 'hong_loc', '2026-05-26 04:45:34'),
(1692, 18, '18418', 'Xã Tùng Lộc', 'tung_loc', '2026-05-26 04:45:34'),
(1693, 18, '18436', 'Xã Trường Lưu', 'truong_luu', '2026-05-26 04:45:34'),
(1694, 18, '18466', 'Xã Gia Hanh', 'gia_hanh', '2026-05-26 04:45:34'),
(1695, 18, '18481', 'Xã Xuân Lộc', 'xuan_loc', '2026-05-26 04:45:34'),
(1696, 18, '18484', 'Xã Đồng Lộc', 'dong_loc', '2026-05-26 04:45:34'),
(1697, 18, '18496', 'Xã Hương Khê', 'huong_khe', '2026-05-26 04:45:34'),
(1698, 18, '18502', 'Xã Hà Linh', 'ha_linh', '2026-05-26 04:45:34'),
(1699, 18, '18523', 'Xã Hương Bình', 'huong_binh', '2026-05-26 04:45:34'),
(1700, 18, '18532', 'Xã Hương Phố', 'huong_pho', '2026-05-26 04:45:34'),
(1701, 18, '18544', 'Xã Hương Xuân', 'huong_xuan', '2026-05-26 04:45:34'),
(1702, 18, '18547', 'Xã Phúc Trạch', 'phuc_trach', '2026-05-26 04:45:34'),
(1703, 18, '18550', 'Xã Hương Đô', 'huong_do', '2026-05-26 04:45:34'),
(1704, 18, '18562', 'Xã Thạch Hà', 'thach_ha', '2026-05-26 04:45:34'),
(1705, 18, '18568', 'Xã Lộc Hà', 'loc_ha', '2026-05-26 04:45:34'),
(1706, 18, '18583', 'Xã Mai Phụ', 'mai_phu', '2026-05-26 04:45:34'),
(1707, 18, '18586', 'Xã Đông Kinh', 'dong_kinh', '2026-05-26 04:45:34'),
(1708, 18, '18601', 'Xã Việt Xuyên', 'viet_xuyen', '2026-05-26 04:45:34'),
(1709, 18, '18604', 'Xã Thạch Khê', 'thach_khe', '2026-05-26 04:45:34'),
(1710, 18, '18619', 'Xã Đồng Tiến', 'dong_tien', '2026-05-26 04:45:34'),
(1711, 18, '18628', 'Xã Thạch Lạc', 'thach_lac', '2026-05-26 04:45:34'),
(1712, 18, '18634', 'Xã Toàn Lưu', 'toan_luu', '2026-05-26 04:45:34'),
(1713, 18, '18652', 'Phường Hà Huy Tập', 'ha_huy_tap', '2026-05-26 04:45:34'),
(1714, 18, '18667', 'Xã Thạch Xuân', 'thach_xuan', '2026-05-26 04:45:34'),
(1715, 18, '18673', 'Xã Cẩm Xuyên', 'cam_xuyen', '2026-05-26 04:45:34'),
(1716, 18, '18676', 'Xã Thiên Cầm', 'thien_cam', '2026-05-26 04:45:34'),
(1717, 18, '18682', 'Xã Yên Hòa', 'yen_hoa', '2026-05-26 04:45:34'),
(1718, 18, '18685', 'Xã Cẩm Bình', 'cam_binh', '2026-05-26 04:45:34'),
(1719, 18, '18736', 'Xã Cẩm Hưng', 'cam_hung', '2026-05-26 04:45:34'),
(1720, 18, '18739', 'Xã Cẩm Duệ', 'cam_due', '2026-05-26 04:45:34'),
(1721, 18, '18742', 'Xã Cẩm Trung', 'cam_trung', '2026-05-26 04:45:34'),
(1722, 18, '18748', 'Xã Cẩm Lạc', 'cam_lac', '2026-05-26 04:45:34'),
(1723, 18, '18754', 'Phường Sông Trí', 'song_tri', '2026-05-26 04:45:34'),
(1724, 18, '18766', 'Xã Kỳ Xuân', 'ky_xuan', '2026-05-26 04:45:34'),
(1725, 18, '18775', 'Xã Kỳ Anh', 'ky_anh', '2026-05-26 04:45:34'),
(1726, 18, '18781', 'Phường Hải Ninh', 'hai_ninh', '2026-05-26 04:45:34'),
(1727, 18, '18787', 'Xã Kỳ Văn', 'ky_van', '2026-05-26 04:45:34'),
(1728, 18, '18790', 'Xã Kỳ Khang', 'ky_khang', '2026-05-26 04:45:34'),
(1729, 18, '18814', 'Xã Kỳ Hoa', 'ky_hoa', '2026-05-26 04:45:34'),
(1730, 18, '18823', 'Phường Vũng Áng', 'vung_ang', '2026-05-26 04:45:34'),
(1731, 18, '18832', 'Phường Hoành Sơn', 'hoanh_son', '2026-05-26 04:45:34'),
(1732, 18, '18838', 'Xã Kỳ Lạc', 'ky_lac', '2026-05-26 04:45:34'),
(1733, 18, '18844', 'Xã Kỳ Thượng', 'ky_thuong', '2026-05-26 04:45:34'),
(1734, 19, '18859', 'Phường Đồng Thuận', 'dong_thuan', '2026-05-26 04:45:34'),
(1735, 19, '18871', 'Phường Đồng Sơn', 'dong_son', '2026-05-26 04:45:34'),
(1736, 19, '18880', 'Phường Đồng Hới', 'dong_hoi', '2026-05-26 04:45:34'),
(1737, 19, '18901', 'Xã Minh Hóa', 'minh_hoa', '2026-05-26 04:45:34'),
(1738, 19, '18904', 'Xã Dân Hóa', 'dan_hoa', '2026-05-26 04:45:34'),
(1739, 19, '18919', 'Xã Tân Thành', 'tan_thanh', '2026-05-26 04:45:34'),
(1740, 19, '18922', 'Xã Kim Điền', 'kim_dien', '2026-05-26 04:45:34'),
(1741, 19, '18943', 'Xã Kim Phú', 'kim_phu', '2026-05-26 04:45:34'),
(1742, 19, '18949', 'Xã Đồng Lê', 'dong_le', '2026-05-26 04:45:34'),
(1743, 19, '18952', 'Xã Tuyên Sơn', 'tuyen_son', '2026-05-26 04:45:34'),
(1744, 19, '18958', 'Xã Tuyên Lâm', 'tuyen_lam', '2026-05-26 04:45:34'),
(1745, 19, '18985', 'Xã Tuyên Phú', 'tuyen_phu', '2026-05-26 04:45:34'),
(1746, 19, '18991', 'Xã Tuyên Bình', 'tuyen_binh', '2026-05-26 04:45:34'),
(1747, 19, '18997', 'Xã Tuyên Hóa', 'tuyen_hoa', '2026-05-26 04:45:34'),
(1748, 19, '19009', 'Phường Ba Đồn', 'ba_don', '2026-05-26 04:45:34'),
(1749, 19, '19021', 'Xã Phú Trạch', 'phu_trach', '2026-05-26 04:45:34'),
(1750, 19, '19030', 'Xã Trung Thuần', 'trung_thuan', '2026-05-26 04:45:34'),
(1751, 19, '19033', 'Xã Hòa Trạch', 'hoa_trach', '2026-05-26 04:45:34'),
(1752, 19, '19051', 'Xã Tân Gianh', 'tan_gianh', '2026-05-26 04:45:34'),
(1753, 19, '19057', 'Xã Quảng Trạch', 'quang_trach', '2026-05-26 04:45:34'),
(1754, 19, '19066', 'Phường Bắc Gianh', 'bac_gianh', '2026-05-26 04:45:34'),
(1755, 19, '19075', 'Xã Nam Ba Đồn', 'nam_ba_don', '2026-05-26 04:45:34'),
(1756, 19, '19093', 'Xã Nam Gianh', 'nam_gianh', '2026-05-26 04:45:34'),
(1757, 19, '19111', 'Xã Hoàn Lão', 'hoan_lao', '2026-05-26 04:45:34'),
(1758, 19, '19126', 'Xã Bắc Trạch', 'bac_trach', '2026-05-26 04:45:34'),
(1759, 19, '19138', 'Xã Phong Nha', 'phong_nha', '2026-05-26 04:45:34'),
(1760, 19, '19141', 'Xã Bố Trạch', 'bo_trach', '2026-05-26 04:45:34'),
(1761, 19, '19147', 'Xã Thượng Trạch', 'thuong_trach', '2026-05-26 04:45:34'),
(1762, 19, '19159', 'Xã Đông Trạch', 'dong_trach', '2026-05-26 04:45:34'),
(1763, 19, '19198', 'Xã Nam Trạch', 'nam_trach', '2026-05-26 04:45:34'),
(1764, 19, '19204', 'Xã Trường Sơn', 'truong_son', '2026-05-26 04:45:34'),
(1765, 19, '19207', 'Xã Quảng Ninh', 'quang_ninh', '2026-05-26 04:45:34'),
(1766, 19, '19225', 'Xã Ninh Châu', 'ninh_chau', '2026-05-26 04:45:34'),
(1767, 19, '19237', 'Xã Trường Ninh', 'truong_ninh', '2026-05-26 04:45:34'),
(1768, 19, '19246', 'Xã Lệ Ninh', 'le_ninh', '2026-05-26 04:45:34'),
(1769, 19, '19249', 'Xã Lệ Thủy', 'le_thuy', '2026-05-26 04:45:34'),
(1770, 19, '19255', 'Xã Cam Hồng', 'cam_hong', '2026-05-26 04:45:34'),
(1771, 19, '19288', 'Xã Sen Ngư', 'sen_ngu', '2026-05-26 04:45:34'),
(1772, 19, '19291', 'Xã Tân Mỹ', 'tan_my', '2026-05-26 04:45:34'),
(1773, 19, '19309', 'Xã Trường Phú', 'truong_phu', '2026-05-26 04:45:34'),
(1774, 19, '19318', 'Xã Kim Ngân', 'kim_ngan', '2026-05-26 04:45:34'),
(1775, 19, '19333', 'Phường Đông Hà', 'dong_ha', '2026-05-26 04:45:34'),
(1776, 19, '19351', 'Phường Nam Đông Hà', 'nam_dong_ha', '2026-05-26 04:45:34'),
(1777, 19, '19360', 'Phường Quảng Trị', 'quang_tri', '2026-05-26 04:45:34'),
(1778, 19, '19363', 'Xã Vĩnh Linh', 'vinh_linh', '2026-05-26 04:45:34'),
(1779, 19, '19366', 'Xã Bến Quan', 'ben_quan', '2026-05-26 04:45:34'),
(1780, 19, '19372', 'Xã Vĩnh Hoàng', 'vinh_hoang', '2026-05-26 04:45:34'),
(1781, 19, '19405', 'Xã Vĩnh Thủy', 'vinh_thuy', '2026-05-26 04:45:34'),
(1782, 19, '19414', 'Xã Cửa Tùng', 'cua_tung', '2026-05-26 04:45:34'),
(1783, 19, '19429', 'Xã Khe Sanh', 'khe_sanh', '2026-05-26 04:45:34'),
(1784, 19, '19432', 'Xã Lao Bảo', 'lao_bao', '2026-05-26 04:45:34'),
(1785, 19, '19435', 'Xã Hướng Lập', 'huong_lap', '2026-05-26 04:45:34'),
(1786, 19, '19441', 'Xã Hướng Phùng', 'huong_phung', '2026-05-26 04:45:34'),
(1787, 19, '19462', 'Xã Tân Lập', 'tan_lap', '2026-05-26 04:45:34'),
(1788, 19, '19483', 'Xã A Dơi', 'a_doi', '2026-05-26 04:45:34'),
(1789, 19, '19489', 'Xã Lìa', 'lia', '2026-05-26 04:45:34'),
(1790, 19, '19495', 'Xã Gio Linh', 'gio_linh', '2026-05-26 04:45:34'),
(1791, 19, '19496', 'Xã Cửa Việt', 'cua_viet', '2026-05-26 04:45:34'),
(1792, 19, '19501', 'Xã Bến Hải', 'ben_hai', '2026-05-26 04:45:34'),
(1793, 19, '19537', 'Xã Cồn Tiên', 'con_tien', '2026-05-26 04:45:34'),
(1794, 19, '19555', 'Xã Hướng Hiệp', 'huong_hiep', '2026-05-26 04:45:34'),
(1795, 19, '19564', 'Xã Đakrông', 'dakrong', '2026-05-26 04:45:34'),
(1796, 19, '19567', 'Xã Ba Lòng', 'ba_long', '2026-05-26 04:45:34'),
(1797, 19, '19588', 'Xã Tà Rụt', 'ta_rut', '2026-05-26 04:45:34'),
(1798, 19, '19594', 'Xã La Lay', 'la_lay', '2026-05-26 04:45:34'),
(1799, 19, '19597', 'Xã Cam Lộ', 'cam_lo', '2026-05-26 04:45:34'),
(1800, 19, '19603', 'Xã Hiếu Giang', 'hieu_giang', '2026-05-26 04:45:34'),
(1801, 19, '19624', 'Xã Triệu Phong', 'trieu_phong', '2026-05-26 04:45:34'),
(1802, 19, '19639', 'Xã Nam Cửa Việt', 'nam_cua_viet', '2026-05-26 04:45:34'),
(1803, 19, '19645', 'Xã Triệu Bình', 'trieu_binh', '2026-05-26 04:45:34'),
(1804, 19, '19654', 'Xã Triệu Cơ', 'trieu_co', '2026-05-26 04:45:34'),
(1805, 19, '19669', 'Xã Ái Tử', 'ai_tu', '2026-05-26 04:45:34'),
(1806, 19, '19681', 'Xã Diên Sanh', 'dien_sanh', '2026-05-26 04:45:34'),
(1807, 19, '19699', 'Xã Vĩnh Định', 'vinh_dinh', '2026-05-26 04:45:34'),
(1808, 19, '19702', 'Xã Hải Lăng', 'hai_lang', '2026-05-26 04:45:34'),
(1809, 19, '19735', 'Xã Nam Hải Lăng', 'nam_hai_lang', '2026-05-26 04:45:34'),
(1810, 19, '19741', 'Xã Mỹ Thủy', 'my_thuy', '2026-05-26 04:45:34'),
(1811, 19, '19742', 'Đặc khu Cồn Cỏ', 'con_co', '2026-05-26 04:45:34'),
(1812, 20, '19753', 'Phường Phú Xuân', 'phu_xuan', '2026-05-26 04:45:34'),
(1813, 20, '19774', 'Phường Kim Long', 'kim_long', '2026-05-26 04:45:34'),
(1814, 20, '19777', 'Phường Vỹ Dạ', 'vy_da', '2026-05-26 04:45:34'),
(1815, 20, '19789', 'Phường Thuận Hóa', 'thuan_hoa', '2026-05-26 04:45:34'),
(1816, 20, '19804', 'Phường Hương An', 'huong_an', '2026-05-26 04:45:34'),
(1817, 20, '19813', 'Phường Thủy Xuân', 'thuy_xuan', '2026-05-26 04:45:34'),
(1818, 20, '19815', 'Phường An Cựu', 'an_cuu', '2026-05-26 04:45:34'),
(1819, 20, '19819', 'Phường Phong Điền', 'phong_dien', '2026-05-26 04:45:34'),
(1820, 20, '19828', 'Phường Phong Phú', 'phong_phu', '2026-05-26 04:45:34'),
(1821, 20, '19831', 'Phường Phong Dinh', 'phong_dinh', '2026-05-26 04:45:34'),
(1822, 20, '19858', 'Phường Phong Thái', 'phong_thai', '2026-05-26 04:45:34'),
(1823, 20, '19867', 'Xã Quảng Điền', 'quang_dien', '2026-05-26 04:45:34'),
(1824, 20, '19873', 'Phường Phong Quảng', 'phong_quang', '2026-05-26 04:45:34'),
(1825, 20, '19885', 'Xã Đan Điền', 'dan_dien', '2026-05-26 04:45:34'),
(1826, 20, '19900', 'Phường Thuận An', 'thuan_an', '2026-05-26 04:45:34'),
(1827, 20, '19909', 'Phường Dương Nỗ', 'duong_no', '2026-05-26 04:45:34'),
(1828, 20, '19918', 'Xã Phú Hồ', 'phu_ho', '2026-05-26 04:45:34'),
(1829, 20, '19930', 'Phường Mỹ Thượng', 'my_thuong', '2026-05-26 04:45:34'),
(1830, 20, '19942', 'Xã Phú Vang', 'phu_vang', '2026-05-26 04:45:34'),
(1831, 20, '19945', 'Xã Phú Vinh', 'phu_vinh', '2026-05-26 04:45:34'),
(1832, 20, '19960', 'Phường Phú Bài', 'phu_bai', '2026-05-26 04:45:34'),
(1833, 20, '19969', 'Phường Thanh Thủy', 'thanh_thuy', '2026-05-26 04:45:34'),
(1834, 20, '19975', 'Phường Hương Thủy', 'huong_thuy', '2026-05-26 04:45:34'),
(1835, 20, '19996', 'Phường Hương Trà', 'huong_tra', '2026-05-26 04:45:34'),
(1836, 20, '20014', 'Phường Hóa Châu', 'hoa_chau', '2026-05-26 04:45:34'),
(1837, 20, '20017', 'Phường Kim Trà', 'kim_tra', '2026-05-26 04:45:34'),
(1838, 20, '20035', 'Xã Bình Điền', 'binh_dien', '2026-05-26 04:45:34'),
(1839, 20, '20044', 'Xã A Lưới 2', 'a_luoi_2', '2026-05-26 04:45:34'),
(1840, 20, '20050', 'Xã A Lưới 5', 'a_luoi_5', '2026-05-26 04:45:34'),
(1841, 20, '20056', 'Xã A Lưới 1', 'a_luoi_1', '2026-05-26 04:45:34'),
(1842, 20, '20071', 'Xã A Lưới 3', 'a_luoi_3', '2026-05-26 04:45:34'),
(1843, 20, '20101', 'Xã A Lưới 4', 'a_luoi_4', '2026-05-26 04:45:34'),
(1844, 20, '20107', 'Xã Phú Lộc', 'phu_loc', '2026-05-26 04:45:34'),
(1845, 20, '20122', 'Xã Vinh Lộc', 'vinh_loc', '2026-05-26 04:45:34'),
(1846, 20, '20131', 'Xã Hưng Lộc', 'hung_loc', '2026-05-26 04:45:34'),
(1847, 20, '20137', 'Xã Chân Mây - Lăng Cô', 'chan_may_lang_co', '2026-05-26 04:45:34'),
(1848, 20, '20140', 'Xã Lộc An', 'loc_an', '2026-05-26 04:45:34'),
(1849, 20, '20161', 'Xã Khe Tre', 'khe_tre', '2026-05-26 04:45:34'),
(1850, 20, '20179', 'Xã Nam Đông', 'nam_dong', '2026-05-26 04:45:34'),
(1851, 20, '20182', 'Xã Long Quảng', 'long_quang', '2026-05-26 04:45:34'),
(1852, 21, '20194', 'Phường Hải Vân', 'hai_van', '2026-05-26 04:45:34'),
(1853, 21, '20197', 'Phường Liên Chiểu', 'lien_chieu', '2026-05-26 04:45:34'),
(1854, 21, '20200', 'Phường Hòa Khánh', 'hoa_khanh', '2026-05-26 04:45:34'),
(1855, 21, '20209', 'Phường Thanh Khê', 'thanh_khe', '2026-05-26 04:45:34'),
(1856, 21, '20242', 'Phường Hải Châu', 'hai_chau', '2026-05-26 04:45:34'),
(1857, 21, '20257', 'Phường Hòa Cường', 'hoa_cuong', '2026-05-26 04:45:34'),
(1858, 21, '20260', 'Phường Cẩm Lệ', 'cam_le', '2026-05-26 04:45:34'),
(1859, 21, '20263', 'Phường Sơn Trà', 'son_tra', '2026-05-26 04:45:34'),
(1860, 21, '20275', 'Phường An Hải', 'an_hai', '2026-05-26 04:45:34'),
(1861, 21, '20285', 'Phường Ngũ Hành Sơn', 'ngu_hanh_son', '2026-05-26 04:45:34'),
(1862, 21, '20305', 'Phường An Khê', 'an_khe', '2026-05-26 04:45:34'),
(1863, 21, '20308', 'Xã Bà Nà', 'ba_na', '2026-05-26 04:45:34'),
(1864, 21, '20314', 'Phường Hòa Xuân', 'hoa_xuan', '2026-05-26 04:45:34'),
(1865, 21, '20320', 'Xã Hòa Vang', 'hoa_vang', '2026-05-26 04:45:34'),
(1866, 21, '20332', 'Xã Hòa Tiến', 'hoa_tien', '2026-05-26 04:45:34'),
(1867, 21, '20333', 'Đặc khu Hoàng Sa', 'hoang_sa', '2026-05-26 04:45:34'),
(1868, 21, '20335', 'Phường Bàn Thạch', 'ban_thach', '2026-05-26 04:45:34'),
(1869, 21, '20341', 'Phường Tam Kỳ', 'tam_ky', '2026-05-26 04:45:34'),
(1870, 21, '20350', 'Phường Hương Trà', 'huong_tra', '2026-05-26 04:45:34'),
(1871, 21, '20356', 'Phường Quảng Phú', 'quang_phu', '2026-05-26 04:45:34'),
(1872, 21, '20364', 'Xã Chiên Đàn', 'chien_dan', '2026-05-26 04:45:34'),
(1873, 21, '20380', 'Xã Tây Hồ', 'tay_ho', '2026-05-26 04:45:34'),
(1874, 21, '20392', 'Xã Phú Ninh', 'phu_ninh', '2026-05-26 04:45:34'),
(1875, 21, '20401', 'Phường Hội An Tây', 'hoi_an_tay', '2026-05-26 04:45:34'),
(1876, 21, '20410', 'Phường Hội An', 'hoi_an', '2026-05-26 04:45:34'),
(1877, 21, '20413', 'Phường Hội An Đông', 'hoi_an_dong', '2026-05-26 04:45:34'),
(1878, 21, '20434', 'Xã Tân Hiệp', 'tan_hiep', '2026-05-26 04:45:34'),
(1879, 21, '20443', 'Xã Hùng Sơn', 'hung_son', '2026-05-26 04:45:34'),
(1880, 21, '20455', 'Xã Tây Giang', 'tay_giang', '2026-05-26 04:45:34'),
(1881, 21, '20458', 'Xã Avương', 'avuong', '2026-05-26 04:45:34'),
(1882, 21, '20467', 'Xã Đông Giang', 'dong_giang', '2026-05-26 04:45:34'),
(1883, 21, '20476', 'Xã Sông Kôn', 'song_kon', '2026-05-26 04:45:34'),
(1884, 21, '20485', 'Xã Sông Vàng', 'song_vang', '2026-05-26 04:45:34'),
(1885, 21, '20494', 'Xã Bến Hiên', 'ben_hien', '2026-05-26 04:45:34'),
(1886, 21, '20500', 'Xã Đại Lộc', 'dai_loc', '2026-05-26 04:45:34'),
(1887, 21, '20506', 'Xã Thượng Đức', 'thuong_duc', '2026-05-26 04:45:34'),
(1888, 21, '20515', 'Xã Hà Nha', 'ha_nha', '2026-05-26 04:45:34'),
(1889, 21, '20539', 'Xã Vu Gia', 'vu_gia', '2026-05-26 04:45:34'),
(1890, 21, '20542', 'Xã Phú Thuận', 'phu_thuan', '2026-05-26 04:45:34'),
(1891, 21, '20551', 'Phường Điện Bàn', 'dien_ban', '2026-05-26 04:45:34'),
(1892, 21, '20557', 'Phường Điện Bàn Bắc', 'dien_ban_bac', '2026-05-26 04:45:34'),
(1893, 21, '20569', 'Xã Điện Bàn Tây', 'dien_ban_tay', '2026-05-26 04:45:34'),
(1894, 21, '20575', 'Phường An Thắng', 'an_thang', '2026-05-26 04:45:34'),
(1895, 21, '20579', 'Phường Điện Bàn Đông', 'dien_ban_dong', '2026-05-26 04:45:34'),
(1896, 21, '20587', 'Xã Gò Nổi', 'go_noi', '2026-05-26 04:45:34'),
(1897, 21, '20599', 'Xã Nam Phước', 'nam_phuoc', '2026-05-26 04:45:34'),
(1898, 21, '20611', 'Xã Thu Bồn', 'thu_bon', '2026-05-26 04:45:34'),
(1899, 21, '20623', 'Xã Duy Xuyên', 'duy_xuyen', '2026-05-26 04:45:34'),
(1900, 21, '20635', 'Xã Duy Nghĩa', 'duy_nghia', '2026-05-26 04:45:34'),
(1901, 21, '20641', 'Xã Quế Sơn', 'que_son', '2026-05-26 04:45:34'),
(1902, 21, '20650', 'Xã Xuân Phú', 'xuan_phu', '2026-05-26 04:45:34'),
(1903, 21, '20656', 'Xã Nông Sơn', 'nong_son', '2026-05-26 04:45:34'),
(1904, 21, '20662', 'Xã Quế Sơn Trung', 'que_son_trung', '2026-05-26 04:45:34'),
(1905, 21, '20669', 'Xã Quế Phước', 'que_phuoc', '2026-05-26 04:45:34'),
(1906, 21, '20695', 'Xã Thạnh Mỹ', 'thanh_my', '2026-05-26 04:45:34'),
(1907, 21, '20698', 'Xã La Êê', 'la_ee', '2026-05-26 04:45:34'),
(1908, 21, '20704', 'Xã La Dêê', 'la_dee', '2026-05-26 04:45:34'),
(1909, 21, '20707', 'Xã Nam Giang', 'nam_giang', '2026-05-26 04:45:34'),
(1910, 21, '20710', 'Xã Bến Giằng', 'ben_giang', '2026-05-26 04:45:34'),
(1911, 21, '20716', 'Xã Đắc Pring', 'dac_pring', '2026-05-26 04:45:34'),
(1912, 21, '20722', 'Xã Khâm Đức', 'kham_duc', '2026-05-26 04:45:34'),
(1913, 21, '20728', 'Xã Phước Hiệp', 'phuoc_hiep', '2026-05-26 04:45:34'),
(1914, 21, '20734', 'Xã Phước Năng', 'phuoc_nang', '2026-05-26 04:45:34'),
(1915, 21, '20740', 'Xã Phước Chánh', 'phuoc_chanh', '2026-05-26 04:45:34'),
(1916, 21, '20752', 'Xã Phước Thành', 'phuoc_thanh', '2026-05-26 04:45:34'),
(1917, 21, '20767', 'Xã Việt An', 'viet_an', '2026-05-26 04:45:34'),
(1918, 21, '20770', 'Xã Phước Trà', 'phuoc_tra', '2026-05-26 04:45:34'),
(1919, 21, '20779', 'Xã Hiệp Đức', 'hiep_duc', '2026-05-26 04:45:34'),
(1920, 21, '20791', 'Xã Thăng Bình', 'thang_binh', '2026-05-26 04:45:34'),
(1921, 21, '20794', 'Xã Thăng An', 'thang_an', '2026-05-26 04:45:34'),
(1922, 21, '20818', 'Xã Đồng Dương', 'dong_duong', '2026-05-26 04:45:34'),
(1923, 21, '20827', 'Xã Thăng Phú', 'thang_phu', '2026-05-26 04:45:34'),
(1924, 21, '20836', 'Xã Thăng Trường', 'thang_truong', '2026-05-26 04:45:34'),
(1925, 21, '20848', 'Xã Thăng Điền', 'thang_dien', '2026-05-26 04:45:34'),
(1926, 21, '20854', 'Xã Tiên Phước', 'tien_phuoc', '2026-05-26 04:45:34'),
(1927, 21, '20857', 'Xã Sơn Cẩm Hà', 'son_cam_ha', '2026-05-26 04:45:34'),
(1928, 21, '20875', 'Xã Lãnh Ngọc', 'lanh_ngoc', '2026-05-26 04:45:34'),
(1929, 21, '20878', 'Xã Thạnh Bình', 'thanh_binh', '2026-05-26 04:45:34'),
(1930, 21, '20900', 'Xã Trà My', 'tra_my', '2026-05-26 04:45:34'),
(1931, 21, '20908', 'Xã Trà Liên', 'tra_lien', '2026-05-26 04:45:34'),
(1932, 21, '20920', 'Xã Trà Đốc', 'tra_doc', '2026-05-26 04:45:34'),
(1933, 21, '20923', 'Xã Trà Tân', 'tra_tan', '2026-05-26 04:45:34'),
(1934, 21, '20929', 'Xã Trà Giáp', 'tra_giap', '2026-05-26 04:45:34'),
(1935, 21, '20938', 'Xã Trà Leng', 'tra_leng', '2026-05-26 04:45:34'),
(1936, 21, '20941', 'Xã Trà Tập', 'tra_tap', '2026-05-26 04:45:34'),
(1937, 21, '20944', 'Xã Nam Trà My', 'nam_tra_my', '2026-05-26 04:45:34'),
(1938, 21, '20950', 'Xã Trà Linh', 'tra_linh', '2026-05-26 04:45:34'),
(1939, 21, '20959', 'Xã Trà Vân', 'tra_van', '2026-05-26 04:45:34'),
(1940, 21, '20965', 'Xã Núi Thành', 'nui_thanh', '2026-05-26 04:45:34'),
(1941, 21, '20971', 'Xã Tam Xuân', 'tam_xuan', '2026-05-26 04:45:34'),
(1942, 21, '20977', 'Xã Đức Phú', 'duc_phu', '2026-05-26 04:45:34'),
(1943, 21, '20984', 'Xã Tam Anh', 'tam_anh', '2026-05-26 04:45:34'),
(1944, 21, '20992', 'Xã Tam Hải', 'tam_hai', '2026-05-26 04:45:34'),
(1945, 21, '21004', 'Xã Tam Mỹ', 'tam_my', '2026-05-26 04:45:34'),
(1946, 22, '21025', 'Phường Cẩm Thành', 'cam_thanh', '2026-05-26 04:45:34'),
(1947, 22, '21028', 'Phường Nghĩa Lộ', 'nghia_lo', '2026-05-26 04:45:34'),
(1948, 22, '21034', 'Xã An Phú', 'an_phu', '2026-05-26 04:45:34'),
(1949, 22, '21040', 'Xã Bình Sơn', 'binh_son', '2026-05-26 04:45:34'),
(1950, 22, '21061', 'Xã Vạn Tường', 'van_tuong', '2026-05-26 04:45:34'),
(1951, 22, '21085', 'Xã Bình Minh', 'binh_minh', '2026-05-26 04:45:34'),
(1952, 22, '21100', 'Xã Bình Chương', 'binh_chuong', '2026-05-26 04:45:34'),
(1953, 22, '21109', 'Xã Đông Sơn', 'dong_son', '2026-05-26 04:45:34'),
(1954, 22, '21115', 'Xã Trà Bồng', 'tra_bong', '2026-05-26 04:45:34'),
(1955, 22, '21124', 'Xã Thanh Bồng', 'thanh_bong', '2026-05-26 04:45:34'),
(1956, 22, '21127', 'Xã Đông Trà Bồng', 'dong_tra_bong', '2026-05-26 04:45:34'),
(1957, 22, '21136', 'Xã Cà Đam', 'ca_dam', '2026-05-26 04:45:34'),
(1958, 22, '21154', 'Xã Tây Trà', 'tay_tra', '2026-05-26 04:45:34'),
(1959, 22, '21157', 'Xã Tây Trà Bồng', 'tay_tra_bong', '2026-05-26 04:45:34'),
(1960, 22, '21172', 'Phường Trương Quang Trọng', 'truong_quang_trong', '2026-05-26 04:45:34'),
(1961, 22, '21181', 'Xã Thọ Phong', 'tho_phong', '2026-05-26 04:45:34'),
(1962, 22, '21196', 'Xã Trường Giang', 'truong_giang', '2026-05-26 04:45:34'),
(1963, 22, '21205', 'Xã Ba Gia', 'ba_gia', '2026-05-26 04:45:34'),
(1964, 22, '21211', 'Xã Tịnh Khê', 'tinh_khe', '2026-05-26 04:45:34'),
(1965, 22, '21220', 'Xã Sơn Tịnh', 'son_tinh', '2026-05-26 04:45:34'),
(1966, 22, '21235', 'Xã Tư Nghĩa', 'tu_nghia', '2026-05-26 04:45:34'),
(1967, 22, '21238', 'Xã Vệ Giang', 've_giang', '2026-05-26 04:45:34'),
(1968, 22, '21244', 'Xã Trà Giang', 'tra_giang', '2026-05-26 04:45:34'),
(1969, 22, '21250', 'Xã Nghĩa Giang', 'nghia_giang', '2026-05-26 04:45:34'),
(1970, 22, '21289', 'Xã Sơn Hà', 'son_ha', '2026-05-26 04:45:34'),
(1971, 22, '21292', 'Xã Sơn Hạ', 'son_ha', '2026-05-26 04:45:34'),
(1972, 22, '21307', 'Xã Sơn Linh', 'son_linh', '2026-05-26 04:45:34'),
(1973, 22, '21319', 'Xã Sơn Thủy', 'son_thuy', '2026-05-26 04:45:34'),
(1974, 22, '21325', 'Xã Sơn Kỳ', 'son_ky', '2026-05-26 04:45:34'),
(1975, 22, '21334', 'Xã Sơn Tây Thượng', 'son_tay_thuong', '2026-05-26 04:45:34'),
(1976, 22, '21340', 'Xã Sơn Tây', 'son_tay', '2026-05-26 04:45:34'),
(1977, 22, '21343', 'Xã Sơn Tây Hạ', 'son_tay_ha', '2026-05-26 04:45:34'),
(1978, 22, '21349', 'Xã Sơn Mai', 'son_mai', '2026-05-26 04:45:34'),
(1979, 22, '21361', 'Xã Minh Long', 'minh_long', '2026-05-26 04:45:34'),
(1980, 22, '21364', 'Xã Nghĩa Hành', 'nghia_hanh', '2026-05-26 04:45:34'),
(1981, 22, '21370', 'Xã Phước Giang', 'phuoc_giang', '2026-05-26 04:45:34'),
(1982, 22, '21385', 'Xã Đình Cương', 'dinh_cuong', '2026-05-26 04:45:34'),
(1983, 22, '21388', 'Xã Thiện Tín', 'thien_tin', '2026-05-26 04:45:34'),
(1984, 22, '21400', 'Xã Mộ Đức', 'mo_duc', '2026-05-26 04:45:34'),
(1985, 22, '21409', 'Xã Long Phụng', 'long_phung', '2026-05-26 04:45:34'),
(1986, 22, '21421', 'Xã Mỏ Cày', 'mo_cay', '2026-05-26 04:45:34'),
(1987, 22, '21433', 'Xã Lân Phong', 'lan_phong', '2026-05-26 04:45:34'),
(1988, 22, '21439', 'Phường Đức Phổ', 'duc_pho', '2026-05-26 04:45:34'),
(1989, 22, '21451', 'Phường Trà Câu', 'tra_cau', '2026-05-26 04:45:34'),
(1990, 22, '21457', 'Xã Nguyễn Nghiêm', 'nguyen_nghiem', '2026-05-26 04:45:34'),
(1991, 22, '21472', 'Xã Khánh Cường', 'khanh_cuong', '2026-05-26 04:45:34'),
(1992, 22, '21478', 'Phường Sa Huỳnh', 'sa_huynh', '2026-05-26 04:45:34'),
(1993, 22, '21484', 'Xã Ba Tơ', 'ba_to', '2026-05-26 04:45:34'),
(1994, 22, '21490', 'Xã Ba Vinh', 'ba_vinh', '2026-05-26 04:45:34'),
(1995, 22, '21496', 'Xã Ba Động', 'ba_dong', '2026-05-26 04:45:34'),
(1996, 22, '21499', 'Xã Ba Dinh', 'ba_dinh', '2026-05-26 04:45:34'),
(1997, 22, '21520', 'Xã Đặng Thùy Trâm', 'dang_thuy_tram', '2026-05-26 04:45:34'),
(1998, 22, '21523', 'Xã Ba Tô', 'ba_to', '2026-05-26 04:45:34'),
(1999, 22, '21529', 'Xã Ba Vì', 'ba_vi', '2026-05-26 04:45:34'),
(2000, 22, '21538', 'Xã Ba Xa', 'ba_xa', '2026-05-26 04:45:34'),
(2001, 22, '21548', 'Đặc khu Lý Sơn', 'ly_son', '2026-05-26 04:45:34'),
(2002, 22, '23284', 'Phường Đăk Cấm', 'dak_cam', '2026-05-26 04:45:34'),
(2003, 22, '23293', 'Phường Kon Tum', 'kon_tum', '2026-05-26 04:45:34'),
(2004, 22, '23302', 'Phường Đăk Bla', 'dak_bla', '2026-05-26 04:45:34'),
(2005, 22, '23317', 'Xã Ngọk Bay', 'ngok_bay', '2026-05-26 04:45:34'),
(2006, 22, '23326', 'Xã Ia Chim', 'ia_chim', '2026-05-26 04:45:34'),
(2007, 22, '23332', 'Xã Đăk Rơ Wa', 'dak_ro_wa', '2026-05-26 04:45:34'),
(2008, 22, '23341', 'Xã Đăk Pék', 'dak_pek', '2026-05-26 04:45:34'),
(2009, 22, '23344', 'Xã Đăk Plô', 'dak_plo', '2026-05-26 04:45:34'),
(2010, 22, '23356', 'Xã Xốp', 'xop', '2026-05-26 04:45:34'),
(2011, 22, '23365', 'Xã Ngọc Linh', 'ngoc_linh', '2026-05-26 04:45:34'),
(2012, 22, '23368', 'Xã Đăk Long', 'dak_long', '2026-05-26 04:45:34'),
(2013, 22, '23374', 'Xã Đăk Môn', 'dak_mon', '2026-05-26 04:45:34'),
(2014, 22, '23377', 'Xã Bờ Y', 'bo_y', '2026-05-26 04:45:34'),
(2015, 22, '23383', 'Xã Dục Nông', 'duc_nong', '2026-05-26 04:45:34'),
(2016, 22, '23392', 'Xã Sa Loong', 'sa_loong', '2026-05-26 04:45:34'),
(2017, 22, '23401', 'Xã Đăk Tô', 'dak_to', '2026-05-26 04:45:34'),
(2018, 22, '23416', 'Xã Đăk Sao', 'dak_sao', '2026-05-26 04:45:34'),
(2019, 22, '23419', 'Xã Đăk Tờ Kan', 'dak_to_kan', '2026-05-26 04:45:34'),
(2020, 22, '23425', 'Xã Tu Mơ Rông', 'tu_mo_rong', '2026-05-26 04:45:34'),
(2021, 22, '23428', 'Xã Ngọk Tụ', 'ngok_tu', '2026-05-26 04:45:34'),
(2022, 22, '23430', 'Xã Kon Đào', 'kon_dao', '2026-05-26 04:45:34'),
(2023, 22, '23446', 'Xã Măng Ri', 'mang_ri', '2026-05-26 04:45:34'),
(2024, 22, '23455', 'Xã Măng Bút', 'mang_but', '2026-05-26 04:45:34'),
(2025, 22, '23473', 'Xã Măng Đen', 'mang_den', '2026-05-26 04:45:34'),
(2026, 22, '23476', 'Xã Kon Plông', 'kon_plong', '2026-05-26 04:45:34'),
(2027, 22, '23479', 'Xã Đăk Rve', 'dak_rve', '2026-05-26 04:45:34'),
(2028, 22, '23485', 'Xã Đăk Kôi', 'dak_koi', '2026-05-26 04:45:34'),
(2029, 22, '23497', 'Xã Kon Braih', 'kon_braih', '2026-05-26 04:45:34'),
(2030, 22, '23500', 'Xã Đăk Hà', 'dak_ha', '2026-05-26 04:45:34'),
(2031, 22, '23504', 'Xã Đăk Pxi', 'dak_pxi', '2026-05-26 04:45:34'),
(2032, 22, '23510', 'Xã Đăk Ui', 'dak_ui', '2026-05-26 04:45:34'),
(2033, 22, '23512', 'Xã Đăk Mar', 'dak_mar', '2026-05-26 04:45:34'),
(2034, 22, '23515', 'Xã Ngọk Réo', 'ngok_reo', '2026-05-26 04:45:34'),
(2035, 22, '23527', 'Xã Sa Thầy', 'sa_thay', '2026-05-26 04:45:34'),
(2036, 22, '23530', 'Xã Rờ Kơi', 'ro_koi', '2026-05-26 04:45:34'),
(2037, 22, '23534', 'Xã Sa Bình', 'sa_binh', '2026-05-26 04:45:34'),
(2038, 22, '23535', 'Xã Ia Đal', 'ia_dal', '2026-05-26 04:45:34'),
(2039, 22, '23536', 'Xã Mô Rai', 'mo_rai', '2026-05-26 04:45:34'),
(2040, 22, '23538', 'Xã Ia Tơi', 'ia_toi', '2026-05-26 04:45:34'),
(2041, 22, '23548', 'Xã Ya Ly', 'ya_ly', '2026-05-26 04:45:34'),
(2042, 23, '21553', 'Phường Quy Nhơn Bắc', 'quy_nhon_bac', '2026-05-26 04:45:34'),
(2043, 23, '21583', 'Phường Quy Nhơn', 'quy_nhon', '2026-05-26 04:45:34'),
(2044, 23, '21589', 'Phường Quy Nhơn Tây', 'quy_nhon_tay', '2026-05-26 04:45:34'),
(2045, 23, '21592', 'Phường Quy Nhơn Nam', 'quy_nhon_nam', '2026-05-26 04:45:34'),
(2046, 23, '21601', 'Phường Quy Nhơn Đông', 'quy_nhon_dong', '2026-05-26 04:45:34'),
(2047, 23, '21607', 'Xã Nhơn Châu', 'nhon_chau', '2026-05-26 04:45:34'),
(2048, 23, '21609', 'Xã An Lão', 'an_lao', '2026-05-26 04:45:34'),
(2049, 23, '21616', 'Xã An Vinh', 'an_vinh', '2026-05-26 04:45:34'),
(2050, 23, '21622', 'Xã An Toàn', 'an_toan', '2026-05-26 04:45:34'),
(2051, 23, '21628', 'Xã An Hòa', 'an_hoa', '2026-05-26 04:45:34'),
(2052, 23, '21637', 'Phường Tam Quan', 'tam_quan', '2026-05-26 04:45:34'),
(2053, 23, '21640', 'Phường Bồng Sơn', 'bong_son', '2026-05-26 04:45:34'),
(2054, 23, '21655', 'Phường Hoài Nhơn Bắc', 'hoai_nhon_bac', '2026-05-26 04:45:34'),
(2055, 23, '21661', 'Phường Hoài Nhơn Tây', 'hoai_nhon_tay', '2026-05-26 04:45:34'),
(2056, 23, '21664', 'Phường Hoài Nhơn', 'hoai_nhon', '2026-05-26 04:45:34'),
(2057, 23, '21670', 'Phường Hoài Nhơn Đông', 'hoai_nhon_dong', '2026-05-26 04:45:34'),
(2058, 23, '21673', 'Phường Hoài Nhơn Nam', 'hoai_nhon_nam', '2026-05-26 04:45:34'),
(2059, 23, '21688', 'Xã Hoài Ân', 'hoai_an', '2026-05-26 04:45:34'),
(2060, 23, '21697', 'Xã Ân Hảo', 'an_hao', '2026-05-26 04:45:34'),
(2061, 23, '21703', 'Xã Vạn Đức', 'van_duc', '2026-05-26 04:45:34'),
(2062, 23, '21715', 'Xã Ân Tường', 'an_tuong', '2026-05-26 04:45:34'),
(2063, 23, '21727', 'Xã Kim Sơn', 'kim_son', '2026-05-26 04:45:34'),
(2064, 23, '21730', 'Xã Phù Mỹ', 'phu_my', '2026-05-26 04:45:34'),
(2065, 23, '21733', 'Xã Bình Dương', 'binh_duong', '2026-05-26 04:45:34'),
(2066, 23, '21739', 'Xã Phù Mỹ Bắc', 'phu_my_bac', '2026-05-26 04:45:34'),
(2067, 23, '21751', 'Xã Phù Mỹ Đông', 'phu_my_dong', '2026-05-26 04:45:34'),
(2068, 23, '21757', 'Xã Phù Mỹ Tây', 'phu_my_tay', '2026-05-26 04:45:34'),
(2069, 23, '21769', 'Xã An Lương', 'an_luong', '2026-05-26 04:45:34'),
(2070, 23, '21775', 'Xã Phù Mỹ Nam', 'phu_my_nam', '2026-05-26 04:45:34'),
(2071, 23, '21786', 'Xã Vĩnh Thạnh', 'vinh_thanh', '2026-05-26 04:45:34'),
(2072, 23, '21787', 'Xã Vĩnh Sơn', 'vinh_son', '2026-05-26 04:45:34'),
(2073, 23, '21796', 'Xã Vĩnh Thịnh', 'vinh_thinh', '2026-05-26 04:45:34'),
(2074, 23, '21805', 'Xã Vĩnh Quang', 'vinh_quang', '2026-05-26 04:45:34'),
(2075, 23, '21808', 'Xã Tây Sơn', 'tay_son', '2026-05-26 04:45:34'),
(2076, 23, '21817', 'Xã Bình Hiệp', 'binh_hiep', '2026-05-26 04:45:34'),
(2077, 23, '21820', 'Xã Bình Khê', 'binh_khe', '2026-05-26 04:45:34'),
(2078, 23, '21829', 'Xã Bình An', 'binh_an', '2026-05-26 04:45:34'),
(2079, 23, '21835', 'Xã Bình Phú', 'binh_phu', '2026-05-26 04:45:34'),
(2080, 23, '21853', 'Xã Phù Cát', 'phu_cat', '2026-05-26 04:45:34'),
(2081, 23, '21859', 'Xã Đề Gi', 'de_gi', '2026-05-26 04:45:34'),
(2082, 23, '21868', 'Xã Hội Sơn', 'hoi_son', '2026-05-26 04:45:34'),
(2083, 23, '21871', 'Xã Hòa Hội', 'hoa_hoi', '2026-05-26 04:45:34'),
(2084, 23, '21880', 'Xã Cát Tiến', 'cat_tien', '2026-05-26 04:45:34'),
(2085, 23, '21892', 'Xã Xuân An', 'xuan_an', '2026-05-26 04:45:34'),
(2086, 23, '21901', 'Xã Ngô Mây', 'ngo_may', '2026-05-26 04:45:34'),
(2087, 23, '21907', 'Phường Bình Định', 'binh_dinh', '2026-05-26 04:45:34'),
(2088, 23, '21910', 'Phường An Nhơn', 'an_nhon', '2026-05-26 04:45:34'),
(2089, 23, '21925', 'Phường An Nhơn Bắc', 'an_nhon_bac', '2026-05-26 04:45:34'),
(2090, 23, '21934', 'Phường An Nhơn Đông', 'an_nhon_dong', '2026-05-26 04:45:34'),
(2091, 23, '21940', 'Xã An Nhơn Tây', 'an_nhon_tay', '2026-05-26 04:45:34'),
(2092, 23, '21943', 'Phường An Nhơn Nam', 'an_nhon_nam', '2026-05-26 04:45:34'),
(2093, 23, '21952', 'Xã Tuy Phước', 'tuy_phuoc', '2026-05-26 04:45:34'),
(2094, 23, '21964', 'Xã Tuy Phước Bắc', 'tuy_phuoc_bac', '2026-05-26 04:45:34'),
(2095, 23, '21970', 'Xã Tuy Phước Đông', 'tuy_phuoc_dong', '2026-05-26 04:45:34'),
(2096, 23, '21985', 'Xã Tuy Phước Tây', 'tuy_phuoc_tay', '2026-05-26 04:45:34'),
(2097, 23, '21994', 'Xã Vân Canh', 'van_canh', '2026-05-26 04:45:34'),
(2098, 23, '21997', 'Xã Canh Liên', 'canh_lien', '2026-05-26 04:45:34'),
(2099, 23, '22006', 'Xã Canh Vinh', 'canh_vinh', '2026-05-26 04:45:34'),
(2100, 23, '23563', 'Phường Diên Hồng', 'dien_hong', '2026-05-26 04:45:34'),
(2101, 23, '23575', 'Phường Pleiku', 'pleiku', '2026-05-26 04:45:34'),
(2102, 23, '23584', 'Phường Thống Nhất', 'thong_nhat', '2026-05-26 04:45:34'),
(2103, 23, '23586', 'Phường Hội Phú', 'hoi_phu', '2026-05-26 04:45:34'),
(2104, 23, '23590', 'Xã Biển Hồ', 'bien_ho', '2026-05-26 04:45:34'),
(2105, 23, '23602', 'Phường An Phú', 'an_phu', '2026-05-26 04:45:34'),
(2106, 23, '23611', 'Xã Gào', 'gao', '2026-05-26 04:45:34'),
(2107, 23, '23614', 'Phường An Bình', 'an_binh', '2026-05-26 04:45:34'),
(2108, 23, '23617', 'Phường An Khê', 'an_khe', '2026-05-26 04:45:34'),
(2109, 23, '23629', 'Xã Cửu An', 'cuu_an', '2026-05-26 04:45:34'),
(2110, 23, '23638', 'Xã Kbang', 'kbang', '2026-05-26 04:45:34'),
(2111, 23, '23644', 'Xã Đak Rong', 'dak_rong', '2026-05-26 04:45:34'),
(2112, 23, '23647', 'Xã Sơn Lang', 'son_lang', '2026-05-26 04:45:34'),
(2113, 23, '23650', 'Xã Krong', 'krong', '2026-05-26 04:45:34'),
(2114, 23, '23668', 'Xã Tơ Tung', 'to_tung', '2026-05-26 04:45:34'),
(2115, 23, '23674', 'Xã Kông Bơ La', 'kong_bo_la', '2026-05-26 04:45:34'),
(2116, 23, '23677', 'Xã Đak Đoa', 'dak_doa', '2026-05-26 04:45:34'),
(2117, 23, '23683', 'Xã Đak Sơmei', 'dak_somei', '2026-05-26 04:45:34'),
(2118, 23, '23701', 'Xã Kon Gang', 'kon_gang', '2026-05-26 04:45:34'),
(2119, 23, '23710', 'Xã Ia Băng', 'ia_bang', '2026-05-26 04:45:34'),
(2120, 23, '23714', 'Xã KDang', 'kdang', '2026-05-26 04:45:34'),
(2121, 23, '23722', 'Xã Chư Păh', 'chu_pah', '2026-05-26 04:45:34'),
(2122, 23, '23728', 'Xã Ia Khươl', 'ia_khuol', '2026-05-26 04:45:34'),
(2123, 23, '23734', 'Xã Ia Ly', 'ia_ly', '2026-05-26 04:45:34'),
(2124, 23, '23749', 'Xã Ia Phí', 'ia_phi', '2026-05-26 04:45:34'),
(2125, 23, '23764', 'Xã Ia Grai', 'ia_grai', '2026-05-26 04:45:34'),
(2126, 23, '23767', 'Xã Ia Hrung', 'ia_hrung', '2026-05-26 04:45:34'),
(2127, 23, '23776', 'Xã Ia Krái', 'ia_krai', '2026-05-26 04:45:34'),
(2128, 23, '23782', 'Xã Ia O', 'ia_o', '2026-05-26 04:45:34'),
(2129, 23, '23788', 'Xã Ia Chia', 'ia_chia', '2026-05-26 04:45:34'),
(2130, 23, '23794', 'Xã Mang Yang', 'mang_yang', '2026-05-26 04:45:34'),
(2131, 23, '23798', 'Xã Ayun', 'ayun', '2026-05-26 04:45:34'),
(2132, 23, '23799', 'Xã Hra', 'hra', '2026-05-26 04:45:34'),
(2133, 23, '23812', 'Xã Lơ Pang', 'lo_pang', '2026-05-26 04:45:34'),
(2134, 23, '23818', 'Xã Kon Chiêng', 'kon_chieng', '2026-05-26 04:45:34'),
(2135, 23, '23824', 'Xã Kông Chro', 'kong_chro', '2026-05-26 04:45:34'),
(2136, 23, '23830', 'Xã Chư Krey', 'chu_krey', '2026-05-26 04:45:34'),
(2137, 23, '23833', 'Xã Ya Ma', 'ya_ma', '2026-05-26 04:45:34'),
(2138, 23, '23839', 'Xã SRó', 'sro', '2026-05-26 04:45:34'),
(2139, 23, '23842', 'Xã Đăk Song', 'dak_song', '2026-05-26 04:45:34'),
(2140, 23, '23851', 'Xã Chơ Long', 'cho_long', '2026-05-26 04:45:34'),
(2141, 23, '23857', 'Xã Đức Cơ', 'duc_co', '2026-05-26 04:45:34'),
(2142, 23, '23866', 'Xã Ia Krêl', 'ia_krel', '2026-05-26 04:45:34'),
(2143, 23, '23869', 'Xã Ia Dơk', 'ia_dok', '2026-05-26 04:45:34'),
(2144, 23, '23872', 'Xã Ia Dom', 'ia_dom', '2026-05-26 04:45:34'),
(2145, 23, '23881', 'Xã Ia Pnôn', 'ia_pnon', '2026-05-26 04:45:34'),
(2146, 23, '23884', 'Xã Ia Nan', 'ia_nan', '2026-05-26 04:45:34');
INSERT INTO `hicrm_district` (`id`, `province_id`, `district_code`, `district_name`, `district_keyword`, `created_at`) VALUES
(2147, 23, '23887', 'Xã Chư Prông', 'chu_prong', '2026-05-26 04:45:34'),
(2148, 23, '23896', 'Xã Bàu Cạn', 'bau_can', '2026-05-26 04:45:34'),
(2149, 23, '23908', 'Xã Ia Tôr', 'ia_tor', '2026-05-26 04:45:34'),
(2150, 23, '23911', 'Xã Ia Boòng', 'ia_boong', '2026-05-26 04:45:34'),
(2151, 23, '23917', 'Xã Ia Púch', 'ia_puch', '2026-05-26 04:45:34'),
(2152, 23, '23926', 'Xã Ia Pia', 'ia_pia', '2026-05-26 04:45:34'),
(2153, 23, '23935', 'Xã Ia Lâu', 'ia_lau', '2026-05-26 04:45:34'),
(2154, 23, '23938', 'Xã Ia Mơ', 'ia_mo', '2026-05-26 04:45:34'),
(2155, 23, '23941', 'Xã Chư Sê', 'chu_se', '2026-05-26 04:45:34'),
(2156, 23, '23942', 'Xã Chư Pưh', 'chu_puh', '2026-05-26 04:45:34'),
(2157, 23, '23947', 'Xã Bờ Ngoong', 'bo_ngoong', '2026-05-26 04:45:34'),
(2158, 23, '23954', 'Xã Al Bá', 'al_ba', '2026-05-26 04:45:34'),
(2159, 23, '23971', 'Xã Ia Hrú', 'ia_hru', '2026-05-26 04:45:34'),
(2160, 23, '23977', 'Xã Ia Ko', 'ia_ko', '2026-05-26 04:45:34'),
(2161, 23, '23986', 'Xã Ia Le', 'ia_le', '2026-05-26 04:45:34'),
(2162, 23, '23995', 'Xã Đak Pơ', 'dak_po', '2026-05-26 04:45:34'),
(2163, 23, '24007', 'Xã Ya Hội', 'ya_hoi', '2026-05-26 04:45:34'),
(2164, 23, '24013', 'Xã Pờ Tó', 'po_to', '2026-05-26 04:45:34'),
(2165, 23, '24022', 'Xã Ia Pa', 'ia_pa', '2026-05-26 04:45:34'),
(2166, 23, '24028', 'Xã Ia Tul', 'ia_tul', '2026-05-26 04:45:34'),
(2167, 23, '24043', 'Xã Phú Thiện', 'phu_thien', '2026-05-26 04:45:34'),
(2168, 23, '24044', 'Phường Ayun Pa', 'ayun_pa', '2026-05-26 04:45:34'),
(2169, 23, '24049', 'Xã Chư A Thai', 'chu_a_thai', '2026-05-26 04:45:34'),
(2170, 23, '24061', 'Xã Ia Hiao', 'ia_hiao', '2026-05-26 04:45:34'),
(2171, 23, '24065', 'Xã Ia Rbol', 'ia_rbol', '2026-05-26 04:45:34'),
(2172, 23, '24073', 'Xã Ia Sao', 'ia_sao', '2026-05-26 04:45:34'),
(2173, 23, '24076', 'Xã Phú Túc', 'phu_tuc', '2026-05-26 04:45:34'),
(2174, 23, '24100', 'Xã Ia Dreh', 'ia_dreh', '2026-05-26 04:45:34'),
(2175, 23, '24109', 'Xã Uar', 'uar', '2026-05-26 04:45:34'),
(2176, 23, '24112', 'Xã Ia Rsai', 'ia_rsai', '2026-05-26 04:45:34'),
(2177, 24, '22333', 'Phường Bắc Nha Trang', 'bac_nha_trang', '2026-05-26 04:45:34'),
(2178, 24, '22366', 'Phường Nha Trang', 'nha_trang', '2026-05-26 04:45:34'),
(2179, 24, '22390', 'Phường Tây Nha Trang', 'tay_nha_trang', '2026-05-26 04:45:34'),
(2180, 24, '22402', 'Phường Nam Nha Trang', 'nam_nha_trang', '2026-05-26 04:45:34'),
(2181, 24, '22411', 'Phường Bắc Cam Ranh', 'bac_cam_ranh', '2026-05-26 04:45:34'),
(2182, 24, '22420', 'Phường Cam Ranh', 'cam_ranh', '2026-05-26 04:45:34'),
(2183, 24, '22423', 'Phường Ba Ngòi', 'ba_ngoi', '2026-05-26 04:45:34'),
(2184, 24, '22432', 'Phường Cam Linh', 'cam_linh', '2026-05-26 04:45:34'),
(2185, 24, '22435', 'Xã Cam Hiệp', 'cam_hiep', '2026-05-26 04:45:34'),
(2186, 24, '22453', 'Xã Cam Lâm', 'cam_lam', '2026-05-26 04:45:34'),
(2187, 24, '22465', 'Xã Cam An', 'cam_an', '2026-05-26 04:45:34'),
(2188, 24, '22480', 'Xã Nam Cam Ranh', 'nam_cam_ranh', '2026-05-26 04:45:34'),
(2189, 24, '22489', 'Xã Vạn Ninh', 'van_ninh', '2026-05-26 04:45:34'),
(2190, 24, '22498', 'Xã Tu Bông', 'tu_bong', '2026-05-26 04:45:34'),
(2191, 24, '22504', 'Xã Đại Lãnh', 'dai_lanh', '2026-05-26 04:45:34'),
(2192, 24, '22516', 'Xã Vạn Thắng', 'van_thang', '2026-05-26 04:45:34'),
(2193, 24, '22525', 'Xã Vạn Hưng', 'van_hung', '2026-05-26 04:45:34'),
(2194, 24, '22528', 'Phường Ninh Hòa', 'ninh_hoa', '2026-05-26 04:45:34'),
(2195, 24, '22546', 'Xã Bắc Ninh Hòa', 'bac_ninh_hoa', '2026-05-26 04:45:34'),
(2196, 24, '22552', 'Xã Tây Ninh Hòa', 'tay_ninh_hoa', '2026-05-26 04:45:34'),
(2197, 24, '22558', 'Xã Hòa Trí', 'hoa_tri', '2026-05-26 04:45:34'),
(2198, 24, '22561', 'Phường Đông Ninh Hòa', 'dong_ninh_hoa', '2026-05-26 04:45:34'),
(2199, 24, '22576', 'Xã Tân Định', 'tan_dinh', '2026-05-26 04:45:34'),
(2200, 24, '22591', 'Phường Hòa Thắng', 'hoa_thang', '2026-05-26 04:45:34'),
(2201, 24, '22597', 'Xã Nam Ninh Hòa', 'nam_ninh_hoa', '2026-05-26 04:45:34'),
(2202, 24, '22609', 'Xã Khánh Vĩnh', 'khanh_vinh', '2026-05-26 04:45:34'),
(2203, 24, '22612', 'Xã Trung Khánh Vĩnh', 'trung_khanh_vinh', '2026-05-26 04:45:34'),
(2204, 24, '22615', 'Xã Bắc Khánh Vĩnh', 'bac_khanh_vinh', '2026-05-26 04:45:34'),
(2205, 24, '22624', 'Xã Tây Khánh Vĩnh', 'tay_khanh_vinh', '2026-05-26 04:45:34'),
(2206, 24, '22648', 'Xã Nam Khánh Vĩnh', 'nam_khanh_vinh', '2026-05-26 04:45:34'),
(2207, 24, '22651', 'Xã Diên Khánh', 'dien_khanh', '2026-05-26 04:45:34'),
(2208, 24, '22657', 'Xã Diên Điền', 'dien_dien', '2026-05-26 04:45:34'),
(2209, 24, '22660', 'Xã Diên Lâm', 'dien_lam', '2026-05-26 04:45:34'),
(2210, 24, '22672', 'Xã Diên Thọ', 'dien_tho', '2026-05-26 04:45:34'),
(2211, 24, '22678', 'Xã Diên Lạc', 'dien_lac', '2026-05-26 04:45:34'),
(2212, 24, '22702', 'Xã Suối Hiệp', 'suoi_hiep', '2026-05-26 04:45:34'),
(2213, 24, '22708', 'Xã Suối Dầu', 'suoi_dau', '2026-05-26 04:45:34'),
(2214, 24, '22714', 'Xã Khánh Sơn', 'khanh_son', '2026-05-26 04:45:34'),
(2215, 24, '22720', 'Xã Tây Khánh Sơn', 'tay_khanh_son', '2026-05-26 04:45:34'),
(2216, 24, '22732', 'Xã Đông Khánh Sơn', 'dong_khanh_son', '2026-05-26 04:45:34'),
(2217, 24, '22736', 'Đặc khu Trường Sa', 'truong_sa', '2026-05-26 04:45:34'),
(2218, 24, '22738', 'Phường Đô Vinh', 'do_vinh', '2026-05-26 04:45:34'),
(2219, 24, '22741', 'Phường Bảo An', 'bao_an', '2026-05-26 04:45:34'),
(2220, 24, '22759', 'Phường Phan Rang', 'phan_rang', '2026-05-26 04:45:34'),
(2221, 24, '22780', 'Phường Đông Hải', 'dong_hai', '2026-05-26 04:45:34'),
(2222, 24, '22786', 'Xã Bác Ái Tây', 'bac_ai_tay', '2026-05-26 04:45:34'),
(2223, 24, '22795', 'Xã Bác Ái', 'bac_ai', '2026-05-26 04:45:34'),
(2224, 24, '22801', 'Xã Bác Ái Đông', 'bac_ai_dong', '2026-05-26 04:45:34'),
(2225, 24, '22810', 'Xã Ninh Sơn', 'ninh_son', '2026-05-26 04:45:34'),
(2226, 24, '22813', 'Xã Lâm Sơn', 'lam_son', '2026-05-26 04:45:34'),
(2227, 24, '22822', 'Xã Mỹ Sơn', 'my_son', '2026-05-26 04:45:34'),
(2228, 24, '22828', 'Xã Anh Dũng', 'anh_dung', '2026-05-26 04:45:34'),
(2229, 24, '22834', 'Phường Ninh Chử', 'ninh_chu', '2026-05-26 04:45:34'),
(2230, 24, '22840', 'Xã Công Hải', 'cong_hai', '2026-05-26 04:45:34'),
(2231, 24, '22846', 'Xã Vĩnh Hải', 'vinh_hai', '2026-05-26 04:45:34'),
(2232, 24, '22849', 'Xã Thuận Bắc', 'thuan_bac', '2026-05-26 04:45:34'),
(2233, 24, '22852', 'Xã Ninh Hải', 'ninh_hai', '2026-05-26 04:45:34'),
(2234, 24, '22861', 'Xã Xuân Hải', 'xuan_hai', '2026-05-26 04:45:34'),
(2235, 24, '22870', 'Xã Ninh Phước', 'ninh_phuoc', '2026-05-26 04:45:34'),
(2236, 24, '22873', 'Xã Phước Hậu', 'phuoc_hau', '2026-05-26 04:45:34'),
(2237, 24, '22888', 'Xã Phước Dinh', 'phuoc_dinh', '2026-05-26 04:45:34'),
(2238, 24, '22891', 'Xã Phước Hữu', 'phuoc_huu', '2026-05-26 04:45:34'),
(2239, 24, '22897', 'Xã Thuận Nam', 'thuan_nam', '2026-05-26 04:45:34'),
(2240, 24, '22900', 'Xã Phước Hà', 'phuoc_ha', '2026-05-26 04:45:34'),
(2241, 24, '22909', 'Xã Cà Ná', 'ca_na', '2026-05-26 04:45:34'),
(2242, 25, '22015', 'Phường Tuy Hòa', 'tuy_hoa', '2026-05-26 04:45:34'),
(2243, 25, '22045', 'Phường Bình Kiến', 'binh_kien', '2026-05-26 04:45:34'),
(2244, 25, '22051', 'Phường Sông Cầu', 'song_cau', '2026-05-26 04:45:34'),
(2245, 25, '22057', 'Xã Xuân Lộc', 'xuan_loc', '2026-05-26 04:45:34'),
(2246, 25, '22060', 'Xã Xuân Cảnh', 'xuan_canh', '2026-05-26 04:45:34'),
(2247, 25, '22075', 'Xã Xuân Thọ', 'xuan_tho', '2026-05-26 04:45:34'),
(2248, 25, '22076', 'Phường Xuân Đài', 'xuan_dai', '2026-05-26 04:45:34'),
(2249, 25, '22081', 'Xã Đồng Xuân', 'dong_xuan', '2026-05-26 04:45:34'),
(2250, 25, '22090', 'Xã Xuân Lãnh', 'xuan_lanh', '2026-05-26 04:45:34'),
(2251, 25, '22096', 'Xã Phú Mỡ', 'phu_mo', '2026-05-26 04:45:34'),
(2252, 25, '22111', 'Xã Xuân Phước', 'xuan_phuoc', '2026-05-26 04:45:34'),
(2253, 25, '22114', 'Xã Tuy An Bắc', 'tuy_an_bac', '2026-05-26 04:45:34'),
(2254, 25, '22120', 'Xã Tuy An Đông', 'tuy_an_dong', '2026-05-26 04:45:34'),
(2255, 25, '22132', 'Xã Tuy An Tây', 'tuy_an_tay', '2026-05-26 04:45:34'),
(2256, 25, '22147', 'Xã Ô Loan', 'o_loan', '2026-05-26 04:45:34'),
(2257, 25, '22153', 'Xã Tuy An Nam', 'tuy_an_nam', '2026-05-26 04:45:34'),
(2258, 25, '22165', 'Xã Sơn Hòa', 'son_hoa', '2026-05-26 04:45:34'),
(2259, 25, '22171', 'Xã Tây Sơn', 'tay_son', '2026-05-26 04:45:34'),
(2260, 25, '22177', 'Xã Vân Hòa', 'van_hoa', '2026-05-26 04:45:34'),
(2261, 25, '22192', 'Xã Suối Trai', 'suoi_trai', '2026-05-26 04:45:34'),
(2262, 25, '22207', 'Xã Sông Hinh', 'song_hinh', '2026-05-26 04:45:34'),
(2263, 25, '22222', 'Xã Đức Bình', 'duc_binh', '2026-05-26 04:45:34'),
(2264, 25, '22225', 'Xã Ea Bá', 'ea_ba', '2026-05-26 04:45:34'),
(2265, 25, '22237', 'Xã Ea Ly', 'ea_ly', '2026-05-26 04:45:34'),
(2266, 25, '22240', 'Phường Phú Yên', 'phu_yen', '2026-05-26 04:45:34'),
(2267, 25, '22250', 'Xã Sơn Thành', 'son_thanh', '2026-05-26 04:45:34'),
(2268, 25, '22255', 'Xã Tây Hòa', 'tay_hoa', '2026-05-26 04:45:34'),
(2269, 25, '22258', 'Phường Đông Hòa', 'dong_hoa', '2026-05-26 04:45:34'),
(2270, 25, '22261', 'Phường Hòa Hiệp', 'hoa_hiep', '2026-05-26 04:45:34'),
(2271, 25, '22276', 'Xã Hòa Thịnh', 'hoa_thinh', '2026-05-26 04:45:34'),
(2272, 25, '22285', 'Xã Hòa Mỹ', 'hoa_my', '2026-05-26 04:45:34'),
(2273, 25, '22291', 'Xã Hòa Xuân', 'hoa_xuan', '2026-05-26 04:45:34'),
(2274, 25, '22303', 'Xã Phú Hòa 2', 'phu_hoa_2', '2026-05-26 04:45:34'),
(2275, 25, '22319', 'Xã Phú Hòa 1', 'phu_hoa_1', '2026-05-26 04:45:34'),
(2276, 25, '24121', 'Phường Tân Lập', 'tan_lap', '2026-05-26 04:45:34'),
(2277, 25, '24133', 'Phường Buôn Ma Thuột', 'buon_ma_thuot', '2026-05-26 04:45:34'),
(2278, 25, '24154', 'Phường Thành Nhất', 'thanh_nhat', '2026-05-26 04:45:34'),
(2279, 25, '24163', 'Phường Tân An', 'tan_an', '2026-05-26 04:45:34'),
(2280, 25, '24169', 'Phường Ea Kao', 'ea_kao', '2026-05-26 04:45:34'),
(2281, 25, '24175', 'Xã Hòa Phú', 'hoa_phu', '2026-05-26 04:45:34'),
(2282, 25, '24181', 'Xã Ea Drăng', 'ea_drang', '2026-05-26 04:45:34'),
(2283, 25, '24184', 'Xã Ea H’Leo', 'ea_hleo', '2026-05-26 04:45:34'),
(2284, 25, '24187', 'Xã Ea Hiao', 'ea_hiao', '2026-05-26 04:45:34'),
(2285, 25, '24193', 'Xã Ea Wy', 'ea_wy', '2026-05-26 04:45:34'),
(2286, 25, '24208', 'Xã Ea Khăl', 'ea_khal', '2026-05-26 04:45:34'),
(2287, 25, '24211', 'Xã Ea Súp', 'ea_sup', '2026-05-26 04:45:34'),
(2288, 25, '24214', 'Xã Ia Lốp', 'ia_lop', '2026-05-26 04:45:34'),
(2289, 25, '24217', 'Xã Ea Rốk', 'ea_rok', '2026-05-26 04:45:34'),
(2290, 25, '24221', 'Xã Ia Rvê', 'ia_rve', '2026-05-26 04:45:34'),
(2291, 25, '24229', 'Xã Ea Bung', 'ea_bung', '2026-05-26 04:45:34'),
(2292, 25, '24235', 'Xã Buôn Đôn', 'buon_don', '2026-05-26 04:45:34'),
(2293, 25, '24241', 'Xã Ea Wer', 'ea_wer', '2026-05-26 04:45:34'),
(2294, 25, '24250', 'Xã Ea Nuôl', 'ea_nuol', '2026-05-26 04:45:34'),
(2295, 25, '24259', 'Xã Quảng Phú', 'quang_phu', '2026-05-26 04:45:34'),
(2296, 25, '24265', 'Xã Ea Kiết', 'ea_kiet', '2026-05-26 04:45:34'),
(2297, 25, '24277', 'Xã Ea Tul', 'ea_tul', '2026-05-26 04:45:34'),
(2298, 25, '24280', 'Xã Cư M’gar', 'cu_mgar', '2026-05-26 04:45:34'),
(2299, 25, '24286', 'Xã Ea M’Droh', 'ea_mdroh', '2026-05-26 04:45:34'),
(2300, 25, '24301', 'Xã Cuôr Đăng', 'cuor_dang', '2026-05-26 04:45:34'),
(2301, 25, '24305', 'Phường Buôn Hồ', 'buon_ho', '2026-05-26 04:45:34'),
(2302, 25, '24310', 'Xã Krông Búk', 'krong_buk', '2026-05-26 04:45:34'),
(2303, 25, '24313', 'Xã Cư Pơng', 'cu_pong', '2026-05-26 04:45:34'),
(2304, 25, '24316', 'Xã Pơng Drang', 'pong_drang', '2026-05-26 04:45:34'),
(2305, 25, '24328', 'Xã Ea Drông', 'ea_drong', '2026-05-26 04:45:34'),
(2306, 25, '24340', 'Phường Cư Bao', 'cu_bao', '2026-05-26 04:45:34'),
(2307, 25, '24343', 'Xã Krông Năng', 'krong_nang', '2026-05-26 04:45:34'),
(2308, 25, '24346', 'Xã Dliê Ya', 'dlie_ya', '2026-05-26 04:45:34'),
(2309, 25, '24352', 'Xã Tam Giang', 'tam_giang', '2026-05-26 04:45:34'),
(2310, 25, '24364', 'Xã Phú Xuân', 'phu_xuan', '2026-05-26 04:45:34'),
(2311, 25, '24373', 'Xã Ea Kar', 'ea_kar', '2026-05-26 04:45:34'),
(2312, 25, '24376', 'Xã Ea Knốp', 'ea_knop', '2026-05-26 04:45:34'),
(2313, 25, '24400', 'Xã Ea Păl', 'ea_pal', '2026-05-26 04:45:34'),
(2314, 25, '24403', 'Xã Ea Ô', 'ea_o', '2026-05-26 04:45:34'),
(2315, 25, '24406', 'Xã Cư Yang', 'cu_yang', '2026-05-26 04:45:34'),
(2316, 25, '24412', 'Xã M’Drắk', 'mdrak', '2026-05-26 04:45:34'),
(2317, 25, '24415', 'Xã Cư Prao', 'cu_prao', '2026-05-26 04:45:34'),
(2318, 25, '24433', 'Xã Ea Riêng', 'ea_rieng', '2026-05-26 04:45:34'),
(2319, 25, '24436', 'Xã Cư M’ta', 'cu_mta', '2026-05-26 04:45:34'),
(2320, 25, '24444', 'Xã Krông Á', 'krong_a', '2026-05-26 04:45:34'),
(2321, 25, '24445', 'Xã Ea Trang', 'ea_trang', '2026-05-26 04:45:34'),
(2322, 25, '24448', 'Xã Krông Bông', 'krong_bong', '2026-05-26 04:45:34'),
(2323, 25, '24454', 'Xã Dang Kang', 'dang_kang', '2026-05-26 04:45:34'),
(2324, 25, '24472', 'Xã Hòa Sơn', 'hoa_son', '2026-05-26 04:45:34'),
(2325, 25, '24478', 'Xã Cư Pui', 'cu_pui', '2026-05-26 04:45:34'),
(2326, 25, '24484', 'Xã Yang Mao', 'yang_mao', '2026-05-26 04:45:34'),
(2327, 25, '24490', 'Xã Krông Pắc', 'krong_pac', '2026-05-26 04:45:34'),
(2328, 25, '24496', 'Xã Ea Kly', 'ea_kly', '2026-05-26 04:45:34'),
(2329, 25, '24502', 'Xã Ea Phê', 'ea_phe', '2026-05-26 04:45:34'),
(2330, 25, '24505', 'Xã Ea Knuếc', 'ea_knuec', '2026-05-26 04:45:34'),
(2331, 25, '24526', 'Xã Tân Tiến', 'tan_tien', '2026-05-26 04:45:34'),
(2332, 25, '24529', 'Xã Vụ Bổn', 'vu_bon', '2026-05-26 04:45:34'),
(2333, 25, '24538', 'Xã Krông Ana', 'krong_ana', '2026-05-26 04:45:34'),
(2334, 25, '24540', 'Xã Ea Ning', 'ea_ning', '2026-05-26 04:45:34'),
(2335, 25, '24544', 'Xã Ea Ktur', 'ea_ktur', '2026-05-26 04:45:34'),
(2336, 25, '24559', 'Xã Ea Na', 'ea_na', '2026-05-26 04:45:34'),
(2337, 25, '24561', 'Xã Dray Bhăng', 'dray_bhang', '2026-05-26 04:45:34'),
(2338, 25, '24568', 'Xã Dur Kmăl', 'dur_kmal', '2026-05-26 04:45:34'),
(2339, 25, '24580', 'Xã Liên Sơn Lắk', 'lien_son_lak', '2026-05-26 04:45:34'),
(2340, 25, '24595', 'Xã Đắk Liêng', 'dak_lieng', '2026-05-26 04:45:34'),
(2341, 25, '24598', 'Xã Đắk Phơi', 'dak_phoi', '2026-05-26 04:45:34'),
(2342, 25, '24604', 'Xã Krông Nô', 'krong_no', '2026-05-26 04:45:34'),
(2343, 25, '24607', 'Xã Nam Ka', 'nam_ka', '2026-05-26 04:45:34'),
(2344, 26, '22918', 'Phường Mũi Né', 'mui_ne', '2026-05-26 04:45:34'),
(2345, 26, '22924', 'Phường Phú Thuỷ', 'phu_thuy', '2026-05-26 04:45:34'),
(2346, 26, '22933', 'Phường Hàm Thắng', 'ham_thang', '2026-05-26 04:45:34'),
(2347, 26, '22945', 'Phường Phan Thiết', 'phan_thiet', '2026-05-26 04:45:34'),
(2348, 26, '22954', 'Phường Tiến Thành', 'tien_thanh', '2026-05-26 04:45:34'),
(2349, 26, '22960', 'Phường Bình Thuận', 'binh_thuan', '2026-05-26 04:45:34'),
(2350, 26, '22963', 'Xã Tuyên Quang', 'tuyen_quang', '2026-05-26 04:45:34'),
(2351, 26, '22969', 'Xã Liên Hương', 'lien_huong', '2026-05-26 04:45:34'),
(2352, 26, '22972', 'Xã Phan Rí Cửa', 'phan_ri_cua', '2026-05-26 04:45:34'),
(2353, 26, '22978', 'Xã Tuy Phong', 'tuy_phong', '2026-05-26 04:45:34'),
(2354, 26, '22981', 'Xã Vĩnh Hảo', 'vinh_hao', '2026-05-26 04:45:34'),
(2355, 26, '23005', 'Xã Bắc Bình', 'bac_binh', '2026-05-26 04:45:34'),
(2356, 26, '23008', 'Xã Phan Sơn', 'phan_son', '2026-05-26 04:45:34'),
(2357, 26, '23020', 'Xã Hải Ninh', 'hai_ninh', '2026-05-26 04:45:34'),
(2358, 26, '23023', 'Xã Sông Lũy', 'song_luy', '2026-05-26 04:45:34'),
(2359, 26, '23032', 'Xã Lương Sơn', 'luong_son', '2026-05-26 04:45:34'),
(2360, 26, '23041', 'Xã Hồng Thái', 'hong_thai', '2026-05-26 04:45:34'),
(2361, 26, '23053', 'Xã Hòa Thắng', 'hoa_thang', '2026-05-26 04:45:34'),
(2362, 26, '23059', 'Xã Hàm Thuận', 'ham_thuan', '2026-05-26 04:45:34'),
(2363, 26, '23065', 'Xã La Dạ', 'la_da', '2026-05-26 04:45:34'),
(2364, 26, '23074', 'Xã Đông Giang', 'dong_giang', '2026-05-26 04:45:34'),
(2365, 26, '23086', 'Xã Hồng Sơn', 'hong_son', '2026-05-26 04:45:34'),
(2366, 26, '23089', 'Xã Hàm Thuận Bắc', 'ham_thuan_bac', '2026-05-26 04:45:34'),
(2367, 26, '23095', 'Xã Hàm Liêm', 'ham_liem', '2026-05-26 04:45:34'),
(2368, 26, '23110', 'Xã Hàm Thuận Nam', 'ham_thuan_nam', '2026-05-26 04:45:34'),
(2369, 26, '23122', 'Xã Hàm Thạnh', 'ham_thanh', '2026-05-26 04:45:34'),
(2370, 26, '23128', 'Xã Hàm Kiệm', 'ham_kiem', '2026-05-26 04:45:34'),
(2371, 26, '23134', 'Xã Tân Lập', 'tan_lap', '2026-05-26 04:45:34'),
(2372, 26, '23143', 'Xã Tân Thành', 'tan_thanh', '2026-05-26 04:45:34'),
(2373, 26, '23149', 'Xã Tánh Linh', 'tanh_linh', '2026-05-26 04:45:34'),
(2374, 26, '23152', 'Xã Bắc Ruộng', 'bac_ruong', '2026-05-26 04:45:34'),
(2375, 26, '23158', 'Xã Nghị Đức', 'nghi_duc', '2026-05-26 04:45:34'),
(2376, 26, '23173', 'Xã Đồng Kho', 'dong_kho', '2026-05-26 04:45:34'),
(2377, 26, '23188', 'Xã Suối Kiết', 'suoi_kiet', '2026-05-26 04:45:34'),
(2378, 26, '23191', 'Xã Đức Linh', 'duc_linh', '2026-05-26 04:45:34'),
(2379, 26, '23194', 'Xã Hoài Đức', 'hoai_duc', '2026-05-26 04:45:34'),
(2380, 26, '23200', 'Xã Nam Thành', 'nam_thanh', '2026-05-26 04:45:34'),
(2381, 26, '23227', 'Xã Trà Tân', 'tra_tan', '2026-05-26 04:45:34'),
(2382, 26, '23230', 'Xã Tân Minh', 'tan_minh', '2026-05-26 04:45:34'),
(2383, 26, '23231', 'Phường Phước Hội', 'phuoc_hoi', '2026-05-26 04:45:34'),
(2384, 26, '23235', 'Phường La Gi', 'la_gi', '2026-05-26 04:45:34'),
(2385, 26, '23236', 'Xã Hàm Tân', 'ham_tan', '2026-05-26 04:45:34'),
(2386, 26, '23246', 'Xã Tân Hải', 'tan_hai', '2026-05-26 04:45:34'),
(2387, 26, '23266', 'Xã Sơn Mỹ', 'son_my', '2026-05-26 04:45:34'),
(2388, 26, '23272', 'Đặc khu Phú Quý', 'phu_quy', '2026-05-26 04:45:34'),
(2389, 26, '24611', 'Phường Bắc Gia Nghĩa', 'bac_gia_nghia', '2026-05-26 04:45:34'),
(2390, 26, '24615', 'Phường Nam Gia Nghĩa', 'nam_gia_nghia', '2026-05-26 04:45:34'),
(2391, 26, '24616', 'Xã Quảng Sơn', 'quang_son', '2026-05-26 04:45:34'),
(2392, 26, '24617', 'Phường Đông Gia Nghĩa', 'dong_gia_nghia', '2026-05-26 04:45:34'),
(2393, 26, '24620', 'Xã Quảng Hòa', 'quang_hoa', '2026-05-26 04:45:34'),
(2394, 26, '24631', 'Xã Quảng Khê', 'quang_khe', '2026-05-26 04:45:34'),
(2395, 26, '24637', 'Xã Tà Đùng', 'ta_dung', '2026-05-26 04:45:34'),
(2396, 26, '24640', 'Xã Cư Jút', 'cu_jut', '2026-05-26 04:45:34'),
(2397, 26, '24646', 'Xã Đắk Wil', 'dak_wil', '2026-05-26 04:45:34'),
(2398, 26, '24649', 'Xã Nam Dong', 'nam_dong', '2026-05-26 04:45:34'),
(2399, 26, '24664', 'Xã Đức Lập', 'duc_lap', '2026-05-26 04:45:34'),
(2400, 26, '24670', 'Xã Đắk Mil', 'dak_mil', '2026-05-26 04:45:34'),
(2401, 26, '24678', 'Xã Đắk Sắk', 'dak_sak', '2026-05-26 04:45:34'),
(2402, 26, '24682', 'Xã Thuận An', 'thuan_an', '2026-05-26 04:45:34'),
(2403, 26, '24688', 'Xã Krông Nô', 'krong_no', '2026-05-26 04:45:34'),
(2404, 26, '24697', 'Xã Nam Đà', 'nam_da', '2026-05-26 04:45:34'),
(2405, 26, '24703', 'Xã Nâm Nung', 'nam_nung', '2026-05-26 04:45:34'),
(2406, 26, '24712', 'Xã Quảng Phú', 'quang_phu', '2026-05-26 04:45:34'),
(2407, 26, '24717', 'Xã Đức An', 'duc_an', '2026-05-26 04:45:34'),
(2408, 26, '24718', 'Xã Đắk Song', 'dak_song', '2026-05-26 04:45:34'),
(2409, 26, '24722', 'Xã Thuận Hạnh', 'thuan_hanh', '2026-05-26 04:45:34'),
(2410, 26, '24730', 'Xã Trường Xuân', 'truong_xuan', '2026-05-26 04:45:34'),
(2411, 26, '24733', 'Xã Kiến Đức', 'kien_duc', '2026-05-26 04:45:34'),
(2412, 26, '24736', 'Xã Quảng Trực', 'quang_truc', '2026-05-26 04:45:34'),
(2413, 26, '24739', 'Xã Tuy Đức', 'tuy_duc', '2026-05-26 04:45:34'),
(2414, 26, '24748', 'Xã Quảng Tân', 'quang_tan', '2026-05-26 04:45:34'),
(2415, 26, '24751', 'Xã Nhân Cơ', 'nhan_co', '2026-05-26 04:45:34'),
(2416, 26, '24760', 'Xã Quảng Tín', 'quang_tin', '2026-05-26 04:45:34'),
(2417, 26, '24778', 'Phường Lâm Viên - Đà Lạt', 'lam_vien_da_lat', '2026-05-26 04:45:34'),
(2418, 26, '24781', 'Phường Xuân Hương - Đà Lạt', 'xuan_huong_da_lat', '2026-05-26 04:45:34'),
(2419, 26, '24787', 'Phường Cam Ly - Đà Lạt', 'cam_ly_da_lat', '2026-05-26 04:45:34'),
(2420, 26, '24805', 'Phường Xuân Trường - Đà Lạt', 'xuan_truong_da_lat', '2026-05-26 04:45:34'),
(2421, 26, '24820', 'Phường 2 Bảo Lộc', '2_bao_loc', '2026-05-26 04:45:34'),
(2422, 26, '24823', 'Phường 1 Bảo Lộc', '1_bao_loc', '2026-05-26 04:45:34'),
(2423, 26, '24829', 'Phường B’Lao', 'blao', '2026-05-26 04:45:34'),
(2424, 26, '24841', 'Phường 3 Bảo Lộc', '3_bao_loc', '2026-05-26 04:45:34'),
(2425, 26, '24846', 'Phường Lang Biang - Đà Lạt', 'lang_biang_da_lat', '2026-05-26 04:45:34'),
(2426, 26, '24848', 'Xã Lạc Dương', 'lac_duong', '2026-05-26 04:45:34'),
(2427, 26, '24853', 'Xã Đam Rông 4', 'dam_rong_4', '2026-05-26 04:45:34'),
(2428, 26, '24868', 'Xã Nam Ban Lâm Hà', 'nam_ban_lam_ha', '2026-05-26 04:45:34'),
(2429, 26, '24871', 'Xã Đinh Văn Lâm Hà', 'dinh_van_lam_ha', '2026-05-26 04:45:34'),
(2430, 26, '24875', 'Xã Đam Rông 3', 'dam_rong_3', '2026-05-26 04:45:34'),
(2431, 26, '24877', 'Xã Đam Rông 2', 'dam_rong_2', '2026-05-26 04:45:34'),
(2432, 26, '24883', 'Xã Nam Hà Lâm Hà', 'nam_ha_lam_ha', '2026-05-26 04:45:34'),
(2433, 26, '24886', 'Xã Đam Rông 1', 'dam_rong_1', '2026-05-26 04:45:34'),
(2434, 26, '24895', 'Xã Phú Sơn Lâm Hà', 'phu_son_lam_ha', '2026-05-26 04:45:34'),
(2435, 26, '24907', 'Xã Phúc Thọ Lâm Hà', 'phuc_tho_lam_ha', '2026-05-26 04:45:34'),
(2436, 26, '24916', 'Xã Tân Hà Lâm Hà', 'tan_ha_lam_ha', '2026-05-26 04:45:34'),
(2437, 26, '24931', 'Xã Đơn Dương', 'don_duong', '2026-05-26 04:45:34'),
(2438, 26, '24934', 'Xã D’Ran', 'dran', '2026-05-26 04:45:34'),
(2439, 26, '24943', 'Xã Ka Đô', 'ka_do', '2026-05-26 04:45:34'),
(2440, 26, '24955', 'Xã Quảng Lập', 'quang_lap', '2026-05-26 04:45:34'),
(2441, 26, '24958', 'Xã Đức Trọng', 'duc_trong', '2026-05-26 04:45:34'),
(2442, 26, '24967', 'Xã Hiệp Thạnh', 'hiep_thanh', '2026-05-26 04:45:34'),
(2443, 26, '24976', 'Xã Tân Hội', 'tan_hoi', '2026-05-26 04:45:34'),
(2444, 26, '24985', 'Xã Ninh Gia', 'ninh_gia', '2026-05-26 04:45:34'),
(2445, 26, '24988', 'Xã Tà Năng', 'ta_nang', '2026-05-26 04:45:34'),
(2446, 26, '24991', 'Xã Tà Hine', 'ta_hine', '2026-05-26 04:45:34'),
(2447, 26, '25000', 'Xã Di Linh', 'di_linh', '2026-05-26 04:45:34'),
(2448, 26, '25007', 'Xã Đinh Trang Thượng', 'dinh_trang_thuong', '2026-05-26 04:45:34'),
(2449, 26, '25015', 'Xã Gia Hiệp', 'gia_hiep', '2026-05-26 04:45:34'),
(2450, 26, '25018', 'Xã Bảo Thuận', 'bao_thuan', '2026-05-26 04:45:34'),
(2451, 26, '25036', 'Xã Hòa Ninh', 'hoa_ninh', '2026-05-26 04:45:34'),
(2452, 26, '25042', 'Xã Hòa Bắc', 'hoa_bac', '2026-05-26 04:45:34'),
(2453, 26, '25051', 'Xã Sơn Điền', 'son_dien', '2026-05-26 04:45:34'),
(2454, 26, '25054', 'Xã Bảo Lâm 1', 'bao_lam_1', '2026-05-26 04:45:34'),
(2455, 26, '25057', 'Xã Bảo Lâm 5', 'bao_lam_5', '2026-05-26 04:45:34'),
(2456, 26, '25063', 'Xã Bảo Lâm 4', 'bao_lam_4', '2026-05-26 04:45:34'),
(2457, 26, '25084', 'Xã Bảo Lâm 2', 'bao_lam_2', '2026-05-26 04:45:34'),
(2458, 26, '25093', 'Xã Bảo Lâm 3', 'bao_lam_3', '2026-05-26 04:45:34'),
(2459, 26, '25099', 'Xã Đạ Huoai', 'da_huoai', '2026-05-26 04:45:34'),
(2460, 26, '25105', 'Xã Đạ Huoai 2', 'da_huoai_2', '2026-05-26 04:45:34'),
(2461, 26, '25114', 'Xã Đạ Huoai 3', 'da_huoai_3', '2026-05-26 04:45:34'),
(2462, 26, '25126', 'Xã Đạ Tẻh', 'da_teh', '2026-05-26 04:45:34'),
(2463, 26, '25135', 'Xã Đạ Tẻh 3', 'da_teh_3', '2026-05-26 04:45:34'),
(2464, 26, '25138', 'Xã Đạ Tẻh 2', 'da_teh_2', '2026-05-26 04:45:34'),
(2465, 26, '25159', 'Xã Cát Tiên', 'cat_tien', '2026-05-26 04:45:34'),
(2466, 26, '25162', 'Xã Cát Tiên 3', 'cat_tien_3', '2026-05-26 04:45:34'),
(2467, 26, '25180', 'Xã Cát Tiên 2', 'cat_tien_2', '2026-05-26 04:45:34'),
(2468, 27, '25195', 'Phường Bình Phước', 'binh_phuoc', '2026-05-26 04:45:34'),
(2469, 27, '25210', 'Phường Đồng Xoài', 'dong_xoai', '2026-05-26 04:45:34'),
(2470, 27, '25217', 'Phường Phước Long', 'phuoc_long', '2026-05-26 04:45:34'),
(2471, 27, '25220', 'Phường Phước Bình', 'phuoc_binh', '2026-05-26 04:45:34'),
(2472, 27, '25222', 'Xã Bù Gia Mập', 'bu_gia_map', '2026-05-26 04:45:34'),
(2473, 27, '25225', 'Xã Đăk Ơ', 'dak_o', '2026-05-26 04:45:34'),
(2474, 27, '25231', 'Xã Đa Kia', 'da_kia', '2026-05-26 04:45:34'),
(2475, 27, '25246', 'Xã Bình Tân', 'binh_tan', '2026-05-26 04:45:34'),
(2476, 27, '25252', 'Xã Phú Riềng', 'phu_rieng', '2026-05-26 04:45:34'),
(2477, 27, '25255', 'Xã Long Hà', 'long_ha', '2026-05-26 04:45:34'),
(2478, 27, '25261', 'Xã Phú Trung', 'phu_trung', '2026-05-26 04:45:34'),
(2479, 27, '25267', 'Xã Phú Nghĩa', 'phu_nghia', '2026-05-26 04:45:34'),
(2480, 27, '25270', 'Xã Lộc Ninh', 'loc_ninh', '2026-05-26 04:45:34'),
(2481, 27, '25279', 'Xã Lộc Tấn', 'loc_tan', '2026-05-26 04:45:34'),
(2482, 27, '25280', 'Xã Lộc Thạnh', 'loc_thanh', '2026-05-26 04:45:34'),
(2483, 27, '25292', 'Xã Lộc Quang', 'loc_quang', '2026-05-26 04:45:34'),
(2484, 27, '25294', 'Xã Lộc Thành', 'loc_thanh', '2026-05-26 04:45:34'),
(2485, 27, '25303', 'Xã Lộc Hưng', 'loc_hung', '2026-05-26 04:45:34'),
(2486, 27, '25308', 'Xã Thiện Hưng', 'thien_hung', '2026-05-26 04:45:34'),
(2487, 27, '25309', 'Xã Hưng Phước', 'hung_phuoc', '2026-05-26 04:45:34'),
(2488, 27, '25318', 'Xã Tân Tiến', 'tan_tien', '2026-05-26 04:45:34'),
(2489, 27, '25326', 'Phường Bình Long', 'binh_long', '2026-05-26 04:45:34'),
(2490, 27, '25333', 'Phường An Lộc', 'an_loc', '2026-05-26 04:45:34'),
(2491, 27, '25345', 'Xã Tân Hưng', 'tan_hung', '2026-05-26 04:45:34'),
(2492, 27, '25349', 'Xã Minh Đức', 'minh_duc', '2026-05-26 04:45:34'),
(2493, 27, '25351', 'Xã Tân Quan', 'tan_quan', '2026-05-26 04:45:34'),
(2494, 27, '25357', 'Xã Tân Khai', 'tan_khai', '2026-05-26 04:45:34'),
(2495, 27, '25363', 'Xã Đồng Phú', 'dong_phu', '2026-05-26 04:45:34'),
(2496, 27, '25378', 'Xã Tân Lợi', 'tan_loi', '2026-05-26 04:45:34'),
(2497, 27, '25387', 'Xã Thuận Lợi', 'thuan_loi', '2026-05-26 04:45:34'),
(2498, 27, '25390', 'Xã Đồng Tâm', 'dong_tam', '2026-05-26 04:45:34'),
(2499, 27, '25396', 'Xã Bù Đăng', 'bu_dang', '2026-05-26 04:45:34'),
(2500, 27, '25399', 'Xã Đak Nhau', 'dak_nhau', '2026-05-26 04:45:34'),
(2501, 27, '25402', 'Xã Thọ Sơn', 'tho_son', '2026-05-26 04:45:34'),
(2502, 27, '25405', 'Xã Bom Bo', 'bom_bo', '2026-05-26 04:45:34'),
(2503, 27, '25417', 'Xã Nghĩa Trung', 'nghia_trung', '2026-05-26 04:45:34'),
(2504, 27, '25420', 'Xã Phước Sơn', 'phuoc_son', '2026-05-26 04:45:34'),
(2505, 27, '25432', 'Phường Chơn Thành', 'chon_thanh', '2026-05-26 04:45:34'),
(2506, 27, '25441', 'Phường Minh Hưng', 'minh_hung', '2026-05-26 04:45:34'),
(2507, 27, '25450', 'Xã Nha Bích', 'nha_bich', '2026-05-26 04:45:34'),
(2508, 27, '25993', 'Phường Trảng Dài', 'trang_dai', '2026-05-26 04:45:34'),
(2509, 27, '26005', 'Phường Hố Nai', 'ho_nai', '2026-05-26 04:45:34'),
(2510, 27, '26017', 'Phường Tam Hiệp', 'tam_hiep', '2026-05-26 04:45:34'),
(2511, 27, '26020', 'Phường Long Bình', 'long_binh', '2026-05-26 04:45:34'),
(2512, 27, '26041', 'Phường Trấn Biên', 'tran_bien', '2026-05-26 04:45:34'),
(2513, 27, '26068', 'Phường Biên Hòa', 'bien_hoa', '2026-05-26 04:45:34'),
(2514, 27, '26080', 'Phường Long Khánh', 'long_khanh', '2026-05-26 04:45:34'),
(2515, 27, '26089', 'Phường Bình Lộc', 'binh_loc', '2026-05-26 04:45:34'),
(2516, 27, '26098', 'Phường Bảo Vinh', 'bao_vinh', '2026-05-26 04:45:34'),
(2517, 27, '26104', 'Phường Xuân Lập', 'xuan_lap', '2026-05-26 04:45:34'),
(2518, 27, '26113', 'Phường Hàng Gòn', 'hang_gon', '2026-05-26 04:45:34'),
(2519, 27, '26116', 'Xã Tân Phú', 'tan_phu', '2026-05-26 04:45:34'),
(2520, 27, '26119', 'Xã Đak Lua', 'dak_lua', '2026-05-26 04:45:34'),
(2521, 27, '26122', 'Xã Nam Cát Tiên', 'nam_cat_tien', '2026-05-26 04:45:34'),
(2522, 27, '26134', 'Xã Tà Lài', 'ta_lai', '2026-05-26 04:45:34'),
(2523, 27, '26158', 'Xã Phú Lâm', 'phu_lam', '2026-05-26 04:45:34'),
(2524, 27, '26170', 'Xã Trị An', 'tri_an', '2026-05-26 04:45:34'),
(2525, 27, '26173', 'Xã Phú Lý', 'phu_ly', '2026-05-26 04:45:34'),
(2526, 27, '26179', 'Xã Tân An', 'tan_an', '2026-05-26 04:45:34'),
(2527, 27, '26188', 'Phường Tân Triều', 'tan_trieu', '2026-05-26 04:45:34'),
(2528, 27, '26206', 'Xã Định Quán', 'dinh_quan', '2026-05-26 04:45:34'),
(2529, 27, '26209', 'Xã Thanh Sơn', 'thanh_son', '2026-05-26 04:45:34'),
(2530, 27, '26215', 'Xã Phú Vinh', 'phu_vinh', '2026-05-26 04:45:34'),
(2531, 27, '26221', 'Xã Phú Hòa', 'phu_hoa', '2026-05-26 04:45:34'),
(2532, 27, '26227', 'Xã La Ngà', 'la_nga', '2026-05-26 04:45:34'),
(2533, 27, '26248', 'Xã Trảng Bom', 'trang_bom', '2026-05-26 04:45:34'),
(2534, 27, '26254', 'Xã Bàu Hàm', 'bau_ham', '2026-05-26 04:45:34'),
(2535, 27, '26278', 'Xã Bình Minh', 'binh_minh', '2026-05-26 04:45:34'),
(2536, 27, '26281', 'Xã Hưng Thịnh', 'hung_thinh', '2026-05-26 04:45:34'),
(2537, 27, '26296', 'Xã An Viễn', 'an_vien', '2026-05-26 04:45:34'),
(2538, 27, '26299', 'Xã Thống Nhất', 'thong_nhat', '2026-05-26 04:45:34'),
(2539, 27, '26311', 'Xã Gia Kiệm', 'gia_kiem', '2026-05-26 04:45:34'),
(2540, 27, '26326', 'Xã Dầu Giây', 'dau_giay', '2026-05-26 04:45:34'),
(2541, 27, '26332', 'Xã Xuân Quế', 'xuan_que', '2026-05-26 04:45:34'),
(2542, 27, '26341', 'Xã Cẩm Mỹ', 'cam_my', '2026-05-26 04:45:34'),
(2543, 27, '26347', 'Xã Xuân Đường', 'xuan_duong', '2026-05-26 04:45:34'),
(2544, 27, '26359', 'Xã Xuân Đông', 'xuan_dong', '2026-05-26 04:45:34'),
(2545, 27, '26362', 'Xã Sông Ray', 'song_ray', '2026-05-26 04:45:34'),
(2546, 27, '26368', 'Xã Long Thành', 'long_thanh', '2026-05-26 04:45:34'),
(2547, 27, '26374', 'Phường Tam Phước', 'tam_phuoc', '2026-05-26 04:45:34'),
(2548, 27, '26377', 'Phường Phước Tân', 'phuoc_tan', '2026-05-26 04:45:34'),
(2549, 27, '26380', 'Phường Long Hưng', 'long_hung', '2026-05-26 04:45:34'),
(2550, 27, '26383', 'Xã An Phước', 'an_phuoc', '2026-05-26 04:45:34'),
(2551, 27, '26389', 'Xã Bình An', 'binh_an', '2026-05-26 04:45:34'),
(2552, 27, '26413', 'Xã Long Phước', 'long_phuoc', '2026-05-26 04:45:34'),
(2553, 27, '26422', 'Xã Phước Thái', 'phuoc_thai', '2026-05-26 04:45:34'),
(2554, 27, '26425', 'Xã Xuân Lộc', 'xuan_loc', '2026-05-26 04:45:34'),
(2555, 27, '26428', 'Xã Xuân Bắc', 'xuan_bac', '2026-05-26 04:45:34'),
(2556, 27, '26434', 'Xã Xuân Thành', 'xuan_thanh', '2026-05-26 04:45:34'),
(2557, 27, '26446', 'Xã Xuân Hòa', 'xuan_hoa', '2026-05-26 04:45:34'),
(2558, 27, '26458', 'Xã Xuân Phú', 'xuan_phu', '2026-05-26 04:45:34'),
(2559, 27, '26461', 'Xã Xuân Định', 'xuan_dinh', '2026-05-26 04:45:34'),
(2560, 27, '26485', 'Xã Nhơn Trạch', 'nhon_trach', '2026-05-26 04:45:34'),
(2561, 27, '26491', 'Xã Đại Phước', 'dai_phuoc', '2026-05-26 04:45:34'),
(2562, 27, '26503', 'Xã Phước An', 'phuoc_an', '2026-05-26 04:45:34'),
(2563, 28, '25747', 'Phường Thủ Dầu Một', 'thu_dau_mot', '2026-05-26 04:45:34'),
(2564, 28, '25750', 'Phường Phú Lợi', 'phu_loi', '2026-05-26 04:45:34'),
(2565, 28, '25760', 'Phường Bình Dương', 'binh_duong', '2026-05-26 04:45:34'),
(2566, 28, '25768', 'Phường Phú An', 'phu_an', '2026-05-26 04:45:34'),
(2567, 28, '25771', 'Phường Chánh Hiệp', 'chanh_hiep', '2026-05-26 04:45:34'),
(2568, 28, '25777', 'Xã Dầu Tiếng', 'dau_tieng', '2026-05-26 04:45:34'),
(2569, 28, '25780', 'Xã Minh Thạnh', 'minh_thanh', '2026-05-26 04:45:34'),
(2570, 28, '25792', 'Xã Long Hòa', 'long_hoa', '2026-05-26 04:45:34'),
(2571, 28, '25807', 'Xã Thanh An', 'thanh_an', '2026-05-26 04:45:34'),
(2572, 28, '25813', 'Phường Bến Cát', 'ben_cat', '2026-05-26 04:45:34'),
(2573, 28, '25819', 'Xã Trừ Văn Thố', 'tru_van_tho', '2026-05-26 04:45:34'),
(2574, 28, '25822', 'Xã Bàu Bàng', 'bau_bang', '2026-05-26 04:45:34'),
(2575, 28, '25837', 'Phường Chánh Phú Hòa', 'chanh_phu_hoa', '2026-05-26 04:45:34'),
(2576, 28, '25840', 'Phường Long Nguyên', 'long_nguyen', '2026-05-26 04:45:34'),
(2577, 28, '25843', 'Phường Tây Nam', 'tay_nam', '2026-05-26 04:45:34'),
(2578, 28, '25846', 'Phường Thới Hòa', 'thoi_hoa', '2026-05-26 04:45:34'),
(2579, 28, '25849', 'Phường Hòa Lợi', 'hoa_loi', '2026-05-26 04:45:34'),
(2580, 28, '25858', 'Xã Phú Giáo', 'phu_giao', '2026-05-26 04:45:34'),
(2581, 28, '25864', 'Xã Phước Thành', 'phuoc_thanh', '2026-05-26 04:45:34'),
(2582, 28, '25867', 'Xã An Long', 'an_long', '2026-05-26 04:45:34'),
(2583, 28, '25882', 'Xã Phước Hòa', 'phuoc_hoa', '2026-05-26 04:45:34'),
(2584, 28, '25888', 'Phường Tân Uyên', 'tan_uyen', '2026-05-26 04:45:34'),
(2585, 28, '25891', 'Phường Tân Khánh', 'tan_khanh', '2026-05-26 04:45:34'),
(2586, 28, '25906', 'Xã Bắc Tân Uyên', 'bac_tan_uyen', '2026-05-26 04:45:34'),
(2587, 28, '25909', 'Xã Thường Tân', 'thuong_tan', '2026-05-26 04:45:34'),
(2588, 28, '25912', 'Phường Vĩnh Tân', 'vinh_tan', '2026-05-26 04:45:34'),
(2589, 28, '25915', 'Phường Bình Cơ', 'binh_co', '2026-05-26 04:45:34'),
(2590, 28, '25920', 'Phường Tân Hiệp', 'tan_hiep', '2026-05-26 04:45:34'),
(2591, 28, '25942', 'Phường Dĩ An', 'di_an', '2026-05-26 04:45:34'),
(2592, 28, '25945', 'Phường Tân Đông Hiệp', 'tan_dong_hiep', '2026-05-26 04:45:34'),
(2593, 28, '25951', 'Phường Đông Hòa', 'dong_hoa', '2026-05-26 04:45:34'),
(2594, 28, '25966', 'Phường Lái Thiêu', 'lai_thieu', '2026-05-26 04:45:34'),
(2595, 28, '25969', 'Phường Thuận Giao', 'thuan_giao', '2026-05-26 04:45:34'),
(2596, 28, '25975', 'Phường An Phú', 'an_phu', '2026-05-26 04:45:34'),
(2597, 28, '25978', 'Phường Thuận An', 'thuan_an', '2026-05-26 04:45:34'),
(2598, 28, '25987', 'Phường Bình Hòa', 'binh_hoa', '2026-05-26 04:45:34'),
(2599, 28, '26506', 'Phường Vũng Tàu', 'vung_tau', '2026-05-26 04:45:34'),
(2600, 28, '26526', 'Phường Tam Thắng', 'tam_thang', '2026-05-26 04:45:34'),
(2601, 28, '26536', 'Phường Rạch Dừa', 'rach_dua', '2026-05-26 04:45:34'),
(2602, 28, '26542', 'Phường Phước Thắng', 'phuoc_thang', '2026-05-26 04:45:34'),
(2603, 28, '26545', 'Xã Long Sơn', 'long_son', '2026-05-26 04:45:34'),
(2604, 28, '26560', 'Phường Bà Rịa', 'ba_ria', '2026-05-26 04:45:34'),
(2605, 28, '26566', 'Phường Long Hương', 'long_huong', '2026-05-26 04:45:34'),
(2606, 28, '26572', 'Phường Tam Long', 'tam_long', '2026-05-26 04:45:34'),
(2607, 28, '26575', 'Xã Ngãi Giao', 'ngai_giao', '2026-05-26 04:45:34'),
(2608, 28, '26584', 'Xã Xuân Sơn', 'xuan_son', '2026-05-26 04:45:34'),
(2609, 28, '26590', 'Xã Bình Giã', 'binh_gia', '2026-05-26 04:45:34'),
(2610, 28, '26596', 'Xã Châu Đức', 'chau_duc', '2026-05-26 04:45:34'),
(2611, 28, '26608', 'Xã Kim Long', 'kim_long', '2026-05-26 04:45:34'),
(2612, 28, '26617', 'Xã Nghĩa Thành', 'nghia_thanh', '2026-05-26 04:45:34'),
(2613, 28, '26620', 'Xã Hồ Tràm', 'ho_tram', '2026-05-26 04:45:34'),
(2614, 28, '26632', 'Xã Xuyên Mộc', 'xuyen_moc', '2026-05-26 04:45:34'),
(2615, 28, '26638', 'Xã Bàu Lâm', 'bau_lam', '2026-05-26 04:45:34'),
(2616, 28, '26641', 'Xã Hòa Hội', 'hoa_hoi', '2026-05-26 04:45:34'),
(2617, 28, '26647', 'Xã Hòa Hiệp', 'hoa_hiep', '2026-05-26 04:45:34'),
(2618, 28, '26656', 'Xã Bình Châu', 'binh_chau', '2026-05-26 04:45:34'),
(2619, 28, '26659', 'Xã Long Điền', 'long_dien', '2026-05-26 04:45:34'),
(2620, 28, '26662', 'Xã Long Hải', 'long_hai', '2026-05-26 04:45:34'),
(2621, 28, '26680', 'Xã Đất Đỏ', 'dat_do', '2026-05-26 04:45:34'),
(2622, 28, '26686', 'Xã Phước Hải', 'phuoc_hai', '2026-05-26 04:45:34'),
(2623, 28, '26704', 'Phường Phú Mỹ', 'phu_my', '2026-05-26 04:45:34'),
(2624, 28, '26710', 'Phường Tân Hải', 'tan_hai', '2026-05-26 04:45:34'),
(2625, 28, '26713', 'Phường Tân Phước', 'tan_phuoc', '2026-05-26 04:45:34'),
(2626, 28, '26725', 'Phường Tân Thành', 'tan_thanh', '2026-05-26 04:45:34'),
(2627, 28, '26728', 'Xã Châu Pha', 'chau_pha', '2026-05-26 04:45:34'),
(2628, 28, '26732', 'Đặc khu Côn Đảo', 'con_dao', '2026-05-26 04:45:34'),
(2629, 28, '26737', 'Phường Tân Định', 'tan_dinh', '2026-05-26 04:45:34'),
(2630, 28, '26740', 'Phường Sài Gòn', 'sai_gon', '2026-05-26 04:45:34'),
(2631, 28, '26743', 'Phường Bến Thành', 'ben_thanh', '2026-05-26 04:45:34'),
(2632, 28, '26758', 'Phường Cầu Ông Lãnh', 'cau_ong_lanh', '2026-05-26 04:45:34'),
(2633, 28, '26767', 'Phường An Phú Đông', 'an_phu_dong', '2026-05-26 04:45:34'),
(2634, 28, '26773', 'Phường Thới An', 'thoi_an', '2026-05-26 04:45:34'),
(2635, 28, '26782', 'Phường Tân Thới Hiệp', 'tan_thoi_hiep', '2026-05-26 04:45:34'),
(2636, 28, '26785', 'Phường Trung Mỹ Tây', 'trung_my_tay', '2026-05-26 04:45:34'),
(2637, 28, '26791', 'Phường Đông Hưng Thuận', 'dong_hung_thuan', '2026-05-26 04:45:34'),
(2638, 28, '26800', 'Phường Linh Xuân', 'linh_xuan', '2026-05-26 04:45:34'),
(2639, 28, '26803', 'Phường Tam Bình', 'tam_binh', '2026-05-26 04:45:34'),
(2640, 28, '26809', 'Phường Hiệp Bình', 'hiep_binh', '2026-05-26 04:45:34'),
(2641, 28, '26824', 'Phường Thủ Đức', 'thu_duc', '2026-05-26 04:45:34'),
(2642, 28, '26833', 'Phường Long Bình', 'long_binh', '2026-05-26 04:45:34'),
(2643, 28, '26842', 'Phường Tăng Nhơn Phú', 'tang_nhon_phu', '2026-05-26 04:45:34'),
(2644, 28, '26848', 'Phường Phước Long', 'phuoc_long', '2026-05-26 04:45:34'),
(2645, 28, '26857', 'Phường Long Phước', 'long_phuoc', '2026-05-26 04:45:34'),
(2646, 28, '26860', 'Phường Long Trường', 'long_truong', '2026-05-26 04:45:34'),
(2647, 28, '26876', 'Phường An Nhơn', 'an_nhon', '2026-05-26 04:45:34'),
(2648, 28, '26878', 'Phường An Hội Đông', 'an_hoi_dong', '2026-05-26 04:45:34'),
(2649, 28, '26882', 'Phường An Hội Tây', 'an_hoi_tay', '2026-05-26 04:45:34'),
(2650, 28, '26884', 'Phường Gò Vấp', 'go_vap', '2026-05-26 04:45:34'),
(2651, 28, '26890', 'Phường Hạnh Thông', 'hanh_thong', '2026-05-26 04:45:34'),
(2652, 28, '26898', 'Phường Thông Tây Hội', 'thong_tay_hoi', '2026-05-26 04:45:34'),
(2653, 28, '26905', 'Phường Bình Lợi Trung', 'binh_loi_trung', '2026-05-26 04:45:34'),
(2654, 28, '26911', 'Phường Bình Quới', 'binh_quoi', '2026-05-26 04:45:34'),
(2655, 28, '26929', 'Phường Bình Thạnh', 'binh_thanh', '2026-05-26 04:45:34'),
(2656, 28, '26944', 'Phường Gia Định', 'gia_dinh', '2026-05-26 04:45:34'),
(2657, 28, '26956', 'Phường Thạnh Mỹ Tây', 'thanh_my_tay', '2026-05-26 04:45:34'),
(2658, 28, '26968', 'Phường Tân Sơn Nhất', 'tan_son_nhat', '2026-05-26 04:45:34'),
(2659, 28, '26977', 'Phường Tân Sơn Hòa', 'tan_son_hoa', '2026-05-26 04:45:34'),
(2660, 28, '26983', 'Phường Bảy Hiền', 'bay_hien', '2026-05-26 04:45:34'),
(2661, 28, '26995', 'Phường Tân Hòa', 'tan_hoa', '2026-05-26 04:45:34'),
(2662, 28, '27004', 'Phường Tân Bình', 'tan_binh', '2026-05-26 04:45:34'),
(2663, 28, '27007', 'Phường Tân Sơn', 'tan_son', '2026-05-26 04:45:34'),
(2664, 28, '27013', 'Phường Tây Thạnh', 'tay_thanh', '2026-05-26 04:45:34'),
(2665, 28, '27019', 'Phường Tân Sơn Nhì', 'tan_son_nhi', '2026-05-26 04:45:34'),
(2666, 28, '27022', 'Phường Phú Thọ Hòa', 'phu_tho_hoa', '2026-05-26 04:45:34'),
(2667, 28, '27028', 'Phường Phú Thạnh', 'phu_thanh', '2026-05-26 04:45:34'),
(2668, 28, '27031', 'Phường Tân Phú', 'tan_phu', '2026-05-26 04:45:34'),
(2669, 28, '27043', 'Phường Đức Nhuận', 'duc_nhuan', '2026-05-26 04:45:34'),
(2670, 28, '27058', 'Phường Cầu Kiệu', 'cau_kieu', '2026-05-26 04:45:34'),
(2671, 28, '27073', 'Phường Phú Nhuận', 'phu_nhuan', '2026-05-26 04:45:34'),
(2672, 28, '27094', 'Phường An Khánh', 'an_khanh', '2026-05-26 04:45:34'),
(2673, 28, '27097', 'Phường Bình Trưng', 'binh_trung', '2026-05-26 04:45:34'),
(2674, 28, '27112', 'Phường Cát Lái', 'cat_lai', '2026-05-26 04:45:34'),
(2675, 28, '27139', 'Phường Xuân Hòa', 'xuan_hoa', '2026-05-26 04:45:34'),
(2676, 28, '27142', 'Phường Nhiêu Lộc', 'nhieu_loc', '2026-05-26 04:45:34'),
(2677, 28, '27154', 'Phường Bàn Cờ', 'ban_co', '2026-05-26 04:45:34'),
(2678, 28, '27163', 'Phường Hòa Hưng', 'hoa_hung', '2026-05-26 04:45:34'),
(2679, 28, '27169', 'Phường Diên Hồng', 'dien_hong', '2026-05-26 04:45:34'),
(2680, 28, '27190', 'Phường Vườn Lài', 'vuon_lai', '2026-05-26 04:45:34'),
(2681, 28, '27211', 'Phường Hòa Bình', 'hoa_binh', '2026-05-26 04:45:34'),
(2682, 28, '27226', 'Phường Phú Thọ', 'phu_tho', '2026-05-26 04:45:34'),
(2683, 28, '27232', 'Phường Bình Thới', 'binh_thoi', '2026-05-26 04:45:34'),
(2684, 28, '27238', 'Phường Minh Phụng', 'minh_phung', '2026-05-26 04:45:34'),
(2685, 28, '27259', 'Phường Xóm Chiếu', 'xom_chieu', '2026-05-26 04:45:34'),
(2686, 28, '27265', 'Phường Khánh Hội', 'khanh_hoi', '2026-05-26 04:45:34'),
(2687, 28, '27286', 'Phường Vĩnh Hội', 'vinh_hoi', '2026-05-26 04:45:34'),
(2688, 28, '27301', 'Phường Chợ Quán', 'cho_quan', '2026-05-26 04:45:34'),
(2689, 28, '27316', 'Phường An Đông', 'an_dong', '2026-05-26 04:45:34'),
(2690, 28, '27343', 'Phường Chợ Lớn', 'cho_lon', '2026-05-26 04:45:34'),
(2691, 28, '27349', 'Phường Phú Lâm', 'phu_lam', '2026-05-26 04:45:34'),
(2692, 28, '27364', 'Phường Bình Phú', 'binh_phu', '2026-05-26 04:45:34'),
(2693, 28, '27367', 'Phường Bình Tây', 'binh_tay', '2026-05-26 04:45:34'),
(2694, 28, '27373', 'Phường Bình Tiên', 'binh_tien', '2026-05-26 04:45:34'),
(2695, 28, '27418', 'Phường Chánh Hưng', 'chanh_hung', '2026-05-26 04:45:34'),
(2696, 28, '27424', 'Phường Bình Đông', 'binh_dong', '2026-05-26 04:45:34'),
(2697, 28, '27427', 'Phường Phú Định', 'phu_dinh', '2026-05-26 04:45:34'),
(2698, 28, '27439', 'Phường Bình Hưng Hòa', 'binh_hung_hoa', '2026-05-26 04:45:34'),
(2699, 28, '27442', 'Phường Bình Tân', 'binh_tan', '2026-05-26 04:45:34'),
(2700, 28, '27448', 'Phường Bình Trị Đông', 'binh_tri_dong', '2026-05-26 04:45:34'),
(2701, 28, '27457', 'Phường Tân Tạo', 'tan_tao', '2026-05-26 04:45:34'),
(2702, 28, '27460', 'Phường An Lạc', 'an_lac', '2026-05-26 04:45:34'),
(2703, 28, '27475', 'Phường Tân Hưng', 'tan_hung', '2026-05-26 04:45:34'),
(2704, 28, '27478', 'Phường Tân Thuận', 'tan_thuan', '2026-05-26 04:45:34'),
(2705, 28, '27484', 'Phường Phú Thuận', 'phu_thuan', '2026-05-26 04:45:34'),
(2706, 28, '27487', 'Phường Tân Mỹ', 'tan_my', '2026-05-26 04:45:34'),
(2707, 28, '27496', 'Xã Tân An Hội', 'tan_an_hoi', '2026-05-26 04:45:34'),
(2708, 28, '27508', 'Xã An Nhơn Tây', 'an_nhon_tay', '2026-05-26 04:45:34'),
(2709, 28, '27511', 'Xã Nhuận Đức', 'nhuan_duc', '2026-05-26 04:45:34'),
(2710, 28, '27526', 'Xã Thái Mỹ', 'thai_my', '2026-05-26 04:45:34'),
(2711, 28, '27541', 'Xã Phú Hòa Đông', 'phu_hoa_dong', '2026-05-26 04:45:34'),
(2712, 28, '27544', 'Xã Bình Mỹ', 'binh_my', '2026-05-26 04:45:34'),
(2713, 28, '27553', 'Xã Củ Chi', 'cu_chi', '2026-05-26 04:45:34'),
(2714, 28, '27559', 'Xã Hóc Môn', 'hoc_mon', '2026-05-26 04:45:34'),
(2715, 28, '27568', 'Xã Đông Thạnh', 'dong_thanh', '2026-05-26 04:45:34'),
(2716, 28, '27577', 'Xã Xuân Thới Sơn', 'xuan_thoi_son', '2026-05-26 04:45:34'),
(2717, 28, '27592', 'Xã Bà Điểm', 'ba_diem', '2026-05-26 04:45:34'),
(2718, 28, '27595', 'Xã Tân Nhựt', 'tan_nhut', '2026-05-26 04:45:34'),
(2719, 28, '27601', 'Xã Vĩnh Lộc', 'vinh_loc', '2026-05-26 04:45:34'),
(2720, 28, '27604', 'Xã Tân Vĩnh Lộc', 'tan_vinh_loc', '2026-05-26 04:45:34'),
(2721, 28, '27610', 'Xã Bình Lợi', 'binh_loi', '2026-05-26 04:45:34'),
(2722, 28, '27619', 'Xã Bình Hưng', 'binh_hung', '2026-05-26 04:45:34'),
(2723, 28, '27628', 'Xã Hưng Long', 'hung_long', '2026-05-26 04:45:34'),
(2724, 28, '27637', 'Xã Bình Chánh', 'binh_chanh', '2026-05-26 04:45:34'),
(2725, 28, '27655', 'Xã Nhà Bè', 'nha_be', '2026-05-26 04:45:34'),
(2726, 28, '27658', 'Xã Hiệp Phước', 'hiep_phuoc', '2026-05-26 04:45:34'),
(2727, 28, '27664', 'Xã Cần Giờ', 'can_gio', '2026-05-26 04:45:34'),
(2728, 28, '27667', 'Xã Bình Khánh', 'binh_khanh', '2026-05-26 04:45:34'),
(2729, 28, '27673', 'Xã An Thới Đông', 'an_thoi_dong', '2026-05-26 04:45:34'),
(2730, 28, '27676', 'Xã Thạnh An', 'thanh_an', '2026-05-26 04:45:34'),
(2731, 29, '25459', 'Phường Tân Ninh', 'tan_ninh', '2026-05-26 04:45:34'),
(2732, 29, '25480', 'Phường Bình Minh', 'binh_minh', '2026-05-26 04:45:34'),
(2733, 29, '25486', 'Xã Tân Biên', 'tan_bien', '2026-05-26 04:45:34'),
(2734, 29, '25489', 'Xã Tân Lập', 'tan_lap', '2026-05-26 04:45:34'),
(2735, 29, '25498', 'Xã Thạnh Bình', 'thanh_binh', '2026-05-26 04:45:34'),
(2736, 29, '25510', 'Xã Trà Vong', 'tra_vong', '2026-05-26 04:45:34'),
(2737, 29, '25516', 'Xã Tân Châu', 'tan_chau', '2026-05-26 04:45:34'),
(2738, 29, '25522', 'Xã Tân Đông', 'tan_dong', '2026-05-26 04:45:34'),
(2739, 29, '25525', 'Xã Tân Hội', 'tan_hoi', '2026-05-26 04:45:34'),
(2740, 29, '25531', 'Xã Tân Hòa', 'tan_hoa', '2026-05-26 04:45:34'),
(2741, 29, '25534', 'Xã Tân Thành', 'tan_thanh', '2026-05-26 04:45:34'),
(2742, 29, '25549', 'Xã Tân Phú', 'tan_phu', '2026-05-26 04:45:34'),
(2743, 29, '25552', 'Xã Dương Minh Châu', 'duong_minh_chau', '2026-05-26 04:45:34'),
(2744, 29, '25567', 'Phường Ninh Thạnh', 'ninh_thanh', '2026-05-26 04:45:34'),
(2745, 29, '25573', 'Xã Cầu Khởi', 'cau_khoi', '2026-05-26 04:45:34'),
(2746, 29, '25579', 'Xã Lộc Ninh', 'loc_ninh', '2026-05-26 04:45:34'),
(2747, 29, '25585', 'Xã Châu Thành', 'chau_thanh', '2026-05-26 04:45:34'),
(2748, 29, '25588', 'Xã Hảo Đước', 'hao_duoc', '2026-05-26 04:45:34'),
(2749, 29, '25591', 'Xã Phước Vinh', 'phuoc_vinh', '2026-05-26 04:45:34'),
(2750, 29, '25606', 'Xã Hòa Hội', 'hoa_hoi', '2026-05-26 04:45:34'),
(2751, 29, '25621', 'Xã Ninh Điền', 'ninh_dien', '2026-05-26 04:45:34'),
(2752, 29, '25630', 'Phường Long Hoa', 'long_hoa', '2026-05-26 04:45:34'),
(2753, 29, '25633', 'Phường Thanh Điền', 'thanh_dien', '2026-05-26 04:45:34'),
(2754, 29, '25645', 'Phường Hòa Thành', 'hoa_thanh', '2026-05-26 04:45:34'),
(2755, 29, '25654', 'Phường Gò Dầu', 'go_dau', '2026-05-26 04:45:34'),
(2756, 29, '25657', 'Xã Thạnh Đức', 'thanh_duc', '2026-05-26 04:45:34'),
(2757, 29, '25663', 'Xã Phước Thạnh', 'phuoc_thanh', '2026-05-26 04:45:34'),
(2758, 29, '25666', 'Xã Truông Mít', 'truong_mit', '2026-05-26 04:45:34'),
(2759, 29, '25672', 'Phường Gia Lộc', 'gia_loc', '2026-05-26 04:45:34'),
(2760, 29, '25681', 'Xã Bến Cầu', 'ben_cau', '2026-05-26 04:45:34'),
(2761, 29, '25684', 'Xã Long Chữ', 'long_chu', '2026-05-26 04:45:34'),
(2762, 29, '25702', 'Xã Long Thuận', 'long_thuan', '2026-05-26 04:45:34'),
(2763, 29, '25708', 'Phường Trảng Bàng', 'trang_bang', '2026-05-26 04:45:34'),
(2764, 29, '25711', 'Xã Hưng Thuận', 'hung_thuan', '2026-05-26 04:45:34'),
(2765, 29, '25729', 'Xã Phước Chỉ', 'phuoc_chi', '2026-05-26 04:45:34'),
(2766, 29, '25732', 'Phường An Tịnh', 'an_tinh', '2026-05-26 04:45:34'),
(2767, 29, '27694', 'Phường Long An', 'long_an', '2026-05-26 04:45:34'),
(2768, 29, '27712', 'Phường Tân An', 'tan_an', '2026-05-26 04:45:34'),
(2769, 29, '27715', 'Phường Khánh Hậu', 'khanh_hau', '2026-05-26 04:45:34'),
(2770, 29, '27721', 'Xã Tân Hưng', 'tan_hung', '2026-05-26 04:45:34'),
(2771, 29, '27727', 'Xã Hưng Điền', 'hung_dien', '2026-05-26 04:45:34'),
(2772, 29, '27736', 'Xã Vĩnh Thạnh', 'vinh_thanh', '2026-05-26 04:45:34'),
(2773, 29, '27748', 'Xã Vĩnh Châu', 'vinh_chau', '2026-05-26 04:45:34'),
(2774, 29, '27757', 'Xã Vĩnh Hưng', 'vinh_hung', '2026-05-26 04:45:34'),
(2775, 29, '27763', 'Xã Khánh Hưng', 'khanh_hung', '2026-05-26 04:45:34'),
(2776, 29, '27775', 'Xã Tuyên Bình', 'tuyen_binh', '2026-05-26 04:45:34'),
(2777, 29, '27787', 'Phường Kiến Tường', 'kien_tuong', '2026-05-26 04:45:34'),
(2778, 29, '27793', 'Xã Bình Hiệp', 'binh_hiep', '2026-05-26 04:45:34'),
(2779, 29, '27811', 'Xã Bình Hòa', 'binh_hoa', '2026-05-26 04:45:34'),
(2780, 29, '27817', 'Xã Tuyên Thạnh', 'tuyen_thanh', '2026-05-26 04:45:34'),
(2781, 29, '27823', 'Xã Mộc Hóa', 'moc_hoa', '2026-05-26 04:45:34'),
(2782, 29, '27826', 'Xã Tân Thạnh', 'tan_thanh', '2026-05-26 04:45:34'),
(2783, 29, '27838', 'Xã Nhơn Hòa Lập', 'nhon_hoa_lap', '2026-05-26 04:45:34'),
(2784, 29, '27841', 'Xã Hậu Thạnh', 'hau_thanh', '2026-05-26 04:45:34'),
(2785, 29, '27856', 'Xã Nhơn Ninh', 'nhon_ninh', '2026-05-26 04:45:34'),
(2786, 29, '27865', 'Xã Thạnh Hóa', 'thanh_hoa', '2026-05-26 04:45:34'),
(2787, 29, '27868', 'Xã Bình Thành', 'binh_thanh', '2026-05-26 04:45:34'),
(2788, 29, '27877', 'Xã Thạnh Phước', 'thanh_phuoc', '2026-05-26 04:45:34'),
(2789, 29, '27889', 'Xã Tân Tây', 'tan_tay', '2026-05-26 04:45:34'),
(2790, 29, '27898', 'Xã Đông Thành', 'dong_thanh', '2026-05-26 04:45:34'),
(2791, 29, '27907', 'Xã Mỹ Quý', 'my_quy', '2026-05-26 04:45:34'),
(2792, 29, '27925', 'Xã Đức Huệ', 'duc_hue', '2026-05-26 04:45:34'),
(2793, 29, '27931', 'Xã Hậu Nghĩa', 'hau_nghia', '2026-05-26 04:45:34'),
(2794, 29, '27937', 'Xã Đức Hòa', 'duc_hoa', '2026-05-26 04:45:34'),
(2795, 29, '27943', 'Xã An Ninh', 'an_ninh', '2026-05-26 04:45:34'),
(2796, 29, '27952', 'Xã Hiệp Hòa', 'hiep_hoa', '2026-05-26 04:45:34'),
(2797, 29, '27964', 'Xã Đức Lập', 'duc_lap', '2026-05-26 04:45:34'),
(2798, 29, '27976', 'Xã Mỹ Hạnh', 'my_hanh', '2026-05-26 04:45:34'),
(2799, 29, '27979', 'Xã Hòa Khánh', 'hoa_khanh', '2026-05-26 04:45:34'),
(2800, 29, '27991', 'Xã Bến Lức', 'ben_luc', '2026-05-26 04:45:34'),
(2801, 29, '27994', 'Xã Thạnh Lợi', 'thanh_loi', '2026-05-26 04:45:34'),
(2802, 29, '28003', 'Xã Lương Hòa', 'luong_hoa', '2026-05-26 04:45:34'),
(2803, 29, '28015', 'Xã Bình Đức', 'binh_duc', '2026-05-26 04:45:34'),
(2804, 29, '28018', 'Xã Mỹ Yên', 'my_yen', '2026-05-26 04:45:34'),
(2805, 29, '28036', 'Xã Thủ Thừa', 'thu_thua', '2026-05-26 04:45:34'),
(2806, 29, '28051', 'Xã Mỹ Thạnh', 'my_thanh', '2026-05-26 04:45:34'),
(2807, 29, '28066', 'Xã Mỹ An', 'my_an', '2026-05-26 04:45:34'),
(2808, 29, '28072', 'Xã Tân Long', 'tan_long', '2026-05-26 04:45:34'),
(2809, 29, '28075', 'Xã Tân Trụ', 'tan_tru', '2026-05-26 04:45:34'),
(2810, 29, '28087', 'Xã Nhựt Tảo', 'nhut_tao', '2026-05-26 04:45:34'),
(2811, 29, '28093', 'Xã Vàm Cỏ', 'vam_co', '2026-05-26 04:45:34'),
(2812, 29, '28108', 'Xã Cần Đước', 'can_duoc', '2026-05-26 04:45:34'),
(2813, 29, '28114', 'Xã Rạch Kiến', 'rach_kien', '2026-05-26 04:45:34'),
(2814, 29, '28126', 'Xã Long Cang', 'long_cang', '2026-05-26 04:45:34'),
(2815, 29, '28132', 'Xã Mỹ Lệ', 'my_le', '2026-05-26 04:45:34'),
(2816, 29, '28138', 'Xã Tân Lân', 'tan_lan', '2026-05-26 04:45:34'),
(2817, 29, '28144', 'Xã Long Hựu', 'long_huu', '2026-05-26 04:45:34'),
(2818, 29, '28159', 'Xã Cần Giuộc', 'can_giuoc', '2026-05-26 04:45:34'),
(2819, 29, '28165', 'Xã Phước Lý', 'phuoc_ly', '2026-05-26 04:45:34'),
(2820, 29, '28177', 'Xã Mỹ Lộc', 'my_loc', '2026-05-26 04:45:34'),
(2821, 29, '28201', 'Xã Phước Vĩnh Tây', 'phuoc_vinh_tay', '2026-05-26 04:45:34'),
(2822, 29, '28207', 'Xã Tân Tập', 'tan_tap', '2026-05-26 04:45:34'),
(2823, 29, '28210', 'Xã Tầm Vu', 'tam_vu', '2026-05-26 04:45:34'),
(2824, 29, '28222', 'Xã Vĩnh Công', 'vinh_cong', '2026-05-26 04:45:34'),
(2825, 29, '28225', 'Xã Thuận Mỹ', 'thuan_my', '2026-05-26 04:45:34'),
(2826, 29, '28243', 'Xã An Lục Long', 'an_luc_long', '2026-05-26 04:45:34'),
(2827, 30, '28249', 'Phường Đạo Thạnh', 'dao_thanh', '2026-05-26 04:45:34'),
(2828, 30, '28261', 'Phường Mỹ Tho', 'my_tho', '2026-05-26 04:45:34'),
(2829, 30, '28270', 'Phường Thới Sơn', 'thoi_son', '2026-05-26 04:45:34'),
(2830, 30, '28273', 'Phường Mỹ Phong', 'my_phong', '2026-05-26 04:45:34'),
(2831, 30, '28285', 'Phường Trung An', 'trung_an', '2026-05-26 04:45:34'),
(2832, 30, '28297', 'Phường Long Thuận', 'long_thuan', '2026-05-26 04:45:34'),
(2833, 30, '28306', 'Phường Gò Công', 'go_cong', '2026-05-26 04:45:34'),
(2834, 30, '28315', 'Phường Bình Xuân', 'binh_xuan', '2026-05-26 04:45:34'),
(2835, 30, '28321', 'Xã Tân Phước 1', 'tan_phuoc_1', '2026-05-26 04:45:34'),
(2836, 30, '28327', 'Xã Tân Phước 2', 'tan_phuoc_2', '2026-05-26 04:45:34'),
(2837, 30, '28336', 'Xã Hưng Thạnh', 'hung_thanh', '2026-05-26 04:45:34'),
(2838, 30, '28345', 'Xã Tân Phước 3', 'tan_phuoc_3', '2026-05-26 04:45:34'),
(2839, 30, '28360', 'Xã Cái Bè', 'cai_be', '2026-05-26 04:45:34'),
(2840, 30, '28366', 'Xã Hậu Mỹ', 'hau_my', '2026-05-26 04:45:34'),
(2841, 30, '28378', 'Xã Mỹ Thiện', 'my_thien', '2026-05-26 04:45:34'),
(2842, 30, '28393', 'Xã Hội Cư', 'hoi_cu', '2026-05-26 04:45:34'),
(2843, 30, '28405', 'Xã Mỹ Đức Tây', 'my_duc_tay', '2026-05-26 04:45:34'),
(2844, 30, '28414', 'Xã Mỹ Lợi', 'my_loi', '2026-05-26 04:45:34'),
(2845, 30, '28426', 'Xã Thanh Hưng', 'thanh_hung', '2026-05-26 04:45:34');
INSERT INTO `hicrm_district` (`id`, `province_id`, `district_code`, `district_name`, `district_keyword`, `created_at`) VALUES
(2846, 30, '28429', 'Xã An Hữu', 'an_huu', '2026-05-26 04:45:34'),
(2847, 30, '28435', 'Phường Mỹ Phước Tây', 'my_phuoc_tay', '2026-05-26 04:45:34'),
(2848, 30, '28436', 'Phường Thanh Hòa', 'thanh_hoa', '2026-05-26 04:45:34'),
(2849, 30, '28439', 'Phường Cai Lậy', 'cai_lay', '2026-05-26 04:45:34'),
(2850, 30, '28444', 'Xã Thạnh Phú', 'thanh_phu', '2026-05-26 04:45:34'),
(2851, 30, '28456', 'Xã Mỹ Thành', 'my_thanh', '2026-05-26 04:45:34'),
(2852, 30, '28468', 'Xã Tân Phú', 'tan_phu', '2026-05-26 04:45:34'),
(2853, 30, '28471', 'Xã Bình Phú', 'binh_phu', '2026-05-26 04:45:34'),
(2854, 30, '28477', 'Phường Nhị Quý', 'nhi_quy', '2026-05-26 04:45:34'),
(2855, 30, '28501', 'Xã Hiệp Đức', 'hiep_duc', '2026-05-26 04:45:34'),
(2856, 30, '28504', 'Xã Long Tiên', 'long_tien', '2026-05-26 04:45:34'),
(2857, 30, '28516', 'Xã Ngũ Hiệp', 'ngu_hiep', '2026-05-26 04:45:34'),
(2858, 30, '28519', 'Xã Châu Thành', 'chau_thanh', '2026-05-26 04:45:34'),
(2859, 30, '28525', 'Xã Tân Hương', 'tan_huong', '2026-05-26 04:45:34'),
(2860, 30, '28537', 'Xã Long Hưng', 'long_hung', '2026-05-26 04:45:34'),
(2861, 30, '28543', 'Xã Long Định', 'long_dinh', '2026-05-26 04:45:34'),
(2862, 30, '28564', 'Xã Bình Trưng', 'binh_trung', '2026-05-26 04:45:34'),
(2863, 30, '28576', 'Xã Vĩnh Kim', 'vinh_kim', '2026-05-26 04:45:34'),
(2864, 30, '28582', 'Xã Kim Sơn', 'kim_son', '2026-05-26 04:45:34'),
(2865, 30, '28594', 'Xã Chợ Gạo', 'cho_gao', '2026-05-26 04:45:34'),
(2866, 30, '28603', 'Xã Mỹ Tịnh An', 'my_tinh_an', '2026-05-26 04:45:34'),
(2867, 30, '28615', 'Xã Lương Hòa Lạc', 'luong_hoa_lac', '2026-05-26 04:45:34'),
(2868, 30, '28627', 'Xã Tân Thuận Bình', 'tan_thuan_binh', '2026-05-26 04:45:34'),
(2869, 30, '28633', 'Xã An Thạnh Thủy', 'an_thanh_thuy', '2026-05-26 04:45:34'),
(2870, 30, '28648', 'Xã Bình Ninh', 'binh_ninh', '2026-05-26 04:45:34'),
(2871, 30, '28651', 'Xã Vĩnh Bình', 'vinh_binh', '2026-05-26 04:45:34'),
(2872, 30, '28660', 'Xã Đồng Sơn', 'dong_son', '2026-05-26 04:45:34'),
(2873, 30, '28663', 'Xã Phú Thành', 'phu_thanh', '2026-05-26 04:45:34'),
(2874, 30, '28678', 'Xã Vĩnh Hựu', 'vinh_huu', '2026-05-26 04:45:34'),
(2875, 30, '28687', 'Xã Long Bình', 'long_binh', '2026-05-26 04:45:34'),
(2876, 30, '28693', 'Xã Tân Thới', 'tan_thoi', '2026-05-26 04:45:34'),
(2877, 30, '28696', 'Xã Tân Phú Đông', 'tan_phu_dong', '2026-05-26 04:45:34'),
(2878, 30, '28702', 'Xã Tân Hòa', 'tan_hoa', '2026-05-26 04:45:34'),
(2879, 30, '28720', 'Xã Gia Thuận', 'gia_thuan', '2026-05-26 04:45:34'),
(2880, 30, '28723', 'Xã Tân Đông', 'tan_dong', '2026-05-26 04:45:34'),
(2881, 30, '28729', 'Phường Sơn Qui', 'son_qui', '2026-05-26 04:45:34'),
(2882, 30, '28738', 'Xã Tân Điền', 'tan_dien', '2026-05-26 04:45:34'),
(2883, 30, '28747', 'Xã Gò Công Đông', 'go_cong_dong', '2026-05-26 04:45:34'),
(2884, 30, '29869', 'Phường Cao Lãnh', 'cao_lanh', '2026-05-26 04:45:34'),
(2885, 30, '29884', 'Phường Mỹ Ngãi', 'my_ngai', '2026-05-26 04:45:34'),
(2886, 30, '29888', 'Phường Mỹ Trà', 'my_tra', '2026-05-26 04:45:34'),
(2887, 30, '29905', 'Phường Sa Đéc', 'sa_dec', '2026-05-26 04:45:34'),
(2888, 30, '29926', 'Xã Tân Hồng', 'tan_hong', '2026-05-26 04:45:34'),
(2889, 30, '29929', 'Xã Tân Hộ Cơ', 'tan_ho_co', '2026-05-26 04:45:34'),
(2890, 30, '29938', 'Xã Tân Thành', 'tan_thanh', '2026-05-26 04:45:34'),
(2891, 30, '29944', 'Xã An Phước', 'an_phuoc', '2026-05-26 04:45:34'),
(2892, 30, '29954', 'Phường An Bình', 'an_binh', '2026-05-26 04:45:34'),
(2893, 30, '29955', 'Phường Hồng Ngự', 'hong_ngu', '2026-05-26 04:45:34'),
(2894, 30, '29971', 'Xã Thường Phước', 'thuong_phuoc', '2026-05-26 04:45:34'),
(2895, 30, '29978', 'Phường Thường Lạc', 'thuong_lac', '2026-05-26 04:45:34'),
(2896, 30, '29983', 'Xã Long Khánh', 'long_khanh', '2026-05-26 04:45:34'),
(2897, 30, '29992', 'Xã Long Phú Thuận', 'long_phu_thuan', '2026-05-26 04:45:34'),
(2898, 30, '30001', 'Xã Tràm Chim', 'tram_chim', '2026-05-26 04:45:34'),
(2899, 30, '30010', 'Xã Tam Nông', 'tam_nong', '2026-05-26 04:45:34'),
(2900, 30, '30019', 'Xã An Hòa', 'an_hoa', '2026-05-26 04:45:34'),
(2901, 30, '30025', 'Xã Phú Cường', 'phu_cuong', '2026-05-26 04:45:34'),
(2902, 30, '30028', 'Xã An Long', 'an_long', '2026-05-26 04:45:34'),
(2903, 30, '30034', 'Xã Phú Thọ', 'phu_tho', '2026-05-26 04:45:34'),
(2904, 30, '30037', 'Xã Tháp Mười', 'thap_muoi', '2026-05-26 04:45:34'),
(2905, 30, '30043', 'Xã Phương Thịnh', 'thinh', '2026-05-26 04:45:34'),
(2906, 30, '30046', 'Xã Trường Xuân', 'truong_xuan', '2026-05-26 04:45:34'),
(2907, 30, '30055', 'Xã Mỹ Quí', 'my_qui', '2026-05-26 04:45:34'),
(2908, 30, '30061', 'Xã Đốc Binh Kiều', 'doc_binh_kieu', '2026-05-26 04:45:34'),
(2909, 30, '30073', 'Xã Thanh Mỹ', 'thanh_my', '2026-05-26 04:45:34'),
(2910, 30, '30076', 'Xã Mỹ Thọ', 'my_tho', '2026-05-26 04:45:34'),
(2911, 30, '30085', 'Xã Ba Sao', 'ba_sao', '2026-05-26 04:45:34'),
(2912, 30, '30088', 'Xã Phong Mỹ', 'phong_my', '2026-05-26 04:45:34'),
(2913, 30, '30112', 'Xã Mỹ Hiệp', 'my_hiep', '2026-05-26 04:45:34'),
(2914, 30, '30118', 'Xã Bình Hàng Trung', 'binh_hang_trung', '2026-05-26 04:45:34'),
(2915, 30, '30130', 'Xã Thanh Bình', 'thanh_binh', '2026-05-26 04:45:34'),
(2916, 30, '30154', 'Xã Tân Long', 'tan_long', '2026-05-26 04:45:34'),
(2917, 30, '30157', 'Xã Tân Thạnh', 'tan_thanh', '2026-05-26 04:45:34'),
(2918, 30, '30163', 'Xã Bình Thành', 'binh_thanh', '2026-05-26 04:45:34'),
(2919, 30, '30169', 'Xã Lấp Vò', 'lap_vo', '2026-05-26 04:45:34'),
(2920, 30, '30178', 'Xã Mỹ An Hưng', 'my_an_hung', '2026-05-26 04:45:34'),
(2921, 30, '30184', 'Xã Tân Khánh Trung', 'tan_khanh_trung', '2026-05-26 04:45:34'),
(2922, 30, '30208', 'Xã Hòa Long', 'hoa_long', '2026-05-26 04:45:34'),
(2923, 30, '30214', 'Xã Tân Dương', 'tan_duong', '2026-05-26 04:45:34'),
(2924, 30, '30226', 'Xã Lai Vung', 'lai_vung', '2026-05-26 04:45:34'),
(2925, 30, '30235', 'Xã Phong Hòa', 'phong_hoa', '2026-05-26 04:45:34'),
(2926, 30, '30244', 'Xã Phú Hựu', 'phu_huu', '2026-05-26 04:45:34'),
(2927, 30, '30253', 'Xã Tân Nhuận Đông', 'tan_nhuan_dong', '2026-05-26 04:45:34'),
(2928, 30, '30259', 'Xã Tân Phú Trung', 'tan_phu_trung', '2026-05-26 04:45:34'),
(2929, 31, '28756', 'Phường Phú Khương', 'phu_khuong', '2026-05-26 04:45:34'),
(2930, 31, '28777', 'Phường An Hội', 'an_hoi', '2026-05-26 04:45:34'),
(2931, 31, '28783', 'Phường Sơn Đông', 'son_dong', '2026-05-26 04:45:34'),
(2932, 31, '28789', 'Phường Bến Tre', 'ben_tre', '2026-05-26 04:45:34'),
(2933, 31, '28807', 'Xã Giao Long', 'giao_long', '2026-05-26 04:45:34'),
(2934, 31, '28810', 'Xã Phú Túc', 'phu_tuc', '2026-05-26 04:45:34'),
(2935, 31, '28840', 'Xã Tân Phú', 'tan_phu', '2026-05-26 04:45:34'),
(2936, 31, '28858', 'Phường Phú Tân', 'phu_tan', '2026-05-26 04:45:34'),
(2937, 31, '28861', 'Xã Tiên Thủy', 'tien_thuy', '2026-05-26 04:45:34'),
(2938, 31, '28870', 'Xã Chợ Lách', 'cho_lach', '2026-05-26 04:45:34'),
(2939, 31, '28879', 'Xã Phú Phụng', 'phu_phung', '2026-05-26 04:45:34'),
(2940, 31, '28894', 'Xã Vĩnh Thành', 'vinh_thanh', '2026-05-26 04:45:34'),
(2941, 31, '28901', 'Xã Hưng Khánh Trung', 'hung_khanh_trung', '2026-05-26 04:45:34'),
(2942, 31, '28903', 'Xã Mỏ Cày', 'mo_cay', '2026-05-26 04:45:34'),
(2943, 31, '28915', 'Xã Phước Mỹ Trung', 'phuoc_my_trung', '2026-05-26 04:45:34'),
(2944, 31, '28921', 'Xã Tân Thành Bình', 'tan_thanh_binh', '2026-05-26 04:45:34'),
(2945, 31, '28945', 'Xã Đồng Khởi', 'dong_khoi', '2026-05-26 04:45:34'),
(2946, 31, '28948', 'Xã Nhuận Phú Tân', 'nhuan_phu_tan', '2026-05-26 04:45:34'),
(2947, 31, '28957', 'Xã An Định', 'an_dinh', '2026-05-26 04:45:34'),
(2948, 31, '28969', 'Xã Thành Thới', 'thanh_thoi', '2026-05-26 04:45:34'),
(2949, 31, '28981', 'Xã Hương Mỹ', 'huong_my', '2026-05-26 04:45:34'),
(2950, 31, '28984', 'Xã Giồng Trôm', 'giong_trom', '2026-05-26 04:45:34'),
(2951, 31, '28987', 'Xã Lương Hòa', 'luong_hoa', '2026-05-26 04:45:34'),
(2952, 31, '28993', 'Xã Lương Phú', 'luong_phu', '2026-05-26 04:45:34'),
(2953, 31, '28996', 'Xã Châu Hòa', 'chau_hoa', '2026-05-26 04:45:34'),
(2954, 31, '29020', 'Xã Phước Long', 'phuoc_long', '2026-05-26 04:45:34'),
(2955, 31, '29029', 'Xã Tân Hào', 'tan_hao', '2026-05-26 04:45:34'),
(2956, 31, '29044', 'Xã Hưng Nhượng', 'hung_nhuong', '2026-05-26 04:45:34'),
(2957, 31, '29050', 'Xã Bình Đại', 'binh_dai', '2026-05-26 04:45:34'),
(2958, 31, '29062', 'Xã Phú Thuận', 'phu_thuan', '2026-05-26 04:45:34'),
(2959, 31, '29077', 'Xã Lộc Thuận', 'loc_thuan', '2026-05-26 04:45:34'),
(2960, 31, '29083', 'Xã Châu Hưng', 'chau_hung', '2026-05-26 04:45:34'),
(2961, 31, '29089', 'Xã Thạnh Trị', 'thanh_tri', '2026-05-26 04:45:34'),
(2962, 31, '29104', 'Xã Thạnh Phước', 'thanh_phuoc', '2026-05-26 04:45:34'),
(2963, 31, '29107', 'Xã Thới Thuận', 'thoi_thuan', '2026-05-26 04:45:34'),
(2964, 31, '29110', 'Xã Ba Tri', 'ba_tri', '2026-05-26 04:45:34'),
(2965, 31, '29122', 'Xã Mỹ Chánh Hòa', 'my_chanh_hoa', '2026-05-26 04:45:34'),
(2966, 31, '29125', 'Xã Bảo Thạnh', 'bao_thanh', '2026-05-26 04:45:34'),
(2967, 31, '29137', 'Xã Tân Xuân', 'tan_xuan', '2026-05-26 04:45:34'),
(2968, 31, '29143', 'Xã An Ngãi Trung', 'an_ngai_trung', '2026-05-26 04:45:34'),
(2969, 31, '29158', 'Xã An Hiệp', 'an_hiep', '2026-05-26 04:45:34'),
(2970, 31, '29167', 'Xã Tân Thủy', 'tan_thuy', '2026-05-26 04:45:34'),
(2971, 31, '29182', 'Xã Thạnh Phú', 'thanh_phu', '2026-05-26 04:45:34'),
(2972, 31, '29191', 'Xã Quới Điền', 'quoi_dien', '2026-05-26 04:45:34'),
(2973, 31, '29194', 'Xã Đại Điền', 'dai_dien', '2026-05-26 04:45:34'),
(2974, 31, '29221', 'Xã Thạnh Hải', 'thanh_hai', '2026-05-26 04:45:34'),
(2975, 31, '29224', 'Xã An Qui', 'an_qui', '2026-05-26 04:45:34'),
(2976, 31, '29227', 'Xã Thạnh Phong', 'thanh_phong', '2026-05-26 04:45:34'),
(2977, 31, '29242', 'Phường Trà Vinh', 'tra_vinh', '2026-05-26 04:45:34'),
(2978, 31, '29254', 'Phường Nguyệt Hóa', 'nguyet_hoa', '2026-05-26 04:45:34'),
(2979, 31, '29263', 'Phường Long Đức', 'long_duc', '2026-05-26 04:45:34'),
(2980, 31, '29266', 'Xã Càng Long', 'cang_long', '2026-05-26 04:45:34'),
(2981, 31, '29275', 'Xã An Trường', 'an_truong', '2026-05-26 04:45:34'),
(2982, 31, '29278', 'Xã Tân An', 'tan_an', '2026-05-26 04:45:34'),
(2983, 31, '29287', 'Xã Bình Phú', 'binh_phu', '2026-05-26 04:45:34'),
(2984, 31, '29302', 'Xã Nhị Long', 'nhi_long', '2026-05-26 04:45:34'),
(2985, 31, '29308', 'Xã Cầu Kè', 'cau_ke', '2026-05-26 04:45:34'),
(2986, 31, '29317', 'Xã An Phú Tân', 'an_phu_tan', '2026-05-26 04:45:34'),
(2987, 31, '29329', 'Xã Phong Thạnh', 'phong_thanh', '2026-05-26 04:45:34'),
(2988, 31, '29335', 'Xã Tam Ngãi', 'tam_ngai', '2026-05-26 04:45:34'),
(2989, 31, '29341', 'Xã Tiểu Cần', 'tieu_can', '2026-05-26 04:45:34'),
(2990, 31, '29362', 'Xã Hùng Hòa', 'hung_hoa', '2026-05-26 04:45:34'),
(2991, 31, '29365', 'Xã Tập Ngãi', 'tap_ngai', '2026-05-26 04:45:34'),
(2992, 31, '29371', 'Xã Tân Hòa', 'tan_hoa', '2026-05-26 04:45:34'),
(2993, 31, '29374', 'Xã Châu Thành', 'chau_thanh', '2026-05-26 04:45:34'),
(2994, 31, '29386', 'Xã Song Lộc', 'song_loc', '2026-05-26 04:45:34'),
(2995, 31, '29398', 'Phường Hòa Thuận', 'hoa_thuan', '2026-05-26 04:45:34'),
(2996, 31, '29407', 'Xã Hưng Mỹ', 'hung_my', '2026-05-26 04:45:34'),
(2997, 31, '29410', 'Xã Hòa Minh', 'hoa_minh', '2026-05-26 04:45:34'),
(2998, 31, '29413', 'Xã Long Hòa', 'long_hoa', '2026-05-26 04:45:34'),
(2999, 31, '29416', 'Xã Cầu Ngang', 'cau_ngang', '2026-05-26 04:45:34'),
(3000, 31, '29419', 'Xã Mỹ Long', 'my_long', '2026-05-26 04:45:34'),
(3001, 31, '29431', 'Xã Vinh Kim', 'vinh_kim', '2026-05-26 04:45:34'),
(3002, 31, '29446', 'Xã Nhị Trường', 'nhi_truong', '2026-05-26 04:45:34'),
(3003, 31, '29455', 'Xã Hiệp Mỹ', 'hiep_my', '2026-05-26 04:45:34'),
(3004, 31, '29461', 'Xã Trà Cú', 'tra_cu', '2026-05-26 04:45:34'),
(3005, 31, '29467', 'Xã Tập Sơn', 'tap_son', '2026-05-26 04:45:34'),
(3006, 31, '29476', 'Xã Lưu Nghiệp Anh', 'luu_nghiep_anh', '2026-05-26 04:45:34'),
(3007, 31, '29489', 'Xã Hàm Giang', 'ham_giang', '2026-05-26 04:45:34'),
(3008, 31, '29491', 'Xã Đại An', 'dai_an', '2026-05-26 04:45:34'),
(3009, 31, '29497', 'Xã Đôn Châu', 'don_chau', '2026-05-26 04:45:34'),
(3010, 31, '29506', 'Xã Long Hiệp', 'long_hiep', '2026-05-26 04:45:34'),
(3011, 31, '29512', 'Phường Duyên Hải', 'duyen_hai', '2026-05-26 04:45:34'),
(3012, 31, '29513', 'Xã Long Thành', 'long_thanh', '2026-05-26 04:45:34'),
(3013, 31, '29516', 'Phường Trường Long Hòa', 'truong_long_hoa', '2026-05-26 04:45:34'),
(3014, 31, '29518', 'Xã Long Hữu', 'long_huu', '2026-05-26 04:45:34'),
(3015, 31, '29530', 'Xã Ngũ Lạc', 'ngu_lac', '2026-05-26 04:45:34'),
(3016, 31, '29533', 'Xã Long Vĩnh', 'long_vinh', '2026-05-26 04:45:34'),
(3017, 31, '29536', 'Xã Đông Hải', 'dong_hai', '2026-05-26 04:45:34'),
(3018, 31, '29551', 'Phường Long Châu', 'long_chau', '2026-05-26 04:45:34'),
(3019, 31, '29557', 'Phường Phước Hậu', 'phuoc_hau', '2026-05-26 04:45:34'),
(3020, 31, '29566', 'Phường Tân Ngãi', 'tan_ngai', '2026-05-26 04:45:34'),
(3021, 31, '29584', 'Xã An Bình', 'an_binh', '2026-05-26 04:45:34'),
(3022, 31, '29590', 'Phường Thanh Đức', 'thanh_duc', '2026-05-26 04:45:34'),
(3023, 31, '29593', 'Phường Tân Hạnh', 'tan_hanh', '2026-05-26 04:45:34'),
(3024, 31, '29602', 'Xã Long Hồ', 'long_ho', '2026-05-26 04:45:34'),
(3025, 31, '29611', 'Xã Phú Quới', 'phu_quoi', '2026-05-26 04:45:34'),
(3026, 31, '29623', 'Xã Nhơn Phú', 'nhon_phu', '2026-05-26 04:45:34'),
(3027, 31, '29638', 'Xã Bình Phước', 'binh_phuoc', '2026-05-26 04:45:34'),
(3028, 31, '29641', 'Xã Cái Nhum', 'cai_nhum', '2026-05-26 04:45:34'),
(3029, 31, '29653', 'Xã Tân Long Hội', 'tan_long_hoi', '2026-05-26 04:45:34'),
(3030, 31, '29659', 'Xã Trung Thành', 'trung_thanh', '2026-05-26 04:45:34'),
(3031, 31, '29668', 'Xã Quới An', 'quoi_an', '2026-05-26 04:45:34'),
(3032, 31, '29677', 'Xã Quới Thiện', 'quoi_thien', '2026-05-26 04:45:34'),
(3033, 31, '29683', 'Xã Trung Hiệp', 'trung_hiep', '2026-05-26 04:45:34'),
(3034, 31, '29698', 'Xã Trung Ngãi', 'trung_ngai', '2026-05-26 04:45:34'),
(3035, 31, '29701', 'Xã Hiếu Phụng', 'hieu_phung', '2026-05-26 04:45:34'),
(3036, 31, '29713', 'Xã Hiếu Thành', 'hieu_thanh', '2026-05-26 04:45:34'),
(3037, 31, '29719', 'Xã Tam Bình', 'tam_binh', '2026-05-26 04:45:34'),
(3038, 31, '29728', 'Xã Cái Ngang', 'cai_ngang', '2026-05-26 04:45:34'),
(3039, 31, '29734', 'Xã Hòa Hiệp', 'hoa_hiep', '2026-05-26 04:45:34'),
(3040, 31, '29740', 'Xã Song Phú', 'song_phu', '2026-05-26 04:45:34'),
(3041, 31, '29767', 'Xã Ngãi Tứ', 'ngai_tu', '2026-05-26 04:45:34'),
(3042, 31, '29770', 'Phường Cái Vồn', 'cai_von', '2026-05-26 04:45:34'),
(3043, 31, '29771', 'Phường Bình Minh', 'binh_minh', '2026-05-26 04:45:34'),
(3044, 31, '29785', 'Xã Tân Lược', 'tan_luoc', '2026-05-26 04:45:34'),
(3045, 31, '29788', 'Xã Mỹ Thuận', 'my_thuan', '2026-05-26 04:45:34'),
(3046, 31, '29800', 'Xã Tân Quới', 'tan_quoi', '2026-05-26 04:45:34'),
(3047, 31, '29812', 'Phường Đông Thành', 'dong_thanh', '2026-05-26 04:45:34'),
(3048, 31, '29821', 'Xã Trà Ôn', 'tra_on', '2026-05-26 04:45:34'),
(3049, 31, '29830', 'Xã Hòa Bình', 'hoa_binh', '2026-05-26 04:45:34'),
(3050, 31, '29836', 'Xã Trà Côn', 'tra_con', '2026-05-26 04:45:34'),
(3051, 31, '29845', 'Xã Vĩnh Xuân', 'vinh_xuan', '2026-05-26 04:45:34'),
(3052, 31, '29857', 'Xã Lục Sĩ Thành', 'luc_si_thanh', '2026-05-26 04:45:34'),
(3053, 32, '30292', 'Phường Bình Đức', 'binh_duc', '2026-05-26 04:45:34'),
(3054, 32, '30301', 'Phường Mỹ Thới', 'my_thoi', '2026-05-26 04:45:34'),
(3055, 32, '30307', 'Phường Long Xuyên', 'long_xuyen', '2026-05-26 04:45:34'),
(3056, 32, '30313', 'Xã Mỹ Hòa Hưng', 'my_hoa_hung', '2026-05-26 04:45:34'),
(3057, 32, '30316', 'Phường Châu Đốc', 'chau_doc', '2026-05-26 04:45:34'),
(3058, 32, '30325', 'Phường Vĩnh Tế', 'vinh_te', '2026-05-26 04:45:34'),
(3059, 32, '30337', 'Xã An Phú', 'an_phu', '2026-05-26 04:45:34'),
(3060, 32, '30341', 'Xã Khánh Bình', 'khanh_binh', '2026-05-26 04:45:34'),
(3061, 32, '30346', 'Xã Nhơn Hội', 'nhon_hoi', '2026-05-26 04:45:34'),
(3062, 32, '30352', 'Xã Phú Hữu', 'phu_huu', '2026-05-26 04:45:34'),
(3063, 32, '30367', 'Xã Vĩnh Hậu', 'vinh_hau', '2026-05-26 04:45:34'),
(3064, 32, '30376', 'Phường Tân Châu', 'tan_chau', '2026-05-26 04:45:34'),
(3065, 32, '30377', 'Phường Long Phú', 'long_phu', '2026-05-26 04:45:34'),
(3066, 32, '30385', 'Xã Vĩnh Xương', 'vinh_xuong', '2026-05-26 04:45:34'),
(3067, 32, '30388', 'Xã Tân An', 'tan_an', '2026-05-26 04:45:34'),
(3068, 32, '30403', 'Xã Châu Phong', 'chau_phong', '2026-05-26 04:45:34'),
(3069, 32, '30406', 'Xã Phú Tân', 'phu_tan', '2026-05-26 04:45:34'),
(3070, 32, '30409', 'Xã Chợ Vàm', 'cho_vam', '2026-05-26 04:45:34'),
(3071, 32, '30421', 'Xã Phú Lâm', 'phu_lam', '2026-05-26 04:45:34'),
(3072, 32, '30430', 'Xã Hòa Lạc', 'hoa_lac', '2026-05-26 04:45:34'),
(3073, 32, '30436', 'Xã Phú An', 'phu_an', '2026-05-26 04:45:34'),
(3074, 32, '30445', 'Xã Bình Thạnh Đông', 'binh_thanh_dong', '2026-05-26 04:45:34'),
(3075, 32, '30463', 'Xã Châu Phú', 'chau_phu', '2026-05-26 04:45:34'),
(3076, 32, '30469', 'Xã Mỹ Đức', 'my_duc', '2026-05-26 04:45:34'),
(3077, 32, '30478', 'Xã Vĩnh Thạnh Trung', 'vinh_thanh_trung', '2026-05-26 04:45:34'),
(3078, 32, '30481', 'Xã Thạnh Mỹ Tây', 'thanh_my_tay', '2026-05-26 04:45:34'),
(3079, 32, '30487', 'Xã Bình Mỹ', 'binh_my', '2026-05-26 04:45:34'),
(3080, 32, '30502', 'Phường Thới Sơn', 'thoi_son', '2026-05-26 04:45:34'),
(3081, 32, '30505', 'Phường Chi Lăng', 'chi_lang', '2026-05-26 04:45:34'),
(3082, 32, '30520', 'Phường Tịnh Biên', 'tinh_bien', '2026-05-26 04:45:34'),
(3083, 32, '30526', 'Xã An Cư', 'an_cu', '2026-05-26 04:45:34'),
(3084, 32, '30538', 'Xã Núi Cấm', 'nui_cam', '2026-05-26 04:45:34'),
(3085, 32, '30544', 'Xã Tri Tôn', 'tri_ton', '2026-05-26 04:45:34'),
(3086, 32, '30547', 'Xã Ba Chúc', 'ba_chuc', '2026-05-26 04:45:34'),
(3087, 32, '30568', 'Xã Vĩnh Gia', 'vinh_gia', '2026-05-26 04:45:34'),
(3088, 32, '30577', 'Xã Ô Lâm', 'o_lam', '2026-05-26 04:45:34'),
(3089, 32, '30580', 'Xã Cô Tô', 'co_to', '2026-05-26 04:45:34'),
(3090, 32, '30589', 'Xã An Châu', 'an_chau', '2026-05-26 04:45:34'),
(3091, 32, '30595', 'Xã Cần Đăng', 'can_dang', '2026-05-26 04:45:34'),
(3092, 32, '30604', 'Xã Vĩnh An', 'vinh_an', '2026-05-26 04:45:34'),
(3093, 32, '30607', 'Xã Bình Hòa', 'binh_hoa', '2026-05-26 04:45:34'),
(3094, 32, '30619', 'Xã Vĩnh Hanh', 'vinh_hanh', '2026-05-26 04:45:34'),
(3095, 32, '30628', 'Xã Chợ Mới', 'cho_moi', '2026-05-26 04:45:34'),
(3096, 32, '30631', 'Xã Long Điền', 'long_dien', '2026-05-26 04:45:34'),
(3097, 32, '30643', 'Xã Cù Lao Giêng', 'cu_lao_gieng', '2026-05-26 04:45:34'),
(3098, 32, '30658', 'Xã Nhơn Mỹ', 'nhon_my', '2026-05-26 04:45:34'),
(3099, 32, '30664', 'Xã Long Kiến', 'long_kien', '2026-05-26 04:45:34'),
(3100, 32, '30673', 'Xã Hội An', 'hoi_an', '2026-05-26 04:45:34'),
(3101, 32, '30682', 'Xã Thoại Sơn', 'thoai_son', '2026-05-26 04:45:34'),
(3102, 32, '30685', 'Xã Phú Hòa', 'phu_hoa', '2026-05-26 04:45:34'),
(3103, 32, '30688', 'Xã Óc Eo', 'oc_eo', '2026-05-26 04:45:34'),
(3104, 32, '30691', 'Xã Tây Phú', 'tay_phu', '2026-05-26 04:45:34'),
(3105, 32, '30697', 'Xã Vĩnh Trạch', 'vinh_trach', '2026-05-26 04:45:34'),
(3106, 32, '30709', 'Xã Định Mỹ', 'dinh_my', '2026-05-26 04:45:34'),
(3107, 32, '30742', 'Phường Rạch Giá', 'rach_gia', '2026-05-26 04:45:34'),
(3108, 32, '30760', 'Phường Vĩnh Thông', 'vinh_thong', '2026-05-26 04:45:34'),
(3109, 32, '30766', 'Phường Tô Châu', 'to_chau', '2026-05-26 04:45:34'),
(3110, 32, '30769', 'Phường Hà Tiên', 'ha_tien', '2026-05-26 04:45:34'),
(3111, 32, '30781', 'Xã Tiên Hải', 'tien_hai', '2026-05-26 04:45:34'),
(3112, 32, '30787', 'Xã Kiên Lương', 'kien_luong', '2026-05-26 04:45:34'),
(3113, 32, '30790', 'Xã Hòa Điền', 'hoa_dien', '2026-05-26 04:45:34'),
(3114, 32, '30793', 'Xã Vĩnh Điều', 'vinh_dieu', '2026-05-26 04:45:34'),
(3115, 32, '30796', 'Xã Giang Thành', 'giang_thanh', '2026-05-26 04:45:34'),
(3116, 32, '30811', 'Xã Sơn Hải', 'son_hai', '2026-05-26 04:45:34'),
(3117, 32, '30814', 'Xã Hòn Nghệ', 'hon_nghe', '2026-05-26 04:45:34'),
(3118, 32, '30817', 'Xã Hòn Đất', 'hon_dat', '2026-05-26 04:45:34'),
(3119, 32, '30823', 'Xã Bình Sơn', 'binh_son', '2026-05-26 04:45:34'),
(3120, 32, '30826', 'Xã Bình Giang', 'binh_giang', '2026-05-26 04:45:34'),
(3121, 32, '30835', 'Xã Sơn Kiên', 'son_kien', '2026-05-26 04:45:34'),
(3122, 32, '30838', 'Xã Mỹ Thuận', 'my_thuan', '2026-05-26 04:45:34'),
(3123, 32, '30850', 'Xã Tân Hiệp', 'tan_hiep', '2026-05-26 04:45:34'),
(3124, 32, '30856', 'Xã Tân Hội', 'tan_hoi', '2026-05-26 04:45:34'),
(3125, 32, '30874', 'Xã Thạnh Đông', 'thanh_dong', '2026-05-26 04:45:34'),
(3126, 32, '30880', 'Xã Châu Thành', 'chau_thanh', '2026-05-26 04:45:34'),
(3127, 32, '30886', 'Xã Thạnh Lộc', 'thanh_loc', '2026-05-26 04:45:34'),
(3128, 32, '30898', 'Xã Bình An', 'binh_an', '2026-05-26 04:45:34'),
(3129, 32, '30904', 'Xã Giồng Riềng', 'giong_rieng', '2026-05-26 04:45:34'),
(3130, 32, '30910', 'Xã Thạnh Hưng', 'thanh_hung', '2026-05-26 04:45:34'),
(3131, 32, '30928', 'Xã Ngọc Chúc', 'ngoc_chuc', '2026-05-26 04:45:34'),
(3132, 32, '30934', 'Xã Hòa Hưng', 'hoa_hung', '2026-05-26 04:45:34'),
(3133, 32, '30943', 'Xã Long Thạnh', 'long_thanh', '2026-05-26 04:45:34'),
(3134, 32, '30949', 'Xã Hòa Thuận', 'hoa_thuan', '2026-05-26 04:45:34'),
(3135, 32, '30952', 'Xã Gò Quao', 'go_quao', '2026-05-26 04:45:34'),
(3136, 32, '30958', 'Xã Định Hòa', 'dinh_hoa', '2026-05-26 04:45:34'),
(3137, 32, '30970', 'Xã Vĩnh Hòa Hưng', 'vinh_hoa_hung', '2026-05-26 04:45:34'),
(3138, 32, '30982', 'Xã Vĩnh Tuy', 'vinh_tuy', '2026-05-26 04:45:34'),
(3139, 32, '30985', 'Xã An Biên', 'an_bien', '2026-05-26 04:45:34'),
(3140, 32, '30988', 'Xã Tây Yên', 'tay_yen', '2026-05-26 04:45:34'),
(3141, 32, '31006', 'Xã Đông Thái', 'dong_thai', '2026-05-26 04:45:34'),
(3142, 32, '31012', 'Xã Vĩnh Hòa', 'vinh_hoa', '2026-05-26 04:45:34'),
(3143, 32, '31018', 'Xã An Minh', 'an_minh', '2026-05-26 04:45:34'),
(3144, 32, '31024', 'Xã Đông Hòa', 'dong_hoa', '2026-05-26 04:45:34'),
(3145, 32, '31027', 'Xã U Minh Thượng', 'u_minh_thuong', '2026-05-26 04:45:34'),
(3146, 32, '31031', 'Xã Tân Thạnh', 'tan_thanh', '2026-05-26 04:45:34'),
(3147, 32, '31036', 'Xã Đông Hưng', 'dong_hung', '2026-05-26 04:45:34'),
(3148, 32, '31042', 'Xã Vân Khánh', 'van_khanh', '2026-05-26 04:45:34'),
(3149, 32, '31051', 'Xã Vĩnh Phong', 'vinh_phong', '2026-05-26 04:45:34'),
(3150, 32, '31064', 'Xã Vĩnh Bình', 'vinh_binh', '2026-05-26 04:45:34'),
(3151, 32, '31069', 'Xã Vĩnh Thuận', 'vinh_thuan', '2026-05-26 04:45:34'),
(3152, 32, '31078', 'Đặc khu Phú Quốc', 'phu_quoc', '2026-05-26 04:45:34'),
(3153, 32, '31105', 'Đặc khu Thổ Châu', 'tho_chau', '2026-05-26 04:45:34'),
(3154, 32, '31108', 'Đặc khu Kiên Hải', 'kien_hai', '2026-05-26 04:45:34'),
(3155, 33, '31120', 'Phường Cái Khế', 'cai_khe', '2026-05-26 04:45:34'),
(3156, 33, '31135', 'Phường Ninh Kiều', 'ninh_kieu', '2026-05-26 04:45:34'),
(3157, 33, '31147', 'Phường Tân An', 'tan_an', '2026-05-26 04:45:34'),
(3158, 33, '31150', 'Phường An Bình', 'an_binh', '2026-05-26 04:45:34'),
(3159, 33, '31153', 'Phường Ô Môn', 'o_mon', '2026-05-26 04:45:34'),
(3160, 33, '31157', 'Phường Thới Long', 'thoi_long', '2026-05-26 04:45:34'),
(3161, 33, '31162', 'Phường Phước Thới', 'phuoc_thoi', '2026-05-26 04:45:34'),
(3162, 33, '31168', 'Phường Bình Thủy', 'binh_thuy', '2026-05-26 04:45:34'),
(3163, 33, '31174', 'Phường Thới An Đông', 'thoi_an_dong', '2026-05-26 04:45:34'),
(3164, 33, '31183', 'Phường Long Tuyền', 'long_tuyen', '2026-05-26 04:45:34'),
(3165, 33, '31186', 'Phường Cái Răng', 'cai_rang', '2026-05-26 04:45:34'),
(3166, 33, '31201', 'Phường Hưng Phú', 'hung_phu', '2026-05-26 04:45:34'),
(3167, 33, '31207', 'Phường Thốt Nốt', 'thot_not', '2026-05-26 04:45:34'),
(3168, 33, '31213', 'Phường Tân Lộc', 'tan_loc', '2026-05-26 04:45:34'),
(3169, 33, '31217', 'Phường Trung Nhứt', 'trung_nhut', '2026-05-26 04:45:34'),
(3170, 33, '31228', 'Phường Thuận Hưng', 'thuan_hung', '2026-05-26 04:45:34'),
(3171, 33, '31231', 'Xã Thạnh An', 'thanh_an', '2026-05-26 04:45:34'),
(3172, 33, '31232', 'Xã Vĩnh Thạnh', 'vinh_thanh', '2026-05-26 04:45:34'),
(3173, 33, '31237', 'Xã Vĩnh Trinh', 'vinh_trinh', '2026-05-26 04:45:34'),
(3174, 33, '31246', 'Xã Thạnh Quới', 'thanh_quoi', '2026-05-26 04:45:34'),
(3175, 33, '31249', 'Xã Thạnh Phú', 'thanh_phu', '2026-05-26 04:45:34'),
(3176, 33, '31255', 'Xã Trung Hưng', 'trung_hung', '2026-05-26 04:45:34'),
(3177, 33, '31258', 'Xã Thới Lai', 'thoi_lai', '2026-05-26 04:45:34'),
(3178, 33, '31261', 'Xã Cờ Đỏ', 'co_do', '2026-05-26 04:45:34'),
(3179, 33, '31264', 'Xã Thới Hưng', 'thoi_hung', '2026-05-26 04:45:34'),
(3180, 33, '31273', 'Xã Đông Hiệp', 'dong_hiep', '2026-05-26 04:45:34'),
(3181, 33, '31282', 'Xã Đông Thuận', 'dong_thuan', '2026-05-26 04:45:34'),
(3182, 33, '31288', 'Xã Trường Thành', 'truong_thanh', '2026-05-26 04:45:34'),
(3183, 33, '31294', 'Xã Trường Xuân', 'truong_xuan', '2026-05-26 04:45:34'),
(3184, 33, '31299', 'Xã Phong Điền', 'phong_dien', '2026-05-26 04:45:34'),
(3185, 33, '31309', 'Xã Trường Long', 'truong_long', '2026-05-26 04:45:34'),
(3186, 33, '31315', 'Xã Nhơn Ái', 'nhon_ai', '2026-05-26 04:45:34'),
(3187, 33, '31321', 'Phường Vị Thanh', 'vi_thanh', '2026-05-26 04:45:34'),
(3188, 33, '31333', 'Phường Vị Tân', 'vi_tan', '2026-05-26 04:45:34'),
(3189, 33, '31338', 'Xã Hỏa Lựu', 'hoa_luu', '2026-05-26 04:45:34'),
(3190, 33, '31340', 'Phường Ngã Bảy', 'nga_bay', '2026-05-26 04:45:34'),
(3191, 33, '31342', 'Xã Tân Hòa', 'tan_hoa', '2026-05-26 04:45:34'),
(3192, 33, '31348', 'Xã Trường Long Tây', 'truong_long_tay', '2026-05-26 04:45:34'),
(3193, 33, '31360', 'Xã Thạnh Xuân', 'thanh_xuan', '2026-05-26 04:45:34'),
(3194, 33, '31366', 'Xã Châu Thành', 'chau_thanh', '2026-05-26 04:45:34'),
(3195, 33, '31369', 'Xã Đông Phước', 'dong_phuoc', '2026-05-26 04:45:34'),
(3196, 33, '31378', 'Xã Phú Hữu', 'phu_huu', '2026-05-26 04:45:34'),
(3197, 33, '31393', 'Xã Hòa An', 'hoa_an', '2026-05-26 04:45:34'),
(3198, 33, '31396', 'Xã Hiệp Hưng', 'hiep_hung', '2026-05-26 04:45:34'),
(3199, 33, '31399', 'Xã Tân Bình', 'tan_binh', '2026-05-26 04:45:34'),
(3200, 33, '31408', 'Xã Thạnh Hòa', 'thanh_hoa', '2026-05-26 04:45:34'),
(3201, 33, '31411', 'Phường Đại Thành', 'dai_thanh', '2026-05-26 04:45:34'),
(3202, 33, '31420', 'Xã Phụng Hiệp', 'phung_hiep', '2026-05-26 04:45:34'),
(3203, 33, '31426', 'Xã Phương Bình', 'binh', '2026-05-26 04:45:34'),
(3204, 33, '31432', 'Xã Tân Phước Hưng', 'tan_phuoc_hung', '2026-05-26 04:45:34'),
(3205, 33, '31441', 'Xã Vị Thủy', 'vi_thuy', '2026-05-26 04:45:34'),
(3206, 33, '31453', 'Xã Vĩnh Thuận Đông', 'vinh_thuan_dong', '2026-05-26 04:45:34'),
(3207, 33, '31459', 'Xã Vĩnh Tường', 'vinh_tuong', '2026-05-26 04:45:34'),
(3208, 33, '31465', 'Xã Vị Thanh 1', 'vi_thanh_1', '2026-05-26 04:45:34'),
(3209, 33, '31471', 'Phường Long Mỹ', 'long_my', '2026-05-26 04:45:34'),
(3210, 33, '31473', 'Phường Long Bình', 'long_binh', '2026-05-26 04:45:34'),
(3211, 33, '31480', 'Phường Long Phú 1', 'long_phu_1', '2026-05-26 04:45:34'),
(3212, 33, '31489', 'Xã Vĩnh Viễn', 'vinh_vien', '2026-05-26 04:45:34'),
(3213, 33, '31492', 'Xã Lương Tâm', 'luong_tam', '2026-05-26 04:45:34'),
(3214, 33, '31495', 'Xã Xà Phiên', 'xa_phien', '2026-05-26 04:45:34'),
(3215, 33, '31507', 'Phường Sóc Trăng', 'soc_trang', '2026-05-26 04:45:34'),
(3216, 33, '31510', 'Phường Phú Lợi', 'phu_loi', '2026-05-26 04:45:34'),
(3217, 33, '31528', 'Xã Kế Sách', 'ke_sach', '2026-05-26 04:45:34'),
(3218, 33, '31531', 'Xã An Lạc Thôn', 'an_lac_thon', '2026-05-26 04:45:34'),
(3219, 33, '31537', 'Xã Phong Nẫm', 'phong_nam', '2026-05-26 04:45:34'),
(3220, 33, '31540', 'Xã Thới An Hội', 'thoi_an_hoi', '2026-05-26 04:45:34'),
(3221, 33, '31552', 'Xã Nhơn Mỹ', 'nhon_my', '2026-05-26 04:45:34'),
(3222, 33, '31561', 'Xã Đại Hải', 'dai_hai', '2026-05-26 04:45:34'),
(3223, 33, '31567', 'Xã Mỹ Tú', 'my_tu', '2026-05-26 04:45:34'),
(3224, 33, '31569', 'Xã Phú Tâm', 'phu_tam', '2026-05-26 04:45:34'),
(3225, 33, '31570', 'Xã Hồ Đắc Kiện', 'ho_dac_kien', '2026-05-26 04:45:34'),
(3226, 33, '31579', 'Xã Long Hưng', 'long_hung', '2026-05-26 04:45:34'),
(3227, 33, '31582', 'Xã Thuận Hòa', 'thuan_hoa', '2026-05-26 04:45:34'),
(3228, 33, '31591', 'Xã Mỹ Hương', 'my_huong', '2026-05-26 04:45:34'),
(3229, 33, '31594', 'Xã An Ninh', 'an_ninh', '2026-05-26 04:45:34'),
(3230, 33, '31603', 'Xã Mỹ Phước', 'my_phuoc', '2026-05-26 04:45:34'),
(3231, 33, '31615', 'Xã An Thạnh', 'an_thanh', '2026-05-26 04:45:34'),
(3232, 33, '31633', 'Xã Cù Lao Dung', 'cu_lao_dung', '2026-05-26 04:45:34'),
(3233, 33, '31639', 'Xã Long Phú', 'long_phu', '2026-05-26 04:45:34'),
(3234, 33, '31645', 'Xã Đại Ngãi', 'dai_ngai', '2026-05-26 04:45:34'),
(3235, 33, '31654', 'Xã Trường Khánh', 'truong_khanh', '2026-05-26 04:45:34'),
(3236, 33, '31666', 'Xã Tân Thạnh', 'tan_thanh', '2026-05-26 04:45:34'),
(3237, 33, '31673', 'Xã Trần Đề', 'tran_de', '2026-05-26 04:45:34'),
(3238, 33, '31675', 'Xã Liêu Tú', 'lieu_tu', '2026-05-26 04:45:34'),
(3239, 33, '31679', 'Xã Lịch Hội Thượng', 'lich_hoi_thuong', '2026-05-26 04:45:34'),
(3240, 33, '31684', 'Phường Mỹ Xuyên', 'my_xuyen', '2026-05-26 04:45:34'),
(3241, 33, '31687', 'Xã Tài Văn', 'tai_van', '2026-05-26 04:45:34'),
(3242, 33, '31699', 'Xã Thạnh Thới An', 'thanh_thoi_an', '2026-05-26 04:45:34'),
(3243, 33, '31708', 'Xã Nhu Gia', 'nhu_gia', '2026-05-26 04:45:34'),
(3244, 33, '31717', 'Xã Hòa Tú', 'hoa_tu', '2026-05-26 04:45:34'),
(3245, 33, '31723', 'Xã Ngọc Tố', 'ngoc_to', '2026-05-26 04:45:34'),
(3246, 33, '31726', 'Xã Gia Hòa', 'gia_hoa', '2026-05-26 04:45:34'),
(3247, 33, '31732', 'Phường Ngã Năm', 'nga_nam', '2026-05-26 04:45:34'),
(3248, 33, '31741', 'Xã Tân Long', 'tan_long', '2026-05-26 04:45:34'),
(3249, 33, '31753', 'Phường Mỹ Quới', 'my_quoi', '2026-05-26 04:45:34'),
(3250, 33, '31756', 'Xã Phú Lộc', 'phu_loc', '2026-05-26 04:45:34'),
(3251, 33, '31759', 'Xã Lâm Tân', 'lam_tan', '2026-05-26 04:45:34'),
(3252, 33, '31777', 'Xã Vĩnh Lợi', 'vinh_loi', '2026-05-26 04:45:34'),
(3253, 33, '31783', 'Phường Vĩnh Châu', 'vinh_chau', '2026-05-26 04:45:34'),
(3254, 33, '31789', 'Phường Khánh Hòa', 'khanh_hoa', '2026-05-26 04:45:34'),
(3255, 33, '31795', 'Xã Vĩnh Hải', 'vinh_hai', '2026-05-26 04:45:34'),
(3256, 33, '31804', 'Phường Vĩnh Phước', 'vinh_phuoc', '2026-05-26 04:45:34'),
(3257, 33, '31810', 'Xã Lai Hòa', 'lai_hoa', '2026-05-26 04:45:34'),
(3258, 34, '31825', 'Phường Bạc Liêu', 'bac_lieu', '2026-05-26 04:45:34'),
(3259, 34, '31834', 'Phường Vĩnh Trạch', 'vinh_trach', '2026-05-26 04:45:34'),
(3260, 34, '31840', 'Phường Hiệp Thành', 'hiep_thanh', '2026-05-26 04:45:34'),
(3261, 34, '31843', 'Xã Hồng Dân', 'hong_dan', '2026-05-26 04:45:34'),
(3262, 34, '31849', 'Xã Ninh Quới', 'ninh_quoi', '2026-05-26 04:45:34'),
(3263, 34, '31858', 'Xã Vĩnh Lộc', 'vinh_loc', '2026-05-26 04:45:34'),
(3264, 34, '31864', 'Xã Ninh Thạnh Lợi', 'ninh_thanh_loi', '2026-05-26 04:45:34'),
(3265, 34, '31867', 'Xã Phước Long', 'phuoc_long', '2026-05-26 04:45:34'),
(3266, 34, '31876', 'Xã Vĩnh Phước', 'vinh_phuoc', '2026-05-26 04:45:34'),
(3267, 34, '31882', 'Xã Vĩnh Thanh', 'vinh_thanh', '2026-05-26 04:45:34'),
(3268, 34, '31885', 'Xã Phong Hiệp', 'phong_hiep', '2026-05-26 04:45:34'),
(3269, 34, '31891', 'Xã Hòa Bình', 'hoa_binh', '2026-05-26 04:45:34'),
(3270, 34, '31894', 'Xã Châu Thới', 'chau_thoi', '2026-05-26 04:45:34'),
(3271, 34, '31900', 'Xã Vĩnh Lợi', 'vinh_loi', '2026-05-26 04:45:34'),
(3272, 34, '31906', 'Xã Hưng Hội', 'hung_hoi', '2026-05-26 04:45:34'),
(3273, 34, '31918', 'Xã Vĩnh Mỹ', 'vinh_my', '2026-05-26 04:45:34'),
(3274, 34, '31927', 'Xã Vĩnh Hậu', 'vinh_hau', '2026-05-26 04:45:34'),
(3275, 34, '31942', 'Phường Giá Rai', 'gia_rai', '2026-05-26 04:45:34'),
(3276, 34, '31951', 'Phường Láng Tròn', 'lang_tron', '2026-05-26 04:45:34'),
(3277, 34, '31957', 'Xã Phong Thạnh', 'phong_thanh', '2026-05-26 04:45:34'),
(3278, 34, '31972', 'Xã Gành Hào', 'ganh_hao', '2026-05-26 04:45:34'),
(3279, 34, '31975', 'Xã Đông Hải', 'dong_hai', '2026-05-26 04:45:34'),
(3280, 34, '31985', 'Xã Long Điền', 'long_dien', '2026-05-26 04:45:34'),
(3281, 34, '31988', 'Xã An Trạch', 'an_trach', '2026-05-26 04:45:34'),
(3282, 34, '31993', 'Xã Định Thành', 'dinh_thanh', '2026-05-26 04:45:34'),
(3283, 34, '32002', 'Phường An Xuyên', 'an_xuyen', '2026-05-26 04:45:34'),
(3284, 34, '32014', 'Phường Lý Văn Lâm', 'ly_van_lam', '2026-05-26 04:45:34'),
(3285, 34, '32025', 'Phường Tân Thành', 'tan_thanh', '2026-05-26 04:45:34'),
(3286, 34, '32041', 'Phường Hòa Thành', 'hoa_thanh', '2026-05-26 04:45:34'),
(3287, 34, '32044', 'Xã Nguyễn Phích', 'nguyen_phich', '2026-05-26 04:45:34'),
(3288, 34, '32047', 'Xã U Minh', 'u_minh', '2026-05-26 04:45:34'),
(3289, 34, '32059', 'Xã Khánh An', 'khanh_an', '2026-05-26 04:45:34'),
(3290, 34, '32062', 'Xã Khánh Lâm', 'khanh_lam', '2026-05-26 04:45:34'),
(3291, 34, '32065', 'Xã Thới Bình', 'thoi_binh', '2026-05-26 04:45:34'),
(3292, 34, '32069', 'Xã Biển Bạch', 'bien_bach', '2026-05-26 04:45:34'),
(3293, 34, '32071', 'Xã Trí Phải', 'tri_phai', '2026-05-26 04:45:34'),
(3294, 34, '32083', 'Xã Tân Lộc', 'tan_loc', '2026-05-26 04:45:34'),
(3295, 34, '32092', 'Xã Hồ Thị Kỷ', 'ho_thi_ky', '2026-05-26 04:45:34'),
(3296, 34, '32095', 'Xã Trần Văn Thời', 'tran_van_thoi', '2026-05-26 04:45:34'),
(3297, 34, '32098', 'Xã Sông Đốc', 'song_doc', '2026-05-26 04:45:34'),
(3298, 34, '32104', 'Xã Đá Bạc', 'da_bac', '2026-05-26 04:45:34'),
(3299, 34, '32110', 'Xã Khánh Bình', 'khanh_binh', '2026-05-26 04:45:34'),
(3300, 34, '32119', 'Xã Khánh Hưng', 'khanh_hung', '2026-05-26 04:45:34'),
(3301, 34, '32128', 'Xã Cái Nước', 'cai_nuoc', '2026-05-26 04:45:34'),
(3302, 34, '32134', 'Xã Lương Thế Trân', 'luong_the_tran', '2026-05-26 04:45:34'),
(3303, 34, '32137', 'Xã Tân Hưng', 'tan_hung', '2026-05-26 04:45:34'),
(3304, 34, '32140', 'Xã Hưng Mỹ', 'hung_my', '2026-05-26 04:45:34'),
(3305, 34, '32152', 'Xã Đầm Dơi', 'dam_doi', '2026-05-26 04:45:34'),
(3306, 34, '32155', 'Xã Tạ An Khương', 'ta_an_khuong', '2026-05-26 04:45:34'),
(3307, 34, '32161', 'Xã Trần Phán', 'tran_phan', '2026-05-26 04:45:34'),
(3308, 34, '32167', 'Xã Tân Thuận', 'tan_thuan', '2026-05-26 04:45:34'),
(3309, 34, '32182', 'Xã Quách Phẩm', 'quach_pham', '2026-05-26 04:45:34'),
(3310, 34, '32185', 'Xã Thanh Tùng', 'thanh_tung', '2026-05-26 04:45:34'),
(3311, 34, '32188', 'Xã Tân Tiến', 'tan_tien', '2026-05-26 04:45:34'),
(3312, 34, '32191', 'Xã Năm Căn', 'nam_can', '2026-05-26 04:45:34'),
(3313, 34, '32201', 'Xã Đất Mới', 'dat_moi', '2026-05-26 04:45:34'),
(3314, 34, '32206', 'Xã Tam Giang', 'tam_giang', '2026-05-26 04:45:34'),
(3315, 34, '32212', 'Xã Cái Đôi Vàm', 'cai_doi_vam', '2026-05-26 04:45:34'),
(3316, 34, '32214', 'Xã Phú Mỹ', 'phu_my', '2026-05-26 04:45:34'),
(3317, 34, '32218', 'Xã Phú Tân', 'phu_tan', '2026-05-26 04:45:34'),
(3318, 34, '32227', 'Xã Nguyễn Việt Khái', 'nguyen_viet_khai', '2026-05-26 04:45:34'),
(3319, 34, '32236', 'Xã Tân Ân', 'tan_an', '2026-05-26 04:45:34'),
(3320, 34, '32244', 'Xã Phan Ngọc Hiển', 'phan_ngoc_hien', '2026-05-26 04:45:34'),
(3321, 34, '32248', 'Xã Đất Mũi', 'dat_mui', '2026-05-26 04:45:34');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hicrm_employers`
--

CREATE TABLE `hicrm_employers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Tên công ty/đơn vị',
  `logo_url` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Logo công ty',
  `cover_url` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Ảnh bìa',
  `tax_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mã số thuế',
  `job_category_id` int(11) DEFAULT NULL COMMENT 'Lĩnh vực hoạt động',
  `company_size` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mô tả ngắn về công ty',
  `website_url` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fanpage_url` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `province_id` int(11) DEFAULT NULL,
  `address_detail` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Địa chỉ chi tiết trụ sở',
  `is_linked_school` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Đã liên kết với trường CĐ Kon Tum',
  `link_summary` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Nội dung ngắn gọn về liên kết',
  `link_document_url` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'File đính kèm hợp đồng/biên bản',
  `verified_status` enum('pending','verified','rejected') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `reject_reason` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Lý do từ chối (nếu bị rejected)',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Thông tin nhà tuyển dụng/doanh nghiệp';

--
-- Đang đổ dữ liệu cho bảng `hicrm_employers`
--

INSERT INTO `hicrm_employers` (`id`, `company_name`, `logo_url`, `cover_url`, `tax_code`, `job_category_id`, `company_size`, `description`, `website_url`, `fanpage_url`, `province_id`, `address_detail`, `is_linked_school`, `link_summary`, `link_document_url`, `verified_status`, `reject_reason`, `created_at`, `updated_at`) VALUES
(0, 'Công Ty TNHH Msa Express', NULL, NULL, '0315829471', NULL, 'Trên 300 nhân sự', 'Msa Express là đơn vị tiên phong trong lĩnh vực giao nhận và logistics tại Việt Nam. Với mạng lưới phủ sóng toàn quốc và công nghệ vận hành hiện đại, chúng tôi cam kết mang đến dịch vụ giao hàng nhanh chóng, chính xác và đáng tin cậy cho hàng triệu khách hàng mỗi ngày.', NULL, NULL, 28, '125 Đường Hoa Ban, Phường Minh Khai, TP. An Phú', 0, NULL, NULL, 'pending', NULL, '2026-07-22 12:09:10', '2026-07-22 12:09:10'),
(1, 'Công Ty TNHH Vietnam Korolen Services', 'uploads/employers/logo_admin_20260723075526_8969.png', NULL, '1708256472', NULL, 'Trên 300 nhân sự', 'Korolen là một công ty hàng đầu thế giới của Mỹ trong lĩnh vực dịch vụ chăm sóc khách hàng có mặt ở trên 44 quốc gia với tổng số nhân sự lên tới trên 250.000 nhân viên..', 'https://korolen.vn', NULL, 28, 'đường số 14, Công Viên Phần Mềm Quang Trung, Phường Tân Chánh Hiệp, Quận 12, Thành phố Hồ Chí Minh, Việt Nam', 1, NULL, NULL, 'pending', NULL, '2026-05-30 09:33:11', '2026-07-25 19:49:20'),
(2, 'Công Ty TNHH Môi Trường Minh Hải', 'uploads/employers/logo_admin_20260723022243_5193.png', NULL, '0982819991', NULL, 'Trên 50 nhân sự', 'Hơn 10 năm kinh nghiệm thực hiện Tư vấn môi trường, Công ty Môi trường Hải Minh tự hào là một trong những công ty môi trường uy tín bậc nhất trong ngành. Với đội ngũ nhân viên gồm những Thạc sĩ, kỹ sư môi trường giàu kinh nghiệm và chuyên sâu trong ngành tư vấn môi trường, quản lý môi trường, xử lý môi trường, chúng tôi luôn cam kết đem lại sự hài lòng tuyệt đối cho khách hàng qua việc thực hiện các loại hồ sơ sau:', 'http://moitruonghaiminh.vn', 'http://moitruonghaiminh.vn', 28, '15/4 Nguyễn Oanh, Phường 17, Quận Gò Vấp, TP Hồ Chí minh, Việt Nam', 1, NULL, NULL, 'pending', NULL, '2026-05-30 09:38:40', '2026-07-22 19:22:43'),
(3, 'Công Ty CP SX TM XD Hoàn Mỹ', 'uploads/employers/logo_admin_20260723035130_7343.png', NULL, '7878172618', NULL, 'Trên 100 nhân sự', 'Công ty cổ phần HOÀN MỸ là một Công ty chuyên ngành cung cấp các máy móc thiết bị trong ngành chế biến thực phẩm và bánh kẹo có văn phòng đại diện đặt ở nhiều nước trên Thế giới như: Australia, ITaly, Pháp, Đài Loan, Trung Quốc và Việt Nam.', 'https://hoanmy.vn', NULL, 28, '1001Trần Hưng Đạo, Phưởng 5, Quận 5, TP.HCM', 1, NULL, NULL, 'pending', NULL, '2026-05-30 09:39:47', '2026-07-22 20:51:30'),
(4, 'Chi Nhánh Tổng Công Ty May Hòa Bình', 'uploads/employers/logo_admin_20260723015759_1532.png', NULL, '4901836257', NULL, '10 - 150 nhân sự', NULL, 'http://mayhoabinh.org', 'http://mayhoabinh.org', 1, 'Số 767 Nguyễn Văn Linh, Phường Phúc Lợi, TP Hà Nội', 1, NULL, NULL, 'pending', NULL, '2026-05-30 10:00:49', '2026-07-22 18:57:59'),
(5, 'Công Ty Cổ Phần Maimas', 'uploads/employers/logo_admin_20260723011655_5087.png', NULL, '9192929381', NULL, 'Trên 300 nhân sự', 'Môi trường làm việc chuyên nghiệp, thân thiện; kết hợp tính khoa học của môi trường quốc tế với các giá trị tuyền thống, với sứ mệnh giúp người tiêu dùng Việt Nam nâng cao được chất lượng cuộc sống thông qua các sản phẩm chất lượng, nguồn gốc xuất sứ rõ ràng và giá cả hợp lý.', 'https://maimas.vn', 'https://maimas.vn', 28, 'Lầu 13, Central Plaza, số 17 Lê Duẩn, Phường Bến Nghé, Quận 1, HCM', 1, NULL, NULL, 'pending', NULL, '2026-05-30 13:05:08', '2026-07-22 18:16:55'),
(6, 'Công Ty TNHH Kiến Thức Việt Hòa', 'uploads/employers/logo_admin_20260723002731_9384.png', NULL, '3705291840', NULL, '50 - 100 nhân sự', 'CÔNG TY TNHH MỘT THÀNH VIÊN KIẾN THỨC VIỆT HÒA', NULL, NULL, 27, '16/1, Đường Trương Định, KP 2 - Phường Tân Mai - Thành phố Biên Hoà - Đồng Nai.', 1, NULL, NULL, 'pending', NULL, '2026-05-30 13:10:12', '2026-07-22 17:27:31'),
(7, 'Công Ty TNHH Xe Nâng Việt Hàn', 'uploads/employers/logo_admin_20260723000245_1480.png', NULL, '9803417265', NULL, '50 - 100 nhân sự', 'Công ty Việt Nhật chuyên cung cấp các dịch vụ chính như: \r\nMua bán xe nâng hàng đã qua sử dụng.\r\nCho thuê - sửa chữa - bão dưỡng xe nâng\r\nThiết kế - lắp đặt - tư vấn dây chuyền băng tải công nghiệp.\r\nPhụ kiện băng tải các loại.', NULL, NULL, 28, 'Số 33B, Đại Lộ Bình Dương, khu phố Hoà Long, Phường Lái Thiêu, TP Hồ Chí Minh', 1, NULL, NULL, 'pending', NULL, '2026-05-30 13:10:56', '2026-07-22 17:02:45'),
(8, 'Công Ty TNHH Quốc Tế Unlimi Việt Nam', 'uploads/employers/logo_admin_20260723073303_4708.png', NULL, '3506972877', NULL, 'Trên 300 nhân sự', 'Unlimi là một trong những công ty đa quốc gia hàng đầu thế giới chuyên về các sản phẩm chăm sóc cá nhân, chăm sóc gia đình và thực phẩm.', 'https://unlimi.vn', NULL, 28, 'Lô A22-3 KCN Tây Bắc Củ Chi Xã Tân An Hội - Xã Tân An Hội - Huyện Củ Chi - TP Hồ Chí Minh.', 1, NULL, NULL, 'pending', NULL, '2026-05-30 13:47:30', '2026-07-23 00:33:03'),
(9, 'Công Ty Cổ Phần Công Nghiệp Toàn Phát', 'uploads/employers/logo_admin_20260722235151_6853.png', NULL, '2105837649', NULL, 'Trên 300 nhân sự', 'Thành lập vào năm 2005, Công ty Cổ phần Công nghiệp Toàn Phát tập trung nghiên cứu, phát triển chuỗi cung ứng về thiết bị, công nghệ, giải pháp và dịch vụ trong ngành gia công kim loại. Với đam mê và tầm nhìn chiến lược, trong hơn 10 năm qua, Toàn phát đã không ngừng mở rộng về quy mô, tính hiệu quả và chuyên nghiệp, khẳng định được vị thế đầu ngành và trở thành đối tác chiến lược, đáng tin cậy của nhiều doanh nghiệp lớn trong và ngoài nước.', NULL, NULL, 1, 'Số 234A Ngô Gia Tự, Phường Việt Hưng, TP Hà Nội, Việt Nam', 1, NULL, NULL, 'pending', NULL, '2026-05-30 14:00:25', '2026-07-22 16:51:51'),
(10, 'Công Ty Cổ Phần Kỹ Thuật Nhiệt Hải Long', 'uploads/employers/logo_admin_20260722230027_3055.png', NULL, '9204763158', NULL, '200 -  300 nhân viên', NULL, 'https://hailong.vn', 'https://hailong.vn', 28, '270 Võ Văn Kiệt, Phường An Lạc, Quận Bình Tân, TP. Hồ Chí Minh', 1, NULL, NULL, 'pending', NULL, '2026-05-30 14:01:17', '2026-07-22 16:00:27'),
(11, 'Chi Nhánh Công Ty CP Tầm Nhìn Quốc Tế Helin', 'uploads/employers/logo_admin_20260722221346_7578.png', 'uploads/employers/cover_file_20260603220028_6778.jpg', '2705819463', NULL, 'Trên 300 nhân sự', 'Công ty Cổ phần Tầm nhìn Quốc tế Helin ra đời vào ngày 02/03/2017 với lĩnh vực kinh doanh chính là Ẩm thực (F&B), Helin định hướng xây dựng và phát triển theo mô hình chuỗi các nhà hàng với khao khát mang ẩm thực Việt Nam vươn ra Thế giới.\r\nHelin đang sở hữu 5 hệ thống nhà hàng lớn tại Việt Nam với hơn 50 nhà hàng trải khắp trên cả nước. Helin hiện đang khai thác hai phong cách ẩm thực chính, bao gồm:', 'https://helingroup.vn', 'https://helingroup.vn', 28, '125 Nguyễn Trãi, Phường Bến Thành, Quận 1, TP. Hồ Chí Minh', 1, NULL, NULL, 'pending', NULL, '2026-05-30 14:04:02', '2026-07-22 15:13:46'),
(12, 'Công Ty TNHH Msa Express', 'uploads/employers/logo_admin_20260722201908_7426.png', NULL, '1123123127', NULL, 'Trên 300 nhân sự', 'Msa Express là đơn vị tiên phong trong lĩnh vực giao nhận và logistics tại Việt Nam. Với mạng lưới phủ sóng toàn quốc và công nghệ vận hành hiện đại, chúng tôi cam kết mang đến dịch vụ giao hàng nhanh chóng, chính xác và đáng tin cậy cho hàng triệu khách hàng mỗi ngày.', 'https://msa.vn', 'https://msa.vn', 28, '125 Đường Hoa Ban, Phường Minh Khai, TP. An Phú', 1, NULL, NULL, 'pending', NULL, '2026-05-30 14:07:45', '2026-07-22 13:22:06'),
(14, 'Công Ty TNHH Nước Giải Khát Holala Việt Nam', 'uploads/employers/logo_admin_20260723070040_8311.png', NULL, '7778728711', NULL, 'Dưới 10 người', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 'pending', NULL, '2026-07-17 05:17:01', '2026-07-23 00:00:40'),
(15, 'Công Ty CP ĐT PT Giáo Dục Quốc Tế Hoàng Hạ', 'uploads/employers/logo_admin_20260723055912_4224.png', 'https://picsum.photos/seed/ctdaivietlogistics1/800/300', '3705291841', 4, '51-200 nhân viên', 'Ưu thế nổi bật của Hoàng Hạ Edu chính là môi trường học tập hiện đại, năng động với sự đóng góp của những giáo viên trong nước và quốc tế giàu kinh nghiệm, ứng dụng sáng tạo các phương pháp giảng dạy tiên tiến, nhằm trang bị toàn diện cho học sinh kiến thức học thuật, năng lực ngoại ngữ vững vàng. Đội ngũ thầy cô giáo luôn tâm huyết sẽ khơi dậy cảm hứng học tập song song với việc giáo dục kỹ năng sống, vun bồi những giá trị đạo đức và phẩm chất cá nhân tốt đẹp.', 'https://hoangha.edu.vn', 'https://facebook.com/hoanghaedu18', 28, 'SỐ 18 ĐẶNG ĐẠI ĐỘ, P.TÂN PHONG, QUẬN 7, TP.HCM', 1, NULL, NULL, 'verified', NULL, '2024-02-07 03:32:00', '2026-07-22 22:59:12'),
(16, 'Công Ty Cổ Phần Viễn Thông Đầu Tư Và Thương Mại Phan Anh', 'uploads/employers/logo_admin_20260723062652_5881.png', 'https://picsum.photos/seed/ctdaivietlogistics1/800/300', '8607143922', 4, '51-200 nhân viên', 'Công ty TNHH Đại Việt Logistics hoạt động trong lĩnh vực du lịch - khách sạn, chuyên cung cấp sản phẩm và dịch vụ chất lượng, hiện đang mở rộng tuyển dụng nhân sự tại khu vực Kon Tum và các tỉnh lân cận.', 'https://ctdaivietlogistics1.vn', 'https://facebook.com/ctdaivietlogistics1', 7, 'Số 280 đường Nguyễn Trãi, Đăk Hà, Kon Tum', 1, NULL, NULL, 'verified', NULL, '2024-02-07 03:32:00', '2026-07-22 23:26:52'),
(17, 'Công Ty TNHH Thành Nhân', 'uploads/employers/logo_admin_20260723052423_1087.png', 'https://picsum.photos/seed/ctdaivietlogistics1/800/300', '8607143955', 4, '51 - 200 nhân viên', 'Được thành lập từ năm 1999 với lĩnh vực kinh doanh xe máy - ô tô thương hiệu Honda, Yamaha, Piaggio, Suziki, SYM; ...', 'https://thanhnhan.vn', 'https://facebook.com/thanhnhan567', 26, '432 Đường Trần Hưng Đạo. Phường Phan Thiết. Tỉnh Lâm Đồng', 1, NULL, NULL, 'verified', NULL, '2024-02-07 03:32:00', '2026-07-22 22:24:23'),
(18, 'Công Ty Cổ Phần Thực Phẩm Và Nước Giải Khát Quỳnh Nhi', 'uploads/employers/logo_admin_20260723051312_7239.png', 'https://picsum.photos/seed/htxdaivietland2/800/300', '9204763156', 12, 'Trên 300 nhân viên', 'Công Ty Cổ Phần Thực Phẩm Và Nước Giải Khát Quỳnh Nhi là nhà sản xuất hàng đầu Việt Nam, nổi tiếng với các dòng nước giải khát tự nhiên, nước dừa, nước ép trái cây và thức uống dinh dưỡng. Với hệ thống nhà máy hiện đại đạt chuẩn quốc tế, xuất khẩu tới hơn 200 quốc gia, khẳng định vị thế trên thị trường toàn cầu.', 'https://qunhnhigroup.vn', 'https://facebook.com/quynhnhogroup79', 28, '99/1C, Đường Nguyễn Thị Minh Khai, Khu phố Tân Thắng, Phường Tân Bình, Thị xã Dĩ An, Tỉnh Bình Dươn', 1, NULL, NULL, 'verified', NULL, '2025-06-09 02:13:00', '2026-07-22 22:13:12'),
(19, 'Công Ty Cổ Phần Two Mount Group', 'uploads/employers/logo_admin_20260723044418_3041.png', 'https://picsum.photos/seed/ctdaivietlogistics1/800/300', '9803417269', 4, 'Trên 300 nhân viên', 'Two Mount Group được thành lập với tham vọng kiến tạo hệ sinh thái công nghệ lớn nhất Việt Nam, cung cấp các giải pháp và dịch vụ xuyên suốt chuỗi giá trị, từ lĩnh vực dịch vụ tài chính, phân phối, bất động sản và bán lẻ.', 'https://twomount.vn', 'https://facebook.com/twomount', 1, 'Tầng 3, Tòa văn phòng T26, KĐT Times City, 458 Minh Khai, Phường Vĩnh Tuy, Quận Hai Bà Trưng, Thành phố Hà Nội, Việt Nam', 1, NULL, NULL, 'verified', NULL, '2024-02-07 03:32:00', '2026-07-22 21:44:19'),
(20, 'Công Ty Cổ Phần Bất Động Sản An Thịnh', 'uploads/employers/logo_admin_20260723073313_6764.png', 'https://picsum.photos/seed/htxdaivietland2/800/300', '1102583746', 12, 'Trên 500 nhân viên', 'CÔNG TY CỔ PHẦN BẤT ĐỘNG SẢN AN THỊNH. (VAN AN PHAT REAL ESTATE .,JSC)\r\nUy tín, chất lượng và hiệu quả. Công ty nỗ lực phấn đấu phát triển bền vững, trở thành doanh nghiệp hàng đầu Việt Nam trong lĩnh vực đầu tư, phân phối và quản lý bất động sản. Vạn An Phát sẽ là nơi khách hàng trao gửi niềm tin trọn vẹn, người lao động cống hiến hết mình, cổ đông hoàn toàn hài lòng, và cộng đồng được hưởng nhiều lợi ích.', 'https://anthinh.vn', 'https://facebook.com/anthinh', 28, 'Số 53D Phan Đăng Lưu,Phường 7,Quận Phú Nhuận', 1, NULL, NULL, 'verified', NULL, '2025-06-09 02:13:00', '2026-07-23 00:33:13'),
(21, 'Công Ty Cổ Phần Dược Cappa', 'uploads/employers/logo_admin_20260723023539_6525.png', 'https://picsum.photos/seed/ctdaivietlogistics1/800/300', '5207361849', 4, '51-200 nhân viên', 'Công ty Cổ phần Dược CAPPA là doanh nghiệp dược phẩm thú y chuyên sản xuất và phân phối thuốc thú y và thuốc thủy sản. NAPHA đã xây dựng được uy tín vững chắc nhờ các sản phẩm chất lượng cao, đáp ứng tiêu chuẩn quốc tế. Danh mục sản phẩm đa dạng của công ty được sử dụng rộng rãi trên toàn quốc. NAPHA cam kết không ngừng đổi mới, đầu tư công nghệ và kiểm soát chất lượng nghiêm ngặt, nhằm đáp ứng tốt nhất nhu cầu ngày càng cao của ngành chăn nuôi và nuôi trồng thủy sản.', 'https://cappa.vn', 'https://facebook.com/cappa', 28, '6 Đường N4, Khu công nghiệp Tân Phú Trung, Ấp Trạm Bơm, Xã Củ Chi, TP Hồ Chí Minh', 1, NULL, NULL, 'verified', NULL, '2024-02-07 03:32:00', '2026-07-23 17:50:59');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hicrm_employers_old`
--

CREATE TABLE `hicrm_employers_old` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Tên công ty/đơn vị',
  `logo_url` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Logo công ty',
  `cover_url` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Ảnh bìa',
  `tax_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mã số thuế',
  `job_category_id` int(11) DEFAULT NULL COMMENT 'Lĩnh vực hoạt động',
  `company_size` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Mô tả ngắn về công ty',
  `website_url` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fanpage_url` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `province_id` int(11) DEFAULT NULL,
  `address_detail` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Địa chỉ chi tiết trụ sở',
  `is_linked_school` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'Đã liên kết với trường CĐ Kon Tum',
  `link_summary` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Nội dung ngắn gọn về liên kết',
  `link_document_url` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'File đính kèm hợp đồng/biên bản',
  `verified_status` enum('pending','verified','rejected') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `reject_reason` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Lý do từ chối (nếu bị rejected)',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Thông tin nhà tuyển dụng/doanh nghiệp';

--
-- Đang đổ dữ liệu cho bảng `hicrm_employers_old`
--

INSERT INTO `hicrm_employers_old` (`id`, `company_name`, `logo_url`, `cover_url`, `tax_code`, `job_category_id`, `company_size`, `description`, `website_url`, `fanpage_url`, `province_id`, `address_detail`, `is_linked_school`, `link_summary`, `link_document_url`, `verified_status`, `reject_reason`, `created_at`, `updated_at`) VALUES
(1, 'CVF Kon Tum', NULL, NULL, '0929281929', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'pending', NULL, '2026-05-30 09:33:11', '2026-05-30 09:33:11'),
(2, 'Công nghệ và Dịch vụ HCS', NULL, NULL, '0982819991', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 'pending', NULL, '2026-05-30 09:38:40', '2026-06-20 07:02:23'),
(3, 'HSOFT', NULL, NULL, '7878172618', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'pending', NULL, '2026-05-30 09:39:47', '2026-05-30 09:39:47'),
(4, 'FSOTR', NULL, NULL, '1111231123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 'pending', NULL, '2026-05-30 10:00:49', '2026-06-20 07:02:17'),
(5, 'ESORT', NULL, NULL, '9192929381', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 'pending', NULL, '2026-05-30 13:05:08', '2026-06-20 07:12:37'),
(6, 'ISORT', NULL, NULL, '1231212341', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 'pending', NULL, '2026-05-30 13:10:12', '2026-06-20 07:25:01'),
(7, 'Anh Minh Kon Tum', 'uploads/employers/logo_file_20260713122012_8195.jpg', NULL, '1929391922', NULL, '10', 'Chuyên thiết kê in ấn dịch vụ website', 'http://vieclam.vn/', 'http://facebook.com', 11, 'Hoàn văn thụ - Kon tum', 1, NULL, NULL, 'pending', NULL, '2026-05-30 13:10:56', '2026-07-23 14:44:42'),
(8, '1123123', NULL, NULL, '1112312312312', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 'pending', NULL, '2026-05-30 13:47:30', '2026-05-30 13:47:30'),
(9, '312312312', NULL, NULL, '1111111211', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 'pending', NULL, '2026-05-30 14:00:25', '2026-07-09 15:25:31'),
(10, '33333', NULL, NULL, '1231231231', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 'pending', NULL, '2026-05-30 14:01:17', '2026-07-09 15:25:18'),
(11, '333123', 'uploads/employers/logo_file_20260603220041_3755.jpg', 'uploads/employers/cover_file_20260603220028_6778.jpg', '1111231111', NULL, 'Dưới 10 người', 'ABC 123', '', '', NULL, '123123123123 1231231', 1, NULL, NULL, 'pending', NULL, '2026-05-30 14:04:02', '2026-06-14 04:46:36'),
(12, 'ABC', NULL, NULL, '1123123123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, 'pending', NULL, '2026-05-30 14:07:45', '2026-07-09 15:25:13'),
(14, 'Công Ty TNHH MTV An Giang', 'uploads/employers/logo_file_20260717122026_1691.png', NULL, '7778728711', NULL, 'Dưới 10 người', '', '', '', NULL, '', 0, NULL, NULL, 'pending', NULL, '2026-07-17 05:17:01', '2026-07-17 05:20:26'),
(15, 'Công ty TNHH Đại Việt Logistics', 'https://ui-avatars.com/api/?name=CTĐ&background=random&size=256&bold=true', 'https://picsum.photos/seed/ctdaivietlogistics1/800/300', '6295310485', 4, '51-200 nhân viên', 'Công ty TNHH Đại Việt Logistics hoạt động trong lĩnh vực du lịch - khách sạn, chuyên cung cấp sản phẩm và dịch vụ chất lượng, hiện đang mở rộng tuyển dụng nhân sự tại khu vực Kon Tum và các tỉnh lân cận.', 'https://ctdaivietlogistics1.vn', 'https://facebook.com/ctdaivietlogistics1', 7, 'Số 280 đường Nguyễn Trãi, Đăk Hà, Kon Tum', 0, NULL, NULL, 'verified', NULL, '2024-02-07 03:32:00', '2024-02-07 03:32:00'),
(16, 'Công ty TNHH Đại Việt Logistics', 'https://api.dicebear.com/9.x/shapes/svg?seed=ctdaivietlogistics1&backgroundType=gradientLinear&backgroundRotation=0,360&size=200', 'https://picsum.photos/seed/ctdaivietlogistics1/800/300', '6295310485', 4, '51-200 nhân viên', 'Công ty TNHH Đại Việt Logistics hoạt động trong lĩnh vực du lịch - khách sạn, chuyên cung cấp sản phẩm và dịch vụ chất lượng, hiện đang mở rộng tuyển dụng nhân sự tại khu vực Kon Tum và các tỉnh lân cận.', 'https://ctdaivietlogistics1.vn', 'https://facebook.com/ctdaivietlogistics1', 7, 'Số 280 đường Nguyễn Trãi, Đăk Hà, Kon Tum', 0, NULL, NULL, 'verified', NULL, '2024-02-07 03:32:00', '2024-02-07 03:32:00'),
(17, 'Công ty TNHH Đại Việt Logistics', 'https://source.boringavatars.com/marble/200/ctdaivietlogistics1?colors=0A2540,1B4965,2A9D8F,E9C46A,E76F51&square=true', 'https://picsum.photos/seed/ctdaivietlogistics1/800/300', '6295310485', 4, '51-200 nhân viên', 'Công ty TNHH Đại Việt Logistics hoạt động trong lĩnh vực du lịch - khách sạn, chuyên cung cấp sản phẩm và dịch vụ chất lượng, hiện đang mở rộng tuyển dụng nhân sự tại khu vực Kon Tum và các tỉnh lân cận.', 'https://ctdaivietlogistics1.vn', 'https://facebook.com/ctdaivietlogistics1', 7, 'Số 280 đường Nguyễn Trãi, Đăk Hà, Kon Tum', 0, NULL, NULL, 'verified', NULL, '2024-02-07 03:32:00', '2024-02-07 03:32:00'),
(18, 'Hợp tác xã Đại Việt Land', 'https://source.boringavatars.com/marble/200/htxdaivietland2?colors=0A2540,1B4965,2A9D8F,E9C46A,E76F51&square=true', 'https://picsum.photos/seed/htxdaivietland2/800/300', '6213500298', 12, 'Trên 500 nhân viên', 'Hợp tác xã Đại Việt Land hoạt động trong lĩnh vực giáo dục - đào tạo, chuyên cung cấp sản phẩm và dịch vụ chất lượng, hiện đang mở rộng tuyển dụng nhân sự tại khu vực Kon Tum và các tỉnh lân cận.', 'https://htxdaivietland2.vn', 'https://facebook.com/htxdaivietland2', 29, 'Số 143 đường Hoàng Văn Thụ, TP. Kon Tum, Kon Tum', 0, NULL, NULL, 'verified', NULL, '2025-06-09 02:13:00', '2025-06-09 02:13:00'),
(19, 'Công ty TNHH Đại Việt Logistics', 'https://api.dicebear.com/10.x/shapes/svg?seed=ctdaivietlogistics1&backgroundColor=0a2540,1b4965,2a9d8f,e9c46a,e76f51&backgroundType=gradientLinear&radius=12', 'https://picsum.photos/seed/ctdaivietlogistics1/800/300', '6295310485', 4, '51-200 nhân viên', 'Công ty TNHH Đại Việt Logistics hoạt động trong lĩnh vực du lịch - khách sạn, chuyên cung cấp sản phẩm và dịch vụ chất lượng, hiện đang mở rộng tuyển dụng nhân sự tại khu vực Kon Tum và các tỉnh lân cận.', 'https://ctdaivietlogistics1.vn', 'https://facebook.com/ctdaivietlogistics1', 7, 'Số 280 đường Nguyễn Trãi, Đăk Hà, Kon Tum', 0, NULL, NULL, 'verified', NULL, '2024-02-07 03:32:00', '2024-02-07 03:32:00'),
(20, 'Hợp tác xã Đại Việt Land', 'https://api.dicebear.com/10.x/shapes/svg?seed=htxdaivietland2&backgroundColor=0a2540,1b4965,2a9d8f,e9c46a,e76f51&backgroundType=gradientLinear&radius=12', 'https://picsum.photos/seed/htxdaivietland2/800/300', '6213500298', 12, 'Trên 500 nhân viên', 'Hợp tác xã Đại Việt Land hoạt động trong lĩnh vực giáo dục - đào tạo, chuyên cung cấp sản phẩm và dịch vụ chất lượng, hiện đang mở rộng tuyển dụng nhân sự tại khu vực Kon Tum và các tỉnh lân cận.', 'https://htxdaivietland2.vn', 'https://facebook.com/htxdaivietland2', 29, 'Số 143 đường Hoàng Văn Thụ, TP. Kon Tum, Kon Tum', 0, NULL, NULL, 'verified', NULL, '2025-06-09 02:13:00', '2025-06-09 02:13:00'),
(21, 'Công ty TNHH Đại Việt Logistics', 'https://api.dicebear.com/10.x/glass/svg?seed=ctdaivietlogistics1&radius=20', 'https://picsum.photos/seed/ctdaivietlogistics1/800/300', '6295310485', 4, '51-200 nhân viên', 'Công ty TNHH Đại Việt Logistics hoạt động trong lĩnh vực du lịch - khách sạn, chuyên cung cấp sản phẩm và dịch vụ chất lượng, hiện đang mở rộng tuyển dụng nhân sự tại khu vực Kon Tum và các tỉnh lân cận.', 'https://ctdaivietlogistics1.vn', 'https://facebook.com/ctdaivietlogistics1', 7, 'Số 280 đường Nguyễn Trãi, Đăk Hà, Kon Tum', 0, NULL, NULL, 'verified', NULL, '2024-02-07 03:32:00', '2024-02-07 03:32:00'),
(22, 'Viet My J.S.C ABC', NULL, NULL, '777872871001', NULL, '10', 'aaa', 'abc', 'abc', 32, 'Hoàn văn thụ - Kon tum', 0, NULL, NULL, 'pending', NULL, '2026-07-22 14:25:21', '2026-07-22 14:25:21'),
(23, 'Viet My J.S.C 11', NULL, NULL, '11112312131', NULL, '10', 'aaaaa', 'abc', 'abc', 11, '123123123123 1', 0, NULL, NULL, 'pending', NULL, '2026-07-22 14:30:57', '2026-07-22 14:30:57'),
(24, 'Công Ty TNHH MTV An Giang 1', 'uploads/employers/logo_admin_20260722213233_7646.png', NULL, '777872871000', NULL, '10', 'aa', 'abc', 'abc', 2, '123123123123 1', 0, NULL, NULL, 'pending', NULL, '2026-07-22 14:32:33', '2026-07-22 14:32:33');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hicrm_events`
--

CREATE TABLE `hicrm_events` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `event_name` varchar(255) NOT NULL,
  `event_description` text NOT NULL,
  `event_content` longtext NOT NULL,
  `event_image` varchar(255) NOT NULL,
  `event_type` int(11) NOT NULL COMMENT 'Loại tin tức',
  `event_hot` int(11) NOT NULL DEFAULT 0,
  `event_user_created` int(11) NOT NULL,
  `event_status` int(11) NOT NULL,
  `event_created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `hicrm_events`
--

INSERT INTO `hicrm_events` (`id`, `user_id`, `event_name`, `event_description`, `event_content`, `event_image`, `event_type`, `event_hot`, `event_user_created`, `event_status`, `event_created_date`) VALUES
(1, 0, 'sk 1', 'Mô tả', '<p>aaaa asd zzz</p>', '8ea1c0411ad93af2550011d1504fddb8-NDThe.png', 1, 0, 24, 99, '2026-01-06 20:49:23'),
(2, 0, 'Lễ Bế Mạc Hội Thao Học Sinh – Sinh Viên Lần Thứ XI, Năm Học 2025-2026', 'Mô tả', '<p>Lễ Bế Mạc Hội Thao Học Sinh – Sinh Viên Lần Thứ XI, Năm Học 2025-2026</p>', '8ea1c0411ad93af2550011d1504fddb8-NDThe.png', 1, 0, 24, 99, '2026-01-06 20:49:23'),
(3, 0, 'Lễ Bế Mạc Hội Thao Học Sinh – Sinh Viên Lần Thứ XI, Năm Học 2025-2027', 'Mô tả', '<p>Lễ Bế Mạc Hội Thao Học Sinh – Sinh Viên Lần Thứ XI, Năm Học 2025-2026</p>', '8ea1c0411ad93af2550011d1504fddb8-NDThe.png', 1, 0, 24, 99, '2026-01-06 20:49:23'),
(4, 0, 'Lễ Bế Mạc Hội Thao Học Sinh – Sinh Viên Lần Thứ XI, Năm Học 2025-2027', 'Mô tả', '<p>Lễ Bế Mạc Hội Thao Học Sinh – Sinh Viên Lần Thứ XI, Năm Học 2025-2026</p>', '8ea1c0411ad93af2550011d1504fddb8-NDThe.png', 1, 0, 24, 99, '2026-01-06 20:49:23'),
(5, 0, 'Lễ Bế Mạc Hội Thao Học Sinh – Sinh Viên Lần Thứ XI, Năm Học 2025-2026 1111', 'Lễ Bế Mạc Hội Thao Học Sinh – Sinh Viên Lần Thứ XI, Năm Học 2025-2026', '<p>aaaa asd zzz</p>', '8ea1c0411ad93af2550011d1504fddb8-NDThe.png', 1, 0, 24, 99, '2026-01-06 20:49:23'),
(6, 0, 'Khám chữa bệnh Bảo hiểm y tế tại Phòng khám Đa khoa Trường Cao đẳng Kon Tum – Lựa chọn thông minh!', 'Nhiều người nghĩ phải đi khám bệnh tại các bệnh viện mới được hưởng quyền lợi bảo hiểm y tế (BHYT) đầy đủ, nhưng thực tế đi khám bệnh tại cơ sở khám chữa bệnh (KCB) ban đầu lại là cách thông minh nhất để tiết kiệm thời gian, chi phí, được phát hiện sớm các vấn đề sức khỏe và được chăm sóc liên tục.', '<p style=\"text-align: left;\"></p><p class=\"MsoNormal\" align=\"center\" style=\"text-align:center\"><b><span style=\"font-size:16.0pt;line-height:115%;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">Phòng\r\nkhám Đa khoa Trường Cao đẳng Kon Tum</span></b><span style=\"font-size:16.0pt;\r\nline-height:115%;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"><o:p></o:p></span></p><p class=\"MsoNormal\" style=\"text-align: center;\"><b><span style=\"font-size:14.0pt;\r\nline-height:115%;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">– Uy tín từ chuyên môn,\r\nan tâm từ dịch vụ</span></b><span style=\"font-size:14.0pt;line-height:115%;\r\nfont-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"><o:p></o:p></span></p><p class=\"MsoNormal\" style=\"text-align:justify\"><span style=\"font-size:14.0pt;\r\nline-height:115%;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">Nhiều người nghĩ phải đi\r\nkhám bệnh tại các bệnh viện mới được hưởng quyền lợi bảo hiểm y tế (BHYT) đầy đủ,\r\nnhưng thực tế đi khám bệnh tại cơ sở khám chữa bệnh (KCB) ban đầu lại là cách\r\nthông minh nhất để tiết kiệm thời gian, chi phí, được phát hiện sớm các vấn đề\r\nsức khỏe và được chăm sóc liên tục.<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"text-align:justify\"><b><span style=\"font-size:14.0pt;\r\nline-height:115%;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">Phòng khám đa khoa trường\r\ncao đẳng kon tum</span></b><span style=\"font-size:14.0pt;line-height:115%;\r\nfont-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">&nbsp;là cơ sở&nbsp;<b>KCB ban đầu</b>&nbsp;tiếp\r\nnhận người bệnh BHYT&nbsp;theo quy định, giúp người dân tiếp cận dịch vụ nhanh\r\nchóng, thuận lợi và hiệu quả ngay tại địa phương.<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"text-align:justify\"><span style=\"font-size:14.0pt;\r\nline-height:115%;font-family:\" segoe=\"\" ui=\"\" emoji\",sans-serif;mso-bidi-font-family:=\"\" \"segoe=\"\" emoji\"\"=\"\">✨</span><span style=\"font-size:14.0pt;line-height:115%;\r\nfont-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">&nbsp;<b>Những lợi ích nổi bật khi KCB\r\nBHYT tại Phòng khám Đa khoa Trường Cao đẳng Kon Tum:</b><o:p></o:p></span></p><p class=\"MsoNormal\" style=\"text-align:justify\"><b><span style=\"font-size:14.0pt;\r\nline-height:115%;font-family:\" segoe=\"\" ui=\"\" emoji\",sans-serif;mso-bidi-font-family:=\"\" \"segoe=\"\" emoji\"\"=\"\">✅</span></b><b><span style=\"font-size:14.0pt;line-height:\r\n115%;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">&nbsp;Không cần giấy chuyển cơ sở KCB\r\n- Thủ tục đơn giản, nhanh gọn, vẫn được hưởng đầy đủ quyền lợi BHYT.&nbsp;</span></b><span style=\"font-size:14.0pt;line-height:115%;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">Người\r\nbệnh thuộc mọi đối tượng tham gia BHYT sinh sống ở bất cứ nơi đâu, không phân\r\nbiệt địa giới hành chính đến KCB BHYT tại Phòng khám Đa khoa Trường Cao đẳng\r\nKon Tum đều được hưởng đầy đủ quyền lợi trong phạm vi về KCB BHYT.<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"text-align:justify\"><span style=\"font-size:14.0pt;\r\nline-height:115%;font-family:\" segoe=\"\" ui=\"\" emoji\",sans-serif;mso-bidi-font-family:=\"\" \"segoe=\"\" emoji\"\"=\"\">✅</span><span style=\"font-size:14.0pt;line-height:115%;\r\nfont-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">&nbsp;<b>Mức cùng chi trả thấp – tiết kiệm\r\nchi phí tối đa</b><o:p></o:p></span></p><p class=\"MsoNormal\" style=\"text-align:justify\"><span style=\"font-size:14.0pt;\r\nline-height:115%;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">- Hưởng 100% chi phí: Người\r\ncó công với cách mạng, cựu chiến binh, trẻ em &lt; 6 tuổi, người thuộc hộ\r\nnghèo, hộ cận nghèo, người tham gia BHYT thuộc hộ gia đình cận nghèo, người cao\r\ntuổi từ đủ 75 tuổi trở lên đang hưởng trợ cấp hưu trí xã hội&nbsp;<i>(nâng mức\r\nhưởng từ 01/01/2026 theo NQ 261 của Quốc hội)</i>, người dân tộc thiểu số vùng\r\nkhó khăn/đặc biệt khó khăn, người hưởng trợ cấp xã hội hằng tháng, người từ đủ\r\n75 tuổi đang hưởng trợ cấp tuất hằng tháng, trường hợp tổng chi phí một lần KCB\r\nthấp hơn 15% mức lương cơ sở (với mức lượng cơ sở hiện nay là 2.340.000 đồng,\r\n15% mức lương cơ sở tương đương 351.000 đồng), người tham gia BHYT từ 5 năm\r\nliên tục trở lên và có số tiền cùng chi trả trong năm lớn hơn 6 tháng lương cơ\r\nsở.<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"text-align:justify\"><span style=\"font-size:14.0pt;\r\nline-height:115%;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">- Hưởng 95% chi phí: Người\r\nhưởng lương hưu, trợ cấp mất sức lao động hàng tháng, thân nhân người có công với\r\ncách mạng.<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"text-align:justify\"><span style=\"font-size:14.0pt;\r\nline-height:115%;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">- Hưởng 80% chi phí: Áp dụng\r\ncho các đối tượng còn lại (như cán bộ, công chức, viên chức, người lao động, học\r\nsinh, sinh viên, người tham gia BHYT hộ gia đình).<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"text-align:justify\"><span style=\"font-size:14.0pt;\r\nline-height:115%;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">&nbsp;Khám đúng cơ sở KCB\r\nban đầu giúp người bệnh được áp dụng mức hưởng cao nhất.<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"text-align:justify\"><span style=\"font-size:14.0pt;\r\nline-height:115%;font-family:\" segoe=\"\" ui=\"\" emoji\",sans-serif;mso-bidi-font-family:=\"\" \"segoe=\"\" emoji\"\"=\"\">✅</span><span style=\"font-size:14.0pt;line-height:115%;\r\nfont-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">&nbsp;<b>Thông tuyến thuận lợi theo quy định:</b>&nbsp;Khi\r\ncần thiết, bác sĩ sẽ hỗ trợ chuyển cơ sở KCB đúng quy định để người bệnh tiếp tục\r\nđược hưởng quyền lợi cao nhất.<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"text-align:justify\"><span style=\"font-size:14.0pt;\r\nline-height:115%;font-family:\" segoe=\"\" ui=\"\" emoji\",sans-serif;mso-bidi-font-family:=\"\" \"segoe=\"\" emoji\"\"=\"\">✅</span><span style=\"font-size:14.0pt;line-height:115%;\r\nfont-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">&nbsp;<b>Vị trí ngay trung tâm phường Kon\r\nTum, tỉnh Quảng Ngãi và rất thuận tiện đi lại</b><o:p></o:p></span></p><p class=\"MsoNormal\" style=\"text-align:justify\"><span style=\"font-size:14.0pt;\r\nline-height:115%;font-family:\" segoe=\"\" ui=\"\" emoji\",sans-serif;mso-bidi-font-family:=\"\" \"segoe=\"\" emoji\"\"=\"\">✅</span><span style=\"font-size:14.0pt;line-height:115%;\r\nfont-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">&nbsp;<b>Quy trình khám bệnh nhanh chóng –\r\nchuyên nghiệp, không phải chờ đợi, chen chúc như ở các cơ sở y tế tuyến trên</b><o:p></o:p></span></p><p class=\"MsoNormal\" style=\"text-align:justify\"><span style=\"font-size:14.0pt;\r\nline-height:115%;font-family:\" segoe=\"\" ui=\"\" emoji\",sans-serif;mso-bidi-font-family:=\"\" \"segoe=\"\" emoji\"\"=\"\">✅</span><span style=\"font-size:14.0pt;line-height:115%;\r\nfont-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">&nbsp;<b>Đội ngũ bác sĩ giỏi, người bệnh\r\nkhông chỉ được khám bệnh mà còn được tư vấn phòng bệnh, theo dõi hồ sơ sức khỏe\r\nvà hỗ trợ điều trị phù hợp ngay từ giai đoạn sớm.</b><o:p></o:p></span></p><p class=\"MsoNormal\" style=\"text-align:justify\"><span style=\"font-size:14.0pt;\r\nline-height:115%;font-family:\" segoe=\"\" ui=\"\" emoji\",sans-serif;mso-bidi-font-family:=\"\" \"segoe=\"\" emoji\"\"=\"\">✅</span><span style=\"font-size:14.0pt;line-height:115%;\r\nfont-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">&nbsp;<b>Trang thiết bị siêu âm, xét nghiệm\r\nhiện đại, được đầu tư mới</b><o:p></o:p></span></p><p class=\"MsoNormal\" style=\"text-align:justify\"><span style=\"font-size:14.0pt;\r\nline-height:115%;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">Xu hướng y tế hiện nay\r\nkhuyến khích người dân chăm sóc sức khỏe từ tuyến ban đầu – nơi giúp tiết kiệm\r\nchi phí, tiếp cận dịch vụ nhanh và quản lý sức khỏe hiệu quả.<o:p></o:p></span></p><p class=\"MsoNormal\"><span style=\"font-size:14.0pt;line-height:115%;font-family:\r\n\" times=\"\" new=\"\" roman\",serif\"=\"\">Khi đi khám, vui lòng mang theo: Thẻ BHYT còn hiệu lực\r\nhoặc thẻ Căn cước/CCCD gắn chip hoặc ứng dụng VNeID (định danh mức 2) trên điện\r\nthoại.<o:p></o:p></span></p><p class=\"MsoNormal\"><span style=\"font-size:14.0pt;line-height:115%;font-family:\r\n\" times=\"\" new=\"\" roman\",serif\"=\"\">* Liên hệ ngay&nbsp;<b><u><span style=\"color:#EE0000\">02606.558.568</span></u></b><span style=\"color:#EE0000\">&nbsp;</span>để được hướng dẫn khám BHYT nhanh chóng!<o:p></o:p></span></p><p class=\"MsoNormal\" align=\"center\" style=\"text-align:center\">\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n</p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\" style=\"text-align: justify; margin-bottom: 6pt; line-height: 115%;\"><img src=\"https://phongkhamcdkontum.com.vn/uploads/images/5967db3f7fcede80bb973c5fc3ef348a-40337fa7d5b75be902a6.jpg\" style=\"width: 939.988px; float: left;\" class=\"note-float-left\"><br></p>', 'f8061fc3b2bf9670cb56a2f04a765fc5-40337fa7d5b75be902a6.jpg', 1, 0, 24, 4, '2026-02-09 09:04:56'),
(7, 0, 'Thông báo chính thức triển khai khám bệnh, chữa bệnh Bảo hiểm y tế tại Phòng khám Đa khoa Trường Cao đẳng Kon Tum', 'Nhằm mở rộng quyền lợi và tạo điều kiện thuận lợi cho người dân trong công tác chăm sóc sức khỏe, bên cạnh các dịch vụ khám chữa bệnh theo yêu cầu hiện có, Phòng khám Đa khoa Trường Cao đẳng Kon Tum chính thức triển khai khám, chữa bệnh Bảo hiểm y tế cho mọi người dân có Bảo hiểm y tế.', '<p></p><div style=\"text-align: justify;\"><span style=\"white-space-collapse: preserve;\">Nhằm mở rộng quyền lợi và tạo điều kiện thuận lợi cho người dân trong công tác chăm sóc sức khỏe, bên cạnh các dịch vụ khám chữa bệnh theo yêu cầu hiện có, Phòng khám Đa khoa Trường Cao đẳng Kon Tum chính thức triển khai khám, chữa bệnh Bảo hiểm y tế cho mọi người dân có Bảo hiểm y tế.</span></div><div style=\"text-align: justify;\"><b><span style=\"white-space-collapse: preserve;\"><br></span></b></div><div style=\"text-align: justify;\"><b><span style=\"white-space-collapse: preserve;\">Thời gian áp dụng: từ ngày 16/03/2026</span></b></div><b><span style=\"white-space-collapse: preserve;\"><div style=\"text-align: justify;\"><b>Địa điểm: Phòng khám Đa khoa Trường Cao đẳng Kon Tum</b></div></span><span style=\"white-space-collapse: preserve;\"><div style=\"text-align: justify;\"><b>Địa chỉ: số 347 Bà Triệu, phường Kon Tum, tỉnh Quảng Ngãi</b></div></span></b><div style=\"text-align: justify;\"><span style=\"font-size: 14px;\"><br></span></div><span style=\"white-space-collapse: preserve;\"><div style=\"text-align: justify;\">Với đội ngũ Y - Bác sĩ tận tâm, cơ sở vật chất đảm bảo đạt chuẩn,  Phòng khám cam kết mang đến dịch vụ khám, chữa bệnh Chất lượng – An toàn – Đúng quy định, góp phần chăm sóc và bảo vệ sức khỏe cộng đồng một các hiệu quả.</div></span><br><span style=\"white-space-collapse: preserve;\">⚜PHÒNG KHÁM ĐA KHOA TRƯỜNG CAO ĐẲNG KON TUM – “UY TÍN TỪ CHUYÊN MÔN – AN TÂM TỪ DỊCH VỤ”⚜</span><br><p></p>', '6e1c9fa97d13a425bcedd3285c887f44-39531ac7b0d73e8967c6.jpg', 1, 0, 24, 4, '2026-02-09 09:40:57'),
(8, 0, 'CẢNH GIÁC VIRUS NIPAH: NGUY CƠ DỊCH BỆNH MỚI', 'Thời gian gần đây, một số quốc gia châu Á ghi nhận các ca nhiễm virus Nipah — loại virus có khả năng gây bệnh nặng với tỷ lệ tử vong cao. Theo các cơ quan y tế quốc tế, virus này lây truyền từ động vật sang người và có thể gây viêm não cấp tính.', '<p class=\"MsoNormal\" style=\"text-align: justify; \"><b><span style=\"font-size:14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"><font color=\"#0000ff\">Virus\r\nNipah là gì?<o:p></o:p></font></span></b></p><p class=\"MsoNormal\" style=\"text-align: justify;\"><span style=\"font-size:14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"><font color=\"#0000ff\">Virus\r\nNipah (Nipah virus – NiV) là một loại virus thuộc họ Paramyxoviridae, lần đầu\r\ntiên được phát hiện năm 1998 tại Malaysia. Đây là bệnh truyền nhiễm nguy hiểm\r\nlây từ động vật sang người (zoonotic disease), chủ yếu liên quan đến loài dơi\r\năn quả (fruit bats).<o:p></o:p></font></span></p><p class=\"MsoNormal\" style=\"text-align: justify; \"><span style=\"font-size:14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"><font color=\"#0000ff\">Theo\r\nTổ chức Y tế Thế giới (WHO), Nipah được xếp vào nhóm tác nhân gây bệnh có nguy\r\ncơ bùng phát dịch lớn do:<o:p></o:p></font></span></p><p>\r\n </p><ul><li style=\"text-align: justify; text-indent: -18pt;\"><span style=\"font-size:14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"><font color=\"#0000ff\">&nbsp;Tỷ\r\n     lệ tử vong cao<o:p></o:p></font></span></li>\r\n <li class=\"MsoNormal\" style=\"text-align: justify; text-indent: -18pt;\"><span style=\"font-size:14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"><font color=\"#0000ff\">&nbsp;Chưa\r\n     có thuốc điều trị đặc hiệu<o:p></o:p></font></span></li>\r\n <li class=\"MsoNormal\" style=\"text-align: justify; text-indent: -18pt;\"><span style=\"font-size:14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"><font color=\"#0000ff\">&nbsp;Chưa\r\n     có vaccine được cấp phép sử dụng rộng rãi<o:p></o:p></font></span></li>\r\n</ul><p class=\"MsoNormal\" style=\"text-align: justify;\"><b><span style=\"font-size:14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"><font color=\"#0000ff\">Vì\r\nsao virus Nipah đang được cảnh báo trở lại?</font></span></b></p><p class=\"MsoNormal\" style=\"text-align: justify;\"><span style=\"color: rgb(0, 0, 255); font-size: 14pt;\">Trong\r\nnhững năm gần đây, nhiều ca bệnh Nipah được ghi nhận rải rác tại Nam Á và Đông\r\nNam Á, đặc biệt là tại Ấn Độ và Bangladesh. Các chuyên gia y tế lo ngại nguy cơ\r\nbùng phát dịch do:</span></p><ul>\r\n <li style=\"text-align: justify; text-indent: -18pt;\"><span style=\"font-size:14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"><font color=\"#0000ff\">&nbsp;Khả\r\n     năng lây truyền từ người sang người<o:p></o:p></font></span></li>\r\n <li class=\"MsoNormal\" style=\"text-align: justify; text-indent: -18pt;\"><span style=\"font-size:14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"><font color=\"#0000ff\">&nbsp;Tỷ\r\n     lệ tử vong cao (40% – 75%)<o:p></o:p></font></span></li>\r\n <li class=\"MsoNormal\" style=\"text-align: justify; text-indent: -18pt;\"><span style=\"font-size:14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"><font color=\"#0000ff\">&nbsp;Diễn\r\n     tiến bệnh nhanh và nguy hiểm<o:p></o:p></font></span></li>\r\n</ul><p class=\"MsoNormal\" style=\"text-align: justify;\"><b><span style=\"font-size:14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"><font color=\"#0000ff\">Virus\r\nNipah lây truyền như thế nào?<o:p></o:p></font></span></b></p><p class=\"MsoNormal\" style=\"text-align: justify;\"><span style=\"font-size:14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"><font color=\"#0000ff\">Virus\r\ncó thể lây qua nhiều con đường:<o:p></o:p></font></span></p><p class=\"MsoNormal\" style=\"text-align: justify;\"><font color=\"#0000ff\"><span style=\"font-size:14.0pt;\r\nfont-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">1️</span><span style=\"font-size:14.0pt;\r\nfont-family:\" segoe=\"\" ui=\"\" symbol\",sans-serif;mso-bidi-font-family:\"segoe=\"\" symbol\"\"=\"\">⃣</span><span style=\"font-size:14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"> Từ động vật sang\r\nngười: Tiếp xúc với dơi nhiễm bệnh hoặc dịch tiết của dơi; Ăn trái cây bị dơi cắn;\r\nUống nước hoặc thực phẩm nhiễm virus<o:p></o:p></span></font></p><p class=\"MsoNormal\" style=\"text-align: justify;\"><font color=\"#0000ff\"><span style=\"font-size:14.0pt;\r\nfont-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">2️</span><span style=\"font-size:14.0pt;\r\nfont-family:\" segoe=\"\" ui=\"\" symbol\",sans-serif;mso-bidi-font-family:\"segoe=\"\" symbol\"\"=\"\">⃣</span><span style=\"font-size:14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"> Từ động vật nuôi\r\nsang người: Lợn từng là nguồn lây lớn trong các đợt dịch trước đây.<o:p></o:p></span></font></p><p class=\"MsoNormal\" style=\"text-align: justify;\"><font color=\"#0000ff\"><span style=\"font-size:14.0pt;\r\nfont-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">3️</span><span style=\"font-size:14.0pt;\r\nfont-family:\" segoe=\"\" ui=\"\" symbol\",sans-serif;mso-bidi-font-family:\"segoe=\"\" symbol\"\"=\"\">⃣</span><span style=\"font-size:14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"> Lây từ người sang\r\nngười: Qua dịch tiết đường hô hấp; Tiếp xúc gần với người bệnh; Môi trường chăm\r\nsóc y tế không đảm bảo kiểm soát nhiễm khuẩn<o:p></o:p></span></font></p><p class=\"MsoNormal\" style=\"text-align: justify;\"><b><span style=\"font-size:14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"><font color=\"#0000ff\">Triệu\r\nchứng nhận biết nhiễm virus Nipah<o:p></o:p></font></span></b></p><p class=\"MsoNormal\" style=\"text-align: justify;\"><span style=\"font-size:14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"><font color=\"#0000ff\">Thời\r\ngian ủ bệnh thường từ 4 – 14 ngày.<o:p></o:p></font></span></p><p class=\"MsoNormal\" style=\"text-align: justify;\"><span style=\"font-size:14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"><font color=\"#0000ff\">Các\r\ntriệu chứng có thể bao gồm: Sốt cao đột ngột; Đau đầu, đau cơ; Ho, khó thở; Buồn\r\nnôn, mệt mỏi.<o:p></o:p></font></span></p><p class=\"MsoNormal\" style=\"text-align: justify;\"><span style=\"font-size:14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"><font color=\"#0000ff\">Ở\r\ngiai đoạn nặng:<o:p></o:p></font></span></p><p class=\"MsoNormal\" style=\"text-align: justify;\"><font color=\"#0000ff\"><span style=\"font-size:14.0pt;font-family:\" segoe=\"\" ui=\"\" emoji\",sans-serif;=\"\" mso-bidi-font-family:\"segoe=\"\" emoji\"\"=\"\">⚠️</span><span style=\"font-size:14.0pt;\r\nfont-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"> Viêm não cấp<o:p></o:p></span></font></p><p class=\"MsoNormal\" style=\"text-align: justify;\"><font color=\"#0000ff\"><span style=\"font-size:14.0pt;font-family:\" segoe=\"\" ui=\"\" emoji\",sans-serif;=\"\" mso-bidi-font-family:\"segoe=\"\" emoji\"\"=\"\">⚠️</span><span style=\"font-size:14.0pt;\r\nfont-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"> Rối loạn ý thức<o:p></o:p></span></font></p><p class=\"MsoNormal\" style=\"text-align: justify;\"><font color=\"#0000ff\"><span style=\"font-size:14.0pt;font-family:\" segoe=\"\" ui=\"\" emoji\",sans-serif;=\"\" mso-bidi-font-family:\"segoe=\"\" emoji\"\"=\"\">⚠️</span><span style=\"font-size:14.0pt;\r\nfont-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"> Co giật<o:p></o:p></span></font></p><p class=\"MsoNormal\" style=\"text-align: justify;\"><font color=\"#0000ff\"><span style=\"font-size:14.0pt;font-family:\" segoe=\"\" ui=\"\" emoji\",sans-serif;=\"\" mso-bidi-font-family:\"segoe=\"\" emoji\"\"=\"\">⚠️</span><span style=\"font-size:14.0pt;\r\nfont-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"> Hôn mê<o:p></o:p></span></font></p><p class=\"MsoNormal\" style=\"text-align: justify;\"><span style=\"font-size:14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"><font color=\"#0000ff\">Bệnh\r\ncó thể tiến triển nhanh và gây tử vong.<o:p></o:p></font></span></p><p class=\"MsoNormal\" style=\"text-align: justify;\"><b><span style=\"font-size:14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"><font color=\"#0000ff\">Vì\r\nsao Nipah nguy hiểm?<o:p></o:p></font></span></b></p><ul style=\"margin-top:0cm\" type=\"disc\">\r\n <li class=\"MsoNormal\" style=\"text-align: justify; text-indent: -18pt;\"><span style=\"font-size:14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"><font color=\"#0000ff\">Chưa\r\n     có thuốc đặc trị.<o:p></o:p></font></span></li>\r\n <li class=\"MsoNormal\" style=\"text-align: justify; text-indent: -18pt;\"><span style=\"font-size:14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"><font color=\"#0000ff\">Điều\r\n     trị chủ yếu là hỗ trợ triệu chứng.<o:p></o:p></font></span></li>\r\n <li class=\"MsoNormal\" style=\"text-align: justify; text-indent: -18pt;\"><span style=\"font-size:14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"><font color=\"#0000ff\">Một\r\n     số bệnh nhân sống sót có thể gặp biến chứng thần kinh lâu dài.<o:p></o:p></font></span></li>\r\n</ul><p class=\"MsoNormal\" style=\"text-align: justify;\"><span style=\"font-size:14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"><font color=\"#0000ff\">WHO\r\nđánh giá Nipah là một trong những virus cần ưu tiên nghiên cứu vaccine do nguy\r\ncơ đại dịch trong tương lai.<o:p></o:p></font></span></p><p class=\"MsoNormal\" style=\"text-align: justify;\"><b><span style=\"font-size:14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"><font color=\"#0000ff\">Người\r\ndân cần làm gì để phòng ngừa?<o:p></o:p></font></span></b></p><p class=\"MsoNormal\" style=\"text-align: justify;\"><span style=\"font-size:14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"><font color=\"#0000ff\">Phòng\r\nkhám Đa khoa Trường Cao đẳng Kon Tum khuyến cáo người dân thực hiện các biện\r\npháp sau:<o:p></o:p></font></span></p><p class=\"MsoNormal\" style=\"text-align: justify;\"><font color=\"#0000ff\"><span style=\"font-size:14.0pt;font-family:\" segoe=\"\" ui=\"\" emoji\",sans-serif;=\"\" mso-bidi-font-family:\"segoe=\"\" emoji\"\"=\"\">✅</span><span style=\"font-size:14.0pt;\r\nfont-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"> Không ăn trái cây bị dơi cắn hoặc rơi xuống\r\nđất<o:p></o:p></span></font></p><p class=\"MsoNormal\" style=\"text-align: justify;\"><font color=\"#0000ff\"><span style=\"font-size:14.0pt;font-family:\" segoe=\"\" ui=\"\" emoji\",sans-serif;=\"\" mso-bidi-font-family:\"segoe=\"\" emoji\"\"=\"\">✅</span><span style=\"font-size:14.0pt;\r\nfont-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"> Rửa sạch và gọt vỏ trái cây trước khi ăn<o:p></o:p></span></font></p><p class=\"MsoNormal\" style=\"text-align: justify;\"><font color=\"#0000ff\"><span style=\"font-size:14.0pt;font-family:\" segoe=\"\" ui=\"\" emoji\",sans-serif;=\"\" mso-bidi-font-family:\"segoe=\"\" emoji\"\"=\"\">✅</span><span style=\"font-size:14.0pt;\r\nfont-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"> Tránh tiếp xúc động vật hoang dã<o:p></o:p></span></font></p><p class=\"MsoNormal\" style=\"text-align: justify;\"><font color=\"#0000ff\"><span style=\"font-size:14.0pt;font-family:\" segoe=\"\" ui=\"\" emoji\",sans-serif;=\"\" mso-bidi-font-family:\"segoe=\"\" emoji\"\"=\"\">✅</span><span style=\"font-size:14.0pt;\r\nfont-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"> Rửa tay thường xuyên bằng xà phòng<o:p></o:p></span></font></p><p class=\"MsoNormal\" style=\"text-align: justify;\"><font color=\"#0000ff\"><span style=\"font-size:14.0pt;font-family:\" segoe=\"\" ui=\"\" emoji\",sans-serif;=\"\" mso-bidi-font-family:\"segoe=\"\" emoji\"\"=\"\">✅</span><span style=\"font-size:14.0pt;\r\nfont-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"> Đeo khẩu trang khi có triệu chứng hô hấp<o:p></o:p></span></font></p><p class=\"MsoNormal\" style=\"text-align: justify;\"><font color=\"#0000ff\"><span style=\"font-size:14.0pt;font-family:\" segoe=\"\" ui=\"\" emoji\",sans-serif;=\"\" mso-bidi-font-family:\"segoe=\"\" emoji\"\"=\"\">✅</span><span style=\"font-size:14.0pt;\r\nfont-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"> Đến cơ sở y tế khi có dấu hiệu nghi ngờ\r\nsau khi đi vùng dịch<o:p></o:p></span></font></p><p class=\"MsoNormal\" style=\"text-align: justify;\"><b><span style=\"font-size:14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"><font color=\"#0000ff\">Khi\r\nnào cần đi khám ngay?<o:p></o:p></font></span></b></p><p class=\"MsoNormal\" style=\"text-align: justify;\"><span style=\"font-size:14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"><font color=\"#0000ff\">Người\r\ndân nên đến cơ sở y tế nếu:<o:p></o:p></font></span></p><ul style=\"margin-top:0cm\" type=\"disc\">\r\n <li class=\"MsoNormal\" style=\"text-align: justify; text-indent: -18pt;\"><span style=\"font-size:14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"><font color=\"#0000ff\">Sốt\r\n     cao kéo dài không rõ nguyên nhân<o:p></o:p></font></span></li>\r\n <li class=\"MsoNormal\" style=\"text-align: justify; text-indent: -18pt;\"><span style=\"font-size:14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"><font color=\"#0000ff\">Có\r\n     triệu chứng thần kinh (lú lẫn, đau đầu dữ dội)<o:p></o:p></font></span></li>\r\n <li class=\"MsoNormal\" style=\"text-align: justify; text-indent: -18pt;\"><span style=\"font-size:14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"><font color=\"#0000ff\">Tiếp\r\n     xúc người nghi nhiễm hoặc từng đi vùng có cảnh báo dịch<o:p></o:p></font></span></li>\r\n</ul><p>\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n</p><p class=\"MsoNormal\" style=\"text-align: justify; \"><b><span style=\"font-size:14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"><font color=\"#0000ff\">Virus\r\nNipah tuy chưa phổ biến tại Việt Nam nhưng nguy cơ dịch bệnh mới nổi luôn tồn tại.\r\nChủ động cập nhật thông tin chính thống và thực hiện các biện pháp phòng ngừa\r\nlà cách tốt nhất để bảo vệ sức khỏe cá nhân và cộng đồng.</font></span></b></p><p class=\"MsoNormal\" style=\"text-align: justify; \"><b><span style=\"font-size:14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"><font color=\"#0000ff\">Nguồn tham khảo:&nbsp;</font></span></b><a href=\"https://www.who.int/news-room/fact-sheets/detail/nipah-virus\" target=\"_blank\" style=\"background-color: rgb(255, 255, 255);\"><span style=\"font-family: \" times=\"\" new=\"\" roman\";=\"\" font-size:=\"\" 18px;\"=\"\">Nipah virus – World Health Organization</span></a>;&nbsp;<a href=\"https://www.cdc.gov/nipah-virus/hcp/clinical-overview/index.html?utm_source=chatgpt.com\" target=\"_blank\"><span style=\"font-family: \" times=\"\" new=\"\" roman\";=\"\" font-size:=\"\" 18px;\"=\"\">About Nipah Virus – CDC</span></a></p><p class=\"MsoNormal\" style=\"text-align: justify; \"><b><span style=\"font-size:14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"><o:p></o:p></span></b></p>', '6fb350927c21473d4e3bdda30bfd15de-Gemini_Generated_Image_inwnv5inwnv5inwn.png', 1, 0, 24, 4, '2026-02-12 16:28:09'),
(9, 0, 'XU HƯỚNG Y TẾ HIỆN ĐẠI: CHĂM SÓC SỨC KHỎE TỪ TUYẾN BAN ĐẦU – GIẢI PHÁP BỀN VỮNG CHO CỘNG ĐỒNG', 'Trong những năm gần đây, hệ thống y tế trên thế giới và tại Việt Nam đang chuyển dịch mạnh mẽ sang mô hình chăm sóc sức khỏe ban đầu (Primary Health Care) — nơi người dân được tiếp cận dịch vụ y tế ngay từ tuyến cơ sở, giúp phòng bệnh, phát hiện sớm và quản lý sức khỏe hiệu quả hơn.  Theo Tổ chức Y tế Thế giới (WHO), chăm sóc sức khỏe ban đầu là nền tảng quan trọng để xây dựng hệ thống y tế bền vững, bảo đảm mọi người dân được chăm sóc sức khỏe toàn diện, liên tục và công bằng.', '<p class=\"MsoNormal\"><img src=\"https://phongkhamcdkontum.com.vn/uploads/images/df4f0d9068cf3e14d568761bc243116d-ChatGPTImageFeb12202604_38_30PM.png\" style=\"width: 1255px;\"><b><span style=\"font-size:14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"><br></span></b></p><p class=\"MsoNormal\"><b><span style=\"font-size:14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">Vì\r\nsao chăm sóc sức khỏe từ tuyến ban đầu trở thành xu hướng?<o:p></o:p></span></b></p><p class=\"MsoNormal\"><span style=\"font-size:14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">Trước\r\nđây, nhiều người có xu hướng đến bệnh viện tuyến trên ngay khi có vấn đề sức khỏe.\r\nTuy nhiên, mô hình này dẫn đến:<o:p></o:p></span></p><p class=\"MsoListParagraphCxSpFirst\" style=\"margin-left:54.0pt;mso-add-space:\r\nauto;text-indent:-18.0pt;mso-list:l2 level1 lfo1\"><!--[if !supportLists]--><span style=\"font-size:14.0pt;font-family:Symbol;mso-fareast-font-family:Symbol;\r\nmso-bidi-font-family:Symbol\">·<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-size-adjust: none; font-language-override: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-variant-position: normal; font-variant-emoji: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \" times=\"\" new=\"\" roman\";\"=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span style=\"font-size:14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">Quá tải bệnh viện\r\nlớn<o:p></o:p></span></p><p class=\"MsoListParagraphCxSpMiddle\" style=\"margin-left:54.0pt;mso-add-space:\r\nauto;text-indent:-18.0pt;mso-list:l2 level1 lfo1\"><!--[if !supportLists]--><span style=\"font-size:14.0pt;font-family:Symbol;mso-fareast-font-family:Symbol;\r\nmso-bidi-font-family:Symbol\">·<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-size-adjust: none; font-language-override: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-variant-position: normal; font-variant-emoji: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \" times=\"\" new=\"\" roman\";\"=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span style=\"font-size:14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">Thời gian chờ đợi\r\nkéo dài<o:p></o:p></span></p><p class=\"MsoListParagraphCxSpLast\" style=\"margin-left:54.0pt;mso-add-space:auto;\r\ntext-indent:-18.0pt;mso-list:l2 level1 lfo1\"><!--[if !supportLists]--><span style=\"font-size:14.0pt;font-family:Symbol;mso-fareast-font-family:Symbol;\r\nmso-bidi-font-family:Symbol\">·<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-size-adjust: none; font-language-override: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-variant-position: normal; font-variant-emoji: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \" times=\"\" new=\"\" roman\";\"=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span style=\"font-size:14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">Chi phí khám chữa\r\nbệnh tăng cao<o:p></o:p></span></p><p class=\"MsoNormal\"><span style=\"font-size:14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">Chăm\r\nsóc sức khỏe ban đầu giúp giải quyết các vấn đề này bằng cách:<o:p></o:p></span></p><p class=\"MsoNormal\"><span style=\"font-size:14.0pt;font-family:\" segoe=\"\" ui=\"\" emoji\",sans-serif;=\"\" mso-bidi-font-family:\"segoe=\"\" emoji\"\"=\"\">✅</span><span style=\"font-size:14.0pt;\r\nfont-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"> Phát hiện bệnh sớm ngay từ giai đoạn nhẹ<o:p></o:p></span></p><p class=\"MsoNormal\"><span style=\"font-size:14.0pt;font-family:\" segoe=\"\" ui=\"\" emoji\",sans-serif;=\"\" mso-bidi-font-family:\"segoe=\"\" emoji\"\"=\"\">✅</span><span style=\"font-size:14.0pt;\r\nfont-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"> Điều trị kịp thời, giảm biến chứng<o:p></o:p></span></p><p class=\"MsoNormal\"><span style=\"font-size:14.0pt;font-family:\" segoe=\"\" ui=\"\" emoji\",sans-serif;=\"\" mso-bidi-font-family:\"segoe=\"\" emoji\"\"=\"\">✅</span><span style=\"font-size:14.0pt;\r\nfont-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"> Theo dõi sức khỏe lâu dài và liên tục<o:p></o:p></span></p><p class=\"MsoNormal\"><span style=\"font-size:14.0pt;font-family:\" segoe=\"\" ui=\"\" emoji\",sans-serif;=\"\" mso-bidi-font-family:\"segoe=\"\" emoji\"\"=\"\">✅</span><span style=\"font-size:14.0pt;\r\nfont-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"> Giảm chi phí y tế cho người bệnh<o:p></o:p></span></p><p class=\"MsoNormal\"><b><span style=\"font-size:14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">Vai\r\ntrò của cơ sở khám chữa bệnh ban đầu<o:p></o:p></span></b></p><p class=\"MsoNormal\"><span style=\"font-size:14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">Các\r\ncơ sở khám chữa bệnh ban đầu như phòng khám đa khoa đóng vai trò “cửa ngõ” của\r\nhệ thống y tế.<o:p></o:p></span></p><p class=\"MsoNormal\"><span style=\"font-size:14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">Người\r\ndân có thể:<o:p></o:p></span></p><p class=\"MsoListParagraphCxSpFirst\" style=\"margin-left:54.0pt;mso-add-space:\r\nauto;text-indent:-18.0pt;mso-list:l0 level1 lfo2\"><!--[if !supportLists]--><span style=\"font-size:14.0pt;font-family:Symbol;mso-fareast-font-family:Symbol;\r\nmso-bidi-font-family:Symbol\">·<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-size-adjust: none; font-language-override: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-variant-position: normal; font-variant-emoji: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \" times=\"\" new=\"\" roman\";\"=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span style=\"font-size:14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">Khám các bệnh\r\nthông thường và bệnh mạn tính<o:p></o:p></span></p><p class=\"MsoListParagraphCxSpMiddle\" style=\"margin-left:54.0pt;mso-add-space:\r\nauto;text-indent:-18.0pt;mso-list:l0 level1 lfo2\"><!--[if !supportLists]--><span style=\"font-size:14.0pt;font-family:Symbol;mso-fareast-font-family:Symbol;\r\nmso-bidi-font-family:Symbol\">·<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-size-adjust: none; font-language-override: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-variant-position: normal; font-variant-emoji: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \" times=\"\" new=\"\" roman\";\"=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span style=\"font-size:14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">Được tư vấn phòng\r\nbệnh và chăm sóc sức khỏe cá nhân<o:p></o:p></span></p><p class=\"MsoListParagraphCxSpMiddle\" style=\"margin-left:54.0pt;mso-add-space:\r\nauto;text-indent:-18.0pt;mso-list:l0 level1 lfo2\"><!--[if !supportLists]--><span style=\"font-size:14.0pt;font-family:Symbol;mso-fareast-font-family:Symbol;\r\nmso-bidi-font-family:Symbol\">·<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-size-adjust: none; font-language-override: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-variant-position: normal; font-variant-emoji: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \" times=\"\" new=\"\" roman\";\"=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span style=\"font-size:14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">Thực hiện xét nghiệm,\r\nchẩn đoán ban đầu<o:p></o:p></span></p><p class=\"MsoListParagraphCxSpLast\" style=\"margin-left:54.0pt;mso-add-space:auto;\r\ntext-indent:-18.0pt;mso-list:l0 level1 lfo2\"><!--[if !supportLists]--><span style=\"font-size:14.0pt;font-family:Symbol;mso-fareast-font-family:Symbol;\r\nmso-bidi-font-family:Symbol\">·<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-size-adjust: none; font-language-override: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-variant-position: normal; font-variant-emoji: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \" times=\"\" new=\"\" roman\";\"=\"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span style=\"font-size:14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">Được chuyển tuyến\r\nđúng quy định khi cần điều trị chuyên sâu<o:p></o:p></span></p><p class=\"MsoNormal\"><span style=\"font-size:14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">Tại\r\nViệt Nam, chính sách bảo hiểm y tế cũng khuyến khích người dân khám chữa bệnh tại\r\ntuyến ban đầu nhằm nâng cao hiệu quả sử dụng nguồn lực y tế.<o:p></o:p></span></p><p class=\"MsoNormal\"><b><span style=\"font-size:14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">Lợi\r\ních thiết thực đối với người dân<o:p></o:p></span></b></p><p class=\"MsoNormal\"><span style=\"font-size:14.0pt;font-family:\" segoe=\"\" ui=\"\" emoji\",sans-serif;=\"\" mso-bidi-font-family:\"segoe=\"\" emoji\"\"=\"\">????</span><span style=\"font-size:\r\n14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"> Khám nhanh – giảm thời gian chờ: Người\r\nbệnh không phải di chuyển xa hoặc chờ đợi tại bệnh viện lớn.<o:p></o:p></span></p><p class=\"MsoNormal\"><span style=\"font-size:14.0pt;font-family:\" segoe=\"\" ui=\"\" emoji\",sans-serif;=\"\" mso-bidi-font-family:\"segoe=\"\" emoji\"\"=\"\">????</span><span style=\"font-size:\r\n14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"> Quản lý sức khỏe lâu dài: Bác sĩ\r\ntuyến ban đầu theo dõi hồ sơ sức khỏe, giúp phát hiện sớm các nguy cơ bệnh lý.<o:p></o:p></span></p><p class=\"MsoNormal\"><span style=\"font-size:14.0pt;font-family:\" segoe=\"\" ui=\"\" emoji\",sans-serif;=\"\" mso-bidi-font-family:\"segoe=\"\" emoji\"\"=\"\">????</span><span style=\"font-size:\r\n14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"> Tiết kiệm chi phí: Khám đúng tuyến\r\nban đầu giúp người dân được hưởng quyền lợi bảo hiểm y tế tối ưu theo quy định.<o:p></o:p></span></p><p class=\"MsoNormal\"><span style=\"font-size:14.0pt;font-family:\" segoe=\"\" ui=\"\" emoji\",sans-serif;=\"\" mso-bidi-font-family:\"segoe=\"\" emoji\"\"=\"\">????</span><span style=\"font-size:\r\n14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"> Tiếp cận dịch vụ y tế gần gũi: Cơ\r\nsở y tế địa phương giúp người dân dễ dàng tiếp cận chăm sóc sức khỏe định kỳ.<o:p></o:p></span></p><p class=\"MsoNormal\"><b><span style=\"font-size:14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">Vai\r\ntrò của Phòng khám Đa khoa Trường Cao đẳng Kon Tum<o:p></o:p></span></b></p><p class=\"MsoNormal\"><span style=\"font-size:14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">Với\r\nđịnh hướng phát triển theo mô hình chăm sóc sức khỏe ban đầu hiện đại, Phòng\r\nkhám Đa khoa Trường Cao đẳng Kon Tum mang đến cho người dân:<o:p></o:p></span></p><p class=\"MsoNormal\"><span style=\"font-size:14.0pt;font-family:\" segoe=\"\" ui=\"\" emoji\",sans-serif;=\"\" mso-bidi-font-family:\"segoe=\"\" emoji\"\"=\"\">✔️</span><span style=\"font-size:14.0pt;\r\nfont-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"> Dịch vụ khám chữa bệnh bảo hiểm y tế thuận\r\ntiện<o:p></o:p></span></p><p class=\"MsoNormal\"><span style=\"font-size:14.0pt;font-family:\" segoe=\"\" ui=\"\" emoji\",sans-serif;=\"\" mso-bidi-font-family:\"segoe=\"\" emoji\"\"=\"\">✔️</span><span style=\"font-size:14.0pt;\r\nfont-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"> Đội ngũ bác sĩ tận tâm, chuyên môn vững<o:p></o:p></span></p><p class=\"MsoNormal\"><span style=\"font-size:14.0pt;font-family:\" segoe=\"\" ui=\"\" emoji\",sans-serif;=\"\" mso-bidi-font-family:\"segoe=\"\" emoji\"\"=\"\">✔️</span><span style=\"font-size:14.0pt;\r\nfont-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"> Trang thiết bị hỗ trợ chẩn đoán hiện đại<o:p></o:p></span></p><p class=\"MsoNormal\"><span style=\"font-size:14.0pt;font-family:\" segoe=\"\" ui=\"\" emoji\",sans-serif;=\"\" mso-bidi-font-family:\"segoe=\"\" emoji\"\"=\"\">✔️</span><span style=\"font-size:14.0pt;\r\nfont-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"> Quy trình khám nhanh, hỗ trợ thủ tục BHYT\r\nđầy đủ<o:p></o:p></span></p><p class=\"MsoNormal\"><span style=\"font-size:14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">Phòng\r\nkhám không chỉ điều trị bệnh mà còn đồng hành cùng người dân trong việc quản lý\r\nsức khỏe lâu dài.<o:p></o:p></span></p><p class=\"MsoNormal\"><b><i><span style=\"font-size:14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">Chăm\r\nsóc sức khỏe hiệu quả không bắt đầu từ khi bệnh nặng, mà từ việc chủ động khám\r\nvà theo dõi sức khỏe ngay từ tuyến ban đầu. Lựa chọn đúng cơ sở khám chữa bệnh\r\nban đầu giúp người dân tiết kiệm thời gian, chi phí và bảo vệ sức khỏe bền vững.<o:p></o:p></span></i></b></p><p class=\"MsoNormal\"><b><span style=\"font-size:14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">Nguồn tham khảo<span style=\"font-family: &quot;Times New Roman&quot;; font-size: 18px;\">:&nbsp;</span></span></b><a href=\"https://www.who.int/health-topics/primary-health-care\" style=\"text-indent: -18pt; background-color: rgb(255, 255, 255);\"><span style=\"font-size: 18px;\">WHO: Primary Health Care</span></a>;<span style=\"font-family: &quot;Times New Roman&quot;; font-size: 18px;\">&nbsp;&nbsp;</span><a href=\"https://moh.gov.vn\" style=\"text-indent: -18pt; background-color: rgb(255, 255, 255);\"><span style=\"font-family: &quot;Times New Roman&quot;; font-size: 18px;\">Bộ Y tế Việt nam: Định hướng phát triển chăm sóc sức khỏe ban đầu</span></a></p>', '94d90e27f9924c8e5d9b12f4458c5b66-ChatGPTImageFeb12202604_38_30PM.png', 1, 0, 24, 4, '2026-02-12 16:40:02');
INSERT INTO `hicrm_events` (`id`, `user_id`, `event_name`, `event_description`, `event_content`, `event_image`, `event_type`, `event_hot`, `event_user_created`, `event_status`, `event_created_date`) VALUES
(10, 0, 'VÌ SAO NÊN KHÁM SỨC KHỎE ĐỊNH KỲ? CHỦ ĐỘNG HÔM NAY – AN TÂM NGÀY MAI', 'Trong cuộc sống hiện đại, nhiều người chỉ đi khám khi cơ thể đã xuất hiện triệu chứng rõ ràng. Tuy nhiên, thực tế cho thấy phần lớn bệnh lý nguy hiểm như tim mạch, tiểu đường, ung thư hay rối loạn chuyển hóa thường tiến triển âm thầm trong thời gian dài.  Khám sức khỏe định kỳ chính là giải pháp giúp phát hiện sớm các nguy cơ, từ đó bảo vệ sức khỏe một cách chủ động và hiệu quả.', '<p data-start=\"267\" data-end=\"521\"></p><p class=\"MsoNormal\" style=\"text-align: center; \"><img src=\"https://phongkhamcdkontum.com.vn/uploads/images/b2c97b52d22e1f0b3771ed1aa668109a-ChatGPTImageFeb12202604_49_54PM.png\" style=\"width: 1255px;\"><span style=\"font-size:14.0pt;font-family:&quot;Times New Roman&quot;,serif\"><br></span></p><p class=\"MsoNormal\"><span style=\"font-size:14.0pt;font-family:&quot;Times New Roman&quot;,serif\">Trong\r\ncuộc sống hiện đại, nhiều người chỉ đi khám khi cơ thể đã xuất hiện triệu chứng\r\nrõ ràng. Tuy nhiên, thực tế cho thấy phần lớn bệnh lý nguy hiểm như tim mạch,\r\ntiểu đường, ung thư hay rối loạn chuyển hóa thường tiến triển âm thầm trong thời\r\ngian dài.<o:p></o:p></span></p><p class=\"MsoNormal\"><span style=\"font-size:14.0pt;font-family:&quot;Times New Roman&quot;,serif\">Khám\r\nsức khỏe định kỳ chính là giải pháp giúp phát hiện sớm các nguy cơ, từ đó bảo vệ\r\nsức khỏe một cách chủ động và hiệu quả.<o:p></o:p></span></p><p class=\"MsoNormal\"><b><span style=\"font-size:14.0pt;font-family:&quot;Times New Roman&quot;,serif\">Khám\r\nsức khỏe định kỳ là gì?<o:p></o:p></span></b></p><p class=\"MsoNormal\"><span style=\"font-size:14.0pt;font-family:&quot;Times New Roman&quot;,serif\">Khám\r\nsức khỏe định kỳ là việc kiểm tra tổng thể tình trạng sức khỏe theo kế hoạch định\r\nsẵn (6 tháng hoặc 12 tháng/lần), bao gồm:<o:p></o:p></span></p><p class=\"MsoListParagraphCxSpFirst\" style=\"margin-left:54.0pt;mso-add-space:\r\nauto;text-indent:-18.0pt;mso-list:l0 level1 lfo1\"><!--[if !supportLists]--><span style=\"font-size:14.0pt;font-family:Symbol;mso-fareast-font-family:Symbol;\r\nmso-bidi-font-family:Symbol\">·<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-size-adjust: none; font-language-override: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-variant-position: normal; font-variant-emoji: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span style=\"font-size:14.0pt;font-family:&quot;Times New Roman&quot;,serif\">Khám lâm sàng với\r\nbác sĩ<o:p></o:p></span></p><p class=\"MsoListParagraphCxSpMiddle\" style=\"margin-left:54.0pt;mso-add-space:\r\nauto;text-indent:-18.0pt;mso-list:l0 level1 lfo1\"><!--[if !supportLists]--><span style=\"font-size:14.0pt;font-family:Symbol;mso-fareast-font-family:Symbol;\r\nmso-bidi-font-family:Symbol\">·<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-size-adjust: none; font-language-override: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-variant-position: normal; font-variant-emoji: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span style=\"font-size:14.0pt;font-family:&quot;Times New Roman&quot;,serif\">Đo các chỉ số cơ bản\r\n(huyết áp, nhịp tim, BMI…)<o:p></o:p></span></p><p class=\"MsoListParagraphCxSpMiddle\" style=\"margin-left:54.0pt;mso-add-space:\r\nauto;text-indent:-18.0pt;mso-list:l0 level1 lfo1\"><!--[if !supportLists]--><span style=\"font-size:14.0pt;font-family:Symbol;mso-fareast-font-family:Symbol;\r\nmso-bidi-font-family:Symbol\">·<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-size-adjust: none; font-language-override: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-variant-position: normal; font-variant-emoji: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span style=\"font-size:14.0pt;font-family:&quot;Times New Roman&quot;,serif\">Xét nghiệm máu, nước\r\ntiểu<o:p></o:p></span></p><p class=\"MsoListParagraphCxSpMiddle\" style=\"margin-left:54.0pt;mso-add-space:\r\nauto;text-indent:-18.0pt;mso-list:l0 level1 lfo1\"><!--[if !supportLists]--><span style=\"font-size:14.0pt;font-family:Symbol;mso-fareast-font-family:Symbol;\r\nmso-bidi-font-family:Symbol\">·<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-size-adjust: none; font-language-override: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-variant-position: normal; font-variant-emoji: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span style=\"font-size:14.0pt;font-family:&quot;Times New Roman&quot;,serif\">Siêu âm, chẩn đoán\r\nhình ảnh khi cần thiết<o:p></o:p></span></p><p class=\"MsoListParagraphCxSpLast\" style=\"margin-left:54.0pt;mso-add-space:auto;\r\ntext-indent:-18.0pt;mso-list:l0 level1 lfo1\"><!--[if !supportLists]--><span style=\"font-size:14.0pt;font-family:Symbol;mso-fareast-font-family:Symbol;\r\nmso-bidi-font-family:Symbol\">·<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-size-adjust: none; font-language-override: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-variant-position: normal; font-variant-emoji: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span style=\"font-size:14.0pt;font-family:&quot;Times New Roman&quot;,serif\">Tư vấn chế độ dinh\r\ndưỡng và phòng bệnh<o:p></o:p></span></p><p class=\"MsoNormal\"><b><span style=\"font-size:14.0pt;font-family:&quot;Times New Roman&quot;,serif\">Lợi\r\ních quan trọng của khám sức khỏe định kỳ<o:p></o:p></span></b></p><p class=\"MsoNormal\"><span style=\"font-size:14.0pt;font-family:&quot;Segoe UI Emoji&quot;,sans-serif;\r\nmso-bidi-font-family:&quot;Segoe UI Emoji&quot;\">????</span><span style=\"font-size:\r\n14.0pt;font-family:&quot;Times New Roman&quot;,serif\"> Phát hiện bệnh sớm – tăng cơ hội\r\nđiều trị hiệu quả<o:p></o:p></span></p><p class=\"MsoNormal\"><span style=\"font-size:14.0pt;font-family:&quot;Times New Roman&quot;,serif\">Nhiều\r\nbệnh lý nguy hiểm không có triệu chứng ở giai đoạn đầu. Khám định kỳ giúp phát\r\nhiện sớm để điều trị kịp thời, giảm biến chứng và chi phí điều trị.<o:p></o:p></span></p><p class=\"MsoNormal\"><span style=\"font-size:14.0pt;font-family:&quot;Segoe UI Emoji&quot;,sans-serif;\r\nmso-bidi-font-family:&quot;Segoe UI Emoji&quot;\">????</span><span style=\"font-size:\r\n14.0pt;font-family:&quot;Times New Roman&quot;,serif\"> Tiết kiệm chi phí y tế về lâu dài<o:p></o:p></span></p><p class=\"MsoNormal\"><span style=\"font-size:14.0pt;font-family:&quot;Times New Roman&quot;,serif\">Phòng\r\nbệnh và phát hiện sớm luôn tiết kiệm hơn rất nhiều so với điều trị khi bệnh đã\r\nnặng.<o:p></o:p></span></p><p class=\"MsoNormal\"><span style=\"font-size:14.0pt;font-family:&quot;Segoe UI Emoji&quot;,sans-serif;\r\nmso-bidi-font-family:&quot;Segoe UI Emoji&quot;\">❤️</span><span style=\"font-size:14.0pt;\r\nfont-family:&quot;Times New Roman&quot;,serif\"> Quản lý sức khỏe cá nhân khoa học<o:p></o:p></span></p><p class=\"MsoNormal\"><span style=\"font-size:14.0pt;font-family:&quot;Times New Roman&quot;,serif\">Thông\r\nqua hồ sơ theo dõi sức khỏe, bác sĩ có thể:<o:p></o:p></span></p><p class=\"MsoListParagraphCxSpFirst\" style=\"margin-left:54.0pt;mso-add-space:\r\nauto;text-indent:-18.0pt;mso-list:l1 level1 lfo2\"><!--[if !supportLists]--><span style=\"font-size:14.0pt;font-family:Symbol;mso-fareast-font-family:Symbol;\r\nmso-bidi-font-family:Symbol\">·<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-size-adjust: none; font-language-override: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-variant-position: normal; font-variant-emoji: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span style=\"font-size:14.0pt;font-family:&quot;Times New Roman&quot;,serif\">Nhận diện nguy cơ\r\nbệnh lý<o:p></o:p></span></p><p class=\"MsoListParagraphCxSpMiddle\" style=\"margin-left:54.0pt;mso-add-space:\r\nauto;text-indent:-18.0pt;mso-list:l1 level1 lfo2\"><!--[if !supportLists]--><span style=\"font-size:14.0pt;font-family:Symbol;mso-fareast-font-family:Symbol;\r\nmso-bidi-font-family:Symbol\">·<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-size-adjust: none; font-language-override: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-variant-position: normal; font-variant-emoji: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span style=\"font-size:14.0pt;font-family:&quot;Times New Roman&quot;,serif\">Điều chỉnh lối sống\r\nphù hợp<o:p></o:p></span></p><p class=\"MsoListParagraphCxSpLast\" style=\"margin-left:54.0pt;mso-add-space:auto;\r\ntext-indent:-18.0pt;mso-list:l1 level1 lfo2\"><!--[if !supportLists]--><span style=\"font-size:14.0pt;font-family:Symbol;mso-fareast-font-family:Symbol;\r\nmso-bidi-font-family:Symbol\">·<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-size-adjust: none; font-language-override: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-variant-position: normal; font-variant-emoji: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><!--[endif]--><span style=\"font-size:14.0pt;font-family:&quot;Times New Roman&quot;,serif\">Theo dõi các bệnh\r\nmạn tính hiệu quả<o:p></o:p></span></p><p class=\"MsoNormal\"><span style=\"font-size:14.0pt;font-family:&quot;Segoe UI Emoji&quot;,sans-serif;\r\nmso-bidi-font-family:&quot;Segoe UI Emoji&quot;\">????</span><span style=\"font-size:\r\n14.0pt;font-family:&quot;Times New Roman&quot;,serif\"> Giảm lo lắng, nâng cao chất lượng\r\ncuộc sống<o:p></o:p></span></p><p class=\"MsoNormal\"><span style=\"font-size:14.0pt;font-family:&quot;Times New Roman&quot;,serif\">Biết\r\nrõ tình trạng sức khỏe giúp người bệnh an tâm hơn, chủ động chăm sóc bản thân\r\nvà gia đình.<o:p></o:p></span></p><p class=\"MsoNormal\"><b><span style=\"font-size:14.0pt;font-family:&quot;Times New Roman&quot;,serif\">Ai\r\nnên khám sức khỏe định kỳ?<o:p></o:p></span></b></p><p class=\"MsoNormal\"><span style=\"font-size:14.0pt;font-family:&quot;Segoe UI Emoji&quot;,sans-serif;\r\nmso-bidi-font-family:&quot;Segoe UI Emoji&quot;\">✔️</span><span style=\"font-size:14.0pt;\r\nfont-family:&quot;Times New Roman&quot;,serif\"> Người trưởng thành từ 18 tuổi trở lên<o:p></o:p></span></p><p class=\"MsoNormal\"><span style=\"font-size:14.0pt;font-family:&quot;Segoe UI Emoji&quot;,sans-serif;\r\nmso-bidi-font-family:&quot;Segoe UI Emoji&quot;\">✔️</span><span style=\"font-size:14.0pt;\r\nfont-family:&quot;Times New Roman&quot;,serif\"> Người làm việc áp lực, ít vận động<o:p></o:p></span></p><p class=\"MsoNormal\"><span style=\"font-size:14.0pt;font-family:&quot;Segoe UI Emoji&quot;,sans-serif;\r\nmso-bidi-font-family:&quot;Segoe UI Emoji&quot;\">✔️</span><span style=\"font-size:14.0pt;\r\nfont-family:&quot;Times New Roman&quot;,serif\"> Người có bệnh nền hoặc tiền sử gia đình mắc\r\nbệnh mạn tính<o:p></o:p></span></p><p class=\"MsoNormal\"><span style=\"font-size:14.0pt;font-family:&quot;Segoe UI Emoji&quot;,sans-serif;\r\nmso-bidi-font-family:&quot;Segoe UI Emoji&quot;\">✔️</span><span style=\"font-size:14.0pt;\r\nfont-family:&quot;Times New Roman&quot;,serif\"> Người trên 40 tuổi nên kiểm tra sức khỏe\r\ntoàn diện mỗi năm<o:p></o:p></span></p><p class=\"MsoNormal\"><b><span style=\"font-size:14.0pt;font-family:&quot;Times New Roman&quot;,serif\">Khám\r\nsức khỏe định kỳ tại Phòng khám Đa khoa Trường Cao đẳng Kon Tum<o:p></o:p></span></b></p><p class=\"MsoNormal\"><span style=\"font-size:14.0pt;font-family:&quot;Times New Roman&quot;,serif\">Với\r\nđịnh hướng chăm sóc sức khỏe từ tuyến ban đầu, Phòng khám mang đến:<o:p></o:p></span></p><p class=\"MsoNormal\"><span style=\"font-size:14.0pt;font-family:&quot;Segoe UI Emoji&quot;,sans-serif;\r\nmso-bidi-font-family:&quot;Segoe UI Emoji&quot;\">✅</span><span style=\"font-size:14.0pt;\r\nfont-family:&quot;Times New Roman&quot;,serif\"> Quy trình khám nhanh chóng, thuận tiện<o:p></o:p></span></p><p class=\"MsoNormal\"><span style=\"font-size:14.0pt;font-family:&quot;Segoe UI Emoji&quot;,sans-serif;\r\nmso-bidi-font-family:&quot;Segoe UI Emoji&quot;\">✅</span><span style=\"font-size:14.0pt;\r\nfont-family:&quot;Times New Roman&quot;,serif\"> Đội ngũ bác sĩ tận tâm, tư vấn kỹ lưỡng<o:p></o:p></span></p><p class=\"MsoNormal\"><span style=\"font-size:14.0pt;font-family:&quot;Segoe UI Emoji&quot;,sans-serif;\r\nmso-bidi-font-family:&quot;Segoe UI Emoji&quot;\">✅</span><span style=\"font-size:14.0pt;\r\nfont-family:&quot;Times New Roman&quot;,serif\"> Trang thiết bị hỗ trợ chẩn đoán hiện đại<o:p></o:p></span></p><p class=\"MsoNormal\"><span style=\"font-size:14.0pt;font-family:&quot;Segoe UI Emoji&quot;,sans-serif;\r\nmso-bidi-font-family:&quot;Segoe UI Emoji&quot;\">✅</span><span style=\"font-size:14.0pt;\r\nfont-family:&quot;Times New Roman&quot;,serif\"> Hỗ trợ khám bảo hiểm y tế theo quy định<o:p></o:p></span></p><p class=\"MsoNormal\"><span style=\"font-size:14.0pt;font-family:&quot;Times New Roman&quot;,serif\">Chăm\r\nsóc sức khỏe không nên bắt đầu khi cơ thể lên tiếng cảnh báo, mà nên bắt đầu từ\r\nviệc chủ động kiểm tra định kỳ.<o:p></o:p></span></p><p>\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n</p><p class=\"MsoNormal\"><span style=\"font-size:14.0pt;font-family:&quot;Segoe UI Emoji&quot;,sans-serif;\r\nmso-bidi-font-family:&quot;Segoe UI Emoji&quot;\">????</span><span style=\"font-size:\r\n14.0pt;font-family:&quot;Times New Roman&quot;,serif\"> <b><i>Khám định kỳ không chỉ là kiểm\r\ntra bệnh — mà là đầu tư cho tương lai khỏe mạnh của chính bạn và những người\r\nthân yêu.</i></b></span></p><p class=\"MsoNormal\"><span style=\"font-size:\r\n14.0pt;font-family:&quot;Times New Roman&quot;,serif\"><b>Hãy gọi ngay đến Hotline 02606 558 568 để được tư vấn tận tình!</b></span></p><p class=\"MsoNormal\"><span style=\"font-size:\r\n14.0pt;font-family:&quot;Times New Roman&quot;,serif\"><b><i><o:p></o:p></i></b></span></p>', '3098c71a4ec69e495f96e522c250c198-ChatGPTImageFeb12202604_49_54PM.png', 1, 0, 24, 4, '2026-02-12 16:53:03'),
(11, 0, 'CHÚC MỪNG NGÀY THẦY THUỐC VIỆT NAM 27/02', 'Nhân ngày truyền thống của ngành Y, Phòng khám Đa khoa và Nhà thuốc Trường Cao đẳng Kon Tum xin gửi lời tri ân sâu sắc đến đội ngũ bác sĩ, dược sĩ và nhân viên y tế đã luôn tận tâm chăm sóc, bảo vệ sức khỏe cộng đồng.', '<p data-start=\"164\" data-end=\"404\">Nhân Ngày Thầy thuốc Việt Nam 27/02, Phòng khám Đa khoa và Nhà thuốc Trường Cao đẳng Kon Tum trân trọng gửi lời tri ân sâu sắc đến đội ngũ bác sĩ, dược sĩ và nhân viên y tế – những người đã và đang lặng thầm cống hiến vì sức khỏe cộng đồng.</p><p data-start=\"406\" data-end=\"641\">Nghề y không chỉ là một nghề nghiệp, mà còn là sứ mệnh cao quý. Mỗi sự tận tâm trong tư vấn, mỗi nỗ lực trong điều trị, mỗi lần lắng nghe và thấu hiểu người bệnh… đều góp phần thắp sáng niềm tin và lan tỏa giá trị nhân văn của ngành Y.</p><p data-start=\"643\" data-end=\"798\">Kính chúc quý Thầy thuốc luôn mạnh khỏe, giữ vững y đức, tiếp tục vững tâm với nghề và đồng hành bền bỉ trên hành trình chăm sóc, bảo vệ sức khỏe nhân dân.</p><p>\r\n\r\n\r\n</p><p data-start=\"800\" data-end=\"836\">Phòng khám Đa khoa và Nhà thuốc Trường Cao đẳng Kon Tum - Hết lòng vì sức khỏe nhân dân!!!</p><p data-start=\"800\" data-end=\"836\" style=\"text-align: center;\"><img src=\"https://phongkhamcdkontum.com.vn/uploads/images/09df68cdf9283a01573d71cf95192795-ChatGPTImageFeb27202609_05_13AM.png\" style=\"width: 1536px;\"><br></p>', '937820a6c8878f696cffa4be5e1e706b-ChatGPTImageFeb27202609_05_36AM.png', 1, 0, 24, 4, '2026-02-27 09:25:34'),
(12, 0, 'Một số hiểu lầm phổ biến về khám chữa bệnh Bảo hiểm y tế (BHYT)', 'một số hiểu lầm phổ biến về khám chữa bệnh bằng Bảo hiểm y tế (BHYT)', '<h2 data-section-id=\"g9oo6k\" data-start=\"248\" data-end=\"290\"><img src=\"https://phongkhamcdkontum.com.vn/uploads/images/58e5ed254820b4412e4bc3a1183b0140-HiulmKCBBHYT.jpg\" style=\"width: 1360.17px;\"><span style=\"font-family: \" times=\"\" new=\"\" roman\";\"=\"\">1. Nghĩ rằng khám BHYT phải chờ rất lâu</span></h2><p data-start=\"291\" data-end=\"372\"><span style=\"font-size: 18px;\" times=\"\" new=\"\" roman\";\"=\"\">Nhiều người cho rằng khám bằng BHYT sẽ phải xếp hàng lâu hơn so với khám dịch vụ.</span></p><p data-start=\"374\" data-end=\"569\"><strong data-start=\"374\" data-end=\"386\"><span style=\"font-size: 18px;\" times=\"\" new=\"\" roman\";\"=\"\">Thực tế:</span></strong><br data-start=\"386\" data-end=\"389\"><span style=\"font-family: \" times=\"\" new=\"\" roman\";\"=\"\">\r\nTại nhiều cơ sở y tế hiện nay, quy trình khám BHYT đã được </span><strong data-start=\"448\" data-end=\"470\">cải tiến và số hóa</strong><span style=\"font-family: \" times=\"\" new=\"\" roman\";\"=\"\">, thời gian khám không chênh lệch nhiều so với khám dịch vụ nếu người bệnh chuẩn bị đầy đủ giấy tờ.</span></p><hr data-start=\"571\" data-end=\"574\"><h2 data-section-id=\"evwcnv\" data-start=\"576\" data-end=\"620\"><span style=\"font-family: \" times=\"\" new=\"\" roman\";\"=\"\">2. Cho rằng khám BHYT thì thuốc không tốt</span></h2><p data-start=\"621\" data-end=\"698\"><span style=\"font-size: 18px;\" times=\"\" new=\"\" roman\";\"=\"\">Một số người nghĩ rằng thuốc được cấp theo BHYT là thuốc rẻ, chất lượng thấp.</span></p><p data-start=\"700\" data-end=\"868\"><strong data-start=\"700\" data-end=\"712\"><span style=\"font-size: 18px;\" times=\"\" new=\"\" roman\";\"=\"\">Thực tế:</span></strong><br data-start=\"712\" data-end=\"715\"><span style=\"font-family: \" times=\"\" new=\"\" roman\";\"=\"\">\r\nThuốc BHYT được cấp </span><strong data-start=\"735\" data-end=\"772\">theo danh mục do Bộ Y tế quy định</strong><span style=\"font-family: \" times=\"\" new=\"\" roman\";\"=\"\">, phải đảm bảo tiêu chuẩn chất lượng, nguồn gốc rõ ràng và được sử dụng rộng rãi trong điều trị.</span></p><hr data-start=\"870\" data-end=\"873\"><h2 data-section-id=\"zzs795\" data-start=\"875\" data-end=\"924\"><span style=\"font-family: \" times=\"\" new=\"\" roman\";\"=\"\">3. Nghĩ rằng khám BHYT là “miễn phí hoàn toàn”</span></h2><p data-start=\"925\" data-end=\"1002\"><span style=\"font-size: 18px;\" times=\"\" new=\"\" roman\";\"=\"\">Nhiều người hiểu nhầm rằng có BHYT thì </span><strong data-start=\"964\" data-end=\"1001\"><span style=\"font-size: 18px;\">không phải trả bất kỳ chi phí nào</span></strong><span style=\"font-size: 18px;\" times=\"\" new=\"\" roman\";\"=\"\">.</span></p><p data-start=\"1004\" data-end=\"1066\"><strong data-start=\"1004\" data-end=\"1016\"><span style=\"font-size: 18px;\" times=\"\" new=\"\" roman\";\"=\"\">Thực tế:</span></strong><br data-start=\"1016\" data-end=\"1019\"><span style=\"font-family: \" times=\"\" new=\"\" roman\";\"=\"\">\r\n<span style=\"font-size: 18px;\">BHYT </span></span><strong data-start=\"1024\" data-end=\"1054\"><span style=\"font-size: 18px;\">chỉ chi trả theo mức hưởng</span></strong><span style=\"font-size: 18px;\" times=\"\" new=\"\" roman\";\"=\"\">, thường là:</span></p><ul data-start=\"1067\" data-end=\"1170\"><span style=\"font-size: 18px;\" times=\"\" new=\"\" roman\";\"=\"\">\r\n</span><li data-section-id=\"e6khdn\" data-start=\"1067\" data-end=\"1097\"><span style=\"font-size: 18px;\">\r\n</span><p data-start=\"1069\" data-end=\"1097\">80% chi phí khám chữa bệnh</p><span style=\"font-size: 18px;\">\r\n</span></li><span style=\"font-size: 18px;\" times=\"\" new=\"\" roman\";\"=\"\">\r\n</span><li data-section-id=\"1kaykeh\" data-start=\"1098\" data-end=\"1130\"><span style=\"font-size: 18px;\">\r\n</span><p data-start=\"1100\" data-end=\"1130\">95% đối với một số đối tượng</p><span style=\"font-size: 18px;\">\r\n</span></li><span style=\"font-size: 18px;\" times=\"\" new=\"\" roman\";\"=\"\">\r\n</span><li data-section-id=\"16tfjgq\" data-start=\"1131\" data-end=\"1170\"><span style=\"font-size: 18px;\">\r\n</span><p data-start=\"1133\" data-end=\"1170\">100% đối với các đối tượng đặc biệt</p><span style=\"font-size: 18px;\">\r\n</span></li><span style=\"font-size: 18px;\" times=\"\" new=\"\" roman\";\"=\"\">\r\n</span></ul><p data-start=\"1172\" data-end=\"1287\"><span style=\"font-size: 18px;\" times=\"\" new=\"\" roman\";\"=\"\">Người bệnh có thể vẫn phải </span><strong data-start=\"1199\" data-end=\"1232\"><span style=\"font-size: 18px;\">đồng chi trả một phần chi phí</span></strong><span style=\"font-size: 18px;\" times=\"\" new=\"\" roman\";\"=\"\"> hoặc trả thêm nếu sử dụng dịch vụ ngoài danh mục BHYT.</span></p><hr data-start=\"1289\" data-end=\"1292\"><h2 data-section-id=\"1pwdorv\" data-start=\"1294\" data-end=\"1350\"><span style=\"font-family: \" times=\"\" new=\"\" roman\";\"=\"\">4. Nghĩ rằng khám trái tuyến sẽ không được thanh toán</span></h2><p data-start=\"1351\" data-end=\"1437\"><span style=\"font-size: 18px;\" times=\"\" new=\"\" roman\";\"=\"\">Nhiều người lo rằng đi khám không đúng nơi đăng ký ban đầu thì </span><strong data-start=\"1414\" data-end=\"1436\"><span style=\"font-size: 18px;\">BHYT không chi trả</span></strong><span style=\"font-size: 18px;\" times=\"\" new=\"\" roman\";\"=\"\">.</span></p><p data-start=\"1439\" data-end=\"1477\"><strong data-start=\"1439\" data-end=\"1451\"><span style=\"font-size: 18px;\" times=\"\" new=\"\" roman\";\"=\"\">Thực tế:</span></strong><br data-start=\"1451\" data-end=\"1454\"><span style=\"font-family: \" times=\"\" new=\"\" roman\";\"=\"\">\r\n<span style=\"font-size: 18px;\">Theo quy định hiện nay:</span></span></p><ul data-start=\"1478\" data-end=\"1625\"><span style=\"font-size: 18px;\" times=\"\" new=\"\" roman\";\"=\"\">\r\n</span><li data-section-id=\"v23ie2\" data-start=\"1478\" data-end=\"1529\"><span style=\"font-size: 18px;\">\r\n</span><p data-start=\"1480\" data-end=\"1529\">Khám <strong data-start=\"1485\" data-end=\"1499\">đúng tuyến</strong>: được hưởng đầy đủ quyền lợi.</p><span style=\"font-size: 18px;\">\r\n</span></li><span style=\"font-size: 18px;\" times=\"\" new=\"\" roman\";\"=\"\">\r\n</span><li data-section-id=\"9ht7qy\" data-start=\"1530\" data-end=\"1625\"><span style=\"font-size: 18px;\">\r\n</span><p data-start=\"1532\" data-end=\"1625\">Khám <strong data-start=\"1537\" data-end=\"1551\">trái tuyến</strong>: vẫn được BHYT thanh toán <strong data-start=\"1578\" data-end=\"1598\">một phần chi phí</strong>, tùy theo tuyến bệnh viện.</p><span style=\"font-size: 18px;\">\r\n</span></li><span style=\"font-size: 18px;\" times=\"\" new=\"\" roman\";\"=\"\">\r\n</span></ul><hr data-start=\"1627\" data-end=\"1630\"><h2 data-section-id=\"1beef3x\" data-start=\"1632\" data-end=\"1681\"><span style=\"font-size: 18px;\" times=\"\" new=\"\" roman\";\"=\"\">5. Nghĩ rằng phải nằm viện mới được hưởng BHYT</span></h2><p data-start=\"1682\" data-end=\"1738\"><span style=\"font-size: 18px;\" times=\"\" new=\"\" roman\";\"=\"\">Một số người nghĩ BHYT chỉ áp dụng khi điều trị nội trú.</span></p><p data-start=\"1740\" data-end=\"1872\"><strong data-start=\"1740\" data-end=\"1752\"><span style=\"font-size: 18px;\" times=\"\" new=\"\" roman\";\"=\"\">Thực tế:</span></strong><br data-start=\"1752\" data-end=\"1755\"><span style=\"font-family: \" times=\"\" new=\"\" roman\";\"=\"\">\r\n<span style=\"font-size: 18px;\">BHYT chi trả cho </span></span><strong data-start=\"1772\" data-end=\"1813\"><span style=\"font-size: 18px;\">cả khám ngoại trú và điều trị nội trú</span></strong><span style=\"font-size: 18px;\" times=\"\" new=\"\" roman\";\"=\"\">, miễn là dịch vụ nằm trong danh mục được bảo hiểm chi trả.</span></p><hr data-start=\"1874\" data-end=\"1877\"><h2 data-section-id=\"gtv3wq\" data-start=\"1879\" data-end=\"1925\"><span style=\"font-family: \" times=\"\" new=\"\" roman\";\"=\"\">6. Nghĩ rằng thủ tục khám BHYT rất phức tạp</span></h2><p data-start=\"1926\" data-end=\"1975\"><span style=\"font-size: 18px;\" times=\"\" new=\"\" roman\";\"=\"\">Nhiều người ngại khám BHYT vì sợ thủ tục rườm rà.</span></p><p data-start=\"1977\" data-end=\"2042\"><strong data-start=\"1977\" data-end=\"1989\"><span style=\"font-size: 18px;\" times=\"\" new=\"\" roman\";\"=\"\">Thực tế:</span></strong><br data-start=\"1989\" data-end=\"1992\"><span style=\"font-family: \" times=\"\" new=\"\" roman\";\"=\"\">\r\n<span style=\"font-size: 18px;\">Hiện nay thủ tục rất đơn giản, người bệnh chỉ cần:</span></span></p><ul data-start=\"2043\" data-end=\"2136\"><span style=\"font-size: 18px;\" times=\"\" new=\"\" roman\";\"=\"\">\r\n</span><li data-section-id=\"1h27vcr\" data-start=\"2043\" data-end=\"2082\"><span style=\"font-size: 18px;\">\r\n</span><p data-start=\"2045\" data-end=\"2082\"><strong data-start=\"2045\" data-end=\"2080\"><span style=\"font-size: 18px;\">Thẻ BHYT (hoặc mã BHYT điện tử)</span></strong></p><span style=\"font-size: 18px;\">\r\n</span></li><span style=\"font-size: 18px;\" times=\"\" new=\"\" roman\";\"=\"\">\r\n</span><li data-section-id=\"1b8jgwi\" data-start=\"2083\" data-end=\"2136\"><span style=\"font-size: 18px;\">\r\n</span><p data-start=\"2085\" data-end=\"2136\"><strong data-start=\"2085\" data-end=\"2112\"><span style=\"font-size: 18px;\">Giấy tờ tùy thân có ảnh</span></strong><span style=\"font-size: 18px;\"> (CCCD hoặc tương đương)</span></p><span style=\"font-size: 18px;\">\r\n</span></li><span style=\"font-size: 18px;\" times=\"\" new=\"\" roman\";\"=\"\">\r\n</span></ul><hr data-start=\"2138\" data-end=\"2141\"><h2 data-section-id=\"o65ykr\" data-start=\"2143\" data-end=\"2195\"><span style=\"font-size: 18px;\" times=\"\" new=\"\" roman\";\"=\"\">7. Nghĩ rằng khám BHYT thì không được chọn bác sĩ</span></h2><p data-start=\"2196\" data-end=\"2255\"><span style=\"font-size: 18px;\" times=\"\" new=\"\" roman\";\"=\"\">Một số người cho rằng khám BHYT không được lựa chọn bác sĩ.</span></p><p><span style=\"font-size: 18px;\" times=\"\" new=\"\" roman\";\"=\"\">\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n</span></p><p data-start=\"2257\" data-end=\"2404\"><strong data-start=\"2257\" data-end=\"2269\"><span style=\"font-size: 18px;\" times=\"\" new=\"\" roman\";\"=\"\">Thực tế:</span></strong><br data-start=\"2269\" data-end=\"2272\"><span style=\"font-family: \" times=\"\" new=\"\" roman\";\"=\"\">\r\n<span style=\"font-size: 18px;\">Tùy quy định của từng cơ sở y tế, người bệnh </span></span><strong data-start=\"2317\" data-end=\"2356\"><span style=\"font-size: 18px;\">vẫn được khám bởi bác sĩ chuyên môn</span></strong><span style=\"font-size: 18px;\" times=\"\" new=\"\" roman\";\"=\"\">, đảm bảo quy trình chuyên môn như khám dịch vụ.</span></p>', '152ebc14155da633e7e3949e6e92d983-HiulmKCBBHYT.jpg', 1, 0, 24, 4, '2026-03-09 19:22:44'),
(13, 0, 'CẢM CÚM, HO, NGHẸT MŨI MÙA CHUYỂN MÙA: NHẬN BIẾT SỚM VÀ XỬ LÝ ĐÚNG CÁCH', 'Thời điểm giao mùa, thời tiết thay đổi thất thường là lúc các bệnh cảm cúm, ho, nghẹt mũi, đau đầu, sổ mũi xuất hiện nhiều hơn. Đây là những bệnh lý thường gặp ở cả người lớn và trẻ em, gây khó chịu, ảnh hưởng đến sinh hoạt và công việc hàng ngày.', '<p><img class=\"image_resized\" style=\"width:50%;\" src=\"https://phongkhamcdkontum.com.vn/uploads/images/58f2b8cf8f47b02967950db166f711b6-camcum1.jpg\"><img class=\"image_resized\" style=\"width:50%;\" src=\"https://phongkhamcdkontum.com.vn/uploads/images/e6294e656e75572f011a58880617022f-camcum2.jpg\"></p><p><span style=\"font-size:18px;\">Thời điểm giao mùa, thời tiết thay đổi thất thường là lúc các bệnh</span> <span style=\"font-size:18px;\"><strong>cảm cúm, ho, nghẹt mũi, đau đầu, sổ mũi</strong> xuất hiện nhiều hơn. Đây là những bệnh lý thường gặp ở cả người lớn và trẻ em, gây khó chịu, ảnh hưởng đến sinh hoạt và công việc hàng ngày.</span></p><p><span style=\"font-size:18px;\">Việc nhận biết sớm các triệu chứng và xử lý đúng cách</span> <span style=\"font-size:18px;\">sẽ giúp người bệnh nhanh chóng hồi phục và hạn chế biến chứng.</span></p><h2><span style=\"font-size:24px;\">1. Dấu hiệu thường gặp của cảm cúm</span></h2><p><span style=\"font-size:18px;\">Khi bị cảm cúm hoặc cảm lạnh thông thường, người bệnh có thể gặp một số triệu chứng như:</span></p><p><span style=\"font-size:18px;\">Hắt hơi, sổ mũi, nghẹt mũi</span></p><p><span style=\"font-size:18px;\">Ho khan hoặc ho có đờm</span></p><p><span style=\"font-size:18px;\">Đau đầu, đau họng</span></p><p><span style=\"font-size:18px;\">Cơ thể mệt mỏi, uể oải</span></p><p><span style=\"font-size:18px;\">Có thể sốt nhẹ</span></p><p><span style=\"font-size:18px;\">Thông thường, các triệu chứng này</span> <span style=\"font-size:18px;\"><strong>xuất hiện sau khi cơ thể bị nhiễm virus đường hô hấp</strong>, đặc biệt khi sức đề kháng suy giảm do thời tiết lạnh, mưa nhiều hoặc thay đổi nhiệt độ đột ngột.</span></p><hr><h2>2. Vì sao mùa chuyển mùa dễ bị cảm cúm?</h2><p><span style=\"font-size:18px;\">Có nhiều nguyên nhân khiến cảm cúm gia tăng trong thời điểm này:</span></p><p><span style=\"font-size:18px;\"><strong>Thời tiết thay đổi thất thường</strong> làm cơ thể chưa kịp thích nghi</span></p><p><span style=\"font-size:18px;\"><strong>Sức đề kháng suy giảm</strong> do thiếu ngủ, căng thẳng, dinh dưỡng kém</span></p><p><span style=\"font-size:18px;\"><strong>Môi trường đông người</strong> khiến virus dễ lây lan qua đường hô hấp</span></p><p><span style=\"font-size:18px;\"><strong>Thói quen sinh hoạt chưa hợp lý</strong>, ít vận động, uống ít nước</span></p><p><span style=\"font-size:18px;\">Do đó, việc <strong>chủ động bảo vệ sức khỏe trong giai đoạn giao mùa</strong> là rất quan trọng.</span></p><hr><h2>3. Cách xử lý khi có triệu chứng cảm cúm</h2><p><span style=\"font-size:18px;\">Khi xuất hiện các dấu hiệu cảm cúm nhẹ, người bệnh nên:</span></p><p><span style=\"font-size:18px;\"><strong>Nghỉ ngơi hợp lý</strong></span><br><span style=\"font-size:18px;\">Cơ thể cần thời gian để phục hồi và chống lại virus.</span></p><p><span style=\"font-size:18px;\"><strong>Uống nhiều nước</strong></span><br><span style=\"font-size:18px;\">Nước ấm giúp làm dịu cổ họng, giảm nghẹt mũi và hỗ trợ quá trình hồi phục.</span></p><p><span style=\"font-size:18px;\"><strong>Giữ ấm cơ thể</strong></span><br><span style=\"font-size:18px;\">Đặc biệt là vùng cổ, ngực và bàn chân.</span></p><p><span style=\"font-size:18px;\"><strong>Sử dụng thuốc đúng hướng dẫn</strong></span><br><span style=\"font-size:18px;\">Một số thuốc có thể giúp giảm triệu chứng như:</span></p><p><span style=\"font-size:18px;\">Thuốc hạ sốt, giảm đau đầu</span></p><p><span style=\"font-size:18px;\">Thuốc giảm nghẹt mũi, sổ mũi</span></p><p><span style=\"font-size:18px;\">Thuốc giảm ho, dịu họng</span></p><p><span style=\"font-size:18px;\">Vitamin giúp tăng sức đề kháng</span></p><p><span style=\"font-size:18px;\">Việc sử dụng thuốc nên <strong>được tư vấn bởi dược sĩ hoặc nhân viên y tế</strong> để đảm bảo an toàn và hiệu quả.</span></p><hr><h2><span style=\"font-size:18px;\">4. Khi nào cần đi khám?</span></h2><p><span style=\"font-size:18px;\">Người bệnh nên đến cơ sở y tế khi có các dấu hiệu sau:</span></p><p><span style=\"font-size:18px;\">Sốt cao kéo dài</span></p><p><span style=\"font-size:18px;\">Ho nhiều, khó thở</span></p><p><span style=\"font-size:18px;\">Đau đầu dữ dội</span></p><p><span style=\"font-size:18px;\">Triệu chứng không cải thiện sau vài ngày</span></p><p><span style=\"font-size:18px;\">Việc thăm khám sớm giúp bác sĩ đánh giá chính xác tình trạng bệnh và có hướng điều trị phù hợp.</span></p><hr><h2><span style=\"font-size:18px;\">5. Chủ động phòng ngừa cảm cúm</span></h2><p><span style=\"font-size:18px;\">Để hạn chế nguy cơ mắc bệnh trong mùa chuyển mùa, mỗi người nên:</span></p><p><span style=\"font-size:18px;\">Tăng cường dinh dưỡng và bổ sung vitamin</span></p><p><span style=\"font-size:18px;\">Tập thể dục thường xuyên</span></p><p><span style=\"font-size:18px;\">Rửa tay và giữ vệ sinh cá nhân</span></p><p><span style=\"font-size:18px;\">Đeo khẩu trang khi đến nơi đông người</span></p><p><span style=\"font-size:18px;\">Giữ ấm cơ thể khi thời tiết lạnh</span></p><hr><p><span style=\"font-size:18px;\"><strong>Nhà thuốc Trường Cao đẳng Kon Tum</strong> luôn sẵn sàng tư vấn các giải pháp chăm sóc sức khỏe và hỗ trợ người dân lựa chọn thuốc phù hợp khi có triệu chứng cảm cúm.</span></p><p><span style=\"font-size:18px;\">Địa chỉ:347 Bà Triệu, phường Kon Tum, tỉnh Quảng Ngãi.</span><br><span style=\"font-size:18px;\">Liên hệ: 0839 995 775</span></p><p><span style=\"font-size:18px;\">Nếu có các dấu hiệu cảm cúm, ho, nghẹt mũi hoặc cần tư vấn thuốc, hãy liên hệ với dược sĩ để được hỗ trợ kịp thời.</span></p>', 'dccc7912387667588f9c24f2a5a4256c-camcum1.jpg', 1, 0, 24, 4, '2026-03-16 20:37:04'),
(14, 0, 'CHÚC MỪNG NGÀY QUỐC TẾ HẠNH PHÚC 20/3', 'Hạnh phúc lớn nhất là sự bình an trong tâm hồn và một cơ thể khỏe mạnh.', '<p style=\"text-align:center;\"><img class=\"image_resized\" style=\"width:1079.78px;\" src=\"https://phongkhamcdkontum.com.vn/uploads/images/d0edcce1b6fdc5cf2f83c8a3b976b76b-Gemini_Generated_Image_7nrimo7nrimo7nri.png\"><br>&nbsp;</p><p style=\"text-align:center;\"><strong>\"Hạnh phúc lớn nhất là sự bình an trong tâm hồn và một cơ thể khỏe mạnh.\"</strong></p><p>✨ Nhân ngày Quốc tế Hạnh phúc 20/3, <strong>Phòng khám Đa khoa &amp; Nhà thuốc Trường Cao đẳng Kon Tum</strong> xin gửi đến quý khách hàng, đội ngũ y bác sĩ, các em sinh viên và toàn thể cộng đồng những lời chúc tốt đẹp nhất!</p><p>Hạnh phúc không đâu xa xôi, nó nằm ở nụ cười của người thân, ở sự an tâm khi sức khỏe được chăm sóc tận tình. Tại đây, chúng tôi luôn nỗ lực mỗi ngày để mang lại sự an tâm đó cho bạn thông qua:</p><p>❤️ Dịch vụ thăm khám tận tâm, chuyên nghiệp.</p><p>❤️ Nguồn thuốc chất lượng, tư vấn kỹ lưỡng.</p><p>❤️ Sự thấu hiểu và sẻ chia như người thân trong gia đình.</p><p>Hãy cùng chúng tôi lan tỏa thông điệp yêu thương bằng cách dành thời gian chăm sóc sức khỏe cho bản thân và những người thân yêu trong ngày hôm nay nhé!</p><hr><p><strong>PHÒNG KHÁM ĐA KHOA &amp; NHÀ THUỐC TRƯỜNG CAO ĐẲNG KON TUM</strong></p><p><strong>Địa chỉ:</strong> 347 Bà Triệu, phường Kon Tum, tỉnh Quảng Ngãi</p><p><strong>Hotline:</strong> 0839 995 775</p><p><strong>Website:</strong> <!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><a target=\"_blank\" rel=\"noopener noreferrer\" href=\"https://www.google.com/search?q=http://phongkhamdakhoacdkontum.com.vn\">phongkhamdakhoacdkontum.com.vn</a><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----><!----></p><p>#NgayQuocTeHanhPhuc #InternationalDayOfHappiness #20Thang3 #PhongKhamDaKhoa #NhaThuoc #CaoDangKonTum #SucKhoeLaHanhPhuc</p>', '49a49dff8a2fd2c1653e32d7586e3eac-Gemini_Generated_Image_uliwrluliwrluliw.png', 2, 0, 24, 4, '2026-03-20 08:33:49'),
(15, 0, '⚠️CẢNH BÁO DỊCH VIÊM NÃO MÔ CẦU – CHỦ ĐỘNG PHÒNG NGỪA ĐỂ BẢO VỆ SỨC KHỎE', 'Viêm não mô cầu là bệnh truyền nhiễm cấp tính nguy hiểm, có thể tiến triển nhanh và gây biến chứng nặng nếu không được phát hiện, điều trị kịp thời. Trong bối cảnh thời tiết giao mùa, nguy cơ lây lan bệnh có xu hướng gia tăng, người dân cần nâng cao ý thức phòng ngừa.', '<ul data-start=\"725\" data-end=\"808\"><li data-section-id=\"1nqajmw\" data-start=\"765\" data-end=\"808\"><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><i>Viêm não mô cầu là bệnh truyền nhiễm cấp tính nguy hiểm, có\r\nthể tiến triển nhanh và gây biến chứng nặng nếu không được phát hiện, điều trị\r\nkịp thời. Trong bối cảnh thời tiết giao mùa, nguy cơ lây lan bệnh có xu hướng\r\ngia tăng, người dân cần nâng cao ý thức phòng ngừa.</i></span><o:p></o:p></p><div class=\"MsoNormal\" align=\"center\" style=\"text-align:center\">\r\n\r\n<hr size=\"1\" width=\"100%\" align=\"center\">\r\n\r\n</div><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><b>Viêm não mô cầu là gì?</b></span><o:p></o:p></p><p class=\"MsoNormal\">Viêm não mô cầu là bệnh do vi khuẩn&nbsp;<i>Neisseria\r\nmeningitidis</i>&nbsp;gây ra, lây truyền qua đường hô hấp, tiếp xúc gần với người\r\nbệnh hoặc người lành mang vi khuẩn.<o:p></o:p></p><p class=\"MsoNormal\">Bệnh có thể gây:<o:p></o:p></p><p class=\"MsoNormal\">- Viêm màng não<o:p></o:p></p><p class=\"MsoNormal\">- Nhiễm khuẩn huyết<o:p></o:p></p><p class=\"MsoNormal\">- Sốc nhiễm trùng nguy hiểm đến tính mạng<o:p></o:p></p><div class=\"MsoNormal\" align=\"center\" style=\"text-align:center\"><div style=\"text-align: center;\"><img src=\"https://phongkhamcdkontum.com.vn/uploads/images/9a8746131de835ce0b16180875a024d4-vikhun3.jpg\" style=\"width: 25%;\">&nbsp;&nbsp;<img src=\"https://phongkhamcdkontum.com.vn/uploads/images/5d4aac80c823dc1d5d9288a2acfef670-vikhun2.jpg\" style=\"width: 25%;\"></div>\r\n\r\n<hr size=\"1\" width=\"100%\" align=\"center\">\r\n\r\n</div><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><b>Dấu hiệu nhận biết\r\nsớm</b></span><o:p></o:p></p><p class=\"MsoNormal\">Người bệnh có thể xuất hiện các triệu chứng:<o:p></o:p></p><p class=\"MsoNormal\">- Sốt cao đột ngột<o:p></o:p></p><p class=\"MsoNormal\">- Đau đầu dữ dội<o:p></o:p></p><p class=\"MsoNormal\">- Buồn nôn, nôn<o:p></o:p></p><p class=\"MsoNormal\">- Cứng cổ, khó cúi đầu<o:p></o:p></p><p class=\"MsoNormal\">- Xuất hiện ban xuất huyết trên da<o:p></o:p></p><p class=\"MsoNormal\">- Trẻ nhỏ có thể quấy khóc, bỏ bú, ngủ li bì<o:p></o:p></p><p class=\"MsoNormal\">Khi có các dấu hiệu\r\ntrên, cần đến cơ sở y tế ngay để được thăm khám và xử trí kịp thời.<o:p></o:p></p><div class=\"MsoNormal\" align=\"center\" style=\"text-align:center\">\r\n\r\n<img src=\"https://phongkhamcdkontum.com.vn/uploads/images/2220e830c8741b1493b5c485186ae9b3-bieuhien2.jpg\" style=\"width: 50%;\"><hr size=\"1\" width=\"100%\" align=\"center\">\r\n\r\n</div><p class=\"MsoNormal\"><b><span style=\"font-family: \" segoe=\"\" ui=\"\" emoji\",=\"\" sans-serif;=\"\" font-size:=\"\" 18px;\"=\"\">⚠️</span><span style=\"font-size: 18px;\"> Đối tượng nguy cơ cao</span></b><o:p></o:p></p><p class=\"MsoNormal\">-&nbsp;Trẻ em, học sinh, sinh viên sống tập thể<o:p></o:p></p><p class=\"MsoNormal\">-&nbsp;Người có hệ miễn dịch yếu<o:p></o:p></p><p class=\"MsoNormal\">-&nbsp;Người sống trong môi trường đông người, kín<o:p></o:p></p><p class=\"MsoNormal\">-&nbsp;Người chưa được tiêm vắc xin phòng bệnh<o:p></o:p></p><div class=\"MsoNormal\" align=\"center\" style=\"text-align:center\">\r\n\r\n<hr size=\"1\" width=\"100%\" align=\"center\">\r\n\r\n</div><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><b>Cách phòng ngừa hiệu quả</b></span><o:p></o:p></p><p class=\"MsoNormal\">- Tiêm vắc xin phòng viêm não mô cầu theo khuyến cáo<o:p></o:p></p><p class=\"MsoNormal\">- Đeo khẩu trang khi đến nơi đông người<o:p></o:p></p><p class=\"MsoNormal\">- Rửa tay thường xuyên bằng xà phòng hoặc dung dịch sát khuẩn<o:p></o:p></p><p class=\"MsoNormal\">- Giữ vệ sinh cá nhân, môi trường sống<o:p></o:p></p><p class=\"MsoNormal\">- Hạn chế tiếp xúc gần với người có dấu hiệu nghi nhiễm bệnh<o:p></o:p></p><div class=\"MsoNormal\" align=\"center\" style=\"text-align:center\">\r\n\r\n<img src=\"https://phongkhamcdkontum.com.vn/uploads/images/195016a4612f890ed6e73ac9b28cef8c-ratay1.jpg\" style=\"width: 25%;\">&nbsp;<img src=\"https://phongkhamcdkontum.com.vn/uploads/images/6e3cf1a3790fa234cc19a9834134c4dd-tiemvacxin1.jpg\" style=\"width: 25%;\"><hr size=\"1\" width=\"100%\" align=\"center\">\r\n\r\n</div><p class=\"MsoNormal\"><span style=\"font-size: 18px;\"><b>Thăm khám và tư vấn tại\r\nPhòng khám Đa khoa và Nhà thuốc Trường Cao đẳng Kon Tum:</b></span><o:p></o:p></p><p class=\"MsoNormal\">- Khám, tư vấn các bệnh truyền nhiễm<o:p></o:p></p><p class=\"MsoNormal\">- Hướng dẫn phòng ngừa và theo dõi sức khỏe<o:p></o:p></p><p class=\"MsoNormal\">- Hỗ trợ xét nghiệm, chẩn đoán khi cần thiết<o:p></o:p></p><p class=\"MsoNormal\">- Cung cấp thuốc điều trị theo đúng chỉ định<o:p></o:p></p><div class=\"MsoNormal\" align=\"center\" style=\"text-align:center\">\r\n\r\n<hr size=\"1\" width=\"100%\" align=\"center\">\r\n\r\n</div><p class=\"MsoNormal\"><b>Liên hệ ngay khi cần hỗ\r\ntrợ</b><o:p></o:p></p><p class=\"MsoNormal\"><b>Phòng khám Đa khoa và\r\nNhà thuốc Trường Cao đẳng Kon Tum</b><o:p></o:p></p><p class=\"MsoNormal\">Hotline:&nbsp;<b>0839\r\n995 775</b><o:p></o:p></p><p class=\"MsoNormal\"><b>Chủ động phòng\r\nbệnh – Bảo vệ sức khỏe bản thân và cộng đồng</b><o:p></o:p></p><p data-start=\"245\" data-end=\"513\">\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n</p><p class=\"MsoNormal\"><o:p>Nguồn tham khảo:&nbsp;</o:p><a href=\"https://vncdc.gov.vn\" target=\"_blank\">https://vncdc.gov.vn</a>;<a data-start=\"408\" data-end=\"428\" rel=\"noopener\" target=\"_new\" class=\"decorated-link\" href=\"https://vncdc.gov.vn\" style=\"background-color: rgb(255, 255, 255);\"></a>&nbsp;<a href=\"https://moh.gov.vn\" target=\"_blank\">https://moh.gov.vn</a>;&nbsp;Meningococcal meningitis</p></li></ul>', 'd0b742bc3f896f8b5854537551ffdd64-vikhun2.jpg', 1, 0, 24, 4, '2026-03-20 09:23:21');
INSERT INTO `hicrm_events` (`id`, `user_id`, `event_name`, `event_description`, `event_content`, `event_image`, `event_type`, `event_hot`, `event_user_created`, `event_status`, `event_created_date`) VALUES
(16, 0, 'NGÀY LÀM VIỆC ĐẦU TIÊN KHÁM CHỮA BỆNH BẢO HIỂM Y TẾ TẠI PHÒNG KHÁM ĐA KHOA TRƯỜNG CAO ĐẲNG KON TUM', 'Ngày 16/3/2026, Phòng khám Đa khoa Trường Cao đẳng Kon Tum chính thức triển khai dịch vụ khám chữa bệnh bảo hiểm y tế (BHYT), đánh dấu một bước phát triển quan trọng trong việc mở rộng hoạt động chăm sóc sức khỏe cho người dân trên địa bàn.', '<div dir=\"auto\" style=\"font-family: \" segoe=\"\" ui=\"\" historic\",=\"\" \"segoe=\"\" ui\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(8,=\"\" 8,=\"\" 9);=\"\" font-size:=\"\" 15px;=\"\" white-space-collapse:=\"\" preserve;\"=\"\"><span class=\"html-span xexx8yu xyri2b x18d9i69 x1c1uobl x1hl2dhg x16tdsg8 x1vvkbs x3nfvp2 x1j61x8r x1fcty0u xdj266r xat24cr xm2jcoa x1mpyi22 xxymvpz xlup9mm x1kky2od\" style=\"text-align: inherit; padding-inline: 0px; margin-inline: 1px; overflow-wrap: break-word; display: inline-flex; vertical-align: middle; padding-bottom: 0px; width: 16px; margin-bottom: 0px; margin-top: 0px; padding-top: 0px; height: 16px; font-family: inherit;\"><p class=\"MsoNormal\" style=\"text-align: justify; \"><br></p></span></div><table class=\"table table-bordered\" style=\"text-align: justify;\"><tbody><tr><td><p class=\"MsoNormal\"><b><span style=\"font-size:14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">Dấu mốc quan trọng\r\ntrong hành trình phục vụ cộng đồng<o:p></o:p></span></b></p>\r\n\r\n<p class=\"MsoNormal\"><span style=\"font-size:14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">Ngày\r\n16/3/2026, Phòng khám Đa khoa Trường Cao đẳng Kon Tum chính thức triển khai <b>dịch\r\nvụ khám chữa bệnh bảo hiểm y tế (BHYT)</b>, đánh dấu một bước phát triển quan\r\ntrọng trong việc mở rộng hoạt động chăm sóc sức khỏe cho người dân trên địa\r\nbàn.<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\"><span style=\"font-size:14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">Đây\r\nkhông chỉ là sự kiện mang ý nghĩa chuyên môn, mà còn thể hiện <b>cam kết của\r\nNhà trường và Phòng khám trong việc nâng cao chất lượng dịch vụ y tế, hướng tới\r\nphục vụ cộng đồng một cách toàn diện và bền vững</b>.</span></p><p class=\"MsoNormal\"><img src=\"https://phongkhamcdkontum.com.vn/uploads/images/9f873a73f648fe49e2dc172ec751c2da-745954385089608562-Copy.jpg\" style=\"width: 939.5px;\"><span style=\"font-size:14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"><o:p></o:p></span></p>\r\n\r\n<div class=\"MsoNormal\" align=\"center\" style=\"text-align:center\"><span style=\"font-size:14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">\r\n\r\n<hr size=\"2\" width=\"100%\" align=\"center\">\r\n\r\n</span></div>\r\n\r\n<p class=\"MsoNormal\"><b><span style=\"font-size:14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">Không khí ngày đầu:\r\nKhẩn trương – chuyên nghiệp – tận tâm<o:p></o:p></span></b></p>\r\n\r\n<p class=\"MsoNormal\"><span style=\"font-size:14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">Ngay\r\ntừ sáng sớm, Phòng khám đã đón tiếp những bệnh nhân đầu tiên đến khám bằng thẻ\r\nBHYT.<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\"><span style=\"font-size:14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">Đội\r\nngũ y bác sĩ, điều dưỡng và nhân viên y tế:<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\"><span style=\"font-size:14.0pt;font-family:\" segoe=\"\" ui=\"\" emoji\",sans-serif;=\"\" mso-bidi-font-family:\"segoe=\"\" emoji\"\"=\"\">✔️</span><span style=\"font-size:14.0pt;\r\nfont-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"> Chủ động hướng dẫn thủ tục<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\"><span style=\"font-size:14.0pt;font-family:\" segoe=\"\" ui=\"\" emoji\",sans-serif;=\"\" mso-bidi-font-family:\"segoe=\"\" emoji\"\"=\"\">✔️</span><span style=\"font-size:14.0pt;\r\nfont-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"> Hỗ trợ người bệnh tiếp cận quy trình khám\r\nchữa bệnh<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\"><span style=\"font-size:14.0pt;font-family:\" segoe=\"\" ui=\"\" emoji\",sans-serif;=\"\" mso-bidi-font-family:\"segoe=\"\" emoji\"\"=\"\">✔️</span><span style=\"font-size:14.0pt;\r\nfont-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"> Đảm bảo các khâu tiếp đón – khám – chỉ định\r\ncận lâm sàng được thực hiện thông suốt<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\"><span style=\"font-size:\r\n14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">Dù là ngày đầu triển khai, mọi hoạt\r\nđộng diễn ra <b>ổn định, trật tự và chuyên nghiệp</b>, tạo sự yên tâm cho người\r\nbệnh.</span></p><p class=\"MsoNormal\"><img src=\"https://phongkhamcdkontum.com.vn/uploads/images/32faa31a74d42eeb6129e93c106e2014-3289119611843084288.jpg\" style=\"width: 939.5px;\"><span style=\"font-size:\r\n14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"><br></span></p><p class=\"MsoNormal\"><span style=\"font-size:\r\n14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"><o:p></o:p></span></p>\r\n\r\n<div class=\"MsoNormal\" align=\"center\" style=\"text-align:center\"><span style=\"font-size:14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">\r\n\r\n</span></div><p class=\"MsoNormal\"><b><span style=\"font-size:14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">Quy trình rõ ràng\r\n– tạo thuận lợi cho người dân<o:p></o:p></span></b></p>\r\n\r\n<p class=\"MsoNormal\"><span style=\"font-size:14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">Người\r\nbệnh đến khám BHYT được hướng dẫn theo quy trình:<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\" style=\"margin-left:36.0pt;text-indent:-18.0pt;mso-list:l1 level1 lfo1;\r\ntab-stops:list 36.0pt\"><!--[if !supportLists]--><span style=\"font-size:14.0pt;\r\nfont-family:\" times=\"\" new=\"\" roman\",serif;mso-fareast-font-family:\"times=\"\" roman\"\"=\"\">1.<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-size-adjust: none; font-language-override: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-variant-position: normal; font-variant-emoji: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \" times=\"\" new=\"\" roman\";\"=\"\">&nbsp;&nbsp;&nbsp;\r\n</span></span><!--[endif]--><span style=\"font-size:14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">Tiếp\r\nnhận – kiểm tra thẻ BHYT và giấy tờ liên quan <o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\" style=\"margin-left:36.0pt;text-indent:-18.0pt;mso-list:l1 level1 lfo1;\r\ntab-stops:list 36.0pt\"><!--[if !supportLists]--><span style=\"font-size:14.0pt;\r\nfont-family:\" times=\"\" new=\"\" roman\",serif;mso-fareast-font-family:\"times=\"\" roman\"\"=\"\">2.<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-size-adjust: none; font-language-override: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-variant-position: normal; font-variant-emoji: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \" times=\"\" new=\"\" roman\";\"=\"\">&nbsp;&nbsp;&nbsp;\r\n</span></span><!--[endif]--><span style=\"font-size:14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">Khám\r\nlâm sàng với bác sĩ <o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\" style=\"margin-left:36.0pt;text-indent:-18.0pt;mso-list:l1 level1 lfo1;\r\ntab-stops:list 36.0pt\"><!--[if !supportLists]--><span style=\"font-size:14.0pt;\r\nfont-family:\" times=\"\" new=\"\" roman\",serif;mso-fareast-font-family:\"times=\"\" roman\"\"=\"\">3.<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-size-adjust: none; font-language-override: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-variant-position: normal; font-variant-emoji: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \" times=\"\" new=\"\" roman\";\"=\"\">&nbsp;&nbsp;&nbsp;\r\n</span></span><!--[endif]--><span style=\"font-size:14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">Thực\r\nhiện các chỉ định (nếu có) <o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\" style=\"margin-left:36.0pt;text-indent:-18.0pt;mso-list:l1 level1 lfo1;\r\ntab-stops:list 36.0pt\"><!--[if !supportLists]--><span style=\"font-size:14.0pt;\r\nfont-family:\" times=\"\" new=\"\" roman\",serif;mso-fareast-font-family:\"times=\"\" roman\"\"=\"\">4.<span style=\"font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-size-adjust: none; font-language-override: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-variant-position: normal; font-variant-emoji: normal; font-stretch: normal; font-size: 7pt; line-height: normal; font-family: \" times=\"\" new=\"\" roman\";\"=\"\">&nbsp;&nbsp;&nbsp;\r\n</span></span><!--[endif]--><span style=\"font-size:14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">Nhận\r\nthuốc và tư vấn điều trị <o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\"><span style=\"font-size:\r\n14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">Mỗi bước đều có nhân viên hỗ trợ,\r\ngiúp người dân, đặc biệt là người lớn tuổi, dễ dàng tiếp cận dịch vụ.</span></p><p class=\"MsoNormal\"><span style=\"font-size:\r\n14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"><o:p><br></o:p></span></p><p class=\"MsoNormal\"><img src=\"https://phongkhamcdkontum.com.vn/uploads/images/cb8174a08b489c535869011d78663518-32891196118430842881.jpg\" style=\"width: 939.5px;\"><span style=\"font-size:\r\n14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"><o:p><br></o:p></span></p>\r\n\r\n<div class=\"MsoNormal\" align=\"center\" style=\"text-align:center\"><span style=\"font-size:14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">\r\n\r\n</span></div><p class=\"MsoNormal\"><b><span style=\"font-size:14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">Lan tỏa giá trị\r\nnhân văn của chính sách BHYT<o:p></o:p></span></b></p>\r\n\r\n<p class=\"MsoNormal\"><span style=\"font-size:14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">Việc\r\ntriển khai khám chữa bệnh BHYT tại Phòng khám không chỉ giúp:&nbsp;</span><span style=\"text-indent: -18pt; background-color: rgba(0, 0, 0, 0);\"><span style=\"font-size: 14pt;\" times=\"\" new=\"\" roman\",serif\"=\"\">Giảm\r\n     chi phí khám chữa bệnh cho người dân; tăng k</span></span><span style=\"font-size: 14pt; text-indent: -18pt; background-color: rgba(0, 0, 0, 0);\">hả năng tiếp cận dịch vụ y tế chất lượng; g</span><span style=\"font-size: 14pt; text-indent: -18pt; background-color: rgba(0, 0, 0, 0);\">óp\r\n     phần thực hiện hiệu quả chính sách an sinh xã hội; m</span><span style=\"font-size: 14pt; background-color: rgba(0, 0, 0, 0);\">à\r\ncòn khẳng định vai trò của Phòng khám trong việc </span><b style=\"font-size: 14pt; background-color: rgba(0, 0, 0, 0);\">đồng hành cùng hệ thống y tế,\r\nphục vụ sức khỏe cộng đồng tại địa phương</b><span style=\"font-size: 14pt; background-color: rgba(0, 0, 0, 0);\">.</span></p><p class=\"MsoNormal\"><img src=\"https://phongkhamcdkontum.com.vn/uploads/images/2b74a25f2524da4e1e9903513e6d7a51-44627983600582019271.jpg\" style=\"width: 939.5px;\"><br></p>\r\n\r\n<div class=\"MsoNormal\" align=\"center\" style=\"text-align:center\"><span style=\"font-size:14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">\r\n\r\n<hr size=\"2\" width=\"100%\" align=\"center\">\r\n\r\n</span></div>\r\n\r\n<p class=\"MsoNormal\"><b><span style=\"font-size:14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">Hướng tới phát\r\ntriển bền vững<o:p></o:p></span></b></p>\r\n\r\n<p class=\"MsoNormal\"><span style=\"font-size:14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">Trong\r\nthời gian tới, Phòng khám Đa khoa Trường Cao đẳng Kon Tum sẽ tiếp tục:</span></p><p class=\"MsoNormal\"><span style=\"font-size: 14pt; text-indent: -18pt; background-color: rgba(0, 0, 0, 0);\">- Nâng\r\n     cao chất lượng chuyên môn</span></p><p class=\"MsoNormal\"><span style=\"font-size: 14pt; text-indent: -18pt; background-color: rgba(0, 0, 0, 0);\">- Hoàn\r\n     thiện quy trình phục vụ</span></p><p class=\"MsoNormal\"><span style=\"font-size: 14pt; text-indent: -18pt; background-color: rgba(0, 0, 0, 0);\">- Đầu\r\n     tư trang thiết bị</span></p><p class=\"MsoNormal\"><span style=\"font-size: 14pt; text-indent: -18pt; background-color: rgba(0, 0, 0, 0);\">- Mở\r\n     rộng các dịch vụ khám chữa bệnh</span></p>\r\n\r\n<p class=\"MsoNormal\"><span style=\"font-size:\r\n14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">Nhằm đáp ứng ngày càng tốt hơn nhu\r\ncầu chăm sóc sức khỏe của người dân.</span></p><p class=\"MsoNormal\"></p><div class=\"MsoNormal\" align=\"center\" style=\"text-align:center\"><span style=\"font-size:14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">\r\n\r\n</span></div>\r\n\r\n<p class=\"MsoNormal\"><img src=\"https://phongkhamcdkontum.com.vn/uploads/images/2ff812833c68389209d7487e57e8759d-168354482137514171-Copy.jpg\" style=\"width: 939.5px;\"><span style=\"font-size:14.0pt;font-family:\" segoe=\"\" ui=\"\" emoji\",sans-serif;=\"\" mso-bidi-font-family:\"segoe=\"\" emoji\"\"=\"\"><br></span></p><p class=\"MsoNormal\"><span style=\"font-size:\r\n14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">Phòng khám Đa khoa Trường Cao đẳng\r\nKon Tum<o:p></o:p></span></p>\r\n\r\n<p class=\"MsoNormal\"><span style=\"font-size:\r\n14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">Hotline: 02606 558 568<o:p></o:p></span></p>\r\n\r\n<div class=\"MsoNormal\" align=\"center\" style=\"text-align:center\"><span style=\"font-size:14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\">\r\n\r\n<hr size=\"2\" width=\"100%\" align=\"center\">\r\n\r\n</span></div>\r\n\r\n<p class=\"MsoNormal\"><span style=\"font-size:\r\n14.0pt;font-family:\" times=\"\" new=\"\" roman\",serif\"=\"\"><i>Ngày làm việc đầu tiên chỉ là\r\nkhởi đầu – hành trình chăm sóc sức khỏe cộng đồng sẽ còn tiếp tục với nhiều nỗ\r\nlực và trách nhiệm hơn nữa.</i><o:p></o:p></span></p></td></tr></tbody></table><div dir=\"auto\" style=\"font-family: \" segoe=\"\" ui=\"\" historic\",=\"\" \"segoe=\"\" ui\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(8,=\"\" 8,=\"\" 9);=\"\" font-size:=\"\" 15px;=\"\" white-space-collapse:=\"\" preserve;\"=\"\"><span class=\"html-span xexx8yu xyri2b x18d9i69 x1c1uobl x1hl2dhg x16tdsg8 x1vvkbs x3nfvp2 x1j61x8r x1fcty0u xdj266r xat24cr xm2jcoa x1mpyi22 xxymvpz xlup9mm x1kky2od\" style=\"text-align: inherit; padding-inline: 0px; margin-inline: 1px; overflow-wrap: break-word; display: inline-flex; vertical-align: middle; padding-bottom: 0px; width: 16px; margin-bottom: 0px; margin-top: 0px; padding-top: 0px; height: 16px; font-family: inherit;\"><p class=\"MsoNormal\" style=\"text-align: justify;\"><br></p></span></div><div dir=\"auto\" style=\"font-family: \" segoe=\"\" ui=\"\" historic\",=\"\" \"segoe=\"\" ui\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" color:=\"\" rgb(8,=\"\" 8,=\"\" 9);=\"\" font-size:=\"\" 15px;=\"\" white-space-collapse:=\"\" preserve;\"=\"\"></div>', '62977b39ba4fd2f2c617909b1fecac22-4462798360058201927.jpg', 1, 0, 24, 4, '2026-03-24 17:03:04'),
(17, 0, 'BIẾN THỂ COVID-19 BA.3.2 (“VE SẦU”): CÓ ĐÁNG LO NGẠI?', 'Trong bối cảnh COVID-19 vẫn diễn biến phức tạp trên thế giới, sự xuất hiện của biến thể phụ BA.3.2 – còn được gọi với tên không chính thức là “ve sầu” – đang thu hút sự quan tâm của giới chuyên môn và cộng đồng.', '<p style=\"text-align:justify;\"><span style=\"font-size:14.0pt;\">Trong bối cảnh COVID-19 vẫn diễn biến phức tạp trên thế giới, sự xuất hiện của biến thể phụ BA.3.2 – còn được gọi với tên không chính thức là “ve sầu” – đang thu hút sự quan tâm của giới chuyên môn và cộng đồng.</span></p><p style=\"text-align:justify;\"><span style=\"font-size:14.0pt;\"><strong>BA.3.2 là biến thể gì?</strong></span></p><p style=\"text-align:justify;\"><span style=\"font-size:14.0pt;\">BA.3.2 là một biến thể phụ của dòng Omicron. Theo các chuyên gia, biến thể này mang <strong>hơn 70 đột biến</strong>, trong đó có nhiều đột biến liên quan đến khả năng né miễn dịch.</span></p><p style=\"text-align:justify;\"><span style=\"font-size:14.0pt;\">Điều này khiến BA.3.2 có thể <strong>lây lan trong cộng đồng đã có miễn dịch</strong>, bao gồm cả những người đã tiêm vaccine hoặc từng mắc COVID-19 trước đó.</span></p><p style=\"text-align:justify;\"><img class=\"image_resized\" style=\"width:800px;\" src=\"https://phongkhamcdkontum.com.vn/uploads/images/0ac925f6cda96e72fc13114dd2ddf10a-covid-hom-nay.jpeg\"></p><hr><p style=\"text-align:justify;\"><span style=\"font-size:14.0pt;\"><strong>Triệu chứng thường gặp</strong></span></p><p style=\"text-align:justify;\"><span style=\"font-size:14.0pt;\">Các triệu chứng của BA.3.2 hiện <strong>không khác biệt rõ rệt</strong> so với các biến thể Omicron trước đây, bao gồm:</span></p><ul><li style=\"text-align:justify;\"><span style=\"font-size:14.0pt;\">&nbsp;- Sốt hoặc ớn lạnh</span></li><li style=\"text-align:justify;\"><span style=\"font-size:14.0pt;\">&nbsp;- Đau họng</span></li><li style=\"text-align:justify;\"><span style=\"font-size:14.0pt;\">&nbsp;- Ho khan hoặc ho kéo dài</span></li><li style=\"text-align:justify;\"><span style=\"font-size:14.0pt;\">&nbsp;- Mệt mỏi</span></li><li style=\"text-align:justify;\"><span style=\"font-size:14.0pt;\">&nbsp;- Đau đầu, đau nhức cơ thể</span></li><li style=\"text-align:justify;\"><span style=\"font-size:14.0pt;\">&nbsp;- Nghẹt mũi hoặc chảy mũi</span></li></ul><p style=\"text-align:justify;\"><span style=\"font-size:14.0pt;\">Trong một số trường hợp, người bệnh có thể gặp triệu chứng tiêu hóa nhẹ.</span></p><p style=\"text-align:justify;\"><span style=\"font-size:14.0pt;\"><i><strong>* Các chuyên gia lưu ý</strong></i>: Triệu chứng thường <strong>nhẹ đến trung bình</strong>, nhưng vẫn cần theo dõi sát, đặc biệt ở người cao tuổi, người có bệnh nền.</span></p><hr><p style=\"text-align:justify;\"><span style=\"font-size:14.0pt;\"><strong>Mức độ nguy hiểm: Chưa có dấu hiệu tăng nặng</strong></span></p><p style=\"text-align:justify;\"><span style=\"font-size:14.0pt;\">Dù có khả năng né miễn dịch, nhưng đến thời điểm hiện tại:</span></p><ul><li style=\"text-align:justify;\"><span style=\"font-size:14.0pt;\">&nbsp;- Chưa có bằng chứng cho thấy BA.3.2 gây bệnh nặng hơn</span></li><li style=\"text-align:justify;\"><span style=\"font-size:14.0pt;\">&nbsp;- Tỷ lệ nhập viện và tử vong không tăng đột biến</span></li><li style=\"text-align:justify;\"><span style=\"font-size:14.0pt;\">&nbsp;- Vaccine vẫn giúp giảm nguy cơ chuyển nặng và tử vong</span></li></ul><hr><p style=\"text-align:justify;\"><span style=\"font-size:14.0pt;\"><strong>Xu hướng lây lan</strong></span></p><p style=\"text-align:justify;\"><span style=\"font-size:14.0pt;\">Biến thể BA.3.2 đã được ghi nhận tại một số quốc gia, tuy nhiên:</span></p><ul><li style=\"text-align:justify;\"><span style=\"font-size:14.0pt;\"><strong>&nbsp;- Chưa trở thành biến thể chiếm ưu thế toàn cầu</strong></span></li><li style=\"text-align:justify;\"><span style=\"font-size:14.0pt;\">&nbsp;- Tốc độ lây lan ở mức theo dõi, chưa đáng báo động</span></li><li style=\"text-align:justify;\"><span style=\"font-size:14.0pt;\">&nbsp;- COVID-19 hiện có xu hướng trở thành <strong>bệnh lưu hành theo mùa</strong></span></li><li style=\"text-align:justify;\"><img class=\"image_resized\" style=\"width:939.5px;\" src=\"https://phongkhamcdkontum.com.vn/uploads/images/47160df24ea1eeb0531e6ddd52614080-Gemini_Generated_Image_hbv86nhbv86nhbv8.png\"><br>&nbsp;</li></ul><hr><p style=\"text-align:justify;\"><span style=\"font-size:14.0pt;\"><strong>Khuyến cáo phòng bệnh</strong></span></p><p style=\"text-align:justify;\"><span style=\"font-size:18px;\">Trước sự xuất hiện của biến thể mới, các chuyên gia khuyến nghị:</span></p><ul><li style=\"text-align:justify;\"><span style=\"font-size:14.0pt;\">&nbsp;- Đeo khẩu trang nơi đông người hoặc khi có triệu chứng</span></li><li style=\"text-align:justify;\"><span style=\"font-size:14.0pt;\">&nbsp;- Rửa tay, sát khuẩn thường xuyên</span></li><li style=\"text-align:justify;\"><span style=\"font-size:14.0pt;\">&nbsp;- Theo dõi sức khỏe, đi khám khi có dấu hiệu bất thường</span></li><li style=\"text-align:justify;\"><span style=\"font-size:14.0pt;\">&nbsp;- Tiêm vaccine đầy đủ theo hướng dẫn của Bộ Y tế</span></li></ul><hr><p style=\"text-align:justify;\"><span style=\"font-size:14.0pt;\">Biến thể BA.3.2 (“ve sầu”) cho thấy khả năng thích nghi và né miễn dịch của virus SARS-CoV-2 vẫn đang tiếp diễn. Tuy nhiên, với các dữ liệu hiện có, <strong>nguy cơ chưa tăng cao</strong>.</span></p><p>&nbsp;</p><p style=\"text-align:justify;\"><span style=\"font-size:14.0pt;\">Điều quan trọng nhất lúc này là <strong>giữ tâm lý bình tĩnh, không hoang mang nhưng cũng không chủ quan</strong>, tiếp tục thực hiện các biện pháp phòng bệnh cá nhân.</span></p><p style=\"text-align:justify;\"><a target=\"_blank\" rel=\"noopener noreferrer\" href=\"https://vov.vn/xa-hoi/bien-the-covid-19-ba32-ve-sau-co-phai-chung-moi-chuyen-gia-noi-gi-post1280058.vov\">bien-the-covid-19-ba32</a></p>', 'ee2024be024dd64578338bb6588c6b77-covid-hom-nay.jpeg', 1, 0, 24, 4, '2026-04-01 14:54:12'),
(18, 1, 'Tôi mỏi mắt tìm ứng viên chấp nhận lương thấp 3 năm đầu', 'Tôi mỏi mắt tìm ứng viên chấp nhận lương thấp 3 năm đầu âbc', '<p style=\"margin-left:0px;\"><span style=\"color:hsl(0,0%,0%);font-family:\'Times New Roman\', Times, serif;font-size:18px;\">Nhiều ứng viên kỳ vọng mức lương cao dù kinh nghiệm và năng lực hiện tại chẳng tương xứng..</span></p><p style=\"margin-left:0px;\"><span style=\"color:hsl(0,0%,0%);font-family:\'Times New Roman\', Times, serif;font-size:18px;\">Đọc bài viết \"</span><a target=\"_blank\" rel=\"noopener noreferrer\" href=\"https://vnexpress.net/cu-nhan-that-nghiep-toi-nhu-dua-con-that-bai-du-bo-me-dau-tu-450-trieu-dong-hoc-dai-hoc-5083310.html\"><span style=\"color:hsl(0,0%,0%);font-family:\'Times New Roman\', Times, serif;font-size:18px;\">Tôi như đứa con thất bại dù bố mẹ đầu tư 450 triệu đồng học đại học</span></a><span style=\"color:hsl(0,0%,0%);font-family:\'Times New Roman\', Times, serif;font-size:18px;\">\", tôi thấy đây là sai lầm chung của rất nhiều bạn trẻ sau khi ra trường, khiến họ mãi vẫn không tìm được công việc tốt. Trong quá trình tuyển dụng, tôi đã phỏng vấn rất nhiều ứng viên xin việc ở nhiều độ tuổi khác nhau. Điều tôi quan tâm không chỉ là họ đã làm việc ở đâu hay bao lâu, mà quan trọng hơn là định hướng nghề nghiệp của họ là gì?</span></p><p style=\"margin-left:0px;\"><span style=\"color:hsl(0,0%,0%);font-family:\'Times New Roman\', Times, serif;font-size:18px;\"><strong>Có những ứng viên đã đi làm nhiều năm, nhưng khi nhìn vào CV, tôi vẫn khó hình dung họ thực sự có chuyên môn nổi bật ở lĩnh vực nào.</strong> Người thì liên tục thay đổi công việc chỉ sau vài tháng, người lại trải qua nhiều vị trí khác nhau mà không có một hướng phát triển rõ ràng. Qua những cuộc trao đổi, tôi nhận thấy không ít người vẫn chưa xác định được mình muốn theo đuổi ngành nghề hay chuyên môn nào trong dài hạn?</span></p><p style=\"margin-left:0px;\"><span style=\"color:hsl(0,0%,0%);font-family:\'Times New Roman\', Times, serif;font-size:18px;\">Một thực tế khác là nhiều ứng viên kỳ vọng mức lương khá cao dù kinh nghiệm và năng lực hiện tại chưa thực sự tương xứng. Tôi hiểu ai cũng mong muốn có thu nhập tốt, nhưng từ góc độ nhà tuyển dụng, mức lương thường phải đi cùng giá trị mà người lao động có thể tạo ra.</span></p><p style=\"margin-left:0px;\"><span style=\"color:hsl(0,0%,0%);font-family:\'Times New Roman\', Times, serif;font-size:18px;\"><strong>&gt;&gt; </strong></span><a target=\"_blank\" rel=\"noopener noreferrer\" href=\"https://vnexpress.net/ky-su-xay-dung-bai-hoc-lam-giau-hanh-trinh-tu-luong-3-trieu-den-thu-nhap-100-trieu-o-tuoi-35-5083515.html\"><span style=\"color:hsl(0,0%,0%);font-family:\'Times New Roman\', Times, serif;font-size:18px;\"><strong>Hành trình từ lương ba triệu đến thu nhập 100 triệu ở tuổi 35</strong></span></a></p><figure class=\"image\"><img style=\"aspect-ratio:1200/630;\" src=\"http://localhost/vieclam.vn/uploads/images/e6294e656e75572f011a58880617022f-camcum2.jpg\" alt=\"\" width=\"1200\" height=\"630\"></figure><p style=\"margin-left:0px;\"><span style=\"color:hsl(0,0%,0%);font-family:\'Times New Roman\', Times, serif;font-size:18px;\">Công ty tôi luôn sẵn sàng đào tạo nhân sự từ đầu. Tuy nhiên, điều tối thiểu mà tôi mong đợi ở một ứng viên là có định hướng nghề nghiệp rõ ràng và cam kết theo đuổi nó. Việc liên tục nhảy việc trong thời gian ngắn khiến doanh nghiệp khó đầu tư đào tạo, còn bản thân người lao động cũng khó tích lũy đủ kinh nghiệm để tạo ra lợi thế cạnh tranh.</span></p><p style=\"margin-left:0px;\"><span style=\"color:hsl(0,0%,0%);font-family:\'Times New Roman\', Times, serif;font-size:18px;\">Theo tôi, nếu chưa có nhiều kinh nghiệm, điều quan trọng nhất là tập trung học hỏi và nâng cao năng lực. Khi bạn thực sự giỏi nhưng không được ghi nhận xứng đáng, việc chuyển sang môi trường khác sẽ giúp bạn có cơ hội nhận mức lương tốt hơn dựa trên chính năng lực và kinh nghiệm đã tích lũy.</span></p><p style=\"margin-left:0px;\"><span style=\"color:hsl(0,0%,0%);font-family:\'Times New Roman\', Times, serif;font-size:18px;\">Thay vì chỉ tìm kiếm một công việc lương cao ngay từ đầu, tôi nghĩ mỗi người nên xác định rõ con đường nghề nghiệp của mình và kiên trì theo đuổi trong khoảng 3 đến 5 năm. Khi đó, thu nhập và cơ hội phát triển thường sẽ đến một cách xứng đáng với những gì bạn đã bỏ ra.</span></p>', 'be818169ec7367e8d71b2d59fd783b11-tuyen_dung.png', 3, 1, 1, 4, '2026-07-09 22:38:08'),
(19, 1, 'THÔNG BÁO TUYỂN DỤNG NGƯỜI LAO ĐỘNG VIỆT NAM VÀO VỊ TRÍ CÔNG VIỆC DỰ KIẾN TUYỂN NGƯỜI LAO ĐỘNG NƯỚC NGOÀI ( CÔNG TY TNHH PROPERWELL VIỆT NAM )', '', '<p>Đăng ký ứng tuyển tại : <a target=\"_blank\" rel=\"noopener noreferrer\" href=\"https://trungtamdichvuvieclamquangngai.netlify.app/?fbclid=IwZXh0bgNhZW0CMTAAYnJpZBExb2VTanZjREpiemk1YlptQ3NydGMGYXBwX2lkEDIyMjAzOTE3ODgyMDA4OTIAAR4EfSOXXkmdbz-IQA1erPnbRNT7qh2tAtQQOZHH5APAtaDCWyFE7ZHeIWbCZA_aem_Owirdt77O2PwzMorGCAhvA\"><strong>https://trungtamdichvuvieclamquangngai.netlify.app/</strong></a></p><p>Mọi chi tiết xin liên hệ: Phòng Thị trường lao động - Việc làm và Đào tạo -Trung tâm Dịch vụ việc làm Quảng Ngãi .</p><p>Lô 4L Tôn Đức Thắng - Phường Nghĩa Lộ - tỉnh Quảng Ngãi.</p><p>01 Nguyễn Thị Định - Phường Đắk Cấm - tỉnh Quảng Ngãi .</p><p>Điện thoại: 0911.260.739 - 0260.3868.907</p><p>EMAIL: phongdvvlquangngai@gmail.com.</p>', '8cf60905d3dd20334c4a22119afb4def-tuyndng-2024-03-25-02-53-09.png', 3, 0, 1, 4, '2026-06-29 13:50:58'),
(20, 1, 'Xu hướng tuyển dụng nhân sự trong thời đại số', 'Doanh nghiệp ngày càng ưu tiên ứng viên có kỹ năng công nghệ và khả năng thích nghi.', '<p>Trong thời đại chuyển đổi số, nhu cầu tuyển dụng nhân sự có kỹ năng công nghệ, tư duy sáng tạo và khả năng thích nghi đang ngày càng tăng. Người lao động cần chủ động cập nhật kiến thức để đáp ứng yêu cầu mới của doanh nghiệp.</p>', 'https://images.unsplash.com/photo-1521737711867-e3b97375f902?auto=format&fit=crop&w=1200&h=630&q=80', 1, 1, 0, 4, '2026-07-12 15:30:04'),
(21, 1, 'Những kỹ năng nhà tuyển dụng tìm kiếm ở ứng viên', 'Kỹ năng giao tiếp, làm việc nhóm và giải quyết vấn đề được nhiều doanh nghiệp đánh giá cao.', '<p>Bên cạnh kiến thức chuyên môn, nhà tuyển dụng đặc biệt quan tâm đến kỹ năng giao tiếp, làm việc nhóm, quản lý thời gian và giải quyết vấn đề.</p>', 'https://images.unsplash.com/photo-1522071820081-009f0129c71c?auto=format&fit=crop&w=1200&h=630&q=80', 2, 1, 0, 4, '2026-07-12 15:30:04'),
(22, 1, 'Cách viết CV tạo ấn tượng với nhà tuyển dụng', 'Một bản CV rõ ràng và phù hợp sẽ giúp ứng viên tăng cơ hội được mời phỏng vấn.', '<p>CV nên trình bày ngắn gọn, rõ ràng và tập trung vào những kinh nghiệm liên quan đến vị trí ứng tuyển. Ứng viên cần kiểm tra kỹ lỗi chính tả và thông tin liên hệ.</p>', 'https://images.unsplash.com/photo-1484480974693-6ca0a78fb36b?auto=format&fit=crop&w=1200&h=630&q=80', 1, 1, 0, 4, '2026-07-12 15:30:04'),
(23, 1, 'Sinh viên mới ra trường cần chuẩn bị gì khi tìm việc', 'Sự chuẩn bị kỹ lưỡng giúp sinh viên tự tin hơn khi tham gia thị trường lao động.', '<p>Sinh viên mới ra trường nên chuẩn bị CV, tìm hiểu doanh nghiệp, luyện tập kỹ năng phỏng vấn và xác định mục tiêu nghề nghiệp.</p>', 'https://images.unsplash.com/photo-1523240795612-9a054b0db644?auto=format&fit=crop&w=1200&h=630&q=80', 1, 1, 0, 4, '2026-07-12 15:30:04'),
(24, 1, 'Bí quyết phỏng vấn xin việc thành công', 'Chuẩn bị trước câu trả lời và tìm hiểu doanh nghiệp là yếu tố quan trọng khi phỏng vấn.', '<p>Trước buổi phỏng vấn, ứng viên nên tìm hiểu kỹ thông tin doanh nghiệp và mô tả công việc. Hãy trả lời trung thực, rõ ràng và tự tin.</p>', 'https://images.unsplash.com/photo-1556761175-b413da4baf72?auto=format&fit=crop&w=1200&h=630&q=80', 1, 1, 0, 4, '2026-07-12 15:30:04'),
(25, 1, 'Doanh nghiệp tăng nhu cầu tuyển dụng lao động trẻ', 'Lao động trẻ được đánh giá cao nhờ sự năng động và khả năng tiếp cận công nghệ.', '<p>Nhiều doanh nghiệp đang mở rộng cơ hội việc làm cho lao động trẻ. Sự năng động, sáng tạo và khả năng sử dụng công nghệ là những lợi thế lớn.</p>', 'https://images.unsplash.com/photo-1521737604893-d14cc237f11d?auto=format&fit=crop&w=1200&h=630&q=80', 2, 0, 0, 4, '2026-07-12 15:30:04'),
(26, 1, 'Cơ hội việc làm trong lĩnh vực công nghệ thông tin', 'Ngành công nghệ thông tin tiếp tục có nhu cầu tuyển dụng cao với nhiều vị trí hấp dẫn.', '<p>Các vị trí lập trình viên, kiểm thử phần mềm, quản trị hệ thống, phân tích dữ liệu và an toàn thông tin đang được nhiều doanh nghiệp tuyển dụng.</p>', 'https://images.unsplash.com/photo-1498050108023-c5249f4df085?auto=format&fit=crop&w=1200&h=630&q=80', 3, 1, 0, 4, '2026-07-12 15:30:04'),
(27, 1, 'Nhu cầu tuyển dụng nhân viên kinh doanh ngày càng tăng', 'Nhân viên kinh doanh đóng vai trò quan trọng trong hoạt động phát triển thị trường.', '<p>Nhiều doanh nghiệp đang tìm kiếm nhân viên kinh doanh có kỹ năng giao tiếp tốt, chủ động và chịu được áp lực.</p>', 'https://images.unsplash.com/photo-1556742049-0cfed4f6a45d?auto=format&fit=crop&w=1200&h=630&q=80', 3, 0, 0, 4, '2026-07-12 15:30:04'),
(28, 1, 'Việc làm bán thời gian phù hợp với sinh viên', 'Công việc bán thời gian giúp sinh viên có thêm thu nhập và tích lũy kinh nghiệm.', '<p>Sinh viên có thể lựa chọn các công việc như bán hàng, phục vụ, cộng tác viên nội dung, gia sư hoặc hỗ trợ sự kiện.</p>', 'https://images.unsplash.com/photo-1522202176988-66273c2fd55f?auto=format&fit=crop&w=1200&h=630&q=80', 1, 0, 0, 4, '2026-07-12 15:30:04'),
(29, 1, 'Những lỗi thường gặp khi viết hồ sơ xin việc', 'Thông tin thiếu chính xác và trình bày rườm rà có thể làm giảm cơ hội của ứng viên.', '<p>Các lỗi phổ biến gồm sai chính tả, thiếu thông tin liên hệ, mô tả kinh nghiệm không rõ ràng và sử dụng một CV cho mọi vị trí.</p>', 'https://images.unsplash.com/photo-1516321318423-f06f85e504b3?auto=format&fit=crop&w=1200&h=630&q=80', 1, 0, 0, 4, '2026-07-12 15:30:04'),
(30, 1, 'Cách tìm việc làm phù hợp với năng lực bản thân', 'Hiểu rõ điểm mạnh và mục tiêu nghề nghiệp giúp ứng viên lựa chọn đúng công việc.', '<p>Người tìm việc cần đánh giá kỹ năng, sở thích, kinh nghiệm và định hướng tương lai trước khi ứng tuyển.</p>', 'https://images.unsplash.com/photo-1454165804606-c3d57bc86b40?auto=format&fit=crop&w=1200&h=630&q=80', 2, 0, 0, 4, '2026-07-12 15:30:04'),
(31, 1, 'Nhà tuyển dụng đánh giá ứng viên qua những yếu tố nào', 'Thái độ, kỹ năng và kinh nghiệm là ba nhóm tiêu chí thường được doanh nghiệp quan tâm.', '<p>Nhà tuyển dụng thường đánh giá ứng viên thông qua năng lực chuyên môn, kỹ năng mềm, thái độ làm việc và mức độ phù hợp với văn hóa doanh nghiệp.</p>', 'https://images.unsplash.com/photo-1551836022-d5d88e9218df?auto=format&fit=crop&w=1200&h=630&q=80', 1, 0, 0, 4, '2026-07-12 15:30:04'),
(32, 1, 'Tầm quan trọng của kỹ năng giao tiếp khi xin việc', 'Giao tiếp tốt giúp ứng viên thể hiện rõ năng lực và tạo thiện cảm trong buổi phỏng vấn.', '<p>Kỹ năng giao tiếp giúp ứng viên trả lời phỏng vấn hiệu quả và hỗ trợ quá trình phối hợp công việc sau khi được tuyển dụng.</p>', 'https://images.unsplash.com/photo-1556761175-5973dc0f32e7?auto=format&fit=crop&w=1200&h=630&q=80', 2, 0, 0, 4, '2026-07-12 15:30:04'),
(33, 1, 'Cách trả lời câu hỏi giới thiệu bản thân khi phỏng vấn', 'Phần giới thiệu bản thân nên ngắn gọn và tập trung vào nội dung liên quan đến công việc.', '<p>Ứng viên nên giới thiệu họ tên, chuyên môn, kinh nghiệm nổi bật và lý do phù hợp với vị trí ứng tuyển.</p>', 'https://images.unsplash.com/photo-1565688534245-05d6b5be184a?auto=format&fit=crop&w=1200&h=630&q=80', 3, 0, 0, 4, '2026-07-12 15:30:04'),
(34, 1, 'Làm thế nào để lựa chọn công ty phù hợp', 'Văn hóa doanh nghiệp và cơ hội phát triển là yếu tố cần cân nhắc khi chọn nơi làm việc.', '<p>Ứng viên nên tìm hiểu môi trường làm việc, chế độ đãi ngộ, định hướng phát triển và uy tín của doanh nghiệp trước khi quyết định ứng tuyển.</p>', 'https://images.unsplash.com/photo-1497366754035-f200968a6e72?auto=format&fit=crop&w=1200&h=630&q=80', 1, 1, 0, 4, '2026-07-12 15:30:04'),
(35, 1, 'Cơ hội nghề nghiệp trong lĩnh vực thương mại điện tử', 'Sự phát triển của mua sắm trực tuyến tạo ra nhiều vị trí việc làm mới.', '<p>Thương mại điện tử đang cần nhân sự ở các vị trí vận hành sàn, marketing, chăm sóc khách hàng, quản lý kho và phân tích dữ liệu.</p>', 'https://images.unsplash.com/photo-1552664730-d307ca884978?auto=format&fit=crop&w=1200&h=630&q=80', 2, 0, 0, 4, '2026-07-12 15:30:04'),
(36, 1, 'Ngành dịch vụ cần tuyển nhiều lao động', 'Du lịch, nhà hàng và bán lẻ đang có nhu cầu bổ sung nhân sự.', '<p>Các doanh nghiệp dịch vụ thường xuyên tuyển dụng nhân viên phục vụ, lễ tân, thu ngân, bán hàng và chăm sóc khách hàng.</p>', 'https://images.unsplash.com/photo-1497366811353-6870744d04b2?auto=format&fit=crop&w=1200&h=630&q=80', 3, 0, 0, 99, '2026-07-12 15:30:04'),
(37, 1, 'Kỹ năng quản lý thời gian giúp nâng cao hiệu quả công việc', 'Sắp xếp công việc hợp lý giúp người lao động hoàn thành nhiệm vụ đúng thời hạn.', '<p>Người lao động nên lập danh sách công việc, xác định mức độ ưu tiên và hạn chế các yếu tố gây mất tập trung.</p>', 'https://images.unsplash.com/photo-1506784983877-45594efa4cbe?auto=format&fit=crop&w=1200&h=630&q=80', 1, 0, 0, 4, '2026-07-12 15:30:04'),
(38, 1, 'Cách xây dựng thương hiệu cá nhân khi tìm việc', 'Thương hiệu cá nhân tích cực giúp ứng viên nổi bật trên thị trường lao động.', '<p>Ứng viên có thể xây dựng thương hiệu cá nhân thông qua hồ sơ nghề nghiệp, sản phẩm đã thực hiện và các hoạt động chuyên môn.</p>', 'https://images.unsplash.com/photo-1516321165247-4aa89a48be28?auto=format&fit=crop&w=1200&h=630&q=80', 2, 1, 0, 4, '2026-07-12 15:30:04'),
(39, 1, 'Ứng viên cần lưu ý gì khi đọc tin tuyển dụng', 'Đọc kỹ yêu cầu công việc giúp hạn chế ứng tuyển nhầm vị trí.', '<p>Người tìm việc cần chú ý mô tả công việc, yêu cầu kinh nghiệm, địa điểm, thời gian làm việc, mức lương và thông tin doanh nghiệp.</p>', 'https://images.unsplash.com/photo-1551836022-4c4c79ecde51?auto=format&fit=crop&w=1200&h=630&q=80', 3, 0, 0, 4, '2026-07-12 15:30:04'),
(40, 1, 'Cảnh giác với các tin tuyển dụng không minh bạch', 'Người tìm việc cần kiểm tra kỹ thông tin trước khi cung cấp dữ liệu cá nhân.', '<p>Ứng viên không nên chuyển tiền hoặc cung cấp thông tin nhạy cảm cho đơn vị tuyển dụng chưa được xác minh.</p>', 'https://images.unsplash.com/photo-1554224155-8d04cb21cd6c?auto=format&fit=crop&w=1200&h=630&q=80', 1, 1, 0, 4, '2026-07-12 15:30:04'),
(41, 1, 'Cách thương lượng mức lương khi phỏng vấn', 'Ứng viên nên tìm hiểu mức lương thị trường trước khi trao đổi với doanh nghiệp.', '<p>Khi thương lượng lương, ứng viên cần dựa trên kinh nghiệm, kỹ năng, phạm vi công việc và mức lương phổ biến trên thị trường.</p>', 'https://images.unsplash.com/photo-1551836022-d5d88e9218df?auto=format&fit=crop&w=1200&h=630&q=80', 1, 0, 0, 4, '2026-07-12 15:30:04'),
(42, 1, 'Lợi ích của việc thực tập trước khi tốt nghiệp', 'Thực tập giúp sinh viên hiểu môi trường doanh nghiệp và tích lũy kinh nghiệm thực tế.', '<p>Thông qua kỳ thực tập, sinh viên có cơ hội áp dụng kiến thức, học hỏi kỹ năng nghề nghiệp và tạo mối quan hệ với doanh nghiệp.</p>', 'https://images.unsplash.com/photo-1531482615713-2afd69097998?auto=format&fit=crop&w=1200&h=630&q=80', 1, 0, 0, 99, '2026-07-12 15:30:04'),
(43, 1, 'Doanh nghiệp chú trọng tuyển dụng nhân sự đa kỹ năng', 'Ứng viên có khả năng thực hiện nhiều nhiệm vụ thường có lợi thế cạnh tranh.', '<p>Trong môi trường làm việc hiện đại, doanh nghiệp ưu tiên nhân sự vừa có chuyên môn vừa có kỹ năng công nghệ, giao tiếp và xử lý tình huống.</p>', 'https://images.unsplash.com/photo-1522071901873-411886a10004?auto=format&fit=crop&w=1200&h=630&q=80', 1, 0, 0, 99, '2026-07-12 15:30:04'),
(44, 1, 'Xu hướng làm việc từ xa và cơ hội nghề nghiệp', 'Làm việc từ xa tạo thêm cơ hội cho ứng viên ở nhiều khu vực.', '<p>Các công việc lập trình, thiết kế, nội dung, chăm sóc khách hàng và marketing có thể thực hiện từ xa.</p>', 'https://images.unsplash.com/photo-1588196749597-9ff075ee6b5b?auto=format&fit=crop&w=1200&h=630&q=80', 1, 1, 0, 4, '2026-07-12 15:30:04'),
(45, 1, 'Kỹ năng làm việc nhóm trong môi trường doanh nghiệp', 'Khả năng phối hợp tốt giúp nâng cao chất lượng và tiến độ công việc.', '<p>Làm việc nhóm yêu cầu mỗi thành viên biết lắng nghe, chia sẻ thông tin, hỗ trợ đồng nghiệp và chịu trách nhiệm với nhiệm vụ được giao.</p>', 'https://images.unsplash.com/photo-1529156069898-49953e39b3ac?auto=format&fit=crop&w=1200&h=630&q=80', 2, 0, 0, 4, '2026-07-12 15:30:04'),
(46, 1, 'Những ngành nghề có nhu cầu tuyển dụng ổn định', 'Công nghệ, y tế, giáo dục, bán hàng và logistics vẫn cần nhiều lao động.', '<p>Nhu cầu nhân lực ở một số lĩnh vực tiếp tục duy trì ổn định. Người lao động nên lựa chọn ngành phù hợp với năng lực.</p>', 'https://images.unsplash.com/photo-1524758631624-e2822e304c36?auto=format&fit=crop&w=1200&h=630&q=80', 1, 0, 0, 4, '2026-07-12 15:30:04'),
(47, 1, 'Cách tạo hồ sơ trực tuyến chuyên nghiệp', 'Hồ sơ trực tuyến giúp nhà tuyển dụng dễ dàng tiếp cận thông tin của ứng viên.', '<p>Ứng viên nên cập nhật đầy đủ thông tin cá nhân, kinh nghiệm, kỹ năng, học vấn và các sản phẩm đã thực hiện.</p>', 'https://images.unsplash.com/photo-1516321497487-e288fb19713f?auto=format&fit=crop&w=1200&h=630&q=80', 1, 0, 0, 4, '2026-07-12 15:30:04'),
(48, 1, 'Những câu hỏi thường gặp khi phỏng vấn tuyển dụng', 'Chuẩn bị trước các câu hỏi phổ biến giúp ứng viên tự tin hơn.', '<p>Các câu hỏi thường gặp gồm giới thiệu bản thân, điểm mạnh, điểm yếu, mục tiêu nghề nghiệp, lý do ứng tuyển và mức lương mong muốn.</p>', 'https://images.unsplash.com/photo-1560472354-b33ff0c44a43?auto=format&fit=crop&w=1200&h=630&q=80', 1, 0, 0, 4, '2026-07-12 15:30:04'),
(49, 1, 'Cách thể hiện điểm mạnh trong buổi phỏng vấn', 'Ứng viên nên sử dụng ví dụ thực tế để chứng minh năng lực.', '<p>Thay vì chỉ liệt kê điểm mạnh, ứng viên nên trình bày tình huống cụ thể đã từng xử lý và kết quả đạt được.</p>', 'https://images.unsplash.com/photo-1556761175-4b46a572b786?auto=format&fit=crop&w=1200&h=630&q=80', 1, 0, 0, 4, '2026-07-12 15:30:04'),
(50, 1, 'Vai trò của ngoại ngữ trong tuyển dụng hiện nay', 'Ngoại ngữ mở rộng cơ hội làm việc tại các doanh nghiệp trong và ngoài nước.', '<p>Khả năng sử dụng ngoại ngữ giúp ứng viên tiếp cận tài liệu chuyên môn, giao tiếp với đối tác và có thêm cơ hội phát triển nghề nghiệp.</p>', 'https://images.unsplash.com/photo-1497366754035-f200968a6e72?auto=format&fit=crop&w=1200&h=630&q=80', 1, 1, 0, 4, '2026-07-12 15:30:04'),
(51, 1, 'Kỹ năng tin học văn phòng cần thiết cho người lao động', 'Sử dụng tốt các phần mềm văn phòng là yêu cầu phổ biến ở nhiều vị trí.', '<p>Người lao động nên thành thạo soạn thảo văn bản, bảng tính, trình chiếu, quản lý email và các công cụ cộng tác trực tuyến.</p>', 'https://images.unsplash.com/photo-1542744173-8e7e53415bb0?auto=format&fit=crop&w=1200&h=630&q=80', 1, 0, 0, 4, '2026-07-12 15:30:04'),
(52, 1, 'Cơ hội việc làm ngành kế toán và tài chính', 'Nhiều doanh nghiệp cần nhân sự phụ trách kế toán, thuế và quản lý tài chính.', '<p>Ứng viên ngành kế toán cần nắm vững nghiệp vụ, phần mềm chuyên dụng và các quy định liên quan.</p>', 'https://images.unsplash.com/photo-1554224154-26032ffc0d07?auto=format&fit=crop&w=1200&h=630&q=80', 1, 0, 0, 4, '2026-07-12 15:30:04'),
(53, 1, 'Doanh nghiệp tuyển dụng nhân sự marketing', 'Marketing số đang tạo ra nhiều cơ hội việc làm cho lao động trẻ.', '<p>Các vị trí phổ biến gồm nội dung, quảng cáo trực tuyến, thiết kế, quản trị mạng xã hội, SEO và nghiên cứu thị trường.</p>', 'https://images.unsplash.com/photo-1533750516457-a7f992034fec?auto=format&fit=crop&w=1200&h=630&q=80', 1, 0, 0, 4, '2026-07-12 15:30:04'),
(54, 1, 'Cách chuẩn bị trang phục khi đi phỏng vấn', 'Trang phục lịch sự giúp ứng viên tạo ấn tượng chuyên nghiệp.', '<p>Ứng viên nên lựa chọn trang phục gọn gàng, sạch sẽ và phù hợp với văn hóa doanh nghiệp.</p>', 'https://images.unsplash.com/photo-1507679799987-c73779587ccf?auto=format&fit=crop&w=1200&h=630&q=80', 1, 0, 0, 4, '2026-07-12 15:30:04'),
(55, 1, 'Làm gì sau khi kết thúc buổi phỏng vấn', 'Gửi thư cảm ơn là cách thể hiện sự chuyên nghiệp và quan tâm đến vị trí.', '<p>Sau phỏng vấn, ứng viên có thể gửi thư cảm ơn ngắn gọn, nhắc lại sự quan tâm đến công việc và chờ phản hồi.</p>', 'https://images.unsplash.com/photo-1450101499163-c8848c66ca85?auto=format&fit=crop&w=1200&h=630&q=80', 1, 0, 0, 4, '2026-07-12 15:30:04'),
(56, 1, 'Kinh nghiệm tìm việc qua các nền tảng trực tuyến', 'Nền tảng tuyển dụng giúp ứng viên tiếp cận nhiều công việc nhanh chóng.', '<p>Ứng viên nên sử dụng bộ lọc theo ngành nghề, địa điểm, mức lương và kinh nghiệm. Hồ sơ cần được cập nhật thường xuyên.</p>', 'https://images.unsplash.com/photo-1521791136064-7986c2920216?auto=format&fit=crop&w=1200&h=630&q=80', 1, 1, 0, 4, '2026-07-12 15:30:04'),
(57, 1, 'Cách xác định mục tiêu nghề nghiệp phù hợp', 'Mục tiêu rõ ràng giúp người lao động xây dựng lộ trình phát triển hiệu quả.', '<p>Mục tiêu nghề nghiệp nên cụ thể, phù hợp với khả năng và có mốc thời gian để đánh giá.</p>', 'https://images.unsplash.com/photo-1499750310107-5fef28a66643?auto=format&fit=crop&w=1200&h=630&q=80', 1, 0, 0, 4, '2026-07-12 15:30:04'),
(58, 1, 'Nhân sự logistics có nhiều cơ hội việc làm', 'Sự phát triển của vận chuyển và thương mại tạo nhu cầu lớn về nhân lực logistics.', '<p>Các vị trí trong ngành logistics gồm điều phối vận tải, quản lý kho, chứng từ, xuất nhập khẩu và chăm sóc khách hàng.</p>', 'https://images.unsplash.com/photo-1586528116311-ad8dd3c8310d?auto=format&fit=crop&w=1200&h=630&q=80', 1, 0, 0, 4, '2026-07-12 15:30:04'),
(59, 1, 'Cơ hội việc làm dành cho lao động phổ thông', 'Nhiều doanh nghiệp sản xuất và dịch vụ đang tuyển lao động phổ thông.', '<p>Các vị trí phổ biến gồm công nhân sản xuất, đóng gói, kho vận, giao hàng, bảo vệ và nhân viên phục vụ.</p>', 'https://images.unsplash.com/photo-1504917595217-d4dc5ebe6122?auto=format&fit=crop&w=1200&h=630&q=80', 1, 0, 0, 4, '2026-07-12 15:30:04'),
(60, 1, 'Kỹ năng thích nghi giúp nhân sự phát triển bền vững', 'Khả năng thích nghi giúp người lao động đáp ứng các thay đổi trong công việc.', '<p>Người lao động cần chủ động học hỏi, tiếp nhận phản hồi và sẵn sàng thay đổi phương pháp làm việc.</p>', 'https://images.unsplash.com/photo-1517245386807-bb43f82c33c4?auto=format&fit=crop&w=1200&h=630&q=80', 1, 0, 0, 4, '2026-07-12 15:30:04'),
(61, 1, 'Những điều cần biết trong thời gian thử việc', 'Thử việc là giai đoạn để người lao động và doanh nghiệp đánh giá sự phù hợp.', '<p>Trong thời gian thử việc, nhân viên nên chủ động tìm hiểu quy trình, hoàn thành nhiệm vụ và tuân thủ nội quy doanh nghiệp.</p>', 'https://images.unsplash.com/photo-1556761175-5973dc0f32e7?auto=format&fit=crop&w=1200&h=630&q=80', 1, 0, 0, 4, '2026-07-12 15:30:04'),
(62, 1, 'Cách hòa nhập nhanh với môi trường làm việc mới', 'Chủ động giao tiếp và học hỏi giúp nhân viên mới thích nghi nhanh hơn.', '<p>Nhân viên mới nên tìm hiểu văn hóa công ty, xây dựng mối quan hệ tích cực và chủ động hỏi khi chưa rõ công việc.</p>', 'https://images.unsplash.com/photo-1521737711867-e3b97375f902?auto=format&fit=crop&w=1200&h=630&q=80', 1, 0, 0, 4, '2026-07-12 15:30:04'),
(63, 1, 'Doanh nghiệp ưu tiên ứng viên có kinh nghiệm thực tế', 'Kinh nghiệm thực tế giúp ứng viên chứng minh khả năng xử lý công việc.', '<p>Ứng viên có thể tích lũy kinh nghiệm thông qua thực tập, dự án cá nhân, hoạt động tình nguyện hoặc công việc bán thời gian.</p>', 'https://images.unsplash.com/photo-1522202176988-66273c2fd55f?auto=format&fit=crop&w=1200&h=630&q=80', 1, 1, 0, 4, '2026-07-12 15:30:04'),
(64, 1, 'Cách nâng cao cơ hội được nhà tuyển dụng lựa chọn', 'Hồ sơ phù hợp và thái độ chuyên nghiệp giúp ứng viên tăng khả năng trúng tuyển.', '<p>Ứng viên cần nghiên cứu kỹ vị trí, điều chỉnh CV, chuẩn bị phỏng vấn và thể hiện sự quan tâm nghiêm túc.</p>', 'https://images.unsplash.com/photo-1552664730-d307ca884978?auto=format&fit=crop&w=1200&h=630&q=80', 1, 0, 0, 4, '2026-07-12 15:30:04'),
(65, 1, 'Cơ hội việc làm ngành chăm sóc khách hàng', 'Nhiều doanh nghiệp cần nhân sự có khả năng giao tiếp và xử lý tình huống tốt.', '<p>Nhân viên chăm sóc khách hàng có nhiệm vụ hỗ trợ, giải đáp và tiếp nhận phản hồi từ khách hàng.</p>', 'https://images.unsplash.com/photo-1525182008055-f88b95ff7980?auto=format&fit=crop&w=1200&h=630&q=80', 1, 0, 0, 4, '2026-07-12 15:30:04'),
(66, 1, 'Tuyển dụng nhân sự ngành thiết kế đồ họa', 'Nhu cầu thiết kế nội dung số đang mở ra nhiều cơ hội nghề nghiệp.', '<p>Ứng viên thiết kế đồ họa cần có tư duy thẩm mỹ, sử dụng tốt công cụ thiết kế và chuẩn bị hồ sơ sản phẩm.</p>', 'https://images.unsplash.com/photo-1561070791-2526d30994b5?auto=format&fit=crop&w=1200&h=630&q=80', 1, 0, 0, 4, '2026-07-12 15:30:04'),
(67, 1, 'Lợi ích của ngày hội việc làm đối với sinh viên', 'Ngày hội việc làm giúp sinh viên gặp gỡ trực tiếp doanh nghiệp tuyển dụng.', '<p>Thông qua ngày hội việc làm, sinh viên có thể tìm hiểu vị trí tuyển dụng, nộp hồ sơ, phỏng vấn nhanh và nhận tư vấn nghề nghiệp.</p>', 'https://images.unsplash.com/photo-1523580846011-d3a5bc25702b?auto=format&fit=crop&w=1200&h=630&q=80', 1, 1, 0, 4, '2026-07-12 15:30:04'),
(68, 1, 'Doanh nghiệp và nhà trường tăng cường kết nối tuyển dụng', 'Sự phối hợp giữa nhà trường và doanh nghiệp giúp sinh viên tiếp cận việc làm phù hợp.', '<p>Các chương trình hợp tác đào tạo, tham quan doanh nghiệp, thực tập và tuyển dụng trực tiếp giúp rút ngắn khoảng cách giữa đào tạo và nhu cầu lao động.</p>', 'https://images.unsplash.com/photo-1524178232363-1fb2b075b655?auto=format&fit=crop&w=1200&h=630&q=80', 2, 1, 0, 4, '2026-07-12 15:30:04'),
(69, 1, 'Cổng thông tin việc làm hỗ trợ kết nối sinh viên và doanh nghiệp', 'Nền tảng việc làm giúp chia sẻ tin tuyển dụng và hồ sơ ứng viên thuận tiện.', '<p>Cổng thông tin việc làm Trường Cao đẳng Kon Tum hỗ trợ sinh viên, người tìm việc và doanh nghiệp kết nối, đăng tin tuyển dụng và tiếp cận cơ hội nghề nghiệp.</p>', 'https://images.unsplash.com/photo-1521737711867-e3b97375f902?auto=format&fit=crop&w=1200&h=630&q=80', 1, 1, 0, 4, '2026-07-12 15:30:04');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hicrm_event_comments`
--

CREATE TABLE `hicrm_event_comments` (
  `id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `comment_name` varchar(255) NOT NULL,
  `comment_email` varchar(255) DEFAULT NULL,
  `comment_content` text NOT NULL,
  `admin_reply` text DEFAULT NULL,
  `reply_user_id` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `replied_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `hicrm_event_comments`
--

INSERT INTO `hicrm_event_comments` (`id`, `event_id`, `parent_id`, `user_id`, `comment_name`, `comment_email`, `comment_content`, `admin_reply`, `reply_user_id`, `status`, `created_at`, `updated_at`, `replied_at`) VALUES
(1, 18, NULL, 0, 'Vũ Xuân Cương', 'xuancuong@gmail.co', 'Tôi muốn ứng tuyển vị trí giám đốc', 'À thế à. Thế liên hệ qua Email: Cdkt@gmail.com nhé bạn', 1, 1, '2026-06-22 21:50:03', '2026-06-22 21:57:56', '2026-06-22 21:57:56'),
(2, 18, NULL, 0, 'Vũ Xuân Cương', 'vuxuancuong98gl@gmail.com', 'good job', NULL, NULL, 1, '2026-06-28 22:32:21', NULL, NULL),
(3, 17, NULL, 1, 'Vũ Xuân Cương', 'cuongmedia@gmail.com', 'OK', NULL, NULL, 1, '2026-06-29 21:48:43', NULL, NULL),
(4, 19, NULL, 1, 'Vũ Xuân Cương', 'cuongmedia@gmail.com', 'ok', NULL, NULL, 1, '2026-06-29 21:57:31', NULL, NULL),
(5, 19, NULL, 1, 'Vũ Xuân Cương', 'cuongmedia@gmail.com', 'TỐT', NULL, NULL, 1, '2026-07-05 21:44:44', NULL, NULL),
(6, 19, 4, 1, 'Vũ Xuân Cương', 'cuongmedia@gmail.com', 'abc', 'Ok', 1, 1, '2026-07-05 21:44:51', '2026-07-09 22:38:47', '2026-07-09 22:38:47'),
(7, 67, NULL, 1, 'Vũ Xuân Cương', 'vuxuancuong98gl@gmail.com', 'abc', NULL, NULL, 1, '2026-07-13 15:32:16', NULL, NULL),
(8, 68, NULL, 52, 'Nguyễn Trần Hữu Hà', 'vxcuong05@gmail.com', 'Tôi muốn ứng tuyển', NULL, NULL, 1, '2026-07-17 15:58:19', NULL, NULL),
(9, 18, NULL, 65, 'Phan Hoàng Anh', 'hoanganh@gmail.com', 'hi', 'haha', 1, 99, '2026-07-24 04:47:05', '2026-07-26 02:54:08', '2026-07-26 02:53:22');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hicrm_event_type`
--

CREATE TABLE `hicrm_event_type` (
  `id` int(11) NOT NULL,
  `event_type_name` varchar(255) NOT NULL,
  `event_type_status` int(11) NOT NULL DEFAULT 1,
  `event_type_icon` varchar(255) DEFAULT NULL,
  `event_type_color` varchar(255) DEFAULT NULL,
  `event_type_slug` varchar(255) NOT NULL,
  `event_stt` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `hicrm_event_type`
--

INSERT INTO `hicrm_event_type` (`id`, `event_type_name`, `event_type_status`, `event_type_icon`, `event_type_color`, `event_type_slug`, `event_stt`) VALUES
(1, 'Tin hoạt động', 1, NULL, NULL, 'tin-hoat-dong', 1),
(2, 'Tin y tế cộng đồng', 1, NULL, NULL, 'tin-y-te-cong-dong', 2),
(3, 'Thông báo', 1, NULL, NULL, 'thong-bao', 3),
(4, 'Sự kiện - hội thảo', 1, NULL, NULL, 'su-kien-hoi-thao', 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hicrm_google_meets`
--

CREATE TABLE `hicrm_google_meets` (
  `id` bigint(20) NOT NULL,
  `meeting_time` datetime NOT NULL,
  `employer_id` bigint(20) NOT NULL,
  `job_post_id` bigint(20) NOT NULL,
  `candidate_emails` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `meet_url` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'scheduled',
  `created_by` bigint(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `hicrm_google_meets`
--

INSERT INTO `hicrm_google_meets` (`id`, `meeting_time`, `employer_id`, `job_post_id`, `candidate_emails`, `meet_url`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(1, '2026-06-16 07:30:00', 11, 1, 'vxcuong01@gmail.com', 'https://meet.google.com/nof-zqef-juf', 'closed', 1, '2026-06-15 16:28:57', '2026-06-15 16:29:28'),
(2, '2026-06-30 13:36:00', 7, 67, '', 'https://meet.google.com/nof-zqef-juf', '1', 1, '2026-06-29 06:37:15', '2026-06-29 06:37:15');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hicrm_images`
--

CREATE TABLE `hicrm_images` (
  `id` int(11) NOT NULL,
  `image_name` varchar(255) NOT NULL,
  `image_url` text NOT NULL,
  `image_category` int(11) NOT NULL DEFAULT 0 COMMENT '0 - Mặc định 1 - Ưu đãi hấp dẫn 2 - Không gian phòng khám 3 - Slider\r\n4 - Giới thiệu	',
  `image_user_created` int(11) NOT NULL,
  `image_created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `image_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `hicrm_images`
--

INSERT INTO `hicrm_images` (`id`, `image_name`, `image_url`, `image_category`, `image_user_created`, `image_created_date`, `image_status`) VALUES
(1, 'Hình ảnh giới thiệu', 'd2173854c8803807b1835ae91a68629b-Hnhnh1.png', 0, 24, '2025-12-28 12:14:30', 1),
(2, 'Hình ảnh của đơn vị', '358c270047cc7088cc8d0d71aa50e4dc-banner.jpg', 0, 24, '2025-12-28 13:29:48', 1),
(3, 'Cơ cấu tổ chức', '266e4bda8ef073881f1ea868529df577-SDTCR1.png', 0, 24, '2026-01-17 11:30:15', 1),
(4, 'sự kiện 1', 'd1054600d3d5525aed0cc240b0eb758e-ChatGPTImageFeb8202601_26_30PM.png', 0, 24, '2026-02-09 08:04:35', 1),
(5, 'BHYT', '5967db3f7fcede80bb973c5fc3ef348a-40337fa7d5b75be902a6.jpg', 0, 24, '2026-02-09 09:03:21', 1),
(6, 'Thong bao', 'b6e465078b2a956411ca8ffdc2047165-23.02.jpg', 0, 24, '2026-02-09 09:40:16', 1),
(7, 'Slider phòng khám', 'acec4f944ef8e514ef57351789977ee3-SLIDERWEB.png', 0, 24, '2026-02-11 11:41:51', 1),
(8, 'Hình ảnh giới thiệu 1', '65783aa2647ea0823e1c4e498ab0896f-slider1920-600-.png', 0, 24, '2026-02-11 11:56:23', 1),
(9, 'gioi thieu', '41e6e836b05d372273c7579bea43f5dd-86e551eaddcc53920add.jpg', 0, 24, '2026-02-12 13:34:03', 1),
(10, 'gioi thieu 2', 'd78868c569dd3f3e07e488edfb35f38a-Gemini_Generated_Image_x5tyd0x5tyd0x5ty.png', 0, 24, '2026-02-12 13:52:52', 99),
(11, 'gioi thieu 2', '5596d3b1f7dfc578b7beb2555beed28f-Gemini_Generated_Image_x5tyd0x5tyd0x5ty.png', 0, 24, '2026-02-12 13:52:53', 99),
(12, 'gioi thieu 2', '5596d3b1f7dfc578b7beb2555beed28f-Gemini_Generated_Image_x5tyd0x5tyd0x5ty.png', 0, 24, '2026-02-12 13:52:53', 99),
(13, 'gioi thieu 2', '393c9c1c67cbba5b9b2d5e227b76f110-Gemini_Generated_Image_h7x150h7x150h7x1.png', 0, 24, '2026-02-12 13:54:39', 1),
(14, 'Hình ảnh chào xuân năm mới', 'ceeb121c7534d310750122668c671d5a-621849350_122142024387115938_3368117025345007350_n.png', 0, 24, '2026-02-12 14:20:44', 1),
(15, 'CSYT ban đầu', 'df4f0d9068cf3e14d568761bc243116d-ChatGPTImageFeb12202604_38_30PM.png', 0, 24, '2026-02-12 16:39:26', 1),
(16, 'Kham SK dinh ky', 'dc7f9fb3b5234acce095ce7d98195f62-ChatGPTImageFeb12202604_49_54PM.png', 0, 24, '2026-02-12 16:51:48', 1),
(17, '2', 'b2c97b52d22e1f0b3771ed1aa668109a-ChatGPTImageFeb12202604_49_54PM.png', 0, 24, '2026-02-12 16:52:32', 1),
(18, 'Khung 1', 'ce363cec165502b42dcc6f2f7d0e1bf2-1.png', 0, 24, '2026-02-22 10:20:26', 1),
(19, 'Khung 2', 'ced581b3ab6a63e9776af11a72740128-2.png', 0, 24, '2026-02-22 10:20:38', 1),
(20, 'Khung 3', 'cd3c1e398c352dce4b0b64debe65d35d-3.png', 0, 24, '2026-02-22 10:20:49', 1),
(21, 'Hình ảnh banner Mobile', '2f0b7216bf0e505c6a52bd0d6e52fb79-banner_mb.png', 0, 24, '2026-02-25 17:22:17', 1),
(22, 'banner1', '', 0, 24, '2026-02-27 09:06:58', 99),
(23, 'banner2', '67144a887e387337852ee3b44e7118a9-adb3e1d7a71c2942700d1.jpg', 0, 24, '2026-02-27 09:07:44', 1),
(24, 'banner3', '603229ba5ddf552bfd8eda063b6ccd96-adb3e1d7a71c2942700d1.jpg', 0, 24, '2026-02-27 09:08:01', 1),
(25, 'banner4', '09df68cdf9283a01573d71cf95192795-ChatGPTImageFeb27202609_05_13AM.png', 3, 24, '2026-02-27 09:08:26', 1),
(26, 'banner5', '5a4ea2adbd1759c5c07b0fc03ec97ca4-ChatGPTImageFeb27202609_05_36AM.png', 0, 24, '2026-02-27 09:08:41', 1),
(27, 'banner6', '5cc49a76443b87ba5459a9c334a60d19-de2a458d3e46b018e9571.jpg', 0, 24, '2026-02-27 09:09:00', 1),
(28, 'Banner desktop nhà thầy thuốc', '5fdd9ee3e21b1f7d03d4ada266794a37-banner_thaythuoc_desktop.png', 3, 24, '2026-02-27 09:50:09', 1),
(29, 'Bác sĩ giàu kinh nghiệm phòng khám đa khoa và nhà thuốc cao đẳng kon tum', '874fcf68dcbdc78675ba1469b6a3b7de-photo_2026-02-28_14-57-04.jpg', 4, 24, '2026-02-28 14:58:07', 1),
(30, 'banner trang chủ desktop', '021da860fb2310cc36e06c262f5a6c8a-e72653c2a820267e7f31.jpg', 0, 24, '2026-03-04 14:27:11', 1),
(31, 'banner trang chủ 8-3 mobile', 'bb3452b8dfb5ab9f81b1a56945b55f1d-d0c83632a0d02e8e77c1.jpg', 3, 24, '2026-03-04 14:53:12', 1),
(32, 'Banner Trang chủ 8-3 Deskop - 1', '541eb0d23300dd624c3ae014f33422e7-banner_8.3.png', 3, 24, '2026-03-04 21:14:07', 1),
(33, 'Banner Trang chủ 8-3 mobile- 1', '47929e4b6e84075450d68531462c2c85-banner_8.3_mb.png', 0, 24, '2026-03-04 21:14:24', 1),
(34, 'Chỉ số BMI', 'f0050efbf25d8e63d2c5be66418a17f1-Screenshot_1.png', 0, 24, '2026-03-07 13:30:03', 1),
(35, 'quy doi diem thuong', '7345b9b6e0a2f866a40059efbafc7999-Screenshot2026-03-09100340.png', 0, 24, '2026-03-09 10:08:12', 1),
(36, 'Hieu lam KCB BHYT', '58e5ed254820b4412e4bc3a1183b0140-HiulmKCBBHYT.jpg', 0, 24, '2026-03-09 19:21:13', 1),
(37, 'chuyen mua', 'e6294e656e75572f011a58880617022f-camcum2.jpg', 0, 24, '2026-03-16 20:28:59', 1),
(38, 'chuyen mua 1', '58f2b8cf8f47b02967950db166f711b6-camcum1.jpg', 0, 24, '2026-03-16 20:29:23', 1),
(39, 'Quốc tế hạnh phúc', 'd0edcce1b6fdc5cf2f83c8a3b976b76b-Gemini_Generated_Image_7nrimo7nrimo7nri.png', 0, 24, '2026-03-20 08:30:49', 1),
(40, 'viemnaomocau1', '410207b5de359a6c3edadf1500be5ef8-bieuhien1.webp', 0, 24, '2026-03-20 09:13:59', 1),
(41, 'viemnaomocau2', '2220e830c8741b1493b5c485186ae9b3-bieuhien2.jpg', 0, 24, '2026-03-20 09:14:16', 1),
(42, 'viemnaomocau3', '195016a4612f890ed6e73ac9b28cef8c-ratay1.jpg', 0, 24, '2026-03-20 09:14:38', 1),
(43, 'viemnaomocau4', 'c9be61dfffb74fb788f3a9b479ee1fc5-thamkham1.avif', 0, 24, '2026-03-20 09:14:59', 1),
(44, 'viemnaomocau5', '6e3cf1a3790fa234cc19a9834134c4dd-tiemvacxin1.jpg', 0, 24, '2026-03-20 09:15:18', 1),
(45, 'viemnaomocau6', '344ab79e51144d4a1eb7ca1b770bf1bd-tiemvacxin2.jpg', 0, 24, '2026-03-20 09:15:49', 1),
(46, 'viemnaomocau7', 'ccefc64add1d643d512781ecc789143e-vikhun1.jpg', 0, 24, '2026-03-20 09:16:11', 1),
(47, 'viemnaomocau8', '5d4aac80c823dc1d5d9288a2acfef670-vikhun2.jpg', 0, 24, '2026-03-20 09:16:39', 1),
(48, 'viemnaomocau9', '9a8746131de835ce0b16180875a024d4-vikhun3.jpg', 0, 24, '2026-03-20 09:16:59', 1),
(49, 'Ngaylamviec1', '2ff812833c68389209d7487e57e8759d-168354482137514171-Copy.jpg', 0, 24, '2026-03-24 16:31:08', 1),
(50, 'Ngaylamviec2', '9f873a73f648fe49e2dc172ec751c2da-745954385089608562-Copy.jpg', 0, 24, '2026-03-24 16:31:42', 1),
(51, 'Ngaylamviec3', 'cb8174a08b489c535869011d78663518-32891196118430842881.jpg', 0, 24, '2026-03-24 16:32:05', 1),
(52, 'Ngaylamviec4', '10b4f5ce0eb38da6c9db98c7669a07e2-32891196118430842882.jpg', 0, 24, '2026-03-24 16:32:28', 1),
(53, 'Ngaylamviec5', '32faa31a74d42eeb6129e93c106e2014-3289119611843084288.jpg', 0, 24, '2026-03-24 16:32:49', 1),
(54, 'Ngaylamviec6', '2b74a25f2524da4e1e9903513e6d7a51-44627983600582019271.jpg', 0, 24, '2026-03-24 16:33:13', 1),
(55, 'Ngaylamviec7', '3aae102ca96019d3475078ee87ac99bb-4462798360058201927.jpg', 0, 24, '2026-03-24 16:33:34', 1),
(56, 'slider1', 'f219fbe785133adf1eab548816cfd40e-Gemini_Generated_Image_ef2z1lef2z1lef2z.png', 3, 24, '2026-03-26 15:29:01', 1),
(57, 'bienthevesau1', '47160df24ea1eeb0531e6ddd52614080-Gemini_Generated_Image_hbv86nhbv86nhbv8.png', 0, 24, '2026-04-01 14:15:50', 99),
(58, 'bienthevesau2', '64b8b862920c451476a096040ca17a76-bien-the.webp', 0, 24, '2026-04-01 14:20:38', 99),
(59, 'bienthevesau3', '0ac925f6cda96e72fc13114dd2ddf10a-covid-hom-nay.jpeg', 0, 24, '2026-04-01 14:53:13', 99),
(60, '23123', '219263854e5f2bb24a2f7b53e09b7f05-single-fresh-red-strawberry-on-table-green-background-food-fruit-sweet-macro-juicy-plant-image-photo.jpg', 0, 1, '2026-06-14 12:41:03', 99),
(61, 'Hình ảnh1', 'c5cba6735f2dd405157341e637210ca6-image-removebg-preview.png', 0, 1, '2026-06-14 12:41:48', 1),
(62, 'Tuyển dụng 1', '3fe5d7139f5ef730515d6f61d4fed60f-tuyndng-2024-03-25-02-53-09.png', 0, 1, '2026-06-29 14:00:43', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hicrm_introduce`
--

CREATE TABLE `hicrm_introduce` (
  `id` int(11) NOT NULL,
  `introduce_category` int(11) NOT NULL,
  `introduce_name` varchar(255) NOT NULL,
  `introduce_content` longtext NOT NULL,
  `introduce_uid` int(11) NOT NULL,
  `introduce_orderby` int(11) NOT NULL,
  `introduce_created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `hicrm_introduce`
--

INSERT INTO `hicrm_introduce` (`id`, `introduce_category`, `introduce_name`, `introduce_content`, `introduce_uid`, `introduce_orderby`, `introduce_created_date`) VALUES
(1, 2, 'Về chúng tôi', '<figure class=\"image\"><img style=\"aspect-ratio:1472/704;\" src=\"https://phongkhamcdkontum.com.vn/uploads/images/393c9c1c67cbba5b9b2d5e227b76f110-Gemini_Generated_Image_h7x150h7x150h7x1.png\" width=\"1472\" height=\"704\"></figure><p style=\"margin-left:40px;text-align:center;\"><span style=\"font-family:\'Times New Roman\', Times, serif;font-size:14px;\"><strong>PHÒNG KHÁM ĐA KHOA VÀ NHÀ THUỐC TRƯỜNG CAO ĐẲNG KON TUM&nbsp;</strong></span></p><p style=\"margin-left:40px;text-align:center;\"><span style=\"font-family:\'Times New Roman\', Times, serif;font-size:14px;\"><i><u>Uy tín từ chuyên môn - An tâm từ dịch vụ</u></i></span></p><p style=\"margin-left:40px;text-align:center;\"><span style=\"font-family:\'Times New Roman\', Times, serif;font-size:14px;\"><strong>Nơi chăm sóc sức khỏe bắt đầu từ sự thấu hiểu</strong></span></p><p style=\"margin-left:40px;\"><span style=\"font-family:\'Times New Roman\', Times, serif;font-size:14px;\">Mỗi hành trình chăm sóc sức khỏe đều bắt đầu từ một nhu cầu rất đơn giản: Được lắng nghe, được thấu hiểu và được điều trị đúng cách. Xuất phát từ định hướng đó, Phòng khám Đa khoa và Nhà thuốc Trường Cao đẳng Kon Tum ra đời với mong muốn mang đến cho người dân một địa chỉ y tế đáng tin cậy – nơi chất lượng chuyên môn song hành cùng sự tận tâm trong phục vụ.</span></p><p style=\"margin-left:40px;\"><span style=\"font-family:\'Times New Roman\', Times, serif;font-size:14px;\">Là đơn vị trực thuộc Khoa Y – Dược, Trường Cao đẳng Kon Tum, Phòng khám và Nhà thuốc được xây dựng trên nền tảng kết hợp giữa hoạt động khám chữa bệnh thực tế và môi trường đào tạo chuyên ngành y – dược. Điều này tạo nên một mô hình đặc thù: Vừa đảm bảo tính chuyên nghiệp trong cung cấp dịch vụ y tế, vừa thúc đẩy tinh thần học hỏi, đổi mới và nâng cao năng lực chuyên môn liên tục.</span></p><p style=\"margin-left:40px;text-align:center;\"><span style=\"font-family:\'Times New Roman\', Times, serif;font-size:14px;\"><strong>Đồng hành cùng sức khỏe cộng đồng</strong></span></p><p style=\"margin-left:40px;\"><span style=\"font-family:\'Times New Roman\', Times, serif;font-size:14px;\">Phòng khám Đa khoa cung cấp các dịch vụ khám chữa bệnh đa chuyên khoa, bao gồm nội khoa, ngoại khoa, sản khoa, cận lâm sàng và tư vấn chăm sóc sức khỏe ban đầu. Quy trình khám chữa bệnh được thiết kế theo hướng thuận tiện, giảm thời gian chờ đợi, giúp người bệnh tiếp cận dịch vụ nhanh chóng và hiệu quả.</span></p><p style=\"margin-left:40px;\"><span style=\"font-family:\'Times New Roman\', Times, serif;font-size:14px;\">Song song đó, Nhà thuốc đảm nhiệm vai trò cung ứng thuốc và tư vấn sử dụng thuốc an toàn, hợp lý, góp phần hoàn thiện chuỗi chăm sóc sức khỏe toàn diện từ khám bệnh đến điều trị.</span></p><p style=\"margin-left:40px;text-align:center;\"><span style=\"font-family:\'Times New Roman\', Times, serif;font-size:14px;\"><strong>Lấy người bệnh làm trung tâm</strong></span></p><p style=\"margin-left:40px;\"><span style=\"font-family:\'Times New Roman\', Times, serif;font-size:14px;\">Chúng tôi tin rằng chăm sóc sức khỏe không chỉ là điều trị bệnh mà còn là xây dựng sự tin tưởng lâu dài. Vì vậy, mỗi hoạt động tại Phòng khám và Nhà thuốc đều hướng đến trải nghiệm của người bệnh: Rõ ràng trong thông tin, minh bạch trong chi phí, tận tâm trong phục vụ và chuẩn mực trong chuyên môn.</span></p><p style=\"margin-left:40px;text-align:center;\"><span style=\"font-family:\'Times New Roman\', Times, serif;font-size:14px;\"><strong>Hướng tới mô hình y tế hiện đại</strong></span></p><p style=\"margin-left:40px;\"><span style=\"font-family:\'Times New Roman\', Times, serif;font-size:14px;\">Trong bối cảnh ngành y tế ngày càng phát triển theo hướng chăm sóc sức khỏe ban đầu và quản lý sức khỏe bền vững, Phòng khám Đa khoa và Nhà thuốc Trường Cao đẳng Kon Tum định hướng trở thành điểm đến y tế thân thiện, hiệu quả và gần gũi với cộng đồng. Chúng tôi không ngừng cải tiến chất lượng dịch vụ, ứng dụng công nghệ và nâng cao năng lực đội ngũ để đáp ứng tốt hơn nhu cầu chăm sóc sức khỏe của người dân.</span></p><p style=\"margin-left:40px;\"><span style=\"font-family:\'Times New Roman\', Times, serif;font-size:14px;\">Phòng khám Đa khoa và Nhà thuốc Trường Cao đẳng Kon Tum – nơi chuyên môn tạo nên niềm tin, và sự tận tâm tạo nên khác biệt.</span></p><p><br>&nbsp;</p>', 24, 0, '2026-03-05 10:22:00'),
(2, 4, 'Cơ sở hạ tầng', '<p>Cơ sở hạ tầng vô cùng hiện đại, đầy đủ</p>', 24, 0, '2025-12-28 21:53:46'),
(3, 3, 'Cơ cấu tổ chức', '<p style=\"text-align:justify;\"><span style=\"color:#0000ff;font-size:18px;\"><strong>Phòng khám Đa khoa gồm:</strong></span></p><p style=\"text-align:justify;\"><span style=\"color:#0000ff;font-size:18px;\">- Trưởng Phòng khám</span></p><p style=\"text-align:justify;\"><span style=\"color:#0000ff;font-size:18px;\">- Các Phó Trưởng phòng khám</span></p><p style=\"text-align:justify;\"><span style=\"color:#0000ff;font-size:18px;\">- Các bộ phận chuyên môn như: Nội khoa, Ngoại khoa, Sản khoa, Cận lâm sàng và bộ phận tiếp đón.</span></p><p style=\"text-align:justify;\"><span style=\"color:#0000ff;font-size:18px;\"><strong>Nhà thuốc gồm:</strong></span></p><p style=\"text-align:justify;\"><span style=\"color:#0000ff;font-size:18px;\">- Trưởng Nhà thuốc</span></p><p style=\"text-align:justify;\"><span style=\"color:#0000ff;font-size:18px;\">- Đội ngũ dược sĩ chuyên môn.</span></p><p style=\"text-align:justify;\"><span style=\"color:#0000ff;font-size:18px;\"><i><strong>Hai đơn vị hoạt động thống nhất trong hệ thống tổ chức của Khoa Y – Dược, bảo đảm sự phối hợp chặt chẽ giữa khám bệnh, chẩn đoán, tư vấn điều trị và cung ứng thuốc an toàn, hợp lý.</strong></i></span></p>', 24, 0, '2026-03-03 16:41:01'),
(4, 5, 'Tại sao chọn chúng tôi ?', '<p class=\"isSelectedEnd\" style=\"text-align: justify; \"><span style=\"font-family: \" times=\"\" new=\"\" roman\";\"=\"\"><font color=\"#0000ff\">Chăm sóc sức khỏe không chỉ là điều trị khi bệnh mà còn là lựa chọn đúng nơi để được tư vấn, theo dõi và đồng hành lâu dài. Phòng khám Đa khoa và Nhà thuốc Trường Cao đẳng Kon Tum mang đến giải pháp chăm sóc sức khỏe toàn diện – nhanh chóng, thuận tiện và tối ưu chi phí cho người dân.</font></span></p><h3 style=\"text-align: justify;\"><span style=\"font-family: \" times=\"\" new=\"\" roman\";\"=\"\"><font color=\"#0000ff\">✔ Khám chữa bệnh bảo hiểm y tế thuận lợi – tối đa quyền lợi</font></span></h3><p class=\"isSelectedEnd\" style=\"text-align: justify; \"><span style=\"font-family: \" times=\"\" new=\"\" roman\";\"=\"\"><font color=\"#0000ff\">Bạn có thể khám trực tiếp tại cơ sở khám chữa bệnh ban đầu để được hưởng đầy đủ quyền lợi bảo hiểm y tế theo quy định. Quy trình tiếp đón và hướng dẫn rõ ràng giúp người bệnh tiết kiệm thời gian, hạn chế thủ tục phức tạp và an tâm khi sử dụng dịch vụ.</font></span></p><h3 style=\"text-align: justify;\"><span style=\"font-family: \" times=\"\" new=\"\" roman\";\"=\"\"><font color=\"#0000ff\">✔ Khám nhanh – không phải chờ đợi lâu</font></span></h3><p class=\"isSelectedEnd\" style=\"text-align: justify; \"><span style=\"font-family: \" times=\"\" new=\"\" roman\";\"=\"\"><font color=\"#0000ff\">Không cần di chuyển xa hoặc chen chúc tại bệnh viện đông người. Quy trình khám được tối ưu hóa giúp người bệnh được tiếp nhận nhanh chóng, khám đúng chuyên khoa và nhận kết quả trong thời gian hợp lý.</font></span></p><h3 style=\"text-align: justify;\"><span style=\"font-family: \" times=\"\" new=\"\" roman\";\"=\"\"><font color=\"#0000ff\">✔ Bác sĩ tận tâm – tư vấn rõ ràng, dễ hiểu</font></span></h3><p class=\"isSelectedEnd\" style=\"text-align: justify;\"><span style=\"font-family: \" times=\"\" new=\"\" roman\";\"=\"\"><font color=\"#0000ff\">Đội ngũ bác sĩ và nhân viên y tế luôn lắng nghe, giải thích cặn kẽ tình trạng sức khỏe và phương án điều trị. Người bệnh được tư vấn đầy đủ để chủ động chăm sóc sức khỏe ngay từ giai đoạn sớm.</font></span></p><h3 style=\"text-align: justify;\"><span style=\"font-family: \" times=\"\" new=\"\" roman\";\"=\"\"><font color=\"#0000ff\">✔ Mô hình tích hợp khám – xét nghiệm – cấp thuốc tiện lợi</font></span></h3><p class=\"isSelectedEnd\" style=\"text-align: justify;\"><span style=\"font-family: \" times=\"\" new=\"\" roman\";\"=\"\"><font color=\"#0000ff\">Phòng khám và Nhà thuốc hoạt động đồng bộ giúp người bệnh hoàn thành quy trình khám chữa bệnh nhanh chóng trong cùng một địa điểm, giảm thời gian di chuyển và bảo đảm tính liên tục trong điều trị.</font></span></p><h3 style=\"text-align: justify;\"><span style=\"font-family: \" times=\"\" new=\"\" roman\";\"=\"\"><font color=\"#0000ff\">✔ Chi phí hợp lý – minh bạch</font></span></h3><p class=\"isSelectedEnd\" style=\"text-align: justify;\"><span style=\"font-family: \" times=\"\" new=\"\" roman\";\"=\"\"><font color=\"#0000ff\">Các dịch vụ được thực hiện theo quy định hiện hành, chi phí rõ ràng, phù hợp với nhiều đối tượng. Đặc biệt, người tham gia bảo hiểm y tế được hỗ trợ tối đa theo mức hưởng quy định.</font></span></p><h3 style=\"text-align: justify;\"><span style=\"font-family: \" times=\"\" new=\"\" roman\";\"=\"\"><font color=\"#0000ff\">✔ Đồng hành chăm sóc sức khỏe lâu dài</font></span></h3><p class=\"isSelectedEnd\" style=\"text-align: justify;\"><span style=\"font-family: \" times=\"\" new=\"\" roman\";\"=\"\"><font color=\"#0000ff\">Chúng tôi không chỉ khám và điều trị, mà còn theo dõi hồ sơ sức khỏe, tư vấn phòng bệnh và hỗ trợ người bệnh duy trì lối sống khỏe mạnh.</font></span></p><p class=\"isSelectedEnd\"></p>', 24, 0, '2026-02-12 14:35:41'),
(5, 8, 'Giới thiệu nhà thuốc', '<h2 style=\"text-align:justify;\"><span style=\"color:hsl(0, 75%, 60%);font-family:\'Times New Roman\', Times, serif;\">NHÀ THUỐC TRƯỜNG CAO ĐẲNG KON TUM</span></h2><p style=\"text-align:justify;\"><span style=\"color:hsl(240,75%,60%);font-family:\'Times New Roman\', Times, serif;font-size:18px;\"><strong>Đạt chuẩn GPP – Chuyên nghiệp – Tận tâm vì sức khỏe cộng đồng</strong></span></p><p style=\"text-align:justify;\"><span style=\"color:hsl(240,75%,60%);font-family:\'Times New Roman\', Times, serif;font-size:18px;\">Nhà thuốc Trường Cao đẳng Kon Tum được thành lập với mục tiêu cung ứng thuốc và các sản phẩm chăm sóc sức khỏe bảo đảm chất lượng, an toàn và đúng quy định chuyên môn. Là đơn vị trực thuộc Trường Cao đẳng Kon Tum, nhà thuốc hoạt động theo định hướng gắn kết giữa đào tạo và thực tiễn, góp phần phục vụ hiệu quả công tác chăm sóc sức khỏe cho cán bộ, giảng viên, học sinh – sinh viên và nhân dân trên địa bàn.</span></p><h2 style=\"text-align:justify;\"><span style=\"color:hsl(0, 75%, 60%);font-family:\'Times New Roman\', Times, serif;\">ĐẠT CHUẨN GPP THEO QUY ĐỊNH CỦA BỘ Y TẾ</span></h2><p style=\"text-align:justify;\"><span style=\"color:hsl(240,75%,60%);font-family:\'Times New Roman\', Times, serif;font-size:18px;\">Nhà thuốc được công nhận đạt tiêu chuẩn <strong>GPP (Good Pharmacy Practice – Thực hành tốt nhà thuốc)</strong>, đáp ứng đầy đủ các yêu cầu về:</span></p><p style=\"text-align:justify;\"><span style=\"color:hsl(240,75%,60%);font-family:\'Times New Roman\', Times, serif;font-size:18px;\">Cơ sở vật chất và trang thiết bị bảo quản thuốc đạt chuẩn</span></p><p style=\"text-align:justify;\"><span style=\"color:hsl(240,75%,60%);font-family:\'Times New Roman\', Times, serif;font-size:18px;\">Quy trình nhập – xuất – lưu trữ thuốc chặt chẽ</span></p><p style=\"text-align:justify;\"><span style=\"color:hsl(240,75%,60%);font-family:\'Times New Roman\', Times, serif;font-size:18px;\">Kiểm soát nguồn gốc, hạn sử dụng và điều kiện bảo quản</span></p><p style=\"text-align:justify;\"><span style=\"color:hsl(240,75%,60%);font-family:\'Times New Roman\', Times, serif;font-size:18px;\">Dược sĩ có chứng chỉ hành nghề theo quy định</span></p><p style=\"text-align:justify;\"><span style=\"color:hsl(240,75%,60%);font-family:\'Times New Roman\', Times, serif;font-size:18px;\">Tư vấn sử dụng thuốc đúng chuyên môn, an toàn và hợp lý</span></p><p style=\"text-align:justify;\"><span style=\"color:hsl(240,75%,60%);font-family:\'Times New Roman\', Times, serif;font-size:18px;\">Việc tuân thủ nghiêm túc tiêu chuẩn GPP là cam kết về chất lượng và trách nhiệm của nhà thuốc đối với người sử dụng.</span></p><h2 style=\"text-align:justify;\"><span style=\"color:hsl(0, 75%, 60%);font-family:\'Times New Roman\', Times, serif;\">DANH MỤC SẢN PHẨM ĐA DẠNG – NGUỒN GỐC RÕ RÀNG</span></h2><p style=\"text-align:justify;\"><span style=\"color:hsl(240,75%,60%);font-family:\'Times New Roman\', Times, serif;font-size:18px;\">Nhà thuốc cung cấp đầy đủ các nhóm sản phẩm phục vụ nhu cầu chăm sóc sức khỏe:</span></p><p style=\"text-align:justify;\"><span style=\"color:hsl(240,75%,60%);font-family:\'Times New Roman\', Times, serif;font-size:18px;\">- Thuốc kê đơn và không kê đơn</span></p><p style=\"text-align:justify;\"><span style=\"color:hsl(240,75%,60%);font-family:\'Times New Roman\', Times, serif;font-size:18px;\">- Thực phẩm chức năng</span></p><p style=\"text-align:justify;\"><span style=\"color:hsl(240,75%,60%);font-family:\'Times New Roman\', Times, serif;font-size:18px;\">- Dược mỹ phẩm</span></p><p style=\"text-align:justify;\"><span style=\"color:hsl(240,75%,60%);font-family:\'Times New Roman\', Times, serif;font-size:18px;\">- Thiết bị y tế gia đình</span></p><p style=\"text-align:justify;\"><span style=\"color:hsl(240,75%,60%);font-family:\'Times New Roman\', Times, serif;font-size:18px;\">- Vật tư y tế</span></p><p style=\"text-align:justify;\"><span style=\"color:hsl(240,75%,60%);font-family:\'Times New Roman\', Times, serif;font-size:18px;\">Tất cả sản phẩm đều được nhập từ các đơn vị phân phối hợp pháp, có hóa đơn chứng từ đầy đủ và được bảo quản theo đúng quy định của Bộ Y tế.</span></p><h2 style=\"text-align:justify;\"><span style=\"color:hsl(0, 75%, 60%);font-family:\'Times New Roman\', Times, serif;\">ĐỘI NGŨ DƯỢC SĨ CHUYÊN MÔN VỮNG VÀNG</span></h2><p style=\"text-align:justify;\"><span style=\"color:hsl(240,75%,60%);font-family:\'Times New Roman\', Times, serif;font-size:18px;\">Đội ngũ dược sĩ của nhà thuốc được đào tạo bài bản, có kinh nghiệm thực tiễn và luôn đề cao y đức trong hành nghề.</span></p><p style=\"text-align:justify;\"><span style=\"color:hsl(240,75%,60%);font-family:\'Times New Roman\', Times, serif;font-size:18px;\">Nhà thuốc chú trọng:</span></p><p style=\"text-align:justify;\"><span style=\"color:hsl(240,75%,60%);font-family:\'Times New Roman\', Times, serif;font-size:18px;\">Tư vấn sử dụng thuốc an toàn, đúng liều lượng</span></p><p style=\"text-align:justify;\"><span style=\"color:hsl(240,75%,60%);font-family:\'Times New Roman\', Times, serif;font-size:18px;\">Hướng dẫn cách dùng thuốc phù hợp với từng đối tượng</span></p><p style=\"text-align:justify;\"><span style=\"color:hsl(240,75%,60%);font-family:\'Times New Roman\', Times, serif;font-size:18px;\">Cảnh báo tương tác thuốc khi cần thiết</span></p><p style=\"text-align:justify;\"><span style=\"color:hsl(240,75%,60%);font-family:\'Times New Roman\', Times, serif;font-size:18px;\">Hỗ trợ giải đáp thông tin liên quan đến chăm sóc sức khỏe</span></p><p style=\"text-align:justify;\"><span style=\"color:hsl(240,75%,60%);font-family:\'Times New Roman\', Times, serif;font-size:18px;\">Chúng tôi không chỉ cung cấp thuốc, mà còn đồng hành cùng người dân trong việc sử dụng thuốc hợp lý và hiệu quả.</span></p><h2 style=\"text-align:justify;\"><span style=\"color:hsl(0, 75%, 60%);font-family:\'Times New Roman\', Times, serif;\">CAM KẾT CỦA NHÀ THUỐC</span></h2><p style=\"text-align:justify;\"><span style=\"color:hsl(240,75%,60%);font-family:\'Times New Roman\', Times, serif;font-size:18px;\">Hoạt động theo tiêu chuẩn GPP</span></p><p style=\"text-align:justify;\"><span style=\"color:hsl(240,75%,60%);font-family:\'Times New Roman\', Times, serif;font-size:18px;\">Thuốc chính hãng, nguồn gốc rõ ràng</span></p><p style=\"text-align:justify;\"><span style=\"color:hsl(240,75%,60%);font-family:\'Times New Roman\', Times, serif;font-size:18px;\">Giá cả hợp lý, công khai minh bạch</span></p><p style=\"text-align:justify;\"><span style=\"color:hsl(240,75%,60%);font-family:\'Times New Roman\', Times, serif;font-size:18px;\">Bảo mật thông tin khách hàng</span></p><p style=\"text-align:justify;\"><span style=\"color:hsl(240,75%,60%);font-family:\'Times New Roman\', Times, serif;font-size:18px;\">Phục vụ chuyên nghiệp, tận tâm</span></p><p>&nbsp;</p>', 24, 0, '2026-03-03 16:38:39'),
(6, 9, 'Chính sách giá bán', '<p style=\"text-align:justify;\"><span style=\"font-family:\'Times New Roman\', Times, serif;font-size:18px;\"><strong>NGUYÊN TẮC BÁN HÀNG</strong></span></p><ul style=\"list-style-type:disc;\"><li style=\"text-align:justify;\"><span style=\"font-family:\'Times New Roman\', Times, serif;font-size:18px;\">Chỉ kinh doanh và bán các loại thuốc, vật tư y tế và sản phẩm chăm sóc sức khỏe được phép lưu hành theo quy định của pháp luật.</span></li><li style=\"text-align:justify;\"><span style=\"font-family:\'Times New Roman\', Times, serif;font-size:18px;\">Thuốc kê đơn được bán đúng theo đơn của bác sĩ hoặc người có thẩm quyền kê đơn.</span></li><li style=\"text-align:justify;\"><span style=\"font-family:\'Times New Roman\', Times, serif;font-size:18px;\">Thực hiện đầy đủ các quy định về quản lý, bảo quản, lưu trữ và truy xuất nguồn gốc thuốc theo quy định của Bộ Y tế.</span></li><li style=\"text-align:justify;\"><span style=\"font-family:\'Times New Roman\', Times, serif;font-size:18px;\">Tất cả thuốc và sản phẩm tại Nhà thuốc đều được niêm yết giá công khai, rõ ràng.</span></li><li style=\"text-align:justify;\"><span style=\"font-family:\'Times New Roman\', Times, serif;font-size:18px;\">Giá bán được xây dựng hợp lý, phù hợp với mặt bằng thị trường và bảo đảm quyền lợi của người tiêu dùng.</span></li></ul><ul><li style=\"text-align:justify;\"><span style=\"font-family:\'Times New Roman\', Times, serif;font-size:18px;\">Bán đúng thuốc theo đơn hoặc theo nhu cầu sử dụng hợp lý của khách hàng.</span></li><li style=\"text-align:justify;\"><span style=\"font-family:\'Times New Roman\', Times, serif;font-size:18px;\">Không kinh doanh và bán các loại thuốc giả, thuốc kém chất lượng, thuốc không rõ nguồn gốc.</span></li><li style=\"text-align:justify;\"><span style=\"font-family:\'Times New Roman\', Times, serif;font-size:18px;\">Không bán thuốc quá hạn sử dụng hoặc không bảo đảm điều kiện bảo quản.</span></li></ul><p style=\"text-align:justify;\"><span style=\"font-family:\'Times New Roman\', Times, serif;font-size:18px;\"><strong>CHÍNH SÁCH ƯU ĐÃI</strong></span></p><ul><li style=\"text-align:justify;\"><span style=\"font-family:\'Times New Roman\', Times, serif;font-size:18px;\">Viên chức, người lao động và học sinh, sinh viên Trường Cao đẳng Kon Tum&nbsp;</span></li><li style=\"text-align:justify;\"><span style=\"font-family:\'Times New Roman\', Times, serif;font-size:18px;\">Khách hàng thân thiết</span></li><li style=\"text-align:justify;\"><span style=\"font-family:\'Times New Roman\', Times, serif;font-size:18px;\"><i>Các hình thức ưu đãi có thể bao gồm:</i> <i>Giảm giá trực tiếp trên sản phẩm; Tích điểm khách hàng.</i></span></li></ul><p style=\"text-align:justify;\"><span style=\"font-family:\'Times New Roman\', Times, serif;font-size:18px;\"><strong>CHÍNH SÁCH CHĂM SÓC KHÁCH HÀNG</strong></span></p><ul><li style=\"text-align:justify;\"><span style=\"font-family:\'Times New Roman\', Times, serif;font-size:18px;\">Nhà thuốc thực hiện tư vấn miễn phí cho khách hàng về: Hướng dẫn sử dụng thuốc đúng cách; Tư vấn phòng bệnh và chăm sóc sức khỏe; Hướng dẫn theo dõi các dấu hiệu bất thường hoặc tác dụng phụ khi sử dụng thuốc.</span></li><li style=\"text-align:justify;\"><span style=\"font-family:\'Times New Roman\', Times, serif;font-size:18px;\">Kiểm tra và đối chiếu đơn thuốc khi khách hàng có nhu cầu.</span></li><li style=\"text-align:justify;\"><span style=\"font-family:\'Times New Roman\', Times, serif;font-size:18px;\">Hướng dẫn khách hàng cách bảo quản thuốc đúng quy định tại gia đình.</span></li><li style=\"text-align:justify;\"><span style=\"font-family:\'Times New Roman\', Times, serif;font-size:18px;\">Hỗ trợ nhắc lịch sử dụng thuốc đối với các trường hợp điều trị dài ngày.</span></li></ul><p style=\"text-align:justify;\"><span style=\"font-family:\'Times New Roman\', Times, serif;font-size:18px;\"><strong>CHÍNH SÁCH ĐỔI TRẢ</strong></span></p><p style=\"text-align:justify;\"><span style=\"font-family:\'Times New Roman\', Times, serif;font-size:18px;\">Nhà thuốc thực hiện đổi trả sản phẩm trong các trường hợp sau:</span></p><ul><li style=\"text-align:justify;\"><span style=\"font-family:\'Times New Roman\', Times, serif;font-size:18px;\"><i><strong>Trường hợp được đổi:</strong></i></span></li><li style=\"text-align:justify;\"><span style=\"font-family:\'Times New Roman\', Times, serif;font-size:18px;\">Thuốc hoặc sản phẩm bị lỗi do nhà sản xuất.</span></li><li style=\"text-align:justify;\"><span style=\"font-family:\'Times New Roman\', Times, serif;font-size:18px;\">Giao nhầm thuốc hoặc sản phẩm so với yêu cầu của khách hàng.</span></li><li style=\"text-align:justify;\"><span style=\"font-family:\'Times New Roman\', Times, serif;font-size:18px;\">Sản phẩm bị hư hỏng, rách bao bì hoặc biến dạng khi chưa sử dụng.</span></li><li style=\"text-align:justify;\"><span style=\"font-family:\'Times New Roman\', Times, serif;font-size:18px;\"><i><strong>Trường hợp không áp dụng đổi trả:</strong></i></span></li><li style=\"text-align:justify;\"><span style=\"font-family:\'Times New Roman\', Times, serif;font-size:18px;\">Thuốc hoặc sản phẩm đã mở bao bì, đã sử dụng.</span></li><li style=\"text-align:justify;\"><span style=\"font-family:\'Times New Roman\', Times, serif;font-size:18px;\">Thuốc bị hư hỏng do khách hàng bảo quản không đúng quy định sau khi mua.</span></li><li style=\"text-align:justify;\"><span style=\"font-family:\'Times New Roman\', Times, serif;font-size:18px;\">Thuốc kê đơn đã bán đúng theo đơn thuốc của bác sĩ.</span></li></ul><p style=\"text-align:justify;\"><span style=\"font-family:\'Times New Roman\', Times, serif;font-size:18px;\"><strong>CHÍNH SÁCH GIAO HÀNG</strong></span></p><ul><li style=\"text-align:justify;\"><span style=\"font-family:\'Times New Roman\', Times, serif;font-size:18px;\">Nhà thuốc miễn phí giao hàng đối với các đơn hàng có giá trị từ 300.000 đồng trở lên trong phạm vi nội thị và bán kính không quá 3 km.</span></li><li style=\"text-align:justify;\"><span style=\"font-family:\'Times New Roman\', Times, serif;font-size:18px;\">Đối với các đơn hàng có khoảng cách trên 3 km, phí giao hàng được tính theo mức phí của đơn vị vận chuyển hoặc theo mặt bằng giá thị trường tại thời điểm giao hàng.</span></li></ul><p style=\"text-align:justify;\"><span style=\"font-size:18px;\"><strong>THỂ LỆ CHƯƠNG TRÌNH TÍCH ĐIỂM NHẬN ĐẶC QUYỀN</strong></span></p><p style=\"text-align:justify;\"><span style=\"font-size:18px;\">Nhằm<strong> </strong>tri ân khách hàng đã tin tưởng và sử dụng sản phẩm, dịch vụ của Nhà thuốc và xây dựng mối quan hệ lâu dài giữa Nhà thuốc và khách hàng. Nhà thuốc Trường Cao đẳng Kon Tum áp dụng Chương trình tích điểm nhận đặc quyền đối với:</span></p><p style=\"text-align:justify;\"><span style=\"font-size:18px;\">- Tất cả khách hàng mua thuốc và các sản phẩm chăm sóc sức khỏe tại Nhà thuốc.</span></p><p style=\"text-align:justify;\"><span style=\"font-size:18px;\">- Khách hàng cần <strong>đăng ký thông tin cơ bản (tên, số điện thoại)</strong> để tham gia chương trình tích điểm.</span></p><p style=\"text-align:justify;\"><span style=\"font-size:18px;\">*</span><span style=\"font-family:\'Times New Roman\', Times, serif;font-size:18px;\"> Nguyên tắc tích điểm:</span></p><p style=\"text-align:justify;\"><span style=\"font-family:\'Times New Roman\', Times, serif;font-size:18px;\">- Mỗi <strong>1000 đồng giá trị mua hàng = 1 điểm tích lũy</strong>.</span></p><p style=\"text-align:justify;\"><span style=\"font-family:\'Times New Roman\', Times, serif;font-size:18px;\">- Điểm được tích lũy <strong>trên tổng giá trị hóa đơn thanh toán</strong>.</span></p><p style=\"text-align:justify;\"><span style=\"font-family:\'Times New Roman\', Times, serif;font-size:18px;\">- Điểm tích lũy được <strong>cộng trực tiếp vào tài khoản khách hàng theo số điện thoại đăng ký</strong>.</span></p><p style=\"text-align:justify;\"><span style=\"font-family:\'Times New Roman\', Times, serif;font-size:18px;\">Ví dụ: Hóa đơn 100.000 đồng → tích 100 điểm; Hóa đơn 350.000 đồng → tích 350 điểm</span></p><p><span style=\"font-family:\'Times New Roman\', Times, serif;font-size:18px;\">* Quy đổi điểm thưởng:</span></p><p style=\"text-align:justify;\"><span style=\"font-family:\'Times New Roman\', Times, serif;font-size:18px;\"><img class=\"image_resized\" style=\"aspect-ratio:649/399;width:39.57%;\" src=\"https://phongkhamcdkontum.com.vn/uploads/images/7345b9b6e0a2f866a40059efbafc7999-Screenshot2026-03-09100340.png\" width=\"649\" height=\"399\"></span></p><p><span style=\"font-family:\'Times New Roman\', Times, serif;font-size:18px;\">Khách hàng có thể sử dụng điểm để <strong>trừ trực tiếp vào hóa đơn khi thanh toán</strong>.</span></p><p><span style=\"font-family:\'Times New Roman\', Times, serif;font-size:18px;\">* Thời hạn sử dụng điểm:</span></p><p><span style=\"font-family:\'Times New Roman\', Times, serif;font-size:18px;\">- Điểm tích lũy có <strong>thời hạn sử dụng 12 tháng</strong> kể từ ngày phát sinh.</span></p><p><span style=\"font-family:\'Times New Roman\', Times, serif;font-size:18px;\">- Sau thời gian trên, nếu khách hàng chưa sử dụng, điểm sẽ <strong>tự động hết hiệu lực</strong>.</span></p><p><span style=\"font-family:\'Times New Roman\', Times, serif;font-size:18px;\">* Quy định sử dụng điểm:</span></p><p><span style=\"font-family:\'Times New Roman\', Times, serif;font-size:18px;\">- Điểm tích lũy chỉ áp dụng cho chính khách hàng đã đăng ký.</span></p><p><span style=\"font-family:\'Times New Roman\', Times, serif;font-size:18px;\">- Không quy đổi điểm thành tiền mặt.</span></p><p><span style=\"font-family:\'Times New Roman\', Times, serif;font-size:18px;\">- Không chuyển nhượng điểm cho người khác (trừ trường hợp cùng số điện thoại đăng ký).</span></p><p><span style=\"font-family:\'Times New Roman\', Times, serif;font-size:18px;\">- Nhà thuốc có quyền điều chỉnh thể lệ chương trình khi cần thiết và thông báo đến khách hàng.</span></p><p style=\"text-align:justify;\">&nbsp;</p>', 24, 0, '2026-03-09 10:16:47'),
(7, 10, 'Đo chỉ số cân nặng - Chiều cao (BMI) Online', '<hr><h2><span style=\"font-family:\'Times New Roman\', Times, serif;font-size:18px;\"><strong>ĐO CHỈ SỐ CÂN NẶNG - CHIỀU CAO (BMI) ONLINE&nbsp;</strong></span></h2><p style=\"margin-left:0px;\"><span style=\"font-family:\'Times New Roman\', Times, serif;font-size:14px;\"><strong>BMI không đo lường trực tiếp mỡ của cơ thể nhưng các nghiên cứu đã chứng minh rằng BMI tương quan với đo mỡ trực tiếp. BMI là phương pháp không tốn kém và dễ thực hiện để tầm soát vấn đề sức khoẻ.</strong></span></p><h2><span style=\"font-family:\'Times New Roman\', Times, serif;font-size:14px;\"><strong>Sử dụng BMI như thế nào?</strong></span></h2><p style=\"margin-left:0px;\"><span style=\"font-family:\'Times New Roman\', Times, serif;font-size:14px;\">BMI được sử dụng như là một công cụ tầm soát để xác định trọng lượng thích hợp cho người lớn. Tuy nhiên, BMI không phải là công cụ chẩn đoán. Ví dụ, một người có chỉ số BMI cao, để xác định trọng lượng có phải là một nguy cơ cho sức khoẻ không thì các bác sĩ cần thực hiện thêm các đánh giá khác. Những đánh giá này gồm đo độ dày nếp da, đánh giá chế độ ăn, hoạt động thể lực, tiền sử gia đình và các sàng lọc sức khoẻ khác.</span></p><h3 style=\"margin-left:0px;\"><span style=\"font-family:\'Times New Roman\', Times, serif;font-size:14px;\"><strong>Tại sao Cơ quan kiểm soát bệnh tật Hoa Kỳ - CDC sử dụng BMI để xác định sự thừa cân và béo phì?</strong></span></h3><p style=\"margin-left:0px;\"><span style=\"font-family:\'Times New Roman\', Times, serif;font-size:14px;\">Tính chỉ số BMI là một phương pháp tốt nhất để đánh giá thừa cân và béo phì cho một quần thể dân chúng. Để tính chỉ số BMI, người ta chỉ yêu cầu đo chiều cao và cân nặng, không tốn kém và dễ thực hiện. Sử dụng chỉ số BMI cho phép người ta so sánh tình trạng cân nặng của họ với quần thể nói chung. Công thức tính BMI theo đơn vị kilograms và mét (xem cách tính dưới đây)</span></p><h3 style=\"margin-left:0px;\"><span style=\"font-family:\'Times New Roman\', Times, serif;font-size:14px;\"><strong>Cách tính và đánh giá chỉ số BMI như thế nào?</strong></span></h3><figure class=\"image\"><img style=\"aspect-ratio:692/477;\" src=\"https://phongkhamcdkontum.com.vn/uploads/images/f0050efbf25d8e63d2c5be66418a17f1-Screenshot_1.png\" width=\"692\" height=\"477\"></figure><p style=\"margin-left:0px;text-align:center;\"><span style=\"font-family:\'Times New Roman\', Times, serif;font-size:14px;\"><strong>Cách đánh giá chỉ số BMI</strong></span></p><p style=\"margin-left:0px;\"><span style=\"font-family:\'Times New Roman\', Times, serif;font-size:14px;\"><strong>Đối với người lớn từ 20 tuổi trở lên, Sử dụng bảng phân loại chuẩn cho cả nam và nữ để đánh giá chỉ số BMI.</strong></span></p><ul><li><span style=\"font-family:\'Times New Roman\', Times, serif;font-size:14px;\">BMI &lt;16: Gầy độ III</span></li><li><span style=\"font-family:\'Times New Roman\', Times, serif;font-size:14px;\">16 ≤ BMI &lt;17: Gầy độ II</span></li><li><span style=\"font-family:\'Times New Roman\', Times, serif;font-size:14px;\">17 ≤ BMI &lt;18.5: Gầy độ I</span></li><li><span style=\"font-family:\'Times New Roman\', Times, serif;font-size:14px;\">18.5 ≤ BMI &lt;25: Bình thường</span></li><li><span style=\"font-family:\'Times New Roman\', Times, serif;font-size:14px;\">25 ≤ BMI &lt;30: Thừa cân</span></li><li><span style=\"font-family:\'Times New Roman\', Times, serif;font-size:14px;\">30 ≤ BMI 35: Béo phì độ 1</span></li><li><span style=\"font-family:\'Times New Roman\', Times, serif;font-size:14px;\">35 ≤ BMI &lt;40: Béo phì độ II</span></li><li><span style=\"font-family:\'Times New Roman\', Times, serif;font-size:14px;\">BMI &gt;40: Béo phì độ III</span></li></ul><h3 style=\"margin-left:0px;\"><span style=\"font-family:\'Times New Roman\', Times, serif;font-size:14px;\"><strong>Nguy cơ khi chỉ số BMI thấp</strong></span></h3><p style=\"margin-left:0px;\"><span style=\"font-family:\'Times New Roman\', Times, serif;font-size:14px;\">Kết quả test BMI thấp hơn 18,5 cho thấy cơ thể đang trong tình trạng gầy, thiếu cân, suy dinh dưỡng, loãng xương, miễn dịch suy yếu…</span></p><h3 style=\"margin-left:0px;\"><span style=\"font-family:\'Times New Roman\', Times, serif;font-size:14px;\"><strong>Nguy cơ khi chỉ số BMI cao</strong></span></h3><p style=\"margin-left:0px;\"><span style=\"font-family:\'Times New Roman\', Times, serif;font-size:14px;\">Chỉ số BMI cao hơn 25 (tức là thừa cân-béo phì) làm tăng nguy cơ mắc các bệnh tim mạch, đường huyết, huyết áp, đột quỵ, một số bệnh ung thư…</span></p>', 24, 0, '2026-03-07 14:19:36');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hicrm_job_applications`
--

CREATE TABLE `hicrm_job_applications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `candidate_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `job_post_id` bigint(20) NOT NULL,
  `employer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('submitted','reviewing','interview','offered','rejected','withdrawn') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'submitted',
  `applied_at` datetime NOT NULL DEFAULT current_timestamp(),
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `hicrm_job_applications`
--

INSERT INTO `hicrm_job_applications` (`id`, `candidate_id`, `user_id`, `job_post_id`, `employer_id`, `status`, `applied_at`, `created_at`, `updated_at`) VALUES
(1, 5, 50, 80, 10, 'submitted', '2026-07-10 23:54:11', '2026-07-10 23:54:11', '2026-07-10 23:54:11'),
(2, 5, 50, 81, 11, 'submitted', '2026-07-10 23:57:19', '2026-07-10 23:57:19', '2026-07-10 23:57:19'),
(3, 7, 60, 80, 10, 'submitted', '2026-07-24 00:52:20', '2026-07-24 00:52:20', '2026-07-24 00:52:20'),
(4, 7, 60, 76, 9, 'submitted', '2026-07-24 00:53:36', '2026-07-24 00:53:36', '2026-07-24 00:53:36'),
(5, 17, 68, 66, 21, 'submitted', '2026-07-26 02:54:51', '2026-07-26 02:54:51', '2026-07-26 02:54:51'),
(6, 17, 68, 68, 5, 'submitted', '2026-07-26 02:56:33', '2026-07-26 02:56:33', '2026-07-26 02:56:33'),
(7, 17, 68, 121, 11, 'submitted', '2026-07-26 03:40:24', '2026-07-26 03:40:24', '2026-07-26 03:40:24');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hicrm_job_categories`
--

CREATE TABLE `hicrm_job_categories` (
  `id` int(11) NOT NULL,
  `job_category_name` varchar(255) NOT NULL COMMENT 'Tên ngành nghề',
  `job_category_icon` varchar(100) DEFAULT NULL,
  `job_category_keyword` varchar(255) NOT NULL COMMENT 'Tên không dấu, viết thường, nối bằng dấu _',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `hicrm_job_categories`
--

INSERT INTO `hicrm_job_categories` (`id`, `job_category_name`, `job_category_icon`, `job_category_keyword`, `created_at`) VALUES
(1, 'Công nghệ thông tin', 'ti ti-device-laptop', 'cong_nghe_thong_tin', '2026-05-26 15:16:48'),
(2, 'Lập trình phần mềm', 'ti ti-code', 'lap_trinh_phan_mem', '2026-05-26 15:16:48'),
(3, 'Thiết kế đồ họa', 'ti ti-palette', 'thiet_ke_do_hoa', '2026-05-26 15:16:48'),
(4, 'Marketing', 'ti ti-speakerphone', 'marketing', '2026-05-26 15:16:48'),
(5, 'Digital Marketing', 'ti ti-chart-dots-3', 'digital_marketing', '2026-05-26 15:16:48'),
(6, 'Kinh doanh', 'ti ti-briefcase', 'kinh_doanh', '2026-05-26 15:16:48'),
(7, 'Bán hàng', 'ti ti-shopping-cart', 'ban_hang', '2026-05-26 15:16:48'),
(8, 'Chăm sóc khách hàng', 'ti ti-headset', 'cham_soc_khach_hang', '2026-05-26 15:16:48'),
(9, 'Hành chính - Văn phòng', 'ti ti-building-community', 'hanh_chinh_van_phong', '2026-05-26 15:16:48'),
(10, 'Nhân sự', 'ti ti-users-group', 'nhan_su', '2026-05-26 15:16:48'),
(11, 'Kế toán', 'ti ti-calculator', 'ke_toan', '2026-05-26 15:16:48'),
(12, 'Kiểm toán', 'ti ti-file-search', 'kiem_toan', '2026-05-26 15:16:48'),
(13, 'Tài chính - Ngân hàng', 'ti ti-cash-banknote', 'tai_chinh_ngan_hang', '2026-05-26 15:16:48'),
(14, 'Bảo hiểm', 'ti ti-shield-check', 'bao_hiem', '2026-05-26 15:16:48'),
(15, 'Xuất nhập khẩu', 'ti ti-world', 'xuat_nhap_khau', '2026-05-26 15:16:48'),
(16, 'Logistics', 'ti ti-truck-delivery', 'logistics', '2026-05-26 15:16:48'),
(17, 'Vận tải', 'ti ti-truck', 'van_tai', '2026-05-26 15:16:48'),
(18, 'Kho vận', 'ti ti-package', 'kho_van', '2026-05-26 15:16:48'),
(19, 'Thương mại điện tử', 'ti ti-shopping-bag', 'thuong_mai_dien_tu', '2026-05-26 15:16:48'),
(20, 'Quản trị kinh doanh', 'ti ti-presentation', 'quan_tri_kinh_doanh', '2026-05-26 15:16:48'),
(21, 'Bất động sản', 'ti ti-building-estate', 'bat_dong_san', '2026-05-26 15:16:48'),
(22, 'Xây dựng', 'ti ti-building', 'xay_dung', '2026-05-26 15:16:48'),
(23, 'Kiến trúc', 'ti ti-building-arch', 'kien_truc', '2026-05-26 15:16:48'),
(24, 'Nội thất', 'ti ti-armchair', 'noi_that', '2026-05-26 15:16:48'),
(25, 'Điện - Điện tử', 'ti ti-bolt', 'dien_dien_tu', '2026-05-26 15:16:48'),
(26, 'Cơ khí', 'ti ti-tool', 'co_khi', '2026-05-26 15:16:48'),
(27, 'Tự động hóa', 'ti ti-robot', 'tu_dong_hoa', '2026-05-26 15:16:48'),
(28, 'Kỹ thuật ô tô', 'ti ti-car', 'ky_thuat_o_to', '2026-05-26 15:16:48'),
(29, 'Sản xuất', 'ti ti-factory', 'san_xuat', '2026-05-26 15:16:48'),
(30, 'QA/QC', 'ti ti-circle-check', 'qa_qc', '2026-05-26 15:16:48'),
(31, 'Quản lý chất lượng', 'ti ti-badge-check', 'quan_ly_chat_luong', '2026-05-26 15:16:48'),
(32, 'Dệt may', 'ti ti-shirt', 'det_may', '2026-05-26 15:16:48'),
(33, 'Da giày', 'ti ti-walk', 'da_giay', '2026-05-26 15:16:48'),
(34, 'Nông nghiệp', 'ti ti-leaf', 'nong_nghiep', '2026-05-26 15:16:48'),
(35, 'Lâm nghiệp', 'ti ti-trees', 'lam_nghiep', '2026-05-26 15:16:48'),
(36, 'Thủy sản', 'ti ti-fish', 'thuy_san', '2026-05-26 15:16:48'),
(37, 'Thực phẩm - Đồ uống', 'ti ti-chef-hat', 'thuc_pham_do_uong', '2026-05-26 15:16:48'),
(38, 'Y tế', 'ti ti-stethoscope', 'y_te', '2026-05-26 15:16:48'),
(39, 'Dược', 'ti ti-pill', 'duoc', '2026-05-26 15:16:48'),
(40, 'Điều dưỡng', 'ti ti-heart-handshake', 'dieu_duong', '2026-05-26 15:16:48'),
(41, 'Chăm sóc sức khỏe', 'ti ti-heart-pulse', 'cham_soc_suc_khoe', '2026-05-26 15:16:48'),
(42, 'Giáo dục', 'ti ti-school', 'giao_duc', '2026-05-26 15:16:48'),
(43, 'Giảng viên', 'ti ti-chalkboard', 'giang_vien', '2026-05-26 15:16:48'),
(44, 'Ngoại ngữ', 'ti ti-language', 'ngoai_ngu', '2026-05-26 15:16:48'),
(45, 'Biên phiên dịch', 'ti ti-message-2', 'bien_phien_dich', '2026-05-26 15:16:48'),
(46, 'Luật', 'ti ti-scale', 'luat', '2026-05-26 15:16:48'),
(47, 'Pháp lý', 'ti ti-gavel', 'phap_ly', '2026-05-26 15:16:48'),
(48, 'Báo chí - Truyền thông', 'ti ti-news', 'bao_chi_truyen_thong', '2026-05-26 15:16:48'),
(49, 'Tổ chức sự kiện', 'ti ti-calendar-event', 'to_chuc_su_kien', '2026-05-26 15:16:48'),
(50, 'Du lịch', 'ti ti-plane', 'du_lich', '2026-05-26 15:16:48'),
(51, 'Khách sạn', 'ti ti-building-community', 'khach_san', '2026-05-26 15:16:48'),
(52, 'Nhà hàng', 'ti ti-tools-kitchen-2', 'nha_hang', '2026-05-26 15:16:48'),
(53, 'Đầu bếp', 'ti ti-chef-hat', 'dau_bep', '2026-05-26 15:16:48'),
(54, 'Spa - Làm đẹp', 'ti ti-sparkles', 'spa_lam_dep', '2026-05-26 15:16:48'),
(55, 'Thể dục thể thao', 'ti ti-run', 'the_duc_the_thao', '2026-05-26 15:16:48'),
(56, 'Bảo vệ', 'ti ti-shield', 'bao_ve', '2026-05-26 15:16:48'),
(57, 'Lao động phổ thông', 'ti ti-user', 'lao_dong_pho_thong', '2026-05-26 15:16:48'),
(58, 'Sinh viên làm thêm', 'ti ti-school', 'sinh_vien_lam_them', '2026-05-26 15:16:48'),
(59, 'Freelancer', 'ti ti-user-code', 'freelancer', '2026-05-26 15:16:48'),
(60, 'Part-time', 'ti ti-clock', 'part_time', '2026-05-26 15:16:48'),
(61, 'Full-time', 'ti ti-briefcase', 'full_time', '2026-05-26 15:16:48'),
(62, 'Thực tập sinh', 'ti ti-school', 'thuc_tap_sinh', '2026-05-26 15:16:48'),
(63, 'Việc làm online', 'ti ti-wifi', 'viec_lam_online', '2026-05-26 15:16:48'),
(64, 'Khoa học dữ liệu', 'ti ti-chart-bar', 'khoa_hoc_du_lieu', '2026-05-26 15:16:48'),
(65, 'Trí tuệ nhân tạo', 'ti ti-robot', 'tri_tue_nhan_tao', '2026-05-26 15:16:48'),
(66, 'An toàn thông tin', 'ti ti-shield-lock', 'an_toan_thong_tin', '2026-05-26 15:16:48'),
(67, 'DevOps', 'ti ti-cloud-cog', 'devops', '2026-05-26 15:16:48'),
(68, 'Tester', 'ti ti-bug', 'tester', '2026-05-26 15:16:48'),
(69, 'Game Developer', 'ti ti-device-gamepad-2', 'game_developer', '2026-05-26 15:16:48'),
(70, 'Mobile Developer', 'ti ti-device-mobile', 'mobile_developer', '2026-05-26 15:16:48'),
(71, 'Frontend Developer', 'ti ti-layout-dashboard', 'frontend_developer', '2026-05-26 15:16:48'),
(72, 'Backend Developer', 'ti ti-server', 'backend_developer', '2026-05-26 15:16:48'),
(73, 'PHP Developer', 'ti ti-code', 'php_developer', '2026-05-26 15:16:48'),
(74, 'Java Developer', 'ti ti-coffee', 'java_developer', '2026-05-26 15:16:48'),
(75, 'Python Developer', 'ti ti-code', 'python_developer', '2026-05-26 15:16:48'),
(76, 'UI/UX Designer', 'ti ti-forms', 'ui_ux_designer', '2026-05-26 15:16:48'),
(77, 'SEO', 'ti ti-search', 'seo', '2026-05-26 15:16:48'),
(78, 'Content Creator', 'ti ti-pencil', 'content_creator', '2026-05-26 15:16:48'),
(79, 'Copywriter', 'ti ti-file-text', 'copywriter', '2026-05-26 15:16:48'),
(80, 'TikTok Creator', 'ti ti-video', 'tiktok_creator', '2026-05-26 15:16:48'),
(81, 'Streamer', 'ti ti-broadcast', 'streamer', '2026-05-26 15:16:48'),
(82, 'YouTuber', 'ti ti-video', 'youtuber', '2026-05-26 15:16:48'),
(83, 'MC - Người dẫn chương trình', 'ti ti-microphone', 'mc_nguoi_dan_chuong_trinh', '2026-05-26 15:16:48'),
(84, 'Nhiếp ảnh', 'ti ti-camera', 'nhiep_anh', '2026-05-26 15:16:48'),
(85, 'Quay dựng video', 'ti ti-movie', 'quay_dung_video', '2026-05-26 15:16:48'),
(86, 'Game - Esport', 'ti ti-device-gamepad', 'game_esport', '2026-05-26 15:16:48'),
(87, 'Môi trường', 'ti ti-recycle', 'moi_truong', '2026-05-26 15:16:48'),
(88, 'Hóa học', 'ti ti-flask', 'hoa_hoc', '2026-05-26 15:16:48'),
(89, 'Sinh học', 'ti ti-dna-2', 'sinh_hoc', '2026-05-26 15:16:48'),
(90, 'Điện lạnh', 'ti ti-snowflake', 'dien_lanh', '2026-05-26 15:16:48'),
(91, 'Hàng không', 'ti ti-plane', 'hang_khong', '2026-05-26 15:16:48'),
(92, 'Hàng hải', 'ti ti-sailboat', 'hang_hai', '2026-05-26 15:16:48'),
(93, 'Công an - Quân đội', 'ti ti-shield', 'cong_an_quan_doi', '2026-05-26 15:16:48'),
(94, 'Công chức - Viên chức', 'ti ti-building-bank', 'cong_chuc_vien_chuc', '2026-05-26 15:16:48'),
(95, 'Phi chính phủ NGO', 'ti ti-world-heart', 'phi_chinh_phu_ngo', '2026-05-26 15:16:48'),
(96, 'Khởi nghiệp', 'ti ti-rocket', 'khoi_nghiep', '2026-05-26 15:16:48'),
(97, 'Quản lý dự án', 'ti ti-chart-arrows-vertical', 'quan_ly_du_an', '2026-05-26 15:16:48'),
(98, 'Data Analyst', 'ti ti-chart-bar', 'data_analyst', '2026-05-26 15:16:48'),
(99, 'Business Analyst', 'ti ti-chart-pie', 'business_analyst', '2026-05-26 15:16:48'),
(100, 'Blockchain', 'ti ti-blocks', 'blockchain', '2026-05-26 15:16:48'),
(101, 'IoT', 'ti ti-wifi', 'iot', '2026-05-26 15:16:48'),
(102, 'Kỹ sư cầu đường', 'ti ti-road', 'ky_su_cau_duong', '2026-05-26 15:16:48'),
(103, 'Kỹ sư điện', 'ti ti-bolt', 'ky_su_dien', '2026-05-26 15:16:48'),
(104, 'Kỹ sư cơ khí', 'ti ti-tool', 'ky_su_co_khi', '2026-05-26 15:16:48'),
(105, 'Kỹ sư xây dựng', 'ti ti-building', 'ky_su_xay_dung', '2026-05-26 15:16:48'),
(106, 'Tư vấn tuyển sinh', 'ti ti-school', 'tu_van_tuyen_sinh', '2026-05-26 15:16:48'),
(107, 'Tư vấn tài chính', 'ti ti-cash', 'tu_van_tai_chinh', '2026-05-26 15:16:48'),
(108, 'Tư vấn bảo hiểm', 'ti ti-shield-check', 'tu_van_bao_hiem', '2026-05-26 15:16:48'),
(109, 'Tư vấn khách hàng', 'ti ti-headset', 'tu_van_khach_hang', '2026-05-26 15:16:48');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hicrm_job_posts`
--

CREATE TABLE `hicrm_job_posts` (
  `id` bigint(20) NOT NULL,
  `employer_id` bigint(20) NOT NULL,
  `candidate_id` int(11) NOT NULL DEFAULT 0,
  `job_category_id` int(11) DEFAULT NULL,
  `province_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `quantity` smallint(6) DEFAULT 1,
  `job_description` text NOT NULL,
  `experience_years` varchar(255) DEFAULT NULL,
  `degree_required` varchar(20) DEFAULT NULL COMMENT 'none | high_school | intermediate | college | university | postgraduate',
  `professional_skills` text DEFAULT NULL,
  `soft_skills` text DEFAULT NULL,
  `other_requirements` text DEFAULT NULL COMMENT 'Yêu cầu khác\r\n',
  `salary_id` int(11) DEFAULT NULL,
  `benefits_description` text DEFAULT NULL,
  `rewards_description` text DEFAULT NULL COMMENT 'Thưởng & Đãi ngộ',
  `work_environment` text DEFAULT NULL COMMENT 'Môi trường làm việc',
  `work_type` varchar(20) DEFAULT NULL COMMENT 'full_time | part_time | remote | hybrid',
  `job_post_type` varchar(20) NOT NULL DEFAULT 'normal',
  `address_detail` varchar(500) DEFAULT NULL,
  `working_time` varchar(255) DEFAULT NULL COMMENT 'Thời gian làm việc',
  `deadline` date NOT NULL,
  `status` varchar(20) DEFAULT 'pending' COMMENT 'draft | pending | published | closed | rejected',
  `published_at` datetime DEFAULT NULL,
  `views_count` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `hicrm_job_posts`
--

INSERT INTO `hicrm_job_posts` (`id`, `employer_id`, `candidate_id`, `job_category_id`, `province_id`, `title`, `quantity`, `job_description`, `experience_years`, `degree_required`, `professional_skills`, `soft_skills`, `other_requirements`, `salary_id`, `benefits_description`, `rewards_description`, `work_environment`, `work_type`, `job_post_type`, `address_detail`, `working_time`, `deadline`, `status`, `published_at`, `views_count`, `created_at`, `updated_at`) VALUES
(0, 0, 0, 17, 28, 'Nhân Viên Kho / Điều Khối', 10, '- Nhận và quét mã hàng hóa lên hệ thống, đóng gói hàng hóa, dán tem, xử lý hàng trả.\r\n- Nhận hàng từ xe tải, xuống tải hàng (bao hàng nặng ~20-50kg).\r\n- Phân chia hàng hóa theo các phường, các quận.\r\n- Quản lý hàng hóa trên hệ thống, đảm bảo tiến độ việc xuất nhập hàng.\r\n- Báo cáo xuất nhập hàng, xử lý phát sinh liên quan đến đơn hàng (hư hỏng, bể vỡ, thất lạc hàng).\r\n- Điều phối Shipper giao hàng tại trạm.\r\n- Xoay ca theo tuần (6 ngày/tuần) theo sắp xếp, 2 ca chính: \r\nSáng 05:00 - 14:00, Tối 13:00 - 22:00, Ca đêm 10:00 - 06:00 (hôm sau) không liên tục.', '1', 'Trung học phổ thông', NULL, NULL, NULL, 6, '- Nam/Nữ có sức khỏe và có khả năng làm việc theo ca.\r\n- Có tính trung thực, cẩn thận, chăm chỉ trong công việc.\r\n- Bằng 9/12 trở lên.\r\n- Tuổi từ 18-35 tuổi.', NULL, NULL, 'Toàn thời gian', 'normal', '125 Đường Hoa Ban, Phường Minh Khai, TP. An Phú', NULL, '1016-07-30', 'published', '2026-07-22 19:54:34', 0, '2026-07-22 12:54:34', '2026-07-22 19:54:34'),
(1, 11, 0, 66, 32, 'Nhân viên kinh doanh 1', 31, 'tiếp thị bán hàng 1', '21', 'intermediate1', 'ấdasdas1', 'đâsd1', '1', 1, '12312311', '1', '1', 'part_time', 'hot', '1231231231231', '1', '2026-06-12', 'pending', '2026-06-17 22:00:08', 0, '2026-06-03 15:35:48', '2026-07-26 03:37:51'),
(2, 11, 0, 56, NULL, 'Nhân viên bảo trì', 1, 'Bảo trì hệ thống CNTT', '5', 'Đại học', 'Thành thạo CNTT', 'Trách nhiệm trong công việc', NULL, NULL, 'Được đóng BHXH', NULL, NULL, 'Trực tiếp', 'hot', 'Hoàn văn thụ - Kon tum', NULL, '2026-06-12', '99', '2026-06-17 22:00:08', 0, '2026-06-04 15:56:52', '2026-07-23 08:04:53'),
(3, 11, 0, 66, NULL, '123123', 1, '123123', '1', '3', '1', '1', NULL, NULL, '3', NULL, NULL, 'Trực tiếp', 'hot', '123123123123 1', '', '2026-06-05', '99', '2026-06-17 22:00:08', 0, '2026-06-04 16:48:27', '2026-07-23 08:04:39'),
(4, 11, 0, 72, 11, '1233121', 1, '11', '5', 'Đại học', '1', '3', '2', 1, '2', '1', '1', 'Trực tiếp', 'hot', '123123123123 1', '13', '2026-06-06', '99', '2026-06-17 22:00:08', 3, '2026-06-04 17:01:30', '2026-07-23 08:04:28'),
(5, 11, 0, 66, 22, 'Kế toán', 1, 'Kế toán', '1', 'Đại học', '1111', '1123', '123123123', 1, '123123', '123123', '123123', 'Trực tiếp', 'hot', '123123123123 1231231', 'Trong giờ hành chính', '2026-06-20', '99', '2026-06-17 19:53:42', 0, '2026-06-10 15:40:55', '2026-07-23 08:04:59'),
(6, 11, 0, 1, 11, 'Nhan vien kinh doanh 1', 2, 'Tu van va cham soc khach hang', '1', 'college', 'Giao tiep va tin hoc van phong', 'Lam viec nhom', 'Uu tien ung vien co kinh nghiem', 3, 'BHXH va phu cap', 'Thuong doanh so', 'Moi truong tre trung', 'full_time', 'hot', 'Kon Tum', 'Thu 2 - Thu 6', '2026-12-31', '99', '2026-06-17 22:00:08', 0, '2026-06-17 13:18:37', '2026-07-23 08:05:06'),
(7, 11, 0, 1, 11, 'Nhan vien kinh doanh 2', 2, 'Tu van va cham soc khach hang', '1', 'college', 'Giao tiep va tin hoc van phong', 'Lam viec nhom', 'Uu tien ung vien co kinh nghiem', 3, 'BHXH va phu cap', 'Thuong doanh so', 'Moi truong tre trung', 'full_time', 'hot', 'Kon Tum', 'Thu 2 - Thu 6', '2026-12-31', '99', '2026-06-17 22:00:08', 0, '2026-06-17 13:18:37', '2026-07-23 08:05:13'),
(8, 11, 0, 1, 11, 'Nhan vien kinh doanh 3', 2, 'Tu van va cham soc khach hang', '1', 'college', 'Giao tiep va tin hoc van phong', 'Lam viec nhom', 'Uu tien ung vien co kinh nghiem', 3, 'BHXH va phu cap', 'Thuong doanh so', 'Moi truong tre trung', 'full_time', 'hot', 'Kon Tum', 'Thu 2 - Thu 6', '2026-12-31', '99', '2026-06-17 22:00:08', 0, '2026-06-17 13:18:37', '2026-07-23 08:05:19'),
(9, 11, 0, 1, 11, 'Nhan vien kinh doanh 4', 2, 'Tu van va cham soc khach hang', '1', 'college', 'Giao tiep va tin hoc van phong', 'Lam viec nhom', 'Uu tien ung vien co kinh nghiem', 3, 'BHXH va phu cap', 'Thuong doanh so', 'Moi truong tre trung', 'full_time', 'hot', 'Kon Tum', 'Thu 2 - Thu 6', '2026-12-31', '99', '2026-06-17 22:00:08', 0, '2026-06-17 13:18:37', '2026-07-23 08:05:43'),
(10, 11, 0, 1, 11, 'Nhan vien kinh doanh 5', 2, 'Tu van va cham soc khach hang', '1', 'college', 'Giao tiep va tin hoc van phong', 'Lam viec nhom', 'Uu tien ung vien co kinh nghiem', 3, 'BHXH va phu cap', 'Thuong doanh so', 'Moi truong tre trung', 'full_time', 'hot', 'Kon Tum', 'Thu 2 - Thu 6', '2026-12-31', '99', '2026-06-17 22:00:08', 0, '2026-06-17 13:18:37', '2026-07-23 08:05:50'),
(11, 11, 0, 1, 11, 'Nhan vien kinh doanh 6', 2, 'Tu van va cham soc khach hang', '1', 'college', 'Giao tiep va tin hoc van phong', 'Lam viec nhom', 'Uu tien ung vien co kinh nghiem', 3, 'BHXH va phu cap', 'Thuong doanh so', 'Moi truong tre trung', 'full_time', 'hot', 'Kon Tum', 'Thu 2 - Thu 6', '2026-12-31', '99', '2026-06-17 22:00:08', 0, '2026-06-17 13:18:37', '2026-07-23 08:06:45'),
(12, 11, 0, 1, 11, 'Nhan vien kinh doanh 7', 2, 'Tu van va cham soc khach hang', '1', 'college', 'Giao tiep va tin hoc van phong', 'Lam viec nhom', 'Uu tien ung vien co kinh nghiem', 3, 'BHXH va phu cap', 'Thuong doanh so', 'Moi truong tre trung', 'full_time', 'hot', 'Kon Tum', 'Thu 2 - Thu 6', '2026-12-31', '99', '2026-06-17 22:00:08', 0, '2026-06-17 13:18:37', '2026-07-23 08:06:51'),
(13, 11, 0, 1, 11, 'Nhan vien kinh doanh 4', 2, 'Tu van va cham soc khach hang', '1', 'college', 'Giao tiep va tin hoc van phong', 'Lam viec nhom', 'Uu tien ung vien co kinh nghiem', 3, 'BHXH va phu cap', 'Thuong doanh so', 'Moi truong tre trung', 'full_time', 'hot', 'Kon Tum', 'Thu 2 - Thu 6', '2026-12-31', '99', '2026-06-17 22:00:08', 0, '2026-06-17 13:42:33', '2026-07-23 08:07:09'),
(14, 11, 0, 1, 11, 'Nhân viên kế toán', 2, 'Tu van va cham soc khach hang', '1', 'college', 'Giao tiep va tin hoc van phong', 'Lam viec nhom', 'Uu tien ung vien co kinh nghiem', 3, 'BHXH va phu cap', 'Thuong doanh so', 'Moi truong tre trung', 'full_time', 'hot', 'Kon Tum', 'Thu 2 - Thu 6', '2026-12-31', '99', '2026-06-17 22:00:08', 0, '2026-06-17 13:42:33', '2026-07-23 08:07:03'),
(15, 11, 0, 1, 11, 'Nhân viên CNTT', 2, 'Tu van va cham soc khach hang', '1', 'college', 'Giao tiep va tin hoc van phong', 'Lam viec nhom', 'Uu tien ung vien co kinh nghiem', 3, 'BHXH va phu cap', 'Thuong doanh so', 'Moi truong tre trung', 'full_time', 'hot', 'Kon Tum', 'Thu 2 - Thu 6', '2026-12-31', '99', '2026-06-17 22:00:08', 0, '2026-06-17 13:42:33', '2026-07-23 08:06:57'),
(16, 11, 0, 1, 11, 'Nhân viên Kiểm kho', 2, 'Tu van va cham soc khach hang', '1', 'college', 'Giao tiep va tin hoc van phong', 'Lam viec nhom', 'Uu tien ung vien co kinh nghiem', 3, 'BHXH va phu cap', 'Thuong doanh so', 'Moi truong tre trung', 'full_time', 'hot', 'Kon Tum', 'Thu 2 - Thu 6', '2026-12-31', '99', '2026-06-17 22:00:08', 0, '2026-06-17 13:42:33', '2026-07-23 08:07:34'),
(17, 11, 0, 1, 11, 'Nhân viên Kiểm toán', 2, 'Tu van va cham soc khach hang', '1', 'college', 'Giao tiep va tin hoc van phong', 'Lam viec nhom', 'Uu tien ung vien co kinh nghiem', 3, 'BHXH va phu cap', 'Thuong doanh so', 'Moi truong tre trung', 'full_time', 'hot', 'Kon Tum', 'Thu 2 - Thu 6', '2026-12-31', '99', '2026-06-17 22:00:08', 0, '2026-06-17 13:42:33', '2026-07-23 08:07:41'),
(18, 11, 0, 1, 11, 'Giám đốc', 2, 'Tu van va cham soc khach hang', '1', 'college', 'Giao tiep va tin hoc van phong', 'Lam viec nhom', 'Uu tien ung vien co kinh nghiem', 3, 'BHXH va phu cap', 'Thuong doanh so', 'Moi truong tre trung', 'full_time', 'hot', 'Kon Tum', 'Thu 2 - Thu 6', '2026-12-31', '99', '2026-06-17 22:00:08', 1, '2026-06-17 13:42:33', '2026-07-23 08:07:24'),
(19, 1, 0, 8, 11, 'Nhân Viên Chăm Sóc Khách Hàng (Chat / Mail)', 10, 'Kiểm duyệt nội dung đa dạng trên nền tảng âm nhạc xã hội: podcast, video, tiêu đề playlist, hồ sơ người dùng, ảnh album, nội dung do người dùng tạo và các buổi livestream.\r\nLắng nghe trực tiếp các luồng âm thanh để đánh giá và đảm bảo tuân thủ các tiêu chuẩn cộng đồng.\r\nSử dụng công cụ chuyên dụng của khách hàng để tiếp nhận, đánh giá nội dung và đưa ra quyết định kiểm duyệt phù hợp.\r\nGhi nhận kết quả kiểm duyệt một cách chính xác thông qua các hệ thống, công cụ và bảng tính được cung cấp.\r\nTheo dõi, báo cáo chi tiết về các hoạt động kiểm duyệt theo yêu cầu của khách hàng.\r\nĐịa điểm làm việc:\r\n+TP. Hồ Chí Minh: Tăng Nhơn Phú, Quận 9 (cũ) hoặc Công viên Phần mềm Quang Trung, Quận 12.\r\n+ Hà Nội: 37–39–41 Vũ Ngọc Phan, Quận Đống Đa.\r\n+ Thời gian làm việc:\r\n05 ngày/tuần, nghỉ 02 ngày bất kỳ.\r\nLàm việc theo ca xoay 24/7 theo sự sắp xếp của trưởng nhóm.\r\nMỗi ca làm việc 09 giờ (bao gồm 1.5 giờ nghỉ).', '1', 'Trung học', 'Giao tiep va tin hoc van phong', 'Lam viec nhom', 'Uu tien ung vien co kinh nghiem', 6, 'Tổng Thu Nhập: 11 - 13 Triệu/ tháng.\r\nTham gia đầy đủ BHXH, BHYT, BHTN ngay theo quy định và được bảo vệ thêm với gói bảo hiểm tai nạn 24/7 quyền lợi mở rộng.\r\nThưởng tháng 13 cố định cùng các khoản thưởng cuối năm dựa trên kết quả kinh doanh và đóng góp cá nhân.\r\nHưởng các chế độ chăm sóc từ công đoàn: quà sinh nhật, hỗ trợ hiếu hỉ, thai sản và các chương trình phúc lợi nội bộ.\r\nLàm việc trong môi trường quốc tế, hiện đại, chuyên nghiệp với 14 ngày phép/năm và khám sức khỏe định kỳ.\r\nTham gia đa dạng hoạt động gắn kết: team building, sự kiện nội bộ và chương trình dành cho nhân viên xuyên suốt năm.', 'Thuong doanh so', 'Moi truong tre trung', 'Toàn thời gian cố đị', 'hot', 'Tòa nhà QTSC 9, đường số 3, khu công viên phần mềm Quang Trung, Quận 12', 'Thu 2 - Thu 6', '2026-12-31', 'published', '2026-06-17 22:00:08', 4, '2026-06-17 13:42:33', '2026-07-23 07:59:47'),
(20, 8, 0, 1, 28, '[Củ Chi] Kỹ Sư Chuyển Đổi Số Nhà Máy (Digital Engineer)', 1, 'MỤC ĐÍCH CÔNG VIỆC\r\n\r\nChịu trách nhiệm triển khai và phát triển các dự án số hóa và tự động hóa trong nhà máy (MES, IIoT, Data Analytics, AI), nhằm xây dựng hệ sinh thái dữ liệu end-to-end từ shopfloor đến hệ thống quản lý, hỗ trợ ra quyết định chủ động và cải thiện hiệu suất vận hành (OEE, downtime, cost).\r\n\r\nĐóng vai trò cầu nối giữa vận hành sản xuất và công nghệ, đảm bảo các giải pháp digital và dữ liệu không chỉ được triển khai mà còn mang lại giá trị thực tế thông qua cải tiến năng suất, tối ưu chi phí và nâng cao độ ổn định hệ thống.\r\n\r\nTRÁCH NHIỆM CÔNG VIỆC\r\n\r\nChủ trì triển khai các dự án chuyển đổi số trong nhà máy, bao gồm các giải pháp Manufacturing Execution System (MES), Industrial Internet of Things (IIoT), Digital Workflow và các nền tảng Factory Digital khác nhằm xây dựng hệ sinh thái dữ liệu end-to-end từ shopfloor đến hệ thống quản lý.\r\n Thiết kế, triển khai và duy trì kết nối dữ liệu từ tầng OT (PLC, SCADA, HMI, Sensors, Historians) đến các hệ thống IT, Data Platform và công cụ phân tích dữ liệu Data Analytics.\r\nPhối hợp với các bộ phận Production, Engineering, Quality và ManEx để xác định cơ hội số hóa, xây dựng và triển khai các digital use cases nhằm cải thiện hiệu suất vận hành (OEE, downtime, cost).\r\nPhát triển và triển khai các giải pháp giám sát hiệu suất sản xuất, phân tích OEE, downtime, loss analysis, predictive maintenance và condition monitoring, đảm bảo tính ổn định, độ chính xác và tính toàn vẹn của dữ liệu.\r\nXây dựng, duy trì và phát triển các dashboard, báo cáo và công cụ phân tích dữ liệu phục vụ hoạt động quản lý vận hành và ra quyết định.\r\nPhát triển các ứng dụng phân tích dữ liệu, tự động hóa và tích hợp hệ thống bằng Python, SQL, Power Platform và các công cụ phù hợp khác.\r\nTriển khai các giải pháp Power Automate nhằm tự động hóa quy trình làm việc, giảm thao tác thủ công và nâng cao hiệu quả vận hành.\r\nTham gia nghiên cứu, thử nghiệm và triển khai các giải pháp AI, Machine Learning, Advanced Analytics và Copilot nhằm nâng cao khả năng dự báo, tối ưu hóa vận hành và ra quyết định dựa trên dữ liệu.\r\nPhối hợp với các nhóm IT, OT và nhà cung cấp để đảm bảo các giải pháp digital tuân thủ tiêu chuẩn kiến trúc, an ninh mạng và định hướng chuyển đổi số của công ty.', '3', 'Cao đẳng', 'Giao tiep va tin hoc van phong', 'Lam viec nhom', 'Uu tien ung vien co kinh nghiem', 11, 'Thu nhập hấp dẫn, thỏa thuận theo năng lực.\r\nMôi trường làm việc chuyên nghiệp, năng động, khuyến khích đổi mới và phát triển cá nhân.\r\nCơ hội tham gia vào các dự án chuyển đổi số quy mô lớn, áp dụng công nghệ tiên tiến như AI, Machine Learning.\r\nLộ trình phát triển sự nghiệp rõ ràng, được đào tạo nâng cao kiến thức và kỹ năng chuyên môn liên tục\r\nHưởng đầy đủ các chế độ phúc lợi theo quy định của pháp luật Việt Nam (BHXH, BHYT, BHTN).\r\nBảo hiểm sức khỏe cho cá nhân và người thân.\r\nThưởng lương tháng 13 và các khoản thưởng hiệu suất công việc hàng năm\r\nTham gia các hoạt động team building, du lịch hàng năm do công ty tổ chức.', 'Thuong doanh so', 'Moi truong tre trung', 'full_time', 'hot', 'Lô A22-3 KCN Tây Bắc Củ Chi Xã Tân An Hội - Xã Tân An Hội, Củ Chi', 'Thu 2 - Thu 6', '2026-12-31', 'published', '2026-06-17 22:00:08', 4, '2026-06-17 14:49:01', '2026-07-23 07:36:54'),
(21, 11, 0, 53, 33, 'Bếp Trưởng / Bếp Phó - Cần Thơ', 2, 'Học vấn/chuyên môn: đã qua đào tạo nghiệp vụ về bếp, quản lý bếp trong nhà hàng.\r\nCó kinh nghiệm 2 năm làm việc tại bếp nhà hàng,\r\nAm hiểu các món ăn, có kiến thức tốt về thực phẩm và an toàn vệ sinh thực phẩm.\r\nNắm rõ quy trình nhập – xuất hàng, bảo quản nguyên vật liệu.\r\nTính cách kiên định, trung thực, liêm chính, có khả năng thuyết phục và ý thức tiết kiệm.\r\nGiới tính: Nam/Nữ\r\nĐộ tuổi: 25 – 40', '2', 'Cao đẳng', 'Có khả năng đọc hiểu tài liệu, tổng hợp số liệu và lập báo cáo', 'Chủ động, trách nhiệm, chịu được áp lực', 'Sẵn sàng học hỏi và tuân thủ quy trình', 7, '- Hỗ trợ bữa ăn/phụ cấp ăn cho nhân viên tại Nhà hàng\r\n- Thưởng voucher sinh nhật, voucher nhân viên xuất sắc tháng\r\n- Ưu đãi 20% khi sử dụng dịch vụ tại nhà hàng thuộc hệ thống\r\n- Thưởng BSC cho nhà hàng đạt chỉ số hiệu quả kinh doanh\r\n- Lộ trình đào tạo, thăng tiến rõ ràng theo từng cấp bậc\r\n- Tham gia các hoạt động team building, year end party,..', 'Thưởng cuối năm theo quy định công ty', 'Văn phòng chuyên nghiệp, thân thiện', 'Toàn thời gian cố đị', 'hot', '249 đường 30/4, Phường Ninh Kiều, Ninh Kiều, Cần Thơ', 'Theo lịch phân công', '2026-08-25', 'published', '2026-06-17 22:00:27', 3, '2026-06-17 14:49:01', '2026-07-22 22:32:21'),
(22, 21, 0, 25, 28, 'Kỹ Sư Cơ Điện', 3, '- Theo dõi, kiểm tra, sửa chữa, bảo trì và bảo dưỡng thiết bị, kiểm soát tình trạng vận hành các máy móc, thiết bị xưởng sản xuất, văn phòng, toàn bộ cty, thực hiện bảo trì theo lịch. \r\n- Theo dõi, phát hiện sớm các hư hỏng, và đề nghị các biện pháp sửa chữa kịp thời. \r\n- Lắp đặt, sửa chữa hệ thống điện, hệ thống chiếu sáng, hệ thống HVAC, PCCC,...máy móc trang thiết bị trong toàn nhà máy. \r\n- Sửa chữa các máy hư hỏng, thực hiện các chuẩn bị cần thiết về thiết bị cho dây chuyền sản xuất hoạt động bình thường, trơn tru theo sự phân công của trưởng bộ phận.\r\n - Vận hành, giám sát dây chuyền sản xuất khi cần thiết theo kế hoạch sản xuất. \r\n- Thiết kế mới thiết bị, gia công dụng cụ, máy móc công cụ cần thiết phục vụ sản xuất, hoạt động của cty. \r\n- Đảm bảo hệ thống điện, nước, kỹ thuật toàn cty vận hành bình thường, ổn định, an toàn. \r\n- Giải quyết các sự cố khẩn cấp trong công ty.', '2', 'Trung cấp', 'Có khả năng đọc hiểu tài liệu, tổng hợp số liệu và lập báo cáo', 'Giao tiếp tốt, làm việc nhóm', 'Không yêu cầu kinh nghiệm, sẽ được đào tạo', 6, 'Mức lương: trao đổi khi phỏng vấn\r\nĐược tham gia BHXH theo quy định\r\nĐược hưởng các chế độ theo quy định của Luật Lao động và Công ty\r\nTham gia du lịch hàng năm', 'Thưởng doanh số theo kết quả công việc', 'Quy trình rõ ràng, hỗ trợ đào tạo', 'Toàn thời gian cố đị', 'hot', '6 Đường N4, Khu công nghiệp Tân Phú Trung, Ấp Trạm Bơm, Xã Củ Chi, Củ Chi', 'Thứ 2 - Thứ 6', '2026-08-12', 'published', '2026-06-17 22:00:27', 2, '2026-06-17 14:49:01', '2026-07-23 02:46:50'),
(23, 11, 0, 53, 28, 'Đầu Bếp Thực Đơn', 5, '- Thực hiện chế biến/sơ chế món ăn theo thực đơn của nhà hàng, đảm bảo chất lượng, hương vị và tiêu chuẩn vệ sinh an toàn thực phẩm.\r\n- Phối hợp chặt chẽ với các bộ phận khác (nhân viên phục vụ, thu ngân) để đảm bảo hoạt động trơn tru và mang lại trải nghiệm tốt nhất cho khách hàng.', '1', 'Cao đẳng', 'Thành thạo công cụ làm việc liên quan đến vị trí ứng tuyển', 'Kỹ năng xử lý tình huống', 'Có thể đi công tác khi cần', 5, 'Xét duyệt tăng lương định kỳ hàng quý\r\nTham gia HĐLĐ, BHXH theo quy định, Hưởng phép năm\r\nĐược đào tạo bài bản, có lộ trình phát triển nghề nghiệp', 'Thưởng hiệu suất và thưởng lễ Tết', 'Không gian làm việc ổn định, sạch sẽ', 'Toàn thời gian cố đị', 'hot', '543 Lê Văn Sỹ, Phường Phú Nhuận, Phú Nhuận', 'Thứ 2 - Thứ 7', '2026-11-11', 'published', '2026-06-17 22:00:27', 2, '2026-06-17 14:49:01', '2026-07-22 22:29:09'),
(24, 16, 0, 15, 1, 'Chuyên Viên Mua Hàng (Tiếng Anh Thành Thạo)', 1, '* Thực hiện công việc chuyên môn mua hàng thiết bị viễn thông, cơ điện:\r\n\r\n- Tổ chức tìm kiếm, đánh giá, xây dựng hệ thống NCC, duy trì quan hệ NCC cho các hạng mục được phân công;\r\n\r\n- Lựa chọn đối tác, lập giá dự toán cho các hạng mục được phân công đáp ứng yêu cầu, tiến độ chào thầu các dự án Thương mại\r\n\r\n- Lập kế hoạch mua hàng, mua hàng đáp ứng yêu cầu các HĐ đầu ra\r\n\r\n- Đàm phán, thương thảo hợp đồng với NCC\r\n\r\n- Quản lý tiến độ, kế hoạch, thực hiện hợp đồng mua hàng\r\n\r\n- Thực hiện thủ tục xuất nhập khẩu, vận chuyển, mua bảo hiểm, mở L/C\r\n\r\n- Theo dõi ký Biên bản, bảo hành sau giao hàng\r\n\r\n- Thực hiện các thủ tục thanh toán cho NCC\r\n\r\n* Thực hiện các công việc khác theo sự phân công của cấp trên.', '3', 'Đại học', 'Kỹ năng chuyên môn đúng vị trí, thao tác nhanh và cẩn thận', 'Giao tiếp tốt, làm việc nhóm', 'Ưu tiên ứng viên có kinh nghiệm thực tế', 7, '- Chế độ du lịch nghỉ mát hàng năm (trong nước + nước ngoài theo thành tích làm việc)\r\n\r\n- Chế độ sinh nhật, thăm hỏi hiếu hỉ, sinh con, ốm đau đối với CBNV, tứ thân phụ mẫu, vợ/chồng, con CBNV\r\n\r\n- Xe đưa đón CBNV nữ mang thai từ tháng thứ 8 trở đi (theo nhu cầu của CBNV nữ)\r\n\r\n- Ăn trưa, ăn sáng tự nguyện tại nhà ăn Công ty, Công ty hỗ trợ 1 phần chi phí. Ăn chay rằm, mùng 1: Công ty đài thọ. Ăn trưa: Thứ 7 vui vẻ: Công ty đài thọ. Đồ uống nhẹ trong giờ làm việc: Cafe, Milo\r\n\r\n- Máy tính công ty cấp:Laptop, Máy bàn theo yêu cầu công việc và công cụ làm việc\r\n\r\n- Làm việc từ Thứ 2 - Thứ 6 và 01 Thứ 7 trong tháng. T2-T6 làm việc theo ca linh hoạt. Thứ 7 làm việc 07 tiếng/công\r\n\r\n- Điều chỉnh thu nhập hàng năm vào các dịp: Sinh nhật Công ty, cuối năm\r\n\r\n- Bảo hiểm XH, BHYT, BHTN: Công ty đóng theo quy định của NN', 'Thưởng cuối năm theo quy định công ty', 'Môi trường trẻ trung, năng động', 'Toàn thời gian cố đị', 'hot', 'Số 11 Lê Trọng Tấn, Thanh Xuân, Hà Nội, Thanh Xuân', 'Linh hoạt theo ca', '2026-07-31', 'published', '2026-06-17 22:00:27', 2, '2026-06-17 14:49:01', '2026-07-23 06:32:57'),
(25, 5, 0, 11, 17, 'Nhân Viên Kế Toán Kho - Farm Nghệ An', 1, '1.Nhập số liệu lên hệ thống: Báo đẻ, kiểm định thai, khai thác tinh, báo phối, điều trị bệnh, tiêm vắc xin, chu chuyển đàn, chuyển giai đoạn, nhập cân nặng heo, heo cho ăn, nhập heo, báo chết cho heo \r\n2. Nhập, xuất hệ thống NVL, Bảo trì, công cụ dụng cụ, hóa chất, mẫu xét nghiệm (QAC) \r\n3. Chuyển thuốc, cám từ kho tổng tới các bộ phận trong trại. \r\n4. Theo dõi báo cáo BI hằng ngày \r\n5. Sắp xếp và tham gia kiểm kê cuối tháng, đối chiếu số liệu, điều tra chênh lệch (nếu có) giữa số kiểm kê thực tế với số tồn kho sổ sách. \r\n6. Nhập, xuất hệ thống, điều chuyển nội bộ và theo dõi tồn các kho giữa các trại \r\n7. Đối chiếu kiểm tra và hỗ trợ các số liệu với sản xuất để hoàn thành công việc nhanh và chính xác \r\n8. Gửi báo cáo kiểm kê và giải trình (nếu có) tới bộ phận Sản Xuất và Kế toán trưởng\r\n9. Đối chiếu số liệu kho, check các báo cáo liên quan và đóng kỳ \r\n10. Lưu trữ chứng từ theo tháng: Nhập kho, Xuất kho, Heo chết, Biên bản kiểm kê tại kho, Biên bản kiểm kê tổng hợp. \r\n11. Thực hiện các công việc khác phù hợp với công việc của Bộ phận và vị trí công việc của mình theo sự phân công của cấp trên trực tiếp.', '1', 'Cao đẳng', 'Biết sử dụng email, bảng tính và các công cụ cộng tác trực tuyến', 'Cẩn thận, trung thực, ham học hỏi', 'Không yêu cầu kinh nghiệm, sẽ được đào tạo', 6, '- Lương hấp dẫn theo thỏa thuận, tương xứng với năng lực.\r\n- Đóng BH đầy đủ theo quy định: Bảo hiểm xã hội, y tế, thất nghiệp, bảo hiểm tai nạn 24h.\r\n- Công ty Miễn phí ăn ở toàn bộ, ở tại khu kí túc xá hiện đại, có điều hòa, Wifi free, các khu vực vui chơi, giải trí, thể dục thể thao như bóng đá, bóng chuyền, cầu lông, bóng bàn, coffee nhà vườn, karaoke giải trí...v..v\r\n- Thưởng năng suất tháng; Thưởng Lương tháng 13, Thưởng KPI cuối năm từ 3 đến 6 tháng lương.\r\n- Xét tăng lương hàng năm theo năng lực.\r\n- Môi trường làm việc thân thiện, trẻ trung, năng động, đoàn kết, , Teambuilding hàng năm\r\n- Có cơ hội thăng tiến trong công việc', 'Thưởng chuyên cần và thưởng sáng kiến', 'Không gian làm việc ổn định, sạch sẽ', 'Toàn thời gian cố đị', 'hot', 'Cà Mau', 'Theo lịch phân công', '2026-09-15', 'published', '2026-06-17 22:00:27', 2, '2026-06-17 14:49:01', '2026-07-23 01:14:36'),
(26, 6, 0, 42, 27, 'Giáo Viên Tiếng Anh (Fulltime / Parttime)', 5, 'Giảng dạy theo chương trình của KTV English (Kid/Teen/ Adult/ Academic/ IELTS).\r\nTheo dõi tiến trình học tập của học viên và báo cáo, tổng kết định kỳ.\r\nHỗ trợ học viên tham gia sự kiện.\r\nCông việc cụ thể sẽ trao đổi trực tiếp khi phỏng vấn.', '1', 'Đại học', 'Kỹ năng chuyên môn đúng vị trí, thao tác nhanh và cẩn thận', 'Tư duy dịch vụ khách hàng', 'Không yêu cầu kinh nghiệm, sẽ được đào tạo', 6, 'Thu nhập: Lương cứng + phụ cấp \r\nĐầy đủ chế độ BHXH theo luật lao động và chính sách công ty.\r\nMôi trường làm việc chuyên nghiệp, thân thiện, hỗ trợ lẫn nhau\r\nCơ hội được đào tạo kỹ năng nghiệp vụ thường xuyên', 'Thưởng hiệu suất và thưởng lễ Tết', 'Đội ngũ quản lý hỗ trợ sát sao', 'Fulltime / Parttime', 'hot', '161/1, Đường Trương Định, KP 2, Phường Tam Hiệp, Biên Hòa', 'Thứ 2 - Thứ 7', '2026-11-30', 'published', '2026-06-17 22:00:27', 1, '2026-06-17 14:49:01', '2026-07-23 00:43:11'),
(27, 6, 0, 4, 27, 'Trưởng Phòng Sales Và Marketing', 1, '- Xây dựng và triển khai chiến lược kinh doanh và marketing tổng thể, đảm bảo đạt được các mục tiêu tăng trưởng doanh thu và thị phần đã đề ra cho các khóa học và sản phẩm giáo dục.\r\n- Phân tích thị trường, xác định đối tượng khách hàng mục tiêu và phát triển các chương trình marketing hiệu quả, bao gồm cả chiến dịch trực tuyến và ngoại tuyến để thu hút ít nhất 100 học viên mới mỗi quý.\r\n- Quản lý và điều hành đội ngũ sales và marketing, bao gồm 3-5 nhân viên, phân công nhiệm vụ, đào tạo và đánh giá hiệu suất, đảm bảo mỗi thành viên đạt được 90% chỉ tiêu cá nhân.\r\n- Phát triển và duy trì mối quan hệ với các đối tác chiến lược, trường học, trung tâm đào tạo để mở rộng kênh phân phối và tăng cường nhận diện thương hiệu.\r\n- Lập báo cáo định kỳ về hiệu quả hoạt động sales và marketing, đưa ra các đề xuất cải tiến dựa trên dữ liệu phân tích, trình bày trước Ban Giám đốc hàng tháng.', '2', 'Đại học', 'Thành thạo công cụ làm việc liên quan đến vị trí ứng tuyển', 'Giao tiếp tốt, làm việc nhóm', 'Có tinh thần trách nhiệm cao', 7, '- Môi trường làm việc năng động, chuyên nghiệp và thân thiện, khuyến khích sự sáng tạo và phát triển cá nhân.\r\n- Cơ hội thăng tiến rõ ràng lên các vị trí quản lý cấp cao hơn trong vòng 2-3 năm dựa trên hiệu suất công việc và đóng góp.\r\n- Tham gia đầy đủ BHXH, BHYT, BHTN theo quy định của pháp luật Việt Nam ngay sau thời gian thử việc.\r\n- Lương tháng 13, thưởng hiệu suất công việc theo quý/năm, thưởng lễ Tết hấp dẫn.\r\n- Được tham gia các khóa đào tạo nâng cao chuyên môn, nghiệp vụ và kỹ năng quản lý định kỳ.\r\n- Các hoạt động teambuilding, dã ngoại, du lịch hàng năm để gắn kết đội ngũ và nâng cao tinh thần làm việc.', 'Thưởng doanh số theo kết quả công việc', 'Môi trường trẻ trung, năng động', 'Toàn thời gian cố đị', 'hot', '16/1, Đường Trương Định, KP 2, Phường Tam Hiệp, Biên Hòa', 'Thứ 2 - Thứ 6', '2026-10-30', 'published', '2026-06-17 22:00:27', 2, '2026-06-17 14:49:01', '2026-07-23 00:37:08'),
(28, 12, 0, 16, 1, 'Nhân Viên Kinh Doanh E-Logistics - Đi Làm Ngay HN / HCM', 50, '- Phỏng vấn nhận việc ngay\r\n- Nghiên cứu và phân tích thị trường, xác định các cơ hội phát triển kinh doanh mới.\r\n- Xây dựng và duy trì mối quan hệ với khách hàng hiện tại và tiềm năng.\r\n- Thực hiện các hoạt động bán hàng và marketing để đạt được mục tiêu doanh số được giao.\r\n- Phối hợp với các bộ phận liên quan để triển khai các chương trình khuyến mãi, sự kiện bán hàng.\r\n- Báo cáo định kỳ về tình hình thị trường, kết quả kinh doanh và các hoạt động phát triển thị trường.', '1', 'Cao đẳng', 'Tin học văn phòng, sử dụng phần mềm quản lý cơ bản', 'Cẩn thận, trung thực, ham học hỏi', 'Sẵn sàng học hỏi và tuân thủ quy trình', 7, '- Lương tháng 13.\r\n- Thưởng lễ, Tết.\r\n- BHXH, BHTN theo quy định của pháp luật.\r\n– Tối thiểu 12 ngày phép năm\r\n- Cơ hội phát triển nghề nghiệp trong môi trường năng động, chuyên nghiệp.\r\n- Tham gia các hoạt động team building, du lịch hàng năm.', 'Thưởng doanh số theo kết quả công việc', 'Đội ngũ quản lý hỗ trợ sát sao', 'Toàn thời gian cố đị', 'hot', 'Msa Ba Vì. Msa Sơn Tây', 'Theo lịch phân công', '2026-12-31', 'published', '2026-06-17 22:00:27', 2, '2026-06-17 14:49:01', '2026-07-22 21:24:00'),
(29, 18, 0, 37, 28, 'Trưởng Phòng Chất Lượng Tại Bến Cát (Đi Làm Ngay)', 1, '- Chịu trách nhiệm về toàn bộ chất lượng sản phẩm nhà máy, nhân sự trong bộ phận QA/ QC\r\n- Chịu trách nhiệm chất lượng hàng hoá và làm việc với khách hàng về chất lượng\r\n- Tổ chức xây dựng hệ thống quản lý an toàn thực phẩm (HTQL ATTP) của nhà máy và sọan thảo và phân phối các tài liệu liên quan. Lập sổ tay quản lý chất lượng, tài liệu quản lý chất lượng. Đề xuất các chương trình cải tiến HTQL ATTP.\r\n- Cải tiến liên tục để hoàn thiện hệ thống tài liệu, hồ sơ.\r\n- Lên kế hoạch & thực hiện bồi dưỡng kiến thức quản lý chất lượng cho nhân viên trong công ty và kiểm tra hiệu quả việc đào tạo.\r\n- Chi tiết cụ thể hơn sẽ trao đổi lúc phỏng vấn', '6', 'Cao đẳng', 'Biết sử dụng email, bảng tính và các công cụ cộng tác trực tuyến', 'Chủ động, trách nhiệm, chịu được áp lực', 'Có thể đi công tác khi cần', 8, '- Xét duyệt tăng lương ít nhất 1 lần/năm.\r\n\r\n- Thưởng: Các ngày Lễ, ngày Tết… theo kết quả hoạt động kinh doanh.\r\n- Các chế độ trợ cấp, phúc lợi liên quan khác theo quy chế lương công ty.\r\n- Được tham gia BHXH sau thời gian thử việc. BHXH, BHYT và chế độ phúc lợi khác theo quy định của pháp luật. \r\n- Được thưởng cuối năm tùy vào kết quả kinh doanh công ty.\r\n- Ăn trưa tại công ty.', 'Thưởng dự án khi hoàn thành mục tiêu', 'Quy trình rõ ràng, hỗ trợ đào tạo', 'Toàn thời gian cố đị', 'hot', 'Số 99, Tổ 5, Phường Long Nguyên, TPHCM, Bến Cát', 'Ca hành chính', '2026-08-25', 'published', '2026-06-17 22:00:27', 2, '2026-06-17 14:49:01', '2026-07-23 04:59:46'),
(30, 20, 0, 46, 28, 'Nhân Viên Pháp Lý - Tố Tụng- Thu Nhập Đến 20Tr', 2, 'Tiếp nhận và xử lý các hồ sơ pháp lý liên quan đến hoạt động kinh doanh bất động sản của công ty.\r\nSoạn thảo, kiểm tra tính pháp lý của các hợp đồng, văn bản liên quan đến giao dịch bất động sản.\r\nTư vấn pháp luật cho các phòng ban trong công ty về các vấn đề liên quan đến bất động sản.\r\nCập nhật và phổ biến các quy định pháp luật mới liên quan đến lĩnh vực bất động sản.\r\nTham mưu pháp lý cho Trưởng phòng & Ban Giám đốc\r\nĐàm phán, tư vấn hợp đồng và hỗ trợ khách hàng\r\nGiải quyết tranh chấp, khiếu nại, hồ sơ tố tụng\r\nCó kinh nghiệm mảng tố tụng và Thanh Lý Hợp đồng', '1', 'Đại học', 'Thành thạo công cụ làm việc liên quan đến vị trí ứng tuyển', 'Cẩn thận, trung thực, ham học hỏi', 'Có tinh thần trách nhiệm cao', 6, 'Lương tháng 13.\r\nThưởng lễ, Tết.\r\nBHXH, BHYT, BHTN theo quy định của pháp luật.\r\nCơ hội phát triển nghề nghiệp trong môi trường năng động, chuyên nghiệp.\r\nTham gia các hoạt động team building, du lịch hàng năm.', 'Thưởng hiệu suất và thưởng lễ Tết', 'Đội ngũ quản lý hỗ trợ sát sao', 'Toàn thời gian cố đị', 'hot', 'Lai Châu', 'Theo lịch phân công', '2026-08-01', 'published', '2026-06-17 22:00:27', 3, '2026-06-17 14:49:01', '2026-07-23 03:53:37'),
(31, 3, 0, 10, 28, 'Nhân Viên Hành Chính Nhân Sự - Yêu Cầu Từ 2 Năm Kinh Nghiệm', 2, 'Thực hiện công tác tuyển dụng: tiếp nhận nhu cầu, đăng tuyển, sàng lọc hồ sơ, sắp xếp phỏng vấn và tiếp nhận nhân sự mới.\r\nTheo dõi chấm công, tính công, quản lý hồ sơ nhân sự, hợp đồng lao động và các thủ tục liên quan đến BHXH, BHYT, BHTN.\r\nThực hiện các công việc hành chính: quản lý văn bản, hồ sơ, văn phòng phẩm, tài sản và trang thiết bị của công ty.\r\nTheo dõi, giám sát việc thực hiện nội quy lao động, quy định công ty và xử lý các thủ tục nhân sự phát sinh.\r\nQuản lý, theo dõi các hồ sơ về PCCC, ATVSLĐ, VSATTP, khám sức khỏe định kỳ và các hồ sơ pháp lý liên quan.\r\nTheo dõi các hoạt động hành chính tại nhà máy/văn phòng như điện, nước, vệ sinh và các công việc phát sinh.\r\nThực hiện các công việc khác theo sự phân công của Ban Giám đốc.', '2', 'Đại học', 'Có khả năng đọc hiểu tài liệu, tổng hợp số liệu và lập báo cáo', 'Tư duy dịch vụ khách hàng', 'Có thể đi công tác khi cần', 6, 'Thu nhập cạnh tranh, thỏa thuận theo năng lực và kinh nghiệm.\r\nHưởng lương tháng 13, thưởng Lễ, Tết và thưởng theo kết quả công việc.\r\nTham gia đầy đủ BHXH, BHYT, BHTN theo quy định.\r\nĐược đào tạo, nâng cao chuyên môn và kỹ năng nghiệp vụ.\r\nMôi trường làm việc chuyên nghiệp, ổn định, cơ hội phát triển và thăng tiến lâu dài.\r\nHưởng đầy đủ các chế độ phúc lợi khác theo chính sách của công ty.', 'Thưởng cuối năm theo quy định công ty', 'Quy trình rõ ràng, hỗ trợ đào tạo', 'Toàn thời gian cố đị', 'hot', 'Lô A1, KCN Tây Bắc Củ Chi, Củ Chi', 'Theo lịch phân công', '2026-07-31', 'published', '2026-06-17 22:00:27', 1, '2026-06-17 14:49:01', '2026-07-23 03:36:42'),
(32, 6, 0, 4, 27, 'Nhân Viên Sale Marketing', 1, 'Tư vấn và chốt đăng ký khóa học cho học viên/phụ huynh (trực tiếp, điện thoại, online).\r\nChăm sóc, theo dõi nguồn lead từ Facebook, hotline, Zalo, đi trường; cập nhật CRM.\r\nHỗ trợ quy trình nhập học: test đầu vào, xếp lớp, hướng dẫn thanh toán.\r\nTham gia marketing trực tiếp: setup booth, phát tờ rơi, quảng bá thương hiệu.\r\nKhảo sát thị trường, xây dựng mối quan hệ với trường học, giáo viên.\r\nHỗ trợ tổ chức sự kiện và phối hợp triển khai các chiến dịch quảng cáo.', '2', 'Đại học', 'Thành thạo công cụ làm việc liên quan đến vị trí ứng tuyển', 'Giao tiếp tốt, làm việc nhóm', 'Có tinh thần trách nhiệm cao', 6, 'Thu nhập: Lương cứng + phụ cấp + hoa hồng hấp dẫn theo KPIs.\r\nThưởng nóng theo các chiến dịch tuyển sinh.\r\nĐược đào tạo về các kỹ năng mềm, kỹ năng tư vấn, kỹ năng sale.\r\nMôi trường làm việc năng động, cơ hội thăng tiến lên Team Leader – Trưởng phòng Sale-Marketing.\r\nĐầy đủ chế độ BHXH theo luật lao động và chính sách công ty.', 'Thưởng cuối năm theo quy định công ty', 'Đội ngũ quản lý hỗ trợ sát sao', 'Toàn thời gian cố đị', 'hot', 'Đường 16/1, Trương Định, phường Tam Hiệp, Biên Hòa', 'Linh hoạt theo ca', '2026-08-10', 'published', '2026-06-17 22:00:27', 2, '2026-06-17 14:49:01', '2026-07-23 00:33:45'),
(33, 7, 0, 9, 28, 'Nhân Viên Văn Phòng - Đi Làm Ngay', 2, '- Cấp vật tư cho kỹ thuật làm việc.\r\n- Đặt xe lấy hàng và giao hàng.\r\n- Liên hệ nhà cung cấp mua hàng, lấy hàng.\r\n- Chấm công, tính lương nhân viên hàng tháng.\r\n- Quản lý tài sản, trang thiết bị của công ty.\r\n- Mua sắm, cấp phát văn phòng phẩm, thiết bị văn phòng.\r\n- Cấp phát đồng phục, bảo hộ lao động cho người lao động. \r\n- Nhập liệu, lưu trữ hồ sơ cho toàn bộ công nhân viên công ty \r\n- Lập báo giá, hợp đồng gửi khách hàng và một số công việc liên quan.\r\n- Chi tiết trao đổi thêm khi phỏng vấn.', '1', 'Cao đẳng', 'Tin học văn phòng, sử dụng phần mềm quản lý cơ bản', 'Chủ động, trách nhiệm, chịu được áp lực', 'Ưu tiên ứng viên có kinh nghiệm thực tế', 5, '- Lương: Thương lượng (từ 9 - 11 triệu) tuỳ theo năng lực và kinh nghiệm.\r\n- Cơ hội thăng tiến tốt.\r\n- Tham gia BHXH, BHTN, BHYT theo đúng quy định nhà nước\r\n- Các chế độ sinh nhật, teambuilding...', 'Thưởng doanh số theo kết quả công việc', 'Đội ngũ quản lý hỗ trợ sát sao', 'Toàn thời gian cố đị', 'hot', 'Cao Bằng', 'Theo lịch phân công', '2026-11-20', 'published', '2026-06-17 22:00:27', 2, '2026-06-17 14:49:01', '2026-07-23 00:11:48'),
(34, 10, 0, 26, 28, 'Kỹ Sư Cơ Khí', 2, '1. Thiết kế và phát hành bản vẽ kỹ thuật:\r\n\r\n- Thực hiện thiết kế, kiểm tra và phát hành bản vẽ kỹ thuật (2D, 3D) phục vụ công tác báo giá và thi công.\r\n\r\n- Tính toán khối lượng, lập kế hoạch nhân sự và đề xuất phương án kỹ thuật phù hợp.\r\n\r\n2. Hỗ trợ kỹ thuật trong quá trình thi công:\r\n\r\n- Phối hợp với các phòng ban như Phòng Dự án và Phòng Thương mại để đảm bảo bản vẽ và phương án thi công đáp ứng yêu cầu khách hàng.\r\n\r\n- Giám sát quá trình thi công, hỗ trợ giải quyết các vấn đề kỹ thuật phát sinh, đề xuất phương án khắc phục sai sót.\r\n\r\n3. Nghiên cứu, cải tiến và đánh giá rủi ro:\r\n\r\n- Tham gia nghiên cứu, cải tiến kỹ thuật, đề xuất phương án nâng cao hiệu quả thi công và tối ưu hóa chi phí.\r\n\r\n\'-  Tham gia đánh giá rủi ro, nhận diện mối nguy kỹ thuật và đề xuất phương án phòng ngừa.', '2', 'Đại học', 'Thành thạo công cụ làm việc liên quan đến vị trí ứng tuyển', 'Tư duy dịch vụ khách hàng', 'Có thể đi công tác khi cần', 8, '- Môi trường làm việc chuyên nghiệp, năng động với cơ hội học hỏi và phát triển nghề nghiệp rõ ràng.\r\n\r\n- Được đào tạo nâng cao kiến thức chuyên môn và các kỹ năng mềm cần thiết.\r\n\r\n- Tham gia đầy đủ BHXH, BHYT, BHTN theo quy định của pháp luật Việt Nam.\r\n\r\n- Lương tháng 13 và thưởng hiệu suất công việc theo kết quả kinh doanh của công ty.\r\n\r\n- Cơ hội tham gia các hoạt động team building, du lịch hàng năm của công ty.', 'Thưởng doanh số theo kết quả công việc', 'Môi trường trẻ trung, năng động', 'Toàn thời gian cố đị', 'hot', 'Vĩnh Long', 'Thứ 2 - Thứ 6', '2026-09-30', 'published', '2026-06-17 22:00:27', 3, '2026-06-17 14:49:01', '2026-07-22 23:14:53'),
(35, 6, 0, 42, 27, 'Chuyên Viên Phát Triển Chương Trình Giảng Dạy', 2, '- Xây dựng và phát triển các chương trình học, giáo trình, tài liệu giảng dạy cho các khóa học của trung tâm, đảm bảo tính cập nhật và phù hợp với xu hướng giáo dục hiện đại.\r\n- Nghiên cứu, đánh giá các phương pháp giảng dạy mới, tích hợp công nghệ vào quá trình đào tạo để nâng cao hiệu quả học tập.\r\n- Điều phối và quản lý đội ngũ giáo viên, phân công lịch giảng dạy, hỗ trợ chuyên môn và đánh giá hiệu suất làm việc của giáo viên.\r\n- Tổ chức các buổi tập huấn, bồi dưỡng nghiệp vụ sư phạm định kỳ cho giáo viên nhằm nâng cao chất lượng giảng dạy.\r\n- Phối hợp với phòng ban khác để triển khai các hoạt động tuyển sinh, tư vấn khóa học và hỗ trợ học viên trong suốt quá trình học tập.\r\n- Đảm bảo chất lượng đào tạo, theo dõi sát sao tiến độ học tập của học viên và đưa ra các giải pháp cải thiện khi cần thiết.', '2', 'Đại học', 'Thành thạo công cụ làm việc liên quan đến vị trí ứng tuyển', 'Cẩn thận, trung thực, ham học hỏi', 'Không yêu cầu kinh nghiệm, sẽ được đào tạo', 7, '- Môi trường làm việc năng động, chuyên nghiệp và thân thiện, khuyến khích sự sáng tạo và phát triển cá nhân.\r\n- Cơ hội thăng tiến rõ ràng lên các vị trí quản lý cấp cao hơn trong tổ chức.\r\n- Được tham gia các khóa đào tạo, bồi dưỡng nghiệp vụ chuyên sâu để nâng cao năng lực và kiến thức.\r\n- Hưởng đầy đủ các chế độ phúc lợi theo quy định của pháp luật Việt Nam (BHXH, BHYT, BHTN).\r\n- Thưởng lương tháng 13 và các khoản thưởng hiệu suất công việc hàng quý/năm dựa trên kết quả kinh doanh.\r\n- Tham gia các hoạt động team building, du lịch hàng năm cùng công ty để tăng cường gắn kết.\r\n- Được hưởng các chính sách ưu đãi đặc biệt cho nhân viên và người thân khi sử dụng các dịch vụ giáo dục của trung tâm.', 'Thưởng chuyên cần và thưởng sáng kiến', 'Đội ngũ quản lý hỗ trợ sát sao', 'Toàn thời gian cố đị', 'hot', '16/1, Đường Trương Định, KP 2, Phường Tam Hiệp, Biên Hòa', 'Thứ 2 - Thứ 6', '2026-08-26', 'published', '2026-06-17 22:00:27', 3, '2026-06-17 14:49:01', '2026-07-23 00:31:11'),
(36, 12, 0, 18, 28, 'Nhân Viên Kho / Điều Khối - Binh Dương', 10, '- Nhận và quét mã hàng hóa lên hệ thống, đóng gói hàng hóa, dán tem, xử lý hàng trả.\r\n- Nhận hàng từ xe tải, xuống tải hàng (bao hàng nặng ~20-50kg).\r\n- Phân chia hàng hóa theo các phường, các quận.\r\n- Quản lý hàng hóa trên hệ thống, đảm bảo tiến độ việc xuất nhập hàng.\r\n- Báo cáo xuất nhập hàng, xử lý phát sinh liên quan đến đơn hàng (hư hỏng, bể vỡ, thất lạc hàng).\r\n- Điều phối Shipper giao hàng tại trạm.\r\n- Xoay ca theo tuần (6 ngày/tuần) theo sắp xếp, 2 ca chính: \r\nSáng 05:00 - 14:00, Tối 13:00 - 22:00, Ca đêm 10:00 - 06:00 (hôm sau) không liên tục.', '1', 'Trung học phổ thông', 'Thành thạo công cụ làm việc liên quan đến vị trí ứng tuyển', 'Chủ động, trách nhiệm, chịu được áp lực', 'Ưu tiên ứng viên có kinh nghiệm thực tế', 6, '11111111', 'Thưởng dự án khi hoàn thành mục tiêu', 'Môi trường trẻ trung, năng động', 'full_time', 'hot', 'Tân Uyên, Thủ Dầu Một, Dĩ An', 'Theo lịch phân công', '2026-07-30', 'published', '2026-06-17 22:00:27', 7, '2026-06-17 14:49:01', '2026-07-22 20:34:08'),
(37, 3, 0, 103, 28, 'Giám Đốc Nhà Máy', 2, '1. Quản lý hoạt động sản xuất\r\nLập kế hoạch và tổ chức sản xuất theo mục tiêu kinh doanh và nhu cầu của khách hàng.\r\nĐiều hành toàn bộ hoạt động của các bộ phận: Sản xuất, Kỹ thuật, Bảo trì, Chất lượng (QA/QC), Kho vận và các bộ phận liên quan.\r\nĐảm bảo kế hoạch sản xuất được thực hiện đúng tiến độ, đạt năng suất và chất lượng yêu cầu.\r\n2. Quản lý vận hành nhà máy\r\nXây dựng và cải tiến quy trình vận hành nhằm nâng cao hiệu quả sản xuất.\r\nTheo dõi, phân tích các chỉ số KPI về năng suất, chất lượng, tỷ lệ lỗi, hiệu suất thiết bị (OEE), chi phí sản xuất và tỷ lệ giao hàng đúng hạn.\r\nTriển khai các chương trình Lean Manufacturing, 5S, Kaizen hoặc TPM để tối ưu hoạt động.\r\n3. Quản lý chất lượng\r\nĐảm bảo hệ thống quản lý chất lượng được duy trì và cải tiến liên tục.\r\nPhối hợp xử lý các vấn đề về chất lượng sản phẩm và khiếu nại của khách hàng.\r\nĐảm bảo tuân thủ các tiêu chuẩn chất lượng và quy định của ngành.\r\n4. Quản lý chi phí và ngân sách\r\nXây dựng và kiểm soát ngân sách vận hành nhà máy.\r\nTối ưu chi phí sản xuất, giảm lãng phí và nâng cao hiệu quả sử dụng nguồn lực.\r\nPhân tích hiệu quả hoạt động và đề xuất các giải pháp cải tiến.\r\n5. Quản lý nhân sự\r\nTuyển dụng, đào tạo và phát triển đội ngũ quản lý và nhân viên nhà máy.\r\nThiết lập mục tiêu, đánh giá hiệu quả công việc và xây dựng đội ngũ kế thừa.\r\nXây dựng môi trường làm việc tích cực, nâng cao tinh thần và năng suất lao động.\r\n6. An toàn, môi trường và tuân thủ\r\nĐảm bảo tuân thủ các quy định về an toàn lao động, phòng cháy chữa cháy và bảo vệ môi trường.\r\nTriển khai các chương trình an toàn và giảm thiểu rủi ro trong sản xuất.\r\nĐảm bảo nhà máy đáp ứng các quy định pháp luật và tiêu chuẩn của khách hàng.\r\n7. Báo cáo và phối hợp\r\nBáo cáo định kỳ kết quả hoạt động của nhà máy cho Ban Tổng Giám đốc.\r\nPhối hợp với các phòng ban như Kinh doanh, Chuỗi cung ứng, Mua hàng, R&D và Tài chính để đảm bảo hoạt động sản xuất hiệu quả.\r\nĐề xuất các kế hoạch đầu tư, mở rộng công suất và cải tiến công nghệ.', '5', 'Đại học', 'Biết sử dụng email, bảng tính và các công cụ cộng tác trực tuyến', 'Tư duy dịch vụ khách hàng', 'Có thể đi công tác khi cần', 11, 'Thu nhập cạnh tranh, gồm lương thỏa thuận theo năng lực và thưởng KPI, thưởng theo kết quả kinh doanh.\r\nThưởng hiệu quả hoạt động, thưởng cuối năm, thưởng Lễ/Tết và các chế độ đãi ngộ hấp dẫn.\r\nTham gia đầy đủ BHXH, BHYT, BHTN theo quy định.\r\nĐược khám sức khỏe định kỳ, tham gia du lịch, team building và các chương trình đào tạo nâng cao năng lực quản lý.\r\nMôi trường làm việc chuyên nghiệp, hiện đại, có cơ hội tham gia các dự án cải tiến, mở rộng nhà máy và phát triển lên các vị trí quản lý cấp cao.', 'Thưởng doanh số theo kết quả công việc', 'Văn phòng chuyên nghiệp, thân thiện', 'Toàn thời gian cố đị', 'hot', 'Tân Hội, Củ Chi', 'Linh hoạt theo ca', '2026-11-28', 'published', '2026-06-17 22:00:27', 2, '2026-06-17 14:49:01', '2026-07-23 03:31:07'),
(38, 11, 0, 52, 28, 'Nhân Viên Phục Vụ Nhà Hàng - Bình Thạnh', 20, 'Setup bàn ăn theo đúng tiêu chuẩn\r\nĐón tiếp và hướng dẫn khách vào bàn, giới thiệu menu nhà hàng\r\nDọn dẹp, sắp xếp lại khu vực phục vụ\r\nHỗ trợ khách hàng trong suốt bữa ăn, xử lý các yêu cầu phát sinh', '1', 'Cao đẳng', 'Tin học văn phòng, sử dụng phần mềm quản lý cơ bản', 'Chủ động, trách nhiệm, chịu được áp lực', 'Sẵn sàng học hỏi và tuân thủ quy trình', 11, '- Mức thu nhập hấp dẫn\r\nParttime: 26k - 39k/ giờ + tips + thưởng\r\nFulltime: 7tr - 10tr/ tháng + phụ cấp cơm + tips + thưởng\r\n- Quà tặng/ tiền thưởng và các chương trình, hoạt động vào các dịp Lễ, Tết.\r\n- Tham gia BHXH, BHYT, BHTN đầy đủ\r\n- Ưu đãi 20% khi sử dụng dịch vụ tại nhà hàng thuộc hệ thống', 'Thưởng doanh số theo kết quả công việc', 'Quy trình rõ ràng, hỗ trợ đào tạo', 'Tùy', 'hot', 'TTTM Vincom Thảo Điền, Thủ Đức', 'Thứ 2 - Thứ 6', '2026-09-30', 'published', '2026-06-17 22:00:27', 3, '2026-06-17 14:49:01', '2026-07-22 22:25:07'),
(39, 3, 0, 25, 28, 'Nhân Viên Kỹ Thuật Điện - Yêu Cầu Từ 1 Năm Kinh Nghiệm', 3, 'Lắp ráp dây chuyền máy móc  thực phẩm như bánh, kẹo… mà công ty cung cấp cho khách hàng.\r\nBảo trì, sửa chữa các thiết bị khi có sự cố hư hỏng phản ánh từ khách hàng\r\nThực hiện các công việc khác theo yêu cầu cấp trên', '1', 'Trung cấp', 'Kỹ năng chuyên môn đúng vị trí, thao tác nhanh và cẩn thận', 'Tư duy dịch vụ khách hàng', 'Ưu tiên ứng viên có kinh nghiệm thực tế', 6, 'Tham gia BHXH theo qui định \r\nLương tháng 13 theo thời gian làm việc\r\nCơ hội thăng tiến\r\nLàm việc môi trường năng động', 'Thưởng doanh số theo kết quả công việc', 'Môi trường trẻ trung, năng động', 'Toàn thời gian cố đị', 'hot', 'Tân An Hội, Củ Chi', 'Thứ 2 - Thứ 6', '2026-07-31', 'published', '2026-06-17 22:00:27', 2, '2026-06-17 14:49:01', '2026-07-23 03:25:32'),
(40, 3, 0, 25, 28, 'Nhân Viên Kỹ Thuật Điện (Đi Làm Ngay)', 3, 'Lắp ráp dây chuyền máy móc  thực phẩm như bánh, kẹo… mà công ty cung cấp cho khách hàng.\r\nBảo trì, sửa chữa các thiết bị khi có sự cố hư hỏng phản ánh từ khách hàng\r\nThực hiện các công việc khác theo yêu cầu cấp trên', '1', 'Trung cấp', 'Có khả năng đọc hiểu tài liệu, tổng hợp số liệu và lập báo cáo', 'Chủ động, trách nhiệm, chịu được áp lực', 'Có tinh thần trách nhiệm cao', 6, 'Tham gia BHXH theo qui định \r\nLương tháng 13 theo thời gian làm việc\r\nCơ hội thăng tiến\r\nLàm việc môi trường năng động', 'Thưởng hiệu suất và thưởng lễ Tết', 'Đội ngũ quản lý hỗ trợ sát sao', 'Toàn thời gian cố đị', 'hot', 'Tân An Hội, Củ Chi', 'Thứ 2 - Thứ 6', '2026-07-31', 'published', '2026-06-17 22:00:27', 6, '2026-06-17 14:49:01', '2026-07-23 03:21:30'),
(41, 4, 0, 57, 1, 'Nhân Viên Phục Vụ (Long Biên, Hà Nội)', 5, '• Phục vụ đồ ăn, thức uống cho khách\r\n• Đón tiếp khách hàng tại khu vực bàn, hướng dẫn họ đến bàn và giới thiệu thực đơn đồ ăn, thức uống.\r\n• Ghi order và truyền đạt yêu cầu đến bếp và quầy bar, đảm bảo order được thực hiện chính xác và kịp thời.\r\n• Mang đồ ăn, thức uống đến bàn khách hàng một cách chuyên nghiệp, đảm bảo đồ ăn nóng hổi và đồ uống tươi ngon khi đến tay khách.\r\n• Đáp ứng các yêu cầu của khách hàng trong suốt quá trình họ ở tại bàn, bar như : bổ sung đồ uống, thay đổi món ăn, hoặc cung cấp thêm thông tin về thực đơn.\r\n• Xử lý các tình huống phát sinh như khách hàng không hài lòng với món ăn, thức uống, báo ngay cho tổ trưởng hoặc trưởng bộ phận để có hướng giải quyết thích hợp.\r\n• Tư vấn thực đơn: Giới thiệu và tư vấn cho khách hàng các món ăn, thức uống nổi bật, các chương trình khuyến mãi của nhà hàng.', '1', 'Trung cấp', 'Thành thạo công cụ làm việc liên quan đến vị trí ứng tuyển', 'Tư duy dịch vụ khách hàng', 'Có thể đi công tác khi cần', 5, '• Được hưởng lương, thưởng theo quy định của khách sạn và tổng công ty,\r\n• Lương tháng 13, thưởng doanh thu, phép năm, sinh nhật.\r\n• Có kinh nghiệm dày dặn, bắt nhịp tốt, mức lương sẽ thương lượng điều chỉnh, đề xuất bổ nhiệm ( nếu cần)\r\n• Được đóng bảo hiểm xã hội, bảo hiểm y tế, bảo hiểm thất nghiệp, trợ cấp thôi việc theo quy định của pháp luật.\r\n• Môi trường làm việc thân thiện, năng động.\r\n• Có hỗ trợ nhà ở, có ký túc xá cho CBCNV ở xa\r\n• Thời gian làm việc linh hoạt theo 2 ca :\r\nCa 1: Từ 6:00-14:00\r\nCa 2: 14:00-22:00\r\nCó ngày nghỉ hàng tuần( không cố định vào Chủ Nhật). Nghỉ Lễ, Tết theo quy định.', 'Thưởng doanh số theo kết quả công việc', 'Môi trường trẻ trung, năng động', 'Toàn thời gian cố đị', 'hot', '767 Nguyễn Văn Linh, Long Biên', 'Thứ 2 - Thứ 7', '2026-08-15', 'published', '2026-06-17 21:59:41', 3, '2026-06-17 14:49:01', '2026-07-23 01:55:33'),
(42, 18, 0, 37, 28, 'Tổ Trưởng Sản Xuất - Ưu Tiên Nhận Việc Ngay', 5, 'Quản lý nhân sự tổ Sơ chế/ Phối liệu/ Chiết rót được giao, đảm bảo số lượng công nhân đi làm đúng theo định biên nhân sự công ty.\r\nNhận kế hoạch sản xuất và lên dự kiến số lượng hàng hóa phục vụ cho công tác sản xuất theo đơn hàng kế hoạch;\r\nKiểm soát số lượng và hao hụt của công đoạn Sơ chế/ Phối liệu/ Chiết rót trong ca theo yêu cầu của Quản lý;\r\nĐào tạo quy trình và giám sát công nhân viên tuân thủ đúng các thao tác kỹ thuật cho từng vị trí công việc;\r\nĐảm bảo máy móc, trang thiết bị khu vực Sơ chế/ Phối liệu/ Chiết rót được sử dụng và bảo quản hiệu quả, tuân thủ VSATTP và tiêu chuẩn kỹ thuật của công ty;\r\nChịu trách nhiệm đáp ứng sản lượng và chất lượng mẻ hàng trong ca sản xuất theo kế hoạch và tiêu chuẩn của đơn hàng;\r\nBáo cáo cho Quản lý/ Trưởng ca Sản xuất về các hoạt động và các vấn đề phát sinh diễn ra trong khu vực quản lý thông qua các báo cáo Sơ chế/ Phối liệu/ Chiết rót và báo cáo sự việc định kỳ hàng ngày ở mỗi ca;\r\nPhối hợp triển khai các hoạt động phong trào Đoàn thể và các sự kiện công ty, phối hợp với các bộ phận khác hỗ trợ công việc vì mục đích xây dựng chung;\r\nThực hiện các công việc theo sự sắp xếp của Quản lý.', '1', 'Cao đẳng', 'Có khả năng đọc hiểu tài liệu, tổng hợp số liệu và lập báo cáo', 'Giao tiếp tốt, làm việc nhóm', 'Có thể đi công tác khi cần', 6, 'Lương: từ 12-15 triệu (Thỏa thuận theo năng lực)\r\nĐược tham gia BHXH, BHYT, BHTN theo quy định và các chế độ hiếu hỷ, tứ thân phụ mẫu v.vv…\r\nĐược hưởng các chế độ theo luật quy định, nghỉ Lễ Tết có hưởng lương và thưởng dựa trên tình hình hoạt động kinh doanh của Công ty;\r\nThưởng lương tháng 13, 14 … theo quy định công ty;\r\nĐược đào tạo nâng cao trình độ chuyên môn và cơ hội phát triển bản thân;\r\nMôi trường làm việc thân thiện, năng động, tham gia các chương trình của công ty tổ chức, các hoạt động nâng cao tinh thần toàn thể CB-CNV;\r\nĂn trưa tại công ty và ăn chiều nếu có tăng ca.', 'Thưởng doanh số theo kết quả công việc', 'Quy trình rõ ràng, hỗ trợ đào tạo', 'Toàn thời gian cố đị', 'hot', 'Số 999/1C, Đường Nguyễn Thị Minh Khai, Khu phố Tân Thắng, Phường Tân Bình, Dĩ An', 'Thứ 2 - Thứ 6', '2026-07-31', 'published', '2026-06-17 21:59:41', 4, '2026-06-17 14:49:01', '2026-07-23 05:01:55'),
(43, 12, 0, 109, 4, 'Tư vấn khách hàng', 3, 'Chủ động đón tiếp, tư vấn và hỗ trợ khách hàng tại cửa hàng.\r\nTư vấn sản phẩm & dịch vụ phù hợp với nhu cầu của khách hàng.\r\nGiải quyết các thắc mắc, khiếu nại một cách chuyên nghiệp, mang lại trải nghiệm tốt nhất cho khách hàng.\r\nĐảm bảo hoàn thành chỉ tiêu doanh số hàng tháng.', '1', 'Trung học', 'Thành thạo công cụ làm việc liên quan đến vị trí ứng tuyển', 'Kỹ năng xử lý tình huống', 'Ưu tiên ứng viên có kinh nghiệm thực tế', 6, 'Lộ trình thăng tiến rõ ràng, phát triển sự nghiệp tại tập đoàn bán lẻ hàng đầu Việt Nam.\r\nĐược đào tạo bài bản & miễn phí trước khi bắt đầu công việc.\r\nMôi trường làm việc trẻ trung, năng động, chuyên nghiệp.\r\nThu nhập hấp dẫn theo năng lực, thưởng hiệu quả kinh doanh, lương tháng 13.\r\nChế độ BHYT, BHXH, BHTN đầy đủ theo luật lao động.\r\nKhám sức khỏe định kỳ, teambuilding hàng năm.\r\nTham gia các hoạt động nội bộ: hội thao, văn nghệ, tất niên, tân niên…', 'Thưởng cuối năm theo quy định công ty', 'Quy trình rõ ràng, hỗ trợ đào tạo', 'Toàn thời gian cố đị', 'hot', 'Phòng Nhân sự - 318 Lê Duẩn, Thanh Khê', 'Thứ 2 - Thứ 7', '2026-07-30', 'published', '2026-06-17 21:59:41', 4, '2026-06-17 14:49:01', '2026-07-22 21:48:05'),
(44, 11, 0, 77, 22, 'Nhân viên SEO', 1, 'Tư vấn, hỗ trợ khách hàng, cập nhật thông tin và chăm sóc sau dịch vụ', '1', 'college', 'Kỹ năng chuyên môn đúng vị trí, thao tác nhanh và cẩn thận', 'Kỹ năng xử lý tình huống', 'Có thể đi công tác khi cần', 3, 'Môi trường ổn định, đồng nghiệp hỗ trợ', 'Thưởng dự án khi hoàn thành mục tiêu', 'Quy trình rõ ràng, hỗ trợ đào tạo', 'remote', 'hot', 'Quảng Ngãi', 'Thứ 2 - Thứ 7', '2026-09-10', 'published', '2026-06-17 21:59:41', 4, '2026-06-17 14:49:01', '2026-06-17 21:59:41');
INSERT INTO `hicrm_job_posts` (`id`, `employer_id`, `candidate_id`, `job_category_id`, `province_id`, `title`, `quantity`, `job_description`, `experience_years`, `degree_required`, `professional_skills`, `soft_skills`, `other_requirements`, `salary_id`, `benefits_description`, `rewards_description`, `work_environment`, `work_type`, `job_post_type`, `address_detail`, `working_time`, `deadline`, `status`, `published_at`, `views_count`, `created_at`, `updated_at`) VALUES
(45, 20, 0, 6, 28, 'Thực Tập Sinh Kinh Doanh_Hỗ Trợ Mộc+Số Liệu_Không Kpi', 6, '- Tiếp cận và chăm sóc tập khách hàng có sẵn do công ty cung cấp.\r\n- Liên hệ, tư vấn và giải đáp các thắc mắc của khách hàng về sản phẩm, dịch vụ.\r\n- Phối hợp với các phòng ban để thông báo chính sách, ưu đãi, chương trình khuyến mãi của công ty đến khách hàng.\r\n- Hỗ trợ Bộ phận Kinh Doanh trong các hoạt động chăm sóc khách hàng.', '0', 'Cao đẳng', 'Tin học văn phòng, sử dụng phần mềm quản lý cơ bản', 'Tư duy dịch vụ khách hàng', 'Không yêu cầu kinh nghiệm, sẽ được đào tạo', 4, '- Công ty cung cấp Mộc đỏ và số liệu hỗ trợ làm báo cáo thực tập.\r\n- Lương cơ bản: 4.000.000-6.000.000 VNĐ/tháng.\r\n- Hưởng hoa hồng và thưởng theo hiệu quả công việc, không áp KPI.\r\n- Được đào tạo chuyên sâu về kỹ năng kinh doanh và chăm sóc khách hàng.\r\n- Có cơ hội trở thành nhân viên chính thức sau kỳ thực tập.', 'Thưởng hiệu suất và thưởng lễ Tết', 'Đội ngũ quản lý hỗ trợ sát sao', 'Toàn thời gian cố đị', 'hot', '1377 Hoàng Văn Thụ p8, Phú Nhuận', 'Thứ 2 - Thứ 6', '2026-10-22', 'published', '2026-06-17 21:59:41', 1, '2026-06-17 14:49:01', '2026-07-23 04:07:52'),
(46, 15, 0, 42, 28, 'Giáo Viên Mỹ Thuật', 6, 'Giảng dạy cho học sinh khối THCS, THPT theo sự phân công của trường.\r\nXây dựng kế hoạch giảng dạy theo phương pháp dạy học khám phá cho học sinh các khối lớp phù hợp với yêu cầu của bộ giáo dục, nhà trường.\r\nTham gia các hoạt động khóa học liên quan tới tổ bộ môn phụ trách tại trường.\r\nTheo dõi, đánh giá, giúp đỡ học sinh về học tập và tâm lý, giúp cho học sinh có một môi trường học tập hạnh phúc, học sinh luôn tiến bộ, yêu trường lớp và thầy cô.\r\nTham gia hoạt động đào tạo giáo viên và phát triển bản thân.', '2', 'Đại học', 'Biết sử dụng email, bảng tính và các công cụ cộng tác trực tuyến', 'Kỹ năng xử lý tình huống', 'Không yêu cầu kinh nghiệm, sẽ được đào tạo', 11, 'Hỗ trợ cơm trưa tại công ty;\r\nĐược hưởng các chế độ theo quy định của Luật Lao động hiện hành;\r\nThưởng vào tất cả các ngày Lễ & Tết trong năm: 01/01, Tết Âm lịch, Ngày GPMN (30/04) và QTLĐ (01/05), Lễ Quốc khánh (02/09), Lễ Khai giảng (05/9), 20/11 và kỷ niệm ngày thành lập trường\r\nƯu đãi học phí cho con toàn thể nhân viên theo học tại trường\r\nDu lịch nghỉ dưỡng hàng năm\r\nKhám sức khỏe định kỳ hàng năm\r\nThưởng theo đánh giá cuối năm học;\r\nLàm việc trong môi trường sư phạm, thân thiện, năng động, hiện đại, chuyên nghiệp theo chuẩn Quốc tế.', 'Thưởng chuyên cần và thưởng sáng kiến', 'Quy trình rõ ràng, hỗ trợ đào tạo', 'Toàn thời gian cố đị', 'hot', 'Phú Mỹ Hưng Campus 08 Đặng Đại Độ, P. Tân Phong, Quận 7', 'Thứ 2 - Thứ 7', '2027-01-11', 'published', '2026-06-17 21:59:41', 2, '2026-06-17 14:49:01', '2026-07-23 06:02:22'),
(47, 20, 0, 46, 28, 'Nhân Viên Pháp Lý Hợp Đồng', 2, 'Soạn thảo & Rà soát: Trực tiếp soạn thảo, hiệu đính hợp đồng thương mại và công văn; kiểm soát điều khoản và hạn chế rủi ro văn bản.\r\nChuẩn bị hồ sơ: Hồ sơ hợp đồng chuyển nhượng, hợp đồng ủy quyền và các giấy tờ liên quan.\r\nThủ tục pháp lý: Chuẩn bị, rà soát và hoàn thiện hồ sơ liên quan đến thủ tục hành chính và pháp lý bất động sản.\r\nQuản lý hồ sơ: Phân loại, lưu trữ khoa học, thu thập, sắp xếp toàn bộ tài liệu, hồ sơ công ty và hồ sơ dự án theo danh mục quản lý; đảm bảo tính chính xác và bảo mật.\r\nNghiên cứu & Tổng hợp: Tra cứu văn bản quy phạm pháp luật, án lệ; nghiên cứu hồ sơ nghiệp vụ, tổng hợp thông tin và dự thảo báo cáo, công văn theo phân công.\r\nGhi chép & Theo dõi: Tham gia các cuộc họp chuyên môn, ghi biên bản chi tiết; theo dõi tiến độ xử lý hồ sơ, cập nhật tình trạng, phối hợp luân chuyển hồ sơ giữa các bên và báo cáo cấp trên.\r\nPhát triển chuyên môn: Chủ động nghiên cứu, cập nhật các quy định pháp luật (Dân sự, Lao động, Hợp đồng); rèn luyện tư duy phân tích hồ sơ và kỹ năng áp dụng luật.\r\nThực hiện một số công tác chuyên trách khác được phân công', '1', 'Cao đẳng', 'Kỹ năng chuyên môn đúng vị trí, thao tác nhanh và cẩn thận', 'Tư duy dịch vụ khách hàng', 'Có thể đi công tác khi cần', 5, 'Thu nhập: từ 9 - 12 triệu Thỏa thuận theo năng lực. \r\nThưởng: Thưởng hiệu suất theo các nhiệm vụ được giao.\r\nChế độ: Phúc lợi cạnh tranh, ngày phép năm, du lịch thường niên, tham gia đầy đủ các quyền lợi theo Luật Lao động.\r\nĐào tạo & Phát triển: Được hỗ trợ phát triển kỹ năng, chuyên môn; có cơ hội thăng tiến tốt tương xứng với năng lực và đóng góp.', 'Thưởng chuyên cần và thưởng sáng kiến', 'Không gian làm việc ổn định, sạch sẽ', 'Toàn thời gian cố đị', 'hot', '1377 Hoàng Văn Thụ p8, Phú Nhuận', 'Thứ 2 - Thứ 6', '2026-10-26', 'published', '2026-06-17 21:59:41', 2, '2026-06-17 14:49:01', '2026-07-23 04:01:33'),
(48, 2, 0, 62, 28, 'Thực Tập Sinh Môi Trường (Nam)', 2, '• Hỗ trợ khảo sát, thiết kế, lắp đặt và vận hành hệ thống.\r\n• Bảo trì, kiểm tra và xử lý sự cố.\r\n• Hỗ trợ hồ sơ kỹ thuật và dự án.\r\n• Làm việc trực tiếp cùng đội ngũ kỹ sư.', '0', 'Trung học', 'Biết sử dụng email, bảng tính và các công cụ cộng tác trực tuyến', 'Tư duy dịch vụ khách hàng', 'Sẵn sàng học hỏi và tuân thủ quy trình', 3, '• Đào tạo thực tế.\r\n• Tham gia dự án tại nhà máy.\r\n• Hỗ trợ xác nhận thực tập.\r\n• Phụ cấp thực tập.\r\n• Ưu tiên tuyển dụng chính thức sau kỳ thực tập nếu thể hiện tốt.', 'Thưởng cuối năm theo quy định công ty', 'Môi trường trẻ trung, năng động', 'Toàn thời gian cố đị', 'hot', '15/4 Nguyễn Oanh, Phường 17, Gò Vấp', 'Thứ 2 - Thứ 7', '2026-08-03', 'published', '2026-06-17 21:59:41', 2, '2026-06-17 14:49:01', '2026-07-23 02:14:53'),
(49, 9, 0, 27, 14, 'Nhân Viên QC (Mảng SX Cơ Khí)', 2, '1. Lập kế hoạch và chuẩn bị kiểm tra chất lượng dự án\r\nPhối hợp với QA để thiết lập hệ thống kiểm tra và tài liệu biểu mẫu liên quan\r\n2. Kiểm tra vật tư, thiết bị đầu vào:\r\n- Kiểm tra chứng chỉ CO, CQ, bản vẽ chế tạo, tiêu chuẩn đóng gói\r\n- Lập biên bản kiểm tra đầu vào \r\n- Đề xuất cách xử lý đối với vật tư/thiết bị không phù hợp\r\n3. Giám sát và kiểm tra trong quá trình thi công & chế tạo\r\n- Theo dõi việc thi công tuân thủ theo ITP\r\n- Lập biên bản kiểm tra (Checklist, IR, NCR…)\r\n- Kiểm soát hàn, lắp đặt, căn chỉnh, đấu nối theo tiêu chuẩn\r\n4. Xử lý sự không phù hợp (NCR):\r\n- Ghi nhận các NCR (Non-Conformance Report)\r\n- Phối hợp với các bộ phận liên quan để xác định nguyên nhân, đề xuất biện pháp khắc phục\r\n- Theo dõi việc khắc phục và xác nhận hiệu lực\r\n5. Kiểm tra hoàn công và nghiệm thu:\r\n- Tham gia kiểm tra nghiệm thu từng giai đoạn (Partial Acceptance), hoàn công (Mechanical Completion), và FAT/SAT (nếu có)\r\n- Tổng hợp hồ sơ QC (QC dossier), lập danh mục hồ sơ bàn giao\r\n6. Thống kê, báo cáo và lưu trữ hồ sơ chất lượng:\r\n- Cập nhật log NCR, log checklist, log hồ sơ QC hàng tuần', '2', 'Đại học', 'Có khả năng đọc hiểu tài liệu, tổng hợp số liệu và lập báo cáo', 'Cẩn thận, trung thực, ham học hỏi', 'Có tinh thần trách nhiệm cao', 7, 'Được tham gia chính sách phát triển nhân sự ưu việt: được cấp quỹ đào tạo hàng năm để chủ động tham gia các khóa học ngoài, được tham gia chương trình đào tạo inhouse.\r\nBảo hiểm xã hội đóng trên 100% lương.\r\nCác chế độ phép năm, lễ tết,… theo đúng 100% quy định của pháp luật lao động\r\nCác chế độ phúc lợi đầy đủ,Chính sách cho con công đoàn viên.\r\nĐược làm việc trong một môi trường coi trọng người lao động, văn hóa doanh nghiệp rõ nét.\r\nĐược hưởng chế độ khám sức khỏe hàng năm.\r\nĐược đi du lịch nghỉ mát hàng năm cùng Công ty.\r\nLàm việc 5,5 ngày / tuần, nghỉ chiều thứ 7 và ngày chủ nhật.', 'Thưởng doanh số theo kết quả công việc', 'Môi trường trẻ trung, năng động', 'Toàn thời gian cố đị', 'hot', 'Nhân Vinh, Dị Sử, Mỹ Hào', 'Linh hoạt theo ca', '2026-12-15', 'published', '2026-06-17 21:59:41', 1, '2026-06-17 14:49:01', '2026-07-22 23:49:57'),
(50, 1, 0, 8, 28, 'Nhân Viên Kiểm Duyệt Nội Dung Mạng Xã Hội Đi Làm Ngay Quận 12', 10, 'Kiểm duyệt nội dung đa dạng trên nền tảng âm nhạc xã hội: podcast, video, tiêu đề playlist, hồ sơ người dùng, ảnh album, nội dung do người dùng tạo và các buổi livestream.\r\nLắng nghe trực tiếp các luồng âm thanh để đánh giá và đảm bảo tuân thủ các tiêu chuẩn cộng đồng.\r\nSử dụng công cụ chuyên dụng của khách hàng để tiếp nhận, đánh giá nội dung và đưa ra quyết định kiểm duyệt phù hợp.\r\nGhi nhận kết quả kiểm duyệt một cách chính xác thông qua các hệ thống, công cụ và bảng tính được cung cấp.\r\nTheo dõi, báo cáo chi tiết về các hoạt động kiểm duyệt theo yêu cầu của khách hàng.\r\nĐịa điểm làm việc:\r\n+TP. Hồ Chí Minh: Tăng Nhơn Phú, Quận 9 (cũ) hoặc Công viên Phần mềm Quang Trung, Quận 12.\r\n+ Hà Nội: 37–39–41 Vũ Ngọc Phan, Quận Đống Đa.\r\n+ Thời gian làm việc:\r\n05 ngày/tuần, nghỉ 02 ngày bất kỳ.\r\nLàm việc theo ca xoay 24/7 theo sự sắp xếp của trưởng nhóm.\r\nMỗi ca làm việc 09 giờ (bao gồm 1.5 giờ nghỉ).', '1', 'Trung học', 'Có khả năng đọc hiểu tài liệu, tổng hợp số liệu và lập báo cáo', 'Cẩn thận, trung thực, ham học hỏi', 'Ưu tiên ứng viên có kinh nghiệm thực tế', 6, 'Tổng Thu Nhập: 11 - 13 Triệu/ tháng.\r\nTham gia đầy đủ BHXH, BHYT, BHTN ngay theo quy định và được bảo vệ thêm với gói bảo hiểm tai nạn 24/7 quyền lợi mở rộng.\r\nThưởng tháng 13 cố định cùng các khoản thưởng cuối năm dựa trên kết quả kinh doanh và đóng góp cá nhân.\r\nHưởng các chế độ chăm sóc từ công đoàn: quà sinh nhật, hỗ trợ hiếu hỉ, thai sản và các chương trình phúc lợi nội bộ.\r\nLàm việc trong môi trường quốc tế, hiện đại, chuyên nghiệp với 14 ngày phép/năm và khám sức khỏe định kỳ.\r\nTham gia đa dạng hoạt động gắn kết: team building, sự kiện nội bộ và chương trình dành cho nhân viên xuyên suốt năm.', 'Thưởng doanh số theo kết quả công việc', 'Đội ngũ quản lý hỗ trợ sát sao', 'Khác', 'hot', 'Tòa nhà QTSC 9, đường số 3, khu công viên phần mềm Quang Trung, Quận 12', 'Theo lịch phân công', '2026-07-26', 'published', '2026-06-17 21:59:41', 2, '2026-06-17 14:49:01', '2026-07-23 07:47:58'),
(51, 15, 0, 42, 28, 'Tổ Trưởng C&B (Tiền Lương, Phúc Lợi & Chính Sách Nhân Sự)', 2, '1. Quản lý công tác tiền lương và thu nhập\r\n\r\nKiểm soát toàn bộ quy trình tính lương, thưởng, phụ cấp và các khoản thu nhập cho gần 700 CB-GV-NV trong hệ thống. \r\nRà soát dữ liệu nhân sự, ngày công và các biến động liên quan nhằm đảm bảo tính chính xác và đúng hạn của công tác chi trả. \r\n2. Quản lý phúc lợi và chế độ người lao động\r\n\r\nKiểm soát việc triển khai các chương trình phúc lợi, trợ cấp và chế độ đãi ngộ dành cho người lao động. \r\nRà soát các khoản thanh toán liên quan đến thù lao giảng dạy, trợ giảng, vượt giờ và các chế độ phát sinh khác. \r\n3. Quản lý bảo hiểm và tuân thủ pháp luật lao động\r\n\r\nKiểm soát các nghiệp vụ BHXH, BHYT, BHTN, Thuế TNCN và các nghĩa vụ pháp định liên quan đến người lao động. \r\nĐảm bảo các hoạt động C&B tuân thủ quy định pháp luật và chính sách nhân sự của Nhà trường. \r\n4. Quản trị dữ liệu và báo cáo nhân sự\r\n\r\nKiểm soát dữ liệu nhân sự, dữ liệu tiền lương và các báo cáo quản trị liên quan đến lao động, thu nhập và phúc lợi. \r\nPhân tích dữ liệu, nhận diện rủi ro và đề xuất các giải pháp cải tiến nhằm nâng cao hiệu quả vận hành C&B. \r\n5. Điều phối đội ngũ và hỗ trợ các đơn vị\r\n\r\nHướng dẫn, phân công và kiểm soát chất lượng công việc của đội ngũ C&B trong phạm vi phụ trách. \r\nPhối hợp với các cơ sở, đơn vị và lãnh đạo trong việc triển khai chính sách nhân sự, giải đáp và xử lý các vấn đề liên quan đến C&B.', '3', 'Đại học', 'Tin học văn phòng, sử dụng phần mềm quản lý cơ bản', 'Cẩn thận, trung thực, ham học hỏi', 'Có tinh thần trách nhiệm cao', 11, 'Hỗ trợ cơm trưa tại công ty;\r\nĐược hưởng các chế độ theo quy định của Luật Lao động hiện hành;\r\nThưởng vào tất cả các ngày Lễ & Tết trong năm: 01/01, Tết Âm lịch, Ngày GPMN (30/04), Lễ Quốc khánh (02/09), Lễ Khai giảng (05/9) và 20/11\r\nThưởng theo đánh giá cuối năm học.\r\n1 năm có 12 ngày phép;\r\nLàm việc trong môi trường sư phạm, thân thiện, năng động, hiện đại, chuyên nghiệp theo chuẩn Quốc tế.', 'Thưởng cuối năm theo quy định công ty', 'Môi trường trẻ trung, năng động', 'Toàn thời gian cố đị', 'hot', 'SỐ 18 ĐẶNG ĐẠI ĐỘ, PHƯỜNG TÂN PHONG, Quận 7', 'Thứ 2 - Thứ 7', '2026-08-15', 'published', '2026-06-17 21:59:41', 3, '2026-06-17 14:49:01', '2026-07-23 05:56:35'),
(52, 20, 0, 8, 28, 'Thực Tập Sinh Tư Vấn Đặt Lịch Hẹn', 4, '- Liên hệ, trao đổi và hẹn lịch khách hàng theo dữ liệu có sẵn.\r\n- Chốt và xác nhận lịch hẹn phù hợp với khách hàng.\r\n- Nhắc nhở khách hàng tham dự đúng giờ trước ngày diễn ra sự kiện.\r\n- Báo cáo danh sách khách hàng đã xác nhận cho quản lý.\r\n- Hỗ trợ tìm kiếm khách hàng tiềm năng.', '0', 'Cao đẳng', 'Có khả năng đọc hiểu tài liệu, tổng hợp số liệu và lập báo cáo', 'Tư duy dịch vụ khách hàng', 'Có thể đi công tác khi cần', 2, '- Lương cơ bản 4.000.000 VNĐ/tháng + thưởng hiệu suất.\r\n- Được xác nhận thực tập và hỗ trợ số liệu làm báo cáo.\r\n- Hỗ trợ nghỉ 1-2 buổi/tuần linh hoạt theo lịch học.\r\n- Cơ hội phát triển lên vị trí chính thức sau kỳ thực tập.\r\n- Không áp KPI.', 'Thưởng doanh số theo kết quả công việc', 'Văn phòng chuyên nghiệp, thân thiện', 'Toàn thời gian cố đị', 'hot', '1377 Hoàng Văn Thụ, Phường 8, Phú Nhuận', 'Thứ 2 - Thứ 6', '2026-08-31', 'published', '2026-06-17 21:59:41', 2, '2026-06-17 14:49:01', '2026-07-23 03:58:47'),
(53, 11, 0, 30, 16, 'Nhân viên QA/QC', 7, 'Tư vấn, hỗ trợ khách hàng, cập nhật thông tin và chăm sóc sau dịch vụ', '1', 'none', 'Tin học văn phòng, sử dụng phần mềm quản lý cơ bản', 'Giao tiếp tốt, làm việc nhóm', 'Có thể đi công tác khi cần', 8, 'BHXH, BHYT, BHTN theo quy định; phụ cấp theo vị trí', 'Thưởng chuyên cần và thưởng sáng kiến', 'Môi trường trẻ trung, năng động', 'full_time', 'hot', 'Thanh Hóa', 'Linh hoạt theo ca', '2026-10-01', 'published', '2026-06-17 21:59:41', 0, '2026-06-17 14:49:01', '2026-06-17 21:59:41'),
(54, 2, 0, 18, 1, 'Nhân Viên Kho Tại Tp.HCM', 1, '- Tiếp nhận thông tin đơn hàng từ bộ phận Kinh doanh, đảm bảo độ chính xác của dữ liệu.\r\n- Thực hiện in đơn hàng và kiểm tra kỹ lưỡng số lượng, chủng loại hàng hóa theo đơn đã tiếp nhận.\r\n- Tiến hành soạn hàng, đóng gói và chuẩn bị hàng hóa sẵn sàng bàn giao cho bộ phận giao nhận theo đúng quy trình.\r\n- Sắp xếp và quản lý hàng hóa trong kho một cách gọn gàng, khoa học, tối ưu hóa không gian lưu trữ.\r\n- Thực hiện kiểm kê số lượng hàng hóa định kỳ (hàng tuần/tháng) để đối chiếu với hệ thống, báo cáo chênh lệch nếu có.\r\n- Hỗ trợ nhập xuất hàng hóa, tham gia bốc xếp hàng khi có yêu cầu hoặc khi cần thiết để đảm bảo tiến độ công việc.\r\n- Phối hợp chặt chẽ với các bộ phận liên quan (Kinh doanh, Giao nhận) để đảm bảo hàng hóa luôn đầy đủ, chính xác và được xử lý kịp thời.\r\n- Thời gian làm việc cố định từ 8h00 đến 17h00 các ngày trong tuần (Nghỉ trưa 1 tiếng).', '1', 'Trung học', 'Tin học văn phòng, sử dụng phần mềm quản lý cơ bản', 'Giao tiếp tốt, làm việc nhóm', 'Có thể đi công tác khi cần', 5, '- Mức lương cạnh tranh từ 7.000.000đ đến 10.000.000đ/tháng (lương gộp), xứng đáng với năng lực và đóng góp.\r\n- Thưởng lương tháng 13 hấp dẫn, là sự ghi nhận cho những nỗ lực và cống hiến trong suốt năm.\r\n- Được hưởng 12 ngày phép năm, nghỉ bệnh và các chế độ nghỉ lễ, Tết theo đúng quy định của Luật Lao động Việt Nam.\r\n- Tham gia đầy đủ các chế độ bảo hiểm xã hội (BHXH), bảo hiểm y tế (BHYT) và bảo hiểm thất nghiệp (BHTN) để đảm bảo an toàn và quyền lợi cho nhân viên.\r\n- Môi trường làm việc ổn định, thân thiện, tạo điều kiện phát triển lâu dài.\r\n- Được hướng dẫn, đào tạo công việc chuyên sâu nếu chưa có kinh nghiệm, giúp nhanh chóng hòa nhập và nâng cao kỹ năng.\r\n- Cơ hội tham gia các hoạt động du lịch, team building hàng năm, gắn kết tập thể.\r\n- Có hỗ trợ chỗ ở cho nhân viên, chi tiết sẽ được trao đổi kỹ trong quá trình phỏng vấn.', 'Thưởng chuyên cần và thưởng sáng kiến', 'Môi trường trẻ trung, năng động', 'Toàn thời gian cố đị', 'hot', '15/4 Nguyễn Oanh, Gò Vấp', 'Theo lịch phân công', '2026-07-30', 'published', '2026-06-17 21:59:41', 2, '2026-06-17 14:49:01', '2026-07-23 02:10:33'),
(55, 20, 0, 11, 28, 'Nhân Viên Kế Toán Thuế - Thu Nhập Trên 15Tr - Đi Làm Ngay', 2, 'Lập và nộp các loại báo cáo Quý, báo cáo tài chính năm theo quy định  \r\nLập tờ khai thuế GTGT,TNCN,TNDN ..  \r\nBáo cáo tình hình sử dụng hóa đơn theo tháng, quý, năm  \r\nGiải trình số liệu, cung cáp hồ sơ, số liệu cho cơ quan thuế , kiểm toán, thanh tra kiểm tra  \r\nKiểm tra tính hợp lệ của hóa đơn, chứng từ  - Hạch toán Doanh thu, chi phí,nghiệp vụ khác  \r\nCác công việc liên quan khác phát sinh khi có yêu cầu của Trưởng phòng hoặc Ban giám đốc\r\nLÀM VIỆC TẠI  137 Hoàng Văn Thụ, Phường  8, Quận Phú Nhuận, TP.HCM', '1', 'Cao đẳng', 'Biết sử dụng email, bảng tính và các công cụ cộng tác trực tuyến', 'Tư duy dịch vụ khách hàng', 'Ưu tiên ứng viên có kinh nghiệm thực tế', 6, 'Mức lương: Từ 9tr -15tr + Thưởng + KPI + Hoa hồng\r\nThưởng đột xuất khi có sáng kiến phục vụ công việc. \r\nĐầy đủ các quyền lợi cho người lao động: BHXH, nghỉ phép hàng năm, lương thưởng.\r\nMôi trường làm việc không ngừng phát triển cả về sự văn minh, tính chuyên nghiệp, cởi mở và sáng tạo.\r\nĐược tạo điều kiện học tập nâng cao, phát triển kỹ năng, chuyên môn. - Du lịch đình kỳ trong \r\nThời gian thử việc là 02 tháng, được ký Hợp đồng lao động khi trở thành nhân viên chính thức.', 'Thưởng cuối năm theo quy định công ty', 'Văn phòng chuyên nghiệp, thân thiện', 'Toàn thời gian cố đị', 'hot', '1374 Hoàng Văn Thụ, Phường 8, Quận Phú Nhuận, TP.HCM, Tân Bình', 'Linh hoạt theo ca', '2026-09-03', 'published', '2026-06-17 21:59:41', 5, '2026-06-17 14:49:01', '2026-07-23 03:56:20'),
(56, 11, 0, 9, 6, 'Nhân viên hành chính văn phòng tại Sơn La', 6, 'Tiếp nhận yêu cầu, xử lý nghiệp vụ hằng ngày và đảm bảo tiến độ công việc', '0', 'none', 'Thành thạo công cụ làm việc liên quan đến vị trí ứng tuyển', 'Tư duy dịch vụ khách hàng', 'Sẵn sàng học hỏi và tuân thủ quy trình', 7, 'Hỗ trợ ăn trưa, gửi xe và các chế độ phúc lợi nội bộ', 'Thưởng cuối năm theo quy định công ty', 'Đội ngũ quản lý hỗ trợ sát sao', 'contract', 'hot', 'Sơn La', 'Linh hoạt theo ca', '2027-01-07', 'published', '2026-06-17 21:59:41', 0, '2026-06-17 14:49:01', '2026-06-17 21:59:41'),
(57, 21, 0, 39, 28, 'Nhân Viên Kinh Doanh Thuốc Thuỷ Sản', 10, '-    Tìm kiếm khách hàng mới tiềm năng, tư vấn, bán hàng\r\n-    Đưa ra kế hoạch bán hàng để phát triển doanh số bán hàng.\r\n-    Chăm sóc khách hàng đã có của Công Ty.\r\n-    Báo cáo công việc thực hiện và kế hoạch tuần, tháng, năm theo quy định\r\n-    Các công việc khác theo yêu cầu của cấp trên.\r\n-    Công việc sẽ trao đổi cụ thể hơn trong quá trình phỏng vấn.', '3', 'Cao đẳng', 'Kỹ năng chuyên môn đúng vị trí, thao tác nhanh và cẩn thận', 'Giao tiếp tốt, làm việc nhóm', 'Có tinh thần trách nhiệm cao', 6, '-      Lương  (trao đổi khi phỏng vấn).\r\n-     Thưởng theo hiệu quả chỉ tiêu công việc.\r\n-     Công việc ổn định và lâu dài.\r\n-     Được hưởng các chế độ theo quy định của Luật Lao động và Công ty.', 'Thưởng doanh số theo kết quả công việc', 'Môi trường trẻ trung, năng động', 'Toàn thời gian cố đị', 'hot', '6 Đường N4, KCN Tân Phú Trung, Xã Tân Phú Trung, Củ Chi, Củ Chi', 'Ca hành chính', '2026-08-08', 'published', '2026-06-17 21:59:41', 6, '2026-06-17 14:49:01', '2026-07-23 02:49:56'),
(58, 1, 0, 8, 28, 'Nhân Viên Nhắc Phí Tại Văn Phòng Quận 11, Thủ Đức', 20, 'Chủ động nhắc lịch thanh toán và hỗ trợ khách hàng hoàn tất các thủ tục liên quan.\r\nTư vấn, hướng dẫn khách hàng lựa chọn kênh và hình thức bán hàng phù hợp với nhu cầu.\r\nCập nhật thông tin khách hàng, tiếp nhận và ghi nhận phản hồi để nâng cao hiệu quả bán hàng.\r\nTHỜI GIAN LÀM VIỆC\r\n08:00 – 18:15 | Thứ 2 – Thứ 7\r\n(Không tăng ca)\r\n ĐỊA ĐIỂM LÀM VIỆC: Tòa nhà Flemington – 182 Lê Đại Hành, Quận 11, TP.HCM hoặc OneHub – Đường D1, Phường Tân Phú (Quận 9 cũ), TP.HCM', '0', 'Trung học', 'Tin học văn phòng, sử dụng phần mềm quản lý cơ bản', 'Cẩn thận, trung thực, ham học hỏi', 'Có thể đi công tác khi cần', 7, 'Đầy đủ BHXH, BHYT, BHTN theo quy định cùng bảo hiểm tai nạn 24/7 quyền lợi cao.\r\nLương tháng 13 cố định và thưởng cuối năm theo kết quả hoạt động kinh doanh.\r\nPhúc lợi công đoàn đa dạng: sinh nhật, hiếu hỉ, thai sản và chăm sóc nhân viên.\r\nMôi trường quốc tế, hiện đại; 14 ngày phép/năm và khám sức khỏe định kỳ.\r\nTeam building, du lịch và nhiều hoạt động nội bộ xuyên suốt năm.', 'Thưởng hiệu suất và thưởng lễ Tết', 'Đội ngũ quản lý hỗ trợ sát sao', 'Toàn thời gian cố đị', 'hot', 'Tòa nhà Flemington, 182 Lê Đại Hành, Quận 11', 'Linh hoạt theo ca', '2026-11-19', 'published', '2026-06-17 21:59:41', 2, '2026-06-17 14:49:01', '2026-07-23 07:45:35'),
(59, 18, 0, 25, 28, 'Nhân Viên Bảo Trì Điện - Cơ Khí (Thu Nhập Từ 10 - 14 Triệu - Tại Bến Cát)', 5, 'Thực hiện bảo trì, bảo dưỡng định kỳ hệ thống máy móc, thiết bị điện – cơ khí theo kế hoạch nhằm đảm bảo vận hành ổn định.\r\nKiểm tra, chẩn đoán và khắc phục kịp thời các sự cố kỹ thuật, hạn chế tối đa thời gian gián đoạn sản xuất.\r\nTheo dõi, giám sát tình trạng hoạt động của thiết bị; đề xuất các giải pháp cải tiến, nâng cao hiệu suất và tuổi thọ máy móc.\r\nGhi chép, cập nhật đầy đủ thông tin bảo trì, sửa chữa và lịch sử vận hành vào hồ sơ quản lý thiết bị.', '0', 'Trung cấp', 'Kỹ năng chuyên môn đúng vị trí, thao tác nhanh và cẩn thận', 'Giao tiếp tốt, làm việc nhóm', 'Sẵn sàng học hỏi và tuân thủ quy trình', 6, 'Thu nhập từ 10.000.000 - 14.000.000 VNĐ/tháng, xét tăng lương theo năng lực và hiệu quả công việc.\r\nTham gia đầy đủ BHXH, BHYT, BHTN theo quy định của pháp luật.\r\nThưởng lương tháng 13, thưởng Lễ, Tết và các chế độ phúc lợi hấp dẫn theo chính sách Công ty.\r\nĐược đào tạo nâng cao chuyên môn, tay nghề và có cơ hội phát triển nghề nghiệp lâu dài.\r\nLàm việc trong môi trường năng động, thân thiện, chuyên nghiệp với nhiều cơ hội học hỏi và thăng tiến.', 'Thưởng chuyên cần và thưởng sáng kiến', 'Không gian làm việc ổn định, sạch sẽ', 'Toàn thời gian cố đị', 'hot', 'Số 99, Tổ 5, Phường Long Nguyên, TPHCM, Bến Cát', 'Thứ 2 - Thứ 7', '2026-08-26', 'published', '2026-06-17 21:59:41', 2, '2026-06-17 14:49:01', '2026-07-23 04:59:05'),
(60, 4, 0, 51, 1, 'Nhân Viên Phục Vụ Nhà Hàng Khách Sạn (Không Yêu Cầu Kinh Nghiệm)', 5, '• Phục vụ đồ ăn, thức uống cho khách\r\n• Đón tiếp khách hàng tại khu vực bàn, hướng dẫn họ đến bàn và giới thiệu thực đơn đồ ăn, thức uống.\r\n• Ghi order và truyền đạt yêu cầu đến bếp và quầy bar, đảm bảo order được thực hiện chính xác và kịp thời.\r\n• Mang đồ ăn, thức uống đến bàn khách hàng một cách chuyên nghiệp, đảm bảo đồ ăn nóng hổi và đồ uống tươi ngon khi đến tay khách.\r\n• Đáp ứng các yêu cầu của khách hàng trong suốt quá trình họ ở tại bàn, bar như : bổ sung đồ uống, thay đổi món ăn, hoặc cung cấp thêm thông tin về thực đơn.\r\n• Xử lý các tình huống phát sinh như khách hàng không hài lòng với món ăn, thức uống, báo ngay cho tổ trưởng hoặc trưởng bộ phận để có hướng giải quyết thích hợp.\r\n• Tư vấn thực đơn: Giới thiệu và tư vấn cho khách hàng các món ăn, thức uống nổi bật, các chương trình khuyến mãi của nhà hàng.', '0', 'Trung cấp', 'Biết sử dụng email, bảng tính và các công cụ cộng tác trực tuyến', 'Tư duy dịch vụ khách hàng', 'Có tinh thần trách nhiệm cao', 5, '• Được hưởng lương, thưởng theo quy định của khách sạn và tổng công ty,\r\n• Lương tháng 13, thưởng doanh thu, phép năm, sinh nhật.\r\n• Có kinh nghiệm dày dặn, bắt nhịp tốt, mức lương sẽ thương lượng điều chỉnh, đề xuất bổ nhiệm ( nếu cần)\r\n• Được đóng bảo hiểm xã hội, bảo hiểm y tế, bảo hiểm thất nghiệp, trợ cấp thôi việc theo quy định của pháp luật.\r\n• Môi trường làm việc thân thiện, năng động.\r\n\r\n• Có hỗ trợ nhà ở, có ký túc xá cho CBCNV ở xa\r\n• Thời gian làm việc linh hoạt theo 2 ca :\r\nCa 1: Từ 6:00-14:00\r\nCa 2: 14:00-22:00\r\nCó ngày nghỉ hàng tuần( không cố định vào Chủ Nhật). Nghỉ Lễ, Tết theo quy định.', 'Thưởng hiệu suất và thưởng lễ Tết', 'Không gian làm việc ổn định, sạch sẽ', 'Toàn thời gian cố đị', 'hot', '767 Nguyễn Văn Linh, Long Biên', 'Thứ 2 - Thứ 7', '2027-01-24', 'published', '2026-06-17 21:59:41', 2, '2026-06-17 14:49:01', '2026-07-23 01:52:26'),
(61, 4, 0, 57, 1, 'Nhân Viên Phục Vụ - Đi Làm Ngay', 5, '• Phục vụ đồ ăn, thức uống cho khách\r\n• Đón tiếp khách hàng tại khu vực bàn, hướng dẫn họ đến bàn và giới thiệu thực đơn đồ ăn, thức uống.\r\n• Ghi order và truyền đạt yêu cầu đến bếp và quầy bar, đảm bảo order được thực hiện chính xác và kịp thời.\r\n• Mang đồ ăn, thức uống đến bàn khách hàng một cách chuyên nghiệp, đảm bảo đồ ăn nóng hổi và đồ uống tươi ngon khi đến tay khách.\r\n• Đáp ứng các yêu cầu của khách hàng trong suốt quá trình họ ở tại bàn, bar như : bổ sung đồ uống, thay đổi món ăn, hoặc cung cấp thêm thông tin về thực đơn.\r\n• Xử lý các tình huống phát sinh như khách hàng không hài lòng với món ăn, thức uống, báo ngay cho tổ trưởng hoặc trưởng bộ phận để có hướng giải quyết thích hợp.\r\n• Tư vấn thực đơn: Giới thiệu và tư vấn cho khách hàng các món ăn, thức uống nổi bật, các chương trình khuyến mãi của nhà hàng.', '0', 'Trung học', 'Kỹ năng chuyên môn đúng vị trí, thao tác nhanh và cẩn thận', 'Chủ động, trách nhiệm, chịu được áp lực', 'Sẵn sàng học hỏi và tuân thủ quy trình', 5, '• Được hưởng lương, thưởng theo quy định của khách sạn và tổng công ty,\r\n• Lương tháng 13, thưởng doanh thu, phép năm, sinh nhật.\r\n• Có kinh nghiệm dày dặn, bắt nhịp tốt, mức lương sẽ thương lượng điều chỉnh, đề xuất bổ nhiệm ( nếu cần)\r\n\r\n• Được đóng bảo hiểm xã hội, bảo hiểm y tế, bảo hiểm thất nghiệp, trợ cấp thôi việc theo quy định của pháp luật.\r\n• Môi trường làm việc thân thiện, năng động.\r\n• Có hỗ trợ nhà ở, có ký túc xá cho CBCNV ở xa\r\n• Thời gian làm việc linh hoạt theo 2 ca :\r\nCa 1: Từ 6:00-14:00\r\nCa 2: 14:00-22:00\r\nCó ngày nghỉ hàng tuần( không cố định vào Chủ Nhật). Nghỉ Lễ, Tết theo quy định.', 'Thưởng hiệu suất và thưởng lễ Tết', 'Môi trường trẻ trung, năng động', 'Toàn thời gian cố đị', 'hot', '767 Nguyễn Văn Linh, Long Biên', 'Thứ 2 - Thứ 7', '2026-07-27', 'published', '2026-06-17 22:00:32', 7, '2026-06-17 14:49:01', '2026-07-23 01:49:39'),
(62, 9, 0, 27, 13, 'Kỹ Sư Công Nghệ Hàn', 5, '- Nghiên cứu, hoàn thiện thông số hàn cho các dây chuyền hàn và robot hàn\r\n- Demo, thực nghiệm các thiết bị hàn mới tại khách hàng và TTCN\r\n- Tham gia hỗ trợ giải pháp quy trình hàn\r\n- Tham gia tư vấn giải pháp hàn cho khách hàng, thực nghiệm các công nghệ hàn tại khách hàng\r\n- Tiếp nhận và thực hiện nhiệm vụ hằng ngày từ quản lý trực tiếp', '1', 'Đại học', 'Biết sử dụng email, bảng tính và các công cụ cộng tác trực tuyến', 'Cẩn thận, trung thực, ham học hỏi', 'Có thể đi công tác khi cần', 7, '- Gồm lương cơ bản + Phụ cấp + Thưởng ( Thưởng dự án, thưởng kết quả kinh doanh, hiệu quả kinh doanh....)\r\n- Bảo hiểm xã hội đóng trên 100% lương.\r\n- Các chế độ phép năm, lễ tết,... theo đúng 100% quy định của pháp luật lao động\r\n- Các chế độ phúc lợi đầy đủ\r\n- Làm việc 5,5 ngày / tuần, nghỉ chiều thứ 7 và ngày chủ nhật\r\nVăn hóa giá trị\r\n- Được tham gia chính sách phát triển nhân sự ưu việt: được cấp quỹ đào tạo hàng năm để chủ động tham gia các khóa học ngoài, được tham gia chương trình đào tạo inhouse.\r\n- Được làm việc trong một môi trường coi trọng người lao động,văn hóa doanh nghiệprõ nét.\r\n- Được tham gia các chương trình giải trí ngoài giờ tại khu vui chơi của Công ty: Phi tiêu, bi lắc, bi a....\r\n- Được tham gia các sự kiện nội bộ Công ty.\r\n- Tham gia teambuilding, du lịch hàng năm.', 'Thưởng doanh số theo kết quả công việc', 'Đội ngũ quản lý hỗ trợ sát sao', 'Toàn thời gian cố đị', 'hot', 'Số 84 Nguyễn Văn Linh, An Đồng, An Dương, Hải Phòng, An Dương', 'Thứ 2 - Thứ 6', '2026-11-15', 'published', '2026-06-17 22:00:32', 2, '2026-06-17 14:49:01', '2026-07-22 23:47:10'),
(63, 9, 0, 27, 13, 'Công Ty Cổ Phần Công Nghiệp Toàn Phát', 2, '- Lắp đặt, vận hành, sửa chữa và bảo dưỡng các loại máy cắt CNC laser tấm và ống, đảm bảo máy hoạt động ổn định và hiệu quả.\r\n- Tiếp nhận và tham gia các khóa đào tạo chuyên sâu từ kỹ sư của hãng và nhà cung cấp, sau đó hướng dẫn và đào tạo nội bộ cho đội ngũ.\r\n- Tham gia vào quá trình xây dựng và hoàn thiện tài liệu vận hành chi tiết cùng với các chuyên gia và kỹ sư chuyên trách, đảm bảo tính chính xác và dễ hiểu.\r\n- Tương tác trực tiếp với khách hàng để chuyển giao công nghệ, hướng dẫn sử dụng và khắc phục sự cố kỹ thuật ban đầu, duy trì mối quan hệ tốt với khách hàng.\r\n- Thực hiện kiểm tra định kỳ và bảo trì phòng ngừa cho các thiết bị CNC laser để kéo dài tuổi thọ và giảm thiểu hỏng hóc.', '1', 'Cao đẳng', 'Thành thạo công cụ làm việc liên quan đến vị trí ứng tuyển', 'Kỹ năng xử lý tình huống', 'Sẵn sàng học hỏi và tuân thủ quy trình', 7, '- Tốt nghiệp Cao đẳng hoặc Đại học các ngành Cơ điện tử, Điện, Điện tử, Tự động hóa (CNC).\r\n- Có ít nhất 1-2 năm kinh nghiệm thực tế trong lĩnh vực vận hành và bảo trì máy cắt laser hoặc các thiết bị CNC tương tự.\r\n- Trung thực, thẳng thắn, công bằng và có tinh thần trách nhiệm cao trong công việc.\r\n- Có khả năng làm việc nhóm hiệu quả và độc lập, chủ động giải quyết vấn đề.\r\n- Am hiểu sâu sắc về đặc tính cắt của các loại vật liệu kim loại tấm, thép ống, thép hộp.\r\n- Sử dụng thành thạo các phần mềm chuyên dụng phục vụ công việc kỹ thuật được giao.\r\n- Có khả năng đọc hiểu tài liệu kỹ thuật tiếng Anh cơ bản.\r\n- Thành thạo tin học văn phòng (Word, Excel, PowerPoint).\r\n- Ưu tiên ứng viên có kinh nghiệm sửa chữa các loại máy hàn Mig, Hồ quang chìm và máy hàn điện tử.', 'Thưởng chuyên cần và thưởng sáng kiến', 'Quy trình rõ ràng, hỗ trợ đào tạo', 'Toàn thời gian cố đị', 'hot', 'Số 84 An Đồng, An Dương, Hải Phòng, An Dương', 'Linh hoạt theo ca', '2026-11-25', 'published', '2026-06-17 22:00:32', 2, '2026-06-17 14:49:01', '2026-07-22 23:42:55'),
(64, 7, 0, 28, 28, 'Lao Động Phổ Thông - Đi Làm Ngay - Không Yêu Cầu Kinh Nghiệm', 2, 'Làm việc theo sự phân công của người trực tiếp quản lý\r\nLàm các công việc sau: phụ lấy dụng cụ, vật tư; hỗ trợ kỹ thuật viên lắp đặt cơ bản.\r\nTrao đổi cụ thể khi phỏng vấn', '0', 'Trung học', 'Tin học văn phòng, sử dụng phần mềm quản lý cơ bản', 'Kỹ năng xử lý tình huống', 'Có tinh thần trách nhiệm cao', 5, 'Mức lương: 8 - 9 triệu/ tháng\r\nThưởng chuyên cần+ trách nhiệm\r\nĐầy đủ BHYT, BHXH, BHTN + Thưởng lễ, tết\r\nĐược thưởng lương tháng thứ 13\r\nCác chế độ khác theo quy định của công ty', 'Thưởng dự án khi hoàn thành mục tiêu', 'Môi trường trẻ trung, năng động', 'Toàn thời gian cố đị', 'hot', 'Số 33B, Đại Lộ Bình Dương, khu phố Hoà Long, Phường Lái Thiêu, Thuận An', 'Thứ 2 - Thứ 7', '2026-10-15', 'published', '2026-06-17 22:00:32', 3, '2026-06-17 14:49:01', '2026-07-23 00:07:44'),
(65, 10, 0, 22, 28, 'Kỹ Sư Dự Án', 2, '1. Khảo sát công trình, phân tích dữ liệu    \r\n\r\n- Trao đổi thông tin với khách hàng liên quan đến kỹ thuật, tiến độ thi công    \r\n\r\n- Nắm rõ phạm vi công việc, các yêu cầu, tiêu chuẩn, bản vẽ thi công kỹ thuật    \r\n\r\n- Hỗ trợ nhân viên điều phối dự án trong quá trình lập phương án thi công    \r\n\r\n2. Theo dõi thi công    \r\n\r\n- Tham vấn với Giám sát công trường các giải pháp nhằm tuân thủ những tiêu chuẩn kỹ thuật và các yêu cầu khách hàng    \r\n\r\n- Triển khai các yêu cầu kỹ thuật cho nhóm thi công    \r\n\r\n- Kiểm tra giám sát kỹ thuật trong suốt quá trình thi công và báo cáo cho Giám sát công trường đảm bảo thi công đúng với yêu cầu dự án    \r\n\r\n- Hỗ trợ nhân viên an toàn kiểm tra thiết bị trước khi đưa vào sử dụng và kiểm tra định kỳ theo quy định công ty    \r\n\r\n- Hướng dẫn sử dụng máy móc thiết bị, giám sát, nhắc nhở công nhân trong quá trình làm việc đảm bảo tuân thủ đúng quy trình làm việc an toàn    \r\n\r\n- Trực tiếp theo dõi, kiểm tra và duy trì công việc, tiến độ tại công trường. Thường xuyên báo cáo tiến độ công việc cho cấp trên    \r\n\r\n- Phối hợp với Bộ phận QC và Điều phối dự án nghiệm thu nội bộ trước khi mời khách hàng đến nghiệm thu    \r\n\r\n- Phối hợp với Phòng dự án/ Chỉ huy công trường tổ chức nghiệm thu và làm hồ sơ nghiệm thu theo hợp đồng /yêu cầu của khách hàng    \r\n\r\n3. Các công việc khác    \r\n\r\n- Có thể thay thế Giám sát, trao đổi làm việc trực tiếp với khách hàng về phạm vi công việc    \r\n\r\n- Thực hiện các công việc khác theo yêu cầu Giám sát công trường    \r\n\r\n- Tham gia ứng phó với các tình huống khẩn cấp    \r\n\r\n- Tham gia nhận diện mối nguy và đánh giá rủi ro dự án', '2', 'Đại học', 'Kỹ năng chuyên môn đúng vị trí, thao tác nhanh và cẩn thận', 'Cẩn thận, trung thực, ham học hỏi', 'Không yêu cầu kinh nghiệm, sẽ được đào tạo', 7, '- Môi trường làm việc chuyên nghiệp, năng động với cơ hội học hỏi và phát triển nghề nghiệp rõ ràng.\r\n\r\n- Được đào tạo nâng cao kiến thức chuyên môn và các kỹ năng mềm cần thiết.\r\n\r\n- Tham gia đầy đủ BHXH, BHYT, BHTN theo quy định của pháp luật Việt Nam.\r\n\r\n- Lương tháng 13 và thưởng hiệu suất công việc theo kết quả kinh doanh của công ty.\r\n\r\n- Cơ hội tham gia các hoạt động team building, du lịch hàng năm của công ty.', 'Thưởng doanh số theo kết quả công việc', 'Môi trường trẻ trung, năng động', 'Toàn thời gian cố đị', 'hot', 'Đông Xuyên, Long Sơn, Mỹ Xuân, Vũng Tàu', 'Thứ 2 - Thứ 6', '2026-10-29', 'published', '2026-06-17 22:00:32', 2, '2026-06-17 14:49:01', '2026-07-22 23:12:35'),
(66, 21, 0, 39, 28, 'Giám Đốc Quản Lý Vùng Nhân Viên Kinh Doanh Thuốc Thú Y', 2, 'Tham mưu Ban Giám đốc xây dựng chiến lược phát triển thị trường Miền Nam, Miền Bắc\r\nLập kế hoạch kinh doanh tháng, quý, năm.\r\nNghiên cứu thị trường, đối thủ và đề xuất chính sách bán hàng\r\nTuyển dụng, đào tạo, đánh giá, quản lý và phát triển đội ngũ kinh doanh.\r\nPhát triển mô hình nhân sự theo quy mô thị trường.\r\nMở rộng hệ thống đại lý, nhà phân phối\r\nPhát triển thị phần và chăm sóc khách hàng chiến lược.\r\nChịu trách nhiệm hoàn thành chỉ tiêu doanh số.\r\nKiểm soát công nợ, đảm bảo thu hồi đúng hạn.\r\nTổ chức họp kinh doanh và xây dựng đội ngũ chuyên nghiệp.\r\nChi tiết công việc sẽ trao đổi trực tiếp khi phỏng vấn', '3', 'Đại học', 'Biết sử dụng email, bảng tính và các công cụ cộng tác trực tuyến', 'Giao tiếp tốt, làm việc nhóm', 'Sẵn sàng học hỏi và tuân thủ quy trình', 11, 'Mức lương: thoả thuận khi phỏng vấn\r\nĐược hưởng đầy đủ các chế độ theo luật lao động và Công ty.\r\nChính sách phúc lợi đầy đủ', 'Thưởng cuối năm theo quy định công ty', 'Môi trường trẻ trung, năng động', 'Toàn thời gian cố đị', 'hot', 'Tân Bình, Tân Bình', 'Ca hành chính', '2026-08-13', 'published', '2026-06-17 22:00:32', 6, '2026-06-17 14:49:01', '2026-07-23 02:44:13'),
(67, 10, 0, 22, 28, 'Nhân Viên Điều Phối Dự Án', 3, '1. Điều phối chuẩn bị hoạt động dự án            \r\n- Tiếp nhận và trực tiếp điều phối dự án khi có thông báo trúng thầu từ Phòng Thương Mại (PTM)            \r\n- Tham gia họp với các bên liên quan (PTM, HSE) trước khi triển khai dự án. Làm rõ các yêu cầu kỹ thuật, hạng mục công việc và điều kiện hợp đồng            \r\n- Tìm hiểu và nắm rõ các yêu cầu kỹ thuật của dự án            \r\n- Tính toán khối lượng, lập bảng phân rã chi tiết công việc, kế hoạch nhân lực, vật tư - thiết bị của dự án            \r\n- Đánh giá rủi ro và thiết lập biện pháp kiểm soát nhằm giảm thiểu các rủi ro có thể xảy ra            \r\n- Lập bảng tiến độ và sơ đồ tổ chức của dự án. Theo dõi và cập nhật thường xuyên (nếu có thay đổi)            \r\n- Lập phương án thi công cho từng công việc cụ thể            \r\n\r\n- Lập kế hoạch kiểm tra và giám sát chất lượng (ITP)            \r\n\r\n2. Theo dõi kế hoạch dự án, phối hợp các bên thực hiện công việc theo tiến độ            \r\n- Liên hệ thường xuyên và cập nhật với khách hàng về thời gian triển khai dự án            \r\n- Liên hệ với PTM/ khách hàng để xin các yêu cầu về HSE tại công trường nhằm chuẩn bị tốt nhất: Thủ tục ra vào cổng, nhập hàng, xuất hàng, bằng cấp, chứng chỉ, kiểm định, tiêu chuẩn thiết bị & điện, xin vị trí đặt Kho tạm & Workshop            \r\n- Tổ chức cuộc họp Triển khai dự án với Sup/ Engineer/ Admin được phân công để làm rõ các yêu cầu kỹ thuật, tiến độ, khối lượng công việc cũng như các thủ tục về an toàn, môi trường. Đưa ra những điểm khó khăn hoặc cần lưu ý/ rút kinh nghiệm ở dự án trước và đề xuất các biện pháp khắc phục/ hỗ trợ với Trưởng phòng dự án            \r\n- Chủ động theo dõi kế hoạch huy động vật tư - nhân sự dự án            \r\n- Cập nhật thường xuyên với BP. Kho và BP. Mua hàng để theo dõi tình trạng mua hàng & cấp hàng cho Dự Án có phù hợp với tiến độ của dự án hay không. Kiểm tra việc tương thích giữa hồ sơ máy móc, vật tư với thực tế vật tư, máy móc trước khi cấp cho Dự Án            \r\n- Theo dõi tình trạng và đôn đốc công việc ngoài công trường tương ứng với tiến độ đã lập.            \r\n- Chủ động liên hệ thường xuyên về tiến độ, kỹ thuật, thiết bị với công trường, nhằm đánh giá tiến trình cấp nhân sự, vật tư của công trường            \r\n- Nhận báo cáo hàng ngày/ tuần của công trường (Engineer, Sup, Admin…) về tiến độ dự án. Chủ động cập nhật tiến độ để báo cáo cấp trên nhanh chóng khi cần thiết            \r\n- Xử lý các vấn đề phát sinh tại công trường nằm trong khả năng và quyền hạn của mình            \r\n- Liên hệ với khách hàng thường xuyên nhằm lấy thông tin tốt hơn về tình hình dự án đang thực hiện            \r\n- Liên hệ với Công thường nhiều hơn nhằm cập nhật thông tin khác về công trường tốt hơn (thái độ, phàn nàn, khích lệ…)            \r\n- Chủ động theo dõi và yêu cầu Công trường cập nhật sơ đồ tổ chức chi tiết thi công. Đánh giá và theo dõi sơ đồ này có được vận hành tốt ở công trường hay chưa, đề xuất phương án thay thế (nếu có)            \r\n- Phối hợp với bộ phận QC để kiểm tra công việc thực tế tại dự án            \r\n-  Phối hợp công việc và trao đổi thông tin với Đội điều phối viên nhằm điều phối tốt hơn máy móc, nhân sự, vật tư giữa các dự án            \r\n- Theo dõi, nhắc nhở Admin việc kiểm đếm - bảo quản vật tư, thiết bị tại công trường, hạn chế thấp nhất tình trạng thất thoát vật tư của dự án            \r\n3. Thực hiện và kiểm soát công tác nghiệm thu            \r\n- Đảm bảo hồ sơ nghiệm thu đúng theo yêu cầu hợp đồng            \r\n- Phối hợp với BP Kho và Quản lý công trường để xác định lượng vật tư còn lại hiện tại và rà soát lại nếu có thất thoát.            \r\n- Khảo sát ý kiến khách hàng sau khi kết thúc dự án.            \r\n- Tổ chức Họp kết thúc dự án, đưa ra bài học kinh nghiệm.            \r\n4. Các công việc khác            \r\n- Thực hiện công việc theo yêu cầu từ Trưởng Phòng dự án            \r\n- Cập nhật, lưu trữ hồ sơ dự án theo đúng quy định ISO            \r\n- Tham gia ứng phó với các tình huống khẩn cấp            \r\n- Tham gia nhận diện mối nguy và đánh giá rủi ro', '2', 'Đại học', 'Tin học văn phòng, sử dụng phần mềm quản lý cơ bản', 'Chủ động, trách nhiệm, chịu được áp lực', 'Ưu tiên ứng viên có kinh nghiệm thực tế', 7, '- Môi trường làm việc chuyên nghiệp, năng động với cơ hội học hỏi và phát triển nghề nghiệp rõ ràng.\r\n- Được đào tạo nâng cao kiến thức chuyên môn và các kỹ năng mềm cần thiết.\r\n- Tham gia đầy đủ BHXH, BHYT, BHTN theo quy định của pháp luật Việt Nam.\r\n- Lương tháng 13 và thưởng hiệu suất công việc theo kết quả kinh doanh của công ty.\r\n- Cơ hội tham gia các hoạt động team building, du lịch hàng năm của công ty.', 'Thưởng hiệu suất và thưởng lễ Tết', 'Không gian làm việc ổn định, sạch sẽ', 'Toàn thời gian cố đị', 'hot', 'Đường số 23, KCN Đông Xuyên, Vũng Tàu', 'Theo lịch phân công', '2026-10-20', 'published', '2026-06-17 22:00:32', 5, '2026-06-17 14:49:01', '2026-07-22 23:09:37'),
(68, 5, 0, 26, 28, 'Nhân Viên Vận Hành Máy', 3, '- Vận hành trực tiếp các loại máy, đảm bảo máy hoạt động ổn định và hiệu quả trong suốt quá trình sản xuất hàng ngày.\r\n- Lắp ráp, điều chỉnh và sửa chữa các lỗi cơ bản của máy để duy trì hoạt động liên tục, giảm thiểu thời gian dừng máy.\r\n- Ghi chép đầy đủ và chính xác các thông số sản xuất như thời gian dừng máy, sản lượng, tỷ lệ hao hụt vào biểu mẫu quy định.\r\n- Báo cáo kịp thời và chính xác tình hình sản xuất, các sự cố máy móc hoặc bất kỳ vấn đề phát sinh nào cho tổ trưởng hoặc tổ phó.\r\n- Đảm bảo tuân thủ tuyệt đối các quy định, nội quy của công ty và mệnh lệnh từ cấp trên, đặc biệt là các quy trình vệ sinh, 5S trong khu vực làm việc.', '0', 'Trung học', 'Biết sử dụng email, bảng tính và các công cụ cộng tác trực tuyến', 'Giao tiếp tốt, làm việc nhóm', 'Có tinh thần trách nhiệm cao', 6, '- Mức lương cạnh tranh, hấp dẫn, được xem xét tăng lương định kỳ dựa trên hiệu suất công việc.\r\n- Hưởng đầy đủ các chế độ bảo hiểm xã hội (BHXH), bảo hiểm y tế (BHYT), bảo hiểm thất nghiệp (BHTN) theo quy định của pháp luật Việt Nam.\r\n- Lương tháng 13 và thưởng hiệu suất/KPI theo kết quả kinh doanh của công ty.\r\n- Cơ hội được đào tạo nâng cao kỹ năng chuyên môn về vận hành và bảo trì máy móc hiện đại.\r\n- Môi trường làm việc chuyên nghiệp, thân thiện, năng động, có cơ hội thăng tiến rõ ràng.\r\n- Tham gia các hoạt động team building, du lịch hàng năm do công ty tổ chức để gắn kết tập thể.\r\n- Được cung cấp trang thiết bị bảo hộ lao động đầy đủ và đảm bảo an toàn trong quá trình làm việc.', 'Thưởng cuối năm theo quy định công ty', 'Quy trình rõ ràng, hỗ trợ đào tạo', 'Toàn thời gian cố đị', 'hot', 'KCN Tân Đông Hiệp A, Dĩ An', 'Linh hoạt theo ca', '2026-10-05', 'published', '2026-06-17 22:00:32', 6, '2026-06-17 14:49:01', '2026-07-23 01:11:52'),
(69, 7, 0, 28, 28, 'Nhân Viên Sửa Chữa Xe (Xe Nâng, Ôtô, Cơ Giới)', 3, '• Bảo trì, sửa chữa xe nâng dầu, xăng, gas, điện... tại Công ty khách hàng theo sự phân công của Công ty.\r\n• Sửa chữa khắc phục những hư hỏng liên quan đến các bộ phận cơ khí, thủy lực trên xe nâng.\r\n• Thay thế phụ tùng xe nâng, kiểm tra xe nâng định kỳ hoặc thay thế và khắc phục khi xảy ra hư hỏng.\r\n• Kiểm tra, bảo dưỡng xe để chuẩn bị giao khách hàng.', '1', 'Cao đẳng', 'Thành thạo công cụ làm việc liên quan đến vị trí ứng tuyển', 'Kỹ năng xử lý tình huống', 'Có thể đi công tác khi cần', 6, '• Thu nhập: 10.000.000 - 15.000.000 VNĐ/tháng, xét tăng lương định kỳ và theo năng lực thực tế.\r\n• Thưởng hiệu suất công việc, thưởng tất cả các ngày lễ Tết.\r\n• Tham gia đầy đủ BHXH theo quy định của pháp luật Việt Nam.\r\n• Được tham gia bảo hiểm tai nạn 24/7;\r\n• Được đào tạo nâng cao kỹ năng, có cơ hội thăng tiến và phát triển nghề nghiệp.\r\n• Môi trường làm việc chuyên nghiệp, ổn định, thân thiện.\r\n• Bảo hiểm xã hội, tổ chức sinh nhật, du lịch hàng năm, thưởng tháng 13.\r\n• Thời gian làm việc: Thứ 2 - Thứ 7 (từ 7:30 đến 17:00)', 'Thưởng chuyên cần và thưởng sáng kiến', 'Môi trường trẻ trung, năng động', 'Toàn thời gian cố đị', 'hot', 'Số 33B, Đại Lộ Bình Dương, khu phố Hoà Long, Thuận An', 'Theo lịch phân công', '2026-08-08', 'published', '2026-06-17 22:00:32', 7, '2026-06-17 14:49:01', '2026-07-22 23:59:35'),
(70, 2, 0, 87, 28, 'Kỹ Sư Môi Trường Lương Lên Đến 20 Triệu', 5, '- Thiết kế các hệ thống xử lý nước cấp, nước thải và khí thải.\r\n- Viết thuyết minh công nghệ và lập dự toán các công trình xử lý nước cấp, nước thải, khí thải;\r\n- Tổ chức thi công, giám sát các công trình đã thiết kế, lắp đăt đường ống, máy móc thiết bị, thực hiện các công việc vận hành hệ thống xử lý nước cấp, nước thải, và khí thải\r\n- Lập bản vẽ hoàn công và hướng dẫn vận hành.\r\n- Nghiệm thu công trình xử lý nước cấp,nước thải, khí thải.\r\n- Tư vấn, báo giá và làm hợp đồng về dịch vụ tư vấn môi trường.\r\n- Lên phương án báo giá cạnh tranh.\r\n- Lựa chọn các giải pháp công nghệ phù hợp cho từng loại hình xử lý nước cấp, nước thải, khí thải;\r\n- Đề xuất hướng nghiên cứu công nghệ hoặc tiếp thu công nghệ mới về xử lý nước, nước thải ;\r\n- Tính toán, lựa chọn thiết bị và thiết kế công nghệ XLN, NT;\r\n- Xây dựng hồ sơ thầu;\r\n- Kiểm tra thực hiện và giám sát công tác khử mùi, vệ sinh môi trường trong nhà máy.\r\n- Vận hành các hệ thống xử lý nước thải, khí thải.....\r\n- Thời gian làm việc từ thứ 2 đến sáng thứ 7 (Buổi sáng từ 8h - 12h, buổi chiều từ 13h - 17h).', '1', 'Đại học', 'Biết sử dụng email, bảng tính và các công cụ cộng tác trực tuyến', 'Kỹ năng xử lý tình huống', 'Có thể đi công tác khi cần', 7, '- Được hưởng mức thu nhập cao;\r\n- Tăng lương theo năng lực\r\n- Thưởng khi hoàn thành tốt công việc và hoàn thành công trình\r\n- Làm việc trong môi trường chuyên nghiệp, hoà đồng, nhiều cơ hội phát triển nghề nghiệp, cơ hội thăng tiến;\r\n- Được hưởng các chế độ phúc lợi, đãi ngộ tốt nhất: Thưởng các dịp lễ, tết, phép năm và các chế độ khác theo quy định của Cty.', 'Thưởng chuyên cần và thưởng sáng kiến', 'Văn phòng chuyên nghiệp, thân thiện', 'Toàn thời gian cố đị', 'hot', 'Gần khu vực, Tân Bình', 'Thứ 2 - Thứ 7', '2026-10-15', 'published', '2026-06-17 22:00:32', 3, '2026-06-17 14:49:01', '2026-07-23 02:08:03'),
(71, 12, 0, 7, 1, 'Nhân Viên Hỗ Trợ Khách Hàng Nhà Bán', 10, 'Trực tiếp quản lý và xử lý mọi vấn đề liên quan đến các đối tác trọng điểm (Key Accounts) của SPX Express.\r\nXây dựng và duy trì mối quan hệ bền chặt với Seller; nắm bắt nhu cầu để phối hợp cùng các bộ phận (Vận hành, Công nghệ...) nâng cao chất lượng dịch vụ.\r\nPhối hợp liên phòng ban để giải quyết các khiếu nại, sự cố nghiêm trọng (escalation) \r\nmột cách nhanh chóng, đảm bảo đúng cam kết chất lượng (SLA).\r\nTheo dõi, dự báo sản lượng và khai thác tối đa nhu cầu của Seller nhằm thúc đẩy tăng trưởng sản lượng/doanh thu.\r\nĐảm bảo các chỉ số cá nhân (năng suất, chất lượng xử lý, tỷ lệ giải quyết lần đầu) và \r\nđóng góp sáng kiến cải thiện hiệu quả làm việc của team.\r\nThực hiện các nhiệm vụ khác theo yêu cầu của quản lý trực tiếp.', '0', 'Cao đẳng', 'Tin học văn phòng, sử dụng phần mềm quản lý cơ bản', 'Giao tiếp tốt, làm việc nhóm', 'Sẵn sàng học hỏi và tuân thủ quy trình', 6, 'Công ty cung cấp laptop làm việc\r\nMôi trường làm việc chuyên nghiệp, năng động.\r\nVăn hóa làm việc hỗ trợ, tôn trọng và khuyến khích chia sẻ ý tưởng.\r\nCơ hội học hỏi, phát triển kỹ năng thông qua công việc thực tế và làm việc cùng đội ngũ giàu kinh nghiệm.\r\nCơ hội phát triển nghề nghiệp và thăng tiến rõ ràng.', 'Thưởng hiệu suất và thưởng lễ Tết', 'Môi trường trẻ trung, năng động', 'full_time', 'hot', 'Capital Place, Ba Đình', 'Thứ 2 - Thứ 6', '2026-08-15', 'published', '2026-06-17 22:00:32', 18, '2026-06-17 14:49:01', '2026-07-22 21:16:02'),
(72, 3, 0, 11, 28, 'Kế Toán Tổng Hợp - Thu Nhập Từ 16 Triệu - Yêu Cầu Từ 3 Năm Kinh Nghiệm', 2, 'Quản lý, điều phối công việc phòng Kế toán và phối hợp giữa Văn phòng – Nhà máy.\r\nHạch toán nghiệp vụ kế toán, lập báo cáo tài chính, báo cáo quản trị và báo cáo theo yêu cầu Ban Giám đốc.\r\nKiểm tra số liệu kế toán, chứng từ thu chi, hóa đơn, hợp đồng kinh tế và các nghiệp vụ phát sinh.\r\nKiểm soát công tác tính giá thành sản xuất, tài sản, công cụ dụng cụ, khấu hao và công nợ.\r\nTheo dõi hồ sơ lao động, BHXH và tổ chức lưu trữ chứng từ kế toán đúng quy định.\r\nHỗ trợ Kế toán trưởng trong công tác quyết toán thuế, kiểm toán và hoàn thuế.\r\nThực hiện các công việc khác theo phân công của Ban Giám đốc.', '3', 'Đại học', 'Kỹ năng chuyên môn đúng vị trí, thao tác nhanh và cẩn thận', 'Giao tiếp tốt, làm việc nhóm', 'Có tinh thần trách nhiệm cao', 7, 'Tham gia đầy đủ BHXH, BHYT, BHTN theo quy định.\r\nHưởng lương tháng 13, thưởng Lễ, Tết và các khoản thưởng theo hiệu quả công việc.\r\nĐược tham gia các khóa đào tạo nâng cao chuyên môn và kỹ năng nghiệp vụ.\r\nMôi trường làm việc chuyên nghiệp, ổn định, có cơ hội phát triển và thăng tiến lâu dài.\r\nHưởng đầy đủ các chế độ phúc lợi khác theo chính sách của công ty.', 'Thưởng chuyên cần và thưởng sáng kiến', 'Không gian làm việc ổn định, sạch sẽ', 'Toàn thời gian cố đị', 'hot', '100 Trần Hưng Đạo, Phường An Đông, Quận 5', 'Theo lịch phân công', '2026-12-26', 'published', '2026-06-17 22:00:32', 2, '2026-06-17 14:49:01', '2026-07-23 03:17:16'),
(73, 4, 0, 51, 1, 'Nhân Viên Phục Vụ Nhà Hàng, Khách Sạn', 5, '• Phục vụ đồ ăn, thức uống cho khách\r\n• Đón tiếp khách hàng tại khu vực bàn, hướng dẫn họ đến bàn và giới thiệu thực đơn đồ ăn, thức uống.\r\n• Ghi order và truyền đạt yêu cầu đến bếp và quầy bar, đảm bảo order được thực hiện chính xác và kịp thời.\r\n• Mang đồ ăn, thức uống đến bàn khách hàng một cách chuyên nghiệp, đảm bảo đồ ăn nóng hổi và đồ uống tươi ngon khi đến tay khách.\r\n• Đáp ứng các yêu cầu của khách hàng trong suốt quá trình họ ở tại bàn, bar như : bổ sung đồ uống, thay đổi món ăn, hoặc cung cấp thêm thông tin về thực đơn.\r\n• Xử lý các tình huống phát sinh như khách hàng không hài lòng với món ăn, thức uống, báo ngay cho tổ trưởng hoặc trưởng bộ phận để có hướng giải quyết thích hợp.\r\n• Tư vấn thực đơn: Giới thiệu và tư vấn cho khách hàng các món ăn, thức uống nổi bật, các chương trình khuyến mãi của nhà hàng.', '1', 'Trung học', 'Tin học văn phòng, sử dụng phần mềm quản lý cơ bản', 'Giao tiếp tốt, làm việc nhóm', 'Ưu tiên ứng viên có kinh nghiệm thực tế', 5, '• Được hưởng lương, thưởng theo quy định của khách sạn và tổng công ty,\r\n• Lương tháng 13, thưởng doanh thu, phép năm, sinh nhật.\r\n• Có kinh nghiệm dày dặn, bắt nhịp tốt, mức lương sẽ thương lượng điều chỉnh, đề xuất bổ nhiệm ( nếu cần)\r\n• Được đóng bảo hiểm xã hội, bảo hiểm y tế, bảo hiểm thất nghiệp, trợ cấp thôi việc theo quy định của pháp luật.\r\n• Môi trường làm việc thân thiện, năng động.\r\n• Có hỗ trợ nhà ở, có ký túc xá cho CBCNV ở xa\r\n• Thời gian làm việc linh hoạt theo 2 ca :\r\nCa 1: Từ 6:00-14:00\r\nCa 2: 14:00-22:00\r\nCó ngày nghỉ hàng tuần( không cố định vào Chủ Nhật). Nghỉ Lễ, Tết theo quy định.', 'Thưởng dự án khi hoàn thành mục tiêu', 'Văn phòng chuyên nghiệp, thân thiện', 'Toàn thời gian cố đị', 'hot', '767 Nguyễn Văn Linh, Long Biên', 'Linh hoạt theo ca', '2026-08-06', 'published', '2026-06-17 22:00:32', 6, '2026-06-17 14:49:01', '2026-07-23 01:46:50');
INSERT INTO `hicrm_job_posts` (`id`, `employer_id`, `candidate_id`, `job_category_id`, `province_id`, `title`, `quantity`, `job_description`, `experience_years`, `degree_required`, `professional_skills`, `soft_skills`, `other_requirements`, `salary_id`, `benefits_description`, `rewards_description`, `work_environment`, `work_type`, `job_post_type`, `address_detail`, `working_time`, `deadline`, `status`, `published_at`, `views_count`, `created_at`, `updated_at`) VALUES
(74, 5, 0, 4, 1, 'Nhân Viên Kinh Doanh B2B', 10, '- Tìm kiếm và phát triển khách hàng doanh nghiệp (B2B) trong ngành thực phẩm, đặc biệt là ngành hàng thịt và các sản phẩm từ thịt.\r\n- Tư vấn, giới thiệu các sản phẩm/giải pháp của công ty đến khách hàng tiềm năng, đáp ứng nhu cầu kinh doanh của họ.\r\n- Xây dựng và duy trì mối quan hệ tốt đẹp với các đối tác, khách hàng hiện tại và tiềm năng.\r\n- Phân tích thị trường, đối thủ cạnh tranh để đưa ra các chiến lược kinh doanh phù hợp.\r\n- Đạt được các chỉ tiêu doanh số và mục tiêu kinh doanh được giao theo tháng/quý/năm.', '3', 'Đại học', 'Thành thạo công cụ làm việc liên quan đến vị trí ứng tuyển', 'Giao tiếp tốt, làm việc nhóm', 'Có thể đi công tác khi cần', 6, '- Môi trường làm việc chuyên nghiệp, năng động, nơi bạn có thể phát huy tối đa năng lực và sự sáng tạo.\r\n- Cơ hội được làm việc và học hỏi trong một tập đoàn kinh tế hàng đầu Việt Nam với các sản phẩm chất lượng cao.\r\n- Chế độ đãi ngộ cạnh tranh, bao gồm lương thưởng hấp dẫn, bảo hiểm xã hội, bảo hiểm y tế, bảo hiểm thất nghiệp theo quy định của pháp luật.\r\n- Cơ hội đào tạo, phát triển sự nghiệp rõ ràng, thăng tiến lên các vị trí cao hơn trong công ty.', 'Thưởng hiệu suất và thưởng lễ Tết', 'Văn phòng chuyên nghiệp, thân thiện', 'Toàn thời gian cố đị', 'hot', 'toàn khu vực, Hoàng Mai', 'Ca hành chính', '2026-12-30', 'published', '2026-06-17 22:00:32', 2, '2026-06-17 14:49:01', '2026-07-23 01:09:07'),
(75, 4, 0, 57, 1, 'Nhân Viên Phục Vụ - Không Yêu Cầu Cao', 5, '• Phục vụ đồ ăn, thức uống cho khách\r\n• Đón tiếp khách hàng tại khu vực bàn, hướng dẫn họ đến bàn và giới thiệu thực đơn đồ ăn, thức uống.\r\n• Ghi order và truyền đạt yêu cầu đến bếp và quầy bar, đảm bảo order được thực hiện chính xác và kịp thời.\r\n• Mang đồ ăn, thức uống đến bàn khách hàng một cách chuyên nghiệp, đảm bảo đồ ăn nóng hổi và đồ uống tươi ngon khi đến tay khách.\r\n• Đáp ứng các yêu cầu của khách hàng trong suốt quá trình họ ở tại bàn, bar như : bổ sung đồ uống, thay đổi món ăn, hoặc cung cấp thêm thông tin về thực đơn.\r\n• Xử lý các tình huống phát sinh như khách hàng không hài lòng với món ăn, thức uống, báo ngay cho tổ trưởng hoặc trưởng bộ phận để có hướng giải quyết thích hợp.\r\n• Tư vấn thực đơn: Giới thiệu và tư vấn cho khách hàng các món ăn, thức uống nổi bật, các chương trình khuyến mãi của nhà hàng.', '0', 'Trung học', 'Kỹ năng chuyên môn đúng vị trí, thao tác nhanh và cẩn thận', 'Chủ động, trách nhiệm, chịu được áp lực', 'Có tinh thần trách nhiệm cao', 5, '• Được hưởng lương, thưởng theo quy định của khách sạn và tổng công ty,\r\n• Lương tháng 13, thưởng doanh thu, phép năm, sinh nhật.\r\n• Có kinh nghiệm dày dặn, bắt nhịp tốt, mức lương sẽ thương lượng điều chỉnh, đề xuất bổ nhiệm ( nếu cần)\r\n• Được đóng bảo hiểm xã hội, bảo hiểm y tế, bảo hiểm thất nghiệp, trợ cấp thôi việc theo quy định của pháp luật.\r\n• Môi trường làm việc thân thiện, năng động.\r\n• Có hỗ trợ nhà ở, có ký túc xá cho CBCNV ở xa\r\n• Thời gian làm việc linh hoạt theo 2 ca :\r\nCa 1: Từ 6:00-14:00\r\nCa 2: 14:00-22:00\r\nCó ngày nghỉ hàng tuần( không cố định vào Chủ Nhật). Nghỉ Lễ, Tết theo quy định.', 'Thưởng hiệu suất và thưởng lễ Tết', 'Đội ngũ quản lý hỗ trợ sát sao', 'Toàn thời gian cố đị', 'hot', '767 Nguyễn Văn Linh, Long Biên', 'Theo lịch phân công', '2026-08-03', 'published', '2026-06-17 22:00:32', 6, '2026-06-17 14:49:01', '2026-07-23 01:43:04'),
(76, 9, 0, 11, 1, 'Kỹ Sư Phát Triển Phần Mềm', 5, '- Tham gia phân tích yêu cầu dự án, thiết kế kiến trúc và phát triển các tính năng phần mềm/hệ thống theo kế hoạch.\r\n- Viết mã nguồn (code) đảm bảo chất lượng, tối ưu hiệu suất, dễ bảo trì và tuân thủ các tiêu chuẩn coding bài bản của công ty.\r\n- Phối hợp với đội ngũ Đảm bảo chất lượng (QA/QC) để kiểm thử, phát hiện và khắc phục các lỗi (bug) phần mềm.\r\n- Tham gia nâng cấp, tối ưu hóa và bảo trì các hệ thống, sản phẩm phần mềm hiện có của công ty.\r\n- Nghiên cứu, cập nhật các công nghệ mới để ứng dụng vào việc cải tiến sản phẩm và quy trình phát triển.\r\n- Viết tài liệu kỹ thuật, tài liệu hướng dẫn hệ thống và báo cáo tiến độ công việc định kỳ cho Quản lý trực tiếp.\r\n- Đã tham gia các dự án ERP, HRM, CRM hoặc Chuyển đổi số doanh nghiệp.\r\n- Hiểu biết về quy trình phát triển phần mềm Agile/Scrum là lợi thế.', '5', 'Đại học', 'Kỹ năng chuyên môn đúng vị trí, thao tác nhanh và cẩn thận', 'Tư duy dịch vụ khách hàng', 'Ưu tiên ứng viên có kinh nghiệm thực tế', 9, 'Thu nhập: 25 - 50 triêu đồng gồm Lương cơ bản + phụ cấp + thưởng\r\nĐược tiếp cận lộ trình đào tạo bài bản trong thời gian thử việc. Thời gian đào tạo được tính công tác phí, vẫn tính lương và thâm niên như bình thường.\r\nĐược tham gia chính sách phát triển nhân sự ưu việt: được cấp quỹ đào tạo hàng năm để chủ động tham gia các khóa học ngoài, được tham gia chương trình đào tạo inhouse.\r\nBảo hiểm xã hội đóng trên 100% lương.\r\nCác chế độ phép năm, lễ tết,… theo đúng 100% quy định của pháp luật lao động\r\nCác chế độ phúc lợi đầy đủ: Lễ tết hiếu hỉ được nhận tiền từ công đoàn, sinh nhật được nhận tiền mừng và quà tặng\r\nChính sách cho con công đoàn viên\r\nĐược làm việc trong một môi trường coi trọng người lao động, văn hóa doanh nghiệp rõ nét.\r\nĐược hưởng chế độ khám sức khỏe hàng năm.\r\nĐược đi du lịch nghỉ mát hàng năm cùng Công ty.\r\nLàm việc 5,5 ngày / tuần, nghỉ chiều thứ 7 và ngày chủ nhật', 'Thưởng doanh số theo kết quả công việc', 'Môi trường trẻ trung, năng động', 'Toàn thời gian cố đị', 'hot', 'Số 234A Ngô Gia Tự, Long Biên, Hà Nội, Long Biên', 'Ca hành chính', '2026-09-24', 'published', '2026-06-17 22:00:32', 9, '2026-06-17 14:49:01', '2026-07-22 23:36:38'),
(77, 11, 0, 52, 28, 'Quản Lý Nhà Hàng -  Nhớ Mãi', 5, '1. Quản lý Nhân sự:\r\nTuyển dụng, đào tạo và huấn luyện nhân viên mới, đảm bảo nhân sự đầy đủ cho hoạt động nhà hàng.\r\nLên kế hoạch đào tạo và phát triển đội ngũ kế thừa, đánh giá kết quả đào tạo và thử việc, đánh giá kết quả công việc và năng lực của nhân viên định kỳ.\r\nBố trí, phân công các ca làm việc hàng tuần của cấp dưới, điều động nhân viên, theo dõi chấm công hàng ngày.\r\nThực thi các quy định của Công ty về quản lý nhân sự, các chế độ, chính sách, phúc lợi cho nhân viên.\r\n2. Quản lý Khách hàng:\r\nGiải quyết các than phiền của khách hàng.\r\nTổ chức việc theo dõi đánh giá sự hài lòng của khách hàng, theo dõi và lên danh sách khách hàng thân thiết.\r\nTheo dõi việc đặt bàn, đặt chỗ và kiểm tra việc chuẩn bị đặt bàn (nếu có).\r\n3. Quản lý Hàng hóa/tài sản:\r\nQuản lý quy trình đặt hàng, nhận hàng, bảo quản và điều chuyển hàng hóa.\r\nQuản lý việc sử dụng và bảo quản tất cả các máy móc, trang thiết bị và dụng cụ trong nhà hàng.\r\nGiải trình cho Quản lý khu vực số lượng hư hỏng, mất mát (nếu có), kiểm soát, xử lý, ký hủy các loại sản phẩm hư hỏng.\r\nTổng hợp các báo cáo kiểm kê hàng hóa, công cụ dụng cụ, trang thiết bị cho phòng kế toán theo định kỳ.\r\n4. Quản lý Kinh doanh:\r\nĐảm bảo các chương trình Marketing tại nhà hàng hoạt động hiệu quả.\r\nĐề xuất các phương án kinh doanh giúp nhà hàng đạt hiệu quả tốt. Đề xuất phương án quảng bá, giới thiệu thương hiệu, hình ảnh nhà hàng đến khách hàng\r\nQuản lý tiền trong cửa hàng, đảm bảo không bị thất thoát.\r\nĐẩy mạnh việc thực hiện Trade up trong cửa hàng nhằm đặt được mục tiêu về kinh doanh.\r\n5. Quản lý Chi phí:\r\n\r\nQuản lý doanh thu hàng ngày.\r\nQuản lý quy trình xuất, hủy hoá đơn bán hàng trong ngày.\r\nThực thi nghiêm túc các quy trình bàn giao tiền, voucher mỗi ca.\r\nCập nhật báo cáo chi phí hàng ngày/tuần/tháng cho Quản lý khu vực.\r\nAm hiểu về các báo cáo kết quả hoạt động kinh doanh (P&L).\r\n6. Quản lý Hoạt động nhà hàng:\r\nTổ chức buổi họp đầu ca để hướng dẫn, truyền đạt thông tin cho nhân viên.\r\nHướng dẫn kỹ năng bán hàng cho nhân viên, đề xuất và thúc đẩy các chương trình khuyến mãi.\r\nXây dựng kế hoạch hoạt động tháng, tuần cho các bộ phận và tổ chức thực hiện.\r\nThực thi các form file, checklist nghiêm chỉnh, trung thực.\r\nGiải quyết các sự việc phát sinh liên quan trong ngày.\r\nTham dự các cuộc họp của phòng Điều hành, báo cáo tình hình hoạt động và kế hoạch công việc kinh doanh của nhà hàng.\r\n7. Quản lý Chất lượng sản phẩm:\r\nTổ chức cơ chế giám sát và trực tiếp giám sát việc thực thi theo các tiêu chuẩn, quy trình hướng dẫn của nhà hàng.\r\nKiểm tra chất lượng dịch vụ, đồ ăn và thức uống mỗi ca, mỗi ngày, đề xuất cải tiến chất lượng việc bảo quản sản phẩm và chất lượng dịch vụ của nhà hàng.\r\nDuy trì và bảo đảm chất lượng phục vụ, vệ sinh an toàn thực phẩm và an toàn an ninh trong nhà hàng.', '2', 'Cao đẳng', 'Thành thạo công cụ làm việc liên quan đến vị trí ứng tuyển', 'Cẩn thận, trung thực, ham học hỏi', 'Ưu tiên ứng viên có kinh nghiệm thực tế', 7, '- Hỗ trợ bữa ăn/phụ cấp ăn cho nhân viên tại Nhà hàng\r\n- Thưởng voucher sinh nhật, voucher nhân viên xuất sắc tháng\r\n- Ưu đãi 20% khi sử dụng dịch vụ tại nhà hàng thuộc hệ thống\r\n- Thưởng BSC cho nhà hàng đạt chỉ số hiệu quả kinh doanh\r\n- Lộ trình đào tạo, thăng tiến rõ ràng theo từng cấp bậc\r\n- Tham gia các hoạt động team building, year end party,..', 'Thưởng chuyên cần và thưởng sáng kiến', 'Môi trường trẻ trung, năng động', 'Toàn thời gian cố đị', 'hot', '111A Gò Dầu, Tân Phú', 'Thứ 2 - Thứ 6', '2026-11-30', 'published', '2026-06-17 22:00:32', 12, '2026-06-17 14:49:01', '2026-07-22 22:18:43'),
(78, 5, 0, 25, 27, 'Nhân Viên Bảo Trì Trang Trại', 1, '- Lập kế hoạch định kỳ kiểm tra, bảo trì, bảo dưỡng các trang thiết bị quan trọng của hệ thống chuồng trại, bao gồm máy phát điện, tủ lạnh dự trữ vaccine, tủ bảo quản thức ăn, hệ thống máy lạnh kho trứng, hệ thống quạt hút, hệ thống bơm ẩm, bơm hỏa tiễn, bơm nước lên bồn, bơm sát trùng, hệ thống điện, nước và chữa cháy.\r\n- Thực hiện sửa chữa các thiết bị và xử lý kịp thời các sự cố kỹ thuật trong phạm vi chuyên môn, đảm bảo hoạt động sản xuất không bị gián đoạn.\r\n- Đảm bảo hệ thống thiết bị, máy móc trong trại luôn vận hành tối ưu và hiệu quả, hoàn thành các chỉ tiêu về hiệu suất sử dụng được giao.\r\n- Bảo trì, bảo dưỡng các thiết bị hỏng hóc để tham vấn quản lý về giải pháp phòng ngừa, sử dụng hiệu quả và tiết kiệm chi phí.\r\n- Lên kế hoạch và yêu cầu mua vật tư, thiết bị điện, nước hàng tháng phục vụ nhu cầu của trang trại.\r\n- Nắm vững hệ thống thiết bị, máy móc, sơ đồ dẫn điện, nước, đảm bảo công tác an toàn tuyệt đối và có giải pháp khắc phục nhanh chóng khi có sự cố.\r\n- Đào tạo và hướng dẫn an toàn sử dụng thiết bị, điện nước cho nhân sự và công nhân tại trang trại.\r\n- Thực hiện thống kê, báo cáo công việc bảo trì chính xác, kịp thời và đúng quy định.', '0', 'Cao đẳng', 'Kỹ năng chuyên môn đúng vị trí, thao tác nhanh và cẩn thận', 'Cẩn thận, trung thực, ham học hỏi', 'Sẵn sàng học hỏi và tuân thủ quy trình', 11, '- Cơ hội được đào tạo chuyên sâu về kỹ thuật bảo trì, vận hành máy móc hiện đại trong ngành chăn nuôi.\r\n- Hưởng đầy đủ các chế độ phúc lợi theo quy định: BHYT, BH sức khỏe Tư nhân\r\n- Thưởng lễ, Tết, lương tháng 13 theo chính sách của công ty, thưởng hiệu suất làm việc (3-4 tháng).\r\n- Tham gia các hoạt động gắn kết đội ngũ, du lịch, team building hàng năm, tạo dựng môi trường làm việc tích cực và tinh thần đồng đội cao.\r\n- Lộ trình phát triển sự nghiệp rõ ràng, cơ hội thăng tiến lên các vị trí quản lý hoặc chuyên gia kỹ thuật.', 'Thưởng cuối năm theo quy định công ty', 'Môi trường trẻ trung, năng động', 'Toàn thời gian cố đị', 'hot', 'Ấp Đông Hòa, Trảng Bom', 'Linh hoạt theo ca', '2026-10-15', 'published', '2026-06-17 22:00:32', 6, '2026-06-17 14:49:01', '2026-07-23 01:05:46'),
(79, 5, 0, 34, 27, 'Nhân Viên Kỹ Thuật Trại (Chăn Nuôi Thú Y)', 1, '- Triển khai công việc sản xuất, kỹ thuật chăm sóc và nuôi dưỡng gà tại trại, đảm bảo đạt mục tiêu về sản lượng, năng suất và giá thành đã đề ra.\r\n- Giám sát và hướng dẫn công nhân thực hiện các nghiệp vụ, công việc hàng ngày liên quan đến chăm sóc gà và chuồng trại theo đúng quy trình quy định.\r\n- Thực hiện thăm khám, mổ gà để kiểm tra dịch bệnh, đồng thời hướng dẫn và tuân thủ nghiêm ngặt các biện pháp an toàn sinh học.\r\n- Thực hiện cân trọng lượng gà định kỳ, báo cáo trọng lượng bình quân và các chỉ số kỹ thuật quan trọng của từng giai đoạn phát triển của đàn gà.\r\n- Lập kế hoạch và thực hiện đặt hàng nguyên liệu thức ăn, vaccine, thuốc, đảm bảo giao nhận đúng lịch và tối ưu hóa nguồn lực.\r\n- Theo dõi các chỉ số kỹ thuật chăn nuôi như BW (Body Weight), HE (Hen-Day Egg Production) để phân tích và đề xuất giải pháp nâng cao năng suất.\r\n- Quản lý và sử dụng tối ưu nguồn lực (cám, thuốc, vaccine) trong hoạt động sản xuất, giám sát và thống kê đầy đủ thông tin, đảm bảo năng suất và chất lượng.\r\n- Thường xuyên giám sát chương trình chẩn đoán, mổ khám, phòng ngừa dịch bệnh, an toàn sinh học và an toàn cháy nổ, đưa ra giải pháp kịp thời để không có sự cố.\r\n- Giám sát, đánh giá chất lượng thiết bị, hệ thống điện nước, chuồng trại để đảm bảo vận hành tối ưu và không bị gián đoạn trong quá trình sản xuất.\r\n- Thực hiện thống kê, báo cáo chính xác, kịp thời theo quy định của công ty và yêu cầu từ cấp trên trực tiếp.\r\n- Đóng góp ý kiến xây dựng cơ cấu tổ chức bộ phận sản xuất tối ưu và hiệu quả, nâng cao chất lượng hoạt động.\r\n- Thực thi và tuân thủ các quy trình, quy định nội bộ, pháp luật liên quan cũng như trách nhiệm với môi trường và xã hội.', '1', 'Đại học', 'Thành thạo công cụ làm việc liên quan đến vị trí ứng tuyển', 'Chủ động, trách nhiệm, chịu được áp lực', 'Không yêu cầu kinh nghiệm, sẽ được đào tạo', 6, '- Môi trường làm việc năng động, chuyên nghiệp trong hệ thống chuỗi giá trị khép kín \"Từ trang trại đến bàn ăn\" của 3F VIỆT và Masan Meat Life.\r\n- Cơ hội được tham gia các chương trình đào tạo nội bộ và bên ngoài để nâng cao kiến thức chuyên môn về chăn nuôi và chẩn đoán dịch bệnh.\r\n- Được đóng góp vào việc xây dựng và phát huy văn hóa doanh nghiệp, tinh thần làm việc nhóm và trách nhiệm cá nhân.\r\n- Hưởng đầy đủ các chế độ phúc lợi theo quy định: BHYT, BH sức khỏe Tư nhân, …\r\n- Chế độ lương tháng 13, thưởng hiệu suất công việc (KPI 3-4 tháng) và các dịp lễ, Tết theo chính sách của công ty.\r\n- Tham gia các hoạt động gắn kết đội ngũ, du lịch, team building hàng năm, tạo sự cân bằng giữa công việc và cuộc sống.', 'Thưởng dự án khi hoàn thành mục tiêu', 'Không gian làm việc ổn định, sạch sẽ', 'Toàn thời gian cố đị', 'hot', 'Ấp Tân Hợp, Xuân Lộc', 'Linh hoạt theo ca', '2027-01-27', 'published', '2026-06-17 22:00:32', 6, '2026-06-17 14:49:01', '2026-07-23 01:02:40'),
(80, 10, 0, 5, 28, 'Kỹ sư Sale', 2, 'Trực tiếp làm công tác báo giá cho khách hàng\r\nThường xuyên theo dõi tình trạng các báo giá, liên hệ khách hàng để cập nhật kết quả báo giá.\r\n Hỗ trợ triển khai ký kết hợp đồng\r\nNghiên cứu và nắm bắt hiểu rõ sản phẩm/ dịch vụ của Công ty\r\nTìm hiểu thị trường và các đối thủ cạnh tranh.\r\nPhát triển mở rộng thị trường theo kế hoạch được giao.\r\nPhát triển doanh thu mảng Trading vật tư cách nhiệt\r\nThực hiện các hoạt động Sales/Marketing \r\nĐi công tác, gặp gỡ các khách hàng tiềm năng để quảng bá sản phẩm/dịch vụ của công ty.\r\nThực hiện các bài thuyết trình giới thiệu công ty bằng cách tập hợp phim ảnh, các slide trình bày, giới thiệu về sản phẩm dịch vụ; soạn thảo các phân tích đối thủ và khách hàng.\r\nXây dựng và thực hiện các chương trình PR, event, hội chợ, hội nghị khách hàng, họp báo, các chương trình chăm sóc sau bán hàng, chương trình quảng cáo … \r\nThực hiện các yêu cầu trực tiếp từ cấp trên.', '1', 'Đại học', 'Tin học văn phòng, sử dụng phần mềm quản lý cơ bản', 'Tư duy dịch vụ khách hàng', 'Có thể đi công tác khi cần', 7, 'Môi trường làm việc chuyên nghiệp, năng động với cơ hội học hỏi và phát triển nghề nghiệp rõ ràng.\r\nĐược đào tạo nâng cao kiến thức chuyên môn và các kỹ năng mềm cần thiết.\r\nTham gia đầy đủ BHXH, BHYT, BHTN theo quy định của pháp luật Việt Nam.\r\nLương tháng 13 và thưởng hiệu suất công việc theo kết quả kinh doanh của công ty.\r\nCơ hội tham gia các hoạt động team building, du lịch hàng năm của công ty.', 'Thưởng doanh số theo kết quả công việc', 'Môi trường trẻ trung, năng động', 'Toàn thời gian cố đị', 'hot', 'Đường số 32, KCN Đông Xuyên, Vũng Tàu', 'Thứ 2 - Thứ 6', '2026-11-25', 'published', '2026-06-17 22:00:32', 37, '2026-06-17 14:49:01', '2026-07-22 22:52:58'),
(81, 11, 0, 17, 23, 'Nhân viên vận tải tại Gia Lai', 4, 'Tư vấn, hỗ trợ khách hàng, cập nhật thông tin và chăm sóc sau dịch vụ', '1', 'postgraduate', 'Có khả năng đọc hiểu tài liệu, tổng hợp số liệu và lập báo cáo', 'Giao tiếp tốt, làm việc nhóm', 'Có thể đi công tác khi cần', 4, 'Được đào tạo nghiệp vụ và có cơ hội thăng tiến', 'Thưởng cuối năm theo quy định công ty', 'Môi trường trẻ trung, năng động', 'contract', 'hot', 'Gia Lai', 'Thứ 2 - Thứ 7', '2026-11-06', 'published', '2026-06-17 21:57:37', 2, '2026-06-17 14:49:01', '2026-06-17 21:57:37'),
(82, 17, 0, 3, 26, 'Nhân Viên Thiết Kế Đồ Họa, Thu Nhập 15 - 20 Triệu (Hàm Thuận Bắc, Bình Thuận Cũ)', 3, '- Thiết kế ấn phẩm truyền thông phục vụ bán hàng và marketing, bao gồm: \r\n\r\n+ Poster, banner, standee, backdrop sự kiện \r\n\r\n+ Catalogue sản phẩm, bảng giá, voucher, thẻ khách hàng \r\n\r\n+ Hình ảnh cho fanpage, website, Zalo OA, TikTok, YouTube thumbnail,... \r\n\r\n- Quay, dựng và chỉnh sửa video ngắn giới thiệu xe, chương trình khuyến mãi, sự kiện showroom. \r\n\r\n- Phối hợp với bộ phận kinh doanh và content để xây dựng hình ảnh trực quan, thu hút khách hàng. \r\n\r\n- Chụp ảnh sản phẩm, khách hàng và hoạt động tại showroom (nếu cần). \r\n\r\n- Quản lý kho dữ liệu thiết kế và video một cách có hệ thống. \r\n\r\n- Đảm bảo nhận diện thương hiệu (logo, màu sắc, phong cách) nhất quán theo định hướng công ty và thương hiệu xe máy. \r\n\r\n- Cập nhật xu hướng thiết kế và video ngắn (TikTok, reels...) để áp dụng hiệu quả.', '1', 'Cao đẳng', 'Kỹ năng chuyên môn đúng vị trí, thao tác nhanh và cẩn thận', 'Tư duy dịch vụ khách hàng', 'Có thể đi công tác khi cần', 7, '- Thưởng năng suất, Thưởng tháng 13 và Thưởng vượt trội cho CBNV có thành tích tốt.\r\n\r\n- Công ty hỗ trợ toàn bộ chi phí đi công tác, ngoài ra còn được hỗ trợ thêm phụ cấp đãi ngộ khác theo quy định của Công ty.\r\n\r\n- Tham gia đầy đủ chế độ BHXH, BHYT theo quy định.\r\n\r\n- Teambuilding, Tiệc tất niên... cùng công ty\r\n\r\n- Nghỉ phép năm, Lễ Tết theo qui định Nhà nước\r\n\r\n- Môi trường làm việc chuyên nghiệp, năng động, hòa đồng\r\n\r\n- Cung cấp trang thiết bị đầy đủ để phục vụ công việc\r\n\r\n- Được đào tạo hướng dẫn nhằm nâng cao kiến thức, chuyên môn. Cơ hội thăng tiến cao\r\n\r\n- Ứng viên phỏng vấn đạt sẽ nhận việc ngay', 'Thưởng dự án khi hoàn thành mục tiêu', 'Không gian làm việc ổn định, sạch sẽ', 'Toàn thời gian cố đị', 'hot', 'Khu thương mại Bến Lội, Lại An, Xã Hàm Thắng, Hàm Thuận Bắc', 'Thứ 2 - Thứ 6', '2026-12-02', 'published', '2026-06-17 21:57:37', 3, '2026-06-17 14:49:01', '2026-07-23 05:22:06'),
(83, 5, 0, 11, 17, 'Nhân Viên Quản Lý Dữ Liệu - Farm Nghệ An', 2, '- Cập nhật tiến độ, kết quả sản xuất hàng ngày đầy đủ, kịp thời lên hệ thống phần mềm.\r\n- Tổng hợp, trích xuất dữ liệu khi có yêu cầu và báo cáo, định hướng kịp thời các dấu hiệu bất thường về số liệu sản xuất.\r\n- Thực hiện tốt các công tác tổng hợp, báo cáo, trích xuất dữ liệu. Báo cáo theo dõi di truyền giống và đề xuất (nếu có). \r\n-  Bảo quản tốt cơ sở vật chất được giao, sử dụng công cụ, vật tư tiết kiệm và thực hiện tốt các nhiệm vụ khác được giao.\r\n- Phối hợp với các Phòng ban/Bộ phận liên quan (Kế toán, NCC) giải quyết kịp thời các vấn đề liên quan đến phần mềm & hệ thống dữ liệu.\r\n- Phối hợp với các Tổ/Nhóm nội bộ để hoàn thành tốt các mục tiêu sản xuất chung, đảm bảo không bị ách tắc trong phạm vi công việc của cá nhân. \r\n- Thực hiện các nhiệm vụ khác được giao', '1', 'high_school', 'Tin học văn phòng, sử dụng phần mềm quản lý cơ bản', 'Tư duy dịch vụ khách hàng', 'Sẵn sàng học hỏi và tuân thủ quy trình', 6, '- Lương hấp dẫn theo thỏa thuận, tương xứng với năng lực.\r\n- Đóng BH đầy đủ theo quy định: Bảo hiểm xã hội, y tế, thất nghiệp, bảo hiểm tai nạn 24h.\r\n- Công ty Miễn phí ăn ở toàn bộ, ở tại khu kí túc xá hiện đại, có điều hòa, Wifi free, các khu vực vui chơi, giải trí, thể dục thể thao như bóng đá, bóng chuyền, cầu lông, bóng bàn, coffee nhà vườn, karaoke giải trí...v..v\r\n- Thưởng năng suất tháng; Lương tháng 13, thưởng hàng năm từ 3 đến 6 tháng lương.\r\n- Xét tăng lương hàng năm theo năng lực.\r\n- Môi trường làm việc thân thiện, trẻ trung, năng động, đoàn kết, , Teambuilding hàng năm\r\n- Có cơ hội thăng tiến trong công việc', 'Thưởng chuyên cần và thưởng sáng kiến', 'Môi trường trẻ trung, năng động', 'part_time', 'hot', 'Xóm Côn Sơn, Xã Hạ Sơn, Quỳ Hợp', 'Thứ 2 - Thứ 6', '2026-08-14', 'published', '2026-06-17 21:57:37', 1, '2026-06-17 14:49:01', '2026-07-23 01:26:32'),
(84, 5, 0, 11, 28, 'Chuyên Viên Kế Toán Công Nợ Phải Thu', 1, '- Lập và theo dõi hóa đơn bán hàng (invoice): kiểm tra tính chính xác, đúng khách hàng, đúng điều khoản thanh toán trước khi phát hành.\r\n- Quản lý và theo dõi toàn bộ công nợ phải thu theo từng khách hàng, từng kênh phụ trách: số dư, hạn thanh toán, tình trạng thu hồi.\r\n- Đối chiếu công nợ định kỳ với khách hàng: xác nhận số dư, xử lý chênh lệch và ký biên bản đối chiếu theo quy định.\r\n- Theo dõi và nhắc nợ khách hàng theo lịch: gửi thông báo nhắc nợ, phối hợp với Sales team để thúc đẩy thu hồi công nợ đúng hạn.\r\n- Xử lý và hạch toán các khoản thu tiền: ghi nhận chính xác trên hệ thống ERP, đối chiếu với sao kê ngân hàng, xử lý khoản thu vượt/thiếu so với hóa đơn.\r\n- Quản lý và theo dõi các khoản chiết khấu thương mại, giảm giá, trade promotion được phê duyệt — đảm bảo ghi nhận đúng và khớp với chính sách bán hàng.\r\n- Phân tích tuổi nợ định kỳ: phân loại công nợ theo nhóm ngày quá hạn, đánh giá rủi ro và đề xuất trích lập dự phòng công nợ khó đòi.\r\n- Phối hợp với Sales, Trade Marketing và KAM để xử lý các khoản tranh chấp công nợ, hàng trả lại, điều chỉnh hóa đơn và bù trừ công nợ.\r\n- Kiểm soát hạn mức tín dụng của từng khách hàng: theo dõi, cảnh báo vượt hạn mức và đề xuất điều chỉnh khi cần.\r\n- Lập báo cáo công nợ phải thu định kỳ (tuần/tháng/quý)\r\n- Hỗ trợ kiểm toán nội bộ và kiểm toán bên ngoài: cung cấp hồ sơ, chứng từ công nợ phải thu theo yêu cầu, đảm bảo tuân thủ chuẩn mực kế toán VAS.\r\n- Lưu trữ đầy đủ hồ sơ, chứng từ liên quan công nợ phải thu: hợp đồng, hóa đơn, biên bản đối chiếu, xác nhận công nợ theo đúng quy định công ty và pháp luật.\r\n- Thực hiện các nhiệm vụ khác theo phân công của cấp quản lý', '3', 'Đại học', 'Thành thạo công cụ làm việc liên quan đến vị trí ứng tuyển', 'Chủ động, trách nhiệm, chịu được áp lực', 'Có tinh thần trách nhiệm cao', 6, 'Mức Lương cạnh tranh\r\nĐóng BHXH 100% lương\r\nLàm việc cùng đội ngũ giàu kinh nghiệm trong môi trường năng động, đề cao tinh thần hợp tác, sáng tạo và tạo điều kiện phát triển nghề nghiệp lâu dài.', 'Thưởng cuối năm theo quy định công ty', 'Không gian làm việc ổn định, sạch sẽ', 'Toàn thời gian cố đị', 'hot', '177 Lê Duẩn, Quận 1', 'Ca hành chính', '2026-09-15', 'published', '2026-06-17 21:57:37', 2, '2026-06-17 14:49:01', '2026-07-23 01:23:03'),
(85, 1, 0, 8, 28, 'Nhân Viên Tư Vấn Tài Chính Đi Làm Ngay Lương Trên 20M', 20, 'Nhắc nhở khách hàng về lịch thanh toán đúng hạn.\r\nHướng dẫn khách hàng các kênh và hình thức thanh toán phù hợp.\r\nCập nhật thông tin khách hàng và ghi nhận các phản hồi để cải thiện chất lượng dịch vụ.\r\nThời gian làm việc: Thứ Hai đến Thứ Bảy, từ 8:00 sáng đến 18:15 chiều, không yêu cầu làm thêm giờ.\r\nĐịa điểm làm việc: Tòa nhà Flemington, 182 Lê Đại Hành, Quận 11, TP.HCM hoặc OneHub, Đường D1, Phường Tân Phú (Quận 9 cũ), TP.HCM.\r\nVị trí tuyển dụng gấp, ưu tiên ứng viên có thể bắt đầu công việc ngay.', '0', 'Trung học', 'Biết sử dụng email, bảng tính và các công cụ cộng tác trực tuyến', 'Tư duy dịch vụ khách hàng', 'Không yêu cầu kinh nghiệm, sẽ được đào tạo', 7, 'Được tham gia đầy đủ BHXH, BHYT, BHTN theo quy định và hưởng thêm gói bảo hiểm với quyền lợi nâng cao.\r\nNhận lương tháng 13 cố định cuối năm không cần theo kết quả kinh doanh và hiệu quả làm việc.\r\nHưởng các chế độ phúc lợi công đoàn: sinh nhật, hiếu hỉ, thai sản và các chương trình chăm sóc nhân viên.\r\nMôi trường làm việc quốc tế, chuyên nghiệp; 14 ngày phép/năm và khám sức khỏe định kỳ.\r\nTham gia các hoạt động nội bộ, team building, du lịch và sự kiện gắn kết hằng năm.', 'Thưởng doanh số theo kết quả công việc', 'Không gian làm việc ổn định, sạch sẽ', 'Toàn thời gian cố đị', 'hot', 'Tòa nhà Flemington, 182 Lê Đại Hành, Quận 11', 'Ca hành chính', '2026-12-20', 'published', '2026-06-17 21:57:37', 2, '2026-06-17 14:49:01', '2026-07-23 07:50:57'),
(86, 19, 0, 10, 1, 'Cộng Tác Viên C&B (Nhân Sự)', 1, '. Vận hành Hành chính\r\nQuản lý thư từ: Tiếp nhận, gửi và điều phối thư từ, công văn cho team Nhân sự.\r\nVăn phòng phẩm: Theo dõi nhu cầu, đặt mua và tiếp nhận văn phòng phẩm định kỳ hàng tháng.\r\nThanh toán nội bộ: Hỗ trợ làm thủ tục thanh toán các chi phí phúc lợi, chi phí dịch vụ/đối tác (Outsource, Vendor) và công nợ hàng tháng.\r\n2. Hỗ trợ Công đoàn\r\nSoạn thảo văn bản: Hỗ trợ chuẩn bị các hồ sơ, giấy tờ liên quan đến hoạt động Công đoàn.\r\nTheo dõi thủ tục: Theo dõi tiến độ trình ký, scan và hoàn thiện lưu trữ hồ sơ Công đoàn.\r\n3. Hỗ trợ Nghiệp vụ Nhân sự (HRS)\r\nSố hóa & Lưu trữ: Scan hồ sơ/tài liệu HRS, upload lên hệ thống và quản lý hồ sơ cứng tại kho.\r\nTheo dõi Hợp đồng: Xử lý và theo dõi quy trình hợp đồng trên hệ thống CTMS, phối hợp đóng dấu và gửi lại các bên liên quan.\r\nHỗ trợ Onboarding: Hỗ trợ thực hiện các thủ tục tiếp nhận nhân sự mới.\r\nHỗ trợ công việc chung: Xử lý các giấy tờ, thủ tục hành chính và hỗ trợ công việc của team theo phân công.', '0', 'Cao đẳng', 'Thành thạo công cụ làm việc liên quan đến vị trí ứng tuyển', 'Kỹ năng xử lý tình huống', 'Ưu tiên ứng viên có kinh nghiệm thực tế', 4, 'Lương & Phụ cấp\r\nĐược hỗ trợ thù lao trong thời gian là CTV\r\nĐược cấp laptop, màn hình và các thiết bị/tài khoản/công cụ cần thiết khác cho công việc\r\nPhát triển sự nghiệp\r\nNguồn học e-learning miễn phí trên các nền tảng Udemy, Coursera, O\'relly, workshop nội bộ, tài trợ chứng nhận và Cố vấn độc quyền (C-level)\r\nCơ hội phát triển sự nghiệp rộng mở trong Hệ sinh thái Techcombank & Masterise Group\r\nMôi trường làm việc\r\nKhông gian làm việc mở và hợp tác thúc đẩy cả sự tập trung cá nhân và các hoạt động làm việc nhóm\r\nMôi trường, văn hóa làm việc sáng tạo, hiệu suất cao\r\nKhu vực thư giãn: chơi game, bóng bàn, yoga, phòng tập thể dục, phòng tắm.', 'Thưởng chuyên cần và thưởng sáng kiến', 'Môi trường trẻ trung, năng động', 'Toàn thời gian cố đị', 'hot', '45 Minh Khai, Phường Vĩnh Tuy, Quận Hai Bà Trưng, Thành phố Hà Nội, Việt Nam, Hai Bà Trưng', 'Ca hành chính', '2027-01-03', 'published', '2026-06-17 21:57:37', 2, '2026-06-17 14:49:01', '2026-07-23 04:27:20'),
(87, 11, 0, 31, 9, 'Quản lý chất lượng tại Lạng Sơn', 5, 'Tham gia triển khai kế hoạch, đề xuất cải tiến quy trình và nâng cao hiệu quả công việc', '2', 'college', 'Có khả năng đọc hiểu tài liệu, tổng hợp số liệu và lập báo cáo', 'Giao tiếp tốt, làm việc nhóm', 'Ưu tiên ứng viên có kinh nghiệm thực tế', 8, 'Hỗ trợ ăn trưa, gửi xe và các chế độ phúc lợi nội bộ', 'Thưởng chuyên cần và thưởng sáng kiến', 'Quy trình rõ ràng, hỗ trợ đào tạo', 'part_time', 'hot', 'Lạng Sơn', 'Thứ 2 - Thứ 6', '2026-08-25', 'published', '2026-06-17 21:57:37', 0, '2026-06-17 14:49:01', '2026-06-17 21:57:37'),
(88, 3, 0, 9, 6, 'Nhân viên hành chính văn phòng tại Sơn La', 5, 'Quản lý hồ sơ, nhập liệu, tổng hợp báo cáo và theo dõi tiến độ xử lý', '0', 'university', 'Tin học văn phòng, sử dụng phần mềm quản lý cơ bản', 'Kỹ năng xử lý tình huống', 'Ưu tiên ứng viên có kinh nghiệm thực tế', 11, 'Lương thưởng rõ ràng, xét tăng lương định kỳ', 'Thưởng chuyên cần và thưởng sáng kiến', 'Văn phòng chuyên nghiệp, thân thiện', 'internship', 'hot', 'Sơn La', 'Theo lịch phân công', '2026-10-31', 'published', '2026-06-17 21:57:37', 0, '2026-06-17 14:49:01', '2026-06-17 21:57:37'),
(89, 5, 0, 90, 28, 'Nhân Viên Bảo Trì Điện Lạnh Công Nghiệp', 2, '- Thực hiện kiểm tra, bảo trì định kỳ hệ thống điện lạnh công nghiệp theo kế hoạch.\r\n- Sửa chữa, khắc phục các sự cố phát sinh liên quan đến hệ thống điện lạnh, đảm bảo hoạt động ổn định.\r\n- Lắp đặt, thay thế các thiết bị, phụ tùng điện lạnh trong nhà máy khi có yêu cầu.\r\n- Ghi chép nhật ký vận hành, bảo trì, sửa chữa và báo cáo kết quả cho cấp trên.', '1', 'Trung cấp', 'Có khả năng đọc hiểu tài liệu, tổng hợp số liệu và lập báo cáo', 'Kỹ năng xử lý tình huống', 'Có tinh thần trách nhiệm cao', 7, '- Tham gia BHXH, BHYT, BHTN theo quy định của pháp luật.\r\n- Lương tháng 13, 14, 15, 16. Thưởng các dịp lễ, Tết và các khoản thưởng hiệu suất khác.\r\n- Cơ hội đào tạo nâng cao nghiệp vụ và phát triển sự nghiệp trong môi trường chuyên nghiệp.\r\n- Môi trường làm việc năng động, thân thiện, cơ hội làm việc với các chuyên gia đầu ngành.', 'Thưởng cuối năm theo quy định công ty', 'Đội ngũ quản lý hỗ trợ sát sao', 'Toàn thời gian cố đị', 'hot', 'Kiến An, An Lập, Dầu Tiếng', 'Thứ 2 - Thứ 6', '2027-08-15', 'published', '2026-06-17 21:57:37', 3, '2026-06-17 14:49:01', '2026-07-23 01:19:44'),
(90, 16, 0, 25, 1, 'Kỹ Sư Giám Sát Điện Nhẹ', 15, '- Lập kế hoạch thực hiện cho hạng mục mình phụ trách căn cứ trên bảng tiến độ chung của dự án\r\n\r\n- Làm việc với giám sát CĐT về vướng mắc hiện trường, nhận và bàn giao mặt bằng thi công.\r\n\r\n- Xác nhận BBHT thi công phát sinh và vướng mắc nếu có\r\n\r\n- Đảm bảo tiến độ, chất lượng hạng mục mình được giao giám sát.\r\n\r\n- Đảm bảo hạng mục được giao được triển khai, lắp đặt theo đúng thiết kế/bản vẽ shop được Chủ đầu tư phê duyệt.\r\n\r\n- Giao việc cho thầu phụ/tổ đội hàng ngày, trực tiếp giám sát quá trình thi công của thầu phụ/tổ đội - Phối hợp với cán bộ khối lượng đề xuất vật tư. Kiểm soát việc giao nhận vật tư cho nhà thầu/tổ đội Xử lý các vấn đề phát sinh với nhà thầu/tổ đội tại công trường; lập biên bản các vi phạm của nhà thầu/tổ đội; đề xuất chế tài phạt nhà thầu/tổ đội vi phạm trình Chỉ huy trưởng\r\n\r\n- Phối hợp với Kỹ sư vẽ shop để điều chỉnh phương án thi công khi có yêu cầu từ Chủ đầu tư hoặc xuất phát từ hiện trường\r\n\r\n- Tổ chức nghiệm thu chất lượng với thầu phụ và CĐT\r\n\r\n- Phối hợp với Kỹ sư khối lượng, vẽ hoàn công, đi nghiệm thu khối lượng, với Chủ đầu tư, bảo vệ khối lượng với Chủ đầu tư cho các hạng mục được giao\r\n\r\n- Xác nhận khu vực thi công, hồ sơ chất lượng cho thầu phụ\r\n\r\n- Thực hiện các công việc đặc thù tùy vào khối lượng công việc giám sát', '1', 'Đại học', 'Thành thạo công cụ làm việc liên quan đến vị trí ứng tuyển', 'Tư duy dịch vụ khách hàng', 'Có tinh thần trách nhiệm cao', 7, '- Lương + thưởng theo năng lực \r\n\r\n- BHXH theo quy đinh của nhà nước\r\n\r\n- Pantry phục vụ bữa sáng và bữa trưa tại công ty\r\n\r\n- Trang thiết bị phục vụ nhu cầu làm việc đầy đủ\r\n\r\n- Thi đua khen thưởng, review lương hàng năm\r\n\r\n- Lương tháng 13, thưởng doanh thu, thưởng Lễ, Tết, chế độ ốm đau, hiếu hỉ, thai sản, du lịch nghỉ mát hàng năm\r\n\r\n- Đặc biệt ưu đãi dành cho CBNV Nữ thời kỳ thai sản từ tháng thứ 8 trở đi có xe công ty/taxi đưa đón\r\n\r\n- Thời gian làm việc: Thứ 2 đến Thứ 7 và theo tiến độ của dự án', 'Thưởng chuyên cần và thưởng sáng kiến', 'Đội ngũ quản lý hỗ trợ sát sao', 'Toàn thời gian cố đị', 'hot', 'Tây Hồ, Xuân Phương, Thường Tín, Đông Anh, Văn Giang, Thanh Xuân', 'Thứ 2 - Thứ 6', '2026-07-31', 'published', '2026-06-17 21:57:37', 2, '2026-06-17 14:49:01', '2026-07-23 06:20:35'),
(91, 14, 0, 6, 13, '[Hải Phòng] Giám Sát Thực Thi Thị Trường Red', 2, 'Quản lý và giám sát đội ngũ RED Tracking, xây dựng và nâng cao tiêu chuẩn thực thi cũng như văn hóa làm việc của đội ngũ.\r\nChịu trách nhiệm quản lý hoạt động hằng ngày của đội ngũ RED Auditors, đảm bảo kế hoạch tuyến kiểm tra (Audit Route Plan) được thực hiện đầy đủ và đúng tiến độ.\r\nLập kế hoạch và triển khai tuyến khảo sát cho đội ngũ RED Trackers, dựa trên số lượng nhân sự hiện có, lịch trình hoạt động và các nguyên tắc, hướng dẫn lấy mẫu của chương trình RED.\r\nHuấn luyện, hướng dẫn và phát triển đội ngũ RED Trackers, đảm bảo hoạt động RED Tracking đáp ứng đầy đủ các yêu cầu về cả chất lượng và số lượng.\r\nTổ chức các khóa đào tạo RED định kỳ cho đội ngũ RED Trackers, tối thiểu 01 lần mỗi năm.\r\nThực hiện kiểm tra thực địa (Field Audit) nhằm đảm bảo chất lượng kiểm tra tuân thủ đúng tiêu chuẩn, bao gồm:\r\nKiểm tra ngẫu nhiên kết quả RED Tracking.\r\nGiám sát và hướng dẫn RED Trackers khi phát hiện sai sót.\r\nXây dựng và triển khai kế hoạch cải thiện (Improvement Plan) cho RED Trackers khi cần thiết.\r\nChủ trì cuộc họp hằng tuần của đội ngũ RED Trackers nhằm cập nhật tình hình công việc, kết quả thực hiện và các vấn đề cần cải thiện.\r\nCập nhật danh mục sản phẩm và khách hàng trên hệ thống iRED hằng tháng (với sự hỗ trợ của bộ phận IT).\r\nHỗ trợ RED Operations Manager trong việc chuẩn bị các báo cáo hiệu quả hoạt động RED để trình bày với đội ngũ Sales và Commercial, từ đó xác định các điểm cần cải thiện và các cơ hội phát triển thị trường.\r\nTham gia các cuộc họp định kỳ của chương trình RED nhằm cập nhật và thống nhất các thay đổi, điều chỉnh liên quan đến kế hoạch kiểm tra RED.\r\nĐảm bảo toàn bộ tài liệu, báo cáo và hồ sơ kiểm tra được lưu trữ đầy đủ, chính xác và có hệ thống thông qua các công cụ IT/Digital/System, bao gồm:\r\nKế hoạch và lịch trình kiểm tra.\r\nDữ liệu thu thập từ thị trường.\r\nCác kết quả và phát hiện từ hoạt động kiểm tra thị trường.\r\nCác tài liệu và hoạt động liên quan khác.', '2', 'Cao đẳng', 'Thành thạo công cụ làm việc liên quan đến vị trí ứng tuyển', 'Kỹ năng xử lý tình huống', 'Có tinh thần trách nhiệm cao', 8, '• Chế độ bảo hiểm\r\n\r\n• Du Lịch\r\n\r\n• Phụ cấp\r\n\r\n• Đồng phục\r\n\r\n• Chế độ thưởng\r\n\r\n• Chăm sóc sức khỏe\r\n\r\n• Đào tạo\r\n\r\n• Tăng lương\r\n\r\n• Công tác phí\r\n\r\n• Nghỉ phép năm\r\n\r\n• CLB thể thao', 'Thưởng dự án khi hoàn thành mục tiêu', 'Môi trường trẻ trung, năng động', 'Toàn thời gian cố đị', 'hot', 'Hải phòng, Ngô Quyền', 'Ca hành chính', '2026-08-16', 'published', '2026-06-17 21:57:37', 2, '2026-06-17 14:49:01', '2026-07-23 06:51:12'),
(92, 18, 0, 11, 28, 'Nhân Viên QC Tại Bến Cát Bình Dương (Đi Làm Ngay)', 10, 'Nắm rõ thông tin đơn hàng sản xuất,lên kế hoạch kiểm soát chất lượng\r\nThực hiện lấy mẫu, kiểm tra chất lượng sản phẩm trực tiếp tại khu vực được phân công.\r\nGiám sát các công đoạn, các thông số liên quan đến chất lượng sản phẩm trong quá trình sản xuất\r\nSử dụng, hiệu chuẩn thiết bị đo, vệ sinh thiết bị, dụng cụ đo sạch sẽ và bảo quản theo yêu cầu khuyến cáo.\r\nĐảm bảo chất lượng từ nguyên vật liệu đầu vào, tới bán thành phẩm đạt trước khi chuyển qua cho sản xuất.\r\nTuân thủ các quy trình, quy định, hướng dẫn và giám sát chéo bộ phận sản xuất. \r\nGiám sát, kiểm tra ngăn chặn những nguy cơ rủi ro tránh KPH xảy ra hàng loạt.', '1', 'Trung cấp', 'Biết sử dụng email, bảng tính và các công cụ cộng tác trực tuyến', 'Giao tiếp tốt, làm việc nhóm', 'Sẵn sàng học hỏi và tuân thủ quy trình', 5, 'Thu nhập từ 9.000.000 - 11.000.000 VNĐ/tháng, xét tăng lương định kỳ 01 lần/năm theo năng lực và hiệu quả công việc.\r\nThưởng các dịp Lễ, Tết, thưởng cuối năm theo kết quả hoạt động kinh doanh của Công ty.\r\nTham gia đầy đủ BHXH, BHYT, BHTN và các chế độ phúc lợi theo quy định của pháp luật.\r\nHưởng các khoản trợ cấp và phúc lợi khác theo chính sách của Công ty.\r\nMôi trường làm việc chuyên nghiệp, ổn định với nhiều cơ hội học hỏi và phát triển lâu dài.', 'Thưởng hiệu suất và thưởng lễ Tết', 'Văn phòng chuyên nghiệp, thân thiện', 'Toàn thời gian cố đị', 'hot', 'Số 99, tổ 5, An Mỹ, An Điền, Bến Cát, Bình dương (cũ), Bến Cát', 'Theo lịch phân công', '2026-09-07', 'published', '2026-06-17 21:57:37', 3, '2026-06-17 14:49:01', '2026-07-23 06:16:21'),
(93, 15, 0, 42, 28, 'Giáo Viên Tin Học', 4, 'Chuẩn bị giáo án, kế hoạch giảng dạy với mục tiêu học tập cụ thể\r\nTổ chức các hoạt động dạy và học theo hướng giúp phát triển năng lực cho học sinh\r\nTổ chức đánh giá hiệu quả học tập của học sinh để chủ động điều chỉnh phương pháp dạy học phù hợp\r\nXây dựng mối quan hệ tôn trọng, hợp tác với Phụ huynh và Học sinh', '2', 'Đại học', 'Tin học văn phòng, sử dụng phần mềm quản lý cơ bản', 'Giao tiếp tốt, làm việc nhóm', 'Sẵn sàng học hỏi và tuân thủ quy trình', 11, 'Hỗ trợ cơm trưa tại công ty;\r\nĐược hưởng các chế độ theo quy định của Luật Lao động hiện hành;\r\nThưởng vào tất cả các ngày Lễ & Tết trong năm: 01/01, Tết Âm lịch, Ngày GPMN (30/04) và QTLĐ (01/05), Lễ Quốc khánh (02/09), Lễ Khai giảng (05/9), 20/11 và kỷ niệm ngày thành lập trường\r\nƯu đãi học phí cho con toàn thể nhân viên theo học tại trường\r\nDu lịch nghỉ dưỡng hàng năm\r\nKhám sức khỏe định kỳ hàng năm\r\nThưởng theo đánh giá cuối năm học;\r\nLàm việc trong môi trường sư phạm, thân thiện, năng động, hiện đại, chuyên nghiệp theo chuẩn Quốc tế.', 'Thưởng dự án khi hoàn thành mục tiêu', 'Không gian làm việc ổn định, sạch sẽ', 'Toàn thời gian cố đị', 'hot', 'SỐ 8 ĐẶNG ĐẠI ĐỘ, PHƯỜNG TÂN PHONG, QUẬN 7, TP.HCM, Quận 7', 'Theo lịch phân công', '2026-12-26', 'published', '2026-06-17 21:57:37', 2, '2026-06-17 14:49:01', '2026-07-23 06:07:28'),
(94, 18, 0, 6, 28, 'Quản Lý Chăm Sóc Khách Hàng Quốc Tế (Thu Nhập Lên Đến 30 Triệu + Thưởng)', 3, 'Tiếp nhận nguồn khách hàng có sẵn, tư vấn và giới thiệu các sản phẩm, dịch vụ, chương trình khuyến mãi và chính sách bán hàng của Công ty.\r\nChủ động chăm sóc, duy trì và phát triển mối quan hệ với khách hàng quốc tế nhằm thúc đẩy doanh số và gia tăng đơn hàng.\r\nGửi mẫu sản phẩm, tiếp nhận đơn đặt hàng, theo dõi tiến độ sản xuất, giao hàng và đảm bảo đơn hàng được thực hiện đúng cam kết.\r\nPhối hợp chặt chẽ với các phòng ban như Kế toán, Thiết kế, Xuất nhập khẩu, Thu mua, Nhà máy... để xử lý đơn hàng và đáp ứng yêu cầu của khách hàng.\r\nTiếp nhận, giải đáp các thắc mắc, xử lý khiếu nại và các vấn đề phát sinh trong quá trình bán hàng, đảm bảo mang đến trải nghiệm dịch vụ chuyên nghiệp.\r\nPhân tích nhu cầu khách hàng, theo dõi xu hướng thị trường quốc tế và đề xuất các giải pháp nâng cao chất lượng dịch vụ, tối ưu quy trình chăm sóc khách hàng.\r\n(Đối với vị trí Trưởng nhóm/Trưởng bộ phận) Quản lý, đào tạo và phát triển đội ngũ nhân viên; xây dựng chiến lược chăm sóc khách hàng, nâng cao hiệu quả hoạt động và phối hợp với các phòng ban liên quan để đạt mục tiêu kinh doanh.', '3', 'Đại học', 'Thành thạo công cụ làm việc liên quan đến vị trí ứng tuyển', 'Chủ động, trách nhiệm, chịu được áp lực', 'Ưu tiên ứng viên có kinh nghiệm thực tế', 8, 'Thu nhập lên đến 25 triệu đồng/tháng (lương cứng + thưởng hiệu suất + hoa hồng hấp dẫn).\r\nThưởng theo kết quả kinh doanh và hiệu quả công việc, tạo cơ hội gia tăng thu nhập không giới hạn.\r\nLàm việc trong môi trường quốc tế, chuyên nghiệp và năng động, tiếp xúc với khách hàng nước ngoài và mở rộng kinh nghiệm.\r\nĐược đào tạo bài bản về chuyên môn, kỹ năng bán hàng, chăm sóc khách hàng và có lộ trình thăng tiến rõ ràng.\r\nTham gia đầy đủ BHXH, BHYT, BHTN theo quy định cùng các chế độ phúc lợi của công ty.\r\nHưởng các hoạt động team building, du lịch hằng năm, sự kiện nội bộ và các chính sách phúc lợi hấp dẫn khác.', 'Thưởng dự án khi hoàn thành mục tiêu', 'Văn phòng chuyên nghiệp, thân thiện', 'Toàn thời gian cố đị', 'hot', '999/1C, Nguyễn Thị Minh Khai, Tân Thắng, Tân Bình, Dĩ An', 'Theo lịch phân công', '2026-12-18', 'published', '2026-06-17 21:57:37', 3, '2026-06-17 14:49:01', '2026-07-23 05:05:38'),
(95, 14, 0, 18, 29, '[Long An] Thực Tập Sinh Kho Vận', 1, 'A. Tóm tắt công việc\r\n\r\nChịu trách nhiệm xuất và nhập hàng nguyên vật liệu\r\nThực hiện các chứng từ liên quan đến hoạt động xuất nhập và lưu trữ để làm cơ sở dữ liệu cho báo cáo tồn kho hàng ngày, tuần, tháng.\r\nKiểm kho định kỳ theo yêu cầu\r\nB. Trách nhiệm chính\r\n\r\n1. Quản lý các hoạt động kho vận\r\n\r\nDựa vào kế hoạch sản xuất để chuẩn bị nguyên vật liệu sẵn sàng tương ứng cũng như tiến hành bàn giao cho bộ phận sản xuất.\r\nCung cấp lịch giao nguyên vật liệu một cách hiệu quả nhất cho các bộ phận liên quan dựa vào các nguồn lực của Kho và nhu cầu sử dụng.\r\nKiểm đếm hàng tồn kho hàng ngày, hàng tháng, và hàng năm theo quy trình\r\nKiểm soát số lượng và các thông tin, chứng từ liên quan đến hoạt động xuất nhập hàng trước khi tiếp tục hoạt động xuất nhập.\r\nLưu trữ chứng từ giao dịch hàng ngày như quy trình.\r\nTheo dõi vệ sinh kho bãi theo tiêu chuẩn GMP, điều kiện lưu trữ, nhiệt độ, cập nhật thẻ kho đầy đủ và kịp thời.\r\nNhững công việc, báo cáo được yêu cầu bởi quản lý trực tiếp\r\n2. Tuân thủ:\r\n\r\nDuy trì bảo quản điều kiện kho theo yêu cầu của KORE / Chính sách an toàn, môi trường, sức khỏe và chất lượng của công ty.\r\nTuân thủ xuất, nhập hàng nguyên vật liệu theo quy định FEFO/FIFO và quy trình công ty\r\nSắp xếp kho bãi theo layout và quy trình lưu trữ tiêu chuẩn\r\n3. Phát triển nguồn lực:\r\n\r\nTham gia các lớp học trong chương trình SCFX và những khóa học khác do Công ty tổ chức', '1', 'Cao đẳng', 'Biết sử dụng email, bảng tính và các công cụ cộng tác trực tuyến', 'Tư duy dịch vụ khách hàng', 'Ưu tiên ứng viên có kinh nghiệm thực tế', 4, '− Chế độ bảo hiểm\r\n\r\n− Phụ cấp\r\n\r\n− Đồng phục\r\n\r\n− Đào tạo\r\n\r\n− CLB thể thao', 'Thưởng hiệu suất và thưởng lễ Tết', 'Quy trình rõ ràng, hỗ trợ đào tạo', 'Toàn thời gian cố đị', 'hot', 'Long An, Bến Lức', 'Linh hoạt theo ca', '2026-10-28', 'published', '2026-06-17 21:57:37', 3, '2026-06-17 14:49:01', '2026-07-23 06:45:23'),
(96, 15, 0, 42, 28, 'Giáo Viên Âm Nhạc - Trường Quốc Tế', 2, 'Lập kế hoạch giảng dạy, giáo dục học sinh Bộ môn Âm nhạc theo chương trình Bộ Giáo dục quy định.\r\nSoạn, giảng dạy đầy đủ số tiết theo thời khóa biểu.\r\nQuản lý học sinh trong các hoạt động giáo dục do nhà trường tổ chức.\r\nPhối hợp với gia đình học sinh để giáo dục rèn luyện học sinh.\r\nTham gia xây dựng nội dung, chương trình đổi mới hình thức và phương pháp dạy học cho học sinh nhầm nâng cao chất lượng dạy và học trong nhà trường.\r\nDàn dựng một số tiết mục phục vụ cho các chương trình lễ hội của nhà trường.', '2', 'Trung cấp', 'Thành thạo công cụ làm việc liên quan đến vị trí ứng tuyển', 'Kỹ năng xử lý tình huống', 'Có tinh thần trách nhiệm cao', 6, 'Hỗ trợ cơm trưa tại công ty;\r\nĐược hưởng các chế độ theo quy định của Luật Lao động hiện hành;\r\nThưởng vào tất cả các ngày Lễ & Tết trong năm: 01/01, Tết Âm lịch, Ngày GPMN (30/04) và QTLĐ (01/05), Lễ Quốc khánh (02/09), Lễ Khai giảng (05/9), 20/11 và kỷ niệm ngày thành lập trường\r\nƯu đãi học phí cho con toàn thể nhân viên theo học tại trường\r\nDu lịch nghỉ dưỡng hàng năm\r\nKhám sức khỏe định kỳ hàng năm\r\nThưởng theo đánh giá cuối năm học;\r\nLàm việc trong môi trường sư phạm, thân thiện, năng động, hiện đại, chuyên nghiệp theo chuẩn Quốc tế.', 'Thưởng cuối năm theo quy định công ty', 'Quy trình rõ ràng, hỗ trợ đào tạo', 'Toàn thời gian cố đị', 'hot', 'SỐ 18 ĐẶNG ĐẠI ĐỘ, PHƯỜNG TÂN PHONG, QUẬN 7, TP.HCM, Quận 7', 'Ca hành chính', '2026-12-19', 'published', '2026-06-17 21:57:37', 2, '2026-06-17 14:49:01', '2026-07-23 06:05:38'),
(97, 2, 0, 87, 28, 'Kỹ Sư Môi Trường (Thiết Kế - Vận Hành Hệ Thống Xử Lý Môi Trường)', 5, '- Thiết kế các hệ thống xử lý nước cấp, nước thải và khí thải.\r\n- Viết thuyết minh công nghệ và lập dự toán các công trình xử lý nước cấp, nước thải, khí thải;\r\n- Tổ chức thi công, giám sát các công trình đã thiết kế, lắp đăt đường ống, máy móc thiết bị, thực hiện các công việc vận hành hệ thống xử lý nước cấp, nước thải, và khí thải\r\n- Lập bản vẽ hoàn công và hướng dẫn vận hành.\r\n- Nghiệm thu công trình xử lý nước cấp,nước thải, khí thải.\r\n- Tư vấn, báo giá và làm hợp đồng về dịch vụ tư vấn môi trường.\r\n- Lên phương án báo giá cạnh tranh.\r\n- Lựa chọn các giải pháp công nghệ phù hợp cho từng loại hình xử lý nước cấp, nước thải, khí thải;\r\n- Đề xuất hướng nghiên cứu công nghệ hoặc tiếp thu công nghệ mới về xử lý nước, nước thải ;\r\n- Tính toán, lựa chọn thiết bị và thiết kế công nghệ XLN, NT;\r\n- Xây dựng hồ sơ thầu;\r\n- Kiểm tra thực hiện và giám sát công tác khử mùi, vệ sinh môi trường trong nhà máy.\r\n- Vận hành các hệ thống xử lý nước thải, khí thải.....\r\n- Thời gian làm việc từ thứ 2 đến sáng thứ 7 (Buổi sáng từ 8h - 12h, buổi chiều từ 13h - 17h).', '1', 'Đại học', 'Thành thạo công cụ làm việc liên quan đến vị trí ứng tuyển', 'Tư duy dịch vụ khách hàng', 'Sẵn sàng học hỏi và tuân thủ quy trình', 7, '- Được hưởng mức thu nhập cao;\r\n- Tăng lương theo năng lực\r\n- Thưởng khi hoàn thành tốt công việc và hoàn thành công trình\r\n- Làm việc trong môi trường chuyên nghiệp, hoà đồng, nhiều cơ hội phát triển nghề nghiệp, cơ hội thăng tiến;\r\n- Được hưởng các chế độ phúc lợi, đãi ngộ tốt nhất: Thưởng các dịp lễ, tết, phép năm và các chế độ khác theo quy định của Cty.', 'Thưởng doanh số theo kết quả công việc', 'Văn phòng chuyên nghiệp, thân thiện', 'Toàn thời gian cố đị', 'hot', '15/4 Nguyễn Oanh, Phường 17, Gò Vấp', 'Thứ 2 - Thứ 6', '2026-08-01', 'published', '2026-06-17 21:57:37', 2, '2026-06-17 14:49:01', '2026-07-23 02:20:15'),
(98, 21, 0, 4, 28, 'Nhân Viên Marketing', 2, '- Xây dựng và triển khai kế hoạch Digital Marketing nhằm tăng nhận diện thương hiệu và thúc đẩy doanh số bán hàng.\r\n- Lập kế hoạch, quản lý và tối ưu các chiến dịch quảng cáo trên các nền tảng như Facebook, Google, bán hàng kênh thương mại điện tử ...\r\n- Quản lý và phát triển các kênh truyền thông: Website, Fanpage...\r\n- Phối hợp với bộ phận liên quan và Sales để triển khai các chương trình marketing, khuyến mại và ra mắt sản phẩm.\r\n- Nghiên cứu thị trường, đối thủ cạnh tranh và xu hướng Digital Marketing để đề xuất các giải pháp cải thiện hiệu quả.\r\n- Báo cáo công việc thực hiện \r\n- Làm việc theo sự chỉ đạo hướng dẫn của cấp trên.', '2', 'Cao đẳng', 'Kỹ năng chuyên môn đúng vị trí, thao tác nhanh và cẩn thận', 'Chủ động, trách nhiệm, chịu được áp lực', 'Có tinh thần trách nhiệm cao', 5, '-    Mức lương:  trao đổi khi phỏng vấn\r\n-    Được tham gia BHXH theo quy định\r\n-    Được hưởng các chế độ theo quy định của Luật Lao động và Công ty', 'Thưởng hiệu suất và thưởng lễ Tết', 'Không gian làm việc ổn định, sạch sẽ', 'Toàn thời gian cố đị', 'hot', '6 Đường N4, KCN Tân Phú Trung, Ấp trạm bơm, Xã Tân Phú Trung, Củ Chi', 'Theo lịch phân công', '2026-08-08', 'published', '2026-06-17 21:57:37', 1, '2026-06-17 14:49:01', '2026-07-23 02:56:23'),
(99, 12, 0, 98, 1, 'Nhân Viên Xử Lý Dữ Liệu - Hỗ Trợ Kinh Doanh', 2, '•    Thu thập, làm sạch, tổng hợp và xử lý dữ liệu từ nhiều nguồn khác nhau.\r\n•    Đảm bảo tính chính xác và tính nhất quán của dữ liệu.\r\n•    Duy trì và cải tiến các báo cáo BAU.\r\n•    Phát triển các tính năng và cải tiến báo cáo theo nhu cầu kinh doanh.\r\n•    Thực hiện các báo cáo ad hoc cho các phòng ban và các nhóm liên chức năng.\r\n•    Thực hiện các công việc phát sinh theo phân công của Team Lead.', '1', 'Đại học', 'Thành thạo công cụ làm việc liên quan đến vị trí ứng tuyển', 'Cẩn thận, trung thực, ham học hỏi', 'Có thể đi công tác khi cần', 6, '- Môi trường làm việc năng động, chuyên nghiệp tại một trong những đơn vị logistics hàng đầu Việt Nam.\r\n- Cơ hội học hỏi và phát triển các kỹ năng về phân tích dữ liệu, AI và công nghệ.\r\n- Được tham gia các chương trình đào tạo nội bộ và cơ hội thăng tiến rõ ràng.\r\n- Hưởng đầy đủ các chế độ bảo hiểm theo quy định của pháp luật (BHXH, BHYT, BHTN).\r\n- Các hoạt động team building, du lịch và các phúc lợi khác theo quy định của công ty.', 'Thưởng hiệu suất và thưởng lễ Tết', 'Văn phòng chuyên nghiệp, thân thiện', 'Toàn thời gian cố đị', 'hot', 'Hà Nội', 'Thứ 2 - Thứ 7', '2026-07-30', 'published', '2026-06-17 21:57:37', 2, '2026-06-17 14:49:01', '2026-07-22 21:54:01'),
(100, 21, 0, 39, 28, '6 Đường N4, KCN Tân Phú Trung, Xã Tân Phú Trung, Củ Chi, Củ Chi', 10, 'Làm kinh doanh: tư vấn; bán hàng; triển khai chính sách, chương trình bán hàng.\r\nPhát triển hệ thống đại lý, trang trại chăn nuôi\r\nChi tiết công việc sẽ trao đổi trực tiếp trong quá trình phỏng vấn.', '2', 'Cao đẳng', 'Biết sử dụng email, bảng tính và các công cụ cộng tác trực tuyến', 'Chủ động, trách nhiệm, chịu được áp lực', 'Ưu tiên ứng viên có kinh nghiệm thực tế', 6, 'Mức lương: thoả thuận khi phỏng vấn\r\nĐược hưởng đầy đủ các chế độ theo luật lao động và Công ty.\r\nChính sách phúc lợi đầy đủ', 'Thưởng dự án khi hoàn thành mục tiêu', 'Đội ngũ quản lý hỗ trợ sát sao', 'Toàn thời gian cố đị', 'hot', '6 Đường N4, KCN Tân Phú Trung, Xã Tân Phú Trung, Củ Chi, Củ Chi', 'Ca hành chính', '2026-11-26', 'published', '2026-06-17 21:57:37', 3, '2026-06-17 14:49:01', '2026-07-23 02:53:12');
INSERT INTO `hicrm_job_posts` (`id`, `employer_id`, `candidate_id`, `job_category_id`, `province_id`, `title`, `quantity`, `job_description`, `experience_years`, `degree_required`, `professional_skills`, `soft_skills`, `other_requirements`, `salary_id`, `benefits_description`, `rewards_description`, `work_environment`, `work_type`, `job_post_type`, `address_detail`, `working_time`, `deadline`, `status`, `published_at`, `views_count`, `created_at`, `updated_at`) VALUES
(101, 8, 0, 26, 11, 'Unilever Bắc Ninh - Nhân Viên Vận Hành Máy Khuấy Trộn / Mixing', 6, '1. Vận Hành & Kỹ Thuật\r\n\r\nVận hành thiết bị an toàn, đúng kỹ thuật để đạt kế hoạch sản xuất.\r\nVệ sinh, bôi trơn và kiểm tra máy thường xuyên.\r\nThực hiện chuyển đổi sản phẩm và vệ sinh thanh trùng chuẩn xác, tiết kiệm thời gian.\r\nNắm rõ nguyên lý cơ khí, khí nén để vận hành hiệu quả.\r\n2. An Toàn, Chất Lượng & Môi Trường\r\n\r\nTuân thủ các quy định bảo hộ và an toàn thiết bị để bảo vệ mình và đồng nghiệp.\r\nKiểm soát chặt chẽ thông số sản phẩm, đảm bảo không có hàng lỗi ra thị trường.\r\nGiảm phế thải, phân loại rác đúng cách để bảo vệ môi trường và tiết kiệm chi phí.\r\n3. Cải Tiến & Giải Quyết Vấn Đề\r\n\r\nÁp dụng công cụ WCM để tìm và loại bỏ lãng phí; chủ động báo cáo dữ liệu sản xuất.\r\nNhận diện và giải quyết triệt để tận gốc nguyên nhân sự cố, không để lỗi lặp lại.\r\n4. Các công việc khác do trưởng bộ phận phân công', '1', 'Trung cấp', 'Có khả năng đọc hiểu tài liệu, tổng hợp số liệu và lập báo cáo', 'Giao tiếp tốt, làm việc nhóm', 'Có tinh thần trách nhiệm cao', 7, 'Lương : từ 15 - 16 triệu\r\nHưởng BHXH theo 100% mức lương Gross.\r\nBảo hiểm sức khỏe cho nhân viên + người thân & Bảo hiểm Tai nạn.\r\nThưởng tháng 13 & các khoản thưởng Lễ trong năm\r\n12 ngày phép/năm\r\nPhục vụ cơm tại căn-tin nhà máy.\r\nCơ hội phát triển sự nghiệp tại môi trường làm việc hiện đại, nhà máy 4.0 với công nghệ tiên tiến, đạt chuẩn quốc tế cùng các chương trình đào tạo nội bộ thường xuyên giúp nâng cao nghiệp vụ.', 'Thưởng doanh số theo kết quả công việc', 'Môi trường trẻ trung, năng động', 'Toàn thời gian cố đị', 'hot', 'Khu công nghiệp đô thị và dịch vụ VSIP Bắc Ninh, Từ Sơn', 'Ca hành chính', '2026-12-03', 'published', '2026-06-17 21:57:09', 2, '2026-06-17 14:49:01', '2026-07-23 07:18:36'),
(102, 17, 0, 4, 26, 'Thiết Kế Đồ Họa', 1, '- Thiết kế bộ nhận diện thương hiệu của công ty: logo, câu slogan, profile, brochure, catalogue, danh thiếp, bì thư, thẻ nhân viên, đồng phục, các biển hiệu…Chỉnh sửa, cập nhật hình ảnh quảng cáo trên Fanpage, Website, Frame thang máy trong tòa nhà.\r\n\r\n- Tương tác với bộ phận Marketing và Sales để thiết kế Digital Banner, Poster, Brochure, catalogue, profile, Folder, hình ảnh layout 2D và 3D, ... phục vụ cho các kênh truyền thông của công ty như Website, Facebook, Youtube, ...\r\n\r\n- Xây dựng ý tưởng theo yêu sản phẩm và yêu cầu của các phòng ban / khách hàng.\r\n\r\n- Triển khai, giám sát việc sản xuất thành phẩm các sản phẩm mới thiết kế lần đầu. Kiểm tra chất lượng in ấn của thiết kế.\r\n\r\n- Hỗ trợ công việc của các bộ phận khác như Nhân Sự, Kinh doanh, Event khi làm các thông báo, chương trình hoạt động nội bộ.\r\n\r\n- Liên tục cập nhật các xu hướng thiết kế mới.', '1', 'Trung cấp', 'Thành thạo công cụ làm việc liên quan đến vị trí ứng tuyển', 'Chủ động, trách nhiệm, chịu được áp lực', 'Có tinh thần trách nhiệm cao', 6, '- Thu nhập cao, thoả thuận trực tiếp khi phỏng vấn. \r\n- Môi trường làm việc chuyên nghiệp, năng động, thăng tiến. \r\n- Hưởng đầy đủ chế độ theo luật lao động (BHYT, BHXH...) \r\n- Được tham gia các khóa đào tạo nâng cao nghiệp vụ tại đại lý Honda Ôtô Bình Thuận - Phan Thiết và công ty Honda Việt Nam. \r\n- Được hưởng các chế độ đãi ngộ khác theo quy định của công ty. \r\n- Được hưởng lương tháng 13', 'Thưởng hiệu suất và thưởng lễ Tết', 'Quy trình rõ ràng, hỗ trợ đào tạo', 'Toàn thời gian cố đị', 'hot', '4316 Trần Hưng Đạo, Phan Thiết, Lâm Đồng (Bình Thuận cũ), Phan Thiết', 'Theo lịch phân công', '2026-07-31', 'published', '2026-06-17 21:57:09', 9, '2026-06-17 14:49:01', '2026-07-23 07:14:51'),
(103, 16, 0, 97, 1, 'Chỉ Huy Trưởng MEP', 5, '1. Lập và trình kế hoạch triển khai dự án\r\n\r\n2. Quản lý và tổ chức triển khai thi công dự án theo kế hoạch được phê duyệt\r\n\r\n3. Quản lý chất lượng, khối lượng tiến tại dự án\r\n\r\n4. Quản lý và kiểm soát vật tư, nhân công (Nhà thầu, tổ đội...)\r\n\r\n5. Phân công công việc, kèm cặp nhân và kiểm soát, đánh giá kết quả công việc nhân sự BCH\r\n\r\n6. Phối hợp phòng dự án, phòng thương mại, kế toán, giải pháp, HCNS xử lý các vấn đề liên quan đến dự án phụ trách\r\n\r\n7. Đại diện công ty làm việc với CĐT, thầu phụ\r\n\r\n8. Báo cáo công việc định kỳ và đề xuất các giải pháp xử lý công việc trình lên BGĐ', '1', 'Cao đẳng', 'Có khả năng đọc hiểu tài liệu, tổng hợp số liệu và lập báo cáo', 'Cẩn thận, trung thực, ham học hỏi', 'Không yêu cầu kinh nghiệm, sẽ được đào tạo', 8, '- Thu nhập tương xứng theo năng lực + Phụ cấp + Phí công tác\r\n\r\n- Hỗ trợ tất cả chỗ ở, chi phí di chuyển đi dự án\r\n\r\n- Trang thiết bị phục vụ nhu cầu làm việc đầy đủ\r\n\r\n- Thi đua khen thưởng, review lương hàng năm\r\n\r\n- Chế độ BHXH, BHTN 24/7\r\n\r\n- Lương tháng 13, thưởng doanh thu, thưởng Lễ, Tết, chế độ ốm đau, hiếu hỉ, thai sản, du lịch nghỉ mát hàng năm (Trrong nước và nước ngoài theo thành tích cá nhân)\r\n\r\n- Thời gian làm việc: Theo thực tế công trường từ thứ 2- thứ 7', 'Thưởng chuyên cần và thưởng sáng kiến', 'Môi trường trẻ trung, năng động', 'Toàn thời gian cố đị', 'hot', 'Xuân Phương, Đông Anh, Thanh Xuân', 'Theo lịch phân công', '2026-08-16', 'published', '2026-06-17 21:57:09', 7, '2026-06-17 14:49:01', '2026-07-23 06:23:00'),
(104, 15, 0, 38, 28, 'Nhân Viên Y Tế - Trường Quốc Tế Hoàng Hạ', 2, '-Tổ chức các hoạt động quản lý, bảo vệ và chăm sóc sức khỏe học sinh trong nhà trường\r\n\r\n-Tổ chức các hoạt động truyền thông, giáo dục sức khỏe\r\n\r\n-Quản lý hồ sơ an toàn vệ sinh thực phẩm\r\n\r\n-Quản lý thuốc, các thiết bị y tế\r\n\r\n-Quản lý Bảo hiểm y tế (BHYT) HS', '1', 'Trung cấp', 'Tin học văn phòng, sử dụng phần mềm quản lý cơ bản', 'Cẩn thận, trung thực, ham học hỏi', 'Sẵn sàng học hỏi và tuân thủ quy trình', 11, '- Hỗ trợ cơm trưa tại công ty;\r\n\r\n- Được hưởng các chế độ theo quy định của Luật Lao động hiện hành;\r\n\r\n- Thưởng vào tất cả các ngày Lễ & Tết trong năm: 01/01, Tết Âm lịch, Ngày GPMN (30/04) và QTLĐ (01/05), Lễ Quốc khánh (02/09), Lễ Khai giảng (05/9) và 20/11\r\n\r\n- Thưởng theo đánh giá cuối năm học;\r\n\r\n- 1 năm có 12 ngày phép;\r\n\r\n- Làm việc trong môi trường sư phạm, thân thiện, năng động, hiện đại, chuyên nghiệp theo chuẩn Quốc tế.', 'Thưởng chuyên cần và thưởng sáng kiến', 'Môi trường trẻ trung, năng động', 'Toàn thời gian cố đị', 'hot', 'Cơ sở quận 7, Quận 7', 'Ca hành chính', '2026-08-29', 'published', '2026-06-17 21:57:09', 2, '2026-06-17 14:49:01', '2026-07-23 06:09:43'),
(105, 19, 0, 10, 1, 'CTV Đào Tạo & Phát Triển Tài Năng', 1, 'Hỗ trợ các hoạt động đào tạo và phát triển con người, bao gồm:\r\nThiết kế thư mời, truyền thông và tổ chức các chương trình đào tạo cho học viên\r\nChuẩn bị cơ sở vật chất và văn phòng phẩm cho các sự kiện đào tạo (trước, trong và sau hoạt động đào tạo);\r\nPhụ trách triển khai mua sắm các dịch vụ, sản phẩm phục vụ công tác đào tạo\r\nThực hiện các công tác quản trị cơ bản trên hệ thống E-learning theo hướng dẫn\r\nHỗ trợ xây dựng các báo cáo, dashboard về đào tạo & phát triển theo hướng dẫn\r\nHỗ trợ hoàn thiện các tài liệu đào tạo (chỉnh sửa Word/ Power Point và in ấn - nếu cần)\r\nThực hiện các nhiệm vụ khác do QLTT hoặc/và Công ty giao', '1', 'university', 'Tin học văn phòng, sử dụng phần mềm quản lý cơ bản', 'Tư duy dịch vụ khách hàng', 'Có thể đi công tác khi cần', 6, 'Thu nhập cạnh tranh (Từ 8 - 12 triệu)\r\nĐược cấp laptop và và các trang thiết bị phục vụ công việc\r\nCơ hội trải nghiệm môi trường làm việc trẻ trung, năng động, chuyên nghiệp\r\nCơ hội để nhanh chóng nâng cao năng lực của bạn bằng cách thử thách bản thân trong một hệ sinh thái công nghệ rộng lớn\r\nCon đường sự nghiệp rõ ràng và nhiều tiềm năng phát triển\r\n\r\nMôi trường làm việc\r\nVăn phòng Agile hiện đại và linh hoạt được trang bị đầy đủ tiện nghi chơi game, yoga, gym, khu ăn trưa, tủ đựng đồ cá nhân bằng QR Code, open space làm việc tự do...\r\nVăn hóa học tập, khuyến khích đưa ra ý kiến đề xuất ​​và thái độ chủ động\r\n\r\nCác sự kiện nội bộ khác\r\nCơ hội phát triển bản thân thần tốc và vượt trội\r\nTham gia triển khai các hoạt động hoặc sáng kiến đào tạo dẫn đầu thị trường\r\nĐược thử thách chính mình trong những chương trình lớn và tiếp cận với mọi khía cạnh của nghề L&D\r\nĐược đào tạo bài bản về chuyên môn, nghiệp vụ nghề và các mô hình L&D chuẩn quốc tế trong thời gian ngắn\r\nĐược trao cơ hội phụ trách các chương trình/sáng kiến mới để phát triển năng lực trong nghề L&D\r\nĐội ngũ L&D có mật độ nhân tài cao, có văn hóa hỗ trợ, phản hồi liên tục để phát triển toàn diện với mục tiêu tạo ra một đội nhóm hiệu suất cao', 'Thưởng chuyên cần và thưởng sáng kiến', 'Văn phòng chuyên nghiệp, thân thiện', 'Toàn thời gian cố đị', 'hot', '45 Minh Khai, Phường Vĩnh Tuy, Quận Hai Bà Trưng, Thành phố Hà Nội, Việt Nam, Hai Bà Trưng', 'Ca hành chính', '2026-08-04', 'published', '2026-06-17 21:57:09', 3, '2026-06-17 14:49:01', '2026-07-23 04:32:51'),
(106, 11, 0, 16, 28, 'Nhân viên Logistics', 9, 'Tham gia triển khai kế hoạch, đề xuất cải tiến quy trình và nâng cao hiệu quả công việc', '1', 'none', 'Kỹ năng chuyên môn đúng vị trí, thao tác nhanh và cẩn thận', 'Chủ động, trách nhiệm, chịu được áp lực', 'Có thể đi công tác khi cần', 5, 'Môi trường ổn định, đồng nghiệp hỗ trợ', 'Thưởng cuối năm theo quy định công ty', 'Quy trình rõ ràng, hỗ trợ đào tạo', 'remote', 'hot', 'Hồ Chí Minh', 'Thứ 2 - Thứ 7', '2026-10-24', 'published', '2026-06-17 21:57:09', 0, '2026-06-17 14:49:01', '2026-06-17 21:57:09'),
(107, 17, 0, 11, 26, 'Kế Toán Tổng Hợp', 4, 'Hỗ trợ Kế toán trưởng trong các hoạt động của phòng Kế toán.\r\nHạch toán thu/chi, công nợ, chi phí, khấu hao TSCĐ, phân bổ chi phí.\r\nTheo dõi xuất – nhập – tồn hàng hóa, vật tư, phụ tùng.\r\nLập báo cáo thuế, báo cáo tài chính và các báo cáo nội bộ định kỳ.\r\nKiểm tra, đối chiếu số liệu kế toán và thực hiện các bút toán kết chuyển cuối kỳ.\r\nThống kê giá thành sản phẩm, chi phí vận chuyển và các chi phí liên quan.', '2', 'Đại học', 'Thành thạo công cụ làm việc liên quan đến vị trí ứng tuyển', 'Cẩn thận, trung thực, ham học hỏi', 'Có tinh thần trách nhiệm cao', 7, '- Thưởng năng suất, Thưởng tháng 13 và Thưởng vượt trội cho CBNV có thành tích tốt.\r\n\r\n- Công ty hỗ trợ toàn bộ chi phí đi công tác, ngoài ra còn được hỗ trợ thêm phụ cấp đãi ngộ khác theo quy định của Công ty.\r\n\r\n- Tham gia đầy đủ chế độ BHXH, BHYT theo quy định.\r\n\r\n- Teambuilding, Tiệc tất niên... cùng công ty\r\n\r\n- Nghỉ phép năm, Lễ Tết theo qui định Nhà nước\r\n\r\n- Môi trường làm việc chuyên nghiệp, năng động, hòa đồng\r\n\r\n- Cung cấp trang thiết bị đầy đủ để phục vụ công việc\r\n\r\n- Được đào tạo hướng dẫn nhằm nâng cao kiến thức, chuyên môn. Cơ hội thăng tiến cao\r\n\r\n- Ứng viên phỏng vấn đạt sẽ nhận việc ngay', 'Thưởng hiệu suất và thưởng lễ Tết', 'Môi trường trẻ trung, năng động', 'Toàn thời gian cố đị', 'hot', 'Số 4316 Trần Hưng Đạo, Phường Đức Thắng, Phan Thiết', 'Thứ 2 - Thứ 7', '2026-09-30', 'published', '2026-06-17 21:57:09', 2, '2026-06-17 14:49:01', '2026-07-23 05:34:40'),
(108, 8, 0, 94, 28, '[Củ Chi] Kỹ Sư Chuyển Đổi Số Nhà Máy (Digital Engineer)', 1, 'MỤC ĐÍCH CÔNG VIỆC\r\n\r\nChịu trách nhiệm triển khai và phát triển các dự án số hóa và tự động hóa trong nhà máy (MES, IIoT, Data Analytics, AI), nhằm xây dựng hệ sinh thái dữ liệu end-to-end từ shopfloor đến hệ thống quản lý, hỗ trợ ra quyết định chủ động và cải thiện hiệu suất vận hành (OEE, downtime, cost).\r\n\r\nĐóng vai trò cầu nối giữa vận hành sản xuất và công nghệ, đảm bảo các giải pháp digital và dữ liệu không chỉ được triển khai mà còn mang lại giá trị thực tế thông qua cải tiến năng suất, tối ưu chi phí và nâng cao độ ổn định hệ thống.\r\n\r\nTRÁCH NHIỆM CÔNG VIỆC\r\n\r\nChủ trì triển khai các dự án chuyển đổi số trong nhà máy, bao gồm các giải pháp Manufacturing Execution System (MES), Industrial Internet of Things (IIoT), Digital Workflow và các nền tảng Factory Digital khác nhằm xây dựng hệ sinh thái dữ liệu end-to-end từ shopfloor đến hệ thống quản lý.\r\n Thiết kế, triển khai và duy trì kết nối dữ liệu từ tầng OT (PLC, SCADA, HMI, Sensors, Historians) đến các hệ thống IT, Data Platform và công cụ phân tích dữ liệu Data Analytics.\r\nPhối hợp với các bộ phận Production, Engineering, Quality và ManEx để xác định cơ hội số hóa, xây dựng và triển khai các digital use cases nhằm cải thiện hiệu suất vận hành (OEE, downtime, cost).\r\nPhát triển và triển khai các giải pháp giám sát hiệu suất sản xuất, phân tích OEE, downtime, loss analysis, predictive maintenance và condition monitoring, đảm bảo tính ổn định, độ chính xác và tính toàn vẹn của dữ liệu.\r\nXây dựng, duy trì và phát triển các dashboard, báo cáo và công cụ phân tích dữ liệu phục vụ hoạt động quản lý vận hành và ra quyết định.\r\nPhát triển các ứng dụng phân tích dữ liệu, tự động hóa và tích hợp hệ thống bằng Python, SQL, Power Platform và các công cụ phù hợp khác.\r\nTriển khai các giải pháp Power Automate nhằm tự động hóa quy trình làm việc, giảm thao tác thủ công và nâng cao hiệu quả vận hành.\r\nTham gia nghiên cứu, thử nghiệm và triển khai các giải pháp AI, Machine Learning, Advanced Analytics và Copilot nhằm nâng cao khả năng dự báo, tối ưu hóa vận hành và ra quyết định dựa trên dữ liệu.\r\nPhối hợp với các nhóm IT, OT và nhà cung cấp để đảm bảo các giải pháp digital tuân thủ tiêu chuẩn kiến trúc, an ninh mạng và định hướng chuyển đổi số của công ty.', '3', 'Cao đẳng', 'Thành thạo công cụ làm việc liên quan đến vị trí ứng tuyển', 'Cẩn thận, trung thực, ham học hỏi', 'Sẵn sàng học hỏi và tuân thủ quy trình', 11, 'Thu nhập hấp dẫn, thỏa thuận theo năng lực.\r\nMôi trường làm việc chuyên nghiệp, năng động, khuyến khích đổi mới và phát triển cá nhân.\r\nCơ hội tham gia vào các dự án chuyển đổi số quy mô lớn, áp dụng công nghệ tiên tiến như AI, Machine Learning.\r\nLộ trình phát triển sự nghiệp rõ ràng, được đào tạo nâng cao kiến thức và kỹ năng chuyên môn liên tục\r\nHưởng đầy đủ các chế độ phúc lợi theo quy định của pháp luật Việt Nam (BHXH, BHYT, BHTN).\r\nBảo hiểm sức khỏe cho cá nhân và người thân.\r\nThưởng lương tháng 13 và các khoản thưởng hiệu suất công việc hàng năm\r\nTham gia các hoạt động team building, du lịch hàng năm do công ty tổ chức.', 'Thưởng cuối năm theo quy định công ty', 'Văn phòng chuyên nghiệp, thân thiện', 'Toàn thời gian cố đị', 'hot', 'Lô A22-3 KCN Tây Bắc Củ Chi Xã Tân An Hội - Xã Tân An Hội, Củ Chi', 'Thứ 2 - Thứ 6', '2026-09-28', 'published', '2026-06-17 21:57:09', 3, '2026-06-17 14:49:01', '2026-07-23 07:10:18'),
(109, 19, 0, 4, 1, 'Cộng Tác Viên Product Marketing', 1, 'Hỗ trợ team IVIE - Trực tiếp tham gia giải quyết các bài toán marketing – kinh doanh đa dạng, qua đó phát triển tư duy phân tích, năng lực triển khai và khả năng phối hợp thực tế.\r\nTham gia triển khai các campaign marketing và phát triển kinh doanh từ giai đoạn nghiên cứu khách hàng, xây dựng phương án tiếp cận đến đo lường kết quả.\r\nPhân tích hành vi và dữ liệu khách hàng; hỗ trợ xác định phân khúc, hành trình khách hàng và các điểm cần tối ưu.\r\nPhối hợp xây dựng và triển khai các tài liệu phục vụ hoạt động marketing như landing page, ads, POSM…, đảm bảo sản phẩm đầu ra đúng yêu cầu và mục tiêu của campaign.\r\nTheo dõi, xử lý và phân tích dữ liệu; xây dựng báo cáo định kỳ về tiến độ và hiệu quả hoạt động.\r\nCông việc cụ thể có thể thay đổi theo từng campaign và mục tiêu kinh doanh.', '0', 'Cao đẳng', 'Biết sử dụng email, bảng tính và các công cụ cộng tác trực tuyến', 'Kỹ năng xử lý tình huống', 'Có thể đi công tác khi cần', 5, 'Được cấp laptop, màn hình và các thiết bị/tài khoản/công cụ cần thiết khác cho công việc\r\nNguồn học e-learning miễn phí trên các nền tảng, workshop nội bộ, tài trợ chứng nhận và Cố vấn độc quyền (C-level)\r\nCơ hội phát triển sự nghiệp rộng mở trong Hệ sinh thái Techcombank & Masterise Group\r\nKhông gian làm việc mở và hợp tác thúc đẩy cả sự tập trung cá nhân và các hoạt động làm việc nhóm\r\nMôi trường, văn hóa làm việc sáng tạo, hiệu suất cao\r\nKhu vực thư giãn', 'Thưởng cuối năm theo quy định công ty', 'Đội ngũ quản lý hỗ trợ sát sao', 'Toàn thời gian cố đị', 'hot', '45 Minh Khai, Phường Vĩnh Tuy, Quận Hai Bà Trưng, Thành phố Hà Nội, Việt Nam, Hai Bà Trưng', 'Thứ 2 - Thứ 6', '2026-08-15', 'published', '2026-06-17 21:57:09', 2, '2026-06-17 14:49:01', '2026-07-23 04:30:08'),
(110, 16, 0, 9, 1, 'Chuyên Viên Hành Chính', 1, '* Công tác phúc lợi - chăm lo đời sống CBNV\r\n\r\n- Lập kế hoạch và thực hiện công tác phúc lợi, chăm lo đời sống CBNV hàng năm, hàng tháng (Kế hoạch công việc, chi phí);\r\n\r\n- Tổ chức thực hiện công tác phúc lợi: Thăm hỏi ốm đau, hiếu, hỉ (bao gồm nội bộ và đối tác);\r\n\r\n- Tổ chức thực hiện công tác chăm lo sức khỏe cho CBNV (khám sức khỏe, phương tiện cho CBNV nữ mang thai, phương án phòng chống dịch bệnh nếu có...);\r\n\r\n- Tổ chức thực hiện công tác chăm lo đời sống tâm linh: Mua sắm đồ lễ thắp hương ngày lễ, tuần, tiết tại văn phòng Công ty và đồ lễ khác theo yêu cầu công việc\r\n\r\n* Công tác sự kiện\r\n\r\n- Lập kế hoạch thực hiện công tác sự kiện hàng năm, hàng tháng (Kế hoạch công việc, chi phí): Sự kiện nội bộ, sự kiện liên quan đến đối tác\r\n\r\n- Tổ chức thực hiện sự kiện:\r\n\r\n+ Tìm kiếm và lựa chọn các nhà cung cấp dịch vụ như địa điểm, ẩm thực, trang trí, âm thanh, ánh sáng, in ấn,...\r\n\r\n+ Đàm phán và ký kết hợp đồng với các đối tác.\r\n\r\n+ Quản lý và giám sát chất lượng dịch vụ của các đối tác.\r\n\r\n- Thiết kế, soạn thảo nội dung và thực hiện gửi nội dung thông báo\r\n\r\n- Đánh giá và báo cáo\r\n\r\n+ Thu thập thông tin phản hồi từ CBNV/đối tác\r\n\r\n+ Đánh giá hiệu quả của sự kiện.\r\n\r\n+ Lập báo cáo tổng kết về kết quả và kinh nghiệm.\r\n\r\n* Quản lý tài sản công cụ dụng cụ - cơ sở vật chất làm việc\r\n\r\n- Lập kế hoạch thực hiện công tác quản lý tài sản, công cụ dụng cụ, cơ sở vật chất làm việc hàng năm, hàng tháng (Kế hoạch công việc, chi phí);\r\n\r\n- Thực hiện các công việc liên quan đến sắp xếp chỗ ngồi;\r\n\r\n- Thực hiện mua sắm, quản lý, sửa chữa tài sản, công cụ dụng cụ làm việc cho CBNV (văn phòng và tại các dự án);\r\n\r\n- Quản lý, thực hiện mua sắm, công việc liên quan sửa chữa, bảo vệ tài sản thiết bị tòa nhà;\r\n\r\n- Thực hiện công việc liên quan đến công tác phòng cháy chữa cháy, cứu hộ cứu nạn ở tòa nhà văn phòng làm việc của Công ty\r\n\r\n* Mua sắm quà tặng và các mục khác\r\n\r\n- Mua sắm quà tặng cho đối tác khi có đề xuất/ yêu cầu;\r\n\r\n- Mua sắm quà tặng nội bộ :Quà tặng các sự kiện, Tết dương lịch, âm lịch, sinh nhật công ty... (theo chủ trương thực tế);\r\n\r\n- Mua sắm, cấp phát, quản lý các sản phẩm in ấn mang thương hiệu công ty (Túi, phong bì, namecard....);\r\n\r\n- Quản lý, theo dõi mua sắm, cấp phát chăn gối ngủ văn phòng, nhà cung cấp;\r\n\r\n- Mua sắm, cấp phát, quản lý đồng phục, bảo hộ công trường, nước uống cho dự án;', '3', 'Đại học', 'Kỹ năng chuyên môn đúng vị trí, thao tác nhanh và cẩn thận', 'Giao tiếp tốt, làm việc nhóm', 'Ưu tiên ứng viên có kinh nghiệm thực tế', 6, 'Chế độ du lịch nghỉ mát hàng năm (trong nước + nước ngoài theo thành tích làm việc)\r\nChế độ sinh nhật, thăm hỏi hiếu hỉ, sinh con, ốm đau đối với CBNV, tứ thân phụ mẫu, vợ/chồng, con CBNV\r\nXe đưa đón CBNV nữ mang thai từ tháng thứ 8 trở đi (theo nhu cầu của CBNV nữ)\r\nĂn trưa, ăn sáng tự nguyện tại nhà ăn Công ty, Công ty hỗ trợ 1 phần chi phí. Ăn chay rằm, mùng 1: Công ty đài thọ. Ăn trưa: Thứ 7 vui vẻ: Công ty đài thọ. Đồ uống nhẹ trong giờ làm việc: Cafe, Milo\r\nMáy tính công ty cấp:Laptop, Máy bàn theo yêu cầu công việc và công cụ làm việc\r\nLàm việc từ Thứ 2 - Thứ 6 và 01 Thứ 7 trong tháng. T2-T6 làm việc theo ca linh hoạt. Thứ 7 làm việc 07 tiếng/công\r\nĐiều chỉnh thu nhập hàng năm vào các dịp: Sinh nhật Công ty, cuối năm\r\nBảo hiểm XH, BHYT, BHTN: Công ty đóng theo quy định của NN', 'Thưởng cuối năm theo quy định công ty', 'Quy trình rõ ràng, hỗ trợ đào tạo', 'Toàn thời gian cố đị', 'hot', 'Số 11 Lê Trọng Tấn, Thanh Xuân, Hà Nội, Thanh Xuân', 'Thứ 2 - Thứ 6', '2026-08-15', 'published', '2026-06-17 21:57:09', 5, '2026-06-17 14:49:01', '2026-07-23 06:36:17'),
(111, 14, 0, 26, 29, '[Long An] Operator / Vận Hành Máy', 3, 'Job Summary\r\nVận hành để đảm bảo hiệu suất đáp ứng được mục tiêu\r\nVận hành máy/thiết bị trong dây chuyền sản xuất\r\nKey Responsibilities\r\n1. Vận hành máy/thiết bị trong dây chuyền sản xuất\r\n\r\nThực hiện KPI để đảm bảo hoạt động của bộ phận đóng gói một cách hiệu quả\r\nVận hành máy/thiết bị tại khu vực mình quản lý trong dây chuyền sản xuất đảm bảo 100% an toàn, và chất lượng\r\nBảo dưỡng và bôi trơn thiết bị/máy tự động với thời gian ngắn nhất\r\nCác thiết bị và môi trường làm việc trong dây chuyền sản phải được duy trì sạch sẽ và gọn gàng theo yêu cầu của GMP\r\n2. Tuân thủ\r\n\r\nTuân thủ yêu cầu về an toàn, chất lượng, pháp luật và KORE\r\nTuân thủ yêu cầu GMP, BEC, SMED và các quy trình/thủ tục đã được ban hành\r\nDuy trì các tiêu chuẩn 5S\r\n3. Thực hiện các công việc tiêu chuẩn hàng ngày\r\n\r\nTheo dõi công việc hàng ngày được chỉ định bởi Quản lý trực tiếp để đạt được KPIs\r\nPhân tích nguyên nhân gốc rễ các trường hợp ảnh hưởng đến hiệu suất\r\n4. Kế hoạch phát triển\r\n\r\nTham gia các chương trường nội bộ như: phát triển kỹ năng vận hành xuất sắc, chương trình Nhân viên chuỗi cung ứng tuyến đầu xuất sắc, quản lý chất lượng tại nguồn…cho việc phát triển cá nhân và hỗ trợ cho những công việc hàng ngày\r\nNhững công việc khác được chỉ đỉnh bởi Quản lý trực tiếp', '1', 'Cao đẳng', 'Kỹ năng chuyên môn đúng vị trí, thao tác nhanh và cẩn thận', 'Tư duy dịch vụ khách hàng', 'Có tinh thần trách nhiệm cao', 6, '- Chế độ bảo hiểm\r\n\r\n- Du Lịch\r\n\r\n- Phụ cấp\r\n\r\n- Xe đưa đón\r\n\r\n- Đồng phục\r\n\r\n- Chế độ thưởng\r\n\r\n- Chăm sóc sức khỏe\r\n\r\n- Đào tạo\r\n\r\n- Tăng lương\r\n\r\n- Công tác phí\r\n\r\n- Nghỉ phép năm', 'Thưởng hiệu suất và thưởng lễ Tết', 'Không gian làm việc ổn định, sạch sẽ', 'Toàn thời gian cố đị', 'hot', 'Long An, Bến Lức', 'Linh hoạt theo ca', '2026-08-07', 'published', '2026-06-17 21:57:09', 4, '2026-06-17 14:49:01', '2026-07-23 07:29:43'),
(112, 17, 0, 26, 15, 'Kỹ Thuật Trưởng Sửa Chữa Xe Máy', 1, '- Quản lý và điều hành hoạt động của xưởng sửa chữa xe máy.\r\n- Giám sát, hướng dẫn và đào tạo đội ngũ kỹ thuật viên.\r\n- Đảm bảo chất lượng dịch vụ sửa chữa và sự hài lòng của khách hàng.\r\n- Lập kế hoạch và triển khai các quy trình vận hành hiệu quả.', '4', 'Trung cấp', 'Thành thạo công cụ làm việc liên quan đến vị trí ứng tuyển', 'Cẩn thận, trung thực, ham học hỏi', 'Không yêu cầu kinh nghiệm, sẽ được đào tạo', 6, '- Mức lương cạnh tranh: từ 7-8 triệu VNĐ/tháng (chưa bao gồm thưởng doanh thu).\r\n- Thưởng doanh thu hàng tháng dựa trên hiệu quả hoạt động của xưởng.\r\n- Được làm việc trong môi trường chuyên nghiệp, năng động.\r\n- Cơ hội phát triển bản thân và thăng tiến trong sự nghiệp.', 'Thưởng chuyên cần và thưởng sáng kiến', 'Môi trường trẻ trung, năng động', 'Toàn thời gian cố đị', 'hot', '4316 Trần Hưng Đạo, Phan Thiết, Lâm Đồng (Bình Thuận cũ), Phan Thiết', 'Thứ 2 - Thứ 6', '2026-10-08', 'published', '2026-06-17 21:57:09', 3, '2026-06-17 14:49:01', '2026-07-23 05:31:26'),
(113, 17, 0, 6, 26, 'Nhân Viên Bán Hàng Ô Tô', 5, '- Sử dụng các kênh bán hàng online, offline để tìm kiếm khách hàng. Khai thác thị trường nhằm đạt doanh số cao nhất.\r\n\r\n- Thực hiện quy trình bán xe theo quy định của công ty.\r\n\r\n- Cập nhật kiến thức sản phẩm của tất cả chuẩn loại xe trong ngành, các CTKM và thủ tục hồ sơ để tư vấn cho khách hàng.\r\n\r\n- Chủ động liên hệ và tạo lập mối quan hệ với khách hàng, chăm sóc khách hàng.\r\n\r\n- Cập nhật thông tin về sản phẩm mới và đề xuất nhận thêm xe để đảm bảo tồn kho bán hàng.\r\n\r\n- Vệ sinh khu vực bán hàng, trưng bày xe, đảm bảo 5S. Trang trí cửa hàng nhằm thu hút sự chú ý của khách hàng.\r\n\r\n- Tham gia các lớp huấn luyện để trau dồi kiến thức nghề nghiệp và đào tạo nhân viên mới.\r\n\r\n- Các công việc khác theo sự chỉ đạo của cấp trên.', '1', 'Trung cấp', 'Thành thạo công cụ làm việc liên quan đến vị trí ứng tuyển', 'Chủ động, trách nhiệm, chịu được áp lực', 'Không yêu cầu kinh nghiệm, sẽ được đào tạo', 7, '- Thu nhập lên đến 20.000.000 đồng\r\n\r\n- Chế độ BHXH, BHYT theo quy định.\r\n\r\n- Thưởng năng suất, Thưởng tháng 13 và thưởng vượt trội cho CBNV có thành tích tốt.\r\n\r\n- Được công ty đầu tư, tạo điều kiện tham gia khóa đào tạo các lớp bán hàng chuyên nghiệp\r\n\r\n- Công ty hỗ trợ toàn bộ chi phí đi công tác, ngoài ra còn được hỗ trợ thêm phụ cấp đãi ngộ\r\n\r\n- Các chế độ hấp dẫn khác theo quy định của Công ty.', 'Thưởng cuối năm theo quy định công ty', 'Đội ngũ quản lý hỗ trợ sát sao', 'Toàn thời gian cố đị', 'hot', 'Toàn khu vực, Tuy Phong', 'Thứ 2 - Thứ 7', '2026-07-31', 'published', '2026-06-17 21:57:09', 5, '2026-06-17 14:49:01', '2026-07-23 05:28:16'),
(114, 11, 0, 28, 5, 'Kỹ thuật viên ô tô tại Lai Châu', 7, 'Thực hiện công việc theo phân công, phối hợp với các bộ phận liên quan và báo cáo kết quả định kỳ', '5', 'college', 'Kỹ năng chuyên môn đúng vị trí, thao tác nhanh và cẩn thận', 'Cẩn thận, trung thực, ham học hỏi', 'Có thể đi công tác khi cần', 4, 'Hỗ trợ ăn trưa, gửi xe và các chế độ phúc lợi nội bộ', 'Thưởng dự án khi hoàn thành mục tiêu', 'Quy trình rõ ràng, hỗ trợ đào tạo', 'part_time', 'hot', 'Lai Châu', 'Ca hành chính', '2026-11-08', 'published', '2026-06-17 21:57:09', 1, '2026-06-17 14:49:01', '2026-06-17 21:57:09'),
(115, 14, 0, 29, 29, 'Nhân Viên Vận Hành Si Rô Tại Nhà Máy Tây Ninh', 1, '- Nhận nguyên vật liệu đầu vào, kiểm tra CMMP, thông số vận hành máy. \r\n- Vận hành các máy trong phòng Syrup. \r\n- Test mẫu các vị trí trong phòng Syrup. \r\n- Vận hành hệ thống CIP của Syrup. \r\n- Thời gian làm việc: ca luân phiên: \r\n- Ca 1: từ 06h00 đến 14h00. \r\n- Ca 2: từ 14h00 đến 22h00. \r\n- Ca 3: từ 22h00 đến 06h00.', '1', 'Trung cấp', 'Có khả năng đọc hiểu tài liệu, tổng hợp số liệu và lập báo cáo', 'Giao tiếp tốt, làm việc nhóm', 'Không yêu cầu kinh nghiệm, sẽ được đào tạo', 6, '- Lương thử việc nhận 100%. \r\n- Được hưởng chế độ BH đầy đủ, thêm bảo hiểm 24/7. \r\n- Bảo lãnh nội trú, nghỉ phép có lương 18 ngày/năm. \r\n- Lương tháng 13, thưởng chia lợi nhuận vào tháng 4 hàng năm. \r\n- Được nghỉ và có thưởng các ngày lễ tết. \r\n- Du lịch hàng năm, Giao lưu, liên hoan tổng kết hàng tháng, hàng quý… \r\n- Môi trường làm việc trẻ trung, hòa đồng và có nhiều cơ hội thăng tiến. \r\n- Phụ cấp ca đêm 140%.', 'Thưởng chuyên cần và thưởng sáng kiến', 'Quy trình rõ ràng, hỗ trợ đào tạo', 'Toàn thời gian cố đị', 'hot', 'Khu công nghiệp Phú An Thạnh, Tây Ninh', 'Ca hành chính', '2026-10-03', 'published', '2026-06-17 21:57:09', 3, '2026-06-17 14:49:01', '2026-07-23 06:53:50'),
(116, 8, 0, 87, 28, 'Chương Trình Thực Tập Sinh Kỹ Thuật Unlimi – Nhân Viên Vận Hành Nhà Máy Xử Lý Nước Thải (Wwtp)', 1, 'Vận hành và duy trì nhà máy xử lý nước thải, bùn thải và vận chuyển, kết nối bơm thiết bị theo quy trình và hướng dẫn vận hành. \r\nBảo dưỡng bơm, máy thổi khí, máy ép bùn, các thiết bị phòng thí nghiệm và các thiết bị phụ trợ cho quá trình xử lý nước thải. \r\nLấy mẫu và phân tích mẫu nước thải thường nhật tại nhiều điểm trong quy trình xử lý của nhà máy. \r\nGiám sát bộ điều khiển và điều chỉnh van, bơm bằng tay hoặc là bằng hệ thống điều khiển từ xa để kiểm soát lưu lượng nước thải qua các quy trình lắng, hiếu khí và quy trình ép bùn.', '1', 'Trung cấp', 'Kỹ năng chuyên môn đúng vị trí, thao tác nhanh và cẩn thận', 'Tư duy dịch vụ khách hàng', 'Có thể đi công tác khi cần', 11, '• Lương Cơ Bản: 7,000,000 VND gross/ tháng \r\n• Sau 4 tháng thực tập, lương cơ bản sẽ là 10,200,00 VND gross/ tháng nếu sinh viên được đánh giá đủ điều kiện tốt nghiệp chương trình và được bổ nhiệm làm nhân viên vận hành chính thức \r\n• Đóng bảo hiểm theo quy định nhà nước trên 100% lương \r\n• Bảo hiểm tai nạn 24/24 • Được cung cấp bữa ăn trong ca \r\n• Xe Công ty đưa đón theo tuyến quy định', 'Thưởng chuyên cần và thưởng sáng kiến', 'Quy trình rõ ràng, hỗ trợ đào tạo', 'Toàn thời gian cố đị', 'normal', 'Khu công nghiệp Tây Bắc Củ Chi, Củ Chi', 'Thứ 2 - Thứ 7', '2026-09-19', 'published', '2026-06-17 21:57:09', 4, '2026-06-17 14:49:01', '2026-07-24 00:58:13'),
(117, 8, 0, 26, 28, 'Trưởng Nhóm Sản Xuất / Cell Leader - Unlimi Củ Chi', 1, '1. Quản lý & Vận hành dây chuyền (60%)\r\nQuản lý và vận hành dây chuyền\r\nChịu trách nhiệm toàn diện các chỉ số sản xuất của dây chuyền (Line Scorecard).\r\nTổng hợp, phân tích các vấn đề phát sinh trong vận hành và đề xuất giải pháp cải tiến.\r\nHướng dẫn, kèm cặp và nâng cao năng lực cho đội ngũ vận hành (Operator, Assistant, 3P).\r\nTrực tiếp tham gia vận hành máy khi cần thiết.\r\nDẫn dắt và tham gia triển khai các sáng kiến cải tiến nhỏ và cải tiến trọng điểm.\r\nTriển khai & Duy trì UMS và Autonomous Maintenance (AM)\r\nPhối hợp với FLM xây dựng và triển khai kế hoạch AM cho dây chuyền.\r\nThực hiện đầy đủ các hoạt động theo từng bước AM (AM Step).\r\nHướng dẫn nhân viên thực hiện AM, cập nhật và cải tiến tiêu chuẩn phù hợp với thực tế.\r\nReview, theo dõi và xử lý danh mục khuyết tật AM.\r\nLập kế hoạch và triển khai bảo dưỡng AM định kỳ.\r\n \r\n\r\n2. Process Improvement (40%)\r\nPlanned Maintenance (PM)\r\nTrực tiếp tham gia xử lý breakdown trong giờ hành chính nhằm thu thập dữ liệu và chuẩn hóa tiêu chuẩn.\r\nPhối hợp cùng đội PM xây dựng và triển khai kế hoạch PM Step.\r\nThực hiện các hoạt động PM theo kế hoạch.\r\nTham gia họp AM–PM để xử lý các khuyết tật thiết bị (Tags).\r\nPhối hợp thực hiện bảo trì theo PM Calendar.\r\nAn toàn – Sức khỏe – Chất lượng (SHE & Quality)\r\nThu thập ý kiến cải tiến từ nhân viên trong chuyền, đề xuất giải pháp cho FLM.\r\nThực hiện đánh giá rủi ro (Risk Assessment) cho dây chuyền.\r\nThiết lập và duy trì checklist kiểm tra an toàn và chất lượng.\r\nTham gia phân tích tai nạn, sự cố (Accident, D-Incident), khiếu nại khách hàng/consumer (S-EWO, SCAT…).\r\nReview và xử lý các khuyết tật liên quan đến SHE & Quality.\r\nCải tiến liên tục (Continuous Improvement)\r\nChủ động đề xuất và tham gia các hoạt động cải tiến hiệu suất của dây chuyền.\r\nTheo dõi, đánh giá hiệu quả và đảm bảo duy trì kết quả cải tiến.\r\nCost Deployment (CD)\r\nĐảm bảo dữ liệu ALC của dây chuyền đầy đủ, chính xác theo định nghĩa Waste & Loss.\r\nThực hiện daily review và báo cáo OEE Loss Tree.\r\nTham gia triển khai CD Matrix cùng CD Coordinator.\r\nKhác\r\nThực hiện các nhiệm vụ khác theo phân công của quản lý trực tiếp.', '3', 'Cao đẳng', 'Kỹ năng chuyên môn đúng vị trí, thao tác nhanh và cẩn thận', 'Cẩn thận, trung thực, ham học hỏi', 'Có thể đi công tác khi cần', 7, '• Thu nhập hấp dẫn + Thưởng tháng 13 & các khoản thưởng Lễ trong năm.\r\n\r\n• Hỗ trợ xe đưa rước, Phục vụ cơm tại căn-tin nhà máy.\r\n\r\n• Cơ hội phát triển sự nghiệp tại môi trường Quốc Tế làm việc hiện đại, nhà máy 4.0. với công nghệ tiên tiến, đạt chuẩn quốc tế cùng các chương trình đào tạo nội bộ thường xuyên giúp nâng cao nghiệp vụ.\r\n\r\n• Hưởng BHXH theo 100% mức lương Gross.\r\n\r\n• Bảo hiểm sức khỏe cho nhân viên + người thân & Bảo hiểm Tai nạn.\r\n\r\n• 12 ngày phép/năm', 'Thưởng hiệu suất và thưởng lễ Tết', 'Môi trường trẻ trung, năng động', 'Toàn thời gian cố đị', 'normal', 'Lô A22-3 KCN Tây Bắc Củ Chi Xã Tân An Hội - Xã Tân An Hội, Củ Chi', 'Linh hoạt theo ca', '2027-07-30', 'published', '2026-06-17 21:57:09', 2, '2026-06-17 14:49:01', '2026-07-23 07:23:21'),
(118, 1, 0, 8, 28, 'Nhân Viên Ngân Hàng Thu Nhập 20 -30 Triệu', 20, 'Nhắc hẹn thanh toán của khách hàng\r\nHướng dẫn khách hàng các kênh và hình thức phù hợp bán hàng\r\nCập nhật thông tin và ghi nhận phản hồi từ khách hàng bán hàng.\r\nThời gian làm việc: 8:00 - 18:15, Thứ 2 đến Thứ 7 (Không tăng ca).\r\nĐịa điểm làm việc: Tòa nhà Flemington, 182 Lê Đại Hành Quận 11 hoặc OneHub, Đường D1, Phường Tân Phú (Quận 9 cũ)\r\nTuyển gấp, đi làm ngay', '0', 'Trung học', 'Có khả năng đọc hiểu tài liệu, tổng hợp số liệu và lập báo cáo', 'Chủ động, trách nhiệm, chịu được áp lực', 'Không yêu cầu kinh nghiệm, sẽ được đào tạo', 8, 'Được tham gia đầy đủ BHXH, BHYT, BHTN theo quy định và hưởng thêm gói bảo hiểm với quyền lợi nâng cao.\r\nNhận lương tháng 13 cố định cuối năm không cần theo kết quả kinh doanh và hiệu quả làm việc.\r\nHưởng các chế độ phúc lợi công đoàn: sinh nhật, hiếu hỉ, thai sản và các chương trình chăm sóc nhân viên.\r\nMôi trường làm việc quốc tế, chuyên nghiệp; 14 ngày phép/năm và khám sức khỏe định kỳ.\r\nTham gia các hoạt động nội bộ, team building, du lịch và sự kiện gắn kết hằng năm.', 'Thưởng doanh số theo kết quả công việc', 'Văn phòng chuyên nghiệp, thân thiện', 'Toàn thời gian cố đị', 'normal', 'Tòa nhà Flemington, 182 Lê Đại Hành, Quận 11', 'Thứ 2 - Thứ 7', '2026-07-27', 'published', '2026-06-17 21:57:09', 1, '2026-06-17 14:49:01', '2026-07-23 07:54:05'),
(119, 14, 0, 6, 13, 'Chuyên Viên Thực Thi Thị Trường [Hải Phòng]', 1, '- Phát triển và duy trì dữ liệu cấp độ khách hàng bao gồm tất cả các kênh giao dịch (Khách hàng trực tiếp, Nhà bán sỉ, Mở / Tắt tài khoản chính). \r\n- Tối ưu hóa tuyến đường thông qua việc tạo các tuyến cân bằng dựa trên số lượng khách hàng, lượt truy cập mỗi ngày và thời gian hoàn thành tuyến đường để cải thiện năng suất bán hàng. \r\n- Tạo hiệu suất bảng điều khiển của nhà phân phối RTM và màn hình. Thực hiện và đánh giá cơ sở hạ tầng nhà phân phối. \r\n- Cung cấp đào tạo liên tục cho đội ngũ bán hàng về thu thập dữ liệu, đọc tuyến đường & theo dõi KPI để đảm bảo sử dụng công nghệ tối đa. \r\n- Thực hiện huấn luyện / đào tạo và chia sẻ Thực tiễn tốt nhất RTM cho Thực thi thị trường khu vực (Điều phối viên RTM) để liên tục xây dựng Khả năng / Quy trình RTM.', '2', 'Cao đẳng', 'Kỹ năng chuyên môn đúng vị trí, thao tác nhanh và cẩn thận', 'Cẩn thận, trung thực, ham học hỏi', 'Sẵn sàng học hỏi và tuân thủ quy trình', 7, '- Lương thử việc nhận 100%. \r\n- Được hưởng chế độ BH đầy đủ, thêm bảo hiểm 24 / 7. \r\n- Bảo lãnh nội trú, nghỉ phép có lương 18 ngày / năm. \r\n- Lương tháng 13, thưởng chia lợi nhuận vào tháng 4 hàng năm. \r\n- Được nghỉ và có thưởng các ngày lễ tết. \r\n- Du lịch hàng năm, Giao lưu, liên hoan tổng kết hàng tháng, hàng quý… \r\n- Môi trường làm việc trẻ trung, hòa đồng và có nhiều cơ hội thăng tiến.', 'Thưởng cuối năm theo quy định công ty', 'Quy trình rõ ràng, hỗ trợ đào tạo', 'Toàn thời gian cố đị', 'normal', 'Hải phòng, Hải An', 'Theo lịch phân công', '2026-08-16', 'published', '2026-06-17 21:57:09', 2, '2026-06-17 14:49:01', '2026-07-23 06:47:28'),
(120, 19, 0, 6, 1, 'Chuyên Viên Phát Triển Đối Tác (Merchant F&b)', 6, '1. Phát triển mạng lưới đối tác mới (trọng tâm chính)\r\n\r\nChủ động tìm kiếm, tiếp cận và đàm phán hợp tác với các thương hiệu để hợp tác e-voucher trên Techcombank Reward & OneU.\r\nCác ngành hàng triển khai: F&B - cate trọng tâm, chiếm 80% portfolio, ngoài ra mở rộng thêm Thời trang, Healthcare, Khách sạn/Resort và CVS/Minimart...\r\nTập trung merchant phân khúc SME, ví dụ: Ding tea, Don Chicken, Bếp Thái Kohyam, Routine, 30Shine...\r\n2. Thúc đẩy hiệu quả chương trình\r\n\r\nTiếp tục quản lý portfolio đối tác sau khi ký Hợp đồng, duy trì mối quản hệ để đảm bảo các chương trình luôn onsite trên nền tảng không bị hết stock/hạn sử dụng giữa chừng.\r\nPhối hợp với các bộ phận liên quan để thúc đẩy transaction cho các merchant bằng các campaign / flash sale...\r\nĐàm phán gia hạn voucher cũ và/hoặc thay thế voucher mới khi cần thiết để đảm bảo performance cần đạt trên nền tảng.', '1', 'Cao đẳng', 'Kỹ năng chuyên môn đúng vị trí, thao tác nhanh và cẩn thận', 'Giao tiếp tốt, làm việc nhóm', 'Có tinh thần trách nhiệm cao', 7, 'Lương & Phụ cấp:\r\nThu nhập cạnh tranh, gồm: Lương cứng (từ 12 triệu) + Thưởng KPI hàng tháng.\r\nThử việc 2 tháng, nhận 100% thu nhập.\r\nLương tháng 13.\r\nPhép năm: 12 ngày/năm.\r\nSức khỏe: Bảo hiểm xã hội, bảo hiểm tai nạn, khám sức khỏe định kỳ hàng năm.\r\nMáy tính xách tay, màn hình và các tài khoản/công cụ cần thiết khác cho công việc\r\n\r\nCơ hội nghề nghiệp:\r\nXét cơ hội thăng tiến.\r\nCon đường sự nghiệp đa dạng: Quản lý hoặc Chuyên gia và cơ hội điều chuyển nội bộ giữa các team.\r\nNguồn học miễn phí trên các nền tảng Udemy, Coursera, O\'relly; hội thảo nội bộ, tài trợ chứng nhận và Cố vấn độc quyền (C-level).\r\nCông nhận và khen thưởng ở cấp độ nhóm và Công ty.\r\n\r\nMôi trường làm việc:\r\nKhông gian làm việc mở và thúc đẩy cả sự tập trung cá nhân và các hoạt động làm việc theo nhóm.\r\nMôi trường làm việc trẻ trung, năng động và hợp tác.\r\nKhu thư giãn: chơi game, bóng bàn, yoga, phòng tập thể dục, phòng tắm, sleep box.\r\nTeambuilding hàng quý/hàng năm & các sự kiện nội bộ gắn kết.', 'Thưởng cuối năm theo quy định công ty', 'Văn phòng chuyên nghiệp, thân thiện', 'Toàn thời gian cố đị', 'normal', '45 Minh Khai, Phường Vĩnh Tuy, Hai Bà Trưng', 'Thứ 2 - Thứ 6', '2026-08-31', 'published', '2026-06-17 21:57:09', 3, '2026-06-17 14:49:01', '2026-07-23 04:40:34'),
(121, 11, 0, 53, 28, 'Bếp Trưởng / Bếp Phó', 10, '1. Công việc đầu ca\r\n\r\nKiểm tra số lượng và chất lượng hàng hóa, nguyên vật liệu khi nhập ca và xử lý hàng tồn từ ca trước.\r\nKiểm tra tác phong, hình thức cá nhân và phân công công việc, khu vực làm việc cho nhân viên trước ca phục vụ.\r\n2. Tổ chức chế biến món ăn\r\n\r\nPhân công hoặc trực tiếp tham gia chế biến món ăn theo yêu cầu vận hành.\r\nKiểm tra và giám sát quá trình chế biến, đảm bảo món ăn đúng quy trình, định lượng, chất lượng và an toàn vệ sinh thực phẩm.\r\nKiểm soát việc ra món theo order, đảm bảo đúng, đủ và kịp thời.\r\nKiểm tra và quản lý trang thiết bị, công cụ dụng cụ bếp, đề xuất sửa chữa hoặc thay thế khi cần.\r\n3. Công tác quản lý và vận hành\r\n\r\nĐiều hành toàn bộ hoạt động của bếp, sắp xếp và điều chuyển nhân sự, bố trí lịch làm việc hợp lý.\r\nĐào tạo tay nghề, giám sát và đánh giá hiệu quả, ý thức làm việc của nhân viên.\r\nGiám sát việc tuân thủ nội quy và quy định của Công ty.\r\nQuản lý việc sử dụng thực phẩm theo nguyên tắc nhập trước xuất trước, kiểm soát chi phí và tiết kiệm nguyên vật liệu, điện, nước, ga.\r\nPhối hợp với Quản lý Nhà hàng để kiểm soát cơ cấu menu và làm việc với Phòng R&D nhằm phát triển và cải tiến món ăn.\r\nPhấn đấu đạt các chỉ tiêu về chi phí và doanh thu theo kế hoạch Công ty giao.\r\nPhối hợp chặt chẽ với các bộ phận liên quan nhằm nâng cao chất lượng dịch vụ của nhà hàng.', '2', 'Cao đẳng', 'Excel, Php, Python', 'Làm việc nhóm', '', 7, '- Hỗ trợ bữa ăn/phụ cấp ăn cho nhân viên tại Nhà hàng\r\n- Thưởng voucher sinh nhật, voucher nhân viên xuất sắc tháng\r\n- Ưu đãi 20% khi sử dụng dịch vụ tại nhà hàng thuộc hệ thống\r\n- Thưởng BSC cho nhà hàng đạt chỉ số hiệu quả kinh doanh\r\n- Lộ trình đào tạo, thăng tiến rõ ràng theo từng cấp bậc\r\n- Tham gia các hoạt động team building, year end party,..', 'Du lịch', '', 'Toàn thời gian cố đị', 'hot', '999 Sư Vạn Hạnh, Phường 12, Quận 10', 'Trong giờ hành chính', '2026-10-30', 'published', '2026-07-22 20:44:50', 24, '2026-06-25 09:19:58', '2026-07-22 22:11:59'),
(122, 16, 0, 97, 1, 'Chuyên Viên Thanh Quyết Toán', 2, 'Lập dữ liệu theo dõi hợp đồng đầu ra mảng Cơ điện /Thương mại\r\n\r\nThực hiện hồ sơ đề nghị tạm ứng, bảo lãnh tạm ứng và bảo lãnh thực hiện hợp đồng.\r\n\r\nSoạn hồ sơ chất lượng của hợp đồng thanh quyết toán.\r\n\r\nLập và bảo vệ hồ sơ giá trị thanh quyết toán, kế hoạch thu các Hợp đồng theo tháng, năm\r\n\r\nTổng hợp biên bản đến hạn và quá hạn, báo cáo tồn đọng, đối chiếu số liệu với bộ phận liên quan\r\n\r\nHàng tháng đánh giá thực hiện của các bô phận trước đó theo quá trình hợp đồng\r\n\r\nKiểm tra hợp đồng đầu ra (ĐK thanh toán, chứng từ, biên bản, tờ trình…)\r\n\r\nKiểm tra các bộ trình ký các BB liên quan đến HĐ đầu ra ( HOC, PAC,FAC…)\r\n\r\nTiếp nhận và xử lý thông tin các phát sinh của Hợp đồng bao gồm: Phát sinh đầu mục và phát sinh khối lượng từ hiện trường; thay đổi/ bổ sung thông tin về điều khoản Hợp đồng;…\r\n\r\nTrên cơ sở phát sinh từ công trường, teamwork các bộ phận công trường, giải pháp, tài chính… xây dựng phương án chào giá, ký phát sinh hợp đạt hiệu quả cao nhất\r\n\r\nThu thập sở cứ từ công trường, xây dựng, bổ sung sở cứ cần thiết bảo vệ tối đa phương án giá.\r\n\r\nCác công việc khác theo sự phân công của cấp trên.', '2', 'Đại học', NULL, NULL, NULL, 7, '-Chế độ thu nhập cạnh tranh theo năng lực và hiệu quả công việc.\r\n-Thi đua khen thưởng 4 lần/ năm, lương tháng thứ 13+++, Review lương hàng năm...\r\n-Du lịch nghỉ mát hàng năm (trong nước + nước ngoài theo thành tích làm việc)\r\n-Thưởng đột xuất theo hiệu quả công việc, thưởng suất du lịch. Quà tặng cho CBNV: Sinh nhật, ngày quốc tế phụ nữ, Tết thiếu nhi, sinh con, kết hôn....\r\n-Xe đưa đón CBNV nữ mang thai từ tháng thứ 8 trở đi (theo nhu cầu của CBNV nữ)\r\n-Ăn trưa, ăn sáng tự nguyện tại nhà ăn Công ty, Công ty hỗ trợ 1 phần chi phí. Ăn chay rằm, mùng 1: Công ty đài thọ. Ăn trưa: Thứ 7 vui vẻ: Công ty đài thọ. Đồ uống nhẹ trong giờ làm việc: Cafe, Milo\r\n-Máy tính bàn/ laptop công ty cấp cho CBNV theo nhu cầu công việc,\r\n-Ca làm việc tự chọn: Trong ngày có Ca 1: 7h50p- 16h40p, Ca 2: 8h30p-17h40p. Nghỉ trưa cố định từ 12h-13h20p.\r\n-Làm từ thứ 2- thứ 6 + 01 thứ 7 trong tháng hưởng thêm lương (Thứ 7 vui vẻ, Khuyến khích CBNV cho con đến công ty, nhà bếp sẽ chuẩn bị đồ ăn cho các bé)\r\n-Chế độ nghỉ Lễ, Tết, phép, nghỉ việc riêng hưởng nguyên lương theo quy định của Luật Lao động\r\n-Môi trường làm việc thân thiện, năng động', NULL, NULL, 'Toàn thời gian cố đị', 'normal', '11/17 Lê Trọng Tấn, Thanh Xuân', NULL, '2026-07-29', 'published', '2026-06-29 16:29:09', 15, '2026-06-29 09:29:00', '2026-07-23 06:25:26'),
(123, 11, 0, 66, 11, 'ádasd', 1, 'ádasd', '1', 'Đại học', '11', '1231', '123123', 1, '', '', '', 'Trực tiếp', 'normal', '123123123123 1231231', 'Trong giờ hành chính', '2026-07-30', '99', NULL, 0, '2026-07-06 14:41:33', '2026-07-06 21:41:33'),
(124, 7, 0, 66, NULL, 'Nhân viên kinh doanh', 1, 'Kinh doanh1111111', '5', 'Đại học', '', '', '', 1, '111111', '', '', '', 'normal', '', 'Trong giờ hành chính', '2026-09-27', 'pending', NULL, 0, '2026-07-17 08:54:54', '2026-07-22 20:41:22');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hicrm_job_posts_old`
--

CREATE TABLE `hicrm_job_posts_old` (
  `id` bigint(20) NOT NULL,
  `employer_id` bigint(20) NOT NULL,
  `candidate_id` int(11) NOT NULL DEFAULT 0,
  `job_category_id` int(11) DEFAULT NULL,
  `province_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `quantity` smallint(6) DEFAULT 1,
  `job_description` text NOT NULL,
  `experience_years` varchar(255) DEFAULT NULL,
  `degree_required` varchar(20) DEFAULT NULL COMMENT 'none | high_school | intermediate | college | university | postgraduate',
  `professional_skills` text DEFAULT NULL,
  `soft_skills` text DEFAULT NULL,
  `other_requirements` text DEFAULT NULL COMMENT 'Yêu cầu khác\r\n',
  `salary_id` int(11) DEFAULT NULL,
  `benefits_description` text DEFAULT NULL,
  `rewards_description` text DEFAULT NULL COMMENT 'Thưởng & Đãi ngộ',
  `work_environment` text DEFAULT NULL COMMENT 'Môi trường làm việc',
  `work_type` varchar(20) DEFAULT NULL COMMENT 'full_time | part_time | remote | hybrid',
  `job_post_type` varchar(20) NOT NULL DEFAULT 'normal',
  `address_detail` varchar(500) DEFAULT NULL,
  `working_time` varchar(255) DEFAULT NULL COMMENT 'Thời gian làm việc',
  `deadline` date NOT NULL,
  `status` varchar(20) DEFAULT 'pending' COMMENT 'draft | pending | published | closed | rejected',
  `published_at` datetime DEFAULT NULL,
  `views_count` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `hicrm_job_posts_old`
--

INSERT INTO `hicrm_job_posts_old` (`id`, `employer_id`, `candidate_id`, `job_category_id`, `province_id`, `title`, `quantity`, `job_description`, `experience_years`, `degree_required`, `professional_skills`, `soft_skills`, `other_requirements`, `salary_id`, `benefits_description`, `rewards_description`, `work_environment`, `work_type`, `job_post_type`, `address_detail`, `working_time`, `deadline`, `status`, `published_at`, `views_count`, `created_at`, `updated_at`) VALUES
(1, 11, 0, 46, NULL, 'Nhân viên kinh doanh', 2, 'tiếp thị bán hàng', '2', 'intermediate', 'ấdasdas', 'đâsd', NULL, NULL, '1231231', NULL, NULL, 'part_time', 'hot', '123123123123 1', NULL, '2026-06-12', 'published', '2026-06-17 22:00:08', 0, '2026-06-03 15:35:48', '2026-06-17 22:00:08'),
(2, 11, 0, 56, NULL, 'Nhân viên bảo trì', 1, 'Bảo trì hệ thống CNTT', '5', 'Đại học', 'Thành thạo CNTT', 'Trách nhiệm trong công việc', NULL, NULL, 'Được đóng BHXH', NULL, NULL, 'Trực tiếp', 'hot', 'Hoàn văn thụ - Kon tum', NULL, '2026-06-12', 'published', '2026-06-17 22:00:08', 0, '2026-06-04 15:56:52', '2026-06-17 22:00:08'),
(3, 11, 0, 66, NULL, '123123', 1, '123123', '1', '3', '1', '1', NULL, NULL, '3', NULL, NULL, 'Trực tiếp', 'hot', '123123123123 1', '', '2026-06-05', 'published', '2026-06-17 22:00:08', 0, '2026-06-04 16:48:27', '2026-06-17 22:00:08'),
(4, 11, 0, 72, 11, '1233121', 1, '11', '5', 'Đại học', '1', '3', '2', 1, '2', '1', '1', 'Trực tiếp', 'hot', '123123123123 1', '13', '2026-06-06', 'published', '2026-06-17 22:00:08', 3, '2026-06-04 17:01:30', '2026-06-17 22:00:08'),
(5, 11, 0, 66, 22, 'Kế toán', 1, 'Kế toán', '1', 'Đại học', '1111', '1123', '123123123', 1, '123123', '123123', '123123', 'Trực tiếp', 'hot', '123123123123 1231231', 'Trong giờ hành chính', '2026-06-20', 'published', '2026-06-17 19:53:42', 0, '2026-06-10 15:40:55', '2026-06-17 19:53:42'),
(6, 11, 0, 1, 11, 'Nhan vien kinh doanh 1', 2, 'Tu van va cham soc khach hang', '1', 'college', 'Giao tiep va tin hoc van phong', 'Lam viec nhom', 'Uu tien ung vien co kinh nghiem', 3, 'BHXH va phu cap', 'Thuong doanh so', 'Moi truong tre trung', 'full_time', 'hot', 'Kon Tum', 'Thu 2 - Thu 6', '2026-12-31', 'published', '2026-06-17 22:00:08', 0, '2026-06-17 13:18:37', '2026-06-17 22:00:08'),
(7, 11, 0, 1, 11, 'Nhan vien kinh doanh 2', 2, 'Tu van va cham soc khach hang', '1', 'college', 'Giao tiep va tin hoc van phong', 'Lam viec nhom', 'Uu tien ung vien co kinh nghiem', 3, 'BHXH va phu cap', 'Thuong doanh so', 'Moi truong tre trung', 'full_time', 'hot', 'Kon Tum', 'Thu 2 - Thu 6', '2026-12-31', 'published', '2026-06-17 22:00:08', 0, '2026-06-17 13:18:37', '2026-06-17 22:00:08'),
(8, 11, 0, 1, 11, 'Nhan vien kinh doanh 3', 2, 'Tu van va cham soc khach hang', '1', 'college', 'Giao tiep va tin hoc van phong', 'Lam viec nhom', 'Uu tien ung vien co kinh nghiem', 3, 'BHXH va phu cap', 'Thuong doanh so', 'Moi truong tre trung', 'full_time', 'hot', 'Kon Tum', 'Thu 2 - Thu 6', '2026-12-31', 'published', '2026-06-17 22:00:08', 0, '2026-06-17 13:18:37', '2026-06-17 22:00:08'),
(9, 11, 0, 1, 11, 'Nhan vien kinh doanh 4', 2, 'Tu van va cham soc khach hang', '1', 'college', 'Giao tiep va tin hoc van phong', 'Lam viec nhom', 'Uu tien ung vien co kinh nghiem', 3, 'BHXH va phu cap', 'Thuong doanh so', 'Moi truong tre trung', 'full_time', 'hot', 'Kon Tum', 'Thu 2 - Thu 6', '2026-12-31', 'published', '2026-06-17 22:00:08', 0, '2026-06-17 13:18:37', '2026-06-17 22:00:08'),
(10, 11, 0, 1, 11, 'Nhan vien kinh doanh 5', 2, 'Tu van va cham soc khach hang', '1', 'college', 'Giao tiep va tin hoc van phong', 'Lam viec nhom', 'Uu tien ung vien co kinh nghiem', 3, 'BHXH va phu cap', 'Thuong doanh so', 'Moi truong tre trung', 'full_time', 'hot', 'Kon Tum', 'Thu 2 - Thu 6', '2026-12-31', 'published', '2026-06-17 22:00:08', 0, '2026-06-17 13:18:37', '2026-06-17 22:00:08'),
(11, 11, 0, 1, 11, 'Nhan vien kinh doanh 6', 2, 'Tu van va cham soc khach hang', '1', 'college', 'Giao tiep va tin hoc van phong', 'Lam viec nhom', 'Uu tien ung vien co kinh nghiem', 3, 'BHXH va phu cap', 'Thuong doanh so', 'Moi truong tre trung', 'full_time', 'hot', 'Kon Tum', 'Thu 2 - Thu 6', '2026-12-31', 'published', '2026-06-17 22:00:08', 0, '2026-06-17 13:18:37', '2026-06-17 22:00:08'),
(12, 11, 0, 1, 11, 'Nhan vien kinh doanh 7', 2, 'Tu van va cham soc khach hang', '1', 'college', 'Giao tiep va tin hoc van phong', 'Lam viec nhom', 'Uu tien ung vien co kinh nghiem', 3, 'BHXH va phu cap', 'Thuong doanh so', 'Moi truong tre trung', 'full_time', 'hot', 'Kon Tum', 'Thu 2 - Thu 6', '2026-12-31', 'published', '2026-06-17 22:00:08', 0, '2026-06-17 13:18:37', '2026-06-17 22:00:08'),
(13, 11, 0, 1, 11, 'Nhan vien kinh doanh 4', 2, 'Tu van va cham soc khach hang', '1', 'college', 'Giao tiep va tin hoc van phong', 'Lam viec nhom', 'Uu tien ung vien co kinh nghiem', 3, 'BHXH va phu cap', 'Thuong doanh so', 'Moi truong tre trung', 'full_time', 'hot', 'Kon Tum', 'Thu 2 - Thu 6', '2026-12-31', 'published', '2026-06-17 22:00:08', 0, '2026-06-17 13:42:33', '2026-06-17 22:00:08'),
(14, 11, 0, 1, 11, 'Nhân viên kế toán', 2, 'Tu van va cham soc khach hang', '1', 'college', 'Giao tiep va tin hoc van phong', 'Lam viec nhom', 'Uu tien ung vien co kinh nghiem', 3, 'BHXH va phu cap', 'Thuong doanh so', 'Moi truong tre trung', 'full_time', 'hot', 'Kon Tum', 'Thu 2 - Thu 6', '2026-12-31', 'published', '2026-06-17 22:00:08', 0, '2026-06-17 13:42:33', '2026-06-17 22:00:08'),
(15, 11, 0, 1, 11, 'Nhân viên CNTT', 2, 'Tu van va cham soc khach hang', '1', 'college', 'Giao tiep va tin hoc van phong', 'Lam viec nhom', 'Uu tien ung vien co kinh nghiem', 3, 'BHXH va phu cap', 'Thuong doanh so', 'Moi truong tre trung', 'full_time', 'hot', 'Kon Tum', 'Thu 2 - Thu 6', '2026-12-31', 'published', '2026-06-17 22:00:08', 0, '2026-06-17 13:42:33', '2026-06-17 22:00:08'),
(16, 11, 0, 1, 11, 'Nhân viên Kiểm kho', 2, 'Tu van va cham soc khach hang', '1', 'college', 'Giao tiep va tin hoc van phong', 'Lam viec nhom', 'Uu tien ung vien co kinh nghiem', 3, 'BHXH va phu cap', 'Thuong doanh so', 'Moi truong tre trung', 'full_time', 'hot', 'Kon Tum', 'Thu 2 - Thu 6', '2026-12-31', 'published', '2026-06-17 22:00:08', 0, '2026-06-17 13:42:33', '2026-06-17 22:00:08'),
(17, 11, 0, 1, 11, 'Nhân viên Kiểm toán', 2, 'Tu van va cham soc khach hang', '1', 'college', 'Giao tiep va tin hoc van phong', 'Lam viec nhom', 'Uu tien ung vien co kinh nghiem', 3, 'BHXH va phu cap', 'Thuong doanh so', 'Moi truong tre trung', 'full_time', 'hot', 'Kon Tum', 'Thu 2 - Thu 6', '2026-12-31', 'published', '2026-06-17 22:00:08', 0, '2026-06-17 13:42:33', '2026-06-17 22:00:08'),
(18, 11, 0, 1, 11, 'Giám đốc', 2, 'Tu van va cham soc khach hang', '1', 'college', 'Giao tiep va tin hoc van phong', 'Lam viec nhom', 'Uu tien ung vien co kinh nghiem', 3, 'BHXH va phu cap', 'Thuong doanh so', 'Moi truong tre trung', 'full_time', 'hot', 'Kon Tum', 'Thu 2 - Thu 6', '2026-12-31', 'published', '2026-06-17 22:00:08', 0, '2026-06-17 13:42:33', '2026-06-17 22:00:08'),
(19, 11, 0, 1, 11, 'Nhân viên Sale', 2, 'Tu van va cham soc khach hang', '1', 'college', 'Giao tiep va tin hoc van phong', 'Lam viec nhom', 'Uu tien ung vien co kinh nghiem', 3, 'BHXH va phu cap', 'Thuong doanh so', 'Moi truong tre trung', 'full_time', 'hot', 'Kon Tum', 'Thu 2 - Thu 6', '2026-12-31', 'published', '2026-06-17 22:00:08', 1, '2026-06-17 13:42:33', '2026-06-17 22:00:08'),
(20, 11, 0, 1, 11, 'Nhan vien kinh doanh', 2, 'Tu van va cham soc khach hang', '1', 'college', 'Giao tiep va tin hoc van phong', 'Lam viec nhom', 'Uu tien ung vien co kinh nghiem', 3, 'BHXH va phu cap', 'Thuong doanh so', 'Moi truong tre trung', 'full_time', 'hot', 'Kon Tum', 'Thu 2 - Thu 6', '2026-12-31', 'published', '2026-06-17 22:00:08', 1, '2026-06-17 14:49:01', '2026-06-17 22:00:08'),
(21, 11, 0, 73, 24, 'PHP Developer tại Khánh Hòa', 8, 'Tiếp nhận yêu cầu, xử lý nghiệp vụ hằng ngày và đảm bảo tiến độ công việc', '0', 'high_school', 'Có khả năng đọc hiểu tài liệu, tổng hợp số liệu và lập báo cáo', 'Chủ động, trách nhiệm, chịu được áp lực', 'Sẵn sàng học hỏi và tuân thủ quy trình', 3, 'Được đào tạo nghiệp vụ và có cơ hội thăng tiến', 'Thưởng cuối năm theo quy định công ty', 'Văn phòng chuyên nghiệp, thân thiện', 'remote', 'hot', 'Khánh Hòa', 'Theo lịch phân công', '2026-08-27', 'published', '2026-06-17 22:00:27', 0, '2026-06-17 14:49:01', '2026-06-17 22:00:27'),
(22, 8, 0, 4, 15, 'Nhân viên Marketing', 9, 'Quản lý hồ sơ, nhập liệu, tổng hợp báo cáo và theo dõi tiến độ xử lý', '1', 'postgraduate', 'Có khả năng đọc hiểu tài liệu, tổng hợp số liệu và lập báo cáo', 'Giao tiếp tốt, làm việc nhóm', 'Không yêu cầu kinh nghiệm, sẽ được đào tạo', 3, 'Lương thưởng rõ ràng, xét tăng lương định kỳ', 'Thưởng doanh số theo kết quả công việc', 'Quy trình rõ ràng, hỗ trợ đào tạo', 'remote', 'hot', 'Ninh Bình', 'Thứ 2 - Thứ 6', '2026-12-24', 'published', '2026-06-17 22:00:27', 0, '2026-06-17 14:49:01', '2026-06-17 22:00:27'),
(23, 11, 0, 41, 14, 'Nhân viên chăm sóc sức khỏe', 4, 'Quản lý hồ sơ, nhập liệu, tổng hợp báo cáo và theo dõi tiến độ xử lý', '5', 'college', 'Thành thạo công cụ làm việc liên quan đến vị trí ứng tuyển', 'Kỹ năng xử lý tình huống', 'Có thể đi công tác khi cần', 11, 'Hỗ trợ ăn trưa, gửi xe và các chế độ phúc lợi nội bộ', 'Thưởng hiệu suất và thưởng lễ Tết', 'Không gian làm việc ổn định, sạch sẽ', 'remote', 'hot', 'Hưng Yên', 'Thứ 2 - Thứ 7', '2026-11-18', 'published', '2026-06-17 22:00:27', 0, '2026-06-17 14:49:01', '2026-06-17 22:00:27'),
(24, 10, 0, 6, 32, 'Chuyên viên kinh doanh tại An Giang', 5, 'Thực hiện công việc theo phân công, phối hợp với các bộ phận liên quan và báo cáo kết quả định kỳ', '3', 'college', 'Kỹ năng chuyên môn đúng vị trí, thao tác nhanh và cẩn thận', 'Giao tiếp tốt, làm việc nhóm', 'Ưu tiên ứng viên có kinh nghiệm thực tế', 5, 'Lương thưởng rõ ràng, xét tăng lương định kỳ', 'Thưởng cuối năm theo quy định công ty', 'Môi trường trẻ trung, năng động', 'remote', 'hot', 'An Giang', 'Linh hoạt theo ca', '2026-10-21', 'published', '2026-06-17 22:00:27', 0, '2026-06-17 14:49:01', '2026-06-17 22:00:27'),
(25, 5, 0, 40, 34, 'Điều dưỡng viên', 8, 'Thực hiện công việc theo phân công, phối hợp với các bộ phận liên quan và báo cáo kết quả định kỳ', '4', 'college', 'Biết sử dụng email, bảng tính và các công cụ cộng tác trực tuyến', 'Cẩn thận, trung thực, ham học hỏi', 'Không yêu cầu kinh nghiệm, sẽ được đào tạo', 3, 'Môi trường ổn định, đồng nghiệp hỗ trợ', 'Thưởng chuyên cần và thưởng sáng kiến', 'Không gian làm việc ổn định, sạch sẽ', 'contract', 'hot', 'Cà Mau', 'Theo lịch phân công', '2026-09-07', 'published', '2026-06-17 22:00:27', 0, '2026-06-17 14:49:01', '2026-06-17 22:00:27'),
(26, 6, 0, 17, 19, 'Nhân viên vận tải tại Quảng Trị', 5, 'Tham gia triển khai kế hoạch, đề xuất cải tiến quy trình và nâng cao hiệu quả công việc', '0', 'college', 'Kỹ năng chuyên môn đúng vị trí, thao tác nhanh và cẩn thận', 'Tư duy dịch vụ khách hàng', 'Không yêu cầu kinh nghiệm, sẽ được đào tạo', 5, 'Lương thưởng rõ ràng, xét tăng lương định kỳ', 'Thưởng hiệu suất và thưởng lễ Tết', 'Đội ngũ quản lý hỗ trợ sát sao', 'remote', 'hot', 'Quảng Trị', 'Thứ 2 - Thứ 7', '2026-11-30', 'published', '2026-06-17 22:00:27', 0, '2026-06-17 14:49:01', '2026-06-17 22:00:27'),
(27, 6, 0, 38, 12, 'Nhân viên y tế', 4, 'Tiếp nhận yêu cầu, xử lý nghiệp vụ hằng ngày và đảm bảo tiến độ công việc', '5', 'postgraduate', 'Thành thạo công cụ làm việc liên quan đến vị trí ứng tuyển', 'Giao tiếp tốt, làm việc nhóm', 'Có tinh thần trách nhiệm cao', 5, 'Môi trường ổn định, đồng nghiệp hỗ trợ', 'Thưởng doanh số theo kết quả công việc', 'Môi trường trẻ trung, năng động', 'remote', 'hot', 'Phú Thọ', 'Thứ 2 - Thứ 6', '2026-09-22', 'published', '2026-06-17 22:00:27', 0, '2026-06-17 14:49:01', '2026-06-17 22:00:27'),
(28, 12, 0, 25, 4, 'Kỹ thuật viên điện điện tử', 10, 'Tiếp nhận yêu cầu, xử lý nghiệp vụ hằng ngày và đảm bảo tiến độ công việc', '0', 'college', 'Tin học văn phòng, sử dụng phần mềm quản lý cơ bản', 'Cẩn thận, trung thực, ham học hỏi', 'Sẵn sàng học hỏi và tuân thủ quy trình', 5, 'Môi trường ổn định, đồng nghiệp hỗ trợ', 'Thưởng doanh số theo kết quả công việc', 'Đội ngũ quản lý hỗ trợ sát sao', 'part_time', 'hot', 'Điện Biên', 'Theo lịch phân công', '2026-08-20', 'published', '2026-06-17 22:00:27', 0, '2026-06-17 14:49:01', '2026-06-17 22:00:27'),
(29, 7, 0, 44, 31, 'Biên dịch viên tiếng Anh', 3, 'Thực hiện công việc theo phân công, phối hợp với các bộ phận liên quan và báo cáo kết quả định kỳ', '5', 'university', 'Biết sử dụng email, bảng tính và các công cụ cộng tác trực tuyến', 'Chủ động, trách nhiệm, chịu được áp lực', 'Có thể đi công tác khi cần', 7, 'Được đào tạo nghiệp vụ và có cơ hội thăng tiến', 'Thưởng dự án khi hoàn thành mục tiêu', 'Quy trình rõ ràng, hỗ trợ đào tạo', 'remote', 'hot', 'Vĩnh Long', 'Ca hành chính', '2026-08-24', 'published', '2026-06-17 22:00:27', 0, '2026-06-17 14:49:01', '2026-06-17 22:00:27'),
(30, 3, 0, 10, 5, 'Nhân viên nhân sự', 3, 'Quản lý hồ sơ, nhập liệu, tổng hợp báo cáo và theo dõi tiến độ xử lý', '1', 'university', 'Thành thạo công cụ làm việc liên quan đến vị trí ứng tuyển', 'Cẩn thận, trung thực, ham học hỏi', 'Có tinh thần trách nhiệm cao', 5, 'Lương thưởng rõ ràng, xét tăng lương định kỳ', 'Thưởng hiệu suất và thưởng lễ Tết', 'Đội ngũ quản lý hỗ trợ sát sao', 'remote', 'hot', 'Lai Châu', 'Theo lịch phân công', '2026-08-01', 'published', '2026-06-17 22:00:27', 0, '2026-06-17 14:49:01', '2026-06-17 22:00:27'),
(31, 3, 0, 28, 15, 'Kỹ thuật viên ô tô', 6, 'Thực hiện công việc theo phân công, phối hợp với các bộ phận liên quan và báo cáo kết quả định kỳ', '0', 'university', 'Có khả năng đọc hiểu tài liệu, tổng hợp số liệu và lập báo cáo', 'Tư duy dịch vụ khách hàng', 'Có thể đi công tác khi cần', 5, 'Hỗ trợ ăn trưa, gửi xe và các chế độ phúc lợi nội bộ', 'Thưởng cuối năm theo quy định công ty', 'Quy trình rõ ràng, hỗ trợ đào tạo', 'remote', 'hot', 'Ninh Bình', 'Theo lịch phân công', '2026-11-06', 'published', '2026-06-17 22:00:27', 0, '2026-06-17 14:49:01', '2026-06-17 22:00:27'),
(32, 6, 0, 72, 18, 'Backend Developer tại Hà Tĩnh', 5, 'Quản lý hồ sơ, nhập liệu, tổng hợp báo cáo và theo dõi tiến độ xử lý', '2', 'university', 'Thành thạo công cụ làm việc liên quan đến vị trí ứng tuyển', 'Giao tiếp tốt, làm việc nhóm', 'Có tinh thần trách nhiệm cao', 7, 'Môi trường ổn định, đồng nghiệp hỗ trợ', 'Thưởng cuối năm theo quy định công ty', 'Đội ngũ quản lý hỗ trợ sát sao', 'remote', 'hot', 'Hà Tĩnh', 'Linh hoạt theo ca', '2026-08-03', 'published', '2026-06-17 22:00:27', 0, '2026-06-17 14:49:01', '2026-06-17 22:00:27'),
(33, 7, 0, 78, 2, 'Content Creator tại Cao Bằng', 1, 'Thực hiện công việc theo phân công, phối hợp với các bộ phận liên quan và báo cáo kết quả định kỳ', '1', 'postgraduate', 'Tin học văn phòng, sử dụng phần mềm quản lý cơ bản', 'Chủ động, trách nhiệm, chịu được áp lực', 'Ưu tiên ứng viên có kinh nghiệm thực tế', 8, 'Được đào tạo nghiệp vụ và có cơ hội thăng tiến', 'Thưởng doanh số theo kết quả công việc', 'Đội ngũ quản lý hỗ trợ sát sao', 'contract', 'hot', 'Cao Bằng', 'Theo lịch phân công', '2026-11-14', 'published', '2026-06-17 22:00:27', 0, '2026-06-17 14:49:01', '2026-06-17 22:00:27'),
(34, 10, 0, 44, 31, 'Biên dịch viên tiếng Anh', 1, 'Tham gia triển khai kế hoạch, đề xuất cải tiến quy trình và nâng cao hiệu quả công việc', '0', 'none', 'Thành thạo công cụ làm việc liên quan đến vị trí ứng tuyển', 'Tư duy dịch vụ khách hàng', 'Có thể đi công tác khi cần', 8, 'Hỗ trợ ăn trưa, gửi xe và các chế độ phúc lợi nội bộ', 'Thưởng doanh số theo kết quả công việc', 'Môi trường trẻ trung, năng động', 'internship', 'hot', 'Vĩnh Long', 'Thứ 2 - Thứ 6', '2026-11-23', 'published', '2026-06-17 22:00:27', 0, '2026-06-17 14:49:01', '2026-06-17 22:00:27'),
(35, 6, 0, 98, 24, 'Data Analyst', 2, 'Tư vấn, hỗ trợ khách hàng, cập nhật thông tin và chăm sóc sau dịch vụ', '3', 'high_school', 'Thành thạo công cụ làm việc liên quan đến vị trí ứng tuyển', 'Cẩn thận, trung thực, ham học hỏi', 'Không yêu cầu kinh nghiệm, sẽ được đào tạo', 8, 'Hỗ trợ ăn trưa, gửi xe và các chế độ phúc lợi nội bộ', 'Thưởng chuyên cần và thưởng sáng kiến', 'Đội ngũ quản lý hỗ trợ sát sao', 'contract', 'hot', 'Khánh Hòa', 'Thứ 2 - Thứ 6', '2026-08-26', 'published', '2026-06-17 22:00:27', 0, '2026-06-17 14:49:01', '2026-06-17 22:00:27'),
(36, 12, 0, 98, 16, 'Data Analyst', 2, 'Tiếp nhận yêu cầu, xử lý nghiệp vụ hằng ngày và đảm bảo tiến độ công việc', '4', 'postgraduate', 'Thành thạo công cụ làm việc liên quan đến vị trí ứng tuyển', 'Chủ động, trách nhiệm, chịu được áp lực', 'Ưu tiên ứng viên có kinh nghiệm thực tế', 8, 'Được đào tạo nghiệp vụ và có cơ hội thăng tiến', 'Thưởng dự án khi hoàn thành mục tiêu', 'Môi trường trẻ trung, năng động', 'full_time', 'hot', 'Thanh Hóa', 'Theo lịch phân công', '2026-11-02', 'published', '2026-06-17 22:00:27', 0, '2026-06-17 14:49:01', '2026-06-17 22:00:27'),
(37, 3, 0, 106, 31, 'Tư vấn tuyển sinh', 7, 'Thực hiện công việc theo phân công, phối hợp với các bộ phận liên quan và báo cáo kết quả định kỳ', '1', 'high_school', 'Biết sử dụng email, bảng tính và các công cụ cộng tác trực tuyến', 'Tư duy dịch vụ khách hàng', 'Có thể đi công tác khi cần', 6, 'Lương thưởng rõ ràng, xét tăng lương định kỳ', 'Thưởng doanh số theo kết quả công việc', 'Văn phòng chuyên nghiệp, thân thiện', 'full_time', 'hot', 'Vĩnh Long', 'Linh hoạt theo ca', '2026-11-28', 'published', '2026-06-17 22:00:27', 0, '2026-06-17 14:49:01', '2026-06-17 22:00:27'),
(38, 11, 0, 72, 13, 'Backend Developer tại Hải Phòng', 3, 'Tư vấn, hỗ trợ khách hàng, cập nhật thông tin và chăm sóc sau dịch vụ', '1', 'postgraduate', 'Tin học văn phòng, sử dụng phần mềm quản lý cơ bản', 'Chủ động, trách nhiệm, chịu được áp lực', 'Sẵn sàng học hỏi và tuân thủ quy trình', 11, 'Môi trường ổn định, đồng nghiệp hỗ trợ', 'Thưởng doanh số theo kết quả công việc', 'Quy trình rõ ràng, hỗ trợ đào tạo', 'internship', 'hot', 'Hải Phòng', 'Thứ 2 - Thứ 6', '2026-09-30', 'published', '2026-06-17 22:00:27', 0, '2026-06-17 14:49:01', '2026-06-17 22:00:27'),
(39, 3, 0, 29, 10, 'Nhân viên sản xuất tại Quảng Ninh', 8, 'Tư vấn, hỗ trợ khách hàng, cập nhật thông tin và chăm sóc sau dịch vụ', '4', 'high_school', 'Kỹ năng chuyên môn đúng vị trí, thao tác nhanh và cẩn thận', 'Tư duy dịch vụ khách hàng', 'Ưu tiên ứng viên có kinh nghiệm thực tế', 5, 'BHXH, BHYT, BHTN theo quy định; phụ cấp theo vị trí', 'Thưởng doanh số theo kết quả công việc', 'Môi trường trẻ trung, năng động', 'full_time', 'hot', 'Quảng Ninh', 'Thứ 2 - Thứ 6', '2026-09-10', 'published', '2026-06-17 22:00:27', 0, '2026-06-17 14:49:01', '2026-06-17 22:00:27'),
(40, 3, 0, 39, 33, 'Dược sĩ bán thuốc tại Cần Thơ', 3, 'Tư vấn, hỗ trợ khách hàng, cập nhật thông tin và chăm sóc sau dịch vụ', '5', 'college', 'Có khả năng đọc hiểu tài liệu, tổng hợp số liệu và lập báo cáo', 'Chủ động, trách nhiệm, chịu được áp lực', 'Có tinh thần trách nhiệm cao', 7, 'Hỗ trợ ăn trưa, gửi xe và các chế độ phúc lợi nội bộ', 'Thưởng hiệu suất và thưởng lễ Tết', 'Đội ngũ quản lý hỗ trợ sát sao', 'remote', 'hot', 'Cần Thơ', 'Thứ 2 - Thứ 6', '2026-11-19', 'published', '2026-06-17 22:00:27', 3, '2026-06-17 14:49:01', '2026-06-17 22:00:27'),
(41, 4, 0, 26, 23, 'Kỹ thuật viên cơ khí', 7, 'Quản lý hồ sơ, nhập liệu, tổng hợp báo cáo và theo dõi tiến độ xử lý', '4', 'college', 'Thành thạo công cụ làm việc liên quan đến vị trí ứng tuyển', 'Tư duy dịch vụ khách hàng', 'Có thể đi công tác khi cần', 5, 'Môi trường ổn định, đồng nghiệp hỗ trợ', 'Thưởng doanh số theo kết quả công việc', 'Môi trường trẻ trung, năng động', 'part_time', 'hot', 'Gia Lai', 'Thứ 2 - Thứ 7', '2026-08-15', 'published', '2026-06-17 21:59:41', 0, '2026-06-17 14:49:01', '2026-06-17 21:59:41'),
(42, 7, 0, 78, 22, 'Content Creator', 1, 'Tiếp nhận yêu cầu, xử lý nghiệp vụ hằng ngày và đảm bảo tiến độ công việc', '2', 'postgraduate', 'Có khả năng đọc hiểu tài liệu, tổng hợp số liệu và lập báo cáo', 'Giao tiếp tốt, làm việc nhóm', 'Có thể đi công tác khi cần', 4, 'Được đào tạo nghiệp vụ và có cơ hội thăng tiến', 'Thưởng doanh số theo kết quả công việc', 'Quy trình rõ ràng, hỗ trợ đào tạo', 'full_time', 'hot', 'Quảng Ngãi', 'Thứ 2 - Thứ 6', '2026-10-28', 'published', '2026-06-17 21:59:41', 1, '2026-06-17 14:49:01', '2026-06-17 21:59:41'),
(43, 12, 0, 109, 4, 'Tư vấn khách hàng', 6, 'Tiếp nhận yêu cầu, xử lý nghiệp vụ hằng ngày và đảm bảo tiến độ công việc', '3', 'college', 'Thành thạo công cụ làm việc liên quan đến vị trí ứng tuyển', 'Kỹ năng xử lý tình huống', 'Ưu tiên ứng viên có kinh nghiệm thực tế', 7, 'Lương thưởng rõ ràng, xét tăng lương định kỳ', 'Thưởng cuối năm theo quy định công ty', 'Quy trình rõ ràng, hỗ trợ đào tạo', 'internship', 'hot', 'Điện Biên', 'Thứ 2 - Thứ 7', '2026-11-19', 'published', '2026-06-17 21:59:41', 0, '2026-06-17 14:49:01', '2026-06-17 21:59:41'),
(44, 11, 0, 77, 22, 'Nhân viên SEO', 1, 'Tư vấn, hỗ trợ khách hàng, cập nhật thông tin và chăm sóc sau dịch vụ', '1', 'college', 'Kỹ năng chuyên môn đúng vị trí, thao tác nhanh và cẩn thận', 'Kỹ năng xử lý tình huống', 'Có thể đi công tác khi cần', 3, 'Môi trường ổn định, đồng nghiệp hỗ trợ', 'Thưởng dự án khi hoàn thành mục tiêu', 'Quy trình rõ ràng, hỗ trợ đào tạo', 'remote', 'hot', 'Quảng Ngãi', 'Thứ 2 - Thứ 7', '2026-09-10', 'published', '2026-06-17 21:59:41', 3, '2026-06-17 14:49:01', '2026-06-17 21:59:41'),
(45, 3, 0, 9, 32, 'Nhân viên hành chính văn phòng', 10, 'Tiếp nhận yêu cầu, xử lý nghiệp vụ hằng ngày và đảm bảo tiến độ công việc', '2', 'none', 'Tin học văn phòng, sử dụng phần mềm quản lý cơ bản', 'Tư duy dịch vụ khách hàng', 'Không yêu cầu kinh nghiệm, sẽ được đào tạo', 8, 'Môi trường ổn định, đồng nghiệp hỗ trợ', 'Thưởng hiệu suất và thưởng lễ Tết', 'Đội ngũ quản lý hỗ trợ sát sao', 'contract', 'hot', 'An Giang', 'Thứ 2 - Thứ 6', '2026-10-22', 'published', '2026-06-17 21:59:41', 0, '2026-06-17 14:49:01', '2026-06-17 21:59:41'),
(46, 6, 0, 31, 6, 'Quản lý chất lượng', 5, 'Thực hiện công việc theo phân công, phối hợp với các bộ phận liên quan và báo cáo kết quả định kỳ', '1', 'college', 'Biết sử dụng email, bảng tính và các công cụ cộng tác trực tuyến', 'Kỹ năng xử lý tình huống', 'Không yêu cầu kinh nghiệm, sẽ được đào tạo', 5, 'BHXH, BHYT, BHTN theo quy định; phụ cấp theo vị trí', 'Thưởng chuyên cần và thưởng sáng kiến', 'Quy trình rõ ràng, hỗ trợ đào tạo', 'remote', 'hot', 'Sơn La', 'Thứ 2 - Thứ 7', '2027-01-11', 'published', '2026-06-17 21:59:41', 0, '2026-06-17 14:49:01', '2026-06-17 21:59:41'),
(47, 3, 0, 30, 15, 'Nhân viên QA/QC', 1, 'Tham gia triển khai kế hoạch, đề xuất cải tiến quy trình và nâng cao hiệu quả công việc', '1', 'none', 'Kỹ năng chuyên môn đúng vị trí, thao tác nhanh và cẩn thận', 'Tư duy dịch vụ khách hàng', 'Có thể đi công tác khi cần', 8, 'BHXH, BHYT, BHTN theo quy định; phụ cấp theo vị trí', 'Thưởng chuyên cần và thưởng sáng kiến', 'Không gian làm việc ổn định, sạch sẽ', 'remote', 'hot', 'Ninh Bình', 'Thứ 2 - Thứ 6', '2026-10-26', 'published', '2026-06-17 21:59:41', 0, '2026-06-17 14:49:01', '2026-06-17 21:59:41'),
(48, 2, 0, 43, 24, 'Giảng viên', 5, 'Thực hiện công việc theo phân công, phối hợp với các bộ phận liên quan và báo cáo kết quả định kỳ', '4', 'university', 'Biết sử dụng email, bảng tính và các công cụ cộng tác trực tuyến', 'Tư duy dịch vụ khách hàng', 'Sẵn sàng học hỏi và tuân thủ quy trình', 6, 'Được đào tạo nghiệp vụ và có cơ hội thăng tiến', 'Thưởng cuối năm theo quy định công ty', 'Môi trường trẻ trung, năng động', 'remote', 'hot', 'Khánh Hòa', 'Thứ 2 - Thứ 7', '2027-01-23', 'published', '2026-06-17 21:59:41', 0, '2026-06-17 14:49:01', '2026-06-17 21:59:41'),
(49, 9, 0, 105, 30, 'Kỹ sư xây dựng công trình', 4, 'Tư vấn, hỗ trợ khách hàng, cập nhật thông tin và chăm sóc sau dịch vụ', '5', 'college', 'Có khả năng đọc hiểu tài liệu, tổng hợp số liệu và lập báo cáo', 'Cẩn thận, trung thực, ham học hỏi', 'Có tinh thần trách nhiệm cao', 8, 'Lương thưởng rõ ràng, xét tăng lương định kỳ', 'Thưởng doanh số theo kết quả công việc', 'Môi trường trẻ trung, năng động', 'remote', 'hot', 'Đồng Tháp', 'Linh hoạt theo ca', '2026-12-17', 'published', '2026-06-17 21:59:41', 0, '2026-06-17 14:49:01', '2026-06-17 21:59:41'),
(50, 1, 0, 78, 15, 'Content Creator', 6, 'Tiếp nhận yêu cầu, xử lý nghiệp vụ hằng ngày và đảm bảo tiến độ công việc', '0', 'high_school', 'Có khả năng đọc hiểu tài liệu, tổng hợp số liệu và lập báo cáo', 'Cẩn thận, trung thực, ham học hỏi', 'Ưu tiên ứng viên có kinh nghiệm thực tế', 4, 'BHXH, BHYT, BHTN theo quy định; phụ cấp theo vị trí', 'Thưởng doanh số theo kết quả công việc', 'Đội ngũ quản lý hỗ trợ sát sao', 'full_time', 'hot', 'Ninh Bình', 'Theo lịch phân công', '2026-09-07', 'published', '2026-06-17 21:59:41', 0, '2026-06-17 14:49:01', '2026-06-17 21:59:41'),
(51, 6, 0, 39, 31, 'Dược sĩ bán thuốc', 6, 'Quản lý hồ sơ, nhập liệu, tổng hợp báo cáo và theo dõi tiến độ xử lý', '0', 'college', 'Tin học văn phòng, sử dụng phần mềm quản lý cơ bản', 'Cẩn thận, trung thực, ham học hỏi', 'Có tinh thần trách nhiệm cao', 4, 'BHXH, BHYT, BHTN theo quy định; phụ cấp theo vị trí', 'Thưởng cuối năm theo quy định công ty', 'Môi trường trẻ trung, năng động', 'contract', 'hot', 'Vĩnh Long', 'Thứ 2 - Thứ 7', '2026-08-29', 'published', '2026-06-17 21:59:41', 1, '2026-06-17 14:49:01', '2026-06-17 21:59:41'),
(52, 3, 0, 52, 3, 'Nhân viên phục vụ nhà hàng', 8, 'Thực hiện công việc theo phân công, phối hợp với các bộ phận liên quan và báo cáo kết quả định kỳ', '3', 'postgraduate', 'Có khả năng đọc hiểu tài liệu, tổng hợp số liệu và lập báo cáo', 'Tư duy dịch vụ khách hàng', 'Có thể đi công tác khi cần', 11, 'Môi trường ổn định, đồng nghiệp hỗ trợ', 'Thưởng doanh số theo kết quả công việc', 'Văn phòng chuyên nghiệp, thân thiện', 'contract', 'hot', 'Tuyên Quang', 'Thứ 2 - Thứ 6', '2026-08-22', 'published', '2026-06-17 21:59:41', 0, '2026-06-17 14:49:01', '2026-06-17 21:59:41'),
(53, 11, 0, 30, 16, 'Nhân viên QA/QC', 7, 'Tư vấn, hỗ trợ khách hàng, cập nhật thông tin và chăm sóc sau dịch vụ', '1', 'none', 'Tin học văn phòng, sử dụng phần mềm quản lý cơ bản', 'Giao tiếp tốt, làm việc nhóm', 'Có thể đi công tác khi cần', 8, 'BHXH, BHYT, BHTN theo quy định; phụ cấp theo vị trí', 'Thưởng chuyên cần và thưởng sáng kiến', 'Môi trường trẻ trung, năng động', 'full_time', 'hot', 'Thanh Hóa', 'Linh hoạt theo ca', '2026-10-01', 'published', '2026-06-17 21:59:41', 0, '2026-06-17 14:49:01', '2026-06-17 21:59:41'),
(54, 2, 0, 46, 1, 'Chuyên viên pháp lý tại Hà Nội', 3, 'Tư vấn, hỗ trợ khách hàng, cập nhật thông tin và chăm sóc sau dịch vụ', '0', 'university', 'Tin học văn phòng, sử dụng phần mềm quản lý cơ bản', 'Giao tiếp tốt, làm việc nhóm', 'Có thể đi công tác khi cần', 5, 'Môi trường ổn định, đồng nghiệp hỗ trợ', 'Thưởng chuyên cần và thưởng sáng kiến', 'Môi trường trẻ trung, năng động', 'internship', 'hot', 'Hà Nội', 'Theo lịch phân công', '2026-11-10', 'published', '2026-06-17 21:59:41', 0, '2026-06-17 14:49:01', '2026-06-17 21:59:41'),
(55, 3, 0, 8, 10, 'Nhân viên chăm sóc khách hàng', 7, 'Thực hiện công việc theo phân công, phối hợp với các bộ phận liên quan và báo cáo kết quả định kỳ', '0', 'high_school', 'Biết sử dụng email, bảng tính và các công cụ cộng tác trực tuyến', 'Tư duy dịch vụ khách hàng', 'Ưu tiên ứng viên có kinh nghiệm thực tế', 5, 'BHXH, BHYT, BHTN theo quy định; phụ cấp theo vị trí', 'Thưởng cuối năm theo quy định công ty', 'Văn phòng chuyên nghiệp, thân thiện', 'part_time', 'hot', 'Quảng Ninh', 'Linh hoạt theo ca', '2026-09-03', 'published', '2026-06-17 21:59:41', 1, '2026-06-17 14:49:01', '2026-06-17 21:59:41'),
(56, 11, 0, 9, 6, 'Nhân viên hành chính văn phòng tại Sơn La', 6, 'Tiếp nhận yêu cầu, xử lý nghiệp vụ hằng ngày và đảm bảo tiến độ công việc', '0', 'none', 'Thành thạo công cụ làm việc liên quan đến vị trí ứng tuyển', 'Tư duy dịch vụ khách hàng', 'Sẵn sàng học hỏi và tuân thủ quy trình', 7, 'Hỗ trợ ăn trưa, gửi xe và các chế độ phúc lợi nội bộ', 'Thưởng cuối năm theo quy định công ty', 'Đội ngũ quản lý hỗ trợ sát sao', 'contract', 'hot', 'Sơn La', 'Linh hoạt theo ca', '2027-01-07', 'published', '2026-06-17 21:59:41', 0, '2026-06-17 14:49:01', '2026-06-17 21:59:41'),
(57, 8, 0, 28, 22, 'Kỹ thuật viên ô tô tại Quảng Ngãi', 10, 'Tham gia triển khai kế hoạch, đề xuất cải tiến quy trình và nâng cao hiệu quả công việc', '0', 'postgraduate', 'Kỹ năng chuyên môn đúng vị trí, thao tác nhanh và cẩn thận', 'Giao tiếp tốt, làm việc nhóm', 'Có tinh thần trách nhiệm cao', 7, 'Môi trường ổn định, đồng nghiệp hỗ trợ', 'Thưởng doanh số theo kết quả công việc', 'Môi trường trẻ trung, năng động', 'internship', 'hot', 'Quảng Ngãi', 'Ca hành chính', '2026-09-16', 'published', '2026-06-17 21:59:41', 2, '2026-06-17 14:49:01', '2026-06-17 21:59:41'),
(58, 1, 0, 104, 22, 'Kỹ sư cơ khí', 7, 'Thực hiện công việc theo phân công, phối hợp với các bộ phận liên quan và báo cáo kết quả định kỳ', '0', 'high_school', 'Tin học văn phòng, sử dụng phần mềm quản lý cơ bản', 'Cẩn thận, trung thực, ham học hỏi', 'Có thể đi công tác khi cần', 8, 'Hỗ trợ ăn trưa, gửi xe và các chế độ phúc lợi nội bộ', 'Thưởng hiệu suất và thưởng lễ Tết', 'Đội ngũ quản lý hỗ trợ sát sao', 'full_time', 'hot', 'Quảng Ngãi', 'Linh hoạt theo ca', '2026-11-19', 'published', '2026-06-17 21:59:41', 0, '2026-06-17 14:49:01', '2026-06-17 21:59:41'),
(59, 7, 0, 6, 17, 'Chuyên viên kinh doanh', 8, 'Quản lý hồ sơ, nhập liệu, tổng hợp báo cáo và theo dõi tiến độ xử lý', '0', 'postgraduate', 'Kỹ năng chuyên môn đúng vị trí, thao tác nhanh và cẩn thận', 'Giao tiếp tốt, làm việc nhóm', 'Sẵn sàng học hỏi và tuân thủ quy trình', 4, 'BHXH, BHYT, BHTN theo quy định; phụ cấp theo vị trí', 'Thưởng chuyên cần và thưởng sáng kiến', 'Không gian làm việc ổn định, sạch sẽ', 'contract', 'hot', 'Nghệ An', 'Thứ 2 - Thứ 7', '2026-08-26', 'published', '2026-06-17 21:59:41', 0, '2026-06-17 14:49:01', '2026-06-17 21:59:41'),
(60, 4, 0, 76, 19, 'UI/UX Designer tại Quảng Trị', 8, 'Quản lý hồ sơ, nhập liệu, tổng hợp báo cáo và theo dõi tiến độ xử lý', '0', 'postgraduate', 'Biết sử dụng email, bảng tính và các công cụ cộng tác trực tuyến', 'Tư duy dịch vụ khách hàng', 'Có tinh thần trách nhiệm cao', 7, 'Lương thưởng rõ ràng, xét tăng lương định kỳ', 'Thưởng hiệu suất và thưởng lễ Tết', 'Không gian làm việc ổn định, sạch sẽ', 'remote', 'hot', 'Quảng Trị', 'Thứ 2 - Thứ 7', '2027-01-24', 'published', '2026-06-17 21:59:41', 0, '2026-06-17 14:49:01', '2026-06-17 21:59:41'),
(61, 4, 0, 16, 20, 'Nhân viên Logistics', 2, 'Thực hiện công việc theo phân công, phối hợp với các bộ phận liên quan và báo cáo kết quả định kỳ', '5', 'high_school', 'Kỹ năng chuyên môn đúng vị trí, thao tác nhanh và cẩn thận', 'Chủ động, trách nhiệm, chịu được áp lực', 'Sẵn sàng học hỏi và tuân thủ quy trình', 3, 'Hỗ trợ ăn trưa, gửi xe và các chế độ phúc lợi nội bộ', 'Thưởng hiệu suất và thưởng lễ Tết', 'Môi trường trẻ trung, năng động', 'part_time', 'hot', 'Huế', 'Thứ 2 - Thứ 7', '2026-11-21', 'published', '2026-06-17 22:00:32', 0, '2026-06-17 14:49:01', '2026-06-17 22:00:32'),
(62, 9, 0, 51, 16, 'Lễ tân khách sạn', 5, 'Thực hiện công việc theo phân công, phối hợp với các bộ phận liên quan và báo cáo kết quả định kỳ', '0', 'postgraduate', 'Biết sử dụng email, bảng tính và các công cụ cộng tác trực tuyến', 'Cẩn thận, trung thực, ham học hỏi', 'Có thể đi công tác khi cần', 6, 'Môi trường ổn định, đồng nghiệp hỗ trợ', 'Thưởng doanh số theo kết quả công việc', 'Đội ngũ quản lý hỗ trợ sát sao', 'internship', 'hot', 'Thanh Hóa', 'Thứ 2 - Thứ 6', '2026-11-15', 'published', '2026-06-17 22:00:32', 0, '2026-06-17 14:49:01', '2026-06-17 22:00:32'),
(63, 9, 0, 17, 31, 'Nhân viên vận tải', 4, 'Thực hiện công việc theo phân công, phối hợp với các bộ phận liên quan và báo cáo kết quả định kỳ', '5', 'none', 'Thành thạo công cụ làm việc liên quan đến vị trí ứng tuyển', 'Kỹ năng xử lý tình huống', 'Sẵn sàng học hỏi và tuân thủ quy trình', 6, 'Hỗ trợ ăn trưa, gửi xe và các chế độ phúc lợi nội bộ', 'Thưởng chuyên cần và thưởng sáng kiến', 'Quy trình rõ ràng, hỗ trợ đào tạo', 'internship', 'hot', 'Vĩnh Long', 'Linh hoạt theo ca', '2026-12-10', 'published', '2026-06-17 22:00:32', 0, '2026-06-17 14:49:01', '2026-06-17 22:00:32'),
(64, 7, 0, 72, 7, 'Backend Developer', 6, 'Tiếp nhận yêu cầu, xử lý nghiệp vụ hằng ngày và đảm bảo tiến độ công việc', '2', 'college', 'Tin học văn phòng, sử dụng phần mềm quản lý cơ bản', 'Kỹ năng xử lý tình huống', 'Có tinh thần trách nhiệm cao', 7, 'Hỗ trợ ăn trưa, gửi xe và các chế độ phúc lợi nội bộ', 'Thưởng dự án khi hoàn thành mục tiêu', 'Môi trường trẻ trung, năng động', 'part_time', 'hot', 'Lào Cai', 'Thứ 2 - Thứ 7', '2026-10-16', 'published', '2026-06-17 22:00:32', 1, '2026-06-17 14:49:01', '2026-06-17 22:00:32'),
(65, 10, 0, 106, 29, 'Tư vấn tuyển sinh tại Tây Ninh', 7, 'Tham gia triển khai kế hoạch, đề xuất cải tiến quy trình và nâng cao hiệu quả công việc', '0', 'none', 'Kỹ năng chuyên môn đúng vị trí, thao tác nhanh và cẩn thận', 'Cẩn thận, trung thực, ham học hỏi', 'Không yêu cầu kinh nghiệm, sẽ được đào tạo', 4, 'Hỗ trợ ăn trưa, gửi xe và các chế độ phúc lợi nội bộ', 'Thưởng doanh số theo kết quả công việc', 'Môi trường trẻ trung, năng động', 'contract', 'hot', 'Tây Ninh', 'Thứ 2 - Thứ 6', '2026-10-29', 'published', '2026-06-17 22:00:32', 0, '2026-06-17 14:49:01', '2026-06-17 22:00:32'),
(66, 8, 0, 28, 30, 'Kỹ thuật viên ô tô tại Đồng Tháp', 2, 'Tư vấn, hỗ trợ khách hàng, cập nhật thông tin và chăm sóc sau dịch vụ', '3', 'college', 'Biết sử dụng email, bảng tính và các công cụ cộng tác trực tuyến', 'Giao tiếp tốt, làm việc nhóm', 'Sẵn sàng học hỏi và tuân thủ quy trình', 8, 'BHXH, BHYT, BHTN theo quy định; phụ cấp theo vị trí', 'Thưởng cuối năm theo quy định công ty', 'Môi trường trẻ trung, năng động', 'remote', 'hot', 'Đồng Tháp', 'Ca hành chính', '2026-09-06', 'published', '2026-06-17 22:00:32', 3, '2026-06-17 14:49:01', '2026-06-17 22:00:32'),
(67, 10, 0, 78, 2, 'Content Creator', 3, 'Tham gia triển khai kế hoạch, đề xuất cải tiến quy trình và nâng cao hiệu quả công việc', '1', 'college', 'Tin học văn phòng, sử dụng phần mềm quản lý cơ bản', 'Chủ động, trách nhiệm, chịu được áp lực', 'Ưu tiên ứng viên có kinh nghiệm thực tế', 7, 'Được đào tạo nghiệp vụ và có cơ hội thăng tiến', 'Thưởng hiệu suất và thưởng lễ Tết', 'Không gian làm việc ổn định, sạch sẽ', 'remote', 'hot', 'Cao Bằng', 'Theo lịch phân công', '2026-10-21', 'published', '2026-06-17 22:00:32', 1, '2026-06-17 14:49:01', '2026-06-17 22:00:32'),
(68, 5, 0, 25, 24, 'Kỹ thuật viên điện điện tử tại Khánh Hòa', 7, 'Tư vấn, hỗ trợ khách hàng, cập nhật thông tin và chăm sóc sau dịch vụ', '4', 'postgraduate', 'Biết sử dụng email, bảng tính và các công cụ cộng tác trực tuyến', 'Giao tiếp tốt, làm việc nhóm', 'Có tinh thần trách nhiệm cao', 8, 'BHXH, BHYT, BHTN theo quy định; phụ cấp theo vị trí', 'Thưởng cuối năm theo quy định công ty', 'Quy trình rõ ràng, hỗ trợ đào tạo', 'full_time', 'hot', 'Khánh Hòa', 'Linh hoạt theo ca', '2026-10-04', 'published', '2026-06-17 22:00:32', 1, '2026-06-17 14:49:01', '2026-06-17 22:00:32'),
(69, 7, 0, 43, 33, 'Giảng viên tại Cần Thơ', 7, 'Tham gia triển khai kế hoạch, đề xuất cải tiến quy trình và nâng cao hiệu quả công việc', '1', 'postgraduate', 'Thành thạo công cụ làm việc liên quan đến vị trí ứng tuyển', 'Kỹ năng xử lý tình huống', 'Có thể đi công tác khi cần', 8, 'Hỗ trợ ăn trưa, gửi xe và các chế độ phúc lợi nội bộ', 'Thưởng chuyên cần và thưởng sáng kiến', 'Môi trường trẻ trung, năng động', 'remote', 'hot', 'Cần Thơ', 'Theo lịch phân công', '2026-08-08', 'published', '2026-06-17 22:00:32', 12, '2026-06-17 14:49:01', '2026-06-17 22:00:32'),
(70, 2, 0, 29, 18, 'Nhân viên sản xuất', 10, 'Thực hiện công việc theo phân công, phối hợp với các bộ phận liên quan và báo cáo kết quả định kỳ', '0', 'college', 'Biết sử dụng email, bảng tính và các công cụ cộng tác trực tuyến', 'Kỹ năng xử lý tình huống', 'Có thể đi công tác khi cần', 6, 'Được đào tạo nghiệp vụ và có cơ hội thăng tiến', 'Thưởng chuyên cần và thưởng sáng kiến', 'Văn phòng chuyên nghiệp, thân thiện', 'contract', 'hot', 'Hà Tĩnh', 'Thứ 2 - Thứ 7', '2026-10-13', 'published', '2026-06-17 22:00:32', 0, '2026-06-17 14:49:01', '2026-06-17 22:00:32'),
(71, 12, 0, 29, 20, 'Công Ty Cổ Phần JobsGO Nhân Viên Kinh Doanh/Telesale/Tư Vấn Tuyển Dụng - Nghỉ T7, Chủ Nhật', 7, 'Quản lý hồ sơ, nhập liệu, tổng hợp báo cáo và theo dõi tiến độ xử lý', '0', 'university', 'Tin học văn phòng, sử dụng phần mềm quản lý cơ bản', 'Giao tiếp tốt, làm việc nhóm', 'Sẵn sàng học hỏi và tuân thủ quy trình', 11, 'Được đào tạo nghiệp vụ và có cơ hội thăng tiến', 'Thưởng hiệu suất và thưởng lễ Tết', 'Môi trường trẻ trung, năng động', 'internship', 'hot', 'Huế', 'Thứ 2 - Thứ 6', '2026-08-02', 'published', '2026-06-17 22:00:32', 9, '2026-06-17 14:49:01', '2026-06-17 22:21:59'),
(72, 3, 0, 39, 10, 'Dược sĩ bán thuốc tại Quảng Ninh', 7, 'Quản lý hồ sơ, nhập liệu, tổng hợp báo cáo và theo dõi tiến độ xử lý', '3', 'university', 'Kỹ năng chuyên môn đúng vị trí, thao tác nhanh và cẩn thận', 'Giao tiếp tốt, làm việc nhóm', 'Có tinh thần trách nhiệm cao', 8, 'BHXH, BHYT, BHTN theo quy định; phụ cấp theo vị trí', 'Thưởng chuyên cần và thưởng sáng kiến', 'Không gian làm việc ổn định, sạch sẽ', 'contract', 'hot', 'Quảng Ninh', 'Theo lịch phân công', '2026-12-26', 'published', '2026-06-17 22:00:32', 0, '2026-06-17 14:49:01', '2026-06-17 22:00:32'),
(73, 4, 0, 16, 3, 'Nhân viên Logistics', 5, 'Thực hiện công việc theo phân công, phối hợp với các bộ phận liên quan và báo cáo kết quả định kỳ', '0', 'high_school', 'Tin học văn phòng, sử dụng phần mềm quản lý cơ bản', 'Giao tiếp tốt, làm việc nhóm', 'Ưu tiên ứng viên có kinh nghiệm thực tế', 6, 'Lương thưởng rõ ràng, xét tăng lương định kỳ', 'Thưởng dự án khi hoàn thành mục tiêu', 'Văn phòng chuyên nghiệp, thân thiện', 'remote', 'hot', 'Tuyên Quang', 'Linh hoạt theo ca', '2026-08-06', 'published', '2026-06-17 22:00:32', 0, '2026-06-17 14:49:01', '2026-06-17 22:00:32'),
(74, 5, 0, 11, 4, 'Kế toán viên', 10, 'Tư vấn, hỗ trợ khách hàng, cập nhật thông tin và chăm sóc sau dịch vụ', '2', 'high_school', 'Thành thạo công cụ làm việc liên quan đến vị trí ứng tuyển', 'Giao tiếp tốt, làm việc nhóm', 'Có thể đi công tác khi cần', 3, 'Môi trường ổn định, đồng nghiệp hỗ trợ', 'Thưởng hiệu suất và thưởng lễ Tết', 'Văn phòng chuyên nghiệp, thân thiện', 'remote', 'hot', 'Điện Biên', 'Ca hành chính', '2026-12-09', 'published', '2026-06-17 22:00:32', 0, '2026-06-17 14:49:01', '2026-06-17 22:00:32'),
(75, 4, 0, 38, 27, 'Nhân viên y tế tại Đồng Nai', 6, 'Tham gia triển khai kế hoạch, đề xuất cải tiến quy trình và nâng cao hiệu quả công việc', '4', 'postgraduate', 'Kỹ năng chuyên môn đúng vị trí, thao tác nhanh và cẩn thận', 'Chủ động, trách nhiệm, chịu được áp lực', 'Có tinh thần trách nhiệm cao', 11, 'Môi trường ổn định, đồng nghiệp hỗ trợ', 'Thưởng hiệu suất và thưởng lễ Tết', 'Đội ngũ quản lý hỗ trợ sát sao', 'full_time', 'hot', 'Đồng Nai', 'Theo lịch phân công', '2026-11-10', 'published', '2026-06-17 22:00:32', 0, '2026-06-17 14:49:01', '2026-06-17 22:00:32'),
(76, 9, 0, 11, 31, 'Kế toán viên', 9, 'Quản lý hồ sơ, nhập liệu, tổng hợp báo cáo và theo dõi tiến độ xử lý', '3', 'postgraduate', 'Kỹ năng chuyên môn đúng vị trí, thao tác nhanh và cẩn thận', 'Tư duy dịch vụ khách hàng', 'Ưu tiên ứng viên có kinh nghiệm thực tế', 8, 'Môi trường ổn định, đồng nghiệp hỗ trợ', 'Thưởng doanh số theo kết quả công việc', 'Môi trường trẻ trung, năng động', 'part_time', 'hot', 'Vĩnh Long', 'Ca hành chính', '2026-09-24', 'published', '2026-06-17 22:00:32', 2, '2026-06-17 14:49:01', '2026-06-17 22:00:32'),
(77, 11, 0, 39, 24, 'Dược sĩ bán thuốc tại Khánh Hòa', 4, 'Tham gia triển khai kế hoạch, đề xuất cải tiến quy trình và nâng cao hiệu quả công việc', '3', 'postgraduate', 'Thành thạo công cụ làm việc liên quan đến vị trí ứng tuyển', 'Cẩn thận, trung thực, ham học hỏi', 'Ưu tiên ứng viên có kinh nghiệm thực tế', 3, 'BHXH, BHYT, BHTN theo quy định; phụ cấp theo vị trí', 'Thưởng chuyên cần và thưởng sáng kiến', 'Môi trường trẻ trung, năng động', 'contract', 'hot', 'Khánh Hòa', 'Thứ 2 - Thứ 6', '2026-09-24', 'published', '2026-06-17 22:00:32', 7, '2026-06-17 14:49:01', '2026-06-17 22:00:32'),
(78, 5, 0, 1, 21, 'Nhân viên IT Helpdesk tại Đà Nẵng', 8, 'Tư vấn, hỗ trợ khách hàng, cập nhật thông tin và chăm sóc sau dịch vụ', '0', 'none', 'Kỹ năng chuyên môn đúng vị trí, thao tác nhanh và cẩn thận', 'Cẩn thận, trung thực, ham học hỏi', 'Sẵn sàng học hỏi và tuân thủ quy trình', 11, 'Lương thưởng rõ ràng, xét tăng lương định kỳ', 'Thưởng cuối năm theo quy định công ty', 'Môi trường trẻ trung, năng động', 'part_time', 'hot', 'Đà Nẵng', 'Linh hoạt theo ca', '2026-10-12', 'published', '2026-06-17 22:00:32', 3, '2026-06-17 14:49:01', '2026-06-17 22:00:32'),
(79, 5, 0, 75, 29, 'Python Developer', 1, 'Thực hiện công việc theo phân công, phối hợp với các bộ phận liên quan và báo cáo kết quả định kỳ', '3', 'high_school', 'Thành thạo công cụ làm việc liên quan đến vị trí ứng tuyển', 'Chủ động, trách nhiệm, chịu được áp lực', 'Không yêu cầu kinh nghiệm, sẽ được đào tạo', 8, 'Được đào tạo nghiệp vụ và có cơ hội thăng tiến', 'Thưởng dự án khi hoàn thành mục tiêu', 'Không gian làm việc ổn định, sạch sẽ', 'full_time', 'hot', 'Tây Ninh', 'Linh hoạt theo ca', '2027-01-27', 'published', '2026-06-17 22:00:32', 4, '2026-06-17 14:49:01', '2026-06-17 22:00:32'),
(80, 10, 0, 73, 26, 'PHP Developer tại Lâm Đồng', 7, 'Thực hiện công việc theo phân công, phối hợp với các bộ phận liên quan và báo cáo kết quả định kỳ', '2', 'none', 'Tin học văn phòng, sử dụng phần mềm quản lý cơ bản', 'Tư duy dịch vụ khách hàng', 'Có thể đi công tác khi cần', 7, 'Hỗ trợ ăn trưa, gửi xe và các chế độ phúc lợi nội bộ', 'Thưởng doanh số theo kết quả công việc', 'Môi trường trẻ trung, năng động', 'internship', 'hot', 'Lâm Đồng', 'Thứ 2 - Thứ 6', '2026-11-28', 'published', '2026-06-17 22:00:32', 29, '2026-06-17 14:49:01', '2026-06-17 22:00:32'),
(81, 11, 0, 17, 23, 'Nhân viên vận tải tại Gia Lai', 4, 'Tư vấn, hỗ trợ khách hàng, cập nhật thông tin và chăm sóc sau dịch vụ', '1', 'postgraduate', 'Có khả năng đọc hiểu tài liệu, tổng hợp số liệu và lập báo cáo', 'Giao tiếp tốt, làm việc nhóm', 'Có thể đi công tác khi cần', 4, 'Được đào tạo nghiệp vụ và có cơ hội thăng tiến', 'Thưởng cuối năm theo quy định công ty', 'Môi trường trẻ trung, năng động', 'contract', 'hot', 'Gia Lai', 'Thứ 2 - Thứ 7', '2026-11-06', 'published', '2026-06-17 21:57:37', 2, '2026-06-17 14:49:01', '2026-06-17 21:57:37'),
(82, 5, 0, 2, 22, 'Lập trình viên PHP tại Quảng Ngãi', 6, 'Quản lý hồ sơ, nhập liệu, tổng hợp báo cáo và theo dõi tiến độ xử lý', '4', 'none', 'Kỹ năng chuyên môn đúng vị trí, thao tác nhanh và cẩn thận', 'Tư duy dịch vụ khách hàng', 'Có thể đi công tác khi cần', 3, 'Môi trường ổn định, đồng nghiệp hỗ trợ', 'Thưởng dự án khi hoàn thành mục tiêu', 'Không gian làm việc ổn định, sạch sẽ', 'remote', 'hot', 'Quảng Ngãi', 'Thứ 2 - Thứ 6', '2026-12-02', 'published', '2026-06-17 21:57:37', 2, '2026-06-17 14:49:01', '2026-06-17 21:57:37'),
(83, 5, 0, 11, 18, 'Kế toán viên', 5, 'Quản lý hồ sơ, nhập liệu, tổng hợp báo cáo và theo dõi tiến độ xử lý', '5', 'high_school', 'Tin học văn phòng, sử dụng phần mềm quản lý cơ bản', 'Tư duy dịch vụ khách hàng', 'Sẵn sàng học hỏi và tuân thủ quy trình', 4, 'Được đào tạo nghiệp vụ và có cơ hội thăng tiến', 'Thưởng chuyên cần và thưởng sáng kiến', 'Môi trường trẻ trung, năng động', 'part_time', 'hot', 'Hà Tĩnh', 'Thứ 2 - Thứ 6', '2026-08-17', 'published', '2026-06-17 21:57:37', 0, '2026-06-17 14:49:01', '2026-06-17 21:57:37'),
(84, 5, 0, 103, 24, 'Kỹ sư điện tại Khánh Hòa', 9, 'Quản lý hồ sơ, nhập liệu, tổng hợp báo cáo và theo dõi tiến độ xử lý', '3', 'none', 'Thành thạo công cụ làm việc liên quan đến vị trí ứng tuyển', 'Chủ động, trách nhiệm, chịu được áp lực', 'Có tinh thần trách nhiệm cao', 5, 'Môi trường ổn định, đồng nghiệp hỗ trợ', 'Thưởng cuối năm theo quy định công ty', 'Không gian làm việc ổn định, sạch sẽ', 'part_time', 'hot', 'Khánh Hòa', 'Ca hành chính', '2026-12-22', 'published', '2026-06-17 21:57:37', 0, '2026-06-17 14:49:01', '2026-06-17 21:57:37'),
(85, 1, 0, 6, 32, 'Chuyên viên kinh doanh', 5, 'Quản lý hồ sơ, nhập liệu, tổng hợp báo cáo và theo dõi tiến độ xử lý', '1', 'college', 'Biết sử dụng email, bảng tính và các công cụ cộng tác trực tuyến', 'Tư duy dịch vụ khách hàng', 'Không yêu cầu kinh nghiệm, sẽ được đào tạo', 7, 'Môi trường ổn định, đồng nghiệp hỗ trợ', 'Thưởng doanh số theo kết quả công việc', 'Không gian làm việc ổn định, sạch sẽ', 'part_time', 'hot', 'An Giang', 'Ca hành chính', '2026-12-20', 'published', '2026-06-17 21:57:37', 0, '2026-06-17 14:49:01', '2026-06-17 21:57:37'),
(86, 12, 0, 26, 25, 'Kỹ thuật viên cơ khí', 2, 'Thực hiện công việc theo phân công, phối hợp với các bộ phận liên quan và báo cáo kết quả định kỳ', '0', 'college', 'Thành thạo công cụ làm việc liên quan đến vị trí ứng tuyển', 'Kỹ năng xử lý tình huống', 'Ưu tiên ứng viên có kinh nghiệm thực tế', 4, 'Hỗ trợ ăn trưa, gửi xe và các chế độ phúc lợi nội bộ', 'Thưởng chuyên cần và thưởng sáng kiến', 'Môi trường trẻ trung, năng động', 'full_time', 'hot', 'Đắk Lắk', 'Ca hành chính', '2027-01-03', 'published', '2026-06-17 21:57:37', 0, '2026-06-17 14:49:01', '2026-06-17 21:57:37'),
(87, 11, 0, 31, 9, 'Quản lý chất lượng tại Lạng Sơn', 5, 'Tham gia triển khai kế hoạch, đề xuất cải tiến quy trình và nâng cao hiệu quả công việc', '2', 'college', 'Có khả năng đọc hiểu tài liệu, tổng hợp số liệu và lập báo cáo', 'Giao tiếp tốt, làm việc nhóm', 'Ưu tiên ứng viên có kinh nghiệm thực tế', 8, 'Hỗ trợ ăn trưa, gửi xe và các chế độ phúc lợi nội bộ', 'Thưởng chuyên cần và thưởng sáng kiến', 'Quy trình rõ ràng, hỗ trợ đào tạo', 'part_time', 'hot', 'Lạng Sơn', 'Thứ 2 - Thứ 6', '2026-08-25', 'published', '2026-06-17 21:57:37', 0, '2026-06-17 14:49:01', '2026-06-17 21:57:37'),
(88, 3, 0, 9, 6, 'Nhân viên hành chính văn phòng tại Sơn La', 5, 'Quản lý hồ sơ, nhập liệu, tổng hợp báo cáo và theo dõi tiến độ xử lý', '0', 'university', 'Tin học văn phòng, sử dụng phần mềm quản lý cơ bản', 'Kỹ năng xử lý tình huống', 'Ưu tiên ứng viên có kinh nghiệm thực tế', 11, 'Lương thưởng rõ ràng, xét tăng lương định kỳ', 'Thưởng chuyên cần và thưởng sáng kiến', 'Văn phòng chuyên nghiệp, thân thiện', 'internship', 'hot', 'Sơn La', 'Theo lịch phân công', '2026-10-31', 'published', '2026-06-17 21:57:37', 0, '2026-06-17 14:49:01', '2026-06-17 21:57:37'),
(89, 5, 0, 71, 2, 'Frontend Developer', 1, 'Tiếp nhận yêu cầu, xử lý nghiệp vụ hằng ngày và đảm bảo tiến độ công việc', '1', 'college', 'Có khả năng đọc hiểu tài liệu, tổng hợp số liệu và lập báo cáo', 'Kỹ năng xử lý tình huống', 'Có tinh thần trách nhiệm cao', 3, 'Hỗ trợ ăn trưa, gửi xe và các chế độ phúc lợi nội bộ', 'Thưởng cuối năm theo quy định công ty', 'Đội ngũ quản lý hỗ trợ sát sao', 'remote', 'hot', 'Cao Bằng', 'Thứ 2 - Thứ 6', '2027-01-13', 'published', '2026-06-17 21:57:37', 0, '2026-06-17 14:49:01', '2026-06-17 21:57:37'),
(90, 7, 0, 6, 15, 'Chuyên viên kinh doanh', 7, 'Quản lý hồ sơ, nhập liệu, tổng hợp báo cáo và theo dõi tiến độ xử lý', '2', 'none', 'Thành thạo công cụ làm việc liên quan đến vị trí ứng tuyển', 'Tư duy dịch vụ khách hàng', 'Có tinh thần trách nhiệm cao', 7, 'Lương thưởng rõ ràng, xét tăng lương định kỳ', 'Thưởng chuyên cần và thưởng sáng kiến', 'Đội ngũ quản lý hỗ trợ sát sao', 'remote', 'hot', 'Ninh Bình', 'Thứ 2 - Thứ 6', '2026-09-02', 'published', '2026-06-17 21:57:37', 0, '2026-06-17 14:49:01', '2026-06-17 21:57:37'),
(91, 2, 0, 15, 2, 'Nhân viên xuất nhập khẩu', 7, 'Tư vấn, hỗ trợ khách hàng, cập nhật thông tin và chăm sóc sau dịch vụ', '2', 'high_school', 'Thành thạo công cụ làm việc liên quan đến vị trí ứng tuyển', 'Kỹ năng xử lý tình huống', 'Có tinh thần trách nhiệm cao', 3, 'Hỗ trợ ăn trưa, gửi xe và các chế độ phúc lợi nội bộ', 'Thưởng dự án khi hoàn thành mục tiêu', 'Môi trường trẻ trung, năng động', 'full_time', 'hot', 'Cao Bằng', 'Ca hành chính', '2026-12-12', 'published', '2026-06-17 21:57:37', 0, '2026-06-17 14:49:01', '2026-06-17 21:57:37'),
(92, 7, 0, 44, 31, 'Biên dịch viên tiếng Anh tại Vĩnh Long', 5, 'Quản lý hồ sơ, nhập liệu, tổng hợp báo cáo và theo dõi tiến độ xử lý', '0', 'none', 'Biết sử dụng email, bảng tính và các công cụ cộng tác trực tuyến', 'Giao tiếp tốt, làm việc nhóm', 'Sẵn sàng học hỏi và tuân thủ quy trình', 5, 'Hỗ trợ ăn trưa, gửi xe và các chế độ phúc lợi nội bộ', 'Thưởng hiệu suất và thưởng lễ Tết', 'Văn phòng chuyên nghiệp, thân thiện', 'full_time', 'hot', 'Vĩnh Long', 'Theo lịch phân công', '2026-09-12', 'published', '2026-06-17 21:57:37', 0, '2026-06-17 14:49:01', '2026-06-17 21:57:37'),
(93, 6, 0, 98, 33, 'Data Analyst', 2, 'Quản lý hồ sơ, nhập liệu, tổng hợp báo cáo và theo dõi tiến độ xử lý', '4', 'high_school', 'Tin học văn phòng, sử dụng phần mềm quản lý cơ bản', 'Giao tiếp tốt, làm việc nhóm', 'Sẵn sàng học hỏi và tuân thủ quy trình', 8, 'Môi trường ổn định, đồng nghiệp hỗ trợ', 'Thưởng dự án khi hoàn thành mục tiêu', 'Không gian làm việc ổn định, sạch sẽ', 'full_time', 'hot', 'Cần Thơ', 'Theo lịch phân công', '2026-12-26', 'published', '2026-06-17 21:57:37', 0, '2026-06-17 14:49:01', '2026-06-17 21:57:37'),
(94, 7, 0, 43, 16, 'Giảng viên', 6, 'Quản lý hồ sơ, nhập liệu, tổng hợp báo cáo và theo dõi tiến độ xử lý', '4', 'postgraduate', 'Thành thạo công cụ làm việc liên quan đến vị trí ứng tuyển', 'Chủ động, trách nhiệm, chịu được áp lực', 'Ưu tiên ứng viên có kinh nghiệm thực tế', 7, 'Được đào tạo nghiệp vụ và có cơ hội thăng tiến', 'Thưởng dự án khi hoàn thành mục tiêu', 'Văn phòng chuyên nghiệp, thân thiện', 'remote', 'hot', 'Thanh Hóa', 'Theo lịch phân công', '2026-12-18', 'published', '2026-06-17 21:57:37', 0, '2026-06-17 14:49:01', '2026-06-17 21:57:37'),
(95, 4, 0, 5, 24, 'Digital Marketing Executive', 5, 'Tham gia triển khai kế hoạch, đề xuất cải tiến quy trình và nâng cao hiệu quả công việc', '1', 'postgraduate', 'Biết sử dụng email, bảng tính và các công cụ cộng tác trực tuyến', 'Tư duy dịch vụ khách hàng', 'Ưu tiên ứng viên có kinh nghiệm thực tế', 8, 'Lương thưởng rõ ràng, xét tăng lương định kỳ', 'Thưởng hiệu suất và thưởng lễ Tết', 'Quy trình rõ ràng, hỗ trợ đào tạo', 'contract', 'hot', 'Khánh Hòa', 'Linh hoạt theo ca', '2026-10-28', 'published', '2026-06-17 21:57:37', 0, '2026-06-17 14:49:01', '2026-06-17 21:57:37');
INSERT INTO `hicrm_job_posts_old` (`id`, `employer_id`, `candidate_id`, `job_category_id`, `province_id`, `title`, `quantity`, `job_description`, `experience_years`, `degree_required`, `professional_skills`, `soft_skills`, `other_requirements`, `salary_id`, `benefits_description`, `rewards_description`, `work_environment`, `work_type`, `job_post_type`, `address_detail`, `working_time`, `deadline`, `status`, `published_at`, `views_count`, `created_at`, `updated_at`) VALUES
(96, 6, 0, 22, 12, 'Kỹ sư xây dựng tại Phú Thọ', 2, 'Quản lý hồ sơ, nhập liệu, tổng hợp báo cáo và theo dõi tiến độ xử lý', '3', 'university', 'Thành thạo công cụ làm việc liên quan đến vị trí ứng tuyển', 'Kỹ năng xử lý tình huống', 'Có tinh thần trách nhiệm cao', 5, 'Môi trường ổn định, đồng nghiệp hỗ trợ', 'Thưởng cuối năm theo quy định công ty', 'Quy trình rõ ràng, hỗ trợ đào tạo', 'internship', 'hot', 'Phú Thọ', 'Ca hành chính', '2026-12-19', 'published', '2026-06-17 21:57:37', 0, '2026-06-17 14:49:01', '2026-06-17 21:57:37'),
(97, 2, 0, 78, 6, 'Content Creator', 1, 'Thực hiện công việc theo phân công, phối hợp với các bộ phận liên quan và báo cáo kết quả định kỳ', '4', 'none', 'Thành thạo công cụ làm việc liên quan đến vị trí ứng tuyển', 'Tư duy dịch vụ khách hàng', 'Sẵn sàng học hỏi và tuân thủ quy trình', 6, 'Lương thưởng rõ ràng, xét tăng lương định kỳ', 'Thưởng doanh số theo kết quả công việc', 'Văn phòng chuyên nghiệp, thân thiện', 'full_time', 'hot', 'Sơn La', 'Thứ 2 - Thứ 6', '2026-08-01', 'published', '2026-06-17 21:57:37', 0, '2026-06-17 14:49:01', '2026-06-17 21:57:37'),
(98, 8, 0, 5, 21, 'Digital Marketing Executive tại Đà Nẵng', 7, 'Quản lý hồ sơ, nhập liệu, tổng hợp báo cáo và theo dõi tiến độ xử lý', '2', 'postgraduate', 'Kỹ năng chuyên môn đúng vị trí, thao tác nhanh và cẩn thận', 'Chủ động, trách nhiệm, chịu được áp lực', 'Có tinh thần trách nhiệm cao', 6, 'BHXH, BHYT, BHTN theo quy định; phụ cấp theo vị trí', 'Thưởng hiệu suất và thưởng lễ Tết', 'Không gian làm việc ổn định, sạch sẽ', 'part_time', 'hot', 'Đà Nẵng', 'Theo lịch phân công', '2026-08-08', 'published', '2026-06-17 21:57:37', 0, '2026-06-17 14:49:01', '2026-06-17 21:57:37'),
(99, 12, 0, 77, 20, 'Nhân viên SEO tại Huế', 9, 'Tư vấn, hỗ trợ khách hàng, cập nhật thông tin và chăm sóc sau dịch vụ', '1', 'postgraduate', 'Thành thạo công cụ làm việc liên quan đến vị trí ứng tuyển', 'Cẩn thận, trung thực, ham học hỏi', 'Có thể đi công tác khi cần', 7, 'Được đào tạo nghiệp vụ và có cơ hội thăng tiến', 'Thưởng hiệu suất và thưởng lễ Tết', 'Văn phòng chuyên nghiệp, thân thiện', 'internship', 'hot', 'Huế', 'Thứ 2 - Thứ 7', '2026-12-10', 'published', '2026-06-17 21:57:37', 0, '2026-06-17 14:49:01', '2026-06-17 21:57:37'),
(100, 8, 0, 76, 16, 'UI/UX Designer', 1, 'Tham gia triển khai kế hoạch, đề xuất cải tiến quy trình và nâng cao hiệu quả công việc', '0', 'none', 'Biết sử dụng email, bảng tính và các công cụ cộng tác trực tuyến', 'Chủ động, trách nhiệm, chịu được áp lực', 'Ưu tiên ứng viên có kinh nghiệm thực tế', 6, 'Môi trường ổn định, đồng nghiệp hỗ trợ', 'Thưởng dự án khi hoàn thành mục tiêu', 'Đội ngũ quản lý hỗ trợ sát sao', 'part_time', 'hot', 'Thanh Hóa', 'Ca hành chính', '2026-11-26', 'published', '2026-06-17 21:57:37', 0, '2026-06-17 14:49:01', '2026-06-17 21:57:37'),
(101, 5, 0, 70, 19, 'Mobile Developer tại Quảng Trị', 10, 'Tham gia triển khai kế hoạch, đề xuất cải tiến quy trình và nâng cao hiệu quả công việc', '3', 'none', 'Có khả năng đọc hiểu tài liệu, tổng hợp số liệu và lập báo cáo', 'Giao tiếp tốt, làm việc nhóm', 'Có tinh thần trách nhiệm cao', 11, 'Được đào tạo nghiệp vụ và có cơ hội thăng tiến', 'Thưởng doanh số theo kết quả công việc', 'Môi trường trẻ trung, năng động', 'remote', 'hot', 'Quảng Trị', 'Ca hành chính', '2026-12-03', 'published', '2026-06-17 21:57:09', 0, '2026-06-17 14:49:01', '2026-06-17 21:57:09'),
(102, 5, 0, 51, 22, 'Lễ tân khách sạn tại Quảng Ngãi', 8, 'Tư vấn, hỗ trợ khách hàng, cập nhật thông tin và chăm sóc sau dịch vụ', '2', 'university', 'Thành thạo công cụ làm việc liên quan đến vị trí ứng tuyển', 'Chủ động, trách nhiệm, chịu được áp lực', 'Có tinh thần trách nhiệm cao', 5, 'Hỗ trợ ăn trưa, gửi xe và các chế độ phúc lợi nội bộ', 'Thưởng hiệu suất và thưởng lễ Tết', 'Quy trình rõ ràng, hỗ trợ đào tạo', 'full_time', 'hot', 'Quảng Ngãi', 'Theo lịch phân công', '2026-12-17', 'published', '2026-06-17 21:57:09', 4, '2026-06-17 14:49:01', '2026-06-17 21:57:09'),
(103, 7, 0, 17, 22, 'Nhân viên vận tải', 10, 'Quản lý hồ sơ, nhập liệu, tổng hợp báo cáo và theo dõi tiến độ xử lý', '1', 'college', 'Có khả năng đọc hiểu tài liệu, tổng hợp số liệu và lập báo cáo', 'Cẩn thận, trung thực, ham học hỏi', 'Không yêu cầu kinh nghiệm, sẽ được đào tạo', 7, 'Lương thưởng rõ ràng, xét tăng lương định kỳ', 'Thưởng chuyên cần và thưởng sáng kiến', 'Môi trường trẻ trung, năng động', 'full_time', 'hot', 'Quảng Ngãi', 'Theo lịch phân công', '2026-08-16', 'published', '2026-06-17 21:57:09', 3, '2026-06-17 14:49:01', '2026-06-17 21:57:09'),
(104, 6, 0, 1, 30, 'Nhân viên IT Helpdesk tại Đồng Tháp', 8, 'Tham gia triển khai kế hoạch, đề xuất cải tiến quy trình và nâng cao hiệu quả công việc', '4', 'college', 'Tin học văn phòng, sử dụng phần mềm quản lý cơ bản', 'Cẩn thận, trung thực, ham học hỏi', 'Sẵn sàng học hỏi và tuân thủ quy trình', 5, 'Môi trường ổn định, đồng nghiệp hỗ trợ', 'Thưởng chuyên cần và thưởng sáng kiến', 'Môi trường trẻ trung, năng động', 'full_time', 'hot', 'Đồng Tháp', 'Ca hành chính', '2026-08-29', 'published', '2026-06-17 21:57:09', 0, '2026-06-17 14:49:01', '2026-06-17 21:57:09'),
(105, 12, 0, 77, 21, 'Nhân viên SEO tại Đà Nẵng', 7, 'Tham gia triển khai kế hoạch, đề xuất cải tiến quy trình và nâng cao hiệu quả công việc', '2', 'university', 'Tin học văn phòng, sử dụng phần mềm quản lý cơ bản', 'Tư duy dịch vụ khách hàng', 'Có thể đi công tác khi cần', 5, 'Hỗ trợ ăn trưa, gửi xe và các chế độ phúc lợi nội bộ', 'Thưởng chuyên cần và thưởng sáng kiến', 'Văn phòng chuyên nghiệp, thân thiện', 'contract', 'hot', 'Đà Nẵng', 'Ca hành chính', '2026-08-02', 'published', '2026-06-17 21:57:09', 0, '2026-06-17 14:49:01', '2026-06-17 21:57:09'),
(106, 11, 0, 16, 28, 'Nhân viên Logistics', 9, 'Tham gia triển khai kế hoạch, đề xuất cải tiến quy trình và nâng cao hiệu quả công việc', '1', 'none', 'Kỹ năng chuyên môn đúng vị trí, thao tác nhanh và cẩn thận', 'Chủ động, trách nhiệm, chịu được áp lực', 'Có thể đi công tác khi cần', 5, 'Môi trường ổn định, đồng nghiệp hỗ trợ', 'Thưởng cuối năm theo quy định công ty', 'Quy trình rõ ràng, hỗ trợ đào tạo', 'remote', 'hot', 'Hồ Chí Minh', 'Thứ 2 - Thứ 7', '2026-10-24', 'published', '2026-06-17 21:57:09', 0, '2026-06-17 14:49:01', '2026-06-17 21:57:09'),
(107, 5, 0, 106, 7, 'Tư vấn tuyển sinh', 2, 'Tư vấn, hỗ trợ khách hàng, cập nhật thông tin và chăm sóc sau dịch vụ', '1', 'university', 'Thành thạo công cụ làm việc liên quan đến vị trí ứng tuyển', 'Cẩn thận, trung thực, ham học hỏi', 'Có tinh thần trách nhiệm cao', 11, 'Môi trường ổn định, đồng nghiệp hỗ trợ', 'Thưởng hiệu suất và thưởng lễ Tết', 'Môi trường trẻ trung, năng động', 'contract', 'hot', 'Lào Cai', 'Thứ 2 - Thứ 7', '2026-09-30', 'published', '2026-06-17 21:57:09', 0, '2026-06-17 14:49:01', '2026-06-17 21:57:09'),
(108, 8, 0, 70, 26, 'Mobile Developer', 2, 'Tiếp nhận yêu cầu, xử lý nghiệp vụ hằng ngày và đảm bảo tiến độ công việc', '2', 'high_school', 'Thành thạo công cụ làm việc liên quan đến vị trí ứng tuyển', 'Cẩn thận, trung thực, ham học hỏi', 'Sẵn sàng học hỏi và tuân thủ quy trình', 11, 'Hỗ trợ ăn trưa, gửi xe và các chế độ phúc lợi nội bộ', 'Thưởng cuối năm theo quy định công ty', 'Văn phòng chuyên nghiệp, thân thiện', 'internship', 'hot', 'Lâm Đồng', 'Thứ 2 - Thứ 6', '2026-09-28', 'published', '2026-06-17 21:57:09', 0, '2026-06-17 14:49:01', '2026-06-17 21:57:09'),
(109, 12, 0, 31, 30, 'Quản lý chất lượng tại Đồng Tháp', 7, 'Quản lý hồ sơ, nhập liệu, tổng hợp báo cáo và theo dõi tiến độ xử lý', '3', 'postgraduate', 'Biết sử dụng email, bảng tính và các công cụ cộng tác trực tuyến', 'Kỹ năng xử lý tình huống', 'Có thể đi công tác khi cần', 7, 'Hỗ trợ ăn trưa, gửi xe và các chế độ phúc lợi nội bộ', 'Thưởng cuối năm theo quy định công ty', 'Đội ngũ quản lý hỗ trợ sát sao', 'contract', 'hot', 'Đồng Tháp', 'Thứ 2 - Thứ 6', '2026-08-22', 'published', '2026-06-17 21:57:09', 0, '2026-06-17 14:49:01', '2026-06-17 21:57:09'),
(110, 10, 0, 53, 8, 'Đầu bếp', 10, 'Thực hiện công việc theo phân công, phối hợp với các bộ phận liên quan và báo cáo kết quả định kỳ', '0', 'university', 'Kỹ năng chuyên môn đúng vị trí, thao tác nhanh và cẩn thận', 'Giao tiếp tốt, làm việc nhóm', 'Ưu tiên ứng viên có kinh nghiệm thực tế', 11, 'Môi trường ổn định, đồng nghiệp hỗ trợ', 'Thưởng cuối năm theo quy định công ty', 'Quy trình rõ ràng, hỗ trợ đào tạo', 'internship', 'hot', 'Thái Nguyên', 'Thứ 2 - Thứ 6', '2026-08-24', 'published', '2026-06-17 21:57:09', 0, '2026-06-17 14:49:01', '2026-06-17 21:57:09'),
(111, 2, 0, 72, 25, 'Backend Developer', 3, 'Thực hiện công việc theo phân công, phối hợp với các bộ phận liên quan và báo cáo kết quả định kỳ', '0', 'high_school', 'Kỹ năng chuyên môn đúng vị trí, thao tác nhanh và cẩn thận', 'Tư duy dịch vụ khách hàng', 'Có tinh thần trách nhiệm cao', 4, 'Được đào tạo nghiệp vụ và có cơ hội thăng tiến', 'Thưởng hiệu suất và thưởng lễ Tết', 'Không gian làm việc ổn định, sạch sẽ', 'remote', 'hot', 'Đắk Lắk', 'Linh hoạt theo ca', '2026-12-16', 'published', '2026-06-17 21:57:09', 0, '2026-06-17 14:49:01', '2026-06-17 21:57:09'),
(112, 5, 0, 71, 15, 'Frontend Developer', 7, 'Thực hiện công việc theo phân công, phối hợp với các bộ phận liên quan và báo cáo kết quả định kỳ', '5', 'postgraduate', 'Thành thạo công cụ làm việc liên quan đến vị trí ứng tuyển', 'Cẩn thận, trung thực, ham học hỏi', 'Không yêu cầu kinh nghiệm, sẽ được đào tạo', 8, 'Lương thưởng rõ ràng, xét tăng lương định kỳ', 'Thưởng chuyên cần và thưởng sáng kiến', 'Môi trường trẻ trung, năng động', 'contract', 'hot', 'Ninh Bình', 'Thứ 2 - Thứ 6', '2026-10-08', 'published', '2026-06-17 21:57:09', 0, '2026-06-17 14:49:01', '2026-06-17 21:57:09'),
(113, 5, 0, 25, 28, 'Kỹ thuật viên điện điện tử', 4, 'Tham gia triển khai kế hoạch, đề xuất cải tiến quy trình và nâng cao hiệu quả công việc', '3', 'postgraduate', 'Thành thạo công cụ làm việc liên quan đến vị trí ứng tuyển', 'Chủ động, trách nhiệm, chịu được áp lực', 'Không yêu cầu kinh nghiệm, sẽ được đào tạo', 3, 'Hỗ trợ ăn trưa, gửi xe và các chế độ phúc lợi nội bộ', 'Thưởng cuối năm theo quy định công ty', 'Đội ngũ quản lý hỗ trợ sát sao', 'part_time', 'hot', 'Hồ Chí Minh', 'Thứ 2 - Thứ 7', '2026-09-23', 'published', '2026-06-17 21:57:09', 0, '2026-06-17 14:49:01', '2026-06-17 21:57:09'),
(114, 11, 0, 28, 5, 'Kỹ thuật viên ô tô tại Lai Châu', 7, 'Thực hiện công việc theo phân công, phối hợp với các bộ phận liên quan và báo cáo kết quả định kỳ', '5', 'college', 'Kỹ năng chuyên môn đúng vị trí, thao tác nhanh và cẩn thận', 'Cẩn thận, trung thực, ham học hỏi', 'Có thể đi công tác khi cần', 4, 'Hỗ trợ ăn trưa, gửi xe và các chế độ phúc lợi nội bộ', 'Thưởng dự án khi hoàn thành mục tiêu', 'Quy trình rõ ràng, hỗ trợ đào tạo', 'part_time', 'hot', 'Lai Châu', 'Ca hành chính', '2026-11-08', 'published', '2026-06-17 21:57:09', 0, '2026-06-17 14:49:01', '2026-06-17 21:57:09'),
(115, 2, 0, 11, 25, 'Kế toán viên', 1, 'Thực hiện công việc theo phân công, phối hợp với các bộ phận liên quan và báo cáo kết quả định kỳ', '3', 'high_school', 'Có khả năng đọc hiểu tài liệu, tổng hợp số liệu và lập báo cáo', 'Giao tiếp tốt, làm việc nhóm', 'Không yêu cầu kinh nghiệm, sẽ được đào tạo', 6, 'Môi trường ổn định, đồng nghiệp hỗ trợ', 'Thưởng chuyên cần và thưởng sáng kiến', 'Quy trình rõ ràng, hỗ trợ đào tạo', 'part_time', 'hot', 'Đắk Lắk', 'Ca hành chính', '2026-10-03', 'published', '2026-06-17 21:57:09', 1, '2026-06-17 14:49:01', '2026-06-17 21:57:09'),
(116, 8, 0, 77, 31, 'Nhân viên SEO tại Vĩnh Long', 6, 'Thực hiện công việc theo phân công, phối hợp với các bộ phận liên quan và báo cáo kết quả định kỳ', '5', 'university', 'Kỹ năng chuyên môn đúng vị trí, thao tác nhanh và cẩn thận', 'Tư duy dịch vụ khách hàng', 'Có thể đi công tác khi cần', 7, 'Lương thưởng rõ ràng, xét tăng lương định kỳ', 'Thưởng chuyên cần và thưởng sáng kiến', 'Quy trình rõ ràng, hỗ trợ đào tạo', 'remote', 'normal', 'Vĩnh Long', 'Thứ 2 - Thứ 7', '2026-09-19', 'published', '2026-06-17 21:57:09', 2, '2026-06-17 14:49:01', '2026-06-17 21:57:09'),
(117, 5, 0, 16, 26, 'Nhân viên Logistics tại Lâm Đồng', 4, 'Quản lý hồ sơ, nhập liệu, tổng hợp báo cáo và theo dõi tiến độ xử lý', '4', 'none', 'Kỹ năng chuyên môn đúng vị trí, thao tác nhanh và cẩn thận', 'Cẩn thận, trung thực, ham học hỏi', 'Có thể đi công tác khi cần', 8, 'Được đào tạo nghiệp vụ và có cơ hội thăng tiến', 'Thưởng hiệu suất và thưởng lễ Tết', 'Môi trường trẻ trung, năng động', 'remote', 'normal', 'Lâm Đồng', 'Linh hoạt theo ca', '2027-01-19', 'published', '2026-06-17 21:57:09', 0, '2026-06-17 14:49:01', '2026-06-17 21:57:09'),
(118, 1, 0, 22, 17, 'Kỹ sư xây dựng tại Nghệ An', 3, 'Thực hiện công việc theo phân công, phối hợp với các bộ phận liên quan và báo cáo kết quả định kỳ', '1', 'postgraduate', 'Có khả năng đọc hiểu tài liệu, tổng hợp số liệu và lập báo cáo', 'Chủ động, trách nhiệm, chịu được áp lực', 'Không yêu cầu kinh nghiệm, sẽ được đào tạo', 4, 'Môi trường ổn định, đồng nghiệp hỗ trợ', 'Thưởng doanh số theo kết quả công việc', 'Văn phòng chuyên nghiệp, thân thiện', 'internship', 'normal', 'Nghệ An', 'Thứ 2 - Thứ 7', '2026-12-22', 'published', '2026-06-17 21:57:09', 0, '2026-06-17 14:49:01', '2026-06-17 21:57:09'),
(119, 4, 0, 73, 10, 'PHP Developer tại Quảng Ninh', 2, 'Tư vấn, hỗ trợ khách hàng, cập nhật thông tin và chăm sóc sau dịch vụ', '2', 'postgraduate', 'Kỹ năng chuyên môn đúng vị trí, thao tác nhanh và cẩn thận', 'Cẩn thận, trung thực, ham học hỏi', 'Sẵn sàng học hỏi và tuân thủ quy trình', 11, 'Lương thưởng rõ ràng, xét tăng lương định kỳ', 'Thưởng cuối năm theo quy định công ty', 'Quy trình rõ ràng, hỗ trợ đào tạo', 'part_time', 'normal', 'Quảng Ninh', 'Theo lịch phân công', '2027-01-18', 'published', '2026-06-17 21:57:09', 0, '2026-06-17 14:49:01', '2026-06-17 21:57:09'),
(120, 12, 0, 71, 16, 'Frontend Developer tại Thanh Hóa', 9, 'Quản lý hồ sơ, nhập liệu, tổng hợp báo cáo và theo dõi tiến độ xử lý', '0', 'none', 'Kỹ năng chuyên môn đúng vị trí, thao tác nhanh và cẩn thận', 'Giao tiếp tốt, làm việc nhóm', 'Có tinh thần trách nhiệm cao', 3, 'Môi trường ổn định, đồng nghiệp hỗ trợ', 'Thưởng cuối năm theo quy định công ty', 'Văn phòng chuyên nghiệp, thân thiện', 'internship', 'normal', 'Thanh Hóa', 'Thứ 2 - Thứ 6', '2026-09-24', 'published', '2026-06-17 21:57:09', 0, '2026-06-17 14:49:01', '2026-06-17 21:57:09'),
(121, 11, 0, 1, 22, 'Lập trình viên', 1, 'Lập trình phần mềm, BA, TESTER', '5', 'Đại học', 'Excel, Php, Python', 'Làm việc nhóm', '', 7, 'Đóng BHXH, Thăm quan', 'Du lịch', '', 'Trực tiếp', 'hot', 'Phường Kon Tum ', 'Trong giờ hành chính', '2027-06-25', 'published', '2026-07-22 21:50:45', 3, '2026-06-25 09:19:58', '2026-07-22 21:50:45'),
(122, 7, 0, 11, 13, 'Nhân viên kinh doanh', 2, 'Mô tả công việc', '1', 'Cao đẳng', NULL, NULL, NULL, 2, 'BHXH, thưởng KPI', NULL, NULL, 'Toàn thời gian', 'normal', '123 Trần Phú', NULL, '2026-07-29', 'published', '2026-06-29 16:29:09', 6, '2026-06-29 09:29:00', '2026-06-29 16:29:09'),
(123, 11, 0, 66, 11, 'ádasd', 1, 'ádasd', '1', 'Đại học', '11', '1231', '123123', 1, '', '', '', 'Trực tiếp', 'normal', '123123123123 1231231', 'Trong giờ hành chính', '2026-07-30', 'published', '2026-07-22 21:50:45', 0, '2026-07-06 14:41:33', '2026-07-22 21:50:45'),
(124, 7, 0, 66, NULL, 'Nhân viên kinh doanh', 1, 'Kinh doanh', '5', 'Đại học', '', '', '', 1, '', '', '', '', 'normal', '', 'Trong giờ hành chính', '2026-09-27', 'published', '2026-07-22 21:50:45', 0, '2026-07-17 08:54:54', '2026-07-22 21:50:45');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hicrm_job_support_requests`
--

CREATE TABLE `hicrm_job_support_requests` (
  `id` bigint(20) NOT NULL,
  `job_id` bigint(20) NOT NULL,
  `full_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_id` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `hicrm_job_support_requests`
--

INSERT INTO `hicrm_job_support_requests` (`id`, `job_id`, `full_name`, `phone`, `email`, `session_id`, `ip_address`, `created_at`) VALUES
(2, 80, 'Vũ Xuân Cương', '0982881998', 'cuongvx.ktm@gmail.com', 's37qj3on66trr8v0td7q91ceo9', '::1', '2026-07-13 22:11:31');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hicrm_market_results`
--

CREATE TABLE `hicrm_market_results` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `result_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `result_summary` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `result_content` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `result_image` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `result_date` date DEFAULT NULL,
  `company_total` int(11) NOT NULL DEFAULT 0,
  `position_total` int(11) NOT NULL DEFAULT 0,
  `profile_total` int(11) NOT NULL DEFAULT 0,
  `interview_total` int(11) NOT NULL DEFAULT 0,
  `implementation_content` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `highlight_content` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note_content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `result_status` tinyint(4) NOT NULL DEFAULT 1,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `hicrm_market_results`
--

INSERT INTO `hicrm_market_results` (`id`, `result_title`, `result_summary`, `result_content`, `result_image`, `result_date`, `company_total`, `position_total`, `profile_total`, `interview_total`, `implementation_content`, `highlight_content`, `note_content`, `result_status`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Kết quả sàn đợt 1', 'Kết nối làm việc tuyển dụng viên chức', '', '', '2026-09-27', 5, 5, 2, 2, '', '', '', 1, 1, '2026-06-29 22:38:34', '2026-06-29 22:38:34');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hicrm_news`
--

CREATE TABLE `hicrm_news` (
  `id` bigint(20) NOT NULL,
  `author_id` bigint(20) NOT NULL,
  `new_category` int(11) DEFAULT NULL,
  `title` varchar(500) NOT NULL,
  `thumbnail_url` varchar(500) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `content` longtext NOT NULL,
  `tags` varchar(500) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `published_at` datetime DEFAULT NULL,
  `views_count` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `is_featured` tinyint(4) DEFAULT 0,
  `event_start_at` datetime DEFAULT NULL,
  `event_end_at` datetime DEFAULT NULL,
  `event_location` varchar(500) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hicrm_news_categories`
--

CREATE TABLE `hicrm_news_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(50) NOT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `sort_order` int(11) DEFAULT 0,
  `status` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `hicrm_news_categories`
--

INSERT INTO `hicrm_news_categories` (`id`, `name`, `code`, `icon`, `sort_order`, `status`) VALUES
(1, 'Tin tức hoạt động', 'tin-hoat-dong', 'fa-solid fa-newspaper', 1, 1),
(2, 'Y học thường thức', 'y-hoc-thuong-thuc', 'fa-solid fa-stethoscope', 2, 1),
(3, 'Sự kiện - Hội thảo', 'su-kien-hoi-thao', 'fa-solid fa-calendar-days', 3, 1),
(4, 'Thông báo - Hướng dẫn', 'thong-bao-huong-dan', 'fa-solid fa-bullhorn', 4, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hicrm_news_comments`
--

CREATE TABLE `hicrm_news_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `news_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `author_name` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author_email` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_reply` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment_status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hicrm_orders`
--

CREATE TABLE `hicrm_orders` (
  `id` int(11) NOT NULL,
  `order_customer_id` int(11) NOT NULL,
  `order_employee_id` int(11) NOT NULL,
  `order_payment_policy_id` int(11) NOT NULL,
  `order_warehouse_id` int(11) NOT NULL,
  `order_code` varchar(255) NOT NULL,
  `order_name_contact` varchar(255) NOT NULL,
  `order_payment_active` int(11) NOT NULL COMMENT '- Đã thanh toán.  - Chưa thanh toán',
  `order_description` text NOT NULL,
  `order_date` date NOT NULL,
  `order_active` int(11) NOT NULL COMMENT '1. Chưa thực hiện, 2. Đang thực hiện, 3. Hoàn thành, 4. Hủy bỏ ',
  `order_delivery_date` date NOT NULL COMMENT 'Ngày giao hàng',
  `order_create_date` datetime NOT NULL DEFAULT current_timestamp(),
  `order_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `hicrm_orders`
--

INSERT INTO `hicrm_orders` (`id`, `order_customer_id`, `order_employee_id`, `order_payment_policy_id`, `order_warehouse_id`, `order_code`, `order_name_contact`, `order_payment_active`, `order_description`, `order_date`, `order_active`, `order_delivery_date`, `order_create_date`, `order_status`) VALUES
(1, 1, 2, 6, 2, 'SĐH0000001', 'Vũ Xuân Cương', 2, 'Diễn giải', '2021-09-16', 3, '2021-09-17', '2021-09-16 22:43:08', 1),
(2, 4, 5, 2, 1, 'SĐH0000002', 'Vũ Xuân Cương', 2, 'Cung cấp công cụ dụng cụ cho phòng Marketing', '2021-09-17', 2, '2021-09-18', '2021-09-17 14:21:47', 1),
(3, 4, 5, 2, 1, 'SĐH0000002', 'Vũ Xuân Cương', 2, 'Cung cấp công cụ dụng cụ cho phòng Marketing', '2021-09-17', 2, '2021-09-18', '2021-09-17 14:21:58', 1),
(4, 4, 5, 2, 1, 'SĐH0000002', 'Vũ Xuân Cương', 2, 'Cung cấp công cụ dụng cụ cho phòng Marketing', '2021-09-17', 2, '2021-09-18', '2021-09-17 14:28:23', 1),
(5, 4, 5, 2, 1, 'SĐH0000002', 'Vũ Xuân Cương', 2, 'Cung cấp công cụ dụng cụ cho phòng Marketing', '2021-09-17', 2, '2021-09-18', '2021-09-17 14:28:45', 1),
(6, 1, 3, 2, 2, 'SĐH0000003', 'Vũ Xuân Cương', 2, 'Mua công cụ dụng cụ cho phòng Kế toán', '2021-09-17', 2, '2021-09-19', '2021-09-17 14:38:52', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hicrm_order_details`
--

CREATE TABLE `hicrm_order_details` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `order_product_quantity` int(11) NOT NULL,
  `order_product_price` decimal(10,0) NOT NULL,
  `order_product_vat_tax` int(11) NOT NULL,
  `order_product_discount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `hicrm_order_details`
--

INSERT INTO `hicrm_order_details` (`id`, `order_id`, `order_product_id`, `order_product_quantity`, `order_product_price`, `order_product_vat_tax`, `order_product_discount`) VALUES
(1, 6, 17, 2, '3500000', 10, 10);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hicrm_permissions`
--

CREATE TABLE `hicrm_permissions` (
  `id` int(11) NOT NULL,
  `permission_name` varchar(255) NOT NULL,
  `permission_level` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `hicrm_permissions`
--

INSERT INTO `hicrm_permissions` (`id`, `permission_name`, `permission_level`) VALUES
(1, 'Đơn hàng', 1),
(2, 'Vận đơn', 1),
(3, 'Khách hàng', 1),
(4, 'Kho hàng', 1),
(5, 'Giao dịch', 1),
(6, 'Nhân viên', 1),
(7, 'Đại lý', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hicrm_permission_datas`
--

CREATE TABLE `hicrm_permission_datas` (
  `id` int(11) NOT NULL,
  `depart` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `hicrm_permission_datas`
--

INSERT INTO `hicrm_permission_datas` (`id`, `depart`, `permission_id`) VALUES
(23, 4, 1),
(57, 1, 1),
(58, 1, 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hicrm_positions`
--

CREATE TABLE `hicrm_positions` (
  `id` int(11) NOT NULL,
  `position_title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `hicrm_positions`
--

INSERT INTO `hicrm_positions` (`id`, `position_title`) VALUES
(1, 'Bác sĩ'),
(2, 'Phó Giám đốc'),
(3, 'Trưởng phòng'),
(4, 'Phó trưởng phòng'),
(5, 'Nhân viên'),
(6, 'Chuyên viên'),
(7, 'Trợ lý Chủ tịch');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hicrm_products`
--

CREATE TABLE `hicrm_products` (
  `id` bigint(20) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_spec` varchar(255) DEFAULT NULL,
  `product_code` varchar(50) NOT NULL,
  `product_barcode` varchar(20) DEFAULT NULL,
  `product_vat_name` varchar(255) DEFAULT NULL,
  `product_unit` int(11) NOT NULL,
  `product_category` int(11) NOT NULL,
  `product_price` decimal(20,2) NOT NULL,
  `product_discount` decimal(20,2) DEFAULT NULL,
  `product_tax_id` int(11) NOT NULL DEFAULT 0,
  `product_description` text DEFAULT NULL,
  `product_image` text DEFAULT NULL,
  `product_created_time` datetime NOT NULL DEFAULT current_timestamp(),
  `product_status` int(11) NOT NULL DEFAULT 1 COMMENT '1 - Đang bán, 2 - Không bán'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `hicrm_products`
--

INSERT INTO `hicrm_products` (`id`, `product_name`, `product_spec`, `product_code`, `product_barcode`, `product_vat_name`, `product_unit`, `product_category`, `product_price`, `product_discount`, `product_tax_id`, `product_description`, `product_image`, `product_created_time`, `product_status`) VALUES
(1, 'Sản phẩm 1', NULL, 'SP0001', NULL, '', 2, 1, '650000.00', '2.00', 1, 'hức ăn cho chó mọi độ tuổi, không độn ngũ cốc, không phẩm màu và chất bảo quản nhân tạo.\r\n\r\nTHÀNH PHẦN: Bột thịt gà, Khoai tây, Mỡ gà (được bảo quản với Tocopherols hỗn hợp), Bột thịt cá trắng, Trứng, Cà chua, Đậu Hà Lan, Sợi việt quất, Sợi nam việt quất, Táo, Việt quất, Cà rốt, Rau bina, Nam Việt quất, DL-Methionine, L-Lysine, Taurine, Beta-Carotene, L-Carnitine, Yucca, Cây hương thảo, Vitamin, Khoáng chất , Probiotics.\r\n\r\nBỔ SUNG (TRÊN MỖI KG): Vitamin A 12.000 IU/kg, Vitamin D3 750 IU/kg, Vitamin C 100 mg/kg, Vitamin E (α-tocopherol) 250 IU/kg, Đồng (đồng sunfat) 16 mg/kg, Omega-6 >3,3%, Omega-3 >0,4%, Methionine 1,2%, Lysine 2,1%, Taurine 0,05%, L-Carnitine 50 mg/kg, Beta-Carotene 10 mg/kg, Axit Docosahexaenoic (DHA) >0,05%.\r\n\r\nTHÀNH PHẦN PHÂN TÍCH: Đạm 38%, Chất béo 20%, Tro 10,2%, Chất xơ 2,5%, Độ ẩm 10%, Natri 0,3%, Canxi 1,5%, Phốt pho 1,0%. Kilocalories/kg: 3.800', 'abc.png', '2021-10-30 16:19:28', 99),
(2, 'Kháng sinh', NULL, '01', '', '', 1, 2, '1000000.00', '0.00', 0, '<p>ấc</p>', 'ecd99574ee4d8c7ffa4412b6aeb4b771-2908_02_b73c39a223.jpg', '2026-01-14 23:02:57', 1),
(3, 'Tiêu chảy â aa', NULL, '002', '', '', 1, 3, '555555.00', '3.00', 0, 'Thuốc điều trị tiêu chảy cấp\r\n\r\n', 'd8535c8a19519afd8bb5b91220665a62-2908_02_b73c39a223.jpg', '2026-01-14 23:07:04', 1),
(4, 'Amocinin', NULL, '003', '', '', 1, 3, '90000.00', '5.00', 0, '<p>Thuốc amocinin trị đau họng</p>', '14b0c8d644d55be8208a4ed9793a544f-thuoc-tri-viem-hong-hat-1.jpeg', '2026-01-18 22:20:03', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hicrm_products_bk`
--

CREATE TABLE `hicrm_products_bk` (
  `id` int(11) NOT NULL,
  `product_cat_id` int(11) NOT NULL,
  `product_unit_id` int(11) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `product_price` decimal(10,0) NOT NULL,
  `product_into_money` decimal(10,0) NOT NULL,
  `product_total_money` decimal(10,0) NOT NULL,
  `product_vat_tax` int(11) NOT NULL,
  `product_status` int(11) NOT NULL,
  `product_create_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hicrm_product_warehouses`
--

CREATE TABLE `hicrm_product_warehouses` (
  `id` bigint(20) NOT NULL,
  `pid` bigint(20) NOT NULL,
  `wareid` int(11) NOT NULL,
  `ware_instock` int(11) NOT NULL DEFAULT 0,
  `ware_alert` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `hicrm_product_warehouses`
--

INSERT INTO `hicrm_product_warehouses` (`id`, `pid`, `wareid`, `ware_instock`, `ware_alert`) VALUES
(1, 1, 1, 20, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hicrm_promotions`
--

CREATE TABLE `hicrm_promotions` (
  `id` bigint(20) NOT NULL,
  `promo_type` int(11) NOT NULL DEFAULT 1,
  `promo_name` varchar(255) NOT NULL,
  `promo_code` varchar(30) NOT NULL,
  `promo_discount_type` int(11) NOT NULL DEFAULT 1 COMMENT '1 - theo tiền | 2 - Theo phần trăm',
  `promo_discount_value` decimal(20,2) NOT NULL,
  `promo_qty` int(11) NOT NULL DEFAULT 1 COMMENT 'Số lượng',
  `promo_used` int(11) NOT NULL DEFAULT 0,
  `promo_reuse` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 Không dùng lại | 1 được dùng lại',
  `promo_created_by` int(11) NOT NULL,
  `promo_from` datetime NOT NULL,
  `promo_to` datetime DEFAULT NULL,
  `promo_expried` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 có hết hạn, 2 không bao giờ hết hạn',
  `promo_created_time` datetime NOT NULL DEFAULT current_timestamp(),
  `promo_status` int(11) NOT NULL DEFAULT 1,
  `promo_for` int(11) NOT NULL DEFAULT 1 COMMENT '1 tất cả đơn hàng, 2 đơn hàng theo giá trị, 3 khách hàng, 4 sản phẩm',
  `promo_all_order` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 - tất cả | 2 - một số',
  `promo_order_min` decimal(20,2) NOT NULL DEFAULT 0.00,
  `promo_order_max` decimal(20,2) NOT NULL DEFAULT 0.00,
  `promo_customers` text DEFAULT NULL,
  `promo_products` text DEFAULT NULL,
  `promo_max_apply` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `hicrm_promotions`
--

INSERT INTO `hicrm_promotions` (`id`, `promo_type`, `promo_name`, `promo_code`, `promo_discount_type`, `promo_discount_value`, `promo_qty`, `promo_used`, `promo_reuse`, `promo_created_by`, `promo_from`, `promo_to`, `promo_expried`, `promo_created_time`, `promo_status`, `promo_for`, `promo_all_order`, `promo_order_min`, `promo_order_max`, `promo_customers`, `promo_products`, `promo_max_apply`) VALUES
(1, 1, 'Tri ân năm mới', '', 2, '10.00', 0, 0, 1, 1, '2021-10-30 14:47:48', '2022-01-01 14:47:48', 1, '2021-10-30 14:49:11', 1, 1, 1, '0.00', '0.00', NULL, NULL, 1),
(2, 2, 'Khách hàng mới', 'NEWCUSTOMER', 1, '100000.00', 20, 3, 0, 1, '2021-10-30 15:03:53', NULL, 2, '2021-10-30 15:05:44', 1, 2, 0, '1000000.00', '0.00', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hicrm_provinces`
--

CREATE TABLE `hicrm_provinces` (
  `id` int(11) NOT NULL,
  `province_code` varchar(5) NOT NULL,
  `province_name` varchar(100) NOT NULL,
  `province_keyword` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `hicrm_provinces`
--

INSERT INTO `hicrm_provinces` (`id`, `province_code`, `province_name`, `province_keyword`, `created_at`) VALUES
(1, '01', 'Hà Nội', 'ha_noi', '2026-05-26 04:45:33'),
(2, '04', 'Cao Bằng', 'cao_bang', '2026-05-26 04:45:33'),
(3, '08', 'Tuyên Quang', 'tuyen_quang', '2026-05-26 04:45:33'),
(4, '11', 'Điện Biên', 'dien_bien', '2026-05-26 04:45:33'),
(5, '12', 'Lai Châu', 'lai_chau', '2026-05-26 04:45:33'),
(6, '14', 'Sơn La', 'son_la', '2026-05-26 04:45:33'),
(7, '15', 'Lào Cai', 'lao_cai', '2026-05-26 04:45:33'),
(8, '19', 'Thái Nguyên', 'thai_nguyen', '2026-05-26 04:45:33'),
(9, '20', 'Lạng Sơn', 'lang_son', '2026-05-26 04:45:33'),
(10, '22', 'Quảng Ninh', 'quang_ninh', '2026-05-26 04:45:33'),
(11, '24', 'Bắc Ninh', 'bac_ninh', '2026-05-26 04:45:33'),
(12, '25', 'Phú Thọ', 'phu_tho', '2026-05-26 04:45:33'),
(13, '31', 'Hải Phòng', 'hai_phong', '2026-05-26 04:45:33'),
(14, '33', 'Hưng Yên', 'hung_yen', '2026-05-26 04:45:33'),
(15, '37', 'Ninh Bình', 'ninh_binh', '2026-05-26 04:45:33'),
(16, '38', 'Thanh Hóa', 'thanh_hoa', '2026-05-26 04:45:33'),
(17, '40', 'Nghệ An', 'nghe_an', '2026-05-26 04:45:33'),
(18, '42', 'Hà Tĩnh', 'ha_tinh', '2026-05-26 04:45:33'),
(19, '44', 'Quảng Trị', 'quang_tri', '2026-05-26 04:45:33'),
(20, '46', 'Huế', 'hue', '2026-05-26 04:45:33'),
(21, '48', 'Đà Nẵng', 'da_nang', '2026-05-26 04:45:33'),
(22, '51', 'Quảng Ngãi', 'quang_ngai', '2026-05-26 04:45:33'),
(23, '52', 'Gia Lai', 'gia_lai', '2026-05-26 04:45:33'),
(24, '56', 'Khánh Hòa', 'khanh_hoa', '2026-05-26 04:45:33'),
(25, '66', 'Đắk Lắk', 'dak_lak', '2026-05-26 04:45:33'),
(26, '68', 'Lâm Đồng', 'lam_dong', '2026-05-26 04:45:33'),
(27, '75', 'Đồng Nai', 'dong_nai', '2026-05-26 04:45:33'),
(28, '79', 'Hồ Chí Minh', 'ho_chi_minh', '2026-05-26 04:45:33'),
(29, '80', 'Tây Ninh', 'tay_ninh', '2026-05-26 04:45:33'),
(30, '82', 'Đồng Tháp', 'dong_thap', '2026-05-26 04:45:33'),
(31, '86', 'Vĩnh Long', 'vinh_long', '2026-05-26 04:45:33'),
(32, '91', 'An Giang', 'an_giang', '2026-05-26 04:45:33'),
(33, '92', 'Cần Thơ', 'can_tho', '2026-05-26 04:45:33'),
(34, '96', 'Cà Mau', 'ca_mau', '2026-05-26 04:45:33');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hicrm_salary`
--

CREATE TABLE `hicrm_salary` (
  `id` int(10) UNSIGNED NOT NULL,
  `salary_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Tên mức lương',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Danh mục mức lương';

--
-- Đang đổ dữ liệu cho bảng `hicrm_salary`
--

INSERT INTO `hicrm_salary` (`id`, `salary_name`, `created_at`) VALUES
(1, 'Dưới 1 triệu', '2026-05-26 15:35:04'),
(2, 'Từ 1 - 3 triệu', '2026-05-26 15:35:04'),
(3, 'Từ 3 - 5 triệu', '2026-05-26 15:35:04'),
(4, 'Từ 5 - 7 triệu', '2026-05-26 15:35:04'),
(5, 'Từ 7 - 10 triệu', '2026-05-26 15:35:04'),
(6, 'Từ 10 - 15 triệu', '2026-05-26 15:35:04'),
(7, 'Từ 15 - 20 triệu', '2026-05-26 15:35:04'),
(8, 'Từ 20 - 30 triệu', '2026-05-26 15:35:04'),
(9, 'Từ 30 - 50 triệu', '2026-05-26 15:35:04'),
(10, 'Trên 50 triệu', '2026-05-26 15:35:04'),
(11, 'Thỏa thuận', '2026-05-26 15:35:04');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hicrm_service`
--

CREATE TABLE `hicrm_service` (
  `id` int(11) NOT NULL,
  `service_name` varchar(255) NOT NULL,
  `service_description` longtext DEFAULT NULL,
  `service_image` varchar(255) DEFAULT NULL,
  `service_category` int(11) NOT NULL,
  `service_created_date` datetime NOT NULL,
  `service_status` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `hicrm_service`
--

INSERT INTO `hicrm_service` (`id`, `service_name`, `service_description`, `service_image`, `service_category`, `service_created_date`, `service_status`) VALUES
(1, 'Gói khám sức khỏe', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', NULL, 7, '2026-01-27 13:33:22', 99),
(2, 'aaaa', 'undefined', 'd25e5a510b4127a0bcb0af41dc049935-Screenshot_10.png', 6, '2026-01-27 20:09:40', 99),
(3, 'CHUYÊN KHOA SIÊU ÂM', 'undefined', '0aba10ab9a03e4df4b9b92369adc5416-tixung.png', 6, '2026-01-27 20:10:45', 99),
(4, 'CHUYÊN KHOA SIÊU ÂM', '<p>aasdasdasd</p>', 'ad4a40eaae9fd0a23b496bfcc9659fc2-PL7.Bocosdngvttyttiuhao.pdf', 6, '2026-01-27 20:18:21', 99),
(5, 'aasdasdasdas', '<p>ấdasdasdasd</p>', '10c35a605065990f54139d0a5c186e39-SDTCR1.png', 7, '2026-01-27 20:20:37', 99),
(6, 'ádasdasd', '<p>âdasdasd</p>', '0b90857b3e07bce8eb2f76531306cf69-SDTCR1.png', 7, '2026-01-27 20:21:49', 99),
(7, 'GÓI KHÁM PHỤ SẢN 1', '<div style=\"color: rgb(0, 0, 0); font-family: Consolas, \" courier=\"\" new\",=\"\" monospace;=\"\" font-size:=\"\" 18px;=\"\" line-height:=\"\" 24px;=\"\" white-space:=\"\" pre;\"=\"\" bis_skin_checked=\"1\"><span style=\"font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" text-align:=\"\" justify;=\"\" white-space:=\"\" normal;\"=\"\">t is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by&nbsp;</span></div>', 'e5881e2f63e45fdb3b73b56eb648daee-Screenshot_5.png', 7, '2026-01-27 20:23:21', 99),
(8, 'aaaa', '<p>sdasdasdasd</p>', '2ae43ec5307c5622dd1ca9e54b95ec68-SDTCR1.png', 6, '2026-01-28 20:03:04', 99),
(9, 'Đối tượng áp dụng', '<p></p><p></p><ul></ul><p></p><li data-start=\"202\" data-end=\"256\"><p data-start=\"204\" data-end=\"256\">Người dân có nhu cầu khám nhanh, chủ động thời gian.</p>\r\n</li><li data-start=\"257\" data-end=\"288\">\r\n<p data-start=\"259\" data-end=\"288\">Người không sử dụng thẻ BHYT.</p>\r\n</li><li data-start=\"289\" data-end=\"341\">\r\n<p data-start=\"291\" data-end=\"341\">Người muốn lựa chọn bác sĩ, gói khám theo yêu cầu.</p>\r\n</li><p>\r\n\r\n\r\n</p><li data-start=\"342\" data-end=\"410\">\r\n<p data-start=\"344\" data-end=\"410\">Khám theo nhu cầu cá nhân, theo dõi bệnh mạn tính.</p></li><ul><li data-start=\"342\" data-end=\"410\"></li></ul>', 'ff5a9104650bfcb672fd00964be5e49c-doi_tuong_tham_gia_BHXH_bat_buoc_3001134430.jpg', 6, '2026-03-03 09:24:43', 1),
(10, 'Thủ tục cần mang theo', '<li data-start=\"440\" data-end=\"474\"><p data-start=\"442\" data-end=\"474\">CCCD/CMND hoặc VNeID mức 2.</p>\r\n</li><li data-start=\"475\" data-end=\"503\">\r\n<p data-start=\"477\" data-end=\"503\">Hồ sơ bệnh án cũ (nếu có).</p>\r\n</li><p>\r\n\r\n</p><li data-start=\"504\" data-end=\"538\">\r\n<p data-start=\"506\" data-end=\"538\">Đơn thuốc đang sử dụng (nếu có).</p></li>', 'cbd490dc6f23bb17489879dae4fb9a53-icon.png', 6, '2026-03-03 15:57:09', 1),
(11, 'Bảng giá dịch vụ', '<iframe src=\"https://phongkhamcdkontum.com.vn/uploads/files/73fefa1a1f095e7bd5916841d496c5ca-Phlc-GiKBCBbanhnhkmtheoQ.pdf\" style=\"width:100%; height:800px;\">\r\n</iframe>', '3ae54baf43c72de44eef705c57fbf367-gi.png', 6, '2026-03-03 15:58:46', 1),
(12, 'Quy trình khám chữa bệnh dịch vụ', '<h2 data-start=\"610\" data-end=\"630\">&nbsp;Quy trình khám</h2>\r\n<ol data-start=\"631\" data-end=\"888\">\r\n<li data-start=\"631\" data-end=\"671\">\r\n<p data-start=\"634\" data-end=\"671\">Đăng ký thông tin tại quầy tiếp nhận.</p>\r\n</li>\r\n<li data-start=\"672\" data-end=\"711\">\r\n<p data-start=\"675\" data-end=\"711\">Nộp phí khám theo bảng giá niêm yết.</p>\r\n</li>\r\n<li data-start=\"712\" data-end=\"740\">\r\n<p data-start=\"715\" data-end=\"740\">Khám lâm sàng với bác sĩ.</p>\r\n</li>\r\n<li data-start=\"741\" data-end=\"815\">\r\n<p data-start=\"744\" data-end=\"815\">Thực hiện cận lâm sàng (xét nghiệm, siêu âm, X-quang…) nếu có chỉ định.</p>\r\n</li>\r\n<li data-start=\"816\" data-end=\"850\">\r\n<p data-start=\"819\" data-end=\"850\">Nhận kết quả – tư vấn điều trị.</p>\r\n</li>\r\n<li data-start=\"851\" data-end=\"888\">\r\n<p data-start=\"854\" data-end=\"888\">Thanh toán.</p>\r\n</li>\r\n</ol>\r\n<p data-start=\"890\" data-end=\"952\">⏱ Thời gian linh hoạt, ưu tiên nhanh chóng, không chờ đợi lâu.</p>', '3bff18b079bc97df2cb3d5327e41e515-tixung.jpg', 6, '2026-03-03 16:10:32', 1),
(13, 'Đối tượng áp dụng', '<li data-start=\"1324\" data-end=\"1364\"><p data-start=\"1326\" data-end=\"1364\">Người có thẻ BHYT còn giá trị sử dụng.</p></li><p>\r\n\r\n</p><li data-start=\"1447\" data-end=\"1497\">\r\n<p data-start=\"1449\" data-end=\"1497\">Trường hợp cấp cứu được tiếp nhận theo quy định.</p></li>', 'ad3f261e2ee1f639c28ed682f254e004-tixung1.jpg', 7, '2026-03-03 16:13:13', 1),
(14, 'Thủ tục cần mang theo', '<li data-start=\"1527\" data-end=\"1550\"><p data-start=\"1529\" data-end=\"1550\">Một trong các loại hồ sơ: Thẻ BHYT còn giá trị; Căn cước công dân; Tài khoản VNeID mức 2.</p></li><p>\r\n\r\n\r\n</p><li data-start=\"1638\" data-end=\"1667\">\r\n<p data-start=\"1640\" data-end=\"1667\">Giấy hẹn tái khám (nếu có).</p></li>', '647ef8753faec8a472d582b041cc016e-icon.png', 7, '2026-03-03 16:15:16', 1),
(15, 'Quy trình khám chữa bệnh BHYT', '<li data-start=\"1695\" data-end=\"1730\"><p data-start=\"1698\" data-end=\"1730\">Lấy số và đăng ký tại quầy BHYT.</p>\r\n</li><li data-start=\"1731\" data-end=\"1775\">\r\n<p data-start=\"1734\" data-end=\"1775\">Xuất trình thẻ BHYT hoặc CCCD hoặc tài khoản VNeID mức 2.</p>\r\n</li><li data-start=\"1776\" data-end=\"1810\">\r\n<p data-start=\"1779\" data-end=\"1810\">Khám lâm sàng theo chuyên khoa.</p>\r\n</li><li data-start=\"1811\" data-end=\"1859\">\r\n<p data-start=\"1814\" data-end=\"1859\">Thực hiện xét nghiệm, siêu âm… theo chỉ định.</p>\r\n</li><li data-start=\"1860\" data-end=\"1896\">\r\n<p data-start=\"1863\" data-end=\"1896\">Nhận thuốc BHYT và hướng dẫn điều trị.</p>\r\n</li><p>\r\n\r\n\r\n\r\n\r\n</p><li data-start=\"1897\" data-end=\"1946\">\r\n<p data-start=\"1900\" data-end=\"1946\">Thanh toán phần chi phí đồng chi trả (nếu có).</p></li>', '9e1dda75dd8151085e1f3af9dc861b9c-tixung.jpg', 7, '2026-03-03 16:21:15', 1),
(16, 'Bảng giá dịch vụ KCB BHYT', '<iframe src=\"https://phongkhamcdkontum.com.vn/uploads/files/gia-bh.pdf\" style=\"width:100%; height:800px;\">\r\n\r\n</iframe>', '6712875a8114665133b09aad7d768415-gi.png', 7, '2026-03-03 16:30:20', 1),
(17, 'Quy định mức hưởng BHYT', '<h1 data-start=\"127\" data-end=\"173\">MỨC HƯỞNG BẢO HIỂM Y TẾ VÀ ĐỐI TƯỢNG ÁP DỤNG</h1><h2 data-start=\"175\" data-end=\"240\">I. Hưởng 100% chi phí khám, chữa bệnh trong phạm vi được hưởng</h2><h3 data-start=\"242\" data-end=\"258\">1. Đối tượng</h3><ul data-start=\"259\" data-end=\"660\">\r\n<li data-start=\"259\" data-end=\"289\">\r\n<p data-start=\"261\" data-end=\"289\">Người có công với cách mạng.</p>\r\n</li>\r\n<li data-start=\"290\" data-end=\"307\">\r\n<p data-start=\"292\" data-end=\"307\">Cựu chiến binh.</p>\r\n</li>\r\n<li data-start=\"308\" data-end=\"329\">\r\n<p data-start=\"310\" data-end=\"329\">Trẻ em dưới 6 tuổi.</p>\r\n</li>\r\n<li data-start=\"330\" data-end=\"353\">\r\n<p data-start=\"332\" data-end=\"353\">Người thuộc hộ nghèo.</p>\r\n</li>\r\n<li data-start=\"354\" data-end=\"455\">\r\n<p data-start=\"356\" data-end=\"455\">Người dân tộc thiểu số sinh sống tại vùng có điều kiện kinh tế – xã hội khó khăn/đặc biệt khó khăn.</p>\r\n</li>\r\n<li data-start=\"456\" data-end=\"496\">\r\n<p data-start=\"458\" data-end=\"496\">Người sinh sống tại xã đảo, huyện đảo.</p>\r\n</li>\r\n<li data-start=\"497\" data-end=\"545\">\r\n<p data-start=\"499\" data-end=\"545\">Người hưởng trợ cấp bảo trợ xã hội hằng tháng.</p>\r\n</li>\r\n<li data-start=\"546\" data-end=\"566\">\r\n<p data-start=\"548\" data-end=\"566\">Thân nhân liệt sĩ.</p>\r\n</li>\r\n<li data-start=\"567\" data-end=\"597\">\r\n<p data-start=\"569\" data-end=\"597\">Khám chữa bệnh tại tuyến xã.</p>\r\n</li>\r\n<li data-start=\"598\" data-end=\"660\">\r\n<p data-start=\"600\" data-end=\"660\">Chi phí cho một lần khám thấp hơn mức do Chính phủ quy định.</p>\r\n</li>\r\n</ul><h3 data-start=\"662\" data-end=\"678\">2. Quyền lợi</h3><ul data-start=\"679\" data-end=\"831\">\r\n<li data-start=\"679\" data-end=\"756\">\r\n<p data-start=\"681\" data-end=\"756\">Được quỹ BHYT thanh toán 100% chi phí trong phạm vi quyền lợi và mức hưởng.</p>\r\n</li>\r\n<li data-start=\"757\" data-end=\"831\">\r\n<p data-start=\"759\" data-end=\"831\">Không phải đồng chi trả (trừ trường hợp sử dụng dịch vụ ngoài danh mục).</p>\r\n</li>\r\n</ul><hr data-start=\"833\" data-end=\"836\"><h2 data-start=\"838\" data-end=\"878\">II. Hưởng 95% chi phí khám, chữa bệnh</h2><h3 data-start=\"880\" data-end=\"896\">1. Đối tượng</h3><ul data-start=\"897\" data-end=\"1051\">\r\n<li data-start=\"897\" data-end=\"958\">\r\n<p data-start=\"899\" data-end=\"958\">Người hưởng lương hưu, trợ cấp mất sức lao động hằng tháng.</p>\r\n</li>\r\n<li data-start=\"959\" data-end=\"1023\">\r\n<p data-start=\"961\" data-end=\"1023\">Thân nhân người có công với cách mạng (trừ thân nhân liệt sĩ).</p>\r\n</li>\r\n<li data-start=\"1024\" data-end=\"1051\">\r\n<p data-start=\"1026\" data-end=\"1051\">Người thuộc hộ cận nghèo.</p>\r\n</li>\r\n</ul><h3 data-start=\"1053\" data-end=\"1069\">2. Quyền lợi</h3><ul data-start=\"1070\" data-end=\"1159\">\r\n<li data-start=\"1070\" data-end=\"1129\">\r\n<p data-start=\"1072\" data-end=\"1129\">Quỹ BHYT thanh toán 95% chi phí trong phạm vi được hưởng.</p>\r\n</li>\r\n<li data-start=\"1130\" data-end=\"1159\">\r\n<p data-start=\"1132\" data-end=\"1159\">Người bệnh đồng chi trả 5%.</p>\r\n</li>\r\n</ul><hr data-start=\"1161\" data-end=\"1164\"><h2 data-start=\"1166\" data-end=\"1207\">III. Hưởng 80% chi phí khám, chữa bệnh</h2><h3 data-start=\"1209\" data-end=\"1225\">1. Đối tượng</h3><ul data-start=\"1226\" data-end=\"1370\">\r\n<li data-start=\"1226\" data-end=\"1266\">\r\n<p data-start=\"1228\" data-end=\"1266\">Người lao động tham gia BHYT bắt buộc.</p>\r\n</li>\r\n<li data-start=\"1267\" data-end=\"1289\">\r\n<p data-start=\"1269\" data-end=\"1289\">Học sinh, sinh viên.</p>\r\n</li>\r\n<li data-start=\"1290\" data-end=\"1329\">\r\n<p data-start=\"1292\" data-end=\"1329\">Người tham gia BHYT theo hộ gia đình.</p>\r\n</li>\r\n<li data-start=\"1330\" data-end=\"1370\">\r\n<p data-start=\"1332\" data-end=\"1370\">Các nhóm đối tượng khác theo quy định.</p>\r\n</li>\r\n</ul><h3 data-start=\"1372\" data-end=\"1388\">2. Quyền lợi</h3><p>\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n</p><ul data-start=\"1389\" data-end=\"1479\">\r\n<li data-start=\"1389\" data-end=\"1448\">\r\n<p data-start=\"1391\" data-end=\"1448\">Quỹ BHYT thanh toán 80% chi phí trong phạm vi được hưởng.</p>\r\n</li>\r\n<li data-start=\"1449\" data-end=\"1479\">\r\n<p data-start=\"1451\" data-end=\"1479\">Người bệnh đồng chi trả 20%.</p></li></ul>', 'f52a12cc15004762ae303d644cc9978b-Mchng.jpg', 7, '2026-03-03 16:33:50', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hicrm_staff`
--

CREATE TABLE `hicrm_staff` (
  `id` int(11) NOT NULL,
  `staff_department` int(11) NOT NULL,
  `staff_fullname` varchar(255) NOT NULL,
  `staff_position` varchar(255) DEFAULT NULL,
  `staff_status` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `hicrm_staff`
--

INSERT INTO `hicrm_staff` (`id`, `staff_department`, `staff_fullname`, `staff_position`, `staff_status`) VALUES
(1, 1, 'Nguyễn Thị A', NULL, 1),
(2, 1, 'Nguyễn Thị B', NULL, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hicrm_static_pages`
--

CREATE TABLE `hicrm_static_pages` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL DEFAULT 0,
  `page_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `page_slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hashtag` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `page_summary` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `page_content` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `static_files` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `page_status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `hicrm_static_pages`
--

INSERT INTO `hicrm_static_pages` (`id`, `category_id`, `page_title`, `page_slug`, `hashtag`, `link_url`, `page_summary`, `page_content`, `static_files`, `banner_image`, `meta_title`, `meta_keywords`, `meta_description`, `sort_order`, `page_status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Giới thiệu Bệnh viện đa khoa khu vực Đắk Hà', 'gioi-thieu', '#gioi-thieu', '/trang/gioi-thieu', 'Thông tin tổng quan, lịch sử hình thành, sứ mệnh và tầm nhìn của Bệnh viện đa khoa khu vực Đắk Hà.', '<h2>Về Bệnh viện đa khoa khu vực Đắk Hà</h2>\n<p>Bệnh viện đa khoa khu vực Đắk Hà là cơ sở y tế công lập hạng II chịu trách nhiệm chăm sóc sức khỏe toàn diện cho nhân dân huyện Đắk Hà và các vùng lân cận thuộc tỉnh Kon Tum.</p>\n<h3>Sứ mệnh & Tầm nhìn</h3>\n<ul>\n<li><strong>Sứ mệnh:</strong> Mang lại dịch vụ y tế chất lượng cao, an toàn, hiệu quả và nhân văn cho mọi bệnh nhân.</li>\n<li><strong>Tầm nhìn:</strong> Xây dựng Bệnh viện trở thành trung tâm y tế hàng đầu khu vực Tây Nguyên, áp dụng công nghệ hiện đại.</li>\n</ul>\n<p><img src=\"http://localhost/bvdkdakha.vn/template/frontend/assets/images/banner-01.jpg\" alt=\"Bệnh viện đa khoa khu vực Đắk Hà\" style=\"max-width:100%; border-radius:12px;\" /></p>', NULL, 'assets/images/banner-01.jpg', NULL, NULL, NULL, 0, 1, '2026-08-08 16:17:03', '2026-08-08 16:17:03'),
(2, 2, 'Cơ cấu tổ chức & Sơ đồ bộ máy', 'co-cau-to-chuc', '#co-cau-to-chuc', '/trang/co-cau-to-chuc', 'Sơ đồ bộ máy ban giám đốc, các phòng chức năng và khoa lâm sàng thuộc bệnh viện.', '', NULL, 'assets/images/banner-02.jpg', '', '', '', 0, 1, '2026-08-08 16:17:03', '2026-08-09 22:26:59'),
(3, 4, 'Khám BHYT', 'kham-bhyt', '#kham-bhyt', 'kham-bhyt.html', 'abc', '', '[{\"id\":\"att_1786811773_413_0\",\"file_path\":\"uploads\\/attachments\\/file_1786811773_0_388.pdf\",\"file_name\":\"KQ_XET_NGHIEM_1786692850710.pdf\",\"file_size\":424255,\"file_ext\":\"pdf\",\"created_at\":\"2026-08-15 23:36:13\"}]', '', '', '', '', 0, 1, '2026-08-15 23:15:29', '2026-08-15 23:36:13');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hicrm_static_page_categories`
--

CREATE TABLE `hicrm_static_page_categories` (
  `id` int(11) NOT NULL,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `hicrm_static_page_categories`
--

INSERT INTO `hicrm_static_page_categories` (`id`, `category_name`, `category_slug`, `category_description`, `category_status`, `created_at`) VALUES
(1, 'Giới thiệu', 'gioi-thieu', 'Các trang giới thiệu tổng quan về Bệnh viện đa khoa khu vực Đắk Hà', 1, '2026-08-08 16:17:03'),
(2, 'Tổ chức & Bộ máy', 'to-chuc-bo-may', 'Thông tin cơ cấu tổ chức, sơ đồ phòng ban và ban giám đốc', 1, '2026-08-08 16:17:03'),
(3, 'Hướng dẫn & Quy trình', 'huong-dan-quy-trinh', 'Các bài hướng dẫn khám chữa bệnh, bảo hiểm y tế và dịch vụ', 1, '2026-08-08 16:17:03'),
(4, 'Khám BHYT', 'kham-bhyt', '', 1, '2026-08-15 23:10:02');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hicrm_status`
--

CREATE TABLE `hicrm_status` (
  `id` int(11) NOT NULL,
  `status_label` varchar(255) NOT NULL,
  `status_class` varchar(255) DEFAULT NULL,
  `status_icon` varchar(255) DEFAULT NULL,
  `status_type` int(11) NOT NULL COMMENT '1 Chung, 2 báo giá, 3 đơn hàng'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `hicrm_status`
--

INSERT INTO `hicrm_status` (`id`, `status_label`, `status_class`, `status_icon`, `status_type`) VALUES
(1, 'Mới khởi tạo', 'success', NULL, 0),
(2, 'Chờ phê duyệt', 'danger', NULL, 0),
(3, 'Phê duyệt', 'info', NULL, 0),
(4, 'Công khai', NULL, NULL, 0),
(98, 'Từ chối', NULL, NULL, 0),
(99, 'Xóa', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hicrm_student_profile`
--

CREATE TABLE `hicrm_student_profile` (
  `id` int(11) NOT NULL,
  `student_code` varchar(255) NOT NULL,
  `student_name` varchar(255) NOT NULL,
  `student_phone` varchar(255) DEFAULT NULL,
  `student_email` varchar(255) DEFAULT NULL,
  `student_class` varchar(255) DEFAULT NULL,
  `student_birthday` date DEFAULT NULL,
  `student_gender` int(11) NOT NULL,
  `student_file` varchar(255) DEFAULT NULL,
  `student_major_id` int(11) NOT NULL,
  `student_gpa` decimal(10,0) DEFAULT NULL,
  `student_rank` varchar(255) DEFAULT NULL,
  `student_description` text DEFAULT NULL,
  `student_is_register` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `hicrm_student_profile`
--

INSERT INTO `hicrm_student_profile` (`id`, `student_code`, `student_name`, `student_phone`, `student_email`, `student_class`, `student_birthday`, `student_gender`, `student_file`, `student_major_id`, `student_gpa`, `student_rank`, `student_description`, `student_is_register`) VALUES
(1, 'SV_001', 'Vũ Xuân Cương', '', '', '1', '2016-04-07', 0, 'aaaa', 1, NULL, '', '', 0),
(2, 'SV00121', 'Vũ', '098939128', 'vxcuong@gmail.com', '12', '2016-04-07', 1, NULL, 1, NULL, 'Xuất xắc', 'aaaaa', 1),
(3, 'SV01102', 'Vũ Xuân Cương 2', '0963781278', 'vxcuong02@gmail.com', '2', '2016-04-07', 1, NULL, 1, NULL, 'Xuất sắc', NULL, 1),
(7, 'SV000001', 'Phan Hùng Phúc', '0336579210', 'phuc1@email.com', '1', '1998-08-01', 1, '', 8, '0', '0', 'abc', 1),
(8, 'MSV1', 'Nguyễn Văn Lưu', '', '', 'K10TT', '2001-06-11', 1, '', 1, NULL, '', '', 1),
(9, 'SV001', 'Ngô Tuấn An', '0916503271', 'sv001@example.com', 'DLKS01', '2002-01-01', 1, NULL, 63, '8', 'Gioi', 'Sinh viên năm cuối', 0),
(10, 'SV002', 'Võ Thu Anh', '0919120284', 'sv002@example.com', 'YDUOC01', '2003-09-17', 2, NULL, 73, '7', 'Kha', 'Ứng viên tiềm năng', 0),
(11, 'SV003', 'Đặng Gia Cường', '0940573895', 'sv003@example.com', 'DLKS01', '2004-08-10', 1, NULL, 57, '7', 'Kha', 'Sinh viên năm cuối', 0),
(12, 'SV004', 'Huỳnh Thu Dung', '0949995859', 'sv004@example.com', 'MKT01', '2001-05-16', 2, NULL, 64, '9', 'Xuat sac', 'Ứng viên tiềm năng', 0),
(13, 'SV005', 'Phạm Thanh Đạt', '0968869881', 'sv005@example.com', 'CNTT03', '2002-11-15', 1, NULL, 71, '8', 'Kha', 'Sinh viên có nhu cầu tìm việc', 0),
(14, 'SV006', 'Lê Hoài Hà', '0939834840', 'sv006@example.com', 'DLKS01', '2003-11-04', 2, NULL, 20, '7', 'Kha', 'Ứng viên tiềm năng', 0),
(15, 'SV007', 'Hồ Anh Hưng', '0970708594', 'sv007@example.com', 'DTVT01', '2004-03-12', 1, NULL, 55, '7', 'Kha', 'Sinh viên có nhu cầu tìm việc', 0),
(16, 'SV008', 'Lê Khánh Hoa', '0937163656', 'sv008@example.com', 'QTKD01', '2001-10-07', 2, NULL, 57, '7', 'Kha', 'Sinh viên năm cuối', 0),
(17, 'SV009', 'Ngô Minh Long', '0949018347', 'sv009@example.com', 'QTKD01', '2002-10-25', 1, NULL, 57, '8', 'Gioi', 'Ứng viên tiềm năng', 0),
(18, 'SV010', 'Dương Mai Linh', '0973622598', 'sv010@example.com', 'YDUOC01', '2003-03-05', 2, NULL, 7, '8', 'Kha', 'Ứng viên tiềm năng', 0),
(19, 'SV011', 'Huỳnh Hữu Phong', '0989908691', 'sv011@example.com', 'CNTT02', '2004-05-21', 1, NULL, 54, '7', 'Kha', 'Sinh viên năm cuối', 0),
(20, 'SV012', 'Lê Thanh My', '0920623330', 'sv012@example.com', 'CNTT02', '2001-03-17', 2, NULL, 48, '8', 'Kha', 'Sinh viên có nhu cầu tìm việc', 0),
(21, 'SV013', 'Trần Đức Sơn', '0959202580', 'sv013@example.com', 'QTKD01', '2002-01-19', 1, NULL, 20, '9', 'Xuat sac', 'Sinh viên có nhu cầu tìm việc', 0),
(22, 'SV014', 'Phan Khánh Ngân', '0975866039', 'sv014@example.com', 'CNTT01', '2003-12-06', 2, NULL, 66, '7', 'Kha', 'Sinh viên thực tập', 0),
(23, 'SV015', 'Trần Văn Trí', '0922897772', 'sv015@example.com', 'MKT01', '2004-02-15', 1, NULL, 72, '7', 'Kha', 'Sinh viên có nhu cầu tìm việc', 0),
(24, 'SV016', 'Đặng Thu Nhi', '0945198846', 'sv016@example.com', 'KETOAN01', '2001-05-14', 2, NULL, 54, '8', 'Kha', 'Sinh viên năm cuối', 0),
(25, 'SV017', 'Đặng Tuấn Việt', '0980333596', 'sv017@example.com', 'KETOAN01', '2002-07-14', 1, NULL, 66, '8', 'Gioi', 'Ứng viên tiềm năng', 0),
(26, 'SV018', 'Võ Bảo Quỳnh', '0979015938', 'sv018@example.com', 'CNTT01', '2003-04-11', 2, NULL, 56, '8', 'Kha', 'Sinh viên thực tập', 0),
(27, 'SV019', 'Đỗ Thanh Duy', '0941816037', 'sv019@example.com', 'YDUOC01', '2004-04-05', 1, NULL, 64, '7', 'Kha', 'Sinh viên có nhu cầu tìm việc', 0),
(28, 'SV020', 'Hồ Thu Trang', '0938424508', 'sv020@example.com', 'KETOAN01', '2001-06-13', 2, NULL, 71, '8', 'Gioi', 'Sinh viên có nhu cầu tìm việc', 0),
(29, 'SV021', 'Phan Hữu Lâm', '0983335486', 'sv021@example.com', 'YDUOC01', '2002-03-09', 1, NULL, 20, '8', 'Gioi', 'Ứng viên tiềm năng', 0),
(30, 'SV022', 'Đỗ Bảo Tú', '0985505307', 'sv022@example.com', 'CNTT01', '2003-09-15', 2, NULL, 63, '7', 'Kha', 'Sinh viên năm cuối', 0),
(31, 'SV023', 'Ngô Hữu Toàn', '0974586432', 'sv023@example.com', 'CNTT02', '2004-06-28', 1, NULL, 70, '7', 'Kha', 'Sinh viên thực tập', 0),
(32, 'SV024', 'Bùi Thu Vy', '0974634650', 'sv024@example.com', 'QTKD01', '2001-06-15', 2, NULL, 70, '9', 'Xuat sac', 'Sinh viên thực tập', 0),
(33, 'SV025', 'Phạm Quang Khoa', '0956884358', 'sv025@example.com', 'TMĐT01', '2002-09-16', 1, NULL, 7, '8', 'Kha', 'Sinh viên thực tập', 0),
(34, 'SV026', 'Bùi Mai An', '0919954771', 'sv026@example.com', 'MKT01', '2003-06-07', 2, NULL, 55, '7', 'Kha', 'Sinh viên thực tập', 0),
(35, 'SV027', 'Phan Minh Bình', '0966418108', 'sv027@example.com', 'MKT01', '2004-10-19', 1, NULL, 63, '8', 'Gioi', 'Sinh viên có nhu cầu tìm việc', 0),
(36, 'SV028', 'Ngô Thị Chi', '0955782854', 'sv028@example.com', 'DLKS01', '2001-04-08', 2, NULL, 20, '7', 'Kha', 'Sinh viên có nhu cầu tìm việc', 0),
(37, 'SV029', 'Lê Hữu Dũng', '0948599486', 'sv029@example.com', 'QTKD01', '2002-06-08', 1, NULL, 48, '8', 'Gioi', 'Sinh viên năm cuối', 0),
(38, 'SV030', 'Lê Khánh Giang', '0921527675', 'sv030@example.com', 'CNTT03', '2003-04-15', 2, NULL, 63, '8', 'Gioi', 'Sinh viên năm cuối', 0),
(39, 'SV031', 'Lý Anh Hải', '0964787024', 'sv031@example.com', 'DLKS01', '2004-09-08', 1, NULL, 70, '7', 'Kha', 'Sinh viên năm cuối', 0),
(40, 'SV032', 'Lê Khánh Hạnh', '0986369166', 'sv032@example.com', 'CNTT02', '2001-06-28', 2, NULL, 72, '9', 'Xuat sac', 'Sinh viên năm cuối', 0),
(41, 'SV033', 'Nguyễn Anh Khang', '0963601081', 'sv033@example.com', 'DLKS01', '2002-09-19', 1, NULL, 85, '8', 'Gioi', 'Sinh viên thực tập', 0),
(42, 'SV034', 'Phạm Bảo Hương', '0953626322', 'sv034@example.com', 'YDUOC01', '2003-10-13', 2, NULL, 56, '7', 'Kha', 'Ứng viên tiềm năng', 0),
(43, 'SV035', 'Dương Hữu Nam', '0995213496', 'sv035@example.com', 'YDUOC01', '2004-11-07', 1, NULL, 66, '8', 'Kha', 'Sinh viên năm cuối', 0),
(44, 'SV036', 'Ngô Minh Mai', '0936018603', 'sv036@example.com', 'CNTT02', '2001-05-10', 2, NULL, 66, '7', 'Kha', 'Sinh viên năm cuối', 0),
(45, 'SV037', 'Trần Quang Quân', '0928628865', 'sv037@example.com', 'DTVT01', '2002-06-09', 1, NULL, 56, '7', 'Kha', 'Sinh viên năm cuối', 0),
(46, 'SV038', 'Võ Thu Nga', '0985663330', 'sv038@example.com', 'DLKS01', '2003-06-20', 2, NULL, 55, '7', 'Kha', 'Sinh viên thực tập', 0),
(47, 'SV039', 'Võ Tuấn Thắng', '0999817671', 'sv039@example.com', 'DLKS01', '2004-10-08', 1, NULL, 85, '9', 'Gioi', 'Sinh viên có nhu cầu tìm việc', 0),
(48, 'SV040', 'Dương Thị Ngọc', '0979875545', 'sv040@example.com', 'CNTT03', '2001-08-05', 2, NULL, 63, '7', 'Kha', 'Sinh viên có nhu cầu tìm việc', 0),
(49, 'SV041', 'Ngô Gia Tú', '0961445099', 'sv041@example.com', 'TMĐT01', '2002-12-10', 1, NULL, 63, '8', 'Gioi', 'Ứng viên tiềm năng', 0),
(50, 'SV042', 'Phan Thị Phương', '0985188061', 'sv042@example.com', 'DTVT01', '2003-03-08', 2, NULL, 20, '7', 'Kha', 'Sinh viên năm cuối', 0),
(51, 'SV043', 'Huỳnh Hữu Vinh', '0912196590', 'sv043@example.com', 'CNTT01', '2004-11-02', 1, NULL, 48, '9', 'Gioi', 'Sinh viên có nhu cầu tìm việc', 0),
(52, 'SV044', 'Hoàng Khánh Thảo', '0962277410', 'sv044@example.com', 'CNTT03', '2001-05-21', 2, NULL, 64, '7', 'Kha', 'Sinh viên thực tập', 0),
(53, 'SV045', 'Lý Văn Kiên', '0997924366', 'sv045@example.com', 'CNTT01', '2002-10-14', 1, NULL, 70, '8', 'Gioi', 'Sinh viên có nhu cầu tìm việc', 0),
(54, 'SV046', 'Hoàng Thanh Trâm', '0939011170', 'sv046@example.com', 'YDUOC01', '2003-07-10', 2, NULL, 66, '8', 'Gioi', 'Sinh viên năm cuối', 0),
(55, 'SV047', 'Dương Văn Tài', '0921869335', 'sv047@example.com', 'DLKS01', '2004-11-04', 1, NULL, 56, '9', 'Xuat sac', 'Sinh viên năm cuối', 0),
(56, 'SV048', 'Hoàng Minh Uyên', '0958294948', 'sv048@example.com', 'YDUOC01', '2001-08-08', 2, NULL, 71, '9', 'Gioi', 'Sinh viên có nhu cầu tìm việc', 0),
(57, 'SV049', 'Vũ Tuấn Hiếu', '0912009939', 'sv049@example.com', 'CNTT01', '2002-07-17', 1, NULL, 48, '9', 'Gioi', 'Sinh viên năm cuối', 1),
(58, 'SV050', 'Lý Thu Yến', '0935423978', 'sv050@example.com', 'CNTT03', '2003-08-25', 2, NULL, 48, '9', 'Gioi', 'Sinh viên có nhu cầu tìm việc', 1),
(59, 'MSV001', 'Nguyễn Văn Huy', '09637168277', 'MSV001@gmail.com', NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 0),
(60, 'MSV001', 'Nguyễn Văn Huy', '0963718368', 'MSV001@gmail.com', NULL, '2002-08-13', 1, NULL, 8, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hicrm_support_requests`
--

CREATE TABLE `hicrm_support_requests` (
  `id` int(11) NOT NULL,
  `request_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `user_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `department` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `service_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'CNTT',
  `priority` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Normal',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `resolution_note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sent',
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `hicrm_support_requests`
--

INSERT INTO `hicrm_support_requests` (`id`, `request_code`, `user_id`, `user_name`, `user_email`, `department`, `service_type`, `priority`, `title`, `content`, `attachment`, `resolution_note`, `status`, `created_at`, `updated_at`) VALUES
(1, 'YC-20260808-001', 1, 'Nguyễn Văn An', 'an.nguyen@ttytdakha.gov.vn', 'Khoa Khám Bệnh', 'Phần mềm Y tế (HIS/LIS)', 'High', 'Lỗi kết quả xét nghiệm không đồng bộ sang phần mềm HIS', 'Hệ thống báo lỗi timeout khi ấn nút truyền dữ liệu xét nghiệm huyết học sang hồ sơ bệnh án điện tử.', NULL, 'Đã cấu hình lại cổng kết nối API LIS-HIS và chạy thử nghiệm thành công.', 'completed', '2026-08-08 17:16:48', '2026-08-08 17:16:48'),
(2, 'YC-20260808-002', 2, 'Trần Thị Bích', 'bich.tran@ttytdakha.gov.vn', 'Khoa Nội Tổng Hợp', 'Phần cứng & Máy tính', 'Normal', 'Máy in đơn thuốc tại phòng khám 102 bị kẹt giấy và mờ nét', 'Máy in Canon 2900 in ra chữ bị mờ và thường xuyên bị rách giấy.', NULL, 'Đang tiến hành thay hộp mực mới và vệ sinh con lăn kéo giấy.', 'processing', '2026-08-08 17:16:48', '2026-08-08 17:16:48'),
(3, 'YC-20260808-003', 2, 'Lê Văn Cường', 'cuong.le@ttytdakha.gov.vn', 'Phòng Kế toán - Tài chính', 'Mạng & Internet', 'Low', 'Cấp lại quyền truy cập thư mục lưu trữ chia sẻ kế toán', 'Nhờ bộ phận CNTT cấp lại quyền truy cập ổ đĩa NAS bộ phận Kế toán.', NULL, NULL, 'sent', '2026-08-08 17:16:48', '2026-08-08 17:16:48'),
(4, 'YC-20260808-004', 2, 'Phạm Minh Đức', 'duc.pham@ttytdakha.gov.vn', 'Khoa Cấp cứu', 'Thiết bị Y tế / Điện tử', 'Urgent', 'Dự thảo yêu cầu mua thêm ổ cắm điện y tế chuyên dụng', 'Yêu cầu đang ở dạng bản nháp chưa gửi đi chính thức.', NULL, NULL, 'draft', '2026-08-08 17:16:48', '2026-08-08 17:16:48'),
(5, 'YC-20260808-005', 3, 'Hoàng Thu Trang', 'trang.hoang@ttytdakha.gov.vn', 'Khoa Dược', 'Phần mềm Y tế (HIS/LIS)', 'Normal', 'Yêu cầu cài đặt phần mềm cá nhân không thuộc danh mục cho phép', 'Đề xuất cài đặt phần mềm chỉnh sửa video cá nhân trên máy tính làm việc.', NULL, 'Từ chối xử lý do vi phạm quy định an toàn thông tin của Bệnh viện.', 'completed', '2026-08-08 17:16:48', '2026-08-09 22:27:40'),
(6, 'YC-20260810-304', 0, 'Bùi Văn Điều', '', 'Sản', 'Phần mềm Y tế (HIS/LIS)', 'Urgent', 'không ký số được', 'Bệnh nhân không ký được vân tay', 'uploads/files/request_1786349719_828.pdf', NULL, 'sent', '2026-08-10 15:15:19', '2026-08-10 15:15:19'),
(7, 'YC-20260811-493', 16, 'Nguyễn Thị B', 'dieubv@gmail.com', 'Nội khoa', 'Phần mềm Y tế (HIS/LIS)', 'Low', 'Lỗi ký số', 'Không ký được phiếu điện tim', 'uploads/files/request_1786432757_287.png', NULL, 'sent', '2026-08-11 14:19:17', '2026-08-11 14:19:17'),
(8, 'YC-20260811-875', 16, 'Nguyễn Thị A', 'dieubv@gmail.com', 'Nội khoa', 'Phần mềm Y tế (HIS/LIS)', 'Normal', 'Nháp thử', '', '', NULL, 'draft', '2026-08-11 14:19:47', '2026-08-11 14:19:47');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hicrm_templates`
--

CREATE TABLE `hicrm_templates` (
  `id` int(11) NOT NULL,
  `template_name` varchar(255) NOT NULL,
  `template_type` int(11) NOT NULL,
  `template_html` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `hicrm_templates`
--

INSERT INTO `hicrm_templates` (`id`, `template_name`, `template_type`, `template_html`) VALUES
(1, 'Phiếu thu - Mẫu 01-TT Thông tu 200', 1, '<table style=\"width: 100%; font-size: 13px;\" border=\"0\">\n<tbody>\n<tr>\n<td style=\"width: 40.9339%; text-align: center; font-weight: bold;\">C&Ocirc;NG TY TNHH AN LỘC FSC GIA LAI<br /><span style=\"font-size: 11px;\">ĐC: 499A Phan Đ&igrave;nh Ph&ugrave;ng, P. Y&ecirc;n Đỗ, <br />TP. Pleiku, Gia Lai</span></td>\n<td style=\"width: 44.8793%; text-align: center;\" colspan=\"2\"><strong>Mẫu số 01 - TT</strong><br style=\"text-align: center;\" /><em>(Ban h&agrave;nh theo Th&ocirc;ng tư số 200/2014/TT-BTC<br />Ng&agrave;y 22/12/2014 của Bộ T&agrave;i ch&iacute;nh)</em></td>\n</tr>\n<tr>\n<td>&nbsp;</td>\n<td>&nbsp;</td>\n<td style=\"width: 30%;\">Số: {{INCOME_NO}}<br />Nợ: {{DEBIT_ACC}}<br />C&oacute;: {{CREDIT_ACC}}</td>\n</tr>\n<tr>\n<td style=\"text-align: center; font-size: 20px; font-weight: bold;\" colspan=\"3\">PHIẾU THU</td>\n</tr>\n</tbody>\n</table>\n<table style=\"width: 100%; font-size: 13px;\" border=\"0\">\n<tbody>\n<tr>\n<td style=\"width: 30%; font-weight: bold;\">Họ v&agrave; t&ecirc;n người nộp tiền:</td>\n<td><strong>{{INCOME_NAME}}</strong></td>\n</tr>\n<tr>\n<td style=\"width: 30%; font-weight: bold;\">Địa chỉ:</td>\n<td>{{INCOME_ADDRESS}}</td>\n</tr>\n<tr>\n<td style=\"width: 30%; font-weight: bold;\">Số tiền:</td>\n<td>{{INCOME_AMOUNT}} VNĐ</td>\n</tr>\n<tr>\n<td style=\"width: 30%; font-weight: bold;\">Bằng chữ:</td>\n<td style=\"font-style: italic;\">{{INCOME_AMOUNT_TEXT}}</td>\n</tr>\n<tr>\n<td style=\"width: 30%; font-weight: bold;\">L&yacute; do nộp:</td>\n<td>{{INCOME_NOTE}}</td>\n</tr>\n<tr>\n<td style=\"width: 30%; font-weight: bold;\">K&egrave;m theo:</td>\n<td>{{INCOME_DOCUMENT}} <em>chứng từ gốc</em>.</td>\n</tr>\n</tbody>\n</table>\n<table style=\"width: 100%; font-size: 13px;\" border=\"0\">\n<tbody>\n<tr>\n<td style=\"width: 20%;\">&nbsp;</td>\n<td style=\"width: 20%;\">&nbsp;</td>\n<td style=\"width: 20%;\">&nbsp;</td>\n<td style=\"text-align: center;\" colspan=\"2\">Ng&agrave;y {{BILL_DAY}} th&aacute;ng {{BILL_MONTH}} năm {{BILL_YEAR}}</td>\n</tr>\n<tr>\n<td style=\"width: 22%; text-align: center;\"><strong>Gi&aacute;m đốc</strong><br /><em>(K&yacute;, họ t&ecirc;n, đ&oacute;ng dấu)</em></td>\n<td style=\"width: 20%; text-align: center;\"><strong>Kế to&aacute;n trưởng</strong><br /><em>(K&yacute;, họ t&ecirc;n)</em></td>\n<td style=\"width: 18%; text-align: center;\"><strong>Thủ quỹ</strong><br /><em>(K&yacute;, họ t&ecirc;n)</em></td>\n<td style=\"width: 20%; text-align: center;\"><strong>Người lập phiếu</strong><br /><em>(K&yacute;, họ t&ecirc;n)</em></td>\n<td style=\"width: 20%; text-align: center;\"><strong>Người n&ocirc;̣p tiền</strong><br /><em>(K&yacute;, họ t&ecirc;n)</em></td>\n</tr>\n</tbody>\n</table>'),
(2, 'Phiếu chi - Mẫu 01-TT Thông tư 200', 2, '<table style=\"width: 827px; height: 336px;\" border=\"0\" width=\"836\" cellspacing=\"0\" cellpadding=\"0\"><colgroup><col style=\"width: 242px;\" width=\"160\" /><col style=\"width: 0px;\" span=\"2\" width=\"148\" /><col style=\"width: 140px;\" width=\"188\" /><col style=\"width: 218px;\" width=\"134\" /></colgroup>\n<tbody>\n<tr style=\"height: 25px;\">\n<td class=\"xl78\" style=\"height: 25px; width: 342pt; text-align: center;\" colspan=\"3\" width=\"456\" height=\"34\"><strong>C&Ocirc;NG TY TNHH AN LỘC FSC GIA LAI</strong></td>\n<td class=\"xl84\" style=\"width: 286pt; height: 50px; text-align: center;\" colspan=\"2\" rowspan=\"2\" width=\"380\"><strong>Mẫu số 01 &ndash; TT</strong><br /><em>(Ban h&agrave;nh theo Th&ocirc;ng tư số 200/2014/TT-BTC<br />Ng&agrave;y 22/12/2014 của Bộ T&agrave;i ch&iacute;nh)</em></td>\n</tr>\n<tr style=\"height: 25px;\">\n<td class=\"xl78\" style=\"height: 25px; text-align: center;\" colspan=\"3\" height=\"34\"><strong>499A Phan Đ&igrave;nh Ph&ugrave;ng, P. Y&ecirc;n Đỗ, TP. Pleiku, Gia Lai</strong></td>\n</tr>\n<tr style=\"height: 32px;\">\n<td class=\"xl65\" style=\"height: 10px;\" height=\"31\">&nbsp;</td>\n<td class=\"xl64\" style=\"width: 111pt; height: 10px;\" width=\"148\">&nbsp;</td>\n<td class=\"xl64\" style=\"width: 111pt; height: 10px;\" width=\"148\">&nbsp;</td>\n<td class=\"xl64\" style=\"width: 141pt; height: 10px;\" width=\"188\">&nbsp;</td>\n<td class=\"xl82\" style=\"width: 145pt; height: 10px;\" width=\"192\">Số: {{INCOME_NO}}</td>\n</tr>\n<tr style=\"height: 10px;\">\n<td style=\"height: 10px;\">&nbsp;</td>\n<td style=\"width: 111pt; height: 10px;\">&nbsp;</td>\n<td style=\"width: 111pt; height: 10px;\">&nbsp;</td>\n<td style=\"width: 141pt; height: 10px;\">&nbsp;</td>\n<td style=\"width: 145pt; height: 10px;\">Nợ: {{DEBIT_ACC}}</td>\n</tr>\n<tr style=\"height: 43px;\">\n<td class=\"xl83\" style=\"height: 10px; width: 483pt;\" colspan=\"4\" width=\"644\" height=\"58\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</td>\n<td class=\"xl68\" style=\"height: 10px;\" width=\"134\">C&oacute;: {{CREDIT_ACC}}</td>\n</tr>\n<tr style=\"height: 31px;\">\n<td class=\"xl83\" style=\"height: 31px; text-align: center;\" colspan=\"5\" width=\"644\" height=\"24\"><span style=\"font-size: 14pt;\"><strong>PHIẾU CHI</strong></span></td>\n</tr>\n<tr style=\"height: 15px;\">\n<td class=\"xl68\" style=\"height: 15px; width: 100pt;\" width=\"100\" height=\"20\">Họ v&agrave; t&ecirc;n người nh&acirc;̣n tiền:</td>\n<td class=\"xl85\" style=\"width: 508pt; height: 15px;\" colspan=\"4\" width=\"676\">{{INCOME_NAME}}</td>\n</tr>\n<tr style=\"height: 15px;\">\n<td class=\"xl68\" style=\"height: 15px; width: 120pt;\" width=\"160\" height=\"20\">Bộ phận:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>\n<td class=\"xl68\" style=\"width: 508pt; height: 15px;\" colspan=\"4\" width=\"676\">{{INCOME_DEPARTMENT}}</td>\n</tr>\n<tr style=\"height: 15px;\">\n<td class=\"xl68\" style=\"height: 15px; width: 120pt;\" width=\"160\" height=\"20\">Địa chỉ:</td>\n<td class=\"xl80\" style=\"width: 508pt; height: 15px;\" colspan=\"4\" width=\"676\">{{INCOME_ADDRESS}}</td>\n</tr>\n<tr style=\"height: 15px;\">\n<td class=\"xl68\" style=\"height: 15px; width: 120pt;\" width=\"160\" height=\"20\">Số tiền:</td>\n<td class=\"xl86\" style=\"width: 508pt; height: 15px;\" colspan=\"4\" width=\"676\">{{INCOME_AMOUNT}} VND</td>\n</tr>\n<tr style=\"height: 15px;\">\n<td class=\"xl68\" style=\"height: 15px; width: 120pt;\" width=\"160\" height=\"20\">Bằng chữ:</td>\n<td class=\"xl87\" style=\"width: 508pt; height: 15px;\" colspan=\"4\" width=\"676\">#NAME?</td>\n</tr>\n<tr style=\"height: 15px;\">\n<td class=\"xl68\" style=\"height: 15px; width: 120pt;\" width=\"160\" height=\"20\">L&yacute; do nộp:</td>\n<td class=\"xl80\" style=\"width: 508pt; height: 15px;\" colspan=\"4\" width=\"676\">{{INCOME_NOTE}}</td>\n</tr>\n<tr style=\"height: 15px;\">\n<td class=\"xl69\" style=\"height: 15px; width: 120pt;\" width=\"160\" height=\"20\">K&egrave;m theo:</td>\n<td class=\"xl76\" style=\"width: 111pt; height: 15px;\" width=\"148\">{{INCOME_DOCUMENT}}</td>\n<td class=\"xl77\" style=\"width: 111pt; height: 15px;\" align=\"left\" width=\"148\">&nbsp;chứng từ gốc</td>\n<td class=\"xl79\" style=\"width: 286pt; height: 15px;\" colspan=\"2\" width=\"380\">&nbsp;</td>\n</tr>\n<tr style=\"height: 15px;\">\n<td class=\"xl69\" style=\"height: 15px; width: 120pt;\" width=\"160\" height=\"20\">&nbsp;</td>\n<td class=\"xl70\" style=\"width: 111pt; height: 15px;\" width=\"148\">&nbsp;</td>\n<td class=\"xl71\" style=\"width: 111pt; height: 15px;\" width=\"148\">&nbsp;</td>\n<td class=\"xl71\" style=\"width: 141pt; height: 15px;\" width=\"188\">&nbsp;</td>\n<td class=\"xl71\" style=\"width: 101pt; height: 15px;\" width=\"134\">&nbsp;</td>\n</tr>\n<tr style=\"height: 15px;\">\n<td class=\"xl68\" style=\"height: 15px; width: 120pt;\" width=\"160\" height=\"20\">&nbsp;</td>\n<td class=\"xl71\" style=\"width: 111pt; height: 15px;\" width=\"148\">&nbsp;</td>\n<td class=\"xl71\" style=\"width: 111pt; height: 15px;\" width=\"148\">&nbsp;</td>\n<td class=\"xl71\" style=\"width: 141pt; height: 15px;\" width=\"188\">&nbsp;</td>\n<td class=\"xl71\" style=\"width: 101pt; height: 15px;\" width=\"134\">&nbsp;</td>\n</tr>\n<tr style=\"height: 21px;\">\n<td class=\"xl71\" style=\"height: 21px; width: 120pt;\" width=\"160\" height=\"28\">&nbsp;</td>\n<td class=\"xl71\" style=\"width: 111pt; height: 21px;\" width=\"148\">&nbsp;</td>\n<td class=\"xl71\" style=\"width: 111pt; height: 21px;\" width=\"148\">&nbsp;</td>\n<td class=\"xl81\" style=\"width: 286pt; height: 21px; text-align: center;\" colspan=\"2\" width=\"380\"><em>Ng&agrave;y 24 th&aacute;ng 08 năm 2021</em></td>\n</tr>\n<tr style=\"height: 15px;\">\n<td class=\"xl72\" style=\"height: 15px; text-align: center;\" height=\"20\"><strong>Gi&aacute;m đốc</strong></td>\n<td class=\"xl72\" style=\"height: 15px; text-align: center;\"><strong>Kế to&aacute;n trưởng&nbsp;</strong></td>\n<td class=\"xl72\" style=\"height: 15px; text-align: center;\"><strong>Thủ quỹ&nbsp;</strong></td>\n<td class=\"xl72\" style=\"height: 15px; text-align: center;\"><strong>Người lập phiếu</strong></td>\n<td class=\"xl72\" style=\"height: 15px; text-align: center;\"><strong>Người nh&acirc;̣n tiền</strong></td>\n</tr>\n<tr style=\"height: 18px;\">\n<td class=\"xl75\" style=\"height: 18px; text-align: center;\" height=\"25\">(K&yacute;, họ t&ecirc;n, đ&oacute;ng dấu)</td>\n<td class=\"xl75\" style=\"height: 18px; text-align: center;\">(K&yacute;, họ t&ecirc;n)</td>\n<td class=\"xl75\" style=\"height: 18px; text-align: center;\">(K&yacute;, họ t&ecirc;n)</td>\n<td class=\"xl75\" style=\"height: 18px; text-align: center;\">(K&yacute;, họ t&ecirc;n)</td>\n<td class=\"xl75\" style=\"height: 18px; text-align: center;\">(K&yacute;, họ t&ecirc;n)</td>\n</tr>\n<tr style=\"height: 18px;\">\n<td class=\"xl63\" style=\"height: 18px; width: 120pt;\" width=\"160\" height=\"25\">&nbsp;</td>\n<td class=\"xl63\" style=\"width: 111pt; height: 18px;\" width=\"148\">&nbsp;</td>\n<td class=\"xl63\" style=\"width: 111pt; height: 18px;\" width=\"148\">&nbsp;</td>\n<td class=\"xl63\" style=\"width: 141pt; height: 18px;\" width=\"188\">&nbsp;</td>\n<td class=\"xl63\" style=\"width: 101pt; height: 18px;\" width=\"134\">&nbsp;</td>\n</tr>\n<tr style=\"height: 18px;\">\n<td class=\"xl63\" style=\"height: 18px; width: 120pt;\" width=\"160\" height=\"25\">&nbsp;</td>\n<td class=\"xl63\" style=\"width: 111pt; height: 18px;\" width=\"148\">&nbsp;</td>\n<td class=\"xl63\" style=\"width: 111pt; height: 18px;\" width=\"148\">&nbsp;</td>\n<td class=\"xl63\" style=\"width: 141pt; height: 18px;\" width=\"188\">&nbsp;</td>\n<td class=\"xl63\" style=\"width: 101pt; height: 18px;\" width=\"134\">&nbsp;</td>\n</tr>\n</tbody>\n</table>\n<p>&nbsp;</p>');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hicrm_template_types`
--

CREATE TABLE `hicrm_template_types` (
  `id` int(11) NOT NULL,
  `template_type_code` varchar(50) NOT NULL,
  `template_type_name` varchar(255) NOT NULL,
  `template_type_description` text DEFAULT NULL,
  `template_type_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `hicrm_template_types`
--

INSERT INTO `hicrm_template_types` (`id`, `template_type_code`, `template_type_name`, `template_type_description`, `template_type_status`) VALUES
(1, 'BHCTT', 'Bán hàng chưa thanh toán', NULL, 1),
(2, 'CKDV', 'Các khoản đi vay', NULL, 1),
(3, 'CPL', 'Hạch toán chi phí lương', NULL, 1),
(4, 'CTNVK', 'Chứng từ nghiệp vụ khác', NULL, 1),
(5, 'GBC', 'Giấy Báo Có', NULL, 1),
(6, 'GGHB', 'Giảm giá hàng bán', NULL, 1),
(7, 'GTSCĐHH', 'Ghi giảm TSCĐ hữu hình', NULL, 1),
(8, 'GTSCĐVH', 'Ghi giảm TSCĐ vô hình', NULL, 1),
(9, 'HBBTL', 'Hàng bán bị trả lại', NULL, 1),
(10, 'HGBĐL', 'Xuất kho hàng gửi bán đại lý', NULL, 1),
(11, 'KHTSCĐ', 'Khấu hao TSCĐ', NULL, 1),
(12, 'MHCTT', 'Mua hàng hóa, dịch vụ chưa thanh toán', NULL, 1),
(13, 'NK', 'Nhập kho vật tư', NULL, 1),
(14, 'NKCCDC', 'Nhập kho CCDC', NULL, 1),
(15, 'NKHGB', 'Nhập kho hàng gửi bán đại lý', NULL, 1),
(16, 'NKHH', 'Nhập kho hàng hóa', NULL, 1),
(17, 'NKTP', 'Nhập kho thành phẩm', NULL, 1),
(18, 'NT', 'Nghiệm thu công trình, đơn hàng, hợp đồng', NULL, 1),
(19, 'NTTC', 'Nợ thuê tài chính', NULL, 1),
(20, 'PBCCDC', 'Phân bổ CCDC', NULL, 1),
(21, 'PC', 'Phiếu chi', NULL, 1),
(22, 'PT', 'Phiếu thu', NULL, 1),
(23, 'TL', 'Trả lương', NULL, 1),
(24, 'TTKHTG', 'Thu tiền khách hàng bằng tiền gửi ngân hàng', NULL, 1),
(25, 'TTKHTM', 'Thu tiền khách hàng bằng tiền mặt', NULL, 1),
(26, 'TTNCCTG', 'Trả tiền nhà cung cấp bằng tiền gửi ngân hàng', NULL, 1),
(27, 'TTNCCTM', 'Trả tiền nhà cung cấp bằng tiền mặt', NULL, 1),
(28, 'TTSCĐHH', 'Ghi tăng TSCĐ hữu hình', NULL, 1),
(29, 'TTSCĐVH', 'Ghi tăng TSCĐ vô hình', NULL, 1),
(30, 'TƯ', 'Tạm ứng', NULL, 1),
(31, 'UNC', 'Séc/Ủy nhiệm chi', NULL, 1),
(32, 'XKCCDC', 'Xuất kho CCDC', NULL, 1),
(33, 'XKHH', 'Xuất kho hàng hóa', NULL, 1),
(34, 'XKTP', 'Xuất kho thành phẩm', NULL, 1),
(35, 'XKVT', 'Xuất kho vật tư', '', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hicrm_tt25_categories`
--

CREATE TABLE `hicrm_tt25_categories` (
  `id` int(11) NOT NULL,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `hicrm_tt25_categories`
--

INSERT INTO `hicrm_tt25_categories` (`id`, `code`, `name`, `description`, `sort_order`, `status`, `created_at`) VALUES
(1, 'BHXH', 'Giấy chứng nhận nghỉ việc hưởng bảo hiểm xã hội (Mẫu TT25/BYT)', NULL, 1, 1, '2026-08-10 10:24:55'),
(2, 'RAVIEN', 'Giấy ra viện (Mẫu TT25/BYT)', NULL, 2, 1, '2026-08-10 10:24:55'),
(3, 'KHAMSK', 'Giấy khám sức khỏe (Mẫu TT25/BYT)', NULL, 3, 1, '2026-08-10 10:24:55'),
(4, 'CHUNGSINH', 'Giấy chứng sinh (Mẫu TT25/BYT)', NULL, 4, 1, '2026-08-10 10:24:55'),
(5, 'SAOBENHAN', 'Giấy trích sao bệnh án (Mẫu TT25/BYT)', NULL, 5, 1, '2026-08-10 10:24:55'),
(6, 'NOITRU', 'Giấy chứng nhận điều trị nội trú (Mẫu TT25/BYT)', NULL, 6, 1, '2026-08-10 10:24:55');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hicrm_tt25_requests`
--

CREATE TABLE `hicrm_tt25_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `fullname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cccd` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dob` date NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bhyt_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0: Mới tiếp nhận, 1: Hoàn thành, 2: Từ chối',
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `hicrm_tt25_requests`
--

INSERT INTO `hicrm_tt25_requests` (`id`, `fullname`, `cccd`, `dob`, `phone`, `bhyt_code`, `email`, `category_id`, `category_name`, `status`, `note`, `created_at`, `updated_at`) VALUES
(1, 'Nguyễn Văn An', '062098001234', '1995-05-15', '0987654321', NULL, 'nguyenvanan@gmail.com', 1, 'Giấy chứng nhận nghỉ việc hưởng bảo hiểm xã hội (Mẫu TT25/BYT)', 0, NULL, '2026-08-10 10:50:33', '2026-08-10 10:50:33'),
(2, 'Trần Thị Bình', '062189005678', '1998-11-20', '0912345678', NULL, 'tranthibinh@gmail.com', 2, 'Giấy ra viện (Mẫu TT25/BYT)', 0, NULL, '2026-08-10 09:50:33', '2026-08-10 10:50:33'),
(3, 'Lê Hoàng Cường', '062092009999', '1990-03-08', '0933445566', NULL, 'lehoangcuong@gmail.com', 3, 'Giấy khám sức khỏe (Mẫu TT25/BYT)', 1, NULL, '2026-08-10 08:50:33', '2026-08-10 10:50:33'),
(4, 'Cương Vũ Xuân', '030098013026', '2026-08-14', '09637196700', NULL, 'vuxuancuong98gl@gmail.com', 2, 'Giấy ra viện (Mẫu TT25/BYT)', 0, NULL, '2026-08-10 12:06:02', '2026-08-10 12:06:02'),
(5, 'Vũ Xuân Cương', '030098013026', '1998-09-27', '0336579210', '', 'vuxuancuong98gl@gmail.com', 1, 'Giấy chứng nhận nghỉ việc hưởng bảo hiểm xã hội (Mẫu TT25/BYT)', 0, NULL, '2026-08-11 14:24:06', '2026-08-11 14:24:06');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hicrm_type`
--

CREATE TABLE `hicrm_type` (
  `id` int(11) NOT NULL,
  `type_name` varchar(255) NOT NULL,
  `type_detail` int(11) NOT NULL COMMENT '1. Giới thiệu\r\n2. Dịch vụ\r\n3. Chuyên khoa\r\n4. Nhà thuốc',
  `type_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `hicrm_type`
--

INSERT INTO `hicrm_type` (`id`, `type_name`, `type_detail`, `type_status`) VALUES
(1, 'Tin tuyển dụng', 1, 1),
(2, 'Tin ứng viên', 1, 1),
(3, 'Tin của trang', 1, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hicrm_users`
--

CREATE TABLE `hicrm_users` (
  `id` int(11) NOT NULL,
  `user_username` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_department` int(11) NOT NULL,
  `user_avatar_url` varchar(255) NOT NULL,
  `is_admin` int(11) DEFAULT 0 COMMENT '1. Admin\r\n0. Người dùng',
  `user_phone` varchar(20) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_group` int(11) NOT NULL,
  `user_status` int(11) NOT NULL,
  `user_created_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `hicrm_users`
--

INSERT INTO `hicrm_users` (`id`, `user_username`, `full_name`, `user_password`, `user_department`, `user_avatar_url`, `is_admin`, `user_phone`, `user_email`, `user_group`, `user_status`, `user_created_date`) VALUES
(1, 'Vũ Xuân Cương', '', 'e10adc3949ba59abbe56e057f20f883e', 0, '', 1, '', 'vuxuancuong98gl@gmail.com', 1, 1, '0000-00-00'),
(10, 'SV001', '', '50b95ae64dc93fb0f3d70f16ee0ed331', 0, '', 0, '', 'vxcuong@gmail.com', 3, 1, '2026-04-22'),
(11, 'SV002', '', '229430317219801e49eb048aeaf50314', 0, '', 0, '', 'cuongvx2@gmail.com', 3, 1, '2026-04-27'),
(12, 'cuongmedia@g33mail.com', '', 'e10adc3949ba59abbe56e057f20f883e', 0, '', 0, '', 'vu111xuancuong98gl@gmail.com', 1, 1, '0000-00-00'),
(13, 'cuong1m33112edia@gmail.com', '', 'e10adc3949ba59abbe56e057f20f883e', 0, '', 0, '', 'vu3331231xuancuong98gl@gmail.com', 1, 1, '0000-00-00'),
(14, 'cuon31231gmedia@gmail.com', '', 'e10adc3949ba59abbe56e057f20f883e', 0, '', 0, '', '33123123vuxuancuong98gl@gmail.com', 1, 1, '0000-00-00'),
(15, 'cuongmedia@gmail.com', '', '0c625e7780de4170056702393b7f138a', 0, '', 0, '', 'vuxuancuong98gl@gmail.com', 1, 1, '0000-00-00'),
(16, 'Bùi Văn Điều', '', 'e10adc3949ba59abbe56e057f20f883e', 1, '', 0, '', 'dieubv@gmail.com', 2, 1, '0000-00-00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hicrm_users_old-1`
--

CREATE TABLE `hicrm_users_old-1` (
  `id` bigint(20) NOT NULL,
  `student_id` int(11) DEFAULT 0,
  `employee_id` int(11) NOT NULL,
  `user_username` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `user_email` varchar(191) NOT NULL,
  `user_phone` varchar(20) DEFAULT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_group` varchar(20) NOT NULL COMMENT 'admin | employer | student | member',
  `user_status` int(11) NOT NULL DEFAULT 1 COMMENT 'active | inactive | banned | pending',
  `user_avatar_url` varchar(500) DEFAULT NULL,
  `user_reset_token` varchar(255) DEFAULT NULL,
  `user_reset_token_expires` datetime DEFAULT NULL,
  `user_two_fa_enabled` tinyint(4) DEFAULT 0,
  `user_two_fa_secret` varchar(255) DEFAULT NULL COMMENT 'TOTP secret key',
  `user_two_fa_method` varchar(10) DEFAULT NULL COMMENT 'totp | sms | email',
  `user_email_verified_at` datetime DEFAULT NULL,
  `user_email_verify_token` varchar(255) DEFAULT NULL,
  `user_is_verified` int(11) NOT NULL DEFAULT 0,
  `user_last_login_at` datetime DEFAULT NULL,
  `user_last_login_ip` varchar(45) DEFAULT NULL,
  `user_created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_updated_at` datetime NOT NULL,
  `user_deleted_at` datetime DEFAULT NULL COMMENT 'Soft delete',
  `user_is_subscribed` tinyint(4) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `hicrm_users_old-1`
--

INSERT INTO `hicrm_users_old-1` (`id`, `student_id`, `employee_id`, `user_username`, `full_name`, `user_email`, `user_phone`, `user_password`, `user_group`, `user_status`, `user_avatar_url`, `user_reset_token`, `user_reset_token_expires`, `user_two_fa_enabled`, `user_two_fa_secret`, `user_two_fa_method`, `user_email_verified_at`, `user_email_verify_token`, `user_is_verified`, `user_last_login_at`, `user_last_login_ip`, `user_created_at`, `user_updated_at`, `user_deleted_at`, `user_is_subscribed`) VALUES
(1, 0, 11, 'vuxuancuong', 'Vũ Xuân Cương', 'vuxuancuong98gl@gmail.com', NULL, 'e10adc3949ba59abbe56e057f20f883e', '1', 1, NULL, NULL, '2026-05-27 16:00:56', 0, NULL, NULL, '2026-07-10 23:08:07', '67e77ff5c72f10e3eb2b26fb4854a3c481e28057803d564b220e7ab70a7d7203', 1, '2026-05-27 16:00:56', NULL, '2026-05-27 14:01:33', '2026-06-22 21:24:39', '2026-05-27 16:00:56', 0),
(31, 3, 0, 'SV002', 'Vũ Xuân Cương 2', 'vxcuong012@gmail.com', '0963781278', 'e10adc3949ba59abbe56e057f20f883e', '3', 1, '', NULL, NULL, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2026-05-30 09:11:27', '2026-05-30 16:11:27', NULL, 0),
(32, 0, 0, NULL, 'Cương Vũ Xuân', 'vuxuancu1ong98gl@gmail.com', '0828228339', '0c35b5d87bd21f6da261e798f3d3c0cb', '4', 1, NULL, NULL, NULL, 0, NULL, NULL, '2026-06-24 08:58:32', '', 1, NULL, NULL, '2026-05-30 15:16:05', '2026-07-25 01:41:31', NULL, 0),
(40, 0, 11, 'xuancuong1998', 'Cương Vũ Xuân', 'vxcuong1101@gmail.com', '0828228339', 'f026caf231c148149fe36ed4f9ee9575', '2', 1, NULL, NULL, NULL, 0, NULL, NULL, '2026-05-30 23:56:49', '', 1, NULL, NULL, '2026-05-30 16:41:49', '2026-06-03 22:33:32', NULL, 0),
(41, 0, 3, NULL, 'Vũ Xuân Cương', 'vxcuong102@gmail.com', '0091231238', '1bbd886460827015e5d605ed44252251', '2', 1, NULL, NULL, NULL, 0, NULL, NULL, '2026-05-30 23:58:57', 'c876a2007ff68bd83fde9bc3b5681890822a663cff648869bb882877ecab9f62', 1, NULL, NULL, '2026-05-30 16:43:57', '0000-00-00 00:00:00', NULL, 0),
(43, 0, 0, NULL, 'Nguyễn Hồ Định', 'vxcuong032@gmail.com', '0091231238', '3c8c596701f71813cbd11d80b48f138c', '4', 99, NULL, NULL, NULL, 0, NULL, NULL, '2026-05-31 20:25:31', '', 1, NULL, NULL, '2026-05-31 13:10:31', '0000-00-00 00:00:00', NULL, 0),
(44, 0, 0, NULL, 'Nguyễn Văn Tiệp', 'vxcuong0111@gmail.com', '0828228339', 'd92903a9341a74f3f392281190a85a3d', '4', 1, NULL, NULL, NULL, 0, NULL, NULL, '2026-06-01 21:31:22', '96810c4715dd4599a73fe614a670678f54e8130bc56ce2e9ed98c495d8b8d9cd', 1, NULL, NULL, '2026-06-01 14:16:22', '0000-00-00 00:00:00', NULL, 0),
(45, 0, 0, NULL, 'hương', 'cuongmedi1123a@gmail.com', NULL, '0f50879016f1f063758b1274fef5f4df', '1', 99, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2026-06-01 15:44:19', '0000-00-00 00:00:00', NULL, 0),
(46, 0, 0, NULL, 'ngọc', 'huong@gmail.com', NULL, '1946dc15c589c9bf067e339c2de724a2', '5', 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2026-06-14 04:37:50', '0000-00-00 00:00:00', NULL, 0),
(47, 0, 0, NULL, 'Vũ Xuân Cương', 'vxcuong123@gmail.com', '0828228339', '8869844c9e32a11a18bdce774c80cc15', '4', 1, NULL, NULL, NULL, 0, NULL, NULL, '2026-06-15 22:17:14', '', 1, NULL, NULL, '2026-06-15 15:02:14', '2026-07-25 01:35:11', NULL, 0),
(48, 7, 0, 'SV000001', 'Phan Hùng Phúc', 'vxcuong00@gmail.com', '0336579210', '7c51ccffcca62ef99cd0d117c21aa90f', '3', 1, '', '8ddb94780d4cdb5109069d367a350c5ce140011811561713299d0a653980c54c', '2026-06-25 11:55:15', 0, NULL, NULL, '2026-06-24 09:39:50', '', 1, NULL, NULL, '2026-06-23 15:02:11', '2026-06-25 11:50:15', NULL, 0),
(49, 0, 0, NULL, 'Nguyễn Thế Hoài', 'vxcuong0000@gmail.com', '0091231238', 'd92903a9341a74f3f392281190a85a3d', '4', 99, NULL, NULL, NULL, 0, NULL, NULL, '2026-06-28 22:33:49', '', 1, NULL, NULL, '2026-06-28 15:18:49', '0000-00-00 00:00:00', NULL, 0),
(50, 0, 0, NULL, 'Vũ Xuân Cương test', 'vxcuong01@gmail.com', '0828228339', '9b59cf81e2f8a1e510087ac7a0ea878c', '4', 1, NULL, NULL, NULL, 0, NULL, NULL, '2026-07-10 23:24:15', '', 1, NULL, NULL, '2026-07-06 13:55:22', '2026-07-06 22:36:05', NULL, 0),
(51, 8, 0, 'MSV1', 'Nguyễn Văn Lưu', 'MSV1@sv.cdkt', '', '970c8b7ee4ca5c40f27481febc5e3c07', '3', 1, '', NULL, NULL, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2026-07-06 13:57:59', '2026-07-06 20:57:59', NULL, 0),
(52, 0, 7, NULL, 'Nguyễn Trần Hữu Hà', 'vxcuong05@gmail.com', '0091231238', 'b53fd642921260d617e9eac6a26c4521', '2', 1, NULL, 'cee4134031d3b62352bfc5a7b12346ed70e2b61d3e6ef1b0232a95b070b55600', '2026-07-06 22:48:18', 0, NULL, NULL, '2026-07-06 21:15:39', '983f86fd0a01c254f1b8219616c1fbf96047299f5a5c6b9050c0fa80449ace0b', 1, NULL, NULL, '2026-07-06 14:00:39', '2026-07-06 22:43:18', NULL, 0),
(53, 2, 0, 'SV001', 'Vũ', 'vxcuong@gmail.com', '098939128', '08f1b7b6a6d45ba7a20b691aad1a2597', '3', 1, '', NULL, NULL, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2026-07-09 16:07:10', '2026-07-09 23:07:10', NULL, 0),
(54, 58, 0, 'SV050', 'Lý Thu Yến', 'sv050@example.com', '0935423978', 'af18f0139a1e6bcda817ab44fcaedf0c', '3', 1, '', NULL, NULL, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2026-07-09 16:18:01', '2026-07-09 23:18:01', NULL, 0),
(55, 0, 0, NULL, 'Hà Phú Quý', 'vxcuong03@gmail.com', '08643616497', 'c49b9c95a06ff1c4a450d21c320d835e', '4', 1, NULL, NULL, NULL, 0, NULL, NULL, '2026-07-10 22:54:29', '15a6baa2d5ea95988ab4e542802f19ad55a2abfcec0d8edf2e18501562519544', 1, NULL, NULL, '2026-07-10 15:39:29', '2026-08-02 20:57:56', NULL, 0),
(56, 0, 14, NULL, 'Trần Văn Nên', 'vxcuong02@gmail.com', '0291231231', 'd92903a9341a74f3f392281190a85a3d', '2', 1, NULL, NULL, NULL, 0, NULL, NULL, '2026-07-17 12:32:40', '', 1, NULL, NULL, '2026-07-17 05:17:40', '0000-00-00 00:00:00', NULL, 0),
(57, 0, 0, NULL, 'Vũ Xuân Cương Ứng viên', 'nguyenngocquangphuc@cdkontum.edu.vn', '0905053279', 'd92903a9341a74f3f392281190a85a3d', '4', 1, NULL, NULL, NULL, 0, NULL, NULL, '2026-07-17 15:45:35', '18502687a1ef1c72ad51dcf72578b425f8e023b8d9fd3101395f3cb5fdf6b164', 1, NULL, NULL, '2026-07-17 08:30:35', '0000-00-00 00:00:00', NULL, 0),
(58, 0, 0, NULL, 'Cương Vũ Xuân', 'vuxuancuong91138gl@gmail.com', '08643616497', 'd92903a9341a74f3f392281190a85a3d', '4', 1, NULL, NULL, NULL, 0, NULL, NULL, '2026-07-23 21:54:30', '5fce7329d48a6cd5f021fedd5755ed9c401808983a3bd2e15494f37838861999', 1, NULL, NULL, '2026-07-23 14:39:30', '0000-00-00 00:00:00', NULL, 0),
(59, 0, 0, NULL, 'Trần Thị Lan', 'lan.tran.hr@gmail.com', '0915678234', '4bb2b3127496db914b6bb058b9c9185f', '4', 1, NULL, NULL, NULL, 0, NULL, NULL, '2026-07-23 22:39:37', '80c3cbd25c1c60d819cd691a98121bf66be211a6fd0a52eefc6f54910b86f0c0', 1, NULL, NULL, '2026-07-23 15:24:37', '2026-07-25 01:19:36', NULL, 0),
(60, 0, 0, NULL, 'Công Hải', 'conghai724@gmail.com', '0353878958', '9a8291e01607c1b8c9f66c84d48f9fed', '5', 1, NULL, NULL, NULL, 0, NULL, NULL, '2026-07-23 22:43:13', '', 1, NULL, NULL, '2026-07-23 15:28:13', '2026-07-24 01:20:55', NULL, 0),
(61, 0, 0, NULL, 'Đỗ Quỳnh Nhi', 'quynhnhiz151@gmail.com', '0338110734', 'd593f0b3b1bbdddd76e5454e4d15dc8f', '4', 1, NULL, NULL, NULL, 0, NULL, NULL, '2026-07-23 22:47:55', '5f0a41d1d4d1729a37eb1fbffec20c927e3e8181f539d6ec15b3dade74ae179c', 1, NULL, NULL, '2026-07-23 15:32:55', '2026-07-23 23:13:56', NULL, 0),
(62, 0, 0, NULL, 'Lương Văn Sang', 'luongvấnng@gmail.com', '0987654322', '589c42e3235578c27b33bec576014f99', '4', 1, NULL, NULL, NULL, 0, NULL, NULL, '2026-07-23 23:00:10', '785d1dc2e438c3532d1c98ae92f6823731a5a78d71f03e32618e9198f01afd6c', 1, NULL, NULL, '2026-07-23 15:45:10', '0000-00-00 00:00:00', NULL, 0),
(63, 0, 0, NULL, 'Lương Văn Sang', 'luongvansang.cntt@gmail.com', '0987654322', 'd593f0b3b1bbdddd76e5454e4d15dc8f', '4', 1, NULL, NULL, NULL, 0, NULL, NULL, '2026-07-23 23:01:13', '7791c5a4c88c1cc81317a8f30cacf4e34f82e6fad93560d6259dde1dd587931a', 1, NULL, NULL, '2026-07-23 15:46:13', '2026-07-24 00:06:09', NULL, 0),
(64, 0, 0, NULL, 'Đỗ Trúc Quyên', 'dotrucquyen2810@gmail.com', '0333940715', 'd593f0b3b1bbdddd76e5454e4d15dc8f', '4', 1, NULL, NULL, NULL, 0, NULL, NULL, '2026-07-23 23:02:18', 'fb784bd3c0805ff1dde0d0efcad2c8e03fdee280a9603233857fb0667c7166f9', 1, NULL, NULL, '2026-07-23 15:47:18', '2026-07-24 00:20:59', NULL, 0),
(65, 0, 0, NULL, 'Phan Hoàng Anh', 'hoanganh@gmail.com', '0976543218', 'd593f0b3b1bbdddd76e5454e4d15dc8f', '4', 1, NULL, NULL, NULL, 0, NULL, NULL, '2026-07-23 23:03:04', '00638e12257f11141bf990cb65580c2c05219da1200db4a38d366ff5ade20515', 1, NULL, NULL, '2026-07-23 15:48:04', '2026-07-25 01:47:26', NULL, 0),
(66, 0, 0, NULL, 'Nguyễn Công Hải', 'conghai@gmail.com', '0353878958', '0e801956bb1525d6752b78ae69e18abd', '4', 1, NULL, NULL, NULL, 0, NULL, NULL, '2026-07-24 00:54:29', '4e2266e493815d7f2e15a43ee5a4258c0dfe0a7e4b17c0f3acbe4d7b7dae2c0f', 1, NULL, NULL, '2026-07-23 17:39:29', '0000-00-00 00:00:00', NULL, 0),
(67, 57, 0, 'SV049', 'Vũ Tuấn Hiếu', 'sv049@example.com', '0912009939', '93236fe7806fe411ef3786b453e803ff', '3', 1, '', NULL, NULL, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2026-07-23 18:45:20', '2026-07-24 01:45:20', NULL, 0),
(68, 0, 0, NULL, 'Lê Quốc Huy', 'lequochuy.dev@gmail.com', '0968234561', '01a9bf7ac45343e8532c475e94dd6d1f', '4', 1, NULL, NULL, NULL, 0, NULL, NULL, '2026-07-24 22:38:55', '3b0047399f79dba053d9721a37a69b61f312d2fa74916746e34f2d1f12f3f9f9', 1, NULL, NULL, '2026-07-24 15:23:55', '2026-07-25 01:25:21', NULL, 0),
(69, 0, 0, NULL, 'Đào Nguyễn Quốc Chân', 'chandaonguyen@gmail.com', '0839219271', 'd593f0b3b1bbdddd76e5454e4d15dc8f', '4', 1, NULL, NULL, NULL, 0, NULL, NULL, '2026-07-24 22:39:41', '16b4052b05eb36513c0145f39a0c0cefe966dab67782322c8d72272a3c51cb0c', 1, NULL, NULL, '2026-07-24 15:24:41', '2026-07-24 23:33:26', NULL, 0),
(70, 0, 0, NULL, 'NGUYỄN LÊ BẢO NGỌC', 'ngocbaole194@gmail.com', '0353878959', 'd593f0b3b1bbdddd76e5454e4d15dc8f', '4', 1, NULL, NULL, NULL, 0, NULL, NULL, '2026-07-24 22:40:22', '41f7a4f7f810134587e345350d09f302ec8e319c71cf3f8143be9d678e07d132', 1, NULL, NULL, '2026-07-24 15:25:22', '2026-07-24 23:56:08', NULL, 0),
(71, 0, 0, NULL, 'Nguyễn Văn Minh', 'nguyenvanminh95@gmail.com', '0983124567', 'd593f0b3b1bbdddd76e5454e4d15dc8f', '4', 1, NULL, NULL, NULL, 0, NULL, NULL, '2026-07-24 22:40:54', '797a566cde1923738fd766a1e9ed8c05e4f2d7a7d6ba2c8a84caf2b6285f9285', 1, NULL, NULL, '2026-07-24 15:25:54', '2026-07-25 00:51:34', NULL, 0),
(72, 0, 0, NULL, 'Nguyễn Minh Trang', 'minhtrang749@gmail.com', '034612 6612', 'd593f0b3b1bbdddd76e5454e4d15dc8f', '4', 1, NULL, NULL, NULL, 0, NULL, NULL, '2026-07-24 22:41:36', 'bd8008c37e4230c3926af4964cba8d977b43c2fa9b1ab7937f26b656f00d53ea', 1, NULL, NULL, '2026-07-24 15:26:36', '2026-07-24 23:12:07', NULL, 0),
(73, 0, 0, NULL, 'Hải Công', 'conghai123@gmail.com', '0987654321', '6b8a2ecadbb517c7a506d32d5c8f8ebf', '2', 1, NULL, NULL, NULL, 0, NULL, NULL, '2026-07-26 03:16:01', '951e7b96a220622033799f05da144361a0949434e50760fa3b9a4cb8c9239697', 0, NULL, NULL, '2026-07-25 20:01:01', '0000-00-00 00:00:00', NULL, 0),
(74, 0, 0, NULL, 'Hải Công', 'tunhaiz100@gmail.com', '0987654321', '6b8a2ecadbb517c7a506d32d5c8f8ebf', '2', 1, NULL, NULL, NULL, 0, NULL, NULL, '2026-07-26 03:17:39', '06a12297a95ad0dcf1d0657486bb66d5456e36d60d604fa5a5d7bcfff8191304', 0, NULL, NULL, '2026-07-25 20:02:39', '0000-00-00 00:00:00', NULL, 0),
(75, 0, 0, NULL, 'Nguyễn Văn Sơn', 'sonnv@gmail.com', '0956371789', 'd65ad7336051e96eabd7be0db43674a1', '4', 1, NULL, NULL, NULL, 0, NULL, NULL, '2026-08-02 19:59:55', '83b8c2763d1b73da325d6354043a67153831f00f06d88bdf3e6c493557f0222b', 0, NULL, NULL, '2026-08-02 12:44:55', '0000-00-00 00:00:00', NULL, 0),
(76, 0, 0, NULL, 'Nguyễn Văn Hà', 'hanv@gmail.com', '0963719679', 'd65ad7336051e96eabd7be0db43674a1', '4', 1, NULL, NULL, NULL, 0, NULL, NULL, '2026-08-02 20:28:29', '4e030eafcf8800b79e4fbe0f186d7fc9a819e238c15448d0a5a14a8602c7b98d', 0, NULL, NULL, '2026-08-02 13:13:29', '0000-00-00 00:00:00', NULL, 0),
(77, 0, 0, NULL, 'Nguyễn Thị Loan', 'loannt@gmail.com', '0828228330', 'd92903a9341a74f3f392281190a85a3d', '4', 1, NULL, NULL, NULL, 0, NULL, NULL, '2026-08-02 20:36:16', 'c1dce36c566d927bac831e9a1e8a1b8dae93d0acb1fd047462628bb881a96c04', 0, NULL, NULL, '2026-08-02 13:21:16', '0000-00-00 00:00:00', NULL, 0),
(78, 0, 0, 'dieubv', 'Bùi Văn Điều', 'dieubv@gmail.com', '0987654322', 'e10adc3949ba59abbe56e057f20f883e', '2', 1, NULL, NULL, NULL, 0, NULL, NULL, '2026-07-23 23:00:10', '785d1dc2e438c3532d1c98ae92f6823731a5a78d71f03e32618e9198f01afd6c', 1, NULL, NULL, '2026-07-23 15:45:10', '0000-00-00 00:00:00', NULL, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hicrm_user_category`
--

CREATE TABLE `hicrm_user_category` (
  `id` int(11) NOT NULL,
  `user_category_name` varchar(255) NOT NULL,
  `user_category_icon` varchar(255) NOT NULL,
  `user_category_class` varchar(255) NOT NULL,
  `user_category_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `hicrm_user_category`
--

INSERT INTO `hicrm_user_category` (`id`, `user_category_name`, `user_category_icon`, `user_category_class`, `user_category_status`) VALUES
(1, 'Thành viên', '', '', 1),
(2, 'Nhà tuyển dụng', '', '', 1),
(3, 'Sinh viên', '', '', 1),
(4, 'admintrator', '', '', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hicrm_user_groups`
--

CREATE TABLE `hicrm_user_groups` (
  `id` int(11) NOT NULL,
  `user_role_id` int(11) DEFAULT 0,
  `group_name` varchar(255) NOT NULL,
  `group_class` varchar(255) DEFAULT NULL,
  `group_icon` varchar(255) DEFAULT NULL,
  `group_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `hicrm_user_groups`
--

INSERT INTO `hicrm_user_groups` (`id`, `user_role_id`, `group_name`, `group_class`, `group_icon`, `group_status`) VALUES
(1, 0, 'Quản trị viên', 'primary', '', 1),
(5, 0, 'Biên tập viên', '', '', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hicrm_user_group_permissions`
--

CREATE TABLE `hicrm_user_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `hicrm_user_group_permissions`
--

INSERT INTO `hicrm_user_group_permissions` (`id`, `group_id`, `permission_id`) VALUES
(12, 1, 1),
(1, 1, 2),
(2, 1, 3),
(3, 1, 4),
(4, 1, 5),
(5, 1, 6),
(6, 1, 7),
(7, 1, 8),
(8, 1, 9),
(9, 1, 10),
(10, 1, 11),
(11, 1, 12),
(13, 1, 13),
(14, 1, 14),
(15, 5, 1),
(16, 5, 2),
(17, 5, 3),
(18, 5, 4),
(19, 5, 5),
(20, 5, 6),
(21, 5, 7),
(22, 5, 8),
(23, 5, 11),
(24, 5, 12),
(25, 5, 1576),
(26, 5, 1577),
(27, 5, 1578);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hicrm_user_role`
--

CREATE TABLE `hicrm_user_role` (
  `id` int(11) NOT NULL,
  `role_name` varchar(255) NOT NULL,
  `user_role_key` varchar(255) NOT NULL,
  `role_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `hicrm_user_role`
--

INSERT INTO `hicrm_user_role` (`id`, `role_name`, `user_role_key`, `role_status`) VALUES
(1, 'Quản lý tài khoản', '', 1),
(2, 'Phân quyền tài khoản', '', 1),
(3, 'Tin tức sự kiện', '', 1),
(4, 'Duyệt tin tức', '', 1),
(5, 'TT25', '', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hicrm_videos`
--

CREATE TABLE `hicrm_videos` (
  `id` int(11) NOT NULL,
  `video_name` varchar(255) NOT NULL,
  `video_employee` int(11) NOT NULL DEFAULT 0,
  `video_url` varchar(255) NOT NULL,
  `video_description` text NOT NULL,
  `video_status` int(11) NOT NULL DEFAULT 2,
  `video_created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `hicrm_videos`
--

INSERT INTO `hicrm_videos` (`id`, `video_name`, `video_employee`, `video_url`, `video_description`, `video_status`, `video_created_at`) VALUES
(1, 'ABC', 7, 'https://youtu.be/m4J3nlTnDh4?list=RDm4J3nlTnDh4', 'ABC', 99, '2026-06-14 13:12:56'),
(2, 'ABC', 0, 'https://youtu.be/m4J3nlTnDh4?list=RDm4J3nlTnDh4', 'ádasda', 1, '2026-06-14 22:18:45'),
(3, 'Hướng dẫn viết CV chuyên nghiệp và ấn tượng cho mọi ngành nghề', 0, 'https://youtu.be/m4J3nlTnDh4?list=RDm4J3nlTnDh4', 'Học cách thiết kế CV chuẩn ATS, làm nổi bật kinh nghiệm làm việc và thu hút nhà tuyển dụng ngay từ cái nhìn đầu tiên.', 1, '2026-07-06 22:21:36'),
(4, 'Top 10 câu hỏi phỏng vấn thường gặp và cách trả lời thông minh nhất', 0, 'https://youtu.be/liTvlCQt5lY?list=RDm4J3nlTnDh4&t=1', 'Chuẩn bị câu trả lời hoàn hảo cho các câu hỏi: Giới thiệu bản thân, Điểm mạnh/Điểm yếu, Tại sao chúng tôi nên tuyển bạn...', 1, '2026-07-06 22:21:36'),
(5, 'Kỹ năng thương lượng lương hiệu quả khi nhận Job Offer', 0, 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', 'Bí quyết giúp bạn đàm phán mức lương xứng đáng với năng lực mà không gây mất thiện cảm với nhà tuyển dụng.', 1, '2026-07-06 22:21:36'),
(6, 'Xây dựng thương hiệu cá nhân trên LinkedIn để tìm việc làm nghìn đô', 0, 'https://youtu.be/BtMEnjdwjQY?list=RDm4J3nlTnDh4', 'Tối ưu hồ sơ LinkedIn cá nhân, kết nối với headhunter và tiếp cận các cơ hội việc làm hấp dẫn tự động tìm đến bạn.', 1, '2026-07-06 22:21:36'),
(7, 'Lộ trình phát triển sự nghiệp cho sinh viên mới ra trường năm 2026', 0, 'https://youtu.be/ynU-jJE76CA?list=RDm4J3nlTnDh4', 'Những kỹ năng mềm quan trọng cần trang bị, cách làm quen với môi trường công sở và định hướng đi đường dài.', 1, '2026-07-06 22:21:36');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hicrm_website_active_sessions`
--

CREATE TABLE `hicrm_website_active_sessions` (
  `session_id` varchar(128) NOT NULL,
  `expires_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `hicrm_website_active_sessions`
--

INSERT INTO `hicrm_website_active_sessions` (`session_id`, `expires_at`, `updated_at`) VALUES
('4oifs5l0dlgtevaiomkj4l448g', '2026-08-08 15:52:05', '2026-08-08 15:47:05');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hicrm_website_visits`
--

CREATE TABLE `hicrm_website_visits` (
  `id` int(11) NOT NULL,
  `session_id` varchar(128) NOT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `page_url` varchar(500) DEFAULT NULL,
  `visit_date` date NOT NULL,
  `first_seen` datetime NOT NULL DEFAULT current_timestamp(),
  `last_seen` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `hicrm_website_visits`
--

INSERT INTO `hicrm_website_visits` (`id`, `session_id`, `ip_address`, `user_agent`, `page_url`, `visit_date`, `first_seen`, `last_seen`) VALUES
(1, '7lfdt3o74v4qcqb4n0i0o9k22o', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '/vieclam.vn/quan-ly-viec-lam.html?page=3&rt=quan-ly-viec-lam.html', '2026-06-22', '2026-06-22 22:09:52', '2026-06-22 22:18:21'),
(2, 'utd43rsstckd1lrvjkev23n0eh', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '/vieclam.vn/', '2026-06-23', '2026-06-23 09:24:32', '2026-06-23 09:24:32'),
(3, 't6toc0bs40278caa2cm6bljtcl', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '/vieclam.vn/', '2026-06-23', '2026-06-23 21:38:17', '2026-06-23 21:38:17'),
(4, 'cktk97tced3f5mi768vio08lsr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '/vieclam.vn/', '2026-06-23', '2026-06-23 21:38:28', '2026-06-23 21:39:41'),
(5, '062jdaj3gbe27d5tia2gh389g0', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '/vieclam.vn/san-viec-lam-online.html', '2026-06-23', '2026-06-23 22:12:46', '2026-06-23 22:15:02'),
(6, 'liml8u4566s79l5f3tf40rub1n', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '/vieclam.vn/', '2026-06-24', '2026-06-24 08:38:17', '2026-06-24 08:52:57'),
(7, '4q9ail2ntqpfj2jhfa8iqm39q6', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '/vieclam.vn/', '2026-06-24', '2026-06-24 09:03:27', '2026-06-24 09:23:30'),
(8, '2709foa7ra6k33pfl5sdfu0ou0', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '/vieclam.vn/', '2026-06-24', '2026-06-24 09:24:03', '2026-06-24 09:26:10'),
(9, '09dqbr81mth6h34psfbrv5u6nk', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '/vieclam.vn/', '2026-06-24', '2026-06-24 09:24:22', '2026-06-24 09:24:22'),
(10, 'ld3fjfjlo9hpaorg4hdk9ef2qg', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '/vieclam.vn/quan-ly-ho-so-ung-vien.html', '2026-06-24', '2026-06-24 09:26:34', '2026-06-24 10:10:06'),
(11, 'e13resutl07vsq5m311eeu7ntn', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '/vieclam.vn/', '2026-06-25', '2026-06-25 09:44:34', '2026-06-25 09:44:44'),
(12, 'bm18d52e0vpp9es9obnlbs0boc', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '/vieclam.vn/quan-ly-nha-tuyen-dung.html', '2026-06-25', '2026-06-25 09:45:11', '2026-06-25 12:17:44'),
(13, '2mi2vm70ifhg17fkf98vm2scl6', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '/vieclam.vn/quen-mat-khau.php', '2026-06-25', '2026-06-25 11:15:51', '2026-06-25 11:25:11'),
(14, '2rmrv5l1l0rduvsk82rk3aph2v', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '/vieclam.vn/', '2026-06-25', '2026-06-25 14:23:33', '2026-06-25 14:25:03'),
(15, '7sa00gvfi6jcnih1q9o65i2avp', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '/vieclam.vn/chi-tiet-ung-vien/1-cuong-vu-xuan.html', '2026-06-25', '2026-06-25 14:25:26', '2026-06-25 16:50:44'),
(16, 'efpkodqf9atcl5igc48hev9aub', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '/vieclam.vn/', '2026-06-25', '2026-06-25 14:45:45', '2026-06-25 16:42:31'),
(17, 'p0ad04hq1ieiq30reqt1cqheq8', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '/vieclam.vn/', '2026-06-28', '2026-06-28 13:39:00', '2026-06-28 13:39:00'),
(18, 'n0qdqk6jajv2u03b0i1r7gfthp', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '/vieclam.vn/', '2026-06-28', '2026-06-28 13:53:41', '2026-06-28 14:37:49'),
(19, 'ncrm1shep8hriddvehi54hdlr4', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '/vieclam.vn/template/backend/assets/css/admin-responsive.css?v=1783355098', '2026-07-06', '2026-07-06 22:43:25', '2026-07-06 23:24:59'),
(60, 'mm0tdvdfhi3g02qc0n0k9jmo9q', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '/vieclam.vn/template/backend/assets/css/admin-responsive.css?v=1783614591', '2026-07-09', '2026-07-09 22:23:07', '2026-07-09 23:29:51'),
(178, '7o2huut0dqsfv9tkioeoo4h9vc', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '/vieclam.vn/tai-khoan-chua-xac-thuc.html', '2026-07-10', '2026-07-10 21:49:23', '2026-07-10 22:59:06'),
(179, 'gto3jvir7egdshqc5uo0ot994r', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '/vieclam.vn/quan-ly-viec-lam.html?keyword=Nh%C3%A2n+vi%C3%AAn+v%E1%BA%ADn+t%E1%BA%A3i+t%E1%BA%A1i+Gia+Lai&province_id=&job_category_id=&salary_id=&work_type=&post_type=', '2026-07-10', '2026-07-10 21:57:30', '2026-07-10 23:57:12'),
(180, 't8uuhcl7tl61ouas2o6bsbmvt4', '::1', 'TelegramBot (like TwitterBot)', '/vieclam.vn/', '2026-07-10', '2026-07-10 21:57:47', '2026-07-10 21:57:47'),
(181, 'eb565n3hqpktbshlon717hutfe', '::1', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Mobile Safari/537.36', '/vieclam.vn/chi-tiet-viec-lam/67-content-creator.html', '2026-07-10', '2026-07-10 21:58:04', '2026-07-10 22:51:13'),
(198, 'vqa4j2d3rsqksa0l81cr68t2iq', '::1', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Mobile Safari/537.36 (compatible; Google-Read-Aloud; +https://support.google.com/webmasters/answer/1061943)', '/vieclam.vn/tin-tuc-su-kien/17-bien-the-covid19-ba32-ve-sau-co-dang-lo-ngai.html', '2026-07-10', '2026-07-10 22:06:56', '2026-07-10 22:06:56'),
(199, 'rqu9fvq7cvjuqpd92855gjqm69', '::1', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Mobile Safari/537.36 (compatible; Google-Read-Aloud; +https://support.google.com/webmasters/answer/1061943)', '/vieclam.vn/tin-tuc-su-kien/17-bien-the-covid19-ba32-ve-sau-co-dang-lo-ngai.html', '2026-07-10', '2026-07-10 22:06:57', '2026-07-10 22:06:57'),
(200, 'fee38scb5kq45c5n9090pvvle9', '::1', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Mobile Safari/537.36 (compatible; Google-Read-Aloud; +https://support.google.com/webmasters/answer/1061943)', '/vieclam.vn/tin-tuc-su-kien/17-bien-the-covid19-ba32-ve-sau-co-dang-lo-ngai.html', '2026-07-10', '2026-07-10 22:06:57', '2026-07-10 22:06:57'),
(289, 'b8vueu6gcel7ca6vmf8fmum6tr', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '/vieclam.vn/template/backend/assets/css/admin-responsive.css?v=1783702519', '2026-07-10', '2026-07-10 23:22:20', '2026-07-10 23:55:20'),
(316, 'f5g58c8n4m250mkqk543eiddhs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '/vieclam.vn/chi-tiet-ung-vien/5-vu-xuan-cuong-test.html', '2026-07-10', '2026-07-10 23:56:01', '2026-07-11 00:06:24'),
(329, 'cfsv4inhr9mfdshb6lkvt1ksea', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '/vieclam.vn/', '2026-07-12', '2026-07-12 14:42:06', '2026-07-12 14:42:06'),
(330, 'qroc7i8vv4nneue1sttlmlen9v', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '/vieclam.vn/tin-tuc-su-kien.html', '2026-07-12', '2026-07-12 14:44:56', '2026-07-12 15:33:23'),
(348, '1emhimbaqf5je9t9v9s0ma06v6', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '/vieclam.vn/', '2026-07-13', '2026-07-13 08:38:31', '2026-07-13 12:19:42'),
(350, '7ini4chgfi4or5tak15lcj7o8a', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '/vieclam.vn/uploads/candidate-profiles/avatar_2_20260621091136_6a37485846d4e.jpg', '2026-07-13', '2026-07-13 08:47:38', '2026-07-13 16:37:24'),
(365, 'uno4qsu1im5pfaul88k53qot11', '::1', 'TelegramBot (like TwitterBot)', '/vieclam.vn/', '2026-07-13', '2026-07-13 09:19:06', '2026-07-13 09:19:06'),
(366, '28pqa57tiev97hjinodhckstg0', '::1', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Mobile Safari/537.36', '/vieclam.vn/', '2026-07-13', '2026-07-13 09:19:16', '2026-07-13 09:44:58'),
(367, 'joohn7a8aimrbpinrjbngb4grk', '::1', 'WhatsApp/2', '/vieclam.vn/', '2026-07-13', '2026-07-13 09:19:20', '2026-07-13 09:19:20'),
(383, '0u08j20ra6emlq228pek53p3e2', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '/vieclam.vn/san-viec-lam-online.html', '2026-07-13', '2026-07-13 09:46:48', '2026-07-13 09:48:30'),
(384, '6ojdnkhh8cl6vthhsiki9tii2f', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '/vieclam.vn/gioi-thieu.html', '2026-07-13', '2026-07-13 09:46:48', '2026-07-13 09:47:14'),
(385, 'hgfum2are9lviisbknuj7tmum0', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '/vieclam.vn/gioi-thieu.html', '2026-07-13', '2026-07-13 09:46:48', '2026-07-13 09:47:29'),
(386, 'grqfqoma46jhctui9g5nccb78a', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '/vieclam.vn/', '2026-07-13', '2026-07-13 09:46:49', '2026-07-13 09:46:49'),
(395, 'iihgenplep16fsfll40qi3l9du', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '/vieclam.vn/', '2026-07-13', '2026-07-13 09:47:40', '2026-07-13 09:47:40'),
(397, 'eo9ebbvbp50fio0qbfut202tlg', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '/vieclam.vn/quan-ly-viec-lam.html', '2026-07-13', '2026-07-13 09:47:45', '2026-07-13 09:47:45'),
(399, 'cbfpj8jjeucmfag5g8mhq016u8', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '/vieclam.vn/quan-ly-ung-vien.html', '2026-07-13', '2026-07-13 09:47:49', '2026-07-13 09:47:49'),
(401, 'uusfvfppg0v6vfj3kpro0o978n', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '/vieclam.vn/gioi-thieu-san-viec-lam.html', '2026-07-13', '2026-07-13 09:48:00', '2026-07-13 09:48:00'),
(403, 'tg3hv23dn8lnpimt7qriinli2h', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '/vieclam.vn/ket-qua-san-viec-lam.html', '2026-07-13', '2026-07-13 09:48:13', '2026-07-13 09:48:13'),
(405, 'f9h3896lrl7snuq0om4m8ntane', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '/vieclam.vn/ket-qua-san-viec-lam/1-ket-qua-san-dot-1.html', '2026-07-13', '2026-07-13 09:48:20', '2026-07-13 09:48:20'),
(407, 'kaanafnfti2joiffdotjami12f', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '/vieclam.vn/san-viec-lam-online.html', '2026-07-13', '2026-07-13 09:48:30', '2026-07-13 09:48:30'),
(408, '1r570kcudc2enrc6b1pi6t391d', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '/vieclam.vn/tin-tuc-su-kien.html', '2026-07-13', '2026-07-13 09:49:38', '2026-07-13 09:56:24'),
(412, 'ohiajo0plnpfjbq94b1l28tp11', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0', '/vieclam.vn/', '2026-07-13', '2026-07-13 09:51:41', '2026-07-13 14:33:13'),
(433, 'j60j43if908fp78ibipafcmpb1', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', '/vieclam.vn/', '2026-07-13', '2026-07-13 11:23:44', '2026-07-13 11:23:44'),
(443, '2ldl3f4lam3m341b6dg07d99at', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '/vieclam.vn/uploads/candidate-profiles/avatar_2_20260621091136_6a37485846d4e.jpg', '2026-07-13', '2026-07-13 12:18:19', '2026-07-13 12:26:19'),
(463, '12j3lgbquemb2ig2gssk1btidi', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', '/vieclam.vn/', '2026-07-13', '2026-07-13 12:27:30', '2026-07-13 12:27:30'),
(513, 'apaop97bnbi5i3rnafq1lsmohp', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '/vieclam.vn/tin-tuc-su-kien.html', '2026-07-13', '2026-07-13 15:42:09', '2026-07-13 16:04:21'),
(518, '8fu1llit8ms6snt8am953kggrb', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', '/vieclam.vn/', '2026-07-13', '2026-07-13 16:19:46', '2026-07-13 16:19:46'),
(521, 's37qj3on66trr8v0td7q91ceo9', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '/vieclam.vn/template/backend/assets/css/admin-responsive.css?v=1783960388', '2026-07-13', '2026-07-13 20:55:03', '2026-07-13 23:33:08'),
(527, '2ooqr83qatkat44pqugalvhcea', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '/vieclam.vn/quan-ly-viec-lam.html', '2026-07-13', '2026-07-13 22:12:10', '2026-07-13 22:12:24'),
(530, '8u09spjn8b1sbbm4qmpuq5o1rf', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '/vieclam.vn/template/backend/assets/css/admin-responsive.css?v=1783960324', '2026-07-13', '2026-07-13 22:12:39', '2026-07-13 23:32:04'),
(538, '76npqpaljih57j8lemb88e1g6o', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '/vieclam.vn/', '2026-07-13', '2026-07-13 22:18:25', '2026-07-13 22:19:41'),
(544, '2umhq6fltt734qeh1rm207ns4g', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '/vieclam.vn/', '2026-07-13', '2026-07-13 22:21:52', '2026-07-13 22:21:52'),
(562, 'os4bicikb0a26abdrot9e80po3', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '/vieclam.vn/', '2026-07-13', '2026-07-13 22:41:18', '2026-07-13 22:41:18'),
(568, '3n2dn4gh8njsvo391b0kb1jgnl', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '/vieclam.vn/quan-ly-viec-lam.html?province_id=22', '2026-07-13', '2026-07-13 22:43:47', '2026-07-13 22:44:14'),
(624, '34rsk6n4ha8en2ik10gq9gu709', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '/vieclam.vn/', '2026-07-14', '2026-07-14 07:59:51', '2026-07-14 10:41:44'),
(626, 'j7hipks4sqrvm6ghmrgc4nql64', '::1', 'WhatsApp/2', '/vieclam.vn/', '2026-07-14', '2026-07-14 08:00:08', '2026-07-14 08:00:08'),
(627, 'isqg0ieo1131i4ra8esvuvd4qf', '::1', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Mobile Safari/537.36', '/vieclam.vn/?zarsrc=31&utm_source=zalo&utm_medium=zalo&utm_campaign=zalo&gidzl=I8eC4Ifradz9aGKM96YQSK2I11qxO9KYNPnM6MflaI4Abm4RQMkISmN2LaurQPOe1PO1G3TLogPUB7MUVG', '2026-07-14', '2026-07-14 08:04:45', '2026-07-14 08:04:45'),
(628, '6f4dpii1qc4nveipnoa3184hf3', '::1', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Mobile Safari/537.36', '/vieclam.vn/', '2026-07-14', '2026-07-14 08:07:16', '2026-07-14 08:07:16'),
(629, '38ce3nlmssi23k0vmcaj3o7ilu', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36 Edg/150.0.0.0', '/vieclam.vn/', '2026-07-14', '2026-07-14 08:59:20', '2026-07-14 09:04:40'),
(646, '29dcopagfem5kmhcirob849sld', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', '/vieclam.vn/', '2026-07-14', '2026-07-14 10:11:23', '2026-07-14 10:11:23'),
(649, 'gkcp319aeoqre4rt7cni9324bq', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '/vieclam.vn/uploads/candidate-profiles/avatar_2_20260621091136_6a37485846d4e.jpg', '2026-07-14', '2026-07-14 10:45:18', '2026-07-14 10:45:50'),
(651, '754pofdnt34i4l756fe3rfclhg', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', '/vieclam.vn/', '2026-07-14', '2026-07-14 11:27:22', '2026-07-14 11:27:22'),
(652, 'e578k2rrvp5opffobkdrv5hgf2', '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', '/vieclam.vn/', '2026-07-14', '2026-07-14 12:20:36', '2026-07-14 12:20:36'),
(653, '793m2svm3ev6ulivas4qalfavs', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '/vieclam.vn/', '2026-07-14', '2026-07-14 15:14:24', '2026-07-14 15:14:24'),
(654, '8rdkuhqe8lg80tgq5spo2a3766', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '/vieclam.vn/template/backend/assets/css/admin-responsive.css?v=1784046171', '2026-07-14', '2026-07-14 23:22:07', '2026-07-14 23:22:51'),
(660, 'hibbclturhnqgett31aaadom8e', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '/vieclam.vn/uploads/candidate-profiles/avatar_2_20260621091136_6a37485846d4e.jpg', '2026-07-15', '2026-07-15 13:19:21', '2026-07-15 13:19:41');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hicrm_website_visit_daily`
--

CREATE TABLE `hicrm_website_visit_daily` (
  `visit_date` date NOT NULL,
  `visit_count` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `hicrm_website_visit_daily`
--

INSERT INTO `hicrm_website_visit_daily` (`visit_date`, `visit_count`, `updated_at`) VALUES
('2026-06-22', 1, '2026-07-15 13:30:45'),
('2026-06-23', 4, '2026-07-15 13:30:45'),
('2026-06-24', 5, '2026-07-15 13:30:45'),
('2026-06-25', 6, '2026-07-15 13:30:45'),
('2026-06-28', 2, '2026-07-15 13:30:45'),
('2026-07-06', 1, '2026-07-15 13:30:45'),
('2026-07-09', 1, '2026-07-15 13:30:45'),
('2026-07-10', 9, '2026-07-15 13:30:45'),
('2026-07-12', 2, '2026-07-15 13:30:45'),
('2026-07-13', 30, '2026-07-15 13:30:45'),
('2026-07-14', 11, '2026-07-15 13:30:45'),
('2026-07-15', 2, '2026-07-15 13:32:03'),
('2026-07-17', 21, '2026-07-17 16:13:28'),
('2026-07-19', 1, '2026-07-19 15:28:56'),
('2026-07-21', 3, '2026-07-21 22:16:23'),
('2026-07-22', 3, '2026-07-22 21:23:43'),
('2026-07-23', 15, '2026-07-23 23:47:01'),
('2026-07-24', 23, '2026-07-24 23:59:34'),
('2026-07-25', 20, '2026-07-25 21:43:25'),
('2026-07-26', 16, '2026-07-26 03:50:01'),
('2026-07-27', 2, '2026-07-27 11:25:06'),
('2026-08-02', 3, '2026-08-02 20:12:27'),
('2026-08-08', 1, '2026-08-08 15:41:20');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hicrm_website_visit_stats`
--

CREATE TABLE `hicrm_website_visit_stats` (
  `stat_key` varchar(50) NOT NULL,
  `stat_value` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `hicrm_website_visit_stats`
--

INSERT INTO `hicrm_website_visit_stats` (`stat_key`, `stat_value`, `updated_at`) VALUES
('total_visits', 182, '2026-08-08 15:41:20');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `system_otp`
--

CREATE TABLE `system_otp` (
  `id` bigint(20) NOT NULL,
  `otp_code` varchar(6) NOT NULL,
  `otp_uid` bigint(20) NOT NULL,
  `otp_exp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `system_otp`
--

INSERT INTO `system_otp` (`id`, `otp_code`, `otp_uid`, `otp_exp`) VALUES
(1, '569780', 6, '2021-04-05 12:55:12'),
(2, '364651', 6, '2021-04-05 13:13:13'),
(3, '729103', 6, '2021-04-05 13:13:17'),
(4, '857710', 6, '2021-04-05 13:14:11'),
(5, '114226', 6, '2021-04-05 13:15:03'),
(6, '093488', 6, '2021-04-05 13:36:13'),
(7, '755674', 6, '2021-04-05 13:39:02'),
(8, '276816', 6, '2021-04-05 13:41:20'),
(9, '390663', 6, '2021-04-05 17:03:14'),
(10, '203970', 6, '2021-04-05 17:03:17');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `system_page`
--

CREATE TABLE `system_page` (
  `page_type` int(11) NOT NULL,
  `page_content` longtext NOT NULL,
  `page_uid` int(11) NOT NULL,
  `page_status` int(11) NOT NULL,
  `page_created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `system_page`
--

INSERT INTO `system_page` (`page_type`, `page_content`, `page_uid`, `page_status`, `page_created_date`) VALUES
(1, '', 0, 0, '2025-12-28 07:58:34'),
(2, '', 1, 1, '2025-12-28 07:58:55');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `hicrm_accounts`
--
ALTER TABLE `hicrm_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `hicrm_admin_menu_permissions`
--
ALTER TABLE `hicrm_admin_menu_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_permission_key` (`permission_key`);

--
-- Chỉ mục cho bảng `hicrm_banks`
--
ALTER TABLE `hicrm_banks`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `hicrm_bank_accounts`
--
ALTER TABLE `hicrm_bank_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `hicrm_bookings`
--
ALTER TABLE `hicrm_bookings`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `hicrm_booking_status`
--
ALTER TABLE `hicrm_booking_status`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `hicrm_candidates`
--
ALTER TABLE `hicrm_candidates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD KEY `idx_user` (`user_id`),
  ADD KEY `idx_province` (`province_id`),
  ADD KEY `idx_desired_province` (`desired_province_id`),
  ADD KEY `idx_seeking` (`is_seeking`),
  ADD KEY `desired_salary` (`desired_salary`),
  ADD KEY `idx_major` (`major`);

--
-- Chỉ mục cho bảng `hicrm_candidate_certificates`
--
ALTER TABLE `hicrm_candidate_certificates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_candidate` (`candidate_id`);

--
-- Chỉ mục cho bảng `hicrm_candidate_experiences`
--
ALTER TABLE `hicrm_candidate_experiences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_candidate` (`candidate_id`);

--
-- Chỉ mục cho bảng `hicrm_categories`
--
ALTER TABLE `hicrm_categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `hicrm_configs`
--
ALTER TABLE `hicrm_configs`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `hicrm_customers`
--
ALTER TABLE `hicrm_customers`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `hicrm_customer_banks`
--
ALTER TABLE `hicrm_customer_banks`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `hicrm_customer_feedback`
--
ALTER TABLE `hicrm_customer_feedback`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `hicrm_customer_groups`
--
ALTER TABLE `hicrm_customer_groups`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `hicrm_departments`
--
ALTER TABLE `hicrm_departments`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `hicrm_district`
--
ALTER TABLE `hicrm_district`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `district_code` (`district_code`),
  ADD KEY `idx_province_id` (`province_id`);

--
-- Chỉ mục cho bảng `hicrm_employers`
--
ALTER TABLE `hicrm_employers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_job_categories` (`job_category_id`),
  ADD KEY `idx_province` (`province_id`),
  ADD KEY `idx_verified` (`verified_status`);

--
-- Chỉ mục cho bảng `hicrm_employers_old`
--
ALTER TABLE `hicrm_employers_old`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_job_categories` (`job_category_id`),
  ADD KEY `idx_province` (`province_id`),
  ADD KEY `idx_verified` (`verified_status`);

--
-- Chỉ mục cho bảng `hicrm_events`
--
ALTER TABLE `hicrm_events`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `hicrm_event_comments`
--
ALTER TABLE `hicrm_event_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_event_status_created` (`event_id`,`status`,`created_at`),
  ADD KEY `idx_status_created` (`status`,`created_at`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `hicrm_event_type`
--
ALTER TABLE `hicrm_event_type`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `hicrm_google_meets`
--
ALTER TABLE `hicrm_google_meets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_employer_id` (`employer_id`),
  ADD KEY `idx_job_post_id` (`job_post_id`),
  ADD KEY `idx_meeting_time` (`meeting_time`),
  ADD KEY `idx_status` (`status`);

--
-- Chỉ mục cho bảng `hicrm_images`
--
ALTER TABLE `hicrm_images`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `hicrm_introduce`
--
ALTER TABLE `hicrm_introduce`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `hicrm_job_applications`
--
ALTER TABLE `hicrm_job_applications`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_candidate_job` (`candidate_id`,`job_post_id`),
  ADD KEY `idx_job_post` (`job_post_id`),
  ADD KEY `idx_status` (`status`);

--
-- Chỉ mục cho bảng `hicrm_job_categories`
--
ALTER TABLE `hicrm_job_categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `hicrm_job_posts`
--
ALTER TABLE `hicrm_job_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employer_id` (`employer_id`),
  ADD KEY `job_category_id` (`job_category_id`),
  ADD KEY `province_id` (`province_id`),
  ADD KEY `salary_id` (`salary_id`),
  ADD KEY `candidate_id` (`candidate_id`);

--
-- Chỉ mục cho bảng `hicrm_job_posts_old`
--
ALTER TABLE `hicrm_job_posts_old`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employer_id` (`employer_id`),
  ADD KEY `job_category_id` (`job_category_id`),
  ADD KEY `province_id` (`province_id`),
  ADD KEY `salary_id` (`salary_id`),
  ADD KEY `candidate_id` (`candidate_id`);

--
-- Chỉ mục cho bảng `hicrm_job_support_requests`
--
ALTER TABLE `hicrm_job_support_requests`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_job_support_session` (`session_id`),
  ADD KEY `idx_job_support_job` (`job_id`),
  ADD KEY `idx_job_support_phone` (`phone`),
  ADD KEY `idx_job_support_created` (`created_at`);

--
-- Chỉ mục cho bảng `hicrm_market_results`
--
ALTER TABLE `hicrm_market_results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_result_status_date` (`result_status`,`result_date`),
  ADD KEY `idx_created_by` (`created_by`);

--
-- Chỉ mục cho bảng `hicrm_news`
--
ALTER TABLE `hicrm_news`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `hicrm_news_categories`
--
ALTER TABLE `hicrm_news_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Chỉ mục cho bảng `hicrm_news_comments`
--
ALTER TABLE `hicrm_news_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_news_id` (`news_id`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_parent_id` (`parent_id`),
  ADD KEY `idx_comment_status` (`comment_status`);

--
-- Chỉ mục cho bảng `hicrm_orders`
--
ALTER TABLE `hicrm_orders`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `hicrm_order_details`
--
ALTER TABLE `hicrm_order_details`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `hicrm_permissions`
--
ALTER TABLE `hicrm_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `hicrm_permission_datas`
--
ALTER TABLE `hicrm_permission_datas`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `hicrm_positions`
--
ALTER TABLE `hicrm_positions`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `hicrm_products`
--
ALTER TABLE `hicrm_products`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `hicrm_products_bk`
--
ALTER TABLE `hicrm_products_bk`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `hicrm_product_warehouses`
--
ALTER TABLE `hicrm_product_warehouses`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `hicrm_promotions`
--
ALTER TABLE `hicrm_promotions`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `hicrm_provinces`
--
ALTER TABLE `hicrm_provinces`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `province_code` (`province_code`);

--
-- Chỉ mục cho bảng `hicrm_salary`
--
ALTER TABLE `hicrm_salary`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `hicrm_service`
--
ALTER TABLE `hicrm_service`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `hicrm_staff`
--
ALTER TABLE `hicrm_staff`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `hicrm_static_pages`
--
ALTER TABLE `hicrm_static_pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_page_slug` (`page_slug`);

--
-- Chỉ mục cho bảng `hicrm_static_page_categories`
--
ALTER TABLE `hicrm_static_page_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_slug` (`category_slug`);

--
-- Chỉ mục cho bảng `hicrm_status`
--
ALTER TABLE `hicrm_status`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `hicrm_student_profile`
--
ALTER TABLE `hicrm_student_profile`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_major_id` (`student_major_id`);

--
-- Chỉ mục cho bảng `hicrm_support_requests`
--
ALTER TABLE `hicrm_support_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_status` (`status`);

--
-- Chỉ mục cho bảng `hicrm_templates`
--
ALTER TABLE `hicrm_templates`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `hicrm_template_types`
--
ALTER TABLE `hicrm_template_types`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `hicrm_tt25_categories`
--
ALTER TABLE `hicrm_tt25_categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `hicrm_tt25_requests`
--
ALTER TABLE `hicrm_tt25_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_created_at` (`created_at`),
  ADD KEY `idx_search` (`fullname`,`cccd`,`phone`,`email`);

--
-- Chỉ mục cho bảng `hicrm_type`
--
ALTER TABLE `hicrm_type`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `hicrm_users`
--
ALTER TABLE `hicrm_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_department` (`user_department`);

--
-- Chỉ mục cho bảng `hicrm_users_old-1`
--
ALTER TABLE `hicrm_users_old-1`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Chỉ mục cho bảng `hicrm_user_category`
--
ALTER TABLE `hicrm_user_category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `hicrm_user_groups`
--
ALTER TABLE `hicrm_user_groups`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `hicrm_user_group_permissions`
--
ALTER TABLE `hicrm_user_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_group_permission` (`group_id`,`permission_id`),
  ADD KEY `idx_group_id` (`group_id`),
  ADD KEY `idx_permission_id` (`permission_id`);

--
-- Chỉ mục cho bảng `hicrm_user_role`
--
ALTER TABLE `hicrm_user_role`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `hicrm_videos`
--
ALTER TABLE `hicrm_videos`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `hicrm_website_active_sessions`
--
ALTER TABLE `hicrm_website_active_sessions`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `idx_expires_at` (`expires_at`);

--
-- Chỉ mục cho bảng `hicrm_website_visits`
--
ALTER TABLE `hicrm_website_visits`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_session` (`session_id`),
  ADD KEY `idx_visit_date` (`visit_date`),
  ADD KEY `idx_last_seen` (`last_seen`);

--
-- Chỉ mục cho bảng `hicrm_website_visit_daily`
--
ALTER TABLE `hicrm_website_visit_daily`
  ADD PRIMARY KEY (`visit_date`);

--
-- Chỉ mục cho bảng `hicrm_website_visit_stats`
--
ALTER TABLE `hicrm_website_visit_stats`
  ADD PRIMARY KEY (`stat_key`);

--
-- Chỉ mục cho bảng `system_otp`
--
ALTER TABLE `system_otp`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `hicrm_accounts`
--
ALTER TABLE `hicrm_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;

--
-- AUTO_INCREMENT cho bảng `hicrm_admin_menu_permissions`
--
ALTER TABLE `hicrm_admin_menu_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9901;

--
-- AUTO_INCREMENT cho bảng `hicrm_banks`
--
ALTER TABLE `hicrm_banks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT cho bảng `hicrm_bank_accounts`
--
ALTER TABLE `hicrm_bank_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `hicrm_bookings`
--
ALTER TABLE `hicrm_bookings`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT cho bảng `hicrm_booking_status`
--
ALTER TABLE `hicrm_booking_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `hicrm_candidates`
--
ALTER TABLE `hicrm_candidates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT cho bảng `hicrm_candidate_certificates`
--
ALTER TABLE `hicrm_candidate_certificates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT cho bảng `hicrm_candidate_experiences`
--
ALTER TABLE `hicrm_candidate_experiences`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT cho bảng `hicrm_categories`
--
ALTER TABLE `hicrm_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `hicrm_configs`
--
ALTER TABLE `hicrm_configs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT cho bảng `hicrm_customers`
--
ALTER TABLE `hicrm_customers`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT cho bảng `hicrm_customer_banks`
--
ALTER TABLE `hicrm_customer_banks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `hicrm_customer_feedback`
--
ALTER TABLE `hicrm_customer_feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `hicrm_customer_groups`
--
ALTER TABLE `hicrm_customer_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT cho bảng `hicrm_departments`
--
ALTER TABLE `hicrm_departments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `hicrm_district`
--
ALTER TABLE `hicrm_district`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3322;

--
-- AUTO_INCREMENT cho bảng `hicrm_employers_old`
--
ALTER TABLE `hicrm_employers_old`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT cho bảng `hicrm_events`
--
ALTER TABLE `hicrm_events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT cho bảng `hicrm_event_comments`
--
ALTER TABLE `hicrm_event_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `hicrm_event_type`
--
ALTER TABLE `hicrm_event_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `hicrm_google_meets`
--
ALTER TABLE `hicrm_google_meets`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `hicrm_images`
--
ALTER TABLE `hicrm_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT cho bảng `hicrm_introduce`
--
ALTER TABLE `hicrm_introduce`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `hicrm_job_applications`
--
ALTER TABLE `hicrm_job_applications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `hicrm_job_categories`
--
ALTER TABLE `hicrm_job_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT cho bảng `hicrm_job_posts_old`
--
ALTER TABLE `hicrm_job_posts_old`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;

--
-- AUTO_INCREMENT cho bảng `hicrm_job_support_requests`
--
ALTER TABLE `hicrm_job_support_requests`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `hicrm_market_results`
--
ALTER TABLE `hicrm_market_results`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `hicrm_news`
--
ALTER TABLE `hicrm_news`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `hicrm_news_categories`
--
ALTER TABLE `hicrm_news_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `hicrm_news_comments`
--
ALTER TABLE `hicrm_news_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `hicrm_orders`
--
ALTER TABLE `hicrm_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `hicrm_order_details`
--
ALTER TABLE `hicrm_order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `hicrm_permissions`
--
ALTER TABLE `hicrm_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `hicrm_permission_datas`
--
ALTER TABLE `hicrm_permission_datas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT cho bảng `hicrm_positions`
--
ALTER TABLE `hicrm_positions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `hicrm_products`
--
ALTER TABLE `hicrm_products`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `hicrm_products_bk`
--
ALTER TABLE `hicrm_products_bk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `hicrm_product_warehouses`
--
ALTER TABLE `hicrm_product_warehouses`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `hicrm_promotions`
--
ALTER TABLE `hicrm_promotions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `hicrm_provinces`
--
ALTER TABLE `hicrm_provinces`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT cho bảng `hicrm_salary`
--
ALTER TABLE `hicrm_salary`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `hicrm_service`
--
ALTER TABLE `hicrm_service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT cho bảng `hicrm_staff`
--
ALTER TABLE `hicrm_staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `hicrm_static_pages`
--
ALTER TABLE `hicrm_static_pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `hicrm_static_page_categories`
--
ALTER TABLE `hicrm_static_page_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `hicrm_student_profile`
--
ALTER TABLE `hicrm_student_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT cho bảng `hicrm_support_requests`
--
ALTER TABLE `hicrm_support_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `hicrm_templates`
--
ALTER TABLE `hicrm_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `hicrm_template_types`
--
ALTER TABLE `hicrm_template_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT cho bảng `hicrm_tt25_categories`
--
ALTER TABLE `hicrm_tt25_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `hicrm_tt25_requests`
--
ALTER TABLE `hicrm_tt25_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `hicrm_type`
--
ALTER TABLE `hicrm_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `hicrm_users`
--
ALTER TABLE `hicrm_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `hicrm_users_old-1`
--
ALTER TABLE `hicrm_users_old-1`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT cho bảng `hicrm_user_category`
--
ALTER TABLE `hicrm_user_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `hicrm_user_groups`
--
ALTER TABLE `hicrm_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `hicrm_user_group_permissions`
--
ALTER TABLE `hicrm_user_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT cho bảng `hicrm_user_role`
--
ALTER TABLE `hicrm_user_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `hicrm_videos`
--
ALTER TABLE `hicrm_videos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `hicrm_website_visits`
--
ALTER TABLE `hicrm_website_visits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=664;

--
-- AUTO_INCREMENT cho bảng `system_otp`
--
ALTER TABLE `system_otp`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `hicrm_candidates`
--
ALTER TABLE `hicrm_candidates`
  ADD CONSTRAINT `hicrm_candidates_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `hicrm_users_old-1` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `hicrm_candidates_ibfk_2` FOREIGN KEY (`province_id`) REFERENCES `hicrm_provinces` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `hicrm_candidates_ibfk_3` FOREIGN KEY (`desired_province_id`) REFERENCES `hicrm_provinces` (`id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `hicrm_candidate_certificates`
--
ALTER TABLE `hicrm_candidate_certificates`
  ADD CONSTRAINT `hicrm_candidate_certificates_ibfk_1` FOREIGN KEY (`candidate_id`) REFERENCES `hicrm_candidates` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `hicrm_candidate_experiences`
--
ALTER TABLE `hicrm_candidate_experiences`
  ADD CONSTRAINT `hicrm_candidate_experiences_ibfk_1` FOREIGN KEY (`candidate_id`) REFERENCES `hicrm_candidates` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `hicrm_district`
--
ALTER TABLE `hicrm_district`
  ADD CONSTRAINT `fk_district_province` FOREIGN KEY (`province_id`) REFERENCES `hicrm_provinces` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `hicrm_employers_old`
--
ALTER TABLE `hicrm_employers_old`
  ADD CONSTRAINT `hicrm_employers_old_ibfk_2` FOREIGN KEY (`job_category_id`) REFERENCES `hicrm_job_categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `hicrm_employers_old_ibfk_3` FOREIGN KEY (`province_id`) REFERENCES `hicrm_provinces` (`id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `hicrm_job_applications`
--
ALTER TABLE `hicrm_job_applications`
  ADD CONSTRAINT `fk_job_applications_candidate` FOREIGN KEY (`candidate_id`) REFERENCES `hicrm_candidates` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_job_applications_job` FOREIGN KEY (`job_post_id`) REFERENCES `hicrm_job_posts_old` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
