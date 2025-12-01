<?php
$page_title = "Panel de Notificaciones";
include 'includes/session.php';
include 'includes/header.php';
include 'includes/conn.php';

$user_id = $_SESSION['user_id'];

// --- Obtener rol del usuario ---
$stmtRole = $conn->prepare("SELECT role_id FROM users WHERE user_id = ?");
$stmtRole->execute([$user_id]);
$role_id = $stmtRole->fetchColumn();

$role_name = '';
if ($role_id) {
    $stmtRoleName = $conn->prepare("SELECT name FROM roles WHERE role_id = ?");
    $stmtRoleName->execute([$role_id]);
    $role_row = $stmtRoleName->fetch(PDO::FETCH_ASSOC);
    if ($role_row) $role_name = $role_row['name'];
}
?>

<div class="flex h-screen overflow-hidden">
  <?php include 'includes/sidebar.php'; ?>

  <main class="flex-1 overflow-y-auto dashboard-bg">
    <?php include 'includes/navbar.php'; ?>

    <div class="p-6 m-4 bg-white border border-gray-200 rounded-xl shadow-lg animate-fade-in">

      <!-- Encabezado -->
      <div class="flex flex-col md:flex-row justify-between items-start md:items-center mb-6 gap-3 md:gap-0">
        <div>
          <h1 class="text-2xl font-semibold text-patagones-text-dark flex items-center gap-2">
            <i class="fa-solid fa-bell text-patagones-blue"></i> Notificaciones
          </h1>
          <p class="text-gray-600 mt-1">
            Bienvenido, <strong><?= htmlspecialchars($_SESSION['first_name'] . ' ' . $_SESSION['last_name']) ?></strong>
          </p>
          <p class="text-gray-500 text-sm">Rol: <strong><?= htmlspecialchars($role_name) ?></strong></p>
        </div>
      </div>
    </div>
  </main>
</div>

<?php include 'includes/footer.php'; ?>
