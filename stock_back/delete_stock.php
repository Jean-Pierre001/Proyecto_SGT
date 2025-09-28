<?php
include '../includes/conn.php';

$id = filter_input(INPUT_GET, 'id', FILTER_VALIDATE_INT);

try{
    $stmt = $conn->prepare("DELETE FROM stock WHERE id_stock=?");
    $stmt->execute([$id]);
    header('Location: ../stock.php?deleted=1');
}catch(PDOException $e){
    die("Error: " . $e->getMessage());
}
