<?php
// SOLO PARA CREAR EL ADMIN INICIAL
// BORRAR ESTE ARCHIVO DESPUÉS DE USARLO POR SEGURIDAD
include 'includes/conn.php';

try {
    $username = "admin";
    $password = "123";      // 🔑 Contraseña inicial
    $email    = "admin@sgt.com";

    // Hashear contraseña
    $hashedPassword = password_hash($password, PASSWORD_BCRYPT);

    // Insertar usuario
    $stmt = $conn->prepare("INSERT INTO users (username, password, email, role) 
                            VALUES (:username, :password, :email, 'admin')");
    $stmt->execute([
        ':username' => $username,
        ':password' => $hashedPassword,
        ':email'    => $email
    ]);

    echo "✅ Usuario administrador creado correctamente.";
} catch (PDOException $e) {
    echo "❌ Error al crear el usuario administrador: " . $e->getMessage();
}
