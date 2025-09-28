<?php
include '../includes/conn.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Recibir y limpiar datos
    $parentId = isset($_POST['parent_id']) ? (int)$_POST['parent_id'] : 0;
    $categoryName = trim($_POST['category_name'] ?? '');
    $categoryDescription = trim($_POST['category_description'] ?? '');

    // Validación
    if ($parentId <= 0 || $categoryName === '') {
        header("Location: ../categories.php?error=El nombre y el padre son obligatorios");
        exit;
    }

    try {
        // Insertar subcategoría
        $stmt = $conn->prepare("
            INSERT INTO categories (category_name, category_description, parent_id, created_at, updated_at)
            VALUES (:category_name, :category_description, :parent_id, NOW(), NOW())
        ");
        $stmt->execute([
            ':category_name' => $categoryName,
            ':category_description' => $categoryDescription,
            ':parent_id' => $parentId
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
