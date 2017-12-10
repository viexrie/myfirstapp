-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 19, 2017 at 04:31 AM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 7.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kodetears`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id_barang` varchar(32) NOT NULL,
  `nama_barang` varchar(200) NOT NULL,
  `jenis_barang` varchar(200) NOT NULL,
  `deskirpsi_barang` varchar(200) NOT NULL,
  `jumlah` int(10) NOT NULL,
  `berat` float NOT NULL,
  `harga` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id_barang`, `nama_barang`, `jenis_barang`, `deskirpsi_barang`, `jumlah`, `berat`, `harga`) VALUES
('P0001', 'blackberry Z10', 'Smartphone', 'Full Goods', 12, 12, 50000),
('P0002', 'Asus Zenfone Go', 'Smartphone', 'Full Goods', 5, 5, 50000),
('P0003', 'pocari sweat', 'minuman', 'Full Goods', 5, 51, 50000);

-- --------------------------------------------------------

--
-- Table structure for table `kota`
--

CREATE TABLE `kota` (
  `id_kota` varchar(32) NOT NULL,
  `nama_kota` varchar(200) NOT NULL,
  `ongkos_kirim` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kota`
--

INSERT INTO `kota` (`id_kota`, `nama_kota`, `ongkos_kirim`) VALUES
('S0001', 'Surabaya', 70000),
('S0002', 'Pasuruan', 20000);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `username` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `nama_lengkap` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `no_tlp` varchar(12) NOT NULL,
  `level` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`username`, `password`, `nama_lengkap`, `email`, `no_tlp`, `level`) VALUES
('solomon', 'solomon', 'solomon najib', 'solomon@gmail.com', '081081082', 'Gold'),
('viexrie', 'viexrie', 'Santana Morgan', 'viexrie', '081081081', 'Premium');

-- --------------------------------------------------------

--
-- Table structure for table `tb_kurir`
--

CREATE TABLE `tb_kurir` (
  `id_kurir` varchar(32) NOT NULL,
  `nama_kurir` varchar(200) NOT NULL,
  `status_kurir` varchar(200) NOT NULL,
  `nama_operator` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_kurir`
--

INSERT INTO `tb_kurir` (`id_kurir`, `nama_kurir`, `status_kurir`, `nama_operator`) VALUES
('K0001', 'Akhmad Prayuda', 'Aktif', 'Boris'),
('K0002', 'Jono Aldino', 'Aktif', 'Near'),
('K0003', 'Akhmad suprap', 'Non Aktif', 'close');

-- --------------------------------------------------------

--
-- Table structure for table `tb_kustomer`
--

CREATE TABLE `tb_kustomer` (
  `id_kustomer` varchar(200) NOT NULL,
  `nama_lengkap` varchar(200) NOT NULL,
  `alamat` text NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` varchar(1024) NOT NULL,
  `email` varchar(1024) NOT NULL,
  `telephone` varchar(12) NOT NULL,
  `level` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_kustomer`
--

INSERT INTO `tb_kustomer` (`id_kustomer`, `nama_lengkap`, `alamat`, `username`, `password`, `email`, `telephone`, `level`) VALUES
('KUST001', 'PT. Miracle Jaya', 'Jl. Mawar Situbondo', 'miracle', 'miracle', 'miracle@gmai.com', '081234123', 'Premium'),
('KUST002', 'PT. AdmiralBuldog', 'Jl. Anggrek Sreawak', 'AdmiralBuldog', 'AdmiralBuldog', 'AdmiralBuldog@gmail.com', '0819283746', 'Gold');

-- --------------------------------------------------------

--
-- Table structure for table `tb_transaksi`
--

CREATE TABLE `tb_transaksi` (
  `id_transaksi` varchar(200) NOT NULL,
  `id_barang` varchar(200) NOT NULL,
  `username` varchar(200) NOT NULL,
  `id_kustomer` varchar(200) NOT NULL,
  `id_kurir` varchar(200) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `total_harga` double NOT NULL,
  `jumlah` int(11) NOT NULL,
  `status_trans` char(50) NOT NULL,
  `status_barang` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_transaksi`
--

INSERT INTO `tb_transaksi` (`id_transaksi`, `id_barang`, `username`, `id_kustomer`, `id_kurir`, `tanggal`, `total_harga`, `jumlah`, `status_trans`, `status_barang`) VALUES
('TR0001', 'P0001', 'solomon', 'KUST001', 'K0001', '2017-01-18 18:32:57', 200000, 12, 'closed', 'terkirim'),
('TR0002', 'P0002', 'viexrie', 'KUST002', 'K0003', '2017-01-18 18:32:08', 121212, 12, 'close', 'terkirim');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` int(10) UNSIGNED NOT NULL,
  `nama` varchar(200) NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `level_user` varchar(150) NOT NULL DEFAULT 'member'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `nama`, `username`, `password`, `level_user`) VALUES
(1, 'HMEI7', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin'),
(2, 'Regha', 'member', 'aa08769cdcb26674c6706093503ff0a3', 'member'),
(3, 'Heri Suharyadi', 'heri', 'c337c3bcee60d3a5d10e417a55353e64', 'member'),
(4, 'Satrio Adi Nugroho', 'lolop', '49ea4b62d40a3c4448a35ad9fe9ac711', 'member'),
(5, 'Alfanda', 'alfan', '93279e3308bdbbeed946fc965017f67a', 'member'),
(6, 'Albinosati', 'albino', '93279e3308bdbbeed946fc965017f67a', 'member');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `kota`
--
ALTER TABLE `kota`
  ADD PRIMARY KEY (`id_kota`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `tb_kurir`
--
ALTER TABLE `tb_kurir`
  ADD PRIMARY KEY (`id_kurir`);

--
-- Indexes for table `tb_kustomer`
--
ALTER TABLE `tb_kustomer`
  ADD PRIMARY KEY (`id_kustomer`);

--
-- Indexes for table `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
