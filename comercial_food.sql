-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-03-2024 a las 16:05:34
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
-- Base de datos: `comercial_food`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo`
--

CREATE TABLE `cargo` (
  `cod_cargo` int(11) NOT NULL,
  `nombre_cargo` varchar(25) NOT NULL,
  `salario` decimal(10,0) NOT NULL CHECK (`salario` >= 900000)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cargo`
--

INSERT INTO `cargo` (`cod_cargo`, `nombre_cargo`, `salario`) VALUES
(1, 'Administrador', 2200000),
(2, 'Vendedor', 1800000),
(3, 'Contador', 2500000),
(4, 'Facturador', 1200000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `cod_categoria` int(11) NOT NULL,
  `nombre_categoria` varchar(50) NOT NULL,
  `observaciones` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`cod_categoria`, `nombre_categoria`, `observaciones`) VALUES
(1, 'Lacteos', 'leche, yogurt y queso'),
(2, 'Panaderia', 'panes y repostería'),
(3, 'Galleteria', 'galletas saladas y dulces'),
(4, 'Golosinas', 'Chupetas, caramelos y bom'),
(5, 'Salsas', 'salsa de tomate y aderezo'),
(6, 'Refrescos', 'Bebidas gaseosas y jugos'),
(7, 'Carnes Frías', 'Salchichas , mortadelas y');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `cod_cliente` int(11) NOT NULL,
  `nombre1` varchar(25) NOT NULL,
  `nombre2` varchar(25) NOT NULL,
  `apellido1` varchar(25) NOT NULL,
  `apellido2` varchar(25) NOT NULL,
  `tipo_documento` enum('cc','ce','nit','rut') DEFAULT NULL,
  `no_documento` varchar(25) NOT NULL,
  `sexo` enum('masculino','femenino') DEFAULT NULL,
  `direccion` varchar(50) NOT NULL,
  `ciudad` enum('bogota','barranquilla','medellin','cali') DEFAULT NULL,
  `telefono` varchar(25) NOT NULL,
  `estado_civil` enum('soltero','casado','divorciado','union libre','viudo') DEFAULT NULL,
  `tipo_cliente` enum('detallista','mayorista','empresarial') DEFAULT NULL,
  `empleado_cod` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`cod_cliente`, `nombre1`, `nombre2`, `apellido1`, `apellido2`, `tipo_documento`, `no_documento`, `sexo`, `direccion`, `ciudad`, `telefono`, `estado_civil`, `tipo_cliente`, `empleado_cod`) VALUES
(1, 'Mario', 'Alexis', 'Aroca', 'Martínez', 'cc', '1122239857', 'masculino', 'CALLE 40 SUR #96-16', 'bogota', '3158097309', 'soltero', 'mayorista', 3),
(2, 'Jerónimo', '', 'burgos', 'diez', 'cc', '10000459', 'masculino', 'CRA 98 # 58-90', 'bogota', '9015872', 'soltero', '', 3),
(3, 'Estefanía', 'Tatiana', 'Villegas', 'sierra', 'cc', '1023581203', 'masculino', 'TRV 110 #81-40', 'bogota', '6047599', 'casado', 'mayorista', 4),
(4, 'Guillermo', 'Mauricio', 'Fernandez', 'Vallejo', 'cc', '125692614', 'masculino', 'CALLE 75 #23SUR-40', 'barranquilla', '7057522', 'soltero', 'mayorista', 4),
(5, 'Eliana', 'Marcela', 'Ramírez', 'Guerrero', 'nit', '1222333445', 'masculino', 'Calle 181 #2-45 ', 'barranquilla', '8019053', 'viudo', 'mayorista', 5),
(6, 'José', 'Gregorio', 'Carmona', 'Guerra', 'cc', '1091562345', 'masculino', 'Cra 3 A # 5-89', 'barranquilla', '3134409180', 'casado', 'detallista', 5),
(7, 'Marcela', 'Eliana', 'De santis', 'Rodríguez', 'cc', '1091562348', 'femenino', 'calle 9b # 4-20', 'cali', '3108156310', 'union libre', 'mayorista', 6),
(8, 'Daniela', '', 'Franco', 'Marulanda', 'cc', '1091562312', 'femenino', 'Carrera 56A No. 51 - 81', 'cali', '3212598228', 'union libre', 'mayorista', 6),
(9, 'Rafael', 'Fabian', 'Cortes', 'Palacio', 'cc', '1091562336', 'masculino', 'Calle 10 No. 9 - 78 Centro', 'medellin', '7586412', 'soltero', 'mayorista', 7),
(10, 'Camilo', 'Andres', 'Berrios', 'Bermudez', 'cc', '1091562314', 'masculino', 'Calle 24D #5676', 'medellin', '4341235', 'casado', 'mayorista', 7),
(11, 'Francisco', 'David', 'Arias', 'Toledo', 'cc', '1091562349', 'masculino', 'calle 5b #78c 05', 'bogota', '6018954', 'casado', 'empresarial', 8),
(12, 'Antonio', 'Giovanny', 'Merizalde', 'Arango', 'cc', '1091562103', 'masculino', 'Calle 23 #54-9', 'barranquilla', '3165846257', 'viudo', 'mayorista', 8),
(13, 'Karen', 'Rocio', 'Restrepo', 'Acevedo', 'cc', '1091562425', 'femenino', 'cra 7a # 34-89sur', 'barranquilla', '8017936', 'viudo', 'detallista', 9),
(14, 'David', 'Santiago', 'Lemus', 'Cock', 'nit', '1112239564', 'masculino', 'cr 5a #20-34 sur', 'bogota', '3412658975', 'soltero', 'mayorista', 9),
(15, 'Javier', 'Mauricio', 'Santana', 'Casadiegos', 'cc', '1233669874', 'masculino', 'CALLE 27 #58-63', 'cali', '315648301', 'casado', 'mayorista', 10),
(16, 'Virginia', '', 'Saldarriaga', 'Salamanca', 'cc', '1556998745', 'femenino', 'cll 36 3 1-81 este', 'medellin', '4518992', 'casado', 'detallista', 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contratista`
--

CREATE TABLE `contratista` (
  `cod_contratista` int(11) NOT NULL,
  `nombre1` varchar(25) NOT NULL,
  `nombre2` varchar(25) NOT NULL,
  `apellido1` varchar(25) NOT NULL,
  `apellido2` varchar(25) NOT NULL,
  `tipo_documento` enum('cc','ce','nit','rut') DEFAULT NULL,
  `no_documento` varchar(25) NOT NULL,
  `sexo` enum('masculino','femenino') DEFAULT NULL,
  `direccion` varchar(50) NOT NULL,
  `telefono` varchar(25) NOT NULL,
  `camion` enum('camioneta','furgon','camion') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `contratista`
--

INSERT INTO `contratista` (`cod_contratista`, `nombre1`, `nombre2`, `apellido1`, `apellido2`, `tipo_documento`, `no_documento`, `sexo`, `direccion`, `telefono`, `camion`) VALUES
(1, 'Alberto', 'Alexis', 'Santos', 'Martínez', 'cc', '1122239867', 'masculino', 'CALLE 40 SUR #96-16', '3158097309', 'furgon'),
(2, 'Claudio', 'Luis', 'Berrio', 'Diem', 'cc', '10000457', 'masculino', 'CRA 98 # 58-90', '9015872', 'camion'),
(3, 'Sandra', 'Tatiana', 'Viloria', 'Sierra', 'cc', '1023581203', 'femenino', 'TRV 110 #81-40', '6047599', 'furgon'),
(4, 'Gustavo', 'Mauricio', 'Ferrer', 'Vallejo', 'cc', '125692614', 'masculino', 'CALLE 75 #23SUR-40', '7057522', 'camion'),
(5, 'Diana', 'Marcela', 'Ramírez', 'Guerrero', 'nit', '1222333445', 'femenino', 'Calle 181 #2-45 ', '8019053', 'furgon'),
(6, 'Jose', 'Carlos', 'Calle', 'Guerra', 'cc', '1091562345', 'masculino', 'Cra 3A # 5-89', '3134409180', 'camion'),
(7, 'Marcela', 'Sofia', 'Castro', 'Rodríguez', 'cc', '1091562348', 'femenino', 'calle 9b # 4-20', '3108156310', 'furgon');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `despachos`
--

CREATE TABLE `despachos` (
  `cod_despacho` int(11) NOT NULL,
  `contratista_cod` int(11) NOT NULL,
  `factura_cod` int(11) NOT NULL,
  `fecha_recibo` date NOT NULL,
  `fecha_entrega` date NOT NULL DEFAULT (`fecha_recibo` + interval 2 day),
  `valor_flete` decimal(10,0) NOT NULL DEFAULT 0,
  `entregado` varchar(4) NOT NULL,
  `observaciones` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `despachos`
--

INSERT INTO `despachos` (`cod_despacho`, `contratista_cod`, `factura_cod`, `fecha_recibo`, `fecha_entrega`, `valor_flete`, `entregado`, `observaciones`) VALUES
(1, 1, 1, '2023-08-06', '2023-08-09', 200000, 's', 'Completo'),
(2, 1, 2, '2023-08-06', '2023-08-09', 200000, 's', 'Completo'),
(3, 2, 3, '2023-08-06', '2023-08-07', 300000, 's', 'Completo'),
(4, 2, 4, '2023-08-06', '2023-08-07', 300000, 's', 'Completo'),
(5, 3, 5, '2023-08-06', '2023-08-07', 300000, 's', 'Completo'),
(6, 3, 6, '2023-08-06', '2023-08-07', 300000, 's', 'Completo'),
(7, 4, 7, '2023-08-06', '2023-08-10', 100000, 's', 'Completo'),
(8, 3, 8, '2023-08-07', '2023-08-09', 340000, 's', 'Completo'),
(9, 4, 9, '2023-08-07', '2023-08-09', 250000, 's', 'Completo'),
(10, 5, 10, '2023-08-07', '2023-08-09', 270000, 's', 'Completo'),
(11, 6, 11, '2023-08-08', '2023-08-10', 320000, 's', 'Completo'),
(12, 7, 12, '2023-08-08', '2023-08-10', 220000, 's', 'Completo'),
(13, 1, 13, '2023-08-09', '2023-08-11', 350000, 's', 'Completo'),
(14, 2, 14, '2023-08-09', '2023-08-11', 280000, 's', 'Completo'),
(15, 3, 15, '2023-08-10', '2023-08-12', 330000, 's', 'Completo'),
(16, 4, 16, '2023-08-10', '2023-08-12', 265000, 's', 'Completo'),
(17, 5, 17, '2023-08-10', '2023-08-12', 320000, 's', 'Completo'),
(18, 6, 18, '2023-08-10', '2023-08-12', 280000, 's', 'Completo'),
(19, 7, 19, '2023-08-10', '2023-08-12', 260000, 's', 'Completo'),
(20, 1, 20, '2023-08-10', '2023-08-12', 370000, 's', 'Completo'),
(21, 2, 21, '2023-08-11', '2023-08-13', 230000, 's', 'Completo'),
(22, 3, 22, '2023-08-11', '2023-08-13', 240000, 's', 'Completo'),
(23, 4, 23, '2023-08-11', '2023-08-13', 270000, 's', 'Completo'),
(24, 5, 24, '2023-08-11', '2023-08-13', 240000, 's', 'Completo'),
(25, 6, 25, '2023-08-12', '2023-08-14', 250000, 's', 'Completo'),
(26, 7, 26, '2023-08-12', '2023-08-14', 260000, 's', 'Completo'),
(27, 1, 21, '2023-08-13', '2023-08-15', 320000, 's', 'Completo'),
(28, 2, 22, '2023-08-13', '2023-08-15', 300000, 's', 'Completo'),
(29, 3, 23, '2023-08-13', '2023-08-15', 310000, 's', 'Completo'),
(30, 4, 24, '2023-08-13', '2023-08-15', 310000, 's', 'Completo'),
(31, 5, 25, '2023-08-13', '2023-08-15', 230000, 's', 'Completo'),
(32, 6, 26, '2023-08-14', '2023-08-16', 250000, 's', 'Completo'),
(33, 7, 27, '2023-08-14', '2023-08-16', 260000, 's', 'Completo'),
(34, 1, 28, '2023-08-14', '2023-08-16', 270000, 's', 'Completo'),
(35, 2, 29, '2023-08-15', '2023-08-17', 290000, 's', 'Completo'),
(36, 3, 30, '2023-08-15', '2023-08-17', 300000, 's', 'Completo'),
(37, 4, 31, '2023-08-15', '2023-08-17', 320000, 's', 'Completo'),
(38, 5, 32, '2023-08-15', '2023-08-17', 280000, 's', 'Completo'),
(39, 6, 33, '2023-08-15', '2023-08-17', 350000, 's', 'Completo'),
(40, 7, 34, '2023-08-15', '2023-08-17', 260000, 's', 'Completo'),
(41, 1, 35, '2023-08-15', '2023-08-17', 320000, 's', 'Completo'),
(42, 2, 36, '2023-08-16', '2023-08-18', 350000, 's', 'Completo'),
(43, 3, 37, '2023-08-16', '2023-08-18', 400000, 's', 'Completo'),
(44, 4, 38, '2023-08-16', '2023-08-18', 350000, 's', 'Completo'),
(45, 5, 39, '2023-08-16', '2023-08-18', 320000, 's', 'Completo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `cod_empleado` int(11) NOT NULL,
  `nombre1` varchar(25) NOT NULL,
  `nombre2` varchar(25) NOT NULL,
  `apellido1` varchar(25) NOT NULL,
  `apellido2` varchar(25) NOT NULL,
  `tipo_documento` enum('cc','ce','nit','rut') DEFAULT NULL,
  `no_documento` varchar(25) NOT NULL,
  `sexo` enum('masculino','femenino') DEFAULT NULL,
  `direccion` varchar(50) NOT NULL,
  `ciudad` varchar(20) NOT NULL,
  `edad` int(11) NOT NULL CHECK (`edad` >= 18),
  `telefono` varchar(25) NOT NULL,
  `fecha_ingreso` date DEFAULT curdate(),
  `estado_civil` enum('soltero(a)','casado(a)','divorciado(a)','union libre','viudo(a)') DEFAULT NULL,
  `cargo_cod` int(11) NOT NULL,
  `nivel_estudios` enum('primaria','bachillerato','tecnico','tecnologo','profesional','otro') DEFAULT NULL,
  `eps` enum('sanitas','sura','capital salud','nueva eps','compensar','famisanar','aliansalud') DEFAULT NULL,
  `pensiones` enum('colfondos','proteccion','porvenir','skandia') DEFAULT NULL,
  `cesantias` enum('fna','porvenir','colfondos','proteccion') DEFAULT NULL,
  `banco` enum('bbva','davivienda','bancolombia','caja social','popular','las villas') DEFAULT NULL,
  `activo` varchar(4) NOT NULL DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`cod_empleado`, `nombre1`, `nombre2`, `apellido1`, `apellido2`, `tipo_documento`, `no_documento`, `sexo`, `direccion`, `ciudad`, `edad`, `telefono`, `fecha_ingreso`, `estado_civil`, `cargo_cod`, `nivel_estudios`, `eps`, `pensiones`, `cesantias`, `banco`, `activo`) VALUES
(1, 'Gonzalo', '', 'Betancur', 'Arroyave', 'cc', '80161094', 'masculino', 'cra 78c # 5c 48', 'bogota', 30, '3145778421', '2024-03-07', '', 1, '', 'sanitas', 'colfondos', 'fna', 'bbva', 'A'),
(2, 'Santiago', '', 'Betancurt', 'Lemos', 'cc', '79843321', 'masculino', 'cra 71d # 7a 48', 'bogota', 32, '3202568945', '2024-03-07', '', 1, 'tecnico', 'sura', 'proteccion', 'porvenir', 'davivienda', 'A'),
(3, 'Isabella', '', 'Marquez', 'Jaramillo', 'cc', '52951079', 'femenino', 'CALLE 28 #58-69', 'barranquilla', 28, '3457634512', '2024-03-07', '', 2, '', 'capital salud', 'colfondos', 'colfondos', '', 'A'),
(4, 'Karla', 'Maria', 'Molina', 'Lema', 'cc', '53456798', 'femenino', 'cra 78c # 5c 25', 'cali', 34, '3124772431', '2024-03-07', '', 2, 'tecnico', 'nueva eps', 'proteccion', 'fna', 'popular', 'A'),
(5, 'Hilda', '', 'Rodriguez', 'Caro', 'cc', '1020567980', 'femenino', 'Av 68 # 5a _45', 'bogota', 31, '3025975960', '2024-03-07', '', 2, 'profesional', 'sanitas', 'porvenir', 'proteccion', '', 'A'),
(6, 'Victoria', '', 'Hincapie', 'Vergara', 'cc', '19654789', 'femenino', 'Calle 10 # 5-51', 'medellin', 22, '3103336590', '2024-03-07', 'union libre', 2, '', 'sura', 'porvenir', 'colfondos', 'popular', 'A'),
(7, 'Pablo', 'Santiago', 'Rojas', 'Duque', 'cc', '1018765324', 'masculino', 'Calle 100 # 11B-27 Bogotá', 'bogota', 25, '3456676895', '2024-03-07', '', 2, 'primaria', 'capital salud', 'colfondos', 'fna', 'davivienda', 'A'),
(8, 'Pamela', '', 'Serna', 'Muñoz', 'cc', '1010654382', 'femenino', 'Calle 53 No 10-60/46, Pis', 'barranquilla', 40, '3225986478', '2024-03-07', 'union libre', 2, 'tecnico', 'nueva eps', 'skandia', 'porvenir', 'bbva', 'A'),
(9, 'Stepania', '', 'Zapata', 'Pelaez', 'cc', '1014343567', 'femenino', 'Carrera 21 # 17 -63', 'cali', 25, '3028912345', '2024-03-07', '', 2, '', 'sanitas', 'porvenir', 'fna', 'davivienda', 'A'),
(10, 'Manuel', 'Andres', 'Toro', 'Sanchez', 'cc', '1013567900', 'masculino', 'Calle 24D #5676', 'medellin', 28, '3026598745', '2024-03-07', '', 2, 'profesional', 'sura', 'skandia', 'colfondos', 'popular', 'A'),
(11, 'Barbara', '', 'Henao', 'Cano', 'cc', '51593856', 'femenino', 'CALLE 12#45-17', 'bogota', 35, '8018043009', '2024-03-07', '', 4, 'profesional', 'capital salud', 'colfondos', 'colfondos', '', 'A'),
(12, 'Leonardo', '', 'Vasquez', 'Uribe', 'cc', '79804568', 'masculino', 'Av 26 No 59-51 Edificio A', 'medellin', 24, '3201452698', '2024-03-07', 'union libre', 4, 'tecnico', 'nueva eps', 'proteccion', 'proteccion', '', 'A'),
(13, 'Juliana', '', 'Castrillón', 'Florez', 'cc', '1015678904', 'femenino', 'Av Boyaca #  2a 71', 'cali', 32, '3412589678', '2024-03-07', '', 3, '', 'sanitas', 'colfondos', 'colfondos', 'davivienda', 'A'),
(14, 'Rocio', '', 'Muñoz', 'Gutierrez', 'cc', '1015768903', 'femenino', 'CR 5B #50-49A SUR', 'barranquilla', 37, '3125847512', '2024-03-07', '', 3, 'tecnico', 'sura', 'porvenir', 'porvenir', 'bbva', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrada_cabeza`
--

CREATE TABLE `entrada_cabeza` (
  `cod_entrada` int(11) NOT NULL,
  `fecha_entrada` date NOT NULL,
  `proveedor_cod` int(11) NOT NULL,
  `empleado_cod` int(11) NOT NULL,
  `forma_pago` enum('efectivo','nequi','credito') DEFAULT NULL,
  `tipomov_cod` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `entrada_cabeza`
--

INSERT INTO `entrada_cabeza` (`cod_entrada`, `fecha_entrada`, `proveedor_cod`, `empleado_cod`, `forma_pago`, `tipomov_cod`) VALUES
(1, '2023-08-05', 2, 1, 'credito', 2),
(2, '2023-08-05', 2, 1, 'credito', 2),
(3, '2023-08-05', 3, 1, 'credito', 2),
(4, '2023-08-06', 3, 1, 'credito', 2),
(5, '2023-08-06', 4, 1, 'credito', 2),
(6, '2023-08-06', 4, 1, 'credito', 2),
(7, '2023-08-06', 5, 1, 'credito', 4),
(8, '2023-08-07', 7, 1, 'credito', 2),
(9, '2023-08-07', 2, 1, 'credito', 2),
(10, '2023-08-07', 3, 1, 'credito', 2),
(11, '2023-08-08', 4, 1, 'credito', 2),
(12, '2023-08-08', 3, 1, 'credito', 2),
(13, '2023-08-08', 6, 1, 'credito', 2),
(14, '2023-08-08', 1, 1, 'credito', 4),
(15, '2023-08-09', 1, 1, 'credito', 4),
(16, '2023-08-09', 8, 1, 'credito', 2),
(17, '2023-08-10', 1, 1, 'credito', 4),
(18, '2023-08-11', 1, 1, 'credito', 4),
(19, '2023-08-11', 7, 1, 'credito', 2),
(20, '2023-08-11', 5, 1, 'credito', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrada_detalle`
--

CREATE TABLE `entrada_detalle` (
  `cod_edetalle` int(11) NOT NULL,
  `entrada_cod` int(11) NOT NULL,
  `producto_cod` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `valor_compra` decimal(10,0) NOT NULL DEFAULT 0,
  `subtotal` decimal(10,0) GENERATED ALWAYS AS (`valor_compra` * `cantidad`) VIRTUAL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `entrada_detalle`
--

INSERT INTO `entrada_detalle` (`cod_edetalle`, `entrada_cod`, `producto_cod`, `cantidad`, `valor_compra`) VALUES
(1, 1, 1, 100, 2000),
(2, 1, 2, 500, 7000),
(3, 1, 3, 400, 2800),
(4, 2, 1, 100, 2000),
(5, 2, 2, 500, 7000),
(6, 2, 3, 400, 2800),
(7, 3, 4, 100, 4500),
(8, 3, 5, 600, 6500),
(9, 3, 8, 500, 5500),
(10, 4, 4, 100, 4500),
(11, 4, 5, 600, 6500),
(12, 4, 8, 500, 5500),
(13, 5, 10, 500, 6500),
(14, 5, 4, 700, 4500),
(15, 6, 8, 500, 5500),
(16, 6, 5, 100, 6500),
(17, 7, 2, 150, 5500),
(18, 8, 11, 200, 5500),
(19, 8, 12, 150, 5500),
(20, 8, 13, 120, 7500),
(21, 9, 14, 300, 9000),
(22, 9, 15, 500, 7200),
(23, 9, 16, 400, 8000),
(24, 10, 17, 180, 6300),
(25, 10, 18, 260, 5600),
(26, 10, 19, 400, 2800),
(27, 11, 23, 500, 2500),
(28, 11, 24, 300, 3400),
(29, 11, 25, 250, 4200),
(30, 12, 3, 170, 3000),
(31, 13, 26, 300, 1800),
(32, 13, 27, 250, 2500),
(33, 13, 28, 140, 6000),
(34, 14, 14, 4, 9000),
(35, 14, 15, 2, 7200),
(36, 14, 16, 5, 8000),
(37, 15, 12, 6, 5500),
(38, 15, 13, 3, 7500),
(39, 15, 14, 5, 9000),
(40, 16, 8, 300, 5500),
(41, 16, 9, 240, 7500),
(42, 16, 10, 220, 6500),
(43, 17, 5, 3, 6500),
(44, 18, 10, 4, 6500),
(45, 19, 11, 270, 5500),
(46, 20, 7, 140, 4500),
(47, 20, 20, 150, 6000),
(48, 20, 21, 200, 8000),
(49, 20, 22, 300, 2100);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura_cabeza`
--

CREATE TABLE `factura_cabeza` (
  `cod_factura` int(11) NOT NULL,
  `fecha_factura` date NOT NULL,
  `cliente_cod` int(11) NOT NULL,
  `empleado_cod` int(11) NOT NULL,
  `forma_pago` enum('efectivo','nequi','credito') DEFAULT NULL,
  `tipomov_cod` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `factura_cabeza`
--

INSERT INTO `factura_cabeza` (`cod_factura`, `fecha_factura`, `cliente_cod`, `empleado_cod`, `forma_pago`, `tipomov_cod`) VALUES
(1, '2023-08-05', 4, 3, 'efectivo', 1),
(2, '2023-08-05', 7, 3, 'efectivo', 1),
(3, '2023-08-05', 5, 4, 'efectivo', 1),
(4, '2023-08-06', 3, 4, 'nequi', 1),
(5, '2023-08-06', 6, 5, 'nequi', 1),
(6, '2023-08-06', 7, 3, 'nequi', 1),
(7, '2023-08-06', 7, 3, 'nequi', 3),
(8, '2023-08-07', 8, 5, 'nequi', 1),
(9, '2023-08-07', 8, 6, 'efectivo', 1),
(10, '2023-08-08', 9, 6, 'credito', 1),
(11, '2023-08-08', 9, 7, 'credito', 1),
(12, '2023-08-08', 10, 7, 'credito', 1),
(13, '2023-08-09', 10, 8, 'credito', 1),
(14, '2023-08-09', 11, 8, 'nequi', 1),
(15, '2023-08-10', 11, 9, 'nequi', 1),
(16, '2023-08-11', 12, 9, 'efectivo', 1),
(17, '2023-08-11', 12, 10, 'efectivo', 1),
(18, '2023-08-12', 13, 10, 'efectivo', 1),
(19, '2023-08-12', 13, 5, 'credito', 1),
(20, '2023-08-13', 14, 6, 'credito', 1),
(21, '2023-08-13', 14, 4, 'nequi', 1),
(22, '2023-08-14', 15, 8, 'nequi', 1),
(23, '2023-08-15', 16, 9, 'efectivo', 3),
(24, '2023-08-15', 10, 7, 'efectivo', 3),
(25, '2023-08-16', 3, 5, 'efectivo', 3),
(26, '2023-08-16', 5, 3, 'efectivo', 3),
(27, '2023-08-17', 8, 11, 'nequi', 1),
(28, '2023-08-17', 4, 10, 'nequi', 1),
(29, '2023-08-17', 8, 7, 'efectivo', 1),
(30, '2023-08-18', 9, 4, 'credito', 1),
(31, '2023-08-18', 2, 9, 'nequi', 1),
(32, '2023-08-18', 6, 7, 'nequi', 1),
(33, '2023-08-19', 13, 3, 'efectivo', 1),
(34, '2023-08-19', 8, 8, 'credito', 1),
(35, '2023-08-20', 14, 5, 'nequi', 1),
(36, '2023-08-20', 15, 3, 'efectivo', 1),
(37, '2023-08-21', 16, 6, 'nequi', 1),
(38, '2023-08-21', 11, 8, 'efectivo', 1),
(39, '2023-08-22', 12, 6, 'credito', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura_detalle`
--

CREATE TABLE `factura_detalle` (
  `cod_facdetalle` int(11) NOT NULL,
  `factura_cod` int(11) NOT NULL,
  `producto_cod` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `valor_venta` decimal(10,0) NOT NULL DEFAULT 0,
  `subtotal` decimal(10,0) GENERATED ALWAYS AS (`valor_venta` * `cantidad`) VIRTUAL,
  `descuento` decimal(10,2) NOT NULL DEFAULT 0.00,
  `neto` decimal(10,0) GENERATED ALWAYS AS (`subtotal` * (1 - `descuento`)) VIRTUAL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `factura_detalle`
--

INSERT INTO `factura_detalle` (`cod_facdetalle`, `factura_cod`, `producto_cod`, `cantidad`, `valor_venta`, `descuento`) VALUES
(1, 1, 1, 10, 3000, 0.00),
(2, 1, 2, 5, 8000, 0.00),
(3, 1, 3, 4, 3000, 0.00),
(4, 2, 1, 10, 3000, 0.00),
(5, 2, 2, 5, 8000, 0.00),
(6, 2, 3, 4, 3800, 0.00),
(7, 3, 4, 10, 5500, 0.10),
(8, 3, 5, 6, 7500, 0.10),
(9, 3, 8, 5, 6500, 0.10),
(10, 4, 4, 10, 5500, 0.10),
(11, 4, 5, 6, 7500, 0.10),
(12, 4, 8, 5, 6500, 0.10),
(13, 5, 10, 5, 7500, 0.10),
(14, 5, 4, 7, 5500, 0.10),
(15, 6, 8, 5, 6500, 0.10),
(16, 6, 5, 10, 7500, 0.10),
(17, 7, 2, 15, 6500, 0.00),
(18, 8, 7, 20, 5500, 0.05),
(19, 8, 9, 18, 8500, 0.05),
(20, 8, 10, 5, 7500, 0.05),
(21, 9, 12, 13, 6500, 0.00),
(22, 9, 13, 30, 8500, 0.00),
(23, 9, 14, 23, 10000, 0.00),
(24, 10, 11, 7, 6500, 0.10),
(25, 10, 10, 13, 7500, 0.10),
(26, 10, 13, 20, 8500, 0.10),
(27, 11, 14, 15, 10000, 0.00),
(28, 11, 15, 30, 8200, 0.00),
(29, 11, 5, 17, 7500, 0.00),
(30, 12, 16, 30, 9000, 0.15),
(31, 12, 15, 50, 8200, 0.15),
(32, 12, 14, 24, 10000, 0.15),
(33, 13, 17, 30, 7300, 0.00),
(34, 13, 18, 40, 6600, 0.00),
(35, 13, 19, 25, 3880, 0.10),
(36, 14, 20, 15, 7000, 0.05),
(37, 14, 21, 10, 9000, 0.05),
(38, 15, 22, 34, 3100, 0.05),
(39, 15, 23, 55, 3500, 0.05),
(40, 16, 24, 43, 4400, 0.10),
(41, 16, 25, 32, 5200, 0.10),
(42, 17, 26, 28, 2800, 0.00),
(43, 17, 27, 16, 3500, 0.00),
(44, 18, 28, 26, 7000, 0.00),
(45, 19, 10, 40, 7500, 0.10),
(46, 19, 11, 25, 6500, 0.10),
(47, 20, 12, 17, 6500, 0.10),
(48, 20, 13, 50, 8500, 0.10),
(49, 20, 14, 36, 10000, 0.00),
(50, 21, 4, 30, 5500, 0.10),
(51, 21, 5, 26, 7500, 0.05),
(52, 22, 7, 30, 5500, 0.05),
(53, 22, 8, 16, 6500, 0.05),
(54, 23, 9, 20, 8500, 0.10),
(55, 23, 10, 30, 7500, 0.10),
(56, 24, 11, 50, 6500, 0.10),
(57, 24, 12, 28, 6500, 0.05),
(58, 24, 13, 16, 8500, 0.05),
(59, 25, 14, 12, 10000, 0.05),
(60, 25, 15, 10, 8200, 0.10),
(61, 26, 16, 30, 9000, 0.05),
(62, 26, 17, 20, 7300, 0.05),
(63, 27, 18, 15, 6600, 0.10),
(64, 27, 19, 22, 3880, 0.10),
(65, 27, 20, 13, 7000, 0.10),
(66, 28, 21, 25, 9000, 0.00),
(67, 28, 22, 15, 3100, 0.00),
(68, 28, 23, 7, 3500, 0.00),
(69, 29, 24, 11, 4400, 0.00),
(70, 29, 25, 4, 5200, 0.00),
(71, 30, 26, 10, 2800, 0.00),
(72, 31, 27, 14, 3500, 0.10),
(73, 31, 28, 12, 7000, 0.05),
(74, 32, 4, 20, 5500, 0.10),
(75, 32, 5, 15, 7500, 0.10),
(76, 33, 6, 20, 3500, 0.00),
(77, 33, 7, 16, 5500, 0.00),
(78, 34, 8, 24, 6500, 0.10),
(79, 34, 9, 18, 8500, 0.05),
(80, 35, 10, 30, 7500, 0.00),
(81, 35, 11, 23, 6500, 0.10),
(82, 36, 12, 37, 6500, 0.05),
(83, 36, 13, 26, 8500, 0.10),
(84, 37, 14, 22, 10000, 0.10),
(85, 37, 15, 31, 8200, 0.10),
(86, 38, 16, 15, 9000, 0.00),
(87, 38, 17, 29, 7300, 0.00),
(88, 38, 18, 30, 6600, 0.00),
(89, 38, 19, 25, 3880, 0.00),
(90, 39, 20, 40, 7000, 0.00),
(91, 39, 22, 28, 3100, 0.00),
(92, 39, 21, 37, 9000, 0.00),
(93, 39, 24, 24, 4400, 0.00),
(94, 39, 26, 10, 2800, 0.00),
(95, 39, 25, 14, 5200, 0.00),
(96, 39, 28, 20, 7000, 0.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nomina`
--

CREATE TABLE `nomina` (
  `cod_nomina` int(11) NOT NULL,
  `fecha_nomina` date NOT NULL,
  `empleado_cod` int(11) NOT NULL,
  `salario_base` decimal(10,0) NOT NULL DEFAULT 0,
  `dias_trabajados` int(11) NOT NULL,
  `salario` decimal(10,0) GENERATED ALWAYS AS (`salario_base` / 30 * `dias_trabajados`) VIRTUAL,
  `auxilio_transporte` decimal(10,0) NOT NULL DEFAULT 0,
  `nro_hrecargo` int(11) DEFAULT 0,
  `recargo_noche` decimal(10,0) GENERATED ALWAYS AS (`salario` / 240 * `nro_hrecargo` * 1.35) VIRTUAL,
  `comisiones_otros` decimal(10,0) NOT NULL DEFAULT 0,
  `total_devengado` decimal(10,0) GENERATED ALWAYS AS (`salario` + `auxilio_transporte` + `recargo_noche` + `comisiones_otros`) VIRTUAL,
  `salud` decimal(10,0) GENERATED ALWAYS AS ((`total_devengado` - `auxilio_transporte`) * 0.04) VIRTUAL,
  `pension` decimal(10,0) GENERATED ALWAYS AS ((`total_devengado` - `auxilio_transporte`) * 0.04) VIRTUAL,
  `prestamos_otros` decimal(10,0) NOT NULL DEFAULT 0,
  `total_deducido` decimal(10,0) GENERATED ALWAYS AS (`salud` - `pension` - `prestamos_otros`) VIRTUAL,
  `neto_pagar` decimal(10,0) GENERATED ALWAYS AS (`total_devengado` - `total_deducido`) VIRTUAL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `cod_producto` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `existencia` bigint(20) NOT NULL CHECK (`existencia` >= 0),
  `valor_compra` decimal(10,0) NOT NULL DEFAULT 0,
  `valor_venta` decimal(10,0) NOT NULL DEFAULT 0,
  `nro_lote` bigint(20) NOT NULL,
  `fecha_fabricacion` date NOT NULL,
  `fecha_vencimiento` date NOT NULL,
  `cxcaja` int(11) NOT NULL,
  `proveedor_cod` int(11) NOT NULL,
  `categor_cod` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`cod_producto`, `descripcion`, `existencia`, `valor_compra`, `valor_venta`, `nro_lote`, `fecha_fabricacion`, `fecha_vencimiento`, `cxcaja`, `proveedor_cod`, `categor_cod`) VALUES
(1, 'Galletas Festival Bsax12', 4000, 2000, 3000, 4089, '2023-04-01', '2024-04-01', 24, 2, 3),
(2, 'Galletas Ducales taco', 5000, 7000, 8000, 4088, '2023-04-01', '2024-04-01', 24, 2, 3),
(3, 'Bom bom bum barrax50', 3500, 3000, 3800, 4081, '2023-05-01', '2024-05-01', 12, 3, 4),
(4, 'Pan Blanco tajado', 5500, 4500, 5500, 4080, '2023-02-01', '2024-02-01', 12, 4, 2),
(5, 'Salsa de tomate frasco', 6000, 6500, 7500, 4084, '2023-06-01', '2024-06-01', 12, 7, 5),
(6, 'Jugo Fresa frasco', 6500, 2500, 3500, 4086, '2023-03-01', '2024-03-01', 8, 6, 6),
(7, 'Leche pasteurizada bsa', 7500, 4500, 5500, 4080, '2023-03-01', '2024-03-01', 12, 5, 1),
(8, 'Salchichas vaquera x pq', 8500, 5500, 6500, 4070, '2023-08-30', '2024-10-20', 1, 8, 7),
(9, 'Mortadela vaquera x pq', 9500, 7500, 8500, 4071, '2023-08-30', '2024-10-20', 1, 8, 7),
(10, 'Salchiperro vaquera x pq', 8500, 6500, 7500, 4072, '2023-08-30', '2024-10-20', 1, 8, 7),
(11, 'Salsa de soya frasco', 6500, 5500, 6500, 4079, '2023-08-20', '2024-09-20', 12, 7, 5),
(12, 'Salsa mayonesa frasco', 8000, 5500, 6500, 4079, '2023-08-20', '2024-09-20', 12, 7, 5),
(13, 'Salsa rosada frasco', 7600, 7500, 8500, 4079, '2023-08-20', '2024-09-20', 12, 7, 5),
(14, 'Galletas Recreo bsa', 8200, 9000, 10000, 4077, '2023-08-20', '2024-08-20', 24, 2, 3),
(15, 'Galletas Ducales taco', 9000, 7200, 8200, 4077, '2023-08-20', '2024-08-20', 24, 2, 3),
(16, 'Galletas Saltin taco', 10000, 8000, 9000, 4077, '2023-08-20', '2024-08-20', 24, 2, 3),
(17, 'Menta Helada Bsa', 5500, 6300, 7300, 4076, '2023-09-10', '2024-09-10', 12, 3, 4),
(18, 'Confites Choco Bsa', 3700, 5600, 6600, 4076, '2023-09-10', '2024-09-10', 12, 3, 4),
(19, 'Arequipe mum tarro', 4500, 2800, 3880, 4076, '2023-09-10', '2024-09-10', 12, 3, 4),
(20, 'Queso Costeño pq', 3000, 6000, 7000, 4075, '2023-09-10', '2024-09-10', 1, 5, 1),
(21, 'Leche Entera bsa', 5000, 8000, 9000, 4075, '2023-09-10', '2024-09-10', 10, 5, 1),
(22, 'Yogourt Dulce tarro', 6000, 2100, 3100, 4075, '2023-09-10', '2024-09-10', 1, 5, 1),
(23, 'Pan mogolla x 10 bsa', 5000, 2500, 3500, 4074, '2023-09-10', '2024-09-10', 10, 4, 2),
(24, 'Ponque Bimbox5 bsa', 3500, 3400, 4400, 4074, '2023-09-10', '2024-09-10', 10, 4, 2),
(25, 'Brownie x 5 bsa', 7000, 4200, 5200, 4074, '2023-09-10', '2024-09-10', 10, 4, 2),
(26, 'Agua Cristal bote', 8500, 1800, 2800, 4073, '2023-09-10', '2024-09-10', 10, 6, 6),
(27, 'Jugo Mora Frasco', 6300, 2500, 3500, 4073, '2023-09-10', '2024-09-10', 10, 6, 6),
(28, 'Pony Malta litro', 8400, 6000, 7000, 4073, '2023-09-10', '2024-09-10', 6, 6, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `cod_proveedor` int(11) NOT NULL,
  `razon_social` varchar(50) NOT NULL,
  `tipo_documento` enum('nit','rut','cc') DEFAULT NULL,
  `direccion` varchar(50) NOT NULL,
  `telefono` varchar(25) NOT NULL,
  `e_mail` varchar(50) NOT NULL,
  `asesor_comercial` varchar(50) NOT NULL,
  `telefono_asesor` varchar(25) NOT NULL,
  `e_mail_asesor` varchar(50) NOT NULL,
  `ciudad` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`cod_proveedor`, `razon_social`, `tipo_documento`, `direccion`, `telefono`, `e_mail`, `asesor_comercial`, `telefono_asesor`, `e_mail_asesor`, `ciudad`) VALUES
(1, 'Devolución Buena', '', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'N/A', 'BOGOTA'),
(2, 'GALLETAS POLLY', '', 'CRA 41B NO.9-65', '3701266', 'servicioproveedor@pull.co', 'RODRIGO TORRES', '319423218', 'rodrigotorres@pull.co', 'BOGOTA'),
(3, 'DULCES SUGAR', '', 'CRA 29B No.18A-61 SUR', '7133907', 'clientes@dulsugar.co', 'SANDRA VALBUENA', '314763218', 'sandra.valbunea@dulsugar.co', 'BOGOTA'),
(4, 'PAN MIMOS', '', 'CRA 31A No.10-78', '2084765', 'atencioncliente@mimos.co', 'ROCIO MORENO', '3134487965', 'carlos.moreno@mimos.co', 'BUCARAMANGA'),
(5, 'LACTEOS VAQUERIA', '', 'CRA 20 No.22-48', '76712474', 'serviciocliente@vaqueria.co', 'AMAYA', '3108156311', 'ramayacalinca@vaqueria.co', 'MEDELLIN'),
(6, 'BEBIDAS YAYOS', '', 'CRA 24 NO.54-32', '68856743', 'clientes@yayos.co', 'FREDY CARDENAS', '3124512107', 'fredy.cardenas@yayos.co', 'BARRANQUILLA'),
(7, 'SALSAS PIRRY', '', 'CLL 12A No.37-122', '24457740', ' servicioalcliente@pirry.com', 'SONIA VIVAS', '3194321290', 'soniavivas@pirry.com', 'CALI'),
(8, 'CARNICOS COWS', '', 'CLL 220A No.7-122', '24457735', ' servicioalcliente@cows.com', 'BARTIMEO RIOS', '3194321298', 'Bartimeo rios@cows.com', 'BOGOTA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipomov`
--

CREATE TABLE `tipomov` (
  `cod_tipomov` int(11) NOT NULL,
  `nombre_mov` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipomov`
--

INSERT INTO `tipomov` (`cod_tipomov`, `nombre_mov`) VALUES
(1, 'Venta'),
(2, 'Compra'),
(3, 'Salida Obsequio'),
(4, 'Devolucion Venta');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_categoria_producto`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_categoria_producto` (
`nombre_categoria` varchar(50)
,`descripcion` varchar(50)
,`valor_compra` decimal(10,0)
,`valor_venta` decimal(10,0)
,`existencia` bigint(20)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_empleado_cliente`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_empleado_cliente` (
`nombre1` varchar(25)
,`apellido1` varchar(25)
,`nombre_cli` varchar(25)
,`apellid_cli` varchar(25)
,`ciudad` enum('bogota','barranquilla','medellin','cali')
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_mov_factura`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_mov_factura` (
`nombre_mov` varchar(25)
,`cod_factura` int(11)
,`fecha_factura` date
,`cliente_cod` int(11)
,`forma_pago` enum('efectivo','nequi','credito')
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_proveedores_productos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_proveedores_productos` (
`razon_social` varchar(50)
,`ciudad` varchar(25)
,`direccion` varchar(50)
,`e_mail` varchar(50)
,`descripcion` varchar(50)
,`valor_venta` decimal(10,0)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_categoria_producto`
--
DROP TABLE IF EXISTS `vista_categoria_producto`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_categoria_producto`  AS SELECT `t1`.`nombre_categoria` AS `nombre_categoria`, `t2`.`descripcion` AS `descripcion`, `t2`.`valor_compra` AS `valor_compra`, `t2`.`valor_venta` AS `valor_venta`, `t2`.`existencia` AS `existencia` FROM (`categoria` `t1` join `producto` `t2`) WHERE `t1`.`cod_categoria` = `t2`.`categor_cod` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_empleado_cliente`
--
DROP TABLE IF EXISTS `vista_empleado_cliente`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_empleado_cliente`  AS SELECT `t1`.`nombre1` AS `nombre1`, `t1`.`apellido1` AS `apellido1`, `t2`.`nombre1` AS `nombre_cli`, `t2`.`apellido1` AS `apellid_cli`, `t2`.`ciudad` AS `ciudad` FROM (`empleado` `t1` join `cliente` `t2`) WHERE `t1`.`cod_empleado` = `t2`.`empleado_cod` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_mov_factura`
--
DROP TABLE IF EXISTS `vista_mov_factura`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_mov_factura`  AS SELECT `t1`.`nombre_mov` AS `nombre_mov`, `t2`.`cod_factura` AS `cod_factura`, `t2`.`fecha_factura` AS `fecha_factura`, `t2`.`cliente_cod` AS `cliente_cod`, `t2`.`forma_pago` AS `forma_pago` FROM (`tipomov` `t1` join `factura_cabeza` `t2`) WHERE `t1`.`cod_tipomov` = `t2`.`tipomov_cod` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_proveedores_productos`
--
DROP TABLE IF EXISTS `vista_proveedores_productos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_proveedores_productos`  AS SELECT `t1`.`razon_social` AS `razon_social`, `t1`.`ciudad` AS `ciudad`, `t1`.`direccion` AS `direccion`, `t1`.`e_mail` AS `e_mail`, `t2`.`descripcion` AS `descripcion`, `t2`.`valor_venta` AS `valor_venta` FROM (`proveedores` `t1` join `producto` `t2`) WHERE `t1`.`cod_proveedor` = `t2`.`proveedor_cod` ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`cod_cargo`),
  ADD KEY `nombre_cargo` (`nombre_cargo`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`cod_categoria`),
  ADD KEY `nombre_categoria` (`nombre_categoria`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cod_cliente`),
  ADD KEY `nombre1` (`nombre1`,`apellido1`),
  ADD KEY `empleado_cod` (`empleado_cod`);

--
-- Indices de la tabla `contratista`
--
ALTER TABLE `contratista`
  ADD PRIMARY KEY (`cod_contratista`);

--
-- Indices de la tabla `despachos`
--
ALTER TABLE `despachos`
  ADD PRIMARY KEY (`cod_despacho`),
  ADD KEY `fecha_entrega` (`fecha_entrega`,`entregado`),
  ADD KEY `contratista_cod` (`contratista_cod`),
  ADD KEY `factura_cod` (`factura_cod`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`cod_empleado`),
  ADD KEY `nombre1` (`nombre1`),
  ADD KEY `cargo_cod` (`cargo_cod`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cargo`
--
ALTER TABLE `cargo`
  MODIFY `cod_cargo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `cod_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `cod_empleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`cargo_cod`) REFERENCES `cargo` (`cod_cargo`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
