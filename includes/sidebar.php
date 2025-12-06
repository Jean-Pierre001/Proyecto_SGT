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
            <span style="color:white; display:inline-block;">G</span>
            <span style="color:white; display:inline-block;">T</span>
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
                
                <!-- ABM Datos -->
                <?php 
                $ABM_pages = ['attendance_teacher.php','teacher_courses.php','teacher_reports.php','attendance_reports_list_teacher.php'];
                $has_ABM = false;
                foreach($ABM_pages as $page) {
                    if(isset($permissions[$page]) && in_array('view', $permissions[$page])) { $has_ABM = true; break; }
                }
                ?>
                <?php if($has_ABM): ?>
                <div class="pt-5 pb-1 border-t border-gray-700/50 mt-4">
                    <button class="flex items-center nav-item px-3 w-full text-left text-gray-400 text-xs font-semibold uppercase tracking-wider accordion-btn">
                        <i class="fas fa-user-tie w-4 h-4 mr-3"></i>
                        <span class="sidebar-text">ABM Datos</span>
                        <i class="fas fa-chevron-down ml-auto w-3 h-3 accordion-icon"></i>
                    </button>
                </div>
                <div class="space-y-1 accordion-content max-h-0 overflow-hidden transition-all duration-500">
                    <?php if(isset($permissions['products.php']) && in_array('view', $permissions['products.php'])): ?>
                    <a href="products.php" class="flex items-center nav-item px-3 rounded-lg text-gray-300 hover:bg-nav-item-hover/70 text-sm">
                        <i class="fas fa-clipboard-user w-4 h-4 mr-3"></i>
                        <span class="sidebar-text">Productos</span>
                    </a>
                    <?php endif; ?>

                    <?php if(isset($permissions['categories.php']) && in_array('view', $permissions['categories.php'])): ?>
                    <a href="categories.php" class="flex items-center nav-item px-3 rounded-lg text-gray-300 hover:bg-nav-item-hover/70 text-sm">
                        <i class="fas fa-list-check w-4 h-4 mr-3"></i>
                        <span class="sidebar-text">Categorias</span>
                    </a>
                    <?php endif; ?>

                    <?php if(isset($permissions['teacher_reports.php']) && in_array('view', $permissions['teacher_reports.php'])): ?>
                    <a href="teacher_reports.php" class="flex items-center nav-item px-3 rounded-lg text-gray-300 hover:bg-nav-item-hover/70 text-sm">
                        <i class="fas fa-file-lines w-4 h-4 mr-3"></i>
                        <span class="sidebar-text">Clientes</span>
                    </a>
                    <?php endif; ?>

                    <?php if(isset($permissions['teacher_courses.php']) && in_array('view', $permissions['teacher_courses.php'])): ?>
                    <a href="teacher_courses.php" class="flex items-center nav-item px-3 rounded-lg text-gray-300 hover:bg-nav-item-hover/70 text-sm">
                        <i class="fas fa-book-open-reader w-4 h-4 mr-3"></i>
                        <span class="sidebar-text">Proveedores</span>
                    </a>
                    <?php endif; ?>

                </div>
                <?php endif; ?>

                <!-- Clientes -->
                <?php 
                $customers_pages = ['attendance.php','attendance_report.php','student_attendance.php','teachers_attendance.php','attendance_reports_list.php','course_attendance.php'];
                $has_customers = false;
                foreach($customers_pages as $page) {
                    if(isset($permissions[$page]) && in_array('view', $permissions[$page])) { $has_customers = true; break; }
                }
                ?>
                <?php if($has_customers): ?>
                <div class="pt-5 pb-1 border-t border-gray-700/50 mt-4">
                    <button class="flex items-center nav-item px-3 w-full text-left text-gray-400 text-xs font-semibold uppercase tracking-wider accordion-btn">
                        <i class="fas fa-clipboard-user w-4 h-4 mr-3"></i>
                        <span class="sidebar-text">Clientes</span>
                        <i class="fas fa-chevron-down ml-auto w-3 h-3 accordion-icon"></i>
                    </button>
                </div>
                <div class="space-y-1 accordion-content max-h-0 overflow-hidden transition-all duration-500">
                    <?php if(isset($permissions['attendance.php']) && in_array('view', $permissions['attendance.php'])): ?>
                    <a href="attendance.php" class="flex items-center nav-item px-3 rounded-lg text-gray-300 hover:bg-nav-item-hover/70 text-sm">
                        <i class="fas fa-check-square w-4 h-4 mr-3"></i>
                        <span class="sidebar-text">Ventas</span>
                    </a>
                    <?php endif; ?>
                    <?php if(isset($permissions['attendance_reports_list.php']) && in_array('view', $permissions['attendance_reports_list.php'])): ?>
                    <a href="attendance_reports_list.php" class="flex items-center nav-item px-3 rounded-lg text-gray-300 hover:bg-nav-item-hover/70 text-sm">
                        <i class="fas fa-list-ul w-4 h-4 mr-3"></i>
                        <span class="sidebar-text">Devolución</span>
                    </a>
                    <?php endif; ?>
                    <?php if(isset($permissions['attendance_report.php']) && in_array('view', $permissions['attendance_report.php'])): ?>
                    <a href="attendance_report.php" class="flex items-center nav-item px-3 rounded-lg text-gray-300 hover:bg-nav-item-hover/70 text-sm">
                        <i class="fas fa-file-lines w-4 h-4 mr-3"></i>
                        <span class="sidebar-text">Cobranza</span>
                    </a>
                    <?php endif; ?>
                    <?php if(isset($permissions['student_attendance.php']) && in_array('view', $permissions['student_attendance.php'])): ?>
                    <a href="student_attendance.php" class="flex items-center nav-item px-3 rounded-lg text-gray-300 hover:bg-nav-item-hover/70 text-sm">
                        <i class="fas fa-user-graduate w-4 h-4 mr-3"></i>
                        <span class="sidebar-text">Saldos</span>
                    </a>
                    <?php endif; ?>
                    <?php if(isset($permissions['teachers_attendance.php']) && in_array('view', $permissions['teachers_attendance.php'])): ?>
                    <a href="teachers_attendance.php" class="flex items-center nav-item px-3 rounded-lg text-gray-300 hover:bg-nav-item-hover/70 text-sm">
                        <i class="fas fa-person-chalkboard w-4 h-4 mr-3"></i>
                        <span class="sidebar-text">Fichero</span>
                    </a>
                    <?php endif; ?>
                </div>
                <?php endif; ?>

                <!-- Proveedores -->
                <?php 
                $suppliers_pages = ['teachers.php','students.php','courses.php','subjects.php','schedules.php','classrooms.php'];
                $has_suppliers = false;
                foreach($suppliers_pages as $page) {
                    if(isset($permissions[$page]) && in_array('view', $permissions[$page])) { $has_suppliers = true; break; }
                }
                ?>
                <?php if($has_suppliers): ?>
                <div class="pt-5 pb-1 border-t border-gray-700/50 mt-4">
                    <button class="flex items-center nav-item px-3 w-full text-left text-gray-400 text-xs font-semibold uppercase tracking-wider accordion-btn">
                        <i class="fas fa-gears w-4 h-4 mr-3"></i>
                        <span class="sidebar-text">Proveedores</span>
                        <i class="fas fa-chevron-down ml-auto w-3 h-3 accordion-icon"></i>
                    </button>
                </div>
                <div class="space-y-1 accordion-content">
                    <?php if(isset($permissions['teachers.php']) && in_array('view', $permissions['teachers.php'])): ?>
                    <a href="teachers.php" class="flex items-center nav-item px-3 rounded-lg text-gray-300 hover:bg-nav-item-hover/70 text-sm">
                        <i class="fas fa-person-chalkboard w-4 h-4 mr-3"></i>
                        <span class="sidebar-text">Compras</span>
                    </a>
                    <?php endif; ?>
                    <?php if(isset($permissions['courses.php']) && in_array('view', $permissions['courses.php'])): ?>
                    <a href="courses.php" class="flex items-center nav-item px-3 rounded-lg text-gray-300 hover:bg-nav-item-hover/70 text-sm">
                        <i class="fas fa-layer-group w-4 h-4 mr-3"></i>
                        <span class="sidebar-text">Devolución</span>
                    </a>
                    <?php endif; ?>
                    <?php if(isset($permissions['positions.php']) && in_array('view', $permissions['positions.php'])): ?>
                    <a href="positions.php" class="flex items-center nav-item px-3 rounded-lg text-gray-300 hover:bg-nav-item-hover/70 text-sm">
                        <i class="fas fa-book-open-reader w-4 h-4 mr-3"></i>
                        <span class="sidebar-text">Cobranza</span>
                    </a>
                    <?php endif; ?>
                    <?php if(isset($permissions['subjects.php']) && in_array('view', $permissions['subjects.php'])): ?>
                    <a href="subjects.php" class="flex items-center nav-item px-3 rounded-lg text-gray-300 hover:bg-nav-item-hover/70 text-sm">
                        <i class="fas fa-book-open-reader w-4 h-4 mr-3"></i>
                        <span class="sidebar-text">Saldos</span>
                    </a>
                    <?php endif; ?>
                    <?php if(isset($permissions['students.php']) && in_array('view', $permissions['students.php'])): ?>
                    <a href="students.php" class="flex items-center nav-item px-3 rounded-lg text-gray-300 hover:bg-nav-item-hover/70 text-sm">
                        <i class="fas fa-user-graduate w-4 h-4 mr-3"></i>
                        <span class="sidebar-text">Fichero</span>
                    </a>
                    <?php endif; ?>
                </div>
                <?php endif; ?>

                <!-- Stock -->
                <?php 
                $stock_pages = ['teachers.php','students.php','courses.php','subjects.php','stock.php','classrooms.php'];
                $has_stock = false;
                foreach($stock_pages as $page) {
                    if(isset($permissions[$page]) && in_array('view', $permissions[$page])) { $has_stock = true; break; }
                }
                ?>
                <?php if($has_stock): ?>
                <div class="pt-5 pb-1 border-t border-gray-700/50 mt-4">
                    <button class="flex items-center nav-item px-3 w-full text-left text-gray-400 text-xs font-semibold uppercase tracking-wider accordion-btn">
                        <i class="fas fa-gears w-4 h-4 mr-3"></i>
                        <span class="sidebar-text">Stock</span>
                        <i class="fas fa-chevron-down ml-auto w-3 h-3 accordion-icon"></i>
                    </button>
                </div>
                <div class="space-y-1 accordion-content">
                    <?php if(isset($permissions['teachers.php']) && in_array('view', $permissions['teachers.php'])): ?>
                    <a href="teachers.php" class="flex items-center nav-item px-3 rounded-lg text-gray-300 hover:bg-nav-item-hover/70 text-sm">
                        <i class="fas fa-person-chalkboard w-4 h-4 mr-3"></i>
                        <span class="sidebar-text">Salidas</span>
                    </a>
                    <?php endif; ?>
                    <?php if(isset($permissions['stock.php']) && in_array('view', $permissions['stock.php'])): ?>
                    <a href="stock.php" class="flex items-center nav-item px-3 rounded-lg text-gray-300 hover:bg-nav-item-hover/70 text-sm">
                        <i class="fas fa-layer-group w-4 h-4 mr-3"></i>
                        <span class="sidebar-text">Stock</span>
                    </a>
                    <?php endif; ?>
                    <?php if(isset($permissions['positions.php']) && in_array('view', $permissions['positions.php'])): ?>
                    <a href="positions.php" class="flex items-center nav-item px-3 rounded-lg text-gray-300 hover:bg-nav-item-hover/70 text-sm">
                        <i class="fas fa-book-open-reader w-4 h-4 mr-3"></i>
                        <span class="sidebar-text">A Reponer</span>
                    </a>
                    <?php endif; ?>
                </div>
                <?php endif; ?>

                <!-- Caja -->
                <?php 
                $box_pages = ['teachers.php','students.php','courses.php','subjects.php','schedules.php','classrooms.php'];
                $has_box = false;
                foreach($box_pages as $page) {
                    if(isset($permissions[$page]) && in_array('view', $permissions[$page])) { $has_box = true; break; }
                }
                ?>
                <?php if($has_box): ?>
                <div class="pt-5 pb-1 border-t border-gray-700/50 mt-4">
                    <button class="flex items-center nav-item px-3 w-full text-left text-gray-400 text-xs font-semibold uppercase tracking-wider accordion-btn">
                        <i class="fas fa-gears w-4 h-4 mr-3"></i>
                        <span class="sidebar-text">Caja</span>
                        <i class="fas fa-chevron-down ml-auto w-3 h-3 accordion-icon"></i>
                    </button>
                </div>
                <div class="space-y-1 accordion-content">
                    <?php if(isset($permissions['teachers.php']) && in_array('view', $permissions['teachers.php'])): ?>
                    <a href="teachers.php" class="flex items-center nav-item px-3 rounded-lg text-gray-300 hover:bg-nav-item-hover/70 text-sm">
                        <i class="fas fa-person-chalkboard w-4 h-4 mr-3"></i>
                        <span class="sidebar-text">Caja</span>
                    </a>
                    <?php endif; ?>
                    <?php if(isset($permissions['courses.php']) && in_array('view', $permissions['courses.php'])): ?>
                    <a href="courses.php" class="flex items-center nav-item px-3 rounded-lg text-gray-300 hover:bg-nav-item-hover/70 text-sm">
                        <i class="fas fa-layer-group w-4 h-4 mr-3"></i>
                        <span class="sidebar-text">Contaduría</span>
                    </a>
                    <?php endif; ?>
                </div>
                <?php endif; ?>

                <!-- Administrador -->
                <?php 
                $admin_pages = ['users.php','roles.php','backup.php'];
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
