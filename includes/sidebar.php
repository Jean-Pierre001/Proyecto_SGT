<?php
include 'includes/session.php';
include 'includes/conn.php'; 

$role_id = $_SESSION['role_id'];
$permissions = [];

// Traer permisos del rol
try {
    $stmt = $conn->prepare("SELECT page, action FROM role_permissions WHERE role_id = ?");
    $stmt->execute([$role_id]);
    $perms = $stmt->fetchAll(PDO::FETCH_ASSOC);

    foreach ($perms as $perm) {
        $permissions[$perm['page']][] = $perm['action'];
    }
} catch (PDOException $e) {
    echo "Error al cargar permisos: " . $e->getMessage();
}

?>

<!-- Overlay móvil -->
<div id="sidebar-overlay" class="fixed inset-0 bg-black bg-opacity-50 z-40 hidden lg:hidden"></div>

<aside id="sidebar"
    class="bg-sidebar-bg text-white shadow-xl w-60 lg:relative lg:flex-shrink-0
        fixed top-0 left-0 h-full z-50
        transform -translate-x-full lg:translate-x-0 transition-all duration-300 flex flex-col overflow-hidden">

    <!-- Header (fijo) -->
    <div class="p-9 py-6 border-gray-700/50 flex-shrink-0 flex items-center justify-center gap-2 border-b">
        <img src="assets\img\logosiablack.png" alt="Deportivo Patagones" class="sidebar-logo sidebar-title" style="height:31px;">
        <span class="font-semibold sidebar-title-collapsed hidden flex space-x-0 px-0 m-1">
            <span style="color:white; display:inline-block;">S</span>
            <span style="color:white; display:inline-block;">I</span>
            <span style="color:white; display:inline-block;">A</span>
        </span>
    </div>

    <!-- Contenedor principal scrollable -->
    <div class="flex-1 overflow-y-auto sidebar-scroll">
        <nav class="p-4 pt-5 flex-1 space-y-1">
            <div class="space-y-1">

                <!-- Dashboard -->
                <?php if(isset($permissions['index.php']) && in_array('view', $permissions['index.php'])): ?>
                <a href="index.php" class="flex items-center nav-item px-3 rounded-lg text-gray-300 hover:bg-nav-item-hover/70 text-sm">
                    <i class="fas fa-home w-4 h-4 mr-3"></i>
                    <span class="sidebar-text">Inicio</span>
                </a>
                <?php endif; ?>
                
                <!-- SECCIÓN DOCENTES -->
                <?php 
                $teacher_pages = ['attendance_teacher.php','teacher_courses.php','teacher_reports.php','attendance_reports_list_teacher.php'];
                $has_teacher_section = false;
                foreach($teacher_pages as $page) {
                    if(isset($permissions[$page]) && in_array('view', $permissions[$page])) { $has_teacher_section = true; break; }
                }
                ?>
                <?php if($has_teacher_section): ?>
                <div class="pt-5 pb-1 border-t border-gray-700/50 mt-4">
                    <button class="flex items-center nav-item px-3 w-full text-left text-gray-400 text-xs font-semibold uppercase tracking-wider accordion-btn">
                        <i class="fas fa-user-tie w-4 h-4 mr-3"></i>
                        <span class="sidebar-text">DOCENTES</span>
                        <i class="fas fa-chevron-down ml-auto w-3 h-3 accordion-icon"></i>
                    </button>
                </div>
                <div class="space-y-1 accordion-content max-h-0 overflow-hidden transition-all duration-500">
                    <?php if(isset($permissions['attendance_teacher.php']) && in_array('view', $permissions['attendance_teacher.php'])): ?>
                    <a href="attendance_teacher.php" class="flex items-center nav-item px-3 rounded-lg text-gray-300 hover:bg-nav-item-hover/70 text-sm">
                        <i class="fas fa-clipboard-user w-4 h-4 mr-3"></i>
                        <span class="sidebar-text">Tomar Asistencia</span>
                    </a>
                    <?php endif; ?>

                    <?php if(isset($permissions['attendance_reports_list_teacher.php']) && in_array('view', $permissions['attendance_reports_list_teacher.php'])): ?>
                    <a href="attendance_reports_list_teacher.php" class="flex items-center nav-item px-3 rounded-lg text-gray-300 hover:bg-nav-item-hover/70 text-sm">
                        <i class="fas fa-list-check w-4 h-4 mr-3"></i>
                        <span class="sidebar-text">Lista de Reportes</span>
                    </a>
                    <?php endif; ?>

                    <?php if(isset($permissions['teacher_reports.php']) && in_array('view', $permissions['teacher_reports.php'])): ?>
                    <a href="teacher_reports.php" class="flex items-center nav-item px-3 rounded-lg text-gray-300 hover:bg-nav-item-hover/70 text-sm">
                        <i class="fas fa-file-lines w-4 h-4 mr-3"></i>
                        <span class="sidebar-text">Mis Reportes</span>
                    </a>
                    <?php endif; ?>

                    <?php if(isset($permissions['teacher_courses.php']) && in_array('view', $permissions['teacher_courses.php'])): ?>
                    <a href="teacher_courses.php" class="flex items-center nav-item px-3 rounded-lg text-gray-300 hover:bg-nav-item-hover/70 text-sm">
                        <i class="fas fa-book-open-reader w-4 h-4 mr-3"></i>
                        <span class="sidebar-text">Mis Cursos</span>
                    </a>
                    <?php endif; ?>

                </div>
                <?php endif; ?>

                <!-- ASISTENCIAS -->
                <?php 
                $attendance_pages = ['attendance.php','attendance_report.php','student_attendance.php','teachers_attendance.php','attendance_reports_list.php','course_attendance.php'];
                $has_attendance = false;
                foreach($attendance_pages as $page) {
                    if(isset($permissions[$page]) && in_array('view', $permissions[$page])) { $has_attendance = true; break; }
                }
                ?>
                <?php if($has_attendance): ?>
                <div class="pt-5 pb-1 border-t border-gray-700/50 mt-4">
                    <button class="flex items-center nav-item px-3 w-full text-left text-gray-400 text-xs font-semibold uppercase tracking-wider accordion-btn">
                        <i class="fas fa-clipboard-user w-4 h-4 mr-3"></i>
                        <span class="sidebar-text">ASISTENCIAS</span>
                        <i class="fas fa-chevron-down ml-auto w-3 h-3 accordion-icon"></i>
                    </button>
                </div>
                <div class="space-y-1 accordion-content max-h-0 overflow-hidden transition-all duration-500">
                    <?php if(isset($permissions['attendance.php']) && in_array('view', $permissions['attendance.php'])): ?>
                    <a href="attendance.php" class="flex items-center nav-item px-3 rounded-lg text-gray-300 hover:bg-nav-item-hover/70 text-sm">
                        <i class="fas fa-check-square w-4 h-4 mr-3"></i>
                        <span class="sidebar-text">Toma de Asistencia</span>
                    </a>
                    <?php endif; ?>
                    <?php if(isset($permissions['attendance_reports_list.php']) && in_array('view', $permissions['attendance_reports_list.php'])): ?>
                    <a href="attendance_reports_list.php" class="flex items-center nav-item px-3 rounded-lg text-gray-300 hover:bg-nav-item-hover/70 text-sm">
                        <i class="fas fa-list-ul w-4 h-4 mr-3"></i>
                        <span class="sidebar-text">Listado de Reportes</span>
                    </a>
                    <?php endif; ?>
                    <?php if(isset($permissions['attendance_report.php']) && in_array('view', $permissions['attendance_report.php'])): ?>
                    <a href="attendance_report.php" class="flex items-center nav-item px-3 rounded-lg text-gray-300 hover:bg-nav-item-hover/70 text-sm">
                        <i class="fas fa-file-lines w-4 h-4 mr-3"></i>
                        <span class="sidebar-text">Consulta de Reporte</span>
                    </a>
                    <?php endif; ?>
                    <?php if(isset($permissions['student_attendance.php']) && in_array('view', $permissions['student_attendance.php'])): ?>
                    <a href="student_attendance.php" class="flex items-center nav-item px-3 rounded-lg text-gray-300 hover:bg-nav-item-hover/70 text-sm">
                        <i class="fas fa-user-graduate w-4 h-4 mr-3"></i>
                        <span class="sidebar-text">Consulta Estudiante</span>
                    </a>
                    <?php endif; ?>
                    <?php if(isset($permissions['teachers_attendance.php']) && in_array('view', $permissions['teachers_attendance.php'])): ?>
                    <a href="teachers_attendance.php" class="flex items-center nav-item px-3 rounded-lg text-gray-300 hover:bg-nav-item-hover/70 text-sm">
                        <i class="fas fa-person-chalkboard w-4 h-4 mr-3"></i>
                        <span class="sidebar-text">Consulta Docentes</span>
                    </a>
                    <?php endif; ?>
                    <?php if(isset($permissions['course_attendance.php']) && in_array('view', $permissions['course_attendance.php'])): ?>
                    <a href="course_attendance.php" class="flex items-center nav-item px-3 rounded-lg text-gray-300 hover:bg-nav-item-hover/70 text-sm">
                        <i class="fas fa-users w-4 h-4 mr-3"></i>
                        <span class="sidebar-text">Consulta Curso</span>
                    </a>
                    <?php endif; ?>
                </div>
                <?php endif; ?>

                <!-- Gestión -->
                <?php 
                $gestion_pages = ['teachers.php','students.php','courses.php','subjects.php','schedules.php','classrooms.php'];
                $has_gestion = false;
                foreach($gestion_pages as $page) {
                    if(isset($permissions[$page]) && in_array('view', $permissions[$page])) { $has_gestion = true; break; }
                }
                ?>
                <?php if($has_gestion): ?>
                <div class="pt-5 pb-1 border-t border-gray-700/50 mt-4">
                    <button class="flex items-center nav-item px-3 w-full text-left text-gray-400 text-xs font-semibold uppercase tracking-wider accordion-btn">
                        <i class="fas fa-gears w-4 h-4 mr-3"></i>
                        <span class="sidebar-text">GESTIÓN</span>
                        <i class="fas fa-chevron-down ml-auto w-3 h-3 accordion-icon"></i>
                    </button>
                </div>
                <div class="space-y-1 accordion-content">
                    <?php if(isset($permissions['teachers.php']) && in_array('view', $permissions['teachers.php'])): ?>
                    <a href="teachers.php" class="flex items-center nav-item px-3 rounded-lg text-gray-300 hover:bg-nav-item-hover/70 text-sm">
                        <i class="fas fa-person-chalkboard w-4 h-4 mr-3"></i>
                        <span class="sidebar-text">Docentes</span>
                    </a>
                    <?php endif; ?>
                    <?php if(isset($permissions['courses.php']) && in_array('view', $permissions['courses.php'])): ?>
                    <a href="courses.php" class="flex items-center nav-item px-3 rounded-lg text-gray-300 hover:bg-nav-item-hover/70 text-sm">
                        <i class="fas fa-layer-group w-4 h-4 mr-3"></i>
                        <span class="sidebar-text">Cursos</span>
                    </a>
                    <?php endif; ?>
                    <?php if(isset($permissions['positions.php']) && in_array('view', $permissions['positions.php'])): ?>
                    <a href="positions.php" class="flex items-center nav-item px-3 rounded-lg text-gray-300 hover:bg-nav-item-hover/70 text-sm">
                        <i class="fas fa-book-open-reader w-4 h-4 mr-3"></i>
                        <span class="sidebar-text">CUPOF</span>
                    </a>
                    <?php endif; ?>
                    <?php if(isset($permissions['subjects.php']) && in_array('view', $permissions['subjects.php'])): ?>
                    <a href="subjects.php" class="flex items-center nav-item px-3 rounded-lg text-gray-300 hover:bg-nav-item-hover/70 text-sm">
                        <i class="fas fa-book-open-reader w-4 h-4 mr-3"></i>
                        <span class="sidebar-text">Materias</span>
                    </a>
                    <?php endif; ?>
                    <?php if(isset($permissions['students.php']) && in_array('view', $permissions['students.php'])): ?>
                    <a href="students.php" class="flex items-center nav-item px-3 rounded-lg text-gray-300 hover:bg-nav-item-hover/70 text-sm">
                        <i class="fas fa-user-graduate w-4 h-4 mr-3"></i>
                        <span class="sidebar-text">Estudiante</span>
                    </a>
                    <?php endif; ?>
                    <?php if(isset($permissions['classrooms.php']) && in_array('view', $permissions['classrooms.php'])): ?>
                    <a href="classrooms.php" class="flex items-center nav-item px-3 rounded-lg text-gray-300 hover:bg-nav-item-hover/70 text-sm">
                        <i class="fas fa-school-flag w-4 h-4 mr-3"></i>
                        <span class="sidebar-text">Aulas</span>
                    </a>
                    <?php endif; ?>
                    <?php if(isset($permissions['schedules.php']) && in_array('view', $permissions['schedules.php'])): ?>
                    <a href="schedules.php" class="flex items-center nav-item px-3 rounded-lg text-gray-300 hover:bg-nav-item-hover/70 text-sm">
                        <i class="fas fa-calendar-days w-4 h-4 mr-3"></i>
                        <span class="sidebar-text">Horarios</span>
                    </a>
                    <?php endif; ?>
                </div>
                <?php endif; ?>

                <!-- Administrador -->
                <?php 
                $admin_pages = ['users.php','roles.php','attendance_report_admin.php','backup.php'];
                $has_admin = false;
                foreach($admin_pages as $page) {
                    if(isset($permissions[$page]) && in_array('view', $permissions[$page])) { $has_admin = true; break; }
                }
                ?>
                <?php if($has_admin): ?>
                <div class="pt-5 pb-1 border-t border-gray-700/50 mt-4">
                    <button class="flex items-center nav-item px-3 w-full text-left text-gray-400 text-xs font-semibold uppercase tracking-wider accordion-btn">
                        <i class="fas fa-user-gear w-4 h-4 mr-3"></i>
                        <span class="sidebar-text">ADMINISTRADOR</span>
                        <i class="fas fa-chevron-down ml-auto w-3 h-3 accordion-icon"></i>
                    </button>
                </div>
                <div class="space-y-1 accordion-content">
                <?php if(isset($permissions['roles.php']) && in_array('view', $permissions['roles.php'])): ?>
                <a href="roles.php" class="flex items-center nav-item px-3 rounded-lg text-gray-300 hover:bg-nav-item-hover/70 text-sm">
                    <i class="fas fa-user-shield w-4 h-4 mr-3"></i>
                    <span class="sidebar-text">Roles</span>
                </a>
                <?php endif; ?>
            
                <?php if(isset($permissions['users.php']) && in_array('view', $permissions['users.php'])): ?>
                <a href="users.php" class="flex items-center nav-item px-3 rounded-lg text-gray-300 hover:bg-nav-item-hover/70 text-sm">
                    <i class="fas fa-users-gear w-4 h-4 mr-3"></i>
                    <span class="sidebar-text">Usuarios</span>
                </a>
                <?php endif; ?>

                <?php if(isset($permissions['attendance_reports_list_admin.php']) && in_array('view', $permissions['attendance_reports_list_admin.php'])): ?>
                <a href="attendance_reports_list_admin.php" class="flex items-center nav-item px-3 rounded-lg text-gray-300 hover:bg-nav-item-hover/70 text-sm">
                    <i class="fas fa-magnifying-glass-chart w-4 h-4 mr-3"></i>
                    <span class="sidebar-text">Listado De Reportes</span>
                </a>
                <?php endif; ?>

                <?php if(isset($permissions['attendance_report_admin.php']) && in_array('view', $permissions['attendance_report_admin.php'])): ?>
                <a href="attendance_report_admin.php" class="flex items-center nav-item px-3 rounded-lg text-gray-300 hover:bg-nav-item-hover/70 text-sm">
                    <i class="fas fa-user-check w-4 h-4 mr-3"></i>
                    <span class="sidebar-text">Registros Preceptor</span>
                </a>
                <?php endif; ?>

                <?php if(isset($permissions['attendance_reports_admin_teachers.php']) && in_array('view', $permissions['attendance_reports_admin_teachers.php'])): ?>
                <a href="attendance_reports_admin_teachers.php" class="flex items-center nav-item px-3 rounded-lg text-gray-300 hover:bg-nav-item-hover/70 text-sm">
                    <i class="fas fa-chalkboard-user w-4 h-4 mr-3"></i>
                    <span class="sidebar-text">Registros Docente</span>
                </a>
                <?php endif; ?>

                <?php if(isset($permissions['backup.php']) && in_array('view', $permissions['backup.php'])): ?>
                <a href="backup.php" class="flex items-center nav-item px-3 rounded-lg text-gray-300 hover:bg-nav-item-hover/70 text-sm">
                    <i class="fas fa-database w-4 h-4 mr-3"></i>
                    <span class="sidebar-text">Backup</span>
                </a>
                <?php endif; ?>
                </div>
                <?php endif; ?>
            </div>
        </nav>
    </div>

    <br>
    <br>

    <!-- Botón colapsar escritorio -->
    <div class="absolute bottom-4 w-full flex justify-center hidden lg:flex">
        <button id="collapse-btn" class="p-2 bg-gray-700 hover:bg-gray-600 rounded-full text-white">
            <i class="fas fa-angle-double-left"></i>
        </button>
    </div>

</aside>
