-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-09-2025 a las 20:19:55
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
-- Base de datos: `sgt`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articles`
--

CREATE TABLE `articles` (
  `id_article` int(11) NOT NULL COMMENT 'Identificador único del artículo',
  `name` varchar(100) NOT NULL COMMENT 'Nombre del producto',
  `id_category` int(11) NOT NULL COMMENT 'Relación con la categoría (rubro)',
  `id_supplier` int(11) NOT NULL COMMENT 'Relación con el proveedor',
  `code` varchar(20) DEFAULT NULL COMMENT 'Código interno del producto',
  `cost_price` decimal(10,2) DEFAULT NULL COMMENT 'Precio de compra',
  `sale_price` decimal(10,2) DEFAULT NULL COMMENT 'Precio de venta final',
  `stock` decimal(10,2) DEFAULT NULL COMMENT 'Cantidad actual en stock',
  `min_stock` decimal(10,2) DEFAULT NULL COMMENT 'Nivel mínimo para alertar reposición',
  `brand` varchar(50) DEFAULT NULL COMMENT 'Marca del producto',
  `vat` decimal(5,2) DEFAULT 21.00 COMMENT 'Porcentaje de IVA aplicado',
  `photo` varchar(255) DEFAULT NULL COMMENT 'Ruta de la foto del producto'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Tabla de artículos del sistema SGT';

--
-- Volcado de datos para la tabla `articles`
--

INSERT INTO `articles` (`id_article`, `name`, `id_category`, `id_supplier`, `code`, `cost_price`, `sale_price`, `stock`, `min_stock`, `brand`, `vat`, `photo`) VALUES
(4, 'cooperativa', 1, 1, '32432', 32332.00, 3200000.00, 322.00, 23.00, 'dsadagfd', 21.00, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `id_category` int(11) NOT NULL COMMENT 'Identificador de la categoría',
  `name` varchar(100) NOT NULL COMMENT 'Nombre de la categoría'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id_category`, `name`) VALUES
(1, 'Librería'),
(2, 'Electrónica'),
(3, 'Papelería');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `suppliers`
--

CREATE TABLE `suppliers` (
  `id_supplier` int(11) NOT NULL COMMENT 'Identificador del proveedor',
  `name` varchar(100) NOT NULL COMMENT 'Nombre del proveedor'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `suppliers`
--

INSERT INTO `suppliers` (`id_supplier`, `name`) VALUES
(1, 'Proveedor A'),
(2, 'Proveedor B'),
(3, 'Proveedor C');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `role` varchar(20) NOT NULL DEFAULT 'admin'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `role`) VALUES
(1, 'admin', '$2y$10$Glz0R19/SGuvK3CQZ7Atle/WYw7DJBND.rz0cNXL0jCkr7r4.IEiG', 'admin@sgt.com', 'admin');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id_article`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `id_category` (`id_category`,`id_supplier`);

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id_category`);

--
-- Indices de la tabla `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id_supplier`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `articles`
--
ALTER TABLE `articles`
  MODIFY `id_article` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador único del artículo', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `id_category` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la categoría', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id_supplier` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del proveedor', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
