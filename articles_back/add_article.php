<?php
include '../includes/conn.php';

$name = $_POST['name'];
$sale_price = $_POST['sale_price'];
$stock = $_POST['stock'];
$id_category = !empty($_POST['id_category']) ? $_POST['id_category'] : null;
$id_supplier = !empty($_POST['id_supplier']) ? $_POST['id_supplier'] : null;

try {
    $stmt = $conn->prepare("
        INSERT INTO articles (name, sale_price, stock, id_category, id_supplier)
        VALUES (:name, :sale_price, :stock, :id_category, :id_supplier)
    ");
    $stmt->execute([
        ':name' => $name,
        ':sale_price' => $sale_price,
        ':stock' => $stock,
        ':id_category' => $id_category,
        ':id_supplier' => $id_supplier
    ]);

    header("Location: ../articles.php");
    exit;

} catch(PDOException $e){
    die("❌ Error al guardar: " . $e->getMessage());
}
?>
