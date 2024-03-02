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
-- Table structure for table `inspection`
--

DROP TABLE IF EXISTS `inspection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inspection` (
  `inspection_ID` int NOT NULL AUTO_INCREMENT,
  `inspection_date` date DEFAULT NULL,
  `result` tinyint NOT NULL,
  `car_ID` int NOT NULL,
  `employee_ID` varchar(45) NOT NULL,
  PRIMARY KEY (`inspection_ID`,`car_ID`,`employee_ID`),
  KEY `fk_INSPECTION_CARS1_idx` (`car_ID`),
  KEY `fk_INSPECTION_EMPLOYEES1_idx` (`employee_ID`),
  CONSTRAINT `icar` FOREIGN KEY (`car_ID`) REFERENCES `cars` (`car_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `iemployee` FOREIGN KEY (`employee_ID`) REFERENCES `employees` (`employee_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inspection`
--

LOCK TABLES `inspection` WRITE;
/*!40000 ALTER TABLE `inspection` DISABLE KEYS */;
INSERT INTO `inspection` VALUES (1,'2023-10-24',0,1,'hadi1'),(2,'2023-10-19',1,1,'moh1'),(3,'2023-10-25',1,1,'hadi1'),(4,'2023-10-20',1,4,'hadi1'),(5,'2023-10-26',0,5,'ali2'),(6,'2023-10-21',1,6,'moh1'),(7,'2023-10-26',1,7,'ali2'),(8,'2023-10-22',0,8,'ali2'),(9,'2023-10-27',1,9,'moh1'),(10,'2023-10-23',1,10,'hasan1'),(11,'2023-10-29',1,11,'hasan1'),(12,'2023-08-14',1,12,'ali1'),(13,'2023-10-30',0,13,'hasan1'),(14,'2023-10-25',1,14,'ali1'),(15,'2023-10-31',1,15,'hasan1'),(16,'2023-10-27',1,16,'ali1'),(17,'2023-11-02',1,17,'hasan1'),(18,'2023-09-29',0,18,'hasan1'),(19,'2023-11-04',1,19,'hadi1'),(20,'2023-11-01',0,20,'hadi1'),(21,'2023-11-07',1,21,'hadi1'),(22,'2023-11-04',1,22,'sam1'),(23,'2023-11-13',1,23,'sam1'),(24,'2023-11-08',1,24,'hadi1'),(25,'2023-11-13',0,25,'hadi1'),(26,'2023-11-26',1,28,'ali1');
/*!40000 ALTER TABLE `inspection` ENABLE KEYS */;
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
