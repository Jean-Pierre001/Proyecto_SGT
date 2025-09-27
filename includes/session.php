<?php
// includes/session.php (solo para archivos raiz)
session_start();

// Seguridad extra: regenerar el ID de sesión cada cierto tiempo
if (!isset($_SESSION['last_regen'])) {
    $_SESSION['last_regen'] = time();
} elseif (time() - $_SESSION['last_regen'] > 300) { // 5 minutos
    session_regenerate_id(true);
    $_SESSION['last_regen'] = time();
}

// Verificar que el usuario esté logueado
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit();
}

// Recuperar los datos del usuario
$user_id   = $_SESSION['user_id'];   // ID del usuario en la BD
$username  = $_SESSION['username'];  // Nombre de usuario
$user_role = $_SESSION['role'];      // Rol del usuario (admin, user, etc.)
//NOTA: Esta variables son supergobales y pueden usarse en cualquier archivo que incluya session.php osea puedes traer cualquier
// variable de session.php a cualquier archivo que incluya session.php y usarlas como si fueran variables locales

// Validar IP y navegador para prevenir secuestro de sesión
if (!isset($_SESSION['ip_address'])) {
    $_SESSION['ip_address'] = $_SERVER['REMOTE_ADDR'];
} elseif ($_SESSION['ip_address'] !== $_SERVER['REMOTE_ADDR']) {
    session_unset();
    session_destroy();
    header("Location: login.php");
    exit();
}

if (!isset($_SESSION['user_agent'])) {
    $_SESSION['user_agent'] = $_SERVER['HTTP_USER_AGENT'];
} elseif ($_SESSION['user_agent'] !== $_SERVER['HTTP_USER_AGENT']) {
    session_unset();
    session_destroy();
    header("Location: login.php");
    exit();
}
?>
