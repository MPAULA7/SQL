-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 31-03-2024 a las 22:01:20
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
-- Base de datos: `ti_acc`
--

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
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `cod_producto` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `valor_compra` decimal(10,0) NOT NULL DEFAULT 0,
  `valor_venta` decimal(10,0) NOT NULL DEFAULT 0,
  `existencia` bigint(20) NOT NULL CHECK (`existencia` >= 0),
  `nro_lote` int(11) NOT NULL,
  `fecha_fabricacion` date NOT NULL,
  `fecha_vencimiento` date NOT NULL,
  `categor_cod` int(11) NOT NULL,
  `proveedor_cod` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`cod_producto`, `descripcion`, `valor_compra`, `valor_venta`, `existencia`, `nro_lote`, `fecha_fabricacion`, `fecha_vencimiento`, `categor_cod`, `proveedor_cod`) VALUES
(1, 'collar de perlas', 120000, 3000, 50000, 4089, '2023-04-01', '2024-04-01', 3, 2),
(2, 'reloj de pulsera', 100000, 8000, 80000, 4088, '2023-04-01', '2024-04-01', 3, 2),
(3, 'pañuelo de seda', 80000, 3800, 50000, 4081, '2023-05-01', '2024-05-01', 4, 3),
(4, 'gorra de beisbol', 90000, 5500, 60000, 4080, '2023-02-01', '2024-02-01', 2, 4),
(5, 'bufanda de lana', 120000, 7500, 60000, 4084, '2023-06-01', '2024-06-01', 5, 7),
(6, 'aretes de plata', 120000, 3500, 90000, 4086, '2023-03-01', '2024-03-01', 6, 6),
(7, 'pulsera de plata', 130000, 5500, 100000, 4080, '2023-03-01', '2024-03-01', 1, 5),
(8, 'cartera de cuero', 150000, 6500, 100000, 4070, '2023-08-30', '2023-09-20', 7, 8),
(9, 'bolso de mano', 205000, 8500, 90000, 4071, '2023-08-30', '2023-09-20', 7, 8),
(10, 'broche de plata', 100000, 7500, 80000, 4072, '2023-08-30', '2023-09-20', 7, 8);

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

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cod_cliente`),
  ADD KEY `nombre1` (`nombre1`,`apellido1`),
  ADD KEY `empleado_cod` (`empleado_cod`);

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
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`cod_producto`),
  ADD KEY `descripcion` (`descripcion`),
  ADD KEY `categor_cod` (`categor_cod`),
  ADD KEY `proveedor_cod` (`proveedor_cod`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `cod_empleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `cod_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
