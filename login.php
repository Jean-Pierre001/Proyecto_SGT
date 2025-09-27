<?php session_start(); ?>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Login - Club Deportivo</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-x..." crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body class="bg-gradient-to-br from-blue-100 to-blue-300 flex items-center justify-center min-h-screen">

  <div class="w-full max-w-sm p-8 bg-white rounded-3xl shadow-xl border border-blue-200">
    <h2 class="text-3xl font-bold text-center mb-6 text-blue-700">Iniciar Sesión</h2>

    <?php if (isset($_SESSION['error'])): ?>
      <div class="mb-4 p-3 bg-red-100 text-red-700 rounded flex items-center gap-2">
        <i class="fas fa-exclamation-triangle"></i>
        <span><?= $_SESSION['error']; unset($_SESSION['error']); ?></span>
      </div>
    <?php endif; ?>

    <form action="login_process.php" method="POST" class="space-y-6">
      <div>
        <label class="block mb-1 font-semibold text-gray-700">Usuario</label>
        <div class="flex items-center border rounded-lg overflow-hidden focus-within:ring focus-within:ring-blue-200">
          <span class="px-3 text-gray-400"><i class="fas fa-user"></i></span>
          <input type="text" name="username" required class="w-full px-3 py-2 focus:outline-none">
        </div>
      </div>

      <div>
        <label class="block mb-1 font-semibold text-gray-700">Contraseña</label>
        <div class="relative flex items-center border rounded-lg overflow-hidden focus-within:ring focus-within:ring-blue-200">
          <span class="px-3 text-gray-400"><i class="fas fa-lock"></i></span>
          <input id="password" type="password" name="password" required class="w-full px-3 py-2 focus:outline-none pr-10">
          <button type="button" id="togglePassword" class="absolute right-3 text-gray-400 hover:text-gray-700">
            <i class="fas fa-eye"></i>
          </button>
        </div>
      </div>

      <button type="submit" class="w-full bg-blue-600 text-white py-2 rounded-lg hover:bg-blue-700 transition font-semibold">
        Entrar
      </button>
    </form>
  </div>

<?php include 'includes/footer.php'; ?>

</body>
</html>
