<?php
include '../includes/conn.php';

$id_stock = intval($_POST['id_stock']);
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
    $sql = "UPDATE stock SET 
            name=:name,
            code=:code,
            cost_price=:cost_price,
            sale_price=:sale_price,
            stock=:stock,
            min_stock=:min_stock,
            brand=:brand,
            vat=:vat,
            id_category=:id_category,
            id_supplier=:id_supplier";

    if($photo_path) $sql .= ", photo=:photo";

    $sql .= " WHERE id_stock=:id_stock";

    $stmt = $conn->prepare($sql);

    $params = [
        ':name'=>$name,
        ':code'=>$code,
        ':cost_price'=>$cost_price,
        ':sale_price'=>$sale_price,
        ':stock'=>$stock_val,
        ':min_stock'=>$min_stock,
        ':brand'=>$brand,
        ':vat'=>$vat,
        ':id_category'=>$id_category,
        ':id_supplier'=>$id_supplier,
        ':id_stock'=>$id_stock
    ];

    if($photo_path) $params[':photo']=$photo_path;

    $stmt->execute($params);

    header('Location: ../stock.php');
    exit;

} catch(PDOException $e){
    die("Error al editar: ".$e->getMessage());
}
?>
