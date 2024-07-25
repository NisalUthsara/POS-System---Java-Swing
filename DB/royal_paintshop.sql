-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.33 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.5.0.6677
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for royal_paintshop
CREATE DATABASE IF NOT EXISTS `royal_paintshop` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `royal_paintshop`;

-- Dumping structure for table royal_paintshop.brand
CREATE TABLE IF NOT EXISTS `brand` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `status` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKS_status` (`status`),
  CONSTRAINT `FKS_status` FOREIGN KEY (`status`) REFERENCES `user_status` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table royal_paintshop.brand: ~5 rows (approximately)
INSERT INTO `brand` (`id`, `name`, `status`) VALUES
	(1, 'Causeway', 1),
	(2, 'Dulux', 1),
	(3, 'Nippolac', 1),
	(4, 'Nippon', 1),
	(5, 'multilac', 1);

-- Dumping structure for table royal_paintshop.category
CREATE TABLE IF NOT EXISTS `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `status` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1_status` (`status`),
  CONSTRAINT `FK1_status` FOREIGN KEY (`status`) REFERENCES `user_status` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table royal_paintshop.category: ~3 rows (approximately)
INSERT INTO `category` (`id`, `name`, `status`) VALUES
	(1, 'Decorative Paint', 1),
	(2, 'Primers and Undercoats', 1),
	(3, 'Wood and Furniture', 1);

-- Dumping structure for table royal_paintshop.city
CREATE TABLE IF NOT EXISTS `city` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table royal_paintshop.city: ~5 rows (approximately)
INSERT INTO `city` (`id`, `name`) VALUES
	(1, 'Gampaha'),
	(2, 'Colombo'),
	(3, 'Kandy'),
	(4, 'Minuwangoda'),
	(5, 'Rajagiriya');

-- Dumping structure for table royal_paintshop.company
CREATE TABLE IF NOT EXISTS `company` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `contact_num` varchar(10) NOT NULL,
  `address_line1` varchar(100) NOT NULL,
  `address_line2` varchar(100) NOT NULL,
  `city_id` int NOT NULL,
  `status` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1_city` (`city_id`),
  KEY `FK2_status` (`status`),
  CONSTRAINT `FK1_city` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`),
  CONSTRAINT `FK2_status` FOREIGN KEY (`status`) REFERENCES `user_status` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table royal_paintshop.company: ~3 rows (approximately)
INSERT INTO `company` (`id`, `name`, `contact_num`, `address_line1`, `address_line2`, `city_id`, `status`) VALUES
	(1, 'Dulux', '0789243358', 'Galle Road', 'Ratmalana', 2, 1),
	(2, 'NIPPON PAINT (LANKA) PRIVATE LIMITED', '0773455667', 'BUTHGAMUWA ROAD', 'RAJAGIRIYA', 5, 1),
	(3, 'Causeway Paints Lanka (Pvt) Ltd ', '0785565439', '15 Noel Mendis Mawatha', 'Panadura', 2, 1);

-- Dumping structure for table royal_paintshop.customer
CREATE TABLE IF NOT EXISTS `customer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `contact_number` varchar(10) NOT NULL,
  `status` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1_cus_status` (`status`),
  CONSTRAINT `FK1_cus_status` FOREIGN KEY (`status`) REFERENCES `user_status` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table royal_paintshop.customer: ~0 rows (approximately)
INSERT INTO `customer` (`id`, `name`, `contact_number`, `status`) VALUES
	(1, 'Cash Customer', 'none', 1);

-- Dumping structure for table royal_paintshop.grn
CREATE TABLE IF NOT EXISTS `grn` (
  `id` int NOT NULL AUTO_INCREMENT,
  `supplier_id` int NOT NULL,
  `date_time` datetime NOT NULL,
  `user_id` int NOT NULL,
  `unique_id` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_grn_supplier1_idx` (`supplier_id`),
  KEY `fk_grn_user1_idx` (`user_id`),
  CONSTRAINT `fk_grn_supplier1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`),
  CONSTRAINT `fk_grn_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table royal_paintshop.grn: ~11 rows (approximately)
INSERT INTO `grn` (`id`, `supplier_id`, `date_time`, `user_id`, `unique_id`) VALUES
	(1, 2, '2022-07-24 14:38:21', 1, '1658653701294-1'),
	(2, 1, '2022-07-24 23:26:04', 1, '1658685364695-1'),
	(3, 1, '2022-07-26 22:56:08', 1, '1658856368740-1'),
	(4, 2, '2022-07-31 15:05:45', 1, '1659260145005-1'),
	(5, 1, '2022-07-31 16:27:07', 1, '1659265027813-1'),
	(6, 1, '2022-07-31 16:29:23', 1, '1659265163161-1'),
	(7, 3, '2022-08-08 10:08:57', 1, '1659933537731-1'),
	(8, 3, '2022-08-08 10:10:36', 1, '1659933636938-1'),
	(9, 4, '2022-08-09 11:08:46', 1, '1660023526300-1'),
	(10, 4, '2022-08-09 23:01:08', 1, '1660066268106-1'),
	(11, 3, '2022-08-09 23:05:11', 1, '1660066511148-1');

-- Dumping structure for table royal_paintshop.grn_item
CREATE TABLE IF NOT EXISTS `grn_item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quantity` int DEFAULT NULL,
  `buying_price` double DEFAULT NULL,
  `grn_id` int NOT NULL,
  `stock_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_grn_item_grn1_idx` (`grn_id`),
  KEY `fk_grn_item_stock1_idx` (`stock_id`),
  CONSTRAINT `fk_grn_item_grn1` FOREIGN KEY (`grn_id`) REFERENCES `grn` (`id`),
  CONSTRAINT `fk_grn_item_stock1` FOREIGN KEY (`stock_id`) REFERENCES `stock` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table royal_paintshop.grn_item: ~14 rows (approximately)
INSERT INTO `grn_item` (`id`, `quantity`, `buying_price`, `grn_id`, `stock_id`) VALUES
	(1, 5, 550, 1, 1),
	(2, 15, 900, 2, 2),
	(3, 10, 1100, 3, 3),
	(4, 10, 3000, 4, 4),
	(5, 15, 2300, 4, 5),
	(6, 10, 2000, 5, 6),
	(7, 10, 2000, 6, 7),
	(8, 5, 1500, 7, 8),
	(9, 5, 1900, 8, 9),
	(10, 10, 2300, 9, 10),
	(11, 5, 1900, 9, 11),
	(12, 5, 2000, 10, 8),
	(13, 5, 1200, 10, 12),
	(14, 10, 2000, 11, 13);

-- Dumping structure for table royal_paintshop.grn_payment
CREATE TABLE IF NOT EXISTS `grn_payment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `grn_id` int NOT NULL,
  `payment_type_id` int NOT NULL,
  `payment` double NOT NULL,
  `balance` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_grn_payment_grn1_idx` (`grn_id`),
  KEY `fk_grn_payment_payment_type1_idx` (`payment_type_id`),
  CONSTRAINT `fk_grn_payment_grn1` FOREIGN KEY (`grn_id`) REFERENCES `grn` (`id`),
  CONSTRAINT `fk_grn_payment_payment_type1` FOREIGN KEY (`payment_type_id`) REFERENCES `payment_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table royal_paintshop.grn_payment: ~11 rows (approximately)
INSERT INTO `grn_payment` (`id`, `grn_id`, `payment_type_id`, `payment`, `balance`) VALUES
	(1, 1, 1, 5000, 2250),
	(2, 2, 1, 14000, 500),
	(3, 3, 1, 12000, 1000),
	(4, 4, 1, 65000, 500),
	(5, 5, 1, 10000, -10000),
	(6, 6, 1, 30000, 10000),
	(7, 7, 1, 8000, 500),
	(8, 8, 1, 10000, 500),
	(9, 9, 1, 40000, 7500),
	(10, 10, 1, 20000, 4000),
	(11, 11, 1, 30000, 10000);

-- Dumping structure for table royal_paintshop.invoice
CREATE TABLE IF NOT EXISTS `invoice` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `date_time` datetime NOT NULL,
  `user_id` int NOT NULL,
  `unique_id` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_invoice_customer1_idx` (`customer_id`),
  KEY `fk_invoice_user1_idx` (`user_id`),
  CONSTRAINT `fk_invoice_customer1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `fk_invoice_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table royal_paintshop.invoice: ~8 rows (approximately)
INSERT INTO `invoice` (`id`, `customer_id`, `date_time`, `user_id`, `unique_id`) VALUES
	(1, 1, '2022-07-25 23:39:40', 1, '1658772580532-1'),
	(2, 1, '2022-07-27 00:14:34', 1, '1658861074508-1'),
	(3, 1, '2022-07-31 16:34:32', 1, '1659265472407-1'),
	(4, 1, '2022-08-08 10:23:37', 3, '1659934417836-3'),
	(5, 1, '2022-08-09 23:06:21', 1, '1660066581683-1'),
	(6, 1, '2022-08-16 16:32:28', 1, '1660647748093-1'),
	(7, 1, '2022-11-28 14:11:36', 1, '1669624896469-1'),
	(8, 1, '2022-11-28 22:45:19', 1, '1669655719466-1');

-- Dumping structure for table royal_paintshop.invoice_item
CREATE TABLE IF NOT EXISTS `invoice_item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `stock_id` int NOT NULL,
  `qty` int DEFAULT NULL,
  `invoice_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_invoice_item_stock1_idx` (`stock_id`),
  KEY `fk_invoice_item_invoice1_idx` (`invoice_id`),
  CONSTRAINT `fk_invoice_item_invoice1` FOREIGN KEY (`invoice_id`) REFERENCES `invoice` (`id`),
  CONSTRAINT `fk_invoice_item_stock1` FOREIGN KEY (`stock_id`) REFERENCES `stock` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table royal_paintshop.invoice_item: ~12 rows (approximately)
INSERT INTO `invoice_item` (`id`, `stock_id`, `qty`, `invoice_id`) VALUES
	(1, 1, 1, 1),
	(2, 2, 1, 1),
	(3, 2, 2, 2),
	(4, 2, 7, 3),
	(5, 5, 5, 3),
	(6, 8, 2, 4),
	(7, 9, 2, 4),
	(8, 13, 2, 5),
	(9, 8, 2, 6),
	(10, 7, 2, 7),
	(11, 4, 2, 7),
	(12, 11, 2, 8);

-- Dumping structure for table royal_paintshop.invoice_payment
CREATE TABLE IF NOT EXISTS `invoice_payment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `invoice_id` int NOT NULL,
  `payment_type_id` int NOT NULL,
  `payment` double DEFAULT NULL,
  `balance` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_invoice_payment_invoice1_idx` (`invoice_id`),
  KEY `fk_invoice_payment_payment_type1_idx` (`payment_type_id`),
  CONSTRAINT `fk_invoice_payment_invoice1` FOREIGN KEY (`invoice_id`) REFERENCES `invoice` (`id`),
  CONSTRAINT `fk_invoice_payment_payment_type1` FOREIGN KEY (`payment_type_id`) REFERENCES `payment_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table royal_paintshop.invoice_payment: ~8 rows (approximately)
INSERT INTO `invoice_payment` (`id`, `invoice_id`, `payment_type_id`, `payment`, `balance`) VALUES
	(1, 1, 1, 2000, 200),
	(2, 2, 1, 5000, 2600),
	(3, 3, 1, 25000, 1600),
	(4, 4, 1, 10000, 0),
	(5, 5, 1, 6000, 1000),
	(6, 6, 1, 5000, 600),
	(7, 7, 1, 15000, 2960),
	(8, 8, 1, 5000, 200);

-- Dumping structure for table royal_paintshop.payment_type
CREATE TABLE IF NOT EXISTS `payment_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table royal_paintshop.payment_type: ~3 rows (approximately)
INSERT INTO `payment_type` (`id`, `name`) VALUES
	(1, 'Cash'),
	(2, 'Check'),
	(3, 'Credits');

-- Dumping structure for table royal_paintshop.product
CREATE TABLE IF NOT EXISTS `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `brand_id` int NOT NULL,
  `category_id` int NOT NULL,
  `status` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_category1_idx` (`category_id`),
  KEY `fk_product_brand1_idx` (`brand_id`),
  KEY `FK3_status` (`status`),
  CONSTRAINT `FK3_status` FOREIGN KEY (`status`) REFERENCES `user_status` (`id`),
  CONSTRAINT `fk_product_brand1` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`),
  CONSTRAINT `fk_product_category1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table royal_paintshop.product: ~8 rows (approximately)
INSERT INTO `product` (`id`, `name`, `brand_id`, `category_id`, `status`) VALUES
	(1, 'Causeway Emulsion', 1, 1, 1),
	(2, 'Causeway Weatherproof', 1, 1, 1),
	(3, 'Nippolac Exterior Wall Filler', 3, 2, 1),
	(4, 'Dulux Crack Bridging Wall Primer white', 2, 1, 1),
	(5, 'Dulux Gloss Plus – Brilliant white', 2, 1, 1),
	(6, 'Dulux Gloss Plus Colors', 2, 1, 1),
	(7, 'Nippon Anticorrosive Paint', 4, 2, 1),
	(8, 'multilac wall paint', 5, 1, 1);

-- Dumping structure for table royal_paintshop.stock
CREATE TABLE IF NOT EXISTS `stock` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `selling_price` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stock_product1_idx` (`product_id`),
  CONSTRAINT `fk_stock_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table royal_paintshop.stock: ~13 rows (approximately)
INSERT INTO `stock` (`id`, `product_id`, `quantity`, `selling_price`) VALUES
	(1, 1, 4, 600),
	(2, 3, 5, 1200),
	(3, 3, 10, 1600),
	(4, 4, 8, 3520),
	(5, 5, 10, 3000),
	(6, 8, 10, 2200),
	(7, 1, 8, 2500),
	(8, 1, 6, 2200),
	(9, 2, 3, 2800),
	(10, 7, 10, 3000),
	(11, 3, 3, 2400),
	(12, 2, 5, 1500),
	(13, 2, 8, 2500);

-- Dumping structure for table royal_paintshop.supplier
CREATE TABLE IF NOT EXISTS `supplier` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `contact_number` varchar(10) NOT NULL,
  `email` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `company_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1_company` (`company_id`),
  CONSTRAINT `FK1_company` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table royal_paintshop.supplier: ~4 rows (approximately)
INSERT INTO `supplier` (`id`, `name`, `contact_number`, `email`, `company_id`) VALUES
	(1, 'Nipuna sandaruwan', '0779532884', 'nipuna@gmail.com', 1),
	(2, 'Janitha Nilanga', '0752232126', 'jani@gmail.com', 1),
	(3, 'Chamika wikramasinghe', '0774333286', 'chamika@gmail.com', 3),
	(4, 'Sahan Kahadagama', '0759934234', 'sahan@gmail.com', 2);

-- Dumping structure for table royal_paintshop.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `nic` varchar(45) NOT NULL,
  `contact_number` varchar(10) NOT NULL,
  `password` varchar(45) NOT NULL,
  `user_type_id` int NOT NULL,
  `city_id` int NOT NULL,
  `user_status_id` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_user_user_type_idx` (`user_type_id`),
  KEY `fk_user_user_status1_idx` (`user_status_id`),
  KEY `fk_user_city1_idx` (`city_id`),
  CONSTRAINT `fk_user_city1` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`),
  CONSTRAINT `fk_user_user_status1` FOREIGN KEY (`user_status_id`) REFERENCES `user_status` (`id`),
  CONSTRAINT `fk_user_user_type` FOREIGN KEY (`user_type_id`) REFERENCES `user_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table royal_paintshop.user: ~3 rows (approximately)
INSERT INTO `user` (`id`, `name`, `username`, `nic`, `contact_number`, `password`, `user_type_id`, `city_id`, `user_status_id`) VALUES
	(1, 'Admin', 'admin', '200005233213', '0715174882', '1234', 1, 1, 1),
	(3, 'Ashan idunil', 'ashan', '99558433365V', '0775507341', '789', 2, 1, 1);

-- Dumping structure for table royal_paintshop.user_status
CREATE TABLE IF NOT EXISTS `user_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table royal_paintshop.user_status: ~2 rows (approximately)
INSERT INTO `user_status` (`id`, `name`) VALUES
	(1, 'ACTIVE'),
	(2, 'INACTIVE');

-- Dumping structure for table royal_paintshop.user_type
CREATE TABLE IF NOT EXISTS `user_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table royal_paintshop.user_type: ~2 rows (approximately)
INSERT INTO `user_type` (`id`, `type`) VALUES
	(1, 'ADMIN'),
	(2, 'CASHIER');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
