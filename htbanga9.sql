-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: containers-us-west-14.hethonggaran.app    Database: hethonggaran
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
  `createdTime` datetime NOT NULL DEFAULT ((now() + interval 7 hour)),
  `updatedTime` datetime DEFAULT NULL,
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
INSERT INTO `category` VALUES (1,'Gà Rán','2023-05-22 00:30:28','2023-05-22 00:30:28',1,NULL),(2,'Đồ ăn kèm','2023-05-22 00:30:28','2023-05-22 00:30:28',1,NULL),(3,'Đồ Uống ','2023-05-22 00:30:28','2023-05-22 00:30:28',2,NULL),(4,'Cơm & Mỳ','2023-05-22 00:30:28',NULL,2,NULL),(5,'Burger','2023-05-22 00:30:28',NULL,1,NULL),(6,'Combo','2023-05-22 00:30:28',NULL,1,NULL);
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
  `createdTime` datetime DEFAULT ((now() + interval 7 hour)),
  `point` int DEFAULT '0',
  `updatedUser` int DEFAULT NULL,
  `updatedTime` datetime DEFAULT NULL,
  PRIMARY KEY (`customerId`),
  UNIQUE KEY `phone_UNIQUE` (`phone`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `createdUser` (`createdUser`),
  KEY `updatedUser` (`updatedUser`),
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`createdUser`) REFERENCES `user` (`userId`),
  CONSTRAINT `customer_ibfk_2` FOREIGN KEY (`updatedUser`) REFERENCES `user` (`userId`),
  CONSTRAINT `point_chk_1` CHECK ((`point` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'test update','0973232794','kh1@gmail.com','quan 9',1,'2023-05-22 00:18:18',233,6,'2023-06-24 17:01:30'),(2,'hung','0123434221','hungbuituan1@gmail.com','quan tan binh',3,'2023-05-25 00:18:18',802,NULL,NULL),(3,'Quintessa Hines','0123213823','qh@gmail.com',NULL,2,'2023-05-17 00:18:18',123,NULL,NULL),(4,'Mc Donald','0141727431','mcdonald@gmail.com',NULL,2,'2023-06-16 22:46:16',233,NULL,NULL),(5,'Shelby Gamble','06418105343','amet.ultricies@hotmail.com','Ap #296-3456 Euismod St.',2,'2023-06-18 11:25:48',133,NULL,NULL),(6,'Lacota Osborne','07856186840','id@aol.com','424-7994 Vestibulum, Street',2,'2023-06-18 11:25:48',127,NULL,NULL),(7,'Britanney Cooke','05708523442','tellus.non@yahoo.edu','344-6270 Vitae Av.',2,'2023-06-18 11:25:48',239,NULL,NULL),(8,'Jada Melendez','04435996027','arcu.eu@hotmail.com','996-491 Quisque Avenue',1,'2023-06-18 11:25:48',381,NULL,NULL),(9,'Tom Harrison','0917585858','tellusidnu@gmail.com','Ap #381-2362 Mauris. Rd.',1,'2023-06-18 11:25:48',452,2,'2023-06-20 15:56:11'),(10,'Quintessa Hines','0917585857','vitaposuere@gmail.com','P.O. Box 844, 2011 Montes, Ave',3,'2023-06-18 11:26:28',117,2,'2023-06-24 17:07:56'),(11,'Kuame King','07755743670','augue.sed.molestie@google.couk','Ap #204-246 Nec St.',2,'2023-06-18 11:26:28',141,NULL,NULL),(12,'Nguyễn Văn A','0123456789','nguyenvana@gmail.com','Hồ Chí Minh ',2,'2023-06-18 20:12:07',289,NULL,NULL);
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
  `available` tinyint NOT NULL DEFAULT '1',
  `unit` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `createdTime` datetime NOT NULL DEFAULT ((now() + interval 7 hour)),
  `updatedTime` datetime DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food`
--

LOCK TABLES `food` WRITE;
/*!40000 ALTER TABLE `food` DISABLE KEYS */;
INSERT INTO `food` VALUES (1,'Combo A',1,'Phần','2023-05-22 00:39:13','2023-06-24 19:46:37',1,2,6,'https://i.ibb.co/f0vL6vk/combo1.png'),(2,'Đùi Gà Rán',1,'Chiếc','2023-05-22 00:39:13','2023-06-22 20:51:50',1,2,1,'https://cdn.lotteria.vn/media/catalog/product/cache/584039753b87a8d227764e04fc461e3e/l/c/lc0001.png'),(3,'Đùi Gà Cháy Tỏi',1,'Chiếc','2023-05-22 00:39:13','2023-06-22 20:52:23',2,2,1,'https://cdn.lotteria.vn/media/catalog/product/cache/584039753b87a8d227764e04fc461e3e/l/c/lc0002.png'),(4,'Khoai Tây Chiên',1,'Phần','2023-05-24 01:50:44',NULL,1,NULL,2,'https://cdn.lotteria.vn/media/catalog/product/cache/584039753b87a8d227764e04fc461e3e/l/s/ls0002.png'),(5,'Phô mai que',1,'Phần','2023-05-22 00:39:13','2023-06-24 16:24:43',1,2,2,'https://cdn.lotteria.vn/media/catalog/product/cache/584039753b87a8d227764e04fc461e3e/l/s/ls0003.png'),(6,'Bánh táo',1,'Phần','2023-05-22 00:39:13','2023-06-24 19:50:20',1,2,2,'https://cdn.lotteria.vn/media/catalog/product/cache/584039753b87a8d227764e04fc461e3e/l/s/ls0007.png'),(7,'Nước Ngọt',1,'Ly','2023-05-22 00:39:13','2023-05-22 00:39:13',2,2,3,'https://cdn.lotteria.vn/media/catalog/product/cache/584039753b87a8d227764e04fc461e3e/l/d/ld0004.png'),(8,'Burger gà',1,'Phần','2023-05-24 01:50:44','2023-06-22 20:54:11',1,2,5,'https://cdn.lotteria.vn/media/catalog/product/cache/584039753b87a8d227764e04fc461e3e/b/u/burger_l-chicken_burger.png'),(9,'Burger bò',1,'Phần','2023-06-19 20:19:45','2023-06-22 20:52:50',2,2,5,'https://cdn.lotteria.vn/media/catalog/product/cache/584039753b87a8d227764e04fc461e3e/l/b/lb0046-online.png'),(10,'Burger tôm',1,'Phần','2023-06-19 20:21:24','2023-06-22 20:54:20',2,2,5,'https://cdn.lotteria.vn/media/catalog/product/cache/584039753b87a8d227764e04fc461e3e/l/b/lb0007-online.png'),(11,'Pepsi',1,'Ly','2023-06-19 21:32:01','2023-06-24 19:49:26',2,2,3,'https://cdn.lotteria.vn/media/catalog/product/cache/584039753b87a8d227764e04fc461e3e/z/e/zero_1.jpg'),(12,'Trà chanh',1,'Ly','2023-06-19 21:49:04','2023-06-22 20:55:02',2,2,3,'https://cdn.lotteria.vn/media/catalog/product/cache/584039753b87a8d227764e04fc461e3e/l/d/ld0089.png'),(13,'Spagetty',1,'Phần','2023-06-19 21:49:04',NULL,1,NULL,4,'https://cdn.lotteria.vn/media/catalog/product/cache/584039753b87a8d227764e04fc461e3e/2/2/224207.png'),(14,'Cơm gà Teri',1,'Phần','2023-06-19 21:49:04',NULL,1,NULL,4,'https://cdn.lotteria.vn/media/catalog/product/cache/584039753b87a8d227764e04fc461e3e/r/i/rice_teri_2_.png');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fooddetail`
--

LOCK TABLES `fooddetail` WRITE;
/*!40000 ALTER TABLE `fooddetail` DISABLE KEYS */;
INSERT INTO `fooddetail` VALUES (1,1,1,10),(2,3,2,3),(3,2,2,5),(4,4,2,5),(5,5,3,10),(6,6,4,3),(7,7,3,5),(8,8,3,5);
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
  `createdTime` datetime NOT NULL DEFAULT ((now() + interval 7 hour)),
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
  `unit` varchar(10) NOT NULL,
  `available` tinyint NOT NULL DEFAULT '1',
  `image` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `createdTime` datetime DEFAULT ((now() + interval 7 hour)),
  `updatedTime` datetime DEFAULT NULL,
  `createdUser` int DEFAULT NULL,
  `updatedUser` int DEFAULT NULL,
  PRIMARY KEY (`ingredientId`),
  KEY `createdUser` (`createdUser`),
  KEY `updatedUser` (`updatedUser`),
  CONSTRAINT `ingredient_ibfk_1` FOREIGN KEY (`createdUser`) REFERENCES `user` (`userId`),
  CONSTRAINT `ingredient_ibfk_2` FOREIGN KEY (`updatedUser`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredient`
--

LOCK TABLES `ingredient` WRITE;
/*!40000 ALTER TABLE `ingredient` DISABLE KEYS */;
INSERT INTO `ingredient` VALUES (1,'Bột tỏi','thùng',1,'https://unispice.vn/wp-content/uploads/2020/12/bot-toi-tui-500g.png','2023-05-22 22:09:45','2023-05-22 22:09:45',1,2),(2,'Trứng gà','tá',1,'https://product.hstatic.net/200000442849/product/trung-ga-nuong-tafa-9_091c64fb4e7046189603377d2342ae0e.jpg','2023-05-22 22:09:45','2023-05-22 22:09:45',2,2),(3,'Mật ong','chai',0,'https://i.pinimg.com/736x/9a/ef/8d/9aef8d80a1f795ea5a710bd00a402df3.jpg','2023-05-22 22:09:45','2023-05-22 22:09:45',3,1),(4,'Bột ớt Hàn Quốc','thùng',1,'https://cf.shopee.vn/file/91804939a4791e8483ccf763e4dfb6bd','2023-06-19 22:38:57',NULL,2,NULL),(5,'Tương ớt','thùng',1,'https://th.bing.com/th/id/OIP.7msmX_cMvsa5RKGaUZbxaQHaHa?pid=ImgDet&rs=1','2023-06-19 22:39:24',NULL,2,2),(6,'Tương cà','thùng',1,'https://thucphamtantai.com/wp-content/uploads/2019/10/tuong-ca-2lit-600x780.jpg','2023-06-19 22:39:39',NULL,2,6),(7,'Muối','kg',1,'https://muoisachhanhhue.com.vn/uploads/products/4/muoi-sach-004-ghx.jpg','2023-06-20 02:53:04',NULL,2,2),(8,'Tiêu đen','thùng',1,'https://th.bing.com/th/id/OIP.susUhP_yxUM0ta-2cYB3YAHaHa?pid=ImgDet&rs=1','2023-06-20 14:37:36',NULL,2,NULL),(9,'Đường','kg',1,'https://emartmall.com.vn/image/cache/catalog/products/8935053900118/8935053900118-2-600x600.jpg','2023-06-20 23:37:20',NULL,2,2),(10,'Thịt bò băm','kg',1,'https://th.bing.com/th/id/OIP.croVlyRVdwgGRJPeTgJEcAHaFj?w=216&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7','2023-06-24 19:01:32',NULL,2,NULL),(11,'Khoai tây','kg',1,'https://th.bing.com/th/id/OIP.Dvlw9rfDr7pm9QnF6w26iwHaE0?w=275&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7','2023-06-24 19:02:42',NULL,2,NULL),(12,'Gạo','kg',1,'https://thtmart.com.vn/wp-content/uploads/2021/05/Gao-thom-thuong-hang-Neptune-tui-5kg.jpg','2023-06-24 19:02:59',NULL,2,NULL),(13,'Hành tây','kg',1,'https://th.bing.com/th/id/OIP.DTb3zkgInMk2MzKnTg6k0gHaGz?pid=ImgDet&w=600&h=551&rs=1','2023-06-24 19:03:15',NULL,2,NULL),(14,'Cánh gà','kg',1,'https://th.bing.com/th/id/OIP.PaxZDHcN02q40r0PHweDkQHaFr?w=244&h=187&c=7&r=0&o=5&dpr=1.3&pid=1.7','2023-06-24 19:03:28',NULL,2,NULL),(15,'Cà chua','kg',1,'https://th.bing.com/th/id/R.a5a0feee37e3c8f0ab28d0c07b0218c7?rik=%2fwRBJtCa5oXmiQ&pid=ImgRaw&r=0','2023-06-24 19:03:36',NULL,2,NULL),(16,'Phô mai','kg',1,'https://dungculambanh.com.vn/wp-content/uploads/2018/12/pho-mai-mozzarela-anchor.jpg','2023-06-24 19:04:38',NULL,2,NULL),(17,'Đá viên','kg',1,'https://foodsafetyhelpline.com/wp-content/uploads/2014/09/Ice-made-of-potable-water-300x206.jpg','2023-06-24 19:04:51',NULL,2,NULL),(18,'Đùi gà','kg',1,'https://cdn.shopify.com/s/files/1/0277/2818/3436/products/602967374_600x.jpg?v=1584846673','2023-06-24 19:06:51',NULL,2,NULL);
/*!40000 ALTER TABLE `ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredientstockhistory`
--

DROP TABLE IF EXISTS `ingredientstockhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredientstockhistory` (
  `ingredientStockHistoryId` int NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `price` int DEFAULT NULL,
  `createdTime` datetime NOT NULL DEFAULT ((now() + interval 7 hour)),
  `createdUser` int NOT NULL,
  `wareHouseId` int NOT NULL,
  `ingredientId` int NOT NULL,
  PRIMARY KEY (`ingredientStockHistoryId`),
  KEY `ingredientId` (`ingredientId`),
  KEY `wareHouseId` (`wareHouseId`),
  KEY `createdUser` (`createdUser`),
  CONSTRAINT `ingredientstockhistory_ibfk_1` FOREIGN KEY (`ingredientId`) REFERENCES `ingredient` (`ingredientId`),
  CONSTRAINT `ingredientstockhistory_ibfk_3` FOREIGN KEY (`wareHouseId`) REFERENCES `warehouse` (`wareHouseId`),
  CONSTRAINT `ingredientstockhistory_ibfk_4` FOREIGN KEY (`createdUser`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredientstockhistory`
--

LOCK TABLES `ingredientstockhistory` WRITE;
/*!40000 ALTER TABLE `ingredientstockhistory` DISABLE KEYS */;
INSERT INTO `ingredientstockhistory` VALUES (1,10,NULL,'2023-05-22 00:36:54',1,1,1),(2,21,NULL,'2023-05-22 00:36:54',2,2,2),(3,-1,1,'2023-06-20 22:02:16',2,1,1),(4,-1,1,'2023-06-20 22:03:24',2,1,1),(5,-1,1,'2023-06-20 22:04:03',2,1,1),(6,-1,1,'2023-06-20 22:05:13',2,1,1),(7,-1,1,'2023-06-20 22:05:40',2,1,1),(8,-1,1,'2023-06-20 22:06:06',2,1,1),(9,-1,1,'2023-06-20 22:06:30',2,1,1),(10,100,300,'2023-06-20 23:40:19',2,1,1),(11,100,300,'2023-06-21 21:54:42',2,2,1),(13,100,300,'2023-06-21 22:22:16',2,2,1),(14,-100,300,'2023-06-21 23:07:08',2,2,1),(15,-100,300,'2023-06-21 23:07:12',2,2,1),(16,100,75000,'2023-06-22 21:45:35',2,1,1),(17,-100,-1,'2023-06-22 21:47:53',2,1,1),(18,100,150000,'2023-06-24 15:39:47',2,2,1),(19,99,150000,'2023-06-24 15:40:18',2,2,1),(20,-199,-1,'2023-06-24 15:40:43',2,2,1);
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
  `orderTime` datetime NOT NULL DEFAULT ((now() + interval 7 hour)),
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
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,'2023-05-22 00:30:13',100000.00,1,1,NULL,2,1,'2023-06-18 00:00:00','Pending'),(2,'2023-05-22 00:28:12',200000.00,2,2,1,1,2,'2023-05-22 00:18:18','Completed'),(3,'2023-05-22 22:03:19',150000.00,2,3,NULL,3,1,'2023-06-22 13:53:51','Cancelled'),(4,'2023-05-22 22:05:11',150000.00,2,3,NULL,NULL,1,NULL,'Completed'),(5,'2023-05-22 22:06:43',150000.00,2,3,1,2,1,'2023-06-18 00:00:00','Cancelled'),(6,'2023-06-15 04:52:27',101000.00,2,1,NULL,NULL,1,NULL,'Completed'),(7,'2023-06-15 04:52:56',101000.00,2,1,NULL,NULL,1,NULL,'Completed'),(8,'2023-06-15 05:58:41',101000.00,2,1,NULL,NULL,1,NULL,'Completed'),(9,'2023-06-15 05:59:56',101000.00,2,1,NULL,NULL,1,NULL,'Completed'),(10,'2023-06-15 06:00:05',101000.00,2,1,NULL,NULL,1,NULL,'Completed'),(12,'2023-06-15 21:34:22',101000.00,2,1,NULL,NULL,1,NULL,'Completed'),(13,'2023-06-15 21:36:30',101000.00,2,1,NULL,NULL,1,NULL,'Completed'),(14,'2023-06-15 21:46:31',101000.00,2,1,NULL,NULL,1,NULL,'Completed'),(15,'2023-06-15 21:49:21',101000.00,2,1,NULL,NULL,1,NULL,'Completed'),(16,'2023-06-15 21:50:41',101000.00,2,1,NULL,NULL,1,NULL,'Pending'),(17,'2023-06-15 21:51:15',101000.00,2,1,NULL,NULL,1,NULL,'Completed'),(18,'2023-06-15 21:53:18',101000.00,2,1,NULL,NULL,1,NULL,'Pending'),(19,'2023-06-15 21:54:21',100900.00,2,1,1,NULL,1,NULL,'Completed'),(25,'2023-06-17 13:16:56',32000.00,2,3,2,NULL,1,NULL,'Pending'),(26,'2023-06-18 19:26:18',100900.00,2,1,1,NULL,1,NULL,'Completed'),(27,'2023-06-18 21:07:01',48000.00,2,2,2,NULL,1,NULL,'Completed'),(28,'2023-06-20 22:58:36',50000.00,2,4,NULL,2,1,'2023-06-21 00:00:00','Cancelled'),(29,'2023-06-20 23:16:04',110000.00,2,3,NULL,2,1,'2023-06-21 00:00:00','Completed'),(30,'2023-06-24 08:15:59',135000.00,3,1,4,6,1,'2023-06-24 20:26:01','Cancelled'),(31,'2023-06-24 04:10:51',135000.00,2,2,1,NULL,1,NULL,'Completed'),(32,'2023-06-24 04:10:51',135000.00,2,3,1,NULL,1,NULL,'Completed'),(33,'2023-06-24 04:10:51',216000.00,2,1,1,NULL,2,NULL,'Completed'),(34,'2023-06-24 04:10:51',315000.00,2,2,1,NULL,3,NULL,'Completed'),(35,'2023-06-24 04:10:51',450000.00,2,3,1,NULL,3,NULL,'Completed'),(36,'2023-06-24 04:10:51',81000.00,2,3,1,NULL,2,NULL,'Completed'),(37,'2023-06-24 04:10:51',396000.00,2,4,1,NULL,1,NULL,'Completed'),(38,'2023-06-25 04:33:44',350000.00,2,2,NULL,NULL,1,NULL,'Completed');
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
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetail`
--

LOCK TABLES `orderdetail` WRITE;
/*!40000 ALTER TABLE `orderdetail` DISABLE KEYS */;
INSERT INTO `orderdetail` VALUES (1,1,1,70000.00,1),(2,1,3,30000.00,1),(3,2,1,70000.00,2),(4,2,3,30000.00,2),(5,4,3,30000.00,5),(6,5,3,30000.00,5),(7,5,2,30000.00,2),(8,5,2,30000.00,2),(9,5,2,30000.00,2),(10,15,1,101000.00,1),(11,16,1,101000.00,1),(12,17,1,101000.00,1),(13,18,1,101000.00,1),(14,19,1,101000.00,1),(22,25,2,20000.00,2),(23,26,1,101000.00,1),(24,27,2,60000.00,1),(25,28,1,50000.00,1),(26,29,1,50000.00,1),(27,29,11,60000.00,1),(28,30,3,150000.00,1),(29,31,3,150000.00,1),(30,32,2,90000.00,1),(31,32,11,60000.00,1),(32,33,3,150000.00,1),(33,33,2,90000.00,1),(34,34,1,350000.00,1),(35,35,1,350000.00,1),(36,35,3,150000.00,1),(37,36,2,90000.00,1),(38,37,1,350000.00,1),(39,37,2,90000.00,1),(40,38,1,350000.00,1);
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
  `createdTime` datetime DEFAULT ((now() + interval 7 hour)),
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
  `endDate` datetime NOT NULL,
  `createdDate` datetime DEFAULT ((now() + interval 7 hour)),
  `createdUser` int NOT NULL,
  `updatedDate` datetime DEFAULT NULL,
  `updatedUser` int DEFAULT NULL,
  PRIMARY KEY (`priceId`),
  KEY `updatedUser` (`updatedUser`),
  KEY `createdUser` (`createdUser`),
  CONSTRAINT `pricelist_ibfk_1` FOREIGN KEY (`updatedUser`) REFERENCES `user` (`userId`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `pricelist_ibfk_2` FOREIGN KEY (`createdUser`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pricelist`
--

LOCK TABLES `pricelist` WRITE;
/*!40000 ALTER TABLE `pricelist` DISABLE KEYS */;
INSERT INTO `pricelist` VALUES (1,'SALE','2023-03-22 00:40:57','2023-04-22 00:40:57','2023-05-22 00:47:29',1,'2023-06-15 22:46:50',NULL),(2,'SALE','2023-05-22 00:40:57','2023-07-22 00:40:57','2023-05-22 00:48:01',1,'2023-06-15 22:46:50',NULL),(3,'SALE','2023-07-23 00:40:57','2023-07-26 00:40:57','2023-05-22 00:48:01',2,'2023-06-15 22:46:50',NULL);
/*!40000 ALTER TABLE `pricelist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productprice`
--

DROP TABLE IF EXISTS `productprice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productprice` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `productId` int NOT NULL,
  `priceListId` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `createdDate` datetime DEFAULT ((now() + interval 7 hour)),
  `createdUser` int DEFAULT NULL,
  `updatedDate` datetime DEFAULT NULL,
  `updatedUser` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `productId` (`productId`),
  KEY `priceListId` (`priceListId`),
  KEY `createdUser` (`createdUser`),
  KEY `updatedUser` (`updatedUser`),
  CONSTRAINT `productprice_ibfk_3` FOREIGN KEY (`priceListId`) REFERENCES `pricelist` (`priceId`),
  CONSTRAINT `productprice_ibfk_6` FOREIGN KEY (`createdUser`) REFERENCES `user` (`userId`),
  CONSTRAINT `productprice_ibfk_7` FOREIGN KEY (`updatedUser`) REFERENCES `user` (`userId`),
  CONSTRAINT `productprice_ibfk_8` FOREIGN KEY (`productId`) REFERENCES `food` (`foodId`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productprice`
--

LOCK TABLES `productprice` WRITE;
/*!40000 ALTER TABLE `productprice` DISABLE KEYS */;
INSERT INTO `productprice` VALUES (1,1,1,350000.00,'2023-05-22 18:42:51',1,'2023-06-22 15:37:46',2),(2,2,1,35000.00,'2023-05-22 18:42:51',1,'2023-06-24 12:49:09',2),(3,3,1,35000.00,'2023-05-22 18:42:51',1,'2023-06-24 12:48:56',2),(4,4,1,30000.00,'2023-05-22 18:42:51',1,'2023-06-24 12:49:43',2),(5,5,1,26000.00,'2023-05-22 18:42:51',1,'2023-06-24 12:49:57',2),(6,6,1,40000.00,'2023-05-22 18:42:51',1,'2023-06-24 12:50:19',2),(7,7,1,10000.00,'2023-05-22 18:42:51',1,'2023-05-22 18:42:51',2),(8,8,1,40000.00,'2023-05-22 18:42:51',1,'2023-05-22 18:42:51',2),(10,9,2,35000.00,'2023-06-19 20:19:45',2,NULL,NULL),(11,10,2,25000.00,'2023-06-19 20:21:24',2,NULL,NULL),(12,11,3,60000.00,'2023-06-19 21:32:01',2,NULL,NULL),(13,12,2,155000.00,'2023-06-19 21:49:04',2,NULL,NULL),(14,2,2,90000.00,'2023-06-21 21:52:18',2,NULL,NULL),(15,3,2,150000.00,'2023-06-22 20:52:21',2,'2023-06-22 15:38:31',2),(16,4,1,30000.00,'2023-06-22 20:53:09',2,'2023-06-24 12:49:43',2),(17,4,2,15000.00,'2023-06-22 20:53:14',2,NULL,NULL),(18,5,2,10000.00,'2023-06-22 20:53:24',2,NULL,NULL),(19,6,2,7000.00,'2023-06-22 20:53:35',2,NULL,NULL),(20,7,2,25000.00,'2023-06-22 20:53:51',2,NULL,NULL),(21,8,2,20000.00,'2023-06-22 20:54:04',2,NULL,NULL),(22,1,2,350000.00,'2023-06-22 22:00:51',3,'2023-06-22 15:37:54',2),(23,11,1,18000.00,'2023-06-24 19:49:31',2,NULL,NULL);
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
  `dateCreated` datetime NOT NULL DEFAULT ((now() + interval 7 hour)),
  `available` tinyint NOT NULL DEFAULT '1',
  `discount` int NOT NULL,
  `requirePoint` int NOT NULL,
  `createdUser` int NOT NULL,
  PRIMARY KEY (`promoteId`),
  KEY `createdUser` (`createdUser`),
  CONSTRAINT `promotion_ibfk_1` FOREIGN KEY (`createdUser`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotion`
--

LOCK TABLES `promotion` WRITE;
/*!40000 ALTER TABLE `promotion` DISABLE KEYS */;
INSERT INTO `promotion` VALUES (1,'Khuyến mãi 10%','2023-05-22 00:27:06',1,10,100,1),(2,'Khuyến mãi 20%','2023-05-22 00:27:06',1,20,150,1),(3,'Khuyến mãi 50%','2023-05-22 00:27:06',0,50,400,1),(4,'Khuyến mãi cuối tuần!','2023-06-19 21:28:44',1,10,100,2);
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
  `createdDate` datetime NOT NULL DEFAULT ((now() + interval 7 hour)),
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
  `createdDate` datetime DEFAULT ((now() + interval 7 hour)),
  `createdUser` int NOT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'kiet','tuankiet1@gmail.com','0123456788','','$2b$10$MQVluybtImsi00.Ez8rW4OpYDkVsgNq7nhvAGriWad4oiPFmQPnoG','active','2023-05-22 00:09:47',1),(2,'Tuấn Hùng','tuanhung@gmail.com','0973343999','https://i.ibb.co/84nfzHH/avt.jpg','$2b$10$MQVluybtImsi00.Ez8rW4OpYDkVsgNq7nhvAGriWad4oiPFmQPnoG','active','2023-05-22 00:11:18',1),(3,'hieu','pvh9201@gmail.com','0123132332',NULL,'$2b$10$MQVluybtImsi00.Ez8rW4OpYDkVsgNq7nhvAGriWad4oiPFmQPnoG','active','2023-05-22 00:11:18',2),(4,'Nguyễn Văn Admin','nguyenA@gmail.com','0974346345',NULL,'$2b$10$hOC/yRtoDiLBKRA72aTI1OpWuWoFzdCaeJKecljW.kzN1IFx3yxhi','1','2023-06-20 18:22:42',2),(5,'Nguyễn Betagen','betagen@gmail.com','0974346345',NULL,'$2b$10$v1wknOjXlmdDJUM1ro5ileEO/takt1/F8eppGIGwFrQHBxnf0nYTG',NULL,'2023-06-21 18:05:19',2),(6,'Dio Brando','theworld@gmail.com','0974346445',NULL,'$2b$10$MQVluybtImsi00.Ez8rW4OpYDkVsgNq7nhvAGriWad4oiPFmQPnoG','active','2023-06-21 19:00:32',2),(7,'nhan vien a','nva@gmail.com','0973343547',NULL,'$2b$10$pYG5MTsf/dIWKUBlE06dfevffV1TKImdUiyVhRW/ff4/kRhm5QJ2W','inactive','2023-06-21 22:11:39',2),(8,'nhan vien 1','nva1@gmail.com','0973343541',NULL,'$2b$10$MQVluybtImsi00.Ez8rW4OpYDkVsgNq7nhvAGriWad4oiPFmQPnoG','active','2023-06-22 19:52:43',2);
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
  `createdTime` datetime DEFAULT ((now() + interval 7 hour)),
  `createdUser` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `roleId` (`roleId`),
  KEY `userId` (`userId`),
  CONSTRAINT `userrole_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `role` (`roleId`),
  CONSTRAINT `userrole_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userrole`
--

LOCK TABLES `userrole` WRITE;
/*!40000 ALTER TABLE `userrole` DISABLE KEYS */;
INSERT INTO `userrole` VALUES (14,1,6,'2023-06-24 17:03:41',6),(15,1,2,'2023-06-24 17:03:41',6);
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
  `updatedTime` datetime DEFAULT NULL,
  `createdTime` datetime NOT NULL DEFAULT ((now() + interval 7 hour)),
  PRIMARY KEY (`wareHouseId`),
  KEY `createdUser` (`createdUser`),
  KEY `updatedUser` (`updatedUser`),
  CONSTRAINT `warehouse_ibfk_1` FOREIGN KEY (`createdUser`) REFERENCES `user` (`userId`),
  CONSTRAINT `warehouse_ibfk_2` FOREIGN KEY (`updatedUser`) REFERENCES `user` (`userId`),
  CONSTRAINT `stt_chk_1` CHECK ((`status` in (_utf8mb4'Active',_utf8mb4'Inactive',_utf8mb4'Under maintenance',_utf8mb4'Full',_utf8mb4'Empty')))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouse`
--

LOCK TABLES `warehouse` WRITE;
/*!40000 ALTER TABLE `warehouse` DISABLE KEYS */;
INSERT INTO `warehouse` VALUES (1,'Thương hiệu 1','Kho 1','Quân 9','Active',1,NULL,'2023-05-22 00:33:59','2023-05-22 00:33:59'),(2,'Thương hiệu 2','Kho 2','Quận 10','Active',1,NULL,'2023-05-22 00:33:59','2023-05-22 00:33:59'),(3,'Thương hiệu 3','Kho 3','Quận Tân Phú','Active',1,2,'2023-05-22 00:33:59','2023-05-22 00:33:59');
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `getListOrderRangeDate`(in keyword varchar(200), in page_offset int, in fromDate datetime, in toDate datetime)
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
/*!50003 DROP PROCEDURE IF EXISTS `sp_add_history_ingredient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_add_history_ingredient`(IN pquantity int, in pprice int, in pcreatedUser int, in pwareHouseId int, in pingredientId int)
begin
	insert into ingredientstockhistory(quantity,price, createdUser, wareHouseId, ingredientId)
	values (pquantity,pprice, pcreatedUser, pwareHouseId, pingredientId);
	select * from ingredientstockhistory where  ingredientStockHistoryId = last_insert_id();
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_add_ingredient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_add_ingredient`(IN pname VARCHAR(30), in punit VARCHAR(10), in pimage VARCHAR(200), in pcreatedUser int)
begin
	insert into ingredient(name,unit, image, createdUser)
values (pname,punit, pimage, pcreatedUser);
select last_insert_id();
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_add_promotion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_add_promotion`(IN pname VARCHAR(30), in pdiscount int, in prequirePoint int, in pcreatedUser int)
begin
	insert into promotion(name,discount, requirePoint,createdUser)
	values (pname,pdiscount,prequirePoint,pcreatedUser);
	select last_insert_id();
end ;;
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
    IN address NVARCHAR(50),
    IN createdUser INT
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
	
	INSERT INTO customer (customerId, name, phone, email, address, createdUser)
    VALUES (lastId, name, phone, email, address, createdUser);
    
    SELECT * FROM customer WHERE customerId = lastId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_create_food` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_create_food`(
	IN name NVARCHAR(100),
	IN unit NVARCHAR(100),
	IN categoryId INT,
	IN image VARCHAR(200),
	IN price DECIMAL(10, 2),
	IN priceListId INT,
    IN createdUser INT
)
BEGIN
		
    DECLARE lastFoodId INT;
	DECLARE lastProPriceId INT;
    
    -- Tìm id cuối cùng trong bảng customer
    SELECT MAX(foodId) INTO lastFoodId FROM food;
	SELECT MAX(id) INTO lastProPriceId FROM productprice;
    
    -- Nếu bảng rỗng, gán lastID = 0
    IF lastFoodId IS NULL THEN
        SET lastFoodId = 0;
    END IF;
    IF lastProPriceId IS NULL THEN
        SET lastProPriceId = 0;
    END IF;
    
    -- Tăng giá trị lastID lên 1
    SET lastFoodId = lastFoodId + 1;
	SET lastProPriceId = lastProPriceId + 1;
	
	INSERT INTO food (foodId, name, unit, categoryId, createdUser, image)
    VALUES (lastFoodId, name, unit, categoryId, createdUser, image);
    
    INSERT INTO productprice (id, productId, priceListId, price, createdUser)
    VALUES (lastProPriceId, lastFoodId, priceListId, price, createdUser);
    
	SELECT f.*, c.name AS categoryName,
		CASE WHEN p2.enddate < CURRENT_TIMESTAMP() THEN NULL ELSE p2.priceId END AS priceId,
		CASE WHEN p2.enddate < CURRENT_TIMESTAMP() THEN NULL ELSE p2.price END AS price,
		CASE WHEN p2.enddate < CURRENT_TIMESTAMP() THEN NULL ELSE p2.type END AS type
	FROM food AS f
	INNER JOIN category AS c ON c.categoryId = f.categoryId
	LEFT JOIN (
		SELECT *
		FROM (
			SELECT p.productId, p.priceListId, p.price
			FROM productprice AS p
			WHERE p.priceListId = (
				SELECT MAX(priceListId)
				FROM productprice AS sub_p
				WHERE sub_p.productId = p.productId
			)
		) AS new_p
		LEFT JOIN (
			SELECT pl.priceId, pl.type, pl.startDate, pl.endDate
			FROM pricelist AS pl
		) AS new_pl ON new_pl.priceId = new_p.priceListId
	) AS p2 ON p2.productId = f.foodId
    WHERE f.foodId = lastFoodId;
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
	select * from pricelist where priceId = last_insert_id();
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_create_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_create_user`(
	IN name NVARCHAR(50), 
    IN email NVARCHAR(50),
    IN phone NVARCHAR(50),
    IN image NVARCHAR(200),
    IN p4ssword NVARCHAR(200), 
    IN roleId NVARCHAR(30), 
    IN createdUser INT
)
BEGIN

	DECLARE lastUserId INT;
	DECLARE lastUserRoleId INT;
    
    -- Tìm id cuối cùng trong bảng user
    SELECT MAX(userId) INTO lastUserId FROM hethonggaran.user;
	SELECT MAX(id) INTO lastUserRoleId FROM userrole;
    
    -- Nếu bảng rỗng, gán lastID = 0
    IF lastUserId IS NULL THEN
        SET lastUserId = 0;
    END IF;
    IF lastUserRoleId IS NULL THEN
        SET lastUserRoleId = 0;
    END IF;
    
    -- Tăng giá trị lastID lên 1
    SET lastUserId = lastUserId + 1;
	
	INSERT INTO hethonggaran.user (userId, name, email, phone, image, password, createdUser)
    VALUES (lastUserId, name, email, phone, image, p4ssword, createdUser);
    
    -- Xử lý mảng roleId
    INSERT INTO userrole (id, roleId, userId, createdUser)
    SELECT lastUserRoleId + idOffset, roleIdValue, lastUserId, createdUser
    FROM JSON_TABLE(roleId, "$[*]" COLUMNS (
        idOffset FOR ORDINALITY,
        roleIdValue INT PATH "$"
    )) AS roleData;
    
	SELECT u.*
    FROM hethonggaran.user AS u
    WHERE u.userId = lastUserId;
    
    SELECT r.roleId, r.name
    FROM userrole AS ur
    INNER JOIN hethonggaran.role AS r ON r.roleId = ur.roleId
    WHERE ur.userId = lastUserId;

END ;;
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_all_promote`(in keyword text)
SELECT hethonggaran.promotion.*, hethonggaran.user.name as userName
FROM hethonggaran.promotion 
join hethonggaran.user on  hethonggaran.promotion.createdUser = hethonggaran.user.userId
where hethonggaran.promotion.name like CONCAT('%',keyword, '%') 
order by promoteId DESC ;;
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
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_customer_by_emailphone` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_customer_by_emailphone`(
    IN phone NVARCHAR(50),
    IN customerEmail NVARCHAR(100)
)
BEGIN
    DECLARE count INT DEFAULT 0;
    
    -- Kiểm tra nếu cả email và phone đều là NULL, mặc định count = 0
    IF phone IS NULL AND customerEmail IS NULL THEN
        SELECT count AS count;
    END IF;
    
    -- Truy vấn khách hàng theo điều kiện email và phone
    IF phone IS NOT NULL THEN
        -- Truy vấn bằng phone và có kết quả, bỏ qua email
        SELECT COUNT(*) INTO count
        FROM customer AS c
        WHERE c.phone = phone;

        IF count = 0 THEN
            -- Truy vấn bằng email khi không có kết quả từ truy vấn bằng phone
            SELECT COUNT(*) INTO count
            FROM customer AS c
            WHERE c.email = customerEmail;
        END IF;
    ELSE
        -- Truy vấn bằng email khi phone là NULL
        SELECT COUNT(*) INTO count
        FROM customer AS c
        WHERE c.email = customerEmail;

        IF count = 0 THEN
            -- Truy vấn bằng phone khi không có kết quả từ truy vấn bằng email
            SELECT COUNT(*) INTO count
            FROM customer AS c
            WHERE c.phone = phone;
        END IF;
    END IF;
    
    -- Trả về count và kết quả truy vấn
    IF count = 1 THEN
        IF phone IS NOT NULL AND EXISTS (SELECT 1 FROM customer AS c WHERE c.phone = phone) THEN
            -- Truy vấn bằng email và có kết quả, bỏ qua phone
            SELECT *, count
            FROM customer AS c
            WHERE c.phone = phone;
        ELSE
            -- Truy vấn bằng phone và có kết quả, bỏ qua email
            SELECT *, count
            FROM customer AS c
            WHERE c.email = customerEmail;
        END IF;
    ELSE
        SELECT count AS count;
    END IF;
END ;;
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
    IN k3y NVARCHAR(100),
    IN page_limit INT,
    IN off_set INT
)
BEGIN

	DECLARE total_count INT;
    SELECT COUNT(*) INTO total_count
    FROM customer AS c
    WHERE
		(c.customerId = customerId OR customerId IS NULL)
        AND (
        (c.name LIKE CONCAT('%', k3y, '%'))
        OR (c.phone LIKE CONCAT('%', k3y, '%'))
        OR (c.email LIKE CONCAT('%', k3y, '%'))
		OR k3y IS NULL
        );
    
    SELECT c.* 
    FROM customer AS c 
    WHERE
		(c.customerId = customerId OR customerId IS NULL)
        AND (
        (c.name LIKE CONCAT('%', k3y, '%'))
        OR (c.phone LIKE CONCAT('%', k3y, '%'))
        OR (c.email LIKE CONCAT('%', k3y, '%'))
		OR k3y IS NULL
        )
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
    IN k3y NVARCHAR(100),
    IN categoryId INT,
    IN page_limit INT,
    IN off_set INT
)
BEGIN
	
    DECLARE total_sold INT;
    
    DECLARE total_count INT;
    SELECT COUNT(*) INTO total_count
    FROM food AS f
	INNER JOIN category AS c ON c.categoryId = f.categoryId
	LEFT JOIN (
		SELECT *
		FROM (
			SELECT p.productId, p.priceListId, p.price
			FROM productprice AS p
			WHERE p.priceListId = (
				SELECT MAX(priceListId)
				FROM productprice AS sub_p
				WHERE sub_p.productId = p.productId
			)
		) AS new_p
		LEFT JOIN (
			SELECT pl.priceId, pl.type, pl.startDate, pl.endDate
			FROM pricelist AS pl
		) AS new_pl ON new_pl.priceId = new_p.priceListId
	) AS p2 ON p2.productId = f.foodId
    WHERE
        (f.foodId = foodId OR foodId IS NULL)
        AND (
        (f.name LIKE CONCAT('%', k3y, '%'))
        OR (c.name LIKE CONCAT('%', k3y, '%'))
		OR k3y IS NULL
        )
        AND (c.categoryId = categoryId OR categoryId IS NULL);

    SELECT f.*, c.name AS categoryName,
		CASE WHEN p2.enddate < CURRENT_TIMESTAMP() THEN NULL ELSE p2.priceId END AS priceId,
		CASE WHEN p2.enddate < CURRENT_TIMESTAMP() THEN NULL ELSE p2.price END AS price,
		CASE WHEN p2.enddate < CURRENT_TIMESTAMP() THEN NULL ELSE p2.type END AS type,
		CASE WHEN f.foodId NOT IN (
					SELECT f1.foodId
					FROM orderdetail AS od1
					LEFT JOIN food AS f1 ON f1.foodId = od1.foodId
					LEFT JOIN hethonggaran.order AS o1 ON o1.orderId = od1.orderId
					WHERE od1.foodId = f1.foodId AND o1.status = "Completed"
					GROUP BY f1.foodId
                    ) THEN NULL ELSE new_sold.quantity END AS sold
		
	FROM food AS f
	INNER JOIN category AS c ON c.categoryId = f.categoryId
	LEFT JOIN (
		SELECT *
		FROM (
			SELECT p.productId, p.priceListId, p.price
			FROM productprice AS p
			WHERE p.priceListId = (
				SELECT MAX(priceListId)
				FROM productprice AS sub_p
				WHERE sub_p.productId = p.productId
			)
		) AS new_p
		LEFT JOIN (
			SELECT pl.priceId, pl.type, pl.startDate, pl.endDate
			FROM pricelist AS pl
		) AS new_pl ON new_pl.priceId = new_p.priceListId
	) AS p2 ON p2.productId = f.foodId
    LEFT JOIN (
		SELECT f1.foodId, SUM(od1.quantity) AS quantity
		FROM orderdetail AS od1
		LEFT JOIN food AS f1 ON f1.foodId = od1.foodId
		LEFT JOIN hethonggaran.order AS o1 ON o1.orderId = od1.orderId
		WHERE od1.foodId = f1.foodId AND o1.status = "Completed"
		GROUP BY f1.foodId
    ) AS new_sold ON new_sold.foodId = f.foodId
    WHERE
        (f.foodId = foodId OR foodId IS NULL)
        AND (
        (f.name LIKE CONCAT('%', k3y, '%'))
        OR (c.name LIKE CONCAT('%', k3y, '%'))
		OR k3y IS NULL
        )
        AND (c.categoryId = categoryId OR categoryId IS NULL)
    ORDER BY new_sold.quantity DESC, f.foodId ASC
    LIMIT page_limit OFFSET off_set;
    
    SELECT total_count AS total_rows;
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
    IN k3y NVARCHAR(100),
    IN wareHouseId INT,
    IN page_limit INT,
    IN off_set INT
)
BEGIN
	
	DECLARE total_count INT;

    -- Tính tổng số lượng ingredient
    SELECT COUNT(*) AS total_count INTO total_count
    FROM (
    SELECT i.ingredientId, i.name, i.unit, i.available, i.image, i.createdTime, i.updatedTime, i.createdUser, i.updatedUser
    FROM ingredient AS i
    LEFT JOIN ingredientstockhistory AS s ON s.ingredientId = i.ingredientId
    LEFT JOIN warehouse AS w ON w.wareHouseId = s.wareHouseId
    WHERE (i.ingredientId = ingredientId OR ingredientId IS NULL)
        AND (
        (i.name LIKE CONCAT('%', k3y, '%'))
        OR k3y IS NULL
        )
        AND (wareHouseId IS NULL OR w.wareHouseId = wareHouseId)
	GROUP BY i.ingredientId
    ) AS subquery;
    
    -- Lấy thông tin ingredient và số lượng tồn trên warehouse cụ thể
    SELECT i.ingredientId, i.name, i.unit, i.available, i.image, i.createdTime, i.updatedTime, i.createdUser, i.updatedUser, SUM(s.quantity) AS quantity
    FROM ingredient AS i
    LEFT JOIN ingredientstockhistory AS s ON s.ingredientId = i.ingredientId
    LEFT JOIN warehouse AS w ON w.wareHouseId = s.wareHouseId
    WHERE (i.ingredientId = ingredientId OR ingredientId IS NULL)
        AND (
        (i.name LIKE CONCAT('%', k3y, '%'))
        OR k3y IS NULL
        )
        AND (wareHouseId IS NULL OR w.wareHouseId = wareHouseId)
	GROUP BY i.ingredientId
    LIMIT off_set, page_limit;
    
    -- Trả về tổng số lượng ingredient
    SELECT total_count AS total_ingredients;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_list_customer_for_new_promotion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_list_customer_for_new_promotion`(IN ppoint INT)
SELECT * FROM hethonggaran.customer 
where point>ppoint and email<>'' ;;
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
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_list_price_duble` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_list_price_duble`(IN ptype VARCHAR(20), in pstartDate DATETIME, in penddate DATETIME)
select priceId from pricelist where type = ptype and startDate= pstartDate and enddate = penddate ;;
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
begin
	if productId=-1 then
		SELECT  productprice.id,  
         productprice.productId,  
         productprice.priceListId,  
          productprice.price,  
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
         FROM pricelist  
         join productprice on pricelist.priceId = productprice.priceListId 
         order by productprice.createdDate DESC 
         limit 10 offset page;
    else
		SELECT  productprice.id,  
         productprice.productId,  
         productprice.priceListId, 
          productprice.price,  
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
         FROM pricelist  
         join productprice on pricelist.priceId = productprice.priceListId 
         where productprice.productId = productId 
         order by productprice.createdDate DESC 
         limit 10 offset page;
    end if ;
end ;;
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
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_promote_follow_page` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_promote_follow_page`(in keyword text, in page int)
SELECT hethonggaran.promotion.*, hethonggaran.user.name as userName
FROM hethonggaran.promotion 
join hethonggaran.user on  hethonggaran.promotion.createdUser = hethonggaran.user.userId
where hethonggaran.promotion.name like CONCAT('%', keyword, '%') 
order by promoteId DESC
limit 10 offset page ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_quantity_avalable` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_quantity_avalable`(IN pwareHouseId int, in pingredientId int)
select sum(quantity) as SoLuongTon
from ingredientstockhistory
where wareHouseId = pwareHouseId and ingredientId = pingredientId ;;
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
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_user_list` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_user_list`(
    IN userId INT,
    IN k3y NVARCHAR(100),
    IN page_limit INT,
    IN off_set INT
)
BEGIN

	DECLARE total_count INT;
    
    SELECT COUNT(*) INTO total_count
    FROM hethonggaran.user AS u
    WHERE
		(u.userId = userId OR userId IS NULL)
        AND (
        (u.name LIKE CONCAT('%', k3y, '%'))
        OR (u.phone LIKE CONCAT('%', k3y, '%'))
        OR (u.email LIKE CONCAT('%', k3y, '%'))
		OR k3y IS NULL
        );
    
    SELECT u.* 
	FROM hethonggaran.user AS u
    WHERE
		(u.userId = userId OR userId IS NULL)
        AND (
        (u.name LIKE CONCAT('%', k3y, '%'))
        OR (u.phone LIKE CONCAT('%', k3y, '%'))
        OR (u.email LIKE CONCAT('%', k3y, '%'))
		OR k3y IS NULL
        )
	LIMIT page_limit OFFSET off_set;
    
    SELECT total_count AS total_users;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_warehouse_by_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_warehouse_by_id`(
	IN warehouseId INT
)
BEGIN
	SELECT * 
    FROM warehouse AS w 
	WHERE w.wareHouseId = warehouseId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_warehouse_by_status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_get_warehouse_by_status`(
    IN stats NVARCHAR(100)
)
BEGIN
    -- Truy vấn kho hàng dựa trên trạng thái (status)
    SELECT *
    FROM warehouse AS w
    WHERE w.status LIKE CONCAT('%', stats, '%') OR stats IS NULL;
END ;;
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
/*!50003 DROP PROCEDURE IF EXISTS `sp_report` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_report`(
	IN fromDate DATETIME,
	IN toDate DATETIME,
	IN warehouseId INT,
	IN topCustomer INT
)
BEGIN

    IF fromDate = toDate THEN
    	-- Thống kê theo ngày
        SELECT 
			DATE(reportDate) AS reportDate,
			SUM(totalMoney) AS totalRevenue,
			SUM(CASE WHEN methodName = 'Tiền mặt' THEN totalMoney ELSE 0 END) AS cash,
			SUM(CASE WHEN methodName = 'Chuyển khoản' THEN totalMoney ELSE 0 END) AS banking,
			SUM(CASE WHEN methodName = 'Ví điện tử' THEN totalMoney ELSE 0 END) AS eWallet,
            SUM(CASE WHEN methodName != 'Chuyển khoản' AND methodName != 'Tiền mặt' AND methodName != 'Ví điện tử' THEN totalMoney ELSE 0 END) AS other
		FROM (
			SELECT o.orderId, DATE(o.orderTime) AS reportDate, pm.paymentMethodId, pm.name AS methodName, o.totalMoney AS totalMoney
			FROM orderdetail AS od
			RIGHT JOIN hethonggaran.order AS o ON o.orderId = od.orderId
			INNER JOIN paymentmethod AS pm ON pm.paymentMethodId = o.paymentMethodId
			WHERE DATE(o.orderTime) = DATE(fromDate) OR DATE(o.orderTime) = DATE(toDate)
			GROUP BY o.orderId, DATE(o.orderTime)
		) AS subquery
		GROUP BY reportDate;
        
        -- Thống kê theo món ăn
		SELECT f.*, t.quantity, t.totalRevenue
		FROM food AS f
		INNER JOIN (
			SELECT foodId, quantity, totalRevenue
			FROM (
				SELECT f.foodId, SUM(od.quantity) AS quantity, SUM((od.price * od.quantity)) AS totalRevenue
				FROM orderdetail AS od
				RIGHT JOIN hethonggaran.order AS o ON o.orderId = od.orderId
				LEFT JOIN food AS f ON od.foodId = f.foodId
				WHERE DATE(o.orderTime) = DATE(fromDate) OR DATE(o.orderTime) = DATE(toDate)
				GROUP BY f.foodId
			) AS subquery
		) AS t ON f.foodId = t.foodId
        ORDER BY t.quantity DESC;

		-- Thống kê theo khách hàng
		SELECT c.*, t.totalMoney AS totalRevenue
		FROM customer AS c
		INNER JOIN (
			SELECT customerId, SUM(totalMoney) AS totalMoney
			FROM (
				SELECT c.customerId, o.orderId, o.totalMoney AS totalMoney
				FROM orderdetail AS od
				RIGHT JOIN hethonggaran.order AS o ON o.orderId = od.orderId
				INNER JOIN customer AS c ON o.customerId = c.customerId
				WHERE DATE(o.orderTime) = DATE(fromDate) OR DATE(o.orderTime) = DATE(toDate)
				GROUP BY o.orderId, c.customerId
			) AS subquery
			GROUP BY customerId
		) AS t ON c.customerId = t.customerId
		ORDER BY
			totalRevenue DESC
		LIMIT topCustomer;
    
    ELSE IF fromDate IS NULL AND toDate IS NULL THEN
    	-- Thống kê theo ngày
         SELECT 
			DATE(reportDate) AS reportDate,
			SUM(totalMoney) AS totalRevenue,
			SUM(CASE WHEN methodName = 'Tiền mặt' THEN totalMoney ELSE 0 END) AS cash,
			SUM(CASE WHEN methodName = 'Chuyển khoản' THEN totalMoney ELSE 0 END) AS banking,
			SUM(CASE WHEN methodName = 'Ví điện tử' THEN totalMoney ELSE 0 END) AS eWallet,
            SUM(CASE WHEN methodName != 'Chuyển khoản' AND methodName != 'Tiền mặt' AND methodName != 'Ví điện tử' THEN totalMoney ELSE 0 END) AS other
		FROM (
			SELECT o.orderId, DATE(o.orderTime) AS reportDate, pm.paymentMethodId, pm.name AS methodName, o.totalMoney AS totalMoney
			FROM orderdetail AS od
			RIGHT JOIN hethonggaran.order AS o ON o.orderId = od.orderId
			INNER JOIN paymentmethod AS pm ON pm.paymentMethodId = o.paymentMethodId
			GROUP BY o.orderId, DATE(o.orderTime)
		) AS subquery
		GROUP BY reportDate;
        
        -- Thống kê theo món ăn
		SELECT f.*, t.quantity, t.totalRevenue
		FROM food AS f
		INNER JOIN (
			SELECT foodId, quantity, totalRevenue
			FROM (
				SELECT f.foodId, SUM(od.quantity) AS quantity, SUM((od.price * od.quantity)) AS totalRevenue
				FROM orderdetail AS od
				RIGHT JOIN hethonggaran.order AS o ON o.orderId = od.orderId
				LEFT JOIN food AS f ON od.foodId = f.foodId
				GROUP BY f.foodId
			) AS subquery
		) AS t ON f.foodId = t.foodId
        ORDER BY t.quantity DESC;
    
		-- Thống kê theo khách hàng
		SELECT c.*, t.totalMoney AS totalRevenue
		FROM customer AS c
		INNER JOIN (
			SELECT customerId, SUM(totalMoney) AS totalMoney
			FROM (
				SELECT c.customerId, o.orderId, o.totalMoney AS totalMoney
				FROM orderdetail AS od
				RIGHT JOIN hethonggaran.order AS o ON o.orderId = od.orderId
				INNER JOIN customer AS c ON o.customerId = c.customerId
				GROUP BY o.orderId, c.customerId
			) AS subquery
			GROUP BY customerId
		) AS t ON c.customerId = t.customerId
		ORDER BY
			totalRevenue DESC
		LIMIT topCustomer;
	
	-- Nếu toDate null thì tính từ fromDate đến hết
    ELSE IF toDate IS NULL THEN
    	-- Thống kê theo ngày
         SELECT 
			DATE(reportDate) AS reportDate,
			SUM(totalMoney) AS totalRevenue,
			SUM(CASE WHEN methodName = 'Tiền mặt' THEN totalMoney ELSE 0 END) AS cash,
			SUM(CASE WHEN methodName = 'Chuyển khoản' THEN totalMoney ELSE 0 END) AS banking,
			SUM(CASE WHEN methodName = 'Ví điện tử' THEN totalMoney ELSE 0 END) AS eWallet,
            SUM(CASE WHEN methodName != 'Chuyển khoản' AND methodName != 'Tiền mặt' AND methodName != 'Ví điện tử' THEN totalMoney ELSE 0 END) AS other
		FROM (
			SELECT o.orderId, DATE(o.orderTime) AS reportDate, pm.paymentMethodId, pm.name AS methodName, o.totalMoney AS totalMoney
			FROM orderdetail AS od
			RIGHT JOIN hethonggaran.order AS o ON o.orderId = od.orderId
			INNER JOIN paymentmethod AS pm ON pm.paymentMethodId = o.paymentMethodId
				WHERE DATE(o.orderTime) >= DATE(fromDate)
			GROUP BY o.orderId, DATE(o.orderTime)
		) AS subquery
		GROUP BY reportDate;
        
        -- Thống kê theo món ăn
		SELECT f.*, t.quantity, t.totalRevenue
		FROM food AS f
		INNER JOIN (
			SELECT foodId, quantity, totalRevenue
			FROM (
				SELECT f.foodId, SUM(od.quantity) AS quantity, SUM((od.price * od.quantity)) AS totalRevenue
				FROM orderdetail AS od
				RIGHT JOIN hethonggaran.order AS o ON o.orderId = od.orderId
				LEFT JOIN food AS f ON od.foodId = f.foodId
				WHERE DATE(o.orderTime) >= DATE(fromDate)
				GROUP BY f.foodId
			) AS subquery
		) AS t ON f.foodId = t.foodId
        ORDER BY t.quantity DESC;
    
		-- Thống kê theo khách hàng
		SELECT c.*, t.totalMoney AS totalRevenue
		FROM customer AS c
		INNER JOIN (
			SELECT customerId, SUM(totalMoney) AS totalMoney
			FROM (
				SELECT c.customerId, o.orderId, o.totalMoney AS totalMoney
				FROM orderdetail AS od
				RIGHT JOIN hethonggaran.order AS o ON o.orderId = od.orderId
				INNER JOIN customer AS c ON o.customerId = c.customerId
				WHERE DATE(o.orderTime) >= DATE(fromDate)
				GROUP BY o.orderId, c.customerId
			) AS subquery
			GROUP BY customerId
		) AS t ON c.customerId = t.customerId
		ORDER BY
			totalRevenue DESC
		LIMIT topCustomer;
	-- Nếu fromDate null thì tính từ toDate đến hết
	ELSE IF fromDate IS NULL THEN
    	-- Thống kê theo ngày
         SELECT 
			DATE(reportDate) AS reportDate,
			SUM(totalMoney) AS totalRevenue,
			SUM(CASE WHEN methodName = 'Tiền mặt' THEN totalMoney ELSE 0 END) AS cash,
			SUM(CASE WHEN methodName = 'Chuyển khoản' THEN totalMoney ELSE 0 END) AS banking,
			SUM(CASE WHEN methodName = 'Ví điện tử' THEN totalMoney ELSE 0 END) AS eWallet,
            SUM(CASE WHEN methodName != 'Chuyển khoản' AND methodName != 'Tiền mặt' AND methodName != 'Ví điện tử' THEN totalMoney ELSE 0 END) AS other
		FROM (
			SELECT o.orderId, DATE(o.orderTime) AS reportDate, pm.paymentMethodId, pm.name AS methodName, o.totalMoney AS totalMoney
			FROM orderdetail AS od
			RIGHT JOIN hethonggaran.order AS o ON o.orderId = od.orderId
			INNER JOIN paymentmethod AS pm ON pm.paymentMethodId = o.paymentMethodId
				WHERE DATE(o.orderTime) <= DATE(toDate)
			GROUP BY o.orderId, DATE(o.orderTime)
		) AS subquery
		GROUP BY reportDate;
        
        -- Thống kê theo món ăn
		SELECT f.*, t.quantity, t.totalRevenue
		FROM food AS f
		INNER JOIN (
			SELECT foodId, quantity, totalRevenue
			FROM (
				SELECT f.foodId, SUM(od.quantity) AS quantity, SUM((od.price * od.quantity)) AS totalRevenue
				FROM orderdetail AS od
				RIGHT JOIN hethonggaran.order AS o ON o.orderId = od.orderId
				LEFT JOIN food AS f ON od.foodId = f.foodId
				WHERE DATE(o.orderTime) <= DATE(toDate)
				GROUP BY f.foodId
			) AS subquery
		) AS t ON f.foodId = t.foodId
        ORDER BY t.quantity DESC;
    
		-- Thống kê theo khách hàng
		SELECT c.*, t.totalMoney AS totalRevenue
		FROM customer AS c
		INNER JOIN (
			SELECT customerId, SUM(totalMoney) AS totalMoney
			FROM (
				SELECT c.customerId, o.orderId, o.totalMoney AS totalMoney
				FROM orderdetail AS od
				RIGHT JOIN hethonggaran.order AS o ON o.orderId = od.orderId
				INNER JOIN customer AS c ON o.customerId = c.customerId
				WHERE DATE(o.orderTime) <= DATE(toDate)
				GROUP BY o.orderId, c.customerId
			) AS subquery
			GROUP BY customerId
		) AS t ON c.customerId = t.customerId
		ORDER BY
			totalRevenue DESC
		LIMIT topCustomer;
	ELSE 
    	-- Thống kê theo ngày
         SELECT 
			DATE(reportDate) AS reportDate,
			SUM(totalMoney) AS totalRevenue,
			SUM(CASE WHEN methodName = 'Tiền mặt' THEN totalMoney ELSE 0 END) AS cash,
			SUM(CASE WHEN methodName = 'Chuyển khoản' THEN totalMoney ELSE 0 END) AS banking,
			SUM(CASE WHEN methodName = 'Ví điện tử' THEN totalMoney ELSE 0 END) AS eWallet,
            SUM(CASE WHEN methodName != 'Chuyển khoản' AND methodName != 'Tiền mặt' AND methodName != 'Ví điện tử' THEN totalMoney ELSE 0 END) AS other
		FROM (
			SELECT o.orderId, DATE(o.orderTime) AS reportDate, pm.paymentMethodId, pm.name AS methodName, o.totalMoney AS totalMoney
			FROM orderdetail AS od
			RIGHT JOIN hethonggaran.order AS o ON o.orderId = od.orderId
			INNER JOIN paymentmethod AS pm ON pm.paymentMethodId = o.paymentMethodId
				WHERE DATE(o.orderTime) >= DATE(fromDate) AND DATE(o.orderTime) <= DATE(toDate)
			GROUP BY o.orderId, DATE(o.orderTime)
		) AS subquery
		GROUP BY reportDate;
        
        -- Thống kê theo món ăn
		SELECT f.*, t.quantity, t.totalRevenue
		FROM food AS f
		INNER JOIN (
			SELECT foodId, quantity, totalRevenue
			FROM (
				SELECT f.foodId, SUM(od.quantity) AS quantity, SUM((od.price * od.quantity)) AS totalRevenue
				FROM orderdetail AS od
				RIGHT JOIN hethonggaran.order AS o ON o.orderId = od.orderId
				LEFT JOIN food AS f ON od.foodId = f.foodId
				WHERE DATE(o.orderTime) >= DATE(fromDate) AND DATE(o.orderTime) <= DATE(toDate)
				GROUP BY f.foodId
			) AS subquery
		) AS t ON f.foodId = t.foodId
        ORDER BY t.quantity DESC;
    
		-- Thống kê theo khách hàng
		SELECT c.*, t.totalMoney AS totalRevenue
		FROM customer AS c
		INNER JOIN (
			SELECT customerId, SUM(totalMoney) AS totalMoney
			FROM (
				SELECT c.customerId, o.orderId, o.totalMoney AS totalMoney
				FROM orderdetail AS od
				RIGHT JOIN hethonggaran.order AS o ON o.orderId = od.orderId
				INNER JOIN customer AS c ON o.customerId = c.customerId
				WHERE DATE(o.orderTime) >= DATE(fromDate) AND DATE(o.orderTime) <= DATE(toDate)
				GROUP BY o.orderId, c.customerId
			) AS subquery
			GROUP BY customerId
		) AS t ON c.customerId = t.customerId
		ORDER BY
			totalRevenue DESC
		LIMIT topCustomer;
	END IF;
	END IF;
	END IF;
    END IF;
    
END ;;
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_updatePoint_customer`(
	IN point INT, 
    IN customerID INT
)
BEGIN
	UPDATE hethonggaran.customer 
    SET hethonggaran.customer.point = point 
    WHERE 
		hethonggaran.customer.customerId = customerID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_customer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_customer`(
    IN customerId INT, 
    IN name NVARCHAR(100), 
    IN phone NVARCHAR(100), 
    IN email NVARCHAR(100), 
    IN address NVARCHAR(100), 
    IN updatedUser INT, 
    IN updatedTime DATETIME
)
BEGIN
    -- Cập nhật thông tin khách hàng
    UPDATE customer
    SET
        customer.name = IFNULL(name, customer.name),
        customer.phone = IFNULL(phone, customer.phone),
        customer.email = IFNULL(email, customer.email),
        customer.address = IFNULL(address, customer.address),
        customer.updatedUser = updatedUser,
        customer.updatedTime = updatedTime
    WHERE
        customer.customerId = customerId;
    
    -- Truy vấn lại thông tin khách hàng vừa được cập nhật
    SELECT *
    FROM customer AS c
    WHERE
        c.customerId = customerId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_food` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_food`(
    IN foodId INT,
    IN name NVARCHAR(100),
    IN unit NVARCHAR(10),
    IN image NVARCHAR(200),
    IN available TINYINT,
    IN categoryId INT,
    IN updatedTime DATETIME,
    IN updatedUser INT
)
BEGIN
    -- Cập nhật thông tin món ăn
    UPDATE food
    SET
        food.name = IFNULL(name, food.name),
        food.unit = IFNULL(unit, food.unit),
        food.image = IFNULL(image, food.image),
        food.available = IFNULL(available, food.available),
        food.categoryId = IFNULL(categoryId, food.categoryId),
        food.updatedTime = updatedTime,
        food.updatedUser = updatedUser
    WHERE
        food.foodId = foodId;

    -- Truy vấn lại thông tin món ăn vừa được cập nhật
    SELECT f.*, c.name AS categoryName,
		CASE WHEN p2.enddate < CURRENT_TIMESTAMP() THEN NULL ELSE p2.priceId END AS priceId,
		CASE WHEN p2.enddate < CURRENT_TIMESTAMP() THEN NULL ELSE p2.price END AS price,
		CASE WHEN p2.enddate < CURRENT_TIMESTAMP() THEN NULL ELSE p2.type END AS type
	FROM food AS f
	INNER JOIN category AS c ON c.categoryId = f.categoryId
	LEFT JOIN (
		SELECT *
		FROM (
			SELECT p.productId, p.priceListId, p.price
			FROM productprice AS p
			WHERE p.priceListId = (
				SELECT MAX(priceListId)
				FROM productprice AS sub_p
				WHERE sub_p.productId = p.productId
			)
		) AS new_p
		LEFT JOIN (
			SELECT pl.priceId, pl.type, pl.startDate, pl.endDate
			FROM pricelist AS pl
		) AS new_pl ON new_pl.priceId = new_p.priceListId
	) AS p2 ON p2.productId = f.foodId
    WHERE f.foodId = foodId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_ingredient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_ingredient`(in pingredientId int,IN pname VARCHAR(30), in punit VARCHAR(10), in pimage VARCHAR(200), in pupdatedUser int)
update ingredient
set ingredient.name=pname,
	unit = punit,
    image = pimage,
    updatedUser = pupdatedUser
where ingredientId = pingredientId ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_password` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_password`( IN puserId int,   IN ppass VARCHAR(200))
begin
	update hethonggaran.user
	set hethonggaran.user.password = ppass
	where userId = puserId;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_product_price` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_product_price`( IN ppriceListId  int, in pproductId  DECIMAL(10,2) ,   IN pprice int, in userId int)
begin
	update hethonggaran.productprice
	set hethonggaran.productprice.price= pprice,
		updatedDate = now(),
        updatedUser = userId
	where priceListId=ppriceListId and productId = pproductId;
end ;;
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
        canceledTime=now()
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
/*!50003 DROP PROCEDURE IF EXISTS `sp_update_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update_user`(
	IN userId INT,
	IN name NVARCHAR(50), 
    IN phone NVARCHAR(50),
    IN image NVARCHAR(200),
	IN st4tus NVARCHAR(20),
    IN roleId NVARCHAR(20), 
    IN updatedUser INT,
    IN updatedTime DATETIME
)
BEGIN

	DECLARE lastUserRoleId INT;

	UPDATE hethonggaran.user AS u
    SET
        u.name = IFNULL(name, u.name),
        u.phone = IFNULL(phone, u.phone),
        u.image = IFNULL(image, u.image),
        u.status = IFNULL(st4tus, u.status)
        -- u.updatedTime = updatedTime,
        -- u.updatedUser = updatedUser
    WHERE
        u.userId = userId;
	
    IF roleId IS NOT NULL THEN
		-- SELECT ur1.roleId FROM userrole AS ur1 WHERE ur1.userId = userId) -> [1, 2]
        -- roleId = [1, 2] -> Không làm gì
        -- roleId = [1] -> xoá 2 giữ nguyên 1
        -- roleId = [2] --> xoá 1 giữ nguyên 2
        -- roleId = [3] --> Xoá 1, 2 thêm 3 vào
        -- roleId = [] --> xoá hết quyền
        -- roleId = [1, 2, 3] --> giữ nguyên 1, 2 thêm 3
        -- roleId= [2, 3] --> giữ nguyên 2, thêm 3, xoá 1
		
		SELECT MAX(id) INTO lastUserRoleId FROM userrole;
    
		IF lastUserRoleId IS NULL THEN
			SET lastUserRoleId = 0;
		END IF;
        
        -- Xử lý update quyền
        -- listrole = [1, 2, 3] currentRole = [1, 2] -> Thêm 3
        -- listrole = [2, 3] currentRole = [1, 2] --> Thêm [2, 3]
		DELETE FROM userrole AS ur
        WHERE ur.roleId NOT IN (
			SELECT roleIdValue
			FROM JSON_TABLE(roleId, "$[*]" COLUMNS (
				idOffset FOR ORDINALITY,
				roleIdValue INT PATH "$"
			)) AS roleData
        );
        
		INSERT INTO userrole (id, roleId, userId, createdUser)
		SELECT lastUserRoleId + idOffset, roleIdValue, userId, updatedUser
		FROM JSON_TABLE(roleId, "$[*]" COLUMNS (
			idOffset FOR ORDINALITY,
			roleIdValue INT PATH "$"
		)) AS roleData
		WHERE roleIdValue NOT IN (
			SELECT ur1.roleId FROM userrole AS ur1 WHERE ur1.userId = userId
		);
        
	END IF;
    
    SELECT u.*
    FROM hethonggaran.user AS u
    WHERE u.userId = userId;
    
    SELECT r.roleId, r.name
    FROM userrole AS ur
    INNER JOIN hethonggaran.role AS r ON r.roleId = ur.roleId
    WHERE ur.userId = userId;
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

-- Dump completed on 2023-06-25  6:46:35
