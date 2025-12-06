<?php
include '../../includes/conn.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $name = trim($_POST['name'] ?? '');
    $description = trim($_POST['description'] ?? '');
    $parent_id = $_POST['parent_id'] ?? null;

    if ($name === '') {
        header('Location: ../../categories.php?error=El nombre es obligatorio');
        exit;
    }

    if ($parent_id === '') {
        $parent_id = null;
    }

    try {
        $stmt = $conn->prepare("
            INSERT INTO categories (name, description, parent_id) 
            VALUES (:name, :description, :parent_id)
        ");
        $stmt->execute([
            ':name' => $name,
            ':description' => $description !== '' ? $description : null,
            ':parent_id' => $parent_id
        ]);

        header('Location: ../../categories.php?msg=Categoría creada correctamente');
        exit;

    } catch (PDOException $e) {
        header('Location: ../../categories.php?error=Error al crear categoría');
        exit;
    }
}
