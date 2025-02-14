-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 15, 2025 at 12:23 AM
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
-- AUTO_INCREMENT for table `passengers`
--
ALTER TABLE `passengers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
