-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 22, 2020 at 03:46 PM
-- Server version: 5.7.25-28-log
-- PHP Version: 7.3.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbngv62yq2qe39`
--

-- --------------------------------------------------------

--
-- Table structure for table `aims`
--

CREATE TABLE `aims` (
  `id` int(11) NOT NULL,
  `stat_id` int(11) NOT NULL,
  `limit_id` int(11) NOT NULL,
  `value` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `hands`
--

CREATE TABLE `hands` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `limit_id` int(11) NOT NULL,
  `bb_count` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `hand_stats`
--

CREATE TABLE `hand_stats` (
  `id` int(11) NOT NULL,
  `hand_id` int(11) NOT NULL,
  `stat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `limits`
--

CREATE TABLE `limits` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(1, '2020_02_10_000000_user_roles', 1),
(2, '2020_02_10_000001_user_max_games_count', 1),
(3, '2020_02_10_000002_user_shares', 1),
(4, '2020_02_10_000003_create_user_records_table', 2),
(5, '2020_02_10_000004_create_user_stakes_table', 2),
(6, '2020_03_04_000000_add_id_field_to_user_stakes', 3),
(7, '2020_03_05_000000_change_transfer_fee_precision', 4);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `question_answers`
--

CREATE TABLE `question_answers` (
  `id` int(11) NOT NULL,
  `test_question_id` int(11) NOT NULL,
  `is_correct` tinyint(4) DEFAULT NULL,
  `answer` mediumtext,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `question_answers`
--

INSERT INTO `question_answers` (`id`, `test_question_id`, `is_correct`, `answer`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '1', '2020-02-24 11:01:33', '2020-02-28 14:47:34'),
(2, 1, NULL, '2', '2020-02-24 11:01:33', '2020-02-28 14:47:34'),
(3, 1, NULL, '3', '2020-02-28 14:47:34', '2020-02-28 14:47:34'),
(4, 2, NULL, '2', '2020-02-28 14:47:46', '2020-02-28 14:47:46'),
(5, 2, NULL, '3', '2020-02-28 14:47:46', '2020-02-28 14:47:46'),
(6, 2, 1, '1', '2020-02-28 14:47:46', '2020-02-28 14:47:46');

-- --------------------------------------------------------

--
-- Table structure for table `stakes`
--

CREATE TABLE `stakes` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `stake_value` decimal(10,2) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `stats`
--

CREATE TABLE `stats` (
  `id` int(11) NOT NULL,
  `code` varchar(45) DEFAULT NULL,
  `street` enum('PREFLOP','FLOP','TURN','RIVER') DEFAULT NULL,
  `preflop` enum('LIMP','RAISE') DEFAULT NULL,
  `nicename` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tests`
--

CREATE TABLE `tests` (
  `id` int(11) NOT NULL,
  `tests_categories_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `questions_no` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tests`
--

INSERT INTO `tests` (`id`, `tests_categories_id`, `name`, `questions_no`, `created_at`, `updated_at`) VALUES
(1, 1, 'INTRO', 10, '2020-02-23 20:51:51', '2020-02-23 20:51:51');

-- --------------------------------------------------------

--
-- Table structure for table `tests_categories`
--

CREATE TABLE `tests_categories` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tests_categories`
--

INSERT INTO `tests_categories` (`id`, `parent_id`, `name`, `created_at`, `updated_at`) VALUES
(1, NULL, 'INTRO', '2020-02-23 20:51:37', '2020-02-23 20:51:37');

-- --------------------------------------------------------

--
-- Table structure for table `test_questions`
--

CREATE TABLE `test_questions` (
  `id` int(11) NOT NULL,
  `test_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `question` mediumtext,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `test_questions`
--

INSERT INTO `test_questions` (`id`, `test_id`, `title`, `question`, `created_at`, `updated_at`) VALUES
(1, 1, 'sfddsf', '<p>sdfsdf</p>', '2020-02-24 11:01:33', '2020-02-24 11:01:33'),
(2, 1, 'asdas', '<p>asdasd</p>', '2020-02-28 14:47:46', '2020-02-28 14:47:46');

-- --------------------------------------------------------

--
-- Table structure for table `tutorials`
--

CREATE TABLE `tutorials` (
  `id` int(11) NOT NULL,
  `tutorials_category_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `content` mediumtext,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tutorials`
--

INSERT INTO `tutorials` (`id`, `tutorials_category_id`, `name`, `content`, `created_at`, `updated_at`) VALUES
(1, 1, 'test tutoria', '<p>asfasf</p>', '2020-02-28 14:44:38', '2020-02-28 14:44:38');

-- --------------------------------------------------------

--
-- Table structure for table `tutorials_categories`
--

CREATE TABLE `tutorials_categories` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tutorials_categories`
--

INSERT INTO `tutorials_categories` (`id`, `parent_id`, `name`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Kategorija', '2020-02-28 14:11:53', '2020-02-28 14:11:53');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `role` varchar(10) NOT NULL DEFAULT 'user',
  `limit_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `profit_share` int(10) UNSIGNED NOT NULL DEFAULT '50',
  `ft_profit_share` decimal(10,2) UNSIGNED NOT NULL DEFAULT '36.00',
  `st_profit_share` decimal(10,2) UNSIGNED NOT NULL DEFAULT '64.00',
  `tt_profit_share` decimal(10,2) UNSIGNED NOT NULL DEFAULT '18.00',
  `fth_profit_share` decimal(10,2) UNSIGNED NOT NULL DEFAULT '12.00',
  `affiliate_share` decimal(10,2) UNSIGNED NOT NULL DEFAULT '0.00',
  `transfer_fee` decimal(15,4) NOT NULL DEFAULT '0.0001',
  `max_games_count` int(10) UNSIGNED NOT NULL DEFAULT '35000',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role`, `limit_id`, `name`, `email`, `profit_share`, `ft_profit_share`, `st_profit_share`, `tt_profit_share`, `fth_profit_share`, `affiliate_share`, `transfer_fee`, `max_games_count`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', NULL, 'admin', 'admin@pokergang.com', 50, '35.00', '65.00', '18.00', '12.00', '0.00', '0.0100', 35000, NULL, '$2y$10$7Hvha/cx1o7L8TlfuI36UuheZOqhZMjIfQf/JwUJ2KiCi6ize..Ee', 'h05w6bQueI9C2RZLLWOLBSGKsphJNMzsywZYRBfem7tSV0glAeqUuEMae5qk', '2020-02-12 09:31:08', '2020-03-05 12:10:09'),
(2, 'user', NULL, 'user', 'user@pokergang.com', 50, '36.00', '64.00', '18.00', '12.00', '0.00', '0.0100', 35000, NULL, '$2y$10$KuBLfFcA83RdI0L6Gafo5uIDXFmZ3HrBgK.ov3ZncFP3f7Z.zeF0y', 'GIwLC38NNSehRLla2Drp1V8ObydrsA9rygB1BhTXgjzq1q6l6LvzaaIL1f6U', '2020-02-12 09:31:34', '2020-02-12 09:31:34'),
(3, 'user', NULL, 'tst', 'marciusg5@gmail.com', 50, '60.00', '20.00', '1.00', '1.00', '1.00', '0.0145', 35000, NULL, '$2y$10$AlwliTR2oSo3xvP5F151c.4E/UV3NkirDCr3C6/6hDRSlx01LcPFq', NULL, '2020-02-26 22:48:15', '2020-03-11 22:39:30'),
(4, 'user', NULL, 'deimaxas', 'Deimaxas@gmail.com', 50, '34.25', '65.75', '17.50', '14.00', '0.00', '0.0145', 35000, NULL, '$2y$10$lUOD9Nr6qXvkPPRjyKG9p.e/RTMb1jokHIA.N02jqwgTsnCeCsrYG', NULL, '2020-03-03 14:57:12', '2020-03-12 13:37:12'),
(5, 'user', NULL, 'devil ray', 'mantukk20@gmail.com', 50, '34.25', '65.75', '17.50', '14.00', '0.00', '0.0145', 35000, NULL, '$2y$10$/gNt8Vl7uyfBMXWoWxH1Vu.xtQ4HeB7Atygap2g0hbIlYK01DfOhm', NULL, '2020-03-03 14:59:28', '2020-03-12 14:15:55'),
(6, 'user', NULL, 'gwalagwala', 'nanatanas@gmail.com', 45, '34.25', '65.75', '17.50', '14.00', '0.00', '0.0145', 35000, NULL, '$2y$10$0XtkmXlvZBbbj2vONNs4xuUvEut7Zwq0Dn4WNMpi/iodSFqfjWS/q', NULL, '2020-03-03 15:00:27', '2020-03-12 14:35:26'),
(7, 'user', NULL, 'justelis13', 'j.poviliunas@gmail.com', 50, '34.25', '65.75', '17.50', '14.00', '0.00', '0.0001', 35000, NULL, '$2y$10$AEhyK2zOHi6JRFY84P5siOi9ccer3hnQN8Ysa8NljxEmrR7Z.LxEW', NULL, '2020-03-10 16:33:40', '2020-03-12 14:55:37'),
(8, 'user', NULL, 'ipodasx9', 'deividaslukosius@yahoo.com', 50, '34.25', '65.75', '17.50', '14.00', '0.00', '0.0145', 35000, NULL, '$2y$10$r08Ly73j5lOcFV86nhmzM.0fdERXaos/pTvjZGKa.iC1uOfTcoUMa', NULL, '2020-03-10 16:58:43', '2020-03-12 15:00:09'),
(9, 'user', NULL, 'karolinhoo', 'Karolisvilimaitis@yahoo.com', 50, '34.25', '65.75', '17.50', '14.00', '0.00', '0.0145', 35000, NULL, '$2y$10$YlhmyKOgMhtypVudB3WU0OIiuRZkidLaycVdrmvBqzqUY7lIXl5pu', NULL, '2020-03-10 17:11:56', '2020-03-12 15:16:39'),
(10, 'user', NULL, 'kevindurant9', 'Klaidasdz@gmail.com', 50, '34.25', '65.75', '17.50', '14.00', '0.00', '0.0145', 35000, NULL, '$2y$10$2.3yRQE/nUNdqJhl3Qu2uObKHs7vyQaI0oSZLQy4BsqqcHyGUNHUC', NULL, '2020-03-10 18:16:38', '2020-03-12 15:26:24'),
(11, 'user', NULL, 'kosmo29', 'edvinaspaulauskas29@gmail.com', 45, '34.25', '65.75', '17.50', '14.00', '0.00', '0.0145', 35000, NULL, '$2y$10$yGjO/v3AbUlXTNjGW50kZ.SURXEoNxiCkVqR4es3h1OvC2wfS.BwS', NULL, '2020-03-10 19:38:28', '2020-03-12 15:36:51'),
(12, 'user', NULL, 'Th3endisnear', 'obuoliukas@inbox.lt', 40, '34.25', '65.75', '17.50', '14.00', '0.00', '0.0145', 35000, NULL, '$2y$10$asFreVB/rZmkwPypYxwnn.r3mYxNsM5M5ZZHIh.BlvBBGDucVY1wW', NULL, '2020-03-10 20:24:48', '2020-03-12 15:50:39'),
(13, 'user', NULL, 'Ovidijus', 'ovidijussv@ymail.com', 50, '34.25', '65.75', '17.50', '14.00', '0.00', '0.0145', 35000, NULL, '$2y$10$izQ8vpXMgncVN7BSOpRbwuGHOFL6QSKKJ9XK6mqYzQ0ZfGjp1y1na', NULL, '2020-03-12 15:52:59', '2020-03-12 16:02:50'),
(14, 'user', NULL, 'pasiutusvove', 'smack_2000@mail.ru', 50, '34.25', '65.75', '17.50', '14.00', '0.00', '0.0145', 35000, NULL, '$2y$10$/Im.hhbCHwV5x/Xhxxb3RO5kE1AqbQjvj30B8mjbn3mV1.LHz84tu', NULL, '2020-03-12 17:58:02', '2020-03-12 18:26:29'),
(15, 'user', NULL, 'slaptas_ltu', 'paulioox@yahoo.com', 50, '34.25', '65.75', '17.50', '14.00', '0.00', '0.0145', 35000, NULL, '$2y$10$XYDMw07ZKP8BYt2TDg2j8edG5S.EJvA1y3.OjEuYfqfak3box5TIG', NULL, '2020-03-12 18:30:44', '2020-03-12 18:40:13'),
(16, 'user', NULL, 'sobieskiuoga', 'arturas.stasytis@gmail.com', 50, '34.25', '65.75', '17.50', '14.00', '0.00', '0.0145', 35000, NULL, '$2y$10$z/TparEZaV67V.gs7aFhCuHYYpt4wsZorlZkIsZ.5KiLknZsyj3ai', NULL, '2020-03-12 18:43:00', '2020-03-12 18:53:23'),
(17, 'user', NULL, 'BulldogMode', 'robcikas4you@gmail.com', 23, '34.25', '65.75', '17.50', '14.00', '0.00', '0.0145', 35000, NULL, '$2y$10$ak6J6Sl4XRoPmcHef3OAl.x2vFt8C026zQZm/NqYMg/9Iw97Bh05K', NULL, '2020-03-12 18:55:06', '2020-03-12 19:07:36'),
(18, 'user', NULL, 'solidniko159', 'Edvamilak@gmail.com', 50, '34.25', '65.75', '17.50', '14.00', '0.00', '0.0145', 35000, NULL, '$2y$10$FcpA60gjEGrDDg16Rprcn.InVodq1IZ9ALxOTJ4sTFKHD4WUQSsB2', NULL, '2020-03-12 19:09:22', '2020-03-12 19:18:05'),
(19, 'user', NULL, 'tamosh0', 'tamlukas94@gmail.com', 50, '34.25', '65.75', '17.50', '14.00', '0.00', '0.0145', 35000, NULL, '$2y$10$6RQUoCVtMgHQPj.mPfDmqOTTYOK4bgW8tbNebe9fWSqxynzB38k4K', NULL, '2020-03-12 19:20:39', '2020-03-12 19:26:54'),
(20, 'user', NULL, 'tc2580', 'daraskairmantas@gmail.com', 50, '34.25', '65.75', '17.50', '14.00', '0.00', '0.0145', 35000, NULL, '$2y$10$9QkCTAxXB/AAsR8JXNuWSO0tBMjCGVE/I.wd3f/b483PUjyaJWzPa', NULL, '2020-03-12 19:39:27', '2020-03-12 19:45:42'),
(21, 'user', NULL, 'TindiRindi', 'gintaredubinskaite.gd@gmail.com', 50, '34.25', '65.75', '17.50', '14.00', '0.00', '0.0145', 35000, NULL, '$2y$10$9P6cXr0QVnakZENhrpVTjuq1BRxMM3SK7NHOPAYK74bxRi453uxBW', NULL, '2020-03-12 19:47:35', '2020-03-12 19:57:57'),
(22, 'user', NULL, 'VaGirdva', 'Vyt.girdvainis@gmail.com', 50, '34.25', '65.75', '17.50', '14.00', '0.00', '0.0145', 35000, NULL, '$2y$10$FOuchgQ82ngRfE1N3f5VIemMJigqSG4Kmab4TVeDcPJvcBXHmbx5S', NULL, '2020-03-12 20:00:06', '2020-03-12 20:04:10'),
(23, 'user', NULL, 'Vale8', 'mitkusvalentas@gmail.com', 50, '34.25', '65.75', '17.50', '14.00', '0.00', '0.0145', 35000, NULL, '$2y$10$x9Zx8hslb/0iIVjmWYSDiO0wXCiWRN6rCSzjSqntzhWFvK83bBdLS', NULL, '2020-03-12 20:06:53', '2020-03-12 20:16:34'),
(24, 'user', NULL, 'Vanilka', 'gediminas.iv@gmail.com', 50, '34.25', '65.75', '17.50', '14.00', '0.00', '0.0145', 35000, NULL, '$2y$10$JheWTNlup9UykFvwxuzflOGrmwT1x9uvQpQiUtCotVecDSBjBqBGC', NULL, '2020-03-12 20:19:22', '2020-03-12 20:30:14'),
(25, 'user', NULL, 'WarriorKid', 'arthur777man@gmail.com', 50, '34.25', '65.75', '17.50', '14.00', '0.00', '0.0145', 35000, NULL, '$2y$10$Ujt7ujaxqguevklli8AhI.lou07fn759rxKjtNQBdn0LZbSg94yeG', NULL, '2020-03-12 20:31:55', '2020-03-12 20:45:34'),
(26, 'user', NULL, 'mokuso', 'sisimbajevasedgaras@gmail.com', 50, '34.25', '65.75', '17.50', '14.00', '0.00', '0.0145', 35000, NULL, '$2y$10$Z8f3jV8LB/iqbKLKRDXZ/.tJuGXqDVQX34SqYyZXJbOxgaQj.Xr42', NULL, '2020-03-12 20:47:56', '2020-03-12 20:56:27'),
(27, 'user', NULL, 'PGBenDover', 'catdogjewel@gmail.com', 50, '36.00', '64.00', '18.00', '10.00', '0.00', '0.0145', 35000, NULL, '$2y$10$eMZx90WtBs3LXp6ECkpjUuDP0.tchjxvRf.vUhnXDeuNqQProw6x2', NULL, '2020-03-12 20:58:02', '2020-03-12 20:59:09'),
(28, 'user', NULL, 'ZuviesTaukai', 'mantukkk20@gmail.com', 45, '34.25', '65.75', '17.50', '14.00', '0.00', '0.0145', 35000, NULL, '$2y$10$qqzN3cbU6/c5d2Wp2hJ7k.hBP6eq8VW9VN3YCQYgOTcAMTuhXbamO', NULL, '2020-03-12 21:07:30', '2020-03-12 21:16:09');

-- --------------------------------------------------------

--
-- Table structure for table `user_completed_tutorials`
--

CREATE TABLE `user_completed_tutorials` (
  `id` int(11) NOT NULL,
  `tutorials_id` int(11) NOT NULL,
  `users_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user_completed_videos`
--

CREATE TABLE `user_completed_videos` (
  `id` int(11) NOT NULL,
  `users_id` bigint(20) NOT NULL,
  `videos_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user_records`
--

CREATE TABLE `user_records` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `owner_id` bigint(20) UNSIGNED NOT NULL,
  `bankroll` decimal(15,2) NOT NULL,
  `games_count` int(10) UNSIGNED NOT NULL,
  `winamax_photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pt4_photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stake` decimal(15,2) NOT NULL DEFAULT '0.00',
  `cashout` decimal(15,2) NOT NULL DEFAULT '0.00',
  `ft_cashout` decimal(15,2) NOT NULL DEFAULT '0.00',
  `st_cashout` decimal(15,2) NOT NULL DEFAULT '0.00',
  `tt_cashout` decimal(10,2) NOT NULL DEFAULT '0.00',
  `fth_cashout` decimal(10,2) NOT NULL DEFAULT '0.00',
  `af_cashout` decimal(15,2) NOT NULL DEFAULT '0.00',
  `action` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'without_answer',
  `recorded_at` date NOT NULL,
  `is_ft_paid` tinyint(1) NOT NULL DEFAULT '0',
  `is_st_paid` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_records`
--

INSERT INTO `user_records` (`id`, `owner_id`, `bankroll`, `games_count`, `winamax_photo`, `pt4_photo`, `stake`, `cashout`, `ft_cashout`, `st_cashout`, `tt_cashout`, `fth_cashout`, `af_cashout`, `action`, `recorded_at`, `is_ft_paid`, `is_st_paid`, `created_at`, `updated_at`) VALUES
(1, 2, '200.00', 326, 'http://win', 'http://pt', '140.00', '60.00', '10.75', '19.11', '0.00', '0.00', '0.00', 'cashout', '2020-03-02', 0, 0, '2020-02-19 19:55:52', '2020-03-10 15:59:29'),
(2, 4, '107.40', 192, 'https://i.imgur.com/3FbLbvA.png', 'https://i.imgur.com/3FbLbvA.png', '50.00', '57.40', '14.10', '14.10', '0.00', '0.00', '0.00', 'cashout', '2019-04-01', 1, 1, '2020-03-04 16:22:46', '2020-03-12 12:43:40'),
(3, 1, '50.00', 300, 'https://i.imgur.com/3FbLbvA.png', 'https://i.imgur.com/3FbLbvA.png', '100.00', '0.00', '3.39', '6.37', '0.00', '0.00', '0.00', 'small_profit', '2020-03-02', 1, 0, '2020-03-04 16:29:30', '2020-03-06 12:48:50'),
(4, 4, '40.00', 224, 'https://i.imgur.com/Ui08zXL.png', 'https://i.imgur.com/wij8EXr.png', '50.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-04-15', 1, 1, '2020-03-04 21:02:59', '2020-03-12 12:01:43'),
(5, 4, '326.00', 377, 'https://i.imgur.com/qtEiPhA.png', 'https://i.imgur.com/WKLQI8j.png', '200.00', '126.00', '31.25', '31.25', '0.00', '0.00', '0.00', 'cashout', '2019-04-29', 1, 1, '2020-03-04 21:04:59', '2020-03-12 12:42:20'),
(6, 4, '367.00', 294, 'https://i.imgur.com/qtEiPhA.png', 'https://i.imgur.com/TZ9yCCe.png', '200.00', '167.00', '41.44', '41.44', '0.00', '0.00', '0.00', 'cashout', '2019-05-13', 1, 1, '2020-03-04 21:06:41', '2020-03-12 12:39:25'),
(8, 4, '245.00', 97, 'https://i.imgur.com/AIsBjY8.png', 'https://i.imgur.com/4WqQhBA.png', '200.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-05-27', 1, 1, '2020-03-05 20:53:25', '2020-03-05 21:19:12'),
(9, 4, '175.00', 226, 'https://i.imgur.com/b2vMFsL.png', 'https://i.imgur.com/OGzMR0u.png', '200.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-06-10', 1, 1, '2020-03-05 20:54:32', '2020-03-05 21:19:23'),
(10, 4, '166.00', 155, 'https://i.imgur.com/xxWFvWT.png', 'https://i.imgur.com/A7KIDe0.png', '200.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-06-24', 1, 1, '2020-03-05 20:55:50', '2020-03-05 21:19:24'),
(11, 4, '216.00', 226, 'https://i.imgur.com/XixKg6O.png', 'https://i.imgur.com/mjCvZq7.png', '200.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-07-08', 1, 1, '2020-03-05 20:56:46', '2020-03-05 21:19:26'),
(13, 4, '373.00', 180, 'https://i.imgur.com/CqcVoCo.png', 'https://i.imgur.com/q3yZ8rk.png', '200.00', '173.00', '42.93', '42.93', '0.00', '0.00', '0.00', 'cashout', '2019-07-22', 1, 1, '2020-03-05 21:02:18', '2020-03-12 12:42:57'),
(14, 4, '345.00', 325, 'https://i.imgur.com/KLxNEI9.png', 'https://i.imgur.com/cgCBPry.png', '200.00', '145.00', '28.75', '43.18', '14.39', '0.00', '0.00', 'cashout', '2019-08-05', 1, 1, '2020-03-05 21:06:53', '2020-03-12 13:01:33'),
(17, 4, '290.00', 219, 'https://i.imgur.com/i9WPVpY.png', 'https://i.imgur.com/5qg7Nkt.png', '200.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-08-19', 1, 1, '2020-03-05 21:15:35', '2020-03-05 21:19:28'),
(18, 4, '540.00', 425, 'https://i.imgur.com/61oYef1.png', 'https://i.imgur.com/cl8XDg4.png', '400.00', '140.00', '24.95', '44.47', '12.50', '6.94', '0.00', 'cashout', '2019-09-02', 1, 1, '2020-03-05 21:17:17', '2020-03-12 13:14:07'),
(19, 4, '640.00', 470, 'https://i.imgur.com/JK1D383.png', 'https://i.imgur.com/KRdRAOc.png', '400.00', '240.00', '42.88', '76.24', '21.44', '11.91', '0.00', 'cashout', '2019-09-16', 1, 1, '2020-03-05 21:20:31', '2020-03-12 13:15:11'),
(20, 4, '310.00', 305, 'https://i.imgur.com/GcNTjvE.png', 'https://i.imgur.com/bPAlaS4.png', '400.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-09-30', 1, 1, '2020-03-05 21:21:39', '2020-03-05 21:21:45'),
(21, 4, '544.40', 296, 'https://i.imgur.com/sOXgmeW.png', 'https://i.imgur.com/zbohj7z.png', '400.00', '144.40', '25.74', '45.87', '12.89', '7.16', '0.00', 'cashout', '2019-10-14', 1, 1, '2020-03-05 21:22:33', '2020-03-12 13:20:55'),
(22, 4, '280.00', 388, 'https://i.imgur.com/QkZbSWL.png', 'https://i.imgur.com/OlygA0g.png', '400.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-10-28', 1, 1, '2020-03-05 21:24:11', '2020-03-05 21:25:12'),
(23, 4, '770.00', 656, 'https://i.imgur.com/9sHFB0L.png', 'https://i.imgur.com/ZWLNGUh.png', '400.00', '370.00', '66.11', '117.54', '33.06', '18.37', '0.00', 'cashout', '2019-11-11', 1, 1, '2020-03-05 21:25:02', '2020-03-12 13:18:32'),
(24, 4, '380.00', 54, 'https://i.imgur.com/eCij3ap.png', 'https://i.imgur.com/FDVANEc.png', '400.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-11-25', 1, 1, '2020-03-05 21:25:51', '2020-03-05 21:26:29'),
(25, 4, '365.00', 240, 'https://i.imgur.com/TnounMc.png', 'https://i.imgur.com/AbXtOMQ.png', '400.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-12-09', 1, 1, '2020-03-05 21:26:23', '2020-03-05 21:26:29'),
(26, 4, '545.00', 268, 'https://i.imgur.com/mMJ1N7S.png', 'https://i.imgur.com/I1Klf3I.png', '400.00', '145.00', '25.85', '46.06', '12.94', '7.19', '0.00', 'cashout', '2019-12-23', 1, 1, '2020-03-05 21:27:05', '2020-03-12 13:27:44'),
(27, 4, '510.00', 407, 'https://i.imgur.com/IWsWr4F.png', 'https://i.imgur.com/WuXftYU.png', '400.00', '110.00', '19.00', '35.49', '9.81', '6.54', '0.00', 'cashout', '2020-01-06', 0, 0, '2020-03-05 21:29:34', '2020-03-12 13:30:34'),
(28, 4, '377.00', 215, 'https://i.imgur.com/tByVIfA.png', 'https://i.imgur.com/Ia7azyh.png', '400.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2020-01-20', 0, 0, '2020-03-05 21:37:37', '2020-03-05 21:37:37'),
(29, 4, '232.00', 302, 'https://i.imgur.com/plbOaZ5.png', 'https://i.imgur.com/iDxcef1.png', '400.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2020-02-03', 0, 0, '2020-03-05 21:38:20', '2020-03-05 21:38:20'),
(30, 5, '552.00', 644, 'https://imgur.com/a/UbltHST', 'https://imgur.com/a/Rwt4cWE', '150.00', '402.00', '99.77', '99.77', '0.00', '0.00', '0.00', 'cashout', '2019-05-27', 0, 0, '2020-03-05 21:44:09', '2020-03-12 13:59:15'),
(31, 5, '440.00', 676, 'https://imgur.com/a/J7ivlNI', 'https://imgur.com/a/4PqHglY', '150.00', '290.00', '71.97', '71.97', '0.00', '0.00', '0.00', 'cashout', '2019-06-10', 0, 0, '2020-03-05 21:44:45', '2020-03-12 13:59:25'),
(32, 5, '250.00', 491, 'https://imgur.com/FSJlwAG', 'https://imgur.com/nX08aRr', '150.00', '100.00', '24.75', '24.75', '0.00', '0.00', '0.00', 'cashout', '2019-06-24', 0, 0, '2020-03-05 21:45:39', '2020-03-12 13:59:33'),
(33, 5, '25.00', 688, 'https://imgur.com/sJj9yUv', 'https://imgur.com/OjKz3MB', '200.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-07-08', 0, 0, '2020-03-05 21:46:35', '2020-03-05 21:46:35'),
(34, 5, '126.00', 619, 'https://imgur.com/3yKl3AR', 'https://imgur.com/3HvjD0X', '350.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-07-22', 0, 0, '2020-03-05 21:47:41', '2020-03-05 21:47:41'),
(36, 5, '203.00', 321, 'https://i.imgur.com/eS36OHV.png', 'https://i.imgur.com/bmncRwD.png', '350.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-08-05', 0, 0, '2020-03-05 21:51:33', '2020-03-05 21:51:33'),
(37, 5, '623.00', 511, 'https://i.imgur.com/uzYRyCq.png', 'https://i.imgur.com/QA0qRFB.png', '350.00', '273.00', '48.78', '86.72', '24.39', '13.55', '0.00', 'cashout', '2019-08-19', 0, 0, '2020-03-05 21:53:11', '2020-03-12 14:00:35'),
(39, 5, '550.00', 213, 'https://imgur.com/CzAcq5f', 'https://imgur.com/Dm5kD0y', '550.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-09-02', 0, 0, '2020-03-05 21:54:59', '2020-03-05 21:55:02'),
(40, 5, '650.39', 211, 'https://imgur.com/a/qTI4Od0', 'https://imgur.com/r8t5z0W', '550.00', '100.39', '17.82', '31.87', '8.94', '4.97', '0.00', 'cashout', '2019-09-16', 0, 0, '2020-03-05 21:56:04', '2020-03-12 14:01:46'),
(41, 5, '1140.00', 213, 'https://imgur.com/7kRBaXY', 'https://imgur.com/3SHqQaE', '550.00', '590.00', '105.43', '187.43', '52.71', '29.29', '0.00', 'cashout', '2019-09-30', 0, 0, '2020-03-05 21:57:06', '2020-03-12 14:02:18'),
(42, 5, '1120.00', 297, 'https://imgur.com/C10xbQw', 'https://imgur.com/mfzm7fM', '550.00', '570.00', '101.85', '181.07', '50.93', '28.29', '0.00', 'cashout', '2019-10-14', 0, 0, '2020-03-05 21:59:13', '2020-03-12 14:02:31'),
(43, 5, '490.00', 276, 'https://imgur.com/4Ar7EcF', 'https://imgur.com/eMPMNrw', '550.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-10-28', 0, 0, '2020-03-05 21:59:54', '2020-03-05 21:59:54'),
(44, 5, '630.00', 55, 'https://imgur.com/eH5zjn9', 'https://imgur.com/mR85fIi', '550.00', '80.00', '14.15', '25.35', '7.11', '3.95', '0.00', 'cashout', '2019-11-11', 0, 0, '2020-03-05 22:00:23', '2020-03-12 14:02:47'),
(45, 5, '700.00', 315, 'https://imgur.com/7BoRFm4', 'https://imgur.com/6UCkpBN', '550.00', '150.00', '26.75', '47.65', '13.39', '7.44', '0.00', 'cashout', '2019-11-25', 0, 0, '2020-03-05 22:00:50', '2020-03-12 14:03:10'),
(46, 5, '920.00', 208, 'https://imgur.com/mdW0leC', 'https://imgur.com/Degw4WV', '550.00', '370.00', '66.11', '117.54', '33.06', '18.37', '0.00', 'cashout', '2019-12-09', 0, 0, '2020-03-05 22:02:00', '2020-03-12 14:04:00'),
(47, 5, '415.00', 348, 'https://imgur.com/5CPYdzq', 'https://imgur.com/Sxq2eUn', '550.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-12-23', 0, 0, '2020-03-05 22:02:39', '2020-03-05 22:02:39'),
(48, 6, '803.00', 1538, 'https://i.imgur.com/vnR7ZmX.png', 'https://i.imgur.com/VZzEQaj.png', '500.00', '303.00', '75.20', '75.20', '0.00', '0.00', '0.00', 'cashout', '2019-04-29', 0, 0, '2020-03-10 16:02:46', '2020-03-12 14:26:18'),
(49, 6, '900.00', 1346, 'https://i.imgur.com/kREJ1R2.png', 'https://i.imgur.com/RIxLQtI.png', '750.00', '150.00', '37.22', '37.22', '0.00', '0.00', '0.00', 'cashout', '2019-05-13', 0, 0, '2020-03-10 16:04:05', '2020-03-12 14:26:30'),
(50, 6, '750.00', 1562, 'https://i.imgur.com/rqj4I45.png', 'https://i.imgur.com/jRx9XfZ.png', '750.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-05-27', 0, 0, '2020-03-10 16:04:59', '2020-03-10 16:05:02'),
(51, 6, '1100.00', 1187, 'https://i.imgur.com/zorLEhH.png', 'https://i.imgur.com/w2skSfB.png', '750.00', '350.00', '86.86', '86.86', '0.00', '0.00', '0.00', 'cashout', '2019-06-10', 0, 0, '2020-03-10 16:05:37', '2020-03-12 14:26:44'),
(52, 6, '1305.00', 763, 'https://i.imgur.com/UB7igiG.png', 'https://i.imgur.com/kwthd4D.png', '750.00', '555.00', '137.74', '137.74', '0.00', '0.00', '0.00', 'cashout', '2019-06-24', 0, 0, '2020-03-10 16:06:08', '2020-03-12 14:26:51'),
(53, 6, '735.00', 934, 'https://i.imgur.com/wJqh7rw.png', 'https://i.imgur.com/ShLJI1S.png', '1000.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-07-08', 0, 0, '2020-03-10 16:07:43', '2020-03-10 16:07:43'),
(54, 6, '1200.00', 923, 'https://i.imgur.com/XE3LJ1D.png', 'https://i.imgur.com/lOLoCK8.png', '1000.00', '200.00', '49.63', '49.63', '0.00', '0.00', '0.00', 'cashout', '2019-07-22', 0, 0, '2020-03-10 16:08:39', '2020-03-12 14:27:06'),
(55, 6, '1360.00', 994, 'https://i.imgur.com/GN6CXRB.png', 'https://i.imgur.com/lkISoGd.png', '1000.00', '360.00', '71.47', '107.21', '35.74', '0.00', '0.00', 'cashout', '2019-08-05', 0, 0, '2020-03-10 16:11:16', '2020-03-12 14:28:09'),
(56, 6, '1360.00', 993, 'https://i.imgur.com/uatvk2e.png', 'https://i.imgur.com/vuOy1Gr.png', '1000.00', '360.00', '64.33', '114.36', '32.16', '17.87', '0.00', 'cashout', '2019-08-19', 0, 0, '2020-03-10 16:18:36', '2020-03-12 14:28:30'),
(57, 6, '1690.00', 1386, 'https://i.imgur.com/124EVvb.png', 'https://i.imgur.com/YN6yMfc.png', '1000.00', '690.00', '123.29', '219.19', '61.65', '34.25', '0.00', 'cashout', '2019-09-02', 0, 0, '2020-03-10 16:19:20', '2020-03-12 14:29:11'),
(58, 6, '965.00', 717, 'https://i.imgur.com/I5nIngG.png', 'https://i.imgur.com/3z3lmsU.png', '500.00', '465.00', '83.09', '147.72', '41.55', '23.08', '0.00', 'cashout', '2019-09-16', 0, 0, '2020-03-10 16:21:32', '2020-03-12 14:29:37'),
(59, 6, '920.00', 257, 'https://i.imgur.com/QrmQY15.png', 'https://i.imgur.com/MFneC3S.png', '500.00', '420.00', '75.05', '133.42', '37.52', '20.85', '0.00', 'cashout', '2019-09-30', 0, 0, '2020-03-10 16:23:11', '2020-03-12 14:29:51'),
(60, 6, '230.00', 972, 'https://i.imgur.com/BqCLXN5.png', 'https://i.imgur.com/BGyaPTc.png', '800.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-10-14', 0, 0, '2020-03-10 16:24:54', '2020-03-10 16:24:54'),
(61, 6, '540.00', 1030, 'https://i.imgur.com/I1VCcyb.png', 'https://i.imgur.com/me1qmmx.png', '800.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-10-28', 0, 0, '2020-03-10 16:26:10', '2020-03-10 16:26:10'),
(62, 6, '1144.00', 667, 'https://i.imgur.com/tT5s9r7.png', 'https://i.imgur.com/w7wCBeh.png', '800.00', '344.00', '61.47', '109.28', '30.74', '17.08', '0.00', 'cashout', '2019-11-11', 0, 0, '2020-03-10 16:26:48', '2020-03-12 14:30:08'),
(63, 6, '1100.00', 681, 'https://i.imgur.com/oRQfgsS.png', 'https://i.imgur.com/8FApYwu.png', '800.00', '300.00', '53.60', '95.30', '26.80', '14.89', '0.00', 'cashout', '2019-11-25', 0, 0, '2020-03-10 16:27:33', '2020-03-12 14:30:19'),
(64, 6, '1120.00', 886, 'https://i.imgur.com/n50Bflb.png', 'https://i.imgur.com/m8JyLyQ.png', '800.00', '320.00', '57.18', '101.65', '28.59', '15.88', '0.00', 'cashout', '2019-12-09', 0, 0, '2020-03-10 16:28:18', '2020-03-12 14:30:25'),
(65, 6, '1400.00', 982, 'https://i.imgur.com/1DpyYrh.png', 'https://i.imgur.com/RYDpmAC.png', '800.00', '600.00', '107.21', '190.60', '53.61', '29.78', '0.00', 'cashout', '2019-12-23', 0, 0, '2020-03-10 16:29:08', '2020-03-12 14:30:39'),
(66, 7, '398.34', 1108, 'https://i.imgur.com/J9y3uvA.png', 'https://i.imgur.com/ERG3K6N.png', '60.00', '338.34', '83.97', '83.97', '0.00', '0.00', '0.00', 'cashout', '2019-04-01', 0, 0, '2020-03-10 16:35:16', '2020-03-12 14:40:18'),
(67, 7, '1212.00', 1063, 'https://i.imgur.com/ellu4YR.png', 'https://i.imgur.com/NTbyfPO.png', '700.00', '512.00', '127.07', '127.07', '0.00', '0.00', '0.00', 'cashout', '2019-04-15', 0, 0, '2020-03-10 16:38:03', '2020-03-12 14:40:49'),
(68, 7, '1000.00', 1168, 'https://i.imgur.com/VfFXVAO.png', 'https://i.imgur.com/X9A7nZo.png', '700.00', '300.00', '74.45', '74.45', '0.00', '0.00', '0.00', 'cashout', '2019-04-29', 0, 0, '2020-03-10 16:38:36', '2020-03-12 14:40:58'),
(69, 7, '1915.00', 1306, 'https://i.imgur.com/ZVx2Kc8.png', 'https://i.imgur.com/vcFmXRb.png', '700.00', '1215.00', '301.54', '301.54', '0.00', '0.00', '0.00', 'cashout', '2019-05-13', 0, 0, '2020-03-10 16:39:11', '2020-03-12 14:41:19'),
(70, 7, '1000.00', 1290, 'https://i.imgur.com/HlGfrTV.png', 'https://i.imgur.com/moNgNJg.png', '700.00', '300.00', '74.45', '74.45', '0.00', '0.00', '0.00', 'cashout', '2019-05-27', 0, 0, '2020-03-10 16:39:55', '2020-03-12 14:41:28'),
(71, 7, '1505.00', 1298, 'https://i.imgur.com/yap37h4.png', 'https://i.imgur.com/KNpzy7w.png', '700.00', '805.00', '199.79', '199.79', '0.00', '0.00', '0.00', 'cashout', '2019-06-10', 0, 0, '2020-03-10 16:40:40', '2020-03-12 14:41:37'),
(72, 7, '1455.00', 1085, 'https://i.imgur.com/wSYrFBO.png', 'https://i.imgur.com/M7CClFt.png', '700.00', '755.00', '187.38', '187.38', '0.00', '0.00', '0.00', 'cashout', '2019-06-24', 0, 0, '2020-03-10 16:41:56', '2020-03-12 14:41:47'),
(73, 7, '1900.00', 921, 'https://i.imgur.com/Bv7Us02.png', 'https://i.imgur.com/5lwRMpR.png', '700.00', '1200.00', '297.82', '297.82', '0.00', '0.00', '0.00', 'cashout', '2019-07-08', 0, 0, '2020-03-10 16:42:48', '2020-03-12 14:41:56'),
(74, 7, '930.00', 471, 'https://i.imgur.com/3tKMfQF.png', 'https://i.imgur.com/UPq88bJ.png', '700.00', '230.00', '57.08', '57.08', '0.00', '0.00', '0.00', 'cashout', '2019-07-22', 0, 0, '2020-03-10 16:43:40', '2020-03-12 14:42:04'),
(75, 7, '210.00', 1292, 'https://i.imgur.com/pmnbPqn.png', 'https://i.imgur.com/2tHIITB.png', '900.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-08-05', 0, 0, '2020-03-10 16:44:58', '2020-03-10 16:44:58'),
(76, 7, '635.00', 1357, 'https://i.imgur.com/WszKcqF.png', 'https://i.imgur.com/3ErRupU.png', '1100.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-08-19', 0, 0, '2020-03-10 16:48:01', '2020-03-10 16:48:01'),
(77, 7, '1775.00', 1061, 'https://i.imgur.com/4JROpyP.png', 'https://i.imgur.com/lfupf6y.png', '1300.00', '475.00', '84.88', '150.89', '42.44', '23.58', '0.00', 'cashout', '2019-09-02', 0, 0, '2020-03-10 16:49:24', '2020-03-12 14:43:48'),
(78, 7, '630.00', 1079, 'https://i.imgur.com/DN3QlBH.png', 'https://i.imgur.com/b6g3Plb.png', '500.00', '130.00', '23.15', '41.29', '11.60', '6.44', '0.00', 'cashout', '2019-09-16', 0, 0, '2020-03-10 16:50:28', '2020-03-12 14:43:57'),
(79, 7, '2215.00', 1122, 'https://i.imgur.com/Fz9Dd9h.png', 'https://i.imgur.com/NS2uix9.png', '500.00', '1715.00', '306.46', '544.82', '153.23', '85.13', '0.00', 'cashout', '2019-09-30', 0, 0, '2020-03-10 16:51:10', '2020-03-12 14:44:03'),
(80, 7, '1100.00', 1478, 'https://i.imgur.com/q4VUC8u.png', 'https://i.imgur.com/56NRtod.png', '500.00', '600.00', '107.21', '190.60', '53.61', '29.78', '0.00', 'cashout', '2019-10-14', 0, 0, '2020-03-10 16:51:53', '2020-03-12 14:44:09'),
(81, 7, '1554.00', 1020, 'https://i.imgur.com/tF5aHXT.png', 'https://i.imgur.com/USUtM0d.png', '500.00', '1054.00', '169.51', '301.35', '84.75', '47.09', '0.00', 'cashout', '2019-10-28', 0, 0, '2020-03-10 16:52:53', '2020-03-12 14:45:23'),
(82, 7, '1150.00', 1080, 'https://i.imgur.com/ASw1xGY.png', 'https://i.imgur.com/PEWtC98.png', '500.00', '650.00', '104.53', '185.84', '52.27', '29.04', '0.00', 'cashout', '2019-11-11', 0, 0, '2020-03-10 16:54:02', '2020-03-12 14:46:14'),
(83, 7, '1350.00', 1067, 'https://i.imgur.com/8DDt24U.png', 'https://i.imgur.com/e4FbyaI.png', '500.00', '850.00', '148.50', '276.00', '76.41', '50.94', '0.00', 'cashout', '2019-11-25', 0, 0, '2020-03-10 16:54:54', '2020-03-12 14:51:46'),
(84, 7, '2430.00', 1161, 'https://i.imgur.com/aMc8Q1m.png', 'https://i.imgur.com/SCzSIX1.png', '500.00', '1930.00', '344.88', '613.12', '172.44', '95.80', '0.00', 'cashout', '2019-12-09', 0, 0, '2020-03-10 16:55:39', '2020-03-12 14:46:40'),
(85, 7, '495.00', 955, 'https://i.imgur.com/supsmeg.png', 'https://i.imgur.com/m8NhQqS.png', '2000.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-12-23', 0, 0, '2020-03-10 16:56:43', '2020-03-10 16:56:43'),
(86, 8, '1379.00', 2264, 'https://i.imgur.com/E54gnfl.png', 'https://i.imgur.com/FYb4XbW.png', '600.00', '779.00', '139.20', '247.47', '69.60', '38.67', '0.00', 'cashout', '2019-08-19', 0, 0, '2020-03-10 17:03:44', '2020-03-12 14:56:48'),
(87, 8, '755.00', 599, 'https://i.imgur.com/mHreT4L.png', 'https://i.imgur.com/hOacnTc.png', '800.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-09-02', 0, 0, '2020-03-10 17:04:58', '2020-03-10 17:04:58'),
(88, 8, '1400.00', 625, 'https://i.imgur.com/DgrxXAG.png', 'https://i.imgur.com/mp4IlB7.png', '500.00', '900.00', '160.82', '285.91', '80.41', '44.67', '0.00', 'cashout', '2019-09-16', 0, 0, '2020-03-10 17:05:45', '2020-03-12 14:56:58'),
(89, 8, '950.00', 440, 'https://i.imgur.com/gPCXJDD.png', 'https://i.imgur.com/lPCdFBJ.png', '500.00', '450.00', '80.41', '142.95', '40.20', '22.34', '0.00', 'cashout', '2019-09-30', 0, 0, '2020-03-10 17:06:18', '2020-03-12 14:57:03'),
(91, 8, '700.00', 705, 'https://i.imgur.com/fkfIVKH.png', 'https://i.imgur.com/tcfWIly.png', '500.00', '200.00', '35.73', '63.53', '17.87', '9.93', '0.00', 'cashout', '2019-10-14', 0, 0, '2020-03-10 17:07:36', '2020-03-12 14:57:07'),
(92, 8, '1170.00', 389, 'https://i.imgur.com/PqrcrqZ.png', 'https://i.imgur.com/REkwZnJ.png', '500.00', '670.00', '119.72', '212.84', '59.86', '33.26', '0.00', 'cashout', '2019-10-28', 0, 0, '2020-03-10 17:08:04', '2020-03-12 14:57:18'),
(93, 8, '650.00', 445, 'https://i.imgur.com/GLWa6nf.png', 'https://i.imgur.com/RT2VtCx.png', '500.00', '150.00', '26.75', '47.65', '13.39', '7.44', '0.00', 'cashout', '2019-11-11', 0, 0, '2020-03-10 17:08:39', '2020-03-12 14:57:23'),
(94, 8, '410.00', 488, 'https://i.imgur.com/FhYl8RL.png', 'https://i.imgur.com/faVkz03.png', '500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-11-25', 0, 0, '2020-03-10 17:09:07', '2020-03-10 17:09:07'),
(95, 8, '1105.00', 506, 'https://i.imgur.com/sMLZgdU.png', 'https://i.imgur.com/3UWrWzK.png', '500.00', '605.00', '108.11', '192.19', '54.05', '30.03', '0.00', 'cashout', '2019-12-09', 0, 0, '2020-03-10 17:09:34', '2020-03-12 14:57:30'),
(96, 8, '153.00', 578, 'https://i.imgur.com/yn8vqYC.png', 'https://i.imgur.com/MhqgRGO.png', '500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-12-23', 0, 0, '2020-03-10 17:10:15', '2020-03-10 17:10:15'),
(97, 9, '35.00', 616, 'https://i.imgur.com/0yiw0SE.png', 'https://i.imgur.com/G1fjnU0.png', '50.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-03-18', 0, 0, '2020-03-10 17:14:18', '2020-03-10 17:14:18'),
(98, 9, '110.56', 188, 'https://i.imgur.com/MTkePTT.png', 'https://i.imgur.com/Yh30Hb3.png', '50.00', '60.56', '14.89', '14.89', '0.00', '0.00', '0.00', 'cashout', '2019-04-01', 0, 0, '2020-03-10 17:14:44', '2020-03-12 15:05:33'),
(99, 9, '1715.00', 888, 'https://i.imgur.com/IgDvr9J.png', 'https://i.imgur.com/bHvoqgG.png', '400.00', '1315.00', '326.36', '326.36', '0.00', '0.00', '0.00', 'cashout', '2019-04-15', 0, 0, '2020-03-10 17:15:28', '2020-03-12 15:04:04'),
(100, 9, '490.00', 691, 'https://i.imgur.com/KE57QVB.png', 'https://i.imgur.com/xVstilx.png', '400.00', '90.00', '22.25', '22.25', '0.00', '0.00', '0.00', 'cashout', '2019-04-29', 0, 0, '2020-03-10 17:15:53', '2020-03-12 15:04:13'),
(101, 9, '870.00', 608, 'https://i.imgur.com/7XeJw2o.png', 'https://i.imgur.com/VK7vBP0.png', '400.00', '470.00', '116.64', '116.64', '0.00', '0.00', '0.00', 'cashout', '2019-05-13', 0, 0, '2020-03-10 17:16:19', '2020-03-12 15:04:24'),
(102, 9, '450.00', 217, 'https://i.imgur.com/NKDm2S4.png', 'https://i.imgur.com/auxQJmq.png', '400.00', '50.00', '12.25', '12.25', '0.00', '0.00', '0.00', 'cashout', '2019-05-27', 0, 0, '2020-03-10 17:16:40', '2020-03-12 15:04:31'),
(103, 9, '860.00', 636, 'https://i.imgur.com/aJ7DPlZ.png', 'https://i.imgur.com/GEYMyJr.png', '400.00', '460.00', '114.16', '114.16', '0.00', '0.00', '0.00', 'cashout', '2019-06-10', 0, 0, '2020-03-10 17:18:20', '2020-03-12 15:04:42'),
(104, 9, '2005.00', 621, 'https://i.imgur.com/Je6GRAW.png', 'https://i.imgur.com/JOgmEOB.png', '400.00', '1605.00', '398.34', '398.34', '0.00', '0.00', '0.00', 'cashout', '2019-06-24', 0, 0, '2020-03-10 17:18:45', '2020-03-12 15:04:48'),
(105, 9, '3410.00', 930, 'https://i.imgur.com/Oov02Ku.png', 'https://i.imgur.com/LlkoJob.png', '600.00', '2810.00', '697.40', '697.40', '0.00', '0.00', '0.00', 'cashout', '2019-07-08', 0, 0, '2020-03-10 17:19:19', '2020-03-12 15:04:54'),
(106, 9, '50.00', 345, 'https://i.imgur.com/qkAIZGr.png', 'https://i.imgur.com/yxSnBSr.png', '1300.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-07-22', 0, 0, '2020-03-10 17:20:35', '2020-03-10 17:20:35'),
(107, 9, '610.00', 327, 'https://i.imgur.com/qkAIZGr.png', 'https://i.imgur.com/EnqAvKU.png', '1550.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-08-05', 0, 0, '2020-03-10 17:21:33', '2020-03-10 17:22:04'),
(108, 9, '380.00', 216, 'https://i.imgur.com/nhmAYe8.png', 'https://i.imgur.com/13vnjUa.png', '1550.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-08-19', 0, 0, '2020-03-10 17:23:02', '2020-03-10 17:23:02'),
(109, 9, '420.00', 567, 'https://i.imgur.com/NRumdqu.png', 'https://i.imgur.com/bbCmR8Z.png', '1950.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-09-02', 0, 0, '2020-03-10 17:23:41', '2020-03-10 17:24:34'),
(110, 9, '1138.00', 1049, 'https://i.imgur.com/UZwAp3b.png', 'https://i.imgur.com/j9aySYF.png', '1950.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-09-16', 0, 0, '2020-03-10 17:29:14', '2020-03-10 17:29:14'),
(111, 9, '2668.50', 1156, 'https://i.imgur.com/jl9UAaq.png', 'https://i.imgur.com/nslx8eO.png', '1950.00', '718.50', '128.39', '228.25', '64.20', '35.66', '0.00', 'cashout', '2019-09-30', 0, 0, '2020-03-10 17:32:02', '2020-03-12 15:06:34'),
(112, 9, '3145.00', 763, 'https://i.imgur.com/iFlfNl4.png', 'https://i.imgur.com/GbqwlQ9.png', '1950.00', '1195.00', '213.54', '379.62', '106.77', '59.32', '0.00', 'cashout', '2019-10-14', 0, 0, '2020-03-10 17:32:34', '2020-03-12 15:07:19'),
(113, 9, '3925.00', 902, 'https://i.imgur.com/c84X3Cp.png', 'https://i.imgur.com/nDRX1Q9.png', '1950.00', '1975.00', '317.63', '564.67', '158.81', '88.23', '0.00', 'cashout', '2019-10-28', 0, 0, '2020-03-10 17:33:17', '2020-03-12 15:10:18'),
(114, 9, '4873.25', 818, 'https://i.imgur.com/cQjFPi6.png', 'https://i.imgur.com/0skza8j.png', '1950.00', '2923.25', '470.13', '835.79', '235.07', '130.59', '0.00', 'cashout', '2019-11-11', 0, 0, '2020-03-10 17:33:49', '2020-03-12 15:10:05'),
(115, 9, '960.00', 527, 'https://i.imgur.com/K5bYJzd.png', 'https://i.imgur.com/oie8Y5W.png', '1950.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-11-25', 0, 0, '2020-03-10 17:34:49', '2020-03-10 17:34:49'),
(116, 9, '3410.00', 1349, 'https://i.imgur.com/9X7bzS0.png', 'https://i.imgur.com/uF2kaKd.png', '2500.00', '910.00', '162.61', '289.08', '81.30', '45.17', '0.00', 'cashout', '2019-12-09', 0, 0, '2020-03-10 17:35:45', '2020-03-12 15:13:21'),
(117, 9, '2050.00', 1024, 'https://i.imgur.com/CSyVkvI.png', 'https://i.imgur.com/1T2eZGz.png', '2500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-12-23', 0, 0, '2020-03-10 17:38:55', '2020-03-10 17:38:55'),
(118, 10, '665.00', 1994, 'https://i.imgur.com/kw70XLL.png', 'https://i.imgur.com/GFHgssZ.png', '150.00', '515.00', '127.81', '127.81', '0.00', '0.00', '0.00', 'cashout', '2019-05-27', 0, 0, '2020-03-10 18:29:54', '2020-03-12 15:18:59'),
(119, 10, '565.00', 1193, 'https://i.imgur.com/8VhGkXi.png', 'https://i.imgur.com/TiLcHCS.png', '400.00', '165.00', '40.95', '40.95', '0.00', '0.00', '0.00', 'cashout', '2019-06-10', 0, 0, '2020-03-10 18:30:34', '2020-03-12 15:19:05'),
(120, 10, '980.00', 1287, 'https://i.imgur.com/ix0z1mr.png', 'https://i.imgur.com/TclWb81.png', '400.00', '580.00', '143.94', '143.94', '0.00', '0.00', '0.00', 'cashout', '2019-06-24', 0, 0, '2020-03-10 18:31:17', '2020-03-12 15:19:10'),
(121, 10, '1090.00', 1263, 'https://i.imgur.com/Q0vH4Oz.png', 'https://i.imgur.com/j8oNU13.png', '400.00', '690.00', '171.24', '171.24', '0.00', '0.00', '0.00', 'cashout', '2019-07-08', 0, 0, '2020-03-10 18:31:51', '2020-03-12 15:19:17'),
(122, 10, '657.00', 1191, 'https://i.imgur.com/A5yBrpv.png', 'https://i.imgur.com/OiuMD7A.png', '400.00', '257.00', '63.78', '63.78', '0.00', '0.00', '0.00', 'cashout', '2019-07-22', 0, 0, '2020-03-10 18:32:19', '2020-03-12 15:19:22'),
(123, 10, '695.00', 1162, 'https://i.imgur.com/jUkAujk.png', 'https://i.imgur.com/0aCcEwO.png', '400.00', '295.00', '58.57', '87.85', '29.28', '0.00', '0.00', 'cashout', '2019-08-05', 0, 0, '2020-03-10 18:34:13', '2020-03-12 15:19:57'),
(124, 10, '35.00', 816, 'https://i.imgur.com/WlVI6vg.png', 'https://i.imgur.com/WY98yiN.png', '400.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-08-19', 0, 0, '2020-03-10 18:35:58', '2020-03-10 18:35:58'),
(125, 10, '790.00', 966, 'https://i.imgur.com/qKFctqx.png', 'https://i.imgur.com/8TMCxzr.png', '750.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-09-02', 0, 0, '2020-03-10 18:37:03', '2020-03-12 15:20:35'),
(126, 10, '673.75', 819, 'https://i.imgur.com/izJgE5L.png', 'https://i.imgur.com/1C1Urdt.png', '500.00', '173.75', '31.03', '55.19', '15.52', '8.62', '0.00', 'cashout', '2019-09-16', 0, 0, '2020-03-10 18:38:44', '2020-03-12 15:21:06'),
(127, 10, '1280.00', 1235, 'https://i.imgur.com/xnaVmIN.png', 'https://i.imgur.com/lcFpqJf.png', '500.00', '780.00', '139.38', '247.79', '69.69', '38.72', '0.00', 'cashout', '2019-09-30', 0, 0, '2020-03-10 18:39:38', '2020-03-12 15:21:19'),
(128, 10, '1015.00', 1564, 'https://i.imgur.com/rKAnIug.png', 'https://i.imgur.com/Yz8XKdY.png', '500.00', '515.00', '92.02', '163.60', '46.01', '25.56', '0.00', 'cashout', '2019-10-14', 0, 0, '2020-03-10 18:40:05', '2020-03-12 15:21:50'),
(129, 10, '50.00', 899, 'https://i.imgur.com/btQnfTT.png', 'https://i.imgur.com/iw4DlIH.png', '500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-10-28', 0, 0, '2020-03-10 18:40:41', '2020-03-10 18:40:41'),
(131, 10, '4310.00', 785, 'https://i.imgur.com/6dfGZ25.png', 'https://i.imgur.com/kbAKhBh.png', '750.00', '3560.00', '636.15', '1130.94', '318.08', '176.71', '0.00', 'cashout', '2019-11-11', 0, 0, '2020-03-10 18:45:01', '2020-03-12 15:22:00'),
(132, 10, '900.00', 635, 'https://i.imgur.com/t3fJVtm.png', 'https://i.imgur.com/t3fJVtm.png', '750.00', '150.00', '26.75', '47.65', '13.39', '7.44', '0.00', 'cashout', '2019-11-25', 0, 0, '2020-03-10 18:47:56', '2020-03-12 15:22:35'),
(133, 10, '1210.00', 435, 'https://i.imgur.com/OnVk1Zr.png', 'https://i.imgur.com/tTUDTfC.png', '750.00', '460.00', '82.19', '146.13', '41.10', '22.83', '0.00', 'cashout', '2019-12-09', 0, 0, '2020-03-10 18:48:24', '2020-03-12 15:22:39'),
(134, 10, '1190.00', 879, 'https://i.imgur.com/kdpL0wG.png', 'https://i.imgur.com/ZCdpoYb.png', '750.00', '440.00', '78.62', '139.77', '39.31', '21.84', '0.00', 'cashout', '2019-12-23', 0, 0, '2020-03-10 18:51:10', '2020-03-12 15:22:48'),
(136, 11, '51.84', 865, 'https://i.imgur.com/1oun2bA.png', 'https://i.imgur.com/7EKkuqI.png', '50.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-04-01', 0, 0, '2020-03-10 19:50:00', '2020-03-12 15:29:39'),
(138, 11, '250.00', 297, 'https://i.imgur.com/0WnfmTd.png', 'https://i.imgur.com/eXhp9Kf.png', '200.00', '50.00', '11.00', '11.00', '0.00', '0.00', '0.88', 'cashout', '2019-04-15', 0, 0, '2020-03-10 19:57:12', '2020-03-12 15:30:41'),
(139, 11, '432.00', 745, 'https://i.imgur.com/ca20Tc6.png', 'https://i.imgur.com/xyeRFxH.png', '200.00', '232.00', '51.82', '51.82', '0.00', '0.00', '0.00', 'cashout', '2019-04-29', 0, 0, '2020-03-10 20:00:53', '2020-03-12 15:30:49'),
(140, 11, '50.00', 853, 'https://i.imgur.com/eBm0SzG.png', 'https://i.imgur.com/BIKVpQt.png', '200.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-05-13', 0, 0, '2020-03-10 20:02:36', '2020-03-10 20:02:36'),
(141, 11, '285.00', 767, 'https://i.imgur.com/ZBMXXCq.png', 'https://i.imgur.com/S7EkkN7.png', '400.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-05-27', 0, 0, '2020-03-10 20:05:38', '2020-03-10 20:05:38'),
(142, 11, '505.00', 731, 'https://i.imgur.com/bk42kH4.png', 'https://i.imgur.com/T4HN9Qc.png', '400.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-06-10', 0, 0, '2020-03-10 20:06:16', '2020-03-10 20:06:22'),
(143, 11, '620.00', 438, 'https://i.imgur.com/8SzJpNe.png', 'https://i.imgur.com/1YDKV9v.png', '400.00', '220.00', '49.14', '49.14', '0.00', '0.00', '0.00', 'cashout', '2019-06-24', 0, 0, '2020-03-10 20:06:59', '2020-03-12 15:30:55'),
(144, 11, '685.00', 575, 'https://i.imgur.com/OqSI5M0.png', 'https://i.imgur.com/QVyOLFN.png', '400.00', '285.00', '63.66', '63.66', '0.00', '0.00', '0.00', 'cashout', '2019-07-08', 0, 0, '2020-03-10 20:07:34', '2020-03-12 15:31:02'),
(145, 11, '305.00', 357, 'https://i.imgur.com/vBk28MU.png', 'https://i.imgur.com/0Q0ls2Z.png', '400.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-07-22', 0, 0, '2020-03-10 20:08:19', '2020-03-10 20:08:19'),
(146, 11, '500.00', 600, 'https://i.imgur.com/afK7A9L.png', 'https://i.imgur.com/SlY6yIU.png', '400.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-08-05', 0, 0, '2020-03-10 20:09:48', '2020-03-10 20:09:51'),
(147, 11, '655.00', 484, 'https://i.imgur.com/vQ7D3Fx.png', 'https://i.imgur.com/WOiXK5g.png', '600.00', '55.00', '8.66', '15.59', '4.37', '2.43', '0.00', 'cashout', '2019-08-19', 0, 0, '2020-03-10 20:10:58', '2020-03-12 15:31:31'),
(148, 11, '599.00', 492, 'https://i.imgur.com/BUgZW6G.png', 'https://i.imgur.com/E3XG7mN.png', '600.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-09-02', 0, 0, '2020-03-10 20:12:12', '2020-03-10 20:12:12'),
(149, 11, '510.00', 428, 'https://i.imgur.com/QDdJ9OH.png', 'https://i.imgur.com/6jseKil.png', '600.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-09-16', 0, 0, '2020-03-10 20:12:43', '2020-03-10 20:12:43'),
(150, 11, '665.00', 467, 'https://i.imgur.com/rx4ZesT.png', 'https://i.imgur.com/2v2RAkC.png', '600.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-09-30', 0, 0, '2020-03-10 20:13:29', '2020-03-10 20:13:50'),
(151, 11, '1090.00', 490, 'https://i.imgur.com/Pko589j.png', 'https://i.imgur.com/0tJIdmU.png', '600.00', '490.00', '78.80', '140.09', '39.40', '21.89', '0.00', 'cashout', '2019-10-14', 0, 0, '2020-03-10 20:15:39', '2020-03-12 15:32:13'),
(152, 11, '610.00', 686, 'https://i.imgur.com/VdojvQ0.png', 'https://i.imgur.com/mVTKNEv.png', '600.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-10-28', 0, 0, '2020-03-10 20:18:06', '2020-03-10 20:18:13'),
(153, 11, '250.00', 660, 'https://i.imgur.com/1Ux6d47.png', 'https://i.imgur.com/w20zzF6.png', '600.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-11-11', 0, 0, '2020-03-10 20:18:35', '2020-03-10 20:18:35'),
(154, 11, '325.00', 851, 'https://i.imgur.com/pS19E6O.png', 'https://i.imgur.com/G64WZP2.png', '600.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-11-25', 0, 0, '2020-03-10 20:19:30', '2020-03-10 20:19:30'),
(155, 11, '810.00', 538, 'https://i.imgur.com/5xCzgrv.png', 'https://i.imgur.com/BhanCWW.png', '600.00', '210.00', '33.77', '60.04', '16.89', '9.38', '0.00', 'cashout', '2019-12-09', 0, 0, '2020-03-10 20:20:22', '2020-03-12 15:33:56'),
(156, 11, '795.00', 469, 'https://i.imgur.com/EiPtUiE.png', 'https://i.imgur.com/qGIc1Di.png', '600.00', '195.00', '31.34', '55.75', '15.68', '8.71', '0.00', 'cashout', '2019-12-23', 0, 0, '2020-03-10 20:21:01', '2020-03-12 15:34:00'),
(157, 12, '1040.00', 550, 'http://prntscr.com/p0ltj8', 'http://prntscr.com/p0m8sj', '390.00', '650.00', '92.92', '165.19', '46.46', '25.81', '0.00', 'cashout', '2019-09-02', 0, 0, '2020-03-10 20:29:34', '2020-03-12 15:39:43'),
(158, 12, '540.00', 916, 'http://prntscr.com/p6qlfo', 'http://prntscr.com/p6qka8', '390.00', '150.00', '21.35', '38.12', '10.70', '5.95', '0.00', 'cashout', '2019-09-16', 0, 0, '2020-03-10 20:30:29', '2020-03-12 15:40:00'),
(159, 12, '770.00', 762, 'http://prntscr.com/pcsi07', 'http://prntscr.com/pcsij4', '390.00', '380.00', '54.32', '96.57', '27.16', '15.09', '0.00', 'cashout', '2019-09-30', 0, 0, '2020-03-10 20:31:00', '2020-03-12 15:40:17'),
(160, 12, '1459.00', 1139, 'http://prntscr.com/pitudp', 'http://prntscr.com/pjinio', '390.00', '1069.00', '152.82', '271.67', '76.41', '42.45', '0.00', 'cashout', '2019-10-14', 0, 0, '2020-03-10 20:36:40', '2020-03-12 15:40:23'),
(161, 12, '975.00', 346, 'http://prntscr.com/pp90hv', 'http://prntscr.com/pp8zut', '390.00', '585.00', '83.62', '148.67', '41.81', '23.23', '0.00', 'cashout', '2019-10-28', 0, 0, '2020-03-10 20:37:07', '2020-03-12 15:42:55'),
(162, 12, '513.00', 406, 'http://prntscr.com/pvayv3', 'http://prntscr.com/pvaykq', '390.00', '123.00', '17.46', '31.23', '8.76', '4.87', '0.00', 'cashout', '2019-11-11', 0, 0, '2020-03-10 20:37:54', '2020-03-12 15:43:04'),
(163, 12, '910.00', 365, 'http://prntscr.com/q1446o', 'http://prntscr.com/q1gc1v', '390.00', '520.00', '74.33', '132.15', '37.17', '20.65', '0.00', 'cashout', '2019-11-25', 0, 0, '2020-03-10 20:39:07', '2020-03-12 15:43:11'),
(164, 12, '300.00', 287, 'http://prntscr.com/q8qr8b', 'http://prntscr.com/q8qmpe', '390.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-12-09', 0, 0, '2020-03-10 20:39:47', '2020-03-10 20:39:47'),
(165, 12, '110.00', 539, 'http://prntscr.com/qesv3d', 'http://prntscr.com/qesvsk', '600.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-12-23', 0, 0, '2020-03-10 20:40:45', '2020-03-10 20:40:45'),
(166, 3, '230.00', 1021, 'http://sdfsd', 'http://fsdf', '100.00', '130.00', '25.82', '25.82', '0.00', '0.00', '0.65', 'cashout', '2019-03-02', 0, 0, '2020-03-11 22:23:34', '2020-03-11 22:34:21'),
(167, 4, '382.00', 227, 'https://i.imgur.com/t01PLZU.png', 'https://i.imgur.com/sUfLkXn.png', '400.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2020-02-17', 0, 0, '2020-03-12 13:43:00', '2020-03-12 13:43:00'),
(168, 4, '412.10', 322, 'https://i.imgur.com/UCtR9sn.png', 'https://i.imgur.com/c1YcrCS.png', '400.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2020-03-02', 0, 0, '2020-03-12 13:43:59', '2020-03-12 13:58:06'),
(169, 5, '645.00', 166, 'https://imgur.com/vIPgL1s', 'https://imgur.com/W3zl7EI', '750.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2020-01-06', 0, 0, '2020-03-12 14:10:28', '2020-03-12 14:10:44'),
(170, 5, '345.00', 65, 'https://imgur.com/afntafK', 'https://imgur.com/KAEJw75', '550.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2020-01-20', 0, 0, '2020-03-12 14:12:01', '2020-03-12 14:12:01'),
(171, 5, '570.00', 106, 'https://imgur.com/OHZSGDf', 'https://imgur.com/y0fLtaG', '550.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2020-02-03', 0, 0, '2020-03-12 14:16:24', '2020-03-12 14:19:08'),
(172, 5, '685.00', 254, 'https://imgur.com/QsIBkAD', 'https://imgur.com/sfcQyjk', '550.00', '135.00', '22.87', '44.05', '11.71', '9.37', '0.00', 'cashout', '2020-02-17', 0, 0, '2020-03-12 14:19:53', '2020-03-12 14:19:57'),
(173, 5, '250.00', 173, 'https://imgur.com/MfYv1s1', 'https://imgur.com/MfYv1s1', '550.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2020-03-02', 0, 0, '2020-03-12 14:24:16', '2020-03-12 14:24:16'),
(174, 6, '1924.00', 1214, 'https://i.imgur.com/HBi3XKJ.png', 'https://i.imgur.com/nyONBDQ.png', '800.00', '1124.00', '175.74', '326.38', '90.38', '60.25', '0.00', 'cashout', '2020-01-06', 0, 0, '2020-03-12 14:33:03', '2020-03-12 14:33:36'),
(175, 6, '210.00', 1277, 'https://i.imgur.com/7jNHCqj.png', 'https://i.imgur.com/eTBizJW.png', '600.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2020-01-20', 0, 0, '2020-03-12 14:34:35', '2020-03-12 14:34:35'),
(176, 6, '779.00', 1137, 'https://i.imgur.com/e8vRRen.png', 'https://i.imgur.com/uYjSqoa.png', '600.00', '179.00', '27.34', '52.57', '13.98', '11.19', '0.00', 'cashout', '2020-02-03', 0, 0, '2020-03-12 14:36:05', '2020-03-12 14:36:05'),
(177, 6, '1200.00', 983, 'https://i.imgur.com/pfA6yCN.png', 'https://i.imgur.com/fvkKE7r.png', '600.00', '600.00', '91.80', '176.23', '46.91', '37.52', '0.00', 'cashout', '2020-02-17', 0, 0, '2020-03-12 14:36:52', '2020-03-12 14:36:52'),
(178, 6, '440.83', 763, 'https://i.imgur.com/KWgFlBx.png', 'https://i.imgur.com/6ifLNjn.png', '440.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2020-03-02', 0, 0, '2020-03-12 14:38:54', '2020-03-12 14:38:56'),
(179, 7, '1097.16', 441, 'https://i.imgur.com/8jEyfY3.png', 'https://i.imgur.com/tmh59lu.png', '2200.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2020-01-06', 0, 0, '2020-03-12 14:47:59', '2020-03-12 14:48:06'),
(180, 7, '8879.91', 960, 'https://i.imgur.com/l71ITuM.png', 'https://i.imgur.com/t3OQTLW.png', '1700.00', '7179.91', '1256.23', '2333.22', '646.10', '430.73', '0.00', 'cashout', '2020-01-20', 0, 0, '2020-03-12 14:49:21', '2020-03-12 14:50:57'),
(181, 7, '305.00', 878, 'https://i.imgur.com/UzM9BxI.png', 'https://i.imgur.com/pnT1CFU.png', '600.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2020-02-03', 0, 0, '2020-03-12 14:53:04', '2020-03-12 14:53:04'),
(182, 7, '1075.00', 624, 'https://i.imgur.com/G3rSD8r.png', 'https://i.imgur.com/s8AFrsc.png', '600.00', '475.00', '81.09', '155.90', '41.47', '33.18', '0.00', 'cashout', '2020-02-17', 0, 0, '2020-03-12 14:53:33', '2020-03-12 14:55:44'),
(183, 7, '1440.00', 561, 'https://i.imgur.com/m4sgaU3.png', 'https://i.imgur.com/reK1L9L.png', '600.00', '840.00', '143.60', '275.90', '73.41', '58.73', '0.00', 'cashout', '2020-03-02', 0, 0, '2020-03-12 14:54:59', '2020-03-12 14:55:47'),
(184, 8, '362.73', 254, 'https://i.imgur.com/pzhVlIv.png', 'https://i.imgur.com/cRtcHYo.png', '700.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2020-01-06', 0, 0, '2020-03-12 14:59:00', '2020-03-12 14:59:18'),
(185, 8, '400.00', 361, 'https://i.imgur.com/xcYk6Ur.png', 'https://i.imgur.com/w4DdlX3.png', '1100.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2020-01-20', 0, 0, '2020-03-12 14:59:49', '2020-03-12 14:59:49'),
(186, 8, '442.73', 315, 'https://i.imgur.com/WMkWKeg.png', 'https://i.imgur.com/6gXAgCa.png', '1100.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2020-02-03', 0, 0, '2020-03-12 15:00:47', '2020-03-12 15:00:47'),
(187, 8, '622.73', 284, 'https://i.imgur.com/647Jdm1.png', 'https://i.imgur.com/3mlWNUN.png', '1100.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2020-02-17', 0, 0, '2020-03-12 15:01:15', '2020-03-12 15:01:15'),
(188, 8, '502.73', 212, 'https://i.imgur.com/dbhA56N.png', 'https://i.imgur.com/bmAojqH.png', '1100.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2020-03-02', 0, 0, '2020-03-12 15:02:25', '2020-03-12 15:02:25'),
(189, 9, '1830.00', 336, 'https://i.imgur.com/o8w5Jnp.png', 'https://i.imgur.com/2TdVr9G.png', '2700.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2020-01-06', 0, 0, '2020-03-12 15:14:13', '2020-03-12 15:14:13'),
(190, 9, '1995.00', 1113, 'https://i.imgur.com/UQR7T2S.png', 'https://i.imgur.com/5cyym0D.png', '1900.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2020-01-20', 0, 0, '2020-03-12 15:14:58', '2020-03-12 15:15:17'),
(191, 9, '1745.00', 634, 'https://i.imgur.com/DKm9e0Q.png', 'https://i.imgur.com/JpVu1wh.png', '1700.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2020-02-03', 0, 0, '2020-03-12 15:16:10', '2020-03-12 15:16:12'),
(192, 9, '2105.50', 816, 'https://i.imgur.com/ciKDaHo.png', 'https://i.imgur.com/GPLtnaM.png', '1700.00', '405.50', '68.93', '132.34', '35.22', '28.18', '0.00', 'cashout', '2020-02-17', 0, 0, '2020-03-12 15:17:22', '2020-03-12 15:17:22'),
(193, 9, '2200.00', 652, 'https://i.imgur.com/oT6lFHm.png', 'https://i.imgur.com/TdAXAOh.png', '1700.00', '500.00', '85.00', '163.18', '43.43', '34.75', '0.00', 'cashout', '2020-03-02', 0, 0, '2020-03-12 15:18:11', '2020-03-12 15:18:11'),
(194, 10, '920.00', 316, 'https://i.imgur.com/dHkpk0S.png', 'https://i.imgur.com/HfB0oAr.png', '950.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2020-01-06', 0, 0, '2020-03-12 15:24:08', '2020-03-12 15:24:08'),
(195, 10, '702.00', 1224, 'https://i.imgur.com/c8FGdlo.png', 'https://i.imgur.com/JGeIdrP.png', '500.00', '202.00', '35.09', '65.17', '18.05', '12.03', '0.00', 'cashout', '2020-01-20', 0, 0, '2020-03-12 15:25:31', '2020-03-12 15:25:31'),
(196, 10, '575.48', 853, 'https://i.imgur.com/GHQizoh.png', 'https://i.imgur.com/zNy4Wka.png', '500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2020-02-03', 0, 0, '2020-03-12 15:26:46', '2020-03-12 15:27:00'),
(197, 10, '1235.00', 894, 'https://i.imgur.com/8OaeE3v.png', 'https://i.imgur.com/WsDcnOY.png', '500.00', '735.00', '124.95', '239.87', '63.84', '51.07', '0.00', 'cashout', '2020-02-17', 0, 0, '2020-03-12 15:27:44', '2020-03-12 15:27:44'),
(198, 10, '480.00', 323, 'https://i.imgur.com/rNZsM7k.png', 'https://i.imgur.com/fD6mQqQ.png', '500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2020-03-02', 0, 0, '2020-03-12 15:28:15', '2020-03-12 15:28:15'),
(199, 11, '535.00', 239, 'https://i.imgur.com/ktYXGLm.png', 'https://i.imgur.com/s0t16B6.png', '800.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2020-01-06', 0, 0, '2020-03-12 15:35:00', '2020-03-12 15:35:00'),
(200, 11, '935.00', 809, 'https://i.imgur.com/jxyyq6o.png', 'https://i.imgur.com/Q79Sy7i.png', '800.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2020-01-20', 0, 0, '2020-03-12 15:36:07', '2020-03-12 15:36:09'),
(201, 11, '970.00', 271, 'https://i.imgur.com/NEV49CE.png', 'https://i.imgur.com/9a97W8b.png', '800.00', '170.00', '25.95', '49.93', '13.28', '10.62', '0.00', 'cashout', '2020-02-03', 0, 0, '2020-03-12 15:36:54', '2020-03-12 15:36:54'),
(202, 11, '805.00', 593, 'https://i.imgur.com/pehuBHF.png', 'https://i.imgur.com/70dvvVs.png', '800.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2020-02-17', 0, 0, '2020-03-12 15:37:30', '2020-03-12 15:38:46'),
(203, 11, '870.00', 111, 'https://i.imgur.com/CIunHd2.png', 'https://i.imgur.com/POuinE6.png', '800.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2020-03-02', 0, 0, '2020-03-12 15:38:30', '2020-03-12 15:38:32'),
(204, 12, '920.00', 742, 'http://prntscr.com/qjsik6', 'http://prntscr.com/qjsji6', '800.00', '120.00', '16.55', '30.95', '8.55', '5.70', '0.00', 'cashout', '2020-01-06', 0, 0, '2020-03-12 15:47:01', '2020-03-12 15:47:04'),
(205, 12, '362.80', 607, 'http://prntscr.com/qq87z3', 'http://prntscr.com/qq8dq3', '1200.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2020-01-20', 0, 0, '2020-03-12 15:49:41', '2020-03-12 15:49:41'),
(206, 12, '750.00', 451, 'http://prntscr.com/qwsvkg', 'http://prntscr.com/qwspzh', '1200.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2020-02-03', 0, 0, '2020-03-12 15:50:15', '2020-03-12 15:50:15'),
(207, 12, '650.00', 140, 'http://prntscr.com/r3gj7r', 'http://prntscr.com/r3gcwt', '1200.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2020-02-17', 0, 0, '2020-03-12 15:51:11', '2020-03-12 15:51:11'),
(208, 12, '560.13', 502, 'http://prntscr.com/ra9cdf', 'http://prntscr.com/ra9lbe', '1200.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2020-03-02', 0, 0, '2020-03-12 15:51:49', '2020-03-12 15:51:49'),
(209, 13, '823.00', 1163, 'https://gyazo.com/80b24ab13f734a716c74fdd7c15fe392', 'https://gyazo.com/877014f0b049af3a8280acf3c1c101ac', '600.00', '223.00', '55.34', '55.34', '0.00', '0.00', '0.00', 'cashout', '2019-06-24', 0, 0, '2020-03-12 15:54:07', '2020-03-12 15:54:07'),
(210, 13, '505.00', 682, 'https://gyazo.com/f0cdd97e7330646d4811699faba60ead', 'https://gyazo.com/0ced6ac8105b5c9ae04884cec95681e3', '600.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-07-08', 0, 0, '2020-03-12 15:54:29', '2020-03-12 15:54:29'),
(211, 13, '680.00', 682, 'https://gyazo.com/2aeefa867240a13d6d3ce9c111027ba9', 'https://gyazo.com/76e07cecb2e3133c6fee6b3f1dc02834', '600.00', '80.00', '19.75', '19.75', '0.00', '0.00', '0.00', 'cashout', '2019-07-22', 0, 0, '2020-03-12 15:54:56', '2020-03-12 15:54:59'),
(212, 13, '935.00', 256, 'https://gyazo.com/5d376de65ae1493717cc895302275cc4', 'https://gyazo.com/a22888f54316b576966fc6548d3de8e0', '600.00', '335.00', '66.51', '99.77', '33.26', '0.00', '0.00', 'cashout', '2019-08-05', 0, 0, '2020-03-12 15:55:43', '2020-03-12 15:55:43'),
(213, 13, '730.00', 628, 'https://gyazo.com/bf9e5e321092497c25ea9cad18848848', 'https://gyazo.com/63c667291d9d57f81a49a7cb1e23411d', '600.00', '130.00', '23.15', '41.29', '11.60', '6.44', '0.00', 'cashout', '2019-08-19', 0, 0, '2020-03-12 15:56:41', '2020-03-12 15:56:43'),
(214, 13, '1455.00', 480, 'https://i.imgur.com/jZhMm7y.png', 'https://gyazo.com/163278d6c7cd2501f4052ca32a9fcbae', '800.00', '655.00', '117.04', '208.08', '58.52', '32.51', '0.00', 'cashout', '2019-09-02', 0, 0, '2020-03-12 15:57:22', '2020-03-12 15:57:22'),
(215, 13, '752.27', 302, 'https://gyazo.com/934a6482b00b2332a92bebc82bb289f5', 'https://gyazo.com/b867f3c243e00846bf3599f7595035c9', '500.00', '252.27', '45.08', '80.14', '22.54', '12.52', '0.00', 'cashout', '2019-09-16', 0, 0, '2020-03-12 15:58:06', '2020-03-12 15:58:06'),
(216, 13, '680.00', 324, 'https://gyazo.com/029d3c4dc5e3121ca90896983c613082', 'https://gyazo.com/a8b36011418d682cf7497bdb39790f51', '500.00', '180.00', '32.15', '57.18', '16.08', '8.93', '0.00', 'cashout', '2019-09-30', 0, 0, '2020-03-12 15:58:24', '2020-03-12 15:58:24'),
(217, 13, '720.00', 252, 'https://gyazo.com/7d54a4144ce2ba00f85221147c837e9d', 'https://gyazo.com/3e18c7a1a3cf25405ec9667b92657189', '500.00', '220.00', '39.31', '69.88', '19.65', '10.92', '0.00', 'cashout', '2019-10-14', 0, 0, '2020-03-12 15:59:00', '2020-03-12 15:59:00'),
(218, 13, '490.00', 398, 'https://gyazo.com/b9eb3ed540d2bec1f06da733d5222619', 'https://gyazo.com/7d3c60c4a18a8e48af5c1b256ed69b31', '500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-10-28', 0, 0, '2020-03-12 15:59:21', '2020-03-12 15:59:21'),
(219, 13, '450.00', 31, 'https://gyazo.com/5a860d11538ce855a5c6c1a963c57def', 'https://gyazo.com/86064ad7988e34759f69dca9ce7a018f', '500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-11-11', 0, 0, '2020-03-12 15:59:46', '2020-03-12 15:59:46'),
(220, 13, '385.00', 26, 'https://gyazo.com/b65693c7dbac1389d1e59c21fb31e287', 'https://gyazo.com/b760e9f61953797fa64665eb9a38f21e', '500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-11-25', 0, 0, '2020-03-12 16:00:07', '2020-03-12 16:00:07'),
(221, 13, '450.00', 704, 'https://gyazo.com/ddfd474ac8d2167e513c1e8c324aa25b', 'https://gyazo.com/d413ca92d5e1b1fc9c5cd7543f3c0d57', '500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-12-09', 0, 0, '2020-03-12 16:00:34', '2020-03-12 16:00:34'),
(222, 13, '910.00', 569, 'https://gyazo.com/b016cf8256c03f23e38a82fe52f63360', 'https://gyazo.com/642854bf7809c960a45e98cf1854d170', '500.00', '410.00', '73.26', '130.24', '36.63', '20.35', '0.00', 'cashout', '2019-12-23', 0, 0, '2020-03-12 16:01:07', '2020-03-12 16:01:07');
INSERT INTO `user_records` (`id`, `owner_id`, `bankroll`, `games_count`, `winamax_photo`, `pt4_photo`, `stake`, `cashout`, `ft_cashout`, `st_cashout`, `tt_cashout`, `fth_cashout`, `af_cashout`, `action`, `recorded_at`, `is_ft_paid`, `is_st_paid`, `created_at`, `updated_at`) VALUES
(223, 13, '1030.00', 445, 'https://gyazo.com/62a5ddf07cf6a3237ff9588dbb6bfe28', 'https://gyazo.com/37f1c0b320e11ae1d8daf932222eb225', '700.00', '330.00', '57.33', '106.47', '29.48', '19.66', '0.00', 'cashout', '2020-01-06', 0, 0, '2020-03-12 16:01:57', '2020-03-12 16:01:57'),
(224, 13, '480.00', 265, 'https://gyazo.com/6b9f88bfecaf0d09faafbe09cf2912a6', 'https://gyazo.com/1527cdf525098cc8ed6e3a027443ac4b', '500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2020-01-20', 0, 0, '2020-03-12 16:02:29', '2020-03-12 16:02:29'),
(225, 13, '660.00', 314, 'https://gyazo.com/834b2153a1c0fda91e5f5b0dc86683c0', 'https://gyazo.com/4ddfa87b4e65c087e15f92828f427e76', '500.00', '160.00', '27.15', '52.21', '13.89', '11.11', '0.00', 'cashout', '2020-02-03', 0, 0, '2020-03-12 16:03:09', '2020-03-12 16:03:09'),
(226, 13, '610.00', 182, 'https://gyazo.com/ee1ca7a22396dc55744e441b3729b82c', 'https://gyazo.com/2a9df2edd97446c0f43b06a547cd0100', '500.00', '110.00', '18.59', '35.90', '9.54', '7.63', '0.00', 'cashout', '2020-02-17', 0, 0, '2020-03-12 16:03:36', '2020-03-12 16:03:40'),
(227, 13, '730.00', 303, 'https://gyazo.com/d0a500a53f2f9e0ead255ead1f37771d', 'https://gyazo.com/697831bd3f0dd8bd5f267d2877e4b350', '500.00', '230.00', '39.10', '75.06', '19.98', '15.98', '0.00', 'cashout', '2020-03-02', 0, 0, '2020-03-12 16:04:06', '2020-03-12 16:04:06'),
(228, 14, '440.00', 531, 'https://i.imgur.com/iA5yWY6.png', 'https://i.imgur.com/7LDk6QA.png', '200.00', '240.00', '59.56', '59.56', '0.00', '0.00', '0.00', 'cashout', '2019-05-13', 0, 0, '2020-03-12 17:59:38', '2020-03-12 17:59:38'),
(229, 14, '250.00', 428, 'https://i.imgur.com/wotT7tz.png', 'https://i.imgur.com/Luww77Q.png', '200.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-05-27', 0, 0, '2020-03-12 18:01:41', '2020-03-12 18:01:44'),
(230, 14, '1010.00', 700, 'https://i.imgur.com/4JzBE0D.png', 'https://i.imgur.com/nsbGVhs.png', '200.00', '810.00', '201.03', '201.03', '0.00', '0.00', '0.00', 'cashout', '2019-06-10', 0, 0, '2020-03-12 18:02:03', '2020-03-12 18:02:03'),
(231, 14, '320.00', 410, 'https://i.imgur.com/GK6lufN.png', 'https://i.imgur.com/xAcltjp.png', '450.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-06-24', 0, 0, '2020-03-12 18:04:36', '2020-03-12 18:06:39'),
(232, 14, '388.00', 318, 'https://i.imgur.com/fdq07UD.png', 'https://i.imgur.com/VMLDeyS.png', '450.00', '0.00', '46.65', '46.65', '0.00', '0.00', '0.00', 'small_profit', '2019-07-08', 0, 0, '2020-03-12 18:05:13', '2020-03-12 18:06:33'),
(233, 14, '688.00', 244, 'https://i.imgur.com/oHcokq0.png', 'https://i.imgur.com/uXEZdsv.png', '450.00', '238.00', '59.06', '59.06', '0.00', '0.00', '0.00', 'cashout', '2019-07-22', 0, 0, '2020-03-12 18:08:29', '2020-03-12 18:08:29'),
(234, 14, '690.00', 269, 'https://i.imgur.com/vFMieoG.png', 'https://i.imgur.com/5t49R8r.png', '450.00', '240.00', '47.65', '71.47', '23.82', '0.00', '0.00', 'cashout', '2019-08-05', 0, 0, '2020-03-12 18:13:20', '2020-03-12 18:13:20'),
(235, 14, '1211.00', 250, 'https://i.imgur.com/jmdSyw6.png', 'https://i.imgur.com/gP3DUVa.png', '450.00', '761.00', '135.98', '241.75', '67.99', '37.77', '0.00', 'cashout', '2019-08-19', 0, 0, '2020-03-12 18:13:54', '2020-03-12 18:13:54'),
(236, 14, '320.00', 294, 'https://i.imgur.com/EFEVOCB.png', 'https://i.imgur.com/f8Hi7pL.png', '650.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-09-02', 0, 0, '2020-03-12 18:14:50', '2020-03-12 18:14:50'),
(237, 14, '270.00', 369, 'https://i.imgur.com/Ea9Dkzi.png', 'https://i.imgur.com/8r8Ht8I.png', '900.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-09-16', 0, 0, '2020-03-12 18:15:28', '2020-03-12 18:15:28'),
(238, 14, '70.00', 447, 'https://i.imgur.com/mnLSXGk.png', 'https://i.imgur.com/zz9bzX3.png', '1150.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-09-30', 0, 0, '2020-03-12 18:16:05', '2020-03-12 18:16:05'),
(239, 14, '150.00', 399, 'https://i.imgur.com/kNmTYTO.png', 'https://i.imgur.com/5fmf4d6.png', '1350.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-10-14', 0, 0, '2020-03-12 18:16:36', '2020-03-12 18:16:36'),
(240, 14, '310.00', 287, 'https://i.imgur.com/VCCiuQg.png', 'https://i.imgur.com/ZBp6py8.png', '1350.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-10-28', 0, 0, '2020-03-12 18:17:11', '2020-03-12 18:17:11'),
(241, 14, '515.00', 369, 'https://i.imgur.com/FF7bfWj.png', 'https://i.imgur.com/PjqWyWe.png', '1350.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-11-11', 0, 0, '2020-03-12 18:17:32', '2020-03-12 18:17:32'),
(242, 14, '785.00', 490, 'https://i.imgur.com/LhQ9JmC.png', 'https://i.imgur.com/VUlz7uy.png', '1350.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-11-25', 0, 0, '2020-03-12 18:17:59', '2020-03-12 18:17:59'),
(243, 14, '1030.00', 522, 'https://i.imgur.com/QIFg5ph.png', 'https://i.imgur.com/9F5L12f.png', '1350.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-12-09', 0, 0, '2020-03-12 18:18:18', '2020-03-12 18:18:18'),
(244, 14, '1665.00', 480, 'https://i.imgur.com/RZvev1d.png', 'https://i.imgur.com/p2nA7BP.png', '1350.00', '315.00', '56.28', '100.06', '28.14', '15.63', '0.00', 'cashout', '2019-12-23', 0, 0, '2020-03-12 18:18:44', '2020-03-12 18:18:44'),
(245, 14, '2413.54', 1023, 'https://i.imgur.com/EJPWX7A.png', 'https://i.imgur.com/BqFtK2a.png', '1550.00', '863.54', '150.02', '278.61', '77.15', '51.44', '0.00', 'cashout', '2020-01-06', 0, 0, '2020-03-12 18:19:44', '2020-03-12 18:20:06'),
(246, 14, '941.00', 572, 'https://i.imgur.com/75se89C.png', 'https://i.imgur.com/bVYpomC.png', '586.00', '355.00', '61.67', '114.53', '31.72', '21.14', '0.00', 'cashout', '2020-01-20', 0, 0, '2020-03-12 18:24:35', '2020-03-12 18:26:05'),
(247, 14, '781.00', 490, 'https://i.imgur.com/54Z8hDS.png', 'https://i.imgur.com/dhjHSHN.png', '586.00', '195.00', '33.14', '63.64', '16.94', '13.55', '0.00', 'cashout', '2020-02-03', 0, 0, '2020-03-12 18:27:21', '2020-03-12 18:27:30'),
(248, 14, '711.44', 428, 'https://i.imgur.com/JPhgnFk.png', 'https://i.imgur.com/nJkgFod.png', '586.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2020-02-17', 0, 0, '2020-03-12 18:28:18', '2020-03-12 18:28:37'),
(249, 14, '624.00', 220, 'https://i.imgur.com/KrT2SHx.png', 'https://i.imgur.com/ah6D4Fl.png', '586.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2020-03-02', 0, 0, '2020-03-12 18:29:08', '2020-03-12 18:29:19'),
(250, 15, '675.00', 559, 'http://prntscr.com/o6h7cs', 'http://prntscr.com/o6h8ud', '250.00', '425.00', '105.47', '105.47', '0.00', '0.00', '0.00', 'cashout', '2019-06-24', 0, 0, '2020-03-12 18:32:52', '2020-03-12 18:32:52'),
(251, 15, '220.00', 224, 'http://prntscr.com/ocghje', 'http://prntscr.com/ocgj29', '250.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-07-08', 0, 0, '2020-03-12 18:33:17', '2020-03-12 18:33:17'),
(252, 15, '283.00', 895, 'http://prntscr.com/oilyw7', 'http://prntscr.com/oim1aw', '250.00', '33.00', '8.00', '8.00', '0.00', '0.00', '0.00', 'cashout', '2019-07-22', 0, 0, '2020-03-12 18:33:36', '2020-03-12 18:33:38'),
(253, 15, '378.00', 403, 'http://prntscr.com/oowznt', 'http://prntscr.com/oox261', '250.00', '128.00', '25.35', '38.12', '12.69', '0.00', '0.00', 'cashout', '2019-08-05', 0, 0, '2020-03-12 18:34:17', '2020-03-12 18:34:20'),
(254, 15, '110.00', 157, 'http://prntscr.com/ouq4yq', 'http://prntscr.com/ouq5hg', '250.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-08-19', 0, 0, '2020-03-12 18:34:57', '2020-03-12 18:34:57'),
(255, 15, '125.00', 209, 'http://prntscr.com/p1drw6', 'http://prntscr.com/p1dsjp', '450.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-09-02', 0, 0, '2020-03-12 18:35:40', '2020-03-12 18:35:40'),
(256, 15, '120.00', 89, 'http://prntscr.com/p6m7iv', 'http://prntscr.com/p6m84r', '450.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-09-16', 0, 0, '2020-03-12 18:35:59', '2020-03-12 18:35:59'),
(257, 15, '220.00', 223, 'http://prntscr.com/pcyi6x', 'http://prntscr.com/pcyj13', '450.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-09-30', 0, 0, '2020-03-12 18:36:14', '2020-03-12 18:36:14'),
(258, 15, '315.00', 176, 'http://prntscr.com/pjqgin', 'http://prntscr.com/pjqhhn', '450.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-10-14', 0, 0, '2020-03-12 18:36:28', '2020-03-12 18:36:28'),
(259, 15, '240.00', 72, 'http://prntscr.com/pptcv0', 'http://prntscr.com/pptd9x', '450.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-10-28', 0, 0, '2020-03-12 18:36:47', '2020-03-12 18:36:47'),
(260, 15, '210.00', 32, 'http://prntscr.com/pvjvnt', 'http://prntscr.com/pvjwb4', '450.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-11-11', 0, 0, '2020-03-12 18:37:03', '2020-03-12 18:37:03'),
(261, 15, '345.00', 241, 'http://prntscr.com/q1w5jk', 'http://prntscr.com/q1w6b1', '450.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-11-25', 0, 0, '2020-03-12 18:37:20', '2020-03-12 18:37:20'),
(262, 15, '450.00', 69, 'http://prntscr.com/q8gx7z', 'http://prntscr.com/q8gxok', '450.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-12-09', 0, 0, '2020-03-12 18:38:02', '2020-03-12 18:38:04'),
(263, 15, '440.00', 114, 'http://prntscr.com/qev2dy', 'http://prntscr.com/qev2r0', '450.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-12-23', 0, 0, '2020-03-12 18:38:28', '2020-03-12 18:38:28'),
(264, 15, '620.00', 323, 'http://prntscr.com/qjq185', 'http://prntscr.com/qjq249', '650.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2020-01-06', 0, 0, '2020-03-12 18:39:07', '2020-03-12 18:39:07'),
(265, 15, '376.37', 10, 'http://prntscr.com/qrmduu', 'http://prntscr.com/qrmeuc', '400.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2020-01-20', 0, 0, '2020-03-12 18:39:51', '2020-03-12 18:39:51'),
(266, 15, '440.37', 307, 'http://prntscr.com/qwpamk', 'http://prntscr.com/qwpb2q', '400.00', '40.37', '6.66', '13.02', '3.44', '2.76', '0.00', 'cashout', '2020-02-03', 0, 0, '2020-03-12 18:40:38', '2020-03-12 18:40:40'),
(267, 15, '298.00', 70, 'http://prntscr.com/r3ophk', 'http://prntscr.com/r3opvh', '400.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2020-02-17', 0, 0, '2020-03-12 18:41:00', '2020-03-12 18:41:00'),
(268, 15, '280.00', 19, 'http://prntscr.com/ra8qcv', 'http://prntscr.com/ra8p02', '400.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2020-03-02', 0, 0, '2020-03-12 18:41:22', '2020-03-12 18:41:22'),
(269, 16, '278.00', 92, 'https://imgur.com/W1yQ8X8', 'https://imgur.com/FrEv5jZ', '250.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-06-24', 0, 0, '2020-03-12 18:44:11', '2020-03-12 18:44:14'),
(270, 16, '310.00', 79, 'https://imgur.com/ePmKIOm', 'https://imgur.com/TF5jw8r', '250.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-07-08', 0, 0, '2020-03-12 18:44:42', '2020-03-12 18:44:44'),
(271, 16, '425.00', 479, 'https://imgur.com/lgmqBmE', 'https://imgur.com/cRqRq9F', '250.00', '175.00', '43.43', '43.43', '0.00', '0.00', '0.00', 'cashout', '2019-07-22', 0, 0, '2020-03-12 18:45:14', '2020-03-12 18:45:14'),
(272, 16, '330.00', 321, 'https://imgur.com/gfegF2q', 'https://imgur.com/bq2TFLj', '250.00', '80.00', '15.75', '23.75', '7.90', '0.00', '0.00', 'cashout', '2019-08-05', 0, 0, '2020-03-12 18:45:47', '2020-03-12 18:45:49'),
(273, 16, '385.00', 514, 'https://i.imgur.com/G7nL9gI.png', 'https://i.imgur.com/eWtSwut.png', '250.00', '135.00', '24.05', '42.88', '12.05', '6.69', '0.00', 'cashout', '2019-08-19', 0, 0, '2020-03-12 18:46:40', '2020-03-12 18:46:47'),
(274, 16, '582.46', 192, 'https://i.imgur.com/yVdy080.png', 'https://i.imgur.com/jAXtIxX.png', '450.00', '132.46', '23.59', '42.07', '11.82', '6.57', '0.00', 'cashout', '2019-09-02', 0, 0, '2020-03-12 18:47:21', '2020-03-12 18:47:24'),
(275, 16, '515.00', 372, 'https://i.imgur.com/ZrxixgE.png', 'https://i.imgur.com/bHD3zxR.png', '450.00', '65.00', '11.45', '20.55', '5.76', '3.20', '0.00', 'cashout', '2019-09-16', 0, 0, '2020-03-12 18:47:45', '2020-03-12 18:47:48'),
(276, 16, '540.00', 570, 'https://i.imgur.com/ZYljuE7.png', 'https://i.imgur.com/Wa7E3bw.png', '450.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-09-30', 0, 0, '2020-03-12 18:48:06', '2020-03-12 18:48:09'),
(277, 16, '635.00', 496, 'https://i.imgur.com/uKvi96r.png', 'https://i.imgur.com/XGc49Gy.png', '450.00', '185.00', '33.05', '58.77', '16.53', '9.18', '0.00', 'cashout', '2019-10-14', 0, 0, '2020-03-12 18:48:26', '2020-03-12 18:48:26'),
(278, 16, '455.00', 429, 'https://i.imgur.com/xdk79mZ.png', 'https://i.imgur.com/AbMOmps.png', '450.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-10-28', 0, 0, '2020-03-12 18:49:12', '2020-03-12 18:49:15'),
(279, 16, '585.00', 435, 'https://i.imgur.com/JMV0hiy.png', 'https://i.imgur.com/GYP322j.png', '450.00', '135.00', '24.05', '42.88', '12.05', '6.69', '0.00', 'cashout', '2019-11-11', 0, 0, '2020-03-12 18:49:30', '2020-03-12 18:49:33'),
(280, 16, '920.00', 315, 'https://i.imgur.com/QcjMlYo.png', 'https://i.imgur.com/NkLsgKb.png', '450.00', '470.00', '83.98', '149.30', '41.99', '23.33', '0.00', 'cashout', '2019-11-25', 0, 0, '2020-03-12 18:49:52', '2020-03-12 18:49:52'),
(281, 16, '700.00', 227, 'https://i.imgur.com/tx3PJeR.png', 'https://i.imgur.com/qhJkkJM.png', '450.00', '250.00', '44.67', '79.42', '22.34', '12.41', '0.00', 'cashout', '2019-12-09', 0, 0, '2020-03-12 18:50:22', '2020-03-12 18:50:22'),
(282, 16, '470.00', 177, 'https://i.imgur.com/wskQVvn.png', 'https://i.imgur.com/VSHgiw0.png', '450.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-12-23', 0, 0, '2020-03-12 18:50:46', '2020-03-12 18:50:58'),
(283, 16, '457.37', 404, 'https://i.imgur.com/nQPXjOW.png', 'https://i.imgur.com/bzKSAYf.png', '650.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2020-01-06', 0, 0, '2020-03-12 18:51:55', '2020-03-12 18:51:55'),
(284, 16, '687.37', 375, 'https://i.imgur.com/A5PExWz.png', 'https://i.imgur.com/A6gIJZU.png', '650.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2020-01-20', 0, 0, '2020-03-12 18:52:28', '2020-03-12 18:52:29'),
(285, 16, '737.37', 0, 'https://i.imgur.com/wqqcIi4.png', 'https://i.imgur.com/u1O5i6y.png', '650.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2020-02-03', 0, 0, '2020-03-12 18:53:26', '2020-03-12 18:53:27'),
(286, 16, '857.37', 176, 'https://i.imgur.com/PwXoXjC.png', 'https://i.imgur.com/jDPryOz.png', '650.00', '207.37', '35.25', '67.67', '18.01', '14.41', '0.00', 'cashout', '2020-02-17', 0, 0, '2020-03-12 18:53:46', '2020-03-12 18:53:46'),
(287, 16, '600.00', 238, 'https://i.imgur.com/yXtCgJz.png', 'https://i.imgur.com/9XzOc2v.png', '650.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2020-03-02', 0, 0, '2020-03-12 18:54:03', '2020-03-12 18:54:03'),
(288, 17, '2211.00', 3492, 'https://imgur.com/H6mVKpw', 'https://imgur.com/38yMlox', '1150.00', '1061.00', '113.75', '202.23', '56.88', '31.60', '0.00', 'cashout', '2019-08-19', 0, 0, '2020-03-12 18:57:02', '2020-03-12 18:57:02'),
(289, 17, '1215.00', 300, 'https://imgur.com/38yMlox', 'https://imgur.com/Xas9CzN', '600.00', '615.00', '65.93', '117.22', '32.97', '18.32', '0.00', 'cashout', '2019-09-02', 0, 0, '2020-03-12 18:57:48', '2020-03-12 18:57:48'),
(290, 17, '1026.00', 1407, 'https://imgur.com/IlKGAhk', 'https://imgur.com/IO10Zo1', '600.00', '426.00', '45.67', '81.19', '22.83', '12.69', '0.00', 'cashout', '2019-09-16', 0, 0, '2020-03-12 18:58:06', '2020-03-12 18:58:06'),
(291, 17, '350.00', 1495, 'https://imgur.com/vtdAXQp', 'https://imgur.com/kAO851q', '600.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-09-30', 0, 0, '2020-03-12 18:58:37', '2020-03-12 18:58:37'),
(292, 17, '1437.00', 2499, 'https://imgur.com/9EeX45K', 'https://imgur.com/UmDtIEj', '1000.00', '437.00', '46.85', '83.29', '23.43', '13.01', '0.00', 'cashout', '2019-10-14', 0, 0, '2020-03-12 18:59:05', '2020-03-12 18:59:05'),
(293, 17, '1250.00', 2057, 'https://imgur.com/iofdvmt', 'https://imgur.com/R8UCNcM', '1000.00', '250.00', '24.05', '42.88', '12.05', '6.69', '0.00', 'cashout', '2019-10-28', 0, 0, '2020-03-12 18:59:43', '2020-03-12 19:00:44'),
(294, 17, '2980.91', 1067, 'https://i.imgur.com/ZtJ0pgP.png', 'https://imgur.com/SdqETkv', '1000.00', '1980.91', '212.38', '377.57', '106.19', '59.00', '0.00', 'cashout', '2019-11-11', 0, 0, '2020-03-12 19:01:21', '2020-03-12 19:01:21'),
(295, 17, '2110.00', 1858, 'https://imgur.com/dDFTGss', 'https://imgur.com/5FowBGE', '1000.00', '1110.00', '119.01', '211.57', '59.50', '33.06', '0.00', 'cashout', '2019-11-25', 0, 0, '2020-03-12 19:02:30', '2020-03-12 19:02:30'),
(296, 17, '2730.00', 1763, 'https://imgur.com/wwLuch9', 'https://imgur.com/tot897r', '1000.00', '1730.00', '185.48', '329.75', '92.74', '51.52', '0.00', 'cashout', '2019-12-09', 0, 0, '2020-03-12 19:02:48', '2020-03-12 19:02:48'),
(297, 17, '3236.00', 1581, 'https://imgur.com/0qLzPAI', 'https://imgur.com/7xicyU9', '1000.00', '2236.00', '239.73', '426.19', '119.87', '66.59', '0.00', 'cashout', '2019-12-23', 0, 0, '2020-03-12 19:03:15', '2020-03-12 19:03:15'),
(298, 17, '2639.80', 1028, 'https://imgur.com/Qpwinii', 'https://imgur.com/cPj6J8N', '1200.00', '1439.80', '150.08', '278.72', '77.18', '51.46', '0.00', 'cashout', '2020-01-06', 0, 0, '2020-03-12 19:04:15', '2020-03-12 19:04:15'),
(299, 17, '2340.00', 2432, 'https://imgur.com/L7THo4d', 'https://imgur.com/rXgaJZe', '1200.00', '1140.00', '118.83', '220.68', '61.11', '40.74', '0.00', 'cashout', '2020-01-20', 0, 0, '2020-03-12 19:04:47', '2020-03-12 19:04:47'),
(300, 17, '1437.00', 2420, 'https://imgur.com/LvzdZF2', 'https://imgur.com/esQTXSr', '900.00', '537.00', '54.77', '105.15', '27.99', '22.39', '0.00', 'cashout', '2020-02-03', 0, 0, '2020-03-12 19:05:57', '2020-03-12 19:05:57'),
(301, 17, '1620.00', 1944, 'https://imgur.com/j0UTUOn', 'https://imgur.com/uxmPDWo', '900.00', '720.00', '73.44', '140.99', '37.53', '30.02', '0.00', 'cashout', '2020-02-17', 0, 0, '2020-03-12 19:06:15', '2020-03-12 19:06:15'),
(302, 17, '2661.00', 2112, 'https://imgur.com/6DFSHk8', 'https://imgur.com/mM5VPWk', '900.00', '1761.00', '137.71', '264.37', '70.36', '56.29', '0.00', 'cashout', '2020-03-02', 0, 0, '2020-03-12 19:06:59', '2020-03-12 19:07:45'),
(303, 18, '95.00', 1042, 'https://i.imgur.com/0uvxe3T.png', 'https://i.imgur.com/GI6wQ2o.png', '600.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-07-22', 0, 0, '2020-03-12 19:10:41', '2020-03-12 19:10:41'),
(304, 18, '725.00', 496, 'https://i.imgur.com/SWQ7bkG.png', 'https://i.imgur.com/KvpY7mT.png', '600.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-08-05', 0, 0, '2020-03-12 19:11:24', '2020-03-12 19:11:26'),
(305, 18, '1050.00', 2001, 'https://i.imgur.com/fgxRcSk.png', 'https://i.imgur.com/uTFDiKr.png', '600.00', '450.00', '80.41', '142.95', '40.20', '22.34', '0.00', 'cashout', '2019-08-19', 0, 0, '2020-03-12 19:11:59', '2020-03-12 19:11:59'),
(306, 18, '1090.00', 884, 'https://i.imgur.com/FcjlO6i.png', 'https://i.imgur.com/K9wnwbZ.png', '800.00', '290.00', '51.82', '92.12', '25.91', '14.39', '0.00', 'cashout', '2019-09-02', 0, 0, '2020-03-12 19:12:25', '2020-03-12 19:12:25'),
(307, 18, '442.00', 588, 'https://i.imgur.com/pqAMaXQ.png', 'https://i.imgur.com/4liotnv.png', '500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-09-16', 0, 0, '2020-03-12 19:13:02', '2020-03-12 19:13:02'),
(308, 18, '907.00', 487, 'https://i.imgur.com/3uJO9on.png', 'https://i.imgur.com/JdTWzgJ.png', '500.00', '407.00', '72.72', '129.29', '36.36', '20.20', '0.00', 'cashout', '2019-09-30', 0, 0, '2020-03-12 19:13:22', '2020-03-12 19:13:22'),
(309, 18, '708.00', 534, 'https://i.imgur.com/TslS3d5.png', 'https://i.imgur.com/oZjg9Z6.png', '500.00', '208.00', '37.16', '66.07', '18.58', '10.32', '0.00', 'cashout', '2019-10-14', 0, 0, '2020-03-12 19:14:05', '2020-03-12 19:14:05'),
(310, 18, '475.00', 228, 'https://i.imgur.com/M0AvgKJ.png', 'https://i.imgur.com/HQ9DS4F.png', '500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-10-28', 0, 0, '2020-03-12 19:14:28', '2020-03-12 19:14:28'),
(311, 18, '305.00', 210, 'https://i.imgur.com/MVr7os1.png', 'https://i.imgur.com/zrAFzpQ.png', '500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-11-11', 0, 0, '2020-03-12 19:14:49', '2020-03-12 19:14:49'),
(312, 18, '165.00', 129, 'https://i.imgur.com/Wzp8tdQ.png', 'https://i.imgur.com/NYpK3Ei.png', '500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-11-25', 0, 0, '2020-03-12 19:15:04', '2020-03-12 19:15:04'),
(313, 18, '400.00', 832, 'https://i.imgur.com/cGuaKIi.png', 'https://i.imgur.com/qBFEpca.png', '500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-12-09', 0, 0, '2020-03-12 19:15:20', '2020-03-12 19:15:20'),
(314, 18, '380.00', 747, 'https://i.imgur.com/lrBQB8j.png', 'https://i.imgur.com/ZvZRBLR.png', '500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-12-23', 0, 0, '2020-03-12 19:15:35', '2020-03-12 19:15:35'),
(315, 18, '1500.00', 642, 'https://i.imgur.com/LOHyfgR.png', 'https://i.imgur.com/g3ArRSQ.png', '700.00', '800.00', '125.08', '232.30', '64.33', '42.89', '0.00', 'cashout', '2020-01-06', 0, 0, '2020-03-12 19:16:17', '2020-03-12 19:16:35'),
(316, 18, '1207.00', 550, 'https://i.imgur.com/lxup8VV.png', 'https://i.imgur.com/uevOcN4.png', '500.00', '707.00', '122.83', '228.10', '63.17', '42.11', '0.00', 'cashout', '2020-01-20', 0, 0, '2020-03-12 19:17:39', '2020-03-12 19:17:39'),
(317, 18, '260.00', 699, 'https://i.imgur.com/x7t0108.png', 'https://i.imgur.com/WAJjNI7.png', '500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2020-02-03', 0, 0, '2020-03-12 19:18:29', '2020-03-12 19:18:29'),
(318, 18, '710.00', 532, 'https://i.imgur.com/Y8QhYi4.png', 'https://i.imgur.com/ckYWCE5.png', '500.00', '210.00', '35.69', '68.53', '18.24', '14.59', '0.00', 'cashout', '2020-02-17', 0, 0, '2020-03-12 19:18:46', '2020-03-12 19:18:46'),
(319, 18, '665.00', 775, 'https://i.imgur.com/6dg89iJ.png', 'https://i.imgur.com/d4MeCRy.png', '500.00', '165.00', '28.01', '53.85', '14.33', '11.46', '0.00', 'cashout', '2020-03-02', 0, 0, '2020-03-12 19:19:04', '2020-03-12 19:19:04'),
(320, 19, '2347.00', 3473, 'https://i.imgur.com/Y42Ecc3.png', 'https://i.imgur.com/mmYfMc2.png', '750.00', '1597.00', '285.37', '507.33', '142.69', '79.27', '0.00', 'cashout', '2019-10-14', 0, 0, '2020-03-12 19:21:44', '2020-03-12 19:21:44'),
(321, 19, '715.00', 725, 'https://i.imgur.com/oT5vuSx.jpg', 'https://i.imgur.com/R3ex2Qu.png', '750.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-10-28', 0, 0, '2020-03-12 19:22:03', '2020-03-12 19:22:03'),
(322, 19, '655.00', 485, 'https://i.imgur.com/2wcwRfz.png', 'https://i.imgur.com/hsF0joN.png', '750.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-11-11', 0, 0, '2020-03-12 19:22:18', '2020-03-12 19:22:18'),
(323, 19, '810.00', 631, 'https://i.imgur.com/mMcb29K.png', 'https://i.imgur.com/SmtyDYy.png', '750.00', '60.00', '10.55', '18.95', '5.31', '2.95', '0.00', 'cashout', '2019-11-25', 0, 0, '2020-03-12 19:22:35', '2020-03-12 19:22:40'),
(324, 19, '1090.00', 592, 'https://i.imgur.com/x910FQJ.png', 'https://i.imgur.com/ayY8pzs.png', '750.00', '340.00', '60.75', '108.01', '30.38', '16.88', '0.00', 'cashout', '2019-12-09', 0, 0, '2020-03-12 19:23:02', '2020-03-12 19:23:02'),
(325, 19, '960.75', 110, 'https://i.imgur.com/Si80zfE.png', 'https://i.imgur.com/TFystIB.png', '950.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2020-01-06', 0, 0, '2020-03-12 19:23:20', '2020-03-12 19:24:29'),
(326, 19, '974.00', 595, 'https://i.imgur.com/OBkbGkV.png', 'https://i.imgur.com/nf8cMST.png', '750.00', '224.00', '40.02', '71.16', '20.01', '11.12', '0.00', 'cashout', '2019-12-23', 0, 0, '2020-03-12 19:23:21', '2020-03-12 19:23:21'),
(327, 19, '693.50', 283, 'https://i.imgur.com/i306BCx.png', 'https://i.imgur.com/57YhwGS.png', '450.00', '243.50', '42.30', '78.56', '21.75', '14.50', '0.00', 'cashout', '2020-01-20', 0, 0, '2020-03-12 19:25:20', '2020-03-12 19:25:57'),
(328, 19, '555.00', 275, 'https://i.imgur.com/nZzBuGU.jpg', 'https://i.imgur.com/mCoPWpq.png', '450.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2020-02-03', 0, 0, '2020-03-12 19:27:10', '2020-03-12 19:27:12'),
(329, 19, '735.00', 275, 'https://i.imgur.com/UL0vFuf.png', 'https://i.imgur.com/ng5lk4d.png', '450.00', '285.00', '48.45', '93.01', '24.76', '19.80', '0.00', 'cashout', '2020-02-17', 0, 0, '2020-03-12 19:27:33', '2020-03-12 19:27:33'),
(330, 19, '500.00', 265, 'https://i.imgur.com/6HiX8sS.png', 'https://i.imgur.com/8MmbCuS.png', '450.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2020-03-02', 0, 0, '2020-03-12 19:27:55', '2020-03-12 19:27:57'),
(331, 20, '237.00', 293, 'https://imgur.com/a/MFtq8nw', 'https://imgur.com/a/GpzDTgC', '300.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-07-22', 0, 0, '2020-03-12 19:40:15', '2020-03-12 19:40:15'),
(332, 20, '252.00', 243, 'https://imgur.com/a/lyQv0xN', 'https://imgur.com/a/3Kzy7FU', '300.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-08-05', 0, 0, '2020-03-12 19:40:36', '2020-03-12 19:40:36'),
(333, 20, '372.00', 113, 'https://imgur.com/a/T1oasoN', 'https://imgur.com/a/O3jP2SE', '300.00', '72.00', '12.71', '22.79', '6.39', '3.55', '0.00', 'cashout', '2019-08-19', 0, 0, '2020-03-12 19:41:17', '2020-03-12 19:41:20'),
(334, 20, '660.00', 210, 'https://imgur.com/a/c4iOxpr', 'https://imgur.com/a/qeDRuGt', '300.00', '360.00', '64.33', '114.36', '32.16', '17.87', '0.00', 'cashout', '2019-09-02', 0, 0, '2020-03-12 19:41:33', '2020-03-12 19:41:33'),
(335, 20, '615.00', 224, 'https://imgur.com/a/oQzT6Vj', 'https://imgur.com/a/5Lmo9Rh', '300.00', '315.00', '56.28', '100.06', '28.14', '15.63', '0.00', 'cashout', '2019-09-16', 0, 0, '2020-03-12 19:41:51', '2020-03-12 19:41:51'),
(336, 20, '250.00', 309, 'https://imgur.com/a/4nwYqo8', 'https://imgur.com/a/xnSmbiH', '300.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-09-30', 0, 0, '2020-03-12 19:42:36', '2020-03-12 19:42:36'),
(337, 20, '430.00', 200, 'https://imgur.com/a/xHo0y3g', 'https://imgur.com/a/7UojuhW', '300.00', '130.00', '23.15', '41.29', '11.60', '6.44', '0.00', 'cashout', '2019-10-14', 0, 0, '2020-03-12 19:42:57', '2020-03-12 19:43:00'),
(338, 20, '150.00', 135, 'https://imgur.com/a/Kq9s4JP', 'https://imgur.com/a/kSfnnJo', '300.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-10-28', 0, 0, '2020-03-12 19:43:17', '2020-03-12 19:43:17'),
(339, 20, '90.00', 29, 'https://imgur.com/a/tV1jzkq', 'https://imgur.com/a/6lqimQG', '300.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-11-11', 0, 0, '2020-03-12 19:43:35', '2020-03-12 19:43:35'),
(340, 20, '90.00', 2, 'https://imgur.com/a/1VnYiit', 'https://imgur.com/a/pMb5f0v', '300.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-11-25', 0, 0, '2020-03-12 19:43:56', '2020-03-12 19:43:56'),
(341, 20, '75.00', 5, 'https://imgur.com/a/1VnYiit', 'https://imgur.com/a/Sx7loFh', '300.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-12-09', 0, 0, '2020-03-12 19:44:11', '2020-03-12 19:44:11'),
(342, 20, '95.00', 36, 'https://imgur.com/a/tv7b29E', 'https://imgur.com/a/ThZddDr', '300.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-12-23', 0, 0, '2020-03-12 19:44:27', '2020-03-12 19:44:27'),
(343, 20, '331.00', 94, 'https://imgur.com/a/2BNisvy', 'https://imgur.com/a/uJ6flaM', '500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2020-01-06', 0, 0, '2020-03-12 19:45:04', '2020-03-12 19:45:04'),
(344, 20, '326.00', 204, 'https://imgur.com/a/fpvEyGn', 'https://imgur.com/a/jI6nf9w', '500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2020-01-20', 0, 0, '2020-03-12 19:45:23', '2020-03-12 19:45:23'),
(345, 20, '296.00', 72, 'https://imgur.com/a/tav6ZEM', 'https://imgur.com/a/o2gDFWS', '500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2020-02-03', 0, 0, '2020-03-12 19:46:02', '2020-03-12 19:46:02'),
(346, 21, '328.00', 200, 'https://i.imgur.com/fpQQ7hm.png', 'https://i.imgur.com/BVPWnPK.png', '300.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-06-10', 0, 0, '2020-03-12 19:49:02', '2020-03-12 19:49:04'),
(347, 21, '396.00', 604, 'https://i.imgur.com/vlcJoMH.png', 'https://i.imgur.com/vQU27fo.png', '300.00', '96.00', '23.75', '23.75', '0.00', '0.00', '0.00', 'cashout', '2019-06-24', 0, 0, '2020-03-12 19:49:33', '2020-03-12 19:49:36'),
(348, 21, '352.00', 943, 'https://i.imgur.com/5qAgGk0.png', 'https://i.imgur.com/g6az63K.png', '300.00', '52.00', '12.75', '12.75', '0.00', '0.00', '0.00', 'cashout', '2019-07-08', 0, 0, '2020-03-12 19:49:50', '2020-03-12 19:49:53'),
(349, 21, '480.00', 763, 'https://i.imgur.com/C4GP52n.png', 'https://i.imgur.com/xQS4yvk.png', '300.00', '180.00', '44.67', '44.67', '0.00', '0.00', '0.00', 'cashout', '2019-07-22', 0, 0, '2020-03-12 19:50:08', '2020-03-12 19:50:08'),
(350, 21, '560.00', 1024, 'https://i.imgur.com/p3VZrWq.png', 'https://i.imgur.com/r8Jyj1R.png', '300.00', '260.00', '51.62', '77.43', '25.81', '0.00', '0.00', 'cashout', '2019-08-05', 0, 0, '2020-03-12 19:50:33', '2020-03-12 19:50:33'),
(351, 21, '520.00', 895, 'https://i.imgur.com/k3u63kI.png', 'https://i.imgur.com/Y9j6jzt.png', '300.00', '220.00', '39.31', '69.88', '19.65', '10.92', '0.00', 'cashout', '2019-08-19', 0, 0, '2020-03-12 19:51:07', '2020-03-12 19:51:07'),
(352, 21, '189.50', 782, 'https://i.imgur.com/QJWa7nO.png', 'https://i.imgur.com/hDdHdyE.png', '900.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-09-02', 0, 0, '2020-03-12 19:51:33', '2020-03-12 19:51:33'),
(353, 21, '781.78', 1040, 'https://i.imgur.com/my9cnu3.png', 'https://i.imgur.com/ocMIaSX.png', '900.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-09-16', 0, 0, '2020-03-12 19:51:59', '2020-03-12 19:51:59'),
(354, 21, '1156.78', 1177, 'https://i.imgur.com/jMkW4ax.png', 'https://i.imgur.com/7y8Gowz.png', '900.00', '256.78', '45.88', '81.57', '22.94', '12.75', '0.00', 'cashout', '2019-09-30', 0, 0, '2020-03-12 19:52:17', '2020-03-12 19:52:17'),
(355, 21, '227.75', 438, 'https://i.imgur.com/IHFzC4S.png', 'https://i.imgur.com/X1s596L.png', '400.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-10-14', 0, 0, '2020-03-12 19:52:51', '2020-03-12 19:52:51'),
(356, 21, '277.75', 393, 'https://i.imgur.com/GDcINZY.png', 'https://i.imgur.com/G52VPeH.png', '400.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-10-28', 0, 0, '2020-03-12 19:53:06', '2020-03-12 19:53:06'),
(357, 21, '552.75', 872, 'https://i.imgur.com/bmbMZgB.png', 'https://i.imgur.com/kqwyo4p.png', '400.00', '152.75', '27.25', '48.52', '13.64', '7.58', '0.00', 'cashout', '2019-11-11', 0, 0, '2020-03-12 19:53:23', '2020-03-12 19:53:23'),
(358, 21, '480.00', 777, 'https://i.imgur.com/QvPv9Ex.png', 'https://i.imgur.com/Q3WiYW1.png', '400.00', '80.00', '14.15', '25.35', '7.11', '3.95', '0.00', 'cashout', '2019-11-25', 0, 0, '2020-03-12 19:53:40', '2020-03-12 19:53:42'),
(359, 21, '550.00', 817, 'https://i.imgur.com/GV2snfC.png', 'https://i.imgur.com/wYF2DV1.png', '400.00', '150.00', '26.75', '47.65', '13.39', '7.44', '0.00', 'cashout', '2019-12-09', 0, 0, '2020-03-12 19:53:56', '2020-03-12 19:53:56'),
(360, 21, '200.00', 1033, 'https://i.imgur.com/LXcx2RR.png', 'https://i.imgur.com/qFvCHAd.png', '600.00', '0.00', '35.73', '63.53', '17.87', '9.93', '0.00', 'small_profit', '2019-12-23', 0, 0, '2020-03-12 19:54:13', '2020-03-12 19:54:34'),
(361, 21, '245.00', 601, 'https://i.imgur.com/mh9GjVg.png', 'https://i.imgur.com/B55Yelm.png', '800.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2020-01-06', 0, 0, '2020-03-12 19:55:24', '2020-03-12 19:55:24'),
(362, 21, '683.00', 1114, 'https://i.imgur.com/seqIfkk.png', 'https://i.imgur.com/mn1RijO.png', '1100.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2020-01-20', 0, 0, '2020-03-12 19:56:59', '2020-03-12 19:57:25'),
(363, 21, '888.00', 969, 'https://i.imgur.com/9eErMC2.png', 'https://i.imgur.com/dK2DPEO.png', '1100.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2020-02-03', 0, 0, '2020-03-12 19:58:17', '2020-03-12 19:58:17'),
(364, 21, '1448.00', 1284, 'https://i.imgur.com/mQRxdO8.png', 'https://i.imgur.com/tTO1yYa.png', '1100.00', '348.00', '59.16', '113.57', '30.23', '24.18', '0.00', 'cashout', '2020-02-17', 0, 0, '2020-03-12 19:58:37', '2020-03-12 19:58:37'),
(365, 21, '615.00', 889, 'https://i.imgur.com/goVVkrr.png', 'https://i.imgur.com/o4w7XdW.png', '700.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2020-03-02', 0, 0, '2020-03-12 19:59:07', '2020-03-12 19:59:07'),
(366, 22, '328.00', 280, 'https://imgur.com/W95olgv', 'https://imgur.com/YBuS67f', '200.00', '128.00', '22.79', '40.66', '11.42', '6.35', '0.00', 'cashout', '2019-10-14', 0, 0, '2020-03-12 20:01:22', '2020-03-12 20:01:25'),
(367, 22, '200.00', 172, 'https://imgur.com/QwqsNvd', 'https://imgur.com/fGKPCQA', '200.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-10-28', 0, 0, '2020-03-12 20:01:52', '2020-03-12 20:01:55'),
(368, 22, '280.00', 205, 'https://imgur.com/9BWeUf9', 'https://imgur.com/P1n7Bwd', '200.00', '80.00', '14.15', '25.35', '7.11', '3.95', '0.00', 'cashout', '2019-11-11', 0, 0, '2020-03-12 20:02:13', '2020-03-12 20:02:16'),
(369, 22, '245.00', 190, 'https://imgur.com/yJPQN7S', 'https://imgur.com/PK2dW48', '200.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-11-25', 0, 0, '2020-03-12 20:02:29', '2020-03-12 20:02:33'),
(370, 22, '390.00', 191, 'https://imgur.com/GDKmo1d', 'https://imgur.com/e6SYfwc', '200.00', '190.00', '33.95', '60.35', '16.97', '9.43', '0.00', 'cashout', '2019-12-09', 0, 0, '2020-03-12 20:02:45', '2020-03-12 20:02:45'),
(371, 22, '150.00', 106, 'https://imgur.com/qzhNG8N', 'https://imgur.com/lkaHXoH', '200.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-12-23', 0, 0, '2020-03-12 20:02:59', '2020-03-12 20:02:59'),
(372, 22, '150.00', 0, 'https://imgur.com/SgEo6oz', 'https://imgur.com/U0Wgqmj', '200.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2020-01-06', 0, 0, '2020-03-12 20:03:37', '2020-03-12 20:03:37'),
(373, 22, '110.00', 10, 'https://imgur.com/vk4PwLF', 'https://imgur.com/SjGiAcx', '200.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2020-01-20', 0, 0, '2020-03-12 20:03:58', '2020-03-12 20:03:58'),
(374, 22, '110.00', 0, 'https://imgur.com/w0pTBn7', 'https://imgur.com/Hciqcsb', '200.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2020-02-03', 0, 0, '2020-03-12 20:04:28', '2020-03-12 20:04:28'),
(375, 22, '110.00', 0, 'https://imgur.com/asfurUL', 'https://imgur.com/iiKVFEA', '200.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2020-02-17', 0, 0, '2020-03-12 20:04:47', '2020-03-12 20:04:47'),
(376, 23, '1112.00', 1586, 'https://imgur.com/1il3CLQ', 'https://i.imgur.com/xixJO7Y.png', '550.00', '562.00', '139.48', '139.48', '0.00', '0.00', '0.00', 'cashout', '2019-07-22', 0, 0, '2020-03-12 20:08:00', '2020-03-12 20:08:00'),
(377, 23, '500.00', 557, 'https://imgur.com/zhw6DK2', 'https://imgur.com/t4osPD3', '550.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-08-05', 0, 0, '2020-03-12 20:08:33', '2020-03-12 20:08:33'),
(378, 23, '580.00', 103, 'https://imgur.com/fB9RTC0', 'https://imgur.com/Msd8nw5', '550.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-08-19', 0, 0, '2020-03-12 20:09:14', '2020-03-12 20:09:16'),
(379, 23, '860.00', 164, 'https://imgur.com/hUiifD8', 'https://imgur.com/BeJsVLN', '750.00', '110.00', '19.55', '34.94', '9.81', '5.45', '0.00', 'cashout', '2019-09-02', 0, 0, '2020-03-12 20:09:43', '2020-03-12 20:09:51'),
(380, 23, '516.40', 131, 'https://imgur.com/goXXDW6', 'https://imgur.com/Ea7jVaW', '550.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-09-16', 0, 0, '2020-03-12 20:10:27', '2020-03-12 20:10:39'),
(381, 23, '471.40', 377, 'https://imgur.com/IqnVwSF', 'https://imgur.com/FFeo4Am', '500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-09-30', 0, 0, '2020-03-12 20:11:23', '2020-03-12 20:11:23'),
(382, 23, '641.40', 257, 'https://imgur.com/1rYLaFW', 'https://imgur.com/KUaWldL', '500.00', '141.40', '25.20', '44.91', '12.62', '7.01', '0.00', 'cashout', '2019-10-14', 0, 0, '2020-03-12 20:11:45', '2020-03-12 20:11:45'),
(383, 23, '514.95', 282, 'https://imgur.com/Cvqho6n', 'https://imgur.com/qPoCTIx', '500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-10-28', 0, 0, '2020-03-12 20:12:15', '2020-03-12 20:12:18'),
(384, 23, '680.00', 205, 'https://imgur.com/fdyxeDZ', 'https://imgur.com/rGy1XmK', '500.00', '180.00', '32.15', '57.18', '16.08', '8.93', '0.00', 'cashout', '2019-11-11', 0, 0, '2020-03-12 20:12:32', '2020-03-12 20:12:32'),
(385, 23, '445.00', 35, 'https://imgur.com/RCBbEyK', 'https://imgur.com/ftxcasZ', '500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-11-25', 0, 0, '2020-03-12 20:12:59', '2020-03-12 20:12:59'),
(386, 23, '565.00', 205, 'https://imgur.com/qfvEIya', 'https://imgur.com/seCqzHu', '500.00', '65.00', '11.45', '20.55', '5.76', '3.20', '0.00', 'cashout', '2019-12-09', 0, 0, '2020-03-12 20:13:14', '2020-03-12 20:13:17'),
(387, 23, '590.00', 359, 'https://imgur.com/Qbcbi8G', 'https://imgur.com/GAWiQOf', '500.00', '90.00', '15.95', '28.55', '8.01', '4.45', '0.00', 'cashout', '2019-12-23', 0, 0, '2020-03-12 20:13:36', '2020-03-12 20:13:39'),
(388, 23, '665.00', 239, 'https://imgur.com/K53zExP', 'https://imgur.com/ZpibN1d', '700.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2020-01-06', 0, 0, '2020-03-12 20:14:49', '2020-03-12 20:14:49'),
(389, 23, '1092.10', 601, 'https://imgur.com/f1BpSDj', 'https://imgur.com/yvvGdce', '500.00', '592.10', '102.86', '191.03', '52.90', '35.27', '0.00', 'cashout', '2020-01-20', 0, 0, '2020-03-12 20:15:25', '2020-03-12 20:16:02'),
(390, 23, '790.00', 379, 'https://imgur.com/zht9H2X', 'https://imgur.com/hG0QTm1', '500.00', '290.00', '49.29', '94.64', '25.19', '20.15', '0.00', 'cashout', '2020-02-03', 0, 0, '2020-03-12 20:16:57', '2020-03-12 20:16:57'),
(391, 23, '360.00', 278, 'https://imgur.com/QHd3wGa', 'https://imgur.com/yZgDzYA', '500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2020-02-17', 0, 0, '2020-03-12 20:17:43', '2020-03-12 20:17:43'),
(392, 23, '700.00', 1, 'https://imgur.com/N8FLvYj', 'https://imgur.com/N8FLvYj', '500.00', '200.00', '34.00', '65.27', '17.37', '13.90', '0.00', 'cashout', '2020-03-02', 0, 0, '2020-03-12 20:18:03', '2020-03-12 20:18:03'),
(393, 24, '569.00', 407, 'https://imgur.com/a/eo0aHnf', 'https://imgur.com/a/vwCerEf', '400.00', '169.00', '41.94', '41.94', '0.00', '0.00', '0.00', 'cashout', '2019-06-10', 0, 0, '2020-03-12 20:20:25', '2020-03-12 20:20:25'),
(394, 24, '540.00', 745, 'https://imgur.com/a/3XGETZ0', 'https://imgur.com/a/5wk0HZr', '400.00', '140.00', '34.74', '34.74', '0.00', '0.00', '0.00', 'cashout', '2019-06-24', 0, 0, '2020-03-12 20:20:39', '2020-03-12 20:20:39'),
(395, 24, '475.00', 267, 'https://imgur.com/a/w7yg8AV', 'https://imgur.com/a/3vgCsjQ', '400.00', '75.00', '18.50', '18.50', '0.00', '0.00', '0.00', 'cashout', '2019-07-08', 0, 0, '2020-03-12 20:20:53', '2020-03-12 20:20:56'),
(396, 24, '335.00', 315, 'https://imgur.com/a/NtBKYcZ', 'https://imgur.com/a/Do5ZoAn', '400.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-07-22', 0, 0, '2020-03-12 20:21:12', '2020-03-12 20:21:12'),
(397, 24, '415.00', 145, 'https://imgur.com/a/6R1954q', 'https://imgur.com/a/dJ5yjsE', '400.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-08-05', 0, 0, '2020-03-12 20:21:55', '2020-03-12 20:21:57'),
(398, 24, '515.00', 320, 'https://imgur.com/a/aT11cDP', 'https://imgur.com/a/27KUo3n', '400.00', '115.00', '20.45', '36.53', '10.26', '5.70', '0.00', 'cashout', '2019-08-19', 0, 0, '2020-03-12 20:22:27', '2020-03-12 20:22:31'),
(399, 24, '350.00', 535, 'https://imgur.com/a/HDLrApP', 'https://imgur.com/a/uduUyD8', '400.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-09-02', 0, 0, '2020-03-12 20:22:47', '2020-03-12 20:22:47'),
(400, 24, '142.38', 256, 'https://imgur.com/a/Mo1x873', 'https://imgur.com/a/GyOl9Gk', '400.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-09-16', 0, 0, '2020-03-12 20:23:06', '2020-03-12 20:23:06'),
(401, 24, '67.38', 74, 'https://imgur.com/a/duzoDeD', 'https://imgur.com/a/34P6wb3', '400.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-09-30', 0, 0, '2020-03-12 20:23:23', '2020-03-12 20:23:23'),
(402, 24, '62.38', 271, 'https://imgur.com/a/hNnViJJ', 'https://imgur.com/a/lejT9HR', '800.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-10-14', 0, 0, '2020-03-12 20:24:04', '2020-03-12 20:24:04'),
(403, 24, '37.47', 252, 'https://imgur.com/a/HjCVnJh', 'https://imgur.com/a/Zmy0Qio', '800.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-10-28', 0, 0, '2020-03-12 20:24:27', '2020-03-12 20:24:27'),
(404, 24, '227.47', 223, 'https://imgur.com/a/JLQXNe5', 'https://imgur.com/a/OGzEUNB', '800.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-11-11', 0, 0, '2020-03-12 20:24:45', '2020-03-12 20:24:45'),
(405, 24, '412.47', 498, 'https://imgur.com/a/NzClHji', 'https://imgur.com/a/UyyT8mD', '800.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-11-25', 0, 0, '2020-03-12 20:25:03', '2020-03-12 20:25:03'),
(406, 24, '352.47', 418, 'https://imgur.com/a/7RLsxfC', 'https://imgur.com/a/6EF7viD', '800.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-12-09', 0, 0, '2020-03-12 20:25:20', '2020-03-12 20:25:20'),
(407, 24, '237.47', 623, 'https://imgur.com/a/8wnwDIf', 'https://imgur.com/a/Yd3Dg3K', '800.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-12-23', 0, 0, '2020-03-12 20:25:39', '2020-03-12 20:25:39'),
(408, 24, '902.44', 262, 'https://imgur.com/a/oRduu3G', 'https://imgur.com/a/7jbEGoK', '1000.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2020-01-06', 0, 0, '2020-03-12 20:26:22', '2020-03-12 20:26:22'),
(409, 24, '861.64', 433, 'https://imgur.com/a/vNF8jFK', 'https://imgur.com/a/W8nrRNa', '600.00', '261.64', '45.45', '84.41', '23.37', '15.58', '0.00', 'cashout', '2020-01-20', 0, 0, '2020-03-12 20:26:40', '2020-03-12 20:29:57'),
(410, 24, '728.00', 87, 'https://imgur.com/a/yNwSJjv', 'https://imgur.com/a/HefA6zs', '600.00', '128.00', '21.67', '41.77', '11.10', '8.88', '0.00', 'cashout', '2020-02-03', 0, 0, '2020-03-12 20:27:53', '2020-03-12 20:28:25'),
(411, 24, '530.00', 89, 'https://imgur.com/a/Rhyrdni', 'https://imgur.com/a/e85H9r3', '600.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2020-02-17', 0, 0, '2020-03-12 20:30:32', '2020-03-12 20:30:32'),
(412, 24, '530.00', 0, 'https://imgur.com/a/Rhyrdni', 'https://imgur.com/a/16enikX', '600.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2020-03-02', 0, 0, '2020-03-12 20:30:52', '2020-03-12 20:30:52'),
(413, 25, '243.61', 1266, 'https://media.discordapp.net/attachments/545340133109530636/557126117027479562/PokerTracker4_mpdFSJccKr.png', 'https://media.discordapp.net/attachments/545340133109530636/557126117027479562/PokerTracker4_mpdFSJccKr.png', '50.00', '193.61', '48.04', '48.05', '0.00', '0.00', '0.00', 'cashout', '2019-03-18', 0, 0, '2020-03-12 20:33:34', '2020-03-12 20:33:34'),
(414, 25, '86.24', 464, 'https://i.imgur.com/PdnnPwA.png', 'https://i.imgur.com/PdnnPwA.png', '210.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-04-01', 0, 0, '2020-03-12 20:33:54', '2020-03-12 20:34:20'),
(415, 25, '662.00', 521, 'https://i.imgur.com/t6kdPNX.png', 'https://i.imgur.com/t6kdPNX.png', '630.00', '32.00', '7.75', '7.75', '0.00', '0.00', '0.00', 'cashout', '2019-04-15', 0, 0, '2020-03-12 20:35:36', '2020-03-12 20:36:22'),
(416, 25, '245.00', 771, 'https://i.imgur.com/wDUarXt.png', 'https://i.imgur.com/wDUarXt.png', '630.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-04-29', 0, 0, '2020-03-12 20:37:04', '2020-03-12 20:37:04'),
(417, 25, '1295.00', 681, 'https://i.imgur.com/8HVhBqp.png', 'https://i.imgur.com/0qG97o1.png', '630.00', '665.00', '165.04', '165.04', '0.00', '0.00', '0.00', 'cashout', '2019-05-13', 0, 0, '2020-03-12 20:37:31', '2020-03-12 20:37:31'),
(418, 25, '800.00', 664, 'https://i.imgur.com/qe64eV8.png', 'https://i.imgur.com/4QWfGJd.png', '630.00', '170.00', '42.19', '42.19', '0.00', '0.00', '0.00', 'cashout', '2019-05-27', 0, 0, '2020-03-12 20:37:52', '2020-03-12 20:37:52'),
(419, 25, '1060.00', 299, 'https://i.imgur.com/fReE36r.png', 'https://i.imgur.com/iBErO58.png', '630.00', '430.00', '106.72', '106.72', '0.00', '0.00', '0.00', 'cashout', '2019-06-10', 0, 0, '2020-03-12 20:38:06', '2020-03-12 20:38:06'),
(420, 25, '725.00', 544, 'https://i.imgur.com/3LKKM1g.png', 'https://i.imgur.com/Y9FWNqO.png', '630.00', '95.00', '23.50', '23.50', '0.00', '0.00', '0.00', 'cashout', '2019-06-24', 0, 0, '2020-03-12 20:38:25', '2020-03-12 20:38:27'),
(421, 25, '930.00', 577, 'https://i.imgur.com/tzgCkZO.png', 'https://i.imgur.com/GhmHu96.png', '630.00', '300.00', '74.45', '74.45', '0.00', '0.00', '0.00', 'cashout', '2019-07-08', 0, 0, '2020-03-12 20:38:49', '2020-03-12 20:38:49'),
(422, 25, '590.00', 341, 'https://i.imgur.com/Hrfat2c.png', 'https://i.imgur.com/dJHgyQs.png', '630.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-07-22', 0, 0, '2020-03-12 20:39:08', '2020-03-12 20:39:08'),
(423, 25, '975.00', 895, 'https://i.imgur.com/3C6r54b.png', 'https://i.imgur.com/5mv1j8W.png', '630.00', '345.00', '68.49', '102.74', '34.25', '0.00', '0.00', 'cashout', '2019-08-05', 0, 0, '2020-03-12 20:39:41', '2020-03-12 20:39:41'),
(424, 25, '815.00', 496, 'https://i.imgur.com/XDqz2AZ.png', 'https://i.imgur.com/duQvKxn.png', '630.00', '185.00', '33.05', '58.77', '16.53', '9.18', '0.00', 'cashout', '2019-08-19', 0, 0, '2020-03-12 20:40:09', '2020-03-12 20:40:09'),
(425, 25, '685.00', 574, 'https://i.imgur.com/RoyQdjC.png', 'https://i.imgur.com/ggc8KbM.png', '830.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-09-02', 0, 0, '2020-03-12 20:40:33', '2020-03-12 20:41:07'),
(426, 25, '199.67', 788, 'https://i.imgur.com/fz9LUlz.png', 'https://i.imgur.com/bIA8dU2.png', '600.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-09-16', 0, 0, '2020-03-12 20:41:32', '2020-03-12 20:41:32'),
(427, 25, '290.00', 648, 'https://i.imgur.com/CLnwAOp.png', 'https://i.imgur.com/rusHyUH.png', '600.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-09-30', 0, 0, '2020-03-12 20:41:47', '2020-03-12 20:41:47'),
(428, 25, '300.00', 795, 'https://i.imgur.com/wobJSLA.png', 'https://i.imgur.com/DDRqcbW.png', '600.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-10-14', 0, 0, '2020-03-12 20:42:04', '2020-03-12 20:42:04'),
(429, 25, '1030.00', 913, 'https://i.imgur.com/IZfGvPk.png', 'https://i.imgur.com/FlUSU47.png', '600.00', '430.00', '76.83', '136.60', '38.42', '21.34', '0.00', 'cashout', '2019-10-28', 0, 0, '2020-03-12 20:42:25', '2020-03-12 20:42:25'),
(430, 25, '975.00', 497, 'https://i.imgur.com/2roIrTQ.png', 'https://i.imgur.com/gad7Muk.png', '600.00', '375.00', '67.01', '119.13', '33.51', '18.61', '0.00', 'cashout', '2019-11-11', 0, 0, '2020-03-12 20:42:41', '2020-03-12 20:42:41'),
(431, 25, '1100.00', 729, 'https://i.imgur.com/Cccyf2f.png', 'https://i.imgur.com/hAWpVed.png', '600.00', '500.00', '89.34', '158.84', '44.67', '24.82', '0.00', 'cashout', '2019-11-25', 0, 0, '2020-03-12 20:42:54', '2020-03-12 20:42:54'),
(432, 25, '1000.00', 913, 'https://i.imgur.com/SIXTR1q.png', 'https://i.imgur.com/jdFcKu4.png', '600.00', '400.00', '71.47', '127.07', '35.74', '19.85', '0.00', 'cashout', '2019-12-09', 0, 0, '2020-03-12 20:43:18', '2020-03-12 20:43:18'),
(433, 25, '1035.00', 1032, 'https://i.imgur.com/aNUrlhj.png', 'https://i.imgur.com/1eHsjBD.png', '600.00', '435.00', '77.73', '138.19', '38.87', '21.59', '0.00', 'cashout', '2019-12-23', 0, 0, '2020-03-12 20:43:33', '2020-03-12 20:43:33'),
(434, 25, '1136.00', 511, 'https://i.imgur.com/8dXqIm9.png', 'https://i.imgur.com/0BWbKwk.png', '800.00', '336.00', '58.37', '108.40', '30.02', '20.01', '0.00', 'cashout', '2020-01-06', 0, 0, '2020-03-12 20:44:14', '2020-03-12 20:44:14'),
(435, 25, '1260.00', 961, 'https://i.imgur.com/B509w1A.png', 'https://i.imgur.com/3xvJTGS.png', '500.00', '760.00', '132.03', '245.20', '67.90', '45.27', '0.00', 'cashout', '2020-01-20', 0, 0, '2020-03-12 20:44:41', '2020-03-12 20:44:41'),
(436, 25, '525.00', 558, 'https://i.imgur.com/tXoKRMl.png', 'https://i.imgur.com/W1laWKC.png', '500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2020-02-03', 0, 0, '2020-03-12 20:45:17', '2020-03-12 20:45:20');
INSERT INTO `user_records` (`id`, `owner_id`, `bankroll`, `games_count`, `winamax_photo`, `pt4_photo`, `stake`, `cashout`, `ft_cashout`, `st_cashout`, `tt_cashout`, `fth_cashout`, `af_cashout`, `action`, `recorded_at`, `is_ft_paid`, `is_st_paid`, `created_at`, `updated_at`) VALUES
(437, 25, '1235.00', 1239, 'https://i.imgur.com/MlvtSWA.png', 'https://i.imgur.com/MlvtSWA.png', '500.00', '735.00', '124.95', '239.87', '63.84', '51.07', '0.00', 'cashout', '2020-02-17', 0, 0, '2020-03-12 20:45:55', '2020-03-12 20:45:55'),
(438, 25, '900.00', 814, 'https://i.imgur.com/o2rrBNf.png', 'https://i.imgur.com/08XPD2C.png', '500.00', '400.00', '68.00', '130.54', '34.74', '27.80', '0.00', 'cashout', '2020-03-02', 0, 0, '2020-03-12 20:46:12', '2020-03-12 20:46:12'),
(439, 26, '229.00', 852, 'https://i.imgur.com/WvWzU5M.png', 'https://i.imgur.com/77bJQwG.png', '150.00', '79.00', '19.50', '19.50', '0.00', '0.00', '0.00', 'cashout', '2019-05-13', 0, 0, '2020-03-12 20:49:03', '2020-03-12 20:49:07'),
(440, 26, '620.00', 1167, 'https://i.imgur.com/35jOR0w.png', 'https://i.imgur.com/35jOR0w.png', '150.00', '470.00', '116.64', '116.64', '0.00', '0.00', '0.00', 'cashout', '2019-05-27', 0, 0, '2020-03-12 20:49:23', '2020-03-12 20:49:23'),
(441, 25, '410.00', 1353, 'https://i.imgur.com/UIXj1uj.png', 'https://i.imgur.com/Fh8TFfo.png', '500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-06-10', 0, 0, '2020-03-12 20:49:48', '2020-03-12 20:49:48'),
(442, 26, '450.00', 1355, 'http://aa', 'http://aa', '950.00', '0.00', '74.45', '74.45', '0.00', '0.00', '0.00', 'small_profit', '2019-06-24', 0, 0, '2020-03-12 20:50:22', '2020-03-12 20:51:13'),
(443, 26, '410.00', 1353, 'https://i.imgur.com/UIXj1uj.png', 'https://i.imgur.com/Fh8TFfo.png', '400.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-06-10', 0, 0, '2020-03-12 20:51:32', '2020-03-12 20:51:57'),
(444, 26, '395.00', 1026, 'http://aa', 'http://aa', '1100.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-07-08', 0, 0, '2020-03-12 20:52:27', '2020-03-12 20:52:27'),
(445, 26, '400.00', 1274, 'https://i.imgur.com/uFF1a7i.png', 'https://i.imgur.com/qXyOiyr.png', '1400.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-07-22', 0, 0, '2020-03-12 20:53:06', '2020-03-12 20:53:06'),
(446, 26, '620.00', 499, 'https://i.imgur.com/7kNRQyW.png', 'https://i.imgur.com/tV84zIU.png', '1400.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-08-05', 0, 0, '2020-03-12 20:53:48', '2020-03-12 20:53:48'),
(447, 26, '1175.00', 1346, 'https://i.imgur.com/gGQ8l5o.png', 'https://i.imgur.com/6dMBSdU.png', '1400.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-08-19', 0, 0, '2020-03-12 20:54:08', '2020-03-12 20:54:08'),
(448, 26, '1635.00', 400, 'https://i.imgur.com/epU65K5.png', 'https://i.imgur.com/epU65K5.png', '1600.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-09-02', 0, 0, '2020-03-12 20:55:05', '2020-03-12 20:55:18'),
(449, 26, '515.57', 804, 'https://i.imgur.com/6cYiwYM.png', 'https://i.imgur.com/bFktURR.png', '600.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-09-16', 0, 0, '2020-03-12 20:55:52', '2020-03-12 20:55:52'),
(450, 26, '810.00', 1008, 'https://i.imgur.com/qhOUXNN.png', 'https://i.imgur.com/aYbFhHM.png', '600.00', '210.00', '37.52', '66.71', '18.76', '10.42', '0.00', 'cashout', '2019-09-30', 0, 0, '2020-03-12 20:56:06', '2020-03-12 20:56:06'),
(451, 27, '238.00', 1045, 'https://i.imgur.com/7lCbAAb.png', 'https://i.imgur.com/XiEIx0k.png', '550.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-06-24', 0, 0, '2020-03-12 20:59:36', '2020-03-12 20:59:36'),
(452, 27, '213.00', 356, 'https://i.imgur.com/b75RmaR.png', 'https://i.imgur.com/KUiUWTU.png', '550.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-07-08', 0, 0, '2020-03-12 20:59:55', '2020-03-12 20:59:55'),
(453, 27, '138.00', 375, 'https://i.imgur.com/YKdM9ul.jpg', 'https://i.imgur.com/rpLt0I5.png', '550.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-07-22', 0, 0, '2020-03-12 21:00:09', '2020-03-12 21:00:09'),
(454, 27, '353.00', 300, 'https://i.imgur.com/jyd8lhm.jpg', 'https://i.imgur.com/E8wjvFm.png', '550.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-08-05', 0, 0, '2020-03-12 21:00:58', '2020-03-12 21:00:58'),
(455, 27, '353.00', 300, 'https://i.imgur.com/jyd8lhm.jpg', 'https://i.imgur.com/E8wjvFm.png', '550.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-08-05', 0, 0, '2020-03-12 21:00:58', '2020-03-12 21:00:58'),
(456, 27, '558.00', 300, 'https://i.imgur.com/XzcMOy9.png', 'https://i.imgur.com/zQukXMi.png', '550.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-08-19', 0, 0, '2020-03-12 21:01:28', '2020-03-12 21:01:31'),
(457, 27, '863.00', 192, 'https://i.imgur.com/NX0ALsY.png', 'https://i.imgur.com/9VxkKX2.png', '750.00', '113.00', '20.09', '35.89', '10.08', '5.60', '0.00', 'cashout', '2019-09-02', 0, 0, '2020-03-12 21:02:07', '2020-03-12 21:02:23'),
(458, 27, '1162.13', 554, 'https://i.imgur.com/uogequz.png', 'https://i.imgur.com/AuDhuGp.png', '750.00', '412.13', '73.64', '130.92', '36.82', '20.46', '0.00', 'cashout', '2019-09-16', 0, 0, '2020-03-12 21:02:40', '2020-03-12 21:02:40'),
(459, 27, '850.00', 296, 'https://i.imgur.com/S5uFdGZ.png', 'https://i.imgur.com/BJoH5et.png', '750.00', '100.00', '17.75', '31.75', '8.91', '4.95', '0.00', 'cashout', '2019-09-30', 0, 0, '2020-03-12 21:03:05', '2020-03-12 21:03:08'),
(460, 27, '850.00', 715, 'https://i.imgur.com/xRpTN28.png', 'https://i.imgur.com/27HKKYD.png', '750.00', '100.00', '17.75', '31.75', '8.91', '4.95', '0.00', 'cashout', '2019-10-14', 0, 0, '2020-03-12 21:03:23', '2020-03-12 21:03:26'),
(461, 27, '1020.00', 291, 'https://i.imgur.com/q4rVKBh.png', 'https://i.imgur.com/6aiYhNP.png', '750.00', '270.00', '48.24', '85.77', '24.12', '13.40', '0.00', 'cashout', '2019-10-28', 0, 0, '2020-03-12 21:03:38', '2020-03-12 21:03:38'),
(462, 27, '719.41', 205, 'https://i.imgur.com/J9O3aSf.png', 'https://i.imgur.com/zGx0Jmp.png', '750.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-11-11', 0, 0, '2020-03-12 21:03:57', '2020-03-12 21:03:57'),
(463, 27, '949.41', 61, 'https://i.imgur.com/ZDsukbj.png', 'https://i.imgur.com/giqX3p2.png', '750.00', '199.41', '35.62', '63.34', '17.81', '9.90', '0.00', 'cashout', '2019-11-25', 0, 0, '2020-03-12 21:04:12', '2020-03-12 21:04:12'),
(464, 27, '1060.00', 294, 'https://i.imgur.com/FY7lkj3.png', 'https://i.imgur.com/ghJDe9X.png', '750.00', '310.00', '55.39', '98.48', '27.70', '15.39', '0.00', 'cashout', '2019-12-09', 0, 0, '2020-03-12 21:04:31', '2020-03-12 21:04:31'),
(465, 27, '1050.00', 50, 'https://i.imgur.com/UXfz6J4.png', 'https://i.imgur.com/au3zYbA.png', '750.00', '300.00', '53.60', '95.30', '26.80', '14.89', '0.00', 'cashout', '2019-12-23', 0, 0, '2020-03-12 21:04:46', '2020-03-12 21:04:46'),
(466, 28, '754.00', 1319, 'https://i.imgur.com/DlXoAlm.png', 'https://i.imgur.com/GgjEthj.png', '200.00', '554.00', '109.99', '164.99', '55.00', '0.00', '0.00', 'cashout', '2019-08-05', 0, 0, '2020-03-12 21:08:16', '2020-03-12 21:08:16'),
(467, 28, '840.00', 1332, 'https://i.imgur.com/kN3sEnn.png', 'https://i.imgur.com/BjdtzC1.png', '200.00', '640.00', '114.36', '203.31', '57.18', '31.77', '0.00', 'cashout', '2019-08-19', 0, 0, '2020-03-12 21:08:43', '2020-03-12 21:08:43'),
(468, 28, '1010.00', 1063, 'https://i.imgur.com/sBSucUJ.png', 'https://i.imgur.com/Rf4fsFx.png', '600.00', '410.00', '73.26', '130.24', '36.63', '20.35', '0.00', 'cashout', '2019-09-02', 0, 0, '2020-03-12 21:09:12', '2020-03-12 21:09:12'),
(469, 28, '1227.79', 848, 'https://i.imgur.com/q73ayjS.png', 'https://i.imgur.com/FMUYzeR.png', '600.00', '627.79', '112.18', '199.43', '56.09', '31.16', '0.00', 'cashout', '2019-09-16', 0, 0, '2020-03-12 21:09:28', '2020-03-12 21:09:28'),
(470, 28, '360.00', 370, 'https://i.imgur.com/ljinnya.png', 'https://i.imgur.com/cIgXTCt.png', '600.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'small_profit', '2019-09-30', 0, 0, '2020-03-12 21:10:51', '2020-03-12 21:10:51'),
(471, 28, '980.00', 614, 'https://i.imgur.com/yg8uZ1B.png', 'https://i.imgur.com/wwpvz8E.png', '600.00', '380.00', '67.90', '120.71', '33.95', '18.86', '0.00', 'cashout', '2019-10-14', 0, 0, '2020-03-12 21:11:12', '2020-03-12 21:11:12'),
(472, 28, '1070.00', 887, 'https://i.imgur.com/XRBGtqV.png', 'https://i.imgur.com/XMtlFNt.png', '600.00', '470.00', '83.98', '149.30', '41.99', '23.33', '0.00', 'cashout', '2019-10-28', 0, 0, '2020-03-12 21:11:30', '2020-03-12 21:11:30'),
(473, 28, '1175.00', 1068, 'https://i.imgur.com/I9YY2dj.png', 'https://i.imgur.com/WXuR71W.png', '600.00', '575.00', '102.74', '182.66', '51.37', '28.54', '0.00', 'cashout', '2019-11-11', 0, 0, '2020-03-12 21:11:45', '2020-03-12 21:11:45'),
(474, 28, '1450.00', 1242, 'https://i.imgur.com/rXxAHU6.png', 'https://i.imgur.com/1dHwHcW.png', '600.00', '850.00', '151.89', '270.02', '75.94', '42.19', '0.00', 'cashout', '2019-11-25', 0, 0, '2020-03-12 21:12:09', '2020-03-12 21:12:09'),
(475, 28, '1280.00', 1250, 'https://i.imgur.com/KSVNqxZ.png', 'https://i.imgur.com/dBiRpD3.png', '600.00', '680.00', '121.51', '216.02', '60.76', '33.75', '0.00', 'cashout', '2019-12-09', 0, 0, '2020-03-12 21:12:30', '2020-03-12 21:12:30'),
(476, 28, '955.00', 469, 'https://i.imgur.com/HH6yiWy.png', 'https://i.imgur.com/eAXLwSP.png', '600.00', '355.00', '63.43', '112.77', '31.72', '17.62', '0.00', 'cashout', '2019-12-23', 0, 0, '2020-03-12 21:12:45', '2020-03-12 21:12:45');

-- --------------------------------------------------------

--
-- Table structure for table `user_stakes`
--

CREATE TABLE `user_stakes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `stake` decimal(15,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_stakes`
--

INSERT INTO `user_stakes` (`id`, `user_id`, `stake`, `created_at`, `updated_at`) VALUES
(1, 2, '100.00', '2020-03-04 13:19:28', '2020-03-04 13:19:28'),
(2, 2, '50.00', '2020-03-04 13:21:10', '2020-03-04 13:21:10'),
(3, 4, '50.00', '2020-03-04 16:20:41', '2020-03-04 16:20:41'),
(4, 2, '-10.00', '2020-03-04 16:21:23', '2020-03-04 16:21:23'),
(5, 1, '100.00', '2020-03-04 16:28:54', '2020-03-04 16:28:54'),
(8, 4, '150.00', '2020-03-05 20:46:05', '2020-03-05 20:46:05'),
(10, 4, '200.00', '2020-03-05 21:16:48', '2020-03-05 21:16:48'),
(11, 5, '150.00', '2020-03-05 21:41:34', '2020-03-05 21:41:34'),
(12, 5, '50.00', '2020-03-05 21:46:01', '2020-03-05 21:46:01'),
(13, 5, '150.00', '2020-03-05 21:46:49', '2020-03-05 21:46:49'),
(14, 5, '200.00', '2020-03-05 21:54:34', '2020-03-05 21:54:34'),
(15, 6, '500.00', '2020-03-10 16:01:35', '2020-03-10 16:01:35'),
(16, 6, '250.00', '2020-03-10 16:03:09', '2020-03-10 16:03:09'),
(17, 6, '250.00', '2020-03-10 16:06:56', '2020-03-10 16:06:56'),
(18, 6, '-500.00', '2020-03-10 16:20:38', '2020-03-10 16:20:38'),
(19, 6, '300.00', '2020-03-10 16:23:40', '2020-03-10 16:23:40'),
(20, 7, '60.00', '2020-03-10 16:35:43', '2020-03-10 16:35:43'),
(21, 7, '640.00', '2020-03-10 16:36:50', '2020-03-10 16:36:50'),
(22, 7, '200.00', '2020-03-10 16:44:32', '2020-03-10 16:44:32'),
(23, 7, '200.00', '2020-03-10 16:45:27', '2020-03-10 16:45:27'),
(24, 7, '200.00', '2020-03-10 16:48:59', '2020-03-10 16:48:59'),
(25, 7, '-800.00', '2020-03-10 16:49:54', '2020-03-10 16:49:54'),
(26, 7, '1500.00', '2020-03-10 16:56:20', '2020-03-10 16:56:20'),
(27, 8, '600.00', '2020-03-10 16:59:55', '2020-03-10 16:59:55'),
(28, 8, '200.00', '2020-03-10 17:04:33', '2020-03-10 17:04:33'),
(29, 8, '-300.00', '2020-03-10 17:05:11', '2020-03-10 17:05:11'),
(30, 9, '50.00', '2020-03-10 17:13:13', '2020-03-10 17:13:13'),
(31, 9, '350.00', '2020-03-10 17:17:11', '2020-03-10 17:17:11'),
(32, 9, '200.00', '2020-03-10 17:19:30', '2020-03-10 17:19:30'),
(33, 9, '700.00', '2020-03-10 17:19:52', '2020-03-10 17:19:52'),
(34, 9, '250.00', '2020-03-10 17:21:09', '2020-03-10 17:21:09'),
(35, 9, '400.00', '2020-03-10 17:24:20', '2020-03-10 17:24:20'),
(36, 9, '550.00', '2020-03-10 17:35:42', '2020-03-10 17:35:42'),
(37, 10, '150.00', '2020-03-10 18:26:38', '2020-03-10 18:26:38'),
(38, 10, '250.00', '2020-03-10 18:30:32', '2020-03-10 18:30:32'),
(39, 10, '350.00', '2020-03-10 18:36:18', '2020-03-10 18:36:18'),
(40, 10, '-250.00', '2020-03-10 18:37:34', '2020-03-10 18:37:34'),
(41, 10, '250.00', '2020-03-10 18:42:53', '2020-03-10 18:42:53'),
(42, 11, '50.00', '2020-03-10 19:43:34', '2020-03-10 19:43:34'),
(43, 11, '150.00', '2020-03-10 19:50:41', '2020-03-10 19:50:41'),
(44, 11, '200.00', '2020-03-10 20:03:12', '2020-03-10 20:03:12'),
(45, 11, '200.00', '2020-03-10 20:11:16', '2020-03-10 20:11:16'),
(46, 12, '390.00', '2020-03-10 20:28:03', '2020-03-10 20:28:03'),
(47, 12, '210.00', '2020-03-10 20:40:02', '2020-03-10 20:40:02'),
(48, 3, '100.00', '2020-03-11 22:22:58', '2020-03-11 22:22:58'),
(49, 6, '-200.00', '2020-03-12 14:34:06', '2020-03-12 14:34:06'),
(50, 6, '-160.00', '2020-03-12 14:38:29', '2020-03-12 14:38:29'),
(51, 7, '-300.00', '2020-03-12 14:48:42', '2020-03-12 14:48:42'),
(52, 7, '-1100.00', '2020-03-12 14:51:15', '2020-03-12 14:51:15'),
(53, 8, '200.00', '2020-03-12 14:58:10', '2020-03-12 14:58:10'),
(54, 8, '400.00', '2020-03-12 14:59:28', '2020-03-12 14:59:28'),
(55, 9, '200.00', '2020-03-12 15:10:42', '2020-03-12 15:10:42'),
(56, 9, '-1000.00', '2020-03-12 15:15:41', '2020-03-12 15:15:41'),
(57, 10, '200.00', '2020-03-12 15:23:10', '2020-03-12 15:23:10'),
(58, 10, '-450.00', '2020-03-12 15:24:50', '2020-03-12 15:24:50'),
(59, 11, '200.00', '2020-03-12 15:34:41', '2020-03-12 15:34:41'),
(60, 12, '200.00', '2020-03-12 15:46:36', '2020-03-12 15:46:36'),
(61, 12, '400.00', '2020-03-12 15:48:55', '2020-03-12 15:48:55'),
(62, 13, '600.00', '2020-03-12 15:53:44', '2020-03-12 15:53:44'),
(63, 13, '200.00', '2020-03-12 15:56:52', '2020-03-12 15:56:52'),
(64, 13, '-300.00', '2020-03-12 15:57:36', '2020-03-12 15:57:36'),
(65, 13, '200.00', '2020-03-12 16:01:22', '2020-03-12 16:01:22'),
(66, 13, '-200.00', '2020-03-12 16:02:08', '2020-03-12 16:02:08'),
(67, 14, '200.00', '2020-03-12 17:59:03', '2020-03-12 17:59:03'),
(68, 14, '250.00', '2020-03-12 18:05:28', '2020-03-12 18:05:28'),
(69, 14, '200.00', '2020-03-12 18:14:16', '2020-03-12 18:14:16'),
(70, 14, '250.00', '2020-03-12 18:15:02', '2020-03-12 18:15:02'),
(71, 14, '250.00', '2020-03-12 18:15:39', '2020-03-12 18:15:39'),
(72, 14, '200.00', '2020-03-12 18:16:13', '2020-03-12 18:16:13'),
(73, 14, '200.00', '2020-03-12 18:18:58', '2020-03-12 18:18:58'),
(74, 14, '-950.00', '2020-03-12 18:23:54', '2020-03-12 18:23:54'),
(75, 15, '250.00', '2020-03-12 18:32:50', '2020-03-12 18:32:50'),
(76, 15, '200.00', '2020-03-12 18:35:20', '2020-03-12 18:35:20'),
(77, 15, '200.00', '2020-03-12 18:38:38', '2020-03-12 18:38:38'),
(78, 15, '-250.00', '2020-03-12 18:39:33', '2020-03-12 18:39:33'),
(79, 16, '250.00', '2020-03-12 18:43:46', '2020-03-12 18:43:46'),
(80, 16, '200.00', '2020-03-12 18:47:08', '2020-03-12 18:47:08'),
(81, 16, '200.00', '2020-03-12 18:51:08', '2020-03-12 18:51:08'),
(82, 17, '1150.00', '2020-03-12 18:56:33', '2020-03-12 18:56:33'),
(83, 17, '-550.00', '2020-03-12 18:57:27', '2020-03-12 18:57:27'),
(84, 17, '400.00', '2020-03-12 18:58:49', '2020-03-12 18:58:49'),
(85, 17, '200.00', '2020-03-12 19:03:55', '2020-03-12 19:03:55'),
(86, 17, '-300.00', '2020-03-12 19:04:57', '2020-03-12 19:04:57'),
(87, 18, '600.00', '2020-03-12 19:10:16', '2020-03-12 19:10:16'),
(88, 18, '200.00', '2020-03-12 19:12:08', '2020-03-12 19:12:08'),
(89, 18, '-300.00', '2020-03-12 19:12:40', '2020-03-12 19:12:40'),
(90, 18, '200.00', '2020-03-12 19:15:46', '2020-03-12 19:15:46'),
(91, 18, '-200.00', '2020-03-12 19:17:13', '2020-03-12 19:17:13'),
(92, 19, '750.00', '2020-03-12 19:21:19', '2020-03-12 19:21:19'),
(93, 19, '-500.00', '2020-03-12 19:24:55', '2020-03-12 19:24:55'),
(94, 19, '200.00', '2020-03-12 19:26:22', '2020-03-12 19:26:22'),
(95, 20, '300.00', '2020-03-12 19:39:54', '2020-03-12 19:39:54'),
(96, 20, '200.00', '2020-03-12 19:44:46', '2020-03-12 19:44:46'),
(97, 21, '300.00', '2020-03-12 19:48:23', '2020-03-12 19:48:23'),
(98, 21, '600.00', '2020-03-12 19:51:15', '2020-03-12 19:51:15'),
(99, 21, '-500.00', '2020-03-12 19:52:32', '2020-03-12 19:52:32'),
(100, 21, '400.00', '2020-03-12 19:54:49', '2020-03-12 19:54:49'),
(101, 21, '300.00', '2020-03-12 19:57:11', '2020-03-12 19:57:11'),
(102, 21, '-400.00', '2020-03-12 19:58:51', '2020-03-12 19:58:51'),
(104, 22, '200.00', '2020-03-12 20:01:06', '2020-03-12 20:01:06'),
(105, 23, '550.00', '2020-03-12 20:07:40', '2020-03-12 20:07:40'),
(106, 23, '200.00', '2020-03-12 20:09:29', '2020-03-12 20:09:29'),
(107, 23, '-250.00', '2020-03-12 20:10:53', '2020-03-12 20:10:53'),
(108, 23, '200.00', '2020-03-12 20:14:22', '2020-03-12 20:14:22'),
(109, 23, '-200.00', '2020-03-12 20:15:39', '2020-03-12 20:15:39'),
(110, 24, '400.00', '2020-03-12 20:20:03', '2020-03-12 20:20:03'),
(111, 24, '400.00', '2020-03-12 20:23:32', '2020-03-12 20:23:32'),
(112, 24, '200.00', '2020-03-12 20:25:50', '2020-03-12 20:25:50'),
(113, 24, '-400.00', '2020-03-12 20:26:47', '2020-03-12 20:26:47'),
(114, 25, '50.00', '2020-03-12 20:33:11', '2020-03-12 20:33:11'),
(115, 25, '150.00', '2020-03-12 20:34:06', '2020-03-12 20:34:06'),
(116, 25, '420.00', '2020-03-12 20:35:18', '2020-03-12 20:35:18'),
(117, 25, '10.00', '2020-03-12 20:36:10', '2020-03-12 20:36:10'),
(118, 25, '200.00', '2020-03-12 20:40:58', '2020-03-12 20:40:58'),
(119, 25, '-230.00', '2020-03-12 20:41:14', '2020-03-12 20:41:14'),
(120, 25, '200.00', '2020-03-12 20:43:40', '2020-03-12 20:43:40'),
(121, 25, '-300.00', '2020-03-12 20:44:25', '2020-03-12 20:44:25'),
(122, 26, '150.00', '2020-03-12 20:48:37', '2020-03-12 20:48:37'),
(123, 26, '950.00', '2020-03-12 20:52:09', '2020-03-12 20:52:09'),
(124, 26, '300.00', '2020-03-12 20:52:43', '2020-03-12 20:52:43'),
(125, 26, '-800.00', '2020-03-12 20:55:31', '2020-03-12 20:55:31'),
(126, 27, '550.00', '2020-03-12 20:59:18', '2020-03-12 20:59:18'),
(127, 27, '200.00', '2020-03-12 21:01:45', '2020-03-12 21:01:45'),
(128, 28, '200.00', '2020-03-12 21:07:48', '2020-03-12 21:07:48'),
(129, 28, '400.00', '2020-03-12 21:08:53', '2020-03-12 21:08:53');

-- --------------------------------------------------------

--
-- Table structure for table `user_stats_aggregated`
--

CREATE TABLE `user_stats_aggregated` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `limit_id` int(11) NOT NULL,
  `stat_id` int(11) NOT NULL,
  `hands_played` int(11) DEFAULT NULL,
  `bb_count` int(11) DEFAULT NULL,
  `stat_value` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user_tests`
--

CREATE TABLE `user_tests` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `test_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_completed` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_tests`
--

INSERT INTO `user_tests` (`id`, `user_id`, `test_id`, `created_at`, `updated_at`, `is_completed`) VALUES
(2, 4, 1, '2020-03-05 22:59:22', '2020-03-05 22:59:29', 1),
(3, 2, 1, '2020-03-18 13:30:21', '2020-03-18 13:30:27', 1),
(4, 2, 1, '2020-03-18 13:30:35', '2020-03-18 13:30:48', 1),
(5, 2, 1, '2020-03-21 23:57:36', '2020-03-22 13:57:28', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_tests_answers`
--

CREATE TABLE `user_tests_answers` (
  `id` int(11) NOT NULL,
  `user_test_id` int(11) NOT NULL,
  `test_question_id` int(11) NOT NULL,
  `question_answer_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_tests_answers`
--

INSERT INTO `user_tests_answers` (`id`, `user_test_id`, `test_question_id`, `question_answer_id`, `created_at`, `updated_at`) VALUES
(1, 2, 2, 5, '2020-03-05 22:59:22', '2020-03-05 22:59:26'),
(2, 2, 1, 3, '2020-03-05 22:59:22', '2020-03-05 22:59:27'),
(3, 3, 1, 2, '2020-03-18 13:30:21', '2020-03-21 23:57:21'),
(4, 3, 2, 6, '2020-03-18 13:30:21', '2020-03-18 13:30:25'),
(5, 4, 2, 5, '2020-03-18 13:30:35', '2020-03-18 13:30:37'),
(6, 4, 1, 2, '2020-03-18 13:30:35', '2020-03-18 13:30:45'),
(7, 5, 2, 4, '2020-03-21 23:57:36', '2020-03-22 13:57:24'),
(8, 5, 1, 2, '2020-03-21 23:57:36', '2020-03-22 13:57:26');

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE `videos` (
  `id` int(11) NOT NULL,
  `videos_categories_id` int(11) NOT NULL,
  `tests_categories_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `content` mediumtext,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `videos`
--

INSERT INTO `videos` (`id`, `videos_categories_id`, `tests_categories_id`, `name`, `content`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'test', '<p><iframe src=\"//www.youtube.com/embed/MntbN1DdEP0\" width=\"560\" height=\"315\" frameborder=\"0\" allowfullscreen=\"allowfullscreen\"></iframe></p>', '2020-02-28 14:42:33', '2020-02-28 14:44:23');

-- --------------------------------------------------------

--
-- Table structure for table `videos_categories`
--

CREATE TABLE `videos_categories` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `videos_categories`
--

INSERT INTO `videos_categories` (`id`, `parent_id`, `name`, `created_at`, `updated_at`) VALUES
(1, NULL, 'video kategorija', '2020-02-28 14:42:21', '2020-02-28 14:42:21');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aims`
--
ALTER TABLE `aims`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_aims_stats_idx` (`stat_id`),
  ADD KEY `fk_aims_limits1_idx` (`limit_id`);

--
-- Indexes for table `hands`
--
ALTER TABLE `hands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_hands_users1_idx` (`user_id`),
  ADD KEY `fk_hands_limits1_idx` (`limit_id`);

--
-- Indexes for table `hand_stats`
--
ALTER TABLE `hand_stats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_hands_has_stats_stats1_idx` (`stat_id`),
  ADD KEY `fk_hands_has_stats_hands1_idx` (`hand_id`);

--
-- Indexes for table `limits`
--
ALTER TABLE `limits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `question_answers`
--
ALTER TABLE `question_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_question_answers_test_questions1_idx` (`test_question_id`);

--
-- Indexes for table `stakes`
--
ALTER TABLE `stakes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_stakes_users1_idx` (`user_id`);

--
-- Indexes for table `stats`
--
ALTER TABLE `stats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tests`
--
ALTER TABLE `tests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_tests_tests_categories1_idx` (`tests_categories_id`);

--
-- Indexes for table `tests_categories`
--
ALTER TABLE `tests_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_tests_categories_tests_categories1_idx` (`parent_id`);

--
-- Indexes for table `test_questions`
--
ALTER TABLE `test_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_test_questions_tests1_idx` (`test_id`);

--
-- Indexes for table `tutorials`
--
ALTER TABLE `tutorials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_tutorials_tutorials_categories1_idx` (`tutorials_category_id`);

--
-- Indexes for table `tutorials_categories`
--
ALTER TABLE `tutorials_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_tutorials_categories_tutorials_categories1_idx` (`parent_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email` (`email`),
  ADD KEY `fk_users_limits1_idx` (`limit_id`);

--
-- Indexes for table `user_completed_tutorials`
--
ALTER TABLE `user_completed_tutorials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_tutorials_has_users_users1_idx` (`users_id`),
  ADD KEY `fk_tutorials_has_users_tutorials1_idx` (`tutorials_id`);

--
-- Indexes for table `user_completed_videos`
--
ALTER TABLE `user_completed_videos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_completed_videos_users1_idx` (`users_id`),
  ADD KEY `fk_user_completed_videos_videos1_idx` (`videos_id`);

--
-- Indexes for table `user_records`
--
ALTER TABLE `user_records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_records_recorded_at_index` (`recorded_at`);

--
-- Indexes for table `user_stakes`
--
ALTER TABLE `user_stakes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_stats_aggregated`
--
ALTER TABLE `user_stats_aggregated`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_stats_aggregated_users1_idx` (`user_id`),
  ADD KEY `fk_user_stats_aggregated_stats1_idx` (`stat_id`),
  ADD KEY `fk_user_stats_aggregated_limits1_idx` (`limit_id`);

--
-- Indexes for table `user_tests`
--
ALTER TABLE `user_tests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_tests_users1_idx` (`user_id`),
  ADD KEY `fk_user_tests_tests1_idx` (`test_id`);

--
-- Indexes for table `user_tests_answers`
--
ALTER TABLE `user_tests_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_tests_answers_user_tests1_idx` (`user_test_id`),
  ADD KEY `fk_user_tests_answers_test_questions1_idx` (`test_question_id`),
  ADD KEY `fk_user_tests_answers_question_answers1_idx` (`question_answer_id`);

--
-- Indexes for table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_videos_videos_categories1_idx` (`videos_categories_id`),
  ADD KEY `fk_videos_tests_categories1_idx` (`tests_categories_id`);

--
-- Indexes for table `videos_categories`
--
ALTER TABLE `videos_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_videos_categories_videos_categories1_idx` (`parent_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aims`
--
ALTER TABLE `aims`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hands`
--
ALTER TABLE `hands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hand_stats`
--
ALTER TABLE `hand_stats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `limits`
--
ALTER TABLE `limits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `question_answers`
--
ALTER TABLE `question_answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `stakes`
--
ALTER TABLE `stakes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tests`
--
ALTER TABLE `tests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tests_categories`
--
ALTER TABLE `tests_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `test_questions`
--
ALTER TABLE `test_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tutorials`
--
ALTER TABLE `tutorials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tutorials_categories`
--
ALTER TABLE `tutorials_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `user_completed_tutorials`
--
ALTER TABLE `user_completed_tutorials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_completed_videos`
--
ALTER TABLE `user_completed_videos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_records`
--
ALTER TABLE `user_records`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=478;

--
-- AUTO_INCREMENT for table `user_stakes`
--
ALTER TABLE `user_stakes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;

--
-- AUTO_INCREMENT for table `user_stats_aggregated`
--
ALTER TABLE `user_stats_aggregated`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_tests`
--
ALTER TABLE `user_tests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user_tests_answers`
--
ALTER TABLE `user_tests_answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `videos`
--
ALTER TABLE `videos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `videos_categories`
--
ALTER TABLE `videos_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `aims`
--
ALTER TABLE `aims`
  ADD CONSTRAINT `fk_aims_limits1` FOREIGN KEY (`limit_id`) REFERENCES `limits` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_aims_stats` FOREIGN KEY (`stat_id`) REFERENCES `stats` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `hands`
--
ALTER TABLE `hands`
  ADD CONSTRAINT `fk_hands_limits1` FOREIGN KEY (`limit_id`) REFERENCES `limits` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_hands_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `hand_stats`
--
ALTER TABLE `hand_stats`
  ADD CONSTRAINT `fk_hands_has_stats_hands1` FOREIGN KEY (`hand_id`) REFERENCES `hands` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_hands_has_stats_stats1` FOREIGN KEY (`stat_id`) REFERENCES `stats` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `question_answers`
--
ALTER TABLE `question_answers`
  ADD CONSTRAINT `fk_question_answers_test_questions1` FOREIGN KEY (`test_question_id`) REFERENCES `test_questions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stakes`
--
ALTER TABLE `stakes`
  ADD CONSTRAINT `fk_stakes_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tests`
--
ALTER TABLE `tests`
  ADD CONSTRAINT `fk_tests_tests_categories1` FOREIGN KEY (`tests_categories_id`) REFERENCES `tests_categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tests_categories`
--
ALTER TABLE `tests_categories`
  ADD CONSTRAINT `fk_tests_categories_tests_categories1` FOREIGN KEY (`parent_id`) REFERENCES `tests_categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `test_questions`
--
ALTER TABLE `test_questions`
  ADD CONSTRAINT `fk_test_questions_tests1` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tutorials`
--
ALTER TABLE `tutorials`
  ADD CONSTRAINT `fk_tutorials_tutorials_categories1` FOREIGN KEY (`tutorials_category_id`) REFERENCES `tutorials_categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tutorials_categories`
--
ALTER TABLE `tutorials_categories`
  ADD CONSTRAINT `fk_tutorials_categories_tutorials_categories1` FOREIGN KEY (`parent_id`) REFERENCES `tutorials_categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_limits1` FOREIGN KEY (`limit_id`) REFERENCES `limits` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user_completed_tutorials`
--
ALTER TABLE `user_completed_tutorials`
  ADD CONSTRAINT `fk_tutorials_has_users_tutorials1` FOREIGN KEY (`tutorials_id`) REFERENCES `tutorials` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tutorials_has_users_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user_completed_videos`
--
ALTER TABLE `user_completed_videos`
  ADD CONSTRAINT `fk_user_completed_videos_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_completed_videos_videos1` FOREIGN KEY (`videos_id`) REFERENCES `videos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user_stats_aggregated`
--
ALTER TABLE `user_stats_aggregated`
  ADD CONSTRAINT `fk_user_stats_aggregated_limits1` FOREIGN KEY (`limit_id`) REFERENCES `limits` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_stats_aggregated_stats1` FOREIGN KEY (`stat_id`) REFERENCES `stats` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_stats_aggregated_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user_tests`
--
ALTER TABLE `user_tests`
  ADD CONSTRAINT `fk_user_tests_tests1` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_tests_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user_tests_answers`
--
ALTER TABLE `user_tests_answers`
  ADD CONSTRAINT `fk_user_tests_answers_question_answers1` FOREIGN KEY (`question_answer_id`) REFERENCES `question_answers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_tests_answers_test_questions1` FOREIGN KEY (`test_question_id`) REFERENCES `test_questions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_tests_answers_user_tests1` FOREIGN KEY (`user_test_id`) REFERENCES `user_tests` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `videos`
--
ALTER TABLE `videos`
  ADD CONSTRAINT `fk_videos_tests_categories1` FOREIGN KEY (`tests_categories_id`) REFERENCES `tests_categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_videos_videos_categories1` FOREIGN KEY (`videos_categories_id`) REFERENCES `videos_categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `videos_categories`
--
ALTER TABLE `videos_categories`
  ADD CONSTRAINT `fk_videos_categories_videos_categories1` FOREIGN KEY (`parent_id`) REFERENCES `videos_categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
