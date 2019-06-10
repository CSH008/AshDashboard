-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 09, 2019 at 06:10 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.1.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sapphire`
--

-- --------------------------------------------------------

--
-- Table structure for table `alert`
--

CREATE TABLE `alert` (
  `Id` int(11) NOT NULL,
  `SensorId` int(11) NOT NULL,
  `LogId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `aspnetroleclaims`
--

CREATE TABLE `aspnetroleclaims` (
  `Id` int(11) NOT NULL,
  `RoleId` int(11) NOT NULL,
  `ClaimType` longtext,
  `ClaimValue` longtext
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `aspnetuserclaims`
--

CREATE TABLE `aspnetuserclaims` (
  `Id` int(11) NOT NULL,
  `UserId` int(11) NOT NULL,
  `ClaimType` longtext,
  `ClaimValue` longtext
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `aspnetuserlogins`
--

CREATE TABLE `aspnetuserlogins` (
  `LoginProvider` varchar(128) NOT NULL,
  `ProviderKey` varchar(128) NOT NULL,
  `ProviderDisplayName` longtext,
  `UserId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `aspnetuserroles`
--

CREATE TABLE `aspnetuserroles` (
  `UserId` int(11) NOT NULL,
  `RoleId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aspnetuserroles`
--

INSERT INTO `aspnetuserroles` (`UserId`, `RoleId`) VALUES
(1, 2),
(1, 100);

-- --------------------------------------------------------

--
-- Table structure for table `aspnetusertokens`
--

CREATE TABLE `aspnetusertokens` (
  `UserId` int(11) NOT NULL,
  `LoginProvider` varchar(128) NOT NULL,
  `Name` varchar(128) NOT NULL,
  `Value` longtext
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `device`
--

CREATE TABLE `device` (
  `Id` int(11) NOT NULL,
  `UserId` int(11) NOT NULL,
  `LocationId` int(11) NOT NULL,
  `IMEI` varchar(256) DEFAULT NULL,
  `SIMCard` varchar(256) DEFAULT NULL,
  `DeviceTypeId` int(11) DEFAULT NULL,
  `Status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `devicetype`
--

CREATE TABLE `devicetype` (
  `Id` int(11) NOT NULL,
  `Name` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `Id` int(11) NOT NULL,
  `Name` varchar(256) NOT NULL,
  `Latitude` double DEFAULT NULL,
  `Longitude` double DEFAULT NULL,
  `Country` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE `log` (
  `Id` int(11) NOT NULL,
  `Timestamp` datetime(6) DEFAULT NULL,
  `IMEI` varchar(255) DEFAULT NULL,
  `Strength` double DEFAULT NULL,
  `Voltage` double DEFAULT NULL,
  `Latitude` double DEFAULT NULL,
  `Longitude` double DEFAULT NULL,
  `SensorValue1` double DEFAULT NULL,
  `SensorValue2` double DEFAULT NULL,
  `SensorValue3` double DEFAULT NULL,
  `SensorValue4` double DEFAULT NULL,
  `SensorValue5` double DEFAULT NULL,
  `SensorValue6` double DEFAULT NULL,
  `SensorStatus1` int(11) DEFAULT NULL,
  `SensorStatus2` int(11) DEFAULT NULL,
  `SensorStatus3` int(11) DEFAULT NULL,
  `SensorStatus4` int(11) DEFAULT NULL,
  `SensorStatus5` int(11) DEFAULT NULL,
  `SensorStatus6` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `Id` int(11) NOT NULL,
  `Name` varchar(256) DEFAULT NULL,
  `NormalizedName` varchar(256) DEFAULT NULL,
  `DisplayName` varchar(256) DEFAULT NULL,
  `ConcurrencyStamp` longtext
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`Id`, `Name`, `NormalizedName`, `DisplayName`, `ConcurrencyStamp`) VALUES
(1, 'Customer', 'CUSTOMER', 'Customer', '66e71c27-e668-45d7-983e-0fdfc5ccddf0'),
(2, 'Admin', 'ADMIN', 'Administrator', '2c881847-5f62-44b9-a105-69bea5456028'),
(100, 'SuperAdmin', 'SUPERADMIN', 'Super Administrator', 'f2506fec-7471-4393-9a32-2983dd33d758');

-- --------------------------------------------------------

--
-- Table structure for table `sensor`
--

CREATE TABLE `sensor` (
  `Id` int(11) NOT NULL,
  `DeviceId` int(11) NOT NULL,
  `SensorTypeId` int(11) NOT NULL,
  `SerialNumber` varchar(256) DEFAULT NULL,
  `HighThreshold` double DEFAULT NULL,
  `LowThreshold` double DEFAULT NULL,
  `RelayOperation` int(11) DEFAULT NULL,
  `Status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sensortype`
--

CREATE TABLE `sensortype` (
  `Id` int(11) NOT NULL,
  `Name` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `Id` int(11) NOT NULL,
  `UserName` varchar(256) NOT NULL,
  `NormalizedUserName` varchar(256) NOT NULL,
  `PasswordHash` varchar(256) NOT NULL,
  `Email` varchar(256) DEFAULT NULL,
  `NormalizedEmail` varchar(256) DEFAULT NULL,
  `Phone` varchar(256) DEFAULT NULL,
  `Mobile` varchar(256) DEFAULT NULL,
  `Address` varchar(256) DEFAULT NULL,
  `Company` varchar(256) DEFAULT NULL,
  `ContactPerson` varchar(256) DEFAULT NULL,
  `SecurityStamp` longtext,
  `ConcurrencyStamp` longtext
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`Id`, `UserName`, `NormalizedUserName`, `PasswordHash`, `Email`, `NormalizedEmail`, `Phone`, `Mobile`, `Address`, `Company`, `ContactPerson`, `SecurityStamp`, `ConcurrencyStamp`) VALUES
(1, 'SuperAdmin', 'SUPERADMIN', 'AQAAAAEAACcQAAAAEPpuCh6EQGkDzZ3tCJsEpPkqHamYPvkQw39N8sXUp9gDD4slnqHi8GhW1P63x1Zgtg==', 'super@gamil.com', 'SUPER@GAMIL.COM', '1+38382930', '324-2343-2342', 'CA', 'Google', 'Ashe', '2LFGSN52GRRTWURW22T5MORX3RN2GKYK', 'e65e3cab-77c9-44a1-abbf-62f31d0d285e');

-- --------------------------------------------------------

--
-- Table structure for table `__efmigrationshistory`
--

CREATE TABLE `__efmigrationshistory` (
  `MigrationId` varchar(95) NOT NULL,
  `ProductVersion` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `__efmigrationshistory`
--

INSERT INTO `__efmigrationshistory` (`MigrationId`, `ProductVersion`) VALUES
('00000000000000_CreateIdentitySchema', '2.1.8-servicing-32085');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alert`
--
ALTER TABLE `alert`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_Alert_SensorId` (`SensorId`),
  ADD KEY `IX_Alert_LogId` (`LogId`);

--
-- Indexes for table `aspnetroleclaims`
--
ALTER TABLE `aspnetroleclaims`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_AspNetRoleClaims_RoleId` (`RoleId`);

--
-- Indexes for table `aspnetuserclaims`
--
ALTER TABLE `aspnetuserclaims`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_AspNetUserClaims_UserId` (`UserId`);

--
-- Indexes for table `aspnetuserlogins`
--
ALTER TABLE `aspnetuserlogins`
  ADD PRIMARY KEY (`LoginProvider`,`ProviderKey`),
  ADD KEY `IX_AspNetUserLogins_UserId` (`UserId`);

--
-- Indexes for table `aspnetuserroles`
--
ALTER TABLE `aspnetuserroles`
  ADD PRIMARY KEY (`UserId`,`RoleId`),
  ADD KEY `IX_AspNetUserRoles_RoleId` (`RoleId`);

--
-- Indexes for table `aspnetusertokens`
--
ALTER TABLE `aspnetusertokens`
  ADD PRIMARY KEY (`UserId`,`LoginProvider`,`Name`);

--
-- Indexes for table `device`
--
ALTER TABLE `device`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_Device_UserId` (`UserId`),
  ADD KEY `IX_Device_LocationId` (`LocationId`),
  ADD KEY `IX_Device_DeviceTypeId` (`DeviceTypeId`);

--
-- Indexes for table `devicetype`
--
ALTER TABLE `devicetype`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_Location_Name` (`Name`),
  ADD KEY `IX_Location_Country` (`Country`);

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `sensor`
--
ALTER TABLE `sensor`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_Sensor_DeviceId` (`DeviceId`),
  ADD KEY `IX_Sensor_SensorTypeId` (`SensorTypeId`);

--
-- Indexes for table `sensortype`
--
ALTER TABLE `sensortype`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `UserNameIndex` (`NormalizedUserName`),
  ADD UNIQUE KEY `UserEmailIndex` (`NormalizedEmail`);

--
-- Indexes for table `__efmigrationshistory`
--
ALTER TABLE `__efmigrationshistory`
  ADD PRIMARY KEY (`MigrationId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alert`
--
ALTER TABLE `alert`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `aspnetroleclaims`
--
ALTER TABLE `aspnetroleclaims`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `aspnetuserclaims`
--
ALTER TABLE `aspnetuserclaims`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `device`
--
ALTER TABLE `device`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `devicetype`
--
ALTER TABLE `devicetype`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sensor`
--
ALTER TABLE `sensor`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sensortype`
--
ALTER TABLE `sensortype`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `alert`
--
ALTER TABLE `alert`
  ADD CONSTRAINT `FK_Alert_Log_LogId` FOREIGN KEY (`LogId`) REFERENCES `log` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Alert_Sensor_SensorId` FOREIGN KEY (`SensorId`) REFERENCES `sensor` (`Id`) ON DELETE CASCADE;

--
-- Constraints for table `aspnetroleclaims`
--
ALTER TABLE `aspnetroleclaims`
  ADD CONSTRAINT `FK_AspNetRoleClaims_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `role` (`Id`) ON DELETE CASCADE;

--
-- Constraints for table `aspnetuserclaims`
--
ALTER TABLE `aspnetuserclaims`
  ADD CONSTRAINT `FK_AspNetUserClaims_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `user` (`Id`) ON DELETE CASCADE;

--
-- Constraints for table `aspnetuserlogins`
--
ALTER TABLE `aspnetuserlogins`
  ADD CONSTRAINT `FK_AspNetUserLogins_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `user` (`Id`) ON DELETE CASCADE;

--
-- Constraints for table `aspnetuserroles`
--
ALTER TABLE `aspnetuserroles`
  ADD CONSTRAINT `FK_AspNetUserRoles_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `role` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_AspNetUserRoles_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `user` (`Id`) ON DELETE CASCADE;

--
-- Constraints for table `aspnetusertokens`
--
ALTER TABLE `aspnetusertokens`
  ADD CONSTRAINT `FK_AspNetUserTokens_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `user` (`Id`) ON DELETE CASCADE;

--
-- Constraints for table `device`
--
ALTER TABLE `device`
  ADD CONSTRAINT `FK_Device_DeviceType_DeviceTypeId` FOREIGN KEY (`DeviceTypeId`) REFERENCES `devicetype` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Device_Location_LocationId` FOREIGN KEY (`LocationId`) REFERENCES `location` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Device_User_UserId` FOREIGN KEY (`UserId`) REFERENCES `user` (`Id`) ON DELETE CASCADE;

--
-- Constraints for table `sensor`
--
ALTER TABLE `sensor`
  ADD CONSTRAINT `FK_Sensor_Device_Id` FOREIGN KEY (`DeviceId`) REFERENCES `device` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_Sensor_SensorType_Id` FOREIGN KEY (`SensorTypeId`) REFERENCES `sensortype` (`Id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
