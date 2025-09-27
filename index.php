<?php include 'includes/session.php'; ?>
<?php include 'includes/header.php'; ?>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Panel de Administración</title>
</head>
<body class="bg-gray-100 min-h-screen flex flex-col">

  <nav class="bg-blue-600 text-white p-4 flex justify-between">
    <span>Bienvenido, <?= htmlspecialchars($username) ?> (<?= $user_role ?>)</span>
    <a href="logout.php" class="bg-red-500 px-3 py-1 rounded hover:bg-red-600">Cerrar Sesión</a>
  </nav>

  <main class="flex-1 p-6">
    <h1 class="text-2xl font-bold mb-4">Panel de Administración</h1>
    <p class="text-gray-700">Aquí irán las funciones del sistema.</p>
  </main>

  <?php include 'includes/footer.php'; ?>

</body>
</html>
