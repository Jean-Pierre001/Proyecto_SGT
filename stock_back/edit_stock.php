<?php
include '../includes/conn.php';

try {
    $id_stock = filter_input(INPUT_POST, 'id_stock', FILTER_VALIDATE_INT);
    $name = filter_input(INPUT_POST, 'name', FILTER_SANITIZE_STRING);
    $code = filter_input(INPUT_POST, 'code', FILTER_SANITIZE_STRING);
    $cost_price = filter_input(INPUT_POST, 'cost_price', FILTER_VALIDATE_FLOAT);
    $sale_price = filter_input(INPUT_POST, 'sale_price', FILTER_VALIDATE_FLOAT);
    $stock = filter_input(INPUT_POST, 'stock', FILTER_VALIDATE_FLOAT);
    $min_stock = filter_input(INPUT_POST, 'min_stock', FILTER_VALIDATE_FLOAT);
    $brand = filter_input(INPUT_POST, 'brand', FILTER_SANITIZE_STRING);
    $vat = filter_input(INPUT_POST, 'vat', FILTER_VALIDATE_FLOAT);
    $id_category = filter_input(INPUT_POST, 'id_category', FILTER_VALIDATE_INT);
    $id_supplier = filter_input(INPUT_POST, 'id_supplier', FILTER_VALIDATE_INT);

    // Manejo de foto
    $photoPath = null;
    if(isset($_FILES['photo']) && $_FILES['photo']['error'] === UPLOAD_ERR_OK){
        $ext = pathinfo($_FILES['photo']['name'], PATHINFO_EXTENSION);
        $photoPath = 'uploads/' . uniqid() . '.' . $ext;
        move_uploaded_file($_FILES['photo']['tmp_name'], '../' . $photoPath);
    }

    // Construir query dinámico para no sobreescribir foto si no se sube
    $fields = "name=?, code=?, cost_price=?, sale_price=?, stock=?, min_stock=?, brand=?, vat=?, id_category=?, id_supplier=?";
    $params = [$name, $code, $cost_price, $sale_price, $stock, $min_stock, $brand, $vat, $id_category, $id_supplier];

    if($photoPath){
        $fields .= ", photo=?";
        $params[] = $photoPath;
    }

    $params[] = $id_stock;

    $stmt = $conn->prepare("UPDATE stock SET $fields WHERE id_stock=?");
    $stmt->execute($params);

    header('Location: ../stock.php?success=1');
} catch(PDOException $e){
    die("Error: " . $e->getMessage());
}
