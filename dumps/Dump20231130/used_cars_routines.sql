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
-- Temporary view structure for view `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!50001 DROP VIEW IF EXISTS `inventory`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `inventory` AS SELECT 
 1 AS `Car`,
 1 AS `Sale Date`,
 1 AS `Sale Price`,
 1 AS `Purchase Date`,
 1 AS `Purchase Price`,
 1 AS `Grossing`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `inventory`
--

/*!50001 DROP VIEW IF EXISTS `inventory`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `inventory` AS select concat(`c`.`make`,' ',`c`.`model`,' ',`c`.`year`,':') AS `Car`,`s`.`sale_date` AS `Sale Date`,`s`.`sale_price` AS `Sale Price`,`p`.`purchase_date` AS `Purchase Date`,`p`.`purchase_price` AS `Purchase Price`,`CAR_GROSSING`(`c`.`vin`) AS `Grossing` from ((`purchases` `p` left join `cars` `c` on((`c`.`vin` = `p`.`car_vin`))) left join `sales` `s` on((`c`.`vin` = `s`.`car_vin`))) order by `s`.`sale_date` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Dumping events for database 'used_cars'
--

--
-- Dumping routines for database 'used_cars'
--
/*!50003 DROP FUNCTION IF EXISTS `car_grossing` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `car_grossing`(vin varchar(45)) RETURNS decimal(10,2)
    DETERMINISTIC
BEGIN
set @saleprice= (select sale_price from sales where car_vin=upper(vin));
set @purchaseprice= (select purchase_price from purchases where car_vin=upper(vin));
RETURN @saleprice - @purchaseprice;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `inspection_passed` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `inspection_passed`(carid int) RETURNS varchar(50) CHARSET utf8mb3
    DETERMINISTIC
BEGIN 
DECLARE r boolean;
    SELECT result INTO r FROM INSPECTION 
	     WHERE upper(car_ID)= upper(carid) AND inspection_date =
		(SELECT MAX(inspection_date) FROM INSPECTION WHERE upper(car_ID)= upper(carid));
	IF r THEN RETURN "the car passed the latest inspection";
    ELSE RETURN "the car did not pass the latest inspection" ;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `inspection_result` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `inspection_result`(carid int) RETURNS varchar(50) CHARSET utf8mb3
    DETERMINISTIC
BEGIN 
DECLARE r boolean;
    SELECT result INTO r FROM INSPECTION 
	     WHERE upper(car_ID)= upper(carid) AND inspection_date =
		(SELECT MAX(inspection_date) FROM INSPECTION WHERE upper(car_ID)= upper(carid));
	IF r THEN RETURN "the car passed the latest inspection";
    ELSE RETURN "the car did not pass the latest inspection" ;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `monthly_grossing` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `monthly_grossing`( month int) RETURNS decimal(10,2)
    DETERMINISTIC
BEGIN
declare flag int default 0;  declare mon date;
declare PPrice ,SPrice ,grossing  decimal(10,2) default 0;
DECLARE NOT_FOUND condition for sqlstate value'02000';
DECLARE GET_PRICES CURSOR FOR SELECT purchase_price, sale_price, sale_date
   FROM purchases INNER JOIN sales ON purchases.car_vin = sales.car_vin;
DECLARE continue HANDLER FOR NOT_FOUND SET flag = 1;

open GET_PRICES;
while(flag=0)do

fetch GET_PRICES INTO PPrice,SPrice,mon;
if flag=0 and MONTH(D) = month then
set grossing = grossing+ (SPrice-PPrice);
end if;
end while;
close GET_PRICES;
return grossing;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `existing_cars` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `existing_cars`()
BEGIN
select concat(make,' ',model,' ',year) as car from cars 
where upper(vin) not in(select car_vin from sales);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `new_car` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `new_car`(nVIN varchar(45),make varchar(45),
	model varchar(45),year int,
	external_color varchar(45),internal_color varchar(45),
	mileage int,asking_price decimal(10,2),
	trim varchar(45),transmission varchar(45))
BEGIN
declare newvin varchar(45) default null;
START TRANSACTION;
set newvin=upper(nVIN);
if upper(nVIN)  in (select vin from cars where make is null) then commit ;
else
rollback;
select concat("no such a vin",nvin,"you have to enter the purchase first");
end if;
START TRANSACTION;
if newvin is not null then
update  cars set make=lower(make),model=lower(model),year=year,external_color=lower(external_color),internal_color=lower(internal_color),mileage=mileage,asking_price=asking_price,trim=lower(trim),transmission=lower(transmission)
where vin=newvin;
select concat(make," ",model," inserted") as result;commit;
else rollback;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `new_customer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `new_customer`(
								firstname varchar(45),
                                lastname varchar(45),
								contact_number varchar(45),
								email varchar(45))
BEGIN
insert into customers (first_name,last_name,contact_number,email)
value(lower(firstname),lower(lastname),lower(contact_number),lower(email));
select concat(firstname,' ',lastname,' inserted')as result;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `new_purchase` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `new_purchase`(purchase_date date,
								purchase_price decimal(10,2),
								vendorID int,
								car_vin varchar(45),
								employeeID varchar(45))
BEGIN
DECLARE exit HANDLER FOR 1452 begin
if employeeID not in(select employee_ID from employees) then
select concat("no such an employee ",employeeID)as result;
elseif vendorID not in (select vendor_ID from vendors)then
select concat("no such a vendor ",vendorID," you have to enter the vindor first")as result;
end if;
end;
insert into purchases(purchase_date,purchase_price,vendor_ID,car_vin,employee_ID)
value(purchase_date,purchase_price,vendorID,upper(car_vin),lower(employeeID));
select concat(car_vin," purchase inserted") as result;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `new_sale` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `new_sale`(saledate date,
								sale_price decimal(10,2),
								customerID int,
								carvin varchar(45),
								employeeID varchar(45))
BEGIN
DECLARE exit HANDLER FOR 1452 begin
if employeeID not in(select employee_ID from employees) then
select concat("no such an employee ",employeeID)as result;
elseif customerID not in (select customer_ID from customers)then
select concat("no such a customer ",customerID," you have to enter the customer first")as result;
end if;
end;
if carvin not in (select car_vin from sales)then
insert into sales(sale_date,sale_price,customer_ID,car_vin,employee_ID)
value(saledate,sale_price,customerID,upper(car_vin),lower(employeeID));
select concat(car_vin," sale inserted") as result;
else select concat('the car ',carvin,' have been soled')as result;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `new_vendor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `new_vendor`(
								firstname varchar(45),
                                lastname varchar(45),
								contactnumber varchar(45),
								email varchar(45))
BEGIN
insert into vendors (first_name,last_name,contact_number,email)
value(lower(firstname),lower(lastname),lower(contactnumber),lower(email));
select concat(firstname,' ',lastname,' inserted')as result;
END ;;
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

-- Dump completed on 2023-11-30 20:54:21
