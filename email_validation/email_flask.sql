-- MySQL dump 10.13  Distrib 5.6.24, for osx10.8 (x86_64)
--
-- Host: 127.0.0.1    Database: email_flask
-- ------------------------------------------------------
-- Server version	5.5.42

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `emails`
--

DROP TABLE IF EXISTS `emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(90) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emails`
--

LOCK TABLES `emails` WRITE;
/*!40000 ALTER TABLE `emails` DISABLE KEYS */;
INSERT INTO `emails` VALUES (1,'asdasD','2015-11-09 15:03:18','2015-11-09 15:03:18'),(2,'ASDFASD','2015-11-09 15:04:09','2015-11-09 15:04:09'),(3,'hi@example.com','2015-11-09 15:07:38','2015-11-09 15:07:38'),(4,'aSD','2015-11-09 15:11:39','2015-11-09 15:11:39'),(5,'asdfasdf@example.com','2015-11-09 15:15:35','2015-11-09 15:15:35'),(6,'bob@example.com','2015-11-09 15:24:54','2015-11-09 15:24:54'),(7,'ask@example.com','2015-11-09 15:35:56','2015-11-09 15:35:56'),(8,'example@example.com','2015-11-09 15:37:31','2015-11-09 15:37:31'),(9,'example@example.com','2015-11-09 15:40:08','2015-11-09 15:40:08'),(10,'success@example.com','2015-11-09 15:40:18','2015-11-09 15:40:18'),(11,'asdf@example.com','2015-11-09 15:41:42','2015-11-09 15:41:42'),(12,'asdf@example.com','2015-11-09 15:42:39','2015-11-09 15:42:39'),(13,'asdf@example.com','2015-11-09 15:42:42','2015-11-09 15:42:42'),(14,'asdf@example.com','2015-11-09 15:43:21','2015-11-09 15:43:21'),(15,'asdfasdf@example.com','2015-11-09 15:43:28','2015-11-09 15:43:28'),(16,'asdf@example.com','2015-11-09 15:44:19','2015-11-09 15:44:19'),(17,'hi@example.com','2015-11-09 15:49:26','2015-11-09 15:49:26'),(18,'hi@lol.com','2015-11-09 15:50:47','2015-11-09 15:50:47'),(19,'hi@lol.com','2015-11-09 15:53:53','2015-11-09 15:53:53'),(20,'hi@lol.com','2015-11-09 15:53:55','2015-11-09 15:53:55'),(21,'hi@lol.com','2015-11-09 15:54:43','2015-11-09 15:54:43'),(22,'hi@lol.com','2015-11-09 15:55:20','2015-11-09 15:55:20'),(23,'hi@lol.com','2015-11-09 15:56:25','2015-11-09 15:56:25'),(24,'hi@lol.com','2015-11-09 16:00:45','2015-11-09 16:00:45'),(25,'hi@lol.com','2015-11-09 16:01:04','2015-11-09 16:01:04'),(26,'hi@lol.com','2015-11-09 16:02:08','2015-11-09 16:02:08'),(27,'asdf@example.com','2015-11-09 16:02:49','2015-11-09 16:02:49'),(28,'hi@lol.com','2015-11-09 16:03:20','2015-11-09 16:03:20'),(29,'hi@lol.com','2015-11-09 16:03:59','2015-11-09 16:03:59'),(30,'hi@lol.com','2015-11-09 16:04:29','2015-11-09 16:04:29'),(31,'hi@lol.com','2015-11-09 16:06:19','2015-11-09 16:06:19'),(32,'hi@lol.com','2015-11-09 16:06:59','2015-11-09 16:06:59'),(33,'hi@lol.com','2015-11-09 16:07:29','2015-11-09 16:07:29'),(34,'hi@lol.com','2015-11-09 16:07:46','2015-11-09 16:07:46'),(35,'hi@yayfinally.com','2015-11-09 16:07:57','2015-11-09 16:07:57'),(36,'hi@yayfinally.com','2015-11-09 16:08:21','2015-11-09 16:08:21'),(37,'sweet@wtf.com','2015-11-09 16:08:33','2015-11-09 16:08:33'),(38,'sweet@wtf.com','2015-11-09 16:08:38','2015-11-09 16:08:38'),(39,'sweet@wtf.com','2015-11-09 16:09:12','2015-11-09 16:09:12'),(40,'sweet@wtf.com','2015-11-09 16:09:29','2015-11-09 16:09:29'),(41,'sweet@wtf.com','2015-11-09 16:09:39','2015-11-09 16:09:39'),(42,'boo@goo.com','2015-11-09 16:27:34','2015-11-09 16:27:34'),(43,'boo@goo.com','2015-11-09 16:27:50','2015-11-09 16:27:50'),(44,'boo@goo.com','2015-11-09 16:34:57','2015-11-09 16:34:57'),(45,'sigh@sigh.com','2015-11-09 16:35:19','2015-11-09 16:35:19'),(46,'sigh@sigh.com','2015-11-09 16:35:53','2015-11-09 16:35:53'),(47,'maybe@probablynot.co','2015-11-09 16:36:32','2015-11-09 16:36:32'),(48,'maybe@probablynot.co','2015-11-09 16:41:58','2015-11-09 16:41:58'),(49,'maybe@probablynot.co','2015-11-09 16:42:06','2015-11-09 16:42:06'),(50,'maybe@probablynot.co','2015-11-09 16:42:10','2015-11-09 16:42:10'),(51,'maybe@probablynot.co','2015-11-09 16:42:30','2015-11-09 16:42:30'),(52,'maybe@probablynot.co','2015-11-09 16:42:48','2015-11-09 16:42:48'),(53,'maybe@probablynot.co','2015-11-09 16:44:54','2015-11-09 16:44:54'),(54,'hi@lol.com','2015-11-09 16:48:47','2015-11-09 16:48:47'),(55,'hi@lol.com','2015-11-09 16:49:01','2015-11-09 16:49:01'),(56,'hi@lol.com','2015-11-09 16:49:27','2015-11-09 16:49:27'),(57,'hi@lol.com','2015-11-09 16:49:37','2015-11-09 16:49:37');
/*!40000 ALTER TABLE `emails` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-09 17:01:12
