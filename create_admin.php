<?php
// ATENCION ESTE ARCHIVO SOLO ES PARA CREAR UN USUARIO ADMINISTRADOR INICIAL
// LUEGO DE USARLO, BORRARLO POR SEGURIDAD 
include 'includes/conn.php';

try {
    // Datos del admin inicial
    $username   = "admin";
    $password   = "123"; // 🔑 Contraseña que quieras asignar
    $email      = "admin@club.com";
    $first_name = "Administrador";
    $last_name  = "Principal";
    $phone      = "123456789";
    $address    = "Oficina Central";
    $role       = "admin";
    $status     = "active";
    $profile_picture = "default.png";

    // Hashear contraseña
    $hashedPassword = password_hash($password, PASSWORD_BCRYPT);

    // Insertar usuario
    $stmt = $conn->prepare("INSERT INTO users 
        (username, password, email, first_name, last_name, phone, address, role, status, profile_picture) 
        VALUES 
        (:username, :password, :email, :first_name, :last_name, :phone, :address, :role, :status, :profile_picture)");

    $stmt->execute([
        ':username' => $username,
        ':password' => $hashedPassword,
        ':email'    => $email,
        ':first_name' => $first_name,
        ':last_name'  => $last_name,
        ':phone'      => $phone,
        ':address'    => $address,
        ':role'       => $role,
        ':status'     => $status,
        ':profile_picture' => $profile_picture
    ]);

    echo "✅ Usuario administrador creado correctamente.";
} catch (PDOException $e) {
    echo "❌ Error al crear el usuario administrador: " . $e->getMessage();
}
