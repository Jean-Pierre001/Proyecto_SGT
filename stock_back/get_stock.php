<?php
include '../includes/conn.php';

$id = filter_input(INPUT_GET, 'id', FILTER_VALIDATE_INT);

$stmt = $conn->prepare("SELECT s.*, c.name AS category_name, p.name AS supplier_name FROM stock s LEFT JOIN categories c ON s.id_category=c.id_category LEFT JOIN suppliers p ON s.id_supplier=p.id_supplier WHERE id_stock=?");
$stmt->execute([$id]);
$stock = $stmt->fetch(PDO::FETCH_ASSOC);

header('Content-Type: application/json');
echo json_encode($stock);
