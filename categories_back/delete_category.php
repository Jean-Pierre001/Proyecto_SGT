<?php
include '../includes/conn.php';

if(!isset($_GET['id']) || !is_numeric($_GET['id'])){
    header('Location: ../categories.php');
    exit;
}

$id = (int)$_GET['id'];

try {
    $conn->beginTransaction();

    // 1️⃣ Eliminar subcategorías (si existen)
    $stmt = $conn->prepare("DELETE FROM categories WHERE parent_id = :id");
    $stmt->execute([':id' => $id]);

    // 2️⃣ Eliminar la categoría principal
    $stmt = $conn->prepare("DELETE FROM categories WHERE id_category = :id");
    $stmt->execute([':id' => $id]);

    $conn->commit();
    header('Location: ../categories.php?msg=deleted');
    exit;
} catch(PDOException $e){
    $conn->rollBack();
    // Redirigir con error
    header('Location: ../categories.php?msg=error');
    exit;
}
?>
