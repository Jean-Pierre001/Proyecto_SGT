<?php
include 'includes/conn.php';
session_start();

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $username = trim($_POST['username']);
    $password = trim($_POST['password']);

    try {
        $stmt = $conn->prepare("SELECT * FROM users WHERE username = :username LIMIT 1");
        $stmt->execute([':username' => $username]);
        $user = $stmt->fetch();

        // NOTA: RECUERDA QUE password_verify() COMPARA LA CONTRASEÑA PLANA CON LA HASHED
        // NO INTENTAR HACER INSERSIONES SQL DESDE PHPMYADMIN O DE LO CONTRARIO NO FUNCIONARA
        if ($user && password_verify($password, $user['password'])) {
            // Guardar datos en sesión
            $_SESSION['user_id']  = $user['id'];
            $_SESSION['username'] = $user['username'];
            $_SESSION['role']     = $user['role'];

            // Actualizar última conexión
            $update = $conn->prepare("UPDATE users SET last_login = NOW() WHERE id = :id");
            $update->execute([':id' => $user['id']]);

            header("Location: index.php");
            exit();
        } else {
            $_SESSION['error'] = "❌ Usuario o contraseña incorrectos.";
            header("Location: login.php");
            exit();
        }
    } catch (PDOException $e) {
        $_SESSION['error'] = "⚠️ Error en la base de datos.";
        header("Location: login.php");
        exit();
    }
} else {
    header("Location: login.php");
    exit();
}
?>
