CREATE DATABASE  IF NOT EXISTS `KIOSCO` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `KIOSCO`;
-- MySQL dump 10.13  Distrib 8.0.19, for macos10.15 (x86_64)
--
-- Host: 127.0.0.1    Database: KIOSCO
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id_categoria` int NOT NULL AUTO_INCREMENT COMMENT 'Id de la categoria',
  `nombre_categoria` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Nombre de la categoria',
  `estado` enum('ACTIVO','INACTIVO') COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Estado',
  `fecha_creacion` date NOT NULL COMMENT 'Fecha de Creacion',
  `hora_creacion` time NOT NULL COMMENT 'Hora de Creacion',
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'CAMIBUSOS','ACTIVO','2020-10-07','22:05:00'),(2,'BLUSAS','ACTIVO','2020-10-07','22:08:00'),(3,'CHAQUETAS','ACTIVO','2020-10-07','22:08:00'),(4,'CONJUNTOS','ACTIVO','2020-10-07','22:08:00'),(5,'FALDAS','ACTIVO','2020-10-07','22:08:00'),(6,'PANTALONES','ACTIVO','2020-10-07','22:08:00'),(7,'VESTIDOS','ACTIVO','2020-10-07','22:08:00'),(8,'ZAPATOS','ACTIVO','2020-10-07','22:08:00'),(9,'BERMUDAS','ACTIVO','2020-10-07','22:11:00');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id_cliente` int NOT NULL AUTO_INCREMENT COMMENT 'Id del cliente',
  `cedula` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Cedula del cliente',
  `nombres` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Nombre del Cliente',
  `apellidos` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Nombre del Cliente',
  `fecha_nacimiento` date NOT NULL COMMENT 'Fecha de Nacimento',
  `correo` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Correo del cliente',
  `telefono` int NOT NULL COMMENT 'Telefono contacto del cliente',
  `contrasenia` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Hash de la contrasena del cliente',
  `estado` enum('ACTIVO','INACTIVO') COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Estado',
  `fecha_creacion` date NOT NULL COMMENT 'Fecha de Creacion',
  `hora_creacion` time NOT NULL COMMENT 'Hora de Creacion',
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'1013647676','ALEJANDRO','LEAL LOZANO','1994-02-25','alejohleal2508@outlook.com',2147483647,'e5bd046407d04e528ede63abd91cf2cb532cc71f','ACTIVO','2020-11-23','02:31:02');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_producto`
--

DROP TABLE IF EXISTS `detalle_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_producto` (
  `id_detalle_producto` int NOT NULL AUTO_INCREMENT COMMENT 'Id detalle producto',
  `fk_id_producto` int NOT NULL COMMENT 'FK Id producto',
  `imagen` tinytext COLLATE utf8_unicode_ci NOT NULL COMMENT 'Url de la imagen del producto',
  `tallas` varchar(30) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tallas Disponibles',
  `estado` enum('ACTIVO','INACTIVO') COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Estado',
  `fecha_creacion` date NOT NULL COMMENT 'Fecha de Creacion',
  `hora_creacion` time NOT NULL COMMENT 'Hora de Creacion',
  PRIMARY KEY (`id_detalle_producto`,`fk_id_producto`),
  KEY `fk_id_producto` (`fk_id_producto`),
  CONSTRAINT `detalle_producto_ibfk_1` FOREIGN KEY (`fk_id_producto`) REFERENCES `productos` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=227 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_producto`
--

LOCK TABLES `detalle_producto` WRITE;
/*!40000 ALTER TABLE `detalle_producto` DISABLE KEYS */;
INSERT INTO `detalle_producto` VALUES (1,1,'images/mujeres/blusas/blusa-espalda-abierta.jpeg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(2,2,'images/mujeres/blusas/body-con-escote-en-v.jpeg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(3,3,'images/mujeres/blusas/body-manga-larga-con-hombreras.jpeg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(4,4,'images/mujeres/blusas/body-tiras-blonda.jpeg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(5,5,'images/mujeres/blusas/camisa-blonda-manga-larga.jpeg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(6,6,'images/mujeres/blusas/camisa-con-perlas.jpg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(7,7,'images/mujeres/blusas/camisa-corta-boleros.jpeg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(8,8,'images/mujeres/blusas/camisa-de-lentejuelas.jpeg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(9,9,'images/mujeres/blusas/camisa-espalda-abierta.jpeg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(10,10,'images/mujeres/blusas/camisa-larga-plisada.jpg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(11,11,'images/mujeres/blusas/camisa-manga-ancha-peblum.jpeg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(12,12,'images/mujeres/blusas/camisa-manga-larga.jpeg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(13,13,'images/mujeres/blusas/camisa-mangas-largas.jpg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(14,14,'images/mujeres/blusas/camisa-peblum-de-lentejuelas.jpeg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(15,15,'images/mujeres/blusas/camisa-peblum-manga-larga.jpeg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(16,16,'images/mujeres/blusas/camisa-peplum-manga-larga.jpg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(17,17,'images/mujeres/blusas/camisa-plisada-con-boleros.jpeg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(18,18,'images/mujeres/blusas/camisa-plisada-manga-larga.jpg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(19,19,'images/mujeres/blusas/camisa-satin.jpeg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(20,20,'images/mujeres/blusas/camisa-tiras-peblum.jpeg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(21,21,'images/mujeres/blusas/camisa-tiras.jpg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(22,22,'images/mujeres/blusas/crop-top-amarrar-manga-larga.jpeg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(23,23,'images/mujeres/blusas/crop-top-blonda-manga-corta.jpg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(24,24,'images/mujeres/blusas/crop-top-de-copas.jpg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(25,25,'images/mujeres/blusas/crop-top-de-encaje-con-cremallera.jpg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(26,26,'images/mujeres/blusas/crop-top-victoriano-blonda.jpeg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(27,27,'images/mujeres/blusas/crop-top.jpg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(28,28,'images/mujeres/blusas/saco-boleros.jpg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(29,29,'images/mujeres/blusas/saco-victoriano.jpeg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(30,30,'images/mujeres/chaquetas/abrigo-largo-manga-bolero.jpg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(31,31,'images/mujeres/chaquetas/blazer-botones.jpg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(32,32,'images/mujeres/chaquetas/buso-hoodie-marfil.jpg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(33,33,'images/mujeres/chaquetas/buso-pullover-perchado.jpg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(34,34,'images/mujeres/chaquetas/chaqueta-amaia.jpg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(35,35,'images/mujeres/chaquetas/chaqueta-apliques-espalda.jpeg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(36,36,'images/mujeres/chaquetas/chaqueta-aria.jpg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(37,37,'images/mujeres/chaquetas/chaqueta-bomber.jpg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(38,38,'images/mujeres/chaquetas/chaqueta-brittany.jpg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(39,39,'images/mujeres/chaquetas/chaqueta-capa-estampada.jpg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(40,40,'images/mujeres/chaquetas/chaqueta-con-cierre-delantero.jpg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(41,41,'images/mujeres/chaquetas/chaqueta-de-cuerina-taches.jpg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(42,42,'images/mujeres/chaquetas/chaqueta-de-drill-militar.jpg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(43,43,'images/mujeres/chaquetas/chaqueta-denim.jpg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(44,44,'images/mujeres/chaquetas/chaqueta-elizabeth.jpg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(45,45,'images/mujeres/chaquetas/chaqueta-flecos.jpg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(46,46,'images/mujeres/chaquetas/chaqueta-greeicy.jpg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(47,47,'images/mujeres/chaquetas/chaqueta-karina.jpg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(48,48,'images/mujeres/chaquetas/chaqueta-lentejuelas-denim.jpeg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(49,49,'images/mujeres/chaquetas/chaqueta-marnie.jpg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(50,50,'images/mujeres/chaquetas/chaqueta-rompevientos.jpg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(51,51,'images/mujeres/chaquetas/chaqueta-taches-denim.jpg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(52,52,'images/mujeres/chaquetas/chaqueta-taches-y-tiras.jpg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(53,53,'images/mujeres/chaquetas/chaqueta-typer.jpg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(54,54,'images/mujeres/chaquetas/chaqueta-unicolor-manga-larga.jpg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(55,55,'images/mujeres/chaquetas/chaqueta-zully.jpg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(56,56,'images/mujeres/chaquetas/enterizo-corto-mostaza.jpg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(57,57,'images/mujeres/chaquetas/saco-con-cuello-tortuga.jpg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(58,58,'images/mujeres/chaquetas/saco-de-cuadros.jpg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(59,59,'images/mujeres/conjuntos/brenda-set-top-y-pantalon.jpg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(60,60,'images/mujeres/conjuntos/conjunto-blusa-y-pantalon-unicolor.jpg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(61,61,'images/mujeres/conjuntos/enterizo-a-rayas.jpg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(62,62,'images/mujeres/conjuntos/enterizo-amalia.jpg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(63,63,'images/mujeres/conjuntos/enterizo-amelia.jpg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(64,64,'images/mujeres/conjuntos/enterizo-britany.jpg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(65,65,'images/mujeres/conjuntos/enterizo-con-blonda-en-la-espalda.jpg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(66,66,'images/mujeres/conjuntos/enterizo-dama-escote-cruzado.jpg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(67,67,'images/mujeres/conjuntos/enterizo-dayelin.jpg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(68,68,'images/mujeres/conjuntos/enterizo-estampado.jpg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(69,69,'images/mujeres/conjuntos/enterizo-evelyn.jpg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(70,70,'images/mujeres/conjuntos/enterizo-floral.jpg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(71,71,'images/mujeres/conjuntos/enterizo-flores.jpg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(72,72,'images/mujeres/conjuntos/enterizo-largo-flores.jpg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(73,73,'images/mujeres/conjuntos/enterizo-lilian.jpg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(74,74,'images/mujeres/conjuntos/enterizo-macondo.jpg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(75,75,'images/mujeres/conjuntos/enterizo-nini.jpg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(76,76,'images/mujeres/conjuntos/enterizo-persy.jpg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(77,77,'images/mujeres/conjuntos/enterizo-raffaella.jpg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(78,78,'images/mujeres/conjuntos/enterizo-rayas.jpg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(79,79,'images/mujeres/conjuntos/enterizo-rojo.jpg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(80,80,'images/mujeres/conjuntos/enterizo-samay.jpg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(81,81,'images/mujeres/conjuntos/enterizo-sol.jpg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(82,82,'images/mujeres/conjuntos/enterizo-staicy.jpg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(83,83,'images/mujeres/conjuntos/enterizo-terracota.jpg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(84,84,'images/mujeres/conjuntos/enterizo-unicolor-con-brillo.jpg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(85,85,'images/mujeres/conjuntos/enterizo-vino-flores.jpg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(86,86,'images/mujeres/conjuntos/enterizo-vino.jpg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(87,87,'images/mujeres/conjuntos/overal-denim.jpg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(88,88,'images/mujeres/conjuntos/overol-mercy.jpg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(89,89,'images/mujeres/faldas/falda-carol.jpg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(90,90,'images/mujeres/faldas/falda-corta-con-bolero.jpg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(91,91,'images/mujeres/faldas/falda-corta-con-cierre.jpg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(92,92,'images/mujeres/faldas/falda-corta-con-correa.jpg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(93,93,'images/mujeres/faldas/falda-corta-con-cortes.jpg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(94,94,'images/mujeres/faldas/falda-corta-de-lentejuelas.jpg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(95,95,'images/mujeres/faldas/falda-corta-estampado.jpg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(96,96,'images/mujeres/faldas/falda-corta-gamuza.jpg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(97,97,'images/mujeres/faldas/falda-daniela.jpg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(98,98,'images/mujeres/faldas/falda-denim.jpg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(99,99,'images/mujeres/faldas/falda-dominica.jpg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(100,100,'images/mujeres/faldas/falda-en-denim.jpg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(101,101,'images/mujeres/faldas/falda-estampado-camufado.jpg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(102,102,'images/mujeres/faldas/falda-julissa.jpg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(103,103,'images/mujeres/faldas/falda-lapiz.jpg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(104,104,'images/mujeres/faldas/falda-larga-azul-oscuro.jpg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(105,105,'images/mujeres/faldas/falda-larga-cruzada.jpg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(106,106,'images/mujeres/faldas/falda-larga-plisada.jpg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(107,107,'images/mujeres/faldas/falda-laury.jpg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(108,108,'images/mujeres/faldas/falda-lyanna.jpg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(109,109,'images/mujeres/faldas/falda-mercy.jpg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(110,110,'images/mujeres/faldas/falda-midi.jpg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(111,111,'images/mujeres/faldas/falda-pitillo.jpg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(112,112,'images/mujeres/faldas/falda-rosado-flores.jpg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(113,113,'images/mujeres/faldas/falda-sara.jpg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(114,114,'images/mujeres/faldas/falda-scarlett.jpg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(115,115,'images/mujeres/faldas/falda-talle-alto.jpg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(116,116,'images/mujeres/faldas/falda-tubo.jpg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(117,117,'images/mujeres/faldas/falda-ximena.jpg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(118,118,'images/mujeres/faldas/falda-yineth.jpg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(119,119,'images/mujeres/pantalones/jean-beth.jpg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(120,120,'images/mujeres/pantalones/jean-boyfriend.jpg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(121,121,'images/mujeres/pantalones/jean-densy.jpg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(122,122,'images/mujeres/pantalones/jean-macondo.jpg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(123,123,'images/mujeres/pantalones/jean-mercy.jpg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(124,124,'images/mujeres/pantalones/jean-mom-fit.jpeg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(125,125,'images/mujeres/pantalones/jean-rotos.jpg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(126,126,'images/mujeres/pantalones/jean-skinny.jpg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(127,127,'images/mujeres/pantalones/jean-tiro-alto.jpeg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(128,128,'images/mujeres/pantalones/jeans-culotte.jpg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(129,129,'images/mujeres/pantalones/jeans-mom.jpg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(130,130,'images/mujeres/pantalones/pantalon-a-cuadros.jpg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(131,131,'images/mujeres/pantalones/pantalon-bernes.jpg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(132,132,'images/mujeres/pantalones/pantalon-bota-campana.jpg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(133,133,'images/mujeres/pantalones/pantalon-bota-elefante.jpg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(134,134,'images/mujeres/pantalones/pantalon-cargo.jpg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(135,135,'images/mujeres/pantalones/pantalon-con-abertura.jpeg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(136,136,'images/mujeres/pantalones/pantalon-con-pliegues.jpg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(137,137,'images/mujeres/pantalones/pantalon-culotte-con-botones.jpeg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(138,138,'images/mujeres/pantalones/pantalon-culotte-de-pliegues.jpg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(139,139,'images/mujeres/pantalones/pantalon-culotte-plisado.jpg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(140,140,'images/mujeres/pantalones/pantalon-de-cuadros.jpg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(141,141,'images/mujeres/pantalones/pantalon-detalle-bota-campana.jpg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(142,142,'images/mujeres/pantalones/pantalon-lola.jpg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(143,143,'images/mujeres/pantalones/pantalon-negro-plisado.jpeg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(144,144,'images/mujeres/pantalones/pantalon-palazzo.jpeg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(145,145,'images/mujeres/pantalones/pantalon-tiro-alto.jpeg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(146,146,'images/mujeres/pantalones/short-de-jean.jpg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(147,147,'images/mujeres/pantalones/short-mercy.jpg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(148,148,'images/mujeres/pantalones/shorts-denim.jpg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(149,149,'images/mujeres/vestidos/saco-vestido-cuello-tortuga.jpeg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(150,150,'images/mujeres/vestidos/saco-vestido-de-cuadros.jpg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(151,151,'images/mujeres/vestidos/vestido-a-cuadros.jpg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(152,152,'images/mujeres/vestidos/vestido-alexa.jpg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(153,153,'images/mujeres/vestidos/vestido-amara.jpg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(154,154,'images/mujeres/vestidos/vestido-anny.jpg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(155,155,'images/mujeres/vestidos/vestido-arelys.jpg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(156,156,'images/mujeres/vestidos/vestido-bordado.jpg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(157,157,'images/mujeres/vestidos/vestido-brillante-cruzado.jpg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(158,158,'images/mujeres/vestidos/vestido-charlot.jpg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(159,159,'images/mujeres/vestidos/vestido-clarissa.jpg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(160,160,'images/mujeres/vestidos/vestido-collet.jpg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(161,161,'images/mujeres/vestidos/vestido-con-nudo.jpg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(162,162,'images/mujeres/vestidos/vestido-con-tiras.jpg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(163,163,'images/mujeres/vestidos/vestido-corto-con-bolero.jpg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(164,164,'images/mujeres/vestidos/vestido-corto-con-top.jpg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(165,165,'images/mujeres/vestidos/vestido-dorado-de-corte-imperio.jpg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(166,166,'images/mujeres/vestidos/vestido-estampado-pepas.jpg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(167,167,'images/mujeres/vestidos/vestido-frente-cruzado.jpg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(168,168,'images/mujeres/vestidos/vestido-halter.jpg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(169,169,'images/mujeres/vestidos/vestido-juana.jpg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(170,170,'images/mujeres/vestidos/vestido-karol.jpg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(171,171,'images/mujeres/vestidos/vestido-largo-de-lentejuelas-con-abertura.jpeg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(172,172,'images/mujeres/vestidos/vestido-largo-tiras.jpg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(173,173,'images/mujeres/vestidos/vestido-laura.jpg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(174,174,'images/mujeres/vestidos/vestido-manga-sisa.jpg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(175,175,'images/mujeres/vestidos/vestido-marfil-rayas.jpg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(176,176,'images/mujeres/vestidos/vestido-midi.jpg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(177,177,'images/mujeres/vestidos/vestido-miranda.jpg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(178,178,'images/mujeres/vestidos/vestido-natalie.jpg','S|M|L|XL','ACTIVO','2020-11-09','23:10:10'),(179,179,'images/mujeres/zapatos/antonie.jpg','34|35|37|38|39|40','ACTIVO','2020-11-09','23:10:10'),(180,180,'images/mujeres/zapatos/barunka.jpeg','34|35|37|38|39|40','ACTIVO','2020-11-09','23:10:10'),(181,181,'images/mujeres/zapatos/botines-altos.jpeg','34|35|37|38|39|40','ACTIVO','2020-11-09','23:10:10'),(182,182,'images/mujeres/zapatos/botines-de-plataforma-y-tacon.jpg','34|35|37|38|39|40','ACTIVO','2020-11-09','23:10:10'),(183,183,'images/mujeres/zapatos/botines-plataforma.jpeg','34|35|37|38|39|40','ACTIVO','2020-11-09','23:10:10'),(184,184,'images/mujeres/zapatos/botines-tela.jpeg','34|35|37|38|39|40','ACTIVO','2020-11-09','23:10:10'),(185,185,'images/mujeres/zapatos/botines-warfare.jpeg','34|35|37|38|39|40','ACTIVO','2020-11-09','23:10:10'),(186,186,'images/mujeres/zapatos/coraima.jpg','34|35|37|38|39|40','ACTIVO','2020-11-09','23:10:10'),(187,187,'images/mujeres/zapatos/coretta.jpg','34|35|37|38|39|40','ACTIVO','2020-11-09','23:10:10'),(188,188,'images/mujeres/zapatos/eberta.jpeg','34|35|37|38|39|40','ACTIVO','2020-11-09','23:10:10'),(189,189,'images/mujeres/zapatos/lindsay.jpg','34|35|37|38|39|40','ACTIVO','2020-11-09','23:10:10'),(190,190,'images/mujeres/zapatos/monster-tenis.jpg','34|35|37|38|39|40','ACTIVO','2020-11-09','23:10:10'),(191,191,'images/mujeres/zapatos/rubby.jpg','34|35|37|38|39|40','ACTIVO','2020-11-09','23:10:10'),(192,192,'images/mujeres/zapatos/sandalia-angely.jpg','34|35|37|38|39|40','ACTIVO','2020-11-09','23:10:10'),(193,193,'images/mujeres/zapatos/sandalias-altas.jpg','34|35|37|38|39|40','ACTIVO','2020-11-09','23:10:10'),(194,194,'images/mujeres/zapatos/sandalias-tacon-grueso-con-moคo.jpg','34|35|37|38|39|40','ACTIVO','2020-11-09','23:10:10'),(195,195,'images/mujeres/zapatos/sandalias-tacon-grueso.jpg','34|35|37|38|39|40','ACTIVO','2020-11-09','23:10:10'),(196,196,'images/mujeres/zapatos/tacon-lighting.jpg','34|35|37|38|39|40','ACTIVO','2020-11-09','23:10:10'),(197,197,'images/mujeres/zapatos/tacon-velvet.jpeg','34|35|37|38|39|40','ACTIVO','2020-11-09','23:10:10'),(198,198,'images/mujeres/zapatos/tacones.jpeg','34|35|37|38|39|40','ACTIVO','2020-11-09','23:10:10'),(199,199,'images/mujeres/zapatos/tenis-blanco-pastel.jpg','34|35|37|38|39|40','ACTIVO','2020-11-09','23:10:10'),(200,200,'images/mujeres/zapatos/tenis-blancos-con-charol.jpg','34|35|37|38|39|40','ACTIVO','2020-11-09','23:10:10'),(201,201,'images/mujeres/zapatos/tenis-glamour-rosados.jpg','34|35|37|38|39|40','ACTIVO','2020-11-09','23:10:10'),(202,202,'images/mujeres/zapatos/tenis-perla-tornasol.jpg','34|35|37|38|39|40','ACTIVO','2020-11-09','23:10:10'),(203,203,'images/mujeres/zapatos/tenis-poderosa-rosados.jpg','34|35|37|38|39|40','ACTIVO','2020-11-09','23:10:10'),(204,204,'images/mujeres/zapatos/tenis-suela-alta.jpg','34|35|37|38|39|40','ACTIVO','2020-11-09','23:10:10'),(205,205,'images/mujeres/zapatos/tenis-unica-rosados.jpg','34|35|37|38|39|40','ACTIVO','2020-11-09','23:10:10'),(206,206,'images/mujeres/zapatos/velvetin.jpg','34|35|37|38|39|40','ACTIVO','2020-11-09','23:10:10'),(207,207,'images/mujeres/zapatos/zapatilla-capellada.jpg','34|35|37|38|39|40','ACTIVO','2020-11-09','23:10:10'),(208,208,'images/mujeres/zapatos/zoe.jpg','34|35|37|38|39|40','ACTIVO','2020-11-09','23:10:10'),(209,209,'images/hombres/bermudas/bermuda-amarilla.jpeg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(210,210,'images/hombres/bermudas/bermuda-azul-oscura.jpeg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(211,211,'images/hombres/bermudas/bermuda-azul.jpeg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(212,212,'images/hombres/bermudas/bermuda-beige.jpeg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(213,213,'images/hombres/bermudas/bermuda-blanca.jpeg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(214,214,'images/hombres/bermudas/bermuda-gris.jpeg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(215,215,'images/hombres/bermudas/bermuda-negra.jpeg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(216,216,'images/hombres/bermudas/bermuda-rosada.jpeg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(217,217,'images/hombres/camibusos/camibuso-blanco-classic.jpeg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(218,218,'images/hombres/camibusos/camibuso-blanco-get.jpeg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(219,219,'images/hombres/camibusos/camibuso-blanco-jackerson.jpeg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(220,220,'images/hombres/camibusos/camibuso-blanco-trendy.jpeg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(221,221,'images/hombres/camibusos/camibuso-cafe.jpeg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(222,222,'images/hombres/camibusos/camibuso-gris-oscuro.jpeg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(223,223,'images/hombres/camibusos/camibuso-gris.jpeg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(224,224,'images/hombres/camibusos/camibuso-naranja-classic.jpeg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(225,225,'images/hombres/camibusos/camibuso-naranja.jpeg','S|M|L','ACTIVO','2020-11-09','23:10:10'),(226,226,'images/hombres/camibusos/camibuso-negro.jpeg','S|M|L','ACTIVO','2020-11-09','23:10:10');
/*!40000 ALTER TABLE `detalle_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_ventas`
--

DROP TABLE IF EXISTS `detalle_ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_ventas` (
  `id_detalle_venta` int NOT NULL AUTO_INCREMENT COMMENT 'Id detalle de la venta',
  `fk_id_consecutivo_venta` int NOT NULL COMMENT 'Fk Id consecutivo de la venta',
  `fk_id_producto` int NOT NULL COMMENT 'FK Id del producto',
  `cantidad` int NOT NULL COMMENT 'Cantidad detallada',
  `talla` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `estado` enum('ACTIVO','INACTIVO') COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Estado',
  `fecha_creacion` date NOT NULL COMMENT 'Fecha de Creacion',
  `hora_creacion` time NOT NULL COMMENT 'Hora de Creacion',
  PRIMARY KEY (`id_detalle_venta`,`fk_id_consecutivo_venta`,`fk_id_producto`),
  KEY `fk_id_consecutivo_venta` (`fk_id_consecutivo_venta`),
  KEY `fk_id_producto` (`fk_id_producto`),
  CONSTRAINT `detalle_ventas_ibfk_1` FOREIGN KEY (`fk_id_consecutivo_venta`) REFERENCES `ventas` (`id_consecutivo_venta`),
  CONSTRAINT `detalle_ventas_ibfk_2` FOREIGN KEY (`fk_id_producto`) REFERENCES `productos` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_ventas`
--

LOCK TABLES `detalle_ventas` WRITE;
/*!40000 ALTER TABLE `detalle_ventas` DISABLE KEYS */;
INSERT INTO `detalle_ventas` VALUES (1,1,1,1,'M','ACTIVO','2020-11-24','05:34:43'),(2,1,2,3,'S','ACTIVO','2020-11-24','05:34:43');
/*!40000 ALTER TABLE `detalle_ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `generos`
--

DROP TABLE IF EXISTS `generos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `generos` (
  `id_genero` int NOT NULL AUTO_INCREMENT COMMENT 'Id del genero',
  `descripcion` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Descripcion',
  `estado` enum('ACTIVO','INACTIVO') COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Estado',
  `fecha_creacion` date NOT NULL COMMENT 'Fecha de Creacion',
  `hora_creacion` time NOT NULL COMMENT 'Hora de Creacion',
  PRIMARY KEY (`id_genero`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `generos`
--

LOCK TABLES `generos` WRITE;
/*!40000 ALTER TABLE `generos` DISABLE KEYS */;
INSERT INTO `generos` VALUES (1,'NIÑOS','ACTIVO','2020-10-07','22:00:00'),(2,'MUJERES','ACTIVO','2020-10-07','22:00:00'),(3,'HOMBRES','ACTIVO','2020-10-07','22:00:00'),(4,'OTROS','INACTIVO','2020-10-07','22:00:00');
/*!40000 ALTER TABLE `generos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `generos_categorias`
--

DROP TABLE IF EXISTS `generos_categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `generos_categorias` (
  `id_genero_categoria` int NOT NULL AUTO_INCREMENT COMMENT 'Id Genero Categoria',
  `fk_id_genero` int NOT NULL COMMENT 'FK Id del genero',
  `fk_id_categoria` int NOT NULL COMMENT 'FK Id de la categoria',
  `estado` enum('ACTIVO','INACTIVO') COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Estado',
  `fecha_creacion` date NOT NULL COMMENT 'Fecha de Creacion',
  `hora_creacion` time NOT NULL COMMENT 'Hora de Creacion',
  PRIMARY KEY (`id_genero_categoria`,`fk_id_genero`,`fk_id_categoria`),
  KEY `fk_id_genero` (`fk_id_genero`),
  KEY `fk_id_categoria` (`fk_id_categoria`),
  CONSTRAINT `generos_categorias_ibfk_1` FOREIGN KEY (`fk_id_genero`) REFERENCES `generos` (`id_genero`),
  CONSTRAINT `generos_categorias_ibfk_2` FOREIGN KEY (`fk_id_categoria`) REFERENCES `categorias` (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `generos_categorias`
--

LOCK TABLES `generos_categorias` WRITE;
/*!40000 ALTER TABLE `generos_categorias` DISABLE KEYS */;
INSERT INTO `generos_categorias` VALUES (1,2,2,'ACTIVO','2020-10-07','22:14:00'),(2,2,3,'ACTIVO','2020-10-07','22:14:00'),(3,2,4,'ACTIVO','2020-10-07','22:14:00'),(4,2,5,'ACTIVO','2020-10-07','22:14:00'),(5,2,6,'ACTIVO','2020-10-07','22:14:00'),(6,2,7,'ACTIVO','2020-10-07','22:14:00'),(7,2,8,'ACTIVO','2020-10-07','22:14:00'),(8,3,1,'ACTIVO','2020-10-07','22:15:00'),(9,3,9,'ACTIVO','2020-10-07','22:15:00');
/*!40000 ALTER TABLE `generos_categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id_producto` int NOT NULL AUTO_INCREMENT COMMENT 'Id del producto',
  `fk_id_genero_categoria` int NOT NULL COMMENT 'FK Id del genero categoria',
  `nombre_producto` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Nombre del producto',
  `unidades_disponibles` int NOT NULL DEFAULT '0' COMMENT 'Unidades disponibles',
  `precio_unitario` double NOT NULL COMMENT 'Precio Unitario',
  `estado` enum('ACTIVO','INACTIVO') COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Estado',
  `fecha_creacion` date NOT NULL COMMENT 'Fecha de Creacion',
  `hora_creacion` time NOT NULL COMMENT 'Hora de Creacion',
  PRIMARY KEY (`id_producto`),
  KEY `fk_id_genero_categoria` (`fk_id_genero_categoria`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`fk_id_genero_categoria`) REFERENCES `generos_categorias` (`id_genero_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=227 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,1,'blusa espalda abierta',10,96900,'ACTIVO','2020-10-08','00:12:00'),(2,1,'body con escote en v',15,128900,'ACTIVO','2020-10-08','00:12:00'),(3,1,'body manga larga con hombreras',30,135900,'ACTIVO','2020-10-08','00:12:00'),(4,1,'body tiras blonda',69,128000,'ACTIVO','2020-10-08','00:12:00'),(5,1,'camisa blonda manga larga',98,98900,'ACTIVO','2020-10-08','00:12:00'),(6,1,'camisa con perlas',56,93900,'ACTIVO','2020-10-08','00:12:00'),(7,1,'camisa corta boleros',2,69900,'ACTIVO','2020-10-08','00:12:00'),(8,1,'camisa de lentejuelas',14,84900,'ACTIVO','2020-10-08','00:12:00'),(9,1,'camisa espalda abierta',4,108900,'ACTIVO','2020-10-08','00:12:00'),(10,1,'camisa larga plisada',14,144900,'ACTIVO','2020-10-08','00:12:00'),(11,1,'camisa manga ancha peblum',235,124900,'ACTIVO','2020-10-08','00:12:00'),(12,1,'camisa manga larga',12,138900,'ACTIVO','2020-10-08','00:12:00'),(13,1,'camisa mangas largas',1,68000,'ACTIVO','2020-10-08','00:12:00'),(14,1,'camisa peblum de lentejuelas',7,84900,'ACTIVO','2020-10-08','00:12:00'),(15,1,'camisa peblum manga larga',2,134900,'ACTIVO','2020-10-08','00:12:00'),(16,1,'camisa peplum manga larga',78,139900,'ACTIVO','2020-10-08','00:12:00'),(17,1,'camisa plisada con boleros',4,93900,'ACTIVO','2020-10-08','00:12:00'),(18,1,'camisa plisada manga larga',2,133900,'ACTIVO','2020-10-08','00:12:00'),(19,1,'camisa satin',345,95900,'ACTIVO','2020-10-08','00:12:00'),(20,1,'camisa tiras peblum',4,97900,'ACTIVO','2020-10-08','00:12:00'),(21,1,'camisa tiras',2,89900,'ACTIVO','2020-10-08','00:12:00'),(22,1,'crop top amarrar manga larga',7,78900,'ACTIVO','2020-10-08','00:12:00'),(23,1,'crop top blonda manga corta',24,144900,'ACTIVO','2020-10-08','00:12:00'),(24,1,'crop top de copas',7,44000,'ACTIVO','2020-10-08','00:12:00'),(25,1,'crop top de encaje con cremallera',53,45000,'ACTIVO','2020-10-08','00:12:00'),(26,1,'crop top victoriano blonda',9,44900,'ACTIVO','2020-10-08','00:12:00'),(27,1,'crop top',3,97900,'ACTIVO','2020-10-08','00:12:00'),(28,1,'saco boleros',45,159900,'ACTIVO','2020-10-08','00:12:00'),(29,1,'saco victoriano',68,112900,'ACTIVO','2020-10-08','00:12:00'),(30,2,'abrigo largo manga bolero',10,194900,'ACTIVO','2020-10-08','00:12:00'),(31,2,'blazer botones',15,194900,'ACTIVO','2020-10-08','00:12:00'),(32,2,'buso hoodie marfil',30,64000,'ACTIVO','2020-10-08','00:12:00'),(33,2,'buso pullover perchado',69,54000,'ACTIVO','2020-10-08','00:12:00'),(34,2,'chaqueta amaia',98,116900,'ACTIVO','2020-10-08','00:12:00'),(35,2,'chaqueta apliques espalda',56,294900,'ACTIVO','2020-10-08','00:12:00'),(36,2,'chaqueta aria',2,90000,'ACTIVO','2020-10-08','00:12:00'),(37,2,'chaqueta bomber',14,96000,'ACTIVO','2020-10-08','00:12:00'),(38,2,'chaqueta brittany',4,138900,'ACTIVO','2020-10-08','00:12:00'),(39,2,'chaqueta capa estampada',14,170000,'ACTIVO','2020-10-08','00:12:00'),(40,2,'chaqueta con cierre delantero',235,106000,'ACTIVO','2020-10-08','00:12:00'),(41,2,'chaqueta de cuerina taches',12,198000,'ACTIVO','2020-10-08','00:12:00'),(42,2,'chaqueta de drill militar',1,195000,'ACTIVO','2020-10-08','00:12:00'),(43,2,'chaqueta denim',7,189900,'ACTIVO','2020-10-08','00:12:00'),(44,2,'chaqueta elizabeth',2,138000,'ACTIVO','2020-10-08','00:12:00'),(45,2,'chaqueta flecos',78,279900,'ACTIVO','2020-10-08','00:12:00'),(46,2,'chaqueta greeicy',4,139900,'ACTIVO','2020-10-08','00:12:00'),(47,2,'chaqueta karina',2,77000,'ACTIVO','2020-10-08','00:12:00'),(48,2,'chaqueta lentejuelas denim',345,84900,'ACTIVO','2020-10-08','00:12:00'),(49,2,'chaqueta marnie',4,112000,'ACTIVO','2020-10-08','00:12:00'),(50,2,'chaqueta rompevientos',2,100000,'ACTIVO','2020-10-08','00:12:00'),(51,2,'chaqueta taches denim',7,289900,'ACTIVO','2020-10-08','00:12:00'),(52,2,'chaqueta taches y tiras',24,294900,'ACTIVO','2020-10-08','00:12:00'),(53,2,'chaqueta typer',7,110000,'ACTIVO','2020-10-08','00:12:00'),(54,2,'chaqueta unicolor manga larga',53,115000,'ACTIVO','2020-10-08','00:12:00'),(55,2,'chaqueta zully',9,83900,'ACTIVO','2020-10-08','00:12:00'),(56,2,'enterizo corto mostaza',3,60000,'ACTIVO','2020-10-08','00:12:00'),(57,2,'saco con cuello tortuga',45,159900,'ACTIVO','2020-10-08','00:12:00'),(58,2,'saco de cuadros',68,168900,'ACTIVO','2020-10-08','00:12:00'),(59,3,'brenda set top y pantalon',10,88495,'ACTIVO','2020-10-08','00:12:00'),(60,3,'conjunto blusa y pantalon unicolor',15,80000,'ACTIVO','2020-10-08','00:12:00'),(61,3,'enterizo a rayas',30,129900,'ACTIVO','2020-10-08','00:12:00'),(62,3,'enterizo amalia',69,160000,'ACTIVO','2020-10-08','00:12:00'),(63,3,'enterizo amelia',98,70000,'ACTIVO','2020-10-08','00:12:00'),(64,3,'enterizo britany',56,129900,'ACTIVO','2020-10-08','00:12:00'),(65,3,'enterizo con blonda en la espalda',2,94500,'ACTIVO','2020-10-08','00:12:00'),(66,3,'enterizo dama escote cruzado',14,136900,'ACTIVO','2020-10-08','00:12:00'),(67,3,'enterizo dayelin',4,99495,'ACTIVO','2020-10-08','00:12:00'),(68,3,'enterizo estampado',14,120000,'ACTIVO','2020-10-08','00:12:00'),(69,3,'enterizo evelyn',235,150000,'ACTIVO','2020-10-08','00:12:00'),(70,3,'enterizo floral',12,119000,'ACTIVO','2020-10-08','00:12:00'),(71,3,'enterizo flores',1,58000,'ACTIVO','2020-10-08','00:12:00'),(72,3,'enterizo largo flores',7,72000,'ACTIVO','2020-10-08','00:12:00'),(73,3,'enterizo lilian',2,108900,'ACTIVO','2020-10-08','00:12:00'),(74,3,'enterizo macondo',78,100700,'ACTIVO','2020-10-08','00:12:00'),(75,3,'enterizo nini',4,113000,'ACTIVO','2020-10-08','00:12:00'),(76,3,'enterizo persy',2,80000,'ACTIVO','2020-10-08','00:12:00'),(77,3,'enterizo raffaella',345,150000,'ACTIVO','2020-10-08','00:12:00'),(78,3,'enterizo rayas',4,64000,'ACTIVO','2020-10-08','00:12:00'),(79,3,'enterizo rojo',2,58000,'ACTIVO','2020-10-08','00:12:00'),(80,3,'enterizo samay',7,115000,'ACTIVO','2020-10-08','00:12:00'),(81,3,'enterizo sol',24,140000,'ACTIVO','2020-10-08','00:12:00'),(82,3,'enterizo staicy',7,104000,'ACTIVO','2020-10-08','00:12:00'),(83,3,'enterizo terracota',53,58000,'ACTIVO','2020-10-08','00:12:00'),(84,3,'enterizo unicolor con brillo',9,160000,'ACTIVO','2020-10-08','00:12:00'),(85,3,'enterizo vino flores',3,60000,'ACTIVO','2020-10-08','00:12:00'),(86,3,'enterizo vino',45,60000,'ACTIVO','2020-10-08','00:12:00'),(87,3,'overal denim',68,84000,'ACTIVO','2020-10-08','00:12:00'),(88,3,'overol mercy',78,64600,'ACTIVO','2020-10-08','00:12:00'),(89,4,'falda carol',10,58900,'ACTIVO','2020-10-08','00:12:00'),(90,4,'falda corta con bolero',15,42000,'ACTIVO','2020-10-08','00:12:00'),(91,4,'falda corta con cierre',30,40000,'ACTIVO','2020-10-08','00:12:00'),(92,4,'falda corta con correa',69,50000,'ACTIVO','2020-10-08','00:12:00'),(93,4,'falda corta con cortes',98,46000,'ACTIVO','2020-10-08','00:12:00'),(94,4,'falda corta de lentejuelas',56,72500,'ACTIVO','2020-10-08','00:12:00'),(95,4,'falda corta estampado',2,79900,'ACTIVO','2020-10-08','00:12:00'),(96,4,'falda corta gamuza',14,40000,'ACTIVO','2020-10-08','00:12:00'),(97,4,'falda daniela',4,110000,'ACTIVO','2020-10-08','00:12:00'),(98,4,'falda denim',14,37900,'ACTIVO','2020-10-08','00:12:00'),(99,4,'falda dominica',235,99900,'ACTIVO','2020-10-08','00:12:00'),(100,4,'falda en denim',12,39900,'ACTIVO','2020-10-08','00:12:00'),(101,4,'falda estampado camufado',1,83900,'ACTIVO','2020-10-08','00:12:00'),(102,4,'falda julissa',7,79900,'ACTIVO','2020-10-08','00:12:00'),(103,4,'falda lapiz',2,59900,'ACTIVO','2020-10-08','00:12:00'),(104,4,'falda larga azul oscuro',78,62000,'ACTIVO','2020-10-08','00:12:00'),(105,4,'falda larga cruzada',4,98200,'ACTIVO','2020-10-08','00:12:00'),(106,4,'falda larga plisada',2,60000,'ACTIVO','2020-10-08','00:12:00'),(107,4,'falda laury',345,90000,'ACTIVO','2020-10-08','00:12:00'),(108,4,'falda lyanna',4,64900,'ACTIVO','2020-10-08','00:12:00'),(109,4,'falda mercy',2,43000,'ACTIVO','2020-10-08','00:12:00'),(110,4,'falda midi',7,69900,'ACTIVO','2020-10-08','00:12:00'),(111,4,'falda pitillo',24,65000,'ACTIVO','2020-10-08','00:12:00'),(112,4,'falda rosado flores',7,38000,'ACTIVO','2020-10-08','00:12:00'),(113,4,'falda sara',53,59000,'ACTIVO','2020-10-08','00:12:00'),(114,4,'falda scarlett',9,73900,'ACTIVO','2020-10-08','00:12:00'),(115,4,'falda talle alto',3,48900,'ACTIVO','2020-10-08','00:12:00'),(116,4,'falda tubo',45,94900,'ACTIVO','2020-10-08','00:12:00'),(117,4,'falda ximena',68,116900,'ACTIVO','2020-10-08','00:12:00'),(118,4,'falda yineth',78,68900,'ACTIVO','2020-10-08','00:12:00'),(119,5,'jean beth',10,100000,'ACTIVO','2020-10-08','00:12:00'),(120,5,'jean boyfriend',15,95000,'ACTIVO','2020-10-08','00:12:00'),(121,5,'jean densy',30,103900,'ACTIVO','2020-10-08','00:12:00'),(122,5,'jean macondo',69,75900,'ACTIVO','2020-10-08','00:12:00'),(123,5,'jean mercy',98,55800,'ACTIVO','2020-10-08','00:12:00'),(124,5,'jean mom fit',56,159900,'ACTIVO','2020-10-08','00:12:00'),(125,5,'jean rotos',2,138900,'ACTIVO','2020-10-08','00:12:00'),(126,5,'jean skinny',14,78000,'ACTIVO','2020-10-08','00:12:00'),(127,5,'jean tiro alto',4,135900,'ACTIVO','2020-10-08','00:12:00'),(128,5,'jeans culotte',14,82000,'ACTIVO','2020-10-08','00:12:00'),(129,5,'jeans mom',235,82000,'ACTIVO','2020-10-08','00:12:00'),(130,5,'pantalon a cuadros',12,46990,'ACTIVO','2020-10-08','00:12:00'),(131,5,'pantalon bernes',1,139900,'ACTIVO','2020-10-08','00:12:00'),(132,5,'pantalon bota campana',7,152900,'ACTIVO','2020-10-08','00:12:00'),(133,5,'pantalon bota elefante',2,92000,'ACTIVO','2020-10-08','00:12:00'),(134,5,'pantalon cargo',78,90000,'ACTIVO','2020-10-08','00:12:00'),(135,5,'pantalon con abertura',4,74900,'ACTIVO','2020-10-08','00:12:00'),(136,5,'pantalon con pliegues',2,139900,'ACTIVO','2020-10-08','00:12:00'),(137,5,'pantalon culotte con botones',345,54900,'ACTIVO','2020-10-08','00:12:00'),(138,5,'pantalon culotte de pliegues',4,68000,'ACTIVO','2020-10-08','00:12:00'),(139,5,'pantalon culotte plisado',2,174900,'ACTIVO','2020-10-08','00:12:00'),(140,5,'pantalon de cuadros',7,95000,'ACTIVO','2020-10-08','00:12:00'),(141,5,'pantalon detalle bota campana',24,76450,'ACTIVO','2020-10-08','00:12:00'),(142,5,'pantalon lola',7,89900,'ACTIVO','2020-10-08','00:12:00'),(143,5,'pantalon negro plisado',53,88900,'ACTIVO','2020-10-08','00:12:00'),(144,5,'pantalon palazzo',9,168900,'ACTIVO','2020-10-08','00:12:00'),(145,5,'pantalon tiro alto',3,172900,'ACTIVO','2020-10-08','00:12:00'),(146,5,'short de jean',45,34500,'ACTIVO','2020-10-08','00:12:00'),(147,5,'short mercy',68,43000,'ACTIVO','2020-10-08','00:12:00'),(148,5,'shorts denim',78,64000,'ACTIVO','2020-10-08','00:12:00'),(149,6,'saco vestido cuello tortuga',10,179900,'ACTIVO','2020-10-08','00:12:00'),(150,6,'saco vestido de cuadros',15,149900,'ACTIVO','2020-10-08','00:12:00'),(151,6,'vestido a cuadros',30,84990,'ACTIVO','2020-10-08','00:12:00'),(152,6,'vestido alexa',69,93900,'ACTIVO','2020-10-08','00:12:00'),(153,6,'vestido amara',98,120000,'ACTIVO','2020-10-08','00:12:00'),(154,6,'vestido anny',56,83900,'ACTIVO','2020-10-08','00:12:00'),(155,6,'vestido arelys',2,143900,'ACTIVO','2020-10-08','00:12:00'),(156,6,'vestido bordado',14,219000,'ACTIVO','2020-10-08','00:12:00'),(157,6,'vestido brillante cruzado',4,115000,'ACTIVO','2020-10-08','00:12:00'),(158,6,'vestido charlot',14,163900,'ACTIVO','2020-10-08','00:12:00'),(159,6,'vestido clarissa',235,97000,'ACTIVO','2020-10-08','00:12:00'),(160,6,'vestido collet',12,118900,'ACTIVO','2020-10-08','00:12:00'),(161,6,'vestido con nudo',1,172900,'ACTIVO','2020-10-08','00:12:00'),(162,6,'vestido con tiras',7,119000,'ACTIVO','2020-10-08','00:12:00'),(163,6,'vestido corto con bolero',2,60000,'ACTIVO','2020-10-08','00:12:00'),(164,6,'vestido corto con top',78,58000,'ACTIVO','2020-10-08','00:12:00'),(165,6,'vestido dorado de corte imperio',4,372000,'ACTIVO','2020-10-08','00:12:00'),(166,6,'vestido estampado pepas',2,126000,'ACTIVO','2020-10-08','00:12:00'),(167,6,'vestido frente cruzado',345,63200,'ACTIVO','2020-10-08','00:12:00'),(168,6,'vestido halter',4,169900,'ACTIVO','2020-10-08','00:12:00'),(169,6,'vestido juana',2,149900,'ACTIVO','2020-10-08','00:12:00'),(170,6,'vestido karol',7,137900,'ACTIVO','2020-10-08','00:12:00'),(171,6,'vestido largo de lentejuelas con abertura',24,160000,'ACTIVO','2020-10-08','00:12:00'),(172,6,'vestido largo tiras',7,137000,'ACTIVO','2020-10-08','00:12:00'),(173,6,'vestido laura',53,96900,'ACTIVO','2020-10-08','00:12:00'),(174,6,'vestido manga sisa',9,189900,'ACTIVO','2020-10-08','00:12:00'),(175,6,'vestido marfil rayas',3,64000,'ACTIVO','2020-10-08','00:12:00'),(176,6,'vestido midi',45,69900,'ACTIVO','2020-10-08','00:12:00'),(177,6,'vestido miranda',68,157990,'ACTIVO','2020-10-08','00:12:00'),(178,6,'vestido natalie',78,129900,'ACTIVO','2020-10-08','00:12:00'),(179,7,'antonie',10,45900,'ACTIVO','2020-10-08','00:12:00'),(180,7,'barunka',15,45900,'ACTIVO','2020-10-08','00:12:00'),(181,7,'botines altos',30,195900,'ACTIVO','2020-10-08','00:12:00'),(182,7,'botines de plataforma y tacon',69,145000,'ACTIVO','2020-10-08','00:12:00'),(183,7,'botines plataforma',98,158900,'ACTIVO','2020-10-08','00:12:00'),(184,7,'botines tela',56,158900,'ACTIVO','2020-10-08','00:12:00'),(185,7,'botines warfare',2,188900,'ACTIVO','2020-10-08','00:12:00'),(186,7,'coraima',14,186900,'ACTIVO','2020-10-08','00:12:00'),(187,7,'coretta',4,45900,'ACTIVO','2020-10-08','00:12:00'),(188,7,'eberta',14,45900,'ACTIVO','2020-10-08','00:12:00'),(189,7,'lindsay',235,164900,'ACTIVO','2020-10-08','00:12:00'),(190,7,'monster tenis',12,109000,'ACTIVO','2020-10-08','00:12:00'),(191,7,'rubby',1,186900,'ACTIVO','2020-10-08','00:12:00'),(192,7,'sandalia angely',7,87900,'ACTIVO','2020-10-08','00:12:00'),(193,7,'sandalias altas',2,45900,'ACTIVO','2020-10-08','00:12:00'),(194,7,'sandalias tacon grueso con moคo',78,45900,'ACTIVO','2020-10-08','00:12:00'),(195,7,'sandalias tacon grueso',4,45900,'ACTIVO','2020-10-08','00:12:00'),(196,7,'tacon lighting',2,45900,'ACTIVO','2020-10-08','00:12:00'),(197,7,'tacon velvet',345,45900,'ACTIVO','2020-10-08','00:12:00'),(198,7,'tacones',4,45900,'ACTIVO','2020-10-08','00:12:00'),(199,7,'tenis blanco pastel',2,109000,'ACTIVO','2020-10-08','00:12:00'),(200,7,'tenis blancos con charol',7,109000,'ACTIVO','2020-10-08','00:12:00'),(201,7,'tenis glamour rosados',24,109000,'ACTIVO','2020-10-08','00:12:00'),(202,7,'tenis perla tornasol',7,109000,'ACTIVO','2020-10-08','00:12:00'),(203,7,'tenis poderosa rosados',53,109000,'ACTIVO','2020-10-08','00:12:00'),(204,7,'tenis suela alta',9,189900,'ACTIVO','2020-10-08','00:12:00'),(205,7,'tenis unica rosados',3,109000,'ACTIVO','2020-10-08','00:12:00'),(206,7,'velvetin',45,176990,'ACTIVO','2020-10-08','00:12:00'),(207,7,'zapatilla capellada',68,189900,'ACTIVO','2020-10-08','00:12:00'),(208,7,'zoe',78,179900,'ACTIVO','2020-10-08','00:12:00'),(209,9,'bermuda amarilla',10,35000,'ACTIVO','2020-10-08','00:12:00'),(210,9,'bermuda azul oscura',15,35000,'ACTIVO','2020-10-08','00:12:00'),(211,9,'bermuda azul',30,35000,'ACTIVO','2020-10-08','00:12:00'),(212,9,'bermuda beige',69,40000,'ACTIVO','2020-10-08','00:12:00'),(213,9,'bermuda blanca',98,40000,'ACTIVO','2020-10-08','00:12:00'),(214,9,'bermuda gris',56,40000,'ACTIVO','2020-10-08','00:12:00'),(215,9,'bermuda negra',2,45000,'ACTIVO','2020-10-08','00:12:00'),(216,9,'bermuda rosada',14,45000,'ACTIVO','2020-10-08','00:12:00'),(217,8,'camibuso blanco classic',4,50000,'ACTIVO','2020-10-08','00:12:00'),(218,8,'camibuso blanco get',14,55000,'ACTIVO','2020-10-08','00:12:00'),(219,8,'camibuso blanco jackerson',235,50000,'ACTIVO','2020-10-08','00:12:00'),(220,8,'camibuso blanco trendy',12,55000,'ACTIVO','2020-10-08','00:12:00'),(221,8,'camibuso cafe',1,50000,'ACTIVO','2020-10-08','00:12:00'),(222,8,'camibuso gris oscuro',7,55000,'ACTIVO','2020-10-08','00:12:00'),(223,8,'camibuso gris',2,50000,'ACTIVO','2020-10-08','00:12:00'),(224,8,'camibuso naranja classic',78,55000,'ACTIVO','2020-10-08','00:12:00'),(225,8,'camibuso naranja',4,50000,'ACTIVO','2020-10-08','00:12:00'),(226,8,'camibuso negro',2,55000,'ACTIVO','2020-10-08','00:12:00');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `id_consecutivo_venta` int NOT NULL AUTO_INCREMENT COMMENT 'Id consecutivo venta',
  `fk_id_cliente` int NOT NULL COMMENT 'Fk Id del cliente',
  `subtotal` double NOT NULL COMMENT 'Subtotal de la venta',
  `iva` double NOT NULL COMMENT 'Total IVA',
  `valor_total` double NOT NULL COMMENT 'Total venta',
  `direccion` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `estado` enum('ACTIVO','INACTIVO') COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Estado',
  `fecha_creacion` date NOT NULL COMMENT 'Fecha de Creacion',
  `hora_creacion` time NOT NULL COMMENT 'Hora de Creacion',
  PRIMARY KEY (`id_consecutivo_venta`),
  KEY `fk_id_cliente` (`fk_id_cliente`),
  CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`fk_id_cliente`) REFERENCES `clientes` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (1,1,483600,0.19,575484,'Calle Falsa 123','ACTIVO','2020-11-24','05:34:43');
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'KIOSCO'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-24  0:35:59
