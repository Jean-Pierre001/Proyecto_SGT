<?php
include '../includes/conn.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    try {
        $id_supplier  = (int) $_POST['id_supplier'];
        $name         = trim($_POST['name']);
        $contact_name = $_POST['contact_name'] ?: null;
        $phone        = $_POST['phone'] ?: null;
        $email        = $_POST['email'] ?: null;
        $address      = $_POST['address'] ?: null;

        $stmt = $conn->prepare("UPDATE suppliers 
            SET name = ?, contact_name = ?, phone = ?, email = ?, address = ?, updated_at = CURRENT_TIMESTAMP
            WHERE id_supplier = ?");
        $stmt->execute([$name, $contact_name, $phone, $email, $address, $id_supplier]);

        header("Location: ../suppliers.php?msg=Proveedor actualizado correctamente");
        exit;
    } catch (Exception $e) {
        die("Error al actualizar proveedor: " . $e->getMessage());
    }
}
