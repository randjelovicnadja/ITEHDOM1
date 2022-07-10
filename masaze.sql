-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 16, 2017 at 03:17 PM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `masaze`
--
CREATE DATABASE IF NOT EXISTS `masaze` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `masaze`;

-- --------------------------------------------------------

--
-- Table structure for table `masaza`
--

CREATE TABLE IF NOT EXISTS `masaza` (
  `masazaID` int(11) NOT NULL AUTO_INCREMENT,
  `nazivMasaze` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `trajanjeID` int(11) NOT NULL,
  `tipID` int(11) NOT NULL,
  `osnovnaCena` double NOT NULL,
  PRIMARY KEY (`masazaID`),
  KEY `trajanjeID` (`trajanjeID`),
  KEY `tipID` (`tipID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `masaza`
--

INSERT INTO `masaza` (`masazaID`, `nazivMasaze`, `trajanjeID`, `tipID`, `osnovnaCena`) VALUES
(1, '30minutni Anticelulit tretman sa Nadezdom Milisavljevic', 1, 1, 700),
(2, 'Jaka sportska masaza za oporavak tela  Milisav Kovacevic', 2, 4, 2300),
(3, 'Nova masaza', 3, 2, 1500);

-- --------------------------------------------------------

--
-- Table structure for table `tip`
--

CREATE TABLE IF NOT EXISTS `tip` (
  `tipID` int(11) NOT NULL AUTO_INCREMENT,
  `nazivTipa` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`tipID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `tip`
--

INSERT INTO `tip` (`tipID`, `nazivTipa`) VALUES
(1, 'Anticelulit masaza'),
(2, 'Relaks masaza'),
(3, 'Antistres masaza'),
(4, 'Sportska masaza');

-- --------------------------------------------------------

--
-- Table structure for table `trajanje`
--

CREATE TABLE IF NOT EXISTS `trajanje` (
  `trajanjeID` int(11) NOT NULL AUTO_INCREMENT,
  `trajanje` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dodatakCeni` double NOT NULL,
  PRIMARY KEY (`trajanjeID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `trajanje`
--

INSERT INTO `trajanje` (`trajanjeID`, `trajanje`, `dodatakCeni`) VALUES
(1, '30 minuta', 0),
(2, '60 minuta', 500),
(3, '90 minuta', 1000),
(4, '120 minuta', 1250);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `masaza`
--
ALTER TABLE `masaza`
  ADD CONSTRAINT `masaza_ibfk_2` FOREIGN KEY (`tipID`) REFERENCES `tip` (`tipID`),
  ADD CONSTRAINT `masaza_ibfk_1` FOREIGN KEY (`trajanjeID`) REFERENCES `trajanje` (`trajanjeID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
