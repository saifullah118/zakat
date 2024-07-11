<?php
include 'config.php'; // Mengimpor file konfigurasi database

function calculate_CF($tanggungan, $pendapatan) {
    $cf_tanggungan = [
        1 => 0.1,
        2 => 0.2,
        3 => 0.3,
        4 => 0.4,
        5 => 0.5,
        6 => 0.6,
        7 => 0.7,
        8 => 0.8,
        9 => 0.9,
        10 => 1.0
    ];

    $cf_pendapatan = [
        '<= 1,000,000' => 0.9,
        '1,000,001 - 3,000,000' => 0.7,
        '3,000,001 - 5,000,000' => 0.5,
        '5,000,001 - 7,000,000' => 0.3,
        '7,000,001 - 10,000,000' => 0.1,
        '> 10,000,000' => 0.0
    ];

    $mb = min($cf_tanggungan[$tanggungan], $cf_pendapatan[$pendapatan]);

    return $mb * 100;  // Return percentage
}

function get_eligibility($percentage) {
    if ($percentage >= 51 && $percentage <= 90) {
        return "Sangat berhak";
    } elseif ($percentage >= 31 && $percentage <= 50) {
        return "Berhak";
    } elseif ($percentage >= 16 && $percentage <= 30) {
        return "Kurang berhak";
    } elseif ($percentage >= 0 && $percentage <= 15) {
        return "Tidak berhak";
    } else {
        return "Tidak diketahui";
    }
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nama = $_POST['nama'];
    $nik = $_POST['nik'];
    $noHp = $_POST['noHp'];
    $alamat = $_POST['alamat'];
    $tanggungan = (int)$_POST['tanggungan'];
    $pendapatan = $_POST['pendapatan'];

    $cf_result = calculate_CF($tanggungan, $pendapatan);
    $eligibility = get_eligibility($cf_result);

    // Menyimpan hasil diagnosa ke database
    $stmt = $conn->prepare("INSERT INTO diagnosa (nama, nik, noHp, alamat, tanggungan, pendapatan, cf_result, created_at) VALUES (?, ?, ?, ?, ?, ?, ?, NOW())");
    $stmt->bind_param("ssssiss", $nama, $nik, $noHp, $alamat, $tanggungan, $pendapatan, $cf_result);

    if ($stmt->execute()) {
        echo "Data berhasil disimpan.";
    } else {
        echo "Terjadi kesalahan: " . $stmt->error;
    }

    $stmt->close();
    $conn->close();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hasil Diagnosa</title>
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <div class="text-center mt-4">
            <h1 class="h3 mb-0 text-gray-800">Hasil Diagnosa</h1>
        </div>
        <div class="row justify-content-center">
            <div class="col-lg-6 mb-4">
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">Data Identitas</h6>
                    </div>
                    <div class="card-body">
                        <p><strong>Nama:</strong> <?php echo htmlspecialchars($nama); ?></p>
                        <p><strong>NIK:</strong> <?php echo htmlspecialchars($nik); ?></p>
                        <p><strong>No. HP:</strong> <?php echo htmlspecialchars($noHp); ?></p>
                        <p><strong>Alamat:</strong> <?php echo htmlspecialchars($alamat); ?></p>
                        <p><strong>Jumlah Tanggungan:</strong> <?php echo htmlspecialchars($tanggungan); ?></p>
                        <p><strong>Jumlah Pendapatan Perbulan:</strong> <?php echo htmlspecialchars($pendapatan); ?></p>
                        <p><strong>Persentase Kelayakan Zakat:</strong> <?php echo $cf_result; ?>%</p>
                        <p><strong>Keterangan Kelayakan Zakat:</strong> <?php echo $eligibility; ?></p>
                        <div class="text-center mt-4">
                            <a href="proses_diagnosa.php" class="btn btn-primary">Diagnosa Ulang</a>
                            <a href="index.php" class="btn btn-secondary">Keluar</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
