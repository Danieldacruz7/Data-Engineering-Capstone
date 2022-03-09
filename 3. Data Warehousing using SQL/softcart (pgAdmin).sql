-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: mysql:3306
-- Generation Time: Mar 06, 2022 at 03:06 AM
-- Server version: 8.0.22
-- PHP Version: 7.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `softcart`
--

-- --------------------------------------------------------

--
-- Table structure for table `softcartDimCategory`
--

CREATE TABLE `softcartDimCategory` (
  `categoryid` int NOT NULL,
  `category` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `softcartDimCountry`
--

CREATE TABLE `softcartDimCountry` (
  `countryid` int NOT NULL,
  `country` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `softcartDimDate`
--

CREATE TABLE `softcartDimDate` (
  `dateid` int NOT NULL,
  `date` timestamp NOT NULL,
  `Year` varchar(20) NOT NULL,
  `Quarter` int NOT NULL,
  `QuarterName` varchar(20) NOT NULL,
  `Month` int NOT NULL,
  `MonthName` varchar(20) NOT NULL,
  `Day` int NOT NULL,
  `Weekday` int NOT NULL,
  `WeekdayName` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `softcartFactSales`
--

CREATE TABLE `softcartFactSales` (
  `orderid` int NOT NULL,
  `dateid` int NOT NULL,
  `countryid` int NOT NULL,
  `categoryid` int NOT NULL,
  `amount` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `softcartDimCategory`
--
ALTER TABLE `softcartDimCategory`
  ADD PRIMARY KEY (`categoryid`);

--
-- Indexes for table `softcartDimCountry`
--
ALTER TABLE `softcartDimCountry`
  ADD PRIMARY KEY (`countryid`);

--
-- Indexes for table `softcartDimDate`
--
ALTER TABLE `softcartDimDate`
  ADD PRIMARY KEY (`dateid`);

--
-- Indexes for table `softcartFactSales`
--
ALTER TABLE `softcartFactSales`
  ADD PRIMARY KEY (`orderid`),
  ADD KEY `dateid` (`dateid`),
  ADD KEY `countryid` (`countryid`),
  ADD KEY `categoryid` (`categoryid`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `softcartFactSales`
--
ALTER TABLE `softcartFactSales`
  ADD CONSTRAINT `softcartFactSales_ibfk_1` FOREIGN KEY (`dateid`) REFERENCES `softcartDimDate` (`dateid`),
  ADD CONSTRAINT `softcartFactSales_ibfk_2` FOREIGN KEY (`countryid`) REFERENCES `softcartDimCountry` (`countryid`),
  ADD CONSTRAINT `softcartFactSales_ibfk_3` FOREIGN KEY (`categoryid`) REFERENCES `softcartDimCategory` (`categoryid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
