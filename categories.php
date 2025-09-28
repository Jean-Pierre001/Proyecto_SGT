<?php 
include 'includes/header.php'; 
include 'includes/conn.php'; 
include 'includes/sidebar.php';

// Obtener categorías principales (sin parent_id)
$stmt_main = $conn->query("SELECT id_category, name, description, created_at, updated_at 
                           FROM categories 
                           WHERE parent_id IS NULL 
                           ORDER BY name");
$mainCats = $stmt_main->fetchAll(PDO::FETCH_ASSOC);

$mainIds = array_column($mainCats, 'id_category');
$subCats = [];
if(count($mainIds) > 0){
    $inQuery = implode(',', array_fill(0, count($mainIds), '?'));
    $stmt = $conn->prepare("SELECT id_category, name, description, parent_id, created_at, updated_at 
                            FROM categories 
                            WHERE parent_id IN ($inQuery) 
                            ORDER BY name");
    $stmt->execute($mainIds);
    $allSubs = $stmt->fetchAll(PDO::FETCH_ASSOC);
    foreach($allSubs as $sub){
        $subCats[$sub['parent_id']][] = $sub;
    }
}
?>

<div class="flex-1 flex flex-col min-h-screen ml-0 md:ml-48">
  <?php include 'includes/navbar.php'; ?>

  <main class="p-4 flex-1 bg-gray-100">

    <div class="flex justify-between items-center mb-4">
        <h1 class="text-xl font-bold text-gray-800">Categorías</h1>
        <div class="flex space-x-2">
            <button id="openAddCategoryModal" class="bg-green-600 hover:bg-green-700 text-white px-3 py-1 rounded shadow hover:shadow-md text-sm">
              Agregar Categoría
            </button>
            <button id="openAddSubCategoryModal" class="bg-blue-600 hover:bg-blue-700 text-white px-3 py-1 rounded shadow hover:shadow-md text-sm">
              Crear Subcategoría
            </button>
        </div>
    </div>

    <!-- Filtros dinámicos -->
    <div class="mb-5 flex flex-wrap gap-3 bg-white border border-gray-200 rounded-lg p-4 shadow-sm">
        <input type="text" id="filterCategoryName" placeholder="Filtrar por nombre" class="px-3 py-1 border rounded text-sm focus:outline-none focus:ring-2 focus:ring-indigo-400">
        <input type="text" id="filterSubName" placeholder="Filtrar subcategoría" class="px-3 py-1 border rounded text-sm focus:outline-none focus:ring-2 focus:ring-indigo-400">
        <input type="text" id="filterDescription" placeholder="Filtrar descripción" class="px-3 py-1 border rounded text-sm focus:outline-none focus:ring-2 focus:ring-indigo-400">
    </div>

    <!-- Lista de categorías -->
    <div class="space-y-4">
      <?php foreach($mainCats as $index => $cat): ?>
      <div class="category-card bg-white border border-gray-200 rounded-lg shadow-md overflow-hidden">
          <div class="flex justify-between items-center px-5 py-3 bg-indigo-100">
              <div>
                <h2 class="text-gray-900 font-semibold text-base category-name"><?= htmlspecialchars($cat['name']) ?></h2>
                <?php if(!empty($cat['description'])): ?>
                  <p class="text-gray-700 text-sm"><?= htmlspecialchars($cat['description']) ?></p>
                <?php endif; ?>
                <p class="text-gray-500 text-xs">Creado: <?= $cat['created_at'] ?><?= $cat['updated_at'] ? " | Modificado: ".$cat['updated_at'] : "" ?></p>
              </div>
              <div class="flex space-x-2">
                <a href="#" class="edit-category-btn px-3 py-1 bg-yellow-500 hover:bg-yellow-600 text-white rounded text-xs shadow-sm transition"
                  data-id="<?= $cat['id_category'] ?>">Editar</a>
                <a href="categories_back/delete_category.php?id=<?= $cat['id_category'] ?>" 
                  class="delete-btn px-3 py-1 bg-red-500 hover:bg-red-600 text-white rounded text-xs shadow-sm transition"
                  data-name="<?= htmlspecialchars($cat['name']) ?>"
                  data-type="categoría">Eliminar</a>
              </div>
          </div>

          <?php if(isset($subCats[$cat['id_category']])): ?>
          <div class="divide-y divide-gray-200">
              <?php foreach($subCats[$cat['id_category']] as $sub): ?>
              <div class="px-8 py-2 flex justify-between items-center bg-gray-50 hover:bg-gray-100 transition subcategory-card">
                  <div>
                    <p class="text-gray-800 font-medium sub-name">— <?= htmlspecialchars($sub['name']) ?></p>
                    <?php if(!empty($sub['description'])): ?>
                      <p class="text-gray-600 text-sm sub-desc"><?= htmlspecialchars($sub['description']) ?></p>
                    <?php endif; ?>
                    <p class="text-gray-500 text-xs">Creado: <?= $sub['created_at'] ?><?= $sub['updated_at'] ? " | Modificado: ".$sub['updated_at'] : "" ?></p>
                  </div>
                  <div class="flex space-x-2">
                    <a href="#" class="edit-category-btn px-3 py-1 bg-yellow-500 hover:bg-yellow-600 text-white rounded text-xs shadow-sm transition"
                    data-id="<?= $sub['id_category'] ?>">Editar</a>
                    <a href="categories_back/delete_category.php?id=<?= $sub['id_category'] ?>" 
                      class="delete-btn px-3 py-1 bg-red-500 hover:bg-red-600 text-white rounded text-xs shadow-sm transition"
                      data-name="<?= htmlspecialchars($sub['name']) ?>"
                      data-type="subcategoría">Eliminar</a>
                  </div>
              </div>
              <?php endforeach; ?>
          </div>
          <?php endif; ?>
      </div>
      <?php endforeach; ?>
    </div>

  </main>
</div>

<?php include 'includes/modals/modal_categories.php'; ?>

<script>
document.querySelectorAll('.delete-btn').forEach(btn => {
    btn.addEventListener('click', function(e){
        e.preventDefault();
        const url = this.href;
        const name = this.dataset.name;
        const type = this.dataset.type;

        Swal.fire({
            title: `¿Eliminar ${type}?`,
            text: `Se eliminará "${name}" ${type === 'categoría' ? 'y todas sus subcategorías' : ''}.`,
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#d33',
            cancelButtonColor: '#3085d6',
            confirmButtonText: 'Sí, eliminar',
            cancelButtonText: 'Cancelar'
        }).then((result) => {
            if (result.isConfirmed) {
                window.location.href = url;
            }
        });
    });
});

function filterCategories() {
    const nameFilter = document.getElementById('filterCategoryName').value.toLowerCase().trim();
    const subFilter = document.getElementById('filterSubName').value.toLowerCase().trim();
    const descFilter = document.getElementById('filterDescription').value.toLowerCase().trim();

    document.querySelectorAll('.category-card').forEach(cat => {
        const catName = cat.querySelector('.category-name').textContent.toLowerCase();

        // Filtra categoría padre: solo mostrar si coincide con el filtro de nombre
        const showCatByName = !nameFilter ? true : catName.split(' ').some(word => word.startsWith(nameFilter));

        let anySubVisible = false;
        const subs = cat.querySelectorAll('.subcategory-card');

        subs.forEach(sub => {
            const subName = sub.querySelector('.sub-name').textContent.replace('—','').trim().toLowerCase();
            const subDesc = sub.querySelector('.sub-desc') ? sub.querySelector('.sub-desc').textContent.toLowerCase() : "";

            // Filtra subcategorías solo dentro de categorías visibles
            const showSub = showCatByName && 
                            (!subFilter || subName.split(' ').some(word => word.startsWith(subFilter))) &&
                            (!descFilter || subDesc.split(' ').some(word => word.startsWith(descFilter)));

            sub.style.display = showSub ? '' : 'none';
            if(showSub) anySubVisible = true;
        });

        // Mostrar categoría si coincide ella o si alguna subcategoría dentro coincide
        cat.style.display = (showCatByName && (anySubVisible || subs.length === 0)) ? '' : 'none';
    });
}

// Event listeners
document.getElementById('filterCategoryName').addEventListener('input', filterCategories);
document.getElementById('filterSubName').addEventListener('input', filterCategories);
document.getElementById('filterDescription').addEventListener('input', filterCategories);
</script>
