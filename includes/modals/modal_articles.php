<div id="addArticleModal" class="hidden fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
  <div class="bg-white p-4 rounded-xl shadow-lg w-full max-w-2xl relative">
    <h2 class="text-xl font-semibold mb-4 text-gray-800 text-center">Agregar Nuevo Artículo</h2>
    <form action="articles_back/add_article.php" method="POST" enctype="multipart/form-data" class="grid grid-cols-2 gap-3 text-sm">
      <!-- Nombre -->
      <div class="col-span-2">
        <label class="block text-gray-700 font-medium mb-1">Nombre</label>
        <input type="text" name="name" class="w-full border border-gray-300 rounded px-2 py-1 focus:outline-none focus:ring-2 focus:ring-blue-500" required>
      </div>
      
      <!-- Código Interno -->
      <div>
        <label class="block text-gray-700 font-medium mb-1">Código Interno</label>
        <input type="text" name="code" class="w-full border border-gray-300 rounded px-2 py-1 focus:outline-none focus:ring-2 focus:ring-blue-500">
      </div>
      
      <!-- Precio de Compra -->
      <div>
        <label class="block text-gray-700 font-medium mb-1">Precio de Compra</label>
        <input type="number" name="cost_price" step="0.01" class="w-full border border-gray-300 rounded px-2 py-1 focus:outline-none focus:ring-2 focus:ring-blue-500">
      </div>
      
      <!-- Precio de Venta -->
      <div>
        <label class="block text-gray-700 font-medium mb-1">Precio de Venta</label>
        <input type="number" name="sale_price" step="0.01" class="w-full border border-gray-300 rounded px-2 py-1 focus:outline-none focus:ring-2 focus:ring-blue-500">
      </div>
      
      <!-- Stock -->
      <div>
        <label class="block text-gray-700 font-medium mb-1">Stock</label>
        <input type="number" name="stock" step="0.01" class="w-full border border-gray-300 rounded px-2 py-1 focus:outline-none focus:ring-2 focus:ring-blue-500">
      </div>
      
      <!-- Stock Mínimo -->
      <div>
        <label class="block text-gray-700 font-medium mb-1">Stock Mínimo</label>
        <input type="number" name="min_stock" step="0.01" class="w-full border border-gray-300 rounded px-2 py-1 focus:outline-none focus:ring-2 focus:ring-blue-500">
      </div>
      
      <!-- Marca -->
      <div>
        <label class="block text-gray-700 font-medium mb-1">Marca</label>
        <input type="text" name="brand" class="w-full border border-gray-300 rounded px-2 py-1 focus:outline-none focus:ring-2 focus:ring-blue-500">
      </div>
      
      <!-- IVA -->
      <div>
        <label class="block text-gray-700 font-medium mb-1">IVA (%)</label>
        <input type="number" name="vat" step="0.01" value="21.00" class="w-full border border-gray-300 rounded px-2 py-1 focus:outline-none focus:ring-2 focus:ring-blue-500">
      </div>
      
      <!-- Foto -->
      <div class="col-span-2">
        <label class="block text-gray-700 font-medium mb-1">Foto</label>
        <input type="file" name="photo" class="w-full border border-gray-300 rounded px-2 py-1 focus:outline-none focus:ring-2 focus:ring-blue-500">
      </div>
      
      <!-- Categoría -->
      <div>
        <label class="block text-gray-700 font-medium mb-1">Categoría (opcional)</label>
        <select name="id_category" class="w-full border border-gray-300 rounded px-2 py-1 focus:outline-none focus:ring-2 focus:ring-blue-500">
          <option value="">-- Seleccionar --</option>
          <?php
            $categories = $conn->query("SELECT id_category, name FROM categories ORDER BY name ASC")->fetchAll();
            foreach($categories as $cat){
              echo "<option value='{$cat['id_category']}'>{$cat['name']}</option>";
            }
          ?>
        </select>
      </div>
      
      <!-- Proveedor -->
      <div>
        <label class="block text-gray-700 font-medium mb-1">Proveedor (opcional)</label>
        <select name="id_supplier" class="w-full border border-gray-300 rounded px-2 py-1 focus:outline-none focus:ring-2 focus:ring-blue-500">
          <option value="">-- Seleccionar --</option>
          <?php
            $suppliers = $conn->query("SELECT id_supplier, name FROM suppliers ORDER BY name ASC")->fetchAll();
            foreach($suppliers as $sup){
              echo "<option value='{$sup['id_supplier']}'>{$sup['name']}</option>";
            }
          ?>
        </select>
      </div>
      
      <!-- Botones -->
      <div class="col-span-2 flex justify-end space-x-2 mt-3">
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

<!-- Modal para mostrar detalles del artículo -->
<div id="articleModal" class="hidden fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
  <div class="bg-white p-6 rounded-2xl shadow-2xl w-11/12 md:w-2/3 lg:w-1/2 max-h-[90vh] overflow-y-auto transform transition-transform scale-95">
    
    <!-- Encabezado del modal -->
    <div class="flex justify-between items-center mb-4 border-b border-gray-200 pb-2">
      <h2 class="text-2xl font-bold text-gray-800">Detalles del Artículo</h2>
      <button id="closeModal" class="text-gray-500 hover:text-gray-800 transition text-lg">&times;</button>
    </div>
    
    <!-- Contenido dinámico -->
    <div id="modalContent" class="text-gray-700 text-sm">
      <p class="text-center text-gray-400">Cargando...</p>
    </div>

    <!-- Footer -->
    <div class="mt-6 flex justify-end">
      <button id="closeModalBtn" class="bg-blue-600 hover:bg-blue-700 text-white px-5 py-2 rounded-lg shadow-md transition">
        Cerrar
      </button>
    </div>
  </div>
</div>

<script>
const modal = document.getElementById('articleModal');
const closeModal = document.getElementById('closeModal');
const closeModalBtn = document.getElementById('closeModalBtn');

// Mapeo de nombres de campos en español
const camposEsp = {
  "id_article": "ID",
  "name": "Nombre",
  "code": "Código Interno",
  "cost_price": "Precio de Compra",
  "sale_price": "Precio de Venta",
  "stock": "Stock",
  "min_stock": "Stock Mínimo",
  "brand": "Marca",
  "vat": "IVA",
  "photo": "Foto",
  "category_name": "Categoría",
  "supplier_name": "Proveedor"
};

document.querySelectorAll('.show-modal').forEach(btn => {
  btn.addEventListener('click', () => {
    modal.classList.remove('hidden');
    const id = btn.dataset.id;
    document.getElementById('modalContent').innerHTML = '<p class="text-center text-gray-400">Cargando detalles...</p>';

    fetch('articles_back/get_article.php?id=' + id)
      .then(response => response.json())
      .then(article => {
        if(!article) {
          document.getElementById('modalContent').innerHTML = '<p class="text-center text-red-500">Artículo no encontrado.</p>';
          return;
        }

        let html = '<table class="w-full table-auto border border-gray-300 text-sm">';
        html += '<tbody>';
        let i = 0;
        for(const key in camposEsp) {
          const label = camposEsp[key];
          let value = article[key] ?? '';
          
          // Mostrar imagen si es el campo photo
          if(key === 'photo' && value) {
            value = `<img src="${value}" class="w-24 h-24 object-cover rounded mx-auto">`;
          }

          const rowColor = i % 2 === 0 ? 'bg-gray-50' : 'bg-white';
          html += `<tr class="${rowColor} border-b border-gray-200">
                     <td class="px-4 py-2 font-medium text-gray-800 w-1/3">${label}</td>
                     <td class="px-4 py-2 text-gray-700">${value}</td>
                   </tr>`;
          i++;
        }
        html += '</tbody></table>';

        document.getElementById('modalContent').innerHTML = html;
      })
      .catch(err => {
        document.getElementById('modalContent').innerHTML = '<p class="text-center text-red-500">Error al cargar los datos.</p>';
        console.error(err);
      });
  });
});

closeModal.addEventListener('click', () => modal.classList.add('hidden'));
closeModalBtn.addEventListener('click', () => modal.classList.add('hidden'));
</script>

<!-- Modal para editar artículo -->
<div id="editArticleModal" class="hidden fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
  <div class="bg-white p-4 rounded-xl shadow-lg w-full max-w-2xl relative">
    <h2 class="text-xl font-semibold mb-4 text-gray-800 text-center">Editar Artículo</h2>
    <form id="editArticleForm" action="articles_back/edit_article.php" method="POST" enctype="multipart/form-data" class="grid grid-cols-2 gap-3 text-sm">
      <input type="hidden" name="id_article" id="edit_id_article">

      <!-- Nombre -->
      <div class="col-span-2">
        <label class="block text-gray-700 font-medium mb-1">Nombre</label>
        <input type="text" name="name" id="edit_name" class="w-full border border-gray-300 rounded px-2 py-1 focus:outline-none focus:ring-2 focus:ring-blue-500" required>
      </div>

      <!-- Código Interno -->
      <div>
        <label class="block text-gray-700 font-medium mb-1">Código Interno</label>
        <input type="text" name="code" id="edit_code" class="w-full border border-gray-300 rounded px-2 py-1 focus:outline-none focus:ring-2 focus:ring-blue-500">
      </div>

      <!-- Precio de Compra -->
      <div>
        <label class="block text-gray-700 font-medium mb-1">Precio de Compra</label>
        <input type="number" name="cost_price" step="0.01" id="edit_cost_price" class="w-full border border-gray-300 rounded px-2 py-1 focus:outline-none focus:ring-2 focus:ring-blue-500">
      </div>

      <!-- Precio de Venta -->
      <div>
        <label class="block text-gray-700 font-medium mb-1">Precio de Venta</label>
        <input type="number" name="sale_price" step="0.01" id="edit_sale_price" class="w-full border border-gray-300 rounded px-2 py-1 focus:outline-none focus:ring-2 focus:ring-blue-500">
      </div>

      <!-- Stock -->
      <div>
        <label class="block text-gray-700 font-medium mb-1">Stock</label>
        <input type="number" name="stock" step="0.01" id="edit_stock" class="w-full border border-gray-300 rounded px-2 py-1 focus:outline-none focus:ring-2 focus:ring-blue-500">
      </div>

      <!-- Stock Mínimo -->
      <div>
        <label class="block text-gray-700 font-medium mb-1">Stock Mínimo</label>
        <input type="number" name="min_stock" step="0.01" id="edit_min_stock" class="w-full border border-gray-300 rounded px-2 py-1 focus:outline-none focus:ring-2 focus:ring-blue-500">
      </div>

      <!-- Marca -->
      <div>
        <label class="block text-gray-700 font-medium mb-1">Marca</label>
        <input type="text" name="brand" id="edit_brand" class="w-full border border-gray-300 rounded px-2 py-1 focus:outline-none focus:ring-2 focus:ring-blue-500">
      </div>

      <!-- IVA -->
      <div>
        <label class="block text-gray-700 font-medium mb-1">IVA (%)</label>
        <input type="number" name="vat" step="0.01" id="edit_vat" class="w-full border border-gray-300 rounded px-2 py-1 focus:outline-none focus:ring-2 focus:ring-blue-500">
      </div>

      <!-- Foto -->
      <div class="col-span-2">
        <label class="block text-gray-700 font-medium mb-1">Foto (opcional)</label>
        <input type="file" name="photo" id="edit_photo" class="w-full border border-gray-300 rounded px-2 py-1 focus:outline-none focus:ring-2 focus:ring-blue-500">
        <div id="edit_photo_preview" class="mt-1"></div>
      </div>

      <!-- Categoría -->
      <div>
        <label class="block text-gray-700 font-medium mb-1">Categoría (opcional)</label>
        <select name="id_category" id="edit_id_category" class="w-full border border-gray-300 rounded px-2 py-1 focus:outline-none focus:ring-2 focus:ring-blue-500">
          <option value="">-- Seleccionar --</option>
          <?php foreach($categories as $cat): ?>
            <option value="<?= $cat['id_category'] ?>"><?= $cat['name'] ?></option>
          <?php endforeach; ?>
        </select>
      </div>

      <!-- Proveedor -->
      <div>
        <label class="block text-gray-700 font-medium mb-1">Proveedor (opcional)</label>
        <select name="id_supplier" id="edit_id_supplier" class="w-full border border-gray-300 rounded px-2 py-1 focus:outline-none focus:ring-2 focus:ring-blue-500">
          <option value="">-- Seleccionar --</option>
          <?php foreach($suppliers as $sup): ?>
            <option value="<?= $sup['id_supplier'] ?>"><?= $sup['name'] ?></option>
          <?php endforeach; ?>
        </select>
      </div>

      <!-- Botones -->
      <div class="col-span-2 flex justify-end space-x-2 mt-3">
        <button type="button" id="cancelEditModal" class="px-3 py-1 bg-gray-500 hover:bg-gray-600 text-white rounded">Cancelar</button>
        <button type="submit" class="px-3 py-1 bg-green-600 hover:bg-green-700 text-white rounded">Guardar</button>
      </div>
    </form>
  </div>
</div>

<script>
const editModal = document.getElementById('editArticleModal');
const cancelEditModal = document.getElementById('cancelEditModal');
const closeEditModal = document.getElementById('closeEditModal');

document.querySelectorAll('.edit-modal-btn').forEach(btn => {
  btn.addEventListener('click', () => {
    const id = btn.dataset.id;

    fetch('articles_back/get_article.php?id=' + id)
      .then(res => res.json())
      .then(data => {
        if(!data) return;

        // Llenar campos
        document.getElementById('edit_id_article').value = data.id_article;
        document.getElementById('edit_name').value = data.name;
        document.getElementById('edit_code').value = data.code ?? '';
        document.getElementById('edit_cost_price').value = data.cost_price ?? '';
        document.getElementById('edit_sale_price').value = data.sale_price ?? '';
        document.getElementById('edit_stock').value = data.stock ?? '';
        document.getElementById('edit_min_stock').value = data.min_stock ?? '';
        document.getElementById('edit_brand').value = data.brand ?? '';
        document.getElementById('edit_vat').value = data.vat ?? 21;
        document.getElementById('edit_id_category').value = data.id_category ?? '';
        document.getElementById('edit_id_supplier').value = data.id_supplier ?? '';

        if(data.photo) {
          document.getElementById('edit_photo_preview').innerHTML = `<img src="${data.photo}" class="w-24 h-24 object-cover rounded mt-2">`;
        } else {
          document.getElementById('edit_photo_preview').innerHTML = '';
        }

        editModal.classList.remove('hidden');
      });
  });
});

closeEditModal.addEventListener('click', () => editModal.classList.add('hidden'));
cancelEditModal.addEventListener('click', () => editModal.classList.add('hidden'));
</script>


