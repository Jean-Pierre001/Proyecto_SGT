<?php
include '../includes/conn.php';

$id = $_GET['id'] ?? null;
if ($id) {
    $stmt = $conn->prepare("DELETE FROM clients WHERE id_client = ?");
    $stmt->execute([$id]);
}

header('Location: ../clients.php');
?>
