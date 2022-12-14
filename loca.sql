-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mar. 29 juin 2021 à 10:00
-- Version du serveur :  5.7.26
-- Version de PHP :  7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `loca`
--

-- --------------------------------------------------------

--
-- Structure de la table `adminoga`
--

DROP TABLE IF EXISTS `adminoga`;
CREATE TABLE IF NOT EXISTS `adminoga` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `adminoga`
--

INSERT INTO `adminoga` (`id`, `email`, `nom`, `password`, `prenom`, `telephone`) VALUES
(1, 'admin@gmail.com', 'ala', 'root', 'ala', '55445544'),
(2, 'mohamed@gmail.com', 'mohamed', 'root', 'mohamed', '55448855');

-- --------------------------------------------------------

--
-- Structure de la table `agence`
--

DROP TABLE IF EXISTS `agence`;
CREATE TABLE IF NOT EXISTS `agence` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `adresse` varchar(255) DEFAULT NULL,
  `code_patente` varchar(255) DEFAULT NULL,
  `code_postal` int(11) NOT NULL,
  `date_ban` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `date_un_ban` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `img_patente` varchar(255) DEFAULT NULL,
  `img_profil` varchar(255) DEFAULT NULL,
  `nom_agence` varchar(255) DEFAULT NULL,
  `num_tel` bigint(20) DEFAULT NULL,
  `number_ban` int(11) NOT NULL,
  `perma_ban` bit(1) DEFAULT NULL,
  `status_ban` bit(1) DEFAULT NULL,
  `status_verif` bit(1) DEFAULT NULL,
  `url_social_media` varchar(255) DEFAULT NULL,
  `ville` varchar(255) DEFAULT NULL,
  `adminoga_id` bigint(20) DEFAULT NULL,
  `status_van` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKgml1vx1rdt3cr0ss1rubn2g45` (`adminoga_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `agence`
--

INSERT INTO `agence` (`id`, `adresse`, `code_patente`, `code_postal`, `date_ban`, `date_creation`, `date_un_ban`, `description`, `img_patente`, `img_profil`, `nom_agence`, `num_tel`, `number_ban`, `perma_ban`, `status_ban`, `status_verif`, `url_social_media`, `ville`, `adminoga_id`, `status_van`) VALUES
(1, NULL, '56456456', 0, NULL, '2021-04-21 23:56:35', NULL, NULL, '56456456téléchargement (10).jfif', NULL, 'camilcar', 20548963, 0, b'0', b'0', b'0', NULL, NULL, NULL, NULL),
(2, 'rue chouhadee', '03210321', 0, NULL, '2021-04-22 00:45:58', NULL, 'description', '032103211519906227299.png', 'agence1.jpg', 'KelvenCar', 20548963, 0, b'0', b'0', b'0', 'Facebook/Agence', 'Nabeul', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `alerte`
--

DROP TABLE IF EXISTS `alerte`;
CREATE TABLE IF NOT EXISTS `alerte` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `view` bit(1) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `message` int(11) DEFAULT NULL,
  `recipient` varchar(255) DEFAULT NULL,
  `adminoga_id` bigint(20) DEFAULT NULL,
  `agence_id` bigint(20) DEFAULT NULL,
  `utilisateur_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5uyw6e04ecxccy26c4o9hd99o` (`adminoga_id`),
  KEY `FKgonlq6ejhpcg5cue0rkb34s1k` (`agence_id`),
  KEY `FKa5jx0jtqovrcn2vcoyua9tldw` (`utilisateur_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `alerte`
--

INSERT INTO `alerte` (`id`, `view`, `created_at`, `message`, `recipient`, `adminoga_id`, `agence_id`, `utilisateur_id`) VALUES
(1, b'0', '2021-04-21 23:56:35', NULL, NULL, NULL, 1, NULL),
(2, b'0', '2021-04-22 00:45:58', NULL, NULL, NULL, 2, NULL),
(3, b'0', '2021-04-25 19:23:47', NULL, NULL, NULL, NULL, 3),
(4, b'0', '2021-04-29 01:49:46', NULL, NULL, NULL, NULL, 4),
(5, b'0', '2021-04-29 13:45:50', NULL, NULL, NULL, NULL, 5),
(6, b'0', '2021-06-10 14:57:21', NULL, NULL, NULL, NULL, 6),
(7, b'0', '2021-06-10 15:09:02', NULL, NULL, NULL, NULL, 7);

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
CREATE TABLE IF NOT EXISTS `categorie` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_creation` datetime DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `adminoga_id` bigint(20) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `pathsvg` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqg3h1xdmx0oio5io9bt53se5c` (`adminoga_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`id`, `date_creation`, `libelle`, `adminoga_id`, `path`, `pathsvg`) VALUES
(1, '2021-04-26 12:03:41', '4x4', NULL, 'M15 6H4c-1.11 0-2 .89-2 2H1v6h1v1h2a3 3 0 006 0h5a3 3 0 006 0h2v-3c0-1.11-.89-2-2-2h-3l-3-4zM3.5 10V7.5h6V10h-6zm7.5 0V7.5h3.25l1.89 2.5H11zm-5.06 3.94a1.5 1.5 0 112.12 2.12 1.5 1.5 0 01-2.12-2.12zm11 0a1.5 1.5 0 112.12 2.12 1.5 1.5 0 01-2.12-2.12z', NULL),
(2, '2021-04-15 13:17:39', 'Familiale', 1, 'M1 8a2 2 0 012-2h11l4 4h3c1.11 0 2 .89 2 2v3h-2a3 3 0 01-6 0H8a3 3 0 01-6 0H1V8zm1.5-.5V10h6V7.5h-6zm7.5 0V10h5.8l-2.55-2.5H10zm-5 6a1.5 1.5 0 100 3 1.5 1.5 0 000-3zm13 0a1.5 1.5 0 100 3 1.5 1.5 0 000-3z', NULL),
(3, '2021-04-15 13:17:54', 'Utilitaire', 1, 'M3 6c-1.11 0-2 .89-2 2v8h2a3 3 0 006 0h6a3 3 0 006 0h2v-4c0-1.11-.89-2-2-2l-3-4H3zm12 1.5h2.5l1.96 2.5H15V7.5zm-9 7a1.5 1.5 0 110 3 1.5 1.5 0 010-3zm12 0a1.5 1.5 0 110 3 1.5 1.5 0 010-3z', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `note`
--

DROP TABLE IF EXISTS `note`;
CREATE TABLE IF NOT EXISTS `note` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `commentaire` varchar(255) DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `rate` float NOT NULL,
  `utilisateur_id` bigint(20) DEFAULT NULL,
  `vehicule_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKfubnay5m216o6xvkudchbu8vd` (`utilisateur_id`),
  KEY `FKer4j1ppbs7te3tppicp7qabtv` (`vehicule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `note`
--

INSERT INTO `note` (`id`, `commentaire`, `date_creation`, `rate`, `utilisateur_id`, `vehicule_id`) VALUES
(69, 'hbsdhjbds', '2021-05-05 00:15:31', 4, 2, 3),
(70, 'good', '2021-05-10 12:29:37', 3, 2, 2),
(74, 'nice', '2021-06-10 15:26:10', 4, 5, 4),
(77, 'good', '2021-06-28 13:27:13', 4, 2, 6);

-- --------------------------------------------------------

--
-- Structure de la table `notification`
--

DROP TABLE IF EXISTS `notification`;
CREATE TABLE IF NOT EXISTS `notification` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `acceptation` bit(1) NOT NULL,
  `criter_accptation` varchar(255) DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `demande` bit(1) NOT NULL,
  `demandeur_id` bigint(20) DEFAULT NULL,
  `receveur_id` bigint(20) DEFAULT NULL,
  `vehicule_id` bigint(20) DEFAULT NULL,
  `date_debut_demande` datetime DEFAULT NULL,
  `date_fin_demande` datetime DEFAULT NULL,
  `receveur_agence_id` bigint(20) DEFAULT NULL,
  `demandeur_agence_id` bigint(20) DEFAULT NULL,
  `ifread` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKcxsvlaf719y7tsepq3a5lcols` (`demandeur_id`),
  KEY `FKi0gw8g5sfldsf0gp33bjqprlc` (`receveur_id`),
  KEY `FK3fuiqu9579mj4p86iufyt1ere` (`vehicule_id`),
  KEY `FKd626gr36xbrk9oemd7ylu8n3m` (`receveur_agence_id`),
  KEY `FKtmtnohm1wmpw07trmfby7rb6l` (`demandeur_agence_id`)
) ENGINE=InnoDB AUTO_INCREMENT=319 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `notification`
--

INSERT INTO `notification` (`id`, `acceptation`, `criter_accptation`, `date_creation`, `demande`, `demandeur_id`, `receveur_id`, `vehicule_id`, `date_debut_demande`, `date_fin_demande`, `receveur_agence_id`, `demandeur_agence_id`, `ifread`) VALUES
(315, b'0', NULL, '2021-06-26 13:43:47', b'1', 5, NULL, 3, '2021-04-23 02:00:00', '2021-04-07 02:00:00', 1, NULL, b'1'),
(316, b'0', NULL, '2021-06-26 13:45:19', b'1', 5, 2, 6, '2021-04-17 02:00:00', '2022-04-07 02:00:00', NULL, NULL, b'1'),
(318, b'1', 'refuser', '2021-06-28 15:43:05', b'0', NULL, 5, 4, NULL, NULL, NULL, 1, b'1');

-- --------------------------------------------------------

--
-- Structure de la table `opt`
--

DROP TABLE IF EXISTS `opt`;
CREATE TABLE IF NOT EXISTS `opt` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_creation` datetime DEFAULT NULL,
  `date_update` datetime DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `adminoga_id` bigint(20) DEFAULT NULL,
  `pathsvg` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3lh2x110sqsdsdmk4uui9kleg` (`adminoga_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `opt`
--

INSERT INTO `opt` (`id`, `date_creation`, `date_update`, `libelle`, `adminoga_id`, `pathsvg`) VALUES
(1, '2021-04-15 11:50:57', '2021-04-15 11:50:57', 'GPS', 1, NULL),
(2, '2021-04-15 11:51:56', '2021-04-15 11:51:56', 'CHAUFFEURS', 1, NULL),
(3, '2021-05-07 17:11:14', '2021-05-07 17:11:14', 'toit panoramique', 1, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `personel_agence`
--

DROP TABLE IF EXISTS `personel_agence`;
CREATE TABLE IF NOT EXISTS `personel_agence` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cin` varchar(255) DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `img_profil` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `num_tel` bigint(20) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  `agence_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5n8aglg3tfmpr07v2byvchl3b` (`agence_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `personel_agence`
--

INSERT INTO `personel_agence` (`id`, `cin`, `date_creation`, `email`, `img_profil`, `nom`, `num_tel`, `password`, `prenom`, `role`, `agence_id`) VALUES
(2, '07203654', '2021-04-22 00:36:10', 'mohamed.bedelfattah@esprit.tn', NULL, 'mohamed', 0, NULL, 'ben abed el fattah', 1, 1),
(4, '07203654', '2021-04-22 00:45:27', 'mohamed.benabdelfattah@live.fr', 'https://graph.facebook.com/10220670476405336/picture', 'Ben Abed el fattaj', 25456789, NULL, 'Mohamed', 0, 1),
(6, NULL, '2021-04-29 14:40:33', 'ala.aaala@gmail.com', NULL, 'hamadi', 0, '$2a$10$gBNux4m2p.P4OcyWxbIzc.1eXvKY/RcxTUSkpfdUDMZp8.UiREkhm', 'ala', 1, 2),
(7, NULL, '2021-04-29 15:18:17', 'yassin@gmail.com', NULL, 'Yassin', 0, '$2a$10$EkbruqJt0M3BfoavB6YOD.NU2C2gthssLgjlbF6gHU3lv.J9JU3Hy', 'hamadi', 1, 2),
(8, NULL, '2021-05-06 02:13:52', 'ala.hamadi@onegateafrica.com', NULL, 'aala', 0, '$2a$10$PPpOeXOSLu/4vS6ZPgueA.mpY2HIHfvYkudMBwGWGsqyam1.f.Kiu', 'ala', 1, 2),
(10, NULL, '2021-06-10 15:21:24', 'hamma@gmail.com', NULL, 'sellimi', 0, '$2a$10$DyTj2F6.TwL6fsP3ZaRA6uaUooJKkF5oR4NU7HLAgjWrSvUMBMNWS', 'medali', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `promotion`
--

DROP TABLE IF EXISTS `promotion`;
CREATE TABLE IF NOT EXISTS `promotion` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_creation` datetime DEFAULT NULL,
  `date_debut` datetime DEFAULT NULL,
  `date_fin` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `pourcentage_reduction` int(11) NOT NULL,
  `agence_id` bigint(20) DEFAULT NULL,
  `personel_agence_id` bigint(20) DEFAULT NULL,
  `vehicule_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKi6e93i9dmu7avaavx7d9ldxi5` (`agence_id`),
  KEY `FK97qrtivuttn3ppkl6rjpg24lr` (`personel_agence_id`),
  KEY `FK58gd7h4wyf78ldfbm18gsmc22` (`vehicule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `promotion`
--

INSERT INTO `promotion` (`id`, `date_creation`, `date_debut`, `date_fin`, `description`, `pourcentage_reduction`, `agence_id`, `personel_agence_id`, `vehicule_id`) VALUES
(1, '2021-04-29 12:45:11', '2021-04-21 02:00:00', '2021-04-30 02:00:00', 'description', 30, 2, 2, 3),
(3, '2021-04-29 15:25:31', '2021-04-27 02:00:00', '2021-04-30 02:00:00', 'description', 20, 2, 4, 4),
(6, '2021-06-21 16:32:44', '2021-06-15 02:00:00', '2021-06-17 02:00:00', 'Promotion du Golf jusqu\'a 26 mai ', 28, 2, 4, 19),
(7, '2021-06-21 16:34:17', '2021-06-15 02:00:00', '2021-06-25 02:00:00', 'description', 40, 2, 4, 18);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `enabled` bit(1) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `verification_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `email`, `enabled`, `password`, `verification_code`) VALUES
(1, 'loca@gmail.com', b'1', '$2a$10$SOsk49F.QCvPomcqYmffP.C5csBl65CTi1XmXot.ZGMSvSB2Lc99u', NULL),
(2, 'hamdi@gmail.com', b'0', '$2a$10$dBjIxh7oAwxSPXZBYgbegOTOB9zI/s4c3qt0mJZtuR.aBrb8Agkn.', 'n8KyzF38wFVa3piALUnBHxY0K1J6e2fdVV6AKsEvELWIoehKxVgOaNhkLWkpzLOr'),
(5, 'khouloud@gmail.com', b'1', '$2a$10$HVNdBRutp11yP.F7f75gn.voEq3tm37rZw6AmYL5zzDj3GtTWUN6O', NULL),
(6, 'ala.ala@gmail.com', b'0', '$2a$10$35HOE.lY4HyR//aNS6TjQeL6dKKOQpXeK6p36AS4zrXYZpCx71cLi', 'le7dPQB6OZOrH9libms1wJzCKtQ1v386fYIlVCfyxj1fKoCLtNu7gnhxI7lYhLrj'),
(7, 'ala.aala@gmail.com', b'0', '$2a$10$4MWr6BiyPHehtiMmfdSzUunr9tSTzVnAwREOcf30500KY/r8r77im', 'aHAJR41jk32SGsIF0M4pLoqe79qOo6oAMaVlSU0XzMzMLwywkWinvtCs4KYXNAnj'),
(8, 'ala.aaala@gmail.com', b'1', '$2a$10$gBNux4m2p.P4OcyWxbIzc.1eXvKY/RcxTUSkpfdUDMZp8.UiREkhm', NULL),
(9, 'yassin@gmail.com', b'1', '$2a$10$EkbruqJt0M3BfoavB6YOD.NU2C2gthssLgjlbF6gHU3lv.J9JU3Hy', NULL),
(10, 'personel@gmail.com', b'0', '$2a$10$00KA/ZOlQ1wnBVXlwMj8LekRs6PjjqWEXrC4kJ/LPX2gO1Umj19EC', 'LATptdvH3o02Ofq5XkyBTCuefT9brxCwbnDwojk4me9hid4wGRyslWukQicI4Ph0'),
(11, 'personnel@gmail.com', b'0', '$2a$10$xcQnJNR71EmjjY7HJrYexObFPjod1EvFNdTIVcJ.AdqL4vV490uMC', 'EqY4LqoRcAKgT6bf1kcbaeusrjoC0i1JWPEYPUViag2Y01B8HJEVsOaY2CvTwikh'),
(15, 'ala.hamadi.01@gmail.com', b'0', '$2a$10$9kC03k1jqsE0A.5YmLkjGuWm1rXvBpVBO9Wmvd9lAyWMlmoHbpSce', 'lYvTjhh2BXZljZhd7F5ixK83Az3xghe0UPmZAbSyyOwYUTdN9ESb5zZQql7x9ekT'),
(16, 'mohamed.benabedelfattah@esprit.tn', b'0', '$2a$10$M7V9Re/Yym9k9SawztzSS.gewtPLGE1FUtUCeuuVPsFpla4CDMEBO', 'Q6drw3cPi987becd3MMxKexf4Zig4SXjW7toSj1xrOw6VT6Dk7V0vhPkOHuQdrXm'),
(17, 'ala.hamadi@onegateafrica.com', b'1', '$2a$10$PPpOeXOSLu/4vS6ZPgueA.mpY2HIHfvYkudMBwGWGsqyam1.f.Kiu', NULL),
(19, 'mohamed.benabedelfattah@gmail.com', b'1', '$2a$10$tJm1FQW9Xc18yUI018y51.FpP8xfYK1PBtAPoJ1xg7yXP6mwdj16.', NULL),
(20, 'pfe@gmail.com', b'1', '$2a$10$xU3qC.UsFYlvGFqvugIBOOjPueXc31hIAg89XRT/Q6k7fxGBKUqqu', NULL),
(22, 'takatk@gmail.com', b'1', '$2a$10$JNj0HjUJ87WM5qVLVH44JeSkcvDK1coaySJYpylygolTHC9grNHLO', NULL),
(23, 'fathi@gmail.com', b'1', '$2a$10$cnYNZ3/BZGsCQlPXRIQfY.kBBrJrnxbYi8K2kFxJg1YWrkvMM1dyq', NULL),
(24, 'medAli@gmail.com', b'1', '$2a$10$sop0zf.qu4Gfc4G0JxoqlO4hQKSox5iem0euXb0ZxCEaRYVXp/7wS', NULL),
(25, 'hamma@gmail.com', b'1', '$2a$10$DyTj2F6.TwL6fsP3ZaRA6uaUooJKkF5oR4NU7HLAgjWrSvUMBMNWS', NULL),
(27, 'salem@gmail.com', b'1', '$2a$10$tfUYRmYw96x1ZfKyuSsg3e9j7NBGRcJw0r2kh5KMoP9THO3GNPtGO', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cin` varchar(255) DEFAULT NULL,
  `code_permis` varchar(255) DEFAULT NULL,
  `code_postal` int(11) NOT NULL,
  `date_ban` datetime DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `date_un_ban` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `img_permis` varchar(255) DEFAULT NULL,
  `img_profil` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `num_tel` bigint(20) NOT NULL,
  `number_ban` int(11) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `perma_ban` bit(1) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `status_ban` bit(1) DEFAULT NULL,
  `status_verif` bit(1) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `url_social_media` varchar(255) DEFAULT NULL,
  `ville` varchar(255) DEFAULT NULL,
  `adminoga_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKl9lxx2cld4ih424vaw04gpexi` (`adminoga_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `cin`, `code_permis`, `code_postal`, `date_ban`, `date_creation`, `date_un_ban`, `description`, `email`, `img_permis`, `img_profil`, `nom`, `num_tel`, `number_ban`, `password`, `perma_ban`, `prenom`, `status_ban`, `status_verif`, `token`, `url_social_media`, `ville`, `adminoga_id`) VALUES
(1, '05884848', '645645645', 2075, NULL, '2021-04-12 15:41:08', NULL, 'hi Mohamed BAF', 'ala.hamadi@gmail.com', NULL, 'https://png.pngtree.com/png-vector/20190710/ourmid/pngtree-user-vector-avatar-png-image_1541962.jpg', 'ala hamadi', 55445544, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'google.com', 'Nabeul', 1),
(2, '07205252', '54898745', 7080, NULL, '2021-04-12 15:41:08', NULL, 'hi Mohamed BAF', 'mohamed.benabedelfattah@esprit.tn', NULL, 'https://lh3.googleusercontent.com/a-/AOh14GgXaBtvDEcL7vICv-SmI7dtCAf23LECmb7WLaVy=s96-c', 'Mohamed BENABEDELFATTAH', 23564789, 0, NULL, NULL, 'Mohamed', NULL, b'1', NULL, 'google.com', 'mourouj', NULL),
(3, '02020202', '02020202', 0, NULL, '2021-04-25 19:22:59', NULL, NULL, 'mohamed.benabedelfattah@gmail.com', '02020202react-leaflet-cluster-layer.jpg', 'https://lh4.googleusercontent.com/-BYfZd0xsiTw/AAAAAAAAAAI/AAAAAAAAAAA/AMZuuclZOu7wYMPknMYek-JIrixVLr-eew/s96-c/photo.jpg', 'mooohamed', 0, 0, NULL, b'0', 'mooooo', b'0', b'0', NULL, NULL, NULL, NULL),
(4, '02020202', '02020202', 0, NULL, NULL, NULL, NULL, 'loca@gmail.com', '020202021200px-React-icon.svg.png', NULL, 'Loca', 0, 0, '$2a$10$SOsk49F.QCvPomcqYmffP.C5csBl65CTi1XmXot.ZGMSvSB2Lc99u', b'0', 'Locafront', b'0', b'0', NULL, NULL, NULL, NULL),
(5, '20202020', '20202020', 0, NULL, NULL, NULL, NULL, 'khouloud@gmail.com', '20202020wallpapersden.com_hacker-anonymous-evil_3840x2160.jpg', NULL, 'Khouloud', 0, 0, '$2a$10$HVNdBRutp11yP.F7f75gn.voEq3tm37rZw6AmYL5zzDj3GtTWUN6O', b'0', 'bejaoui', b'0', b'1', NULL, NULL, NULL, NULL),
(6, '66556655', '55665566', 0, NULL, NULL, NULL, NULL, 'takatk@gmail.com', '66556655191631666_324890379040782_2180648044530741469_n.jpg', NULL, 'sdkdslm', 0, 0, '$2a$10$JNj0HjUJ87WM5qVLVH44JeSkcvDK1coaySJYpylygolTHC9grNHLO', b'0', 'mksldmk', b'0', b'0', NULL, NULL, NULL, NULL),
(7, '02302365', '55566655', 0, NULL, NULL, NULL, NULL, 'fathi@gmail.com', '02302365191631666_324890379040782_2180648044530741469_n.jpg', NULL, 'fathi', 0, 0, '$2a$10$cnYNZ3/BZGsCQlPXRIQfY.kBBrJrnxbYi8K2kFxJg1YWrkvMM1dyq', b'0', 'sellimi', b'0', b'1', NULL, NULL, NULL, NULL),
(8, NULL, NULL, 0, NULL, NULL, NULL, NULL, 'salem@gmail.com', NULL, NULL, NULL, 0, 0, '$2a$10$tfUYRmYw96x1ZfKyuSsg3e9j7NBGRcJw0r2kh5KMoP9THO3GNPtGO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `vehicule`
--

DROP TABLE IF EXISTS `vehicule`;
CREATE TABLE IF NOT EXISTS `vehicule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `annee` int(11) NOT NULL,
  `boite_vitesse` varchar(255) DEFAULT NULL,
  `date_debut` date DEFAULT NULL,
  `date_fin` date DEFAULT NULL,
  `disponibilite` bit(1) NOT NULL,
  `energie` varchar(255) DEFAULT NULL,
  `gamme` varchar(255) DEFAULT NULL,
  `gouvernorat` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `km_compteur` float NOT NULL,
  `maison` varchar(255) DEFAULT NULL,
  `nbr_cylindre` int(11) NOT NULL,
  `nbr_place` int(11) NOT NULL,
  `nbr_vehicule` int(11) NOT NULL,
  `prix` float NOT NULL,
  `puissance` int(11) NOT NULL,
  `ville` varchar(255) DEFAULT NULL,
  `agence_id` bigint(20) DEFAULT NULL,
  `categorie_id` bigint(20) DEFAULT NULL,
  `utilisateur_id` bigint(20) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `rue` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `promotion_id` bigint(20) DEFAULT NULL,
  `date_debut_demande` datetime DEFAULT NULL,
  `date_fin_demande` datetime DEFAULT NULL,
  `view` int(11) NOT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKr2si5ad4hjubekoy3kuqd9dis` (`agence_id`),
  KEY `FKs5ohglerv9stufy4e4int4h9d` (`categorie_id`),
  KEY `FKpaygibnx4bksgkj4i2tge8ln1` (`utilisateur_id`),
  KEY `FK5ytbpj4wiue6cyclmcboqnyn0` (`promotion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `vehicule`
--

INSERT INTO `vehicule` (`id`, `annee`, `boite_vitesse`, `date_debut`, `date_fin`, `disponibilite`, `energie`, `gamme`, `gouvernorat`, `image`, `km_compteur`, `maison`, `nbr_cylindre`, `nbr_place`, `nbr_vehicule`, `prix`, `puissance`, `ville`, `agence_id`, `categorie_id`, `utilisateur_id`, `description`, `rue`, `zip`, `promotion_id`, `date_debut_demande`, `date_fin_demande`, `view`, `latitude`, `longitude`) VALUES
(1, 2007, 'manuelle', '2021-04-11', '2022-04-13', b'0', 'essence', 'golf', 'Manouba', 'd1b48ab83e9adb340184ead8f044931e.jpg', 1, 'wolkswagen', 4, 4, 4, 200, 5, 'Manouba', NULL, NULL, 1, NULL, NULL, NULL, NULL, '2023-04-24 00:00:00', '2023-04-24 00:00:00', 1, '37.81720880047976', '10.179051275313707'),
(2, 2007, 'manuelle', '2021-04-11', '2022-04-13', b'1', 'diesel', 'golf', 'Manouba', '9bf2e8776edd3f6f6cafffadf66da67e.jpg', 1, 'wolkswagen', 4, 4, 4, 200, 5, 'Manouba', 1, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-11 00:00:00', '2022-04-12 00:00:00', 36, '37.81720880047976', '10.179051275313707'),
(3, 2010, 'automatique', '2021-04-10', '2021-04-19', b'1', 'diesel', 'A4', 'mednin', 'images (2).jfif', 2, 'Audi', 4, 5, 46, 200, 6, 'Djerba Midoun', 1, NULL, NULL, 'This car comes with Anti-Lock Brakes, Automatic Air Conditioning, Power-Assisted Steering, Driver, Passenger, Front Side And Side Air Bags, 16In Alloy Wheels, Cruise Control, Satellite Navigation, Trip Computer, Electric Door Mirrors, Immobiliser.', NULL, NULL, NULL, '2023-04-24 00:00:00', '2023-04-24 00:00:00', 22, '36.81720880047976', '10.169051275313707'),
(4, 2010, 'automatique', '2021-04-11', '2022-04-12', b'1', 'diesel', 'DS5', 'mednin', 'images (4).jfif', 3, 'Citroen', 4, 2, 2, 200, 6, 'Djerba Midoun', 1, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-21 00:00:00', '2022-04-06 00:00:00', 104, '36.664563', '9.983492'),
(6, 2018, 'automatique', '2021-04-09', '2022-04-16', b'1', 'essence', 'Astra', 'Nabeul', '40af12f4c2133eeb6a5d6c7580554f4c.jpg', 3, 'Opel', 4, 4, 4, 400, 6, 'Dar Chaabane', NULL, NULL, 5, 'my car', 'rue', '8045', NULL, '2023-02-24 00:00:00', '2023-03-24 00:00:00', 34, '36.81720880047976', '10.169051275313707'),
(7, 2019, 'manuelle', '2021-04-14', '2022-04-17', b'1', 'essence', 'Polo', 'Ariana', '9bf2e8776edd3f6f6cafffadf66da67e.jpg', 4, 'Volkswagen', 4, 5, 6, 400, 4, 'Tunis1', NULL, NULL, 2, 'my car', 'rue el horeya', '2033', NULL, '2023-04-24 00:00:00', '2023-04-24 00:00:00', 6, '36.81720880047976', '10.169051275313707'),
(8, 2019, 'manuelle', '2021-04-14', '2022-04-17', b'1', 'diesel', 'Polo', 'Nabeul', '9544557d115cd19b5b74c3e821236140.jpg', 2, 'Volkswagen', 4, 3, 5, 300, 5, 'Dar Chaabane', NULL, NULL, 2, 'my card 3', 'rue chaaban', '5454', NULL, '2020-03-24 00:00:00', '2023-04-24 00:00:00', 12, '36.81720880047976', '10.169051275313707'),
(9, 2019, 'automatique', '2021-04-19', '2021-04-23', b'1', 'diesel', 'Passat', 'Ariana', 'téléchargement (4).jfif', 3, 'Volkswagen', 4, 6, 5, 40, 5, 'Tunis2', NULL, 2, 2, 'ds', 'rue le bacha', '2020', NULL, NULL, NULL, 4, '36.81720880047976', '10.169051275313707'),
(10, 2018, 'automatique', '2021-04-14', '2021-04-21', b'0', 'essence', 'Passat', 'Ariana', 'd1b48ab83e9adb340184ead8f044931e.jpg', 5, 'Volkswagen', 5, 3, 4, 200, 4, 'Tunis2', NULL, 3, 2, 'ds', 'rue el haram', '4089', NULL, NULL, NULL, 6, '36.81720880047976', '10.169051275313707'),
(11, 2018, 'manuelle', '2021-04-27', '2021-04-22', b'1', 'diesel', 'Polo', 'Ariana', 'téléchargement (5).jfif', 2, 'Volkswagen', 5, 4, 6, 200, 6, 'Tunis2', NULL, 2, 2, 'dsss', 'bbb', '2020', NULL, NULL, NULL, 1, '36.81720880047976', '10.169051275313707'),
(12, 2019, 'manuelle', '2021-04-26', '2021-04-21', b'1', 'diesel', 'Passat', '', '9544557d115cd19b5b74c3e821236140.jpg', 3, 'Volkswagen', 5, 5, 5, 200, 4, '', NULL, 3, 2, 'hh', '', '', NULL, NULL, NULL, 11, '36.81720880047976', '10.169051275313707'),
(13, 2018, 'automatique', '2021-04-25', '2021-04-23', b'1', 'essence', 'Polo', 'Ariana', 'd1b48ab83e9adb340184ead8f044931e.jpg', 3, 'Volkswagen', 4, 4, 5, 200, 4, 'Tunis2', NULL, 2, 2, 'desc', 'bacha', '5151', NULL, NULL, NULL, 9, '36.76694210234516', '10.234725947957488'),
(14, 2019, 'automatique', '2021-04-14', '2021-04-17', b'1', 'diesel', 'Polo', '', '9bf2e8776edd3f6f6cafffadf66da67e.jpg', 2, 'Volkswagen', 5, 3, 5, 300, 3, '', NULL, 2, 2, 'description', '', '', NULL, NULL, NULL, 4, '36.83962500114453', '11.089050276204944'),
(18, 2019, 'automatique', '2021-04-19', '2021-04-24', b'1', 'diesel', 'Passat', 'Ariana', NULL, 3, 'Volkswagen', 5, 4, 4, 200, 4, 'Tunis2', 2, 1, NULL, 'descr', 'rue le bacha', '2000', NULL, NULL, NULL, 0, '36.462779812791915', '10.746871232659034'),
(19, 2019, 'automatique', '2021-04-19', '2021-05-26', b'1', 'diesel', 'Golf', 'Nabeul', NULL, 3, 'Volkswagen', 4, 5, 4, 150, 6, 'Dar Chaabane', 2, 2, NULL, 'description', 'rue horeya', '2301', NULL, NULL, NULL, 0, '36.768317232723234', '10.23029709176626'),
(20, 2019, 'manuelle', '2021-05-16', '2021-05-26', b'1', 'essence', 'Passat', 'Ariana', 'voitureMariage.jpg', 3, 'Volkswagen', 3, 3, 6, 500, 4, 'Tunis2', NULL, 1, 2, 'njdknjkd', 'fklnmkl', '1212', NULL, NULL, NULL, 3, '36.79095744736649', '10.182533230399713'),
(22, 2018, 'automatique', '2021-05-09', '2021-05-13', b'1', 'diesel', 'RS4 Avant', 'Ariana', 'traxe3.jpg', 3, 'Audi', 3, 5, 6, 200, 3, 'Tunis2', NULL, 2, 2, 'sfsd', 'rue sabkha', '5654', NULL, NULL, NULL, 0, '36.755359496887266', '10.1465034467401'),
(23, 2021, 'automatique', '2021-05-17', '2021-05-25', b'1', 'essence', 'Passat', 'Ariana', 'bus1.jpg', 3, 'Volkswagen', 5, 4, 5, 500, 2, 'Tunis1', NULL, 3, 2, 'mkomk', 'rue bacha', '5656', NULL, NULL, NULL, 2, '36.84873445881629', '10.178985516540708'),
(24, 2021, 'manuelle', '2021-05-23', '2021-05-24', b'1', 'diesel', 'TTS Roadster', 'Ariana', 'bus2.jpg', 1, 'Audi', 2, 2, 5, 522, 2, 'Tunis1', NULL, NULL, 2, 'mmsd', 'rue jabena', '7896', NULL, NULL, NULL, 0, '36.90109924240823', '11.048583872616293'),
(29, 0, '', NULL, NULL, b'1', '', NULL, '', NULL, 0, '', 0, 0, 0, 0, 0, '', NULL, NULL, 2, NULL, '', '', NULL, NULL, NULL, 0, '55.702868', '37.530865'),
(30, 2018, 'automatique', '2021-07-07', '2021-05-22', b'1', 'diesel', 'Passat', 'Nabeul', 'CamionDem.jpg', 3, 'Volkswagen', 4, 4, 8, 300, 5, 'BK', NULL, NULL, 2, 'description', 'rue kadissisa', '2074', NULL, NULL, NULL, 0, '37.270755575381656', '9.863188505205471'),
(31, 2019, 'automatique', '2021-06-08', '2021-06-11', b'1', 'essence', 'A3 Cabriolet', 'Ariana', '20202020images (1).jfif', 4, 'Audi', 0, 4, 5, 60, 4, 'Tunis1', NULL, 2, 5, 'new car', 'rue el bacha', '2302', NULL, NULL, NULL, 1, '36.85204345620028', '10.16297149762977'),
(32, 2018, 'automatique', '2021-06-08', '2021-06-22', b'1', 'diesel', 'RS4 Avant', 'Ariana', '07205252images (1).jfif', 3, 'Audi', 4, 5, 2, 250, 6, 'Tunis2', NULL, 2, 2, 'dscription audi', 'rue kadissia', '2550', NULL, NULL, NULL, 0, '36.85566969638565', '10.173477173375433');

-- --------------------------------------------------------

--
-- Structure de la table `vehicule_opt`
--

DROP TABLE IF EXISTS `vehicule_opt`;
CREATE TABLE IF NOT EXISTS `vehicule_opt` (
  `vehicules_id` bigint(20) NOT NULL,
  `opt_id` bigint(20) NOT NULL,
  KEY `FKk2rkkrirlmkhd7jgu91972lq4` (`opt_id`),
  KEY `FKmcj9rogw08rcrvd0yw2e2qr56` (`vehicules_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `vehicule_opt`
--

INSERT INTO `vehicule_opt` (`vehicules_id`, `opt_id`) VALUES
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(18, 1),
(19, 1),
(20, 1),
(22, 1),
(23, 1),
(23, 2),
(24, 1),
(24, 2),
(24, 3),
(29, 2),
(30, 1),
(31, 1),
(32, 1);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `agence`
--
ALTER TABLE `agence`
  ADD CONSTRAINT `FKgml1vx1rdt3cr0ss1rubn2g45` FOREIGN KEY (`adminoga_id`) REFERENCES `adminoga` (`id`);

--
-- Contraintes pour la table `alerte`
--
ALTER TABLE `alerte`
  ADD CONSTRAINT `FK5uyw6e04ecxccy26c4o9hd99o` FOREIGN KEY (`adminoga_id`) REFERENCES `adminoga` (`id`),
  ADD CONSTRAINT `FKa5jx0jtqovrcn2vcoyua9tldw` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateur` (`id`),
  ADD CONSTRAINT `FKgonlq6ejhpcg5cue0rkb34s1k` FOREIGN KEY (`agence_id`) REFERENCES `agence` (`id`);

--
-- Contraintes pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD CONSTRAINT `FKqg3h1xdmx0oio5io9bt53se5c` FOREIGN KEY (`adminoga_id`) REFERENCES `adminoga` (`id`);

--
-- Contraintes pour la table `note`
--
ALTER TABLE `note`
  ADD CONSTRAINT `FKer4j1ppbs7te3tppicp7qabtv` FOREIGN KEY (`vehicule_id`) REFERENCES `vehicule` (`id`),
  ADD CONSTRAINT `FKfubnay5m216o6xvkudchbu8vd` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateur` (`id`);

--
-- Contraintes pour la table `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `FK3fuiqu9579mj4p86iufyt1ere` FOREIGN KEY (`vehicule_id`) REFERENCES `vehicule` (`id`),
  ADD CONSTRAINT `FKcxsvlaf719y7tsepq3a5lcols` FOREIGN KEY (`demandeur_id`) REFERENCES `utilisateur` (`id`),
  ADD CONSTRAINT `FKd626gr36xbrk9oemd7ylu8n3m` FOREIGN KEY (`receveur_agence_id`) REFERENCES `agence` (`id`),
  ADD CONSTRAINT `FKi0gw8g5sfldsf0gp33bjqprlc` FOREIGN KEY (`receveur_id`) REFERENCES `utilisateur` (`id`),
  ADD CONSTRAINT `FKtmtnohm1wmpw07trmfby7rb6l` FOREIGN KEY (`demandeur_agence_id`) REFERENCES `agence` (`id`);

--
-- Contraintes pour la table `opt`
--
ALTER TABLE `opt`
  ADD CONSTRAINT `FK3lh2x110sqsdsdmk4uui9kleg` FOREIGN KEY (`adminoga_id`) REFERENCES `adminoga` (`id`);

--
-- Contraintes pour la table `personel_agence`
--
ALTER TABLE `personel_agence`
  ADD CONSTRAINT `FK5n8aglg3tfmpr07v2byvchl3b` FOREIGN KEY (`agence_id`) REFERENCES `agence` (`id`);

--
-- Contraintes pour la table `promotion`
--
ALTER TABLE `promotion`
  ADD CONSTRAINT `FK58gd7h4wyf78ldfbm18gsmc22` FOREIGN KEY (`vehicule_id`) REFERENCES `vehicule` (`id`),
  ADD CONSTRAINT `FK97qrtivuttn3ppkl6rjpg24lr` FOREIGN KEY (`personel_agence_id`) REFERENCES `personel_agence` (`id`),
  ADD CONSTRAINT `FKi6e93i9dmu7avaavx7d9ldxi5` FOREIGN KEY (`agence_id`) REFERENCES `agence` (`id`);

--
-- Contraintes pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD CONSTRAINT `FKl9lxx2cld4ih424vaw04gpexi` FOREIGN KEY (`adminoga_id`) REFERENCES `adminoga` (`id`);

--
-- Contraintes pour la table `vehicule`
--
ALTER TABLE `vehicule`
  ADD CONSTRAINT `FK5ytbpj4wiue6cyclmcboqnyn0` FOREIGN KEY (`promotion_id`) REFERENCES `promotion` (`id`),
  ADD CONSTRAINT `FKpaygibnx4bksgkj4i2tge8ln1` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateur` (`id`),
  ADD CONSTRAINT `FKr2si5ad4hjubekoy3kuqd9dis` FOREIGN KEY (`agence_id`) REFERENCES `agence` (`id`),
  ADD CONSTRAINT `FKs5ohglerv9stufy4e4int4h9d` FOREIGN KEY (`categorie_id`) REFERENCES `categorie` (`id`);

--
-- Contraintes pour la table `vehicule_opt`
--
ALTER TABLE `vehicule_opt`
  ADD CONSTRAINT `FKk2rkkrirlmkhd7jgu91972lq4` FOREIGN KEY (`opt_id`) REFERENCES `opt` (`id`),
  ADD CONSTRAINT `FKmcj9rogw08rcrvd0yw2e2qr56` FOREIGN KEY (`vehicules_id`) REFERENCES `vehicule` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
