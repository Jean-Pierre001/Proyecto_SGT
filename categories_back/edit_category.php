<?php
require '../includes/db.php'; // Ajusta ruta a tu conexión
session_start();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id          = intval($_POST['id_category']);
    $name        = trim($_POST['name']);
    $description = !empty($_POST['description']) ? trim($_POST['description']) : null;
    $parent_id   = !empty($_POST['parent_id']) ? intval($_POST['parent_id']) : null;

    try {
        // 🚨 Validación: no permitir que el nombre ya exista en otra categoría (excepto la misma)
        $check = $conn->prepare("SELECT id_category FROM categories WHERE name = ? AND id_category != ?");
        $check->execute([$name, $id]);

        if ($check->fetch()) {
            $_SESSION['error'] = "Ya existe otra categoría con ese nombre.";
            header("Location: ../categories.php");
            exit;
        }

        // 🚨 Validación: evitar que una categoría sea su propio padre
        if ($parent_id === $id) {
            $_SESSION['error'] = "Una categoría no puede ser su propio padre.";
            header("Location: ../categories.php");
            exit;
        }

        // Actualizar
        $stmt = $conn->prepare("
            UPDATE categories
            SET name = ?, description = ?, parent_id = ?, updated_at = NOW()
            WHERE id_category = ?
        ");

        $stmt->execute([$name, $description, $parent_id, $id]);

        $_SESSION['success'] = "Categoría actualizada correctamente.";
        header("Location: ../categories.php");
        exit;

    } catch (PDOException $e) {
        $_SESSION['error'] = "Error al actualizar categoría: " . $e->getMessage();
        header("Location: ../categories.php");
        exit;
    }
}
