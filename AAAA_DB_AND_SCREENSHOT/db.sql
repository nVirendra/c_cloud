-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 18, 2022 at 11:22 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `c_cloud`
--

-- --------------------------------------------------------

--
-- Table structure for table `candidates`
--

CREATE TABLE `candidates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roll_no` int(11) NOT NULL,
  `photo` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `education_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `candidates`
--

INSERT INTO `candidates` (`id`, `student_name`, `roll_no`, `photo`, `education_id`, `created_at`, `updated_at`) VALUES
(1, 'Raj', 789456, '2022-02-17-620e8e917bd73.jpg', 1, '2022-02-17 12:36:09', '2022-02-17 12:36:09'),
(2, 'Neel', 95351, '2022-02-17-620e91375477b.jpeg', 1, '2022-02-17 12:47:27', '2022-02-17 12:47:27'),
(3, 'Sunidhi', 956489, '2022-02-17-620e921756681.jpg', 1, '2022-02-17 12:51:11', '2022-02-17 12:51:11'),
(4, 'ravi', 656, '2022-02-17-620e93a9b90a9.jpg', 2, '2022-02-17 12:57:53', '2022-02-17 12:57:53'),
(5, 'ram', 8954, '2022-02-17-620e94de593e4.jpg', 2, '2022-02-17 13:03:02', '2022-02-17 13:03:02'),
(6, 'ragini', 9462, '2022-02-17-620e95a020fa2.jpg', 3, '2022-02-17 13:06:16', '2022-02-17 13:06:16'),
(7, 'Anil', 8966, '2022-02-17-620e95daf1574.jpg', 3, '2022-02-17 13:07:14', '2022-02-17 13:07:14'),
(8, 'Jiva', 7463, '2022-02-18-620fea2bae8f5.jpg', 1, '2022-02-18 13:19:15', '2022-02-18 13:19:15'),
(9, 'test', 955, '2022-02-18-6210015360ffc.jpg', 2, '2022-02-18 14:58:03', '2022-02-18 14:58:03');

-- --------------------------------------------------------

--
-- Table structure for table `educations`
--

CREATE TABLE `educations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `class_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `educations`
--

INSERT INTO `educations` (`id`, `class_name`, `created_at`, `updated_at`) VALUES
(1, '5th', '2022-02-16 17:04:41', '2022-02-16 17:04:48'),
(2, '10th', '2022-02-16 17:04:41', '2022-02-16 17:04:48'),
(3, '12th', '2022-02-16 17:04:41', '2022-02-16 17:04:48');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `username`, `name`, `email`, `created_at`, `updated_at`) VALUES
(1, 'ashwini', 'ashwini', 'ashwini@gmail.com', NULL, NULL),
(2, 'ravi', 'ravi', 'ravi@gmail.com', NULL, NULL);

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
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `marks`
--

CREATE TABLE `marks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `roll_no` int(11) NOT NULL,
  `education_id` bigint(20) UNSIGNED NOT NULL,
  `subject_id` bigint(20) UNSIGNED NOT NULL,
  `marks` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `marks`
--

INSERT INTO `marks` (`id`, `roll_no`, `education_id`, `subject_id`, `marks`, `created_at`, `updated_at`) VALUES
(1, 789456, 1, 1, 40, '2022-02-17 12:51:11', '2022-02-17 12:51:11'),
(2, 789456, 1, 2, 30, '2022-02-17 12:51:11', '2022-02-17 12:51:11'),
(3, 789456, 1, 3, 40, '2022-02-17 12:51:11', '2022-02-17 12:51:11'),
(4, 789456, 1, 4, 30, '2022-02-17 12:51:11', '2022-02-17 12:51:11'),
(5, 95351, 1, 1, 45, '2022-02-17 12:51:11', '2022-02-17 12:51:11'),
(6, 95351, 1, 2, 66, '2022-02-17 12:51:11', '2022-02-17 12:51:11'),
(7, 95351, 1, 3, 56, '2022-02-17 12:51:11', '2022-02-17 12:51:11'),
(8, 95351, 1, 4, 87, '2022-02-17 12:51:11', '2022-02-17 12:51:11'),
(9, 956489, 1, 1, 45, '2022-02-17 12:51:11', '2022-02-17 12:51:11'),
(10, 956489, 1, 2, 89, '2022-02-17 12:51:11', '2022-02-17 12:51:11'),
(11, 956489, 1, 3, 59, '2022-02-17 12:51:11', '2022-02-17 12:51:11'),
(12, 956489, 1, 4, 75, '2022-02-17 12:51:11', '2022-02-17 12:51:11'),
(13, 656, 2, 5, 45, '2022-02-17 12:57:53', '2022-02-17 12:57:53'),
(14, 656, 2, 6, 82, '2022-02-17 12:57:53', '2022-02-17 12:57:53'),
(15, 656, 2, 7, 72, '2022-02-17 12:57:53', '2022-02-17 12:57:53'),
(16, 656, 2, 8, 35, '2022-02-17 12:57:53', '2022-02-17 12:57:53'),
(17, 656, 2, 9, 95, '2022-02-17 12:57:53', '2022-02-17 12:57:53'),
(18, 656, 2, 10, 49, '2022-02-17 12:57:53', '2022-02-17 12:57:53'),
(19, 8954, 2, 5, 45, '2022-02-17 13:03:02', '2022-02-17 13:03:02'),
(20, 8954, 2, 6, 66, '2022-02-17 13:03:02', '2022-02-17 13:03:02'),
(21, 8954, 2, 7, 74, '2022-02-17 13:03:02', '2022-02-17 13:03:02'),
(22, 8954, 2, 8, 63, '2022-02-17 13:03:02', '2022-02-17 13:03:02'),
(23, 8954, 2, 9, 78, '2022-02-17 13:03:02', '2022-02-17 13:03:02'),
(24, 8954, 2, 10, 40, '2022-02-17 13:03:02', '2022-02-17 13:03:02'),
(25, 9462, 3, 11, 54, '2022-02-17 13:06:16', '2022-02-17 13:06:16'),
(26, 9462, 3, 12, 55, '2022-02-17 13:06:16', '2022-02-17 13:06:16'),
(27, 9462, 3, 13, 64, '2022-02-17 13:06:16', '2022-02-17 13:06:16'),
(28, 9462, 3, 14, 47, '2022-02-17 13:06:16', '2022-02-17 13:06:16'),
(29, 9462, 3, 15, 70, '2022-02-17 13:06:16', '2022-02-17 13:06:16'),
(30, 8966, 3, 11, 53, '2022-02-17 13:07:15', '2022-02-17 13:07:15'),
(31, 8966, 3, 12, 84, '2022-02-17 13:07:15', '2022-02-17 13:07:15'),
(32, 8966, 3, 13, 72, '2022-02-17 13:07:15', '2022-02-17 13:07:15'),
(33, 8966, 3, 14, 52, '2022-02-17 13:07:15', '2022-02-17 13:07:15'),
(34, 8966, 3, 15, 23, '2022-02-17 13:07:15', '2022-02-17 13:07:15'),
(35, 7463, 1, 1, 45, '2022-02-18 13:19:15', '2022-02-18 13:19:15'),
(36, 7463, 1, 2, 16, '2022-02-18 13:19:15', '2022-02-18 13:19:15'),
(37, 7463, 1, 3, 35, '2022-02-18 13:19:15', '2022-02-18 13:19:15'),
(38, 7463, 1, 4, 28, '2022-02-18 13:19:15', '2022-02-18 13:19:15'),
(39, 955, 2, 5, 54, '2022-02-18 14:58:03', '2022-02-18 14:58:03'),
(40, 955, 2, 6, 85, '2022-02-18 14:58:03', '2022-02-18 14:58:03'),
(41, 955, 2, 7, 57, '2022-02-18 14:58:03', '2022-02-18 14:58:03'),
(42, 955, 2, 8, 45, '2022-02-18 14:58:03', '2022-02-18 14:58:03'),
(43, 955, 2, 9, 34, '2022-02-18 14:58:03', '2022-02-18 14:58:03'),
(44, 955, 2, 10, 74, '2022-02-18 14:58:03', '2022-02-18 14:58:03');

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
(5, '2022_02_15_183848_create_educations_table', 1),
(6, '2022_02_15_184032_create_subjects_table', 1),
(7, '2022_02_15_184340_create_candidates_table', 1),
(8, '2022_02_15_184717_create_marks_table', 1),
(9, '2022_02_18_163642_create_employees_table', 2);

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
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subject_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `education_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `subject_name`, `education_id`, `created_at`, `updated_at`) VALUES
(1, 'Hindi', 1, '2022-02-16 17:04:41', '2022-02-16 17:04:41'),
(2, 'English', 1, '2022-02-16 17:04:41', '2022-02-16 17:04:41'),
(3, 'Math', 1, '2022-02-16 17:04:41', '2022-02-16 17:04:41'),
(4, 'Science', 1, '2022-02-16 17:04:41', '2022-02-16 17:04:41'),
(5, 'Hindi', 2, '2022-02-16 17:04:41', '2022-02-16 17:04:41'),
(6, 'English', 2, '2022-02-16 17:04:41', '2022-02-16 17:04:41'),
(7, 'Math', 2, '2022-02-16 17:04:41', '2022-02-16 17:04:41'),
(8, 'Science', 2, '2022-02-16 17:04:41', '2022-02-16 17:04:41'),
(9, 'Social Science ', 2, '2022-02-16 17:04:41', '2022-02-16 17:04:41'),
(10, 'Sanskrit', 2, '2022-02-16 17:04:41', '2022-02-16 17:04:41'),
(11, 'Hindi', 3, '2022-02-16 17:04:41', '2022-02-16 17:04:41'),
(12, 'English', 3, '2022-02-16 17:04:41', '2022-02-16 17:04:41'),
(13, 'Math', 3, '2022-02-16 17:04:41', '2022-02-16 17:04:41'),
(14, 'Physics', 3, '2022-02-16 17:04:41', '2022-02-16 17:04:41'),
(15, 'Chemistry', 3, '2022-02-16 17:04:41', '2022-02-16 17:04:41');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `candidates`
--
ALTER TABLE `candidates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `candidates_roll_no_unique` (`roll_no`),
  ADD KEY `candidates_education_id_foreign` (`education_id`);

--
-- Indexes for table `educations`
--
ALTER TABLE `educations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `marks`
--
ALTER TABLE `marks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `marks_education_id_foreign` (`education_id`),
  ADD KEY `marks_subject_id_foreign` (`subject_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subjects_education_id_foreign` (`education_id`);

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
-- AUTO_INCREMENT for table `candidates`
--
ALTER TABLE `candidates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `educations`
--
ALTER TABLE `educations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marks`
--
ALTER TABLE `marks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `candidates`
--
ALTER TABLE `candidates`
  ADD CONSTRAINT `candidates_education_id_foreign` FOREIGN KEY (`education_id`) REFERENCES `educations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `marks`
--
ALTER TABLE `marks`
  ADD CONSTRAINT `marks_education_id_foreign` FOREIGN KEY (`education_id`) REFERENCES `educations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `marks_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subjects`
--
ALTER TABLE `subjects`
  ADD CONSTRAINT `subjects_education_id_foreign` FOREIGN KEY (`education_id`) REFERENCES `educations` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
