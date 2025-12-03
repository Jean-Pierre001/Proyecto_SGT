<?php
$page_title = "Backup del Sistema";
include 'includes/session.php';
include 'includes/header.php';
include 'includes/conn.php';
?>

<div class="flex flex-col md:flex-row h-screen overflow-hidden">

    <!-- Sidebar -->
    <?php include 'includes/sidebar.php'; ?>

    <!-- Main content -->
    <main class="flex-1 overflow-y-auto bg-gray-100">

        <!-- Navbar -->
        <?php include 'includes/navbar.php'; ?>

        <!-- Contenedor principal -->
        <div class="p-4 md:p-6 m-4 bg-white border border-gray-300 rounded-lg shadow-lg">

            <!-- Encabezado -->
            <div class="flex flex-col md:flex-row justify-between items-start md:items-center mb-6">
                <h1 class="text-2xl md:text-3xl font-bold text-gray-800">Opciones de Backup</h1>
                <p class="text-gray-600 mt-2 md:mt-0">Realiza copias de seguridad de la base de datos y los archivos del sistema</p>
            </div>

            <!-- Botones de Backup -->
            <div class="grid grid-cols-1 sm:grid-cols-2 gap-6 mb-6">

                <!-- Backup Base de Datos (Descarga) -->
                <div class="p-6 bg-blue-100 border-l-4 border-blue-600 rounded shadow flex flex-col items-center justify-center">
                    <h2 class="text-lg font-semibold text-blue-800 mb-4">Base de Datos</h2>
                    <p class="text-gray-700 mb-4 text-center">Haz un backup completo de la base de datos del sistema.</p>
                    <form action="backup_back/backup_database.php" method="post">
                        <button type="submit" class="bg-blue-600 hover:bg-blue-700 text-white px-6 py-3 rounded-md shadow flex items-center gap-2">
                            <i class="fa-solid fa-database"></i> Hacer Backup
                        </button>
                    </form>
                </div>

                <!-- Backup Archivos del Sistema (Descarga) -->
                <div class="p-6 bg-green-100 border-l-4 border-green-600 rounded shadow flex flex-col items-center justify-center">
                    <h2 class="text-lg font-semibold text-green-800 mb-4">Archivos del Sistema</h2>
                    <p class="text-gray-700 mb-4 text-center">Haz un backup completo de los archivos del sistema (imágenes, documentos, etc.).</p>
                    <form action="backup_back/backup_files.php" method="post">
                        <button type="submit" class="bg-green-600 hover:bg-green-700 text-white px-6 py-3 rounded-md shadow flex items-center gap-2">
                            <i class="fa-solid fa-file-archive"></i> Hacer Backup
                        </button>
                    </form>
                </div>

            </div>

            <!-- Información adicional -->
            <div class="bg-gray-50 border-l-4 border-gray-400 p-4 rounded shadow">
                <p class="text-gray-600">Es recomendable realizar backups periódicos para mantener la seguridad de la información. Al realizar un backup tenga paciencia, este proceso puede tardar algunos segundos o minutos según el tamaño de la base de datos o los archivos.</p>
            </div>

        </div>

    </main>
</div>

<?php include 'includes/footer.php'; ?>
