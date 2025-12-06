<?php
$page_title = "Gestión de Categorías";
include 'includes/session.php';
include 'includes/header.php';
include 'includes/conn.php';
?>

<div class="flex h-screen overflow-hidden">

    <?php include 'includes/sidebar.php'; ?>

    <main class="flex-1 overflow-y-auto bg-gray-100">

        <?php include 'includes/navbar.php'; ?>

        <div class="p-4 md:p-6 rounded-lg shadow bg-white border border-gray-300 m-4">

            <div class="flex flex-col md:flex-row justify-between items-start md:items-center mb-6 gap-3">
                <h1 class="text-2xl md:text-3xl font-bold text-gray-800">Categorías de Stock</h1>
                <a href="javascript:void(0)" onclick="openModal('addCategoryModal')"
                   class="inline-flex items-center bg-blue-600 text-white px-4 py-2 rounded-md shadow hover:bg-blue-700 transition">
                    <i class="fa-solid fa-plus mr-2"></i> Agregar Categoría
                </a>
            </div>

            <!-- Filtro -->
            <div class="flex flex-wrap gap-2 mb-4">
                <input type="text" id="filterName" placeholder="Filtrar por Nombre" class="px-3 py-2 border rounded w-full sm:w-48">
                <button onclick="clearFilters()" 
                        class="bg-gray-300 hover:bg-gray-400 text-gray-800 px-4 py-2 rounded shadow">
                    Limpiar Filtros
                </button>
            </div>

            <!-- Tabla -->
            <div class="overflow-x-auto rounded-lg shadow border border-gray-200 bg-white">
                <table class="min-w-full text-sm text-gray-700 border-collapse" id="categoriesTable">
                    <thead class="bg-gray-200 text-gray-800 uppercase text-xs font-semibold border-b border-gray-300">
                        <tr>
                            <th class="px-6 py-3 text-left">Nombre</th>
                            <th class="px-6 py-3 text-left">Descripción</th>
                            <th class="px-6 py-3 text-left">Categoría Padre</th>
                            <th class="px-6 py-3 text-center">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        try {
                            $stmt = $conn->query("
                                SELECT 
                                    c.*,
                                    p.name AS parent_name
                                FROM categories c
                                LEFT JOIN categories p 
                                    ON c.parent_id = p.id_category
                                ORDER BY c.id_category DESC
                            ");
                            $categories = $stmt->fetchAll(PDO::FETCH_ASSOC);

                            if ($categories) {
                                foreach ($categories as $i => $cat) {
                                    $rowClass = $i % 2 === 0 ? 'bg-white' : 'bg-gray-50';
                        ?>
                            <tr class="<?= $rowClass ?> border-b border-gray-200 hover:bg-gray-50">
                                <td class="px-6 py-3"><?= htmlspecialchars($cat['name']) ?></td>
                                <td class="px-6 py-3"><?= htmlspecialchars($cat['description'] ?? '') ?></td>
                                <td class="px-6 py-3"><?= htmlspecialchars($cat['parent_name'] ?? '—') ?></td>
                                <td class="px-6 py-3 text-center flex flex-wrap justify-center gap-2">
                                    <a href="javascript:void(0)" 
                                        onclick='openEditCategoryModal(<?= json_encode($cat); ?>)' 
                                        class="bg-yellow-500 hover:bg-yellow-600 text-white px-3 py-1 rounded-md">
                                        <i class="fa-solid fa-pen mr-1"></i>Editar
                                    </a>

                                    <a href="javascript:void(0)"
                                       onclick="openDeleteCategoryModal(<?= $cat['id_category'] ?>)"
                                       class="bg-red-600 hover:bg-red-700 text-white px-3 py-1 rounded-md">
                                       <i class="fa-solid fa-trash mr-1"></i>Eliminar
                                    </a>
                                </td>
                            </tr>
                        <?php
                                }
                            } else {
                                echo "<tr><td colspan='4' class='px-6 py-4 text-center text-gray-500'>No hay categorías</td></tr>";
                            }
                        } catch (PDOException $e) {
                            echo "<tr><td colspan='4' class='px-6 py-4 text-center text-red-600'>Error: {$e->getMessage()}</td></tr>";
                        }
                        ?>
                    </tbody>
                </table>
            </div>

        </div>

        <?php include 'includes/modals/modals_categories.php'; ?>
        <?php include 'includes/footer.php'; ?>

    </main>
</div>

<!-- JS de modales + filtros -->
<script>
function openModal(id){
    document.getElementById(id).classList.remove('hidden');
}
function closeModal(id){
    document.getElementById(id).classList.add('hidden');
}

function openEditCategoryModal(cat){
    document.getElementById('edit_id_category').value = cat.id_category;
    document.getElementById('edit_name').value = cat.name;
    document.getElementById('edit_description').value = cat.description ?? '';
    document.getElementById('edit_parent_id').value = cat.parent_id ?? '';
    openModal('editCategoryModal');
}

function openDeleteCategoryModal(id){
    document.getElementById('delete_id_category').value = id;
    openModal('deleteCategoryModal');
}

document.addEventListener('DOMContentLoaded', function() {

    const PAGE_KEY = "categories_";
    const filter = document.getElementById('filterName');
    const rows = document.querySelectorAll('#categoriesTable tbody tr');

    const saved = localStorage.getItem(PAGE_KEY + 'filter_name');
    if (saved) filter.value = saved;

    function filterRows() {
        const val = filter.value.toLowerCase();
        rows.forEach(row => {
            const text = row.children[0].textContent.toLowerCase();
            row.style.display = text.includes(val) ? '' : 'none';
        });
    }

    filter.addEventListener('input', function() {
        localStorage.setItem(PAGE_KEY + 'filter_name', filter.value);
        filterRows();
    });

    window.clearFilters = function() {
        filter.value = '';
        localStorage.removeItem(PAGE_KEY + 'filter_name');
        filterRows();
    };

    filterRows();
});
</script>
