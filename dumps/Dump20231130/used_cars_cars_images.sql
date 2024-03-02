CREATE DATABASE  IF NOT EXISTS `used_cars` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `used_cars`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: used_cars
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `cars_images`
--

DROP TABLE IF EXISTS `cars_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cars_images` (
  `image_ID` int NOT NULL AUTO_INCREMENT,
  `image_URL` varchar(70) NOT NULL,
  `car_ID` int NOT NULL,
  PRIMARY KEY (`image_ID`,`car_ID`),
  UNIQUE KEY `image_ID_UNIQUE` (`image_ID`),
  KEY `fk_CARS_IMAGES_CARS1_idx` (`car_ID`),
  CONSTRAINT `imgcar` FOREIGN KEY (`car_ID`) REFERENCES `cars` (`car_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cars_images`
--

LOCK TABLES `cars_images` WRITE;
/*!40000 ALTER TABLE `cars_images` DISABLE KEYS */;
INSERT INTO `cars_images` VALUES (1,'../puplic/images/DodgeStratus2007.img',1),(2,'../puplic/images/FordFocus2009.img',2),(3,'../puplic/images/ChevroletCavalier2005.img',3),(4,'../puplic/images/ChevroletMalibu2004.img',4),(5,'../puplic/images/CadillacEldorado1985.img',5),(6,'../puplic/images/SaturnL3002005.img',6),(7,'../puplic/images/ChevroletImpala2007.img',7),(8,'../puplic/images/ChryslerPT Cruiser2007.img',8),(9,'../puplic/images/FordFusion2009.img',9),(10,'../puplic/images/ChevroletSuburban2001.img',10),(11,'../puplic/images/HondaOddyssey2007.img',11),(12,'../puplic/images/HondaPilot2012.img',12),(13,'../puplic/images/HondaElement2007.img',13),(14,'../puplic/images/HondaCR-V2002.img',14),(15,'../puplic/images/ScionxB2008.img',15),(16,'../puplic/images/HyundaiElantra2007.img',16),(17,'../puplic/images/KiaOptima2009.img',17),(18,'../puplic/images/DodgeDurango2009.img',18),(19,'../puplic/images/BMW3252004.img',19),(20,'../puplic/images/Mercedes-BenzE3202001.img',20),(21,'../puplic/images/Mercedes-BenzC350 4Matic2006.img',21),(22,'../puplic/images/SmartForTwo2009.img',22),(23,'../puplic/images/MINICooper2004.img',23),(24,'../puplic/images/VolvoV502005.img',24),(25,'../puplic/images/VolvoXC702006.img',25),(26,'../puplic/images/DodgeStratus20071.img',1),(27,'../puplic/images/FordFocus20091.img',2),(28,'../puplic/images/ChevroletCavalier20051.img',3),(29,'../puplic/images/ChevroletMalibu20041.img',4),(30,'../puplic/images/CadillacEldorado19851.img',5),(31,'../puplic/images/SaturnL30020051.img',6),(32,'../puplic/images/ChevroletImpala20071.img',7),(33,'../puplic/images/ChryslerPT Cruiser20071.img',8),(34,'../puplic/images/FordFusion20091.img',9),(35,'../puplic/images/ChevroletSuburban20011.img',10),(36,'../puplic/images/HondaOddyssey20071.img',11),(37,'../puplic/images/HondaPilot20121.img',12),(38,'../puplic/images/HondaElement20071.img',13),(39,'../puplic/images/HondaCR-V20021.img',14),(40,'../puplic/images/ScionxB20081.img',15),(41,'../puplic/images/HyundaiElantra20071.img',16),(42,'../puplic/images/KiaOptima20091.img',17),(43,'../puplic/images/DodgeDurango20091.img',18),(44,'../puplic/images/BMW32520041.img',19),(45,'../puplic/images/Mercedes-BenzE32020011.img',20),(46,'../puplic/images/Mercedes-BenzC350 4Matic20061.img',21),(47,'../puplic/images/SmartForTwo20091.img',22),(48,'../puplic/images/MINICooper20041.img',23),(49,'../puplic/images/VolvoV5020051.img',24),(50,'../puplic/images/VolvoXC7020061.img',25);
/*!40000 ALTER TABLE `cars_images` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-30 20:54:21
