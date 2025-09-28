<?php
include '../includes/conn.php';

$name = $_GET['name'] ?? '';
$category = $_GET['category'] ?? '';
$priceMin = $_GET['priceMin'] ?? '';
$priceMax = $_GET['priceMax'] ?? '';
$barcode = $_GET['barcode'] ?? '';

$sql = "SELECT s.id_stock, s.name, c.name AS category, s.brand, s.stock, s.sale_price
        FROM stock s
        LEFT JOIN categories c ON s.id_category = c.id_category
        WHERE s.status = 'Activo'";

$params = [];

if ($name) {
    $sql .= " AND s.name LIKE ?";
    $params[] = "%$name%";
}
if ($category) {
    $sql .= " AND s.id_category = ?";
    $params[] = $category;
}
if ($priceMin) {
    $sql .= " AND s.sale_price >= ?";
    $params[] = $priceMin;
}
if ($priceMax) {
    $sql .= " AND s.sale_price <= ?";
    $params[] = $priceMax;
}
if ($barcode) {
    // ✅ eliminado s.code porque puede no existir en la DB
    $sql .= " AND s.barcode LIKE ?";
    $params[] = "%$barcode%";
}

$stmt = $conn->prepare($sql);
$stmt->execute($params);
$products = $stmt->fetchAll(PDO::FETCH_ASSOC);

// ✅ No se formatean aquí: se envían puros para que JS los maneje
foreach ($products as &$p) {
    $p['sale_price'] = (float)$p['sale_price'];
    $p['stock'] = (int)$p['stock'];
}
unset($p);

header('Content-Type: application/json');
echo json_encode($products);
