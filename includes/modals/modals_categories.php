<?php
// Cargar categorías para selector padre
$stmtCat = $conn->query("SELECT id_category, name FROM categories ORDER BY name ASC");
$allCats = $stmtCat->fetchAll(PDO::FETCH_ASSOC);
?>

<!-- Modal Agregar -->
<div id="addCategoryModal" class="fixed inset-0 bg-black bg-opacity-50 hidden flex items-center justify-center z-50">
    <div class="bg-white rounded-lg shadow w-full max-w-md p-6">
        <h2 class="text-xl font-bold mb-4">Agregar Categoría</h2>

        <form action="logic/categories_back/add_category.php" method="POST" class="space-y-4">
            <div>
                <label class="text-sm font-semibold">Nombre</label>
                <input type="text" name="name" required class="w-full px-3 py-2 border rounded">
            </div>

            <div>
                <label class="text-sm font-semibold">Descripción</label>
                <textarea name="description" class="w-full px-3 py-2 border rounded"></textarea>
            </div>

            <div>
                <label class="text-sm font-semibold">Categoría Padre</label>
                <select name="parent_id" class="w-full px-3 py-2 border rounded">
                    <option value="">Sin categoría padre</option>
                    <?php foreach ($allCats as $c): ?>
                        <option value="<?= $c['id_category'] ?>"><?= htmlspecialchars($c['name']) ?></option>
                    <?php endforeach; ?>
                </select>
            </div>

            <div class="flex justify-end gap-2">
                <button type="button" onclick="closeModal('addCategoryModal')" class="px-4 py-2 bg-gray-400 text-white rounded">Cancelar</button>
                <button type="submit" class="px-4 py-2 bg-blue-600 text-white rounded">Guardar</button>
            </div>
        </form>
    </div>
</div>

<!-- Modal Editar -->
<div id="editCategoryModal" class="fixed inset-0 bg-black bg-opacity-50 hidden flex items-center justify-center z-50">
    <div class="bg-white rounded-lg shadow w-full max-w-md p-6">
        <h2 class="text-xl font-bold mb-4">Editar Categoría</h2>

        <form action="logic/categories_back/edit_category.php" method="POST" class="space-y-4">
            <input type="hidden" name="id_category" id="edit_id_category">

            <div>
                <label class="text-sm font-semibold">Nombre</label>
                <input type="text" name="name" id="edit_name" required class="w-full px-3 py-2 border rounded">
            </div>

            <div>
                <label class="text-sm font-semibold">Descripción</label>
                <textarea name="description" id="edit_description" class="w-full px-3 py-2 border rounded"></textarea>
            </div>

            <div>
                <label class="text-sm font-semibold">Categoría Padre</label>
                <select name="parent_id" id="edit_parent_id" class="w-full px-3 py-2 border rounded">
                    <option value="">Sin categoría padre</option>
                    <?php foreach ($allCats as $c): ?>
                        <option value="<?= $c['id_category'] ?>"><?= htmlspecialchars($c['name']) ?></option>
                    <?php endforeach; ?>
                </select>
            </div>

            <div class="flex justify-end gap-2">
                <button type="button" onclick="closeModal('editCategoryModal')" class="px-4 py-2 bg-gray-400 text-white rounded">Cancelar</button>
                <button type="submit" class="px-4 py-2 bg-yellow-500 text-white rounded">Actualizar</button>
            </div>
        </form>
    </div>
</div>

<!-- Modal Eliminar -->
<div id="deleteCategoryModal" class="fixed inset-0 bg-black bg-opacity-50 hidden flex items-center justify-center z-50">
    <div class="bg-white rounded-lg shadow w-full max-w-sm p-6">
        <h2 class="text-xl font-bold mb-4 text-red-600">Eliminar Categoría</h2>

        <form action="logic/categories_back/delete_category.php" method="POST">
            <input type="hidden" name="id_category" id="delete_id_category">

            <p class="mb-4">¿Seguro que querés eliminar esta categoría?</p>

            <div class="flex justify-end gap-2">
                <button type="button" onclick="closeModal('deleteCategoryModal')" class="px-4 py-2 bg-gray-400 text-white rounded">Cancelar</button>
                <button type="submit" class="px-4 py-2 bg-red-600 text-white rounded">Eliminar</button>
            </div>
        </form>
    </div>
</div>

<script>
function openModal(id) {
    document.getElementById(id).classList.remove('hidden');
}
function closeModal(id) {
    document.getElementById(id).classList.add('hidden');
}
function openEditCategoryModal(cat) {
    document.getElementById('edit_id_category').value = cat.id_category;
    document.getElementById('edit_name').value = cat.name;
    document.getElementById('edit_description').value = cat.description ?? '';
    document.getElementById('edit_parent_id').value = cat.parent_id ?? '';
    openModal('editCategoryModal');
}
function openDeleteCategoryModal(id) {
    document.getElementById('delete_id_category').value = id;
    openModal('deleteCategoryModal');
}
</script>
