<?php
include '../includes/conn.php';

// Obtener el ID del cliente y sanearlo como entero
$id = filter_input(INPUT_GET, 'id', FILTER_VALIDATE_INT);

if ($id) {
    try {
        $stmt = $conn->prepare("DELETE FROM clients WHERE id_client = ?");
        $stmt->execute([$id]);
    } catch (PDOException $e) {
        echo "Error al eliminar cliente: " . $e->getMessage();
        exit;
    }
}

header('Location: ../clients.php');
exit;
?>
