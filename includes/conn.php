<?php
// includes/conn.php
// Conexión a la Base de Datos con PDO

$host = "localhost";       // Servidor
$dbname = "club_deportivo"; // Nombre de la base de datos
$username = "root";        // Usuario
$password = "";            // Contraseña

try {
    // Crear conexión PDO
    $conn = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $username, $password);

    // Configurar atributos de PDO
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $conn->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);

} catch (PDOException $e) {
    // En caso de error muestra mensaje
    die("❌ Error de conexión: " . $e->getMessage());
}
?>
