<?php
session_start();
require '../includes/conn.php';

// Validar usuario autenticado
if (!isset($_SESSION['user_id'])) {
    header("Location: ../login.php");
    exit;
}

$user_id     = filter_input(INPUT_POST, 'user_id', FILTER_VALIDATE_INT);
$first_name  = trim(filter_input(INPUT_POST, 'first_name', FILTER_SANITIZE_STRING));
$last_name   = trim(filter_input(INPUT_POST, 'last_name', FILTER_SANITIZE_STRING));
$email       = filter_input(INPUT_POST, 'email', FILTER_SANITIZE_EMAIL);
$password    = $_POST['password'] ?? null;

if (!$user_id || !$first_name || !$last_name || !$email) {
    die("❌ Datos inválidos.");
}

try {

    // Si el usuario ingresó una nueva contraseña
    if (!empty($password)) {
        $hashed = password_hash($password, PASSWORD_DEFAULT);
        $sql = "UPDATE users SET first_name = :first_name, last_name = :last_name, 
                                email = :email, password = :password 
                WHERE user_id = :user_id";
        $stmt = $conn->prepare($sql);
        $stmt->bindParam(':password', $hashed);
    } else {
        // Si NO cambia contraseña
        $sql = "UPDATE users SET first_name = :first_name, last_name = :last_name, 
                                email = :email
                WHERE user_id = :user_id";
        $stmt = $conn->prepare($sql);
    }

    $stmt->bindParam(':first_name', $first_name);
    $stmt->bindParam(':last_name', $last_name);
    $stmt->bindParam(':email', $email);
    $stmt->bindParam(':user_id', $user_id);

    $stmt->execute();

    // Actualizar sesión
    $_SESSION['first_name'] = $first_name;
    $_SESSION['last_name']  = $last_name;
    $_SESSION['email']      = $email;

    header("Location: ../index.php?success=1");
    exit;

} catch (Exception $e) {
    error_log("❌ Error al actualizar perfil: " . $e->getMessage());
    header("Location: ../index.php?error=1");
    exit;
}
