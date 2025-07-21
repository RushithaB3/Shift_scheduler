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
  `zip_code_id` bigint DEFAULT NULL,
  `zone_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9vbj5cyd7xf5bbyxyc4co79wo` (`user_id`),
  KEY `FKldfhg225wqycucext4vtxw4r8` (`zip_code_id`),
  KEY `FKn431cxd3o6f1f8y1nlu31fth7` (`zone_id`),
  CONSTRAINT `FK9vbj5cyd7xf5bbyxyc4co79wo` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKldfhg225wqycucext4vtxw4r8` FOREIGN KEY (`zip_code_id`) REFERENCES `zip_code` (`id`),
  CONSTRAINT `FKn431cxd3o6f1f8y1nlu31fth7` FOREIGN KEY (`zone_id`) REFERENCES `zone` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leaves`
--

LOCK TABLES `leaves` WRITE;
/*!40000 ALTER TABLE `leaves` DISABLE KEYS */;
INSERT INTO `leaves` VALUES (1,'2025-07-18','2025-07-20',1,55,1),(2,'2025-07-21','2025-07-23',2,55,1),(3,'2025-07-24','2025-07-26',3,55,1),(4,'2025-07-27','2025-07-29',4,55,1),(5,'2025-07-18','2025-07-19',5,69,2),(6,'2025-07-20','2025-07-22',6,69,2),(7,'2025-07-23','2025-07-25',7,69,2),(8,'2025-07-26','2025-07-28',8,69,2),(9,'2025-07-29','2025-07-31',9,69,2),(10,'2025-07-18','2025-07-20',10,64,3),(11,'2025-07-21','2025-07-23',11,64,3),(12,'2025-07-24','2025-07-26',12,64,3),(13,'2025-07-27','2025-07-29',13,64,3),(14,'2025-07-30','2025-08-01',14,64,3),(15,'2025-07-18','2025-07-19',15,56,4),(16,'2025-07-20','2025-07-22',16,56,4),(17,'2025-07-23','2025-07-25',17,56,4),(18,'2025-07-26','2025-07-28',18,56,4),(19,'2025-07-29','2025-07-31',19,56,4),(20,'2025-08-01','2025-08-03',20,55,1),(21,'2025-07-07','2025-07-10',1,55,1),(22,'2025-07-18','2025-07-19',3,55,1),(23,'2025-07-15','2025-07-16',10,NULL,NULL),(24,'2025-07-21','2025-07-22',2,NULL,NULL);
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
  `racfid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKjbwvsj60i837f831g215r72x2` (`user_id`),
  KEY `FKm0j2g7msn47xe4ro3443c028o` (`zip_code_id`),
  KEY `FKhlqtw4nc57c68otlu54k6ak97` (`zone_id`),
  CONSTRAINT `FKhlqtw4nc57c68otlu54k6ak97` FOREIGN KEY (`zone_id`) REFERENCES `zone` (`id`),
  CONSTRAINT `FKjbwvsj60i837f831g215r72x2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKm0j2g7msn47xe4ro3443c028o` FOREIGN KEY (`zip_code_id`) REFERENCES `zip_code` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shift`
--

LOCK TABLES `shift` WRITE;
/*!40000 ALTER TABLE `shift` DISABLE KEYS */;
INSERT INTO `shift` VALUES (3,'2025-07-09','2025-07-07',3,55,1,NULL,NULL),(4,'2025-07-12','2025-07-10',4,55,1,NULL,NULL),(5,'2025-07-02','2025-07-01',5,69,2,NULL,NULL),(6,'2025-07-05','2025-07-03',6,69,2,NULL,NULL),(7,'2025-07-08','2025-07-06',7,69,2,NULL,NULL),(8,'2025-07-11','2025-07-09',8,69,2,NULL,NULL),(9,'2025-07-14','2025-07-12',9,69,2,NULL,NULL),(10,'2025-07-03','2025-07-01',10,64,3,NULL,NULL),(11,'2025-07-06','2025-07-04',11,64,3,NULL,NULL),(12,'2025-07-09','2025-07-07',12,64,3,NULL,NULL),(13,'2025-07-12','2025-07-10',13,64,3,NULL,NULL),(14,'2025-07-15','2025-07-13',14,64,3,NULL,NULL),(15,'2025-07-02','2025-07-01',15,56,4,NULL,NULL),(16,'2025-07-05','2025-07-03',16,56,4,NULL,NULL),(17,'2025-07-08','2025-07-06',17,56,4,NULL,NULL),(18,'2025-07-11','2025-07-09',18,56,4,NULL,NULL),(19,'2025-07-14','2025-07-12',19,56,4,NULL,NULL),(20,'2025-07-17','2025-07-15',20,55,1,NULL,NULL),(24,'2025-07-16','2025-07-15',1,91,3,'2025-07-14 02:57:19','u001'),(27,'2025-07-18','2025-07-16',2,79,5,'2025-07-15 18:00:24','u002');
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
  `racfid` varchar(4) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `zip_code_id` bigint DEFAULT NULL,
  `zone_id` bigint DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `phone_number` varchar(10) DEFAULT NULL,
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
INSERT INTO `user` VALUES (1,'u001','andrew.jackson@houston.com','Andrew','Jackson',29.763,-95.36,55,1,'Role1','9000000001'),(2,'u002','bella.anderson@houston.com','Bella','Anderson',29.754,-95.362,55,1,'Role1','9000000002'),(3,'u003','caleb.murphy@houston.com','Caleb','Murphy',29.7585,-95.3665,55,1,'Role1','9000000003'),(4,'u004','diana.jenkins@houston.com','Diana','Jenkins',29.762,-95.361,55,1,'Role1','9000000004'),(5,'u005','eli.foster@sanantonio.com','Eli','Foster',29.4255,-98.492,69,2,'Role1','9000000005'),(6,'u006','fiona.rivera@sanantonio.com','Fiona','Rivera',29.427,-98.494,69,2,'Role1','9000000006'),(7,'u007','george.bennett@sanantonio.com','George','Bennett',29.4288,-98.4952,69,2,'Role1','9000000007'),(8,'u008','hailey.perry@sanantonio.com','Hailey','Perry',29.426,-98.491,69,2,'Role1','9000000008'),(9,'u009','isaac.hughes@sanantonio.com','Isaac','Hughes',29.429,-98.493,69,2,'Role1','9000000009'),(10,'u010','julia.reed@dallas.com','Julia','Reed',32.7775,-96.7985,64,3,'Role1','9000000010'),(11,'u011','kevin.coleman@dallas.com','Kevin','Coleman',32.779,-96.7965,64,3,'Role2','9000000011'),(12,'u012','laura.long@dallas.com','Laura','Long',32.778,-96.799,64,3,'Role2','9000000012'),(13,'u013','mason.watson@dallas.com','Mason','Watson',32.776,-96.7975,64,3,'Role2','9000000013'),(14,'u014','natalie.morris@dallas.com','Natalie','Morris',32.775,-96.8001,64,3,'Role2','9000000014'),(15,'u015','owen.wood@austin.com','Owen','Wood',30.269,-97.7445,56,4,'Role2','9000000015'),(16,'u016','penelope.brooks@austin.com','Penelope','Brooks',30.268,-97.742,56,4,'Role2','9000000016'),(17,'u017','quentin.gray@austin.com','Quentin','Gray',30.2675,-97.745,56,4,'Role2','9000000017'),(18,'u018','rachel.watkins@austin.com','Rachel','Watkins',30.27,-97.74,56,4,'Role2','9000000018'),(19,'u019','samuel.bryant@austin.com','Samuel','Bryant',30.271,-97.7395,56,4,'Role2','9000000019'),(20,'u020','emma.walker@houston.com','Emma','Walker',29.9149,-95.8496,55,1,'Role2','9000000020'),(22,'u022','liam.smith@houston.com','Liam','Smith',29.76,-95.363,55,1,'Role3','9000000022'),(23,'u023','olivia.johnson@houston.com','Olivia','Johnson',29.755,-95.36,55,1,'Role3','9000000023'),(24,'u024','noah.williams@houston.com','Noah','Williams',29.758,-95.364,55,1,'Role3','9000000024'),(25,'u025','emma.brown@houston.com','Emma','Brown',29.761,-95.359,55,1,'Role3','9000000025'),(26,'u026','ava.davis@sanantonio.com','Ava','Davis',29.426,-98.493,69,2,'Role3','9000000026'),(27,'u027','sophia.miller@sanantonio.com','Sophia','Miller',29.428,-98.49,69,2,'Role3','9000000027'),(28,'u028','james.wilson@sanantonio.com','James','Wilson',29.427,-98.492,69,2,'Role3','9000000028'),(29,'u029','isabella.moore@sanantonio.com','Isabella','Moore',29.429,-98.494,69,2,'Role3','9000000029'),(30,'u030','benjamin.taylor@sanantonio.com','Benjamin','Taylor',29.425,-98.491,69,2,'Role3','9000000030'),(31,'u031','mia.anderson@dallas.com','Mia','Anderson',32.778,-96.797,64,3,'Role4','9000000031'),(32,'u032','charlotte.thomas@dallas.com','Charlotte','Thomas',32.776,-96.799,64,3,'Role4','9000000032'),(33,'u033','elijah.jackson@dallas.com','Elijah','Jackson',32.779,-96.796,64,3,'Role4','9000000033'),(34,'u034','amelia.white@dallas.com','Amelia','White',32.777,-96.798,64,3,'Role4','9000000034'),(35,'u035','harper.harris@dallas.com','Harper','Harris',32.775,-96.8,64,3,'Role4','9000000035'),(36,'u036','lucas.martin@austin.com','Lucas','Martin',30.268,-97.743,56,4,'Role4','9000000036'),(37,'u037','evelyn.thompson@austin.com','Evelyn','Thompson',30.27,-97.741,56,4,'Role4','9000000037'),(38,'u038','henry.garcia@austin.com','Henry','Garcia',30.267,-97.744,56,4,'Role4','9000000038'),(39,'u039','aria.martinez@austin.com','Aria','Martinez',30.269,-97.74,56,4,'Role4','9000000039'),(40,'u040','sebastian.rodriguez@austin.com','Sebastian','Rodriguez',30.271,-97.739,56,4,'Role4','9000000040'),(41,'u041','scarlett.lee@houston.com','Scarlett','Lee',29.762,-95.361,55,1,'Role5','9000000041'),(42,'u042','jackson.walker@houston.com','Jackson','Walker',29.757,-95.362,55,1,'Role5','9000000042'),(43,'u043','chloe.hall@houston.com','Chloe','Hall',29.759,-95.365,55,1,'Role5','9000000043'),(44,'u044','aiden.lewis@sanantonio.com','Aiden','Lewis',29.427,-98.492,69,2,'Role5','9000000044'),(45,'u045','zoey.robinson@sanantonio.com','Zoey','Robinson',29.426,-98.493,69,2,'Role5','9000000045'),(46,'u046','logan.clark@dallas.com','Logan','Clark',32.778,-96.798,64,3,'Role5','9000000046'),(47,'u047','lily.lewis@dallas.com','Lily','Lewis',32.776,-96.799,64,3,'Role5','9000000047'),(48,'u048','ethan.young@austin.com','Ethan','Young',30.268,-97.742,56,4,'Role5','9000000048'),(49,'u049','sophie.allen@austin.com','Sophie','Allen',30.27,-97.741,56,4,'Role5','9000000049'),(50,'u050','mason.king@houston.com','Mason','King',29.76,-95.36,55,1,'Role5','9000000050'),(51,'u051','ava.scott@houston.com','Ava','Scott',29.758,-95.363,55,1,'Role6','9000000051'),(52,'u052','liam.green@sanantonio.com','Liam','Green',29.428,-98.491,69,2,'Role6','9000000052'),(53,'u053','olivia.baker@sanantonio.com','Olivia','Baker',29.427,-98.494,69,2,'Role6','9000000053'),(54,'u054','noah.gonzalez@dallas.com','Noah','Gonzalez',32.779,-96.797,64,3,'Role6','9000000054'),(55,'u055','emma.nelson@dallas.com','Emma','Nelson',32.777,-96.798,64,3,'Role6','9000000055'),(56,'u056','sophia.carter@austin.com','Sophia','Carter',30.269,-97.743,56,4,'Role6','9000000056'),(57,'u057','james.mitchell@austin.com','James','Mitchell',30.268,-97.74,56,4,'Role6','9000000057'),(58,'u058','isabella.perez@houston.com','Isabella','Perez',29.761,-95.361,55,1,'Role6','9000000058'),(59,'u059','benjamin.roberts@houston.com','Benjamin','Roberts',29.757,-95.362,55,1,'Role6','9000000059'),(60,'u060','mia.turner@sanantonio.com','Mia','Turner',29.426,-98.492,69,2,'Role6','9000000060'),(61,'u061','charlotte.phillips@dallas.com','Charlotte','Phillips',32.778,-96.799,64,3,'Role7','9000000061');
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
  `zone_id` bigint DEFAULT NULL,
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
INSERT INTO `zip_code` VALUES (55,'75023',NULL,NULL,NULL),(56,'75024',14,NULL,NULL),(62,'75038',14,NULL,NULL),(63,'75039',NULL,NULL,NULL),(64,'75040',NULL,NULL,NULL),(69,'75050',2,NULL,NULL),(70,'75051',17,NULL,NULL),(71,'75052',17,NULL,NULL),(72,'75054',17,NULL,NULL),(73,'75060',5,NULL,NULL),(77,'75006',5,NULL,NULL),(79,'75010',5,NULL,NULL),(83,'75033',5,NULL,NULL),(84,'75034',5,NULL,NULL),(85,'75035',5,NULL,NULL),(86,'75036',5,NULL,NULL),(87,'75038',5,NULL,NULL),(88,'75039',5,NULL,NULL),(89,'75040',3,NULL,NULL),(90,'75041',3,NULL,NULL),(91,'75042',3,NULL,NULL),(92,'75043',3,NULL,NULL),(93,'75044',3,NULL,NULL),(94,'75050',2,NULL,NULL),(95,'75051',2,NULL,NULL),(96,'75052',2,NULL,NULL),(97,'75054',2,NULL,NULL),(98,'75060',5,NULL,NULL),(99,'75061',5,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zone`
--

LOCK TABLES `zone` WRITE;
/*!40000 ALTER TABLE `zone` DISABLE KEYS */;
INSERT INTO `zone` VALUES (1,'Zone1'),(2,'Zone2'),(3,'Zone3'),(4,'Zone4'),(5,'Zone5'),(14,'Zone6');
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

-- Dump completed on 2025-07-15 23:18:22
