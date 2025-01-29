-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: newschema
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `hobune`
--

DROP TABLE IF EXISTS `hobune`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hobune` (
  `idHobune` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nimi` varchar(255) DEFAULT NULL,
  `sünniaeg` date DEFAULT NULL,
  `Välimus` varchar(255) DEFAULT NULL,
  `Tall_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`idHobune`),
  KEY `fk_Hobune_Tall_idx` (`Tall_id`),
  CONSTRAINT `fk_Hobune_Tall` FOREIGN KEY (`Tall_id`) REFERENCES `tall` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hobune`
--

LOCK TABLES `hobune` WRITE;
/*!40000 ALTER TABLE `hobune` DISABLE KEYS */;
INSERT INTO `hobune` VALUES (2,'Piksi','2025-01-29','Mustade laikudega valge hobune',2);
/*!40000 ALTER TABLE `hobune` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hobune_has_omanik`
--

DROP TABLE IF EXISTS `hobune_has_omanik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hobune_has_omanik` (
  `Hobune_idHobune` bigint unsigned NOT NULL,
  `Omanik_idOmanik` bigint unsigned NOT NULL,
  PRIMARY KEY (`Hobune_idHobune`,`Omanik_idOmanik`),
  KEY `fk_Hobune_has_Omanik_Omanik1_idx` (`Omanik_idOmanik`),
  KEY `fk_Hobune_has_Omanik_Hobune1_idx` (`Hobune_idHobune`),
  CONSTRAINT `fk_Hobune_has_Omanik_Hobune1` FOREIGN KEY (`Hobune_idHobune`) REFERENCES `hobune` (`idHobune`),
  CONSTRAINT `fk_Hobune_has_Omanik_Omanik1` FOREIGN KEY (`Omanik_idOmanik`) REFERENCES `omanik` (`idOmanik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hobune_has_omanik`
--

LOCK TABLES `hobune_has_omanik` WRITE;
/*!40000 ALTER TABLE `hobune_has_omanik` DISABLE KEYS */;
/*!40000 ALTER TABLE `hobune_has_omanik` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `omanik`
--

DROP TABLE IF EXISTS `omanik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `omanik` (
  `idOmanik` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nimi` varchar(255) DEFAULT NULL,
  `hobune_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idOmanik`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `omanik`
--

LOCK TABLES `omanik` WRITE;
/*!40000 ALTER TABLE `omanik` DISABLE KEYS */;
INSERT INTO `omanik` VALUES (1,'Siim Marten Schmidt',2,NULL);
/*!40000 ALTER TABLE `omanik` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tall`
--

DROP TABLE IF EXISTS `tall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tall` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `asukoht` varchar(255) DEFAULT NULL,
  `kirjeldus` varchar(255) DEFAULT NULL,
  `hind` decimal(10,2) DEFAULT NULL,
  `Varustus_idVarustus` bigint unsigned NOT NULL,
  `Varustus_talli_id` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Tall_Varustus1_idx` (`Varustus_idVarustus`,`Varustus_talli_id`),
  CONSTRAINT `fk_Tall_Varustus1` FOREIGN KEY (`Varustus_idVarustus`, `Varustus_talli_id`) REFERENCES `varustus` (`idVarustus`, `talli_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tall`
--

LOCK TABLES `tall` WRITE;
/*!40000 ALTER TABLE `tall` DISABLE KEYS */;
INSERT INTO `tall` VALUES (2,'Tallinn','Tall Tallinnas',500.00,1,'1');
/*!40000 ALTER TABLE `tall` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treening`
--

DROP TABLE IF EXISTS `treening`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `treening` (
  `idTreening` bigint NOT NULL,
  `Treening_programm_id` bigint NOT NULL,
  PRIMARY KEY (`idTreening`,`Treening_programm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treening`
--

LOCK TABLES `treening` WRITE;
/*!40000 ALTER TABLE `treening` DISABLE KEYS */;
/*!40000 ALTER TABLE `treening` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treeningprogramm`
--

DROP TABLE IF EXISTS `treeningprogramm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `treeningprogramm` (
  `idTreeningprogramm` bigint unsigned NOT NULL AUTO_INCREMENT,
  `hobune_id` bigint NOT NULL,
  `kirjeldus` varchar(255) DEFAULT NULL,
  `hind` decimal(8,2) DEFAULT NULL,
  `Treening_idTreening` bigint NOT NULL,
  `Treening_Treening_programm_id` bigint NOT NULL,
  `Hobune_idHobune` bigint unsigned NOT NULL,
  PRIMARY KEY (`idTreeningprogramm`,`hobune_id`),
  UNIQUE KEY `idTreeningprogramm_UNIQUE` (`idTreeningprogramm`),
  KEY `fk_Treeningprogramm_Treening1_idx` (`Treening_idTreening`,`Treening_Treening_programm_id`),
  KEY `fk_Treeningprogramm_Hobune1_idx` (`Hobune_idHobune`),
  CONSTRAINT `fk_Treeningprogramm_Hobune1` FOREIGN KEY (`Hobune_idHobune`) REFERENCES `hobune` (`idHobune`),
  CONSTRAINT `fk_Treeningprogramm_Treening1` FOREIGN KEY (`Treening_idTreening`, `Treening_Treening_programm_id`) REFERENCES `treening` (`idTreening`, `Treening_programm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treeningprogramm`
--

LOCK TABLES `treeningprogramm` WRITE;
/*!40000 ALTER TABLE `treeningprogramm` DISABLE KEYS */;
/*!40000 ALTER TABLE `treeningprogramm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `varustus`
--

DROP TABLE IF EXISTS `varustus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `varustus` (
  `idVarustus` bigint unsigned NOT NULL AUTO_INCREMENT,
  `varustuse_nimi` varchar(45) DEFAULT NULL,
  `talli_id` varchar(45) NOT NULL,
  PRIMARY KEY (`idVarustus`,`talli_id`),
  UNIQUE KEY `idVarustus_UNIQUE` (`idVarustus`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `varustus`
--

LOCK TABLES `varustus` WRITE;
/*!40000 ALTER TABLE `varustus` DISABLE KEYS */;
INSERT INTO `varustus` VALUES (1,'reha','1');
/*!40000 ALTER TABLE `varustus` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-29 13:46:08
