CREATE DATABASE  IF NOT EXISTS `librarydb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `librarydb`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: librarydb
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `BookID` int NOT NULL AUTO_INCREMENT,
  `BookTitle` varchar(255) NOT NULL,
  `BookAuthor` varchar(100) NOT NULL,
  `BookISBN` varchar(20) NOT NULL,
  `BookStatus` enum('可借閱','已借出') NOT NULL DEFAULT '可借閱',
  `CategoryID` int NOT NULL,
  PRIMARY KEY (`BookID`),
  UNIQUE KEY `BookISBN` (`BookISBN`),
  KEY `CategoryID` (`CategoryID`),
  CONSTRAINT `book_ibfk_1` FOREIGN KEY (`CategoryID`) REFERENCES `category` (`CategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (1,'資料庫系統概論','王大明','9781234567890','已借出',1),(2,'小王子','聖修伯里','9789999999991','可借閱',2),(3,'世界歷史','李四','9788888888882','可借閱',3),(4,'星際穿越','劉慈欣','9780000000001','可借閱',1),(5,'斜槓青年','艾瑪','9780000000002','可借閱',2),(6,'如何學好資料庫','林博士','9780000000003','可借閱',3),(7,'世界名畫賞析','張美華','9780000000004','可借閱',4),(8,'日本旅遊全攻略','陳旅遊','9780000000005','可借閱',5),(9,'資料結構導論','李學文','9780000000010','可借閱',1),(10,'現代文學選讀','林黛玉','9780000000011','可借閱',2),(11,'設計思考實戰','戴夫布朗','9780000000012','可借閱',3),(12,'機器學習導論','鄭博士','9780000000101','可借閱',1),(13,'女性文學讀本','林老師','9780000000102','已借出',2),(14,'創意寫作練習','葉大衛','9780000000103','可借閱',3);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `borrowedbooks`
--

DROP TABLE IF EXISTS `borrowedbooks`;
/*!50001 DROP VIEW IF EXISTS `borrowedbooks`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `borrowedbooks` AS SELECT 
 1 AS `RecordID`,
 1 AS `MemberName`,
 1 AS `BookTitle`,
 1 AS `BorrowDate`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `CategoryID` int NOT NULL AUTO_INCREMENT,
  `CategoryName` varchar(100) NOT NULL,
  PRIMARY KEY (`CategoryID`),
  UNIQUE KEY `CategoryName` (`CategoryName`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (6,'教育'),(2,'文學'),(8,'旅遊'),(3,'歷史'),(5,'生活'),(4,'科幻'),(1,'科技'),(7,'藝術');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loginlog`
--

DROP TABLE IF EXISTS `loginlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loginlog` (
  `LogID` int NOT NULL AUTO_INCREMENT,
  `MemberID` int NOT NULL,
  `LoginTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`LogID`),
  KEY `MemberID` (`MemberID`),
  CONSTRAINT `loginlog_ibfk_1` FOREIGN KEY (`MemberID`) REFERENCES `member` (`MemberID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loginlog`
--

LOCK TABLES `loginlog` WRITE;
/*!40000 ALTER TABLE `loginlog` DISABLE KEYS */;
INSERT INTO `loginlog` VALUES (1,1,'2025-05-30 17:13:10'),(2,1,'2025-05-28 17:15:22'),(3,2,'2025-05-29 17:15:22'),(4,18,'2025-05-30 14:15:22'),(5,19,'2025-05-30 16:15:22'),(6,20,'2025-05-30 16:45:22'),(7,21,'2025-05-30 17:15:22'),(8,22,'2025-05-30 17:05:22'),(9,1,'2025-05-26 17:15:22'),(10,2,'2025-05-30 11:15:22'),(11,18,'2025-05-30 17:10:22');
/*!40000 ALTER TABLE `loginlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `MemberID` int NOT NULL AUTO_INCREMENT,
  `MemberName` varchar(100) NOT NULL,
  `MemberPassword` varchar(255) NOT NULL,
  `MemberPhone` varchar(20) DEFAULT NULL,
  `MemberEmail` varchar(100) NOT NULL,
  PRIMARY KEY (`MemberID`),
  UNIQUE KEY `MemberEmail` (`MemberEmail`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,'小明','pw123','0911222333','ming@example.com'),(2,'小華','pw456','0922333444','hua@example.com'),(3,'張文博','pw003','0910000003','member3@example.com'),(4,'李佳玲','pw004','0910000004','member4@example.com'),(5,'周冠廷','pw005','0910000005','member5@example.com'),(6,'林品妤','pw006','0910000006','member6@example.com'),(7,'陳威廷','pw007','0910000007','member7@example.com'),(8,'徐語柔','pw008','0910000008','member8@example.com'),(9,'黃宗翰','pw009','0910000009','member9@example.com'),(10,'吳靜怡','pw010','0910000010','member10@example.com'),(11,'簡宏宇','pw011','0910000011','member11@example.com'),(12,'游佳萱','pw012','0910000012','member12@example.com'),(13,'魏子翔','pw013','0910000013','member13@example.com'),(14,'曾雅婷','pw014','0910000014','member14@example.com'),(15,'謝柏豪','pw015','0910000015','member15@example.com'),(16,'洪佳雯','pw016','0910000016','member16@example.com'),(17,'蔡于庭','pw017','0910000017','member17@example.com'),(18,'阿哲','pass111','0911111111','che@example.com'),(19,'阿珍','pass222','0922222222','jen@example.com'),(20,'小志','pass333','0933333333','chi@example.com'),(21,'小琪','pass444','0944444444','chi2@example.com'),(22,'美雲','pass555','0955555555','mei@example.com'),(23,'揚塵家','11244234','0911666888','jia@example.com'),(24,'Eli','11244208','0911777888','ELI@example.com'),(25,'黃茂登','11244215','0911766888','maoDAMN@example.com'),(26,'陳家揚','11244200','0911665888','YANGJIA@example.com'),(29,'林晨','11244229','0928650986','GayLin@example.com');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification` (
  `NotifyID` int NOT NULL AUTO_INCREMENT,
  `MemberID` int NOT NULL,
  `Message` text NOT NULL,
  `NotifyDate` datetime NOT NULL,
  PRIMARY KEY (`NotifyID`),
  KEY `MemberID` (`MemberID`),
  CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`MemberID`) REFERENCES `member` (`MemberID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES (1,1,'您借閱的《資料庫系統概論》已逾期超過 14 天，請儘速歸還。','2025-05-30 16:39:49'),(2,2,'您借閱的《小王子》已逾期超過 14 天，請儘速歸還。','2025-05-30 16:39:49'),(4,19,'您借閱的《現代文學選讀》已逾期超過 14 天，請儘速歸還。','2025-05-30 17:00:51'),(5,20,'您借閱的《設計思考實戰》已逾期超過 14 天，請儘速歸還。','2025-05-30 17:00:51'),(6,12,'您借閱的《資料結構導論》已逾期超過 14 天，請儘速歸還。','2025-06-02 22:13:26'),(7,13,'您借閱的《現代文學選讀》已逾期超過 14 天，請儘速歸還。','2025-06-02 22:13:26'),(8,29,'您借閱的《設計思考實戰》已逾期超過 14 天，請儘速歸還。','2025-06-02 22:13:26'),(9,1,'您所借閱的《女性文學讀本》已被其他會員預約，請於 2025-06-03 前歸還，避免影響他人借閱權益。','2025-06-03 11:50:27');
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `overduebooks`
--

DROP TABLE IF EXISTS `overduebooks`;
/*!50001 DROP VIEW IF EXISTS `overduebooks`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `overduebooks` AS SELECT 
 1 AS `RecordID`,
 1 AS `MemberName`,
 1 AS `BookTitle`,
 1 AS `BorrowDate`,
 1 AS `DaysBorrowed`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `record`
--

DROP TABLE IF EXISTS `record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `record` (
  `RecordID` int NOT NULL AUTO_INCREMENT,
  `MemberID` int NOT NULL,
  `BookID` int NOT NULL,
  `BorrowDate` date NOT NULL,
  `ReturnDate` date DEFAULT NULL,
  PRIMARY KEY (`RecordID`),
  KEY `MemberID` (`MemberID`),
  KEY `BookID` (`BookID`),
  CONSTRAINT `record_ibfk_1` FOREIGN KEY (`MemberID`) REFERENCES `member` (`MemberID`),
  CONSTRAINT `record_ibfk_2` FOREIGN KEY (`BookID`) REFERENCES `book` (`BookID`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `record`
--

LOCK TABLES `record` WRITE;
/*!40000 ALTER TABLE `record` DISABLE KEYS */;
INSERT INTO `record` VALUES (1,1,2,'2025-05-30','2025-06-01'),(2,1,1,'2025-05-10','2025-05-30'),(3,2,2,'2025-05-14','2025-05-30'),(4,1,1,'2025-05-10','2025-05-30'),(5,2,2,'2025-05-14','2025-05-30'),(6,1,2,'2025-06-01','2025-05-30'),(10,18,9,'2025-05-24','2025-05-30'),(11,19,10,'2025-05-15','2025-05-30'),(12,20,11,'2025-05-12','2025-05-30'),(13,21,6,'2025-05-23','2025-05-30'),(14,23,1,'2025-06-02','2025-06-02'),(15,23,2,'2025-06-02','2025-06-03'),(16,24,3,'2025-06-02','2025-06-03'),(17,29,4,'2025-06-02','2025-06-03'),(18,25,5,'2025-06-02','2025-06-03'),(19,25,6,'2025-06-02','2025-06-03'),(20,26,7,'2025-06-02','2025-06-03'),(21,26,8,'2025-06-02','2025-06-03'),(22,23,1,'2025-06-02','2025-06-03'),(23,23,2,'2025-06-02','2025-06-03'),(24,24,3,'2025-06-02','2025-06-03'),(25,29,4,'2025-06-02','2025-06-03'),(26,25,5,'2025-06-02','2025-06-03'),(27,25,6,'2025-06-02','2025-06-03'),(28,26,7,'2025-06-02','2025-06-03'),(29,26,8,'2025-06-02','2025-06-03'),(30,1,1,'2025-06-02','2025-06-03'),(31,2,2,'2025-06-02','2025-06-03'),(32,3,3,'2025-06-02','2025-06-03'),(33,6,4,'2025-06-02','2025-06-03'),(34,11,5,'2025-06-02','2025-06-03'),(35,14,6,'2025-06-02','2025-06-03'),(36,15,7,'2025-06-02','2025-06-03'),(37,20,8,'2025-06-02','2025-06-03'),(38,1,2,'2025-06-02','2025-06-03'),(39,12,9,'2025-05-10','2025-06-03'),(40,13,10,'2025-05-12','2025-06-03'),(41,29,11,'2025-05-01','2025-06-03'),(42,29,12,'2025-06-02','2025-06-02'),(43,29,13,'2025-06-02','2025-06-03'),(44,29,1,'2025-06-02','2025-06-03'),(45,1,9,'2025-06-02','2025-06-03'),(46,29,1,'2025-06-03',NULL),(47,1,13,'2025-06-03',NULL);
/*!40000 ALTER TABLE `record` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_before_borrow_reservation_check` BEFORE INSERT ON `record` FOR EACH ROW BEGIN
  DECLARE first_reserver INT;

  -- 如果這本書目前有人預約，找出第一順位（最早預約的會員）
  SELECT MemberID INTO first_reserver
  FROM Reservation
  WHERE BookID = NEW.BookID
  ORDER BY ReserveDate ASC
  LIMIT 1;

  -- 若找到的預約會員不是即將借書的人，阻止借閱
  IF first_reserver IS NOT NULL AND NEW.MemberID != first_reserver THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = '此書已被他人預約，目前僅允許預約者借閱。';
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_after_borrow` AFTER INSERT ON `record` FOR EACH ROW BEGIN
  UPDATE Book
  SET BookStatus = '已借出'
  WHERE BookID = NEW.BookID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_after_return` AFTER UPDATE ON `record` FOR EACH ROW BEGIN
  -- 只有在歸還書籍時才執行
  IF NEW.ReturnDate IS NOT NULL AND OLD.ReturnDate IS NULL THEN
    UPDATE Book
    SET BookStatus = '可借閱'
    WHERE BookID = NEW.BookID;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `recordsummary`
--

DROP TABLE IF EXISTS `recordsummary`;
/*!50001 DROP VIEW IF EXISTS `recordsummary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `recordsummary` AS SELECT 
 1 AS `RecordID`,
 1 AS `MemberName`,
 1 AS `BookTitle`,
 1 AS `BorrowDate`,
 1 AS `ReturnDate`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `ResvID` int NOT NULL AUTO_INCREMENT,
  `MemberID` int NOT NULL,
  `BookID` int NOT NULL,
  `ReserveDate` date NOT NULL,
  PRIMARY KEY (`ResvID`),
  KEY `MemberID` (`MemberID`),
  KEY `BookID` (`BookID`),
  CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`MemberID`) REFERENCES `member` (`MemberID`),
  CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`BookID`) REFERENCES `book` (`BookID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (6,3,10,'2025-05-30'),(7,4,11,'2025-05-30'),(8,5,12,'2025-05-30'),(10,7,14,'2025-05-30'),(12,1,2,'2025-06-02'),(13,2,10,'2025-06-02'),(14,29,2,'2025-06-02'),(18,5,13,'2025-06-04');
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'librarydb'
--

--
-- Dumping routines for database 'librarydb'
--
/*!50003 DROP PROCEDURE IF EXISTS `BorrowBook` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `BorrowBook`(
  IN p_MemberID INT,
  IN p_BookID INT,
  IN p_BorrowDate DATE
)
BEGIN
  DECLARE book_status VARCHAR(20);

  -- 查詢書籍狀態
  SELECT BookStatus INTO book_status
  FROM Book
  WHERE BookID = p_BookID;

  -- 書不存在
  IF book_status IS NULL THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = '書籍不存在。';

  -- 書不可借（已借出或異常）
  ELSEIF book_status != '可借閱' THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = '該書目前無法借閱（已借出或狀態異常）。';

  ELSE
    -- 新增借書紀錄
    INSERT INTO Record(MemberID, BookID, BorrowDate)
    VALUES(p_MemberID, p_BookID, p_BorrowDate);

    -- 更新書籍狀態
    UPDATE Book
    SET BookStatus = '已借出'
    WHERE BookID = p_BookID;

    -- 自動刪除該會員的預約（若有）
    DELETE FROM Reservation
    WHERE MemberID = p_MemberID AND BookID = p_BookID;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CancelReservation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CancelReservation`(
  IN p_MemberID INT,
  IN p_BookID INT
)
BEGIN
  DECLARE exists_resv INT;

  -- 檢查是否存在該會員對該書的預約
  SELECT COUNT(*) INTO exists_resv
  FROM Reservation
  WHERE MemberID = p_MemberID AND BookID = p_BookID;

  -- 若無預約則顯示錯誤
  IF exists_resv = 0 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = '您沒有預約此書，無法取消。';
  ELSE
    -- 刪除預約
    DELETE FROM Reservation
    WHERE MemberID = p_MemberID AND BookID = p_BookID;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CheckOverdueAndNotify` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CheckOverdueAndNotify`()
BEGIN
  INSERT INTO Notification (MemberID, Message, NotifyDate)
  SELECT 
    R.MemberID,
    CONCAT('您借閱的《', B.BookTitle, '》已逾期超過 14 天，請儘速歸還。') AS Message,
    NOW()
  FROM Record R
  JOIN Book B ON R.BookID = B.BookID
  WHERE R.ReturnDate IS NULL
    AND DATEDIFF(CURDATE(), R.BorrowDate) > 14
    AND NOT EXISTS (
      SELECT 1 FROM Notification N
      WHERE N.MemberID = R.MemberID
        AND N.Message LIKE CONCAT('%', B.BookTitle, '%')
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CheckUpcomingReservationAndForceReturn` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CheckUpcomingReservationAndForceReturn`()
BEGIN
  INSERT INTO Notification (MemberID, Message, NotifyDate)
  SELECT
    R.MemberID,
    CONCAT('您所借閱的《', B.BookTitle, '》已被其他會員預約，請於 ',
           DATE_SUB(RS.ReserveDate, INTERVAL 1 DAY),
           ' 前歸還，避免影響他人借閱權益。') AS Message,
    NOW()
  FROM Record R
  JOIN Book B ON R.BookID = B.BookID
  JOIN Reservation RS ON R.BookID = RS.BookID
  WHERE R.ReturnDate IS NULL
    AND DATE_SUB(RS.ReserveDate, INTERVAL 1 DAY) = CURDATE()
    AND R.BorrowDate < RS.ReserveDate;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ReserveBook` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ReserveBook`(
  IN p_MemberID INT,
  IN p_BookID INT,
  IN p_ReserveDate DATE
)
BEGIN
  DECLARE book_status VARCHAR(20);
  DECLARE already_reserved INT;

  SELECT BookStatus INTO book_status
  FROM Book
  WHERE BookID = p_BookID;

  IF book_status IS NULL THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = '書籍不存在。';

  ELSEIF book_status != '已借出' THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = '此書目前未借出，無需預約。';

  ELSE
    SELECT COUNT(*) INTO already_reserved
    FROM Reservation
    WHERE MemberID = p_MemberID AND BookID = p_BookID;

    IF already_reserved > 0 THEN
      SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = '您已預約過此書，請勿重複預約。';
    ELSE
      INSERT INTO Reservation (MemberID, BookID, ReserveDate)
      VALUES (p_MemberID, p_BookID, p_ReserveDate);
    END IF;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ReturnBook` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ReturnBook`(
  IN p_MemberID INT,
  IN p_BookID INT,
  IN p_ReturnDate DATE
)
BEGIN
  DECLARE v_RecordID INT;
  DECLARE v_AlreadyReturned BOOLEAN;

  -- 找出尚未歸還的借閱紀錄
  SELECT RecordID INTO v_RecordID
  FROM Record
  WHERE MemberID = p_MemberID
    AND BookID = p_BookID
    AND ReturnDate IS NULL
  ORDER BY BorrowDate DESC
  LIMIT 1;

  -- 若找不到未歸還的紀錄
  IF v_RecordID IS NULL THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = '查無此會員與書籍的借閱紀錄或已歸還。';
  END IF;

  -- 確認是否已還書（理論上不會進來）
  SELECT (ReturnDate IS NOT NULL) INTO v_AlreadyReturned
  FROM Record
  WHERE RecordID = v_RecordID;

  IF v_AlreadyReturned THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = '該書已經歸還，無需重複操作。';
  END IF;

  -- 更新 ReturnDate
  UPDATE Record
  SET ReturnDate = p_ReturnDate
  WHERE RecordID = v_RecordID;

  -- 書籍狀態改為可借閱
  UPDATE Book
  SET BookStatus = '可借閱'
  WHERE BookID = p_BookID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `borrowedbooks`
--

/*!50001 DROP VIEW IF EXISTS `borrowedbooks`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `borrowedbooks` AS select `r`.`RecordID` AS `RecordID`,`m`.`MemberName` AS `MemberName`,`b`.`BookTitle` AS `BookTitle`,`r`.`BorrowDate` AS `BorrowDate` from ((`record` `r` join `member` `m` on((`r`.`MemberID` = `m`.`MemberID`))) join `book` `b` on((`r`.`BookID` = `b`.`BookID`))) where (`r`.`ReturnDate` is null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `overduebooks`
--

/*!50001 DROP VIEW IF EXISTS `overduebooks`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `overduebooks` AS select `r`.`RecordID` AS `RecordID`,`m`.`MemberName` AS `MemberName`,`b`.`BookTitle` AS `BookTitle`,`r`.`BorrowDate` AS `BorrowDate`,(to_days(curdate()) - to_days(`r`.`BorrowDate`)) AS `DaysBorrowed` from ((`record` `r` join `member` `m` on((`r`.`MemberID` = `m`.`MemberID`))) join `book` `b` on((`r`.`BookID` = `b`.`BookID`))) where ((`r`.`ReturnDate` is null) and ((to_days(curdate()) - to_days(`r`.`BorrowDate`)) > 14)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `recordsummary`
--

/*!50001 DROP VIEW IF EXISTS `recordsummary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `recordsummary` AS select `r`.`RecordID` AS `RecordID`,`m`.`MemberName` AS `MemberName`,`b`.`BookTitle` AS `BookTitle`,`r`.`BorrowDate` AS `BorrowDate`,`r`.`ReturnDate` AS `ReturnDate` from ((`record` `r` join `member` `m` on((`r`.`MemberID` = `m`.`MemberID`))) join `book` `b` on((`r`.`BookID` = `b`.`BookID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-03 11:55:15
