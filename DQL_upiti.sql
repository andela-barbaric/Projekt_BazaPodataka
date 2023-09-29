-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 31, 2023 at 01:33 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kompanija za brodove`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `podupit1`
-- (See below for the actual view)
--
CREATE TABLE `podupit1` (
`naziv` varchar(100)
,`vrsta` varchar(100)
,`kapacitet` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `podupit2`
-- (See below for the actual view)
--
CREATE TABLE `podupit2` (
`sifra_kapetana` int(11)
,`ime` varchar(100)
,`prezime` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `podupit3`
-- (See below for the actual view)
--
CREATE TABLE `podupit3` (
`sifra_broda` int(11)
,`naziv` varchar(100)
,`vrsta` varchar(100)
,`godina_proizvodnje` int(11)
,`kapacitet` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `podupit4`
-- (See below for the actual view)
--
CREATE TABLE `podupit4` (
`naziv` varchar(100)
,`broj_voznji` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `upit1`
-- (See below for the actual view)
--
CREATE TABLE `upit1` (
`cijena` float
,`vrsta` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `upit2`
-- (See below for the actual view)
--
CREATE TABLE `upit2` (
`AVG(godine)` decimal(14,4)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `upit3`
-- (See below for the actual view)
--
CREATE TABLE `upit3` (
`drzava` varchar(100)
,`broj_luka` bigint(21)
);

-- --------------------------------------------------------

--
-- Structure for view `podupit1`
--
DROP TABLE IF EXISTS `podupit1`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `podupit1`  AS SELECT `brod`.`naziv` AS `naziv`, `brod`.`vrsta` AS `vrsta`, `brod`.`kapacitet` AS `kapacitet` FROM `brod` WHERE `brod`.`kapacitet` > (select avg(`brod`.`kapacitet`) from `brod`) GROUP BY `brod`.`naziv`, `brod`.`vrsta`, `brod`.`kapacitet` ORDER BY `brod`.`kapacitet` AS `DESCdesc` ASC  ;

-- --------------------------------------------------------

--
-- Structure for view `podupit2`
--
DROP TABLE IF EXISTS `podupit2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `podupit2`  AS SELECT `k`.`sifra_kapetana` AS `sifra_kapetana`, `k`.`ime` AS `ime`, `k`.`prezime` AS `prezime` FROM `kapetan` AS `k` WHERE !exists(select 1 from `vožnja` `v` where `v`.`sifra_kapetana` = `k`.`sifra_kapetana` limit 1)  ;

-- --------------------------------------------------------

--
-- Structure for view `podupit3`
--
DROP TABLE IF EXISTS `podupit3`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `podupit3`  AS SELECT `brod`.`sifra_broda` AS `sifra_broda`, `brod`.`naziv` AS `naziv`, `brod`.`vrsta` AS `vrsta`, `brod`.`godina_proizvodnje` AS `godina_proizvodnje`, `brod`.`kapacitet` AS `kapacitet` FROM `brod` WHERE `brod`.`kapacitet` < (select max(`brod`.`kapacitet`) from `brod` where `brod`.`godina_proizvodnje` = 2019) AND `brod`.`godina_proizvodnje` <> 20192019  ;

-- --------------------------------------------------------

--
-- Structure for view `podupit4`
--
DROP TABLE IF EXISTS `podupit4`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `podupit4`  AS SELECT `l`.`naziv` AS `naziv`, (select count(0) from `vožnja` `v` where `v`.`sifra_luke` = `l`.`sifra_luke`) AS `broj_voznji` FROM `luka` AS `l``l`  ;

-- --------------------------------------------------------

--
-- Structure for view `upit1`
--
DROP TABLE IF EXISTS `upit1`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `upit1`  AS SELECT max(`karta`.`cijena`) AS `cijena`, `karta`.`vrsta` AS `vrsta` FROM `karta` WHERE `karta`.`vrsta` = 'povratna''povratna'  ;

-- --------------------------------------------------------

--
-- Structure for view `upit2`
--
DROP TABLE IF EXISTS `upit2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `upit2`  AS SELECT avg(`putnik`.`godine`) AS `AVG(godine)` FROM `putnik` WHERE `putnik`.`godine` between 45 and 9595  ;

-- --------------------------------------------------------

--
-- Structure for view `upit3`
--
DROP TABLE IF EXISTS `upit3`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `upit3`  AS SELECT `luka`.`drzava` AS `drzava`, count(0) AS `broj_luka` FROM `luka` WHERE `luka`.`drzava` = 'Hrvatska''Hrvatska'  ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
