-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 05, 2023 at 08:02 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbms`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `nfc` ()   BEGIN	
	SELECT * FROM `criminal`;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `nfcc` ()   BEGIN	
	SELECT * FROM `fir`;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `nfp` ()   BEGIN
	SELECT * FROM `policeofficer`;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `nfs` ()   BEGIN	
	SELECT * FROM `station`;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `A_EMAIL` varchar(20) NOT NULL,
  `A_PSWD` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`A_EMAIL`, `A_PSWD`) VALUES
('bunny@gmail.com', 'bunny123');

-- --------------------------------------------------------

--
-- Table structure for table `charges`
--

CREATE TABLE `charges` (
  `CID` int(10) NOT NULL,
  `CRIME_IDS` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `charges`
--

INSERT INTO `charges` (`CID`, `CRIME_IDS`) VALUES
(501, '105'),
(502, '105');

-- --------------------------------------------------------

--
-- Table structure for table `crime`
--

CREATE TABLE `crime` (
  `CRIME_ID` varchar(255) NOT NULL,
  `CRIME_NAME` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `crime`
--

INSERT INTO `crime` (`CRIME_ID`, `CRIME_NAME`) VALUES
('101', 'PUNISHMENT FOR CRIMINAL CONSPIRACY'),
('102', 'PUNISHMENT FOR MURDER'),
('103', 'PUNISHMENT FOR KIDNAPPING'),
('104', 'PUNISHMENT FOR THEFT'),
('105', 'PUNISHMENT FOR SMUGGLING'),
('106', 'PUNISHMENT FOR ROBBERY'),
('107', 'PUNISHMENT FOR COMPUTER CRIME'),
('108', 'PUNISHMENT FOR PROPERTY CRIME'),
('109', 'PUNISHMENT FOR VIOLENCE'),
('110', 'PUNISHMENT FOR TRAFFIC OFFENCES');

-- --------------------------------------------------------

--
-- Table structure for table `criminal`
--

CREATE TABLE `criminal` (
  `C_ID` int(11) NOT NULL,
  `C_AGE` int(3) NOT NULL,
  `C_GENDER` varchar(7) NOT NULL,
  `C_ADDRESS` varchar(20) NOT NULL,
  `OFF_ID` int(10) DEFAULT NULL,
  `FIR_NO` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `criminal`
--

INSERT INTO `criminal` (`C_ID`, `C_AGE`, `C_GENDER`, `C_ADDRESS`, `OFF_ID`, `FIR_NO`) VALUES
(501, 39, 'MALE', 'Seshachalam', 1, 901),
(502, 36, 'MALE', 'Seshachalam', 2, 902);

--
-- Triggers `criminal`
--
DELIMITER $$
CREATE TRIGGER `logs` AFTER DELETE ON `criminal` FOR EACH ROW INSERT INTO `criminallog`(`CRIMINAL_ID`, `AGE`, `GENDER`, `ADDRESS`, `OFFID`, `FIRNO`) VALUES (old.C_ID,old.C_AGE,old.C_GENDER,old.C_ADDRESS,old.OFF_ID,old.FIR_NO)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `criminallog`
--

CREATE TABLE `criminallog` (
  `NO.` int(5) NOT NULL,
  `CRIMINAL_ID` int(10) NOT NULL,
  `NAME` varchar(20) NOT NULL,
  `DATE` date NOT NULL DEFAULT current_timestamp(),
  `AGE` int(3) DEFAULT NULL,
  `GENDER` varchar(7) DEFAULT NULL,
  `ADDRESS` varchar(50) DEFAULT NULL,
  `OFFID` int(3) DEFAULT NULL,
  `FIRNO` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `criminallog`
--

INSERT INTO `criminallog` (`NO.`, `CRIMINAL_ID`, `NAME`, `DATE`, `AGE`, `GENDER`, `ADDRESS`, `OFFID`, `FIRNO`) VALUES
(50, 501, 'PUSHPA', '2020-12-16', 39, 'MALE', 'Seshachalam', 1, 901);

-- --------------------------------------------------------

--
-- Table structure for table `fir`
--

CREATE TABLE `fir` (
  `FIR_NO` int(6) NOT NULL,
  `C_NAME` varchar(20) NOT NULL,
  `PHOTO` varchar(1000) DEFAULT NULL,
  `CRIME_TIME` datetime(6) DEFAULT NULL,
  `CRIME_SCENE` varchar(100) DEFAULT NULL,
  `CRIME_DESC` varchar(500) DEFAULT NULL,
  `FIR_DATE` date NOT NULL DEFAULT current_timestamp(),
  `OFFICER_ID` int(5) DEFAULT NULL,
  `STATUS` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fir`
--

INSERT INTO `fir` (`FIR_NO`, `C_NAME`, `PHOTO`, `CRIME_TIME`, `CRIME_SCENE`, `CRIME_DESC`, `FIR_DATE`, `OFFICER_ID`, `STATUS`) VALUES
(901, 'PUSHPA', 'pushpa.jpg', '2020-12-18 12:31:17.205235', '6th Main Hoskote Bangalore-37', 'A truck driver named Pushpa makes enemies as he rises in the world of red sandalwood smuggling. However, violence erupts when the police attempt to bring down his illegal business on 18-dec-2020 by officer named Bhanwar Singh Shekhawat.', '2020-12-20', 1, 'APPROVED'),
(902, 'KESHAVA', 'keshava.jpg', '2020-12-19 10:41:17.207654', '9th Main Jayanagar Bangalore-91', 'A labour named keshava involved in smuggling of sandalwood and many other crime activites.', '2020-12-20', 2, 'APPROVED'),
(903, 'MANGALAM SEENU', 'seenu.jpg', '2020-12-09 15:29:00.000000', '5th Main Road Katriguppe Bangalore-61', 'Mangalam Seenu is a prime witness in murder of his own brother Sriram due to property issues.', '2023-01-06', 4, 'NOT UPDATED');

-- --------------------------------------------------------

--
-- Table structure for table `policeofficer`
--

CREATE TABLE `policeofficer` (
  `OFF_ID` int(10) NOT NULL,
  `OFF_NAME` varchar(20) DEFAULT NULL,
  `EMAIL` varchar(20) NOT NULL,
  `PH_NO` varchar(10) DEFAULT NULL,
  `P_ADD` varchar(20) NOT NULL,
  `PSWD` varchar(10) DEFAULT NULL,
  `STN_ID` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `policeofficer`
--

INSERT INTO `policeofficer` (`OFF_ID`, `OFF_NAME`, `EMAIL`, `PH_NO`, `P_ADD`, `PSWD`, `STN_ID`) VALUES
(1, 'Bhanwar Singh Shekha', 'bhanwar@gmail.com', '8787878787', 'AGS LAYOUT', 'pushpa123', 201),
(2, 'PRABHAS', 'prabhas@gmail.com', '9898989898', 'CHIKKALSANDRA', 'sahoo123', 201),
(3, 'RAM CHARAN', 'ram@gmail.com', '7878787878', 'PP LAYOUT', 'vvr123', 202),
(4, 'PAWAN KALYAN', 'pawan@gmail.com', '6969696969', 'KADHIRENAHALLI', 'nayak123', 202),
(5, 'NTR', 'ntr@gmail.com', '9090909090', 'KENGERI', 'rrr123', 203),
(6, 'MAHESH', 'mahesh@gmail.com', '8585858585', 'JAYANAGAR', 'svp123', 203),
(7, 'SALMAN KHAN', 'salman@gmail.com', '9494949494', 'BTM LAYOUT', 'sultan123', 204),
(8, 'NANI', 'nani@gmail.com', '9191919191', 'R T NAGAR', 'hit123', 204),
(9, 'YASH', 'yash@gmail.com', '9393939393', 'UTTARAHALLI', 'kgf123', 205),
(10, 'DARSHAN', 'darshan@gmail.com', '7575757575', 'BANASHANKARI', 'robert123', 205);

--
-- Triggers `policeofficer`
--
DELIMITER $$
CREATE TRIGGER `ap` AFTER INSERT ON `policeofficer` FOR EACH ROW INSERT INTO `pos` VALUES (NEW.OFF_ID,new.STN_ID)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `pos`
--

CREATE TABLE `pos` (
  `OFFID` int(20) NOT NULL,
  `STN_ID` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pos`
--

INSERT INTO `pos` (`OFFID`, `STN_ID`) VALUES
(1, 201),
(2, 201),
(3, 202),
(4, 202),
(5, 203),
(6, 203),
(7, 204),
(8, 204),
(9, 205),
(10, 205);

-- --------------------------------------------------------

--
-- Table structure for table `station`
--

CREATE TABLE `station` (
  `STN_ID` int(10) NOT NULL,
  `STN_NAME` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `station`
--

INSERT INTO `station` (`STN_ID`, `STN_NAME`) VALUES
(201, 'JAYANAGAR'),
(202, 'KORAMANGALA'),
(203, 'BANNERGHATTA'),
(204, 'NELAMANGALA'),
(205, 'KENGERI');

-- --------------------------------------------------------

--
-- Table structure for table `witness`
--

CREATE TABLE `witness` (
  `F_NO` int(20) NOT NULL,
  `I_NAME` varchar(25) NOT NULL,
  `I_ADDRESS` varchar(80) NOT NULL,
  `I_NUMBER` int(22) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `witness`
--

INSERT INTO `witness` (`F_NO`, `I_NAME`, `I_ADDRESS`, `I_NUMBER`) VALUES
(901, 'SRIVALLI', '#12 5th Cross 6th Main Hoskote Bangalore-37', 98989898),
(902, 'AJAY', '#234 8th Cross 9th Main Jayanagar Bangalore-91', 98989898),
(903, 'DAKSHAYANI', '#20 3rd Cross 5th Main Road Katriguppe Bangalore-61', 90909090);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`A_EMAIL`),
  ADD UNIQUE KEY `A_PSWD` (`A_PSWD`);

--
-- Indexes for table `charges`
--
ALTER TABLE `charges`
  ADD PRIMARY KEY (`CID`,`CRIME_IDS`),
  ADD KEY `LM` (`CRIME_IDS`),
  ADD KEY `KL` (`CID`);

--
-- Indexes for table `crime`
--
ALTER TABLE `crime`
  ADD PRIMARY KEY (`CRIME_ID`);

--
-- Indexes for table `criminal`
--
ALTER TABLE `criminal`
  ADD PRIMARY KEY (`C_ID`),
  ADD UNIQUE KEY `FIR_NO` (`FIR_NO`),
  ADD KEY `BC` (`OFF_ID`);

--
-- Indexes for table `criminallog`
--
ALTER TABLE `criminallog`
  ADD PRIMARY KEY (`NO.`),
  ADD KEY `XY` (`FIRNO`);

--
-- Indexes for table `fir`
--
ALTER TABLE `fir`
  ADD PRIMARY KEY (`FIR_NO`),
  ADD KEY `GH` (`OFFICER_ID`);

--
-- Indexes for table `policeofficer`
--
ALTER TABLE `policeofficer`
  ADD PRIMARY KEY (`OFF_ID`),
  ADD UNIQUE KEY `PSWD` (`PSWD`),
  ADD UNIQUE KEY `PH_NO` (`PH_NO`),
  ADD KEY `DE` (`STN_ID`);

--
-- Indexes for table `pos`
--
ALTER TABLE `pos`
  ADD PRIMARY KEY (`OFFID`,`STN_ID`);

--
-- Indexes for table `station`
--
ALTER TABLE `station`
  ADD PRIMARY KEY (`STN_ID`);

--
-- Indexes for table `witness`
--
ALTER TABLE `witness`
  ADD PRIMARY KEY (`F_NO`,`I_NAME`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `criminal`
--
ALTER TABLE `criminal`
  MODIFY `C_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=503;

--
-- AUTO_INCREMENT for table `criminallog`
--
ALTER TABLE `criminallog`
  MODIFY `NO.` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `fir`
--
ALTER TABLE `fir`
  MODIFY `FIR_NO` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=904;

--
-- AUTO_INCREMENT for table `policeofficer`
--
ALTER TABLE `policeofficer`
  MODIFY `OFF_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `charges`
--
ALTER TABLE `charges`
  ADD CONSTRAINT `KL` FOREIGN KEY (`CID`) REFERENCES `criminal` (`C_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `LM` FOREIGN KEY (`CRIME_IDS`) REFERENCES `crime` (`CRIME_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `criminal`
--
ALTER TABLE `criminal`
  ADD CONSTRAINT `BC` FOREIGN KEY (`OFF_ID`) REFERENCES `policeofficer` (`OFF_ID`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `EF` FOREIGN KEY (`FIR_NO`) REFERENCES `fir` (`FIR_NO`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `criminallog`
--
ALTER TABLE `criminallog`
  ADD CONSTRAINT `ABD` FOREIGN KEY (`FIRNO`) REFERENCES `fir` (`FIR_NO`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `fir`
--
ALTER TABLE `fir`
  ADD CONSTRAINT `GH` FOREIGN KEY (`OFFICER_ID`) REFERENCES `policeofficer` (`OFF_ID`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `policeofficer`
--
ALTER TABLE `policeofficer`
  ADD CONSTRAINT `DE` FOREIGN KEY (`STN_ID`) REFERENCES `station` (`STN_ID`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `witness`
--
ALTER TABLE `witness`
  ADD CONSTRAINT `YZ` FOREIGN KEY (`F_NO`) REFERENCES `fir` (`FIR_NO`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
