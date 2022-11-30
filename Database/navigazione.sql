-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Nov 30, 2022 alle 17:59
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
-- Database: `navigazione`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `impiego`
--

CREATE TABLE `impiego` (
  `codice_fiscale` char(16) NOT NULL,
  `codice_viaggio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `navi`
--

CREATE TABLE `navi` (
  `codice_nave` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
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
(1, 'La Blanca', 2000, 300, 1999, 42, 100),
(2, 'Golden Fleece', 1500, 350, 2005, 30, 50);

-- --------------------------------------------------------

--
-- Struttura della tabella `personale`
--

CREATE TABLE `personale` (
  `codice_fiscale` char(16) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `cognome` varchar(255) DEFAULT NULL,
  `citta_nascita` varchar(255) DEFAULT NULL,
  `data_nascita` date DEFAULT NULL,
  `ruolo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `porto`
--

CREATE TABLE `porto` (
  `codice_porto` int(11) NOT NULL,
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
(1, 'Porto Palermo', 'Palermo', 200, 334, 334),
(2, 'Porto Genova', 'Genova', 300, 334, 334),
(3, 'Porto Venezia', 'Venezia', 270, 334, 334),
(4, 'Porto Napoli', 'Napoli', 250, 334, 334),
(5, 'Porto Civitavecchia', 'Civitavecchia', 290, 334, 334);

-- --------------------------------------------------------

--
-- Struttura della tabella `porto_pa`
--

CREATE TABLE `porto_pa` (
  `codice_porto` int(11) NOT NULL,
  `codice_viaggio` int(11) NOT NULL,
  `tipo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `porto_pa`
--

INSERT INTO `porto_pa` (`codice_porto`, `codice_viaggio`, `tipo`) VALUES
(1, 1, 'partenza'),
(1, 6, 'arrivo'),
(2, 2, 'partenza'),
(3, 3, 'partenza'),
(3, 4, 'partenza'),
(3, 5, 'arrivo'),
(4, 2, 'arrivo'),
(4, 5, 'partenza'),
(5, 1, 'arrivo'),
(5, 3, 'arrivo'),
(5, 4, 'arrivo'),
(5, 6, 'partenza');

-- --------------------------------------------------------

--
-- Struttura della tabella `trasmissione`
--

CREATE TABLE `trasmissione` (
  `codice_trasmissione` int(11) NOT NULL,
  `latitudine` float DEFAULT NULL,
  `longitudine` float DEFAULT NULL,
  `data_ora` datetime DEFAULT NULL,
  `direzione` float DEFAULT NULL,
  `velocita` float DEFAULT NULL,
  `note_appendice` tinytext DEFAULT NULL,
  `codice_viaggio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `utenti`
--

CREATE TABLE `utenti` (
  `id_utente` int(3) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `cognome` varchar(255) NOT NULL,
  `telefono` varchar(30) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `utenti`
--

INSERT INTO `utenti` (`id_utente`, `nome`, `cognome`, `telefono`, `username`, `password`) VALUES
(0, '', '', '', 'admin', 'admin'),
(1, 'Marco', 'Rossi', '4035065404', 'marcorossi', 'Marco.Rossi@'),
(2, 'Giovanni', 'Gialli', '4593045964', 'giovannigialli', 'Giovanni.Gialli@');

-- --------------------------------------------------------

--
-- Struttura della tabella `viaggio`
--

CREATE TABLE `viaggio` (
  `codice_viaggio` int(11) NOT NULL,
  `data_ora_p_a` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`data_ora_p_a`)),
  `peso_carico` float DEFAULT NULL,
  `prezzo` float NOT NULL,
  `codice_navi` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `viaggio`
--

INSERT INTO `viaggio` (`codice_viaggio`, `data_ora_p_a`, `peso_carico`, `prezzo`, `codice_navi`) VALUES
(1, '{\n  \"data_part\":\"2022/10/20\",\n  \"data_arri\": \"2022/10/20\",\n  \"ora_part\": \"06:35\",\n  \"ora_arri\":\"23:00\" \n}', 1300, 39.99, 1),
(2, '{\n  \"data_part\": \"2022/10/10\",\n  \"data_arri\": \"2022/10/12\",\n  \"ora_part\": \"07:40\",\n  \"ora_arri\": \"20:00\"\n}', 1000, 28.99, 2),
(3, '{\n  \"data_part\": \"2022/10/15\",\n  \"data_arri\": \"2022/10/15\",\n  \"ora_part\": \"09:00\",\n  \"ora_arri\": \"10:00\"\n}', 900, 19.99, 2),
(4, '{\n  \"data_part\": \"2022/03/04\",\n  \"data_arri\": \"2022/03/05\",\n  \"ora_part\": \"09:00\",\n  \"ora_arri\": \"10:00\"\n}', 1500, 59.99, 2),
(5, '{\n  \"data_part\": \"2022/11/04\",\n  \"data_arri\": \"2022/11/04\",\n  \"ora_part\": \"14:00\",\n  \"ora_arri\": \"19:00\"\n}', 1300, 39.99, 1),
(6, '{\n  \"data_part\": \"2022/09/01\",\n  \"data_arri\": \"2022/09/01\",\n  \"ora_part\": \"09:25\",\n  \"ora_arri\": \"18:00\"\n}', 1200, 44.99, 2);

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
-- Indici per le tabelle `utenti`
--
ALTER TABLE `utenti`
  ADD PRIMARY KEY (`id_utente`),
  ADD UNIQUE KEY `telefono` (`telefono`),
  ADD UNIQUE KEY `email` (`username`);

--
-- Indici per le tabelle `viaggio`
--
ALTER TABLE `viaggio`
  ADD PRIMARY KEY (`codice_viaggio`),
  ADD KEY `codice_navi` (`codice_navi`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `navi`
--
ALTER TABLE `navi`
  MODIFY `codice_nave` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `porto`
--
ALTER TABLE `porto`
  MODIFY `codice_porto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT per la tabella `trasmissione`
--
ALTER TABLE `trasmissione`
  MODIFY `codice_trasmissione` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `viaggio`
--
ALTER TABLE `viaggio`
  MODIFY `codice_viaggio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
  ADD CONSTRAINT `codice_viaggio` FOREIGN KEY (`codice_viaggio`) REFERENCES `viaggio` (`codice_viaggio`);

--
-- Limiti per la tabella `viaggio`
--
ALTER TABLE `viaggio`
  ADD CONSTRAINT `viaggio_ibfk_1` FOREIGN KEY (`codice_navi`) REFERENCES `navi` (`codice_nave`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
