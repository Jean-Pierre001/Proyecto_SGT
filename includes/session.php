<?php
include 'conn.php'; // Conexión a la BD

if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

// Si no hay sesión → login
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit();
}

// Variables de sesión
$user_id    = $_SESSION['user_id'];
$first_name = $_SESSION['first_name'];
$last_name  = $_SESSION['last_name'];
$email      = $_SESSION['email'];
$role_id    = $_SESSION['role_id'];

// ✅ Verificar estado del usuario en DB (si está inactivo lo sacamos)
try {
    $stmt = $conn->prepare("SELECT status FROM users WHERE user_id = :id LIMIT 1");
    $stmt->execute([':id' => $user_id]);
    $db_status = $stmt->fetchColumn();

    if ($db_status == 0) {
        session_destroy();
        header("Location: login.php?error=Cuenta inactiva, contacte al administrador");
        exit();
    }

} catch (PDOException $e) {
    die("Error verificando estado de usuario: " . $e->getMessage());
}

// ✅ Verificar permisos según la página
$page = basename($_SERVER['PHP_SELF']); 

try {
    $stmt = $conn->prepare("
        SELECT COUNT(*) 
        FROM role_permissions 
        WHERE role_id = :role_id AND page = :page AND action = 'view'
    ");
    $stmt->execute([
        ':role_id' => $role_id,
        ':page'    => $page
    ]);

    $canView = $stmt->fetchColumn();

    if (!$canView) {
        header("Location: index.php");
        exit();
    }

} catch (PDOException $e) {
    die("Error al verificar permisos: " . $e->getMessage());
}
