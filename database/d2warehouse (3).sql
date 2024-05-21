-- phpMyAdmin SQL Dump
-- version 2.11.6
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 21, 2024 at 10:06 PM
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
('BMN04', 'DX16', 'Lê Hạnh Hải Đăng', '2024-05-06', 'Nguyên vật liệu', 'Đã lập phiếu');

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
('BMX02', NULL, NULL, '2024-05-21', 'Nguyên vật liệu', 'hải đăng', 'Chưa lập phiếu');

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
('BMN04', 'KNVL06', 'Mứt dâu', 'Hủ', 1000, NULL, NULL);

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
('DX01', 'Đề xuất xuất nguyên vật liệu cho sản xuất', 'NVL01', 200, 'Đã duyệt'),
('DX01', 'Đề xuất xuất nguyên vật liệu cho sản xuất', 'NVL02', 1000, 'Đã duyệt'),
('DX01', 'Đề xuất xuất nguyên vật liệu cho sản xuất', 'NVL07', 200, 'Đã duyệt'),
('DX01', 'Đề xuất xuất nguyên vật liệu cho sản xuất', 'NVL08', 200, 'Đã duyệt'),
('DX01', 'Đề xuất xuất nguyên vật liệu cho sản xuất', 'NVL02', 500, 'Đã duyệt'),
('DX01', 'Đề xuất xuất nguyên vật liệu cho sản xuất', 'NVL05', 300, 'Đã duyệt'),
('DX02', 'Đề xuất nhập nguyên vật liệu', 'NVL02', 100, 'Đã duyệt'),
('DX02', 'Đề xuất nhập nguyên vật liệu', 'NVL10', 300, 'Đã duyệt'),
('DX02', 'Đề xuất nhập nguyên vật liệu', 'NVL11', 150, 'Đã duyệt'),
('DX03', 'Đề xuất nhập nguyên vật liệu', 'NVL01', 1111, 'Đã duyệt'),
('DX04', 'Đề xuất xuất nguyên vật liệu cho sản xuất', 'NVL01', 100, 'Đã duyệt'),
('DX04', 'Đề xuất xuất nguyên vật liệu cho sản xuất', 'NVL02', 500, 'Đã duyệt'),
('DX04', 'Đề xuất xuất nguyên vật liệu cho sản xuất', 'NVL07', 100, 'Đã duyệt'),
('DX04', 'Đề xuất xuất nguyên vật liệu cho sản xuất', 'NVL08', 100, 'Đã duyệt'),
('DX05', 'Đề xuất xuất nguyên vật liệu cho sản xuất', 'NVL01', 10, 'Đã duyệt'),
('DX05', 'Đề xuất xuất nguyên vật liệu cho sản xuất', 'NVL02', 50, 'Đã duyệt'),
('DX05', 'Đề xuất xuất nguyên vật liệu cho sản xuất', 'NVL07', 10, 'Đã duyệt'),
('DX05', 'Đề xuất xuất nguyên vật liệu cho sản xuất', 'NVL08', 10, 'Đã duyệt'),
('DX06', 'Đề xuất nhập nguyên vật liệu', 'NVL04', 100, 'Đã duyệt'),
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
('DX24', 'Đề xuất xuất nguyên vật liệu cho sản xuất', 'NVL04', 123, 'Đã duyệt');

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
('LNVL01', 'NVL02', 'BMN01', 'PNNVL18', 'PXNVL03', 1000, '2024-05-17', '2024-06-05', 'KNVL01', 'BMX01', NULL, NULL, NULL),
('LNVL02', 'NVL10', 'BMN01', 'PNNVL18', NULL, 300, '2024-05-07', '2024-06-07', 'KNVL01', NULL, NULL, NULL, NULL),
('LNVL03', 'NVL11', 'BMN01', 'PNNVL18', NULL, 150, '2024-05-06', '2024-06-09', 'KNVL01', NULL, NULL, NULL, NULL),
('LNVL04', 'NVL02', 'BMN01', 'PNNVL19', NULL, 1000, '2024-05-28', '2024-06-07', 'KNVL01', 'BMX02', NULL, NULL, NULL),
('LNVL05', 'NVL10', 'BMN01', 'PNNVL19', NULL, 300, '2024-05-14', '2024-06-06', 'KNVL01', NULL, NULL, NULL, NULL),
('LNVL06', 'NVL11', 'BMN01', 'PNNVL19', NULL, 150, '2024-05-07', '2024-06-06', 'KNVL01', NULL, NULL, NULL, NULL),
('LNVL07', 'NVL02', 'BMN02', 'PNNVL20', NULL, 1000, '2024-05-06', '2024-05-28', 'KNVL01', NULL, NULL, NULL, NULL),
('LNVL08', 'NVL04', 'BMN02', 'PNNVL20', NULL, 100, '2024-05-06', '2024-05-27', 'KNVL01', NULL, NULL, NULL, NULL),
('LNVL09', 'NVL06', 'BMN02', 'PNNVL20', NULL, 10000, '2024-05-06', '2024-05-28', 'KNVL01', NULL, NULL, NULL, NULL),
('LNVL10', 'NVL08', 'BMN02', 'PNNVL20', 'PXNVL03', 200, '2024-05-06', '2024-05-28', 'KNVL01', 'BMX02', NULL, NULL, NULL),
('LNVL11', 'NVL10', 'BMN02', 'PNNVL20', NULL, 300, '2024-05-06', '2024-05-28', 'KNVL01', NULL, NULL, NULL, NULL),
('LNVL12', 'NVL12', 'BMN02', 'PNNVL20', NULL, 1000, '2024-05-06', '2024-05-28', 'KNVL01', NULL, NULL, NULL, NULL),
('LNVL13', 'NVL01', 'BMN03', 'PNNVL21', 'PXNVL03', 200, '2024-05-06', '2024-05-30', 'KNVL01', 'BMX01', NULL, NULL, NULL),
('LNVL14', 'NVL03', 'BMN03', 'PNNVL21', NULL, 5000, '2024-05-06', '2024-05-30', 'KNVL01', NULL, NULL, NULL, NULL),
('LNVL15', 'NVL05', 'BMN03', 'PNNVL21', 'PXNVL03', 300, '2024-05-06', '2024-05-30', 'KNVL01', 'BMX01', NULL, NULL, NULL),
('LNVL16', 'NVL07', 'BMN03', 'PNNVL21', 'PXNVL03', 200, '2024-05-06', '2024-05-30', 'KNVL01', 'BMX02', NULL, NULL, NULL),
('LNVL17', 'NVL09', 'BMN03', 'PNNVL21', NULL, 10000, '2024-05-06', '2024-05-30', 'KNVL01', NULL, NULL, NULL, NULL),
('LNVL18', 'NVL11', 'BMN03', 'PNNVL21', NULL, 150, '2024-05-06', '2024-05-30', 'KNVL01', NULL, NULL, NULL, NULL),
('LNVL19', 'NVL02', 'BMN04', 'PNNVL22', NULL, 1000, '2024-05-06', '2024-05-30', 'KNVL01', NULL, NULL, NULL, NULL),
('LNVL20', 'NVL04', 'BMN04', 'PNNVL22', NULL, 100, '2024-05-06', '2024-05-30', 'KNVL01', 'BMX02', NULL, NULL, NULL),
('LNVL21', 'NVL06', 'BMN04', 'PNNVL22', NULL, 10000, '2024-05-06', '2024-05-30', 'KNVL01', NULL, NULL, NULL, NULL),
('LNVL22', 'NVL08', 'BMN04', 'PNNVL22', NULL, 200, '2024-05-06', '2024-05-30', 'KNVL01', NULL, NULL, NULL, NULL),
('LNVL23', 'NVL10', 'BMN04', 'PNNVL22', NULL, 300, '2024-05-06', '2024-05-30', 'KNVL01', NULL, NULL, NULL, NULL),
('LNVL24', 'NVL12', 'BMN04', 'PNNVL22', NULL, 1000, '2024-05-06', '2024-05-30', 'KNVL01', NULL, NULL, NULL, NULL);

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
('NVL01', 'Sữa tươi', 'Gói', 20800, 'suatuoi.jpg', 0, 1),
('NVL02', 'Đường', 'Gói', 23000, 'duong.jpg', 0, 1),
('NVL03', 'Siro Dâu', 'Chai', 25000, 'sirodau.jpg', 0, 1),
('NVL04', 'Muối', 'Gói', 20200, 'duong.jpg', 0, 1),
('NVL05', 'Chất tạo ngọt', 'Gói', 19700, 'chattaongot.jpg', 0, 1),
('NVL06', 'Màu thực vật', 'Chai', 40000, 'mauthucvat.jpg', 0, 1),
('NVL07', 'Bột ', 'Gói', 19800, 'bot.jpg', 0, 1),
('NVL08', 'Trứng gà', 'Vỉ', 20000, 'trungga.jpg', 0, 1),
('NVL09', 'Chocolate', 'Hộp', 30000, 'chocolate.jpg', 0, 1),
('NVL10', 'Ớt bột', 'Gói', 21500, 'otbot.jpg', 0, 1),
('NVL11', 'Bơ đậu phộng', 'Hủ', 20600, 'bodauphong.jpg', 0, 1),
('NVL12', 'Mứt dâu', 'Hủ', 23000, 'mutdau.jpg', 0, 1);

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

INSERT INTO `phieunnvl` (`maPNNVL`, `maKho`, `maNVKho`, `tenNguoiGiao`, `ngayNhap`, `ngayLap`) VALUES
('PNNVL01', 'KNVL01', 'NVK01', 'Lê Anh Nuôi', '2024-01-01', '2024-05-05'),
('PNNVL02', 'KNVL02', 'NVK01', 'Bùi Thục Đoan', '2024-01-01', '2024-05-05'),
('PNNVL03', 'KNVL03', 'NVK01', 'Lê Hải Đăng', '2024-01-01', '2024-05-05'),
('PNNVL04', 'KNVL04', 'NVK01', 'Lê Anh Nuôi', '2024-01-01', '2024-05-05'),
('PNNVL05', 'KNVL05', 'NVK02', 'Lê Hải Đăng', '2024-01-01', '2024-05-05'),
('PNNVL06', 'KNVL06', 'NVK02', 'Lê Hải Đăng', '2024-01-01', '2024-05-05'),
('PNNVL07', 'KNVL01', 'NVK01', 'ABC', '2024-01-01', '2024-05-05'),
('PNNVL08', 'KNVL01', 'NVK01', 'Lê Anh Nuôi', '2024-01-01', '2024-05-05'),
('PNNVL09', 'KNVL02', 'NVK01', 'Bùi Thục Đoan', '2024-01-01', '2024-05-05'),
('PNNVL10', 'KNVL03', 'NVK01', 'Lê Hải Đăng', '2024-01-01', '2024-05-05'),
('PNNVL11', 'KNVL04', 'NVK01', 'Lê Anh Nuôi', '2024-01-01', '2024-05-05'),
('PNNVL12', 'KNVL05', 'NVK02', 'Lê Hải Đăng', '2024-01-01', '2024-05-05'),
('PNNVL13', 'KNVL06', 'NVK02', 'Lê Hải Đăng', '2024-01-01', '2024-05-05'),
('PNNVL14', 'KNVL06', 'NVK02', 'dddd', '2024-05-05', '2024-05-05'),
('PNNVL15', 'KNVL01', 'NVK01', 'Lê Anh Nuôi', '2024-01-01', '2024-05-05'),
('PNNVL16', 'KNVL01', 'NVK01', 'Lê Anh Nuôi', '2024-01-01', '2024-05-05'),
('PNNVL17', 'KNVL01', 'NVK01', 'Lê Anh Nuôi', '2024-01-01', '2024-05-05'),
('PNNVL18', 'KNVL01', 'NVK01', 'Lê Hạnh Hải Đăng', '2024-05-06', '2024-05-06'),
('PNNVL19', 'KNVL01', 'NVK01', 'Lê Hạnh Hải Đăng', '2024-05-06', '2024-05-07'),
('PNNVL20', 'KNVL01', 'NVK01', 'Lê Hạnh Hải Đăng', '2024-05-06', '2024-05-06'),
('PNNVL21', 'KNVL01', 'NVK01', 'Lê Hạnh Hải Đăng', '2024-05-06', '2024-05-06'),
('PNNVL22', 'KNVL01', 'NVK01', 'Lê Hạnh Hải Đăng', '2024-05-06', '2024-05-06');

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
('PXNVL03', 'KNVL01', '', 'hải đăng', '2024-05-06', '2024-05-06');

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
('TP12', 'Xúc xích', 'Gói', 100, 'xucxich.jpg', 1);

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
