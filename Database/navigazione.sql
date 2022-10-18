-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Ott 18, 2022 alle 20:46
-- Versione del server: 10.4.24-MariaDB
-- Versione PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `registro_navigazione`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `impiego`
--

CREATE TABLE `impiego` (
  `codice_fiscale` char(5) NOT NULL,
  `codice_viaggio` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `navi`
--

CREATE TABLE `navi` (
  `codice_nave` char(5) NOT NULL,
  `nome` varchar(20) DEFAULT NULL,
  `stazza` float DEFAULT NULL,
  `lunghezza` float DEFAULT NULL,
  `anno_costruzione` year(4) DEFAULT NULL,
  `potenza_motori` float DEFAULT NULL,
  `posti_occupabili` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `personale`
--

CREATE TABLE `personale` (
  `codice_fiscale` char(5) NOT NULL,
  `nome` varchar(20) DEFAULT NULL,
  `cognome` varchar(20) DEFAULT NULL,
  `citta_nascita` varchar(20) DEFAULT NULL,
  `data_nascita` date DEFAULT NULL,
  `ruolo` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `porto`
--

CREATE TABLE `porto` (
  `codice_porto` char(5) NOT NULL,
  `nome` varchar(30) DEFAULT NULL,
  `posti_barca` int(11) DEFAULT NULL,
  `latitudine` float DEFAULT NULL,
  `longitudine` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `porto_pa`
--

CREATE TABLE `porto_pa` (
  `codice_porto` char(5) NOT NULL,
  `codice_viaggio` char(5) NOT NULL,
  `tipo` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `trasmissione`
--

CREATE TABLE `trasmissione` (
  `codice_trasmissione` char(5) NOT NULL,
  `latitudine` float DEFAULT NULL,
  `longitudine` float DEFAULT NULL,
  `data_ora` datetime DEFAULT NULL,
  `direzione` float DEFAULT NULL,
  `velocita` float DEFAULT NULL,
  `note_appendice` tinytext DEFAULT NULL,
  `codice_viaggio` char(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `viaggio`
--

CREATE TABLE `viaggio` (
  `codice_viaggio` char(5) NOT NULL,
  `data_ora_p_a` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`data_ora_p_a`)),
  `peso_carico` float DEFAULT NULL,
  `codice_nave` char(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `impiego`
--
ALTER TABLE `impiego`
  ADD PRIMARY KEY (`codice_fiscale`,`codice_viaggio`),
  ADD KEY `codice_viaggio` (`codice_viaggio`);

--
-- Indici per le tabelle `navi`
--
ALTER TABLE `navi`
  ADD PRIMARY KEY (`codice_nave`);

--
-- Indici per le tabelle `personale`
--
ALTER TABLE `personale`
  ADD PRIMARY KEY (`codice_fiscale`);

--
-- Indici per le tabelle `porto`
--
ALTER TABLE `porto`
  ADD PRIMARY KEY (`codice_porto`);

--
-- Indici per le tabelle `porto_pa`
--
ALTER TABLE `porto_pa`
  ADD PRIMARY KEY (`codice_porto`,`codice_viaggio`),
  ADD KEY `codice_viaggio` (`codice_viaggio`);

--
-- Indici per le tabelle `trasmissione`
--
ALTER TABLE `trasmissione`
  ADD PRIMARY KEY (`codice_trasmissione`),
  ADD KEY `codice_viaggio` (`codice_viaggio`);

--
-- Indici per le tabelle `viaggio`
--
ALTER TABLE `viaggio`
  ADD PRIMARY KEY (`codice_viaggio`),
  ADD KEY `codice_nave` (`codice_nave`);

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `impiego`
--
ALTER TABLE `impiego`
  ADD CONSTRAINT `impiego_ibfk_1` FOREIGN KEY (`codice_fiscale`) REFERENCES `personale` (`codice_fiscale`),
  ADD CONSTRAINT `impiego_ibfk_2` FOREIGN KEY (`codice_viaggio`) REFERENCES `viaggio` (`codice_viaggio`);

--
-- Limiti per la tabella `porto_pa`
--
ALTER TABLE `porto_pa`
  ADD CONSTRAINT `porto_pa_ibfk_1` FOREIGN KEY (`codice_porto`) REFERENCES `porto` (`codice_porto`),
  ADD CONSTRAINT `porto_pa_ibfk_2` FOREIGN KEY (`codice_viaggio`) REFERENCES `viaggio` (`codice_viaggio`);

--
-- Limiti per la tabella `trasmissione`
--
ALTER TABLE `trasmissione`
  ADD CONSTRAINT `trasmissione_ibfk_1` FOREIGN KEY (`codice_viaggio`) REFERENCES `viaggio` (`codice_viaggio`);

--
-- Limiti per la tabella `viaggio`
--
ALTER TABLE `viaggio`
  ADD CONSTRAINT `viaggio_ibfk_1` FOREIGN KEY (`codice_nave`) REFERENCES `navi` (`codice_nave`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
