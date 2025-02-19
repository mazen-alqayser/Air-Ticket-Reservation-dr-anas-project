-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 19, 2025 at 05:55 PM
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
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `admin_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`admin_id`, `username`, `email`, `password`) VALUES
(1, 'awab', 'awabelzen@hotmail.com', '$2y$10$/6z.KxfBt80tyR2vLF6gru46d0yfREJ/LK9wbq8FJYEiIT6G1UGMa'),
(2, 'mjf', 'moo@gmail.com', '$2y$10$oZ7o2Qgw/WyRthb8meEVsePH9yvJwjcpRJxbngl8nxa6fPT/g2i.q'),
(3, 'مازن', 'mazk@jam.com', '$2y$10$FHxJYGQKdx8y/moWr4ZfzOFhoFWR.mYdtp9Dow8rjY/EOza2MtS3e');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `booking_id` int(11) NOT NULL,
  `passenger_id` int(11) NOT NULL,
  `flight_id` int(11) NOT NULL,
  `booking_date` datetime DEFAULT current_timestamp(),
  `status` enum('confirmed','cancelled') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`booking_id`, `passenger_id`, `flight_id`, `booking_date`, `status`) VALUES
(4, 3, 4, '2025-02-14 21:51:52', 'confirmed'),
(5, 3, 5, '2025-02-15 00:04:08', 'confirmed'),
(6, 5, 5, '2025-02-15 00:09:45', 'confirmed'),
(7, 3, 9, '2025-02-15 00:16:28', 'confirmed'),
(8, 3, 4, '2025-02-19 18:10:30', 'confirmed');

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

-- --------------------------------------------------------

--
-- Table structure for table `passengers`
--

CREATE TABLE `passengers` (
  `id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `passport` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `passengers`
--

INSERT INTO `passengers` (`id`, `first_name`, `last_name`, `email`, `phone`, `passport`, `password`) VALUES
(1, 'awab ', 'omer', 'gggg@llll', '249912353867', 'p022456555', '$2y$10$MOKBRriQipwugKaUnyVtT.v21LDnmD.yvyvhsGpXeZdyEZ/Q72V6i'),
(2, 'اواب ', 'الزين', 'awabelzen@hotmail.com', '0556655555555', 'p05001000', '$2y$10$GVBwAJPX0SUj9M3770FHb.S4nKdDCzBsOnHbZaluuFU6jAKmZmZDe'),
(3, 'MO', 'ONSA', 'ONSA@GMILE.COM', '093210054', 'P44452226', '$2y$10$HrWcZovgpOU/.s4GLDbWQ.AH0DiF705olZHtSqtxEwV053vC.9Hju'),
(4, 'dd', 'oo', 'oooo@lll.com', '22220', 'p222', '$2y$10$PQEczETHoVfVaX4Q30xBkugZ73MuKFHsDMJzEq1YKSS7qxiVtVFlG'),
(5, 'مازن', 'محمد', 'maz@jaml.com', '0222255', 'p999', '$2y$10$cR0cWNS.cfh9i7EsfPxa0usGSfoUcYv5xWPWxk0NrJwI2IODkm2tW');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `admin_id` (`admin_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `passenger_id` (`passenger_id`),
  ADD KEY `flight_id` (`flight_id`);

--
-- Indexes for table `flights`
--
ALTER TABLE `flights`
  ADD PRIMARY KEY (`flight_id`);

--
-- Indexes for table `passengers`
--
ALTER TABLE `passengers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `passport` (`passport`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `flights`
--
ALTER TABLE `flights`
  MODIFY `flight_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `passengers`
--
ALTER TABLE `passengers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`passenger_id`) REFERENCES `passengers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`flight_id`) REFERENCES `flights` (`flight_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
