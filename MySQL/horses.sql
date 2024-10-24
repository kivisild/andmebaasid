-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: horses
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
-- Table structure for table `access`
--

DROP TABLE IF EXISTS `access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `access` (
  `user_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` bigint unsigned DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `permissions` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `access_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access`
--

LOCK TABLES `access` WRITE;
/*!40000 ALTER TABLE `access` DISABLE KEYS */;
/*!40000 ALTER TABLE `access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `employee_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `contact_info` varchar(255) DEFAULT NULL,
  `work_schedule` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horse`
--

DROP TABLE IF EXISTS `horse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `horse` (
  `horse_id` bigint NOT NULL AUTO_INCREMENT,
  `horse_name` varchar(255) NOT NULL,
  `date_of_birth` int NOT NULL,
  `stall_number` varchar(8) NOT NULL,
  `owner_name` varchar(255) NOT NULL,
  PRIMARY KEY (`horse_id`),
  KEY `stall_number` (`stall_number`),
  CONSTRAINT `horse_ibfk_1` FOREIGN KEY (`stall_number`) REFERENCES `stable` (`stall_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horse`
--

LOCK TABLES `horse` WRITE;
/*!40000 ALTER TABLE `horse` DISABLE KEYS */;
INSERT INTO `horse` VALUES (1,'Kahli',2010,'5','Aadu Laid'),(2,'Kaine',2011,'5A','Ester Teeveer'),(3,'Kalina',2012,'7','Raul Väli'),(4,'Kalondra',2013,'7','Raul Väli'),(5,'Kar Kalim',2014,'7','Raul Väli'),(6,'Karisha',2015,'7A','Mihkel Soo'),(7,'Kasimira',2016,'7A','Mihkel Soo'),(8,'Katareena',2017,'7A','Mihkel Soo'),(9,'Katifa',2018,'7A','Oskar Vallik'),(10,'Kayleigh',2019,'7A','Oskar Vallik'),(11,'Keener Than Keen',2020,'7A','Oskar Vallik'),(12,'Kei',2021,'7B','Reet Romanjuk'),(13,'Kellendria',2022,'7B','Reet Romanjuk'),(14,'Kelly Green',2010,'7B','Oskar Vallik'),(15,'Kelvin',2011,'7B','Oskar Vallik'),(16,'Keno',2012,'7B','Oskar Vallik'),(17,'Kentucky Roses',2013,'7B','Oskar Vallik'),(18,'Kermit',2014,'2','Paavo Neihaus'),(19,'Kevah',2015,'2','Carina Romana Ciaro'),(20,'Kiawa',2016,'2','Carina Romana Ciaro'),(21,'King',2017,'2','Carina Romana Ciaro'),(22,'King Quakers crystal',2018,'2','Carina Romana Ciaro'),(23,'Kings Ransom',2019,'2','Carina Romana Ciaro'),(24,'Kipawa',2020,'2','Carina Romana Ciaro'),(25,'Kirby',2021,'2','Carina Romana Ciaro'),(26,'Kiss',2022,'5','Aadu Laid'),(27,'Kiss Me Clown',2010,'5','Aadu Laid'),(28,'Kissin the Sky',2011,'5','Aadu Laid'),(29,'Kit Kat\'s Chat',2012,'5','Aadu Laid'),(30,'Kitty Hawk',2013,'5','Aadu Laid'),(31,'Kizi',2014,'5','Mihkel Soo'),(32,'Knight',2015,'5','Mihkel Soo'),(33,'Kochiese',2016,'5','Karin Hallas'),(34,'Kodiak',2017,'5','Karin Hallas');
/*!40000 ALTER TABLE `horse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory` (
  `item_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `item_name` varchar(255) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `value` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owner`
--

DROP TABLE IF EXISTS `owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `owner` (
  `owner_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `phone` bigint DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`owner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owner`
--

LOCK TABLES `owner` WRITE;
/*!40000 ALTER TABLE `owner` DISABLE KEYS */;
INSERT INTO `owner` VALUES (1,'Aadu Laid',55231231,NULL,'Tallinn'),(2,'Ester Teeveer',5832325,NULL,'Kuressaare'),(3,'Reet Romanjuk',52377,NULL,'Pärnu'),(4,'Karin Hallas',557877667,NULL,'Mooste'),(5,'Carina Romana Ciaro',53242342,NULL,'Ikla');
/*!40000 ALTER TABLE `owner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stable`
--

DROP TABLE IF EXISTS `stable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stable` (
  `stall_id` varchar(8) NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`stall_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stable`
--

LOCK TABLES `stable` WRITE;
/*!40000 ALTER TABLE `stable` DISABLE KEYS */;
INSERT INTO `stable` VALUES ('2','Karksi'),('5','Tallinn'),('5A','Tallinn'),('7','Jäneda'),('7A','Jäneda'),('7B','Jäneda');
/*!40000 ALTER TABLE `stable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veterinary`
--

DROP TABLE IF EXISTS `veterinary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `veterinary` (
  `vet_id` bigint NOT NULL AUTO_INCREMENT,
  `service` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `nimi` varchar(255) DEFAULT NULL,
  `horse_id` bigint DEFAULT NULL,
  PRIMARY KEY (`vet_id`),
  KEY `horse_id` (`horse_id`),
  CONSTRAINT `veterinary_ibfk_1` FOREIGN KEY (`horse_id`) REFERENCES `horse` (`horse_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veterinary`
--

LOCK TABLES `veterinary` WRITE;
/*!40000 ALTER TABLE `veterinary` DISABLE KEYS */;
/*!40000 ALTER TABLE `veterinary` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-26 15:29:54
