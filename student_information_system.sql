-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 23, 2023 at 03:55 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `student_information_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `campas`
--

CREATE TABLE `campas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `campas`
--

INSERT INTO `campas` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'CAMPASS_001', '2023-01-20 21:30:19', '2023-01-20 21:30:19'),
(2, 'CAMPASS_002', '2023-01-20 21:30:19', '2023-01-20 21:30:19'),
(3, 'CAMPASS_003', '2023-01-20 21:30:19', '2023-01-20 21:30:19'),
(4, 'CAMPASS_004', '2023-01-20 21:30:19', '2023-01-20 21:30:19'),
(5, 'CAMPASS_005', '2023-01-20 21:30:19', '2023-01-20 21:30:19');

-- --------------------------------------------------------

--
-- Table structure for table `clinics`
--

CREATE TABLE `clinics` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `campas_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `clinics`
--

INSERT INTO `clinics` (`id`, `name`, `campas_id`, `created_at`, `updated_at`) VALUES
(1, 'CLINIC_ 001', 1, '2023-01-20 21:32:12', '2023-01-20 21:32:12'),
(2, 'CLINIC_ 002', 3, '2023-01-20 21:32:12', '2023-01-20 21:32:12'),
(3, 'CLINIC_ 003', 5, '2023-01-20 21:32:12', '2023-01-20 21:32:12'),
(4, 'CLINIC_ 004', 4, '2023-01-20 13:35:12', '2023-01-20 13:35:12'),
(5, 'CLINIC_ 005', 5, '2023-01-20 13:35:34', '2023-01-20 13:35:34');

-- --------------------------------------------------------

--
-- Table structure for table `labqueues`
--

CREATE TABLE `labqueues` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `labreport_id` bigint(20) UNSIGNED NOT NULL,
  `lab_assistant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `student_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `labqueues`
--

INSERT INTO `labqueues` (`id`, `labreport_id`, `lab_assistant_id`, `status`, `created_at`, `updated_at`, `student_id`) VALUES
(1, 3, 3, 1, NULL, '2023-01-23 21:38:00', 3),
(4, 9, 3, 0, NULL, '2023-01-23 21:35:41', 4),
(6, 12, 3, 0, NULL, NULL, 27);

-- --------------------------------------------------------

--
-- Table structure for table `labreports`
--

CREATE TABLE `labreports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `labreports`
--

INSERT INTO `labreports` (`id`, `title`, `description`, `doctor_id`, `student_id`, `created_at`, `updated_at`, `status`) VALUES
(3, 'Lab report one', 'Lab report one Lab report one', 1, 3, '2023-01-21 17:44:20', '2023-01-21 17:44:20', 0),
(9, 'Lab report id 9, st 4', 'Lab report id 9, st 4', 3, 4, NULL, NULL, 0),
(12, 'Laravel Senior Devloper', 'Laravel Senior Devloper', 3, 27, '2023-01-23 22:48:04', '2023-01-23 22:48:04', 0);

-- --------------------------------------------------------

--
-- Table structure for table `lab_results`
--

CREATE TABLE `lab_results` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `comment` varchar(255) NOT NULL,
  `lab_report_id` bigint(20) UNSIGNED NOT NULL,
  `lab_assistant_id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lab_results`
--

INSERT INTO `lab_results` (`id`, `title`, `description`, `comment`, `lab_report_id`, `lab_assistant_id`, `student_id`, `created_at`, `updated_at`, `status`) VALUES
(1, 'Lab Result One', 'Lab Result One', 'Lab Result One', 3, 3, 2, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `medicalhistories`
--

CREATE TABLE `medicalhistories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `doctor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `lab_id` bigint(20) UNSIGNED DEFAULT NULL,
  `womens_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `medicalhistories`
--

INSERT INTO `medicalhistories` (`id`, `student_id`, `doctor_id`, `lab_id`, `womens_id`, `created_at`, `updated_at`) VALUES
(2, 2, 2, NULL, NULL, NULL, NULL),
(4, 2, 1, 3, NULL, NULL, NULL),
(5, 3, 3, NULL, NULL, '2023-01-21 21:31:30', '2023-01-21 21:31:30'),
(6, 4, 1, NULL, NULL, '2023-01-22 13:33:18', '2023-01-22 13:33:18'),
(7, 22, 4, NULL, NULL, '2023-01-22 17:35:11', '2023-01-22 17:35:11'),
(8, 11, 1, NULL, NULL, '2023-01-22 19:31:37', '2023-01-22 19:31:37'),
(9, 5, 1, NULL, NULL, '2023-01-22 19:33:24', '2023-01-22 19:33:24'),
(10, 27, 1, NULL, NULL, '2023-01-22 19:35:15', '2023-01-22 19:35:15'),
(11, 18, 1, NULL, NULL, '2023-01-23 14:01:54', '2023-01-23 14:01:54'),
(12, 12, 1, NULL, NULL, '2023-01-23 14:10:41', '2023-01-23 14:10:41');

-- --------------------------------------------------------

--
-- Table structure for table `medications`
--

CREATE TABLE `medications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `dose` varchar(255) NOT NULL,
  `medicalhistories_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `medications`
--

INSERT INTO `medications` (`id`, `name`, `description`, `dose`, `medicalhistories_id`, `created_at`, `updated_at`) VALUES
(2, 'Med 1', 'Med 1', '12g, 2 per day', 2, NULL, NULL),
(3, 'Med 2', 'Med 2', 'Med 2, 2g', 2, NULL, NULL);

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
(1, '2023_01_16_170432_create_campas_table', 1),
(2, '2023_01_16_170234_create_clinics_table', 2),
(4, '2023_01_14_102022_create_students_table', 3),
(5, '2014_10_12_000000_create_users_table', 4),
(8, '2023_01_16_171255_create_queues_table', 6),
(9, '2023_01_16_170744_create_labreports_table', 7),
(11, '2023_01_16_183648_create_womens_table', 9),
(12, '2023_01_16_170716_create_medicalhistories_table', 10),
(13, '2023_01_16_182739_create_personalmedicalhistories_table', 11),
(14, '2023_01_16_173534_create_medications_table', 12),
(15, '2023_01_17_102930_create_rooms_table', 13),
(17, '2023_01_16_185821_create_lab_results_table', 14),
(18, '2023_01_21_134402_add_status_to_lab_results', 15),
(19, '2023_01_22_135942_add_is_acceoted_to_queues_table', 16),
(20, '2023_01_22_151839_rename_rooms_column', 17),
(22, '2023_01_23_074445_add_status_to_labreports_table', 19),
(23, '2023_01_16_171314_create_labqueues_table', 20),
(24, '2023_01_23_131151_add_student_id_to_table_labqueues', 21);

-- --------------------------------------------------------

--
-- Table structure for table `personalmedicalhistories`
--

CREATE TABLE `personalmedicalhistories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `disease_or_conditions` varchar(255) NOT NULL,
  `current` tinyint(1) NOT NULL,
  `comments` varchar(255) NOT NULL,
  `medicalhistories_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `queues`
--

CREATE TABLE `queues` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `doctor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `queues`
--

INSERT INTO `queues` (`id`, `student_id`, `doctor_id`, `created_at`, `updated_at`, `status`) VALUES
(18, 3, 3, '2023-01-22 19:24:50', '2023-01-23 20:18:57', 1),
(19, 5, 1, '2023-01-22 19:30:57', '2023-01-22 19:33:23', 1),
(20, 11, 3, '2023-01-22 19:31:04', '2023-01-23 16:13:43', 1),
(21, 18, 2, '2023-01-22 19:31:09', '2023-01-23 14:01:54', 1),
(22, 27, 3, '2023-01-22 19:35:02', '2023-01-23 22:47:42', 1),
(23, 12, 1, NULL, '2023-01-23 14:10:41', 1);

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `room_no` varchar(255) NOT NULL,
  `room_title` varchar(255) NOT NULL,
  `room_type` varchar(255) NOT NULL,
  `clinic_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `room_no`, `room_title`, `room_type`, `clinic_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, '101', 'B', 'B', 1, 2, NULL, NULL),
(2, '102', 'B', 'B', 1, 3, NULL, NULL),
(3, '114', 'C', 'C', 1, 4, NULL, NULL),
(4, '111', '111', '111', 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `sex` varchar(255) NOT NULL,
  `dob` date NOT NULL,
  `join_year` date NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `profile` varchar(255) NOT NULL,
  `taken_semester` int(11) NOT NULL,
  `passed_semester` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `program` varchar(255) NOT NULL,
  `campas_id` bigint(20) UNSIGNED NOT NULL,
  `clinic_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `student_id`, `first_name`, `middle_name`, `last_name`, `sex`, `dob`, `join_year`, `phone_number`, `email`, `profile`, `taken_semester`, `passed_semester`, `status`, `program`, `campas_id`, `clinic_id`, `created_at`, `updated_at`) VALUES
(2, 'JUE/0001/2023', 'Herbert', 'Hoeger', 'Nolan', 'M', '2008-01-02', '1983-02-26', '475-209-1413', 'mara.runolfsdottir@example.org', 'photo.jpg', 5, 4, 1, 'Rerum.', 3, 1, '2023-01-20 21:37:38', '2023-01-20 21:37:38'),
(3, 'JUE/0002/2022', 'Baron', 'Legros', 'Douglas', 'M', '2002-05-06', '2006-11-16', '531.481.0442', 'anastacio63@example.com', 'photo.jpg', 4, 2, 1, 'Quo.', 5, 2, '2023-01-20 21:37:38', '2023-01-20 21:37:38'),
(4, 'JUE/0003/2022', 'Thomas', 'Hills', 'Harber', 'M', '1977-09-05', '2005-06-30', '+1-478-858-6085', 'xhyatt@example.net', 'photo.jpg', 7, 7, 1, 'Omnis.', 2, 3, '2023-01-20 21:37:38', '2023-01-20 21:37:38'),
(5, 'JUE/0004/2023', 'Vicky', 'Hackett', 'Konopelski', 'M', '1965-03-30', '1997-06-24', '1-864-950-8261', 'titus33@example.org', 'photo.jpg', 2, 10, 1, 'Eveniet.', 5, 3, '2023-01-20 21:37:38', '2023-01-20 21:37:38'),
(6, 'JUE/0005/2023', 'Obie', 'Huels', 'Frami', 'M', '2001-03-26', '2000-04-07', '+1.561.239.8397', 'ofeil@example.org', 'photo.jpg', 2, 7, 1, 'Odio.', 1, 2, '2023-01-20 21:37:38', '2023-01-20 21:37:38'),
(7, 'JUR/0006/2020', 'Albina', 'Dach', 'Emmerich', 'M', '1973-01-15', '2004-09-06', '838-498-0962', 'sherman.stroman@example.net', 'photo.jpg', 4, 4, 1, 'Eos et.', 5, 2, '2023-01-20 21:37:39', '2023-01-20 21:37:39'),
(8, 'JUR/0007/2020', 'Lucious', 'Homenick', 'Roberts', 'M', '1995-07-06', '2020-05-17', '(425) 937-1815', 'koby53@example.org', 'photo.jpg', 7, 1, 1, 'Sequi.', 5, 4, '2023-01-20 21:37:39', '2023-01-20 21:37:39'),
(9, 'JUE/0008/2020', 'Oscar', 'Mohr', 'Ondricka', 'M', '2019-05-03', '2007-12-03', '985.293.9534', 'brett.hodkiewicz@example.org', 'photo.jpg', 7, 1, 1, 'Quae.', 3, 5, '2023-01-20 21:37:39', '2023-01-20 21:37:39'),
(10, 'JUR/0009/2022', 'Rene', 'Mosciski', 'Rutherford', 'M', '2018-09-12', '1986-01-21', '+1-283-402-6574', 'khills@example.com', 'photo.jpg', 6, 1, 1, 'Eos.', 1, 4, '2023-01-20 21:37:39', '2023-01-20 21:37:39'),
(11, 'JUE/0010/2020', 'Francis', 'Abshire', 'Crist', 'F', '1987-07-27', '1998-07-12', '+1-351-207-1301', 'jacobi.walter@example.org', 'photo.jpg', 7, 10, 1, 'Voluptate.', 1, 3, '2023-01-20 21:37:39', '2023-01-20 21:37:39'),
(12, 'JUE/0011/2022', 'Newton', 'Zieme', 'Runolfsdottir', 'M', '2021-11-14', '1983-11-08', '+1-773-596-6203', 'srolfson@example.com', 'photo.jpg', 2, 10, 1, 'Similique.', 4, 1, '2023-01-20 21:37:39', '2023-01-20 21:37:39'),
(13, 'JUR/0012/2020', 'Dasia', 'Treutel', 'Von', 'F', '1989-03-29', '1991-07-01', '+1 (380) 638-3867', 'immanuel.wyman@example.org', 'photo.jpg', 6, 6, 1, 'Et et sed.', 2, 3, '2023-01-20 21:37:39', '2023-01-20 21:37:39'),
(14, 'JUR/0013/2022', 'Grace', 'Langosh', 'West', 'F', '2016-12-10', '2010-05-18', '314.552.5182', 'leffler.mariano@example.org', 'photo.jpg', 2, 3, 1, 'Ex fugiat.', 4, 1, '2023-01-20 21:37:39', '2023-01-20 21:37:39'),
(15, 'JUE/0014/2021', 'Juana', 'Cole', 'Dibbert', 'M', '2011-05-06', '2005-03-04', '+1 (952) 859-4175', 'herman.shaun@example.org', 'photo.jpg', 2, 5, 1, 'Quibusdam.', 3, 1, '2023-01-20 21:37:39', '2023-01-20 21:37:39'),
(16, 'JUE/0015/2020', 'Beth', 'Pollich', 'Brown', 'F', '1977-03-26', '1999-10-06', '+1 (731) 215-4121', 'mosciski.jon@example.org', 'photo.jpg', 4, 9, 1, 'Sint fuga.', 2, 1, '2023-01-20 21:37:39', '2023-01-20 21:37:39'),
(17, 'JUE/0016/2022', 'Abigale', 'Harber', 'Cartwright', 'F', '2006-08-04', '1980-01-13', '838.832.4613', 'dshanahan@example.com', 'photo.jpg', 5, 6, 1, 'Laborum.', 4, 2, '2023-01-20 21:37:39', '2023-01-20 21:37:39'),
(18, 'JUR/0017/2023', 'Keenan', 'King', 'Kling', 'F', '1990-05-06', '1977-04-18', '(220) 325-8962', 'czemlak@example.com', 'photo.jpg', 7, 5, 1, 'Tempore.', 3, 4, '2023-01-20 21:37:39', '2023-01-20 21:37:39'),
(19, 'JUR/0018/2023', 'Carter', 'Crooks', 'Schumm', 'M', '1973-02-15', '2009-06-09', '909-338-9690', 'junior69@example.com', 'photo.jpg', 10, 2, 1, 'Atque.', 3, 4, '2023-01-20 21:37:39', '2023-01-20 21:37:39'),
(20, 'JUR/0019/2022', 'Rachel', 'Gusikowski', 'Brakus', 'M', '1983-10-24', '1970-03-22', '(828) 341-3229', 'annie01@example.org', 'photo.jpg', 4, 4, 1, 'Expedita.', 5, 4, '2023-01-20 21:37:39', '2023-01-20 21:37:39'),
(21, 'JUR/0020/2022', 'Araceli', 'Leannon', 'Hagenes', 'M', '1990-04-17', '1987-11-06', '(847) 482-6752', 'makenzie60@example.org', 'photo.jpg', 2, 1, 1, 'Aut cum.', 1, 5, '2023-01-20 21:37:39', '2023-01-20 21:37:39'),
(22, 'JUE/0021/2022', 'Peggie', 'Nikolaus', 'Kiehn', 'M', '1986-01-12', '1974-09-18', '1-607-994-2463', 'johnathon62@example.com', 'photo.jpg', 6, 7, 1, 'Molestiae.', 4, 2, '2023-01-20 21:37:39', '2023-01-20 21:37:39'),
(23, 'JUE/0022/2021', 'Vance', 'Torp', 'Huels', 'M', '1994-03-20', '2011-10-22', '+19516796914', 'eldora.gislason@example.net', 'photo.jpg', 5, 9, 1, 'Beatae.', 1, 2, '2023-01-20 21:37:39', '2023-01-20 21:37:39'),
(24, 'JUR/0023/2022', 'Tyree', 'Schmeler', 'Rogahn', 'M', '1977-03-24', '1972-02-04', '586.221.2645', 'mmarquardt@example.net', 'photo.jpg', 10, 10, 1, 'Maiores.', 3, 4, '2023-01-20 21:37:39', '2023-01-20 21:37:39'),
(25, 'JUE/0024/2020', 'Grayce', 'Doyle', 'Braun', 'F', '1973-05-06', '1970-08-22', '706.992.4306', 'josefa.morissette@example.net', 'photo.jpg', 4, 10, 1, 'Odio ut.', 1, 1, '2023-01-20 21:37:39', '2023-01-20 21:37:39'),
(26, 'JUE/0025/2020', 'Asia', 'Hodkiewicz', 'Price', 'F', '1967-05-09', '1984-11-28', '+18646017285', 'anastasia.heller@example.org', 'photo.jpg', 6, 10, 1, 'Enim.', 1, 4, '2023-01-20 21:37:39', '2023-01-20 21:37:39'),
(27, 'JUE/0026/2021', 'Mylene', 'Buckridge', 'Gislason', 'F', '2003-02-11', '1989-08-22', '+1.769.825.7187', 'colt.schaden@example.org', 'photo.jpg', 6, 4, 1, 'Dolore.', 1, 1, '2023-01-20 21:37:39', '2023-01-20 21:37:39'),
(28, 'JUR/0027/2021', 'Verla', 'Waters', 'Block', 'M', '1991-12-31', '2012-09-17', '806.581.9512', 'jessie09@example.com', 'photo.jpg', 10, 1, 1, 'Et vel.', 1, 2, '2023-01-20 21:37:40', '2023-01-20 21:37:40'),
(29, 'JUR/0028/2020', 'Francisca', 'Upton', 'Casper', 'M', '1970-09-10', '2005-08-03', '+1-616-856-9564', 'ernestina18@example.com', 'photo.jpg', 7, 4, 1, 'Et.', 5, 3, '2023-01-20 21:37:40', '2023-01-20 21:37:40'),
(30, 'JUR/0029/2022', 'Tate', 'Adams', 'Stehr', 'F', '1984-10-30', '1987-05-04', '+1-351-688-1498', 'lwehner@example.net', 'photo.jpg', 1, 6, 1, 'Sequi.', 3, 1, '2023-01-20 21:37:40', '2023-01-20 21:37:40'),
(31, 'JUE/0030/2022', 'Lamont', 'Koss', 'Gutkowski', 'M', '1971-09-24', '1974-07-12', '629-893-7588', 'oboyer@example.com', 'photo.jpg', 7, 6, 1, 'Molestiae.', 2, 2, '2023-01-20 21:37:40', '2023-01-20 21:37:40'),
(32, 'JUR/0031/2023', 'Arlene', 'Crona', 'Pouros', 'F', '1983-10-06', '1987-02-23', '606.458.3964', 'kuhic.ada@example.org', 'photo.jpg', 1, 2, 1, 'Ut sequi.', 4, 3, '2023-01-20 21:37:40', '2023-01-20 21:37:40'),
(33, 'JUR/0032/2022', 'Frieda', 'Ratke', 'Volkman', 'F', '1971-11-16', '1974-06-13', '820.753.8889', 'mskiles@example.org', 'photo.jpg', 10, 6, 1, 'Qui iure.', 4, 2, '2023-01-20 21:37:40', '2023-01-20 21:37:40'),
(34, 'JUE/0033/2021', 'Edwin', 'Kuvalis', 'Ankunding', 'M', '1972-06-12', '1999-04-17', '+1-651-994-3712', 'lmills@example.net', 'photo.jpg', 5, 6, 1, 'Et.', 5, 4, '2023-01-20 21:37:40', '2023-01-20 21:37:40'),
(35, 'JUR/0034/2022', 'Kacey', 'Aufderhar', 'Auer', 'F', '1983-11-08', '2016-06-21', '1-262-902-9033', 'hullrich@example.com', 'photo.jpg', 3, 8, 1, 'Quia ex.', 4, 5, '2023-01-20 21:37:40', '2023-01-20 21:37:40'),
(36, 'JUE/0035/2022', 'Justen', 'Friesen', 'Emard', 'M', '2011-08-12', '2016-03-06', '+1.580.820.3885', 'lincoln40@example.net', 'photo.jpg', 1, 4, 1, 'Sit.', 1, 2, '2023-01-20 21:37:40', '2023-01-20 21:37:40'),
(37, 'JUE/0036/2023', 'Mose', 'Maggio', 'Larkin', 'F', '2014-03-24', '1975-02-05', '+1-980-366-8514', 'amanda.prosacco@example.org', 'photo.jpg', 4, 3, 1, 'Dicta.', 1, 1, '2023-01-20 21:37:40', '2023-01-20 21:37:40'),
(38, 'JUR/0037/2023', 'Tyrese', 'Barrows', 'Jacobi', 'F', '1986-10-05', '1989-06-15', '+1.640.788.7093', 'zryan@example.net', 'photo.jpg', 2, 9, 1, 'Dolor rem.', 3, 4, '2023-01-20 21:37:40', '2023-01-20 21:37:40'),
(39, 'JUR/0038/2021', 'Rosalinda', 'Kihn', 'Collins', 'F', '2014-04-06', '2011-02-14', '+1.272.402.6049', 'npurdy@example.org', 'photo.jpg', 1, 7, 1, 'Ullam et.', 3, 5, '2023-01-20 21:37:40', '2023-01-20 21:37:40'),
(40, 'JUE/0039/2021', 'Vincenzo', 'Heller', 'McKenzie', 'M', '2005-03-19', '2006-09-27', '(828) 599-2665', 'mosciski.gaylord@example.net', 'photo.jpg', 7, 1, 1, 'Odit.', 3, 2, '2023-01-20 21:37:40', '2023-01-20 21:37:40'),
(41, 'JUR/0040/2022', 'Toni', 'Funk', 'Goyette', 'M', '1983-06-10', '2015-06-12', '+18289078629', 'eeffertz@example.com', 'photo.jpg', 1, 6, 1, 'Et.', 3, 3, '2023-01-20 21:37:40', '2023-01-20 21:37:40'),
(42, 'JUE/0041/2022', 'Gustave', 'Treutel', 'Bergnaum', 'M', '2000-03-26', '2018-01-10', '(863) 418-7598', 'charley.douglas@example.org', 'photo.jpg', 4, 6, 1, 'Tempora.', 2, 5, '2023-01-20 21:37:41', '2023-01-20 21:37:41'),
(43, 'JUR/0042/2020', 'Greg', 'Willms', 'Rau', 'F', '1966-05-04', '2003-12-08', '+1.517.492.6586', 'johnson.electa@example.net', 'photo.jpg', 5, 9, 1, 'Molestias.', 2, 5, '2023-01-20 21:37:41', '2023-01-20 21:37:41'),
(44, 'JUR/0043/2022', 'Ethan', 'Conroy', 'Ullrich', 'M', '2015-06-15', '2018-06-14', '(810) 563-5173', 'titus70@example.net', 'photo.jpg', 1, 9, 1, 'Et veniam.', 5, 5, '2023-01-20 21:37:41', '2023-01-20 21:37:41'),
(45, 'JUR/0044/2023', 'Aiden', 'Kemmer', 'Haley', 'M', '2017-03-11', '2015-01-22', '364-459-4566', 'adolph83@example.org', 'photo.jpg', 4, 8, 1, 'Aliquid.', 2, 4, '2023-01-20 21:37:41', '2023-01-20 21:37:41'),
(46, 'JUR/0045/2023', 'Verona', 'Jacobs', 'Skiles', 'F', '1979-01-20', '2013-05-21', '+15162455798', 'vbogisich@example.net', 'photo.jpg', 8, 4, 1, 'Nulla.', 1, 2, '2023-01-20 21:37:41', '2023-01-20 21:37:41'),
(47, 'JUE/0046/2021', 'Anibal', 'Mosciski', 'McClure', 'F', '1974-09-26', '2011-07-13', '+1-571-621-3049', 'mikel.hettinger@example.net', 'photo.jpg', 3, 6, 1, 'Et.', 4, 3, '2023-01-20 21:37:41', '2023-01-20 21:37:41'),
(48, 'JUR/0047/2020', 'Christelle', 'Vandervort', 'Wisoky', 'M', '1967-02-21', '1972-10-11', '+1.989.829.6033', 'kmohr@example.org', 'photo.jpg', 6, 4, 1, 'Maxime.', 3, 3, '2023-01-20 21:37:41', '2023-01-20 21:37:41'),
(49, 'JUR/0048/2020', 'Khalid', 'King', 'Frami', 'F', '1986-06-18', '2006-02-07', '(480) 676-7461', 'kaufderhar@example.org', 'photo.jpg', 4, 7, 1, 'Beatae.', 4, 1, '2023-01-20 21:37:41', '2023-01-20 21:37:41'),
(50, 'JUE/0049/2022', 'Ron', 'Altenwerth', 'Gislason', 'M', '1980-08-26', '1998-11-08', '+1-386-675-5005', 'leonardo41@example.org', 'photo.jpg', 9, 3, 1, 'Rerum.', 1, 5, '2023-01-20 21:37:41', '2023-01-20 21:37:41'),
(51, 'JUE/0050/2020', 'Rocky', 'Padberg', 'Rippin', 'F', '1977-11-15', '1978-03-21', '252.528.8997', 'dickens.trevor@example.org', 'photo.jpg', 10, 7, 1, 'Impedit.', 2, 3, '2023-01-20 21:37:41', '2023-01-20 21:37:41'),
(52, 'JUE/0051/2020', 'Quinn', 'Macejkovic', 'Jerde', 'F', '2006-07-07', '1972-08-03', '+14587538863', 'smitham.maurice@example.com', 'photo.jpg', 2, 4, 1, 'Et neque.', 4, 5, '2023-01-20 21:37:41', '2023-01-20 21:37:41'),
(53, 'JUE/0052/2023', 'Ray', 'Kuvalis', 'Muller', 'F', '1992-11-24', '2019-12-02', '+1 (346) 460-7139', 'lockman.cicero@example.org', 'photo.jpg', 3, 10, 1, 'Vitae est.', 3, 4, '2023-01-20 21:37:41', '2023-01-20 21:37:41'),
(54, 'JUE/0053/2020', 'Eliezer', 'Doyle', 'Mante', 'F', '1973-01-06', '1974-11-16', '530-342-8863', 'jarrett.lockman@example.org', 'photo.jpg', 6, 2, 1, 'Est.', 5, 3, '2023-01-20 21:37:41', '2023-01-20 21:37:41'),
(55, 'JUR/0054/2022', 'Annabelle', 'Armstrong', 'Casper', 'M', '2019-12-07', '2005-10-08', '+1 (838) 423-1350', 'effertz.bertha@example.org', 'photo.jpg', 2, 2, 1, 'Accusamus.', 3, 1, '2023-01-20 21:37:41', '2023-01-20 21:37:41'),
(56, 'JUE/0055/2021', 'Lizeth', 'Cartwright', 'Carroll', 'M', '1978-01-16', '1979-09-13', '+1 (501) 819-0007', 'columbus.casper@example.org', 'photo.jpg', 10, 8, 1, 'Aut ab.', 4, 5, '2023-01-20 21:37:41', '2023-01-20 21:37:41'),
(57, 'JUR/0056/2020', 'Alexie', 'Lueilwitz', 'Nolan', 'F', '1983-12-25', '1976-02-11', '380.463.5192', 'sincere.nikolaus@example.net', 'photo.jpg', 2, 2, 1, 'Aut enim.', 3, 1, '2023-01-20 21:37:41', '2023-01-20 21:37:41'),
(58, 'JUR/0057/2023', 'Guiseppe', 'Pollich', 'Watsica', 'M', '1978-09-13', '1983-01-10', '+1 (386) 278-2527', 'cassidy.reinger@example.org', 'photo.jpg', 7, 10, 1, 'Officia.', 1, 2, '2023-01-20 21:37:41', '2023-01-20 21:37:41'),
(59, 'JUE/0058/2022', 'Hallie', 'Stiedemann', 'Shanahan', 'F', '1988-01-08', '2022-10-03', '+1-906-319-2922', 'kuphal.andrew@example.org', 'photo.jpg', 1, 7, 1, 'Ut quo.', 5, 1, '2023-01-20 21:37:41', '2023-01-20 21:37:41'),
(60, 'JUE/0059/2022', 'Edyth', 'Leffler', 'Mann', 'M', '2004-09-26', '1997-04-27', '+1-854-394-0133', 'stroman.wayne@example.org', 'photo.jpg', 6, 7, 1, 'Libero.', 5, 2, '2023-01-20 21:37:41', '2023-01-20 21:37:41'),
(61, 'JUE/0060/2020', 'Lou', 'Heller', 'Nitzsche', 'M', '1964-04-05', '2008-03-20', '+1-732-412-5776', 'courtney24@example.net', 'photo.jpg', 7, 5, 1, 'Totam.', 5, 1, '2023-01-20 21:37:41', '2023-01-20 21:37:41'),
(62, 'JUR/0061/2021', 'Moshe', 'Schroeder', 'Price', 'M', '2013-06-03', '1980-05-22', '+1-629-523-8216', 'pamela.vandervort@example.net', 'photo.jpg', 4, 2, 1, 'Et.', 5, 4, '2023-01-20 21:37:41', '2023-01-20 21:37:41'),
(63, 'JUE/0062/2021', 'Archibald', 'Hettinger', 'Reichert', 'F', '2012-06-05', '2007-09-29', '+19348901772', 'ebruen@example.org', 'photo.jpg', 8, 1, 1, 'Sunt.', 5, 5, '2023-01-20 21:37:41', '2023-01-20 21:37:41'),
(64, 'JUR/0063/2022', 'Jewell', 'Welch', 'Runolfsdottir', 'M', '1968-04-26', '2022-08-23', '+1-504-622-1802', 'toy.troy@example.com', 'photo.jpg', 6, 2, 1, 'Maiores.', 3, 4, '2023-01-20 21:37:41', '2023-01-20 21:37:41'),
(65, 'JUR/0064/2020', 'Jerrold', 'Kassulke', 'Hyatt', 'M', '1977-03-01', '1988-06-12', '678.469.2008', 'herman.petra@example.com', 'photo.jpg', 4, 1, 1, 'Ut.', 3, 3, '2023-01-20 21:37:42', '2023-01-20 21:37:42'),
(66, 'JUE/0065/2022', 'Logan', 'Kihn', 'Beatty', 'F', '1985-04-10', '2003-12-29', '+1 (361) 407-7972', 'keira89@example.com', 'photo.jpg', 7, 5, 1, 'Et sed.', 5, 4, '2023-01-20 21:37:42', '2023-01-20 21:37:42'),
(67, 'JUR/0066/2021', 'Meredith', 'Labadie', 'Schoen', 'F', '1972-02-07', '2003-04-11', '820.474.2039', 'ehilpert@example.org', 'photo.jpg', 1, 7, 1, 'Ullam.', 2, 3, '2023-01-20 21:37:42', '2023-01-20 21:37:42'),
(68, 'JUE/0067/2023', 'Raoul', 'Streich', 'Rippin', 'F', '1974-09-18', '2011-12-25', '(516) 732-6267', 'dwolff@example.net', 'photo.jpg', 8, 1, 1, 'Quam.', 2, 4, '2023-01-20 21:37:42', '2023-01-20 21:37:42'),
(69, 'JUR/0068/2021', 'Bert', 'Barton', 'Goldner', 'M', '1983-05-09', '1970-05-10', '+1-628-909-8551', 'wiza.rachel@example.org', 'photo.jpg', 7, 9, 1, 'Excepturi.', 5, 5, '2023-01-20 21:37:42', '2023-01-20 21:37:42'),
(70, 'JUR/0069/2022', 'Sandra', 'Bode', 'Schowalter', 'F', '1991-07-24', '1980-02-17', '(220) 798-2126', 'omari.wilkinson@example.net', 'photo.jpg', 9, 6, 1, 'Et nisi.', 3, 4, '2023-01-20 21:37:42', '2023-01-20 21:37:42'),
(71, 'JUE/0070/2020', 'Haleigh', 'Goyette', 'Schmeler', 'M', '2021-10-05', '2011-05-11', '(901) 435-2511', 'tillman.logan@example.org', 'photo.jpg', 9, 6, 1, 'Quia ut.', 2, 5, '2023-01-20 21:37:42', '2023-01-20 21:37:42'),
(72, 'JUR/0071/2020', 'Loy', 'Beer', 'Rath', 'M', '2009-04-12', '1997-03-02', '+13868279442', 'sylvia.lehner@example.org', 'photo.jpg', 10, 4, 1, 'Eos.', 5, 4, '2023-01-20 21:37:42', '2023-01-20 21:37:42'),
(73, 'JUE/0072/2020', 'Emery', 'Wilderman', 'Wiegand', 'F', '1977-08-01', '1978-02-21', '445.730.5804', 'lysanne87@example.net', 'photo.jpg', 6, 2, 1, 'Sit ea.', 2, 3, '2023-01-20 21:37:42', '2023-01-20 21:37:42'),
(74, 'JUR/0073/2021', 'Mathilde', 'Weimann', 'Douglas', 'M', '2000-03-27', '1997-11-17', '+1-469-885-9045', 'romaguera.kailey@example.org', 'photo.jpg', 10, 1, 1, 'Ut qui.', 2, 1, '2023-01-20 21:37:42', '2023-01-20 21:37:42'),
(75, 'JUR/0074/2023', 'Dawn', 'Kunze', 'Bashirian', 'F', '2002-08-13', '2022-08-19', '+19593671209', 'jerde.jedediah@example.com', 'photo.jpg', 8, 6, 1, 'Et soluta.', 2, 2, '2023-01-20 21:37:42', '2023-01-20 21:37:42'),
(76, 'JUE/0075/2021', 'Angus', 'Breitenberg', 'Lesch', 'F', '1978-02-11', '1996-08-16', '+1.469.580.7139', 'hickle.vilma@example.com', 'photo.jpg', 8, 7, 1, 'Ullam.', 4, 1, '2023-01-20 21:37:42', '2023-01-20 21:37:42'),
(77, 'JUR/0076/2020', 'Scarlett', 'Streich', 'Boyer', 'F', '1982-03-31', '2021-03-06', '1-571-252-5870', 'schmeler.lula@example.net', 'photo.jpg', 6, 7, 1, 'Explicabo.', 5, 5, '2023-01-20 21:37:42', '2023-01-20 21:37:42'),
(78, 'JUE/0077/2021', 'Pierre', 'Oberbrunner', 'McLaughlin', 'M', '2011-06-20', '1999-05-07', '872.453.4669', 'leuschke.gladys@example.org', 'photo.jpg', 7, 3, 1, 'Quia.', 3, 2, '2023-01-20 21:37:42', '2023-01-20 21:37:42'),
(79, 'JUR/0078/2023', 'Stuart', 'Carroll', 'Rolfson', 'M', '1966-06-26', '1987-09-05', '1-973-838-6990', 'vergie.gorczany@example.net', 'photo.jpg', 3, 9, 1, 'Amet sint.', 4, 3, '2023-01-20 21:37:42', '2023-01-20 21:37:42'),
(80, 'JUR/0079/2022', 'Ava', 'Daniel', 'Schmitt', 'F', '1966-12-03', '1980-10-14', '262.705.8829', 'ebert.marlin@example.org', 'photo.jpg', 8, 4, 1, 'Voluptas.', 5, 4, '2023-01-20 21:37:42', '2023-01-20 21:37:42'),
(81, 'JUR/0080/2020', 'Tanner', 'Beier', 'Wunsch', 'F', '1981-08-18', '1990-07-05', '+12024459711', 'vivien24@example.com', 'photo.jpg', 4, 5, 1, 'Quasi.', 2, 3, '2023-01-20 21:37:42', '2023-01-20 21:37:42'),
(82, 'JUE/0081/2021', 'Scot', 'Lynch', 'Schuster', 'F', '1965-08-08', '2006-12-25', '567-420-3696', 'ljacobson@example.org', 'photo.jpg', 1, 2, 1, 'At.', 2, 4, '2023-01-20 21:37:42', '2023-01-20 21:37:42'),
(83, 'JUR/0082/2023', 'Gabrielle', 'Dooley', 'Pacocha', 'M', '2006-12-27', '1971-04-15', '(971) 507-3921', 'magdalena35@example.com', 'photo.jpg', 6, 7, 1, 'Porro.', 5, 4, '2023-01-20 21:37:42', '2023-01-20 21:37:42'),
(84, 'JUE/0083/2020', 'Hassie', 'Willms', 'Schuppe', 'F', '1965-10-03', '2017-06-11', '857.444.8695', 'rempel.muhammad@example.net', 'photo.jpg', 9, 6, 1, 'Magnam.', 1, 1, '2023-01-20 21:37:42', '2023-01-20 21:37:42'),
(85, 'JUR/0084/2021', 'Jamar', 'Schmeler', 'Ebert', 'F', '2016-01-06', '1999-04-18', '+1-563-706-7202', 'stokes.rhianna@example.com', 'photo.jpg', 3, 3, 1, 'Similique.', 5, 5, '2023-01-20 21:37:42', '2023-01-20 21:37:42'),
(86, 'JUR/0085/2020', 'Allen', 'Cummerata', 'Schultz', 'M', '1987-01-20', '2003-04-27', '+1.909.546.5081', 'lorenza94@example.org', 'photo.jpg', 1, 2, 1, 'Placeat.', 2, 2, '2023-01-20 21:37:42', '2023-01-20 21:37:42'),
(87, 'JUE/0086/2020', 'Arianna', 'Hessel', 'Bayer', 'M', '1971-04-24', '1998-04-27', '1-941-921-8087', 'myrtice.cole@example.com', 'photo.jpg', 9, 6, 1, 'Molestiae.', 3, 5, '2023-01-20 21:37:42', '2023-01-20 21:37:42'),
(88, 'JUE/0087/2022', 'Eldon', 'Hoppe', 'Fay', 'F', '1972-01-20', '1998-09-12', '903-986-2589', 'harold.schmidt@example.net', 'photo.jpg', 3, 2, 1, 'Qui.', 5, 2, '2023-01-20 21:37:42', '2023-01-20 21:37:42'),
(89, 'JUE/0088/2022', 'Giuseppe', 'Okuneva', 'Bashirian', 'M', '2000-04-22', '1986-03-11', '+1 (279) 786-2099', 'toconner@example.com', 'photo.jpg', 10, 1, 1, 'Voluptas.', 4, 2, '2023-01-20 21:37:42', '2023-01-20 21:37:42'),
(90, 'JUR/0089/2020', 'Berneice', 'Heaney', 'Huel', 'F', '1964-03-06', '2012-10-17', '586.513.6861', 'alberta94@example.com', 'photo.jpg', 2, 4, 1, 'Saepe.', 5, 3, '2023-01-20 21:37:42', '2023-01-20 21:37:42'),
(91, 'JUR/0090/2022', 'Daphne', 'Wiza', 'Casper', 'M', '2018-05-08', '2018-05-07', '1-412-880-7139', 'alexis24@example.org', 'photo.jpg', 1, 9, 1, 'Alias.', 4, 3, '2023-01-20 21:37:42', '2023-01-20 21:37:42'),
(92, 'JUE/0091/2020', 'Damien', 'Blick', 'Mayer', 'F', '1968-11-29', '1993-11-09', '1-908-322-8328', 'vada.kutch@example.com', 'photo.jpg', 1, 7, 1, 'Sed.', 5, 2, '2023-01-20 21:37:42', '2023-01-20 21:37:42'),
(93, 'JUE/0092/2021', 'Roy', 'Jacobs', 'Bauch', 'M', '2007-09-03', '1994-01-29', '+1.959.789.3830', 'francesca77@example.com', 'photo.jpg', 6, 9, 1, 'Dolor.', 3, 1, '2023-01-20 21:37:42', '2023-01-20 21:37:42'),
(94, 'JUE/0093/2022', 'Madisyn', 'Lynch', 'Lemke', 'M', '1971-06-13', '2022-09-28', '626.230.8393', 'garrison.hintz@example.org', 'photo.jpg', 9, 5, 1, 'Occaecati.', 2, 1, '2023-01-20 21:37:42', '2023-01-20 21:37:42'),
(95, 'JUR/0094/2020', 'Manuel', 'Christiansen', 'Paucek', 'M', '2019-10-07', '1986-03-04', '+1-678-872-2206', 'davon42@example.net', 'photo.jpg', 7, 2, 1, 'Qui sit.', 2, 3, '2023-01-20 21:37:42', '2023-01-20 21:37:42'),
(96, 'JUE/0095/2023', 'Zackery', 'Daugherty', 'Schoen', 'F', '1991-08-30', '1975-04-16', '(248) 491-6887', 'hackett.german@example.org', 'photo.jpg', 10, 8, 1, 'Optio.', 5, 5, '2023-01-20 21:37:43', '2023-01-20 21:37:43'),
(97, 'JUR/0096/2021', 'Delmer', 'O\'Reilly', 'Barton', 'F', '1975-06-25', '1984-08-03', '872-867-5139', 'peter00@example.org', 'photo.jpg', 9, 7, 1, 'Et.', 4, 5, '2023-01-20 21:37:43', '2023-01-20 21:37:43'),
(98, 'JUR/0097/2020', 'Cindy', 'Beahan', 'Hand', 'M', '2008-06-16', '2005-09-05', '+1 (906) 496-4194', 'drew33@example.org', 'photo.jpg', 4, 6, 1, 'Velit.', 1, 2, '2023-01-20 21:37:43', '2023-01-20 21:37:43'),
(99, 'JUR/0098/2022', 'Abner', 'Dibbert', 'Kilback', 'F', '2017-01-24', '1974-04-27', '(678) 625-9275', 'nathen.sporer@example.net', 'photo.jpg', 2, 6, 1, 'Sit.', 1, 4, '2023-01-20 21:37:43', '2023-01-20 21:37:43'),
(100, 'JUE/0099/2020', 'Yoshiko', 'Harber', 'McDermott', 'F', '1974-11-11', '2002-04-13', '540.906.8447', 'wharber@example.net', 'photo.jpg', 7, 6, 1, 'Vitae.', 1, 3, '2023-01-20 21:37:43', '2023-01-20 21:37:43'),
(101, 'JUE/0100/2023', 'Theresa', 'Reichel', 'Deckow', 'F', '2011-09-25', '1991-01-19', '+1-586-235-9520', 'jimmie.volkman@example.net', 'photo.jpg', 3, 1, 1, 'Omnis.', 5, 3, '2023-01-20 21:37:43', '2023-01-20 21:37:43'),
(102, 'JUE/0101/2022', 'Hal', 'Moore', 'Deckow', 'F', '1986-02-10', '1985-01-22', '+1.346.369.7329', 'enrique.haley@example.net', 'photo.jpg', 4, 2, 1, 'Quae.', 3, 4, '2023-01-20 21:37:43', '2023-01-20 21:37:43'),
(103, 'JUE/0102/2023', 'Kevin', 'Champlin', 'Nitzsche', 'M', '1963-04-18', '1974-04-28', '323.246.6497', 'barton.krajcik@example.com', 'photo.jpg', 2, 2, 1, 'Maxime.', 2, 5, '2023-01-20 21:37:43', '2023-01-20 21:37:43'),
(104, 'JUR/0103/2021', 'Anissa', 'Kautzer', 'Littel', 'F', '2000-07-13', '1990-06-12', '815.667.0170', 'dax97@example.com', 'photo.jpg', 10, 1, 1, 'Sed saepe.', 5, 1, '2023-01-20 21:37:43', '2023-01-20 21:37:43'),
(105, 'JUE/0104/2021', 'Eugenia', 'Raynor', 'Leffler', 'F', '1968-11-01', '1986-02-18', '+1 (609) 915-8099', 'kianna.treutel@example.org', 'photo.jpg', 9, 10, 1, 'Cum.', 3, 1, '2023-01-20 21:37:43', '2023-01-20 21:37:43'),
(106, 'JUE/0105/2020', 'Bianka', 'Lemke', 'Bosco', 'M', '1972-11-03', '1982-08-05', '847.943.4091', 'philip81@example.net', 'photo.jpg', 5, 3, 1, 'Ut fugit.', 5, 5, '2023-01-20 21:37:43', '2023-01-20 21:37:43'),
(107, 'JUR/0106/2021', 'Scotty', 'White', 'Hamill', 'M', '1964-04-13', '1990-09-19', '1-734-530-4469', 'qhowe@example.com', 'photo.jpg', 2, 4, 1, 'Ea magni.', 1, 3, '2023-01-20 21:37:43', '2023-01-20 21:37:43'),
(108, 'JUE/0107/2023', 'Berenice', 'Conroy', 'Corkery', 'M', '2013-11-06', '2002-08-04', '(430) 343-2273', 'joelle14@example.com', 'photo.jpg', 4, 3, 1, 'Deserunt.', 1, 1, '2023-01-20 21:37:43', '2023-01-20 21:37:43'),
(109, 'JUR/0108/2023', 'Simone', 'Bosco', 'Jenkins', 'F', '2000-04-01', '2010-10-21', '+19853067404', 'destany58@example.com', 'photo.jpg', 2, 5, 1, 'Beatae.', 2, 4, '2023-01-20 21:37:43', '2023-01-20 21:37:43'),
(110, 'JUR/0109/2021', 'Sabryna', 'Hudson', 'Koelpin', 'F', '2000-10-04', '2015-06-05', '(906) 418-8771', 'schaefer.dora@example.com', 'photo.jpg', 1, 7, 1, 'Enim quis.', 5, 2, '2023-01-20 21:37:43', '2023-01-20 21:37:43'),
(111, 'JUR/0110/2020', 'Ramon', 'Kunde', 'Flatley', 'F', '1992-06-10', '2000-01-28', '+1.918.945.9176', 'trenton47@example.net', 'photo.jpg', 5, 3, 1, 'Magnam.', 5, 1, '2023-01-20 21:37:43', '2023-01-20 21:37:43'),
(112, 'JUE/0111/2022', 'Unique', 'Streich', 'Harber', 'F', '2005-12-22', '1994-05-02', '1-281-267-6282', 'davis.adriana@example.net', 'photo.jpg', 2, 6, 1, 'Minima.', 4, 2, '2023-01-20 21:37:43', '2023-01-20 21:37:43'),
(113, 'JUE/0112/2023', 'Ethan', 'Pacocha', 'Rice', 'F', '1972-12-11', '1973-07-03', '1-929-743-5594', 'raynor.claud@example.org', 'photo.jpg', 6, 8, 1, 'Inventore.', 2, 2, '2023-01-20 21:37:43', '2023-01-20 21:37:43'),
(114, 'JUR/0113/2022', 'Alva', 'Dach', 'Wiza', 'F', '2003-09-18', '1998-11-28', '347.849.1499', 'barrows.darron@example.com', 'photo.jpg', 7, 2, 1, 'Minima.', 1, 3, '2023-01-20 21:37:43', '2023-01-20 21:37:43'),
(115, 'JUE/0114/2020', 'Clemmie', 'Will', 'Funk', 'F', '2008-09-29', '2009-06-13', '614.696.3604', 'zulauf.elmo@example.net', 'photo.jpg', 3, 4, 1, 'Et ullam.', 3, 3, '2023-01-20 21:37:43', '2023-01-20 21:37:43'),
(116, 'JUE/0115/2023', 'Missouri', 'Bogisich', 'Brakus', 'F', '1965-03-27', '2012-11-10', '1-763-529-9441', 'mariana.ratke@example.org', 'photo.jpg', 4, 7, 1, 'Sed sit.', 3, 5, '2023-01-20 21:37:44', '2023-01-20 21:37:44'),
(117, 'JUE/0116/2020', 'Zechariah', 'Stokes', 'Hyatt', 'F', '2018-05-22', '1988-11-02', '564.834.9708', 'karlie.hintz@example.net', 'photo.jpg', 10, 2, 1, 'Maiores.', 2, 5, '2023-01-20 21:37:44', '2023-01-20 21:37:44'),
(118, 'JUE/0117/2022', 'Lola', 'Greenfelder', 'King', 'F', '2015-07-27', '1973-11-07', '+1 (217) 353-8916', 'wilkinson.ima@example.org', 'photo.jpg', 10, 6, 1, 'Minus.', 4, 3, '2023-01-20 21:37:44', '2023-01-20 21:37:44'),
(119, 'JUE/0118/2023', 'Naomie', 'Dibbert', 'Kuphal', 'M', '1983-06-12', '1982-08-17', '240-586-6961', 'gmcglynn@example.org', 'photo.jpg', 10, 2, 1, 'Nihil.', 3, 4, '2023-01-20 21:37:44', '2023-01-20 21:37:44'),
(120, 'JUE/0119/2020', 'Laurine', 'Nienow', 'Swift', 'F', '1964-06-13', '2010-01-02', '1-405-528-0550', 'millie.ratke@example.net', 'photo.jpg', 1, 10, 1, 'Qui quis.', 5, 5, '2023-01-20 21:37:44', '2023-01-20 21:37:44'),
(121, 'JUR/0120/2023', 'Llewellyn', 'Dare', 'Kunze', 'F', '1967-01-23', '1978-05-26', '+1-901-353-0816', 'burley.langworth@example.com', 'photo.jpg', 3, 8, 1, 'Nemo.', 1, 5, '2023-01-20 21:37:44', '2023-01-20 21:37:44'),
(122, 'JUR/0121/2023', 'Joshua', 'Roberts', 'Labadie', 'F', '1963-04-23', '1980-03-12', '1-724-800-9403', 'gerard06@example.net', 'photo.jpg', 6, 5, 1, 'Ut dicta.', 1, 3, '2023-01-20 21:37:44', '2023-01-20 21:37:44'),
(123, 'JUR/0122/2023', 'May', 'Mueller', 'Wintheiser', 'M', '2002-03-07', '2008-09-09', '+1-586-348-0108', 'leta55@example.net', 'photo.jpg', 4, 3, 1, 'Non.', 4, 1, '2023-01-20 21:37:44', '2023-01-20 21:37:44'),
(124, 'JUR/0123/2021', 'Brandy', 'Halvorson', 'Nader', 'M', '1979-12-26', '2003-01-18', '+17312270278', 'cristopher.gleason@example.net', 'photo.jpg', 6, 1, 1, 'Dolorem.', 4, 3, '2023-01-20 21:37:44', '2023-01-20 21:37:44'),
(125, 'JUR/0124/2021', 'Justina', 'Stehr', 'Stokes', 'F', '2014-08-22', '2019-03-20', '678.754.6564', 'kirlin.zachery@example.net', 'photo.jpg', 1, 9, 1, 'Rem sit.', 3, 1, '2023-01-20 21:37:44', '2023-01-20 21:37:44'),
(126, 'JUE/0125/2022', 'Tierra', 'Brown', 'McLaughlin', 'M', '2009-05-05', '1980-10-01', '769.313.0710', 'nienow.emilie@example.org', 'photo.jpg', 7, 5, 1, 'Iure.', 1, 5, '2023-01-20 21:37:44', '2023-01-20 21:37:44'),
(127, 'JUE/0126/2020', 'Dalton', 'Jones', 'Brown', 'M', '2009-03-03', '1992-12-29', '+18599419017', 'fabiola85@example.com', 'photo.jpg', 5, 8, 1, 'Autem.', 4, 1, '2023-01-20 21:37:44', '2023-01-20 21:37:44'),
(128, 'JUE/0127/2020', 'Eusebio', 'Bednar', 'Kertzmann', 'M', '1979-02-04', '1992-10-03', '332-519-3281', 'aaron78@example.org', 'photo.jpg', 9, 5, 1, 'Explicabo.', 1, 1, '2023-01-20 21:37:44', '2023-01-20 21:37:44'),
(129, 'JUR/0128/2022', 'Lewis', 'Muller', 'Ruecker', 'M', '2002-01-20', '1972-08-28', '1-270-370-2816', 'huels.julien@example.net', 'photo.jpg', 6, 6, 1, 'Voluptas.', 1, 4, '2023-01-20 21:37:44', '2023-01-20 21:37:44'),
(130, 'JUE/0129/2020', 'Arvel', 'Rutherford', 'Ondricka', 'M', '1993-01-22', '1980-08-22', '(458) 532-0145', 'eunice51@example.net', 'photo.jpg', 9, 6, 1, 'Ab non.', 5, 5, '2023-01-20 21:37:44', '2023-01-20 21:37:44'),
(131, 'JUR/0130/2023', 'Arturo', 'Beier', 'Weimann', 'M', '1964-03-09', '2011-12-03', '1-920-797-7937', 'pschumm@example.com', 'photo.jpg', 2, 8, 1, 'Hic et.', 1, 1, '2023-01-20 21:37:44', '2023-01-20 21:37:44'),
(132, 'JUE/0131/2023', 'Teresa', 'DuBuque', 'Schmeler', 'F', '1992-09-04', '1971-06-20', '+1.341.606.6776', 'waters.garnett@example.net', 'photo.jpg', 10, 2, 1, 'Nemo.', 1, 1, '2023-01-20 21:37:44', '2023-01-20 21:37:44'),
(133, 'JUR/0132/2021', 'Jeanne', 'Parisian', 'Koepp', 'F', '2015-01-03', '2007-07-19', '1-309-534-1062', 'haskell.mayert@example.org', 'photo.jpg', 10, 9, 1, 'Ut.', 4, 5, '2023-01-20 21:37:44', '2023-01-20 21:37:44'),
(134, 'JUR/0133/2020', 'Skye', 'Botsford', 'Stark', 'M', '1992-01-29', '1998-12-18', '505.887.9625', 'ubergnaum@example.net', 'photo.jpg', 1, 2, 1, 'Iure.', 1, 3, '2023-01-20 21:37:44', '2023-01-20 21:37:44'),
(135, 'JUE/0134/2022', 'Etha', 'Ledner', 'Ebert', 'M', '2003-04-05', '2004-08-25', '+15403294844', 'dkuhic@example.com', 'photo.jpg', 1, 5, 1, 'Vero ea.', 1, 5, '2023-01-20 21:37:44', '2023-01-20 21:37:44'),
(136, 'JUE/0135/2020', 'Mariana', 'Gutkowski', 'Weissnat', 'M', '1996-03-30', '2020-02-08', '908-377-4564', 'vlehner@example.net', 'photo.jpg', 5, 7, 1, 'Esse nam.', 5, 5, '2023-01-20 21:37:44', '2023-01-20 21:37:44'),
(137, 'JUE/0136/2023', 'Blaze', 'Berge', 'Stamm', 'F', '1974-03-06', '2002-11-10', '1-773-798-1461', 'alta95@example.org', 'photo.jpg', 10, 2, 1, 'Corporis.', 2, 5, '2023-01-20 21:37:45', '2023-01-20 21:37:45'),
(138, 'JUE/0137/2023', 'Collin', 'Howe', 'Runolfsson', 'M', '1964-08-03', '2005-06-23', '+1 (785) 935-5931', 'francesca90@example.com', 'photo.jpg', 3, 4, 1, 'Voluptas.', 2, 2, '2023-01-20 21:37:45', '2023-01-20 21:37:45'),
(139, 'JUR/0138/2023', 'Emmet', 'Murphy', 'Muller', 'M', '2013-12-23', '1991-04-26', '(947) 259-5302', 'grady.schuyler@example.org', 'photo.jpg', 8, 5, 1, 'Officiis.', 2, 1, '2023-01-20 21:37:45', '2023-01-20 21:37:45'),
(140, 'JUE/0139/2021', 'Justina', 'Wolf', 'Roberts', 'M', '2015-12-11', '1990-09-04', '+1.726.610.2316', 'abdiel.runolfsdottir@example.net', 'photo.jpg', 1, 4, 1, 'Ea.', 5, 1, '2023-01-20 21:37:45', '2023-01-20 21:37:45'),
(141, 'JUE/0140/2021', 'Lia', 'Hermann', 'Russel', 'F', '2001-10-02', '2020-08-10', '+1.828.225.6464', 'rylee.kassulke@example.net', 'photo.jpg', 8, 8, 1, 'Non eos.', 1, 2, '2023-01-20 21:37:45', '2023-01-20 21:37:45'),
(142, 'JUR/0141/2023', 'Brock', 'Brown', 'Gottlieb', 'F', '1984-09-03', '2011-01-15', '+1-681-994-5858', 'nelda48@example.com', 'photo.jpg', 1, 1, 1, 'Laborum.', 1, 1, '2023-01-20 21:37:45', '2023-01-20 21:37:45'),
(143, 'JUR/0142/2020', 'Leonor', 'Heller', 'Gottlieb', 'M', '2013-04-06', '1993-11-28', '+1-360-485-9745', 'amie59@example.org', 'photo.jpg', 2, 9, 1, 'Officia.', 3, 5, '2023-01-20 21:37:45', '2023-01-20 21:37:45'),
(144, 'JUE/0143/2022', 'Victor', 'McCullough', 'Kreiger', 'M', '1987-05-15', '2011-05-16', '563-523-2381', 'mckayla.franecki@example.org', 'photo.jpg', 1, 6, 1, 'Tenetur.', 1, 3, '2023-01-20 21:37:45', '2023-01-20 21:37:45'),
(145, 'JUE/0144/2023', 'Leslie', 'Ryan', 'O\'Reilly', 'M', '1996-08-27', '1987-10-31', '970.575.9040', 'walsh.monte@example.net', 'photo.jpg', 5, 8, 1, 'Qui.', 1, 1, '2023-01-20 21:37:45', '2023-01-20 21:37:45'),
(146, 'JUE/0145/2021', 'Shana', 'Hickle', 'Lemke', 'M', '1995-03-05', '1981-06-22', '209-849-6742', 'fschneider@example.org', 'photo.jpg', 8, 2, 1, 'Vel.', 3, 5, '2023-01-20 21:37:45', '2023-01-20 21:37:45'),
(147, 'JUE/0146/2023', 'Brett', 'Rippin', 'Trantow', 'F', '1996-05-19', '2002-03-12', '+1 (413) 712-9890', 'eleazar.goodwin@example.net', 'photo.jpg', 9, 10, 1, 'Iusto ut.', 5, 2, '2023-01-20 21:37:45', '2023-01-20 21:37:45'),
(148, 'JUR/0147/2020', 'Fausto', 'Doyle', 'Koepp', 'M', '1985-01-04', '1989-10-03', '240.359.4724', 'bmorar@example.net', 'photo.jpg', 8, 5, 1, 'Ab ipsam.', 1, 2, '2023-01-20 21:37:45', '2023-01-20 21:37:45'),
(149, 'JUE/0148/2021', 'Mafalda', 'Jerde', 'Tromp', 'F', '1993-04-23', '2016-02-26', '(606) 478-6247', 'eula.bernier@example.org', 'photo.jpg', 6, 8, 1, 'Fugit.', 2, 3, '2023-01-20 21:37:45', '2023-01-20 21:37:45'),
(150, 'JUR/0149/2023', 'Enos', 'Douglas', 'Sauer', 'F', '2005-09-01', '1981-02-18', '(619) 733-7519', 'hammes.roy@example.com', 'photo.jpg', 10, 6, 1, 'Amet aut.', 3, 4, '2023-01-20 21:37:45', '2023-01-20 21:37:45'),
(151, 'JUE/0150/2021', 'Rashawn', 'Donnelly', 'Crona', 'F', '2020-02-02', '1991-07-19', '(864) 409-6654', 'tia.schiller@example.org', 'photo.jpg', 8, 3, 1, 'Molestias.', 2, 4, '2023-01-20 21:37:45', '2023-01-20 21:37:45'),
(152, 'JUR/0151/2023', 'Ona', 'Moen', 'Nolan', 'F', '2008-06-16', '1973-10-27', '303-701-4916', 'juanita12@example.org', 'photo.jpg', 5, 4, 1, 'Soluta ab.', 2, 2, '2023-01-20 21:37:45', '2023-01-20 21:37:45'),
(153, 'JUE/0152/2021', 'Kane', 'Wiegand', 'Turcotte', 'F', '2010-04-24', '1976-08-23', '267-764-6666', 'treutel.sharon@example.com', 'photo.jpg', 5, 6, 1, 'Ad id.', 3, 2, '2023-01-20 21:37:45', '2023-01-20 21:37:45'),
(154, 'JUR/0153/2022', 'Karl', 'Marquardt', 'Raynor', 'F', '1991-09-19', '1970-11-11', '(424) 292-8550', 'ilowe@example.net', 'photo.jpg', 1, 10, 1, 'Ut.', 4, 2, '2023-01-20 21:37:45', '2023-01-20 21:37:45'),
(155, 'JUE/0154/2022', 'Leda', 'Cassin', 'Emard', 'F', '1967-08-17', '1989-05-21', '508.830.8849', 'ledner.alvis@example.net', 'photo.jpg', 3, 5, 1, 'Rerum.', 5, 2, '2023-01-20 21:37:45', '2023-01-20 21:37:45'),
(156, 'JUE/0155/2022', 'Bernadine', 'Bahringer', 'Kuvalis', 'F', '1973-01-17', '1982-07-30', '(309) 606-9125', 'yost.angie@example.net', 'photo.jpg', 8, 4, 1, 'Nulla.', 1, 3, '2023-01-20 21:37:45', '2023-01-20 21:37:45'),
(157, 'JUR/0156/2023', 'Merl', 'Koepp', 'Kshlerin', 'M', '2013-08-15', '2004-05-08', '678-857-8765', 'marcel30@example.com', 'photo.jpg', 1, 8, 1, 'Earum.', 1, 3, '2023-01-20 21:37:45', '2023-01-20 21:37:45'),
(158, 'JUR/0157/2020', 'Santa', 'Reichert', 'Deckow', 'F', '1972-09-01', '2021-08-20', '1-240-200-9343', 'louie.lowe@example.org', 'photo.jpg', 2, 2, 1, 'Sit ad.', 1, 4, '2023-01-20 21:37:45', '2023-01-20 21:37:45'),
(159, 'JUR/0158/2020', 'Theresa', 'Kozey', 'Cronin', 'F', '2000-05-01', '2015-07-25', '(364) 301-0384', 'hprosacco@example.net', 'photo.jpg', 3, 2, 1, 'Eius aut.', 2, 2, '2023-01-20 21:37:45', '2023-01-20 21:37:45'),
(160, 'JUR/0159/2022', 'Justina', 'O\'Hara', 'Watsica', 'F', '2013-12-02', '1971-11-18', '862-410-7457', 'greyson89@example.com', 'photo.jpg', 10, 1, 1, 'Sapiente.', 5, 4, '2023-01-20 21:37:45', '2023-01-20 21:37:45'),
(161, 'JUR/0160/2020', 'Gardner', 'Brown', 'Rogahn', 'F', '1969-09-17', '2001-09-28', '+1-985-424-2431', 'tremaine.braun@example.com', 'photo.jpg', 1, 10, 1, 'Magni ad.', 4, 1, '2023-01-20 21:37:45', '2023-01-20 21:37:45'),
(162, 'JUR/0161/2021', 'Jeanne', 'Corkery', 'Bins', 'M', '1967-09-28', '1978-01-27', '1-351-262-7647', 'mustafa27@example.org', 'photo.jpg', 3, 10, 1, 'Omnis ut.', 5, 1, '2023-01-20 21:37:46', '2023-01-20 21:37:46'),
(163, 'JUR/0162/2020', 'Salma', 'Stokes', 'Legros', 'M', '2021-06-28', '1999-12-11', '+1 (260) 531-7644', 'elian43@example.com', 'photo.jpg', 5, 9, 1, 'Occaecati.', 3, 1, '2023-01-20 21:37:46', '2023-01-20 21:37:46'),
(164, 'JUE/0163/2021', 'Clark', 'Anderson', 'Haag', 'F', '2011-12-16', '2003-11-09', '530.333.5249', 'nestor.beahan@example.net', 'photo.jpg', 9, 6, 1, 'Et et.', 4, 5, '2023-01-20 21:37:46', '2023-01-20 21:37:46'),
(165, 'JUE/0164/2021', 'Laura', 'Pfannerstill', 'Friesen', 'M', '1968-05-22', '1980-06-01', '+1 (206) 290-5439', 'orville.kertzmann@example.org', 'photo.jpg', 7, 4, 1, 'Amet esse.', 5, 5, '2023-01-20 21:37:46', '2023-01-20 21:37:46'),
(166, 'JUR/0165/2021', 'Meghan', 'Hermann', 'Deckow', 'M', '2016-12-22', '2020-11-25', '+1 (718) 206-9584', 'gene98@example.net', 'photo.jpg', 5, 8, 1, 'Iusto.', 5, 4, '2023-01-20 21:37:46', '2023-01-20 21:37:46'),
(167, 'JUR/0166/2023', 'Lottie', 'Marks', 'Schmeler', 'F', '1999-03-29', '1997-03-31', '(281) 299-1415', 'sporer.terence@example.net', 'photo.jpg', 9, 7, 1, 'Iusto qui.', 5, 3, '2023-01-20 21:37:46', '2023-01-20 21:37:46'),
(168, 'JUR/0167/2022', 'Makayla', 'Weissnat', 'Trantow', 'F', '1970-11-07', '1986-01-27', '+1-276-447-1664', 'icorwin@example.org', 'photo.jpg', 4, 10, 1, 'Repellat.', 5, 4, '2023-01-20 21:37:46', '2023-01-20 21:37:46'),
(169, 'JUR/0168/2020', 'Bryon', 'Collins', 'Buckridge', 'F', '2017-11-06', '1972-12-15', '+17183874113', 'hermann21@example.com', 'photo.jpg', 1, 6, 1, 'Harum eum.', 1, 3, '2023-01-20 21:37:46', '2023-01-20 21:37:46'),
(170, 'JUE/0169/2021', 'Belle', 'Steuber', 'Gutmann', 'F', '2005-06-25', '2016-07-10', '301.861.8403', 'kboehm@example.org', 'photo.jpg', 5, 7, 1, 'Eveniet.', 3, 4, '2023-01-20 21:37:46', '2023-01-20 21:37:46'),
(171, 'JUR/0170/2020', 'Alessia', 'Koch', 'Lowe', 'M', '1998-01-28', '1979-09-06', '1-775-308-6555', 'hildegard47@example.org', 'photo.jpg', 7, 8, 1, 'Magni non.', 2, 3, '2023-01-20 21:37:46', '2023-01-20 21:37:46'),
(172, 'JUE/0171/2021', 'Maximillian', 'Kulas', 'Mills', 'M', '2013-02-20', '1989-02-26', '+1-765-617-1396', 'hansen.dameon@example.com', 'photo.jpg', 10, 9, 1, 'Cumque.', 5, 3, '2023-01-20 21:37:46', '2023-01-20 21:37:46'),
(173, 'JUR/0172/2022', 'Hallie', 'Kessler', 'Hamill', 'M', '2007-04-07', '1993-09-14', '248.915.4215', 'dgoyette@example.org', 'photo.jpg', 1, 8, 1, 'Quidem.', 3, 4, '2023-01-20 21:37:46', '2023-01-20 21:37:46'),
(174, 'JUE/0173/2020', 'Bridgette', 'Schaden', 'Spencer', 'M', '2005-03-04', '1998-04-24', '1-925-709-0573', 'edd47@example.com', 'photo.jpg', 9, 5, 1, 'Aut.', 4, 2, '2023-01-20 21:37:46', '2023-01-20 21:37:46'),
(175, 'JUE/0174/2023', 'Kyla', 'Maggio', 'Hansen', 'M', '2021-07-30', '2010-07-02', '1-978-336-6101', 'lakin.maybelle@example.org', 'photo.jpg', 4, 3, 1, 'Et quia.', 5, 2, '2023-01-20 21:37:46', '2023-01-20 21:37:46'),
(176, 'JUE/0175/2020', 'Richie', 'Wuckert', 'Mante', 'F', '1970-09-29', '2019-11-23', '+1-623-915-7236', 'jpredovic@example.org', 'photo.jpg', 3, 4, 1, 'Et.', 1, 4, '2023-01-20 21:37:46', '2023-01-20 21:37:46'),
(177, 'JUR/0176/2021', 'Fay', 'Franecki', 'Greenholt', 'F', '1986-05-20', '1971-01-22', '838.645.9751', 'hsmitham@example.org', 'photo.jpg', 5, 3, 1, 'Quas cum.', 5, 4, '2023-01-20 21:37:46', '2023-01-20 21:37:46'),
(178, 'JUE/0177/2020', 'Mya', 'Becker', 'Lubowitz', 'F', '2016-01-12', '1995-07-17', '(508) 341-7424', 'waters.stella@example.org', 'photo.jpg', 7, 3, 1, 'Est ad.', 1, 3, '2023-01-20 21:37:46', '2023-01-20 21:37:46'),
(179, 'JUR/0178/2020', 'Delphia', 'Leannon', 'Ryan', 'F', '1991-02-23', '1988-01-23', '351.943.5203', 'ettie87@example.net', 'photo.jpg', 8, 10, 1, 'Dolorem.', 4, 4, '2023-01-20 21:37:46', '2023-01-20 21:37:46'),
(180, 'JUE/0179/2023', 'Guy', 'Stanton', 'Stehr', 'M', '1991-04-01', '1992-06-29', '+1-352-389-0768', 'johnston.dallas@example.net', 'photo.jpg', 8, 7, 1, 'Nobis.', 2, 3, '2023-01-20 21:37:46', '2023-01-20 21:37:46'),
(181, 'JUE/0180/2022', 'Jacques', 'Kuhlman', 'Cummerata', 'F', '1996-11-30', '2021-05-03', '680-889-5883', 'mcclure.raymond@example.com', 'photo.jpg', 1, 6, 1, 'Minus.', 5, 1, '2023-01-20 21:37:46', '2023-01-20 21:37:46'),
(182, 'JUE/0181/2022', 'Weston', 'Carter', 'Langosh', 'M', '1978-06-01', '1976-01-07', '+1.313.356.8584', 'shanahan.nels@example.net', 'photo.jpg', 7, 6, 1, 'Incidunt.', 5, 2, '2023-01-20 21:37:46', '2023-01-20 21:37:46'),
(183, 'JUE/0182/2021', 'Juliana', 'Pouros', 'Jacobs', 'F', '1979-05-09', '2002-04-18', '+1-602-407-2413', 'homenick.cynthia@example.com', 'photo.jpg', 1, 1, 1, 'Minima.', 3, 5, '2023-01-20 21:37:46', '2023-01-20 21:37:46'),
(184, 'JUE/0183/2022', 'Nella', 'Mayert', 'Homenick', 'F', '1977-08-30', '1990-04-09', '984-225-3255', 'rrippin@example.net', 'photo.jpg', 3, 8, 1, 'Rerum.', 2, 3, '2023-01-20 21:37:46', '2023-01-20 21:37:46'),
(185, 'JUR/0184/2020', 'Tianna', 'McKenzie', 'Kulas', 'M', '1985-05-21', '1973-08-06', '1-629-385-5631', 'deja91@example.net', 'photo.jpg', 2, 1, 1, 'Eum.', 2, 3, '2023-01-20 21:37:46', '2023-01-20 21:37:46'),
(186, 'JUR/0185/2023', 'Ashley', 'Ritchie', 'Towne', 'F', '1977-02-22', '2018-04-13', '1-520-277-2677', 'stephon.mclaughlin@example.com', 'photo.jpg', 3, 3, 1, 'Numquam.', 2, 1, '2023-01-20 21:37:46', '2023-01-20 21:37:46'),
(187, 'JUR/0186/2021', 'Maureen', 'Wyman', 'Crist', 'F', '1998-04-15', '1981-04-14', '+1-248-790-6962', 'adams.bailee@example.org', 'photo.jpg', 9, 7, 1, 'Quas.', 2, 4, '2023-01-20 21:37:47', '2023-01-20 21:37:47'),
(188, 'JUE/0187/2022', 'Gisselle', 'Thompson', 'Wunsch', 'F', '2005-12-25', '1992-05-06', '820.958.3057', 'mccullough.cordell@example.org', 'photo.jpg', 1, 2, 1, 'Aliquid.', 4, 2, '2023-01-20 21:37:47', '2023-01-20 21:37:47'),
(189, 'JUR/0188/2021', 'Roscoe', 'Langworth', 'Bailey', 'F', '1968-10-19', '2020-10-31', '808-646-4465', 'hmclaughlin@example.com', 'photo.jpg', 10, 6, 1, 'Rerum a.', 4, 1, '2023-01-20 21:37:47', '2023-01-20 21:37:47'),
(190, 'JUE/0189/2022', 'Valentina', 'Witting', 'Renner', 'F', '1967-10-16', '1978-08-04', '682-613-0774', 'berenice17@example.net', 'photo.jpg', 10, 6, 1, 'Quia in.', 1, 1, '2023-01-20 21:37:47', '2023-01-20 21:37:47'),
(191, 'JUE/0190/2020', 'Cornelius', 'Wuckert', 'Macejkovic', 'F', '1988-04-22', '2008-01-05', '+1.281.453.9489', 'elsa.becker@example.net', 'photo.jpg', 2, 1, 1, 'Debitis a.', 5, 3, '2023-01-20 21:37:47', '2023-01-20 21:37:47'),
(192, 'JUR/0191/2023', 'Coty', 'Grimes', 'Ratke', 'F', '2010-01-13', '2011-03-31', '1-347-592-6410', 'valentin.lubowitz@example.com', 'photo.jpg', 8, 2, 1, 'Dolorum.', 1, 3, '2023-01-20 21:37:47', '2023-01-20 21:37:47'),
(193, 'JUR/0192/2021', 'Roosevelt', 'Friesen', 'Herman', 'M', '1969-12-24', '2011-12-19', '+1.734.788.0604', 'maeve64@example.org', 'photo.jpg', 4, 10, 1, 'Eligendi.', 3, 3, '2023-01-20 21:37:47', '2023-01-20 21:37:47'),
(194, 'JUE/0193/2022', 'Walton', 'Schulist', 'Feest', 'F', '2007-07-08', '1988-02-25', '+17863214107', 'tamara49@example.net', 'photo.jpg', 2, 1, 1, 'Autem.', 2, 2, '2023-01-20 21:37:47', '2023-01-20 21:37:47'),
(195, 'JUE/0194/2021', 'Susanna', 'Krajcik', 'Ratke', 'F', '1998-07-15', '2021-10-06', '+1-702-361-7395', 'julien23@example.org', 'photo.jpg', 6, 4, 1, 'Officia.', 5, 2, '2023-01-20 21:37:47', '2023-01-20 21:37:47'),
(196, 'JUR/0195/2023', 'Johan', 'Weissnat', 'Balistreri', 'M', '1999-01-26', '1990-08-12', '+1 (863) 223-4735', 'amani70@example.net', 'photo.jpg', 10, 6, 1, 'Inventore.', 3, 4, '2023-01-20 21:37:47', '2023-01-20 21:37:47'),
(197, 'JUE/0196/2020', 'Emiliano', 'Mraz', 'Strosin', 'F', '2016-04-03', '2022-10-20', '1-909-721-5617', 'tlangworth@example.net', 'photo.jpg', 10, 5, 1, 'Quo alias.', 3, 4, '2023-01-20 21:37:47', '2023-01-20 21:37:47'),
(198, 'JUR/0197/2021', 'Jena', 'Koepp', 'Erdman', 'M', '2016-11-10', '1989-02-28', '1-586-247-9079', 'desiree.kovacek@example.com', 'photo.jpg', 3, 1, 1, 'Optio.', 3, 5, '2023-01-20 21:37:47', '2023-01-20 21:37:47'),
(199, 'JUR/0198/2020', 'Gabe', 'Wisozk', 'Farrell', 'M', '1977-08-06', '2015-03-19', '+1-419-910-5251', 'gladyce20@example.net', 'photo.jpg', 1, 4, 1, 'Rerum.', 4, 1, '2023-01-20 21:37:47', '2023-01-20 21:37:47'),
(200, 'JUE/0199/2023', 'Delphia', 'Veum', 'Beatty', 'M', '2008-06-08', '1981-07-14', '712-997-3808', 'wheaney@example.com', 'photo.jpg', 2, 9, 1, 'Placeat.', 5, 1, '2023-01-20 21:37:47', '2023-01-20 21:37:47'),
(201, 'JUR/0200/2021', 'Jeromy', 'Reichel', 'Emmerich', 'M', '1975-02-16', '1994-02-22', '661.338.6286', 'schiller.yasmeen@example.net', 'photo.jpg', 7, 5, 1, 'Quae.', 3, 5, '2023-01-20 21:37:47', '2023-01-20 21:37:47');

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
  `campas_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `clinic_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `campas_id`, `clinic_id`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Abraham Sisay', 'Abrahamsisaysis@gmail.com', NULL, '$2y$10$mQzvXY9a2pzGfkzQywKYMeM3IVuudwfBUtSNgXSKi8ZjjC8hY6hZ2', 1, 1, NULL, '2023-01-20 21:49:00', '2023-01-20 21:49:00'),
(2, 'Doctor 1', 'doctor@one.com', NULL, '$2y$10$mQzvXY9a2pzGfkzQywKYMeM3IVuudwfBUtSNgXSKi8ZjjC8hY6hZ2', 1, 1, NULL, NULL, NULL),
(3, 'Lab 1', 'lab@one.com', NULL, '$2y$10$mQzvXY9a2pzGfkzQywKYMeM3IVuudwfBUtSNgXSKi8ZjjC8hY6hZ2', 1, 1, NULL, NULL, NULL),
(4, 'receptionist', 'receptionist@one.com', NULL, '$2y$10$NuytOKsza308oZmNgTnwiOacX/9QlAk8owkt2mtNt3uFJmjj7fpGi', 1, 1, NULL, '2023-01-22 14:26:24', '2023-01-22 14:26:24');

-- --------------------------------------------------------

--
-- Table structure for table `womens`
--

CREATE TABLE `womens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `last_menstrual_cycle` date NOT NULL,
  `number_of_pregnancies` int(11) NOT NULL DEFAULT 0,
  `pregnancie_complications` varchar(255) DEFAULT NULL,
  `number_of_live_births:` int(11) NOT NULL DEFAULT 0,
  `manopause_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `campas`
--
ALTER TABLE `campas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `campas_name_unique` (`name`);

--
-- Indexes for table `clinics`
--
ALTER TABLE `clinics`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `clinics_name_unique` (`name`),
  ADD KEY `clinics_campas_id_foreign` (`campas_id`);

--
-- Indexes for table `labqueues`
--
ALTER TABLE `labqueues`
  ADD PRIMARY KEY (`id`),
  ADD KEY `labqueues_labreport_id_foreign` (`labreport_id`),
  ADD KEY `labqueues_lab_assistant_id_foreign` (`lab_assistant_id`),
  ADD KEY `labqueues_student_id_foreign` (`student_id`);

--
-- Indexes for table `labreports`
--
ALTER TABLE `labreports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `labreports_doctor_id_foreign` (`doctor_id`),
  ADD KEY `labreports_student_id_foreign` (`student_id`);

--
-- Indexes for table `lab_results`
--
ALTER TABLE `lab_results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lab_results_lab_report_id_foreign` (`lab_report_id`),
  ADD KEY `lab_results_lab_assistant_id_foreign` (`lab_assistant_id`),
  ADD KEY `lab_results_student_id_foreign` (`student_id`);

--
-- Indexes for table `medicalhistories`
--
ALTER TABLE `medicalhistories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `medicalhistories_student_id_foreign` (`student_id`),
  ADD KEY `medicalhistories_doctor_id_foreign` (`doctor_id`),
  ADD KEY `medicalhistories_lab_id_foreign` (`lab_id`),
  ADD KEY `medicalhistories_womens_id_foreign` (`womens_id`);

--
-- Indexes for table `medications`
--
ALTER TABLE `medications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `medications_medicalhistories_id_foreign` (`medicalhistories_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personalmedicalhistories`
--
ALTER TABLE `personalmedicalhistories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `personalmedicalhistories_medicalhistories_id_foreign` (`medicalhistories_id`);

--
-- Indexes for table `queues`
--
ALTER TABLE `queues`
  ADD PRIMARY KEY (`id`),
  ADD KEY `queues_student_id_foreign` (`student_id`),
  ADD KEY `queues_doctor_id_foreign` (`doctor_id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rooms_clinic_id_foreign` (`clinic_id`),
  ADD KEY `rooms_room_user_foreign` (`user_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `students_student_id_unique` (`student_id`),
  ADD UNIQUE KEY `students_phone_number_unique` (`phone_number`),
  ADD UNIQUE KEY `students_email_unique` (`email`),
  ADD KEY `students_campas_id_foreign` (`campas_id`),
  ADD KEY `students_clinic_id_foreign` (`clinic_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_campas_id_foreign` (`campas_id`),
  ADD KEY `users_clinic_id_foreign` (`clinic_id`);

--
-- Indexes for table `womens`
--
ALTER TABLE `womens`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `campas`
--
ALTER TABLE `campas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `clinics`
--
ALTER TABLE `clinics`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `labqueues`
--
ALTER TABLE `labqueues`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `labreports`
--
ALTER TABLE `labreports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `lab_results`
--
ALTER TABLE `lab_results`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `medicalhistories`
--
ALTER TABLE `medicalhistories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `medications`
--
ALTER TABLE `medications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `personalmedicalhistories`
--
ALTER TABLE `personalmedicalhistories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `queues`
--
ALTER TABLE `queues`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=202;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `womens`
--
ALTER TABLE `womens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `clinics`
--
ALTER TABLE `clinics`
  ADD CONSTRAINT `clinics_campas_id_foreign` FOREIGN KEY (`campas_id`) REFERENCES `campas` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `labqueues`
--
ALTER TABLE `labqueues`
  ADD CONSTRAINT `labqueues_lab_assistant_id_foreign` FOREIGN KEY (`lab_assistant_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `labqueues_labreport_id_foreign` FOREIGN KEY (`labreport_id`) REFERENCES `labreports` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `labqueues_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `labreports`
--
ALTER TABLE `labreports`
  ADD CONSTRAINT `labreports_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `labreports_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `lab_results`
--
ALTER TABLE `lab_results`
  ADD CONSTRAINT `lab_results_lab_assistant_id_foreign` FOREIGN KEY (`lab_assistant_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `lab_results_lab_report_id_foreign` FOREIGN KEY (`lab_report_id`) REFERENCES `labreports` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `lab_results_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `medicalhistories`
--
ALTER TABLE `medicalhistories`
  ADD CONSTRAINT `medicalhistories_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `medicalhistories_lab_id_foreign` FOREIGN KEY (`lab_id`) REFERENCES `labreports` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `medicalhistories_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `medicalhistories_womens_id_foreign` FOREIGN KEY (`womens_id`) REFERENCES `womens` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `medications`
--
ALTER TABLE `medications`
  ADD CONSTRAINT `medications_medicalhistories_id_foreign` FOREIGN KEY (`medicalhistories_id`) REFERENCES `medicalhistories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `personalmedicalhistories`
--
ALTER TABLE `personalmedicalhistories`
  ADD CONSTRAINT `personalmedicalhistories_medicalhistories_id_foreign` FOREIGN KEY (`medicalhistories_id`) REFERENCES `medicalhistories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `queues`
--
ALTER TABLE `queues`
  ADD CONSTRAINT `queues_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `queues_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `rooms_clinic_id_foreign` FOREIGN KEY (`clinic_id`) REFERENCES `clinics` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `rooms_room_user_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_campas_id_foreign` FOREIGN KEY (`campas_id`) REFERENCES `campas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `students_clinic_id_foreign` FOREIGN KEY (`clinic_id`) REFERENCES `clinics` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_campas_id_foreign` FOREIGN KEY (`campas_id`) REFERENCES `campas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_clinic_id_foreign` FOREIGN KEY (`clinic_id`) REFERENCES `clinics` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
