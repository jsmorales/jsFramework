-- phpMyAdmin SQL Dump
-- version 4.4.13.1deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 27-05-2016 a las 16:02:02
-- Versión del servidor: 5.6.28-0ubuntu0.15.10.1
-- Versión de PHP: 5.6.11-1ubuntu3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `lunelAdmin`
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
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE IF NOT EXISTS `categoria` (
  `pkID` int(11) NOT NULL,
  `nombre_cat` varchar(250) NOT NULL,
  `fkID_padre` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`pkID`, `nombre_cat`, `fkID_padre`) VALUES
(1, 'Gerencia de proyectos', NULL),
(2, 'Juridica', NULL),
(3, 'Certificaciones', NULL),
(4, 'Contrato de Trabajo - termino indefinido', 2),
(5, 'Contrato de Trabajo - prestacion de servicios', 2),
(9, 'Recursos Humanos', NULL),
(10, 'Contratos', NULL),
(11, 'prueba modal 1', NULL),
(12, 'prueba 2 modal', NULL),
(13, 'prueba 3 categoria', NULL),
(14, 'prueba categoria 4', NULL),
(15, 'prueba 5 modal categoria', NULL),
(16, 'prueba categoria 6', NULL),
(17, 'prueba 7 categorias', NULL),
(18, 'Sub de gerencia 1', 1),
(19, 'sub 1 contratos', 10),
(20, 'sub 1 recursos humanos', 9),
(21, 'prueba instancia 1', NULL),
(22, 'prueba instancia 2', NULL),
(23, 'prueba rhumanos 2', 9),
(24, 'prueba sub-contratos2', 10),
(25, 'prueba sub contratos3', 10),
(26, 'cataegoria nueva jorge', NULL),
(27, 'sub categoria jorge', 26),
(28, 'categoria nueva 001', NULL),
(29, 'sub categoria nueva 001', 28),
(30, 'prueba unitaria categoria', NULL),
(31, 'pruebaUnitaria subCategoria', 30),
(32, 'cat0001', NULL),
(33, 'SubCat0001', 32),
(34, 'subCat002', 32),
(35, 'Contabilidad', NULL),
(36, 'Nomina', 35),
(37, 'prueba1', NULL),
(38, 'sub_prueba_1', 37);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documentos`
--

CREATE TABLE IF NOT EXISTS `documentos` (
  `pkID` int(11) NOT NULL,
  `nom_doc` varchar(250) NOT NULL,
  `ruta` varchar(350) NOT NULL,
  `fkID_tipo` int(11) NOT NULL,
  `fkID_proyecto` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `documentos`
--

INSERT INTO `documentos` (`pkID`, `nom_doc`, `ruta`, `fkID_tipo`, `fkID_proyecto`) VALUES
(2, 'Primer Documento', 'LISTA.pdf', 2, 5),
(4, 'Documento de subida de nuevo juridico', 'Competencias ciudadanas 2015-1.pdf', 1, 3),
(5, 'doc editado 5', 'ELEC._TECNOLOGIAS_ORIENTADOS_A_OBJETOS.pdf', 4, 3),
(6, 'qwerty doc', 'cotizcion_17.pdf', 3, 3),
(7, 'Documento para el proyecto 1', 'brick.pdf', 5, 1),
(8, 'Documento firefox', 'brick.pdf', 2, 6),
(9, 'file', 'LISTA--pcgamer-precios.pdf', 1, 6),
(10, 'pdf nuevo', 'relacional_brick (1).pdf', 2, 6),
(11, 'Otro documento', 'claves_hosts_lunel.odt', 3, 5),
(12, 'prueba datos config', '(674800594) relacional_brick (1).docx', 5, 6),
(13, 'Documento del proceso arquitectura (Técnico)', 'Arquitectura, despligue y casos de prueba(final).docx', 2, 7),
(14, 'Documento de pruebas1', 'CONSTITUCION POLITICA.docx', 7, 10),
(15, 'Documento de pruebas 2', 'adm-personal-libroadm-derrhh-chiavenato-cap-1al17-120709125705-phpapp02.doc', 1, 10),
(16, 'prueba 3', 'chuleta-shell-script.pdf', 7, 10),
(17, 'Prueba de tree view1', 'Actividad 4 JOHAN.docx', 8, 10),
(18, 'Prueba de tree view 2', 'Arquitectura, despligue y casos de prueba(final) (1).docx', 8, 10),
(19, 'prueba unitaria documento', '120161040006476_00002 (1).docx', 6, 12),
(20, 'Prueba Proyecto/documentos1_004', 'FONADE MINERIA RADIO 2012 (4).PDF', 5, 13),
(21, 'Prueba Proyecto/documentos2_004', 'Libro1_pruebas.xlsx', 3, 13),
(22, 'Ficha tecnica', 'FICHA TECNICA OUTSOURCING TIC-IDEAM OCT 08 (2).docx', 9, 14);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documentos_proceso`
--

CREATE TABLE IF NOT EXISTS `documentos_proceso` (
  `pkID` int(11) NOT NULL,
  `nom_doc` varchar(250) NOT NULL,
  `ruta` varchar(250) NOT NULL,
  `fkID_tipo` int(11) DEFAULT NULL,
  `fkID_proceso` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `documentos_proceso`
--

INSERT INTO `documentos_proceso` (`pkID`, `nom_doc`, `ruta`, `fkID_tipo`, `fkID_proceso`) VALUES
(1, 'prueba documento proceso6', 'Acta_Seguimiento_Min Tic 20151104.docx', 1, 6),
(2, 'Documento 1 para proceso 27 -- edita', 'Constitución política  (1).docx', 1, 27),
(4, 'Proyecto de pliego ', 'PPC_PROCESO_16-15-5054475_124001000_19390343.pdf', 4, 33),
(5, 'prueba x', 'FONADE MINERIA RADIO 2012 (1).PDF', 1, 33),
(6, 'prueba', 'PPC_PROCESO_16-15-5054475_124001000_19390343.pdf', 1, 34),
(7, 'prueba documento proceso 36', 'Libro1_pruebas (2).xlsx', 1, 36),
(8, 'prueba documento2 proceso 36', '39407(12-12-12).doc', 1, 36);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entidades`
--

CREATE TABLE IF NOT EXISTS `entidades` (
  `pkID` int(11) NOT NULL,
  `nombre_entidad` varchar(250) NOT NULL,
  `nom_contacto` varchar(250) DEFAULT NULL,
  `tel_contacto` varchar(100) DEFAULT NULL,
  `observacion_entidad` text
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `entidades`
--

INSERT INTO `entidades` (`pkID`, `nombre_entidad`, `nom_contacto`, `tel_contacto`, `observacion_entidad`) VALUES
(1, 'Gobernacion de Guainia', NULL, NULL, NULL),
(2, 'Gobernacion de Guaviare', NULL, NULL, NULL),
(4, 'Gobernación de Cundinamarca', NULL, NULL, NULL),
(5, 'IDEAM', NULL, NULL, NULL),
(6, 'Telebucaramanga', NULL, NULL, NULL),
(7, 'FONADE', NULL, NULL, NULL),
(8, 'Entidad prueba 1', NULL, NULL, NULL),
(9, 'Prueba de entidad 3', NULL, NULL, NULL),
(10, 'Entidad prueba 3', NULL, NULL, NULL),
(11, 'Entidad prueba 4', NULL, NULL, NULL),
(12, 'Entidad prueba 6', 'Martha Valdiviezo', '3115208549', 'Esta es una observación de prueba.'),
(13, 'Entidad de prueba 345', '', '', ''),
(14, 'Entidad de prueba procesos1', '', '', ''),
(15, 'Entidad de prueba procesos2', '', '', ''),
(16, 'Entidad de prueba proyectos3', '', '', ''),
(17, 'ESAP', 'EL GORDO', '6666666', 'SI'),
(18, 'Ministerio de Transporte', '', '', ''),
(19, 'Ministerio deMinas', '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE IF NOT EXISTS `estado` (
  `pkID` int(11) NOT NULL,
  `nombre` varchar(250) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`pkID`, `nombre`) VALUES
(1, 'Empleado'),
(2, 'Ex-empleado'),
(3, 'Externo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_proceso`
--

CREATE TABLE IF NOT EXISTS `estado_proceso` (
  `pkID` int(11) NOT NULL,
  `nombre` varchar(250) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estado_proceso`
--

INSERT INTO `estado_proceso` (`pkID`, `nombre`) VALUES
(1, 'proceso'),
(2, 'ejecución'),
(3, 'terminado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_proyecto`
--

CREATE TABLE IF NOT EXISTS `estado_proyecto` (
  `pkID` int(11) NOT NULL,
  `nombre` varchar(250) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estado_proyecto`
--

INSERT INTO `estado_proyecto` (`pkID`, `nombre`) VALUES
(1, 'Proceso'),
(2, 'Ejecución'),
(3, 'Terminado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudio`
--

CREATE TABLE IF NOT EXISTS `estudio` (
  `pkID` int(11) NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `fkID_tipoEstudio` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estudio`
--

INSERT INTO `estudio` (`pkID`, `nombre`, `fkID_tipoEstudio`) VALUES
(1, 'Ingeniería de Sistemas', 1),
(2, 'Contaduría Pública', 1),
(3, 'Gerencia de Proyectos De Software', 3),
(4, 'Ingeniería de telecomunicación - interuniversitario UOC/ URL', 4),
(5, 'Doctorado en Software, Sistemas y Computación (DSSC)', 5),
(6, 'Ingeniería Electrónica', 1),
(7, 'Ingeniería Agrícola', 1),
(8, 'Administración de Empresas', 1),
(9, 'Administrador de Sistemas', 1),
(10, 'Técnico en sistemas Computacionales', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formato`
--

CREATE TABLE IF NOT EXISTS `formato` (
  `pkID` int(11) NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `descripcion` varchar(500) NOT NULL,
  `url_archivo` varchar(250) NOT NULL,
  `fkID_categoria` int(11) NOT NULL,
  `fkID_subcategoria` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `formato`
--

INSERT INTO `formato` (`pkID`, `nombre`, `descripcion`, `url_archivo`, `fkID_categoria`, `fkID_subcategoria`) VALUES
(1, 'Formato 1', 'Formato uno ...', 'Acta de Reunion Instlacion entregable 3.doc', 1, 4),
(2, 'Formato 2', ' Un formato ...', 'FONADE MINERIA RADIO 2012 (2).PDF', 3, 4),
(3, 'Contrato 1', ' Un contrato para trabajar por prestación de servicios.', 'LISTA.pdf', 1, 5),
(4, 'Formato de prueba 12321', ' Este es un formato para probar la aplicación.', '2533-8285-1-PB.pdf', 1, 5),
(5, 'Recursos humanos formato prueba', ' Un formato de prueba del modulo formatos.', 'TALLER DE HABEAS CORPUS - copia.docx', 9, 20),
(6, 'Contrato 3', 'Otro documento de contratos.', 'Derecho de petición Ley 1437 de 2011 (1).docx', 10, 25),
(8, 'Formato de certificaciones sub null', ' Formato de certificaciones sub null', 'gruponc2ba09-la-organizacion1.doc', 3, NULL),
(9, 'formato de categoria 001', ' formato de categoria 001', 'Arquitectura, despligue y casos de prueba(final).docx', 28, 0),
(11, 'CertiWE001', ' Una certificación de prueba.', 'ajustes_gelguaviare_20151204.docx', 3, NULL),
(12, 'Comprobante de Egreso', 'Soporte de contabilidad que respalda el giro o retiro de una cantidad de dinero determinada.', 'COMPROBANTE DE EGRESO.xls', 35, 0),
(13, 'prueba no sub', ' prueba no sub', 'FONADE MINERIA RADIO 2012 (4).PDF', 37, 0),
(14, 'Recibo de caja', ' Prueba', 'Acta de Reunion Instlacion entregable 3.doc', 35, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gastos`
--

CREATE TABLE IF NOT EXISTS `gastos` (
  `pkID` int(11) NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `descripcion` varchar(250) NOT NULL,
  `fecha` date DEFAULT NULL,
  `beneficiario` varchar(250) NOT NULL,
  `nom_archivo` varchar(250) DEFAULT NULL,
  `valor` bigint(20) NOT NULL,
  `fkID_proyecto` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `gastos`
--

INSERT INTO `gastos` (`pkID`, `nombre`, `descripcion`, `fecha`, `beneficiario`, `nom_archivo`, `valor`, `fkID_proyecto`) VALUES
(1, 'gasto 1', 'es un gasto para el proyecto', '2016-01-13', 'Antonio Vélez', NULL, 23000000, 3),
(2, 'gasto para proyecto 1-0-1', 'un gasto que sale del proyecto 1', '2016-01-23', 'Arquímedes Cardona', NULL, 3500000, 1),
(3, 'Presupuesto 2', 'Breve descripción del presupuesto.', '2016-01-14', 'Alguien', NULL, 12000000, 3),
(5, 'OTRO GASTO', 'Describiendo la vaina', '2016-01-17', 'UNA', NULL, 10000000000, 3),
(6, 'especialista 1', 'base de datos', '2016-01-13', 'DBA', NULL, 55500000, 5),
(7, 'otro', 'otra', '2016-01-14', 'si', NULL, 400000000, 5),
(8, 'gasto para software', 'Gasto para pagar le desarrollador', '2016-03-19', 'Antonio linares', NULL, 3000000, 4),
(9, 'pers 21123', 'qwerty.', '2016-01-22', 'asdfa', NULL, 232322222, 3),
(10, 'Contrato tester', 'Contratar tester par esta tarea.', '2016-04-29', 'Julian Costa', NULL, 2500000, 6),
(11, 'Recurso humano 1', 'Un recurso humano necesario para el proyecto.', '2016-04-29', 'Juan Dominguez', NULL, 3200000, 7),
(12, 'Poliza', 'Poliza', '2016-04-08', 'Seguros del Estado', NULL, 4000000, 8),
(13, 'Gerencia del proyecto', 'Costo de 10 meses de Gerencia de proyecto', '2016-04-01', 'JUan carlos martinez', NULL, 90000000, 8),
(14, 'IVA', '16%', '2016-04-01', 'DIAN', NULL, 160000000, 8),
(15, 'Gasto 1', 'Gasto 1 para proyecto de prueba', '0000-00-00', 'Juan Pérez', '', 222222, 10),
(16, 'Prueba file1', 'Prueba file1', '0000-00-00', 'Un beneficiario de prueba', 'relacional_brick.pdf', 23000, 10),
(17, 'Prueba file2', 'Prueba file2', '0000-00-00', 'Prueba file2', '2533-8285-1-PB (1).pdf', 4000000, 10),
(21, 'Prueba file6', 'Prueba file6', '2016-05-20', 'Prueba file6', '', 10000000, 10),
(22, 'Prueba file7', 'Prueba file7', '0000-00-00', 'Prueba file7', '', 2100000, 10),
(25, 'Excel de prueba2', 'Excel de prueba2', '0000-00-00', 'Excel de prueba2', 'Libro1_pruebas.xlsx', 2000000, 10),
(26, 'prueba unitaria presupuesto', 'prueba unitaria presupuesto', '2016-05-31', 'prueba unitaria presupuesto', 'cronogramaIdeam.xlsx', 2000000, 12),
(27, 'Prueba Proyecto/presupuesto_004', 'Prueba Proyecto/presupuesto_004', '0000-00-00', 'Prueba Proyecto/presupuesto_004', 'FONADE MINERIA PRENSA 2014.PDF', 20000000, 13),
(28, 'Prueba Proyecto/presupuesto2_004', 'Prueba Proyecto/presupuesto2_004', '2016-05-19', 'Prueba Proyecto/presupuesto2_004', '', 5000000, 13),
(29, 'prueba gasto', 'prueba gasto', '0000-00-00', 'prueba gasto', 'Libro1_pruebas.xlsx', 2300000, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hoja_estudio`
--

CREATE TABLE IF NOT EXISTS `hoja_estudio` (
  `pkID` int(11) NOT NULL,
  `pkID_hojaVida` int(11) NOT NULL,
  `pkID_estudio` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `hoja_estudio`
--

INSERT INTO `hoja_estudio` (`pkID`, `pkID_hojaVida`, `pkID_estudio`) VALUES
(1, 1, 1),
(6, 2, 6),
(8, 2, 4),
(9, 3, 2),
(10, 4, 8),
(11, 4, 3),
(12, 1, 3),
(13, 5, 1),
(14, 5, 3),
(15, 6, 8),
(16, 6, 5),
(17, 7, 7),
(18, 7, 3),
(19, 8, 2),
(20, 8, 3),
(21, 9, 1),
(22, 9, 3),
(23, 10, 3),
(24, 10, 1),
(25, 10, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hoja_vida`
--

CREATE TABLE IF NOT EXISTS `hoja_vida` (
  `pkID` int(11) NOT NULL,
  `nidentificacion` varchar(250) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `telefono` varchar(200) NOT NULL,
  `email` varchar(250) NOT NULL,
  `fkID_estado` int(11) NOT NULL,
  `fkID_usuario` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `hoja_vida`
--

INSERT INTO `hoja_vida` (`pkID`, `nidentificacion`, `nombre`, `apellido`, `telefono`, `email`, `fkID_estado`, `fkID_usuario`) VALUES
(1, '1024524163', 'Johan Sebastián', 'Morales', '3112343412', 'jhellmetal2000@gmail.com', 1, 1),
(2, '79790582', 'RICARDO', 'UMBARILA', '3158461448', 'rumbarila@lunel-ie.com', 1, 1),
(3, '67235424500', 'Carmen', 'Fernández', '3114561223', 'carmen@gmail.com', 3, 1),
(4, '1256234801', 'Andrés', 'Mojica', '3112641782', 'asdf@gmail.com', 2, 1),
(5, '1023567250', 'Juan', 'Pérez', '3213457823', 'laksdjfha@gmail.com', 3, 1),
(6, '1024534163', 'Juan', 'Garrido', '3114527830', 'jgarrido@gmail.com', 3, 1),
(8, '347652384752', 'Prueba de subida2', 'subida2', '2376423', 'ajksdfas@gmail.com', 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hv_proyecto`
--

CREATE TABLE IF NOT EXISTS `hv_proyecto` (
  `pkID` int(11) NOT NULL,
  `fkID_hv` int(11) NOT NULL,
  `fkID_proyecto` int(11) NOT NULL,
  `rol` varchar(250) DEFAULT NULL,
  `observaciones` text
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `hv_proyecto`
--

INSERT INTO `hv_proyecto` (`pkID`, `fkID_hv`, `fkID_proyecto`, `rol`, `observaciones`) VALUES
(1, 1, 10, 'edita rol', 'edita rol de prueba'),
(3, 3, 10, NULL, NULL),
(4, 5, 11, NULL, NULL),
(5, 5, 10, NULL, NULL),
(7, 2, 10, 'rol de prueba', 'rol de prueba'),
(8, 1, 12, 'Desarrollador', 'Desarrolla aplicaciones.'),
(9, 3, 13, 'Contadora', 'Una contadora para el proyecto.'),
(10, 6, 13, '', ''),
(11, 2, 14, '', ''),
(12, 6, 10, 'rol1', 'xxx');

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
-- Estructura de tabla para la tabla `pasos`
--

CREATE TABLE IF NOT EXISTS `pasos` (
  `pkID` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `actual` tinyint(1) NOT NULL,
  `pkID_proceso` int(11) NOT NULL,
  `idPaso1` int(11) DEFAULT NULL,
  `idPaso2` int(11) DEFAULT NULL,
  `pkID_usuario` int(11) NOT NULL,
  `pkID_usuario_asignado` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=179 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pasos`
--

INSERT INTO `pasos` (`pkID`, `fecha`, `actual`, `pkID_proceso`, `idPaso1`, `idPaso2`, `pkID_usuario`, `pkID_usuario_asignado`) VALUES
(1, '2016-03-22', 1, 5, 0, 1, 1, 1),
(2, '2016-03-23', 0, 6, 0, 1, 1, 1),
(11, '2016-03-23', 0, 6, 1, 2, 1, 1),
(12, '2016-03-23', 0, 6, 2, 2, 1, 1),
(13, '2016-03-23', 0, 6, 2, 3, 1, 1),
(14, '2016-03-23', 0, 6, 3, 3, 1, 1),
(15, '2016-03-23', 0, 6, 3, 4, 1, 1),
(16, '2016-04-06', 0, 7, 0, 1, 1, 1),
(24, '2016-04-06', 0, 7, 1, 1, 1, 1),
(25, '2016-04-06', 0, 7, 1, 1, 1, 1),
(26, '2016-04-06', 0, 7, 1, 2, 1, 1),
(27, '2016-04-06', 0, 7, 2, 3, 1, 1),
(28, '2016-04-06', 0, 7, 3, 2, 1, 1),
(29, '2016-04-07', 0, 6, 4, 3, 1, 1),
(30, '2016-04-07', 0, 6, 3, 4, 1, 1),
(31, '2016-04-07', 0, 6, 4, 1, 1, 1),
(32, '2016-04-07', 0, 6, 1, 4, 1, 1),
(33, '2016-04-07', 0, 6, 4, 1, 1, 1),
(34, '2016-04-07', 0, 6, 1, 3, 1, 1),
(35, '2016-04-07', 0, 6, 3, 4, 1, 1),
(36, '2016-04-07', 0, 6, 4, 3, 1, 1),
(37, '2016-04-07', 0, 6, 3, 4, 1, 1),
(38, '2016-04-07', 0, 7, 2, 4, 1, 2),
(39, '2016-04-07', 0, 6, 4, 2, 1, 1),
(40, '2016-04-07', 0, 6, 2, 4, 1, 2),
(41, '2016-04-07', 0, 6, 4, 3, 1, 1),
(42, '2016-04-08', 0, 7, 4, 2, 1, 1),
(43, '2016-04-08', 0, 7, 2, 4, 1, 2),
(44, '2016-04-11', 0, 8, 0, 1, 8, 8),
(45, '2016-04-11', 0, 8, 1, 4, 8, 1),
(46, '2016-04-13', 0, 6, 3, 4, 1, 4),
(47, '2016-04-13', 0, 6, 4, 3, 1, 1),
(48, '2016-04-13', 1, 6, 3, 4, 1, 4),
(49, '2016-04-13', 0, 7, 4, 1, 1, 1),
(50, '2016-04-13', 1, 7, 1, 4, 1, 3),
(51, '2016-04-13', 0, 8, 4, 3, 1, 1),
(52, '2016-04-13', 0, 8, 3, 4, 1, 10),
(53, '2016-04-13', 0, 9, 0, 1, 1, 1),
(54, '2016-04-13', 0, 9, 1, 4, 1, 5),
(55, '2016-04-13', 0, 8, 4, 1, 1, 1),
(56, '2016-04-13', 0, 9, 4, 1, 1, 1),
(57, '2016-04-18', 0, 10, 0, 1, 1, 1),
(58, '2016-04-18', 0, 11, 0, 1, 1, 1),
(59, '2016-04-18', 0, 10, 1, 2, 1, 1),
(60, '2016-04-18', 1, 10, 2, 3, 1, 1),
(61, '2016-04-18', 1, 11, 1, 3, 1, 1),
(62, '2016-04-18', 0, 12, 0, 1, 1, 1),
(63, '2016-04-18', 1, 12, 1, 2, 1, 1),
(64, '2016-04-18', 0, 13, 0, 1, 1, 1),
(65, '2016-04-20', 0, 14, 0, 1, 1, 1),
(66, '2016-04-26', 0, 15, 0, 1, 1, 1),
(67, '2016-05-12', 0, 16, 0, 1, 1, 1),
(68, '2016-05-12', 0, 16, 1, 2, 1, 1),
(69, '2016-05-12', 0, 16, 2, 4, 1, 4),
(70, '2016-05-12', 0, 15, 1, 2, 1, 1),
(71, '2016-05-12', 0, 8, 1, 2, 1, 1),
(72, '2016-05-12', 0, 8, 2, 1, 1, 1),
(73, '2016-05-12', 0, 8, 1, 2, 1, 1),
(74, '2016-05-12', 0, 9, 1, 2, 1, 1),
(75, '2016-05-12', 0, 13, 1, 2, 1, 1),
(76, '2016-05-12', 0, 13, 2, 1, 1, 1),
(77, '2016-05-12', 0, 13, 1, 2, 1, 1),
(78, '2016-05-12', 0, 13, 2, 1, 1, 1),
(79, '2016-05-12', 0, 13, 1, 2, 1, 1),
(80, '2016-05-12', 0, 14, 1, 2, 1, 1),
(81, '2016-05-12', 1, 16, 4, 2, 1, 1),
(82, '2016-05-12', 0, 9, 2, 1, 1, 1),
(83, '2016-05-12', 1, 9, 1, 2, 1, 1),
(84, '2016-05-12', 0, 17, 0, 1, 8, 8),
(85, '2016-05-12', 1, 17, 1, 2, 1, 1),
(86, '2016-05-12', 0, 13, 2, 1, 8, 8),
(87, '2016-05-12', 1, 13, 1, 2, 8, 8),
(88, '2016-05-12', 0, 15, 2, 1, 8, 8),
(89, '2016-05-12', 0, 15, 1, 2, 8, 8),
(90, '2016-05-12', 0, 15, 2, 1, 8, 8),
(91, '2016-05-12', 0, 15, 1, 2, 8, 8),
(92, '2016-05-12', 0, 15, 2, 4, 8, 1),
(93, '2016-05-12', 0, 15, 4, 1, 8, 1),
(94, '2016-05-12', 1, 15, 1, 2, 8, 1),
(95, '2016-05-12', 1, 18, 0, 1, 1, 1),
(96, '2016-05-12', 1, 19, 0, 1, 1, 1),
(97, '2016-05-12', 1, 20, 0, 1, 1, 1),
(98, '2016-05-12', 1, 21, 0, 1, 1, 1),
(99, '2016-05-14', 1, 22, 0, 1, 1, 1),
(100, '2016-05-14', 0, 23, 0, 1, 1, 1),
(101, '2016-05-14', 0, 24, 0, 1, 1, 1),
(102, '2016-05-14', 0, 25, 0, 1, 1, 1),
(103, '2016-05-14', 0, 25, 1, 2, 1, 1),
(104, '2016-05-14', 0, 26, 0, 1, 1, 1),
(105, '2016-05-14', 0, 26, 1, 4, 1, 8),
(106, '2016-05-14', 1, 24, 1, 4, 1, 8),
(107, '2016-05-14', 1, 23, 1, 4, 1, 3),
(108, '2016-05-14', 0, 26, 4, 1, 1, 1),
(109, '2016-05-14', 0, 26, 1, 4, 1, 8),
(110, '2016-05-14', 0, 26, 4, 2, 1, 1),
(111, '2016-05-14', 0, 26, 2, 4, 1, 3),
(112, '2016-05-14', 0, 26, 4, 2, 1, 1),
(113, '2016-05-16', 0, 8, 2, 4, 1, 8),
(114, '2016-05-16', 0, 8, 4, 3, 1, 1),
(115, '2016-05-16', 0, 8, 3, 4, 1, 8),
(116, '2016-05-16', 0, 26, 2, 4, 1, 10),
(117, '2016-05-16', 1, 25, 2, 4, 1, 8),
(118, '2016-05-16', 0, 26, 4, 1, 8, 8),
(119, '2016-05-16', 0, 26, 1, 4, 8, 1),
(120, '2016-05-16', 0, 26, 4, 1, 8, 1),
(121, '2016-05-16', 0, 26, 1, 3, 8, 8),
(122, '2016-05-16', 1, 26, 3, 4, 8, 1),
(123, '2016-05-16', 0, 27, 0, 1, 1, 1),
(124, '2016-05-16', 0, 27, 1, 4, 1, 8),
(125, '2016-05-16', 1, 27, 4, 2, 1, 1),
(126, '2016-05-16', 0, 28, 0, 1, 1, 1),
(127, '2016-05-16', 0, 28, 1, 4, 1, 8),
(128, '2016-05-16', 0, 28, 4, 2, 1, 1),
(129, '2016-05-16', 0, 28, 2, 3, 1, 1),
(130, '2016-05-16', 1, 28, 3, 4, 1, 8),
(131, '2016-05-16', 0, 29, 0, 1, 1, 1),
(132, '2016-05-16', 0, 30, 0, 1, 1, 1),
(133, '2016-05-16', 0, 29, 1, 2, 1, 1),
(134, '2016-05-16', 0, 30, 1, 4, 1, 1),
(135, '2016-05-16', 0, 29, 2, 4, 1, 8),
(136, '2016-05-16', 0, 29, 4, 2, 1, 8),
(137, '2016-05-16', 0, 29, 2, 4, 1, 10),
(138, '2016-05-16', 0, 29, 4, 2, 1, 10),
(139, '2016-05-17', 0, 31, 0, 1, 1, 1),
(140, '2016-05-17', 0, 31, 1, 4, 1, 8),
(141, '2016-05-17', 1, 31, 4, 2, 1, 8),
(142, '2016-05-19', 0, 32, 0, 1, 1, 1),
(143, '2016-05-19', 0, 32, 1, 4, 1, 3),
(144, '2016-05-19', 1, 32, 4, 2, 1, 3),
(145, '2016-05-19', 0, 33, 0, 1, 1, 1),
(146, '2016-05-19', 1, 34, 0, 1, 1, 1),
(147, '2016-05-19', 0, 35, 0, 1, 1, 1),
(148, '2016-05-19', 0, 35, 1, 4, 1, 3),
(149, '2016-05-19', 0, 35, 4, 1, 1, 3),
(150, '2016-05-19', 0, 35, 1, 4, 1, 8),
(151, '2016-05-19', 0, 35, 4, 1, 1, 8),
(152, '2016-05-19', 0, 35, 1, 2, 1, 8),
(153, '2016-05-19', 0, 35, 2, 1, 1, 8),
(154, '2016-05-26', 0, 36, 0, 1, 1, 1),
(155, '2016-05-26', 0, 35, 1, 1, 1, 8),
(156, '2016-05-26', 0, 35, 1, 2, 1, 8),
(157, '2016-05-26', 0, 35, 2, 4, 1, 10),
(158, '2016-05-26', 1, 35, 4, 2, 1, 10),
(159, '2016-05-26', 0, 33, 1, 2, 1, 1),
(160, '2016-05-26', 1, 8, 4, 1, 1, 8),
(161, '2016-05-26', 0, 30, 4, 4, 1, 8),
(162, '2016-05-26', 1, 30, 4, 4, 1, 3),
(163, '2016-05-26', 0, 14, 2, 4, 1, 8),
(164, '2016-05-26', 0, 14, 4, 4, 1, 3),
(165, '2016-05-26', 1, 14, 4, 4, 1, 8),
(166, '2016-05-26', 1, 29, 2, 4, 1, 8),
(167, '2016-05-26', 0, 36, 1, 2, 1, 1),
(168, '2016-05-26', 0, 36, 2, 4, 1, 8),
(169, '2016-05-26', 1, 36, 4, 3, 1, 8),
(170, '2016-05-27', 0, 33, 2, 4, 1, 8),
(171, '2016-05-27', 0, 33, 4, 3, 1, 8),
(172, '2016-05-27', 1, 33, 3, 4, 1, 3),
(173, '2016-05-27', 0, 37, 0, 1, 1, 1),
(174, '2016-05-27', 0, 37, 1, 2, 1, 1),
(175, '2016-05-27', 0, 37, 2, 4, 1, 8),
(176, '2016-05-27', 0, 37, 4, 4, 1, 10),
(177, '2016-05-27', 0, 37, 4, 1, 1, 10),
(178, '2016-05-27', 1, 37, 1, 2, 1, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pasos_proceso`
--

CREATE TABLE IF NOT EXISTS `pasos_proceso` (
  `pkID` int(11) NOT NULL,
  `nombre` varchar(250) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pasos_proceso`
--

INSERT INTO `pasos_proceso` (`pkID`, `nombre`) VALUES
(1, 'creado'),
(2, 'aprobado'),
(3, 'desaprobado'),
(4, 'asignado');

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
-- Estructura de tabla para la tabla `procesos`
--

CREATE TABLE IF NOT EXISTS `procesos` (
  `pkID` int(11) NOT NULL,
  `fecha_cierre` date NOT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `objeto` text NOT NULL,
  `experiencia` text NOT NULL,
  `cuantia` bigint(11) NOT NULL,
  `personal` text NOT NULL,
  `indicadores` text NOT NULL,
  `url_propuesta` varchar(250) NOT NULL,
  `fkID_entidad` int(11) NOT NULL,
  `fkID_estado` int(11) NOT NULL,
  `fkID_paso_actual` int(11) NOT NULL,
  `fkID_tipo` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `procesos`
--

INSERT INTO `procesos` (`pkID`, `fecha_cierre`, `fecha_creacion`, `objeto`, `experiencia`, `cuantia`, `personal`, `indicadores`, `url_propuesta`, `fkID_entidad`, `fkID_estado`, `fkID_paso_actual`, `fkID_tipo`) VALUES
(6, '2016-03-24', NULL, 'prueba paso actual', 'prueba paso actual', 111111222, 'prueba paso actual', 'prueba paso actual', 'FICHA TECNICA PROPUESTA PROYECTOjohan.docx', 1, 1, 4, 3),
(8, '2016-04-23', NULL, 'contratar un dba', '5 años', 60000000, 'si', 'indicador x', 'ZAAYTZWIIMAY_2015-08X.pdf', 4, 1, 1, 3),
(14, '2016-04-28', NULL, 'Otro objeto de prueba de proceso.', '4 años y medio', 23000000, 'Se necesita personal de sistemas o afines.', 'Más indicadores de prueba de procesos.', 'ELEC._TECNOLOGIAS_ORIENTADOS_A_OBJETOS.pdf', 4, 1, 4, 3),
(18, '2016-05-20', NULL, 'prueba de envio de correo solicitud de aprobacion.', 'prueba de envio de correo solicitud de aprobacion.', 25000000, 'prueba de envio de correo solicitud de aprobacion.', 'prueba de envio de correo solicitud de aprobacion.', 'http://php.net/manual/es/function.mail.php', 17, 1, 1, 3),
(29, '2016-07-22', NULL, 'proceso de prueba asignacion 12', 'proceso de prueba asignacion 12', 400000000, 'proceso de prueba asignacion 12', 'proceso de prueba asignacion 12', 'http://getbootstrap.com/javascript/#tabs', 15, 1, 4, 1),
(30, '2016-07-20', NULL, 'Creación de proceso de pruebas 23', 'Creación de proceso de pruebas 23', 30000000, 'Creación de proceso de pruebas 23', 'Creación de proceso de pruebas 23', 'http://getbootstrap.com/javascript/#tabs', 15, 1, 4, 1),
(31, '2016-05-24', NULL, 'Prueba unitaria procesos', 'Prueba unitaria procesos', 23000000000, 'Prueba unitaria procesos', 'Prueba unitaria procesos', 'https://www.google.com.co/search?q=espacios+en+blanco+html&oq=espacios+en+blanco+&aqs=chrome.1.69i57j0l5.6924j0j7&sourceid=chrome&ie=UTF-8', 6, 1, 2, 3),
(32, '2016-05-26', NULL, 'Prueba Proceso_001', 'Prueba Proceso_001', 20000000000, 'Prueba Proceso_001', 'Prueba Proceso_001', 'http://getbootstrap.com/css/#grid', 7, 1, 2, 3),
(33, '2016-06-17', NULL, 'CONTRATAR LA CONSULTORÍA PARA LA TOMA DE INFORMACIÓN, DIGITACIÓN, PROCESAMIENTO Y DETERMINACIÓN DE DEMANDA INSATISFECHA DE LOS SERVICIOS PÚBLICOS DE TRANSPORTE TERRESTRE AUTOMOTOR DE PASAJEROS POR CARRETERA Y MIXTO', 'El proponente deberá acreditar experiencia específica en una o varias de las siguientes áreas para\r\nobtener puntaje:\r\n1) Consultoría de transporte terrestre por carretera\r\n2) Toma, levantamiento, digitación y/o análisis de información primaria para estudios de transporte\r\nterrestre por carretera\r\n3) Elaboración de matrices origen destino de transporte terrestre por carretera\r\n4) Elaboración de estudios de demanda insatisfecha de transporte terrestre por carretera\r\n5) Estudios de transporte terrestre mixto y/o de pasajeros.\r\n6) Elaboración de Estudios de demanda de transporte terrestre.\r\n7) Interventoría a la toma, levantamiento, digitación y/o análisis de información primaria para\r\nestudios de transporte', 340849812, 'Director de la Consultoría: Ingeniero Civil o de Transportes y vías o profesional en ciencias económicas o administrativas con especialización en Transporte.\r\n\r\nHaber participado o realizado estudios de oferta y/o demanda en el transporte público terrestre de pasajeros y/o de consultorías en planeación de transporte terrestre de pasajeros, que se acredite en un término no inferior a cuatro (4) años.\r\n\r\nEspecialista en el área de Transporte: Ingeniero Civil o de Transportes y vías o\r\nprofesional en ciencias económicas o administrativas con especialización en Transporte. \r\n\r\nHaber participado o realizado estudios de oferta y/o demanda en el transporte público terrestre de pasajeros y/o de consultorías en planeación de transporte terrestre de pasajeros, que se acredite en un término no inferior a tres 3) años.\r\n\r\nIngeniero de Apoyo: Ingeniero Civil o de Transportes y vías o profesional en iencias\r\neconómicas o administrativas con especialización en Transporte\r\n\r\nHaber participado o realizado estudios de oferta y/o demanda en el transporte público terrestre de pasajeros y/o de consultorías en planeación de transporte terrestre de pasajeros, que se acredite en un término no menor a un (1) año.\r\n\r\n\r\n\r\n\r\n', 'Liquidez : MAYOR O IGUAL A 1,0\r\n\r\nEndeudamiento : MENOR O IGUAL A 70,99%\r\n\r\nRazón de Cobertura de Intereses: MAYOR O IGUAL A 1,7', 'https://www.contratos.gov.co/consultas/detalleProceso.do?numConstancia=16-15-5054475', 18, 1, 4, 4),
(34, '2016-05-26', NULL, 'prueba', 'prueba', 10, 'prueba', 'prueba', 'https://www.contratos.gov.co/consultas/resultadoListadoProcesos.jsp#', 13, 1, 1, 1),
(35, '2016-06-30', NULL, 'Adquisicion de software de subasta electronica', 'Haber realiado como minimo 10 subastas', 1450000000, 'Coordinador de subastas', 'capital de trabajo > resupuesto', 'http://www.colombiacompra.gov.co/proveedores/proveedor', 19, 1, 2, 1),
(36, '2016-05-27', '2016-05-26', 'Prueba de fecha de creacion', 'Prueba de fecha de creacion', 23000000, 'Prueba de fecha de creacion', 'Prueba de fecha de creacion', 'http://getbootstrap.com/css/#forms', 17, 1, 3, 1),
(37, '2016-05-31', '2016-05-27', 'Una prueba de correos.', 'Una prueba de correos.', 20000000000, 'Una prueba de correos.', 'Una prueba de correos.', 'https://www.smartapp.com/ctx46db8bfbab224dee85c750ab24f3e313/m_ic_fc/AppZoneCentral/GantterFC?ctp=%7B%22ct%22%3A%22gta%22%2C%22ssp%22%3Afalse%2C%22vs%22%3Atrue%7D', 6, 1, 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyectos`
--

CREATE TABLE IF NOT EXISTS `proyectos` (
  `pkID` int(11) NOT NULL,
  `nombre` varchar(250) DEFAULT NULL,
  `fechaIni` date NOT NULL,
  `fechaFin` date NOT NULL,
  `objeto` text NOT NULL,
  `cuantia` bigint(11) NOT NULL,
  `fkID_entidad` int(11) NOT NULL,
  `fkID_estado` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proyectos`
--

INSERT INTO `proyectos` (`pkID`, `nombre`, `fechaIni`, `fechaFin`, `objeto`, `cuantia`, `fkID_entidad`, `fkID_estado`) VALUES
(4, 'Software para entidad 1', '2016-01-21', '2016-02-27', 'qwerty.', 25000000, 4, 1),
(5, 'Outsourcing de Ingenieria', '2016-01-01', '2016-09-30', 'contratar gente ', 350000000, 1, 1),
(6, 'proyecto firefox', '2016-05-17', '2016-05-27', 'Probar firefox', 25000000, 5, 1),
(8, 'Outsourcing IDEAM', '2015-12-22', '2016-10-14', 'Outsourcing IDEAM', 1000000000, 6, 2),
(9, 'Prueba mascara', '2016-05-06', '2016-05-26', 'Proyecto para probar una mascara.', 34000000, 13, 1),
(10, 'Nueva prueba mascara', '2016-05-04', '2016-05-04', 'Nueva prueba para la mascara de entrada de cuantía.', 23456123, 12, 1),
(11, 'Prueba tree proyecto', '2016-05-05', '2016-05-14', 'Una prueba para el tree', 20000000, 7, 1),
(12, 'Proyecto outsourcing 1', '2016-05-31', '2016-07-15', 'Proyecto outsourcing 1', 25000000, 5, 1),
(13, 'Prueba Proyecto_004', '2016-05-20', '2016-05-26', 'Prueba Proyecto_004', 3000000000, 17, 1),
(14, 'Telebucaramanga - IDEAM', '2015-12-11', '2016-12-10', 'Prestar los servicios de soporte, administración, y operación de la plataforma tecnológica, base de datos, networking, seguridad y continuidad; incluyendo herramientas de gestión, enmarcadas en la implementación y ejecución de procesos bajo la metodología ITIL, de acuerdo a las especificaciones técnicas y anexos que hacen parte integral del presente contrato. ', 150000000, 6, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_documento`
--

CREATE TABLE IF NOT EXISTS `tipo_documento` (
  `pkID` int(11) NOT NULL,
  `nombre_tdoc` varchar(250) NOT NULL,
  `fkID_padre` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_documento`
--

INSERT INTO `tipo_documento` (`pkID`, `nombre_tdoc`, `fkID_padre`) VALUES
(1, 'Jurídico', NULL),
(2, 'Técnico', NULL),
(3, 'Financiero', NULL),
(4, 'Social', NULL),
(5, 'De análisis', NULL),
(6, 'Tipo Documento prueba1', NULL),
(7, 'Tipo Documento prueba2', NULL),
(8, 'Tipo de documento prueba 3', NULL),
(9, 'contractuales', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_documento_proceso`
--

CREATE TABLE IF NOT EXISTS `tipo_documento_proceso` (
  `pkID` int(11) NOT NULL,
  `nombre_tdoc` varchar(250) NOT NULL,
  `fkID_padre` varchar(250) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_documento_proceso`
--

INSERT INTO `tipo_documento_proceso` (`pkID`, `nombre_tdoc`, `fkID_padre`) VALUES
(1, 'tipo1', NULL),
(2, 'tipo2', NULL),
(3, 'prueba tipo doc proceso 6', NULL),
(4, 'Pliegos', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_estudio`
--

CREATE TABLE IF NOT EXISTS `tipo_estudio` (
  `pkID` int(11) NOT NULL,
  `nombre` varchar(250) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_estudio`
--

INSERT INTO `tipo_estudio` (`pkID`, `nombre`) VALUES
(1, 'Pregrado'),
(3, 'Especialización'),
(4, 'Maestría'),
(5, 'Doctorado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_proceso`
--

CREATE TABLE IF NOT EXISTS `tipo_proceso` (
  `pkID` int(11) NOT NULL,
  `nombre` varchar(250) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_proceso`
--

INSERT INTO `tipo_proceso` (`pkID`, `nombre`) VALUES
(1, 'Contratación Directa'),
(2, 'Selección Abreviada'),
(3, 'Licitación Pública'),
(4, 'Concurso de Méritos'),
(5, 'Mínima Cuantía');

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
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`pkID`);

--
-- Indices de la tabla `documentos`
--
ALTER TABLE `documentos`
  ADD PRIMARY KEY (`pkID`),
  ADD KEY `fkID_tipo` (`fkID_tipo`),
  ADD KEY `fkID_proyecto` (`fkID_proyecto`);

--
-- Indices de la tabla `documentos_proceso`
--
ALTER TABLE `documentos_proceso`
  ADD PRIMARY KEY (`pkID`);

--
-- Indices de la tabla `entidades`
--
ALTER TABLE `entidades`
  ADD PRIMARY KEY (`pkID`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`pkID`);

--
-- Indices de la tabla `estado_proceso`
--
ALTER TABLE `estado_proceso`
  ADD PRIMARY KEY (`pkID`);

--
-- Indices de la tabla `estado_proyecto`
--
ALTER TABLE `estado_proyecto`
  ADD PRIMARY KEY (`pkID`);

--
-- Indices de la tabla `estudio`
--
ALTER TABLE `estudio`
  ADD PRIMARY KEY (`pkID`),
  ADD KEY `fkID_tipoEstudio` (`fkID_tipoEstudio`);

--
-- Indices de la tabla `formato`
--
ALTER TABLE `formato`
  ADD PRIMARY KEY (`pkID`);

--
-- Indices de la tabla `gastos`
--
ALTER TABLE `gastos`
  ADD PRIMARY KEY (`pkID`),
  ADD KEY `fkID_proyecto` (`fkID_proyecto`);

--
-- Indices de la tabla `hoja_estudio`
--
ALTER TABLE `hoja_estudio`
  ADD PRIMARY KEY (`pkID`),
  ADD KEY `pkID_hojaVida` (`pkID_hojaVida`),
  ADD KEY `pkID_estudio` (`pkID_estudio`);

--
-- Indices de la tabla `hoja_vida`
--
ALTER TABLE `hoja_vida`
  ADD PRIMARY KEY (`pkID`),
  ADD KEY `fkID_estado` (`fkID_estado`),
  ADD KEY `fkID_usuario` (`fkID_usuario`);

--
-- Indices de la tabla `hv_proyecto`
--
ALTER TABLE `hv_proyecto`
  ADD PRIMARY KEY (`pkID`);

--
-- Indices de la tabla `modulos`
--
ALTER TABLE `modulos`
  ADD PRIMARY KEY (`pkID`);

--
-- Indices de la tabla `pasos`
--
ALTER TABLE `pasos`
  ADD PRIMARY KEY (`pkID`);

--
-- Indices de la tabla `pasos_proceso`
--
ALTER TABLE `pasos_proceso`
  ADD PRIMARY KEY (`pkID`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`pkID`);

--
-- Indices de la tabla `procesos`
--
ALTER TABLE `procesos`
  ADD PRIMARY KEY (`pkID`),
  ADD KEY `fkID_entidad` (`fkID_entidad`),
  ADD KEY `fkID_estado` (`fkID_estado`),
  ADD KEY `fkID_paso_actual` (`fkID_paso_actual`),
  ADD KEY `fkID_tipo` (`fkID_tipo`);

--
-- Indices de la tabla `proyectos`
--
ALTER TABLE `proyectos`
  ADD PRIMARY KEY (`pkID`);

--
-- Indices de la tabla `tipo_documento`
--
ALTER TABLE `tipo_documento`
  ADD PRIMARY KEY (`pkID`),
  ADD KEY `fkID_padre` (`fkID_padre`);

--
-- Indices de la tabla `tipo_documento_proceso`
--
ALTER TABLE `tipo_documento_proceso`
  ADD PRIMARY KEY (`pkID`);

--
-- Indices de la tabla `tipo_estudio`
--
ALTER TABLE `tipo_estudio`
  ADD PRIMARY KEY (`pkID`);

--
-- Indices de la tabla `tipo_proceso`
--
ALTER TABLE `tipo_proceso`
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
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `pkID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT de la tabla `documentos`
--
ALTER TABLE `documentos`
  MODIFY `pkID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT de la tabla `documentos_proceso`
--
ALTER TABLE `documentos_proceso`
  MODIFY `pkID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `entidades`
--
ALTER TABLE `entidades`
  MODIFY `pkID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `pkID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `estado_proceso`
--
ALTER TABLE `estado_proceso`
  MODIFY `pkID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `estado_proyecto`
--
ALTER TABLE `estado_proyecto`
  MODIFY `pkID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `estudio`
--
ALTER TABLE `estudio`
  MODIFY `pkID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT de la tabla `formato`
--
ALTER TABLE `formato`
  MODIFY `pkID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT de la tabla `gastos`
--
ALTER TABLE `gastos`
  MODIFY `pkID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT de la tabla `hoja_estudio`
--
ALTER TABLE `hoja_estudio`
  MODIFY `pkID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT de la tabla `hoja_vida`
--
ALTER TABLE `hoja_vida`
  MODIFY `pkID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `hv_proyecto`
--
ALTER TABLE `hv_proyecto`
  MODIFY `pkID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de la tabla `modulos`
--
ALTER TABLE `modulos`
  MODIFY `pkID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT de la tabla `pasos`
--
ALTER TABLE `pasos`
  MODIFY `pkID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=179;
--
-- AUTO_INCREMENT de la tabla `pasos_proceso`
--
ALTER TABLE `pasos_proceso`
  MODIFY `pkID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `pkID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT de la tabla `procesos`
--
ALTER TABLE `procesos`
  MODIFY `pkID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT de la tabla `proyectos`
--
ALTER TABLE `proyectos`
  MODIFY `pkID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT de la tabla `tipo_documento`
--
ALTER TABLE `tipo_documento`
  MODIFY `pkID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `tipo_documento_proceso`
--
ALTER TABLE `tipo_documento_proceso`
  MODIFY `pkID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `tipo_estudio`
--
ALTER TABLE `tipo_estudio`
  MODIFY `pkID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `tipo_proceso`
--
ALTER TABLE `tipo_proceso`
  MODIFY `pkID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
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
