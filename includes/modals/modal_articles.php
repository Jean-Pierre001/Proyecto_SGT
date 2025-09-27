<div id="addArticleModal" class="hidden fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
  <div class="bg-white p-6 rounded shadow-lg w-96 relative">
    <h2 class="text-lg font-bold mb-4">Nuevo Artículo</h2>
    <form action="articles_back/add_article.php" method="POST">
      <div class="mb-3">
        <label class="block text-gray-700 text-sm mb-1">Nombre</label>
        <input type="text" name="name" class="w-full border border-gray-300 rounded px-2 py-1" required>
      </div>
      <div class="mb-3">
        <label class="block text-gray-700 text-sm mb-1">Precio Venta</label>
        <input type="number" name="sale_price" step="0.01" class="w-full border border-gray-300 rounded px-2 py-1" required>
      </div>
      <div class="mb-3">
        <label class="block text-gray-700 text-sm mb-1">Stock</label>
        <input type="number" name="stock" class="w-full border border-gray-300 rounded px-2 py-1" required>
      </div>
      <div class="mb-3">
        <label class="block text-gray-700 text-sm mb-1">Categoría (opcional)</label>
        <select name="id_category" class="w-full border border-gray-300 rounded px-2 py-1">
          <option value="">-- Seleccionar --</option>
          <?php
            $categories = $conn->query("SELECT id_category, name FROM categories ORDER BY name ASC")->fetchAll();
            foreach($categories as $cat){
              echo "<option value='{$cat['id_category']}'>{$cat['name']}</option>";
            }
          ?>
        </select>
      </div>
      <div class="mb-3">
        <label class="block text-gray-700 text-sm mb-1">Proveedor (opcional)</label>
        <select name="id_supplier" class="w-full border border-gray-300 rounded px-2 py-1">
          <option value="">-- Seleccionar --</option>
          <?php
            $suppliers = $conn->query("SELECT id_supplier, name FROM suppliers ORDER BY name ASC")->fetchAll();
            foreach($suppliers as $sup){
              echo "<option value='{$sup['id_supplier']}'>{$sup['name']}</option>";
            }
          ?>
        </select>
      </div>
      <div class="flex justify-end space-x-2 mt-4">
        <button type="button" id="closeAddModal" class="px-3 py-1 bg-gray-500 hover:bg-gray-600 text-white rounded">Cancelar</button>
        <button type="submit" class="px-3 py-1 bg-green-600 hover:bg-green-700 text-white rounded">Guardar</button>
      </div>
    </form>
  </div>
</div>

<script>
  const addModal = document.getElementById('addArticleModal');
  document.getElementById('openAddModal').addEventListener('click', () => addModal.classList.remove('hidden'));
  document.getElementById('closeAddModal').addEventListener('click', () => addModal.classList.add('hidden'));
</script>
