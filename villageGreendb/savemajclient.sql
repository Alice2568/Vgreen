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
-- Table structure for table `Produit`
--

DROP TABLE IF EXISTS `Produit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Produit` (
  `Id_Produit` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(50) DEFAULT NULL,
  `Description` varchar(50) DEFAULT NULL,
  `Ref_Fournisseur` varchar(50) DEFAULT NULL,
  `PrixHA` decimal(7,2) DEFAULT NULL,
  `PrixHt` decimal(7,2) DEFAULT NULL,
  `image` varchar(50) DEFAULT NULL,
  `Id_fournisseur` int(11) NOT NULL,
  `Id_sous_rubrique` int(11) NOT NULL,
  PRIMARY KEY (`Id_Produit`),
  KEY `Id_fournisseur` (`Id_fournisseur`),
  KEY `Id_sous_rubrique` (`Id_sous_rubrique`),
  CONSTRAINT `Produit_ibfk_1` FOREIGN KEY (`Id_fournisseur`) REFERENCES `fournisseur` (`Id_fournisseur`),
  CONSTRAINT `Produit_ibfk_2` FOREIGN KEY (`Id_sous_rubrique`) REFERENCES `sous_rubrique` (`Id_sous_rubrique`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Produit`
--

LOCK TABLES `Produit` WRITE;
/*!40000 ALTER TABLE `Produit` DISABLE KEYS */;
INSERT INTO `Produit` VALUES
(1,'Guitare acoustique','Guitare folk 6 cordes','YAM-GA-001',150.00,220.00,'guitare.jpg',1,1),
(2,'Batterie électronique','Kit complet','YAM-DR-002',500.00,750.00,'batterie.jpg',1,2),
(3,'Câble XLR','Câble 5m XLR','SHU-CB-003',10.00,15.00,'cable.jpg',3,3),
(4,'Ampli guitare','Ampli 100W','FEN-AMP-004',200.00,300.00,'ampli.jpg',2,4);
/*!40000 ALTER TABLE `Produit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `Id_client` int(11) NOT NULL AUTO_INCREMENT,
  `adresse` varchar(50) DEFAULT NULL,
  `mail` varchar(50) DEFAULT NULL,
  `telephone` varchar(50) DEFAULT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `coeff_taxe` decimal(5,2) DEFAULT NULL,
  `Id_commerciale_particulier` int(11) NOT NULL,
  `pro` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id_client`),
  KEY `Id_commerciale_particulier` (`Id_commerciale_particulier`),
  CONSTRAINT `client_ibfk_1` FOREIGN KEY (`Id_commerciale_particulier`) REFERENCES `commerciale` (`Id_commerciale`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES
(1,'12 avenue des artistes','client1@mail.com','0612345678','Alice Mélodie',1.20,1,NULL),
(2,'34 rue du son','client2@mail.com','0698765432','Bob Harmonie',1.20,2,NULL);
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commande`
--

DROP TABLE IF EXISTS `commande`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `commande` (
  `Id_commande` int(11) NOT NULL AUTO_INCREMENT,
  `adresse_livraison` varchar(50) DEFAULT NULL,
  `adresse_facturation` varchar(50) DEFAULT NULL,
  `date_archivage` datetime DEFAULT NULL,
  `paiement` tinyint(1) DEFAULT NULL,
  `reduction` varchar(50) DEFAULT NULL,
  `Id_client` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id_commande`),
  KEY `Id_client` (`Id_client`),
  CONSTRAINT `Id_client` FOREIGN KEY (`Id_client`) REFERENCES `client` (`Id_client`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commande`
--

LOCK TABLES `commande` WRITE;
/*!40000 ALTER TABLE `commande` DISABLE KEYS */;
INSERT INTO `commande` VALUES
(1,'12 avenue des artistes','12 avenue des artistes','2025-04-01 10:00:00',1,'Aucune',NULL),
(2,'34 rue du son','34 rue du son','2025-04-02 11:30:00',0,'10%',NULL);
/*!40000 ALTER TABLE `commande` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commerciale`
--

DROP TABLE IF EXISTS `commerciale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `commerciale` (
  `Id_commerciale` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id_commerciale`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commerciale`
--

LOCK TABLES `commerciale` WRITE;
/*!40000 ALTER TABLE `commerciale` DISABLE KEYS */;
INSERT INTO `commerciale` VALUES
(1,'Jean Dupont'),
(2,'Marie Claire');
/*!40000 ALTER TABLE `commerciale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contient`
--

DROP TABLE IF EXISTS `contient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `contient` (
  `Id_Produit` int(11) NOT NULL,
  `Id_commande` int(11) NOT NULL,
  `quantité` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id_Produit`,`Id_commande`),
  KEY `Id_commande` (`Id_commande`),
  CONSTRAINT `contient_ibfk_1` FOREIGN KEY (`Id_Produit`) REFERENCES `Produit` (`Id_Produit`),
  CONSTRAINT `contient_ibfk_2` FOREIGN KEY (`Id_commande`) REFERENCES `commande` (`Id_commande`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contient`
--

LOCK TABLES `contient` WRITE;
/*!40000 ALTER TABLE `contient` DISABLE KEYS */;
INSERT INTO `contient` VALUES
(1,1,1),
(2,2,1),
(3,1,2),
(4,2,1);
/*!40000 ALTER TABLE `contient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fournisseur`
--

DROP TABLE IF EXISTS `fournisseur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `fournisseur` (
  `Id_fournisseur` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id_fournisseur`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fournisseur`
--

LOCK TABLES `fournisseur` WRITE;
/*!40000 ALTER TABLE `fournisseur` DISABLE KEYS */;
INSERT INTO `fournisseur` VALUES
(1,'Yamaha'),
(2,'Fender'),
(3,'Shure');
/*!40000 ALTER TABLE `fournisseur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livraison`
--

DROP TABLE IF EXISTS `livraison`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `livraison` (
  `Id_livraison` int(11) NOT NULL AUTO_INCREMENT,
  `adresse` varchar(50) DEFAULT NULL,
  `quantite` varchar(50) DEFAULT NULL,
  `date_archivage` datetime DEFAULT NULL,
  `Id_commande` int(11) NOT NULL,
  PRIMARY KEY (`Id_livraison`),
  KEY `Id_commande` (`Id_commande`),
  CONSTRAINT `livraison_ibfk_1` FOREIGN KEY (`Id_commande`) REFERENCES `commande` (`Id_commande`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livraison`
--

LOCK TABLES `livraison` WRITE;
/*!40000 ALTER TABLE `livraison` DISABLE KEYS */;
INSERT INTO `livraison` VALUES
(1,'12 avenue des artistes','1','2025-04-03 09:00:00',1),
(2,'34 rue du son','2','2025-04-04 15:00:00',2);
/*!40000 ALTER TABLE `livraison` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rubrique`
--

DROP TABLE IF EXISTS `rubrique`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `rubrique` (
  `Id_rubrique` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id_rubrique`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rubrique`
--

LOCK TABLES `rubrique` WRITE;
/*!40000 ALTER TABLE `rubrique` DISABLE KEYS */;
INSERT INTO `rubrique` VALUES
(1,'Instruments de musique'),
(2,'Accessoires'),
(3,'Sonorisation');
/*!40000 ALTER TABLE `rubrique` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sous_rubrique`
--

DROP TABLE IF EXISTS `sous_rubrique`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sous_rubrique` (
  `Id_sous_rubrique` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) DEFAULT NULL,
  `Id_rubrique` int(11) NOT NULL,
  PRIMARY KEY (`Id_sous_rubrique`),
  KEY `Id_rubrique` (`Id_rubrique`),
  CONSTRAINT `sous_rubrique_ibfk_1` FOREIGN KEY (`Id_rubrique`) REFERENCES `rubrique` (`Id_rubrique`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sous_rubrique`
--

LOCK TABLES `sous_rubrique` WRITE;
/*!40000 ALTER TABLE `sous_rubrique` DISABLE KEYS */;
INSERT INTO `sous_rubrique` VALUES
(1,'Guitares',1),
(2,'Batteries',1),
(3,'Câbles audio',2),
(4,'Amplis',3);
/*!40000 ALTER TABLE `sous_rubrique` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-25 20:18:00
