<?php
include '../includes/conn.php';

header('Content-Type: application/json');

if(!isset($_GET['id'])) {
    echo json_encode(['error' => 'ID no proporcionado']);
    exit;
}

$id = intval($_GET['id']);

try {
    $stmt = $conn->prepare("
        SELECT a.*, c.name AS category_name, s.name AS supplier_name
        FROM stock a
        LEFT JOIN categories c ON a.id_category = c.id_category
        LEFT JOIN suppliers s ON a.id_supplier = s.id_supplier
        WHERE a.id_stock = ?
    ");
    $stmt->execute([$id]);
    $stock = $stmt->fetch(PDO::FETCH_ASSOC);

    if(!$stock) {
        echo json_encode(['error' => 'Producto no encontrado']);
        exit;
    }

    echo json_encode($stock);

} catch(PDOException $e) {
    echo json_encode(['error' => 'Error de BD: ' . $e->getMessage()]);
}
?>
