-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 08 juin 2021 à 15:10
-- Version du serveur :  10.4.18-MariaDB
-- Version de PHP : 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `employedb`
--

-- --------------------------------------------------------

--
-- Structure de la table `employe`
--

CREATE TABLE `employe` (
  `numEmploye` varchar(255) NOT NULL,
  `nomEmploye` varchar(255) DEFAULT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `tauxHoraire` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `employe`
--

INSERT INTO `employe` (`numEmploye`, `nomEmploye`, `adresse`, `tauxHoraire`) VALUES
('E01', 'Mimi', 'Toliara', 100),
('E02', 'Momo', 'Tamatave', 145),
('E03', 'nathalie', 'tana', 70),
('E04', 'Abril', 'Dieg', 60),
('E05', 'tom', 'Sambava', 10),
('E06', 'jerry', 'Anosy', 40);

-- --------------------------------------------------------

--
-- Structure de la table `entreprise`
--

CREATE TABLE `entreprise` (
  `numEntreprise` varchar(255) NOT NULL,
  `design` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `entreprise`
--

INSERT INTO `entreprise` (`numEntreprise`, `design`) VALUES
('1', 'kintana'),
('2', 'FDC'),
('3', 'abc');

-- --------------------------------------------------------

--
-- Structure de la table `travail`
--

CREATE TABLE `travail` (
  `idTravail` int(50) NOT NULL,
  `numEmploye` varchar(255) NOT NULL,
  `numEntreprise` varchar(255) NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp(),
  `nbHeure` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `travail`
--

INSERT INTO `travail` (`idTravail`, `numEmploye`, `numEntreprise`, `date`, `nbHeure`) VALUES
(1, 'E01', '1', '2019-06-15', 77),
(24, 'E02', '2', '2021-06-05', 100),
(25, 'E03', '1', '2021-05-02', 300);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `employe`
--
ALTER TABLE `employe`
  ADD PRIMARY KEY (`numEmploye`);

--
-- Index pour la table `entreprise`
--
ALTER TABLE `entreprise`
  ADD PRIMARY KEY (`numEntreprise`);

--
-- Index pour la table `travail`
--
ALTER TABLE `travail`
  ADD PRIMARY KEY (`idTravail`),
  ADD KEY `numEmploye` (`numEmploye`),
  ADD KEY `numEntreprise` (`numEntreprise`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `travail`
--
ALTER TABLE `travail`
  MODIFY `idTravail` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `travail`
--
ALTER TABLE `travail`
  ADD CONSTRAINT `travail_ibfk_1` FOREIGN KEY (`numEmploye`) REFERENCES `employe` (`numEmploye`),
  ADD CONSTRAINT `travail_ibfk_2` FOREIGN KEY (`numEntreprise`) REFERENCES `entreprise` (`numEntreprise`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
