<?php
include '../includes/conn.php';

$id = $_GET['id'] ?? null;
if (!$id) {
    echo json_encode(null);
    exit;
}

$stmt = $conn->prepare("SELECT * FROM clients WHERE id_client = ?");
$stmt->execute([$id]);
$client = $stmt->fetch(PDO::FETCH_ASSOC);

echo json_encode($client);
?>
