-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 19, 2024 at 10:47 PM
-- Server version: 8.0.31
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `denta`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
CREATE TABLE IF NOT EXISTS `admins` (
  `admin_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `confirm_password` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `admins_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`admin_id`, `name`, `email`, `email_verified_at`, `password`, `confirm_password`, `created_at`, `updated_at`) VALUES
(1, 'amany', 'amany@gmail.com', NULL, '$2y$10$wezTABiL/.GjxfSDj4o92uxG10YkDBR/nu1dvSCTxRxIQOsGVSedK', '$2y$10$hzmuidy5SfGZtQilGm.V8.3mS1l7WDl6La8RDAAvMQx8mVqH0P76y', '2024-03-12 22:10:32', '2024-03-12 22:10:32'),
(2, 'ahmed', 'eslam@gmail.com', NULL, '$2y$10$gpCe5t2gK/iF0HIKRTvuu.jXd5G6HnYsJKg0GtEWIux0dC3dWJue6', '$2y$10$o3WpZHiKlUiX82PLPCrqxeJCgrRHW0..J.XvC3bLjmYvYoXoJLEU2', '2024-03-20 04:39:44', '2024-03-20 04:39:44'),
(3, 'esalm', 'mohamed@gmail.com', NULL, '$2y$10$85t2xCa4y.L41nvs391M4uO4Bkf/y7MSwdG/C75OmFBRQcVDXIwv.', '$2y$10$pjlkf0xlE2U12R3I2J32qeeShlIjMwC5MksVRRwfIzbjb/WrbpeRi', '2024-03-20 04:49:20', '2024-03-20 04:49:20'),
(4, 'mohamed', 'hosam@gmail.com', NULL, '$2y$10$tnG5lxgu6sE6AFECH1FDTecrashNUrZHoKaw8ZUcJdB4urmB4agci', '$2y$10$GujR0zWeZC7kYQzRspWOSO0qQPajSSV1mPaK2FYwR6G0uTsWo1J02', '2024-03-20 07:24:27', '2024-03-20 07:24:27');

-- --------------------------------------------------------

--
-- Table structure for table `appoin-reserve`
--

DROP TABLE IF EXISTS `appoin-reserve`;
CREATE TABLE IF NOT EXISTS `appoin-reserve` (
  `id-reserve` bigint UNSIGNED NOT NULL,
  `day` varchar(11) NOT NULL,
  `start hour` time NOT NULL,
  `end hour` time NOT NULL,
  PRIMARY KEY (`id-reserve`,`day`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
CREATE TABLE IF NOT EXISTS `appointment` (
  `id-den` bigint UNSIGNED NOT NULL,
  `day` varchar(11) NOT NULL,
  `starhour` time NOT NULL,
  `endhour` time NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id-den`,`day`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`id-den`, `day`, `starhour`, `endhour`, `updated_at`, `created_at`) VALUES
(18, 'Monday', '04:00:00', '10:00:00', '2024-04-19 09:53:11', '2024-04-19 09:53:11'),
(18, 'sunday', '03:30:00', '04:30:00', '2024-04-19 09:53:11', '2024-04-19 09:53:11'),
(26, 'Monday', '04:00:00', '10:00:00', '2024-04-19 09:45:28', '2024-04-19 09:45:28'),
(26, 'sunday', '03:30:00', '04:30:00', '2024-04-19 09:45:28', '2024-04-19 09:45:28'),
(27, 'Monday', '12:30:00', '16:30:00', '2024-04-19 12:19:37', '2024-04-19 12:19:37'),
(27, 'Sunday', '10:30:00', '12:30:00', '2024-04-19 12:19:37', '2024-04-19 12:19:37'),
(28, 'Monday', '12:30:00', '16:30:00', '2024-04-19 12:20:55', '2024-04-19 12:20:55'),
(28, 'Sunday', '10:30:00', '12:30:00', '2024-04-19 12:20:55', '2024-04-19 12:20:55'),
(29, 'Monday', '12:30:00', '16:30:00', '2024-04-19 12:28:38', '2024-04-19 12:28:38'),
(29, 'Sunday', '10:30:00', '12:30:00', '2024-04-19 12:28:38', '2024-04-19 12:28:38'),
(30, 'Monday', '12:30:00', '16:30:00', '2024-04-19 12:31:38', '2024-04-19 12:31:38'),
(30, 'Sunday', '10:30:00', '12:30:00', '2024-04-19 12:31:38', '2024-04-19 12:31:38'),
(31, 'Monday', '12:30:00', '16:30:00', '2024-04-19 13:19:33', '2024-04-19 13:19:33'),
(31, 'Sunday', '10:30:00', '12:30:00', '2024-04-19 13:19:33', '2024-04-19 13:19:33'),
(32, 'Monday', '12:30:00', '16:30:00', '2024-04-19 13:48:39', '2024-04-19 13:48:39'),
(32, 'Sunday', '10:30:00', '12:30:00', '2024-04-19 13:48:39', '2024-04-19 13:48:39'),
(33, 'Monday', '12:30:00', '16:30:00', '2024-04-19 13:51:24', '2024-04-19 13:51:24'),
(33, 'Sunday', '10:30:00', '12:30:00', '2024-04-19 13:51:24', '2024-04-19 13:51:24'),
(35, 'Monday', '12:30:00', '16:30:00', '2024-04-19 23:57:36', '2024-04-19 23:57:36'),
(35, 'Sunday', '10:30:00', '12:30:00', '2024-04-19 23:57:36', '2024-04-19 23:57:36');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id-cat` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(11) NOT NULL,
  `image` varchar(11) NOT NULL,
  PRIMARY KEY (`id-cat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category doctor`
--

DROP TABLE IF EXISTS `category doctor`;
CREATE TABLE IF NOT EXISTS `category doctor` (
  `id-cat` bigint UNSIGNED NOT NULL,
  `id-den` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`id-cat`,`id-den`),
  KEY `test17` (`id-den`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category patient`
--

DROP TABLE IF EXISTS `category patient`;
CREATE TABLE IF NOT EXISTS `category patient` (
  `id-cat` bigint UNSIGNED NOT NULL,
  `id-patient` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`id-cat`,`id-patient`),
  KEY `test19` (`id-patient`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chat`
--

DROP TABLE IF EXISTS `chat`;
CREATE TABLE IF NOT EXISTS `chat` (
  `id-chat` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(11) NOT NULL,
  `type` varchar(11) NOT NULL,
  `message` text NOT NULL,
  `created at` timestamp NOT NULL,
  `updated at` timestamp NOT NULL,
  `den-id` bigint UNSIGNED NOT NULL,
  `patient-id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`id-chat`),
  KEY `test11` (`den-id`),
  KEY `test12` (`patient-id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `content type`
--

DROP TABLE IF EXISTS `content type`;
CREATE TABLE IF NOT EXISTS `content type` (
  `id-cat` bigint UNSIGNED NOT NULL,
  `image` varchar(11) NOT NULL,
  `video` varchar(11) NOT NULL,
  PRIMARY KEY (`id-cat`,`image`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dentistpassword_reset`
--

DROP TABLE IF EXISTS `dentistpassword_reset`;
CREATE TABLE IF NOT EXISTS `dentistpassword_reset` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dentistpassword_reset_email_index` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dentists`
--

DROP TABLE IF EXISTS `dentists`;
CREATE TABLE IF NOT EXISTS `dentists` (
  `dentist_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `firstname` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `secondname` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `phonenumber` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `confirmpassword` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `covernate` varchar(15) COLLATE utf8mb3_unicode_ci NOT NULL,
  `region` varchar(15) COLLATE utf8mb3_unicode_ci NOT NULL,
  `youraddress` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `personalphoto` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `syndicatedphoto` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `proved` tinyint(1) NOT NULL DEFAULT '0',
  `used` tinyint(1) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`dentist_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `dentists`
--

INSERT INTO `dentists` (`dentist_id`, `firstname`, `secondname`, `email`, `phonenumber`, `password`, `confirmpassword`, `covernate`, `region`, `youraddress`, `personalphoto`, `syndicatedphoto`, `proved`, `used`, `remember_token`, `created_at`, `updated_at`) VALUES
(14, 'amany', 'nfcg', 'amany@gmail.com', '01285905442', '$2y$10$8tjnHg2B8bdJmFDSmaN4BO.w6Gkop1Jj8d3cx57Gz1ZDinFHUNe3u', '12345678', 'gmc', 'mgc', 'hmf', '037XUx29tjJjSJ6goMugcroHZdnx3FMa.jpg', 'mFTPEKbrAN9i8eIADZM3P4TvFPT9D0CM.jpg', 0, 0, NULL, '2024-04-18 21:22:04', '2024-04-18 21:22:04'),
(15, 'amany', 'nfcg', 'n@gmail.com', '01245905442', '$2y$10$OqInQH/6Ar1qyVICv364VODOFk2wKdR8jsvK7yUtS4Mj3XbGZGfGe', '12345678', 'gmc', 'mgc', 'hmf', 'q9dXicBtlaBQDAwk2ulxtCmL2T9WCowO.jpg', '9dLJAeXc0kSboeW3kwChU1ykgexXZKBu.jpg', 0, 0, NULL, '2024-04-19 04:57:28', '2024-04-19 04:57:28'),
(16, 'amany', 'nfcg', 'm@gmail.com', '01245905441', '$2y$10$zrbywr2VneBwgwxm07UDOeUt6V4656cKabaC0OP3Zb0L8e0ZmPaVu', '12345678', 'gmc', 'mgc', 'hmf', 'EEj2WFIK7ijOVSDCMtQpIPs5K92GmbxN.jpg', 'grhoiZqICFHam4VrdmqruzrCjanqSPna.jpg', 0, 0, NULL, '2024-04-19 05:11:21', '2024-04-19 05:11:21'),
(17, 'amany', 'nfcg', 'k@gmail.com', '01245905449', '$2y$10$bHbnZgEEZslQsoqu4ESfwe3cu1OwlcqCRA89kg22Q57o1e8mhTn6G', '12345678', 'gmc', 'mgc', 'hmf', 'uH0Yw0y6UQdAWtXs3jrZoRaVbHLp4dqf.jpg', 'lm2jRGzSor5FTUwHFCf8lEmLs1c06WMG.jpg', 0, 0, NULL, '2024-04-19 05:13:15', '2024-04-19 05:13:15'),
(18, 'amany', 'nfcg', 'l@gmail.com', '01245905445', '$2y$10$3iRHqrhnyzoen9AW2d0eRe4tI9aaH1Gvk2PUi3.Xj2NsKSF6WPfgW', '12345678', 'gmc', 'mgc', 'hmf', 'Qt7FHWD2mGF20r78DVPfyO91Su1t3x1P.jpg', 'zAWLR408Dtd1EvYJnkg4BuG32whf6Vwa.jpg', 0, 0, NULL, '2024-04-19 05:16:24', '2024-04-19 05:16:24'),
(19, 'amany', 'nfcg', 's@gmail.com', '01245905499', '$2y$10$GuDK4G6pcMRg1U./MswFFu01pzdHGw6VthEm6uqUw19GB4FfiCs52', '12345678', 'gmc', 'mgc', 'hmf', '9PBgVBuX438aRtrG3FC2Eh323gbvT0mn.jpg', 's3IFXwiOQ9XRzecjuB1T4RXfOrirLI2y.jpg', 0, 0, NULL, '2024-04-19 05:19:30', '2024-04-19 05:19:30'),
(20, 'amany', 'nfcg', 'a@gmail.com', '01245605499', '$2y$10$0Ewc6Y6RTKv2P5.rbiRSLeq2c4mIg5KnFdDrjIC693NxIEuS.GBFG', '12345678', 'gmc', 'mgc', 'hmf', 'SReaTBu35hUjpS2mLlI3NK7mj2Azq0EE.jpg', 'PGVRomu3aGtYQIXmWFoQdvOGPYQ4BSns.jpg', 0, 0, NULL, '2024-04-19 05:40:29', '2024-04-19 05:40:29'),
(21, 'amany', 'nfcg', 'op@gmail.com', '01245605489', '$2y$10$a.bnZdf2vd2i/XsNjYNHXeF448BXiBiZ.c8F14UJ2QsFNibs0MFuq', '12345678', 'gmc', 'mgc', 'hmf', 'mAO8iKwOUXmuBbJ7aX9rhp32eL5qj5Lz.jpg', 'm3B4MDdIVa2eBvRacCFLKU7t0vQ2bHCt.jpg', 0, 0, NULL, '2024-04-19 05:42:21', '2024-04-19 05:42:21'),
(22, 'amany', 'nfcg', 'opl@gmail.com', '01245605498', '$2y$10$C.mekZorZ8o7Z5wmILUPyeY/pEyG8c0.Utq7deLlnxw8iHVXPN/4C', '12345678', 'gmc', 'mgc', 'hmf', 'mSVrJYwIffotCAtEmIqQuCSke052wVFq.jpg', 'AmTmNmUS8vZHN3t80a1zWksXGBCT2RDb.jpg', 0, 0, NULL, '2024-04-19 05:52:29', '2024-04-19 05:52:29'),
(23, 'amany', 'nfcg', 'oplb@gmail.com', '01245605598', '$2y$10$7ylbe1D6l/SMt2uRfMAdAO42m8ROb4n9qgVHLLBcR4CpsQ/AbWM3O', '12345678', 'gmc', 'mgc', 'hmf', 'xxyngbbD8NCIaOh2Vb249QVO3GKpiGLb.jpg', 'fOrCE8EeMcu4ts3EWBJEtVpLX4Fa2z3B.jpg', 0, 0, NULL, '2024-04-19 05:59:33', '2024-04-19 05:59:33'),
(24, 'amany', 'nfcg', 'oplbn@gmail.com', '01245605557', '$2y$10$vyPI8SZ0n30OA1E7FyOZS.k.poBiO01ygZcoGN3/w8QHmVvzaZyxe', '12345678', 'gmc', 'mgc', 'hmf', 'Ahf4iJyWk1rYGDqe00uxHh0tb2lBKSeP.jpg', '1wRvK52AGL6AzUJwM55fNmQldPMoguG8.jpg', 0, 0, NULL, '2024-04-19 06:26:26', '2024-04-19 06:26:26'),
(25, 'amany', 'nfcg', 'moha@gmail.com', '01245635557', '$2y$10$4T.zTbnU2g.z4/kNPtd/Wed47BANTAwBSAOR6lVPdxe/E89UD/Kqa', '12345678', 'gmc', 'mgc', 'hmf', '6FPlaqjHGQG9By5I2qmQf7SiBONKx7Dy.jpg', 'OHF5NTluxac2inRq9hm0AIPA7w9pE5Id.jpg', 0, 0, NULL, '2024-04-19 06:58:21', '2024-04-19 06:58:21'),
(26, 'amany', 'nfcg', 'moham@gmail.com', '01245635657', '$2y$10$m6EKywnGf9aeL3CCZzKvL.30VTAdf38b.Ws9Itz/C8zEM5MrcFgSu', '12345678', 'gmc', 'mgc', 'hmf', 'XZKoOy3EWAUwGVVe0EPELPLVEmoIfLz4.jpg', '3KaOiJzrY9VDhrsvHbk2pTtjzITSlVOb.jpg', 0, 0, NULL, '2024-04-19 06:58:58', '2024-04-19 06:58:58'),
(27, 'amany', 'mohamed', 'bh@gmail.com', '01285985649', '$2y$10$l.bfvF5gKPPkV8Sn8m7KdeAWes.K5HwWu0kxmaQ0r0tnzq4c0qDyS', '12345678', 'hf', 'bhf', 'gkhk', 'KvDjx4Kx3w.png', 'KvDjx4Kx3w.png', 0, 0, NULL, '2024-04-19 12:19:37', '2024-04-19 12:19:37'),
(28, 'amany', 'mohamed', 'mh@gmail.com', '01285985642', '$2y$10$Cyvu.HZRFwthz6qb0jITpuJwxDcUWMwEQIWHNqLYfDOfmAvo5opDG', '12345678', 'hf', 'bhf', 'gkhk', 'QhUrDb9omY.png', 'QhUrDb9omY.png', 0, 0, NULL, '2024-04-19 12:20:55', '2024-04-19 12:20:55'),
(29, 'amany', 'mohamed', 'mhl@gmail.com', '01285985641', '$2y$10$MaXo9JLklotZqn4N3S5EButGJ4R1cj621aDNRdF.OGOqiFq5hEnwm', '12345678', 'hf', 'bhf', 'gkhk', 'ePzeo39VIY.png', 'ePzeo39VIY.png', 0, 0, NULL, '2024-04-19 12:28:38', '2024-04-19 12:28:38'),
(30, 'amany', 'mohamed', 'mhln@gmail.com', '01285985640', '$2y$10$WzMl5KYez6vC9jI2GxQwYOP3KepdxcwB839dg0ZB/5XUjepgFmjyK', '12345678', 'hf', 'bhf', 'gkhk', 'uCFDAoD3eO.png', 'uCFDAoD3eO.png', 0, 0, NULL, '2024-04-19 12:31:38', '2024-04-19 12:31:38'),
(31, 'amany', 'mohamed', 'mhlnm@gmail.com', '01285985647', '$2y$10$zPXpttHQE6cPcA7Bf/1WVO4VAEUVrg1WvFedOtm9xSznqMEh4lM7m', '12345678', 'hf', 'bhf', 'gkhk', 'DPmxsjhIlN.png', 'DPmxsjhIlN.png', 0, 0, NULL, '2024-04-19 13:19:33', '2024-04-19 13:19:33'),
(32, 'amany', 'mohamed', 'mhlnq@gmail.com', '01285985648', '$2y$10$l8mpg9xJ2hC8FGmIC33ScO7IcQYtgCXxVu44Y0wDeewHb.WKVzPhG', '12345678', 'hf', 'bhf', 'gkhk', 'TSLqt6BoRM.png', 'TSLqt6BoRM.png', 0, 0, NULL, '2024-04-19 13:48:39', '2024-04-19 13:48:39'),
(33, 'amany', 'mohamed', 'mhlnb@gmail.com', '01285885648', '$2y$10$3r1.77zNhtOjVxOzOPwJ6ONikK9IidOwtJCb/G/XnJmzD5Aqanj/C', '12345678', 'hf', 'bhf', 'gkhk', 'VAfmHPVXjF.png', 'VAfmHPVXjF.png', 0, 0, NULL, '2024-04-19 13:51:24', '2024-04-19 13:51:24'),
(34, '\"amany\"', 'nmjv', 'nhb@gmail.com', '01235905484', '$2y$10$h0x78N9QS64udjQRx4YF5.Et9x5shjsOF6aMu19WXHeioLGj72bA2', '12345678', 'jdhgv', 'mhcg,jv', 'jfv,v', 'OZBp9ZvPG5GcijFhE0jNsP0WEUiVJBjx.PNG', 'OZBp9ZvPG5GcijFhE0jNsP0WEUiVJBjx.PNG', 0, 0, NULL, '2024-04-19 23:56:04', '2024-04-19 23:56:04'),
(35, '\"amany\"', 'nmjv', 'nhb@gmail.com', '01235905484', '$2y$10$ZYrqnMHH0gNaxYh2Ewq5z.PlVGZn.eFb2JZqgL1V24nPmek.kWrbq', '12345678', 'jdhgv', 'mhcg,jv', 'jfv,v', 'j9x2xKaQH4SnyLI6QJjKFl34dkXpL2zq.PNG', 'j9x2xKaQH4SnyLI6QJjKFl34dkXpL2zq.PNG', 0, 0, NULL, '2024-04-19 23:57:36', '2024-04-19 23:57:36');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb3_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
CREATE TABLE IF NOT EXISTS `message` (
  `id-message` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name user` varchar(11) NOT NULL,
  `email user` varchar(11) NOT NULL,
  `message` text NOT NULL,
  `post id` int NOT NULL,
  `created at` timestamp NOT NULL,
  `updated at` timestamp NOT NULL,
  `reply of` text NOT NULL,
  PRIMARY KEY (`id-message`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(8, '2014_10_12_000000_create_users_table', 1),
(9, '2014_10_12_100000_create_password_resets_table', 1),
(10, '2019_08_19_000000_create_failed_jobs_table', 1),
(11, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(12, '2024_03_07_232145_create_dentists_table', 1),
(13, '2024_03_07_232218_create_admins_table', 1),
(14, '2024_03_07_232505_create_dentistpassword_reset_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`id`, `email`, `token`, `created_at`) VALUES
(1, 'ahmed@gmail.com', '1609', '2024-03-23 05:41:07'),
(6, 'amany@gmail.com', '5457', '2024-04-08 21:14:32'),
(5, 'eslam@gmail.com', '8991', '2024-04-03 22:36:08');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE IF NOT EXISTS `payment` (
  `id-payment` bigint UNSIGNED NOT NULL,
  `money` int NOT NULL,
  `type` varchar(11) NOT NULL,
  `expire` datetime NOT NULL,
  `number` int NOT NULL,
  `zipcode` int NOT NULL,
  `den-id` bigint UNSIGNED NOT NULL,
  `red-id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`id-payment`),
  KEY `test6` (`den-id`),
  KEY `test7` (`red-id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb3_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb3_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=MyISAM AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(11, 'App\\Models\\User', 3, 'MyApp', 'ac81ca7f0d7c5f9d7cec44612b81ba52234608d3f8506af0b1a56b8212abb46c', '[\"*\"]', NULL, NULL, '2024-03-23 05:33:10', '2024-03-23 05:33:10'),
(8, 'App\\Models\\User', 3, 'MyApp', 'a406622d96f4c08d9d7742242f473067220fb24a46591b281c3d15fc41b2d604', '[\"*\"]', NULL, NULL, '2024-03-21 22:23:17', '2024-03-21 22:23:17'),
(6, 'App\\Models\\User', 3, 'MyApp', 'c3674374989086af14eac6dc8091fbb5225098d6c14ab53e1b5fd14bb5d2bb5d', '[\"*\"]', '2024-03-21 21:26:50', NULL, '2024-03-21 21:21:43', '2024-03-21 21:26:50'),
(29, 'App\\Models\\User', 6, 'MyApp', '305044b56056b0beba2d7d80e8dbba871a8f9a5da6b65cb153a2ae201d66300e', '[\"*\"]', NULL, NULL, '2024-04-17 05:51:37', '2024-04-17 05:51:37'),
(25, 'App\\Models\\User', 2, 'authToken', 'db55aec6be56abc2c40acbaede26a446d6ce1072e90ef87553a899aae1fce4d2', '[\"*\"]', NULL, NULL, '2024-04-08 21:13:02', '2024-04-08 21:13:02'),
(23, 'App\\Models\\User', 4, 'authToken', 'a05ae89f8f104ab194b9c9c4ea13a48b1c995130f032d3af8bd44d0234ad8043', '[\"*\"]', NULL, NULL, '2024-04-03 22:28:36', '2024-04-03 22:28:36'),
(24, 'App\\Models\\User', 4, 'MyApp', 'e9d42ffe9863c633b73faaaff168939c8d8eacdd3bca8530f60cda3dcabb4c43', '[\"*\"]', NULL, NULL, '2024-04-03 22:28:55', '2024-04-03 22:28:55'),
(44, 'App\\Models\\Dentist', 9, 'MyApp', '45ad57356b9b7ce7a4dec240b308223cfbce2d19686eaad67e8c101a153aaafa', '[\"*\"]', NULL, NULL, '2024-04-18 21:04:56', '2024-04-18 21:04:56'),
(30, 'App\\Models\\Dentist', 1, 'MyApp', 'b30a6a1a1e364e90b0226fb134d733ca26ea29ba6259beae7ece25c582858078', '[\"*\"]', NULL, NULL, '2024-04-17 07:17:48', '2024-04-17 07:17:48'),
(31, 'App\\Models\\Dentist', 2, 'MyApp', '70757466ec90730943fbcc58d108946a41779678bdf9f996f95c5573038e0066', '[\"*\"]', NULL, NULL, '2024-04-17 07:21:29', '2024-04-17 07:21:29'),
(32, 'App\\Models\\Dentist', 3, 'MyApp', '3c540675b85a07343bc573fb2c22639f5c336ce1cbce6cb0ed16570950d09a50', '[\"*\"]', NULL, NULL, '2024-04-17 07:22:31', '2024-04-17 07:22:31'),
(43, 'App\\Models\\Dentist', 6, 'MyApp', 'fb7d746573add97ddf519bb8f2bb4afe46d847aaf96771b5cc7e61be94c2a6e6', '[\"*\"]', NULL, NULL, '2024-04-18 20:47:39', '2024-04-18 20:47:39'),
(40, 'App\\Models\\Dentist', 4, 'authToken', '6c6504056ddc2190fec9485e5b65964e3eb00dd0c22bc9cfee366ca9b8a25076', '[\"*\"]', NULL, NULL, '2024-04-17 09:05:09', '2024-04-17 09:05:09'),
(41, 'App\\Models\\User', 5, 'authToken', '89a0fe8d9d45e277067064c07c87b692c52e1fbc01259cfe49fed38ea873dfa2', '[\"*\"]', NULL, NULL, '2024-04-17 09:07:55', '2024-04-17 09:07:55'),
(42, 'App\\Models\\Dentist', 5, 'MyApp', 'd1bd11bae9e451832f0c8b35fac6457512516ab3264646ed906f2d6c6323685f', '[\"*\"]', NULL, NULL, '2024-04-18 20:44:52', '2024-04-18 20:44:52'),
(45, 'App\\Models\\Dentist', 10, 'MyApp', 'b0275b907b4375a88b66ef789e21cd6a813c61b79dae3783376970c18cd8399e', '[\"*\"]', NULL, NULL, '2024-04-18 21:05:42', '2024-04-18 21:05:42'),
(46, 'App\\Models\\Dentist', 11, 'MyApp', '7dfbbac2668ea5861180353f58a29f1f2ad7f6f52c1c4cad4d74694fec8f6ca7', '[\"*\"]', NULL, NULL, '2024-04-18 21:07:02', '2024-04-18 21:07:02'),
(47, 'App\\Models\\Dentist', 13, 'MyApp', '006a41d6268fb9452dfe46f9212fe51a3e61feb11818b6861e881eaa0db70016', '[\"*\"]', NULL, NULL, '2024-04-18 21:14:25', '2024-04-18 21:14:25'),
(48, 'App\\Models\\Dentist', 14, 'MyApp', '892ae6d2f15249bd590a87ced827d918dcae2544f1d7c38abe09188213806da9', '[\"*\"]', NULL, NULL, '2024-04-18 21:22:04', '2024-04-18 21:22:04'),
(49, 'App\\Models\\Dentist', 17, 'MyApp', '6e14b644a9b11bd01add5792949f9f9f708c8ea771c68f7ac4f92ad196a9d34c', '[\"*\"]', NULL, NULL, '2024-04-19 05:13:15', '2024-04-19 05:13:15'),
(50, 'App\\Models\\Dentist', 18, 'MyApp', '58b3642e6bf4a0e72e58d444152baee263fa10dd46839b2fbd20cfa46a76da05', '[\"*\"]', NULL, NULL, '2024-04-19 05:16:25', '2024-04-19 05:16:25'),
(51, 'App\\Models\\Dentist', 21, 'MyApp', '71ce886b179dece63e9f89fbc8db83315b1d526decaa6cc652c9c7cf97806fd5', '[\"*\"]', NULL, NULL, '2024-04-19 05:42:21', '2024-04-19 05:42:21'),
(52, 'App\\Models\\Dentist', 24, 'MyApp', '8945324e0e94556c16be423461058bd19dd5f790b0beb5661a4d405e6ded12db', '[\"*\"]', NULL, NULL, '2024-04-19 06:26:26', '2024-04-19 06:26:26'),
(53, 'App\\Models\\Dentist', 26, 'MyApp', 'ca0e34743c8af40fd941c2a9d4c8fd5c000c5dc078f5e72269fdbef22685c095', '[\"*\"]', NULL, NULL, '2024-04-19 06:58:58', '2024-04-19 06:58:58'),
(54, 'App\\Models\\Dentist', 29, 'MyApp', '07ea40fa44e11720e6c2fb87a976277dede1dbf49898e67c72cb5a5f13ede9bd', '[\"*\"]', NULL, NULL, '2024-04-19 12:28:40', '2024-04-19 12:28:40'),
(55, 'App\\Models\\Dentist', 30, 'MyApp', '8114090954fd76d7f3240a3b3bd591733addf48c93d5f9eff4677d126f93939d', '[\"*\"]', NULL, NULL, '2024-04-19 12:31:38', '2024-04-19 12:31:38'),
(56, 'App\\Models\\Dentist', 31, 'MyApp', '22b07b27bc899f42b60d9c419f5030f6952950e334e8ac0caf065d09bb3d5541', '[\"*\"]', NULL, NULL, '2024-04-19 13:19:33', '2024-04-19 13:19:33'),
(57, 'App\\Models\\Dentist', 33, 'MyApp', 'c2d6740a1949a2ce9dddda1cdfcfdd4da1c3dc174b30069883f659cb6036f141', '[\"*\"]', NULL, NULL, '2024-04-19 13:51:24', '2024-04-19 13:51:24'),
(58, 'App\\Models\\Dentist', 35, 'MyApp', '83299572fe5aed9a0d8c858dbe6d4251820c9b409b5597c9c4108da4629644d5', '[\"*\"]', NULL, NULL, '2024-04-19 23:57:37', '2024-04-19 23:57:37');

-- --------------------------------------------------------

--
-- Table structure for table `radiology center`
--

DROP TABLE IF EXISTS `radiology center`;
CREATE TABLE IF NOT EXISTS `radiology center` (
  `radio-id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `password` varchar(9) NOT NULL,
  `confirm password` varchar(9) NOT NULL,
  `covernate` varchar(11) NOT NULL,
  `region` varchar(11) NOT NULL,
  `your address` varchar(11) NOT NULL,
  `personal photo` varchar(11) NOT NULL,
  `syndicated card` varchar(11) NOT NULL,
  `proved` tinyint(1) NOT NULL DEFAULT '0',
  `used` tinyint(1) NOT NULL DEFAULT '0',
  `created at` timestamp NOT NULL,
  `updated at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`radio-id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ray`
--

DROP TABLE IF EXISTS `ray`;
CREATE TABLE IF NOT EXISTS `ray` (
  `id-ray` bigint UNSIGNED NOT NULL,
  `full name` varchar(11) NOT NULL,
  `email` varchar(11) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `age` varchar(6) NOT NULL,
  `date` datetime NOT NULL,
  `doctor name` varchar(11) NOT NULL,
  `email doctor` varchar(11) NOT NULL,
  `dent-id` bigint UNSIGNED NOT NULL,
  `rad-id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`id-ray`),
  KEY `test2` (`dent-id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

DROP TABLE IF EXISTS `request`;
CREATE TABLE IF NOT EXISTS `request` (
  `id-request` bigint NOT NULL,
  `name patient` varchar(11) NOT NULL,
  `email patient` varchar(11) NOT NULL,
  `phone patient` varchar(11) NOT NULL,
  `email doctor` varchar(11) NOT NULL,
  `date` datetime NOT NULL,
  `age` int NOT NULL,
  `red-id` bigint UNSIGNED NOT NULL,
  `den-id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`id-request`),
  KEY `test4` (`den-id`),
  KEY `test5` (`red-id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
CREATE TABLE IF NOT EXISTS `reservation` (
  `id-reserve` bigint UNSIGNED NOT NULL,
  `email doctor` varchar(11) NOT NULL,
  `first name` varchar(11) NOT NULL,
  `last name` varchar(11) NOT NULL,
  `email patient` varchar(11) NOT NULL,
  `phone patient` varchar(11) NOT NULL,
  `doctor name` varchar(11) NOT NULL,
  `finished` tinyint(1) NOT NULL DEFAULT '0',
  `waiting list` tinyint(1) NOT NULL DEFAULT '0',
  `id-patient` bigint UNSIGNED NOT NULL,
  `den-id` bigint UNSIGNED NOT NULL,
  PRIMARY KEY (`id-reserve`),
  KEY `test8` (`id-patient`),
  KEY `test9` (`den-id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `firstname` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `secondname` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `phone` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `Governate` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `region` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `confirm_password` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `secondname`, `phone`, `email`, `Governate`, `region`, `email_verified_at`, `password`, `confirm_password`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'amany', 'elsaed', '01285905496', 'amany@gmail.com', 'mahallah', 'gjtdvg', NULL, '$2y$10$UdxWtg11jHHz/b9WLvtS4e7qIymp2B7dOeWb2gvrABzdWRBJ2HWhq', '12345678', NULL, '2024-03-20 22:57:17', '2024-04-08 21:13:02'),
(3, 'amany', 'ahmed', '01285905494', 'ahmed@gmail.com', 'nhui', 'bjhy', NULL, '$2y$10$rA5.7vOHITJtJtyjxX7T7.5wGFkn11YUZz8/GLyikKN1JEixBkkUO', '12345678', NULL, '2024-03-21 21:21:43', '2024-03-21 21:21:43'),
(4, 'eslam', 'esalmhj', '01285905495', 'eslam@gmail.com', 'njgft', 'njgrt', NULL, '$2y$10$NF5AiINllNVsX.r9aRpb3umbyvMgIONRDS64ulPLCd8RXxd0Si5UG', '12345678', NULL, '2024-03-23 04:56:57', '2024-04-03 22:28:35'),
(5, 'manar', 'royf', '01285905499', 'manar@gmail.com', 'hgt', 'nhg', NULL, '$2y$10$Wv/uG9.6IXJZ/xtuyIRw2ueJDHA1SyHgTsNPQTm0L6RCwgga2A0Du', '12345676', NULL, '2024-04-08 21:31:17', '2024-04-17 09:07:55'),
(6, 'moh', 'fgh', '01285905463', 'basma@gmail.com', 'bh', 'njl', NULL, '$2y$10$naNUPKPu0ZNS/Owa5PCJXe6.1.SbYDv21ziLrRgzBlotzIJM75Y/K', '12345678', NULL, '2024-04-17 05:51:37', '2024-04-17 05:51:37');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appoin-reserve`
--
ALTER TABLE `appoin-reserve`
  ADD CONSTRAINT `test10` FOREIGN KEY (`id-reserve`) REFERENCES `reservation` (`id-reserve`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `Test` FOREIGN KEY (`id-den`) REFERENCES `dentists` (`dentist_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `category doctor`
--
ALTER TABLE `category doctor`
  ADD CONSTRAINT `test16` FOREIGN KEY (`id-cat`) REFERENCES `category` (`id-cat`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `test17` FOREIGN KEY (`id-den`) REFERENCES `dentists` (`dentist_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `category patient`
--
ALTER TABLE `category patient`
  ADD CONSTRAINT `test18` FOREIGN KEY (`id-cat`) REFERENCES `category` (`id-cat`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `test19` FOREIGN KEY (`id-patient`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `chat`
--
ALTER TABLE `chat`
  ADD CONSTRAINT `test11` FOREIGN KEY (`den-id`) REFERENCES `dentists` (`dentist_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `test12` FOREIGN KEY (`patient-id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `content type`
--
ALTER TABLE `content type`
  ADD CONSTRAINT `test15` FOREIGN KEY (`id-cat`) REFERENCES `category` (`id-cat`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `test6` FOREIGN KEY (`den-id`) REFERENCES `dentists` (`dentist_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `test7` FOREIGN KEY (`red-id`) REFERENCES `radiology center` (`radio-id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `ray`
--
ALTER TABLE `ray`
  ADD CONSTRAINT `test2` FOREIGN KEY (`dent-id`) REFERENCES `dentists` (`dentist_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `test3` FOREIGN KEY (`id-ray`) REFERENCES `radiology center` (`radio-id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `request`
--
ALTER TABLE `request`
  ADD CONSTRAINT `test4` FOREIGN KEY (`den-id`) REFERENCES `dentists` (`dentist_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `test5` FOREIGN KEY (`red-id`) REFERENCES `radiology center` (`radio-id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `test8` FOREIGN KEY (`id-patient`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `test9` FOREIGN KEY (`den-id`) REFERENCES `dentists` (`dentist_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
