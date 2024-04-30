-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: barber_app
-- ------------------------------------------------------
-- Server version	8.0.36-0ubuntu0.20.04.1

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
-- Table structure for table `Appointment`
--

DROP TABLE IF EXISTS `Appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Appointment` (
  `id_appointment` int NOT NULL AUTO_INCREMENT,
  `email_customer` varchar(50) NOT NULL,
  `email_barber` varchar(50) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  `complaint` varchar(250) DEFAULT NULL,
  `date_appointment` date DEFAULT NULL,
  `time_appointment` time DEFAULT NULL,
  PRIMARY KEY (`id_appointment`,`email_customer`,`email_barber`),
  KEY `fk_Appointment_Customer_idx` (`email_customer`),
  KEY `fk_Appointment_Barber1_idx` (`email_barber`),
  CONSTRAINT `fk_Appointment_Barber1` FOREIGN KEY (`email_barber`) REFERENCES `Barber` (`email`),
  CONSTRAINT `fk_Appointment_Customer` FOREIGN KEY (`email_customer`) REFERENCES `Customer` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Appointment`
--

LOCK TABLES `Appointment` WRITE;
/*!40000 ALTER TABLE `Appointment` DISABLE KEYS */;
INSERT INTO `Appointment` VALUES (1,'juan@gmail.com','barberpaul@gmail.com','','','2024-04-30','14:30:00'),(2,'juan@gmail.com','barberpaul@gmail.com','cancelled','','2024-04-30','07:00:00'),(3,'juan@gmail.com','johnbarber@gmail.com','confirmed','','2024-04-30','09:00:00'),(4,'juan@gmail.com','johnbarber@gmail.com','cancelled','','2024-04-30','13:00:00');
/*!40000 ALTER TABLE `Appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Barber`
--

DROP TABLE IF EXISTS `Barber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Barber` (
  `email` varchar(50) NOT NULL,
  `password` varchar(60) DEFAULT NULL,
  `first_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Barber`
--

LOCK TABLES `Barber` WRITE;
/*!40000 ALTER TABLE `Barber` DISABLE KEYS */;
INSERT INTO `Barber` VALUES ('barberpaul@gmail.com','$2a$12$GjhgaUvEtRxGrKxHwLrBpeKzjfxNfWDR4v2yq1Q.wGneqjDHnHzaC','Paul','MacConor','0874563217','Dublin'),('johnbarber@gmail.com','$2a$12$AZajaTXwv.pey4A3UWzy3.aQIqIAPFAnN0WChiGFSbDDW.HPV6ldi','John','John','0897653478','Galway');
/*!40000 ALTER TABLE `Barber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customer` (
  `email` varchar(50) NOT NULL,
  `password` varchar(60) DEFAULT NULL,
  `first_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
INSERT INTO `Customer` VALUES ('barberjohn@gmail.com','$2a$12$KPBEsmZdA.dbYpQXNeJzZuKJ98Hgd1NJcJN/IClEnQzBQn.nzT5fu','John','Maconor','876549823'),('juan@gmail.com','$2a$12$Lhen3jJsN9PA4dRlitxz.OzslSLCl5KySFs6q3K9Y1.ciIhOZIc0m','Juan','Lopez','876543219');
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Slot`
--

DROP TABLE IF EXISTS `Slot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Slot` (
  `id_slot` int NOT NULL AUTO_INCREMENT,
  `email_barber` varchar(50) NOT NULL,
  `time_slot` time DEFAULT NULL,
  `available_slot` tinyint DEFAULT NULL,
  PRIMARY KEY (`id_slot`,`email_barber`),
  KEY `fk_Slot_Barber1_idx` (`email_barber`),
  CONSTRAINT `fk_Slot_Barber1` FOREIGN KEY (`email_barber`) REFERENCES `Barber` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Slot`
--

LOCK TABLES `Slot` WRITE;
/*!40000 ALTER TABLE `Slot` DISABLE KEYS */;
INSERT INTO `Slot` VALUES (1,'barberpaul@gmail.com','07:00:00',1),(2,'barberpaul@gmail.com','09:00:00',1),(3,'barberpaul@gmail.com','11:00:00',1),(4,'barberpaul@gmail.com','14:00:00',0),(5,'barberpaul@gmail.com','14:30:00',1),(6,'barberpaul@gmail.com','16:00:00',1),(7,'barberpaul@gmail.com','18:00:00',1),(8,'barberpaul@gmail.com','19:00:00',1),(9,'johnbarber@gmail.com','07:00:00',1),(10,'johnbarber@gmail.com','09:00:00',0),(11,'johnbarber@gmail.com','10:00:00',1),(12,'johnbarber@gmail.com','13:00:00',1),(13,'johnbarber@gmail.com','20:00:00',1),(14,'johnbarber@gmail.com','21:00:00',1),(15,'johnbarber@gmail.com','23:00:00',1);
/*!40000 ALTER TABLE `Slot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'barber_app'
--

--
-- Dumping routines for database 'barber_app'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-30 20:32:10
