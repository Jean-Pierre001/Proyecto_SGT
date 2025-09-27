<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>SGT- Prototipo V-001</title>
  <!-- Tailwind CSS CDN -->
  <script src="https://cdn.tailwindcss.com"></script>
  
  <!-- Flowbite -->
  <script src="https://cdn.jsdelivr.net/npm/flowbite@3.1.2/dist/flowbite.min.js"></script>

  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"/>
  <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

  <!-- Inter font -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">

  <!-- Librerías adicionales -->

  <!-- Bootstrap (opcional) -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GtvG2PZC++vPm0IU4iL+LVRqGBZDHj9GxDq2x8pQ2M6ri9o5h7gF69v1z7PvQ9tz" crossorigin="anonymous">

  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-L4I1L+6GZXp3yRjPwbxOV9cTt2JkDTViYXv0R9dpD2o1eUQHkG9+dM55/8uYlYfVZgx/2eP8O6k9U7ZkX+bsmQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />

  <!-- SweetAlert2 -->
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

  <!-- jQuery -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-3gJwYp6NTC6rO0HRfR7wIipKnVYUp6e3kKf8gE9hF9W7tGQfLGU2wB1lU2Iu5kuOEXfFvP5KkHeXyoP7Vd5xjQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

  <!-- Chart.js (opcional) -->
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

  <script>
    // Tailwind config (opcional): colores y sombras suaves
    tailwind.config = {
      theme: {
        extend: {
          fontFamily: {
            sans: ["Inter", "system-ui", "-apple-system", "Segoe UI", "Roboto", "Ubuntu", "Cantarell", "Noto Sans", "Helvetica Neue", "Arial", "sans-serif"],
          },
          colors: {
            brand: {
              50: '#ecfeff',
              100: '#cffafe',
              200: '#a5f3fc',
              300: '#67e8f9',
              400: '#22d3ee',
              500: '#06b6d4',
              600: '#0891b2',
              700: '#0e7490',
              800: '#155e75',
              900: '#164e63',
            },
            accent: {
              50: '#f0fdf4',
              100: '#dcfce7',
              200: '#bbf7d0',
              300: '#86efac',
              400: '#4ade80',
              500: '#22c55e',
              600: '#16a34a',
              700: '#15803d',
              800: '#166534',
              900: '#14532d',
            }
          },
          boxShadow: {
            glow: '0 10px 30px -12px rgba(6,182,212,0.4)',
          },
        }
      }
    }
  </script>
  <style>
    body { font-family: 'Inter', sans-serif; background-color: #f9f9f9; }
    .sidebar { background-color: #1f2937; color: white; }
    .sidebar a { display: block; padding: 1rem; border-radius: 0.5rem; margin-bottom: 0.25rem; color: #f9fafb; font-weight: 500; }
    .sidebar a:hover { background-color: #374151; color: white; }
    .navbar { background-color: #fff; border-bottom: 1px solid #e5e5e5; }
    .navbar img { border-radius: 50%; width: 40px; height: 40px; }
    .card { background-color: #fff; color: #111827; }
  </style>
</head>
<body class="flex">