<?php 
include 'includes/header.php'; 
include 'includes/conn.php'; 
include 'includes/sidebar.php';

$filterName = $_GET['filterName'] ?? '';
$filterSubCount = $_GET['filterSubCount'] ?? '';
$filterHasDesc = isset($_GET['filterHasDesc']) ? 1 : 0;

// 1️⃣ Obtener categorías principales filtradas
$sql = "SELECT * FROM categories WHERE parent_id IS NULL";
$params = [];

if($filterName != '') {
    $sql .= " AND name LIKE :name";
    $params[':name'] = "%$filterName%";
}

if($filterHasDesc) {
    $sql .= " AND description != ''";
}

$sql .= " ORDER BY name";
$stmt = $conn->prepare($sql);
$stmt->execute($params);
$mainCats = $stmt->fetchAll(PDO::FETCH_ASSOC);

// 2️⃣ Obtener todas las subcategorías de esas categorías principales
$mainIds = array_column($mainCats, 'id_category');
$subCats = [];
if(count($mainIds) > 0){
    $inQuery = implode(',', array_fill(0, count($mainIds), '?'));
    $stmt = $conn->prepare("SELECT * FROM categories WHERE parent_id IN ($inQuery) ORDER BY name");
    $stmt->execute($mainIds);
    $allSubs = $stmt->fetchAll(PDO::FETCH_ASSOC);

    foreach($allSubs as $sub){
        $subCats[$sub['parent_id']][] = $sub;
    }
}

// 3️⃣ Aplicar filtro de cantidad de subcategorías
if($filterSubCount != ''){
    foreach($mainCats as $key => $cat){
        $count = isset($subCats[$cat['id_category']]) ? count($subCats[$cat['id_category']]) : 0;
        if($count < $filterSubCount){
            unset($mainCats[$key]);
        }
    }
}
?>

<div class="flex-1 flex flex-col min-h-screen ml-0 md:ml-48">
  <?php include 'includes/navbar.php'; ?>

  <main class="p-4 flex-1 bg-gray-100">

    <!-- Botones estilo “Agregar Artículo” -->
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

    <!-- Filtros -->
    <form method="GET" action="">
      <div class="mb-5 bg-white border border-gray-200 rounded-lg p-4 shadow-sm flex flex-col md:flex-row md:items-end md:space-x-4 space-y-3 md:space-y-0">
        <div class="flex flex-col">
          <label for="filterName" class="text-gray-700 text-sm mb-1">Nombre de categoría</label>
          <input type="text" id="filterName" name="filterName" value="<?= htmlspecialchars($filterName) ?>" class="border border-gray-300 rounded px-3 py-1 text-sm focus:outline-none focus:ring-2 focus:ring-indigo-400" placeholder="Buscar...">
        </div>

        <div class="flex flex-col">
          <label for="filterSubCount" class="text-gray-700 text-sm mb-1">Cantidad de subcategorías ≥</label>
          <input type="number" id="filterSubCount" name="filterSubCount" value="<?= htmlspecialchars($filterSubCount) ?>" class="border border-gray-300 rounded px-3 py-1 text-sm focus:outline-none focus:ring-2 focus:ring-indigo-400" min="0">
        </div>

        <div class="flex items-center space-x-2">
          <input type="checkbox" id="filterHasDesc" name="filterHasDesc" <?= $filterHasDesc ? 'checked' : '' ?> class="h-4 w-4 text-indigo-600 border-gray-300 rounded focus:ring-indigo-500">
          <label for="filterHasDesc" class="text-gray-700 text-sm">Solo con descripción</label>
        </div>

        <div>
          <button type="submit" class="bg-indigo-600 hover:bg-indigo-700 text-white px-4 py-1.5 rounded shadow hover:shadow-md text-sm transition">Aplicar filtros</button>
        </div>

      </div>
    </form>

    <!-- Lista de categorías -->
    <div class="space-y-4">
      <?php foreach($mainCats as $cat): ?>
      <div class="bg-white border border-gray-200 rounded-lg shadow-md overflow-hidden">
          <div class="flex justify-between items-center px-5 py-3 bg-indigo-100">
              <h2 class="text-gray-900 font-semibold text-base"><?= htmlspecialchars($cat['name']) ?></h2>
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
              <div class="px-8 py-2 flex justify-between items-center bg-gray-50 hover:bg-gray-100 transition">
                  <div>
                    <p class="text-gray-800 font-medium">— <?= htmlspecialchars($sub['name']) ?></p>
                    <p class="text-gray-600 text-sm"><?= htmlspecialchars($sub['description']) ?></p>
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

<!-- Incluir modals -->
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
</script>



