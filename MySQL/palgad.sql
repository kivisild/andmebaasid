-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: palgad
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `ettevõte`
--

DROP TABLE IF EXISTS `ettevõte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ettevõte` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `kood` int unsigned DEFAULT NULL,
  `nimi` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ettevõte`
--

LOCK TABLES `ettevõte` WRITE;
/*!40000 ALTER TABLE `ettevõte` DISABLE KEYS */;
INSERT INTO `ettevõte` VALUES (1,715904,'Venturis OÜ'),(2,125071,'Levira OÜ');
/*!40000 ALTER TABLE `ettevõte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `palgamakse`
--

DROP TABLE IF EXISTS `palgamakse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `palgamakse` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `töölise_id` smallint unsigned DEFAULT NULL,
  `summa` int DEFAULT NULL,
  `kuupäev` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `töölise_id` (`töölise_id`),
  CONSTRAINT `palgamakse_ibfk_1` FOREIGN KEY (`töölise_id`) REFERENCES `palk` (`töölise_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `palgamakse`
--

LOCK TABLES `palgamakse` WRITE;
/*!40000 ALTER TABLE `palgamakse` DISABLE KEYS */;
INSERT INTO `palgamakse` VALUES (3,1,5000,'2024-10-24'),(4,1,10000,'2024-12-28');
/*!40000 ALTER TABLE `palgamakse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `palk`
--

DROP TABLE IF EXISTS `palk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `palk` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `summa` int DEFAULT NULL,
  `töölise_id` smallint unsigned DEFAULT NULL,
  `ettevõtte_id` smallint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `töölise_id` (`töölise_id`),
  KEY `ettevõtte_id` (`ettevõtte_id`),
  CONSTRAINT `palk_ibfk_1` FOREIGN KEY (`töölise_id`) REFERENCES `tööline` (`id`),
  CONSTRAINT `palk_ibfk_2` FOREIGN KEY (`ettevõtte_id`) REFERENCES `ettevõte` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `palk`
--

LOCK TABLES `palk` WRITE;
/*!40000 ALTER TABLE `palk` DISABLE KEYS */;
INSERT INTO `palk` VALUES (1,5000,1,1),(2,10000,1,1);
/*!40000 ALTER TABLE `palk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tööline`
--

DROP TABLE IF EXISTS `tööline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tööline` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `isikukood` bigint DEFAULT NULL,
  `eesnimi` varchar(255) DEFAULT NULL,
  `perekonnanimi` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tööline`
--

LOCK TABLES `tööline` WRITE;
/*!40000 ALTER TABLE `tööline` DISABLE KEYS */;
INSERT INTO `tööline` VALUES (1,50204080229,'Siim Marten','Schmidt');
/*!40000 ALTER TABLE `tööline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `tööliste_palga_summa`
--

DROP TABLE IF EXISTS `tööliste_palga_summa`;
/*!50001 DROP VIEW IF EXISTS `tööliste_palga_summa`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `tööliste_palga_summa` AS SELECT 
 1 AS `eesnimi`,
 1 AS `perekonnanimi`,
 1 AS `summa`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `tööliste_palga_summa`
--

/*!50001 DROP VIEW IF EXISTS `tööliste_palga_summa`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `tööliste_palga_summa` AS select `t`.`eesnimi` AS `eesnimi`,`t`.`perekonnanimi` AS `perekonnanimi`,sum(`pm`.`summa`) AS `summa` from (`tööline` `t` join `palgamakse` `pm` on((`pm`.`töölise_id` = `t`.`id`))) group by `t`.`eesnimi`,`t`.`perekonnanimi` */;
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

-- Dump completed on 2024-10-24 16:59:12
