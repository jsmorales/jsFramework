-- phpMyAdmin SQL Dump
-- version 4.4.13.1deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 16-06-2016 a las 16:58:09
-- Versión del servidor: 5.6.28-0ubuntu0.15.10.1
-- Versión de PHP: 5.6.11-1ubuntu3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `jsFrameworkBD`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_search`()
BEGIN
	SELECT * FROM usuarios ; 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_search1`()
BEGIN
	SELECT * from usuarios;  
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `archivo`
--

CREATE TABLE IF NOT EXISTS `archivo` (
  `pkID` int(11) NOT NULL,
  `pkID_hojaVida` int(11) DEFAULT NULL,
  `url_archivo` varchar(250) DEFAULT NULL,
  `des_archivo` varchar(250) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `archivo`
--

INSERT INTO `archivo` (`pkID`, `pkID_hojaVida`, `url_archivo`, `des_archivo`) VALUES
(1, 1, 'HV_Johan_Morales.pdf', 'Hoja de vida de Johan Morales'),
(2, 1, 'machine-690190_1280.jpg', 'Certificado desarrollo1'),
(3, 2, 'Especificacion del servicio.pdf', 'Hoja de vida'),
(4, 2, 'factura diciembre amazon.pdf', 'soporte uno'),
(7, 3, 'chuleta-shell-script.pdf', 'Soporte de Hoja 2'),
(8, 3, 'm4u1_anexo01_requerimientos_minimos_servidor.pdf', 'Hoja de vida'),
(9, 3, 'cotizcion_17.pdf', 'Soporte de Hoja 1'),
(10, 4, 'PROYECTO_DE_GRADO_SGW_BRICK _cr2.doc', 'Registro RUT'),
(12, 4, 'law-of-software-quality.jpg', 'Documento de presentación'),
(13, 4, 'Giftip_Futuro.gif', 'Carta de recomendación'),
(14, 5, 'barrow-420728_1280.jpg', '... soporte'),
(15, 6, '2533-8285-1-PB.pdf', 'Hoja de Vida'),
(16, 7, 'manual de usuario.doc', 'y mas prueba'),
(22, 7, 'Shell-Linux-Programacion.DD-BOOKS.COM.pdf', ''),
(23, 7, 'presustentacion_met_tablet.doc', ''),
(27, 7, 'LISTA--pcgamer-precios.pdf', 'xxx'),
(29, 7, 'EK201531411834.pdf', 'ttt'),
(31, 8, 'SCRIPTS_en linux.pdf', ''),
(33, 8, 'JOHAN SEBASTIAN MORALES.pdf', ''),
(34, 9, 'tmp120161040006476_00002 (1).docx', 'doc1'),
(35, 9, 'Acta de Reunion Instlacion entregable 3.doc', 'doc3'),
(36, 9, 'HV_Johan_Morales.doc', 'doc4'),
(37, 9, '120161040006476_00002.docx', 'doc2'),
(38, 9, 'razer-logo-19420-1920x1080.jpg', 'doc5'),
(39, 9, 'TRANSFERENCIA DE ARQUITECTURA DE SOFTWARE.pdf', 'doc7'),
(40, 9, 'razer1.png', 'doc6'),
(41, 10, 'TRANSFERENCIA DE ARQUITECTURA DE SOFTWARE.pdf', 'hoja prueba unitaria'),
(42, 10, '120161040006476_00002 (1) (1).docx', 'anexo prueba unitaria');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulos`
--

CREATE TABLE IF NOT EXISTS `modulos` (
  `pkID` int(11) NOT NULL,
  `Nombre` varchar(250) NOT NULL,
  `fkID_padre` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `modulos`
--

INSERT INTO `modulos` (`pkID`, `Nombre`, `fkID_padre`) VALUES
(1, 'hvida', NULL),
(2, 'formatos', NULL),
(3, 'procesos', NULL),
(4, 'proyectos', NULL),
(5, 'usuarios', NULL),
(6, 'detalles_hvida', NULL),
(7, 'detalles_proyecto', NULL),
(8, 'detalles_proceso', NULL),
(9, 'detalles_proyecto/presupuesto', NULL),
(10, 'detalles_proyecto/documentos', NULL),
(11, 'detalles_proyecto/personal', NULL),
(12, 'detalles_proceso/documentos', NULL),
(13, 'usuarios', NULL),
(14, 'roles', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE IF NOT EXISTS `permisos` (
  `pkID` int(11) NOT NULL,
  `fkID_tipo_usuario` int(11) NOT NULL,
  `fkID_modulo` int(11) NOT NULL,
  `crear` tinyint(1) NOT NULL DEFAULT '0',
  `editar` tinyint(1) NOT NULL DEFAULT '0',
  `eliminar` tinyint(1) NOT NULL DEFAULT '0',
  `consultar` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `permisos`
--

INSERT INTO `permisos` (`pkID`, `fkID_tipo_usuario`, `fkID_modulo`, `crear`, `editar`, `eliminar`, `consultar`) VALUES
(2, 2, 1, 0, 1, 0, 1),
(3, 3, 1, 0, 0, 1, 1),
(4, 1, 2, 1, 1, 1, 1),
(5, 1, 6, 1, 1, 1, 1),
(6, 1, 4, 1, 1, 1, 1),
(7, 1, 3, 1, 1, 1, 1),
(8, 1, 7, 1, 1, 1, 1),
(9, 1, 9, 1, 1, 0, 1),
(10, 1, 10, 1, 1, 1, 1),
(11, 1, 8, 1, 1, 1, 1),
(12, 1, 12, 1, 0, 0, 1),
(13, 1, 13, 1, 1, 1, 1),
(14, 2, 13, 0, 1, 0, 1),
(15, 1, 14, 1, 1, 1, 1),
(16, 3, 14, 1, 0, 0, 1),
(17, 1, 1, 1, 1, 1, 1),
(18, 1, 11, 1, 1, 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_usuario`
--

CREATE TABLE IF NOT EXISTS `tipo_usuario` (
  `pkID` int(11) NOT NULL,
  `nombre` varchar(250) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_usuario`
--

INSERT INTO `tipo_usuario` (`pkID`, `nombre`) VALUES
(1, 'Administrador'),
(2, 'jefe_personal'),
(3, 'lider'),
(4, 'tipo_prueba _usuario'),
(5, 'prueba_tipo_2'),
(6, 'prueba tipo 3'),
(7, 'tipo_4');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `pkID` int(11) NOT NULL,
  `alias` varchar(50) NOT NULL,
  `pass` varchar(250) NOT NULL,
  `pass_conf` varchar(250) NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `apellido` varchar(250) NOT NULL,
  `email` varchar(500) NOT NULL,
  `fkID_tipo` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`pkID`, `alias`, `pass`, `pass_conf`, `nombre`, `apellido`, `email`, `fkID_tipo`) VALUES
(1, 'jsmorales', '8cb2237d0679ca88db6464eac60da96345513964', '', 'Johan', 'Morales', 'jhellmetal2000@gmail.com', 1),
(3, 'nbarrero', '00fd4b4549a1094aae926ef62e9dbd3cdcc2e456', '', 'Nancy', 'Barrero', 'nbarrero@lunel-ie.com', 3),
(4, 'isanchez', '3acd0be86de7dcccdbf91b20f94a68cea535922d', '', 'Ingrid solangie', 'Sanchez Romira', '', 2),
(5, 'oramirez', '8cb2237d0679ca88db6464eac60da96345513964', '', 'Oscar', 'Ramirez', '', 1),
(8, 'rumbarila', '8cb2237d0679ca88db6464eac60da96345513964', '8cb2237d0679ca88db6464eac60da96345513964', 'Ricardo', 'Umbarila Torres', 'rumbarila@lunel-ie.com', 1),
(9, 'jsilva', '8cb2237d0679ca88db6464eac60da96345513964', '8cb2237d0679ca88db6464eac60da96345513964', 'Jorge', 'Silva', 'gerencia@lunel-ie.com', 3),
(10, 'Sandra.2113', '8cb2237d0679ca88db6464eac60da96345513964', 'dd8efd3d9dacb3b894ba0b77ec65b1bfb88c9043', 'Sandra', 'Parra', 'sandra.2113@gmail.com', 1),
(11, 'jpersonal', '8cb2237d0679ca88db6464eac60da96345513964', '8cb2237d0679ca88db6464eac60da96345513964', 'Lana', 'Lang', '', 2),
(14, 'qwerty', '00fd4b4549a1094aae926ef62e9dbd3cdcc2e456', '', 'qwerty', 'qwerty', '', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `archivo`
--
ALTER TABLE `archivo`
  ADD PRIMARY KEY (`pkID`);

--
-- Indices de la tabla `modulos`
--
ALTER TABLE `modulos`
  ADD PRIMARY KEY (`pkID`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`pkID`);

--
-- Indices de la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  ADD PRIMARY KEY (`pkID`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`pkID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `archivo`
--
ALTER TABLE `archivo`
  MODIFY `pkID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT de la tabla `modulos`
--
ALTER TABLE `modulos`
  MODIFY `pkID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `pkID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT de la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  MODIFY `pkID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `pkID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
