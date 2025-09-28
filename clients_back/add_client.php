<?php
include '../includes/conn.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    // Obtener y sanear todos los campos del formulario
    $full_name = filter_input(INPUT_POST, 'full_name', FILTER_SANITIZE_STRING) ?? '';
    $address = filter_input(INPUT_POST, 'address', FILTER_SANITIZE_STRING) ?? '';
    $city = filter_input(INPUT_POST, 'city', FILTER_SANITIZE_STRING) ?? '';
    $document_type = filter_input(INPUT_POST, 'document_type', FILTER_SANITIZE_STRING) ?? '';
    $document_number = filter_input(INPUT_POST, 'document_number', FILTER_SANITIZE_STRING) ?? '';
    $phone = filter_input(INPUT_POST, 'phone', FILTER_SANITIZE_STRING) ?? '';
    $mobile = filter_input(INPUT_POST, 'mobile', FILTER_SANITIZE_STRING) ?? '';
    $email = filter_input(INPUT_POST, 'email', FILTER_SANITIZE_EMAIL) ?? '';
    $cuit = filter_input(INPUT_POST, 'cuit', FILTER_SANITIZE_STRING) ?? '';
    $status = filter_input(INPUT_POST, 'status', FILTER_SANITIZE_STRING) ?? '';
    $client_type = filter_input(INPUT_POST, 'client_type', FILTER_SANITIZE_STRING) ?? '';
    $tax_responsibility = filter_input(INPUT_POST, 'tax_responsibility', FILTER_SANITIZE_STRING) ?? '';
    $company = filter_input(INPUT_POST, 'company', FILTER_SANITIZE_STRING) ?? '';
    $contact_person = filter_input(INPUT_POST, 'contact_person', FILTER_SANITIZE_STRING) ?? '';
    $price_list = filter_input(INPUT_POST, 'price_list', FILTER_SANITIZE_STRING) ?? '';
    $credit_limit = filter_input(INPUT_POST, 'credit_limit', FILTER_SANITIZE_NUMBER_FLOAT, FILTER_FLAG_ALLOW_FRACTION) ?? 0;
    $notes = filter_input(INPUT_POST, 'notes', FILTER_SANITIZE_STRING) ?? '';

    try {
        $stmt = $conn->prepare("INSERT INTO clients 
            (full_name, address, city, document_type, document_number, phone, mobile, email, cuit, status, client_type, tax_responsibility, company, contact_person, price_list, credit_limit, notes) 
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");

        $stmt->execute([
            $full_name, $address, $city, $document_type, $document_number, $phone, $mobile, $email, $cuit, $status, $client_type, $tax_responsibility, $company, $contact_person, $price_list, $credit_limit, $notes
        ]);

        header('Location: ../clients.php');
        exit;
    } catch (PDOException $e) {
        echo "Error al agregar cliente: " . $e->getMessage();
    }
}
?>
