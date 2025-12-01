<?php
$page_title = "Gestión de Usuarios";
include 'includes/session.php';
include 'includes/header.php';
include 'includes/conn.php';
?>

<div class="flex h-screen overflow-hidden">

    <!-- Sidebar -->
    <?php include 'includes/sidebar.php'; ?>

    <!-- Main content -->
    <main class="flex-1 overflow-y-auto bg-gray-100">

        <!-- Navbar -->
        <?php include 'includes/navbar.php'; ?>

        <!-- Contenedor principal -->
        <div class="p-4 md:p-6 rounded-lg shadow bg-white border border-gray-300 m-4">

            <!-- Encabezado y botón agregar -->
            <div class="flex flex-col md:flex-row justify-between items-start md:items-center mb-6 gap-3 md:gap-0">
                <h1 class="text-2xl md:text-3xl font-bold text-gray-800">Lista de Usuarios</h1>
                <a href="javascript:void(0)" onclick="openModal('addUserModal')" 
                   class="inline-flex items-center bg-blue-600 text-white px-4 py-2 md:px-5 md:py-2 rounded-md shadow hover:bg-blue-700 transition w-full md:w-auto justify-center text-sm md:text-base">
                    <i class="fa-solid fa-plus mr-2"></i> Agregar Usuario
                </a>
            </div>

            <!-- Filtros dinámicos -->
            <div class="flex flex-wrap gap-2 mb-4">
                <input type="text" id="filterName" placeholder="Filtrar por Nombre" class="px-3 py-2 border rounded w-full sm:w-48">
                <input type="text" id="filterLastName" placeholder="Filtrar por Apellido" class="px-3 py-2 border rounded w-full sm:w-48">
                <select id="filterRole" class="px-3 py-2 border rounded w-full sm:w-48">
                    <option value="">Filtrar por Rol</option>
                    <?php
                    try {
                        $roleStmt = $conn->query("SELECT role_id, name FROM roles ORDER BY name ASC");
                        $roles = $roleStmt->fetchAll();
                        foreach ($roles as $role) {
                            echo "<option value='{$role['name']}'>{$role['name']}</option>";
                        }
                    } catch (PDOException $e) {}
                    ?>
                </select>
                <button onclick="clearFilters()" 
                        class="bg-gray-300 hover:bg-gray-400 text-gray-800 px-4 py-2 rounded shadow w-full sm:w-auto">
                    Limpiar Filtros
                </button>
            </div>

            <!-- Tabla de usuarios -->
            <div class="overflow-x-auto rounded-lg shadow border border-gray-200 bg-white">
                <table class="min-w-full text-sm text-gray-700 border-collapse" id="usersTable">
                    <thead class="bg-gray-200 text-gray-800 uppercase text-xs font-semibold border-b border-gray-300">
                        <tr>
                            <th class="px-6 py-3 text-left">Nombre</th>
                            <th class="px-6 py-3 text-left">Apellido</th>
                            <th class="px-6 py-3 text-left">Email</th>
                            <th class="px-6 py-3 text-left">Rol</th>
                            <th class="px-6 py-3 text-left">Estado</th>
                            <th class="px-6 py-3 text-center">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        try {
                            $sql = "SELECT u.user_id, u.first_name, u.last_name, u.email, u.status, r.name AS role_name
                                    FROM users u
                                    LEFT JOIN roles r ON u.role_id = r.role_id
                                    ORDER BY u.user_id ASC";
                            $stmt = $conn->query($sql);
                            $users = $stmt->fetchAll();

                            if ($users) {
                                foreach ($users as $i => $user) {
                                    $rowClass = $i % 2 === 0 ? 'bg-white' : 'bg-gray-50';
                                    ?>
                                    <tr class="<?= $rowClass ?> border-b border-gray-200 hover:bg-gray-50">
                                        <td class="px-6 py-3"><?= htmlspecialchars($user['first_name']); ?></td>
                                        <td class="px-6 py-3"><?= htmlspecialchars($user['last_name']); ?></td>
                                        <td class="px-6 py-3"><?= htmlspecialchars($user['email']); ?></td>
                                        <td class="px-6 py-3"><?= htmlspecialchars($user['role_name']); ?></td>
                                        <td class="px-6 py-3">
                                        <span class="px-2 py-1 rounded text-xs font-semibold <?= $user['status'] ? 'bg-green-100 text-green-700' : 'bg-gray-200 text-gray-600'; ?>">
                                            <?= $user['status'] ? 'Activo' : 'Inactivo'; ?>
                                        </span>
                                        </td>
                                        <td class="px-6 py-3 text-center flex flex-wrap justify-center gap-2">
                                            <a href="javascript:void(0)" onclick='openEditModalUser(<?= json_encode($user); ?>)' 
                                               class="flex items-center justify-center bg-yellow-500 hover:bg-yellow-600 text-white px-3 py-1 rounded-md transition w-28">
                                                <i class="fa-solid fa-pen mr-1"></i>Editar
                                            </a>
                                            <a href="users_back/delete_user.php?id=<?= $user['user_id']; ?>" 
                                               class="flex items-center justify-center bg-red-600 hover:bg-red-700 text-white px-3 py-1 rounded-md transition w-28"
                                               onclick="return confirm('¿Estás seguro de eliminar este usuario?')">
                                                <i class="fa-solid fa-trash mr-1"></i>Eliminar
                                            </a>
                                               <a href="javascript:void(0)" onclick="openUserCoursesModal(<?= $user['user_id']; ?>, '<?= htmlspecialchars($user['first_name'].' '.$user['last_name']); ?>')" 
                                                class="flex items-center justify-center bg-blue-500 hover:bg-blue-600 text-white px-3 py-1 rounded-md transition w-28">
                                                <i class="fa-solid fa-book mr-1"></i>Cursos
                                            </a>
                                            <?php if ($user['user_id'] != $_SESSION['user_id']) : ?>
                                            <form action="users_back/toggle_user.php" method="POST" class="inline-block">
                                                <input type="hidden" name="user_id" value="<?= $user['user_id'] ?>">
                                                <input type="hidden" name="status" value="<?= $user['status'] ? 0 : 1 ?>">

                                                <button 
                                                    class="flex items-center justify-center 
                                                    <?= $user['status'] 
                                                        ? 'bg-gray-600 hover:bg-gray-700' 
                                                        : 'bg-green-600 hover:bg-green-700' ?> 
                                                    text-white px-3 py-1 rounded-md transition w-28"
                                                >
                                                    <i class="fa-solid <?= $user['status'] ? 'fa-user-slash' : 'fa-user-check' ?> mr-1"></i>
                                                    <?= $user['status'] ? 'Desactivar' : 'Activar' ?>
                                                </button>
                                            </form>
                                            <?php else: ?>
                                            <button 
                                                class="flex items-center justify-center bg-gray-400 text-white px-3 py-1 rounded-md cursor-not-allowed opacity-70 w-28"
                                                title="No puedes desactivar tu propia cuenta"
                                            >
                                                <i class="fa-solid fa-ban mr-1"></i>Bloqueado
                                            </button>
                                            <?php endif; ?>
                                        </td>
                                    </tr>
                                    <?php
                                }
                            } else {
                                echo "<tr><td colspan='5' class='px-6 py-4 text-center text-gray-500'>No hay usuarios registrados</td></tr>";
                            }
                        } catch (PDOException $e) {
                            echo "<tr><td colspan='5' class='px-6 py-4 text-center text-red-600'>Error: {$e->getMessage()}</td></tr>";
                        }
                        ?>
                    </tbody>
                </table>
            </div>

        </div>

        <!-- Modales -->
        <?php include 'includes/modals/modals_users.php'; ?>

    </main>
</div>

<!-- SweetAlert -->
<script>
<?php if(isset($_GET['error'])): ?>
Swal.fire({
  icon: 'warning',
  title: 'Atención',
  text: "<?php echo addslashes($_GET['error']); ?>",
});
<?php endif; ?>

<?php if(isset($_GET['msg'])): ?>
Swal.fire({
  icon: 'success',
  title: 'Éxito',
  text: "<?php echo addslashes($_GET['msg']); ?>",
});
<?php endif; ?>
</script>

<!-- Filtros dinámicos persistentes -->
<script>
document.addEventListener('DOMContentLoaded', function() {
    const filters = {
        name: document.getElementById('filterName'),
        lastName: document.getElementById('filterLastName'),
        role: document.getElementById('filterRole')
    };
    const rows = document.querySelectorAll('#usersTable tbody tr');

    // Cargar valores guardados
    Object.keys(filters).forEach(key => {
        const saved = localStorage.getItem('filter_' + key);
        if(saved !== null) filters[key].value = saved;
    });

    function filterRows() {
        const vals = {
            name: filters.name.value.toLowerCase(),
            lastName: filters.lastName.value.toLowerCase(),
            role: filters.role.value.toLowerCase()
        };

        rows.forEach(row => {
            const cells = row.children;
            const show = 
                cells[0].textContent.toLowerCase().includes(vals.name) &&
                cells[1].textContent.toLowerCase().includes(vals.lastName) &&
                (vals.role === '' || cells[3].textContent.toLowerCase().includes(vals.role));
            row.style.display = show ? '' : 'none';
        });
    }

    Object.keys(filters).forEach(key => {
        filters[key].addEventListener(key === 'role' ? 'change' : 'input', () => {
            localStorage.setItem('filter_' + key, filters[key].value);
            filterRows();
        });
    });

    window.clearFilters = function() {
        Object.keys(filters).forEach(key => {
            filters[key].value = '';
            localStorage.removeItem('filter_' + key);
        });
        filterRows();
    };

    filterRows();
});
</script>

<?php include 'includes/footer.php'; ?>
