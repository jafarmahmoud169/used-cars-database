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
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales` (
  `sale_ID` int NOT NULL AUTO_INCREMENT COMMENT '302436',
  `sale_date` date DEFAULT NULL,
  `sale_price` decimal(10,2) DEFAULT NULL,
  `customer_ID` int NOT NULL,
  `employee_ID` varchar(45) NOT NULL,
  `car_vin` varchar(45) NOT NULL,
  PRIMARY KEY (`sale_ID`,`employee_ID`,`customer_ID`,`car_vin`),
  UNIQUE KEY `sale_ID_UNIQUE` (`sale_ID`),
  KEY `fk_SALES_CUSTOMERS1_idx` (`customer_ID`),
  KEY `fk_SALES_CARS1_idx` (`car_vin`),
  KEY `fk_SALES_EMPLOYEES1_idx` (`employee_ID`),
  CONSTRAINT `customer` FOREIGN KEY (`customer_ID`) REFERENCES `customers` (`customer_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `scar` FOREIGN KEY (`car_vin`) REFERENCES `cars` (`vin`),
  CONSTRAINT `semployee` FOREIGN KEY (`employee_ID`) REFERENCES `employees` (`employee_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` VALUES (2,'2023-10-19',9252.00,5,'moh1','1FAHP36N09W191342'),(3,'2023-10-25',10596.00,4,'hadi1','1G1JH12FX57138124'),(4,'2023-10-20',8746.00,3,'hadi1','1G1ZU54814F248763'),(5,'2023-10-26',8996.00,2,'ali2','1G6EL5780FE603440'),(6,'2023-10-21',8666.00,1,'moh1','1G8JD54R05Y503397'),(7,'2023-10-26',10496.00,6,'ali2','2G1WD58C47917903'),(8,'2023-10-22',7996.00,5,'ali2','3A4FY48B27T554499'),(9,'2023-10-27',10124.00,4,'moh1','3FAHP01159R137925'),(10,'2023-10-23',7996.25,3,'hasan1','3GNFK16T71G208523'),(11,'2023-10-29',10500.00,2,'hasan1','5FNRL38477B091190'),(12,'2023-08-14',36250.00,1,'ali1','5FNYF4H91CB054036'),(13,'2023-10-30',9746.00,6,'hasan1','5J6YH28307L014151'),(14,'2023-10-25',7246.00,5,'ali1','JHLRD77802C069548'),(15,'2023-10-31',10499.00,4,'hasan1','JTLKE50E481060621'),(16,'2023-10-27',9497.00,3,'ali1','KMHDU46DX7U184501'),(17,'2023-11-02',10500.00,2,'hasan1','KNAGE228795310609'),(18,'2023-09-29',4000.00,1,'hasan1','LAKSDFJ234LASKRF2'),(19,'2023-11-04',10237.50,6,'hadi1','WBAEU33434PR12965'),(20,'2023-11-01',9425.00,5,'hadi1','WDBJF65J71B215984'),(21,'2023-11-07',13837.50,4,'hadi1','WDBRF87HX6F757914'),(22,'2023-11-04',8741.00,3,'sam1','WMEEK31X79K226939'),(23,'2023-11-13',10124.25,2,'sam1','WMWRC334X4TJ61214'),(24,'2023-11-08',8746.00,1,'hadi1','YV1MJ682152063198'),(25,'2023-11-13',14247.00,6,'hadi1','YV4SZ592561219696'),(28,'2023-11-28',12550.00,7,'hadi1','S1A2N3T4A5F6E7H'),(30,'2023-12-28',10000.00,7,'ali1','1B3EL46J25N513802');
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `SALE_helper` BEFORE INSERT ON `sales` FOR EACH ROW BEGIN
if new.sale_date is null then 
set new.sale_date =curdate();end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-30 20:54:20
