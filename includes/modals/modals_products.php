<!-- Modal Agregar -->
<div id="addProductModal" class="fixed inset-0 bg-black bg-opacity-50 hidden flex items-center justify-center z-50">
    <div class="bg-white rounded-lg shadow w-full max-w-2xl p-6 overflow-y-auto max-h-[90vh]">

        <h2 class="text-xl font-bold mb-4">Agregar Producto</h2>

        <form action="logic/products_back/add_product.php" method="POST" enctype="multipart/form-data" class="space-y-4">

            <div>
                <label class="text-sm font-semibold">Nombre</label>
                <input type="text" name="name" required class="w-full px-3 py-2 border rounded">
            </div>

            <div class="grid grid-cols-2 gap-3">
                <div>
                    <label class="text-sm font-semibold">SKU</label>
                    <input type="text" name="sku" class="w-full px-3 py-2 border rounded">
                </div>
                <div>
                    <label class="text-sm font-semibold">Código de Barras</label>
                    <input type="text" name="barcode" class="w-full px-3 py-2 border rounded">
                </div>
            </div>

            <div class="grid grid-cols-2 gap-3">
                <div>
                    <label class="text-sm font-semibold">Categoría</label>
                    <select name="id_category" class="w-full px-3 py-2 border rounded">
                        <option value="">Sin categoría</option>
                        <?php foreach ($categories as $c): ?>
                            <option value="<?= $c['id_category'] ?>"><?= htmlspecialchars($c['name']) ?></option>
                        <?php endforeach; ?>
                    </select>
                </div>

                <div>
                    <label class="text-sm font-semibold">Proveedor</label>
                    <select name="id_supplier" class="w-full px-3 py-2 border rounded">
                        <option value="">Sin proveedor</option>
                        <?php foreach ($suppliers as $s): ?>
                            <option value="<?= $s['id_supplier'] ?>"><?= htmlspecialchars($s['name']) ?></option>
                        <?php endforeach; ?>
                    </select>
                </div>
            </div>

            <div>
                <label class="text-sm font-semibold">Descripción</label>
                <textarea name="description" class="w-full px-3 py-2 border rounded"></textarea>
            </div>

            <div class="grid grid-cols-2 gap-3">
                <div>
                    <label class="text-sm font-semibold">Costo</label>
                    <input type="number" step="0.01" name="cost_price" class="w-full px-3 py-2 border rounded">
                </div>

                <div>
                    <label class="text-sm font-semibold">Precio de Venta</label>
                    <input type="number" step="0.01" name="sale_price" class="w-full px-3 py-2 border rounded">
                </div>
            </div>

            <div class="grid grid-cols-3 gap-3">
                <div>
                    <label class="text-sm font-semibold">Stock</label>
                    <input type="number" step="0.01" name="stock" class="w-full px-3 py-2 border rounded">
                </div>

                <div>
                    <label class="text-sm font-semibold">Stock Mínimo</label>
                    <input type="number" step="0.01" name="min_stock" class="w-full px-3 py-2 border rounded">
                </div>

                <div>
                    <label class="text-sm font-semibold">IVA (%)</label>
                    <input type="number" step="0.01" name="vat" value="21.00" class="w-full px-3 py-2 border rounded">
                </div>
            </div>

            <div>
                <label class="text-sm font-semibold">Imagen</label>
                <input type="file" name="photo" class="w-full">
            </div>

            <div class="flex justify-end gap-2 pt-2">
                <button type="button" onclick="closeModal('addProductModal')" class="px-4 py-2 bg-gray-400 text-white rounded">Cancelar</button>
                <button type="submit" class="px-4 py-2 bg-blue-600 text-white rounded">Guardar</button>
            </div>

        </form>
    </div>
</div>

<!-- Modal Editar -->
<div id="editProductModal" class="fixed inset-0 bg-black bg-opacity-50 hidden flex items-center justify-center z-50">
    <div class="bg-white rounded-lg shadow w-full max-w-2xl p-6 overflow-y-auto max-h-[90vh]">

        <h2 class="text-xl font-bold mb-4">Editar Producto</h2>

        <form action="logic/products_back/edit_product.php" method="POST" enctype="multipart/form-data" class="space-y-4">

            <input type="hidden" name="id_product" id="edit_id_product">

            <div>
                <label class="text-sm font-semibold">Nombre</label>
                <input type="text" name="name" id="edit_name" required class="w-full px-3 py-2 border rounded">
            </div>

            <div class="grid grid-cols-2 gap-3">
                <div>
                    <label class="text-sm font-semibold">SKU</label>
                    <input type="text" name="sku" id="edit_sku" class="w-full px-3 py-2 border rounded">
                </div>
                <div>
                    <label class="text-sm font-semibold">Barcode</label>
                    <input type="text" name="barcode" id="edit_barcode" class="w-full px-3 py-2 border rounded">
                </div>
            </div>

            <div class="grid grid-cols-2 gap-3">
                <div>
                    <label class="text-sm font-semibold">Categoría</label>
                    <select name="id_category" id="edit_id_category" class="w-full px-3 py-2 border rounded">
                        <option value="">Sin categoría</option>
                        <?php foreach ($categories as $c): ?>
                            <option value="<?= $c['id_category'] ?>"><?= htmlspecialchars($c['name']) ?></option>
                        <?php endforeach; ?>
                    </select>
                </div>

                <div>
                    <label class="text-sm font-semibold">Proveedor</label>
                    <select name="id_supplier" id="edit_id_supplier" class="w-full px-3 py-2 border rounded">
                        <option value="">Sin proveedor</option>
                        <?php foreach ($suppliers as $s): ?>
                            <option value="<?= $s['id_supplier'] ?>"><?= htmlspecialchars($s['name']) ?></option>
                        <?php endforeach; ?>
                    </select>
                </div>
            </div>

            <div>
                <label class="text-sm font-semibold">Descripción</label>
                <textarea name="description" id="edit_description" class="w-full px-3 py-2 border rounded"></textarea>
            </div>

            <div class="grid grid-cols-2 gap-3">
                <div>
                    <label class="text-sm font-semibold">Costo</label>
                    <input type="number" step="0.01" name="cost_price" id="edit_cost_price" class="w-full px-3 py-2 border rounded">
                </div>
                <div>
                    <label class="text-sm font-semibold">Precio Venta</label>
                    <input type="number" step="0.01" name="sale_price" id="edit_sale_price" class="w-full px-3 py-2 border rounded">
                </div>
            </div>

            <div class="grid grid-cols-3 gap-3">
                <div>
                    <label class="text-sm font-semibold">Stock</label>
                    <input type="number" step="0.01" name="stock" id="edit_stock" class="w-full px-3 py-2 border rounded">
                </div>
                <div>
                    <label class="text-sm font-semibold">Stock Mínimo</label>
                    <input type="number" step="0.01" name="min_stock" id="edit_min_stock" class="w-full px-3 py-2 border rounded">
                </div>
                <div>
                    <label class="text-sm font-semibold">IVA (%)</label>
                    <input type="number" step="0.01" name="vat" id="edit_vat" class="w-full px-3 py-2 border rounded">
                </div>
            </div>

            <div>
                <label class="text-sm font-semibold">Imagen</label>
                <input type="file" name="photo" class="w-full">
                <input type="hidden" name="current_photo" id="edit_current_photo">
            </div>

            <div class="flex justify-end gap-2 pt-2">
                <button type="button" onclick="closeModal('editProductModal')" class="px-4 py-2 bg-gray-400 text-white rounded">Cancelar</button>
                <button type="submit" class="px-4 py-2 bg-yellow-500 text-white rounded">Actualizar</button>
            </div>
        </form>

    </div>
</div>

<!-- Modal Eliminar -->
<div id="deleteProductModal" class="fixed inset-0 bg-black bg-opacity-50 hidden flex items-center justify-center z-50">
    <div class="bg-white rounded-lg shadow w-full max-w-sm p-6">

        <h2 class="text-xl font-bold mb-4 text-red-600">Eliminar Producto</h2>

        <form action="logic/products_back/delete_product.php" method="POST">
            <input type="hidden" name="id_product" id="delete_id_product">

            <p class="mb-4">¿Seguro que querés eliminar este producto?</p>

            <div class="flex justify-end gap-2">
                <button type="button" onclick="closeModal('deleteProductModal')" class="px-4 py-2 bg-gray-400 text-white rounded">Cancelar</button>
                <button type="submit" class="px-4 py-2 bg-red-600 text-white rounded">Eliminar</button>
            </div>
        </form>

    </div>
</div>

<script>
function openModal(id){ document.getElementById(id).classList.remove('hidden'); }
function closeModal(id){ document.getElementById(id).classList.add('hidden'); }

function openEditProductModal(p){
    document.getElementById('edit_id_product').value = p.id_product;
    document.getElementById('edit_name').value = p.name;
    document.getElementById('edit_sku').value = p.sku ?? '';
    document.getElementById('edit_barcode').value = p.barcode ?? '';
    document.getElementById('edit_id_category').value = p.id_category ?? '';
    document.getElementById('edit_id_supplier').value = p.id_supplier ?? '';
    document.getElementById('edit_description').value = p.description ?? '';
    document.getElementById('edit_cost_price').value = p.cost_price;
    document.getElementById('edit_sale_price').value = p.sale_price;
    document.getElementById('edit_stock').value = p.stock;
    document.getElementById('edit_min_stock').value = p.min_stock;
    document.getElementById('edit_vat').value = p.vat;
    document.getElementById('edit_current_photo').value = p.photo ?? '';
    openModal('editProductModal');
}

function openDeleteProductModal(id){
    document.getElementById('delete_id_product').value = id;
    openModal('deleteProductModal');
}
</script>
