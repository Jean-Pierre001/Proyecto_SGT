<?php
include '../includes/conn.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Obtener y sanear datos
    $id_client = filter_input(INPUT_POST, 'id_client', FILTER_VALIDATE_INT);
    $full_name = $_POST['full_name'] ?? '';
    $address = $_POST['address'] ?? '';
    $city = $_POST['city'] ?? '';
    $document_type = $_POST['document_type'] ?? '';
    $document_number = $_POST['document_number'] ?? '';
    $phone = $_POST['phone'] ?? '';
    $mobile = $_POST['mobile'] ?? '';
    $cuit = $_POST['cuit'] ?? '';
    $status = $_POST['status'] ?? '';
    $client_type = $_POST['client_type'] ?? '';
    $tax_responsibility = $_POST['tax_responsibility'] ?? '';
    $company = $_POST['company'] ?? '';
    $contact_person = $_POST['contact_person'] ?? '';
    $email = $_POST['email'] ?? '';
    $price_list = $_POST['price_list'] ?? '';

    if ($id_client) {
        try {
            $stmt = $conn->prepare("UPDATE clients SET 
                full_name=?, address=?, city=?, document_type=?, document_number=?, phone=?, mobile=?, cuit=?, status=?, client_type=?, tax_responsibility=?, company=?, contact_person=?, email=?, price_list=?
                WHERE id_client=?");

            $stmt->execute([
                $full_name, $address, $city, $document_type, $document_number, $phone, $mobile, $cuit, $status, $client_type, $tax_responsibility, $company, $contact_person, $email, $price_list, $id_client
            ]);
        } catch (PDOException $e) {
            echo "Error al actualizar cliente: " . $e->getMessage();
            exit;
        }
    }
}

header('Location: ../clients.php');
exit;
?>
