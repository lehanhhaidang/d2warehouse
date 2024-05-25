-- phpMyAdmin SQL Dump
-- version 2.11.6
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 25, 2024 at 11:45 AM
-- Server version: 5.0.51
-- PHP Version: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `chatapp`
--

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `chat`
--


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
(2, 'Quản lý kho 1', 'qlk1@gmail.com', '12345', 'user2.jpg', 1, 0),
(3, 'NVP Kế hoạch 1', 'nvpkh1@gmail.com', '12345', 'user3.jpg', 1, 0),
(4, 'Giám đốc 1', 'gd1@gmail.com', '12345', 'user4.jpg', 1, 0),
(5, 'Admin', 'admin@gmail.com', '12345', 'user5.jpg', 1, 0);
