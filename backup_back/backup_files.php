<?php
$uploadsDir = '../uploads';
$backupFile = 'uploads_backup_' . date('Y-m-d_H-i-s') . '.zip';

$zip = new ZipArchive();
if ($zip->open($backupFile, ZipArchive::CREATE | ZipArchive::OVERWRITE) === TRUE) {

    $uploadsDirReal = realpath($uploadsDir);

    $files = new RecursiveIteratorIterator(new RecursiveDirectoryIterator($uploadsDirReal, RecursiveDirectoryIterator::SKIP_DOTS));

    foreach ($files as $file) {
        if (!$file->isDir()) {
            $filePath = $file->getRealPath();
            // Ruta relativa dentro del zip
            $relativePath = substr($filePath, strlen($uploadsDirReal) + 1);
            $zip->addFile($filePath, $relativePath);
        }
    }

    $zip->close();

    header('Content-Description: File Transfer');
    header('Content-Type: application/zip');
    header('Content-Disposition: attachment; filename="'.basename($backupFile).'"');
    header('Content-Transfer-Encoding: binary');
    header('Content-Length: ' . filesize($backupFile));
    readfile($backupFile);
    unlink($backupFile);
    exit;

} else {
    echo "Error al crear el backup de archivos.";
}
?>
