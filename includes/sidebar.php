<aside class="sidebar fixed left-0 top-0 h-screen w-48 p-4 hidden md:flex flex-col bg-blue-900 text-gray-200 shadow-lg">

  <!-- Título -->
  <div class="mb-6 text-center">
    <h2 class="text-base font-bold tracking-wide text-gray-100">SGT Panel</h2>
    <p class="text-xs text-gray-400">Gestión de Tienda</p>
  </div>

  <!-- Navegación -->
  <nav class="flex flex-col space-y-2">

    <!-- Inicio con estilo ABM Datos y funcionando como href -->
    <details class="group transition-all duration-300">
      <summary 
        class="flex items-center px-3 py-1 cursor-pointer rounded-lg hover:bg-blue-800 list-none"
        onclick="window.location.href='index.php';"
      >
        <i class="fas fa-home mr-2 text-cyan-400"></i>
        <span class="text-xs">Inicio</span>
      </summary>
    </details>
    
    <!-- ABM -->
    <details class="group transition-all duration-300">
      <summary class="flex items-center px-3 py-1 cursor-pointer rounded-lg hover:bg-blue-800">
        <i class="fas fa-database mr-2 text-cyan-400"></i>
        <span class="text-xs">ABM Datos</span>
      </summary>
      <div class="ml-8 mt-1 flex flex-col space-y-1 text-xs max-h-0 overflow-hidden transition-all duration-300">
        <a href="articles.php" class="hover:text-white"><i class="fas fa-box mr-2"></i> Productos</a>
        <a href="categories.php" class="hover:text-white"><i class="fas fa-tags mr-2"></i> Categorias</a>
        <a href="#" class="hover:text-white"><i class="fas fa-user mr-2"></i> Clientes</a>
        <a href="#" class="hover:text-white"><i class="fas fa-truck mr-2"></i> Provs.</a>
      </div>
    </details>

    <!-- Clientes -->
    <details class="group transition-all duration-300">
      <summary class="flex items-center px-3 py-1 cursor-pointer rounded-lg hover:bg-blue-800">
        <i class="fas fa-user-friends mr-2 text-green-400"></i>
        <span class="text-xs">Clientes</span>
      </summary>
      <div class="ml-8 mt-1 flex flex-col space-y-1 text-xs max-h-0 overflow-hidden transition-all duration-300">
        <a href="#" class="hover:text-white"><i class="fas fa-cart-plus mr-2"></i> Ventas</a>
        <a href="#" class="hover:text-white"><i class="fas fa-undo-alt mr-2"></i> Devolución</a>
        <a href="#" class="hover:text-white"><i class="fas fa-hand-holding-usd mr-2"></i> Cobranza</a>
        <a href="#" class="hover:text-white"><i class="fas fa-balance-scale mr-2"></i> Saldos</a>
        <a href="#" class="hover:text-white"><i class="fas fa-id-card mr-2"></i> Fichero</a>
      </div>
    </details>

    <!-- Proveedores -->
    <details class="group transition-all duration-300">
      <summary class="flex items-center px-3 py-1 cursor-pointer rounded-lg hover:bg-blue-800">
        <i class="fas fa-truck mr-2 text-yellow-400"></i>
        <span class="text-xs">Proveedores</span>
      </summary>
      <div class="ml-8 mt-1 flex flex-col space-y-1 text-xs max-h-0 overflow-hidden transition-all duration-300">
        <a href="#" class="hover:text-white"><i class="fas fa-file-invoice mr-2"></i> Compras</a>
        <a href="#" class="hover:text-white"><i class="fas fa-undo-alt mr-2"></i> Devolución</a>
        <a href="#" class="hover:text-white"><i class="fas fa-hand-holding-usd mr-2"></i> Cobranza</a>
        <a href="#" class="hover:text-white"><i class="fas fa-balance-scale mr-2"></i> Saldos</a>
        <a href="#" class="hover:text-white"><i class="fas fa-id-card mr-2"></i> Fichero</a>
      </div>
    </details>

    <!-- Stock -->
    <details class="group transition-all duration-300">
      <summary class="flex items-center px-3 py-1 cursor-pointer rounded-lg hover:bg-blue-800">
        <i class="fas fa-boxes mr-2 text-pink-400"></i>
        <span class="text-xs">Stock</span>
      </summary>
      <div class="ml-8 mt-1 flex flex-col space-y-1 text-xs max-h-0 overflow-hidden transition-all duration-300">
        <a href="#" class="hover:text-white"><i class="fas fa-sign-out-alt mr-2"></i> Salidas</a>
        <a href="#" class="hover:text-white"><i class="fas fa-warehouse mr-2"></i> Stock</a>
        <a href="#" class="hover:text-white"><i class="fas fa-sync-alt mr-2"></i> A Reponer</a>
      </div>
    </details>

    <!-- Caja -->
    <details class="group transition-all duration-300">
      <summary class="flex items-center px-3 py-1 cursor-pointer rounded-lg hover:bg-blue-800">
        <i class="fas fa-cash-register mr-2 text-purple-400"></i>
        <span class="text-xs">Caja</span>
      </summary>
      <div class="ml-8 mt-1 flex flex-col space-y-1 text-xs max-h-0 overflow-hidden transition-all duration-300">
        <a href="#" class="hover:text-white"><i class="fas fa-money-bill-wave mr-2"></i> Caja</a>
        <a href="#" class="hover:text-white"><i class="fas fa-file-alt mr-2"></i> Contaduría</a>
      </div>
    </details>

  </nav>

  <!-- Footer del sidebar -->
  <div class="mt-auto pt-4 border-t border-blue-700 flex items-center justify-center space-x-2">
    <span class="text-gray-300 text-xs">Hola, Admin</span>
    <img src="https://i.pravatar.cc/150?img=3" alt="Perfil" class="w-8 h-8 rounded-full">
  </div>

</aside>

<script>

  // Animación expandida
  const summaries = document.querySelectorAll('.sidebar summary');
  summaries.forEach(summary => {
    summary.addEventListener('click', e => {
      const div = summary.nextElementSibling;
      if(div) {
        if(div.style.maxHeight && div.style.maxHeight !== "0px") {
          div.style.maxHeight = "0px";
        } else {
          div.style.maxHeight = div.scrollHeight + "px";
        }
      }
    });
  });
</script>
