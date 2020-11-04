-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 04, 2020 at 01:34 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bus_station`
--
CREATE DATABASE IF NOT EXISTS `bus_station` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `bus_station`;

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `address_id` int(11) NOT NULL,
  `street` varchar(60) DEFAULT NULL,
  `street_no` int(11) DEFAULT NULL,
  `city` varchar(55) DEFAULT NULL,
  `zipcode` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`address_id`, `street`, `street_no`, `city`, `zipcode`) VALUES
(1, 'street1', 12, 'vienna', 1230),
(2, 'street2', 11, 'Linz', 1000),
(3, 'street3', 10, 'Graz', 2000),
(4, 'street4', 55, 'Vienna', 1010),
(5, 'street5', 66, 'Linz', 1001);

-- --------------------------------------------------------

--
-- Table structure for table `bus`
--

CREATE TABLE `bus` (
  `bus_id` int(11) NOT NULL,
  `lisenc` varchar(50) DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  `model` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bus`
--

INSERT INTO `bus` (`bus_id`, `lisenc`, `capacity`, `model`) VALUES
(1, 'BA1200', 50, 'single-deck'),
(2, 'BB1201', 50, 'single-deck'),
(3, 'BC1202', 100, 'double-decker'),
(4, 'BD1203', 50, 'single-deck'),
(5, 'BE1204', 100, 'double-decker');

-- --------------------------------------------------------

--
-- Table structure for table `driver`
--

CREATE TABLE `driver` (
  `driver_id` int(11) NOT NULL,
  `driver_fname` varchar(55) DEFAULT NULL,
  `driver_lname` varchar(55) DEFAULT NULL,
  `driver_birthday` date DEFAULT NULL,
  `driver_gender` char(1) DEFAULT NULL,
  `fk_address_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `driver`
--

INSERT INTO `driver` (`driver_id`, `driver_fname`, `driver_lname`, `driver_birthday`, `driver_gender`, `fk_address_id`) VALUES
(1, 'Tom', 'Smith', '1979-01-02', 'm', 1),
(2, 'Tim', 'Willson', '1977-01-02', 'm', 3),
(3, 'Ann', 'Brown', '1982-06-04', 'f', 5),
(4, 'Ema', 'Smith', '1980-06-04', 'f', 4),
(5, 'John', 'Brown', '1979-06-04', 'm', 2),
(6, 'Karla', 'Miles', '1990-06-04', 'f', 1);

-- --------------------------------------------------------

--
-- Table structure for table `period`
--

CREATE TABLE `period` (
  `period_id` int(11) NOT NULL,
  `period_date` date DEFAULT NULL,
  `duration` time DEFAULT NULL,
  `fk_bus_id` int(11) DEFAULT NULL,
  `fk_driver_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `period`
--

INSERT INTO `period` (`period_id`, `period_date`, `duration`, `fk_bus_id`, `fk_driver_id`) VALUES
(1, '2020-11-03', '00:00:01', 1, 4),
(2, '2020-11-03', '00:00:01', 2, 4),
(3, '2020-11-05', '01:30:00', 3, 3),
(4, '2020-11-06', '00:00:02', 4, 2),
(5, '2020-11-07', '01:15:00', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `route`
--

CREATE TABLE `route` (
  `route_id` int(11) NOT NULL,
  `destination` varchar(55) DEFAULT NULL,
  `start_destination` varchar(55) DEFAULT NULL,
  `fk_bus_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `route`
--

INSERT INTO `route` (`route_id`, `destination`, `start_destination`, `fk_bus_id`) VALUES
(1, 'graz', 'vienna', 3),
(2, 'linz', 'vienna', 5),
(3, 'vienna', 'linz', 2),
(4, 'linz', 'graz', 3);

-- --------------------------------------------------------

--
-- Table structure for table `station`
--

CREATE TABLE `station` (
  `station_id` int(11) NOT NULL,
  `station_name` varchar(60) DEFAULT NULL,
  `telephon_no` int(11) DEFAULT NULL,
  `fk_address_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `station`
--

INSERT INTO `station` (`station_id`, `station_name`, `telephon_no`, `fk_address_id`) VALUES
(1, 'Station1', 12345, 2),
(2, 'Station2', 222222, 3),
(3, 'Station3', 3333333, 5),
(4, 'Station4', 444444, 4);

-- --------------------------------------------------------

--
-- Table structure for table `stops`
--

CREATE TABLE `stops` (
  `stops_id` int(11) NOT NULL,
  `stop_no` int(11) DEFAULT NULL,
  `fk_station_id` int(11) DEFAULT NULL,
  `fk_route_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stops`
--

INSERT INTO `stops` (`stops_id`, `stop_no`, `fk_station_id`, `fk_route_id`) VALUES
(1, 1, 1, 4),
(2, 2, 3, 3),
(3, 3, 2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `trip`
--

CREATE TABLE `trip` (
  `trip_id` int(11) NOT NULL,
  `trip_date` date DEFAULT NULL,
  `trip_time` time DEFAULT NULL,
  `fk_bus_id` int(11) DEFAULT NULL,
  `fk_route_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `trip`
--

INSERT INTO `trip` (`trip_id`, `trip_date`, `trip_time`, `fk_bus_id`, `fk_route_id`) VALUES
(1, '2020-11-01', '00:00:07', 1, 1),
(2, '2020-11-01', '07:05:00', 1, 1),
(3, '2020-11-05', '08:00:00', 2, 2),
(4, '2020-11-05', '08:00:00', 2, 2),
(5, '2020-11-06', '09:25:00', 3, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`address_id`);

--
-- Indexes for table `bus`
--
ALTER TABLE `bus`
  ADD PRIMARY KEY (`bus_id`);

--
-- Indexes for table `driver`
--
ALTER TABLE `driver`
  ADD PRIMARY KEY (`driver_id`),
  ADD KEY `fk_address_id` (`fk_address_id`);

--
-- Indexes for table `period`
--
ALTER TABLE `period`
  ADD PRIMARY KEY (`period_id`),
  ADD KEY `fk_bus_id` (`fk_bus_id`),
  ADD KEY `fk_driver_id` (`fk_driver_id`);

--
-- Indexes for table `route`
--
ALTER TABLE `route`
  ADD PRIMARY KEY (`route_id`),
  ADD KEY `fk_bus_id` (`fk_bus_id`);

--
-- Indexes for table `station`
--
ALTER TABLE `station`
  ADD PRIMARY KEY (`station_id`),
  ADD KEY `fk_address_id` (`fk_address_id`);

--
-- Indexes for table `stops`
--
ALTER TABLE `stops`
  ADD PRIMARY KEY (`stops_id`),
  ADD KEY `fk_station_id` (`fk_station_id`),
  ADD KEY `fk_route_id` (`fk_route_id`);

--
-- Indexes for table `trip`
--
ALTER TABLE `trip`
  ADD PRIMARY KEY (`trip_id`),
  ADD KEY `fk_bus_id` (`fk_bus_id`),
  ADD KEY `fk_route_id` (`fk_route_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `bus`
--
ALTER TABLE `bus`
  MODIFY `bus_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `driver`
--
ALTER TABLE `driver`
  MODIFY `driver_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `period`
--
ALTER TABLE `period`
  MODIFY `period_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `route`
--
ALTER TABLE `route`
  MODIFY `route_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `station`
--
ALTER TABLE `station`
  MODIFY `station_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `stops`
--
ALTER TABLE `stops`
  MODIFY `stops_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `trip`
--
ALTER TABLE `trip`
  MODIFY `trip_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `driver`
--
ALTER TABLE `driver`
  ADD CONSTRAINT `driver_ibfk_1` FOREIGN KEY (`fk_address_id`) REFERENCES `address` (`address_id`);

--
-- Constraints for table `period`
--
ALTER TABLE `period`
  ADD CONSTRAINT `period_ibfk_1` FOREIGN KEY (`fk_bus_id`) REFERENCES `bus` (`bus_id`),
  ADD CONSTRAINT `period_ibfk_2` FOREIGN KEY (`fk_driver_id`) REFERENCES `driver` (`driver_id`);

--
-- Constraints for table `route`
--
ALTER TABLE `route`
  ADD CONSTRAINT `route_ibfk_1` FOREIGN KEY (`fk_bus_id`) REFERENCES `bus` (`bus_id`);

--
-- Constraints for table `station`
--
ALTER TABLE `station`
  ADD CONSTRAINT `station_ibfk_1` FOREIGN KEY (`fk_address_id`) REFERENCES `address` (`address_id`);

--
-- Constraints for table `stops`
--
ALTER TABLE `stops`
  ADD CONSTRAINT `stops_ibfk_1` FOREIGN KEY (`fk_route_id`) REFERENCES `route` (`route_id`),
  ADD CONSTRAINT `stops_ibfk_2` FOREIGN KEY (`fk_station_id`) REFERENCES `station` (`station_id`),
  ADD CONSTRAINT `stops_ibfk_3` FOREIGN KEY (`fk_route_id`) REFERENCES `route` (`route_id`);

--
-- Constraints for table `trip`
--
ALTER TABLE `trip`
  ADD CONSTRAINT `trip_ibfk_1` FOREIGN KEY (`fk_bus_id`) REFERENCES `bus` (`bus_id`),
  ADD CONSTRAINT `trip_ibfk_2` FOREIGN KEY (`fk_route_id`) REFERENCES `route` (`route_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
