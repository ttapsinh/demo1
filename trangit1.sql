-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 14, 2021 lúc 04:28 PM
-- Phiên bản máy phục vụ: 10.4.21-MariaDB
-- Phiên bản PHP: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `trangit1`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

CREATE TABLE `admin` (
  `username` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admin`
--

INSERT INTO `admin` (`username`, `password`, `status`) VALUES
('admin', 'e10adc3949ba59abbe56e057f20f883e', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `brands`
--

CREATE TABLE `brands` (
  `id` int(11) NOT NULL,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `brands`
--

INSERT INTO `brands` (`id`, `name`, `status`) VALUES
(1, 'Áo khoác', 1),
(2, 'Váy', 1),
(3, 'Áo nỉ', 1),
(4, 'Quần', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `customerid` int(11) NOT NULL,
  `productid` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `content` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `comments`
--

INSERT INTO `comments` (`id`, `customerid`, `productid`, `date`, `content`, `status`) VALUES
(9, 2, 1, '2021-11-13 09:26:33', 'Gửi shop, sản phẩm hàng rất đẹp và được thiết kế cao cấp.', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `username` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `fullname` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `customer`
--

INSERT INTO `customer` (`id`, `username`, `password`, `fullname`, `mobile`, `address`, `email`, `status`) VALUES
(1, 'trang', 'e10adc3949ba59abbe56e057f20f883e', 'Nguyễn Hiền Trang', '0339956966', 'Hà Nội', 'trang12@gmail.com', 0),
(2, 'trang123', 'e10adc3949ba59abbe56e057f20f883e', 'Hà Huyền Trang', '0911312312', 'Hà Nội', 'nguyentrang123@gmail.com', 1),
(4, 'chan', 'e10adc3949ba59abbe56e057f20f883e', 'chan trang', '0375432710', 'Hà Nam', '', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orderdetail`
--

CREATE TABLE `orderdetail` (
  `productid` int(11) NOT NULL,
  `orderid` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orderdetail`
--

INSERT INTO `orderdetail` (`productid`, `orderid`, `number`, `price`) VALUES
(1, 5, 1, 450000),
(1, 20, 1, 450000),
(1, 22, 0, 450000),
(1, 23, 1, 450000),
(1, 24, 0, 450000),
(1, 25, 3, 450000),
(1, 26, 0, 450000),
(1, 27, 0, 450000),
(1, 29, 1, 450000),
(1, 30, 1, 450000),
(3, 28, 0, 295000),
(4, 5, 0, 150000),
(4, 20, 0, 150000),
(4, 22, 2, 150000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ordermethod`
--

CREATE TABLE `ordermethod` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `ordermethod`
--

INSERT INTO `ordermethod` (`id`, `name`, `status`) VALUES
(1, 'Trả tiền mặt', 1),
(2, 'Chuyển khoản', 1),
(3, 'Thanh toán tại shop', 1),
(4, 'Paypal', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `ordermethodid` int(11) NOT NULL,
  `customerid` int(11) NOT NULL,
  `orderdate` datetime NOT NULL DEFAULT current_timestamp(),
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1: Chưa xử lý; 2: Đang xử lý; 3:Đã xử lý; 4: Hủy;',
  `name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `ordermethodid`, `customerid`, `orderdate`, `status`, `name`, `address`, `mobile`, `email`, `note`) VALUES
(20, 1, 2, '2021-11-06 16:42:48', 4, 'Hà Huyền Trang', 'Hà Nội ', '0911312312', 'nguyentrang123@gmail.com', 'Cần hàng chất lượng'),
(21, 1, 2, '2021-11-06 16:43:24', 4, 'Hà Huyền Trang', 'Hà Nội ', '0911312312', 'nguyentrang123@gmail.com', 'Cần hàng chất lượng'),
(22, 1, 2, '2021-11-06 16:45:48', 3, 'Hà Huyền Trang', 'Bắc Ninh', '0911312312', 'nguyentrang123@gmail.com', ''),
(23, 2, 2, '2021-11-06 16:49:50', 1, 'Hà Huyền Trang', 'Hà Nội ', '0911312312', 'nguyentrang123@gmail.com', ''),
(24, 2, 2, '2021-11-06 17:04:55', 1, 'Hà Huyền Trang', 'Hà Nội ', '0911312312', 'nguyentrang123@gmail.com', ''),
(25, 1, 2, '2021-11-06 17:05:50', 2, 'Hà Huyền Trang', 'Hà Nội ', '0911312312', 'nguyentrang123@gmail.com', ''),
(26, 2, 4, '2021-11-06 17:10:34', 1, 'chan trang', 'Hà Nam ', '0375432710', '', ''),
(27, 1, 2, '2021-11-06 17:17:50', 1, 'Hà Huyền Trang', 'Hà Nội ', '0911312312', 'nguyentrang123@gmail.com', ''),
(28, 1, 2, '2021-11-09 15:12:40', 1, 'Hà Huyền Trang', 'Hà Nội ', '0911312312', 'nguyentrang123@gmail.com', ''),
(29, 1, 2, '2021-11-14 11:42:59', 1, 'Hà Huyền Trang', 'Hà Nội ', '0911312312', 'nguyentrang123@gmail.com', ''),
(30, 1, 2, '2021-11-14 11:51:21', 1, 'Hà Huyền Trang', 'Hà Nội ', '0911312312', 'nguyentrang123@gmail.com', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `brandid` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `image` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `brandid`, `name`, `price`, `image`, `description`, `status`) VALUES
(1, 1, 'Cardigan', 450000, 'ao-khoac-len-cardigan.jpg', 'Áo đẹp', 1),
(2, 1, 'Mangto', 700000, 'ao-mang-to-mau-da.jpg', 'Áo màu da, dáng dài, hàng hàn quốc', 1),
(3, 3, 'Gile', 295000, 'ao-gile -co-V.jpg', 'Áo phù hợp với học sinh sinh viên, làm nổi bật sự trẻ trung năng động. Áo len gile hình chiếc bánh cổ chữ V', 1),
(4, 3, 'Hoodie', 150000, 'ao-hoodie.jpg', 'Áo nỉ đẹp, giá rẻ, hàng quảng châu.', 0),
(5, 1, 'Bomber', 370000, 'ao bomber khoa.jpg', 'Áo khoác ngoài form đẹp chất liệu vải nhung', 1),
(6, 2, 'Vay xoe', 170000, 'vay-xoe.jpg', 'Chất liệu vải voan, tay lửng rất thích hợp cho các cô gái đi chơi, đi dự tiếc.', 1),
(7, 3, 'Ao thun', 130000, 'ao-thun-dai-tay-den.jpg', 'Áo thun chất dày phù hợp mặc vào mua thu đông.\r\n', 1),
(8, 2, 'Chân váy ngắn', 130000, 'chan-vay-ngan.jpg', 'Chân váy xếp ly ngắn màu trơn, dễ phối đồ, chân váy có kèm quần bên trong.', 1),
(9, 2, 'Chan vay dài', 155000, 'vay-xep-ly-dai.jpg', 'Chân váy thời trang, nữ tính là những tính từ miêu tả tốt nhất đặc tính của thiết kế chân váy này.', 1),
(10, 1, 'Áo khoác nỉ', 250000, '1636297667_ao-khoac-ni-bong.jpg', '<p>&Aacute;o kho&aacute;c nỉ d&agrave;y dặn l&oacute;t b&ocirc;ng mềm chất đẹp, form rộng cổ tay bo chun.</p>\r\n', 1),
(11, 4, 'Quần', 120000, 'Quần baggy.jpg', 'Quần vải thô, không xù lông, giá rẻ phù hợp với mọi người.', 1),
(12, 4, 'Quần bò', 175000, 'quan-bo-nu.jpg', 'Quần bò vải co dãn, hàng quảng châu, giá rẻ chất lượng sản phẩm tốt.', 1),
(13, 2, 'Váy trắng', 210000, 'vay-trang.jpg', 'Đảm bảo các chị nhận hàng không bao giờ hối tiếc, thậm chí còn muốn mua thêm hộ người thân bạn bè nữa đó. Em còn có cả clip chính giọng em giới thiệu về váy ở cửa hàng để các khách yêu tham khảo. Thôi em không dài dòng nữa, cụ thể các chị cứ đặt hàng áo này 1 lần sẽ rõ chất lượng.', 1),
(14, 2, 'Sét váy', 250000, 'set-vay.jpg', 'Thiết kế tinh tế đến từng đường may, chất liệu mềm mại.\r\nChất liệu sản phẩm cao cấp, đường may tinh tế, tôn dáng cực chuẩn.\r\n✅Phong cách trẻ trung, thanh lịch, sang trọng, , giúp bạn tự tin tỏa sáng khi xuất hiện.', 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`username`);

--
-- Chỉ mục cho bảng `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD PRIMARY KEY (`productid`,`orderid`);

--
-- Chỉ mục cho bảng `ordermethod`
--
ALTER TABLE `ordermethod`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT cho bảng `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `ordermethod`
--
ALTER TABLE `ordermethod`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
