-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 30, 2023 at 08:13 PM
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
-- Database: `brodarska kompanija`
--

-- --------------------------------------------------------

--
-- Table structure for table `brod`
--

CREATE TABLE `brod` (
  `sifra_broda` int(11) NOT NULL,
  `naziv` varchar(100) NOT NULL,
  `vrsta` varchar(100) NOT NULL,
  `godina_proizvodnje` int(11) NOT NULL,
  `kapacitet` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `brod`
--


-- --------------------------------------------------------

--
-- Table structure for table `kapetan`
--

CREATE TABLE `kapetan` (
  `sifra_kapetana` int(11) NOT NULL,
  `ime` varchar(100) NOT NULL,
  `prezime` varchar(100) NOT NULL,
  `radno_iskustvo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `karta`
--

CREATE TABLE `karta` (
  `sifra_karte` int(11) NOT NULL,
  `cijena` float NOT NULL,
  `vrsta` varchar(100) NOT NULL,
  `vrijeme_polaska` datetime NOT NULL,
  `vrijeme_dolaska` datetime NOT NULL,
  `sifra_voznje` int(11) NOT NULL,
  `sifra_putnika` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `luka`
--

CREATE TABLE `luka` (
  `sifra_luke` int(11) NOT NULL,
  `naziv` varchar(100) NOT NULL,
  `drzava` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `putnik`
--

CREATE TABLE `putnik` (
  `sifra_putnika` int(11) NOT NULL,
  `ime` varchar(100) NOT NULL,
  `prezime` varchar(100) NOT NULL,
  `godine` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vožnja`
--

CREATE TABLE `vožnja` (
  `sifra_voznje` int(11) NOT NULL,
  `mjesto_polaska` varchar(100) NOT NULL,
  `mjesto_dolaska` varchar(100) NOT NULL,
  `sifra_broda` int(11) NOT NULL,
  `sifra_kapetana` int(11) NOT NULL,
  `sifra_luke` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brod`
--
ALTER TABLE `brod`
  ADD PRIMARY KEY (`sifra_broda`);

--
-- Indexes for table `kapetan`
--
ALTER TABLE `kapetan`
  ADD PRIMARY KEY (`sifra_kapetana`);

--
-- Indexes for table `karta`
--
ALTER TABLE `karta`
  ADD PRIMARY KEY (`sifra_karte`),
  ADD KEY `karta_ibfk_1` (`sifra_voznje`),
  ADD KEY `sifra_putnika` (`sifra_putnika`);

--
-- Indexes for table `luka`
--
ALTER TABLE `luka`
  ADD PRIMARY KEY (`sifra_luke`);

--
-- Indexes for table `putnik`
--
ALTER TABLE `putnik`
  ADD PRIMARY KEY (`sifra_putnika`);

--
-- Indexes for table `vožnja`
--
ALTER TABLE `vožnja`
  ADD PRIMARY KEY (`sifra_voznje`),
  ADD KEY `sifra_broda` (`sifra_broda`),
  ADD KEY `sifra_kapetana` (`sifra_kapetana`),
  ADD KEY `sifra_luke` (`sifra_luke`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brod`
--
ALTER TABLE `brod`
  MODIFY `sifra_broda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT for table `kapetan`
--
ALTER TABLE `kapetan`
  MODIFY `sifra_kapetana` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `karta`
--
ALTER TABLE `karta`
  MODIFY `sifra_karte` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `luka`
--
ALTER TABLE `luka`
  MODIFY `sifra_luke` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `putnik`
--
ALTER TABLE `putnik`
  MODIFY `sifra_putnika` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vožnja`
--
ALTER TABLE `vožnja`
  MODIFY `sifra_voznje` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `karta`
--
ALTER TABLE `karta`
  ADD CONSTRAINT `karta_ibfk_1` FOREIGN KEY (`sifra_voznje`) REFERENCES `vožnja` (`sifra_voznje`),
  ADD CONSTRAINT `karta_ibfk_2` FOREIGN KEY (`sifra_putnika`) REFERENCES `putnik` (`sifra_putnika`);

--
-- Constraints for table `vožnja`
--
ALTER TABLE `vožnja`
  ADD CONSTRAINT `vožnja_ibfk_1` FOREIGN KEY (`sifra_broda`) REFERENCES `brod` (`sifra_broda`),
  ADD CONSTRAINT `vožnja_ibfk_2` FOREIGN KEY (`sifra_kapetana`) REFERENCES `kapetan` (`sifra_kapetana`),
  ADD CONSTRAINT `vožnja_ibfk_3` FOREIGN KEY (`sifra_luke`) REFERENCES `luka` (`sifra_luke`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
