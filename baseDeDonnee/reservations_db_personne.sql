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
-- Table structure for table `personne`
--

DROP TABLE IF EXISTS `personne`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personne` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `nombreDePlace` int DEFAULT NULL,
  `idRubrique` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_personne_spec` (`idRubrique`),
  CONSTRAINT `fk_personne_spec` FOREIGN KEY (`idRubrique`) REFERENCES `spectacle` (`idSpec`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personne`
--

LOCK TABLES `personne` WRITE;
/*!40000 ALTER TABLE `personne` DISABLE KEYS */;
INSERT INTO `personne` VALUES (12,'ziri','eya','eyaziri2@gmail.com',17,18),(13,'zakraoui','ameni','ameni@gmail.com',18,21),(26,'aa','aa','a@gmail.com',1,12),(35,'messaadi','ouday','ouday@test.com',2,20),(36,'ziri','ezer','ezer@test.com',2,33),(37,'goutali','rim','rim@test.com',2,26),(38,'goutali','imed','imed@test.com',1,32),(39,'ziri','dhia','dh@test.com',2,34),(42,'a','aaaa','aaa@gmail.com',1,16),(43,'bb','bb','b@test.com',2,35),(44,'mm','m','m@test.com',1,34),(45,'zz','zz','z@gmail.ocm',1,31),(46,'hh','hh','h@gmail.com',1,17),(47,'yy','yy','y@test.com',1,19),(48,'tey','pizza','pizza@gmail.com',2,30),(50,'messaadi','ouday','oudou@gmail.com',1,14),(51,'mm','mm','oo@mail.com',1,22),(52,'ll','ll','ll@tedt.com',1,21),(53,'ziri','wiem','wa@test.com',2,23),(55,'zo','zo','zo@mail.com',1,14),(56,'mariem','mariem','m@g.com',1,21),(57,'rim','goutali','gout@mail.com',1,34),(58,'ziri','dhia','dhia@test.com',1,23),(60,'ezer','ezer','ezer@test.c',2,33),(61,'ouday','messaadi','mes@test.co',1,35),(62,'h','h','h@t.com',1,34),(63,'l','l','l@t.com',1,34),(64,'sami','sami','sam@mail.com',2,36),(65,'rim','rim','eim@test.c',2,22),(66,'ll','ll','l@c.t',2,17),(67,'messaadi','lin','lin@test.com',2,38),(68,'k','k','k@k.com',1,23),(69,'a','a','e@e.e',1,15),(70,'mm','mm','mm@y.com',1,27),(71,'ziri','ziri','ziri@ziri.com',1,35),(72,'ey','ey','ey@ey.com',1,17),(73,'n','n','n@n.n',1,32),(74,'j','j','j@j.com',1,38),(75,'hh','hh','hh@h.com',1,37),(76,'y','y','y@y.c',1,27),(77,'aa','aa','a@a.com',1,27),(78,'uu','uu','eya.ziri@enicar.ucar.tn',2,30),(79,'y','y','eyaziri@ieee.org',1,27),(80,'ll','ll','ouday.messaadi@etudiant-enit.utm.tn',2,33),(82,'aa','aa','aa@eya.com',2,30),(83,'eya','wiem','wi@g.com',2,29),(84,'ziri','eya','e@y.co',1,29),(85,'rim','gou','g@m.b',2,29),(86,'hh','kk','ll@l.com',1,15),(87,'hh','kk','eya@gmail.com',1,15),(89,'ziri','eya','eyya@gmail.com',2,34),(90,'ziri','eya','eyaziri2@gmail.com',2,23),(91,'ziri','eya','eyaziri2@gmail.com',1,29),(92,'ziri','eya','eyaziri2@gmail.com',3,27),(93,'ziri','eya','eyaziri2@gmail.com',3,27),(94,'ziri','eya','eyaziri2@gmail.com',1,14),(95,'goutali','rim','eyaziri2@gmail.com',1,18),(96,'ziri','eya','eyaziri2@gmail.com',1,17),(97,'ziri','ezer','eyaziri2@gmail.com',3,21),(98,'ziri','eya','eyaziri2@gmail.com',1,20),(99,'messaadi','lin','eyaziri2@gmail.com',2,28),(100,'ziti','wuw','eyaziri2@gmail.com',1,28),(101,'aa','aa','eyaziri2@gmail.com',1,25),(102,'aa','aa','eyaziri2@gmail.com',1,27),(103,'hh','hh','eyaziri2@gmail.com',1,30),(104,'aa','aa','eyaziri2@gmail.com',1,33),(105,'ziri','eya','eyaziri2@gmail.com',1,36),(106,'ziri','rim','eyaziri2@gmail.com',1,15),(107,'hh','hh','eyaziri2@gmail.com',1,34),(108,'imed','imed','eyaziri2@gmail.com',2,31),(109,'wya','jj','eyaziri2@gmail.com',1,17),(110,'ouday','messaadi','eya.ziri@enicar.ucar.tn',2,12),(111,'ziri','wiem','eyaziri2@gmail.com',1,23),(112,'rim','rim','eya.ziri@enicar.ucar.tn',1,23),(113,'hh','hh','ouday908070@gmail.com',1,24),(114,'hh','hh','ouday908070@gmail.com',1,25),(115,'hh','jj','ouday908070@gmail.com',1,16),(116,'hh','uuu','ouday908070@gmail.com',1,21),(117,'zakraoui','ameni','amenizakraoui@gmail.com',2,30),(118,'zak','amm','amenizakraoui@gmail.com',1,30),(119,'ziri','eya','eyaziri2@gmail.com',1,15),(120,'rim','goutali','amenizakraoui@gmail.com',1,13),(121,'ziri','eya','ouday.messaadi@etudiant-enit.utm.tn',1,23),(122,'rim','rim','eyaziri2@gmail.com',1,14),(123,'aa','aa','ouday908070@gmail.com',1,19);
/*!40000 ALTER TABLE `personne` ENABLE KEYS */;
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
