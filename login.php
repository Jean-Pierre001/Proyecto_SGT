<?php
ini_set('session.cookie_httponly', 1);
ini_set('session.use_strict_mode', 1);
session_start();

require 'includes/conn.php';

$error = '';
$recaptcha_secret = '6LeMw_8rAAAAACFUqMkEVe20G8xyBxVg5Zx8V5Su';

// ✅ Si viene expulsado del sistema por estar inactivo, lo detectamos
$getError = $_GET['error'] ?? '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = htmlspecialchars(trim($_POST['email'] ?? ''));
    $password = $_POST['password'] ?? '';
    $recaptcha_token = $_POST['recaptcha_token'] ?? '';

    if (!empty($recaptcha_token)) {
        $recaptcha_response = file_get_contents(
            "https://www.google.com/recaptcha/api/siteverify?secret={$recaptcha_secret}&response={$recaptcha_token}"
        );
        $recaptcha_data = json_decode($recaptcha_response, true);
        if (!$recaptcha_data['success'] || $recaptcha_data['score'] < 0.5) {
            $error = "reCAPTCHA no verificado, riesgo alto detectado.";
        }
    }

    if ($error === '') {
        if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            $error = "Correo electrónico inválido.";
        } elseif ($password === '') {
            $error = "La contraseña es obligatoria.";
        } else {
            $stmt = $conn->prepare("SELECT * FROM users WHERE email = ?");
            $stmt->execute([$email]);
            $user = $stmt->fetch(PDO::FETCH_ASSOC);

            if ($user && password_verify($password, $user['password'])) {

                // ✅ Verificar si el usuario está inactivo
                if ($user['status'] == 0) {
                    header("Location: login.php?error=Tu cuenta está inactiva, contacte al administrador");
                    exit();
                }

                session_regenerate_id(true);
                $_SESSION['user_id'] = $user['user_id'];
                $_SESSION['first_name'] = $user['first_name'];
                $_SESSION['last_name'] = $user['last_name'];
                $_SESSION['email'] = $user['email'];
                $_SESSION['role_id'] = $user['role_id'];
                $_SESSION['status'] = $user['status'];
                header("Location: index.php");
                exit();
            } else {
                $error = "Correo electrónico o contraseña incorrectos.";
            }
        }
    }
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login - SIA</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"/>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style>
body, html {
  height: 100%;
  margin: 0;
  font-family: 'Inter', sans-serif;
  background: linear-gradient(-45deg,#1e3c72,#2a5298,#1e3c72,#2a5298);
  background-size: 400% 400%;
  animation: gradientBG 15s ease infinite;
  display: flex;
  justify-content: center;
  align-items: center;
}
@keyframes gradientBG {
  0% {background-position:0% 50%;}
  50% {background-position:100% 50%;}
  100% {background-position:0% 50%;}
}
.login-card {
  background: rgba(255,255,255,0.98);
  padding: 4rem 3rem;
  border-radius: 20px;
  box-shadow: 0 15px 35px rgba(0,0,0,0.25);
  width: 650px;
  min-width: 650px;
  animation: fadeIn 0.5s ease-out;
}
.login-card h4 {
  font-weight: 700;
  margin-bottom: 2rem;
  text-align: center;
  color: #2778ff;
}
.form-control {
  border-radius: 10px;
  padding: 1rem 1rem;
  font-size: 1rem;
  transition: all 0.3s;
}
.form-control:focus {
  box-shadow: 0 0 0 0.3rem rgba(39,120,255,0.3);
  border-color: #2778ff;
}
.btn-primary {
  background: linear-gradient(90deg,#2778ff,#1f5cd8);
  border: none;
  border-radius: 10px;
  padding: 0.85rem;
  font-weight: 600;
  font-size: 1.05rem;
  transition: all 0.3s ease;
}
.btn-primary:hover {
  background: linear-gradient(90deg,#1f5cd8,#2778ff);
  transform: translateY(-2px);
}
.alert {
  border-radius: 10px;
  font-size: 0.95rem;
  text-align: center;
  margin-bottom: 1rem;
}
@keyframes fadeIn {
  from {opacity:0; transform:translateY(-10px);}
  to {opacity:1; transform:translateY(0);}
}
@media(max-width:768px){
  .login-card {width: 90%; min-width: unset; padding: 3rem 2rem;}
}
@media(max-width:576px){
  .login-card {width: 95%; padding: 2rem 1.5rem;}
}
</style>
</head>
<body>

<div class="login-card">
  <form method="post" id="login-form">
    <h4>Iniciar Sesión</h4>
    <?php if ($error): ?>
      <div class="alert alert-danger"><?= htmlspecialchars($error) ?></div>
    <?php endif; ?>

    <div class="mb-3">
      <label for="email" class="form-label"><i class="fa-solid fa-envelope me-2"></i>Correo Electrónico</label>
      <input type="email" id="email" name="email" class="form-control" required autofocus>
    </div>

    <div class="mb-3">
      <label for="password" class="form-label"><i class="fa-solid fa-lock me-2"></i>Contraseña</label>
      <input type="password" id="password" name="password" class="form-control" required>
    </div>

    <input type="hidden" name="recaptcha_token" id="recaptcha_token">

    <button type="submit" class="btn btn-primary w-100">Ingresar</button>
  </form>
</div>

<script src="https://www.google.com/recaptcha/api.js?render=6LeMw_8rAAAAAE-sAqzejAJCm1xPKPaExE84JtxK"></script>
<script>
grecaptcha.ready(function() {
    grecaptcha.execute('6LeMw_8rAAAAAE-sAqzejAJCm1xPKPaExE84JtxK', {action: 'login'}).then(function(token) {
        document.getElementById('recaptcha_token').value = token;
    });
});

// ✅ Mostrar SweetAlert si hay error PHP
<?php if ($error): ?>
Swal.fire({
    icon: "error",
    title: "Error",
    text: "<?= htmlspecialchars($error) ?>",
    confirmButtonColor: "#2778ff"
});
<?php endif; ?>

// ✅ Mostrar SweetAlert si fue expulsado desde session.php
<?php if (!empty($getError)): ?>
Swal.fire({
    icon: "warning",
    title: "Acceso Denegado",
    text: "<?= htmlspecialchars($getError) ?>",
    confirmButtonColor: "#2778ff"
});
<?php endif; ?>
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
