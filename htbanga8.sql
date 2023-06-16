-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: hethonggaran
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `categoryId` int NOT NULL,
  `name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `createdTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedTime` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdUser` int NOT NULL,
  `updatedUser` int DEFAULT NULL,
  PRIMARY KEY (`categoryId`),
  KEY `createdUser` (`createdUser`),
  KEY `category_ibfk_2` (`updatedUser`),
  CONSTRAINT `category_ibfk_1` FOREIGN KEY (`createdUser`) REFERENCES `user` (`userId`),
  CONSTRAINT `category_ibfk_2` FOREIGN KEY (`updatedUser`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Category 1','2023-05-22 00:30:28','2023-05-22 00:30:28',1,NULL),(2,'Category 2','2023-05-22 00:30:28','2023-05-22 00:30:28',1,NULL),(3,'Category 3','2023-05-22 00:30:28','2023-05-22 00:30:28',2,NULL);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customerId` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `phone` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `createdUser` int DEFAULT NULL,
  `createdTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `point` int DEFAULT '0',
  `updatedUser` int DEFAULT NULL,
  `updatedTime` datetime DEFAULT NULL,
  PRIMARY KEY (`customerId`),
  UNIQUE KEY `phone_UNIQUE` (`phone`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `createdUser` (`createdUser`),
  KEY `updatedUser` (`updatedUser`),
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`createdUser`) REFERENCES `user` (`userId`),
  CONSTRAINT `customer_ibfk_2` FOREIGN KEY (`updatedUser`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'kiet123','0123456789','kh1@gmail.com','quan 9',NULL,'2023-05-22 00:18:18',900,1,'2023-06-16 00:18:18'),(2,'khach hang 2','0123434221','kh2@gmail.com','quan tan binh',NULL,'2023-05-25 00:18:18',900,NULL,NULL),(3,'khach hang 3','0123213823','kh3@gmail.com',NULL,NULL,'2023-05-17 00:18:18',900,NULL,NULL);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food`
--

DROP TABLE IF EXISTS `food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food` (
  `foodId` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `available` tinyint NOT NULL,
  `unit` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `createdTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedTime` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdUser` int NOT NULL,
  `updatedUser` int DEFAULT NULL,
  `categoryId` int NOT NULL,
  `image` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`foodId`),
  KEY `categoryId` (`categoryId`),
  KEY `createdUser` (`createdUser`),
  KEY `food_ibfk_3` (`updatedUser`),
  CONSTRAINT `food_ibfk_1` FOREIGN KEY (`categoryId`) REFERENCES `category` (`categoryId`),
  CONSTRAINT `food_ibfk_2` FOREIGN KEY (`createdUser`) REFERENCES `user` (`userId`),
  CONSTRAINT `food_ibfk_3` FOREIGN KEY (`updatedUser`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food`
--

LOCK TABLES `food` WRITE;
/*!40000 ALTER TABLE `food` DISABLE KEYS */;
INSERT INTO `food` VALUES (1,'Món ăn 1',1,'1','2023-05-22 00:39:13','2023-05-22 00:39:13',1,NULL,1,NULL),(2,'Món ăn 2',1,'5','2023-05-22 00:39:13','2023-05-22 00:39:13',1,2,2,NULL),(3,'Món ăn 3',0,'10','2023-05-22 00:39:13','2023-05-22 00:39:13',2,2,3,NULL),(4,'Món ăn 4',1,'3','2023-05-24 01:50:44','2023-05-24 01:50:44',1,NULL,2,NULL);
/*!40000 ALTER TABLE `food` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fooddetail`
--

DROP TABLE IF EXISTS `fooddetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fooddetail` (
  `detailId` int NOT NULL AUTO_INCREMENT,
  `foodId` int NOT NULL,
  `ingredientId` int NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`detailId`),
  KEY `ingredientId` (`ingredientId`),
  KEY `foodId` (`foodId`),
  CONSTRAINT `fooddetail_ibfk_1` FOREIGN KEY (`ingredientId`) REFERENCES `ingredient` (`ingredientId`),
  CONSTRAINT `fooddetail_ibfk_2` FOREIGN KEY (`foodId`) REFERENCES `food` (`foodId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fooddetail`
--

LOCK TABLES `fooddetail` WRITE;
/*!40000 ALTER TABLE `fooddetail` DISABLE KEYS */;
INSERT INTO `fooddetail` VALUES (1,1,1,10),(2,3,2,3),(3,2,2,5);
/*!40000 ALTER TABLE `fooddetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `foodstockhistory`
--

DROP TABLE IF EXISTS `foodstockhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `foodstockhistory` (
  `foodStockHistoryId` int NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `createdTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdUser` int NOT NULL,
  `foodId` int NOT NULL,
  `wareHouseId` int NOT NULL,
  PRIMARY KEY (`foodStockHistoryId`),
  KEY `createdUser` (`createdUser`),
  KEY `foodId` (`foodId`),
  KEY `wareHouseId` (`wareHouseId`),
  CONSTRAINT `foodstockhistory_ibfk_1` FOREIGN KEY (`createdUser`) REFERENCES `user` (`userId`),
  CONSTRAINT `foodstockhistory_ibfk_2` FOREIGN KEY (`foodId`) REFERENCES `food` (`foodId`),
  CONSTRAINT `foodstockhistory_ibfk_3` FOREIGN KEY (`wareHouseId`) REFERENCES `warehouse` (`wareHouseId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foodstockhistory`
--

LOCK TABLES `foodstockhistory` WRITE;
/*!40000 ALTER TABLE `foodstockhistory` DISABLE KEYS */;
INSERT INTO `foodstockhistory` VALUES (1,5,'2023-05-22 00:40:57',1,1,1),(2,3,'2023-05-22 00:40:57',1,2,2),(3,12,'2023-05-22 00:40:57',2,3,1);
/*!40000 ALTER TABLE `foodstockhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredient`
--

DROP TABLE IF EXISTS `ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredient` (
  `ingredientId` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `unit` int NOT NULL,
  `available` tinyint NOT NULL,
  `image` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `createdTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedTime` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdUser` int DEFAULT NULL,
  `updatedUser` int DEFAULT NULL,
  PRIMARY KEY (`ingredientId`),
  KEY `createdUser` (`createdUser`),
  KEY `updatedUser` (`updatedUser`),
  CONSTRAINT `ingredient_ibfk_1` FOREIGN KEY (`createdUser`) REFERENCES `user` (`userId`),
  CONSTRAINT `ingredient_ibfk_2` FOREIGN KEY (`updatedUser`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredient`
--

LOCK TABLES `ingredient` WRITE;
/*!40000 ALTER TABLE `ingredient` DISABLE KEYS */;
INSERT INTO `ingredient` VALUES (1,'Nguyên liệu 1',10,1,NULL,'2023-05-22 22:09:45','2023-05-22 22:09:45',NULL,NULL),(2,'Nguyên liệu 2',100,1,NULL,'2023-05-22 22:09:45','2023-05-22 22:09:45',NULL,NULL),(3,'Nguyên liệu 3',101,0,NULL,'2023-05-22 22:09:45','2023-05-22 22:09:45',NULL,NULL);
/*!40000 ALTER TABLE `ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredientstockhistory`
--

DROP TABLE IF EXISTS `ingredientstockhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredientstockhistory` (
  `ingredientStockHistory` int NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `createdTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdUser` int NOT NULL,
  `wareHouseId` int NOT NULL,
  `ingredientId` int NOT NULL,
  PRIMARY KEY (`ingredientStockHistory`),
  KEY `ingredientId` (`ingredientId`),
  KEY `wareHouseId` (`wareHouseId`),
  KEY `createdUser` (`createdUser`),
  CONSTRAINT `ingredientstockhistory_ibfk_1` FOREIGN KEY (`ingredientId`) REFERENCES `ingredient` (`ingredientId`),
  CONSTRAINT `ingredientstockhistory_ibfk_3` FOREIGN KEY (`wareHouseId`) REFERENCES `warehouse` (`wareHouseId`),
  CONSTRAINT `ingredientstockhistory_ibfk_4` FOREIGN KEY (`createdUser`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredientstockhistory`
--

LOCK TABLES `ingredientstockhistory` WRITE;
/*!40000 ALTER TABLE `ingredientstockhistory` DISABLE KEYS */;
INSERT INTO `ingredientstockhistory` VALUES (1,10,'2023-05-22 00:36:54',1,1,1),(2,21,'2023-05-22 00:36:54',2,2,2);
/*!40000 ALTER TABLE `ingredientstockhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `orderId` int NOT NULL AUTO_INCREMENT,
  `orderTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `totalMoney` decimal(10,2) NOT NULL,
  `createdUser` int NOT NULL,
  `customerId` int NOT NULL,
  `promoteId` int DEFAULT NULL,
  `canceledUser` int DEFAULT NULL,
  `paymentMethodId` int DEFAULT NULL,
  `canceledTime` datetime DEFAULT NULL,
  `status` varchar(20) DEFAULT 'Pending',
  PRIMARY KEY (`orderId`),
  KEY `customerId` (`customerId`),
  KEY `createdUser` (`createdUser`),
  KEY `canceledUser` (`canceledUser`),
  KEY `paymentMethodId` (`paymentMethodId`),
  KEY `order_ibfk_3` (`promoteId`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`customerId`) REFERENCES `customer` (`customerId`),
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`createdUser`) REFERENCES `user` (`userId`),
  CONSTRAINT `order_ibfk_3` FOREIGN KEY (`promoteId`) REFERENCES `promotion` (`promoteId`),
  CONSTRAINT `order_ibfk_4` FOREIGN KEY (`canceledUser`) REFERENCES `user` (`userId`),
  CONSTRAINT `order_ibfk_5` FOREIGN KEY (`paymentMethodId`) REFERENCES `paymentmethod` (`paymentMethodId`),
  CONSTRAINT `order_chk_1` CHECK ((`status` in (_utf8mb4'Pending',_utf8mb4'Processing',_utf8mb4'Completed',_utf8mb4'Cancelled')))
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,'2023-05-22 00:30:13',100000.00,1,1,NULL,NULL,1,NULL,'Pending'),(2,'2023-05-22 00:28:12',200000.00,2,2,1,1,2,'2023-05-22 00:18:18','Pending'),(3,'2023-05-22 22:03:19',150000.00,2,3,NULL,NULL,1,NULL,'Pending'),(4,'2023-05-22 22:05:11',150000.00,2,3,NULL,NULL,1,NULL,'Pending'),(5,'2023-05-22 22:06:43',150000.00,2,3,1,NULL,1,NULL,'Pending'),(6,'2023-06-15 04:52:27',1000.00,2,1,NULL,NULL,1,NULL,'Pending'),(7,'2023-06-15 04:52:56',1000.00,2,1,NULL,NULL,1,NULL,'Pending'),(8,'2023-06-15 05:58:41',1000.00,2,1,NULL,NULL,1,NULL,'Pending'),(9,'2023-06-15 05:59:56',1000.00,2,1,NULL,NULL,1,NULL,'Pending'),(10,'2023-06-15 06:00:05',1000.00,2,1,NULL,NULL,1,NULL,'Pending'),(12,'2023-06-15 21:34:22',1000.00,2,1,NULL,NULL,1,NULL,'Pending'),(13,'2023-06-15 21:36:30',1000.00,2,1,NULL,NULL,1,NULL,'Pending'),(14,'2023-06-15 21:46:31',1000.00,2,1,NULL,NULL,1,NULL,'Pending'),(15,'2023-06-15 21:49:21',1000.00,2,1,NULL,NULL,1,NULL,'Pending'),(16,'2023-06-15 21:50:41',1000.00,2,1,NULL,NULL,1,NULL,'Pending'),(17,'2023-06-15 21:51:15',1000.00,2,1,NULL,NULL,1,NULL,'Pending'),(18,'2023-06-15 21:53:18',1000.00,2,1,NULL,NULL,1,NULL,'Pending'),(19,'2023-06-15 21:54:21',900.00,2,1,1,NULL,1,NULL,'Pending');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdetail`
--

DROP TABLE IF EXISTS `orderdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderdetail` (
  `orderDetailId` int NOT NULL AUTO_INCREMENT,
  `orderId` int NOT NULL,
  `foodId` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`orderDetailId`),
  KEY `orderId` (`orderId`),
  KEY `foodId` (`foodId`),
  CONSTRAINT `orderdetail_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `order` (`orderId`),
  CONSTRAINT `orderdetail_ibfk_2` FOREIGN KEY (`foodId`) REFERENCES `food` (`foodId`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetail`
--

LOCK TABLES `orderdetail` WRITE;
/*!40000 ALTER TABLE `orderdetail` DISABLE KEYS */;
INSERT INTO `orderdetail` VALUES (1,1,1,70000.00,1),(2,1,3,30000.00,1),(3,2,1,70000.00,2),(4,2,3,30000.00,2),(5,4,3,30000.00,5),(6,5,3,30000.00,5),(7,5,2,30000.00,2),(8,5,2,30000.00,2),(9,5,2,30000.00,2),(10,15,1,1000.00,1),(11,16,1,1000.00,1),(12,17,1,1000.00,1),(13,18,1,1000.00,1),(14,19,1,1000.00,1);
/*!40000 ALTER TABLE `orderdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paymentmethod`
--

DROP TABLE IF EXISTS `paymentmethod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paymentmethod` (
  `paymentMethodId` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `detail` text,
  `available` tinyint DEFAULT NULL,
  `createdUser` int DEFAULT NULL,
  `updatedUser` int DEFAULT NULL,
  `updatedTime` datetime DEFAULT NULL,
  `createdTime` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`paymentMethodId`),
  KEY `updatedUser` (`updatedUser`),
  KEY `createdUser` (`createdUser`),
  CONSTRAINT `paymentmethod_ibfk_1` FOREIGN KEY (`updatedUser`) REFERENCES `user` (`userId`),
  CONSTRAINT `paymentmethod_ibfk_2` FOREIGN KEY (`createdUser`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paymentmethod`
--

LOCK TABLES `paymentmethod` WRITE;
/*!40000 ALTER TABLE `paymentmethod` DISABLE KEYS */;
INSERT INTO `paymentmethod` VALUES (1,'Tiền mặt',NULL,NULL,NULL,NULL,NULL,NULL),(2,'Chuyển khoản',NULL,NULL,NULL,NULL,NULL,NULL),(3,'Ví điện tử',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `paymentmethod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pricelist`
--

DROP TABLE IF EXISTS `pricelist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pricelist` (
  `priceId` int NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  `startDate` datetime NOT NULL,
  `enddate` datetime NOT NULL,
  `createdDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `createdUser` int NOT NULL,
  `updatedDate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updatedUser` int DEFAULT NULL,
  PRIMARY KEY (`priceId`),
  KEY `updatedUser` (`updatedUser`),
  KEY `createdUser` (`createdUser`),
  CONSTRAINT `pricelist_ibfk_1` FOREIGN KEY (`updatedUser`) REFERENCES `user` (`userId`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `pricelist_ibfk_2` FOREIGN KEY (`createdUser`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pricelist`
--

LOCK TABLES `pricelist` WRITE;
/*!40000 ALTER TABLE `pricelist` DISABLE KEYS */;
INSERT INTO `pricelist` VALUES (1,'SELL','2023-03-22 00:40:57','2023-04-22 00:40:57','2023-05-22 00:47:29',1,'2023-06-15 22:46:50',NULL),(2,'SELL','2023-05-22 00:40:57','2023-07-22 00:40:57','2023-05-22 00:48:01',1,'2023-06-15 22:46:50',NULL),(3,'BUY','2023-06-22 00:40:57','2023-07-22 00:40:57','2023-05-22 00:48:01',2,'2023-06-15 22:46:50',NULL),(17,'SELL','2023-06-16 03:38:20','2023-06-17 03:38:20','2023-06-15 22:56:11',2,'2023-06-15 22:56:11',NULL),(18,'SELL','2023-06-16 03:38:20','2023-06-17 03:38:20','2023-06-15 22:56:34',2,'2023-06-15 22:56:34',NULL),(19,'SELL','2023-06-16 03:38:20','2023-06-17 03:38:20','2023-06-15 22:56:54',2,'2023-06-15 22:56:54',NULL),(20,'SELL','2023-06-16 03:38:20','2023-06-17 03:38:20','2023-06-15 22:57:28',2,'2023-06-15 22:57:28',NULL),(21,'SELL','2023-06-16 03:38:20','2023-06-17 03:38:20','2023-06-15 22:59:03',2,'2023-06-15 22:59:03',NULL),(22,'SELL','2023-06-16 03:38:20','2023-06-17 03:38:20','2023-06-15 22:59:43',2,'2023-06-15 22:59:43',NULL),(23,'SELL','2023-06-16 03:38:20','2023-06-17 03:38:20','2023-06-15 23:00:19',2,'2023-06-15 23:00:19',NULL),(24,'SELL','2023-06-16 03:38:20','2023-06-17 03:38:20','2023-06-15 23:00:41',2,'2023-06-15 23:00:41',NULL),(25,'SELL','2023-06-16 03:38:20','2023-06-17 03:38:20','2023-06-15 23:00:50',2,'2023-06-15 23:00:50',NULL),(26,'SELL','2023-06-16 03:38:20','2023-06-17 03:38:20','2023-06-15 23:01:33',2,'2023-06-15 23:01:33',NULL),(27,'SELL','2023-06-16 03:38:20','2023-06-17 03:38:20','2023-06-15 23:02:23',2,'2023-06-15 23:02:23',NULL);
/*!40000 ALTER TABLE `pricelist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productprice`
--

DROP TABLE IF EXISTS `productprice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productprice` (
  `id` int NOT NULL,
  `productId` int NOT NULL,
  `priceListId` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `createdDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `createdUser` int DEFAULT NULL,
  `updatedDate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updatedUser` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `productId` (`productId`),
  KEY `priceListId` (`priceListId`),
  KEY `createdUser` (`createdUser`),
  KEY `updatedUser` (`updatedUser`),
  CONSTRAINT `productprice_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `food` (`foodId`),
  CONSTRAINT `productprice_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `ingredient` (`ingredientId`),
  CONSTRAINT `productprice_ibfk_3` FOREIGN KEY (`priceListId`) REFERENCES `pricelist` (`priceId`),
  CONSTRAINT `productprice_ibfk_4` FOREIGN KEY (`priceListId`) REFERENCES `pricelist` (`priceId`),
  CONSTRAINT `productprice_ibfk_5` FOREIGN KEY (`productId`) REFERENCES `ingredient` (`ingredientId`),
  CONSTRAINT `productprice_ibfk_6` FOREIGN KEY (`createdUser`) REFERENCES `user` (`userId`),
  CONSTRAINT `productprice_ibfk_7` FOREIGN KEY (`updatedUser`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productprice`
--

LOCK TABLES `productprice` WRITE;
/*!40000 ALTER TABLE `productprice` DISABLE KEYS */;
INSERT INTO `productprice` VALUES (1,1,1,10000.00,'2023-05-22 18:42:51',1,'2023-05-22 18:42:51',NULL),(2,2,2,20000.00,'2023-05-22 18:42:51',1,'2023-05-22 18:42:51',NULL);
/*!40000 ALTER TABLE `productprice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotion`
--

DROP TABLE IF EXISTS `promotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promotion` (
  `promoteId` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `dateCreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `available` tinyint NOT NULL,
  `discount` int NOT NULL,
  `requirePoint` int NOT NULL,
  `createdUser` int NOT NULL,
  PRIMARY KEY (`promoteId`),
  KEY `createdUser` (`createdUser`),
  CONSTRAINT `promotion_ibfk_1` FOREIGN KEY (`createdUser`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotion`
--

LOCK TABLES `promotion` WRITE;
/*!40000 ALTER TABLE `promotion` DISABLE KEYS */;
INSERT INTO `promotion` VALUES (1,'Khuyến mãi 10%','2023-05-22 00:27:06',1,10,100,1),(2,'Khuyến mãi 20%','2023-05-22 00:27:06',1,20,150,1),(3,'Khuyến mãi 50%','2023-05-22 00:27:06',0,50,400,1);
/*!40000 ALTER TABLE `promotion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `roleId` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdUser` int NOT NULL,
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Quản lý','2023-05-22 00:12:55',1),(2,'Nhân viên','2023-05-22 00:12:55',1);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `phone` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `image` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `password` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `status` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `createdDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `createdUser` int NOT NULL,
  `warehouseId` int DEFAULT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `warehouseId` (`warehouseId`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`warehouseId`) REFERENCES `warehouse` (`wareHouseId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'kiet','tuankiet@gmail.com','0777411676',NULL,'$2b$10$MQVluybtImsi00.Ez8rW4OpYDkVsgNq7nhvAGriWad4oiPFmQPnoG',NULL,'2023-05-22 00:09:47',1,NULL),(2,'kiet2','tuankiet2@gmail.com','0123456789',NULL,'$2b$10$MQVluybtImsi00.Ez8rW4OpYDkVsgNq7nhvAGriWad4oiPFmQPnoG',NULL,'2023-05-22 00:11:18',1,NULL),(3,'kiet3','tuankiet3@gmail.com','0123132332',NULL,'123456$2b$2b$10$MQVluybtImsi00.Ez8rW4OpYDkVsgNq7nhvAGriWad4oiPFmQPnoG',NULL,'2023-05-22 00:11:18',2,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userrole`
--

DROP TABLE IF EXISTS `userrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userrole` (
  `id` int NOT NULL AUTO_INCREMENT,
  `roleId` int NOT NULL,
  `userId` int NOT NULL,
  `createdTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `createdUser` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `roleId` (`roleId`),
  KEY `userId` (`userId`),
  CONSTRAINT `userrole_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `role` (`roleId`),
  CONSTRAINT `userrole_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userrole`
--

LOCK TABLES `userrole` WRITE;
/*!40000 ALTER TABLE `userrole` DISABLE KEYS */;
INSERT INTO `userrole` VALUES (1,1,2,'2023-05-22 18:38:36',1),(2,2,3,'2023-05-22 18:38:36',1);
/*!40000 ALTER TABLE `userrole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warehouse`
--

DROP TABLE IF EXISTS `warehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warehouse` (
  `wareHouseId` int NOT NULL AUTO_INCREMENT,
  `branchName` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `warehouseName` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `warehouseAddress` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `status` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `createdUser` int NOT NULL,
  `updatedUser` int DEFAULT NULL,
  `updatedTime` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`wareHouseId`),
  KEY `createdUser` (`createdUser`),
  KEY `updatedUser` (`updatedUser`),
  CONSTRAINT `warehouse_ibfk_1` FOREIGN KEY (`createdUser`) REFERENCES `user` (`userId`),
  CONSTRAINT `warehouse_ibfk_2` FOREIGN KEY (`updatedUser`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouse`
--

LOCK TABLES `warehouse` WRITE;
/*!40000 ALTER TABLE `warehouse` DISABLE KEYS */;
INSERT INTO `warehouse` VALUES (1,'Thương hiệu 1','Kho 1','Quân 9',NULL,1,NULL,'2023-05-22 00:33:59','2023-05-22 00:33:59'),(2,'Thương hiệu 2','Kho 2','Quận 10','abc123',1,NULL,'2023-05-22 00:33:59','2023-05-22 00:33:59'),(3,'Thương hiệu 3','Kho 3','Quận Tân Phú',NULL,1,2,'2023-05-22 00:33:59','2023-05-22 00:33:59');
/*!40000 ALTER TABLE `warehouse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'hethonggaran'
--

--
-- Dumping routines for database 'hethonggaran'
--
/*!50003 DROP PROCEDURE IF EXISTS `getIngredientOfFood` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getIngredientOfFood`(in foodID int)
select hethonggaran.fooddetail.quantity, hethonggaran.ingredient.ingredientId, hethonggaran.ingredient.available 
	from hethonggaran.food 
		join hethonggaran.fooddetail on hethonggaran.fooddetail.foodId = hethonggaran.food.foodId 
		join hethonggaran.ingredient on hethonggaran.ingredient.ingredientId = hethonggaran.fooddetail.ingredientId 
			where hethonggaran.food.foodId = foodID ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getListOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getListOrder`(in keyword varchar(200), in page_offset int)
SELECT hethonggaran.order.* 
	FROM hethonggaran.order 
	join hethonggaran.customer on hethonggaran.customer.customerId = hethonggaran.order.customerId  
		where hethonggaran.order.orderId  = keyword or hethonggaran.order.customerId = keyword 
		or hethonggaran.customer.name like CONCAT('%', keyword, '%') 
        or hethonggaran.customer.phone like CONCAT('%', keyword, '%')
		or hethonggaran.customer.email like CONCAT('%', keyword, '%')
	order by orderTime DESC
	limit 10 OFFSET page_offset ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getListOrderRangeDate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getListOrderRangeDate`(in keyword varchar(200), in page_offset int, in fromDate date, in toDate date)
SELECT hethonggaran.order.*  
		FROM hethonggaran.order  
		join hethonggaran.customer on hethonggaran.customer.customerId = hethonggaran.order.customerId   
			where (hethonggaran.order.orderId  = keyword  
			or hethonggaran.order.customerId = keyword  
			or hethonggaran.customer.name like CONCAT('%', keyword, '%')  
			or hethonggaran.customer.phone like CONCAT('%', keyword, '%')  
			or hethonggaran.customer.email like CONCAT('%', keyword, '%') ) 
			and hethonggaran.order.orderTime >= fromDate and hethonggaran.order.orderTime <= toDate 
		order by hethonggaran.order.orderTime DESC 
	limit 10 OFFSET page_offset ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getTotalOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getTotalOrder`(in keyword varchar(200))
SELECT COUNT(*) AS total from ( 
		SELECT hethonggaran.order.*
		FROM hethonggaran.order
		JOIN hethonggaran.customer ON hethonggaran.customer.customerId = hethonggaran.order.customerId
			WHERE hethonggaran.order.orderId = keyword
			OR hethonggaran.order.customerId = keyword
			OR hethonggaran.customer.name LIKE CONCAT('%', keyword, '%')
			OR hethonggaran.customer.phone LIKE CONCAT('%', keyword, '%')
			OR hethonggaran.customer.email LIKE CONCAT('%', keyword, '%')
		ORDER BY orderTime DESC 
	) as listOrder ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getTotalOrderRangeDate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getTotalOrderRangeDate`(in keyword varchar(200), in fromDate date, in toDate date)
SELECT COUNT(*) AS total from ( 
		SELECT hethonggaran.order.* 
		FROM hethonggaran.order 
		JOIN hethonggaran.customer ON hethonggaran.customer.customerId = hethonggaran.order.customerId 
			WHERE (hethonggaran.order.orderId = keyword 
			OR hethonggaran.order.customerId = keyword
			OR hethonggaran.customer.name LIKE CONCAT('%', keyword, '%')
			OR hethonggaran.customer.phone LIKE CONCAT('%', keyword, '%')
			OR hethonggaran.customer.email LIKE CONCAT('%', keyword, '%') 
			) 
		and hethonggaran.order.orderTime >= fromDate and hethonggaran.order.orderTime <= toDate
		ORDER BY orderTime DESC 
    ) as listOrder ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_user_by_email` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_user_by_email`(in email varchar(50))
select * from hethonggaran.user where user.email = email ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_caculate_point` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_caculate_point`(
    IN customerId INT,
    IN orderId INT
)
BEGIN
	-- Khai báo các biến:
    -- Biến này để chứa giá trị hoá đơn.
    DECLARE totalMoneys DECIMAL(10, 2);
    -- Biến này để chứa điểm tích luỹ hiện tại.
    DECLARE currentPoint INT;
    -- Biến này để tính toán lại điểm tích luỹ.
    DECLARE newPoint INT;
    
    -- Lấy giá trị point hiện tại của khách hàng
    SELECT point INTO currentPoint
    FROM `customer` AS c
    WHERE c.customerId = customerId;
    
    -- Lấy giá trị totalMoney từ bảng orders kết hợp với bảng customer (Một hoá đơn của một khách hàng cụ thể)
    SELECT totalMoney INTO totalMoneys 
    FROM `order` AS o
    INNER JOIN `customer` AS c ON c.customerId = o.customerId
    WHERE c.customerId = customerId AND o.orderId = orderId;
    
    -- Tính toán giá trị mới của point
    SET newPoint = currentPoint + FLOOR(totalMoneys / 30000);
    
    -- Cập nhật giá trị point trong bảng customers
    UPDATE `customer` AS c
    SET point = newPoint
    WHERE c.customerId = customerId;
    
    -- Trả về giá trị mới của point
    SELECT newPoint AS customer_point;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_checkDuplicate_ProductPrice` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkDuplicate_ProductPrice`(in productId int)
SELECT pricelist.priceId,  pricelist.startDate, pricelist.enddate, productprice.productId
    FROM hethonggaran.pricelist
    join hethonggaran.productprice on pricelist.priceId = productprice.priceListId
    where startDate<= CURRENT_DATE() and enddate >= CURRENT_DATE()  and productprice.productId = productId ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_create_customer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_create_customer`(
	IN name NVARCHAR(50),
    IN phone NVARCHAR(50),
    IN email NVARCHAR(50),
    IN address NVARCHAR(50)
)
BEGIN
	
    DECLARE lastId INT;
    
    -- Tìm id cuối cùng trong bảng customer
    SELECT MAX(customerId) INTO lastId FROM customer;
    
    -- Nếu bảng rỗng, gán lastID = 0
    IF lastID IS NULL THEN
        SET lastId = 0;
    END IF;
    
    -- Tăng giá trị lastID lên 1
    SET lastId = lastId + 1;
	
	INSERT INTO customer (customerId, name, phone, email, address)
    VALUES (lastId, name, phone, email, address);
    
    SELECT * FROM customer WHERE customerId = lastId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_create_order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_create_order`(
	in ptotalMoney decimal(10,2), 
    in pcreatedUser int,
	in pcustomerID int, 
    in ppromoteID int, 
    in ppaymentMethodId int
)
begin
	insert into hethonggaran.order (customerId, totalMoney, createdUser, promoteId, paymentMethodId)
    values (pcustomerID, ptotalMoney, pcreatedUser, ppromoteID, ppaymentMethodId);
    
    
    select last_insert_id();
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_create_orderDetail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_create_orderDetail`( IN porderId int,  IN pfoodId int, IN pprice DECIMAL(10,2), IN pquantity int)
begin
	insert into orderdetail(orderId,foodId,price,quantity)
    values (porderId, pfoodId, pprice, pquantity);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_create_priceList` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_create_priceList`(in type varchar(20), in startDate DateTime, in endDate DateTime, in userId int)
begin
	insert into pricelist(type, startDate, enddate, createdUser)
    values(type, startDate, enddate, userId);
	select last_insert_id();
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_filter_order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_filter_order`(IN keyword varchar(200), IN fromdate DATE, IN todate DATE, IN page_offset INT)
SELECT * FROM hethonggaran.order
    WHERE orderTime >= fromdate 
		AND orderTime <= todate
		AND (orderId LIKE CONCAT('%', keyword, '%')
			OR totalMoney LIKE CONCAT('%', keyword, '%')
			OR createdUser LIKE CONCAT('%', keyword, '%') 
            OR customerId LIKE CONCAT('%', keyword, '%')
            OR promoteId LIKE CONCAT('%', keyword, '%')
            OR canceledUser LIKE CONCAT('%', keyword, '%')
            OR paymentMethodId LIKE CONCAT('%', keyword, '%')
            OR canceledTime LIKE CONCAT('%', keyword, '%'))
		LIMIT 10 OFFSET page_offset ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_all_paymentMethod` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_all_paymentMethod`()
SELECT * FROM hethonggaran.paymentmethod ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_all_promote` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_all_promote`()
SELECT * FROM hethonggaran.promotion ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_category_by_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_category_by_id`(in categoryId int)
select * from hethonggaran.category 
		where category.categoryId = categoryId ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_customer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_customer`(IN page INT)
SELECT customerId, name, phone, email, address, createdTime
    FROM customer
    ORDER BY createdTime DESC
    LIMIT page, 10 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_customer_by_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_customer_by_id`(in customerId int)
select * from hethonggaran.customer where customer.customerId = customerId ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_customer_list` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_customer_list`(
	IN customerId INT,
    IN name NVARCHAR(100),
    IN phone NVARCHAR(100),
    IN email NVARCHAR(100),
    IN page_limit INT,
    IN off_set INT
)
BEGIN

	DECLARE total_count INT;
    SELECT COUNT(*) INTO total_count FROM customer;
    
    SELECT c.* 
    FROM customer AS c 
    WHERE
		(c.customerId = customerId OR customerId IS NULL)
        AND (c.name LIKE CONCAT('%', name, '%') OR name IS NULL)
        AND (c.phone LIKE CONCAT('%', phone, '%') OR phone IS NULL)
        AND (c.email LIKE CONCAT('%', email, '%') OR email IS NULL)
	LIMIT page_limit OFFSET off_set;
    
    SELECT total_count AS total_customers;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_food` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_food`(IN page INT)
SELECT f.foodId, f.name, f.categoryId
    FROM food f
    ORDER BY f.categoryId
    LIMIT page, 10 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_foodStockHistory_by_foodId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_foodStockHistory_by_foodId`(in foodID int)
select * from hethonggaran.foodstockhistory where hethonggaran.foodstockhistory.foodId = foodID ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_food_by_foodID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_food_by_foodID`(in foodID int)
SELECT * FROM hethonggaran.food WHERE food.foodId = foodID ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_food_by_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_food_by_id`(in foodId int)
select f.foodId, f.name, fd.detailId, fd.ingredientId, fd.quantity
from food f
inner join fooddetail fd on f.foodId = fd.foodId
where f.foodId = foodId ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_food_list` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_food_list`(
    IN foodId INT,
    IN foodName NVARCHAR(100),
    IN categoryName NVARCHAR(100),
    IN categoryId INT,
    IN page_limit INT,
    IN off_set INT
)
BEGIN
	
    DECLARE total_count INT;
    SELECT COUNT(*) INTO total_count FROM food;

    SELECT f.*, c.categoryId, c.name AS categoryName, p.price
    FROM food AS f
    INNER JOIN category AS c ON c.categoryId = f.categoryId
    INNER JOIN productprice AS p ON p.productId = f.foodId
    WHERE
        (f.foodId = foodId OR foodId IS NULL)
        AND (f.name LIKE CONCAT('%', foodName, '%') OR foodName IS NULL)
        AND (c.name LIKE CONCAT('%', categoryName, '%') OR categoryName IS NULL)
        AND (c.categoryId = categoryId OR categoryId IS NULL)
    ORDER BY
        (SELECT COUNT(*) FROM orderdetail AS o WHERE o.foodId = f.foodId) DESC
    LIMIT page_limit OFFSET off_set;
    
    SELECT total_count AS total_foods;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_ingredientStockHistory_by_ingredientId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_ingredientStockHistory_by_ingredientId`(in ingredientID int)
SELECT * FROM hethonggaran.ingredientstockhistory WHERE ingredientstockhistory.ingredientId = ingredientID ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_ingredient_list` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_ingredient_list`(
	IN ingredientId INT,
    IN ingredientName NVARCHAR(100),
    IN wareHouseId INT,
    IN page_limit INT,
    IN off_set INT
)
BEGIN
    
    DECLARE total_count INT;
    
    -- Tính tổng số lượng ingredient
    SELECT COUNT(*) INTO total_count FROM ingredient;
    
    -- Lấy thông tin ingredient và số lượng tồn trên warehouse cụ thể
    IF ingredientId IS NOT NULL THEN
        IF wareHouseId IS NOT NULL THEN
            SELECT i.*, w.warehouseName, s.quantity
            FROM ingredient AS i
            LEFT JOIN ingredientstockhistory AS s ON s.ingredientId = i.ingredientId
            LEFT JOIN warehouse AS w ON w.wareHouseId = s.wareHouseId
            WHERE i.ingredientId = ingredientId AND w.wareHouseId = wareHouseId
                AND (i.name LIKE CONCAT('%', ingredientName, '%') OR ingredientName IS NULL)
            LIMIT page_limit OFFSET off_set;
        ELSE
            SELECT i.*, w.warehouseName, s.quantity
            FROM ingredient AS i
            LEFT JOIN ingredientstockhistory AS s ON s.ingredientId = i.ingredientId
            LEFT JOIN warehouse AS w ON w.wareHouseId = s.wareHouseId
            WHERE i.ingredientId = ingredientId
                AND (i.name LIKE CONCAT('%', ingredientName, '%') OR ingredientName IS NULL)
            LIMIT page_limit OFFSET off_set;
        END IF;
    ELSE
        -- Lấy thông tin tất cả các ingredient và số lượng tồn trên tất cả các warehouse
        IF wareHouseId IS NOT NULL THEN
            SELECT i.*, w.warehouseName, s.quantity
            FROM ingredient AS i
            LEFT JOIN ingredientstockhistory AS s ON s.ingredientId = i.ingredientId
            LEFT JOIN warehouse AS w ON w.wareHouseId = s.wareHouseId
            WHERE w.wareHouseId = wareHouseId
                AND (i.name LIKE CONCAT('%', ingredientName, '%') OR ingredientName IS NULL)
            LIMIT page_limit OFFSET off_set;
        ELSE
            SELECT i.*, w.warehouseName, s.quantity
            FROM ingredient AS i
            LEFT JOIN ingredientstockhistory AS s ON s.ingredientId = i.ingredientId
            LEFT JOIN warehouse AS w ON w.wareHouseId = s.wareHouseId
            WHERE i.name LIKE CONCAT('%', ingredientName, '%') OR ingredientName IS NULL
            LIMIT page_limit OFFSET off_set;
        END IF;
    END IF;
    
    SELECT total_count AS total_ingredients;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_list_order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_list_order`(IN page_offset INT)
SELECT * FROM hethonggaran.order 
    ORDER BY orderTime ASC 
    LIMIT 10 OFFSET page_offset ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_list_priceList` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_list_priceList`(in page int)
SELECT hethonggaran.pricelist.*,  hethonggaran.user.name as 'userNameCreated'
		FROM hethonggaran.pricelist
        join hethonggaran.user on pricelist.createdUser = user.userId
        order by pricelist.createdDate DESC
        limit 10 offset page ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_list_productPrice_by_productId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_list_productPrice_by_productId`(in productId int, in page int)
SELECT  productprice.id,  
         productprice.productId,  
         productprice.priceListId,  
         productprice.createdDate as 'productPriceCreatedDate', 
         productprice.createdUser as 'productPriceCreatedUser', 
         productprice.updatedDate as 'productPriceUpdatedDate', 
         productprice.updatedUser as 'productPriceUpdatedUser', 
            pricelist.type, 
            pricelist.startDate, 
            pricelist.enddate, 
            pricelist.createdDate as 'priceListCreatedDate', 
            pricelist.createdUser as 'priceListCreatedUser', 
            pricelist.updatedDate as 'priceListUpdatedDate', 
             pricelist.updatedUser as 'priceListUpdatedUser'   
         FROM hethonggaran.pricelist  
         join hethonggaran.productprice on pricelist.priceId = productprice.priceListId 
         where productprice.productId = productId 
         order by productprice.createdDate DESC 
         limit 10 offset page ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_list_promotion_can_use` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_list_promotion_can_use`(in ppoint int)
begin
	SELECT * FROM hethonggaran.promotion where available=1 and requirePoint<=ppoint;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_list_role_by_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_list_role_by_id`(in userId int)
select hethonggaran.role.roleId, hethonggaran.role.name from hethonggaran.user
    join hethonggaran.userrole on hethonggaran.user.userId = hethonggaran.userrole.userId
    join hethonggaran.role on hethonggaran.userrole.roleId = hethonggaran.role.roleId
    where hethonggaran.user.userId = userId ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_order`(in orderId int)
select * from hethonggaran.order where hethonggaran.order.orderId = orderId ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_order_by_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_order_by_id`(IN id INT)
SELECT orderdetail.*, food.* 
	FROM orderdetail 
	 JOIN food ON orderdetail.foodId = food.foodId 
		WHERE orderdetail.orderId = id ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_paymentMethod_by_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_paymentMethod_by_id`(in methodId int)
SELECT * FROM hethonggaran.paymentmethod WHERE paymentMethodId = methodId ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_priceList_by_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_priceList_by_id`(in priceID int)
SELECT * FROM hethonggaran.pricelist where pricelist.priceId = priceID ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_promote_by_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_promote_by_id`(in promoteID int)
SELECT * FROM hethonggaran.promotion WHERE hethonggaran.promotion.promoteId = promoteID ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_user`(IN username varchar(50))
SELECT user.* FROM user WHERE name = username ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_user_by_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_user_by_id`(in userId int)
SELECT * FROM hethonggaran.user WHERE user.userId = userId ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_order`(in totalMoney decimal(10,2), in createdUser int, in customerId int, in promoteId int, in paymentMethodId int)
INSERT INTO hethonggaran.order(totalMoney, createdUser, customerId,promoteId, paymentMethodId)
	VALUES(totalMoney, createdUser, customerId, promoteId, paymentMethodId) ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_productPrice` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_productPrice`(in productId int, in priceListId int, in price int, in createdUser int)
insert into productprice(productId, priceListId, price, createdUser)
    values (productId, priceListId, price, createdUser) ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_updatePoint_customer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_updatePoint_customer`(in point int, in customeID int)
update hethonggaran.customer set hethonggaran.customer.point = point 
    where hethonggaran.customer.customerId = customerID ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_status_order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_status_order`( IN porderId int,   IN pstatus VARCHAR(20),in pcanceledUser int)
begin
	if pstatus = 'Cancelled' then
		update hethonggaran.order
        set status = pstatus,
        canceledUser = pcanceledUser,
        canceledTime=CURDATE()
        where orderId = porderId;
    else
		update hethonggaran.order
        set status = pstatus
        where orderId = porderId;
    end if;
end ;;
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

-- Dump completed on 2023-06-15 23:03:18
