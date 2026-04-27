-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 10, 2025 at 03:10 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mshs_sms`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity`
--

CREATE TABLE `activity` (
  `id` int(11) NOT NULL,
  `student_id` varchar(64) NOT NULL,
  `grade` varchar(10) NOT NULL,
  `section` varchar(50) NOT NULL,
  `activity_number` int(11) NOT NULL,
  `total_items` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `group` int(11) DEFAULT NULL,
  `exclude_groupscore` int(11) NOT NULL DEFAULT '0',
  `school_year_id` int(11) NOT NULL,
  `quarter` tinyint(3) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `assignment`
--

CREATE TABLE `assignment` (
  `id` int(11) NOT NULL,
  `student_id` varchar(64) NOT NULL,
  `grade` varchar(10) NOT NULL,
  `section` varchar(50) NOT NULL,
  `assignment_number` int(11) NOT NULL,
  `total_items` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `school_year_id` int(11) NOT NULL DEFAULT '0',
  `quarter` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `id` int(11) NOT NULL,
  `grade` int(11) NOT NULL,
  `section` varchar(50) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `teacher` varchar(100) DEFAULT NULL,
  `schoolyear_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `groups_tbl`
--

CREATE TABLE `groups_tbl` (
  `id` int(11) NOT NULL,
  `grade` varchar(10) NOT NULL,
  `section` varchar(50) NOT NULL,
  `group_number` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `school_year_id` int(11) NOT NULL DEFAULT '0',
  `quarter` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `group_members`
--

CREATE TABLE `group_members` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `student_id` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `id` int(11) NOT NULL,
  `student_id` varchar(64) NOT NULL,
  `grade` varchar(10) NOT NULL,
  `section` varchar(50) NOT NULL,
  `project_number` int(11) NOT NULL,
  `total_items` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `group` int(11) DEFAULT NULL,
  `exclude_groupscore` int(11) NOT NULL DEFAULT '0',
  `school_year_id` int(11) NOT NULL,
  `quarter` tinyint(3) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `quarterlyassessment`
--

CREATE TABLE `quarterlyassessment` (
  `id` int(11) NOT NULL,
  `student_id` varchar(64) NOT NULL,
  `grade` varchar(10) NOT NULL,
  `section` varchar(50) NOT NULL,
  `quarterlyassessment_number` int(11) NOT NULL,
  `total_items` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `school_year_id` int(11) NOT NULL DEFAULT '0',
  `quarter` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `quiz`
--

CREATE TABLE `quiz` (
  `id` int(11) NOT NULL,
  `student_id` varchar(64) NOT NULL,
  `grade` varchar(10) NOT NULL,
  `section` varchar(50) NOT NULL,
  `quiz_number` int(11) NOT NULL,
  `total_items` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `school_year_id` int(11) NOT NULL DEFAULT '0',
  `quarter` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `schoolyear`
--

CREATE TABLE `schoolyear` (
  `id` int(11) NOT NULL,
  `schoolyear` varchar(50) NOT NULL,
  `quarter` varchar(50) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `archived_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `seatwork`
--

CREATE TABLE `seatwork` (
  `id` int(11) NOT NULL,
  `student_id` varchar(64) NOT NULL,
  `grade` varchar(10) NOT NULL,
  `section` varchar(50) NOT NULL,
  `seatwork_number` int(11) NOT NULL,
  `total_items` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `school_year_id` int(11) NOT NULL DEFAULT '0',
  `quarter` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `student_id` int(11) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `middlename` varchar(50) DEFAULT NULL,
  `sex` enum('Male','Female') NOT NULL,
  `grade` int(11) NOT NULL,
  `section` varchar(50) NOT NULL,
  `schoolyear_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `summarytest`
--

CREATE TABLE `summarytest` (
  `id` int(11) NOT NULL,
  `student_id` varchar(64) NOT NULL,
  `grade` varchar(10) NOT NULL,
  `section` varchar(50) NOT NULL,
  `summarytest_number` int(11) NOT NULL,
  `total_items` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `school_year_id` int(11) NOT NULL DEFAULT '0',
  `quarter` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','teacher','student') NOT NULL DEFAULT 'student'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `student_id`, `username`, `password`, `role`) VALUES
(1, NULL, 'admin', 'admin@123', 'teacher');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity`
--
ALTER TABLE `activity`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `student_activity_unique` (`student_id`,`activity_number`,`school_year_id`,`quarter`),
  ADD UNIQUE KEY `uniq_activity_student_act_sy_quarter` (`student_id`,`activity_number`,`school_year_id`,`quarter`),
  ADD KEY `idx_activity_sy_q` (`school_year_id`,`quarter`),
  ADD KEY `idx_activity_grade_section_syq` (`grade`,`section`,`school_year_id`,`quarter`,`activity_number`);

--
-- Indexes for table `assignment`
--
ALTER TABLE `assignment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `groups_tbl`
--
ALTER TABLE `groups_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `group_members`
--
ALTER TABLE `group_members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_group` (`group_id`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `student_project_unique` (`student_id`,`project_number`,`school_year_id`,`quarter`),
  ADD KEY `idx_project_sy_q` (`school_year_id`,`quarter`),
  ADD KEY `idx_project_grade_section_syq` (`grade`,`section`,`school_year_id`,`quarter`,`project_number`);

--
-- Indexes for table `quarterlyassessment`
--
ALTER TABLE `quarterlyassessment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quiz`
--
ALTER TABLE `quiz`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schoolyear`
--
ALTER TABLE `schoolyear`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seatwork`
--
ALTER TABLE `seatwork`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`student_id`);

--
-- Indexes for table `summarytest`
--
ALTER TABLE `summarytest`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `fk_users_students` (`student_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity`
--
ALTER TABLE `activity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assignment`
--
ALTER TABLE `assignment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `groups_tbl`
--
ALTER TABLE `groups_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `group_members`
--
ALTER TABLE `group_members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quarterlyassessment`
--
ALTER TABLE `quarterlyassessment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quiz`
--
ALTER TABLE `quiz`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `schoolyear`
--
ALTER TABLE `schoolyear`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seatwork`
--
ALTER TABLE `seatwork`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `summarytest`
--
ALTER TABLE `summarytest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `group_members`
--
ALTER TABLE `group_members`
  ADD CONSTRAINT `fk_group_members_group` FOREIGN KEY (`group_id`) REFERENCES `groups_tbl` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_students` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
