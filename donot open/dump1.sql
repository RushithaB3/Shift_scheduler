-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: shift_demo
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `leaves`
--

DROP TABLE IF EXISTS `leaves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leaves` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `user_id` bigint NOT NULL,
  `zip_code_id` bigint NOT NULL,
  `zone_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9vbj5cyd7xf5bbyxyc4co79wo` (`user_id`),
  KEY `FKldfhg225wqycucext4vtxw4r8` (`zip_code_id`),
  KEY `FKn431cxd3o6f1f8y1nlu31fth7` (`zone_id`),
  CONSTRAINT `FK9vbj5cyd7xf5bbyxyc4co79wo` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKldfhg225wqycucext4vtxw4r8` FOREIGN KEY (`zip_code_id`) REFERENCES `zip_code` (`id`),
  CONSTRAINT `FKn431cxd3o6f1f8y1nlu31fth7` FOREIGN KEY (`zone_id`) REFERENCES `zone` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leaves`
--

LOCK TABLES `leaves` WRITE;
/*!40000 ALTER TABLE `leaves` DISABLE KEYS */;
INSERT INTO `leaves` VALUES (1,'2025-07-18','2025-07-20',1,55,1),(2,'2025-07-21','2025-07-23',2,55,1),(3,'2025-07-24','2025-07-26',3,55,1),(4,'2025-07-27','2025-07-29',4,55,1),(5,'2025-07-18','2025-07-19',5,69,2),(6,'2025-07-20','2025-07-22',6,69,2),(7,'2025-07-23','2025-07-25',7,69,2),(8,'2025-07-26','2025-07-28',8,69,2),(9,'2025-07-29','2025-07-31',9,69,2),(10,'2025-07-18','2025-07-20',10,64,3),(11,'2025-07-21','2025-07-23',11,64,3),(12,'2025-07-24','2025-07-26',12,64,3),(13,'2025-07-27','2025-07-29',13,64,3),(14,'2025-07-30','2025-08-01',14,64,3),(15,'2025-07-18','2025-07-19',15,56,4),(16,'2025-07-20','2025-07-22',16,56,4),(17,'2025-07-23','2025-07-25',17,56,4),(18,'2025-07-26','2025-07-28',18,56,4),(19,'2025-07-29','2025-07-31',19,56,4),(20,'2025-08-01','2025-08-03',20,55,1),(21,'2025-07-07','2025-07-10',1,55,1);
/*!40000 ALTER TABLE `leaves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shift`
--

DROP TABLE IF EXISTS `shift`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shift` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `end_date` date DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `user_id` bigint NOT NULL,
  `zip_code_id` bigint NOT NULL,
  `zone_id` bigint NOT NULL,
  `last_modified` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKjbwvsj60i837f831g215r72x2` (`user_id`),
  KEY `FKm0j2g7msn47xe4ro3443c028o` (`zip_code_id`),
  KEY `FKhlqtw4nc57c68otlu54k6ak97` (`zone_id`),
  CONSTRAINT `FKhlqtw4nc57c68otlu54k6ak97` FOREIGN KEY (`zone_id`) REFERENCES `zone` (`id`),
  CONSTRAINT `FKjbwvsj60i837f831g215r72x2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKm0j2g7msn47xe4ro3443c028o` FOREIGN KEY (`zip_code_id`) REFERENCES `zip_code` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shift`
--

LOCK TABLES `shift` WRITE;
/*!40000 ALTER TABLE `shift` DISABLE KEYS */;
INSERT INTO `shift` VALUES (7,'2025-07-08','2025-07-06',14,108,7,'2025-07-08 03:05:59.608963'),(8,'2025-07-11','2025-07-09',8,69,2,NULL),(9,'2025-07-14','2025-07-12',1,55,47,'2025-07-08 03:04:01.161421'),(10,'2025-07-03','2025-07-01',10,64,3,NULL),(11,'2025-07-06','2025-07-04',11,64,3,NULL),(12,'2025-07-09','2025-07-07',11,53,47,'2025-07-08 03:07:02.826346'),(13,'2025-07-12','2025-07-10',13,64,3,NULL),(14,'2025-07-15','2025-07-13',14,64,3,NULL),(15,'2025-07-02','2025-07-01',15,56,4,NULL),(16,'2025-07-05','2025-07-03',16,56,4,NULL),(17,'2025-07-08','2025-07-06',17,56,4,NULL),(18,'2025-07-11','2025-07-09',18,56,4,NULL),(19,'2025-07-14','2025-07-12',19,56,4,NULL),(20,'2025-07-17','2025-07-15',20,55,1,NULL),(21,'2025-07-03','2025-07-01',3,105,7,'2025-07-08 02:09:52.852343'),(24,'2025-07-09','2025-07-07',6,52,47,NULL),(25,'2025-07-18','2025-07-15',12,104,7,'2025-07-08 03:04:21.310557'),(27,'2025-07-03','2025-07-01',6,53,47,NULL),(29,'2025-07-03','2025-07-01',10,106,7,NULL),(30,'2025-07-18','2025-07-15',1,104,7,'2025-07-08 02:07:35.595103'),(31,'2025-07-19','2025-07-18',10,53,47,'2025-07-08 02:13:22.200096'),(32,'2025-07-12','2025-07-10',7,105,7,'2025-07-08 03:03:34.892961');
/*!40000 ALTER TABLE `shift` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `uid` varchar(4) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `zip_code_id` bigint DEFAULT NULL,
  `zone_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`),
  KEY `FKo9bpv8wn66o5mbou02w2ol30d` (`zip_code_id`),
  KEY `FKnuwar4apxonwwwcgd6b8vn589` (`zone_id`),
  CONSTRAINT `FKnuwar4apxonwwwcgd6b8vn589` FOREIGN KEY (`zone_id`) REFERENCES `zone` (`id`),
  CONSTRAINT `FKo9bpv8wn66o5mbou02w2ol30d` FOREIGN KEY (`zip_code_id`) REFERENCES `zip_code` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'u092','andrew.jackson@houston.com','Andrew','Jackson',29.763,-95.36,55,1),(2,'u093','bella.anderson@houston.com','Bella','Anderson',29.754,-95.362,55,1),(3,'u094','caleb.murphy@houston.com','Caleb','Murphy',29.7585,-95.3665,55,1),(4,'u095','diana.jenkins@houston.com','Diana','Jenkins',29.762,-95.361,55,1),(5,'u096','eli.foster@sanantonio.com','Eli','Foster',29.4255,-98.492,69,2),(6,'u097','fiona.rivera@sanantonio.com','Fiona','Rivera',29.427,-98.494,69,2),(7,'u098','george.bennett@sanantonio.com','George','Bennett',29.4288,-98.4952,69,2),(8,'u099','hailey.perry@sanantonio.com','Hailey','Perry',29.426,-98.491,69,2),(9,'u100','isaac.hughes@sanantonio.com','Isaac','Hughes',29.429,-98.493,69,2),(10,'u081','julia.reed@dallas.com','Julia','Reed',32.7775,-96.7985,64,3),(11,'u082','kevin.coleman@dallas.com','Kevin','Coleman',32.779,-96.7965,64,3),(12,'u083','laura.long@dallas.com','Laura','Long',32.778,-96.799,64,3),(13,'u084','mason.watson@dallas.com','Mason','Watson',32.776,-96.7975,64,3),(14,'u085','natalie.morris@dallas.com','Natalie','Morris',32.775,-96.8001,64,3),(15,'u086','owen.wood@austin.com','Owen','Wood',30.269,-97.7445,56,4),(16,'u087','penelope.brooks@austin.com','Penelope','Brooks',30.268,-97.742,56,4),(17,'u088','quentin.gray@austin.com','Quentin','Gray',30.2675,-97.745,56,4),(18,'u089','rachel.watkins@austin.com','Rachel','Watkins',30.27,-97.74,56,4),(19,'u090','samuel.bryant@austin.com','Samuel','Bryant',30.271,-97.7395,56,4),(20,'u071','emma.walker@houston.com','Emma','Walker',29.9149,-95.8496,55,1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zip_code`
--

DROP TABLE IF EXISTS `zip_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zip_code` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `zone_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKtriyvky7tfulo3iq35t0ihsx` (`zone_id`),
  CONSTRAINT `FKtriyvky7tfulo3iq35t0ihsx` FOREIGN KEY (`zone_id`) REFERENCES `zone` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zip_code`
--

LOCK TABLES `zip_code` WRITE;
/*!40000 ALTER TABLE `zip_code` DISABLE KEYS */;
INSERT INTO `zip_code` VALUES (52,'75006',47),(53,'75007',47),(54,'75010',47),(55,'75023',47),(56,'75024',9),(57,'75025',9),(58,'75033',14),(59,'75034',14),(60,'75035',14),(61,'75036',14),(62,'75038',13),(63,'75039',13),(64,'75040',12),(65,'75041',12),(66,'75042',12),(67,'75043',12),(68,'75044',12),(69,'75050',17),(70,'75051',17),(71,'75052',17),(72,'75054',17),(73,'75060',13),(77,'75006',23),(79,'75010',23),(80,'75023',9),(81,'75024',9),(82,'75025',9),(83,'75033',14),(84,'75034',14),(85,'75035',14),(86,'75036',14),(87,'75038',13),(88,'75039',13),(89,'75040',12),(90,'75041',12),(91,'75042',12),(92,'75043',12),(93,'75044',12),(94,'75050',17),(95,'75051',17),(96,'75052',17),(97,'75054',17),(98,'75060',13),(99,'75061',13),(101,'75063',13),(104,'76005',7),(105,'76006',7),(106,'76010',7),(107,'76011',7),(108,'76012',7),(109,'76013',7),(110,'76014',7),(111,'76015',7),(112,'76016',7),(113,'76017',7),(114,'76018',7);
/*!40000 ALTER TABLE `zip_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zone`
--

DROP TABLE IF EXISTS `zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zone` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK27s7q3vqft9a76yi9k7e7rroi` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zone`
--

LOCK TABLES `zone` WRITE;
/*!40000 ALTER TABLE `zone` DISABLE KEYS */;
INSERT INTO `zone` VALUES (27,'Abilene'),(15,'Amarillo'),(7,'Arlington'),(4,'Austin'),(41,'Baytown'),(28,'Beaumont'),(18,'Brownsville'),(33,'Bryan–College Station'),(23,'Carrollton'),(43,'Cedar Park'),(40,'Conroe'),(8,'Corpus Christi'),(3,'Dallas'),(26,'Denton'),(45,'Edinburg'),(6,'El Paso'),(5,'Fort Worth'),(14,'Frisco'),(12,'Garland'),(17,'Grand Prairie'),(39,'Harlingen'),(1,'Houston'),(13,'Irving'),(19,'Killeen'),(10,'Laredo'),(42,'Leander'),(11,'Lubbock'),(22,'McAllen'),(16,'McKinney'),(21,'Mesquite'),(25,'Midland'),(46,'Mission'),(35,'New Braunfels'),(30,'Odessa'),(20,'Pasadena'),(44,'Pharr'),(9,'Plano'),(29,'Round Rock'),(38,'San Angelo'),(2,'San Antonio'),(37,'Texarkana'),(34,'The Woodlands'),(32,'Tyler'),(36,'Victoria'),(24,'Waco'),(31,'Wichita Falls'),(47,'zone 1');
/*!40000 ALTER TABLE `zone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'shift_demo'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-09  2:35:15
