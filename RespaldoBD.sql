CREATE DATABASE  IF NOT EXISTS `database_vfs` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `database_vfs`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: database_vfs
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `bitacora`
--

DROP TABLE IF EXISTS `bitacora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bitacora` (
  `id_bitacora` int NOT NULL AUTO_INCREMENT,
  `transaccion` varchar(10) NOT NULL,
  `usuario` varchar(40) NOT NULL,
  `fecha` datetime NOT NULL,
  `tabla` varchar(20) NOT NULL,
  PRIMARY KEY (`id_bitacora`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bitacora`
--

LOCK TABLES `bitacora` WRITE;
/*!40000 ALTER TABLE `bitacora` DISABLE KEYS */;
INSERT INTO `bitacora` VALUES (1,'INSERT','KennyTellez@localhost','2023-11-04 11:13:09','Categoria'),(2,'INSERT','KennyTellez@localhost','2023-11-04 11:13:14','Proveedor'),(3,'INSERT','KennyTellez@localhost','2023-11-05 13:20:55','Cliente'),(4,'INSERT','KennyTellez@localhost','2023-11-05 21:57:38','Empleado'),(5,'INSERT','KennyTellez@localhost','2023-11-07 11:05:35','Proveedor');
/*!40000 ALTER TABLE `bitacora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `nombre_categoria` varchar(50) NOT NULL,
  `descripcion_categoria` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Material','Material de trapo semi aistetic');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`KennyTellez`@`localhost`*/ /*!50003 TRIGGER `InsertarCategoria_bitacora` AFTER INSERT ON `categoria` FOR EACH ROW INSERT INTO bitacora(transaccion, usuario, fecha, tabla)
VALUES ('INSERT', current_user(),NOW(), 'Categoria') */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`KennyTellez`@`localhost`*/ /*!50003 TRIGGER `ActualizarCategoria_bitacora` AFTER UPDATE ON `categoria` FOR EACH ROW INSERT INTO bitacora(transaccion, usuario, fecha, tabla)
VALUES ('UPDATE', current_user(),NOW(), 'Categoria') */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`KennyTellez`@`localhost`*/ /*!50003 TRIGGER `EliminarCategoria_bitacora` AFTER DELETE ON `categoria` FOR EACH ROW INSERT INTO bitacora(transaccion, usuario, fecha, tabla)
VALUES ('DELETE', current_user(),NOW(), 'Categoria') */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `cita`
--

DROP TABLE IF EXISTS `cita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cita` (
  `id_cita` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int NOT NULL,
  `id_empleado` int NOT NULL,
  `tipo_servicio` varchar(100) NOT NULL,
  `fecha_cita` date NOT NULL,
  `hora_cita` time NOT NULL,
  `estado_cita` tinyint(1) NOT NULL,
  `comentario` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_cita`),
  KEY `FK_Cita_Cliente` (`id_cliente`),
  KEY `FK_Cita_Empleado` (`id_empleado`),
  CONSTRAINT `FK_Cita_Cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `FK_Cita_Empleado` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cita`
--

LOCK TABLES `cita` WRITE;
/*!40000 ALTER TABLE `cita` DISABLE KEYS */;
INSERT INTO `cita` VALUES (1,1,1,'Esmalte de uñas','2023-11-09','09:09:00',1,'Por el momento nose xD'),(2,1,1,'Esmalte de uñas','2023-11-08','02:46:00',1,'Por el momento nose xD');
/*!40000 ALTER TABLE `cita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nombre1_cliente` varchar(15) NOT NULL,
  `nombre2_cliente` varchar(15) DEFAULT NULL,
  `apellido1_cliente` varchar(15) NOT NULL,
  `apellido2_cliente` varchar(15) DEFAULT NULL,
  `fechanac_cliente` date NOT NULL,
  `telefono_cliente` varchar(9) NOT NULL,
  `email_cliente` varchar(255) NOT NULL,
  `contrasena_cliente` varchar(255) NOT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Lenin','Fonseca','Amdor','Chabarria','2023-11-14','45678789','amador@gmail.com','12345');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`KennyTellez`@`localhost`*/ /*!50003 TRIGGER `InsertarCliente_bitacora` AFTER INSERT ON `cliente` FOR EACH ROW INSERT INTO bitacora(transaccion, usuario, fecha, tabla)
VALUES ('INSERT', current_user(),NOW(), 'Cliente') */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`KennyTellez`@`localhost`*/ /*!50003 TRIGGER `ActualizarCliente_bitacora` AFTER UPDATE ON `cliente` FOR EACH ROW INSERT INTO bitacora(transaccion, usuario, fecha, tabla)
VALUES ('UPDATE', current_user(),NOW(), 'Cliente') */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`KennyTellez`@`localhost`*/ /*!50003 TRIGGER `EliminarCliente_bitacora` AFTER DELETE ON `cliente` FOR EACH ROW INSERT INTO bitacora(transaccion, usuario, fecha, tabla)
VALUES ('DELETE', current_user(),NOW(), 'Cliente') */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `compra`
--

DROP TABLE IF EXISTS `compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra` (
  `id_compra` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int NOT NULL,
  `id_tipo_pago` int NOT NULL,
  `id_entrega` int NOT NULL,
  `fecha_compra` date NOT NULL,
  `hora_compra` time NOT NULL,
  PRIMARY KEY (`id_compra`),
  KEY `FK_Compra_Cliente` (`id_cliente`),
  KEY `FK_Compra_Tipo_pago` (`id_tipo_pago`),
  KEY `FK_Compra_Tipo_entrega` (`id_entrega`),
  CONSTRAINT `FK_Compra_Cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `FK_Compra_Tipo_entrega` FOREIGN KEY (`id_entrega`) REFERENCES `tipo_entrega` (`id_entrega`),
  CONSTRAINT `FK_Compra_Tipo_pago` FOREIGN KEY (`id_tipo_pago`) REFERENCES `tipo_pago` (`id_tipo_pago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_compra`
--

DROP TABLE IF EXISTS `detalle_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_compra` (
  `id_detalle_c` int NOT NULL AUTO_INCREMENT,
  `id_compra` int NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad_compra` int NOT NULL,
  PRIMARY KEY (`id_detalle_c`),
  KEY `FK_Detalle_compra_Compra` (`id_compra`),
  KEY `FK_Detalle_compra_Producto` (`id_producto`),
  CONSTRAINT `FK_Detalle_compra_Compra` FOREIGN KEY (`id_compra`) REFERENCES `compra` (`id_compra`),
  CONSTRAINT `FK_Detalle_compra_Producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_compra`
--

LOCK TABLES `detalle_compra` WRITE;
/*!40000 ALTER TABLE `detalle_compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `id_empleado` int NOT NULL AUTO_INCREMENT,
  `nombre1_empleado` varchar(15) NOT NULL,
  `nombre2_empleado` varchar(15) DEFAULT NULL,
  `apellido1_empleado` varchar(15) NOT NULL,
  `apellido2_empleado` varchar(15) DEFAULT NULL,
  `especialidad_empleado` varchar(50) NOT NULL,
  `telefono_empleado` varchar(9) NOT NULL,
  `email_empleado` varchar(255) NOT NULL,
  `contrasena_empleado` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,'Gisela',' Paola','Rocha','Cruz','Pericudista','83310234','cruzrochagisela@gmail.com','12345');
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`KennyTellez`@`localhost`*/ /*!50003 TRIGGER `InsertarEmpleado_bitacora` AFTER INSERT ON `empleado` FOR EACH ROW INSERT INTO bitacora(transaccion, usuario, fecha, tabla)
VALUES ('INSERT', current_user(),NOW(), 'Empleado') */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`KennyTellez`@`localhost`*/ /*!50003 TRIGGER `ActualizarEmpleado_bitacora` AFTER UPDATE ON `empleado` FOR EACH ROW INSERT INTO bitacora(transaccion, usuario, fecha, tabla)
VALUES ('UPDATE', current_user(),NOW(), 'Empleado') */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`KennyTellez`@`localhost`*/ /*!50003 TRIGGER `EliminarEmpleado_bitacora` AFTER DELETE ON `empleado` FOR EACH ROW INSERT INTO bitacora(transaccion, usuario, fecha, tabla)
VALUES ('DELETE', current_user(),NOW(), 'Empleado') */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `listadeseos`
--

DROP TABLE IF EXISTS `listadeseos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `listadeseos` (
  `id_deseo` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  PRIMARY KEY (`id_deseo`),
  KEY `FK_ListaDeseos_Cliente` (`id_cliente`),
  CONSTRAINT `FK_ListaDeseos_Cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listadeseos`
--

LOCK TABLES `listadeseos` WRITE;
/*!40000 ALTER TABLE `listadeseos` DISABLE KEYS */;
/*!40000 ALTER TABLE `listadeseos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `listadetalle`
--

DROP TABLE IF EXISTS `listadetalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `listadetalle` (
  `id_listadetalle` int NOT NULL AUTO_INCREMENT,
  `id_producto` int NOT NULL,
  `id_deseo` int NOT NULL,
  PRIMARY KEY (`id_listadetalle`),
  KEY `FK_ListaDetalle_ListaDeseos` (`id_deseo`),
  KEY `FK_ListaDetalle_Producto` (`id_producto`),
  CONSTRAINT `FK_ListaDetalle_ListaDeseos` FOREIGN KEY (`id_deseo`) REFERENCES `listadeseos` (`id_deseo`),
  CONSTRAINT `FK_ListaDetalle_Producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listadetalle`
--

LOCK TABLES `listadetalle` WRITE;
/*!40000 ALTER TABLE `listadetalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `listadetalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `id_proveedor` int NOT NULL,
  `id_categoria` int NOT NULL,
  `nombre_producto` varchar(30) NOT NULL,
  `imagen` longtext,
  `precio_venta` decimal(12,2) NOT NULL,
  `precio_compra` decimal(12,2) NOT NULL,
  `cantidad` int NOT NULL,
  `talla` varchar(20) NOT NULL,
  `genero` char(1) NOT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `FK_Producto_Proveedor` (`id_proveedor`),
  KEY `FK_producto_categoria` (`id_categoria`),
  CONSTRAINT `FK_producto_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`),
  CONSTRAINT `FK_Producto_Proveedor` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (4,2,1,'Zapatos','data:image/jpeg;base64,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',50.99,20.99,12,'39','M');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `id_proveedor` int NOT NULL AUTO_INCREMENT,
  `empresa_proveedor` varchar(60) NOT NULL,
  `direccion_proveedor` varchar(255) DEFAULT NULL,
  `ciudad_proveedor` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'X','Estados unidos','Nueva York'),(2,'EMPRESAS TOÑO','Por california','Pentecostes');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`KennyTellez`@`localhost`*/ /*!50003 TRIGGER `InsertarProveedor_bitacora` AFTER INSERT ON `proveedor` FOR EACH ROW INSERT INTO bitacora(transaccion, usuario, fecha, tabla)
VALUES ('INSERT', current_user(),NOW(), 'Proveedor') */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`KennyTellez`@`localhost`*/ /*!50003 TRIGGER `ActualizarProveedor_bitacora` AFTER UPDATE ON `proveedor` FOR EACH ROW INSERT INTO bitacora(transaccion, usuario, fecha, tabla)
VALUES ('UPDATE', current_user(),NOW(), 'Proveedor') */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`KennyTellez`@`localhost`*/ /*!50003 TRIGGER `EliminarProveedor_bitacora` AFTER DELETE ON `proveedor` FOR EACH ROW INSERT INTO bitacora(transaccion, usuario, fecha, tabla)
VALUES ('DELETE', current_user(),NOW(), 'Proveedor') */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `resena`
--

DROP TABLE IF EXISTS `resena`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resena` (
  `id_resena` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int NOT NULL,
  `id_producto` int NOT NULL,
  `calificacion` int DEFAULT NULL,
  `comentario` varchar(255) DEFAULT NULL,
  `fecha_publicacion` datetime NOT NULL,
  `aprovacion` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_resena`),
  KEY `FK_Resena_Producto` (`id_producto`),
  KEY `FK_Resena_Cliente` (`id_cliente`),
  CONSTRAINT `FK_Resena_Cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `FK_Resena_Producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resena`
--

LOCK TABLES `resena` WRITE;
/*!40000 ALTER TABLE `resena` DISABLE KEYS */;
INSERT INTO `resena` VALUES (1,1,5,4,'EL producto esta bien','2023-11-05 00:00:00',1),(2,1,4,5,'EL producto esta bien','2023-11-05 00:00:00',1),(3,1,4,4,'EL producto esta bien','2023-11-06 00:00:00',1);
/*!40000 ALTER TABLE `resena` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_entrega`
--

DROP TABLE IF EXISTS `tipo_entrega`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_entrega` (
  `id_entrega` int NOT NULL AUTO_INCREMENT,
  `id_empleado` int NOT NULL,
  `tipo_entrega` varchar(50) NOT NULL,
  `estado_entrega` varchar(20) NOT NULL,
  `direccion_entrega` varchar(255) NOT NULL,
  PRIMARY KEY (`id_entrega`),
  KEY `FK_Tipo_entrega_Empleado` (`id_empleado`),
  CONSTRAINT `FK_Tipo_entrega_Empleado` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_entrega`
--

LOCK TABLES `tipo_entrega` WRITE;
/*!40000 ALTER TABLE `tipo_entrega` DISABLE KEYS */;
INSERT INTO `tipo_entrega` VALUES (1,1,'Entrega a domicilio','Pendiente','123 Calle Principal'),(2,1,'Entrega a domicilio','Pendiente','chontales');
/*!40000 ALTER TABLE `tipo_entrega` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_pago`
--

DROP TABLE IF EXISTS `tipo_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_pago` (
  `id_tipo_pago` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(65) NOT NULL,
  PRIMARY KEY (`id_tipo_pago`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_pago`
--

LOCK TABLES `tipo_pago` WRITE;
/*!40000 ALTER TABLE `tipo_pago` DISABLE KEYS */;
INSERT INTO `tipo_pago` VALUES (1,'Efectivo');
/*!40000 ALTER TABLE `tipo_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_Usuario` int NOT NULL AUTO_INCREMENT,
  `nombre_Usuario` varchar(30) NOT NULL,
  `contrasena` varchar(16) NOT NULL,
  `rol` varchar(20) NOT NULL,
  PRIMARY KEY (`id_Usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'KennyTellez','incorrecto','admin'),(2,'GiselaPaola','correcto','vendedor'),(3,'KennyPaolo','incorrecto1','cliente'),(4,'cris','1234','admin');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'database_vfs'
--

--
-- Dumping routines for database 'database_vfs'
--
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarCategoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`KennyTellez`@`localhost` PROCEDURE `ActualizarCategoria`(
    IN id_categoria INT,
    IN nuevo_nombre_categoria VARCHAR(50),
    IN nueva_descripcion_categoria VARCHAR(255)
)
BEGIN
    UPDATE Categoria
    SET
        nombre_categoria = nuevo_nombre_categoria,
        descripcion_categoria = nueva_descripcion_categoria
    WHERE id_categoria = id_categoria;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarCita` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`KennyTellez`@`localhost` PROCEDURE `ActualizarCita`(
    IN id_cita INT,
    IN nuevo_id_cliente INT,
    IN nuevo_id_empleado INT,
    IN nuevo_tipo_servicio VARCHAR(100),
    IN nueva_fecha_cita DATE,
    IN nueva_hora_cita TIME,
    IN nuevo_estado_cita BOOLEAN,
    IN nuevo_comentario VARCHAR(255)
)
BEGIN
    UPDATE Cita
    SET
        id_cliente = nuevo_id_cliente,
        id_empleado = nuevo_id_empleado,
        tipo_servicio = nuevo_tipo_servicio,
        fecha_cita = nueva_fecha_cita,
        hora_cita = nueva_hora_cita,
        estado_cita = nuevo_estado_cita,
        comentario = nuevo_comentario
    WHERE id_cita = id_cita;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`KennyTellez`@`localhost` PROCEDURE `ActualizarCliente`(
    IN id_cliente INT,
    IN nuevo_nombre1 VARCHAR(255),
    IN nuevo_nombre2 VARCHAR(255),
    IN nuevo_apellido1 VARCHAR(255),
    IN nuevo_apellido2 VARCHAR(255),
    IN nueva_fecha_nac DATE,
    IN nuevo_telefono VARCHAR(255),
    IN nuevo_email VARCHAR(255),
    IN nueva_contrasena VARCHAR(255)
)
BEGIN
    UPDATE Cliente
    SET
        nombre1_cliente = nuevo_nombre1,
        nombre2_cliente = nuevo_nombre2,
        apellido1_cliente = nuevo_apellido1,
        apellido2_cliente = nuevo_apellido2,
        fechanac_cliente = nueva_fecha_nac,
        telefono_cliente = nuevo_telefono,
        email_cliente = nuevo_email,
        contrasena_cliente = nueva_contrasena
    WHERE id_cliente = id_cliente;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarCompra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`KennyTellez`@`localhost` PROCEDURE `ActualizarCompra`(
    IN id_compra INT,
    IN nuevo_id_cliente INT,
    IN nuevo_id_tipo_pago INT,
    IN nuevo_id_entrega INT,
    IN nueva_fecha_compra DATE,
    IN nueva_hora_compra TIME
)
BEGIN
    UPDATE Compra
    SET
        id_cliente = nuevo_id_cliente,
        id_tipo_pago = nuevo_id_tipo_pago,
        id_entrega = nuevo_id_entrega,
        fecha_compra = nueva_fecha_compra,
        hora_compra = nueva_hora_compra
    WHERE id_compra = id_compra;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarEmpleado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`KennyTellez`@`localhost` PROCEDURE `ActualizarEmpleado`(
    IN id_empleado INT,
    IN nuevo_nombre1 VARCHAR(255),
    IN nuevo_nombre2 VARCHAR(255),
    IN nuevo_apellido1 VARCHAR(255),
    IN nuevo_apellido2 VARCHAR(255),
    IN nueva_especialidad VARCHAR(50),
    IN nuevo_telefono VARCHAR(9),
    IN nuevo_email VARCHAR(255),
    IN nueva_contrasena VARCHAR(255)
)
BEGIN
    UPDATE Empleado
    SET
        nombre1_empleado = nuevo_nombre1,
        nombre2_empleado = nuevo_nombre2,
        apellido1_empleado = nuevo_apellido1,
        apellido2_empleado = nuevo_apellido2,
        especialidad_empleado = nueva_especialidad,
        telefono_empleado = nuevo_telefono,
        email_empleado = nuevo_email,
        contrasena_empleado = nueva_contrasena
    WHERE id_empleado = id_empleado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarListaDeseos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`KennyTellez`@`localhost` PROCEDURE `ActualizarListaDeseos`(
    IN id_deseo INT,
    IN nueva_fecha_creacion DATETIME
)
BEGIN
    UPDATE ListaDeseos
    SET fecha_creacion = nueva_fecha_creacion
    WHERE id_deseo = id_deseo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`KennyTellez`@`localhost` PROCEDURE `ActualizarProducto`(
    IN id_producto INT,
    IN nuevo_id_proveedor INT,
    IN nuevo_id_categoria INT,
    IN nuevo_nombre_producto VARCHAR(30),
    IN nuevo_imagen_producto VARCHAR(255),
    IN nuevo_precio_venta DECIMAL(12, 2),
    IN nuevo_precio_compra DECIMAL(12, 2),
    IN nueva_cantidad INT,
    IN nueva_talla VARCHAR(20),
    IN nuevo_genero CHAR(1)
)
BEGIN
    UPDATE Producto
    SET
        id_proveedor = nuevo_id_proveedor,
        id_categoria = nuevo_id_categoria,
        nombre_producto = nuevo_nombre_producto,
        imagen = nuevo_imagen_producto,
        precio_venta = nuevo_precio_venta,
        precio_compra = nuevo_precio_compra,
        cantidad = nueva_cantidad,
        talla = nueva_talla,
        genero = nuevo_genero
    WHERE id_producto = id_producto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarProveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`KennyTellez`@`localhost` PROCEDURE `ActualizarProveedor`(
    IN id_proveedor INT,
    IN nuevo_empresa_proveedor VARCHAR(60),
    IN nuevo_direccion_proveedor VARCHAR(255),
    IN nuevo_ciudad_proveedor VARCHAR(50)
)
BEGIN
    UPDATE Proveedor
    SET
        empresa_proveedor = nuevo_empresa_proveedor,
        direccion_proveedor = nuevo_direccion_proveedor,
        ciudad_proveedor = nuevo_ciudad_proveedor
    WHERE id_proveedor = id_proveedor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarResena` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`KennyTellez`@`localhost` PROCEDURE `ActualizarResena`(
    IN id_resena INT,
    IN nuevo_id_cliente INT,
    IN nuevo_id_producto INT,
    IN nueva_calificacion INT,
    IN nuevo_comentario VARCHAR(255),
    IN nueva_fecha_publicacion DATETIME,
    IN nueva_aprobacion BOOLEAN
)
BEGIN
    UPDATE Resena
    SET
        id_cliente = nuevo_id_cliente,
        id_producto = nuevo_id_producto,
        calificacion = nueva_calificacion,
        comentario = nuevo_comentario,
        fecha_publicacion = nueva_fecha_publicacion,
        aprobacion = nueva_aprobacion
    WHERE id_resena = id_resena;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarTipoEntrega` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`KennyTellez`@`localhost` PROCEDURE `ActualizarTipoEntrega`(
    IN id_entrega INT,
    IN nuevo_id_empleado INT,
    IN nuevo_tipo_entrega VARCHAR(50),
    IN nuevo_estado_entrega VARCHAR(20),
    IN nueva_direccion_entrega VARCHAR(255)
)
BEGIN
    UPDATE Tipo_entrega
    SET
        id_empleado = nuevo_id_empleado,
        tipo_entrega = nuevo_tipo_entrega,
        estado_entrega = nuevo_estado_entrega,
        direccion_entrega = nueva_direccion_entrega
    WHERE id_entrega = id_entrega;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarTipoPago` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`KennyTellez`@`localhost` PROCEDURE `ActualizarTipoPago`(
    IN id_tipo_pago INT,
    IN nuevo_tipo VARCHAR(65)
)
BEGIN
    UPDATE Tipo_pago
    SET
        tipo = nuevo_tipo
    WHERE id_tipo_pago = id_tipo_pago;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EliminarCategoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`KennyTellez`@`localhost` PROCEDURE `EliminarCategoria`(
    IN id_categoria INT
)
BEGIN
    DELETE FROM Categoria
    WHERE id_categoria = id_categoria;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EliminarCita` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`KennyTellez`@`localhost` PROCEDURE `EliminarCita`(
    IN id_cita INT
)
BEGIN
    DELETE FROM Cita
    WHERE id_cita = id_cita;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EliminarCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`KennyTellez`@`localhost` PROCEDURE `EliminarCliente`(
    IN id_cliente INT
)
BEGIN
    DELETE FROM Cliente
    WHERE id_cliente = id_cliente;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EliminarCompra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`KennyTellez`@`localhost` PROCEDURE `EliminarCompra`(
    IN id_compra INT
)
BEGIN
    DELETE FROM Compra
    WHERE id_compra = id_compra;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EliminarDetalleListaDeseos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`KennyTellez`@`localhost` PROCEDURE `EliminarDetalleListaDeseos`(
    IN id_listadetalle INT
)
BEGIN
    DELETE FROM ListaDetalle
    WHERE id_listadetalle = id_listadetalle;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EliminarEmpleado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`KennyTellez`@`localhost` PROCEDURE `EliminarEmpleado`(
    IN id_empleado INT
)
BEGIN
    DELETE FROM Empleado
    WHERE id_empleado = id_empleado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EliminarListaDeseos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`KennyTellez`@`localhost` PROCEDURE `EliminarListaDeseos`(
    IN id_deseo INT
)
BEGIN
    DELETE FROM ListaDeseos
    WHERE id_deseo = id_deseo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EliminarProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`KennyTellez`@`localhost` PROCEDURE `EliminarProducto`(
    IN id_producto INT
)
BEGIN
    DELETE FROM Producto
    WHERE id_producto = id_producto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EliminarProveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`KennyTellez`@`localhost` PROCEDURE `EliminarProveedor`(
    IN id_proveedor INT
)
BEGIN
    DELETE FROM Proveedor
    WHERE id_proveedor = id_proveedor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EliminarResena` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`KennyTellez`@`localhost` PROCEDURE `EliminarResena`(
    IN id_resena INT
)
BEGIN
    DELETE FROM Resena
    WHERE id_resena = id_resena;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EliminarTipoEntrega` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`KennyTellez`@`localhost` PROCEDURE `EliminarTipoEntrega`(
    IN id_entrega INT
)
BEGIN
    DELETE FROM Tipo_entrega
    WHERE id_entrega = id_entrega;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `EliminarTipoPago` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`KennyTellez`@`localhost` PROCEDURE `EliminarTipoPago`(
    IN id_tipo_pago INT
)
BEGIN
    DELETE FROM Tipo_pago
    WHERE id_tipo_pago = id_tipo_pago;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarCategoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`KennyTellez`@`localhost` PROCEDURE `InsertarCategoria`(
    IN nombre_categoria VARCHAR(50),
    IN descripcion_categoria VARCHAR(255)
)
BEGIN
    INSERT INTO Categoria (nombre_categoria, descripcion_categoria)
    VALUES (nombre_categoria, descripcion_categoria);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarCita` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`KennyTellez`@`localhost` PROCEDURE `InsertarCita`(
    IN id_cliente INT,
    IN id_empleado INT,
    IN tipo_servicio VARCHAR(100),
    IN fecha_cita DATE,
    IN hora_cita TIME,
    IN estado_cita BOOLEAN,
    IN comentario VARCHAR(255)
)
BEGIN
    INSERT INTO Cita (id_cliente, id_empleado, tipo_servicio, fecha_cita, hora_cita, estado_cita, comentario)
    VALUES (id_cliente, id_empleado, tipo_servicio, fecha_cita, hora_cita, estado_cita, comentario);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`KennyTellez`@`localhost` PROCEDURE `InsertarCliente`(
    IN nombre1_cliente VARCHAR(15),
    IN nombre2_cliente VARCHAR(15),
    IN apellido1_cliente VARCHAR(15),
    IN apellido2_cliente VARCHAR(15),
    IN fechanac_cliente DATE,
    IN telefono_cliente VARCHAR(9),
    IN email_cliente VARCHAR(255),
    IN contrasena_cliente VARCHAR(255)
)
BEGIN
    INSERT INTO Cliente (
    nombre1_cliente,
    nombre2_cliente, 
    apellido1_cliente,
    apellido2_cliente,
    fechanac_cliente,
    telefono_cliente,
    email_cliente,
    contrasena_cliente) 
    
    VALUES (
    nombre1_cliente,
    nombre2_cliente,
    apellido1_cliente,
    apellido2_cliente,
    fechanac_cliente,
    telefono_cliente,
    email_cliente,
    contrasena_cliente);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarCompra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`KennyTellez`@`localhost` PROCEDURE `InsertarCompra`(
    IN id_cliente INT,
    IN id_tipo_pago INT,
    IN id_entrega INT,
    IN fecha_compra DATE,
    IN hora_compra TIME
)
BEGIN
    INSERT INTO Compra (id_cliente, id_tipo_pago, id_entrega, fecha_compra, hora_compra)
    VALUES (id_cliente, id_tipo_pago, id_entrega, fecha_compra, hora_compra);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarDetalleCompra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`KennyTellez`@`localhost` PROCEDURE `InsertarDetalleCompra`(
    IN id_compra INT,
    IN id_producto INT,
    IN cantidad_compra INT
)
BEGIN
    -- Insertar el detalle de compra
    INSERT INTO Detalle_compra (id_compra, id_producto, cantidad_compra)
    VALUES (id_compra, id_producto, cantidad_compra);

    -- Actualizar el stock del producto
    UPDATE Producto
    SET cantidad = cantidad + cantidad_compra
    WHERE id_producto = id_producto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarElementoListaDeseos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`KennyTellez`@`localhost` PROCEDURE `InsertarElementoListaDeseos`(
    IN id_producto INT,
    IN id_deseo INT
)
BEGIN
    INSERT INTO ListaDetalle (id_producto, id_deseo)
    VALUES (id_producto, id_deseo);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarEmpleado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`KennyTellez`@`localhost` PROCEDURE `InsertarEmpleado`(
    IN nombre1_empleado VARCHAR(15),
    IN nombre2_empleado VARCHAR(15),
    IN apellido1_empleado VARCHAR(15),
    IN apellido2_empleado VARCHAR(15),
    IN especialidad_empleado VARCHAR(50),
    IN telefono_empleado VARCHAR(9),
    IN email_empleado VARCHAR(255),
    IN contrasena_empleado VARCHAR(255)
)
BEGIN
    INSERT INTO Empleado (
    nombre1_empleado,
    nombre2_empleado,
    apellido1_empleado,
    apellido2_empleado,
    especialidad_empleado,
    telefono_empleado,
    email_empleado,
    contrasena_empleado)
    VALUES (
    nombre1_empleado,
    nombre2_empleado,
    apellido1_empleado,
    apellido2_empleado,
    especialidad_empleado,
    telefono_empleado,
    email_empleado,
    contrasena_empleado);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarListaDeseos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`KennyTellez`@`localhost` PROCEDURE `InsertarListaDeseos`(
    IN id_cliente INT,
    IN fecha_creacion DATETIME
)
BEGIN
    INSERT INTO ListaDeseos (id_cliente, fecha_creacion)
    VALUES (id_cliente, fecha_creacion);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`KennyTellez`@`localhost` PROCEDURE `InsertarProducto`(
    IN id_prov INT,
    IN id_cat INT,
    IN nombre VARCHAR(30),
    IN imagen_text VARCHAR(255),
    IN precio_venta DECIMAL(12,2),
    IN precio_compra DECIMAL(12,2),
    IN cantidad INT,
    IN talla VARCHAR(20),
    IN genero CHAR(1)
)
BEGIN
    INSERT INTO Producto (id_proveedor, id_categoria, nombre_producto, imagen, precio_venta, precio_compra, cantidad, talla, genero)
    VALUES (id_prov, id_cat, nombre, imagen_text,precio_venta, precio_compra, cantidad, talla, genero);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarProveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`KennyTellez`@`localhost` PROCEDURE `InsertarProveedor`(
    IN empresa_proveedor VARCHAR(60),
    IN direccion_proveedor VARCHAR(255),
    IN ciudad_proveedor VARCHAR(50)
)
BEGIN
    INSERT INTO Proveedor (empresa_proveedor, direccion_proveedor, ciudad_proveedor)
    VALUES (empresa_proveedor, direccion_proveedor, ciudad_proveedor);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarResena` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`KennyTellez`@`localhost` PROCEDURE `InsertarResena`(
    IN id_cliente INT,
    IN id_producto INT,
    IN calificacion INT,
    IN comentario VARCHAR(255),
    IN fecha_publicacion DATETIME,
    IN aprobacion BOOLEAN
)
BEGIN
    INSERT INTO Resena (id_cliente, id_producto, calificacion, comentario, fecha_publicacion, aprovacion)
    VALUES (id_cliente, id_producto, calificacion, comentario, fecha_publicacion, aprobacion);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarTipoEntrega` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`KennyTellez`@`localhost` PROCEDURE `InsertarTipoEntrega`(
    IN id_empleado INT,
    IN tipo_entrega VARCHAR(50),
    IN estado_entrega VARCHAR(20),
    IN direccion_entrega VARCHAR(255)
)
BEGIN
    INSERT INTO Tipo_entrega (id_empleado, tipo_entrega, estado_entrega, direccion_entrega)
    VALUES (id_empleado, tipo_entrega, estado_entrega, direccion_entrega);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertarTipoPago` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`KennyTellez`@`localhost` PROCEDURE `InsertarTipoPago`(
    IN tipo VARCHAR(65)
)
BEGIN
    INSERT INTO Tipo_pago (tipo)
    VALUES (tipo);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MostrarCategoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`KennyTellez`@`localhost` PROCEDURE `MostrarCategoria`(
    IN id_categoria INT
)
BEGIN
    SELECT *
    FROM Categoria
    WHERE id_categoria = id_categoria;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MostrarCita` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`KennyTellez`@`localhost` PROCEDURE `MostrarCita`(
    IN id_cita INT
)
BEGIN
    SELECT *
    FROM Cita
    WHERE id_cita = id_cita;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MostrarCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`KennyTellez`@`localhost` PROCEDURE `MostrarCliente`(
    IN id_cliente INT
)
BEGIN
    SELECT *
    FROM Cliente
    WHERE id_cliente = id_cliente;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MostrarCompra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`KennyTellez`@`localhost` PROCEDURE `MostrarCompra`(
    IN id_compra INT
)
BEGIN
    SELECT *
    FROM Compra
    WHERE id_compra = id_compra;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MostrarDetalleListaDeseos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`KennyTellez`@`localhost` PROCEDURE `MostrarDetalleListaDeseos`(
    IN id_listadetalle INT
)
BEGIN
    SELECT *
    FROM ListaDetalle
    WHERE id_listadetalle = id_listadetalle;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MostrarEmpleado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`KennyTellez`@`localhost` PROCEDURE `MostrarEmpleado`(
    IN id_empleado INT
)
BEGIN
    SELECT *
    FROM Empleado
    WHERE id_empleado = id_empleado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MostrarListaDeseos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`KennyTellez`@`localhost` PROCEDURE `MostrarListaDeseos`(
    IN id_deseo INT
)
BEGIN
    SELECT *
    FROM ListaDeseos
    WHERE id_deseo = id_deseo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MostrarProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`KennyTellez`@`localhost` PROCEDURE `MostrarProducto`(
    IN id_producto INT
)
BEGIN
    SELECT 
          p.id_producto,
          p.nombre_producto,
          p.imagen,
          p.precio_venta,
          p.precio_compra,
          p.cantidad,
          pr.empresa_proveedor,
          c.nombre_categoria,
          p.talla,
          p.genero
      FROM Producto p
      INNER JOIN Proveedor pr ON p.id_proveedor = pr.id_proveedor
      INNER JOIN Categoria c ON p.id_categoria = c.id_categoria;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MostrarProveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`KennyTellez`@`localhost` PROCEDURE `MostrarProveedor`(
    IN id_proveedor INT
)
BEGIN
    SELECT *
    FROM Proveedor
    WHERE id_proveedor = id_proveedor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MostrarResena` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`KennyTellez`@`localhost` PROCEDURE `MostrarResena`(
    IN id_resena INT
)
BEGIN
    SELECT 
		r.id_resena,
        ct.nombre1_cliente,
        ct.nombre2_cliente,
        ct.apellido1_cliente,
        ct.apellido2_cliente,
        pr.nombre_producto,
        pr.imagen,
        r.calificacion,
        r.comentario,
        r.fecha_publicacion,
        r.aprovacion
    FROM Resena r
    INNER JOIN Cliente ct ON r.id_cliente = ct.id_cliente
	INNER JOIN Producto pr ON r.id_producto = pr.id_producto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MOstrarTipoEntrega` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`KennyTellez`@`localhost` PROCEDURE `MOstrarTipoEntrega`(
    IN id_entrega INT
)
BEGIN
    SELECT *
    FROM Tipo_entrega
    WHERE id_entrega = id_entrega;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MostrarTipoPago` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`KennyTellez`@`localhost` PROCEDURE `MostrarTipoPago`(
    IN id_tipo_pago INT
)
BEGIN
    SELECT *
    FROM Tipo_pago
    WHERE id_tipo_pago = id_tipo_pago;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-08 22:34:40