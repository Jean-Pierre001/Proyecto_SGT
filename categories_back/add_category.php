<?php
include '../includes/conn.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $name = trim($_POST['name'] ?? '');
    $description = trim($_POST['description'] ?? '');

    if ($name === '') {
        // Redirigir de vuelta con error si el nombre está vacío
        header("Location: ../categories.php?error=El nombre es obligatorio");
        exit;
    }

    try {
        $stmt = $conn->prepare("INSERT INTO categories (name, description) VALUES (:name, :description)");
        $stmt->execute([
            ':name' => $name,
            ':description' => $description
        ]);

        header("Location: ../categories.php?success=Categoría agregada correctamente");
        exit;
    } catch (PDOException $e) {
        // Manejo de error
        header("Location: ../categories.php?error=Error al agregar categoría");
        exit;
    }
} else {
    header("Location: ../categories.php");
    exit;
}
