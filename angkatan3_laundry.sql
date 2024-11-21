-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 21 Nov 2024 pada 09.46
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
-- Database: `angkatan3_laundry`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `customer`
--

CREATE TABLE `customer` (
  `id` int(9) NOT NULL,
  `customer_name` varchar(55) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `customer`
--

INSERT INTO `customer` (`id`, `customer_name`, `phone`, `address`, `created_at`, `updated_at`) VALUES
(1, 'Muhammad Reza Ibrahim 1', '065435435', 'Bekasi', '2024-11-14 08:16:16', '2024-11-14 08:16:16'),
(3, 'Muhammad Reza Ibrahim', '06785678', 'Bekasi', '2024-11-15 04:19:54', '2024-11-15 04:19:54');

-- --------------------------------------------------------

--
-- Struktur dari tabel `level`
--

CREATE TABLE `level` (
  `id` int(11) NOT NULL,
  `nama_level` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `level`
--

INSERT INTO `level` (`id`, `nama_level`, `created_at`, `updated_at`) VALUES
(5, 'Administrator', '2024-11-15 02:02:02', '2024-11-15 02:02:02'),
(6, 'Operator', '2024-11-15 02:02:02', '2024-11-15 02:02:02'),
(7, 'Pimpinan123', '2024-11-15 02:07:33', '2024-11-15 02:33:02');

-- --------------------------------------------------------

--
-- Struktur dari tabel `paket`
--

CREATE TABLE `paket` (
  `id` int(11) NOT NULL,
  `nama_paket` varchar(50) NOT NULL,
  `harga` int(11) NOT NULL,
  `deskripsi` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `paket`
--

INSERT INTO `paket` (`id`, `nama_paket`, `harga`, `deskripsi`, `created_at`, `updated_at`) VALUES
(1, 'Gosok', 4000, 'Sudah dapat pewangi extra', '2024-11-15 06:41:16', '2024-11-15 06:41:30'),
(2, 'Cuci dan Gosok', 6000, 'Sudah terbungkus rapih', '2024-11-15 06:42:47', '2024-11-15 06:42:47'),
(3, 'Paket Besar', 7000, 'Sprei My Love, Karpet dan Lemari', '2024-11-15 06:43:25', '2024-11-15 06:43:25');

-- --------------------------------------------------------

--
-- Struktur dari tabel `trans_laundry_pickup`
--

CREATE TABLE `trans_laundry_pickup` (
  `id` int(11) NOT NULL,
  `id_customer` int(11) NOT NULL,
  `id_order` int(11) NOT NULL,
  `pickup_date` date NOT NULL,
  `pickup_pay` double(10,2) NOT NULL,
  `pickup_change` double(10,2) NOT NULL,
  `note` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `trans_laundry_pickup`
--

INSERT INTO `trans_laundry_pickup` (`id`, `id_customer`, `id_order`, `pickup_date`, `pickup_pay`, `pickup_change`, `note`, `created_at`, `updated_at`) VALUES
(2, 3, 4, '2024-11-21', 20000.00, 10.00, '', '2024-11-21 06:04:32', '2024-11-21 06:04:32');

-- --------------------------------------------------------

--
-- Struktur dari tabel `trans_order`
--

CREATE TABLE `trans_order` (
  `id` int(11) NOT NULL,
  `id_customer` int(11) NOT NULL,
  `no_transaksi` varchar(50) NOT NULL,
  `tanggal_laundry` datetime NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `trans_order`
--

INSERT INTO `trans_order` (`id`, `id_customer`, `no_transaksi`, `tanggal_laundry`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, '#INV2011240001', '2024-11-01 00:00:00', 0, '2024-11-20 02:43:30', '2024-11-21 08:14:52'),
(2, 1, '#INV2011240002', '2024-11-20 00:00:00', 0, '2024-11-20 02:44:34', '2024-11-20 02:44:34'),
(3, 1, '#INV2011240003', '2024-11-21 00:00:00', 0, '2024-11-20 03:15:43', '2024-11-21 08:15:01'),
(4, 3, '#INV2011240004', '2024-11-30 00:00:00', 1, '2024-11-20 03:16:00', '2024-11-21 08:15:16');

-- --------------------------------------------------------

--
-- Struktur dari tabel `trans_order_detail`
--

CREATE TABLE `trans_order_detail` (
  `id` int(11) NOT NULL,
  `id_order` int(11) NOT NULL,
  `id_paket` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `subtotal` int(11) NOT NULL,
  `catatan` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `trans_order_detail`
--

INSERT INTO `trans_order_detail` (`id`, `id_order`, `id_paket`, `qty`, `subtotal`, `catatan`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 4000, '', '2024-11-20 02:43:30', '2024-11-20 02:43:30'),
(2, 1, 0, 0, 0, '', '2024-11-20 02:43:30', '2024-11-20 02:43:30'),
(3, 2, 1, 2, 8000, '', '2024-11-20 02:44:34', '2024-11-20 02:44:34'),
(4, 2, 0, 0, 0, '', '2024-11-20 02:44:34', '2024-11-20 02:44:34'),
(5, 3, 1, 1, 4000, '', '2024-11-20 03:15:43', '2024-11-20 03:15:43'),
(6, 4, 1, 1, 4000, '', '2024-11-20 03:16:00', '2024-11-20 03:16:00'),
(7, 4, 2, 1, 6000, '', '2024-11-20 03:16:00', '2024-11-20 03:16:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `id_level` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `id_level`, `nama`, `email`, `username`, `password`, `created_at`, `updated_at`) VALUES
(13, 5, 'Admin', 'admin@gmail.com', 'admin', '12345678', '2024-11-15 02:02:20', '2024-11-15 02:02:20');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `level`
--
ALTER TABLE `level`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `paket`
--
ALTER TABLE `paket`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `trans_laundry_pickup`
--
ALTER TABLE `trans_laundry_pickup`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `trans_order`
--
ALTER TABLE `trans_order`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `trans_order_detail`
--
ALTER TABLE `trans_order_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_ibfk_1` (`id_level`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `level`
--
ALTER TABLE `level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `paket`
--
ALTER TABLE `paket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `trans_laundry_pickup`
--
ALTER TABLE `trans_laundry_pickup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `trans_order`
--
ALTER TABLE `trans_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `trans_order_detail`
--
ALTER TABLE `trans_order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`id_level`) REFERENCES `level` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
