<?php
include '../includes/conn.php';

if (isset($_GET['id'])) {
    $id = (int) $_GET['id'];

    $stmt = $conn->prepare("SELECT * FROM suppliers WHERE id_supplier = ?");
    $stmt->execute([$id]);
    $supplier = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($supplier) {
        echo json_encode($supplier);
    } else {
        echo json_encode(null);
    }
}
