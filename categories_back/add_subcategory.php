<?php
include '../includes/conn.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $parent_id = intval($_POST['parent_id'] ?? 0);
    $name = trim($_POST['name'] ?? '');
    $description = trim($_POST['description'] ?? '');

    if ($parent_id <= 0 || $name === '') {
        header("Location: ../categories.php?error=Todos los campos son obligatorios");
        exit;
    }

    try {
        $stmt = $conn->prepare("INSERT INTO categories (name, description, parent_id) VALUES (:name, :description, :parent_id)");
        $stmt->execute([
            ':name' => $name,
            ':description' => $description,
            ':parent_id' => $parent_id
        ]);

        header("Location: ../categories.php?success=Subcategoría creada correctamente");
        exit;
    } catch (PDOException $e) {
        header("Location: ../categories.php?error=Error al crear subcategoría");
        exit;
    }
} else {
    header("Location: ../categories.php");
    exit;
}
