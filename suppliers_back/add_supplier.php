<?php
include '../includes/conn.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    try {
        $name         = trim($_POST['name']);
        $contact_name = $_POST['contact_name'] ?: null;
        $phone        = $_POST['phone'] ?: null;
        $email        = $_POST['email'] ?: null;
        $address      = $_POST['address'] ?: null;

        $stmt = $conn->prepare("INSERT INTO suppliers (name, contact_name, phone, email, address) VALUES (?, ?, ?, ?, ?)");
        $stmt->execute([$name, $contact_name, $phone, $email, $address]);

        header("Location: ../suppliers.php?msg=Proveedor agregado correctamente");
        exit;
    } catch (Exception $e) {
        die("Error al agregar proveedor: " . $e->getMessage());
    }
}
