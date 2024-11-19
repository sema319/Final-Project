-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 19, 2024 at 09:32 AM
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
-- Database: `sema12`
--

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `clientID` int(11) NOT NULL,
  `clientName` varchar(500) NOT NULL,
  `phoneNumber` varchar(500) NOT NULL,
  `email` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`clientID`, `clientName`, `phoneNumber`, `email`) VALUES
(1, 'Sema', '0503332211', 'ddddd@gamil.com'),
(2, 'adan', '0503332211', 'ddsssdd@gamil.com');

-- --------------------------------------------------------

--
-- Table structure for table `decorations`
--

CREATE TABLE `decorations` (
  `decorationsID` int(11) NOT NULL,
  `shopName` varchar(500) NOT NULL,
  `phoneNumber` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dj`
--

CREATE TABLE `dj` (
  `DjID` int(11) NOT NULL,
  `DJname` varchar(500) NOT NULL,
  `phoneNumber` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fruits`
--

CREATE TABLE `fruits` (
  `fruitsID` int(11) NOT NULL,
  `fruitsShop` varchar(500) NOT NULL,
  `phoneNumber` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `makeupartist`
--

CREATE TABLE `makeupartist` (
  `mukeupartistID` int(11) DEFAULT NULL,
  `artistName` varchar(500) NOT NULL,
  `phoneNumber` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `paymentstypes`
--

CREATE TABLE `paymentstypes` (
  `paymentID` int(11) NOT NULL,
  `paymentTypeName` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `paymentstypes`
--

INSERT INTO `paymentstypes` (`paymentID`, `paymentTypeName`) VALUES
(1, 'כרטיס אשראי'),
(2, 'ציקם');

-- --------------------------------------------------------

--
-- Table structure for table `sweets`
--

CREATE TABLE `sweets` (
  `sweetsID` int(11) NOT NULL,
  `sweetsShop` varchar(500) NOT NULL,
  `phoneNumbers` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userID` int(11) NOT NULL,
  `firstName` varchar(500) NOT NULL,
  `lastName` varchar(500) NOT NULL,
  `password` varchar(500) NOT NULL,
  `phoneNumber` int(11) NOT NULL,
  `createdDateTime` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userID`, `firstName`, `lastName`, `password`, `phoneNumber`, `createdDateTime`) VALUES
(1122334456, 'sema', 'Ftemi', '33221100', 0, '2024-11-02 07:23:53'),
(1122334457, 'adan', 'ftemi', '11223300', 0, '2024-11-02 07:23:53'),
(1122334458, 'Bob', '123', 'momo', 0, '2024-11-16 06:58:47'),
(1122334459, 'Bob', '123', 'momo', 0, '2024-11-16 06:59:34'),
(1122334460, 'Bob', '123', 'momo', 0, '2024-11-16 07:00:05'),
(1122334461, 'Bob', '123', 'momo', 0, '2024-11-16 07:00:07'),
(1122334462, 'Bob', '123', 'momo', 0, '2024-11-16 07:03:51'),
(1122334463, 'Bob', '123', 'momo', 0, '2024-11-16 07:05:04'),
(1122334464, 'Bob', '123', 'momo', 0, '2024-11-16 07:06:16'),
(1122334465, 'sadadsadsa', 'aadsada', 'aasaasadasdsdada', 0, '2024-11-16 07:06:46'),
(1122334466, 'sadadsadsa', 'aadsada', 'aasaasadasdsdada', 0, '2024-11-16 07:27:16'),
(1122334467, 'sema', 'ftemi', 'soso', 0, '2024-11-16 07:30:13');

-- --------------------------------------------------------

--
-- Table structure for table `weddinghalls`
--

CREATE TABLE `weddinghalls` (
  `weddingHallID` int(11) NOT NULL,
  `hallName` varchar(500) NOT NULL,
  `capacity` int(11) NOT NULL,
  `location` varchar(500) NOT NULL,
  `price` int(11) NOT NULL,
  `phoneNumber` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `weddinghalls`
--

INSERT INTO `weddinghalls` (`weddingHallID`, `hallName`, `capacity`, `location`, `price`, `phoneNumber`) VALUES
(1, 'lalune', 300, 'baqa', 4000, 0),
(2, 'alnor', 500, 'baqa', 4500, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`clientID`);

--
-- Indexes for table `decorations`
--
ALTER TABLE `decorations`
  ADD PRIMARY KEY (`decorationsID`);

--
-- Indexes for table `dj`
--
ALTER TABLE `dj`
  ADD PRIMARY KEY (`DjID`);

--
-- Indexes for table `fruits`
--
ALTER TABLE `fruits`
  ADD PRIMARY KEY (`fruitsID`);

--
-- Indexes for table `paymentstypes`
--
ALTER TABLE `paymentstypes`
  ADD PRIMARY KEY (`paymentID`);

--
-- Indexes for table `sweets`
--
ALTER TABLE `sweets`
  ADD PRIMARY KEY (`sweetsID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userID`);

--
-- Indexes for table `weddinghalls`
--
ALTER TABLE `weddinghalls`
  ADD PRIMARY KEY (`weddingHallID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `clientID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `decorations`
--
ALTER TABLE `decorations`
  MODIFY `decorationsID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dj`
--
ALTER TABLE `dj`
  MODIFY `DjID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fruits`
--
ALTER TABLE `fruits`
  MODIFY `fruitsID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `paymentstypes`
--
ALTER TABLE `paymentstypes`
  MODIFY `paymentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sweets`
--
ALTER TABLE `sweets`
  MODIFY `sweetsID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1122334468;

--
-- AUTO_INCREMENT for table `weddinghalls`
--
ALTER TABLE `weddinghalls`
  MODIFY `weddingHallID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
