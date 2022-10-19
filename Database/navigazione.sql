-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Ott 19, 2022 alle 11:38
-- Versione del server: 10.4.20-MariaDB
-- Versione PHP: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `navigazione`
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

--
-- Dump dei dati per la tabella `navi`
--

INSERT INTO `navi` (`codice_nave`, `nome`, `stazza`, `lunghezza`, `anno_costruzione`, `potenza_motori`, `posti_occupabili`) VALUES
('n0001', 'La Blanca', 2000, 300, 1999, 42, 100),
('n0002', 'Golden Fleece', 1500, 350, 2005, 30, 50);

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
  `nome_porto` varchar(60) NOT NULL,
  `citta` varchar(60) DEFAULT NULL,
  `posti_barca` int(11) DEFAULT NULL,
  `latitudine` float DEFAULT NULL,
  `longitudine` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `porto`
--

INSERT INTO `porto` (`codice_porto`, `nome_porto`, `citta`, `posti_barca`, `latitudine`, `longitudine`) VALUES
('p0001', 'Porto Palermo', 'Palermo', 200, 334, 334),
('p0002', 'Porto Genova', 'Genova', 300, 334, 334),
('p0003', 'Porto Venezia', 'Venezia', 270, 334, 334),
('p0004', 'Porto Napoli', 'Napoli', 250, 334, 334),
('p0005', 'Porto Civitavecchia', 'Civitavecchia', 290, 334, 334);

-- --------------------------------------------------------

--
-- Struttura della tabella `porto_pa`
--

CREATE TABLE `porto_pa` (
  `codice_porto` char(5) NOT NULL,
  `codice_viaggio` char(5) NOT NULL,
  `tipo` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `porto_pa`
--

INSERT INTO `porto_pa` (`codice_porto`, `codice_viaggio`, `tipo`) VALUES
('p0001', '00001', 'partenza'),
('p0001', '00006', 'arrivo'),
('p0002', '00002', 'partenza'),
('p0003', '00003', 'partenza'),
('p0003', '00004', 'partenza'),
('p0003', '00005', 'arrivo'),
('p0004', '00002', 'arrivo'),
('p0004', '00005', 'partenza'),
('p0005', '00001', 'arrivo'),
('p0005', '00003', 'arrivo'),
('p0005', '00004', 'arrivo'),
('p0005', '00006', 'partenza');

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
  `prezzo` float NOT NULL,
  `codice_nave` char(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `viaggio`
--

INSERT INTO `viaggio` (`codice_viaggio`, `data_ora_p_a`, `peso_carico`, `prezzo`, `codice_nave`) VALUES
('00001', '{\n  \"data_part\":\"20 Ottobre\",\n  \"data_arri\": \"20 Ottobre\",\n  \"ora_part\": \"06:35\",\n  \"ora_arri\":\"23:00\" \n}', 1300, 39.99, 'n0001'),
('00002', '{\r\n  \"data_part\": \"10 Ottobre\",\r\n  \"data_arri\": \"10 Ottbre\",\r\n  \"ora_part\": \"07:40\",\r\n  \"ora_arri\": \"20:00\"\r\n}', 1000, 28.99, 'n0002'),
('00003', '{\r\n  \"data_part\": \"15 Ottobre\",\r\n  \"data_arri\": \"15 Ottbre\",\r\n  \"ora_part\": \"09:00\",\r\n  \"ora_arri\": \"10:00\"\r\n}', 900, 19.99, 'n0002'),
('00004', '{\r\n  \"data_part\": \"4 Marzo\",\r\n  \"data_arri\": \"5 Marzo\",\r\n  \"ora_part\": \"09:00\",\r\n  \"ora_arri\": \"10:00\"\r\n}', 1500, 59.99, 'n0002'),
('00005', '{\r\n  \"data_part\": \"4 Novembre\",\r\n  \"data_arri\": \"4 Novembre\",\r\n  \"ora_part\": \"14:00\",\r\n  \"ora_arri\": \"19:00\"\r\n}', 1300, 39.99, 'n0001'),
('00006', '{\r\n  \"data_part\": \"1 Settembre\",\r\n  \"data_arri\": \"1 Settembre\",\r\n  \"ora_part\": \"09:25\",\r\n  \"ora_arri\": \"18:00\"\r\n}', 1200, 44.99, 'n0002');

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
