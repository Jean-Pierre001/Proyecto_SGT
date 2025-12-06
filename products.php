<?php
$page_title = "Gestión de Productos";
include 'includes/session.php';
include 'includes/header.php';
include 'includes/conn.php';

// Cargar categorías
$stmtCat = $conn->query("SELECT id_category, name FROM categories ORDER BY name ASC");
$categories = $stmtCat->fetchAll(PDO::FETCH_ASSOC);

// Cargar proveedores
$stmtSup = $conn->query("SELECT id_supplier, name FROM suppliers ORDER BY name ASC");
$suppliers = $stmtSup->fetchAll(PDO::FETCH_ASSOC);
?>

<div class="flex h-screen overflow-hidden">

    <?php include 'includes/sidebar.php'; ?>

    <main class="flex-1 overflow-y-auto bg-gray-100">

        <?php include 'includes/navbar.php'; ?>

        <div class="p-4 md:p-6 rounded-lg shadow bg-white border border-gray-300 m-4">

            <div class="flex flex-col md:flex-row justify-between items-start md:items-center mb-6 gap-3">
                <h1 class="text-2xl md:text-3xl font-bold text-gray-800">Productos</h1>

                <a href="javascript:void(0)" onclick="openModal('addProductModal')"
                   class="inline-flex items-center bg-blue-600 text-white px-4 py-2 rounded-md shadow hover:bg-blue-700 transition">
                    <i class="fa-solid fa-plus mr-2"></i> Agregar Producto
                </a>
            </div>

            <!-- Filtros -->
            <div class="flex flex-wrap gap-2 mb-4">
                <input type="text" id="filterName" placeholder="Filtrar por nombre"
                       class="px-3 py-2 border rounded w-full sm:w-48">

                <select id="filterCategory" class="px-3 py-2 border rounded w-full sm:w-48">
                    <option value="">Todas las categorías</option>
                    <?php foreach ($categories as $c): ?>
                        <option value="<?= $c['id_category'] ?>"><?= htmlspecialchars($c['name']) ?></option>
                    <?php endforeach; ?>
                </select>

                <button onclick="clearFilters()" 
                        class="bg-gray-300 hover:bg-gray-400 text-gray-800 px-4 py-2 rounded shadow">
                    Limpiar
                </button>
            </div>

            <!-- Tabla -->
            <div class="overflow-x-auto rounded-lg shadow border border-gray-200 bg-white">
                <table class="min-w-full text-sm text-gray-700 border-collapse" id="productsTable">
                    <thead class="bg-gray-200 text-gray-800 uppercase text-xs font-semibold border-b border-gray-300">
                        <tr>
                            <th class="px-4 py-3 text-left">Nombre</th>
                            <th class="px-4 py-3 text-left">SKU</th>
                            <th class="px-4 py-3 text-left">Categoría</th>
                            <th class="px-4 py-3 text-right">Precio</th>
                            <th class="px-4 py-3 text-right">Stock</th>
                            <th class="px-4 py-3 text-center">Estado</th>
                            <th class="px-4 py-3 text-center">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        try {
                            $stmt = $conn->query("
                                SELECT p.*, c.name AS category_name 
                                FROM products p
                                LEFT JOIN categories c ON p.id_category = c.id_category
                                ORDER BY p.id_product DESC
                            ");
                            $products = $stmt->fetchAll(PDO::FETCH_ASSOC);

                            if ($products) {
                                foreach ($products as $i => $p) {
                        ?>
                        <tr class="border-b hover:bg-gray-50"
                            data-name="<?= strtolower($p['name']) ?>"
                            data-category="<?= $p['id_category'] ?>">
                            <td class="px-4 py-3"><?= htmlspecialchars($p['name']) ?></td>
                            <td class="px-4 py-3"><?= htmlspecialchars($p['sku']) ?></td>
                            <td class="px-4 py-3"><?= htmlspecialchars($p['category_name']) ?></td>
                            <td class="px-4 py-3 text-right">$<?= number_format($p['sale_price'], 2) ?></td>
                            <td class="px-4 py-3 text-right"><?= $p['stock'] ?></td>
                            <td class="px-4 py-3 text-center">
                                <span class="px-2 py-1 rounded text-xs font-semibold
                                    <?= $p['status'] === 'Activo' ? 'bg-green-100 text-green-700' : 'bg-gray-200 text-gray-600' ?>">
                                    <?= $p['status'] ?>
                                </span>
                            </td>
                            <td class="px-4 py-3 text-center flex flex-wrap justify-center gap-2">
                                <button onclick='openEditProductModal(<?= json_encode($p) ?>)'
                                    class="bg-yellow-500 hover:bg-yellow-600 text-white px-3 py-1 rounded">
                                    <i class="fa fa-pen"></i> Editar
                                </button>

                                <form action="logic/products_back/toggle_product.php" method="POST" class="inline">
                                    <input type="hidden" name="id_product" value="<?= $p['id_product'] ?>">
                                    <input type="hidden" name="status" value="<?= $p['status'] === 'Activo' ? 'Inactivo' : 'Activo' ?>">
                                    <button class="<?= $p['status'] === 'Activo' ? 'bg-gray-600 hover:bg-gray-700' : 'bg-green-600 hover:bg-green-700' ?> text-white px-3 py-1 rounded">
                                        <?= $p['status'] === 'Activo' ? 'Desactivar' : 'Activar' ?>
                                    </button>
                                </form>

                                <button onclick="openDeleteProductModal(<?= $p['id_product'] ?>)"
                                    class="bg-red-600 hover:bg-red-700 text-white px-3 py-1 rounded">
                                    <i class="fa fa-trash"></i> Eliminar
                                </button>
                            </td>
                        </tr>
                        <?php
                                }
                            } else {
                                echo "<tr><td colspan='7' class='px-6 py-4 text-center text-gray-500'>No hay productos</td></tr>";
                            }
                        } catch (PDOException $e) {
                            echo "<tr><td colspan='7' class='px-6 py-4 text-center text-red-600'>Error: {$e->getMessage()}</td></tr>";
                        }
                        ?>
                    </tbody>
                </table>
            </div>

        </div>

        <?php include 'includes/modals/modals_products.php'; ?>
        <?php include 'includes/footer.php'; ?>

    </main>
</div>

<script>
document.addEventListener('DOMContentLoaded', function () {

    const nameFilter = document.getElementById('filterName');
    const catFilter  = document.getElementById('filterCategory');
    const rows       = document.querySelectorAll('#productsTable tbody tr');

    function filterRows() {
        const nameVal = nameFilter.value.toLowerCase();
        const catVal  = catFilter.value;

        rows.forEach(row => {
            const n = row.dataset.name;
            const c = row.dataset.category;
            const matchName = n.includes(nameVal);
            const matchCat  = !catVal || c === catVal;

            row.style.display = (matchName && matchCat) ? '' : 'none';
        });
    }

    nameFilter.addEventListener('input', filterRows);
    catFilter.addEventListener('change', filterRows);

    window.clearFilters = function() {
        nameFilter.value = '';
        catFilter.value = '';
        filterRows();
    };
});
</script>
