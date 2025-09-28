<?php
include '../includes/conn.php';

header('Content-Type: application/json');

if (!isset($_GET['id'])) {
    echo json_encode(['success' => false, 'message' => 'ID no especificado']);
    exit;
}

$id = (int)$_GET['id'];

    $stmt = $conn->prepare("DELETE FROM stock WHERE id_stock = :id");
    $stmt->execute([':id' => $id]);

    header('Location: ../stock.php');
    exit;
