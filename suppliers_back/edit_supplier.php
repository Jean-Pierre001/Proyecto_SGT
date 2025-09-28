<?php
include '../includes/conn.php';

$id_supplier = $_POST['id_supplier'] ?? '';
$name = $_POST['name'] ?? '';
$contact_name = $_POST['contact_name'] ?? '';
$phone = $_POST['phone'] ?? '';
$email = $_POST['email'] ?? '';
$address = $_POST['address'] ?? '';
$tax_id = $_POST['tax_id'] ?? '';
$payment_terms = $_POST['payment_terms'] ?? '';
$notes = $_POST['notes'] ?? '';

try {
    $stmt = $conn->prepare("UPDATE suppliers SET name=?, contact_name=?, phone=?, email=?, address=?, tax_id=?, payment_terms=?, notes=? WHERE id_supplier=?");
    $stmt->execute([$name, $contact_name, $phone, $email, $address, $tax_id, $payment_terms, $notes, $id_supplier]);

    header("Location: ../suppliers.php");
} catch(PDOException $e) {
    echo "Error al editar proveedor: " . $e->getMessage();
}
