-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 15, 2025 at 12:22 AM
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
-- Database: `airline_reservation`
--

-- --------------------------------------------------------

--
-- Table structure for table `flights`
--

CREATE TABLE `flights` (
  `flight_id` int(11) NOT NULL,
  `airline_name` varchar(100) NOT NULL,
  `origin` varchar(100) NOT NULL,
  `destination` varchar(100) NOT NULL,
  `departure_time` datetime NOT NULL,
  `arrival_time` datetime NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `status` enum('available','booked','cancelled') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `flights`
--

INSERT INTO `flights` (`flight_id`, `airline_name`, `origin`, `destination`, `departure_time`, `arrival_time`, `price`, `status`) VALUES
(3, 'السعوديه', 'الرياض', 'بورتسودان', '2025-02-14 12:43:00', '2025-02-14 14:46:00', 253.00, 'available'),
(4, 'الاثيوبيه', 'بورتسودان', 'اديس ابابا', '2025-02-25 13:51:00', '2025-02-25 17:47:00', 100.00, 'available'),
(5, 'الاثيوبيه', 'بورتسودان', 'اديس ابابا', '2025-02-25 13:51:00', '2025-02-25 17:47:00', 100.00, 'available'),
(6, 'lwo', 'ooo', 'lll', '2025-02-21 22:09:00', '2025-02-15 13:06:00', 29.00, 'available'),
(7, 'lwo', 'ooo', 'lll', '2025-02-21 22:09:00', '2025-02-15 13:06:00', 29.00, 'available'),
(8, 'ppp', 'dd', 'dd', '2025-02-08 22:11:00', '2025-02-15 22:14:00', -13.00, 'available'),
(9, 'سودانير', 'بورتسودان', 'القاهره', '2025-02-17 03:14:00', '2025-02-17 05:14:00', 100.00, 'available'),
(10, 'سودانير', 'بورتسودان', 'القاهره', '2025-02-15 06:00:00', '2025-02-28 06:00:00', 100.00, 'booked'),
(11, 'سودانير', 'بورتسودان', 'القاهره', '2025-02-15 06:00:00', '2025-02-28 06:00:00', 100.00, 'booked'),
(12, 'سودانير', 'بورتسودان', 'القاهره', '2025-02-14 01:10:00', '2025-02-22 01:10:00', 100.00, 'available');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `flights`
--
ALTER TABLE `flights`
  ADD PRIMARY KEY (`flight_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `flights`
--
ALTER TABLE `flights`
  MODIFY `flight_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
