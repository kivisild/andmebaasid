-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
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
-- Table structure for table `club`
--

DROP TABLE IF EXISTS `club`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `club` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `location` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `stadium` varchar(255) DEFAULT NULL,
  `createdat` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COMMENT='		\n';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `club`
--

LOCK TABLES `club` WRITE;
/*!40000 ALTER TABLE `club` DISABLE KEYS */;
INSERT INTO `club` VALUES (1,'Tallinn','Eesti koondis','A. Le. Coq Arena','2025-02-05 16:56:56'),(2,'Helsinki','Finnish team','Helsinki arena','2025-02-05 16:56:56');
/*!40000 ALTER TABLE `club` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coach`
--

DROP TABLE IF EXISTS `coach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coach` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `countryid` char(3) NOT NULL,
  `createdat` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coach`
--

LOCK TABLES `coach` WRITE;
/*!40000 ALTER TABLE `coach` DISABLE KEYS */;
INSERT INTO `coach` VALUES (1,'Siim Marten','Schmidt','EST','2025-02-05 16:52:46'),(2,'Lembit','Raikonen','FIN','2025-02-05 16:52:46');
/*!40000 ALTER TABLE `coach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coach_has_club`
--

DROP TABLE IF EXISTS `coach_has_club`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coach_has_club` (
  `Coach_id` bigint unsigned NOT NULL,
  `Club_id` bigint unsigned NOT NULL,
  `createdat` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Coach_id`,`Club_id`),
  KEY `fk_Coach_has_Club_Club1_idx` (`Club_id`),
  KEY `fk_Coach_has_Club_Coach1_idx` (`Coach_id`),
  CONSTRAINT `fk_Coach_has_Club_Club1` FOREIGN KEY (`Club_id`) REFERENCES `club` (`id`),
  CONSTRAINT `fk_Coach_has_Club_Coach1` FOREIGN KEY (`Coach_id`) REFERENCES `coach` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coach_has_club`
--

LOCK TABLES `coach_has_club` WRITE;
/*!40000 ALTER TABLE `coach_has_club` DISABLE KEYS */;
/*!40000 ALTER TABLE `coach_has_club` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` char(3) NOT NULL,
  `name` varchar(255) NOT NULL,
  `createdat` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `code_UNIQUE` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'EST','Estonia','2025-02-05 16:51:32'),(2,'FIN','Finland','2025-02-05 16:51:57');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formation`
--

DROP TABLE IF EXISTS `formation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formation` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `createdat` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Formationcol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formation`
--

LOCK TABLES `formation` WRITE;
/*!40000 ALTER TABLE `formation` DISABLE KEYS */;
INSERT INTO `formation` VALUES (1,'Attacking position','2025-02-05 16:52:46',NULL),(2,'Defending position','2025-02-05 16:52:46',NULL);
/*!40000 ALTER TABLE `formation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game`
--

DROP TABLE IF EXISTS `game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `homescore` int unsigned DEFAULT NULL,
  `foreignscore` int unsigned DEFAULT NULL,
  `gametime` datetime DEFAULT NULL,
  `homeclub` bigint unsigned NOT NULL,
  `foreignclub` bigint unsigned NOT NULL,
  `homeformation` bigint unsigned NOT NULL,
  `foreignformation` bigint unsigned NOT NULL,
  `createdat` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_Game_Club1_idx` (`homeclub`),
  KEY `fk_Game_Club2_idx` (`foreignclub`),
  KEY `fk_Game_Formation1_idx` (`homeformation`),
  KEY `fk_Game_Formation2_idx` (`foreignformation`),
  CONSTRAINT `fk_Game_Club1` FOREIGN KEY (`homeclub`) REFERENCES `club` (`id`),
  CONSTRAINT `fk_Game_Club2` FOREIGN KEY (`foreignclub`) REFERENCES `club` (`id`),
  CONSTRAINT `fk_Game_Formation1` FOREIGN KEY (`homeformation`) REFERENCES `formation` (`id`),
  CONSTRAINT `fk_Game_Formation2` FOREIGN KEY (`foreignformation`) REFERENCES `formation` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game`
--

LOCK TABLES `game` WRITE;
/*!40000 ALTER TABLE `game` DISABLE KEYS */;
INSERT INTO `game` VALUES (1,5,0,NULL,1,2,1,2,'2025-02-05 16:59:36');
/*!40000 ALTER TABLE `game` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gameplayer`
--

DROP TABLE IF EXISTS `gameplayer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gameplayer` (
  `playerid` bigint unsigned NOT NULL,
  `gameid` bigint unsigned NOT NULL,
  `createdat` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`playerid`,`gameid`),
  KEY `fk_Gameplayer_Player1_idx` (`playerid`),
  KEY `fk_Gameplayer_Game1_idx` (`gameid`),
  CONSTRAINT `fk_Gameplayer_Game1` FOREIGN KEY (`gameid`) REFERENCES `game` (`id`),
  CONSTRAINT `fk_Gameplayer_Player1` FOREIGN KEY (`playerid`) REFERENCES `player` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gameplayer`
--

LOCK TABLES `gameplayer` WRITE;
/*!40000 ALTER TABLE `gameplayer` DISABLE KEYS */;
INSERT INTO `gameplayer` VALUES (1,1,'2025-02-05 17:02:30');
/*!40000 ALTER TABLE `gameplayer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `salary` int DEFAULT NULL,
  `clubid` bigint unsigned NOT NULL,
  `countryid` bigint unsigned NOT NULL,
  `createdat` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`countryid`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_Player_Club_idx` (`clubid`),
  KEY `fk_Player_country1_idx` (`countryid`),
  CONSTRAINT `fk_Player_Club` FOREIGN KEY (`clubid`) REFERENCES `club` (`id`),
  CONSTRAINT `fk_Player_country1` FOREIGN KEY (`countryid`) REFERENCES `country` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COMMENT='		';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` VALUES (1,'Villem','Hardi',5000,1,1,'2025-02-05 16:57:09'),(2,'Siim','Kuningas',999,1,1,'2025-02-05 16:57:09'),(3,'Siim','Kallas',99999,1,1,'2025-02-05 16:57:09'),(4,'Aino','Korhonen',5120,2,2,'2025-02-05 16:57:09'),(5,'Juhani','Lahtinen',6718,2,2,'2025-02-05 16:57:09'),(6,'Sari','Niemi',4215,2,2,'2025-02-05 16:57:09');
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-05 19:03:55
