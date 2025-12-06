<?php
include '../../includes/conn.php';

$id = (int)($_POST['id_product'] ?? 0);
if ($id <= 0) {
    header('Location: ../../products.php?error=ID invalido');
    exit;
}

$name = trim($_POST['name'] ?? '');

$sku = $_POST['sku'] ?? null;
$barcode = $_POST['barcode'] ?? null;
$id_category = $_POST['id_category'] ?: null;
$id_supplier = $_POST['id_supplier'] ?: null;
$description = $_POST['description'] ?? null;
$cost_price = $_POST['cost_price'] ?? 0;
$sale_price = $_POST['sale_price'] ?? 0;
$stock = $_POST['stock'] ?? 0;
$min_stock = $_POST['min_stock'] ?? 0;
$vat = $_POST['vat'] ?? 21.00;
$current_photo = $_POST['current_photo'] ?? null;

$photo = $current_photo;

if (!empty($_FILES['photo']['name'])) {
    $dir = '../../uploads/products/';
    if (!is_dir($dir)) mkdir($dir, 0777, true);

    $photo = uniqid() . '_' . basename($_FILES['photo']['name']);
    move_uploaded_file($_FILES['photo']['tmp_name'], $dir . $photo);
}

$stmt = $conn->prepare("
    UPDATE products SET
      name=?, sku=?, barcode=?, id_category=?, id_supplier=?, description=?,
      cost_price=?, sale_price=?, stock=?, min_stock=?, vat=?, photo=?
    WHERE id_product=?
");

$stmt->execute([
    $name, $sku, $barcode, $id_category, $id_supplier,
    $description, $cost_price, $sale_price, $stock, $min_stock, $vat, $photo, $id
]);

header('Location: ../../products.php?ok=updated');
