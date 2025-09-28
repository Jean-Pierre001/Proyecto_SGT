<?php 
include 'includes/header.php'; 
include 'includes/conn.php'; 
include 'includes/sidebar.php'; 
?>

<div class="flex-1 flex flex-col min-h-screen ml-0 md:ml-48">
  <?php include 'includes/navbar.php'; ?>

  <main class="p-4 flex-1 bg-gray-100">
    <h1 class="text-xl font-bold text-gray-800 mb-4">Productos a Reponer</h1>

    <!-- Filtros -->
    <div class="mb-2 flex flex-wrap gap-2">
      <input type="text" id="filterName" placeholder="Filtrar por Nombre" class="px-2 py-1 border rounded text-sm">
      <input type="text" id="filterSupplier" placeholder="Filtrar por Proveedor" class="px-2 py-1 border rounded text-sm">
    </div>

    <div class="overflow-x-auto rounded-lg shadow-md bg-white border border-gray-200">
      <table id="reponerTable" class="min-w-full divide-y divide-gray-300 text-sm">
        <thead class="bg-gray-200">
          <tr>
            <th class="px-4 py-2 text-left font-semibold text-gray-700 uppercase tracking-wide border-r border-gray-300">Nombre</th>
            <th class="px-4 py-2 text-left font-semibold text-gray-700 uppercase tracking-wide border-r border-gray-300">Stock Actual</th>
            <th class="px-4 py-2 text-left font-semibold text-gray-700 uppercase tracking-wide border-r border-gray-300">Stock Mínimo</th>
            <th class="px-4 py-2 text-left font-semibold text-gray-700 uppercase tracking-wide border-r border-gray-300">Precio Compra</th>
            <th class="px-4 py-2 text-left font-semibold text-gray-700 uppercase tracking-wide">Proveedor</th>
          </tr>
        </thead>
        <tbody class="bg-white divide-y divide-gray-200">
          <?php
          $stmt = $conn->query("
            SELECT a.name, a.stock, a.min_stock, COALESCE(a.cost_price, 0) AS cost_price,
                   s.name AS supplier_name
            FROM stock a
            LEFT JOIN suppliers s ON a.id_supplier = s.id_supplier
            WHERE a.stock <= a.min_stock
            ORDER BY a.stock ASC
          ");
          $products = $stmt->fetchAll(PDO::FETCH_ASSOC);

          foreach($products as $index => $prod):
          ?>
          <tr class="<?= $index % 2 == 0 ? 'bg-gray-50' : 'bg-white' ?> hover:bg-gray-100 transition">
            <td class="px-4 py-2 border-r border-gray-300"><?= htmlspecialchars($prod['name']) ?></td>
            <td class="px-4 py-2 border-r border-gray-300 text-gray-700"><?= $prod['stock'] ?></td>
            <td class="px-4 py-2 border-r border-gray-300 text-gray-700"><?= $prod['min_stock'] ?></td>
            <td class="px-4 py-2 border-r border-gray-300 text-gray-700">$<?= number_format($prod['cost_price'], 2) ?></td>
            <td class="px-4 py-2 border-r border-gray-300 text-gray-600"><?= htmlspecialchars($prod['supplier_name'] ?? '') ?></td>
          </tr>
          <?php endforeach; ?>
        </tbody>
      </table>
    </div>
  </main>
</div>

<script>
// Filtros dinámicos
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

document.getElementById('filterName').addEventListener('input', () => filterTable('filterName', 'reponerTable', [0]));
document.getElementById('filterSupplier').addEventListener('input', () => filterTable('filterSupplier', 'reponerTable', [4]));
</script>
