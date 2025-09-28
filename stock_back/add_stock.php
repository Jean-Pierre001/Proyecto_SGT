<?php
include '../includes/conn.php';

$name = $_POST['name'] ?? '';
$code = $_POST['code'] ?? null;
$cost_price = $_POST['cost_price'] ?? null;
$sale_price = $_POST['sale_price'] ?? null;
$stock_val = $_POST['stock'] ?? null;
$min_stock = $_POST['min_stock'] ?? null;
$brand = $_POST['brand'] ?? null;
$vat = $_POST['vat'] ?? 21.00;
$id_category = $_POST['id_category'] ?? null;
$id_supplier = $_POST['id_supplier'] ?? null;

// Foto
$photo_path = null;
if(isset($_FILES['photo']) && $_FILES['photo']['error'] === UPLOAD_ERR_OK){
    $uploadDir = '../assets/images/';
    $filename = time().'_'.basename($_FILES['photo']['name']);
    $targetFile = $uploadDir.$filename;
    if(move_uploaded_file($_FILES['photo']['tmp_name'], $targetFile)){
        $photo_path = 'assets/images/'.$filename;
    }
}

try {
    $stmt = $conn->prepare("
        INSERT INTO stock
        (name, code, cost_price, sale_price, stock, min_stock, brand, vat, photo, id_category, id_supplier)
        VALUES
        (:name, :code, :cost_price, :sale_price, :stock, :min_stock, :brand, :vat, :photo, :id_category, :id_supplier)
    ");

    $stmt->execute([
        ':name'=>$name,
        ':code'=>$code,
        ':cost_price'=>$cost_price,
        ':sale_price'=>$sale_price,
        ':stock'=>$stock_val,
        ':min_stock'=>$min_stock,
        ':brand'=>$brand,
        ':vat'=>$vat,
        ':photo'=>$photo_path,
        ':id_category'=>$id_category,
        ':id_supplier'=>$id_supplier
    ]);

    header('Location: ../stock.php');
    exit;

} catch(PDOException $e){
    die("Error al agregar: ".$e->getMessage());
}
?>
