-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3307
-- Tiempo de generación: 10-04-2025 a las 02:32:37
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `gestorclientesv2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE `personas` (
  `identificacion` int(11) NOT NULL,
  `digitoVerificacion` int(11) DEFAULT NULL,
  `descripcionActividad` varchar(500) DEFAULT NULL,
  `tipoIdentificacion` varchar(250) NOT NULL,
  `nombres` varchar(300) NOT NULL,
  `apellidos` varchar(250) DEFAULT NULL,
  `genero` varchar(250) DEFAULT NULL,
  `telefono` varchar(250) NOT NULL,
  `correo` varchar(250) NOT NULL,
  `fechaNacimiento` date NOT NULL,
  `esAdmin` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `personas`
--

INSERT INTO `personas` (`identificacion`, `digitoVerificacion`, `descripcionActividad`, `tipoIdentificacion`, `nombres`, `apellidos`, `genero`, `telefono`, `correo`, `fechaNacimiento`, `esAdmin`) VALUES
(777777, NULL, NULL, 'cedula de ciudadania', 'daniel', 'garcia', 'Masculino', 'rikjfgoirejfgrifj', 'regergreg', '2025-04-17', 0),
(808182, NULL, NULL, 'cedula de ciudadania', 'admin', 'adminisito', 'Masculino', 'admin@gmail.com', '4521457', '2025-04-22', 0),
(965478, NULL, NULL, 'cedula de ciudadania', 'santiago', 'garcia', 'Masculino', 'g@h.com', '5412658', '2025-04-11', 0),
(47789654, 7, 'Hoila', 'RUT', 'empresa1', NULL, NULL, '8954', 'fewfewf@rgttregtrg.com', '2025-04-02', 0),
(787142564, NULL, NULL, 'cedula de ciudadania', 'david', 'murcia', 'Masculino', 'prueba@gmail.com', '7896584', '2025-04-17', 0),
(1021396030, NULL, NULL, 'cedula de ciudadania', 'andres', 'hincapie', 'Masculino', 'andres@hinca', '3209996288', '2005-04-10', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona_sector`
--

CREATE TABLE `persona_sector` (
  `idPersona` int(11) NOT NULL,
  `idSector` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `persona_sector`
--

INSERT INTO `persona_sector` (`idPersona`, `idSector`) VALUES
(808182, 1),
(808182, 2),
(965478, 1),
(965478, 2),
(47789654, 1),
(47789654, 2),
(47789654, 3),
(1021396030, 4),
(1021396030, 5),
(1021396030, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pqrs`
--

CREATE TABLE `pqrs` (
  `idpqrs` int(11) NOT NULL,
  `tipoComentario` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pqrs`
--

INSERT INTO `pqrs` (`idpqrs`, `tipoComentario`) VALUES
(1, 'queja'),
(2, 'reclamo'),
(3, 'sugerencia'),
(4, 'peticiones'),
(8, 'Reclamo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pqrs_asignacion`
--

CREATE TABLE `pqrs_asignacion` (
  `idPQRS` int(11) NOT NULL,
  `idPersona` int(11) NOT NULL,
  `comentario` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pqrs_asignacion`
--

INSERT INTO `pqrs_asignacion` (`idPQRS`, `idPersona`, `comentario`) VALUES
(8, 777777, 'hola mundo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `publicaciones`
--

CREATE TABLE `publicaciones` (
  `idPublicacion` int(11) NOT NULL,
  `descripcionPublicacion` varchar(500) NOT NULL,
  `idUsuarioCrea` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `publicaciones`
--

INSERT INTO `publicaciones` (`idPublicacion`, `descripcionPublicacion`, `idUsuarioCrea`) VALUES
(1, 'hola', 1),
(2, 'publi1', 1),
(3, 'andresito', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `idRol` int(11) NOT NULL,
  `nombreRol` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`idRol`, `nombreRol`) VALUES
(1, 'administrador'),
(2, 'cliente'),
(3, 'empresa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sectores`
--

CREATE TABLE `sectores` (
  `idSector` int(11) NOT NULL,
  `descripcionSector` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sectores`
--

INSERT INTO `sectores` (`idSector`, `descripcionSector`) VALUES
(1, 'Alimentario'),
(2, 'Textil'),
(3, 'Químico'),
(4, 'Militar'),
(5, 'Siderúrgica'),
(6, 'Cementera'),
(7, 'Turística'),
(8, 'Forestal'),
(9, 'Automovilística'),
(10, 'Tecnologico');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `clave` varchar(255) DEFAULT NULL,
  `identificacionPersona` int(11) DEFAULT NULL,
  `personaRol` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `username`, `clave`, `identificacionPersona`, `personaRol`) VALUES
(1, 'juanhola', 'hola', 47789654, 3),
(2, 'santi', 'santi2', 965478, 2),
(3, 'admin', 'admin', 808182, 1),
(4, 'andrex', '1234', 1021396030, 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`identificacion`);

--
-- Indices de la tabla `persona_sector`
--
ALTER TABLE `persona_sector`
  ADD PRIMARY KEY (`idPersona`,`idSector`),
  ADD KEY `idSector` (`idSector`);

--
-- Indices de la tabla `pqrs`
--
ALTER TABLE `pqrs`
  ADD PRIMARY KEY (`idpqrs`);

--
-- Indices de la tabla `pqrs_asignacion`
--
ALTER TABLE `pqrs_asignacion`
  ADD PRIMARY KEY (`idPQRS`,`idPersona`),
  ADD KEY `idPersona` (`idPersona`);

--
-- Indices de la tabla `publicaciones`
--
ALTER TABLE `publicaciones`
  ADD PRIMARY KEY (`idPublicacion`),
  ADD KEY `usuariocrea` (`idUsuarioCrea`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`idRol`);

--
-- Indices de la tabla `sectores`
--
ALTER TABLE `sectores`
  ADD PRIMARY KEY (`idSector`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `identificacionPersona` (`identificacionPersona`),
  ADD KEY `personaRol` (`personaRol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pqrs`
--
ALTER TABLE `pqrs`
  MODIFY `idpqrs` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `publicaciones`
--
ALTER TABLE `publicaciones`
  MODIFY `idPublicacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `idRol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `sectores`
--
ALTER TABLE `sectores`
  MODIFY `idSector` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `persona_sector`
--
ALTER TABLE `persona_sector`
  ADD CONSTRAINT `persona_sector_ibfk_1` FOREIGN KEY (`idPersona`) REFERENCES `personas` (`identificacion`),
  ADD CONSTRAINT `persona_sector_ibfk_2` FOREIGN KEY (`idSector`) REFERENCES `sectores` (`idSector`);

--
-- Filtros para la tabla `pqrs_asignacion`
--
ALTER TABLE `pqrs_asignacion`
  ADD CONSTRAINT `pqrs_asignacion_ibfk_1` FOREIGN KEY (`idPQRS`) REFERENCES `pqrs` (`idpqrs`),
  ADD CONSTRAINT `pqrs_asignacion_ibfk_2` FOREIGN KEY (`idPersona`) REFERENCES `personas` (`identificacion`);

--
-- Filtros para la tabla `publicaciones`
--
ALTER TABLE `publicaciones`
  ADD CONSTRAINT `publicaciones_ibfk_1` FOREIGN KEY (`idUsuarioCrea`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`identificacionPersona`) REFERENCES `personas` (`identificacion`),
  ADD CONSTRAINT `usuarios_ibfk_2` FOREIGN KEY (`personaRol`) REFERENCES `roles` (`idRol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
