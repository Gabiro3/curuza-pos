-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 10, 2025 at 02:31 PM
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
-- Database: `store_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_tbl`
--
-- Create the database if it doesn't exist
CREATE DATABASE IF NOT EXISTS store_db;

-- Use the store_db database
USE store_db;

CREATE TABLE `admin_tbl` (
  `admin_id` int(11) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `role` varchar(50) NOT NULL,
  `admin_username` varchar(50) NOT NULL,
  `admin_password` varchar(255) NOT NULL,
  `status` varchar(20) NOT NULL,
  `admin_img` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_tbl`
--

INSERT INTO `admin_tbl` (`admin_id`, `fullname`, `role`, `admin_username`, `admin_password`, `status`, `admin_img`) VALUES
(1, 'John Dane', 'Administrator', 'admin', 'admin', 'active', 0x53637265656e73686f7420323032352d30312d3233203039323132322e706e67);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(11) NOT NULL,
  `cat_name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `status` varchar(20) DEFAULT 'active',
  `date_added` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_name`, `description`, `status`, `date_added`) VALUES
(1, 'Antibiotics', NULL, 'active', '2025-01-31 10:33:41'),
(2, 'Antihistamines', NULL, 'active', '2025-01-31 10:33:41'),
(3, 'Antacids and Acid Reducers', NULL, 'active', '2025-01-31 10:33:41'),
(4, 'Cough, Cold, and Flu Medications', NULL, 'active', '2025-01-31 10:33:41'),
(5, 'Antidepressants and Anti-anxiety Medications', NULL, 'active', '2025-01-31 10:33:41');

-- --------------------------------------------------------

--
-- Table structure for table `credit_log`
--

CREATE TABLE `credit_log` (
  `id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `action` varchar(255) NOT NULL,
  `log_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `history_log`
--

CREATE TABLE `history_log` (
  `log_id` int(11) NOT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `action` varchar(255) NOT NULL,
  `log_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `emp_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `history_log`
--

INSERT INTO `history_log` (`log_id`, `admin_id`, `action`, `log_date`, `emp_id`) VALUES
(2, 1, 'has logged into the system at', '2025-01-30 19:45:16', 1),
(3, 1, 'has logged into the system at', '2025-01-31 10:26:27', 1),
(4, 1, 'has logged into the system at', '2025-01-31 10:26:28', 1),
(5, 1, 'has logged into the system at', '2025-02-01 08:02:01', 1),
(6, 1, 'added 10 quantities of Notebooks to store', '2025-02-01 08:27:14', 1),
(7, 1, 'has logged into the system at', '2025-02-01 14:46:38', 1),
(8, 1, 'has logged out of the system at ', '2025-02-01 15:04:56', 1),
(9, 1, 'has logged into the system at', '2025-02-02 09:21:00', 1),
(10, 1, 'has logged out of the system at ', '2025-02-02 09:57:29', 1),
(11, 1, 'has logged into the system at', '2025-02-03 12:20:50', 1),
(12, 1, 'has logged into the system at', '2025-02-03 19:26:05', 1),
(13, 1, 'added 10 quantities of Blue pens to store', '2025-02-03 19:29:07', 1),
(14, 1, 'added 20 quantities of Blue pens into the warehouse', '2025-02-03 19:29:45', 1),
(15, 1, 'added 1 quantities of Blue pens into the warehouse', '2025-02-03 19:39:44', 1),
(16, 1, 'added 1 quantities of Blue pens into the warehouse', '2025-02-03 19:42:35', 1),
(17, 1, 'added 1 quantities of Blue pens into the warehouse', '2025-02-03 19:43:30', 1),
(18, 1, 'has logged into the system at', '2025-02-26 12:11:05', 1),
(19, 1, 'has logged out of the system at ', '2025-02-26 12:17:58', 1),
(20, 1, 'has logged into the system at', '2025-02-26 12:18:04', 1),
(21, 1, 'has logged out of the system at ', '2025-02-26 12:18:41', 1),
(22, 1, 'has logged into the system at', '2025-02-26 12:18:50', 1),
(23, 1, 'has logged out of the system at ', '2025-02-26 12:20:00', 1),
(24, 1, 'has logged into the system at', '2025-02-26 12:21:03', 1),
(25, 1, 'has logged into the system at', '2025-06-17 10:34:49', 1),
(26, 1, 'has logged out of the system at ', '2025-06-17 10:37:27', 1),
(27, 1, 'has logged into the system at', '2025-06-18 08:32:54', 1),
(28, 1, 'has logged out of the system at ', '2025-06-18 08:42:42', 1),
(29, 1, 'has logged into the system at', '2025-06-18 08:49:54', 1),
(30, 1, 'has logged out of the system at ', '2025-06-18 08:57:50', 1),
(31, 1, 'has logged into the system at', '2025-07-06 09:27:29', 1),
(32, 1, 'has logged out of the system at ', '2025-07-06 09:57:25', 1),
(35, NULL, 'has logged into the system at', '2025-07-06 10:20:19', 3),
(36, 1, 'has logged into the system at', '2025-07-07 04:22:05', NULL),
(37, 1, 'has logged out of the system at ', '2025-07-07 04:22:13', NULL),
(38, NULL, 'has logged into the system at', '2025-07-07 04:25:07', 3),
(39, NULL, 'has logged out of the system at ', '2025-07-07 04:43:46', 3),
(40, 1, 'has logged into the system at', '2025-07-07 05:15:57', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_tbl`
--

CREATE TABLE `product_tbl` (
  `prod_id` int(11) NOT NULL,
  `prod_name` varchar(100) NOT NULL,
  `prod_price` decimal(10,2) NOT NULL,
  `prod_qty` int(11) NOT NULL DEFAULT 0,
  `expiry_date` date DEFAULT NULL,
  `reorder` int(11) DEFAULT 10,
  `cat_id` int(11) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'active',
  `supplier_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `prod_status` varchar(20) DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_tbl`
--

INSERT INTO `product_tbl` (`prod_id`, `prod_name`, `prod_price`, `prod_qty`, `expiry_date`, `reorder`, `cat_id`, `status`, `supplier_id`, `brand_id`, `prod_status`) VALUES
(1, 'Notebooks', 12000.00, 7, '2025-03-07', 12000, 4, 'active', 2, 1, 'Active'),
(2, 'Blue pens', 1300.00, 7, '2025-02-04', 1300, 4, 'active', 3, 1, 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_brand`
--

CREATE TABLE `tbl_brand` (
  `brand_id` int(11) NOT NULL,
  `brand_name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `status` varchar(20) DEFAULT 'active',
  `date_added` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_brand`
--

INSERT INTO `tbl_brand` (`brand_id`, `brand_name`, `description`, `status`, `date_added`) VALUES
(1, 'Nike', NULL, 'active', '2025-01-31 10:44:45');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_creditors`
--

CREATE TABLE `tbl_creditors` (
  `creditor_id` int(11) NOT NULL,
  `cust_name` varchar(100) NOT NULL,
  `contact_info` varchar(100) DEFAULT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `amount_paid` decimal(10,2) DEFAULT 0.00,
  `balance` decimal(10,2) DEFAULT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_payment_date` date DEFAULT NULL,
  `status` varchar(20) DEFAULT 'unpaid',
  `emp_id` int(11) DEFAULT NULL,
  `qty` int(11) NOT NULL DEFAULT 0,
  `payment_period` varchar(50) NOT NULL DEFAULT 'monthly',
  `date_taken` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_credit_payments`
--

CREATE TABLE `tbl_credit_payments` (
  `payment_id` int(11) NOT NULL,
  `creditor_id` int(11) DEFAULT NULL,
  `amount_paid` decimal(10,2) NOT NULL,
  `payment_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `emp_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_employees`
--

CREATE TABLE `tbl_employees` (
  `emp_id` int(11) NOT NULL,
  `emp_username` varchar(50) NOT NULL,
  `emp_password` varchar(255) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `role` text NOT NULL,
  `status` varchar(20) DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_employees`
--

INSERT INTO `tbl_employees` (`emp_id`, `emp_username`, `emp_password`, `fullname`, `role`, `status`, `created_at`) VALUES
(1, 'Karangwa Joseph', 'admin', 'Karangwa', 'Pharmacist', 'active', '2025-01-30 19:45:09'),
(2, 'Jane Mutoni', 'Sales Associate', 'Jane', 'Nurse', 'active', '2025-01-30 19:45:09'),
(3, 'Jorn', 'admin', 'John', 'Pharmacist', 'active', '2025-01-30 19:45:09');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_expenses`
--

CREATE TABLE `tbl_expenses` (
  `expense_id` int(11) NOT NULL,
  `expense_name` varchar(100) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `description` text DEFAULT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp(),
  `added_by` int(11) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'active',
  `expense_cat_id` int(11) DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_expenses`
--

INSERT INTO `tbl_expenses` (`expense_id`, `expense_name`, `amount`, `description`, `date_added`, `added_by`, `status`, `expense_cat_id`, `emp_id`) VALUES
(1, '', 120000.00, NULL, '2025-02-02 09:52:09', NULL, 'active', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_expense_cat`
--

CREATE TABLE `tbl_expense_cat` (
  `expense_cat_id` int(11) NOT NULL,
  `expense_cat_name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `status` varchar(20) DEFAULT 'active',
  `date_added` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_expense_cat`
--

INSERT INTO `tbl_expense_cat` (`expense_cat_id`, `expense_cat_name`, `description`, `status`, `date_added`) VALUES
(1, 'Utilities', 'Electricity, water, internet, etc.', 'active', '2025-01-31 10:54:04'),
(2, 'Rent', 'Shop/warehouse rent', 'active', '2025-01-31 10:54:04'),
(3, 'Salaries', 'Employee salaries and wages', 'active', '2025-01-31 10:54:04'),
(4, 'Transportation', 'Delivery and transportation costs', 'active', '2025-01-31 10:54:04'),
(5, 'Maintenance', 'Equipment and building maintenance', 'active', '2025-01-31 10:54:04'),
(6, 'Office Supplies', 'Stationery and office materials', 'active', '2025-01-31 10:54:04'),
(7, 'Marketing', 'Advertising and promotion', 'active', '2025-01-31 10:54:04'),
(8, 'Insurance', 'Business insurance costs', 'active', '2025-01-31 10:54:04'),
(9, 'Miscellaneous', 'Other expenses', 'active', '2025-01-31 10:54:04');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_payment`
--

CREATE TABLE `tbl_payment` (
  `payment_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `payment` decimal(10,2) NOT NULL,
  `payment_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `payment_for` varchar(255) NOT NULL,
  `due` decimal(10,2) NOT NULL,
  `status` enum('paid','unpaid','partial') NOT NULL,
  `sales_id` int(11) NOT NULL,
  `emp_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_profit`
--

CREATE TABLE `tbl_profit` (
  `profit_id` int(11) NOT NULL,
  `net_sales` decimal(15,2) NOT NULL,
  `cogs` decimal(15,2) NOT NULL,
  `expenses` decimal(15,2) NOT NULL,
  `gross_profit` decimal(15,2) NOT NULL,
  `profit_date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sales`
--

CREATE TABLE `tbl_sales` (
  `sale_id` int(11) NOT NULL,
  `invoice_no` varchar(50) DEFAULT NULL,
  `customer_name` varchar(100) DEFAULT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `discount` decimal(10,2) DEFAULT 0.00,
  `amount_due` decimal(10,2) DEFAULT NULL,
  `cash_tendered` decimal(10,2) DEFAULT NULL,
  `change` decimal(10,2) DEFAULT NULL,
  `payment_type` varchar(50) DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `sale_date` date DEFAULT NULL,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp(),
  `modeofpayment` varchar(50) DEFAULT 'Cash',
  `admin_id` int(11) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `cash_change` decimal(10,2) DEFAULT NULL,
  `buyer_name` varchar(100) DEFAULT NULL,
  `buyer_phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_sales`
--

INSERT INTO `tbl_sales` (`sale_id`, `invoice_no`, `customer_name`, `total_amount`, `discount`, `amount_due`, `cash_tendered`, `change`, `payment_type`, `emp_id`, `sale_date`, `date_added`, `modeofpayment`, `admin_id`, `total`, `cash_change`, `buyer_name`, `buyer_phone`) VALUES
(10, NULL, NULL, 0.00, 1000.00, 11000.00, 11000.00, NULL, NULL, NULL, NULL, '2025-02-01 08:21:16', 'Momo', 1, 10000.00, 0.00, NULL, NULL),
(12, NULL, NULL, 0.00, 0.00, 12000.00, 12000.00, NULL, NULL, NULL, NULL, '2025-02-03 19:26:43', 'Cash', 1, 12000.00, 0.00, NULL, NULL),
(13, NULL, NULL, 0.00, 0.00, 1300.00, 1300.00, NULL, NULL, NULL, NULL, '2025-02-03 19:37:14', 'Cash', 1, 1300.00, 0.00, NULL, NULL),
(14, NULL, NULL, 0.00, 0.00, 2600.00, 2800.00, NULL, NULL, NULL, NULL, '2025-07-06 09:53:00', 'Momo', 1, 2600.00, 200.00, 'Gabiro', '0781255340');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sales_details`
--

CREATE TABLE `tbl_sales_details` (
  `sale_detail_id` int(11) NOT NULL,
  `prod_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `sales_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_sales_details`
--

INSERT INTO `tbl_sales_details` (`sale_detail_id`, `prod_id`, `qty`, `price`, `sales_id`) VALUES
(1, 1, 1, 12000.00, 10),
(3, 1, 1, 12000.00, 12),
(4, 2, 1, 1300.00, 13),
(5, 2, 2, 1300.00, 14);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_shop_details`
--

CREATE TABLE `tbl_shop_details` (
  `shop_id` int(11) NOT NULL,
  `shop_name` varchar(100) NOT NULL,
  `address` text DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `tax_no` varchar(50) DEFAULT NULL,
  `logo_path` varchar(255) DEFAULT NULL,
  `currency` varchar(10) DEFAULT '₵',
  `date_added` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_shop_details`
--

INSERT INTO `tbl_shop_details` (`shop_id`, `shop_name`, `address`, `phone_number`, `email`, `website`, `tax_no`, `logo_path`, `currency`, `date_added`, `last_updated`) VALUES
(1, 'Martin hardware', '123 Shop Location, City, Country', '+250781255340', 'martin@gmail.com', 'https://martinhardware.rw', '26162617261', NULL, 'Rwf', '2025-01-31 10:47:32', '2025-07-06 09:40:06');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_stockin`
--

CREATE TABLE `tbl_stockin` (
  `stockin_id` int(11) NOT NULL,
  `prod_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `cost_price` decimal(10,2) NOT NULL,
  `stockin_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_stockin`
--

INSERT INTO `tbl_stockin` (`stockin_id`, `prod_id`, `qty`, `cost_price`, `stockin_date`) VALUES
(1, 1, 10, 12000.00, '2025-02-01 08:27:14'),
(2, 2, 10, 1300.00, '2025-02-03 19:29:07');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_suppliers`
--

CREATE TABLE `tbl_suppliers` (
  `sup_id` int(11) NOT NULL,
  `sup_name` varchar(100) NOT NULL,
  `contact_person` varchar(100) DEFAULT NULL,
  `contact_number` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `status` varchar(20) DEFAULT 'active',
  `date_added` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `sup_loc` varchar(255) DEFAULT NULL,
  `sup_phone` varchar(20) DEFAULT NULL,
  `sup_email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_suppliers`
--

INSERT INTO `tbl_suppliers` (`sup_id`, `sup_name`, `contact_person`, `contact_number`, `email`, `address`, `status`, `date_added`, `last_updated`, `sup_loc`, `sup_phone`, `sup_email`) VALUES
(1, 'ABC Suppliers', 'John Doe', '+233123456789', 'john@abcsuppliers.com', '123 Main St, Accra', 'active', '2025-01-31 10:36:28', '2025-01-31 10:36:28', NULL, NULL, NULL),
(2, 'XYZ Distribution', 'Jane Smith', '+233987654321', 'jane@xyzdist.com', '456 Market Rd, Kumasi', 'active', '2025-01-31 10:36:28', '2025-01-31 10:36:28', NULL, NULL, NULL),
(3, 'ABC Suppliers', 'John Doe', NULL, NULL, NULL, 'active', '2025-01-31 10:44:27', '2025-01-31 10:44:27', '123 Main St, Accra', '+233123456789', 'john@abcsuppliers.com'),
(4, 'XYZ Distribution', 'Jane Smith', NULL, NULL, NULL, 'active', '2025-01-31 10:44:27', '2025-01-31 10:44:27', '456 Market Rd, Kumasi', '+233987654321', 'jane@xyzdist.com');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_warehouse`
--

CREATE TABLE `tbl_warehouse` (
  `warehouse_id` int(11) NOT NULL,
  `prod_id` int(11) NOT NULL,
  `prod_qty` int(11) NOT NULL DEFAULT 0,
  `date_added` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` varchar(20) DEFAULT 'active',
  `emp_id` int(11) DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `warehse_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_warehouse`
--

INSERT INTO `tbl_warehouse` (`warehouse_id`, `prod_id`, `prod_qty`, `date_added`, `last_updated`, `status`, `emp_id`, `expiry_date`, `warehse_date`) VALUES
(1, 2, 1, '2025-02-03 19:43:30', '2025-02-03 19:43:30', 'active', NULL, '0000-00-00', '2025-02-03');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_warehouse_transactions`
--

CREATE TABLE `tbl_warehouse_transactions` (
  `transaction_id` int(11) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `prod_id` int(11) DEFAULT NULL,
  `transaction_type` enum('IN','OUT') NOT NULL,
  `quantity` int(11) NOT NULL,
  `transaction_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `emp_id` int(11) DEFAULT NULL,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_warehse_prod_moved`
--

CREATE TABLE `tbl_warehse_prod_moved` (
  `prod_moved_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `prod_id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `product_qty` int(11) NOT NULL DEFAULT 0,
  `date_moved` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `temp_trans`
--

CREATE TABLE `temp_trans` (
  `temp_trans_id` int(11) NOT NULL,
  `prod_id` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `temp_trans_cred`
--

CREATE TABLE `temp_trans_cred` (
  `temp_trans_cred_id` int(11) NOT NULL,
  `prod_id` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_tbl`
--
ALTER TABLE `admin_tbl`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `admin_username` (`admin_username`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`),
  ADD KEY `cat_name` (`cat_name`);

--
-- Indexes for table `credit_log`
--
ALTER TABLE `credit_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `emp_id` (`emp_id`);

--
-- Indexes for table `history_log`
--
ALTER TABLE `history_log`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `emp_id` (`admin_id`),
  ADD KEY `fk_history_emp` (`emp_id`);

--
-- Indexes for table `product_tbl`
--
ALTER TABLE `product_tbl`
  ADD PRIMARY KEY (`prod_id`),
  ADD KEY `prod_name` (`prod_name`),
  ADD KEY `fk_product_category` (`cat_id`),
  ADD KEY `fk_product_supplier` (`supplier_id`),
  ADD KEY `fk_product_brand` (`brand_id`);

--
-- Indexes for table `tbl_brand`
--
ALTER TABLE `tbl_brand`
  ADD PRIMARY KEY (`brand_id`),
  ADD KEY `brand_name` (`brand_name`);

--
-- Indexes for table `tbl_creditors`
--
ALTER TABLE `tbl_creditors`
  ADD PRIMARY KEY (`creditor_id`),
  ADD KEY `sale_id` (`sale_id`),
  ADD KEY `emp_id` (`emp_id`);

--
-- Indexes for table `tbl_credit_payments`
--
ALTER TABLE `tbl_credit_payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `creditor_id` (`creditor_id`),
  ADD KEY `emp_id` (`emp_id`);

--
-- Indexes for table `tbl_employees`
--
ALTER TABLE `tbl_employees`
  ADD PRIMARY KEY (`emp_id`),
  ADD UNIQUE KEY `emp_username` (`emp_username`);

--
-- Indexes for table `tbl_expenses`
--
ALTER TABLE `tbl_expenses`
  ADD PRIMARY KEY (`expense_id`),
  ADD KEY `added_by` (`added_by`),
  ADD KEY `expense_cat_id` (`expense_cat_id`),
  ADD KEY `fk_expenses_emp` (`emp_id`);

--
-- Indexes for table `tbl_expense_cat`
--
ALTER TABLE `tbl_expense_cat`
  ADD PRIMARY KEY (`expense_cat_id`),
  ADD KEY `expense_cat_name` (`expense_cat_name`);

--
-- Indexes for table `tbl_payment`
--
ALTER TABLE `tbl_payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `admin_id` (`admin_id`),
  ADD KEY `sales_id` (`sales_id`),
  ADD KEY `emp_id` (`emp_id`) USING BTREE;

--
-- Indexes for table `tbl_profit`
--
ALTER TABLE `tbl_profit`
  ADD PRIMARY KEY (`profit_id`);

--
-- Indexes for table `tbl_sales`
--
ALTER TABLE `tbl_sales`
  ADD PRIMARY KEY (`sale_id`),
  ADD KEY `fk_admin_id` (`admin_id`),
  ADD KEY `emp_id` (`emp_id`) USING BTREE;

--
-- Indexes for table `tbl_sales_details`
--
ALTER TABLE `tbl_sales_details`
  ADD PRIMARY KEY (`sale_detail_id`),
  ADD KEY `prod_id` (`prod_id`),
  ADD KEY `sales_id` (`sales_id`);

--
-- Indexes for table `tbl_shop_details`
--
ALTER TABLE `tbl_shop_details`
  ADD PRIMARY KEY (`shop_id`);

--
-- Indexes for table `tbl_stockin`
--
ALTER TABLE `tbl_stockin`
  ADD PRIMARY KEY (`stockin_id`),
  ADD KEY `fk_stockin_product` (`prod_id`);

--
-- Indexes for table `tbl_suppliers`
--
ALTER TABLE `tbl_suppliers`
  ADD PRIMARY KEY (`sup_id`),
  ADD KEY `sup_name` (`sup_name`),
  ADD KEY `email` (`email`),
  ADD KEY `sup_name_2` (`sup_name`),
  ADD KEY `sup_email` (`sup_email`),
  ADD KEY `sup_phone` (`sup_phone`);

--
-- Indexes for table `tbl_warehouse`
--
ALTER TABLE `tbl_warehouse`
  ADD PRIMARY KEY (`warehouse_id`),
  ADD KEY `prod_id` (`prod_id`),
  ADD KEY `emp_id` (`emp_id`);

--
-- Indexes for table `tbl_warehouse_transactions`
--
ALTER TABLE `tbl_warehouse_transactions`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `warehouse_id` (`warehouse_id`),
  ADD KEY `prod_id` (`prod_id`),
  ADD KEY `emp_id` (`emp_id`);

--
-- Indexes for table `tbl_warehse_prod_moved`
--
ALTER TABLE `tbl_warehse_prod_moved`
  ADD PRIMARY KEY (`prod_moved_id`),
  ADD KEY `admin_id` (`admin_id`),
  ADD KEY `prod_id` (`prod_id`),
  ADD KEY `emp_id` (`emp_id`);

--
-- Indexes for table `temp_trans`
--
ALTER TABLE `temp_trans`
  ADD PRIMARY KEY (`temp_trans_id`),
  ADD KEY `fk_temptrans_product` (`prod_id`);

--
-- Indexes for table `temp_trans_cred`
--
ALTER TABLE `temp_trans_cred`
  ADD PRIMARY KEY (`temp_trans_cred_id`),
  ADD KEY `prod_id` (`prod_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_tbl`
--
ALTER TABLE `admin_tbl`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `credit_log`
--
ALTER TABLE `credit_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `history_log`
--
ALTER TABLE `history_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `product_tbl`
--
ALTER TABLE `product_tbl`
  MODIFY `prod_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_brand`
--
ALTER TABLE `tbl_brand`
  MODIFY `brand_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_creditors`
--
ALTER TABLE `tbl_creditors`
  MODIFY `creditor_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_credit_payments`
--
ALTER TABLE `tbl_credit_payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_employees`
--
ALTER TABLE `tbl_employees`
  MODIFY `emp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_expenses`
--
ALTER TABLE `tbl_expenses`
  MODIFY `expense_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_expense_cat`
--
ALTER TABLE `tbl_expense_cat`
  MODIFY `expense_cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbl_payment`
--
ALTER TABLE `tbl_payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_profit`
--
ALTER TABLE `tbl_profit`
  MODIFY `profit_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_sales`
--
ALTER TABLE `tbl_sales`
  MODIFY `sale_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tbl_sales_details`
--
ALTER TABLE `tbl_sales_details`
  MODIFY `sale_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_shop_details`
--
ALTER TABLE `tbl_shop_details`
  MODIFY `shop_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_stockin`
--
ALTER TABLE `tbl_stockin`
  MODIFY `stockin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_suppliers`
--
ALTER TABLE `tbl_suppliers`
  MODIFY `sup_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_warehouse`
--
ALTER TABLE `tbl_warehouse`
  MODIFY `warehouse_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_warehouse_transactions`
--
ALTER TABLE `tbl_warehouse_transactions`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_warehse_prod_moved`
--
ALTER TABLE `tbl_warehse_prod_moved`
  MODIFY `prod_moved_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `temp_trans`
--
ALTER TABLE `temp_trans`
  MODIFY `temp_trans_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `temp_trans_cred`
--
ALTER TABLE `temp_trans_cred`
  MODIFY `temp_trans_cred_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `credit_log`
--
ALTER TABLE `credit_log`
  ADD CONSTRAINT `credit_log_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `tbl_employees` (`emp_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `history_log`
--
ALTER TABLE `history_log`
  ADD CONSTRAINT `fk_history_emp` FOREIGN KEY (`emp_id`) REFERENCES `tbl_employees` (`emp_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `history_log_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `tbl_employees` (`emp_id`);

--
-- Constraints for table `product_tbl`
--
ALTER TABLE `product_tbl`
  ADD CONSTRAINT `fk_product_brand` FOREIGN KEY (`brand_id`) REFERENCES `tbl_brand` (`brand_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_product_category` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`cat_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_product_supplier` FOREIGN KEY (`supplier_id`) REFERENCES `tbl_suppliers` (`sup_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `tbl_creditors`
--
ALTER TABLE `tbl_creditors`
  ADD CONSTRAINT `tbl_creditors_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `tbl_sales` (`sale_id`),
  ADD CONSTRAINT `tbl_creditors_ibfk_2` FOREIGN KEY (`emp_id`) REFERENCES `tbl_employees` (`emp_id`);

--
-- Constraints for table `tbl_credit_payments`
--
ALTER TABLE `tbl_credit_payments`
  ADD CONSTRAINT `tbl_credit_payments_ibfk_1` FOREIGN KEY (`creditor_id`) REFERENCES `tbl_creditors` (`creditor_id`),
  ADD CONSTRAINT `tbl_credit_payments_ibfk_2` FOREIGN KEY (`emp_id`) REFERENCES `tbl_employees` (`emp_id`);

--
-- Constraints for table `tbl_expenses`
--
ALTER TABLE `tbl_expenses`
  ADD CONSTRAINT `fk_expenses_emp` FOREIGN KEY (`emp_id`) REFERENCES `tbl_employees` (`emp_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_expenses_ibfk_1` FOREIGN KEY (`added_by`) REFERENCES `tbl_employees` (`emp_id`),
  ADD CONSTRAINT `tbl_expenses_ibfk_2` FOREIGN KEY (`expense_cat_id`) REFERENCES `tbl_expense_cat` (`expense_cat_id`);

--
-- Constraints for table `tbl_payment`
--
ALTER TABLE `tbl_payment`
  ADD CONSTRAINT `tbl_payment_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin_tbl` (`admin_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tbl_payment_ibfk_2` FOREIGN KEY (`sales_id`) REFERENCES `tbl_sales` (`sale_id`) ON DELETE CASCADE;

--
-- Constraints for table `tbl_sales`
--
ALTER TABLE `tbl_sales`
  ADD CONSTRAINT `fk_admin_id` FOREIGN KEY (`admin_id`) REFERENCES `admin_tbl` (`admin_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tbl_sales_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `tbl_employees` (`emp_id`);

--
-- Constraints for table `tbl_sales_details`
--
ALTER TABLE `tbl_sales_details`
  ADD CONSTRAINT `tbl_sales_details_ibfk_1` FOREIGN KEY (`prod_id`) REFERENCES `product_tbl` (`prod_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tbl_sales_details_ibfk_2` FOREIGN KEY (`sales_id`) REFERENCES `tbl_sales` (`sale_id`) ON DELETE CASCADE;

--
-- Constraints for table `tbl_stockin`
--
ALTER TABLE `tbl_stockin`
  ADD CONSTRAINT `fk_stockin_product` FOREIGN KEY (`prod_id`) REFERENCES `product_tbl` (`prod_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_warehouse`
--
ALTER TABLE `tbl_warehouse`
  ADD CONSTRAINT `tbl_warehouse_ibfk_1` FOREIGN KEY (`prod_id`) REFERENCES `product_tbl` (`prod_id`),
  ADD CONSTRAINT `tbl_warehouse_ibfk_2` FOREIGN KEY (`emp_id`) REFERENCES `tbl_employees` (`emp_id`);

--
-- Constraints for table `tbl_warehouse_transactions`
--
ALTER TABLE `tbl_warehouse_transactions`
  ADD CONSTRAINT `tbl_warehouse_transactions_ibfk_1` FOREIGN KEY (`warehouse_id`) REFERENCES `tbl_warehouse` (`warehouse_id`),
  ADD CONSTRAINT `tbl_warehouse_transactions_ibfk_2` FOREIGN KEY (`prod_id`) REFERENCES `product_tbl` (`prod_id`),
  ADD CONSTRAINT `tbl_warehouse_transactions_ibfk_3` FOREIGN KEY (`emp_id`) REFERENCES `tbl_employees` (`emp_id`);

--
-- Constraints for table `tbl_warehse_prod_moved`
--
ALTER TABLE `tbl_warehse_prod_moved`
  ADD CONSTRAINT `tbl_warehse_prod_moved_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin_tbl` (`admin_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tbl_warehse_prod_moved_ibfk_2` FOREIGN KEY (`prod_id`) REFERENCES `product_tbl` (`prod_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tbl_warehse_prod_moved_ibfk_3` FOREIGN KEY (`emp_id`) REFERENCES `tbl_employees` (`emp_id`) ON DELETE CASCADE;

--
-- Constraints for table `temp_trans`
--
ALTER TABLE `temp_trans`
  ADD CONSTRAINT `fk_temptrans_product` FOREIGN KEY (`prod_id`) REFERENCES `product_tbl` (`prod_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `temp_trans_cred`
--
ALTER TABLE `temp_trans_cred`
  ADD CONSTRAINT `temp_trans_cred_ibfk_1` FOREIGN KEY (`prod_id`) REFERENCES `product_tbl` (`prod_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
