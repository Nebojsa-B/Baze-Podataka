-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 24, 2020 at 11:46 AM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gibsondb`
--

-- --------------------------------------------------------

--
-- Table structure for table `civije`
--

CREATE TABLE `civije` (
  `CIVIJE_ID` int(11) NOT NULL,
  `PP_CIVIJE_ID` int(11) DEFAULT NULL,
  `TIP` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `civije`
--

INSERT INTO `civije` (`CIVIJE_ID`, `PP_CIVIJE_ID`, `TIP`) VALUES
(1, 1, 'metalne'),
(2, 2, 'drvene'),
(3, 3, 'metalne'),
(4, 4, 'plasticne\r\n'),
(5, 5, 'drvene');

-- --------------------------------------------------------

--
-- Table structure for table `delovi`
--

CREATE TABLE `delovi` (
  `DELOVI_ID` int(11) NOT NULL,
  `CIVIJE_ID` int(11) DEFAULT NULL,
  `KOBILICE_ID` int(11) DEFAULT NULL,
  `KORPUS_ID` int(11) DEFAULT NULL,
  `ZICE_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `delovi`
--

INSERT INTO `delovi` (`DELOVI_ID`, `CIVIJE_ID`, `KOBILICE_ID`, `KORPUS_ID`, `ZICE_ID`) VALUES
(1, 2, 1, 2, 2),
(2, 1, 3, 1, 1),
(3, 5, 2, 3, 3),
(4, 3, 3, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `kobilice`
--

CREATE TABLE `kobilice` (
  `KOBILICE_ID` int(11) NOT NULL,
  `PP_KOBILICE_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kobilice`
--

INSERT INTO `kobilice` (`KOBILICE_ID`, `PP_KOBILICE_ID`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `korpus`
--

CREATE TABLE `korpus` (
  `KORPUS_ID` int(11) NOT NULL,
  `TIP` text NOT NULL,
  `VELICINA` text NOT NULL,
  `CENA` text NOT NULL,
  `DATUM_PRAVLJENJA` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `korpus`
--

INSERT INTO `korpus` (`KORPUS_ID`, `TIP`, `VELICINA`, `CENA`, `DATUM_PRAVLJENJA`) VALUES
(1, 'Ebony', '23mm', '93e', '2020-01-09'),
(2, 'African Mohogany', '45mm', '70e', '2019-05-23'),
(3, 'Figured Flame Birch', '22mm', '85e', '2019-07-09'),
(4, 'Figured Mohogany', '21mm', '52e', '2018-12-12');

-- --------------------------------------------------------

--
-- Table structure for table `muzicki_instrument`
--

CREATE TABLE `muzicki_instrument` (
  `INSTRUMENT_ID` int(11) NOT NULL,
  `TIP_INSTRUMENTA_ID` int(11) DEFAULT NULL,
  `DELOVI_ID` int(11) DEFAULT NULL,
  `SERIJSKI_BROJ` text NOT NULL,
  `CENA` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `muzicki_instrument`
--

INSERT INTO `muzicki_instrument` (`INSTRUMENT_ID`, `TIP_INSTRUMENTA_ID`, `DELOVI_ID`, `SERIJSKI_BROJ`, `CENA`) VALUES
(1, 1, 1, 'A123B321C', '300e'),
(2, 2, 2, 'B123A321C', '380e'),
(3, 2, 3, 'C123A321B', '550e'),
(4, 1, 4, 'C321BAA23', '420e');

-- --------------------------------------------------------

--
-- Table structure for table `podproizvodjac_civija`
--

CREATE TABLE `podproizvodjac_civija` (
  `PP_CIVIJE_ID` int(11) NOT NULL,
  `MARKA` text NOT NULL,
  `VELICINA` text NOT NULL,
  `CENA` text NOT NULL,
  `DATUM_PRAVLJENJA` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `podproizvodjac_civija`
--

INSERT INTO `podproizvodjac_civija` (`PP_CIVIJE_ID`, `MARKA`, `VELICINA`, `CENA`, `DATUM_PRAVLJENJA`) VALUES
(1, 'Boston 66-NZR', '35mm', '45e', '2018-06-14'),
(2, 'Ibanez Jam 555', '50mm', '35e', '2019-04-11'),
(3, 'Boston 043-2', '35mm', '40e', '2019-08-13'),
(4, 'Boston 60-NZR', '60mm', '50e', '2018-09-13'),
(5, 'ENO ET-33', '50mm', '45e', '2017-10-19');

-- --------------------------------------------------------

--
-- Table structure for table `podproizvodjac_kobilica`
--

CREATE TABLE `podproizvodjac_kobilica` (
  `PP_KOBILICE_ID` int(11) NOT NULL,
  `MARKA` text NOT NULL,
  `CENA` text NOT NULL,
  `DATUM_PRAVLJENJA` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `podproizvodjac_kobilica`
--

INSERT INTO `podproizvodjac_kobilica` (`PP_KOBILICE_ID`, `MARKA`, `CENA`, `DATUM_PRAVLJENJA`) VALUES
(1, 'PG607', '45e', '2019-07-17'),
(2, 'Boston 915-2', '2e', '2019-10-18'),
(3, 'Boston ASK-010', '3e', '2019-06-11'),
(4, 'Boston P-145-P', '15e', '2017-09-20');

-- --------------------------------------------------------

--
-- Table structure for table `prodaja`
--

CREATE TABLE `prodaja` (
  `PRODAJA_ID` int(11) NOT NULL,
  `CENA` text NOT NULL,
  `LOKACIJA` text NOT NULL,
  `DATUM` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `prodaja`
--

INSERT INTO `prodaja` (`PRODAJA_ID`, `CENA`, `LOKACIJA`, `DATUM`) VALUES
(1, '500e', 'Beograd', '2020-01-01'),
(2, '470e', 'Novi Sad', '2020-01-02'),
(3, '520e', 'Beograd', '2020-01-03'),
(4, '480e', 'Pristina', '2020-01-05'),
(5, '550e', 'Nis', '2020-01-15'),
(6, '460e', 'Beograd', '2020-01-30');

-- --------------------------------------------------------

--
-- Table structure for table `prodaja_instrumenta`
--

CREATE TABLE `prodaja_instrumenta` (
  `PRODAJA_INSTRUMENTA_ID` int(11) NOT NULL,
  `PRODAJA_ID` int(11) DEFAULT NULL,
  `INSTRUMENT_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `prodaja_instrumenta`
--

INSERT INTO `prodaja_instrumenta` (`PRODAJA_INSTRUMENTA_ID`, `PRODAJA_ID`, `INSTRUMENT_ID`) VALUES
(1, 2, 1),
(2, 1, 2),
(3, 3, 3),
(4, 4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `tip_instrumenta`
--

CREATE TABLE `tip_instrumenta` (
  `TIP_INSTRUMENTA_ID` int(11) NOT NULL,
  `TIP_INSTRUMENTA` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tip_instrumenta`
--

INSERT INTO `tip_instrumenta` (`TIP_INSTRUMENTA_ID`, `TIP_INSTRUMENTA`) VALUES
(1, 'gitara'),
(2, 'mandolina');

-- --------------------------------------------------------

--
-- Table structure for table `zice`
--

CREATE TABLE `zice` (
  `ZICE_ID` int(11) NOT NULL,
  `TIP` text DEFAULT NULL,
  `DATUM_PRAVLJENJA` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `zice`
--

INSERT INTO `zice` (`ZICE_ID`, `TIP`, `DATUM_PRAVLJENJA`) VALUES
(1, '3', '2019-06-11'),
(2, '6', '2019-09-09'),
(3, '5', '2019-03-12'),
(4, '4', '2018-09-11');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `civije`
--
ALTER TABLE `civije`
  ADD PRIMARY KEY (`CIVIJE_ID`),
  ADD KEY `FK_9` (`PP_CIVIJE_ID`);

--
-- Indexes for table `delovi`
--
ALTER TABLE `delovi`
  ADD PRIMARY KEY (`DELOVI_ID`),
  ADD KEY `FK_5` (`CIVIJE_ID`),
  ADD KEY `FK_6` (`KOBILICE_ID`),
  ADD KEY `FK_7` (`KORPUS_ID`),
  ADD KEY `FK_8` (`ZICE_ID`);

--
-- Indexes for table `kobilice`
--
ALTER TABLE `kobilice`
  ADD PRIMARY KEY (`KOBILICE_ID`),
  ADD KEY `FK_10` (`PP_KOBILICE_ID`);

--
-- Indexes for table `korpus`
--
ALTER TABLE `korpus`
  ADD PRIMARY KEY (`KORPUS_ID`);

--
-- Indexes for table `muzicki_instrument`
--
ALTER TABLE `muzicki_instrument`
  ADD PRIMARY KEY (`INSTRUMENT_ID`),
  ADD KEY `FK_3` (`TIP_INSTRUMENTA_ID`),
  ADD KEY `FK_4` (`DELOVI_ID`);

--
-- Indexes for table `podproizvodjac_civija`
--
ALTER TABLE `podproizvodjac_civija`
  ADD PRIMARY KEY (`PP_CIVIJE_ID`);

--
-- Indexes for table `podproizvodjac_kobilica`
--
ALTER TABLE `podproizvodjac_kobilica`
  ADD PRIMARY KEY (`PP_KOBILICE_ID`);

--
-- Indexes for table `prodaja`
--
ALTER TABLE `prodaja`
  ADD PRIMARY KEY (`PRODAJA_ID`);

--
-- Indexes for table `prodaja_instrumenta`
--
ALTER TABLE `prodaja_instrumenta`
  ADD PRIMARY KEY (`PRODAJA_INSTRUMENTA_ID`),
  ADD KEY `FK_1` (`PRODAJA_ID`),
  ADD KEY `FK_2` (`INSTRUMENT_ID`);

--
-- Indexes for table `tip_instrumenta`
--
ALTER TABLE `tip_instrumenta`
  ADD PRIMARY KEY (`TIP_INSTRUMENTA_ID`);

--
-- Indexes for table `zice`
--
ALTER TABLE `zice`
  ADD PRIMARY KEY (`ZICE_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `civije`
--
ALTER TABLE `civije`
  ADD CONSTRAINT `FK_9` FOREIGN KEY (`PP_CIVIJE_ID`) REFERENCES `podproizvodjac_civija` (`PP_CIVIJE_ID`);

--
-- Constraints for table `delovi`
--
ALTER TABLE `delovi`
  ADD CONSTRAINT `FK_5` FOREIGN KEY (`CIVIJE_ID`) REFERENCES `civije` (`CIVIJE_ID`),
  ADD CONSTRAINT `FK_6` FOREIGN KEY (`KOBILICE_ID`) REFERENCES `kobilice` (`KOBILICE_ID`),
  ADD CONSTRAINT `FK_7` FOREIGN KEY (`KORPUS_ID`) REFERENCES `korpus` (`KORPUS_ID`),
  ADD CONSTRAINT `FK_8` FOREIGN KEY (`ZICE_ID`) REFERENCES `zice` (`ZICE_ID`);

--
-- Constraints for table `kobilice`
--
ALTER TABLE `kobilice`
  ADD CONSTRAINT `FK_10` FOREIGN KEY (`PP_KOBILICE_ID`) REFERENCES `podproizvodjac_kobilica` (`PP_KOBILICE_ID`);

--
-- Constraints for table `muzicki_instrument`
--
ALTER TABLE `muzicki_instrument`
  ADD CONSTRAINT `FK_3` FOREIGN KEY (`TIP_INSTRUMENTA_ID`) REFERENCES `tip_instrumenta` (`TIP_INSTRUMENTA_ID`),
  ADD CONSTRAINT `FK_4` FOREIGN KEY (`DELOVI_ID`) REFERENCES `delovi` (`DELOVI_ID`);

--
-- Constraints for table `prodaja_instrumenta`
--
ALTER TABLE `prodaja_instrumenta`
  ADD CONSTRAINT `FK_1` FOREIGN KEY (`PRODAJA_ID`) REFERENCES `prodaja` (`PRODAJA_ID`),
  ADD CONSTRAINT `FK_2` FOREIGN KEY (`INSTRUMENT_ID`) REFERENCES `muzicki_instrument` (`INSTRUMENT_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
