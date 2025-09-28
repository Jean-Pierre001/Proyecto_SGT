-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-09-2025 a las 18:56:16
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
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `id_category` int(11) NOT NULL COMMENT 'Identificador único de la categoría',
  `name` varchar(100) NOT NULL COMMENT 'Nombre de la categoría (ej: Notebooks, Backpacks)',
  `description` text DEFAULT NULL COMMENT 'Descripción opcional de la categoría',
  `parent_id` int(11) DEFAULT NULL COMMENT 'Permite crear subcategorías (auto-relación con id_category)',
  `created_at` datetime NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de creación',
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp() COMMENT 'Fecha de última modificación'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id_category`, `name`, `description`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 'Electrónica', 'Dispositivos electrónicos en general', NULL, '2025-09-28 13:16:08', NULL),
(2, 'Informática', 'Productos de computación y accesorios', NULL, '2025-09-28 13:16:08', NULL),
(3, 'Indumentaria', 'Ropa y accesorios de vestir', NULL, '2025-09-28 13:16:08', NULL),
(4, 'Alimentos', 'Productos alimenticios y bebidas', NULL, '2025-09-28 13:16:08', NULL),
(5, 'oscar', 'dsadas', 4, '2025-09-28 13:23:42', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clients`
--

CREATE TABLE `clients` (
  `id_client` int(11) NOT NULL COMMENT 'Identificador único del cliente',
  `full_name` varchar(100) NOT NULL COMMENT 'Nombre y apellido / Razón social',
  `address` varchar(150) DEFAULT NULL COMMENT 'Dirección del cliente',
  `city` varchar(100) DEFAULT NULL COMMENT 'Ciudad/localidad',
  `document_type` enum('DNI','CUIT','Otro') DEFAULT NULL COMMENT 'Tipo de documento',
  `document_number` varchar(20) DEFAULT NULL COMMENT 'Número de documento',
  `phone` varchar(20) DEFAULT NULL COMMENT 'Teléfono fijo',
  `mobile` varchar(20) DEFAULT NULL COMMENT 'Teléfono móvil',
  `cuit` varchar(20) DEFAULT NULL COMMENT 'CUIT en caso de empresas o clientes registrados',
  `status` varchar(20) DEFAULT NULL COMMENT 'Estado del cliente (activo/inactivo)',
  `client_type` enum('Ocasional','Permanente') DEFAULT NULL COMMENT 'Clasificación del cliente',
  `tax_responsibility` varchar(50) DEFAULT NULL COMMENT 'Responsabilidad ante IVA (Consumidor Final, Responsable Inscripto, etc.)',
  `company` varchar(100) DEFAULT NULL COMMENT 'Nombre de la empresa (si aplica)',
  `contact_person` varchar(100) DEFAULT NULL COMMENT 'Persona de contacto',
  `email` varchar(100) DEFAULT NULL COMMENT 'Correo electrónico',
  `price_list` varchar(50) DEFAULT NULL COMMENT 'Lista de precios asignada (ej: con descuento, sin descuento)',
  `credit_limit` decimal(10,2) DEFAULT 0.00 COMMENT 'Límite de crédito asignado al cliente',
  `notes` text DEFAULT NULL COMMENT 'Observaciones adicionales del cliente',
  `created_at` datetime NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de creación',
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp() COMMENT 'Fecha de última modificación'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clients`
--

INSERT INTO `clients` (`id_client`, `full_name`, `address`, `city`, `document_type`, `document_number`, `phone`, `mobile`, `cuit`, `status`, `client_type`, `tax_responsibility`, `company`, `contact_person`, `email`, `price_list`, `credit_limit`, `notes`, `created_at`, `updated_at`) VALUES
(1, 'Pedro González', 'Calle Falsa 123', 'Carmen de Patagones', 'DNI', '30111222', '2920-400100', '2920-600200', NULL, 'Activo', 'Ocasional', 'Consumidor Final', NULL, NULL, 'pedro.gonzalez@mail.com', 'Lista General', 5000.00, NULL, '2025-09-28 13:16:08', NULL),
(2, 'Empresa Patagónica S.R.L.', 'Av. Mitre 850', 'Viedma', 'CUIT', '30-11223344-5', '2920-440500', NULL, '30-11223344-5', 'Activo', 'Permanente', 'Responsable Inscripto', 'Empresa Patagónica S.R.L.', 'Laura Torres', 'contacto@patagonica.com', 'Lista Empresa', 25000.00, NULL, '2025-09-28 13:16:08', NULL),
(3, 'Ana Martínez', '9 de Julio 200', 'Bahía Blanca', 'DNI', '27999888', NULL, '291-555888', NULL, 'Activo', 'Ocasional', 'Consumidor Final', NULL, NULL, 'ana.martinez@gmail.com', 'Lista General', 3000.00, NULL, '2025-09-28 13:16:08', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stock`
--

CREATE TABLE `stock` (
  `id_stock` int(11) NOT NULL COMMENT 'Identificador único del producto',
  `name` varchar(100) NOT NULL COMMENT 'Nombre del producto',
  `id_category` int(11) NOT NULL COMMENT 'Relación con la categoría (rubro)',
  `id_supplier` int(11) NOT NULL COMMENT 'Relación con el proveedor',
  `code` varchar(20) DEFAULT NULL COMMENT 'Código interno del producto',
  `barcode` varchar(50) DEFAULT NULL COMMENT 'Código de barras del producto',
  `description` text DEFAULT NULL COMMENT 'Descripción del producto',
  `brand` varchar(50) DEFAULT NULL COMMENT 'Marca del producto',
  `cost_price` decimal(10,2) DEFAULT NULL COMMENT 'Precio de compra',
  `sale_price` decimal(10,2) DEFAULT NULL COMMENT 'Precio de venta final',
  `stock` decimal(10,2) DEFAULT NULL COMMENT 'Cantidad actual en stock',
  `min_stock` decimal(10,2) DEFAULT NULL COMMENT 'Nivel mínimo para alertar reposición',
  `vat` decimal(5,2) DEFAULT 21.00 COMMENT 'Porcentaje de IVA aplicado',
  `photo` varchar(255) DEFAULT NULL COMMENT 'Ruta de la foto del producto',
  `status` enum('Activo','Inactivo') DEFAULT 'Activo' COMMENT 'Estado del producto',
  `created_at` datetime NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de creación',
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp() COMMENT 'Fecha de última modificación'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `stock`
--

INSERT INTO `stock` (`id_stock`, `name`, `id_category`, `id_supplier`, `code`, `barcode`, `description`, `brand`, `cost_price`, `sale_price`, `stock`, `min_stock`, `vat`, `photo`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Notebook HP 14\"', 2, 1, 'NBHP14', '7791234567890', 'Notebook HP 14 pulgadas con 8GB RAM y 256GB SSD', 'HP', 350000.00, 420000.00, 10.00, 2.00, 21.00, 'notebook_hp14.jpg', 'Activo', '2025-09-28 13:16:08', NULL),
(2, 'Mouse Logitech M90', 2, 2, 'MOUSEM90', '7790987654321', 'Mouse óptico USB Logitech M90', 'Logitech', 2000.00, 3500.00, 50.00, 10.00, 21.00, 'mouse_logitech_m90.jpg', 'Activo', '2025-09-28 13:16:08', NULL),
(3, 'Camisa Hombre Slim Fit', 3, 3, 'CAMH001', '7792223334445', 'Camisa de hombre manga larga, slim fit, color celeste', 'Levis', 8000.00, 12500.00, 25.00, 5.00, 21.00, 'camisa_slimfit.jpg', 'Activo', '2025-09-28 13:16:08', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `suppliers`
--

CREATE TABLE `suppliers` (
  `id_supplier` int(11) NOT NULL COMMENT 'Identificador único del proveedor',
  `name` varchar(100) NOT NULL COMMENT 'Nombre o razón social del proveedor',
  `contact_name` varchar(100) DEFAULT NULL COMMENT 'Nombre de la persona de contacto',
  `phone` varchar(20) DEFAULT NULL COMMENT 'Teléfono del proveedor',
  `email` varchar(100) DEFAULT NULL COMMENT 'Correo electrónico de contacto',
  `address` varchar(255) DEFAULT NULL COMMENT 'Dirección del proveedor',
  `tax_id` varchar(20) DEFAULT NULL COMMENT 'CUIT o identificación fiscal',
  `payment_terms` varchar(50) DEFAULT NULL COMMENT 'Condiciones de pago (ej: contado, 30 días)',
  `notes` text DEFAULT NULL COMMENT 'Observaciones adicionales del proveedor',
  `created_at` datetime NOT NULL DEFAULT current_timestamp() COMMENT 'Fecha de creación',
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp() COMMENT 'Fecha de última modificación'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `suppliers`
--

INSERT INTO `suppliers` (`id_supplier`, `name`, `contact_name`, `phone`, `email`, `address`, `tax_id`, `payment_terms`, `notes`, `created_at`, `updated_at`) VALUES
(1, 'Proveedor Global S.A.', 'Juan Pérez', '011-4567890', 'contacto@proveedorglobal.com', 'Av. Siempre Viva 742, CABA', '30-12345678-9', '30 días', NULL, '2025-09-28 13:16:08', NULL),
(2, 'Distribuidora Norte', 'María Gómez', '02920-432100', 'ventas@distribuidoranorte.com', 'Belgrano 123, Viedma', '20-87654321-0', 'Contado', NULL, '2025-09-28 13:16:08', NULL),
(3, 'Mayorista Sur', 'Carlos López', '02920-555111', 'info@mayoristasur.com', 'Rivadavia 950, Bahía Blanca', '30-55544433-2', '15 días', NULL, '2025-09-28 13:16:08', NULL);

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
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id_category`),
  ADD KEY `fk_parent_category` (`parent_id`);

--
-- Indices de la tabla `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id_client`);

--
-- Indices de la tabla `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`id_stock`),
  ADD KEY `fk_stock_category` (`id_category`),
  ADD KEY `fk_stock_supplier` (`id_supplier`);

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
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `id_category` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador único de la categoría', AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `clients`
--
ALTER TABLE `clients`
  MODIFY `id_client` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador único del cliente', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `stock`
--
ALTER TABLE `stock`
  MODIFY `id_stock` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador único del producto', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id_supplier` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador único del proveedor', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `fk_parent_category` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id_category`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `fk_stock_category` FOREIGN KEY (`id_category`) REFERENCES `categories` (`id_category`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_stock_supplier` FOREIGN KEY (`id_supplier`) REFERENCES `suppliers` (`id_supplier`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
