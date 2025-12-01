<?php
$page_title = "Panel de Notificaciones";
include 'includes/session.php';
include 'includes/header.php';
include 'includes/conn.php';

date_default_timezone_set('America/Argentina/Salta');

$today = (new DateTime())->format('Y-m-d');
$displayDate = (new DateTime())->format('d/m/Y');
$weekday = strtolower((new DateTime())->format('l'));

// --- Obtener nombre del rol ---
$role_name = '';
if (isset($role_id)) {
    $stmtRole = $conn->prepare("SELECT name FROM roles WHERE role_id = ?");
    $stmtRole->execute([$role_id]);
    $role_row = $stmtRole->fetch(PDO::FETCH_ASSOC);
    if ($role_row) {
        $role_name = $role_row['name'];
    }
}

$user_id = $_SESSION['user_id'];

$sql = "
    SELECT 
        c.course_id, c.name AS course_name,
        s.subject_id, s.name AS subject_name,
        t.teacher_id, t.first_name AS teacher_fname, t.last_name AS teacher_lname,
        sch.group_id,
        g.name AS group_name
    FROM courses c
    JOIN user_courses uc 
        ON uc.course_id = c.course_id
        AND uc.user_id = :user_id
    JOIN schedules sch 
        ON sch.course_id = c.course_id
        AND sch.weekday = :weekday
    LEFT JOIN groups g ON g.group_id = sch.group_id
    JOIN subjects s ON s.subject_id = sch.subject_id
    JOIN teachers t ON t.teacher_id = sch.teacher_id
    LEFT JOIN student_attendance sa 
        ON sa.schedule_id = sch.schedule_id
        AND sa.attendance_date = :today
    WHERE sa.id IS NULL
    GROUP BY c.course_id, s.subject_id, sch.group_id
    ORDER BY c.name, s.name
";

$stmt = $conn->prepare($sql);
$stmt->bindValue(':user_id', $user_id);
$stmt->bindValue(':today', $today);
$stmt->bindValue(':weekday', $weekday);
$stmt->execute();
$rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>

<div class="flex h-screen overflow-hidden">
  <!-- Sidebar -->
  <?php include 'includes/sidebar.php'; ?>

  <!-- Contenido principal -->
  <main class="flex-1 overflow-y-auto dashboard-bg">
    <!-- Navbar -->
    <?php include 'includes/navbar.php'; ?>

    <!-- Contenedor principal -->
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
          <p class="text-gray-500 text-sm">
            Rol: <strong><?= htmlspecialchars($role_name) ?></strong>
          </p>
        </div>
        <span class="px-4 py-2 text-sm font-semibold bg-blue-100 text-blue-800 rounded-full shadow">
          <?= count($rows); ?> pendientes
        </span>
      </div>

      <!-- Contenido de notificaciones -->
      <?php if (count($rows) > 0): ?>
        <div class="grid gap-5 sm:grid-cols-1 md:grid-cols-2 lg:grid-cols-3">
          <?php foreach ($rows as $row): ?>
            <div class="flex items-start p-5 bg-red-50 border-l-4 border-red-500 rounded-lg shadow-md hover:shadow-lg transition-shadow duration-300">
              <i class="fa-solid fa-triangle-exclamation text-red-600 text-3xl mr-4 mt-1"></i>
              <div>
                <p class="font-semibold text-red-800 text-lg">Falta de asistencia registrada</p>
                <p class="text-gray-700 mt-2 leading-relaxed">
                  Hoy <strong><?= $displayDate ?></strong> no se registró asistencia 
                  para <strong><?= htmlspecialchars($row['course_name']) ?></strong>
                  <?php if ($row['group_name']): ?>
                    (Grupo: <strong><?= htmlspecialchars($row['group_name']) ?></strong>)
                  <?php endif; ?>
                  — <strong><?= htmlspecialchars($row['subject_name']) ?></strong>, 
                  a cargo de <strong><?= htmlspecialchars($row['teacher_fname'].' '.$row['teacher_lname']) ?></strong>.
                </p>
              </div>
            </div>
          <?php endforeach; ?>
        </div>
      <?php else: ?>
        <div class="flex items-center p-5 bg-green-50 border-l-4 border-green-500 rounded-lg shadow-md">
          <i class="fa-solid fa-circle-check text-green-600 text-3xl mr-4"></i>
          <p class="text-green-800 text-lg leading-relaxed">
            ✅ Todas las materias y cursos tienen asistencia registrada hoy 
            (<strong><?= $displayDate ?></strong>).
          </p>
        </div>
      <?php endif; ?>
    </div>
  </main>
</div>

<?php include 'includes/footer.php'; ?>
