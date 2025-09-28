<?php
include 'includes/conn.php';  
include 'includes/header.php'; 
include 'includes/sidebar.php'; 
?>

<div class="flex-1 flex flex-col min-h-screen ml-0 md:ml-48">
  <?php include 'includes/navbar.php'; ?>

  <main class="p-4 flex-1 bg-gray-100">

    <h1 class="text-xl font-bold mb-4 text-gray-800">Alertas de Stock</h1>

    <?php
    // Casi agotado
    $stmtAlmost = $conn->query("
      SELECT s.id_stock, s.name, s.stock, s.min_stock, c.name AS category_name, sup.name AS supplier_name
      FROM stock s
      LEFT JOIN categories c ON s.id_category = c.id_category
      LEFT JOIN suppliers sup ON s.id_supplier = sup.id_supplier
      WHERE s.stock <= (s.min_stock + 5) AND s.stock > s.min_stock
      ORDER BY s.stock ASC
    ");
    $almostStock = $stmtAlmost->fetchAll(PDO::FETCH_ASSOC);

    // Por debajo del mínimo
    $stmtBelow = $conn->query("
      SELECT s.id_stock, s.name, s.stock, s.min_stock, c.name AS category_name, sup.name AS supplier_name
      FROM stock s
      LEFT JOIN categories c ON s.id_category = c.id_category
      LEFT JOIN suppliers sup ON s.id_supplier = sup.id_supplier
      WHERE s.stock <= s.min_stock AND s.stock > 0
      ORDER BY s.stock ASC
    ");
    $belowStock = $stmtBelow->fetchAll(PDO::FETCH_ASSOC);

    // Agotados
    $stmtEmpty = $conn->query("
      SELECT s.id_stock, s.name, s.stock, s.min_stock, c.name AS category_name, sup.name AS supplier_name
      FROM stock s
      LEFT JOIN categories c ON s.id_category = c.id_category
      LEFT JOIN suppliers sup ON s.id_supplier = sup.id_supplier
      WHERE s.stock = 0
      ORDER BY s.name ASC
    ");
    $emptyStock = $stmtEmpty->fetchAll(PDO::FETCH_ASSOC);
    ?>

    <!-- Casi agotado -->
    <?php if(count($almostStock) > 0): ?>
    <div class="mb-4 border-l-4 border-yellow-500 bg-yellow-100 text-yellow-700 rounded shadow">
      <button class="w-full text-left px-4 py-3 flex justify-between items-center accordion-btn">
        <span class="font-semibold">Productos Casi Agotados (<?= count($almostStock) ?>)</span>
        <svg class="w-5 h-5 transform transition-transform duration-200" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
        </svg>
      </button>
      <div class="px-4 py-3 hidden accordion-content border-t border-yellow-200">
        <?php foreach($almostStock as $p): ?>
          <p>
            <strong><?= htmlspecialchars($p['name']) ?></strong> (<?= htmlspecialchars($p['category_name']) ?>) -
            Stock actual: <?= $p['stock'] ?> / Mínimo: <?= $p['min_stock'] ?> -
            Proveedor: <?= htmlspecialchars($p['supplier_name']) ?>
          </p>
        <?php endforeach; ?>
      </div>
    </div>
    <?php endif; ?>

    <!-- Por debajo del mínimo -->
    <?php if(count($belowStock) > 0): ?>
    <div class="mb-4 border-l-4 border-orange-500 bg-orange-100 text-orange-700 rounded shadow">
      <button class="w-full text-left px-4 py-3 flex justify-between items-center accordion-btn">
        <span class="font-semibold">Productos Por Debajo del Mínimo (<?= count($belowStock) ?>)</span>
        <svg class="w-5 h-5 transform transition-transform duration-200" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
        </svg>
      </button>
      <div class="px-4 py-3 hidden accordion-content border-t border-orange-200">
        <?php foreach($belowStock as $p): ?>
          <p>
            <strong><?= htmlspecialchars($p['name']) ?></strong> (<?= htmlspecialchars($p['category_name']) ?>) -
            Stock actual: <?= $p['stock'] ?> / Mínimo: <?= $p['min_stock'] ?> -
            Proveedor: <?= htmlspecialchars($p['supplier_name']) ?>
          </p>
        <?php endforeach; ?>
      </div>
    </div>
    <?php endif; ?>

    <!-- Agotados -->
    <?php if(count($emptyStock) > 0): ?>
    <div class="border-l-4 border-red-500 bg-red-100 text-red-700 rounded shadow">
      <button class="w-full text-left px-4 py-3 flex justify-between items-center accordion-btn">
        <span class="font-semibold">Productos Agotados (<?= count($emptyStock) ?>)</span>
        <svg class="w-5 h-5 transform transition-transform duration-200" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
        </svg>
      </button>
      <div class="px-4 py-3 hidden accordion-content border-t border-red-200">
        <?php foreach($emptyStock as $p): ?>
          <p>
            <strong><?= htmlspecialchars($p['name']) ?></strong> (<?= htmlspecialchars($p['category_name']) ?>) -
            Stock actual: <?= $p['stock'] ?> -
            Proveedor: <?= htmlspecialchars($p['supplier_name']) ?> -
          </p>
        <?php endforeach; ?>
      </div>
    </div>
    <?php endif; ?>

  </main>
</div>

<script>
document.querySelectorAll('.accordion-btn').forEach(btn => {
  btn.addEventListener('click', () => {
    const content = btn.nextElementSibling;
    const svg = btn.querySelector('svg');
    content.classList.toggle('hidden');
    svg.classList.toggle('rotate-180');
  });
});
</script>
