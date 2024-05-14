-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: data
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `blogs`
--

DROP TABLE IF EXISTS `blogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blogs` (
  `blog_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` varchar(50) DEFAULT NULL,
  `place_id` int DEFAULT NULL,
  PRIMARY KEY (`blog_id`),
  KEY `user_id` (`user_id`),
  KEY `place_id` (`place_id`),
  CONSTRAINT `blogs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`username`),
  CONSTRAINT `blogs_ibfk_2` FOREIGN KEY (`place_id`) REFERENCES `places` (`place_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogs`
--

LOCK TABLES `blogs` WRITE;
/*!40000 ALTER TABLE `blogs` DISABLE KEYS */;
INSERT INTO `blogs` VALUES (1,'explore the vijayawada','Vijayawada represents the second most crucial and cosmopolitan city of Andhra Pradesh, where getting along with people is easier as they speak Telugu, Tamil, Hindi, and English. Development of Green belt along the Guntur highway, construction of inner ring roads, and the formation of parks have given a touch-up to the beauty of the city.\r\n\r\nBesant Road in Vijayawada is a well-known tourist spot and regarded as one of the busiest trade centers in the city. Visitors can shop for clothes, enjoy eating at the multi-cuisine restaurants, and watch the latest movies at the well-equipped cinema halls on this stretch of road.','2024-04-01 09:54:05','nagu',2),(4,'blogs','CONTENT','2024-05-09 17:55:22','nagalakshmi',2),(6,'nose','new','2024-05-09 18:12:42','nagalakshmi',2);
/*!40000 ALTER TABLE `blogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `booking_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contact_number` varchar(20) DEFAULT NULL,
  `number_of_rooms` int DEFAULT NULL,
  `hotel_id` int DEFAULT NULL,
  PRIMARY KEY (`booking_id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `contact_number` (`contact_number`),
  KEY `hotel_id` (`hotel_id`),
  CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `hotels` (`hotel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel_registration`
--

DROP TABLE IF EXISTS `hotel_registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotel_registration` (
  `hotel_id` int NOT NULL AUTO_INCREMENT,
  `hotel_email` varchar(100) NOT NULL,
  `hotel_phone_number` varchar(20) DEFAULT NULL,
  `hotel_name` varchar(100) NOT NULL,
  `hotel_place` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `hotel_username` varchar(50) NOT NULL,
  PRIMARY KEY (`hotel_id`),
  UNIQUE KEY `hotel_email` (`hotel_email`),
  UNIQUE KEY `hotel_username` (`hotel_username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel_registration`
--

LOCK TABLES `hotel_registration` WRITE;
/*!40000 ALTER TABLE `hotel_registration` DISABLE KEYS */;
INSERT INTO `hotel_registration` VALUES (4,'vijayalakshmi@codegnan.com','9876543210','AA\'s Kitchens','Bengaluru','1234','vijayalakshmi');
/*!40000 ALTER TABLE `hotel_registration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotels`
--

DROP TABLE IF EXISTS `hotels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotels` (
  `hotel_id` int NOT NULL AUTO_INCREMENT,
  `hotel_name` varchar(100) NOT NULL,
  `hotel_picture` varchar(200) DEFAULT NULL,
  `contact_number` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address_details` text,
  `timings` varchar(100) DEFAULT NULL,
  `total_rooms` int DEFAULT NULL,
  `room_cost` decimal(10,2) DEFAULT NULL,
  `hotel_description` text,
  `room_images` varchar(255) DEFAULT NULL,
  `room_availability` enum('available','not available') DEFAULT 'available',
  `available_rooms` int DEFAULT NULL,
  `place_id` int DEFAULT NULL,
  `added_by` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`hotel_id`),
  UNIQUE KEY `hotel_name` (`hotel_name`),
  UNIQUE KEY `contact_number` (`contact_number`),
  UNIQUE KEY `email` (`email`),
  KEY `place_id` (`place_id`),
  KEY `added_by` (`added_by`),
  CONSTRAINT `hotels_ibfk_1` FOREIGN KEY (`place_id`) REFERENCES `places` (`place_id`),
  CONSTRAINT `hotels_ibfk_2` FOREIGN KEY (`added_by`) REFERENCES `hotel_registration` (`hotel_username`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotels`
--

LOCK TABLES `hotels` WRITE;
/*!40000 ALTER TABLE `hotels` DISABLE KEYS */;
INSERT INTO `hotels` VALUES (13,'AA\'s Kitchens','D1hR5wA1w','7981087654','vijayalakshmi@codegnan.com','h.no 40-5-19/16.1st floor','8 - 12',99,5000.00,'done','G3eC5fM8b','available',22,2,'vijayalakshmi'),(15,'AA\'s ','F0rM1zB0l','9876543210','kesava@codegnan.com','nope','8 - 12',99,5000.00,'qwertyuiop','I0vD9gQ4v','available',22,2,'vijayalakshmi');
/*!40000 ALTER TABLE `hotels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `places`
--

DROP TABLE IF EXISTS `places`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `places` (
  `place_id` int NOT NULL AUTO_INCREMENT,
  `place_name` varchar(100) NOT NULL,
  `place_pic` varchar(200) DEFAULT NULL,
  `added_by` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`place_id`),
  UNIQUE KEY `place_name` (`place_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `places`
--

LOCK TABLES `places` WRITE;
/*!40000 ALTER TABLE `places` DISABLE KEYS */;
INSERT INTO `places` VALUES (2,'vijayawada','F9qV6rK9v','lemon@1'),(3,'hyderabad','O4zP9sR6w','Abhi');
/*!40000 ALTER TABLE `places` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trip_bookings`
--

DROP TABLE IF EXISTS `trip_bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trip_bookings` (
  `booking_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `contact_number` varchar(15) NOT NULL,
  `package_id` int DEFAULT NULL,
  PRIMARY KEY (`booking_id`),
  KEY `package_id` (`package_id`),
  CONSTRAINT `trip_bookings_ibfk_1` FOREIGN KEY (`package_id`) REFERENCES `trip_package` (`package_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trip_bookings`
--

LOCK TABLES `trip_bookings` WRITE;
/*!40000 ALTER TABLE `trip_bookings` DISABLE KEYS */;
INSERT INTO `trip_bookings` VALUES (5,'lakshmi','vijayalakshmi@codegnan.com','9087654321',4);
/*!40000 ALTER TABLE `trip_bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trip_package`
--

DROP TABLE IF EXISTS `trip_package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trip_package` (
  `package_id` int NOT NULL AUTO_INCREMENT,
  `place_id` int DEFAULT NULL,
  `package_name` varchar(255) DEFAULT NULL,
  `description` text,
  `price` decimal(10,2) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `duration_days` int DEFAULT NULL,
  `includes_amenities` text,
  `excludes_amenities` text,
  `company_name` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`package_id`),
  UNIQUE KEY `company_name` (`company_name`),
  KEY `place_id` (`place_id`),
  KEY `fk_username` (`username`),
  CONSTRAINT `fk_username` FOREIGN KEY (`username`) REFERENCES `tripplanner_registration` (`username`),
  CONSTRAINT `trip_package_ibfk_1` FOREIGN KEY (`place_id`) REFERENCES `places` (`place_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trip_package`
--

LOCK TABLES `trip_package` WRITE;
/*!40000 ALTER TABLE `trip_package` DISABLE KEYS */;
INSERT INTO `trip_package` VALUES (4,2,'world tour','Amenities encompass additions that are in excess of the basic needs of an individual, and usually include features such as pools, workout facilities, and internet.',10000.00,'2024-05-25','2024-05-26',1,'Amenities encompass additions that are in excess of the basic needs of an individual, and usually include features such as pools, workout facilities, and internet.','Amenities encompass additions that are in excess of the basic needs of an individual, and usually include features such as pools, workout facilities, and internet.','a','Vijayalakshmi147'),(7,2,'BZC','qwertyuioplkjhgfdszxcvbnm',10000.00,'2024-05-10','2024-05-20',10,'qwertyuioplkjhgfdszxcvbnm','qwertyuiopljhgfdsazxcvbnm','Abhi','anu'),(9,2,'tour','qwertyuiopasdfghjklzxcvbnm',9081.00,'2024-05-17','2024-05-27',10,'qwertyuiop','zxcvbnm','aa tech','anu');
/*!40000 ALTER TABLE `trip_package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tripplanner_registration`
--

DROP TABLE IF EXISTS `tripplanner_registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tripplanner_registration` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone_number` (`phone_number`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tripplanner_registration`
--

LOCK TABLES `tripplanner_registration` WRITE;
/*!40000 ALTER TABLE `tripplanner_registration` DISABLE KEYS */;
INSERT INTO `tripplanner_registration` VALUES (3,'anu','vijayalakshmi@codegnan.com','9182732645','h.no 40-5-19/16.1st floor','1234'),(6,'Vijayalakshmi147','chithajallu.vijayalakshmi@gmail.com','9876543120','h.no 40-5-19/16.1st floor','1234');
/*!40000 ALTER TABLE `tripplanner_registration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `username` varchar(50) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone_number` (`phone_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('nagalakshmi','vijayalakshmi@codegnan.com','9876543210','h.no 40-5-19/16.1st floor','nagu@123'),('nagu','nagalakshmi@codegnan.com','849464387','vijayawada','password');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-10  0:26:40
