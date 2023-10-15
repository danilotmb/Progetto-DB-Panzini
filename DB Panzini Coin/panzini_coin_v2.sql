-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 28, 2023 at 12:20 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

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

-- --------------------------------------------------------

--
-- Table structure for table `accredito_crediti`
--

CREATE TABLE `accredito_crediti` (
  `id` int(11) NOT NULL,
  `id_attivita` int(11) DEFAULT NULL,
  `id_personalescolastico` int(11) DEFAULT NULL,
  `id_studente` int(11) DEFAULT NULL,
  `data_accredito` date NOT NULL,
  `descrizione` varchar(255) NOT NULL,
  `crediti_accreditati` int(11) NOT NULL CHECK (`crediti_accreditati` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accredito_crediti`
--

INSERT INTO `accredito_crediti` (`id`, `id_attivita`, `id_personalescolastico`, `id_studente`, `data_accredito`, `descrizione`, `crediti_accreditati`) VALUES
(1, 1, 1, 1, '2023-06-25', 'Crediti assegnati per laboratorio di Matematica', 5),
(2, 2, 2, 2, '2023-06-25', 'Crediti assegnati per lettura e analisi di un romanzo', 3),
(3, 3, 3, 3, '2023-06-26', 'Crediti assegnati per visita a un museo storico', 8),
(4, 4, 4, 2, '2023-06-25', 'Crediti assegnati per esperimenti di chimica', 6),
(5, 5, 5, 1, '2023-06-27', 'Crediti assegnati per lezioni di conversazione in inglese', 4);

-- --------------------------------------------------------

--
-- Table structure for table `addebito_crediti`
--

CREATE TABLE `addebito_crediti` (
  `id` int(11) NOT NULL,
  `id_bns` int(11) DEFAULT NULL,
  `id_personalescolastico` int(11) DEFAULT NULL,
  `id_studente` int(11) DEFAULT NULL,
  `data_addebito` date NOT NULL,
  `descrizione` varchar(255) NOT NULL,
  `crediti_addebitati` int(11) NOT NULL CHECK (`crediti_addebitati` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `addebito_crediti`
--

INSERT INTO `addebito_crediti` (`id`, `id_bns`, `id_personalescolastico`, `id_studente`, `data_addebito`, `descrizione`, `crediti_addebitati`) VALUES
(1, 1, 4, 1, '2023-06-25', 'Acquisto libro di testo', 10),
(2, 2, 5, 2, '2023-06-25', 'Acquisto materiale laboratorio', 5),
(3, 3, 4, 3, '2023-06-25', 'Accesso piattaforma e-learning', 15),
(4, 4, 2, 1, '2023-06-25', 'Escursione scolastica', 20),
(5, 5, 1, 2, '2023-06-25', 'Attività sportiva', 10);

-- --------------------------------------------------------

--
-- Table structure for table `amministratore`
--

CREATE TABLE `amministratore` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `cognome` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `amministratore`
--

INSERT INTO `amministratore` (`id`, `nome`, `cognome`, `email`, `password`) VALUES
(1, 'Giuseppe', 'Verdi', 'giuseppe.verdi@gmail.com', 'password123'),
(2, 'Maria', 'Rossi', 'maria.rossi@gmail.com', 'securepassword');

-- --------------------------------------------------------

--
-- Table structure for table `attivita_didattiche`
--

CREATE TABLE `attivita_didattiche` (
  `id` int(11) NOT NULL,
  `id_docente` int(11) DEFAULT NULL,
  `nome` varchar(50) NOT NULL,
  `descrizione` varchar(255) NOT NULL,
  `durata` int(11) NOT NULL,
  `crediti_disponibili` int(11) NOT NULL CHECK (`crediti_disponibili` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attivita_didattiche`
--

INSERT INTO `attivita_didattiche` (`id`, `id_docente`, `nome`, `descrizione`, `durata`, `crediti_disponibili`) VALUES
(1, 1, 'Laboratorio di Matematica', 'Laboratorio pratico per sviluppare competenze matematiche', 120, 5),
(2, 2, 'Lettura e analisi di un romanzo', 'Attività di lettura e analisi critica di un romanzo', 90, 3),
(3, 2, 'Visita a un museo storico', 'Visita guidata a un museo storico', 180, 8),
(4, 1, 'Esperimenti di chimica', 'Attività di laboratorio per esperimenti chimici', 120, 6),
(5, 2, 'Lezioni di conversazione in inglese', 'Lezioni pratiche di conversazione in lingua inglese', 90, 4);

-- --------------------------------------------------------

--
-- Table structure for table `beni_servizi`
--

CREATE TABLE `beni_servizi` (
  `id` int(11) NOT NULL,
  `descrizione` varchar(255) NOT NULL,
  `crediti_richiesti` int(11) NOT NULL CHECK (`crediti_richiesti` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `beni_servizi`
--

INSERT INTO `beni_servizi` (`id`, `descrizione`, `crediti_richiesti`) VALUES
(1, 'Libro di testo', 10),
(2, 'Materiale laboratorio', 5),
(3, 'Accesso piattaforma e-learning', 15),
(4, 'Escursione scolastica', 20),
(5, 'Attività sportiva', 10);

-- --------------------------------------------------------

--
-- Table structure for table `classi`
--

CREATE TABLE `classi` (
  `id` int(11) NOT NULL,
  `id_docente` int(11) DEFAULT NULL,
  `anno_scolastico` varchar(10) NOT NULL,
  `sezione` varchar(10) NOT NULL,
  `indirizzo_corso` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `classi`
--

INSERT INTO `classi` (`id`, `id_docente`, `anno_scolastico`, `sezione`, `indirizzo_corso`) VALUES
(1, 1, '2022/2023', 'A', 'Tradizionale'),
(2, 2, '2022/2023', 'B', 'Scienze Applicate');

-- --------------------------------------------------------

--
-- Table structure for table `docenti`
--

CREATE TABLE `docenti` (
  `id` int(11) NOT NULL,
  `id_personalescolastico` int(11) DEFAULT NULL,
  `nome` varchar(50) NOT NULL,
  `cognome` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `materia` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `docenti`
--

INSERT INTO `docenti` (`id`, `id_personalescolastico`, `nome`, `cognome`, `email`, `password`, `materia`) VALUES
(1, 4, 'Marco', 'Russo', 'marco.russo@gmail.com', 'pass123', 'Matematica'),
(2, 5, 'Giulia', 'Ferrari', 'giulia.ferrari@gmail.com', 'p@ssw0rd', 'Italiano');

-- --------------------------------------------------------

--
-- Table structure for table `gruppi_competenze`
--

CREATE TABLE `gruppi_competenze` (
  `id` int(11) NOT NULL,
  `id_tutor` int(11) DEFAULT NULL,
  `nome` varchar(50) NOT NULL,
  `descrizione` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gruppi_competenze`
--

INSERT INTO `gruppi_competenze` (`id`, `id_tutor`, `nome`, `descrizione`) VALUES
(1, 1, 'Gruppo Matematica', 'Gruppo di competenze in Matematica'),
(2, 1, 'Gruppo Scienze', 'Gruppo di competenze in Scienze');

-- --------------------------------------------------------

--
-- Table structure for table `personale_scolastico`
--

CREATE TABLE `personale_scolastico` (
  `id` int(11) NOT NULL,
  `id_utente` int(11) DEFAULT NULL,
  `nome` varchar(50) NOT NULL,
  `cognome` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `ruolo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `personale_scolastico`
--

INSERT INTO `personale_scolastico` (`id`, `id_utente`, `nome`, `cognome`, `email`, `password`, `ruolo`) VALUES
(1, 1, 'Mario', 'Rossi', 'mario.rossi@gmail.com', 'password123', 'Segretario'),
(2, 2, 'Luca', 'Bianchi', 'luca.bianchi@gmail.com', 'securepassword', 'Tecnico Laboratorio'),
(3, 3, 'Laura', 'Verdi', 'laura.verdi@gmail.com', '12345678', 'Biblioteca'),
(4, 4, 'Marco', 'Russo', 'marco.russo@gmail.com', 'pass123', 'Insegnante'),
(5, 5, 'Giulia', 'Ferrari', 'giulia.ferrari@gmail.com', 'p@ssw0rd', 'Insegnante');

-- --------------------------------------------------------

--
-- Table structure for table `registro_attivita`
--

CREATE TABLE `registro_attivita` (
  `id` int(11) NOT NULL,
  `id_personalescolastico` int(11) DEFAULT NULL,
  `id_studente` int(11) DEFAULT NULL,
  `id_attivita` int(11) DEFAULT NULL,
  `tipo_transazione` varchar(255) NOT NULL,
  `data_transazione` date NOT NULL,
  `crediti` int(11) NOT NULL CHECK (`crediti` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `registro_attivita`
--

INSERT INTO `registro_attivita` (`id`, `id_personalescolastico`, `id_studente`, `id_attivita`, `tipo_transazione`, `data_transazione`, `crediti`) VALUES
(1, 1, 1, 1, 'Assegnazione', '2023-06-26', 5),
(2, 2, 2, 2, 'Assegnazione', '2023-06-26', 3),
(3, 3, 3, 3, 'Assegnazione', '2023-06-26', 8),
(4, 4, 3, 4, 'Assegnazione', '2023-06-26', 6),
(5, 5, 2, 5, 'Assegnazione', '2023-06-26', 4);

-- --------------------------------------------------------

--
-- Table structure for table `scuole`
--

CREATE TABLE `scuole` (
  `id` int(11) NOT NULL,
  `id_amministratore` int(11) DEFAULT NULL,
  `nome` varchar(100) NOT NULL,
  `indirizzo` varchar(100) NOT NULL,
  `città` varchar(50) NOT NULL,
  `stato` varchar(50) NOT NULL,
  `cap` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `scuole`
--

INSERT INTO `scuole` (`id`, `id_amministratore`, `nome`, `indirizzo`, `città`, `stato`, `cap`) VALUES
(1, 1, 'Scuola Elementare', 'Via Roma 1', 'Milano', 'Italia', '20100'),
(2, 2, 'Scuola Media', 'Via Verdi 5', 'Roma', 'Italia', '00100'),
(3, 1, 'Liceo Scientifico', 'Via Garibaldi 10', 'Napoli', 'Italia', '80100'),
(4, 1, 'Istituto Tecnico', 'Corso Italia 20', 'Torino', 'Italia', '10100'),
(5, 2, 'Scuola Professionale', 'Via Mazzini 15', 'Firenze', 'Italia', '50100');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` int(11) NOT NULL,
  `id_personalescolastico` int(11) DEFAULT NULL,
  `id_bns` int(11) DEFAULT NULL,
  `nome` varchar(50) NOT NULL,
  `cognome` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `ruolo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `id_personalescolastico`, `id_bns`, `nome`, `cognome`, `email`, `password`, `ruolo`) VALUES
(1, 1, 1, 'Mario', 'Rossi', 'mario.rossi@gmail.com', 'password123', 'Segretario'),
(2, 2, 2, 'Luca', 'Bianchi', 'luca.bianchi@gmail.com', 'securepassword', 'Tecnico Laboratorio'),
(3, 3, 3, 'Laura', 'Verdi', 'laura.verdi@gmail.com', '12345678', 'Bibloteca');

-- --------------------------------------------------------

--
-- Table structure for table `studenti`
--

CREATE TABLE `studenti` (
  `id` int(11) NOT NULL,
  `id_utente` int(11) DEFAULT NULL,
  `id_tutor` int(11) DEFAULT NULL,
  `id_gruppo` int(11) DEFAULT NULL,
  `id_classe` int(11) DEFAULT NULL,
  `nome` varchar(50) NOT NULL,
  `cognome` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `qr_code` blob NOT NULL,
  `panzini_coin` int(11) NOT NULL CHECK (`panzini_coin` >= 0),
  `competenze_assegnate` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `studenti`
--

INSERT INTO `studenti` (`id`, `id_utente`, `id_tutor`, `id_gruppo`, `id_classe`, `nome`, `cognome`, `email`, `password`, `qr_code`, `panzini_coin`, `competenze_assegnate`) VALUES
(1, 6, 1, 1, 1, 'Luca', 'Rossi', 'luca.rossi@gmail.com', 'password123', 0x71725f636f64655f64617461, 100, 'Matematica, Fisica'),
(2, 7, 1, 2, 1, 'Simone', 'Bianchi', 'simone.bianchi@gmail.com', 'securepassword', 0x71725f636f64655f64617461, 80, 'Chimica, Biologia'),
(3, 8, 1, 2, 2, 'Giulia', 'Verdi', 'giulia.verdi@gmail.com', '12345678', 0x71725f636f64655f64617461, 120, 'Anatomia, Geologia');

-- --------------------------------------------------------

--
-- Table structure for table `tutor`
--

CREATE TABLE `tutor` (
  `id` int(11) NOT NULL,
  `id_docente` int(11) DEFAULT NULL,
  `numerostudentiassegnati` int(11) NOT NULL CHECK (`numerostudentiassegnati` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tutor`
--

INSERT INTO `tutor` (`id`, `id_docente`, `numerostudentiassegnati`) VALUES
(1, 1, 10);

-- --------------------------------------------------------

--
-- Table structure for table `utenti`
--

CREATE TABLE `utenti` (
  `id` int(11) NOT NULL,
  `id_scuola` int(11) DEFAULT NULL,
  `nome` varchar(50) NOT NULL,
  `cognome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `utenti`
--

INSERT INTO `utenti` (`id`, `id_scuola`, `nome`, `cognome`) VALUES
(1, 1, 'Mario', 'Rossi'),
(2, 2, 'Luca', 'Bianchi'),
(3, 1, 'Laura', 'Verdi'),
(4, 3, 'Marco', 'Russo'),
(5, 2, 'Giulia', 'Ferrari'),
(6, 1, 'Luca', 'Rossi'),
(7, 1, 'Simone', 'Bianchi'),
(8, 1, 'Giulia', 'Verdi');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accredito_crediti`
--
ALTER TABLE `accredito_crediti`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_attivita` (`id_attivita`),
  ADD KEY `id_personalescolastico` (`id_personalescolastico`),
  ADD KEY `id_studente` (`id_studente`);

--
-- Indexes for table `addebito_crediti`
--
ALTER TABLE `addebito_crediti`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_bns` (`id_bns`),
  ADD KEY `id_personalescolastico` (`id_personalescolastico`),
  ADD KEY `id_studente` (`id_studente`);

--
-- Indexes for table `amministratore`
--
ALTER TABLE `amministratore`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_email` (`email`);

--
-- Indexes for table `attivita_didattiche`
--
ALTER TABLE `attivita_didattiche`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_docente` (`id_docente`);

--
-- Indexes for table `beni_servizi`
--
ALTER TABLE `beni_servizi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `classi`
--
ALTER TABLE `classi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_docente` (`id_docente`);

--
-- Indexes for table `docenti`
--
ALTER TABLE `docenti`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_email` (`email`),
  ADD KEY `id_personalescolastico` (`id_personalescolastico`);

--
-- Indexes for table `gruppi_competenze`
--
ALTER TABLE `gruppi_competenze`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_tutor` (`id_tutor`);

--
-- Indexes for table `personale_scolastico`
--
ALTER TABLE `personale_scolastico`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_email` (`email`),
  ADD KEY `id_utente` (`id_utente`);

--
-- Indexes for table `registro_attivita`
--
ALTER TABLE `registro_attivita`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_personalescolastico` (`id_personalescolastico`),
  ADD KEY `id_studente` (`id_studente`),
  ADD KEY `id_attivita` (`id_attivita`);

--
-- Indexes for table `scuole`
--
ALTER TABLE `scuole`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_amministratore` (`id_amministratore`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_email` (`email`),
  ADD KEY `id_personalescolastico` (`id_personalescolastico`),
  ADD KEY `id_bns` (`id_bns`);

--
-- Indexes for table `studenti`
--
ALTER TABLE `studenti`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_email` (`email`),
  ADD KEY `id_utente` (`id_utente`),
  ADD KEY `id_tutor` (`id_tutor`),
  ADD KEY `id_gruppo` (`id_gruppo`),
  ADD KEY `id_classe` (`id_classe`);

--
-- Indexes for table `tutor`
--
ALTER TABLE `tutor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_docente` (`id_docente`);

--
-- Indexes for table `utenti`
--
ALTER TABLE `utenti`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_scuola` (`id_scuola`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accredito_crediti`
--
ALTER TABLE `accredito_crediti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `addebito_crediti`
--
ALTER TABLE `addebito_crediti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `amministratore`
--
ALTER TABLE `amministratore`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `attivita_didattiche`
--
ALTER TABLE `attivita_didattiche`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `beni_servizi`
--
ALTER TABLE `beni_servizi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `classi`
--
ALTER TABLE `classi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `docenti`
--
ALTER TABLE `docenti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `gruppi_competenze`
--
ALTER TABLE `gruppi_competenze`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `personale_scolastico`
--
ALTER TABLE `personale_scolastico`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `registro_attivita`
--
ALTER TABLE `registro_attivita`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `scuole`
--
ALTER TABLE `scuole`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `studenti`
--
ALTER TABLE `studenti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tutor`
--
ALTER TABLE `tutor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `utenti`
--
ALTER TABLE `utenti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accredito_crediti`
--
ALTER TABLE `accredito_crediti`
  ADD CONSTRAINT `accredito_crediti_ibfk_1` FOREIGN KEY (`id_attivita`) REFERENCES `attivita_didattiche` (`id`),
  ADD CONSTRAINT `accredito_crediti_ibfk_2` FOREIGN KEY (`id_personalescolastico`) REFERENCES `personale_scolastico` (`id`),
  ADD CONSTRAINT `accredito_crediti_ibfk_3` FOREIGN KEY (`id_studente`) REFERENCES `studenti` (`id`);

--
-- Constraints for table `addebito_crediti`
--
ALTER TABLE `addebito_crediti`
  ADD CONSTRAINT `addebito_crediti_ibfk_1` FOREIGN KEY (`id_bns`) REFERENCES `beni_servizi` (`id`),
  ADD CONSTRAINT `addebito_crediti_ibfk_2` FOREIGN KEY (`id_personalescolastico`) REFERENCES `personale_scolastico` (`id`),
  ADD CONSTRAINT `addebito_crediti_ibfk_3` FOREIGN KEY (`id_studente`) REFERENCES `studenti` (`id`);

--
-- Constraints for table `attivita_didattiche`
--
ALTER TABLE `attivita_didattiche`
  ADD CONSTRAINT `attivita_didattiche_ibfk_1` FOREIGN KEY (`id_docente`) REFERENCES `docenti` (`id`);

--
-- Constraints for table `classi`
--
ALTER TABLE `classi`
  ADD CONSTRAINT `classi_ibfk_1` FOREIGN KEY (`id_docente`) REFERENCES `docenti` (`id`);

--
-- Constraints for table `docenti`
--
ALTER TABLE `docenti`
  ADD CONSTRAINT `docenti_ibfk_1` FOREIGN KEY (`id_personalescolastico`) REFERENCES `personale_scolastico` (`id`);

--
-- Constraints for table `gruppi_competenze`
--
ALTER TABLE `gruppi_competenze`
  ADD CONSTRAINT `gruppi_competenze_ibfk_1` FOREIGN KEY (`id_tutor`) REFERENCES `tutor` (`id`);

--
-- Constraints for table `personale_scolastico`
--
ALTER TABLE `personale_scolastico`
  ADD CONSTRAINT `personale_scolastico_ibfk_1` FOREIGN KEY (`id_utente`) REFERENCES `utenti` (`id`);

--
-- Constraints for table `registro_attivita`
--
ALTER TABLE `registro_attivita`
  ADD CONSTRAINT `registro_attivita_ibfk_1` FOREIGN KEY (`id_personalescolastico`) REFERENCES `personale_scolastico` (`id`),
  ADD CONSTRAINT `registro_attivita_ibfk_2` FOREIGN KEY (`id_studente`) REFERENCES `studenti` (`id`),
  ADD CONSTRAINT `registro_attivita_ibfk_3` FOREIGN KEY (`id_attivita`) REFERENCES `attivita_didattiche` (`id`);

--
-- Constraints for table `scuole`
--
ALTER TABLE `scuole`
  ADD CONSTRAINT `scuole_ibfk_1` FOREIGN KEY (`id_amministratore`) REFERENCES `amministratore` (`id`);

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`id_personalescolastico`) REFERENCES `personale_scolastico` (`id`),
  ADD CONSTRAINT `staff_ibfk_2` FOREIGN KEY (`id_bns`) REFERENCES `beni_servizi` (`id`);

--
-- Constraints for table `studenti`
--
ALTER TABLE `studenti`
  ADD CONSTRAINT `studenti_ibfk_1` FOREIGN KEY (`id_utente`) REFERENCES `utenti` (`id`),
  ADD CONSTRAINT `studenti_ibfk_2` FOREIGN KEY (`id_tutor`) REFERENCES `tutor` (`id`),
  ADD CONSTRAINT `studenti_ibfk_3` FOREIGN KEY (`id_gruppo`) REFERENCES `gruppi_competenze` (`id`),
  ADD CONSTRAINT `studenti_ibfk_4` FOREIGN KEY (`id_classe`) REFERENCES `classi` (`id`);

--
-- Constraints for table `tutor`
--
ALTER TABLE `tutor`
  ADD CONSTRAINT `tutor_ibfk_1` FOREIGN KEY (`id_docente`) REFERENCES `docenti` (`id`);

--
-- Constraints for table `utenti`
--
ALTER TABLE `utenti`
  ADD CONSTRAINT `utenti_ibfk_1` FOREIGN KEY (`id_scuola`) REFERENCES `scuole` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
