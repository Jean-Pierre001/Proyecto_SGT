<?php
include '../includes/conn.php';

$id_article = filter_input(INPUT_POST, 'id_article', FILTER_SANITIZE_NUMBER_INT);
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
$photo_path = null;
if(isset($_FILES['photo']) && $_FILES['photo']['tmp_name']){
    $target_dir = "../uploads/";
    $photo_path = $target_dir . basename($_FILES['photo']['name']);
    move_uploaded_file($_FILES['photo']['tmp_name'], $photo_path);
}

// Actualizar en la DB
$sql = "UPDATE articles SET name=:name, code=:code, cost_price=:cost_price, sale_price=:sale_price,
        stock=:stock, min_stock=:min_stock, brand=:brand, vat=:vat,
        id_category=:id_category, id_supplier=:id_supplier";

if($photo_path) $sql .= ", photo=:photo";

$sql .= " WHERE id_article=:id_article";

$stmt = $conn->prepare($sql);
$stmt->bindParam(':name', $name);
$stmt->bindParam(':code', $code);
$stmt->bindParam(':cost_price', $cost_price);
$stmt->bindParam(':sale_price', $sale_price);
$stmt->bindParam(':stock', $stock);
$stmt->bindParam(':min_stock', $min_stock);
$stmt->bindParam(':brand', $brand);
$stmt->bindParam(':vat', $vat);
$stmt->bindParam(':id_category', $id_category);
$stmt->bindParam(':id_supplier', $id_supplier);
$stmt->bindParam(':id_article', $id_article);

if($photo_path) $stmt->bindParam(':photo', $photo_path);

$stmt->execute();

header("Location: ../articles.php");
exit;
?>
