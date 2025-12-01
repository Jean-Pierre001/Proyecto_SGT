<!-- Modal Permisos -->
<div id="permissionsModal" class="hidden fixed inset-0 bg-black bg-opacity-60 flex items-center justify-center z-50 p-4 overflow-auto">
  <div class="bg-white rounded-xl shadow-2xl w-full max-w-6xl relative animate-fade-in flex flex-col overflow-hidden">

    <!-- Encabezado -->
    <div class="bg-gradient-to-r from-blue-800 to-blue-900 text-white px-6 py-4 flex justify-between items-center">
      <h2 class="text-xl md:text-2xl font-semibold tracking-wide text-center md:text-left">
        Permisos del Rol: <span id="roleNamePermissions" class="font-bold text-yellow-300"></span>
      </h2>
      <button onclick="closeModal('permissionsModal')" class="text-white hover:text-yellow-400 transition text-3xl md:text-2xl">&times;</button>
    </div>

    <!-- Cuerpo -->
    <div class="flex-1 overflow-y-auto p-5 max-h-[80vh] space-y-5">
      <form id="permissionsForm" method="POST" action="roles_back/save_permissions.php" class="space-y-4">
        <input type="hidden" name="role_id" id="permissionsRoleId">

        <!-- Dashboard -->
        <?php if(isset($permissions['index.php'])): ?>
        <div>
          <label class="flex items-center justify-between cursor-pointer p-3 rounded-lg hover:bg-gray-100 transition">
            <div class="flex items-center">
              <i class="fas fa-dumbbell mr-3 text-blue-600"></i>
              <span class="font-medium">Inicio</span>
            </div>
            <input type="checkbox" class="accent-blue-600 parent-checkbox" data-target="dashboard">
          </label>
          <div class="ml-8 mt-2 space-y-2 text-sm text-gray-700">
            <label class="flex items-center gap-2">
              <input type="checkbox" name="permissions[]" value="index.php:view" class="child-dashboard accent-blue-600"> Ver
            </label>
          </div>
        </div>
        <?php endif; ?>

        <!-- SOCIOS -->
        <?php 
        $member_pages = ['members.php','memberships.php','payments.php'];
        $has_members = false;
        foreach($member_pages as $page){
            if(isset($permissions[$page])){ $has_members=true; break; }
        }
        ?>
        <?php if($has_members): ?>
        <div>
          <label class="flex items-center justify-between cursor-pointer p-3 rounded-lg hover:bg-gray-100 transition">
            <div class="flex items-center">
              <i class="fas fa-users mr-3 text-blue-600"></i>
              <span class="font-medium">SOCIOS</span>
            </div>
            <input type="checkbox" class="accent-blue-600 parent-checkbox" data-target="members">
          </label>
          <div class="ml-8 mt-2 space-y-2 text-sm text-gray-700">
            <?php if(isset($permissions['members.php'])): ?>
            <label class="flex items-center gap-2">
              <input type="checkbox" name="permissions[]" value="members.php:view" class="child-members accent-blue-600"> Gestión de Socios
            </label>
            <?php endif; ?>
            <?php if(isset($permissions['memberships.php'])): ?>
            <label class="flex items-center gap-2">
              <input type="checkbox" name="permissions[]" value="memberships.php:view" class="child-members accent-blue-600"> Membresías
            </label>
            <?php endif; ?>
            <?php if(isset($permissions['payments.php'])): ?>
            <label class="flex items-center gap-2">
              <input type="checkbox" name="permissions[]" value="payments.php:view" class="child-members accent-blue-600"> Pagos
            </label>
            <?php endif; ?>
          </div>
        </div>
        <?php endif; ?>

        <!-- PRODUCTOS -->
        <?php 
        $product_pages = ['products.php','stock_control.php','sales.php'];
        $has_products=false;
        foreach($product_pages as $page){
            if(isset($permissions[$page])){ $has_products=true; break; }
        }
        ?>
        <?php if($has_products): ?>
        <div>
          <label class="flex items-center justify-between cursor-pointer p-3 rounded-lg hover:bg-gray-100 transition">
            <div class="flex items-center">
              <i class="fas fa-boxes-stacked mr-3 text-blue-600"></i>
              <span class="font-medium">PRODUCTOS</span>
            </div>
            <input type="checkbox" class="accent-blue-600 parent-checkbox" data-target="products">
          </label>
          <div class="ml-8 mt-2 space-y-2 text-sm text-gray-700">
            <?php if(isset($permissions['products.php'])): ?>
            <label class="flex items-center gap-2">
              <input type="checkbox" name="permissions[]" value="products.php:view" class="child-products accent-blue-600"> Gestión de Productos
            </label>
            <?php endif; ?>
            <?php if(isset($permissions['stock_control.php'])): ?>
            <label class="flex items-center gap-2">
              <input type="checkbox" name="permissions[]" value="stock_control.php:view" class="child-products accent-blue-600"> Control de Stock
            </label>
            <?php endif; ?>
            <?php if(isset($permissions['sales.php'])): ?>
            <label class="flex items-center gap-2">
              <input type="checkbox" name="permissions[]" value="sales.php:view" class="child-products accent-blue-600"> Ventas
            </label>
            <?php endif; ?>
          </div>
        </div>
        <?php endif; ?>

        <!-- ADMINISTRADOR -->
        <?php 
        $admin_pages=['users.php','roles.php'];
        $has_admin=false;
        foreach($admin_pages as $page){
            if(isset($permissions[$page])){ $has_admin=true; break; }
        }
        ?>
        <?php if($has_admin): ?>
        <div>
          <label class="flex items-center justify-between cursor-pointer p-3 rounded-lg hover:bg-gray-100 transition">
            <div class="flex items-center">
              <i class="fas fa-user-gear mr-3 text-blue-600"></i>
              <span class="font-medium">ADMINISTRADOR</span>
            </div>
            <input type="checkbox" class="accent-blue-600 parent-checkbox" data-target="admin">
          </label>
          <div class="ml-8 mt-2 space-y-2 text-sm text-gray-700">
            <?php if(isset($permissions['users.php'])): ?>
            <label class="flex items-center gap-2">
              <input type="checkbox" name="permissions[]" value="users.php:view" class="child-admin accent-blue-600"> Usuarios
            </label>
            <?php endif; ?>
            <?php if(isset($permissions['roles.php'])): ?>
            <label class="flex items-center gap-2">
              <input type="checkbox" name="permissions[]" value="roles.php:view" class="child-admin accent-blue-600"> Roles
            </label>
            <?php endif; ?>
          </div>
        </div>
        <?php endif; ?>

      </form>
    </div>

    <!-- Pie -->
    <div class="bg-gray-100 border-t px-6 py-4 flex flex-col md:flex-row justify-end gap-2 md:gap-3 sticky bottom-0">
      <button type="button" onclick="closeModal('permissionsModal')" class="px-4 py-2 bg-gray-300 text-gray-800 rounded-lg hover:bg-gray-400 transition w-full md:w-auto">Cancelar</button>
      <button type="submit" form="permissionsForm" class="px-4 py-2 bg-green-600 text-white rounded-lg hover:bg-green-700 transition w-full md:w-auto">Guardar Permisos</button>
    </div>
  </div>
</div>

<script>
  // Abrir y cerrar modal
  function openModal(id){ const m=document.getElementById(id); m.classList.remove('hidden'); m.classList.add('flex'); }
  function closeModal(id){ const m=document.getElementById(id); m.classList.add('hidden'); m.classList.remove('flex'); }

  // Padres e hijos
  document.querySelectorAll('.parent-checkbox').forEach(parent=>{
    const target=parent.dataset.target;
    const children=document.querySelectorAll('.child-'+target);
    parent.addEventListener('change',()=>children.forEach(c=>c.checked=parent.checked));
  });
  document.querySelectorAll('#permissionsModal input[type=checkbox]').forEach(child=>{
    child.addEventListener('change',()=>{
      const match=child.className.match(/child-([^\s]+)/);
      if(!match) return;
      const target=match[1];
      const parent=document.querySelector(`.parent-checkbox[data-target="${target}"]`);
      const children=document.querySelectorAll(`.child-${target}`);
      if(parent) parent.checked=Array.from(children).every(c=>c.checked);
    });
  });

  // Abrir modal permisos y cargar checkboxes
  function openPermissionsModal(roleId, roleName=''){
    document.getElementById('permissionsRoleId').value=roleId;
    document.getElementById('roleNamePermissions').innerText=roleName;
    openModal('permissionsModal');

    document.querySelectorAll('#permissionsModal input[type=checkbox]').forEach(cb=>cb.checked=false);

    fetch(`roles_back/get_permissions.php?role_id=${roleId}`)
      .then(res=>res.json())
      .then(data=>{
        data.forEach(p=>{
          const cb=document.querySelector(`#permissionsModal input[value="${p.page}:${p.action}"]`);
          if(cb) cb.checked=true;
        });
        document.querySelectorAll('.parent-checkbox').forEach(parent=>{
          const target=parent.dataset.target;
          const children=document.querySelectorAll('.child-'+target);
          parent.checked=Array.from(children).every(c=>c.checked);
        });
      });
  }
</script>
