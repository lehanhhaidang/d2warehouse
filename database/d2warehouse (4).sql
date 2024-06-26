-- phpMyAdmin SQL Dump
-- version 2.11.6
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 25, 2024 at 06:24 PM
-- Server version: 5.0.51
-- PHP Version: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `d2warehouse`
--

-- --------------------------------------------------------

--
-- Table structure for table `add_logo`
--

CREATE TABLE `add_logo` (
  `id` int(10) NOT NULL auto_increment,
  `img` varchar(200) character set utf8 NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `add_logo`
--

INSERT INTO `add_logo` (`id`, `img`) VALUES
(1, 'logo.png');

-- --------------------------------------------------------

--
-- Table structure for table `bienbankiemke`
--

CREATE TABLE `bienbankiemke` (
  `maBBKK` char(10) character set utf8 collate utf8_unicode_ci NOT NULL,
  `maNVKK` char(10) character set utf8 collate utf8_unicode_ci default NULL,
  `ngayLapBB` date NOT NULL,
  `maKho` varchar(10) character set utf8 collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`maBBKK`),
  KEY `maNVKK` (`maNVKK`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bienbankiemke`
--

INSERT INTO `bienbankiemke` (`maBBKK`, `maNVKK`, `ngayLapBB`, `maKho`) VALUES
('BBKKNVL01', 'NVKK01', '2023-11-04', 'KNVL01'),
('BBKKNVL02', 'null', '2023-12-17', 'KNVL02');

-- --------------------------------------------------------

--
-- Table structure for table `bieumaunhap`
--

CREATE TABLE `bieumaunhap` (
  `maBMNhap` char(10) character set utf8 collate utf8_unicode_ci NOT NULL,
  `maDeXuat` char(10) character set utf8 collate utf8_unicode_ci default NULL,
  `tenNguoiGiao` text character set utf8 collate utf8_unicode_ci NOT NULL,
  `ngayNhap` date NOT NULL,
  `loaiNhap` text character set utf8 collate utf8_unicode_ci NOT NULL,
  `trangThai` varchar(100) character set utf8 collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`maBMNhap`),
  KEY `maDeXuat` (`maDeXuat`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bieumaunhap`
--

INSERT INTO `bieumaunhap` (`maBMNhap`, `maDeXuat`, `tenNguoiGiao`, `ngayNhap`, `loaiNhap`, `trangThai`) VALUES
('BMN01', 'DX02', 'Lê Hạnh Hải Đăng', '2024-05-06', 'Nguyên vật liệu', 'Đã lập phiếu'),
('BMN02', 'DX14', 'Lê Hạnh Hải Đăng', '2024-05-06', 'Nguyên vật liệu', 'Đã lập phiếu'),
('BMN03', 'DX15', 'Lê Hạnh Hải Đăng', '2024-05-06', 'Nguyên vật liệu', 'Đã lập phiếu'),
('BMN04', 'DX16', 'Lê Hạnh Hải Đăng', '2024-05-06', 'Nguyên vật liệu', 'Đã lập phiếu'),
('BMN05', 'DX02', 'Lê Hạnh Hải Đăng', '2024-05-24', 'Nguyên vật liệu', 'Chưa lập phiếu'),
('BMN06', 'DX03', 'Lê Hạnh Hải Đăng', '2024-05-24', 'Nguyên vật liệu', 'Đã lập phiếu'),
('BMN07', 'DX06', 'Lê Hạnh Hải Đăng', '2024-05-24', 'Nguyên vật liệu', 'Chưa lập phiếu');

-- --------------------------------------------------------

--
-- Table structure for table `bieumauxuat`
--

CREATE TABLE `bieumauxuat` (
  `maBMXuat` char(10) character set utf8 collate utf8_unicode_ci NOT NULL,
  `maDeXuat` varchar(10) character set utf8 collate utf8_unicode_ci default NULL,
  `maKho` char(10) character set utf8 collate utf8_unicode_ci default NULL,
  `ngayXuat` date NOT NULL,
  `loaiXuat` tinytext character set utf8 collate utf8_unicode_ci NOT NULL,
  `tenNguoiNhan` text character set utf8 collate utf8_unicode_ci NOT NULL,
  `trangThai` varchar(100) character set utf8 collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`maBMXuat`),
  KEY `FK_bieumauxuat_longuyenvatlieu` (`maKho`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bieumauxuat`
--

INSERT INTO `bieumauxuat` (`maBMXuat`, `maDeXuat`, `maKho`, `ngayXuat`, `loaiXuat`, `tenNguoiNhan`, `trangThai`) VALUES
('BMX01', NULL, NULL, '2024-05-06', 'Nguyên vật liệu', 'hải đăng', 'Đã lập phiếu'),
('BMX02', NULL, NULL, '2024-05-21', 'Nguyên vật liệu', 'hải đăng', 'Chưa lập phiếu'),
('BMX03', NULL, NULL, '2024-05-23', 'Nguyên vật liệu', 'Tiến Huỳnh', 'Chưa lập phiếu'),
('BMX04', NULL, NULL, '2024-05-24', 'Nguyên vật liệu', '121212', 'Đã lập phiếu'),
('BMX05', NULL, NULL, '2024-05-24', 'Nguyên vật liệu', '123', 'Chưa lập phiếu'),
('BMX06', 'DX05', NULL, '2024-05-24', 'Nguyên vật liệu', 'hải đăng', 'Đã lập phiếu');

-- --------------------------------------------------------

--
-- Table structure for table `chat`
--

CREATE TABLE `chat` (
  `chatid` int(11) NOT NULL auto_increment,
  `sender_userid` int(11) NOT NULL,
  `reciever_userid` int(11) NOT NULL,
  `message` text character set utf8 collate utf8_unicode_ci NOT NULL,
  `timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `status` int(1) NOT NULL,
  PRIMARY KEY  (`chatid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `chat`
--

INSERT INTO `chat` (`chatid`, `sender_userid`, `reciever_userid`, `message`, `timestamp`, `status`) VALUES
(1, 5, 4, 'xin chao giam doc', '2024-05-25 14:08:33', 1),
(2, 5, 4, 'sdasd', '2024-05-25 14:09:48', 1),
(3, 5, 4, 'ád', '2024-05-25 14:09:50', 1),
(4, 5, 1, 'xin chào', '2024-05-25 15:18:09', 0),
(5, 1, 5, 'chào admin', '2024-05-25 15:18:27', 0),
(6, 1, 5, 'anh có khỏe không', '2024-05-25 15:18:32', 0),
(7, 5, 1, 'xin chào', '2024-05-25 15:19:37', 0),
(8, 5, 4, '1213121', '2024-05-25 15:27:23', 1),
(9, 5, 4, '12111111111111111111111', '2024-05-25 15:27:26', 1),
(10, 5, 2, 'xin chào quản lý', '2024-05-25 15:28:15', 1),
(11, 5, 1, 'chào bạn, tôi khỏe', '2024-05-25 16:33:11', 1),
(12, 5, 1, 'hehe', '2024-05-25 16:33:54', 1),
(13, 1, 5, 'haha', '2024-05-25 16:33:59', 1),
(14, 5, 1, 'xin chào nhé', '2024-05-25 17:23:26', 1);

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

CREATE TABLE `chats` (
  `id` int(11) NOT NULL auto_increment,
  `user` varchar(200) character set utf8 collate utf8_unicode_ci NOT NULL,
  `user_mail` varchar(100) character set utf8 collate utf8_unicode_ci NOT NULL,
  `chatbot` longtext character set utf8 collate utf8_unicode_ci NOT NULL,
  `action` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `del_msg` int(11) NOT NULL default '1',
  `date` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1039 ;

--
-- Dumping data for table `chats`
--

INSERT INTO `chats` (`id`, `user`, `user_mail`, `chatbot`, `action`, `status`, `del_msg`, `date`) VALUES
(1, 'sd', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-03-08 19:20:56'),
(2, 'a', '', 'Hãy cho tôi nội dung cụ thể về một chủ đề nào đó !', 'text', 1, 0, '2024-03-08 19:56:56'),
(3, 'a', '', 'Hãy cho tôi nội dung cụ thể về một chủ đề nào đó !', 'text', 1, 0, '2024-03-08 19:56:58'),
(4, 'a', '', 'Hãy cho tôi nội dung cụ thể về một chủ đề nào đó !', 'text', 1, 0, '2024-03-08 19:57:00'),
(5, '$', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-03-08 20:49:11'),
(6, '#', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-03-08 20:49:14'),
(7, '@@@@', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-03-08 20:49:17'),
(8, 'sdf', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-03-08 20:49:19'),
(9, '$#', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-03-09 06:59:17'),
(10, 'a', '', 'Hãy cho tôi nội dung cụ thể về một chủ đề nào đó !', 'text', 1, 0, '2024-03-09 06:59:22'),
(11, 'so pnnvl', '', 'echo "số lượng phiếu nhập nguyên vật liệu hiện tại là: " . $p->countPNNVL();\r\n', 'query', 1, 0, '2024-03-09 06:59:29'),
(12, 'may gio roi', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-03-09 08:31:46'),
(13, 'what time is it', '', 'echo "bây giờ là ".$child1;', 'query', 1, 0, '2024-03-09 08:31:56'),
(14, 'a', '', 'Hãy cho tôi nội dung cụ thể về một chủ đề nào đó !', 'text', 1, 0, '2024-03-09 08:32:13'),
(15, 'so pnnvl', '', 'echo "số lượng phiếu nhập nguyên vật liệu hiện tại là: " . $p->countPNNVL();\r\n', 'query', 1, 0, '2024-03-09 08:32:19'),
(16, 'mấy giờ rồi', '', 'echo "bây giờ là ".$child1;', 'query', 1, 0, '2024-03-09 08:32:27'),
(17, 'xem giờ', '', 'echo "bây giờ là ".$child1;', 'query', 1, 0, '2024-03-09 08:32:32'),
(18, 'huong', '', 'Huong la con di lon', 'text', 1, 0, '2024-03-09 08:33:55'),
(19, 'nguyen huynh huong', '', 'Huong la con di lon', 'text', 1, 0, '2024-03-09 08:33:59'),
(20, 'who is huong', '', 'Huong la con di lon', 'text', 1, 0, '2024-03-09 08:34:07'),
(21, 'huong la ai', '', 'Huong la con di lon', 'text', 1, 0, '2024-03-09 08:34:12'),
(22, 'huong', '', 'Huong la con di lon, Huong ngu vc, Huong ga, Huong le', 'text', 1, 0, '2024-03-09 08:34:51'),
(23, 'hi', '', 'Xin chào, tôi la D2Warehousebot, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-03-09 08:37:28'),
(24, 'tôi muốn hỏi vài câu hỏi', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-03-09 08:37:38'),
(25, 'tôi muốn hỏi', '', 'Tôi luôn sẵn sàng trả lời những câu hỏi và yêu cầu của bạn', 'text', 1, 0, '2024-03-09 08:37:48'),
(26, 'so pnnvl', '', 'echo "số lượng phiếu nhập nguyên vật liệu hiện tại là: " . $p->countPNNVL();\r\n', 'query', 1, 0, '2024-03-09 08:37:55'),
(27, 'mở goole', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-03-10 12:46:16'),
(28, 'mở google', '', '<a href="https://google.com" target="blank_">Click vào đây để truy cập google<a/>', 'text', 1, 0, '2024-03-10 12:46:24'),
(29, 'd2warehouse', '', 'D2Warehouse là đơn vị kho sản xuất và cung cấp các sản phẩm từ đậu nành, với nguyên vật liệu chính là đậu nành và sản phẩm thành phẩm bao gồm bã đậu nành và dầu đậu nành. Để đảm bảo chất lượng sản phẩm và đáp ứng nhu cầu của khách hàng, hệ thống quản lý kho được xây dựng bởi Lê Hạnh Hải Đăng và Bùi Thục Đoan.', 'text', 1, 0, '2024-03-10 12:47:38'),
(30, 'kho d2', '', 'D2Warehouse là đơn vị kho sản xuất và cung cấp các sản phẩm từ đậu nành, với nguyên vật liệu chính là đậu nành và sản phẩm thành phẩm bao gồm bã đậu nành và dầu đậu nành. Để đảm bảo chất lượng sản phẩm và đáp ứng nhu cầu của khách hàng, hệ thống quản lý kho được xây dựng bởi Lê Hạnh Hải Đăng và Bùi Thục Đoan.', 'text', 1, 0, '2024-03-10 12:48:56'),
(31, 'kho d2warehouse', '', 'D2Warehouse là đơn vị kho sản xuất và cung cấp các sản phẩm từ đậu nành, với nguyên vật liệu chính là đậu nành và sản phẩm thành phẩm bao gồm bã đậu nành và dầu đậu nành. Để đảm bảo chất lượng sản phẩm và đáp ứng nhu cầu của khách hàng, hệ thống quản lý kho được xây dựng bởi Lê Hạnh Hải Đăng và Bùi Thục Đoan.', 'text', 1, 0, '2024-03-10 12:49:10'),
(32, 'đăng là ai', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-03-10 12:53:17'),
(33, 'đăng là ai', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-03-10 12:53:27'),
(34, 'hiếu là ai', '', 'la thang mat lon', 'text', 1, 0, '2024-03-10 12:53:44'),
(35, 'số phiếu nnvl', '', 'echo "số lượng phiếu nhập nguyên vật liệu hiện tại là: " . $p->countPNNVL();\r\n', 'query', 1, 0, '2024-03-10 12:54:01'),
(36, 'số phiếu nnvl', '', 'echo "số lượng phiếu xuất nguyên vật liệu hiện tại là: " . $p->countPXNVL();', 'query', 1, 0, '2024-03-10 12:54:01'),
(37, 'số phiếu nnvl', '', 'echo "số lượng phiếu nhập thành phẩm hiện tại là: " . $p->countPNTP();', 'query', 1, 0, '2024-03-10 12:54:01'),
(38, 'số phiếu nhập nvl', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-03-10 12:54:15'),
(39, 'số lượng phiếu nhập nguyên vật liệu hiện tại là bao nhiêu', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-03-10 12:56:34'),
(40, 'số lượng phiếu nhập nguyên vật liệu ', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-03-10 12:56:41'),
(41, 'số lượng phiếu nhập nguyên vật liệu ', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-03-10 12:56:55'),
(42, 'so pnnvl', '', 'echo "số lượng phiếu nhập nguyên vật liệu hiện tại là: " . $p->countPNNVL();\r\n', 'query', 1, 0, '2024-03-10 12:57:03'),
(43, 'số phiếu nhập nguyên vật liệu', '', 'echo "số lượng phiếu nhập nguyên vật liệu hiện tại là: " . $p->countPNNVL();\r\n', 'query', 1, 0, '2024-03-10 12:57:28'),
(44, 'số', '', 'echo "số lượng phiếu nhập nguyên vật liệu hiện tại là: " . $p->countPNNVL();\r\n', 'query', 1, 0, '2024-03-10 12:57:34'),
(45, 'số', '', 'echo "số lượng phiếu xuất nguyên vật liệu hiện tại là: " . $p->countPXNVL();', 'query', 1, 0, '2024-03-10 12:57:34'),
(46, 'số', '', 'echo "số lượng phiếu nhập thành phẩm hiện tại là: " . $p->countPNTP();', 'query', 1, 0, '2024-03-10 12:57:34'),
(47, 'số', '', 'Tôi luôn sẵn sàng trả lời những câu hỏi và yêu cầu của bạn', 'text', 1, 0, '2024-03-10 12:57:34'),
(48, 'số lượng phiếu nhập nguyên vật liệu ', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-03-10 12:58:11'),
(49, 'số phiếu nnvl', '', 'echo "số lượng phiếu nhập nguyên vật liệu hiện tại là: " . $p->countPNNVL();\r\n', 'query', 1, 0, '2024-03-10 12:58:26'),
(50, 'số phiếu nnvl', '', 'echo "số lượng phiếu xuất nguyên vật liệu hiện tại là: " . $p->countPXNVL();', 'query', 1, 0, '2024-03-10 12:58:26'),
(51, 'số phiếu nnvl', '', 'echo "số lượng phiếu nhập thành phẩm hiện tại là: " . $p->countPNTP();', 'query', 1, 0, '2024-03-10 12:58:26'),
(52, 'số phiếu nhập nvl', '', 'echo "số lượng phiếu nhập nguyên vật liệu hiện tại là: " . $p->countPNNVL();\r\n', 'query', 1, 0, '2024-03-10 12:59:59'),
(53, 'số phiếu nhập nvl', '', 'echo "số lượng phiếu nhập nguyên vật liệu hiện tại là: " . $p->countPNNVL();\r\n', 'query', 1, 0, '2024-03-10 13:00:08'),
(54, 'số phiếu nnvl', '', 'echo "số lượng phiếu nhập nguyên vật liệu hiện tại là: " . $p->countPNNVL();\r\n', 'query', 1, 0, '2024-03-10 13:00:14'),
(55, 'số phiếu nnvl', '', 'echo "số lượng phiếu xuất nguyên vật liệu hiện tại là: " . $p->countPXNVL();', 'query', 1, 0, '2024-03-10 13:00:14'),
(56, 'số phiếu nnvl', '', 'echo "số lượng phiếu nhập thành phẩm hiện tại là: " . $p->countPNTP();', 'query', 1, 0, '2024-03-10 13:00:14'),
(57, 'sdfs', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-03-10 13:08:11'),
(58, 'sl pnnvl', '', 'echo "số lượng phiếu nhập nguyên vật liệu hiện tại là: " . $p->countPNNVL();\r\n', 'query', 1, 0, '2024-03-10 13:16:01'),
(59, 'số phiếu nhập nvl', '', 'echo "số lượng phiếu nhập nguyên vật liệu hiện tại là: " . $p->countPNNVL();\r\n', 'query', 1, 0, '2024-03-10 13:16:08'),
(60, 'số pnnvl', '', 'echo "số lượng phiếu nhập nguyên vật liệu hiện tại là: " . $p->countPNNVL();\r\n', 'query', 1, 0, '2024-03-10 13:16:13'),
(61, 'số lượng phiếu nvl', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-03-10 13:16:20'),
(62, 'số lượng phiếu nnvl', '', 'echo "số lượng phiếu nhập nguyên vật liệu hiện tại là: " . $p->countPNNVL();\r\n', 'query', 1, 0, '2024-03-10 13:16:41'),
(63, 'số phiếu nvl', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-03-10 13:17:48'),
(64, 'đăng là ai', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-03-10 13:18:11'),
(65, 'hiếu là ai', '', 'la thang mat lon', 'text', 1, 0, '2024-03-10 13:18:26'),
(66, 'đăng là ai', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-03-10 13:18:36'),
(67, 'hiếu là ai', '', 'la thang mat lon', 'text', 1, 0, '2024-03-10 13:18:41'),
(68, 'đăng là ai', '', 'Là người đẹp trai nhất thế giới\r\n', 'text', 1, 0, '2024-03-10 13:19:03'),
(69, 'số phiếu nnvl', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-03-10 13:19:42'),
(70, 'hahahah', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-03-10 13:19:45'),
(71, 'số phiếu nvl', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-03-10 13:19:53'),
(72, 'số phiếu nhập nvl', '', 'echo "số lượng phiếu nhập nguyên vật liệu hiện tại là: " . $p->countPNNVL();\r\n', 'query', 1, 0, '2024-03-10 13:20:26'),
(73, 'số lượng phiếu nvl', '', 'Bạn muốn xem phiếu nhập nguyên vật liệu hay phiếu xuất nguyên vật liệu ?', 'text', 1, 0, '2024-03-10 13:24:02'),
(74, 'xuất nguyên vật liệu', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-03-10 13:24:13'),
(75, 'số lượng', '', 'echo "số lượng phiếu nhập nguyên vật liệu hiện tại là: " . $p->countPNNVL();\r\n', 'query', 1, 0, '2024-03-10 13:25:45'),
(76, 'số lượng', '', 'Bạn muốn xem phiếu nhập nguyên vật liệu hay phiếu xuất nguyên vật liệu ?', 'text', 1, 0, '2024-03-10 13:25:45'),
(77, 'phiếu xuất nvl', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-03-10 13:39:24'),
(78, 'số phiếu xnvl', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-03-10 13:39:31'),
(79, 'sl pxtp', '', 'echo "số lượng phiếu xuất thành phẩm hiện tại là: " . $p->countPXTP();', 'query', 1, 0, '2024-03-10 13:41:55'),
(80, 'số phiếu nnvl', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-03-10 13:45:48'),
(81, 'số lượng phiếu nnvl', '', 'echo "số lượng phiếu nhập nguyên vật liệu hiện tại là: " . $p->countPNNVL();\r\n', 'query', 1, 0, '2024-03-10 13:45:59'),
(82, 'số phiếu nhập nvl', '', 'echo "số lượng phiếu nhập nguyên vật liệu hiện tại là: " . $p->countPNNVL();\r\n', 'query', 1, 0, '2024-03-10 13:46:07'),
(83, 'số phiếu xtp', '', 'echo "số lượng phiếu xuất thành phẩm hiện tại là: " . $p->countPXTP();', 'query', 1, 0, '2024-03-10 13:48:51'),
(84, 'hiếu là ai', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-03-10 13:49:06'),
(85, 'số phiếu xtp', '', 'echo "số lượng phiếu xuất thành phẩm hiện tại là: " . $p->countPXTP();', 'query', 1, 0, '2024-03-10 13:49:13'),
(86, 'số phiếu nvl', '', 'Bạn muốn xem phiếu nhập nguyên vật liệu hay phiếu xuất nguyên vật liệu ?', 'text', 1, 0, '2024-03-10 13:51:00'),
(87, 'số phiếu nhập nvl', '', 'echo "số lượng phiếu nhập nguyên vật liệu hiện tại là: " . $p->countPNNVL();\r\n', 'query', 1, 0, '2024-03-10 13:51:08'),
(88, 'a', '', 'Hãy cho tôi nội dung cụ thể về một chủ đề nào đó !', 'text', 1, 0, '2024-03-11 09:04:08'),
(89, 'số phiếu nvl', '', 'Bạn muốn xem phiếu nhập nguyên vật liệu hay phiếu xuất nguyên vật liệu ?', 'text', 1, 0, '2024-03-11 09:04:15'),
(90, 'số phiếu nhập nvl', '', 'echo "số lượng phiếu nhập nguyên vật liệu hiện tại là: " . $p->countPNNVL();\r\n', 'query', 1, 0, '2024-03-11 09:04:25'),
(91, 'mấy giờ rồi', '', 'echo "bây giờ là ".$child1;', 'query', 1, 0, '2024-03-11 09:05:17'),
(92, 'mở google', '', '<a href="https://google.com" target="blank_">Click vào đây để truy cập google<a/>', 'text', 1, 0, '2024-03-11 09:05:27'),
(93, 'số lượng kẹo bạc hà trong kho', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-03-11 09:10:28'),
(94, 'a', '', 'Hãy cho tôi nội dung cụ thể về một chủ đề nào đó !', 'text', 1, 0, '2024-03-11 09:12:43'),
(95, 'd2warehouse', '', 'D2Warehouse là đơn vị kho sản xuất và cung cấp các sản phẩm từ đậu nành, với nguyên vật liệu chính là đậu nành và sản phẩm thành phẩm bao gồm bã đậu nành và dầu đậu nành. Để đảm bảo chất lượng sản phẩm và đáp ứng nhu cầu của khách hàng, hệ thống quản lý kho được xây dựng bởi Lê Hạnh Hải Đăng và Bùi Thục Đoan.', 'text', 1, 0, '2024-03-11 09:13:47'),
(96, 'mở google', '', '<a href="https://google.com" target="blank_">Click vào đây để truy cập google<a/>', 'text', 1, 0, '2024-03-12 12:37:42'),
(97, 'mở google', '', '<a href="https://google.com" target="blank_">Click vào đây để truy cập google<a/>', 'text', 1, 0, '2024-03-17 12:55:59'),
(98, 'số phiếu nhập nvl', '', 'echo "số lượng phiếu nhập nguyên vật liệu hiện tại là: " . $p->countPNNVL();\r\n', 'query', 1, 0, '2024-03-17 12:56:07'),
(99, 'mấy giờ rồi', '', 'echo "bây giờ là ".$child1;', 'query', 1, 0, '2024-03-17 12:57:07'),
(100, 'a', '', 'Hãy cho tôi nội dung cụ thể về một chủ đề nào đó !', 'text', 1, 0, '2024-03-17 13:05:19'),
(101, 'ewfwfsf', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-03-17 14:14:33'),
(102, 'mấy giờ rồi', '', 'echo "bây giờ là ".$child1;', 'query', 1, 0, '2024-03-17 22:40:38'),
(103, 'phieunvl', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-03-17 22:40:42'),
(104, 'phieunnvl', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-03-17 22:40:45'),
(105, 'phiếu nnvl', '', 'echo "số lượng phiếu nhập nguyên vật liệu hiện tại là: " . $p->countPNNVL();\r\n', 'query', 1, 0, '2024-03-17 22:40:49'),
(106, 'số phiếu nvl', '', 'Bạn muốn xem phiếu nhập nguyên vật liệu hay phiếu xuất nguyên vật liệu ?', 'text', 1, 0, '2024-03-17 22:41:13'),
(107, 'phiếu nhập nvl', '', 'echo "số lượng phiếu nhập nguyên vật liệu hiện tại là: " . $p->countPNNVL();\r\n', 'query', 1, 0, '2024-03-17 22:41:17'),
(108, 'ádasd', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-03-20 13:40:47'),
(109, 'a', '', 'Hãy cho tôi nội dung cụ thể về một chủ đề nào đó !', 'text', 1, 0, '2024-03-20 14:58:07'),
(110, 'sdfsf', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-03-21 21:10:20'),
(111, 'xin chào', '', 'Xin chào, tôi la D2Warehousebot, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-03-21 21:10:23'),
(112, 'xem phiếu nguyên vật liệu', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-03-21 21:10:32'),
(113, 'zxczc', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-03-21 21:16:27'),
(114, 'sdfsadf', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-03-21 21:19:02'),
(115, 'ádfasdf', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-03-21 21:19:04'),
(116, 'phiếu xnvl', '', 'echo "số lượng phiếu xuất nguyên vật liệu hiện tại là: " . $p->countPXNVL();', 'query', 1, 0, '2024-03-21 21:19:20'),
(117, 'phiếu xnvl', '', 'echo "số lượng phiếu xuất nguyên vật liệu hiện tại là: " . $p->countPXNVL();', 'query', 1, 0, '2024-03-21 21:19:34'),
(118, 'a', '', 'Hãy cho tôi nội dung cụ thể về một chủ đề nào đó !', 'text', 1, 0, '2024-03-21 21:27:34'),
(119, 'a', '', 'Hãy cho tôi nội dung cụ thể về một chủ đề nào đó !', 'text', 1, 0, '2024-03-21 21:27:45'),
(120, 'a', '', 'Hãy cho tôi nội dung cụ thể về một chủ đề nào đó !', 'text', 1, 0, '2024-03-21 21:27:52'),
(121, 'a', '', 'Hãy cho tôi nội dung cụ thể về một chủ đề nào đó !', 'text', 1, 0, '2024-03-21 21:33:25'),
(122, 'a', '', 'Hãy cho tôi nội dung cụ thể về một chủ đề nào đó !', 'text', 1, 0, '2024-03-21 21:33:33'),
(123, 'ơ', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-03-21 22:04:57'),
(124, 'phieu nnvl', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-03-22 09:33:07'),
(125, 'phieu nnvl', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-03-22 09:33:17'),
(126, 'phieu nvl', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-03-22 09:33:23'),
(127, 'so phieu nvl', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-03-22 09:33:34'),
(128, 'hi', '', 'Xin chào, tôi la D2Warehousebot, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-03-22 09:33:44'),
(129, 'may gio roi', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-03-22 09:33:51'),
(130, 'what time is it', '', 'echo "bây giờ là ".$child1;', 'query', 1, 0, '2024-03-22 09:33:56'),
(131, 'phieu xnvl', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-03-22 09:35:36'),
(132, 'so phieu nvl', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-03-22 09:36:50'),
(133, 'so phieu nnvl', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-03-22 09:36:57'),
(134, 'số phiếu nnvl', '', 'echo "số lượng phiếu nhập nguyên vật liệu hiện tại là: " . $p->countPNNVL();\r\n', 'query', 1, 0, '2024-03-22 09:38:17'),
(135, 'so phieu nnvl', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-03-22 09:38:26'),
(136, 'nguyên vật liệu', '', 'echo "số lượng phiếu nhập nguyên vật liệu hiện tại là: " . $p->countPNNVL();\r\n', 'query', 1, 0, '2024-03-22 09:40:10'),
(137, 'nguyên vật liệu', '', 'echo "số lượng phiếu xuất nguyên vật liệu hiện tại là: " . $p->countPXNVL();', 'query', 1, 0, '2024-03-22 09:40:10'),
(138, 'nguyên vật liệu', '', 'Bạn muốn xem phiếu nhập nguyên vật liệu hay phiếu xuất nguyên vật liệu ?', 'text', 1, 0, '2024-03-22 09:40:10'),
(139, 'nhập nguyên vật liệu', '', 'echo "số lượng phiếu nhập nguyên vật liệu hiện tại là: " . $p->countPNNVL();\r\n', 'query', 1, 0, '2024-03-22 09:40:18'),
(140, 'a', '', 'Hãy cho tôi nội dung cụ thể về một chủ đề nào đó !', 'text', 1, 0, '2024-03-22 09:41:32'),
(141, 'a', '', 'Hãy cho tôi nội dung cụ thể về một chủ đề nào đó !', 'text', 1, 0, '2024-03-22 09:41:40'),
(142, 'a', '', 'Hãy cho tôi nội dung cụ thể về một chủ đề nào đó !', 'text', 1, 0, '2024-03-22 09:45:25'),
(143, 'hello', '', 'Xin chào, tôi la D2Warehousebot, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 12:45:12'),
(144, 'hi', '', 'Xin chào, tôi la D2Warehousebot, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 12:49:14'),
(145, 'so phieu nvl', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 12:51:51'),
(146, 'so phieu nnvl', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 12:51:56'),
(147, 'số phiếu nnvl', '', 'echo "số lượng phiếu nhập nguyên vật liệu hiện tại là: " . $p->countPNNVL();\r\n', 'query', 1, 0, '2024-04-06 12:52:00'),
(148, 'ád', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 13:04:21'),
(149, 'dfgdgf', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 13:04:24'),
(150, 'ádad', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 13:06:44'),
(151, 'ád', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 13:06:49'),
(152, 'dgfdfg', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 13:07:10'),
(153, 'dfg', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 13:07:13'),
(154, 'dfgdfg', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 13:07:16'),
(155, 'dfgdg', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 13:07:18'),
(156, 'dfgdfgdfg', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 13:07:23'),
(157, 'sdfsd', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 13:07:56'),
(158, 'hay', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 13:11:57'),
(159, 'sdfsdf', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 13:12:08'),
(160, 's', '', 'Hãy cho tôi nội dung cụ thể về một chủ đề nào đó !', 'text', 1, 0, '2024-04-06 13:13:00'),
(161, 's', '', 'Hãy cho tôi nội dung cụ thể về một chủ đề nào đó !', 'text', 1, 0, '2024-04-06 13:13:41'),
(162, 'fgh', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 13:13:44'),
(163, '', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 13:13:46'),
(164, '', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 13:13:47'),
(165, '', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 13:13:47'),
(166, '', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 13:13:47'),
(167, '', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 13:13:47'),
(168, '', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 13:13:48'),
(169, '', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 13:13:48'),
(170, '', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 13:13:48'),
(171, '', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 13:13:48'),
(172, '', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 13:13:48'),
(173, '', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 13:13:49'),
(174, '', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 13:13:49'),
(175, '', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 13:13:49'),
(176, '', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 13:13:49'),
(177, 'sss', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 13:14:31'),
(178, 'hello ', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 13:14:46'),
(179, 'số phiếu nnvl', '', 'echo "số lượng phiếu nhập nguyên vật liệu hiện tại là: " . $p->countPNNVL();\r\n', 'query', 1, 0, '2024-04-06 13:14:54'),
(180, 'aaa', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 13:18:24'),
(181, 'aaaa', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 13:18:42'),
(182, 'số phiếu nnvl', '', 'echo "số lượng phiếu nhập nguyên vật liệu hiện tại là: " . $p->countPNNVL();\r\n', 'query', 1, 0, '2024-04-06 13:19:07'),
(183, 'a', '', 'Hãy cho tôi nội dung cụ thể về một chủ đề nào đó !', 'text', 1, 0, '2024-04-06 13:19:38'),
(184, 'hello', '', 'Xin chào, tôi la D2Warehousebot, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 13:48:20'),
(185, 'số phiếu nnvl', '', 'echo "số lượng phiếu nhập nguyên vật liệu hiện tại là: " . $p->countPNNVL();\r\n', 'query', 1, 0, '2024-04-06 13:48:36'),
(186, 'halo', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 13:50:26'),
(187, 'hi', '', 'Xin chào, tôi la D2Warehousebot, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 13:51:51'),
(188, 'aaa', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 13:53:35'),
(189, 'aa', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 13:53:37'),
(190, 'aaaa', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 13:53:40'),
(191, 'aaa', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 13:55:28'),
(192, 'ồ xin chào', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 13:55:33'),
(193, 'what time is it', '', 'echo "bây giờ là ".$child1;', 'query', 1, 0, '2024-04-06 13:55:41'),
(194, 'omg', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 13:56:35'),
(195, 'xin chào', '', 'Xin chào, tôi la D2Warehousebot, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 13:56:41'),
(196, '', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 13:57:22'),
(197, 'a', '', 'Hãy cho tôi nội dung cụ thể về một chủ đề nào đó !', 'text', 1, 0, '2024-04-06 13:57:23'),
(198, 'aaa', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 14:00:11'),
(199, 'aaa', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 14:00:13'),
(200, '123', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 14:00:55'),
(201, 'sdfsd', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 14:01:10'),
(202, 'sdfs', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 14:01:13'),
(203, 'aa', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 14:02:55'),
(204, 'hả', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 14:02:59'),
(205, '', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 14:03:02'),
(206, '', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 14:03:03'),
(207, '', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 14:03:03'),
(208, '', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 14:03:03'),
(209, 'aaaasdfasdf', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 14:06:01'),
(210, 'hả', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 14:06:04'),
(211, 'what', '', 'echo "bây giờ là ".$child1;', 'query', 1, 0, '2024-04-06 14:06:17'),
(212, 'haha', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 14:07:06'),
(213, 'k hieu', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 14:08:20'),
(214, 'aaaaa', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 14:09:27'),
(215, 'ồ xin chào', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 14:09:31'),
(216, 'haha', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 14:09:43'),
(217, 'có vẻ đã thành công', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 14:10:30'),
(218, 'tôi thật tài giỏi', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 14:10:36'),
(219, 'xin chào nhé', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 14:13:39'),
(220, 'hello', '', 'Xin chào, tôi la D2Warehousebot, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 14:15:22'),
(221, 'hello', '', 'Xin chào, tôi la D2Warehousebot, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 14:17:08'),
(222, 'aaaa', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 14:17:44'),
(223, 'aaa', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 14:17:59'),
(224, 'aaa', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 14:18:16'),
(225, 'aa', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 14:18:23'),
(226, 'ủa là sao', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 14:18:32'),
(227, '', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 14:18:36'),
(228, 'vãi cả bìu', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 14:19:01'),
(229, 'haha', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 14:20:10'),
(230, '', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 14:20:11'),
(231, 'hả', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 14:22:03'),
(232, 'what the fuck', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 14:22:09'),
(233, 'số phiếu nhập nv;', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 14:22:30'),
(234, 'số phiếu nhập nvl', '', 'echo "số lượng phiếu nhập nguyên vật liệu hiện tại là: " . $p->countPNNVL();\r\n', 'query', 1, 0, '2024-04-06 14:22:36'),
(235, 'hé lô', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 14:27:15'),
(236, 'hello', '', 'Xin chào, tôi la D2Warehousebot, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 14:28:27'),
(237, 'xin chào', '', 'Xin chào, tôi la D2Warehousebot, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 14:28:32'),
(238, 'xin chào', '', 'Xin chào, tôi la D2Warehousebot, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 14:30:09'),
(239, 'aaa', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 14:30:12'),
(240, 'vãi', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 14:30:15'),
(241, 'what time is it', '', 'echo "bây giờ là ".$child1;', 'query', 1, 0, '2024-04-06 15:42:40'),
(242, 'hello', '', 'Xin chào, tôi la D2Warehousebot, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 17:20:31'),
(243, '', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 19:54:00'),
(244, '', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 19:57:51'),
(245, '', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 19:57:53'),
(246, '', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 19:57:53'),
(247, '', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 19:57:53'),
(248, '', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 19:57:53'),
(249, '', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 19:57:53'),
(250, '', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 19:57:54'),
(251, '', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 19:57:54'),
(252, 'hello', '', 'Xin chào, tôi la D2Warehousebot, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 20:54:03'),
(253, 'xem phiếu nhập', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 20:54:09'),
(254, '', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-06 21:36:00'),
(255, 'cc', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-07 16:47:10'),
(256, 'may gio roi', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-07 16:47:19'),
(257, 'what time is it', '', 'echo "bây giờ là ".$child1;', 'query', 1, 0, '2024-04-07 16:47:27'),
(258, 'bây giờ là mấy giờ', '', 'echo "bây giờ là ".$child1;', 'query', 1, 0, '2024-04-09 13:28:46'),
(259, 'xin chào', '', 'Xin chào, tôi la D2Warehousebot, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-09 13:28:55'),
(260, 'ai là người đẹp trai nhất', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-09 13:29:02'),
(261, '', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-09 13:59:23'),
(262, 'sè', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-09 13:59:25'),
(263, 'ádasdasd', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-09 13:59:44'),
(264, 'ádssad', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-09 14:05:41'),
(265, 'adasd', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-09 14:13:51'),
(266, '', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-09 14:13:58'),
(267, 'cc', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-09 14:13:59'),
(268, 'hello', '', 'Xin chào, tôi la D2Warehousebot, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-09 20:08:48'),
(269, 'hello', '', 'Xin chào, tôi la D2Warehousebot, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-09 20:11:22'),
(270, 'chaof banj', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-09 20:11:26'),
(271, 'hi', '', 'Xin chào, tôi la D2Warehousebot, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-09 20:11:41'),
(272, 'dsfs', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-09 20:48:17'),
(273, 'hi', '', 'Xin chào, tôi la D2Warehousebot, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-09 20:48:20'),
(274, 'xin chào', '', 'Xin chào, tôi la D2Warehousebot, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-09 20:48:28'),
(275, 'hi', '', 'Xin chào, tôi la D2Warehousebot, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-09 20:53:52'),
(276, 'bây giờ là mấy giờ', '', 'echo "bây giờ là ".$child1;', 'query', 1, 0, '2024-04-09 20:54:00'),
(277, '', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-09 23:03:19'),
(278, '131213', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-09 23:08:49'),
(279, 'phiếu xnvl', '', 'echo "số lượng phiếu xuất nguyên vật liệu hiện tại là: " . $p->countPXNVL();', 'query', 1, 0, '2024-04-09 23:08:55'),
(280, 'số phiếu nnvl', '', 'echo "số lượng phiếu nhập nguyên vật liệu hiện tại là: " . $p->countPNNVL();\r\n', 'query', 1, 0, '2024-04-10 12:56:26'),
(281, 'số phiếu nnvl', '', 'echo "số lượng phiếu nhập nguyên vật liệu hiện tại là: " . $p->countPNNVL();\r\n', 'query', 1, 0, '2024-04-10 12:57:51'),
(282, 'phiếu xnvl', '', 'echo "số lượng phiếu xuất nguyên vật liệu hiện tại là: " . $p->countPXNVL();', 'query', 1, 0, '2024-04-10 12:58:14'),
(283, '', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-10 13:23:33'),
(284, '', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-10 13:51:18'),
(285, 'phiếu xnvl', '', 'echo "số lượng phiếu xuất nguyên vật liệu hiện tại là: " . $p->countPXNVL();', 'query', 1, 0, '2024-04-10 13:51:21'),
(286, '', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-10 14:15:41'),
(287, 'hello', '', 'Xin chào, tôi la D2Warehousebot, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-12 10:16:17'),
(288, 'mo google', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-12 10:17:24'),
(289, 'mở google', '', '<a href="https://google.com" target="blank_">Click vào đây để truy cập google<a/>', 'text', 1, 0, '2024-04-12 10:17:42'),
(290, 'd2warehouse', '', 'D2Warehouse là đơn vị kho sản xuất và cung cấp các sản phẩm từ đậu nành, với nguyên vật liệu chính là đậu nành và sản phẩm thành phẩm bao gồm bã đậu nành và dầu đậu nành. Để đảm bảo chất lượng sản phẩm và đáp ứng nhu cầu của khách hàng, hệ thống quản lý kho được xây dựng bởi Lê Hạnh Hải Đăng và Bùi Thục Đoan.', 'text', 1, 0, '2024-04-12 10:18:01'),
(291, 'hello', '', 'Xin chào, tôi la D2Warehousebot, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-12 10:18:23'),
(292, 'd2ware', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-12 10:18:32'),
(293, 'd2warehouse', '', 'D2Warehouse là đơn vị kho sản xuất và cung cấp các sản phẩm từ đậu nành, với nguyên vật liệu chính là đậu nành và sản phẩm thành phẩm bao gồm bã đậu nành và dầu đậu nành. Để đảm bảo chất lượng sản phẩm và đáp ứng nhu cầu của khách hàng, hệ thống quản lý kho được xây dựng bởi Lê Hạnh Hải Đăng và Bùi Thục Đoan.', 'text', 1, 0, '2024-04-12 10:18:36'),
(294, 'giúp tôi trả lời một số câu hỏi nhé', '', 'Tôi luôn sẵn sàng trả lời những câu hỏi và yêu cầu của bạn', 'text', 1, 0, '2024-04-12 10:19:53'),
(295, 'tôi muốn hỏi', '', 'Tôi luôn sẵn sàng trả lời những câu hỏi và yêu cầu của bạn', 'text', 1, 0, '2024-04-12 10:20:04'),
(296, 'hello', '', 'Xin chào, tôi la D2Warehousebot, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-12 10:38:45'),
(297, 'so phieu nnvl', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-12 10:38:49'),
(298, 'phiếu xnvl', '', 'echo "số lượng phiếu xuất nguyên vật liệu hiện tại là: " . $p->countPXNVL();', 'query', 1, 0, '2024-04-12 10:38:54'),
(299, 'vãi', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-13 11:49:25'),
(300, '???', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-13 11:59:16'),
(301, 'd2warehouse', '', 'D2Warehouse là đơn vị kho sản xuất và cung cấp các sản phẩm từ đậu nành, với nguyên vật liệu chính là đậu nành và sản phẩm thành phẩm bao gồm bã đậu nành và dầu đậu nành. Để đảm bảo chất lượng sản phẩm và đáp ứng nhu cầu của khách hàng, hệ thống quản lý kho được xây dựng bởi Lê Hạnh Hải Đăng và Bùi Thục Đoan.', 'text', 1, 0, '2024-04-13 12:03:56'),
(302, 'đơn hàng', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-13 12:04:10'),
(303, 'số lượng đơn hàng', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-13 12:04:23'),
(304, 'hello', '', 'Xin chào, tôi la D2Warehousebot, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-13 12:06:06'),
(305, 'bây giờ là mấy giờ', '', 'echo "bây giờ là ".$child1;', 'query', 1, 0, '2024-04-13 12:06:23'),
(306, 'kho có địa chỉ ở đâu', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-13 12:06:41'),
(307, 'địa chỉ kho', '', 'kho d2warehouse có 3 địa chỉ. Kho 1: 4 Nguyễn Văn Bảo, kho 2: 142 Lê Lợi, kho 3: 123 Trần Văn Dư', '', 1, 0, '2024-04-13 12:11:01'),
(308, 'địa chỉ kho', '', 'kho d2warehouse có 3 địa chỉ. Kho 1: 4 Nguyễn Văn Bảo, kho 2: 142 Lê Lợi, kho 3: 123 Trần Văn Dư', 'text', 1, 0, '2024-04-13 12:12:22'),
(309, 'd2warehouse thành lập năm nào', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-13 12:13:09'),
(310, 'làm cách nào để liên lạc với bgd', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-13 12:26:24'),
(311, 'r', '', 'Hãy cho tôi nội dung cụ thể về một chủ đề nào đó !', 'text', 1, 0, '2024-04-13 12:30:20'),
(312, 'ư', '', 'Hãy cho tôi nội dung cụ thể về một chủ đề nào đó !', 'text', 1, 0, '2024-04-13 12:30:29'),
(313, 'd', '', 'Hãy cho tôi nội dung cụ thể về một chủ đề nào đó !', 'text', 1, 0, '2024-04-13 12:34:23'),
(314, '.', '', 'Hãy cho tôi nội dung cụ thể về một chủ đề nào đó !', 'text', 1, 0, '2024-04-13 12:34:30'),
(315, '.', '', 'Hãy cho tôi nội dung cụ thể về một chủ đề nào đó !', 'text', 1, 0, '2024-04-13 12:34:30'),
(316, 'a', '', 'Hãy cho tôi nội dung cụ thể về một chủ đề nào đó !', 'text', 1, 0, '2024-04-14 09:49:27'),
(317, 'số nvl', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-14 09:49:45'),
(318, 'số lượng nvl', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-14 09:49:56'),
(319, 'số phiếu xnvl', '', 'echo "số lượng phiếu xuất nguyên vật liệu hiện tại là: " . $p->countPXNVL();', 'query', 1, 0, '2024-04-14 09:51:13'),
(320, 's', '', 'Hãy cho tôi nội dung cụ thể về một chủ đề nào đó !', 'text', 1, 0, '2024-04-14 09:57:34'),
(321, 'số nvl', '', 'echo "số nguyên vật liệu trong kho là ".$countNVl;', 'query', 1, 0, '2024-04-14 09:57:42'),
(322, 'số nvl', '', 'echo "số nguyên vật liệu trong kho là ".$countNVl;', 'query', 1, 0, '2024-04-14 09:58:41'),
(323, 'số nvl', '', 'echo "số nguyên vật liệu trong kho là " .$countNVL;', 'query', 1, 0, '2024-04-14 09:59:38'),
(324, 'số nvl', '', 'echo "số nguyên vật liệu trong kho là " . $p->countNVL();', 'query', 1, 0, '2024-04-14 10:00:53'),
(325, 'số nvl', '', 'echo "số nguyên vật liệu trong kho là " . $p->countNVL();', 'query', 1, 0, '2024-04-14 10:02:29'),
(326, 'số nvl', '', 'echo "số nguyên vật liệu trong kho là " . $p->countNVL();', 'query', 1, 0, '2024-04-14 10:03:07'),
(327, 'số nvl', '', 'echo "số nguyên vật liệu trong kho là " . $p->countNVL();', 'query', 1, 0, '2024-04-14 10:03:43'),
(328, 'quy trình nhập kho', '', 'Đầu tiên nhân viên kho sẽ kiểm tra số lượng hàng tồn và báo cáo cho phòng kế hoạch, phòng kế hoạch sẽ đưa ra đề xuất nhập nguyên vật liệu cho giám đốc phê duyệt. Sau khi phê duyệt sẽ có đơn vị đến giao nguyên liệu thô, nhân viên kho tiến hành nhập kho và cập nhật thông tin ', 'text', 1, 0, '2024-04-14 10:17:56'),
(329, 'quy trình xnvl', '', 'Phòng kế hoạch đưa ra kế hoạch sản xuất cho giám đốc phê duyệt, sau khi được duyệt quản lý kho sẽ điều phối xuất nguyên vật liệu cho nhân viên kho, nhân viên kho sẽ lập biên bản xuất nguyên vật liệu và cập nhật thông tin', '', 1, 0, '2024-04-14 10:29:14'),
(330, 'quy trình xnvl', '', 'Phòng kế hoạch đưa ra kế hoạch sản xuất cho giám đốc phê duyệt, sau khi được duyệt quản lý kho sẽ điều phối xuất nguyên vật liệu cho nhân viên kho, nhân viên kho sẽ lập biên bản xuất nguyên vật liệu và cập nhật thông tin', 'text', 1, 0, '2024-04-14 10:30:06'),
(331, 'xuat tp', '', 'Sau khi hoàn thành việc sản xuất, quản lý kho sẽ điều phối xuất thành phẩm theo các đơn hàng ', 'text', 1, 0, '2024-04-14 10:37:07'),
(332, 'bây giờ là mấy giờ', '', 'echo "bây giờ là ".$child1;', 'query', 1, 0, '2024-04-14 10:43:04'),
(333, 'so luong don hang', '', 'echo "Số lượng đơn hàng là:" . $p->countDonhang();', 'query', 1, 0, '2024-04-14 10:48:54'),
(334, 'so nvl', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-14 10:50:32'),
(335, 'số nvl', '', 'echo "số nguyên vật liệu trong kho là " . $p->countNVL();', 'query', 1, 0, '2024-04-14 10:50:38'),
(336, 'số nvl', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-14 10:53:30'),
(337, 's', '', 'Hãy cho tôi nội dung cụ thể về một chủ đề nào đó !', 'text', 1, 0, '2024-04-14 10:54:34'),
(338, 'số lượng đơn hàng', '', 'echo "Số lượng đơn hàng là:" . $p->countDonhang();', 'query', 1, 0, '2024-04-14 10:54:40'),
(339, 'b', '', 'Hãy cho tôi nội dung cụ thể về một chủ đề nào đó !', 'text', 1, 0, '2024-04-14 10:55:51'),
(340, 'bâ', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-14 10:56:06'),
(341, 'bây giờ là mấy giờ', '', 'echo "bây giờ là ".$child1;', 'query', 1, 0, '2024-04-14 10:56:16'),
(342, 'địa chỉ kho', '', 'kho d2warehouse có 3 địa chỉ. Kho 1: 4 Nguyễn Văn Bảo, kho 2: 142 Lê Lợi, kho 3: 123 Trần Văn Dư', 'text', 1, 0, '2024-04-14 10:56:25'),
(343, 'địa chỉ kho', '', 'kho d2warehouse có 3 địa chỉ. Kho 1: 4 Nguyễn Văn Bảo, kho 2: 142 Lê Lợi, kho 3: 123 Trần Văn Dư', 'text', 1, 0, '2024-04-14 11:01:05'),
(344, 'd2warehouse', '', 'D2Warehouse là đơn vị kho sản xuất và cung cấp các sản phẩm từ đậu nành, với nguyên vật liệu chính là đậu nành và sản phẩm thành phẩm bao gồm bã đậu nành và dầu đậu nành. Để đảm bảo chất lượng sản phẩm và đáp ứng nhu cầu của khách hàng, hệ thống quản lý kho được xây dựng bởi Lê Hạnh Hải Đăng và Bùi Thục Đoan.', 'text', 1, 0, '2024-04-14 11:02:18'),
(345, 'd2warehouse', '', 'kho d2warehouse được thành lập vào tháng 12 năm 2023', '', 1, 0, '2024-04-14 11:02:18'),
(346, 'bây', '', 'echo "bây giờ là ".$child1;', 'query', 1, 0, '2024-04-14 11:03:30'),
(347, 'hello', '', 'Xin chào, tôi la D2Warehousebot, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-14 11:07:11'),
(348, 'hello', '', 'Xin chào, tôi la D2Warehousebot, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-14 11:09:39'),
(349, 'hello', '', 'Xin chào, tôi la D2Warehousebot, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-14 11:10:06'),
(350, 'hello', '', 'Xin chào, tôi la D2Warehousebot, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-14 11:12:09'),
(351, 'd2warehouse', '', 'D2Warehouse là đơn vị kho sản xuất và cung cấp các sản phẩm từ đậu nành, với nguyên vật liệu chính là đậu nành và sản phẩm thành phẩm bao gồm bã đậu nành và dầu đậu nành. Để đảm bảo chất lượng sản phẩm và đáp ứng nhu cầu của khách hàng, hệ thống quản lý kho được xây dựng bởi Lê Hạnh Hải Đăng và Bùi Thục Đoan.', 'text', 1, 0, '2024-04-14 11:14:41'),
(352, 'd2warehouse', '', 'kho d2warehouse được thành lập vào tháng 12 năm 2023', '', 1, 0, '2024-04-14 11:14:41'),
(353, 'hello', '', 'Xin chào, tôi la D2Warehousebot, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-14 11:16:21'),
(354, 'ai la nguoi chiu trach nhiem cho sp', '', 'Quản lý kho sẽ là người chịu trách nhiệm cho sản phẩm', 'text', 1, 0, '2024-04-14 11:25:41'),
(355, 'd2 co bao nhieu kho', '', 'echo "d2warehouse có: " . $p->countKho() "kho"; ', 'query', 1, 0, '2024-04-14 11:30:30'),
(356, 'd2 co bao nhieu kho', '', 'echo "d2warehouse có: " . $p->countKho() . "kho"; ', 'query', 1, 0, '2024-04-14 11:31:22'),
(357, 'd2 có bao nhiêu kho', '', 'echo "d2warehouse có: " . $p->countKho() . " kho"; ', 'query', 1, 0, '2024-04-14 11:32:56'),
(358, 'kho nvl', '', 'echo "d2warehouse có: " . $p->countKhonvl() . " kho nguyên vật liệu";', 'query', 1, 0, '2024-04-14 11:40:50'),
(359, 'kho nvl', '', 'echo "d2warehouse có: " . $p->countKhonvl() . " kho nguyên vật liệu";', 'query', 1, 0, '2024-04-14 11:41:06'),
(360, 'khp tp', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-14 11:44:16'),
(361, 'kho tp', '', 'echo "d2warehouse có: " . $p->countKhotp() ." kho thành phẩm";', 'query', 1, 0, '2024-04-14 11:44:22'),
(362, 'kho', '', 'D2Warehouse là đơn vị kho sản xuất và cung cấp các sản phẩm từ đậu nành, với nguyên vật liệu chính là đậu nành và sản phẩm thành phẩm bao gồm bã đậu nành và dầu đậu nành. Để đảm bảo chất lượng sản phẩm và đáp ứng nhu cầu của khách hàng, hệ thống quản lý kho được xây dựng bởi Lê Hạnh Hải Đăng và Bùi Thục Đoan.', 'text', 1, 0, '2024-04-14 11:45:14'),
(363, 'kho', '', 'kho d2warehouse có 3 địa chỉ. Kho 1: 4 Nguyễn Văn Bảo, kho 2: 142 Lê Lợi, kho 3: 123 Trần Văn Dư', 'text', 1, 0, '2024-04-14 11:45:14'),
(364, 'kho', '', 'kho d2warehouse được thành lập vào tháng 12 năm 2023', '', 1, 0, '2024-04-14 11:45:14'),
(365, 'kho', '', 'Đầu tiên nhân viên kho sẽ kiểm tra số lượng hàng tồn và báo cáo cho phòng kế hoạch, phòng kế hoạch sẽ đưa ra đề xuất nhập nguyên vật liệu cho giám đốc phê duyệt. Sau khi phê duyệt sẽ có đơn vị đến giao nguyên liệu thô, nhân viên kho tiến hành lập phiếu nhập kho và cập nhật thông tin ', 'text', 1, 0, '2024-04-14 11:45:14');
INSERT INTO `chats` (`id`, `user`, `user_mail`, `chatbot`, `action`, `status`, `del_msg`, `date`) VALUES
(366, 'kho', '', 'echo "d2warehouse có: " . $p->countKho() . " kho. Bao gồm kho nguyên vật liệu và thành phẩm."; ', 'query', 1, 0, '2024-04-14 11:45:14'),
(367, 'kho', '', 'echo "d2warehouse có: " . $p->countKhonvl() . " kho nguyên vật liệu";', 'query', 1, 0, '2024-04-14 11:45:14'),
(368, 'kho', '', 'echo "d2warehouse có: " . $p->countKhotp() ." kho thành phẩm";', 'query', 1, 0, '2024-04-14 11:45:14'),
(369, 'so luong kho', '', 'echo "d2warehouse có: " . $p->countKhonvl() . " kho nguyên vật liệu";', 'query', 1, 0, '2024-04-14 11:45:48'),
(370, 'so luong kho', '', 'echo "d2warehouse có: " . $p->countKhotp() ." kho thành phẩm";', 'query', 1, 0, '2024-04-14 11:45:48'),
(371, 'kho', '', 'D2Warehouse là đơn vị kho sản xuất và cung cấp các sản phẩm từ đậu nành, với nguyên vật liệu chính là đậu nành và sản phẩm thành phẩm bao gồm bã đậu nành và dầu đậu nành. Để đảm bảo chất lượng sản phẩm và đáp ứng nhu cầu của khách hàng, hệ thống quản lý kho được xây dựng bởi Lê Hạnh Hải Đăng và Bùi Thục Đoan.', 'text', 1, 0, '2024-04-14 11:46:27'),
(372, 'kho', '', 'kho d2warehouse có 3 địa chỉ. Kho 1: 4 Nguyễn Văn Bảo, kho 2: 142 Lê Lợi, kho 3: 123 Trần Văn Dư', 'text', 1, 0, '2024-04-14 11:46:27'),
(373, 'kho', '', 'kho d2warehouse được thành lập vào tháng 12 năm 2023', '', 1, 0, '2024-04-14 11:46:27'),
(374, 'kho', '', 'Đầu tiên nhân viên kho sẽ kiểm tra số lượng hàng tồn và báo cáo cho phòng kế hoạch, phòng kế hoạch sẽ đưa ra đề xuất nhập nguyên vật liệu cho giám đốc phê duyệt. Sau khi phê duyệt sẽ có đơn vị đến giao nguyên liệu thô, nhân viên kho tiến hành lập phiếu nhập kho và cập nhật thông tin ', 'text', 1, 0, '2024-04-14 11:46:27'),
(375, 'kho', '', 'echo "d2warehouse có: " . $p->countKho() . " kho. Bao gồm kho nguyên vật liệu và thành phẩm."; ', 'query', 1, 0, '2024-04-14 11:46:27'),
(376, 'kho', '', 'echo "d2warehouse có: " . $p->countKhonvl() . " kho nguyên vật liệu";', 'query', 1, 0, '2024-04-14 11:46:27'),
(377, 'kho', '', 'echo "d2warehouse có: " . $p->countKhotp() ." kho thành phẩm";', 'query', 1, 0, '2024-04-14 11:46:27'),
(378, 'so luong kho', '', 'echo "d2warehouse có: " . $p->countKhonvl() . " kho nguyên vật liệu";', 'query', 1, 0, '2024-04-14 11:46:33'),
(379, 'so luong kho', '', 'echo "d2warehouse có: " . $p->countKhotp() ." kho thành phẩm";', 'query', 1, 0, '2024-04-14 11:46:33'),
(380, 'kho nvl', '', 'echo "d2warehouse có: " . $p->countKhonvl() . " kho nguyên vật liệu";', 'query', 1, 0, '2024-04-14 11:46:50'),
(381, 'so luong kho', '', 'echo "d2warehouse có: " . $p->countKhonvl() . " kho nguyên vật liệu";', 'query', 1, 0, '2024-04-14 11:46:59'),
(382, 'so luong kho', '', 'echo "d2warehouse có: " . $p->countKhotp() ." kho thành phẩm";', 'query', 1, 0, '2024-04-14 11:46:59'),
(383, 'd2warehouse có bao  nhiêu kho', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-14 11:47:24'),
(384, 'kho', '', 'D2Warehouse là đơn vị kho sản xuất và cung cấp các sản phẩm từ đậu nành, với nguyên vật liệu chính là đậu nành và sản phẩm thành phẩm bao gồm bã đậu nành và dầu đậu nành. Để đảm bảo chất lượng sản phẩm và đáp ứng nhu cầu của khách hàng, hệ thống quản lý kho được xây dựng bởi Lê Hạnh Hải Đăng và Bùi Thục Đoan.', 'text', 1, 0, '2024-04-14 11:48:12'),
(385, 'kho', '', 'kho d2warehouse có 3 địa chỉ. Kho 1: 4 Nguyễn Văn Bảo, kho 2: 142 Lê Lợi, kho 3: 123 Trần Văn Dư', 'text', 1, 0, '2024-04-14 11:48:12'),
(386, 'kho', '', 'kho d2warehouse được thành lập vào tháng 12 năm 2023', '', 1, 0, '2024-04-14 11:48:12'),
(387, 'kho', '', 'Đầu tiên nhân viên kho sẽ kiểm tra số lượng hàng tồn và báo cáo cho phòng kế hoạch, phòng kế hoạch sẽ đưa ra đề xuất nhập nguyên vật liệu cho giám đốc phê duyệt. Sau khi phê duyệt sẽ có đơn vị đến giao nguyên liệu thô, nhân viên kho tiến hành lập phiếu nhập kho và cập nhật thông tin ', 'text', 1, 0, '2024-04-14 11:48:12'),
(388, 'kho', '', 'echo "d2warehouse có: " . $p->countKho() . " kho"; ', 'query', 1, 0, '2024-04-14 11:48:12'),
(389, 'kho', '', 'echo "d2warehouse có: " . $p->countKhonvl() . " kho nguyên vật liệu";', 'query', 1, 0, '2024-04-14 11:48:12'),
(390, 'kho', '', 'echo "d2warehouse có: " . $p->countKhotp() ." kho thành phẩm";', 'query', 1, 0, '2024-04-14 11:48:12'),
(391, 'd2warehouse có bao nhiêu kho', '', 'echo "d2warehouse có: " . $p->countKho() . " kho"; ', 'query', 1, 0, '2024-04-14 11:49:14'),
(392, 'd2warehouse có bao nhiêu kho', '', 'echo "d2warehouse có: " . $p->countKhonvl() . " kho nguyên vật liệu";', 'query', 1, 0, '2024-04-14 11:49:14'),
(393, 'd2warehouse có bao nhiêu kho', '', 'echo "d2warehouse có: " . $p->countKhotp() ." kho thành phẩm";', 'query', 1, 0, '2024-04-14 11:49:14'),
(394, 'số lượng kho', '', 'echo "d2warehouse có: " . $p->countKho() . " kho"; ', 'query', 1, 0, '2024-04-14 11:49:29'),
(395, 'số lượng kho', '', 'echo "d2warehouse có: " . $p->countKhonvl() . " kho nguyên vật liệu";', 'query', 1, 0, '2024-04-14 11:49:29'),
(396, 'số lượng kho', '', 'echo "d2warehouse có: " . $p->countKhotp() ." kho thành phẩm";', 'query', 1, 0, '2024-04-14 11:49:29'),
(397, 'hello', '', 'Xin chào, tôi la D2Warehousebot, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-14 11:50:35'),
(398, 'so luong kho', '', 'echo "d2warehouse có: " . $p->countKhonvl() . " kho nguyên vật liệu";', 'query', 1, 0, '2024-04-14 11:51:12'),
(399, 'so luong kho', '', 'echo "d2warehouse có: " . $p->countKhotp() ." kho thành phẩm";', 'query', 1, 0, '2024-04-14 11:51:12'),
(400, 'khô nvl', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-14 11:51:22'),
(401, 'kho nvl', '', 'echo "d2warehouse có: " . $p->countKhonvl() . " kho nguyên vật liệu";', 'query', 1, 0, '2024-04-14 11:51:26'),
(402, 'so luong kho', '', 'echo "d2warehouse có: " . $p->countKhonvl() . " kho nguyên vật liệu";', 'query', 1, 0, '2024-04-14 11:52:36'),
(403, 'so luong kho', '', 'echo "d2warehouse có: " . $p->countKhotp() ." kho thành phẩm";', 'query', 1, 0, '2024-04-14 11:52:36'),
(404, 'so luong kho', '', 'echo "d2warehouse có: " . $p->countKho(). " kho"; ', 'query', 1, 0, '2024-04-14 11:54:00'),
(405, 'so luong kho', '', 'echo "d2warehouse có: " . $p->countKhonvl() . " kho nguyên vật liệu";', 'query', 1, 0, '2024-04-14 11:54:00'),
(406, 'so luong kho', '', 'echo "d2warehouse có: " . $p->countKhotp() ." kho thành phẩm";', 'query', 1, 0, '2024-04-14 11:54:00'),
(407, 'so luong kho', '', 'echo "d2warehouse có: " . $p->countKho(). " kho"; ', 'query', 1, 0, '2024-04-14 11:54:46'),
(408, 'so luong kho', '', 'echo "d2warehouse có: " . $p->countKhonvl() . " kho nguyên vật liệu";', 'query', 1, 0, '2024-04-14 11:54:46'),
(409, 'số lượng kho', '', 'echo "d2warehouse có: " . $p->countKho(). " kho"; ', 'query', 1, 0, '2024-04-14 11:54:55'),
(410, 'số lượng kho', '', 'echo "d2warehouse có: " . $p->countKhonvl() . " kho nguyên vật liệu";', 'query', 1, 0, '2024-04-14 11:54:55'),
(411, 'so luong kho', '', 'echo "d2warehouse có: " . $p->countKho(). " kho"; ', 'query', 1, 0, '2024-04-14 11:55:10'),
(412, 'so luong kho', '', 'echo "d2warehouse có: " . $p->countKhonvl() . " kho nguyên vật liệu";', 'query', 1, 0, '2024-04-14 11:55:10'),
(413, 'số nvl', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-14 11:57:52'),
(414, 'so kho tp', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-14 11:58:15'),
(415, 'so kho nvl', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-14 11:58:24'),
(416, 'so nvl', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-14 11:58:58'),
(417, 'hello', '', 'Xin chào, tôi la D2Warehousebot, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-14 11:59:06'),
(418, 'so luong kho', '', 'echo "d2warehouse có: " . $p->countKho(). " kho"; ', 'query', 1, 0, '2024-04-14 11:59:38'),
(419, 'so luong kho', '', 'echo "d2warehouse có: " . $p->countKhonvl() . " kho nguyên vật liệu";', 'query', 1, 0, '2024-04-14 11:59:38'),
(420, 'so luong kho', '', 'echo "d2warehouse có: " . $p->countKhotp() ." Kho thành phẩm";', 'query', 1, 0, '2024-04-14 11:59:38'),
(421, 'kho tp', '', 'echo "d2warehouse có: " . $p->countKhotp() ." Kho thành phẩm";', 'query', 1, 0, '2024-04-14 11:59:53'),
(422, 'kho nvl', '', 'echo "d2warehouse có: " . $p->countKhonvl() . " kho nguyên vật liệu";', 'query', 1, 0, '2024-04-14 11:59:57'),
(423, 'so luong kho', '', 'echo "d2warehouse có: " . $p->countKho(). " kho"; ', 'query', 1, 0, '2024-04-14 12:00:03'),
(424, 'so luong kho', '', 'echo "d2warehouse có: " . $p->countKhonvl() . " kho nguyên vật liệu";', 'query', 1, 0, '2024-04-14 12:00:03'),
(425, 'so luong kho', '', 'echo "d2warehouse có: " . $p->countKhotp() ." Kho thành phẩm";', 'query', 1, 0, '2024-04-14 12:00:03'),
(426, 'so luong kho', '', 'echo "d2warehouse có: " . $p->countKho(). " kho"; ', 'query', 1, 0, '2024-04-14 12:00:26'),
(427, 'so luong kho', '', 'echo "d2warehouse có: " . $p->countKhonvl() . " kho nguyên vật liệu";', 'query', 1, 0, '2024-04-14 12:00:26'),
(428, 'so luong kho', '', 'echo "d2warehouse có: " . $p->countKhotp() ." Kho thành phẩm";', 'query', 1, 0, '2024-04-14 12:00:26'),
(429, 'don hang', '', 'echo "Số lượng đơn hàng là:" . $p->countDonhang();', 'query', 1, 0, '2024-04-14 12:01:01'),
(430, 'don hang', '', 'echo "Số lượng đơn hàng là:" . $p->countDonhang();', 'query', 1, 0, '2024-04-14 12:01:01'),
(431, 'bây giờ là mấy giờ', '', 'echo "bây giờ là ".$child1;', 'query', 1, 0, '2024-04-14 12:05:09'),
(432, 'bây giờ là mấy giờ', '', 'echo "bây giờ là ".$child1;', 'query', 1, 0, '2024-04-14 12:06:27'),
(433, 'bay gio la may gio', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-14 12:07:14'),
(434, 'hello', '', 'Xin chào, tôi la D2Warehousebot, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-14 12:09:37'),
(435, 'hello', '', 'Xin chào, tôi la D2Warehousebot, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-14 12:09:55'),
(436, 'hello', '', 'Xin chào, tôi la D2Warehousebot, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-14 12:10:08'),
(437, 'bây giờ là mấy giờ', '', 'echo "bây giờ là ".$child1;', 'query', 1, 0, '2024-04-14 12:10:15'),
(438, 'hello', '', 'Xin chào, tôi la D2Warehousebot, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-14 12:11:27'),
(439, 'hello', '', 'Xin chào, tôi la D2Warehousebot, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-14 12:12:26'),
(440, 'hello', '', 'Xin chào, tôi la D2Warehousebot, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-14 12:15:29'),
(441, 'hello', '', 'Xin chào, tôi la D2Warehousebot, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-14 12:16:19'),
(442, 'hello', '', 'Xin chào, tôi la D2Warehousebot, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-14 12:17:17'),
(443, 'bây giờ là mấy giờ', '', 'echo "bây giờ là ".$child1;', 'query', 1, 0, '2024-04-14 12:17:49'),
(444, 'bây giờ là mấy giờ', '', 'echo "bây giờ là ".$child1;', 'query', 1, 0, '2024-04-14 12:18:24'),
(445, 'what time', '', 'echo "bây giờ là ".$child1;', 'query', 1, 0, '2024-04-14 12:18:47'),
(446, 'so luong kho', '', 'echo "d2warehouse có: " . $p->countKho(). " kho"; ', 'query', 1, 0, '2024-04-14 12:19:30'),
(447, 'so luong kho', '', 'echo "d2warehouse có: " . $p->countKhonvl() . " kho nguyên vật liệu";', 'query', 1, 0, '2024-04-14 12:19:30'),
(448, 'so luong kho', '', 'echo "d2warehouse có: " . $p->countKhotp() ." Kho thành phẩm";', 'query', 1, 0, '2024-04-14 12:19:30'),
(449, 'số lượng phiếu nhập tp', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-14 12:23:36'),
(450, 'sl phiếu nhậop nvl', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-14 12:23:48'),
(451, 'sl nvl', '', 'echo "Số lượng nguyên vật liệu là: " . $p->countNVl();', 'query', 1, 0, '2024-04-14 12:30:13'),
(452, 'sl tp', '', 'echo "Số lượng thành phẩm là: " . $p->countTP();', 'query', 1, 0, '2024-04-14 12:31:51'),
(453, 'nvl ton', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-14 12:35:46'),
(454, 'nvl tồn', '', 'echo "Số lượng nguyên vật liệu tồn kho là: " . $p->countNVLton();', 'query', 1, 0, '2024-04-14 12:35:55'),
(455, 'nvl tồn', '', 'echo "Số lượng nguyên vật liệu tồn kho là: " . $p->countNVLton();', 'query', 1, 0, '2024-04-14 12:38:02'),
(456, 'tp tồn', '', 'echo "Số lượng thành phẩm tồn kho là: " . $p->countTPton();', 'query', 1, 0, '2024-04-14 12:41:43'),
(457, 'tp tồn', '', 'echo "Số lượng thành phẩm tồn kho là: " . $p->countTPton();', 'query', 1, 0, '2024-04-14 12:46:41'),
(458, 'nvl tồn', '', 'echo "Số lượng nguyên vật liệu tồn kho là: " . $p->countNVLton();', 'query', 1, 0, '2024-04-14 12:47:26'),
(459, 'so nvl', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-14 16:13:51'),
(460, 'sl nvl', '', 'echo "Số lượng nguyên vật liệu là: " . $p->countNVl();', 'query', 1, 0, '2024-04-14 16:14:15'),
(461, 'so kho', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-14 16:24:17'),
(462, 'số lượng kho', '', 'echo "d2warehouse có: " . $p->countKho(). " kho"; ', 'query', 1, 0, '2024-04-14 16:24:28'),
(463, 'số lượng kho', '', 'echo "d2warehouse có: " . $p->countKhonvl() . " kho nguyên vật liệu";', 'query', 1, 0, '2024-04-14 16:24:28'),
(464, 'số lượng kho', '', 'echo "d2warehouse có: " . $p->countKhotp() ." Kho thành phẩm";', 'query', 1, 0, '2024-04-14 16:24:28'),
(465, 'so don hang', '', 'echo "Số lượng đơn hàng là:" . $p->countDonhang();', 'query', 1, 0, '2024-04-14 16:25:54'),
(466, 'số kho', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-14 16:28:44'),
(467, 'kho nvl', '', 'echo "d2warehouse có: " . $p->countKhonvl() . " kho nguyên vật liệu";', 'query', 1, 0, '2024-04-14 16:29:04'),
(468, 'gio lam viec', '', 'kho d2warehouse bắt đầu làm việc vào 8:30 đến 17:30. Ngoài thời gian làm việc vẫn sẽ có nhân viên trực tại kho, trực website 24/7 phòng trường hợp khẩn cấp.', 'text', 1, 0, '2024-04-14 19:29:41'),
(469, 'nvl hết hạn', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-14 19:35:59'),
(470, 'nvl gần hết hạn', '', 'Nguyên vật liệu còn 30 ngày nữa sẽ đến ngày hết hạn được xem là nguyên liệu gần hết hạn.', 'text', 1, 0, '2024-04-14 19:36:11'),
(471, 'hết hạn', '', 'Nguyên vật liệu còn 30 ngày nữa sẽ đến ngày hết hạn được xem là nguyên liệu gần hết hạn.', 'text', 1, 0, '2024-04-14 19:36:27'),
(472, 'suc chua', '', 'Mỗi kho của d2warehouse có sức chứa tối đa 20 tấn nguyên vật liệu/thành phẩm.', 'text', 1, 0, '2024-04-14 19:47:50'),
(473, 'bảo quản', '', 'Đối với kho nguyên liệu: nhiệt độ duy trì ở mức 25 độ, độ ẩm từ 40% đến 60%\r\nĐối với kho thành phẩm: nhiệt độ duy trì ở mức 20 độ, độ ẩm từ 40% đến 60%\r\nTất cả hàng hóa đều phải tránh ánh nắng trực tiếp, hàng hóa phải ở nơi cao ráo.', 'text', 1, 0, '2024-04-14 19:57:10'),
(474, 'mất hàng hóa', '', 'Để tránh hư hỏng hàng hóa: kho luôn giữ nhiệt độ và độ ẩm ở mức cho phép, đặt hàng hóa ở nôi cao ráo, tránh ánh nắng trực tiếp. \r\nĐể tránh thất lạc hàng hóa: khi nguyên liệu thành phẩm nhập kho sẽ được lưu trữ thông tin trên hệ thống nên việc tìm kiếm sẽ dễ dàng hơn', 'text', 1, 0, '2024-04-14 20:07:35'),
(475, 'nvl bị hư', '', 'Trước khi nguyên vật liệu được nhập kho, nhân viên kho phải đảm bảo không bị hư hỏng, ngày hết hạn còn xa.\r\nNguyên liệu bị hư trong quá trình lưu trữ, nhân viên kho phải báo cáo cho quản lý kho để tìm ra nguyên nhân của việc hư hỏng và khắc phục.', 'text', 1, 0, '2024-04-14 20:13:14'),
(476, 'thành phẩm bị hư', '', 'Trước khi nhập kho thành phẩm nhân viên kho phải đảm bảo thành phẩm sản xuất ra đúng chuẩn cả về bao bì và chất lượng.\r\nThành phẩm bị hư trong quá trình lưu trữ, nhân viên kho phải báo cáo cho quản lý kho để tìm ra nguyên nhân của việc hư hỏng và khắc phục.\r\nĐối với các thành phẩm bi lỗi bao bì, nhân viên sẽ trả về khâu đóng gói.\r\n', 'text', 1, 0, '2024-04-14 20:18:10'),
(477, 'chua chay', '', 'Mỗi kho của d2warehouse trang bị hệ thống báo cháy hiện đại và 10 bình chữa cháy.', 'text', 1, 0, '2024-04-14 20:25:30'),
(478, '', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-14 20:25:31'),
(479, 'chua chay', '', 'Mỗi kho của d2warehouse trang bị hệ thống báo cháy hiện đại và 10 bình chữa cháy.', 'text', 1, 0, '2024-04-14 20:25:38'),
(480, 'chua chay', '', 'Mỗi kho của d2warehouse trang bị hệ thống báo cháy hiện đại và 10 bình chữa cháy.', 'text', 1, 0, '2024-04-14 20:25:41'),
(481, 'hi', '', 'Xin chào, tôi la D2Warehousebot, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-14 20:30:16'),
(482, 'quyền truy cập', '', 'Đối với các quyền có thể xét duyệt chỉ có tài khoản của giám đốc được phép truy cập.\r\nCác quyền chỉnh sửa tài khoản người dùng chỉ tài khoản admin được phép truy cập.', 'text', 1, 0, '2024-04-14 20:34:58'),
(483, 'quy định', '', 'Nhân viên làm việc tại kho phải mặc đồng phục của d2warehouse, đầu tóc được bới gọn. \r\nCấm hút thuốc, đốt lửa, sử dụng các thiết bị dễ gây cháy nổ trong kho.\r\nSử dụng các thiết bị điện, máy móc đúng quy định, đảm bảo an toàn.\r\nMang theo các trang thiết bị bảo hộ lao động khi làm việc trong kho.\r\nTuân thủ các quy định về phòng cháy chữa cháy.\r\nKhông tụ tập, đùa nghịch trong kho.\r\nBáo cáo ngay cho quản lý kho khi phát hiện các tình huống nguy hiểm.', 'text', 1, 0, '2024-04-14 20:45:12'),
(484, 'mấy giừo', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-14 20:52:21'),
(485, 'mấy giờ', '', 'echo "bây giờ là ".$child1;', 'query', 1, 0, '2024-04-14 20:52:26'),
(486, 'bảo mật', '', 'Tài khoản nhân viên được sử dụng mật khẩu mạnh.\r\nNhân viên phải đảm bảo không cho người khác vào tài khoản của mình.\r\nĐào tạo nhân viên về cách sử dụng thông tin an toàn. \r\n', 'text', 1, 0, '2024-04-14 20:52:36'),
(487, 'hell', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-15 12:45:11'),
(488, 'hello', '', 'Xin chào, tôi la D2Warehousebot, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-15 12:45:16'),
(489, 'so luong kho', '', 'echo "d2warehouse có: " . $p->countKho(). " kho"; ', 'query', 1, 0, '2024-04-15 12:48:47'),
(490, 'so luong kho', '', 'echo "d2warehouse có: " . $p->countKhonvl() . " kho nguyên vật liệu";', 'query', 1, 0, '2024-04-15 12:48:47'),
(491, 'so luong kho', '', 'echo "d2warehouse có: " . $p->countKhotp() ." Kho thành phẩm";', 'query', 1, 0, '2024-04-15 12:48:47'),
(492, 'so luong nvl', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-15 12:49:37'),
(493, 'so nvl', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-15 12:49:45'),
(494, 'so luong nguyen vat lieu', '', 'echo "Số lượng nguyên vật liệu là: " . $p->countNVl();', 'query', 1, 0, '2024-04-15 12:49:59'),
(495, 'sp tp', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-15 12:51:53'),
(496, 'so tp', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-15 12:51:58'),
(497, 'so tp', '', 'echo "Số lượng thành phẩm là: " . $p->countTP();', 'query', 1, 0, '2024-04-15 12:53:08'),
(498, 'kho nvl', '', 'echo "d2warehouse có: " . $p->countKhonvl() . " kho nguyên vật liệu";', 'query', 1, 0, '2024-04-15 12:54:17'),
(499, 'khô tp', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-15 12:54:21'),
(500, 'kho tp', '', 'echo "d2warehouse có: " . $p->countKhotp() ." Kho thành phẩm";', 'query', 1, 0, '2024-04-15 12:54:26'),
(501, 'kho', '', 'D2Warehouse là đơn vị kho sản xuất và cung cấp các sản phẩm từ đậu nành, với nguyên vật liệu chính là đậu nành và sản phẩm thành phẩm bao gồm bã đậu nành và dầu đậu nành. Để đảm bảo chất lượng sản phẩm và đáp ứng nhu cầu của khách hàng, hệ thống quản lý kho được xây dựng bởi Lê Hạnh Hải Đăng và Bùi Thục Đoan.', 'text', 1, 0, '2024-04-15 12:54:32'),
(502, 'kho', '', 'kho d2warehouse có 3 địa chỉ. Kho 1: 4 Nguyễn Văn Bảo, kho 2: 142 Lê Lợi, kho 3: 123 Trần Văn Dư', 'text', 1, 0, '2024-04-15 12:54:32'),
(503, 'kho', '', 'kho d2warehouse được thành lập vào tháng 12 năm 2023', '', 1, 0, '2024-04-15 12:54:32'),
(504, 'kho', '', 'Đầu tiên nhân viên kho sẽ kiểm tra số lượng hàng tồn và báo cáo cho phòng kế hoạch, phòng kế hoạch sẽ đưa ra đề xuất nhập nguyên vật liệu cho giám đốc phê duyệt. Sau khi phê duyệt sẽ có đơn vị đến giao nguyên liệu thô, nhân viên kho tiến hành lập phiếu nhập kho và cập nhật thông tin ', 'text', 1, 0, '2024-04-15 12:54:32'),
(505, 'kho', '', 'echo "d2warehouse có: " . $p->countKho(). " kho"; ', 'query', 1, 0, '2024-04-15 12:54:32'),
(506, 'kho', '', 'echo "d2warehouse có: " . $p->countKhonvl() . " kho nguyên vật liệu";', 'query', 1, 0, '2024-04-15 12:54:32'),
(507, 'kho', '', 'echo "d2warehouse có: " . $p->countKhotp() ." Kho thành phẩm";', 'query', 1, 0, '2024-04-15 12:54:32'),
(508, 'kho', '', 'kho d2warehouse bắt đầu làm việc vào 8:30 đến 17:30. Ngoài thời gian làm việc vẫn sẽ có nhân viên trực tại kho, trực website 24/24 phòng trường hợp khẩn cấp.', 'text', 1, 0, '2024-04-15 12:54:32'),
(509, 'kho', '', 'Mỗi kho của d2warehouse có sức chứa tối đa 20 tấn nguyên vật liệu/thành phẩm.', 'text', 1, 0, '2024-04-15 12:54:32'),
(510, 'kho', '', 'Đối với kho nguyên liệu: nhiệt độ duy trì ở mức 25 độ, độ ẩm từ 40% đến 60%.\r\nĐối với kho thành phẩm: nhiệt độ duy trì ở mức 20 độ, độ ẩm từ 40% đến 60%\r\nTất cả hàng hóa đều phải tránh ánh nắng trực tiếp, hàng hóa phải ở nơi cao ráo.', 'text', 1, 0, '2024-04-15 12:54:32'),
(511, 'kho', '', 'Mỗi kho của d2warehouse trang bị hệ thống báo cháy hiện đại và 10 bình chữa cháy.', 'text', 1, 0, '2024-04-15 12:54:32'),
(512, 'kho', '', 'Đối với các quyền có thể xét duyệt chỉ có tài khoản của giám đốc được phép truy cập.\r\nCác quyền chỉnh sửa tài khoản người dùng chỉ tài khoản admin được phép truy cập.', 'text', 1, 0, '2024-04-15 12:54:32'),
(513, 'kho', '', 'Kho có đội ngũ nhân viên túc trực để hỗ trợ khách hàng 24/24', 'text', 1, 0, '2024-04-15 12:54:32'),
(514, 'kho', '', 'Nhân viên làm việc tại kho phải mặc đồng phục của d2warehouse, đầu tóc được bới gọn. \r\nCấm hút thuốc, đốt lửa, sử dụng các thiết bị dễ gây cháy nổ trong kho.\r\nSử dụng các thiết bị điện, máy móc đúng quy định, đảm bảo an toàn.\r\nMang theo các trang thiết bị bảo hộ lao động khi làm việc trong kho.\r\nTuân thủ các quy định về phòng cháy chữa cháy.\r\nKhông tụ tập, đùa nghịch trong kho.\r\nBáo cáo ngay cho quản lý kho khi phát hiện các tình huống nguy hiểm.', 'text', 1, 0, '2024-04-15 12:54:32'),
(515, 'kho', '', 'Tài khoản nhân viên được sử dụng mật khẩu mạnh.\r\nNhân viên phải đảm bảo không cho người khác vào tài khoản của mình.\r\nĐào tạo nhân viên về cách sử dụng thông tin an toàn. \r\n', 'text', 1, 0, '2024-04-15 12:54:32'),
(516, 'bao nhiêu kho', '', 'echo "d2warehouse có: " . $p->countKho(). " kho"; ', 'query', 1, 0, '2024-04-15 12:55:39'),
(517, 'bao nhiêu kho', '', 'echo "d2warehouse có: " . $p->countKhonvl() . " kho nguyên vật liệu";', 'query', 1, 0, '2024-04-15 12:55:39'),
(518, 'bao nhiêu kho', '', 'echo "d2warehouse có: " . $p->countKhotp() ." Kho thành phẩm";', 'query', 1, 0, '2024-04-15 12:55:39'),
(519, 'số lượng kho', '', 'echo "d2warehouse có: " . $p->countKho(). " kho"; ', 'query', 1, 0, '2024-04-15 12:59:33'),
(520, 'số lượng kho', '', 'echo "d2warehouse có: " . $p->countKhonvl() . " kho nguyên vật liệu";', 'query', 1, 0, '2024-04-15 12:59:33'),
(521, 'số lượng kho', '', 'echo "d2warehouse có: " . $p->countKhotp() ." Kho thành phẩm";', 'query', 1, 0, '2024-04-15 12:59:33'),
(522, 'kho nvl', '', 'echo "d2warehouse có: " . $p->countKhonvl() . " kho nguyên vật liệu";', 'query', 1, 0, '2024-04-15 12:59:50'),
(523, 'kho tp', '', 'echo "d2warehouse có: " . $p->countKhotp() ." Kho thành phẩm";', 'query', 1, 0, '2024-04-15 12:59:56'),
(524, 'yc xuất', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-15 13:07:59'),
(525, 'xuất nvl', '', 'echo "số lượng phiếu xuất nguyên vật liệu hiện tại là: " . $p->countPXNVL();', 'query', 1, 0, '2024-04-15 13:08:07'),
(526, 'xuất nvl', '', 'Phòng kế hoạch đưa ra kế hoạch sản xuất cho giám đốc phê duyệt, sau khi được duyệt quản lý kho sẽ điều phối xuất nguyên vật liệu cho nhân viên kho, nhân viên kho sẽ lập biên bản xuất nguyên vật liệu và cập nhật thông tin', 'text', 1, 0, '2024-04-15 13:08:07'),
(527, 'phiếu xnvl đã duyệt', '', 'echo "Số phiếu xuất nguyên vật liệu đã duyệt là: " . $p->countphieuDuyet() ." phiếu";', '', 1, 0, '2024-04-15 13:13:06'),
(528, 'phiếu xuất nvl', '', 'echo "số lượng phiếu xuất nguyên vật liệu hiện tại là: " . $p->countPXNVL();', 'query', 1, 0, '2024-04-15 13:13:47'),
(529, 'phiếu xuất nvl', '', 'echo "Số phiếu xuất nguyên vật liệu đã duyệt là: " . $p->countphieuDuyet() ." phiếu";', '', 1, 0, '2024-04-15 13:13:47'),
(530, 'đã duyệt', '', 'echo "Số phiếu xuất nguyên vật liệu đã duyệt là: " . $p->countphieuDuyet() ." phiếu";', '', 1, 0, '2024-04-15 13:15:01'),
(531, 'phieu xnvl da duyet', '', 'echo "Số phiếu xuất nguyên vật liệu đã duyệt là: " . $p->countphieuDuyet() ." phiếu";', '', 1, 0, '2024-04-15 13:16:04'),
(532, 'phiếu xuất nvl', '', 'echo "số lượng phiếu xuất nguyên vật liệu hiện tại là: " . $p->countPXNVL();', 'query', 1, 0, '2024-04-15 13:17:40'),
(533, 'phiếu xuất nvl', '', 'echo "Số phiếu xuất nguyên vật liệu đã duyệt là: " . $p->countphieuDuyet() ." phiếu";', '', 1, 0, '2024-04-15 13:17:40'),
(534, 'đã duyệt', '', 'echo "Số phiếu xuất nguyên vật liệu đã duyệt là: " . $p->countphieuDuyet() ." phiếu";', '', 1, 0, '2024-04-15 13:18:31'),
(535, 'phiếu xuất nvl', '', 'echo "số lượng phiếu xuất nguyên vật liệu hiện tại là: " . $p->countPXNVL();', 'query', 1, 0, '2024-04-15 13:18:41'),
(536, 'phiếu xuất nvl', '', 'echo "Số phiếu xuất nguyên vật liệu đã duyệt là: " . $p->countphieuDuyet() ." phiếu";', '', 1, 0, '2024-04-15 13:18:41'),
(537, 'xuất nvl đã duyệt', '', 'echo "Số phiếu xuất nguyên vật liệu đã duyệt là: " . $p->countphieuDuyet() ." phiếu";', '', 1, 0, '2024-04-15 13:20:00'),
(538, 'xuất nvl đã duyệt', '', 'echo "Số phiếu xuất nguyên vật liệu đã duyệt là: " . $p->countphieuDuyet() ." phiếu";', '', 1, 0, '2024-04-15 13:20:39'),
(539, 'nvl bị từ chối', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-15 13:24:50'),
(540, 'từ chối', '', 'echo "Số lượng phiếu xuất nguyên vật liệu bị từ chối là: " . $p->countphieuTC() . " phiếu";', 'query', 1, 0, '2024-04-15 13:24:56'),
(541, 'xuất nvl bị từ chối', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-15 13:25:16'),
(542, 'duyệt xnvl', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-15 13:25:48'),
(543, 'xuất nvl đã duyệt', '', 'echo "Số phiếu xuất nguyên vật liệu đã duyệt là: " . $p->countphieuDuyet() ." phiếu";', 'query', 1, 0, '2024-04-15 13:26:32'),
(544, 'xuất nvl bị từ chối', '', 'echo "Số lượng phiếu xuất nguyên vật liệu bị từ chối là: " . $p->countphieuTC() . " phiếu";', 'query', 1, 0, '2024-04-15 13:26:40'),
(545, 'xuất nvl', '', 'echo "số lượng phiếu xuất nguyên vật liệu hiện tại là: " . $p->countPXNVL();', 'query', 1, 0, '2024-04-15 13:27:33'),
(546, 'xuất nvl', '', 'Phòng kế hoạch đưa ra kế hoạch sản xuất cho giám đốc phê duyệt, sau khi được duyệt quản lý kho sẽ điều phối xuất nguyên vật liệu cho nhân viên kho, nhân viên kho sẽ lập biên bản xuất nguyên vật liệu và cập nhật thông tin', 'text', 1, 0, '2024-04-15 13:27:33'),
(547, 'xuất nvl', '', 'echo "Số phiếu xuất nguyên vật liệu đã duyệt là: " . $p->countphieuDuyet() ." phiếu";', 'query', 1, 0, '2024-04-15 13:27:33'),
(548, 'xuất nvl', '', 'echo "Số lượng phiếu xuất nguyên vật liệu bị từ chối là: " . $p->countphieuTC() . " phiếu";', 'query', 1, 0, '2024-04-15 13:27:33'),
(549, 'xuất nvl', '', 'echo "số lượng phiếu xuất nguyên vật liệu hiện tại là: " . $p->countPXNVL();', 'query', 1, 0, '2024-04-15 13:45:52'),
(550, 'xuất nvl', '', 'Phòng kế hoạch đưa ra kế hoạch sản xuất cho giám đốc phê duyệt, sau khi được duyệt quản lý kho sẽ điều phối xuất nguyên vật liệu cho nhân viên kho, nhân viên kho sẽ lập biên bản xuất nguyên vật liệu và cập nhật thông tin', 'text', 1, 0, '2024-04-15 13:45:52'),
(551, 'xuất nvl', '', 'echo "Số phiếu xuất nguyên vật liệu đã duyệt là: " . $p->countphieuDuyet() ." phiếu";', 'query', 1, 0, '2024-04-15 13:45:52'),
(552, 'xuất nvl', '', 'echo "Số lượng phiếu xuất nguyên vật liệu bị từ chối là: " . $p->countphieuTC() . " phiếu";', 'query', 1, 0, '2024-04-15 13:45:52'),
(553, 'kho ', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-15 13:54:34'),
(554, 'số lượng kho', '', 'echo "d2warehouse có: " . $p->countKho(). " kho"; ', 'query', 1, 0, '2024-04-15 13:57:28'),
(555, 'số lượng kho', '', 'echo "d2warehouse có: " . $p->countKhonvl() . " kho nguyên vật liệu";', 'query', 1, 0, '2024-04-15 13:57:28'),
(556, 'số lượng kho', '', 'echo "d2warehouse có: " . $p->countKhotp() ." Kho thành phẩm";', 'query', 1, 0, '2024-04-15 13:57:28'),
(557, 'so luong kho', '', 'echo "d2warehouse có: " . $p->countKho(). " kho"; ', 'query', 1, 0, '2024-04-15 14:04:56'),
(558, 'so luong kho', '', 'echo "d2warehouse có: " . $p->countKhonvl() . " kho nguyên vật liệu";', 'query', 1, 0, '2024-04-15 14:04:56'),
(559, 'so luong kho', '', 'echo "d2warehouse có: " . $p->countKhotp() ." Kho thành phẩm";', 'query', 1, 0, '2024-04-15 14:04:56'),
(560, 'so luong kho', '', 'Bạn muốn biết tổng số lượng kho, kho thành phẩm hay kho nguyên vật liệu?', 'text', 1, 0, '2024-04-15 14:04:56'),
(561, 'số lượng kho', '', 'echo "d2warehouse có: " . $p->countKhonvl() . " kho nguyên vật liệu";', 'query', 1, 0, '2024-04-15 14:06:09'),
(562, 'số lượng kho', '', 'echo "d2warehouse có: " . $p->countKhotp() ." Kho thành phẩm";', 'query', 1, 0, '2024-04-15 14:06:09'),
(563, 'số lượng kho', '', 'Bạn muốn biết tổng số lượng kho, kho thành phẩm hay kho nguyên vật liệu?', 'text', 1, 0, '2024-04-15 14:06:09'),
(564, 'số lượng kho', '', 'Bạn muốn biết tổng số lượng kho, kho thành phẩm hay kho nguyên vật liệu?', 'text', 1, 0, '2024-04-15 14:06:09'),
(565, 'sl kho', '', 'echo "d2warehouse có: " . $p->countKhonvl() . " kho nguyên vật liệu";', 'query', 1, 0, '2024-04-15 14:07:55'),
(566, 'sl kho', '', 'echo "d2warehouse có: " . $p->countKhotp() ." Kho thành phẩm";', 'query', 1, 0, '2024-04-15 14:07:55'),
(567, 'số lượng kho', '', 'Bạn muốn biết tổng số lượng kho, kho thành phẩm hay kho nguyên vật liệu?', 'text', 1, 0, '2024-04-15 14:08:03'),
(568, 'số lượng kho', '', 'Bạn muốn biết tổng số lượng kho, kho thành phẩm hay kho nguyên vật liệu?', 'text', 1, 0, '2024-04-15 14:08:03'),
(569, 'số lượng kho', '', 'Bạn muốn biết tổng số lượng kho, kho thành phẩm hay kho nguyên vật liệu?', 'text', 1, 0, '2024-04-15 14:08:53'),
(570, 'tổng kho', '', 'echo "d2warehouse có: " . $p->countKho(). " kho"; ', 'query', 1, 0, '2024-04-15 14:09:06'),
(571, 'kho thành phẩm', '', 'echo "d2warehouse có: " . $p->countKhotp() ." Kho thành phẩm";', 'query', 1, 0, '2024-04-15 14:09:17'),
(572, 'kho nvl', '', 'echo "d2warehouse có: " . $p->countKhonvl() . " kho nguyên vật liệu";', 'query', 1, 0, '2024-04-15 14:09:22'),
(573, 'sl kho', '', 'echo "d2warehouse có: " . $p->countKhonvl() . " kho nguyên vật liệu";', 'query', 1, 0, '2024-04-15 14:09:28'),
(574, 'sl kho', '', 'echo "d2warehouse có: " . $p->countKhotp() ." Kho thành phẩm";', 'query', 1, 0, '2024-04-15 14:09:28'),
(575, 'sl kho', '', 'echo "d2warehouse có: " . $p->countKhonvl() . " kho nguyên vật liệu";', 'query', 1, 0, '2024-04-15 14:11:15'),
(576, 'sl kho', '', 'echo "d2warehouse có: " . $p->countKhotp() ." Kho thành phẩm";', 'query', 1, 0, '2024-04-15 14:11:15'),
(577, 'sl kho', '', 'Bạn muốn biết tổng số lượng kho, kho thành phẩm hay kho nguyên vật liệu?', 'text', 1, 0, '2024-04-15 14:11:15'),
(578, 'sl kho', '', 'Bạn muốn biết tổng số lượng kho, kho thành phẩm hay kho nguyên vật liệu?', 'text', 1, 0, '2024-04-15 14:12:00'),
(579, 'kho tp', '', 'echo "d2warehouse có: " . $p->countKhotp() ." Kho thành phẩm";', 'query', 1, 0, '2024-04-15 14:12:06'),
(580, 'kho nvl', '', 'echo "d2warehouse có: " . $p->countKhonvl() . " kho nguyên vật liệu";', 'query', 1, 0, '2024-04-15 14:12:11'),
(581, 'tong kho', '', 'echo "d2warehouse có: " . $p->countKho(). " kho"; ', 'query', 1, 0, '2024-04-15 14:12:16'),
(582, 'phiếu nhập', '', 'echo "số lượng phiếu nhập nguyên vật liệu hiện tại là: " . $p->countPNNVL();\r\n', 'query', 1, 0, '2024-04-15 14:14:41'),
(583, 'phiếu nhập', '', 'echo "số lượng phiếu nhập thành phẩm hiện tại là: " . $p->countPNTP();', 'query', 1, 0, '2024-04-15 14:14:41'),
(584, 'phiếu nhập nvl', '', 'echo "số lượng phiếu nhập nguyên vật liệu hiện tại là: " . $p->countPNNVL();\r\n', 'query', 1, 0, '2024-04-15 14:16:31'),
(585, 'phiếu nhập tp', '', 'echo "số lượng phiếu nhập thành phẩm hiện tại là: " . $p->countPNTP();', 'query', 1, 0, '2024-04-15 14:16:39'),
(586, 'nvl đã duyệt', '', 'echo "Số phiếu xuất nguyên vật liệu đã duyệt là: " . $p->countphieuDuyet() ." phiếu";', 'query', 1, 0, '2024-04-15 14:17:00'),
(587, 'xuat nvl', '', 'Phòng kế hoạch đưa ra kế hoạch sản xuất cho giám đốc phê duyệt, sau khi được duyệt quản lý kho sẽ điều phối xuất nguyên vật liệu cho nhân viên kho, nhân viên kho sẽ lập biên bản xuất nguyên vật liệu và cập nhật thông tin', 'text', 1, 0, '2024-04-15 14:17:22'),
(588, 'xuat nvl', '', 'echo "Số lượng phiếu xuất nguyên vật liệu bị từ chối là: " . $p->countphieuTC() . " phiếu";', 'query', 1, 0, '2024-04-15 14:17:22'),
(589, 'phiếu xuất nvl', '', 'echo "số lượng phiếu xuất nguyên vật liệu hiện tại là: " . $p->countPXNVL();', 'query', 1, 0, '2024-04-15 14:17:53'),
(590, 'phiếu xuất nvl từ chối', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-15 14:18:10'),
(591, 'đã duyệt', '', 'echo "Số phiếu xuất nguyên vật liệu đã duyệt là: " . $p->countphieuDuyet() ." phiếu";', 'query', 1, 0, '2024-04-15 14:19:15'),
(592, 'sl kho', '', 'Bạn muốn biết tổng số lượng kho, kho thành phẩm hay kho nguyên vật liệu?', 'text', 1, 0, '2024-04-15 14:20:13'),
(593, 'kho nvl', '', 'echo "d2warehouse có: " . $p->countKhonvl() . " kho nguyên vật liệu";', 'query', 1, 0, '2024-04-15 14:20:18'),
(594, 'phiếu chưa duyệt', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-15 14:23:29'),
(595, 'phiếu xuất nvl chưa duyệt', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-15 14:23:40'),
(596, 'phieu xuat nvl chua duyet', '', 'echo "Số lượng phiếu xuất nguyên vật liệu chưa duyệt là: " .$p->countphieuCD() ." phiếu";', 'query', 1, 0, '2024-04-15 14:24:32'),
(597, 'số xuất nvl đã duyệt', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-15 14:24:51'),
(598, 'phiếu xuất nvl đã duyệt', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-15 14:25:04'),
(599, 'phiếu xuất nvl đã duyệt', '', 'echo "Số phiếu xuất nguyên vật liệu đã duyệt là: " . $p->countphieuDuyet() ." phiếu";', 'query', 1, 0, '2024-04-15 14:26:57'),
(600, 'phiếu xuất nvl bị từ chối', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-15 14:27:13'),
(601, 'phiếu xuất nvl bị từ chối', '', 'echo "Số lượng phiếu xuất nguyên vật liệu bị từ chối là: " . $p->countphieuTC() . " phiếu";', 'query', 1, 0, '2024-04-15 14:28:01'),
(602, 'phiếu xuất nvl chưa duyệt', '', 'echo "Số lượng phiếu xuất nguyên vật liệu chưa duyệt là: " .$p->countphieuCD() ." phiếu";', 'query', 1, 0, '2024-04-15 14:28:11'),
(603, 'phiếu xuất nvl', '', 'echo "số lượng phiếu xuất nguyên vật liệu hiện tại là: " . $p->countPXNVL();', 'query', 1, 0, '2024-04-15 14:29:08'),
(604, 'phiếu xuất nvl', '', 'echo "Số phiếu xuất nguyên vật liệu đã duyệt là: " . $p->countphieuDuyet() ." phiếu";', 'query', 1, 0, '2024-04-15 14:29:08'),
(605, 'phiếu xuất nvl', '', 'echo "Số lượng phiếu xuất nguyên vật liệu bị từ chối là: " . $p->countphieuTC() . " phiếu";', 'query', 1, 0, '2024-04-15 14:29:08'),
(606, 'phiếu xuất nvl', '', 'echo "Số lượng phiếu xuất nguyên vật liệu chưa duyệt là: " .$p->countphieuCD() ." phiếu";', 'query', 1, 0, '2024-04-15 14:29:08'),
(607, 'phiếu xnvl', '', 'echo "số lượng phiếu xuất nguyên vật liệu hiện tại là: " . $p->countPXNVL();', 'query', 1, 0, '2024-04-15 14:30:41'),
(608, 'phiếu xuất nvl hiện tại', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-15 14:32:07'),
(609, 'số lượng phiếu xuất nvl hiện tại', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-15 14:32:34'),
(610, 'phiếu xnvl hiệnt ại', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-15 14:32:45'),
(611, 'phiếu xuất nvl hiện tại', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-15 14:32:58'),
(612, 'số xnvl', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-15 14:33:31'),
(613, 'số phiếu xnvl', '', 'echo "số lượng phiếu xuất nguyên vật liệu hiện tại là: " . $p->countPXNVL();', 'query', 1, 0, '2024-04-15 14:33:40'),
(614, 'đã duyệt', '', 'echo "Số phiếu xuất nguyên vật liệu đã duyệt là: " . $p->countphieuDuyet() ." phiếu";', 'query', 1, 0, '2024-04-15 14:33:47'),
(615, 'chưa duyệt', '', 'echo "Số lượng phiếu xuất nguyên vật liệu chưa duyệt là: " .$p->countphieuCD() ." phiếu";', 'query', 1, 0, '2024-04-15 14:33:57'),
(616, 'từ chối', '', 'echo "Số lượng phiếu xuất nguyên vật liệu bị từ chối là: " . $p->countphieuTC() . " phiếu";', 'query', 1, 0, '2024-04-15 14:34:03'),
(617, 'số phiếu nnvl', '', 'echo "số lượng phiếu nhập nguyên vật liệu hiện tại là: " . $p->countPNNVL();\r\n', 'query', 1, 0, '2024-04-15 14:36:35'),
(618, 'số phiếu xnvl', '', 'echo "số lượng phiếu xuất nguyên vật liệu hiện tại là: " . $p->countPXNVL();', 'query', 1, 0, '2024-04-15 14:37:27'),
(619, 'số lượng phiếu', '', 'echo "số lượng phiếu nhập nguyên vật liệu hiện tại là: " . $p->countPNNVL();\r\n', 'query', 1, 0, '2024-04-15 14:40:46'),
(620, 'số lượng phiếu', '', 'echo "số lượng phiếu xuất nguyên vật liệu hiện tại là: " . $p->countPXNVL();', 'query', 1, 0, '2024-04-15 14:40:46'),
(621, 'số lượng phiếu', '', 'echo "số lượng phiếu nhập thành phẩm hiện tại là: " . $p->countPNTP();', 'query', 1, 0, '2024-04-15 14:40:46'),
(622, 'số lượng phiếu', '', 'echo "số lượng phiếu xuất thành phẩm hiện tại là: " . $p->countPXTP();', 'query', 1, 0, '2024-04-15 14:40:46'),
(623, 'số lượng phiếu', '', 'Bạn muốn xem phiếu nhập nguyên vật liệu hay phiếu xuất nguyên vật liệu ?', 'text', 1, 0, '2024-04-15 14:40:46'),
(624, 'sô lượng phiếu nvl', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-15 14:42:03'),
(625, 'số lượng phiếu nvl', '', 'Bạn muốn xem phiếu nhập nguyên vật liệu hay phiếu xuất nguyên vật liệu ?', 'text', 1, 0, '2024-04-15 14:42:13'),
(626, 'phiếu nhập nvl', '', 'echo "số lượng phiếu nhập nguyên vật liệu hiện tại là: " . $p->countPNNVL();\r\n', 'query', 1, 0, '2024-04-15 14:42:21'),
(627, 'số lượng phiếu tp', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-15 14:43:14'),
(628, 'số phiếu tp', '', 'Bạn muốn xem số lượng phiếu nhập thành phẩm hay phiếu xuất thành phẩm?', 'text', 1, 0, '2024-04-15 14:44:32'),
(629, 'phiếu xuất tp', '', 'echo "số lượng phiếu xuất thành phẩm hiện tại là: " . $p->countPXTP();', 'query', 1, 0, '2024-04-15 14:44:41'),
(630, 'phiếu nhập tp', '', 'echo "số lượng phiếu nhập thành phẩm hiện tại là: " . $p->countPNTP();', 'query', 1, 0, '2024-04-15 14:44:47'),
(631, 'phiếu xuất nvl đã duyệt', '', 'echo "Số phiếu xuất nguyên vật liệu đã duyệt là: " . $p->countphieuDuyet() ." phiếu";', 'query', 1, 0, '2024-04-15 14:45:21'),
(632, 'chưa duyệt xuất nv', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-15 14:49:36'),
(633, 'chưa duyệt xuất nvl', '', 'echo "Số lượng phiếu xuất nguyên vật liệu chưa duyệt là: " .$p->countphieuCD() ." phiếu";', 'query', 1, 0, '2024-04-15 14:49:44'),
(634, 'nhập tp đã duyệt', '', 'echo "Số lượng phiếu nhập thành phẩm đã duyệt là: " .$p->countphieuDuyetTP() ." phiếu";', 'query', 1, 0, '2024-04-15 14:55:14'),
(635, 'tu choi nhap tp', '', 'echo "Số lượng phiếu nhập thành phẩm bị từ chối là: " .$p->countphieuTCTP() ." phiếu";', 'query', 1, 0, '2024-04-15 14:57:46'),
(636, 'chưa duyệt nhập tp', '', 'echo "Số lượng phiếu nhập thành phẩm chưa duyệt là: " .$p->countphieuCDTP() ." \r\n phiếu";', 'query', 1, 0, '2024-04-15 15:00:22'),
(637, 'số lượng phiếu tp', '', 'Bạn muốn xem số lượng phiếu nhập thành phẩm hay phiếu xuất thành phẩm?', 'text', 1, 0, '2024-04-15 15:07:45'),
(638, 'phiếu xuất tp', '', 'echo "số lượng phiếu xuất thành phẩm hiện tại là: " . $p->countPXTP();', 'query', 1, 0, '2024-04-15 15:07:51'),
(639, 'chưa duyệt nhập tp', '', 'echo "Số lượng phiếu nhập thành phẩm chưa duyệt là: " .$p->countphieuCDTP() ." \r\n phiếu";', 'query', 1, 0, '2024-04-15 15:08:19'),
(640, 'số lượng kế hoạch sản xuất', '', 'echo "Số lượng kế hoạch sản xuất hiện tại là: " .$p->countKHSX();', 'query', 1, 0, '2024-04-15 15:14:06'),
(641, 'số lượng khsx', '', 'echo "Số lượng kế hoạch sản xuất hiện tại là: " .$p->countKHSX();', 'query', 1, 0, '2024-04-15 15:14:37'),
(642, 'số lượng khsx', '', 'echo "Số lượng kế hoạch sản xuất hiện tại là: " .$p->countKHSX();', 'query', 1, 0, '2024-04-15 15:14:50'),
(643, 'số lượng kho', '', 'Bạn muốn biết tổng số lượng kho, kho thành phẩm hay kho nguyên vật liệu?', 'text', 1, 0, '2024-04-15 15:17:34'),
(644, 'tổng số lượng kho', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-15 15:17:47'),
(645, 'tong so luong kho', '', 'echo "d2warehouse có: " . $p->countKho(). " kho"; ', 'query', 1, 0, '2024-04-15 15:18:30'),
(646, 'sl bbkk', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-15 15:25:06'),
(647, 'sl bien ban kiem ke', '', 'echo "Số lượng biên bản kiểm kê là: " . $p->countBBKK();', 'query', 1, 0, '2024-04-15 15:25:15'),
(648, 'số lượng nvl', '', 'echo "Số lượng nguyên vật liệu là: " . $p->countNVl();', 'query', 1, 0, '2024-04-15 15:28:25'),
(649, 'số lượng nvl tồn', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-15 15:28:39'),
(650, 'nvl ton kho', '', 'echo "Số lượng nguyên vật liệu tồn kho là: " . $p->countNVLton();', 'query', 1, 0, '2024-04-15 15:32:07'),
(651, 'nvl ton kho', '', 'echo "Số lượng nguyên vật liệu tồn kho là: " . $p->countNVLton();', 'query', 1, 0, '2024-04-15 15:39:46'),
(652, 'nvl ton kho', '', 'echo "Số lượng nguyên vật liệu tồn kho là: " . $p->countNVLton();', 'query', 1, 0, '2024-04-15 15:46:04'),
(653, 'nvl ton kho', '', 'echo "Số lượng nguyên vật liệu tồn kho là: " . $p->countNVLton();', 'query', 1, 0, '2024-04-15 15:50:10'),
(654, 'tp ton kho', '', 'echo "Số lượng thành phẩm tồn kho là: " . $p->countTPton();', 'query', 1, 0, '2024-04-15 15:59:10'),
(655, 'bao mat', '', 'Tài khoản nhân viên được sử dụng mật khẩu mạnh.\r\nNhân viên phải đảm bảo không cho người khác vào tài khoản của mình.\r\nĐào tạo nhân viên về cách sử dụng thông tin an toàn. \r\n', 'text', 1, 0, '2024-04-15 16:04:55'),
(656, 'nguyên vật liẹu', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-15 16:05:51'),
(657, 'nguyên vật liệu', '', 'echo "số lượng phiếu nhập nguyên vật liệu hiện tại là: " . $p->countPNNVL();\r\n', 'query', 1, 0, '2024-04-15 16:05:58'),
(658, 'nguyên vật liệu', '', 'echo "số lượng phiếu xuất nguyên vật liệu hiện tại là: " . $p->countPXNVL();', 'query', 1, 0, '2024-04-15 16:05:58'),
(659, 'nguyên vật liệu', '', 'Bạn muốn xem phiếu nhập nguyên vật liệu hay phiếu xuất nguyên vật liệu ?', 'text', 1, 0, '2024-04-15 16:05:58'),
(660, 'nguyên vật liệu', '', 'Phòng kế hoạch đưa ra kế hoạch sản xuất cho giám đốc phê duyệt, sau khi được duyệt quản lý kho sẽ điều phối xuất nguyên vật liệu cho nhân viên kho, nhân viên kho sẽ lập biên bản xuất nguyên vật liệu và cập nhật thông tin', 'text', 1, 0, '2024-04-15 16:05:58'),
(661, 'nguyên vật liệu', '', 'echo "d2warehouse có: " . $p->countKhonvl() . " kho nguyên vật liệu";', 'query', 1, 0, '2024-04-15 16:05:58'),
(662, 'nguyên vật liệu', '', 'echo "Số lượng nguyên vật liệu là: " . $p->countNVl();', 'query', 1, 0, '2024-04-15 16:05:58'),
(663, 'nguyên vật liệu', '', 'Nguyên vật liệu còn 30 ngày nữa sẽ đến ngày hết hạn được xem là nguyên liệu gần hết hạn.', 'text', 1, 0, '2024-04-15 16:05:58'),
(664, 'nguyên vật liệu', '', 'Đối với kho nguyên liệu: nhiệt độ duy trì ở mức 25 độ, độ ẩm từ 40% đến 60%.\r\nĐối với kho thành phẩm: nhiệt độ duy trì ở mức 20 độ, độ ẩm từ 40% đến 60%\r\nTất cả hàng hóa đều phải tránh ánh nắng trực tiếp, hàng hóa phải ở nơi cao ráo.', 'text', 1, 0, '2024-04-15 16:05:58'),
(665, 'nguyên vật liệu', '', 'Trước khi nguyên vật liệu được nhập kho, nhân viên kho phải đảm bảo không bị hư hỏng, ngày hết hạn còn xa.\r\nNguyên liệu bị hư trong quá trình lưu trữ, nhân viên kho phải báo cáo cho quản lý kho để tìm ra nguyên nhân của việc hư hỏng và khắc phục.', 'text', 1, 0, '2024-04-15 16:05:58'),
(666, 'nguyên vật liệu', '', 'echo "Số phiếu xuất nguyên vật liệu đã duyệt là: " . $p->countphieuDuyet() ." phiếu";', 'query', 1, 0, '2024-04-15 16:05:58'),
(667, 'nguyên vật liệu', '', 'echo "Số lượng phiếu xuất nguyên vật liệu bị từ chối là: " . $p->countphieuTC() . " phiếu";', 'query', 1, 0, '2024-04-15 16:05:58');
INSERT INTO `chats` (`id`, `user`, `user_mail`, `chatbot`, `action`, `status`, `del_msg`, `date`) VALUES
(668, 'nguyên vật liệu', '', 'echo "Số lượng nguyên vật liệu tồn kho là: " . $p->countNVLton();', 'query', 1, 0, '2024-04-15 16:05:58'),
(669, 'danh sách nguyên vật liệu', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-15 16:06:31'),
(670, 'nvl tồn kho', '', 'echo "Số lượng nguyên vật liệu tồn kho là: " . $p->countNVLton();', 'query', 1, 0, '2024-04-15 16:06:48'),
(671, 'danh sách nvl', '', 'echo "Danh sách nguyên vật liệu: " .$p->getNVL();', 'query', 1, 0, '2024-04-15 16:08:25'),
(672, 'danh sách nvl', '', 'echo "Danh sách nguyên vật liệu: " .$p->getNVL();', 'query', 1, 0, '2024-04-15 16:09:56'),
(673, 'danh sách nvl', '', 'echo "Danh sách nguyên vật liệu: " .$p->getNVL();', 'query', 1, 0, '2024-04-15 16:10:24'),
(674, 'danh sách nvl', '', 'echo "Danh sách nguyên vật liệu: " .$p->getNVL();', 'query', 1, 0, '2024-04-15 16:13:02'),
(675, 'danh sách nvl', '', 'echo "Danh sách nguyên vật liệu: " .$p->getNVL();', 'query', 1, 0, '2024-04-15 16:16:32'),
(676, 'danh sách nvl', '', 'echo "Danh sách nguyên vật liệu: " .$p->getNVL();', 'query', 1, 0, '2024-04-15 16:17:15'),
(677, 'danh sách nvl', '', 'echo "Danh sách nguyên vật liệu: " .$p->getNVL();', 'query', 1, 0, '2024-04-15 16:18:54'),
(678, 'danh sách nvl', '', 'echo "Danh sách nguyên vật liệu: " .$p->getNVL();', 'query', 1, 0, '2024-04-15 16:19:30'),
(679, 'danh sách nvl', '', 'echo "Danh sách nguyên vật liệu: " .$p->getNVL();', 'query', 1, 0, '2024-04-15 16:21:03'),
(680, 'nvl ton kho', '', 'echo "Số lượng nguyên vật liệu tồn kho là: " . $p->countNVLton();', 'query', 1, 0, '2024-04-15 16:37:36'),
(681, '', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-15 17:14:55'),
(682, 'so don hang', '', 'echo "Số lượng đơn hàng là:" . $p->countDonhang();', 'query', 1, 0, '2024-04-18 12:50:05'),
(683, 'tp ton kho', '', 'echo "Số lượng thành phẩm tồn kho là: " . $p->countTPton();', 'query', 1, 0, '2024-04-18 12:52:25'),
(684, 'so lượng bbkk', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-18 13:05:03'),
(685, 'so kuong bbkk', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-18 13:05:08'),
(686, 'số bbkk', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-18 13:05:13'),
(687, 'sl bbkk', '', 'echo "Số lượng biên bản kiểm kê là: " . $p->countBBKK();', 'query', 1, 0, '2024-04-18 13:05:17'),
(688, 'ph', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-18 13:08:07'),
(689, 'phiếu xuất nvl', '', 'echo "số lượng phiếu xuất nguyên vật liệu hiện tại là: " . $p->countPXNVL();', 'query', 1, 0, '2024-04-18 13:08:13'),
(690, 'phiếu xuất nvl', '', 'echo "Số phiếu xuất nguyên vật liệu đã duyệt là: " . $p->countphieuDuyet() ." phiếu";', 'query', 1, 0, '2024-04-18 13:08:13'),
(691, 'phiếu xuất nvl', '', 'echo "Số lượng phiếu xuất nguyên vật liệu bị từ chối là: " . $p->countphieuTC() . " phiếu";', 'query', 1, 0, '2024-04-18 13:08:13'),
(692, 'phiếu xuất nvl', '', 'echo "Số lượng phiếu xuất nguyên vật liệu chưa duyệt là: " .$p->countphieuCD() ." phiếu";', 'query', 1, 0, '2024-04-18 13:08:13'),
(693, 'phiếu xuất nvl hiện tại', '', 'echo "số lượng phiếu xuất nguyên vật liệu hiện tại là: " . $p->countPXNVL();', 'query', 1, 0, '2024-04-18 13:10:08'),
(694, 'phiếu xuất nvl đã duyệt', '', 'echo "Số phiếu xuất nguyên vật liệu đã duyệt là: " . $p->countphieuDuyet() ." phiếu";', 'query', 1, 0, '2024-04-18 13:10:21'),
(695, 'số lượng kho nvl', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-18 13:11:16'),
(696, 'kho nvl', '', 'echo "d2warehouse có: " . $p->countKhonvl() . " kho nguyên vật liệu";', 'query', 1, 0, '2024-04-18 13:11:23'),
(697, 'kho nvl', '', 'echo "Số lượng nguyên vật liệu tồn kho là: " . $p->countNVLton();', 'query', 1, 0, '2024-04-18 13:11:23'),
(698, 'so luong kho nguyen vat lieu', '', 'echo "d2warehouse có: " . $p->countKhonvl() . " kho nguyên vật liệu";', 'query', 1, 0, '2024-04-18 13:12:34'),
(699, 'so luong kho nvl', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-18 13:12:42'),
(700, 'so luong kho nvl', '', 'echo "d2warehouse có: " . $p->countKhonvl() . " kho nguyên vật liệu";', 'query', 1, 0, '2024-04-18 13:13:58'),
(701, 'so luong kho thanh pham', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-18 13:14:06'),
(702, 'so luong kho tp', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-18 13:14:53'),
(703, 'so luong kho thanh pham', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-18 13:15:24'),
(704, 'số lượng kho thành phẩm', '', 'echo "d2warehouse có: " . $p->countKhotp() ." Kho thành phẩm";', 'query', 1, 0, '2024-04-18 13:16:01'),
(705, 'số lượng kho nguyên vật liệu', '', 'echo "d2warehouse có: " . $p->countKhonvl() . " kho nguyên vật liệu";', 'query', 1, 0, '2024-04-18 13:16:13'),
(706, 'hi', '', 'Xin chào, tôi la D2Warehousebot, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-18 13:17:00'),
(707, 'số lượng kho nvl', '', 'echo "d2warehouse có: " . $p->countKhonvl() . " kho nguyên vật liệu";', 'query', 1, 0, '2024-04-20 13:06:19'),
(708, 'số lượng kho tp', '', 'echo "d2warehouse có: " . $p->countKhotp() ." Kho thành phẩm";', 'query', 1, 0, '2024-04-20 13:06:32'),
(709, 'tổng kho', '', 'echo "d2warehouse có: " . $p->countKho(). " kho"; ', 'query', 1, 0, '2024-04-20 13:06:37'),
(710, 'số lượng đơn hàng', '', 'echo "Số lượng đơn hàng là:" . $p->countDonhang();', 'query', 1, 0, '2024-04-20 13:06:59'),
(711, 'biên bản kiểm kê', '', 'echo "Số lượng biên bản kiểm kê là: " . $p->countBBKK();', 'query', 1, 0, '2024-04-20 13:08:06'),
(712, 'kế hoạch sản xuất', '', 'echo "Số lượng kế hoạch sản xuất hiện tại là: " .$p->countKHSX();', 'query', 1, 0, '2024-04-20 13:08:43'),
(713, 'phiếu nhập nvl', '', 'echo "số lượng phiếu nhập nguyên vật liệu hiện tại là: " . $p->countPNNVL();\r\n', 'query', 1, 0, '2024-04-20 13:16:03'),
(714, 'phiếu xuất nvl', '', 'echo "số lượng phiếu xuất nguyên vật liệu hiện tại là: " . $p->countPXNVL();', 'query', 1, 0, '2024-04-20 13:16:46'),
(715, 'phiếu xuất nvl', '', 'echo "Số phiếu xuất nguyên vật liệu đã duyệt là: " . $p->countphieuDuyet() ." phiếu";', 'query', 1, 0, '2024-04-20 13:16:46'),
(716, 'phiếu xuất nvl', '', 'echo "Số lượng phiếu xuất nguyên vật liệu bị từ chối là: " . $p->countphieuTC() . " phiếu";', 'query', 1, 0, '2024-04-20 13:16:46'),
(717, 'phiếu xuất nvl', '', 'echo "Số lượng phiếu xuất nguyên vật liệu chưa duyệt là: " .$p->countphieuCD() ." phiếu";', 'query', 1, 0, '2024-04-20 13:16:46'),
(718, 'phieu xuatnvl', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-20 13:18:30'),
(719, 'phieu xuat nvl', '', 'echo "Số phiếu xuất nguyên vật liệu đã duyệt là: " . $p->countphieuDuyet() ." phiếu";', 'query', 1, 0, '2024-04-20 13:18:35'),
(720, 'phieu xuat nvl', '', 'echo "Số lượng phiếu xuất nguyên vật liệu bị từ chối là: " . $p->countphieuTC() . " phiếu";', 'query', 1, 0, '2024-04-20 13:18:35'),
(721, 'phieu xuat nvl', '', 'echo "Số lượng phiếu xuất nguyên vật liệu chưa duyệt là: " .$p->countphieuCD() ." phiếu";', 'query', 1, 0, '2024-04-20 13:18:35'),
(722, 'phieu xuat nguyen vat lieu', '', 'echo "Số phiếu xuất nguyên vật liệu đã duyệt là: " . $p->countphieuDuyet() ." phiếu";', 'query', 1, 0, '2024-04-20 13:20:24'),
(723, 'phieu xuat nguyen vat lieu', '', 'echo "Số lượng phiếu xuất nguyên vật liệu bị từ chối là: " . $p->countphieuTC() . " phiếu";', 'query', 1, 0, '2024-04-20 13:20:24'),
(724, 'phieu xuat nguyen vat lieu', '', 'echo "Số lượng phiếu xuất nguyên vật liệu chưa duyệt là: " .$p->countphieuCD() ." phiếu";', 'query', 1, 0, '2024-04-20 13:20:24'),
(725, 'phieu xuat nvl', '', 'echo "Số lượng phiếu xuất nguyên vật liệu bị từ chối là: " . $p->countphieuTC() . " phiếu";', 'query', 1, 0, '2024-04-20 13:23:10'),
(726, 'phieu xuat nvl', '', 'echo "Số lượng phiếu xuất nguyên vật liệu chưa duyệt là: " .$p->countphieuCD() ." phiếu";', 'query', 1, 0, '2024-04-20 13:23:10'),
(727, 'phieu xuat nvl', '', 'Bạn muốn xem phiếu xuất đã duyệt, bị từ chối hay chưa duyệt', 'text', 1, 0, '2024-04-20 13:23:10'),
(728, 'phieu xuat nvl', '', 'Bạn muốn xem phiếu xuất đã duyệt, bị từ chối hay chưa duyệt', 'text', 1, 0, '2024-04-20 13:32:05'),
(729, 'bị từ chối', '', 'echo "Số lượng phiếu nhập thành phẩm bị từ chối là: " .$p->countphieuTCTP() ." phiếu";', 'query', 1, 0, '2024-04-20 13:32:11'),
(730, 'xuất nvl chưa duyệt', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-20 13:32:29'),
(731, 'phiếu xuất nvl chưa duyệt', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-20 13:32:40'),
(732, 'phieu xuat nguyen vat lieu', '', 'echo "Số lượng phiếu xuất nguyên vật liệu chưa duyệt là: " .$p->countphieuCD() ." phiếu";', 'query', 1, 0, '2024-04-20 13:33:56'),
(733, 'phieu xuat nguyen vat lieu', '', 'Bạn muốn xem phiếu xuất đã duyệt, bị từ chối hay chưa duyệt', 'text', 1, 0, '2024-04-20 13:33:56'),
(734, 'chua duyet xnvl', '', 'echo "Số lượng phiếu xuất nguyên vật liệu chưa duyệt là: " .$p->countphieuCD() ." phiếu";', 'query', 1, 0, '2024-04-20 13:34:53'),
(735, 'nhập nvl', '', 'echo "số lượng phiếu nhập nguyên vật liệu hiện tại là: " . $p->countPNNVL();\r\n', 'query', 1, 0, '2024-04-20 13:35:00'),
(736, 'nhập nvl', '', 'Đầu tiên nhân viên kho sẽ kiểm tra số lượng hàng tồn và báo cáo cho phòng kế hoạch, phòng kế hoạch sẽ đưa ra đề xuất nhập nguyên vật liệu cho giám đốc phê duyệt. Sau khi phê duyệt sẽ có đơn vị đến giao nguyên liệu thô, nhân viên kho tiến hành lập phiếu nhập kho và cập nhật thông tin ', 'text', 1, 0, '2024-04-20 13:35:00'),
(737, 'phiếu xuất nvl', '', 'echo "số lượng phiếu xuất nguyên vật liệu hiện tại là: " . $p->countPXNVL();', 'query', 1, 0, '2024-04-20 13:35:57'),
(738, 'phiếu xuất nvl', '', 'Bạn muốn xem phiếu xuất đã duyệt, bị từ chối hay chưa duyệt', 'text', 1, 0, '2024-04-20 13:35:57'),
(739, 'phiếu xuất nvl', '', 'Bạn muốn xem tổng phiếu xuất nguyên vật liệu, đã duyệt, bị từ chối hay chưa duyệt?', 'text', 1, 0, '2024-04-20 13:41:25'),
(740, 'tổng phiếu xuất nvl', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-20 13:41:35'),
(741, 'phiếu xuất nvl', '', 'echo "số lượng phiếu xuất nguyên vật liệu hiện tại là: " . $p->countPXNVL();', 'query', 1, 0, '2024-04-20 13:43:05'),
(742, 'phiếu xuất nvl', '', 'Bạn muốn xem tổng phiếu xuất nguyên vật liệu, đã duyệt, bị từ chối hay chưa duyệt?', 'text', 1, 0, '2024-04-20 13:43:05'),
(743, 'phieu xuat nvl', '', 'echo "số lượng phiếu xuất nguyên vật liệu hiện tại là: " . $p->countPXNVL();', 'query', 1, 0, '2024-04-20 13:44:11'),
(744, 'phieu xuat nvl', '', 'Bạn muốn xem tổng phiếu xuất nguyên vật liệu, đã duyệt, bị từ chối hay chưa duyệt?', 'text', 1, 0, '2024-04-20 13:44:11'),
(745, 'phieu xuat nvl', '', 'Bạn muốn xem tổng phiếu xuất nguyên vật liệu, đã duyệt, bị từ chối hay chưa duyệt?', 'text', 1, 0, '2024-04-20 13:44:55'),
(746, 'phieu  xuat hien tai', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-20 13:45:09'),
(747, 'tổng phiếu xuât', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-20 13:45:22'),
(748, 'tổng phiếu xuất', '', 'echo "số lượng phiếu xuất nguyên vật liệu hiện tại là: " . $p->countPXNVL();', 'query', 1, 0, '2024-04-20 13:45:28'),
(749, 'phieu xuat nvl', '', 'Bạn muốn xem tổng phiếu xuất nguyên vật liệu, đã duyệt, bị từ chối hay chưa duyệt?', 'text', 1, 0, '2024-04-20 13:47:34'),
(750, 'xuat nvl hien tai', '', 'echo "số lượng phiếu xuất nguyên vật liệu hiện tại là: " . $p->countPXNVL();', 'query', 1, 0, '2024-04-20 13:47:43'),
(751, 'xuất nvl đã duyệt', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-20 13:47:52'),
(752, 'phieu xuat nvl', '', 'Bạn muốn xem tổng phiếu xuất nguyên vật liệu, đã duyệt, bị từ chối hay chưa duyệt?', 'text', 1, 0, '2024-04-20 13:49:14'),
(753, 'xuất nvl đã duyệt', '', 'echo "Số phiếu xuất nguyên vật liệu đã duyệt là: " . $p->countphieuDuyet() ." phiếu";', 'query', 1, 0, '2024-04-20 13:49:24'),
(754, 'da duyet', '', 'echo "Số phiếu xuất nguyên vật liệu đã duyệt là: " . $p->countphieuDuyet() ." phiếu";', 'query', 1, 0, '2024-04-20 13:49:31'),
(755, 'da duyet', '', 'echo "Số lượng phiếu nhập thành phẩm đã duyệt là: " .$p->countphieuDuyetTP() ." phiếu";', 'query', 1, 0, '2024-04-20 13:49:31'),
(756, 'xuất nvl chưa duyệt', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-20 13:49:40'),
(757, 'xuat nvl chua duyet', '', 'echo "Số lượng phiếu xuất nguyên vật liệu chưa duyệt là: " .$p->countphieuCD() ." phiếu";', 'query', 1, 0, '2024-04-20 13:50:39'),
(758, 'xuất nvl chưa duyệt', '', 'echo "Số lượng phiếu xuất nguyên vật liệu chưa duyệt là: " .$p->countphieuCD() ." phiếu";', 'query', 1, 0, '2024-04-20 13:50:54'),
(759, 'phieu xuat nvl', '', 'Bạn muốn xem tổng phiếu xuất nguyên vật liệu, đã duyệt, bị từ chối hay chưa duyệt?', 'text', 1, 0, '2024-04-20 13:51:01'),
(760, 'xuat nvl bi tu choi', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-20 13:51:09'),
(761, 'xuat nvl bi tu choi', '', 'echo "Số lượng phiếu xuất nguyên vật liệu bị từ chối là: " . $p->countphieuTC() . " phiếu";', 'query', 1, 0, '2024-04-20 13:52:18'),
(762, 'xuat tp', '', 'Sau khi hoàn thành việc sản xuất, quản lý kho sẽ điều phối xuất thành phẩm theo các đơn hàng ', 'text', 1, 0, '2024-04-20 13:52:27'),
(763, 'phieu xuat tp', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-20 13:52:35'),
(764, 'số lượng phiếu xuất tp', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-20 13:55:38'),
(765, 'phiếu xuất tp chưa duyệt', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-20 13:56:29'),
(766, 'số lượng phiếu xuất tp hiện tại', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-20 13:56:50'),
(767, 'số lượng phiếu xtp hiện tại', '', 'echo "số lượng phiếu xuất thành phẩm hiện tại là: " . $p->countPXTP();', 'query', 1, 0, '2024-04-20 13:57:10'),
(768, 'sl phiếu tp', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-20 13:58:12'),
(769, 'so luong phieu tp', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-20 13:58:17'),
(770, 'số lượng phiếu tp', '', 'Bạn muốn xem số lượng phiếu nhập thành phẩm hay phiếu xuất thành phẩm?', 'text', 1, 0, '2024-04-20 13:58:27'),
(771, 'phiếu nhập thành phẩm', '', 'echo "số lượng phiếu nhập thành phẩm hiện tại là: " . $p->countPNTP();', 'query', 1, 0, '2024-04-20 13:58:37'),
(772, 'phiếu nhập thành phẩm', '', 'echo "Số lượng phiếu nhập thành phẩm đã duyệt là: " .$p->countphieuDuyetTP() ." phiếu";', 'query', 1, 0, '2024-04-20 13:58:37'),
(773, 'phiếu nhập thành phẩm', '', 'echo "Số lượng phiếu nhập thành phẩm bị từ chối là: " .$p->countphieuTCTP() ." phiếu";', 'query', 1, 0, '2024-04-20 13:58:37'),
(774, 'phieu nhap tp', '', 'echo "Số lượng phiếu nhập thành phẩm bị từ chối là: " .$p->countphieuTCTP() ." phiếu";', 'query', 1, 0, '2024-04-20 14:04:07'),
(775, 'phieu nhap tp', '', 'echo "Số lượng phiếu nhập thành phẩm chưa duyệt là: " .$p->countphieuCDTP() ." \r\n phiếu";', 'query', 1, 0, '2024-04-20 14:04:07'),
(776, 'phieu nhap tp', '', 'Bạn muốn xem phiếu nhập thành phẩm hiện tại, đã duyệt, bị từ chối hay chưa duyệt?', 'text', 1, 0, '2024-04-20 14:04:07'),
(777, 'phieu nhap tp', '', 'Bạn muốn xem phiếu nhập thành phẩm hiện tại, đã duyệt, bị từ chối hay chưa duyệt?', 'text', 1, 0, '2024-04-20 14:07:03'),
(778, 'đã duyệt', '', 'echo "Số phiếu xuất nguyên vật liệu đã duyệt là: " . $p->countphieuDuyet() ." phiếu";', 'query', 1, 0, '2024-04-20 14:07:13'),
(779, 'đã duyệt', '', 'echo "Số lượng phiếu nhập thành phẩm đã duyệt là: " .$p->countphieuDuyetTP() ." phiếu";', 'query', 1, 0, '2024-04-20 14:07:13'),
(780, 'dã duyệt tp', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-20 14:08:05'),
(781, 'đã duyệt nhập tp', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-20 14:08:15'),
(782, 'đã duyệt nhập tp', '', 'echo "Số lượng phiếu nhập thành phẩm đã duyệt là: " .$p->countphieuDuyetTP() ." phiếu";', 'query', 1, 0, '2024-04-20 14:09:49'),
(783, 'phiếu nhập tp', '', 'echo "số lượng phiếu nhập thành phẩm hiện tại là: " . $p->countPNTP();', 'query', 1, 0, '2024-04-20 14:10:11'),
(784, 'phiếu nhập tp', '', 'Bạn muốn xem phiếu nhập thành phẩm hiện tại, đã duyệt, bị từ chối hay chưa duyệt?', 'text', 1, 0, '2024-04-20 14:10:11'),
(785, 'phieu nhap tp', '', 'Bạn muốn xem phiếu nhập thành phẩm hiện tại, đã duyệt, bị từ chối hay chưa duyệt?', 'text', 1, 0, '2024-04-20 14:11:07'),
(786, 'nhap tp chua duyet', '', 'echo "Số lượng phiếu nhập thành phẩm chưa duyệt là: " .$p->countphieuCDTP() ." \r\n phiếu";', 'query', 1, 0, '2024-04-20 14:11:15'),
(787, 'phieu xuat tp', '', 'echo "số lượng phiếu xuất thành phẩm hiện tại là: " . $p->countPXTP();', 'query', 1, 0, '2024-04-20 14:11:26'),
(788, 'phieu xuat nvl', '', 'Bạn muốn xem tổng phiếu xuất nguyên vật liệu, đã duyệt, bị từ chối hay chưa duyệt?', 'text', 1, 0, '2024-04-20 14:11:58'),
(789, 'phieu xuat nvl', '', 'Bạn muốn xem tổng phiếu xuất nguyên vật liệu, đã duyệt, bị từ chối hay chưa duyệt?', 'text', 1, 0, '2024-04-20 14:12:23'),
(790, 'xuat nvl bi tu choi', '', 'echo "Số lượng phiếu xuất nguyên vật liệu bị từ chối là: " . $p->countphieuTC() . " phiếu";', 'query', 1, 0, '2024-04-20 14:12:34'),
(791, 'bbkk', '', 'echo "Số lượng biên bản kiểm kê là: " . $p->countBBKK();', 'query', 1, 0, '2024-04-20 14:13:17'),
(792, 'phieu nhap tp', '', 'Bạn muốn xem phiếu nhập thành phẩm hiện tại, đã duyệt, bị từ chối hay chưa duyệt?', 'text', 1, 0, '2024-04-20 14:15:14'),
(793, 'nhập thành phẩm hiển tại', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-20 14:16:56'),
(794, 'phiếu nhâp tp hiện tại', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-20 14:17:14'),
(795, 'nhap tp hien tai', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-20 14:17:57'),
(796, 'phieu nhap tp', '', 'Bạn muốn xem phiếu nhập thành phẩm hiện tại, đã duyệt, bị từ chối hay chưa duyệt?', 'text', 1, 0, '2024-04-20 14:18:07'),
(797, 'nhập tp hiện tại', '', 'echo "số lượng phiếu nhập thành phẩm hiện tại là: " . $p->countPNTP();', 'query', 1, 0, '2024-04-20 14:18:17'),
(798, 'nhập tp đã duyệt', '', 'echo "Số lượng phiếu nhập thành phẩm đã duyệt là: " .$p->countphieuDuyetTP() ." phiếu";', 'query', 1, 0, '2024-04-20 14:18:51'),
(799, 'nhập tp bị từ chối', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-20 14:18:58'),
(800, 'nhap tp bi tu choi', '', 'echo "Số lượng phiếu nhập thành phẩm bị từ chối là: " .$p->countphieuTCTP() ." phiếu";', 'query', 1, 0, '2024-04-20 14:19:52'),
(801, 'nhap tp chua duyet', '', 'echo "Số lượng phiếu nhập thành phẩm chưa duyệt là: " .$p->countphieuCDTP() ." \r\n phiếu";', 'query', 1, 0, '2024-04-20 14:19:59'),
(802, 'yêu cầu xuất tp', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-20 14:24:13'),
(803, 'yeu cau nhap tp', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-20 14:25:08'),
(804, 'yeu cau nhap tp', '', 'echo "Số lượng yêu cầu nhập thành phẩm là: " . $p->countYCNTP();', 'query', 1, 0, '2024-04-20 14:29:23'),
(805, 'nhap tp', '', 'echo "Số lượng phiếu nhập thành phẩm đã duyệt là: " .$p->countphieuDuyetTP() ." phiếu";', 'query', 1, 0, '2024-04-20 14:30:14'),
(806, 'nhap tp', '', 'echo "Số lượng phiếu nhập thành phẩm bị từ chối là: " .$p->countphieuTCTP() ." phiếu";', 'query', 1, 0, '2024-04-20 14:30:14'),
(807, 'nhap tp', '', 'echo "Số lượng phiếu nhập thành phẩm chưa duyệt là: " .$p->countphieuCDTP() ." \r\n phiếu";', 'query', 1, 0, '2024-04-20 14:30:14'),
(808, 'nhap tp', '', 'Bạn muốn xem phiếu nhập thành phẩm hiện tại, đã duyệt, bị từ chối hay chưa duyệt?', 'text', 1, 0, '2024-04-20 14:30:14'),
(809, 'nhap tp', '', 'echo "Số lượng yêu cầu nhập thành phẩm là: " . $p->countYCNTP();', 'query', 1, 0, '2024-04-20 14:30:14'),
(810, 'phieu nhap tp', '', 'Bạn muốn xem phiếu nhập thành phẩm hiện tại, đã duyệt, bị từ chối hay chưa duyệt?', 'text', 1, 0, '2024-04-20 14:30:35'),
(811, 'nhập tp đã duyệt', '', 'echo "Số lượng phiếu nhập thành phẩm đã duyệt là: " .$p->countphieuDuyetTP() ." phiếu";', 'query', 1, 0, '2024-04-20 14:31:24'),
(812, 'yêu cầu nhập tp', '', 'echo "Số lượng phiếu nhập thành phẩm đã duyệt là: " .$p->countphieuDuyetTP() ." phiếu";', 'query', 1, 0, '2024-04-20 14:32:21'),
(813, 'yêu cầu nhập tp', '', 'echo "Số lượng yêu cầu nhập thành phẩm là: " . $p->countYCNTP();', 'query', 1, 0, '2024-04-20 14:32:21'),
(814, 'yeu cau nhap tp', '', 'echo "Số lượng phiếu nhập thành phẩm đã duyệt là: " .$p->countphieuDuyetTP() ." phiếu";', 'query', 1, 0, '2024-04-20 14:34:54'),
(815, 'yeu cau nhap tp', '', 'echo "Số lượng yêu cầu nhập thành phẩm là: " . $p->countYCNTP();', 'query', 1, 0, '2024-04-20 14:34:54'),
(816, 'yeu cau nhap tp hien tai', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-20 14:39:00'),
(817, 'yeu cau nhap tp hien tai', '', 'echo "Số lượng yêu cầu nhập thành phẩm là: " . $p->countYCNTP();', 'query', 1, 0, '2024-04-20 14:39:31'),
(818, 'yeu cau nhap tp da duyet', '', 'echo "Số lượng phiếu nhập thành phẩm đã duyệt là: " .$p->countphieuDuyetTP() ." phiếu";', 'query', 1, 0, '2024-04-20 14:39:44'),
(819, 'yeu cau nhap tp bi tu choi', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-20 14:39:57'),
(820, 'yeu cau nhap tp bi tu choi', '', 'echo "Số lượng phiếu nhập thành phẩm bị từ chối là: " .$p->countphieuTCTP() ." phiếu";', 'query', 1, 0, '2024-04-20 14:40:59'),
(821, 'yeu cau nhap tp da duyet', '', 'echo "Số lượng phiếu nhập thành phẩm đã duyệt là: " .$p->countphieuDuyetTP() ." phiếu";', 'query', 1, 0, '2024-04-20 14:41:10'),
(822, 'yeu cau nhap tp chua duyet', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-20 14:41:29'),
(823, 'yeu cau nhap tp hien tai', '', 'echo "Số lượng yêu cầu nhập thành phẩm là: " . $p->countYCNTP();', 'query', 1, 0, '2024-04-20 14:42:25'),
(824, 'yeu cau nhap tp chua duyet', '', 'echo "Số lượng phiếu nhập thành phẩm chưa duyệt là: " .$p->countphieuCDTP() ." \r\n phiếu";', 'query', 1, 0, '2024-04-20 14:42:36'),
(825, 'yeu cau nhap tp da duyet', '', 'echo "Số lượng phiếu nhập thành phẩm đã duyệt là: " .$p->countphieuDuyetTP() ." phiếu";', 'query', 1, 0, '2024-04-20 14:42:46'),
(826, 'yeu cau nhap tp bi tu choi', '', 'echo "Số lượng phiếu nhập thành phẩm bị từ chối là: " .$p->countphieuTCTP() ." phiếu";', 'query', 1, 0, '2024-04-20 14:42:57'),
(827, 'yeu cau xuat nvl', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-20 14:43:38'),
(828, 'phieu xuat nvl hien tai', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-20 14:43:53'),
(829, 'xuất nvl hiện tại', '', 'echo "số lượng phiếu xuất nguyên vật liệu hiện tại là: " . $p->countPXNVL();', 'query', 1, 0, '2024-04-20 14:44:33'),
(830, 'phiếu xuất nvl hiện tại', '', 'echo "số lượng phiếu xuất nguyên vật liệu hiện tại là: " . $p->countPXNVL();', 'query', 1, 0, '2024-04-20 14:46:09'),
(831, 'yeu cau xuat nvl', '', 'echo "Số lượng yêu cầu xuất nguyên vật liệu: " . $p->countYCXNVL();', 'query', 1, 0, '2024-04-20 14:53:12'),
(832, 'yeu cau xuat nvl da duyet', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-20 14:53:26'),
(833, 'yc xuat nvl da duyet', '', 'echo "Số phiếu xuất nguyên vật liệu đã duyệt là: " . $p->countphieuDuyet() ." phiếu";', 'query', 1, 0, '2024-04-20 14:56:17'),
(834, 'yc xuat nvl bi tu choi', '', 'echo "Số lượng yêu cầu xuất nguyên vật liệu bị từ chối là: " . $p->countphieuTC() . " phiếu";', 'query', 1, 0, '2024-04-20 14:58:47'),
(835, 'yc xuat nvl da duyet', '', 'echo "Số yêu cầu xuất nguyên vật liệu đã duyệt là: " . $p->countphieuDuyet() ." phiếu";', 'query', 1, 0, '2024-04-20 14:59:10'),
(836, 'yc xuat nvl chua duyet', '', 'echo "Số lượng yêu cầu xuất nguyên vật liệu chưa duyệt là: " .$p->countphieuCD() ." phiếu";', 'query', 1, 0, '2024-04-20 15:01:37'),
(837, 'phieu xaut nvl chua duyet', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-22 12:04:49'),
(838, 'phieu xuat nvl chua duyet', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-22 12:04:58'),
(839, 'yc xuat nvl chua duyet', '', 'echo "Số lượng yêu cầu xuất nguyên vật liệu chưa duyệt là: " .$p->countphieuCD() ." phiếu";', 'query', 1, 0, '2024-04-22 12:05:15'),
(840, 'kho nvl', '', 'echo "d2warehouse có: " . $p->countKhonvl() . " kho nguyên vật liệu";', 'query', 1, 0, '2024-04-22 12:06:15'),
(841, 'kho nvl', '', 'echo "Số lượng nguyên vật liệu tồn kho là: " . $p->countNVLton();', 'query', 1, 0, '2024-04-22 12:06:15'),
(842, 'nvl ton kho', '', 'echo "Số lượng nguyên vật liệu tồn kho là: " . $p->countNVLton();', 'query', 1, 0, '2024-04-22 12:06:32'),
(843, 'so luong kho nvl', '', 'echo "d2warehouse có: " . $p->countKhonvl() . " kho nguyên vật liệu";', 'query', 1, 0, '2024-04-22 12:06:39'),
(844, 'so luong kho tp', '', 'echo "d2warehouse có: " . $p->countKhotp() ." Kho thành phẩm";', 'query', 1, 0, '2024-04-22 12:06:48'),
(845, 'so luong kho', '', 'echo "d2warehouse có: " . $p->countKho(). " kho"; ', 'query', 1, 0, '2024-04-22 12:06:54'),
(846, 'so luong kho', '', 'echo "d2warehouse có: " . $p->countKhonvl() . " kho nguyên vật liệu";', 'query', 1, 0, '2024-04-22 12:06:54'),
(847, 'so luong kho', '', 'echo "d2warehouse có: " . $p->countKhotp() ." Kho thành phẩm";', 'query', 1, 0, '2024-04-22 12:06:54'),
(848, 'so luong kho', '', 'Bạn muốn biết tổng số lượng kho, kho thành phẩm hay kho nguyên vật liệu?', 'text', 1, 0, '2024-04-22 12:06:54'),
(849, 'tong so luong kho', '', 'echo "d2warehouse có: " . $p->countKho(). " kho"; ', 'query', 1, 0, '2024-04-22 12:07:57'),
(850, 'so luong kho', '', 'echo "d2warehouse có: " . $p->countKho(). " kho"; ', 'query', 1, 0, '2024-04-22 12:08:21'),
(851, 'so luong kho', '', 'echo "d2warehouse có: " . $p->countKhonvl() . " kho nguyên vật liệu";', 'query', 1, 0, '2024-04-22 12:08:21'),
(852, 'so luong kho', '', 'echo "d2warehouse có: " . $p->countKhotp() ." Kho thành phẩm";', 'query', 1, 0, '2024-04-22 12:08:21'),
(853, 'so luong kho', '', 'Bạn muốn biết tổng số lượng kho, kho thành phẩm hay kho nguyên vật liệu?', 'text', 1, 0, '2024-04-22 12:08:21'),
(854, 'hỗ trợ 24/24', '', 'Kho có đội ngũ nhân viên túc trực để hỗ trợ khách hàng 24/24', 'text', 1, 0, '2024-04-22 12:15:54'),
(855, 'so luong nvl', '', 'echo "Số lượng nguyên vật liệu là: " . $p->countNVl();', 'query', 1, 0, '2024-04-22 12:33:05'),
(856, 'so luong nvl', '', 'echo "Số lượng nguyên vật liệu tồn kho là: " . $p->countNVLton();', 'query', 1, 0, '2024-04-22 12:33:05'),
(857, 'tong so luong nvl', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-04-22 12:33:21'),
(858, 'so luong tp', '', 'echo "Số lượng thành phẩm là: " . $p->countTP();', 'query', 1, 0, '2024-04-22 12:34:02'),
(859, 'so luong tp', '', 'echo "Số lượng thành phẩm tồn kho là: " . $p->countTPton();', 'query', 1, 0, '2024-04-22 12:34:02'),
(860, 'tong so luong nvl', '', 'echo "Số lượng nguyên vật liệu là: " . $p->countNVl();', 'query', 1, 1, '2024-04-22 12:35:02'),
(861, 'so luong nvl ton kho', '', 'echo "Số lượng nguyên vật liệu tồn kho là: " . $p->countNVLton();', 'query', 1, 1, '2024-04-22 12:35:11'),
(862, 'sl bien ban kiem ke', '', 'echo "Số lượng biên bản kiểm kê là: " . $p->countBBKK();', 'query', 1, 1, '2024-04-22 12:35:25'),
(863, 'phiếu xuất nvl', '', 'echo "số lượng phiếu xuất nguyên vật liệu hiện tại là: " . $p->countPXNVL();', 'query', 1, 1, '2024-04-22 12:38:44'),
(864, 'phiếu xuất nvl', '', 'Bạn muốn xem tổng phiếu xuất nguyên vật liệu, đã duyệt, bị từ chối hay chưa duyệt?', 'text', 1, 1, '2024-04-22 12:38:44'),
(865, 'tong phieu xuat nvl', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 1, '2024-04-22 12:38:54'),
(866, 'tong phieu xuat nguyen vat lieu', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 1, '2024-04-22 12:39:09'),
(867, 'xuat nvl hien tai', '', 'echo "số lượng phiếu xuất nguyên vật liệu hiện tại là: " . $p->countPXNVL();', 'query', 1, 1, '2024-04-22 12:39:35'),
(868, 'cách thức liên lạc với giám đốc', '', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 1, '2024-04-22 12:47:13'),
(869, 'xin chào', 'gd1@gmail.com', 'Xin chào, tôi la D2Warehousebot, tôi có thể giúp gì cho bạn', 'text', 1, 1, '2024-04-26 04:22:18'),
(870, 'd2warehouse', 'gd1@gmail.com', 'D2Warehouse là đơn vị kho sản xuất và cung cấp các sản phẩm từ đậu nành, với nguyên vật liệu chính là đậu nành và sản phẩm thành phẩm bao gồm bã đậu nành và dầu đậu nành. Để đảm bảo chất lượng sản phẩm và đáp ứng nhu cầu của khách hàng, hệ thống quản lý kho được xây dựng bởi Lê Hạnh Hải Đăng và Bùi Thục Đoan.', 'text', 1, 1, '2024-04-26 04:22:23'),
(871, 'd2warehouse', 'gd1@gmail.com', 'kho d2warehouse được thành lập vào tháng 12 năm 2023', '', 1, 1, '2024-04-26 04:22:23'),
(873, 'hello', 'gd1@gmail.com', 'Xin chào, tôi la D2Warehousebot, tôi có thể giúp gì cho bạn', 'text', 1, 1, '2024-04-26 04:23:40'),
(874, 'd2warehouse là gì', 'gd1@gmail.com', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 1, '2024-04-26 04:23:47'),
(875, 'd2warehouse', 'gd1@gmail.com', 'D2Warehouse là đơn vị kho sản xuất và cung cấp các sản phẩm từ đậu nành, với nguyên vật liệu chính là đậu nành và sản phẩm thành phẩm bao gồm bã đậu nành và dầu đậu nành. Để đảm bảo chất lượng sản phẩm và đáp ứng nhu cầu của khách hàng, hệ thống quản lý kho được xây dựng bởi Lê Hạnh Hải Đăng và Bùi Thục Đoan.', 'text', 1, 1, '2024-04-26 04:23:54'),
(876, 'd2warehouse', 'gd1@gmail.com', 'kho d2warehouse được thành lập vào tháng 12 năm 2023', '', 1, 1, '2024-04-26 04:23:54'),
(878, 'bây giờ là mấy giờ', 'gd1@gmail.com', 'echo "bây giờ là ".$child1;', 'query', 1, 1, '2024-04-26 04:24:55'),
(879, 'hi', 'gd1@gmail.com', 'Xin chào, tôi la D2Warehousebot, tôi có thể giúp gì cho bạn', 'text', 1, 1, '2024-04-26 18:46:50'),
(880, 'kho d2', 'gd1@gmail.com', 'D2Warehouse là đơn vị kho sản xuất và cung cấp các sản phẩm từ đậu nành, với nguyên vật liệu chính là đậu nành và sản phẩm thành phẩm bao gồm bã đậu nành và dầu đậu nành. Để đảm bảo chất lượng sản phẩm và đáp ứng nhu cầu của khách hàng, hệ thống quản lý kho được xây dựng bởi Lê Hạnh Hải Đăng và Bùi Thục Đoan.', 'text', 1, 1, '2024-04-26 18:46:59'),
(881, 'd2warehouse', 'gd1@gmail.com', 'D2Warehouse là đơn vị kho sản xuất và cung cấp các sản phẩm từ đậu nành, với nguyên vật liệu chính là đậu nành và sản phẩm thành phẩm bao gồm bã đậu nành và dầu đậu nành. Để đảm bảo chất lượng sản phẩm và đáp ứng nhu cầu của khách hàng, hệ thống quản lý kho được xây dựng bởi Lê Hạnh Hải Đăng và Bùi Thục Đoan.', 'text', 1, 1, '2024-04-26 18:48:32'),
(882, 'd2warehouse', 'gd1@gmail.com', 'kho d2warehouse được thành lập vào tháng 12 năm 2023', '', 1, 1, '2024-04-26 18:48:32'),
(883, 'hello', 'qlk1@gmail.com', 'Xin chào, tôi la D2Warehousebot, tôi có thể giúp gì cho bạn', 'text', 1, 1, '2024-05-01 14:15:29'),
(884, 'xxxx', 'qlk1@gmail.com', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 1, '2024-05-02 18:40:27'),
(885, 'phieu nnvl', 'qlk1@gmail.com', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 1, '2024-05-02 18:48:41'),
(886, 'so phieu nvl', 'qlk1@gmail.com', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 1, '2024-05-02 18:48:50'),
(887, 'phieu xuat nguyen vat lieu', 'qlk1@gmail.com', 'echo "số lượng phiếu xuất nguyên vật liệu hiện tại là: " . $p->countPXNVL();', 'query', 1, 1, '2024-05-02 18:49:01'),
(888, 'phieu xuat nguyen vat lieu', 'qlk1@gmail.com', 'Bạn muốn xem tổng phiếu xuất nguyên vật liệu, đã duyệt, bị từ chối hay chưa duyệt?', 'text', 1, 1, '2024-05-02 18:49:01'),
(889, 'da duyet', 'qlk1@gmail.com', 'echo "Số lượng yêu cầu xuất nguyên vật liệu đã duyệt là: " . $p->countphieuDuyet() ." phiếu";', 'query', 1, 1, '2024-05-02 18:49:07'),
(890, 'da duyet', 'qlk1@gmail.com', 'echo "Số lượng phiếu nhập thành phẩm đã duyệt là: " .$p->countphieuDuyetTP() ." phiếu";', 'query', 1, 1, '2024-05-02 18:49:07'),
(891, 'phieu nhap nguyen vat lieu', 'qlk1@gmail.com', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 1, '2024-05-02 18:49:19'),
(892, 'xin chào', 'nvk1@gmail.com', 'Xin chào, tôi la D2Warehousebot, tôi có thể giúp gì cho bạn', 'text', 1, 1, '2024-05-05 13:36:06'),
(893, 'phieu nnvl', 'gd1@gmail.com', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 1, '2024-05-06 19:27:26'),
(894, 'phieu xuat nguyen vat lieu', 'gd1@gmail.com', 'echo "số lượng phiếu xuất nguyên vật liệu hiện tại là: " . $p->countPXNVL();', 'query', 1, 1, '2024-05-06 19:27:31'),
(895, 'phieu xuat nguyen vat lieu', 'gd1@gmail.com', 'Bạn muốn xem tổng phiếu xuất nguyên vật liệu, đã duyệt, bị từ chối hay chưa duyệt?', 'text', 1, 1, '2024-05-06 19:27:31'),
(896, 'chua duyet', 'gd1@gmail.com', 'echo "Số lượng yêu cầu xuất nguyên vật liệu chưa duyệt là: " .$p->countphieuCD() ." phiếu";', 'query', 1, 1, '2024-05-06 19:27:38'),
(897, 'chua duyet', 'gd1@gmail.com', 'echo "Số lượng phiếu nhập thành phẩm chưa duyệt là: " .$p->countphieuCDTP() ." \r\n phiếu";', 'query', 1, 1, '2024-05-06 19:27:38'),
(898, 'phieu nhap nguyen vat lieu', 'gd1@gmail.com', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 1, '2024-05-06 19:28:27'),
(899, 'xin chào', 'gd1@gmail.com', 'Xin chào, tôi la D2Warehousebot, tôi có thể giúp gì cho bạn', 'text', 1, 1, '2024-05-06 19:28:30'),
(900, 'bây giờ là mấy giờ', 'gd1@gmail.com', 'echo "bây giờ là ".$child1;', 'query', 1, 1, '2024-05-06 19:28:41'),
(901, 'kho d2', 'gd1@gmail.com', 'D2Warehouse là đơn vị kho sản xuất và cung cấp các sản phẩm từ đậu nành, với nguyên vật liệu chính là đậu nành và sản phẩm thành phẩm bao gồm bã đậu nành và dầu đậu nành. Để đảm bảo chất lượng sản phẩm và đáp ứng nhu cầu của khách hàng, hệ thống quản lý kho được xây dựng bởi Lê Hạnh Hải Đăng và Bùi Thục Đoan.', 'text', 1, 1, '2024-05-06 19:28:43'),
(902, 'd2warehouse', 'gd1@gmail.com', 'D2Warehouse là đơn vị kho sản xuất và cung cấp các sản phẩm từ đậu nành, với nguyên vật liệu chính là đậu nành và sản phẩm thành phẩm bao gồm bã đậu nành và dầu đậu nành. Để đảm bảo chất lượng sản phẩm và đáp ứng nhu cầu của khách hàng, hệ thống quản lý kho được xây dựng bởi Lê Hạnh Hải Đăng và Bùi Thục Đoan.', 'text', 1, 1, '2024-05-06 19:28:49'),
(903, 'd2warehouse', 'gd1@gmail.com', 'kho d2warehouse được thành lập vào tháng 12 năm 2023', '', 1, 1, '2024-05-06 19:28:49'),
(904, 'd2warehouse', 'gd1@gmail.com', 'echo "d2warehouse có: " . $p->countKho(). " kho"; ', 'query', 1, 1, '2024-05-06 19:28:49'),
(905, 'số phiếu xuất nguyên vật liệu', 'gd1@gmail.com', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 1, '2024-05-06 19:29:04'),
(906, 'd2warehouse có bao nhiêu kho', 'gd1@gmail.com', 'echo "d2warehouse có: " . $p->countKho(). " kho"; ', 'query', 1, 1, '2024-05-06 19:29:28'),
(907, 'liên hệ với ban giám đốc', 'gd1@gmail.com', 'bạn có thể gọi vào số hotline 19001234 để được hỗ trợ', 'text', 1, 1, '2024-05-06 19:30:34'),
(908, 'quản lý kho', 'gd1@gmail.com', 'Đối với các quyền có thể xét duyệt chỉ có tài khoản của giám đốc được phép truy cập.\r\nCác quyền chỉnh sửa tài khoản người dùng chỉ tài khoản admin được phép truy cập.', 'text', 1, 1, '2024-05-06 19:30:41'),
(909, 'giờ làm việc', 'gd1@gmail.com', 'kho d2warehouse bắt đầu làm việc vào 8:30 đến 17:30. Ngoài thời gian làm việc vẫn sẽ có nhân viên trực tại kho, trực website 24/24 phòng trường hợp khẩn cấp.', 'text', 1, 1, '2024-05-06 19:30:54'),
(910, 'quy trình xuất nvl', 'gd1@gmail.com', 'Phòng kế hoạch đưa ra kế hoạch sản xuất cho giám đốc phê duyệt, sau khi được duyệt quản lý kho sẽ điều phối xuất nguyên vật liệu cho nhân viên kho, nhân viên kho sẽ lập biên bản xuất nguyên vật liệu và cập nhật thông tin', 'text', 1, 1, '2024-05-06 19:31:02'),
(911, 'd2warehouse là gì', 'gd1@gmail.com', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 1, '2024-05-06 19:31:17'),
(912, 'kho nguyên vật liệu', 'gd1@gmail.com', 'echo "d2warehouse có: " . $p->countKhonvl() . " kho nguyên vật liệu";', 'query', 1, 1, '2024-05-06 19:31:26'),
(913, 'ai là người đẹp trai nhất', 'admin@gmail.com', 'tất nhiên là anh Đeng rồi', 'text', 1, 0, '2024-05-08 04:03:33'),
(914, 'ây da', 'admin@gmail.com', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-05-08 18:54:05'),
(915, 'một hai ba', 'admin@gmail.com', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-05-08 18:59:36'),
(916, 'adu vjp', 'admin@gmail.com', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-05-08 18:59:41'),
(917, 'ây da', 'admin@gmail.com', 'ádfasdfasfd', 'text', 1, 0, '2024-05-08 19:30:45'),
(918, 'xin chào', 'admin@gmail.com', 'Xin chào, tôi la D2Warehousebot, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-05-08 19:36:21'),
(919, 'ádfasdgsafasfd', 'admin@gmail.com', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-05-08 19:36:26'),
(920, '21311413', 'admin@gmail.com', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-05-08 19:36:49'),
(921, '3245345345', 'admin@gmail.com', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-05-08 19:36:51'),
(922, 'ểtrtert', 'admin@gmail.com', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-05-08 19:36:53'),
(923, 'kho d2 nằm ở đâu', 'admin@gmail.com', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-05-08 19:38:57'),
(924, 'kho d2 nằm ở đâu', 'admin@gmail.com', 'Kho d2 được xây dựng trong khuôn viên trường Đại học Công Nghiệp thành phố Hồ Chí Minh', 'text', 1, 0, '2024-05-08 19:40:49'),
(925, 'số phiếu nhập nguyên vật liệu', 'admin@gmail.com', 'echo "số lượng phiếu nhập nguyên vật liệu hiện tại là: " . $p->countPNNVL();\r\n', 'query', 1, 0, '2024-05-08 19:42:36'),
(926, 'số phiếu xuất nguyên vật liệu', 'admin@gmail.com', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-05-08 19:42:45'),
(927, 'số phiếu xuất nguyên vật liệu', 'admin@gmail.com', 'echo "số lượng phiếu xuất nguyên vật liệu hiện tại là: " . $p->countPXNVL();', 'query', 1, 0, '2024-05-08 19:44:22'),
(928, 'thích gì thì cứ hỏi', 'admin@gmail.com', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-05-08 19:44:34'),
(929, '12121212121212', 'admin@gmail.com', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-05-08 19:52:53'),
(930, 'hé lô', 'admin@gmail.com', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-05-08 19:53:54'),
(931, 'ai đẹp trai nhất', 'admin@gmail.com', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-05-08 23:15:47'),
(932, 'ai đẹp trai nhất', 'admin@gmail.com', 'anh Đăng đẹp trai', 'text', 1, 0, '2024-05-08 23:16:06'),
(933, 'hello', 'admin@gmail.com', 'Xin chào, tôi la D2Warehousebot, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-05-09 07:47:31'),
(934, 'xin chào', 'admin@gmail.com', 'Xin chào, tôi la D2Warehousebot, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-05-09 08:02:24'),
(935, 'a', 'admin@gmail.com', 'Hãy cho tôi nội dung cụ thể về một chủ đề nào đó !', 'text', 1, 0, '2024-05-09 08:13:09'),
(936, 'quy trình xuất nhập kho', 'admin@gmail.com', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-05-09 08:47:59'),
(937, 'quy trình xuất kho', 'admin@gmail.com', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-05-09 08:48:30'),
(938, 'quy trình xuất kho', 'admin@gmail.com', 'Trong trường hợp xuất kho nguyên vật liệu. Phòng kế hoạch sẽ gửi đề xuất cho giám đốc phê duyệt. Sau khi đề xuất được phê duyệt, đề xuất này sẽ được chuyển đến cho quản lý kho. Quản lý kho sẽ dựa vào đề xuất mà tiến hành điều phối cho nhân viên kho thực hiện xuất kho nguyên vật liệu.\r\nTrong trường hợp xuất thành phẩm, quản lý kho sẽ dựa vào đơn hàng mà thực hiện điều phối nhân viên.', 'text', 1, 0, '2024-05-09 08:51:03'),
(939, 'quy trình nhập', 'admin@gmail.com', 'Đầu tiên nhân viên kho sẽ kiểm tra số lượng hàng tồn và báo cáo cho phòng kế hoạch, phòng kế hoạch sẽ đưa ra đề xuất nhập nguyên vật liệu cho giám đốc phê duyệt. Sau khi phê duyệt sẽ có đơn vị đến giao nguyên liệu thô, nhân viên kho tiến hành lập phiếu nhập kho và cập nhật thông tin ', 'text', 1, 0, '2024-05-09 08:51:16'),
(940, 'quy trình nhập kho', 'admin@gmail.com', 'Đầu tiên nhân viên kho sẽ kiểm tra số lượng hàng tồn và báo cáo cho phòng kế hoạch, phòng kế hoạch sẽ đưa ra đề xuất nhập nguyên vật liệu cho giám đốc phê duyệt. Sau khi phê duyệt sẽ có đơn vị đến giao nguyên liệu thô, nhân viên kho tiến hành lập phiếu nhập kho và cập nhật thông tin ', 'text', 1, 0, '2024-05-09 08:51:23'),
(941, 'quản lý', 'admin@gmail.com', 'Đối với các quyền có thể xét duyệt chỉ có tài khoản của giám đốc được phép truy cập.\r\nCác quyền chỉnh sửa tài khoản người dùng chỉ tài khoản admin được phép truy cập.', 'text', 1, 0, '2024-05-09 08:51:36'),
(942, 'quản lý kho', 'admin@gmail.com', 'Đối với các quyền có thể xét duyệt chỉ có tài khoản của giám đốc được phép truy cập.\r\nCác quyền chỉnh sửa tài khoản người dùng chỉ tài khoản admin được phép truy cập.', 'text', 1, 0, '2024-05-09 08:51:43'),
(943, '', 'admin@gmail.com', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-05-09 12:26:31'),
(944, 'dsfasdf', 'admin@gmail.com', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-05-09 12:26:34'),
(945, 'xin chào', 'gd1@gmail.com', 'Xin chào, tôi la D2Warehousebot, tôi có thể giúp gì cho bạn', 'text', 1, 1, '2024-05-13 21:49:22'),
(946, 'bạn có khỏe không', 'gd1@gmail.com', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 1, '2024-05-13 21:49:30'),
(947, 'tôi muốn hỏi', 'gd1@gmail.com', 'Tôi luôn sẵn sàng trả lời những câu hỏi và yêu cầu của bạn', 'text', 1, 1, '2024-05-13 21:49:36'),
(948, 'bạn có thể cho tôi biết số phiếu nguyên vật liệu không', 'gd1@gmail.com', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 1, '2024-05-13 21:49:51'),
(949, 'số phiếu nguyên vật liệu', 'gd1@gmail.com', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 1, '2024-05-13 21:49:58'),
(950, 'phiếu xuất nguyên vật liệu', 'gd1@gmail.com', 'echo "số lượng phiếu xuất nguyên vật liệu hiện tại là: " . $p->countPXNVL();', 'query', 1, 1, '2024-05-13 21:50:11'),
(951, 'phiếu xuất nguyên vật liệu', 'gd1@gmail.com', 'Bạn muốn xem tổng phiếu xuất nguyên vật liệu, đã duyệt, bị từ chối hay chưa duyệt?', 'text', 1, 1, '2024-05-13 21:50:11'),
(952, 'phiếu xuất nguyên vật liệu', 'gd1@gmail.com', 'echo "số lượng phiếu xuất nguyên vật liệu hiện tại là: " . $p->countPXNVL();', 'query', 1, 1, '2024-05-13 21:50:11'),
(953, 'số phiếu nhập', 'gd1@gmail.com', 'echo "số lượng phiếu nhập nguyên vật liệu hiện tại là: " . $p->countPNNVL();\r\n', 'query', 1, 1, '2024-05-13 21:50:16'),
(954, 'số phiếu nhập', 'gd1@gmail.com', 'echo "số lượng phiếu nhập thành phẩm hiện tại là: " . $p->countPNTP();', 'query', 1, 1, '2024-05-13 21:50:16'),
(955, 'nhập nguyên vật liệu', 'gd1@gmail.com', 'echo "số lượng phiếu nhập nguyên vật liệu hiện tại là: " . $p->countPNNVL();\r\n', 'query', 1, 1, '2024-05-13 21:50:24'),
(956, 'chào bạn', 'gd1@gmail.com', 'Xin chào, tôi la D2Warehousebot, tôi có thể giúp gì cho bạn', 'text', 1, 1, '2024-05-21 17:56:50'),
(957, 'số phiếu nguyên vật liệu', 'admin@gmail.com', 'Tôi không rõ yêu cầu của bạn, tôi có thể cho bạn biết số lượng nguyên vật liệu trong kho hiện tại. echo "Số lượng nguyên vật liệu là: " . $p->countNVl();', 'text', 1, 0, '2024-05-23 14:37:07'),
(958, 'số phiếu nguyên vật liệu', 'admin@gmail.com', ' echo "Tôi không rõ yêu cầu của bạn, tôi có thể cho bạn biết số lượng nguyên vật liệu trong kho hiện tại. Số lượng nguyên vật liệu là: " . $p->countNVl();', 'text', 1, 0, '2024-05-23 14:37:50'),
(959, 'số phiếu nguyên vật liệu', 'admin@gmail.com', ' echo "Tôi không rõ yêu cầu của bạn, tôi có thể cho bạn biết số lượng nguyên vật liệu trong kho hiện tại. Số lượng nguyên vật liệu là: " . $p->countNVl();', 'query', 1, 0, '2024-05-23 14:38:21'),
(960, 'nguyên vật liệu', 'admin@gmail.com', 'echo "số lượng phiếu nhập nguyên vật liệu hiện tại là: " . $p->countPNNVL();\r\n', 'query', 1, 0, '2024-05-23 14:39:40'),
(961, 'nguyên vật liệu', 'admin@gmail.com', 'echo "số lượng phiếu xuất nguyên vật liệu hiện tại là: " . $p->countPXNVL();', 'query', 1, 0, '2024-05-23 14:39:40'),
(962, 'nguyên vật liệu', 'admin@gmail.com', 'Bạn muốn xem phiếu nhập nguyên vật liệu hay phiếu xuất nguyên vật liệu ?', 'text', 1, 0, '2024-05-23 14:39:40'),
(963, 'nguyên vật liệu', 'admin@gmail.com', 'Phòng kế hoạch đưa ra kế hoạch sản xuất cho giám đốc phê duyệt, sau khi được duyệt quản lý kho sẽ điều phối xuất nguyên vật liệu cho nhân viên kho, nhân viên kho sẽ lập biên bản xuất nguyên vật liệu và cập nhật thông tin', 'text', 1, 0, '2024-05-23 14:39:40');
INSERT INTO `chats` (`id`, `user`, `user_mail`, `chatbot`, `action`, `status`, `del_msg`, `date`) VALUES
(964, 'nguyên vật liệu', 'admin@gmail.com', 'echo "d2warehouse có: " . $p->countKhonvl() . " kho nguyên vật liệu";', 'query', 1, 0, '2024-05-23 14:39:40'),
(965, 'nguyên vật liệu', 'admin@gmail.com', 'echo "Số lượng nguyên vật liệu là: " . $p->countNVl();', 'query', 1, 0, '2024-05-23 14:39:40'),
(966, 'nguyên vật liệu', 'admin@gmail.com', 'Nguyên vật liệu còn 30 ngày nữa sẽ đến ngày hết hạn được xem là nguyên liệu gần hết hạn.', 'text', 1, 0, '2024-05-23 14:39:40'),
(967, 'nguyên vật liệu', 'admin@gmail.com', 'Đối với kho nguyên liệu: nhiệt độ duy trì ở mức 25 độ, độ ẩm từ 40% đến 60%.\r\nĐối với kho thành phẩm: nhiệt độ duy trì ở mức 20 độ, độ ẩm từ 40% đến 60%\r\nTất cả hàng hóa đều phải tránh ánh nắng trực tiếp, hàng hóa phải ở nơi cao ráo.', 'text', 1, 0, '2024-05-23 14:39:40'),
(968, 'nguyên vật liệu', 'admin@gmail.com', 'Trước khi nguyên vật liệu được nhập kho, nhân viên kho phải đảm bảo không bị hư hỏng, ngày hết hạn còn xa.\r\nNguyên liệu bị hư trong quá trình lưu trữ, nhân viên kho phải báo cáo cho quản lý kho để tìm ra nguyên nhân của việc hư hỏng và khắc phục.', 'text', 1, 0, '2024-05-23 14:39:40'),
(969, 'nguyên vật liệu', 'admin@gmail.com', 'echo "Số lượng yêu cầu xuất nguyên vật liệu đã duyệt là: " . $p->countphieuDuyet() ." phiếu";', 'query', 1, 0, '2024-05-23 14:39:40'),
(970, 'nguyên vật liệu', 'admin@gmail.com', 'echo "Số lượng yêu cầu xuất nguyên vật liệu bị từ chối là: " . $p->countphieuTC() . " phiếu";', 'query', 1, 0, '2024-05-23 14:39:40'),
(971, 'nguyên vật liệu', 'admin@gmail.com', 'echo "Số lượng yêu cầu xuất nguyên vật liệu chưa duyệt là: " .$p->countphieuCD() ." phiếu";', 'query', 1, 0, '2024-05-23 14:39:40'),
(972, 'nguyên vật liệu', 'admin@gmail.com', 'echo "Số lượng nguyên vật liệu tồn kho là: " . $p->countNVLton();', 'query', 1, 0, '2024-05-23 14:39:40'),
(973, 'nguyên vật liệu', 'admin@gmail.com', 'Bạn muốn xem tổng phiếu xuất nguyên vật liệu, đã duyệt, bị từ chối hay chưa duyệt?', 'text', 1, 0, '2024-05-23 14:39:40'),
(974, 'nguyên vật liệu', 'admin@gmail.com', 'echo "Số lượng yêu cầu xuất nguyên vật liệu: " . $p->countYCXNVL();', 'query', 1, 0, '2024-05-23 14:39:40'),
(975, 'nguyên vật liệu', 'admin@gmail.com', 'echo "số lượng phiếu xuất nguyên vật liệu hiện tại là: " . $p->countPXNVL();', 'query', 1, 0, '2024-05-23 14:39:40'),
(976, 'nguyên vật liệu', 'admin@gmail.com', ' echo "Tôi không rõ yêu cầu của bạn, tôi có thể cho bạn biết số lượng nguyên vật liệu trong kho hiện tại. Số lượng nguyên vật liệu là: " . $p->countNVl();', 'query', 1, 0, '2024-05-23 14:39:40'),
(977, 'số lượng nguyên vật liệu', 'admin@gmail.com', 'echo "Số lượng nguyên vật liệu là: " . $p->countNVl();', 'query', 1, 0, '2024-05-23 14:40:04'),
(978, 'số lượng nguyên vật liệu', 'admin@gmail.com', 'echo "Số lượng nguyên vật liệu tồn kho là: " . $p->countNVLton();', 'query', 1, 0, '2024-05-23 14:40:04'),
(979, 'khod2', 'admin@gmail.com', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-05-23 14:40:12'),
(980, 'd2warehouse', 'admin@gmail.com', 'D2Warehouse là đơn vị kho sản xuất và cung cấp các sản phẩm từ đậu nành, với nguyên vật liệu chính là đậu nành và sản phẩm thành phẩm bao gồm bã đậu nành và dầu đậu nành. Để đảm bảo chất lượng sản phẩm và đáp ứng nhu cầu của khách hàng, hệ thống quản lý kho được xây dựng bởi Lê Hạnh Hải Đăng và Bùi Thục Đoan.', 'text', 1, 0, '2024-05-23 14:40:17'),
(981, 'd2warehouse', 'admin@gmail.com', 'kho d2warehouse được thành lập vào tháng 12 năm 2023', '', 1, 0, '2024-05-23 14:40:17'),
(982, 'd2warehouse', 'admin@gmail.com', 'echo "d2warehouse có: " . $p->countKho(). " kho"; ', 'query', 1, 0, '2024-05-23 14:40:17'),
(983, 'd2warehouse', 'admin@gmail.com', 'D2Warehouse là đơn vị kho sản xuất và cung cấp các sản phẩm từ đậu nành, với nguyên vật liệu chính là đậu nành và sản phẩm thành phẩm bao gồm bã đậu nành và dầu đậu nành. Để đảm bảo chất lượng sản phẩm và đáp ứng nhu cầu của khách hàng, hệ thống quản lý kho được xây dựng bởi Lê Hạnh Hải Đăng và Bùi Thục Đoan.', 'text', 1, 0, '2024-05-25 14:29:03'),
(984, 'd2warehouse', 'admin@gmail.com', 'kho d2warehouse được thành lập vào tháng 12 năm 2023', '', 1, 0, '2024-05-25 14:29:03'),
(985, 'd2warehouse', 'admin@gmail.com', 'echo "d2warehouse có: " . $p->countKho(). " kho"; ', 'query', 1, 0, '2024-05-25 14:29:03'),
(986, 'd2warehouse', 'admin@gmail.com', 'D2Warehouse là đơn vị kho sản xuất và cung cấp các sản phẩm từ đậu nành, với nguyên vật liệu chính là đậu nành và sản phẩm thành phẩm bao gồm bã đậu nành và dầu đậu nành. Để đảm bảo chất lượng sản phẩm và đáp ứng nhu cầu của khách hàng, hệ thống quản lý kho được xây dựng bởi Lê Hạnh Hải Đăng và Bùi Thục Đoan.', 'text', 1, 0, '2024-05-25 14:29:41'),
(987, 'd2warehouse', 'admin@gmail.com', 'kho d2warehouse được thành lập vào tháng 12 năm 2023', '', 1, 0, '2024-05-25 14:29:41'),
(988, 'd2warehouse', 'admin@gmail.com', 'echo "d2warehouse có: " . $p->countKho(). " kho"; ', 'query', 1, 0, '2024-05-25 14:29:41'),
(989, '', 'admin@gmail.com', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-05-25 14:30:39'),
(990, 'd2warehouese là gì', 'admin@gmail.com', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-05-25 14:30:48'),
(991, 'd2warehouse là gì', 'admin@gmail.com', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-05-25 14:30:56'),
(992, 'd2warehouse ở đâu', 'admin@gmail.com', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-05-25 14:31:10'),
(993, 'd2warehouse có bao nhiêu kho', 'admin@gmail.com', 'echo "d2warehouse có: " . $p->countKho(). " kho"; ', 'query', 1, 0, '2024-05-25 14:31:17'),
(994, 'bảo mật thông tin', 'admin@gmail.com', 'Tài khoản nhân viên được sử dụng mật khẩu mạnh.\r\nNhân viên phải đảm bảo không cho người khác vào tài khoản của mình.\r\nĐào tạo nhân viên về cách sử dụng thông tin an toàn. \r\n', 'text', 1, 0, '2024-05-25 14:31:36'),
(995, 'nhân viên kho', 'admin@gmail.com', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-05-25 14:31:50'),
(996, 'kho d2', 'admin@gmail.com', 'D2Warehouse là đơn vị kho sản xuất và cung cấp các sản phẩm từ đậu nành, với nguyên vật liệu chính là đậu nành và sản phẩm thành phẩm bao gồm bã đậu nành và dầu đậu nành. Để đảm bảo chất lượng sản phẩm và đáp ứng nhu cầu của khách hàng, hệ thống quản lý kho được xây dựng bởi Lê Hạnh Hải Đăng và Bùi Thục Đoan.', 'text', 1, 0, '2024-05-25 14:31:55'),
(997, 'kho d2', 'admin@gmail.com', 'Kho d2 được xây dựng trong khuôn viên trường Đại học Công Nghiệp thành phố Hồ Chí Minh', 'text', 1, 0, '2024-05-25 14:31:55'),
(998, 'kho nguyên vật liệu', 'admin@gmail.com', 'echo "d2warehouse có: " . $p->countKhonvl() . " kho nguyên vật liệu";', 'query', 1, 0, '2024-05-25 14:32:34'),
(999, 'thành phẩm', 'admin@gmail.com', 'echo "số lượng phiếu nhập thành phẩm hiện tại là: " . $p->countPNTP();', 'query', 1, 0, '2024-05-25 14:32:40'),
(1000, 'thành phẩm', 'admin@gmail.com', 'echo "số lượng phiếu xuất thành phẩm hiện tại là: " . $p->countPXTP();', 'query', 1, 0, '2024-05-25 14:32:40'),
(1001, 'thành phẩm', 'admin@gmail.com', 'Sau khi hoàn thành việc sản xuất, quản lý kho sẽ điều phối xuất thành phẩm theo các đơn hàng ', 'text', 1, 0, '2024-05-25 14:32:40'),
(1002, 'thành phẩm', 'admin@gmail.com', 'echo "d2warehouse có: " . $p->countKhotp() ." Kho thành phẩm";', 'query', 1, 0, '2024-05-25 14:32:40'),
(1003, 'thành phẩm', 'admin@gmail.com', 'echo "Số lượng thành phẩm là: " . $p->countTP();', 'query', 1, 0, '2024-05-25 14:32:40'),
(1004, 'thành phẩm', 'admin@gmail.com', 'Trước khi nhập kho thành phẩm nhân viên kho phải đảm bảo thành phẩm sản xuất ra đúng chuẩn cả về bao bì và chất lượng.\r\nThành phẩm bị hư trong quá trình lưu trữ, nhân viên kho phải báo cáo cho quản lý kho để tìm ra nguyên nhân của việc hư hỏng và khắc phục.\r\nĐối với các thành phẩm bi lỗi bao bì, nhân viên sẽ trả về khâu đóng gói.\r\n', 'text', 1, 0, '2024-05-25 14:32:40'),
(1005, 'thành phẩm', 'admin@gmail.com', 'Bạn muốn xem số lượng phiếu nhập thành phẩm hay phiếu xuất thành phẩm?', 'text', 1, 0, '2024-05-25 14:32:40'),
(1006, 'thành phẩm', 'admin@gmail.com', 'echo "Số lượng phiếu nhập thành phẩm đã duyệt là: " .$p->countphieuDuyetTP() ." phiếu";', 'query', 1, 0, '2024-05-25 14:32:40'),
(1007, 'thành phẩm', 'admin@gmail.com', 'echo "Số lượng phiếu nhập thành phẩm bị từ chối là: " .$p->countphieuTCTP() ." phiếu";', 'query', 1, 0, '2024-05-25 14:32:40'),
(1008, 'thành phẩm', 'admin@gmail.com', 'echo "Số lượng phiếu nhập thành phẩm chưa duyệt là: " .$p->countphieuCDTP() ." \r\n phiếu";', 'query', 1, 0, '2024-05-25 14:32:40'),
(1009, 'thành phẩm', 'admin@gmail.com', 'echo "Số lượng thành phẩm tồn kho là: " . $p->countTPton();', 'query', 1, 0, '2024-05-25 14:32:40'),
(1010, 'thành phẩm', 'admin@gmail.com', 'echo "Số lượng yêu cầu nhập thành phẩm là: " . $p->countYCNTP();', 'query', 1, 0, '2024-05-25 14:32:40'),
(1011, 'quy trình xuất kho', 'admin@gmail.com', 'Trong trường hợp xuất kho nguyên vật liệu. Phòng kế hoạch sẽ gửi đề xuất cho giám đốc phê duyệt. Sau khi đề xuất được phê duyệt, đề xuất này sẽ được chuyển đến cho quản lý kho. Quản lý kho sẽ dựa vào đề xuất mà tiến hành điều phối cho nhân viên kho thực hiện xuất kho nguyên vật liệu.\r\nTrong trường hợp xuất thành phẩm, quản lý kho sẽ dựa vào đơn hàng mà thực hiện điều phối nhân viên.', 'text', 1, 0, '2024-05-25 14:32:59'),
(1012, 'quy trình nhập kho', 'admin@gmail.com', 'Đầu tiên nhân viên kho sẽ kiểm tra số lượng hàng tồn và báo cáo cho phòng kế hoạch, phòng kế hoạch sẽ đưa ra đề xuất nhập nguyên vật liệu cho giám đốc phê duyệt. Sau khi phê duyệt sẽ có đơn vị đến giao nguyên liệu thô, nhân viên kho tiến hành lập phiếu nhập kho và cập nhật thông tin ', 'text', 1, 0, '2024-05-25 14:33:09'),
(1013, 'giám đốc', 'admin@gmail.com', 'bạn có thể gọi vào số hotline 19001234 để được hỗ trợ', 'text', 1, 0, '2024-05-25 14:33:19'),
(1014, 'quản lý kho', 'admin@gmail.com', 'Đối với các quyền có thể xét duyệt chỉ có tài khoản của giám đốc được phép truy cập.\r\nCác quyền chỉnh sửa tài khoản người dùng chỉ tài khoản admin được phép truy cập.', 'text', 1, 0, '2024-05-25 14:33:27'),
(1015, 'bây giờ là mấy giờ', 'admin@gmail.com', 'echo "bây giờ là ".$child1;', 'query', 1, 0, '2024-05-25 14:33:40'),
(1016, 'số phiếu nhập nguyên vật liệu', 'admin@gmail.com', 'echo "số lượng phiếu nhập nguyên vật liệu hiện tại là: " . $p->countPNNVL();\r\n', 'query', 1, 0, '2024-05-25 14:33:50'),
(1017, 'chi tiết phiếu nhập nugyeen vật liệu', 'admin@gmail.com', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-05-25 14:34:05'),
(1018, 'số lượng nguyên vật liệu trong kho', 'admin@gmail.com', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-05-25 14:34:18'),
(1019, 'd2warehouse do ai thành lập', 'admin@gmail.com', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-05-25 14:34:51'),
(1020, 'd2warehouse là gì', 'admin@gmail.com', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-05-25 14:34:59'),
(1021, 'bạn có thể cho tôi biết số phiếu nguyên vật liệu không', 'admin@gmail.com', 'echo "số lượng phiếu xuất nguyên vật liệu hiện tại là: " . $p->countPXNVL();\r\necho "số lượng phiếu xuất thành phẩm hiện tại là: " . $p->countPXTP();', 'text', 1, 0, '2024-05-25 14:36:22'),
(1022, 'bạn có thể cho tôi biết số phiếu nguyên vật liệu không', 'admin@gmail.com', 'echo "số lượng phiếu xuất nguyên vật liệu hiện tại là: " . $p->countPXNVL();\r\n', 'text', 1, 0, '2024-05-25 14:36:54'),
(1023, 'bạn có thể cho tôi biết số phiếu nguyên vật liệu không', 'admin@gmail.com', 'echo "số lượng phiếu xuất nguyên vật liệu hiện tại là: " . $p->countPXNVL();\r\necho "số lượng phiếu xuất thành phẩm hiện tại là: " . $p->countPXTP();\r\n', 'query', 1, 0, '2024-05-25 14:37:38'),
(1024, 'nhân viên kho', 'admin@gmail.com', 'Nhân viên kho chịu trách nhiệm về toàn bộ các khâu liên quan đến quản lý kho hàng cũng như phần hàng hóa hiện lưu trữ trong kho, từ khâu nhập kho, bảo quản, lưu trữ đến xuất kho sao cho đảm bảo tốt các yêu cầu về mặt số lượng và chất lượng hàng.', 'text', 1, 0, '2024-05-25 14:48:07'),
(1025, 'số lượng nguyên vật liệu', 'admin@gmail.com', 'echo "Số lượng nguyên vật liệu là: " . $p->countNVl();', 'query', 1, 0, '2024-05-25 14:49:37'),
(1026, 'số lượng nguyên vật liệu', 'admin@gmail.com', 'echo "Số lượng nguyên vật liệu tồn kho là: " . $p->countNVLton();', 'query', 1, 0, '2024-05-25 14:49:37'),
(1027, 'số lượng nguyên vật liệu trong kho', 'admin@gmail.com', 'echo "Số lượng nguyên vật liệu tồn kho là: " . $p->countNVLton();', 'query', 1, 0, '2024-05-25 14:50:29'),
(1028, 'số nguyên vật liệu', 'admin@gmail.com', 'echo "Số lượng nguyên vật liệu là: " . $p->countNVl();', 'query', 1, 0, '2024-05-25 14:50:35'),
(1029, 'hello', 'admin@gmail.com', 'Xin chào, tôi la D2Warehousebot, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-05-25 14:50:56'),
(1030, 'tôi muốn hỏi ', 'admin@gmail.com', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-05-25 14:51:11'),
(1031, 'quy trình nhập kho', 'admin@gmail.com', 'Đầu tiên nhân viên kho sẽ kiểm tra số lượng hàng tồn và báo cáo cho phòng kế hoạch, phòng kế hoạch sẽ đưa ra đề xuất nhập nguyên vật liệu cho giám đốc phê duyệt. Sau khi phê duyệt sẽ có đơn vị đến giao nguyên liệu thô, nhân viên kho tiến hành lập phiếu nhập kho và cập nhật thông tin ', 'text', 1, 0, '2024-05-25 14:53:19'),
(1032, 'quy trình xuất kho', 'admin@gmail.com', 'Trong trường hợp xuất kho nguyên vật liệu. Phòng kế hoạch sẽ gửi đề xuất cho giám đốc phê duyệt. Sau khi đề xuất được phê duyệt, đề xuất này sẽ được chuyển đến cho quản lý kho. Quản lý kho sẽ dựa vào đề xuất mà tiến hành điều phối cho nhân viên kho thực hiện xuất kho nguyên vật liệu.\r\nTrong trường hợp xuất thành phẩm, quản lý kho sẽ dựa vào đơn hàng mà thực hiện điều phối nhân viên.', 'text', 1, 0, '2024-05-25 14:53:25'),
(1033, 'nhập kho nguyên vật liệu', 'admin@gmail.com', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 0, '2024-05-25 14:53:37'),
(1034, 'bạn có khỏe không', 'admin@gmail.com', 'tôi khỏe, tôi luôn sẵn sàng trả lời mọi câu hỏi của bạn', 'text', 1, 1, '2024-05-25 14:53:55'),
(1035, 'bạn ăn cơm chưa', 'admin@gmail.com', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 1, '2024-05-25 14:54:04'),
(1036, 'nếu có vấn đề về nguyên vật liệu/thành phẩm trong lúc nhập kho, có thể liên hệ ai', 'admin@gmail.com', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 1, 1, '2024-05-25 14:55:35'),
(1037, 'xin chào', 'admin@gmail.com', 'Xin chào, tôi la D2Warehousebot, tôi có thể giúp gì cho bạn', 'text', 1, 1, '2024-05-25 18:22:08'),
(1038, 'đây là dữ liệu được  lưu ở d2warehouse', 'admin@gmail.com', 'Xin chào, tôi có thể giúp gì cho bạn', 'text', 0, 1, '2024-05-25 18:22:20');

-- --------------------------------------------------------

--
-- Table structure for table `chat_login_details`
--

CREATE TABLE `chat_login_details` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `last_activity` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `is_typing` enum('no','yes') character set utf8 collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chat_login_details`
--

INSERT INTO `chat_login_details` (`id`, `userid`, `last_activity`, `is_typing`) VALUES
(0, 5, '2024-05-14 10:13:51', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `chat_users`
--

CREATE TABLE `chat_users` (
  `userid` int(11) NOT NULL,
  `username` varchar(255) character set utf8 collate utf8_unicode_ci NOT NULL,
  `email` varchar(100) character set utf8 collate utf8_unicode_ci NOT NULL,
  `password` varchar(255) character set utf8 collate utf8_unicode_ci NOT NULL,
  `avatar` varchar(255) character set utf8 collate utf8_unicode_ci NOT NULL,
  `current_session` int(11) NOT NULL,
  `online` int(11) NOT NULL,
  PRIMARY KEY  (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chat_users`
--

INSERT INTO `chat_users` (`userid`, `username`, `email`, `password`, `avatar`, `current_session`, `online`) VALUES
(1, 'Hải Đăng', 'nvk1@gmail.com', '12345', 'user1.jpg', 5, 0),
(2, 'Quản lý kho 1', 'qlk1@gmail.com', '12345', 'user2.jpg', 5, 0),
(3, 'NVP Kế hoạch 1', 'nvpkh1@gmail.com', '12345', 'user3.jpg', 1, 0),
(4, 'Giám đốc 1', 'gd1@gmail.com', '12345', 'user4.jpg', 5, 0),
(5, 'Admin', 'admin@gmail.com', '12345', 'user5.jpg', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `chitietbbnvl`
--

CREATE TABLE `chitietbbnvl` (
  `maCTBBNVL` int(10) NOT NULL auto_increment,
  `maBBKK` char(10) character set utf8 collate utf8_unicode_ci NOT NULL,
  `maLoNVL` char(10) character set utf8 collate utf8_unicode_ci NOT NULL,
  `ghiChu` text character set utf8 collate utf8_unicode_ci,
  PRIMARY KEY  (`maCTBBNVL`),
  KEY `maBBKK` (`maBBKK`,`maLoNVL`),
  KEY `chitietbbnvl_ibfk_2` (`maLoNVL`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `chitietbbnvl`
--

INSERT INTO `chitietbbnvl` (`maCTBBNVL`, `maBBKK`, `maLoNVL`, `ghiChu`) VALUES
(1, 'BBKKNVL01', 'LNVL02', 'Sắp hết hạn'),
(10, 'BBKKNVL02', 'LNVL19', 'Thiếu 1 gói, còn 99 gói'),
(11, 'BBKKNVL02', 'LNVL24', 'Sai mã lô (LNVL21)');

-- --------------------------------------------------------

--
-- Table structure for table `chitietbbtp`
--

CREATE TABLE `chitietbbtp` (
  `maCTBBTP` int(10) NOT NULL auto_increment,
  `maBBKK` char(10) character set utf8 collate utf8_unicode_ci NOT NULL,
  `maLoTP` char(10) character set utf8 collate utf8_unicode_ci NOT NULL,
  `ghiChu` text character set utf8 collate utf8_unicode_ci,
  PRIMARY KEY  (`maCTBBTP`),
  KEY `maBBKK` (`maBBKK`,`maLoTP`),
  KEY `chitietbbtp_ibfk_2` (`maLoTP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `chitietbbtp`
--


-- --------------------------------------------------------

--
-- Table structure for table `chitietbieumaunhap`
--

CREATE TABLE `chitietbieumaunhap` (
  `maBMNhap` char(10) character set utf8 collate utf8_unicode_ci NOT NULL,
  `maKho` varchar(10) character set utf8 collate utf8_unicode_ci default NULL,
  `tenSanPham` tinytext character set utf8 collate utf8_unicode_ci NOT NULL,
  `donViTinh` tinytext character set utf8 collate utf8_unicode_ci NOT NULL,
  `soLuong` int(11) NOT NULL default '0',
  `ngaySanXuat` date default NULL,
  `ngayHetHan` date default NULL,
  KEY `FK__bieumaunhap` (`maBMNhap`),
  KEY `maKho` (`maKho`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chitietbieumaunhap`
--

INSERT INTO `chitietbieumaunhap` (`maBMNhap`, `maKho`, `tenSanPham`, `donViTinh`, `soLuong`, `ngaySanXuat`, `ngayHetHan`) VALUES
('BMN01', 'KNVL01', 'Đường', 'Gói', 1000, NULL, NULL),
('BMN01', 'KNVL05', 'Ớt bột', 'Gói', 300, NULL, NULL),
('BMN01', 'KNVL06', 'Bơ đậu phộng', 'Hủ', 150, NULL, NULL),
('BMN02', 'KNVL01', 'Đường', 'Gói', 1000, NULL, NULL),
('BMN02', 'KNVL02', 'Muối', 'Gói', 100, NULL, NULL),
('BMN02', 'KNVL03', 'Màu thực vật', 'Chai', 10000, NULL, NULL),
('BMN02', 'KNVL04', 'Trứng gà', 'Vỉ', 200, NULL, NULL),
('BMN02', 'KNVL05', 'Ớt bột', 'Gói', 300, NULL, NULL),
('BMN02', 'KNVL06', 'Mứt dâu', 'Hủ', 1000, NULL, NULL),
('BMN03', 'KNVL01', 'Sữa tươi', 'Gói', 200, NULL, NULL),
('BMN03', 'KNVL02', 'Siro Dâu', 'Chai', 5000, NULL, NULL),
('BMN03', 'KNVL03', 'Chất tạo ngọt', 'Gói', 300, NULL, NULL),
('BMN03', 'KNVL04', 'Bột ', 'Gói', 200, NULL, NULL),
('BMN03', 'KNVL05', 'Chocolate', 'Hộp', 10000, NULL, NULL),
('BMN03', 'KNVL06', 'Bơ đậu phộng', 'Hủ', 150, NULL, NULL),
('BMN04', 'KNVL01', 'Đường', 'Gói', 1000, NULL, NULL),
('BMN04', 'KNVL02', 'Muối', 'Gói', 100, NULL, NULL),
('BMN04', 'KNVL03', 'Màu thực vật', 'Chai', 10000, NULL, NULL),
('BMN04', 'KNVL04', 'Trứng gà', 'Vỉ', 200, NULL, NULL),
('BMN04', 'KNVL05', 'Ớt bột', 'Gói', 300, NULL, NULL),
('BMN04', 'KNVL06', 'Mứt dâu', 'Hủ', 1000, NULL, NULL),
('BMN05', 'KNVL01', 'Đường', 'Gói', 1000, NULL, NULL),
('BMN05', 'KNVL05', 'Ớt bột', 'Gói', 300, NULL, NULL),
('BMN05', 'KNVL06', 'Bơ đậu phộng', 'Hủ', 150, NULL, NULL),
('BMN06', 'KNVL01', 'Sữa tươi', 'Gói', 200, NULL, NULL),
('BMN07', 'KNVL02', 'Muối', 'Gói', 100, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `chitietdonhang`
--

CREATE TABLE `chitietdonhang` (
  `maDonHang` char(10) character set utf8 collate utf8_unicode_ci NOT NULL,
  `maThanhPham` char(10) character set utf8 collate utf8_unicode_ci NOT NULL,
  `soLuong` int(11) NOT NULL,
  UNIQUE KEY `maThanhPham` (`maThanhPham`),
  KEY `maDonHang` (`maDonHang`),
  KEY `maThanhPham_2` (`maThanhPham`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chitietdonhang`
--

INSERT INTO `chitietdonhang` (`maDonHang`, `maThanhPham`, `soLuong`) VALUES
('DH01', 'TP01', 100),
('DH01', 'TP02', 150),
('DH01', 'TP03', 200),
('DH02', 'TP04', 100),
('DH02', 'TP05', 200),
('DH03', 'TP06', 100),
('DH03', 'TP07', 200);

-- --------------------------------------------------------

--
-- Table structure for table `ctkhsx`
--

CREATE TABLE `ctkhsx` (
  `maCTKHSXTP` char(10) collate utf8_unicode_ci NOT NULL,
  `maThanhPham` char(10) collate utf8_unicode_ci NOT NULL,
  `soLuongTP` int(11) NOT NULL,
  `dvtTP` char(10) collate utf8_unicode_ci NOT NULL,
  `maKHSX` char(10) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`maCTKHSXTP`),
  KEY `maThanhPham` (`maThanhPham`),
  KEY `maKHSX` (`maKHSX`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ctkhsx`
--


-- --------------------------------------------------------

--
-- Table structure for table `dexuat`
--

CREATE TABLE `dexuat` (
  `maDeXuat` char(10) collate utf8_unicode_ci NOT NULL,
  `tenDeXuat` char(150) collate utf8_unicode_ci NOT NULL,
  `maNVL` char(10) collate utf8_unicode_ci NOT NULL,
  `soLuong` int(11) NOT NULL,
  `trangThai` char(20) collate utf8_unicode_ci NOT NULL,
  KEY `maNVL` (`maNVL`),
  KEY `maDeXuat` (`maDeXuat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `dexuat`
--

INSERT INTO `dexuat` (`maDeXuat`, `tenDeXuat`, `maNVL`, `soLuong`, `trangThai`) VALUES
('DX01', 'Đề xuất xuất nguyên vật liệu cho sản xuất', 'NVL01', 200, 'Đã điều phối'),
('DX01', 'Đề xuất xuất nguyên vật liệu cho sản xuất', 'NVL02', 1000, 'Đã điều phối'),
('DX01', 'Đề xuất xuất nguyên vật liệu cho sản xuất', 'NVL07', 200, 'Đã điều phối'),
('DX01', 'Đề xuất xuất nguyên vật liệu cho sản xuất', 'NVL08', 200, 'Đã điều phối'),
('DX01', 'Đề xuất xuất nguyên vật liệu cho sản xuất', 'NVL02', 500, 'Đã điều phối'),
('DX01', 'Đề xuất xuất nguyên vật liệu cho sản xuất', 'NVL05', 300, 'Đã điều phối'),
('DX02', 'Đề xuất nhập nguyên vật liệu', 'NVL02', 100, 'Đã điều phối'),
('DX02', 'Đề xuất nhập nguyên vật liệu', 'NVL10', 300, 'Đã điều phối'),
('DX02', 'Đề xuất nhập nguyên vật liệu', 'NVL11', 150, 'Đã điều phối'),
('DX03', 'Đề xuất nhập nguyên vật liệu', 'NVL01', 1111, 'Đã điều phối'),
('DX04', 'Đề xuất xuất nguyên vật liệu cho sản xuất', 'NVL01', 100, 'Đã điều phối'),
('DX04', 'Đề xuất xuất nguyên vật liệu cho sản xuất', 'NVL02', 500, 'Đã điều phối'),
('DX04', 'Đề xuất xuất nguyên vật liệu cho sản xuất', 'NVL07', 100, 'Đã điều phối'),
('DX04', 'Đề xuất xuất nguyên vật liệu cho sản xuất', 'NVL08', 100, 'Đã điều phối'),
('DX05', 'Đề xuất xuất nguyên vật liệu cho sản xuất', 'NVL01', 10, 'Đã điều phối'),
('DX05', 'Đề xuất xuất nguyên vật liệu cho sản xuất', 'NVL02', 50, 'Đã điều phối'),
('DX05', 'Đề xuất xuất nguyên vật liệu cho sản xuất', 'NVL07', 10, 'Đã điều phối'),
('DX05', 'Đề xuất xuất nguyên vật liệu cho sản xuất', 'NVL08', 10, 'Đã điều phối'),
('DX06', 'Đề xuất nhập nguyên vật liệu', 'NVL04', 100, 'Đã điều phối'),
('DX07', 'Đề xuất nhập nguyên vật liệu', 'NVL12', 1000, 'Đã duyệt'),
('DX08', 'Đề xuất xuất nguyên vật liệu cho sản xuất', 'NVL02', 500, 'Đã duyệt'),
('DX08', 'Đề xuất xuất nguyên vật liệu cho sản xuất', 'NVL05', 300, 'Đã duyệt'),
('DX09', 'Đề xuất xuất nguyên vật liệu cho sản xuất', 'NVL01', 111, 'Chờ duyệt'),
('DX09', 'Đề xuất xuất nguyên vật liệu cho sản xuất', 'NVL02', 555, 'Chờ duyệt'),
('DX09', 'Đề xuất xuất nguyên vật liệu cho sản xuất', 'NVL07', 111, 'Chờ duyệt'),
('DX09', 'Đề xuất xuất nguyên vật liệu cho sản xuất', 'NVL08', 111, 'Chờ duyệt'),
('DX10', 'Đề xuất nhập nguyên vật liệu', 'NVL01', 100, 'Chờ duyệt'),
('DX11', 'Đề xuất nhập nguyên vật liệu', 'NVL01', 500, 'Đã duyệt'),
('DX12', 'Đề xuất nhập nguyên vật liệu', 'NVL01', 100, 'Đã duyệt'),
('DX12', 'Đề xuất nhập nguyên vật liệu', 'NVL02', 500, 'Đã duyệt'),
('DX12', 'Đề xuất nhập nguyên vật liệu', 'NVL03', 5000, 'Đã duyệt'),
('DX13', 'Đề xuất xuất nguyên vật liệu cho sản xuất', 'NVL01', 111, 'Đã duyệt'),
('DX13', 'Đề xuất xuất nguyên vật liệu cho sản xuất', 'NVL02', 555, 'Đã duyệt'),
('DX13', 'Đề xuất xuất nguyên vật liệu cho sản xuất', 'NVL07', 111, 'Đã duyệt'),
('DX13', 'Đề xuất xuất nguyên vật liệu cho sản xuất', 'NVL08', 111, 'Đã duyệt'),
('DX13', 'Đề xuất xuất nguyên vật liệu cho sản xuất', 'NVL02', 555, 'Đã duyệt'),
('DX13', 'Đề xuất xuất nguyên vật liệu cho sản xuất', 'NVL05', 333, 'Đã duyệt'),
('DX14', 'Đề xuất nhập nguyên vật liệu', 'NVL01', 10000, 'Đã duyệt'),
('DX14', 'Đề xuất nhập nguyên vật liệu', 'NVL02', 10000, 'Đã duyệt'),
('DX14', 'Đề xuất nhập nguyên vật liệu', 'NVL03', 10000, 'Đã duyệt'),
('DX14', 'Đề xuất nhập nguyên vật liệu', 'NVL04', 10000, 'Đã duyệt'),
('DX14', 'Đề xuất nhập nguyên vật liệu', 'NVL05', 10000, 'Đã duyệt'),
('DX14', 'Đề xuất nhập nguyên vật liệu', 'NVL06', 10000, 'Đã duyệt'),
('DX14', 'Đề xuất nhập nguyên vật liệu', 'NVL07', 10000, 'Đã duyệt'),
('DX14', 'Đề xuất nhập nguyên vật liệu', 'NVL08', 10000, 'Đã duyệt'),
('DX14', 'Đề xuất nhập nguyên vật liệu', 'NVL09', 10000, 'Đã duyệt'),
('DX14', 'Đề xuất nhập nguyên vật liệu', 'NVL10', 10000, 'Đã duyệt'),
('DX14', 'Đề xuất nhập nguyên vật liệu', 'NVL11', 10000, 'Đã duyệt'),
('DX14', 'Đề xuất nhập nguyên vật liệu', 'NVL12', 10000, 'Đã duyệt'),
('DX15', 'Đề xuất nhập nguyên vật liệu', 'NVL01', 10000, 'Đã duyệt'),
('DX15', 'Đề xuất nhập nguyên vật liệu', 'NVL03', 10000, 'Đã duyệt'),
('DX15', 'Đề xuất nhập nguyên vật liệu', 'NVL05', 10000, 'Đã duyệt'),
('DX15', 'Đề xuất nhập nguyên vật liệu', 'NVL07', 10000, 'Đã duyệt'),
('DX15', 'Đề xuất nhập nguyên vật liệu', 'NVL09', 10000, 'Đã duyệt'),
('DX15', 'Đề xuất nhập nguyên vật liệu', 'NVL11', 10000, 'Đã duyệt'),
('DX16', 'Đề xuất nhập nguyên vật liệu', 'NVL02', 10000, 'Đã duyệt'),
('DX16', 'Đề xuất nhập nguyên vật liệu', 'NVL04', 10000, 'Đã duyệt'),
('DX16', 'Đề xuất nhập nguyên vật liệu', 'NVL06', 10000, 'Đã duyệt'),
('DX16', 'Đề xuất nhập nguyên vật liệu', 'NVL08', 10000, 'Đã duyệt'),
('DX16', 'Đề xuất nhập nguyên vật liệu', 'NVL10', 10000, 'Đã duyệt'),
('DX16', 'Đề xuất nhập nguyên vật liệu', 'NVL12', 10000, 'Đã duyệt'),
('DX17', 'Đề xuất nhập nguyên vật liệu', 'NVL01', 100, 'Chờ duyệt'),
('DX18', 'Đề xuất nhập nguyên vật liệu', 'NVL01', 123, 'Chờ duyệt'),
('DX19', 'Đề xuất nhập nguyên vật liệu', 'NVL01', 111, 'Chờ duyệt'),
('DX20', 'Đề xuất nhập nguyên vật liệu', 'NVL01', 1234, 'Chờ duyệt'),
('DX21', 'Đề xuất nhập nguyên vật liệu', 'NVL01', 123, 'Chờ duyệt'),
('DX21', 'Đề xuất nhập nguyên vật liệu', 'NVL02', 123, 'Chờ duyệt'),
('DX22', 'Đề xuất nhập nguyên vật liệu', 'NVL01', 123, 'Chờ duyệt'),
('DX22', 'Đề xuất nhập nguyên vật liệu', 'NVL02', 123, 'Chờ duyệt'),
('DX23', 'Đề xuất nhập nguyên vật liệu', 'NVL01', 123, 'Chờ duyệt'),
('DX23', 'Đề xuất nhập nguyên vật liệu', 'NVL02', 123, 'Chờ duyệt'),
('DX24', 'Đề xuất xuất nguyên vật liệu cho sản xuất', 'NVL07', 123, 'Đã duyệt'),
('DX24', 'Đề xuất xuất nguyên vật liệu cho sản xuất', 'NVL08', 123, 'Đã duyệt'),
('DX24', 'Đề xuất xuất nguyên vật liệu cho sản xuất', 'NVL02', 246, 'Đã duyệt'),
('DX24', 'Đề xuất xuất nguyên vật liệu cho sản xuất', 'NVL04', 123, 'Đã duyệt'),
('DX25', 'Đề xuất xuất nguyên vật liệu cho sản xuất', 'NVL07', 20, 'Đã duyệt'),
('DX25', 'Đề xuất xuất nguyên vật liệu cho sản xuất', 'NVL08', 20, 'Đã duyệt'),
('DX25', 'Đề xuất xuất nguyên vật liệu cho sản xuất', 'NVL02', 100, 'Đã duyệt'),
('DX25', 'Đề xuất xuất nguyên vật liệu cho sản xuất', 'NVL04', 50, 'Đã duyệt'),
('DX26', 'Đề xuất nhập nguyên vật liệu', 'NVL01', 1234, 'Chờ duyệt');

-- --------------------------------------------------------

--
-- Table structure for table `dinhmucnvl`
--

CREATE TABLE `dinhmucnvl` (
  `maThanhPham` char(10) character set utf8 collate utf8_unicode_ci NOT NULL,
  `maNguyenVatLieu` char(10) character set utf8 collate utf8_unicode_ci NOT NULL,
  `soLuong` int(10) NOT NULL,
  KEY `maThanhPham` (`maThanhPham`,`maNguyenVatLieu`),
  KEY `maNguyenVatLieu` (`maNguyenVatLieu`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dinhmucnvl`
--

INSERT INTO `dinhmucnvl` (`maThanhPham`, `maNguyenVatLieu`, `soLuong`) VALUES
('TP01', 'NVL07', 1),
('TP01', 'NVL08', 1),
('TP02', 'NVL02', 2),
('TP02', 'NVL04', 1),
('TP03', 'NVL07', 1),
('TP03', 'NVL08', 1),
('TP03', 'NVL09', 1),
('TP04', 'NVL07', 1),
('TP04', 'NVL08', 2),
('TP05', 'NVL01', 2),
('TP05', 'NVL05', 1),
('TP06', 'NVL02', 1),
('TP06', 'NVL01', 2),
('TP06', 'NVL05', 2),
('TP07', 'NVL07', 1),
('TP07', 'NVL08', 2),
('TP07', 'NVL02', 2);

-- --------------------------------------------------------

--
-- Table structure for table `donhang`
--

CREATE TABLE `donhang` (
  `maDonHang` char(10) character set utf8 collate utf8_unicode_ci NOT NULL,
  `ngayDatHang` date NOT NULL,
  `tenKhachHang` char(50) character set utf8 collate utf8_unicode_ci NOT NULL,
  `ngayGiaoDuKien` date NOT NULL,
  `soDienThoai` char(30) character set utf8 collate utf8_unicode_ci NOT NULL,
  `diaChiGiaoHang` char(80) character set utf8 collate utf8_unicode_ci NOT NULL,
  `trangThai` char(50) character set utf8 collate utf8_unicode_ci NOT NULL default 'Chưa hoàn thành',
  PRIMARY KEY  (`maDonHang`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `donhang`
--

INSERT INTO `donhang` (`maDonHang`, `ngayDatHang`, `tenKhachHang`, `ngayGiaoDuKien`, `soDienThoai`, `diaChiGiaoHang`, `trangThai`) VALUES
('DH01', '2023-11-05', 'Dinh Huu Khang', '2023-12-31', '0123456789', '12 nguyen van bao go vap', 'Chưa hoàn thành'),
('DH02', '2023-11-05', 'Bui Nguyen Phuong Duyen', '2023-12-31', '0123456789', '78 huynh khuong an', 'Đã hoàn thành'),
('DH03', '2023-11-05', 'Tuyet Hoa Nguyen', '2023-11-30', '0123456789', '78 huynh khuong an', 'Đang lên kế hoạch'),
('DH04', '2023-11-05', 'Thien Hao Dang', '2023-12-31', '0123456789', '78 le loi go vap', ''),
('DH05', '2023-11-05', 'Nguyen Dang Duong', '2023-11-30', '0123456789', '78 huynh khuong an gv', ''),
('DH06', '2023-11-05', 'Hai Dang Le', '2023-11-30', '0123456789', '72 le loi go vap tphcm', '');

-- --------------------------------------------------------

--
-- Table structure for table `kehoachsx`
--

CREATE TABLE `kehoachsx` (
  `maKeHoachSX` char(10) collate utf8_unicode_ci NOT NULL,
  `ngayBatDau` date NOT NULL,
  `ngayKetThuc` date NOT NULL,
  `ngayLap` date NOT NULL,
  `tenKeHoachSX` text collate utf8_unicode_ci NOT NULL,
  `tinhTrang` varchar(10) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`maKeHoachSX`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `kehoachsx`
--

INSERT INTO `kehoachsx` (`maKeHoachSX`, `ngayBatDau`, `ngayKetThuc`, `ngayLap`, `tenKeHoachSX`, `tinhTrang`) VALUES
('KHSX01', '2023-09-29', '2023-10-10', '2023-09-29', 'Kế hoạch sản xuất 01', ''),
('KHSX02', '2023-10-01', '2023-10-10', '2023-09-30', 'Kế hoạch sản xuất 02', ''),
('KHSX03', '2023-10-01', '2023-10-12', '2023-10-01', 'Kế hoạch sản xuất 03', ''),
('KHSX04', '2023-09-20', '2023-10-05', '2023-09-19', 'Kế hoạch sản xuất 04', ''),
('KHSX05', '2023-09-28', '2023-10-05', '2023-09-28', 'Kế hoạch sản xuất 05', ''),
('KHSX06', '2023-10-01', '2023-11-18', '2023-10-30', 'Kế hoạch sản xuất 06', '');

-- --------------------------------------------------------

--
-- Table structure for table `kho`
--

CREATE TABLE `kho` (
  `maKho` char(10) character set utf8 collate utf8_unicode_ci NOT NULL,
  `maNVKho` char(10) character set utf8 collate utf8_unicode_ci NOT NULL,
  `tenKho` text character set utf8 collate utf8_unicode_ci NOT NULL,
  `diaChiKho` text character set utf8 collate utf8_unicode_ci NOT NULL,
  `dungLuongKhoToiDa` int(11) default NULL,
  `tinhTrangKho` text character set utf8 collate utf8_unicode_ci,
  `soLuongKe` int(11) default NULL,
  PRIMARY KEY  (`maKho`),
  KEY `maNVKho` (`maNVKho`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kho`
--

INSERT INTO `kho` (`maKho`, `maNVKho`, `tenKho`, `diaChiKho`, `dungLuongKhoToiDa`, `tinhTrangKho`, `soLuongKe`) VALUES
('KNVL01', 'NVK01', 'Kho Nguyên Vật Liệu 01', 'Phường 15, Gò Vấp', 500, 'Hoạt động', 10),
('KNVL02', 'NVK01', 'Kho Nguyên Vật Liệu 02', 'Phường 15, Gò Vấp', 500, 'Hoạt động', 10),
('KNVL03', 'NVK01', 'Kho Nguyên Vật Liệu 03', 'Phường 15, Gò Vấp', 500, 'Hoạt động', 10),
('KNVL04', 'NVK01', 'Kho Nguyên Vật Liệu 04', 'Phường 15, Gò Vấp', 500, 'Hoạt động', 10),
('KNVL05', 'NVK02', 'Kho Nguyên Vật Liệu 05', 'Phường 15, Gò Vấp', 500, 'Hoạt động', 10),
('KNVL06', 'NVK02', 'Kho Nguyên Vật Liệu 06', 'Phường 15, Gò Vấp', 500, 'Hoạt động', 10),
('KTP01', 'NVK02', 'Kho Thành Phẩm 01', 'Phường 15, Gò Vấp', 500, 'Hoạt động', 10),
('KTP02', 'NVK03', 'Kho Thành Phẩm 02', 'Phường 15, Gò Vấp', 500, 'Hoạt động', 10),
('KTP03', 'NVK03', 'Kho Thành Phẩm 03', 'Phường 15, Gò Vấp', 500, 'Hoạt động', 10),
('KTP04', 'NVK03', 'Kho Thành Phẩm 04', 'Phường 15, Gò Vấp', 500, 'Hoạt động', 10);

-- --------------------------------------------------------

--
-- Table structure for table `longuyenvatlieu`
--

CREATE TABLE `longuyenvatlieu` (
  `maLoNVL` char(10) collate utf8_unicode_ci NOT NULL,
  `maNguyenVatLieu` char(10) collate utf8_unicode_ci NOT NULL,
  `maBMNhap` char(10) collate utf8_unicode_ci default NULL,
  `maPNNVL` char(10) collate utf8_unicode_ci default NULL,
  `maPXNVL` char(10) collate utf8_unicode_ci default NULL,
  `soLuong` int(11) default NULL,
  `NSX` date NOT NULL,
  `NHH` date NOT NULL,
  `maKho` char(10) collate utf8_unicode_ci default NULL,
  `maBMXuat` char(10) collate utf8_unicode_ci default NULL,
  `maPhieuYCXNVL` char(10) collate utf8_unicode_ci default NULL,
  `maKeHoachSX` char(10) collate utf8_unicode_ci default NULL,
  `ghiChu` text collate utf8_unicode_ci,
  PRIMARY KEY  (`maLoNVL`),
  KEY `maNguyenVatLieu` (`maNguyenVatLieu`),
  KEY `maPNNVL` (`maPNNVL`),
  KEY `maPXNVL` (`maPXNVL`),
  KEY `FK_longuyenvatlieu_bieumaunhap` (`maBMNhap`),
  KEY `FK_longuyenvatlieu_bieumauxuat` (`maBMXuat`),
  KEY `maKeHoachSX` (`maKeHoachSX`),
  KEY `maKho` (`maKho`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `longuyenvatlieu`
--

INSERT INTO `longuyenvatlieu` (`maLoNVL`, `maNguyenVatLieu`, `maBMNhap`, `maPNNVL`, `maPXNVL`, `soLuong`, `NSX`, `NHH`, `maKho`, `maBMXuat`, `maPhieuYCXNVL`, `maKeHoachSX`, `ghiChu`) VALUES
('LNVL01', 'NVL02', 'BMN01', 'PNNVL18', 'PXNVL07', 1000, '2024-05-17', '2024-06-05', 'KNVL01', 'BMX06', NULL, NULL, NULL),
('LNVL02', 'NVL10', 'BMN01', 'PNNVL18', NULL, 300, '2024-05-07', '2024-06-07', 'KNVL01', NULL, NULL, NULL, NULL),
('LNVL03', 'NVL11', 'BMN01', 'PNNVL18', NULL, 150, '2024-05-06', '2024-06-09', 'KNVL01', NULL, NULL, NULL, NULL),
('LNVL04', 'NVL02', 'BMN01', 'PNNVL19', NULL, 1000, '2024-05-28', '2024-06-07', 'KNVL01', 'BMX03', NULL, NULL, NULL),
('LNVL05', 'NVL10', 'BMN01', 'PNNVL19', NULL, 300, '2024-05-14', '2024-06-06', 'KNVL01', NULL, NULL, NULL, NULL),
('LNVL06', 'NVL11', 'BMN01', 'PNNVL19', NULL, 150, '2024-05-07', '2024-06-06', 'KNVL01', NULL, NULL, NULL, NULL),
('LNVL07', 'NVL02', 'BMN02', 'PNNVL20', NULL, 1000, '2024-05-06', '2024-05-28', 'KNVL01', NULL, NULL, NULL, NULL),
('LNVL08', 'NVL04', 'BMN02', 'PNNVL20', NULL, 100, '2024-05-06', '2024-05-27', 'KNVL01', NULL, NULL, NULL, NULL),
('LNVL09', 'NVL06', 'BMN02', 'PNNVL20', NULL, 10000, '2024-05-06', '2024-05-28', 'KNVL01', NULL, NULL, NULL, NULL),
('LNVL10', 'NVL08', 'BMN02', 'PNNVL20', 'PXNVL07', 200, '2024-05-06', '2024-05-28', 'KNVL01', 'BMX06', NULL, NULL, NULL),
('LNVL11', 'NVL10', 'BMN02', 'PNNVL20', NULL, 300, '2024-05-06', '2024-05-28', 'KNVL01', NULL, NULL, NULL, NULL),
('LNVL12', 'NVL12', 'BMN02', 'PNNVL20', NULL, 1000, '2024-05-06', '2024-05-28', 'KNVL01', NULL, NULL, NULL, NULL),
('LNVL13', 'NVL01', 'BMN03', 'PNNVL21', 'PXNVL07', 200, '2024-05-06', '2024-05-30', 'KNVL01', 'BMX06', NULL, NULL, NULL),
('LNVL14', 'NVL03', 'BMN03', 'PNNVL21', NULL, 5000, '2024-05-06', '2024-05-30', 'KNVL01', NULL, NULL, NULL, NULL),
('LNVL15', 'NVL05', 'BMN03', 'PNNVL21', 'PXNVL04', 300, '2024-05-06', '2024-05-30', 'KNVL01', 'BMX04', NULL, NULL, NULL),
('LNVL16', 'NVL07', 'BMN03', 'PNNVL21', 'PXNVL07', 200, '2024-05-06', '2024-05-30', 'KNVL01', 'BMX06', NULL, NULL, NULL),
('LNVL17', 'NVL09', 'BMN03', 'PNNVL21', NULL, 10000, '2024-05-06', '2024-05-30', 'KNVL01', NULL, NULL, NULL, NULL),
('LNVL18', 'NVL11', 'BMN03', 'PNNVL21', NULL, 150, '2024-05-06', '2024-05-30', 'KNVL01', NULL, NULL, NULL, NULL),
('LNVL19', 'NVL02', 'BMN04', 'PNNVL22', NULL, 1000, '2024-05-06', '2024-05-30', 'KNVL01', NULL, NULL, NULL, NULL),
('LNVL20', 'NVL04', 'BMN04', 'PNNVL22', NULL, 100, '2024-05-06', '2024-05-30', 'KNVL01', 'BMX03', NULL, NULL, NULL),
('LNVL21', 'NVL06', 'BMN04', 'PNNVL22', NULL, 10000, '2024-05-06', '2024-05-30', 'KNVL01', NULL, NULL, NULL, NULL),
('LNVL22', 'NVL08', 'BMN04', 'PNNVL22', NULL, 200, '2024-05-06', '2024-05-30', 'KNVL01', NULL, NULL, NULL, NULL),
('LNVL23', 'NVL10', 'BMN04', 'PNNVL22', NULL, 300, '2024-05-06', '2024-05-30', 'KNVL01', NULL, NULL, NULL, NULL),
('LNVL24', 'NVL12', 'BMN04', 'PNNVL22', NULL, 1000, '2024-05-06', '2024-05-30', 'KNVL01', NULL, NULL, NULL, NULL),
('LNVL25', 'NVL01', 'BMN06', 'PNNVL23', NULL, 200, '2024-05-25', '2024-06-05', 'KNVL01', NULL, NULL, NULL, NULL),
('LNVL26', 'NVL01', 'BMN06', 'PNNVL24', NULL, 200, '2024-05-25', '2024-06-09', 'KNVL01', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `lothanhpham`
--

CREATE TABLE `lothanhpham` (
  `maLoTP` char(10) collate utf8_unicode_ci NOT NULL,
  `maThanhPham` char(10) collate utf8_unicode_ci NOT NULL,
  `maBMNhap` char(10) collate utf8_unicode_ci default NULL,
  `maPNTP` char(10) collate utf8_unicode_ci default NULL,
  `maPXTP` char(10) collate utf8_unicode_ci default NULL,
  `soLuong` int(11) default NULL,
  `NSX` date NOT NULL,
  `NHH` date NOT NULL,
  `maBMXuat` char(10) collate utf8_unicode_ci default NULL,
  `maPhieuYCXTP` char(10) collate utf8_unicode_ci default NULL,
  `maPhieuYCNTP` char(10) collate utf8_unicode_ci default NULL,
  `maKeHoachSX` char(10) collate utf8_unicode_ci default NULL,
  `ghiChu` varchar(200) collate utf8_unicode_ci default NULL,
  `maDonHang` char(10) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`maLoTP`),
  KEY `maPNTP` (`maPNTP`),
  KEY `maPXTP` (`maPXTP`),
  KEY `maThanhPham` (`maThanhPham`),
  KEY `FK_lothanhpham_bieumaunhap` (`maBMNhap`),
  KEY `FK_lothanhpham_bieumauxuat` (`maBMXuat`),
  KEY `maPhieuYCNTP` (`maPhieuYCNTP`),
  KEY `maKeHoachSX` (`maKeHoachSX`),
  KEY `maDonHang` (`maDonHang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `lothanhpham`
--


-- --------------------------------------------------------

--
-- Table structure for table `nguyenvatlieu`
--

CREATE TABLE `nguyenvatlieu` (
  `maNguyenVatLieu` char(10) character set utf8 collate utf8_unicode_ci NOT NULL,
  `tenNguyenVatLieu` text character set utf8 collate utf8_unicode_ci NOT NULL,
  `donViTinh` char(10) character set utf8 collate utf8_unicode_ci NOT NULL,
  `soLuongTonnvl` int(11) default NULL,
  `anh` varchar(200) character set utf8 collate utf8_unicode_ci NOT NULL,
  `soLuongDonMua` int(11) NOT NULL,
  `status` int(11) NOT NULL default '1',
  PRIMARY KEY  (`maNguyenVatLieu`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nguyenvatlieu`
--

INSERT INTO `nguyenvatlieu` (`maNguyenVatLieu`, `tenNguyenVatLieu`, `donViTinh`, `soLuongTonnvl`, `anh`, `soLuongDonMua`, `status`) VALUES
('NVL01', 'Sữa tươi', 'Gói', 21000, 'suatuoi.jpg', 0, 1),
('NVL02', 'Đường', 'Gói', 22000, 'duong.jpg', 0, 1),
('NVL03', 'Siro Dâu', 'Chai', 25000, 'sirodau.jpg', 0, 1),
('NVL04', 'Muối', 'Gói', 20200, 'duong.jpg', 0, 1),
('NVL05', 'Chất tạo ngọt', 'Gói', 19400, 'chattaongot.jpg', 0, 1),
('NVL06', 'Màu thực vật', 'Chai', 40000, 'mauthucvat.jpg', 0, 1),
('NVL07', 'Bột ', 'Gói', 19600, 'bot.jpg', 0, 1),
('NVL08', 'Trứng gà', 'Vỉ', 19800, 'trungga.jpg', 0, 1),
('NVL09', 'Chocolate', 'Hộp', 30000, 'chocolate.jpg', 0, 1),
('NVL10', 'Ớt bột', 'Gói', 21500, 'otbot.jpg', 0, 1),
('NVL11', 'Bơ đậu phộng', 'Hủ', 20600, 'bodauphong.jpg', 0, 1),
('NVL12', 'Mứt dâu', 'Hủ', 23000, 'mutdau.jpg', 0, 1),
('NVL13', '1231', '23123', NULL, '', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `nhanvienkho`
--

CREATE TABLE `nhanvienkho` (
  `maNhanVien` char(10) character set utf8 collate utf8_unicode_ci NOT NULL,
  `tenNVKho` text character set utf8 collate utf8_unicode_ci NOT NULL,
  `sDT` char(12) character set utf8 collate utf8_unicode_ci NOT NULL,
  `eMail` char(50) character set utf8 collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`maNhanVien`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nhanvienkho`
--

INSERT INTO `nhanvienkho` (`maNhanVien`, `tenNVKho`, `sDT`, `eMail`) VALUES
('NVK01', 'Bùi Thục Đoan', '0338459237', 'thucdoan@gmail.com'),
('NVK02', 'Lê Hạnh Hải Đăng', '0833109609', 'lehanhhaidang@gmail.com'),
('NVK03', 'Lê Hải Long', '0123456789', 'abc@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `nhanvienkiemke`
--

CREATE TABLE `nhanvienkiemke` (
  `maNVKK` char(10) character set utf8 collate utf8_unicode_ci NOT NULL,
  `maKho` char(10) character set utf8 collate utf8_unicode_ci NOT NULL,
  `tenNVKK` text character set utf8 collate utf8_unicode_ci NOT NULL,
  `soDienThoai` char(12) character set utf8 collate utf8_unicode_ci NOT NULL,
  `eMail` char(50) character set utf8 collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`maNVKK`),
  KEY `maKho` (`maKho`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nhanvienkiemke`
--

INSERT INTO `nhanvienkiemke` (`maNVKK`, `maKho`, `tenNVKK`, `soDienThoai`, `eMail`) VALUES
('NVKK01', 'KNVL01', 'Bùi Nguyễn Phương Duyên', '0373046136', 'bnpd@gmail.com'),
('NVKK02', 'KNVL02', 'Nguyễn Thị An', '0956479561', 'an@gmail.com'),
('NVKK03', 'KNVL03', 'Lê Phương Ân', '0365987431', 'ann@gmail.com'),
('NVKK04', 'KNVL04', 'Lê Thanh Hà', '0989479941', 'ha@gmail.com'),
('NVKK05', 'KNVL05', 'Phan Thị Linh', '0374987131', 'linh@gmail.com'),
('NVKK06', 'KNVL06', 'Phạm Nguyễn Như', '0985179933', 'nhu@gmail.com'),
('NVKK07', 'KTP01', 'Nguyễn Tấn Đạt', '0372283331', 'dat@gmail.com'),
('NVKK08', 'KTP02', 'Hà Thanh Mai', '0989977745', 'mai@gmail.com'),
('NVKK09', 'KTP03', 'Lê Thị B', '0375583771', 'bb@gmail.com'),
('NVKK10', 'KTP04', 'Bùi Thị Hương', '0387496851', 'huong@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `phieunnvl`
--

CREATE TABLE `phieunnvl` (
  `maPNNVL` char(10) character set utf8 collate utf8_unicode_ci NOT NULL,
  `maDeXuat` varchar(10) character set utf8 collate utf8_unicode_ci default NULL,
  `maKho` char(10) character set utf8 collate utf8_unicode_ci default NULL,
  `maNVKho` char(10) character set utf8 collate utf8_unicode_ci NOT NULL,
  `tenNguoiGiao` text character set utf8 collate utf8_unicode_ci NOT NULL,
  `ngayNhap` date NOT NULL,
  `ngayLap` date NOT NULL,
  PRIMARY KEY  (`maPNNVL`),
  KEY `maNVKho` (`maNVKho`),
  KEY `maKho` (`maKho`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `phieunnvl`
--

INSERT INTO `phieunnvl` (`maPNNVL`, `maDeXuat`, `maKho`, `maNVKho`, `tenNguoiGiao`, `ngayNhap`, `ngayLap`) VALUES
('PNNVL01', NULL, 'KNVL01', 'NVK01', 'Lê Anh Nuôi', '2024-01-01', '2024-05-05'),
('PNNVL02', NULL, 'KNVL02', 'NVK01', 'Bùi Thục Đoan', '2024-01-01', '2024-05-05'),
('PNNVL03', NULL, 'KNVL03', 'NVK01', 'Lê Hải Đăng', '2024-01-01', '2024-05-05'),
('PNNVL04', NULL, 'KNVL04', 'NVK01', 'Lê Anh Nuôi', '2024-01-01', '2024-05-05'),
('PNNVL05', NULL, 'KNVL05', 'NVK02', 'Lê Hải Đăng', '2024-01-01', '2024-05-05'),
('PNNVL06', NULL, 'KNVL06', 'NVK02', 'Lê Hải Đăng', '2024-01-01', '2024-05-05'),
('PNNVL07', NULL, 'KNVL01', 'NVK01', 'ABC', '2024-01-01', '2024-05-05'),
('PNNVL08', NULL, 'KNVL01', 'NVK01', 'Lê Anh Nuôi', '2024-01-01', '2024-05-05'),
('PNNVL09', NULL, 'KNVL02', 'NVK01', 'Bùi Thục Đoan', '2024-01-01', '2024-05-05'),
('PNNVL10', NULL, 'KNVL03', 'NVK01', 'Lê Hải Đăng', '2024-01-01', '2024-05-05'),
('PNNVL11', NULL, 'KNVL04', 'NVK01', 'Lê Anh Nuôi', '2024-01-01', '2024-05-05'),
('PNNVL12', NULL, 'KNVL05', 'NVK02', 'Lê Hải Đăng', '2024-01-01', '2024-05-05'),
('PNNVL13', NULL, 'KNVL06', 'NVK02', 'Lê Hải Đăng', '2024-01-01', '2024-05-05'),
('PNNVL14', NULL, 'KNVL06', 'NVK02', 'dddd', '2024-05-05', '2024-05-05'),
('PNNVL15', NULL, 'KNVL01', 'NVK01', 'Lê Anh Nuôi', '2024-01-01', '2024-05-05'),
('PNNVL16', NULL, 'KNVL01', 'NVK01', 'Lê Anh Nuôi', '2024-01-01', '2024-05-05'),
('PNNVL17', NULL, 'KNVL01', 'NVK01', 'Lê Anh Nuôi', '2024-01-01', '2024-05-05'),
('PNNVL18', NULL, 'KNVL01', 'NVK01', 'Lê Hạnh Hải Đăng', '2024-05-06', '2024-05-06'),
('PNNVL19', NULL, 'KNVL01', 'NVK01', 'Lê Hạnh Hải Đăng', '2024-05-06', '2024-05-07'),
('PNNVL20', NULL, 'KNVL01', 'NVK01', 'Lê Hạnh Hải Đăng', '2024-05-06', '2024-05-06'),
('PNNVL21', NULL, 'KNVL01', 'NVK01', 'Lê Hạnh Hải Đăng', '2024-05-06', '2024-05-06'),
('PNNVL22', NULL, 'KNVL01', 'NVK01', 'Lê Hạnh Hải Đăng', '2024-05-06', '2024-05-06'),
('PNNVL23', NULL, 'KNVL01', 'NVK01', 'Lê Hạnh Hải Đăng', '2024-05-24', '2024-05-25'),
('PNNVL24', NULL, 'KNVL01', 'NVK01', 'Lê Hạnh Hải Đăng', '2024-05-24', '2024-05-25');

-- --------------------------------------------------------

--
-- Table structure for table `phieuntp`
--

CREATE TABLE `phieuntp` (
  `maPNTP` char(10) character set utf8 collate utf8_unicode_ci NOT NULL,
  `maKho` char(10) character set utf8 collate utf8_unicode_ci default NULL,
  `maNVKho` char(10) character set utf8 collate utf8_unicode_ci NOT NULL,
  `tenNguoiGiao` text character set utf8 collate utf8_unicode_ci NOT NULL,
  `ngayNhap` date NOT NULL,
  `ngayLap` date NOT NULL,
  PRIMARY KEY  (`maPNTP`),
  KEY `maNVKho` (`maNVKho`),
  KEY `maKho` (`maKho`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `phieuntp`
--

INSERT INTO `phieuntp` (`maPNTP`, `maKho`, `maNVKho`, `tenNguoiGiao`, `ngayNhap`, `ngayLap`) VALUES
('PNTP01', 'KNVL05', 'NVK02', 'Nguyễn Đăng Dương', '2023-10-10', '2024-04-14');

-- --------------------------------------------------------

--
-- Table structure for table `phieuxnvl`
--

CREATE TABLE `phieuxnvl` (
  `maPXNVL` char(10) character set utf8 collate utf8_unicode_ci NOT NULL,
  `maKho` char(10) character set utf8 collate utf8_unicode_ci default NULL,
  `maNVKho` char(10) character set utf8 collate utf8_unicode_ci NOT NULL,
  `tenNguoiNhan` text character set utf8 collate utf8_unicode_ci NOT NULL,
  `ngayXuat` date NOT NULL,
  `ngayLap` date NOT NULL,
  PRIMARY KEY  (`maPXNVL`),
  KEY `maNVKho` (`maNVKho`),
  KEY `maKho` (`maKho`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `phieuxnvl`
--

INSERT INTO `phieuxnvl` (`maPXNVL`, `maKho`, `maNVKho`, `tenNguoiNhan`, `ngayXuat`, `ngayLap`) VALUES
('PXNVL01', 'KNVL01', 'NVK01', 'Đinh Hữu Khang', '2023-09-30', '2024-04-14'),
('PXNVL02', '', '', 'hải đăng', '2024-05-06', '2024-05-06'),
('PXNVL03', 'KNVL01', '', 'hải đăng', '2024-05-06', '2024-05-06'),
('PXNVL04', 'KNVL01', '', '121212', '2024-05-24', '2024-05-25'),
('PXNVL05', '', '', 'hải đăng', '2024-05-21', '2024-05-25'),
('PXNVL06', '', '', 'hải đăng', '2024-05-21', '2024-05-25'),
('PXNVL07', 'KNVL01', '', 'hải đăng', '2024-05-24', '2024-05-25');

-- --------------------------------------------------------

--
-- Table structure for table `phieuxtp`
--

CREATE TABLE `phieuxtp` (
  `maPXTP` char(10) character set utf8 collate utf8_unicode_ci NOT NULL,
  `maKho` char(10) character set utf8 collate utf8_unicode_ci default NULL,
  `maNVKho` char(10) character set utf8 collate utf8_unicode_ci NOT NULL,
  `tenNguoiNhan` text character set utf8 collate utf8_unicode_ci NOT NULL,
  `ngayXuat` date NOT NULL,
  `ngayLap` date NOT NULL,
  PRIMARY KEY  (`maPXTP`),
  KEY `maNVKho` (`maNVKho`),
  KEY `maKho` (`maKho`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `phieuxtp`
--

INSERT INTO `phieuxtp` (`maPXTP`, `maKho`, `maNVKho`, `tenNguoiNhan`, `ngayXuat`, `ngayLap`) VALUES
('PXTP01', 'KTP02', 'NVK02', 'Đinh Hữu Khang', '2023-11-30', '2024-04-14');

-- --------------------------------------------------------

--
-- Table structure for table `phieuycntp`
--

CREATE TABLE `phieuycntp` (
  `maPhieuYCNTP` char(10) collate utf8_unicode_ci NOT NULL,
  `ghiChu` text collate utf8_unicode_ci,
  `tinhTrang` text collate utf8_unicode_ci NOT NULL,
  `ngayYC` date NOT NULL,
  `ngayDuyet` date NOT NULL,
  `tenPhieuYCNTP` text collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`maPhieuYCNTP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `phieuycntp`
--

INSERT INTO `phieuycntp` (`maPhieuYCNTP`, `ghiChu`, `tinhTrang`, `ngayYC`, `ngayDuyet`, `tenPhieuYCNTP`) VALUES
('PYCNTP01', NULL, 'Duyệt', '2023-09-04', '2023-09-05', 'Phiếu yêu cầu nhập thành phẩm 01'),
('PYCNTP02', NULL, 'Duyệt', '2023-09-06', '2023-09-06', 'Phiếu yêu cầu nhập thành phẩm 02'),
('PYCNTP03', NULL, 'Chưa Duyệt', '2023-09-09', '2023-09-09', 'Phiếu yêu cầu nhập thành phẩm 03'),
('PYCNTP04', NULL, 'Chưa Duyệt', '2023-09-17', '2023-09-18', 'Phiếu yêu cầu nhập thành phẩm 04'),
('PYCNTP05', 'Kho đầy', 'Từ chối', '2023-09-19', '2023-09-19', 'Phiếu yêu cầu nhập thành phẩm 05'),
('PYCNTP06', NULL, 'Duyệt', '2023-10-01', '2023-10-01', 'Phiếu yêu cầu nhập thành phẩm 06');

-- --------------------------------------------------------

--
-- Table structure for table `phieuycxnvl`
--

CREATE TABLE `phieuycxnvl` (
  `maYCXNVL` char(10) collate utf8_unicode_ci NOT NULL,
  `ghichu` text collate utf8_unicode_ci,
  `tinhTrang` text collate utf8_unicode_ci NOT NULL,
  `ngayYC` date NOT NULL,
  `ngayDuyet` date NOT NULL,
  `tenPhieuYCXNVL` text collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`maYCXNVL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `phieuycxnvl`
--

INSERT INTO `phieuycxnvl` (`maYCXNVL`, `ghichu`, `tinhTrang`, `ngayYC`, `ngayDuyet`, `tenPhieuYCXNVL`) VALUES
('PYCXNVL01', NULL, 'Duyệt', '2023-10-30', '2023-10-29', 'Phiếu yêu cầu xuất nguyên vật liệu 01'),
('PYCXNVL02', 'Chưa cần', 'Từ chối', '2023-10-01', '2023-10-01', 'Phiếu yêu cầu xuất nguyên vật liệu 02'),
('PYCXNVL03', NULL, 'Duyệt ', '2023-10-01', '2023-10-01', 'Phiếu yêu cầu xuất nguyên vật liệu 03'),
('PYCXNVL04', NULL, 'Chưa Duyệt', '2023-09-20', '2023-09-19', 'Phiếu yêu cầu xuất nguyên vật liệu 04'),
('PYCXNVL05', NULL, 'Chưa Duyệt ', '2023-09-27', '2023-09-27', 'Phiếu yêu cầu xuất nguyên vật liệu 01'),
('PYCXNVL06', NULL, 'Duyệt', '2023-10-01', '2023-10-01', 'Phiếu yêu cầu xuất nguyên vật liệu 02');

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `id` int(9) NOT NULL auto_increment,
  `question` longtext character set utf8 collate utf8_unicode_ci NOT NULL,
  `answer` longtext character set utf8 collate utf8_unicode_ci NOT NULL,
  `action` varchar(255) character set utf8 collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=220 ;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`id`, `question`, `answer`, `action`) VALUES
(6, 'mấy giờ rồi, xem giờ, bây giờ là mấy giờ, what time, what time is it', 'echo "bây giờ là ".$child1;', 'query'),
(7, 'hôm nay là ngày mấy', 'echo $child2;', 'query'),
(8, 'mở google', '<a href="https://google.com" target="blank_">Click vào đây để truy cập google<a/>', 'text'),
(10, 'số lượng phiếu nhập nguyên vật liệu hiện tại, số lượng phiếu nnvl hiện tại, số phiếu nhập nguyên vật liệu hiện tại, số phiếu nhập nnvl hiện tại, số lượng pnnvl hiện tại, số lượng phiếu nhập nguyên vật liệu, số phiếu nhập nguyên vật liệu,  số lượng pnnvl, số lượng phiếu nnvl, số phiếu nhập nvl, số pnnvl, sl phiếu nhập nvl, sl pnnvl, số phiếu nnvl', 'echo "số lượng phiếu nhập nguyên vật liệu hiện tại là: " . $p->countPNNVL();\r\n', 'query'),
(11, 'xuất nguyên vật liệu hiện tại, xuat nguyen vat lieu hien tai, xuất nvl hiện tại, xuat nvl hien tai, phiếu xuất nvl hiện tại, phieu xuat nvl hien tai, phiếu xuất nguyên vật liệu hiện tại, phieu xuat nguyen vat lieu hien tai, xuất nvl hiện tại, xuat nvl hien tai, tổng phiếu xuất nguyên vật liệu, tong phieu xuat nguyen vat lieu, tổng phiếu xuất nvl, tong phieu xuat nvl\r\n', 'echo "số lượng phiếu xuất nguyên vật liệu hiện tại là: " . $p->countPXNVL();', 'query'),
(12, 'số lượng phiếu ntp hiện tại, số phiếu nhập tp hiện tại, số lượng pntp hiện tại, số lượng pntp, số lượng phiếu ntp, số pntp, sl pntp, số phiếu ntp, nhập thành phẩm hiện tại, nhap thanh pham hien tai', 'echo "số lượng phiếu nhập thành phẩm hiện tại là: " . $p->countPNTP();', 'query'),
(13, 'số lượng phiếu xuất thành phẩm hiện tại, số lượng phiếu xtp hiện tại, số phiếu xuất thành phẩm hiện tại, số phiếu xtp hiện tại, số lượng pxtp hiện tại, số lượng phiếu xuất thành phẩm, số phiếu xuất thành phẩm,  số lượng pxtp, số lượng phiếu xtp, số phiếu xuất tp, số pxtp, sl phiếu xuất tp, sl pxtp, số phiếu xtp, số lượng phiếu xuất tp hiện tại, so luong phieu xuat tp hien tai', 'echo "số lượng phiếu xuất thành phẩm hiện tại là: " . $p->countPXTP();', 'query'),
(42, 'a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,x,y,z,v,t,w,ư,u,s,r', 'Hãy cho tôi nội dung cụ thể về một chủ đề nào đó !', 'text'),
(94, '0,1,2,3,4,5,6,7,8,9,~,!,@,#,$,%,^,&,*,(,),-,_,=,+,{,},[,],?,/,\\,|,",'',:,;,<,>,.', 'Hãy cho tôi nội dung cụ thể về một chủ đề nào đó !', 'text'),
(137, 'Xin chào, xin chào, chào, hi, hello, chào bạn', 'Xin chào, tôi la D2Warehousebot, tôi có thể giúp gì cho bạn', 'text'),
(138, 'giúp tôi trả lời một số câu hỏi nhé, cho tôi hỏi một vài câu nhé, tôi muốn hỏi', 'Tôi luôn sẵn sàng trả lời những câu hỏi và yêu cầu của bạn', 'text'),
(139, 'd2warehouse, kho d2, kho d2warehouse', 'D2Warehouse là đơn vị kho sản xuất và cung cấp các sản phẩm từ đậu nành, với nguyên vật liệu chính là đậu nành và sản phẩm thành phẩm bao gồm bã đậu nành và dầu đậu nành. Để đảm bảo chất lượng sản phẩm và đáp ứng nhu cầu của khách hàng, hệ thống quản lý kho được xây dựng bởi Lê Hạnh Hải Đăng và Bùi Thục Đoan.', 'text'),
(142, 'số lượng phiếu nvl, số lượng phiếu nguyên vật liệu, số phiếu nvl', 'Bạn muốn xem phiếu nhập nguyên vật liệu hay phiếu xuất nguyên vật liệu ?', 'text'),
(143, 'kho có địa chỉ ở đâu, địa chỉ của kho ở đâu, địa chỉ kho, dc kho', 'kho d2warehouse có 3 địa chỉ. Kho 1: 4 Nguyễn Văn Bảo, kho 2: 142 Lê Lợi, kho 3: 123 Trần Văn Dư', 'text'),
(144, 'd2warehouse thành lập vào năm nào, năm thành lập kho, kho thành lập khi nào, kho đã hoạt động được bao lâu', 'kho d2warehouse được thành lập vào tháng 12 năm 2023', ''),
(145, 'làm thế nào để liên hệ với ban giám đốc, cách thức liên lạc với ban giám đốc, cách thức liên lạc với bgd, làm thế nào để liên lạc với bgd, làm cách nào để liên lạc với bgd', 'bạn có thể gọi vào số hotline 19001234 để được hỗ trợ', 'text'),
(147, 'quy trình nhập kho, quy trinh nhap kho, quy trình nhập nvl, quy trinh nhap nvl', 'Đầu tiên nhân viên kho sẽ kiểm tra số lượng hàng tồn và báo cáo cho phòng kế hoạch, phòng kế hoạch sẽ đưa ra đề xuất nhập nguyên vật liệu cho giám đốc phê duyệt. Sau khi phê duyệt sẽ có đơn vị đến giao nguyên liệu thô, nhân viên kho tiến hành lập phiếu nhập kho và cập nhật thông tin ', 'text'),
(148, 'quy trình xuất nguyên vật liệu, quy trình xnvl, quy trình xuất nvl, quy trinh xuat nguyen vat lieu, xuat nvl the nao, xuất nguyên vật liệu thế nào', 'Phòng kế hoạch đưa ra kế hoạch sản xuất cho giám đốc phê duyệt, sau khi được duyệt quản lý kho sẽ điều phối xuất nguyên vật liệu cho nhân viên kho, nhân viên kho sẽ lập biên bản xuất nguyên vật liệu và cập nhật thông tin', 'text'),
(149, 'quy trình xuất thành phẩm, quy trinh xuat thanh pham, quy trình xuất tp, quy trinh xuat tp, xuất tp, xuat tp', 'Sau khi hoàn thành việc sản xuất, quản lý kho sẽ điều phối xuất thành phẩm theo các đơn hàng ', 'text'),
(150, 'số lượng đơn hàng, so don hang, số đơn hàng, so luong don hang', 'echo "Số lượng đơn hàng là:" . $p->countDonhang();', 'query'),
(151, 'ai là người chịu trách nhiệm cho sản phẩm, ai chịu trách nhiệm cho sản phẩm, ai chiu trach nhiem cho san pham, ai la nguoi chiu trach nhiem cho san pham, ai se chiu trach nhiem cho san pham, ai sẽ chịu trách nhiệm cho sản phẩm, ai là người chịu trách nhiệm cho sp, ai la nguoi chiu trach nhiem cho sp, ai chiu trach nhiem cho sp', 'Quản lý kho sẽ là người chịu trách nhiệm cho sản phẩm', 'text'),
(152, 'd2warehouse có bao nhiêu kho, d2warehouse co bao nhieu kho, co bao nhieu kho, có bao nhiêu kho, d2 có bao nhiêu kho, d2 co bao nhieu kho, tổng kho, tong kho, tổng số lượng kho, tong so luong kho', 'echo "d2warehouse có: " . $p->countKho(). " kho"; ', 'query'),
(153, 'kho nguyên vật liệu, kho nguyen vat lieu, số lượng kho nvl, số lượng kho nguyên vật liệu, so luong kho nguyen vat lieu, so luong kho nvl', 'echo "d2warehouse có: " . $p->countKhonvl() . " kho nguyên vật liệu";', 'query'),
(155, 'kho thành phẩm, kho tp, kho thanh pham, so luong kho tp, số lượng kho tp, so luong kho thanh pham, số lượng kho thành phẩm', 'echo "d2warehouse có: " . $p->countKhotp() ." Kho thành phẩm";', 'query'),
(156, 'tổng số lượng nguyên vật liệu, tong so luong nguyen vat lieu, sl nvl, sl nguyên vật liệu, sl nguyen vat lieu, so nguyen vat lieu, số nguyên vật liệu, so luong nvl, số lượng nvl, số nguyên vật liệu, so nguyen vat lieu, so nvl, số nvl, so nguyen vat lieu, tổng số lượng nvl, tong so luong nvl', 'echo "Số lượng nguyên vật liệu là: " . $p->countNVl();', 'query'),
(157, 'số lượng thành phẩm, so luong thanh pham, sl tp, sl thành phẩm, sl thanh pham, so thanh pham, số thành phẩm, số thành phẩm, so thanh pham, số tp, so tp, số lượng tp, so luong tp', 'echo "Số lượng thành phẩm là: " . $p->countTP();', 'query'),
(160, 'giờ làm việc của kho, gio lam viec cua kho, giờ làm việc, gio lam viec', 'kho d2warehouse bắt đầu làm việc vào 8:30 đến 17:30. Ngoài thời gian làm việc vẫn sẽ có nhân viên trực tại kho, trực website 24/24 phòng trường hợp khẩn cấp.', 'text'),
(161, 'nguyên vật liệu còn bao nhiêu ngày nữa đến ngày hết hạn thì được xem là nguyên vật liệu gần hết hạn, nguyen lieu con bao nhieu ngay nua den ngay het han thi duoc xem la nguyen vat lieu gan het han, nvl gần hết hạn, nguyên vật liệu gần hết hạn khi nào, khi nào được xem là nguyên vật liệu gần hết hạn, khi nao nguyen vat lieu duoc xem la gan het han, nvl gan het han, nguyên vật liệu gần hết hạn, sắp hết hạn, nguyên liệu sắp hết hạn, nguyên vật liệu sắp hết hạn, nvl sắp hết hạn', 'Nguyên vật liệu còn 30 ngày nữa sẽ đến ngày hết hạn được xem là nguyên liệu gần hết hạn.', 'text'),
(162, 'có hỗ trợ vận chuyển hàng hóa hay không, co ho tro van chuyen hang hoa hay khong, hỗ trợ vận chuyển, ho tro van chuyen, vận chuyển, van chuyen, giao hàng, giao hang, ', 'Sau khi tiếp nhận đơn hàng, d2warehouse sẽ bố trí nhân viên giao hàng đến tận nơi.', 'text'),
(163, 'sức chứa tối đa của kho, suc chua toi da cua kho, sức chứa, suc chua, sức chứa tối đa, suc chua toi da', 'Mỗi kho của d2warehouse có sức chứa tối đa 20 tấn nguyên vật liệu/thành phẩm.', 'text'),
(164, 'điều kiện bảo quản, dieu kien bao quan, nhiệt độ, nhiet do, độ ẩm, do am, nhiệt độ để bảo quản nguyên vật liệu, nhiet do de bao quan nguyen vat lieu, nhiệt độ để bảo quản nvl, nhiet do de bao quan nvl, bảo quản tránh hư hại, bao quan tranh hu hai, điều kiện bảo quản của kho, dieu kien bao quan cua kho', 'Đối với kho nguyên liệu: nhiệt độ duy trì ở mức 25 độ, độ ẩm từ 40% đến 60%.\r\nĐối với kho thành phẩm: nhiệt độ duy trì ở mức 20 độ, độ ẩm từ 40% đến 60%\r\nTất cả hàng hóa đều phải tránh ánh nắng trực tiếp, hàng hóa phải ở nơi cao ráo.', 'text'),
(165, 'biện pháp phòng ngừa hư hỏng/thất lạc hàng hóa, bien phap phong ngua hu hong/that lac hang hoa, biện pháp phòng ngừa hư hỏng thất lạc hàng hóa, bien phap phong ngua hu hong that lac hang hoa, biện pháp ngăn ngừa hư hỏng hàng hóa, bien phap ngan ngua hu hong hang hoa, biện pháp ngăn ngừa thất lạc hàng hóa, bien phap ngan ngua that lac hang hoa, tránh hư hỏng, tránh thất lạc, tranh hu hong, tranh that lac, tránh hư hỏng thất lạc, trang hu hong that lac, mất hàng hóa, mat hang hoa', 'Để tránh hư hỏng hàng hóa: kho luôn giữ nhiệt độ và độ ẩm ở mức cho phép, đặt hàng hóa ở nôi cao ráo, tránh ánh nắng trực tiếp. \r\nĐể tránh thất lạc hàng hóa: khi nguyên liệu thành phẩm nhập kho sẽ được lưu trữ thông tin trên hệ thống nên việc tìm kiếm sẽ dễ dàng hơn', 'text'),
(166, 'hư hỏng nguyên vật liệu, hu hong nguyen vat lieu, biện pháp xử lý khi bị hư hỏng nguyên vật liệu, bien phap xu ly khi bi hu hong nguyen vat lieu, nguyên vật liệu bị hư, nguyen vat lieu bi hu, nvl bị hư, nvl bi hu', 'Trước khi nguyên vật liệu được nhập kho, nhân viên kho phải đảm bảo không bị hư hỏng, ngày hết hạn còn xa.\r\nNguyên liệu bị hư trong quá trình lưu trữ, nhân viên kho phải báo cáo cho quản lý kho để tìm ra nguyên nhân của việc hư hỏng và khắc phục.', 'text'),
(167, 'hư hỏng thành phẩm, hu hong thanh pham, biện pháp xử lý khi bị hư hỏng thành phẩm, bien phap xu ly khi bi hu hong thanh pham, thành phẩm bị hư, thanh pham bi hu, tp bị hư, tp bi hu, thành phẩm bị lỗi, thanh pham bi loi, tp bị lỗi, tp bi loi', 'Trước khi nhập kho thành phẩm nhân viên kho phải đảm bảo thành phẩm sản xuất ra đúng chuẩn cả về bao bì và chất lượng.\r\nThành phẩm bị hư trong quá trình lưu trữ, nhân viên kho phải báo cáo cho quản lý kho để tìm ra nguyên nhân của việc hư hỏng và khắc phục.\r\nĐối với các thành phẩm bi lỗi bao bì, nhân viên sẽ trả về khâu đóng gói.\r\n', 'text'),
(168, 'phòng chống cháy nổ, kho có trang bị bình chữa cháy không, phong chong chay no, kho co trang bi binh chua chay khong, hỏa hoạn, hoa hoan, chữa cháy, chua chay, phòng cháy chữa cháy, phong chay chua chay, phòng cháy, phong chay, cháy nổ, chay no', 'Mỗi kho của d2warehouse trang bị hệ thống báo cháy hiện đại và 10 bình chữa cháy.', 'text'),
(169, 'ai có quyền truy cập vào hệ thống quản lý kho, ai có quyen truy cap vao he thong quan ly kho, ai có quyền truy cập vào hệ thống quản lý, ai có quyền truy cập vào hệ thống quản lý kho, hệ thống quản lý, he thong quan ly, quyền truy cập, quyen truy cap, quyền truy cập hệ thống ql, quyen truy cap he thong ql', 'Đối với các quyền có thể xét duyệt chỉ có tài khoản của giám đốc được phép truy cập.\r\nCác quyền chỉnh sửa tài khoản người dùng chỉ tài khoản admin được phép truy cập.', 'text'),
(170, 'kho có dịch vụ hỗ trợ 24/24 không, kho co dich vu ho tro 24/24 khong, hỗ trợ 24/24, ho tro 24/24, chăm sóc khách hàng, cham soc khach hang, cham soc khach hang 24/24, chăm sóc khách hàng 24/24, ', 'Kho có đội ngũ nhân viên túc trực để hỗ trợ khách hàng 24/24', 'text'),
(172, 'các quy định của kho, cac quy dinh cua kho, quy định, quy dinh, đồng phục nhân viên, dong phuc nhan vien, đồng phục, dong phuc,bảo hộ, bao ho, quần áo bảo hộ, quan ao bao ho', 'Nhân viên làm việc tại kho phải mặc đồng phục của d2warehouse, đầu tóc được bới gọn. \r\nCấm hút thuốc, đốt lửa, sử dụng các thiết bị dễ gây cháy nổ trong kho.\r\nSử dụng các thiết bị điện, máy móc đúng quy định, đảm bảo an toàn.\r\nMang theo các trang thiết bị bảo hộ lao động khi làm việc trong kho.\r\nTuân thủ các quy định về phòng cháy chữa cháy.\r\nKhông tụ tập, đùa nghịch trong kho.\r\nBáo cáo ngay cho quản lý kho khi phát hiện các tình huống nguy hiểm.', 'text'),
(173, 'bảo mật thông tin, bao mat thông tin, thông tin khách hàng, thong tin khach hang, thông tin nhân viên, thong tin nhan vien, bảo mật, bao mat, hệ thống bảo mật của kho, he thong bao mat cua kho', 'Tài khoản nhân viên được sử dụng mật khẩu mạnh.\r\nNhân viên phải đảm bảo không cho người khác vào tài khoản của mình.\r\nĐào tạo nhân viên về cách sử dụng thông tin an toàn. \r\n', 'text'),
(174, 'yêu cầu xuất nguyên vật liệu đã duyệt, yeu cau xuat nguyen vat lieu da duyet, yêu cầu xuất nvl đã duyệt, yeu cau xuat nvl da duyet, yc xuất nguyên vật liệu đã duyệt, yc xuat nguyen vat lieu da duyet, yc xuất nvl đã duyệt, yc xuat nvl da duyet', 'echo "Số lượng yêu cầu xuất nguyên vật liệu đã duyệt là: " . $p->countphieuDuyet() ." phiếu";', 'query'),
(175, 'yêu cầu xuất nguyên vật liệu bị từ chối, yeu cau xuat nguyen vat lieu bi tu choi, yêu cầu xuất nvl bị từ chối, yeu cau xuat nvl bi tu choi, yc xuất nvl bị từ chối, yc xuat nvl bi tu choi\r\n', 'echo "Số lượng yêu cầu xuất nguyên vật liệu bị từ chối là: " . $p->countphieuTC() . " phiếu";', 'query'),
(176, 'so luong kho, số lượng kho, sl kho', 'Bạn muốn biết tổng số lượng kho, kho thành phẩm hay kho nguyên vật liệu?', 'text'),
(178, 'yêu cầu xuất nguyên vật liệu chưa duyệt, yeu cau xuat nguyen vat lieu chua duyet, yêu cầu xuất nvl chưa duyệt, yeu cau xuat nvl chua duyet, yc xuất nvl chưa duyệt, yc xuat nvl chua duyet\r\n', 'echo "Số lượng yêu cầu xuất nguyên vật liệu chưa duyệt là: " .$p->countphieuCD() ." phiếu";', 'query'),
(179, 'số lượng phiếu tp, số lượng phiếu thành phẩm, số phiếu tp', 'Bạn muốn xem số lượng phiếu nhập thành phẩm hay phiếu xuất thành phẩm?', 'text'),
(180, 'yêu cầu nhập thành phẩm đã duyệt, yeu cau nhap thanh pham da duyet, yêu cầu nhập tp đã duyệt, yeu cau nhap tp da duyet', 'echo "Số lượng phiếu nhập thành phẩm đã duyệt là: " .$p->countphieuDuyetTP() ." phiếu";', 'query'),
(181, 'tu choi nhap thanh pham, từ chối nhập tp , tu choi nhap tp, từ chối ntp, tu choi ntp, nhập tp bị từ chối, nhap tp bi tu choi, nhập thành phẩm bị từ chối, nhap thanh pham bi tu choi, yeu cau nhap thanh pham bi tu choi, yeu cau nhap tp bi tu choi, yêu cầu nhập tp bị từ chối, yeu cau nhap thanh pham bi tu choi, yeu cau nhap tp bi tu choi\r\n', 'echo "Số lượng phiếu nhập thành phẩm bị từ chối là: " .$p->countphieuTCTP() ." phiếu";', 'query'),
(182, 'chưa duyệt nhập tp, chua duyet nhap thanh pham, chua duyet nhap tp, chua duyet ntp, chưa duyệt ntp, nhập thành phẩm chưa duyệt, nhap thanh pham chua duyet, nhập tp chưa duyệt, nhap tp chua duyet, yêu cầu nhập thành phẩm chưa duyệt, yeu cau nhap thanh pham chua duyet, yêu cầu nhập tp chưa duyệt, yeu cau nhap tp chua duyet', 'echo "Số lượng phiếu nhập thành phẩm chưa duyệt là: " .$p->countphieuCDTP() ." \r\n phiếu";', 'query'),
(183, 'số lượng kế hoạch sản xuất hiện tại, so luong ke hoach san xuat hien tai, sl kế hoạch sản xuất, sl ke hoach san xuat, so luong ke hoach sx, số lượng kế hoạch sx, số lượng khsx, so luong khsx', 'echo "Số lượng kế hoạch sản xuất hiện tại là: " .$p->countKHSX();', 'query'),
(184, 'số lượng biên bản kiểm kê, so luong bien ban kiem ke, số lượng bbkk, so luong bbkk, sl biên bản kiểm kê, sl bien ban kiem ke, sl bbkk ', 'echo "Số lượng biên bản kiểm kê là: " . $p->countBBKK();', 'query'),
(185, 'số lượng nguyên vật liệu tồn kho, so luong nguyen vat lieu ton kho, sl nguyên vật liệu tồn kho, sl nguyen vat lieu ton kho, sl nvl tồn kho, sl nvl ton kho, số lượng nvl tồn kho, so luong nvl ton kho, nguyên vật liệu tồn kho, nguyen vat lieu ton kho, nguyên vật liệu tồn, nguyen vat lieu ton, nvl tồn kho nvl tồn, nvl ton kho ', 'echo "Số lượng nguyên vật liệu tồn kho là: " . $p->countNVLton();', 'query'),
(186, 'số lượng thành phẩm tồn kho, so luong thanh pham ton kho, sl thành phẩm tồn kho, sl thanh pham ton kho, sl tp tồn kho, sl tp ton kho, số lượng tp tồn kho, so luong tp ton kho, thành phẩm tồn kho, thanh pham ton kho, thành phẩm tồn, thanh pham ton, tp tồn kho, tp tồn, tp ton kho ', 'echo "Số lượng thành phẩm tồn kho là: " . $p->countTPton();', 'query'),
(187, 'phieu xuat nguyen vat lieu, phiếu xuất nguyên vật liệu, phiếu xuất nvl, phieu xuat nvl', 'Bạn muốn xem tổng phiếu xuất nguyên vật liệu, đã duyệt, bị từ chối hay chưa duyệt?', 'text'),
(189, 'yêu cầu nhập thành phẩm hiện tại, yeu cau nhap thanh pham hien , yêu cầu nhập tp, yeu cau nhap tp, yc nhập thành phẩm, yc nhap thanh pham, yêu cầu ntp, yeu cau ntp, yêu cầu nhập tp hiện tại, yeu cau nhap tp hien tai', 'echo "Số lượng yêu cầu nhập thành phẩm là: " . $p->countYCNTP();', 'query'),
(190, 'yêu cầu xuất nguyên vật liệu, yeu cau xuat nguyen vat lieu, yêu cầu xuất nvl, yeu cau xuat nvl, yc xuất nguyên vật liệu, yc xuat nguyen vat lieu, yc xuất nvl, yc xuat nvl', 'echo "Số lượng yêu cầu xuất nguyên vật liệu: " . $p->countYCXNVL();', 'query'),
(199, 'kho d2 nằm ở đâu', 'Kho d2 được xây dựng trong khuôn viên trường Đại học Công Nghiệp thành phố Hồ Chí Minh', 'text'),
(200, 'số phiếu xuất nguyên vật liệu', 'echo "số lượng phiếu xuất nguyên vật liệu hiện tại là: " . $p->countPXNVL();', 'query'),
(204, 'quy trình xuất nhập kho', 'Bạn muốn biết cụ thể về quy trình xuất kho hay nhập kho', 'text'),
(205, 'quy trình xuất kho', 'Trong trường hợp xuất kho nguyên vật liệu. Phòng kế hoạch sẽ gửi đề xuất cho giám đốc phê duyệt. Sau khi đề xuất được phê duyệt, đề xuất này sẽ được chuyển đến cho quản lý kho. Quản lý kho sẽ dựa vào đề xuất mà tiến hành điều phối cho nhân viên kho thực hiện xuất kho nguyên vật liệu.\r\nTrong trường hợp xuất thành phẩm, quản lý kho sẽ dựa vào đơn hàng mà thực hiện điều phối nhân viên.', 'text'),
(206, 'bạn có khỏe không', 'tôi khỏe, tôi luôn sẵn sàng trả lời mọi câu hỏi của bạn', 'text'),
(207, 'số phiếu nguyên vật liệu', ' echo "Tôi không rõ yêu cầu của bạn, tôi có thể cho bạn biết số lượng nguyên vật liệu trong kho hiện tại. Số lượng nguyên vật liệu là: " . $p->countNVl();', 'query'),
(208, 'bạn có thể cho tôi biết số phiếu nguyên vật liệu không', 'echo "số lượng phiếu xuất nguyên vật liệu hiện tại là: " . $p->countPXNVL();\r\necho "số lượng phiếu xuất thành phẩm hiện tại là: " . $p->countPXTP();\r\n', 'query'),
(209, 'khod2', 'D2Warehouse là đơn vị kho sản xuất và cung cấp các sản phẩm từ đậu nành, với nguyên vật liệu chính là đậu nành và sản phẩm thành phẩm bao gồm bã đậu nành và dầu đậu nành. Để đảm bảo chất lượng sản phẩm và đáp ứng nhu cầu của khách hàng, hệ thống quản lý kho được xây dựng bởi Lê Hạnh Hải Đăng và Bùi Thục Đoan.', 'text'),
(210, 'd2warehouese là gì', 'D2Warehouse là đơn vị kho sản xuất và cung cấp các sản phẩm từ đậu nành, với nguyên vật liệu chính là đậu nành và sản phẩm thành phẩm bao gồm bã đậu nành và dầu đậu nành. Để đảm bảo chất lượng sản phẩm và đáp ứng nhu cầu của khách hàng, hệ thống quản lý kho được xây dựng bởi Lê Hạnh Hải Đăng và Bùi Thục Đoan.', 'text'),
(211, 'd2warehouse là gì', 'D2Warehouse là đơn vị kho sản xuất và cung cấp các sản phẩm từ đậu nành, với nguyên vật liệu chính là đậu nành và sản phẩm thành phẩm bao gồm bã đậu nành và dầu đậu nành. Để đảm bảo chất lượng sản phẩm và đáp ứng nhu cầu của khách hàng, hệ thống quản lý kho được xây dựng bởi Lê Hạnh Hải Đăng và Bùi Thục Đoan.', 'text'),
(212, 'nhân viên kho', 'Nhân viên kho chịu trách nhiệm về toàn bộ các khâu liên quan đến quản lý kho hàng cũng như phần hàng hóa hiện lưu trữ trong kho, từ khâu nhập kho, bảo quản, lưu trữ đến xuất kho sao cho đảm bảo tốt các yêu cầu về mặt số lượng và chất lượng hàng.', 'text'),
(213, 'số lượng nguyên vật liệu trong kho', 'echo "Số lượng nguyên vật liệu tồn kho là: " . $p->countNVLton();', 'query'),
(214, 'd2warehouse do ai thành lập', 'D2warehouse là website quản lý xuất nhập kho do Hải Đăng và Thục Đoan thành lập.', 'text'),
(215, 'd2warehouse là gì', 'D2Warehouse là đơn vị kho sản xuất và cung cấp các sản phẩm từ đậu nành, với nguyên vật liệu chính là đậu nành và sản phẩm thành phẩm bao gồm bã đậu nành và dầu đậu nành. Để đảm bảo chất lượng sản phẩm và đáp ứng nhu cầu của khách hàng, hệ thống quản lý kho được xây dựng bởi Lê Hạnh Hải Đăng và Bùi Thục Đoan.', 'text'),
(216, 'tôi muốn hỏi ', 'Tôi luôn sẵn sàng trả lời câu hỏi của bạn\r\n', 'text'),
(217, 'bạn ăn cơm chưa', 'Tôi là botchat, tôi không thể ăn. Tôi ở đây để trả lời mọi câu hỏi của bạn !', 'text'),
(218, 'nhập kho nguyên vật liệu', 'Đầu tiên nhân viên kho sẽ kiểm tra số lượng hàng tồn và báo cáo cho phòng kế hoạch, phòng kế hoạch sẽ đưa ra đề xuất nhập nguyên vật liệu cho giám đốc phê duyệt. Sau khi phê duyệt sẽ có đơn vị đến giao nguyên liệu thô, nhân viên kho tiến hành lập phiếu nhập kho và cập nhật thông tin ', 'text'),
(219, 'nếu có vấn đề về nguyên vật liệu/thành phẩm trong lúc nhập kho, có thể liên hệ ai', 'nhân viên kho cần báo cáo ngay với quản lý kho', 'text');

-- --------------------------------------------------------

--
-- Table structure for table `taikhoan`
--

CREATE TABLE `taikhoan` (
  `id_acc` int(11) NOT NULL auto_increment,
  `hoten` varchar(255) collate utf8_unicode_ci NOT NULL,
  `email` varchar(255) collate utf8_unicode_ci NOT NULL,
  `matkhau` varchar(255) collate utf8_unicode_ci NOT NULL,
  `dienthoai` char(10) collate utf8_unicode_ci NOT NULL,
  `diachi` varchar(255) collate utf8_unicode_ci default NULL,
  `hinhdaidien` varchar(255) collate utf8_unicode_ci default NULL,
  `role` enum('Admin','nhanvienkho','nhanvienkiemke','quanlykho','giamdoc','nvpkehoach') collate utf8_unicode_ci NOT NULL default 'nhanvienkho',
  `trangthai` enum('hoatdong','khonghoatdong') collate utf8_unicode_ci NOT NULL default 'hoatdong',
  `ngaytao` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id_acc`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `taikhoan`
--

INSERT INTO `taikhoan` (`id_acc`, `hoten`, `email`, `matkhau`, `dienthoai`, `diachi`, `hinhdaidien`, `role`, `trangthai`, `ngaytao`) VALUES
(1, 'Lê Hạnh Hải Đăng', 'nvk1@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', '0833109609', '239/18 Do Thi Loi', NULL, 'nhanvienkho', 'hoatdong', '2024-04-17 03:40:45'),
(2, 'Quản lý kho 1', 'qlk1@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', '', NULL, NULL, 'quanlykho', 'hoatdong', '2024-04-17 03:41:35'),
(3, 'NVP Kế hoạch 1', 'nvpkh1@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', '', NULL, NULL, 'nvpkehoach', 'hoatdong', '2024-04-17 03:41:35'),
(4, 'Giám đốc 1', 'gd1@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', '', NULL, NULL, 'giamdoc', 'hoatdong', '2024-04-17 03:42:00'),
(5, 'Admin ', 'admin@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', '', NULL, NULL, 'Admin', 'hoatdong', '2024-04-17 03:42:18');

-- --------------------------------------------------------

--
-- Table structure for table `thanhpham`
--

CREATE TABLE `thanhpham` (
  `maThanhPham` char(10) character set utf8 collate utf8_unicode_ci NOT NULL,
  `tenThanhPham` text character set utf8 collate utf8_unicode_ci NOT NULL,
  `donViTinh` char(10) character set utf8 collate utf8_unicode_ci NOT NULL,
  `soLuongTon` int(11) default '0',
  `anh` varchar(200) character set utf8 collate utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL default '1',
  PRIMARY KEY  (`maThanhPham`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `thanhpham`
--

INSERT INTO `thanhpham` (`maThanhPham`, `tenThanhPham`, `donViTinh`, `soLuongTon`, `anh`, `status`) VALUES
('TP01', 'Bánh quy', 'Hộp', 300, 'banhquy.jpg', 1),
('TP02', 'Kẹo bốn mùa', 'Gói', 162, 'keobonmua.jpg', 1),
('TP03', 'Bánh Chocopie', 'Gói', 29, 'banhchocopie.jpg', 1),
('TP04', 'Bánh xốp', 'Gói', 12, 'banhxop.jpg', 1),
('TP05', 'Kẹo Sữa', 'Bịt', 850, 'keosua.jpg', 1),
('TP06', 'Kẹo Mút Milkita', 'Bịt', 890, 'keomutmilkita.jpg', 1),
('TP07', 'Bánh trứng tươi', 'Gói', 120, 'banhtrung.jpg', 1),
('TP08', 'Bánh bông lan', 'Hộp', 120, 'banhbonglan.jpg', 1),
('TP09', 'Kẹo dẻo', 'Gói', 600, 'keodeo.jpg', 1),
('TP10', 'Kẹo Chocolate', 'Hộp', 1220, 'keochocolate.jpg', 1),
('TP11', 'Bánh mì tươi', 'Gói', 100, 'banhmituoi.jpg', 1),
('TP12', 'Xúc xích', 'Gói', 100, 'xucxich.jpg', 1),
('TP13', '', '111', 0, 'LC-jpeg-6278-1657847779_1200x0.jpg', 1),
('TP14', '11111', '111', 0, 'fpt-long-chau-2-8164.jpeg', 1),
('TP15', '12122', '121212', 0, '1288181.jpg', 1);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bieumaunhap`
--
ALTER TABLE `bieumaunhap`
  ADD CONSTRAINT `bieumaunhap_ibfk_1` FOREIGN KEY (`maDeXuat`) REFERENCES `dexuat` (`maDeXuat`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bieumauxuat`
--
ALTER TABLE `bieumauxuat`
  ADD CONSTRAINT `FK_bieumauxuat_kho` FOREIGN KEY (`maKho`) REFERENCES `kho` (`maKho`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `chitietbbtp`
--
ALTER TABLE `chitietbbtp`
  ADD CONSTRAINT `chitietbbtp_ibfk_1` FOREIGN KEY (`maBBKK`) REFERENCES `bienbankiemke` (`maBBKK`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `chitietbbtp_ibfk_2` FOREIGN KEY (`maLoTP`) REFERENCES `lothanhpham` (`maLoTP`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `chitietbieumaunhap`
--
ALTER TABLE `chitietbieumaunhap`
  ADD CONSTRAINT `chitietbieumaunhap_ibfk_1` FOREIGN KEY (`maKho`) REFERENCES `kho` (`maKho`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK__bieumaunhap` FOREIGN KEY (`maBMNhap`) REFERENCES `bieumaunhap` (`maBMNhap`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `chitietdonhang`
--
ALTER TABLE `chitietdonhang`
  ADD CONSTRAINT `chitietdonhang_ibfk_1` FOREIGN KEY (`maDonHang`) REFERENCES `chitietdonhang` (`maDonHang`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `chitietdonhang_ibfk_2` FOREIGN KEY (`maThanhPham`) REFERENCES `chitietdonhang` (`maThanhPham`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ctkhsx`
--
ALTER TABLE `ctkhsx`
  ADD CONSTRAINT `ctkhsx_ibfk_1` FOREIGN KEY (`maThanhPham`) REFERENCES `thanhpham` (`maThanhPham`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ctkhsx_ibfk_2` FOREIGN KEY (`maKHSX`) REFERENCES `kehoachsx` (`maKeHoachSX`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `dexuat`
--
ALTER TABLE `dexuat`
  ADD CONSTRAINT `dexuat_ibfk_1` FOREIGN KEY (`maNVL`) REFERENCES `nguyenvatlieu` (`maNguyenVatLieu`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `dinhmucnvl`
--
ALTER TABLE `dinhmucnvl`
  ADD CONSTRAINT `dinhmucnvl_ibfk_1` FOREIGN KEY (`maThanhPham`) REFERENCES `thanhpham` (`maThanhPham`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `dinhmucnvl_ibfk_2` FOREIGN KEY (`maNguyenVatLieu`) REFERENCES `nguyenvatlieu` (`maNguyenVatLieu`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kho`
--
ALTER TABLE `kho`
  ADD CONSTRAINT `kho_ibfk_1` FOREIGN KEY (`maNVKho`) REFERENCES `nhanvienkho` (`maNhanVien`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `longuyenvatlieu`
--
ALTER TABLE `longuyenvatlieu`
  ADD CONSTRAINT `FK_longuyenvatlieu_bieumaunhap` FOREIGN KEY (`maBMNhap`) REFERENCES `bieumaunhap` (`maBMNhap`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_longuyenvatlieu_bieumauxuat` FOREIGN KEY (`maBMXuat`) REFERENCES `bieumauxuat` (`maBMXuat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `longuyenvatlieu_ibfk_1` FOREIGN KEY (`maNguyenVatLieu`) REFERENCES `nguyenvatlieu` (`maNguyenVatLieu`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `longuyenvatlieu_ibfk_3` FOREIGN KEY (`maPXNVL`) REFERENCES `phieuxnvl` (`maPXNVL`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `longuyenvatlieu_ibfk_4` FOREIGN KEY (`maKeHoachSX`) REFERENCES `kehoachsx` (`maKeHoachSX`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `longuyenvatlieu_ibfk_5` FOREIGN KEY (`maKho`) REFERENCES `kho` (`maKho`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lothanhpham`
--
ALTER TABLE `lothanhpham`
  ADD CONSTRAINT `FK_lothanhpham_bieumaunhap` FOREIGN KEY (`maBMNhap`) REFERENCES `bieumaunhap` (`maBMNhap`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_lothanhpham_bieumauxuat` FOREIGN KEY (`maBMXuat`) REFERENCES `bieumauxuat` (`maBMXuat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lothanhpham_ibfk_1` FOREIGN KEY (`maThanhPham`) REFERENCES `thanhpham` (`maThanhPham`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lothanhpham_ibfk_3` FOREIGN KEY (`maPNTP`) REFERENCES `phieuntp` (`maPNTP`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lothanhpham_ibfk_4` FOREIGN KEY (`maPXTP`) REFERENCES `phieuxtp` (`maPXTP`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lothanhpham_ibfk_5` FOREIGN KEY (`maPhieuYCNTP`) REFERENCES `phieuycntp` (`maPhieuYCNTP`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lothanhpham_ibfk_6` FOREIGN KEY (`maKeHoachSX`) REFERENCES `kehoachsx` (`maKeHoachSX`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lothanhpham_ibfk_7` FOREIGN KEY (`maDonHang`) REFERENCES `donhang` (`maDonHang`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `nhanvienkiemke`
--
ALTER TABLE `nhanvienkiemke`
  ADD CONSTRAINT `nhanvienkiemke_ibfk_1` FOREIGN KEY (`maKho`) REFERENCES `kho` (`maKho`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `phieunnvl`
--
ALTER TABLE `phieunnvl`
  ADD CONSTRAINT `phieunnvl_ibfk_1` FOREIGN KEY (`maKho`) REFERENCES `kho` (`maKho`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `phieuntp`
--
ALTER TABLE `phieuntp`
  ADD CONSTRAINT `phieuntp_ibfk_1` FOREIGN KEY (`maKho`) REFERENCES `kho` (`maKho`) ON DELETE CASCADE ON UPDATE CASCADE;
