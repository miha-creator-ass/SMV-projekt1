-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gostitelj: 127.0.0.1
-- Čas nastanka: 05. nov 2024 ob 03.18
-- Različica strežnika: 10.4.32-MariaDB
-- Različica PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Zbirka podatkov: `spletnaucilnica`
--

-- --------------------------------------------------------

--
-- Struktura tabele `administrator`
--

CREATE TABLE `administrator` (
  `id` int(11) NOT NULL,
  `ime` varchar(30) DEFAULT NULL,
  `priimek` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `geslo` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Odloži podatke za tabelo `administrator`
--

INSERT INTO `administrator` (`id`, `ime`, `priimek`, `email`, `geslo`) VALUES
(1, 'admin', 'admin', 'admin@admin', 'admin');

-- --------------------------------------------------------

--
-- Struktura tabele `gradiva`
--

CREATE TABLE `gradiva` (
  `id` int(11) NOT NULL,
  `predmet_id` int(11) DEFAULT NULL,
  `ucitelj_id` int(11) DEFAULT NULL,
  `naslov` varchar(30) DEFAULT NULL,
  `pot_do_datoteke` varchar(255) NOT NULL,
  `datum_nalaganja` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabele `naloge`
--

CREATE TABLE `naloge` (
  `id` int(11) NOT NULL,
  `ucenec_id` int(11) DEFAULT NULL,
  `predmet_id` int(11) DEFAULT NULL,
  `naslov` varchar(30) DEFAULT NULL,
  `pot_do_datoteke` varchar(255) NOT NULL,
  `datum_oddaje` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Odloži podatke za tabelo `naloge`
--

-- --------------------------------------------------------

--
-- Struktura tabele `predmet`
--

CREATE TABLE `predmet` (
  `id` int(11) NOT NULL,
  `naziv` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Odloži podatke za tabelo `predmet`
--

INSERT INTO `predmet` (`id`, `naziv`) VALUES
(1, 'Slovenščina'),
(2, 'Matematika'),
(3, 'Angleščina'),
(4, 'Računalniško oblikovanje'),
(5, 'Stroka moderne vsebine'),
(6, 'Napredna uporaba baz'),
(7, 'Računalniški praktikum'),
(8, 'Uporaba IKT pri poslovanju'),
(9, 'Sociologija'),
(10, 'Športna vzgoja'),
(11, 'Športna vzgoja');

-- --------------------------------------------------------

--
-- Struktura tabele `ucenci_predmeti`
--

CREATE TABLE `ucenci_predmeti` (
  `id_predmeta` int(11) DEFAULT NULL,
  `id_ucenca` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Odloži podatke za tabelo `ucenci_predmeti`
--

-- --------------------------------------------------------

--
-- Struktura tabele `ucenec`
--

CREATE TABLE `ucenec` (
  `id` int(11) NOT NULL,
  `ime` varchar(30) DEFAULT NULL,
  `priimek` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `username` varchar(30) DEFAULT NULL,
  `geslo` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Odloži podatke za tabelo `ucenec`
--

-- --------------------------------------------------------

--
-- Struktura tabele `ucitelj`
--

CREATE TABLE `ucitelj` (
  `id` int(11) NOT NULL,
  `ime` varchar(30) DEFAULT NULL,
  `priimek` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `geslo` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Odloži podatke za tabelo `ucitelj`
--

-- --------------------------------------------------------

--
-- Struktura tabele `ucitelji_predmeti`
--

CREATE TABLE `ucitelji_predmeti` (
  `id_predmeta` int(11) DEFAULT NULL,
  `id_ucitelja` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Odloži podatke za tabelo `ucitelji_predmeti`
--

--
-- Indeksi zavrženih tabel
--

--
-- Indeksi tabele `administrator`
--
ALTER TABLE `administrator`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indeksi tabele `gradiva`
--
ALTER TABLE `gradiva`
  ADD PRIMARY KEY (`id`),
  ADD KEY `predmet_id` (`predmet_id`),
  ADD KEY `ucitelj_id` (`ucitelj_id`);

--
-- Indeksi tabele `naloge`
--
ALTER TABLE `naloge`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ucenec` (`ucenec_id`),
  ADD KEY `fk_predmet` (`predmet_id`);

--
-- Indeksi tabele `predmet`
--
ALTER TABLE `predmet`
  ADD PRIMARY KEY (`id`);

--
-- Indeksi tabele `ucenci_predmeti`
--
ALTER TABLE `ucenci_predmeti`
  ADD KEY `id_predmeta` (`id_predmeta`),
  ADD KEY `id_ucenca` (`id_ucenca`);

--
-- Indeksi tabele `ucenec`
--
ALTER TABLE `ucenec`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `unique_email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indeksi tabele `ucitelj`
--
ALTER TABLE `ucitelj`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indeksi tabele `ucitelji_predmeti`
--
ALTER TABLE `ucitelji_predmeti`
  ADD KEY `id_predmeta` (`id_predmeta`),
  ADD KEY `id_ucitelja` (`id_ucitelja`);

--
-- AUTO_INCREMENT zavrženih tabel
--

--
-- AUTO_INCREMENT tabele `administrator`
--
ALTER TABLE `administrator`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT tabele `gradiva`
--
ALTER TABLE `gradiva`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT tabele `naloge`
--
ALTER TABLE `naloge`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT tabele `predmet`
--
ALTER TABLE `predmet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT tabele `ucenec`
--
ALTER TABLE `ucenec`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT tabele `ucitelj`
--
ALTER TABLE `ucitelj`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Omejitve tabel za povzetek stanja
--

--
-- Omejitve za tabelo `gradiva`
--
ALTER TABLE `gradiva`
  ADD CONSTRAINT `gradiva_ibfk_1` FOREIGN KEY (`predmet_id`) REFERENCES `predmet` (`id`),
  ADD CONSTRAINT `gradiva_ibfk_2` FOREIGN KEY (`ucitelj_id`) REFERENCES `ucitelj` (`id`);

--
-- Omejitve za tabelo `naloge`
--
ALTER TABLE `naloge`
  ADD CONSTRAINT `fk_predmet` FOREIGN KEY (`predmet_id`) REFERENCES `predmet` (`id`),
  ADD CONSTRAINT `fk_ucenec` FOREIGN KEY (`ucenec_id`) REFERENCES `ucenec` (`id`),
  ADD CONSTRAINT `naloge_ibfk_1` FOREIGN KEY (`ucenec_id`) REFERENCES `ucenec` (`id`),
  ADD CONSTRAINT `naloge_ibfk_2` FOREIGN KEY (`predmet_id`) REFERENCES `predmet` (`id`);

--
-- Omejitve za tabelo `ucenci_predmeti`
--
ALTER TABLE `ucenci_predmeti`
  ADD CONSTRAINT `ucenci_predmeti_ibfk_1` FOREIGN KEY (`id_predmeta`) REFERENCES `predmet` (`id`),
  ADD CONSTRAINT `ucenci_predmeti_ibfk_2` FOREIGN KEY (`id_ucenca`) REFERENCES `ucenec` (`id`);

--
-- Omejitve za tabelo `ucitelji_predmeti`
--
ALTER TABLE `ucitelji_predmeti`
  ADD CONSTRAINT `ucitelji_predmeti_ibfk_1` FOREIGN KEY (`id_predmeta`) REFERENCES `predmet` (`id`),
  ADD CONSTRAINT `ucitelji_predmeti_ibfk_2` FOREIGN KEY (`id_ucitelja`) REFERENCES `ucitelj` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
