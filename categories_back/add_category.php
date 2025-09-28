<?php
include '../includes/conn.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Recibir y limpiar datos del formulario
    $categoryName = trim($_POST['category_name'] ?? '');
    $categoryDescription = trim($_POST['category_description'] ?? '');
    $parentId = isset($_POST['parent_id']) && $_POST['parent_id'] !== '' ? (int)$_POST['parent_id'] : null;

    if ($categoryName === '') {
        // Redirigir de vuelta con error si el nombre está vacío
        header("Location: ../categories.php?error=El nombre de la categoría es obligatorio");
        exit;
    }

    try {
        // Preparar la consulta
        $stmt = $conn->prepare("
            INSERT INTO categories (category_name, category_description, parent_id, created_at, updated_at) 
            VALUES (:category_name, :category_description, :parent_id, NOW(), NOW())
        ");

        // Ejecutar con parámetros
        $stmt->execute([
            ':category_name' => $categoryName,
            ':category_description' => $categoryDescription,
            ':parent_id' => $parentId
        ]);

        // Redirigir con éxito
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
