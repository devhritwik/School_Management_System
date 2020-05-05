-- MySQL dump 10.13  Distrib 5.7.23, for Linux (x86_64)
--
-- Host: localhost    Database: school
-- ------------------------------------------------------
-- Server version	5.7.23-0ubuntu0.16.04.1

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
-- Table structure for table `USERS`
--

DROP TABLE IF EXISTS `USERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USERS` (
  `username` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `enabled` int(11) DEFAULT '1',
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USERS`
--

LOCK TABLES `USERS` WRITE;
/*!40000 ALTER TABLE `USERS` DISABLE KEYS */;
INSERT INTO `USERS` VALUES ('a1','pass',1),('a2','pass',1),('p1','pass',1),('p10','pass',1),('p2','pass',1),('p3','pass',1),('p4','pass',1),('p5','pass',1),('p6','pass',1),('p7','pass',1),('p8','pass',1),('p9','pass',1),('root','pass',1),('s1','pass',1),('s10','pass',1),('s11','pass',1),('s12','pass',1),('s13','pass',1),('s14','pass',1),('s15','pass',1),('s2','pass',1),('s3','pass',1),('s4','pass',1),('s5','pass',1),('s6','pass',1),('s7','pass',1),('s8','pass',1),('s9','pass',1),('t1','pass',1),('t2','pass',1),('t3','pass',1),('t4','pass',1),('t5','pass',1);
/*!40000 ALTER TABLE `USERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USERS_ROLES`
--

DROP TABLE IF EXISTS `USERS_ROLES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USERS_ROLES` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(20) NOT NULL,
  `role` varchar(20) NOT NULL,
  PRIMARY KEY (`role_id`),
  KEY `FK_USERS` (`user`),
  CONSTRAINT `FK_USERS` FOREIGN KEY (`user`) REFERENCES `USERS` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USERS_ROLES`
--

LOCK TABLES `USERS_ROLES` WRITE;
/*!40000 ALTER TABLE `USERS_ROLES` DISABLE KEYS */;
INSERT INTO `USERS_ROLES` VALUES (45,'root','ROLE_ADMIN'),(46,'s1','ROLE_STUDENT'),(47,'s2','ROLE_STUDENT'),(48,'s3','ROLE_STUDENT'),(49,'s4','ROLE_STUDENT'),(50,'s5','ROLE_STUDENT'),(51,'s6','ROLE_STUDENT'),(52,'s7','ROLE_STUDENT'),(53,'s8','ROLE_STUDENT'),(54,'s9','ROLE_STUDENT'),(55,'s10','ROLE_STUDENT'),(56,'s11','ROLE_STUDENT'),(57,'s12','ROLE_STUDENT'),(58,'s13','ROLE_STUDENT'),(59,'s14','ROLE_STUDENT'),(60,'s15','ROLE_STUDENT'),(61,'p1','ROLE_PARENT'),(62,'p2','ROLE_PARENT'),(63,'p3','ROLE_PARENT'),(64,'p4','ROLE_PARENT'),(65,'p5','ROLE_PARENT'),(66,'p6','ROLE_PARENT'),(67,'p7','ROLE_PARENT'),(68,'p8','ROLE_PARENT'),(69,'p9','ROLE_PARENT'),(70,'p10','ROLE_PARENT'),(71,'t1','ROLE_TEACHER'),(72,'t2','ROLE_TEACHER'),(73,'t3','ROLE_TEACHER'),(74,'t4','ROLE_TEACHER'),(75,'t5','ROLE_TEACHER'),(76,'a1','ROLE_ACCOUNTANT'),(77,'a2','ROLE_ACCOUNTANT');
/*!40000 ALTER TABLE `USERS_ROLES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accountant`
--

DROP TABLE IF EXISTS `accountant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accountant` (
  `accountantID` varchar(40) NOT NULL,
  `firstName` varchar(40) NOT NULL,
  `middleName` varchar(40) DEFAULT NULL,
  `lastName` varchar(40) DEFAULT NULL,
  `gender` varchar(40) DEFAULT NULL,
  `mobNo` varchar(40) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `workType` varchar(40) DEFAULT NULL,
  `salary` int(11) DEFAULT NULL,
  `aadharNo` varchar(40) DEFAULT NULL,
  `joinDate` date DEFAULT NULL,
  `resignDate` date DEFAULT NULL,
  PRIMARY KEY (`accountantID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accountant`
--

LOCK TABLES `accountant` WRITE;
/*!40000 ALTER TABLE `accountant` DISABLE KEYS */;
INSERT INTO `accountant` VALUES ('a1','vicky','kumar','yadav','Male','9876123453','vicky.acc@gmail.com','fees section',230000,NULL,'2015-08-28',NULL),('a2','Rohit',NULL,NULL,NULL,NULL,'rohit.acc@gmail.com','fees section',250000,NULL,'2015-08-18',NULL);
/*!40000 ALTER TABLE `accountant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attendance` (
  `date` date NOT NULL,
  `periodNo` int(11) NOT NULL,
  `studentID` varchar(40) NOT NULL,
  `status` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`date`,`periodNo`,`studentID`),
  KEY `FK_student_attendance` (`studentID`),
  CONSTRAINT `FK_student_attendance` FOREIGN KEY (`studentID`) REFERENCES `student` (`studentID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
INSERT INTO `attendance` VALUES ('2018-10-01',1,'s1','Present'),('2018-10-01',1,'s11','Late'),('2018-10-01',1,'s12','Present'),('2018-10-01',1,'s13','Absent'),('2018-10-01',1,'s2','Late'),('2018-10-01',1,'s6','Present');
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill` (
  `billNo` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `ofStudent` varchar(40) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `concession` double DEFAULT NULL,
  `fine` double DEFAULT NULL,
  `feePeriod` varchar(40) DEFAULT NULL,
  `status` varchar(40) DEFAULT NULL,
  `throughAccountant` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`billNo`),
  KEY `FK_student_bill` (`ofStudent`),
  KEY `FK_accountant_bill` (`throughAccountant`),
  CONSTRAINT `FK_accountant_bill` FOREIGN KEY (`throughAccountant`) REFERENCES `accountant` (`accountantID`),
  CONSTRAINT `FK_student_bill` FOREIGN KEY (`ofStudent`) REFERENCES `student` (`studentID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
INSERT INTO `bill` VALUES (8,'2018-04-16','s1',1200,300,50,'Quaterly','Paid','a1'),(9,'2017-03-22','s2',1200,300,200,'Quaterly','Not Paid','a1'),(10,'2017-06-23','s2',1200,300,78,'Quaterly','Paid','a1');
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class` (
  `classID` varchar(40) NOT NULL,
  `className` varchar(40) DEFAULT NULL,
  `roomNo` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`classID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` VALUES ('6a','6a','1'),('7a','7a','2'),('7b','7b','3'),('8a','8a','4');
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam`
--

DROP TABLE IF EXISTS `exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam` (
  `date` date NOT NULL,
  `type` varchar(40) NOT NULL,
  `subjectCode` varchar(40) NOT NULL,
  `time` time DEFAULT NULL,
  `roomNo` varchar(40) DEFAULT NULL,
  `maxMarks` double DEFAULT NULL,
  PRIMARY KEY (`date`,`type`,`subjectCode`),
  KEY `FK_subject_exam` (`subjectCode`),
  CONSTRAINT `FK_subject_exam` FOREIGN KEY (`subjectCode`) REFERENCES `subject` (`subjectCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam`
--

LOCK TABLES `exam` WRITE;
/*!40000 ALTER TABLE `exam` DISABLE KEYS */;
INSERT INTO `exam` VALUES ('2017-10-29','FA','math7',NULL,'1',100),('2017-10-29','SA','math6a',NULL,'1',100),('2017-11-25','SA','sc8',NULL,'3',100),('2017-11-30','SA','lit6a',NULL,'1',100),('2017-12-30','SA','sc7',NULL,'2',100),('2018-01-02','SA','lit7a',NULL,'3',100),('2018-02-02','SA','lit7b',NULL,'2',100),('2018-02-05','FA','math7b',NULL,'2',20),('2018-03-03','FA','sc7b',NULL,'1',20);
/*!40000 ALTER TABLE `exam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `homework`
--

DROP TABLE IF EXISTS `homework`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `homework` (
  `homeworkId` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `maxMarks` int(11) DEFAULT NULL,
  `byTeacher` varchar(40) DEFAULT NULL,
  `subjectCode` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`homeworkId`),
  KEY `FK_teacher_homework` (`byTeacher`),
  KEY `FK_subject_homework` (`subjectCode`),
  CONSTRAINT `FK_subject_homework` FOREIGN KEY (`subjectCode`) REFERENCES `subject` (`subjectCode`),
  CONSTRAINT `FK_teacher_homework` FOREIGN KEY (`byTeacher`) REFERENCES `teacher` (`teacherID`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `homework`
--

LOCK TABLES `homework` WRITE;
/*!40000 ALTER TABLE `homework` DISABLE KEYS */;
INSERT INTO `homework` VALUES (22,'2018-10-01',10,'t1','lit6a');
/*!40000 ALTER TABLE `homework` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `homeworkOfStudent`
--

DROP TABLE IF EXISTS `homeworkOfStudent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `homeworkOfStudent` (
  `homeworkID` int(11) NOT NULL,
  `studentID` varchar(40) NOT NULL,
  `status` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`homeworkID`,`studentID`),
  KEY `FK_student_homeworkOfStudent` (`studentID`),
  CONSTRAINT `FK_homework_homeworkOfStudent` FOREIGN KEY (`homeworkID`) REFERENCES `homework` (`homeworkId`),
  CONSTRAINT `FK_student_homeworkOfStudent` FOREIGN KEY (`studentID`) REFERENCES `student` (`studentID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `homeworkOfStudent`
--

LOCK TABLES `homeworkOfStudent` WRITE;
/*!40000 ALTER TABLE `homeworkOfStudent` DISABLE KEYS */;
INSERT INTO `homeworkOfStudent` VALUES (22,'s1','Completed'),(22,'s11','Complete Soon'),(22,'s12','incomplete. Redo'),(22,'s13','Work Hard'),(22,'s2','Incomplete'),(22,'s6','Completed');
/*!40000 ALTER TABLE `homeworkOfStudent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marksInExam`
--

DROP TABLE IF EXISTS `marksInExam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marksInExam` (
  `date` date NOT NULL,
  `type` varchar(40) NOT NULL,
  `subjectCode` varchar(40) NOT NULL,
  `studentID` varchar(40) NOT NULL,
  `marksObtained` double DEFAULT NULL,
  PRIMARY KEY (`date`,`type`,`subjectCode`,`studentID`),
  KEY `FK_student_marksInExam` (`studentID`),
  CONSTRAINT `FK_exam_marksInExam` FOREIGN KEY (`date`, `type`, `subjectCode`) REFERENCES `exam` (`date`, `type`, `subjectCode`),
  CONSTRAINT `FK_student_marksInExam` FOREIGN KEY (`studentID`) REFERENCES `student` (`studentID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marksInExam`
--

LOCK TABLES `marksInExam` WRITE;
/*!40000 ALTER TABLE `marksInExam` DISABLE KEYS */;
INSERT INTO `marksInExam` VALUES ('2017-11-30','SA','lit6a','s1',50),('2017-11-30','SA','lit6a','s11',60.5),('2017-11-30','SA','lit6a','s12',80),('2017-11-30','SA','lit6a','s13',31),('2017-11-30','SA','lit6a','s2',95),('2017-11-30','SA','lit6a','s6',84);
/*!40000 ALTER TABLE `marksInExam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parent`
--

DROP TABLE IF EXISTS `parent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parent` (
  `parentID` varchar(40) NOT NULL,
  `fatherFirstName` varchar(40) DEFAULT NULL,
  `fatherMiddleName` varchar(40) DEFAULT NULL,
  `fatherLastName` varchar(40) DEFAULT NULL,
  `motherFirstName` varchar(40) DEFAULT NULL,
  `motherMiddleName` varchar(40) DEFAULT NULL,
  `motherLastName` varchar(40) DEFAULT NULL,
  `fatherMobNo` varchar(40) DEFAULT NULL,
  `motherMobNo` varchar(40) DEFAULT NULL,
  `fatherEmail` varchar(40) DEFAULT NULL,
  `motherEmail` varchar(40) DEFAULT NULL,
  `fatherProfession` varchar(40) DEFAULT NULL,
  `motherProfession` varchar(40) DEFAULT NULL,
  `fatherSalary` double DEFAULT NULL,
  `motherSalary` double DEFAULT NULL,
  `fatherAadharNo` varchar(40) DEFAULT NULL,
  `motherAadharNo` varchar(40) DEFAULT NULL,
  `fatherQualification` varchar(40) DEFAULT NULL,
  `motherQualification` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`parentID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parent`
--

LOCK TABLES `parent` WRITE;
/*!40000 ALTER TABLE `parent` DISABLE KEYS */;
INSERT INTO `parent` VALUES ('p1','Abhinav','Kumar','Singh','Fatima','Kumari','Singh','9934526178','9934215678','abhinav@gmail.com','fatima@gmail.com','tuition','housewife',25000,23000,'123456789123','123456789123','BSc','MA'),('p10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('p2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('p3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('p4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('p5',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('p6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('p7',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('p8',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('p9',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `parent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report` (
  `reportID` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `topic` varchar(40) DEFAULT NULL,
  `message` text,
  `action` varchar(255) DEFAULT NULL,
  `forStudent` varchar(40) DEFAULT NULL,
  `byTeacher` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`reportID`),
  KEY `FK_student_report` (`forStudent`),
  KEY `FK_teacher_report` (`byTeacher`),
  CONSTRAINT `FK_student_report` FOREIGN KEY (`forStudent`) REFERENCES `student` (`studentID`),
  CONSTRAINT `FK_teacher_report` FOREIGN KEY (`byTeacher`) REFERENCES `teacher` (`teacherID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report`
--

LOCK TABLES `report` WRITE;
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
INSERT INTO `report` VALUES (15,'2018-10-01','Complaint','You must complete your homeworks on time','strict','s1','t1'),(16,'2018-10-01','Information','Meet me after school on 04/10!','urgent','s1','t1'),(17,'2018-10-01','hello','testing....','test','s2','t1');
/*!40000 ALTER TABLE `report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule` (
  `day` varchar(40) NOT NULL,
  `periodNo` int(11) NOT NULL,
  `classID` varchar(40) NOT NULL,
  `teacherID` varchar(40) NOT NULL,
  `subjectCode` varchar(40) NOT NULL,
  PRIMARY KEY (`day`,`periodNo`,`classID`,`teacherID`,`subjectCode`),
  KEY `FK_class_schedule` (`classID`),
  KEY `FK_teacher_schedule` (`teacherID`),
  KEY `FK_subject_schedule` (`subjectCode`),
  CONSTRAINT `FK_class_schedule` FOREIGN KEY (`classID`) REFERENCES `class` (`classID`),
  CONSTRAINT `FK_subject_schedule` FOREIGN KEY (`subjectCode`) REFERENCES `subject` (`subjectCode`),
  CONSTRAINT `FK_teacher_schedule` FOREIGN KEY (`teacherID`) REFERENCES `teacher` (`teacherID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES ('Friday',1,'6a','t1','lit6a'),('Monday',1,'6a','t1','lit6a'),('Saturday',1,'6a','t1','lit6a'),('Thursday',1,'6a','t1','lit6a'),('Tuesday',1,'6a','t1','lit6a'),('Wednesday',1,'6a','t1','lit6a'),('Friday',1,'7a','t3','lit7a'),('Monday',1,'7a','t2','math7'),('Saturday',1,'7a','t4','lit7a'),('Thursday',1,'7a','t3','math7'),('Tuesday',1,'7a','t2','math7'),('Wednesday',1,'7a','t2','math7'),('Saturday',1,'7b','t5','lit7b'),('Monday',1,'8a','t4','sc8'),('Thursday',1,'8a','t4','sc8'),('Tuesday',1,'8a','t4','sc8');
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `studentID` varchar(40) NOT NULL,
  `firstName` varchar(40) NOT NULL,
  `middleName` varchar(40) DEFAULT NULL,
  `lastName` varchar(40) DEFAULT NULL,
  `gender` varchar(40) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `mobNo` varchar(40) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `houseNo` varchar(40) DEFAULT NULL,
  `street` varchar(40) DEFAULT NULL,
  `locality` varchar(40) DEFAULT NULL,
  `city` varchar(40) DEFAULT NULL,
  `state` varchar(40) DEFAULT NULL,
  `pincode` varchar(40) DEFAULT NULL,
  `parentID` varchar(40) DEFAULT NULL,
  `classID` varchar(40) DEFAULT NULL,
  `bloodGp` varchar(40) DEFAULT NULL,
  `admissionYear` int(11) DEFAULT NULL,
  `aadharNo` varchar(40) DEFAULT NULL,
  `category` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`studentID`),
  KEY `FK_parent_student` (`parentID`),
  KEY `FK_class_student` (`classID`),
  CONSTRAINT `FK_class_student` FOREIGN KEY (`classID`) REFERENCES `class` (`classID`),
  CONSTRAINT `FK_parent_student` FOREIGN KEY (`parentID`) REFERENCES `parent` (`parentID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('s1','Sushil','Kr','Singh','Male','2001-10-30','9876123453','sushil@gmail.com','a','camel street','malviya ngr','new delhi','delhi','110032','p1','6a','A+',2016,'123456789123','GEN'),('s10','asit',NULL,NULL,NULL,NULL,NULL,'asit@g.com',NULL,NULL,NULL,NULL,NULL,NULL,'p7','7a',NULL,2016,NULL,NULL),('s11','Biplav',NULL,NULL,NULL,NULL,NULL,'bip@y.com',NULL,NULL,NULL,NULL,NULL,NULL,'p7','6a',NULL,2016,NULL,NULL),('s12','Rahul',NULL,NULL,NULL,NULL,NULL,'rahul@t.com',NULL,NULL,NULL,NULL,NULL,NULL,'p8','6a',NULL,2016,NULL,NULL),('s13','amar',NULL,NULL,NULL,NULL,NULL,'amar@g.com',NULL,NULL,NULL,NULL,NULL,NULL,'p9','6a',NULL,2016,NULL,NULL),('s14','aman',NULL,NULL,NULL,NULL,NULL,'aman@y.co',NULL,NULL,NULL,NULL,NULL,NULL,'p9','7b',NULL,2016,NULL,NULL),('s15','agar',NULL,NULL,NULL,NULL,NULL,'agar@w.c',NULL,NULL,NULL,NULL,NULL,NULL,'p10','7a',NULL,2016,NULL,NULL),('s2','Ram',NULL,NULL,NULL,NULL,NULL,'ram@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,'p1','6a',NULL,2016,NULL,NULL),('s3','Raghav',NULL,NULL,NULL,NULL,NULL,'raghav@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,'p1','7a',NULL,2016,NULL,NULL),('s4','Mohan',NULL,NULL,NULL,NULL,NULL,'mohan@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,'p2','7a',NULL,2017,NULL,NULL),('s5','abhiman',NULL,NULL,NULL,NULL,NULL,'abhi@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,'p2','7a',NULL,2017,NULL,NULL),('s6','Sohan',NULL,NULL,NULL,NULL,NULL,'sohan@gs.com',NULL,NULL,NULL,NULL,NULL,NULL,'p3','6a',NULL,2016,NULL,NULL),('s7','Saurabh',NULL,NULL,NULL,NULL,NULL,'saurabh@gs.com',NULL,NULL,NULL,NULL,NULL,NULL,'p4','8a',NULL,2016,NULL,NULL),('s8','Shikhar',NULL,NULL,NULL,NULL,NULL,'shik@y.com',NULL,NULL,NULL,NULL,NULL,NULL,'p5','7a',NULL,2016,NULL,NULL),('s9','Gaurav',NULL,NULL,NULL,NULL,NULL,'gaurav@g.com',NULL,NULL,NULL,NULL,NULL,NULL,'p6','7a',NULL,2015,NULL,NULL);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studentHobbies`
--

DROP TABLE IF EXISTS `studentHobbies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `studentHobbies` (
  `studentID` varchar(40) NOT NULL,
  `hobby` varchar(40) NOT NULL,
  PRIMARY KEY (`studentID`,`hobby`),
  CONSTRAINT `FK_student_studentHobbies` FOREIGN KEY (`studentID`) REFERENCES `student` (`studentID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentHobbies`
--

LOCK TABLES `studentHobbies` WRITE;
/*!40000 ALTER TABLE `studentHobbies` DISABLE KEYS */;
INSERT INTO `studentHobbies` VALUES ('s1','Chess'),('s1','Playing');
/*!40000 ALTER TABLE `studentHobbies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studentLanguages`
--

DROP TABLE IF EXISTS `studentLanguages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `studentLanguages` (
  `studentID` varchar(40) NOT NULL,
  `language` varchar(40) NOT NULL,
  PRIMARY KEY (`studentID`,`language`),
  CONSTRAINT `FK_student_studentLanguages` FOREIGN KEY (`studentID`) REFERENCES `student` (`studentID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentLanguages`
--

LOCK TABLES `studentLanguages` WRITE;
/*!40000 ALTER TABLE `studentLanguages` DISABLE KEYS */;
INSERT INTO `studentLanguages` VALUES ('s1','English'),('s1','Hindi');
/*!40000 ALTER TABLE `studentLanguages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subject` (
  `subjectCode` varchar(40) NOT NULL,
  `subjectname` varchar(100) DEFAULT NULL,
  `forClass` varchar(40) DEFAULT NULL,
  `gradedOrNot` varchar(40) DEFAULT NULL,
  `bookName` varchar(100) DEFAULT NULL,
  `bookPublication` varchar(100) DEFAULT NULL,
  `bookPrice` double DEFAULT NULL,
  `notebookType` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`subjectCode`),
  KEY `FK_class_subject` (`forClass`),
  CONSTRAINT `FK_class_subject` FOREIGN KEY (`forClass`) REFERENCES `class` (`classID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES ('lit6a','literature','6a','No','literature','ncert',20,''),('lit7a','literature','7a','No','literature','ncert',20,'ruled'),('lit7b','literature','7b','No','literature','ncert',20,''),('math6a','maths','6a','Yes','maths','ncert',30,'ruled'),('math7','maths','7a','Yes','maths','ncert',40.5,'ruled'),('math7b','maths','7b','Yes','maths','ncert',40.5,'ruled'),('sc6','science','6a','Yes','science','ncert',NULL,'semiruled'),('sc7','science','7a','Yes','science','ncert',30,'semiruled'),('sc7b','science','7b','Yes','science','ncert',30,'semiruled'),('sc8','science','8a','Yes','science','ncert',30,'semiruled');
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher` (
  `teacherID` varchar(40) NOT NULL,
  `firstName` varchar(40) NOT NULL,
  `middleName` varchar(40) DEFAULT NULL,
  `lastName` varchar(40) DEFAULT NULL,
  `gender` varchar(40) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `mobNo` varchar(40) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `houseNo` varchar(40) DEFAULT NULL,
  `street` varchar(40) DEFAULT NULL,
  `locality` varchar(40) DEFAULT NULL,
  `city` varchar(40) DEFAULT NULL,
  `state` varchar(40) DEFAULT NULL,
  `pincode` varchar(40) DEFAULT NULL,
  `aadharNo` varchar(40) DEFAULT NULL,
  `salary` double DEFAULT NULL,
  `maritalStatus` varchar(40) DEFAULT NULL,
  `qualification` varchar(40) DEFAULT NULL,
  `joinDate` date DEFAULT NULL,
  `resignDate` date DEFAULT NULL,
  PRIMARY KEY (`teacherID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` VALUES ('t1','Nirmala','Kumari','Singh','Female','1986-09-29','9876123453','nirmala@t.com','a','gulzari street','vasant vihar','New Delhi','delhi','110032','123456789123',650000,'Married','bsc','2017-11-26',NULL),('t2','Nikita',NULL,NULL,NULL,NULL,NULL,'nikt@t.c',NULL,NULL,NULL,NULL,NULL,NULL,NULL,65378,NULL,NULL,'2016-08-25',NULL),('t3','avnish',NULL,NULL,NULL,NULL,NULL,'avs@gt.c',NULL,NULL,NULL,NULL,NULL,NULL,NULL,2300000,NULL,NULL,'2017-08-20',NULL),('t4','akshay',NULL,NULL,NULL,NULL,NULL,'akst@t.c',NULL,NULL,NULL,NULL,NULL,NULL,NULL,670000,NULL,NULL,'2017-05-14',NULL),('t5','praveen',NULL,NULL,NULL,NULL,NULL,'praveen@t.c',NULL,NULL,NULL,NULL,NULL,NULL,NULL,650000,NULL,NULL,'2015-01-28',NULL);
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacherLanguages`
--

DROP TABLE IF EXISTS `teacherLanguages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacherLanguages` (
  `teacherID` varchar(40) NOT NULL,
  `language` varchar(40) NOT NULL,
  PRIMARY KEY (`teacherID`,`language`),
  CONSTRAINT `FK_teacher_teacherLanguages` FOREIGN KEY (`teacherID`) REFERENCES `teacher` (`teacherID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacherLanguages`
--

LOCK TABLES `teacherLanguages` WRITE;
/*!40000 ALTER TABLE `teacherLanguages` DISABLE KEYS */;
INSERT INTO `teacherLanguages` VALUES ('t1','English'),('t1','Hindi');
/*!40000 ALTER TABLE `teacherLanguages` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-01 16:18:36
