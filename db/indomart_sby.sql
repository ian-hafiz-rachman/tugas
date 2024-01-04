-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 04 Jan 2024 pada 03.02
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `indomart_sby`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `id_barang` int(11) NOT NULL,
  `nama_barang` varchar(220) NOT NULL,
  `stok` int(11) NOT NULL,
  `harga` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`id_barang`, `nama_barang`, `stok`, `harga`) VALUES
(1, 'indomie goreng spc 80', 100, 2300.00),
(2, 'sedap mie soto 75gr', 100, 2300.00),
(3, 'indomie kari ayam 72gr', 100, 2300.00),
(4, 'indomie ayam bawang', 100, 2300.00),
(5, 'sukses isi 2 a.kcp 129', 100, 3350.00),
(6, 'indomie grg rica 85gr', 100, 2300.00),
(7, 'sedap mie kari sp75', 100, 2300.00),
(8, 'sedap mie baso sp77', 100, 2300.00),
(9, 'indomie grg s.mth 85gr', 100, 2300.00),
(10, 'sedap mie ayam bawang tl73', 100, 2300.00),
(11, 'rinso det.mtc frnt 3', 100, 93000.00),
(13, 'cornetto black & white 85', 100, 5000.00),
(14, 'walls pp cho lava 56', 100, 3000.00),
(15, 'indomilk banana 190', 100, 4900.00),
(16, 'cimory yoghrt mix 250', 100, 9300.00);

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_toko`
--

CREATE TABLE `data_toko` (
  `id_toko` int(11) NOT NULL,
  `alamat` text NOT NULL,
  `no_telp` text NOT NULL,
  `kode_pos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `data_toko`
--

INSERT INTO `data_toko` (`id_toko`, `alamat`, `no_telp`, `kode_pos`) VALUES
(4, 'krukah selatan 50 ngagalerejo surabaya\r\n', '082369572415\r\n', 60245),
(5, 'wirokerten bantul yogyakarta	\r\n', '085136975124\r\n', 60325);

-- --------------------------------------------------------

--
-- Struktur dari tabel `karyawan`
--

CREATE TABLE `karyawan` (
  `id_karyawan` int(11) NOT NULL,
  `nama_karyawan` varchar(220) NOT NULL,
  `alamat` text NOT NULL,
  `no_telp` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `karyawan`
--

INSERT INTO `karyawan` (`id_karyawan`, `nama_karyawan`, `alamat`, `no_telp`) VALUES
(1, 'aris', 'cikini, bandung', '083216584975'),
(2, 'suniati', 'jakarta utara', '087469531575'),
(3, 'madoki', 'jakarta pusat', '086245873157'),
(4, 'bukoh', 'mojokerto', '087316457925'),
(5, 'farzi', 'jakarrta selatan', '0872136549568');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `id_voucher` int(11) NOT NULL,
  `metode_pembayaran` varchar(220) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `kembali` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `id_voucher`, `metode_pembayaran`, `total`, `kembali`) VALUES
(1, 1, 'cash', 107550.00, 2450.00),
(2, 3, 'cash', 6900.00, 3100.00),
(3, 2, 'cash', 0.00, 0.00);

-- --------------------------------------------------------

--
-- Struktur dari tabel `planggan`
--

CREATE TABLE `planggan` (
  `id_planggan` int(11) NOT NULL,
  `nama_pelangan` varchar(220) NOT NULL,
  `no_telp` text NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `planggan`
--

INSERT INTO `planggan` (`id_planggan`, `nama_pelangan`, `no_telp`, `alamat`) VALUES
(1, 'budas', '0863469857', 'bandung'),
(2, 'jurjan', '087594621545', 'kembangan'),
(3, 'jokhin', '0892465795', 'tembakan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id` int(11) NOT NULL,
  `id_transaksi` int(11) NOT NULL,
  `id_karyawan` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `jumlah_barang` int(11) NOT NULL,
  `id_pembayaran` int(11) NOT NULL,
  `id_toko` int(11) NOT NULL,
  `tgl_transaksi` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`id`, `id_transaksi`, `id_karyawan`, `id_pelanggan`, `id_barang`, `jumlah_barang`, `id_pembayaran`, `id_toko`, `tgl_transaksi`) VALUES
(1, 1, 1, 2, 1, 2, 1, 0, '2018-06-07'),
(2, 1, 1, 2, 2, 1, 1, 0, '2018-06-07'),
(3, 1, 1, 2, 3, 2, 1, 0, '2018-06-07'),
(4, 1, 1, 2, 4, 1, 1, 0, '2018-06-07'),
(5, 1, 1, 2, 5, 1, 1, 0, '2018-06-07'),
(6, 1, 1, 2, 6, 1, 1, 0, '2018-06-07'),
(7, 1, 1, 2, 7, 1, 1, 0, '2018-06-07'),
(8, 1, 1, 2, 8, 1, 1, 0, '2018-06-07'),
(9, 1, 1, 2, 9, 1, 1, 0, '2018-06-07'),
(10, 1, 1, 2, 10, 1, 1, 0, '2018-06-07'),
(11, 1, 1, 2, 11, 1, 1, 0, '2018-06-07'),
(13, 2, 4, 3, 8, 2, 3, 0, '2023-10-18'),
(14, 2, 4, 3, 1, 1, 3, 0, '2023-10-18');

-- --------------------------------------------------------

--
-- Struktur dari tabel `voucher`
--

CREATE TABLE `voucher` (
  `id_voucher` int(11) NOT NULL,
  `nama_voucher` varchar(220) NOT NULL,
  `no_voucher` int(20) NOT NULL,
  `tgl_exp` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `voucher`
--

INSERT INTO `voucher` (`id_voucher`, `nama_voucher`, `no_voucher`, `tgl_exp`) VALUES
(1, 'unilever', 2147483647, '2023-10-28'),
(2, 'pertamina', 1547896458, '2023-10-25'),
(3, 'indomart', 2147383647, '2023-10-30');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indeks untuk tabel `data_toko`
--
ALTER TABLE `data_toko`
  ADD PRIMARY KEY (`id_toko`);

--
-- Indeks untuk tabel `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`id_karyawan`);

--
-- Indeks untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`),
  ADD KEY `fk_vocher` (`id_voucher`);

--
-- Indeks untuk tabel `planggan`
--
ALTER TABLE `planggan`
  ADD PRIMARY KEY (`id_planggan`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_karyawan` (`id_karyawan`),
  ADD KEY `fk_barang` (`id_barang`),
  ADD KEY `fk_pembayaran` (`id_pembayaran`),
  ADD KEY `fk_planggan` (`id_pelanggan`);

--
-- Indeks untuk tabel `voucher`
--
ALTER TABLE `voucher`
  ADD PRIMARY KEY (`id_voucher`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `barang`
--
ALTER TABLE `barang`
  MODIFY `id_barang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `data_toko`
--
ALTER TABLE `data_toko`
  MODIFY `id_toko` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `karyawan`
--
ALTER TABLE `karyawan`
  MODIFY `id_karyawan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `planggan`
--
ALTER TABLE `planggan`
  MODIFY `id_planggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `voucher`
--
ALTER TABLE `voucher`
  MODIFY `id_voucher` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `fk_vocher` FOREIGN KEY (`id_voucher`) REFERENCES `voucher` (`id_voucher`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `fk_barang` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_karyawan` FOREIGN KEY (`id_karyawan`) REFERENCES `karyawan` (`id_karyawan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_pembayaran` FOREIGN KEY (`id_pembayaran`) REFERENCES `pembayaran` (`id_pembayaran`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_planggan` FOREIGN KEY (`id_pelanggan`) REFERENCES `planggan` (`id_planggan`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
