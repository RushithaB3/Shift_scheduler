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
  `last_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKjbwvsj60i837f831g215r72x2` (`user_id`),
  KEY `FKm0j2g7msn47xe4ro3443c028o` (`zip_code_id`),
  KEY `FKhlqtw4nc57c68otlu54k6ak97` (`zone_id`),
  CONSTRAINT `FKhlqtw4nc57c68otlu54k6ak97` FOREIGN KEY (`zone_id`) REFERENCES `zone` (`id`),
  CONSTRAINT `FKjbwvsj60i837f831g215r72x2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKm0j2g7msn47xe4ro3443c028o` FOREIGN KEY (`zip_code_id`) REFERENCES `zip_code` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shift`
--

LOCK TABLES `shift` WRITE;
/*!40000 ALTER TABLE `shift` DISABLE KEYS */;
INSERT INTO `shift` VALUES (2,'2025-07-06','2025-07-04',2,55,1,NULL),(3,'2025-07-09','2025-07-07',3,55,1,NULL),(4,'2025-07-12','2025-07-10',4,55,1,NULL),(5,'2025-07-02','2025-07-01',5,69,2,NULL),(6,'2025-07-05','2025-07-03',6,69,2,NULL),(7,'2025-07-08','2025-07-06',7,69,2,NULL),(8,'2025-07-11','2025-07-09',8,69,2,NULL),(9,'2025-07-14','2025-07-12',9,69,2,NULL),(10,'2025-07-03','2025-07-01',10,64,3,NULL),(11,'2025-07-06','2025-07-04',11,64,3,NULL),(12,'2025-07-09','2025-07-07',12,64,3,NULL),(13,'2025-07-12','2025-07-10',13,64,3,NULL),(14,'2025-07-15','2025-07-13',14,64,3,NULL),(15,'2025-07-02','2025-07-01',15,56,4,NULL),(16,'2025-07-05','2025-07-03',16,56,4,NULL),(17,'2025-07-08','2025-07-06',17,56,4,NULL),(18,'2025-07-11','2025-07-09',18,56,4,NULL),(19,'2025-07-14','2025-07-12',19,56,4,NULL),(20,'2025-07-17','2025-07-15',20,55,1,NULL),(21,'2025-07-03','2025-07-01',1,55,1,NULL);
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
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `zip_code_id` bigint DEFAULT NULL,
  `zone_id` bigint DEFAULT NULL,
  `rid` varchar(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKo9bpv8wn66o5mbou02w2ol30d` (`zip_code_id`),
  KEY `FKnuwar4apxonwwwcgd6b8vn589` (`zone_id`),
  CONSTRAINT `FKnuwar4apxonwwwcgd6b8vn589` FOREIGN KEY (`zone_id`) REFERENCES `zone` (`id`),
  CONSTRAINT `FKo9bpv8wn66o5mbou02w2ol30d` FOREIGN KEY (`zip_code_id`) REFERENCES `zip_code` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'andrew.jackson@houston.com','Andrew','Jackson',29.763,-95.36,55,1,'u001'),(2,'bella.anderson@houston.com','Bella','Anderson',29.754,-95.362,55,1,'u002'),(3,'caleb.murphy@houston.com','Caleb','Murphy',29.7585,-95.3665,55,1,'u003'),(4,'diana.jenkins@houston.com','Diana','Jenkins',29.762,-95.361,55,1,'u004'),(5,'eli.foster@sanantonio.com','Eli','Foster',29.4255,-98.492,69,2,'u005'),(6,'fiona.rivera@sanantonio.com','Fiona','Rivera',29.427,-98.494,69,2,'u006'),(7,'george.bennett@sanantonio.com','George','Bennett',29.4288,-98.4952,69,2,'u007'),(8,'hailey.perry@sanantonio.com','Hailey','Perry',29.426,-98.491,69,2,'u008'),(9,'isaac.hughes@sanantonio.com','Isaac','Hughes',29.429,-98.493,69,2,'u009'),(10,'julia.reed@dallas.com','Julia','Reed',32.7775,-96.7985,64,3,'u010'),(11,'kevin.coleman@dallas.com','Kevin','Coleman',32.779,-96.7965,64,3,'u011'),(12,'laura.long@dallas.com','Laura','Long',32.778,-96.799,64,3,'u012'),(13,'mason.watson@dallas.com','Mason','Watson',32.776,-96.7975,64,3,'u013'),(14,'natalie.morris@dallas.com','Natalie','Morris',32.775,-96.8001,64,3,'u014'),(15,'owen.wood@austin.com','Owen','Wood',30.269,-97.7445,56,4,'u015'),(16,'penelope.brooks@austin.com','Penelope','Brooks',30.268,-97.742,56,4,'u016'),(17,'quentin.gray@austin.com','Quentin','Gray',30.2675,-97.745,56,4,'u017'),(18,'rachel.watkins@austin.com','Rachel','Watkins',30.27,-97.74,56,4,'u018'),(19,'samuel.bryant@austin.com','Samuel','Bryant',30.271,-97.7395,56,4,'u019'),(20,'emma.walker@houston.com','Emma','Walker',29.9149,-95.8496,55,1,'u020'),(22,'liam.smith@houston.com','Liam','Smith',29.76,-95.363,55,1,'u021'),(23,'olivia.johnson@houston.com','Olivia','Johnson',29.755,-95.36,55,1,'u022'),(24,'noah.williams@houston.com','Noah','Williams',29.758,-95.364,55,1,'u023'),(25,'emma.brown@houston.com','Emma','Brown',29.761,-95.359,55,1,'u024'),(26,'ava.davis@sanantonio.com','Ava','Davis',29.426,-98.493,69,2,'u025'),(27,'sophia.miller@sanantonio.com','Sophia','Miller',29.428,-98.49,69,2,'u026'),(28,'james.wilson@sanantonio.com','James','Wilson',29.427,-98.492,69,2,'u027'),(29,'isabella.moore@sanantonio.com','Isabella','Moore',29.429,-98.494,69,2,'u028'),(30,'benjamin.taylor@sanantonio.com','Benjamin','Taylor',29.425,-98.491,69,2,'u029'),(31,'mia.anderson@dallas.com','Mia','Anderson',32.778,-96.797,64,3,'u030'),(32,'charlotte.thomas@dallas.com','Charlotte','Thomas',32.776,-96.799,64,3,'u031'),(33,'elijah.jackson@dallas.com','Elijah','Jackson',32.779,-96.796,64,3,'u032'),(34,'amelia.white@dallas.com','Amelia','White',32.777,-96.798,64,3,'u033'),(35,'harper.harris@dallas.com','Harper','Harris',32.775,-96.8,64,3,'u034'),(36,'lucas.martin@austin.com','Lucas','Martin',30.268,-97.743,56,4,'u035'),(37,'evelyn.thompson@austin.com','Evelyn','Thompson',30.27,-97.741,56,4,'u036'),(38,'henry.garcia@austin.com','Henry','Garcia',30.267,-97.744,56,4,'u037'),(39,'aria.martinez@austin.com','Aria','Martinez',30.269,-97.74,56,4,'u038'),(40,'sebastian.rodriguez@austin.com','Sebastian','Rodriguez',30.271,-97.739,56,4,'u039'),(41,'scarlett.lee@houston.com','Scarlett','Lee',29.762,-95.361,55,1,'u040'),(42,'jackson.walker@houston.com','Jackson','Walker',29.757,-95.362,55,1,'u041'),(43,'chloe.hall@houston.com','Chloe','Hall',29.759,-95.365,55,1,'u042'),(44,'aiden.lewis@sanantonio.com','Aiden','Lewis',29.427,-98.492,69,2,'u043'),(45,'zoey.robinson@sanantonio.com','Zoey','Robinson',29.426,-98.493,69,2,'u044'),(46,'logan.clark@dallas.com','Logan','Clark',32.778,-96.798,64,3,'u045'),(47,'lily.lewis@dallas.com','Lily','Lewis',32.776,-96.799,64,3,'u046'),(48,'ethan.young@austin.com','Ethan','Young',30.268,-97.742,56,4,'u047'),(49,'sophie.allen@austin.com','Sophie','Allen',30.27,-97.741,56,4,'u048'),(50,'mason.king@houston.com','Mason','King',29.76,-95.36,55,1,'u049'),(51,'ava.scott@houston.com','Ava','Scott',29.758,-95.363,55,1,'u050'),(52,'liam.green@sanantonio.com','Liam','Green',29.428,-98.491,69,2,'u051'),(53,'olivia.baker@sanantonio.com','Olivia','Baker',29.427,-98.494,69,2,'u052'),(54,'noah.gonzalez@dallas.com','Noah','Gonzalez',32.779,-96.797,64,3,'u053'),(55,'emma.nelson@dallas.com','Emma','Nelson',32.777,-96.798,64,3,'u054'),(56,'sophia.carter@austin.com','Sophia','Carter',30.269,-97.743,56,4,'u055'),(57,'james.mitchell@austin.com','James','Mitchell',30.268,-97.74,56,4,'u056'),(58,'isabella.perez@houston.com','Isabella','Perez',29.761,-95.361,55,1,'u057'),(59,'benjamin.roberts@houston.com','Benjamin','Roberts',29.757,-95.362,55,1,'u058'),(60,'mia.turner@sanantonio.com','Mia','Turner',29.426,-98.492,69,2,'u059'),(61,'charlotte.phillips@dallas.com','Charlotte','Phillips',32.778,-96.799,64,3,'u060');
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
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
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
INSERT INTO `zip_code` VALUES (52,'75006',4,NULL,NULL),(53,'75007',4,NULL,NULL),(54,'75010',4,NULL,NULL),(55,'75023',1,NULL,NULL),(56,'75024',4,NULL,NULL),(57,'75025',4,NULL,NULL),(58,'75033',4,NULL,NULL),(59,'75034',4,NULL,NULL),(60,'75035',4,NULL,NULL),(61,'75036',4,NULL,NULL),(62,'75038',5,NULL,NULL),(63,'75039',5,NULL,NULL),(64,'75040',3,NULL,NULL),(65,'75041',12,NULL,NULL),(66,'75042',12,NULL,NULL),(67,'75043',12,NULL,NULL),(68,'75044',12,NULL,NULL),(69,'75050',2,NULL,NULL),(70,'75051',17,NULL,NULL),(71,'75052',17,NULL,NULL),(72,'75054',17,NULL,NULL),(73,'75060',5,NULL,NULL),(77,'75006',5,NULL,NULL),(79,'75010',5,NULL,NULL),(80,'75023',1,NULL,NULL),(81,'75024',1,NULL,NULL),(82,'75025',1,NULL,NULL),(83,'75033',5,NULL,NULL),(84,'75034',5,NULL,NULL),(85,'75035',5,NULL,NULL),(86,'75036',5,NULL,NULL),(87,'75038',5,NULL,NULL),(88,'75039',5,NULL,NULL),(89,'75040',3,NULL,NULL),(90,'75041',3,NULL,NULL),(91,'75042',3,NULL,NULL),(92,'75043',3,NULL,NULL),(93,'75044',3,NULL,NULL),(94,'75050',2,NULL,NULL),(95,'75051',2,NULL,NULL),(96,'75052',2,NULL,NULL),(97,'75054',2,NULL,NULL),(98,'75060',5,NULL,NULL),(99,'75061',5,NULL,NULL),(101,'75063',5,NULL,NULL),(104,'76005',1,NULL,NULL),(105,'76006',1,NULL,NULL),(106,'76010',1,NULL,NULL),(107,'76011',1,NULL,NULL),(108,'76012',1,NULL,NULL),(109,'76013',2,NULL,NULL),(110,'76014',2,NULL,NULL),(111,'76015',2,NULL,NULL),(112,'76016',2,NULL,NULL),(113,'76017',3,NULL,NULL),(114,'76018',3,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zone`
--

LOCK TABLES `zone` WRITE;
/*!40000 ALTER TABLE `zone` DISABLE KEYS */;
INSERT INTO `zone` VALUES (1,'Zone1'),(2,'Zone2'),(3,'Zone3'),(4,'Zone4'),(5,'Zone5');
/*!40000 ALTER TABLE `zone` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-10 21:07:26
