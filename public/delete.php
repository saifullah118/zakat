<?php
include 'config.php'; // Mengimpor file konfigurasi database

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id = $_POST['id'];

    // Hapus data dari tabel diagnosa
    $query = "DELETE FROM diagnosa WHERE id = ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("i", $id);
    $stmt->execute();

    // Redirect kembali ke halaman admin.php setelah penghapusan
    header("Location: admin.php");
    exit;
}
?>
