<?php
include '../../includes/conn.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id = $_POST['id_category'] ?? '';

    if ($id === '') {
        header('Location: ../../categories.php?error=ID inválido');
        exit;
    }

    try {
        $stmt = $conn->prepare("DELETE FROM categories WHERE id_category = ?");
        $stmt->execute([$id]);

        header('Location: ../../categories.php?msg=Categoría eliminada');
        exit;

    } catch (PDOException $e) {
        header('Location: ../../categories.php?error=No se puede eliminar (puede tener relaciones)');
        exit;
    }
}
