<?php
$page_title = "Gestión de Roles";
include 'includes/session.php';
include 'includes/header.php';
include 'includes/conn.php';
?>

<div class="flex flex-col md:flex-row h-screen overflow-hidden">

    <!-- Sidebar -->
    <?php include 'includes/sidebar.php'; ?>

    <!-- Main content -->
    <main class="flex-1 overflow-y-auto bg-gray-100">

        <!-- Navbar -->
        <?php include 'includes/navbar.php'; ?>

        <!-- Contenedor principal -->
        <div class="p-4 md:p-6 m-4 bg-white border border-gray-300 rounded-lg shadow-lg animate-fade-in">

            <!-- Encabezado y botón agregar -->
            <div class="flex flex-col md:flex-row justify-between items-start md:items-center mb-6 gap-3 md:gap-0">
                <h1 class="text-2xl md:text-3xl font-bold text-gray-800 flex items-center gap-2">
                    <i class="text-patagones-blue"></i> Lista de Roles
                </h1>
                <a href="javascript:void(0)" onclick="openModal('addRoleModal')" 
                   class="inline-flex items-center bg-patagones-blue text-white px-4 py-2 md:px-5 md:py-2 rounded-lg shadow hover:bg-blue-700 transition w-full sm:w-auto justify-center text-sm md:text-base">
                    <i class="fa-solid fa-plus mr-2"></i> Agregar Rol
                </a>
            </div>

            <!-- Tabla responsive -->
            <div class="overflow-x-auto rounded-lg shadow border border-gray-300 bg-white">
                <table class="min-w-full text-sm md:text-base text-gray-700 border-collapse" id="rolesTable">
                    <thead class="bg-gray-100 text-gray-800 uppercase text-xs md:text-sm font-semibold border-b border-gray-300">
                        <tr>
                            <th class="px-3 md:px-6 py-2 border-r border-gray-300 text-left">Nombre</th>
                            <th class="px-3 md:px-6 py-2 border-r border-gray-300 text-left">Descripción</th>
                            <th class="px-3 md:px-6 py-2 text-center">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        try {
                            $sql = "SELECT * FROM roles ORDER BY role_id ASC";
                            $stmt = $conn->query($sql);
                            $roles = $stmt->fetchAll();

                            if ($roles) {
                                foreach ($roles as $i => $role) {
                                    $rowClass = $i % 2 === 0 ? 'bg-white' : 'bg-gray-50';
                                    ?>
                                    <tr class="<?= $rowClass ?> hover:bg-gray-100 transition border-b border-gray-200">
                                        <td class="px-3 md:px-6 py-2 border-r border-gray-300 font-medium text-gray-800"><?= htmlspecialchars($role['name']); ?></td>
                                        <td class="px-3 md:px-6 py-2 border-r border-gray-300 text-gray-600"><?= htmlspecialchars($role['description']); ?></td>
                                        <td class="px-3 md:px-6 py-2 text-center flex flex-wrap justify-center gap-2">

                                            <!-- Editar -->
                                            <a href="javascript:void(0)" 
                                               onclick='openEditModalRole(<?= json_encode($role); ?>)' 
                                               class="flex items-center justify-center bg-yellow-500 hover:bg-yellow-600 text-white px-3 py-1 rounded-md shadow transition w-full sm:w-24">
                                                <i class="fa-solid fa-pen mr-1"></i>Editar
                                            </a>

                                            <!-- Eliminar -->
                                            <a href="roles_back/delete_role.php?id=<?= $role['role_id']; ?>" 
                                               class="flex items-center justify-center bg-red-600 hover:bg-red-700 text-white px-3 py-1 rounded-md shadow transition w-full sm:w-24"
                                               onclick="return confirm('¿Estás seguro de eliminar este rol?')">
                                                <i class="fa-solid fa-trash mr-1"></i>Eliminar
                                            </a>

                                            <!-- Permisos -->
                                            <a href="javascript:void(0)" 
                                            onclick="openPermissionsModal(<?= $role['role_id']; ?>, '<?= addslashes(htmlspecialchars($role['name'])); ?>')"
                                            class="flex items-center justify-center bg-patagones-green hover:bg-green-700 text-white px-3 py-1 rounded-md shadow transition w-full sm:w-24">
                                                <i class="fa-solid fa-key mr-1"></i>Permisos
                                            </a>
                                        
                                        </td>
                                    </tr>
                                    <?php
                                }
                            } else {
                                echo "<tr><td colspan='3' class='px-3 md:px-6 py-4 text-center text-gray-500'>No hay roles registrados</td></tr>";
                            }
                        } catch (PDOException $e) {
                            echo "<tr><td colspan='3' class='px-3 md:px-6 py-4 text-center text-red-600'>Error: {$e->getMessage()}</td></tr>";
                        }
                        ?>
                    </tbody>
                </table>
            </div>

        </div>

        <!-- Modales -->
        <?php include 'includes/modals/modals_roles.php'; ?>

    </main>
</div>

<!-- SweetAlert2 -->
<script>
<?php if(isset($_GET['error'])): ?>
Swal.fire({
  icon: 'warning',
  title: 'Atención',
  text: "<?php echo addslashes($_GET['error']); ?>",
  confirmButtonColor: '#2778ff'
});
<?php endif; ?>

<?php if(isset($_GET['msg'])): ?>
Swal.fire({
  icon: 'success',
  title: 'Éxito',
  text: "<?php echo addslashes($_GET['msg']); ?>",
  confirmButtonColor: '#37ac63'
});
<?php endif; ?>
</script>

<!-- Scripts -->
<script>
document.addEventListener('DOMContentLoaded', function() {

    // Checkbox padres/hijos permisos
    document.querySelectorAll('.parent-checkbox').forEach(parent => {
        parent.addEventListener('change', function() {
            const target = parent.dataset.target;
            document.querySelectorAll('.child-' + target).forEach(child => {
                child.checked = parent.checked;
            });
        });
    });

});

// Modal permisos
function openPermissionsModal(roleId, roleName = '') {
    document.getElementById('permissionsRoleId').value = roleId;
    document.getElementById('roleNamePermissions').innerText = roleName;
    openModal('permissionsModal');

    // Limpiar checkboxes
    document.querySelectorAll('#permissionsModal input[type=checkbox]').forEach(cb => cb.checked = false);

    // Cargar permisos existentes desde BD
    fetch(`roles_back/get_permissions.php?role_id=${roleId}`)
      .then(res => res.json())
      .then(data => {
        data.forEach(perm => {
            const checkbox = document.querySelector(`#permissionsModal input[value="${perm.page}:${perm.action}"]`);
            if (checkbox) checkbox.checked = true;
        });

        // Ajustar padres según hijos
        document.querySelectorAll('.parent-checkbox').forEach(parent => {
            const target = parent.dataset.target;
            const children = document.querySelectorAll('.child-' + target);
            parent.checked = Array.from(children).every(child => child.checked);
        });
      });
}

// Funciones generales modales
function openModal(modalId) {
    document.getElementById(modalId).classList.remove('hidden');
}
function closeModal(modalId) {
    document.getElementById(modalId).classList.add('hidden');
}
function openEditModalRole(role) {
    openModal('addRoleModal');
    document.getElementById('role_id').value = role.role_id;
    document.getElementById('name').value = role.name;
    document.getElementById('description').value = role.description;
}
</script>

<?php include 'includes/footer.php'; ?>
