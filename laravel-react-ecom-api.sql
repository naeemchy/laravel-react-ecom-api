-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 13, 2022 at 09:44 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel-react-ecom-api`
--

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_qty` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `meta_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keyword` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_descrip` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `meta_title`, `meta_keyword`, `meta_descrip`, `slug`, `name`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Moblile', '#redmi, #nakia', 'A mobile phone, cellular phone, cell phone, cellphone, handphone, hand phone or pocket phone, sometimes shortened to simply mobile, cell, or just phone', 'mobile', 'Mobile', 'A mobile phone, cellular phone, cell phone, cellphone, handphone, hand phone or pocket phone, sometimes shortened to simply mobile, cell, or just phone', 0, '2022-07-18 10:57:59', '2022-07-26 10:38:14'),
(2, 'Laptop', '#laptop', 'A laptop, laptop computer, or notebook computer is a small, portable personal computer with a screen and alphanumeric keyboard.', 'laptop', 'Laptop', 'A laptop, laptop computer, or notebook computer is a small, portable personal computer with a screen and alphanumeric keyboard.', 0, '2022-07-18 11:00:10', '2022-07-26 10:37:40'),
(4, 'Motorcycle', '#motorcycle, #riding', 'A motorcycle, often called a motorbike, bike, cycle, or trike, is a two- or three-wheeled motor vehicle. Motorcycle design varies greatly to suit a range of different purposes: long-distance travel, commuting, cruising, sport, and off-road riding.', 'motorcycle', 'Motorcycle', 'A motorcycle, often called a motorbike, bike, cycle, or trike, is a two- or three-wheeled motor vehicle. Motorcycle design varies greatly to suit a range of different purposes: long-distance travel, commuting, cruising, sport, and off-road riding.', 0, '2022-07-26 10:28:10', '2022-07-26 10:37:01'),
(5, 'men\'s-fashion', '#men\'s-fashion, #style', 'Men who just don\'t seem to care. You see ultimate style sins, ill-fitting clothing, poor color combinations, clashing patterns, a lack of attention to detail, blind trend chasing. The list goes on and on. It doesn\'t take much to break from the sea of unkempt guys out there.', 'men\'s-fashion', 'Men\'s Fashion', 'Men who just don\'t seem to care. You see ultimate style sins, ill-fitting clothing, poor color combinations, clashing patterns, a lack of attention to detail, blind trend chasing. The list goes on and on. It doesn\'t take much to break from the sea of unkempt guys out there.', 0, '2022-07-26 10:29:31', '2022-07-26 10:36:50'),
(6, 'women\'s-fashion', '#women\'s-fashion, #style', 'Fashion has the power to make us feel something; it can be an outlet for self-expression and empowerment, it can inspire ourselves and others. It can be used to convey not only the conceptions we have of ourselves, but also the image we want to portray. Fashion is so hard to put into words.', 'women\'s-fashion', 'Women\'s Fashion', 'Fashion has the power to make us feel something; it can be an outlet for self-expression and empowerment, it can inspire ourselves and others. It can be used to convey not only the conceptions we have of ourselves, but also the image we want to portray. Fashion is so hard to put into words.', 0, '2022-07-26 10:31:11', '2022-07-26 10:36:38'),
(7, 'Car\'s', '#car\'s, #riding', 'A car (or automobile) is a wheeled motor vehicle that is used for transportation. Most definitions of cars say that they run primarily on roads, seat one to eight people, have four wheels, and mainly transport people instead of goods.', 'car\'s', 'Car', 'A car (or automobile) is a wheeled motor vehicle that is used for transportation. Most definitions of cars say that they run primarily on roads, seat one to eight people, have four wheels, and mainly transport people instead of goods.', 0, '2022-07-26 10:34:02', '2022-07-26 10:36:23'),
(8, 'Sport\'s', '#sport\'s, #playing', 'A human activity involving physical exertion and skill as the primary focus of the activity, with elements of competition or social participation where rules.', 'sport\'s', 'Sport\'s', 'A human activity involving physical exertion and skill as the primary focus of the activity, with elements of competition or social participation where rules and patterns of behaviour governing the activity exist formally through organisations and is generally recognised as a sport.', 0, '2022-07-26 10:35:58', '2022-07-26 10:35:58'),
(9, 'Fruit and Vegetables', '#fruits, #vegetables', 'In botany, a fruit is the seed-bearing structure in flowering plants that is formed from the ovary after flowering. Fruits are the means by which flowering plants disseminate their seeds.', 'fruit-and-vegetables', 'Fruit and Vegetables', 'In botany, a fruit is the seed-bearing structure in flowering plants that is formed from the ovary after flowering. Fruits are the means by which flowering plants disseminate their seeds.', 0, '2022-07-26 10:40:48', '2022-07-26 10:40:48');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_07_18_162329_create_categories_table', 2),
(6, '2022_07_20_135554_create_products_table', 3),
(7, '2022_07_30_140921_create_carts_table', 4),
(8, '2022_08_11_154009_create_orders_table', 5),
(9, '2022_08_11_154545_create_orderitems_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `orderitems`
--

CREATE TABLE `orderitems` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orderitems`
--

INSERT INTO `orderitems` (`id`, `order_id`, `product_id`, `qty`, `price`, `created_at`, `updated_at`) VALUES
(1, 1, 8, 4, 60000, '2022-08-12 08:26:55', '2022-08-12 08:26:55'),
(2, 1, 7, 2, 65000, '2022-08-12 08:26:55', '2022-08-12 08:26:55'),
(3, 2, 2, 1, 75000, '2022-08-12 10:52:27', '2022-08-12 10:52:27');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `firstname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zipcode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_mode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tracking_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `remark` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `firstname`, `lastname`, `phone`, `email`, `address`, `city`, `state`, `zipcode`, `payment_id`, `payment_mode`, `tracking_no`, `status`, `remark`, `created_at`, `updated_at`) VALUES
(1, 3, 'Md Naeem', 'Uddin', '0123456789', 'naeem@gmail.com', 'Syl', 'Sylhet', 'Syl', '1234', NULL, 'COD', 'ecom1644', 0, NULL, '2022-08-12 08:26:55', '2022-08-12 08:26:55'),
(2, 3, 'Md Naeem', 'Uddin', '0123456789', 'karim@gmail.com', 'Dhaka', 'Dhaka', 'Dha', '1234', NULL, 'COD', 'ecom6383', 0, NULL, '2022-08-12 10:52:27', '2022-08-12 10:52:27');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(32, 'App\\Models\\User', 3, 'naeem@gmail.com_AdminToken', '4bce2f67c164a63fa29591e6b8e20aa4f85be993bb1ef86382ee3cf283cb58cf', '[\"server:admin\"]', '2022-08-13 13:42:15', '2022-07-26 09:40:27', '2022-08-13 13:42:15');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `meta_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keyword` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_descrip` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `selling_price` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `original_price` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featured` tinyint(4) DEFAULT 0,
  `popular` tinyint(4) DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=shown, 1=hidden',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `meta_title`, `meta_keyword`, `meta_descrip`, `slug`, `name`, `description`, `selling_price`, `original_price`, `qty`, `brand`, `image`, `featured`, `popular`, `status`, `created_at`, `updated_at`) VALUES
(2, 2, 'ASUS laptop', 'A laptop, laptop computer, or notebook computer is a small, portable personal computer with a screen and alphanumeric keyboard.', 'A laptop, laptop computer, or notebook computer is a small, portable personal computer with a screen and alphanumeric keyboard.', 'ASUS-laptop', 'ASUS Laptop', 'A laptop computer is a small personal computer. They are designed to be more portable than traditional desktop computers, with many of the same abilities. Laptops are able to be folded flat for transportation and have a built-in keyboard and touchpad.', '75000', '79000', '9', 'ASUS', 'uploads/product/1658938481.jpg', 0, 0, 0, '2022-07-20 10:17:26', '2022-08-12 10:52:27'),
(3, 1, 'samsung', 'A mobile phone, cellular phone, cell phone, cellphone, handphone, hand phone or pocket phone, sometimes shortened to simply mobile, cell, or just phone, is a portable telephone that can make and receive calls', 'A mobile phone, cellular phone, cell phone, cellphone, handphone, hand phone or pocket phone, sometimes shortened to simply mobile, cell, or just phone, is a portable telephone that can make and receive calls', 'samsung', 'Samsung', 'A mobile phone, cellular phone, cell phone, cellphone, handphone, hand phone or pocket phone, sometimes shortened to simply mobile, cell, or just phone, is a portable telephone that can make and receive calls over a radio frequency link while the user is moving within a telephone service area.', '18000', '21000', '15', 'Samsung', 'uploads/product/1658334168.jpg', 0, 0, 0, '2022-07-20 10:22:48', '2022-07-20 10:22:48'),
(4, 1, 'samsung', 'A mobile phone, cellular phone, cell phone, cellphone, handphone, hand phone or pocket phone, sometimes shortened to simply mobile, cell, or just phone, is a portable telephone that can make and receive calls', 'A mobile phone, cellular phone, cell phone, cellphone, handphone, hand phone or pocket phone, sometimes shortened to simply mobile, cell, or just phone, is a portable telephone that can make and receive calls', 'samsung', 'Samsung', 'A mobile phone, cellular phone, cell phone, cellphone, handphone, hand phone or pocket phone, sometimes shortened to simply mobile, cell, or just phone, is a portable telephone that can make and receive calls over a radio frequency link while the user is moving within a telephone service area.', '18000', '21000', '15', 'Samsung', 'uploads/product/1658334279.jpg', 0, 0, 0, '2022-07-20 10:24:39', '2022-07-20 10:24:39'),
(5, 1, 'samsung', 'A mobile phone, cellular phone, cell phone, cellphone, handphone, hand phone or pocket phone, sometimes shortened to simply mobile, cell, or just phone, is a portable telephone that can make and receive calls', 'A mobile phone, cellular phone, cell phone, cellphone, handphone, hand phone or pocket phone, sometimes shortened to simply mobile, cell, or just phone, is a portable telephone that can make and receive calls', 'samsung', 'Samsung', 'A mobile phone, cellular phone, cell phone, cellphone, handphone, hand phone or pocket phone, sometimes shortened to simply mobile, cell, or just phone, is a portable telephone that can make and receive calls over a radio frequency link while the user is moving within a telephone service area.', '18000', '21000', '15', 'Samsung', 'uploads/product/1658334323.jpg', 0, 0, 0, '2022-07-20 10:25:23', '2022-07-24 10:02:35'),
(6, 1, 'samsung', 'A mobile phone, cellular phone, cell phone, cellphone, handphone, hand phone or pocket phone, sometimes shortened to simply mobile, cell, or just phone, is a portable telephone that can make and receive calls', 'A mobile phone, cellular phone, cell phone, cellphone, handphone, hand phone or pocket phone, sometimes shortened to simply mobile, cell, or just phone, is a portable telephone that can make and receive calls', 'samsung', 'Samsung', 'A mobile phone, cellular phone, cell phone, cellphone, handphone, hand phone or pocket phone, sometimes shortened to simply mobile, cell, or just phone, is a portable telephone that can make and receive calls over a radio frequency link while the user is moving within a telephone service area.', '18000', '21000', '15', 'Samsung', 'uploads/product/1658334369.jpg', 0, 0, 0, '2022-07-20 10:26:09', '2022-07-20 10:26:09'),
(7, 2, 'sony', 'A laptop, laptop computer, or notebook computer is a small, portable personal computer with a screen and alphanumeric keyboard', 'A laptop, laptop computer, or notebook computer is a small, portable personal computer with a screen and alphanumeric keyboard', 'sony', 'Sony Laptop', 'A laptop computer is a small personal computer. They are designed to be more portable than traditional desktop computers, with many of the same abilities. Laptops are able to be folded flat for transportation and have a built-in keyboard and touchpad.', '65000', '66000', '16', 'Sony', 'uploads/product/1658565945.jpg', 0, 0, 0, '2022-07-20 10:28:16', '2022-08-12 08:26:55'),
(8, 2, 'dell', 'A laptop, laptop computer, or notebook computer is a small, portable personal computer with a screen and alphanumeric keyboard', 'A laptop, laptop computer, or notebook computer is a small, portable personal computer with a screen and alphanumeric keyboard', 'dell', 'Dell Laptop', 'A laptop computer is a small personal computer. They are designed to be more portable than traditional desktop computers, with many of the same abilities. Laptops are able to be folded flat for transportation and have a built-in keyboard and touchpad.', '60000', '62000', '8', 'Dell', 'uploads/product/1658334623.jpg', 0, 0, 0, '2022-07-20 10:30:23', '2022-08-12 08:26:55'),
(9, 2, 'apple', 'A laptop, laptop computer, or notebook computer is a small, portable personal computer with a screen and alphanumeric keyboard .', 'A laptop, laptop computer, or notebook computer is a small, portable personal computer with a screen and alphanumeric keyboard.', 'apple', 'Apple Laptop', 'A laptop computer is a small personal computer. They are designed to be more portable than traditional desktop computers, with many of the same abilities. Laptops are able to be folded flat for transportation and have a built-in keyboard and touchpad.', '100000', '120000', '25', 'Apple', 'uploads/product/1658938352.jpg', 1, 0, 0, '2022-07-20 10:32:01', '2022-07-27 10:12:32');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_as` int(11) DEFAULT 0 COMMENT '0=user, 1=admin',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role_as`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'Md Naeem Uddin', 'naeem.u.md@gmail.com', NULL, '$2y$10$1CvC6n3/Ko.YbDsi4m0OMuV8n07saTZHAnFSEkH7MdLGJUJpI.jhS', 0, NULL, '2022-07-16 11:53:59', '2022-07-16 11:53:59'),
(3, 'Md Naeem Uddin', 'naeem@gmail.com', NULL, '$2y$10$uNLs1xGf8EC1eEoVDBAHSuyNKF8e35xZ6G/a3gFMKiP8Inl3bnRke', 1, NULL, '2022-07-16 11:57:24', '2022-07-16 11:57:24');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orderitems`
--
ALTER TABLE `orderitems`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `orderitems`
--
ALTER TABLE `orderitems`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
