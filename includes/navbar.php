<header class="h-20 shadow-sm flex items-center justify-between px-6 border-b border-border-light/70 bg-white relative z-50">
    <!-- Botón hamburguesa para móvil -->
    <button id="mobile-menu-btn" class="block lg:hidden p-2 rounded hover:bg-gray-100 text-patagones-text-dark/70">
        <i class="fas fa-bars text-lg"></i>
    </button>

    <!-- Título -->
    <div class="flex items-center space-x-4">
    </div>

    <!-- Lado derecho: iconos y perfil -->
    <div class="flex items-center space-x-4">


        <!-- Perfil con acordeón -->
        <div class="relative">
            <button id="profileMenuBtn" class="flex items-center space-x-2 p-2 rounded-full hover:bg-gray-100 border border-border-light focus:outline-none transition">
                <div class="w-8 h-8 rounded-full bg-gray-200 flex items-center justify-center text-patagones-text-dark/70">
                    <i class="fas fa-user"></i>
                </div>
                <span class="text-sm font-medium text-patagones-text-dark">
                    <?= htmlspecialchars($_SESSION['first_name'] ?? 'Usuario'); ?>
                </span>
                <i class="fas fa-chevron-down text-xs text-gray-400"></i>
            </button>

            <!-- Acordeón -->
            <div id="profileDropdown"
                 class="absolute right-0 mt-2 w-48 bg-white border border-gray-200 rounded-lg shadow-lg hidden animate-fade-in">
                <button onclick="openEditProfileModal()" 
                        class="w-full text-left flex items-center px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 transition">
                    <i class="fas fa-user-edit mr-2 text-gray-500"></i> Editar perfil
                </button>
                <a href="logout.php" 
                   class="flex items-center px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 transition">
                    <i class="fas fa-sign-out-alt mr-2 text-gray-500"></i> Cerrar sesión
                </a>
            </div>
        </div>
    </div>
</header>
