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
-- Table structure for table `billet`
--

DROP TABLE IF EXISTS `billet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `billet` (
  `idBillet` int NOT NULL AUTO_INCREMENT,
  `categorie` varchar(10) DEFAULT NULL,
  `prix` decimal(5,2) NOT NULL,
  `idSpec` int NOT NULL,
  `Vendu` tinyint(1) NOT NULL,
  `idPersonne` int DEFAULT NULL,
  PRIMARY KEY (`idBillet`),
  KEY `fk_billet_spec` (`idSpec`),
  KEY `fk_personne` (`idPersonne`),
  CONSTRAINT `fk_billet_spec` FOREIGN KEY (`idSpec`) REFERENCES `spectacle` (`idSpec`),
  CONSTRAINT `fk_personne` FOREIGN KEY (`idPersonne`) REFERENCES `personne` (`id`),
  CONSTRAINT `chk_billet_PRIX` CHECK ((`prix` between 10 and 300))
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billet`
--

LOCK TABLES `billet` WRITE;
/*!40000 ALTER TABLE `billet` DISABLE KEYS */;
INSERT INTO `billet` VALUES (1,'Spectacle',30.00,21,1,NULL),(2,'Spectacle',20.00,14,1,55),(3,'Spectacle',30.00,21,1,56),(4,'Spectacle',30.00,23,1,58),(5,'Spectacle',40.00,33,1,60),(6,'Spectacle',25.00,35,1,61),(7,'Spectacle',30.00,34,1,62),(8,'Spectacle',30.00,34,1,63),(9,'Spectacle',50.00,36,1,64),(10,'Spectacle',60.00,22,1,65),(11,'Spectacle',50.00,17,1,66),(12,'Spectacle',60.00,38,1,67),(13,'Spectacle',30.00,23,1,68),(14,'Spectacle',25.00,15,1,69),(15,'Spectacle',25.00,27,1,70),(16,'Spectacle',25.00,35,1,71),(17,'Spectacle',25.00,17,1,72),(18,'Spectacle',20.00,32,1,73),(19,'Spectacle',30.00,38,1,74),(20,'Spectacle',30.00,37,1,75),(21,'Spectacle',25.00,27,1,76),(22,'Spectacle',25.00,27,1,77),(23,'Spectacle',50.00,30,1,78),(24,'Spectacle',25.00,27,1,79),(25,'Spectacle',40.00,33,1,80),(26,'Spectacle',50.00,30,1,82),(27,'Spectacle',50.00,29,1,83),(28,'Spectacle',25.00,29,1,84),(29,'Spectacle',50.00,29,1,85),(30,'Spectacle',25.00,15,1,87),(31,'Spectacle',60.00,34,1,89),(32,'Spectacle',60.00,23,1,90),(33,'Spectacle',25.00,29,1,91),(34,'Spectacle',20.00,14,1,94),(35,'Spectacle',20.00,18,1,95),(36,'Spectacle',25.00,17,1,96),(37,'Spectacle',90.00,21,1,97),(38,'Spectacle',20.00,20,1,98),(39,'Spectacle',50.00,28,1,99),(40,'Spectacle',25.00,28,1,100),(41,'Spectacle',30.00,25,1,101),(42,'Spectacle',25.00,27,1,102),(43,'Spectacle',25.00,30,1,103),(44,'Spectacle',20.00,33,1,104),(45,'Spectacle',25.00,36,1,105),(46,'Spectacle',25.00,15,1,106),(47,'Spectacle',30.00,34,1,107),(48,'Spectacle',50.00,31,1,108),(49,'Spectacle',25.00,17,1,109),(50,'Spectacle',40.00,12,1,110),(51,'Spectacle',30.00,23,1,111),(52,'Spectacle',30.00,23,1,112),(53,'Spectacle',25.00,24,1,113),(54,'Spectacle',30.00,25,1,114),(55,'Spectacle',20.00,16,1,115),(56,'Spectacle',30.00,21,1,116),(57,'Spectacle',50.00,30,1,117),(58,'Spectacle',25.00,30,1,118),(59,'Spectacle',25.00,15,1,119),(60,'Spectacle',25.00,13,1,120),(61,'Spectacle',30.00,23,1,121),(62,'Spectacle',20.00,14,1,122),(63,'Spectacle',20.00,19,1,123);
/*!40000 ALTER TABLE `billet` ENABLE KEYS */;
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
