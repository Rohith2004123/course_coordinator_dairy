-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 03, 2024 at 01:12 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `students_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `eighth_semester`
--

CREATE TABLE `eighth_semester` (
  `id` int(11) NOT NULL,
  `usn` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `branch` varchar(255) DEFAULT NULL,
  `batch` varchar(255) DEFAULT NULL,
  `semester` varchar(255) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `dateofbirth` date DEFAULT NULL,
  `gmail` varchar(255) DEFAULT NULL,
  `phonenumber` varchar(50) DEFAULT NULL,
  `address` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fifth_semester`
--

CREATE TABLE `fifth_semester` (
  `id` int(11) NOT NULL,
  `usn` varchar(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `branch` varchar(50) DEFAULT NULL,
  `batch` varchar(50) DEFAULT NULL,
  `semester` int(11) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `dateofbirth` date DEFAULT NULL,
  `gmail` varchar(255) DEFAULT NULL,
  `phonenumber` varchar(20) DEFAULT NULL,
  `address` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fifth_semester`
--

INSERT INTO `fifth_semester` (`id`, `usn`, `name`, `branch`, `batch`, `semester`, `gender`, `dateofbirth`, `gmail`, `phonenumber`, `address`) VALUES
(72, '4DM21IS001', 'Rahul', 'ISE', '2023-24', 5, 'MALE', '2003-06-07', 'rahul@gmail.com', '1234567890', 'KARKALA'),
(73, '4DM21IS002', 'Radhika', 'ISE', '2023-24', 5, 'FEMALE', '2003-04-01', 'radhika@gmail.com', '9876543210', 'MANGALORE'),
(74, '4DM21IS003', 'Santhosh', 'ISE', '2023-24', 5, 'MALE', '2003-02-02', 'santhosh@gmail.com', '7410258963', 'MOODABIDRI');

-- --------------------------------------------------------

--
-- Table structure for table `first_semester`
--

CREATE TABLE `first_semester` (
  `id` int(11) NOT NULL,
  `usn` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `branch` varchar(255) DEFAULT NULL,
  `batch` varchar(255) DEFAULT NULL,
  `semester` varchar(255) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `dateofbirth` date DEFAULT NULL,
  `gmail` varchar(255) DEFAULT NULL,
  `phonenumber` varchar(50) DEFAULT NULL,
  `address` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fourth_semester`
--

CREATE TABLE `fourth_semester` (
  `id` int(11) NOT NULL,
  `usn` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `branch` varchar(255) DEFAULT NULL,
  `batch` varchar(255) DEFAULT NULL,
  `semester` varchar(255) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `dateofbirth` date DEFAULT NULL,
  `gmail` varchar(255) DEFAULT NULL,
  `phonenumber` varchar(50) DEFAULT NULL,
  `address` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qp_split_up`
--

CREATE TABLE `qp_split_up` (
  `id` int(11) NOT NULL,
  `semester` int(11) DEFAULT NULL,
  `sub_code` varchar(20) DEFAULT NULL,
  `sub_name` varchar(100) DEFAULT NULL,
  `which_ia` int(11) DEFAULT NULL,
  `total_marks` int(11) DEFAULT NULL,
  `co_data` text DEFAULT NULL,
  `co_totals` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`co_totals`)),
  `questions_data` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `qp_split_up`
--

INSERT INTO `qp_split_up` (`id`, `semester`, `sub_code`, `sub_name`, `which_ia`, `total_marks`, `co_data`, `co_totals`, `questions_data`, `created_at`) VALUES
(38, 5, '21CS51', 'Operating System', 1, 15, '{\"Q1\":\"CO1\",\"Q2\":\"CO1\",\"Q3\":\"CO1\",\"Q4\":\"CO1\"}', '{\"CO1\":30}', '{\"Q1a\":\"7\",\"Q1b\":\"8\",\"Q2a\":\"7\",\"Q2b\":\"8\",\"Q3a\":\"7\",\"Q3b\":\"8\",\"Q4a\":\"7\",\"Q4b\":\"8\"}', '2024-07-28 13:57:55'),
(39, 5, '21CS51', 'Operating System', 2, 15, '{\"Q1\":\"CO2\",\"Q2\":\"CO2\",\"Q3\":\"CO3\",\"Q4\":\"CO3\"}', '{\"CO2\":15,\"CO3\":15}', '{\"Q1a\":\"10\",\"Q1b\":\"5\",\"Q2a\":\"10\",\"Q2b\":\"5\",\"Q3a\":\"7\",\"Q3b\":\"8\",\"Q4a\":\"7\",\"Q4b\":\"8\"}', '2024-07-27 10:59:20'),
(40, 5, '21CS51', 'Operating System', 3, 15, '{\"Q1\":\"CO4\",\"Q2\":\"CO4\",\"Q3\":\"CO5\",\"Q4\":\"CO5\"}', '{\"CO4\":15,\"CO5\":15}', '{\"Q1a\":\"10\",\"Q1b\":\"5\",\"Q2a\":\"10\",\"Q2b\":\"5\",\"Q3a\":\"7\",\"Q3b\":\"8\",\"Q4a\":\"7\",\"Q4b\":\"8\"}', '2024-07-27 11:01:12');

-- --------------------------------------------------------

--
-- Table structure for table `second_semester`
--

CREATE TABLE `second_semester` (
  `id` int(11) NOT NULL,
  `usn` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `branch` varchar(255) DEFAULT NULL,
  `batch` varchar(255) DEFAULT NULL,
  `semester` varchar(255) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `dateofbirth` date DEFAULT NULL,
  `gmail` varchar(255) DEFAULT NULL,
  `phonenumber` varchar(50) DEFAULT NULL,
  `address` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sem5_machine_learning_21cs52_assessment_marks`
--

CREATE TABLE `sem5_machine_learning_21cs52_assessment_marks` (
  `id` int(11) NOT NULL,
  `usn` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `CO1` int(11) DEFAULT 0,
  `CO2` int(11) DEFAULT 0,
  `CO3` int(11) DEFAULT 0,
  `CO4` int(11) DEFAULT 0,
  `CO6` int(11) DEFAULT 0,
  `total_mark` int(11) DEFAULT 0,
  `scaled_mark` float DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sem5_machine_learning_21cs52_assessment_marks`
--

INSERT INTO `sem5_machine_learning_21cs52_assessment_marks` (`id`, `usn`, `name`, `CO1`, `CO2`, `CO3`, `CO4`, `CO6`, `total_mark`, `scaled_mark`) VALUES
(1, '4DM21IS001', 'Rahul', 10, 6, 10, 6, 6, 38, 15.2),
(2, '4DM21IS002', 'Radhika', 0, 0, 0, 0, 0, 0, 0),
(3, '4DM21IS003', 'Santhosh', 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sem5_operating_system_21cs51_assessment_marks`
--

CREATE TABLE `sem5_operating_system_21cs51_assessment_marks` (
  `id` int(11) NOT NULL,
  `usn` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `CO1` int(11) DEFAULT 0,
  `CO2` int(11) DEFAULT 0,
  `CO3` int(11) DEFAULT 0,
  `CO4` int(11) DEFAULT 0,
  `CO5` int(11) DEFAULT 0,
  `total_mark` int(11) DEFAULT 0,
  `scaled_mark` float DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sem5_operating_system_21cs51_assessment_marks`
--

INSERT INTO `sem5_operating_system_21cs51_assessment_marks` (`id`, `usn`, `name`, `CO1`, `CO2`, `CO3`, `CO4`, `CO5`, `total_mark`, `scaled_mark`) VALUES
(1, '4DM21IS001', 'Rahul', 10, 10, 9, 8, 7, 44, 17.6),
(2, '4DM21IS002', 'Radhika', 10, 10, 8, 8, 8, 44, 17.6),
(3, '4DM21IS003', 'Santhosh', 10, 10, 8, 7, 7, 42, 16.8);

-- --------------------------------------------------------

--
-- Table structure for table `sem5_operating_system_21cs51_ia1`
--

CREATE TABLE `sem5_operating_system_21cs51_ia1` (
  `id` int(11) NOT NULL,
  `usn` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `questions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`questions`)),
  `total_marks` float NOT NULL,
  `total_avg_marks` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sem5_operating_system_21cs51_ia1`
--

INSERT INTO `sem5_operating_system_21cs51_ia1` (`id`, `usn`, `name`, `questions`, `total_marks`, `total_avg_marks`) VALUES
(1, '4DM21IS001', 'Rahul', '{\"Q1a\":\"10\",\"Q1b\":\"4\",\"Q2a\":\"\",\"Q2b\":\"\",\"Q3a\":\"10\",\"Q3b\":\"4\",\"Q4a\":\"\",\"Q4b\":\"\"}', 28, 0),
(2, '4DM21IS002', 'Radhika', '{\"Q1a\":\"\",\"Q1b\":\"\",\"Q2a\":\"5\",\"Q2b\":\"4\",\"Q3a\":\"5\",\"Q3b\":\"5\",\"Q4a\":\"\",\"Q4b\":\"\"}', 19, 0),
(3, '4DM21IS003', 'Santhosh', '{\"Q1a\":\"\",\"Q1b\":\"\",\"Q2a\":\"6\",\"Q2b\":\"4\",\"Q3a\":\"\",\"Q3b\":\"\",\"Q4a\":\"6\",\"Q4b\":\"3\"}', 19, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sem5_operating_system_21cs51_ia1_co_marks`
--

CREATE TABLE `sem5_operating_system_21cs51_ia1_co_marks` (
  `id` int(11) NOT NULL,
  `usn` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `co_name` varchar(50) NOT NULL,
  `co_marks` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sem5_operating_system_21cs51_ia1_co_marks`
--

INSERT INTO `sem5_operating_system_21cs51_ia1_co_marks` (`id`, `usn`, `name`, `co_name`, `co_marks`) VALUES
(1, '4DM21IS001', 'Rahul', 'CO1', 28),
(2, '4DM21IS002', 'Radhika', 'CO1', 19),
(3, '4DM21IS003', 'Santhosh', 'CO1', 19);

-- --------------------------------------------------------

--
-- Table structure for table `sem5_operating_system_21cs51_ia2`
--

CREATE TABLE `sem5_operating_system_21cs51_ia2` (
  `id` int(11) NOT NULL,
  `usn` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `questions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`questions`)),
  `total_marks` float NOT NULL,
  `total_avg_marks` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sem5_operating_system_21cs51_ia2`
--

INSERT INTO `sem5_operating_system_21cs51_ia2` (`id`, `usn`, `name`, `questions`, `total_marks`, `total_avg_marks`) VALUES
(1, '4DM21IS001', 'Rahul', '{\"Q1a\":\"5\",\"Q1b\":\"4\",\"Q2a\":\"\",\"Q2b\":\"\",\"Q3a\":\"5\",\"Q3b\":\"6\",\"Q4a\":\"\",\"Q4b\":\"\"}', 20, 0),
(2, '4DM21IS002', 'Radhika', '{\"Q1a\":\"\",\"Q1b\":\"\",\"Q2a\":\"5\",\"Q2b\":\"5\",\"Q3a\":\"\",\"Q3b\":\"\",\"Q4a\":\"6\",\"Q4b\":\"6\"}', 22, 0),
(3, '4DM21IS003', 'Santhosh', '{\"Q1a\":\"\",\"Q1b\":\"\",\"Q2a\":\"7\",\"Q2b\":\"4\",\"Q3a\":\"\",\"Q3b\":\"\",\"Q4a\":\"4\",\"Q4b\":\"4\"}', 19, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sem5_operating_system_21cs51_ia2_co_marks`
--

CREATE TABLE `sem5_operating_system_21cs51_ia2_co_marks` (
  `id` int(11) NOT NULL,
  `usn` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `co_name` varchar(50) NOT NULL,
  `co_marks` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sem5_operating_system_21cs51_ia2_co_marks`
--

INSERT INTO `sem5_operating_system_21cs51_ia2_co_marks` (`id`, `usn`, `name`, `co_name`, `co_marks`) VALUES
(1, '4DM21IS001', 'Rahul', 'CO2', 9),
(2, '4DM21IS001', 'Rahul', 'CO3', 11),
(3, '4DM21IS002', 'Radhika', 'CO2', 10),
(4, '4DM21IS002', 'Radhika', 'CO3', 12),
(5, '4DM21IS003', 'Santhosh', 'CO2', 11),
(6, '4DM21IS003', 'Santhosh', 'CO3', 8);

-- --------------------------------------------------------

--
-- Table structure for table `sem5_operating_system_21cs51_ia3`
--

CREATE TABLE `sem5_operating_system_21cs51_ia3` (
  `id` int(11) NOT NULL,
  `usn` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `questions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`questions`)),
  `total_marks` float NOT NULL,
  `total_avg_marks` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sem5_operating_system_21cs51_ia3`
--

INSERT INTO `sem5_operating_system_21cs51_ia3` (`id`, `usn`, `name`, `questions`, `total_marks`, `total_avg_marks`) VALUES
(1, '4DM21IS001', 'Rahul', '{\"Q1a\":\"4\",\"Q1b\":\"3\",\"Q2a\":\"\",\"Q2b\":\"\",\"Q3a\":\"\",\"Q3b\":\"\",\"Q4a\":\"5\",\"Q4b\":\"7\"}', 19, 0),
(2, '4DM21IS002', 'Radhika', '{\"Q1a\":\"\",\"Q1b\":\"\",\"Q2a\":\"10\",\"Q2b\":\"5\",\"Q3a\":\"\",\"Q3b\":\"\",\"Q4a\":\"7\",\"Q4b\":\"8\"}', 30, 0),
(3, '4DM21IS003', 'Santhosh', '{\"Q1a\":\"\",\"Q1b\":\"\",\"Q2a\":\"2\",\"Q2b\":\"5\",\"Q3a\":\"\",\"Q3b\":\"\",\"Q4a\":\"5\",\"Q4b\":\"5\"}', 17, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sem5_operating_system_21cs51_ia3_co_marks`
--

CREATE TABLE `sem5_operating_system_21cs51_ia3_co_marks` (
  `id` int(11) NOT NULL,
  `usn` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `co_name` varchar(50) NOT NULL,
  `co_marks` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sem5_operating_system_21cs51_ia3_co_marks`
--

INSERT INTO `sem5_operating_system_21cs51_ia3_co_marks` (`id`, `usn`, `name`, `co_name`, `co_marks`) VALUES
(1, '4DM21IS001', 'Rahul', 'CO4', 7),
(2, '4DM21IS001', 'Rahul', 'CO5', 12),
(3, '4DM21IS002', 'Radhika', 'CO4', 15),
(4, '4DM21IS002', 'Radhika', 'CO5', 15),
(5, '4DM21IS003', 'Santhosh', 'CO4', 7),
(6, '4DM21IS003', 'Santhosh', 'CO5', 10);

-- --------------------------------------------------------

--
-- Table structure for table `sem5_operating_system_21cs51_ia_aggregate`
--

CREATE TABLE `sem5_operating_system_21cs51_ia_aggregate` (
  `id` int(11) NOT NULL,
  `usn` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `ia1_marks` float DEFAULT 0,
  `ia2_marks` float DEFAULT 0,
  `ia3_marks` float DEFAULT 0,
  `total_ia_marks` float DEFAULT 0,
  `avg_marks` float DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sem5_operating_system_21cs51_ia_aggregate`
--

INSERT INTO `sem5_operating_system_21cs51_ia_aggregate` (`id`, `usn`, `name`, `ia1_marks`, `ia2_marks`, `ia3_marks`, `total_ia_marks`, `avg_marks`) VALUES
(1, '4DM21IS001', 'Rahul', 28, 20, 19, 67, 22.3333),
(2, '4DM21IS002', 'Radhika', 19, 22, 30, 71, 23.6667),
(3, '4DM21IS003', 'Santhosh', 19, 19, 17, 55, 18.3333);

-- --------------------------------------------------------

--
-- Table structure for table `seventh_semester`
--

CREATE TABLE `seventh_semester` (
  `id` int(11) NOT NULL,
  `usn` varchar(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `branch` varchar(50) DEFAULT NULL,
  `batch` varchar(50) DEFAULT NULL,
  `semester` int(11) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `dateofbirth` date DEFAULT NULL,
  `gmail` varchar(255) DEFAULT NULL,
  `phonenumber` varchar(20) DEFAULT NULL,
  `address` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sixth_semester`
--

CREATE TABLE `sixth_semester` (
  `id` int(11) NOT NULL,
  `usn` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `branch` varchar(255) DEFAULT NULL,
  `batch` varchar(255) DEFAULT NULL,
  `semester` varchar(255) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `dateofbirth` date DEFAULT NULL,
  `gmail` varchar(255) DEFAULT NULL,
  `phonenumber` varchar(50) DEFAULT NULL,
  `address` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` int(11) NOT NULL,
  `semester` int(11) DEFAULT NULL,
  `sub_code` varchar(20) DEFAULT NULL,
  `sub_name` varchar(100) DEFAULT NULL,
  `total_marks` int(11) DEFAULT NULL,
  `num_internals` int(11) DEFAULT NULL,
  `max_marks_each_internal` int(11) DEFAULT NULL,
  `theory_ia_marks` int(11) DEFAULT NULL,
  `mini_project_marks` int(11) DEFAULT NULL,
  `avg` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `semester`, `sub_code`, `sub_name`, `total_marks`, `num_internals`, `max_marks_each_internal`, `theory_ia_marks`, `mini_project_marks`, `avg`) VALUES
(56, 5, '21CS51', 'Operating System', 90, 3, 30, 30, 20, '30'),
(57, 5, '21CS52', 'Machine Learning', 90, 3, 30, 30, 20, '30'),
(68, 2, '21cs25', 'DATA SCIENCE', 90, 3, 30, 30, 20, '30'),
(69, 2, '21cs22', 'data', 90, 3, 30, 30, 20, '20');

-- --------------------------------------------------------

--
-- Table structure for table `third_semester`
--

CREATE TABLE `third_semester` (
  `id` int(11) NOT NULL,
  `usn` varchar(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `branch` varchar(50) DEFAULT NULL,
  `batch` varchar(50) DEFAULT NULL,
  `semester` int(11) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `dateofbirth` date DEFAULT NULL,
  `gmail` varchar(255) DEFAULT NULL,
  `phonenumber` varchar(20) DEFAULT NULL,
  `address` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `third_semester`
--

INSERT INTO `third_semester` (`id`, `usn`, `name`, `branch`, `batch`, `semester`, `gender`, `dateofbirth`, `gmail`, `phonenumber`, `address`) VALUES
(78, '4DM21IS001', 'Rahul', 'ISE', '2023-24', 5, 'MALE', '2003-06-07', 'rahul@gmail.com', '1234567890', 'KARKALA'),
(79, '4DM21IS002', 'Radhika', 'ISE', '2023-24', 5, 'FEMALE', '2003-04-01', 'radhika@gmail.com', '9876543210', 'MANGALORE'),
(80, '4DM21IS003', 'Santhosh', 'ISE', '2023-24', 5, 'MALE', '2003-02-02', 'santhosh@gmail.com', '7410258963', 'MOODABIDRI');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `created_at`) VALUES
(5, 'admin', 'admin123@gmail.com', '$2y$10$6mHEDGuQH2L9q84YPdXG3uqd/8FZFqJPl0Z9KZ522Ef7i7IbOJGnK', '2024-06-11 08:03:42'),
(6, 'bbb', 'bbb@gmail.com', '$2y$10$2oOtKfV8KLO2ZzTnb9O77uwYL8ol6gFY2SiJMJaJPAHZ6jH0xnLYu', '2024-06-11 08:59:51');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `eighth_semester`
--
ALTER TABLE `eighth_semester`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fifth_semester`
--
ALTER TABLE `fifth_semester`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usn` (`usn`);

--
-- Indexes for table `first_semester`
--
ALTER TABLE `first_semester`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fourth_semester`
--
ALTER TABLE `fourth_semester`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `qp_split_up`
--
ALTER TABLE `qp_split_up`
  ADD PRIMARY KEY (`id`),
  ADD KEY `semester` (`semester`,`sub_code`,`sub_name`);

--
-- Indexes for table `second_semester`
--
ALTER TABLE `second_semester`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sem5_machine_learning_21cs52_assessment_marks`
--
ALTER TABLE `sem5_machine_learning_21cs52_assessment_marks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usn` (`usn`);

--
-- Indexes for table `sem5_operating_system_21cs51_assessment_marks`
--
ALTER TABLE `sem5_operating_system_21cs51_assessment_marks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usn` (`usn`);

--
-- Indexes for table `sem5_operating_system_21cs51_ia1`
--
ALTER TABLE `sem5_operating_system_21cs51_ia1`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_record` (`usn`);

--
-- Indexes for table `sem5_operating_system_21cs51_ia1_co_marks`
--
ALTER TABLE `sem5_operating_system_21cs51_ia1_co_marks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_record` (`usn`,`co_name`);

--
-- Indexes for table `sem5_operating_system_21cs51_ia2`
--
ALTER TABLE `sem5_operating_system_21cs51_ia2`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_record` (`usn`);

--
-- Indexes for table `sem5_operating_system_21cs51_ia2_co_marks`
--
ALTER TABLE `sem5_operating_system_21cs51_ia2_co_marks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_record` (`usn`,`co_name`);

--
-- Indexes for table `sem5_operating_system_21cs51_ia3`
--
ALTER TABLE `sem5_operating_system_21cs51_ia3`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_record` (`usn`);

--
-- Indexes for table `sem5_operating_system_21cs51_ia3_co_marks`
--
ALTER TABLE `sem5_operating_system_21cs51_ia3_co_marks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_record` (`usn`,`co_name`);

--
-- Indexes for table `sem5_operating_system_21cs51_ia_aggregate`
--
ALTER TABLE `sem5_operating_system_21cs51_ia_aggregate`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_record` (`usn`);

--
-- Indexes for table `seventh_semester`
--
ALTER TABLE `seventh_semester`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usn` (`usn`);

--
-- Indexes for table `sixth_semester`
--
ALTER TABLE `sixth_semester`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `semester` (`semester`,`sub_code`,`sub_name`);

--
-- Indexes for table `third_semester`
--
ALTER TABLE `third_semester`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usn` (`usn`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `eighth_semester`
--
ALTER TABLE `eighth_semester`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `fifth_semester`
--
ALTER TABLE `fifth_semester`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `first_semester`
--
ALTER TABLE `first_semester`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fourth_semester`
--
ALTER TABLE `fourth_semester`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `qp_split_up`
--
ALTER TABLE `qp_split_up`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `second_semester`
--
ALTER TABLE `second_semester`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sem5_machine_learning_21cs52_assessment_marks`
--
ALTER TABLE `sem5_machine_learning_21cs52_assessment_marks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sem5_operating_system_21cs51_assessment_marks`
--
ALTER TABLE `sem5_operating_system_21cs51_assessment_marks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sem5_operating_system_21cs51_ia1`
--
ALTER TABLE `sem5_operating_system_21cs51_ia1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `sem5_operating_system_21cs51_ia1_co_marks`
--
ALTER TABLE `sem5_operating_system_21cs51_ia1_co_marks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `sem5_operating_system_21cs51_ia2`
--
ALTER TABLE `sem5_operating_system_21cs51_ia2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sem5_operating_system_21cs51_ia2_co_marks`
--
ALTER TABLE `sem5_operating_system_21cs51_ia2_co_marks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sem5_operating_system_21cs51_ia3`
--
ALTER TABLE `sem5_operating_system_21cs51_ia3`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sem5_operating_system_21cs51_ia3_co_marks`
--
ALTER TABLE `sem5_operating_system_21cs51_ia3_co_marks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sem5_operating_system_21cs51_ia_aggregate`
--
ALTER TABLE `sem5_operating_system_21cs51_ia_aggregate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `seventh_semester`
--
ALTER TABLE `seventh_semester`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `sixth_semester`
--
ALTER TABLE `sixth_semester`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `third_semester`
--
ALTER TABLE `third_semester`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `qp_split_up`
--
ALTER TABLE `qp_split_up`
  ADD CONSTRAINT `qp_split_up_ibfk_1` FOREIGN KEY (`semester`,`sub_code`,`sub_name`) REFERENCES `subjects` (`semester`, `sub_code`, `sub_name`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
