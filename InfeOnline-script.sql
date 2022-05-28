CREATE DATABASE IF NOT EXISTS `infeonline_db`;
USE `infeonline_db`;

DROP TABLE IF EXISTS `tema_rama`;
DROP TABLE IF EXISTS `rama_estadistica`;
DROP TABLE IF EXISTS `mensaje_cliente`;
DROP TABLE IF EXISTS `estado`;
DROP TABLE IF EXISTS `estado_mensaje`;

--
-- Table structure for table `estado`
--
CREATE TABLE `estado` (
  `id` int NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `estado` VALUES (1,'Habilitado'),(2,'Deshabilitado');


--
-- Table structure for table `estado_mensaje`
--
CREATE TABLE `estado_mensaje` (
  `id` int NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `estado_mensaje` VALUES (1,'No Gestionado'),(2,'Asignado'),(3,'Gestionado'),(4,'Anulado');


--
-- Table structure for table `mensaje_cliente`
--
CREATE TABLE `mensaje_cliente` (
  `id` int NOT NULL,
  `estado_mensaje_id` int NOT NULL,
  `nombre` varchar(120) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `asunto` varchar(45) DEFAULT NULL,
  `mensaje` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_mensaje_cliente_estado_mensaje1_idx` (`estado_mensaje_id`),
  CONSTRAINT `fk_mensaje_cliente_estado_mensaje1` FOREIGN KEY (`estado_mensaje_id`) REFERENCES `estado_mensaje` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Table structure for table `rama_estadistica`
--
CREATE TABLE `rama_estadistica` (
  `id` int NOT NULL,
  `estado_id` int NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `titulo` varchar(45) DEFAULT NULL,
  `ruta_url` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_rama_estadistica_estado1_idx` (`estado_id`),
  CONSTRAINT `fk_rama_estadistica_estado1` FOREIGN KEY (`estado_id`) REFERENCES `estado` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO `rama_estadistica` VALUES (1,1,'Descriptiva','ESTADÍSTICA DESCRIPTIVA','/descriptiva'),(2,1,'Inferencial','ESTADÍSTICA INFERENCIAL','/inferencial');


--
-- Table structure for table `tema_rama`
--
CREATE TABLE `tema_rama` (
  `id` int NOT NULL,
  `rama_estadistica_id` int NOT NULL,
  `estado_id` int NOT NULL,
  `titulo` varchar(45) DEFAULT NULL,
  `ruta_url` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tema_rama_estado_idx` (`estado_id`),
  KEY `fk_tema_rama_rama_estadistica1_idx` (`rama_estadistica_id`),
  CONSTRAINT `fk_tema_rama_estado` FOREIGN KEY (`estado_id`) REFERENCES `estado` (`id`),
  CONSTRAINT `fk_tema_rama_rama_estadistica1` FOREIGN KEY (`rama_estadistica_id`) REFERENCES `rama_estadistica` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `tema_rama` VALUES (1,2,1,'PRUEBA DE INDEPENDENCIA','/prueba-independencia'),(2,2,1,'PRUEBA DE HIPÓTESIS PARA LA MEDIA POBLACIONAL','/prueba-hipotesis-media-poblacional');
