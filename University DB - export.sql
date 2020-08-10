CREATE DATABASE  IF NOT EXISTS `University` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `University`;
-- MySQL dump 10.13  Distrib 8.0.19, for macos10.15 (x86_64)
--
-- Host: 127.0.0.1    Database: University
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `Classroom`
--

DROP TABLE IF EXISTS `Classroom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Classroom` (
  `id` int NOT NULL,
  `building_code` int DEFAULT NULL,
  `room_number` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Classroom`
--

LOCK TABLES `Classroom` WRITE;
/*!40000 ALTER TABLE `Classroom` DISABLE KEYS */;
INSERT INTO `Classroom` VALUES (1,1001,1),(2,1002,16),(3,1003,17),(4,1004,24),(5,1005,36);
/*!40000 ALTER TABLE `Classroom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `College`
--

DROP TABLE IF EXISTS `College`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `College` (
  `name` char(50) NOT NULL,
  `main_office` char(50) DEFAULT NULL,
  `phone` char(12) DEFAULT NULL,
  `dean` char(50) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `College`
--

LOCK TABLES `College` WRITE;
/*!40000 ALTER TABLE `College` DISABLE KEYS */;
INSERT INTO `College` VALUES ('Kea1','L37','123456789','Jesper N'),('Kea2','L38','123456788','Maria I'),('Kea3','L16','123456787','Christian L'),('Kea4','L98','123456786','Christoffer K'),('Kea5','L101','123456781','Peter D');
/*!40000 ALTER TABLE `College` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `College_Department`
--

DROP TABLE IF EXISTS `College_Department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `College_Department` (
  `college_name` char(50) DEFAULT NULL,
  `department_code` int DEFAULT NULL,
  KEY `college_name` (`college_name`),
  KEY `department_code` (`department_code`),
  CONSTRAINT `college_department_ibfk_1` FOREIGN KEY (`college_name`) REFERENCES `College` (`name`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `college_department_ibfk_2` FOREIGN KEY (`department_code`) REFERENCES `Department` (`code_number`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `College_Department`
--

LOCK TABLES `College_Department` WRITE;
/*!40000 ALTER TABLE `College_Department` DISABLE KEYS */;
INSERT INTO `College_Department` VALUES ('Kea1',1678),('Kea2',2678),('Kea3',3678),('Kea1',4678),('Kea1',5678);
/*!40000 ALTER TABLE `College_Department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Course`
--

DROP TABLE IF EXISTS `Course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Course` (
  `name` char(50) DEFAULT NULL,
  `code_number` int NOT NULL,
  `level` int DEFAULT NULL,
  `credit_hours` int DEFAULT NULL,
  `description` char(100) DEFAULT NULL,
  PRIMARY KEY (`code_number`),
  UNIQUE KEY `name` (`name`),
  KEY `course_ibfk_1` (`level`),
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`level`) REFERENCES `level` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Course`
--

LOCK TABLES `Course` WRITE;
/*!40000 ALTER TABLE `Course` DISABLE KEYS */;
INSERT INTO `Course` VALUES ('Databases',1234,4,30,'description 1'),('Testing',1235,4,15,'description 2'),('Microservices',1236,4,10,'description 3'),('Android Game',1237,3,15,'description 4'),('Python',1238,3,10,'description 5');
/*!40000 ALTER TABLE `Course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Department`
--

DROP TABLE IF EXISTS `Department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Department` (
  `name` char(50) DEFAULT NULL,
  `code_number` int NOT NULL,
  `main_office` char(50) DEFAULT NULL,
  `phone` char(50) DEFAULT NULL,
  `chairman` char(50) DEFAULT NULL,
  `chairman_start_date` date DEFAULT NULL,
  PRIMARY KEY (`code_number`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `name_2` (`name`),
  UNIQUE KEY `name_3` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Department`
--

LOCK TABLES `Department` WRITE;
/*!40000 ALTER TABLE `Department` DISABLE KEYS */;
INSERT INTO `Department` VALUES ('Software Development',1678,'GBG','123456783','Martin M','2007-10-20'),('Web Development',2678,'GBG','123456786','Daniel E','2009-12-30'),('IT Security',3678,'GBG','123456781','Mark T','2008-02-08'),('Datamatiker',4678,'Lygten','123456788','Thomas S','2019-07-10'),('Computer Science',5678,'Lygten','123456789','Jakob P','2015-06-11');
/*!40000 ALTER TABLE `Department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Instructor`
--

DROP TABLE IF EXISTS `Instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Instructor` (
  `id` int NOT NULL,
  `name` char(50) DEFAULT NULL,
  `office` char(50) DEFAULT NULL,
  `phone` char(50) DEFAULT NULL,
  `inst_rank` char(50) DEFAULT NULL,
  `department_code` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `department_code` (`department_code`),
  CONSTRAINT `instructor_ibfk_1` FOREIGN KEY (`department_code`) REFERENCES `Department` (`code_number`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Instructor`
--

LOCK TABLES `Instructor` WRITE;
/*!40000 ALTER TABLE `Instructor` DISABLE KEYS */;
INSERT INTO `Instructor` VALUES (7,'Andrea Corradini','Norrebro','123456789','1',1678),(12,'Arturo M','Norrebro','123456787','2',2678),(31,'Kristoffer Mikklas','Norrebro','123456782','2',2678),(67,'Christian K','Norrebro','123456784','3',4678),(90,'Jon','Norrebro','123456781','5',1678);
/*!40000 ALTER TABLE `Instructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Level`
--

DROP TABLE IF EXISTS `Level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Level` (
  `id` int NOT NULL,
  `level_name` char(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Level`
--

LOCK TABLES `Level` WRITE;
/*!40000 ALTER TABLE `Level` DISABLE KEYS */;
INSERT INTO `Level` VALUES (1,'Freshman'),(2,'Sophomore'),(3,'Junior'),(4,'Senior'),(5,'MS'),(6,'PhD');
/*!40000 ALTER TABLE `Level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Section`
--

DROP TABLE IF EXISTS `Section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Section` (
  `id` int NOT NULL,
  `course_code` int DEFAULT NULL,
  `instructor_id` int DEFAULT NULL,
  `number` int DEFAULT NULL,
  `semester` char(50) DEFAULT NULL,
  `year` int DEFAULT NULL,
  `classroom_id` int DEFAULT NULL,
  `days_times` char(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_code` (`course_code`),
  KEY `instructor_id` (`instructor_id`),
  KEY `classroom_id` (`classroom_id`),
  CONSTRAINT `section_ibfk_1` FOREIGN KEY (`course_code`) REFERENCES `Course` (`code_number`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `section_ibfk_2` FOREIGN KEY (`instructor_id`) REFERENCES `Instructor` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `section_ibfk_3` FOREIGN KEY (`classroom_id`) REFERENCES `Classroom` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Section`
--

LOCK TABLES `Section` WRITE;
/*!40000 ALTER TABLE `Section` DISABLE KEYS */;
INSERT INTO `Section` VALUES (1,1234,7,10,'1',2020,5,'TuWeTh 9:00 AM - 12:00 AM'),(2,1235,31,11,'2',2018,1,'MoTuFr 9:00 AM - 14:00 AM'),(3,1236,12,12,'3',2016,3,'TuWeTh 9:00 AM - 10:00 AM'),(4,1237,67,13,'4',2018,4,'MoTuFr 9:00 AM - 14:00 AM'),(5,1238,90,14,'5',2019,1,'TuWeTh 9:00 AM - 12:00 AM');
/*!40000 ALTER TABLE `Section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Student`
--

DROP TABLE IF EXISTS `Student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Student` (
  `id` int NOT NULL,
  `name` char(50) DEFAULT NULL,
  `first_name` char(50) DEFAULT NULL,
  `middle_name` char(50) DEFAULT NULL,
  `last_name` char(50) DEFAULT NULL,
  `address` char(50) DEFAULT NULL,
  `phone` char(50) DEFAULT NULL,
  `major_code` char(50) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `department_code` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `department_code` (`department_code`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`department_code`) REFERENCES `Department` (`code_number`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Student`
--

LOCK TABLES `Student` WRITE;
/*!40000 ALTER TABLE `Student` DISABLE KEYS */;
INSERT INTO `Student` VALUES (1,'Paul Panaitescu','Paul',NULL,'Panaitescu','Albertslund','087654321','1111','1900-10-20',1678),(2,'Constantin Razvan Tarau','Constantin','Razvan','Tarau','Albertslund','287654321','1112','1800-10-20',1678),(3,'Marius Daniel Munteanu','Marius','Daniel','Munteanu','Albertslund','387654321','1113','2000-10-20',2678),(4,'Jakob M','Jakob',NULL,'M','Norrrebro','587654321','1198','2015-10-20',2678),(5,'Dragos Andrei Mocanasu','Dragos','Andrei','Mocanasu','Valby','787654321','2113','2100-01-20',4678);
/*!40000 ALTER TABLE `Student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Student_Section`
--

DROP TABLE IF EXISTS `Student_Section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Student_Section` (
  `section_id` int DEFAULT NULL,
  `student_id` int DEFAULT NULL,
  `student_grade` char(4) DEFAULT NULL,
  KEY `section_id` (`section_id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `student_section_ibfk_1` FOREIGN KEY (`section_id`) REFERENCES `Section` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `student_section_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `Student` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Student_Section`
--

LOCK TABLES `Student_Section` WRITE;
/*!40000 ALTER TABLE `Student_Section` DISABLE KEYS */;
INSERT INTO `Student_Section` VALUES (1,1,'12'),(1,2,'12'),(1,3,'12'),(2,1,'4'),(4,1,'10');
/*!40000 ALTER TABLE `Student_Section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `user_role_information`
--

DROP TABLE IF EXISTS `user_role_information`;
/*!50001 DROP VIEW IF EXISTS `user_role_information`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `user_role_information` AS SELECT 
 1 AS `User`,
 1 AS `Select_priv`,
 1 AS `Insert_priv`,
 1 AS `Update_priv`,
 1 AS `Delete_priv`,
 1 AS `Create_priv`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `user_role_information`
--

/*!50001 DROP VIEW IF EXISTS `user_role_information`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `user_role_information` AS select `mysql`.`user`.`User` AS `User`,`mysql`.`user`.`Select_priv` AS `Select_priv`,`mysql`.`user`.`Insert_priv` AS `Insert_priv`,`mysql`.`user`.`Update_priv` AS `Update_priv`,`mysql`.`user`.`Delete_priv` AS `Delete_priv`,`mysql`.`user`.`Create_priv` AS `Create_priv` from `mysql`.`user` where ((`mysql`.`user`.`Select_priv` = 'Y') or (`mysql`.`user`.`Insert_priv` = 'Y') or (`mysql`.`user`.`Update_priv` = 'Y') or (`mysql`.`user`.`Delete_priv` = 'Y') or (`mysql`.`user`.`Create_priv` = 'Y')) */;
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

-- Dump completed on 2020-05-18 17:35:52
