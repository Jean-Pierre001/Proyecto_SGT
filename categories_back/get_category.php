<?php
require '../includes/db.php'; // Ajusta ruta a tu conexión

header('Content-Type: application/json');

if (!isset($_GET['id'])) {
    echo json_encode(null);
    exit;
}

$id = intval($_GET['id']);

try {
    $stmt = $conn->prepare("SELECT id_category, name, description, parent_id FROM categories WHERE id_category = ?");
    $stmt->execute([$id]);
    $category = $stmt->fetch(PDO::FETCH_ASSOC);

    echo json_encode($category ?: null);

} catch (PDOException $e) {
    echo json_encode(["error" => "Error al obtener categoría: " . $e->getMessage()]);
}
