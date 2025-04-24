CREATE DATABASE  IF NOT EXISTS `reservations_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `reservations_db`;
-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: reservations_db
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `rubrique`
--

DROP TABLE IF EXISTS `rubrique`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rubrique` (
  `idRubrique` int NOT NULL AUTO_INCREMENT,
  `idSpec` int DEFAULT NULL,
  `dateRubrique` date DEFAULT NULL,
  `heureRubrique` time DEFAULT NULL,
  `LieuRubrique` varchar(255) DEFAULT NULL,
  `nombreSpectateur` int DEFAULT NULL,
  `places_reservees` text,
  PRIMARY KEY (`idRubrique`),
  KEY `idSpec` (`idSpec`),
  CONSTRAINT `rubrique_ibfk_1` FOREIGN KEY (`idSpec`) REFERENCES `spectacle` (`idSpec`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rubrique`
--

LOCK TABLES `rubrique` WRITE;
/*!40000 ALTER TABLE `rubrique` DISABLE KEYS */;
INSERT INTO `rubrique` VALUES (1,12,'2025-05-01','20:00:00','Théâtre Municipal de Tunis',47,'1,2,8,15,47'),(2,12,'2025-05-15','20:00:00','Théâtre El Menzah',46,'16,1,8,27,28,15'),(3,12,'2025-06-30','19:30:00','Cité de la Culture - Tunis',48,'1,14,18,15'),(4,13,'2025-05-02','21:00:00','Théâtre de Carthage',46,'18,20,14,46,15,47'),(5,13,'2025-05-16','21:00:00','Théâtre Le Rio',47,'1,35,12,13,14'),(6,13,'2025-06-15','20:30:00','Maison de la Culture Ibn Rachiq',48,'10,14,12,13'),(7,14,'2025-05-03','20:30:00','Théâtre Municipal de Tunis',46,'1,2,40,10,12,13,29'),(8,14,'2025-06-20','21:00:00','Théâtre Halfaouine',47,'1,8,10,12,13,29'),(9,14,'2025-08-10','20:00:00','Théâtre de Carthage',44,'40,41,10,12,28,13,14,47'),(10,15,'2025-05-04','20:30:00','Théâtre El Menzah',44,'1,8,40,10,27,12,13,46,47'),(11,15,'2025-05-25','19:45:00','Cité de la Culture - Tunis',45,'20,8,40,10,43,13,30,47'),(12,15,'2025-07-05','20:00:00','Théâtre de Carthage',43,'1,8,40,10,12,13,45,46,47,31'),(13,16,'2025-05-06','21:00:00','Théâtre Municipal de Tunis',48,'10,1,8,12,13'),(14,16,'2025-06-22','20:30:00','Théâtre El Menzah',47,'33,20,8,10,13,30'),(15,16,'2025-08-25','21:00:00','Théâtre Le Rio',47,'20,8,10,13,30,47'),(16,17,'2025-05-07','19:00:00','Maison de la Culture Ibn Rachiq',46,'1,35,8,10,12,13,47'),(17,17,'2025-06-12','19:30:00','Théâtre de Carthage',43,'32,0,33,10,12,13,29,14,47'),(18,17,'2025-08-15','20:00:00','Théâtre Municipal de Tunis',46,'20,8,10,42,13,30,47'),(19,18,'2025-05-08','20:00:00','Théâtre El Menzah',45,'1,8,40,10,12,13,46,47'),(20,18,'2025-06-18','20:30:00','Cité de la Culture - Tunis',47,'34,20,8,10,13,30'),(21,18,'2025-08-22','21:00:00','Théâtre de Carthage',46,'1,8,10,12,13,46,47'),(22,19,'2025-05-10','21:30:00','Théâtre Municipal de Tunis',47,'10,12,13,14,47'),(23,19,'2025-06-23','21:00:00','Théâtre Halfaouine',47,'20,8,40,10,13,30'),(24,19,'2025-08-28','21:30:00','Théâtre El Menzah',48,'10,1,8,12,13'),(25,20,'2025-05-11','22:00:00','Théâtre de Carthage',48,'10,14,12,13'),(26,20,'2025-06-25','22:00:00','Cité de la Culture - Tunis',45,'8,40,10,27,13,30,46,47'),(27,20,'2025-08-30','22:00:00','Théâtre Municipal de Tunis',48,'10,14,12,13'),(28,21,'2025-05-12','20:00:00','Théâtre El Menzah',48,'10,1,8,12,13'),(29,21,'2025-06-26','20:30:00','Théâtre de Carthage',45,'10,43,12,44,28,13,14'),(30,21,'2025-08-02','20:00:00','Théâtre Municipal de Tunis',45,'37,7,8,40,10,27,13,30'),(31,22,'2025-05-13','20:30:00','Théâtre Municipal de Tunis',48,'10,1,18,12,13'),(32,22,'2025-06-28','20:00:00','Théâtre El Menzah',43,'25,10,12,13,29,14,46,30,47'),(33,22,'2025-08-03','20:30:00','Cité de la Culture - Tunis',48,'10,30,8,40,13'),(34,23,'2025-05-14','21:00:00','Théâtre Halfaouine',45,'24,10,43,12,44,13,14'),(35,23,'2025-06-29','21:00:00','Théâtre Municipal de Tunis',45,'1,33,18,34,10,12,13,45'),(36,23,'2025-08-04','21:00:00','Théâtre de Carthage',46,'1,18,10,12,44,13,30'),(37,24,'2025-05-15','21:30:00','Théâtre El Menzah',48,'10,30,8,40,13'),(38,24,'2025-06-30','21:00:00','Théâtre de Carthage',48,'10,14,12,13'),(39,24,'2025-08-05','21:30:00','Théâtre Municipal de Tunis',45,'3,40,10,12,13,14,47'),(40,25,'2025-05-16','20:00:00','Théâtre de Carthage',47,'8,40,10,13,30,47'),(41,25,'2025-07-01','20:00:00','Théâtre El Menzah',47,'36,10,12,13,14'),(42,25,'2025-08-06','20:00:00','Maison de la Culture Ibn Rachiq',47,'1,18,36,10,12,13'),(43,26,'2025-05-17','20:30:00','Théâtre Municipal de Tunis',43,'40,41,10,12,44,13,45,14,47'),(44,26,'2025-07-02','20:30:00','Cité de la Culture - Tunis',48,'10,30,8,40,13'),(45,26,'2025-08-07','21:30:00','Théâtre de Carthage',48,'10,11,18,22,13'),(46,27,'2025-05-18','19:00:00','Théâtre El Menzah',45,'10,26,12,44,13,45,14'),(47,27,'2025-07-03','21:00:00','Théâtre Municipal de Tunis',47,'20,8,40,10,13,45'),(48,27,'2025-08-08','20:00:00','Théâtre de Carthage',42,'0,40,10,26,12,28,13,14,46,47'),(49,28,'2025-05-19','19:30:00','Théâtre El Menzah',47,'18,36,22,10,11,13'),(50,28,'2025-07-04','20:30:00','Maison de la Culture Ibn Rachiq',48,'10,20,8,40,13'),(51,28,'2025-08-09','20:00:00','Théâtre Municipal de Tunis',46,'36,24,10,12,13,14'),(52,29,'2025-05-20','18:00:00','Théâtre de Carthage',48,'10,16,18,22,13'),(53,29,'2025-07-05','21:30:00','Cité de la Culture - Tunis',45,'10,43,27,12,44,13,14'),(54,29,'2025-08-10','21:00:00','Théâtre El Menzah',45,'35,36,40,10,12,13,14'),(55,30,'2025-05-21','15:00:00','Théâtre Municipal de Tunis',45,'2,20,37,38,8,40,10,13'),(56,30,'2025-07-06','20:00:00','Théâtre de Carthage',41,'0,1,24,10,43,12,44,13,29,14,47'),(57,30,'2025-08-11','20:30:00','Maison de la Culture Ibn Rachiq',48,'10,16,18,22,13'),(58,31,'2025-05-22','21:30:00','Cité de la Culture - Tunis',46,'20,8,40,10,13,45,47'),(59,31,'2025-07-07','21:00:00','Théâtre Municipal de Tunis',46,'10,12,28,13,45,14'),(60,31,'2025-08-12','18:00:00','Théâtre de Carthage',45,'16,0,18,22,40,10,13,47'),(61,32,'2025-05-23','20:30:00','Théâtre Municipal de Tunis',44,'41,10,12,28,13,14,46,47'),(62,32,'2025-07-08','10:00:00','Théâtre El Menzah',48,'10,14,12,13'),(63,32,'2025-08-13','20:30:00','Cité de la Culture - Tunis',46,'16,18,22,10,27,13,47'),(64,33,'2025-05-24','21:00:00','Théâtre El Menzah',46,'20,8,40,10,43,13,47'),(65,33,'2025-07-09','21:30:00','Théâtre de Carthage',43,'41,10,42,12,28,13,14,46,47'),(66,33,'2025-08-14','21:00:00','Théâtre Municipal de Tunis',44,'41,10,42,12,13,14,46,47'),(67,34,'2025-05-25','20:30:00','Maison de la Culture Ibn Rachiq',45,'34,35,20,8,40,10,13,47'),(68,34,'2025-07-10','20:00:00','Théâtre El Menzah',43,'0,25,10,12,13,45,14,46,47'),(69,34,'2025-08-15','19:30:00','Théâtre de Carthage',44,'20,8,40,24,10,13,45,30,31'),(70,35,'2025-05-26','20:00:00','Cité de la Culture - Tunis',45,'16,18,35,36,22,10,13,47'),(71,35,'2025-07-11','18:00:00','Théâtre Municipal de Tunis',45,'10,27,12,13,14,46,47'),(72,35,'2025-08-16','21:00:00','Théâtre El Menzah',48,'10,14,12,13'),(73,36,'2025-05-27','20:30:00','Théâtre de Carthage',46,'16,18,22,10,13,45,46'),(74,36,'2025-07-12','21:30:00','Cité de la Culture - Tunis',45,'24,10,43,12,44,13,14'),(75,36,'2025-08-17','21:00:00','Théâtre Municipal de Tunis',46,'16,18,22,10,43,44,13'),(76,37,'2025-05-28','21:00:00','Théâtre Municipal de Tunis',48,'10,14,12,13'),(77,37,'2025-07-13','20:00:00','Théâtre El Menzah',47,'20,8,40,10,13,45'),(78,37,'2025-08-18','21:00:00','Théâtre de Carthage',45,'10,43,12,44,13,14,30'),(79,38,'2025-05-29','20:30:00','Maison de la Culture Ibn Rachiq',47,'16,18,22,10,13,47'),(80,38,'2025-07-14','20:30:00','Théâtre Municipal de Tunis',47,'20,38,8,40,10,13'),(81,38,'2025-08-19','21:00:00','Cité de la Culture - Tunis',46,'38,10,12,13,45,14');
/*!40000 ALTER TABLE `rubrique` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-24 21:06:11
