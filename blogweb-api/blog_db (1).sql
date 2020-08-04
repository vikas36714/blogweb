-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 13, 2020 at 10:59 AM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blog_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_featured` tinyint(4) NOT NULL,
  `is_active` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `title`, `user_id`, `category_id`, `description`, `image`, `is_featured`, `is_active`, `created_at`, `updated_at`) VALUES
(27, 'Et ipsam eum et aliq', '8', '4', 'Aspernatur et magna', '1587283646.jpg', 1, 1, '2020-04-19 02:37:27', '2020-04-19 02:37:27'),
(29, 'Qui sit illum nihi', '8', '4', 'Et temporibus volupt', '1587283905.jpg', 1, 1, '2020-04-19 02:41:46', '2020-04-19 02:41:46'),
(36, 'Totam in magna adipi', '8', '3', 'Illum sapiente anim', '1587285675.jpg', 1, 1, '2020-04-19 03:11:15', '2020-04-19 03:11:15'),
(37, 'Est qui beatae volup', '8', '1', 'Accusamus quaerat ve', '1587285735.jpg', 1, 1, '2020-04-19 03:12:15', '2020-04-19 03:12:15'),
(38, 'Et ipsa quis aliqua', '8', '4', 'Voluptatem ut ut exp', '1587285820.jpg', 1, 1, '2020-04-19 03:13:41', '2020-04-19 03:13:41'),
(39, 'Ut provident expedi', '8', '4', 'Ullamco commodo est', '1587285844.jpg', 1, 1, '2020-04-19 03:14:05', '2020-04-19 03:14:05'),
(40, 'In nulla dolore enim', '8', '1', 'Ut occaecat perferen', '1587971546.jpg', 1, 1, '2020-04-27 01:42:28', '2020-04-27 01:42:28'),
(41, 'Quod dolor doloribus', '8', '2', 'Voluptas est ratione', '1587971597.jpg', 1, 1, '2020-04-27 01:43:17', '2020-04-27 01:43:17'),
(42, 'Necessitatibus aut i', '8', '14', 'Et numquam nesciunt', '1588138229.jpg', 1, 1, '2020-04-29 00:00:30', '2020-04-29 00:00:30');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `created_at`, `updated_at`) VALUES
(13, 'tv', '2020-04-28 01:05:47', '2020-04-28 01:05:47'),
(14, 'freez', '2020-04-28 01:05:56', '2020-04-28 01:05:56');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `phone`, `message`, `created_at`, `updated_at`) VALUES
(11, 'vikas gupta', 'vikas36714@gmail.com', '8565997911', 'Hii this is vikas her..', '2020-01-02 14:58:16', '2020-01-02 14:58:16'),
(12, 'admin', 'vikas36714@gmail.com', '8565997911', 'vikas', '2020-01-02 14:59:14', '2020-01-02 14:59:14'),
(13, 'vikas gupta', 'vikas36714@gmail.com', '8565997911', 'jhhk', '2020-01-02 15:07:28', '2020-01-02 15:07:28'),
(14, 'vikas gupta', 'vikas36714@gmail.com', '8565997911', 'hh', '2020-01-02 15:08:37', '2020-01-02 15:08:37'),
(15, 'vikas gupta', 'vikas36714@gmail.com', '8565997911', 'jhkjhk', '2020-01-02 15:09:19', '2020-01-02 15:09:19'),
(16, 'admin', 'vikas36714@gmail.com', '8565997911', 'vv', '2020-01-02 15:12:33', '2020-01-02 15:12:33'),
(17, 'admin', 'vikas36714@gmail.com', '8565997911', 'iii', '2020-01-02 15:14:29', '2020-01-02 15:14:29'),
(18, 'vikas gupta', 'vikas36714@gmail.com', '8565997911', 'Hii this is vikas gupta. and i am sending mail to you and got lots of difficulties', '2020-01-02 15:16:25', '2020-01-02 15:16:25'),
(19, 'vikas gupta', 'vikas36714@gmail.com', '8565997911', 'vvv', '2020-01-03 00:44:18', '2020-01-03 00:44:18'),
(20, 'admin', 'vikas36714@gmail.com', '8565997911', 'nnbm', '2020-01-03 00:47:22', '2020-01-03 00:47:22'),
(21, 'vikas gupta', 'vikas36714@gmail.com', '8565997911', 'bv', '2020-01-03 00:48:32', '2020-01-03 00:48:32'),
(22, 'vikas gupta', 'vikas36714@gmail.com', '8565997911', 'mnh', '2020-01-03 00:51:13', '2020-01-03 00:51:13'),
(23, 'admin', 'vikas36714@gmail.com', '8565997911', 'jhg', '2020-01-03 00:53:23', '2020-01-03 00:53:23'),
(24, 'admin', 'vikas36714@gmail.com', '8565997911', 'hgnm', '2020-01-03 00:55:35', '2020-01-03 00:55:35'),
(25, 'vikas gupta', 'vikas36714@gmail.com', '8565997911', 'mn', '2020-01-03 00:56:17', '2020-01-03 00:56:17'),
(26, 'vikas gupta', 'vikas36714@gmail.com', '8565997911', 'mbh', '2020-01-03 00:57:54', '2020-01-03 00:57:54'),
(27, 'vikas gupta', 'vikas36714@gmail.com', '8565997911', 'nbm', '2020-01-03 00:58:37', '2020-01-03 00:58:37'),
(28, 'vikas gupta', 'vikas36714@gmail.com', '8565997911', 'm.m.', '2020-01-03 00:59:55', '2020-01-03 00:59:55'),
(29, 'vikas gupta', 'vikas36714@gmail.com', '8565997911', 'njj', '2020-01-03 01:11:44', '2020-01-03 01:11:44'),
(30, 'vikas gupta', 'vikas36714@gmail.com', '8565997911', 'nmbm', '2020-01-03 01:12:12', '2020-01-03 01:12:12'),
(31, 'vikas gupta', 'vikas@gmail.com', '8565997911', 'test', '2020-04-02 22:34:14', '2020-04-02 22:34:14'),
(32, 'vikas gupta', 'vikas36714@gmail.com', '8565997911', 'test12344', '2020-04-02 22:34:48', '2020-04-02 22:34:48'),
(33, 'vikas gupta', 'vikas36714@gmail.com', '8565997911', 'test1444', '2020-04-02 22:37:04', '2020-04-02 22:37:04'),
(34, 'vikas gupta', 'vikas36714@gmail.com', '8565997911', 'asadsfsfsf', '2020-04-02 22:50:29', '2020-04-02 22:50:29');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `title`, `link`, `created_at`, `updated_at`) VALUES
(1, 'Home', '/', NULL, NULL),
(2, 'Blog', '/blog', NULL, '2020-04-30 04:24:28'),
(3, 'Contact', '/contact', NULL, NULL),
(4, 'About', '/page/about', NULL, NULL),
(5, 'Services', '/page/services', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_31_111952_create_pages_table', 1),
(5, '2019_12_31_112501_create_categories_table', 1),
(6, '2019_12_31_112645_create_blogs_table', 1),
(7, '2016_06_01_000001_create_oauth_auth_codes_table', 2),
(8, '2016_06_01_000002_create_oauth_access_tokens_table', 2),
(9, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2),
(10, '2016_06_01_000004_create_oauth_clients_table', 2),
(11, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2),
(12, '2020_01_02_083926_create_contacts_table', 3),
(13, '2020_04_29_162241_create_menus_table', 4),
(14, '2020_05_03_150118_create_settings_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('00cf7b56608ae54124e0e028f409b81869f44bfaa282603b594f477664d76437901c938d104945cb', 8, 1, 'MyApp', '[]', 0, '2020-05-10 01:04:51', '2020-05-10 01:04:51', '2021-05-10 06:34:51'),
('022506e0f2c4060a645e3df6ab08b90df20ccb9f4d2ac133f2e4ec85b06014390cf13783e438d0c9', 8, 1, 'MyApp', '[]', 0, '2020-01-06 00:29:00', '2020-01-06 00:29:00', '2021-01-06 05:59:00'),
('02f0f81f29f0d561806091a807bfab291ea9788b50f561cc7cdd425e6e0de66dc060bf0cb5364506', 6, 1, 'MyApp', '[]', 0, '2020-01-04 10:07:46', '2020-01-04 10:07:46', '2021-01-04 15:37:46'),
('03f5d9d47aadf614fbc2eae40a3d83ced969d36b05a6ce6919512b73642869f844c89e8f2ac4d42a', 6, 1, 'MyApp', '[]', 0, '2020-01-04 11:36:35', '2020-01-04 11:36:35', '2021-01-04 17:06:35'),
('04edeeac559631a5319b3f6daa8b8fd6241454f5ec08659cebfdffc7cc3b30c1e192902132c7d2c8', 8, 1, 'MyApp', '[]', 0, '2020-04-25 05:32:48', '2020-04-25 05:32:48', '2021-04-25 11:02:48'),
('0ce893051c9444e0b07e0001f8d3c610afe04308fe210a60ba2c667414a82f97b7822d01ab6fb42f', 6, 1, 'MyApp', '[]', 0, '2020-01-05 08:30:25', '2020-01-05 08:30:25', '2021-01-05 14:00:25'),
('1056266eec95c541d18a2df858006aa8fd5ee22a052bed7f2b297a90f0ac20550b7afc8a118edc6e', 8, 1, 'MyApp', '[]', 0, '2020-04-25 09:53:53', '2020-04-25 09:53:53', '2021-04-25 15:23:53'),
('1148898febc10551357c56f94de16d2c37bae65af8bde3b7c54a3bc1f9281f8b432f1747ac889677', 6, 1, 'MyApp', '[]', 0, '2020-01-04 05:25:44', '2020-01-04 05:25:44', '2021-01-04 10:55:44'),
('126622365c490dad735f1c090838777c387cd0e5ee461672fd98baccf85b69a957221b02eae14733', 6, 1, 'MyApp', '[]', 0, '2020-01-04 10:08:40', '2020-01-04 10:08:40', '2021-01-04 15:38:40'),
('13e014bffa13f7136caa4586da81f8c97ca3a24108f59d2152adec6331f630c06bc8d6b4f5d897aa', 8, 1, 'MyApp', '[]', 0, '2020-04-25 03:38:00', '2020-04-25 03:38:00', '2021-04-25 09:08:00'),
('15a7c2fa2d973d351e4ad3dff25bd31230f1cd417a165ba62ba489b330112a851c61dfaa229b1504', 6, 1, 'MyApp', '[]', 0, '2020-01-04 11:06:51', '2020-01-04 11:06:51', '2021-01-04 16:36:51'),
('163b21f3fca02aa4660cd981bc73c1b83e90b2f66dcf973def50102d9b2be90f91c8ce28c8443fc3', 6, 1, 'MyApp', '[]', 0, '2020-01-04 09:58:20', '2020-01-04 09:58:20', '2021-01-04 15:28:20'),
('1b13c1966849b0fd66940cae2a28a78060aa41022d9c66099b79d84720e0a543013b555c4aed6fe3', 8, 1, 'MyApp', '[]', 0, '2020-01-06 00:25:23', '2020-01-06 00:25:23', '2021-01-06 05:55:23'),
('1b32a977e2f846feb5bd659b3193fd01f3c463e29d474c09627f1d0fcb0279624422308e47573e87', 6, 1, 'MyApp', '[]', 0, '2020-01-05 00:38:09', '2020-01-05 00:38:09', '2021-01-05 06:08:09'),
('254091cdd4bcac7eca182c73332158300377f80bf071189ad04dc3376548ef548e4cd970471226ac', 6, 1, 'MyApp', '[]', 0, '2020-01-04 05:43:16', '2020-01-04 05:43:16', '2021-01-04 11:13:16'),
('26aed89aa487307036003599b96499d4eda69ef2d05e9f3c6919fa94e91aa1b6e638b3aa9f61b718', 8, 1, 'MyApp', '[]', 0, '2020-05-08 00:16:57', '2020-05-08 00:16:57', '2021-05-08 05:46:57'),
('281f684a433abd3e79cb2ac7e9b69c9df0845613c41562b4c518db4b24f2a72dadcfe34b8169e2f8', 8, 1, 'MyApp', '[]', 0, '2020-05-07 11:09:35', '2020-05-07 11:09:35', '2021-05-07 16:39:35'),
('28faafc3ef41e616be3400cdd7693ba43816f5a127cda10d71842a02b8faf4f602f10094c833d628', 8, 1, 'MyApp', '[]', 0, '2020-01-06 01:38:49', '2020-01-06 01:38:49', '2021-01-06 07:08:49'),
('2dab39777fcdbf9b776e553ab11e066d9de70f3848576f2045f697ed6a3889d342137a803e4660d9', 6, 1, 'MyApp', '[]', 0, '2020-01-04 05:35:03', '2020-01-04 05:35:03', '2021-01-04 11:05:03'),
('2f7ff1b7514ca7f7fab4d908631d71e76b8247918748fec46086f39ad51b44b7624d69303b911547', 8, 1, 'MyApp', '[]', 0, '2020-01-07 11:25:15', '2020-01-07 11:25:15', '2021-01-07 16:55:15'),
('2fe8440fb8a3fa15b1317ecc98ab6999dc9b623d61b599c725ee04583b448d05b0a3dfed8b06b0a7', 6, 1, 'MyApp', '[]', 0, '2020-01-04 10:07:48', '2020-01-04 10:07:48', '2021-01-04 15:37:48'),
('36b0f2cde38c353aafda46da2a6d75debad7d4971ebab5c3799fef3db7ff2208e2955be80718d40a', 6, 1, 'MyApp', '[]', 0, '2020-01-04 11:32:27', '2020-01-04 11:32:27', '2021-01-04 17:02:27'),
('38b5d34369a917976c6724eaa3afa534a74d5b42437172ae638ff612e47bab6d7cabf37f88d03957', 6, 1, 'MyApp', '[]', 0, '2020-01-04 05:36:58', '2020-01-04 05:36:58', '2021-01-04 11:06:58'),
('3b36ff737e80448f23a4eaac3012a30884b209f549ef5e090014dbecee7eb74eb7a95e357fdf48d9', 6, 1, 'MyApp', '[]', 0, '2020-01-05 08:30:48', '2020-01-05 08:30:48', '2021-01-05 14:00:48'),
('3b84dd98dae3def00540363fab7076071ac758dcaf95331689e441429504b8c3cf3d8611c5a374a3', 6, 1, 'MyApp', '[]', 0, '2020-01-04 10:09:41', '2020-01-04 10:09:41', '2021-01-04 15:39:41'),
('3deaddecdd0ff0c36fdde28214a39acb2fe38eb564a6f122b6aa00e8dc6e9af417bfdad89989bc91', 6, 1, 'MyApp', '[]', 0, '2020-01-05 01:49:55', '2020-01-05 01:49:55', '2021-01-05 07:19:55'),
('3e299b36d528dbbf4cfd6bd311e4f730f1053fe42405d565638e076e6d551fb67fe6abd06e354f81', 8, 1, 'MyApp', '[]', 0, '2020-05-04 00:51:51', '2020-05-04 00:51:51', '2021-05-04 06:21:51'),
('3eefdc18cd0b84698a0486bdce2fda9acbee6a1164af40058efdfc06670d1301b59b50f7735a4fb3', 8, 1, 'MyApp', '[]', 0, '2020-04-19 02:21:09', '2020-04-19 02:21:09', '2021-04-19 07:51:09'),
('41370cb3613114c94a32184ed40dab055fb32ed77847018cf87b79793ca68c8d6d31099b58df59d7', 6, 1, 'MyApp', '[]', 0, '2020-04-03 00:39:04', '2020-04-03 00:39:04', '2021-04-03 06:09:04'),
('481f4db7859714c30416a5f69c898a38c6b858667336bf39616a2acfb39b025ac5a7b8e41b2cf4b7', 6, 1, 'MyApp', '[]', 0, '2020-01-04 11:32:29', '2020-01-04 11:32:29', '2021-01-04 17:02:29'),
('4f9b27dc26339c19d7830344183218bd0f5a7128ee516220d7dc715ac601eab300a9b3b19bda15c3', 8, 1, 'MyApp', '[]', 0, '2020-01-06 01:39:16', '2020-01-06 01:39:16', '2021-01-06 07:09:16'),
('545c7921ef802d0779317dd00510f2a927f38b4a756f62388d13bd773bf7a37dfee5d076c7a7bf0f', 6, 1, 'MyApp', '[]', 0, '2020-01-04 11:13:17', '2020-01-04 11:13:17', '2021-01-04 16:43:17'),
('5a1291f8e5352502daa9a1a30da8d51fef09b6b38298e2eecd58633872ea3eee147504b13a260a1e', 6, 1, 'MyApp', '[]', 0, '2020-04-03 00:43:37', '2020-04-03 00:43:37', '2021-04-03 06:13:37'),
('5a415e333568b9ebde0573091583b7827bab4683cc7732867540cba3d4bae77c1b6e1b8559bdf7e0', 8, 1, 'MyApp', '[]', 0, '2020-04-25 09:53:53', '2020-04-25 09:53:53', '2021-04-25 15:23:53'),
('5ead67fad27c1e5b843a61829e19153dd88d0be69a4a4dc1355e3869accf59b6b7defe9786dfc544', 6, 1, 'MyApp', '[]', 0, '2020-01-04 05:09:25', '2020-01-04 05:09:25', '2021-01-04 10:39:25'),
('6262d88acf403d34ede4e982056e637cc36e1c592b3e15744413b6f8044da132afd3c2d1027a1082', 8, 1, 'MyApp', '[]', 0, '2020-04-25 01:54:52', '2020-04-25 01:54:52', '2021-04-25 07:24:52'),
('6a20edc5e167bdbfdaf2fcaad02ba28daf7da1a2ae6fff92e3b180514cfc9240918d2370b124354e', 8, 1, 'MyApp', '[]', 0, '2020-01-06 00:24:51', '2020-01-06 00:24:51', '2021-01-06 05:54:51'),
('6cdf7953934f17f7f38ce59c278714aadf9b9329009b7492e0066d66d8047d86e629a1143fc1190e', 8, 1, 'MyApp', '[]', 0, '2020-01-06 00:33:12', '2020-01-06 00:33:12', '2021-01-06 06:03:12'),
('700906c04556cf3a2bc0c79de2d402c8d2e1305454360cda0d5cde6cf21cddfff84ea675d8986deb', 6, 1, 'MyApp', '[]', 0, '2020-01-04 11:06:10', '2020-01-04 11:06:10', '2021-01-04 16:36:10'),
('7442f61211c7ef4a0f806fe4c26cd9ca8ea14114e26d8da72e8681278c12e89514811b97c9a57339', 6, 1, 'MyApp', '[]', 0, '2020-01-04 05:44:34', '2020-01-04 05:44:34', '2021-01-04 11:14:34'),
('7df5c3183a26cda121cde06551ef8a4db12c52d30411a3cc0f664e1ab8b1ffd2106550a4f2ad721a', 8, 1, 'MyApp', '[]', 0, '2020-01-06 00:39:59', '2020-01-06 00:39:59', '2021-01-06 06:09:59'),
('7e17b4da523948d87c88d3a7d45e3c8ce19fadaf6038fc0c6faa49a8cc8c589100abf41eced60409', 8, 1, 'MyApp', '[]', 0, '2020-05-10 01:15:32', '2020-05-10 01:15:32', '2021-05-10 06:45:32'),
('8259c97266c35359924fc708cbe12042b08d925ea3e73bba443317240bcf1e67387297c54a2aa12e', 6, 1, 'MyApp', '[]', 0, '2020-01-05 04:10:41', '2020-01-05 04:10:41', '2021-01-05 09:40:41'),
('8843fd96b68448c9c0d07713e6a0e7507b30e8b7831bfd1c95c71b17f9a8d5d6ca243ae2651e833b', 8, 1, 'MyApp', '[]', 0, '2020-05-07 11:09:34', '2020-05-07 11:09:34', '2021-05-07 16:39:34'),
('89faa2d2bd2f9641021b08775b4d5d94f14c58988edc6d671c6c868b5517077fd48566793b42841c', 6, 1, 'MyApp', '[]', 0, '2020-01-05 01:41:07', '2020-01-05 01:41:07', '2021-01-05 07:11:07'),
('8a2dde3f24e416ea86c614af27c46c6c9c807007f450a163989fd6c7736b26b9694d28aa828b6f15', 6, 1, 'MyApp', '[]', 0, '2020-01-04 11:33:56', '2020-01-04 11:33:56', '2021-01-04 17:03:56'),
('8f35cb7bf7c239a09f27f92712d798e1c09795f2f9cf0f9cf58dca9696ccc93262fab2de853ca8a4', 6, 1, 'MyApp', '[]', 0, '2020-01-05 22:34:27', '2020-01-05 22:34:27', '2021-01-06 04:04:27'),
('9052b5a5d66600d1ba54679c4c782b44b6a807ac811d84dba3dc2dc3d5d78b24d246ba5ce85fa5b1', 8, 1, 'MyApp', '[]', 0, '2020-05-10 01:33:13', '2020-05-10 01:33:13', '2021-05-10 07:03:13'),
('90eedf4d4f4a03b6e3b427eabacc49fe524e93df2878c659d701f51f8e8589c94260fbe758cdfc07', 8, 1, 'MyApp', '[]', 0, '2020-01-09 02:05:16', '2020-01-09 02:05:16', '2021-01-09 07:35:16'),
('927f3682a8b4cebac77067e4956ded51b11dca264dcf5d66cf7789f8519b7a99a681bc69928ce6b9', 6, 1, 'MyApp', '[]', 0, '2020-01-06 00:00:30', '2020-01-06 00:00:30', '2021-01-06 05:30:30'),
('941e2ce062c885c913a26d4c1bc21971d29dbc2791439f599d00ac350e8f450ce093d2f07e1fa1ce', 6, 1, 'MyApp', '[]', 0, '2020-01-04 08:49:31', '2020-01-04 08:49:31', '2021-01-04 14:19:31'),
('95ad393204eb4d06a37e7a605f143cf86c03f1551253c70b55f9692fb6d26e8391095563405c9f18', 8, 1, 'MyApp', '[]', 0, '2020-05-04 00:51:52', '2020-05-04 00:51:52', '2021-05-04 06:21:52'),
('96a854e76d7d1e32f40c10a4508c278756c8a28d3316045ca3ea9d40903826b1dc9109c32757e941', 8, 1, 'MyApp', '[]', 0, '2020-05-08 00:16:57', '2020-05-08 00:16:57', '2021-05-08 05:46:57'),
('97973387097b283e8fd4046a695428207e4d477099d5fd1f41a0b3b898161a5e2db317e4b08695fb', 8, 1, 'MyApp', '[]', 0, '2020-04-03 00:25:21', '2020-04-03 00:25:21', '2021-04-03 05:55:21'),
('9866999113b341bb74c58b731f48432b0e60cee2d1e99fb2d79785f0d0e265163dfac8dd483532ca', 6, 1, 'MyApp', '[]', 0, '2020-01-04 08:05:22', '2020-01-04 08:05:22', '2021-01-04 13:35:22'),
('99b3d58d9e22c74ffb3313557e2ec674a42e8e9061e14dbda1b92648594d455b7ddce9c8e91ca07f', 8, 1, 'MyApp', '[]', 0, '2020-05-10 01:05:11', '2020-05-10 01:05:11', '2021-05-10 06:35:11'),
('9c75c9d596a054540da663375635b62c9a8b7475a6ea9268005b054c2e2b28e8229aacb56f9dd593', 6, 1, 'MyApp', '[]', 0, '2020-01-04 11:01:22', '2020-01-04 11:01:22', '2021-01-04 16:31:22'),
('9db821c56fc6bf4105def6c06efb057cbe634dcf686779849a8b2df19ca1983e44666f23169a4bba', 6, 1, 'MyApp', '[]', 0, '2020-01-04 05:25:47', '2020-01-04 05:25:47', '2021-01-04 10:55:47'),
('9ec67f6ac0e47946be327212b37c453695bb9f62888df913d16b58e135b9ef73a8bba999e95ccd85', 6, 1, 'MyApp', '[]', 0, '2020-01-04 09:59:34', '2020-01-04 09:59:34', '2021-01-04 15:29:34'),
('9f14ae15d7d1143e13fc44a014a04e3e275f345b0a57ed03c6942dbb7402ff462c51d89a6c11bca4', 6, 1, 'MyApp', '[]', 0, '2020-01-04 05:28:13', '2020-01-04 05:28:13', '2021-01-04 10:58:13'),
('9fe6b37587ea3b0486164982d0e15abafc121cd3a741000a778d1f119a5b1faca31710d2aee41372', 6, 1, 'MyApp', '[]', 0, '2020-01-04 09:58:18', '2020-01-04 09:58:18', '2021-01-04 15:28:18'),
('a1ae759bc15e4ae3a8ddce9bca063ce93cceb52b39ca9c85459a1fb7d2e1238f1aeebba6a86577bf', 8, 1, 'MyApp', '[]', 0, '2020-01-06 23:18:58', '2020-01-06 23:18:58', '2021-01-07 04:48:58'),
('a4eeaed93777cd0bb38be15cb51587801df845411251d85bd340ad72791337f780fd9985e53c8578', 6, 1, 'MyApp', '[]', 0, '2020-04-03 00:38:42', '2020-04-03 00:38:42', '2021-04-03 06:08:42'),
('a59a7b499c2ff1357b8696fcffa5caf75a0aa488e2d44a201d4655a7fde5a9ba6f4745432fa1de70', 6, 1, 'MyApp', '[]', 0, '2020-01-04 05:28:57', '2020-01-04 05:28:57', '2021-01-04 10:58:57'),
('a9cbd6311aaaca0212695b4265e253680f41967dbc3e267145da36f3c8d944e9b70312bb174e1087', 6, 1, 'MyApp', '[]', 0, '2020-01-04 05:42:58', '2020-01-04 05:42:58', '2021-01-04 11:12:58'),
('ac2b805692bf202090e598cdb7500c11edc804b20fe04d927de02e593b9188531ba1295e1d9c53c6', 6, 1, 'MyApp', '[]', 0, '2020-01-05 01:49:52', '2020-01-05 01:49:52', '2021-01-05 07:19:52'),
('ada4ce8ddc64ab0be727c7627db578c84fe2a2315b838fe150eae8f3d9044e587113dabaee6cbeb2', 8, 1, 'MyApp', '[]', 0, '2020-01-06 02:05:00', '2020-01-06 02:05:00', '2021-01-06 07:35:00'),
('adcda254850635e82c27708437a34754eb2aee74badf7b1183925ef9e9840314706795ae34abdfa4', 6, 1, 'MyApp', '[]', 0, '2020-01-05 04:07:19', '2020-01-05 04:07:19', '2021-01-05 09:37:19'),
('ae4742fb5239f2cb249628e2b9cd73413de31d256980da6b7b9b82ee3e73dfac9efd647c84795859', 6, 1, 'MyApp', '[]', 0, '2020-04-03 00:37:29', '2020-04-03 00:37:29', '2021-04-03 06:07:29'),
('b0a468e2db80c8b620e1d153b30e3cd5eb376342630f5ce3b0b152431469e905d65d4d9f1c5d807b', 8, 1, 'MyApp', '[]', 0, '2020-01-06 23:17:05', '2020-01-06 23:17:05', '2021-01-07 04:47:05'),
('b3bad7050a1f88b2e2b2f8be55b9ad27298b4cfca0c3c138e3000f5dfe3828ec7012c08e257d1331', 6, 1, 'MyApp', '[]', 0, '2020-01-04 05:26:28', '2020-01-04 05:26:28', '2021-01-04 10:56:28'),
('b6833658e46c446f40b1f365abee200b3e7fcba813b2ad7515220b6feab25924039418557e556024', 6, 1, 'MyApp', '[]', 0, '2020-01-04 10:01:14', '2020-01-04 10:01:14', '2021-01-04 15:31:14'),
('b7769bb57323e0d1eea7d21ada657969629538634dc8e318bbdb6520ab9eaf91ab1bb1271587cbcc', 7, 1, 'MyApp', '[]', 0, '2020-01-04 11:21:25', '2020-01-04 11:21:25', '2021-01-04 16:51:25'),
('b8f7370737544180a8659143bb662a9efb27cdcdcb82b1d10a62ebb216ab0d885b5b47cba36e3554', 8, 1, 'MyApp', '[]', 0, '2020-01-07 05:31:30', '2020-01-07 05:31:30', '2021-01-07 11:01:30'),
('c42ffcaddb5b9409452d5fd981f62d75c9e0b1dee71c03d50417cb58379e8b8ff841dfd98a34f543', 8, 1, 'MyApp', '[]', 0, '2020-04-19 02:58:38', '2020-04-19 02:58:38', '2021-04-19 08:28:38'),
('c54e1a43c484e0a57d5ff104db3c1d8043f32ef99319f5c6eed46d7a3349ae82ef2ee3fb8af893d2', 8, 1, 'MyApp', '[]', 0, '2020-01-06 00:19:32', '2020-01-06 00:19:32', '2021-01-06 05:49:32'),
('ca89c790d59f6442d4dbdc2b128d3292c8792737d563ec7736bfa201444defecaef3a114e4b2e7f0', 6, 1, 'MyApp', '[]', 0, '2020-01-04 05:25:55', '2020-01-04 05:25:55', '2021-01-04 10:55:55'),
('ccad3423c14738c883f55c87dc9633664d1a470bf101111438c1cc8be6adf4267c49622c3a07d214', 6, 1, 'MyApp', '[]', 0, '2020-01-04 05:25:56', '2020-01-04 05:25:56', '2021-01-04 10:55:56'),
('ccc038b285a6379392b89b879dfd243019cd32d653414eb591bf9cddce6e3c59b825ee12376a67bb', 6, 1, 'MyApp', '[]', 0, '2020-01-05 22:36:29', '2020-01-05 22:36:29', '2021-01-06 04:06:29'),
('ce29f8ee170b064259d2e90082ae914fb68b8771fdbfceb654bba31936f2b4ceca209dd04ef588ad', 6, 1, 'MyApp', '[]', 0, '2020-04-03 00:44:13', '2020-04-03 00:44:13', '2021-04-03 06:14:13'),
('cf020cf4494853ec613edfd703886ad2894c764e025348dbd4c91a8301c09a673e638cb69bd33bc8', 6, 1, 'MyApp', '[]', 0, '2020-01-04 08:17:52', '2020-01-04 08:17:52', '2021-01-04 13:47:52'),
('cf607d75a73275422f4e3deee71f5f49d4b194012447bdc1842f44604fbc56b907999f847ff7de18', 8, 1, 'MyApp', '[]', 0, '2020-01-06 00:30:36', '2020-01-06 00:30:36', '2021-01-06 06:00:36'),
('d385b92f59d0ea7c42a7ff400be35df6f011acbd44e1aec8140ea9791f378ef483ae9d824d8ce4a2', 8, 1, 'MyApp', '[]', 0, '2020-05-10 01:15:09', '2020-05-10 01:15:09', '2021-05-10 06:45:09'),
('d54cf82cda9243b0330aee933af32b6bce0ef72a62a88ac0eaa1a4e114e470af58cf240a705b6f40', 6, 1, 'MyApp', '[]', 0, '2020-01-04 07:32:08', '2020-01-04 07:32:08', '2021-01-04 13:02:08'),
('db66574a0ec7e73769b6b765357bed1d298ac7972650c1d8ef882b2b739d7e6530ac3d001b8361ce', 6, 1, 'MyApp', '[]', 0, '2020-04-03 00:42:49', '2020-04-03 00:42:49', '2021-04-03 06:12:49'),
('dc1ce501b1718c68bedb3bc84e03ec258c5cf735b3da800e89a6609d7f9a944fb8793c9c1278e90d', 4, 1, 'MyApp', '[]', 0, '2020-01-03 05:58:08', '2020-01-03 05:58:08', '2021-01-03 11:28:08'),
('de1830ae05ec85da8fadeed133b714953a58e083ee0d69ad043142a25716c490cd22cc6f25909757', 6, 1, 'MyApp', '[]', 0, '2020-01-04 05:29:42', '2020-01-04 05:29:42', '2021-01-04 10:59:42'),
('de305895af8515589c92a129998beb93c40cd18984cb1ccb9aaa9f9a5077d4955960a76205b27852', 8, 1, 'MyApp', '[]', 0, '2020-05-10 05:19:27', '2020-05-10 05:19:27', '2021-05-10 10:49:27'),
('dffc6d566ab6a1334a967c4403f7f5a83c97d2c965da491a9b84a887df3b4aaabc5d6f1905a88695', 8, 1, 'MyApp', '[]', 0, '2020-04-07 00:33:06', '2020-04-07 00:33:06', '2021-04-07 06:03:06'),
('e18337a064ee47b0ab2f149d235226d37b9b288346b9b1239ff9d0dcb36e80119f1e77d20819a9db', 8, 1, 'MyApp', '[]', 0, '2020-05-07 22:45:07', '2020-05-07 22:45:07', '2021-05-08 04:15:07'),
('e4acae8eda69ac4329ea54cbd4cf2d5dd31de59299c1323508e597f298c94bf4566826662bce462a', 8, 1, 'MyApp', '[]', 0, '2020-04-25 00:25:35', '2020-04-25 00:25:35', '2021-04-25 05:55:35'),
('eabf7f9c81fba8796da3b9365debad890eae24d346d461e869b43f00670fad97b30d6c758df4f41d', 8, 1, 'MyApp', '[]', 0, '2020-04-25 05:27:01', '2020-04-25 05:27:01', '2021-04-25 10:57:01'),
('f0915e4fd1260df5c748953daa79f8f9188790dcc81e32c533157a5a5a026a275a30a8afd9dd5d96', 6, 1, 'MyApp', '[]', 0, '2020-01-05 04:07:24', '2020-01-05 04:07:24', '2021-01-05 09:37:24'),
('f14b3a059a8e48aed2350b7de8313acbe3c087f262f3681f12d2c15d25ef22723cfa8c0cb3cb13b6', 8, 1, 'MyApp', '[]', 0, '2020-04-13 23:21:46', '2020-04-13 23:21:46', '2021-04-14 04:51:46'),
('f41a241baa33b4cbd055613aa9270db7ebe17d07afab182dcbba303ee9763437ee61757b8354ed13', 8, 1, 'MyApp', '[]', 0, '2020-01-06 00:26:19', '2020-01-06 00:26:19', '2021-01-06 05:56:19'),
('f4ca2a566e3fd494bfcb40fd0ef352e5f057d486e404fa7b9d0e0529e1c217f54a1e2f28abf1c058', 6, 1, 'MyApp', '[]', 0, '2020-01-04 08:05:24', '2020-01-04 08:05:24', '2021-01-04 13:35:24'),
('f5d6e9459ef9bf413eed33c627d314d9b0518f61eafbfd0bff974894e7cbcd9b59cbb92c31ca14d3', 6, 1, 'MyApp', '[]', 0, '2020-01-05 00:38:06', '2020-01-05 00:38:06', '2021-01-05 06:08:06'),
('f6cd7128ff35f67c552c5ff809008b97ebb645991e9d69892f7db6271eeb22b42035a25f1476954a', 8, 1, 'MyApp', '[]', 0, '2020-01-07 08:19:16', '2020-01-07 08:19:16', '2021-01-07 13:49:16'),
('f90cea73fac53146337ba553629b9acefeafb4a7aadfac0dd9a338a772ab7aee9cc0817608ef9787', 8, 1, 'MyApp', '[]', 0, '2020-01-09 02:05:16', '2020-01-09 02:05:16', '2021-01-09 07:35:16'),
('fa33b07f244f1463718c18226a963eb8ed460e248955f136fe40e17296d72b01630a0be199f25cfb', 8, 1, 'MyApp', '[]', 0, '2020-04-04 11:29:30', '2020-04-04 11:29:30', '2021-04-04 16:59:30'),
('fd25a80ac40b08296ae713176248c5aef6b6918f0e759f2c04ec93dbe500b9543b9d502a3835e89b', 6, 1, 'MyApp', '[]', 0, '2020-04-03 00:26:16', '2020-04-03 00:26:16', '2021-04-03 05:56:16'),
('fdb7112611ec64961919b05ebcdd69f5c4de870cfb71bf223b4b3873952b0afbc8f7d719c6ffb89c', 8, 1, 'MyApp', '[]', 0, '2020-05-10 01:04:52', '2020-05-10 01:04:52', '2021-05-10 06:34:52');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'mXTnDC5u7JZ0Ue7sQn2RFAK14MTduUYHLaXyWZ4r', 'http://localhost', 1, 0, 0, '2020-01-01 07:23:41', '2020-01-01 07:23:41'),
(2, NULL, 'Laravel Password Grant Client', 'wfe0SKBOOVNcKLoWaA49gEDQb0xc9hVvfCTrIWdk', 'http://localhost', 0, 1, 0, '2020-01-01 07:23:41', '2020-01-01 07:23:41');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2020-01-01 07:23:41', '2020-01-01 07:23:41');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `menu_id` int(11) NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `menu_id`, `title`, `slug`, `description`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 0, 'About', 'about', 'descriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescription', 1, NULL, '2020-05-01 01:43:07'),
(2, 0, 'Services', 'services', 'dfsff', 1, NULL, '2020-05-01 01:42:30');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 'site_name', 'Blog Application', '2020-05-04 00:11:53', '2020-05-04 00:11:53'),
(2, 'site_title', 'Blog', '2020-05-04 00:11:53', '2020-05-04 00:11:53'),
(3, 'default_email_address', 'admin@admin.com', '2020-05-04 00:11:53', '2020-05-04 00:11:53'),
(4, 'site_logo', '', '2020-05-04 00:11:53', '2020-05-04 00:11:53'),
(5, 'site_favicon', '', '2020-05-04 00:11:53', '2020-05-04 00:11:53'),
(6, 'footer_copyright_text', '', '2020-05-04 00:11:53', '2020-05-04 00:11:53'),
(7, 'seo_meta_title', '', '2020-05-04 00:11:54', '2020-05-04 00:11:54'),
(8, 'seo_meta_description', '', '2020-05-04 00:11:54', '2020-05-04 00:11:54'),
(9, 'social_facebook', '', '2020-05-04 00:11:54', '2020-05-04 00:11:54'),
(10, 'social_twitter', '', '2020-05-04 00:11:54', '2020-05-04 00:11:54'),
(11, 'social_instagram', '', '2020-05-04 00:11:54', '2020-05-04 00:11:54'),
(12, 'social_linkedin', '', '2020-05-04 00:11:54', '2020-05-04 00:11:54'),
(13, 'google_analytics', '', '2020-05-04 00:11:54', '2020-05-04 00:11:54');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(4) NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `first_name`, `last_name`, `email`, `email_verified_at`, `password`, `is_active`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Quis quibusdam veniam deserunt id ea.', 'Connie Ankunding', 'Ms. Bette Hamill', 'herman.felton@yahoo.com', NULL, 'm0#6K@W(<.C', 1, NULL, '2020-01-03 08:32:57', '2020-01-03 08:32:57'),
(2, 'Officia corporis consequatur repellat atque est velit voluptatem ex.', 'Jovany Jones', 'Mr. Lazaro Batz III', 'joconner@gmail.com', NULL, 'LK$0T4EJa[bC3dv^EJ', 1, NULL, '2020-01-03 08:32:57', '2020-01-03 08:32:57'),
(3, 'Quia amet esse magnam repudiandae quia omnis vel.', 'Maia Paucek', 'Lloyd Ortiz', 'nils43@kihn.org', NULL, 'Ybo;cPe]rJ81LfsV', 1, NULL, '2020-01-03 08:32:57', '2020-01-03 08:32:57'),
(4, 'Reiciendis accusamus unde incidunt blanditiis et.', 'Frankie Hansen', 'Gaston Gusikowski', 'kenneth.zemlak@schmidt.com', NULL, '{&n5_1xDNp5fh7I=J5\\u', 1, NULL, '2020-01-03 08:32:57', '2020-01-03 08:32:57'),
(5, 'Consequatur sint tenetur et eius voluptatem necessitatibus rem.', 'Toby Hoeger V', 'Dr. Eloy Orn I', 'kohler.myles@hotmail.com', NULL, ',5<F;9jjC0F7q{', 1, NULL, '2020-01-03 08:32:57', '2020-01-03 08:32:57'),
(6, 'admin', 'vikas', 'gupta', 'vikas@gmail.com', NULL, '$2y$10$CTG.iJZ6RkvL/rDVeXui1OA7zBoi/PFzwyeWQmeoMAWq8GLFQXjfK', 1, NULL, '2020-01-03 08:36:17', '2020-01-03 08:36:17'),
(7, 'ak', 'sjd', 'asdd', 'ak@gmail.com', NULL, '$2y$10$WX06YA989EOfP7O4eo1yoeY6RdYNXBrzteN6wPf98sRoFiv7EenGm', 1, NULL, '2020-01-04 11:21:24', '2020-01-04 11:21:24'),
(8, 'vikas', 'vk', 'g', 'vk@gmail.com', NULL, '$2y$10$Sz.QIbXiVScTlmDwjQIzNONVjeYlGrNP5/cEhAaNggFRt3E5ulxaC', 1, NULL, '2020-01-06 00:19:31', '2020-01-06 00:19:31');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

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
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
