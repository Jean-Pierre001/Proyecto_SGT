<?php
include '../includes/conn.php';

if (isset($_GET['id'])) {
    try {
        $id = (int) $_GET['id'];

        $stmt = $conn->prepare("DELETE FROM suppliers WHERE id_supplier = ?");
        $stmt->execute([$id]);

        header("Location: ../suppliers.php?msg=Proveedor eliminado correctamente");
        exit;
    } catch (Exception $e) {
        die("Error al eliminar proveedor: " . $e->getMessage());
    }
}
