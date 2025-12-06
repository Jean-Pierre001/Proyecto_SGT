<?php
include '../../includes/conn.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id = $_POST['id_category'] ?? '';
    $name = trim($_POST['name'] ?? '');
    $description = trim($_POST['description'] ?? '');
    $parent_id = $_POST['parent_id'] ?? null;

    if ($id === '' || $name === '') {
        header('Location: ../../categories.php?error=Datos inválidos');
        exit;
    }

    if ($parent_id === '') {
        $parent_id = null;
    }

    try {
        $stmt = $conn->prepare("
            UPDATE categories 
            SET name = :name, description = :description, parent_id = :parent_id
            WHERE id_category = :id
        ");

        $stmt->execute([
            ':name' => $name,
            ':description' => $description !== '' ? $description : null,
            ':parent_id' => $parent_id,
            ':id' => $id
        ]);

        header('Location: ../../categories.php?msg=Categoría actualizada');
        exit;

    } catch (PDOException $e) {
        header('Location: ../../categories.php?error=Error al actualizar categoría');
        exit;
    }
}
