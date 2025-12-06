<?php
include '../../includes/conn.php';

$id = (int)($_POST['id_product'] ?? 0);

if ($id <= 0) {
    header('Location: ../../products.php?error=ID inválido');
    exit;
}

$stmt = $conn->prepare("DELETE FROM products WHERE id_product = ?");
$stmt->execute([$id]);

header('Location: ../../products.php?ok=deleted');
