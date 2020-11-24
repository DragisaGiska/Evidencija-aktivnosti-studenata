-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 13, 2018 at 07:42 PM
-- Server version: 5.7.19
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `itp_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `administratori`
--

DROP TABLE IF EXISTS `administratori`;
CREATE TABLE IF NOT EXISTS `administratori` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_ime` varchar(32) NOT NULL,
  `admin_prezime` varchar(32) NOT NULL,
  `korisnicko_ime` varchar(16) NOT NULL,
  `email` varchar(64) NOT NULL,
  `lozinka` varchar(32) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `administratori`
--

INSERT INTO `administratori` (`admin_id`, `admin_ime`, `admin_prezime`, `korisnicko_ime`, `email`, `lozinka`) VALUES
(0, 'Admin', 'Admin', 'admin', 'admin@email.com', 'admin'),
(21, 'Marko', 'Markovic', 'marko', 'marko@email.com', 'c28aa76990994587b0e907683792297c'),
(19, 'Ivana', 'Jovovic', 'ivana', 'ivana@gmail.com', 'ivana');

-- --------------------------------------------------------

--
-- Table structure for table `aktivnosti`
--

DROP TABLE IF EXISTS `aktivnosti`;
CREATE TABLE IF NOT EXISTS `aktivnosti` (
  `aktivnost_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `tip_id` int(11) NOT NULL,
  `aktivnost_datum` date NOT NULL,
  `aktivnost_mjesto` varchar(32) NOT NULL,
  `aktivnost_opis` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`aktivnost_id`),
  KEY `FK_STUDENT_AKTIVNOST` (`student_id`),
  KEY `FK_AKTIVNOST_IMA_TIP` (`tip_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `aktivnosti`
--

INSERT INTO `aktivnosti` (`aktivnost_id`, `student_id`, `tip_id`, `aktivnost_datum`, `aktivnost_mjesto`, `aktivnost_opis`) VALUES
(16, 18, 1, '2017-10-18', 'Sarajevo', 'Takmicenje iz matematike.'),
(17, 22, 5, '2017-09-26', 'Sarajevo', 'Ljetnja skola'),
(18, 20, 1, '2017-10-19', 'Banja Luka', 'Takmičenje iz programiranja.'),
(19, 22, 1, '2017-11-21', 'Novi Sad', 'Takmicenje');

-- --------------------------------------------------------

--
-- Table structure for table `studenti`
--

DROP TABLE IF EXISTS `studenti`;
CREATE TABLE IF NOT EXISTS `studenti` (
  `student_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_ime` varchar(32) NOT NULL,
  `student_prezime` varchar(32) NOT NULL,
  `student_index` varchar(8) NOT NULL,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `studenti`
--

INSERT INTO `studenti` (`student_id`, `student_ime`, `student_prezime`, `student_index`) VALUES
(17, 'Marko', 'Markovic', '1222'),
(18, 'Petar', 'Petrovic', '1444'),
(19, 'Marija', 'Markovic', '1543'),
(20, 'Ana', 'Lazarevic', '1343'),
(21, 'Nikola', 'Lazic', '1325'),
(22, 'Ivan', 'Ivanovic', '1276'),
(25, 'Milan', 'Milanovic', '1324'),
(26, 'Nemanja', 'Vidovic', '1564');

-- --------------------------------------------------------

--
-- Table structure for table `tip_aktivnosti`
--

DROP TABLE IF EXISTS `tip_aktivnosti`;
CREATE TABLE IF NOT EXISTS `tip_aktivnosti` (
  `tip_id` int(11) NOT NULL AUTO_INCREMENT,
  `tip_naziv` varchar(128) NOT NULL,
  PRIMARY KEY (`tip_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tip_aktivnosti`
--

INSERT INTO `tip_aktivnosti` (`tip_id`, `tip_naziv`) VALUES
(1, 'Takmicenje'),
(2, 'Volonterski rad'),
(3, 'Stručna praksa'),
(5, 'Ljetnja praksa'),
(11, 'IT takmičenje');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `aktivnosti`
--
ALTER TABLE `aktivnosti`
  ADD CONSTRAINT `FK_STUDENT_AKTIVNOST` FOREIGN KEY (`student_id`) REFERENCES `studenti` (`student_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
