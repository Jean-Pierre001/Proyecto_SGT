<?php
include '../../includes/conn.php';

$id = (int)($_POST['id_product'] ?? 0);
$status = $_POST['status'] ?? 'Activo';

if ($id <= 0) {
    header('Location: ../../products.php');
    exit;
}

$stmt = $conn->prepare("UPDATE products SET status = ? WHERE id_product = ?");
$stmt->execute([$status, $id]);

header('Location: ../../products.php');
