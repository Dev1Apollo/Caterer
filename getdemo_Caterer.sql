-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 07, 2025 at 12:58 PM
-- Server version: 5.7.23-23
-- PHP Version: 8.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `getdemo_Caterer`
--

-- --------------------------------------------------------

--
-- Table structure for table `banner`
--

CREATE TABLE `banner` (
  `bannerId` int(11) NOT NULL,
  `iSequenceNo` int(11) NOT NULL DEFAULT '1000',
  `strPhoto` varchar(255) DEFAULT NULL,
  `iStatus` int(11) NOT NULL DEFAULT '1',
  `isDelete` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `strIP` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `banner`
--

INSERT INTO `banner` (`bannerId`, `iSequenceNo`, `strPhoto`, `iStatus`, `isDelete`, `created_at`, `updated_at`, `strIP`) VALUES
(2, 1, '1713763545.jpg', 1, 0, '2024-04-22 05:25:45', '2024-04-22 05:25:45', '103.1.100.226'),
(4, 3, '1713763622.jpeg', 1, 0, '2024-04-22 05:27:02', '2024-04-22 05:27:02', '103.1.100.226'),
(8, 4, '1713765279.jpg', 1, 0, '2024-04-22 05:54:39', '2024-04-22 05:54:39', '103.1.100.226'),
(9, 2, '1713767760.jpg', 1, 0, '2024-04-22 06:36:00', '2024-04-22 06:36:00', '103.1.100.226');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `categoryId` int(11) NOT NULL,
  `strSequenceNo` int(11) NOT NULL DEFAULT '1000',
  `categoryname` varchar(255) DEFAULT NULL,
  `slugname` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `iStatus` int(11) NOT NULL DEFAULT '1',
  `isDelete` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `strIP` varchar(255) DEFAULT NULL,
  `meta_title` text,
  `meta_description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`categoryId`, `strSequenceNo`, `categoryname`, `slugname`, `photo`, `iStatus`, `isDelete`, `created_at`, `updated_at`, `strIP`, `meta_title`, `meta_description`) VALUES
(2, 1, 'Welcome Drink', 'welcome-drink', '1732343332.jpeg', 1, 0, '2024-11-14 13:06:29', '2024-11-23 06:28:52', '127.0.0.1', NULL, NULL),
(3, 2, 'Starters', 'starters', '1732343399.jpeg', 1, 0, '2024-11-14 13:06:59', '2024-11-23 06:29:59', '127.0.0.1', NULL, NULL),
(4, 3, 'Soup', 'soup', '1732343480.jpeg', 1, 0, '2024-11-14 13:07:27', '2024-11-23 06:31:20', '127.0.0.1', NULL, NULL),
(5, 4, 'Chinese', 'chinese', '1732343587.jpeg', 1, 0, '2024-11-14 13:07:58', '2024-11-23 06:33:07', '127.0.0.1', NULL, NULL),
(6, 5, 'Chinese Counter', 'chinese-counter', '1732343668.jpeg', 1, 0, '2024-11-14 13:08:26', '2024-11-23 06:34:28', '127.0.0.1', NULL, NULL),
(7, 6, 'Mexican Counter', 'mexican-counter', '1732343625.jpeg', 1, 0, '2024-11-14 13:08:55', '2024-11-28 06:30:14', '127.0.0.1', NULL, NULL),
(8, 7, 'Thai Counter', 'thai-counter', '1732343220.jpeg', 1, 0, '2024-11-14 13:09:23', '2024-11-23 06:27:00', '127.0.0.1', NULL, NULL),
(9, 8, 'Sweets', 'sweets', '1732343150.jpeg', 1, 0, '2024-11-14 13:09:35', '2024-11-23 06:25:50', '127.0.0.1', NULL, NULL),
(10, 9, 'Hungarian Counter', 'hungarian-counter', '1732343084.jpeg', 1, 0, '2024-11-14 13:10:16', '2024-11-23 06:24:44', '127.0.0.1', NULL, NULL),
(11, 10, 'Punjabi Counter', 'punjabi-counter', '1732343042.jpeg', 1, 0, '2024-11-14 13:10:40', '2024-11-23 06:24:02', '127.0.0.1', NULL, NULL),
(12, 11, 'Rajasthani Counter', 'rajasthani-counter', '1732342976.jpeg', 1, 0, '2024-11-14 13:11:09', '2024-11-23 06:22:56', '127.0.0.1', NULL, NULL),
(13, 12, 'South Indian Counter', 'south-indian-counter', '1732342892.jpeg', 1, 0, '2024-11-14 13:11:37', '2024-11-23 06:21:32', '127.0.0.1', NULL, NULL),
(14, 13, 'Italian Counter', 'italian-counter', '1732342816.jpeg', 1, 0, '2024-11-14 13:12:12', '2024-11-23 06:20:16', '127.0.0.1', NULL, NULL),
(15, 14, 'Kathiyawadi Counter', 'kathiyawadi-counter', '1732342537.jpeg', 1, 0, '2024-11-14 13:12:36', '2024-11-23 06:15:37', '127.0.0.1', NULL, NULL),
(16, 15, 'Punjabi Shak', 'punjabi-shak', '1732342488.jpeg', 1, 0, '2024-11-14 13:13:16', '2024-11-23 06:14:48', '127.0.0.1', NULL, NULL),
(17, 16, 'Gujarati', 'gujarati', '1732342440.jpeg', 1, 0, '2024-11-14 13:13:29', '2024-11-23 06:14:00', '127.0.0.1', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `category_features`
--

CREATE TABLE `category_features` (
  `category_featuresId` int(11) NOT NULL,
  `iCategoryId` int(11) NOT NULL DEFAULT '0',
  `strValue` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `iStatus` int(11) NOT NULL DEFAULT '1',
  `isDelete` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `strIP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category_features`
--

INSERT INTO `category_features` (`category_featuresId`, `iCategoryId`, `strValue`, `iStatus`, `isDelete`, `created_at`, `updated_at`, `strIP`) VALUES
(7, 18, 'Modernly Designed Heavy Duty Cabinet', 1, 0, '2024-04-13 05:01:40', '2024-04-13 05:01:40', '103.1.100.226'),
(15, 26, 'Feather Printed Laminated Heavy Duty Cabinet', 1, 0, '2024-04-16 04:54:17', '2024-04-17 10:25:27', '103.1.100.226'),
(23, 21, 'Imported #D Designer Heavy Duty Cabinet', 1, 0, '2024-04-16 04:56:36', '2024-04-17 10:27:20', '103.1.100.226'),
(31, 25, 'Colourful Designer Heavy Duty Cabinet', 1, 0, '2024-04-16 04:58:00', '2024-04-24 06:34:29', '103.1.100.226'),
(39, 24, 'High Gloss Laminated Modular Heavy Duty Cabinet', 1, 0, '2024-04-16 04:59:12', '2024-04-17 10:24:18', '103.1.100.226'),
(47, 22, 'Evergreen Laminate Designer Heavy Duty Cabinet', 1, 0, '2024-04-16 05:01:19', '2024-04-17 10:26:02', '103.1.100.226'),
(55, 20, 'Decorative & Designer Heavy Duty Cabinet', 1, 0, '2024-04-16 05:02:58', '2024-04-16 05:02:58', '103.1.100.226'),
(63, 27, 'High Gloss Laminated Modular Heavy Duty Cabinet', 1, 0, '2024-04-16 05:04:05', '2024-04-17 10:24:56', '103.1.100.226'),
(71, 32, 'First to introduce Fully Stainless Steel Juicer Bowl', 1, 0, '2024-04-16 05:51:59', '2024-04-16 05:51:59', '103.1.100.226'),
(72, 32, 'Heavy Stainless Steel Cutter For Lifelong Operation', 1, 0, '2024-04-16 05:52:45', '2024-04-16 05:52:45', '103.1.100.226'),
(73, 30, 'Crystal Finished Designer Heavy Duty Cabinet', 1, 0, '2024-04-17 10:29:08', '2024-04-17 10:29:08', '103.1.100.226'),
(81, 29, 'High Gloss Smooth Designer Heavy Duty Cabinet', 1, 0, '2024-04-17 10:32:37', '2024-04-17 10:32:37', '103.1.100.226'),
(89, 23, 'Wooden Finished Designer Heavy Duty Cabinet', 1, 0, '2024-04-17 10:37:21', '2024-04-17 10:37:21', '103.1.100.226'),
(97, 19, 'Decorative Flower Designer Heavy Duty Cabinet', 1, 0, '2024-04-17 10:40:44', '2024-04-17 10:40:44', '103.1.100.226'),
(105, 33, 'High Gloss Modern Desinged Printed Heavy Duty Cabinet', 1, 0, '2024-04-18 05:39:39', '2024-04-18 05:39:39', '103.1.100.226'),
(113, 26, 'Low Maintenance', 1, 0, '2024-04-24 06:11:41', '2024-04-24 06:11:41', '103.1.100.226'),
(114, 26, 'Fully Air Cooling System', 1, 0, '2024-04-24 06:11:51', '2024-04-24 06:11:51', '103.1.100.226'),
(115, 26, 'Copper Winding Power Saver Motor', 1, 0, '2024-04-24 06:11:59', '2024-04-24 06:11:59', '103.1.100.226'),
(116, 26, 'SS Top Bottom', 1, 0, '2024-04-24 06:12:11', '2024-04-24 06:12:11', '103.1.100.226'),
(118, 26, 'Overload Protection*', 1, 0, '2024-04-24 06:12:39', '2024-04-24 10:13:06', '103.1.100.226'),
(121, 26, 'Heavy Duty Shock Proof Castor Wheel', 1, 0, '2024-04-24 06:13:12', '2024-04-24 06:13:12', '103.1.100.226'),
(122, 26, 'Heavy Duty Main Door Lock & Hinges For Better Safety', 1, 0, '2024-04-24 06:13:20', '2024-04-24 06:13:20', '103.1.100.226'),
(123, 26, 'Washable, Long Life & Air Circulated Air Filter', 1, 0, '2024-04-24 06:13:30', '2024-04-24 06:13:30', '103.1.100.226'),
(124, 26, 'Heavy Duty & Durable Chamber Locking System', 1, 0, '2024-04-24 06:13:46', '2024-04-24 06:13:46', '103.1.100.226'),
(125, 26, 'Heavy Duty ISI Code Wire', 1, 0, '2024-04-24 06:13:57', '2024-04-24 06:13:57', '103.1.100.226'),
(126, 26, 'Long Life & Durable Electronic Programming Circuit', 1, 0, '2024-04-24 06:14:07', '2024-04-24 06:14:07', '103.1.100.226'),
(127, 24, 'Low Maintenance', 1, 0, '2024-04-24 06:18:19', '2024-04-24 06:18:19', '103.1.100.226'),
(128, 24, 'Fully Air Cooling System', 1, 0, '2024-04-24 06:18:29', '2024-04-24 06:18:29', '103.1.100.226'),
(129, 24, 'Copper Winding Power Saver Motor', 1, 0, '2024-04-24 06:18:43', '2024-04-24 06:18:43', '103.1.100.226'),
(130, 24, 'Rat Prohibited Metal Air Ventilation', 1, 0, '2024-04-24 06:18:54', '2024-04-24 06:18:54', '103.1.100.226'),
(131, 24, 'SS Top Bottom', 1, 0, '2024-04-24 06:19:01', '2024-04-24 06:19:01', '103.1.100.226'),
(133, 24, 'Overload Protection*', 1, 0, '2024-04-24 06:19:15', '2024-04-24 10:14:18', '103.1.100.226'),
(136, 24, 'Heavy Duty Shock Proof Castor Wheel', 1, 0, '2024-04-24 06:19:37', '2024-04-24 06:19:37', '103.1.100.226'),
(137, 24, 'Back Side Wooden Cover with SS Air Ventilation', 1, 0, '2024-04-24 06:19:44', '2024-04-24 06:19:44', '103.1.100.226'),
(138, 24, 'Heavy Duty Main Door Lock & Hinges For Better Safety', 1, 0, '2024-04-24 06:20:51', '2024-04-24 06:20:51', '103.1.100.226'),
(139, 24, 'Washable, Long Life & Air Circulated Air Filter', 1, 0, '2024-04-24 06:20:57', '2024-04-24 06:20:57', '103.1.100.226'),
(140, 24, 'Heavy Duty & Durable Chamber Locking System', 1, 0, '2024-04-24 06:21:10', '2024-04-24 06:21:10', '103.1.100.226'),
(141, 24, 'Heavy Duty ISI Code Wire', 1, 0, '2024-04-24 06:21:16', '2024-04-24 06:21:16', '103.1.100.226'),
(142, 24, 'Long Life & Durable Electronic Programming Circuit', 1, 0, '2024-04-24 06:21:25', '2024-04-24 06:21:25', '103.1.100.226'),
(143, 18, 'Low Maintenance', 1, 0, '2024-04-24 06:23:07', '2024-04-24 06:23:07', '103.1.100.226'),
(144, 18, 'Fully Air Cooling System', 1, 0, '2024-04-24 06:23:13', '2024-04-24 06:23:13', '103.1.100.226'),
(145, 18, 'Copper Winding Power Saver Motor', 1, 0, '2024-04-24 06:23:19', '2024-04-24 06:23:19', '103.1.100.226'),
(146, 18, 'Rat Prohibited Metal Air Ventilation', 1, 0, '2024-04-24 06:23:29', '2024-04-24 06:23:29', '103.1.100.226'),
(147, 18, 'SS Top Bottom', 1, 0, '2024-04-24 06:23:38', '2024-04-24 06:23:38', '103.1.100.226'),
(149, 18, 'Overload Protection*', 1, 0, '2024-04-24 06:28:33', '2024-04-24 10:15:23', '103.1.100.226'),
(152, 18, 'Heavy Duty Shock Proof Castor Wheel', 1, 0, '2024-04-24 06:29:03', '2024-04-24 06:29:03', '103.1.100.226'),
(153, 18, 'Back Side Wooden Cover with SS Air Ventilation', 1, 0, '2024-04-24 06:29:12', '2024-04-24 06:29:12', '103.1.100.226'),
(154, 18, 'Heavy Duty Main Door Lock & Hinges For Better Safety', 1, 0, '2024-04-24 06:29:21', '2024-04-24 06:29:21', '103.1.100.226'),
(155, 18, 'Washable, Long Life & Air Circulated Air Filter', 1, 0, '2024-04-24 06:29:28', '2024-04-24 06:29:28', '103.1.100.226'),
(156, 18, 'Heavy Duty & Durable Chamber Locking System', 1, 0, '2024-04-24 06:29:39', '2024-04-24 06:29:39', '103.1.100.226'),
(157, 18, 'Heavy Duty ISI Code Wire', 1, 0, '2024-04-24 06:29:46', '2024-04-24 06:29:46', '103.1.100.226'),
(158, 18, 'Long Life & Durable Electronic Programming Circuit', 1, 0, '2024-04-24 06:29:55', '2024-04-24 06:29:55', '103.1.100.226'),
(159, 27, 'Low Maintenance', 1, 0, '2024-04-24 06:31:26', '2024-04-24 06:31:26', '103.1.100.226'),
(160, 27, 'Fully Air Cooling System', 1, 0, '2024-04-24 06:31:35', '2024-04-24 06:31:35', '103.1.100.226'),
(161, 27, 'Copper Winding Power Saver Motor', 1, 0, '2024-04-24 06:31:42', '2024-04-24 06:31:42', '103.1.100.226'),
(162, 27, 'Rat Prohibited Metal Air Ventilation', 1, 0, '2024-04-24 06:31:54', '2024-04-24 06:31:54', '103.1.100.226'),
(163, 27, 'SS Top Bottom', 1, 0, '2024-04-24 06:32:00', '2024-04-24 06:32:00', '103.1.100.226'),
(165, 27, 'Overload Protection*', 1, 0, '2024-04-24 06:32:16', '2024-04-24 10:17:48', '103.1.100.226'),
(168, 27, 'Heavy Duty Shock Proof Castor Wheel', 1, 0, '2024-04-24 06:32:37', '2024-04-24 06:32:37', '103.1.100.226'),
(169, 27, 'Back Side Wooden Cover with SS Air Ventilation', 1, 0, '2024-04-24 06:32:44', '2024-04-24 06:32:44', '103.1.100.226'),
(170, 27, 'Heavy Duty Main Door Lock & Hinges For Better Safety', 1, 0, '2024-04-24 06:32:51', '2024-04-24 06:32:51', '103.1.100.226'),
(171, 27, 'Washable, Long Life & Air Circulated Air Filter', 1, 0, '2024-04-24 06:33:00', '2024-04-24 06:33:00', '103.1.100.226'),
(172, 27, 'Heavy Duty & Durable Chamber Locking System', 1, 0, '2024-04-24 06:33:16', '2024-04-24 06:33:16', '103.1.100.226'),
(173, 27, 'Heavy Duty ISI Code Wire', 1, 0, '2024-04-24 06:33:22', '2024-04-24 06:33:22', '103.1.100.226'),
(174, 27, 'Long Life & Durable Electronic Programming Circuit', 1, 0, '2024-04-24 06:33:29', '2024-04-24 06:33:29', '103.1.100.226'),
(175, 25, 'Low Maintenance', 1, 0, '2024-04-24 06:40:44', '2024-04-24 06:40:44', '103.1.100.226'),
(176, 25, 'Fully Air Cooling System', 1, 0, '2024-04-24 06:40:51', '2024-04-24 06:40:51', '103.1.100.226'),
(177, 25, 'Copper Winding Power Saver Motor', 1, 0, '2024-04-24 06:41:01', '2024-04-24 06:41:01', '103.1.100.226'),
(178, 25, 'Rat Prohibited Metal Air Ventilation', 1, 0, '2024-04-24 06:41:21', '2024-04-24 06:41:21', '103.1.100.226'),
(180, 25, 'Overload Protection*', 1, 0, '2024-04-24 06:41:47', '2024-04-24 10:20:20', '103.1.100.226'),
(183, 25, 'Heavy Duty Shock Proof Castor Wheel', 1, 0, '2024-04-24 06:42:08', '2024-04-24 06:42:08', '103.1.100.226'),
(184, 25, 'Back Side Wooden Cover with SS Air Ventilation', 1, 0, '2024-04-24 06:42:16', '2024-04-24 06:42:16', '103.1.100.226'),
(185, 25, 'Heavy Duty Main Door Lock & Hinges For Better Safety', 1, 0, '2024-04-24 06:42:22', '2024-04-24 06:42:22', '103.1.100.226'),
(186, 25, 'Washable, Long Life & Air Circulated Air Filter', 1, 0, '2024-04-24 06:42:29', '2024-04-24 06:42:29', '103.1.100.226'),
(187, 25, 'Heavy Duty & Durable Chamber Locking System', 1, 0, '2024-04-24 06:42:38', '2024-04-24 06:42:38', '103.1.100.226'),
(188, 25, 'Heavy Duty ISI Code Wire', 1, 0, '2024-04-24 06:42:44', '2024-04-24 06:42:44', '103.1.100.226'),
(189, 25, 'Long Life & Durable Electronic Programming Circuit', 1, 0, '2024-04-24 06:42:51', '2024-04-24 06:42:51', '103.1.100.226'),
(191, 23, 'Low Maintenance', 1, 0, '2024-04-24 06:48:35', '2024-04-24 06:48:35', '103.1.100.226'),
(192, 23, 'Fully Air Cooling System', 1, 0, '2024-04-24 06:48:42', '2024-04-24 06:48:42', '103.1.100.226'),
(193, 23, 'Copper Winding Power Saver Motor', 1, 0, '2024-04-24 06:48:48', '2024-04-24 06:48:48', '103.1.100.226'),
(194, 23, 'Rat Prohibited Metal Air Ventilation', 1, 0, '2024-04-24 06:48:55', '2024-04-24 06:48:55', '103.1.100.226'),
(195, 23, 'SS Top Bottom', 1, 0, '2024-04-24 06:49:03', '2024-04-24 06:49:03', '103.1.100.226'),
(197, 23, 'Overload Protection*', 1, 0, '2024-04-24 06:49:15', '2024-04-24 10:21:02', '103.1.100.226'),
(200, 23, 'Heavy Duty Shock Proof Castor Wheel', 1, 0, '2024-04-24 06:49:44', '2024-04-24 06:49:44', '103.1.100.226'),
(201, 23, 'Back Side Wooden Cover with SS Air Ventilation', 1, 0, '2024-04-24 06:49:53', '2024-04-24 06:49:53', '103.1.100.226'),
(202, 23, 'Heavy Duty Main Door Lock & Hinges For Better Safety', 1, 0, '2024-04-24 06:50:03', '2024-04-24 06:50:03', '103.1.100.226'),
(203, 23, 'Washable, Long Life & Air Circulated Air Filter', 1, 0, '2024-04-24 06:50:10', '2024-04-24 06:50:10', '103.1.100.226'),
(204, 23, 'Heavy Duty & Durable Chamber Locking System', 1, 0, '2024-04-24 06:50:26', '2024-04-24 06:50:26', '103.1.100.226'),
(205, 23, 'Heavy Duty ISI Code Wire', 1, 0, '2024-04-24 06:50:32', '2024-04-24 06:50:32', '103.1.100.226'),
(206, 23, 'Long Life & Durable Electronic Programming Circuit', 1, 0, '2024-04-24 06:50:39', '2024-04-24 06:50:39', '103.1.100.226'),
(207, 22, 'Low Maintenance', 1, 0, '2024-04-24 06:52:06', '2024-04-24 06:52:06', '103.1.100.226'),
(208, 22, 'Fully Air Cooling System', 1, 0, '2024-04-24 06:52:12', '2024-04-24 06:52:12', '103.1.100.226'),
(209, 22, 'Copper Winding Power Saver Motor', 1, 0, '2024-04-24 06:52:18', '2024-04-24 06:52:18', '103.1.100.226'),
(210, 22, 'Rat Prohibited Metal Air Ventilation', 1, 0, '2024-04-24 06:52:27', '2024-04-24 06:52:27', '103.1.100.226'),
(211, 22, 'SS Top Bottom', 1, 0, '2024-04-24 06:52:40', '2024-04-24 06:52:40', '103.1.100.226'),
(213, 22, 'Overload Protection*', 1, 0, '2024-04-24 06:52:56', '2024-04-24 10:26:06', '103.1.100.226'),
(216, 22, 'Heavy Duty Shock Proof Castor Wheel', 1, 0, '2024-04-24 06:53:23', '2024-04-24 06:53:23', '103.1.100.226'),
(217, 22, 'Back Side Wooden Cover with SS Air Ventilation', 1, 0, '2024-04-24 06:53:33', '2024-04-24 06:53:33', '103.1.100.226'),
(218, 22, 'Heavy Duty Main Door Lock & Hinges For Better Safety', 1, 0, '2024-04-24 06:53:40', '2024-04-24 06:53:40', '103.1.100.226'),
(219, 22, 'Washable, Long Life & Air Circulated Air Filter', 1, 0, '2024-04-24 06:53:48', '2024-04-24 06:53:48', '103.1.100.226'),
(220, 22, 'Heavy Duty & Durable Chamber Locking System', 1, 0, '2024-04-24 06:54:01', '2024-04-24 06:54:01', '103.1.100.226'),
(221, 22, 'Heavy Duty ISI Code Wire', 1, 0, '2024-04-24 06:54:09', '2024-04-24 06:54:09', '103.1.100.226'),
(222, 22, 'Long Life & Durable Electronic Programming Circuit', 1, 0, '2024-04-24 06:54:15', '2024-04-24 06:54:15', '103.1.100.226'),
(223, 29, 'Low Maintenance', 1, 0, '2024-04-24 06:55:30', '2024-04-24 06:55:30', '103.1.100.226'),
(224, 29, 'Fully Air Cooling System', 1, 0, '2024-04-24 07:00:30', '2024-04-24 07:00:30', '103.1.100.226'),
(225, 29, 'Copper Winding Power Saver Motor', 1, 0, '2024-04-24 07:00:46', '2024-04-24 07:00:46', '103.1.100.226'),
(226, 29, 'SS Top Bottom', 1, 0, '2024-04-24 07:01:17', '2024-04-24 07:01:17', '103.1.100.226'),
(228, 29, 'Overload Protection*', 1, 0, '2024-04-24 07:01:49', '2024-04-24 10:26:43', '103.1.100.226'),
(231, 29, 'Heavy Duty Shock Proof Castor Wheel', 1, 0, '2024-04-24 07:02:41', '2024-04-24 07:02:41', '103.1.100.226'),
(232, 29, 'Heavy Duty Main Door Lock & Hinges For Better Safety', 1, 0, '2024-04-24 07:02:56', '2024-04-24 07:02:56', '103.1.100.226'),
(233, 29, 'Washable, Long Life & Air Circulated Air Filter', 1, 0, '2024-04-24 07:03:06', '2024-04-24 07:03:06', '103.1.100.226'),
(234, 29, 'Heavy Duty & Durable Chamber Locking System', 1, 0, '2024-04-24 07:03:18', '2024-04-24 07:03:18', '103.1.100.226'),
(235, 29, 'Heavy Duty ISI Code Wire', 1, 0, '2024-04-24 07:03:26', '2024-04-24 07:03:26', '103.1.100.226'),
(236, 29, 'Long Life & Durable Electronic Programming Circuit', 1, 0, '2024-04-24 07:03:32', '2024-04-24 07:03:32', '103.1.100.226'),
(237, 21, 'Low Maintenance', 1, 0, '2024-04-24 07:08:12', '2024-04-24 07:08:12', '103.1.100.226'),
(238, 21, 'Fully Air Cooling System', 1, 0, '2024-04-24 07:08:19', '2024-04-24 07:08:19', '103.1.100.226'),
(239, 21, 'Copper Winding Power Saver Motor', 1, 0, '2024-04-24 07:08:25', '2024-04-24 07:08:25', '103.1.100.226'),
(240, 21, 'Rat Prohibited Metal Air Ventilation', 1, 0, '2024-04-24 07:08:32', '2024-04-24 07:08:32', '103.1.100.226'),
(241, 21, 'SS Top Bottom', 1, 0, '2024-04-24 07:08:37', '2024-04-24 07:08:37', '103.1.100.226'),
(242, 21, 'Works on Low Voltage*', 1, 0, '2024-04-24 07:08:44', '2024-04-24 07:08:44', '103.1.100.226'),
(243, 21, 'Overload Voltage Protection*', 1, 0, '2024-04-24 07:08:51', '2024-04-24 07:08:51', '103.1.100.226'),
(244, 21, 'Auto Clean Chamber*', 1, 0, '2024-04-24 07:08:57', '2024-04-24 07:08:57', '103.1.100.226'),
(245, 21, 'Food Grade Grinding Chamber', 1, 0, '2024-04-24 07:09:03', '2024-04-24 07:09:03', '103.1.100.226'),
(246, 21, 'Heavy Duty Shock Proof Castor Wheel', 1, 0, '2024-04-24 07:09:08', '2024-04-24 07:09:08', '103.1.100.226'),
(247, 21, 'Back Side Wooden Cover with SS Air Ventilation', 1, 0, '2024-04-24 07:09:14', '2024-04-24 07:09:14', '103.1.100.226'),
(248, 21, 'Heavy Duty Main Door Lock & Hinges For Better Safety', 1, 0, '2024-04-24 07:09:22', '2024-04-24 07:09:22', '103.1.100.226'),
(249, 21, 'Washable, Long Life & Air Circulated Air Filter', 1, 0, '2024-04-24 07:09:28', '2024-04-24 07:09:28', '103.1.100.226'),
(250, 21, 'Heavy Duty & Durable Chamber Locking System', 1, 0, '2024-04-24 07:09:36', '2024-04-24 07:10:01', '103.1.100.226'),
(251, 21, 'Heavy Duty ISI Code Wire', 1, 0, '2024-04-24 07:09:44', '2024-04-24 07:09:44', '103.1.100.226'),
(252, 21, 'Long Life & Durable Electronic Programming Circuit', 1, 0, '2024-04-24 07:09:51', '2024-04-24 07:09:51', '103.1.100.226'),
(253, 19, 'Low Maintenance', 1, 0, '2024-04-24 07:16:31', '2024-04-24 07:16:31', '103.1.100.226'),
(254, 19, 'Fully Air Cooling System', 1, 0, '2024-04-24 07:16:37', '2024-04-24 07:16:37', '103.1.100.226'),
(255, 19, 'Copper Winding Power Saver Motor', 1, 0, '2024-04-24 07:16:45', '2024-04-24 07:16:45', '103.1.100.226'),
(256, 19, 'Rat Prohibited Metal Air Ventilation', 1, 0, '2024-04-24 07:16:53', '2024-04-24 07:16:53', '103.1.100.226'),
(257, 19, 'SS Top Bottom', 1, 0, '2024-04-24 07:17:02', '2024-04-24 07:17:02', '103.1.100.226'),
(259, 19, 'Overload Protection*', 1, 0, '2024-04-24 07:17:15', '2024-04-24 10:27:18', '103.1.100.226'),
(262, 19, 'Heavy Duty Shock Proof Castor Wheel', 1, 0, '2024-04-24 07:17:34', '2024-04-24 07:17:34', '103.1.100.226'),
(263, 19, 'Back Side Wooden Cover with SS Air Ventilation', 1, 0, '2024-04-24 07:17:40', '2024-04-24 07:17:40', '103.1.100.226'),
(264, 19, 'Heavy Duty Main Door Lock & Hinges For Better Safety', 1, 0, '2024-04-24 07:17:47', '2024-04-24 07:17:47', '103.1.100.226'),
(265, 19, 'Washable, Long Life & Air Circulated Air Filter', 1, 0, '2024-04-24 07:17:54', '2024-04-24 07:17:54', '103.1.100.226'),
(266, 19, 'Heavy Duty & Durable Chamber Locking System', 1, 0, '2024-04-24 07:18:02', '2024-04-24 07:18:02', '103.1.100.226'),
(267, 19, 'Heavy Duty ISI Code Wire', 1, 0, '2024-04-24 07:18:09', '2024-04-24 07:18:09', '103.1.100.226'),
(268, 19, 'Long Life & Durable Electronic Programming Circuit', 1, 0, '2024-04-24 07:18:14', '2024-04-24 07:18:14', '103.1.100.226'),
(269, 20, 'Low Maintenance', 1, 0, '2024-04-24 07:20:10', '2024-04-24 07:20:10', '103.1.100.226'),
(270, 20, 'Fully Air Cooling System', 1, 0, '2024-04-24 07:22:33', '2024-04-24 07:22:33', '103.1.100.226'),
(271, 20, 'Copper Winding Power Saver Motor', 1, 0, '2024-04-24 07:22:38', '2024-04-24 07:22:38', '103.1.100.226'),
(272, 20, 'Rat Prohibited Metal Air Ventilation', 1, 0, '2024-04-24 07:22:46', '2024-04-24 07:22:46', '103.1.100.226'),
(273, 20, 'SS Top Bottom', 1, 0, '2024-04-24 07:22:50', '2024-04-24 07:22:50', '103.1.100.226'),
(275, 20, 'Overload Protection*', 1, 0, '2024-04-24 07:23:01', '2024-04-24 10:27:49', '103.1.100.226'),
(278, 20, 'Heavy Duty Shock Proof Castor Wheel', 1, 0, '2024-04-24 07:23:21', '2024-04-24 07:23:21', '103.1.100.226'),
(279, 20, 'Back Side Wooden Cover with SS Air Ventilation', 1, 0, '2024-04-24 07:23:27', '2024-04-24 07:23:27', '103.1.100.226'),
(280, 20, 'Heavy Duty Main Door Lock & Hinges For Better Safety', 1, 0, '2024-04-24 07:23:33', '2024-04-24 07:23:33', '103.1.100.226'),
(281, 20, 'Washable, Long Life & Air Circulated Air Filter', 1, 0, '2024-04-24 07:23:43', '2024-04-24 07:23:43', '103.1.100.226'),
(282, 20, 'Heavy Duty & Durable Chamber Locking System', 1, 0, '2024-04-24 07:23:54', '2024-04-24 07:23:54', '103.1.100.226'),
(283, 20, 'Heavy Duty ISI Code Wire', 1, 0, '2024-04-24 07:24:05', '2024-04-24 07:24:05', '103.1.100.226'),
(284, 20, 'Long Life & Durable Electronic Programming Circuit', 1, 0, '2024-04-24 07:24:10', '2024-04-24 07:24:10', '103.1.100.226'),
(285, 30, 'Low Maintenance', 1, 0, '2024-04-24 07:25:22', '2024-04-24 07:25:22', '103.1.100.226'),
(286, 30, 'Fully Air Cooling System', 1, 0, '2024-04-24 07:25:44', '2024-04-24 07:25:44', '103.1.100.226'),
(287, 30, 'Copper Winding Power Saver Motor', 1, 0, '2024-04-24 07:25:52', '2024-04-24 07:25:52', '103.1.100.226'),
(288, 30, 'Rat Prohibited Metal Air Ventilation', 1, 0, '2024-04-24 07:26:01', '2024-04-24 07:26:01', '103.1.100.226'),
(289, 30, 'SS Top Bottom', 1, 0, '2024-04-24 07:26:07', '2024-04-24 07:26:07', '103.1.100.226'),
(291, 30, 'Overload Protection*', 1, 0, '2024-04-24 07:26:18', '2024-04-24 10:28:18', '103.1.100.226'),
(294, 30, 'Heavy Duty Shock Proof Castor Wheel', 1, 0, '2024-04-24 07:26:38', '2024-04-24 07:26:38', '103.1.100.226'),
(295, 30, 'Back Side Wooden Cover with SS Air Ventilation', 1, 0, '2024-04-24 07:26:43', '2024-04-24 07:26:43', '103.1.100.226'),
(296, 30, 'Heavy Duty Main Door Lock & Hinges For Better Safety', 1, 0, '2024-04-24 07:26:49', '2024-04-24 07:26:49', '103.1.100.226'),
(297, 30, 'Washable, Long Life & Air Circulated Air Filter', 1, 0, '2024-04-24 07:26:55', '2024-04-24 07:26:55', '103.1.100.226'),
(298, 30, 'Heavy Duty & Durable Chamber Locking System', 1, 0, '2024-04-24 07:27:04', '2024-04-24 07:27:04', '103.1.100.226'),
(299, 30, 'Heavy Duty ISI Code Wire', 1, 0, '2024-04-24 07:27:10', '2024-04-24 07:27:10', '103.1.100.226'),
(300, 30, 'Long Life & Durable Electronic Programming Circuit with inbuilt LED Lights', 1, 0, '2024-04-24 07:27:15', '2024-04-24 10:38:40', '103.1.100.226'),
(301, 33, 'Low Maintenance', 1, 0, '2024-04-24 07:28:14', '2024-04-24 07:28:14', '103.1.100.226'),
(302, 33, 'Fully Air Cooling System', 1, 0, '2024-04-24 07:28:21', '2024-04-24 07:28:21', '103.1.100.226'),
(303, 33, 'Copper Winding Power Saver Motor', 1, 0, '2024-04-24 07:28:26', '2024-04-24 07:28:26', '103.1.100.226'),
(304, 33, 'SS Top Bottom', 1, 0, '2024-04-24 07:28:46', '2024-04-24 07:28:46', '103.1.100.226'),
(310, 33, 'Heavy Duty Main Door Lock & Hinges For Better Safety', 1, 0, '2024-04-24 07:29:52', '2024-04-24 07:29:52', '103.1.100.226'),
(311, 33, 'Washable, Long Life & Air Circulated Air Filter', 1, 0, '2024-04-24 07:29:58', '2024-04-24 07:29:58', '103.1.100.226'),
(312, 18, 'SS Datti and SS Rotter', 1, 0, '2024-04-24 07:46:41', '2024-04-24 10:16:01', '103.1.100.226'),
(313, 30, 'SS Datti and SS Rotter', 1, 0, '2024-04-24 10:32:00', '2024-04-24 10:32:00', '103.1.100.226'),
(315, 37, 'test', 1, 0, '2024-05-02 05:30:53', '2024-05-02 05:30:53', '103.1.100.226');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `iCustomerId` int(11) NOT NULL,
  `strCustomerName` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `strAddress` text COLLATE utf8_unicode_ci,
  `iMobileHouse` bigint(20) NOT NULL DEFAULT '0',
  `iMobileOffice` bigint(20) NOT NULL DEFAULT '0',
  `iMobileNo` bigint(20) NOT NULL DEFAULT '0',
  `strFunctionName` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `strFunctionDate` timestamp NULL DEFAULT NULL,
  `strFunctionMorningTime` time DEFAULT NULL,
  `strFunctionEveningTime` time DEFAULT NULL,
  `strFunctionVanue` text COLLATE utf8_unicode_ci,
  `strRemarks` text COLLATE utf8_unicode_ci,
  `strIP` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isDelete` int(11) NOT NULL DEFAULT '0',
  `iStatus` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`iCustomerId`, `strCustomerName`, `strAddress`, `iMobileHouse`, `iMobileOffice`, `iMobileNo`, `strFunctionName`, `strFunctionDate`, `strFunctionMorningTime`, `strFunctionEveningTime`, `strFunctionVanue`, `strRemarks`, `strIP`, `isDelete`, `iStatus`, `created_at`, `updated_at`) VALUES
(2, 'Tarang Parmar', 'E-302, Sai Green Valley -1, Ghuma - Bopal - 380058', 9999999999, 0, 7046673769, 'Sagai', '2025-01-24 18:30:00', '10:30:00', '04:30:00', 'E-302, Sai Green Valley -1, Ghuma - Bopal - 380058', 'Be in time.', '127.0.0.1', 0, 1, '2024-11-14 12:00:26', '2024-11-26 05:48:31'),
(3, 'Test Apollo Mihir', 'A-1 , Anubhav Flat , bhairavnath cross road , Maninagar , Ahmedabad\r\ntt', 9837013233, 0, 9999999999, 'Test Apollo', '2024-11-29 18:30:00', '00:00:00', '00:00:00', 'Test Apollo', '', '103.1.100.226', 0, 1, '2024-11-28 07:05:21', '2024-11-28 07:07:37'),
(5, 'Krunal Shah', 'D/11, Lalita Society, Isnapur, Ahmedabd', 0, 0, 9824773136, 'Marridge', '2025-01-18 18:30:00', '11:30:00', '00:00:00', 'H L Patel Party Plot, Isanpur', 'All food jain', '42.105.168.98', 0, 1, '2024-12-17 08:49:44', '2024-12-17 08:49:44'),
(6, 'Bansari Patel', 'Sola\r\nScience City', 9987654321, 0, 9987654321, 'marriage', '2028-12-11 18:30:00', '08:00:00', '07:30:00', 'Sola\r\nScience City', '', '103.1.100.226', 0, 1, '2025-01-10 06:08:31', '2025-01-10 06:08:31'),
(7, 'Krunal Shah', 'D/11 Lalita Society', 0, 0, 9824773136, 'Shadi', '2025-03-21 18:30:00', '09:30:00', '18:30:00', 'At hoome', '', '42.105.172.145', 0, 1, '2025-03-19 12:03:20', '2025-03-19 12:03:20');

-- --------------------------------------------------------

--
-- Table structure for table `dealer`
--

CREATE TABLE `dealer` (
  `dealerId` int(11) NOT NULL,
  `strName` varchar(255) DEFAULT NULL,
  `strEmail` varchar(255) DEFAULT NULL,
  `strMobile` varchar(255) DEFAULT NULL,
  `address1` text,
  `address2` text,
  `city` varchar(255) DEFAULT NULL,
  `pincode` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `iStatus` int(11) NOT NULL DEFAULT '1',
  `isDelete` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `strIP` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `functiondetails`
--

CREATE TABLE `functiondetails` (
  `iFunctionDetailsId` int(11) NOT NULL,
  `iFunctionId` int(11) NOT NULL DEFAULT '0',
  `iProductId` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `iCategoryId` int(11) NOT NULL DEFAULT '0',
  `iSubCategoryId` int(11) NOT NULL DEFAULT '0',
  `isDelete` int(11) NOT NULL DEFAULT '0',
  `strIP` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `iStatus` int(11) NOT NULL DEFAULT '1',
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `functiondetails`
--

INSERT INTO `functiondetails` (`iFunctionDetailsId`, `iFunctionId`, `iProductId`, `iCategoryId`, `iSubCategoryId`, `isDelete`, `strIP`, `iStatus`, `updated_at`, `created_at`) VALUES
(18, 2, '8', 2, 7, 0, '127.0.0.1', 1, '2024-11-15 13:47:13', '2024-11-15 13:47:13'),
(19, 2, '12', 3, 9, 0, '127.0.0.1', 1, '2024-11-15 13:47:13', '2024-11-15 13:47:13'),
(20, 2, '25', 4, 0, 0, '127.0.0.1', 1, '2024-11-15 13:47:13', '2024-11-15 13:47:13'),
(21, 2, '104', 16, 79, 0, '127.0.0.1', 1, '2024-11-15 13:47:13', '2024-11-15 13:47:13'),
(22, 2, '109', 16, 82, 0, '127.0.0.1', 1, '2024-11-15 13:47:13', '2024-11-15 13:47:13'),
(23, 2, '117', 17, 87, 0, '127.0.0.1', 1, '2024-11-15 13:47:13', '2024-11-15 13:47:13'),
(24, 2, '121', 17, 89, 0, '127.0.0.1', 1, '2024-11-15 13:47:13', '2024-11-15 13:47:13'),
(25, 2, '123', 17, 90, 0, '127.0.0.1', 1, '2024-11-15 13:47:13', '2024-11-15 13:47:13'),
(26, 2, '132', 17, 94, 0, '127.0.0.1', 1, '2024-11-15 13:47:13', '2024-11-15 13:47:13'),
(88, 3, '12', 3, 9, 0, '103.1.100.226', 1, '2024-11-28 06:11:10', '2024-11-28 06:11:10'),
(89, 3, '21', 3, 14, 0, '103.1.100.226', 1, '2024-11-28 06:11:10', '2024-11-28 06:11:10'),
(90, 3, '89', 13, 69, 0, '103.1.100.226', 1, '2024-11-28 06:11:10', '2024-11-28 06:11:10'),
(91, 3, '92', 13, 72, 0, '103.1.100.226', 1, '2024-11-28 06:11:10', '2024-11-28 06:11:10'),
(92, 5, '3', 2, 4, 0, '42.105.168.98', 1, '2024-12-17 08:56:10', '2024-12-17 08:56:10'),
(93, 5, '152', 2, 5, 0, '42.105.168.98', 1, '2024-12-17 08:56:10', '2024-12-17 08:56:10'),
(94, 5, '11', 3, 8, 0, '42.105.168.98', 1, '2024-12-17 08:56:10', '2024-12-17 08:56:10'),
(95, 5, '197', 3, 8, 0, '42.105.168.98', 1, '2024-12-17 08:56:10', '2024-12-17 08:56:10'),
(96, 5, '25', 4, 0, 0, '42.105.168.98', 1, '2024-12-17 08:56:10', '2024-12-17 08:56:10'),
(97, 5, '308', 4, 0, 0, '42.105.168.98', 1, '2024-12-17 08:56:10', '2024-12-17 08:56:10'),
(98, 5, '38', 7, 25, 0, '42.105.168.98', 1, '2024-12-17 08:56:10', '2024-12-17 08:56:10'),
(99, 5, '41', 7, 28, 0, '42.105.168.98', 1, '2024-12-17 08:56:10', '2024-12-17 08:56:10'),
(100, 5, '43', 7, 30, 0, '42.105.168.98', 1, '2024-12-17 08:56:10', '2024-12-17 08:56:10'),
(101, 5, '52', 9, 38, 0, '42.105.168.98', 1, '2024-12-17 08:56:10', '2024-12-17 08:56:10'),
(102, 5, '66', 9, 48, 0, '42.105.168.98', 1, '2024-12-17 08:56:10', '2024-12-17 08:56:10'),
(103, 5, '75', 11, 56, 0, '42.105.168.98', 1, '2024-12-17 08:56:10', '2024-12-17 08:56:10'),
(104, 5, '76', 11, 57, 0, '42.105.168.98', 1, '2024-12-17 08:56:10', '2024-12-17 08:56:10'),
(105, 5, '99', 15, 0, 0, '42.105.168.98', 1, '2024-12-17 08:56:10', '2024-12-17 08:56:10'),
(106, 5, '101', 15, 0, 0, '42.105.168.98', 1, '2024-12-17 08:56:10', '2024-12-17 08:56:10'),
(107, 5, '102', 15, 0, 0, '42.105.168.98', 1, '2024-12-17 08:56:10', '2024-12-17 08:56:10'),
(108, 6, '135', 2, 4, 0, '42.105.168.98', 1, '2024-12-17 09:01:44', '2024-12-17 09:01:44'),
(109, 6, '10', 3, 8, 0, '42.105.168.98', 1, '2024-12-17 09:01:44', '2024-12-17 09:01:44'),
(110, 6, '209', 3, 9, 0, '42.105.168.98', 1, '2024-12-17 09:01:44', '2024-12-17 09:01:44'),
(111, 6, '300', 4, 0, 0, '42.105.168.98', 1, '2024-12-17 09:01:44', '2024-12-17 09:01:44'),
(112, 6, '324', 4, 0, 0, '42.105.168.98', 1, '2024-12-17 09:01:44', '2024-12-17 09:01:44'),
(113, 6, '27', 5, 17, 0, '42.105.168.98', 1, '2024-12-17 09:01:44', '2024-12-17 09:01:44'),
(114, 6, '103', 16, 79, 0, '42.105.168.98', 1, '2024-12-17 09:01:44', '2024-12-17 09:01:44'),
(115, 6, '104', 16, 79, 0, '42.105.168.98', 1, '2024-12-17 09:01:44', '2024-12-17 09:01:44'),
(116, 6, '117', 17, 87, 0, '42.105.168.98', 1, '2024-12-17 09:01:44', '2024-12-17 09:01:44'),
(120, 7, '1', 2, 4, 0, '103.1.100.226', 1, '2025-01-08 13:22:28', '2025-01-08 13:22:28'),
(121, 7, '4', 2, 5, 0, '103.1.100.226', 1, '2025-01-08 13:22:28', '2025-01-08 13:22:28'),
(161, 8, '140', 2, 4, 0, '103.1.100.226', 1, '2025-01-10 06:24:38', '2025-01-10 06:24:38'),
(162, 8, '186', 3, 8, 0, '103.1.100.226', 1, '2025-01-10 06:24:38', '2025-01-10 06:24:38'),
(163, 8, '188', 3, 8, 0, '103.1.100.226', 1, '2025-01-10 06:24:38', '2025-01-10 06:24:38'),
(164, 8, '196', 3, 8, 0, '103.1.100.226', 1, '2025-01-10 06:24:38', '2025-01-10 06:24:38'),
(165, 8, '239', 3, 11, 0, '103.1.100.226', 1, '2025-01-10 06:24:38', '2025-01-10 06:24:38'),
(166, 8, '281', 3, 15, 0, '103.1.100.226', 1, '2025-01-10 06:24:38', '2025-01-10 06:24:38'),
(167, 8, '282', 3, 15, 0, '103.1.100.226', 1, '2025-01-10 06:24:38', '2025-01-10 06:24:38'),
(168, 8, '308', 4, 0, 0, '103.1.100.226', 1, '2025-01-10 06:24:38', '2025-01-10 06:24:38'),
(169, 8, '317', 4, 0, 0, '103.1.100.226', 1, '2025-01-10 06:24:38', '2025-01-10 06:24:38'),
(170, 8, '349', 5, 18, 0, '103.1.100.226', 1, '2025-01-10 06:24:38', '2025-01-10 06:24:38'),
(171, 8, '32', 5, 19, 0, '103.1.100.226', 1, '2025-01-10 06:24:38', '2025-01-10 06:24:38'),
(172, 8, '438', 9, 37, 0, '103.1.100.226', 1, '2025-01-10 06:24:38', '2025-01-10 06:24:38'),
(173, 8, '488', 9, 43, 0, '103.1.100.226', 1, '2025-01-10 06:24:38', '2025-01-10 06:24:38'),
(184, 12, '186', 3, 8, 0, '42.105.172.145', 1, '2025-03-19 12:06:45', '2025-03-19 12:06:45'),
(185, 12, '16', 3, 11, 0, '42.105.172.145', 1, '2025-03-19 12:06:45', '2025-03-19 12:06:45'),
(186, 12, '25', 4, 0, 0, '42.105.172.145', 1, '2025-03-19 12:06:45', '2025-03-19 12:06:45'),
(187, 12, '301', 4, 0, 0, '42.105.172.145', 1, '2025-03-19 12:06:45', '2025-03-19 12:06:45'),
(188, 12, '516', 9, 45, 0, '42.105.172.145', 1, '2025-03-19 12:06:45', '2025-03-19 12:06:45');

-- --------------------------------------------------------

--
-- Table structure for table `functionmaster`
--

CREATE TABLE `functionmaster` (
  `iFunctionId` int(11) NOT NULL,
  `iCustomerId` int(11) NOT NULL DEFAULT '0',
  `strFunction` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `strDate` timestamp NULL DEFAULT NULL,
  `iNoOfPerosn` int(11) NOT NULL DEFAULT '0',
  `iRatePerPerson` int(11) NOT NULL DEFAULT '0',
  `iTotalAmount` int(11) NOT NULL DEFAULT '0',
  `strLocation` text COLLATE utf8_unicode_ci,
  `strIP` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isDelete` int(11) NOT NULL DEFAULT '0',
  `iStatus` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `functionmaster`
--

INSERT INTO `functionmaster` (`iFunctionId`, `iCustomerId`, `strFunction`, `strDate`, `iNoOfPerosn`, `iRatePerPerson`, `iTotalAmount`, `strLocation`, `strIP`, `isDelete`, `iStatus`, `created_at`, `updated_at`) VALUES
(2, 2, 'Sagai', '2025-01-24 18:30:00', 100, 125, 12500, NULL, '127.0.0.1', 0, 1, '2024-11-15 13:47:13', '2024-11-15 13:47:13'),
(3, 2, 'Evening Nasta', '2025-01-24 18:30:00', 100, 50, 5000, NULL, '103.1.100.226', 0, 1, '2024-11-28 06:11:10', '2024-11-28 06:11:10'),
(5, 5, 'Haldi', '2025-01-16 18:30:00', 200, 500, 100000, NULL, '42.105.168.98', 0, 1, '2024-12-17 08:56:10', '2024-12-17 08:56:10'),
(6, 5, 'Kankotari', '2024-12-19 18:30:00', 120, 200, 24000, NULL, '42.105.168.98', 0, 1, '2024-12-17 09:01:44', '2024-12-17 09:01:44'),
(7, 5, 'Mehedi', '2025-01-07 18:30:00', 1, 100, 100, 'near by maninager 1', '103.1.100.226', 0, 1, '2025-01-08 13:22:28', '2025-01-08 13:22:28'),
(8, 6, 'Marriage', '2028-12-10 18:30:00', 500, 120, 60000, 'Sola\r\nScience City', '103.1.100.226', 0, 1, '2025-01-10 06:24:38', '2025-01-10 06:24:38'),
(9, 6, 'Haldi', '2028-12-10 18:30:00', 500, 110, 55000, 'Sola\r\nScience City', '103.1.100.226', 0, 1, '2025-01-10 06:28:12', '2025-01-10 06:28:12'),
(12, 7, 'Haldi', '2025-03-20 18:30:00', 100, 300, 30000, 'H L Patel Party plot\r\nIsnapur\r\nAhmedabad', '42.105.172.145', 0, 1, '2025-03-19 12:06:45', '2025-03-19 12:06:45');

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

CREATE TABLE `image` (
  `id` int(11) NOT NULL,
  `Imagecategoryid` int(11) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `iStatus` int(11) NOT NULL DEFAULT '1',
  `isDelete` int(11) NOT NULL DEFAULT '0',
  `strIP` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `image`
--

INSERT INTO `image` (`id`, `Imagecategoryid`, `photo`, `iStatus`, `isDelete`, `strIP`, `created_at`, `updated_at`) VALUES
(7, 7, '1736421724.jpeg', 1, 0, '103.1.100.226', '2025-01-09 11:22:04', '2025-01-09 11:22:04'),
(8, 7, '1736421745.jpeg', 1, 0, '103.1.100.226', '2025-01-09 11:22:25', '2025-01-09 11:22:25'),
(9, 7, '1736421763.jpeg', 1, 0, '103.1.100.226', '2025-01-09 11:22:44', '2025-01-09 11:22:44'),
(10, 6, '1736421793.jpeg', 1, 0, '103.1.100.226', '2025-01-09 11:23:13', '2025-01-09 11:23:13'),
(11, 6, '1736421805.jpeg', 1, 0, '103.1.100.226', '2025-01-09 11:23:25', '2025-01-09 11:23:25'),
(12, 6, '1736421817.jpeg', 1, 0, '103.1.100.226', '2025-01-09 11:23:37', '2025-01-09 11:23:37'),
(13, 6, '1736421866.jpeg', 1, 0, '103.1.100.226', '2025-01-09 11:24:26', '2025-01-09 11:24:26'),
(14, 6, '1736421884.jpeg', 1, 0, '103.1.100.226', '2025-01-09 11:24:44', '2025-01-09 11:24:44');

-- --------------------------------------------------------

--
-- Table structure for table `imagecategory`
--

CREATE TABLE `imagecategory` (
  `id` int(11) NOT NULL,
  `Imagecategoryname` varchar(255) DEFAULT NULL,
  `slugname` varchar(255) DEFAULT NULL,
  `iStatus` int(11) NOT NULL DEFAULT '1',
  `isDelete` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `strIP` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `imagecategory`
--

INSERT INTO `imagecategory` (`id`, `Imagecategoryname`, `slugname`, `iStatus`, `isDelete`, `created_at`, `updated_at`, `strIP`) VALUES
(6, 'Counter', 'counter', 1, 0, '2025-01-09 11:20:13', '2025-01-09 11:20:13', '103.1.100.226'),
(7, 'Dress', 'dress', 1, 0, '2025-01-09 11:21:12', '2025-01-09 11:21:12', '103.1.100.226'),
(10, 'test', 'test', 1, 0, '2025-01-10 06:35:51', '2025-01-10 06:35:51', '103.1.100.226');

-- --------------------------------------------------------

--
-- Table structure for table `inquiry`
--

CREATE TABLE `inquiry` (
  `inquiry_id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `mobileNumber` varchar(12) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `message` text,
  `strIp` varchar(50) NOT NULL,
  `iStatus` int(11) NOT NULL DEFAULT '1',
  `isDelete` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inquiry`
--

INSERT INTO `inquiry` (`inquiry_id`, `name`, `mobileNumber`, `email`, `message`, `strIp`, `iStatus`, `isDelete`, `created_at`, `updated_at`) VALUES
(1, 'Mihir Rathod', '9874563210', 'mihir@gmial.com', 'Test Apollo Infotech', '103.1.100.226', 1, 0, '2024-03-27 12:57:20', NULL),
(2, 'Mihir Rathod', '9874563210', 'mihir@gmial.com', 'Test Apollo Infotech', '103.1.100.226', 1, 0, '2024-03-27 12:57:52', NULL),
(3, 'Tarang Parmar', '8888888888', 'tarang@gmail.com', 'Test Apollo Infotech', '103.1.100.226', 1, 0, '2024-03-27 12:59:57', NULL),
(4, 'Tarang Parmar', '8888888888', 'tarang@gmail.com', 'Test Apollo Infotech', '103.1.100.226', 1, 0, '2024-03-27 13:02:26', NULL),
(5, 'Mihir Rathod', '9874563210', 'mihir@gmail.com', 'Test Apollo Infotech', '103.1.100.226', 1, 0, '2024-03-29 06:56:07', NULL),
(6, 'test test', '4154421457', 'kashyap1790@gmail.com', 'gvhgbvjvbjhbjb jnmb jmbjvdrdyhvfcvjgbguygyfyiknwjdoajdoakfpakpdkadfoafkoejf', '103.1.100.226', 1, 0, '2024-04-16 11:02:35', NULL),
(7, 'atest test', '3214254635', 'kashyap1790@gmail.com', 'dslfmsklgmsdlfmlsmfldmzvlnfkaslfmm,c zxv  ,c', '103.1.100.226', 1, 0, '2024-04-16 11:53:28', NULL),
(8, 'Test Apollo Infotech', '9878787878', 'test@gmail.com', 'Test APollo Infotech', '103.1.100.226', 1, 0, '2024-04-17 07:18:37', NULL),
(9, 'Mihir Rathod', '9898989898', 'test@gmail.com', 'Test', '103.1.100.226', 1, 0, '2024-04-25 10:45:41', NULL),
(10, 'Mihir Rathod', '9874563210', 'mihir@gmial.com', 'Test', '103.1.100.226', 1, 0, '2024-04-25 10:46:58', NULL),
(11, 'Bansari Patel', '9987654321', 'dev1.apolloinfotech@gmail.com', 'test mail', '103.1.100.226', 1, 0, '2024-04-27 09:06:58', NULL),
(12, 'Bansari Patel', '9987654321', 'dev1.apolloinfotech@gmail.com', 'test mail message.', '103.1.100.226', 1, 0, '2024-05-02 05:44:55', NULL),
(13, 'Bansari Patel', '9876543210', 'bansipatel4041@gmail.com', 'Test mail message', '103.1.100.226', 1, 0, '2024-05-02 06:16:56', NULL),
(14, 'Bansi Patel', '7896543210', 'bansaripatel1830@gmail.com', 'Test mail.', '103.1.100.226', 1, 0, '2024-05-02 06:18:13', NULL),
(15, 'Bansari Patel', '9987654321', 'dev1.apolloinfotech@gmail.com', 'Test mail message', '103.1.100.226', 1, 0, '2024-05-02 08:38:13', NULL),
(16, 'Chris K.', '3128780396', 'pat@aneesho.com', 'Do you need help with graphic design - brochures, banners, flyers, advertisements, social media posts, logos etc.?\r\n\r\nWe charge a low fixed monthly fee. Let me know if you\'re interested and would like to see our portfolio.', '223.185.29.178', 1, 0, '2024-09-03 05:55:23', NULL),
(17, 'Deep Bhakta', '9727417328', 'deepbhakta1993@gmail.com', 'I have been user of Navdeep Chakki. I am looking for wheels replacement, old one damaged.How do I reach you.', '103.178.24.33', 1, 0, '2024-09-09 05:03:28', NULL),
(18, 'Parvatiya pragnesh', '9913552568', 'pragneshparvatiya@gmail.com', 'I need wheels of aata maker..', '49.43.34.93', 1, 0, '2024-09-12 08:33:45', NULL),
(19, 'Smita Sangodkar', '8553829063', 'sums611@gmail.com', 'We have a Navdeep Attamaster 1HP motor model, we would like to know if you have any\r\nAuthorised reseller or sevice centre in Goa. \r\nThe one we had purchased from is closed. \r\n\r\nThanks and regards, \r\nSmita Sangodkar\r\nPorvorim, Bardez, \r\nNorth-Goa, Goa-403521', '152.58.22.137', 1, 0, '2024-09-26 05:58:13', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `itemcategory`
--

CREATE TABLE `itemcategory` (
  `iItemCategoryId` int(11) NOT NULL,
  `strItemCategoryName` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `strIP` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isDelete` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `itemcategory`
--

INSERT INTO `itemcategory` (`iItemCategoryId`, `strItemCategoryName`, `strIP`, `isDelete`) VALUES
(1, 'Order Form 1', NULL, 0),
(2, 'Order Form 2', NULL, 0),
(3, 'Order Form 3', NULL, 0),
(4, 'Order Form 4', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `itemmaster`
--

CREATE TABLE `itemmaster` (
  `iItemMasterId` int(11) NOT NULL,
  `strItemMasterName` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `iItemCategoryId` int(11) NOT NULL DEFAULT '0',
  `iItemSubCategoryId` int(11) NOT NULL DEFAULT '0',
  `iSequenceNo` int(11) DEFAULT '1000',
  `iStatus` int(11) NOT NULL DEFAULT '1',
  `isDelete` int(11) NOT NULL DEFAULT '0',
  `strIP` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `itemmaster`
--

INSERT INTO `itemmaster` (`iItemMasterId`, `strItemMasterName`, `iItemCategoryId`, `iItemSubCategoryId`, `iSequenceNo`, `iStatus`, `isDelete`, `strIP`, `created_at`, `updated_at`) VALUES
(1, 'shak bhaji', 1, 0, 1, 1, 0, '127.0.0.1', '2024-11-13 08:33:33', '2024-11-13 08:33:33'),
(2, 'dudh dahi', 1, 0, 2, 1, 0, '127.0.0.1', '2024-11-13 08:35:34', '2024-11-22 05:21:49'),
(3, 'Vasan', 1, 0, 3, 1, 0, '127.0.0.1', '2024-11-13 08:36:51', '2024-11-13 09:03:34'),
(5, 'Fruits', 1, 0, 4, 1, 0, '127.0.0.1', '2024-11-13 09:13:18', '2024-11-13 09:13:18'),
(6, 'Desi Methu', 2, 1, 1, 1, 0, '127.0.0.1', '2024-11-16 10:15:17', '2024-11-16 10:15:17'),
(7, 'Tata Methu', 2, 1, 1, 1, 0, '127.0.0.1', '2024-11-16 10:15:27', '2024-11-16 10:15:27'),
(8, 'Oil', 2, 1, 1, 1, 0, '127.0.0.1', '2024-11-16 10:15:35', '2024-11-16 10:15:35'),
(9, 'Suger', 2, 1, 5, 1, 0, '127.0.0.1', '2024-11-16 10:15:50', '2024-11-16 10:15:50'),
(10, 'Tea - Coffee', 2, 1, 7, 1, 0, '127.0.0.1', '2024-11-16 10:16:14', '2024-11-16 10:16:14'),
(11, 'Gas na batla', 3, 2, 1, 1, 0, '127.0.0.1', '2024-11-16 10:16:37', '2024-11-16 10:16:37'),
(12, 'Kantan', 3, 2, 2, 1, 0, '127.0.0.1', '2024-11-16 10:16:47', '2024-11-16 10:16:47'),
(13, 'Madarpat', 3, 2, 3, 1, 0, '127.0.0.1', '2024-11-16 10:17:01', '2024-11-16 10:17:01'),
(14, 'Topliyo', 3, 2, 4, 1, 0, '127.0.0.1', '2024-11-16 10:17:12', '2024-11-16 10:17:12'),
(15, 'Waiter Shirts', 3, 3, 5, 1, 0, '127.0.0.1', '2024-11-16 10:21:23', '2024-11-28 06:05:44'),
(16, 'Waiter suit', 3, 3, 6, 1, 0, '127.0.0.1', '2024-11-16 10:21:44', '2024-11-26 05:22:19'),
(17, 'kothmir', 3, 4, 1, 1, 0, '127.0.0.1', '2024-11-16 10:22:13', '2024-11-16 10:23:41'),
(18, 'Marcha', 3, 4, 2, 1, 0, '127.0.0.1', '2024-11-16 10:22:30', '2024-11-16 10:22:30'),
(19, 'Aadu', 3, 4, 3, 1, 0, '127.0.0.1', '2024-11-16 10:23:29', '2024-11-16 10:23:29'),
(20, 'Limdo', 3, 4, 4, 1, 0, '127.0.0.1', '2024-11-16 10:23:35', '2024-11-16 10:23:35'),
(22, 'samosa patti', 1, 0, 5, 1, 0, '103.1.100.226', '2024-11-22 05:51:42', '2024-11-28 06:06:50'),
(23, 'pani puri', 1, 0, 3, 1, 0, '103.1.100.226', '2024-11-22 05:52:07', '2024-11-22 05:52:07'),
(24, 'juice - coffee', 1, 0, 4, 1, 0, '103.1.100.226', '2024-11-22 05:52:42', '2024-11-22 05:52:42'),
(25, 'Bisleri Pani bottle', 1, 0, 5, 1, 0, '103.1.100.226', '2024-11-22 05:53:20', '2024-11-22 05:53:20'),
(26, 'suit boy', 1, 0, 6, 1, 0, '103.1.100.226', '2024-11-22 05:53:43', '2024-11-26 05:22:46');

-- --------------------------------------------------------

--
-- Table structure for table `itemorder`
--

CREATE TABLE `itemorder` (
  `iItemOrderId` int(11) NOT NULL,
  `iItemMasterId` int(11) NOT NULL DEFAULT '0',
  `iCustomerId` int(11) NOT NULL DEFAULT '0',
  `strPreviousDays` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `strMoring` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `strAfternoon` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `strEvening` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `iStatus` int(11) NOT NULL DEFAULT '1',
  `isDelete` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `strIP` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `itemorder`
--

INSERT INTO `itemorder` (`iItemOrderId`, `iItemMasterId`, `iCustomerId`, `strPreviousDays`, `strMoring`, `strAfternoon`, `strEvening`, `iStatus`, `isDelete`, `created_at`, `updated_at`, `strIP`) VALUES
(2, 1, 2, '1', '1', '2', '2', 1, 0, '2024-11-18 12:27:48', '2024-11-18 12:27:48', '127.0.0.1'),
(3, 8, 2, NULL, NULL, NULL, NULL, 1, 0, '2024-11-18 14:02:33', '2024-11-18 14:02:33', '127.0.0.1'),
(4, 3, 2, '50', '5', '5', '5', 1, 0, '2024-11-28 07:16:39', '2024-11-28 07:18:03', '103.1.100.226'),
(7, 1, 5, '150', '10', '10', '0', 1, 0, '2024-12-17 09:05:15', '2024-12-17 09:05:15', '42.105.172.82'),
(8, 25, 5, '10', '15', '10', '5', 1, 0, '2025-01-10 06:44:47', '2025-01-10 06:44:47', '103.1.100.226');

-- --------------------------------------------------------

--
-- Table structure for table `itemsubcategory`
--

CREATE TABLE `itemsubcategory` (
  `iItemSubCategoryId` int(11) NOT NULL,
  `iItemCategoryId` int(11) NOT NULL DEFAULT '0',
  `strItemSubCategoryName` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isDelete` int(11) NOT NULL DEFAULT '0',
  `strIP` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `itemsubcategory`
--

INSERT INTO `itemsubcategory` (`iItemSubCategoryId`, `iItemCategoryId`, `strItemSubCategoryName`, `isDelete`, `strIP`) VALUES
(1, 2, 'General Masala', 0, NULL),
(2, 3, 'Parchuran', 0, NULL),
(3, 3, 'Dresses', 0, NULL),
(4, 3, 'Lilo Masalo', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_01_12_173356_create_permission_tables', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orderformdetails`
--

CREATE TABLE `orderformdetails` (
  `iOrderFormDetailsId` int(11) NOT NULL,
  `iOrderFormMasterId` int(11) NOT NULL DEFAULT '0',
  `iItemCategoryId` int(11) NOT NULL DEFAULT '0',
  `iItemSubCategoryId` int(11) NOT NULL DEFAULT '0',
  `iItemMasterId` int(11) NOT NULL DEFAULT '0',
  `strCount` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `strKG` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `strGram` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `strIP` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isDelete` int(11) NOT NULL DEFAULT '0',
  `iStatus` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `orderformdetails`
--

INSERT INTO `orderformdetails` (`iOrderFormDetailsId`, `iOrderFormMasterId`, `iItemCategoryId`, `iItemSubCategoryId`, `iItemMasterId`, `strCount`, `strKG`, `strGram`, `strIP`, `isDelete`, `iStatus`, `created_at`, `updated_at`) VALUES
(4, 6, 3, 3, 16, '20', NULL, NULL, '127.0.0.1', 0, 1, '2024-11-19 07:29:27', '2024-11-19 07:29:27'),
(5, 7, 2, 1, 6, NULL, '5', '5', '127.0.0.1', 0, 1, '2024-11-19 08:50:41', '2024-11-19 08:50:41'),
(6, 8, 3, 4, 20, NULL, '2', '2', '127.0.0.1', 0, 1, '2024-11-19 08:51:01', '2024-11-19 08:51:01'),
(7, 9, 3, 2, 11, '2', NULL, NULL, '127.0.0.1', 0, 1, '2024-11-19 08:54:07', '2024-11-19 08:54:07'),
(8, 10, 2, 1, 7, NULL, '3', '3', '127.0.0.1', 0, 1, '2024-11-19 08:58:07', '2024-11-19 08:58:07'),
(9, 11, 3, 4, 17, NULL, '5', '5', '127.0.0.1', 0, 1, '2024-11-19 09:27:41', '2024-11-19 09:27:41'),
(11, 13, 3, 2, 12, '5', NULL, NULL, '103.1.100.226', 0, 1, '2024-11-22 11:52:38', '2024-11-22 11:52:38'),
(12, 14, 3, 3, 15, '5', NULL, NULL, '103.1.100.226', 0, 1, '2024-11-22 12:12:22', '2024-11-22 12:12:22'),
(14, 15, 3, 2, 11, '5', NULL, NULL, '103.1.100.226', 0, 1, '2024-11-30 05:45:11', '2024-11-30 05:45:11'),
(16, 6, 3, 2, 14, '20', NULL, NULL, '103.1.100.226', 0, 1, '2024-11-30 05:50:39', '2024-11-30 05:50:39'),
(17, 15, 3, 2, 14, '5', NULL, NULL, '103.1.100.226', 0, 1, '2024-11-30 05:51:45', '2024-11-30 05:51:45'),
(18, 15, 3, 3, 15, '5', NULL, NULL, '103.1.100.226', 0, 1, '2024-11-30 05:52:46', '2024-11-30 05:52:46'),
(20, 17, 2, 1, 6, NULL, '5', NULL, '103.1.100.226', 0, 1, '2024-12-27 09:27:50', '2024-12-27 09:27:50'),
(21, 17, 2, 1, 8, NULL, '15', NULL, '103.1.100.226', 0, 1, '2024-12-27 09:27:50', '2024-12-27 09:27:50'),
(22, 17, 2, 1, 9, NULL, '10', NULL, '103.1.100.226', 0, 1, '2024-12-27 09:27:50', '2024-12-27 09:27:50'),
(23, 17, 2, 1, 10, NULL, '2', NULL, '103.1.100.226', 0, 1, '2024-12-27 09:27:50', '2024-12-27 09:27:50'),
(24, 17, 3, 2, 11, '2', NULL, NULL, '103.1.100.226', 0, 1, '2024-12-27 09:27:50', '2024-12-27 09:27:50'),
(25, 17, 3, 2, 12, '15', NULL, NULL, '103.1.100.226', 0, 1, '2024-12-27 09:27:50', '2024-12-27 09:27:50'),
(26, 17, 3, 2, 13, '5', NULL, NULL, '103.1.100.226', 0, 1, '2024-12-27 09:27:50', '2024-12-27 09:27:50'),
(27, 17, 3, 2, 14, '25', NULL, NULL, '103.1.100.226', 0, 1, '2024-12-27 09:27:50', '2024-12-27 09:27:50'),
(28, 17, 3, 3, 15, '2', NULL, NULL, '103.1.100.226', 0, 1, '2024-12-27 09:27:50', '2024-12-27 09:27:50'),
(29, 17, 3, 3, 16, '2', NULL, NULL, '103.1.100.226', 0, 1, '2024-12-27 09:27:50', '2024-12-27 09:27:50'),
(30, 17, 3, 4, 17, NULL, '2', NULL, '103.1.100.226', 0, 1, '2024-12-27 09:27:50', '2024-12-27 09:27:50'),
(31, 17, 3, 4, 18, NULL, '5', NULL, '103.1.100.226', 0, 1, '2024-12-27 09:27:50', '2024-12-27 09:27:50'),
(32, 17, 3, 4, 19, NULL, '2', NULL, '103.1.100.226', 0, 1, '2024-12-27 09:27:50', '2024-12-27 09:27:50'),
(33, 17, 3, 4, 20, NULL, '3', NULL, '103.1.100.226', 0, 1, '2024-12-27 09:27:50', '2024-12-27 09:27:50');

-- --------------------------------------------------------

--
-- Table structure for table `orderformmaster`
--

CREATE TABLE `orderformmaster` (
  `iOrderFormMasterId` int(11) NOT NULL,
  `iType` int(11) NOT NULL DEFAULT '0',
  `iCustomerId` int(11) NOT NULL DEFAULT '0',
  `strCustomerName` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `iPhoneNo` bigint(20) NOT NULL DEFAULT '0',
  `iPhoneNoHome` bigint(20) NOT NULL DEFAULT '0',
  `strDeliveryAddress` text COLLATE utf8_unicode_ci,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `strIP` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isDelete` int(11) NOT NULL DEFAULT '0',
  `iStatus` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `orderformmaster`
--

INSERT INTO `orderformmaster` (`iOrderFormMasterId`, `iType`, `iCustomerId`, `strCustomerName`, `iPhoneNo`, `iPhoneNoHome`, `strDeliveryAddress`, `updated_at`, `created_at`, `strIP`, `isDelete`, `iStatus`) VALUES
(6, 0, 2, 'Tarang Parmar', 7046673769, 0, 'E-302, Sai Green Valley -1, Ghuma - Bopal - 380058', '2024-11-19 07:29:27', '2024-11-19 07:29:27', '127.0.0.1', 0, 1),
(7, 0, 2, 'Tarang Parmar', 7046673769, 0, 'E-302, Sai Green Valley -1, Ghuma - Bopal - 380058', '2024-11-19 08:50:41', '2024-11-19 08:50:41', '127.0.0.1', 0, 1),
(8, 0, 2, 'Tarang Parmar', 7046673769, 0, 'E-302, Sai Green Valley -1, Ghuma - Bopal - 380058', '2024-11-19 08:51:01', '2024-11-19 08:51:01', '127.0.0.1', 0, 1),
(9, 0, 2, 'Tarang Parmar', 7046673769, 0, 'E-302, Sai Green Valley -1, Ghuma - Bopal - 380058', '2024-11-19 08:54:07', '2024-11-19 08:54:07', '127.0.0.1', 0, 1),
(10, 0, 2, 'Tarang Parmar', 7046673769, 0, 'E-302, Sai Green Valley -1, Ghuma - Bopal - 380058', '2024-11-19 08:58:07', '2024-11-19 08:58:07', '127.0.0.1', 0, 1),
(11, 0, 2, 'Tarang Parmar', 7046673769, 0, 'E-302, Sai Green Valley -1, Ghuma - Bopal - 380058', '2024-11-19 09:27:41', '2024-11-19 09:27:41', '127.0.0.1', 0, 1),
(13, 0, 2, 'Tarang Parmar', 7046673769, 2222222222, 'E-302, Sai Green Valley -1, Ghuma - Bopal - 380058', '2024-11-22 11:52:38', '2024-11-22 11:52:38', '103.1.100.226', 0, 1),
(14, 0, 2, 'Tarang Parmar', 7046673769, 2222222222, 'E-302, Sai Green Valley -1, Ghuma - Bopal - 380058', '2024-11-22 12:12:22', '2024-11-22 12:12:22', '103.1.100.226', 0, 1),
(15, 0, 3, 'Test Apollo Mihir', 9999999999, 9837013233, 'A-1 , Anubhav Flat , bhairavnath cross road , Maninagar , Ahmedabad\r\ntt', '2024-11-30 05:45:11', '2024-11-30 05:45:11', '103.1.100.226', 0, 1),
(17, 0, 5, 'Krunal Shah', 9824773136, 0, 'D/11, Lalita Society, Isnapur, Ahmedabd', '2024-12-27 09:27:50', '2024-12-27 09:27:50', '103.1.100.226', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'user-list', 'web', '2022-09-12 04:33:06', '2022-09-12 04:33:06'),
(2, 'user-create', 'web', '2022-09-12 04:33:06', '2022-09-12 04:33:06'),
(3, 'user-edit', 'web', '2022-09-12 04:33:06', '2022-09-12 04:33:06'),
(4, 'user-delete', 'web', '2022-09-12 04:33:06', '2022-09-12 04:33:06'),
(5, 'role-create', 'web', '2022-09-12 04:33:06', '2022-09-12 04:33:06'),
(6, 'role-edit', 'web', '2022-09-12 04:33:06', '2022-09-12 04:33:06'),
(7, 'role-list', 'web', '2022-09-12 04:33:06', '2022-09-12 04:33:06'),
(8, 'role-delete', 'web', '2022-09-12 04:33:06', '2022-09-12 04:33:06'),
(9, 'permission-list', 'web', '2022-09-12 04:33:06', '2022-09-12 04:33:06'),
(10, 'permission-create', 'web', '2022-09-12 04:33:06', '2022-09-12 04:33:06'),
(11, 'permission-edit', 'web', '2022-09-12 04:33:06', '2022-09-12 04:33:06'),
(12, 'permission-delete', 'web', '2022-09-12 04:33:06', '2022-09-12 04:33:06');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `photo_gallery`
--

CREATE TABLE `photo_gallery` (
  `photoGalleryId` int(11) NOT NULL,
  `strTitle` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `iStatus` int(11) NOT NULL DEFAULT '1',
  `isDelete` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `strIP` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `photo_gallery`
--

INSERT INTO `photo_gallery` (`photoGalleryId`, `strTitle`, `photo`, `iStatus`, `isDelete`, `created_at`, `updated_at`, `strIP`) VALUES
(16, 'VICTOR RED', '1711957543.jpg', 1, 0, '2024-04-01 07:45:43', '2024-04-01 07:45:43', '103.1.100.226'),
(17, 'VICTOR BROWN', '1711957782.jpg', 1, 0, '2024-04-01 07:49:42', '2024-04-01 07:49:42', '103.1.100.226'),
(18, 'VICTOR BLUE', '1711957818.jpg', 1, 0, '2024-04-01 07:50:18', '2024-04-01 07:50:18', '103.1.100.226'),
(20, 'ROYAL VINIYER', '1711960507.jpg', 1, 0, '2024-04-01 08:35:07', '2024-04-01 08:35:07', '103.1.100.226'),
(21, 'ROYAL DARK BROWN', '1711960567.jpg', 1, 0, '2024-04-01 08:36:07', '2024-04-01 08:36:07', '103.1.100.226'),
(22, 'NEO VINIYER', '1711960666.jpg', 1, 0, '2024-04-01 08:37:46', '2024-04-01 08:37:46', '103.1.100.226'),
(23, 'NEO WHITE FL', '1711960727.jpg', 1, 0, '2024-04-01 08:38:47', '2024-04-01 08:38:47', '103.1.100.226'),
(26, 'NEO FEATHER WHITE HG', '1711960930.jpg', 1, 0, '2024-04-01 08:42:10', '2024-04-01 08:42:10', '103.1.100.226'),
(27, 'NEO FEATHER GREEN HG', '1711961006.jpg', 1, 0, '2024-04-01 08:43:26', '2024-04-01 08:43:26', '103.1.100.226'),
(28, 'NEO FEATHER BLACK HG', '1711961105.jpg', 1, 0, '2024-04-01 08:45:05', '2024-04-01 08:45:05', '103.1.100.226'),
(29, 'NEO DARK BROWN', '1711961206.jpg', 1, 0, '2024-04-01 08:46:46', '2024-04-01 08:46:46', '103.1.100.226'),
(30, 'IRIS HAZEL FL', '1711961275.jpg', 1, 0, '2024-04-01 08:47:55', '2024-04-01 08:47:55', '103.1.100.226'),
(31, 'IRIS GREY FL', '1711961338.jpg', 1, 0, '2024-04-01 08:48:58', '2024-04-01 08:48:58', '103.1.100.226'),
(32, 'IRIS BLACK FL', '1711961430.jpg', 1, 0, '2024-04-01 08:50:30', '2024-04-01 08:50:30', '103.1.100.226'),
(33, 'HGL WHITE FL 6 KG', '1711961523.jpg', 1, 0, '2024-04-01 08:52:03', '2024-04-01 08:52:03', '103.1.100.226'),
(45, 'HGL BLACK SQUARE', '1711962409.jpg', 1, 0, '2024-04-01 09:06:49', '2024-04-01 09:06:49', '103.1.100.226'),
(48, 'HGL 6 KG GOLD APPLE', '1712117738.jpg', 1, 0, '2024-04-03 04:15:38', '2024-04-03 04:15:38', '103.1.100.226'),
(49, 'HGL COCO BLACK', '1712559321.jpg', 1, 0, '2024-04-08 06:55:21', '2024-04-08 06:55:21', '103.1.100.226'),
(50, '3D DOLPHIN', '1712559509.jpg', 1, 0, '2024-04-08 06:58:29', '2024-04-08 06:58:29', '103.1.100.226'),
(53, 'NOVA SILKY', '1712559686.jpg', 1, 0, '2024-04-08 07:01:26', '2024-04-08 07:01:26', '103.1.100.226'),
(54, 'NOVA CIRCLE', '1713347068.jpg', 1, 0, '2024-04-17 09:44:28', '2024-04-17 09:44:28', '103.1.100.226'),
(55, 'VICTOR BROWN VC', '1713512246.jpg', 1, 0, '2024-04-19 07:37:26', '2024-04-19 07:37:26', '103.1.100.226'),
(56, 'FLOURISH FLOWER GREY VC', '1713774712.jpg', 1, 0, '2024-04-22 08:31:52', '2024-04-22 08:31:52', '103.1.100.226'),
(57, '3D PARACHUTE', '1713774768.jpg', 1, 0, '2024-04-22 08:32:48', '2024-04-22 08:32:48', '103.1.100.226'),
(58, '3D SPARROW', '1713774813.jpg', 1, 0, '2024-04-22 08:33:33', '2024-04-22 08:33:33', '103.1.100.226'),
(59, 'CRYSTAL+ MARBLE', '1713774851.jpg', 1, 0, '2024-04-22 08:34:11', '2024-04-22 08:34:11', '103.1.100.226'),
(60, 'CRYSTAL+ BUBBLE', '1713774883.jpg', 1, 0, '2024-04-22 08:34:43', '2024-04-22 08:34:43', '103.1.100.226'),
(61, 'NEO WHITE FLOWER', '1713774913.jpg', 1, 0, '2024-04-22 08:35:13', '2024-04-22 08:35:13', '103.1.100.226'),
(62, 'FLOURISH+ RED ROSE', '1713774940.jpg', 1, 0, '2024-04-22 08:35:40', '2024-04-22 08:35:40', '103.1.100.226'),
(63, 'FLOURISH+ BLUE FLOWER', '1713774957.jpg', 1, 0, '2024-04-22 08:35:57', '2024-04-22 08:35:57', '103.1.100.226'),
(66, 'HGL WHITE LOTUS', '1713863525.jpg', 1, 0, '2024-04-23 09:12:05', '2024-04-23 09:12:05', '103.1.100.226'),
(67, 'ECO APPLE', '1713863851.png', 1, 0, '2024-04-23 09:17:31', '2024-04-23 09:17:31', '103.1.100.226'),
(68, 'ECO ORCHID', '1713865201.png', 1, 0, '2024-04-23 09:40:01', '2024-04-23 09:40:01', '103.1.100.226');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `productId` int(11) NOT NULL,
  `strSequenceNo` int(11) NOT NULL DEFAULT '1000',
  `categoryId` int(11) NOT NULL DEFAULT '0',
  `iSubCategoryId` int(11) NOT NULL DEFAULT '0',
  `productname` varchar(255) DEFAULT NULL,
  `slugname` varchar(1000) DEFAULT NULL,
  `description` text,
  `iStatus` int(11) NOT NULL DEFAULT '1',
  `isDelete` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `strIP` varchar(255) DEFAULT NULL,
  `meta_title` text,
  `meta_description` text,
  `ShowHomePage` varchar(255) DEFAULT NULL,
  `showOnFooter` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`productId`, `strSequenceNo`, `categoryId`, `iSubCategoryId`, `productname`, `slugname`, `description`, `iStatus`, `isDelete`, `created_at`, `updated_at`, `strIP`, `meta_title`, `meta_description`, `ShowHomePage`, `showOnFooter`) VALUES
(1, 1, 2, 4, 'Narangi Juice', 'narangi-juice', NULL, 1, 0, '2024-11-15 06:29:49', '2024-11-15 06:32:34', '127.0.0.1', NULL, NULL, NULL, 0),
(2, 2, 2, 4, 'Mosambi juice', 'mosambi-juice', NULL, 1, 0, '2024-11-15 06:32:22', '2024-11-15 06:32:22', '127.0.0.1', NULL, NULL, NULL, 0),
(3, 3, 2, 4, 'Ganga Jamuna Juice', 'ganga-jamuna-juice', NULL, 1, 0, '2024-11-15 06:33:30', '2024-11-15 06:33:30', '127.0.0.1', NULL, NULL, NULL, 0),
(4, 1, 2, 5, 'Cocktail Juice', 'cocktail-juice', NULL, 1, 0, '2024-11-15 06:34:04', '2024-11-15 06:37:18', '127.0.0.1', NULL, NULL, NULL, 0),
(5, 2, 2, 5, 'Mix Fruit Juice', 'mix-fruit-juice', NULL, 1, 0, '2024-11-15 06:37:45', '2024-11-15 06:37:45', '127.0.0.1', NULL, NULL, NULL, 0),
(6, 1, 2, 6, 'Orange Cooler', 'orange-cooler', NULL, 1, 0, '2024-11-15 06:38:18', '2024-11-15 06:38:18', '127.0.0.1', NULL, NULL, NULL, 0),
(7, 2, 2, 6, 'Pineapple Cooler', 'pineapple-cooler', NULL, 1, 0, '2024-11-15 06:38:50', '2024-11-15 06:38:50', '127.0.0.1', NULL, NULL, NULL, 0),
(8, 1, 2, 7, 'Kaju Anjeer Milkshake', 'kaju-anjeer-milkshake', NULL, 1, 0, '2024-11-15 06:39:28', '2024-11-15 06:39:28', '127.0.0.1', NULL, NULL, NULL, 0),
(9, 2, 2, 7, 'Kaju Milkshake', 'kaju-milkshake', NULL, 1, 0, '2024-11-15 06:39:43', '2024-11-15 06:39:43', '127.0.0.1', NULL, NULL, NULL, 0),
(10, 1, 3, 8, 'Vegetable Stick', 'vegetable-stick', NULL, 1, 0, '2024-11-15 06:40:26', '2024-11-15 06:40:26', '127.0.0.1', NULL, NULL, NULL, 0),
(11, 2, 3, 8, 'Paneer Cheese Balls', 'paneer-cheese-balls', NULL, 1, 0, '2024-11-15 06:41:02', '2024-11-15 06:41:02', '127.0.0.1', NULL, NULL, NULL, 0),
(12, 1, 3, 9, 'Dahiwada', 'dahiwada', NULL, 1, 0, '2024-11-15 06:41:22', '2024-11-15 06:41:22', '127.0.0.1', NULL, NULL, NULL, 0),
(13, 2, 3, 9, 'Macaroni Wada', 'macaroni-wada', NULL, 1, 0, '2024-11-15 06:42:38', '2024-11-15 06:42:38', '127.0.0.1', NULL, NULL, NULL, 0),
(14, 7, 3, 10, 'Makai Roll', 'makai-roll', NULL, 1, 0, '2024-11-15 06:43:54', '2024-12-02 11:13:50', '127.0.0.1', NULL, NULL, NULL, 0),
(15, 8, 3, 10, 'Cheese Palak Toast', 'cheese-palak-toast', NULL, 1, 0, '2024-11-15 06:45:01', '2024-12-02 11:14:15', '127.0.0.1', NULL, NULL, NULL, 0),
(16, 1, 3, 11, 'Aloo Tikki', 'aloo-tikki', NULL, 1, 0, '2024-11-15 06:45:29', '2024-11-15 06:45:29', '127.0.0.1', NULL, NULL, NULL, 0),
(17, 2, 3, 11, 'Corn Tikki', 'corn-tikki', NULL, 1, 0, '2024-11-15 06:46:01', '2024-11-15 06:46:01', '127.0.0.1', NULL, NULL, NULL, 0),
(18, 1, 3, 12, 'Dahi Papdi Chaat', 'dahi-papdi-chaat', NULL, 1, 0, '2024-11-15 06:46:20', '2024-11-15 06:46:20', '127.0.0.1', NULL, NULL, NULL, 0),
(19, 2, 3, 12, 'Dahi Rajbhog Chaat', 'dahi-rajbhog-chaat', NULL, 1, 0, '2024-11-15 06:46:47', '2024-11-15 06:46:47', '127.0.0.1', NULL, NULL, NULL, 0),
(20, 1, 3, 13, 'Maxican Tavaa', 'maxican-tavaa', NULL, 1, 0, '2024-11-15 06:47:08', '2024-11-15 06:47:08', '127.0.0.1', NULL, NULL, NULL, 0),
(21, 1, 3, 14, 'Paneer Chilla', 'paneer-chilla', NULL, 1, 0, '2024-11-15 06:47:25', '2024-11-15 06:47:25', '127.0.0.1', NULL, NULL, NULL, 0),
(22, 1, 3, 15, 'Rava Dosa', 'rava-dosa', NULL, 1, 0, '2024-11-15 06:47:49', '2024-11-15 06:47:49', '127.0.0.1', NULL, NULL, NULL, 0),
(23, 1, 3, 16, 'Paneer jalebi', 'paneer-jalebi', NULL, 1, 0, '2024-11-15 06:48:13', '2024-11-15 06:48:13', '127.0.0.1', NULL, NULL, NULL, 0),
(24, 2, 3, 16, 'Corn jalebi', 'corn-jalebi', NULL, 1, 0, '2024-11-15 06:48:23', '2024-11-15 06:48:23', '127.0.0.1', NULL, NULL, NULL, 0),
(25, 1, 4, 0, 'Tomato Soup Bread Pics', 'tomato-soup-bread-pics', NULL, 1, 0, '2024-11-15 06:50:59', '2024-11-15 06:50:59', '127.0.0.1', NULL, NULL, NULL, 0),
(26, 2, 4, 0, 'Minestrone Soup', 'minestrone-soup', NULL, 1, 0, '2024-11-15 06:51:39', '2024-11-15 06:51:39', '127.0.0.1', NULL, NULL, NULL, 0),
(27, 1, 5, 17, 'Veg. Hakka Noodles', 'veg.-hakka-noodles', NULL, 1, 0, '2024-11-15 06:52:15', '2024-11-15 06:52:15', '127.0.0.1', NULL, NULL, NULL, 0),
(28, 2, 5, 17, 'Veg. Fried Rice', 'veg.-fried-rice', NULL, 1, 0, '2024-11-15 06:52:50', '2024-11-15 06:52:50', '127.0.0.1', NULL, NULL, NULL, 0),
(29, 1, 5, 18, 'Veg. Manchurian', 'veg.-manchurian', NULL, 1, 0, '2024-11-15 06:53:32', '2024-11-15 06:53:32', '127.0.0.1', NULL, NULL, NULL, 0),
(30, 2, 5, 18, 'Veg. Chilli', 'veg.-chilli', NULL, 1, 0, '2024-11-15 06:53:46', '2024-11-15 06:53:46', '127.0.0.1', NULL, NULL, NULL, 0),
(31, 1, 5, 19, 'Veg. HakkaNoodles', 'veg.-hakkanoodles', NULL, 1, 0, '2024-11-15 06:54:27', '2024-11-15 06:54:27', '127.0.0.1', NULL, NULL, NULL, 0),
(32, 1, 5, 19, 'Veg. Schezwan Noodles', 'veg.-schezwan-noodles', NULL, 1, 0, '2024-11-15 06:55:09', '2024-11-15 06:55:09', '127.0.0.1', NULL, NULL, NULL, 0),
(33, 1, 5, 20, 'Veg. FriedRice', 'veg.-friedrice', NULL, 1, 0, '2024-11-15 06:56:03', '2024-11-15 06:56:03', '127.0.0.1', NULL, NULL, NULL, 0),
(34, 1, 6, 21, 'Sweet Sour Soup', 'sweet-sour-soup', NULL, 1, 0, '2024-11-15 06:56:39', '2024-11-15 06:56:39', '127.0.0.1', NULL, NULL, NULL, 0),
(35, 1, 6, 22, 'kabj Noodles salad', 'kabj-noodles-salad', NULL, 1, 0, '2024-11-15 06:57:37', '2024-11-15 06:57:37', '127.0.0.1', NULL, NULL, NULL, 0),
(36, 1, 6, 23, 'American Chop', 'american-chop', NULL, 1, 0, '2024-11-15 06:58:14', '2024-11-15 06:58:14', '127.0.0.1', NULL, NULL, NULL, 0),
(37, 1, 6, 24, 'Fried Rice', 'fried-rice', NULL, 1, 0, '2024-11-15 06:58:27', '2024-11-15 06:58:27', '127.0.0.1', NULL, NULL, NULL, 0),
(38, 1, 7, 25, 'Chilli Bean Soup', 'chilli-bean-soup', NULL, 1, 0, '2024-11-15 06:59:04', '2024-11-15 06:59:04', '127.0.0.1', NULL, NULL, NULL, 0),
(39, 1, 7, 26, 'Avocado Dip Corn Chips', 'avocado-dip-corn-chips', NULL, 1, 0, '2024-11-15 07:00:11', '2024-11-15 07:00:11', '127.0.0.1', NULL, NULL, NULL, 0),
(40, 1, 7, 27, 'Baritoz', 'baritoz', NULL, 1, 0, '2024-11-15 07:00:52', '2024-11-15 07:00:52', '127.0.0.1', NULL, NULL, NULL, 0),
(41, 1, 7, 28, 'Maxican Veg. Kari', 'maxican-veg.-kari', NULL, 1, 0, '2024-11-15 07:01:24', '2024-11-15 07:01:24', '127.0.0.1', NULL, NULL, NULL, 0),
(42, 1, 7, 29, 'Lasagna', 'lasagna', NULL, 1, 0, '2024-11-15 07:02:08', '2024-11-15 07:02:08', '127.0.0.1', NULL, NULL, NULL, 0),
(43, 1, 7, 30, 'Maxican Rice', 'maxican-rice', NULL, 1, 0, '2024-11-15 07:02:25', '2024-11-15 07:02:25', '127.0.0.1', NULL, NULL, NULL, 0),
(44, 1, 8, 31, 'Coconut Cream Soup', 'coconut-cream-soup', NULL, 1, 0, '2024-11-15 07:03:07', '2024-11-15 07:03:07', '127.0.0.1', NULL, NULL, NULL, 0),
(45, 1, 8, 32, 'Sweet Corn Cake with Dips', 'sweet-corn-cake-with-dips', NULL, 1, 0, '2024-11-15 07:03:55', '2024-11-15 07:03:55', '127.0.0.1', NULL, NULL, NULL, 0),
(46, 1, 8, 33, 'Papaya Salad', 'papaya-salad', NULL, 1, 0, '2024-11-15 07:04:20', '2024-11-15 07:04:20', '127.0.0.1', NULL, NULL, NULL, 0),
(47, 1, 8, 34, 'Massaman Curry', 'massaman-curry', NULL, 1, 0, '2024-11-15 07:04:46', '2024-11-15 07:04:46', '127.0.0.1', NULL, NULL, NULL, 0),
(48, 2, 8, 34, 'Green Curry', 'green-curry', NULL, 1, 0, '2024-11-15 07:05:57', '2024-11-15 07:05:57', '127.0.0.1', NULL, NULL, NULL, 0),
(49, 1, 8, 35, 'Enchilada', 'enchilada', NULL, 1, 0, '2024-11-15 07:06:29', '2024-11-15 07:06:29', '127.0.0.1', NULL, NULL, NULL, 0),
(50, 1, 8, 36, 'Thai Layered Rice', 'thai-layered-rice', NULL, 1, 0, '2024-11-15 07:07:09', '2024-11-15 07:07:09', '127.0.0.1', NULL, NULL, NULL, 0),
(51, 1, 9, 37, 'Rajwadi Basundi', 'rajwadi-basundi', NULL, 1, 0, '2024-11-15 07:07:50', '2024-11-15 07:07:50', '127.0.0.1', NULL, NULL, NULL, 0),
(52, 1, 9, 38, 'Malai Sandwich', 'malai-sandwich', NULL, 1, 0, '2024-11-15 07:08:18', '2024-11-15 07:08:18', '127.0.0.1', NULL, NULL, NULL, 0),
(53, 2, 9, 38, 'Mother India', 'mother-india', NULL, 1, 0, '2024-11-15 07:08:32', '2024-11-15 07:08:32', '127.0.0.1', NULL, NULL, NULL, 0),
(54, 2, 9, 39, 'Cream Salad', 'cream-salad', NULL, 1, 0, '2024-11-15 07:09:30', '2024-11-15 07:09:30', '127.0.0.1', NULL, NULL, NULL, 0),
(55, 1, 9, 40, 'Fruit Rabdi', 'fruit-rabdi', NULL, 1, 0, '2024-11-15 07:09:55', '2024-11-15 07:09:55', '127.0.0.1', NULL, NULL, NULL, 0),
(56, 1, 9, 41, 'Kesar Pista Rasmalai', 'kesar-pista-rasmalai', NULL, 1, 0, '2024-11-15 07:10:24', '2024-11-15 07:10:24', '127.0.0.1', NULL, NULL, NULL, 0),
(57, 1, 9, 43, 'Punchratna', 'punchratna', NULL, 1, 0, '2024-11-15 07:13:22', '2024-11-15 07:13:22', '127.0.0.1', NULL, NULL, NULL, 0),
(58, 1, 9, 44, 'Pista Ghari', 'pista-ghari', NULL, 1, 0, '2024-11-15 07:13:46', '2024-11-15 07:13:46', '127.0.0.1', NULL, NULL, NULL, 0),
(59, 2, 9, 44, 'Kaju Pista Kamal', 'kaju-pista-kamal', NULL, 1, 0, '2024-11-15 07:14:20', '2024-11-15 07:14:20', '127.0.0.1', NULL, NULL, NULL, 0),
(60, 1, 9, 45, 'Halwa Sizzler', 'halwa-sizzler', NULL, 1, 0, '2024-11-15 07:15:08', '2024-11-15 07:15:08', '127.0.0.1', NULL, NULL, NULL, 0),
(61, 2, 9, 45, 'Sahi Meva', 'sahi-meva', NULL, 1, 0, '2024-11-15 07:15:29', '2024-11-15 07:15:29', '127.0.0.1', NULL, NULL, NULL, 0),
(62, 1, 9, 46, 'Dudhpak', 'dudhpak', NULL, 1, 0, '2024-11-15 07:16:00', '2024-11-15 07:16:00', '127.0.0.1', NULL, NULL, NULL, 0),
(63, 1, 9, 47, 'Kala Jamun', 'kala-jamun', NULL, 1, 0, '2024-11-15 07:16:34', '2024-11-15 07:16:34', '127.0.0.1', NULL, NULL, NULL, 0),
(64, 2, 9, 47, 'Gulab Jamun', 'gulab-jamun', NULL, 1, 0, '2024-11-15 07:16:49', '2024-11-15 07:16:49', '127.0.0.1', NULL, NULL, NULL, 0),
(65, 1, 9, 48, 'Khajur Anjeer Vedmi', 'khajur-anjeer-vedmi', NULL, 1, 0, '2024-11-15 07:17:21', '2024-11-15 07:17:21', '127.0.0.1', NULL, NULL, NULL, 0),
(66, 2, 9, 48, 'Dal Ni Vedmi', 'dal-ni-vedmi', NULL, 1, 0, '2024-11-15 07:17:33', '2024-11-15 07:17:33', '127.0.0.1', NULL, NULL, NULL, 0),
(67, 2, 10, 49, 'Goulash soup', 'goulash-soup', NULL, 1, 0, '2024-11-15 07:18:44', '2024-11-15 07:18:44', '127.0.0.1', NULL, NULL, NULL, 0),
(68, 1, 10, 50, 'Appetizer Stuffed Fillet', 'appetizer-stuffed-fillet', NULL, 1, 0, '2024-11-15 07:20:02', '2024-11-15 07:20:02', '127.0.0.1', NULL, NULL, NULL, 0),
(69, 1, 10, 51, 'Potato Corn Dumplings', 'potato-corn-dumplings', NULL, 1, 0, '2024-11-15 07:22:05', '2024-11-15 07:22:05', '127.0.0.1', NULL, NULL, NULL, 0),
(70, 1, 10, 52, 'Beet Apple Salad', 'beet-apple-salad', NULL, 1, 0, '2024-11-15 07:23:13', '2024-11-15 07:23:13', '127.0.0.1', NULL, NULL, NULL, 0),
(71, 1, 10, 53, 'Shahi Jeera Bread', 'shahi-jeera-bread', NULL, 1, 0, '2024-11-15 07:23:43', '2024-11-15 07:23:43', '127.0.0.1', NULL, NULL, NULL, 0),
(72, 1, 10, 54, 'Venilla With Khajur Puree', 'venilla-with-khajur-puree', NULL, 1, 0, '2024-11-15 07:24:20', '2024-11-15 07:25:00', '127.0.0.1', NULL, NULL, NULL, 0),
(73, 1, 10, 55, 'Ice Cream', 'ice-cream', NULL, 1, 0, '2024-11-15 07:25:13', '2024-11-15 07:25:13', '127.0.0.1', NULL, NULL, NULL, 0),
(74, 1, 11, 56, 'Mughlai Aloo', 'mughlai-aloo', NULL, 1, 0, '2024-11-15 07:25:36', '2024-11-15 07:25:36', '127.0.0.1', NULL, NULL, NULL, 0),
(75, 2, 11, 56, 'Masala Gobi', 'masala-gobi', NULL, 1, 0, '2024-11-15 07:26:05', '2024-11-15 07:26:05', '127.0.0.1', NULL, NULL, NULL, 0),
(76, 1, 11, 57, 'Makai Ni Rotli', 'makai-ni-rotli', NULL, 1, 0, '2024-11-15 07:26:28', '2024-11-15 07:26:28', '127.0.0.1', NULL, NULL, NULL, 0),
(77, 1, 11, 58, 'Chaat Sprouted', 'chaat-sprouted', NULL, 1, 0, '2024-11-15 07:27:15', '2024-11-15 07:27:15', '127.0.0.1', NULL, NULL, NULL, 0),
(78, 1, 11, 59, 'Gujarati Dal', 'gujarati-dal', NULL, 1, 0, '2024-11-15 07:27:29', '2024-11-15 07:27:29', '127.0.0.1', NULL, NULL, NULL, 0),
(79, 1, 11, 60, 'Gujarati Curry', 'gujarati-curry', NULL, 1, 0, '2024-11-15 07:27:41', '2024-11-15 07:27:41', '127.0.0.1', NULL, NULL, NULL, 0),
(80, 1, 11, 61, 'Tajalving Bhaat', 'tajalving-bhaat', NULL, 1, 0, '2024-11-15 07:28:11', '2024-11-15 07:28:11', '127.0.0.1', NULL, NULL, NULL, 0),
(81, 1, 11, 62, '15 Varieties Mukhwas', '15-varieties-mukhwas', NULL, 1, 0, '2024-11-15 07:28:40', '2024-11-15 07:28:40', '127.0.0.1', NULL, NULL, NULL, 0),
(82, 1, 12, 63, 'Dryfruit Churma', 'dryfruit-churma', NULL, 1, 0, '2024-11-15 07:29:12', '2024-11-15 07:29:12', '127.0.0.1', NULL, NULL, NULL, 0),
(83, 1, 12, 64, 'Jodhpuri Roti', 'jodhpuri-roti', NULL, 1, 0, '2024-11-15 07:29:29', '2024-11-15 07:29:29', '127.0.0.1', NULL, NULL, NULL, 0),
(84, 1, 12, 65, 'Rajasthani Aloo', 'rajasthani-aloo', NULL, 1, 0, '2024-11-15 07:29:49', '2024-11-15 07:29:49', '127.0.0.1', NULL, NULL, NULL, 0),
(85, 2, 12, 65, 'Paneer Gatta nu Shaak', 'paneer-gatta-nu-shaak', NULL, 1, 0, '2024-11-15 07:30:23', '2024-11-15 07:30:23', '127.0.0.1', NULL, NULL, NULL, 0),
(86, 1, 12, 66, 'Bhindi Curry', 'bhindi-curry', NULL, 1, 0, '2024-11-15 07:31:15', '2024-11-15 07:31:15', '127.0.0.1', NULL, NULL, NULL, 0),
(87, 1, 12, 67, 'Dudhi nu Raitu', 'dudhi-nu-raitu', NULL, 1, 0, '2024-11-15 07:32:42', '2024-11-15 07:32:42', '127.0.0.1', NULL, NULL, NULL, 0),
(88, 1, 12, 68, 'Kanda ni kachori', 'kanda-ni-kachori', NULL, 1, 0, '2024-11-15 07:33:04', '2024-11-22 05:09:17', '127.0.0.1', NULL, NULL, NULL, 0),
(89, 1, 13, 69, 'Green Cheese Uttapam', 'green-cheese-uttapam', NULL, 1, 0, '2024-11-15 08:33:00', '2024-11-15 08:33:00', '127.0.0.1', NULL, NULL, NULL, 0),
(90, 1, 13, 70, 'Kovalam Matte', 'kovalam-matte', NULL, 1, 0, '2024-11-15 08:34:01', '2024-11-15 08:34:01', '127.0.0.1', NULL, NULL, NULL, 0),
(91, 1, 13, 71, 'Shillong Roti', 'shillong-roti', NULL, 1, 0, '2024-11-15 08:36:44', '2024-11-15 08:36:44', '127.0.0.1', NULL, NULL, NULL, 0),
(92, 1, 13, 72, 'Sambhar', 'sambhar', NULL, 1, 0, '2024-11-15 08:37:09', '2024-11-15 08:37:09', '127.0.0.1', NULL, NULL, NULL, 0),
(93, 1, 13, 73, 'Bisi Bele Huliyana', 'bisi-bele-huliyana', NULL, 1, 0, '2024-11-15 08:39:52', '2024-11-15 08:39:52', '127.0.0.1', NULL, NULL, NULL, 0),
(94, 1, 14, 74, 'Cream of Spinach', 'cream-of-spinach', NULL, 1, 0, '2024-11-15 08:40:34', '2024-11-15 08:40:34', '127.0.0.1', NULL, NULL, NULL, 0),
(95, 1, 14, 75, 'Staff Alive And Mushroom', 'staff-alive-and-mushroom', NULL, 1, 0, '2024-11-15 08:42:58', '2024-12-02 09:39:38', '127.0.0.1', NULL, NULL, NULL, 0),
(96, 1, 14, 76, 'Ravioli', 'ravioli', NULL, 1, 0, '2024-11-15 08:43:21', '2024-11-15 08:43:21', '127.0.0.1', NULL, NULL, NULL, 0),
(97, 1, 14, 77, 'Pasta Salad', 'pasta-salad', NULL, 1, 0, '2024-11-15 08:43:39', '2024-11-15 08:43:39', '127.0.0.1', NULL, NULL, NULL, 0),
(98, 1, 14, 78, 'Risotto Pasta Risotto', 'risotto-pasta-risotto', NULL, 1, 0, '2024-11-15 08:44:37', '2024-11-15 08:44:37', '127.0.0.1', NULL, NULL, NULL, 0),
(99, 1, 15, 0, 'Garam Sukhdi', 'garam-sukhdi', NULL, 1, 0, '2024-11-15 08:45:13', '2024-11-15 08:45:13', '127.0.0.1', NULL, NULL, NULL, 0),
(100, 2, 15, 0, 'Garam Magas', 'garam-magas', NULL, 1, 0, '2024-11-15 08:45:34', '2024-11-15 08:45:34', '127.0.0.1', NULL, NULL, NULL, 0),
(101, 3, 15, 0, 'Bajri Na Rotla', 'bajri-na-rotla', NULL, 1, 0, '2024-11-15 08:46:04', '2024-11-15 08:46:04', '127.0.0.1', NULL, NULL, NULL, 0),
(102, 4, 15, 0, 'Biscuit Bhakri', 'biscuit-bhakri', NULL, 1, 0, '2024-11-15 08:46:30', '2024-11-15 08:46:30', '127.0.0.1', NULL, NULL, NULL, 0),
(103, 1, 16, 79, 'Methi Matar Malai Paneer', 'methi-matar-malai-paneer', NULL, 1, 0, '2024-11-15 08:47:23', '2024-11-15 08:47:23', '127.0.0.1', NULL, NULL, NULL, 0),
(104, 2, 16, 79, 'Paneer Butter Masala', 'paneer-butter-masala', NULL, 1, 0, '2024-11-15 08:47:59', '2024-11-15 08:47:59', '127.0.0.1', NULL, NULL, NULL, 0),
(105, 3, 16, 79, 'Balti Paneer', 'balti-paneer', NULL, 1, 0, '2024-11-15 08:48:18', '2024-11-15 08:48:18', '127.0.0.1', NULL, NULL, NULL, 0),
(106, 1, 16, 80, 'Paneer Makhani', 'paneer-makhani', NULL, 1, 0, '2024-11-15 08:48:39', '2024-11-15 08:48:39', '127.0.0.1', NULL, NULL, NULL, 0),
(107, 1, 16, 81, 'Lalwani Envelope Kachori', 'lalwani-envelope-kachori', NULL, 1, 0, '2024-11-15 08:49:43', '2024-11-15 08:50:37', '127.0.0.1', NULL, NULL, NULL, 0),
(108, 2, 16, 81, 'Chinese Wonton', 'chinese-wonton', NULL, 1, 0, '2024-11-15 08:50:10', '2024-11-15 08:50:59', '127.0.0.1', NULL, NULL, NULL, 0),
(109, 1, 16, 82, 'Spring Rolls', 'spring-rolls', NULL, 1, 0, '2024-11-15 08:51:36', '2024-12-03 12:00:47', '127.0.0.1', NULL, NULL, NULL, 0),
(110, 1, 16, 83, 'Stuff Dahi Vada', 'stuff-dahi-vada', NULL, 1, 0, '2024-11-15 08:51:59', '2024-11-22 06:12:25', '127.0.0.1', NULL, NULL, NULL, 0),
(111, 2, 16, 83, 'Ratada Na Dahi Wada', 'ratada-na-dahi-wada', NULL, 1, 0, '2024-11-15 08:52:35', '2024-11-15 08:52:35', '127.0.0.1', NULL, NULL, NULL, 0),
(112, 3, 16, 83, 'Bengali Wada', 'bengali-wada', NULL, 1, 0, '2024-11-15 08:53:00', '2024-11-15 08:53:00', '127.0.0.1', NULL, NULL, NULL, 0),
(113, 1, 16, 84, 'Pineapple Macaroni Spaghetti', 'pineapple-macaroni-spaghetti', NULL, 1, 0, '2024-11-15 08:53:48', '2024-11-15 08:53:48', '127.0.0.1', NULL, NULL, NULL, 0),
(114, 2, 16, 84, 'Aalu Musakka', 'aalu-musakka', NULL, 1, 0, '2024-11-15 08:54:15', '2024-11-15 08:54:15', '127.0.0.1', NULL, NULL, NULL, 0),
(115, 1, 16, 85, 'Green salad', 'green-salad', NULL, 1, 0, '2024-11-15 08:55:10', '2024-11-15 08:55:10', '127.0.0.1', NULL, NULL, NULL, 0),
(116, 1, 16, 86, 'Russian Salad', 'russian-salad', NULL, 1, 0, '2024-11-15 08:55:45', '2024-11-15 08:55:45', '127.0.0.1', NULL, NULL, NULL, 0),
(117, 1, 17, 87, 'Undhiyu', 'undhiyu', NULL, 1, 0, '2024-11-15 08:56:12', '2024-11-15 08:56:12', '127.0.0.1', NULL, NULL, NULL, 0),
(118, 2, 17, 87, 'Half Undhiyu', 'half-undhiyu', NULL, 1, 0, '2024-11-15 08:56:22', '2024-11-15 08:56:22', '127.0.0.1', NULL, NULL, NULL, 0),
(119, 1, 17, 88, 'Bataka Rasawala Desi', 'bataka-rasawala-desi', NULL, 1, 0, '2024-11-15 08:57:02', '2024-11-15 08:57:02', '127.0.0.1', NULL, NULL, NULL, 0),
(120, 2, 17, 88, 'Green Bataka Chaatni ma', 'green-bataka-chaatni-ma', NULL, 1, 0, '2024-11-15 08:57:26', '2024-11-15 08:57:26', '127.0.0.1', NULL, NULL, NULL, 0),
(121, 1, 17, 89, 'Puri', 'puri', NULL, 1, 0, '2024-11-15 08:57:38', '2024-11-15 08:57:38', '127.0.0.1', NULL, NULL, NULL, 0),
(122, 7, 17, 89, 'Palak Parotha', 'palak-parotha', NULL, 1, 0, '2024-11-15 08:58:04', '2024-11-22 06:14:54', '127.0.0.1', NULL, NULL, NULL, 0),
(123, 1, 17, 90, 'Fulka Roti', 'fulka-roti', NULL, 1, 0, '2024-11-15 08:58:27', '2024-11-15 08:58:27', '127.0.0.1', NULL, NULL, NULL, 0),
(124, 2, 17, 90, 'Makai Roti', 'makai-roti', NULL, 1, 0, '2024-11-15 08:58:45', '2024-11-15 08:58:45', '127.0.0.1', NULL, NULL, NULL, 0),
(125, 1, 17, 91, 'Bengoli Athanu', 'bengoli-athanu', NULL, 1, 0, '2024-11-15 08:59:02', '2024-11-15 08:59:02', '127.0.0.1', NULL, NULL, NULL, 0),
(126, 1, 17, 91, 'Lal Marchanu Athanu', 'lal-marchanu-athanu', NULL, 1, 0, '2024-11-15 08:59:13', '2024-11-15 08:59:13', '127.0.0.1', NULL, NULL, NULL, 0),
(127, 1, 17, 92, 'Lal Chutney', 'lal-chutney', NULL, 1, 0, '2024-11-15 08:59:33', '2024-11-15 08:59:33', '127.0.0.1', NULL, NULL, NULL, 0),
(128, 1, 17, 92, 'Green Chutney', 'green-chutney', NULL, 1, 0, '2024-11-15 08:59:48', '2024-11-15 08:59:48', '127.0.0.1', NULL, NULL, NULL, 0),
(129, 1, 17, 93, 'Kakdi Raita', 'kakdi-raita', NULL, 1, 0, '2024-11-15 09:00:10', '2024-11-15 09:00:10', '127.0.0.1', NULL, NULL, NULL, 0),
(130, 2, 17, 93, 'Boondi Raita', 'boondi-raita', NULL, 1, 0, '2024-11-15 09:00:27', '2024-11-15 09:00:27', '127.0.0.1', NULL, NULL, NULL, 0),
(131, 1, 17, 94, 'Papad - Sada', 'papad---sada', NULL, 1, 0, '2024-11-15 09:00:43', '2024-11-15 09:00:43', '127.0.0.1', NULL, NULL, NULL, 0),
(132, 2, 17, 94, 'Disco - Papad', 'disco---papad', NULL, 1, 0, '2024-11-15 09:01:13', '2024-11-15 09:01:13', '127.0.0.1', NULL, NULL, NULL, 0),
(135, 4, 2, 4, 'Falsa juice', 'falsa-juice', NULL, 1, 0, '2024-11-22 13:32:53', '2024-11-30 05:26:30', '103.1.100.226', NULL, NULL, NULL, 0),
(136, 5, 2, 4, 'Plum Juice', 'plum-juice', NULL, 1, 0, '2024-12-02 09:53:09', '2024-12-02 09:53:09', '103.1.100.226', NULL, NULL, NULL, 0),
(137, 6, 2, 4, 'Pomegranate Juice', 'pomegranate-juice', NULL, 1, 0, '2024-12-02 09:55:28', '2024-12-02 09:55:28', '103.1.100.226', NULL, NULL, NULL, 0),
(138, 7, 2, 4, 'Plum Pineapple Juice', 'plum-pineapple-juice', NULL, 1, 0, '2024-12-02 09:56:32', '2024-12-02 09:56:32', '103.1.100.226', NULL, NULL, NULL, 0),
(139, 8, 2, 4, 'Pineapple Falsa Juice', 'pineapple-falsa-juice', NULL, 1, 0, '2024-12-02 10:02:20', '2024-12-02 10:02:20', '103.1.100.226', NULL, NULL, NULL, 0),
(140, 9, 2, 4, 'Pineapple Limca Juice', 'pineapple-limca-juice', NULL, 1, 0, '2024-12-02 10:03:07', '2024-12-02 10:03:07', '103.1.100.226', NULL, NULL, NULL, 0),
(141, 10, 2, 4, 'Watermelon Juice', 'watermelon-juice', NULL, 1, 0, '2024-12-02 10:04:35', '2024-12-02 10:04:35', '103.1.100.226', NULL, NULL, NULL, 0),
(142, 11, 2, 4, 'Jamun Juice', 'jamun-juice', NULL, 1, 0, '2024-12-02 10:05:00', '2024-12-02 10:05:00', '103.1.100.226', NULL, NULL, NULL, 0),
(143, 12, 2, 4, 'Strawberry Juice', 'strawberry-juice', NULL, 1, 0, '2024-12-02 10:05:45', '2024-12-02 10:05:45', '103.1.100.226', NULL, NULL, NULL, 0),
(144, 13, 2, 4, 'Apple Juice', 'apple-juice', NULL, 1, 0, '2024-12-02 10:06:23', '2024-12-02 10:06:23', '103.1.100.226', NULL, NULL, NULL, 0),
(145, 14, 2, 4, 'Orange Pineapple Juice', 'orange-pineapple-juice', NULL, 1, 0, '2024-12-02 10:07:16', '2024-12-02 10:07:16', '103.1.100.226', NULL, NULL, NULL, 0),
(146, 15, 2, 4, 'Green Ghode Juice', 'green-ghode-juice', NULL, 1, 0, '2024-12-02 10:08:12', '2024-12-02 10:08:12', '103.1.100.226', NULL, NULL, NULL, 0),
(147, 16, 2, 4, 'Pina Colada', 'pina-colada', NULL, 1, 0, '2024-12-02 10:08:40', '2024-12-02 10:08:40', '103.1.100.226', NULL, NULL, NULL, 0),
(148, 17, 2, 4, 'Shaalimaar Juice', 'shaalimaar-juice', NULL, 1, 0, '2024-12-02 10:09:10', '2024-12-02 10:09:10', '103.1.100.226', NULL, NULL, NULL, 0),
(149, 18, 2, 4, 'Paina Orange', 'paina-orange', NULL, 1, 0, '2024-12-02 10:09:38', '2024-12-02 10:09:38', '103.1.100.226', NULL, NULL, NULL, 0),
(150, 19, 2, 4, 'Black Grapes Pineapple', 'black-grapes-pineapple', NULL, 1, 0, '2024-12-02 10:10:34', '2024-12-02 10:10:34', '103.1.100.226', NULL, NULL, NULL, 0),
(151, 3, 2, 5, 'Litchi Juice', 'litchi-juice', NULL, 1, 0, '2024-12-02 10:11:30', '2024-12-02 10:11:30', '103.1.100.226', NULL, NULL, NULL, 0),
(152, 4, 2, 5, 'Coconut Juice', 'coconut-juice', NULL, 1, 0, '2024-12-02 10:12:12', '2024-12-02 10:12:12', '103.1.100.226', NULL, NULL, NULL, 0),
(153, 5, 2, 5, 'Green Grapes Juice', 'green-grapes-juice', NULL, 1, 0, '2024-12-02 10:12:28', '2024-12-02 10:12:28', '103.1.100.226', NULL, NULL, NULL, 0),
(154, 6, 2, 5, 'Ginger Lemon Mint Juice', 'ginger-lemon-mint-juice', NULL, 1, 0, '2024-12-02 10:13:11', '2024-12-02 10:13:11', '103.1.100.226', NULL, NULL, NULL, 0),
(155, 7, 2, 5, 'Green Variali Juice', 'green-variali-juice', NULL, 1, 0, '2024-12-02 10:14:14', '2024-12-02 10:14:14', '103.1.100.226', NULL, NULL, NULL, 0),
(156, 3, 2, 6, 'Black Grapes Cooler', 'black-grapes-cooler', NULL, 1, 0, '2024-12-02 10:15:31', '2024-12-02 10:15:31', '103.1.100.226', NULL, NULL, NULL, 0),
(157, 4, 2, 6, 'Shaalimar Cooler', 'shaalimar-cooler', NULL, 1, 0, '2024-12-02 10:16:08', '2024-12-02 10:16:08', '103.1.100.226', NULL, NULL, NULL, 0),
(158, 5, 2, 6, 'Strawberry Cooler', 'strawberry-cooler', NULL, 1, 0, '2024-12-02 10:17:20', '2024-12-02 10:17:20', '103.1.100.226', NULL, NULL, NULL, 0),
(159, 6, 2, 6, 'Peach Cooler', 'peach-cooler', NULL, 1, 0, '2024-12-02 10:17:41', '2024-12-02 10:17:41', '103.1.100.226', NULL, NULL, NULL, 0),
(160, 7, 2, 6, 'Shaahi Cooler', 'shaahi-cooler', NULL, 1, 0, '2024-12-02 10:18:11', '2024-12-02 10:18:11', '103.1.100.226', NULL, NULL, NULL, 0),
(161, 8, 2, 6, 'Humsafar', 'humsafar', NULL, 1, 0, '2024-12-02 10:18:53', '2024-12-02 10:18:53', '103.1.100.226', NULL, NULL, NULL, 0),
(162, 9, 2, 6, 'Black Creen', 'black-creen', NULL, 1, 0, '2024-12-02 10:19:16', '2024-12-02 10:19:16', '103.1.100.226', NULL, NULL, NULL, 0),
(163, 10, 2, 6, 'Hum Sath Sath', 'hum-sath-sath', NULL, 1, 0, '2024-12-02 10:19:48', '2024-12-02 10:19:48', '103.1.100.226', NULL, NULL, NULL, 0),
(164, 11, 2, 6, 'Green Cooler', 'green-cooler', NULL, 1, 0, '2024-12-02 10:20:17', '2024-12-02 10:20:17', '103.1.100.226', NULL, NULL, NULL, 0),
(165, 12, 2, 6, 'Coconut Pineapple', 'coconut-pineapple', NULL, 1, 0, '2024-12-02 10:20:57', '2024-12-02 10:20:57', '103.1.100.226', NULL, NULL, NULL, 0),
(166, 13, 2, 6, 'Mix Fruit Punch Cooler', 'mix-fruit-punch-cooler', NULL, 1, 0, '2024-12-02 10:21:38', '2024-12-02 10:21:38', '103.1.100.226', NULL, NULL, NULL, 0),
(167, 14, 2, 6, 'Butterscotch Cooler', 'butterscotch-cooler', NULL, 1, 0, '2024-12-02 10:22:03', '2024-12-02 10:22:03', '103.1.100.226', NULL, NULL, NULL, 0),
(168, 15, 2, 6, 'Dadam Darbari', 'dadam-darbari', NULL, 1, 0, '2024-12-02 10:22:38', '2024-12-02 10:22:38', '103.1.100.226', NULL, NULL, NULL, 0),
(169, 16, 2, 6, 'Pineapple Apricot', 'pineapple-apricot', NULL, 1, 0, '2024-12-02 10:23:06', '2024-12-02 10:23:06', '103.1.100.226', NULL, NULL, NULL, 0),
(170, 17, 2, 6, 'Orange Apricot', 'orange-apricot', NULL, 1, 0, '2024-12-02 10:23:39', '2024-12-02 10:23:39', '103.1.100.226', NULL, NULL, NULL, 0),
(171, 18, 2, 6, 'Watermelon Strawberry Coconut Cooler', 'watermelon-strawberry-coconut-cooler', NULL, 1, 0, '2024-12-02 10:24:29', '2024-12-02 10:24:29', '103.1.100.226', NULL, NULL, NULL, 0),
(172, 19, 2, 6, 'Kachi Keri No Baflo', 'kachi-keri-no-baflo', NULL, 1, 0, '2024-12-02 10:25:14', '2024-12-02 10:25:14', '103.1.100.226', NULL, NULL, NULL, 0),
(173, 20, 2, 6, 'Thandai Kesar', 'thandai-kesar', NULL, 1, 0, '2024-12-02 10:25:40', '2024-12-02 10:25:40', '103.1.100.226', NULL, NULL, NULL, 0),
(174, 21, 2, 6, 'Pink Lady Juice', 'pink-lady-juice', NULL, 1, 0, '2024-12-02 10:26:34', '2024-12-02 10:26:34', '103.1.100.226', NULL, NULL, NULL, 0),
(175, 3, 2, 7, 'Anjir Shake', 'anjir-shake', NULL, 1, 0, '2024-12-02 10:28:56', '2024-12-02 10:28:56', '103.1.100.226', NULL, NULL, NULL, 0),
(176, 4, 2, 7, 'Badam Pista Milk Shake', 'badam-pista-milk-shake', NULL, 1, 0, '2024-12-02 10:29:35', '2024-12-02 10:30:28', '103.1.100.226', NULL, NULL, NULL, 0),
(177, 5, 2, 7, 'Mango Milk Shake', 'mango-milk-shake', NULL, 1, 0, '2024-12-02 10:30:09', '2024-12-02 10:30:09', '103.1.100.226', NULL, NULL, NULL, 0),
(178, 6, 2, 7, 'Chickoo Milk Shake', 'chickoo-milk-shake', NULL, 1, 0, '2024-12-02 10:31:36', '2024-12-02 10:31:36', '103.1.100.226', NULL, NULL, NULL, 0),
(179, 7, 2, 7, 'Chocolate Milk Shake', 'chocolate-milk-shake', NULL, 1, 0, '2024-12-02 10:32:19', '2024-12-02 10:32:19', '103.1.100.226', NULL, NULL, NULL, 0),
(180, 8, 2, 7, 'Apple Milk Shake', 'apple-milk-shake', NULL, 1, 0, '2024-12-02 10:32:44', '2024-12-02 10:32:44', '103.1.100.226', NULL, NULL, NULL, 0),
(181, 9, 2, 7, 'Masala Thandai', 'masala-thandai', NULL, 1, 0, '2024-12-02 10:33:19', '2024-12-02 10:33:19', '103.1.100.226', NULL, NULL, NULL, 0),
(182, 10, 2, 7, 'Kesar Thandai', 'kesar-thandai', NULL, 1, 0, '2024-12-02 10:33:58', '2024-12-02 10:33:58', '103.1.100.226', NULL, NULL, NULL, 0),
(183, 11, 2, 7, 'Cold Coco', 'cold-coco', NULL, 1, 0, '2024-12-02 10:34:26', '2024-12-02 10:34:26', '103.1.100.226', NULL, NULL, NULL, 0),
(184, 12, 2, 7, 'Masala Doodh', 'masala-doodh', NULL, 1, 0, '2024-12-02 10:34:47', '2024-12-02 10:34:47', '103.1.100.226', NULL, NULL, NULL, 0),
(185, 3, 3, 8, 'Paneer Sanghai', 'paneer-sanghai', NULL, 1, 0, '2024-12-02 10:59:53', '2024-12-02 10:59:53', '103.1.100.226', NULL, NULL, NULL, 0),
(186, 4, 3, 8, 'Tava Sizzler', 'tava-sizzler', NULL, 1, 0, '2024-12-02 11:00:09', '2024-12-02 11:00:09', '103.1.100.226', NULL, NULL, NULL, 0),
(187, 5, 3, 8, 'Plate Sizzler', 'plate-sizzler', NULL, 1, 0, '2024-12-02 11:00:28', '2024-12-02 11:00:28', '103.1.100.226', NULL, NULL, NULL, 0),
(188, 6, 3, 8, 'Paneer Schezwan', 'paneer-schezwan', NULL, 1, 0, '2024-12-02 11:00:54', '2024-12-02 11:00:54', '103.1.100.226', NULL, NULL, NULL, 0),
(189, 7, 3, 8, 'Gold Point', 'gold-point', NULL, 1, 0, '2024-12-02 11:01:14', '2024-12-02 11:01:14', '103.1.100.226', NULL, NULL, NULL, 0),
(190, 8, 3, 8, 'Seasoning Toast', 'seasoning-toast', NULL, 1, 0, '2024-12-02 11:01:41', '2024-12-02 11:01:41', '103.1.100.226', NULL, NULL, NULL, 0),
(191, 9, 3, 8, 'Paneer Saate', 'paneer-saate', NULL, 1, 0, '2024-12-02 11:02:08', '2024-12-02 11:02:08', '103.1.100.226', NULL, NULL, NULL, 0),
(192, 10, 3, 8, 'Paneer Tikka', 'paneer-tikka', NULL, 1, 0, '2024-12-02 11:02:29', '2024-12-02 11:02:29', '103.1.100.226', NULL, NULL, NULL, 0),
(193, 11, 3, 8, 'Veg. Crispy Tread', 'veg.-crispy-tread', NULL, 1, 0, '2024-12-02 11:02:58', '2024-12-02 11:02:58', '103.1.100.226', NULL, NULL, NULL, 0),
(194, 12, 3, 8, 'Aloo Ke Gool Goole', 'aloo-ke-gool-goole', NULL, 1, 0, '2024-12-02 11:03:32', '2024-12-02 11:03:32', '103.1.100.226', NULL, NULL, NULL, 0),
(195, 13, 3, 8, 'Veg. Chinese Bhel', 'veg.-chinese-bhel', NULL, 1, 0, '2024-12-02 11:03:55', '2024-12-02 11:03:55', '103.1.100.226', NULL, NULL, NULL, 0),
(196, 14, 3, 8, 'Veg. Spring Roll', 'veg.-spring-roll', NULL, 1, 0, '2024-12-02 11:04:40', '2024-12-02 11:04:40', '103.1.100.226', NULL, NULL, NULL, 0),
(197, 15, 3, 8, 'Veg. Lollipop', 'veg.-lollipop', NULL, 1, 0, '2024-12-02 11:05:12', '2024-12-02 11:05:12', '103.1.100.226', NULL, NULL, NULL, 0),
(198, 16, 3, 8, 'Veg. Chong', 'veg.-chong', NULL, 1, 0, '2024-12-02 11:05:39', '2024-12-02 11:05:39', '103.1.100.226', NULL, NULL, NULL, 0),
(199, 17, 3, 8, 'Veg. Crispy', 'veg.-crispy', NULL, 1, 0, '2024-12-02 11:06:07', '2024-12-02 11:06:07', '103.1.100.226', NULL, NULL, NULL, 0),
(200, 18, 3, 8, 'Veg. Dryone Roll', 'veg.-dryone-roll', NULL, 1, 0, '2024-12-02 11:06:48', '2024-12-02 11:06:48', '103.1.100.226', NULL, NULL, NULL, 0),
(201, 19, 3, 8, 'Veg. Bullet', 'veg.-bullet', NULL, 1, 0, '2024-12-02 11:07:13', '2024-12-02 11:07:13', '103.1.100.226', NULL, NULL, NULL, 0),
(202, 20, 3, 8, 'Veg. Finger', 'veg.-finger', NULL, 1, 0, '2024-12-02 11:07:35', '2024-12-02 11:07:44', '103.1.100.226', NULL, NULL, NULL, 0),
(203, 21, 3, 8, 'Veg. Corn Toast', 'veg.-corn-toast', NULL, 1, 0, '2024-12-02 11:08:11', '2024-12-02 11:08:11', '103.1.100.226', NULL, NULL, NULL, 0),
(204, 22, 3, 8, 'Veg. Corn Bhel', 'veg.-corn-bhel', NULL, 1, 0, '2024-12-02 11:08:39', '2024-12-02 11:08:39', '103.1.100.226', NULL, NULL, NULL, 0),
(205, 23, 3, 8, 'Veg. Bread Roll', 'veg.-bread-roll', NULL, 1, 0, '2024-12-02 11:09:03', '2024-12-02 11:09:03', '103.1.100.226', NULL, NULL, NULL, 0),
(206, 24, 3, 8, 'Veg. Wonton', 'veg.-wonton', NULL, 1, 0, '2024-12-02 11:09:28', '2024-12-02 11:10:20', '103.1.100.226', NULL, NULL, NULL, 0),
(207, 25, 3, 8, 'Veg. Idli Chilli', 'veg.-idli-chilli', NULL, 1, 0, '2024-12-02 11:10:09', '2024-12-02 11:10:09', '103.1.100.226', NULL, NULL, NULL, 0),
(208, 3, 3, 9, 'American Wada', 'american-wada', NULL, 1, 0, '2024-12-02 11:11:19', '2024-12-02 11:11:19', '103.1.100.226', NULL, NULL, NULL, 0),
(209, 4, 3, 9, 'Dahi Gujiya', 'dahi-gujiya', NULL, 1, 0, '2024-12-02 11:11:40', '2024-12-02 11:11:40', '103.1.100.226', NULL, NULL, NULL, 0),
(210, 5, 3, 9, 'Cone Dahi Gujiya', 'cone-dahi-gujiya', NULL, 1, 0, '2024-12-02 11:12:13', '2024-12-02 11:12:13', '103.1.100.226', NULL, NULL, NULL, 0),
(211, 6, 3, 9, 'Dry Fruit Gujiya', 'dry-fruit-gujiya', NULL, 1, 0, '2024-12-02 11:12:59', '2024-12-02 11:12:59', '103.1.100.226', NULL, NULL, NULL, 0),
(212, 1, 3, 10, 'Peps Roll', 'peps-roll', NULL, 1, 0, '2024-12-03 10:01:01', '2024-12-03 10:01:01', '103.1.100.226', NULL, NULL, NULL, 0),
(213, 2, 3, 10, 'China Badam', 'china-badam', NULL, 1, 0, '2024-12-03 10:01:50', '2024-12-03 10:01:50', '103.1.100.226', NULL, NULL, NULL, 0),
(214, 3, 3, 10, 'Bread Flower', 'bread-flower', NULL, 1, 0, '2024-12-03 10:02:11', '2024-12-03 10:02:11', '103.1.100.226', NULL, NULL, NULL, 0),
(215, 4, 3, 10, 'One-More', 'one-more', NULL, 1, 0, '2024-12-03 10:02:30', '2024-12-03 10:02:30', '103.1.100.226', NULL, NULL, NULL, 0),
(216, 5, 3, 10, 'One-Up', 'one-up', NULL, 1, 0, '2024-12-03 10:02:54', '2024-12-03 10:02:54', '103.1.100.226', NULL, NULL, NULL, 0),
(217, 6, 3, 10, 'Pandoli', 'pandoli', NULL, 1, 0, '2024-12-03 10:03:12', '2024-12-03 10:03:12', '103.1.100.226', NULL, NULL, NULL, 0),
(218, 9, 3, 10, 'Chingi Changa', 'chingi-changa', NULL, 1, 0, '2024-12-03 10:03:45', '2024-12-03 10:03:45', '103.1.100.226', NULL, NULL, NULL, 0),
(219, 10, 3, 10, 'Snow-Ball', 'snow-ball', NULL, 1, 0, '2024-12-03 10:04:12', '2024-12-03 10:04:12', '103.1.100.226', NULL, NULL, NULL, 0),
(220, 11, 3, 10, 'Bread Cheese Ball', 'bread-cheese-ball', NULL, 1, 0, '2024-12-03 10:04:32', '2024-12-03 10:04:32', '103.1.100.226', NULL, NULL, NULL, 0),
(221, 12, 3, 10, 'Mexican Marble', 'mexican-marble', NULL, 1, 0, '2024-12-03 10:04:57', '2024-12-03 10:04:57', '103.1.100.226', NULL, NULL, NULL, 0),
(222, 13, 3, 10, 'Golden Ring', 'golden-ring', NULL, 1, 0, '2024-12-03 10:05:24', '2024-12-03 10:05:24', '103.1.100.226', NULL, NULL, NULL, 0),
(223, 14, 3, 10, 'Sarara', 'sarara', NULL, 1, 0, '2024-12-03 10:06:19', '2024-12-03 10:06:19', '103.1.100.226', NULL, NULL, NULL, 0),
(224, 15, 3, 10, 'Paneer Roll', 'paneer-roll', NULL, 1, 0, '2024-12-03 10:06:39', '2024-12-03 10:06:39', '103.1.100.226', NULL, NULL, NULL, 0),
(225, 16, 3, 10, 'Cabbage Roll', 'cabbage-roll', NULL, 1, 0, '2024-12-03 10:06:52', '2024-12-03 10:06:52', '103.1.100.226', NULL, NULL, NULL, 0),
(226, 17, 3, 10, 'Paneer Palak  Schezwan', 'paneer-palak--schezwan', NULL, 1, 0, '2024-12-03 10:07:29', '2024-12-03 10:07:29', '103.1.100.226', NULL, NULL, NULL, 0),
(227, 18, 3, 10, 'American Roll', 'american-roll', NULL, 1, 0, '2024-12-03 10:07:56', '2024-12-03 10:07:56', '103.1.100.226', NULL, NULL, NULL, 0),
(228, 19, 3, 10, 'Basa Dolla', 'basa-dolla', NULL, 1, 0, '2024-12-03 10:08:20', '2024-12-03 10:08:20', '103.1.100.226', NULL, NULL, NULL, 0),
(229, 20, 3, 10, 'Paneer Hara Bhara Kabab', 'paneer-hara-bhara-kabab', NULL, 1, 0, '2024-12-03 10:08:46', '2024-12-03 10:08:46', '103.1.100.226', NULL, NULL, NULL, 0),
(230, 21, 3, 10, 'Green Ball', 'green-ball', NULL, 1, 0, '2024-12-03 10:09:08', '2024-12-03 10:09:08', '103.1.100.226', NULL, NULL, NULL, 0),
(231, 22, 3, 10, 'Frankee', 'frankee', NULL, 1, 0, '2024-12-03 10:09:27', '2024-12-03 10:09:27', '103.1.100.226', NULL, NULL, NULL, 0),
(232, 23, 3, 10, 'Leelvana Marble', 'leelvana-marble', NULL, 1, 0, '2024-12-03 10:09:59', '2024-12-03 10:09:59', '103.1.100.226', NULL, NULL, NULL, 0),
(233, 24, 3, 10, 'Badam Chilla', 'badam-chilla', NULL, 1, 0, '2024-12-03 10:10:23', '2024-12-03 10:10:23', '103.1.100.226', NULL, NULL, NULL, 0),
(234, 3, 3, 11, 'Cholen Tikki', 'cholen-tikki', NULL, 1, 0, '2024-12-03 10:21:54', '2024-12-03 10:21:54', '103.1.100.226', NULL, NULL, NULL, 0),
(235, 4, 3, 11, 'Lucknowi Tikki', 'lucknowi-tikki', NULL, 1, 0, '2024-12-03 10:22:58', '2024-12-03 10:22:58', '103.1.100.226', NULL, NULL, NULL, 0),
(236, 5, 3, 11, 'Banarasi Tikki', 'banarasi-tikki', NULL, 1, 0, '2024-12-03 10:23:20', '2024-12-03 10:23:20', '103.1.100.226', NULL, NULL, NULL, 0),
(237, 6, 3, 11, 'Banana Balls', 'banana-balls', NULL, 1, 0, '2024-12-03 10:23:41', '2024-12-03 10:23:41', '103.1.100.226', NULL, NULL, NULL, 0),
(238, 7, 3, 11, 'Veg. Tikki', 'veg.-tikki', NULL, 1, 0, '2024-12-03 10:23:57', '2024-12-03 10:24:36', '103.1.100.226', NULL, NULL, NULL, 0),
(239, 8, 3, 11, 'Veg. Hotpot Tikki', 'veg.-hotpot-tikki', NULL, 1, 0, '2024-12-03 10:24:27', '2024-12-03 10:24:27', '103.1.100.226', NULL, NULL, NULL, 0),
(240, 3, 3, 12, 'Santara Chaat', 'santara-chaat', NULL, 1, 0, '2024-12-03 10:26:34', '2024-12-03 10:26:34', '103.1.100.226', NULL, NULL, NULL, 0),
(241, 4, 3, 12, 'Asopalav Chaat', 'asopalav-chaat', NULL, 1, 0, '2024-12-03 10:27:00', '2024-12-03 10:27:00', '103.1.100.226', NULL, NULL, NULL, 0),
(242, 5, 3, 12, 'Corn Potato Chaat', 'corn-potato-chaat', NULL, 1, 0, '2024-12-03 10:27:22', '2024-12-03 10:27:22', '103.1.100.226', NULL, NULL, NULL, 0),
(243, 6, 3, 12, 'Corn Basket Chaat', 'corn-basket-chaat', NULL, 1, 0, '2024-12-03 10:27:45', '2024-12-03 10:27:45', '103.1.100.226', NULL, NULL, NULL, 0),
(244, 7, 3, 12, 'Delhi Chaat', 'delhi-chaat', NULL, 1, 0, '2024-12-03 10:28:19', '2024-12-03 10:28:19', '103.1.100.226', NULL, NULL, NULL, 0),
(245, 8, 3, 12, 'Banarasi Chaat', 'banarasi-chaat', NULL, 1, 0, '2024-12-03 10:28:35', '2024-12-03 10:28:35', '103.1.100.226', NULL, NULL, NULL, 0),
(246, 9, 3, 12, 'Kolkata Chaat', 'kolkata-chaat', NULL, 1, 0, '2024-12-03 10:28:57', '2024-12-03 10:28:57', '103.1.100.226', NULL, NULL, NULL, 0),
(247, 10, 3, 12, 'Dhakai Chaat', 'dhakai-chaat', NULL, 1, 0, '2024-12-03 10:29:20', '2024-12-03 10:29:20', '103.1.100.226', NULL, NULL, NULL, 0),
(248, 11, 3, 12, 'Mathura Chaat', 'mathura-chaat', NULL, 1, 0, '2024-12-03 10:29:36', '2024-12-03 10:29:36', '103.1.100.226', NULL, NULL, NULL, 0),
(249, 12, 3, 12, 'Indori Chaat', 'indori-chaat', NULL, 1, 0, '2024-12-03 10:30:08', '2024-12-03 10:30:08', '103.1.100.226', NULL, NULL, NULL, 0),
(250, 13, 3, 12, 'Rajvadi Chaat', 'rajvadi-chaat', NULL, 1, 0, '2024-12-03 10:31:16', '2024-12-03 10:31:16', '103.1.100.226', NULL, NULL, NULL, 0),
(251, 14, 3, 12, 'Palak Chaat', 'palak-chaat', NULL, 1, 0, '2024-12-03 10:31:31', '2024-12-03 10:31:31', '103.1.100.226', NULL, NULL, NULL, 0),
(252, 15, 3, 12, 'Corn Palak Chaat', 'corn-palak-chaat', NULL, 1, 0, '2024-12-03 10:31:51', '2024-12-03 10:31:51', '103.1.100.226', NULL, NULL, NULL, 0),
(253, 16, 3, 12, 'Tapela Chaat', 'tapela-chaat', NULL, 1, 0, '2024-12-03 10:32:07', '2024-12-03 10:32:07', '103.1.100.226', NULL, NULL, NULL, 0),
(254, 17, 3, 12, 'Matar Aloo Chaat', 'matar-aloo-chaat', NULL, 1, 0, '2024-12-03 10:32:24', '2024-12-03 10:32:24', '103.1.100.226', NULL, NULL, NULL, 0),
(255, 18, 3, 12, 'Sing Aloo Chaat', 'sing-aloo-chaat', NULL, 1, 0, '2024-12-03 10:32:58', '2024-12-03 10:32:58', '103.1.100.226', NULL, NULL, NULL, 0),
(256, 19, 3, 12, 'Devar-Bhabhi Chaat', 'devar-bhabhi-chaat', NULL, 1, 0, '2024-12-03 10:33:21', '2024-12-03 10:33:21', '103.1.100.226', NULL, NULL, NULL, 0),
(257, 20, 3, 12, 'Karela Chaat', 'karela-chaat', NULL, 1, 0, '2024-12-03 10:33:42', '2024-12-03 10:33:42', '103.1.100.226', NULL, NULL, NULL, 0),
(258, 21, 3, 12, 'Paneer Sodh', 'paneer-sodh', NULL, 1, 0, '2024-12-03 10:34:01', '2024-12-03 10:34:01', '103.1.100.226', NULL, NULL, NULL, 0),
(259, 22, 3, 12, 'Paneer Malmal', 'paneer-malmal', NULL, 1, 0, '2024-12-03 10:34:23', '2024-12-03 10:34:23', '103.1.100.226', NULL, NULL, NULL, 0),
(260, 23, 3, 12, 'Paneer Tammachhi', 'paneer-tammachhi', NULL, 1, 0, '2024-12-03 10:35:10', '2024-12-03 10:35:10', '103.1.100.226', NULL, NULL, NULL, 0),
(261, 24, 3, 12, 'Paneer Badshah', 'paneer-badshah', NULL, 1, 0, '2024-12-03 10:35:32', '2024-12-03 10:35:32', '103.1.100.226', NULL, NULL, NULL, 0),
(262, 25, 3, 12, 'Paneer Tava', 'paneer-tava', NULL, 1, 0, '2024-12-03 10:35:55', '2024-12-03 10:35:55', '103.1.100.226', NULL, NULL, NULL, 0),
(263, 26, 3, 12, 'Paneer Corn Tava', 'paneer-corn-tava', NULL, 1, 0, '2024-12-03 10:36:23', '2024-12-03 10:36:23', '103.1.100.226', NULL, NULL, NULL, 0),
(264, 27, 3, 12, 'Paneer Lifafa', 'paneer-lifafa', NULL, 1, 0, '2024-12-03 10:36:45', '2024-12-03 10:36:45', '103.1.100.226', NULL, NULL, NULL, 0),
(265, 28, 3, 12, 'Cone Vada-Chaat', 'cone-vada-chaat', NULL, 1, 0, '2024-12-03 10:37:27', '2024-12-03 10:37:27', '103.1.100.226', NULL, NULL, NULL, 0),
(266, 29, 3, 12, 'Basket Chaat', 'basket-chaat', NULL, 1, 0, '2024-12-03 10:37:44', '2024-12-03 10:37:44', '103.1.100.226', NULL, NULL, NULL, 0),
(267, 30, 3, 12, 'Lachha Katori', 'lachha-katori', NULL, 1, 0, '2024-12-03 10:38:14', '2024-12-03 10:38:14', '103.1.100.226', NULL, NULL, NULL, 0),
(268, 2, 3, 13, 'Mexican Tacos', 'mexican-tacos', NULL, 1, 0, '2024-12-03 10:40:23', '2024-12-03 10:40:23', '103.1.100.226', NULL, NULL, NULL, 0),
(269, 3, 3, 13, 'Mexican Dublooz', 'mexican-dublooz', NULL, 1, 0, '2024-12-03 10:42:04', '2024-12-03 10:42:04', '103.1.100.226', NULL, NULL, NULL, 0),
(270, 4, 3, 13, 'Mexican Barbecue', 'mexican-barbecue', NULL, 1, 0, '2024-12-03 10:42:34', '2024-12-03 10:42:34', '103.1.100.226', NULL, NULL, NULL, 0),
(271, 5, 3, 13, 'Paneer Teekka', 'paneer-teekka', NULL, 1, 0, '2024-12-03 10:46:44', '2024-12-03 10:46:44', '103.1.100.226', NULL, NULL, NULL, 0),
(272, 6, 3, 13, 'Paneer Labalab', 'paneer-labalab', NULL, 1, 0, '2024-12-03 10:47:11', '2024-12-03 10:47:11', '103.1.100.226', NULL, NULL, NULL, 0),
(273, 7, 3, 13, 'Veg. Paneer Tikka', 'veg.-paneer-tikka', NULL, 1, 0, '2024-12-03 10:47:41', '2024-12-03 10:47:41', '103.1.100.226', NULL, NULL, NULL, 0),
(274, 8, 3, 13, 'Paneer Badshah Tikka', 'paneer-badshah-tikka', NULL, 1, 0, '2024-12-03 10:48:24', '2024-12-03 10:48:24', '103.1.100.226', NULL, NULL, NULL, 0),
(275, 9, 3, 13, 'American Tikka', 'american-tikka', NULL, 1, 0, '2024-12-03 10:48:49', '2024-12-03 10:48:49', '103.1.100.226', NULL, NULL, NULL, 0),
(276, 2, 3, 14, 'Hyderabadi Chilla', 'hyderabadi-chilla', NULL, 1, 0, '2024-12-03 10:49:32', '2024-12-03 10:49:32', '103.1.100.226', NULL, NULL, NULL, 0),
(277, 3, 3, 14, 'Matar Chilla', 'matar-chilla', NULL, 1, 0, '2024-12-03 10:49:48', '2024-12-03 10:49:48', '103.1.100.226', NULL, NULL, NULL, 0),
(278, 4, 3, 14, 'Pop Chilla', 'pop-chilla', NULL, 1, 0, '2024-12-03 10:50:11', '2024-12-03 10:50:11', '103.1.100.226', NULL, NULL, NULL, 0),
(279, 5, 3, 14, 'Variety  Of Chilla', 'variety--of-chilla', NULL, 1, 0, '2024-12-03 10:50:53', '2024-12-03 10:50:53', '103.1.100.226', NULL, NULL, NULL, 0),
(280, 6, 3, 14, 'Panchkutir Chilla', 'panchkutir-chilla', NULL, 1, 0, '2024-12-03 10:51:34', '2024-12-03 10:51:34', '103.1.100.226', NULL, NULL, NULL, 0),
(281, 2, 3, 15, 'Spring Dosa', 'spring-dosa', NULL, 1, 0, '2024-12-03 10:52:09', '2024-12-03 10:52:09', '103.1.100.226', NULL, NULL, NULL, 0),
(282, 3, 3, 15, 'Cheese Dosa', 'cheese-dosa', NULL, 1, 0, '2024-12-03 10:52:32', '2024-12-03 10:52:32', '103.1.100.226', NULL, NULL, NULL, 0),
(283, 4, 3, 15, 'Jodhpuri Dosa', 'jodhpuri-dosa', NULL, 1, 0, '2024-12-03 10:53:13', '2024-12-03 10:53:13', '103.1.100.226', NULL, NULL, NULL, 0),
(284, 5, 3, 15, 'Mexican Dosa', 'mexican-dosa', NULL, 1, 0, '2024-12-03 10:53:32', '2024-12-03 10:53:32', '103.1.100.226', NULL, NULL, NULL, 0),
(285, 6, 3, 15, 'Italian Dosa', 'italian-dosa', NULL, 1, 0, '2024-12-03 10:53:48', '2024-12-03 10:53:48', '103.1.100.226', NULL, NULL, NULL, 0),
(286, 7, 3, 15, 'Varity Of Dosa', 'varity-of-dosa', NULL, 1, 0, '2024-12-03 10:54:10', '2024-12-03 10:54:10', '103.1.100.226', NULL, NULL, NULL, 0),
(287, 3, 3, 16, 'Rajwadi Jalebi', 'rajwadi-jalebi', NULL, 1, 0, '2024-12-03 10:55:03', '2024-12-03 10:55:03', '103.1.100.226', NULL, NULL, NULL, 0),
(288, 4, 3, 16, 'Pineapple Jalebi', 'pineapple-jalebi', NULL, 1, 0, '2024-12-03 10:55:25', '2024-12-03 10:55:25', '103.1.100.226', NULL, NULL, NULL, 0),
(289, 5, 3, 16, 'Avony Jalebi', 'avony-jalebi', NULL, 1, 0, '2024-12-03 10:56:12', '2024-12-03 10:56:12', '103.1.100.226', NULL, NULL, NULL, 0),
(290, 6, 3, 16, 'Punjabi Jalebi', 'punjabi-jalebi', NULL, 1, 0, '2024-12-03 10:56:32', '2024-12-03 10:56:32', '103.1.100.226', NULL, NULL, NULL, 0),
(291, 7, 3, 16, 'Sadi Jalebi', 'sadi-jalebi', NULL, 1, 0, '2024-12-03 10:56:53', '2024-12-03 10:56:53', '103.1.100.226', NULL, NULL, NULL, 0),
(292, 8, 3, 16, 'Gujarati Jalebi', 'gujarati-jalebi', NULL, 1, 0, '2024-12-03 10:57:08', '2024-12-03 10:57:08', '103.1.100.226', NULL, NULL, NULL, 0),
(293, 9, 3, 16, 'Kesar Jalebi', 'kesar-jalebi', NULL, 1, 0, '2024-12-03 10:57:33', '2024-12-03 10:57:33', '103.1.100.226', NULL, NULL, NULL, 0),
(294, 3, 4, 0, 'Coconut Sorba', 'coconut-sorba', NULL, 1, 0, '2024-12-03 11:37:24', '2024-12-03 11:37:24', '103.1.100.226', NULL, NULL, NULL, 0),
(295, 4, 4, 0, 'Cheese Corn Tomato', 'cheese-corn-tomato', NULL, 1, 0, '2024-12-03 11:38:12', '2024-12-03 11:38:12', '103.1.100.226', NULL, NULL, NULL, 0),
(296, 5, 4, 0, 'Tortila Soup', 'tortila-soup', NULL, 1, 0, '2024-12-03 11:38:34', '2024-12-03 11:38:34', '103.1.100.226', NULL, NULL, NULL, 0),
(297, 6, 4, 0, 'Chilli Beans Soup', 'chilli-beans-soup', NULL, 1, 0, '2024-12-03 11:38:53', '2024-12-03 11:38:59', '103.1.100.226', NULL, NULL, NULL, 0),
(298, 7, 4, 0, 'Tomato Rasam', 'tomato-rasam', NULL, 1, 0, '2024-12-03 11:39:13', '2024-12-03 11:39:13', '103.1.100.226', NULL, NULL, NULL, 0),
(299, 8, 4, 0, 'Tomato Dhaniya Sorba', 'tomato-dhaniya-sorba', NULL, 1, 0, '2024-12-03 11:39:32', '2024-12-03 11:39:32', '103.1.100.226', NULL, NULL, NULL, 0),
(300, 9, 4, 0, 'Sweet Corn Soup', 'sweet-corn-soup', NULL, 1, 0, '2024-12-03 11:40:14', '2024-12-03 11:40:14', '103.1.100.226', NULL, NULL, NULL, 0),
(301, 10, 4, 0, 'Palak Corn Soup', 'palak-corn-soup', NULL, 1, 0, '2024-12-03 11:41:33', '2024-12-03 11:41:33', '103.1.100.226', NULL, NULL, NULL, 0),
(302, 11, 4, 0, 'Green Peas Soup', 'green-peas-soup', NULL, 1, 0, '2024-12-03 11:41:58', '2024-12-03 11:41:58', '103.1.100.226', NULL, NULL, NULL, 0),
(303, 12, 4, 0, 'Parvar Soup', 'parvar-soup', NULL, 1, 0, '2024-12-03 11:42:28', '2024-12-03 11:42:28', '103.1.100.226', NULL, NULL, NULL, 0),
(304, 13, 4, 0, 'Cauliflower Soup', 'cauliflower-soup', NULL, 1, 0, '2024-12-03 11:43:00', '2024-12-03 11:43:00', '103.1.100.226', NULL, NULL, NULL, 0),
(305, 14, 4, 0, 'Dudhi No Soup', 'dudhi-no-soup', NULL, 1, 0, '2024-12-03 11:43:21', '2024-12-03 11:43:21', '103.1.100.226', NULL, NULL, NULL, 0),
(306, 15, 4, 0, 'Moong Dal Palak Soup', 'moong-dal-palak-soup', NULL, 1, 0, '2024-12-03 11:43:48', '2024-12-03 11:43:48', '103.1.100.226', NULL, NULL, NULL, 0),
(307, 16, 4, 0, 'Lemon Coriander Soup', 'lemon-coriander-soup', NULL, 1, 0, '2024-12-03 11:44:06', '2024-12-03 11:44:06', '103.1.100.226', NULL, NULL, NULL, 0),
(308, 17, 4, 0, 'Hot\'N\'Sour Soup', 'hot\'n\'sour-soup', NULL, 1, 0, '2024-12-03 11:44:30', '2024-12-03 11:44:30', '103.1.100.226', NULL, NULL, NULL, 0),
(309, 18, 4, 0, 'Coctail Soup', 'coctail-soup', NULL, 1, 0, '2024-12-03 11:44:53', '2024-12-03 11:44:53', '103.1.100.226', NULL, NULL, NULL, 0),
(310, 19, 4, 0, 'Veg. Manchow Soup', 'veg.-manchow-soup', NULL, 1, 0, '2024-12-03 11:45:23', '2024-12-03 11:45:23', '103.1.100.226', NULL, NULL, NULL, 0),
(311, 20, 4, 0, 'Vegetable Clear Soup', 'vegetable-clear-soup', NULL, 1, 0, '2024-12-03 11:46:06', '2024-12-03 11:46:06', '103.1.100.226', NULL, NULL, NULL, 0),
(312, 21, 4, 0, 'Wonton Soup', 'wonton-soup', NULL, 1, 0, '2024-12-03 11:46:31', '2024-12-03 11:46:31', '103.1.100.226', NULL, NULL, NULL, 0),
(313, 22, 4, 0, 'Coconut Coriander', 'coconut-coriander', NULL, 1, 0, '2024-12-03 11:46:54', '2024-12-03 11:46:54', '103.1.100.226', NULL, NULL, NULL, 0),
(314, 23, 4, 0, 'Corn Vegetable Soup', 'corn-vegetable-soup', NULL, 1, 0, '2024-12-03 11:47:20', '2024-12-03 11:47:20', '103.1.100.226', NULL, NULL, NULL, 0),
(315, 24, 4, 0, 'Almond Soup', 'almond-soup', NULL, 1, 0, '2024-12-03 11:47:40', '2024-12-03 11:47:40', '103.1.100.226', NULL, NULL, NULL, 0),
(316, 25, 4, 0, 'Vegetable Sounder', 'vegetable-sounder', NULL, 1, 0, '2024-12-03 11:48:03', '2024-12-03 11:48:03', '103.1.100.226', NULL, NULL, NULL, 0),
(317, 26, 4, 0, 'Brocolli Almond Soup', 'brocolli-almond-soup', NULL, 1, 0, '2024-12-03 11:48:25', '2024-12-03 11:48:25', '103.1.100.226', NULL, NULL, NULL, 0),
(318, 27, 4, 0, 'Hot Paper Soup', 'hot-paper-soup', NULL, 1, 0, '2024-12-03 11:50:08', '2024-12-03 11:50:08', '103.1.100.226', NULL, NULL, NULL, 0),
(319, 28, 4, 0, 'Sweet Corn Celery Soup', 'sweet-corn-celery-soup', NULL, 1, 0, '2024-12-03 11:50:47', '2024-12-03 11:50:47', '103.1.100.226', NULL, NULL, NULL, 0),
(320, 29, 4, 0, 'Thai Soup', 'thai-soup', NULL, 1, 0, '2024-12-03 11:51:03', '2024-12-03 11:51:03', '103.1.100.226', NULL, NULL, NULL, 0),
(321, 30, 4, 0, 'Pumpkin Corn Soup', 'pumpkin-corn-soup', NULL, 1, 0, '2024-12-03 11:51:38', '2024-12-03 11:51:38', '103.1.100.226', NULL, NULL, NULL, 0),
(322, 31, 4, 0, 'Pumpkin Almond Soup', 'pumpkin-almond-soup', NULL, 1, 0, '2024-12-03 11:52:02', '2024-12-03 11:52:02', '103.1.100.226', NULL, NULL, NULL, 0),
(323, 32, 4, 0, 'Lentin Gulirgaar Soup', 'lentin-gulirgaar-soup', NULL, 1, 0, '2024-12-03 11:52:34', '2024-12-03 11:52:34', '103.1.100.226', NULL, NULL, NULL, 0),
(324, 33, 4, 0, 'Manchow Soup', 'manchow-soup', NULL, 1, 0, '2024-12-03 11:53:10', '2024-12-03 11:53:10', '103.1.100.226', NULL, NULL, NULL, 0),
(325, 33, 4, 0, 'Tomato Soup', 'tomato-soup', NULL, 1, 0, '2024-12-03 11:54:17', '2024-12-03 11:54:17', '103.1.100.226', NULL, NULL, NULL, 0),
(326, 34, 4, 0, 'Tomato Cheese Corn Soup', 'tomato-cheese-corn-soup', NULL, 1, 0, '2024-12-03 11:54:33', '2024-12-03 11:54:33', '103.1.100.226', NULL, NULL, NULL, 0),
(327, 3, 5, 17, 'Veg. Fry Schezwan Rice', 'veg.-fry-schezwan-rice', NULL, 1, 0, '2024-12-03 11:55:49', '2024-12-03 11:55:49', '103.1.100.226', NULL, NULL, NULL, 0),
(328, 4, 5, 17, 'Veg. Frankie', 'veg.-frankie', NULL, 1, 0, '2024-12-03 11:56:14', '2024-12-03 11:56:14', '103.1.100.226', NULL, NULL, NULL, 0),
(329, 5, 5, 17, 'Veg. Cheese Frankie', 'veg.-cheese-frankie', NULL, 1, 0, '2024-12-03 11:56:49', '2024-12-03 11:56:49', '103.1.100.226', NULL, NULL, NULL, 0),
(330, 6, 5, 17, 'Veg. Krismi Fry', 'veg.-krismi-fry', NULL, 1, 0, '2024-12-03 11:57:44', '2024-12-03 11:57:44', '103.1.100.226', NULL, NULL, NULL, 0),
(331, 7, 5, 17, 'Veg. Khodiyar Hungama', 'veg.-khodiyar-hungama', NULL, 1, 0, '2024-12-03 11:58:11', '2024-12-03 11:58:11', '103.1.100.226', NULL, NULL, NULL, 0),
(332, 8, 5, 17, 'Veg. Paneer Chilli', 'veg.-paneer-chilli', NULL, 1, 0, '2024-12-03 11:58:39', '2024-12-03 11:58:39', '103.1.100.226', NULL, NULL, NULL, 0),
(333, 9, 5, 17, 'Paneer Chilli Dry', 'paneer-chilli-dry', NULL, 1, 0, '2024-12-03 11:59:02', '2024-12-03 11:59:02', '103.1.100.226', NULL, NULL, NULL, 0),
(334, 10, 5, 17, 'American Choupsi', 'american-choupsi', NULL, 1, 0, '2024-12-03 11:59:33', '2024-12-03 11:59:33', '103.1.100.226', NULL, NULL, NULL, 0),
(335, 11, 5, 17, 'Spring Roll', 'spring-roll', NULL, 1, 0, '2024-12-03 12:01:08', '2024-12-03 12:01:08', '103.1.100.226', NULL, NULL, NULL, 0),
(336, 12, 5, 17, 'Manchurian', 'manchurian', NULL, 1, 0, '2024-12-03 12:01:37', '2024-12-03 12:01:37', '103.1.100.226', NULL, NULL, NULL, 0),
(337, 13, 5, 17, 'Manchurian Schezwan Rice', 'manchurian-schezwan-rice', NULL, 1, 0, '2024-12-03 12:02:12', '2024-12-03 12:02:12', '103.1.100.226', NULL, NULL, NULL, 0),
(338, 14, 5, 17, 'Chinese Bhel', 'chinese-bhel', NULL, 1, 0, '2024-12-03 12:02:31', '2024-12-03 12:02:31', '103.1.100.226', NULL, NULL, NULL, 0),
(339, 15, 5, 17, 'Cone Chinese Rice', 'cone-chinese-rice', NULL, 1, 0, '2024-12-03 12:02:59', '2024-12-03 12:02:59', '103.1.100.226', NULL, NULL, NULL, 0),
(340, 16, 5, 17, 'Corn Manchurian', 'corn-manchurian', NULL, 1, 0, '2024-12-03 12:03:24', '2024-12-03 12:03:24', '103.1.100.226', NULL, NULL, NULL, 0),
(341, 17, 5, 17, 'Dry Manchurian', 'dry-manchurian', NULL, 1, 0, '2024-12-03 12:03:48', '2024-12-03 12:03:48', '103.1.100.226', NULL, NULL, NULL, 0);
INSERT INTO `product` (`productId`, `strSequenceNo`, `categoryId`, `iSubCategoryId`, `productname`, `slugname`, `description`, `iStatus`, `isDelete`, `created_at`, `updated_at`, `strIP`, `meta_title`, `meta_description`, `ShowHomePage`, `showOnFooter`) VALUES
(342, 18, 5, 17, 'Veg. Manchurian With Schezwan', 'veg.-manchurian-with-schezwan', NULL, 1, 0, '2024-12-03 12:04:45', '2024-12-03 12:04:45', '103.1.100.226', NULL, NULL, NULL, 0),
(343, 19, 5, 17, 'Chinese Sizzler', 'chinese-sizzler', NULL, 1, 0, '2024-12-03 12:05:10', '2024-12-03 12:05:10', '103.1.100.226', NULL, NULL, NULL, 0),
(344, 20, 5, 17, 'Chinese Potato', 'chinese-potato', NULL, 1, 0, '2024-12-03 12:05:34', '2024-12-03 12:05:34', '103.1.100.226', NULL, NULL, NULL, 0),
(345, 21, 5, 17, 'Paneer Cone Sizzler', 'paneer-cone-sizzler', NULL, 1, 0, '2024-12-03 12:06:05', '2024-12-03 12:06:05', '103.1.100.226', NULL, NULL, NULL, 0),
(346, 22, 5, 17, 'Veg. Menu', 'veg.-menu', NULL, 1, 0, '2024-12-03 12:06:48', '2024-12-03 12:06:48', '103.1.100.226', NULL, NULL, NULL, 0),
(347, 23, 5, 17, 'Veg. Meku Sizzler', 'veg.-meku-sizzler', NULL, 1, 0, '2024-12-03 12:07:06', '2024-12-03 12:07:06', '103.1.100.226', NULL, NULL, NULL, 0),
(348, 24, 5, 17, 'Veg. American Sizzler', 'veg.-american-sizzler', NULL, 1, 0, '2024-12-03 12:07:30', '2024-12-03 12:07:30', '103.1.100.226', NULL, NULL, NULL, 0),
(349, 3, 5, 18, 'Veg. Schezwan', 'veg.-schezwan', NULL, 1, 0, '2024-12-24 11:10:42', '2024-12-24 11:10:42', '103.1.100.226', NULL, NULL, NULL, 0),
(350, 4, 5, 18, 'Paneer Chilli Baby Corn', 'paneer-chilli-baby-corn', NULL, 1, 0, '2024-12-24 11:13:21', '2024-12-24 11:13:21', '103.1.100.226', NULL, NULL, NULL, 0),
(351, 5, 5, 18, 'Veg. Chou-Chou', 'veg.-chou-chou', NULL, 1, 0, '2024-12-24 11:14:15', '2024-12-24 11:14:15', '103.1.100.226', NULL, NULL, NULL, 0),
(352, 6, 5, 18, 'Veg. Singapore', 'veg.-singapore', NULL, 1, 0, '2024-12-24 11:15:06', '2024-12-24 11:15:06', '103.1.100.226', NULL, NULL, NULL, 0),
(353, 7, 5, 18, 'Veg. Hong Kong', 'veg.-hong-kong', NULL, 1, 0, '2024-12-24 11:16:02', '2024-12-24 11:16:02', '103.1.100.226', NULL, NULL, NULL, 0),
(354, 8, 5, 18, 'Cauliflower With Gravy', 'cauliflower-with-gravy', NULL, 1, 0, '2024-12-24 11:18:01', '2024-12-24 11:18:01', '103.1.100.226', NULL, NULL, NULL, 0),
(355, 9, 5, 18, 'Veg. Thai In White', 'veg.-thai-in-white', NULL, 1, 0, '2024-12-24 11:19:28', '2024-12-24 11:19:28', '103.1.100.226', NULL, NULL, NULL, 0),
(356, 10, 5, 18, 'Veg. Thai In Red', 'veg.-thai-in-red', NULL, 1, 0, '2024-12-24 11:20:26', '2024-12-24 11:20:26', '103.1.100.226', NULL, NULL, NULL, 0),
(357, 11, 5, 18, 'Veg. Thai In Green', 'veg.-thai-in-green', NULL, 1, 0, '2024-12-24 11:21:47', '2024-12-24 11:21:47', '103.1.100.226', NULL, NULL, NULL, 0),
(358, 12, 5, 18, 'Veg. Black In Sauce', 'veg.-black-in-sauce', NULL, 1, 0, '2024-12-24 11:23:22', '2024-12-24 11:23:22', '103.1.100.226', NULL, NULL, NULL, 0),
(359, 13, 5, 18, 'Veg. Sesame', 'veg.-sesame', NULL, 1, 0, '2024-12-24 11:24:11', '2024-12-24 11:24:11', '103.1.100.226', NULL, NULL, NULL, 0),
(360, 14, 5, 18, 'Veg. Corn In White', 'veg.-corn-in-white', NULL, 1, 0, '2024-12-24 11:26:32', '2024-12-24 11:26:32', '103.1.100.226', NULL, NULL, NULL, 0),
(361, 3, 5, 19, 'Veg. Singapore Noodles', 'veg.-singapore-noodles', NULL, 1, 0, '2024-12-24 11:29:37', '2024-12-24 11:29:37', '103.1.100.226', NULL, NULL, NULL, 0),
(362, 4, 5, 19, 'Veg. Hongkong', 'veg.-hongkong', NULL, 1, 0, '2024-12-24 11:30:36', '2024-12-24 11:30:36', '103.1.100.226', NULL, NULL, NULL, 0),
(363, 5, 5, 19, 'Veg. Honey Noodles', 'veg.-honey-noodles', NULL, 1, 0, '2024-12-24 11:31:49', '2024-12-24 11:31:49', '103.1.100.226', NULL, NULL, NULL, 0),
(364, 6, 5, 19, 'Veg. Korean Noodles', 'veg.-korean-noodles', NULL, 1, 0, '2024-12-24 11:32:09', '2024-12-24 11:32:09', '103.1.100.226', NULL, NULL, NULL, 0),
(365, 7, 5, 19, 'Veg. Combination Noodles', 'veg.-combination-noodles', NULL, 1, 0, '2024-12-24 11:32:36', '2024-12-24 11:32:36', '103.1.100.226', NULL, NULL, NULL, 0),
(366, 2, 5, 20, 'Veg. Schezwan Rice', 'veg.-schezwan-rice', NULL, 1, 0, '2024-12-24 11:33:05', '2024-12-24 11:33:05', '103.1.100.226', NULL, NULL, NULL, 0),
(367, 3, 5, 20, 'Veg. Singapore Rice', 'veg.-singapore-rice', NULL, 1, 0, '2024-12-24 11:33:31', '2024-12-24 11:33:31', '103.1.100.226', NULL, NULL, NULL, 0),
(368, 4, 5, 20, 'Veg. Hong Kong Rice', 'veg.-hong-kong-rice', NULL, 1, 0, '2024-12-24 11:33:56', '2024-12-24 11:33:56', '103.1.100.226', NULL, NULL, NULL, 0),
(369, 5, 5, 20, 'Veg. Honey Rice', 'veg.-honey-rice', NULL, 1, 0, '2024-12-24 11:34:26', '2024-12-24 11:34:26', '103.1.100.226', NULL, NULL, NULL, 0),
(370, 6, 5, 20, 'Veg. Korean Rice', 'veg.-korean-rice', NULL, 1, 0, '2024-12-24 11:34:42', '2024-12-24 11:34:42', '103.1.100.226', NULL, NULL, NULL, 0),
(371, 7, 5, 20, 'Veg. Packing Rice', 'veg.-packing-rice', NULL, 1, 0, '2024-12-24 11:34:59', '2024-12-24 11:34:59', '103.1.100.226', NULL, NULL, NULL, 0),
(372, 8, 5, 20, 'Veg. Malaysian Rice', 'veg.-malaysian-rice', NULL, 1, 0, '2024-12-24 11:35:15', '2024-12-24 11:35:15', '103.1.100.226', NULL, NULL, NULL, 0),
(373, 2, 6, 21, 'Baby Corn And Corn Soup', 'baby-corn-and-corn-soup', NULL, 1, 0, '2024-12-24 11:35:49', '2024-12-24 11:35:49', '103.1.100.226', NULL, NULL, NULL, 0),
(374, 3, 6, 21, 'Tomium Soup', 'tomium-soup', NULL, 1, 0, '2024-12-24 11:36:16', '2024-12-24 11:36:16', '103.1.100.226', NULL, NULL, NULL, 0),
(375, 4, 6, 21, 'Manchou Soup', 'manchou-soup', NULL, 1, 0, '2024-12-24 11:36:52', '2024-12-24 11:36:52', '103.1.100.226', NULL, NULL, NULL, 0),
(376, 5, 6, 21, 'Hot Garli Ginger Soup', 'hot-garli-ginger-soup', NULL, 1, 0, '2024-12-24 11:37:18', '2024-12-24 11:37:18', '103.1.100.226', NULL, NULL, NULL, 0),
(377, 2, 6, 23, 'Manchow And Vegi. Stirfry', 'manchow-and-vegi.-stirfry', NULL, 1, 0, '2024-12-24 11:38:30', '2024-12-24 11:38:30', '103.1.100.226', NULL, NULL, NULL, 0),
(378, 3, 6, 23, 'Hakka Noodles', 'hakka-noodles', NULL, 1, 0, '2024-12-24 11:38:52', '2024-12-24 11:38:52', '103.1.100.226', NULL, NULL, NULL, 0),
(379, 4, 6, 23, 'Munshu', 'munshu', NULL, 1, 0, '2024-12-24 11:39:12', '2024-12-24 11:39:12', '103.1.100.226', NULL, NULL, NULL, 0),
(380, 5, 6, 23, 'Asparagus Mushroom In Sweet Sauce', 'asparagus-mushroom-in-sweet-sauce', NULL, 1, 0, '2024-12-24 11:40:00', '2024-12-24 11:40:00', '103.1.100.226', NULL, NULL, NULL, 0),
(381, 6, 6, 23, 'Vegi. In Garlic  Sauce', 'vegi.-in-garlic--sauce', NULL, 1, 0, '2024-12-24 11:40:32', '2024-12-24 11:40:32', '103.1.100.226', NULL, NULL, NULL, 0),
(382, 7, 6, 23, 'Chinese Boil Dumpling', 'chinese-boil-dumpling', NULL, 1, 0, '2024-12-24 11:41:07', '2024-12-24 11:41:07', '103.1.100.226', NULL, NULL, NULL, 0),
(383, 2, 6, 24, 'Jewel Rice', 'jewel-rice', NULL, 1, 0, '2024-12-24 11:42:11', '2024-12-24 11:42:11', '103.1.100.226', NULL, NULL, NULL, 0),
(384, 3, 6, 24, 'Steam Rice', 'steam-rice', NULL, 1, 0, '2024-12-24 11:42:30', '2024-12-24 11:42:30', '103.1.100.226', NULL, NULL, NULL, 0),
(385, 4, 6, 24, 'Steam Rice With Creamy Vegi.', 'steam-rice-with-creamy-vegi.', NULL, 1, 0, '2024-12-24 11:43:06', '2024-12-24 11:43:06', '103.1.100.226', NULL, NULL, NULL, 0),
(386, 2, 7, 25, 'Mexican Corn Soup', 'mexican-corn-soup', NULL, 1, 0, '2024-12-24 11:43:52', '2024-12-24 11:43:52', '103.1.100.226', NULL, NULL, NULL, 0),
(387, 3, 7, 25, 'Mexican Potato Powder', 'mexican-potato-powder', NULL, 1, 0, '2024-12-24 11:44:47', '2024-12-24 11:44:47', '103.1.100.226', NULL, NULL, NULL, 0),
(388, 4, 7, 25, 'Mexican Bengal Soup', 'mexican-bengal-soup', NULL, 1, 0, '2024-12-24 11:45:26', '2024-12-24 11:45:26', '103.1.100.226', NULL, NULL, NULL, 0),
(389, 2, 7, 26, 'Beans Dip Nachos', 'beans-dip-nachos', NULL, 1, 0, '2024-12-24 11:45:47', '2024-12-24 11:45:47', '103.1.100.226', NULL, NULL, NULL, 0),
(390, 3, 7, 26, 'Cheese Sauce Salsa Corn Chips', 'cheese-sauce-salsa-corn-chips', NULL, 1, 0, '2024-12-24 11:46:41', '2024-12-24 11:46:41', '103.1.100.226', NULL, NULL, NULL, 0),
(391, 4, 7, 26, 'Chilli Cheese Strips Salsa', 'chilli-cheese-strips-salsa', NULL, 1, 0, '2024-12-24 11:47:19', '2024-12-24 11:47:19', '103.1.100.226', NULL, NULL, NULL, 0),
(392, 5, 7, 26, 'Baby Corn Fitters With Salsa', 'baby-corn-fitters-with-salsa', NULL, 1, 0, '2024-12-24 11:47:48', '2024-12-24 11:47:48', '103.1.100.226', NULL, NULL, NULL, 0),
(393, 2, 7, 27, 'Empandaz', 'empandaz', NULL, 1, 0, '2024-12-24 11:48:21', '2024-12-24 11:48:21', '103.1.100.226', NULL, NULL, NULL, 0),
(394, 3, 7, 27, 'Simi Sanga', 'simi-sanga', NULL, 1, 0, '2024-12-24 11:48:38', '2024-12-24 11:48:51', '103.1.100.226', NULL, NULL, NULL, 0),
(395, 4, 7, 27, 'Reloniz', 'reloniz', NULL, 1, 0, '2024-12-24 11:49:14', '2024-12-24 11:49:14', '103.1.100.226', NULL, NULL, NULL, 0),
(396, 5, 7, 27, 'Toastada', 'toastada', NULL, 1, 0, '2024-12-24 11:49:29', '2024-12-24 11:49:29', '103.1.100.226', NULL, NULL, NULL, 0),
(397, 6, 7, 27, 'Mexican Beans Cutlets', 'mexican-beans-cutlets', NULL, 1, 0, '2024-12-24 11:50:18', '2024-12-24 11:50:18', '103.1.100.226', NULL, NULL, NULL, 0),
(398, 7, 7, 27, 'Mexican Beans Pizza', 'mexican-beans-pizza', NULL, 1, 0, '2024-12-24 11:50:40', '2024-12-24 11:50:40', '103.1.100.226', NULL, NULL, NULL, 0),
(399, 8, 7, 27, 'Guacamole With Veg. Toastada', 'guacamole-with-veg.-toastada', NULL, 1, 0, '2024-12-24 11:51:37', '2024-12-24 11:51:37', '103.1.100.226', NULL, NULL, NULL, 0),
(400, 2, 7, 28, 'Mexican Beans Curry', 'mexican-beans-curry', NULL, 1, 0, '2024-12-24 11:51:58', '2024-12-24 11:51:58', '103.1.100.226', NULL, NULL, NULL, 0),
(401, 1, 7, 29, 'Enchi Ladaj', 'enchi-ladaj', NULL, 1, 0, '2024-12-24 11:52:19', '2024-12-24 11:52:19', '103.1.100.226', NULL, NULL, NULL, 0),
(402, 3, 7, 27, 'Vegi. Corn Chips Hot Sauce Base', 'vegi.-corn-chips-hot-sauce-base', NULL, 1, 0, '2024-12-24 11:53:04', '2024-12-24 11:53:04', '103.1.100.226', NULL, NULL, NULL, 0),
(403, 2, 7, 30, 'Mexican Beans Rice', 'mexican-beans-rice', NULL, 1, 0, '2024-12-24 11:54:03', '2024-12-24 11:54:03', '103.1.100.226', NULL, NULL, NULL, 0),
(404, 3, 7, 30, 'Mexican Vegi. Rice', 'mexican-vegi.-rice', NULL, 1, 0, '2024-12-24 11:54:29', '2024-12-24 11:54:29', '103.1.100.226', NULL, NULL, NULL, 0),
(405, 2, 8, 31, 'Tomato Spring Onion Soup', 'tomato-spring-onion-soup', NULL, 1, 0, '2024-12-24 12:30:41', '2024-12-24 12:30:41', '103.1.100.226', NULL, NULL, NULL, 0),
(406, 3, 8, 31, 'Sago Soup', 'sago-soup', NULL, 1, 0, '2024-12-24 12:30:58', '2024-12-24 12:30:58', '103.1.100.226', NULL, NULL, NULL, 0),
(407, 4, 8, 31, 'Toku Soup', 'toku-soup', NULL, 1, 0, '2024-12-24 12:31:20', '2024-12-24 12:31:20', '103.1.100.226', NULL, NULL, NULL, 0),
(408, 2, 8, 32, 'Cucumber Relish', 'cucumber-relish', NULL, 1, 0, '2024-12-24 12:31:46', '2024-12-24 12:31:46', '103.1.100.226', NULL, NULL, NULL, 0),
(409, 3, 8, 32, 'Toku Paneer Hot Dip', 'toku-paneer-hot-dip', NULL, 1, 0, '2024-12-24 12:32:14', '2024-12-24 12:32:14', '103.1.100.226', NULL, NULL, NULL, 0),
(410, 4, 8, 32, 'Gold Bags', 'gold-bags', NULL, 1, 0, '2024-12-24 12:32:31', '2024-12-24 12:32:31', '103.1.100.226', NULL, NULL, NULL, 0),
(411, 5, 8, 32, 'Sweet Potato Cake', 'sweet-potato-cake', NULL, 1, 0, '2024-12-24 12:32:57', '2024-12-24 12:32:57', '103.1.100.226', NULL, NULL, NULL, 0),
(412, 6, 8, 32, 'Spring Roll (Thai Style)', 'spring-roll-(thai-style)', NULL, 1, 0, '2024-12-24 12:33:31', '2024-12-24 12:33:31', '103.1.100.226', NULL, NULL, NULL, 0),
(413, 7, 8, 32, 'Crispy Vegi. With Relish', 'crispy-vegi.-with-relish', NULL, 1, 0, '2024-12-24 12:34:17', '2024-12-24 12:34:17', '103.1.100.226', NULL, NULL, NULL, 0),
(414, 2, 8, 33, 'Beans Sprout With Chilli Dressing', 'beans-sprout-with-chilli-dressing', NULL, 1, 0, '2024-12-24 12:34:52', '2024-12-24 12:34:52', '103.1.100.226', NULL, NULL, NULL, 0),
(415, 3, 8, 33, 'Noodles Salad', 'noodles-salad', NULL, 1, 0, '2024-12-24 12:35:14', '2024-12-24 12:35:14', '103.1.100.226', NULL, NULL, NULL, 0),
(416, 4, 8, 33, 'Java Salad', 'java-salad', NULL, 1, 0, '2024-12-24 12:35:35', '2024-12-24 12:35:35', '103.1.100.226', NULL, NULL, NULL, 0),
(417, 5, 8, 33, 'Beenkanth And Celery Salad', 'beenkanth-and-celery-salad', NULL, 1, 0, '2024-12-24 12:36:05', '2024-12-24 12:36:05', '103.1.100.226', NULL, NULL, NULL, 0),
(418, 3, 8, 34, 'Red Thai Curry', 'red-thai-curry', NULL, 1, 0, '2024-12-24 12:36:30', '2024-12-24 12:36:30', '103.1.100.226', NULL, NULL, NULL, 0),
(419, 4, 8, 34, 'Yellow Thai Curry', 'yellow-thai-curry', NULL, 1, 0, '2024-12-24 12:36:48', '2024-12-24 12:36:48', '103.1.100.226', NULL, NULL, NULL, 0),
(420, 5, 8, 34, 'Vegi. In Sesame Sauce', 'vegi.-in-sesame-sauce', NULL, 1, 0, '2024-12-24 12:37:19', '2024-12-24 12:37:19', '103.1.100.226', NULL, NULL, NULL, 0),
(421, 6, 8, 34, 'Vegi. In Coconut Cream', 'vegi.-in-coconut-cream', NULL, 1, 0, '2024-12-24 12:37:57', '2024-12-24 12:37:57', '103.1.100.226', NULL, NULL, NULL, 0),
(422, 7, 8, 34, 'Stir Fried Vegi.', 'stir-fried-vegi.', NULL, 1, 0, '2024-12-24 12:38:30', '2024-12-24 12:38:30', '103.1.100.226', NULL, NULL, NULL, 0),
(423, 2, 8, 35, 'Lazania', 'lazania', NULL, 1, 0, '2024-12-24 12:39:18', '2024-12-24 12:39:18', '103.1.100.226', NULL, NULL, NULL, 0),
(424, 3, 8, 35, 'Veg. Corn Chips Hot Sauce', 'veg.-corn-chips-hot-sauce', NULL, 1, 0, '2024-12-24 12:39:58', '2024-12-24 12:40:44', '103.1.100.226', NULL, NULL, NULL, 0),
(425, 2, 8, 36, 'Grilled Rice Curry', 'grilled-rice-curry', NULL, 1, 0, '2024-12-24 12:41:12', '2024-12-24 12:41:12', '103.1.100.226', NULL, NULL, NULL, 0),
(426, 3, 8, 36, 'Fried  Rice', 'fried--rice', NULL, 1, 0, '2024-12-24 12:41:45', '2024-12-24 12:41:45', '103.1.100.226', NULL, NULL, NULL, 0),
(427, 4, 8, 36, 'Rice Curry Sizzler Tava Upar Turmeric Fried Rice', 'rice-curry-sizzler-tava-upar-turmeric-fried-rice', NULL, 1, 0, '2024-12-24 12:43:19', '2024-12-24 12:43:19', '103.1.100.226', NULL, NULL, NULL, 0),
(428, 2, 9, 37, 'Kesar Pista Basundi', 'kesar-pista-basundi', NULL, 1, 0, '2024-12-25 09:13:54', '2024-12-25 09:13:54', '103.1.100.226', NULL, NULL, NULL, 0),
(429, 3, 9, 37, 'Shitafal Basundi', 'shitafal-basundi', NULL, 1, 0, '2024-12-25 09:14:59', '2024-12-25 09:14:59', '103.1.100.226', NULL, NULL, NULL, 0),
(430, 4, 9, 37, 'Orange Basundi', 'orange-basundi', NULL, 1, 0, '2024-12-25 09:16:07', '2024-12-25 09:16:07', '103.1.100.226', NULL, NULL, NULL, 0),
(431, 5, 9, 37, 'Anjir Walnut Basundi', 'anjir-walnut-basundi', NULL, 1, 0, '2024-12-25 10:49:09', '2024-12-25 10:49:09', '103.1.100.226', NULL, NULL, NULL, 0),
(432, 6, 9, 37, 'Sutarfeni Basundi', 'sutarfeni-basundi', NULL, 1, 0, '2024-12-25 10:49:43', '2024-12-25 10:49:43', '103.1.100.226', NULL, NULL, NULL, 0),
(433, 7, 9, 37, 'Channnapai Basundi', 'channnapai-basundi', NULL, 1, 0, '2024-12-25 10:50:07', '2024-12-25 10:50:07', '103.1.100.226', NULL, NULL, NULL, 0),
(434, 8, 9, 37, 'Apple Basundi', 'apple-basundi', NULL, 1, 0, '2024-12-25 10:50:33', '2024-12-25 10:50:33', '103.1.100.226', NULL, NULL, NULL, 0),
(435, 9, 9, 37, 'Dryfruit Basundi', 'dryfruit-basundi', NULL, 1, 0, '2024-12-25 10:51:02', '2024-12-25 10:52:01', '103.1.100.226', NULL, NULL, NULL, 0),
(436, 10, 9, 37, 'Chocolate Badam Basundi', 'chocolate-badam-basundi', NULL, 1, 0, '2024-12-25 10:51:52', '2024-12-25 10:51:52', '103.1.100.226', NULL, NULL, NULL, 0),
(437, 11, 9, 37, 'Strawberry Basundi', 'strawberry-basundi', NULL, 1, 0, '2024-12-25 10:52:23', '2024-12-25 10:52:28', '103.1.100.226', NULL, NULL, NULL, 0),
(438, 12, 9, 37, 'Anguri Basundi', 'anguri-basundi', NULL, 1, 0, '2024-12-25 10:52:59', '2024-12-25 10:52:59', '103.1.100.226', NULL, NULL, NULL, 0),
(439, 13, 9, 37, 'Pista Coated Basundi', 'pista-coated-basundi', NULL, 1, 0, '2024-12-25 10:53:33', '2024-12-25 10:53:33', '103.1.100.226', NULL, NULL, NULL, 0),
(440, 14, 9, 37, 'Strawberry Sandesh Basundi', 'strawberry-sandesh-basundi', NULL, 1, 0, '2024-12-25 10:54:11', '2024-12-25 10:54:17', '103.1.100.226', NULL, NULL, NULL, 0),
(441, 15, 9, 37, 'Lili Anjir Basundi', 'lili-anjir-basundi', NULL, 1, 0, '2024-12-25 10:54:49', '2024-12-25 10:54:49', '103.1.100.226', NULL, NULL, NULL, 0),
(442, 16, 9, 37, 'Akhrot Anjir Basundi', 'akhrot-anjir-basundi', NULL, 1, 0, '2024-12-25 10:55:08', '2024-12-25 10:55:15', '103.1.100.226', NULL, NULL, NULL, 0),
(443, 3, 9, 38, 'Rasmalai', 'rasmalai', NULL, 1, 0, '2024-12-25 10:55:50', '2024-12-25 10:55:50', '103.1.100.226', NULL, NULL, NULL, 0),
(444, 4, 9, 38, 'Rasgulla', 'rasgulla', NULL, 1, 0, '2024-12-25 10:56:07', '2024-12-25 10:56:07', '103.1.100.226', NULL, NULL, NULL, 0),
(445, 5, 9, 38, 'Rajbhog', 'rajbhog', NULL, 1, 0, '2024-12-25 10:56:34', '2024-12-25 10:56:34', '103.1.100.226', NULL, NULL, NULL, 0),
(446, 6, 9, 38, 'Chocolate Rasgulla', 'chocolate-rasgulla', NULL, 1, 0, '2024-12-25 10:56:52', '2024-12-25 10:56:52', '103.1.100.226', NULL, NULL, NULL, 0),
(447, 7, 9, 38, 'Strawberry Sandesh', 'strawberry-sandesh', NULL, 1, 0, '2024-12-25 10:57:20', '2024-12-25 10:57:20', '103.1.100.226', NULL, NULL, NULL, 0),
(448, 8, 9, 38, 'Bengali Twins Malai Roll', 'bengali-twins-malai-roll', NULL, 1, 0, '2024-12-25 10:57:51', '2024-12-25 10:57:51', '103.1.100.226', NULL, NULL, NULL, 0),
(449, 9, 9, 38, 'Strawberry Twins', 'strawberry-twins', NULL, 1, 0, '2024-12-25 10:58:16', '2024-12-25 10:58:16', '103.1.100.226', NULL, NULL, NULL, 0),
(450, 10, 9, 38, 'Sitafal Plaza', 'sitafal-plaza', NULL, 1, 0, '2024-12-25 10:58:57', '2024-12-25 10:58:57', '103.1.100.226', NULL, NULL, NULL, 0),
(451, 11, 9, 38, 'Indrani', 'indrani', NULL, 1, 0, '2024-12-25 10:59:15', '2024-12-25 10:59:15', '103.1.100.226', NULL, NULL, NULL, 0),
(452, 12, 9, 38, 'Rajbhog Mini Malai', 'rajbhog-mini-malai', NULL, 1, 0, '2024-12-25 10:59:40', '2024-12-25 10:59:40', '103.1.100.226', NULL, NULL, NULL, 0),
(453, 13, 9, 38, 'Rolls', 'rolls', NULL, 1, 0, '2024-12-25 11:00:04', '2024-12-25 11:00:04', '103.1.100.226', NULL, NULL, NULL, 0),
(454, 14, 9, 38, 'Kesar Sandesh', 'kesar-sandesh', NULL, 1, 0, '2024-12-25 11:00:28', '2024-12-25 11:00:28', '103.1.100.226', NULL, NULL, NULL, 0),
(455, 2, 9, 39, 'Mango Cream Pleasure', 'mango-cream-pleasure', NULL, 1, 0, '2024-12-25 11:00:55', '2024-12-25 11:00:55', '103.1.100.226', NULL, NULL, NULL, 0),
(456, 3, 9, 39, 'Mango Delight', 'mango-delight', NULL, 1, 0, '2024-12-25 11:01:14', '2024-12-25 11:01:14', '103.1.100.226', NULL, NULL, NULL, 0),
(457, 4, 9, 39, 'Cream Fruit Rasmalai', 'cream-fruit-rasmalai', NULL, 1, 0, '2024-12-25 11:01:58', '2024-12-25 11:01:58', '103.1.100.226', NULL, NULL, NULL, 0),
(458, 5, 9, 39, 'Strawberry Delight', 'strawberry-delight', NULL, 1, 0, '2024-12-25 11:02:19', '2024-12-25 11:02:19', '103.1.100.226', NULL, NULL, NULL, 0),
(459, 6, 9, 39, 'Orange Delight', 'orange-delight', NULL, 1, 0, '2024-12-25 11:02:53', '2024-12-25 11:02:53', '103.1.100.226', NULL, NULL, NULL, 0),
(460, 7, 9, 39, 'Orange Channapai', 'orange-channapai', NULL, 1, 0, '2024-12-25 11:03:13', '2024-12-25 11:03:13', '103.1.100.226', NULL, NULL, NULL, 0),
(461, 8, 9, 39, 'Mango Channapai', 'mango-channapai', NULL, 1, 0, '2024-12-25 11:03:29', '2024-12-25 11:03:29', '103.1.100.226', NULL, NULL, NULL, 0),
(462, 2, 9, 40, 'Ghebar Rabdi', 'ghebar-rabdi', NULL, 1, 0, '2024-12-25 11:04:08', '2024-12-25 11:04:08', '103.1.100.226', NULL, NULL, NULL, 0),
(463, 3, 9, 40, 'Anjir Rabdi', 'anjir-rabdi', NULL, 1, 0, '2024-12-25 11:04:44', '2024-12-25 11:04:44', '103.1.100.226', NULL, NULL, NULL, 0),
(464, 4, 9, 40, 'Angur Rabdi', 'angur-rabdi', NULL, 1, 0, '2024-12-25 11:05:06', '2024-12-25 11:05:06', '103.1.100.226', NULL, NULL, NULL, 0),
(465, 5, 9, 40, 'Sitafal Rabdi', 'sitafal-rabdi', NULL, 1, 0, '2024-12-25 11:05:24', '2024-12-25 11:05:24', '103.1.100.226', NULL, NULL, NULL, 0),
(466, 6, 9, 40, 'Strawberry Rabdi', 'strawberry-rabdi', NULL, 1, 0, '2024-12-25 11:05:45', '2024-12-25 11:05:45', '103.1.100.226', NULL, NULL, NULL, 0),
(467, 7, 9, 40, 'Imarti Rabdi', 'imarti-rabdi', NULL, 1, 0, '2024-12-25 11:06:07', '2024-12-25 11:06:14', '103.1.100.226', NULL, NULL, NULL, 0),
(468, 8, 9, 40, 'Maalpua Rabdi', 'maalpua-rabdi', NULL, 1, 0, '2024-12-25 11:06:48', '2024-12-25 11:06:48', '103.1.100.226', NULL, NULL, NULL, 0),
(469, 9, 9, 40, 'Mava Kachori Rabdi', 'mava-kachori-rabdi', NULL, 1, 0, '2024-12-25 11:07:16', '2024-12-25 11:07:16', '103.1.100.226', NULL, NULL, NULL, 0),
(470, 10, 9, 40, 'Kesar Pista Rabdi', 'kesar-pista-rabdi', NULL, 1, 0, '2024-12-25 11:07:49', '2024-12-25 11:07:49', '103.1.100.226', NULL, NULL, NULL, 0),
(471, 2, 9, 41, 'Pineapple Orange Rasmalai', 'pineapple-orange-rasmalai', NULL, 1, 0, '2024-12-25 11:08:37', '2024-12-25 11:08:37', '103.1.100.226', NULL, NULL, NULL, 0),
(472, 3, 9, 41, 'Strawberry Rasmalai', 'strawberry-rasmalai', NULL, 1, 0, '2024-12-25 11:09:34', '2024-12-25 11:09:34', '103.1.100.226', NULL, NULL, NULL, 0),
(473, 4, 9, 41, 'Mango Rasmalai', 'mango-rasmalai', NULL, 1, 0, '2024-12-25 11:09:58', '2024-12-25 11:09:58', '103.1.100.226', NULL, NULL, NULL, 0),
(474, 5, 9, 41, 'Litchi Cream Delight Rasmalai', 'litchi-cream-delight-rasmalai', NULL, 1, 0, '2024-12-25 11:10:24', '2024-12-25 11:10:24', '103.1.100.226', NULL, NULL, NULL, 0),
(475, 6, 9, 41, 'Mango Cream Delight Rasmalai', 'mango-cream-delight-rasmalai', NULL, 1, 0, '2024-12-25 11:10:50', '2024-12-25 11:10:50', '103.1.100.226', NULL, NULL, NULL, 0),
(476, 7, 9, 41, 'Orange Cream Rasmalai', 'orange-cream-rasmalai', NULL, 1, 0, '2024-12-25 11:11:19', '2024-12-25 11:11:19', '103.1.100.226', NULL, NULL, NULL, 0),
(477, 8, 9, 41, 'Choco Cream Rasmalai', 'choco-cream-rasmalai', NULL, 1, 0, '2024-12-25 11:11:55', '2024-12-25 11:11:55', '103.1.100.226', NULL, NULL, NULL, 0),
(478, 1, 9, 42, 'Pina Cherry Cream', 'pina-cherry-cream', NULL, 1, 0, '2024-12-25 11:12:28', '2024-12-25 11:12:28', '103.1.100.226', NULL, NULL, NULL, 0),
(479, 2, 9, 42, 'Creamsalad Mix', 'creamsalad-mix', NULL, 1, 0, '2024-12-25 11:12:51', '2024-12-25 11:12:51', '103.1.100.226', NULL, NULL, NULL, 0),
(480, 3, 9, 42, 'Dryfruit Cream Salad', 'dryfruit-cream-salad', NULL, 1, 0, '2024-12-25 11:13:24', '2024-12-25 11:13:24', '103.1.100.226', NULL, NULL, NULL, 0),
(481, 4, 9, 42, 'Shahi Cream Salad', 'shahi-cream-salad', NULL, 1, 0, '2024-12-25 11:13:46', '2024-12-25 11:13:46', '103.1.100.226', NULL, NULL, NULL, 0),
(482, 5, 9, 42, 'Cream Pleasure', 'cream-pleasure', NULL, 1, 0, '2024-12-25 11:14:16', '2024-12-25 11:14:16', '103.1.100.226', NULL, NULL, NULL, 0),
(483, 2, 9, 43, 'Kesar Chappanbhog', 'kesar-chappanbhog', NULL, 1, 0, '2024-12-25 11:14:39', '2024-12-25 11:14:39', '103.1.100.226', NULL, NULL, NULL, 0),
(484, 3, 9, 43, 'Pina Cherry', 'pina-cherry', NULL, 1, 0, '2024-12-25 11:15:01', '2024-12-25 11:15:01', '103.1.100.226', NULL, NULL, NULL, 0),
(485, 4, 9, 43, 'Fresh Strawberry', 'fresh-strawberry', NULL, 1, 0, '2024-12-25 11:15:23', '2024-12-25 11:15:23', '103.1.100.226', NULL, NULL, NULL, 0),
(486, 5, 9, 43, 'Litchi Delight', 'litchi-delight', NULL, 1, 0, '2024-12-25 11:15:49', '2024-12-25 11:15:54', '103.1.100.226', NULL, NULL, NULL, 0),
(487, 6, 9, 43, 'Orange Jelly', 'orange-jelly', NULL, 1, 0, '2024-12-25 11:16:21', '2024-12-25 11:16:21', '103.1.100.226', NULL, NULL, NULL, 0),
(488, 7, 9, 43, 'Kesar Rajbhog', 'kesar-rajbhog', NULL, 1, 0, '2024-12-25 11:16:43', '2024-12-25 11:16:43', '103.1.100.226', NULL, NULL, NULL, 0),
(489, 8, 9, 43, 'Anjir Kaju', 'anjir-kaju', NULL, 1, 0, '2024-12-25 11:16:59', '2024-12-25 11:16:59', '103.1.100.226', NULL, NULL, NULL, 0),
(490, 9, 9, 43, 'Kaju Draksh', 'kaju-draksh', NULL, 1, 0, '2024-12-25 11:17:23', '2024-12-25 11:17:23', '103.1.100.226', NULL, NULL, NULL, 0),
(491, 10, 9, 43, 'Green Pista', 'green-pista', NULL, 1, 0, '2024-12-25 11:17:41', '2024-12-25 11:17:41', '103.1.100.226', NULL, NULL, NULL, 0),
(492, 11, 9, 43, 'Creamfruit', 'creamfruit', NULL, 1, 0, '2024-12-25 11:18:00', '2024-12-25 11:18:00', '103.1.100.226', NULL, NULL, NULL, 0),
(493, 12, 9, 43, 'Mango Ripple', 'mango-ripple', NULL, 1, 0, '2024-12-25 11:18:19', '2024-12-25 11:18:19', '103.1.100.226', NULL, NULL, NULL, 0),
(494, 13, 9, 43, 'Elaichi', 'elaichi', NULL, 1, 0, '2024-12-25 11:18:33', '2024-12-25 11:18:33', '103.1.100.226', NULL, NULL, NULL, 0),
(495, 3, 9, 44, 'Kaju Kadash', 'kaju-kadash', NULL, 1, 0, '2024-12-25 11:18:57', '2024-12-25 11:18:57', '103.1.100.226', NULL, NULL, NULL, 0),
(496, 4, 9, 44, 'Pista Pan', 'pista-pan', NULL, 1, 0, '2024-12-25 11:19:17', '2024-12-25 11:19:17', '103.1.100.226', NULL, NULL, NULL, 0),
(497, 5, 9, 44, 'Dryfruit Sitafal', 'dryfruit-sitafal', NULL, 1, 0, '2024-12-25 11:19:52', '2024-12-25 11:19:52', '103.1.100.226', NULL, NULL, NULL, 0),
(498, 6, 9, 44, 'Dryfruit Apple', 'dryfruit-apple', NULL, 1, 0, '2024-12-25 11:20:07', '2024-12-25 11:20:07', '103.1.100.226', NULL, NULL, NULL, 0),
(499, 7, 9, 44, 'Kaju Anjir Rolls', 'kaju-anjir-rolls', NULL, 1, 0, '2024-12-25 11:20:39', '2024-12-25 11:20:39', '103.1.100.226', NULL, NULL, NULL, 0),
(500, 8, 9, 44, 'Kaju Pista Rolls', 'kaju-pista-rolls', NULL, 1, 0, '2024-12-25 11:21:02', '2024-12-25 11:21:02', '103.1.100.226', NULL, NULL, NULL, 0),
(501, 9, 9, 44, 'Pista Lounge', 'pista-lounge', NULL, 1, 0, '2024-12-25 11:21:16', '2024-12-25 11:21:16', '103.1.100.226', NULL, NULL, NULL, 0),
(502, 10, 9, 44, 'Trirangi Barfi', 'trirangi-barfi', NULL, 1, 0, '2024-12-25 11:21:39', '2024-12-25 11:21:39', '103.1.100.226', NULL, NULL, NULL, 0),
(503, 11, 9, 44, 'Kaju Katli', 'kaju-katli', NULL, 1, 0, '2024-12-25 11:21:59', '2024-12-25 11:21:59', '103.1.100.226', NULL, NULL, NULL, 0),
(504, 12, 9, 44, 'Sandwich', 'sandwich', NULL, 1, 0, '2024-12-25 11:22:44', '2024-12-25 11:22:44', '103.1.100.226', NULL, NULL, NULL, 0),
(505, 13, 9, 44, 'Pista Ghari With Sitafal', 'pista-ghari-with-sitafal', NULL, 1, 0, '2024-12-25 11:23:26', '2024-12-25 11:23:26', '103.1.100.226', NULL, NULL, NULL, 0),
(506, 14, 9, 44, 'Kaju Mango Tavapuri', 'kaju-mango-tavapuri', NULL, 1, 0, '2024-12-25 11:23:56', '2024-12-25 11:23:56', '103.1.100.226', NULL, NULL, NULL, 0),
(507, 15, 9, 44, 'Kaju Pineapple Tavapuri', 'kaju-pineapple-tavapuri', NULL, 1, 0, '2024-12-25 11:24:21', '2024-12-25 11:24:21', '103.1.100.226', NULL, NULL, NULL, 0),
(508, 16, 9, 44, 'Kaju Orange Tava Puri', 'kaju-orange-tava-puri', NULL, 1, 0, '2024-12-25 11:24:47', '2024-12-25 11:24:47', '103.1.100.226', NULL, NULL, NULL, 0),
(509, 17, 9, 44, 'Kaju Copra Rolls', 'kaju-copra-rolls', NULL, 1, 0, '2024-12-25 11:25:09', '2024-12-25 11:25:09', '103.1.100.226', NULL, NULL, NULL, 0),
(510, 18, 9, 44, 'Dryfruit Ghughra', 'dryfruit-ghughra', NULL, 1, 0, '2024-12-25 11:25:29', '2024-12-25 11:25:29', '103.1.100.226', NULL, NULL, NULL, 0),
(511, 3, 9, 45, 'Badam Halvo', 'badam-halvo', NULL, 1, 0, '2024-12-25 11:32:48', '2024-12-25 11:32:48', '103.1.100.226', NULL, NULL, NULL, 0),
(512, 4, 9, 45, 'Kaju Copra No Halvo', 'kaju-copra-no-halvo', NULL, 1, 0, '2024-12-25 11:33:45', '2024-12-25 11:33:45', '103.1.100.226', NULL, NULL, NULL, 0),
(513, 5, 9, 45, 'Dal Badam Halvo', 'dal-badam-halvo', NULL, 1, 0, '2024-12-25 11:55:00', '2024-12-25 11:55:00', '103.1.100.226', NULL, NULL, NULL, 0),
(514, 6, 9, 45, 'Moong Dal No Halvo', 'moong-dal-no-halvo', NULL, 1, 0, '2024-12-25 11:56:00', '2024-12-25 11:56:00', '103.1.100.226', NULL, NULL, NULL, 0),
(515, 7, 9, 45, 'Lila Chana No Halvo', 'lila-chana-no-halvo', NULL, 1, 0, '2024-12-25 13:02:10', '2024-12-25 13:02:10', '103.1.100.226', NULL, NULL, NULL, 0),
(516, 8, 9, 45, 'Majum', 'majum', NULL, 1, 0, '2024-12-25 13:02:29', '2024-12-25 13:02:29', '103.1.100.226', NULL, NULL, NULL, 0),
(517, 9, 9, 45, 'Gajar No Halvo', 'gajar-no-halvo', NULL, 1, 0, '2024-12-25 13:02:51', '2024-12-25 13:02:51', '103.1.100.226', NULL, NULL, NULL, 0),
(518, 10, 9, 45, 'Dudhi No Halvo', 'dudhi-no-halvo', NULL, 1, 0, '2024-12-25 13:03:33', '2024-12-25 13:03:33', '103.1.100.226', NULL, NULL, NULL, 0),
(519, 11, 9, 45, 'Suka Meva No Halvo', 'suka-meva-no-halvo', NULL, 1, 0, '2024-12-25 13:03:55', '2024-12-25 13:03:55', '103.1.100.226', NULL, NULL, NULL, 0),
(520, 12, 9, 45, 'Kaju Akhrot No Halvo', 'kaju-akhrot-no-halvo', NULL, 1, 0, '2024-12-25 13:04:16', '2024-12-25 13:04:24', '103.1.100.226', NULL, NULL, NULL, 0),
(521, 13, 9, 45, 'Tava Sweet (Mix) Garam', 'tava-sweet-(mix)-garam', NULL, 1, 0, '2024-12-25 13:04:55', '2024-12-25 13:04:55', '103.1.100.226', NULL, NULL, NULL, 0),
(522, 14, 9, 45, 'Madhur Milan Halvo', 'madhur-milan-halvo', NULL, 1, 0, '2024-12-25 13:05:20', '2024-12-25 13:05:20', '103.1.100.226', NULL, NULL, NULL, 0),
(523, 15, 9, 45, 'Pineapple Halvo', 'pineapple-halvo', NULL, 1, 0, '2024-12-25 13:05:46', '2024-12-25 13:05:46', '103.1.100.226', NULL, NULL, NULL, 0),
(524, 16, 9, 45, 'Tava  Sizzler', 'tava--sizzler', NULL, 1, 0, '2024-12-25 13:06:31', '2024-12-25 13:06:31', '103.1.100.226', NULL, NULL, NULL, 0),
(525, 17, 9, 45, 'Tava Mehfil', 'tava-mehfil', NULL, 1, 0, '2024-12-25 13:06:50', '2024-12-25 13:06:56', '103.1.100.226', NULL, NULL, NULL, 0),
(526, 18, 9, 45, 'Tirang Halvo', 'tirang-halvo', NULL, 1, 0, '2024-12-25 13:07:14', '2024-12-25 13:07:14', '103.1.100.226', NULL, NULL, NULL, 0),
(527, 2, 9, 46, 'Sev Dudhpak', 'sev-dudhpak', NULL, 1, 0, '2024-12-25 13:07:33', '2024-12-25 13:07:33', '103.1.100.226', NULL, NULL, NULL, 0),
(528, 3, 9, 46, 'Dryfruit Kheer', 'dryfruit-kheer', NULL, 1, 0, '2024-12-25 13:07:55', '2024-12-25 13:07:55', '103.1.100.226', NULL, NULL, NULL, 0),
(529, 4, 9, 46, 'Dudh Poha', 'dudh-poha', NULL, 1, 0, '2024-12-25 13:08:12', '2024-12-25 13:08:12', '103.1.100.226', NULL, NULL, NULL, 0),
(530, 5, 9, 46, 'Gajar Ni Kheer', 'gajar-ni-kheer', NULL, 1, 0, '2024-12-25 13:08:46', '2024-12-25 13:08:46', '103.1.100.226', NULL, NULL, NULL, 0),
(531, 6, 9, 46, 'Gajar Dudhpak', 'gajar-dudhpak', NULL, 1, 0, '2024-12-25 13:09:01', '2024-12-25 13:09:01', '103.1.100.226', NULL, NULL, NULL, 0),
(532, 7, 9, 46, 'Dudhi No Dudhpak', 'dudhi-no-dudhpak', NULL, 1, 0, '2024-12-25 13:09:31', '2024-12-25 13:09:31', '103.1.100.226', NULL, NULL, NULL, 0),
(533, 3, 9, 47, 'Kalakand (Dryfruit)', 'kalakand-(dryfruit)', NULL, 1, 0, '2024-12-25 13:10:03', '2024-12-25 13:10:03', '103.1.100.226', NULL, NULL, NULL, 0),
(534, 4, 9, 47, 'Chocolate Mava Rolls', 'chocolate-mava-rolls', NULL, 1, 0, '2024-12-25 13:10:21', '2024-12-25 13:10:21', '103.1.100.226', NULL, NULL, NULL, 0),
(535, 5, 9, 47, 'Sona Ras', 'sona-ras', NULL, 1, 0, '2024-12-25 13:10:34', '2024-12-25 13:10:34', '103.1.100.226', NULL, NULL, NULL, 0),
(536, 6, 9, 47, 'Mava Kachori', 'mava-kachori', NULL, 1, 0, '2024-12-25 13:10:54', '2024-12-25 13:10:54', '103.1.100.226', NULL, NULL, NULL, 0),
(537, 7, 9, 47, 'Mava Copra Ghari', 'mava-copra-ghari', NULL, 1, 0, '2024-12-25 13:11:14', '2024-12-25 13:12:00', '103.1.100.226', NULL, NULL, NULL, 0),
(538, 8, 9, 47, 'Dryfruit Mava Ghari', 'dryfruit-mava-ghari', NULL, 1, 0, '2024-12-25 13:11:48', '2024-12-25 13:11:48', '103.1.100.226', NULL, NULL, NULL, 0),
(539, 9, 9, 47, 'Mava Barfi', 'mava-barfi', NULL, 1, 0, '2024-12-25 13:12:32', '2024-12-25 13:12:32', '103.1.100.226', NULL, NULL, NULL, 0),
(540, 10, 9, 47, 'Fruit Cake Barfi', 'fruit-cake-barfi', NULL, 1, 0, '2024-12-25 13:12:56', '2024-12-25 13:12:56', '103.1.100.226', NULL, NULL, NULL, 0),
(541, 11, 9, 47, 'Mava Ni Petis', 'mava-ni-petis', NULL, 1, 0, '2024-12-25 13:13:18', '2024-12-25 13:13:26', '103.1.100.226', NULL, NULL, NULL, 0),
(542, 12, 9, 47, 'Mava Na Malpua', 'mava-na-malpua', NULL, 1, 0, '2024-12-25 13:14:02', '2024-12-25 13:14:02', '103.1.100.226', NULL, NULL, NULL, 0),
(543, 3, 9, 48, 'Jalebi', 'jalebi', NULL, 1, 0, '2024-12-25 13:14:21', '2024-12-25 13:14:21', '103.1.100.226', NULL, NULL, NULL, 0),
(544, 4, 9, 48, 'Apple Jalebi', 'apple-jalebi', NULL, 1, 0, '2024-12-25 13:14:37', '2024-12-25 13:14:37', '103.1.100.226', NULL, NULL, NULL, 0),
(545, 5, 9, 48, 'Garam  Magas', 'garam--magas', NULL, 1, 0, '2024-12-25 13:15:20', '2024-12-25 13:15:20', '103.1.100.226', NULL, NULL, NULL, 0),
(546, 6, 9, 48, 'Garam Bundi', 'garam-bundi', NULL, 1, 0, '2024-12-25 13:15:38', '2024-12-25 13:15:38', '103.1.100.226', NULL, NULL, NULL, 0),
(547, 7, 9, 48, 'Gulab Ghari', 'gulab-ghari', NULL, 1, 0, '2024-12-25 13:15:58', '2024-12-25 13:15:58', '103.1.100.226', NULL, NULL, NULL, 0),
(548, 8, 9, 48, 'Copra Ghari', 'copra-ghari', NULL, 1, 0, '2024-12-25 13:16:14', '2024-12-25 13:17:15', '103.1.100.226', NULL, NULL, NULL, 0),
(549, 9, 9, 48, 'Ladu-Sukhdi', 'ladu-sukhdi', NULL, 1, 0, '2024-12-25 13:16:49', '2024-12-25 13:16:49', '103.1.100.226', NULL, NULL, NULL, 0),
(550, 10, 9, 48, 'Green Bundi Coprapak', 'green-bundi-coprapak', NULL, 1, 0, '2024-12-25 13:17:43', '2024-12-25 13:17:43', '103.1.100.226', NULL, NULL, NULL, 0),
(551, 11, 9, 48, 'Bundi Channapai', 'bundi-channapai', NULL, 1, 0, '2024-12-25 13:18:07', '2024-12-25 13:18:12', '103.1.100.226', NULL, NULL, NULL, 0),
(552, 12, 9, 48, 'Mohanthal', 'mohanthal', NULL, 1, 0, '2024-12-25 13:18:28', '2024-12-25 13:18:28', '103.1.100.226', NULL, NULL, NULL, 0),
(553, 13, 9, 48, 'Son Papadi', 'son-papadi', NULL, 1, 0, '2024-12-25 13:18:50', '2024-12-25 13:18:50', '103.1.100.226', NULL, NULL, NULL, 0),
(554, 14, 9, 48, 'Maysur', 'maysur', NULL, 1, 0, '2024-12-25 13:19:09', '2024-12-25 13:19:09', '103.1.100.226', NULL, NULL, NULL, 0),
(555, 15, 9, 48, 'Lapasi-Kansar', 'lapasi-kansar', NULL, 1, 0, '2024-12-25 13:19:34', '2024-12-25 13:19:34', '103.1.100.226', NULL, NULL, NULL, 0),
(556, 16, 9, 48, 'Bundi With Gulab Jamun(Small)', 'bundi-with-gulab-jamun(small)', NULL, 1, 0, '2024-12-25 13:20:03', '2024-12-25 13:20:10', '103.1.100.226', NULL, NULL, NULL, 0),
(557, 17, 9, 48, 'Imarti Jalebi', 'imarti-jalebi', NULL, 1, 0, '2024-12-25 13:20:34', '2024-12-25 13:20:34', '103.1.100.226', NULL, NULL, NULL, 0),
(558, 18, 9, 48, 'Kaju Anjir Tava Puri', 'kaju-anjir-tava-puri', NULL, 1, 0, '2024-12-25 13:20:57', '2024-12-25 13:20:57', '103.1.100.226', NULL, NULL, NULL, 0),
(559, 19, 9, 48, 'Kaju No Maysur (Live)', 'kaju-no-maysur-(live)', NULL, 1, 0, '2024-12-25 13:21:18', '2024-12-25 13:21:32', '103.1.100.226', NULL, NULL, NULL, 0),
(560, 2, 10, 49, 'White Beans Soup', 'white-beans-soup', NULL, 1, 0, '2024-12-25 13:22:02', '2024-12-25 13:22:02', '103.1.100.226', NULL, NULL, NULL, 0),
(561, 3, 10, 49, 'Farmer Soup (Tomato Onion Chilli)', 'farmer-soup-(tomato-onion-chilli)', NULL, 1, 0, '2024-12-25 13:22:44', '2024-12-25 13:22:44', '103.1.100.226', NULL, NULL, NULL, 0),
(562, 4, 10, 49, 'Mulberrt Soup', 'mulberrt-soup', NULL, 1, 0, '2024-12-25 13:23:05', '2024-12-25 13:23:05', '103.1.100.226', NULL, NULL, NULL, 0),
(563, 2, 10, 50, 'Mushroom And Sour Cream', 'mushroom-and-sour-cream', NULL, 1, 0, '2024-12-25 13:23:59', '2024-12-25 13:23:59', '103.1.100.226', NULL, NULL, NULL, 0),
(564, 3, 10, 50, 'Potato Tray', 'potato-tray', NULL, 1, 0, '2024-12-25 13:24:19', '2024-12-25 13:24:19', '103.1.100.226', NULL, NULL, NULL, 0),
(565, 4, 10, 50, 'Cabbage Cauliflower Fitters', 'cabbage-cauliflower-fitters', NULL, 1, 0, '2024-12-25 13:25:01', '2024-12-25 13:25:01', '103.1.100.226', NULL, NULL, NULL, 0),
(566, 5, 10, 50, 'Paper Pen Fax', 'paper-pen-fax', NULL, 1, 0, '2024-12-25 13:25:29', '2024-12-25 13:25:29', '103.1.100.226', NULL, NULL, NULL, 0),
(567, 1, 10, 51, 'Snowey Potato', 'snowey-potato', NULL, 1, 0, '2024-12-25 13:25:51', '2024-12-25 13:25:51', '103.1.100.226', NULL, NULL, NULL, 0),
(568, 3, 10, 51, 'Hungarian Pizza', 'hungarian-pizza', NULL, 1, 0, '2024-12-25 13:26:09', '2024-12-25 13:26:15', '103.1.100.226', NULL, NULL, NULL, 0),
(569, 4, 10, 51, 'Crispy Cabbage Cauliflower With Sour Cream', 'crispy-cabbage-cauliflower-with-sour-cream', NULL, 1, 0, '2024-12-25 13:27:03', '2024-12-25 13:27:03', '103.1.100.226', NULL, NULL, NULL, 0),
(570, 2, 10, 52, 'Cabbage Apple Salad', 'cabbage-apple-salad', NULL, 1, 0, '2024-12-25 13:27:29', '2024-12-25 13:27:34', '103.1.100.226', NULL, NULL, NULL, 0),
(571, 3, 10, 52, 'Potato Salad', 'potato-salad', NULL, 1, 0, '2024-12-25 13:27:53', '2024-12-25 13:27:53', '103.1.100.226', NULL, NULL, NULL, 0),
(572, 2, 10, 53, 'Hill Bread', 'hill-bread', NULL, 1, 0, '2024-12-25 13:28:17', '2024-12-25 13:28:17', '103.1.100.226', NULL, NULL, NULL, 0),
(573, 2, 10, 54, 'Mango Cream', 'mango-cream', NULL, 1, 0, '2024-12-25 13:28:34', '2024-12-25 13:28:34', '103.1.100.226', NULL, NULL, NULL, 0),
(574, 3, 10, 54, 'Heart With Vanilla', 'heart-with-vanilla', NULL, 1, 0, '2024-12-25 13:29:02', '2024-12-25 13:29:02', '103.1.100.226', NULL, NULL, NULL, 0),
(575, 2, 10, 55, 'Strawberry Cream', 'strawberry-cream', NULL, 1, 0, '2024-12-25 13:29:23', '2024-12-25 13:29:23', '103.1.100.226', NULL, NULL, NULL, 0),
(576, 3, 10, 55, 'Pudding', 'pudding', NULL, 1, 0, '2024-12-25 13:29:53', '2024-12-25 13:29:53', '103.1.100.226', NULL, NULL, NULL, 0),
(577, 4, 10, 55, 'Vanilla Ice-cream With Pudding', 'vanilla-ice-cream-with-pudding', NULL, 1, 0, '2024-12-25 13:30:25', '2024-12-25 13:31:30', '103.1.100.226', NULL, NULL, NULL, 0),
(578, 5, 10, 55, 'Baraf Chin With Ice-cream', 'baraf-chin-with-ice-cream', NULL, 1, 0, '2024-12-25 13:31:23', '2024-12-25 13:31:38', '103.1.100.226', NULL, NULL, NULL, 0),
(579, 1, 2, 5, 'PPP', 'ppp', NULL, 1, 0, '2025-03-19 12:12:35', '2025-03-19 12:12:35', '42.105.172.145', NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `productinquiry`
--

CREATE TABLE `productinquiry` (
  `inquiry_id` int(11) NOT NULL,
  `productid` varchar(255) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `mobileNumber` varchar(12) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `message` text,
  `location` varchar(255) DEFAULT NULL,
  `strIp` varchar(50) NOT NULL,
  `iStatus` int(11) NOT NULL DEFAULT '1',
  `isDelete` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `productinquiry`
--

INSERT INTO `productinquiry` (`inquiry_id`, `productid`, `name`, `mobileNumber`, `email`, `message`, `location`, `strIp`, `iStatus`, `isDelete`, `created_at`, `updated_at`) VALUES
(1, 'Natraj Zest with Vacuum Cleane', 'Mihir Rathod', '9898989898', 'Test@gmail.com', 'Ahmedabad', 'Ahmedabad', '103.1.100.226', 1, 0, '2024-03-27 11:53:38', NULL),
(2, 'Natraj Zest with Vacuum Cleane', 'Mihir Rathod', '9898989898', 'Test@gmail.com', 'Ahmedabad', 'Ahmedabad', '103.1.100.226', 1, 0, '2024-03-27 11:54:34', NULL),
(3, 'Natraj Zest with Vacuum Cleane', 'Mihir Rathod', '9898989898', 'Test@gmail.com', 'Ahmedabad', 'Ahmedabad', '103.1.100.226', 1, 0, '2024-03-27 11:55:09', NULL),
(4, 'Natraj Zest with Vacuum Cleane', 'Mihir Rathod', '9898989898', 'Test@gmail.com', 'Ahmedabad', 'Ahmedabad', '103.1.100.226', 1, 0, '2024-03-27 11:57:10', NULL),
(5, 'Natraj Zest with Vacuum Cleane', 'Mihir Rathod', '9898989898', 'Test@gmail.com', 'Ahmedabad', 'Ahmedabad', '103.1.100.226', 1, 0, '2024-03-27 11:57:30', NULL),
(6, 'Natraj Zest with Vacuum Cleane', 'Mihir Rathod', '9898989898', 'Test@gmail.com', 'Ahmedabad', 'Ahmedabad', '103.1.100.226', 1, 0, '2024-03-27 11:58:03', NULL),
(7, 'Natraj Zest with Vacuum Cleane', 'Mihir Rathod', '9898989898', 'Test@gmail.com', 'Ahmedabad', 'Ahmedabad', '103.1.100.226', 1, 0, '2024-03-27 11:58:15', NULL),
(8, 'Natraj Zest with Vacuum Cleane', 'Test', '9898989898', 'Test@gmail.com', 'Baroda', 'Baroda', '103.1.100.226', 1, 0, '2024-03-27 12:37:17', NULL),
(9, 'Natraj Zest with Vacuum Cleane', 'Mihir Rathod', '9874563210', 'mihir@gmail.com', 'Testing', 'Ahmedabad', '103.1.100.226', 1, 0, '2024-03-29 06:52:16', NULL),
(10, 'Natraj Zest with Vacuum Cleane', 'Mihir Rathod', '9874563210', 'mihir@gmial.com', 'Test', 'Baroda', '103.1.100.226', 1, 0, '2024-03-29 06:57:55', NULL),
(11, 'HGL COCO BLACK', 'test', '1321435436', 'kashyap1790@gmail.com', 'jgvuygyugvujgvjugvuvgfucf ghcfgfvjhgbhjbhjhbj', 'jghgvbnh bhnjb j', '103.1.100.226', 1, 0, '2024-04-16 09:57:52', NULL),
(12, 'CARROT JUICER MEDIUM CAPACITY', 'Test Apollo Infotech', '8787878787', 'test@gmail.com', 'Test', 'Ahmedabad', '103.1.100.226', 1, 0, '2024-04-17 07:20:52', NULL),
(13, 'HGL COCO BLACK', 'Mihir Rathod', '9874563210', 'mihir@gmial.com', 'Test', 'Ahmedabad', '103.1.100.226', 1, 0, '2024-04-25 10:56:08', NULL),
(14, 'NEO FEATHER BLACK', 'Bansari Patel', '9876543210', 'bansipatel4041@gmail.com', 'Test mail message', 'Ahmedabad', '103.1.100.226', 1, 0, '2024-04-27 09:01:50', NULL),
(17, 'HGL COCO BLACK', 'Bansari Patel', '9876543210', 'bansipatel4041@gmail.com', 'Test mail', 'Ahmedabad', '103.1.100.226', 1, 0, '2024-05-02 06:22:14', NULL),
(18, 'HGL COCO BLACK', 'Bansari Patel', '9987654321', 'dev1.apolloinfotech@gmail.com', 'test mail', 'Ahmedabad', '103.1.100.226', 1, 0, '2024-05-02 08:40:32', NULL),
(19, 'IRIS HAZEL FL', 'Sonia', '7014179150', 'devisonia793@gmail.com', NULL, 'Bangalore', '49.37.171.205', 1, 0, '2024-06-04 12:20:21', NULL),
(20, '3D DOLPHIN', 'Ranjit', '7977719108', 'ranjit@rediffmail.com', 'Want to buy new machine', 'Thane', '49.36.109.71', 1, 0, '2024-08-18 06:22:47', NULL),
(21, 'NEO DARK BROWN', 'Alok Mahadik', '9372263575', 'alokmahadik2@gmail.com', NULL, 'Kandivali(east) Mumbai', '115.96.219.212', 1, 0, '2024-10-13 06:42:19', NULL),
(22, 'HGL COCO BLACK', 'PAPPU KUMAR MEENA S/O MOHAN LAL', '9602607966', 'pappumeena960@gmail.com', 'Price', 'Jahazpur', '152.59.98.98', 1, 0, '2024-10-13 13:43:08', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `productphotos`
--

CREATE TABLE `productphotos` (
  `productphotosid` int(11) NOT NULL,
  `productid` int(11) NOT NULL DEFAULT '0',
  `strphoto` varchar(255) DEFAULT NULL,
  `iStatus` int(11) NOT NULL DEFAULT '1',
  `isDelete` int(11) NOT NULL DEFAULT '0',
  `strIP` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `productphotos`
--

INSERT INTO `productphotos` (`productphotosid`, `productid`, `strphoto`, `iStatus`, `isDelete`, `strIP`, `created_at`, `updated_at`) VALUES
(62, 18, '1711774253_9738.jpg', 1, 0, '103.1.100.226', '2024-03-30 04:50:54', NULL),
(63, 18, '1711774254_6736.jpg', 1, 0, '103.1.100.226', '2024-03-30 04:50:55', NULL),
(64, 18, '1711774255_7831.jpg', 1, 0, '103.1.100.226', '2024-03-30 04:50:55', NULL),
(68, 20, '1711776216_3229.jpg', 1, 0, '103.1.100.226', '2024-03-30 05:23:36', NULL),
(69, 20, '1711776217_8544.jpg', 1, 0, '103.1.100.226', '2024-03-30 05:23:37', NULL),
(70, 20, '1711776217_3573.jpg', 1, 0, '103.1.100.226', '2024-03-30 05:23:38', NULL),
(71, 21, '1711776522_8680.jpg', 1, 0, '103.1.100.226', '2024-03-30 05:28:43', NULL),
(72, 21, '1711776523_8393.jpg', 1, 0, '103.1.100.226', '2024-03-30 05:28:43', NULL),
(73, 21, '1711776523_3228.jpg', 1, 0, '103.1.100.226', '2024-03-30 05:28:44', NULL),
(74, 22, '1711785206_2150.jpg', 1, 0, '103.1.100.226', '2024-03-30 07:53:27', NULL),
(75, 22, '1711785207_9010.jpg', 1, 0, '103.1.100.226', '2024-03-30 07:53:28', NULL),
(76, 22, '1711785208_7785.jpg', 1, 0, '103.1.100.226', '2024-03-30 07:53:29', NULL),
(77, 23, '1711785383_8950.jpg', 1, 0, '103.1.100.226', '2024-03-30 07:56:24', NULL),
(78, 23, '1711785384_1815.jpg', 1, 0, '103.1.100.226', '2024-03-30 07:56:24', NULL),
(81, 25, '1711785691_2349.jpg', 1, 0, '103.1.100.226', '2024-03-30 08:01:31', NULL),
(82, 25, '1711785691_8300.jpg', 1, 0, '103.1.100.226', '2024-03-30 08:01:32', NULL),
(83, 25, '1711785692_3771.jpg', 1, 0, '103.1.100.226', '2024-03-30 08:01:33', NULL),
(87, 27, '1711786160_1000.jpg', 1, 0, '103.1.100.226', '2024-03-30 08:09:21', NULL),
(88, 27, '1711786161_6274.jpg', 1, 0, '103.1.100.226', '2024-03-30 08:09:22', NULL),
(89, 27, '1711786162_2430.jpg', 1, 0, '103.1.100.226', '2024-03-30 08:09:23', NULL),
(90, 28, '1711787724_4599.jpg', 1, 0, '103.1.100.226', '2024-03-30 08:35:25', NULL),
(91, 28, '1711787725_5395.jpg', 1, 0, '103.1.100.226', '2024-03-30 08:35:26', NULL),
(92, 28, '1711787726_9486.jpg', 1, 0, '103.1.100.226', '2024-03-30 08:35:27', NULL),
(96, 30, '1711788138_8174.jpg', 1, 0, '103.1.100.226', '2024-03-30 08:42:18', NULL),
(97, 30, '1711788138_5754.jpg', 1, 0, '103.1.100.226', '2024-03-30 08:42:19', NULL),
(98, 30, '1711788139_1603.jpg', 1, 0, '103.1.100.226', '2024-03-30 08:42:20', NULL),
(99, 31, '1711788343_5586.jpg', 1, 0, '103.1.100.226', '2024-03-30 08:45:44', NULL),
(100, 31, '1711788344_5161.jpg', 1, 0, '103.1.100.226', '2024-03-30 08:45:45', NULL),
(101, 31, '1711788345_9399.jpg', 1, 0, '103.1.100.226', '2024-03-30 08:45:46', NULL),
(102, 32, '1711788616_9217.jpg', 1, 0, '103.1.100.226', '2024-03-30 08:50:17', NULL),
(103, 32, '1711788617_9897.jpg', 1, 0, '103.1.100.226', '2024-03-30 08:50:18', NULL),
(104, 32, '1711788618_2071.jpg', 1, 0, '103.1.100.226', '2024-03-30 08:50:18', NULL),
(105, 33, '1711948601_2162.jpg', 1, 0, '103.1.100.226', '2024-04-01 05:16:42', NULL),
(106, 33, '1711948602_8926.jpg', 1, 0, '103.1.100.226', '2024-04-01 05:16:43', NULL),
(107, 33, '1711948603_3727.jpg', 1, 0, '103.1.100.226', '2024-04-01 05:16:43', NULL),
(114, 36, '1711949091_1221.jpg', 1, 0, '103.1.100.226', '2024-04-01 05:24:52', NULL),
(115, 36, '1711949092_7071.jpg', 1, 0, '103.1.100.226', '2024-04-01 05:24:52', NULL),
(116, 36, '1711949092_4917.jpg', 1, 0, '103.1.100.226', '2024-04-01 05:24:53', NULL),
(143, 45, '1711950690_8166.jpg', 1, 0, '103.1.100.226', '2024-04-01 05:51:31', NULL),
(147, 47, '1712558498_3764.jpg', 1, 0, '103.1.100.226', '2024-04-08 06:41:39', NULL),
(148, 47, '1712558499_8676.jpg', 1, 0, '103.1.100.226', '2024-04-08 06:41:40', NULL),
(149, 47, '1712558500_1330.jpg', 1, 0, '103.1.100.226', '2024-04-08 06:41:41', NULL),
(150, 24, '1712558570_1232.jpg', 1, 0, '103.1.100.226', '2024-04-08 06:42:50', NULL),
(151, 24, '1712558706_4822.jpg', 1, 0, '103.1.100.226', '2024-04-08 06:45:06', NULL),
(152, 24, '1712558706_9579.jpg', 1, 0, '103.1.100.226', '2024-04-08 06:45:06', NULL),
(158, 49, '1712558993_5630.jpg', 1, 0, '103.1.100.226', '2024-04-08 06:49:53', NULL),
(160, 50, '1712559163_7600.jpg', 1, 0, '103.1.100.226', '2024-04-08 06:52:43', NULL),
(166, 48, '1712559996_9686.jpg', 1, 0, '103.1.100.226', '2024-04-08 07:06:37', NULL),
(168, 48, '1712560123_2346.jpg', 1, 0, '103.1.100.226', '2024-04-08 07:08:44', NULL),
(169, 48, '1712560124_9056.jpg', 1, 0, '103.1.100.226', '2024-04-08 07:08:45', NULL),
(170, 49, '1712560249_1546.jpg', 1, 0, '103.1.100.226', '2024-04-08 07:10:50', NULL),
(171, 49, '1712560250_1691.jpg', 1, 0, '103.1.100.226', '2024-04-08 07:10:51', NULL),
(172, 50, '1712560460_9988.jpg', 1, 0, '103.1.100.226', '2024-04-08 07:14:20', NULL),
(173, 50, '1712560460_7551.jpg', 1, 0, '103.1.100.226', '2024-04-08 07:14:21', NULL),
(175, 52, '1712724635_7430.jpg', 1, 0, '103.1.100.226', '2024-04-10 04:50:35', NULL),
(176, 52, '1712724635_4263.jpg', 1, 0, '103.1.100.226', '2024-04-10 04:50:35', NULL),
(177, 45, '1712724674_2663.jpg', 1, 0, '103.1.100.226', '2024-04-10 04:51:14', NULL),
(178, 45, '1712724674_7197.jpg', 1, 0, '103.1.100.226', '2024-04-10 04:51:14', NULL),
(193, 58, '1713346486_1880.jpg', 1, 0, '103.1.100.226', '2024-04-17 09:34:46', NULL),
(194, 59, '1713346526_3987.jpg', 1, 0, '103.1.100.226', '2024-04-17 09:35:26', NULL),
(204, 35, '1713510268_3822.jpg', 1, 0, '103.1.100.226', '2024-04-19 07:04:28', NULL),
(206, 34, '1713510327_1171.jpg', 1, 0, '103.1.100.226', '2024-04-19 07:05:27', NULL),
(207, 34, '1713510327_5830.jpg', 1, 0, '103.1.100.226', '2024-04-19 07:05:27', NULL),
(208, 35, '1713510399_7352.jpg', 1, 0, '103.1.100.226', '2024-04-19 07:06:39', NULL),
(209, 35, '1713510399_5252.jpg', 1, 0, '103.1.100.226', '2024-04-19 07:06:39', NULL),
(214, 64, '1713764332_9420.jpg', 1, 0, '103.1.100.226', '2024-04-22 05:38:53', NULL),
(215, 64, '1713764353_4020.jpg', 1, 0, '103.1.100.226', '2024-04-22 05:39:14', NULL),
(216, 64, '1713764354_8462.jpg', 1, 0, '103.1.100.226', '2024-04-22 05:39:14', NULL),
(217, 65, '1713764593_9513.jpg', 1, 0, '103.1.100.226', '2024-04-22 05:43:14', NULL),
(218, 65, '1713764653_3167.jpg', 1, 0, '103.1.100.226', '2024-04-22 05:44:14', NULL),
(219, 65, '1713764654_1279.jpg', 1, 0, '103.1.100.226', '2024-04-22 05:44:15', NULL),
(220, 66, '1713769502_9079.jpg', 1, 0, '103.1.100.226', '2024-04-22 07:05:03', NULL),
(221, 66, '1713769520_3346.jpg', 1, 0, '103.1.100.226', '2024-04-22 07:05:21', NULL),
(222, 66, '1713769521_3698.jpg', 1, 0, '103.1.100.226', '2024-04-22 07:05:22', NULL),
(223, 67, '1713769755_1460.jpg', 1, 0, '103.1.100.226', '2024-04-22 07:09:16', NULL),
(224, 67, '1713769778_5558.jpg', 1, 0, '103.1.100.226', '2024-04-22 07:09:38', NULL),
(225, 67, '1713769778_7850.jpg', 1, 0, '103.1.100.226', '2024-04-22 07:09:39', NULL),
(226, 68, '1713770025_3721.jpg', 1, 0, '103.1.100.226', '2024-04-22 07:13:45', NULL),
(227, 68, '1713770048_1791.jpg', 1, 0, '103.1.100.226', '2024-04-22 07:14:09', NULL),
(228, 68, '1713770049_8464.jpg', 1, 0, '103.1.100.226', '2024-04-22 07:14:10', NULL),
(229, 69, '1713774028_3141.jpg', 1, 0, '103.1.100.226', '2024-04-22 08:20:29', NULL),
(230, 69, '1713774055_9866.jpg', 1, 0, '103.1.100.226', '2024-04-22 08:20:55', NULL),
(231, 69, '1713774055_8206.jpg', 1, 0, '103.1.100.226', '2024-04-22 08:20:56', NULL),
(232, 70, '1713774279_4546.jpg', 1, 0, '103.1.100.226', '2024-04-22 08:24:40', NULL),
(233, 70, '1713774301_1697.jpg', 1, 0, '103.1.100.226', '2024-04-22 08:25:02', NULL),
(234, 70, '1713774302_1085.jpg', 1, 0, '103.1.100.226', '2024-04-22 08:25:02', NULL),
(235, 71, '1713785167_1715.jpg', 1, 0, '103.1.100.226', '2024-04-22 11:26:08', NULL),
(236, 72, '1713863506_9776.jpg', 1, 0, '103.1.100.226', '2024-04-23 09:11:46', NULL),
(237, 72, '1713863548_1686.jpg', 1, 0, '103.1.100.226', '2024-04-23 09:12:29', NULL),
(238, 72, '1713863549_2314.jpg', 1, 0, '103.1.100.226', '2024-04-23 09:12:29', NULL),
(239, 63, '1713863801_9631.png', 1, 0, '103.1.100.226', '2024-04-23 09:16:41', NULL),
(240, 63, '1713863828_4117.png', 1, 0, '103.1.100.226', '2024-04-23 09:17:08', NULL),
(241, 63, '1713863828_8808.png', 1, 0, '103.1.100.226', '2024-04-23 09:17:09', NULL),
(242, 62, '1713865234_5860.png', 1, 0, '103.1.100.226', '2024-04-23 09:40:34', NULL),
(243, 62, '1713865250_8296.png', 1, 0, '103.1.100.226', '2024-04-23 09:40:50', NULL),
(244, 62, '1713865250_5613.png', 1, 0, '103.1.100.226', '2024-04-23 09:40:50', NULL),
(245, 73, '1731334233_8327.jpg', 1, 0, '127.0.0.1', '2024-11-11 14:10:34', NULL),
(246, 74, '1731387429_6672.jpg', 1, 0, '127.0.0.1', '2024-11-12 04:57:10', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_features`
--

CREATE TABLE `product_features` (
  `product_featuresId` int(11) NOT NULL,
  `iProductId` int(11) NOT NULL DEFAULT '0',
  `strLabel` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `strValue` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `iStatus` int(11) NOT NULL DEFAULT '1',
  `isDelete` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `strIP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_features`
--

INSERT INTO `product_features` (`product_featuresId`, `iProductId`, `strLabel`, `strValue`, `iStatus`, `isDelete`, `created_at`, `updated_at`, `strIP`) VALUES
(10, 47, 'Electrical Data Motor', '1 HP, 750 W, 2880 RPM, Single Phase AC, 230 Volt, 50 Hz', 1, 0, '2024-04-12 12:05:58', '2024-04-23 12:53:28', '103.1.100.226'),
(11, 47, 'Hopper / Container Capacity', '4.5-5 Kg.', 1, 0, '2024-04-12 12:06:07', '2024-04-23 12:53:37', '103.1.100.226'),
(13, 47, 'Power Consumption (W)', '0.75 unit per hr (Approx)', 1, 0, '2024-04-12 12:06:25', '2024-04-23 12:53:52', '103.1.100.226'),
(16, 47, 'Body Size', '48cmX33cmX87cm (LxWxH)', 1, 0, '2024-04-12 12:06:49', '2024-04-23 12:54:13', '103.1.100.226'),
(17, 47, 'Net Weight (Kg)', '45 Kg. (Approx)', 1, 0, '2024-04-12 12:06:58', '2024-04-23 12:54:21', '103.1.100.226'),
(18, 16, 'Electrical Data', '1 HP, Single phase AC motor. 230 Volt , 50 Hz', 1, 0, '2024-04-12 12:05:58', '2024-04-12 12:05:58', '103.1.100.226'),
(19, 16, 'Hopper / Container Capacity', '4.5- 5 KG.', 1, 0, '2024-04-12 12:06:07', '2024-04-12 12:06:07', '103.1.100.226'),
(20, 16, 'Motor Speed (RPM)', '2880 RPM', 1, 0, '2024-04-12 12:06:15', '2024-04-12 12:06:15', '103.1.100.226'),
(21, 16, 'Power Consumption (W)', '0.75 unit per hr', 1, 0, '2024-04-12 12:06:25', '2024-04-12 12:06:25', '103.1.100.226'),
(22, 16, 'Power Requirement (V)', '240 V', 1, 0, '2024-04-12 12:06:34', '2024-04-12 12:06:34', '103.1.100.226'),
(23, 16, 'Body Material', 'Digitally Printed Shutter', 1, 0, '2024-04-12 12:06:41', '2024-04-12 12:06:41', '103.1.100.226'),
(24, 16, 'Body Size', '346mmX905mmX484mm (WxHxD)', 1, 0, '2024-04-12 12:06:49', '2024-04-12 12:06:49', '103.1.100.226'),
(25, 16, 'Net Weight (Kg)', '44 Kg.', 1, 0, '2024-04-12 12:06:58', '2024-04-12 12:06:58', '103.1.100.226'),
(26, 17, 'Electrical Data', '1 HP, Single phase AC motor. 230 Volt , 50 Hz', 1, 0, '2024-04-12 12:05:58', '2024-04-12 12:05:58', '103.1.100.226'),
(27, 17, 'Hopper / Container Capacity', '4.5- 5 KG.', 1, 0, '2024-04-12 12:06:07', '2024-04-12 12:06:07', '103.1.100.226'),
(28, 17, 'Motor Speed (RPM)', '2880 RPM', 1, 0, '2024-04-12 12:06:15', '2024-04-12 12:06:15', '103.1.100.226'),
(29, 17, 'Power Consumption (W)', '0.75 unit per hr', 1, 0, '2024-04-12 12:06:25', '2024-04-12 12:06:25', '103.1.100.226'),
(30, 17, 'Power Requirement (V)', '240 V', 1, 0, '2024-04-12 12:06:34', '2024-04-12 12:06:34', '103.1.100.226'),
(31, 17, 'Body Material', 'Digitally Printed Shutter', 1, 0, '2024-04-12 12:06:41', '2024-04-12 12:06:41', '103.1.100.226'),
(32, 17, 'Body Size', '346mmX905mmX484mm (WxHxD)', 1, 0, '2024-04-12 12:06:49', '2024-04-12 12:06:49', '103.1.100.226'),
(33, 17, 'Net Weight (Kg)', '44 Kg.', 1, 0, '2024-04-12 12:06:58', '2024-04-12 12:06:58', '103.1.100.226'),
(34, 18, 'Electrical Data Motor', '1 HP, 750 W, 2880 RPM, Single Phase AC, 230 Volt, 50 Hz', 1, 0, '2024-04-12 12:05:58', '2024-04-23 11:44:33', '103.1.100.226'),
(35, 18, 'Hopper / Container Capacity', '4.5-5 Kg.', 1, 0, '2024-04-12 12:06:07', '2024-04-23 11:44:43', '103.1.100.226'),
(37, 18, 'Power Consumption (W)', '0.75 unit per hr (Approx)', 1, 0, '2024-04-12 12:06:25', '2024-04-23 11:44:57', '103.1.100.226'),
(40, 18, 'Body Size', '48cmX33cmX87cm (LxWxH)', 1, 0, '2024-04-12 12:06:49', '2024-04-23 11:45:14', '103.1.100.226'),
(41, 18, 'Net Weight (Kg)', '45 Kg. (Approx)', 1, 0, '2024-04-12 12:06:58', '2024-04-23 11:45:23', '103.1.100.226'),
(42, 19, 'Electrical Data', '1 HP, Single phase AC motor. 230 Volt , 50 Hz', 1, 0, '2024-04-12 12:05:58', '2024-04-12 12:05:58', '103.1.100.226'),
(43, 19, 'Hopper / Container Capacity', '4.5- 5 KG.', 1, 0, '2024-04-12 12:06:07', '2024-04-12 12:06:07', '103.1.100.226'),
(44, 19, 'Motor Speed (RPM)', '2880 RPM', 1, 0, '2024-04-12 12:06:15', '2024-04-12 12:06:15', '103.1.100.226'),
(45, 19, 'Power Consumption (W)', '0.75 unit per hr', 1, 0, '2024-04-12 12:06:25', '2024-04-12 12:06:25', '103.1.100.226'),
(46, 19, 'Power Requirement (V)', '240 V', 1, 0, '2024-04-12 12:06:34', '2024-04-12 12:06:34', '103.1.100.226'),
(47, 19, 'Body Material', 'Digitally Printed Shutter', 1, 0, '2024-04-12 12:06:41', '2024-04-12 12:06:41', '103.1.100.226'),
(48, 19, 'Body Size', '346mmX905mmX484mm (WxHxD)', 1, 0, '2024-04-12 12:06:49', '2024-04-12 12:06:49', '103.1.100.226'),
(49, 19, 'Net Weight (Kg)', '44 Kg.', 1, 0, '2024-04-12 12:06:58', '2024-04-12 12:06:58', '103.1.100.226'),
(50, 20, 'Electrical Data Motor', '1 HP, 750 W, 2880 RPM, Single Phase AC, 230 Volt, 50 Hz', 1, 0, '2024-04-12 12:05:58', '2024-04-23 11:44:04', '103.1.100.226'),
(51, 20, 'Hopper / Container Capacity', '4.5-5 Kg.', 1, 0, '2024-04-12 12:06:07', '2024-04-23 11:42:17', '103.1.100.226'),
(53, 20, 'Power Consumption (W)', '0.75 unit per hr (Approx)', 1, 0, '2024-04-12 12:06:25', '2024-04-23 11:42:36', '103.1.100.226'),
(56, 20, 'Body Size', '48cmX33cmX87cm (LxWxH)', 1, 0, '2024-04-12 12:06:49', '2024-04-23 11:42:52', '103.1.100.226'),
(57, 20, 'Net Weight (Kg)', '45 Kg. (Approx)', 1, 0, '2024-04-12 12:06:58', '2024-04-23 11:43:23', '103.1.100.226'),
(58, 21, 'Electrical Data Motor', '1 HP, 750 W, 2880 RPM, Single Phase AC, 230 Volt, 50 Hz', 1, 0, '2024-04-12 12:05:58', '2024-04-23 13:11:43', '103.1.100.226'),
(59, 21, 'Hopper / Container Capacity', '4.5-5 Kg.', 1, 0, '2024-04-12 12:06:07', '2024-04-23 11:29:38', '103.1.100.226'),
(61, 21, 'Power Consumption (W)', '0.75 unit per hr (Approx)', 1, 0, '2024-04-12 12:06:25', '2024-04-23 11:22:06', '103.1.100.226'),
(64, 21, 'Body Size', '48cmX33cmX87cm (LxWxH)', 1, 0, '2024-04-12 12:06:49', '2024-04-23 11:22:55', '103.1.100.226'),
(65, 21, 'Net Weight (Kg)', '42 Kg. (Approx)', 1, 0, '2024-04-12 12:06:58', '2024-04-23 11:29:28', '103.1.100.226'),
(66, 22, 'Electrical Data Motor', '1 HP, 750 W, 2880 RPM, Single Phase AC, 230 Volt, 50 Hz', 1, 0, '2024-04-12 12:05:58', '2024-04-24 04:53:29', '103.1.100.226'),
(67, 22, 'Hopper / Container Capacity', '4.5-5 Kg.', 1, 0, '2024-04-12 12:06:07', '2024-04-23 11:28:34', '103.1.100.226'),
(69, 22, 'Power Consumption (W)', '0.75 unit per hr (Approx)', 1, 0, '2024-04-12 12:06:25', '2024-04-23 11:25:16', '103.1.100.226'),
(72, 22, 'Body Size', '48cmX33cmX87cm (LxWxH)', 1, 0, '2024-04-12 12:06:49', '2024-04-23 11:25:35', '103.1.100.226'),
(73, 22, 'Net Weight (Kg)', '42 Kg. (Approx)', 1, 0, '2024-04-12 12:06:58', '2024-04-23 11:25:45', '103.1.100.226'),
(74, 23, 'Electrical Data Motor', '1 HP, 750 W, 2880 RPM, Single Phase AC, 230 Volt, 50 Hz', 1, 0, '2024-04-12 12:05:58', '2024-04-23 13:12:49', '103.1.100.226'),
(75, 23, 'Hopper / Container Capacity', '4.5-5 Kg.', 1, 0, '2024-04-12 12:06:07', '2024-04-23 11:35:28', '103.1.100.226'),
(77, 23, 'Power Consumption (W)', '0.75 unit per hr (Approx)', 1, 0, '2024-04-12 12:06:25', '2024-04-23 11:35:50', '103.1.100.226'),
(80, 23, 'Body Size', '48cmX33cmX87cm (LxWxH)', 1, 0, '2024-04-12 12:06:49', '2024-04-23 11:36:07', '103.1.100.226'),
(81, 23, 'Net Weight (Kg)', '43 Kg. (Approx)', 1, 0, '2024-04-12 12:06:58', '2024-04-23 11:36:19', '103.1.100.226'),
(82, 24, 'Electrical Data Motor', '1 HP, 750 W, 2880 RPM, Single Phase AC, 230 Volt, 50 Hz', 1, 0, '2024-04-12 12:05:58', '2024-04-23 13:12:22', '103.1.100.226'),
(83, 24, 'Hopper / Container Capacity', '4.5-5 Kg.', 1, 0, '2024-04-12 12:06:07', '2024-04-23 11:34:02', '103.1.100.226'),
(85, 24, 'Power Consumption (W)', '0.75 unit per hr (Approx)', 1, 0, '2024-04-12 12:06:25', '2024-04-23 11:34:15', '103.1.100.226'),
(88, 24, 'Body Size', '48cmX33cmX87cm (LxWxH)', 1, 0, '2024-04-12 12:06:49', '2024-04-23 11:34:34', '103.1.100.226'),
(89, 24, 'Net Weight (Kg)', '43 Kg. (Approx)', 1, 0, '2024-04-12 12:06:58', '2024-04-23 11:34:43', '103.1.100.226'),
(90, 25, 'Electrical Data Motor', '1 HP,750 W, 2880 RPM, Single Phase AC , 230 Volt , 50 Hz', 1, 0, '2024-04-12 12:05:58', '2024-04-23 13:10:04', '103.1.100.226'),
(91, 25, 'Hopper / Container Capacity', '5.5-6 Kg.', 1, 0, '2024-04-12 12:06:07', '2024-04-23 13:10:14', '103.1.100.226'),
(93, 25, 'Power Consumption (W)', '0.75 unit per hr (Approx)', 1, 0, '2024-04-12 12:06:25', '2024-04-23 13:10:26', '103.1.100.226'),
(96, 25, 'Body Size', '48cmX33cmX97cm (LxWxH)', 1, 0, '2024-04-12 12:06:49', '2024-04-23 13:10:42', '103.1.100.226'),
(97, 25, 'Net Weight (Kg)', '44 Kg. (Approx)', 1, 0, '2024-04-12 12:06:58', '2024-04-23 13:10:51', '103.1.100.226'),
(98, 26, 'Electrical Data', '1 HP, Single phase AC motor. 230 Volt , 50 Hz', 1, 0, '2024-04-12 12:05:58', '2024-04-12 12:05:58', '103.1.100.226'),
(99, 26, 'Hopper / Container Capacity', '4.5- 5 KG.', 1, 0, '2024-04-12 12:06:07', '2024-04-12 12:06:07', '103.1.100.226'),
(100, 26, 'Motor Speed (RPM)', '2880 RPM', 1, 0, '2024-04-12 12:06:15', '2024-04-12 12:06:15', '103.1.100.226'),
(101, 26, 'Power Consumption (W)', '0.75 unit per hr', 1, 0, '2024-04-12 12:06:25', '2024-04-12 12:06:25', '103.1.100.226'),
(102, 26, 'Power Requirement (V)', '240 V', 1, 0, '2024-04-12 12:06:34', '2024-04-12 12:06:34', '103.1.100.226'),
(103, 26, 'Body Material', 'Digitally Printed Shutter', 1, 0, '2024-04-12 12:06:41', '2024-04-12 12:06:41', '103.1.100.226'),
(104, 26, 'Body Size', '346mmX905mmX484mm (WxHxD)', 1, 0, '2024-04-12 12:06:49', '2024-04-12 12:06:49', '103.1.100.226'),
(105, 26, 'Net Weight (Kg)', '44 Kg.', 1, 0, '2024-04-12 12:06:58', '2024-04-12 12:06:58', '103.1.100.226'),
(106, 27, 'Electrical Data Motor', '1 HP, 750 W, 2880 RPM, Single Phase AC, 230 Volt, 50 Hz', 1, 0, '2024-04-12 12:05:58', '2024-04-23 11:48:59', '103.1.100.226'),
(107, 27, 'Hopper / Container Capacity', '4.5-5 Kg.', 1, 0, '2024-04-12 12:06:07', '2024-04-23 11:49:12', '103.1.100.226'),
(109, 27, 'Power Consumption (W)', '0.75 unit per hr (Approx)', 1, 0, '2024-04-12 12:06:25', '2024-04-23 11:49:25', '103.1.100.226'),
(112, 27, 'Body Size', '48cmX33cmX87cm (LxWxH)', 1, 0, '2024-04-12 12:06:49', '2024-04-23 11:49:40', '103.1.100.226'),
(113, 27, 'Net Weight (Kg)', '42 Kg. (Approx)', 1, 0, '2024-04-12 12:06:58', '2024-04-23 11:49:49', '103.1.100.226'),
(114, 28, 'Electrical Data Motor', '1 HP, 750 W, 2880 RPM, Single Phase AC , 230 Volt, 50 Hz', 1, 0, '2024-04-12 12:05:58', '2024-04-23 13:11:12', '103.1.100.226'),
(115, 28, 'Hopper / Container Capacity', '4.5-5 Kg.', 1, 0, '2024-04-12 12:06:07', '2024-04-23 11:28:18', '103.1.100.226'),
(117, 28, 'Power Consumption (W)', '0.75 unit per hr (Approx)', 1, 0, '2024-04-12 12:06:25', '2024-04-23 11:26:39', '103.1.100.226'),
(120, 28, 'Body Size', '48cmX33cmX87cm (LxWxH)', 1, 0, '2024-04-12 12:06:49', '2024-04-23 11:27:09', '103.1.100.226'),
(121, 28, 'Net Weight (Kg)', '42 Kg. (Approx)', 1, 0, '2024-04-12 12:06:58', '2024-04-23 11:28:08', '103.1.100.226'),
(122, 29, 'Electrical Data', '1 HP, Single phase AC motor. 230 Volt , 50 Hz', 1, 0, '2024-04-12 12:05:58', '2024-04-12 12:05:58', '103.1.100.226'),
(123, 29, 'Hopper / Container Capacity', '4.5- 5 KG.', 1, 0, '2024-04-12 12:06:07', '2024-04-12 12:06:07', '103.1.100.226'),
(124, 29, 'Motor Speed (RPM)', '2880 RPM', 1, 0, '2024-04-12 12:06:15', '2024-04-12 12:06:15', '103.1.100.226'),
(125, 29, 'Power Consumption (W)', '0.75 unit per hr', 1, 0, '2024-04-12 12:06:25', '2024-04-12 12:06:25', '103.1.100.226'),
(126, 29, 'Power Requirement (V)', '240 V', 1, 0, '2024-04-12 12:06:34', '2024-04-12 12:06:34', '103.1.100.226'),
(127, 29, 'Body Material', 'Digitally Printed Shutter', 1, 0, '2024-04-12 12:06:41', '2024-04-12 12:06:41', '103.1.100.226'),
(128, 29, 'Body Size', '346mmX905mmX484mm (WxHxD)', 1, 0, '2024-04-12 12:06:49', '2024-04-12 12:06:49', '103.1.100.226'),
(129, 29, 'Net Weight (Kg)', '44 Kg.', 1, 0, '2024-04-12 12:06:58', '2024-04-12 12:06:58', '103.1.100.226'),
(130, 30, 'Electrical Data Motor', '1 HP, 750 W, 2880 RPM, Single Phase AC, 230 Volt, 50 Hz', 1, 0, '2024-04-12 12:05:58', '2024-04-23 11:47:46', '103.1.100.226'),
(131, 30, 'Hopper / Container Capacity', '4.5-5 Kg.', 1, 0, '2024-04-12 12:06:07', '2024-04-23 11:47:54', '103.1.100.226'),
(133, 30, 'Power Consumption (W)', '0.75 unit per hr (Approx)', 1, 0, '2024-04-12 12:06:25', '2024-04-23 11:48:08', '103.1.100.226'),
(136, 30, 'Body Size', '48cmX33cmX87cm (LxWxH)', 1, 0, '2024-04-12 12:06:49', '2024-04-23 11:48:26', '103.1.100.226'),
(137, 30, 'Net Weight (Kg)', '42 Kg. (Approx)', 1, 0, '2024-04-12 12:06:58', '2024-04-23 11:48:37', '103.1.100.226'),
(138, 31, 'Electrical Data Motor', '1 HP, 750 W, 2880 RPM, Single Phase AC, 230 Volt, 50 Hz', 1, 0, '2024-04-12 12:05:58', '2024-04-23 12:01:24', '103.1.100.226'),
(139, 31, 'Hopper / Container Capacity', '4.5-5 Kg.', 1, 0, '2024-04-12 12:06:07', '2024-04-23 11:56:58', '103.1.100.226'),
(141, 31, 'Power Consumption (W)', '0.75 unit per hr (Approx)', 1, 0, '2024-04-12 12:06:25', '2024-04-23 11:57:14', '103.1.100.226'),
(144, 31, 'Body Size', '48cmX33cmX87cm (LxWxH)', 1, 0, '2024-04-12 12:06:49', '2024-04-23 11:57:32', '103.1.100.226'),
(145, 31, 'Net Weight (Kg)', '45 Kg. (Approx)', 1, 0, '2024-04-12 12:06:58', '2024-04-23 11:57:46', '103.1.100.226'),
(146, 32, 'Electrical Data Motor', '1 HP, 750 W, 2880 RPM, Single Phase AC, 230 Volt, 50 Hz', 1, 0, '2024-04-12 12:05:58', '2024-04-23 12:01:47', '103.1.100.226'),
(147, 32, 'Hopper / Container Capacity', '4.5-5 Kg.', 1, 0, '2024-04-12 12:06:07', '2024-04-23 11:54:51', '103.1.100.226'),
(149, 32, 'Power Consumption (W)', '0.75 unit per hr (Approx)', 1, 0, '2024-04-12 12:06:25', '2024-04-23 11:55:11', '103.1.100.226'),
(152, 32, 'Body Size', '48cmX33cmX87cm (LxWxH)', 1, 0, '2024-04-12 12:06:49', '2024-04-23 11:55:35', '103.1.100.226'),
(153, 32, 'Net Weight (Kg)', '45 Kg. (Approx)', 1, 0, '2024-04-12 12:06:58', '2024-04-23 11:56:00', '103.1.100.226'),
(154, 33, 'Electrical Data Motor', '1 HP, 750 W, 2880 RPM, Single Phase AC, 230 Volt, 50 Hz', 1, 0, '2024-04-12 12:05:58', '2024-04-23 12:17:56', '103.1.100.226'),
(155, 33, 'Hopper / Container Capacity', '4.5-5 Kg.', 1, 0, '2024-04-12 12:06:07', '2024-04-23 12:18:05', '103.1.100.226'),
(157, 33, 'Power Consumption (W)', '0.75 unit per hr (Approx)', 1, 0, '2024-04-12 12:06:25', '2024-04-23 12:18:21', '103.1.100.226'),
(160, 33, 'Body Size', '48cmX33cmX87cm (LxWxH)', 1, 0, '2024-04-12 12:06:49', '2024-04-23 12:18:37', '103.1.100.226'),
(161, 33, 'Net Weight (Kg)', '45 Kg. (Approx)', 1, 0, '2024-04-12 12:06:58', '2024-04-23 12:18:46', '103.1.100.226'),
(162, 34, 'Electrical Data Motor', '1 HP, 750 W, 2880 RPM, Single Phase AC, 230 Volt, 50 Hz', 1, 0, '2024-04-12 12:05:58', '2024-04-23 12:16:29', '103.1.100.226'),
(163, 34, 'Hopper / Container Capacity', '4.5-5 Kg.', 1, 0, '2024-04-12 12:06:07', '2024-04-23 12:16:41', '103.1.100.226'),
(165, 34, 'Power Consumption (W)', '0.75 unit per hr (Approx)', 1, 0, '2024-04-12 12:06:25', '2024-04-23 12:16:55', '103.1.100.226'),
(168, 34, 'Body Size', '48cmX33cmX87cm (LxWxH)', 1, 0, '2024-04-12 12:06:49', '2024-04-23 12:17:11', '103.1.100.226'),
(169, 34, 'Net Weight (Kg)', '45 Kg. (Approx)', 1, 0, '2024-04-12 12:06:58', '2024-04-23 12:17:21', '103.1.100.226'),
(170, 35, 'Electrical Data Motor', '1 HP, 750 W, 2880 RPM, Single Phase AC, 230 Volt, 50 Hz', 1, 0, '2024-04-12 12:05:58', '2024-04-23 12:15:14', '103.1.100.226'),
(171, 35, 'Hopper / Container Capacity', '4.5-5 Kg.', 1, 0, '2024-04-12 12:06:07', '2024-04-23 12:15:26', '103.1.100.226'),
(173, 35, 'Power Consumption (W)', '0.75 unit per hr (Approx)', 1, 0, '2024-04-12 12:06:25', '2024-04-23 12:15:37', '103.1.100.226'),
(176, 35, 'Body Size', '48cmX33cmX87cm (LxWxH)', 1, 0, '2024-04-12 12:06:49', '2024-04-23 12:15:52', '103.1.100.226'),
(177, 35, 'Net Weight (Kg)', '45 Kg. (Approx)', 1, 0, '2024-04-12 12:06:58', '2024-04-23 12:16:01', '103.1.100.226'),
(178, 36, 'Electrical Data Motor', '1 HP, 750 W, 2880 RPM, Single Phase AC, 230 Volt, 50 Hz', 1, 0, '2024-04-12 12:05:58', '2024-04-23 11:58:55', '103.1.100.226'),
(179, 36, 'Hopper / Container Capacity', '4.5-5 Kg.', 1, 0, '2024-04-12 12:06:07', '2024-04-23 11:59:11', '103.1.100.226'),
(181, 36, 'Power Consumption (W)', '0.75 unit per hr (Approx)', 1, 0, '2024-04-12 12:06:25', '2024-04-23 11:59:25', '103.1.100.226'),
(184, 36, 'Body Size', '48cmX33cmX87cm (LxWxH)', 1, 0, '2024-04-12 12:06:49', '2024-04-23 11:59:45', '103.1.100.226'),
(185, 36, 'Net Weight (Kg)', '45 Kg. (Approx)', 1, 0, '2024-04-12 12:06:58', '2024-04-23 12:00:53', '103.1.100.226'),
(186, 37, 'Electrical Data', '1 HP, Single phase AC motor. 230 Volt , 50 Hz', 1, 0, '2024-04-12 12:05:58', '2024-04-12 12:05:58', '103.1.100.226'),
(187, 37, 'Hopper / Container Capacity', '4.5- 5 KG.', 1, 0, '2024-04-12 12:06:07', '2024-04-12 12:06:07', '103.1.100.226'),
(188, 37, 'Motor Speed (RPM)', '2880 RPM', 1, 0, '2024-04-12 12:06:15', '2024-04-12 12:06:15', '103.1.100.226'),
(189, 37, 'Power Consumption (W)', '0.75 unit per hr', 1, 0, '2024-04-12 12:06:25', '2024-04-12 12:06:25', '103.1.100.226'),
(190, 37, 'Power Requirement (V)', '240 V', 1, 0, '2024-04-12 12:06:34', '2024-04-12 12:06:34', '103.1.100.226'),
(191, 37, 'Body Material', 'Digitally Printed Shutter', 1, 0, '2024-04-12 12:06:41', '2024-04-12 12:06:41', '103.1.100.226'),
(192, 37, 'Body Size', '346mmX905mmX484mm (WxHxD)', 1, 0, '2024-04-12 12:06:49', '2024-04-12 12:06:49', '103.1.100.226'),
(193, 37, 'Net Weight (Kg)', '44 Kg.', 1, 0, '2024-04-12 12:06:58', '2024-04-12 12:06:58', '103.1.100.226'),
(194, 38, 'Electrical Data', '1 HP, Single phase AC motor. 230 Volt , 50 Hz', 1, 0, '2024-04-12 12:05:58', '2024-04-12 12:05:58', '103.1.100.226'),
(195, 38, 'Hopper / Container Capacity', '4.5- 5 KG.', 1, 0, '2024-04-12 12:06:07', '2024-04-12 12:06:07', '103.1.100.226'),
(196, 38, 'Motor Speed (RPM)', '2880 RPM', 1, 0, '2024-04-12 12:06:15', '2024-04-12 12:06:15', '103.1.100.226'),
(197, 38, 'Power Consumption (W)', '0.75 unit per hr', 1, 0, '2024-04-12 12:06:25', '2024-04-12 12:06:25', '103.1.100.226'),
(198, 38, 'Power Requirement (V)', '240 V', 1, 0, '2024-04-12 12:06:34', '2024-04-12 12:06:34', '103.1.100.226'),
(199, 38, 'Body Material', 'Digitally Printed Shutter', 1, 0, '2024-04-12 12:06:41', '2024-04-12 12:06:41', '103.1.100.226'),
(200, 38, 'Body Size', '346mmX905mmX484mm (WxHxD)', 1, 0, '2024-04-12 12:06:49', '2024-04-12 12:06:49', '103.1.100.226'),
(201, 38, 'Net Weight (Kg)', '44 Kg.', 1, 0, '2024-04-12 12:06:58', '2024-04-12 12:06:58', '103.1.100.226'),
(202, 39, 'Electrical Data', '1 HP, Single phase AC motor. 230 Volt , 50 Hz', 1, 0, '2024-04-12 12:05:58', '2024-04-12 12:05:58', '103.1.100.226'),
(203, 39, 'Hopper / Container Capacity', '4.5- 5 KG.', 1, 0, '2024-04-12 12:06:07', '2024-04-12 12:06:07', '103.1.100.226'),
(204, 39, 'Motor Speed (RPM)', '2880 RPM', 1, 0, '2024-04-12 12:06:15', '2024-04-12 12:06:15', '103.1.100.226'),
(205, 39, 'Power Consumption (W)', '0.75 unit per hr', 1, 0, '2024-04-12 12:06:25', '2024-04-12 12:06:25', '103.1.100.226'),
(206, 39, 'Power Requirement (V)', '240 V', 1, 0, '2024-04-12 12:06:34', '2024-04-12 12:06:34', '103.1.100.226'),
(207, 39, 'Body Material', 'Digitally Printed Shutter', 1, 0, '2024-04-12 12:06:41', '2024-04-12 12:06:41', '103.1.100.226'),
(208, 39, 'Body Size', '346mmX905mmX484mm (WxHxD)', 1, 0, '2024-04-12 12:06:49', '2024-04-12 12:06:49', '103.1.100.226'),
(209, 39, 'Net Weight (Kg)', '44 Kg.', 1, 0, '2024-04-12 12:06:58', '2024-04-12 12:06:58', '103.1.100.226'),
(210, 40, 'Electrical Data', '1 HP, Single phase AC motor. 230 Volt , 50 Hz', 1, 0, '2024-04-12 12:05:58', '2024-04-12 12:05:58', '103.1.100.226'),
(211, 40, 'Hopper / Container Capacity', '4.5- 5 KG.', 1, 0, '2024-04-12 12:06:07', '2024-04-12 12:06:07', '103.1.100.226'),
(212, 40, 'Motor Speed (RPM)', '2880 RPM', 1, 0, '2024-04-12 12:06:15', '2024-04-12 12:06:15', '103.1.100.226'),
(213, 40, 'Power Consumption (W)', '0.75 unit per hr', 1, 0, '2024-04-12 12:06:25', '2024-04-12 12:06:25', '103.1.100.226'),
(214, 40, 'Power Requirement (V)', '240 V', 1, 0, '2024-04-12 12:06:34', '2024-04-12 12:06:34', '103.1.100.226'),
(215, 40, 'Body Material', 'Digitally Printed Shutter', 1, 0, '2024-04-12 12:06:41', '2024-04-12 12:06:41', '103.1.100.226'),
(216, 40, 'Body Size', '346mmX905mmX484mm (WxHxD)', 1, 0, '2024-04-12 12:06:49', '2024-04-12 12:06:49', '103.1.100.226'),
(217, 40, 'Net Weight (Kg)', '44 Kg.', 1, 0, '2024-04-12 12:06:58', '2024-04-12 12:06:58', '103.1.100.226'),
(218, 41, 'Electrical Data', '1 HP, Single phase AC motor. 230 Volt , 50 Hz', 1, 0, '2024-04-12 12:05:58', '2024-04-12 12:05:58', '103.1.100.226'),
(219, 41, 'Hopper / Container Capacity', '4.5- 5 KG.', 1, 0, '2024-04-12 12:06:07', '2024-04-12 12:06:07', '103.1.100.226'),
(220, 41, 'Motor Speed (RPM)', '2880 RPM', 1, 0, '2024-04-12 12:06:15', '2024-04-12 12:06:15', '103.1.100.226'),
(221, 41, 'Power Consumption (W)', '0.75 unit per hr', 1, 0, '2024-04-12 12:06:25', '2024-04-12 12:06:25', '103.1.100.226'),
(222, 41, 'Power Requirement (V)', '240 V', 1, 0, '2024-04-12 12:06:34', '2024-04-12 12:06:34', '103.1.100.226'),
(223, 41, 'Body Material', 'Digitally Printed Shutter', 1, 0, '2024-04-12 12:06:41', '2024-04-12 12:06:41', '103.1.100.226'),
(224, 41, 'Body Size', '346mmX905mmX484mm (WxHxD)', 1, 0, '2024-04-12 12:06:49', '2024-04-12 12:06:49', '103.1.100.226'),
(225, 41, 'Net Weight (Kg)', '44 Kg.', 1, 0, '2024-04-12 12:06:58', '2024-04-12 12:06:58', '103.1.100.226'),
(226, 42, 'Electrical Data', '1 HP, Single phase AC motor. 230 Volt , 50 Hz', 1, 0, '2024-04-12 12:05:58', '2024-04-12 12:05:58', '103.1.100.226'),
(227, 42, 'Hopper / Container Capacity', '4.5- 5 KG.', 1, 0, '2024-04-12 12:06:07', '2024-04-12 12:06:07', '103.1.100.226'),
(228, 42, 'Motor Speed (RPM)', '2880 RPM', 1, 0, '2024-04-12 12:06:15', '2024-04-12 12:06:15', '103.1.100.226'),
(229, 42, 'Power Consumption (W)', '0.75 unit per hr', 1, 0, '2024-04-12 12:06:25', '2024-04-12 12:06:25', '103.1.100.226'),
(230, 42, 'Power Requirement (V)', '240 V', 1, 0, '2024-04-12 12:06:34', '2024-04-12 12:06:34', '103.1.100.226'),
(231, 42, 'Body Material', 'Digitally Printed Shutter', 1, 0, '2024-04-12 12:06:41', '2024-04-12 12:06:41', '103.1.100.226'),
(232, 42, 'Body Size', '346mmX905mmX484mm (WxHxD)', 1, 0, '2024-04-12 12:06:49', '2024-04-12 12:06:49', '103.1.100.226'),
(233, 42, 'Net Weight (Kg)', '44 Kg.', 1, 0, '2024-04-12 12:06:58', '2024-04-12 12:06:58', '103.1.100.226'),
(234, 43, 'Electrical Data', '1 HP, Single phase AC motor. 230 Volt , 50 Hz', 1, 0, '2024-04-12 12:05:58', '2024-04-12 12:05:58', '103.1.100.226'),
(235, 43, 'Hopper / Container Capacity', '4.5- 5 KG.', 1, 0, '2024-04-12 12:06:07', '2024-04-12 12:06:07', '103.1.100.226'),
(236, 43, 'Motor Speed (RPM)', '2880 RPM', 1, 0, '2024-04-12 12:06:15', '2024-04-12 12:06:15', '103.1.100.226'),
(237, 43, 'Power Consumption (W)', '0.75 unit per hr', 1, 0, '2024-04-12 12:06:25', '2024-04-12 12:06:25', '103.1.100.226'),
(238, 43, 'Power Requirement (V)', '240 V', 1, 0, '2024-04-12 12:06:34', '2024-04-12 12:06:34', '103.1.100.226'),
(239, 43, 'Body Material', 'Digitally Printed Shutter', 1, 0, '2024-04-12 12:06:41', '2024-04-12 12:06:41', '103.1.100.226'),
(240, 43, 'Body Size', '346mmX905mmX484mm (WxHxD)', 1, 0, '2024-04-12 12:06:49', '2024-04-12 12:06:49', '103.1.100.226'),
(241, 43, 'Net Weight (Kg)', '44 Kg.', 1, 0, '2024-04-12 12:06:58', '2024-04-12 12:06:58', '103.1.100.226'),
(242, 44, 'Electrical Data', '1 HP, Single phase AC motor. 230 Volt , 50 Hz', 1, 0, '2024-04-12 12:05:58', '2024-04-12 12:05:58', '103.1.100.226'),
(243, 44, 'Hopper / Container Capacity', '4.5- 5 KG.', 1, 0, '2024-04-12 12:06:07', '2024-04-12 12:06:07', '103.1.100.226'),
(244, 44, 'Motor Speed (RPM)', '2880 RPM', 1, 0, '2024-04-12 12:06:15', '2024-04-12 12:06:15', '103.1.100.226'),
(245, 44, 'Power Consumption (W)', '0.75 unit per hr', 1, 0, '2024-04-12 12:06:25', '2024-04-12 12:06:25', '103.1.100.226'),
(246, 44, 'Power Requirement (V)', '240 V', 1, 0, '2024-04-12 12:06:34', '2024-04-12 12:06:34', '103.1.100.226'),
(247, 44, 'Body Material', 'Digitally Printed Shutter', 1, 0, '2024-04-12 12:06:41', '2024-04-12 12:06:41', '103.1.100.226'),
(248, 44, 'Body Size', '346mmX905mmX484mm (WxHxD)', 1, 0, '2024-04-12 12:06:49', '2024-04-12 12:06:49', '103.1.100.226'),
(249, 44, 'Net Weight (Kg)', '44 Kg.', 1, 0, '2024-04-12 12:06:58', '2024-04-12 12:06:58', '103.1.100.226'),
(250, 45, 'Electrical Data Motor', '1 HP, 750 W, 2880 RPM, Single Phase AC, 230 Volt, 50 Hz', 1, 0, '2024-04-12 12:05:58', '2024-04-23 12:56:48', '103.1.100.226'),
(251, 45, 'Hopper / Container Capacity', '4.5-5 Kg.', 1, 0, '2024-04-12 12:06:07', '2024-04-23 12:56:57', '103.1.100.226'),
(253, 45, 'Power Consumption (W)', '0.75 unit per hr (Approx)', 1, 0, '2024-04-12 12:06:25', '2024-04-23 12:57:09', '103.1.100.226'),
(256, 45, 'Body Size', '48cmX33cmX87cm (LxWxH)', 1, 0, '2024-04-12 12:06:49', '2024-04-23 12:57:24', '103.1.100.226'),
(257, 45, 'Net Weight (Kg)', '46 Kg. (Approx)', 1, 0, '2024-04-12 12:06:58', '2024-04-23 12:57:32', '103.1.100.226'),
(258, 46, 'Electrical Data', '1 HP, Single phase AC motor. 230 Volt , 50 Hz', 1, 0, '2024-04-12 12:05:58', '2024-04-12 12:05:58', '103.1.100.226'),
(259, 46, 'Hopper / Container Capacity', '4.5- 5 KG.', 1, 0, '2024-04-12 12:06:07', '2024-04-12 12:06:07', '103.1.100.226'),
(260, 46, 'Motor Speed (RPM)', '2880 RPM', 1, 0, '2024-04-12 12:06:15', '2024-04-12 12:06:15', '103.1.100.226'),
(261, 46, 'Power Consumption (W)', '0.75 unit per hr', 1, 0, '2024-04-12 12:06:25', '2024-04-12 12:06:25', '103.1.100.226'),
(262, 46, 'Power Requirement (V)', '240 V', 1, 0, '2024-04-12 12:06:34', '2024-04-12 12:06:34', '103.1.100.226'),
(263, 46, 'Body Material', 'Digitally Printed Shutter', 1, 0, '2024-04-12 12:06:41', '2024-04-12 12:06:41', '103.1.100.226'),
(264, 46, 'Body Size', '346mmX905mmX484mm (WxHxD)', 1, 0, '2024-04-12 12:06:49', '2024-04-12 12:06:49', '103.1.100.226'),
(265, 46, 'Net Weight (Kg)', '44 Kg.', 1, 0, '2024-04-12 12:06:58', '2024-04-12 12:06:58', '103.1.100.226'),
(266, 48, 'Electrical Data Motor', '1 HP, 750 W, 2880 RPM, Single Phase AC, 230 Volt, 50 Hz', 1, 0, '2024-04-12 12:05:58', '2024-04-23 12:22:13', '103.1.100.226'),
(267, 48, 'Hopper / Container Capacity', '4.5-5 Kg.', 1, 0, '2024-04-12 12:06:07', '2024-04-23 12:22:24', '103.1.100.226'),
(269, 48, 'Power Consumption (W)', '0.75 unit per hr (Approx)', 1, 0, '2024-04-12 12:06:25', '2024-04-23 12:22:37', '103.1.100.226'),
(272, 48, 'Body Size', '48cmX33cmX87cm (LxWxH)', 1, 0, '2024-04-12 12:06:49', '2024-04-23 12:22:51', '103.1.100.226'),
(273, 48, 'Net Weight (Kg)', '42 Kg. (Approx)', 1, 0, '2024-04-12 12:06:58', '2024-04-23 12:22:59', '103.1.100.226'),
(274, 49, 'Electrical Data Motor', '1 HP, 750 W, 2880 RPM, Single Phase AC, 230 Volt, 50 Hz', 1, 0, '2024-04-12 12:05:58', '2024-04-23 12:21:03', '103.1.100.226'),
(275, 49, 'Hopper / Container Capacity', '4.5-5 Kg.', 1, 0, '2024-04-12 12:06:07', '2024-04-23 12:21:11', '103.1.100.226'),
(277, 49, 'Power Consumption (W)', '0.75 unit per hr (Approx)', 1, 0, '2024-04-12 12:06:25', '2024-04-23 12:21:24', '103.1.100.226'),
(280, 49, 'Body Size', '48cmX33cmX87cm (LxWxH)', 1, 0, '2024-04-12 12:06:49', '2024-04-23 12:21:40', '103.1.100.226'),
(281, 49, 'Net Weight (Kg)', '42 Kg. (Approx)', 1, 0, '2024-04-12 12:06:58', '2024-04-23 12:21:48', '103.1.100.226'),
(282, 50, 'Electrical Data Motor', '1 HP, 750 W, 2880 RPM, Single Phase AC, 230 Volt, 50 Hz', 1, 0, '2024-04-12 12:05:58', '2024-04-23 12:19:25', '103.1.100.226'),
(283, 50, 'Hopper / Container Capacity', '4.5-5 Kg.', 1, 0, '2024-04-12 12:06:07', '2024-04-23 12:19:40', '103.1.100.226'),
(285, 50, 'Power Consumption (W)', '0.75 unit per hr (Approx)', 1, 0, '2024-04-12 12:06:25', '2024-04-23 12:19:57', '103.1.100.226'),
(288, 50, 'Body Size', '48cmX33cmX87cm (LxWxH)', 1, 0, '2024-04-12 12:06:49', '2024-04-23 12:20:14', '103.1.100.226'),
(289, 50, 'Net Weight (Kg)', '42 Kg. (Approx)', 1, 0, '2024-04-12 12:06:58', '2024-04-23 12:20:32', '103.1.100.226'),
(290, 52, 'Electrical Data Motor', '1 HP, 750 W, 2880 RPM, Single Phase AC, 230 Volt, 50 Hz', 1, 0, '2024-04-12 12:05:58', '2024-04-23 12:55:05', '103.1.100.226'),
(291, 52, 'Hopper / Container Capacity', '4.5-5 Kg.', 1, 0, '2024-04-12 12:06:07', '2024-04-23 12:55:13', '103.1.100.226'),
(293, 52, 'Power Consumption (W)', '0.75 unit per hr (Approx)', 1, 0, '2024-04-12 12:06:25', '2024-04-23 12:55:27', '103.1.100.226'),
(296, 52, 'Body Size', '48cmX33cmX87cm (LxWxH)', 1, 0, '2024-04-12 12:06:49', '2024-04-23 12:55:44', '103.1.100.226'),
(297, 52, 'Net Weight (Kg)', '46 Kg. (Approx)', 1, 0, '2024-04-12 12:06:58', '2024-04-23 12:56:07', '103.1.100.226'),
(531, 58, 'Motor', '1 HP, 0.75KW, 2800 RPM', 1, 0, '2024-04-16 05:47:49', '2024-04-16 05:47:49', '103.1.100.226'),
(532, 58, 'Power Supply', '230 Volt AC, 50 Hz', 1, 0, '2024-04-16 05:48:39', '2024-04-16 05:48:39', '103.1.100.226'),
(533, 58, 'Capacity', '12 to 16 Glass At A Time', 1, 0, '2024-04-16 05:49:06', '2024-04-16 05:49:06', '103.1.100.226'),
(534, 58, 'Weight', '26 KG', 1, 0, '2024-04-16 05:49:32', '2024-04-16 05:49:32', '103.1.100.226'),
(535, 59, 'Motor', '3 HP, 0.55KW, 2800 RPM', 1, 0, '2024-04-16 05:55:14', '2024-04-16 05:56:10', '103.1.100.226'),
(536, 59, 'Power Supply', '230 Volt AC, 50 Hz', 1, 0, '2024-04-16 05:56:28', '2024-04-16 05:56:28', '103.1.100.226'),
(537, 59, 'Capacity', '4 to 6 Glass At A Time', 1, 0, '2024-04-16 05:56:58', '2024-04-17 09:36:44', '103.1.100.226'),
(538, 59, 'Weight', '20 KG', 1, 0, '2024-04-16 05:57:36', '2024-04-16 05:57:36', '103.1.100.226'),
(539, 62, 'Electrical Data Motor', '1 HP, 750 W, 2880 RPM, Single Phase AC, 230 Volt, 50 Hz', 1, 0, '2024-04-18 05:43:04', '2024-04-23 13:06:11', '103.1.100.226'),
(540, 62, 'Hopper / Container Capacity', '4.5-5 Kg.', 1, 0, '2024-04-18 05:43:28', '2024-04-23 13:06:21', '103.1.100.226'),
(542, 62, 'Power Consumption (W)', '0.75 unit per hr (Approx)', 1, 0, '2024-04-18 05:44:14', '2024-04-23 13:06:35', '103.1.100.226'),
(545, 62, 'Body Size', '48cmX33cmX87cm (LxWxH)', 1, 0, '2024-04-18 05:45:23', '2024-04-23 13:06:57', '103.1.100.226'),
(546, 62, 'Net Weight (Kg)', '40 Kg. (Approx)', 1, 0, '2024-04-18 05:45:50', '2024-04-23 13:07:03', '103.1.100.226'),
(547, 63, 'Electrical Data Motor', '1 HP, 750 W, 2880 RPM, Single Phase AC, 230 Volt, 50 Hz', 1, 0, '2024-04-18 05:48:22', '2024-04-23 13:04:44', '103.1.100.226'),
(548, 63, 'Hopper / Container Capacity', '4.5-5 Kg.', 1, 0, '2024-04-18 05:48:39', '2024-04-23 13:04:51', '103.1.100.226'),
(550, 63, 'Power Consumption (W)', '0.75 unit per hr (Approx)', 1, 0, '2024-04-18 05:49:19', '2024-04-23 13:05:04', '103.1.100.226'),
(553, 63, 'Body Size', '48cmX33cmX87cm (LxWxH)', 1, 0, '2024-04-18 05:50:29', '2024-04-23 13:05:22', '103.1.100.226'),
(554, 63, 'Net Weight (Kg)', '40 Kg. (Approx)', 1, 0, '2024-04-18 05:50:52', '2024-04-23 13:05:44', '103.1.100.226'),
(555, 64, 'Electrical Data Motor', '1 HP, 750 W, 2880 RPM, Single Phase AC, 230 Volt, 50 Hz', 1, 0, '2024-04-22 05:40:01', '2024-04-23 12:51:44', '103.1.100.226'),
(556, 64, 'Hopper / Container Capacity', '4.5-5 Kg.', 1, 0, '2024-04-22 05:40:17', '2024-04-23 12:51:53', '103.1.100.226'),
(558, 64, 'Power Consumption (W)', '0.75 unit per hr (Approx)', 1, 0, '2024-04-22 05:40:41', '2024-04-23 12:52:06', '103.1.100.226'),
(561, 64, 'Body Size', '48cmX33cmX87cm (LxWxH)', 1, 0, '2024-04-22 05:41:21', '2024-04-23 12:52:22', '103.1.100.226'),
(562, 64, 'Net Weight (Kg)', '45 Kg. (Approx)', 1, 0, '2024-04-22 05:41:33', '2024-04-23 12:52:32', '103.1.100.226'),
(563, 65, 'Electrical Data Motor', '1 HP, 750 W, 2880 RPM, Single Phase AC, 230 Volt, 50 Hz', 1, 0, '2024-04-22 05:44:51', '2024-04-23 12:23:51', '103.1.100.226'),
(564, 65, 'Hopper / Container Capacity', '4.5-5 Kg.', 1, 0, '2024-04-22 05:45:04', '2024-04-23 12:24:01', '103.1.100.226'),
(566, 65, 'Power Consumption (W)', '0.75 unit per hr (Approx)', 1, 0, '2024-04-22 05:45:30', '2024-04-23 12:24:15', '103.1.100.226'),
(569, 65, 'Body Size', '48cmX33cmX87cm (LxWxH)', 1, 0, '2024-04-22 05:46:19', '2024-04-23 12:24:31', '103.1.100.226'),
(570, 65, 'Net Weight (Kg)', '45 Kg. (Approx)', 1, 0, '2024-04-22 05:46:32', '2024-04-23 12:24:49', '103.1.100.226'),
(571, 66, 'Electrical Data Motor', '1 HP, 750 W, 2880 RPM, Single Phase AC, 230 Volt, 50 Hz', 1, 0, '2024-04-22 07:05:59', '2024-04-23 13:03:04', '103.1.100.226'),
(572, 66, 'Hopper / Container Capacity', '4.5-5 Kg.', 1, 0, '2024-04-22 07:06:15', '2024-04-23 13:03:12', '103.1.100.226'),
(574, 66, 'Power Consumption (W)', '0.75 unit per hr (Approx)', 1, 0, '2024-04-22 07:06:46', '2024-04-23 13:03:30', '103.1.100.226'),
(577, 66, 'Body Size', '48cmX33cmX87cm (LxWxH)', 1, 0, '2024-04-22 07:07:21', '2024-04-23 13:03:44', '103.1.100.226'),
(578, 66, 'Net Weight (Kg)', '45 Kg. (Approx)', 1, 0, '2024-04-22 07:07:37', '2024-04-23 13:03:53', '103.1.100.226'),
(579, 67, 'Electrical Data Motor', '1 HP, 750 W, 2880 RPM, Single Phase AC, 230 Volt, 50 Hz', 1, 0, '2024-04-22 07:10:42', '2024-04-23 13:01:32', '103.1.100.226'),
(580, 67, 'Hopper / Container Capacity', '4.5-5 Kg.', 1, 0, '2024-04-22 07:10:53', '2024-04-23 13:01:41', '103.1.100.226'),
(582, 67, 'Power Consumption (W)', '0.75 unit per hr (Approx)', 1, 0, '2024-04-22 07:11:15', '2024-04-23 13:01:53', '103.1.100.226'),
(585, 67, 'Body Size', '48cmX33cmX87cm (LxWxH)', 1, 0, '2024-04-22 07:11:48', '2024-04-23 13:02:09', '103.1.100.226'),
(586, 67, 'Net Weight (Kg)', '45 Kg. (Approx)', 1, 0, '2024-04-22 07:11:59', '2024-04-23 13:02:29', '103.1.100.226'),
(587, 68, 'Electrical Data Motor', '1 HP, 750 W, 2880 RPM, Single Phase AC, 230 Volt, 50 Hz', 1, 0, '2024-04-22 07:15:06', '2024-04-23 11:45:58', '103.1.100.226'),
(588, 68, 'Hopper / Container Capacity', '4.5-5 Kg.', 1, 0, '2024-04-22 07:15:17', '2024-04-23 11:46:08', '103.1.100.226'),
(590, 68, 'Power Consumption (W)', '0.75 unit per hr (Approx)', 1, 0, '2024-04-22 07:15:38', '2024-04-23 11:46:22', '103.1.100.226'),
(593, 68, 'Body Size', '48cmX33cmX87cm (LxWxH)', 1, 0, '2024-04-22 07:16:14', '2024-04-23 11:46:38', '103.1.100.226'),
(594, 68, 'Net Weight (Kg)', '42 Kg. (Approx)', 1, 0, '2024-04-22 07:16:26', '2024-04-23 11:47:10', '103.1.100.226'),
(595, 69, 'Electrical Data Motor', '1 HP, 750 W, 2880 RPM, Single Phase AC, 230 Volt, 50 Hz', 1, 0, '2024-04-22 08:21:30', '2024-04-23 13:00:01', '103.1.100.226'),
(596, 69, 'Hopper / Container Capacity', '4.5-5 Kg.', 1, 0, '2024-04-22 08:21:42', '2024-04-23 13:00:10', '103.1.100.226'),
(598, 69, 'Power Consumption (W)', '0.75 unit per hr (Approx)', 1, 0, '2024-04-22 08:22:08', '2024-04-23 13:00:23', '103.1.100.226'),
(601, 69, 'Body Size', '48cmX33cmX87cm (LxWxH)', 1, 0, '2024-04-22 08:22:49', '2024-04-23 13:00:38', '103.1.100.226'),
(602, 69, 'Net Weight (Kg)', '45 Kg. (Approx)', 1, 0, '2024-04-22 08:22:59', '2024-04-23 13:00:48', '103.1.100.226'),
(603, 70, 'Electrical Data Motor', '1 HP, 750 W, 2880 RPM, Single Phase AC, 230 Volt, 50 Hz', 1, 0, '2024-04-22 08:25:30', '2024-04-23 12:58:23', '103.1.100.226'),
(604, 70, 'Hopper / Container Capacity', '4.5-5 Kg.', 1, 0, '2024-04-22 08:25:43', '2024-04-23 12:58:34', '103.1.100.226'),
(606, 70, 'Power Consumption (W)', '0.75 unit per hr (Approx)', 1, 0, '2024-04-22 08:26:19', '2024-04-23 12:58:45', '103.1.100.226'),
(609, 70, 'Body Size', '48cmX33cmX87cm (LxWxH)', 1, 0, '2024-04-22 08:26:58', '2024-04-23 12:59:04', '103.1.100.226'),
(610, 70, 'Net Weight (Kg)', '45 Kg. (Approx)', 1, 0, '2024-04-22 08:27:11', '2024-04-23 12:59:25', '103.1.100.226'),
(611, 71, 'Electrical Data Motor', '1 HP,750 W, 2880 RPM, Single Phase AC , 230 Volt , 50 Hz', 1, 0, '2024-04-22 11:26:38', '2024-04-23 13:07:48', '103.1.100.226'),
(612, 71, 'Hopper / Container Capacity', '5.5-6 Kg.', 1, 0, '2024-04-22 11:26:50', '2024-04-23 13:08:05', '103.1.100.226'),
(614, 71, 'Power Consumption (W)', '0.75 unit per hr (Approx)', 1, 0, '2024-04-22 11:27:15', '2024-04-23 13:08:27', '103.1.100.226'),
(619, 72, 'Electrical Data Motor', '1 HP, 750 W, 2880 RPM, Single Phase AC, 230 Volt, 50 Hz', 1, 0, '2024-04-23 09:18:15', '2024-04-23 13:13:09', '103.1.100.226'),
(620, 72, 'Hopper / Container Capacity', '4.5-5 Kg.', 1, 0, '2024-04-23 09:18:27', '2024-04-23 11:31:50', '103.1.100.226'),
(622, 72, 'Power Consumption (W)', '0.75 unit per hr (Approx)', 1, 0, '2024-04-23 09:19:01', '2024-04-23 11:32:39', '103.1.100.226'),
(625, 72, 'Body Size', '48cmX33cmX87cm (LxWxH)', 1, 0, '2024-04-23 09:19:38', '2024-04-23 11:32:54', '103.1.100.226'),
(626, 72, 'Net Weight (Kg)', '43 Kg. (Approx)', 1, 0, '2024-04-23 09:19:52', '2024-04-23 11:33:13', '103.1.100.226'),
(627, 71, 'Body Size', '48cmX33cmX97cm (LxWxH)', 1, 0, '2024-04-23 13:09:14', '2024-04-23 13:09:14', '103.1.100.226'),
(628, 71, 'Net Weight (Kg)', '44 Kg. (Approx)', 1, 0, '2024-04-23 13:09:35', '2024-04-23 13:09:35', '103.1.100.226');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'web', '2022-09-12 04:33:06', '2022-09-12 04:33:06'),
(2, 'User', 'web', '2022-09-12 04:33:06', '2022-09-12 04:33:06');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sendemaildetails`
--

CREATE TABLE `sendemaildetails` (
  `id` int(11) NOT NULL,
  `strSubject` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `strTitle` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `strFromMail` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ToMail` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `strCC` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `strBCC` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sendemaildetails`
--

INSERT INTO `sendemaildetails` (`id`, `strSubject`, `strTitle`, `strFromMail`, `ToMail`, `strCC`, `strBCC`) VALUES
(4, 'Contact Inquiry', 'Navdeep Product', 'no-reply@navdeepproducts.com', NULL, '', ''),
(8, 'Product Inquiry', 'Navdeep Product', 'no-reply@navdeepproducts.com', NULL, NULL, NULL),
(9, 'Order', 'MB Herbal', 'info@getdemo.in', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sub_category`
--

CREATE TABLE `sub_category` (
  `sub_categoryId` int(11) NOT NULL,
  `categoryId` int(11) NOT NULL,
  `strSequenceNo` int(11) NOT NULL DEFAULT '1000',
  `subcategoryname` varchar(255) DEFAULT NULL,
  `slugname` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `iStatus` int(11) NOT NULL DEFAULT '1',
  `isDelete` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `strIP` varchar(255) DEFAULT NULL,
  `meta_title` text,
  `meta_description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sub_category`
--

INSERT INTO `sub_category` (`sub_categoryId`, `categoryId`, `strSequenceNo`, `subcategoryname`, `slugname`, `photo`, `iStatus`, `isDelete`, `created_at`, `updated_at`, `strIP`, `meta_title`, `meta_description`) VALUES
(2, 1, 2, 'Tava Roti', 'tava-roti', '', 1, 0, '2024-11-11 13:19:09', '2024-11-11 13:19:09', '127.0.0.1', NULL, NULL),
(3, 1, 1, 'Tanduri Roti', 'tanduri-roti', '1731331369.jpg', 1, 0, '2024-11-11 13:22:49', '2024-11-11 13:22:49', '127.0.0.1', NULL, NULL),
(4, 2, 1, 'Fresh Juice', 'fresh-juice', '', 1, 0, '2024-11-14 13:14:14', '2024-11-14 13:14:14', '127.0.0.1', NULL, NULL),
(5, 2, 2, 'Juice', 'juice', '', 1, 0, '2024-11-14 13:14:27', '2024-11-14 13:14:27', '127.0.0.1', NULL, NULL),
(6, 2, 3, 'Cooler Drink', 'cooler-drink', '', 1, 0, '2024-11-14 13:15:32', '2024-11-14 13:15:32', '127.0.0.1', NULL, NULL),
(7, 2, 4, 'Milkshake', 'milkshake', '', 1, 0, '2024-11-14 13:15:53', '2024-11-14 13:15:53', '127.0.0.1', NULL, NULL),
(8, 3, 5, 'Starters', 'starters', '', 1, 0, '2024-11-14 13:16:21', '2024-11-14 13:16:21', '127.0.0.1', NULL, NULL),
(9, 3, 6, 'Wada', 'wada', '', 1, 0, '2024-11-14 13:16:43', '2024-11-14 13:16:43', '127.0.0.1', NULL, NULL),
(10, 3, 7, 'Gujarati Farsan', 'gujarati-farsan', '', 1, 0, '2024-11-14 13:17:13', '2024-11-14 13:17:13', '127.0.0.1', NULL, NULL),
(11, 3, 8, 'Tikki', 'tikki', '', 1, 0, '2024-11-14 13:17:36', '2024-11-14 13:17:36', '127.0.0.1', NULL, NULL),
(12, 3, 9, 'Chaat', 'chaat', '', 1, 0, '2024-11-14 13:17:56', '2024-11-14 13:17:56', '127.0.0.1', NULL, NULL),
(13, 3, 10, 'Tavaa Maxican', 'tavaa-maxican', '', 1, 0, '2024-11-14 13:18:53', '2024-11-14 13:18:53', '127.0.0.1', NULL, NULL),
(14, 3, 11, 'Chilla', 'chilla', '', 1, 0, '2024-11-14 13:19:12', '2024-11-14 13:19:12', '127.0.0.1', NULL, NULL),
(15, 3, 12, 'Dosa', 'dosa', '', 1, 0, '2024-11-14 13:19:31', '2024-11-14 13:19:31', '127.0.0.1', NULL, NULL),
(16, 3, 13, 'Jalebi', 'jalebi', '', 1, 0, '2024-11-14 13:19:58', '2024-11-14 13:19:58', '127.0.0.1', NULL, NULL),
(17, 5, 14, 'Gravy Dish', '', NULL, 1, 0, '2024-11-14 13:20:39', '2024-11-14 13:22:47', '127.0.0.1', NULL, NULL),
(18, 5, 15, 'Sabji', '', NULL, 1, 0, '2024-11-14 13:21:05', '2024-11-14 13:22:53', '127.0.0.1', NULL, NULL),
(19, 5, 16, 'Noodles', '', NULL, 1, 0, '2024-11-14 13:21:24', '2024-11-14 13:22:59', '127.0.0.1', NULL, NULL),
(20, 5, 17, 'Chilla', '', NULL, 1, 0, '2024-11-14 13:22:28', '2024-11-14 13:23:48', '127.0.0.1', NULL, NULL),
(21, 6, 18, 'Soup', '', NULL, 1, 0, '2024-11-14 13:24:08', '2024-11-14 13:24:30', '127.0.0.1', NULL, NULL),
(22, 6, 19, 'Salad', 'salad', '', 1, 0, '2024-11-14 13:25:59', '2024-11-14 13:25:59', '127.0.0.1', NULL, NULL),
(23, 6, 20, 'Starfire', 'starfire', '', 1, 0, '2024-11-14 13:26:47', '2024-11-14 13:26:47', '127.0.0.1', NULL, NULL),
(24, 6, 21, 'Rice', 'rice', '', 1, 0, '2024-11-14 13:27:03', '2024-11-14 13:27:03', '127.0.0.1', NULL, NULL),
(25, 7, 22, 'Soup', 'soup', '', 1, 0, '2024-11-14 13:27:19', '2024-11-14 13:27:19', '127.0.0.1', NULL, NULL),
(26, 7, 23, 'Starters', 'starters', '', 1, 0, '2024-11-14 13:27:33', '2024-11-14 13:27:33', '127.0.0.1', NULL, NULL),
(27, 7, 24, 'Farsan', 'farsan', '', 1, 0, '2024-11-14 13:27:56', '2024-11-14 13:27:56', '127.0.0.1', NULL, NULL),
(28, 7, 25, 'Curry', '', NULL, 1, 0, '2024-11-14 13:28:10', '2024-11-15 07:05:29', '127.0.0.1', NULL, NULL),
(29, 7, 26, 'Bake Food', 'bake-food', '', 1, 0, '2024-11-14 13:42:06', '2024-11-14 13:42:06', '127.0.0.1', NULL, NULL),
(30, 7, 27, 'Rice', 'rice', '', 1, 0, '2024-11-14 13:42:20', '2024-11-14 13:42:20', '127.0.0.1', NULL, NULL),
(31, 8, 28, 'Soup', 'soup', '', 1, 0, '2024-11-14 13:43:06', '2024-11-14 13:43:06', '127.0.0.1', NULL, NULL),
(32, 8, 29, 'Starters', 'starters', '', 1, 0, '2024-11-14 13:43:20', '2024-11-14 13:43:20', '127.0.0.1', NULL, NULL),
(33, 8, 30, 'Farsan', 'farsan', '', 1, 0, '2024-11-14 13:43:32', '2024-11-14 13:43:32', '127.0.0.1', NULL, NULL),
(34, 8, 31, 'Curry', '', NULL, 1, 0, '2024-11-14 13:43:44', '2024-11-15 07:05:22', '127.0.0.1', NULL, NULL),
(35, 8, 32, 'Noodle', 'noodle', '', 1, 0, '2024-11-14 13:44:13', '2024-11-14 13:44:13', '127.0.0.1', NULL, NULL),
(36, 8, 33, 'Rice', 'rice', '', 1, 0, '2024-11-14 13:45:13', '2024-11-14 13:45:13', '127.0.0.1', NULL, NULL),
(37, 9, 34, 'Basundi', 'basundi', '', 1, 0, '2024-11-14 13:45:43', '2024-11-14 13:45:43', '127.0.0.1', NULL, NULL),
(38, 9, 35, 'Bangali', 'bangali', '', 1, 0, '2024-11-14 13:46:10', '2024-11-14 13:46:10', '127.0.0.1', NULL, NULL),
(39, 9, 36, 'Cream Ni Item', '', NULL, 1, 0, '2024-11-14 13:47:10', '2024-11-15 07:09:14', '127.0.0.1', NULL, NULL),
(40, 9, 37, 'Rabdi', 'rabdi', '', 1, 0, '2024-11-14 13:47:27', '2024-11-14 13:47:27', '127.0.0.1', NULL, NULL),
(41, 9, 38, 'Ras Malai', 'ras-malai', '', 1, 0, '2024-11-14 13:47:50', '2024-11-14 13:47:50', '127.0.0.1', NULL, NULL),
(42, 9, 39, 'Fruit Salad', 'fruit-salad', '', 1, 0, '2024-11-14 13:49:05', '2024-11-14 13:49:05', '127.0.0.1', NULL, NULL),
(43, 9, 40, 'Matho', 'matho', '', 1, 0, '2024-11-14 13:49:29', '2024-11-14 13:49:29', '127.0.0.1', NULL, NULL),
(44, 9, 41, 'Dry Fruit Malai', 'dry-fruit-malai', '', 1, 0, '2024-11-14 13:50:07', '2024-11-14 13:50:07', '127.0.0.1', NULL, NULL),
(45, 9, 42, 'Halwa', 'halwa', '', 1, 0, '2024-11-14 13:50:29', '2024-11-14 13:50:29', '127.0.0.1', NULL, NULL),
(46, 9, 42, 'Dudh Liquid Sweet', 'dudh-liquid-sweet', '', 1, 0, '2024-11-14 13:51:20', '2024-11-14 13:51:20', '127.0.0.1', NULL, NULL),
(47, 9, 43, 'Mavani Sweets', 'mavani-sweets', '', 1, 0, '2024-11-14 13:51:55', '2024-11-14 13:51:55', '127.0.0.1', NULL, NULL),
(48, 9, 44, 'Medani Sweets', 'medani-sweets', '', 1, 0, '2024-11-14 13:52:26', '2024-11-14 13:52:26', '127.0.0.1', NULL, NULL),
(49, 10, 45, 'Soup', 'soup', '', 1, 0, '2024-11-14 13:52:52', '2024-11-14 13:52:52', '127.0.0.1', NULL, NULL),
(50, 10, 46, 'Starters', 'starters', '', 1, 0, '2024-11-14 13:53:35', '2024-11-14 13:53:35', '127.0.0.1', NULL, NULL),
(51, 10, 47, 'Bake Food', 'bake-food', '', 1, 0, '2024-11-14 13:53:44', '2024-11-14 13:53:44', '127.0.0.1', NULL, NULL),
(52, 10, 48, 'Salad', 'salad', '', 1, 0, '2024-11-14 13:53:55', '2024-11-14 13:53:55', '127.0.0.1', NULL, NULL),
(53, 10, 49, 'Bread', 'bread', '', 1, 0, '2024-11-14 13:54:24', '2024-11-14 13:54:24', '127.0.0.1', NULL, NULL),
(54, 10, 50, 'Fruit Chaat', 'fruit-chaat', '', 1, 0, '2024-11-14 13:54:52', '2024-11-14 13:54:52', '127.0.0.1', NULL, NULL),
(55, 10, 51, 'Desert', 'desert', '', 1, 0, '2024-11-14 13:55:10', '2024-11-14 13:55:10', '127.0.0.1', NULL, NULL),
(56, 11, 52, 'Shak', 'shak', '', 1, 0, '2024-11-14 13:55:38', '2024-11-14 13:55:38', '127.0.0.1', NULL, NULL),
(57, 11, 53, 'Roti', 'roti', '', 1, 0, '2024-11-14 13:55:46', '2024-11-14 13:55:46', '127.0.0.1', NULL, NULL),
(58, 11, 54, 'Farsan', 'farsan', '', 1, 0, '2024-11-14 13:56:08', '2024-11-14 13:56:08', '127.0.0.1', NULL, NULL),
(59, 11, 55, 'Dal', 'dal', '', 1, 0, '2024-11-14 13:56:34', '2024-11-14 13:56:34', '127.0.0.1', NULL, NULL),
(60, 11, 56, 'Curry', '', NULL, 1, 0, '2024-11-14 13:56:47', '2024-11-15 07:05:04', '127.0.0.1', NULL, NULL),
(61, 11, 57, 'Bhaat', 'bhaat', '', 1, 0, '2024-11-14 13:57:06', '2024-11-14 13:57:06', '127.0.0.1', NULL, NULL),
(62, 11, 58, 'Mukhwas', 'mukhwas', '', 1, 0, '2024-11-14 13:57:26', '2024-11-14 13:57:26', '127.0.0.1', NULL, NULL),
(63, 12, 59, 'Sweets', 'sweets', '', 1, 0, '2024-11-14 13:57:46', '2024-11-14 13:57:46', '127.0.0.1', NULL, NULL),
(64, 12, 60, 'Roti', 'roti', '', 1, 0, '2024-11-14 13:57:55', '2024-11-14 13:57:55', '127.0.0.1', NULL, NULL),
(65, 12, 61, 'Shak', 'shak', '', 1, 0, '2024-11-14 13:58:05', '2024-11-14 13:58:05', '127.0.0.1', NULL, NULL),
(66, 12, 62, 'Dal', 'dal', '', 1, 0, '2024-11-14 13:58:16', '2024-11-14 13:58:16', '127.0.0.1', NULL, NULL),
(67, 12, 63, 'Salad', 'salad', '', 1, 0, '2024-11-14 13:58:25', '2024-11-14 13:58:25', '127.0.0.1', NULL, NULL),
(68, 12, 64, 'Farsan', 'farsan', '', 1, 0, '2024-11-14 13:58:36', '2024-11-14 13:58:36', '127.0.0.1', NULL, NULL),
(69, 13, 65, 'Farsan', 'farsan', '', 1, 0, '2024-11-14 13:58:52', '2024-11-14 13:58:52', '127.0.0.1', NULL, NULL),
(70, 13, 66, 'Shak', 'shak', '', 1, 0, '2024-11-14 13:58:58', '2024-11-14 13:58:58', '127.0.0.1', NULL, NULL),
(71, 13, 67, 'Roti', 'roti', '', 1, 0, '2024-11-14 13:59:08', '2024-11-14 13:59:08', '127.0.0.1', NULL, NULL),
(72, 13, 68, 'Dal', 'dal', '', 1, 0, '2024-11-14 13:59:19', '2024-11-14 13:59:19', '127.0.0.1', NULL, NULL),
(73, 13, 69, 'Rice', 'rice', '', 1, 0, '2024-11-14 13:59:51', '2024-11-14 13:59:51', '127.0.0.1', NULL, NULL),
(74, 14, 69, 'Soup', 'soup', '', 1, 0, '2024-11-14 14:00:07', '2024-11-14 14:00:07', '127.0.0.1', NULL, NULL),
(75, 14, 70, 'Starters', 'starters', '', 1, 0, '2024-11-14 14:00:24', '2024-11-14 14:00:24', '127.0.0.1', NULL, NULL),
(76, 14, 71, 'Bake Food', 'bake-food', '', 1, 0, '2024-11-14 14:00:35', '2024-11-14 14:00:35', '127.0.0.1', NULL, NULL),
(77, 14, 72, 'Salad', 'salad', '', 1, 0, '2024-11-14 14:00:42', '2024-11-14 14:00:42', '127.0.0.1', NULL, NULL),
(78, 14, 73, 'Rice', 'rice', '', 1, 0, '2024-11-14 14:00:54', '2024-11-14 14:00:54', '127.0.0.1', NULL, NULL),
(79, 16, 74, 'Punjabi Sabji', 'punjabi-sabji', '', 1, 0, '2024-11-14 14:01:19', '2024-11-14 14:01:19', '127.0.0.1', NULL, NULL),
(80, 16, 75, 'Live Tava Sabji', 'live-tava-sabji', '', 1, 0, '2024-11-14 14:01:36', '2024-11-14 14:01:36', '127.0.0.1', NULL, NULL),
(81, 16, 76, 'Farsan', 'farsan', '', 1, 0, '2024-11-14 14:01:45', '2024-11-14 14:01:45', '127.0.0.1', NULL, NULL),
(82, 16, 77, 'Tava Utar', 'tava-utar', '', 1, 0, '2024-11-14 14:01:58', '2024-11-14 14:01:58', '127.0.0.1', NULL, NULL),
(83, 16, 78, 'Wada', 'wada', '', 1, 0, '2024-11-14 14:02:06', '2024-11-14 14:02:06', '127.0.0.1', NULL, NULL),
(84, 16, 79, 'Bake Dish', 'bake-dish', '', 1, 0, '2024-11-14 14:02:21', '2024-11-14 14:02:21', '127.0.0.1', NULL, NULL),
(85, 16, 80, 'Fresh Salad', 'fresh-salad', '', 1, 0, '2024-11-14 14:02:31', '2024-11-14 14:02:31', '127.0.0.1', NULL, NULL),
(86, 16, 81, 'Cream Bake Salad', 'cream-bake-salad', '', 1, 0, '2024-11-14 14:02:50', '2024-11-14 14:02:50', '127.0.0.1', NULL, NULL),
(87, 17, 82, 'Green Gujarati Shak', 'green-gujarati-shak', '', 1, 0, '2024-11-14 14:03:11', '2024-11-14 14:03:11', '127.0.0.1', NULL, NULL),
(88, 17, 83, 'Batakana Gujarati Shak', 'batakana-gujarati-shak', '', 1, 0, '2024-11-14 14:03:34', '2024-11-14 14:03:34', '127.0.0.1', NULL, NULL),
(89, 17, 84, 'Puri - Parotha', 'puri---parotha', '', 1, 0, '2024-11-14 14:03:49', '2024-11-14 14:03:49', '127.0.0.1', NULL, NULL),
(90, 17, 85, 'Roti - Naan', 'roti---naan', '', 1, 0, '2024-11-14 14:04:41', '2024-11-14 14:04:41', '127.0.0.1', NULL, NULL),
(91, 17, 86, 'Athana', 'athana', '', 1, 0, '2024-11-14 14:05:09', '2024-11-14 14:05:09', '127.0.0.1', NULL, NULL),
(92, 17, 87, 'Chutney', 'chutney', '', 1, 0, '2024-11-14 14:05:27', '2024-11-14 14:05:27', '127.0.0.1', NULL, NULL),
(93, 17, 88, 'Raita', 'raita', '', 1, 0, '2024-11-14 14:05:47', '2024-11-14 14:05:47', '127.0.0.1', NULL, NULL),
(94, 17, 89, 'Papad', '', NULL, 1, 0, '2024-11-14 14:06:02', '2025-01-10 05:22:09', '127.0.0.1', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` int(11) NOT NULL DEFAULT '2' COMMENT '1=Admin, 2=TA/TP',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `mobile_number`, `email_verified_at`, `password`, `role_id`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Super', 'Admin', 'admin@admin.com', '9028187696', NULL, '$2y$10$4x8DxxOmXXj82QVay0PKduuyXiHl7bpJDlC/Lno25CrtuLSGh8mm2', 1, 1, NULL, '2022-09-12 04:33:06', '2024-11-12 05:01:36');

-- --------------------------------------------------------

--
-- Table structure for table `video_gallery`
--

CREATE TABLE `video_gallery` (
  `videoGalleryId` int(11) NOT NULL,
  `strUrl` varchar(255) NOT NULL,
  `iStatus` tinyint(4) NOT NULL DEFAULT '1',
  `isDelete` tinyint(4) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `strIP` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `video_gallery`
--

INSERT INTO `video_gallery` (`videoGalleryId`, `strUrl`, `iStatus`, `isDelete`, `created_at`, `updated_at`, `strIP`) VALUES
(18, 'https://youtu.be/H7z-q0LhR4g?si=K2VsynwVvd5o5HRQ', 1, 0, '2024-04-01 11:42:59', '2024-04-01 11:42:59', '103.1.100.226'),
(19, 'https://youtu.be/m_qEiwav2rY?si=4zgA_ydpX0k8Cn-Z', 1, 0, '2024-04-01 11:45:02', '2024-04-01 11:45:02', '103.1.100.226'),
(20, 'https://youtu.be/zrZtXy5Vwi8?si=ERzSz0-OuK8P8KYY', 1, 0, '2024-04-01 11:45:51', '2024-04-01 11:45:51', '103.1.100.226');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`bannerId`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`categoryId`);

--
-- Indexes for table `category_features`
--
ALTER TABLE `category_features`
  ADD PRIMARY KEY (`category_featuresId`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`iCustomerId`);

--
-- Indexes for table `dealer`
--
ALTER TABLE `dealer`
  ADD PRIMARY KEY (`dealerId`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `functiondetails`
--
ALTER TABLE `functiondetails`
  ADD PRIMARY KEY (`iFunctionDetailsId`);

--
-- Indexes for table `functionmaster`
--
ALTER TABLE `functionmaster`
  ADD PRIMARY KEY (`iFunctionId`);

--
-- Indexes for table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `imagecategory`
--
ALTER TABLE `imagecategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inquiry`
--
ALTER TABLE `inquiry`
  ADD PRIMARY KEY (`inquiry_id`);

--
-- Indexes for table `itemcategory`
--
ALTER TABLE `itemcategory`
  ADD PRIMARY KEY (`iItemCategoryId`);

--
-- Indexes for table `itemmaster`
--
ALTER TABLE `itemmaster`
  ADD PRIMARY KEY (`iItemMasterId`);

--
-- Indexes for table `itemorder`
--
ALTER TABLE `itemorder`
  ADD PRIMARY KEY (`iItemOrderId`);

--
-- Indexes for table `itemsubcategory`
--
ALTER TABLE `itemsubcategory`
  ADD PRIMARY KEY (`iItemSubCategoryId`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `orderformdetails`
--
ALTER TABLE `orderformdetails`
  ADD PRIMARY KEY (`iOrderFormDetailsId`);

--
-- Indexes for table `orderformmaster`
--
ALTER TABLE `orderformmaster`
  ADD PRIMARY KEY (`iOrderFormMasterId`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `photo_gallery`
--
ALTER TABLE `photo_gallery`
  ADD PRIMARY KEY (`photoGalleryId`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`productId`),
  ADD UNIQUE KEY `productname` (`productname`);

--
-- Indexes for table `productinquiry`
--
ALTER TABLE `productinquiry`
  ADD PRIMARY KEY (`inquiry_id`);

--
-- Indexes for table `productphotos`
--
ALTER TABLE `productphotos`
  ADD PRIMARY KEY (`productphotosid`);

--
-- Indexes for table `product_features`
--
ALTER TABLE `product_features`
  ADD PRIMARY KEY (`product_featuresId`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sendemaildetails`
--
ALTER TABLE `sendemaildetails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_category`
--
ALTER TABLE `sub_category`
  ADD PRIMARY KEY (`sub_categoryId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `video_gallery`
--
ALTER TABLE `video_gallery`
  ADD PRIMARY KEY (`videoGalleryId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banner`
--
ALTER TABLE `banner`
  MODIFY `bannerId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `categoryId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `category_features`
--
ALTER TABLE `category_features`
  MODIFY `category_featuresId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=316;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `iCustomerId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `dealer`
--
ALTER TABLE `dealer`
  MODIFY `dealerId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `functiondetails`
--
ALTER TABLE `functiondetails`
  MODIFY `iFunctionDetailsId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=189;

--
-- AUTO_INCREMENT for table `functionmaster`
--
ALTER TABLE `functionmaster`
  MODIFY `iFunctionId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `image`
--
ALTER TABLE `image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `imagecategory`
--
ALTER TABLE `imagecategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `inquiry`
--
ALTER TABLE `inquiry`
  MODIFY `inquiry_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `itemcategory`
--
ALTER TABLE `itemcategory`
  MODIFY `iItemCategoryId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `itemmaster`
--
ALTER TABLE `itemmaster`
  MODIFY `iItemMasterId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `itemorder`
--
ALTER TABLE `itemorder`
  MODIFY `iItemOrderId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `itemsubcategory`
--
ALTER TABLE `itemsubcategory`
  MODIFY `iItemSubCategoryId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `orderformdetails`
--
ALTER TABLE `orderformdetails`
  MODIFY `iOrderFormDetailsId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `orderformmaster`
--
ALTER TABLE `orderformmaster`
  MODIFY `iOrderFormMasterId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `photo_gallery`
--
ALTER TABLE `photo_gallery`
  MODIFY `photoGalleryId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `productId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=580;

--
-- AUTO_INCREMENT for table `productinquiry`
--
ALTER TABLE `productinquiry`
  MODIFY `inquiry_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `productphotos`
--
ALTER TABLE `productphotos`
  MODIFY `productphotosid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=247;

--
-- AUTO_INCREMENT for table `product_features`
--
ALTER TABLE `product_features`
  MODIFY `product_featuresId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=629;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sendemaildetails`
--
ALTER TABLE `sendemaildetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `sub_category`
--
ALTER TABLE `sub_category`
  MODIFY `sub_categoryId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `video_gallery`
--
ALTER TABLE `video_gallery`
  MODIFY `videoGalleryId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
