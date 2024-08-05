-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-08-2024 a las 05:29:30
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `opm`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compañias`
--

CREATE TABLE `compañias` (
  `Id_Compañia` int(5) NOT NULL,
  `Actividad_Principal` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuarteles`
--

CREATE TABLE `cuarteles` (
  `Id_Cuartel` int(5) NOT NULL,
  `Nombre_Cuartel` varchar(15) DEFAULT NULL,
  `Ubicacion_Cuartel` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuartel_compañia`
--

CREATE TABLE `cuartel_compañia` (
  `Id_Cuarteles` int(10) DEFAULT NULL,
  `Id_Compañias` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuerpos`
--

CREATE TABLE `cuerpos` (
  `Id_Cuerpo` int(5) NOT NULL,
  `Denominacion` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `Id_Servicio` int(5) NOT NULL,
  `Actividad_Realizada` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio_soldado`
--

CREATE TABLE `servicio_soldado` (
  `Id_Servicios` int(10) DEFAULT NULL,
  `Id_Soldados` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `soldados`
--

CREATE TABLE `soldados` (
  `Id_Soldado` int(5) NOT NULL,
  `Nombre_Soldado` varchar(10) DEFAULT NULL,
  `Grado_Soldado` varchar(10) DEFAULT NULL,
  `Id_Cuarteles` int(10) DEFAULT NULL,
  `Id_Cuerpos` int(10) DEFAULT NULL,
  `Id_Compañias` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `compañias`
--
ALTER TABLE `compañias`
  ADD PRIMARY KEY (`Id_Compañia`);

--
-- Indices de la tabla `cuarteles`
--
ALTER TABLE `cuarteles`
  ADD PRIMARY KEY (`Id_Cuartel`);

--
-- Indices de la tabla `cuartel_compañia`
--
ALTER TABLE `cuartel_compañia`
  ADD KEY `fk_idseis` (`Id_Cuarteles`),
  ADD KEY `fk_idsiete` (`Id_Compañias`);

--
-- Indices de la tabla `cuerpos`
--
ALTER TABLE `cuerpos`
  ADD PRIMARY KEY (`Id_Cuerpo`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`Id_Servicio`);

--
-- Indices de la tabla `servicio_soldado`
--
ALTER TABLE `servicio_soldado`
  ADD KEY `fk_idcuatro` (`Id_Soldados`),
  ADD KEY `fk_idcinco` (`Id_Servicios`);

--
-- Indices de la tabla `soldados`
--
ALTER TABLE `soldados`
  ADD PRIMARY KEY (`Id_Soldado`),
  ADD KEY `fk_iduno` (`Id_Cuarteles`),
  ADD KEY `fk_iddos` (`Id_Cuerpos`),
  ADD KEY `fk_idtres` (`Id_Compañias`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `compañias`
--
ALTER TABLE `compañias`
  MODIFY `Id_Compañia` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cuarteles`
--
ALTER TABLE `cuarteles`
  MODIFY `Id_Cuartel` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cuerpos`
--
ALTER TABLE `cuerpos`
  MODIFY `Id_Cuerpo` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `Id_Servicio` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `soldados`
--
ALTER TABLE `soldados`
  MODIFY `Id_Soldado` int(5) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cuartel_compañia`
--
ALTER TABLE `cuartel_compañia`
  ADD CONSTRAINT `fk_idseis` FOREIGN KEY (`Id_Cuarteles`) REFERENCES `cuarteles` (`Id_Cuartel`),
  ADD CONSTRAINT `fk_idsiete` FOREIGN KEY (`Id_Compañias`) REFERENCES `compañias` (`Id_Compañia`);

--
-- Filtros para la tabla `servicio_soldado`
--
ALTER TABLE `servicio_soldado`
  ADD CONSTRAINT `fk_idcinco` FOREIGN KEY (`Id_Servicios`) REFERENCES `servicios` (`Id_Servicio`),
  ADD CONSTRAINT `fk_idcuatro` FOREIGN KEY (`Id_Soldados`) REFERENCES `soldados` (`Id_Soldado`);

--
-- Filtros para la tabla `soldados`
--
ALTER TABLE `soldados`
  ADD CONSTRAINT `fk_iddos` FOREIGN KEY (`Id_Cuerpos`) REFERENCES `cuerpos` (`Id_Cuerpo`),
  ADD CONSTRAINT `fk_idtres` FOREIGN KEY (`Id_Compañias`) REFERENCES `compañias` (`Id_Compañia`),
  ADD CONSTRAINT `fk_iduno` FOREIGN KEY (`Id_Cuarteles`) REFERENCES `cuarteles` (`Id_Cuartel`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
