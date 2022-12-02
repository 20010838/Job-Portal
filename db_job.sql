-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3306
-- Thời gian đã tạo: Th10 23, 2022 lúc 05:00 PM
-- Phiên bản máy phục vụ: 5.7.36
-- Phiên bản PHP: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `db_job`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id_admin` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id_admin`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `admin`
--

INSERT INTO `admin` (`id_admin`, `username`, `password`) VALUES
(1, 'admin', '12345'),
(2, 'admin@gmail.com', 'roottoor');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `apply_job_post`
--

DROP TABLE IF EXISTS `apply_job_post`;
CREATE TABLE IF NOT EXISTS `apply_job_post` (
  `id_apply` int(11) NOT NULL AUTO_INCREMENT,
  `id_jobpost` int(11) NOT NULL,
  `id_company` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_apply`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `apply_job_post`
--

INSERT INTO `apply_job_post` (`id_apply`, `id_jobpost`, `id_company`, `id_user`, `status`) VALUES
(30, 39, 23, 18, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cities`
--

DROP TABLE IF EXISTS `cities`;
CREATE TABLE IF NOT EXISTS `cities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48315 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `company`
--

DROP TABLE IF EXISTS `company`;
CREATE TABLE IF NOT EXISTS `company` (
  `id_company` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `companyname` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `country` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `contactno` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `website` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `aboutme` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `active` int(11) NOT NULL DEFAULT '2',
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_company`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `company`
--

INSERT INTO `company` (`id_company`, `name`, `companyname`, `country`, `contactno`, `website`, `email`, `password`, `aboutme`, `logo`, `createdAt`, `active`, `state`) VALUES
(23, 'Giám đốc', 'Nasa', 'Vietnam', '0386260203', 'https://www.facebook.com/profile.php?id=100020539491258', 'congty1@gmail.com', 'Yjk0ODU3ZjZhOTA1Y2NkMDI4MzI5YjBhODMyNGFjNGM=', 'Làm việc trong môi trường chuyên nghiệp', '637dd119bd313.jpg', '2022-11-23 07:51:53', 1, 'Hà Nội'),
(24, 'Y tá', 'Xây dựng', 'Vietnam', '0233333333', 'test', 'congty2@gmail.com', 'Yjk0ODU3ZjZhOTA1Y2NkMDI4MzI5YjBhODMyNGFjNGM=', 'test1', '637e4496b42df.png', '2022-11-23 16:04:38', 1, 'Đà Nẵng');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `countries`
--

DROP TABLE IF EXISTS `countries`;
CREATE TABLE IF NOT EXISTS `countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sortname` varchar(3) NOT NULL,
  `name` varchar(150) NOT NULL,
  `phonecode` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=247 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `countries`
--

INSERT INTO `countries` (`id`, `sortname`, `name`, `phonecode`) VALUES
(101, 'VN', 'Vietnam', 84);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `job_post`
--

DROP TABLE IF EXISTS `job_post`;
CREATE TABLE IF NOT EXISTS `job_post` (
  `id_jobpost` int(11) NOT NULL AUTO_INCREMENT,
  `id_company` int(11) NOT NULL,
  `jobtitle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `minimumsalary` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `maximumsalary` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `experience` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `qualification` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `createdat` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_jobpost`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `job_post`
--

INSERT INTO `job_post` (`id_jobpost`, `id_company`, `jobtitle`, `description`, `minimumsalary`, `maximumsalary`, `experience`, `qualification`, `createdat`) VALUES
(39, 23, 'Phụ hồ', '<p>L&agrave;m việc trong m&ocirc;i rường chuy&ecirc;n nghiệp,Đương đầu với thử th&aacute;ch,</p>', '1000000', '2500000', '7', 'Tốt nghiệp cấp high', '2022-11-23 08:54:28'),
(41, 24, 'Ngồi chơi', '<p>ằd</p>', '7000000', '8500000', '6', 'Giáo sư', '2022-11-23 16:52:17');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `mailbox`
--

DROP TABLE IF EXISTS `mailbox`;
CREATE TABLE IF NOT EXISTS `mailbox` (
  `id_mailbox` int(11) NOT NULL AUTO_INCREMENT,
  `id_fromuser` int(11) NOT NULL,
  `fromuser` varchar(255) NOT NULL,
  `id_touser` int(11) NOT NULL,
  `subject` varchar(256) NOT NULL,
  `message` text NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_mailbox`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `mailbox`
--

INSERT INTO `mailbox` (`id_mailbox`, `id_fromuser`, `fromuser`, `id_touser`, `subject`, `message`, `createdAt`) VALUES
(8, 19, 'company', 15, 'hê lô', '<p>hỏa</p>', '2022-11-06 09:39:12'),
(9, 19, 'company', 15, 'hh', '<p>he</p>', '2022-11-06 09:44:33'),
(10, 19, 'company', 15, 'ff', '<p>&acirc;</p>', '2022-11-06 14:26:52'),
(11, 23, 'company', 18, 'hê lô', '<p>gfggft</p>', '2022-11-23 15:03:03'),
(12, 18, 'user', 23, 'hiiiiiiiiii', '<p>hii</p>', '2022-11-23 15:05:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `reply_mailbox`
--

DROP TABLE IF EXISTS `reply_mailbox`;
CREATE TABLE IF NOT EXISTS `reply_mailbox` (
  `id_reply` int(11) NOT NULL AUTO_INCREMENT,
  `id_mailbox` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `usertype` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_reply`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `reply_mailbox`
--

INSERT INTO `reply_mailbox` (`id_reply`, `id_mailbox`, `id_user`, `usertype`, `message`, `createdAt`) VALUES
(1, 7, 14, 'user', '<p>nsc;nc;</p>', '2019-08-10 12:58:12'),
(2, 7, 14, 'user', '<p>nsc;nc;</p>', '2019-08-10 12:58:12'),
(3, 8, 15, 'user', '<p>ftgyy</p>', '2022-11-06 09:50:46'),
(4, 8, 19, 'company', '<p>dm</p>', '2022-11-06 09:51:06'),
(5, 10, 15, 'user', '<p>a</p>', '2022-11-06 14:27:08'),
(6, 9, 15, 'user', '<p>jdj</p>', '2022-11-10 04:40:27'),
(7, 11, 18, 'user', '<p>sws</p>', '2022-11-23 15:05:15'),
(8, 12, 23, 'company', '<p>cc</p>', '2022-11-23 15:06:15'),
(9, 11, 23, 'company', '<p>aaaa</p>', '2022-11-23 15:06:23');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `states`
--

DROP TABLE IF EXISTS `states`;
CREATE TABLE IF NOT EXISTS `states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `country_id` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `states`
--

INSERT INTO `states` (`id`, `name`, `country_id`) VALUES
(1, 'Hà Nội', 101),
(2, 'Hồ Chí Minh', 101),
(3, 'Đà Nẫng', 101);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `address` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `contactno` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `qualification` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `passingyear` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `dob` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `age` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `designation` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `resume` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `hash` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  `aboutme` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `skills` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id_user`, `firstname`, `lastname`, `email`, `password`, `address`, `city`, `contactno`, `qualification`, `passingyear`, `dob`, `age`, `designation`, `resume`, `hash`, `active`, `aboutme`, `skills`) VALUES
(18, 'Nguyễn', 'Khánh', 'ungvien1@gmail.com', 'YzI2ODQxY2M5OGY3NjBmNjM2ZjJjNGQ5ZDgyN2UxOGM=', 'Đại học phenikaa', 'Quận Hà Đông', '0386260203', 'Củ nhân cntt', '2024-08-21', '2002-08-21', '20', '', '637dc84c59e7b.pdf', '4697e06f024aa403639bb8212139947c', 1, 'hiii', 'Thành thạo tin học văn phòng');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
