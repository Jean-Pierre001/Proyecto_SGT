<?php
include '../includes/conn.php';

$client_id = $_POST['client_id'] ?? 0;
$cart = json_decode($_POST['cart'], true);

// Si es cliente ocasional (0), lo pasamos a NULL
if ($client_id == 0) {
    $client_id = null;
}

try {
    if (!$cart || !is_array($cart)) {
        throw new Exception("Carrito inválido");
    }

    $conn->beginTransaction();

    // Insertar venta
    $stmt = $conn->prepare("INSERT INTO sales (id_client, total) VALUES (?, 0)");
    $stmt->execute([$client_id]);
    $sale_id = $conn->lastInsertId();

    $total = 0;

    foreach ($cart as $item) {
        // Validar producto y stock real
        $stmt = $conn->prepare("SELECT sale_price, stock, name FROM stock WHERE id_stock=?");
        $stmt->execute([$item['id']]);
        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$row) {
            throw new Exception("Producto con ID {$item['id']} no encontrado");
        }
        if ($item['quantity'] > $row['stock']) {
            throw new Exception("Cantidad solicitada para {$row['name']} supera stock disponible ({$row['stock']})");
        }

        $price = $row['sale_price'];
        $subtotal = $price * $item['quantity'];
        $total += $subtotal;

        // Insertar items de la venta
        $stmt = $conn->prepare("INSERT INTO sale_items (id_sale, id_stock, quantity, price, subtotal) VALUES (?,?,?,?,?)");
        $stmt->execute([$sale_id, $item['id'], $item['quantity'], $price, $subtotal]);

        // Actualizar stock
        $stmt = $conn->prepare("UPDATE stock SET stock = stock - ? WHERE id_stock = ?");
        $stmt->execute([$item['quantity'], $item['id']]);

        // Registrar historial de stock
        $stmt = $conn->prepare("INSERT INTO stock_history (id_stock, type, reference_id, quantity) VALUES (?,?,?,?)");
        $stmt->execute([$item['id'], 'sale', $sale_id, $item['quantity']]);
    }

    // Actualizar total de la venta
    $stmt = $conn->prepare("UPDATE sales SET total=? WHERE id_sale=?");
    $stmt->execute([$total, $sale_id]);

    // Registrar movimiento en caja
    $stmt = $conn->prepare("INSERT INTO cash (type, amount, reference_type, reference_id, description) 
                            VALUES ('income', ?, 'sale', ?, 'Venta')");
    $stmt->execute([$total, $sale_id]);

    $conn->commit();

    echo json_encode(['success' => true]);

} catch (Exception $e) {
    $conn->rollBack();
    echo json_encode(['success' => false, 'error' => $e->getMessage()]);
}
