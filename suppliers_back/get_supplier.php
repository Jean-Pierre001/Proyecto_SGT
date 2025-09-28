<?php
include '../includes/conn.php';

$id_supplier = $_GET['id'] ?? '';

if($id_supplier){
    try {
        $stmt = $conn->prepare("SELECT * FROM suppliers WHERE id_supplier=?");
        $stmt->execute([$id_supplier]);
        $supplier = $stmt->fetch(PDO::FETCH_ASSOC);

        echo json_encode($supplier);
    } catch(PDOException $e) {
        echo json_encode(null);
    }
} else {
    echo json_encode(null);
}
