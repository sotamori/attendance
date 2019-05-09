CREATE DATABASE  IF NOT EXISTS `attendancesystem` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `attendancesystem`;
-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: attendancesystem
-- ------------------------------------------------------
-- Server version	8.0.12

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
-- Table structure for table `assign_ltd`
--

DROP TABLE IF EXISTS `assign_ltd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `assign_ltd` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lecturer_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assign_ltd`
--

LOCK TABLES `assign_ltd` WRITE;
/*!40000 ALTER TABLE `assign_ltd` DISABLE KEYS */;
INSERT INTO `assign_ltd` VALUES (2,5,1),(3,7,1),(4,8,1),(9,9,2),(10,10,2),(17,4,1),(18,6,1),(19,11,2),(20,12,2),(21,13,2),(22,14,3),(23,15,3),(24,22,3),(25,23,3),(26,24,3);
/*!40000 ALTER TABLE `assign_ltd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assign_stc`
--

DROP TABLE IF EXISTS `assign_stc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `assign_stc` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=340 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assign_stc`
--

LOCK TABLES `assign_stc` WRITE;
/*!40000 ALTER TABLE `assign_stc` DISABLE KEYS */;
INSERT INTO `assign_stc` VALUES (38,1,1),(39,2,1),(40,3,1),(41,4,1),(42,5,1),(43,1,2),(44,2,2),(45,3,2),(46,4,2),(47,5,2),(48,1,3),(49,2,3),(50,3,3),(51,4,3),(52,5,3),(53,1,4),(54,2,4),(55,3,4),(56,4,4),(57,5,4),(58,1,5),(59,2,5),(60,3,5),(61,4,5),(62,5,5),(63,1,6),(64,2,6),(65,3,6),(66,4,6),(67,5,6),(68,1,7),(69,2,7),(70,3,7),(71,4,7),(72,5,7),(73,1,8),(74,2,8),(75,3,8),(76,4,8),(77,5,8),(78,1,9),(79,2,9),(80,3,9),(81,4,9),(82,5,9),(83,1,10),(84,2,10),(85,3,10),(86,4,10),(87,5,10),(88,1,11),(89,2,11),(90,3,11),(91,4,11),(92,5,11),(93,1,12),(94,2,12),(95,3,12),(96,4,12),(97,5,12),(98,1,13),(99,2,13),(100,3,13),(101,4,13),(102,5,13),(103,1,14),(104,2,14),(105,3,14),(106,4,14),(107,5,14),(108,1,15),(109,2,15),(110,3,15),(111,4,15),(112,5,15),(113,1,16),(114,2,16),(115,3,16),(116,4,16),(117,5,16),(118,1,17),(119,2,17),(120,3,17),(121,4,17),(122,5,17),(123,1,18),(124,2,18),(125,3,18),(126,4,18),(127,5,18),(128,1,19),(129,2,19),(130,3,19),(131,4,19),(132,5,19),(133,1,20),(134,2,20),(135,3,20),(136,4,20),(137,5,20),(138,6,21),(139,7,21),(140,8,21),(141,9,21),(142,10,21),(143,6,25),(144,7,25),(145,8,25),(146,9,25),(147,10,25),(148,6,22),(149,7,22),(150,8,22),(151,9,22),(152,10,22),(153,6,28),(154,7,28),(155,8,28),(156,9,28),(157,10,28),(158,6,29),(159,7,29),(160,8,29),(161,9,29),(162,10,29),(165,6,30),(166,7,30),(167,8,30),(168,9,30),(169,10,30),(170,6,31),(171,7,31),(172,8,31),(173,9,31),(174,10,31),(175,6,32),(176,7,32),(177,8,32),(178,9,32),(179,10,32),(180,6,33),(181,7,33),(182,8,33),(183,9,33),(184,10,33),(185,6,34),(186,7,34),(187,8,34),(188,9,34),(189,10,34),(190,6,35),(191,7,35),(192,8,35),(193,9,35),(194,10,35),(195,6,36),(196,7,36),(197,8,36),(198,9,36),(199,10,36),(200,6,37),(201,7,37),(202,8,37),(203,9,37),(204,10,37),(205,6,38),(206,7,38),(207,8,38),(208,9,38),(209,10,38),(210,6,39),(211,7,39),(212,8,39),(213,9,39),(214,10,39),(215,6,40),(216,7,40),(217,8,40),(218,9,40),(219,10,40),(220,6,41),(221,7,41),(222,8,41),(223,9,41),(224,10,41),(225,6,42),(226,7,42),(227,8,42),(228,9,42),(229,10,42),(230,6,43),(231,7,43),(232,8,43),(233,9,43),(234,10,43),(235,6,44),(236,7,44),(237,8,44),(238,9,44),(239,10,44),(240,11,45),(241,12,45),(242,13,45),(243,14,45),(244,15,45),(245,11,46),(246,12,46),(247,13,46),(248,14,46),(249,15,46),(250,11,47),(251,12,47),(252,13,47),(253,14,47),(254,15,47),(255,11,48),(256,12,48),(257,13,48),(258,14,48),(259,15,48),(260,11,49),(261,12,49),(262,13,49),(263,14,49),(264,15,49),(265,11,50),(266,12,50),(267,13,50),(268,14,50),(269,15,50),(270,11,51),(271,12,51),(272,13,51),(273,14,51),(274,15,51),(275,11,52),(276,12,52),(277,13,52),(278,14,52),(279,15,52),(280,11,53),(281,12,53),(282,13,53),(283,14,53),(284,15,53),(285,11,54),(286,12,54),(287,13,54),(288,14,54),(289,15,54),(290,11,55),(291,12,55),(292,13,55),(293,14,55),(294,15,55),(295,11,56),(296,12,56),(297,13,56),(298,14,56),(299,15,56),(300,11,57),(301,12,57),(302,13,57),(303,14,57),(304,15,57),(305,11,58),(306,12,58),(307,13,58),(308,14,58),(309,15,58),(310,11,59),(311,12,59),(312,13,59),(313,14,59),(314,15,59),(315,11,60),(316,12,60),(317,13,60),(318,14,60),(319,15,60),(320,11,61),(321,12,61),(322,13,61),(323,14,61),(324,15,61),(325,11,62),(326,12,62),(327,13,62),(328,14,62),(329,15,62),(330,11,63),(331,12,63),(332,13,63),(333,14,63),(334,15,63),(335,11,64),(336,12,64),(337,13,64),(338,14,64),(339,15,64);
/*!40000 ALTER TABLE `assign_stc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `attendance` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(45) NOT NULL,
  `class_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `date` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
INSERT INTO `attendance` VALUES (44,'Present',4,1,'2018-08-25'),(45,'Present',4,2,'2018-08-25'),(46,'Absent',4,3,'2018-08-25'),(47,'Present',4,4,'2018-08-25'),(48,'Present',4,5,'2018-08-25'),(49,'Present',4,6,'2018-08-25'),(50,'Present',4,7,'2018-08-25'),(51,'Present',4,8,'2018-08-25'),(52,'Present',4,9,'2018-08-25'),(53,'Present',4,10,'2018-08-25'),(54,'Present',4,11,'2018-08-25'),(55,'Present',4,12,'2018-08-25'),(56,'Present',4,13,'2018-08-25'),(57,'Present',4,14,'2018-08-25'),(58,'Present',4,15,'2018-08-25'),(59,'Absent',4,16,'2018-08-25'),(60,'Present',4,17,'2018-08-25'),(61,'Present',4,18,'2018-08-25'),(62,'Present',4,19,'2018-08-25'),(63,'Present',4,20,'2018-08-25');
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `classes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `department_id` int(11) NOT NULL,
  `lecturer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes`
--

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` VALUES (1,'EPDA',1,4),(2,'ALG',1,5),(3,'OOPJ',1,8),(4,'COMP',1,7),(5,'APLC',1,6),(6,'IR',2,9),(7,'PDT',2,10),(8,'EDA',2,11),(9,'AF',2,12),(10,'IBR',2,13),(11,'BMO',3,12),(12,'CTP',3,15),(13,'ASOA',3,22),(14,'BOS',3,23),(15,'CROP',3,24);
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `lecturer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'School of Computing',1),(2,'School of Business',2),(3,'School of Medecine',3);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lecturers`
--

DROP TABLE IF EXISTS `lecturers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `lecturers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `gender` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `IC` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lecturers`
--

LOCK TABLES `lecturers` WRITE;
/*!40000 ALTER TABLE `lecturers` DISABLE KEYS */;
INSERT INTO `lecturers` VALUES (1,'Ehsan Rana','Male','01173564882','783541','ehsan@mail.com','15 avenue'),(2,'Lee Kai Wen','Male','01187533562','120846','kelvin@mail.com','11 avenue'),(3,'Tanveer Mubarak','Male','01184563422','894563','tanveer@mail.com','19 avenue'),(4,'Almira Nurkasim','Female','01178456273','389465','almira@mail.com','103 avenue'),(5,'Nurul Aslan','Female','01187643861','974658','nurul@mail.com','4 avenue'),(6,'Aslbek','Male','01863746589','818271','asl@mail.com','60 avenue'),(7,'Qadr Soplya','Male','01987636478','000','qadr@mail.com','81 avenue'),(8,'Bauberik','Male','01178346782','197499','bau@mail.com','92 avenue'),(9,'Anya Sevchuk','Female','01167390174','014284','anya@mail.com','37 avenue'),(10,'Nikita','Male','01983650163','800192','nikita@mail.com','69 avenue'),(11,'Sardar','Male','01936784901','278456','sardar@mail.com','73 avenue'),(12,'John Smith','Male','01934562783','890164','smith@mail.com','24 avenue'),(13,'Lev Tolstoy','Male','03418908239','104537','lev@mail.com','81 avenue'),(14,'Taylor Woodu','Male','01826773781','901645','taylor@mail.com','32 avenue'),(15,'Gabit Musrepov','Male','01184563721','973456','gabit@mail.com','56 avenue'),(22,'Ahmet Asqar','Male','01983755364','028467','ahat@mail.com','20 avenue'),(23,'Marina Malina','Female','01983647635','902645','malina@mail.com','51 avenue'),(24,'Homiya Falaka','Female','01893746572','902784','homiya@mail.com','71 avenue');
/*!40000 ALTER TABLE `lecturers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `students` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `gender` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `IC` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'Adlet Qairangazy','Male','01823455667','129456','adlet@mail.com','99 avenue'),(2,'Saule','Female','01167543362','198635','saule@mail.com','3 avenue'),(3,'Ainur','Female','01288564362','157341','ainur@mail.com','32 avenue'),(4,'Balausa','Female','01983456738','835673','bal@mail.com','45 avenue'),(5,'Ahmad','Male','01867345672','845678','ahmadl@mail.com','19 avenue'),(6,'Sarbaz','Male','01827425384','000','sarbaz@mail.com','904 avenue'),(7,'Shaxzod','Male','01897623459','903765','shax@mail.com','23 avenue'),(8,'Alexandr','Male','01926456734','124295','alex@mail.com','47 avenue'),(9,'Qairat','Male','01176348923','017364','qaira@mail.com','72 avenue'),(10,'Adil','Male','01187638458','186457','adilka@mail.com','70 avenue'),(11,'Degdar','Male','01983458924','193644','diga@mail.com','58 avenue'),(12,'Rauan','Male','01131458674','884722','rauch@mail.com','33 avenue'),(13,'Didara','Female','01973459267','274657','didara@mail.com','21 avenue'),(14,'Aisaule','Female','01998076384','927492','aisaule@mail.com','58 avenue'),(15,'Medet','Male','01893667586','184357','medet@mail.com','390 avenue'),(16,'Ahmet Farukh','Male','01173563432','789023','fara12@mail.com','56 avenue'),(17,'Aset Rahman','Male','01993734567','673489','rahman@mail.ru','92 avenue'),(18,'Meiramgul','Female','19673456731','275230','meiramgul@mail.com','19 avenue'),(19,'Batima Rasul','Female','0116735923','104592','batimarasul@mail.com','48 avenue'),(20,'Hamit Hasan','Male','01183902738','106734','hamithasan@mail.com','24 avenue'),(21,'Hooma Airan','Male','01198736478','847068','hoomaairan@mail.com','104 avenue'),(22,'Alim Sailau','Male','01186364783','988471','alimsailau@mail.com','19 avenue'),(25,'Gambit Olegov','Male','01982674892','094658','gambit@mail.com','61 avenue'),(28,'Artur Mafa','Male','45345435','167345','arturchik@mail.com','20 avenue'),(29,'Safuan Hua','Male','33532432443','244633','safauns@mail.com','81 avenue'),(30,'Gaolima Holika','Male','325234324','23432423','holukagiko@mail.com','824 avenue'),(31,'Muchaho Nookira','Feale','2634543234','2244345435','nokijara@mail.com','89 avenue'),(32,'Hikolokuma Hookiyawa','Male','254653234','734343','ffsdf@mail.com','4 avenue'),(33,'Vikto Sapkolskiy','Male','23423432434','32554','dsfdsf@mail.com','7 avenue'),(34,'Gurusomara Tokijo','Female','23434234324','786463','sdff@mail.com','7 avenue'),(35,'Herolisuma','Male','234324344','2345635','gfdga@mail.com','2 avenue'),(36,'Karandash','Female','7868786','23576','asfrdgwr@mail.com','67 avenue'),(37,'Ruchka','Male','12312445644','23456','fwfwef@mail.com','24 avenue'),(38,'Klaviatura','Male','124676524','8724245','fewgwrf@mail.com','73 avenue'),(39,'Okno Zabor','Female','6872356765756','45567','efrwfwrf@mail.com','67 avenue'),(40,'Kakayato','Male','6346768324234','1475674','fafhet@mail.com','71 avenue'),(41,'Chernyiy','Male','4667785345242','833424','fewgw@mail.com','36 avenue'),(42,'Grusha','Male','909768545234','324457','hyturw@mail.com','62 avenue'),(43,'Maketoka','Female','3243656576876','906724','qrfreerf@mail.com','56 avenue'),(44,'Ohana Mohana','Male','34235465757','256468','wer43r@mail.com','74 avenue'),(45,'Baha Maha','Male','','765423','fdsgrs@mail.com','24 avenue'),(46,'Ainagul Masik','Female','','FDG453','sdvshhj@mail.com','67 avenue'),(47,'Bagdaulet','Male','','334232','dsafh@mail.com','324 avenue'),(48,'Irina Dronova','Female','','45H343','bhjthgref@mail.com','7 avenue'),(49,'Aibara Saparov','Male','','87VGF54','sgdge@mail.com','14 avenue'),(50,'Isatik','Female','','234F564','iulyis@mail.com','52 avenue'),(51,'Ainurchik','Female','','735G436','gtrrsf@mail.com','26 avenue'),(52,'Erbolat','Male','','U7483D','weftehe@mail.com','73 avenue'),(53,'Adil Kasha','Male','','345FHSOI','gethwfw@mail.com','23 avenue'),(54,'Olzhas','Male','','65FDG3','weguykuy@mail.com','13 avenue'),(55,'Sapargali','Male','','32YT45','geweggt@mail.com','15 avenue'),(56,'Diga Diga','Male','','9IUH24D','wegyui57@mail.com','73 avenue'),(57,'Tansholpan','Female','','76YG3D','kujtyv@mail.com','26 avenue'),(58,'Elshasik','Male','','3TERG56','sdfgyui5@mail.com','42 avenue'),(59,'Toqtar','Male','','657GER34','rgyuwf@mail.com','68 avenue'),(60,'Gulnar','Female','','3EF445','ewttyut@mail.com','10 avenue'),(61,'Janik Manik','Male','','324RER','ewtuu@mail.com','32 avenue'),(62,'Ferikimatona','Male','','435345','efyjt7w@mail.com','53 avenue'),(63,'Ulsar','Male','','F4R453','gbu6efr@mail.com','56 avenue'),(64,'Isma','Male','','RERG53','wekudg@mail.com','34 avenue');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-08-25 19:12:17
