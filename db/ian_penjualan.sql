-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 04 Jan 2024 pada 03.03
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
-- Database: `ian_penjualan`
--

DELIMITER $$
--
-- Prosedur
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `jumlah_barang` (IN `p_id_jenis_barang` INT, OUT `p_jumlah_barang` INT)   BEGIN
	SELECT COUNT(*) INTO p_jumlah_barang
    FROM barang
    WHERE id_jenis_barang = p_id_jenis_barang;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `lihat_barang` (OUT `barang` VARCHAR(300))   BEGIN
SELECT * FROM barang;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `pembeli` (IN `p_nama_pembeli` VARCHAR(300), IN `p_alamat_pembeli` VARCHAR(300))   BEGIN
INSERT INTO pembeli (nama_pembeli, alamat_pembeli)
VALUES (p_nama_pembeli, p_alamat_pembeli);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `suplier` (IN `p_na_sup` VARCHAR(300), IN `p_al_sup` VARCHAR(300))   BEGIN
INSERT INTO suplier (nama_suplier, alamat_suplier)
VALUES (p_na_sup, p_al_sup);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `tambah_barang` (IN `p_id_jenis_barang` INT, IN `p_nama_jenis_barang` VARCHAR(300))   BEGIN
INSERT INTO jenis_barang (id_jenis_barang, jenis_barang)
VALUES (p_id_jenis_barang, p_nama_jenis_barang);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `transaksi_barang` ()   BEGIN
SELECT * FROM transaksi_barang;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `transkasi_barang_tgl` (IN `p_tanggal_transaksi` DATE)   BEGIN
SELECT * FROM transaksi_barang WHERE tanggal_transaksi = p_tanggal_transaksi;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `id_barang` int(11) NOT NULL,
  `nama_barang` varchar(255) NOT NULL,
  `harga_barang` decimal(10,2) NOT NULL,
  `id_jenis_barang` int(11) NOT NULL,
  `id_toko` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`id_barang`, `nama_barang`, `harga_barang`, `id_jenis_barang`, `id_toko`) VALUES
(1, 'Bola', 45000.00, 1, 1),
(2, 'Baju', 80000.00, 2, 2),
(3, 'Celana', 700000.00, 2, 3),
(4, 'Hoodie', 250000.00, 2, 4),
(5, 'Sepatu', 800000.00, 2, 5),
(6, 'Hp', 999000.00, 3, 6),
(7, 'Meja', 120000.00, 4, 7),
(8, 'Boneka', 150000.00, 5, 8),
(9, 'Kursi', 80000.00, 4, 9),
(10, 'Laptop', 500000.00, 3, 10);

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis_barang`
--

CREATE TABLE `jenis_barang` (
  `id_jenis_barang` int(11) NOT NULL,
  `jenis_barang` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `jenis_barang`
--

INSERT INTO `jenis_barang` (`id_jenis_barang`, `jenis_barang`) VALUES
(1, 'Alat olahraga'),
(2, 'Pakaian'),
(3, 'Elektronik'),
(4, 'Mebel'),
(5, 'Hiasan'),
(6, 'kuda');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembeli`
--

CREATE TABLE `pembeli` (
  `id_pembeli` int(11) NOT NULL,
  `nama_pembeli` varchar(255) NOT NULL,
  `alamat_pembeli` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pembeli`
--

INSERT INTO `pembeli` (`id_pembeli`, `nama_pembeli`, `alamat_pembeli`) VALUES
(1, 'Abdul', 'Yogyakarta'),
(2, 'Yanto', 'Yogyakarta'),
(3, 'Memet', 'Yogyakarta'),
(4, 'Wardi', 'Yogyakarta'),
(5, 'Kamil', 'Yogyakarta'),
(6, 'Taro', 'Yogyakarta'),
(7, 'Gito', 'Yogyakarta'),
(8, 'Candri', 'Yogyakarta'),
(9, 'Irfan', 'Yogyakarta'),
(10, 'budi', 'Yogyakarta'),
(11, 'joko', 'Bantul'),
(12, 'zua', 'Bantul');

-- --------------------------------------------------------

--
-- Struktur dari tabel `suplier`
--

CREATE TABLE `suplier` (
  `id_suplier` int(11) NOT NULL,
  `nama_suplier` varchar(255) NOT NULL,
  `alamat_suplier` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `suplier`
--

INSERT INTO `suplier` (`id_suplier`, `nama_suplier`, `alamat_suplier`) VALUES
(1, 'Pt.indah', 'Jakarta'),
(2, 'Pt.sentosa', 'Bekasi'),
(3, 'Pt.akos', 'Bogor'),
(4, 'Pt.mulia', 'Jakarta'),
(5, 'Pt.adi', 'Palembang'),
(6, 'Pt.Koko', 'Tarakan'),
(7, 'Pt.poli', 'Mojokerto'),
(8, 'Pt.binance', 'Aceh'),
(9, 'Pt.doge', 'Yogyakarta'),
(10, 'Pt.raca', 'Bogor'),
(11, 'mariadi', 'jember'),
(12, 'manju', 'prindavan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `toko`
--

CREATE TABLE `toko` (
  `id_toko` int(11) NOT NULL,
  `nama_toko` varchar(255) NOT NULL,
  `pemilik_toko` varchar(255) NOT NULL,
  `id_suplier` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `toko`
--

INSERT INTO `toko` (`id_toko`, `nama_toko`, `pemilik_toko`, `id_suplier`) VALUES
(1, 'Toko cina', 'Jono', 1),
(2, 'Toko Secon', 'Yudi', 2),
(3, 'Toko r20', 'Rahmad', 3),
(4, 'Toko kw', 'Koko', 4),
(5, 'Toko kita', 'Kiko', 5),
(6, 'Toko m200', 'Tatin', 6),
(7, 'Toko vito', 'Toro', 7),
(8, 'Toko abadi', 'Abdul', 8),
(9, 'Toko jaya', 'Uus', 9),
(10, 'Toko abdul', 'Mamat', 10);

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi_barang`
--

CREATE TABLE `transaksi_barang` (
  `id_transaksi_barang` int(11) NOT NULL,
  `tanggal_transaksi` date NOT NULL,
  `id_barang` int(11) NOT NULL,
  `id_pembeli` int(11) NOT NULL,
  `jumlah_beli_barang` int(11) NOT NULL,
  `total_bayar` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `transaksi_barang`
--

INSERT INTO `transaksi_barang` (`id_transaksi_barang`, `tanggal_transaksi`, `id_barang`, `id_pembeli`, `jumlah_beli_barang`, `total_bayar`) VALUES
(1, '2023-09-13', 1, 1, 3, 135000.00),
(2, '2023-01-14', 2, 2, 5, 400000.00),
(3, '2023-09-14', 3, 3, 2, 1400000.00),
(4, '2023-09-16', 4, 4, 3, 750000.00),
(5, '2023-09-17', 5, 5, 1, 800000.00),
(6, '2023-09-17', 6, 6, 1, 800000.00),
(7, '2023-09-17', 7, 7, 1, 120000.00),
(8, '2023-09-19', 8, 8, 2, 300000.00),
(9, '2023-09-19', 9, 9, 4, 320000.00),
(10, '2023-09-20', 10, 10, 1, 500000.00);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`),
  ADD KEY `id_toko` (`id_toko`);

--
-- Indeks untuk tabel `jenis_barang`
--
ALTER TABLE `jenis_barang`
  ADD PRIMARY KEY (`id_jenis_barang`);

--
-- Indeks untuk tabel `pembeli`
--
ALTER TABLE `pembeli`
  ADD PRIMARY KEY (`id_pembeli`);

--
-- Indeks untuk tabel `suplier`
--
ALTER TABLE `suplier`
  ADD PRIMARY KEY (`id_suplier`);

--
-- Indeks untuk tabel `toko`
--
ALTER TABLE `toko`
  ADD PRIMARY KEY (`id_toko`);

--
-- Indeks untuk tabel `transaksi_barang`
--
ALTER TABLE `transaksi_barang`
  ADD PRIMARY KEY (`id_transaksi_barang`),
  ADD KEY `id_barang` (`id_barang`),
  ADD KEY `id_pembeli` (`id_pembeli`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `barang`
--
ALTER TABLE `barang`
  MODIFY `id_barang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `jenis_barang`
--
ALTER TABLE `jenis_barang`
  MODIFY `id_jenis_barang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `pembeli`
--
ALTER TABLE `pembeli`
  MODIFY `id_pembeli` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `suplier`
--
ALTER TABLE `suplier`
  MODIFY `id_suplier` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `toko`
--
ALTER TABLE `toko`
  MODIFY `id_toko` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `transaksi_barang`
--
ALTER TABLE `transaksi_barang`
  MODIFY `id_transaksi_barang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `barang_ibfk_1` FOREIGN KEY (`id_toko`) REFERENCES `toko` (`id_toko`);

--
-- Ketidakleluasaan untuk tabel `jenis_barang`
--
ALTER TABLE `jenis_barang`
  ADD CONSTRAINT `jenis_barang_ibfk_1` FOREIGN KEY (`id_jenis_barang`) REFERENCES `barang` (`id_barang`);

--
-- Ketidakleluasaan untuk tabel `transaksi_barang`
--
ALTER TABLE `transaksi_barang`
  ADD CONSTRAINT `transaksi_barang_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`),
  ADD CONSTRAINT `transaksi_barang_ibfk_2` FOREIGN KEY (`id_pembeli`) REFERENCES `pembeli` (`id_pembeli`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
