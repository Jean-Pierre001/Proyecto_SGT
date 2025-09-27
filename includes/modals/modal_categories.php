<!-- MODALS CATEGORÍAS Y SUBCATEGORÍAS -->

<!-- Modal Agregar Categoría -->
<div id="addCategoryModal" class="hidden fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
  <div class="bg-white p-4 rounded-xl shadow-lg w-full max-w-2xl relative">
    <h2 class="text-xl font-semibold mb-4 text-gray-800 text-center">Agregar Nueva Categoría</h2>
    <form id="addCategoryForm" action="categories_back/add_category.php" method="POST" class="grid grid-cols-2 gap-3 text-sm">
      <div class="col-span-2">
        <label class="block text-gray-700 font-medium mb-1">Nombre</label>
        <input type="text" id="categoryName" name="name" class="w-full border border-gray-300 rounded px-2 py-1 focus:outline-none focus:ring-2 focus:ring-blue-500" required>
      </div>
      <div class="col-span-2">
        <label class="block text-gray-700 font-medium mb-1">Descripción</label>
        <textarea name="description" class="w-full border border-gray-300 rounded px-2 py-1 focus:outline-none focus:ring-2 focus:ring-blue-500"></textarea>
      </div>
      <div class="col-span-2 flex justify-end space-x-2 mt-3">
        <button type="button" id="closeAddCategoryModal" class="px-3 py-1 bg-gray-500 hover:bg-gray-600 text-white rounded">Cancelar</button>
        <button type="submit" class="px-3 py-1 bg-green-600 hover:bg-green-700 text-white rounded">Guardar</button>
      </div>
    </form>
  </div>
</div>

<!-- Modal Crear Subcategoría -->
<div id="addSubCategoryModal" class="hidden fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
  <div class="bg-white p-4 rounded-xl shadow-lg w-full max-w-2xl relative">
    <h2 class="text-xl font-semibold mb-4 text-gray-800 text-center">Crear Subcategoría</h2>
    <form id="addSubCategoryForm" action="categories_back/add_subcategory.php" method="POST" class="grid grid-cols-2 gap-3 text-sm">
      <div>
        <label class="block text-gray-700 font-medium mb-1">Categoría Principal</label>
        <select name="parent_id" class="w-full border border-gray-300 rounded px-2 py-1 focus:outline-none focus:ring-2 focus:ring-blue-500" required>
          <option value="">-- Seleccionar --</option>
          <?php foreach($mainCats as $cat): ?>
            <option value="<?= $cat['id_category'] ?>"><?= htmlspecialchars($cat['name']) ?></option>
          <?php endforeach; ?>
        </select>
      </div>
      <div>
        <label class="block text-gray-700 font-medium mb-1">Nombre</label>
        <input type="text" id="subCatName" name="name" class="w-full border border-gray-300 rounded px-2 py-1 focus:outline-none focus:ring-2 focus:ring-blue-500" required>
      </div>
      <div class="col-span-2">
        <label class="block text-gray-700 font-medium mb-1">Descripción</label>
        <textarea name="description" class="w-full border border-gray-300 rounded px-2 py-1 focus:outline-none focus:ring-2 focus:ring-blue-500"></textarea>
      </div>
      <div class="col-span-2 flex justify-end space-x-2 mt-3">
        <button type="button" id="closeAddSubCategoryModal" class="px-3 py-1 bg-gray-500 hover:bg-gray-600 text-white rounded">Cancelar</button>
        <button type="submit" class="px-3 py-1 bg-blue-600 hover:bg-blue-700 text-white rounded">Guardar</button>
      </div>
    </form>
  </div>
</div>

<script>
document.addEventListener('DOMContentLoaded', function() {
  // Abrir/Cerrar modales
  const addCategoryModal = document.getElementById('addCategoryModal');
  const addSubCategoryModal = document.getElementById('addSubCategoryModal');

  document.getElementById('openAddCategoryModal').addEventListener('click', () => addCategoryModal.classList.remove('hidden'));
  document.getElementById('closeAddCategoryModal').addEventListener('click', () => addCategoryModal.classList.add('hidden'));
  document.getElementById('openAddSubCategoryModal').addEventListener('click', () => addSubCategoryModal.classList.remove('hidden'));
  document.getElementById('closeAddSubCategoryModal').addEventListener('click', () => addSubCategoryModal.classList.add('hidden'));

  // Listas de nombres existentes
  const categoryNames = [
    <?php foreach($mainCats as $cat) { echo "'" . addslashes($cat['name']) . "',"; } ?>
  ];

  const subCategoryNames = [
    <?php foreach($subCats as $subs) { foreach($subs as $sub) { echo "'" . addslashes($sub['name']) . "',"; } } ?>
  ];

  // Validar Categoría
  const addCategoryForm = document.getElementById('addCategoryForm');
  const categoryNameInput = document.getElementById('categoryName');

  addCategoryForm.addEventListener('submit', function(e) {
    const name = categoryNameInput.value.trim();
    if(categoryNames.includes(name)) {
      e.preventDefault();
      Swal.fire({
        icon: 'warning',
        title: 'Nombre duplicado',
        text: 'Ya existe una categoría con este nombre. Cambialo para continuar.',
        confirmButtonText: 'Ok'
      });
    }
  });

  // Validar Subcategoría
  const addSubCategoryForm = document.getElementById('addSubCategoryForm');
  const subCatNameInput = document.getElementById('subCatName');

  addSubCategoryForm.addEventListener('submit', function(e) {
    const name = subCatNameInput.value.trim();
    if(categoryNames.includes(name) || subCategoryNames.includes(name)) {
      e.preventDefault();
      Swal.fire({
        icon: 'warning',
        title: 'Nombre duplicado',
        text: 'La subcategoría no puede tener el mismo nombre que una categoría o subcategoría existente.',
        confirmButtonText: 'Ok'
      });
    }
  });
});
</script>

<!-- Modal para editar categoría/subcategoría -->
<div id="editCategoryModal" class="hidden fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
  <div class="bg-white p-4 rounded-xl shadow-lg w-full max-w-md relative">
    <h2 class="text-xl font-semibold mb-4 text-gray-800 text-center">Editar Categoría/Subcategoría</h2>
    <form id="editCategoryForm" action="categories_back/edit_category.php" method="POST" class="grid grid-cols-1 gap-3 text-sm">
      <input type="hidden" name="id_category" id="edit_id_category">

      <!-- Nombre -->
      <div>
        <label class="block text-gray-700 font-medium mb-1">Nombre</label>
        <input type="text" name="name" id="edit_name" class="w-full border border-gray-300 rounded px-2 py-1 focus:outline-none focus:ring-2 focus:ring-blue-500" required>
      </div>

      <!-- Descripción -->
      <div>
        <label class="block text-gray-700 font-medium mb-1">Descripción</label>
        <textarea name="description" id="edit_description" class="w-full border border-gray-300 rounded px-2 py-1 focus:outline-none focus:ring-2 focus:ring-blue-500"></textarea>
      </div>

      <!-- Categoría padre (solo para subcategorías) -->
      <div>
        <label class="block text-gray-700 font-medium mb-1">Categoría Padre</label>
        <select name="parent_id" id="edit_parent_id" class="w-full border border-gray-300 rounded px-2 py-1 focus:outline-none focus:ring-2 focus:ring-blue-500">
          <option value="">-- Es categoría principal --</option>
          <?php
            $allCategories = $conn->query("SELECT id_category, name FROM categories WHERE parent_id IS NULL ORDER BY name ASC")->fetchAll(PDO::FETCH_ASSOC);
            foreach($allCategories as $c){
                echo "<option value='{$c['id_category']}'>{$c['name']}</option>";
            }
          ?>
        </select>
      </div>

      <!-- Botones -->
      <div class="flex justify-end space-x-2 mt-3">
        <button type="button" id="cancelEditCategory" class="px-3 py-1 bg-gray-500 hover:bg-gray-600 text-white rounded">Cancelar</button>
        <button type="submit" class="px-3 py-1 bg-green-600 hover:bg-green-700 text-white rounded">Guardar</button>
      </div>
    </form>
  </div>
</div>

<script>
const editCategoryModal = document.getElementById('editCategoryModal');
const cancelEditCategory = document.getElementById('cancelEditCategory');

document.querySelectorAll('.edit-category-btn').forEach(btn => {
    btn.addEventListener('click', function() {
        const id = this.dataset.id;

        fetch('categories_back/get_category.php?id=' + id)
        .then(res => res.json())
        .then(data => {
            if(!data) return;

            document.getElementById('edit_id_category').value = data.id_category;
            document.getElementById('edit_name').value = data.name;
            document.getElementById('edit_description').value = data.description ?? '';
            document.getElementById('edit_parent_id').value = data.parent_id ?? '';

            editCategoryModal.classList.remove('hidden');
        });
    });
});

cancelEditCategory.addEventListener('click', () => editCategoryModal.classList.add('hidden'));
</script>
