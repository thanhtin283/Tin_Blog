-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: blog
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nameCategories` varchar(50) NOT NULL,
  `creator` varchar(50) NOT NULL DEFAULT 'Admin',
  `dateCreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `finalEditor` varchar(50) DEFAULT 'Admin',
  `lastModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Javascript','rong9x','2019-06-26 00:00:00','rong9x','2019-06-27 11:25:56'),(2,'Java','Admin','2019-06-27 11:29:55','Admin','2019-06-27 11:29:55'),(4,'Python','Admin','2019-06-27 11:30:27','Admin','2019-06-27 11:30:27');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contents` text NOT NULL,
  `dateCreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `idUsers` int(11) DEFAULT NULL,
  `idPosts` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idPosts` (`idPosts`),
  KEY `idUsers` (`idUsers`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`idPosts`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`idUsers`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,'noi dung comment','2019-06-27 08:37:08','2019-06-27 08:37:08',1,1),(2,'comment thu 2','2019-06-27 10:59:41','2019-06-27 10:59:41',1,1),(5,'123','2019-06-29 06:37:01','2019-06-29 06:37:01',4,1),(13,'meo tam 1 tuan 2 lan','2019-06-29 08:58:51','2019-06-29 08:58:51',6,2),(14,'good blog','2019-06-29 09:06:50','2019-06-29 09:06:50',6,4),(15,'cmt chinh sua','2019-06-29 09:51:58','2019-06-29 09:51:58',5,2),(16,'meo tam 1 tuan 2 lan','2019-06-29 10:16:50','2019-06-29 10:16:50',8,2),(17,'mèo tắm','2019-07-01 08:05:40','2019-07-01 08:05:40',NULL,NULL),(18,'123','2019-07-01 10:28:02','2019-07-01 10:28:02',6,1);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `introduce` text NOT NULL,
  `content` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `creator` varchar(50) NOT NULL DEFAULT 'rong9x',
  `dateCreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `finalEditor` varchar(50) DEFAULT NULL,
  `lastModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `idCategories` int(11) NOT NULL,
  `idUsers` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idCategories` (`idCategories`),
  KEY `idUsers` (`idUsers`),
  CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`idCategories`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`idUsers`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'Java','Introduce of Java','Introduce of Java Introduce of Java Introduce of Java Introduce of Java','https://www.technotification.com/wp-content/uploads/2016/07/Why-is-Java-the-best-programming-Language.png','rong9x','2019-06-26 00:00:00',NULL,'2019-06-26 00:00:00',1,1),(2,'PreparedStatement trong java','PreparedStatement trong java PreparedStatement trong java PreparedStatement trong java','PreparedStatement trong java PreparedStatement trong java PreparedStatement trong java\r\nPreparedStatement trong java PreparedStatement trong java PreparedStatement trong java\r\nPreparedStatement trong java PreparedStatement trong java PreparedStatement trong java\r\nPreparedStatement trong java PreparedStatement trong java PreparedStatement trong java','https://techtalk.vn/wp-content/uploads/2018/11/javascript-696x391.png','rong9x','2019-06-26 14:56:53',NULL,'2019-06-26 14:56:53',1,1),(4,'Java Tutorial','Java is a programming language. Java is used to develop mobile apps, web apps, desktop apps, games and much more.','Java is a programming language. Java is used to develop mobile apps, web apps, desktop apps, games and much more.\r\nJava is a programming language. Java is used to develop mobile apps, web apps, desktop apps, games and much more.\r\nJava is a programming language. Java is used to develop mobile apps, web apps, desktop apps, games and much more.','https://www.technotification.com/wp-content/uploads/2016/07/Why-is-Java-the-best-programming-Language.png','rong9x','2019-06-27 14:41:21',NULL,'2019-06-27 14:41:21',2,1),(5,'PHP 5 Tutorial','PHP is a server scripting language, and a powerful tool for making dynamic and interactive Web pages. PHP is a widely-used, free, and efficient alternative to competitors such as Microsoft\'s ASP.','PHP is a server scripting language, and a powerful tool for making dynamic and interactive Web pages. PHP is a widely-used, free, and efficient alternative to competitors such as Microsoft\'s ASP.\r\nPHP is a server scripting language, and a powerful tool for making dynamic and interactive Web pages. PHP is a widely-used, free, and efficient alternative to competitors such as Microsoft\'s ASP.\r\nPHP is a server scripting language, and a powerful tool for making dynamic and interactive Web pages. PHP is a widely-used, free, and efficient alternative to competitors such as Microsoft\'s ASP.','https://i.udemycdn.com/course/750x422/913448_e6e2.jpg','rong9x','2019-06-27 14:43:31',NULL,'2019-06-27 14:43:31',4,1),(6,'Python','                        Lap Trinh Python\r\n                    ','                        Lap Trinh Python Lap Trinh Python Lap Trinh Python Lap Trinh Python Lap Trinh Python Lap Trinh Python Lap Trinh Python Lap Trinh Python Lap Trinh Python Lap Trinh Python Lap Trinh Python Lap Trinh Python Lap Trinh Python Lap Trinh Python Lap Trinh Python Lap Trinh Python Lap Trinh Python Lap Trinh Python Lap Trinh Python Lap Trinh Python Lap Trinh Python Lap Trinh Python \r\n                    ','https://i.udemycdn.com/course/750x422/913448_e6e2.jpg','rong9x','2019-07-01 08:46:45','admin','2019-07-01 09:11:34',4,6);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role` varchar(15) NOT NULL DEFAULT 'user',
  `salt` varchar(33) NOT NULL,
  `image` varchar(255) NOT NULL DEFAULT 'noavatar.png',
  `creator` varchar(50) DEFAULT 'user',
  `dateCreated` datetime DEFAULT CURRENT_TIMESTAMP,
  `finalEditor` varchar(50) DEFAULT NULL,
  `lastModifiedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'rong9x','123','admin','','null','1','2019-06-25 00:00:00','1','2019-06-25 00:00:00'),(2,'hai','123456','user','ewq','null','1','2019-06-25 00:00:00','1','2019-06-25 00:00:00'),(3,'nhat','BE49682E5883C40D29D44891F0D95FD1','user','ÂGˆ`Õ£','noavatar.png','user','2019-06-27 09:00:15',NULL,NULL),(4,'nhat2508','C203D4DE356528618626901F98F63AC2','admin','ÙâZ9@Ô','noavatar.png','user','2019-06-27 20:45:08',NULL,'2019-06-27 20:45:08'),(5,'nhat123','9A40657B6096C35A88C01062C805F8FB','user','ôn�‘','noavatar.png','user','2019-06-27 20:46:40',NULL,'2019-06-27 20:46:40'),(6,'admin','E56EE12838439FF0DD02C9084C05513A','admin','ÍUßr¢I','noavatar.png','admin','2019-06-27 21:28:40',NULL,'2019-06-27 21:28:40'),(7,'nhat12345','E944FE30055B0B851E95BD47C52FC269','user','?•×‚·§\Z','noavatar.png','user','2019-06-28 15:52:13',NULL,'2019-06-28 15:52:13'),(8,'nhat111','6C542EED3E169766294257439D2F4B5B','user','~e¼Íðò¤','noavatar.png','user','2019-06-29 09:51:28',NULL,'2019-07-01 11:13:40'),(9,'topds110','F4C7031A933FC4EA975C2CC3546E1FFB','user','üU^ÌÕ�','noavatar.png','user','2019-06-30 23:02:59',NULL,'2019-06-30 23:02:59'),(10,'top111','95A014ACA0CA02D2116D8723DFF28C1B','user',' ï‹Jèƒ­','noavatar.png','user','2019-06-30 23:14:50',NULL,'2019-06-30 23:14:50'),(11,'topds111','BF3000964AC06E6B28FDB52E6AA7B7C2','user','‚‡„å–z','noavatar.png','user','2019-06-30 23:29:45',NULL,'2019-06-30 23:29:45');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-01 11:15:25
