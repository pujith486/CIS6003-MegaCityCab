-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: cab_booking_system
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.24-MariaDB

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
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `bookingId` int(11) NOT NULL AUTO_INCREMENT,
  `customerId` int(11) DEFAULT NULL,
  `driverId` int(11) DEFAULT NULL,
  `pickupLocation` varchar(255) NOT NULL,
  `destination` varchar(255) NOT NULL,
  `fare` double NOT NULL,
  `status` varchar(50) NOT NULL,
  `carId` int(11) DEFAULT NULL,
  PRIMARY KEY (`bookingId`),
  KEY `customerId` (`customerId`),
  KEY `driverId` (`driverId`),
  KEY `carId` (`carId`),
  CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`customerId`) REFERENCES `customer` (`customerId`),
  CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`driverId`) REFERENCES `driver` (`driverId`),
  CONSTRAINT `booking_ibfk_3` FOREIGN KEY (`carId`) REFERENCES `car` (`carId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (1,1,2,'Colombo','Mount Lavinia',1000,'Confirmed',NULL),(2,4,3,'Kandy','Nuwara Eliya',1200,'Pending',NULL),(3,2,5,'Galle','Matara',1500,'Completed',NULL),(4,3,4,'Negombo','Colombo',800,'Cancelled',NULL),(5,5,2,'Anuradhapura','Polonnaruwa',1800,'Confirmed',NULL),(6,1,2,'Colombo','Mount Lavinia',1000,'Confirmed',1),(7,4,3,'Kandy','Nuwara Eliya',1200,'Pending',2),(8,2,5,'Galle','Matara',1500,'Completed',3),(9,3,4,'Negombo','Colombo',800,'Cancelled',4),(10,5,2,'Anuradhapura','Polonnaruwa',1800,'Confirmed',5);
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-09 23:39:52
