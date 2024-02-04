-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 04, 2024 at 06:01 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ipt_students_management_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `dep`
--

CREATE TABLE `dep` (
  `dep_id` int(11) NOT NULL,
  `dep_name` varchar(50) DEFAULT NULL,
  `ipt_coordinator` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dep`
--

INSERT INTO `dep` (`dep_id`, `dep_name`, `ipt_coordinator`) VALUES
(1, 'computer science', '1'),
(2, 'bussines_administration', '2'),
(3, 'engineering', '3');

-- --------------------------------------------------------

--
-- Table structure for table `departmentstaff`
--

CREATE TABLE `departmentstaff` (
  `department_staff_id` int(11) NOT NULL,
  `dep_id` int(11) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `departmentstaff`
--

INSERT INTO `departmentstaff` (`department_staff_id`, `dep_id`, `staff_id`) VALUES
(1, 1, 1),
(2, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `external_assessment1`
--

CREATE TABLE `external_assessment1` (
  `external_assessment_id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `external_supervisor_id` int(11) DEFAULT NULL,
  `assessment_result` varchar(50) DEFAULT NULL,
  `comment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `external_assessment1`
--

INSERT INTO `external_assessment1` (`external_assessment_id`, `student_id`, `external_supervisor_id`, `assessment_result`, `comment`) VALUES
(1, 1, 1, 'PASS', 'GOOD'),
(2, 2, 2, 'EXCELLENT', 'GOOD'),
(3, 3, 3, 'EXCELLENT', 'VERY GOOD');

-- --------------------------------------------------------

--
-- Table structure for table `external_supervisor`
--

CREATE TABLE `external_supervisor` (
  `external_supervisor_id` int(11) NOT NULL,
  `external_supervisor_fname` varchar(50) DEFAULT NULL,
  `external_supervisor_lname` varchar(50) DEFAULT NULL,
  `organization_name` varchar(50) DEFAULT NULL,
  `region` varchar(50) DEFAULT NULL,
  `district` varchar(50) DEFAULT NULL,
  `street` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `external_supervisor`
--

INSERT INTO `external_supervisor` (`external_supervisor_id`, `external_supervisor_fname`, `external_supervisor_lname`, `organization_name`, `region`, `district`, `street`, `title`) VALUES
(1, 'frank', 'urassa', 'TANESCO', 'DAR', 'DAR', 'UBUNGO', 'IT'),
(2, 'JACOB', 'YUSSUPH', 'TANESCO', 'DAR', 'DAR', 'UBUNGO', 'IT'),
(3, 'JACOB', 'YUSSUPH', 'TANESCO', 'DAR', 'DAR', 'UBUNGO', 'IT');

-- --------------------------------------------------------

--
-- Table structure for table `internal_assessment`
--

CREATE TABLE `internal_assessment` (
  `internal_assessment_id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `internal_supervisor_id` int(11) DEFAULT NULL,
  `assessment_date` date DEFAULT NULL,
  `assessment_result` varchar(20) DEFAULT NULL,
  `comment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `internal_assessment`
--

INSERT INTO `internal_assessment` (`internal_assessment_id`, `student_id`, `internal_supervisor_id`, `assessment_date`, `assessment_result`, `comment`) VALUES
(1, 2, 1, '2022-12-23', 'PASS', 'GOOD'),
(2, 1, 1, '2022-02-23', 'PASS', 'GOOD'),
(3, 1, 2, '2022-02-23', 'FAIL', 'WORSE ATTENDENCE');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staff_id` int(11) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `mobile_no` varchar(50) DEFAULT NULL,
  `dep_id` int(11) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staff_id`, `first_name`, `last_name`, `email`, `mobile_no`, `dep_id`, `password`) VALUES
(1, 'juma', 'david', 'james@123', '7786767671', 1, '07f5937c9760f50867a78fa68982b1096cec0798448abf9395'),
(2, 'juma', 'david', 'erick@123', '7786767691', 2, '14d3f05bcced45b09675b22d9047df0fef5c9e889b23ee033f');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `student_id` int(11) NOT NULL,
  `student_fname` varchar(50) DEFAULT NULL,
  `student_lname` varchar(50) DEFAULT NULL,
  `reg_no` varchar(50) DEFAULT NULL,
  `class` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone_no` varchar(100) DEFAULT NULL,
  `internal_assessment_id` int(11) DEFAULT NULL,
  `external_assessment_id` int(11) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`student_id`, `student_fname`, `student_lname`, `reg_no`, `class`, `email`, `phone_no`, `internal_assessment_id`, `external_assessment_id`, `password`) VALUES
(1, 'james', 'erick', '220998787777777', 'computer', 'james@gmail.com', '077889888887', 1, 1, '1a1cf797fabe7f95836fabeca626907c77b3e6c9aff7c2290b'),
(2, 'james', 'erick', '220998787777777', 'computer', 'james@gmail.com', '077889888887', 2, 2, 'cbd3cfb9b9f51bbbfbf08759e243f5b3519cbf6ecc219ee95f'),
(3, 'DAVID', 'AME', '213234244443433', 'COMPUTER', 'DAVIDAME@GMAIL.COM', '0678567688', 3, 3, '25a06b58cbfb2244f2d687bd8e860c8010329635700c8650cb');

-- --------------------------------------------------------

--
-- Table structure for table `student_assessment`
--

CREATE TABLE `student_assessment` (
  `student_assessment_id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `internal_assessment_id` int(11) DEFAULT NULL,
  `external_assessment_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student_assessment`
--

INSERT INTO `student_assessment` (`student_assessment_id`, `student_id`, `internal_assessment_id`, `external_assessment_id`) VALUES
(1, 1, 3, NULL),
(2, 2, 3, NULL),
(3, 3, 1, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dep`
--
ALTER TABLE `dep`
  ADD PRIMARY KEY (`dep_id`);

--
-- Indexes for table `departmentstaff`
--
ALTER TABLE `departmentstaff`
  ADD PRIMARY KEY (`department_staff_id`),
  ADD KEY `dep_id` (`dep_id`),
  ADD KEY `staff_id` (`staff_id`);

--
-- Indexes for table `external_assessment1`
--
ALTER TABLE `external_assessment1`
  ADD PRIMARY KEY (`external_assessment_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `external_supervisor_id` (`external_supervisor_id`);

--
-- Indexes for table `external_supervisor`
--
ALTER TABLE `external_supervisor`
  ADD PRIMARY KEY (`external_supervisor_id`);

--
-- Indexes for table `internal_assessment`
--
ALTER TABLE `internal_assessment`
  ADD PRIMARY KEY (`internal_assessment_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `internal_supervisor_id` (`internal_supervisor_id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staff_id`),
  ADD KEY `dep_id` (`dep_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`student_id`);

--
-- Indexes for table `student_assessment`
--
ALTER TABLE `student_assessment`
  ADD PRIMARY KEY (`student_assessment_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `internal_assessment_id` (`internal_assessment_id`),
  ADD KEY `external_assessment_id` (`external_assessment_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dep`
--
ALTER TABLE `dep`
  MODIFY `dep_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `departmentstaff`
--
ALTER TABLE `departmentstaff`
  MODIFY `department_staff_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `external_assessment1`
--
ALTER TABLE `external_assessment1`
  MODIFY `external_assessment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `external_supervisor`
--
ALTER TABLE `external_supervisor`
  MODIFY `external_supervisor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `internal_assessment`
--
ALTER TABLE `internal_assessment`
  MODIFY `internal_assessment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `staff_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `student_assessment`
--
ALTER TABLE `student_assessment`
  MODIFY `student_assessment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `departmentstaff`
--
ALTER TABLE `departmentstaff`
  ADD CONSTRAINT `departmentstaff_ibfk_1` FOREIGN KEY (`dep_id`) REFERENCES `dep` (`dep_id`),
  ADD CONSTRAINT `departmentstaff_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`);

--
-- Constraints for table `external_assessment1`
--
ALTER TABLE `external_assessment1`
  ADD CONSTRAINT `external_assessment1_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`),
  ADD CONSTRAINT `external_assessment1_ibfk_2` FOREIGN KEY (`external_supervisor_id`) REFERENCES `external_supervisor` (`external_supervisor_id`);

--
-- Constraints for table `internal_assessment`
--
ALTER TABLE `internal_assessment`
  ADD CONSTRAINT `internal_assessment_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`),
  ADD CONSTRAINT `internal_assessment_ibfk_2` FOREIGN KEY (`internal_supervisor_id`) REFERENCES `staff` (`staff_id`);

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`dep_id`) REFERENCES `dep` (`dep_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
