-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: May 21, 2026 at 02:05 PM
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
-- Database: `thriftanddrift`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_actions`
--

CREATE TABLE `admin_actions` (
  `id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `submission_id` int(11) DEFAULT NULL,
  `action` varchar(50) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `admin_actions`
--

INSERT INTO `admin_actions` (`id`, `admin_id`, `submission_id`, `action`, `note`, `created_at`) VALUES
(22, 1, 6485, '', 'made from real cotton imported from gujarat', '2026-05-21 05:34:34'),
(58, 5688, 87456, '', 'made from leather and imported from italy', '2026-05-19 05:36:07');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `added_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`, `user_id`, `product_id`, `added_date`) VALUES
(4, 2, 3, '2026-05-21 16:49:28'),
(5, 2, 5, '2026-05-21 17:19:24');

-- --------------------------------------------------------

--
-- Table structure for table `contact_messages`
--

CREATE TABLE `contact_messages` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `contact_messages`
--

INSERT INTO `contact_messages` (`id`, `name`, `email`, `phone`, `message`, `created_at`) VALUES
(1, 'Adwaita Joshi', 'adwaitajoshi0@gmail.com', '985-1103679', 'what a great website', '2026-05-21 02:39:12');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `total_amount` decimal(10,2) DEFAULT 0.00,
  `order_status` varchar(50) DEFAULT 'Processing',
  `payment_method` varchar(50) DEFAULT NULL,
  `delivery_type` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `total_amount`, `order_status`, `payment_method`, `delivery_type`, `created_at`) VALUES
(1, 2, 550.00, 'Processing', 'eSewa', 'Delivery', '2026-05-21 01:53:32'),
(2, 2, 550.00, 'Processing', 'eSewa', 'Delivery', '2026-05-21 09:30:44');

-- --------------------------------------------------------

--
-- Table structure for table `payouts`
--

CREATE TABLE `payouts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `submission_id` int(11) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payout_method` varchar(50) DEFAULT NULL,
  `payout_account` varchar(255) DEFAULT NULL,
  `status` varchar(50) DEFAULT 'Pending',
  `paid_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `payouts`
--

INSERT INTO `payouts` (`id`, `user_id`, `submission_id`, `amount`, `payout_method`, `payout_account`, `status`, `paid_at`, `created_at`) VALUES
(1, 101, 11, 900.00, 'esewa', '56841504552', 'Pending', '2026-05-21 11:10:50', '2026-05-21 05:29:21'),
(2, 21474, 4651, 2500.00, 'cash', '6586598456', 'Pending', '2026-05-18 11:11:50', '2026-05-21 05:29:21');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `size` varchar(10) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `condition_rating` int(11) DEFAULT NULL CHECK (`condition_rating` between 1 and 5),
  `image` varchar(255) DEFAULT NULL,
  `status` enum('available','sold') DEFAULT 'available',
  `submission_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `user_id`, `name`, `price`, `size`, `category`, `description`, `condition_rating`, `image`, `status`, `submission_id`) VALUES
(1, 5, 'luga', 500.00, 'M', 'Tops', 'Listed from seller submission #2', 4, 'images/c1.jfif', 'available', NULL),
(2, 2, 'Vintage Levis Jeans', 3500.00, 'S', 'Skirts', 'Listed from seller submission #3', 3, 'images/c1.jfif', 'available', 3),
(3, 5, 'luga', 2000.00, 'M', 'Tops', 'Listed from seller submission #2', 4, 'images/c1.jfif', 'available', 2),
(4, 5, 'demo sell', 4000.00, 'XS', 'Tops', 'Listed from seller submission #1', 5, 'images/c1.jfif', 'available', 1),
(5, 2, 'floral  skirt', 500.00, 'M', 'Skirts', 'Listed from seller submission #4', 3, 'images/seller/seller-2-1779362052515.jpg', 'available', 4);

-- --------------------------------------------------------

--
-- Table structure for table `seller_submissions`
--

CREATE TABLE `seller_submissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `item_name` varchar(150) NOT NULL,
  `category` varchar(100) NOT NULL,
  `item_condition` varchar(50) NOT NULL,
  `size` varchar(50) DEFAULT NULL,
  `estimated_price` decimal(10,2) DEFAULT NULL,
  `final_price` decimal(10,2) DEFAULT NULL,
  `dropoff_location` varchar(255) DEFAULT 'Thrift&Drift Store, Kathmandu',
  `dropoff_date` date DEFAULT NULL,
  `dropoff_time_slot` varchar(50) DEFAULT NULL,
  `payout_info` varchar(255) DEFAULT NULL,
  `status` varchar(50) DEFAULT 'Submitted',
  `admin_note` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `seller_submissions`
--

INSERT INTO `seller_submissions` (`id`, `user_id`, `item_name`, `category`, `item_condition`, `size`, `estimated_price`, `final_price`, `dropoff_location`, `dropoff_date`, `dropoff_time_slot`, `payout_info`, `status`, `admin_note`, `created_at`, `image`) VALUES
(1, 5, 'demo sell', 'Tops', 'Like New', 'XS', 3400.00, 4000.00, 'Thrift&Drift Store, Kathmandu', '2026-05-21', '10:00 AM - 12:00 PM', '2324', 'Listed', '', '2026-05-19 19:10:07', NULL),
(2, 5, 'luga', 'Tops', 'Good', 'M', 1500.00, 2000.00, 'Thrift&Drift Store, Kathmandu', '2026-05-21', '10:00 AM - 12:00 PM', '2324', 'Listed', '', '2026-05-20 09:31:53', NULL),
(3, 2, 'Vintage Levis Jeans', 'Skirts', 'New with tags', 'S', 3000.00, 3500.00, 'Thrift&Drift Store, Kathmandu', '2026-05-21', '12:00 PM - 2:00 PM', '878777', 'Listed', '', '2026-05-20 14:59:41', NULL),
(4, 2, 'floral  skirt', 'Skirts', 'New with tags', 'M', 450.00, 500.00, 'Thrift&Drift Store, Kathmandu', '2026-05-22', '2:00 PM - 4:00 PM', '3651655', 'Listed', '', '2026-05-21 11:14:12', 'images/seller/seller-2-1779362052515.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `role` enum('admin','user') DEFAULT 'user',
  `profile_pic` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `email`, `password`, `phone`, `role`, `profile_pic`) VALUES
(2, 'updated_user', 'user@gmail.com', '$2a$10$Ky.kwb3DUdwR98Fu98QFGOcQmkaI7mlcuFS73WuURHOe88a8sIhjq', NULL, 'user', NULL),
(3, 'admin', 'adwaitajoshi0@gmail.com', '$2a$10$CNRAUwoHeZgPflLNdJrZiu4jqF5PDRyQFzpOry9yGV/kr66VzX9L.', NULL, 'user', NULL),
(4, 'admin', 'admin@gmail.com', '$2a$10$1Zo1A02qk4Qxxm9GVkfC/Ov0NP2zsVH883ufwMG2SbHYuccSfcm/K', NULL, 'admin', NULL),
(5, 'seller', 'seller@gmail.com', '$2a$10$.ajeXMTaZ0PgV/BAvAE0uuf/nuQXKaMqzIf8vzgfWpW8RlCdR5HXK', NULL, 'user', NULL),
(6, 'test01', 'test01@gmail.com', '$2a$10$7nBNjNwbwXkJfpA8WeVgFu98r77QS4D6rPQWVI9GWvsO9WDR0Zt0G', NULL, 'user', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `wishlist_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `added_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_actions`
--
ALTER TABLE `admin_actions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `contact_messages`
--
ALTER TABLE `contact_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payouts`
--
ALTER TABLE `payouts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `seller_submissions`
--
ALTER TABLE `seller_submissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`wishlist_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_actions`
--
ALTER TABLE `admin_actions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `contact_messages`
--
ALTER TABLE `contact_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payouts`
--
ALTER TABLE `payouts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `seller_submissions`
--
ALTER TABLE `seller_submissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `wishlist_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `seller_submissions`
--
ALTER TABLE `seller_submissions`
  ADD CONSTRAINT `seller_submissions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `wishlist_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `wishlist_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
