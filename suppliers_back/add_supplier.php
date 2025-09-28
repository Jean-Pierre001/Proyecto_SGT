<?php
include '../includes/conn.php';

$name = $_POST['name'] ?? '';
$contact_name = $_POST['contact_name'] ?? '';
$phone = $_POST['phone'] ?? '';
$email = $_POST['email'] ?? '';
$address = $_POST['address'] ?? '';
$tax_id = $_POST['tax_id'] ?? '';
$payment_terms = $_POST['payment_terms'] ?? '';
$notes = $_POST['notes'] ?? '';

try {
    $stmt = $conn->prepare("INSERT INTO suppliers (name, contact_name, phone, email, address, tax_id, payment_terms, notes) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
    $stmt->execute([$name, $contact_name, $phone, $email, $address, $tax_id, $payment_terms, $notes]);

    header("Location: ../suppliers.php");
} catch(PDOException $e) {
    echo "Error al agregar proveedor: " . $e->getMessage();
}
