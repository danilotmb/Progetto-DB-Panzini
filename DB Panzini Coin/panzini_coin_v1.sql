-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Giu 26, 2023 alle 15:56
-- Versione del server: 10.4.28-MariaDB
-- Versione PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `panzini_coin`
--
CREATE DATABASE IF NOT EXISTS `panzini_coin` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `panzini_coin`;

-- --------------------------------------------------------

--
-- Struttura della tabella `amministratore`
--

CREATE TABLE `amministratore` (
  `id_amministratore` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `cognome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `attivita`
--

CREATE TABLE `attivita` (
  `id_attivita` int(11) NOT NULL,
  `id_docente` int(11) DEFAULT NULL,
  `descrizione` varchar(255) NOT NULL,
  `durata` varchar(255) NOT NULL,
  `crediti_disponibili` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `beni_e_servizi`
--

CREATE TABLE `beni_e_servizi` (
  `id_bns` int(11) NOT NULL,
  `descrizione` varchar(255) NOT NULL,
  `crediti_richiesti` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `carico_crediti`
--

CREATE TABLE `carico_crediti` (
  `id_carico` int(11) NOT NULL,
  `id_utente` int(11) DEFAULT NULL,
  `id_attivita` int(11) DEFAULT NULL,
  `id_studente` int(11) DEFAULT NULL,
  `data_carico` date NOT NULL,
  `descrizione` varchar(255) DEFAULT NULL,
  `crediti_caricati` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `docenti`
--

CREATE TABLE `docenti` (
  `id_docente` int(11) NOT NULL,
  `id_utente` int(11) DEFAULT NULL,
  `nome` varchar(255) NOT NULL,
  `cognome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `materia` varchar(255) NOT NULL,
  `tutor` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `personale_scolastico`
--

CREATE TABLE `personale_scolastico` (
  `id_personale` int(11) NOT NULL,
  `id_bns` int(11) DEFAULT NULL,
  `id_utente` int(11) DEFAULT NULL,
  `nome` varchar(255) NOT NULL,
  `cognome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `registro_attivita`
--

CREATE TABLE `registro_attivita` (
  `id_registro` int(11) NOT NULL,
  `id_studente` int(11) DEFAULT NULL,
  `id_attivita` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `scarico_crediti`
--

CREATE TABLE `scarico_crediti` (
  `id_scarico` int(11) NOT NULL,
  `id_utente` int(11) DEFAULT NULL,
  `id_bns` int(11) DEFAULT NULL,
  `id_attivita` int(11) DEFAULT NULL,
  `id_studente` int(11) DEFAULT NULL,
  `data_scarico` date NOT NULL,
  `descrizione` varchar(255) DEFAULT NULL,
  `crediti_scaricati` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `scuole`
--

CREATE TABLE `scuole` (
  `id_scuola` int(11) NOT NULL,
  `id_amministratore` int(11) DEFAULT NULL,
  `nome` varchar(255) NOT NULL,
  `indirizzo` varchar(255) NOT NULL,
  `citta` varchar(255) NOT NULL,
  `stato` varchar(255) NOT NULL,
  `cap` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `studenti`
--

CREATE TABLE `studenti` (
  `id_studente` int(11) NOT NULL,
  `id_utente` int(11) DEFAULT NULL,
  `nome` varchar(255) NOT NULL,
  `cognome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `QR` blob NOT NULL,
  `panzini_coin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `utenti`
--

CREATE TABLE `utenti` (
  `id_utente` int(11) NOT NULL,
  `id_scuola` int(11) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `cognome` varchar(255) DEFAULT NULL,
  `ruolo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `amministratore`
--
ALTER TABLE `amministratore`
  ADD PRIMARY KEY (`id_amministratore`);

--
-- Indici per le tabelle `attivita`
--
ALTER TABLE `attivita`
  ADD PRIMARY KEY (`id_attivita`),
  ADD KEY `id_docente` (`id_docente`);

--
-- Indici per le tabelle `beni_e_servizi`
--
ALTER TABLE `beni_e_servizi`
  ADD PRIMARY KEY (`id_bns`);

--
-- Indici per le tabelle `carico_crediti`
--
ALTER TABLE `carico_crediti`
  ADD PRIMARY KEY (`id_carico`),
  ADD KEY `id_utente` (`id_utente`),
  ADD KEY `id_attivita` (`id_attivita`),
  ADD KEY `id_studente` (`id_studente`);

--
-- Indici per le tabelle `docenti`
--
ALTER TABLE `docenti`
  ADD PRIMARY KEY (`id_docente`),
  ADD KEY `id_utente` (`id_utente`);

--
-- Indici per le tabelle `personale_scolastico`
--
ALTER TABLE `personale_scolastico`
  ADD PRIMARY KEY (`id_personale`),
  ADD KEY `id_bns` (`id_bns`),
  ADD KEY `id_utente` (`id_utente`);

--
-- Indici per le tabelle `registro_attivita`
--
ALTER TABLE `registro_attivita`
  ADD PRIMARY KEY (`id_registro`),
  ADD KEY `id_studente` (`id_studente`),
  ADD KEY `id_attivita` (`id_attivita`);

--
-- Indici per le tabelle `scarico_crediti`
--
ALTER TABLE `scarico_crediti`
  ADD PRIMARY KEY (`id_scarico`),
  ADD KEY `id_utente` (`id_utente`),
  ADD KEY `id_bns` (`id_bns`),
  ADD KEY `id_attivita` (`id_attivita`),
  ADD KEY `id_studente` (`id_studente`);

--
-- Indici per le tabelle `scuole`
--
ALTER TABLE `scuole`
  ADD PRIMARY KEY (`id_scuola`),
  ADD KEY `id_amministratore` (`id_amministratore`);

--
-- Indici per le tabelle `studenti`
--
ALTER TABLE `studenti`
  ADD PRIMARY KEY (`id_studente`),
  ADD KEY `id_utente` (`id_utente`);

--
-- Indici per le tabelle `utenti`
--
ALTER TABLE `utenti`
  ADD PRIMARY KEY (`id_utente`),
  ADD KEY `id_scuola` (`id_scuola`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `amministratore`
--
ALTER TABLE `amministratore`
  MODIFY `id_amministratore` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `attivita`
--
ALTER TABLE `attivita`
  MODIFY `id_attivita` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `beni_e_servizi`
--
ALTER TABLE `beni_e_servizi`
  MODIFY `id_bns` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `carico_crediti`
--
ALTER TABLE `carico_crediti`
  MODIFY `id_carico` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `docenti`
--
ALTER TABLE `docenti`
  MODIFY `id_docente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `personale_scolastico`
--
ALTER TABLE `personale_scolastico`
  MODIFY `id_personale` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `registro_attivita`
--
ALTER TABLE `registro_attivita`
  MODIFY `id_registro` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `scarico_crediti`
--
ALTER TABLE `scarico_crediti`
  MODIFY `id_scarico` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `scuole`
--
ALTER TABLE `scuole`
  MODIFY `id_scuola` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `studenti`
--
ALTER TABLE `studenti`
  MODIFY `id_studente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `utenti`
--
ALTER TABLE `utenti`
  MODIFY `id_utente` int(11) NOT NULL AUTO_INCREMENT;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `attivita`
--
ALTER TABLE `attivita`
  ADD CONSTRAINT `attivita_ibfk_1` FOREIGN KEY (`id_docente`) REFERENCES `docenti` (`id_docente`);

--
-- Limiti per la tabella `carico_crediti`
--
ALTER TABLE `carico_crediti`
  ADD CONSTRAINT `carico_crediti_ibfk_1` FOREIGN KEY (`id_utente`) REFERENCES `utenti` (`id_utente`),
  ADD CONSTRAINT `carico_crediti_ibfk_2` FOREIGN KEY (`id_attivita`) REFERENCES `attivita` (`id_attivita`),
  ADD CONSTRAINT `carico_crediti_ibfk_3` FOREIGN KEY (`id_studente`) REFERENCES `studenti` (`id_studente`);

--
-- Limiti per la tabella `docenti`
--
ALTER TABLE `docenti`
  ADD CONSTRAINT `docenti_ibfk_1` FOREIGN KEY (`id_utente`) REFERENCES `utenti` (`id_utente`);

--
-- Limiti per la tabella `personale_scolastico`
--
ALTER TABLE `personale_scolastico`
  ADD CONSTRAINT `personale_scolastico_ibfk_1` FOREIGN KEY (`id_bns`) REFERENCES `beni_e_servizi` (`id_bns`),
  ADD CONSTRAINT `personale_scolastico_ibfk_2` FOREIGN KEY (`id_utente`) REFERENCES `utenti` (`id_utente`);

--
-- Limiti per la tabella `registro_attivita`
--
ALTER TABLE `registro_attivita`
  ADD CONSTRAINT `registro_attivita_ibfk_1` FOREIGN KEY (`id_studente`) REFERENCES `studenti` (`id_studente`),
  ADD CONSTRAINT `registro_attivita_ibfk_2` FOREIGN KEY (`id_attivita`) REFERENCES `attivita` (`id_attivita`);

--
-- Limiti per la tabella `scarico_crediti`
--
ALTER TABLE `scarico_crediti`
  ADD CONSTRAINT `scarico_crediti_ibfk_1` FOREIGN KEY (`id_utente`) REFERENCES `utenti` (`id_utente`),
  ADD CONSTRAINT `scarico_crediti_ibfk_2` FOREIGN KEY (`id_bns`) REFERENCES `beni_e_servizi` (`id_bns`),
  ADD CONSTRAINT `scarico_crediti_ibfk_3` FOREIGN KEY (`id_attivita`) REFERENCES `attivita` (`id_attivita`),
  ADD CONSTRAINT `scarico_crediti_ibfk_4` FOREIGN KEY (`id_studente`) REFERENCES `studenti` (`id_studente`);

--
-- Limiti per la tabella `scuole`
--
ALTER TABLE `scuole`
  ADD CONSTRAINT `scuole_ibfk_1` FOREIGN KEY (`id_amministratore`) REFERENCES `amministratore` (`id_amministratore`);

--
-- Limiti per la tabella `studenti`
--
ALTER TABLE `studenti`
  ADD CONSTRAINT `studenti_ibfk_1` FOREIGN KEY (`id_utente`) REFERENCES `utenti` (`id_utente`);

--
-- Limiti per la tabella `utenti`
--
ALTER TABLE `utenti`
  ADD CONSTRAINT `utenti_ibfk_1` FOREIGN KEY (`id_scuola`) REFERENCES `scuole` (`id_scuola`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
