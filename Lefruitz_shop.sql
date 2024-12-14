-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 14, 2024 at 07:21 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Lefruitz_shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id_categories` int(10) NOT NULL,
  `nama_categories` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id_categories`, `nama_categories`) VALUES
(1, 'fruits'),
(2, 'others');

-- --------------------------------------------------------

--
-- Table structure for table `price`
--

CREATE TABLE `price` (
  `id_price` int(10) NOT NULL,
  `id_product` int(10) DEFAULT NULL,
  `purchase_price` float DEFAULT NULL,
  `selling_price` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `price`
--

INSERT INTO `price` (`id_price`, `id_product`, `purchase_price`, `selling_price`) VALUES
(1, 1, 0.99, 99.99),
(2, 2, 0.99, 1.99),
(3, 3, 0.99, 10.99),
(4, 7, 0.99, 99.99),
(5, 8, 0.59, 1.59),
(6, 9, 0.99, 10.99),
(10, 10, 0.99, 10.99),
(11, 11, 0.99, 10.99),
(12, 12, 0.99, 99.99);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id_product` int(11) NOT NULL,
  `id_categories` int(11) DEFAULT NULL,
  `nama_product` varchar(50) DEFAULT NULL,
  `description_product` varchar(1000) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `more_item` tinyint(1) NOT NULL DEFAULT 0,
  `stock` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id_product`, `id_categories`, `nama_product`, `description_product`, `image`, `more_item`, `stock`) VALUES
(1, 1, 'Wongkan Apple', 'Chinese apple grown in Chernobyl', 'http://127.0.0.1:8080/fruitAPI/reactjs-lefruitz-web/src/assets/img/apple.jpeg', 0, 12),
(2, 1, 'Sliced Watermelons', 'Handpicked by specialists', 'http://127.0.0.1:8080/fruitAPI/reactjs-lefruitz-web/src/assets/img/watermelon.jpg', 0, 100),
(3, 1, 'Peach', 'Peaches.', 'http://127.0.0.1:8080/fruitAPI/reactjs-lefruitz-web/src/assets/img/peach.jpg', 0, 20),
(7, 2, 'Suspicious Mushrooms', 'Found in the wretched lands ', 'http://127.0.0.1:8080/fruitAPI/reactjs-lefruitz-web/src/assets/img/mushrooms.jpg', 0, 100),
(8, 2, 'Mini Beets', 'Ordinary beets but mini-size', 'http://127.0.0.1:8080/fruitAPI/reactjs-lefruitz-web/src/assets/img/beets.jpeg', 0, 100),
(9, 2, 'Bread', 'Bread.', 'http://127.0.0.1:8080/fruitAPI/reactjs-lefruitz-web/src/assets/img/bread.jpeg', 0, 100),
(10, 1, 'Pear', 'Our favourite product, the pear. Better than apple.', 'http://127.0.0.1:8080/fruitAPI/reactjs-lefruitz-web/src/assets/img/pear.jpeg', 1, 100),
(11, 1, 'Even More Pear!', 'The return of pear', 'http://127.0.0.1:8080/fruitAPI/reactjs-lefruitz-web/src/assets/img/pear2.jpeg', 1, 100),
(12, 2, 'The Mushrooms Are Back', 'do not run from shroom', 'http://127.0.0.1:8080/fruitAPI/reactjs-lefruitz-web/src/assets/img/mushrooms2.jpg', 1, 100);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(10) NOT NULL,
  `jenis_transaksi` int(10) DEFAULT NULL,
  `id_product` int(10) DEFAULT NULL,
  `jumlah` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userid` int(11) NOT NULL,
  `userName` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('guest','user','admin') DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userid`, `userName`, `email`, `password`, `role`) VALUES
(1, 'Ghettos', 'ghettothetto@gmail.com', '$2a$10$J/vRnCWJ/TqLpN5GZjYaXuS7kxDE.jzZPsvzn2Wfjokh052BJASPO', 'guest'),
(2, 'Kinex', 'Nextto@gmail.com', '$2a$10$pOP6Iykbm4lsNrlPxRydLOJDHHHxuT8nGUTPnQ5/Nv58EqZweT1m2', 'admin'),
(3, 'Alc', 'alclara@gmail.com', '$2a$10$VCWnYEN0Wxbrvd9bAvFHvuh4pxkY8JVanh.g7pPNldkG6mTAtGp/G', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id_categories`);

--
-- Indexes for table `price`
--
ALTER TABLE `price`
  ADD PRIMARY KEY (`id_price`),
  ADD KEY `id_product` (`id_product`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id_product`),
  ADD KEY `id_categories` (`id_categories`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_product` (`id_product`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userid`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id_categories` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `price`
--
ALTER TABLE `price`
  MODIFY `id_price` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id_product` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `price`
--
ALTER TABLE `price`
  ADD CONSTRAINT `price_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `product` (`id_product`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`id_categories`) REFERENCES `categories` (`id_categories`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `product` (`id_product`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
