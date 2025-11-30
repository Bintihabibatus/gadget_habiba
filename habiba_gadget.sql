-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 04, 2025 at 03:16 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `habiba_gadget`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `logo_path` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `slug`, `description`, `logo_path`, `created_at`, `updated_at`) VALUES
(1, 'Apple', 'apple', NULL, 'https://download.logo.wine/logo/Apple_University/Apple_University-Logo.wine.png', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(2, 'Samsung', 'samsung', NULL, 'https://logos-world.net/wp-content/uploads/2020/04/Samsung-Logo-1993-2005.png', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(3, 'Xiaomi', 'xiaomi', NULL, 'https://tse4.mm.bing.net/th/id/OIP.mD1BWcEp3cbYIQm5DuYFtwHaEJ?w=1160&h=650&rs=1&pid=ImgDetMain&o=7&rm=3', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(4, 'Sony', 'sony', NULL, 'https://i.pinimg.com/1200x/71/ac/84/71ac84aee7fc00c02b8f183a300c193d.jpg', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(5, 'Asus', 'asus', NULL, 'https://i.pinimg.com/1200x/8e/8e/48/8e8e486eb0cdfd5d3684318b2d1ca3ca.jpg', '2025-11-01 19:07:08', '2025-11-01 19:07:08');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Smartphone', 'smartphone', NULL, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(2, 'Laptop', 'laptop', NULL, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(3, 'Tablet', 'tablet', NULL, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(4, 'Wearable', 'wearable', NULL, '2025-11-01 19:07:08', '2025-11-01 19:07:08');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gadgets`
--

CREATE TABLE `gadgets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `model` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(12,2) DEFAULT NULL,
  `stock` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `release_date` date DEFAULT NULL,
  `rating_avg` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `published` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gadgets`
--

INSERT INTO `gadgets` (`id`, `brand_id`, `category_id`, `name`, `slug`, `model`, `description`, `price`, `stock`, `release_date`, `rating_avg`, `published`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'iPhone 15 Pro', 'iphone-15-pro', 'A3101', 'Smartphone flagship dengan chip A17 Pro.', 19999000.00, 25, '2023-09-22', 0, 1, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(2, 1, 1, 'iPhone 15', 'iphone-15', 'A3090', 'Varian standar iPhone.\n                ', 13999000.00, 40, '2023-09-22', 0, 1, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(3, 1, 1, 'Apple iPhone 14 (Varian 1)', 'apple-iphone-14-varian-1', 'MTWE-6716', 'Deskripsi singkat: Apple iPhone 14 (Varian 1) adalah perangkat Smartphone dari Apple dengan fitur unggulan dan performa solid.', 13949315.00, 65, '2025-07-07', 5, 1, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(4, 1, 1, 'Apple iPhone 15 (Varian 2)', 'apple-iphone-15-varian-2', 'DEE4-5107', 'Deskripsi singkat: Apple iPhone 15 (Varian 2) adalah perangkat Smartphone dari Apple dengan fitur unggulan dan performa solid.', 10216501.00, 12, '2025-02-26', 1, 1, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(5, 1, 1, 'Apple iPhone SE 3 (Varian 3)', 'apple-iphone-se-3-varian-3', 'OKZ0-4531', 'Deskripsi singkat: Apple iPhone SE 3 (Varian 3) adalah perangkat Smartphone dari Apple dengan fitur unggulan dan performa solid.', 10798470.00, 53, '2024-08-09', 3, 1, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(6, 1, 1, 'Apple iPhone 14 (Varian 4)', 'apple-iphone-14-varian-4', 'L8KA-9771', 'Deskripsi singkat: Apple iPhone 14 (Varian 4) adalah perangkat Smartphone dari Apple dengan fitur unggulan dan performa solid.', 9258687.00, 32, '2021-04-28', 2, 1, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(7, 1, 2, 'Apple MacBook Air M2 (Varian 1)', 'apple-macbook-air-m2-varian-1', 'XOOR-5922', 'Deskripsi singkat: Apple MacBook Air M2 (Varian 1) adalah perangkat Laptop dari Apple dengan fitur unggulan dan performa solid.', 33883016.00, 12, '2024-09-02', 0, 1, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(8, 1, 2, 'Apple MacBook Pro 14 (Varian 2)', 'apple-macbook-pro-14-varian-2', 'FOII-1564', 'Deskripsi singkat: Apple MacBook Pro 14 (Varian 2) adalah perangkat Laptop dari Apple dengan fitur unggulan dan performa solid.', 18882757.00, 47, '2025-01-22', 3, 1, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(9, 1, 2, 'Apple MacBook Air M2 (Varian 3)', 'apple-macbook-air-m2-varian-3', 'VS6D-5830', 'Deskripsi singkat: Apple MacBook Air M2 (Varian 3) adalah perangkat Laptop dari Apple dengan fitur unggulan dan performa solid.', 20670732.00, 28, '2025-05-04', 4, 1, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(10, 1, 2, 'Apple MacBook Pro 14 (Varian 4)', 'apple-macbook-pro-14-varian-4', 'K0OS-6113', 'Deskripsi singkat: Apple MacBook Pro 14 (Varian 4) adalah perangkat Laptop dari Apple dengan fitur unggulan dan performa solid.', 15563011.00, 2, '2023-09-08', 2, 1, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(11, 1, 3, 'Apple iPad Air 5 (Varian 1)', 'apple-ipad-air-5-varian-1', 'KK9J-6295', 'Deskripsi singkat: Apple iPad Air 5 (Varian 1) adalah perangkat Tablet dari Apple dengan fitur unggulan dan performa solid.', 11152218.00, 55, '2021-02-20', 0, 1, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(12, 1, 3, 'Apple iPad Pro 11 (Varian 2)', 'apple-ipad-pro-11-varian-2', 'T88W-5941', 'Deskripsi singkat: Apple iPad Pro 11 (Varian 2) adalah perangkat Tablet dari Apple dengan fitur unggulan dan performa solid.', 18556375.00, 67, '2023-07-01', 0, 1, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(13, 1, 3, 'Apple iPad Air 5 (Varian 3)', 'apple-ipad-air-5-varian-3', 'YIJK-6506', 'Deskripsi singkat: Apple iPad Air 5 (Varian 3) adalah perangkat Tablet dari Apple dengan fitur unggulan dan performa solid.', 2211503.00, 97, '2023-01-11', 5, 1, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(14, 1, 3, 'Apple iPad Pro 11 (Varian 4)', 'apple-ipad-pro-11-varian-4', 'ENKP-1487', 'Deskripsi singkat: Apple iPad Pro 11 (Varian 4) adalah perangkat Tablet dari Apple dengan fitur unggulan dan performa solid.', 10049526.00, 1, '2025-03-02', 3, 1, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(15, 1, 4, 'Apple Apple Watch Series 9 (Varian 1)', 'apple-apple-watch-series-9-varian-1', 'F4GG-7259', 'Deskripsi singkat: Apple Apple Watch Series 9 (Varian 1) adalah perangkat Wearable dari Apple dengan fitur unggulan dan performa solid.', 2644163.00, 86, '2024-11-11', 0, 1, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(16, 1, 4, 'Apple AirPods Pro 2 (Varian 2)', 'apple-airpods-pro-2-varian-2', 'ZUW7-7513', 'Deskripsi singkat: Apple AirPods Pro 2 (Varian 2) adalah perangkat Wearable dari Apple dengan fitur unggulan dan performa solid.', 7307971.00, 19, '2021-11-03', 4, 1, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(17, 1, 4, 'Apple Apple Watch Series 9 (Varian 3)', 'apple-apple-watch-series-9-varian-3', '7ZS6-4620', 'Deskripsi singkat: Apple Apple Watch Series 9 (Varian 3) adalah perangkat Wearable dari Apple dengan fitur unggulan dan performa solid.', 4117859.00, 31, '2021-12-18', 5, 1, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(18, 1, 4, 'Apple AirPods Pro 2 (Varian 4)', 'apple-airpods-pro-2-varian-4', 'LB9X-3219', 'Deskripsi singkat: Apple AirPods Pro 2 (Varian 4) adalah perangkat Wearable dari Apple dengan fitur unggulan dan performa solid.', 2448801.00, 24, '2023-11-03', 4, 1, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(19, 2, 1, 'Samsung Galaxy S23 (Varian 1)', 'samsung-galaxy-s23-varian-1', '9YSO-1332', 'Deskripsi singkat: Samsung Galaxy S23 (Varian 1) adalah perangkat Smartphone dari Samsung dengan fitur unggulan dan performa solid.', 6883224.00, 10, '2022-05-16', 4, 1, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(20, 2, 1, 'Samsung Galaxy A54 (Varian 2)', 'samsung-galaxy-a54-varian-2', 'TD95-2110', 'Deskripsi singkat: Samsung Galaxy A54 (Varian 2) adalah perangkat Smartphone dari Samsung dengan fitur unggulan dan performa solid.', 18846667.00, 33, '2023-02-25', 4, 1, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(21, 2, 1, 'Samsung Galaxy S23 (Varian 3)', 'samsung-galaxy-s23-varian-3', 'KMLO-6054', 'Deskripsi singkat: Samsung Galaxy S23 (Varian 3) adalah perangkat Smartphone dari Samsung dengan fitur unggulan dan performa solid.', 12408435.00, 19, '2020-12-06', 1, 1, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(22, 2, 1, 'Samsung Galaxy A54 (Varian 4)', 'samsung-galaxy-a54-varian-4', 'EMB7-6333', 'Deskripsi singkat: Samsung Galaxy A54 (Varian 4) adalah perangkat Smartphone dari Samsung dengan fitur unggulan dan performa solid.', 25232514.00, 84, '2023-03-10', 2, 1, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(23, 2, 2, 'Samsung Galaxy Book3 (Varian 1)', 'samsung-galaxy-book3-varian-1', 'QIMS-8163', 'Deskripsi singkat: Samsung Galaxy Book3 (Varian 1) adalah perangkat Laptop dari Samsung dengan fitur unggulan dan performa solid.', 7428757.00, 97, '2024-01-09', 2, 1, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(24, 2, 2, 'Samsung Galaxy Book3 (Varian 2)', 'samsung-galaxy-book3-varian-2', 'QZY9-5134', 'Deskripsi singkat: Samsung Galaxy Book3 (Varian 2) adalah perangkat Laptop dari Samsung dengan fitur unggulan dan performa solid.', 11706488.00, 100, '2023-12-05', 2, 1, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(25, 2, 2, 'Samsung Galaxy Book3 (Varian 3)', 'samsung-galaxy-book3-varian-3', 'ND9E-8188', 'Deskripsi singkat: Samsung Galaxy Book3 (Varian 3) adalah perangkat Laptop dari Samsung dengan fitur unggulan dan performa solid.', 14831664.00, 77, '2023-01-20', 2, 1, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(26, 2, 2, 'Samsung Galaxy Book3 (Varian 4)', 'samsung-galaxy-book3-varian-4', 'PU9V-3290', 'Deskripsi singkat: Samsung Galaxy Book3 (Varian 4) adalah perangkat Laptop dari Samsung dengan fitur unggulan dan performa solid.', 21130334.00, 59, '2022-12-25', 5, 1, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(27, 2, 3, 'Samsung Galaxy Tab S9 (Varian 1)', 'samsung-galaxy-tab-s9-varian-1', 'AFHB-3674', 'Deskripsi singkat: Samsung Galaxy Tab S9 (Varian 1) adalah perangkat Tablet dari Samsung dengan fitur unggulan dan performa solid.', 6794096.00, 73, '2024-02-24', 2, 1, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(28, 2, 3, 'Samsung Galaxy Tab A9 (Varian 2)', 'samsung-galaxy-tab-a9-varian-2', 'TPFE-3452', 'Deskripsi singkat: Samsung Galaxy Tab A9 (Varian 2) adalah perangkat Tablet dari Samsung dengan fitur unggulan dan performa solid.', 2393664.00, 64, '2022-05-09', 4, 1, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(29, 2, 3, 'Samsung Galaxy Tab S9 (Varian 3)', 'samsung-galaxy-tab-s9-varian-3', 'DUIT-2126', 'Deskripsi singkat: Samsung Galaxy Tab S9 (Varian 3) adalah perangkat Tablet dari Samsung dengan fitur unggulan dan performa solid.', 15542009.00, 61, '2025-04-16', 3, 1, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(30, 2, 3, 'Samsung Galaxy Tab A9 (Varian 4)', 'samsung-galaxy-tab-a9-varian-4', 'LSNZ-5302', 'Deskripsi singkat: Samsung Galaxy Tab A9 (Varian 4) adalah perangkat Tablet dari Samsung dengan fitur unggulan dan performa solid.', 8944038.00, 32, '2023-04-08', 4, 1, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(31, 2, 4, 'Samsung Galaxy Watch6 (Varian 1)', 'samsung-galaxy-watch6-varian-1', '9DTC-3658', 'Deskripsi singkat: Samsung Galaxy Watch6 (Varian 1) adalah perangkat Wearable dari Samsung dengan fitur unggulan dan performa solid.', 607716.00, 5, '2023-01-04', 4, 1, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(32, 2, 4, 'Samsung Galaxy Buds2 Pro (Varian 2)', 'samsung-galaxy-buds2-pro-varian-2', 'RFMU-8552', 'Deskripsi singkat: Samsung Galaxy Buds2 Pro (Varian 2) adalah perangkat Wearable dari Samsung dengan fitur unggulan dan performa solid.', 3511761.00, 15, '2022-12-03', 2, 1, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(33, 2, 4, 'Samsung Galaxy Watch6 (Varian 3)', 'samsung-galaxy-watch6-varian-3', 'M0AJ-7706', 'Deskripsi singkat: Samsung Galaxy Watch6 (Varian 3) adalah perangkat Wearable dari Samsung dengan fitur unggulan dan performa solid.', 3974811.00, 2, '2023-02-13', 1, 1, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(34, 2, 4, 'Samsung Galaxy Buds2 Pro (Varian 4)', 'samsung-galaxy-buds2-pro-varian-4', 'GWAM-3461', 'Deskripsi singkat: Samsung Galaxy Buds2 Pro (Varian 4) adalah perangkat Wearable dari Samsung dengan fitur unggulan dan performa solid.', 7152252.00, 19, '2023-11-16', 5, 1, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(35, 3, 1, 'Xiaomi Redmi Note 13 (Varian 1)', 'xiaomi-redmi-note-13-varian-1', 'CWNI-8188', 'Deskripsi singkat: Xiaomi Redmi Note 13 (Varian 1) adalah perangkat Smartphone dari Xiaomi dengan fitur unggulan dan performa solid.', 28043402.00, 12, '2024-03-10', 0, 1, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(36, 3, 1, 'Xiaomi Xiaomi 13 (Varian 2)', 'xiaomi-xiaomi-13-varian-2', 'VA48-9163', 'Deskripsi singkat: Xiaomi Xiaomi 13 (Varian 2) adalah perangkat Smartphone dari Xiaomi dengan fitur unggulan dan performa solid.', 28010127.00, 98, '2024-02-08', 0, 1, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(37, 3, 1, 'Xiaomi Redmi Note 13 (Varian 3)', 'xiaomi-redmi-note-13-varian-3', 'M0FE-9761', 'Deskripsi singkat: Xiaomi Redmi Note 13 (Varian 3) adalah perangkat Smartphone dari Xiaomi dengan fitur unggulan dan performa solid.', 19101905.00, 44, '2023-06-11', 1, 1, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(38, 3, 1, 'Xiaomi Xiaomi 13 (Varian 4)', 'xiaomi-xiaomi-13-varian-4', 'I5IQ-9909', 'Deskripsi singkat: Xiaomi Xiaomi 13 (Varian 4) adalah perangkat Smartphone dari Xiaomi dengan fitur unggulan dan performa solid.', 3976758.00, 27, '2022-06-15', 3, 1, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(39, 3, 2, 'Xiaomi Mi Notebook Pro (Varian 1)', 'xiaomi-mi-notebook-pro-varian-1', 'GUXC-7218', 'Deskripsi singkat: Xiaomi Mi Notebook Pro (Varian 1) adalah perangkat Laptop dari Xiaomi dengan fitur unggulan dan performa solid.', 10295708.00, 37, '2025-04-09', 3, 1, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(40, 3, 2, 'Xiaomi Mi Notebook Pro (Varian 2)', 'xiaomi-mi-notebook-pro-varian-2', '1AUK-7324', 'Deskripsi singkat: Xiaomi Mi Notebook Pro (Varian 2) adalah perangkat Laptop dari Xiaomi dengan fitur unggulan dan performa solid.', 35256643.00, 26, '2021-10-29', 2, 1, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(41, 3, 2, 'Xiaomi Mi Notebook Pro (Varian 3)', 'xiaomi-mi-notebook-pro-varian-3', 'QHLK-8827', 'Deskripsi singkat: Xiaomi Mi Notebook Pro (Varian 3) adalah perangkat Laptop dari Xiaomi dengan fitur unggulan dan performa solid.', 32767839.00, 58, '2022-04-05', 4, 1, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(42, 3, 2, 'Xiaomi Mi Notebook Pro (Varian 4)', 'xiaomi-mi-notebook-pro-varian-4', 'QPGI-3643', 'Deskripsi singkat: Xiaomi Mi Notebook Pro (Varian 4) adalah perangkat Laptop dari Xiaomi dengan fitur unggulan dan performa solid.', 12737905.00, 18, '2021-04-16', 0, 1, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(43, 3, 3, 'Xiaomi Mi Pad 6 (Varian 1)', 'xiaomi-mi-pad-6-varian-1', 'ZPRX-5082', 'Deskripsi singkat: Xiaomi Mi Pad 6 (Varian 1) adalah perangkat Tablet dari Xiaomi dengan fitur unggulan dan performa solid.', 8276869.00, 8, '2021-07-30', 5, 1, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(44, 3, 3, 'Xiaomi Mi Pad 6 (Varian 2)', 'xiaomi-mi-pad-6-varian-2', 'GYKB-6316', 'Deskripsi singkat: Xiaomi Mi Pad 6 (Varian 2) adalah perangkat Tablet dari Xiaomi dengan fitur unggulan dan performa solid.', 11654293.00, 48, '2025-06-17', 2, 1, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(45, 3, 3, 'Xiaomi Mi Pad 6 (Varian 3)', 'xiaomi-mi-pad-6-varian-3', '1SZI-5149', 'Deskripsi singkat: Xiaomi Mi Pad 6 (Varian 3) adalah perangkat Tablet dari Xiaomi dengan fitur unggulan dan performa solid.', 19935687.00, 14, '2022-12-16', 0, 1, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(46, 3, 3, 'Xiaomi Mi Pad 6 (Varian 4)', 'xiaomi-mi-pad-6-varian-4', 'UBF1-4911', 'Deskripsi singkat: Xiaomi Mi Pad 6 (Varian 4) adalah perangkat Tablet dari Xiaomi dengan fitur unggulan dan performa solid.', 14333063.00, 85, '2022-02-12', 4, 1, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(47, 3, 4, 'Xiaomi Mi Band 8 (Varian 1)', 'xiaomi-mi-band-8-varian-1', '5DNI-1505', 'Deskripsi singkat: Xiaomi Mi Band 8 (Varian 1) adalah perangkat Wearable dari Xiaomi dengan fitur unggulan dan performa solid.', 4804179.00, 94, '2024-08-28', 2, 1, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(48, 3, 4, 'Xiaomi Mi Band 8 (Varian 2)', 'xiaomi-mi-band-8-varian-2', 'FXXX-6524', 'Deskripsi singkat: Xiaomi Mi Band 8 (Varian 2) adalah perangkat Wearable dari Xiaomi dengan fitur unggulan dan performa solid.', 4246177.00, 47, '2021-07-17', 2, 1, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(49, 3, 4, 'Xiaomi Mi Band 8 (Varian 3)', 'xiaomi-mi-band-8-varian-3', 'P0ZI-1671', 'Deskripsi singkat: Xiaomi Mi Band 8 (Varian 3) adalah perangkat Wearable dari Xiaomi dengan fitur unggulan dan performa solid.', 5660932.00, 8, '2024-12-16', 5, 1, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(50, 3, 4, 'Xiaomi Mi Band 8 (Varian 4)', 'xiaomi-mi-band-8-varian-4', 'SCGY-6777', 'Deskripsi singkat: Xiaomi Mi Band 8 (Varian 4) adalah perangkat Wearable dari Xiaomi dengan fitur unggulan dan performa solid.', 2377883.00, 18, '2025-09-26', 5, 1, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(51, 4, 1, 'Sony Xperia 5 V (Varian 1)', 'sony-xperia-5-v-varian-1', 'YJGC-5681', 'Deskripsi singkat: Sony Xperia 5 V (Varian 1) adalah perangkat Smartphone dari Sony dengan fitur unggulan dan performa solid.', 12687291.00, 27, '2025-02-23', 3, 1, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(52, 4, 1, 'Sony Xperia 5 V (Varian 2)', 'sony-xperia-5-v-varian-2', 'GYFS-6886', 'Deskripsi singkat: Sony Xperia 5 V (Varian 2) adalah perangkat Smartphone dari Sony dengan fitur unggulan dan performa solid.', 11811782.00, 35, '2020-12-24', 0, 1, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(53, 4, 1, 'Sony Xperia 5 V (Varian 3)', 'sony-xperia-5-v-varian-3', '5PTW-3648', 'Deskripsi singkat: Sony Xperia 5 V (Varian 3) adalah perangkat Smartphone dari Sony dengan fitur unggulan dan performa solid.', 18486299.00, 40, '2023-04-22', 1, 1, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(54, 4, 1, 'Sony Xperia 5 V (Varian 4)', 'sony-xperia-5-v-varian-4', 'E2W6-8828', 'Deskripsi singkat: Sony Xperia 5 V (Varian 4) adalah perangkat Smartphone dari Sony dengan fitur unggulan dan performa solid.', 22795719.00, 99, '2023-03-21', 1, 1, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(55, 4, 2, 'Sony VAIO Z (Varian 1)', 'sony-vaio-z-varian-1', '3HVR-3783', 'Deskripsi singkat: Sony VAIO Z (Varian 1) adalah perangkat Laptop dari Sony dengan fitur unggulan dan performa solid.', 16749894.00, 57, '2024-09-14', 4, 1, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(56, 4, 2, 'Sony VAIO Z (Varian 2)', 'sony-vaio-z-varian-2', '8KH7-2251', 'Deskripsi singkat: Sony VAIO Z (Varian 2) adalah perangkat Laptop dari Sony dengan fitur unggulan dan performa solid.', 28959941.00, 93, '2024-07-06', 1, 1, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(57, 4, 2, 'Sony VAIO Z (Varian 3)', 'sony-vaio-z-varian-3', '7GKE-4411', 'Deskripsi singkat: Sony VAIO Z (Varian 3) adalah perangkat Laptop dari Sony dengan fitur unggulan dan performa solid.', 8542016.00, 80, '2021-10-22', 1, 1, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(58, 4, 2, 'Sony VAIO Z (Varian 4)', 'sony-vaio-z-varian-4', 'CV4H-6191', 'Deskripsi singkat: Sony VAIO Z (Varian 4) adalah perangkat Laptop dari Sony dengan fitur unggulan dan performa solid.', 37089315.00, 88, '2024-09-19', 1, 1, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(59, 4, 3, 'Sony Xperia Tablet Z4 (Varian 1)', 'sony-xperia-tablet-z4-varian-1', 'OKIU-2471', 'Deskripsi singkat: Sony Xperia Tablet Z4 (Varian 1) adalah perangkat Tablet dari Sony dengan fitur unggulan dan performa solid.', 2166060.00, 45, '2021-05-14', 3, 1, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(60, 4, 3, 'Sony Xperia Tablet Z4 (Varian 2)', 'sony-xperia-tablet-z4-varian-2', 'XGMQ-5196', 'Deskripsi singkat: Sony Xperia Tablet Z4 (Varian 2) adalah perangkat Tablet dari Sony dengan fitur unggulan dan performa solid.', 6032275.00, 7, '2023-09-10', 1, 1, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(61, 4, 3, 'Sony Xperia Tablet Z4 (Varian 3)', 'sony-xperia-tablet-z4-varian-3', 'BIK8-2503', 'Deskripsi singkat: Sony Xperia Tablet Z4 (Varian 3) adalah perangkat Tablet dari Sony dengan fitur unggulan dan performa solid.', 6503880.00, 32, '2024-08-26', 5, 1, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(62, 4, 3, 'Sony Xperia Tablet Z4 (Varian 4)', 'sony-xperia-tablet-z4-varian-4', '6FEQ-9310', 'Deskripsi singkat: Sony Xperia Tablet Z4 (Varian 4) adalah perangkat Tablet dari Sony dengan fitur unggulan dan performa solid.', 17511972.00, 20, '2023-08-26', 1, 1, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(63, 4, 4, 'Sony WH-1000XM5 (Varian 1)', 'sony-wh-1000xm5-varian-1', 'VZJZ-3932', 'Deskripsi singkat: Sony WH-1000XM5 (Varian 1) adalah perangkat Wearable dari Sony dengan fitur unggulan dan performa solid.', 7735399.00, 25, '2021-06-17', 3, 1, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(64, 4, 4, 'Sony WF-1000XM5 (Varian 2)', 'sony-wf-1000xm5-varian-2', 'AFND-5078', 'Deskripsi singkat: Sony WF-1000XM5 (Varian 2) adalah perangkat Wearable dari Sony dengan fitur unggulan dan performa solid.', 7212818.00, 67, '2025-04-19', 0, 1, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(65, 4, 4, 'Sony WH-1000XM5 (Varian 3)', 'sony-wh-1000xm5-varian-3', 'XLDI-8186', 'Deskripsi singkat: Sony WH-1000XM5 (Varian 3) adalah perangkat Wearable dari Sony dengan fitur unggulan dan performa solid.', 1589410.00, 79, '2025-05-04', 2, 1, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(66, 4, 4, 'Sony WF-1000XM5 (Varian 4)', 'sony-wf-1000xm5-varian-4', 'DKKS-3233', 'Deskripsi singkat: Sony WF-1000XM5 (Varian 4) adalah perangkat Wearable dari Sony dengan fitur unggulan dan performa solid.', 5666081.00, 42, '2023-03-20', 3, 1, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(67, 5, 1, 'Asus ROG Phone 7 (Varian 1)', 'asus-rog-phone-7-varian-1', 'UNCW-3664', 'Deskripsi singkat: Asus ROG Phone 7 (Varian 1) adalah perangkat Smartphone dari Asus dengan fitur unggulan dan performa solid.', 9300214.00, 1, '2020-11-19', 4, 1, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(68, 5, 1, 'Asus ROG Phone 7 (Varian 2)', 'asus-rog-phone-7-varian-2', 'SQEF-4501', 'Deskripsi singkat: Asus ROG Phone 7 (Varian 2) adalah perangkat Smartphone dari Asus dengan fitur unggulan dan performa solid.', 8155370.00, 11, '2023-07-18', 4, 1, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(69, 5, 1, 'Asus ROG Phone 7 (Varian 3)', 'asus-rog-phone-7-varian-3', 'L6NT-1099', 'Deskripsi singkat: Asus ROG Phone 7 (Varian 3) adalah perangkat Smartphone dari Asus dengan fitur unggulan dan performa solid.', 22263387.00, 81, '2025-08-08', 3, 1, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(70, 5, 1, 'Asus ROG Phone 7 (Varian 4)', 'asus-rog-phone-7-varian-4', 'RURP-1638', 'Deskripsi singkat: Asus ROG Phone 7 (Varian 4) adalah perangkat Smartphone dari Asus dengan fitur unggulan dan performa solid.', 6860941.00, 26, '2021-04-15', 3, 1, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(71, 5, 2, 'Asus ROG Zephyrus G14 (Varian 1)', 'asus-rog-zephyrus-g14-varian-1', 'QPA7-5574', 'Deskripsi singkat: Asus ROG Zephyrus G14 (Varian 1) adalah perangkat Laptop dari Asus dengan fitur unggulan dan performa solid.', 39651150.00, 8, '2025-09-03', 2, 1, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(72, 5, 2, 'Asus ZenBook 14 (Varian 2)', 'asus-zenbook-14-varian-2', 'JDT0-6896', 'Deskripsi singkat: Asus ZenBook 14 (Varian 2) adalah perangkat Laptop dari Asus dengan fitur unggulan dan performa solid.', 7221933.00, 55, '2025-06-15', 1, 1, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(73, 5, 2, 'Asus ROG Zephyrus G14 (Varian 3)', 'asus-rog-zephyrus-g14-varian-3', 'KQRC-1719', 'Deskripsi singkat: Asus ROG Zephyrus G14 (Varian 3) adalah perangkat Laptop dari Asus dengan fitur unggulan dan performa solid.', 27126920.00, 43, '2020-11-24', 0, 1, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(74, 5, 2, 'Asus ZenBook 14 (Varian 4)', 'asus-zenbook-14-varian-4', 'KBDF-2170', 'Deskripsi singkat: Asus ZenBook 14 (Varian 4) adalah perangkat Laptop dari Asus dengan fitur unggulan dan performa solid.', 38994644.00, 63, '2021-10-17', 1, 1, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(75, 5, 3, 'Asus ASUS ZenPad 3S 10 (Varian 1)', 'asus-asus-zenpad-3s-10-varian-1', 'G6RC-5851', 'Deskripsi singkat: Asus ASUS ZenPad 3S 10 (Varian 1) adalah perangkat Tablet dari Asus dengan fitur unggulan dan performa solid.', 11729933.00, 98, '2024-05-10', 3, 1, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(76, 5, 3, 'Asus ASUS ZenPad 3S 10 (Varian 2)', 'asus-asus-zenpad-3s-10-varian-2', 'IHDD-6728', 'Deskripsi singkat: Asus ASUS ZenPad 3S 10 (Varian 2) adalah perangkat Tablet dari Asus dengan fitur unggulan dan performa solid.', 3996138.00, 34, '2022-10-27', 1, 1, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(77, 5, 3, 'Asus ASUS ZenPad 3S 10 (Varian 3)', 'asus-asus-zenpad-3s-10-varian-3', '0PVM-6591', 'Deskripsi singkat: Asus ASUS ZenPad 3S 10 (Varian 3) adalah perangkat Tablet dari Asus dengan fitur unggulan dan performa solid.', 15783595.00, 93, '2024-09-17', 4, 1, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(78, 5, 3, 'Asus ASUS ZenPad 3S 10 (Varian 4)', 'asus-asus-zenpad-3s-10-varian-4', '7KHU-3071', 'Deskripsi singkat: Asus ASUS ZenPad 3S 10 (Varian 4) adalah perangkat Tablet dari Asus dengan fitur unggulan dan performa solid.', 10017315.00, 26, '2021-02-24', 2, 1, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(79, 5, 4, 'Asus ASUS VivoWatch 5 (Varian 1)', 'asus-asus-vivowatch-5-varian-1', 'KQYD-2518', 'Deskripsi singkat: Asus ASUS VivoWatch 5 (Varian 1) adalah perangkat Wearable dari Asus dengan fitur unggulan dan performa solid.', 6220943.00, 37, '2020-11-10', 4, 1, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(80, 5, 4, 'Asus ASUS VivoWatch 5 (Varian 2)', 'asus-asus-vivowatch-5-varian-2', 'SH55-5127', 'Deskripsi singkat: Asus ASUS VivoWatch 5 (Varian 2) adalah perangkat Wearable dari Asus dengan fitur unggulan dan performa solid.', 2114921.00, 39, '2025-04-15', 4, 1, '2025-11-01 19:07:10', '2025-11-01 19:07:10');

-- --------------------------------------------------------

--
-- Table structure for table `gadget_images`
--

CREATE TABLE `gadget_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `gadget_id` bigint(20) UNSIGNED NOT NULL,
  `path` varchar(255) NOT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `position` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gadget_images`
--

INSERT INTO `gadget_images` (`id`, `gadget_id`, `path`, `caption`, `position`, `created_at`, `updated_at`) VALUES
(1, 1, 'images/iphone15pro-1.jpg', 'Depan', 0, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(2, 1, 'images/iphone15pro-2.jpg', 'Belakang', 0, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(3, 2, 'images/iphone15-1.jpg', 'Depan', 0, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(4, 3, 'https://tse4.mm.bing.net/th/id/OIP.NLW9jD2Iy6lQC6DWRSE-2AHaE0?rs=1&pid=ImgDetMain&o=7&rm=3', 'Apple iPhone 14 (Varian 1) Image 1', 0, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(5, 3, 'https://images.unsplash.com/photo-1603921326210-6edd2d60ca68?q=80&w=1200&auto=format&fit=crop', 'Apple iPhone 14 (Varian 1) Image 2', 1, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(6, 3, 'https://images.unsplash.com/photo-1557180295-76eee20ae8aa?q=80&w=1200&auto=format&fit=crop', 'Apple iPhone 14 (Varian 1) Image 3', 2, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(7, 3, 'https://images.unsplash.com/photo-1512499617640-c2f999098c36?q=80&w=1200&auto=format&fit=crop', 'Apple iPhone 14 (Varian 1) Image 4', 3, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(8, 4, 'https://i.pinimg.com/1200x/6d/a0/ca/6da0cad67f0bb3c77cd531fc2314c399.jpg', 'Apple iPhone 15 (Varian 2) Image 1', 0, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(9, 4, 'https://images.unsplash.com/photo-1616486026926-6f7b074877f8?q=80&w=1200&auto=format&fit=crop', 'Apple iPhone 15 (Varian 2) Image 2', 1, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(10, 4, 'https://images.unsplash.com/photo-1603921326210-6edd2d60ca68?q=80&w=1200&auto=format&fit=crop', 'Apple iPhone 15 (Varian 2) Image 3', 2, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(11, 4, 'https://images.unsplash.com/photo-1512499617640-c2f999098c36?q=80&w=1200&auto=format&fit=crop', 'Apple iPhone 15 (Varian 2) Image 4', 3, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(12, 5, 'https://th.bing.com/th/id/OIP.0ybdm1crf5tY0T7lhB-cxQHaEa?w=276&h=180&c=7&r=0&o=7&dpr=1.5&pid=1.7&rm=3', 'Apple iPhone SE 3 (Varian 3) Image 1', 0, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(13, 5, 'https://images.unsplash.com/photo-1557180295-76eee20ae8aa?q=80&w=1200&auto=format&fit=crop', 'Apple iPhone SE 3 (Varian 3) Image 2', 1, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(14, 5, 'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?q=80&w=1200&auto=format&fit=crop', 'Apple iPhone SE 3 (Varian 3) Image 3', 2, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(15, 5, 'https://images.unsplash.com/photo-1512499617640-c2f999098c36?q=80&w=1200&auto=format&fit=crop', 'Apple iPhone SE 3 (Varian 3) Image 4', 3, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(16, 6, 'https://p.turbosquid.com/ts-thumb/zd/RYIlx1/vS/9/jpg/1664951196/1920x1080/fit_q87/0c42195de3134a45e1780e90ca23ce1b5181b2e7/9.jpg', 'Apple iPhone 14 (Varian 4) Image 1', 0, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(17, 6, 'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?q=80&w=1200&auto=format&fit=crop', 'Apple iPhone 14 (Varian 4) Image 2', 1, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(18, 6, 'https://images.unsplash.com/photo-1616486026926-6f7b074877f8?q=80&w=1200&auto=format&fit=crop', 'Apple iPhone 14 (Varian 4) Image 3', 2, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(19, 6, 'https://images.unsplash.com/photo-1512499617640-c2f999098c36?q=80&w=1200&auto=format&fit=crop', 'Apple iPhone 14 (Varian 4) Image 4', 3, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(20, 7, 'https://i.pinimg.com/1200x/1e/7a/85/1e7a85983919262fe06785c05097ee0d.jpg', 'Apple MacBook Air M2 (Varian 1) Image 1', 0, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(21, 7, 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?q=80&w=1200&auto=format&fit=crop', 'Apple MacBook Air M2 (Varian 1) Image 2', 1, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(22, 7, 'https://images.unsplash.com/photo-1518770660438-4631541fd4d1?q=80&w=1200&auto=format&fit=crop', 'Apple MacBook Air M2 (Varian 1) Image 3', 2, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(23, 7, 'https://images.unsplash.com/photo-1515879218367-8466d910aaa4?q=80&w=1200&auto=format&fit=crop', 'Apple MacBook Air M2 (Varian 1) Image 4', 3, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(24, 8, 'https://i.pinimg.com/736x/20/bc/bd/20bcbd1ca089d6170219436b25bc1487.jpg', 'Apple MacBook Pro 14 (Varian 2) Image 1', 0, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(25, 8, 'https://images.unsplash.com/photo-1486312338219-ce68d2c6f44d?q=80&w=1200&auto=format&fit=crop', 'Apple MacBook Pro 14 (Varian 2) Image 2', 1, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(26, 8, 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?q=80&w=1200&auto=format&fit=crop', 'Apple MacBook Pro 14 (Varian 2) Image 3', 2, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(27, 8, 'https://images.unsplash.com/photo-1515879218367-8466d910aaa4?q=80&w=1200&auto=format&fit=crop', 'Apple MacBook Pro 14 (Varian 2) Image 4', 3, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(28, 9, 'https://i.pinimg.com/736x/1b/13/ba/1b13bab84c52ef338740b0072284462c.jpg', 'Apple MacBook Air M2 (Varian 3) Image 1', 0, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(29, 9, 'https://images.unsplash.com/photo-1518770660438-4631541fd4d1?q=80&w=1200&auto=format&fit=crop', 'Apple MacBook Air M2 (Varian 3) Image 2', 1, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(30, 9, 'https://images.unsplash.com/photo-1519389950473-47ba0277781c?q=80&w=1200&auto=format&fit=crop', 'Apple MacBook Air M2 (Varian 3) Image 3', 2, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(31, 9, 'https://images.unsplash.com/photo-1515879218367-8466d910aaa4?q=80&w=1200&auto=format&fit=crop', 'Apple MacBook Air M2 (Varian 3) Image 4', 3, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(32, 10, 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?q=80&w=1200&auto=format&fit=crop', 'Apple MacBook Pro 14 (Varian 4) Image 1', 0, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(33, 10, 'https://images.unsplash.com/photo-1519389950473-47ba0277781c?q=80&w=1200&auto=format&fit=crop', 'Apple MacBook Pro 14 (Varian 4) Image 2', 1, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(34, 10, 'https://images.unsplash.com/photo-1486312338219-ce68d2c6f44d?q=80&w=1200&auto=format&fit=crop', 'Apple MacBook Pro 14 (Varian 4) Image 3', 2, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(35, 10, 'https://images.unsplash.com/photo-1515879218367-8466d910aaa4?q=80&w=1200&auto=format&fit=crop', 'Apple MacBook Pro 14 (Varian 4) Image 4', 3, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(36, 11, 'https://images.unsplash.com/photo-1517694712202-14dd9538aa97?q=80&w=1200&auto=format&fit=crop', 'Apple iPad Air 5 (Varian 1) Image 1', 0, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(37, 11, 'https://images.unsplash.com/photo-1529333166437-7750a6dd5a70?q=80&w=1200&auto=format&fit=crop', 'Apple iPad Air 5 (Varian 1) Image 2', 1, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(38, 11, 'https://images.unsplash.com/photo-1587825140400-224e3a3ad0d2?q=80&w=1200&auto=format&fit=crop', 'Apple iPad Air 5 (Varian 1) Image 3', 2, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(39, 11, 'https://images.unsplash.com/photo-1601933470923-c6f2040aa6d3?q=80&w=1200&auto=format&fit=crop', 'Apple iPad Air 5 (Varian 1) Image 4', 3, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(40, 12, 'https://images.unsplash.com/photo-1587825140400-224e3a3ad0d2?q=80&w=1200&auto=format&fit=crop', 'Apple iPad Pro 11 (Varian 2) Image 1', 0, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(41, 12, 'https://images.unsplash.com/photo-1516979187457-637abb4f9353?q=80&w=1200&auto=format&fit=crop', 'Apple iPad Pro 11 (Varian 2) Image 2', 1, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(42, 12, 'https://images.unsplash.com/photo-1529333166437-7750a6dd5a70?q=80&w=1200&auto=format&fit=crop', 'Apple iPad Pro 11 (Varian 2) Image 3', 2, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(43, 12, 'https://images.unsplash.com/photo-1601933470923-c6f2040aa6d3?q=80&w=1200&auto=format&fit=crop', 'Apple iPad Pro 11 (Varian 2) Image 4', 3, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(44, 13, 'https://i.pinimg.com/1200x/c9/69/30/c969308ca5125c7995437231ae5d1c3f.jpg', 'Apple iPad Air 5 (Varian 3) Image 1', 0, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(45, 13, 'https://images.unsplash.com/photo-1587825140400-224e3a3ad0d2?q=80&w=1200&auto=format&fit=crop', 'Apple iPad Air 5 (Varian 3) Image 2', 1, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(46, 13, 'https://images.unsplash.com/photo-1517694712202-14dd9538aa97?q=80&w=1200&auto=format&fit=crop', 'Apple iPad Air 5 (Varian 3) Image 3', 2, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(47, 13, 'https://images.unsplash.com/photo-1601933470923-c6f2040aa6d3?q=80&w=1200&auto=format&fit=crop', 'Apple iPad Air 5 (Varian 3) Image 4', 3, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(48, 14, 'https://images.unsplash.com/photo-1529333166437-7750a6dd5a70?q=80&w=1200&auto=format&fit=crop', 'Apple iPad Pro 11 (Varian 4) Image 1', 0, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(49, 14, 'https://images.unsplash.com/photo-1517694712202-14dd9538aa97?q=80&w=1200&auto=format&fit=crop', 'Apple iPad Pro 11 (Varian 4) Image 2', 1, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(50, 14, 'https://images.unsplash.com/photo-1516979187457-637abb4f9353?q=80&w=1200&auto=format&fit=crop', 'Apple iPad Pro 11 (Varian 4) Image 3', 2, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(51, 14, 'https://images.unsplash.com/photo-1601933470923-c6f2040aa6d3?q=80&w=1200&auto=format&fit=crop', 'Apple iPad Pro 11 (Varian 4) Image 4', 3, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(52, 15, 'https://images.unsplash.com/photo-1512149673953-1e251807ec39?q=80&w=1200&auto=format&fit=crop', 'Apple Apple Watch Series 9 (Varian 1) Image 1', 0, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(53, 15, 'https://images.unsplash.com/photo-1523275335684-37898b6baf30?q=80&w=1200&auto=format&fit=crop', 'Apple Apple Watch Series 9 (Varian 1) Image 2', 1, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(54, 15, 'https://images.unsplash.com/photo-1508685096489-7aacd43bd3b1?q=80&w=1200&auto=format&fit=crop', 'Apple Apple Watch Series 9 (Varian 1) Image 3', 2, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(55, 15, 'https://images.unsplash.com/photo-1518244811619-c5e6b9b16a8a?q=80&w=1200&auto=format&fit=crop', 'Apple Apple Watch Series 9 (Varian 1) Image 4', 3, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(56, 16, 'https://images.unsplash.com/photo-1508685096489-7aacd43bd3b1?q=80&w=1200&auto=format&fit=crop', 'Apple AirPods Pro 2 (Varian 2) Image 1', 0, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(57, 16, 'https://images.unsplash.com/photo-1517411032315-54ef2cb783bb?q=80&w=1200&auto=format&fit=crop', 'Apple AirPods Pro 2 (Varian 2) Image 2', 1, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(58, 16, 'https://images.unsplash.com/photo-1523275335684-37898b6baf30?q=80&w=1200&auto=format&fit=crop', 'Apple AirPods Pro 2 (Varian 2) Image 3', 2, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(59, 16, 'https://images.unsplash.com/photo-1518244811619-c5e6b9b16a8a?q=80&w=1200&auto=format&fit=crop', 'Apple AirPods Pro 2 (Varian 2) Image 4', 3, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(60, 17, 'https://i.pinimg.com/1200x/27/a3/21/27a32121cea099dec843e91095247824.jpg', 'Apple Apple Watch Series 9 (Varian 3) Image 1', 0, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(61, 17, 'https://images.unsplash.com/photo-1508685096489-7aacd43bd3b1?q=80&w=1200&auto=format&fit=crop', 'Apple Apple Watch Series 9 (Varian 3) Image 2', 1, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(62, 17, 'https://images.unsplash.com/photo-1512149673953-1e251807ec39?q=80&w=1200&auto=format&fit=crop', 'Apple Apple Watch Series 9 (Varian 3) Image 3', 2, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(63, 17, 'https://images.unsplash.com/photo-1518244811619-c5e6b9b16a8a?q=80&w=1200&auto=format&fit=crop', 'Apple Apple Watch Series 9 (Varian 3) Image 4', 3, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(64, 18, 'https://images.unsplash.com/photo-1523275335684-37898b6baf30?q=80&w=1200&auto=format&fit=crop', 'Apple AirPods Pro 2 (Varian 4) Image 1', 0, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(65, 18, 'https://images.unsplash.com/photo-1512149673953-1e251807ec39?q=80&w=1200&auto=format&fit=crop', 'Apple AirPods Pro 2 (Varian 4) Image 2', 1, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(66, 18, 'https://images.unsplash.com/photo-1517411032315-54ef2cb783bb?q=80&w=1200&auto=format&fit=crop', 'Apple AirPods Pro 2 (Varian 4) Image 3', 2, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(67, 18, 'https://images.unsplash.com/photo-1518244811619-c5e6b9b16a8a?q=80&w=1200&auto=format&fit=crop', 'Apple AirPods Pro 2 (Varian 4) Image 4', 3, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(68, 19, 'https://images.unsplash.com/photo-1603921326210-6edd2d60ca68?q=80&w=1200&auto=format&fit=crop', 'Samsung Galaxy S23 (Varian 1) Image 1', 0, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(69, 19, 'https://images.unsplash.com/photo-1557180295-76eee20ae8aa?q=80&w=1200&auto=format&fit=crop', 'Samsung Galaxy S23 (Varian 1) Image 2', 1, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(70, 19, 'https://images.unsplash.com/photo-1512499617640-c2f999098c36?q=80&w=1200&auto=format&fit=crop', 'Samsung Galaxy S23 (Varian 1) Image 3', 2, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(71, 19, 'https://images.unsplash.com/photo-1616486026926-6f7b074877f8?q=80&w=1200&auto=format&fit=crop', 'Samsung Galaxy S23 (Varian 1) Image 4', 3, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(72, 20, 'https://images.unsplash.com/photo-1512499617640-c2f999098c36?q=80&w=1200&auto=format&fit=crop', 'Samsung Galaxy A54 (Varian 2) Image 1', 0, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(73, 20, 'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?q=80&w=1200&auto=format&fit=crop', 'Samsung Galaxy A54 (Varian 2) Image 2', 1, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(74, 20, 'https://images.unsplash.com/photo-1557180295-76eee20ae8aa?q=80&w=1200&auto=format&fit=crop', 'Samsung Galaxy A54 (Varian 2) Image 3', 2, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(75, 20, 'https://images.unsplash.com/photo-1616486026926-6f7b074877f8?q=80&w=1200&auto=format&fit=crop', 'Samsung Galaxy A54 (Varian 2) Image 4', 3, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(76, 21, 'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?q=80&w=1200&auto=format&fit=crop', 'Samsung Galaxy S23 (Varian 3) Image 1', 0, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(77, 21, 'https://images.unsplash.com/photo-1512499617640-c2f999098c36?q=80&w=1200&auto=format&fit=crop', 'Samsung Galaxy S23 (Varian 3) Image 2', 1, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(78, 21, 'https://images.unsplash.com/photo-1603921326210-6edd2d60ca68?q=80&w=1200&auto=format&fit=crop', 'Samsung Galaxy S23 (Varian 3) Image 3', 2, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(79, 21, 'https://images.unsplash.com/photo-1616486026926-6f7b074877f8?q=80&w=1200&auto=format&fit=crop', 'Samsung Galaxy S23 (Varian 3) Image 4', 3, '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(80, 22, 'https://images.unsplash.com/photo-1557180295-76eee20ae8aa?q=80&w=1200&auto=format&fit=crop', 'Samsung Galaxy A54 (Varian 4) Image 1', 0, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(81, 22, 'https://images.unsplash.com/photo-1603921326210-6edd2d60ca68?q=80&w=1200&auto=format&fit=crop', 'Samsung Galaxy A54 (Varian 4) Image 2', 1, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(82, 22, 'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?q=80&w=1200&auto=format&fit=crop', 'Samsung Galaxy A54 (Varian 4) Image 3', 2, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(83, 22, 'https://images.unsplash.com/photo-1616486026926-6f7b074877f8?q=80&w=1200&auto=format&fit=crop', 'Samsung Galaxy A54 (Varian 4) Image 4', 3, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(84, 23, 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?q=80&w=1200&auto=format&fit=crop', 'Samsung Galaxy Book3 (Varian 1) Image 1', 0, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(85, 23, 'https://images.unsplash.com/photo-1518770660438-4631541fd4d1?q=80&w=1200&auto=format&fit=crop', 'Samsung Galaxy Book3 (Varian 1) Image 2', 1, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(86, 23, 'https://images.unsplash.com/photo-1515879218367-8466d910aaa4?q=80&w=1200&auto=format&fit=crop', 'Samsung Galaxy Book3 (Varian 1) Image 3', 2, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(87, 23, 'https://images.unsplash.com/photo-1486312338219-ce68d2c6f44d?q=80&w=1200&auto=format&fit=crop', 'Samsung Galaxy Book3 (Varian 1) Image 4', 3, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(88, 24, 'https://images.unsplash.com/photo-1515879218367-8466d910aaa4?q=80&w=1200&auto=format&fit=crop', 'Samsung Galaxy Book3 (Varian 2) Image 1', 0, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(89, 24, 'https://images.unsplash.com/photo-1519389950473-47ba0277781c?q=80&w=1200&auto=format&fit=crop', 'Samsung Galaxy Book3 (Varian 2) Image 2', 1, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(90, 24, 'https://images.unsplash.com/photo-1518770660438-4631541fd4d1?q=80&w=1200&auto=format&fit=crop', 'Samsung Galaxy Book3 (Varian 2) Image 3', 2, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(91, 24, 'https://images.unsplash.com/photo-1486312338219-ce68d2c6f44d?q=80&w=1200&auto=format&fit=crop', 'Samsung Galaxy Book3 (Varian 2) Image 4', 3, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(92, 25, 'https://images.unsplash.com/photo-1519389950473-47ba0277781c?q=80&w=1200&auto=format&fit=crop', 'Samsung Galaxy Book3 (Varian 3) Image 1', 0, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(93, 25, 'https://images.unsplash.com/photo-1515879218367-8466d910aaa4?q=80&w=1200&auto=format&fit=crop', 'Samsung Galaxy Book3 (Varian 3) Image 2', 1, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(94, 25, 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?q=80&w=1200&auto=format&fit=crop', 'Samsung Galaxy Book3 (Varian 3) Image 3', 2, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(95, 25, 'https://images.unsplash.com/photo-1486312338219-ce68d2c6f44d?q=80&w=1200&auto=format&fit=crop', 'Samsung Galaxy Book3 (Varian 3) Image 4', 3, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(96, 26, 'https://i.pinimg.com/1200x/1c/d8/57/1cd8571d7df0d83babd6a6a4323fc33d.jpg', 'Samsung Galaxy Book3 (Varian 4) Image 1', 0, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(97, 26, 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?q=80&w=1200&auto=format&fit=crop', 'Samsung Galaxy Book3 (Varian 4) Image 2', 1, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(98, 26, 'https://images.unsplash.com/photo-1519389950473-47ba0277781c?q=80&w=1200&auto=format&fit=crop', 'Samsung Galaxy Book3 (Varian 4) Image 3', 2, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(99, 26, 'https://images.unsplash.com/photo-1486312338219-ce68d2c6f44d?q=80&w=1200&auto=format&fit=crop', 'Samsung Galaxy Book3 (Varian 4) Image 4', 3, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(100, 27, 'https://images.unsplash.com/photo-1529333166437-7750a6dd5a70?q=80&w=1200&auto=format&fit=crop', 'Samsung Galaxy Tab S9 (Varian 1) Image 1', 0, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(101, 27, 'https://images.unsplash.com/photo-1587825140400-224e3a3ad0d2?q=80&w=1200&auto=format&fit=crop', 'Samsung Galaxy Tab S9 (Varian 1) Image 2', 1, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(102, 27, 'https://images.unsplash.com/photo-1601933470923-c6f2040aa6d3?q=80&w=1200&auto=format&fit=crop', 'Samsung Galaxy Tab S9 (Varian 1) Image 3', 2, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(103, 27, 'https://images.unsplash.com/photo-1516979187457-637abb4f9353?q=80&w=1200&auto=format&fit=crop', 'Samsung Galaxy Tab S9 (Varian 1) Image 4', 3, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(104, 28, 'https://images.unsplash.com/photo-1601933470923-c6f2040aa6d3?q=80&w=1200&auto=format&fit=crop', 'Samsung Galaxy Tab A9 (Varian 2) Image 1', 0, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(105, 28, 'https://images.unsplash.com/photo-1517694712202-14dd9538aa97?q=80&w=1200&auto=format&fit=crop', 'Samsung Galaxy Tab A9 (Varian 2) Image 2', 1, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(106, 28, 'https://images.unsplash.com/photo-1587825140400-224e3a3ad0d2?q=80&w=1200&auto=format&fit=crop', 'Samsung Galaxy Tab A9 (Varian 2) Image 3', 2, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(107, 28, 'https://images.unsplash.com/photo-1516979187457-637abb4f9353?q=80&w=1200&auto=format&fit=crop', 'Samsung Galaxy Tab A9 (Varian 2) Image 4', 3, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(108, 29, 'https://images.unsplash.com/photo-1517694712202-14dd9538aa97?q=80&w=1200&auto=format&fit=crop', 'Samsung Galaxy Tab S9 (Varian 3) Image 1', 0, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(109, 29, 'https://images.unsplash.com/photo-1601933470923-c6f2040aa6d3?q=80&w=1200&auto=format&fit=crop', 'Samsung Galaxy Tab S9 (Varian 3) Image 2', 1, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(110, 29, 'https://images.unsplash.com/photo-1529333166437-7750a6dd5a70?q=80&w=1200&auto=format&fit=crop', 'Samsung Galaxy Tab S9 (Varian 3) Image 3', 2, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(111, 29, 'https://images.unsplash.com/photo-1516979187457-637abb4f9353?q=80&w=1200&auto=format&fit=crop', 'Samsung Galaxy Tab S9 (Varian 3) Image 4', 3, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(112, 30, 'https://images.unsplash.com/photo-1587825140400-224e3a3ad0d2?q=80&w=1200&auto=format&fit=crop', 'Samsung Galaxy Tab A9 (Varian 4) Image 1', 0, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(113, 30, 'https://images.unsplash.com/photo-1529333166437-7750a6dd5a70?q=80&w=1200&auto=format&fit=crop', 'Samsung Galaxy Tab A9 (Varian 4) Image 2', 1, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(114, 30, 'https://images.unsplash.com/photo-1517694712202-14dd9538aa97?q=80&w=1200&auto=format&fit=crop', 'Samsung Galaxy Tab A9 (Varian 4) Image 3', 2, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(115, 30, 'https://images.unsplash.com/photo-1516979187457-637abb4f9353?q=80&w=1200&auto=format&fit=crop', 'Samsung Galaxy Tab A9 (Varian 4) Image 4', 3, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(116, 31, 'https://images.unsplash.com/photo-1523275335684-37898b6baf30?q=80&w=1200&auto=format&fit=crop', 'Samsung Galaxy Watch6 (Varian 1) Image 1', 0, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(117, 31, 'https://images.unsplash.com/photo-1508685096489-7aacd43bd3b1?q=80&w=1200&auto=format&fit=crop', 'Samsung Galaxy Watch6 (Varian 1) Image 2', 1, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(118, 31, 'https://images.unsplash.com/photo-1518244811619-c5e6b9b16a8a?q=80&w=1200&auto=format&fit=crop', 'Samsung Galaxy Watch6 (Varian 1) Image 3', 2, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(119, 31, 'https://images.unsplash.com/photo-1517411032315-54ef2cb783bb?q=80&w=1200&auto=format&fit=crop', 'Samsung Galaxy Watch6 (Varian 1) Image 4', 3, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(120, 32, 'https://images.unsplash.com/photo-1518244811619-c5e6b9b16a8a?q=80&w=1200&auto=format&fit=crop', 'Samsung Galaxy Buds2 Pro (Varian 2) Image 1', 0, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(121, 32, 'https://images.unsplash.com/photo-1512149673953-1e251807ec39?q=80&w=1200&auto=format&fit=crop', 'Samsung Galaxy Buds2 Pro (Varian 2) Image 2', 1, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(122, 32, 'https://images.unsplash.com/photo-1508685096489-7aacd43bd3b1?q=80&w=1200&auto=format&fit=crop', 'Samsung Galaxy Buds2 Pro (Varian 2) Image 3', 2, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(123, 32, 'https://images.unsplash.com/photo-1517411032315-54ef2cb783bb?q=80&w=1200&auto=format&fit=crop', 'Samsung Galaxy Buds2 Pro (Varian 2) Image 4', 3, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(124, 33, 'https://images.unsplash.com/photo-1512149673953-1e251807ec39?q=80&w=1200&auto=format&fit=crop', 'Samsung Galaxy Watch6 (Varian 3) Image 1', 0, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(125, 33, 'https://images.unsplash.com/photo-1518244811619-c5e6b9b16a8a?q=80&w=1200&auto=format&fit=crop', 'Samsung Galaxy Watch6 (Varian 3) Image 2', 1, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(126, 33, 'https://images.unsplash.com/photo-1523275335684-37898b6baf30?q=80&w=1200&auto=format&fit=crop', 'Samsung Galaxy Watch6 (Varian 3) Image 3', 2, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(127, 33, 'https://images.unsplash.com/photo-1517411032315-54ef2cb783bb?q=80&w=1200&auto=format&fit=crop', 'Samsung Galaxy Watch6 (Varian 3) Image 4', 3, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(128, 34, 'https://images.unsplash.com/photo-1508685096489-7aacd43bd3b1?q=80&w=1200&auto=format&fit=crop', 'Samsung Galaxy Buds2 Pro (Varian 4) Image 1', 0, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(129, 34, 'https://images.unsplash.com/photo-1523275335684-37898b6baf30?q=80&w=1200&auto=format&fit=crop', 'Samsung Galaxy Buds2 Pro (Varian 4) Image 2', 1, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(130, 34, 'https://images.unsplash.com/photo-1512149673953-1e251807ec39?q=80&w=1200&auto=format&fit=crop', 'Samsung Galaxy Buds2 Pro (Varian 4) Image 3', 2, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(131, 34, 'https://images.unsplash.com/photo-1517411032315-54ef2cb783bb?q=80&w=1200&auto=format&fit=crop', 'Samsung Galaxy Buds2 Pro (Varian 4) Image 4', 3, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(132, 35, 'https://images.unsplash.com/photo-1557180295-76eee20ae8aa?q=80&w=1200&auto=format&fit=crop', 'Xiaomi Redmi Note 13 (Varian 1) Image 1', 0, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(133, 35, 'https://images.unsplash.com/photo-1512499617640-c2f999098c36?q=80&w=1200&auto=format&fit=crop', 'Xiaomi Redmi Note 13 (Varian 1) Image 2', 1, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(134, 35, 'https://images.unsplash.com/photo-1616486026926-6f7b074877f8?q=80&w=1200&auto=format&fit=crop', 'Xiaomi Redmi Note 13 (Varian 1) Image 3', 2, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(135, 35, 'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?q=80&w=1200&auto=format&fit=crop', 'Xiaomi Redmi Note 13 (Varian 1) Image 4', 3, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(136, 36, 'https://images.unsplash.com/photo-1616486026926-6f7b074877f8?q=80&w=1200&auto=format&fit=crop', 'Xiaomi Xiaomi 13 (Varian 2) Image 1', 0, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(137, 36, 'https://images.unsplash.com/photo-1603921326210-6edd2d60ca68?q=80&w=1200&auto=format&fit=crop', 'Xiaomi Xiaomi 13 (Varian 2) Image 2', 1, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(138, 36, 'https://images.unsplash.com/photo-1512499617640-c2f999098c36?q=80&w=1200&auto=format&fit=crop', 'Xiaomi Xiaomi 13 (Varian 2) Image 3', 2, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(139, 36, 'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?q=80&w=1200&auto=format&fit=crop', 'Xiaomi Xiaomi 13 (Varian 2) Image 4', 3, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(140, 37, 'https://images.unsplash.com/photo-1603921326210-6edd2d60ca68?q=80&w=1200&auto=format&fit=crop', 'Xiaomi Redmi Note 13 (Varian 3) Image 1', 0, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(141, 37, 'https://images.unsplash.com/photo-1616486026926-6f7b074877f8?q=80&w=1200&auto=format&fit=crop', 'Xiaomi Redmi Note 13 (Varian 3) Image 2', 1, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(142, 37, 'https://images.unsplash.com/photo-1557180295-76eee20ae8aa?q=80&w=1200&auto=format&fit=crop', 'Xiaomi Redmi Note 13 (Varian 3) Image 3', 2, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(143, 37, 'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?q=80&w=1200&auto=format&fit=crop', 'Xiaomi Redmi Note 13 (Varian 3) Image 4', 3, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(144, 38, 'https://images.unsplash.com/photo-1512499617640-c2f999098c36?q=80&w=1200&auto=format&fit=crop', 'Xiaomi Xiaomi 13 (Varian 4) Image 1', 0, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(145, 38, 'https://images.unsplash.com/photo-1557180295-76eee20ae8aa?q=80&w=1200&auto=format&fit=crop', 'Xiaomi Xiaomi 13 (Varian 4) Image 2', 1, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(146, 38, 'https://images.unsplash.com/photo-1603921326210-6edd2d60ca68?q=80&w=1200&auto=format&fit=crop', 'Xiaomi Xiaomi 13 (Varian 4) Image 3', 2, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(147, 38, 'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?q=80&w=1200&auto=format&fit=crop', 'Xiaomi Xiaomi 13 (Varian 4) Image 4', 3, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(148, 39, 'https://images.unsplash.com/photo-1518770660438-4631541fd4d1?q=80&w=1200&auto=format&fit=crop', 'Xiaomi Mi Notebook Pro (Varian 1) Image 1', 0, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(149, 39, 'https://images.unsplash.com/photo-1515879218367-8466d910aaa4?q=80&w=1200&auto=format&fit=crop', 'Xiaomi Mi Notebook Pro (Varian 1) Image 2', 1, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(150, 39, 'https://images.unsplash.com/photo-1486312338219-ce68d2c6f44d?q=80&w=1200&auto=format&fit=crop', 'Xiaomi Mi Notebook Pro (Varian 1) Image 3', 2, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(151, 39, 'https://images.unsplash.com/photo-1519389950473-47ba0277781c?q=80&w=1200&auto=format&fit=crop', 'Xiaomi Mi Notebook Pro (Varian 1) Image 4', 3, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(152, 40, 'https://images.unsplash.com/photo-1486312338219-ce68d2c6f44d?q=80&w=1200&auto=format&fit=crop', 'Xiaomi Mi Notebook Pro (Varian 2) Image 1', 0, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(153, 40, 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?q=80&w=1200&auto=format&fit=crop', 'Xiaomi Mi Notebook Pro (Varian 2) Image 2', 1, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(154, 40, 'https://images.unsplash.com/photo-1515879218367-8466d910aaa4?q=80&w=1200&auto=format&fit=crop', 'Xiaomi Mi Notebook Pro (Varian 2) Image 3', 2, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(155, 40, 'https://images.unsplash.com/photo-1519389950473-47ba0277781c?q=80&w=1200&auto=format&fit=crop', 'Xiaomi Mi Notebook Pro (Varian 2) Image 4', 3, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(156, 41, 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?q=80&w=1200&auto=format&fit=crop', 'Xiaomi Mi Notebook Pro (Varian 3) Image 1', 0, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(157, 41, 'https://images.unsplash.com/photo-1486312338219-ce68d2c6f44d?q=80&w=1200&auto=format&fit=crop', 'Xiaomi Mi Notebook Pro (Varian 3) Image 2', 1, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(158, 41, 'https://images.unsplash.com/photo-1518770660438-4631541fd4d1?q=80&w=1200&auto=format&fit=crop', 'Xiaomi Mi Notebook Pro (Varian 3) Image 3', 2, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(159, 41, 'https://images.unsplash.com/photo-1519389950473-47ba0277781c?q=80&w=1200&auto=format&fit=crop', 'Xiaomi Mi Notebook Pro (Varian 3) Image 4', 3, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(160, 42, 'https://images.unsplash.com/photo-1515879218367-8466d910aaa4?q=80&w=1200&auto=format&fit=crop', 'Xiaomi Mi Notebook Pro (Varian 4) Image 1', 0, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(161, 42, 'https://images.unsplash.com/photo-1518770660438-4631541fd4d1?q=80&w=1200&auto=format&fit=crop', 'Xiaomi Mi Notebook Pro (Varian 4) Image 2', 1, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(162, 42, 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?q=80&w=1200&auto=format&fit=crop', 'Xiaomi Mi Notebook Pro (Varian 4) Image 3', 2, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(163, 42, 'https://images.unsplash.com/photo-1519389950473-47ba0277781c?q=80&w=1200&auto=format&fit=crop', 'Xiaomi Mi Notebook Pro (Varian 4) Image 4', 3, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(164, 43, 'https://i.pinimg.com/1200x/9f/1d/e8/9f1de885c7b15a04a5fe255e88b37949.jpg', 'Xiaomi Mi Pad 6 (Varian 1) Image 1', 0, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(165, 43, 'https://images.unsplash.com/photo-1601933470923-c6f2040aa6d3?q=80&w=1200&auto=format&fit=crop', 'Xiaomi Mi Pad 6 (Varian 1) Image 2', 1, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(166, 43, 'https://images.unsplash.com/photo-1516979187457-637abb4f9353?q=80&w=1200&auto=format&fit=crop', 'Xiaomi Mi Pad 6 (Varian 1) Image 3', 2, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(167, 43, 'https://images.unsplash.com/photo-1517694712202-14dd9538aa97?q=80&w=1200&auto=format&fit=crop', 'Xiaomi Mi Pad 6 (Varian 1) Image 4', 3, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(168, 44, 'https://images.unsplash.com/photo-1516979187457-637abb4f9353?q=80&w=1200&auto=format&fit=crop', 'Xiaomi Mi Pad 6 (Varian 2) Image 1', 0, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(169, 44, 'https://images.unsplash.com/photo-1529333166437-7750a6dd5a70?q=80&w=1200&auto=format&fit=crop', 'Xiaomi Mi Pad 6 (Varian 2) Image 2', 1, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(170, 44, 'https://images.unsplash.com/photo-1601933470923-c6f2040aa6d3?q=80&w=1200&auto=format&fit=crop', 'Xiaomi Mi Pad 6 (Varian 2) Image 3', 2, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(171, 44, 'https://images.unsplash.com/photo-1517694712202-14dd9538aa97?q=80&w=1200&auto=format&fit=crop', 'Xiaomi Mi Pad 6 (Varian 2) Image 4', 3, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(172, 45, 'https://images.unsplash.com/photo-1529333166437-7750a6dd5a70?q=80&w=1200&auto=format&fit=crop', 'Xiaomi Mi Pad 6 (Varian 3) Image 1', 0, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(173, 45, 'https://images.unsplash.com/photo-1516979187457-637abb4f9353?q=80&w=1200&auto=format&fit=crop', 'Xiaomi Mi Pad 6 (Varian 3) Image 2', 1, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(174, 45, 'https://images.unsplash.com/photo-1587825140400-224e3a3ad0d2?q=80&w=1200&auto=format&fit=crop', 'Xiaomi Mi Pad 6 (Varian 3) Image 3', 2, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(175, 45, 'https://images.unsplash.com/photo-1517694712202-14dd9538aa97?q=80&w=1200&auto=format&fit=crop', 'Xiaomi Mi Pad 6 (Varian 3) Image 4', 3, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(176, 46, 'https://images.unsplash.com/photo-1601933470923-c6f2040aa6d3?q=80&w=1200&auto=format&fit=crop', 'Xiaomi Mi Pad 6 (Varian 4) Image 1', 0, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(177, 46, 'https://images.unsplash.com/photo-1587825140400-224e3a3ad0d2?q=80&w=1200&auto=format&fit=crop', 'Xiaomi Mi Pad 6 (Varian 4) Image 2', 1, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(178, 46, 'https://images.unsplash.com/photo-1529333166437-7750a6dd5a70?q=80&w=1200&auto=format&fit=crop', 'Xiaomi Mi Pad 6 (Varian 4) Image 3', 2, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(179, 46, 'https://images.unsplash.com/photo-1517694712202-14dd9538aa97?q=80&w=1200&auto=format&fit=crop', 'Xiaomi Mi Pad 6 (Varian 4) Image 4', 3, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(180, 47, 'https://images.unsplash.com/photo-1508685096489-7aacd43bd3b1?q=80&w=1200&auto=format&fit=crop', 'Xiaomi Mi Band 8 (Varian 1) Image 1', 0, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(181, 47, 'https://images.unsplash.com/photo-1518244811619-c5e6b9b16a8a?q=80&w=1200&auto=format&fit=crop', 'Xiaomi Mi Band 8 (Varian 1) Image 2', 1, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(182, 47, 'https://images.unsplash.com/photo-1517411032315-54ef2cb783bb?q=80&w=1200&auto=format&fit=crop', 'Xiaomi Mi Band 8 (Varian 1) Image 3', 2, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(183, 47, 'https://images.unsplash.com/photo-1512149673953-1e251807ec39?q=80&w=1200&auto=format&fit=crop', 'Xiaomi Mi Band 8 (Varian 1) Image 4', 3, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(184, 48, 'https://images.unsplash.com/photo-1517411032315-54ef2cb783bb?q=80&w=1200&auto=format&fit=crop', 'Xiaomi Mi Band 8 (Varian 2) Image 1', 0, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(185, 48, 'https://images.unsplash.com/photo-1523275335684-37898b6baf30?q=80&w=1200&auto=format&fit=crop', 'Xiaomi Mi Band 8 (Varian 2) Image 2', 1, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(186, 48, 'https://images.unsplash.com/photo-1518244811619-c5e6b9b16a8a?q=80&w=1200&auto=format&fit=crop', 'Xiaomi Mi Band 8 (Varian 2) Image 3', 2, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(187, 48, 'https://images.unsplash.com/photo-1512149673953-1e251807ec39?q=80&w=1200&auto=format&fit=crop', 'Xiaomi Mi Band 8 (Varian 2) Image 4', 3, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(188, 49, 'https://images.unsplash.com/photo-1523275335684-37898b6baf30?q=80&w=1200&auto=format&fit=crop', 'Xiaomi Mi Band 8 (Varian 3) Image 1', 0, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(189, 49, 'https://images.unsplash.com/photo-1517411032315-54ef2cb783bb?q=80&w=1200&auto=format&fit=crop', 'Xiaomi Mi Band 8 (Varian 3) Image 2', 1, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(190, 49, 'https://images.unsplash.com/photo-1508685096489-7aacd43bd3b1?q=80&w=1200&auto=format&fit=crop', 'Xiaomi Mi Band 8 (Varian 3) Image 3', 2, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(191, 49, 'https://images.unsplash.com/photo-1512149673953-1e251807ec39?q=80&w=1200&auto=format&fit=crop', 'Xiaomi Mi Band 8 (Varian 3) Image 4', 3, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(192, 50, 'https://images.unsplash.com/photo-1518244811619-c5e6b9b16a8a?q=80&w=1200&auto=format&fit=crop', 'Xiaomi Mi Band 8 (Varian 4) Image 1', 0, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(193, 50, 'https://images.unsplash.com/photo-1508685096489-7aacd43bd3b1?q=80&w=1200&auto=format&fit=crop', 'Xiaomi Mi Band 8 (Varian 4) Image 2', 1, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(194, 50, 'https://images.unsplash.com/photo-1523275335684-37898b6baf30?q=80&w=1200&auto=format&fit=crop', 'Xiaomi Mi Band 8 (Varian 4) Image 3', 2, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(195, 50, 'https://images.unsplash.com/photo-1512149673953-1e251807ec39?q=80&w=1200&auto=format&fit=crop', 'Xiaomi Mi Band 8 (Varian 4) Image 4', 3, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(196, 51, 'https://images.unsplash.com/photo-1512499617640-c2f999098c36?q=80&w=1200&auto=format&fit=crop', 'Sony Xperia 5 V (Varian 1) Image 1', 0, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(197, 51, 'https://images.unsplash.com/photo-1616486026926-6f7b074877f8?q=80&w=1200&auto=format&fit=crop', 'Sony Xperia 5 V (Varian 1) Image 2', 1, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(198, 51, 'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?q=80&w=1200&auto=format&fit=crop', 'Sony Xperia 5 V (Varian 1) Image 3', 2, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(199, 51, 'https://images.unsplash.com/photo-1603921326210-6edd2d60ca68?q=80&w=1200&auto=format&fit=crop', 'Sony Xperia 5 V (Varian 1) Image 4', 3, '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(200, 52, 'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?q=80&w=1200&auto=format&fit=crop', 'Sony Xperia 5 V (Varian 2) Image 1', 0, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(201, 52, 'https://images.unsplash.com/photo-1557180295-76eee20ae8aa?q=80&w=1200&auto=format&fit=crop', 'Sony Xperia 5 V (Varian 2) Image 2', 1, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(202, 52, 'https://images.unsplash.com/photo-1616486026926-6f7b074877f8?q=80&w=1200&auto=format&fit=crop', 'Sony Xperia 5 V (Varian 2) Image 3', 2, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(203, 52, 'https://images.unsplash.com/photo-1603921326210-6edd2d60ca68?q=80&w=1200&auto=format&fit=crop', 'Sony Xperia 5 V (Varian 2) Image 4', 3, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(204, 53, 'https://images.unsplash.com/photo-1557180295-76eee20ae8aa?q=80&w=1200&auto=format&fit=crop', 'Sony Xperia 5 V (Varian 3) Image 1', 0, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(205, 53, 'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?q=80&w=1200&auto=format&fit=crop', 'Sony Xperia 5 V (Varian 3) Image 2', 1, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(206, 53, 'https://images.unsplash.com/photo-1512499617640-c2f999098c36?q=80&w=1200&auto=format&fit=crop', 'Sony Xperia 5 V (Varian 3) Image 3', 2, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(207, 53, 'https://images.unsplash.com/photo-1603921326210-6edd2d60ca68?q=80&w=1200&auto=format&fit=crop', 'Sony Xperia 5 V (Varian 3) Image 4', 3, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(208, 54, 'https://images.unsplash.com/photo-1616486026926-6f7b074877f8?q=80&w=1200&auto=format&fit=crop', 'Sony Xperia 5 V (Varian 4) Image 1', 0, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(209, 54, 'https://images.unsplash.com/photo-1512499617640-c2f999098c36?q=80&w=1200&auto=format&fit=crop', 'Sony Xperia 5 V (Varian 4) Image 2', 1, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(210, 54, 'https://images.unsplash.com/photo-1557180295-76eee20ae8aa?q=80&w=1200&auto=format&fit=crop', 'Sony Xperia 5 V (Varian 4) Image 3', 2, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(211, 54, 'https://images.unsplash.com/photo-1603921326210-6edd2d60ca68?q=80&w=1200&auto=format&fit=crop', 'Sony Xperia 5 V (Varian 4) Image 4', 3, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(212, 55, 'https://images.unsplash.com/photo-1515879218367-8466d910aaa4?q=80&w=1200&auto=format&fit=crop', 'Sony VAIO Z (Varian 1) Image 1', 0, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(213, 55, 'https://images.unsplash.com/photo-1486312338219-ce68d2c6f44d?q=80&w=1200&auto=format&fit=crop', 'Sony VAIO Z (Varian 1) Image 2', 1, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(214, 55, 'https://images.unsplash.com/photo-1519389950473-47ba0277781c?q=80&w=1200&auto=format&fit=crop', 'Sony VAIO Z (Varian 1) Image 3', 2, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(215, 55, 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?q=80&w=1200&auto=format&fit=crop', 'Sony VAIO Z (Varian 1) Image 4', 3, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(216, 56, 'https://images.unsplash.com/photo-1519389950473-47ba0277781c?q=80&w=1200&auto=format&fit=crop', 'Sony VAIO Z (Varian 2) Image 1', 0, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(217, 56, 'https://images.unsplash.com/photo-1518770660438-4631541fd4d1?q=80&w=1200&auto=format&fit=crop', 'Sony VAIO Z (Varian 2) Image 2', 1, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(218, 56, 'https://images.unsplash.com/photo-1486312338219-ce68d2c6f44d?q=80&w=1200&auto=format&fit=crop', 'Sony VAIO Z (Varian 2) Image 3', 2, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(219, 56, 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?q=80&w=1200&auto=format&fit=crop', 'Sony VAIO Z (Varian 2) Image 4', 3, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(220, 57, 'https://images.unsplash.com/photo-1518770660438-4631541fd4d1?q=80&w=1200&auto=format&fit=crop', 'Sony VAIO Z (Varian 3) Image 1', 0, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(221, 57, 'https://images.unsplash.com/photo-1519389950473-47ba0277781c?q=80&w=1200&auto=format&fit=crop', 'Sony VAIO Z (Varian 3) Image 2', 1, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(222, 57, 'https://images.unsplash.com/photo-1515879218367-8466d910aaa4?q=80&w=1200&auto=format&fit=crop', 'Sony VAIO Z (Varian 3) Image 3', 2, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(223, 57, 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?q=80&w=1200&auto=format&fit=crop', 'Sony VAIO Z (Varian 3) Image 4', 3, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(224, 58, 'https://images.unsplash.com/photo-1486312338219-ce68d2c6f44d?q=80&w=1200&auto=format&fit=crop', 'Sony VAIO Z (Varian 4) Image 1', 0, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(225, 58, 'https://images.unsplash.com/photo-1515879218367-8466d910aaa4?q=80&w=1200&auto=format&fit=crop', 'Sony VAIO Z (Varian 4) Image 2', 1, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(226, 58, 'https://images.unsplash.com/photo-1518770660438-4631541fd4d1?q=80&w=1200&auto=format&fit=crop', 'Sony VAIO Z (Varian 4) Image 3', 2, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(227, 58, 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?q=80&w=1200&auto=format&fit=crop', 'Sony VAIO Z (Varian 4) Image 4', 3, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(228, 59, 'https://images.unsplash.com/photo-1601933470923-c6f2040aa6d3?q=80&w=1200&auto=format&fit=crop', 'Sony Xperia Tablet Z4 (Varian 1) Image 1', 0, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(229, 59, 'https://images.unsplash.com/photo-1516979187457-637abb4f9353?q=80&w=1200&auto=format&fit=crop', 'Sony Xperia Tablet Z4 (Varian 1) Image 2', 1, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(230, 59, 'https://images.unsplash.com/photo-1517694712202-14dd9538aa97?q=80&w=1200&auto=format&fit=crop', 'Sony Xperia Tablet Z4 (Varian 1) Image 3', 2, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(231, 59, 'https://images.unsplash.com/photo-1529333166437-7750a6dd5a70?q=80&w=1200&auto=format&fit=crop', 'Sony Xperia Tablet Z4 (Varian 1) Image 4', 3, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(232, 60, 'https://images.unsplash.com/photo-1517694712202-14dd9538aa97?q=80&w=1200&auto=format&fit=crop', 'Sony Xperia Tablet Z4 (Varian 2) Image 1', 0, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(233, 60, 'https://images.unsplash.com/photo-1587825140400-224e3a3ad0d2?q=80&w=1200&auto=format&fit=crop', 'Sony Xperia Tablet Z4 (Varian 2) Image 2', 1, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(234, 60, 'https://images.unsplash.com/photo-1516979187457-637abb4f9353?q=80&w=1200&auto=format&fit=crop', 'Sony Xperia Tablet Z4 (Varian 2) Image 3', 2, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(235, 60, 'https://images.unsplash.com/photo-1529333166437-7750a6dd5a70?q=80&w=1200&auto=format&fit=crop', 'Sony Xperia Tablet Z4 (Varian 2) Image 4', 3, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(236, 61, 'https://images.unsplash.com/photo-1587825140400-224e3a3ad0d2?q=80&w=1200&auto=format&fit=crop', 'Sony Xperia Tablet Z4 (Varian 3) Image 1', 0, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(237, 61, 'https://images.unsplash.com/photo-1517694712202-14dd9538aa97?q=80&w=1200&auto=format&fit=crop', 'Sony Xperia Tablet Z4 (Varian 3) Image 2', 1, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(238, 61, 'https://images.unsplash.com/photo-1601933470923-c6f2040aa6d3?q=80&w=1200&auto=format&fit=crop', 'Sony Xperia Tablet Z4 (Varian 3) Image 3', 2, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(239, 61, 'https://images.unsplash.com/photo-1529333166437-7750a6dd5a70?q=80&w=1200&auto=format&fit=crop', 'Sony Xperia Tablet Z4 (Varian 3) Image 4', 3, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(240, 62, 'https://images.unsplash.com/photo-1516979187457-637abb4f9353?q=80&w=1200&auto=format&fit=crop', 'Sony Xperia Tablet Z4 (Varian 4) Image 1', 0, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(241, 62, 'https://images.unsplash.com/photo-1601933470923-c6f2040aa6d3?q=80&w=1200&auto=format&fit=crop', 'Sony Xperia Tablet Z4 (Varian 4) Image 2', 1, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(242, 62, 'https://images.unsplash.com/photo-1587825140400-224e3a3ad0d2?q=80&w=1200&auto=format&fit=crop', 'Sony Xperia Tablet Z4 (Varian 4) Image 3', 2, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(243, 62, 'https://images.unsplash.com/photo-1529333166437-7750a6dd5a70?q=80&w=1200&auto=format&fit=crop', 'Sony Xperia Tablet Z4 (Varian 4) Image 4', 3, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(244, 63, 'https://images.unsplash.com/photo-1518244811619-c5e6b9b16a8a?q=80&w=1200&auto=format&fit=crop', 'Sony WH-1000XM5 (Varian 1) Image 1', 0, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(245, 63, 'https://images.unsplash.com/photo-1517411032315-54ef2cb783bb?q=80&w=1200&auto=format&fit=crop', 'Sony WH-1000XM5 (Varian 1) Image 2', 1, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(246, 63, 'https://images.unsplash.com/photo-1512149673953-1e251807ec39?q=80&w=1200&auto=format&fit=crop', 'Sony WH-1000XM5 (Varian 1) Image 3', 2, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(247, 63, 'https://images.unsplash.com/photo-1523275335684-37898b6baf30?q=80&w=1200&auto=format&fit=crop', 'Sony WH-1000XM5 (Varian 1) Image 4', 3, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(248, 64, 'https://images.unsplash.com/photo-1512149673953-1e251807ec39?q=80&w=1200&auto=format&fit=crop', 'Sony WF-1000XM5 (Varian 2) Image 1', 0, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(249, 64, 'https://images.unsplash.com/photo-1508685096489-7aacd43bd3b1?q=80&w=1200&auto=format&fit=crop', 'Sony WF-1000XM5 (Varian 2) Image 2', 1, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(250, 64, 'https://images.unsplash.com/photo-1517411032315-54ef2cb783bb?q=80&w=1200&auto=format&fit=crop', 'Sony WF-1000XM5 (Varian 2) Image 3', 2, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(251, 64, 'https://images.unsplash.com/photo-1523275335684-37898b6baf30?q=80&w=1200&auto=format&fit=crop', 'Sony WF-1000XM5 (Varian 2) Image 4', 3, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(252, 65, 'https://images.unsplash.com/photo-1508685096489-7aacd43bd3b1?q=80&w=1200&auto=format&fit=crop', 'Sony WH-1000XM5 (Varian 3) Image 1', 0, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(253, 65, 'https://images.unsplash.com/photo-1512149673953-1e251807ec39?q=80&w=1200&auto=format&fit=crop', 'Sony WH-1000XM5 (Varian 3) Image 2', 1, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(254, 65, 'https://images.unsplash.com/photo-1518244811619-c5e6b9b16a8a?q=80&w=1200&auto=format&fit=crop', 'Sony WH-1000XM5 (Varian 3) Image 3', 2, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(255, 65, 'https://images.unsplash.com/photo-1523275335684-37898b6baf30?q=80&w=1200&auto=format&fit=crop', 'Sony WH-1000XM5 (Varian 3) Image 4', 3, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(256, 66, 'https://images.unsplash.com/photo-1517411032315-54ef2cb783bb?q=80&w=1200&auto=format&fit=crop', 'Sony WF-1000XM5 (Varian 4) Image 1', 0, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(257, 66, 'https://images.unsplash.com/photo-1518244811619-c5e6b9b16a8a?q=80&w=1200&auto=format&fit=crop', 'Sony WF-1000XM5 (Varian 4) Image 2', 1, '2025-11-01 19:07:10', '2025-11-01 19:07:10');
INSERT INTO `gadget_images` (`id`, `gadget_id`, `path`, `caption`, `position`, `created_at`, `updated_at`) VALUES
(258, 66, 'https://images.unsplash.com/photo-1508685096489-7aacd43bd3b1?q=80&w=1200&auto=format&fit=crop', 'Sony WF-1000XM5 (Varian 4) Image 3', 2, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(259, 66, 'https://images.unsplash.com/photo-1523275335684-37898b6baf30?q=80&w=1200&auto=format&fit=crop', 'Sony WF-1000XM5 (Varian 4) Image 4', 3, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(260, 67, 'https://images.unsplash.com/photo-1616486026926-6f7b074877f8?q=80&w=1200&auto=format&fit=crop', 'Asus ROG Phone 7 (Varian 1) Image 1', 0, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(261, 67, 'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?q=80&w=1200&auto=format&fit=crop', 'Asus ROG Phone 7 (Varian 1) Image 2', 1, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(262, 67, 'https://images.unsplash.com/photo-1603921326210-6edd2d60ca68?q=80&w=1200&auto=format&fit=crop', 'Asus ROG Phone 7 (Varian 1) Image 3', 2, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(263, 67, 'https://images.unsplash.com/photo-1557180295-76eee20ae8aa?q=80&w=1200&auto=format&fit=crop', 'Asus ROG Phone 7 (Varian 1) Image 4', 3, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(264, 68, 'https://images.unsplash.com/photo-1603921326210-6edd2d60ca68?q=80&w=1200&auto=format&fit=crop', 'Asus ROG Phone 7 (Varian 2) Image 1', 0, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(265, 68, 'https://images.unsplash.com/photo-1512499617640-c2f999098c36?q=80&w=1200&auto=format&fit=crop', 'Asus ROG Phone 7 (Varian 2) Image 2', 1, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(266, 68, 'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?q=80&w=1200&auto=format&fit=crop', 'Asus ROG Phone 7 (Varian 2) Image 3', 2, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(267, 68, 'https://images.unsplash.com/photo-1557180295-76eee20ae8aa?q=80&w=1200&auto=format&fit=crop', 'Asus ROG Phone 7 (Varian 2) Image 4', 3, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(268, 69, 'https://images.unsplash.com/photo-1512499617640-c2f999098c36?q=80&w=1200&auto=format&fit=crop', 'Asus ROG Phone 7 (Varian 3) Image 1', 0, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(269, 69, 'https://images.unsplash.com/photo-1603921326210-6edd2d60ca68?q=80&w=1200&auto=format&fit=crop', 'Asus ROG Phone 7 (Varian 3) Image 2', 1, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(270, 69, 'https://images.unsplash.com/photo-1616486026926-6f7b074877f8?q=80&w=1200&auto=format&fit=crop', 'Asus ROG Phone 7 (Varian 3) Image 3', 2, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(271, 69, 'https://images.unsplash.com/photo-1557180295-76eee20ae8aa?q=80&w=1200&auto=format&fit=crop', 'Asus ROG Phone 7 (Varian 3) Image 4', 3, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(272, 70, 'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?q=80&w=1200&auto=format&fit=crop', 'Asus ROG Phone 7 (Varian 4) Image 1', 0, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(273, 70, 'https://images.unsplash.com/photo-1616486026926-6f7b074877f8?q=80&w=1200&auto=format&fit=crop', 'Asus ROG Phone 7 (Varian 4) Image 2', 1, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(274, 70, 'https://images.unsplash.com/photo-1512499617640-c2f999098c36?q=80&w=1200&auto=format&fit=crop', 'Asus ROG Phone 7 (Varian 4) Image 3', 2, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(275, 70, 'https://images.unsplash.com/photo-1557180295-76eee20ae8aa?q=80&w=1200&auto=format&fit=crop', 'Asus ROG Phone 7 (Varian 4) Image 4', 3, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(276, 71, 'https://images.unsplash.com/photo-1486312338219-ce68d2c6f44d?q=80&w=1200&auto=format&fit=crop', 'Asus ROG Zephyrus G14 (Varian 1) Image 1', 0, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(277, 71, 'https://images.unsplash.com/photo-1519389950473-47ba0277781c?q=80&w=1200&auto=format&fit=crop', 'Asus ROG Zephyrus G14 (Varian 1) Image 2', 1, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(278, 71, 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?q=80&w=1200&auto=format&fit=crop', 'Asus ROG Zephyrus G14 (Varian 1) Image 3', 2, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(279, 71, 'https://images.unsplash.com/photo-1518770660438-4631541fd4d1?q=80&w=1200&auto=format&fit=crop', 'Asus ROG Zephyrus G14 (Varian 1) Image 4', 3, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(280, 72, 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?q=80&w=1200&auto=format&fit=crop', 'Asus ZenBook 14 (Varian 2) Image 1', 0, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(281, 72, 'https://images.unsplash.com/photo-1515879218367-8466d910aaa4?q=80&w=1200&auto=format&fit=crop', 'Asus ZenBook 14 (Varian 2) Image 2', 1, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(282, 72, 'https://images.unsplash.com/photo-1519389950473-47ba0277781c?q=80&w=1200&auto=format&fit=crop', 'Asus ZenBook 14 (Varian 2) Image 3', 2, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(283, 72, 'https://images.unsplash.com/photo-1518770660438-4631541fd4d1?q=80&w=1200&auto=format&fit=crop', 'Asus ZenBook 14 (Varian 2) Image 4', 3, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(284, 73, 'https://images.unsplash.com/photo-1515879218367-8466d910aaa4?q=80&w=1200&auto=format&fit=crop', 'Asus ROG Zephyrus G14 (Varian 3) Image 1', 0, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(285, 73, 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?q=80&w=1200&auto=format&fit=crop', 'Asus ROG Zephyrus G14 (Varian 3) Image 2', 1, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(286, 73, 'https://images.unsplash.com/photo-1486312338219-ce68d2c6f44d?q=80&w=1200&auto=format&fit=crop', 'Asus ROG Zephyrus G14 (Varian 3) Image 3', 2, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(287, 73, 'https://images.unsplash.com/photo-1518770660438-4631541fd4d1?q=80&w=1200&auto=format&fit=crop', 'Asus ROG Zephyrus G14 (Varian 3) Image 4', 3, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(288, 74, 'https://images.unsplash.com/photo-1519389950473-47ba0277781c?q=80&w=1200&auto=format&fit=crop', 'Asus ZenBook 14 (Varian 4) Image 1', 0, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(289, 74, 'https://images.unsplash.com/photo-1486312338219-ce68d2c6f44d?q=80&w=1200&auto=format&fit=crop', 'Asus ZenBook 14 (Varian 4) Image 2', 1, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(290, 74, 'https://images.unsplash.com/photo-1515879218367-8466d910aaa4?q=80&w=1200&auto=format&fit=crop', 'Asus ZenBook 14 (Varian 4) Image 3', 2, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(291, 74, 'https://images.unsplash.com/photo-1518770660438-4631541fd4d1?q=80&w=1200&auto=format&fit=crop', 'Asus ZenBook 14 (Varian 4) Image 4', 3, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(292, 75, 'https://i.pinimg.com/736x/66/5e/65/665e654e20f89d317509839623a9eb9c.jpg', 'Asus ASUS ZenPad 3S 10 (Varian 1) Image 1', 0, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(293, 75, 'https://images.unsplash.com/photo-1517694712202-14dd9538aa97?q=80&w=1200&auto=format&fit=crop', 'Asus ASUS ZenPad 3S 10 (Varian 1) Image 2', 1, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(294, 75, 'https://images.unsplash.com/photo-1529333166437-7750a6dd5a70?q=80&w=1200&auto=format&fit=crop', 'Asus ASUS ZenPad 3S 10 (Varian 1) Image 3', 2, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(295, 75, 'https://images.unsplash.com/photo-1587825140400-224e3a3ad0d2?q=80&w=1200&auto=format&fit=crop', 'Asus ASUS ZenPad 3S 10 (Varian 1) Image 4', 3, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(296, 76, 'https://i.pinimg.com/736x/34/ee/b9/34eeb9f738aae669c1a7006e7f3fc0d8.jpg', 'Asus ASUS ZenPad 3S 10 (Varian 2) Image 1', 0, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(297, 76, 'https://images.unsplash.com/photo-1601933470923-c6f2040aa6d3?q=80&w=1200&auto=format&fit=crop', 'Asus ASUS ZenPad 3S 10 (Varian 2) Image 2', 1, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(298, 76, 'https://images.unsplash.com/photo-1517694712202-14dd9538aa97?q=80&w=1200&auto=format&fit=crop', 'Asus ASUS ZenPad 3S 10 (Varian 2) Image 3', 2, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(299, 76, 'https://images.unsplash.com/photo-1587825140400-224e3a3ad0d2?q=80&w=1200&auto=format&fit=crop', 'Asus ASUS ZenPad 3S 10 (Varian 2) Image 4', 3, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(300, 77, 'https://i.pinimg.com/736x/5b/59/0c/5b590c7a47ac1cd2b4a72448fe96da65.jpg', 'Asus ASUS ZenPad 3S 10 (Varian 3) Image 1', 0, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(301, 77, 'https://images.unsplash.com/photo-1529333166437-7750a6dd5a70?q=80&w=1200&auto=format&fit=crop', 'Asus ASUS ZenPad 3S 10 (Varian 3) Image 2', 1, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(302, 77, 'https://images.unsplash.com/photo-1516979187457-637abb4f9353?q=80&w=1200&auto=format&fit=crop', 'Asus ASUS ZenPad 3S 10 (Varian 3) Image 3', 2, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(303, 77, 'https://images.unsplash.com/photo-1587825140400-224e3a3ad0d2?q=80&w=1200&auto=format&fit=crop', 'Asus ASUS ZenPad 3S 10 (Varian 3) Image 4', 3, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(304, 78, 'https://i.pinimg.com/736x/51/79/46/5179461fb6301e0ba345e247ee8977d5.jpg', 'Asus ASUS ZenPad 3S 10 (Varian 4) Image 1', 0, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(305, 78, 'https://images.unsplash.com/photo-1516979187457-637abb4f9353?q=80&w=1200&auto=format&fit=crop', 'Asus ASUS ZenPad 3S 10 (Varian 4) Image 2', 1, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(306, 78, 'https://images.unsplash.com/photo-1601933470923-c6f2040aa6d3?q=80&w=1200&auto=format&fit=crop', 'Asus ASUS ZenPad 3S 10 (Varian 4) Image 3', 2, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(307, 78, 'https://images.unsplash.com/photo-1587825140400-224e3a3ad0d2?q=80&w=1200&auto=format&fit=crop', 'Asus ASUS ZenPad 3S 10 (Varian 4) Image 4', 3, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(308, 79, 'https://i.pinimg.com/1200x/79/cc/65/79cc6519680f9117b79258a33a9b7212.jpg', 'Asus ASUS VivoWatch 5 (Varian 1) Image 1', 0, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(309, 79, 'https://images.unsplash.com/photo-1512149673953-1e251807ec39?q=80&w=1200&auto=format&fit=crop', 'Asus ASUS VivoWatch 5 (Varian 1) Image 2', 1, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(310, 79, 'https://images.unsplash.com/photo-1523275335684-37898b6baf30?q=80&w=1200&auto=format&fit=crop', 'Asus ASUS VivoWatch 5 (Varian 1) Image 3', 2, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(311, 79, 'https://images.unsplash.com/photo-1508685096489-7aacd43bd3b1?q=80&w=1200&auto=format&fit=crop', 'Asus ASUS VivoWatch 5 (Varian 1) Image 4', 3, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(312, 80, 'https://i.pinimg.com/736x/e3/ef/f1/e3eff11cc0b8142617517cfe8f648f0e.jpg', 'Asus ASUS VivoWatch 5 (Varian 2) Image 1', 0, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(313, 80, 'https://images.unsplash.com/photo-1518244811619-c5e6b9b16a8a?q=80&w=1200&auto=format&fit=crop', 'Asus ASUS VivoWatch 5 (Varian 2) Image 2', 1, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(314, 80, 'https://images.unsplash.com/photo-1512149673953-1e251807ec39?q=80&w=1200&auto=format&fit=crop', 'Asus ASUS VivoWatch 5 (Varian 2) Image 3', 2, '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(315, 80, 'https://images.unsplash.com/photo-1508685096489-7aacd43bd3b1?q=80&w=1200&auto=format&fit=crop', 'Asus ASUS VivoWatch 5 (Varian 2) Image 4', 3, '2025-11-01 19:07:10', '2025-11-01 19:07:10');

-- --------------------------------------------------------

--
-- Table structure for table `gadget_specs`
--

CREATE TABLE `gadget_specs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `gadget_id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gadget_specs`
--

INSERT INTO `gadget_specs` (`id`, `gadget_id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 1, 'RAM', '8GB', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(2, 1, 'Storage', '256GB', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(3, 1, 'CPU', 'Apple A17 Pro', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(4, 1, 'Battery', '3274 mAh', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(5, 1, 'Display', '6.1\" OLED 120Hz', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(6, 2, 'RAM', '6GB', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(7, 2, 'Storage', '128GB', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(8, 2, 'CPU', 'Apple A16', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(9, 2, 'Battery', '3349 mAh', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(10, 2, 'Display', '6.1\" OLED 60Hz', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(11, 3, 'detail_path', 'private/gadget_details/apple-iphone-14-varian-1.md', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(12, 3, 'Chipset', 'Snapdragon 8 Gen 2', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(13, 3, 'CPU', 'Octa-core', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(14, 3, 'RAM', '7GB', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(15, 3, 'Storage', '152GB', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(16, 3, 'Camera', '50MP + 8MP (Ultra-wide)', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(17, 3, 'Battery', '3578 mAh', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(18, 3, 'Display', '6.1\" OLED 60Hz', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(19, 3, 'Connectivity', '5G, Wi‑Fi 6E, Bluetooth 5.3, NFC, USB‑C', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(20, 4, 'detail_path', 'private/gadget_details/apple-iphone-15-varian-2.md', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(21, 4, 'Chipset', 'Dimensity 9200', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(22, 4, 'CPU', 'Octa-core', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(23, 4, 'RAM', '5GB', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(24, 4, 'Storage', '177GB', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(25, 4, 'Camera', '108MP + 12MP (Ultra-wide)', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(26, 4, 'Battery', '3530 mAh', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(27, 4, 'Display', '6.7\" OLED 90Hz', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(28, 4, 'Connectivity', '5G, Wi‑Fi 6E, Bluetooth 5.3, NFC, USB‑C', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(29, 5, 'detail_path', 'private/gadget_details/apple-iphone-se-3-varian-3.md', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(30, 5, 'Chipset', 'Snapdragon 8 Gen 2', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(31, 5, 'CPU', 'Octa-core', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(32, 5, 'RAM', '8GB', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(33, 5, 'Storage', '498GB', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(34, 5, 'Camera', '64MP + 8MP (Ultra-wide)', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(35, 5, 'Battery', '5491 mAh', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(36, 5, 'Display', '6.1\" OLED 120Hz', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(37, 5, 'Connectivity', '5G, Wi‑Fi 6E, Bluetooth 5.3, NFC, USB‑C', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(38, 6, 'detail_path', 'private/gadget_details/apple-iphone-14-varian-4.md', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(39, 6, 'Chipset', 'Dimensity 9200', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(40, 6, 'CPU', 'Octa-core', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(41, 6, 'RAM', '12GB', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(42, 6, 'Storage', '380GB', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(43, 6, 'Camera', '50MP + 12MP (Ultra-wide)', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(44, 6, 'Battery', '4358 mAh', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(45, 6, 'Display', '6.7\" OLED 60Hz', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(46, 6, 'Connectivity', '5G, Wi‑Fi 6E, Bluetooth 5.3, NFC, USB‑C', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(47, 7, 'detail_path', 'private/gadget_details/apple-macbook-air-m2-varian-1.md', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(48, 7, 'CPU', 'Intel Core i5-13500H', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(49, 7, 'RAM', '30GB', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(50, 7, 'Storage', '835GB SSD', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(51, 7, 'GPU', 'NVIDIA RTX 4050', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(52, 7, 'Display', '14\" IPS 120Hz', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(53, 7, 'Ports', 'USB‑C, Thunderbolt 4, HDMI, microSD', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(54, 7, 'Connectivity', 'Wi‑Fi 6E, Bluetooth 5.3', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(55, 8, 'detail_path', 'private/gadget_details/apple-macbook-pro-14-varian-2.md', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(56, 8, 'CPU', 'Intel Core i7-13700H', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(57, 8, 'RAM', '11GB', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(58, 8, 'Storage', '763GB SSD', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(59, 8, 'GPU', 'NVIDIA RTX 4060', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(60, 8, 'Display', '15.6\" IPS 60Hz', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(61, 8, 'Ports', 'USB‑C, Thunderbolt 4, HDMI, microSD', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(62, 8, 'Connectivity', 'Wi‑Fi 6E, Bluetooth 5.3', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(63, 9, 'detail_path', 'private/gadget_details/apple-macbook-air-m2-varian-3.md', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(64, 9, 'CPU', 'AMD Ryzen 7 7840U', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(65, 9, 'RAM', '29GB', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(66, 9, 'Storage', '278GB SSD', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(67, 9, 'GPU', 'Radeon 780M', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(68, 9, 'Display', '14\" IPS 165Hz', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(69, 9, 'Ports', 'USB‑C, Thunderbolt 4, HDMI, microSD', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(70, 9, 'Connectivity', 'Wi‑Fi 6E, Bluetooth 5.3', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(71, 10, 'detail_path', 'private/gadget_details/apple-macbook-pro-14-varian-4.md', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(72, 10, 'CPU', 'Intel Core i5-13500H', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(73, 10, 'RAM', '15GB', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(74, 10, 'Storage', '699GB SSD', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(75, 10, 'GPU', 'Intel Iris Xe', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(76, 10, 'Display', '15.6\" IPS 120Hz', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(77, 10, 'Ports', 'USB‑C, Thunderbolt 4, HDMI, microSD', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(78, 10, 'Connectivity', 'Wi‑Fi 6E, Bluetooth 5.3', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(79, 11, 'detail_path', 'private/gadget_details/apple-ipad-air-5-varian-1.md', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(80, 11, 'Chipset', 'Snapdragon 8 Gen 2', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(81, 11, 'CPU', 'Octa-core', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(82, 11, 'RAM', '4GB', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(83, 11, 'Storage', '511GB', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(84, 11, 'Camera', '108MP + 8MP (Ultra-wide)', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(85, 11, 'Battery', '5511 mAh', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(86, 11, 'Display', '6.1\" OLED 60Hz', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(87, 11, 'Connectivity', '5G, Wi‑Fi 6E, Bluetooth 5.3, NFC, USB‑C', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(88, 12, 'detail_path', 'private/gadget_details/apple-ipad-pro-11-varian-2.md', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(89, 12, 'Chipset', 'Dimensity 9200', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(90, 12, 'CPU', 'Octa-core', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(91, 12, 'RAM', '4GB', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(92, 12, 'Storage', '401GB', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(93, 12, 'Camera', '64MP + 12MP (Ultra-wide)', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(94, 12, 'Battery', '5754 mAh', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(95, 12, 'Display', '6.7\" OLED 90Hz', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(96, 12, 'Connectivity', '5G, Wi‑Fi 6E, Bluetooth 5.3, NFC, USB‑C', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(97, 13, 'detail_path', 'private/gadget_details/apple-ipad-air-5-varian-3.md', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(98, 13, 'Chipset', 'Snapdragon 8 Gen 2', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(99, 13, 'CPU', 'Octa-core', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(100, 13, 'RAM', '5GB', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(101, 13, 'Storage', '258GB', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(102, 13, 'Camera', '50MP + 8MP (Ultra-wide)', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(103, 13, 'Battery', '5132 mAh', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(104, 13, 'Display', '6.1\" OLED 120Hz', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(105, 13, 'Connectivity', '5G, Wi‑Fi 6E, Bluetooth 5.3, NFC, USB‑C', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(106, 14, 'detail_path', 'private/gadget_details/apple-ipad-pro-11-varian-4.md', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(107, 14, 'Chipset', 'Dimensity 9200', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(108, 14, 'CPU', 'Octa-core', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(109, 14, 'RAM', '4GB', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(110, 14, 'Storage', '377GB', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(111, 14, 'Camera', '108MP + 12MP (Ultra-wide)', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(112, 14, 'Battery', '4057 mAh', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(113, 14, 'Display', '6.7\" OLED 60Hz', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(114, 14, 'Connectivity', '5G, Wi‑Fi 6E, Bluetooth 5.3, NFC, USB‑C', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(115, 15, 'detail_path', 'private/gadget_details/apple-apple-watch-series-9-varian-1.md', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(116, 15, 'Sensors', 'Heart rate, SpO2, GPS, ECG', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(117, 15, 'Battery', '540 mAh', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(118, 15, 'Battery Life', '6 hari', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(119, 15, 'Water Resistance', '5 ATM', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(120, 15, 'Connectivity', 'Bluetooth 5.x, LTE (opsional)', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(121, 16, 'detail_path', 'private/gadget_details/apple-airpods-pro-2-varian-2.md', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(122, 16, 'Sensors', 'Heart rate, SpO2, GPS, ECG', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(123, 16, 'Battery', '252 mAh', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(124, 16, 'Battery Life', '13 hari', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(125, 16, 'Water Resistance', '5 ATM', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(126, 16, 'Connectivity', 'Bluetooth 5.x, LTE (opsional)', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(127, 17, 'detail_path', 'private/gadget_details/apple-apple-watch-series-9-varian-3.md', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(128, 17, 'Sensors', 'Heart rate, SpO2, GPS, ECG', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(129, 17, 'Battery', '500 mAh', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(130, 17, 'Battery Life', '9 hari', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(131, 17, 'Water Resistance', '5 ATM', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(132, 17, 'Connectivity', 'Bluetooth 5.x, LTE (opsional)', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(133, 18, 'detail_path', 'private/gadget_details/apple-airpods-pro-2-varian-4.md', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(134, 18, 'Sensors', 'Heart rate, SpO2, GPS, ECG', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(135, 18, 'Battery', '417 mAh', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(136, 18, 'Battery Life', '5 hari', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(137, 18, 'Water Resistance', '5 ATM', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(138, 18, 'Connectivity', 'Bluetooth 5.x, LTE (opsional)', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(139, 19, 'detail_path', 'private/gadget_details/samsung-galaxy-s23-varian-1.md', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(140, 19, 'Chipset', 'Snapdragon 8 Gen 2', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(141, 19, 'CPU', 'Octa-core', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(142, 19, 'RAM', '4GB', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(143, 19, 'Storage', '318GB', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(144, 19, 'Camera', '64MP + 8MP (Ultra-wide)', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(145, 19, 'Battery', '4581 mAh', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(146, 19, 'Display', '6.1\" OLED 60Hz', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(147, 19, 'Connectivity', '5G, Wi‑Fi 6E, Bluetooth 5.3, NFC, USB‑C', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(148, 20, 'detail_path', 'private/gadget_details/samsung-galaxy-a54-varian-2.md', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(149, 20, 'Chipset', 'Dimensity 9200', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(150, 20, 'CPU', 'Octa-core', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(151, 20, 'RAM', '10GB', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(152, 20, 'Storage', '431GB', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(153, 20, 'Camera', '50MP + 12MP (Ultra-wide)', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(154, 20, 'Battery', '3527 mAh', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(155, 20, 'Display', '6.7\" OLED 90Hz', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(156, 20, 'Connectivity', '5G, Wi‑Fi 6E, Bluetooth 5.3, NFC, USB‑C', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(157, 21, 'detail_path', 'private/gadget_details/samsung-galaxy-s23-varian-3.md', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(158, 21, 'Chipset', 'Snapdragon 8 Gen 2', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(159, 21, 'CPU', 'Octa-core', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(160, 21, 'RAM', '4GB', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(161, 21, 'Storage', '94GB', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(162, 21, 'Camera', '108MP + 8MP (Ultra-wide)', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(163, 21, 'Battery', '3590 mAh', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(164, 21, 'Display', '6.1\" OLED 120Hz', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(165, 21, 'Connectivity', '5G, Wi‑Fi 6E, Bluetooth 5.3, NFC, USB‑C', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(166, 22, 'detail_path', 'private/gadget_details/samsung-galaxy-a54-varian-4.md', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(167, 22, 'Chipset', 'Dimensity 9200', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(168, 22, 'CPU', 'Octa-core', '2025-11-01 19:07:08', '2025-11-01 19:07:08'),
(169, 22, 'RAM', '6GB', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(170, 22, 'Storage', '192GB', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(171, 22, 'Camera', '64MP + 12MP (Ultra-wide)', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(172, 22, 'Battery', '4256 mAh', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(173, 22, 'Display', '6.7\" OLED 60Hz', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(174, 22, 'Connectivity', '5G, Wi‑Fi 6E, Bluetooth 5.3, NFC, USB‑C', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(175, 23, 'detail_path', 'private/gadget_details/samsung-galaxy-book3-varian-1.md', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(176, 23, 'CPU', 'AMD Ryzen 7 7840U', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(177, 23, 'RAM', '10GB', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(178, 23, 'Storage', '886GB SSD', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(179, 23, 'GPU', 'NVIDIA RTX 4050', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(180, 23, 'Display', '14\" IPS 165Hz', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(181, 23, 'Ports', 'USB‑C, Thunderbolt 4, HDMI, microSD', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(182, 23, 'Connectivity', 'Wi‑Fi 6E, Bluetooth 5.3', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(183, 24, 'detail_path', 'private/gadget_details/samsung-galaxy-book3-varian-2.md', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(184, 24, 'CPU', 'Intel Core i5-13500H', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(185, 24, 'RAM', '12GB', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(186, 24, 'Storage', '295GB SSD', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(187, 24, 'GPU', 'NVIDIA RTX 4060', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(188, 24, 'Display', '15.6\" IPS 120Hz', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(189, 24, 'Ports', 'USB‑C, Thunderbolt 4, HDMI, microSD', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(190, 24, 'Connectivity', 'Wi‑Fi 6E, Bluetooth 5.3', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(191, 25, 'detail_path', 'private/gadget_details/samsung-galaxy-book3-varian-3.md', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(192, 25, 'CPU', 'Intel Core i7-13700H', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(193, 25, 'RAM', '14GB', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(194, 25, 'Storage', '844GB SSD', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(195, 25, 'GPU', 'Radeon 780M', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(196, 25, 'Display', '14\" IPS 60Hz', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(197, 25, 'Ports', 'USB‑C, Thunderbolt 4, HDMI, microSD', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(198, 25, 'Connectivity', 'Wi‑Fi 6E, Bluetooth 5.3', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(199, 26, 'detail_path', 'private/gadget_details/samsung-galaxy-book3-varian-4.md', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(200, 26, 'CPU', 'AMD Ryzen 7 7840U', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(201, 26, 'RAM', '18GB', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(202, 26, 'Storage', '372GB SSD', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(203, 26, 'GPU', 'Intel Iris Xe', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(204, 26, 'Display', '15.6\" IPS 165Hz', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(205, 26, 'Ports', 'USB‑C, Thunderbolt 4, HDMI, microSD', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(206, 26, 'Connectivity', 'Wi‑Fi 6E, Bluetooth 5.3', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(207, 27, 'detail_path', 'private/gadget_details/samsung-galaxy-tab-s9-varian-1.md', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(208, 27, 'Chipset', 'Snapdragon 8 Gen 2', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(209, 27, 'CPU', 'Octa-core', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(210, 27, 'RAM', '10GB', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(211, 27, 'Storage', '114GB', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(212, 27, 'Camera', '50MP + 8MP (Ultra-wide)', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(213, 27, 'Battery', '5037 mAh', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(214, 27, 'Display', '6.1\" OLED 60Hz', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(215, 27, 'Connectivity', '5G, Wi‑Fi 6E, Bluetooth 5.3, NFC, USB‑C', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(216, 28, 'detail_path', 'private/gadget_details/samsung-galaxy-tab-a9-varian-2.md', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(217, 28, 'Chipset', 'Dimensity 9200', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(218, 28, 'CPU', 'Octa-core', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(219, 28, 'RAM', '5GB', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(220, 28, 'Storage', '242GB', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(221, 28, 'Camera', '108MP + 12MP (Ultra-wide)', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(222, 28, 'Battery', '5762 mAh', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(223, 28, 'Display', '6.7\" OLED 90Hz', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(224, 28, 'Connectivity', '5G, Wi‑Fi 6E, Bluetooth 5.3, NFC, USB‑C', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(225, 29, 'detail_path', 'private/gadget_details/samsung-galaxy-tab-s9-varian-3.md', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(226, 29, 'Chipset', 'Snapdragon 8 Gen 2', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(227, 29, 'CPU', 'Octa-core', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(228, 29, 'RAM', '4GB', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(229, 29, 'Storage', '226GB', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(230, 29, 'Camera', '64MP + 8MP (Ultra-wide)', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(231, 29, 'Battery', '4444 mAh', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(232, 29, 'Display', '6.1\" OLED 120Hz', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(233, 29, 'Connectivity', '5G, Wi‑Fi 6E, Bluetooth 5.3, NFC, USB‑C', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(234, 30, 'detail_path', 'private/gadget_details/samsung-galaxy-tab-a9-varian-4.md', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(235, 30, 'Chipset', 'Dimensity 9200', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(236, 30, 'CPU', 'Octa-core', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(237, 30, 'RAM', '7GB', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(238, 30, 'Storage', '94GB', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(239, 30, 'Camera', '50MP + 12MP (Ultra-wide)', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(240, 30, 'Battery', '5563 mAh', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(241, 30, 'Display', '6.7\" OLED 60Hz', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(242, 30, 'Connectivity', '5G, Wi‑Fi 6E, Bluetooth 5.3, NFC, USB‑C', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(243, 31, 'detail_path', 'private/gadget_details/samsung-galaxy-watch6-varian-1.md', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(244, 31, 'Sensors', 'Heart rate, SpO2, GPS, ECG', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(245, 31, 'Battery', '288 mAh', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(246, 31, 'Battery Life', '14 hari', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(247, 31, 'Water Resistance', '5 ATM', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(248, 31, 'Connectivity', 'Bluetooth 5.x, LTE (opsional)', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(249, 32, 'detail_path', 'private/gadget_details/samsung-galaxy-buds2-pro-varian-2.md', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(250, 32, 'Sensors', 'Heart rate, SpO2, GPS, ECG', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(251, 32, 'Battery', '542 mAh', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(252, 32, 'Battery Life', '9 hari', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(253, 32, 'Water Resistance', '5 ATM', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(254, 32, 'Connectivity', 'Bluetooth 5.x, LTE (opsional)', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(255, 33, 'detail_path', 'private/gadget_details/samsung-galaxy-watch6-varian-3.md', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(256, 33, 'Sensors', 'Heart rate, SpO2, GPS, ECG', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(257, 33, 'Battery', '208 mAh', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(258, 33, 'Battery Life', '12 hari', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(259, 33, 'Water Resistance', '5 ATM', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(260, 33, 'Connectivity', 'Bluetooth 5.x, LTE (opsional)', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(261, 34, 'detail_path', 'private/gadget_details/samsung-galaxy-buds2-pro-varian-4.md', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(262, 34, 'Sensors', 'Heart rate, SpO2, GPS, ECG', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(263, 34, 'Battery', '541 mAh', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(264, 34, 'Battery Life', '14 hari', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(265, 34, 'Water Resistance', '5 ATM', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(266, 34, 'Connectivity', 'Bluetooth 5.x, LTE (opsional)', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(267, 35, 'detail_path', 'private/gadget_details/xiaomi-redmi-note-13-varian-1.md', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(268, 35, 'Chipset', 'Snapdragon 8 Gen 2', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(269, 35, 'CPU', 'Octa-core', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(270, 35, 'RAM', '5GB', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(271, 35, 'Storage', '421GB', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(272, 35, 'Camera', '108MP + 8MP (Ultra-wide)', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(273, 35, 'Battery', '5473 mAh', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(274, 35, 'Display', '6.1\" OLED 60Hz', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(275, 35, 'Connectivity', '5G, Wi‑Fi 6E, Bluetooth 5.3, NFC, USB‑C', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(276, 36, 'detail_path', 'private/gadget_details/xiaomi-xiaomi-13-varian-2.md', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(277, 36, 'Chipset', 'Dimensity 9200', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(278, 36, 'CPU', 'Octa-core', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(279, 36, 'RAM', '10GB', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(280, 36, 'Storage', '474GB', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(281, 36, 'Camera', '64MP + 12MP (Ultra-wide)', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(282, 36, 'Battery', '5753 mAh', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(283, 36, 'Display', '6.7\" OLED 90Hz', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(284, 36, 'Connectivity', '5G, Wi‑Fi 6E, Bluetooth 5.3, NFC, USB‑C', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(285, 37, 'detail_path', 'private/gadget_details/xiaomi-redmi-note-13-varian-3.md', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(286, 37, 'Chipset', 'Snapdragon 8 Gen 2', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(287, 37, 'CPU', 'Octa-core', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(288, 37, 'RAM', '4GB', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(289, 37, 'Storage', '161GB', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(290, 37, 'Camera', '50MP + 8MP (Ultra-wide)', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(291, 37, 'Battery', '5382 mAh', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(292, 37, 'Display', '6.1\" OLED 120Hz', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(293, 37, 'Connectivity', '5G, Wi‑Fi 6E, Bluetooth 5.3, NFC, USB‑C', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(294, 38, 'detail_path', 'private/gadget_details/xiaomi-xiaomi-13-varian-4.md', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(295, 38, 'Chipset', 'Dimensity 9200', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(296, 38, 'CPU', 'Octa-core', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(297, 38, 'RAM', '6GB', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(298, 38, 'Storage', '78GB', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(299, 38, 'Camera', '108MP + 12MP (Ultra-wide)', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(300, 38, 'Battery', '5854 mAh', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(301, 38, 'Display', '6.7\" OLED 60Hz', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(302, 38, 'Connectivity', '5G, Wi‑Fi 6E, Bluetooth 5.3, NFC, USB‑C', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(303, 39, 'detail_path', 'private/gadget_details/xiaomi-mi-notebook-pro-varian-1.md', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(304, 39, 'CPU', 'Intel Core i7-13700H', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(305, 39, 'RAM', '17GB', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(306, 39, 'Storage', '702GB SSD', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(307, 39, 'GPU', 'NVIDIA RTX 4050', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(308, 39, 'Display', '14\" IPS 60Hz', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(309, 39, 'Ports', 'USB‑C, Thunderbolt 4, HDMI, microSD', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(310, 39, 'Connectivity', 'Wi‑Fi 6E, Bluetooth 5.3', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(311, 40, 'detail_path', 'private/gadget_details/xiaomi-mi-notebook-pro-varian-2.md', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(312, 40, 'CPU', 'AMD Ryzen 7 7840U', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(313, 40, 'RAM', '26GB', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(314, 40, 'Storage', '894GB SSD', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(315, 40, 'GPU', 'NVIDIA RTX 4060', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(316, 40, 'Display', '15.6\" IPS 165Hz', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(317, 40, 'Ports', 'USB‑C, Thunderbolt 4, HDMI, microSD', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(318, 40, 'Connectivity', 'Wi‑Fi 6E, Bluetooth 5.3', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(319, 41, 'detail_path', 'private/gadget_details/xiaomi-mi-notebook-pro-varian-3.md', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(320, 41, 'CPU', 'Intel Core i5-13500H', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(321, 41, 'RAM', '9GB', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(322, 41, 'Storage', '506GB SSD', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(323, 41, 'GPU', 'Radeon 780M', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(324, 41, 'Display', '14\" IPS 120Hz', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(325, 41, 'Ports', 'USB‑C, Thunderbolt 4, HDMI, microSD', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(326, 41, 'Connectivity', 'Wi‑Fi 6E, Bluetooth 5.3', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(327, 42, 'detail_path', 'private/gadget_details/xiaomi-mi-notebook-pro-varian-4.md', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(328, 42, 'CPU', 'Intel Core i7-13700H', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(329, 42, 'RAM', '25GB', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(330, 42, 'Storage', '973GB SSD', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(331, 42, 'GPU', 'Intel Iris Xe', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(332, 42, 'Display', '15.6\" IPS 60Hz', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(333, 42, 'Ports', 'USB‑C, Thunderbolt 4, HDMI, microSD', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(334, 42, 'Connectivity', 'Wi‑Fi 6E, Bluetooth 5.3', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(335, 43, 'detail_path', 'private/gadget_details/xiaomi-mi-pad-6-varian-1.md', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(336, 43, 'Chipset', 'Snapdragon 8 Gen 2', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(337, 43, 'CPU', 'Octa-core', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(338, 43, 'RAM', '6GB', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(339, 43, 'Storage', '281GB', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(340, 43, 'Camera', '64MP + 8MP (Ultra-wide)', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(341, 43, 'Battery', '5571 mAh', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(342, 43, 'Display', '6.1\" OLED 60Hz', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(343, 43, 'Connectivity', '5G, Wi‑Fi 6E, Bluetooth 5.3, NFC, USB‑C', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(344, 44, 'detail_path', 'private/gadget_details/xiaomi-mi-pad-6-varian-2.md', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(345, 44, 'Chipset', 'Dimensity 9200', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(346, 44, 'CPU', 'Octa-core', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(347, 44, 'RAM', '9GB', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(348, 44, 'Storage', '370GB', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(349, 44, 'Camera', '50MP + 12MP (Ultra-wide)', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(350, 44, 'Battery', '5811 mAh', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(351, 44, 'Display', '6.7\" OLED 90Hz', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(352, 44, 'Connectivity', '5G, Wi‑Fi 6E, Bluetooth 5.3, NFC, USB‑C', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(353, 45, 'detail_path', 'private/gadget_details/xiaomi-mi-pad-6-varian-3.md', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(354, 45, 'Chipset', 'Snapdragon 8 Gen 2', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(355, 45, 'CPU', 'Octa-core', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(356, 45, 'RAM', '8GB', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(357, 45, 'Storage', '76GB', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(358, 45, 'Camera', '108MP + 8MP (Ultra-wide)', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(359, 45, 'Battery', '4925 mAh', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(360, 45, 'Display', '6.1\" OLED 120Hz', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(361, 45, 'Connectivity', '5G, Wi‑Fi 6E, Bluetooth 5.3, NFC, USB‑C', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(362, 46, 'detail_path', 'private/gadget_details/xiaomi-mi-pad-6-varian-4.md', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(363, 46, 'Chipset', 'Dimensity 9200', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(364, 46, 'CPU', 'Octa-core', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(365, 46, 'RAM', '6GB', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(366, 46, 'Storage', '376GB', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(367, 46, 'Camera', '64MP + 12MP (Ultra-wide)', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(368, 46, 'Battery', '3882 mAh', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(369, 46, 'Display', '6.7\" OLED 60Hz', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(370, 46, 'Connectivity', '5G, Wi‑Fi 6E, Bluetooth 5.3, NFC, USB‑C', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(371, 47, 'detail_path', 'private/gadget_details/xiaomi-mi-band-8-varian-1.md', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(372, 47, 'Sensors', 'Heart rate, SpO2, GPS, ECG', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(373, 47, 'Battery', '260 mAh', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(374, 47, 'Battery Life', '9 hari', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(375, 47, 'Water Resistance', '5 ATM', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(376, 47, 'Connectivity', 'Bluetooth 5.x, LTE (opsional)', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(377, 48, 'detail_path', 'private/gadget_details/xiaomi-mi-band-8-varian-2.md', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(378, 48, 'Sensors', 'Heart rate, SpO2, GPS, ECG', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(379, 48, 'Battery', '423 mAh', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(380, 48, 'Battery Life', '7 hari', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(381, 48, 'Water Resistance', '5 ATM', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(382, 48, 'Connectivity', 'Bluetooth 5.x, LTE (opsional)', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(383, 49, 'detail_path', 'private/gadget_details/xiaomi-mi-band-8-varian-3.md', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(384, 49, 'Sensors', 'Heart rate, SpO2, GPS, ECG', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(385, 49, 'Battery', '375 mAh', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(386, 49, 'Battery Life', '9 hari', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(387, 49, 'Water Resistance', '5 ATM', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(388, 49, 'Connectivity', 'Bluetooth 5.x, LTE (opsional)', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(389, 50, 'detail_path', 'private/gadget_details/xiaomi-mi-band-8-varian-4.md', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(390, 50, 'Sensors', 'Heart rate, SpO2, GPS, ECG', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(391, 50, 'Battery', '566 mAh', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(392, 50, 'Battery Life', '11 hari', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(393, 50, 'Water Resistance', '5 ATM', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(394, 50, 'Connectivity', 'Bluetooth 5.x, LTE (opsional)', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(395, 51, 'detail_path', 'private/gadget_details/sony-xperia-5-v-varian-1.md', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(396, 51, 'Chipset', 'Snapdragon 8 Gen 2', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(397, 51, 'CPU', 'Octa-core', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(398, 51, 'RAM', '9GB', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(399, 51, 'Storage', '489GB', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(400, 51, 'Camera', '50MP + 8MP (Ultra-wide)', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(401, 51, 'Battery', '4565 mAh', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(402, 51, 'Display', '6.1\" OLED 60Hz', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(403, 51, 'Connectivity', '5G, Wi‑Fi 6E, Bluetooth 5.3, NFC, USB‑C', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(404, 52, 'detail_path', 'private/gadget_details/sony-xperia-5-v-varian-2.md', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(405, 52, 'Chipset', 'Dimensity 9200', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(406, 52, 'CPU', 'Octa-core', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(407, 52, 'RAM', '11GB', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(408, 52, 'Storage', '472GB', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(409, 52, 'Camera', '108MP + 12MP (Ultra-wide)', '2025-11-01 19:07:09', '2025-11-01 19:07:09'),
(410, 52, 'Battery', '5880 mAh', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(411, 52, 'Display', '6.7\" OLED 90Hz', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(412, 52, 'Connectivity', '5G, Wi‑Fi 6E, Bluetooth 5.3, NFC, USB‑C', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(413, 53, 'detail_path', 'private/gadget_details/sony-xperia-5-v-varian-3.md', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(414, 53, 'Chipset', 'Snapdragon 8 Gen 2', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(415, 53, 'CPU', 'Octa-core', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(416, 53, 'RAM', '5GB', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(417, 53, 'Storage', '503GB', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(418, 53, 'Camera', '64MP + 8MP (Ultra-wide)', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(419, 53, 'Battery', '3671 mAh', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(420, 53, 'Display', '6.1\" OLED 120Hz', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(421, 53, 'Connectivity', '5G, Wi‑Fi 6E, Bluetooth 5.3, NFC, USB‑C', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(422, 54, 'detail_path', 'private/gadget_details/sony-xperia-5-v-varian-4.md', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(423, 54, 'Chipset', 'Dimensity 9200', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(424, 54, 'CPU', 'Octa-core', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(425, 54, 'RAM', '12GB', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(426, 54, 'Storage', '226GB', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(427, 54, 'Camera', '50MP + 12MP (Ultra-wide)', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(428, 54, 'Battery', '4490 mAh', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(429, 54, 'Display', '6.7\" OLED 60Hz', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(430, 54, 'Connectivity', '5G, Wi‑Fi 6E, Bluetooth 5.3, NFC, USB‑C', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(431, 55, 'detail_path', 'private/gadget_details/sony-vaio-z-varian-1.md', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(432, 55, 'CPU', 'Intel Core i5-13500H', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(433, 55, 'RAM', '29GB', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(434, 55, 'Storage', '961GB SSD', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(435, 55, 'GPU', 'NVIDIA RTX 4050', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(436, 55, 'Display', '14\" IPS 120Hz', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(437, 55, 'Ports', 'USB‑C, Thunderbolt 4, HDMI, microSD', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(438, 55, 'Connectivity', 'Wi‑Fi 6E, Bluetooth 5.3', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(439, 56, 'detail_path', 'private/gadget_details/sony-vaio-z-varian-2.md', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(440, 56, 'CPU', 'Intel Core i7-13700H', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(441, 56, 'RAM', '26GB', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(442, 56, 'Storage', '354GB SSD', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(443, 56, 'GPU', 'NVIDIA RTX 4060', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(444, 56, 'Display', '15.6\" IPS 60Hz', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(445, 56, 'Ports', 'USB‑C, Thunderbolt 4, HDMI, microSD', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(446, 56, 'Connectivity', 'Wi‑Fi 6E, Bluetooth 5.3', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(447, 57, 'detail_path', 'private/gadget_details/sony-vaio-z-varian-3.md', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(448, 57, 'CPU', 'AMD Ryzen 7 7840U', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(449, 57, 'RAM', '14GB', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(450, 57, 'Storage', '638GB SSD', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(451, 57, 'GPU', 'Radeon 780M', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(452, 57, 'Display', '14\" IPS 165Hz', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(453, 57, 'Ports', 'USB‑C, Thunderbolt 4, HDMI, microSD', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(454, 57, 'Connectivity', 'Wi‑Fi 6E, Bluetooth 5.3', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(455, 58, 'detail_path', 'private/gadget_details/sony-vaio-z-varian-4.md', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(456, 58, 'CPU', 'Intel Core i5-13500H', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(457, 58, 'RAM', '15GB', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(458, 58, 'Storage', '299GB SSD', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(459, 58, 'GPU', 'Intel Iris Xe', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(460, 58, 'Display', '15.6\" IPS 120Hz', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(461, 58, 'Ports', 'USB‑C, Thunderbolt 4, HDMI, microSD', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(462, 58, 'Connectivity', 'Wi‑Fi 6E, Bluetooth 5.3', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(463, 59, 'detail_path', 'private/gadget_details/sony-xperia-tablet-z4-varian-1.md', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(464, 59, 'Chipset', 'Snapdragon 8 Gen 2', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(465, 59, 'CPU', 'Octa-core', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(466, 59, 'RAM', '11GB', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(467, 59, 'Storage', '504GB', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(468, 59, 'Camera', '108MP + 8MP (Ultra-wide)', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(469, 59, 'Battery', '5047 mAh', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(470, 59, 'Display', '6.1\" OLED 60Hz', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(471, 59, 'Connectivity', '5G, Wi‑Fi 6E, Bluetooth 5.3, NFC, USB‑C', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(472, 60, 'detail_path', 'private/gadget_details/sony-xperia-tablet-z4-varian-2.md', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(473, 60, 'Chipset', 'Dimensity 9200', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(474, 60, 'CPU', 'Octa-core', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(475, 60, 'RAM', '5GB', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(476, 60, 'Storage', '91GB', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(477, 60, 'Camera', '64MP + 12MP (Ultra-wide)', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(478, 60, 'Battery', '5527 mAh', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(479, 60, 'Display', '6.7\" OLED 90Hz', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(480, 60, 'Connectivity', '5G, Wi‑Fi 6E, Bluetooth 5.3, NFC, USB‑C', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(481, 61, 'detail_path', 'private/gadget_details/sony-xperia-tablet-z4-varian-3.md', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(482, 61, 'Chipset', 'Snapdragon 8 Gen 2', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(483, 61, 'CPU', 'Octa-core', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(484, 61, 'RAM', '11GB', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(485, 61, 'Storage', '442GB', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(486, 61, 'Camera', '50MP + 8MP (Ultra-wide)', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(487, 61, 'Battery', '5666 mAh', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(488, 61, 'Display', '6.1\" OLED 120Hz', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(489, 61, 'Connectivity', '5G, Wi‑Fi 6E, Bluetooth 5.3, NFC, USB‑C', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(490, 62, 'detail_path', 'private/gadget_details/sony-xperia-tablet-z4-varian-4.md', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(491, 62, 'Chipset', 'Dimensity 9200', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(492, 62, 'CPU', 'Octa-core', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(493, 62, 'RAM', '5GB', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(494, 62, 'Storage', '489GB', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(495, 62, 'Camera', '108MP + 12MP (Ultra-wide)', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(496, 62, 'Battery', '5026 mAh', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(497, 62, 'Display', '6.7\" OLED 60Hz', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(498, 62, 'Connectivity', '5G, Wi‑Fi 6E, Bluetooth 5.3, NFC, USB‑C', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(499, 63, 'detail_path', 'private/gadget_details/sony-wh-1000xm5-varian-1.md', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(500, 63, 'Sensors', 'Heart rate, SpO2, GPS, ECG', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(501, 63, 'Battery', '520 mAh', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(502, 63, 'Battery Life', '10 hari', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(503, 63, 'Water Resistance', '5 ATM', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(504, 63, 'Connectivity', 'Bluetooth 5.x, LTE (opsional)', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(505, 64, 'detail_path', 'private/gadget_details/sony-wf-1000xm5-varian-2.md', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(506, 64, 'Sensors', 'Heart rate, SpO2, GPS, ECG', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(507, 64, 'Battery', '394 mAh', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(508, 64, 'Battery Life', '10 hari', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(509, 64, 'Water Resistance', '5 ATM', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(510, 64, 'Connectivity', 'Bluetooth 5.x, LTE (opsional)', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(511, 65, 'detail_path', 'private/gadget_details/sony-wh-1000xm5-varian-3.md', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(512, 65, 'Sensors', 'Heart rate, SpO2, GPS, ECG', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(513, 65, 'Battery', '526 mAh', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(514, 65, 'Battery Life', '5 hari', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(515, 65, 'Water Resistance', '5 ATM', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(516, 65, 'Connectivity', 'Bluetooth 5.x, LTE (opsional)', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(517, 66, 'detail_path', 'private/gadget_details/sony-wf-1000xm5-varian-4.md', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(518, 66, 'Sensors', 'Heart rate, SpO2, GPS, ECG', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(519, 66, 'Battery', '247 mAh', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(520, 66, 'Battery Life', '10 hari', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(521, 66, 'Water Resistance', '5 ATM', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(522, 66, 'Connectivity', 'Bluetooth 5.x, LTE (opsional)', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(523, 67, 'detail_path', 'private/gadget_details/asus-rog-phone-7-varian-1.md', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(524, 67, 'Chipset', 'Snapdragon 8 Gen 2', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(525, 67, 'CPU', 'Octa-core', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(526, 67, 'RAM', '10GB', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(527, 67, 'Storage', '499GB', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(528, 67, 'Camera', '64MP + 8MP (Ultra-wide)', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(529, 67, 'Battery', '5467 mAh', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(530, 67, 'Display', '6.1\" OLED 60Hz', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(531, 67, 'Connectivity', '5G, Wi‑Fi 6E, Bluetooth 5.3, NFC, USB‑C', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(532, 68, 'detail_path', 'private/gadget_details/asus-rog-phone-7-varian-2.md', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(533, 68, 'Chipset', 'Dimensity 9200', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(534, 68, 'CPU', 'Octa-core', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(535, 68, 'RAM', '9GB', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(536, 68, 'Storage', '347GB', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(537, 68, 'Camera', '50MP + 12MP (Ultra-wide)', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(538, 68, 'Battery', '5664 mAh', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(539, 68, 'Display', '6.7\" OLED 90Hz', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(540, 68, 'Connectivity', '5G, Wi‑Fi 6E, Bluetooth 5.3, NFC, USB‑C', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(541, 69, 'detail_path', 'private/gadget_details/asus-rog-phone-7-varian-3.md', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(542, 69, 'Chipset', 'Snapdragon 8 Gen 2', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(543, 69, 'CPU', 'Octa-core', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(544, 69, 'RAM', '11GB', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(545, 69, 'Storage', '119GB', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(546, 69, 'Camera', '108MP + 8MP (Ultra-wide)', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(547, 69, 'Battery', '5719 mAh', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(548, 69, 'Display', '6.1\" OLED 120Hz', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(549, 69, 'Connectivity', '5G, Wi‑Fi 6E, Bluetooth 5.3, NFC, USB‑C', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(550, 70, 'detail_path', 'private/gadget_details/asus-rog-phone-7-varian-4.md', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(551, 70, 'Chipset', 'Dimensity 9200', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(552, 70, 'CPU', 'Octa-core', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(553, 70, 'RAM', '11GB', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(554, 70, 'Storage', '449GB', '2025-11-01 19:07:10', '2025-11-01 19:07:10');
INSERT INTO `gadget_specs` (`id`, `gadget_id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(555, 70, 'Camera', '64MP + 12MP (Ultra-wide)', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(556, 70, 'Battery', '5407 mAh', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(557, 70, 'Display', '6.7\" OLED 60Hz', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(558, 70, 'Connectivity', '5G, Wi‑Fi 6E, Bluetooth 5.3, NFC, USB‑C', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(559, 71, 'detail_path', 'private/gadget_details/asus-rog-zephyrus-g14-varian-1.md', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(560, 71, 'CPU', 'AMD Ryzen 7 7840U', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(561, 71, 'RAM', '31GB', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(562, 71, 'Storage', '958GB SSD', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(563, 71, 'GPU', 'NVIDIA RTX 4050', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(564, 71, 'Display', '14\" IPS 165Hz', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(565, 71, 'Ports', 'USB‑C, Thunderbolt 4, HDMI, microSD', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(566, 71, 'Connectivity', 'Wi‑Fi 6E, Bluetooth 5.3', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(567, 72, 'detail_path', 'private/gadget_details/asus-zenbook-14-varian-2.md', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(568, 72, 'CPU', 'Intel Core i5-13500H', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(569, 72, 'RAM', '8GB', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(570, 72, 'Storage', '532GB SSD', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(571, 72, 'GPU', 'NVIDIA RTX 4060', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(572, 72, 'Display', '15.6\" IPS 120Hz', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(573, 72, 'Ports', 'USB‑C, Thunderbolt 4, HDMI, microSD', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(574, 72, 'Connectivity', 'Wi‑Fi 6E, Bluetooth 5.3', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(575, 73, 'detail_path', 'private/gadget_details/asus-rog-zephyrus-g14-varian-3.md', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(576, 73, 'CPU', 'Intel Core i7-13700H', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(577, 73, 'RAM', '29GB', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(578, 73, 'Storage', '558GB SSD', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(579, 73, 'GPU', 'Radeon 780M', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(580, 73, 'Display', '14\" IPS 60Hz', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(581, 73, 'Ports', 'USB‑C, Thunderbolt 4, HDMI, microSD', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(582, 73, 'Connectivity', 'Wi‑Fi 6E, Bluetooth 5.3', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(583, 74, 'detail_path', 'private/gadget_details/asus-zenbook-14-varian-4.md', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(584, 74, 'CPU', 'AMD Ryzen 7 7840U', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(585, 74, 'RAM', '23GB', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(586, 74, 'Storage', '683GB SSD', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(587, 74, 'GPU', 'Intel Iris Xe', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(588, 74, 'Display', '15.6\" IPS 165Hz', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(589, 74, 'Ports', 'USB‑C, Thunderbolt 4, HDMI, microSD', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(590, 74, 'Connectivity', 'Wi‑Fi 6E, Bluetooth 5.3', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(591, 75, 'detail_path', 'private/gadget_details/asus-asus-zenpad-3s-10-varian-1.md', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(592, 75, 'Chipset', 'Snapdragon 8 Gen 2', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(593, 75, 'CPU', 'Octa-core', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(594, 75, 'RAM', '6GB', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(595, 75, 'Storage', '130GB', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(596, 75, 'Camera', '50MP + 8MP (Ultra-wide)', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(597, 75, 'Battery', '3560 mAh', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(598, 75, 'Display', '6.1\" OLED 60Hz', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(599, 75, 'Connectivity', '5G, Wi‑Fi 6E, Bluetooth 5.3, NFC, USB‑C', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(600, 76, 'detail_path', 'private/gadget_details/asus-asus-zenpad-3s-10-varian-2.md', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(601, 76, 'Chipset', 'Dimensity 9200', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(602, 76, 'CPU', 'Octa-core', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(603, 76, 'RAM', '7GB', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(604, 76, 'Storage', '124GB', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(605, 76, 'Camera', '108MP + 12MP (Ultra-wide)', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(606, 76, 'Battery', '5981 mAh', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(607, 76, 'Display', '6.7\" OLED 90Hz', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(608, 76, 'Connectivity', '5G, Wi‑Fi 6E, Bluetooth 5.3, NFC, USB‑C', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(609, 77, 'detail_path', 'private/gadget_details/asus-asus-zenpad-3s-10-varian-3.md', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(610, 77, 'Chipset', 'Snapdragon 8 Gen 2', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(611, 77, 'CPU', 'Octa-core', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(612, 77, 'RAM', '9GB', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(613, 77, 'Storage', '159GB', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(614, 77, 'Camera', '64MP + 8MP (Ultra-wide)', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(615, 77, 'Battery', '5235 mAh', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(616, 77, 'Display', '6.1\" OLED 120Hz', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(617, 77, 'Connectivity', '5G, Wi‑Fi 6E, Bluetooth 5.3, NFC, USB‑C', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(618, 78, 'detail_path', 'private/gadget_details/asus-asus-zenpad-3s-10-varian-4.md', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(619, 78, 'Chipset', 'Dimensity 9200', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(620, 78, 'CPU', 'Octa-core', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(621, 78, 'RAM', '11GB', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(622, 78, 'Storage', '139GB', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(623, 78, 'Camera', '50MP + 12MP (Ultra-wide)', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(624, 78, 'Battery', '5968 mAh', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(625, 78, 'Display', '6.7\" OLED 60Hz', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(626, 78, 'Connectivity', '5G, Wi‑Fi 6E, Bluetooth 5.3, NFC, USB‑C', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(627, 79, 'detail_path', 'private/gadget_details/asus-asus-vivowatch-5-varian-1.md', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(628, 79, 'Sensors', 'Heart rate, SpO2, GPS, ECG', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(629, 79, 'Battery', '369 mAh', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(630, 79, 'Battery Life', '13 hari', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(631, 79, 'Water Resistance', '5 ATM', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(632, 79, 'Connectivity', 'Bluetooth 5.x, LTE (opsional)', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(633, 80, 'detail_path', 'private/gadget_details/asus-asus-vivowatch-5-varian-2.md', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(634, 80, 'Sensors', 'Heart rate, SpO2, GPS, ECG', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(635, 80, 'Battery', '459 mAh', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(636, 80, 'Battery Life', '14 hari', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(637, 80, 'Water Resistance', '5 ATM', '2025-11-01 19:07:10', '2025-11-01 19:07:10'),
(638, 80, 'Connectivity', 'Bluetooth 5.x, LTE (opsional)', '2025-11-01 19:07:10', '2025-11-01 19:07:10');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_10_30_122852_create_brands_table', 1),
(5, '2025_10_30_122852_create_categories_table', 1),
(6, '2025_10_30_122852_create_gadgets_table', 1),
(7, '2025_10_30_122853_create_gadget_images_table', 1),
(8, '2025_10_30_122853_create_gadget_specs_table', 1),
(9, '2025_10_30_122853_create_reviews_table', 1),
(10, '2025_10_31_130000_alter_reviews_for_guest_reviews', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `gadget_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `guest_name` varchar(255) DEFAULT NULL,
  `guest_email` varchar(255) DEFAULT NULL,
  `rating` tinyint(3) UNSIGNED NOT NULL,
  `body` text NOT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `gadget_id`, `user_id`, `guest_name`, `guest_email`, `rating`, `body`, `approved`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL, 5, 'Produk sangat bagus, performa cepat dan kamera tajam.', 1, '2025-11-01 19:07:10', '2025-11-01 19:07:10');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('iUoQoqw67TR5LIqkP8IUspENBMs9RuojDoxxfRSV', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTjNJSWpMbDRsQlhHamNpSEJZU3hFaFRTOGRvVXVrWTI3SE9pTWZTMSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMi9nYWRnZXRzL2FwcGxlLWlwaG9uZS0xNS12YXJpYW4tMiI7czo1OiJyb3V0ZSI7czoxMjoiZ2FkZ2V0cy5zaG93Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1762243612),
('Mh4Jki3eTgL5X4T3mZ5QoE8ANYmYLjiLqkAEqPGa', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRXZ0OEh1YkxOd29IWVVnbW5WWnh1aVljZHk3QnRpMTRRYXRWYm9TeiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMi9nYWRnZXRzL2FzdXMtYXN1cy12aXZvd2F0Y2gtNS12YXJpYW4tMSI7czo1OiJyb3V0ZSI7czoxMjoiZ2FkZ2V0cy5zaG93Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1762076210),
('Z4zQsj89r7ABTxMfmP6oPjm7J5Ew5D5En6kr92nw', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiclVWdnp0TTBrVmlwNHVXcnI2UXVjTDZEWXJwQXhOZEROeTFreEdObyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMiI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1762264903);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Test User', 'test@example.com', NULL, '$2y$12$JhAg3NLdofC3Er8GPtqayebwlGHqa11H7M.Ji1.U70Rdk1RW9NfsG', NULL, '2025-11-01 19:07:08', '2025-11-01 19:07:08');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `brands_name_unique` (`name`),
  ADD UNIQUE KEY `brands_slug_unique` (`slug`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_name_unique` (`name`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `gadgets`
--
ALTER TABLE `gadgets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `gadgets_slug_unique` (`slug`),
  ADD KEY `gadgets_brand_id_foreign` (`brand_id`),
  ADD KEY `gadgets_category_id_foreign` (`category_id`);

--
-- Indexes for table `gadget_images`
--
ALTER TABLE `gadget_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gadget_images_gadget_id_foreign` (`gadget_id`);

--
-- Indexes for table `gadget_specs`
--
ALTER TABLE `gadget_specs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gadget_specs_gadget_id_foreign` (`gadget_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_gadget_id_foreign` (`gadget_id`),
  ADD KEY `reviews_user_id_foreign` (`user_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gadgets`
--
ALTER TABLE `gadgets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `gadget_images`
--
ALTER TABLE `gadget_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=316;

--
-- AUTO_INCREMENT for table `gadget_specs`
--
ALTER TABLE `gadget_specs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=639;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `gadgets`
--
ALTER TABLE `gadgets`
  ADD CONSTRAINT `gadgets_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `gadgets_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `gadget_images`
--
ALTER TABLE `gadget_images`
  ADD CONSTRAINT `gadget_images_gadget_id_foreign` FOREIGN KEY (`gadget_id`) REFERENCES `gadgets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `gadget_specs`
--
ALTER TABLE `gadget_specs`
  ADD CONSTRAINT `gadget_specs_gadget_id_foreign` FOREIGN KEY (`gadget_id`) REFERENCES `gadgets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_gadget_id_foreign` FOREIGN KEY (`gadget_id`) REFERENCES `gadgets` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
