/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.11-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: VILLAGEGREEN
-- ------------------------------------------------------
-- Server version	10.11.11-MariaDB-0ubuntu0.24.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary table structure for view `Jointure_p_f`
--

DROP TABLE IF EXISTS `Jointure_p_f`;
/*!50001 DROP VIEW IF EXISTS `Jointure_p_f`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `Jointure_p_f` AS SELECT
 1 AS `id_produit`,
  1 AS `libelle_court`,
  1 AS `ref_fournisseur`,
  1 AS `prix_achat`,
  1 AS `photo`,
  1 AS `id_fournisseur`,
  1 AS `id_sousrubrique`,
  1 AS `nom`,
  1 AS `email`,
  1 AS `tel` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `Jointure_p_rub`
--

DROP TABLE IF EXISTS `Jointure_p_rub`;
/*!50001 DROP VIEW IF EXISTS `Jointure_p_rub`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `Jointure_p_rub` AS SELECT
 1 AS `id_produit`,
  1 AS `libelle_court`,
  1 AS `ref_fournisseur`,
  1 AS `prix_achat`,
  1 AS `photo`,
  1 AS `id_fournisseur`,
  1 AS `id_sousrubrique`,
  1 AS `nom_ssrubrique`,
  1 AS `nom_rubrique` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `id_client` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) DEFAULT NULL,
  `prenom` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `mot_de_passe` varchar(255) DEFAULT NULL,
  `type_client` varchar(50) DEFAULT NULL,
  `coefficient_vente` decimal(5,2) DEFAULT NULL,
  `id_commercial` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_client`),
  UNIQUE KEY `email` (`email`),
  KEY `id_commercial` (`id_commercial`),
  CONSTRAINT `clients_ibfk_1` FOREIGN KEY (`id_commercial`) REFERENCES `commerciaux` (`id_commercial`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES
(1,'Martin','Claire','claire.martin@gmail.com','mdp123','particulier',1.20,1),
(2,'Dupont','Jean','jean.dupont@musicpro.fr','mdp456','professionnel',1.10,2),
(3,'Moreau','Alice','alice.moreau@gmail.com','mdp789','particulier',1.20,1),
(4,'Bernard','Luc','luc.bernard@proaudio.fr','mdp321','professionnel',1.15,2),
(5,'Petit','Emma','emma.petit@gmail.com','mdp654','particulier',1.20,1);
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commandes`
--

DROP TABLE IF EXISTS `commandes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `commandes` (
  `id_commande` int(11) NOT NULL AUTO_INCREMENT,
  `id_client` int(11) DEFAULT NULL,
  `date_commande` datetime DEFAULT NULL,
  `reduction` decimal(5,2) DEFAULT NULL,
  `total_ht` decimal(10,2) DEFAULT NULL,
  `etat` varchar(50) DEFAULT NULL,
  `adresse_livraison` text DEFAULT NULL,
  `adresse_facturation` text DEFAULT NULL,
  PRIMARY KEY (`id_commande`),
  KEY `id_client` (`id_client`),
  CONSTRAINT `commandes_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id_client`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commandes`
--

LOCK TABLES `commandes` WRITE;
/*!40000 ALTER TABLE `commandes` DISABLE KEYS */;
INSERT INTO `commandes` VALUES
(1,1,'2024-05-01 10:00:00',0.00,540.00,'en cours','10 rue Musique, Paris','10 rue Musique, Paris'),
(2,2,'2024-05-02 14:00:00',5.00,990.00,'livrée','55 avenue Pro, Lyon','55 avenue Pro, Lyon'),
(3,3,'2024-05-03 11:30:00',0.00,840.00,'en cours','20 rue Jazz, Toulouse','20 rue Jazz, Toulouse'),
(4,4,'2024-05-04 15:45:00',10.00,1300.00,'livrée','5 rue des Sons, Bordeaux','5 rue des Sons, Bordeaux'),
(5,5,'2024-05-05 09:20:00',0.00,600.00,'en cours','33 rue Rythm, Lille','33 rue Rythm, Lille'),
(6,1,'2024-05-01 10:00:00',0.00,540.00,'en cours','10 rue Musique, Paris','10 rue Musique, Paris'),
(7,2,'2024-05-02 14:00:00',5.00,990.00,'livrée','55 avenue Pro, Lyon','55 avenue Pro, Lyon'),
(8,1,'2024-05-03 11:30:00',0.00,840.00,'en cours','20 rue Jazz, Toulouse','20 rue Jazz, Toulouse');
/*!40000 ALTER TABLE `commandes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commerciaux`
--

DROP TABLE IF EXISTS `commerciaux`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `commerciaux` (
  `id_commercial` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) DEFAULT NULL,
  `prenom` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_commercial`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commerciaux`
--

LOCK TABLES `commerciaux` WRITE;
/*!40000 ALTER TABLE `commerciaux` DISABLE KEYS */;
INSERT INTO `commerciaux` VALUES
(1,'Durand','Sophie','sophie.durand@villagegreen.fr','0102030405'),
(2,'Lemoine','Marc','marc.lemoine@villagegreen.fr','0607080910');
/*!40000 ALTER TABLE `commerciaux` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factures`
--

DROP TABLE IF EXISTS `factures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `factures` (
  `id_facture` int(11) NOT NULL AUTO_INCREMENT,
  `id_commande` int(11) DEFAULT NULL,
  `date_facture` datetime DEFAULT NULL,
  `montant_ht` decimal(10,2) DEFAULT NULL,
  `mode_paiement` varchar(50) DEFAULT NULL,
  `date_paiement` datetime DEFAULT NULL,
  PRIMARY KEY (`id_facture`),
  KEY `id_commande` (`id_commande`),
  CONSTRAINT `factures_ibfk_1` FOREIGN KEY (`id_commande`) REFERENCES `commandes` (`id_commande`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factures`
--

LOCK TABLES `factures` WRITE;
/*!40000 ALTER TABLE `factures` DISABLE KEYS */;
INSERT INTO `factures` VALUES
(1,2,'2024-05-03 09:00:00',990.00,'virement','2024-05-10 12:00:00'),
(2,4,'2024-05-06 13:00:00',1300.00,'chèque','2024-05-12 10:00:00'),
(3,3,'2024-05-04 09:00:00',840.00,'carte','2024-05-04 09:05:00');
/*!40000 ALTER TABLE `factures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fournisseurs`
--

DROP TABLE IF EXISTS `fournisseurs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `fournisseurs` (
  `id_fournisseur` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_fournisseur`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fournisseurs`
--

LOCK TABLES `fournisseurs` WRITE;
/*!40000 ALTER TABLE `fournisseurs` DISABLE KEYS */;
INSERT INTO `fournisseurs` VALUES
(1,'Yamaha','contact@yamaha.com','0147203030'),
(2,'Fender','contact@fender.com','0147506060'),
(3,'Roland','contact@roland.com','0155603030'),
(4,'Gibson','contact@gibson.com','0155904040'),
(5,'Korg','contact@korg.com','0155705050');
/*!40000 ALTER TABLE `fournisseurs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lignes_commande`
--

DROP TABLE IF EXISTS `lignes_commande`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lignes_commande` (
  `id_ligne` int(11) NOT NULL AUTO_INCREMENT,
  `id_commande` int(11) DEFAULT NULL,
  `id_produit` int(11) DEFAULT NULL,
  `quantite` int(11) DEFAULT NULL,
  `prix_unitaire` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_ligne`),
  KEY `id_commande` (`id_commande`),
  KEY `id_produit` (`id_produit`),
  CONSTRAINT `lignes_commande_ibfk_1` FOREIGN KEY (`id_commande`) REFERENCES `commandes` (`id_commande`),
  CONSTRAINT `lignes_commande_ibfk_2` FOREIGN KEY (`id_produit`) REFERENCES `produits` (`id_produit`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lignes_commande`
--

LOCK TABLES `lignes_commande` WRITE;
/*!40000 ALTER TABLE `lignes_commande` DISABLE KEYS */;
INSERT INTO `lignes_commande` VALUES
(1,1,1,1,540.00),
(2,2,4,2,495.00),
(3,3,3,1,840.00),
(4,4,2,2,650.00),
(5,4,5,1,600.00),
(6,8,5,1,600.00),
(7,1,1,1,540.00),
(8,6,4,2,495.00),
(9,3,3,1,840.00),
(10,7,2,2,650.00),
(11,4,5,1,600.00),
(12,5,5,1,600.00);
/*!40000 ALTER TABLE `lignes_commande` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lignes_livraison`
--

DROP TABLE IF EXISTS `lignes_livraison`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `lignes_livraison` (
  `id_ligne` int(11) NOT NULL AUTO_INCREMENT,
  `id_livraison` int(11) DEFAULT NULL,
  `id_produit` int(11) DEFAULT NULL,
  `quantite` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_ligne`),
  KEY `id_livraison` (`id_livraison`),
  KEY `id_produit` (`id_produit`),
  CONSTRAINT `lignes_livraison_ibfk_1` FOREIGN KEY (`id_livraison`) REFERENCES `livraisons` (`id_livraison`),
  CONSTRAINT `lignes_livraison_ibfk_2` FOREIGN KEY (`id_produit`) REFERENCES `produits` (`id_produit`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lignes_livraison`
--

LOCK TABLES `lignes_livraison` WRITE;
/*!40000 ALTER TABLE `lignes_livraison` DISABLE KEYS */;
INSERT INTO `lignes_livraison` VALUES
(1,1,4,2),
(2,2,3,1),
(3,3,2,2),
(4,4,5,1),
(5,5,1,1);
/*!40000 ALTER TABLE `lignes_livraison` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livraisons`
--

DROP TABLE IF EXISTS `livraisons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `livraisons` (
  `id_livraison` int(11) NOT NULL AUTO_INCREMENT,
  `id_commande` int(11) DEFAULT NULL,
  `date_livraison` datetime DEFAULT NULL,
  `statut` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_livraison`),
  KEY `id_commande` (`id_commande`),
  CONSTRAINT `livraisons_ibfk_1` FOREIGN KEY (`id_commande`) REFERENCES `commandes` (`id_commande`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livraisons`
--

LOCK TABLES `livraisons` WRITE;
/*!40000 ALTER TABLE `livraisons` DISABLE KEYS */;
INSERT INTO `livraisons` VALUES
(1,2,'2024-05-04 15:00:00','livré'),
(2,3,'2024-05-04 16:00:00','livré'),
(3,4,'2024-05-06 10:00:00','livré'),
(4,5,'2024-05-07 10:30:00','en cours'),
(5,1,'2024-05-02 10:30:00','en cours');
/*!40000 ALTER TABLE `livraisons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produits`
--

DROP TABLE IF EXISTS `produits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `produits` (
  `id_produit` int(11) NOT NULL AUTO_INCREMENT,
  `libelle_court` varchar(100) DEFAULT NULL,
  `libelle_long` text DEFAULT NULL,
  `ref_fournisseur` varchar(100) DEFAULT NULL,
  `prix_achat` decimal(10,2) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `actif` tinyint(1) DEFAULT 1,
  `id_sousrubrique` int(11) DEFAULT NULL,
  `id_fournisseur` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_produit`),
  KEY `id_sousrubrique` (`id_sousrubrique`),
  KEY `id_fournisseur` (`id_fournisseur`),
  CONSTRAINT `produits_ibfk_1` FOREIGN KEY (`id_sousrubrique`) REFERENCES `sous_rubriques` (`id_sousrubrique`),
  CONSTRAINT `produits_ibfk_2` FOREIGN KEY (`id_fournisseur`) REFERENCES `fournisseurs` (`id_fournisseur`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produits`
--

LOCK TABLES `produits` WRITE;
/*!40000 ALTER TABLE `produits` DISABLE KEYS */;
INSERT INTO `produits` VALUES
(1,'Stratocaster','Guitare électrique Fender Stratocaster','FEN123',450.00,'strat.jpg',20,1,1,2),
(2,'Les Paul','Guitare électrique Gibson Les Paul','GIB456',550.00,'lespaul.jpg',15,1,1,4),
(3,'D-28','Guitare acoustique Martin D-28','MAR789',700.00,'d28.jpg',10,1,2,4),
(4,'P-125','Piano numérique Yamaha P-125','YAM456',500.00,'p125.jpg',12,1,4,1),
(5,'Minilogue','Synthétiseur Korg Minilogue','KOR321',600.00,'minilogue.jpg',8,1,5,5);
/*!40000 ALTER TABLE `produits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rubriques`
--

DROP TABLE IF EXISTS `rubriques`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `rubriques` (
  `id_rubrique` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_rubrique`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rubriques`
--

LOCK TABLES `rubriques` WRITE;
/*!40000 ALTER TABLE `rubriques` DISABLE KEYS */;
INSERT INTO `rubriques` VALUES
(1,'Cordes'),
(2,'Claviers');
/*!40000 ALTER TABLE `rubriques` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sous_rubriques`
--

DROP TABLE IF EXISTS `sous_rubriques`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sous_rubriques` (
  `id_sousrubrique` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) DEFAULT NULL,
  `id_rubrique` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_sousrubrique`),
  KEY `id_rubrique` (`id_rubrique`),
  CONSTRAINT `sous_rubriques_ibfk_1` FOREIGN KEY (`id_rubrique`) REFERENCES `rubriques` (`id_rubrique`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sous_rubriques`
--

LOCK TABLES `sous_rubriques` WRITE;
/*!40000 ALTER TABLE `sous_rubriques` DISABLE KEYS */;
INSERT INTO `sous_rubriques` VALUES
(1,'Guitares électriques',1),
(2,'Guitares acoustiques',1),
(3,'Basses',1),
(4,'Pianos numériques',2),
(5,'Synthétiseurs',2);
/*!40000 ALTER TABLE `sous_rubriques` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `Jointure_p_f`
--

/*!50001 DROP VIEW IF EXISTS `Jointure_p_f`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`alice`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `Jointure_p_f` AS select `p`.`id_produit` AS `id_produit`,`p`.`libelle_court` AS `libelle_court`,`p`.`ref_fournisseur` AS `ref_fournisseur`,`p`.`prix_achat` AS `prix_achat`,`p`.`photo` AS `photo`,`p`.`id_fournisseur` AS `id_fournisseur`,`p`.`id_sousrubrique` AS `id_sousrubrique`,`f`.`nom` AS `nom`,`f`.`email` AS `email`,`f`.`tel` AS `tel` from (`produits` `p` join `fournisseurs` `f` on(`f`.`id_fournisseur` = `p`.`id_fournisseur`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Jointure_p_rub`
--

/*!50001 DROP VIEW IF EXISTS `Jointure_p_rub`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`alice`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `Jointure_p_rub` AS select `p`.`id_produit` AS `id_produit`,`p`.`libelle_court` AS `libelle_court`,`p`.`ref_fournisseur` AS `ref_fournisseur`,`p`.`prix_achat` AS `prix_achat`,`p`.`photo` AS `photo`,`p`.`id_fournisseur` AS `id_fournisseur`,`p`.`id_sousrubrique` AS `id_sousrubrique`,`ss`.`nom` AS `nom_ssrubrique`,`r`.`nom` AS `nom_rubrique` from ((`produits` `p` join `sous_rubriques` `ss` on(`ss`.`id_sousrubrique` = `p`.`id_sousrubrique`)) join `rubriques` `r` on(`r`.`id_rubrique` = `ss`.`id_rubrique`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-01 11:16:38
