-- MySQL dump 10.13  Distrib 5.6.24, for osx10.8 (x86_64)
--
-- Host: 127.0.0.1    Database: the_wall
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
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_comments_users_idx` (`user_id`),
  KEY `fk_comments_messages1_idx` (`message_id`),
  CONSTRAINT `fk_comments_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_comments_messages1` FOREIGN KEY (`message_id`) REFERENCES `messages` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,2,1,'Hunting sux!','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2,1,1,'Fishing sux!','0000-00-00 00:00:00','0000-00-00 00:00:00'),(3,5,16,'asdfasdf','2015-11-11 13:08:15','2015-11-11 13:08:15'),(4,1,16,'first!','2015-11-11 13:08:25','2015-11-11 13:08:25'),(5,1,16,'Darn, never mind!','2015-11-11 13:08:34','2015-11-11 13:08:34'),(6,7,17,'','2015-11-11 13:23:15','2015-11-11 13:23:15'),(7,7,17,'Yay!','2015-11-11 13:23:18','2015-11-11 13:23:18');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `message` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_messages_users1_idx` (`user_id`),
  CONSTRAINT `fk_messages_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,2,'Hi I like fishing. This is my message.','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2,1,'I prefer hunting, but fishing is pretty sweet','0000-00-00 00:00:00','0000-00-00 00:00:00'),(4,16,'asdasdf','2015-11-11 13:06:26','2015-11-11 13:06:26'),(5,16,'asdfdas','2015-11-11 13:07:02','2015-11-11 13:07:02'),(6,16,'','2015-11-11 13:14:39','2015-11-11 13:14:39'),(7,17,'Weeeeeeeeeeeeeeeeeee!!!','2015-11-11 13:23:12','2015-11-11 13:23:12');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'John','Johnson','john@example.com','$2b$12$XJXmz3xZSD6JeBIIxIWs2e3WwAk4ZB2rA2qFa2zk3qNMJotYaNlNu','2015-11-10 19:44:23','2015-11-10 19:44:23'),(2,'Allen','Cz','allen@example.com','$2b$12$oxTjATXmMaXjxmqQp5/L.OLozjChNI3w6ORvCLVoV4NSY5uk1C1cK','2015-11-10 20:39:12','2015-11-10 20:39:12'),(12,'asdf','asdf','allen2z@example.com','$2b$12$BreznJ/QcnzJZiO758FBYuJbQtvMiUXZ0NsW.9nSm37F75cl2QGZm','2015-11-11 07:46:55','2015-11-11 07:46:55'),(13,'Lame','Commenter','lame@example.com','$2b$12$MCvUd15Wrf.msDhsuB3jjueA8hZHLVWk0mUNlyozvVv.wbCU.UV7G','2015-11-11 07:48:18','2015-11-11 07:48:18'),(14,'Billz','Thrillz','billzthrillz@example.com','$2b$12$DqO8YQf2IDX7Z7PfhCfxWe2IU1I0NGNFB9y47az1gvtTft9dH5cp.','2015-11-11 08:47:14','2015-11-11 08:47:14'),(15,'Thrillz','Billz','thrillzbillz@example.com','$2b$12$3F4cLnj/Q6POlytP0aG5e.vq5nzX9J4glCfwLgD/EDYaWYjxGU2wK','2015-11-11 08:49:22','2015-11-11 08:49:22'),(16,'Jennifer','Jones','jennifer@jones.com','$2b$12$uCMXrzrbezt6m.NFjKtCl.CgfWmCR8usOLWRaNGf19HGLCiGWSDzi','2015-11-11 12:32:54','2015-11-11 12:32:54'),(17,'Billyzz','ZZZZ','billyzzzz@example.com','$2b$12$MzILivAGelOo/Rh3Mh4BpO2cm34297676q3hqhKe5n7ePUFmwaR5G','2015-11-11 13:22:58','2015-11-11 13:22:58');
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

-- Dump completed on 2015-11-11 13:24:13
