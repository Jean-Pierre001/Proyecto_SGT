<?php
include '../includes/conn.php';

if (isset($_GET['id'])) {
    $id = intval($_GET['id']);
    if ($id <= 0) {
        header("Location: ../users.php?error=ID inválido");
        exit;
    }

    try {
        $stmt = $conn->prepare("DELETE FROM user_courses WHERE id = ?");
        $stmt->execute([$id]);

        header("Location: ../users.php?msg=Curso eliminado correctamente");
        exit;
    } catch (PDOException $e) {
        header("Location: ../users.php?error=" . urlencode($e->getMessage()));
        exit;
    }
} else {
    header("Location: ../users.php");
    exit;
}
