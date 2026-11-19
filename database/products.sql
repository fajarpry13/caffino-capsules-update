/*
SQLyog Community
MySQL - 8.0.30 : Database - dev_caffino2022
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `product_buy_now` */

CREATE TABLE `product_buy_now` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `link_tokped` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_shopee` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_blibli` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_bukalapak` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_buy_now_product_id_foreign` (`product_id`),
  CONSTRAINT `product_buy_now_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `product_buy_now` */

insert  into `product_buy_now`(`id`,`link_tokped`,`link_shopee`,`link_blibli`,`link_bukalapak`,`product_id`,`created_at`,`updated_at`) values 
(1,'https://tokopedia.com/','https://shopee.com/','https://www.blibli.com/','https://www.bukalapak.com/',1,'2022-08-10 12:44:22','2022-08-10 12:46:12'),
(2,'https://tokopedia.com/','https://shopee.com/','https://www.blibli.com/','https://www.bukalapak.com/',2,'2022-08-10 13:11:09','2022-08-10 13:11:09'),
(3,'https://tokopedia.com/','https://shopee.com/','https://www.blibli.com/','https://www.bukalapak.com/',3,'2022-08-10 13:13:05','2022-08-10 13:13:05'),
(4,'https://tokopedia.com/','https://shopee.com/','https://www.blibli.com/','https://www.bukalapak.com/',4,'2022-08-10 13:15:05','2022-08-10 13:15:05'),
(5,'https://tokopedia.com/','https://shopee.com/','https://www.blibli.com/','https://www.bukalapak.com/',5,'2022-08-10 13:16:41','2022-08-10 13:16:41');

/*Table structure for table `product_fakta_nutrisi` */

CREATE TABLE `product_fakta_nutrisi` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_fakta_nutrisi_product_id_foreign` (`product_id`),
  CONSTRAINT `product_fakta_nutrisi_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `product_fakta_nutrisi` */

insert  into `product_fakta_nutrisi`(`id`,`name`,`value`,`product_id`,`created_at`,`updated_at`) values 
(1,'Carbs','20 g',1,'2022-08-10 12:45:34','2022-08-10 12:45:34'),
(2,'Dietary Fiber','1 g',1,'2022-08-10 12:45:55','2022-08-10 13:02:09'),
(3,'Sugar','13 g',1,'2022-08-10 13:02:23','2022-08-10 13:02:23'),
(4,'Fat','3 g',1,'2022-08-10 13:02:37','2022-08-10 13:02:37'),
(5,'Saturated','3 g',1,'2022-08-10 13:02:49','2022-08-10 13:02:49'),
(6,'Polyunsaturated','-- g',1,'2022-08-10 13:03:00','2022-08-10 13:03:00'),
(7,'Monounsaturated','-- g',1,'2022-08-10 13:03:09','2022-08-10 13:03:09'),
(8,'Trans','-- g',1,'2022-08-10 13:03:19','2022-08-10 13:03:19'),
(9,'Protein','1 g',1,'2022-08-10 13:03:29','2022-08-10 13:03:29'),
(10,'Sodium','60 mg',1,'2022-08-10 13:03:43','2022-08-10 13:03:43'),
(11,'Potassium','-- mg',1,'2022-08-10 13:03:55','2022-08-10 13:03:55'),
(12,'Cholesterol','-- mg',1,'2022-08-10 13:04:34','2022-08-10 13:04:34'),
(13,'Vitamin A','-- %',1,'2022-08-10 13:04:42','2022-08-10 13:04:42'),
(14,'Vitamin C','-- %',1,'2022-08-10 13:04:51','2022-08-10 13:04:51'),
(15,'Calcium','-- %',1,'2022-08-10 13:05:03','2022-08-10 13:05:03'),
(16,'Iron','-- %',1,'2022-08-10 13:05:13','2022-08-10 13:05:13'),
(19,'Carbs','20 g',2,'2022-08-10 12:45:34','2022-08-10 12:45:34'),
(20,'Dietary Fiber','1 g',2,'2022-08-10 12:45:55','2022-08-10 13:02:09'),
(21,'Sugar','13 g',2,'2022-08-10 13:02:23','2022-08-10 13:02:23'),
(22,'Fat','3 g',2,'2022-08-10 13:02:37','2022-08-10 13:02:37'),
(23,'Saturated','3 g',2,'2022-08-10 13:02:49','2022-08-10 13:02:49'),
(24,'Polyunsaturated','-- g',2,'2022-08-10 13:03:00','2022-08-10 13:03:00'),
(25,'Monounsaturated','-- g',2,'2022-08-10 13:03:09','2022-08-10 13:03:09'),
(26,'Trans','-- g',2,'2022-08-10 13:03:19','2022-08-10 13:03:19'),
(27,'Protein','1 g',2,'2022-08-10 13:03:29','2022-08-10 13:03:29'),
(28,'Sodium','60 mg',2,'2022-08-10 13:03:43','2022-08-10 13:03:43'),
(29,'Potassium','-- mg',2,'2022-08-10 13:03:55','2022-08-10 13:03:55'),
(30,'Cholesterol','-- mg',2,'2022-08-10 13:04:34','2022-08-10 13:04:34'),
(31,'Vitamin A','-- %',2,'2022-08-10 13:04:42','2022-08-10 13:04:42'),
(32,'Vitamin C','-- %',2,'2022-08-10 13:04:51','2022-08-10 13:04:51'),
(33,'Calcium','-- %',2,'2022-08-10 13:05:03','2022-08-10 13:05:03'),
(34,'Iron','-- %',2,'2022-08-10 13:05:13','2022-08-10 13:05:13'),
(35,'Carbs','20 g',3,'2022-08-10 12:45:34','2022-08-10 12:45:34'),
(36,'Dietary Fiber','1 g',3,'2022-08-10 12:45:55','2022-08-10 13:02:09'),
(37,'Sugar','13 g',3,'2022-08-10 13:02:23','2022-08-10 13:02:23'),
(38,'Fat','3 g',3,'2022-08-10 13:02:37','2022-08-10 13:02:37'),
(39,'Saturated','3 g',3,'2022-08-10 13:02:49','2022-08-10 13:02:49'),
(40,'Polyunsaturated','-- g',3,'2022-08-10 13:03:00','2022-08-10 13:03:00'),
(41,'Monounsaturated','-- g',3,'2022-08-10 13:03:09','2022-08-10 13:03:09'),
(42,'Trans','-- g',3,'2022-08-10 13:03:19','2022-08-10 13:03:19'),
(43,'Protein','1 g',3,'2022-08-10 13:03:29','2022-08-10 13:03:29'),
(44,'Sodium','60 mg',3,'2022-08-10 13:03:43','2022-08-10 13:03:43'),
(45,'Potassium','-- mg',3,'2022-08-10 13:03:55','2022-08-10 13:03:55'),
(46,'Cholesterol','-- mg',3,'2022-08-10 13:04:34','2022-08-10 13:04:34'),
(47,'Vitamin A','-- %',3,'2022-08-10 13:04:42','2022-08-10 13:04:42'),
(48,'Vitamin C','-- %',3,'2022-08-10 13:04:51','2022-08-10 13:04:51'),
(49,'Calcium','-- %',3,'2022-08-10 13:05:03','2022-08-10 13:05:03'),
(50,'Iron','-- %',3,'2022-08-10 13:05:13','2022-08-10 13:05:13'),
(51,'Carbs','20 g',4,'2022-08-10 12:45:34','2022-08-10 12:45:34'),
(52,'Dietary Fiber','1 g',4,'2022-08-10 12:45:55','2022-08-10 13:02:09'),
(53,'Sugar','13 g',4,'2022-08-10 13:02:23','2022-08-10 13:02:23'),
(54,'Fat','3 g',4,'2022-08-10 13:02:37','2022-08-10 13:02:37'),
(55,'Saturated','3 g',4,'2022-08-10 13:02:49','2022-08-10 13:02:49'),
(56,'Polyunsaturated','-- g',4,'2022-08-10 13:03:00','2022-08-10 13:03:00'),
(57,'Monounsaturated','-- g',4,'2022-08-10 13:03:09','2022-08-10 13:03:09'),
(58,'Trans','-- g',4,'2022-08-10 13:03:19','2022-08-10 13:03:19'),
(59,'Protein','1 g',4,'2022-08-10 13:03:29','2022-08-10 13:03:29'),
(60,'Sodium','60 mg',4,'2022-08-10 13:03:43','2022-08-10 13:03:43'),
(61,'Potassium','-- mg',4,'2022-08-10 13:03:55','2022-08-10 13:03:55'),
(62,'Cholesterol','-- mg',4,'2022-08-10 13:04:34','2022-08-10 13:04:34'),
(63,'Vitamin A','-- %',4,'2022-08-10 13:04:42','2022-08-10 13:04:42'),
(64,'Vitamin C','-- %',4,'2022-08-10 13:04:51','2022-08-10 13:04:51'),
(65,'Calcium','-- %',4,'2022-08-10 13:05:03','2022-08-10 13:05:03'),
(66,'Iron','-- %',4,'2022-08-10 13:05:13','2022-08-10 13:05:13'),
(67,'Carbs','20 g',5,'2022-08-10 12:45:34','2022-08-10 12:45:34'),
(68,'Dietary Fiber','1 g',5,'2022-08-10 12:45:55','2022-08-10 13:02:09'),
(69,'Sugar','13 g',5,'2022-08-10 13:02:23','2022-08-10 13:02:23'),
(70,'Fat','3 g',5,'2022-08-10 13:02:37','2022-08-10 13:02:37'),
(71,'Saturated','3 g',5,'2022-08-10 13:02:49','2022-08-10 13:02:49'),
(72,'Polyunsaturated','-- g',5,'2022-08-10 13:03:00','2022-08-10 13:03:00'),
(73,'Monounsaturated','-- g',5,'2022-08-10 13:03:09','2022-08-10 13:03:09'),
(74,'Trans','-- g',5,'2022-08-10 13:03:19','2022-08-10 13:03:19'),
(75,'Protein','1 g',5,'2022-08-10 13:03:29','2022-08-10 13:03:29'),
(76,'Sodium','60 mg',5,'2022-08-10 13:03:43','2022-08-10 13:03:43'),
(77,'Potassium','-- mg',5,'2022-08-10 13:03:55','2022-08-10 13:03:55'),
(78,'Cholesterol','-- mg',5,'2022-08-10 13:04:34','2022-08-10 13:04:34'),
(79,'Vitamin A','-- %',5,'2022-08-10 13:04:42','2022-08-10 13:04:42'),
(80,'Vitamin C','-- %',5,'2022-08-10 13:04:51','2022-08-10 13:04:51'),
(81,'Calcium','-- %',5,'2022-08-10 13:05:03','2022-08-10 13:05:03'),
(82,'Iron','-- %',5,'2022-08-10 13:05:13','2022-08-10 13:05:13');

/*Table structure for table `products` */

CREATE TABLE `products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `index` int DEFAULT NULL,
  `brand` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bg_color` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `renteng_reguler` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pouch_reguler` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `published` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `products` */

insert  into `products`(`id`,`index`,`brand`,`name`,`slug`,`icon`,`image`,`bg_color`,`description`,`renteng_reguler`,`pouch_reguler`,`published`,`created_at`,`updated_at`) values 
(1,1,'CAFFINO BOLD','DARK CAPPUCCINO','dark-cappuccino','source/product/dark-cappuccino/CAFFINO-FAMILY-PACK-DARKCAPPU.jpg','source/product/dark-cappuccino/PRODUCT-CAFFINO-DARK-CAPPU.png','#bb9f64','Kopi latte 3 in 1 dengan rasa Dark Cappuccino yang premium. Terbuat dari kopi asli dan susu asli yang berkualitas.\r\n\r\nNikmati Caffino Dark Cappuccino yang pasti rasa kopinya.','Isi/karton: 12 renteng x 10 sachet\r\nUkuran karton: 355 x 255 x 188 mm\r\nNet weight: 25gt/sachet\r\nShelf life: 18 months','Isi/karton: 20 pouch x 6 sachet\r\nUkuran karton: 488 x 270 x 267 mm\r\nNet weight: 25gt/sachet\r\nShelf life: 18 months',0,'2022-08-10 12:44:04','2022-08-10 15:45:27'),
(2,2,'Caffino Bold','PREMIUM LATTE','premium-latte','source/product/premium-latte/CAFFINO-FAMILY-PACK-BOLD.jpg','source/product/premium-latte/PRODUCT-CAFFINO-BOLD.png','#e29541','Kopi latte 3 in 1 dengan rasa Dark Cappuccino yang premium. Terbuat dari kopi asli dan susu asli yang berkualitas.\r\n\r\nNikmati Caffino Dark Cappuccino yang pasti rasa kopinya.','Isi/karton: 12 renteng x 10 sachet\r\nUkuran karton: 355 x 255 x 188 mm\r\nNet weight: 25gt/sachet\r\nShelf life: 18 months','Isi/karton: 20 pouch x 6 sachet\r\nUkuran karton: 488 x 270 x 267 mm\r\nNet weight: 25gt/sachet\r\nShelf life: 18 months',0,'2022-08-10 13:11:01','2022-08-10 15:41:46'),
(3,3,'Caffino','KOPI LATTE CLASSIC','kopi-latte-classic','source/product/kopi-latte-classic/CAFFINO-FAMILY-PACK-CLASSIC.jpg','source/product/kopi-latte-classic/PRODUCT-CAFFINO-CLASSIC.png','#512f2e','Kopi latte 3 in 1 dengan rasa Dark Cappuccino yang premium. Terbuat dari kopi asli dan susu asli yang berkualitas.\r\n\r\nNikmati Caffino Dark Cappuccino yang pasti rasa kopinya.','Isi/karton: 12 renteng x 10 sachet\r\nUkuran karton: 355 x 255 x 188 mm\r\nNet weight: 25gt/sachet\r\nShelf life: 18 months','Isi/karton: 20 pouch x 6 sachet\r\nUkuran karton: 488 x 270 x 267 mm\r\nNet weight: 25gt/sachet\r\nShelf life: 18 months',0,'2022-08-10 13:12:53','2022-08-10 15:41:46'),
(4,4,'Caffino','KOPI LATTE MOCCA','kopi-latte-mocca','source/product/kopi-latte-mocca/CAFFINO-FAMILY-PACK-MOCCA.jpg','source/product/kopi-latte-mocca/PRODUCT-CAFFINO-MOCCA.png','#b7312c','Kopi latte 3 in 1 dengan rasa Dark Cappuccino yang premium. Terbuat dari kopi asli dan susu asli yang berkualitas.\r\n\r\nNikmati Caffino Dark Cappuccino yang pasti rasa kopinya.','Isi/karton: 12 renteng x 10 sachet\r\nUkuran karton: 355 x 255 x 188 mm\r\nNet weight: 25gt/sachet\r\nShelf life: 18 months','Isi/karton: 20 pouch x 6 sachet\r\nUkuran karton: 488 x 270 x 267 mm\r\nNet weight: 25gt/sachet\r\nShelf life: 18 months',0,'2022-08-10 13:14:59','2022-08-10 15:41:46'),
(5,5,'Caffino','KOPI LATTE HAZELNUT','kopi-latte-hazelnut','source/product/kopi-latte-hazelnut/CAFFINO-FAMILY-PACK-HAZELNUT.jpg','source/product/kopi-latte-hazelnut/PRODUCT-CAFFINO-HAZELNUT.png','#317042','Kopi latte 3 in 1 dengan rasa Dark Cappuccino yang premium. Terbuat dari kopi asli dan susu asli yang berkualitas.\r\n\r\nNikmati Caffino Dark Cappuccino yang pasti rasa kopinya.','Isi/karton: 12 renteng x 10 sachet\r\nUkuran karton: 355 x 255 x 188 mm\r\nNet weight: 25gt/sachet\r\nShelf life: 18 months','Isi/karton: 20 pouch x 6 sachet\r\nUkuran karton: 488 x 270 x 267 mm\r\nNet weight: 25gt/sachet\r\nShelf life: 18 months',0,'2022-08-10 13:16:35','2022-08-10 15:41:47');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
