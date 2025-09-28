<?php
include '../includes/conn.php';

// Obtener ID y validar que sea entero
$id = filter_input(INPUT_GET, 'id', FILTER_VALIDATE_INT);

if (!$id) {
    echo json_encode(null);
    exit;
}

try {
    $stmt = $conn->prepare("SELECT 
        id_client, full_name, address, city, document_type, document_number, phone, mobile, cuit, status, client_type, tax_responsibility, company, contact_person, email, price_list, credit_limit, notes, created_at, updated_at
        FROM clients 
        WHERE id_client = ?");
    $stmt->execute([$id]);
    $client = $stmt->fetch(PDO::FETCH_ASSOC);

    // Si no se encuentra el cliente, devolver null
    if (!$client) {
        echo json_encode(null);
        exit;
    }

    echo json_encode($client);

} catch (PDOException $e) {
    echo json_encode(null);
    exit;
}
?>
