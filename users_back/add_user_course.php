<?php
include '../includes/conn.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $user_id = intval($_POST['user_id']);
    $course_id = intval($_POST['course_id']);

    if ($user_id <= 0 || $course_id <= 0) {
        header("Location: ../users.php?error=Datos inválidos");
        exit;
    }

    try {
        // Verificar si el curso ya está asignado
        $checkStmt = $conn->prepare("SELECT id FROM user_courses WHERE user_id = ? AND course_id = ?");
        $checkStmt->execute([$user_id, $course_id]);
        if ($checkStmt->rowCount() > 0) {
            header("Location: ../users.php?error=El usuario ya tiene asignado este curso");
            exit;
        }

        // Insertar
        $stmt = $conn->prepare("INSERT INTO user_courses (user_id, course_id) VALUES (?, ?)");
        $stmt->execute([$user_id, $course_id]);

        header("Location: ../users.php?msg=Curso agregado correctamente");
        exit;
    } catch (PDOException $e) {
        header("Location: ../users.php?error=" . urlencode($e->getMessage()));
        exit;
    }
} else {
    header("Location: ../users.php");
    exit;
}
