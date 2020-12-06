-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 06, 2020 at 03:03 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fastfood`
--

-- --------------------------------------------------------

--
-- Table structure for table `foodtable`
--

CREATE TABLE `foodtable` (
  `id` int(11) NOT NULL,
  `idShop` text COLLATE utf8_unicode_ci NOT NULL,
  `NameFood` text COLLATE utf8_unicode_ci NOT NULL,
  `PathImage` text COLLATE utf8_unicode_ci NOT NULL,
  `Price` text COLLATE utf8_unicode_ci NOT NULL,
  `Detail` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `foodtable`
--

INSERT INTO `foodtable` (`id`, `idShop`, `NameFood`, `PathImage`, `Price`, `Detail`) VALUES
(1, '22', 'Whey Protein', '/flutterOne/Food/food397822.jpg', '450000', 'ເພີ່ມນຳ້ໜັກ'),
(2, '22', 'ເຂົ້າຜັດ', '/flutterOne/Food/food930121.jpg', '15000', 'ເຂົ້າຜັດທະເລໃສ່ກຸ້ງ'),
(3, '22', 'ຕົ້ມຈືດ', '/flutterOne/Food/food712567.jpg', '12000', 'ຕົ້ມຈືດໂຄດແຊບ'),
(4, '22', 'test', '/flutterOne/Food/food416555.jpg', '12000', 'hhsjsjj\ndjjd');

-- --------------------------------------------------------

--
-- Table structure for table `usertable`
--

CREATE TABLE `usertable` (
  `id` int(11) NOT NULL,
  `ChooseType` text COLLATE utf8_unicode_ci NOT NULL,
  `Name` text COLLATE utf8_unicode_ci NOT NULL,
  `User` text COLLATE utf8_unicode_ci NOT NULL,
  `Password` text COLLATE utf8_unicode_ci NOT NULL,
  `NameShop` text COLLATE utf8_unicode_ci NOT NULL,
  `Address` text COLLATE utf8_unicode_ci NOT NULL,
  `Phone` text COLLATE utf8_unicode_ci NOT NULL,
  `UrlPicture` text COLLATE utf8_unicode_ci NOT NULL,
  `Lat` text COLLATE utf8_unicode_ci NOT NULL,
  `Lng` text COLLATE utf8_unicode_ci NOT NULL,
  `Token` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `usertable`
--

INSERT INTO `usertable` (`id`, `ChooseType`, `Name`, `User`, `Password`, `NameShop`, `Address`, `Phone`, `UrlPicture`, `Lat`, `Lng`, `Token`) VALUES
(3, 'User', 'ລວຍ', 'f1', '1234', '', '', '', '', '', '', ''),
(4, 'Shop', 'Homphang', 'dev', '1234', 'TumToub', 'VT', '02022225555', '/flutterOne/Shop/shop10153.jpg', '18.0372175', '102.6360055', ''),
(5, 'Rider', 'Granger', 'shooting', '1234', '', '', '', '', '', '', ''),
(7, 'Shop', 'fon', 'user3', '1234', '', '', '', '', '', '', ''),
(17, 'Shop', 'Bounmy', 'boun', '12345', 'nameShop', 'address', 'phone', 'urlPicture', 'lat', 'lng', ''),
(18, 'User', 'Homphang', 'Hp', '12345', '', '', '', '', '', '', ''),
(19, 'Shop', 'ຫອມແພງ', 'homphang', '12345', '', '', '', '', '', '', ''),
(22, 'Shop', 'phaeng', 'p', '12345', 'ສັນຕາວັນ', 'ບ. ນາໂພໃຕ ມ. ໄຊທານີ ນະຄອນຫຼວງ', '02055559999', '/flutterOne/Shop/editShop45978.jpg', '18.0382681', '102.6364866', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `foodtable`
--
ALTER TABLE `foodtable`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usertable`
--
ALTER TABLE `usertable`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `foodtable`
--
ALTER TABLE `foodtable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `usertable`
--
ALTER TABLE `usertable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
