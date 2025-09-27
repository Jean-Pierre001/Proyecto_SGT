<?php include 'includes/header.php'; ?>
<?php include 'includes/conn.php'; ?>
<?php include 'includes/sidebar.php'; ?>

<div class="flex-1 flex flex-col min-h-screen ml-0 md:ml-48">

  <?php include 'includes/navbar.php'; ?>

  <main class="p-4 flex-1 bg-gray-100">

    <div class="flex justify-between items-center mb-4">
        <h1 class="text-xl font-bold text-gray-800">Artículos</h1>
      <button id="openAddModal" class="bg-green-600 hover:bg-green-700 text-white px-3 py-1 rounded shadow hover:shadow-md text-sm">
         Agregar Artículo
      </button>
    </div>

    <div class="overflow-x-auto rounded-lg shadow-md bg-white border border-gray-200">
      <table class="min-w-full divide-y divide-gray-300 text-sm">
        <thead class="bg-gray-200">
          <tr>
            <th class="px-4 py-2 text-left font-semibold text-gray-700 uppercase tracking-wide border-r border-gray-300">ID</th>
            <th class="px-4 py-2 text-left font-semibold text-gray-700 uppercase tracking-wide border-r border-gray-300">Nombre</th>
            <th class="px-4 py-2 text-left font-semibold text-gray-700 uppercase tracking-wide border-r border-gray-300">Categoría</th>
            <th class="px-4 py-2 text-left font-semibold text-gray-700 uppercase tracking-wide border-r border-gray-300">Proveedor</th>
            <th class="px-4 py-2 text-left font-semibold text-gray-700 uppercase tracking-wide border-r border-gray-300">Precio Venta</th>
            <th class="px-4 py-2 text-left font-semibold text-gray-700 uppercase tracking-wide border-r border-gray-300">Stock</th>
            <th class="px-4 py-2 text-left font-semibold text-gray-700 uppercase tracking-wide">Acción</th>
          </tr>
        </thead>
        <tbody class="bg-white divide-y divide-gray-200">
          <?php
            $stmt = $conn->query("
              SELECT a.id_article, a.name, a.sale_price, a.stock, 
                     c.name AS category_name, s.name AS supplier_name
              FROM articles a
              LEFT JOIN categories c ON a.id_category = c.id_category
              LEFT JOIN suppliers s ON a.id_supplier = s.id_supplier
              ORDER BY a.id_article DESC
            ");
            $articles = $stmt->fetchAll();

            foreach($articles as $index => $article):
          ?>
          <tr class="<?= $index % 2 == 0 ? 'bg-gray-50' : 'bg-white' ?> hover:bg-gray-100 transition">
            <td class="px-4 py-2 border-r border-gray-300"><?= htmlspecialchars($article['id_article']) ?></td>
            <td class="px-4 py-2 border-r border-gray-300 font-medium text-gray-800"><?= htmlspecialchars($article['name']) ?></td>
            <td class="px-4 py-2 border-r border-gray-300 text-gray-600"><?= htmlspecialchars($article['category_name']) ?></td>
            <td class="px-4 py-2 border-r border-gray-300 text-gray-600"><?= htmlspecialchars($article['supplier_name']) ?></td>
            <td class="px-4 py-2 border-r border-gray-300 text-gray-700">$<?= number_format($article['sale_price'], 2) ?></td>
            <td class="px-4 py-2 border-r border-gray-300 text-gray-700"><?= $article['stock'] ?></td>
            <td class="px-4 py-2 flex space-x-1">
              <a href="edit_article.php?id=<?= $article['id_article'] ?>" class="px-2 py-1 bg-yellow-400 hover:bg-yellow-500 text-white rounded text-xs shadow-sm transition">Editar</a>
              <a href="delete_article.php?id=<?= $article['id_article'] ?>" class="px-2 py-1 bg-red-500 hover:bg-red-600 text-white rounded text-xs shadow-sm transition">Eliminar</a>
              <button class="px-2 py-1 bg-blue-500 hover:bg-blue-600 text-white rounded text-xs shadow-sm transition show-modal" data-id="<?= $article['id_article'] ?>">Mostrar</button>
            </td>
          </tr>
          <?php endforeach; ?>
        </tbody>
      </table>
    </div>

  </main>
</div>

<!-- Incluir modal desde includes/modals -->
<?php include 'includes/modals/modal_articles.php'; ?>

<!-- Modal -->
<div id="articleModal" class="hidden fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
  <div class="bg-white p-4 rounded-lg shadow-lg w-11/12 md:w-1/3 transition-transform transform scale-95">
    <h2 class="text-lg font-bold mb-3">Detalles del Artículo</h2>
    <div id="modalContent" class="text-gray-700 text-sm">
      <!-- Contenido dinámico -->
    </div>
    <button id="closeModal" class="mt-3 bg-gray-600 hover:bg-gray-700 text-white px-3 py-1 rounded shadow-sm transition text-sm">Cerrar</button>
  </div>
</div>

<script>
  const modal = document.getElementById('articleModal');
  const closeModal = document.getElementById('closeModal');

  document.querySelectorAll('.show-modal').forEach(btn => {
    btn.addEventListener('click', () => {
      modal.classList.remove('hidden');
      document.getElementById('modalContent').innerHTML = 'Cargando detalles del artículo ID ' + btn.dataset.id;
    });
  });

  closeModal.addEventListener('click', () => modal.classList.add('hidden'));
</script>
