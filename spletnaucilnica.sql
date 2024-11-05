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

INSERT INTO `naloge` (`id`, `ucenec_id`, `predmet_id`, `naslov`, `pot_do_datoteke`, `datum_oddaje`) VALUES
(1, 8, 3, 'prilagojeno-učenje.pdf', '', '2024-11-04 23:28:55'),
(2, 8, 3, 'prilagojeno-učenje.pdf', '', '2024-11-04 23:37:10'),
(3, 8, 3, 'prilagojeno-učenje.pdf', 'uploads/assignments/prilagojeno-učenje.pdf', '2024-11-04 23:39:22'),
(4, 8, 3, 'prilagojeno-učenje.pdf', 'uploads/assignments/prilagojeno-učenje.pdf', '2024-11-04 23:43:41'),
(5, 8, 2, 'SloSkills2024_Naloga_v_0_1_160', 'uploads/assignments/SloSkills2024_Naloga_v_0_1_16082024.pdf', '2024-11-04 23:49:28'),
(6, 8, 2, 'prilagojeno-učenje.pdf', 'uploads/assignments/prilagojeno-učenje.pdf', '2024-11-04 23:51:45'),
(7, 8, 2, 'prilagojeno-učenje.pdf', 'uploads/assignments/prilagojeno-učenje.pdf', '2024-11-04 23:51:48'),
(8, 8, 2, 'prilagojeno-učenje.pdf', 'uploads/assignments/prilagojeno-učenje.pdf', '2024-11-04 23:56:40'),
(9, 8, 2, 'prilagojeno-učenje.pdf', 'uploads/assignments/prilagojeno-učenje.pdf', '2024-11-04 23:57:36'),
(10, 8, 2, 'prilagojeno-učenje.pdf', 'uploads/assignments/prilagojeno-učenje.pdf', '2024-11-04 23:58:11'),
(11, 8, 2, 'prilagojeno-učenje.pdf', 'uploads/assignments/prilagojeno-učenje.pdf', '2024-11-04 23:58:35'),
(12, 8, 2, 'prilagojeno-učenje.pdf', 'uploads/assignments/prilagojeno-učenje.pdf', '2024-11-04 23:59:25'),
(13, 8, 2, 'prilagojeno-učenje.pdf', 'uploads/assignments/prilagojeno-učenje.pdf', '2024-11-05 00:00:21'),
(14, 8, 6, 'prilagojeno-učenje.pdf', 'uploads/assignments/prilagojeno-učenje.pdf', '2024-11-05 00:03:46'),
(15, 8, 6, 'prilagojeno-učenje.pdf', 'uploads/assignments/prilagojeno-učenje.pdf', '2024-11-05 00:23:02'),
(16, 8, 9, 'prilagojeno-učenje.pdf', 'uploads/assignments/prilagojeno-učenje.pdf', '2024-11-05 00:23:42'),
(17, 8, 4, 'p_1.pdf', 'uploads/assignments/p_1.pdf', '2024-11-05 00:31:25'),
(18, 8, 3, 'Juršinič Filip - meja.docx', '', '2024-11-05 02:11:08'),
(19, 8, 3, 'Juršinič Filip - meja.pdf', '', '2024-11-05 02:13:12');

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

INSERT INTO `ucenci_predmeti` (`id_predmeta`, `id_ucenca`) VALUES
(2, 3),
(2, 3),
(2, 3),
(2, 3),
(1, 10),
(8, 10),
(9, 10),
(1, 8),
(2, 8),
(3, 8),
(4, 8),
(5, 8);

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

INSERT INTO `ucenec` (`id`, `ime`, `priimek`, `email`, `username`, `geslo`) VALUES
(2, NULL, NULL, 'marl@dijak', NULL, '$2y$10$tFzbIYss/1akUBCfvo3By.a'),
(3, 'Ads', 'Mrh', 'ads1@dijak', NULL, '$2y$10$dLnbBIVwdyApmiJEnRmDzO9'),
(6, 'Filip', 'Juršinič', 'majmun@dijak', NULL, '$2y$10$Lj.EyiGnZrCREgKPq709we5'),
(7, 'Filip', 'Juršinič', 'miha@dijak', NULL, '$2y$10$5.N0ItY/c9fR.kgMji0I3ud'),
(8, 'Filip', 'Juršinič', 'maj@dijak', NULL, '0000'),
(9, 'Mark', 'Godec', 'drek@dijak', NULL, NULL),
(10, 'marko', 'marko', 'marko@dijak', NULL, 'marko');

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

INSERT INTO `ucitelj` (`id`, `ime`, `priimek`, `email`, `geslo`) VALUES
(1, NULL, NULL, 'filip@ucitelj', '$2y$10$qaoYbZ1LJAk1pxOHeJYrb.U'),
(2, 'Sara', 'Padarič', NULL, NULL),
(3, 'Botjan', 'Nub', 'nub@ucitelj', NULL),
(5, 'mrh', 'mrh', 'mrh@ucitelj', 'mrh');

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

INSERT INTO `ucitelji_predmeti` (`id_predmeta`, `id_ucitelja`) VALUES
(1, 2),
(1, 2),
(1, 2),
(3, 5),
(8, 5);

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
