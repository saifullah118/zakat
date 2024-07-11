<?php
include 'config.php';
session_start();

if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit;
}

if (isset($_GET['id'])) {
    $id = $_GET['id'];
    $query = "SELECT * FROM diagnosa WHERE id = ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("i", $id);
    $stmt->execute();
    $result = $stmt->get_result();
    $data = $result->fetch_assoc();

    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $nama = $_POST['nama'];
        $nik = $_POST['nik'];
        $noHp = $_POST['noHp'];
        $alamat = $_POST['alamat'];
        
        $updateQuery = "UPDATE diagnosa SET nama = ?, nik = ?, noHp = ?, alamat = ? WHERE id = ?";
        $updateStmt = $conn->prepare($updateQuery);
        $updateStmt->bind_param("ssssi", $nama, $nik, $noHp, $alamat, $id);

        if ($updateStmt->execute()) {
            header("Location: admin.php");
            exit;
        } else {
            echo "Error updating record: " . $conn->error;
        }
    }
} else {
    header("Location: admin.php");
    exit;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Data Diagnosa</title>
</head>
<body>
    <h2>Edit Data Diagnosa</h2>
    <form method="post">
        <label for="nama">Nama:</label>
        <input type="text" name="nama" id="nama" value="<?php echo htmlspecialchars($data['nama']); ?>" required><br>

        <label for="nik">NIK:</label>
        <input type="text" name="nik" id="nik" value="<?php echo htmlspecialchars($data['nik']); ?>" required><br>

        <label for="noHp">No HP:</label>
        <input type="text" name="noHp" id="noHp" value="<?php echo htmlspecialchars($data['noHp']); ?>" required><br>

        <label for="alamat">Alamat:</label>
        <input type="text" name="alamat" id="alamat" value="<?php echo htmlspecialchars($data['alamat']); ?>" required><br>

        <button type="submit">Update</button>
    </form>
</body>
</html>
