<!-- Modal para agregar cliente -->
<div id="addClientModal" class="hidden fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
  <div class="bg-white p-4 rounded-xl shadow-lg w-full max-w-2xl relative">
    <h2 class="text-xl font-semibold mb-4 text-gray-800 text-center">Agregar Cliente</h2>
    <form action="clients_back/add_client.php" method="POST" class="grid grid-cols-2 gap-3 text-sm">

      <div class="col-span-2">
        <label class="block text-gray-700 font-medium mb-1">Nombre / Razón Social</label>
        <input type="text" name="full_name" required class="w-full border border-gray-300 rounded px-2 py-1 focus:ring-2 focus:ring-blue-500">
      </div>

      <div>
        <label class="block text-gray-700 font-medium mb-1">Ciudad</label>
        <input type="text" name="city" class="w-full border border-gray-300 rounded px-2 py-1 focus:ring-2 focus:ring-blue-500">
      </div>

      <div>
        <label class="block text-gray-700 font-medium mb-1">Dirección</label>
        <input type="text" name="address" class="w-full border border-gray-300 rounded px-2 py-1 focus:ring-2 focus:ring-blue-500">
      </div>

      <div>
        <label class="block text-gray-700 font-medium mb-1">Tipo de Documento</label>
        <select name="document_type" class="w-full border border-gray-300 rounded px-2 py-1 focus:ring-2 focus:ring-blue-500">
          <option value="">Seleccionar</option>
          <option value="DNI">DNI</option>
          <option value="CUIT">CUIT</option>
          <option value="Otro">Otro</option>
        </select>
      </div>

      <div>
        <label class="block text-gray-700 font-medium mb-1">Número de Documento</label>
        <input type="text" name="document_number" class="w-full border border-gray-300 rounded px-2 py-1">
      </div>

      <div>
        <label class="block text-gray-700 font-medium mb-1">Teléfono</label>
        <input type="text" name="phone" class="w-full border border-gray-300 rounded px-2 py-1">
      </div>

      <div>
        <label class="block text-gray-700 font-medium mb-1">Móvil</label>
        <input type="text" name="mobile" class="w-full border border-gray-300 rounded px-2 py-1">
      </div>

      <div>
        <label class="block text-gray-700 font-medium mb-1">Email</label>
        <input type="email" name="email" class="w-full border border-gray-300 rounded px-2 py-1">
      </div>

      <div>
        <label class="block text-gray-700 font-medium mb-1">CUIT</label>
        <input type="text" name="cuit" class="w-full border border-gray-300 rounded px-2 py-1">
      </div>

      <div>
        <label class="block text-gray-700 font-medium mb-1">Estado</label>
        <input type="text" name="status" class="w-full border border-gray-300 rounded px-2 py-1">
      </div>

      <div>
        <label class="block text-gray-700 font-medium mb-1">Tipo de Cliente</label>
        <select name="client_type" class="w-full border border-gray-300 rounded px-2 py-1">
          <option value="">Seleccionar</option>
          <option value="Ocasional">Ocasional</option>
          <option value="Permanente">Permanente</option>
        </select>
      </div>

      <div>
        <label class="block text-gray-700 font-medium mb-1">Responsabilidad ante IVA</label>
        <input type="text" name="tax_responsibility" class="w-full border border-gray-300 rounded px-2 py-1">
      </div>

      <div>
        <label class="block text-gray-700 font-medium mb-1">Empresa</label>
        <input type="text" name="company" class="w-full border border-gray-300 rounded px-2 py-1">
      </div>

      <div>
        <label class="block text-gray-700 font-medium mb-1">Persona de contacto</label>
        <input type="text" name="contact_person" class="w-full border border-gray-300 rounded px-2 py-1">
      </div>

      <div>
        <label class="block text-gray-700 font-medium mb-1">Lista de precios</label>
        <input type="text" name="price_list" class="w-full border border-gray-300 rounded px-2 py-1">
      </div>

      <div>
        <label class="block text-gray-700 font-medium mb-1">Límite de crédito</label>
        <input type="number" step="0.01" name="credit_limit" class="w-full border border-gray-300 rounded px-2 py-1">
      </div>

      <div class="col-span-2">
        <label class="block text-gray-700 font-medium mb-1">Observaciones</label>
        <textarea name="notes" class="w-full border border-gray-300 rounded px-2 py-1" rows="3"></textarea>
      </div>

      <div class="col-span-2 flex justify-end space-x-2 mt-3">
        <button type="button" id="closeAddClientModal" class="px-3 py-1 bg-gray-500 hover:bg-gray-600 text-white rounded">Cancelar</button>
        <button type="submit" class="px-3 py-1 bg-green-600 hover:bg-green-700 text-white rounded">Guardar</button>
      </div>
    </form>
  </div>
</div>

<script>
const addClientModal = document.getElementById('addClientModal');
document.getElementById('openAddClientModal').addEventListener('click', () => addClientModal.classList.remove('hidden'));
document.getElementById('closeAddClientModal').addEventListener('click', () => addClientModal.classList.add('hidden'));
</script>

<!-- Modal para mostrar cliente -->
<div id="clientModal" class="hidden fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
  <div class="bg-white p-6 rounded-2xl shadow-2xl w-11/12 md:w-2/3 lg:w-1/2 max-h-[90vh] overflow-y-auto">
    <div class="flex justify-between items-center mb-4 border-b border-gray-200 pb-2">
      <h2 class="text-2xl font-bold text-gray-800">Detalles del Cliente</h2>
      <button id="closeClientModal" class="text-gray-500 hover:text-gray-800 text-lg">&times;</button>
    </div>
    <div id="clientContent" class="text-gray-700 text-sm">
      <p class="text-center text-gray-400">Cargando...</p>
    </div>
    <div class="mt-6 flex justify-end">
      <button id="closeClientModalBtn" class="bg-blue-600 hover:bg-blue-700 text-white px-5 py-2 rounded-lg">Cerrar</button>
    </div>
  </div>
</div>

<script>
const clientModal = document.getElementById('clientModal');
const closeClientModal = document.getElementById('closeClientModal');
const closeClientModalBtn = document.getElementById('closeClientModalBtn');

const camposClient = {
  "id_client": "ID",
  "full_name": "Nombre / Razón Social",
  "address": "Dirección",
  "city": "Ciudad",
  "document_type": "Tipo de Documento",
  "document_number": "Número de Documento",
  "phone": "Teléfono",
  "mobile": "Móvil",
  "email": "Email",
  "cuit": "CUIT",
  "status": "Estado",
  "client_type": "Tipo de Cliente",
  "tax_responsibility": "Responsabilidad IVA",
  "company": "Empresa",
  "contact_person": "Persona de Contacto",
  "price_list": "Lista de Precios",
  "credit_limit": "Límite de Crédito",
  "notes": "Observaciones"
};

document.querySelectorAll('.show-client-modal').forEach(btn => {
  btn.addEventListener('click', () => {
    clientModal.classList.remove('hidden');
    const id = btn.dataset.id;
    document.getElementById('clientContent').innerHTML = '<p class="text-center text-gray-400">Cargando...</p>';

    fetch('clients_back/get_client.php?id=' + id)
      .then(res => res.json())
      .then(data => {
        if(!data) {
          document.getElementById('clientContent').innerHTML = '<p class="text-center text-red-500">Cliente no encontrado.</p>';
          return;
        }

        let html = '<table class="w-full table-auto border border-gray-300 text-sm"><tbody>';
        let i = 0;
        for(const key in camposClient) {
          const label = camposClient[key];
          let value = data[key] ?? '';
          const rowColor = i % 2 === 0 ? 'bg-gray-50' : 'bg-white';
          html += `<tr class="${rowColor} border-b border-gray-200">
                     <td class="px-4 py-2 font-medium text-gray-800 w-1/3">${label}</td>
                     <td class="px-4 py-2 text-gray-700">${value}</td>
                   </tr>`;
          i++;
        }
        html += '</tbody></table>';
        document.getElementById('clientContent').innerHTML = html;
      })
      .catch(err => {
        document.getElementById('clientContent').innerHTML = '<p class="text-center text-red-500">Error al cargar datos.</p>';
      });
  });
});

closeClientModal.addEventListener('click', () => clientModal.classList.add('hidden'));
closeClientModalBtn.addEventListener('click', () => clientModal.classList.add('hidden'));
</script>

<!-- Modal para editar cliente -->
<div id="editClientModal" class="hidden fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
  <div class="bg-white p-4 rounded-xl shadow-lg w-full max-w-2xl relative">
    <h2 class="text-xl font-semibold mb-4 text-gray-800 text-center">Editar Cliente</h2>
    <form id="editClientForm" action="clients_back/edit_client.php" method="POST" class="grid grid-cols-2 gap-3 text-sm">
      <input type="hidden" name="id_client" id="edit_id_client">

      <div class="col-span-2">
        <label class="block text-gray-700 font-medium mb-1">Nombre / Razón Social</label>
        <input type="text" name="full_name" id="edit_full_name" required class="w-full border border-gray-300 rounded px-2 py-1 focus:ring-2 focus:ring-blue-500">
      </div>

      <div>
        <label class="block text-gray-700 font-medium mb-1">Ciudad</label>
        <input type="text" name="city" id="edit_city" class="w-full border border-gray-300 rounded px-2 py-1">
      </div>

      <div>
        <label class="block text-gray-700 font-medium mb-1">Dirección</label>
        <input type="text" name="address" id="edit_address" class="w-full border border-gray-300 rounded px-2 py-1">
      </div>

      <div>
        <label class="block text-gray-700 font-medium mb-1">Tipo de Documento</label>
        <select name="document_type" id="edit_document_type" class="w-full border border-gray-300 rounded px-2 py-1">
          <option value="">Seleccionar</option>
          <option value="DNI">DNI</option>
          <option value="CUIT">CUIT</option>
          <option value="Otro">Otro</option>
        </select>
      </div>

      <div>
        <label class="block text-gray-700 font-medium mb-1">Número de Documento</label>
        <input type="text" name="document_number" id="edit_document_number" class="w-full border border-gray-300 rounded px-2 py-1">
      </div>

      <div>
        <label class="block text-gray-700 font-medium mb-1">Teléfono</label>
        <input type="text" name="phone" id="edit_phone" class="w-full border border-gray-300 rounded px-2 py-1">
      </div>

      <div>
        <label class="block text-gray-700 font-medium mb-1">Móvil</label>
        <input type="text" name="mobile" id="edit_mobile" class="w-full border border-gray-300 rounded px-2 py-1">
      </div>

      <div>
        <label class="block text-gray-700 font-medium mb-1">Email</label>
        <input type="email" name="email" id="edit_email" class="w-full border border-gray-300 rounded px-2 py-1">
      </div>

      <div>
        <label class="block text-gray-700 font-medium mb-1">CUIT</label>
        <input type="text" name="cuit" id="edit_cuit" class="w-full border border-gray-300 rounded px-2 py-1">
      </div>

      <div>
        <label class="block text-gray-700 font-medium mb-1">Estado</label>
        <input type="text" name="status" id="edit_status" class="w-full border border-gray-300 rounded px-2 py-1">
      </div>

      <div>
        <label class="block text-gray-700 font-medium mb-1">Tipo de Cliente</label>
        <select name="client_type" id="edit_client_type" class="w-full border border-gray-300 rounded px-2 py-1">
          <option value="">Seleccionar</option>
          <option value="Ocasional">Ocasional</option>
          <option value="Permanente">Permanente</option>
        </select>
      </div>

      <div>
        <label class="block text-gray-700 font-medium mb-1">Responsabilidad ante IVA</label>
        <input type="text" name="tax_responsibility" id="edit_tax_responsibility" class="w-full border border-gray-300 rounded px-2 py-1">
      </div>

      <div>
        <label class="block text-gray-700 font-medium mb-1">Empresa</label>
        <input type="text" name="company" id="edit_company" class="w-full border border-gray-300 rounded px-2 py-1">
      </div>

      <div>
        <label class="block text-gray-700 font-medium mb-1">Persona de contacto</label>
        <input type="text" name="contact_person" id="edit_contact_person" class="w-full border border-gray-300 rounded px-2 py-1">
      </div>

      <div>
        <label class="block text-gray-700 font-medium mb-1">Lista de precios</label>
        <input type="text" name="price_list" id="edit_price_list" class="w-full border border-gray-300 rounded px-2 py-1">
      </div>

      <div>
        <label class="block text-gray-700 font-medium mb-1">Límite de crédito</label>
        <input type="number" step="0.01" name="credit_limit" id="edit_credit_limit" class="w-full border border-gray-300 rounded px-2 py-1">
      </div>

      <div class="col-span-2">
        <label class="block text-gray-700 font-medium mb-1">Observaciones</label>
        <textarea name="notes" id="edit_notes" class="w-full border border-gray-300 rounded px-2 py-1" rows="3"></textarea>
      </div>

      <div class="col-span-2 flex justify-end space-x-2 mt-3">
        <button type="button" id="cancelEditClient" class="px-3 py-1 bg-gray-500 hover:bg-gray-600 text-white rounded">Cancelar</button>
        <button type="submit" class="px-3 py-1 bg-green-600 hover:bg-green-700 text-white rounded">Guardar</button>
      </div>
    </form>
  </div>
</div>

<script>
const editClientModal = document.getElementById('editClientModal');
const cancelEditClient = document.getElementById('cancelEditClient');

document.querySelectorAll('.edit-client-btn').forEach(btn => {
  btn.addEventListener('click', () => {
    const id = btn.dataset.id;
    fetch('clients_back/get_client.php?id=' + id)
      .then(res => res.json())
      .then(data => {
        if(!data) return;
        document.getElementById('edit_id_client').value = data.id_client;
        document.getElementById('edit_full_name').value = data.full_name ?? '';
        document.getElementById('edit_city').value = data.city ?? '';
        document.getElementById('edit_address').value = data.address ?? '';
        document.getElementById('edit_document_type').value = data.document_type ?? '';
        document.getElementById('edit_document_number').value = data.document_number ?? '';
        document.getElementById('edit_phone').value = data.phone ?? '';
        document.getElementById('edit_mobile').value = data.mobile ?? '';
        document.getElementById('edit_email').value = data.email ?? '';
        document.getElementById('edit_cuit').value = data.cuit ?? '';
        document.getElementById('edit_status').value = data.status ?? '';
        document.getElementById('edit_client_type').value = data.client_type ?? '';
        document.getElementById('edit_tax_responsibility').value = data.tax_responsibility ?? '';
        document.getElementById('edit_company').value = data.company ?? '';
        document.getElementById('edit_contact_person').value = data.contact_person ?? '';
        document.getElementById('edit_price_list').value = data.price_list ?? '';
        document.getElementById('edit_credit_limit').value = data.credit_limit ?? '';
        document.getElementById('edit_notes').value = data.notes ?? '';
        editClientModal.classList.remove('hidden');
      });
  });
});

cancelEditClient.addEventListener('click', () => editClientModal.classList.add('hidden'));
</script>
