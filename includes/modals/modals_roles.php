<!-- Modal Agregar Rol -->
<div id="addRoleModal" class="hidden fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50 p-4 overflow-auto">
  <div class="bg-white p-6 rounded-xl shadow-lg w-full max-w-lg relative animate-fade-in">
    <h2 class="text-xl font-semibold mb-4 text-gray-800 text-center md:text-left">Agregar Rol</h2>
    <form id="addRoleForm" action="roles_back/add_role.php" method="POST" class="space-y-4">
      <div>
        <label for="addRoleName" class="block text-gray-700 mb-1">Nombre</label>
        <input type="text" name="name" id="addRoleName" class="w-full px-3 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-blue-500" required>
      </div>
      <div>
        <label for="addRoleDescription" class="block text-gray-700 mb-1">Descripción</label>
        <textarea name="description" id="addRoleDescription" class="w-full px-3 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-blue-500"></textarea>
      </div>
      <div class="flex flex-col md:flex-row justify-end space-y-2 md:space-y-0 md:space-x-2 mt-4">
        <button type="button" onclick="closeModal('addRoleModal')" class="px-4 py-2 bg-gray-300 rounded hover:bg-gray-400 w-full md:w-auto">Cancelar</button>
        <button type="submit" class="px-4 py-2 bg-blue-600 text-white rounded hover:bg-blue-700 w-full md:w-auto">Guardar</button>
      </div>
    </form>
  </div>
</div>

<!-- Modal Editar Rol -->
<div id="editRoleModal" class="hidden fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50 p-4 overflow-auto">
  <div class="bg-white p-6 rounded-xl shadow-lg w-full max-w-lg relative animate-fade-in">
    <h2 class="text-xl font-semibold mb-4 text-gray-800 text-center md:text-left">Editar Rol</h2>
    <form id="editRoleForm" action="roles_back/edit_role.php" method="POST" class="space-y-4">
      <input type="hidden" name="role_id" id="editRoleId">
      <div>
        <label for="editRoleName" class="block text-gray-700 mb-1">Nombre</label>
        <input type="text" name="name" id="editRoleName" class="w-full px-3 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-yellow-500" required>
      </div>
      <div>
        <label for="editRoleDescription" class="block text-gray-700 mb-1">Descripción</label>
        <textarea name="description" id="editRoleDescription" class="w-full px-3 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-yellow-500"></textarea>
      </div>
      <div class="flex flex-col md:flex-row justify-end space-y-2 md:space-y-0 md:space-x-2 mt-4">
        <button type="button" onclick="closeModal('editRoleModal')" class="px-4 py-2 bg-gray-300 rounded hover:bg-gray-400 w-full md:w-auto">Cancelar</button>
        <button type="submit" class="px-4 py-2 bg-yellow-500 text-white rounded hover:bg-yellow-600 w-full md:w-auto">Actualizar</button>
      </div>
    </form>
  </div>
</div>

<!-- Modal Permisos -->
<div id="permissionsModal"
     class="hidden fixed inset-0 bg-black bg-opacity-60 flex items-center justify-center z-50 p-4 overflow-auto">

  <div class="bg-white rounded-xl shadow-2xl w-full max-w-6xl relative flex flex-col overflow-hidden">

    <!-- Header -->
    <div class="bg-gradient-to-r from-blue-800 to-blue-900 text-white px-6 py-4 flex justify-between items-center">
      <h2 class="text-xl md:text-2xl font-semibold">
        Permisos del Rol:
        <span id="roleNamePermissions" class="font-bold text-yellow-300"></span>
      </h2>
      <button onclick="closeModal('permissionsModal')" class="text-white hover:text-yellow-400 text-3xl">&times;</button>
    </div>

    <!-- Body -->
    <div class="p-5 overflow-y-auto max-h-[80vh]">
      <form id="permissionsForm" method="POST" action="roles_back/save_permissions.php" class="space-y-6">
        <input type="hidden" name="role_id" id="permissionsRoleId">

        <!-- ============ INICIO ============ -->
        <div>
          <label class="flex justify-between items-center cursor-pointer p-3 rounded-lg hover:bg-gray-100">
            <div class="flex items-center">
              <i class="fas fa-home mr-3 text-blue-600"></i>
              <span class="font-medium">Inicio</span>
            </div>
            <input type="checkbox" class="parent-checkbox accent-blue-600" data-target="inicio">
          </label>

          <div class="ml-8 mt-2 text-sm space-y-2 text-gray-700">
            <label class="flex items-center gap-2">
              <input type="checkbox" name="permissions[]" value="index.php:view" class="child-inicio accent-blue-600">
              Ver
            </label>
          </div>
        </div>

        <!-- ============ ABM DATOS ============ -->
        <div>
          <label class="flex justify-between items-center cursor-pointer p-3 rounded-lg hover:bg-gray-100">
            <div class="flex items-center">
              <i class="fas fa-user-tie mr-3 text-blue-600"></i>
              <span class="font-medium">ABM Datos</span>
            </div>
            <input type="checkbox" class="parent-checkbox accent-blue-600" data-target="abm">
          </label>

          <div class="ml-8 mt-2 text-sm space-y-2 text-gray-700">

            <label class="flex items-center gap-2">
              <input type="checkbox" name="permissions[]" value="products.php:view" class="child-abm accent-blue-600">
              Productos
            </label>

            <label class="flex items-center gap-2">
              <input type="checkbox" name="permissions[]" value="categories.php:view" class="child-abm accent-blue-600">
              Categorías
            </label>

            <label class="flex items-center gap-2">
              <input type="checkbox" name="permissions[]" value="teacher_reports.php:view" class="child-abm accent-blue-600">
              Clientes
            </label>

            <label class="flex items-center gap-2">
              <input type="checkbox" name="permissions[]" value="teacher_courses.php:view" class="child-abm accent-blue-600">
              Proveedores
            </label>

          </div>
        </div>

        <!-- ============ CLIENTES ============ -->
        <div>
          <label class="flex justify-between items-center cursor-pointer p-3 rounded-lg hover:bg-gray-100">
            <div class="flex items-center">
              <i class="fas fa-users mr-3 text-blue-600"></i>
              <span class="font-medium">Clientes</span>
            </div>
            <input type="checkbox" class="parent-checkbox accent-blue-600" data-target="clientes">
          </label>

          <div class="ml-8 mt-2 text-sm space-y-2 text-gray-700">

            <label class="flex items-center gap-2">
              <input type="checkbox" name="permissions[]" value="attendance.php:view" class="child-clientes">
              Ventas
            </label>

            <label class="flex items-center gap-2">
              <input type="checkbox" name="permissions[]" value="attendance_reports_list.php:view" class="child-clientes">
              Devolución
            </label>

            <label class="flex items-center gap-2">
              <input type="checkbox" name="permissions[]" value="attendance_report.php:view" class="child-clientes">
              Cobranza
            </label>

            <label class="flex items-center gap-2">
              <input type="checkbox" name="permissions[]" value="student_attendance.php:view" class="child-clientes">
              Saldos
            </label>

            <label class="flex items-center gap-2">
              <input type="checkbox" name="permissions[]" value="teachers_attendance.php:view" class="child-clientes">
              Fichero
            </label>

          </div>
        </div>

        <!-- ============ PROVEEDORES ============ -->
        <div>
          <label class="flex justify-between items-center cursor-pointer p-3 rounded-lg hover:bg-gray-100">
            <div class="flex items-center">
              <i class="fas fa-truck mr-3 text-blue-600"></i>
              <span class="font-medium">Proveedores</span>
            </div>
            <input type="checkbox" class="parent-checkbox accent-blue-600" data-target="proveedores">
          </label>

          <div class="ml-8 mt-2 text-sm space-y-2 text-gray-700">

            <label class="flex items-center gap-2">
              <input type="checkbox" name="permissions[]" value="teachers.php:view" class="child-proveedores">
              Compras
            </label>

            <label class="flex items-center gap-2">
              <input type="checkbox" name="permissions[]" value="courses.php:view" class="child-proveedores">
              Devolución
            </label>

            <label class="flex items-center gap-2">
              <input type="checkbox" name="permissions[]" value="positions.php:view" class="child-proveedores">
              Cobranza
            </label>

            <label class="flex items-center gap-2">
              <input type="checkbox" name="permissions[]" value="subjects.php:view" class="child-proveedores">
              Saldos
            </label>

            <label class="flex items-center gap-2">
              <input type="checkbox" name="permissions[]" value="students.php:view" class="child-proveedores">
              Fichero
            </label>

          </div>
        </div>

        <!-- ============ STOCK ============ -->
        <div>
          <label class="flex justify-between items-center cursor-pointer p-3 rounded-lg hover:bg-gray-100">
            <div class="flex items-center">
              <i class="fas fa-boxes-stacked mr-3 text-blue-600"></i>
              <span class="font-medium">Stock</span>
            </div>
            <input type="checkbox" class="parent-checkbox accent-blue-600" data-target="stock">
          </label>

          <div class="ml-8 mt-2 text-sm space-y-2 text-gray-700">
            <label class="flex items-center gap-2">
              <input type="checkbox" name="permissions[]" value="teachers.php:view" class="child-stock">
              Salidas
            </label>

            <label class="flex items-center gap-2">
              <input type="checkbox" name="permissions[]" value="stock.php:view" class="child-stock">
              Stock
            </label>

            <label class="flex items-center gap-2">
              <input type="checkbox" name="permissions[]" value="positions.php:view" class="child-stock">
              A Reponer
            </label>
          </div>
        </div>

        <!-- ============ CAJA ============ -->
        <div>
          <label class="flex justify-between items-center cursor-pointer p-3 rounded-lg hover:bg-gray-100">
            <div class="flex items-center">
              <i class="fas fa-cash-register mr-3 text-blue-600"></i>
              <span class="font-medium">Caja</span>
            </div>
            <input type="checkbox" class="parent-checkbox accent-blue-600" data-target="caja">
          </label>

          <div class="ml-8 mt-2 text-sm space-y-2 text-gray-700">
            <label class="flex items-center gap-2">
              <input type="checkbox" name="permissions[]" value="teachers.php:view" class="child-caja">
              Caja
            </label>

            <label class="flex items-center gap-2">
              <input type="checkbox" name="permissions[]" value="courses.php:view" class="child-caja">
              Contaduría
            </label>
          </div>
        </div>

        <!-- ============ ADMINISTRADOR ============ -->
        <div>
          <label class="flex justify-between items-center cursor-pointer p-3 rounded-lg hover:bg-gray-100">
            <div class="flex items-center">
              <i class="fas fa-user-gear mr-3 text-blue-600"></i>
              <span class="font-medium">Administrador</span>
            </div>
            <input type="checkbox" class="parent-checkbox accent-blue-600" data-target="admin">
          </label>

          <div class="ml-8 mt-2 text-sm space-y-2 text-gray-700">

            <label class="flex items-center gap-2">
              <input type="checkbox" name="permissions[]" value="roles.php:view" class="child-admin">
              Roles
            </label>

            <label class="flex items-center gap-2">
              <input type="checkbox" name="permissions[]" value="users.php:view" class="child-admin">
              Usuarios
            </label>

            <label class="flex items-center gap-2">
              <input type="checkbox" name="permissions[]" value="backup.php:view" class="child-admin">
              Backup
            </label>

          </div>
        </div>

      </form>
    </div>

    <!-- Footer -->
    <div class="bg-gray-100 border-t px-6 py-4 flex justify-end gap-3">
      <button type="button" onclick="closeModal('permissionsModal')" class="px-4 py-2 bg-gray-300 rounded-lg">
        Cancelar
      </button>
      <button type="submit" form="permissionsForm" class="px-4 py-2 bg-green-600 text-white rounded-lg">
        Guardar Permisos
      </button>
    </div>

  </div>
</div>

<script>
document.addEventListener('DOMContentLoaded', function() {

  // --- Funciones genéricas de modal ---
  function openModal(modalId) {
    const modal = document.getElementById(modalId);
    if (!modal) return;
    modal.classList.remove('hidden');
    modal.classList.add('flex');
  }

  function closeModal(modalId) {
    const modal = document.getElementById(modalId);
    if (!modal) return;
    modal.classList.add('hidden');
    modal.classList.remove('flex');
  }

  // --- Abrir modal de edición ---
  window.openEditModalRole = function(role) {
    const idField = document.getElementById('editRoleId');
    const nameField = document.getElementById('editRoleName');
    const descField = document.getElementById('editRoleDescription');

    if (!idField || !nameField || !descField) {
      console.error('Campos del modal de edición no encontrados.');
      return;
    }

    idField.value = role.role_id ?? '';
    nameField.value = role.name ?? '';
    descField.value = role.description ?? '';

    openModal('editRoleModal');
  };

  // --- Abrir modal permisos ---
  window.openPermissionsModal = function(roleId, roleName = '') {
    const roleIdField = document.getElementById('permissionsRoleId');
    const roleNameLabel = document.getElementById('roleNamePermissions');

    if (roleIdField) roleIdField.value = roleId;
    if (roleNameLabel) roleNameLabel.innerText = roleName;

    openModal('permissionsModal');

    // Limpiar checkboxes
    document.querySelectorAll('#permissionsModal input[type=checkbox]')
      .forEach(cb => cb.checked = false);

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
      })
      .catch(err => console.error('Error al cargar permisos:', err));
  };

  // --- Validación duplicados roles ---
  async function checkDuplicateRole(name, excludeId = null) {
    const formData = new FormData();
    formData.append('name', name);
    if (excludeId) formData.append('role_id', excludeId);

    try {
      const res = await fetch('api/validations/check_duplicate_role.php', {
        method: 'POST',
        body: formData
      });
      const data = await res.json();
      return data.exists;
    } catch (error) {
      console.error('Error validando duplicado:', error);
      return false;
    }
  }

  // --- Validación Agregar ---
  const addRoleForm = document.getElementById('addRoleForm');
  if (addRoleForm) {
    addRoleForm.addEventListener('submit', async (e) => {
      e.preventDefault();
      const name = document.getElementById('addRoleName').value.trim();

      if (name === '') {
        Swal.fire({
          icon: 'warning',
          title: 'Campo vacío',
          text: 'Ingrese el nombre del rol.'
        });
        return;
      }

      const exists = await checkDuplicateRole(name);
      if (exists) {
        Swal.fire({
          icon: 'error',
          title: 'Rol duplicado',
          text: 'Ya existe un rol con ese nombre.'
        });
      } else {
        e.target.submit();
      }
    });
  }

  // --- Validación Editar ---
  const editRoleForm = document.getElementById('editRoleForm');
  if (editRoleForm) {
    editRoleForm.addEventListener('submit', async (e) => {
      e.preventDefault();
      const name = document.getElementById('editRoleName').value.trim();
      const id = document.getElementById('editRoleId').value;

      if (name === '') {
        Swal.fire({
          icon: 'warning',
          title: 'Campo vacío',
          text: 'Ingrese el nombre del rol.'
        });
        return;
      }

      const exists = await checkDuplicateRole(name, id);
      if (exists) {
        Swal.fire({
          icon: 'error',
          title: 'Rol duplicado',
          text: 'Ya existe otro rol con ese nombre.'
        });
      } else {
        e.target.submit();
      }
    });
  }

  // Exponer funciones genéricas globalmente
  window.openModal = openModal;
  window.closeModal = closeModal;

});
</script>
