-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: seduccion
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.24-MariaDB

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
-- Table structure for table `comportamiento_desinteres`
--

DROP TABLE IF EXISTS `comportamiento_desinteres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comportamiento_desinteres` (
  `id` int(11) NOT NULL,
  `tipo_desinteres` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comportamiento_desinteres`
--

LOCK TABLES `comportamiento_desinteres` WRITE;
/*!40000 ALTER TABLE `comportamiento_desinteres` DISABLE KEYS */;
/*!40000 ALTER TABLE `comportamiento_desinteres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comportamiento_interes`
--

DROP TABLE IF EXISTS `comportamiento_interes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comportamiento_interes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `interes` varchar(50) NOT NULL,
  `id_dav` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `interesdavs_idx` (`id_dav`),
  CONSTRAINT `interesdavs` FOREIGN KEY (`id_dav`) REFERENCES `davs_personales` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comportamiento_interes`
--

LOCK TABLES `comportamiento_interes` WRITE;
/*!40000 ALTER TABLE `comportamiento_interes` DISABLE KEYS */;
INSERT INTO `comportamiento_interes` VALUES (1,'Pasar timepo con migo',NULL),(2,'Invertir recursos economicos',NULL),(3,'Besos',NULL),(4,'Sexo',NULL);
/*!40000 ALTER TABLE `comportamiento_interes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comportamientos`
--

DROP TABLE IF EXISTS `comportamientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comportamientos` (
  `id` int(11) NOT NULL,
  `tipo_comportamiento` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comportamientos`
--

LOCK TABLES `comportamientos` WRITE;
/*!40000 ALTER TABLE `comportamientos` DISABLE KEYS */;
INSERT INTO `comportamientos` VALUES (1,'interes'),(2,'desinteres');
/*!40000 ALTER TABLE `comportamientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `condicionamiento_castigo`
--

DROP TABLE IF EXISTS `condicionamiento_castigo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `condicionamiento_castigo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `castigo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `condicionamiento_castigo`
--

LOCK TABLES `condicionamiento_castigo` WRITE;
/*!40000 ALTER TABLE `condicionamiento_castigo` DISABLE KEYS */;
INSERT INTO `condicionamiento_castigo` VALUES (1,'limitacion temporal'),(2,'Shot gun nega'),(3,'Tease nega'),(4,'Snipper nega'),(5,'Irme con otra chica opcion');
/*!40000 ALTER TABLE `condicionamiento_castigo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `condicionamiento_refuerzo`
--

DROP TABLE IF EXISTS `condicionamiento_refuerzo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `condicionamiento_refuerzo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `refuerzo` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `condicionamiento_refuerzo`
--

LOCK TABLES `condicionamiento_refuerzo` WRITE;
/*!40000 ALTER TABLE `condicionamiento_refuerzo` DISABLE KEYS */;
INSERT INTO `condicionamiento_refuerzo` VALUES (1,'Prueba de correspondencia'),(2,'Hechar candado'),(3,'Mal interpretar a mi favor'),(4,'No tan rapido nena'),(5,'tener una vida');
/*!40000 ALTER TABLE `condicionamiento_refuerzo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `condicionamientos`
--

DROP TABLE IF EXISTS `condicionamientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `condicionamientos` (
  `id` int(11) NOT NULL,
  `id_refuerzo` int(11) DEFAULT NULL,
  `id_castigo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `condicionamietocastigo_idx` (`id_castigo`),
  KEY `condicionamientorefuerzo_idx` (`id_refuerzo`),
  CONSTRAINT `condicionamientocastigo` FOREIGN KEY (`id_castigo`) REFERENCES `condicionamiento_castigo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `condicionamientorefuerzo` FOREIGN KEY (`id_refuerzo`) REFERENCES `condicionamiento_refuerzo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `condicionamientos`
--

LOCK TABLES `condicionamientos` WRITE;
/*!40000 ALTER TABLE `condicionamientos` DISABLE KEYS */;
INSERT INTO `condicionamientos` VALUES (1,NULL,NULL),(2,NULL,NULL);
/*!40000 ALTER TABLE `condicionamientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `davs_personales`
--

DROP TABLE IF EXISTS `davs_personales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `davs_personales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dav` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `davs_personales`
--

LOCK TABLES `davs_personales` WRITE;
/*!40000 ALTER TABLE `davs_personales` DISABLE KEYS */;
INSERT INTO `davs_personales` VALUES (1,'Tener estandares'),(2,'Tener una vida'),(3,'Storitellyng'),(4,'Preseleccion femenina'),(5,'Salud'),(6,'Fisico trabajado'),(7,'Tener un ala y pivote'),(8,'Habilidades sociales'),(9,'Liderazgo'),(10,'Comunicacion fectiva'),(11,'Humor'),(12,'Valor ocial'),(13,'Jugueteo'),(14,'Higiene personal'),(15,'Como con uno mismo y amistoso'),(16,'Artes marciales'),(17,'Dinero'),(18,'Expresividdad'),(19,'Protector'),(20,'Habilidades sociales'),(21,'Idis intermitentes');
/*!40000 ALTER TABLE `davs_personales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `momentos_escalada_refuerzo`
--

DROP TABLE IF EXISTS `momentos_escalada_refuerzo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `momentos_escalada_refuerzo` (
  `id_momento` int(11) NOT NULL,
  `id_refuerzo` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `momentoescaladamomento_idx` (`id_momento`),
  CONSTRAINT `momentoescaladamomento` FOREIGN KEY (`id_momento`) REFERENCES `seduccion_momentos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `momentos_escalada_refuerzo`
--

LOCK TABLES `momentos_escalada_refuerzo` WRITE;
/*!40000 ALTER TABLE `momentos_escalada_refuerzo` DISABLE KEYS */;
/*!40000 ALTER TABLE `momentos_escalada_refuerzo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proceso_seduccion`
--

DROP TABLE IF EXISTS `proceso_seduccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proceso_seduccion` (
  `id_interes` int(11) DEFAULT NULL,
  `id_desinteres` int(11) DEFAULT NULL,
  `id_tipo_comportamiento` int(11) DEFAULT NULL,
  `id_tipo_condicionamiento` int(11) DEFAULT NULL,
  `id_momento_escalada_refuerzo` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `prosesoseduccióninteres_idx` (`id_interes`),
  KEY `procesoseducciontipocomportamiento_idx` (`id_tipo_comportamiento`),
  KEY `procesoseducciontipocondicionamiento_idx` (`id_tipo_condicionamiento`),
  KEY `procesoseduccionmomentoescaladarefuerzo_idx` (`id_momento_escalada_refuerzo`),
  KEY `procesoseducciondesinteres_idx` (`id_desinteres`),
  CONSTRAINT `procesoseduccioncomportamientos` FOREIGN KEY (`id_tipo_comportamiento`) REFERENCES `comportamientos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `procesoseduccioncondicionamiento` FOREIGN KEY (`id_tipo_condicionamiento`) REFERENCES `condicionamientos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `procesoseducciondesinteres` FOREIGN KEY (`id_desinteres`) REFERENCES `comportamiento_desinteres` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `procesoseduccioninteres` FOREIGN KEY (`id_interes`) REFERENCES `comportamiento_interes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `procesoseduccionmomentoescalada` FOREIGN KEY (`id_momento_escalada_refuerzo`) REFERENCES `momentos_escalada_refuerzo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proceso_seduccion`
--

LOCK TABLES `proceso_seduccion` WRITE;
/*!40000 ALTER TABLE `proceso_seduccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `proceso_seduccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seduccion_momentos`
--

DROP TABLE IF EXISTS `seduccion_momentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seduccion_momentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `momento` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seduccion_momentos`
--

LOCK TABLES `seduccion_momentos` WRITE;
/*!40000 ALTER TABLE `seduccion_momentos` DISABLE KEYS */;
INSERT INTO `seduccion_momentos` VALUES (1,'A1'),(2,'A2'),(3,'A3'),(4,'C1'),(5,'C2'),(6,'C3'),(7,'S1'),(8,'S2'),(9,'S3'),(10,'A1'),(11,'A2'),(12,'A3'),(13,'C1'),(14,'C2'),(15,'C3'),(16,'S1'),(17,'S2'),(18,'S3');
/*!40000 ALTER TABLE `seduccion_momentos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-23 23:02:26
