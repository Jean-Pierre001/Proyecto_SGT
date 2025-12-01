<!-- Modal Editar Perfil -->
<div id="editProfileModal" class="fixed inset-0 bg-black bg-opacity-50 hidden z-50 flex items-center justify-center p-4">
  <div class="bg-white rounded-lg shadow-xl w-full max-w-md p-6 relative overflow-y-auto max-h-[90vh] transform transition-all duration-300 scale-95 sm:scale-100">

    <h3 class="text-xl font-semibold mb-4 text-center">Editar Perfil</h3>

    <form action="users_back/update_profile.php" method="POST" class="space-y-4">
      <input type="hidden" name="user_id" value="<?= $_SESSION['user_id'] ?>">

      <!-- Nombre -->
      <div>
        <label class="block text-sm font-medium text-gray-700">Nombre</label>
        <input type="text" name="first_name"
              value="<?= htmlspecialchars($_SESSION['first_name'] ?? '') ?>"
              required
              class="w-full border rounded px-4 py-2 focus:ring focus:ring-blue-200 transition">
      </div>

      <!-- Apellido -->
      <div>
        <label class="block text-sm font-medium text-gray-700">Apellido</label>
        <input type="text" name="last_name"
              value="<?= htmlspecialchars($_SESSION['last_name'] ?? '') ?>"
              required
              class="w-full border rounded px-4 py-2 focus:ring focus:ring-blue-200 transition">
      </div>

      <!-- Email -->
      <div>
        <label class="block text-sm font-medium text-gray-700">Correo</label>
        <input type="email" name="email"
              value="<?= htmlspecialchars($_SESSION['email'] ?? '') ?>"
              required
              class="w-full border rounded px-4 py-2 focus:ring focus:ring-blue-200 transition">
      </div>

      <!-- Contraseña -->
      <div>
        <label class="block text-sm font-medium text-gray-700">Nueva Contraseña (opcional)</label>
        <input type="password" name="password"
              placeholder="Dejar vacío para no cambiar la contraseña"
              class="w-full border rounded px-4 py-2 focus:ring focus:ring-blue-200 transition">
      </div>

      <!-- Botones -->
      <div class="flex flex-col sm:flex-row justify-end gap-2 mt-4">
        <button type="button" onclick="closeEditProfileModal()"
                class="px-4 py-2 bg-gray-200 rounded hover:bg-gray-300 transition w-full sm:w-auto">
          Cancelar
        </button>
        <button type="submit"
                class="px-4 py-2 bg-blue-600 text-white rounded hover:bg-blue-700 transition w-full sm:w-auto">
          Guardar Cambios
        </button>
      </div>
    </form>

  </div>
</div>

<script>
document.addEventListener('DOMContentLoaded', function() {
    const sidebar = document.getElementById('sidebar');
    const overlay = document.getElementById('sidebar-overlay');
    const mobileBtn = document.getElementById('mobile-menu-btn');
    const collapseBtn = document.getElementById('collapse-btn');
    const sidebarTitle = document.querySelector('.sidebar-title');
    const sidebarCollapsedTitle = document.querySelector('.sidebar-title-collapsed');

    if(!sidebar || !overlay || !mobileBtn || !collapseBtn) return;

    // --- Funciones móviles ---
    function openSidebar() {
        sidebar.classList.remove('-translate-x-full');
        overlay.classList.remove('hidden');
    }
    function closeSidebar() {
        sidebar.classList.add('-translate-x-full');
        overlay.classList.add('hidden');
    }
    mobileBtn.addEventListener('click', () => {
        sidebar.classList.contains('-translate-x-full') ? openSidebar() : closeSidebar();
    });
    overlay.addEventListener('click', closeSidebar);

    // --- Colapsar sidebar (solo escritorio) ---
    function setSidebarState(collapsed) {
        if(collapsed) {
            sidebar.classList.remove('w-60');
            sidebar.classList.add('w-18');
            collapseBtn.innerHTML = '<i class="fas fa-angle-double-right"></i>';
            document.querySelectorAll('.sidebar-text').forEach(el => el.classList.add('hidden'));
            document.querySelectorAll('.accordion-icon').forEach(icon => icon.classList.add('hidden'));
            sidebarTitle.classList.add('hidden');
            sidebarCollapsedTitle.classList.remove('hidden');
            localStorage.setItem('sidebarCollapsed', 'true');
        } else {
            sidebar.classList.remove('w-18');
            sidebar.classList.add('w-60');
            collapseBtn.innerHTML = '<i class="fas fa-angle-double-left"></i>';
            document.querySelectorAll('.sidebar-text').forEach(el => el.classList.remove('hidden'));
            document.querySelectorAll('.accordion-icon').forEach(icon => icon.classList.remove('hidden'));
            sidebarTitle.classList.remove('hidden');
            sidebarCollapsedTitle.classList.add('hidden');
            localStorage.setItem('sidebarCollapsed', 'false');
        }
    }

    // Leer estado persistente
    const collapsedStored = localStorage.getItem('sidebarCollapsed') === 'true';
    setSidebarState(collapsedStored);

    collapseBtn.addEventListener('click', () => {
        const isCollapsed = sidebar.classList.contains('w-18');
        setSidebarState(!isCollapsed);
    });

    // --- Acordeón secciones ---
    const accordions = document.querySelectorAll('.accordion-btn');
    accordions.forEach(btn => {
        const content = btn.parentElement.nextElementSibling;
        content.classList.add('close'); 
        btn.addEventListener('click', () => {
            content.classList.toggle('open');
            const icon = btn.querySelector('.accordion-icon');
            icon.classList.toggle('fa-chevron-down');
            icon.classList.toggle('fa-chevron-up');
        });
    });

    // --- Perfil dropdown ---
    const profileBtn = document.getElementById('profileMenuBtn');
    const dropdown = document.getElementById('profileDropdown');
    if(profileBtn && dropdown) {
        profileBtn.addEventListener('click', () => dropdown.classList.toggle('hidden'));
        document.addEventListener('click', (e) => {
            if (!profileBtn.contains(e.target) && !dropdown.contains(e.target)) dropdown.classList.add('hidden');
        });
    }
});

// --- Modal Editar Perfil ---
function openEditProfileModal() {
    document.getElementById('editProfileModal').classList.remove('hidden');
    const dropdown = document.getElementById('profileDropdown');
    if(dropdown) dropdown.classList.add('hidden');
}
function closeEditProfileModal() {
    document.getElementById('editProfileModal').classList.add('hidden');
}
</script>
