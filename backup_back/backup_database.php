<?php
require '../includes/conn.php';

try {
    $backupFile = 'backup_' . date('Y-m-d_H-i-s') . '.sql';
    $sqlDump = "";

    // Encabezado estilo phpMyAdmin
    $sqlDump .= "-- phpMyAdmin SQL Dump\n";
    $sqlDump .= "-- version 5.x\n";
    $sqlDump .= "-- https://www.phpmyadmin.net/\n--\n";
    $sqlDump .= "-- Host: localhost\n";
    $sqlDump .= "-- Generation Time: " . date('M d, Y \a\t H:i') . "\n";
    $sqlDump .= "-- Server version: " . $conn->getAttribute(PDO::ATTR_SERVER_VERSION) . "\n";
    $sqlDump .= "-- PHP Version: " . phpversion() . "\n\n";
    $sqlDump .= "SET SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO';\n";
    $sqlDump .= "START TRANSACTION;\n";
    $sqlDump .= "SET time_zone = '+00:00';\n\n";
    $sqlDump .= "/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;\n";
    $sqlDump .= "/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;\n";
    $sqlDump .= "/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;\n";
    $sqlDump .= "/*!40101 SET NAMES utf8mb4 */;\n\n";

    // Desactivar restricciones mientras se exporta
    $sqlDump .= "SET FOREIGN_KEY_CHECKS=0;\n\n";

    // Obtener todas las tablas en orden que respete las dependencias
    $tables = $conn->query("SHOW FULL TABLES WHERE Table_Type = 'BASE TABLE'")->fetchAll(PDO::FETCH_COLUMN);

    foreach ($tables as $table) {
        $sqlDump .= "-- --------------------------------------------------------\n\n";
        $sqlDump .= "-- Estructura de tabla para la tabla `$table`\n\n";
        $sqlDump .= "DROP TABLE IF EXISTS `$table`;\n";

        // Crear tabla con sus constraints reales
        $create = $conn->query("SHOW CREATE TABLE `$table`")->fetch(PDO::FETCH_ASSOC);
        $sqlDump .= $create['Create Table'] . ";\n\n";

        // Insertar datos
        $rows = $conn->query("SELECT * FROM `$table`")->fetchAll(PDO::FETCH_ASSOC);
        if ($rows) {
            $sqlDump .= "-- Volcado de datos para la tabla `$table`\n\n";
            $sqlDump .= "LOCK TABLES `$table` WRITE;\n";
            $sqlDump .= "/*!40000 ALTER TABLE `$table` DISABLE KEYS */;\n";
            foreach ($rows as $row) {
                $values = array_map(function ($v) use ($conn) {
                    return is_null($v) ? "NULL" : $conn->quote($v);
                }, array_values($row));
                $sqlDump .= "INSERT INTO `$table` VALUES (" . implode(", ", $values) . ");\n";
            }
            $sqlDump .= "/*!40000 ALTER TABLE `$table` ENABLE KEYS */;\n";
            $sqlDump .= "UNLOCK TABLES;\n\n";
        }
    }

    $sqlDump .= "SET FOREIGN_KEY_CHECKS=1;\n\n";
    $sqlDump .= "COMMIT;\n";
    $sqlDump .= "/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;\n";
    $sqlDump .= "/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;\n";
    $sqlDump .= "/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;\n";

    // Guardar y forzar descarga
    file_put_contents($backupFile, $sqlDump);
    header('Content-Description: File Transfer');
    header('Content-Type: application/sql');
    header('Content-Disposition: attachment; filename="' . basename($backupFile) . '"');
    header('Content-Length: ' . filesize($backupFile));
    readfile($backupFile);
    unlink($backupFile);
    exit;

} catch (PDOException $e) {
    die("❌ Error al generar backup: " . $e->getMessage());
}
?>
