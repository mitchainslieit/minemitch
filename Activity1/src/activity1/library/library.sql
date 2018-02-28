CREATE DATABASE  IF NOT EXISTS `library` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `library`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: library
-- ------------------------------------------------------
-- Server version	5.7.14

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
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book` (
  `bookid` int(11) NOT NULL AUTO_INCREMENT,
  `book_title` varchar(45) NOT NULL,
  `book_auth` varchar(45) NOT NULL,
  PRIMARY KEY (`bookid`),
  UNIQUE KEY `bookid_UNIQUE` (`bookid`),
  UNIQUE KEY `book_title_UNIQUE` (`book_title`),
  UNIQUE KEY `book_auth_UNIQUE` (`book_auth`)
) ENGINE=InnoDB AUTO_INCREMENT=211 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (201,'Wicked Abyss','Kresly Cole'),(202,'Breathless','Beverly Jenkins'),(203,'Illegal Contact','Santino Hassell'),(204,'An Extraordinary Union','Alyssa Cole'),(205,'The day of the Duchess','Sarah MacLean'),(206,'Public Relations','Katie Heaney'),(207,'Strawberry Summer','Melissa Brayden'),(208,'Dating you','Christina Lauren'),(209,'Wrong to need you','Alisha Rai'),(210,'The Duchess Deal','Tessa Dare');
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrower`
--

DROP TABLE IF EXISTS `borrower`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `borrower` (
  `borrid` int(11) NOT NULL AUTO_INCREMENT,
  `borrname` varchar(45) NOT NULL,
  PRIMARY KEY (`borrid`),
  UNIQUE KEY `borrid_UNIQUE` (`borrid`),
  UNIQUE KEY `borrname_UNIQUE` (`borrname`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrower`
--

LOCK TABLES `borrower` WRITE;
/*!40000 ALTER TABLE `borrower` DISABLE KEYS */;
INSERT INTO `borrower` VALUES (2,'Adrian Galiste'),(3,'Gian Cabrera'),(1,'Mitch Galatcha');
/*!40000 ALTER TABLE `borrower` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logs` (
  `bookid` int(11) NOT NULL,
  `borrid` int(11) NOT NULL,
  `borr_date` varchar(45) NOT NULL,
  PRIMARY KEY (`bookid`,`borrid`),
  KEY `borrid_idx` (`borrid`),
  CONSTRAINT `bookid` FOREIGN KEY (`bookid`) REFERENCES `book` (`bookid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `borrid` FOREIGN KEY (`borrid`) REFERENCES `borrower` (`borrid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
INSERT INTO `logs` VALUES (201,1,'01-05-2017'),(201,2,'01-06-2017'),(202,2,'01-07-2017'),(202,3,'01-07-2017'),(203,1,'01-05-2018'),(203,2,'02-27-2018'),(204,1,'02-27-2018'),(204,3,'02-28-2018'),(205,1,'04-01-2018'),(205,2,'03-01-2018'),(206,1,'04-05-2018'),(206,2,'04-06-2018'),(206,3,'04-06-2018'),(207,2,'05-05-2018'),(208,1,'05-16-2018'),(208,3,'05-17-2018'),(209,1,'05-23-2018'),(210,2,'06-01-2018');
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-17 12:02:22
