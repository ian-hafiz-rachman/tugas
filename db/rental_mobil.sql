-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 03, 2023 at 02:53 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rental mobil`
--

-- --------------------------------------------------------

--
-- Table structure for table `mobil`
--

CREATE TABLE `mobil` (
  `id_mobil` int(11) NOT NULL,
  `merek` varchar(225) NOT NULL,
  `model` varchar(225) NOT NULL,
  `tahun_produksi` int(11) NOT NULL,
  `warna` varchar(225) NOT NULL,
  `nomor_plat` varchar(20) NOT NULL,
  `harga_sewa_hari` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mobil`
--

INSERT INTO `mobil` (`id_mobil`, `merek`, `model`, `tahun_produksi`, `warna`, `nomor_plat`, `harga_sewa_hari`) VALUES
(1, 'toyota', 'inova', 2019, 'hitam', 'AB1234BH', 50000.00),
(2, 'mitsubishi', 'pajero', 2020, 'hitam', 'AB7583JH', 100000.00),
(3, 'honda', 'NSX', 2018, 'kuning', 'AB84SI', 200000.00),
(4, 'BMW', 'i8', 2017, 'hitam', 'AB2379GD', 300000.00),
(5, 'honda', 'brio', 2023, 'kuning', 'AB3489BT', 150000.00);

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `nama_pelanggan` varchar(225) NOT NULL,
  `alamat` varchar(225) NOT NULL,
  `No_telp` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `nama_pelanggan`, `alamat`, `No_telp`) VALUES
(1, 'anto', 'jonggol', '085152497516'),
(2, 'jando', 'antartika', '084325169875'),
(3, 'darto', 'kutub utara', '08215469784'),
(4, 'murti', 'hawai', '084125497634'),
(5, 'neva', 'ygyakarta', '082153469784');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `id_penyewan` int(11) NOT NULL,
  `metode_pembayaran` varchar(225) NOT NULL,
  `tanggal_pembayaran` date NOT NULL,
  `jumlah_bayar` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `id_penyewan`, `metode_pembayaran`, `tanggal_pembayaran`, `jumlah_bayar`) VALUES
(1, 1, 'cash', '2023-10-12', 400000.00),
(2, 2, 'cash', '2023-10-17', 300000.00),
(3, 3, 'trasfer', '2023-10-19', 100000.00),
(4, 4, 'cash', '2023-10-19', 150000.00),
(5, 5, 'transfer', '2023-10-19', 300000.00);

-- --------------------------------------------------------

--
-- Table structure for table `penyewaan`
--

CREATE TABLE `penyewaan` (
  `id_penyewaan` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `id_mobil` int(11) NOT NULL,
  `tanggal_penyewaan` date NOT NULL,
  `tanggal_kembali` date NOT NULL,
  `total biaya` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `penyewaan`
--

INSERT INTO `penyewaan` (`id_penyewaan`, `id_pelanggan`, `id_mobil`, `tanggal_penyewaan`, `tanggal_kembali`, `total biaya`) VALUES
(1, 3, 3, '2023-10-10', '2023-10-12', 400000),
(2, 2, 4, '2023-10-16', '2023-10-17', 300000),
(3, 1, 1, '2023-10-17', '2023-10-19', 100000),
(4, 3, 5, '2023-10-18', '2023-10-19', 150000),
(5, 5, 4, '2023-10-18', '2023-10-19', 300000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mobil`
--
ALTER TABLE `mobil`
  ADD PRIMARY KEY (`id_mobil`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`),
  ADD KEY `Fk_pembayaran` (`id_penyewan`);

--
-- Indexes for table `penyewaan`
--
ALTER TABLE `penyewaan`
  ADD PRIMARY KEY (`id_penyewaan`),
  ADD KEY `Fk_pelanggan` (`id_pelanggan`),
  ADD KEY `Fk_mobil` (`id_mobil`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `Fk_pembayaran` FOREIGN KEY (`id_penyewan`) REFERENCES `penyewaan` (`id_penyewaan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `penyewaan`
--
ALTER TABLE `penyewaan`
  ADD CONSTRAINT `Fk_mobil` FOREIGN KEY (`id_mobil`) REFERENCES `mobil` (`id_mobil`),
  ADD CONSTRAINT `Fk_pelanggan` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
