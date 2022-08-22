-- This backup has been created as .bat format backup is not available in macos



-- MySQL dump 10.13  Distrib 8.0.26, for macos11 (x86_64)
--
-- Host: localhost    Database: music_store_db
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `music_store_db`
--

/*!40000 DROP DATABASE IF EXISTS `music_store_db`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `music_store_db` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `music_store_db`;

--
-- Table structure for table `Address`
--

DROP TABLE IF EXISTS `Address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Address` (
  `address_id` int NOT NULL AUTO_INCREMENT,
  `address_1` varchar(45) NOT NULL,
  `address_2` varchar(45) DEFAULT NULL,
  `zip_code` varchar(45) NOT NULL,
  `city_id` int NOT NULL,
  PRIMARY KEY (`address_id`),
  KEY `fk_Address_Cities1` (`city_id`),
  CONSTRAINT `fk_Address_Cities1` FOREIGN KEY (`city_id`) REFERENCES `Cities` (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Address`
--

LOCK TABLES `Address` WRITE;
/*!40000 ALTER TABLE `Address` DISABLE KEYS */;
INSERT INTO `Address` VALUES (1,'580 King St N','Bldg. B','N2L 6L3',1),(2,'530 Columbia St N','Tower 1','N2H 7K5',1),(3,'200 University Ave W','Unit 2','N2A 3T6',1),(4,'145 Brybeck Crescent','Bldg. A','N2M 2C5',2),(5,'24 Shaw Street','Tower 3','M6J 3W1',3),(6,'20 Saint Patrick Street','Unit 1','M5T 2Y4',3),(7,'74 Southwood Dr','Tower 1','M4E 2T9',3),(8,'31 Eden Oak Trail','Unit 3','N2A 0G2',2),(9,'127 Cedarwoods Cres','Unit 1','N2C 2K1',2),(10,'875 University Ave','Unit 3','N2K 0A1',1),(11,'140 Brybeck Crescent','Apartment 106','N2M 2C5',2),(12,'150 Brybeck Crescent','Apartment 204','N2M 2C5',2),(13,'165 Brybeck Crescent','Apartment 301','N2M 2C5',2),(14,'75 Brybeck Crescent','Apartment 316','N2M 2C5',2),(15,'100 Brybeck Crescent','Apartment 114','N2M 2C5',2),(16,'871 University Ave','Unit 1','N2K 0A1',1),(17,'872 University Ave','Unit 2','N2K 0A1',1),(18,'873 University Ave','Unit 4','N2K 0A1',1),(19,'874 University Ave','Unit 5','N2K 0A1',1);
/*!40000 ALTER TABLE `Address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Albums`
--

DROP TABLE IF EXISTS `Albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Albums` (
  `album_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `artist` varchar(45) NOT NULL,
  PRIMARY KEY (`album_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Albums`
--

LOCK TABLES `Albums` WRITE;
/*!40000 ALTER TABLE `Albums` DISABLE KEYS */;
INSERT INTO `Albums` VALUES (1,'Fourth dimension','Stratovarious'),(2,'Kamikaze','Eminem'),(3,'Recovery','Eminem'),(4,'Music To Be Murdered By','Eminem');
/*!40000 ALTER TABLE `Albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cities`
--

DROP TABLE IF EXISTS `Cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cities` (
  `city_id` int NOT NULL AUTO_INCREMENT,
  `city_name` varchar(100) NOT NULL,
  `province_id` int NOT NULL,
  PRIMARY KEY (`city_id`),
  KEY `fk_Cities_Provinces1` (`province_id`),
  CONSTRAINT `fk_Cities_Provinces1` FOREIGN KEY (`province_id`) REFERENCES `Provinces` (`province_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cities`
--

LOCK TABLES `Cities` WRITE;
/*!40000 ALTER TABLE `Cities` DISABLE KEYS */;
INSERT INTO `Cities` VALUES (1,'Waterloo',1),(2,'Kitchener',1),(3,'Toronto',1),(4,'Vancouver',7),(5,'Montreal',3),(6,'Victoria',7),(7,'Halifax',9),(8,'Quebec City',3),(9,'Calgary',6),(10,'Ottawa',1);
/*!40000 ALTER TABLE `Cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ClientPaymentDetails`
--

DROP TABLE IF EXISTS `ClientPaymentDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ClientPaymentDetails` (
  `client_payment_details_id` int NOT NULL AUTO_INCREMENT,
  `card_last_four_digits` varchar(4) NOT NULL,
  `card_expiry_year` varchar(4) NOT NULL,
  `card_expiry_month` varchar(2) NOT NULL,
  `card_cvv` varchar(40) NOT NULL,
  `client_id` int NOT NULL,
  PRIMARY KEY (`client_payment_details_id`),
  KEY `fk_ClientPaymentDetails_Clients1` (`client_id`),
  CONSTRAINT `fk_ClientPaymentDetails_Clients1` FOREIGN KEY (`client_id`) REFERENCES `Clients` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ClientPaymentDetails`
--

LOCK TABLES `ClientPaymentDetails` WRITE;
/*!40000 ALTER TABLE `ClientPaymentDetails` DISABLE KEYS */;
INSERT INTO `ClientPaymentDetails` VALUES (1,'4567','2025','8','e44fea3bec53bcea3b7513ccef5857ac',1),(2,'5200','2026','12','5705e1164a8394aace6018e27d20d237',2),(3,'5044','2023','10','3dd48ab31d016ffcbf3314df2b3cb9ce',3),(4,'9033','2024','11','d81f9c1be2e08964bf9f24b15f0e4900',4),(5,'8091','2025','5','8b6dd7db9af49e67306feb59a8bdc52c',5),(6,'8900','2026','8','621461af90cadfdaf0e8d4cc25129f91',6),(7,'7822','2027','9','bbf94b34eb32268ada57a3be5062fe7d',7),(8,'6566','2025','8','443cb001c138b2561a0d90720d6ce111',8),(9,'9800','2027','1','ec8956637a99787bd197eacd77acce5e',9),(10,'9008','2028','3','a97da629b098b75c294dffdc3e463904',10);
/*!40000 ALTER TABLE `ClientPaymentDetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Clients`
--

DROP TABLE IF EXISTS `Clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Clients` (
  `client_id` int NOT NULL AUTO_INCREMENT,
  `contact_id` int NOT NULL,
  `user_id` int NOT NULL,
  `address_id` int NOT NULL,
  PRIMARY KEY (`client_id`),
  KEY `fk_Clients_Contacts1` (`contact_id`),
  KEY `fk_Clients_UserAuthentication1` (`user_id`),
  KEY `fk_Clients_Address1` (`address_id`),
  CONSTRAINT `fk_Clients_Address1` FOREIGN KEY (`address_id`) REFERENCES `Address` (`address_id`),
  CONSTRAINT `fk_Clients_Contacts1` FOREIGN KEY (`contact_id`) REFERENCES `Contacts` (`contact_id`),
  CONSTRAINT `fk_Clients_UserAuthentication1` FOREIGN KEY (`user_id`) REFERENCES `UserAuthentication` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Clients`
--

LOCK TABLES `Clients` WRITE;
/*!40000 ALTER TABLE `Clients` DISABLE KEYS */;
INSERT INTO `Clients` VALUES (1,2,1,8),(2,23,2,9),(3,22,3,10),(4,21,4,11),(5,20,5,11),(6,19,6,12),(7,18,7,12),(8,17,8,13),(9,16,9,14),(10,15,10,15);
/*!40000 ALTER TABLE `Clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ClientsHasAddress`
--

DROP TABLE IF EXISTS `ClientsHasAddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ClientsHasAddress` (
  `client_id` int NOT NULL,
  `address_id` int NOT NULL,
  PRIMARY KEY (`address_id`,`client_id`),
  KEY `fk_Clients_has_Address_Clients1` (`client_id`),
  CONSTRAINT `fk_Clients_has_Address_Address1` FOREIGN KEY (`address_id`) REFERENCES `Address` (`address_id`),
  CONSTRAINT `fk_Clients_has_Address_Clients1` FOREIGN KEY (`client_id`) REFERENCES `Clients` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ClientsHasAddress`
--

LOCK TABLES `ClientsHasAddress` WRITE;
/*!40000 ALTER TABLE `ClientsHasAddress` DISABLE KEYS */;
INSERT INTO `ClientsHasAddress` VALUES (1,8),(2,9),(3,10),(4,11),(5,11),(6,12),(7,12),(8,13),(9,14),(10,15);
/*!40000 ALTER TABLE `ClientsHasAddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Combos`
--

DROP TABLE IF EXISTS `Combos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Combos` (
  `combo_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`combo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Combos`
--

LOCK TABLES `Combos` WRITE;
/*!40000 ALTER TABLE `Combos` DISABLE KEYS */;
INSERT INTO `Combos` VALUES (1,'PROMO-ALL-AT-ONCE'),(2,'PROMO-TAKE-IT-ALL');
/*!40000 ALTER TABLE `Combos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CombosHasInstruments`
--

DROP TABLE IF EXISTS `CombosHasInstruments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CombosHasInstruments` (
  `combo_id` int NOT NULL,
  `instrument_id` int NOT NULL,
  PRIMARY KEY (`combo_id`,`instrument_id`),
  KEY `fk_Combos_has_Instruments_Instruments1` (`instrument_id`),
  CONSTRAINT `fk_Combos_has_Instruments_Combos1` FOREIGN KEY (`combo_id`) REFERENCES `Combos` (`combo_id`),
  CONSTRAINT `fk_Combos_has_Instruments_Instruments1` FOREIGN KEY (`instrument_id`) REFERENCES `Instruments` (`instrument_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CombosHasInstruments`
--

LOCK TABLES `CombosHasInstruments` WRITE;
/*!40000 ALTER TABLE `CombosHasInstruments` DISABLE KEYS */;
INSERT INTO `CombosHasInstruments` VALUES (1,1),(1,2),(2,2),(1,3),(2,3),(2,4),(2,5),(2,6),(2,10);
/*!40000 ALTER TABLE `CombosHasInstruments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CombosHasTracks`
--

DROP TABLE IF EXISTS `CombosHasTracks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CombosHasTracks` (
  `combo_id` int NOT NULL,
  `track_id` int NOT NULL,
  PRIMARY KEY (`combo_id`,`track_id`),
  KEY `fk_Combos_has_Articles_Articles1` (`track_id`),
  CONSTRAINT `fk_Combos_has_Articles_Articles1` FOREIGN KEY (`track_id`) REFERENCES `Tracks` (`track_id`),
  CONSTRAINT `fk_Combos_has_Articles_Combos1` FOREIGN KEY (`combo_id`) REFERENCES `Combos` (`combo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CombosHasTracks`
--

LOCK TABLES `CombosHasTracks` WRITE;
/*!40000 ALTER TABLE `CombosHasTracks` DISABLE KEYS */;
INSERT INTO `CombosHasTracks` VALUES (1,1),(2,1),(1,2),(2,2),(1,3),(2,3),(2,4),(2,5),(2,6);
/*!40000 ALTER TABLE `CombosHasTracks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Contacts`
--

DROP TABLE IF EXISTS `Contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Contacts` (
  `contact_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `phone_no` varchar(20) NOT NULL,
  PRIMARY KEY (`contact_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Contacts`
--

LOCK TABLES `Contacts` WRITE;
/*!40000 ALTER TABLE `Contacts` DISABLE KEYS */;
INSERT INTO `Contacts` VALUES (1,'Best Buy',NULL,'mail@bestbuy.com','1-866-237-8289'),(2,'Charles','Smith','charles@hotmail.com','510-114-3575'),(3,'Danny','McGrade','dann@gmail.com','200-123-4455'),(4,'John','Snow','JS123@gmail.com','200-423-6595'),(5,'Peter','Quill','PQ123@gmail.com','510-425-6591'),(6,'Mark','Twain','MT123@gmail.com','511-525-4592'),(7,'Diego','Maradona','DM123@gmail.com','200-124-6523'),(8,'Sam','Billings','SB69@gmail.com','510-121-4591'),(9,'Kane','Williams','KW123@gmail.com','512-411-5041'),(10,'James','Porter','JP1123@gmail.com','510-526-6795'),(11,'Harry','Styles','HS1232@gmail.com','510-345-7651'),(12,'Ravi','Jadeja','RJ123@gmail.com','201-425-6591'),(13,'Virat','Kohli','VK1123@gmail.com','511-649-7891'),(14,'Jon','Jones','jonbonejones@gmail.com','201-658-1234'),(15,'Khabib','Nurmagomedov','Khabib111@gmail.com','212-293-5342'),(16,'Robin','VanPersie','RVP99@gmail.com','210-425-8674'),(17,'Diego','Costa','DCosta99@gmail.com','513-250-9748'),(18,'Lionel','Messi','LM10@gmail.com','512-119-8671'),(19,'Cristiano','Ronaldo','CR7@gmail.com','201-911-9673'),(20,'George','StPierre','GSP123@gmail.com','202-685-3827'),(21,'Conor','Mcgregor','CMac444@gmail.com','865-654-5039'),(22,'Ray','Hopper','Rhopper1@gmail.com','866-425-7890'),(23,'Peter','Stark','PSTARK@gmail.com','200-425-9898');
/*!40000 ALTER TABLE `Contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employees`
--

DROP TABLE IF EXISTS `Employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Employees` (
  `employee_id` int NOT NULL AUTO_INCREMENT,
  `store_id` int NOT NULL,
  `contact_id` int NOT NULL,
  `address_id` int NOT NULL,
  PRIMARY KEY (`employee_id`),
  KEY `fk_Employees_stores1` (`store_id`),
  KEY `fk_Employees_Contacts1` (`contact_id`),
  KEY `fk_Employees_Address1` (`address_id`),
  CONSTRAINT `fk_Employees_Address1` FOREIGN KEY (`address_id`) REFERENCES `Address` (`address_id`),
  CONSTRAINT `fk_Employees_Contacts1` FOREIGN KEY (`contact_id`) REFERENCES `Contacts` (`contact_id`),
  CONSTRAINT `fk_Employees_stores1` FOREIGN KEY (`store_id`) REFERENCES `Stores` (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employees`
--

LOCK TABLES `Employees` WRITE;
/*!40000 ALTER TABLE `Employees` DISABLE KEYS */;
INSERT INTO `Employees` VALUES (1,1,4,2),(2,1,5,3),(3,1,6,4),(4,1,7,5),(5,1,8,6),(6,1,9,7),(7,1,10,16),(8,1,11,17),(9,1,12,18),(10,1,13,19);
/*!40000 ALTER TABLE `Employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Instruments`
--

DROP TABLE IF EXISTS `Instruments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Instruments` (
  `instrument_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`instrument_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Instruments`
--

LOCK TABLES `Instruments` WRITE;
/*!40000 ALTER TABLE `Instruments` DISABLE KEYS */;
INSERT INTO `Instruments` VALUES (1,'Guitar'),(2,'Bass'),(3,'Drums'),(4,'trumpet'),(5,'Piano'),(6,'Timpani'),(7,'Xylophone'),(8,'Cello'),(9,'Violin'),(10,'Harp');
/*!40000 ALTER TABLE `Instruments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Inventory`
--

DROP TABLE IF EXISTS `Inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Inventory` (
  `inventory_id` int NOT NULL AUTO_INCREMENT,
  `store_id` int NOT NULL,
  `instrument_id` int DEFAULT NULL,
  `track_id` int DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `discount` decimal(10,2) NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`inventory_id`),
  KEY `fk_Inventory_Stores1` (`store_id`),
  KEY `fk_Inventory_Articles1` (`track_id`),
  KEY `fk_Inventory_Instruments1` (`instrument_id`),
  CONSTRAINT `fk_Inventory_Articles1` FOREIGN KEY (`track_id`) REFERENCES `Tracks` (`track_id`),
  CONSTRAINT `fk_Inventory_Instruments1` FOREIGN KEY (`instrument_id`) REFERENCES `Instruments` (`instrument_id`),
  CONSTRAINT `fk_Inventory_Stores1` FOREIGN KEY (`store_id`) REFERENCES `Stores` (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Inventory`
--

LOCK TABLES `Inventory` WRITE;
/*!40000 ALTER TABLE `Inventory` DISABLE KEYS */;
INSERT INTO `Inventory` VALUES (1,1,1,NULL,100.00,0.00,100),(2,1,2,NULL,100.00,10.00,150),(3,1,3,NULL,50.00,10.00,100),(4,1,4,NULL,100.00,0.00,50),(5,1,5,NULL,50.00,5.00,100),(6,1,6,NULL,50.00,5.00,80),(7,1,7,NULL,80.00,10.00,70),(8,1,8,NULL,100.00,10.00,80),(9,1,9,NULL,50.00,5.00,90),(10,1,10,NULL,60.00,2.50,80),(11,1,NULL,1,2.00,1.00,80),(12,1,NULL,2,2.00,1.00,90),(13,1,NULL,3,2.00,1.00,80),(14,1,NULL,4,2.00,1.00,80),(15,1,NULL,5,2.00,1.00,80),(16,1,NULL,6,2.00,1.00,80),(17,1,NULL,7,2.00,1.00,80),(18,1,NULL,8,2.00,1.00,80),(19,1,NULL,9,2.00,1.00,80),(20,1,NULL,10,3.00,1.00,150),(21,1,NULL,11,3.00,1.00,150),(22,1,NULL,12,3.00,1.00,150),(23,1,NULL,13,3.00,1.00,150),(24,1,NULL,14,3.00,1.00,150),(25,1,NULL,15,3.00,1.00,150),(26,1,NULL,16,3.00,1.00,150),(27,1,NULL,17,3.00,1.00,150),(28,1,NULL,18,3.00,1.00,150),(29,1,NULL,19,3.00,1.00,150),(30,1,NULL,20,3.00,1.00,150),(31,1,NULL,21,3.00,0.00,250),(32,1,NULL,22,3.00,0.00,250),(33,1,NULL,23,3.00,0.00,250),(34,1,NULL,24,3.00,0.00,250),(35,1,NULL,25,3.00,0.00,250),(36,1,NULL,26,3.00,0.00,250),(37,1,NULL,27,3.00,0.00,250),(38,1,NULL,28,3.00,0.00,250),(39,1,NULL,29,3.00,0.00,250),(40,1,NULL,30,3.00,0.00,250),(41,1,NULL,31,3.00,0.00,250),(42,1,NULL,32,3.00,0.00,250),(43,1,NULL,33,3.00,0.00,200),(44,1,NULL,34,3.00,0.00,200),(45,1,NULL,35,3.00,0.00,200),(46,1,NULL,36,3.00,0.00,200),(47,1,NULL,37,3.00,0.00,200),(48,1,NULL,38,3.00,0.00,200),(49,1,NULL,39,3.00,0.00,200),(50,1,NULL,40,3.00,0.00,200),(51,1,NULL,41,3.00,0.00,200),(52,1,NULL,42,3.00,0.00,200),(53,1,NULL,43,3.00,0.00,200),(54,1,NULL,44,3.00,0.00,200),(55,1,NULL,45,3.00,0.00,200),(56,1,NULL,46,3.00,0.00,200),(57,1,NULL,47,3.00,0.00,200);
/*!40000 ALTER TABLE `Inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Orders`
--

DROP TABLE IF EXISTS `Orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `client_id` int NOT NULL,
  `order_date` datetime NOT NULL,
  `store_id` int NOT NULL,
  `employee_id` int NOT NULL,
  `order_payment_id` int NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `fk_Orders_Clients1` (`client_id`),
  KEY `fk_Orders_Locations1` (`store_id`),
  KEY `fk_Orders_Employees1` (`employee_id`),
  KEY `fk_Orders_OrdersPayment1` (`order_payment_id`),
  CONSTRAINT `fk_Orders_Clients1` FOREIGN KEY (`client_id`) REFERENCES `Clients` (`client_id`),
  CONSTRAINT `fk_Orders_Employees1` FOREIGN KEY (`employee_id`) REFERENCES `Employees` (`employee_id`),
  CONSTRAINT `fk_Orders_Locations1` FOREIGN KEY (`store_id`) REFERENCES `Stores` (`store_id`),
  CONSTRAINT `fk_Orders_OrdersPayment1` FOREIGN KEY (`order_payment_id`) REFERENCES `OrdersPayment` (`order_payment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orders`
--

LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;
INSERT INTO `Orders` VALUES (1,1,'2021-08-25 21:38:01',1,1,1),(2,1,'2021-10-29 21:38:01',1,1,2),(3,1,'2021-11-13 21:38:01',1,1,3),(4,2,'2021-11-03 21:38:01',1,2,4),(5,2,'2021-11-21 21:38:01',1,3,5),(6,2,'2021-11-18 21:38:01',1,2,6),(7,3,'2021-11-16 21:38:01',1,4,7),(8,4,'2021-11-08 21:38:01',1,5,8),(9,7,'2021-11-03 21:38:01',1,9,9),(10,10,'2021-11-03 21:38:01',1,2,10);
/*!40000 ALTER TABLE `Orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrdersAudit`
--

DROP TABLE IF EXISTS `OrdersAudit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OrdersAudit` (
  `order_audit_id` int NOT NULL AUTO_INCREMENT,
  `order_audit_date` datetime NOT NULL,
  `order_id` int NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `employee_id` int NOT NULL,
  `client_id` int NOT NULL,
  PRIMARY KEY (`order_audit_id`),
  KEY `fk_OrdersHistory_Orders1` (`order_id`),
  KEY `fk_OrdersAudit_Employees1` (`employee_id`),
  KEY `fk_OrdersAudit_Clients1` (`client_id`),
  CONSTRAINT `fk_OrdersAudit_Clients1` FOREIGN KEY (`client_id`) REFERENCES `Clients` (`client_id`),
  CONSTRAINT `fk_OrdersAudit_Employees1` FOREIGN KEY (`employee_id`) REFERENCES `Employees` (`employee_id`),
  CONSTRAINT `fk_OrdersHistory_Orders1` FOREIGN KEY (`order_id`) REFERENCES `Orders` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrdersAudit`
--

LOCK TABLES `OrdersAudit` WRITE;
/*!40000 ALTER TABLE `OrdersAudit` DISABLE KEYS */;
/*!40000 ALTER TABLE `OrdersAudit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrdersDetail`
--

DROP TABLE IF EXISTS `OrdersDetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OrdersDetail` (
  `order_detail_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `quantity` int DEFAULT NULL,
  `discount` decimal(10,2) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `track_id` int DEFAULT NULL,
  `combo_id` int DEFAULT NULL,
  `instrument_id` int DEFAULT NULL,
  PRIMARY KEY (`order_detail_id`),
  KEY `fk_OrdersDetail_Orders1` (`order_id`),
  KEY `fk_OrdersDetail_Articles1` (`track_id`),
  KEY `fk_OrdersDetail_Combos1` (`combo_id`),
  KEY `fk_OrdersDetail_Instruments1` (`instrument_id`),
  CONSTRAINT `fk_OrdersDetail_Articles1` FOREIGN KEY (`track_id`) REFERENCES `Tracks` (`track_id`),
  CONSTRAINT `fk_OrdersDetail_Combos1` FOREIGN KEY (`combo_id`) REFERENCES `Combos` (`combo_id`),
  CONSTRAINT `fk_OrdersDetail_Instruments1` FOREIGN KEY (`instrument_id`) REFERENCES `Instruments` (`instrument_id`),
  CONSTRAINT `fk_OrdersDetail_Orders1` FOREIGN KEY (`order_id`) REFERENCES `Orders` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrdersDetail`
--

LOCK TABLES `OrdersDetail` WRITE;
/*!40000 ALTER TABLE `OrdersDetail` DISABLE KEYS */;
INSERT INTO `OrdersDetail` VALUES (1,1,5,5.00,10.00,1,NULL,NULL),(2,1,2,46.00,512.00,NULL,1,NULL),(3,1,1,0.00,100.00,NULL,NULL,1),(4,1,10,10.00,20.00,2,NULL,NULL),(5,1,3,30.00,300.00,NULL,NULL,2),(6,2,8,8.00,16.00,1,NULL,NULL),(7,2,1,23.00,256.00,NULL,1,NULL),(8,2,4,0.00,400.00,NULL,NULL,1),(9,2,1,1.00,2.00,2,NULL,NULL),(10,2,3,30.00,300.00,NULL,NULL,2),(11,3,1,1.00,2.00,1,NULL,NULL),(12,3,1,1.00,2.00,2,NULL,NULL),(13,3,1,1.00,2.00,3,NULL,NULL),(14,3,1,1.00,2.00,4,NULL,NULL),(15,3,1,1.00,2.00,5,NULL,NULL),(16,3,1,1.00,2.00,6,NULL,NULL),(17,3,1,1.00,2.00,7,NULL,NULL),(18,3,1,1.00,2.00,8,NULL,NULL),(19,3,1,1.00,2.00,9,NULL,NULL),(20,4,5,0.00,500.00,NULL,NULL,1),(21,4,5,50.00,500.00,NULL,NULL,2),(22,5,10,50.00,500.00,NULL,NULL,5),(23,6,10,0.00,30.00,33,NULL,NULL),(24,6,10,0.00,30.00,34,NULL,NULL),(25,6,10,0.00,30.00,35,NULL,NULL),(26,6,10,0.00,30.00,36,NULL,NULL),(27,6,10,0.00,30.00,37,NULL,NULL),(28,6,10,0.00,30.00,38,NULL,NULL),(29,6,10,0.00,30.00,39,NULL,NULL),(30,6,10,0.00,30.00,40,NULL,NULL),(31,6,10,0.00,30.00,41,NULL,NULL),(32,6,10,0.00,30.00,42,NULL,NULL),(33,6,10,0.00,30.00,43,NULL,NULL),(34,6,10,0.00,30.00,44,NULL,NULL),(35,6,10,0.00,30.00,45,NULL,NULL),(36,6,10,0.00,30.00,46,NULL,NULL),(37,6,10,0.00,30.00,47,NULL,NULL),(38,7,5,0.00,15.00,33,NULL,NULL),(39,7,5,0.00,15.00,34,NULL,NULL),(40,7,5,0.00,15.00,35,NULL,NULL),(41,7,5,0.00,15.00,36,NULL,NULL),(42,7,5,0.00,15.00,37,NULL,NULL),(43,7,5,0.00,15.00,38,NULL,NULL),(44,7,5,0.00,15.00,39,NULL,NULL),(45,7,5,0.00,15.00,40,NULL,NULL),(46,7,5,0.00,15.00,41,NULL,NULL),(47,7,5,0.00,15.00,42,NULL,NULL),(48,7,5,0.00,15.00,43,NULL,NULL),(49,7,5,0.00,15.00,44,NULL,NULL),(50,7,5,0.00,15.00,45,NULL,NULL),(51,7,5,0.00,15.00,46,NULL,NULL),(52,7,5,0.00,15.00,47,NULL,NULL),(53,7,2,0.00,200.00,NULL,NULL,1),(54,8,1,0.00,100.00,NULL,NULL,1),(55,8,1,10.00,100.00,NULL,NULL,2),(56,8,1,10.00,50.00,NULL,NULL,3),(57,8,1,0.00,100.00,NULL,NULL,4),(58,8,1,5.00,50.00,NULL,NULL,5),(59,8,1,5.00,50.00,NULL,NULL,6),(60,8,1,10.00,80.00,NULL,NULL,7),(61,8,1,10.00,100.00,NULL,NULL,8),(62,8,1,5.00,50.00,NULL,NULL,9),(63,8,1,2.50,60.00,NULL,NULL,10),(64,9,1,0.00,100.00,NULL,NULL,1),(65,9,1,10.00,100.00,NULL,NULL,2),(66,9,1,10.00,50.00,NULL,NULL,3),(67,9,1,0.00,100.00,NULL,NULL,4),(68,9,1,5.00,50.00,NULL,NULL,5),(69,9,1,5.00,50.00,NULL,NULL,6),(70,9,1,10.00,80.00,NULL,NULL,7),(71,9,1,10.00,100.00,NULL,NULL,8),(72,9,1,5.00,50.00,NULL,NULL,9),(73,9,1,2.50,60.00,NULL,NULL,10),(74,9,1,1.00,2.00,1,NULL,NULL),(75,9,1,1.00,2.00,2,NULL,NULL),(76,9,1,1.00,2.00,3,NULL,NULL),(77,9,1,1.00,2.00,4,NULL,NULL),(78,9,1,1.00,2.00,5,NULL,NULL),(79,9,1,1.00,2.00,6,NULL,NULL),(80,9,1,1.00,2.00,7,NULL,NULL),(81,9,1,1.00,2.00,8,NULL,NULL),(82,9,1,1.00,2.00,9,NULL,NULL),(83,9,2,46.00,512.00,NULL,1,NULL),(84,10,2,0.00,6.00,21,NULL,NULL),(85,10,2,0.00,6.00,22,NULL,NULL),(86,10,2,0.00,6.00,23,NULL,NULL),(87,10,2,0.00,6.00,24,NULL,NULL),(88,10,2,0.00,6.00,25,NULL,NULL),(89,10,2,0.00,6.00,26,NULL,NULL),(90,10,2,0.00,6.00,27,NULL,NULL),(91,10,2,0.00,6.00,28,NULL,NULL),(92,10,2,0.00,6.00,29,NULL,NULL),(93,10,2,0.00,6.00,30,NULL,NULL),(94,10,2,0.00,6.00,31,NULL,NULL),(95,10,2,0.00,6.00,32,NULL,NULL),(96,10,4,4.00,12.00,10,NULL,NULL),(97,10,4,4.00,12.00,11,NULL,NULL),(98,10,4,4.00,12.00,12,NULL,NULL),(99,10,4,4.00,12.00,13,NULL,NULL),(100,10,4,4.00,12.00,14,NULL,NULL),(101,10,4,4.00,12.00,15,NULL,NULL),(102,10,4,4.00,12.00,16,NULL,NULL),(103,10,4,4.00,12.00,17,NULL,NULL),(104,10,4,4.00,12.00,18,NULL,NULL),(105,10,4,4.00,12.00,19,NULL,NULL),(106,10,4,4.00,12.00,20,NULL,NULL),(107,10,5,0.00,500.00,NULL,NULL,1);
/*!40000 ALTER TABLE `OrdersDetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrdersDetailAudit`
--

DROP TABLE IF EXISTS `OrdersDetailAudit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OrdersDetailAudit` (
  `order_detail_history_id` int NOT NULL AUTO_INCREMENT,
  `order_detail_id` int NOT NULL,
  `combo_id` int DEFAULT NULL,
  `track_id` int DEFAULT NULL,
  `instrument_id` int DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `discount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`order_detail_history_id`),
  KEY `fk_OrdersDetailHistory_OrdersDetail1` (`order_detail_id`),
  KEY `fk_OrdersDetailHistory_Combos1` (`combo_id`),
  KEY `fk_OrdersDetailHistory_Articles1` (`track_id`),
  KEY `fk_OrdersDetailHistory_Instruments1` (`instrument_id`),
  CONSTRAINT `fk_OrdersDetailHistory_Articles1` FOREIGN KEY (`track_id`) REFERENCES `Tracks` (`track_id`),
  CONSTRAINT `fk_OrdersDetailHistory_Combos1` FOREIGN KEY (`combo_id`) REFERENCES `Combos` (`combo_id`),
  CONSTRAINT `fk_OrdersDetailHistory_Instruments1` FOREIGN KEY (`instrument_id`) REFERENCES `Instruments` (`instrument_id`),
  CONSTRAINT `fk_OrdersDetailHistory_OrdersDetail1` FOREIGN KEY (`order_detail_id`) REFERENCES `OrdersDetail` (`order_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrdersDetailAudit`
--

LOCK TABLES `OrdersDetailAudit` WRITE;
/*!40000 ALTER TABLE `OrdersDetailAudit` DISABLE KEYS */;
/*!40000 ALTER TABLE `OrdersDetailAudit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrdersPayment`
--

DROP TABLE IF EXISTS `OrdersPayment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OrdersPayment` (
  `order_payment_id` int NOT NULL AUTO_INCREMENT,
  `order_payment_type_id` int NOT NULL,
  `card_last_four_digits` varchar(4) DEFAULT NULL,
  `card_authorization_no` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`order_payment_id`),
  KEY `fk_OrdersPayment_OrdersPaymentType1` (`order_payment_type_id`),
  CONSTRAINT `fk_OrdersPayment_OrdersPaymentType1` FOREIGN KEY (`order_payment_type_id`) REFERENCES `OrdersPaymentType` (`order_payment_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrdersPayment`
--

LOCK TABLES `OrdersPayment` WRITE;
/*!40000 ALTER TABLE `OrdersPayment` DISABLE KEYS */;
INSERT INTO `OrdersPayment` VALUES (1,1,'1090','14123123'),(2,1,'8060','12331233'),(3,1,'4060','32131223'),(4,1,'1910','56456456'),(5,2,'8019','75675675'),(6,2,'9102','47474747'),(7,2,'1152','70707070'),(8,2,'9977','23456532'),(9,3,'3346','98762345'),(10,3,'2255','24509874');
/*!40000 ALTER TABLE `OrdersPayment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrdersPaymentType`
--

DROP TABLE IF EXISTS `OrdersPaymentType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OrdersPaymentType` (
  `order_payment_type_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`order_payment_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrdersPaymentType`
--

LOCK TABLES `OrdersPaymentType` WRITE;
/*!40000 ALTER TABLE `OrdersPaymentType` DISABLE KEYS */;
INSERT INTO `OrdersPaymentType` VALUES (1,'CREDIT CARD VISA'),(2,'CREDIT CARD MASTER CARD'),(3,'CREDIT CARD AMEX'),(4,'DEBIT CARD VISA'),(5,'DEBIT CARD MASTERCARD'),(6,'FOREX CARD VISA'),(7,'FOREX CARD MASTERCARD'),(8,'PREPAID CARD VISA'),(9,'PREPAID CARD MASTERCARD'),(10,'STORE CREDITS');
/*!40000 ALTER TABLE `OrdersPaymentType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Provinces`
--

DROP TABLE IF EXISTS `Provinces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Provinces` (
  `province_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`province_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Provinces`
--

LOCK TABLES `Provinces` WRITE;
/*!40000 ALTER TABLE `Provinces` DISABLE KEYS */;
INSERT INTO `Provinces` VALUES (1,'ON'),(2,'NL'),(3,'QC'),(4,'MB'),(5,'SK'),(6,'AB'),(7,'BC'),(8,'YT'),(9,'NT'),(10,'NU');
/*!40000 ALTER TABLE `Provinces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Stores`
--

DROP TABLE IF EXISTS `Stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Stores` (
  `store_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `open_time` time NOT NULL,
  `close_time` time NOT NULL,
  `contact_id` int NOT NULL,
  `address_id` int NOT NULL,
  PRIMARY KEY (`store_id`),
  KEY `fk_Stores_Contacts1` (`contact_id`),
  KEY `fk_Stores_Address1` (`address_id`),
  CONSTRAINT `fk_Stores_Address1` FOREIGN KEY (`address_id`) REFERENCES `Address` (`address_id`),
  CONSTRAINT `fk_Stores_Contacts1` FOREIGN KEY (`contact_id`) REFERENCES `Contacts` (`contact_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Stores`
--

LOCK TABLES `Stores` WRITE;
/*!40000 ALTER TABLE `Stores` DISABLE KEYS */;
INSERT INTO `Stores` VALUES (1,'Best buy','10:00:00','18:00:00',1,1);
/*!40000 ALTER TABLE `Stores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tracks`
--

DROP TABLE IF EXISTS `Tracks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tracks` (
  `track_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  `genre` varchar(45) DEFAULT NULL,
  `album_id` int NOT NULL,
  PRIMARY KEY (`track_id`),
  KEY `fk_Tracks_Albums1` (`album_id`),
  CONSTRAINT `fk_Tracks_Albums1` FOREIGN KEY (`album_id`) REFERENCES `Albums` (`album_id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tracks`
--

LOCK TABLES `Tracks` WRITE;
/*!40000 ALTER TABLE `Tracks` DISABLE KEYS */;
INSERT INTO `Tracks` VALUES (1,'Winter','Power Metal',1),(2,'Lord of the Wasteland','Power Metal',1),(3,'Twilight Symphony','Power Metal',1),(4,'We hold the key','Power Metal',1),(5,'Distant Skies','Power Metal',1),(6,'Galaxies','Power Metal',1),(7,'Call the Wilderness','Power Metal',1),(8,'Dreamspace','Power Metal',1),(9,'Nightfall','Power Metal',1),(10,'The Ringer','Hip-Hop',2),(11,'Greatest','Hip-Hop',2),(12,'Lucky You','Hip-Hop',2),(13,'Normal','Hip-Hop',2),(14,'Stepping Stones','Hip-Hop',2),(15,'Kamikaze','Hip-Hop',2),(16,'Not Alike','Hip-Hop',2),(17,'Fall','Hip-Hop',2),(18,'Nice Guy','Hip-Hop',2),(19,'Good Guy','Hip-Hop',2),(20,'Venom','Hip-Hop',2),(21,'Cold Wind Blows','Hip-Hop',3),(22,'Talkin 2 Myself','Hip-Hop',3),(23,'On Fire','Hip-Hop',3),(24,'Wont Back Down','Hip-Hop',3),(25,'Going Through Changes','Hip-Hop',3),(26,'Not Afraid','Hip-Hop',3),(27,'Seduction','Hip-Hop',3),(28,'No Love','Hip-Hop',3),(29,'Love the Way You Lie','Hip-Hop',3),(30,'25 to Life','Hip-Hop',3),(31,'Space Bound','Hip-Hop',3),(32,'Almost Famous','Hip-Hop',3),(33,'Premonition','Rap',4),(34,'Unaccommodating','Rap',4),(35,'Alfred','Rap',4),(36,'Little Engine','Rap',4),(37,'Darkness','Rap',4),(38,'In Too Deep','Rap',4),(39,'Leaving Heaven','Rap',4),(40,'Yah Yah','Rap',4),(41,'Step Dad','Rap',4),(42,'Marsh','Rap',4),(43,'Never Love Again','Rap',4),(44,'Lock it up','Rap',4),(45,'No Regrets','Rap',4),(46,'Farewell','Rap',4),(47,'Godzilla','Rap',4);
/*!40000 ALTER TABLE `Tracks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserAuthentication`
--

DROP TABLE IF EXISTS `UserAuthentication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `UserAuthentication` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserAuthentication`
--

LOCK TABLES `UserAuthentication` WRITE;
/*!40000 ALTER TABLE `UserAuthentication` DISABLE KEYS */;
INSERT INTO `UserAuthentication` VALUES (1,'6412f2f37dcc6246e6d8344545a9cdac'),(2,'afdd606accff37fe34c401cccf28bebe'),(3,'1794b75d29264c183438e0274221357b'),(4,'fe78bcfc68d69a154cd23a42ee7920fd'),(5,'ef4c4cb581fc161f6c63843ec9438a02'),(6,'0207baa4afc8fd2a5e1ac2a6e05148e9'),(7,'e5f0df8ebc0d1196002cc295b0f2a1d5'),(8,'10d0f62c57e1e17b5e74b72dfe27a596'),(9,'7ab77fe752ef5f4861a0ada9c25e84d7'),(10,'cae695b5b72cf671b69348ad650951cb');
/*!40000 ALTER TABLE `UserAuthentication` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-23 23:21:16
