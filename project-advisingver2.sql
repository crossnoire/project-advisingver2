-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 30, 2018 at 06:05 PM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project-advisingver2`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `account_id` int(255) NOT NULL,
  `account_usern` varchar(11) NOT NULL,
  `account_pass` varchar(255) NOT NULL,
  `acc_fname` varchar(255) NOT NULL,
  `acc_lname` varchar(255) NOT NULL,
  `acc_type_id` int(255) NOT NULL,
  `acc_status` tinyint(2) NOT NULL COMMENT '0 for inactive; 1 for active; 2 for deactivated; 3 for reset'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`account_id`, `account_usern`, `account_pass`, `acc_fname`, `acc_lname`, `acc_type_id`, `acc_status`) VALUES
(1, 'super', '8d0f1de01fe57bc432ec5b8cbca39ec6', 'Dominic', 'Guillermo', 2, 1),
(2, 'studadv', 'pass', 'Lea', 'Austero', 1, 1),
(3, 'adviser', 'pass', 'Aubrey', 'Segovia', 1, 1),
(4, 'deptchair', 'pass', 'Rodel', 'Naz', 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `acc_type`
--

CREATE TABLE `acc_type` (
  `acc_type_id` int(255) NOT NULL,
  `acc_type_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `acc_type`
--

INSERT INTO `acc_type` (`acc_type_id`, `acc_type_name`) VALUES
(1, 'Adviser'),
(2, 'super admin'),
(3, 'admin_approver'),
(4, 'schedule deputy'),
(5, 'Department Chair');

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `class_id` int(11) NOT NULL,
  `class_yr_blk` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`class_id`, `class_yr_blk`) VALUES
(1, 'BSCS 1A'),
(2, 'BSCS 1B'),
(3, 'BSCS 4A'),
(4, 'BSCS 4B'),
(5, 'BSIT 1A'),
(6, 'BSIT 1B');

-- --------------------------------------------------------

--
-- Table structure for table `college`
--

CREATE TABLE `college` (
  `college_id` int(255) NOT NULL,
  `college_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `college`
--

INSERT INTO `college` (`college_id`, `college_name`) VALUES
(1, 'BUCS - Bicol University College of Science');

-- --------------------------------------------------------

--
-- Table structure for table `curriculum`
--

CREATE TABLE `curriculum` (
  `curriculum_id` int(255) NOT NULL,
  `curriculum_name` varchar(255) NOT NULL,
  `college_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `curriculum`
--

INSERT INTO `curriculum` (`curriculum_id`, `curriculum_name`, `college_id`) VALUES
(1, 'BSCS - Bachelor of Science in Computer Science', 1),
(2, 'BSIT - Bachelor of Science in Information Technology', 1),
(3, 'BSBIO - Bachelor of Science in Biology', 1),
(4, 'BSCHEM - Bachelor of Science in Chemistry', 1),
(5, 'BSMETEO - Bachelor of Science in Meteorology', 1);

-- --------------------------------------------------------

--
-- Table structure for table `professor`
--

CREATE TABLE `professor` (
  `prof_id` int(11) NOT NULL,
  `prof_fname` varchar(50) NOT NULL,
  `prof_mname` varchar(2) DEFAULT NULL,
  `prof_lname` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `professor`
--

INSERT INTO `professor` (`prof_id`, `prof_fname`, `prof_mname`, `prof_lname`) VALUES
(1, 'Laarni', NULL, 'Pancho'),
(2, 'Christian', 'Y.', 'Sy'),
(3, 'Lea', 'P.', 'Austero'),
(4, 'Benedicto', 'B.', 'Balilo'),
(5, 'Rodel', 'N.', 'Naz'),
(6, 'Mary Joy', 'P.', 'Canon'),
(7, 'Noli', 'B.', 'Lucila Jr.'),
(8, 'Rolando', NULL, 'Mendones'),
(9, 'Franklin', NULL, 'Miranda'),
(10, 'Arlene', NULL, 'Satuito');

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `room_id` int(11) NOT NULL,
  `room_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`room_id`, `room_name`) VALUES
(1, 'B2-101'),
(2, 'B2-105'),
(3, 'B2-201'),
(4, 'B2-205'),
(5, 'B2-206');

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `sched_no` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `prof_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `day` varchar(20) NOT NULL,
  `start_time` time(6) NOT NULL,
  `end_time` time(6) NOT NULL,
  `status` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `student_id` varchar(13) NOT NULL,
  `student_fname` varchar(256) NOT NULL,
  `student_lname` varchar(256) NOT NULL,
  `student_yrlvl` int(255) NOT NULL,
  `student_pict` varchar(255) NOT NULL,
  `college_id` int(255) NOT NULL,
  `curriculum_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`student_id`, `student_fname`, `student_lname`, `student_yrlvl`, `student_pict`, `college_id`, `curriculum_id`) VALUES
('2015-11926', 'Dominic', 'Guillermo', 1, '', 1, 1),
('2015-6969', 'Loyd Jessie', 'Perez', 1, '', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `student_schlyr`
--

CREATE TABLE `student_schlyr` (
  `student_schlyr_id` int(255) NOT NULL,
  `student_schlyr` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_schlyr`
--

INSERT INTO `student_schlyr` (`student_schlyr_id`, `student_schlyr`) VALUES
(1, '2018-2019'),
(2, '2019-2020');

-- --------------------------------------------------------

--
-- Table structure for table `student_subject`
--

CREATE TABLE `student_subject` (
  `student_id` varchar(10) NOT NULL,
  `subject_id` int(9) NOT NULL,
  `subject_grade` float DEFAULT NULL,
  `student_schlyr_id` int(255) NOT NULL,
  `curriculum_id` int(255) NOT NULL,
  `semester` int(255) NOT NULL,
  `year_level` int(255) NOT NULL,
  `adviser_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_subject`
--

INSERT INTO `student_subject` (`student_id`, `subject_id`, `subject_grade`, `student_schlyr_id`, `curriculum_id`, `semester`, `year_level`, `adviser_id`) VALUES
('2015-11926', 15, NULL, 1, 1, 1, 1, 0),
('2015-11926', 16, NULL, 1, 1, 1, 1, 0),
('2015-11926', 17, NULL, 1, 1, 1, 1, 0),
('2015-11926', 18, NULL, 1, 1, 1, 1, 0),
('2015-11926', 19, NULL, 1, 1, 1, 1, 0),
('2015-11926', 20, NULL, 1, 1, 1, 1, 0),
('2015-11926', 21, NULL, 1, 1, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `subject_id` int(255) NOT NULL,
  `subject_name` varchar(255) NOT NULL,
  `subject_description` varchar(255) NOT NULL,
  `lecture_unit` int(255) DEFAULT NULL,
  `lab_unit` int(5) DEFAULT NULL,
  `credit_unit` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`subject_id`, `subject_name`, `subject_description`, `lecture_unit`, `lab_unit`, `credit_unit`) VALUES
(15, 'CS 1', 'ICT Fundamentals', 2, 1, 3),
(16, 'CS 11', 'Intro to Computer Science', 2, 1, 3),
(17, 'Math 1B', 'College Algebra &Trigonometry', 5, 0, 5),
(18, 'Eng. 1', 'Study and Thinking Skills', 3, 0, 3),
(19, 'Fil. 1', 'Komunikasyon sa Akademikong Filipino', 3, 0, 3),
(20, 'PE 1', 'Physical Fitness and Gymnastics', 2, 0, 2),
(21, 'NSTP 1', 'National Service Training Program', 3, 0, 3),
(22, 'CS 12', 'Computer Programming 1', 2, 1, 3),
(23, 'CS 13', 'Discrete Structures', 3, 0, 3),
(24, 'Physics 1', 'College Physics 1', 3, 1, 4),
(25, 'Math  21', 'Calculus with Analytic Geom', 3, 0, 3),
(26, 'Eng. 2', 'Writing in the Discipline (Communications for ICT)', 3, 0, 3),
(27, 'Nat.Sci', 'Biological Science', 3, 0, 3),
(28, 'PE 2', 'Fundamentals of Rhythm and Dances', 2, 0, 2),
(29, 'NSTP 2', 'National Service Training Program', 3, 0, 3);

-- --------------------------------------------------------

--
-- Table structure for table `subject_curriculum`
--

CREATE TABLE `subject_curriculum` (
  `subject_id` int(255) NOT NULL,
  `curriculum_id` int(11) NOT NULL,
  `subject_yrlvl` int(255) NOT NULL,
  `subject_semester` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subject_curriculum`
--

INSERT INTO `subject_curriculum` (`subject_id`, `curriculum_id`, `subject_yrlvl`, `subject_semester`) VALUES
(15, 1, 1, 1),
(16, 1, 1, 1),
(17, 1, 1, 1),
(18, 1, 1, 1),
(19, 1, 1, 1),
(20, 1, 1, 1),
(21, 1, 1, 1),
(22, 1, 1, 2),
(23, 1, 1, 2),
(24, 1, 1, 2),
(25, 1, 1, 2),
(26, 1, 1, 2),
(27, 1, 1, 2),
(28, 1, 1, 2),
(29, 1, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `subject_preq`
--

CREATE TABLE `subject_preq` (
  `preq_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `subject_id_preq` int(11) NOT NULL,
  `curriculum_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subject_preq`
--

INSERT INTO `subject_preq` (`preq_id`, `subject_id`, `subject_id_preq`, `curriculum_id`) VALUES
(1, 22, 16, 1),
(2, 23, 17, 1),
(3, 24, 17, 1),
(4, 25, 17, 1),
(5, 26, 18, 1),
(6, 28, 20, 1),
(7, 29, 21, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`account_id`),
  ADD KEY `account_type` (`acc_type_id`);

--
-- Indexes for table `acc_type`
--
ALTER TABLE `acc_type`
  ADD PRIMARY KEY (`acc_type_id`);

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`class_id`);

--
-- Indexes for table `college`
--
ALTER TABLE `college`
  ADD PRIMARY KEY (`college_id`);

--
-- Indexes for table `curriculum`
--
ALTER TABLE `curriculum`
  ADD PRIMARY KEY (`curriculum_id`);

--
-- Indexes for table `professor`
--
ALTER TABLE `professor`
  ADD PRIMARY KEY (`prof_id`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`room_id`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`sched_no`),
  ADD KEY `sched_course` (`subject_id`),
  ADD KEY `sched_prof` (`prof_id`),
  ADD KEY `sched_room` (`room_id`),
  ADD KEY `sched_class` (`class_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`student_id`);

--
-- Indexes for table `student_schlyr`
--
ALTER TABLE `student_schlyr`
  ADD PRIMARY KEY (`student_schlyr_id`);

--
-- Indexes for table `student_subject`
--
ALTER TABLE `student_subject`
  ADD UNIQUE KEY `stud_id_2` (`student_id`,`subject_id`),
  ADD KEY `stud_id` (`student_id`,`subject_id`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`subject_id`);

--
-- Indexes for table `subject_curriculum`
--
ALTER TABLE `subject_curriculum`
  ADD UNIQUE KEY `subject_id` (`subject_id`);

--
-- Indexes for table `subject_preq`
--
ALTER TABLE `subject_preq`
  ADD UNIQUE KEY `preq_id` (`preq_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `account_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `acc_type`
--
ALTER TABLE `acc_type`
  MODIFY `acc_type_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `class`
--
ALTER TABLE `class`
  MODIFY `class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `college`
--
ALTER TABLE `college`
  MODIFY `college_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `curriculum`
--
ALTER TABLE `curriculum`
  MODIFY `curriculum_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `professor`
--
ALTER TABLE `professor`
  MODIFY `prof_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `room_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `sched_no` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `student_schlyr`
--
ALTER TABLE `student_schlyr`
  MODIFY `student_schlyr_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `subject`
--
ALTER TABLE `subject`
  MODIFY `subject_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `subject_preq`
--
ALTER TABLE `subject_preq`
  MODIFY `preq_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `account`
--
ALTER TABLE `account`
  ADD CONSTRAINT `account_type` FOREIGN KEY (`acc_type_id`) REFERENCES `acc_type` (`acc_type_id`);

--
-- Constraints for table `schedule`
--
ALTER TABLE `schedule`
  ADD CONSTRAINT `sched_class` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sched_prof` FOREIGN KEY (`prof_id`) REFERENCES `professor` (`prof_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sched_room` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
