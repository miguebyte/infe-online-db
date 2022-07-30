CREATE DATABASE IF NOT EXISTS `infeonline_db`;
USE `infeonline_db`;

DROP TABLE IF EXISTS `tema_rama`;
DROP TABLE IF EXISTS `rama_estadistica`;
DROP TABLE IF EXISTS `mensaje_cliente`;
DROP TABLE IF EXISTS `usuario`;
DROP TABLE IF EXISTS `estado_mensaje`;
DROP TABLE IF EXISTS `tipo_usuario`;
DROP TABLE IF EXISTS `estado`;

--
-- Table structure for table `estado`
--
CREATE TABLE `estado` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


--
-- Table structure for table `estado_mensaje`
--
CREATE TABLE `estado_mensaje` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


--
-- Table structure for table `mensaje_cliente`
--
CREATE TABLE `mensaje_cliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estado_mensaje_id` int(11) NOT NULL,
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
  `id` int(11) NOT NULL,
  `estado_id` int(11) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `titulo` varchar(45) DEFAULT NULL,
  `ruta_url` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_rama_estadistica_estado1_idx` (`estado_id`),
  CONSTRAINT `fk_rama_estadistica_estado1` FOREIGN KEY (`estado_id`) REFERENCES `estado` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


--
-- Table structure for table `tema_rama`
--
CREATE TABLE `tema_rama` (
  `id` int(11) NOT NULL,
  `rama_estadistica_id` int(11) NOT NULL,
  `estado_id` int(11) NOT NULL,
  `titulo` varchar(45) DEFAULT NULL,
  `ruta_url` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tema_rama_estado_idx` (`estado_id`),
  KEY `fk_tema_rama_rama_estadistica1_idx` (`rama_estadistica_id`),
  CONSTRAINT `fk_tema_rama_estado` FOREIGN KEY (`estado_id`) REFERENCES `estado` (`id`),
  CONSTRAINT `fk_tema_rama_rama_estadistica1` FOREIGN KEY (`rama_estadistica_id`) REFERENCES `rama_estadistica` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


--
-- Table structure for table `tipo_usuario`
--
CREATE TABLE `tipo_usuario` (
  `id` int(11) NOT NULL,
  `estado_id` int(11) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `estado_id_fk_idx` (`estado_id`),
  CONSTRAINT `estado_id_fk` FOREIGN KEY (`estado_id`) REFERENCES `estado` (`id`)
) /*!50100 TABLESPACE `innodb_system` */ ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Table structure for table `usuario`
--
CREATE TABLE `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estado_id` int(11) DEFAULT NULL,
  `tipo_usuario_id` int(11) DEFAULT NULL,
  `codigo` varchar(45) DEFAULT NULL,
  `contrasenia` varchar(50) DEFAULT NULL,
  `nombre` varchar(120) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo_UNIQUE` (`codigo`),
  KEY `tipo_usuario_id_fk_idx` (`tipo_usuario_id`),
  KEY `estado_id_fk_idx` (`estado_id`),
  CONSTRAINT `estado_usuario_id_fk` FOREIGN KEY (`estado_id`) REFERENCES `estado` (`id`),
  CONSTRAINT `tipo_usuario_id_fk` FOREIGN KEY (`tipo_usuario_id`) REFERENCES `tipo_usuario` (`id`)
) /*!50100 TABLESPACE `innodb_system` */ ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;