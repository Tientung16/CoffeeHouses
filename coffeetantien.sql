-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 18, 2022 lúc 04:58 AM
-- Phiên bản máy phục vụ: 10.3.16-MariaDB
-- Phiên bản PHP: 7.1.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `coffeetantien`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(50) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`category_id`, `category_name`) VALUES
(1, 'Trà sữa'),
(2, 'Cà phê'),
(3, 'Nước uống trái cây'),
(4, 'Trà kem phô mai'),
(5, 'Sữa chua dẻo');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comment`
--

CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `comment_content` varchar(255) CHARACTER SET utf8 NOT NULL,
  `comment_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `address` varchar(255) CHARACTER SET utf8 NOT NULL,
  `phone` varchar(15) CHARACTER SET utf8 NOT NULL,
  `note` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `method` varchar(50) CHARACTER SET utf8 NOT NULL,
  `status` varchar(25) NOT NULL,
  `order_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_details`
--

CREATE TABLE `order_details` (
  `details_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `variant_id` int(11) NOT NULL,
  `price_total` float NOT NULL,
  `num` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `product_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `thumbnail` varchar(255) CHARACTER SET utf8 NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `price_sale` float NOT NULL,
  `amount` int(11) NOT NULL,
  `active` int(11) NOT NULL,
  `view` int(11) NOT NULL,
  `import_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`product_id`, `category_id`, `product_name`, `thumbnail`, `description`, `price_sale`, `amount`, `active`, `view`, `import_date`) VALUES
(1, 1, 'Ô long Trân châu Baby Kem Café', 'mvc/public/images/products/ezgif.com-gif-maker-6 (1).jpg', 'Menu của Marathon Coffee sẽ bắt đầu với 3 thức uống cà phê cơ bản của người Việt Nam là cà phê đen, cà phê sữa và bạc sỉu. Cà phê được chuẩn bị sẵn ở nhà vào sáng sớm, cẩn thận đóng kín bỏ vào bình giữ nhiệt để bảo đảm chất lượng cà phê không thay đổi tro', 0, 20, 1, 5, '2022-11-30 15:52:33'),
(2, 1, 'Sữa Tươi Trân Châu Baby Kem Café', 'mvc/public/images/products/ezgif.com-gif-maker-6.jpg', 'Menu của Marathon Coffee sẽ bắt đầu với 3 thức uống cà phê cơ bản của người Việt Nam là cà phê đen, cà phê sữa và bạc sỉu. Cà phê được chuẩn bị sẵn ở nhà vào sáng sớm, cẩn thận đóng kín bỏ vào bình giữ nhiệt để bảo đảm chất lượng cà phê không thay đổi tro', 0, 20, 1, 0, '2022-12-01 05:53:57'),
(3, 1, 'Trà xanh', 'mvc/public/images/products/ezgif.com-gif-maker-13.jpg', 'Menu của Marathon Coffee sẽ bắt đầu với 3 thức uống cà phê cơ bản của người Việt Nam là cà phê đen, cà phê sữa và bạc sỉu. Cà phê được chuẩn bị sẵn ở nhà vào sáng sớm, cẩn thận đóng kín bỏ vào bình giữ nhiệt để bảo đảm chất lượng cà phê không thay đổi tro', 10, 20, 1, 0, '2022-12-01 08:35:15'),
(4, 1, 'Ô long thái cực', 'mvc/public/images/products/ezgif.com-gif-maker-19.jpg', 'Menu của Marathon Coffee sẽ bắt đầu với 3 thức uống cà phê cơ bản của người Việt Nam là cà phê đen, cà phê sữa và bạc sỉu. Cà phê được chuẩn bị sẵn ở nhà vào sáng sớm, cẩn thận đóng kín bỏ vào bình giữ nhiệt để bảo đảm chất lượng cà phê không thay đổi tro', 50, 20, 1, 0, '2022-12-01 08:35:47'),
(5, 3, 'Probi Bưởi Trân Châu Sương Mai', 'mvc/public/images/products/ezgif.com-gif-maker-2.jpg', 'Menu của Marathon Coffee sẽ bắt đầu với 3 thức uống cà phê cơ bản của người Việt Nam là cà phê đen, cà phê sữa và bạc sỉu. Cà phê được chuẩn bị sẵn ở nhà vào sáng sớm, cẩn thận đóng kín bỏ vào bình giữ nhiệt để bảo đảm chất lượng cà phê không thay đổi tro', 0, 20, 1, 0, '2022-12-01 08:36:38'),
(6, 3, 'Trà dâu tằm pha lê tuyết', 'mvc/public/images/products/dâu-tằm-pha-lê-tuyết.jpg', 'Menu của Marathon Coffee sẽ bắt đầu với 3 thức uống cà phê cơ bản của người Việt Nam là cà phê đen, cà phê sữa và bạc sỉu. Cà phê được chuẩn bị sẵn ở nhà vào sáng sớm, cẩn thận đóng kín bỏ vào bình giữ nhiệt để bảo đảm chất lượng cà phê không thay đổi tro', 0, 20, 1, 0, '2022-12-01 08:37:06'),
(7, 3, 'Hồng Trà Bưởi Mật Ong', 'mvc/public/images/products/ezgif.com-gif-maker-7.jpg', 'Menu của Marathon Coffee sẽ bắt đầu với 3 thức uống cà phê cơ bản của người Việt Nam là cà phê đen, cà phê sữa và bạc sỉu. Cà phê được chuẩn bị sẵn ở nhà vào sáng sớm, cẩn thận đóng kín bỏ vào bình giữ nhiệt để bảo đảm chất lượng cà phê không thay đổi tro', 0, 20, 1, 0, '2022-12-01 08:38:03'),
(8, 4, 'Dâu Tằm Kem Phô Mai', 'mvc/public/images/products/dau_tam_kem_pho_mai_09a4c4b857694d918a86542225fc2867_grande.jpg', 'Menu của Marathon Coffee sẽ bắt đầu với 3 thức uống cà phê cơ bản của người Việt Nam là cà phê đen, cà phê sữa và bạc sỉu. Cà phê được chuẩn bị sẵn ở nhà vào sáng sớm, cẩn thận đóng kín bỏ vào bình giữ nhiệt để bảo đảm chất lượng cà phê không thay đổi tro', 0, 20, 1, 0, '2022-12-01 08:39:45'),
(9, 4, 'Hồng Trà Kem Phô Mai', 'mvc/public/images/products/hong_tra_kem_pho_mai_bea768e4679b4a2bbea0d5730fc75ffa_4dbc2f739c184bbbad3cee27aab5cfcd_grande.jpg', 'Menu của Marathon Coffee sẽ bắt đầu với 3 thức uống cà phê cơ bản của người Việt Nam là cà phê đen, cà phê sữa và bạc sỉu. Cà phê được chuẩn bị sẵn ở nhà vào sáng sớm, cẩn thận đóng kín bỏ vào bình giữ nhiệt để bảo đảm chất lượng cà phê không thay đổi tro', 0, 20, 1, 0, '2022-12-01 08:40:14'),
(10, 4, 'Trà Xanh Kem Phô Mai', 'mvc/public/images/products/tra_xanh_kem_pho_mai_1ed02f821288425d87dd9fc096c62768_40b394e0280f4d55819de201a4405718_grande.jpg', 'Menu của Marathon Coffee sẽ bắt đầu với 3 thức uống cà phê cơ bản của người Việt Nam là cà phê đen, cà phê sữa và bạc sỉu. Cà phê được chuẩn bị sẵn ở nhà vào sáng sớm, cẩn thận đóng kín bỏ vào bình giữ nhiệt để bảo đảm chất lượng cà phê không thay đổi tro', 0, 20, 1, 0, '2022-12-01 08:40:42'),
(11, 4, 'Matcha Kem Phô Mai', 'mvc/public/images/products/matcha-kem-pho-mai_09b3b54997614aea86d2b61bcd7f548c_73a9e7cd539949718b13b06c5db9522f_grande.png', 'Menu của Marathon Coffee sẽ bắt đầu với 3 thức uống cà phê cơ bản của người Việt Nam là cà phê đen, cà phê sữa và bạc sỉu. Cà phê được chuẩn bị sẵn ở nhà vào sáng sớm, cẩn thận đóng kín bỏ vào bình giữ nhiệt để bảo đảm chất lượng cà phê không thay đổi tro', 0, 20, 1, 0, '2022-12-01 08:41:13'),
(12, 5, 'Sữa Chua Dâu Tằm Hoàng Kim', 'mvc/public/images/products/sua-chua-dau-tam-hoang-kim.png', 'Menu của Marathon Coffee sẽ bắt đầu với 3 thức uống cà phê cơ bản của người Việt Nam là cà phê đen, cà phê sữa và bạc sỉu. Cà phê được chuẩn bị sẵn ở nhà vào sáng sớm, cẩn thận đóng kín bỏ vào bình giữ nhiệt để bảo đảm chất lượng cà phê không thay đổi tro', 0, 20, 1, 0, '2022-12-01 08:43:00'),
(13, 5, 'Sữa Chua Trắng', 'mvc/public/images/products/sua-chua-trang-.png', 'Menu của Marathon Coffee sẽ bắt đầu với 3 thức uống cà phê cơ bản của người Việt Nam là cà phê đen, cà phê sữa và bạc sỉu. Cà phê được chuẩn bị sẵn ở nhà vào sáng sớm, cẩn thận đóng kín bỏ vào bình giữ nhiệt để bảo đảm chất lượng cà phê không thay đổi tro', 0, 20, 1, 0, '2022-12-01 08:43:20'),
(14, 2, 'Royal Pearl Milk Coffee', 'mvc/public/images/products/Royal-Pearl-Milk-Coffee.png', 'Royal Pearl Milk Coffee', 40, 20, 1, 0, '2022-12-05 04:47:58'),
(15, 2, 'Grass Jelly Milk Coffee', 'mvc/public/images/products/Grass-Jelly-Milk-Coffee.png', 'Grass Jelly Milk Coffee', 15, 20, 1, 0, '2022-12-07 13:33:15');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `role`
--

CREATE TABLE `role` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(25) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `role`
--

INSERT INTO `role` (`role_id`, `role_name`) VALUES
(1, 'Người dùng'),
(2, 'Quản lý');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) CHARACTER SET utf8 NOT NULL,
  `password` varchar(100) CHARACTER SET utf8 NOT NULL,
  `address` varchar(255) CHARACTER SET utf8 NOT NULL,
  `verify` varchar(10) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`user_id`, `role_id`, `name`, `email`, `phone`, `password`, `address`, `verify`) VALUES
(1, 2, 'Nguyễn Bá Tiến', 'nbtien621@gmail.com', '0387578520', '123456', 'Yên Hòa, Cầu Giấy, Hà Nội', '26333'),
(2, 1, 'Phạm Minh Tân', 'pmthp2001@gmail.com', '843875785201', '123456', 'Tầng 2 tòa nhà T10, Times City Vĩnh Tuy, Hai Bà Trưng, Hà Nội.', '12564'),
(3, 1, 'Minh Tân', 'pmthp20011@gmail.com', '15454545', '123456', 'Đường Láng, Đống Đa, Hà Nội', '1');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `variant`
--

CREATE TABLE `variant` (
  `variant_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `size` varchar(5) CHARACTER SET utf8 NOT NULL,
  `price` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `variant`
--

INSERT INTO `variant` (`variant_id`, `product_id`, `size`, `price`) VALUES
(1, 1, 'Nhỏ', 22000),
(2, 1, 'Vừa', 28000),
(3, 1, 'Lớn', 35000),
(4, 2, 'Nhỏ', 22000),
(5, 2, 'Vừa', 29000),
(6, 2, 'Lớn', 36000),
(7, 3, 'Nhỏ', 22000),
(8, 3, 'Vừa', 29000),
(9, 3, 'Lớn', 35000),
(10, 4, 'Nhỏ', 22000),
(11, 4, 'Vừa', 29000),
(12, 4, 'Lớn', 35000),
(13, 5, 'Nhỏ', 22000),
(14, 5, 'Vừa', 29000),
(15, 5, 'Lớn', 39000),
(16, 6, 'Nhỏ', 22000),
(17, 6, 'Vừa', 29000),
(18, 6, 'Lớn', 35000),
(19, 7, 'Nhỏ', 22000),
(20, 7, 'Vừa', 29000),
(21, 7, 'Lớn', 35000),
(22, 8, 'Nhỏ', 22000),
(23, 8, 'Vừa', 29000),
(24, 8, 'Lớn', 35000),
(25, 9, 'Nhỏ', 22000),
(26, 9, 'Vừa', 29000),
(27, 9, 'Lớn', 35000),
(28, 10, 'Nhỏ', 22000),
(29, 10, 'Vừa', 29000),
(30, 10, 'Lớn', 35000),
(31, 11, 'Nhỏ', 22000),
(32, 11, 'Vừa', 29000),
(33, 11, 'Lớn', 35000),
(34, 12, 'Nhỏ', 22000),
(35, 12, 'Vừa', 29000),
(36, 12, 'Lớn', 35000),
(37, 13, 'Nhỏ', 25000),
(38, 13, 'Vừa', 30000),
(39, 13, 'Lớn', 35000),
(40, 14, 'Nhỏ', 27000),
(41, 14, 'Vừa', 32000),
(42, 14, 'Lớn', 37000),
(43, 15, 'Nhỏ', 15000),
(44, 15, 'Vừa', 22000),
(45, 15, 'Lớn', 30000);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Chỉ mục cho bảng `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`details_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `variant_id` (`variant_id`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Chỉ mục cho bảng `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`role_id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `role_id` (`role_id`);

--
-- Chỉ mục cho bảng `variant`
--
ALTER TABLE `variant`
  ADD PRIMARY KEY (`variant_id`),
  ADD KEY `product_id` (`product_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `comment`
--
ALTER TABLE `comment`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT cho bảng `order_details`
--
ALTER TABLE `order_details`
  MODIFY `details_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT cho bảng `role`
--
ALTER TABLE `role`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `variant`
--
ALTER TABLE `variant`
  MODIFY `variant_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Các ràng buộc cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`variant_id`) REFERENCES `variant` (`variant_id`);

--
-- Các ràng buộc cho bảng `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`);

--
-- Các ràng buộc cho bảng `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`);

--
-- Các ràng buộc cho bảng `variant`
--
ALTER TABLE `variant`
  ADD CONSTRAINT `variant_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
