<!-- Modal para agregar proveedor -->
<div id="addSupplierModal" class="hidden fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
  <div class="bg-white p-4 rounded-xl shadow-lg w-full max-w-2xl relative">
    <h2 class="text-xl font-semibold mb-4 text-gray-800 text-center">Agregar Proveedor</h2>
    <form action="suppliers_back/add_supplier.php" method="POST" class="grid grid-cols-2 gap-3 text-sm">
      
      <!-- Nombre -->
      <div class="col-span-2">
        <label class="block text-gray-700 font-medium mb-1">Nombre o Razón Social</label>
        <input type="text" name="name" required class="w-full border border-gray-300 rounded px-2 py-1 focus:ring-2 focus:ring-blue-500">
      </div>

      <!-- Persona de contacto -->
      <div>
        <label class="block text-gray-700 font-medium mb-1">Persona de Contacto</label>
        <input type="text" name="contact_name" class="w-full border border-gray-300 rounded px-2 py-1 focus:ring-2 focus:ring-blue-500">
      </div>

      <!-- Teléfono -->
      <div>
        <label class="block text-gray-700 font-medium mb-1">Teléfono</label>
        <input type="text" name="phone" class="w-full border border-gray-300 rounded px-2 py-1 focus:ring-2 focus:ring-blue-500">
      </div>

      <!-- Email -->
      <div>
        <label class="block text-gray-700 font-medium mb-1">Email</label>
        <input type="email" name="email" class="w-full border border-gray-300 rounded px-2 py-1 focus:ring-2 focus:ring-blue-500">
      </div>

      <!-- Dirección -->
      <div>
        <label class="block text-gray-700 font-medium mb-1">Dirección</label>
        <input type="text" name="address" class="w-full border border-gray-300 rounded px-2 py-1 focus:ring-2 focus:ring-blue-500">
      </div>

      <!-- CUIT / ID fiscal -->
      <div>
        <label class="block text-gray-700 font-medium mb-1">CUIT / ID Fiscal</label>
        <input type="text" name="tax_id" class="w-full border border-gray-300 rounded px-2 py-1 focus:ring-2 focus:ring-blue-500">
      </div>

      <!-- Condiciones de pago -->
      <div>
        <label class="block text-gray-700 font-medium mb-1">Condiciones de Pago</label>
        <input type="text" name="payment_terms" class="w-full border border-gray-300 rounded px-2 py-1 focus:ring-2 focus:ring-blue-500">
      </div>

      <!-- Notas -->
      <div class="col-span-2">
        <label class="block text-gray-700 font-medium mb-1">Notas</label>
        <textarea name="notes" class="w-full border border-gray-300 rounded px-2 py-1 focus:ring-2 focus:ring-blue-500" rows="2"></textarea>
      </div>

      <!-- Botones -->
      <div class="col-span-2 flex justify-end space-x-2 mt-3">
        <button type="button" id="closeAddSupplierModal" class="px-3 py-1 bg-gray-500 hover:bg-gray-600 text-white rounded">Cancelar</button>
        <button type="submit" class="px-3 py-1 bg-green-600 hover:bg-green-700 text-white rounded">Guardar</button>
      </div>
    </form>
  </div>
</div>

<script>
const addSupplierModal = document.getElementById('addSupplierModal');
document.getElementById('openAddSupplierModal').addEventListener('click', () => addSupplierModal.classList.remove('hidden'));
document.getElementById('closeAddSupplierModal').addEventListener('click', () => addSupplierModal.classList.add('hidden'));
</script>

<!-- Modal para mostrar proveedor -->
<div id="supplierModal" class="hidden fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
  <div class="bg-white p-6 rounded-2xl shadow-2xl w-11/12 md:w-2/3 lg:w-1/2 max-h-[90vh] overflow-y-auto">
    
    <!-- Header -->
    <div class="flex justify-between items-center mb-4 border-b border-gray-200 pb-2">
      <h2 class="text-2xl font-bold text-gray-800">Detalles del Proveedor</h2>
      <button id="closeSupplierModal" class="text-gray-500 hover:text-gray-800 text-lg">&times;</button>
    </div>

    <!-- Contenido dinámico -->
    <div id="supplierContent" class="text-gray-700 text-sm">
      <p class="text-center text-gray-400">Cargando...</p>
    </div>

    <!-- Footer -->
    <div class="mt-6 flex justify-end">
      <button id="closeSupplierModalBtn" class="bg-blue-600 hover:bg-blue-700 text-white px-5 py-2 rounded-lg">Cerrar</button>
    </div>
  </div>
</div>

<script>
const supplierModal = document.getElementById('supplierModal');
const closeSupplierModal = document.getElementById('closeSupplierModal');
const closeSupplierModalBtn = document.getElementById('closeSupplierModalBtn');

const camposSupplier = {
  "id_supplier": "ID",
  "name": "Nombre o Razón Social",
  "contact_name": "Persona de Contacto",
  "phone": "Teléfono",
  "email": "Email",
  "address": "Dirección",
  "tax_id": "CUIT / ID Fiscal",
  "payment_terms": "Condiciones de Pago",
  "notes": "Notas",
  "created_at": "Fecha de Creación",
  "updated_at": "Última Modificación"
};

document.querySelectorAll('.show-supplier').forEach(btn => {
  btn.addEventListener('click', () => {
    supplierModal.classList.remove('hidden');
    const id = btn.dataset.id;
    document.getElementById('supplierContent').innerHTML = '<p class="text-center text-gray-400">Cargando...</p>';

    fetch('suppliers_back/get_supplier.php?id=' + id)
      .then(res => res.json())
      .then(data => {
        if(!data) {
          document.getElementById('supplierContent').innerHTML = '<p class="text-center text-red-500">Proveedor no encontrado.</p>';
          return;
        }

        let html = '<table class="w-full table-auto border border-gray-300 text-sm"><tbody>';
        let i = 0;
        for(const key in camposSupplier) {
          const label = camposSupplier[key];
          let value = data[key] ?? '';
          const rowColor = i % 2 === 0 ? 'bg-gray-50' : 'bg-white';
          html += `<tr class="${rowColor} border-b border-gray-200">
                     <td class="px-4 py-2 font-medium text-gray-800 w-1/3">${label}</td>
                     <td class="px-4 py-2 text-gray-700">${value}</td>
                   </tr>`;
          i++;
        }
        html += '</tbody></table>';
        document.getElementById('supplierContent').innerHTML = html;
      })
      .catch(err => {
        document.getElementById('supplierContent').innerHTML = '<p class="text-center text-red-500">Error al cargar datos.</p>';
      });
  });
});

closeSupplierModal.addEventListener('click', () => supplierModal.classList.add('hidden'));
closeSupplierModalBtn.addEventListener('click', () => supplierModal.classList.add('hidden'));
</script>

<!-- Modal para editar proveedor -->
<div id="editSupplierModal" class="hidden fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
  <div class="bg-white p-4 rounded-xl shadow-lg w-full max-w-2xl relative">
    <h2 class="text-xl font-semibold mb-4 text-gray-800 text-center">Editar Proveedor</h2>
    <form id="editSupplierForm" action="suppliers_back/edit_supplier.php" method="POST" class="grid grid-cols-2 gap-3 text-sm">
      <input type="hidden" name="id_supplier" id="edit_id_supplier">

      <!-- Nombre -->
      <div class="col-span-2">
        <label class="block text-gray-700 font-medium mb-1">Nombre o Razón Social</label>
        <input type="text" name="name" id="edit_name" required class="w-full border border-gray-300 rounded px-2 py-1 focus:ring-2 focus:ring-blue-500">
      </div>

      <!-- Persona de contacto -->
      <div>
        <label class="block text-gray-700 font-medium mb-1">Persona de Contacto</label>
        <input type="text" name="contact_name" id="edit_contact_name" class="w-full border border-gray-300 rounded px-2 py-1 focus:ring-2 focus:ring-blue-500">
      </div>

      <!-- Teléfono -->
      <div>
        <label class="block text-gray-700 font-medium mb-1">Teléfono</label>
        <input type="text" name="phone" id="edit_phone" class="w-full border border-gray-300 rounded px-2 py-1 focus:ring-2 focus:ring-blue-500">
      </div>

      <!-- Email -->
      <div>
        <label class="block text-gray-700 font-medium mb-1">Email</label>
        <input type="email" name="email" id="edit_email" class="w-full border border-gray-300 rounded px-2 py-1 focus:ring-2 focus:ring-blue-500">
      </div>

      <!-- Dirección -->
      <div>
        <label class="block text-gray-700 font-medium mb-1">Dirección</label>
        <input type="text" name="address" id="edit_address" class="w-full border border-gray-300 rounded px-2 py-1 focus:ring-2 focus:ring-blue-500">
      </div>

      <!-- CUIT / ID fiscal -->
      <div>
        <label class="block text-gray-700 font-medium mb-1">CUIT / ID Fiscal</label>
        <input type="text" name="tax_id" id="edit_tax_id" class="w-full border border-gray-300 rounded px-2 py-1 focus:ring-2 focus:ring-blue-500">
      </div>

      <!-- Condiciones de pago -->
      <div>
        <label class="block text-gray-700 font-medium mb-1">Condiciones de Pago</label>
        <input type="text" name="payment_terms" id="edit_payment_terms" class="w-full border border-gray-300 rounded px-2 py-1 focus:ring-2 focus:ring-blue-500">
      </div>

      <!-- Notas -->
      <div class="col-span-2">
        <label class="block text-gray-700 font-medium mb-1">Notas</label>
        <textarea name="notes" id="edit_notes" class="w-full border border-gray-300 rounded px-2 py-1 focus:ring-2 focus:ring-blue-500" rows="2"></textarea>
      </div>

      <!-- Botones -->
      <div class="col-span-2 flex justify-end space-x-2 mt-3">
        <button type="button" id="cancelEditSupplier" class="px-3 py-1 bg-gray-500 hover:bg-gray-600 text-white rounded">Cancelar</button>
        <button type="submit" class="px-3 py-1 bg-green-600 hover:bg-green-700 text-white rounded">Guardar</button>
      </div>
    </form>
  </div>
</div>

<script>
const editSupplierModal = document.getElementById('editSupplierModal');
const cancelEditSupplier = document.getElementById('cancelEditSupplier');

document.querySelectorAll('.edit-supplier-btn').forEach(btn => {
  btn.addEventListener('click', () => {
    const id = btn.dataset.id;

    fetch('suppliers_back/get_supplier.php?id=' + id)
      .then(res => res.json())
      .then(data => {
        if(!data) return;

        document.getElementById('edit_id_supplier').value = data.id_supplier;
        document.getElementById('edit_name').value = data.name ?? '';
        document.getElementById('edit_contact_name').value = data.contact_name ?? '';
        document.getElementById('edit_phone').value = data.phone ?? '';
        document.getElementById('edit_email').value = data.email ?? '';
        document.getElementById('edit_address').value = data.address ?? '';
        document.getElementById('edit_tax_id').value = data.tax_id ?? '';
        document.getElementById('edit_payment_terms').value = data.payment_terms ?? '';
        document.getElementById('edit_notes').value = data.notes ?? '';

        editSupplierModal.classList.remove('hidden');
      });
  });
});

cancelEditSupplier.addEventListener('click', () => editSupplierModal.classList.add('hidden'));
</script>
