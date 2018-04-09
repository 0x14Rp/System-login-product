-- phpMyAdmin SQL Dump
-- version 4.7.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 15-09-2017 a las 13:56:09
-- Versión del servidor: 10.1.26-MariaDB
-- Versión de PHP: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dbinventaio`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idcliente` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `cedula` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `telefono` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `correo` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idcliente`, `nombre`, `cedula`, `telefono`, `correo`) VALUES
(2, 'Ronald Diaz', '23863220', '04145142165', 'diaz-ronald@hotmail.es'),
(3, 'Rafael Urdaneta', '20602282', '04145500032', 'rafaelurd91@gmail.com'),
(5, 'rafa', '2162256', '041454757', 'elgondu@gmail.com'),
(6, 'asdfasdf', 'rea', 'sdfasdf', 'asdfasdfasdfasdfasdf'),
(7, 'terger', '23455223', '201201210120', 'fasdfasf@hotmail.com'),
(8, 'rafa', '21626089', '041525451', 'yuyu@wow.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idproducto` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `cedula` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `producto` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `imei` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` text COLLATE utf8_spanish_ci NOT NULL,
  `status` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idproducto`, `fecha`, `cedula`, `producto`, `imei`, `descripcion`, `status`) VALUES
(1000, '0000-00-00', '23863220', 'Blackberry', '205a90c8', 'Falla software.', 'finalizado'),
(1001, '0000-00-00', '20602282', 'Iphone 5s', '101jajAj91', 'Cambio de Mica.', 'finalizado'),
(1002, '0000-00-00', '22111674', 'LG L70', '121312002351', 'La pantalla le falla.', 'finalizado'),
(1003, '2017-09-15', 'r223r2', '3123123', '3123123', 'fatal', 'en proceso'),
(1004, '2017-09-15', '323234234', 'blu r1', '142123123123', 'tapa partida', 'en proceso'),
(1005, '2017-09-15', '342342', 'fsdfsad', '234234', 'fasdfasdf', 'en proceso'),
(1006, '2017-09-15', '2162256', 'blu r1', '4534534', 'farasddfasdfasdf', 'finalizado'),
(1007, '2017-09-15', '212121', 'fasdfasdf', 'fsdfsdf', 'asdfasdfasdf', 'en proceso'),
(1008, '2017-09-15', '23455223', 'safadf', '324234234', 'fsdfsdf', 'en proceso'),
(1009, '2017-09-15', '21626089', 'xp1', '2342342342', 'Destruccion inminente', 'en proceso');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reporte`
--

CREATE TABLE `reporte` (
  `idreporte` int(11) NOT NULL,
  `idproducto` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `nombre_producto` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `nombre_cliente` text COLLATE utf8_spanish_ci NOT NULL,
  `resultado` varchar(256) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `reporte`
--

INSERT INTO `reporte` (`idreporte`, `idproducto`, `fecha`, `nombre_producto`, `nombre_cliente`, `resultado`) VALUES
(4, 1003, '0000-00-00', 'Blackberry', 'Ronald Diaz', 'Listo el vlayberry menor.'),
(11, 1001, '2017-09-15', 'Iphone 5s', 'Rafael Urdaneta', 'El telefono no tiene vida...'),
(12, 0, '2017-09-15', '', '', ''),
(13, 1006, '2017-09-15', 'blu r1', 'rafa', 'D?DD?D?DD');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `pass` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(40) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `user`, `pass`, `email`) VALUES
(1, 'rafa', 'rafa', 'usuario@usuario.usuario'),
(2, 'usuario1', 'usuario1', 'usuario1@usuario1.usuario1');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idcliente`),
  ADD UNIQUE KEY `cedula` (`cedula`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idproducto`);

--
-- Indices de la tabla `reporte`
--
ALTER TABLE `reporte`
  ADD PRIMARY KEY (`idreporte`),
  ADD UNIQUE KEY `idproducto` (`idproducto`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idcliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `reporte`
--
ALTER TABLE `reporte`
  MODIFY `idreporte` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
