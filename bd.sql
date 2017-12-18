-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.1.29-MariaDB - MariaDB Server
-- SO del servidor:              Linux
-- HeidiSQL Versión:             9.4.0.5174
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para UBER
CREATE DATABASE IF NOT EXISTS `UBER` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `UBER`;

-- Volcando estructura para tabla UBER.CONDUCTOR
CREATE TABLE IF NOT EXISTS `CONDUCTOR` (
  `idConductor` int(11) NOT NULL AUTO_INCREMENT,
  `licencia` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Vehiculo_idVehiculo` int(11) DEFAULT NULL,
  PRIMARY KEY (`idConductor`),
  KEY `Vehiculo_idVehiculo` (`Vehiculo_idVehiculo`),
  CONSTRAINT `CONDUCTOR_ibfk_1` FOREIGN KEY (`Vehiculo_idVehiculo`) REFERENCES `VEHICULO` (`idVehiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla UBER.SERVICIO
CREATE TABLE IF NOT EXISTS `SERVICIO` (
  `idServicio` int(11) NOT NULL AUTO_INCREMENT,
  `tarifa` decimal(5,2) NOT NULL,
  `descripcion` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `capacidad` int(11) NOT NULL,
  PRIMARY KEY (`idServicio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla UBER.USUARIO
CREATE TABLE IF NOT EXISTS `USUARIO` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `correo` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contrasena` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla UBER.VEHICULO
CREATE TABLE IF NOT EXISTS `VEHICULO` (
  `idVehiculo` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` tinyint(4) NOT NULL,
  `modelo` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `anio` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `capacidad` int(11) NOT NULL,
  PRIMARY KEY (`idVehiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla UBER.VIAJE
CREATE TABLE IF NOT EXISTS `VIAJE` (
  `idViaje` int(11) NOT NULL AUTO_INCREMENT,
  `servicio_idServicio` int(11) NOT NULL,
  `distancia_recorrida` decimal(6,2) NOT NULL,
  `duracion` time NOT NULL,
  `total` decimal(6,2) NOT NULL,
  `vehiculo_idVehiculo` int(11) NOT NULL,
  PRIMARY KEY (`idViaje`),
  KEY `servicio_idServicio` (`servicio_idServicio`),
  KEY `vehiculo_idVehiculo` (`vehiculo_idVehiculo`),
  CONSTRAINT `VIAJE_ibfk_1` FOREIGN KEY (`servicio_idServicio`) REFERENCES `SERVICIO` (`idServicio`),
  CONSTRAINT `VIAJE_ibfk_2` FOREIGN KEY (`vehiculo_idVehiculo`) REFERENCES `VEHICULO` (`idVehiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla UBER.VIAJE_HAS_USUARIO
CREATE TABLE IF NOT EXISTS `VIAJE_HAS_USUARIO` (
  `idViajeUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `viaje_idViaje` int(11) NOT NULL,
  `usuario_idUsuario` int(11) NOT NULL,
  `subtotal` decimal(6,2) NOT NULL,
  PRIMARY KEY (`idViajeUsuario`),
  KEY `viaje_idViaje` (`viaje_idViaje`),
  KEY `usuario_idUsuario` (`usuario_idUsuario`),
  CONSTRAINT `VIAJE_HAS_USUARIO_ibfk_1` FOREIGN KEY (`viaje_idViaje`) REFERENCES `VIAJE` (`idViaje`),
  CONSTRAINT `VIAJE_HAS_USUARIO_ibfk_2` FOREIGN KEY (`usuario_idUsuario`) REFERENCES `USUARIO` (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


