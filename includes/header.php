<!DOCTYPE html>
<html lang="es" class="scroll-smooth">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>
    <?php echo isset($page_title)
      ? htmlspecialchars($page_title) . ' | SGT'
      : 'SGT - Panel de Administración'; ?>
  </title>
  
  <!-- Fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap" rel="stylesheet">

  <!-- Tailwind CSS -->
  <script src="https://cdn.tailwindcss.com"></script>
  <script>
    tailwind.config = {
      theme: {
        extend: {
          colors: {
            'sidebar-bg': '#1a2635ff',
            'patagones-blue': '#2778ff',
            'patagones-gray': '#e9ebf0',
            'patagones-text-dark': '#3b4352',
            'patagones-text-light': '#8e96a3',
            'patagones-green': '#37ac63',
            'patagones-red-bg': '#fef1f1',
            'patagones-red-border': '#f58080',
            'patagones-red-text': '#d9534f',
            'nav-item-hover': '#33485e',
            'border-light': '#333a46ff',
          },
          spacing: {
            '18': '4.5rem',
          }
        }
      }
    }
  </script>

  <!-- Flowbite -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flowbite@3.1.2/dist/flowbite.min.css"/>

  <!-- Swiper -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"/>

  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"/>

  <!-- Scripts principales -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/flowbite@3.1.2/dist/flowbite.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

  <!-- Favicon -->
  <link rel="icon" type="image/png" href="assets/img/android-chrome-512x512.png">

  <!-- Estilos base personalizados -->
  <style>
    body {
      font-family: 'Inter', sans-serif;
      background-color: #f6f8fa;
    }

    .dashboard-bg {
      background-color: #f0f2f5;
    }

    .nav-item {
      padding-top: 0.625rem;
      padding-bottom: 0.625rem;
    }
    .accordion-content {
    max-height: 0;
    overflow: hidden;
    transition: max-height 0.3s ease;
    }
    .accordion-content.open {
        max-height: 500px; /* valor suficiente para que el contenido se vea */
    }
  @keyframes fadeIn {
    from { opacity: 0; transform: translateY(-5px); }
    to { opacity: 1; transform: translateY(0); }
    }
    .animate-fade-in {
        animation: fadeIn 0.15s ease-out;
    }
    /* Forzar que las alertas de SweetAlert estén siempre por encima de todo */
    .swal2-container {
      z-index: 99999 !important;
    }
    .swal2-popup {
      z-index: 100000 !important;
    }
    /* Scrollbar elegante para PC */
  @media (min-width: 1024px) {
    #sidebar .sidebar-scroll {
        scrollbar-width: thin;
        scrollbar-color: #4b5563 #1f2937; /* thumb y track */
    }

    #sidebar .sidebar-scroll::-webkit-scrollbar {
        width: 6px;
    }

    #sidebar .sidebar-scroll::-webkit-scrollbar-track {
        background: #1f2937; /* gris oscuro */
    }

    #sidebar .sidebar-scroll::-webkit-scrollbar-thumb {
        background: #4b5563; /* grisTailwind text-gray-600 */
        border-radius: 10px;
    }

    #sidebar .sidebar-scroll::-webkit-scrollbar-thumb:hover {
        background: #6b7280; /* text-gray-500 */
    }
}
    input[type="checkbox"] {
        width: 20px;
        height: 20px;
        border: 2px solid #000;
        border-radius: 4px;
    }
    input[type="checkbox"]:checked {
        border-color: #000;
    }
  </style>
</head>
<body>
