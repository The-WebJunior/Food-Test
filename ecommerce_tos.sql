-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 01, 2024 at 10:50 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce_tos`
--

-- --------------------------------------------------------

--
-- Table structure for table `currency`
--

CREATE TABLE `currency` (
  `id_currency` int(11) NOT NULL,
  `currency_name` varchar(22) NOT NULL,
  `iso_code` varchar(22) NOT NULL,
  `conversion_rate` int(11) NOT NULL,
  `active` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id_customer` int(11) NOT NULL,
  `fname` varchar(22) NOT NULL,
  `lname` varchar(22) NOT NULL,
  `email` varchar(22) NOT NULL,
  `phone` varchar(22) NOT NULL,
  `createdAt` date NOT NULL,
  `updatedAt` date NOT NULL,
  `dob` date NOT NULL,
  `acc_state` int(11) NOT NULL,
  `password` varchar(34) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id_customer`, `fname`, `lname`, `email`, `phone`, `createdAt`, `updatedAt`, `dob`, `acc_state`, `password`) VALUES
(1, 'deidine', 'cheigeur', 'deidinecheigeur@gmail.', '1234567890', '2023-12-26', '2023-12-26', '2005-12-21', 0, '$2a$10$GxhuSpvxHGZMD5sFajsLPulyHg/'),
(2, 'deidine', 'cheigeur', 'deidinecheigeur1@gmail', '1234567890', '2023-12-26', '2023-12-26', '2005-12-20', 0, '$2a$10$D52iiI/wJrGS1Ws3v1Nwze4Gr6Z'),
(3, 'deidine', 'cheigeur', 'deidine@gmail.com', '1234567890', '2023-12-26', '2023-12-26', '2005-12-20', 1, '$2a$10$u1AXhwU/bKRtqc8.3VajCeoAs.q'),
(4, 'depart', 'cheigeur', 'sidi@gmail.com', '1234567', '0000-00-00', '2023-12-31', '2005-12-31', 1, '$2a$10$.z94OGwG8WqD9Sx/Gy2bYOvfs5A'),
(5, 'depart', 'sidi', 'sidi2@gmail.com', '1234567', '2023-12-31', '2023-12-31', '2005-12-31', 1, '$2a$10$9rj8NGNsenXwXuT5YAKaweqxzCT'),
(6, 'depart', 'sidi', 'sidi3@gmail.com', '1234567', '2023-12-31', '2023-12-31', '2005-12-06', 0, '$2a$10$DmLKgRB.rij9fjGmox9j7.LlG94'),
(7, 'depart', 'sidi', 'sidi4@gmail.com', '1234567', '2024-01-01', '2024-01-01', '2006-01-01', 1, 'deidine');

-- --------------------------------------------------------

--
-- Table structure for table `customer_addresses`
--

CREATE TABLE `customer_addresses` (
  `id` int(11) NOT NULL,
  `id_customer_fk` int(11) NOT NULL,
  `additional_phone` int(11) NOT NULL,
  `address` varchar(22) NOT NULL,
  `city` varchar(22) NOT NULL,
  `region` varchar(22) NOT NULL,
  `additional_info` varchar(22) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_server_settings`
--

CREATE TABLE `email_server_settings` (
  `id` int(11) NOT NULL,
  `main_domain` varchar(22) NOT NULL,
  `stmp_username` varchar(33) NOT NULL,
  `smtp_password` varchar(33) NOT NULL,
  `stmp_server` varchar(22) NOT NULL,
  `port` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id_order` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `id_product_cat_fk` int(11) NOT NULL,
  `id_product_sub_cat` int(11) NOT NULL,
  `product_name` varchar(22) NOT NULL,
  `id_supplier_fk` int(11) NOT NULL,
  `product_description` varchar(122) NOT NULL,
  `image` varchar(55) NOT NULL,
  `id_customer_fk` int(11) NOT NULL,
  `product_price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `createdAt` date NOT NULL,
  `updatedAt` date NOT NULL,
  `order_state` varchar(22) NOT NULL,
  `order_reference` varchar(22) NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `id_product_fk` int(11) NOT NULL,
  `id_payment_fk` int(11) NOT NULL,
  `order_reference` varchar(22) NOT NULL,
  `order_state` varchar(22) NOT NULL,
  `id_order_fk` int(11) NOT NULL,
  `id_order_dets` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_modes`
--

CREATE TABLE `payment_modes` (
  `id_payment` int(11) NOT NULL,
  `payment_name` varchar(56) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id_product` int(11) NOT NULL,
  `product_name` varchar(22) NOT NULL,
  `product_price` double NOT NULL,
  `quantity` double NOT NULL,
  `product_description` varchar(400) NOT NULL,
  `image` varchar(60) NOT NULL,
  `images` varchar(60) NOT NULL,
  `status` varchar(21) NOT NULL,
  `id_product_cat_fk` int(11) NOT NULL,
  `id_product_sub_cat_fk` int(11) NOT NULL,
  `id_supplier_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id_product`, `product_name`, `product_price`, `quantity`, `product_description`, `image`, `images`, `status`, `id_product_cat_fk`, `id_product_sub_cat_fk`, `id_supplier_fk`) VALUES
(1, 'boto', 11, 0, 'wwew', 'maungano-menu-1704091161029.jpeg', '', '1', 1, 1, 1),
(2, 'boto', 11, 0, 'wws', 'maungano-menu-1704091616646.jpeg', '', 'null', 1, 1, 1),
(3, 'botosss', 11, 0, 'sddsdsddddddddddd', 'maungano-menu-1704091666628.jpeg', '', 'null', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_category`
--

CREATE TABLE `product_category` (
  `id_product_cat` int(11) NOT NULL,
  `prod_category_description` varchar(500) NOT NULL,
  `cat_status` varchar(12) NOT NULL,
  `prod_category_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_category`
--

INSERT INTO `product_category` (`id_product_cat`, `prod_category_description`, `cat_status`, `prod_category_name`) VALUES
(1, 'hi', '1', 'booro');

-- --------------------------------------------------------

--
-- Table structure for table `product_sub_category`
--

CREATE TABLE `product_sub_category` (
  `id_product_sub_cat` int(11) NOT NULL,
  `sub_name` varchar(22) NOT NULL,
  `id_product_cat_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_sub_category`
--

INSERT INTO `product_sub_category` (`id_product_sub_cat`, `sub_name`, `id_product_cat_fk`) VALUES
(1, 'zbda', 1);

-- --------------------------------------------------------

--
-- Table structure for table `social_settings`
--

CREATE TABLE `social_settings` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `store_settings`
--

CREATE TABLE `store_settings` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id_supplier` int(11) NOT NULL,
  `supplier_name` varchar(23) NOT NULL,
  `supplier_description` varchar(222) NOT NULL,
  `supplier_image` varchar(43) NOT NULL,
  `status` varchar(9) NOT NULL,
  `openTime` varchar(19) NOT NULL,
  `closeTime` varchar(19) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id_supplier`, `supplier_name`, `supplier_description`, `supplier_image`, `status`, `openTime`, `closeTime`) VALUES
(1, 'deidine', 'hi evry one', 'maungano-rest-1704089271146.jpeg', '1', '06:08', '08:07');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers_address`
--

CREATE TABLE `suppliers_address` (
  `id_suppliers_address` int(11) NOT NULL,
  `email` varchar(22) NOT NULL,
  `address` varchar(21) NOT NULL,
  `city` varchar(21) NOT NULL,
  `country` varchar(22) NOT NULL,
  `phone` varchar(22) NOT NULL,
  `zip` varchar(22) NOT NULL,
  `id_supplier_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `suppliers_address`
--

INSERT INTO `suppliers_address` (`id_suppliers_address`, `email`, `address`, `city`, `country`, `phone`, `zip`, `id_supplier_fk`) VALUES
(1, 'deidine@gmail.com', 'nktt', 'atar', 'Mauritania', '49619609', '122', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `fname` varchar(22) NOT NULL,
  `lname` varchar(22) NOT NULL,
  `username` varchar(40) NOT NULL,
  `email` varchar(55) NOT NULL,
  `roles` varchar(15) NOT NULL,
  `status` varchar(12) NOT NULL,
  `createdAt` date NOT NULL,
  `updatedAt` date NOT NULL,
  `password` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `fname`, `lname`, `username`, `email`, `roles`, `status`, `createdAt`, `updatedAt`, `password`) VALUES
(1, 'deidine', 'ccheigeur', 'deidine', 'deidinecheigeur@gmail.com', 'admin', '1', '0000-00-00', '0000-00-00', 'deidine');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`id_currency`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id_customer`);

--
-- Indexes for table `customer_addresses`
--
ALTER TABLE `customer_addresses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_customer_fk` (`id_customer_fk`);

--
-- Indexes for table `email_server_settings`
--
ALTER TABLE `email_server_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id_order`),
  ADD UNIQUE KEY `id_product` (`id_product`),
  ADD UNIQUE KEY `id_product_cat_fk` (`id_product_cat_fk`),
  ADD UNIQUE KEY `id_product_sub_cat` (`id_product_sub_cat`),
  ADD UNIQUE KEY `id_supplier_fk` (`id_supplier_fk`),
  ADD KEY `id_customer_fk` (`id_customer_fk`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_order_dets` (`id_order_dets`),
  ADD KEY `id_order_fk` (`id_order_fk`),
  ADD KEY `id_payment_fk` (`id_payment_fk`),
  ADD KEY `id_product_fk` (`id_product_fk`);

--
-- Indexes for table `payment_modes`
--
ALTER TABLE `payment_modes`
  ADD PRIMARY KEY (`id_payment`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id_product`),
  ADD KEY `id_product_cat_fk` (`id_product_cat_fk`),
  ADD KEY `id_product_sub_cat_fk` (`id_product_sub_cat_fk`),
  ADD KEY `id_supplier_fk` (`id_supplier_fk`);

--
-- Indexes for table `product_category`
--
ALTER TABLE `product_category`
  ADD PRIMARY KEY (`id_product_cat`);

--
-- Indexes for table `product_sub_category`
--
ALTER TABLE `product_sub_category`
  ADD PRIMARY KEY (`id_product_sub_cat`),
  ADD UNIQUE KEY `id_product_cat_fk` (`id_product_cat_fk`);

--
-- Indexes for table `social_settings`
--
ALTER TABLE `social_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `store_settings`
--
ALTER TABLE `store_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id_supplier`);

--
-- Indexes for table `suppliers_address`
--
ALTER TABLE `suppliers_address`
  ADD PRIMARY KEY (`id_suppliers_address`),
  ADD KEY `id_supplier_fk` (`id_supplier_fk`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `currency`
--
ALTER TABLE `currency`
  MODIFY `id_currency` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id_customer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `customer_addresses`
--
ALTER TABLE `customer_addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_server_settings`
--
ALTER TABLE `email_server_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id_order` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_modes`
--
ALTER TABLE `payment_modes`
  MODIFY `id_payment` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id_product` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product_category`
--
ALTER TABLE `product_category`
  MODIFY `id_product_cat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product_sub_category`
--
ALTER TABLE `product_sub_category`
  MODIFY `id_product_sub_cat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `social_settings`
--
ALTER TABLE `social_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id_supplier` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `suppliers_address`
--
ALTER TABLE `suppliers_address`
  MODIFY `id_suppliers_address` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
