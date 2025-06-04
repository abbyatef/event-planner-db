-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 28, 2024 at 12:27 AM
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
-- Database: `my_event_planner`
--

-- --------------------------------------------------------

--
-- Table structure for table `attend`
--

CREATE TABLE `attend` (
  `event_name` varchar(50) NOT NULL,
  `reg_no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attend`
--

INSERT INTO `attend` (`event_name`, `reg_no`) VALUES
('Art Fair', 102),
('Tech Expo', 101);

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `event_name` varchar(50) NOT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `id_no` int(11) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`event_name`, `date`, `time`, `description`, `id_no`, `address`) VALUES
('Art Fair', '2024-02-20', '15:00:00', 'An exhibition of modern art', 2, 'LOC002'),
('Tech Expo', '2024-01-15', '10:00:00', 'A showcase of new tech innovations', 1, 'LOC001');

-- --------------------------------------------------------

--
-- Table structure for table `interact`
--

CREATE TABLE `interact` (
  `id_no` int(11) NOT NULL,
  `reg_no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `interact`
--

INSERT INTO `interact` (`id_no`, `reg_no`) VALUES
(1, 101),
(2, 102);

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `address` varchar(50) NOT NULL,
  `location_name` varchar(50) DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`address`, `location_name`, `capacity`) VALUES
('LOC001', 'Tech Hall', 500),
('LOC002', 'Art Gallery', 300);

-- --------------------------------------------------------

--
-- Table structure for table `organizer`
--

CREATE TABLE `organizer` (
  `id_no` int(11) NOT NULL,
  `org_name` varchar(50) DEFAULT NULL,
  `org_contact_info` varchar(50) DEFAULT NULL,
  `details` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `organizer`
--

INSERT INTO `organizer` (`id_no`, `org_name`, `org_contact_info`, `details`) VALUES
(1, 'Tech Society', '1234567890', 'Handles tech-related events'),
(2, 'Art Guild', '0987654321', 'Organizes art exhibitions');

-- --------------------------------------------------------

--
-- Table structure for table `participant`
--

CREATE TABLE `participant` (
  `reg_no` int(11) NOT NULL,
  `participant_contact_info` varchar(50) DEFAULT NULL,
  `participant_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `participant`
--

INSERT INTO `participant` (`reg_no`, `participant_contact_info`, `participant_name`) VALUES
(101, '1111111111', 'Alice Johnson'),
(102, '2222222222', 'Bob Smith');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attend`
--
ALTER TABLE `attend`
  ADD PRIMARY KEY (`event_name`,`reg_no`),
  ADD KEY `fk_attend_reg_no` (`reg_no`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`event_name`),
  ADD KEY `fk_event_id_no` (`id_no`),
  ADD KEY `fk_event_address` (`address`);

--
-- Indexes for table `interact`
--
ALTER TABLE `interact`
  ADD PRIMARY KEY (`id_no`,`reg_no`),
  ADD KEY `fk_interact_reg_no` (`reg_no`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`address`);

--
-- Indexes for table `organizer`
--
ALTER TABLE `organizer`
  ADD PRIMARY KEY (`id_no`);

--
-- Indexes for table `participant`
--
ALTER TABLE `participant`
  ADD PRIMARY KEY (`reg_no`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attend`
--
ALTER TABLE `attend`
  ADD CONSTRAINT `fk_attend_event_name` FOREIGN KEY (`event_name`) REFERENCES `event` (`event_name`),
  ADD CONSTRAINT `fk_attend_reg_no` FOREIGN KEY (`reg_no`) REFERENCES `participant` (`reg_no`);

--
-- Constraints for table `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `fk_event_address` FOREIGN KEY (`address`) REFERENCES `location` (`address`),
  ADD CONSTRAINT `fk_event_id_no` FOREIGN KEY (`id_no`) REFERENCES `organizer` (`id_no`);

--
-- Constraints for table `interact`
--
ALTER TABLE `interact`
  ADD CONSTRAINT `fk_interact_id_no` FOREIGN KEY (`id_no`) REFERENCES `organizer` (`id_no`),
  ADD CONSTRAINT `fk_interact_reg_no` FOREIGN KEY (`reg_no`) REFERENCES `participant` (`reg_no`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
