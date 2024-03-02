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
-- Table structure for table `purchases`
--

DROP TABLE IF EXISTS `purchases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchases` (
  `purchase_ID` int NOT NULL AUTO_INCREMENT,
  `purchase_date` date DEFAULT NULL,
  `purchase_price` decimal(10,2) DEFAULT NULL,
  `vendor_ID` int NOT NULL,
  `employee_ID` varchar(45) NOT NULL,
  `car_vin` varchar(45) NOT NULL,
  PRIMARY KEY (`purchase_ID`,`employee_ID`,`vendor_ID`,`car_vin`),
  UNIQUE KEY `purchase_ID_UNIQUE` (`purchase_ID`) /*!80000 INVISIBLE */,
  KEY `fk_PURCHASES_VENDORS_idx` (`vendor_ID`),
  KEY `fk_PURCHASES_CARS1_idx` (`car_vin`),
  KEY `fk_PURCHASES_EMPLOYEES1_idx` (`employee_ID`),
  CONSTRAINT `vcar` FOREIGN KEY (`car_vin`) REFERENCES `cars` (`vin`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `vemployee` FOREIGN KEY (`employee_ID`) REFERENCES `employees` (`employee_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `vendor` FOREIGN KEY (`vendor_ID`) REFERENCES `vendors` (`vendor_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchases`
--

LOCK TABLES `purchases` WRITE;
/*!40000 ALTER TABLE `purchases` DISABLE KEYS */;
INSERT INTO `purchases` VALUES (1,'2023-10-14',5996.00,1,'hadi1','1B3EL46J25N513802'),(2,'2023-10-14',7252.00,2,'moh1','1FAHP36N09W191342'),(3,'2023-10-15',7596.00,3,'hadi1','1G1JH12FX57138124'),(4,'2023-10-15',6746.00,4,'hadi1','1G1ZU54814F248763'),(5,'2023-10-16',5996.00,5,'ali2','1G6EL5780FE603440'),(6,'2023-10-16',6666.00,6,'moh1','1G8JD54R05Y503397'),(7,'2023-10-16',7496.00,1,'ali2','2G1WD58C47917903'),(8,'2023-10-17',5996.00,2,'ali2','3A4FY48B27T554499'),(9,'2023-10-17',7124.00,3,'moh1','3FAHP01159R137925'),(10,'2023-10-18',5996.25,4,'hasan1','3GNFK16T71G208523'),(11,'2023-10-19',7500.00,5,'hasan1','5FNRL38477B091190'),(12,'2023-08-09',34250.00,6,'ali1','5FNYF4H91CB054036'),(13,'2023-10-20',6746.00,1,'hasan1','5J6YH28307L014151'),(14,'2023-10-20',5246.00,2,'ali1','JHLRD77802C069548'),(15,'2023-10-21',7499.00,3,'hasan1','JTLKE50E481060621'),(16,'2023-10-22',7497.00,4,'ali1','KMHDU46DX7U184501'),(17,'2023-10-23',7500.00,5,'hasan1','KNAGE228795310609'),(18,'2023-09-24',2000.00,6,'hasan1','LAKSDFJ234LASKRF2'),(19,'2023-10-25',7237.50,1,'hadi1','WBAEU33434PR12965'),(20,'2023-10-27',7425.00,2,'hadi1','WDBJF65J71B215984'),(21,'2023-10-28',10837.50,3,'hadi1','WDBRF87HX6F757914'),(22,'2023-10-30',6741.00,4,'sam1','WMEEK31X79K226939'),(23,'2023-11-03',7124.25,5,'sam1','WMWRC334X4TJ61214'),(24,'2023-11-03',6746.00,6,'hadi1','YV1MJ682152063198'),(25,'2023-11-03',11247.00,1,'hadi1','YV4SZ592561219696'),(28,'2023-11-26',10000.00,8,'moh1','S1A2N3T4A5F6E7H'),(30,'2023-12-01',5000.00,10,'moh1','K1I2A3R4E5O6');
/*!40000 ALTER TABLE `purchases` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `purchase_helper` BEFORE INSERT ON `purchases` FOR EACH ROW BEGIN
if new.purchase_date is null then 
set new.purchase_date =curdate();end if;
insert into `used_cars`.`cars` (vin)value(upper(new.car_vin));

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
