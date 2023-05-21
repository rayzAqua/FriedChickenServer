-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: htbanga
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
  `updatedTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdUser` int NOT NULL,
  `updatedUser` int NOT NULL,
  PRIMARY KEY (`categoryId`),
  KEY `createdUser` (`createdUser`),
  KEY `updatedUser` (`updatedUser`),
  CONSTRAINT `category_ibfk_1` FOREIGN KEY (`createdUser`) REFERENCES `user` (`userId`),
  CONSTRAINT `category_ibfk_2` FOREIGN KEY (`updatedUser`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
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
  `email` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `address` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `createdTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `point` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`customerId`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
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
  `updatedTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdUser` int NOT NULL,
  `updatedUser` int NOT NULL,
  `categoryId` int NOT NULL,
  PRIMARY KEY (`foodId`),
  KEY `categoryId` (`categoryId`),
  KEY `createdUser` (`createdUser`),
  KEY `updatedUser` (`updatedUser`),
  CONSTRAINT `food_ibfk_1` FOREIGN KEY (`categoryId`) REFERENCES `category` (`categoryId`),
  CONSTRAINT `food_ibfk_2` FOREIGN KEY (`createdUser`) REFERENCES `user` (`userId`),
  CONSTRAINT `food_ibfk_3` FOREIGN KEY (`updatedUser`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food`
--

LOCK TABLES `food` WRITE;
/*!40000 ALTER TABLE `food` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fooddetail`
--

LOCK TABLES `fooddetail` WRITE;
/*!40000 ALTER TABLE `fooddetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `fooddetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `foodstockhistory`
--

DROP TABLE IF EXISTS `foodstockhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `foodstockhistory` (
  `foodStockHistory` int NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `createdTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdUser` int NOT NULL,
  `foodId` int NOT NULL,
  `wareHouseId` int NOT NULL,
  PRIMARY KEY (`foodStockHistory`),
  KEY `createdUser` (`createdUser`),
  KEY `foodId` (`foodId`),
  KEY `wareHouseId` (`wareHouseId`),
  CONSTRAINT `foodstockhistory_ibfk_1` FOREIGN KEY (`createdUser`) REFERENCES `user` (`userId`),
  CONSTRAINT `foodstockhistory_ibfk_2` FOREIGN KEY (`foodId`) REFERENCES `food` (`foodId`),
  CONSTRAINT `foodstockhistory_ibfk_3` FOREIGN KEY (`wareHouseId`) REFERENCES `warehouse` (`wareHouseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foodstockhistory`
--

LOCK TABLES `foodstockhistory` WRITE;
/*!40000 ALTER TABLE `foodstockhistory` DISABLE KEYS */;
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
  PRIMARY KEY (`ingredientId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredient`
--

LOCK TABLES `ingredient` WRITE;
/*!40000 ALTER TABLE `ingredient` DISABLE KEYS */;
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
  CONSTRAINT `ingredientstockhistory_ibfk_1` FOREIGN KEY (`ingredientId`) REFERENCES `ingredient` (`ingredientId`),
  CONSTRAINT `ingredientstockhistory_ibfk_2` FOREIGN KEY (`ingredientStockHistory`) REFERENCES `user` (`userId`),
  CONSTRAINT `ingredientstockhistory_ibfk_3` FOREIGN KEY (`wareHouseId`) REFERENCES `warehouse` (`wareHouseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredientstockhistory`
--

LOCK TABLES `ingredientstockhistory` WRITE;
/*!40000 ALTER TABLE `ingredientstockhistory` DISABLE KEYS */;
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
  `promoteId` int NOT NULL,
  `canceledUser` int DEFAULT NULL,
  `canceledTime` datetime DEFAULT NULL,
  PRIMARY KEY (`orderId`),
  KEY `customerId` (`customerId`),
  KEY `createdUser` (`createdUser`),
  KEY `promoteId` (`promoteId`),
  KEY `canceledUser` (`canceledUser`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`customerId`) REFERENCES `customer` (`customerId`),
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`createdUser`) REFERENCES `user` (`userId`),
  CONSTRAINT `order_ibfk_3` FOREIGN KEY (`promoteId`) REFERENCES `promotion` (`promoteId`),
  CONSTRAINT `order_ibfk_4` FOREIGN KEY (`canceledUser`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetail`
--

LOCK TABLES `orderdetail` WRITE;
/*!40000 ALTER TABLE `orderdetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderdetail` ENABLE KEYS */;
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
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdUser` int NOT NULL,
  `updatedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updatedUser` int NOT NULL,
  PRIMARY KEY (`priceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pricelist`
--

LOCK TABLES `pricelist` WRITE;
/*!40000 ALTER TABLE `pricelist` DISABLE KEYS */;
/*!40000 ALTER TABLE `pricelist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productprice`
--

DROP TABLE IF EXISTS `productprice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productprice` (
  `productId` int NOT NULL,
  `priceListId` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdUser` int NOT NULL,
  `updatedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updatedUser` int NOT NULL,
  KEY `productId` (`productId`),
  KEY `priceListId` (`priceListId`),
  CONSTRAINT `productprice_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `food` (`foodId`),
  CONSTRAINT `productprice_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `ingredient` (`ingredientId`),
  CONSTRAINT `productprice_ibfk_3` FOREIGN KEY (`priceListId`) REFERENCES `pricelist` (`priceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productprice`
--

LOCK TABLES `productprice` WRITE;
/*!40000 ALTER TABLE `productprice` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotion`
--

LOCK TABLES `promotion` WRITE;
/*!40000 ALTER TABLE `promotion` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
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
  `createdDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `createdUser` int NOT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userrole`
--

DROP TABLE IF EXISTS `userrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userrole` (
  `roleId` int NOT NULL,
  `userId` int NOT NULL,
  `createdTime` datetime NOT NULL,
  `createdUser` int NOT NULL,
  KEY `roleId` (`roleId`),
  KEY `userId` (`userId`),
  CONSTRAINT `userrole_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `role` (`roleId`),
  CONSTRAINT `userrole_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userrole`
--

LOCK TABLES `userrole` WRITE;
/*!40000 ALTER TABLE `userrole` DISABLE KEYS */;
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
  `updatedUser` int NOT NULL,
  `updatedTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`wareHouseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouse`
--

LOCK TABLES `warehouse` WRITE;
/*!40000 ALTER TABLE `warehouse` DISABLE KEYS */;
/*!40000 ALTER TABLE `warehouse` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-19 19:30:08
