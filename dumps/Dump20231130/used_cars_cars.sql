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
-- Table structure for table `cars`
--

DROP TABLE IF EXISTS `cars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cars` (
  `car_ID` int NOT NULL AUTO_INCREMENT,
  `vin` varchar(45) NOT NULL,
  `make` varchar(45) DEFAULT NULL,
  `model` varchar(45) DEFAULT NULL,
  `year` int DEFAULT NULL,
  `external_color` varchar(45) DEFAULT NULL,
  `internal_color` varchar(45) DEFAULT NULL,
  `mileage` int DEFAULT NULL,
  `asking_price` decimal(10,2) DEFAULT NULL,
  `trim` varchar(45) DEFAULT NULL,
  `transmission` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`car_ID`),
  UNIQUE KEY `vin` (`vin`),
  KEY `price` (`asking_price` DESC)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cars`
--

LOCK TABLES `cars` WRITE;
/*!40000 ALTER TABLE `cars` DISABLE KEYS */;
INSERT INTO `cars` VALUES (1,'1B3EL46J25N513802','Dodge','Stratus',2007,'Blue','Gray',41941,96500.00,'SXT','4-Speed'),(2,'1FAHP36N09W191342','Ford','Focus',2009,'red','Gray',47000,9670.00,'SES','Automatic'),(3,'1G1JH12FX57138124','Chevrolet','Cavalier',2005,'Yellow','Gray',15828,9995.00,'LS Sport','5-Speed Manual'),(4,'1G1ZU54814F248763','Chevrolet','Malibu',2004,'Black','Gray',41135,8995.00,'LT','4-Speed Automatic'),(5,'1G6EL5780FE603440','Cadillac','Eldorado',1985,'Pewter','Tan',32880,7995.00,'Base','UNSPECIFIED'),(6,'1G8JD54R05Y503397','Saturn','L300',2005,'Silver','Grey',35751,8888.00,'Base','4-Speed Automatic'),(7,'2G1WD58C47917903','Chevrolet','Impala',2007,'Gray','Gray',129108,9995.00,'SS','4-Speed Automatic'),(8,'3A4FY48B27T554499','Chrysler','PT Cruiser',2007,'Purple','Gray',41981,7995.00,'Base','Manual'),(9,'3FAHP01159R137925','Ford','Fusion',2009,'Vapor Silver','Camel',107532,9495.00,'SE','6-Speed Automatic'),(10,'3GNFK16T71G208523','Chevrolet','Suburban',2001,'Black Onyx','Tan Neutral',116305,7995.00,'LT','4-Speed Automatic'),(11,'5FNRL38477B091190','Honda','Oddyssey',2007,'Slate Green Metallic','Gray',99555,10000.00,'EX','5-Speed Automatic'),(12,'5FNYF4H91CB054036','Honda','Pilot',2012,'White','Leather',7076,37807.00,'Touring','Automatic'),(13,'5J6YH28307L014151','Honda','Element',2007,'Silver','Gray',111000,8995.00,'LX','Automatic'),(14,'JHLRD77802C069548','Honda','CR-V',2002,'Blue','Black',105139,6995.00,'EX','5-Speed Manual'),(15,'JTLKE50E481060621','Scion','xB',2008,'Black Sand Pearl','Dark Gray',65146,9999.00,'Base','Automatic'),(16,'KMHDU46DX7U184501','Hyundai','Elantra',2007,'Seattle Blue','Gray',41560,999.00,'SE','5-Speed Manual'),(17,'KNAGE228795310609','Kia','Optima',2009,'Ruby','Beige',56749,15000.00,'Base','5-Speed'),(18,'LAKSDFJ234LASKRF2','Dodge','Durango',2009,'Silver','Black',144000,2700.00,'SLT','4WD Automatic'),(19,'WBAEU33434PR12965','BMW','325',2004,'Silver','Black',98208,9650.00,'xi','Automatic'),(20,'WDBJF65J71B215984','Mercedes-Benz','E320',2001,'Silver','Gray',40902,9900.00,'Base','5-Speed Automatic'),(21,'WDBRF87HX6F757914','Mercedes-Benz','C350 4Matic',2006,'Black','Black',82000,14450.00,'Luxury','5-Speed Automatic'),(22,'WMEEK31X79K226939','Smart','ForTwo',2009,'Silver','Design Black',23272,8988.00,'Passion','5-Speed Automatic with Auto-Shift'),(23,'WMWRC334X4TJ61214','MINI','Cooper',2004,'Jet Black','Black',59160,9499.00,'Base','Automatic'),(24,'YV1MJ682152063198','Volvo','V50',2005,'Blue','Black',110354,8995.00,'T5','Automatic'),(25,'YV4SZ592561219696','Volvo','XC70',2006,'Willow Green Metallic','Taupe Leather',83664,14996.00,'AWD','5-Speed Automatic w/ Geartronic'),(28,'S1A2N3T4A5F6E7H','hunda','santafeh',2015,'black','red',23456,12500.00,'lizard ','automatic 5'),(30,'K1I2A3R4E5O6','kia','rio',2005,'gray','white',123456,5500.00,'nothing ','5 gears ');
/*!40000 ALTER TABLE `cars` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-30 20:54:20
