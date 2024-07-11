-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 11 Jul 2024 pada 20.58
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `zakat.db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `diagnosa`
--

CREATE TABLE `diagnosa` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `nik` varchar(255) NOT NULL,
  `noHp` varchar(255) NOT NULL,
  `alamat` text NOT NULL,
  `tanggungan` int(11) NOT NULL,
  `pendapatan` varchar(255) NOT NULL,
  `cf_result` decimal(5,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `diagnosa`
--

INSERT INTO `diagnosa` (`id`, `nama`, `nik`, `noHp`, `alamat`, `tanggungan`, `pendapatan`, `cf_result`, `created_at`) VALUES
(4, 'abi', '0877', '0877', 'ajshd', 9, '7,000,001 - 10,000,000', 10.00, '2024-07-09 18:57:09'),
(5, 'abi', '098292', '0973', 'lebek', 5, '1,000,001 - 3,000,000', 50.00, '2024-07-10 05:06:28'),
(6, 'a', 'a', 'a', 'a', 9, '> 10,000,000', 0.00, '2024-07-10 13:03:03'),
(7, 'aaa', '123', '4567', 'alamat', 1, '<= 1,000,000', 10.00, '2024-07-10 13:37:26'),
(8, 'aisyah', '1211', '08121011', 'jalan', 2, '<= 1,000,000', 20.00, '2024-07-10 13:38:19'),
(9, 'wr', '232', 'df', 'w', 10, '<= 1,000,000', 90.00, '2024-07-10 14:08:04'),
(10, '2343', 'sfs', 'gfd', 'afetd', 1, '> 10,000,000', 0.00, '2024-07-10 14:08:51'),
(11, 'setre', 'ete', 'rg', 'eter', 7, '<= 1,000,000', 70.00, '2024-07-10 14:09:33'),
(12, 'ergt', 'dfs', 'dfds', 'sdfs', 10, '<= 1,000,000', 90.00, '2024-07-10 14:10:03'),
(13, 'dfgd', 'sdfs', 'sdfds', 'sdefs', 4, '7,000,001 - 10,000,000', 10.00, '2024-07-10 14:28:17'),
(14, 'Aisyah', '121144', '081210116331', 'tangerang', 3, '1,000,001 - 3,000,000', 30.00, '2024-07-10 14:32:51'),
(15, 'aisayah', '2323', '9374', 'bnbzc', 9, '1,000,001 - 3,000,000', 70.00, '2024-07-10 14:38:13'),
(16, 'sd', 'sada', 'asdsd', 'sad', 1, '<= 1,000,000', 10.00, '2024-07-10 14:39:05'),
(17, 'aisayah', '12118928', 'wqkjwqq', 'wjkjqe', 3, '1,000,001 - 3,000,000', 30.00, '2024-07-10 14:40:55');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pendapatan`
--

CREATE TABLE `pendapatan` (
  `id` varchar(3) NOT NULL,
  `range_pendapatan` varchar(20) DEFAULT NULL,
  `mb` float DEFAULT NULL,
  `md` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pendapatan`
--

INSERT INTO `pendapatan` (`id`, `range_pendapatan`, `mb`, `md`) VALUES
('S01', '<= 1,000,000', 1, 0),
('S02', '1,000,001 - 3,000,00', 0.75, 0.25),
('S03', '3,000,001 - 5,000,00', 0.5, 0.5),
('S04', '5,000,001 - 7,000,00', 0.25, 0.75),
('S05', '7,000,001 - 10,000,0', 0.1, 0.9),
('S06', '> 10,000,000', 0, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tanggungan`
--

CREATE TABLE `tanggungan` (
  `id` varchar(3) NOT NULL,
  `jumlah_tanggungan` varchar(5) DEFAULT NULL,
  `mb` float DEFAULT NULL,
  `md` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tanggungan`
--

INSERT INTO `tanggungan` (`id`, `jumlah_tanggungan`, `mb`, `md`) VALUES
('D01', '1', 0.7, 0.3),
('D02', '2', 0.75, 0.25),
('D03', '3', 0.8, 0.2),
('D04', '4', 0.85, 0.15),
('D05', '5', 0.9, 0.1),
('D06', '6', 0.95, 0.05),
('D07', '7-10', 1, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `created_at`) VALUES
(4, 'admin', 'admin', '2024-07-09 18:14:27');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `diagnosa`
--
ALTER TABLE `diagnosa`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pendapatan`
--
ALTER TABLE `pendapatan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tanggungan`
--
ALTER TABLE `tanggungan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `diagnosa`
--
ALTER TABLE `diagnosa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
