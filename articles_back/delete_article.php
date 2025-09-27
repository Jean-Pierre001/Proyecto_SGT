<?php
include '../includes/conn.php';

if(isset($_GET['id'])) {
    $id = intval($_GET['id']);

    // Preparar y ejecutar la eliminación
    $stmt = $conn->prepare("DELETE FROM articles WHERE id_article = ?");
    $stmt->execute([$id]);

    // Redirigir de vuelta a la lista de artículos
    header('Location: ../articles.php');
    exit;
}
?>
