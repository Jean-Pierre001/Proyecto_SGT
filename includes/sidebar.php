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

// Detectar si es administrador
$role = ($_SESSION['role_name'] ?? 'user');
?>

<!-- Overlay móvil -->
<div id="sidebar-overlay" class="fixed inset-0 bg-black bg-opacity-50 z-40 hidden lg:hidden"></div>

<aside id="sidebar"
    class="bg-sidebar-bg text-white shadow-xl w-60 lg:relative lg:flex-shrink-0
        fixed top-0 left-0 h-full z-50
        transform -translate-x-full lg:translate-x-0 transition-all duration-300 flex flex-col overflow-hidden">

    <!-- Header -->
    <div class="p-9 py-6 border-gray-700/50 flex-shrink-0 flex items-center justify-center gap-2 border-b">
        <img src="assets/img/logosiablack.png" alt="Logo" class="sidebar-logo sidebar-title" style="height:31px;">
        <span class="font-semibold sidebar-title-collapsed hidden flex space-x-0">
            <span style="color:white;">S</span>
            <span style="color:white;">I</span>
            <span style="color:white;">A</span>
        </span>
    </div>

    <!-- Contenido principal -->
    <div class="flex-1 overflow-y-auto sidebar-scroll">
        <nav class="p-4 pt-5 flex-1 space-y-1">

            <!-- Inicio -->
            <?php if(isset($permissions['index.php']) && in_array('view', $permissions['index.php'])): ?>
            <a href="index.php" class="flex items-center nav-item px-3 rounded-lg text-gray-300 hover:bg-nav-item-hover/70 text-sm">
                <i class="fas fa-dumbbell w-4 h-4 mr-3"></i>
                <span class="sidebar-text">Inicio</span>
            </a>
            <?php endif; ?>

            <!-- Sección Socios -->
            <?php 
            $member_pages = ['members.php','memberships.php','payments.php'];
            $has_members = false;
            foreach($member_pages as $page) {
                if(isset($permissions[$page]) && in_array('view', $permissions[$page])) { $has_members = true; break; }
            }
            ?>
            <?php if($has_members): ?>
            <div class="pt-5 pb-1 border-t border-gray-700/50 mt-4">
                <button class="flex items-center nav-item px-3 w-full text-left text-gray-400 text-xs font-semibold uppercase tracking-wider accordion-btn">
                    <i class="fas fa-users w-4 h-4 mr-3"></i>
                    <span class="sidebar-text">SOCIOS</span>
                    <i class="fas fa-chevron-down ml-auto w-3 h-3 accordion-icon"></i>
                </button>
            </div>
            <div class="space-y-1 accordion-content">
                <?php if(isset($permissions['members.php']) && in_array('view', $permissions['members.php'])): ?>
                <a href="members.php" class="flex items-center nav-item px-3 rounded-lg text-gray-300 hover:bg-nav-item-hover/70 text-sm">
                    <i class="fas fa-user w-4 h-4 mr-3"></i>
                    <span class="sidebar-text">Gestión de Socios</span>
                </a>
                <?php endif; ?>
                <?php if(isset($permissions['memberships.php']) && in_array('view', $permissions['memberships.php'])): ?>
                <a href="memberships.php" class="flex items-center nav-item px-3 rounded-lg text-gray-300 hover:bg-nav-item-hover/70 text-sm">
                    <i class="fas fa-id-card w-4 h-4 mr-3"></i>
                    <span class="sidebar-text">Membresías</span>
                </a>
                <?php endif; ?>
                <?php if(isset($permissions['payments.php']) && in_array('view', $permissions['payments.php'])): ?>
                <a href="payments.php" class="flex items-center nav-item px-3 rounded-lg text-gray-300 hover:bg-nav-item-hover/70 text-sm">
                    <i class="fas fa-cash-register w-4 h-4 mr-3"></i>
                    <span class="sidebar-text">Pagos</span>
                </a>
                <?php endif; ?>
            </div>
            <?php endif; ?>

            <!-- Sección Productos -->
            <?php 
            $product_pages = ['products.php','stock_control.php','sales.php'];
            $has_products = false;
            foreach($product_pages as $page) {
                if(isset($permissions[$page]) && in_array('view', $permissions[$page])) { $has_products = true; break; }
            }
            ?>
            <?php if($has_products): ?>
            <div class="pt-5 pb-1 border-t border-gray-700/50 mt-4">
                <button class="flex items-center nav-item px-3 w-full text-left text-gray-400 text-xs font-semibold uppercase tracking-wider accordion-btn">
                    <i class="fas fa-boxes-stacked w-4 h-4 mr-3"></i>
                    <span class="sidebar-text">PRODUCTOS</span>
                    <i class="fas fa-chevron-down ml-auto w-3 h-3 accordion-icon"></i>
                </button>
            </div>
            <div class="space-y-1 accordion-content">
                <?php if(isset($permissions['products.php']) && in_array('view', $permissions['products.php'])): ?>
                <a href="products.php" class="flex items-center nav-item px-3 rounded-lg text-gray-300 hover:bg-nav-item-hover/70 text-sm">
                    <i class="fas fa-bottle-droplet w-4 h-4 mr-3"></i>
                    <span class="sidebar-text">Gestión de Productos</span>
                </a>
                <?php endif; ?>
                <?php if(isset($permissions['stock_control.php']) && in_array('view', $permissions['stock_control.php'])): ?>
                <a href="stock_control.php" class="flex items-center nav-item px-3 rounded-lg text-gray-300 hover:bg-nav-item-hover/70 text-sm">
                    <i class="fas fa-warehouse w-4 h-4 mr-3"></i>
                    <span class="sidebar-text">Control de Stock</span>
                </a>
                <?php endif; ?>
                <?php if(isset($permissions['sales.php']) && in_array('view', $permissions['sales.php'])): ?>
                <a href="sales.php" class="flex items-center nav-item px-3 rounded-lg text-gray-300 hover:bg-nav-item-hover/70 text-sm">
                    <i class="fas fa-cart-shopping w-4 h-4 mr-3"></i>
                    <span class="sidebar-text">Ventas</span>
                </a>
                <?php endif; ?>
            </div>
            <?php endif; ?>

            <!-- Sección Entrenadores -->
            <?php 
            $trainer_pages = ['trainers.php','routines.php'];
            $has_trainers = false;
            foreach($trainer_pages as $page) {
                if(isset($permissions[$page]) && in_array('view', $permissions[$page])) { $has_trainers = true; break; }
            }
            ?>
            <?php if($has_trainers): ?>
            <div class="pt-5 pb-1 border-t border-gray-700/50 mt-4">
                <button class="flex items-center nav-item px-3 w-full text-left text-gray-400 text-xs font-semibold uppercase tracking-wider accordion-btn">
                    <i class="fas fa-chalkboard-user w-4 h-4 mr-3"></i>
                    <span class="sidebar-text">ENTRENADORES</span>
                    <i class="fas fa-chevron-down ml-auto w-3 h-3 accordion-icon"></i>
                </button>
            </div>
            <div class="space-y-1 accordion-content">
                <?php if(isset($permissions['trainers.php']) && in_array('view', $permissions['trainers.php'])): ?>
                <a href="trainers.php" class="flex items-center nav-item px-3 rounded-lg text-gray-300 hover:bg-nav-item-hover/70 text-sm">
                    <i class="fas fa-user-tie w-4 h-4 mr-3"></i>
                    <span class="sidebar-text">Gestión de Entrenadores</span>
                </a>
                <?php endif; ?>
                <?php if(isset($permissions['routines.php']) && in_array('view', $permissions['routines.php'])): ?>
                <a href="routines.php" class="flex items-center nav-item px-3 rounded-lg text-gray-300 hover:bg-nav-item-hover/70 text-sm">
                    <i class="fas fa-dumbbell w-4 h-4 mr-3"></i>
                    <span class="sidebar-text">Rutinas Personalizadas</span>
                </a>
                <?php endif; ?>
            </div>
            <?php endif; ?>

            <!-- Administrador -->
            <?php 
            $admin_pages = ['users.php','roles.php',];
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
                <?php if(isset($permissions['users.php']) && in_array('view', $permissions['users.php'])): ?>
                <a href="users.php" class="flex items-center nav-item px-3 rounded-lg text-gray-300 hover:bg-nav-item-hover/70 text-sm">
                    <i class="fas fa-users-gear w-4 h-4 mr-3"></i>
                    <span class="sidebar-text">Usuarios</span>
                </a>
                <?php endif; ?>
                <?php if(isset($permissions['roles.php']) && in_array('view', $permissions['roles.php'])): ?>
                <a href="roles.php" class="flex items-center nav-item px-3 rounded-lg text-gray-300 hover:bg-nav-item-hover/70 text-sm">
                    <i class="fas fa-user-tag w-4 h-4 mr-3"></i>
                    <span class="sidebar-text">Roles</span>
                </a>
                <?php endif; ?>
            </div>
            <?php endif; ?>

        </nav>
    </div>

    <!-- Botón colapsar -->
    <div class="absolute bottom-4 w-full flex justify-center hidden lg:flex">
        <button id="collapse-btn" class="p-2 bg-gray-700 hover:bg-gray-600 rounded-full text-white">
            <i class="fas fa-angle-double-left"></i>
        </button>
    </div>
</aside>
