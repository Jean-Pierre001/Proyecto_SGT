<?php
include '../includes/conn.php';

$id_supplier = $_GET['id'] ?? '';

if($id_supplier){
    try {
        $stmt = $conn->prepare("DELETE FROM suppliers WHERE id_supplier=?");
        $stmt->execute([$id_supplier]);
        header("Location: ../suppliers.php");
    } catch(PDOException $e) {
        echo "Error al eliminar proveedor: " . $e->getMessage();
    }
} else {
    echo "ID de proveedor no válido.";
}
