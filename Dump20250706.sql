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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leaves`
--

LOCK TABLES `leaves` WRITE;
/*!40000 ALTER TABLE `leaves` DISABLE KEYS */;
INSERT INTO `leaves` VALUES (4,'2025-07-15','2025-07-20',21,55,9),(5,'2025-07-15','2025-07-20',22,58,14),(6,'2025-07-15','2025-07-21',23,65,12),(7,'2025-07-15','2025-07-22',24,94,17),(8,'2025-07-15','2025-07-19',25,104,7),(9,'2025-07-15','2025-07-20',26,69,17),(10,'2025-07-15','2025-07-22',27,70,17),(11,'2025-07-15','2025-07-19',28,105,7),(12,'2025-07-15','2025-07-21',29,56,9),(13,'2025-07-15','2025-07-20',30,53,23),(14,'2025-07-15','2025-07-22',31,59,14),(15,'2025-07-15','2025-07-19',32,64,12),(16,'2025-07-15','2025-07-20',33,108,7),(17,'2025-07-15','2025-07-21',34,55,9),(18,'2025-07-15','2025-07-22',35,54,9),(19,'2025-07-15','2025-07-19',36,52,23),(20,'2025-07-15','2025-07-20',37,66,12),(21,'2025-07-15','2025-07-22',38,109,7),(22,'2025-07-15','2025-07-21',39,110,7),(23,'2025-07-15','2025-07-20',40,111,7);
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
  PRIMARY KEY (`id`),
  KEY `FKjbwvsj60i837f831g215r72x2` (`user_id`),
  KEY `FKm0j2g7msn47xe4ro3443c028o` (`zip_code_id`),
  KEY `FKhlqtw4nc57c68otlu54k6ak97` (`zone_id`),
  CONSTRAINT `FKhlqtw4nc57c68otlu54k6ak97` FOREIGN KEY (`zone_id`) REFERENCES `zone` (`id`),
  CONSTRAINT `FKjbwvsj60i837f831g215r72x2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKm0j2g7msn47xe4ro3443c028o` FOREIGN KEY (`zip_code_id`) REFERENCES `zip_code` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shift`
--

LOCK TABLES `shift` WRITE;
/*!40000 ALTER TABLE `shift` DISABLE KEYS */;
INSERT INTO `shift` VALUES (4,'2025-07-08','2025-07-05',21,55,9),(5,'2025-07-08','2025-07-05',22,58,14),(6,'2025-07-09','2025-07-05',23,65,12),(7,'2025-07-11','2025-07-05',24,94,17),(8,'2025-07-08','2025-07-05',25,104,7),(9,'2025-07-09','2025-07-05',26,69,17),(10,'2025-07-10','2025-07-05',27,70,17),(11,'2025-07-08','2025-07-05',28,105,7),(12,'2025-07-08','2025-07-05',29,56,9),(13,'2025-07-10','2025-07-05',30,53,23),(14,'2025-07-10','2025-07-05',31,59,14),(15,'2025-07-08','2025-07-05',32,64,12),(16,'2025-07-08','2025-07-05',33,108,7),(17,'2025-07-10','2025-07-05',34,55,9),(18,'2025-07-09','2025-07-05',35,54,9),(19,'2025-07-09','2025-07-05',36,52,23),(20,'2025-07-10','2025-07-05',37,66,12),(21,'2025-07-09','2025-07-05',38,109,7),(22,'2025-07-11','2025-07-05',39,110,7),(23,'2025-07-09','2025-07-05',40,111,7);
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
  `zip_code_id` bigint DEFAULT NULL,
  `zone_id` bigint DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKo9bpv8wn66o5mbou02w2ol30d` (`zip_code_id`),
  KEY `FKnuwar4apxonwwwcgd6b8vn589` (`zone_id`),
  CONSTRAINT `FKnuwar4apxonwwwcgd6b8vn589` FOREIGN KEY (`zone_id`) REFERENCES `zone` (`id`),
  CONSTRAINT `FKo9bpv8wn66o5mbou02w2ol30d` FOREIGN KEY (`zip_code_id`) REFERENCES `zip_code` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (21,'j.smith@houstonmail.com','John','Smith',55,1,29.7604,-95.3698),(22,'e.johnson@houstonmail.com','Emily','Johnson',55,1,29.755,-95.365),(23,'m.davis@austinmail.com','Michael','Davis',56,4,30.2672,-97.7431),(24,'s.williams@austinmail.com','Sarah','Williams',56,4,30.28,-97.75),(25,'d.brown@dallascity.com','David','Brown',64,3,32.7767,-96.797),(26,'o.miller@dallascity.com','Olivia','Miller',64,3,32.78,-96.8),(27,'w.jones@elpasomail.com','William','Jones',66,6,31.7619,-106.485),(28,'g.garcia@elpasomail.com','Grace','Garcia',66,6,31.77,-106.49),(29,'j.martinez@laredotx.com','James','Martinez',90,10,27.5306,-99.4803),(30,'a.rodriguez@laredotx.com','Ava','Rodriguez',90,10,27.535,-99.485),(31,'h.harris@planoarea.com','Henry','Harris',80,9,33.0198,-96.6989),(32,'i.clark@planoarea.com','Isabella','Clark',80,9,33.025,-96.695),(33,'c.lewis@corpusmail.com','Christopher','Lewis',59,8,27.8006,-97.3964),(34,'s.walker@corpusmail.com','Sophia','Walker',59,8,27.805,-97.392),(35,'b.hall@arlingtoncity.com','Benjamin','Hall',104,7,32.7357,-97.1081),(36,'m.young@arlingtoncity.com','Mia','Young',104,7,32.74,-97.105),(37,'e.adams@fortworthmail.com','Ethan','Adams',108,5,32.7555,-97.3308),(38,'l.nelson@fortworthmail.com','Lily','Nelson',108,5,32.76,-97.335),(39,'z.scott@sanantonio.com','Zoe','Scott',69,2,29.4241,-98.4936),(40,'n.baker@sanantonio.com','Noah','Baker',69,2,29.43,-98.49),(41,'w.thompson@dallas.city.com','William','Thompson',64,3,32.7767,-96.797),(42,'o.hernandez@austin.mail.com','Olivia','Hernandez',56,4,30.2672,-97.7431),(43,'a.jackson@houstonmail.com','Andrew','Jackson',55,1,29.763,-95.36),(44,'b.anderson@houstonmail.com','Bella','Anderson',55,1,29.754,-95.362),(45,'c.murphy@houstonmail.com','Caleb','Murphy',55,1,29.7585,-95.3665),(46,'d.jenkins@houstonmail.com','Diana','Jenkins',55,1,29.762,-95.361),(47,'e.foster@sanantonio.com','Eli','Foster',69,2,29.4255,-98.492),(48,'f.rivera@sanantonio.com','Fiona','Rivera',69,2,29.427,-98.494),(49,'g.bennett@sanantonio.com','George','Bennett',69,2,29.4288,-98.4952),(50,'h.perry@sanantonio.com','Hailey','Perry',69,2,29.426,-98.491),(51,'i.hughes@sanantonio.com','Isaac','Hughes',69,2,29.429,-98.493),(52,'j.reed@dallascity.com','Julia','Reed',64,3,32.7775,-96.7985),(53,'k.coleman@dallascity.com','Kevin','Coleman',64,3,32.779,-96.7965),(54,'l.long@dallascity.com','Laura','Long',64,3,32.778,-96.799),(55,'m.watson@dallascity.com','Mason','Watson',64,3,32.776,-96.7975),(56,'n.morris@dallascity.com','Natalie','Morris',64,3,32.775,-96.8001),(57,'o.wood@austinmail.com','Owen','Wood',56,4,30.269,-97.7445),(58,'p.brooks@austinmail.com','Penelope','Brooks',56,4,30.268,-97.742),(59,'q.gray@austinmail.com','Quentin','Gray',56,4,30.2675,-97.745),(60,'r.watkins@austinmail.com','Rachel','Watkins',56,4,30.27,-97.74),(61,'s.bryant@austinmail.com','Samuel','Bryant',56,4,30.271,-97.7395),(62,'logan.martinez@houston.com','Logan','Martinez',55,1,29.71192,-95.907213),(63,'emma.walker@houston.com','Emma','Walker',55,1,29.91493,-95.849661),(64,'liam.hall@houston.com','Liam','Hall',55,1,28.791211,-95.86126),(65,'ava.young@houston.com','Ava','Young',55,1,30.030175,-95.138488),(66,'lucas.king@sanantonio.com','Lucas','King',69,2,29.35818,-98.891003),(67,'harper.green@sanantonio.com','Harper','Green',69,2,28.951129,-98.456218),(68,'mason.adams@sanantonio.com','Mason','Adams',69,2,29.609303,-98.695747),(69,'ella.baker@sanantonio.com','Ella','Baker',69,2,29.547618,-98.454006),(70,'ethan.campbell@dallas.com','Ethan','Campbell',64,3,32.922405,-96.732374),(71,'mia.mitchell@dallas.com','Mia','Mitchell',64,3,32.825384,-96.834429),(72,'james.cox@dallas.com','James','Cox',64,3,32.899381,-96.992352),(73,'scarlett.ward@dallas.com','Scarlett','Ward',64,3,32.901234,-96.754321),(74,'henry.phillips@austin.com','Henry','Phillips',56,4,30.271954,-97.763279),(75,'aria.james@austin.com','Aria','James',56,4,30.339246,-97.66958),(76,'sebastian.watson@austin.com','Sebastian','Watson',56,4,30.278206,-97.748709),(77,'grace.hughes@austin.com','Grace','Hughes',56,4,30.314008,-97.729785),(78,'jackson.wood@fortworth.com','Jackson','Wood',108,5,32.755127,-97.333776),(79,'chloe.bennett@fortworth.com','Chloe','Bennett',108,5,32.712345,-97.201234),(80,'levi.russell@fortworth.com','Levi','Russell',108,5,32.715672,-97.301456),(81,'zoey.morgan@fortworth.com','Zoey','Morgan',108,5,32.765431,-97.224678),(82,'aiden.patterson@elpaso.com','Aiden','Patterson',66,6,31.776887,-106.507089),(83,'nora.reed@elpaso.com','Nora','Reed',66,6,31.695721,-106.389908),(84,'gabriel.cooper@elpaso.com','Gabriel','Cooper',66,6,31.809763,-106.404246),(85,'luna.bailey@elpaso.com','Luna','Bailey',66,6,31.845632,-106.546822),(86,'carter.bell@arlington.com','Carter','Bell',104,7,32.701299,-97.104485),(87,'hazel.morris@arlington.com','Hazel','Morris',104,7,32.704847,-97.055034),(88,'wyatt.rogers@arlington.com','Wyatt','Rogers',104,7,32.71002,-97.133499),(89,'victoria.cook@arlington.com','Victoria','Cook',104,7,32.732457,-97.121292),(90,'jayden.foster@corpus.com','Jayden','Foster',59,8,27.709452,-97.377326),(91,'lily.morgan@corpus.com','Lily','Morgan',59,8,27.76443,-97.439806),(92,'julian.perez@corpus.com','Julian','Perez',59,8,27.751263,-97.437854),(93,'hannah.bryant@corpus.com','Hannah','Bryant',59,8,27.78862,-97.395254),(94,'nathan.bailey@plano.com','Nathan','Bailey',80,9,33.054417,-96.68901),(95,'zoe.morris@plano.com','Zoe','Morris',80,9,33.050925,-96.69765),(96,'isaiah.gray@plano.com','Isaiah','Gray',80,9,33.062513,-96.712167),(97,'camila.kelly@plano.com','Camila','Kelly',80,9,33.06854,-96.722014),(98,'christian.jenkins@laredo.com','Christian','Jenkins',90,10,27.547253,-99.504213),(99,'natalie.simpson@laredo.com','Natalie','Simpson',90,10,27.520128,-99.481013),(100,'adam.long@laredo.com','Adam','Long',90,10,27.539982,-99.491004),(101,'elena.harrison@laredo.com','Elena','Harrison',49,10,27.557022,-99.476788),(102,'amelia.hughes@houston.com','Amelia','Hughes',3,1,29.462318,-94.85627),(103,'elijah.cox@houston.com','Elijah','Cox',4,1,30.155849,-103.435487),(104,'olivia.stewart@houston.com','Olivia','Stewart',1,1,30.465279,-99.278965),(105,'jackson.fisher@houston.com','Jackson','Fisher',2,1,27.022937,-102.368388),(106,'avery.edwards@sanantonio.com','Avery','Edwards',6,2,32.289914,-95.096007),(107,'lucas.simpson@sanantonio.com','Lucas','Simpson',10,2,31.700492,-96.501685),(108,'grace.wells@sanantonio.com','Grace','Wells',7,2,31.227402,-100.224494),(109,'logan.parker@sanantonio.com','Logan','Parker',9,2,31.451593,-102.179432),(110,'zoey.murray@dallas.com','Zoey','Murray',13,3,31.294394,-94.328548),(111,'sebastian.west@dallas.com','Sebastian','West',11,3,30.186394,-100.129747),(112,'scarlett.pierce@dallas.com','Scarlett','Pierce',15,3,27.429182,-103.523008),(113,'nathan.bryant@dallas.com','Nathan','Bryant',12,3,32.242306,-102.799183),(114,'stella.ortiz@austin.com','Stella','Ortiz',20,4,26.303295,-101.707601),(115,'christian.fox@austin.com','Christian','Fox',18,4,32.462961,-97.06744),(116,'nora.mccoy@austin.com','Nora','McCoy',19,4,30.990186,-101.169134),(117,'leo.reynolds@austin.com','Leo','Reynolds',17,4,27.193264,-96.437716),(118,'hannah.hart@fortworth.com','Hannah','Hart',24,5,27.318935,-97.224982),(119,'isaiah.lane@fortworth.com','Isaiah','Lane',22,5,29.885273,-102.140772),(120,'skylar.hamilton@fortworth.com','Skylar','Hamilton',23,5,29.489354,-96.115652),(121,'connor.schmidt@fortworth.com','Connor','Schmidt',21,5,27.793718,-105.10998),(122,'ellie.austin@elpaso.com','Ellie','Austin',28,6,30.787156,-100.08918),(123,'henry.mendoza@elpaso.com','Henry','Mendoza',26,6,30.348876,-105.181693),(124,'layla.lawson@elpaso.com','Layla','Lawson',27,6,30.372029,-94.218839),(125,'aaron.bates@elpaso.com','Aaron','Bates',30,6,32.495437,-102.362041),(126,'hazel.owens@arlington.com','Hazel','Owens',32,7,29.220265,-103.140517),(127,'carter.burns@arlington.com','Carter','Burns',31,7,29.005387,-98.859902),(128,'lily.hunter@arlington.com','Lily','Hunter',33,7,32.496514,-100.446097),(129,'wyatt.sanders@arlington.com','Wyatt','Sanders',35,7,27.277171,-94.931721),(130,'camila.walters@corpuschristi.com','Camila','Walters',37,8,28.185789,-103.435146),(131,'julian.curtis@corpuschristi.com','Julian','Curtis',38,8,32.746493,-101.584157),(132,'aria.mccarthy@corpuschristi.com','Aria','McCarthy',36,8,28.573737,-101.189183),(133,'nolan.stevenson@corpuschristi.com','Nolan','Stevenson',39,8,30.351215,-105.529873),(134,'savannah.doyle@plano.com','Savannah','Doyle',42,9,28.428389,-97.090896),(135,'miles.fleming@plano.com','Miles','Fleming',44,9,27.037418,-95.640144),(136,'violet.bradley@plano.com','Violet','Bradley',43,9,30.281248,-102.303657),(137,'lincoln.newton@plano.com','Lincoln','Newton',45,9,30.926395,-98.431986),(138,'lucy.holland@laredo.com','Lucy','Holland',46,10,26.042899,-97.78661),(139,'easton.hammond@laredo.com','Easton','Hammond',47,10,30.688761,-100.659818),(140,'elena.thornton@laredo.com','Elena','Thornton',50,10,30.881354,-103.760241),(141,'adam.weber@laredo.com','Adam','Weber',48,10,27.658998,-97.701055),(142,'maria.holmes@amarillomail.com','Maria','Holmes',15,15,35.221997,-101.831297),(143,'blake.mills@amarillomail.com','Blake','Mills',15,15,35.199167,-101.845278),(144,'emma.evans@amarillomail.com','Emma','Evans',15,15,35.224444,-101.831944),(145,'owen.martin@lubbockmail.com','Owen','Martin',11,11,33.5779,-101.8552),(146,'sofia.hall@lubbockmail.com','Sofia','Hall',11,11,33.5789,-101.8572),(147,'luke.turner@lubbockmail.com','Luke','Turner',11,11,33.5809,-101.8582),(148,'ella.james@wichitafallsmail.com','Ella','James',31,31,33.9137,-98.4934),(149,'samuel.ward@wichitafallsmail.com','Samuel','Ward',31,31,33.912,-98.492),(150,'ava.grant@wichitafallsmail.com','Ava','Grant',31,31,33.9142,-98.495),(151,'liam.cole@abilenemail.com','Liam','Cole',27,27,32.4487,-99.7331),(152,'mia.ramos@abilenemail.com','Mia','Ramos',27,27,32.451,-99.732),(153,'noah.barnes@abilenemail.com','Noah','Barnes',27,27,32.447,-99.73),(154,'harper.ellis@friscomail.com','Harper','Ellis',14,14,33.1507,-96.8236),(155,'aiden.king@friscomail.com','Aiden','King',14,14,33.155,-96.82),(156,'zoe.meyer@friscomail.com','Zoe','Meyer',14,14,33.148,-96.825),(157,'isabella.steele@garlandcity.com','Isabella','Steele',12,12,32.9126,-96.6389),(158,'james.romero@garlandcity.com','James','Romero',12,12,32.91,-96.635),(159,'violet.reed@garlandcity.com','Violet','Reed',12,12,32.915,-96.64),(160,'ethan.fleming@carrolltoncity.com','Ethan','Fleming',23,23,32.9746,-96.8899),(161,'natalie.ross@carrolltoncity.com','Natalie','Ross',23,23,32.97,-96.885),(162,'jacob.daniels@carrolltoncity.com','Jacob','Daniels',23,23,32.976,-96.89);
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
INSERT INTO `zip_code` VALUES (52,'75006',23),(53,'75007',23),(54,'75010',23),(55,'75023',9),(56,'75024',9),(57,'75025',9),(58,'75033',14),(59,'75034',14),(60,'75035',14),(61,'75036',14),(62,'75038',13),(63,'75039',13),(64,'75040',12),(65,'75041',12),(66,'75042',12),(67,'75043',12),(68,'75044',12),(69,'75050',17),(70,'75051',17),(71,'75052',17),(72,'75054',17),(73,'75060',13),(77,'75006',23),(79,'75010',23),(80,'75023',9),(81,'75024',9),(82,'75025',9),(83,'75033',14),(84,'75034',14),(85,'75035',14),(86,'75036',14),(87,'75038',13),(88,'75039',13),(89,'75040',12),(90,'75041',12),(91,'75042',12),(92,'75043',12),(93,'75044',12),(94,'75050',17),(95,'75051',17),(96,'75052',17),(97,'75054',17),(98,'75060',13),(99,'75061',13),(101,'75063',13),(104,'76005',7),(105,'76006',7),(106,'76010',7),(107,'76011',7),(108,'76012',7),(109,'76013',7),(110,'76014',7),(111,'76015',7),(112,'76016',7),(113,'76017',7),(114,'76018',7);
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
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zone`
--

LOCK TABLES `zone` WRITE;
/*!40000 ALTER TABLE `zone` DISABLE KEYS */;
INSERT INTO `zone` VALUES (27,'Abilene'),(15,'Amarillo'),(7,'Arlington'),(4,'Austin'),(41,'Baytown'),(28,'Beaumont'),(18,'Brownsville'),(33,'Bryan–College Station'),(23,'Carrollton'),(43,'Cedar Park'),(40,'Conroe'),(8,'Corpus Christi'),(3,'Dallas'),(26,'Denton'),(45,'Edinburg'),(6,'El Paso'),(5,'Fort Worth'),(14,'Frisco'),(12,'Garland'),(17,'Grand Prairie'),(39,'Harlingen'),(1,'Houston'),(13,'Irving'),(19,'Killeen'),(10,'Laredo'),(42,'Leander'),(11,'Lubbock'),(22,'McAllen'),(16,'McKinney'),(21,'Mesquite'),(25,'Midland'),(46,'Mission'),(35,'New Braunfels'),(30,'Odessa'),(20,'Pasadena'),(44,'Pharr'),(9,'Plano'),(29,'Round Rock'),(38,'San Angelo'),(2,'San Antonio'),(37,'Texarkana'),(34,'The Woodlands'),(32,'Tyler'),(36,'Victoria'),(24,'Waco'),(31,'Wichita Falls');
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

-- Dump completed on 2025-07-06  7:03:16
