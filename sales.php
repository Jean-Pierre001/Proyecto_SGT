<?php
include 'includes/conn.php';
include 'includes/header.php';
include 'includes/sidebar.php';
?>

<div class="flex-1 flex flex-col min-h-screen ml-0 md:ml-48">
  <?php include 'includes/navbar.php'; ?>

  <main class="p-6 flex-1 bg-gray-100">

    <!-- Selección de cliente -->
    <div class="mb-6 card p-4 rounded-lg shadow bg-white">
      <label class="block font-semibold mb-2">Cliente</label>
      <select id="clientSelect" class="border p-2 rounded w-full bg-gray-50">
        <option value="0">Ocasional</option>
        <?php
        $clients = $conn->query("SELECT id_client, full_name FROM clients WHERE status='Activo'")->fetchAll(PDO::FETCH_ASSOC);
        foreach ($clients as $c) {
          echo "<option value='{$c['id_client']}'>{$c['full_name']}</option>";
        }
        ?>
      </select>
    </div>

    <!-- Filtros de productos -->
    <div class="mb-6 card p-4 rounded-lg shadow bg-white">
      <label class="block font-semibold mb-2">Código de barras (opcional)</label>
      <input type="text" id="barcodeInput" placeholder="Escanear o ingresar código" class="border p-2 rounded w-full mb-4 bg-gray-50">

      <div class="flex flex-wrap gap-2 mb-4">
        <input type="text" id="filterName" placeholder="Nombre" class="border p-2 rounded flex-1 bg-gray-50">
        <select id="filterCategory" class="border p-2 rounded bg-gray-50">
          <option value="">Todas las categorías</option>
          <?php
          $cats = $conn->query("SELECT id_category, name FROM categories")->fetchAll(PDO::FETCH_ASSOC);
          foreach ($cats as $cat) {
            echo "<option value='{$cat['id_category']}'>{$cat['name']}</option>";
          }
          ?>
        </select>
        <input type="number" id="filterPriceMin" placeholder="Precio min" class="border p-2 rounded w-32 bg-gray-50">
        <input type="number" id="filterPriceMax" placeholder="Precio max" class="border p-2 rounded w-32 bg-gray-50">
      </div>

      <!-- Tabla de productos -->
      <div class="overflow-x-auto rounded-lg border border-gray-200">
        <table class="min-w-full text-left text-sm divide-y divide-gray-200">
          <thead class="bg-gray-50">
            <tr>
              <th class="px-3 py-2">Producto</th>
              <th class="px-3 py-2">Categoría</th>
              <th class="px-3 py-2">Marca</th>
              <th class="px-3 py-2">Stock</th>
              <th class="px-3 py-2">Precio</th>
              <th class="px-3 py-2">Agregar</th>
            </tr>
          </thead>
          <tbody id="productsTableBody" class="divide-y divide-gray-100"></tbody>
        </table>
      </div>
    </div>

    <!-- Carrito de venta -->
    <div class="card p-4 rounded-lg shadow bg-white">
      <h3 class="font-semibold mb-4 text-lg">Carrito de venta</h3>
      <div class="overflow-x-auto rounded-lg border border-gray-200 mb-4">
        <table class="min-w-full text-left text-sm divide-y divide-gray-200" id="cartTable">
          <thead class="bg-gray-50">
            <tr>
              <th class="px-3 py-2">Producto</th>
              <th class="px-3 py-2">Cantidad</th>
              <th class="px-3 py-2">Precio</th>
              <th class="px-3 py-2">Subtotal</th>
              <th class="px-3 py-2">Eliminar</th>
            </tr>
          </thead>
          <tbody></tbody>
        </table>
      </div>
      <div class="flex justify-between items-center">
        <span class="font-semibold text-lg">Total: <span id="totalSale">$ 0,00</span></span>
        <button id="registerSale" class="bg-blue-600 hover:bg-blue-700 text-white px-5 py-2 rounded shadow">Registrar venta</button>
      </div>
    </div>

  </main>
</div>

<script>
$(document).ready(function(){

  // Formatear precios en formato argentino
  function formatPrice(num){
    return '$ ' + num.toLocaleString('es-AR', {minimumFractionDigits: 2, maximumFractionDigits: 2});
  }

  // Cargar productos filtrados
  function loadProducts() {
    let name = $('#filterName').val();
    let category = $('#filterCategory').val();
    let priceMin = $('#filterPriceMin').val();
    let priceMax = $('#filterPriceMax').val();
    let barcode = $('#barcodeInput').val();

    $.getJSON('api/sales_products.php', {name, category, priceMin, priceMax, barcode}, function(data){
      let html = '';
      data.forEach(p=>{
        html += `<tr>
                  <td class="px-3 py-2">${p.name}</td>
                  <td class="px-3 py-2">${p.category}</td>
                  <td class="px-3 py-2">${p.brand}</td>
                  <td class="px-3 py-2">${p.stock}</td>
                  <td class="px-3 py-2">${formatPrice(p.sale_price)}</td>
                  <td class="px-3 py-2"><button class="addProduct bg-green-500 hover:bg-green-600 text-white px-3 py-1 rounded" data-id="${p.id_stock}" data-name="${p.name}" data-price="${p.sale_price}">+</button></td>
                 </tr>`;
      });
      $('#productsTableBody').html(html);
    });
  }

  // Filtros dinámicos
  $('#filterName,#filterCategory,#filterPriceMin,#filterPriceMax,#barcodeInput').on('input change', loadProducts);
  loadProducts(); // carga inicial

  // Carrito
  let cart = [];

  $(document).on('click', '.addProduct', function(){
    let id = $(this).data('id');
    let name = $(this).data('name');
    let price = parseFloat($(this).data('price'));
    let existing = cart.find(i => i.id == id);
    if(existing){ existing.quantity += 1; existing.subtotal = existing.quantity*price; }
    else{ cart.push({id,name,price,quantity:1,subtotal:price}); }
    renderCart();
  });

  function renderCart(){
    let html = '';
    let total = 0;
    cart.forEach((i,idx)=>{
      total += i.subtotal;
      html += `<tr>
                <td class="px-3 py-2">${i.name}</td>
                <td class="px-3 py-2"><input type="number" class="cartQty border p-1 rounded w-16" data-idx="${idx}" value="${i.quantity}" min="1"></td>
                <td class="px-3 py-2">${formatPrice(i.price)}</td>
                <td class="px-3 py-2 font-semibold">${formatPrice(i.subtotal)}</td>
                <td class="px-3 py-2"><button class="removeCart bg-red-500 hover:bg-red-600 text-white px-2 py-1 rounded" data-idx="${idx}">x</button></td>
               </tr>`;
    });
    $('#cartTable tbody').html(html);
    $('#totalSale').text(formatPrice(total));
  }

  $(document).on('input','.cartQty',function(){
    let idx = $(this).data('idx');
    let val = parseFloat($(this).val());
    if(val<1) val=1;
    cart[idx].quantity = val;
    cart[idx].subtotal = val*cart[idx].price;
    renderCart();
  });

  $(document).on('click','.removeCart',function(){
    let idx = $(this).data('idx');
    cart.splice(idx,1);
    renderCart();
  });

  // Registrar venta
  $('#registerSale').click(function(){
    let client_id = $('#clientSelect').val();
    if(cart.length==0){ alert('El carrito está vacío'); return; }

    $.post('api/sales_register.php',{client_id,cart:JSON.stringify(cart)},function(res){
      if(res.success){
        alert('Venta registrada con éxito');
        cart=[]; renderCart(); loadProducts();
      }else{
        alert('Error: '+res.error);
      }
    },'json');
  });

});
</script>
