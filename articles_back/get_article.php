<?php
include '../includes/conn.php';

if(isset($_GET['id'])) {
    $id = intval($_GET['id']);
    $stmt = $conn->prepare("
        SELECT a.*, c.name AS category_name, s.name AS supplier_name
        FROM articles a
        LEFT JOIN categories c ON a.id_category = c.id_category
        LEFT JOIN suppliers s ON a.id_supplier = s.id_supplier
        WHERE a.id_article = ?
    ");
    $stmt->execute([$id]);
    $article = $stmt->fetch(PDO::FETCH_ASSOC);

    header('Content-Type: application/json'); // Muy importante
    echo json_encode($article);
}
