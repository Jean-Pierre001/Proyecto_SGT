<?php include 'includes/header.php'; ?>
<?php include 'includes/conn.php'; ?>
<?php include 'includes/sidebar.php'; ?>

<div class="flex-1 flex flex-col min-h-screen ml-0 md:ml-48">
  <?php include 'includes/navbar.php'; ?>

  <main class="p-4 flex-1 bg-gray-100">

    <div class="flex justify-between items-center mb-4">
      <h1 class="text-xl font-bold text-gray-800">Clientes</h1>
      <button id="openAddClientModal" class="bg-green-600 hover:bg-green-700 text-white px-3 py-1 rounded shadow hover:shadow-md text-sm">
         Agregar Cliente
      </button>
    </div>

    <?php
      $stmt_individual = $conn->query("SELECT * FROM clients WHERE company IS NULL OR company = '' ORDER BY id_client DESC");
      $individual_clients = $stmt_individual->fetchAll();

      $stmt_company = $conn->query("SELECT * FROM clients WHERE company IS NOT NULL AND company != '' ORDER BY id_client DESC");
      $company_clients = $stmt_company->fetchAll();
    ?>

    <!-- Clientes individuales -->
    <h2 class="text-lg font-semibold text-gray-700 mt-4 mb-2">Clientes Individuales</h2>

    <!-- Filtros individuales -->
    <div class="mb-2 flex flex-wrap gap-2">
      <input type="text" id="filterIndividualName" placeholder="Filtrar por nombre" class="px-2 py-1 border rounded text-sm">
      <input type="text" id="filterIndividualCity" placeholder="Filtrar por ciudad" class="px-2 py-1 border rounded text-sm">
      <select id="filterIndividualType" class="px-2 py-1 border rounded text-sm">
        <option value="">Tipo de cliente</option>
        <option value="Ocasional">Ocasional</option>
        <option value="Permanente">Permanente</option>
      </select>
    </div>

    <div class="overflow-x-auto rounded-lg shadow-md bg-white border border-gray-200 mb-6">
      <table id="individualClientsTable" class="min-w-full divide-y divide-gray-300 text-sm">
        <thead class="bg-gray-200">
          <tr>
            <th class="px-4 py-2 text-left font-semibold text-gray-700 uppercase tracking-wide border-r border-gray-300">ID</th>
            <th class="px-4 py-2 text-left font-semibold text-gray-700 uppercase tracking-wide border-r border-gray-300">Nombre</th>
            <th class="px-4 py-2 text-left font-semibold text-gray-700 uppercase tracking-wide border-r border-gray-300">Ciudad</th>
            <th class="px-4 py-2 text-left font-semibold text-gray-700 uppercase tracking-wide border-r border-gray-300">Documento</th>
            <th class="px-4 py-2 text-left font-semibold text-gray-700 uppercase tracking-wide border-r border-gray-300">Teléfono / Móvil</th>
            <th class="px-4 py-2 text-left font-semibold text-gray-700 uppercase tracking-wide border-r border-gray-300">Email</th>
            <th class="px-4 py-2 text-left font-semibold text-gray-700 uppercase tracking-wide">Acción</th>
          </tr>
        </thead>
        <tbody class="bg-white divide-y divide-gray-200">
          <?php foreach($individual_clients as $index => $client): ?>
          <tr class="<?= $index % 2 == 0 ? 'bg-gray-50' : 'bg-white' ?> hover:bg-gray-100 transition">
            <td class="px-4 py-2 border-r border-gray-300"><?= htmlspecialchars($client['id_client']) ?></td>
            <td class="px-4 py-2 border-r border-gray-300 font-medium text-gray-800"><?= htmlspecialchars($client['full_name']) ?></td>
            <td class="px-4 py-2 border-r border-gray-300 text-gray-600"><?= htmlspecialchars($client['city']) ?></td>
            <td class="px-4 py-2 border-r border-gray-300 text-gray-600"><?= htmlspecialchars($client['document_type']) ?> <?= htmlspecialchars($client['document_number']) ?></td>
            <td class="px-4 py-2 border-r border-gray-300 text-gray-700"><?= htmlspecialchars($client['phone']) ?> / <?= htmlspecialchars($client['mobile']) ?></td>
            <td class="px-4 py-2 border-r border-gray-300 text-gray-700"><?= htmlspecialchars($client['email']) ?></td>
            <td class="px-4 py-2 flex space-x-1">
              <button class="px-2 py-1 bg-yellow-500 hover:bg-yellow-600 text-white rounded text-xs shadow-sm transition edit-client-btn" data-id="<?= $client['id_client'] ?>">Editar</button>
              <a href="clients_back/delete_client.php?id=<?= $client['id_client'] ?>" onclick="return confirm('¿Estás seguro que quieres eliminar este cliente?');" class="px-2 py-1 bg-red-500 hover:bg-red-600 text-white rounded text-xs shadow-sm transition">Eliminar</a>
              <button class="px-2 py-1 bg-blue-500 hover:bg-blue-600 text-white rounded text-xs shadow-sm transition show-client-modal" data-id="<?= $client['id_client'] ?>">Mostrar</button>
            </td>
          </tr>
          <?php endforeach; ?>
        </tbody>
      </table>
    </div>

    <!-- Clientes empresas -->
    <h2 class="text-lg font-semibold text-gray-700 mt-4 mb-2">Clientes Empresas</h2>

    <!-- Filtros empresas -->
    <div class="mb-2 flex flex-wrap gap-2">
      <input type="text" id="filterCompanyName" placeholder="Filtrar por empresa" class="px-2 py-1 border rounded text-sm">
      <input type="text" id="filterCompanyCity" placeholder="Filtrar por ciudad" class="px-2 py-1 border rounded text-sm">
      <select id="filterCompanyType" class="px-2 py-1 border rounded text-sm">
        <option value="">Tipo de cliente</option>
        <option value="Ocasional">Ocasional</option>
        <option value="Permanente">Permanente</option>
      </select>
    </div>

    <div class="overflow-x-auto rounded-lg shadow-md bg-white border border-gray-200">
      <table id="companyClientsTable" class="min-w-full divide-y divide-gray-300 text-sm">
        <thead class="bg-gray-200">
          <tr>
            <th class="px-4 py-2 text-left font-semibold text-gray-700 uppercase tracking-wide border-r border-gray-300">ID</th>
            <th class="px-4 py-2 text-left font-semibold text-gray-700 uppercase tracking-wide border-r border-gray-300">Empresa / Razón Social</th>
            <th class="px-4 py-2 text-left font-semibold text-gray-700 uppercase tracking-wide border-r border-gray-300">Ciudad</th>
            <th class="px-4 py-2 text-left font-semibold text-gray-700 uppercase tracking-wide border-r border-gray-300">Documento</th>
            <th class="px-4 py-2 text-left font-semibold text-gray-700 uppercase tracking-wide border-r border-gray-300">Teléfono / Móvil</th>
            <th class="px-4 py-2 text-left font-semibold text-gray-700 uppercase tracking-wide border-r border-gray-300">Email</th>
            <th class="px-4 py-2 text-left font-semibold text-gray-700 uppercase tracking-wide">Acción</th>
          </tr>
        </thead>
        <tbody class="bg-white divide-y divide-gray-200">
          <?php foreach($company_clients as $index => $client): ?>
          <tr class="<?= $index % 2 == 0 ? 'bg-gray-50' : 'bg-white' ?> hover:bg-gray-100 transition">
            <td class="px-4 py-2 border-r border-gray-300"><?= htmlspecialchars($client['id_client']) ?></td>
            <td class="px-4 py-2 border-r border-gray-300 font-medium text-gray-800"><?= htmlspecialchars($client['company']) ?></td>
            <td class="px-4 py-2 border-r border-gray-300 text-gray-600"><?= htmlspecialchars($client['city']) ?></td>
            <td class="px-4 py-2 border-r border-gray-300 text-gray-600"><?= htmlspecialchars($client['document_type']) ?> <?= htmlspecialchars($client['document_number']) ?></td>
            <td class="px-4 py-2 border-r border-gray-300 text-gray-700"><?= htmlspecialchars($client['phone']) ?> / <?= htmlspecialchars($client['mobile']) ?></td>
            <td class="px-4 py-2 border-r border-gray-300 text-gray-700"><?= htmlspecialchars($client['email']) ?></td>
            <td class="px-4 py-2 flex space-x-1">
              <button class="px-2 py-1 bg-yellow-500 hover:bg-yellow-600 text-white rounded text-xs shadow-sm transition edit-client-btn" data-id="<?= $client['id_client'] ?>">Editar</button>
              <a href="clients_back/delete_client.php?id=<?= $client['id_client'] ?>" onclick="return confirm('¿Estás seguro que quieres eliminar este cliente?');" class="px-2 py-1 bg-red-500 hover:bg-red-600 text-white rounded text-xs shadow-sm transition">Eliminar</a>
              <button class="px-2 py-1 bg-blue-500 hover:bg-blue-600 text-white rounded text-xs shadow-sm transition show-client-modal" data-id="<?= $client['id_client'] ?>">Mostrar</button>
            </td>
          </tr>
          <?php endforeach; ?>
        </tbody>
      </table>
    </div>

  </main>
</div>

<?php include 'includes/modals/modal_clients.php'; ?>

<!-- Script para filtros -->
<script>
function filterTable(inputId, tableId, columnIndexes) {
  const filter = document.getElementById(inputId).value.toLowerCase();
  const table = document.getElementById(tableId);
  const trs = table.getElementsByTagName('tr');
  for (let i = 1; i < trs.length; i++) {
    let show = false;
    columnIndexes.forEach(idx => {
      const td = trs[i].getElementsByTagName('td')[idx];
      if(td && td.textContent.toLowerCase().includes(filter)) show = true;
    });
    trs[i].style.display = show ? '' : 'none';
  }
}

// Filtros individuales
document.getElementById('filterIndividualName').addEventListener('input', () => filterTable('filterIndividualName', 'individualClientsTable', [1]));
document.getElementById('filterIndividualCity').addEventListener('input', () => filterTable('filterIndividualCity', 'individualClientsTable', [2]));
document.getElementById('filterIndividualType').addEventListener('change', () => filterTable('filterIndividualType', 'individualClientsTable', [6]));

// Filtros empresas
document.getElementById('filterCompanyName').addEventListener('input', () => filterTable('filterCompanyName', 'companyClientsTable', [1]));
document.getElementById('filterCompanyCity').addEventListener('input', () => filterTable('filterCompanyCity', 'companyClientsTable', [2]));
document.getElementById('filterCompanyType').addEventListener('change', () => filterTable('filterCompanyType', 'companyClientsTable', [6]));
</script>
