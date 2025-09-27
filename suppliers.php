<?php include 'includes/header.php'; ?>
<?php include 'includes/conn.php'; ?>
<?php include 'includes/sidebar.php'; ?>

<div class="flex-1 flex flex-col min-h-screen ml-0 md:ml-48">

  <?php include 'includes/navbar.php'; ?>

  <main class="p-4 flex-1 bg-gray-100">

    <div class="flex justify-between items-center mb-4">
        <h1 class="text-xl font-bold text-gray-800">Proveedores</h1>
        <button id="openAddSupplierModal" class="bg-green-600 hover:bg-green-700 text-white px-3 py-1 rounded shadow hover:shadow-md text-sm">
          Agregar Proveedor
        </button>
    </div>

    <div class="overflow-x-auto rounded-lg shadow-md bg-white border border-gray-200">
      <table class="min-w-full divide-y divide-gray-300 text-sm">
        <thead class="bg-gray-200">
          <tr>
            <th class="px-4 py-2 text-left font-semibold text-gray-700 uppercase tracking-wide border-r border-gray-300">ID</th>
            <th class="px-4 py-2 text-left font-semibold text-gray-700 uppercase tracking-wide border-r border-gray-300">Nombre</th>
            <th class="px-4 py-2 text-left font-semibold text-gray-700 uppercase tracking-wide border-r border-gray-300">Contacto</th>
            <th class="px-4 py-2 text-left font-semibold text-gray-700 uppercase tracking-wide border-r border-gray-300">Teléfono</th>
            <th class="px-4 py-2 text-left font-semibold text-gray-700 uppercase tracking-wide border-r border-gray-300">Email</th>
            <th class="px-4 py-2 text-left font-semibold text-gray-700 uppercase tracking-wide border-r border-gray-300">Dirección</th>
            <th class="px-4 py-2 text-left font-semibold text-gray-700 uppercase tracking-wide">Acción</th>
          </tr>
        </thead>
        <tbody class="bg-white divide-y divide-gray-200">
          <?php
            $stmt = $conn->query("
              SELECT id_supplier, name, contact_name, phone, email, address
              FROM suppliers
              ORDER BY id_supplier DESC
            ");
            $suppliers = $stmt->fetchAll();

            foreach($suppliers as $index => $supplier):
          ?>
          <tr class="<?= $index % 2 == 0 ? 'bg-gray-50' : 'bg-white' ?> hover:bg-gray-100 transition">
            <td class="px-4 py-2 border-r border-gray-300"><?= htmlspecialchars($supplier['id_supplier']) ?></td>
            <td class="px-4 py-2 border-r border-gray-300 font-medium text-gray-800"><?= htmlspecialchars($supplier['name']) ?></td>
            <td class="px-4 py-2 border-r border-gray-300 text-gray-600"><?= htmlspecialchars($supplier['contact_name']) ?></td>
            <td class="px-4 py-2 border-r border-gray-300 text-gray-600"><?= htmlspecialchars($supplier['phone']) ?></td>
            <td class="px-4 py-2 border-r border-gray-300 text-gray-600"><?= htmlspecialchars($supplier['email']) ?></td>
            <td class="px-4 py-2 border-r border-gray-300 text-gray-600"><?= htmlspecialchars($supplier['address']) ?></td>
            <td class="px-4 py-2 flex space-x-1">
              <button class="px-2 py-1 bg-yellow-500 hover:bg-yellow-600 text-white rounded text-xs shadow-sm transition edit-supplier-btn" data-id="<?= $supplier['id_supplier'] ?>">Editar</button>
              <a href="suppliers_back/delete_supplier.php?id=<?= $supplier['id_supplier'] ?>" 
                onclick="return confirm('¿Estás seguro que quieres eliminar este proveedor?');"
                class="px-2 py-1 bg-red-500 hover:bg-red-600 text-white rounded text-xs shadow-sm transition">
                Eliminar
              </a>
            </td>
          </tr>
          <?php endforeach; ?>
        </tbody>
      </table>
    </div>

  </main>
</div>

<!-- Incluir modal desde includes/modals -->
<?php include 'includes/modals/modal_suppliers.php'; ?>
