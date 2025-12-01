<?php

session_start();
if ($_POST['user_id'] == $_SESSION['user_id']) {
    header("Location: ../users.php?error=" . urlencode("No puedes desactivar tu propia cuenta."));
    exit;
}

require '../includes/conn.php';

// ✅ Solo aceptar método POST
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    header("Location: ../users.php?error=" . urlencode("Método no permitido"));
    exit;
}

// ✅ Sanitizar y validar entrada
$user_id = filter_input(INPUT_POST, 'user_id', FILTER_VALIDATE_INT);
$status  = filter_input(INPUT_POST, 'status', FILTER_VALIDATE_INT);

if (!$user_id || ($status !== 0 && $status !== 1)) {
    header("Location: ../users.php?error=" . urlencode("Datos inválidos"));
    exit;
}

// ✅ Verificar que el usuario exista
$stmt = $conn->prepare("SELECT user_id FROM users WHERE user_id = ?");
$stmt->execute([$user_id]);
if (!$stmt->fetch()) {
    header("Location: ../users.php?error=" . urlencode("Usuario no encontrado"));
    exit;
}

// ✅ Actualizar estado
$update = $conn->prepare("UPDATE users SET status = ? WHERE user_id = ?");
$update->execute([$status, $user_id]);

// ✅ Mensaje dinámico
$msg = $status == 1 ? "Usuario activado" : "Usuario desactivado";

header("Location: ../users.php?success=" . urlencode($msg));
exit;
?>
