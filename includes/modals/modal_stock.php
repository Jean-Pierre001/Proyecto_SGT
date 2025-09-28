<!-- Modal Agregar Producto -->
<div id="addStockModal" class="hidden fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
  <div class="bg-white p-4 rounded-xl shadow-lg w-full max-w-2xl relative">
    <h2 class="text-xl font-semibold mb-4 text-gray-800 text-center">Agregar Producto</h2>
    <form action="stock_back/add_stock.php" method="POST" enctype="multipart/form-data" class="grid grid-cols-2 gap-3 text-sm">
      
      <div class="col-span-2">
        <label class="block text-gray-700 font-medium mb-1">Nombre</label>
        <input type="text" name="name" class="w-full border border-gray-300 rounded px-2 py-1" required>
      </div>

      <div>
        <label class="block text-gray-700 font-medium mb-1">Código</label>
        <input type="text" name="code" class="w-full border border-gray-300 rounded px-2 py-1">
      </div>

      <div>
        <label class="block text-gray-700 font-medium mb-1">Precio Compra</label>
        <input type="number" name="cost_price" step="0.01" class="w-full border border-gray-300 rounded px-2 py-1">
      </div>

      <div>
        <label class="block text-gray-700 font-medium mb-1">Precio Venta</label>
        <input type="number" name="sale_price" step="0.01" class="w-full border border-gray-300 rounded px-2 py-1">
      </div>

      <div>
        <label class="block text-gray-700 font-medium mb-1">Stock</label>
        <input type="number" name="stock" step="0.01" class="w-full border border-gray-300 rounded px-2 py-1">
      </div>

      <div>
        <label class="block text-gray-700 font-medium mb-1">Stock Mínimo</label>
        <input type="number" name="min_stock" step="0.01" class="w-full border border-gray-300 rounded px-2 py-1">
      </div>

      <div>
        <label class="block text-gray-700 font-medium mb-1">Marca</label>
        <input type="text" name="brand" class="w-full border border-gray-300 rounded px-2 py-1">
      </div>

      <div>
        <label class="block text-gray-700 font-medium mb-1">IVA (%)</label>
        <input type="number" name="vat" step="0.01" value="21.00" class="w-full border border-gray-300 rounded px-2 py-1">
      </div>

      <div class="col-span-2">
        <label class="block text-gray-700 font-medium mb-1">Foto</label>
        <input type="file" name="photo" class="w-full border border-gray-300 rounded px-2 py-1">
      </div>

      <div>
        <label class="block text-gray-700 font-medium mb-1">Categoría</label>
        <select name="id_category" class="w-full border border-gray-300 rounded px-2 py-1">
          <option value="">-- Seleccionar --</option>
          <?php foreach($categories as $cat): ?>
            <option value="<?= $cat['id_category'] ?>"><?= $cat['name'] ?></option>
          <?php endforeach; ?>
        </select>
      </div>

      <div>
        <label class="block text-gray-700 font-medium mb-1">Proveedor</label>
        <select name="id_supplier" class="w-full border border-gray-300 rounded px-2 py-1">
          <option value="">-- Seleccionar --</option>
          <?php foreach($suppliers as $sup): ?>
            <option value="<?= $sup['id_supplier'] ?>"><?= $sup['name'] ?></option>
          <?php endforeach; ?>
        </select>
      </div>

      <div class="col-span-2 flex justify-end space-x-2 mt-3">
        <button type="button" id="closeAddStockModal" class="px-3 py-1 bg-gray-500 text-white rounded">Cancelar</button>
        <button type="submit" class="px-3 py-1 bg-green-600 text-white rounded">Guardar</button>
      </div>
    </form>
  </div>
</div>

<script>
const addStockModal = document.getElementById('addStockModal');
document.getElementById('openAddModal').addEventListener('click', () => addStockModal.classList.remove('hidden'));
document.getElementById('closeAddStockModal').addEventListener('click', () => addStockModal.classList.add('hidden'));
</script>

<!-- Modal Mostrar Producto -->
<div id="showStockModal" class="hidden fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
  <div class="bg-white p-6 rounded-2xl shadow-2xl w-11/12 md:w-2/3 lg:w-1/2 max-h-[90vh] overflow-y-auto">
    <div class="flex justify-between items-center mb-4 border-b border-gray-200 pb-2">
      <h2 class="text-2xl font-bold text-gray-800">Detalles del Producto</h2>
      <button id="closeShowStockModal" class="text-gray-500 hover:text-gray-800 text-lg">&times;</button>
    </div>
    <div id="showStockContent" class="text-gray-700 text-sm">
      <p class="text-center text-gray-400">Cargando...</p>
    </div>
    <div class="mt-6 flex justify-end">
      <button id="closeShowStockBtn" class="bg-blue-600 hover:bg-blue-700 text-white px-5 py-2 rounded-lg">Cerrar</button>
    </div>
  </div>
</div>

<script>
const showStockModal = document.getElementById('showStockModal');
const closeShowStockModal = document.getElementById('closeShowStockModal');
const closeShowStockBtn = document.getElementById('closeShowStockBtn');

document.querySelectorAll('.show-modal').forEach(btn => {
  btn.addEventListener('click', () => {
    showStockModal.classList.remove('hidden');
    const id = btn.dataset.id;
    document.getElementById('showStockContent').innerHTML = '<p class="text-center text-gray-400">Cargando...</p>';

    fetch('stock_back/get_stock.php?id=' + id)
      .then(res => res.json())
      .then(stock => {
        if(!stock) return document.getElementById('showStockContent').innerHTML = '<p class="text-center text-red-500">Producto no encontrado.</p>';

        const campos = {
          id_stock: 'ID',
          name: 'Nombre',
          code: 'Código',
          cost_price: 'Precio Compra',
          sale_price: 'Precio Venta',
          stock: 'Stock',
          min_stock: 'Stock Mínimo',
          brand: 'Marca',
          vat: 'IVA',
          photo: 'Foto',
          category_name: 'Categoría',
          supplier_name: 'Proveedor'
        };

        let html = '<table class="w-full table-auto border border-gray-300 text-sm"><tbody>';
        let i = 0;
        for(const key in campos){
          let value = stock[key] ?? '';
          if(key === 'photo' && value) value = `<img src="${value}" class="w-24 h-24 object-cover rounded mx-auto">`;
          const rowColor = i % 2 === 0 ? 'bg-gray-50' : 'bg-white';
          html += `<tr class="${rowColor} border-b border-gray-200">
                     <td class="px-4 py-2 font-medium text-gray-800 w-1/3">${campos[key]}</td>
                     <td class="px-4 py-2 text-gray-700">${value}</td>
                   </tr>`;
          i++;
        }
        html += '</tbody></table>';
        document.getElementById('showStockContent').innerHTML = html;
      });
  });
});

closeShowStockModal.addEventListener('click', () => showStockModal.classList.add('hidden'));
closeShowStockBtn.addEventListener('click', () => showStockModal.classList.add('hidden'));
</script>

<!-- Modal Editar Producto -->
<div id="editStockModal" class="hidden fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
  <div class="bg-white p-4 rounded-xl shadow-lg w-full max-w-2xl relative">
    <h2 class="text-xl font-semibold mb-4 text-gray-800 text-center">Editar Producto</h2>
    <form id="editStockForm" action="stock_back/edit_stock.php" method="POST" enctype="multipart/form-data" class="grid grid-cols-2 gap-3 text-sm">
      <input type="hidden" name="id_stock" id="edit_id_stock">

      <div class="col-span-2">
        <label>Nombre</label>
        <input type="text" name="name" id="edit_name" class="w-full border rounded px-2 py-1" required>
      </div>
      <div>
        <label>Código</label>
        <input type="text" name="code" id="edit_code" class="w-full border rounded px-2 py-1">
      </div>
      <div>
        <label>Precio Compra</label>
        <input type="number" name="cost_price" id="edit_cost_price" step="0.01" class="w-full border rounded px-2 py-1">
      </div>
      <div>
        <label>Precio Venta</label>
        <input type="number" name="sale_price" id="edit_sale_price" step="0.01" class="w-full border rounded px-2 py-1">
      </div>
      <div>
        <label>Stock</label>
        <input type="number" name="stock" id="edit_stock" step="0.01" class="w-full border rounded px-2 py-1">
      </div>
      <div>
        <label>Stock Mínimo</label>
        <input type="number" name="min_stock" id="edit_min_stock" step="0.01" class="w-full border rounded px-2 py-1">
      </div>
      <div>
        <label>Marca</label>
        <input type="text" name="brand" id="edit_brand" class="w-full border rounded px-2 py-1">
      </div>
      <div>
        <label>IVA (%)</label>
        <input type="number" name="vat" id="edit_vat" step="0.01" class="w-full border rounded px-2 py-1">
      </div>
      <div class="col-span-2">
        <label>Foto (opcional)</label>
        <input type="file" name="photo" id="edit_photo" class="w-full border rounded px-2 py-1">
        <div id="edit_photo_preview" class="mt-2"></div>
      </div>
      <div>
        <label>Categoría</label>
        <select name="id_category" id="edit_id_category" class="w-full border rounded px-2 py-1">
          <option value="">-- Seleccionar --</option>
          <?php foreach($categories as $cat): ?>
            <option value="<?= $cat['id_category'] ?>"><?= $cat['name'] ?></option>
          <?php endforeach; ?>
        </select>
      </div>
      <div>
        <label>Proveedor</label>
        <select name="id_supplier" id="edit_id_supplier" class="w-full border rounded px-2 py-1">
          <option value="">-- Seleccionar --</option>
          <?php foreach($suppliers as $sup): ?>
            <option value="<?= $sup['id_supplier'] ?>"><?= $sup['name'] ?></option>
          <?php endforeach; ?>
        </select>
      </div>

      <div class="col-span-2 flex justify-end space-x-2 mt-3">
        <button type="button" id="closeEditStockModal" class="px-3 py-1 bg-gray-500 text-white rounded">Cancelar</button>
        <button type="submit" class="px-3 py-1 bg-green-600 text-white rounded">Guardar</button>
      </div>
    </form>
  </div>
</div>

<script>
const editStockModal = document.getElementById('editStockModal');
const closeEditStockModal = document.getElementById('closeEditStockModal');

document.querySelectorAll('.edit-modal-btn').forEach(btn => {
  btn.addEventListener('click', () => {
    const id = btn.dataset.id;

    fetch('stock_back/get_stock.php?id=' + id)
      .then(res => res.json())
      .then(data => {
        if(!data) return;

        document.getElementById('edit_id_stock').value = data.id_stock;
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
        document.getElementById('edit_photo_preview').innerHTML = data.photo ? `<img src="${data.photo}" class="w-24 h-24 object-cover rounded mt-2">` : '';

        editStockModal.classList.remove('hidden');
      });
  });
});

closeEditStockModal.addEventListener('click', () => editStockModal.classList.add('hidden'));
</script>
