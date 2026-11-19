/*
SQLyog Community
MySQL - 5.7.33 : Database - caffino_2022
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `activity_log` */

CREATE TABLE `activity_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `log_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_id` bigint(20) unsigned DEFAULT NULL,
  `subject_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` bigint(20) unsigned DEFAULT NULL,
  `causer_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `properties` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activity_log_log_name_index` (`log_name`),
  KEY `subject` (`subject_id`,`subject_type`),
  KEY `causer` (`causer_id`,`causer_type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `activity_log` */

insert  into `activity_log`(`id`,`log_name`,`description`,`subject_id`,`subject_type`,`causer_id`,`causer_type`,`properties`,`created_at`,`updated_at`) values 
(1,'default','created',1,'App\\Domains\\Announcement\\Models\\Announcement',NULL,NULL,'{\"attributes\": {\"area\": null, \"type\": \"info\", \"enabled\": true, \"ends_at\": null, \"message\": \"This is a <strong>Global</strong> announcement that will show on both the frontend and backend. <em>See <strong>AnnouncementSeeder</strong> for more usage examples.</em>\", \"starts_at\": null}}','2022-08-09 15:34:55','2022-08-09 15:34:55');

/*Table structure for table `announcements` */

CREATE TABLE `announcements` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `area` enum('frontend','backend') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('info','danger','warning','success') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'info',
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `starts_at` timestamp NULL DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `announcements` */

insert  into `announcements`(`id`,`area`,`type`,`message`,`enabled`,`starts_at`,`ends_at`,`created_at`,`updated_at`) values 
(1,NULL,'info','This is a <strong>Global</strong> announcement that will show on both the frontend and backend. <em>See <strong>AnnouncementSeeder</strong> for more usage examples.</em>',1,NULL,NULL,'2022-08-09 15:34:55','2022-08-09 15:34:55');

/*Table structure for table `articles` */

CREATE TABLE `articles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_published` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `published_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `articles_user_id_foreign` (`user_id`),
  CONSTRAINT `articles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `articles` */

insert  into `articles`(`id`,`user_id`,`title`,`slug`,`content`,`is_published`,`published_at`,`created_at`,`updated_at`,`image`) values 
(70,1,'CAFFINO, Kopi 3 in 1 Pertama Dengan Kopi dan Susu Asli','caffino-kopi-3-in-1-pertama-dengan-kopi-dan-susu-asli','<p>PT Sumber Kopi Prima resmi meluncurkan kopi baru dengan brand &ldquo;CAFFINO&rdquo; berdasarkan keinginan untuk membawa cita rasa kopi berkualitas untuk masyarakat Indonesia. Gaya hidup kaum urban saat ini dipengaruhi banget oleh perkembangan zaman dan teknologi. Perubahanpun mulai kerasa dalam berbagai aspek kehidupan. Hal-hal yang dulunya nggak menjadi kebutuhan primer, mungkin menjadi bagian dari keseharian yang nggak bisa kita tinggalkan, seperti ritual &lsquo;ngopi&rsquo; misalnya.</p>\r\n<p>Begitu banyak quotes yang mengatakan tentang betapa &lsquo;powerful&rsquo; nya kopi untuk ngebantu kita tetap fresh. Namun, di dunia yang saat ini bergerak begitu cepat, ternyata nggak mudah untuk menemukan kopi berkualitas yang bisa dinikmati kapan aja, dan di mana aja. Tidak semua orang memiliki waktu untuk mampir di kedai kopi favorit mereka sebelum akhirnya melanjutkan hari.</p>\r\n<p>Disinilah keunggulan Caffino , Kopi instant latte 3-1. Caffino merupakan kopi instan pertama di Indonesia yang menggunakan kopi asli dan susu asli. Di setiap sesapan kopi Caffino, bisa langsung terasa bahan-bahan berkualitas yang digunakan dan mudah dikenali dari foam latte tebal karena memakai susu asli. Tersedia dalam 3 varian rasa, yaitu Kopi Latte Classic untuk penggemar kopi rasa kopi yang lebih kuat, Kopi Latte Mocca dengan rasa mocca yang nikmat dari perpaduan antara kopi asli dan moka, dan Kopi Latte Cokelat Hazelnut, kopi 3-in-1 pertama yang mengusung rasa cokelat hazelnut.</p>\r\n<p>Kopi Caffino sudah melakukan soft launching di Jakarta Fair Kemayoran dan tercatat 1.15 juta gelas Caffino berhasil dibagikan kepada pengunjung secara gratis. Tidak hanya itu, booth Caffino juga mendapat penghargaan sebagai booth terbaik di Jakarta Fair Kemayoran.</p>',1,'2022-08-15 11:20:50','2019-09-25 06:45:58','2022-08-15 11:20:50','source/artikel/launch-produk-caffino2-580x394.png'),
(71,1,'Bagian dari Hidup, Iqbaal Ramadhan Ungkap Kebiasaannya Minum Kopi','bagian-dari-hidup-iqbaal-ramadhan-ungkap-kebiasaannya-minum-kopi','<p>Minum kopi belakangan menjadi tren dan bagian dari gaya hidup. Minum kopi dianggap bisa menjadi pembangkit mood (mood booster) sebelum beraktivitas. Kebiasaan itu juga yang dilakukan aktor Iqbaal Ramadhan. Baginya, tiada hari tanpa secangkir kopi.</p>\r\n<p>Didapuk sebagai duta atau Brand Ambassador produk kopi, Caffino, kopi instan 3-1 dengan slogan #Beauthentic, membuat Iqbaal senang. Sebab minum kopi menjadi kesukaannya sejak berada di Amerika Serikat.</p>\r\n<p>&ldquo;Belum banyak yang tahu, bahwa sebenarnya kopi sudah jadi bagian dari hidup saya dan itu sudah terjadi saat saya di Amerika Serikat, sudah mulai minum kopi ya. Pas di Melbourne juga gitu. Apalagi Melbourne juga surganya kopi, karena di jalan banyak coffee shop, jadi hidup saya ya kopi. Lebih baik tidak breakfast daripada enggak ngopi ke kampus,&rdquo; kata Iqbaal kepada wartawan baru-baru ini.</p>\r\n<p>Dalam keterangan tertulis Caffino, Kamis (11/7), pertama kali Iqbaal mencoba secangkir kopi latte. Dan sejak saat itu kenikmatan secangkir kopi latte menjadi favoritnya. Menurutnya kopi latte paling enak sebagai mood booster.</p>\r\n<p>&ldquo;Awalnya latte dan sampai sekarang latte karena latte tuh kayak enggak pernah salah gitu loh,apalagi kalau bingung mau pesen apa jadi ya sudah pilih latte saja. Kalau di luar negeri juga suka capuccino, di Melbourne juga ada Magic tapi saya enggak tahu mereka bikinnya kayak gimana, semacam latte tapi itu special di Melbourne,&rdquo; ujarnya.</p>\r\n<p>Iqbaal rutin minum kopi setiap kali bangun tidur. Saat siang hari juga tak dilewatkannya untuk minum secangkir kopi.</p>\r\n<p>&ldquo;Habis makam siang biasanya ngopi. Kopi jadi kayak minuman sehari-hari saya. Kalau hari tanpa kopi itu jadi kayak enggak tahu deh. Memulai hari, biar enggak ngantuk jadi ngopi,&rdquo; ungkap jebolan Coboy Junior itu</p>\r\n<p>Caffino ingin membawa cita rasa kopi berkualitas ala kafe dalam bentuk sachet. Diproduksi oleh PT.Sumber Kopi Prima, Caffino adalah kopi instan pertama yang menggunakan kopi dan susu asli dan diakui oleh BPOM. Tersedia dalam 3 varian rasa, yaitu kopi latte classic untuk anda yang lebih suka rasa kopi yang cenderung &lsquo;strong&rsquo;, kopi latte mocca, dan kopi latte choco hazelnut. Caffino sendiri sudah melakukan soft launching di Jakarta Fair Kemayoran dan tercatat setiap harinya kurang lebih 27.500 sample berhasil dibagikan kepada masyarakat.</p>\r\n<p>&ldquo;Saat ini segala sesuatu yang ada di social media nampaknya menjadi patokan tentang bagaimana seseorang harus menampakan dirinya. Nah, hal ini membuat banyak orang cenderung jadi ikut-ikutan dan cenderung jadi lupa siapa dirinya. That&rsquo;s why kami memilih brand ambassador yang memiliki &lsquo;karakter&rsquo; dan idealisme yang unik yakni Iqbaal Ramadhan,&rdquo; tutup CEO dari PT.Sumber Kopi Prima, Ihsan Mulia Putri.</p>',1,'2022-08-15 11:21:18','2019-09-25 06:48:26','2022-08-15 11:21:18','source/artikel/iqbal-ramadhan-suka-ngopi-580x394.png'),
(72,1,'Iqbaal Ramadhan Akui Lebih Senang Ngopi Daripada Sarapan Pagi','iqbaal-ramadhan-akui-lebih-senang-ngopi-daripada-sarapan-pagi','<p>Iqbaal Ramadhan menjadi salah satu selebriti yang gemar meminum kopi. Bahkan sebelum menjalani aktivitasnya, pemain Bumi Manusia itu selalu memulai harinya dengan menyicipi kopi.</p>\r\n<p>Ditemui di launching Delizio Caffino, di kawasan Kemang, Jakarta Selatan, Selasa (9/7/2019), Iqbaal mengaku dibandingkan sarapan pagi, dirinya justru lebih memilih menyicipi kopi.</p>\r\n<p>&ldquo;Belum banyak yang tahu, bahwa sebenernya kopi sudah jadi bagian dari hidup saya dan itu sudah terjadi saat saya di US 2016, udah mulai minum kopi ya. Pas di Melbourne juga gitu. Apalagi Melbourne juga surga ya kopi, karena dijalan banyak coffe Shop, jadi hidup saya ya kopi. Lebih baik tidak breakfest daripada nggak ngopi ke kampus,&rdquo; kata Iqbaal Ramadhan</p>\r\n<p>Tak hanya di waktu pagi hari saja, Iqbaal Ramadhan juga mengaku menyicipi kopi di waktu siang hari. Intinya, ia selalu meminum kopi di setiap harinya demi membangkitkan semangat.</p>\r\n<p>Untuk rasa, pria kelahiran Surabaya, 28 Desember 1999 itu mengaku sangat menyukai latte. Bahkan jika bingung mau membeli rasa apa, ia selalu memilih latte.</p>\r\n<p>&ldquo;Awalnya ngopi itu rasanya latte dan sampai sekarang latte, karena latte tuh kaya nggak salah gitu loh, apalagi kalau bingung mau pesen apa jadi yaudah pilih latte aja,&rdquo; tuturnya.</p>\r\n<p>Kendati demikian, Iqbaal juga mengaku tetap menyicipi kopi dengan rasa yang lain agar dirinya bisa tahu rasa kopi yang enak dan membandingkan dengan latte.</p>\r\n<p>&ldquo;Tapi kadang suka capucino, di Melbourne juga ada Magic tapi saya nggak tahu mereka bikinnya kayak gimana, semacam kaya latte tapi itu Special di Melbourne gitu, tapi latte kayak nggak pernah salah,&rdquo; jelas Iqbaal Ramadhan.</p>',1,'2022-08-15 11:21:46','2019-09-26 07:10:35','2022-08-15 11:21:46','source/artikel/Screen-Shot-2019-09-23-at-8-12-07-AM-580x353.png'),
(73,1,'PT Sumber Kopi Prima Resmi Luncurkan Brand Caffino','pt-sumber-kopi-prima-resmi-luncurkan-brand-caffino','<p><strong>PT Sumber Kopi Prima</strong>, Selasa (9/7/2019) meluncurkan brand kopi baru&nbsp;<strong>Caffino</strong>&nbsp;berdasarkan keinginan untuk membawa cita rasa kopi berkualitas untuk masyarakat Indonesia.</p>\r\n<p>&ldquo;Kita terinspirasi pertama konsumen ada dibenak kita. Kita melihat gaya hidup kafe kopi bagian dari gaya hidup perkotaan. Kita mikirnya bagaimana kita bisa menghadirkan experience kafe diminum di rumah,&rdquo; ujar Ihsan Mulia Putri selaku CEO PT Sumber Kopi Prima saat peluncuran Caffino di Kemang, Jakarta.</p>\r\n<div class=\"majalahpro-core-banner-insidecontent\">&nbsp;</div>\r\n<p>&ldquo;Terbuat dari biji kopi dan susu asli tapi bubuk. Kalau kita seduh foamnya tebal. Packagingnya nuansa kafe kita bisa happy melihat kemasannya premium. Satu sachet harganya Rp 1.500,&rdquo; lanjutnya.</p>\r\n<p>Caffino memilih Iqbaal Ramadhan sebagai Brand Ambassador. Menurut Ihsan Mulia Putri, karakter Iqbaal yang mempunyai idealisme di karir dan jadi diri sendiri dalam keseharian dianggap tepat mewakili brand Caffino.</p>\r\n<p>&ldquo;Mewakili proses yang sangat panjang. Setelah kita diskusi membahas potensi ambassador jatuh kepada Iqbaal. Kita melihat kecocokan Iqbal yang berani melakukan hal-hal yang baru. Kita tahu Iqbaal punya idealisme dan interest yang unik seperti pendidikan. Jadi prinsip hidup, image, Iqbaal sangat cocok dengan Caffino,&rdquo; pungkasnya.</p>\r\n<p>Caffino hadir dalam tiga varian, yaitu Latte Classic, Latte Mocca dan Cokelat Hazelnut. (RIE).</p>',1,'2022-08-15 11:22:13','2019-10-14 06:22:36','2022-08-15 11:22:13','source/artikel/caffino-launc2-580x394.jpg'),
(74,1,'Caffino Perkenalkan 3 Varian Baru, Kopi Instan Sensasi Racikan Kafe','caffino-perkenalkan-3-varian-baru-kopi-instan-sensasi-racikan-kafe','<p>Kini penikmat kopi tidak lagi bisa dihitung dengan jari. Lihat saja kedai kopi yang semakin menjamur di berbagai tempat. Selalu penuh pengunjung dari pagi hingga malam hari.</p>\r\n<p>Budaya hangout baru masyarakat ini menarik minat salah satu produsen kopi untuk mempermudah para pecinta kopi dalam menikmati minuman yang terkenal bikin &lsquo;melek&rsquo; ini.</p>\r\n<p>&rdquo; Dengan Caffino, kami ingin mengubah paradigma bahwa kopi berkualitas hanya bisa didapatkan di kafe. Tapi juga bisa dinikmati dalam bentuk sachet, supaya seluruh Indonesia bisa mendapatkan dan merasakan kopi berkualitas,&rdquo; ujar Ihsan Mulia Putri, CEO PT Sumber Kopi Prima di Kemang, Jakarta Selatan, Selasa 9 Juli 2019.</p>\r\n<p>Di peluncuran perdananya, Caffino hadir dalam tiga rasa, yaitu kopi latte classic, kopi latte mocca dan kopi latte cokelat hazelnut. Ketiganya berasal dari kopi dan susu asli dengan perpaduan rasa yang tidak terlalu manis.</p>\r\n<p>&rdquo; Pas dengan selera orang Indonesia, karena biasanya yang banyak disukai adalah kopi yang tidak terlalu manis di tenggorokan,&rdquo; ungkap Coffee Expert, Jo Reza.</p>\r\n<p>Meskipun terbuat dari campuran kopi dan susu, pecinta rasa kopi dengan rasa lebih kuat bisa mencoba varian latte classic. Dan untuk pecinta moka dan hazelnut bisa mencoba varian lainnya.</p>\r\n<p>&rdquo; Varian hazelnutnya sangat khas dan lezat. Ini baru pertama kalinya saya mencoba varian hazelnut dari kopi sachet,&rdquo; tambah Reza.</p>\r\n<p>Sebelumnya, Caffino sudah tersedia di PRJ dan berhasil menjual 1,15 juta gelas yang dibagikan secara gratis.</p>\r\n<p>&rdquo; Sebenarnya, produk ini sudah tersedia sejak 18 Juni di pasaran. Tapi, sekarang baru diperkenalkan. Sekarang ini sudah tersedia dalam tiga format kemasan, renteng, pouch dan box khusus untuk penjualan lewat e-commerce,&rdquo; tutup Putri.</p>',1,'2022-08-15 11:23:39','2019-10-14 06:26:27','2022-08-15 11:23:39','source/artikel/caffino-launch1-580x360.jpg'),
(75,1,'CAFFINO, Kopi 3 in 1 Pertama Dengan Kopi dan Susu Asli','caffino-kopi-3-in-1-pertama-dengan-kopi-dan-susu-asli-2','<p>PT Sumber Kopi Prima resmi meluncurkan kopi baru dengan brand &ldquo;CAFFINO&rdquo; berdasarkan keinginan untuk membawa cita rasa kopi berkualitas untuk masyarakat Indonesia. Gaya hidup kaum urban saat ini dipengaruhi banget oleh perkembangan zaman dan teknologi. Perubahanpun mulai kerasa dalam berbagai aspek kehidupan. Hal-hal yang dulunya nggak menjadi kebutuhan primer, mungkin menjadi bagian dari keseharian yang nggak bisa kita tinggalkan, seperti ritual &lsquo;ngopi&rsquo; misalnya. Begitu banyak quotes yang mengatakan tentang betapa &lsquo;powerful&rsquo; nya kopi untuk ngebantu kita tetap fresh. Namun, di dunia yang saat ini bergerak begitu cepat, ternyata nggak mudah untuk menemukan kopi berkualitas yang bisa dinikmati kapan aja, dan di mana aja. Tidak semua orang memiliki waktu untuk mampir di kedai kopi favorit mereka sebelum akhirnya melanjutkan hari.</p>\r\n<p>Disinilah keunggulan Caffino , Kopi instant latte 3-1. Caffino merupakan kopi instan pertama di Indonesia yang menggunakan kopi asli dan susu asli. Di setiap sesapan kopi Caffino, bisa langsung terasa bahan-bahan berkualitas yang digunakan dan mudah dikenali dari foam latte tebal karena memakai susu asli. Tersedia dalam 3 varian rasa, yaitu Kopi Latte Classic untuk penggemar kopi rasa kopi yang lebih kuat, Kopi Latte Mocca dengan rasa mocca yang nikmat dari perpaduan antara kopi asli dan moka, dan Kopi Latte Cokelat Hazelnut, kopi 3-in-1 pertama yang mengusung rasa cokelat hazelnut.</p>\r\n<p>Kopi Caffino sudah melakukan soft launching di Jakarta Fair Kemayoran dan tercatat 1.15 juta gelas Caffino berhasil dibagikan kepada pengunjung secara gratis. Tidak hanya itu, booth Caffino juga mendapat penghargaan sebagai booth terbaik di Jakarta Fair Kemayoran.</p>\r\n<p>Ibu Ihsan Mulia Putri selaku CEO PT Sumber Kopi Prima menjelaskan bahwa Mimpi Caffino sebagai brand sebetulnya sederhana. Caffino ingin mengubah paradigma bahwa kopi-kopi yang berkualitas hanya bisa didapatkan di kafe, Caffino ingin membawa kopi berkualitas dalam bentuk sachet, agar seluruh Indonesia bisa mendapatkan dan merasakan kopi berkualitas yang sesungguhnya.</p>\r\n<p>Mengusung slogan #BeAuthentic karena kopi Caffino dibuat dengan kopi dan susu asli. Selain itu, Caffino juga ingin menyebarkan semangat positif kepada masyarakat luas untuk berani menunjukan jati dirinya dan tidak hanya ikut-ikutan dengan apa yang ada di social media. Saat ini segala sesuatu yang ada di social media nampaknya menjadi patokan tentang bagaimana seseorang harus menampakan dirinya, dan membuat banyak orang cenderung jadi ikut-ikutan dan cenderung menjadi lupa siapa dirinya. Untuk membantu membawa semangat positif untuk menjadi diri sendiri Caffino memilih Iqbaal Ramadhan sebagai Brand Ambassador yang memiliki &lsquo;karakter&rsquo; dan idealisme yang otentik.</p>\r\n<p>Ditemui saat launching produk Caffino, pada tanggal 9 Juli 2019, Iqbaal Ramadhan mengatakan bahwa dirinya merasa terhormat karena terpilih menjadi Brand Ambassador Caffino. Iqbaal menjelaskan bahwa dirinya merasa senang karena diberi kesempatan untuk menyebarkan nilai-nilai dan semangat #BeAuthentic yang sangat positif untuk kalangan anak muda. Mencari jati diri tentunya merupakan perjalanan setiap remaja dimanapun mereka berada, tapi sangat penting untuk tidak lupa akan good values yang tentunya sudah ada di dalam diri manusia itu sendiri, sangat penting untuk tidak membiarkan social media mendikte kepribadian kita.</p>\r\n<p>Caffino sudah tersedia di retail penjualan di seluruh Indonesia baik offline dan online, saat ini Caffino tersedia dalam 3 format kemasan. Kemasan renteng, kemasan pouch, dan kemasan box khusus untuk penjualan melalui e-commerce. Saat ini Caffino menjalin partnership eksklusif dengan Blibli.com. Di mana setiap pembelian melalui Blibli.com, pembeli akan mendapatkan berbagai hadiah menarik.</p>\r\n<p>Go, grab it! Have a sip, #BeAuthentic.</p>',1,'2022-08-15 11:24:45','2019-10-14 06:26:27','2022-08-15 11:24:45','source/artikel/caffino-launch3-580x394.jpg'),
(76,1,'7 Negara Siap Bertarung di Caffino Superliga Junior 2019','7-negara-siap-bertarung-di-caffino-superliga-junior-2019','<p>Untuk semakin mematangkan kinerja atlet-atlet junior, dalam waktu dekat kejuaraan bulu tangkis beregu Caffino Superliga Junior 2019 akan segera dilaksanakan.</p>\r\n<p>GOR Djarum, Magelang, Jawa Tengah akan menjadi tuan rumah bagi penyelenggaraan ajang yang sudah dilakukan sebanyak tiga kali tersebut pada tanggal 15 sampai 20 Oktober mendatang.</p>\r\n<p>Dalam tahun keempat ini, tak kurang dari 265 atlet sektor U17 dan U19 putra dan putri dari enam negara siap bertarung. Mulai dari Malaysia, Jepang, Tiongkok, Taiwan, Singapura, Thailand dan tentu saja tuan rumah Indonesia akan bertanding di lima partai yang terdiri dari tiga sektor tunggal dan dua sektor ganda.</p>\r\n<p>&ldquo;Superliga Junior merupakan turnamen beregu yang akan menguji mental para pemain muda dalam format kejuaraan beregu. Sehingga, diharapkan mereka memiliki jam terbang dan pengalaman yang mumpuni ketika tampil di acara yang lebih besar lagi,&rdquo; ungkap Direktur Superliga, Achmad Budiharto dalam acara konferensi pers Caffino Superliga Junior 2019, Ayana Ballroom, Midplaza, Jakarta Pusat, Rabu (9/10).</p>\r\n<p>Seperti tahun-tahun sebelumnya, Superliga Junior di tahun ini akan menggunakan format beregu layaknya Piala Thomas dan Uber. Pda kategori U19 piala yang akan diperebutkan ialah Piala Liem Swie King untuk U19 Putra dan Piala Susy Susanti untuk U19 Putri.</p>\r\n<p>Sementara itu, di kategori U17 piala yang akan diperebutkan ialah Piala Hariyanto Arbi untuk putra dan Piala Yuni Kartika untuk putri.</p>\r\n<p>Tahun ini, sebanyak 13 klub bulu tangkis telah mendaftarkan diri untuk memperebutkan gelar juara.</p>\r\n<p>Klub-klub tersebut ialah PB Djarum, Exist Badminton Club, Pb Jaya Raya, Mutiara Cardinal Bandung, Jatim United, Blibli.com Team, SGS PLN Bandung, Sarwedah Badminton Club, Harimau Muda (Malaysia), Kumamoto Team (Jepang), Granular Badminton Academy (Thailand), Taiwan High School (Taiwan) dan Singapore Badminton Association (Singapura).</p>\r\n<p>Sementara itu, Wakil Ketua Umum Persatuan Bulu tangkis Seluruh Indonesia, Alex Tirta menyambut baik diadakannya turnamen ini. Dia pun mengatakan, turnamen ini akan menjadi bekal bagi para pebulutangkis junior untuk kedepannya.</p>\r\n<p>&ldquo;Turnamen ini sangat baik untuk pemain junior kita dan menurut saya mereka punya kesempatan emas. Karena mereka bukan hanya harus mengeluarkan kemampuan di lapangan tapi juga kekompakan tim, ini akan menjadi bekal untuk jadi senior nanti. Saya lihat juga banyak diikuti klub luar, jadi ada kompetisi dengan pemain luar semakin menambah rivalitas mereka dan saya berharap bahwa mereka bukan hanya mengasah kemampuan tapi juga persiapan regenerasi bulu tangkis ke depannya,&rdquo; tambahnya.</p>\r\n<p>Sementara itu, PB Djarum yang turut hadir dalam konferensi pers tersebut mengapresiasi kembali bergulirnya turnamen ini. Selain itu, PB Djarum saat ini tengah memfokuskan diri untuk mempertahankan gelar mereka tahun lalu.</p>\r\n<p>&ldquo;Tahun lalu kami berhasil mendapatkan Piala Yuni Kartika, dan mestinya kami bisa mempertahankan gelar ya walaupun mush berat semua kita akan berusaha semaksimal mungkin mempertahankannya. Memang sebagian besar tim U19 putra Djarum juga sedang berlaga di ajang WJC, tapi mereka sudah terbiasa untuk melakukan pertandingan di waktu dekat seperti ini dan kondisi mereka saya rasa nggak masalah.),&rdquo; pungkas Antonisus Budi Arianto selaku perwakilan dari PB Djarum. (OL-7)</p>',1,'2022-08-15 11:25:07','2019-10-14 07:06:49','2022-08-15 11:25:07','source/artikel/caffino-superliga-junior-580x322.jpg'),
(77,1,'Caffino Dukung Turnamen Superliga Junior 2019','caffino-dukung-turnamen-superliga-junior-2019','<p>Salah satu produk kopi lokal bercita rasa nusantara, Caffino menunjukkan dukungannya untuk kemajuan dunia bulutangkis Indonesia dengan menjadi sponsor utama Superliga Junior 2019 pada 15 &ndash; 20 Oktober 2019 di GOR Djarum, Magelang, Jawa Tengah.</p>\r\n<p>Turnamen yang diikuti oleh 6 negara ini, yakni Indonesia, Malaysia, Thailand, Taiwan, Jepang, dan Singapura ini merupakan langkah nyata untuk membantu PBSI dalam mengembangkan potensi atlet muda bulutangkis Indonesia.</p>\r\n<p>Ditemui saat konferensi pers berlangsung pada Rabu (09/10/19) di salah satu hotel bilangan Tanah Abang, Jakarta Pusat, Ihsan Mulia Putri selaku CEO PT Sumber Kopi Prima mengaku senang bisa berpartisipasi dalam acara ini.</p>\r\n<p>&ldquo;Semangat dari para atlet muda yang terus berjuang untuk meraih hasil terbaik menginspirasi Caffino untuk memiliki semangat yang sama, yakni untuk memberikan kopi yang berkualitas dan terbaik untuk masyarakat,&rdquo; ujar Ihsan pada awak media.<br />&ldquo;Semoga dengan turnamen ini, para atlet muda yang berlaga dalam turnamen Caffino Superliga Junior 2019 dapat menunjukkan daya juang tinggi.&rdquo;</p>\r\n<p>&ldquo;Sehingga bisa memberikan prestasi yang optimal di atas lapangan. Dengan demikian akan lahir juara-juara baru yang akan meneruskan tongkat estafet kemenangan yang sudah dirintis oleh para atlet senior terdahulu,&rdquo; tandasnya.</p>',1,'2022-08-15 11:25:33','2019-10-15 05:49:31','2022-08-15 11:25:33','source/artikel/caffino-dukung-superliga-junior-580x394.jpg'),
(78,1,'Indonesia Raih Tiga Gelar Juara di Indonesia International Challenge','indonesia-raih-tiga-gelar-juara-di-indonesia-international-challenge','<p>Tuan rumah Indonesia merebut tiga gelar juara dalam Indonesia International Challenge (IIC) 2019. Prestasi tersebut diraih melalui sektor ganda campuran, ganda puteri dan tunggal putera.</p>\r\n<p>Dalam babak final di GOR Djarum, Magelang, Minggu 927/10/2019, Zachria Joshiano Sumanti/Hediana Julimarbela mengalahkan sesama wakil Indonesia Rian Agung Saputra/Tiara Rosalia Nuraidah, Zachria/Hediana menang dengan skor 22-20, 21-14.</p>\r\n<p>Torehan itu spesial bagi Zachria/Hediana, sebab menjadi gelar juara mereka untuk kali pertama. Mereka baru didueetkan dua bulan lalu pada ajang Vietnam Open 2019 BWF Tour Super 100.</p>\r\n<p>&ldquo;Kami nggak nyangka juara, yang penting main maksimal,&rdquo; ujar Zachria usai pertandingan.</p>\r\n<p>&ldquo;Senang bisa juara, tapi nggak nyangka juga karena memang dari awal lawannya sudah berat. Dengan gelar juara ini mudah-mudahan kepercayaan diri kami semakin meningkat,&rdquo; Hediana menimpali.</p>\r\n<p>Sementara itu, Rian/Tiara memuji penampilan Zacharia/Hediana. Tiara menyebut lawan tampil lebih siap di partai final tersebut.</p>\r\n<p>&ldquo;Kalau sudah di final itu soal siapa yang lebih siap. Hari ini mereka jauh lebih siap dari kami, siap banget,&rdquo; kata Tiara.</p>\r\n<p>&ldquo;Harus coba lagi di turnamen berikutnya. Semoga saja hasilnya bisa lebih baik lagi,&rdquo; ujar Rian.</p>\r\n<p>Gelar juara juga diraih ganda puteri pasangan Anggia Shitta Awanda/Pia Zebadiah Bernadet. Pasangan ini mengalahkan pasangan asal Jepang, Natsu Saito/Naru Shinoya, dengan skor 21-19, 21-18.</p>\r\n<p>&ldquo;Senang banget untuk pertama kali (juara) di turnamen internasional,&rdquo; ujar Pia.</p>\r\n<p>&ldquo;Kami lebih siap di pertandingan kali ini, walaupun tadi di game pertama masih agak sedikit kagok, tapi pelan-pelan kami bisa mengatasinya. Lawan juga sebetulnya bermain bagus, tapi kita lebih siap hari ini,&rdquo; ujar Anggia.</p>\r\n<p>Satu gelar juara lain dituai oleh tunggal putera, Ikhsan Leonardo Imanuel Rumbay. Dia mengalahkan Sony Dwi Kuncoro dengan skor 21-13, 21-15.</p>\r\n<p>&ldquo;Yang pasti gelar ini berharga banget soalnya kan udah hampir setahun saya nggak naik podium. Puji Tuhan, saya bisa naik podium sekarang,&rdquo; ujar Ikhsan.</p>\r\n<p>&ldquo;Hari ini dia bermain dengan sangat baik. Saya tahu Ikhsan pemain muda yang punya power dan kecepatan yang bagus,&rdquo; Sony menimpali.</p>',1,'2022-08-15 11:25:55','2019-10-28 08:23:35','2022-08-15 11:25:55','source/artikel/caffino-iic2019-580x394.jpg'),
(79,1,'Caffino Kopi Latte','caffino-kopi-latte','<p>Kopi Latte Instant 3 in 1 dengan Kopi Asli dan Susu Asli. Tersedia dalam 3 varian rasa: Kopi Latte Classic, Kopi Latte Mocca, Kopi Latte Choco Hazelnut.#BeAuthentic</p>\r\n<p>Perpaduan rasa kopi asli dan mokanya begitu menyatu ditambah buih foam yang tebal sehingga membuat sensasi minum kopi latte mocca Caffino semakin istimewa. Selain itu, ada varian lain yaitu kopi Latte Classic. Kopi ini cocok untuk penggemar kopi yang tidak terlalu manis. Berikutnya adalah varian rasa choco hazelnut. Ini yang dinamakan rasa kopi yang luar biasa.</p>\r\n<p>Campuran kopi, susu dan gulanya memang pas. Sehingga tingkat kemanisan kopi Latte Choco Hazelnut seperti kopi kafe.</p>\r\n<p>&nbsp;</p>\r\n<p>Klik&nbsp;<a href=\"https://www.hometesterclub.com/id/id/reviews/caffino-kopi-latte/455259/1\" target=\"_blank\" rel=\"noopener noreferrer\">disini</a>&nbsp;untuk memberikan review dengan uji coba produk Caffino Kopi Latte.</p>',1,'2022-08-15 11:26:16','2019-12-28 06:16:00','2022-08-15 11:26:16','source/artikel/barengpacar-580x394.png'),
(80,1,'Caffino Kenalkan Konsep Baristan, Sensasi Bikin Kopi di Rumah ala Barista','caffino-kenalkan-konsep-baristan-sensasi-bikin-kopi-di-rumah-ala-barista','<p>Istilah Baristan mungkin terdengar asing bagi para pencinta kopi. Meski sekilas mirip dengan kata Barista, Barsitan sendiri adalah singkatan dari Barista Kopi Instan.</p>\r\n<p>Istilah Baristan pertama kali diperkenalkan oleh Caffino, produk kopi instan kemasan dari PT Sumber Kopi Prima. Menurut CEO PT Sumber Kopi Prima, Ihsan Mulia Putri, dengan adanya istilah Baristan, semua orang kini bisa bikin dan berkreasi membuat kopi sendiri di rumah.</p>\r\n<p>&ldquo;Meskipun dalam kemasan (<em data-key=\"11626690\">sachet</em>), kita benar-benar perhatikan penyajiannya supaya mirip di kafe supaya orang-orang bisa ngopi nikmat di rumah, konsepnya mudah. Dengan konsep Baristan, semua orang pasti bisa jadi barista sendiri, tentunya dengan Caffino Dark Cappucino,&rdquo; kata Putri dalam acara bincang media virtual beberapa hari lalu.</p>\r\n<p>Istilah Baristan sangat cocok menggambarkan kondisi saat ini. Apalagi di tengah pandemi, kebiasaan nongkrong di kedai kopi sudah tidak bisa dilakukan seperti dulu lagi hingga kondisi pandemi COVID-19 dinyatakan aman.</p>\r\n<p>&ldquo;Di sini kami ingin menghadirkan solusi untuk minum kopi seenak ke kafe, di masa pandemi tetap bisa beraktivitas dari rumah sambil menikmati Caffino. Ini juga jadi inspirasi buat ngopi berkualitas di rumah,&rdquo; jelasnya.</p>\r\n<p>Dikatakan Putri, tren minum kopi sudah menjadi budaya orang Indonesia. Jika dulu minum kopi identik dengan orang tua, saat ini justru tren minum kopi sudah menjadi budaya bagi generasi muda atau milenial.</p>\r\n<p>Senada dengan Putri, Selebgram Livy Renata mengatakan konsep Baristan yang digagas Caffino sangat cocok untuk generasi muda, karena anak muda kini bisa membuat kopi ala barista di kafe dengan mudah.</p>\r\n<p>&ldquo;Aku gak pernah terbayangkan kopi instan bisa seenak ini. Aku enggak kebayang ternyata rasa Caffino sama kayak bikinan barista di kafe, enggak pernah kebayang bisa seenak itu sih dan lagi aku pribadi jadi lebih irit, mana rasanya enak lagi,&rdquo; kata Livi.</p>',1,'2022-08-15 11:26:56','2022-06-03 10:07:12','2022-08-15 11:26:56','source/artikel/Virtual Press Conference Caffino.jpg'),
(81,1,'Polemik Baristan Terkuak, Caffino Tawarkan Ngopi Instan di Rumah Senikmat Racikan Ahli','polemik-baristan-terkuak-caffino-tawarkan-ngopi-instan-di-rumah-senikmat-racikan-ahli','<p>Kalangan pecinta kopi&nbsp;di media sosial beberapa waktu lalu dihebohkan perdebatan menanggapi munculnya istilah &lsquo;Baristan&rsquo;. Sekilas mirip dengan kata &lsquo;Barista&rsquo; yang merupakan profesi ahli meracik minuman kopi, belakangan diketahui &lsquo;Baristan&rsquo; merupakan akronim dari &lsquo;Barista Kopi Instan&rsquo;.</p>\r\n<p>Konsep dan istilah &lsquo;Baristan&rsquo; diperkenalkan oleh produk kopi instan kemasan dari PT Sumber Kopi Prima atau yang lebih dikenal sebagai Caffino, untuk para penikmat kopi di Indonesia.</p>\r\n<p>CEO PT Sumber&nbsp;Kopi&nbsp;Prima, Ihsan Mulia Putri, mengungkapkan, istilah dan konsep &lsquo;Baristan&rsquo; adalah cara Caffino untuk memfasilitasi pecinta kopi agar tetap dapat menikmati segelas kopi berkualitas premium dengan cara membuat sendiri di rumah.</p>\r\n<p>Tanpa harus punya keahlian khusus, dengan Caffino siapapun bisa merasakan sensasi membuat segelas kopi dengan kualitas yang tak kalah dengan kopi di kedai atau kafe favorit.</p>\r\n<p>&ldquo;Baristan atau Barista Kopi Instan sesungguhnya adalah semangat yang kami sebarkan untuk semua pecinta kopi di Indonesia. Bahwa siapa saja boleh dan pasti bisa membuat segelas minuman kopi instan yang enak sama seperti kopi di kafe. Caffino, khususnya varian Dark Cappucino bisa menjadi pilihan tepat untuk menjadi Barista Kopi Instan dan menikmati kopi berkualitas,&rdquo; terang Ihsan Mulia Putri dalam Konferensi Pers &ldquo;Baristan &ndash; Solusi Ngopi Berkualitas di Rumah&rdquo; yang digelar daring, Selasa (22/3).</p>\r\n<p>Ihsan menerangkan, semangat &lsquo;Baristan&rsquo; yang diusung Caffino tidak terlepas dari situasi pandemi yang memaksa masyarakat untuk mengurangi aktivitas keluar rumah seperti pergi ke kedai kopi.</p>\r\n<p>Menyeduh kopi instan sendiri di rumah dianggap bisa menjadi solusi sekaligus sensasi dalam menikmati kopi. Namun, agar rasanya tidak mengecewakan diperlukan produk kopi instan yang memiliki bahan-bahan premium dan berkualitas.</p>\r\n<p>&ldquo;Setiap varian dari Caffino memiliki keunggulan dari cita rasa kopinya yang lebih kuat karena terbuat dari bahan premium yaitu kopi asli dan susu asli. Bahkan untuk yang fanatik dengan cita rasa kopi, varian Caffino Dark Cappucino memiliki tambahan topping granule dari kopi asli. Sehingga dalam setiap sesapan, kopinya akan terasa strong seperti kualitas kopi ala barista di kafe,&rdquo; ungkapnya.</p>\r\n<p>Dalam kesempatan yang sama, sejumlah public figure ikut angkat bicara mengenai konsep &lsquo;Baristan&rsquo; yang pada awalnya sempat menuai polemik di dunia maya. Mulai dari sosok Barista Profesional Muhammad Aga, Chef Jerry Andrean yang merupakan Juara MasterChef Indonesia Season 7, hingga selebgram yang tengah populer dan juga penikmat kopi Livy Renata.</p>\r\n<p>Muhammad Aga menilai, lepas dari perdebatan yang muncul, minum kopi merupakan budaya yang sudah mengakar bagi sebagian besar masyarakat Indonesia sejak dulu.</p>\r\n<p>Menurut Juara Indonesia Barista Championship 2018 ini banyak hal dan dampak positif yang terbentuk dari kebiasaan minum kopi, tanpa harus membeda-bedakan tentang pilihan jenis kopi racikan profesional ataupun kopi instan.</p>\r\n<p>&ldquo;Bagi saya, untuk menghasilkan minuman kopi yang berkualitas, utamanya harus menggunakan bahan-bahan yang juga punya kualitas. Ini berlaku untuk barista profesional maupun orang awam. Saya melihat Caffino sudah terjamin dari kualitas bahan dasar kopi dan susunya. Jadi orang awam pun bisa punya pilihan dan cara untuk membuat sendiri kopi yang hasilnya juga enak dan berkualitas,&rdquo; terang sosok yang juga ikut bermain di film Filosofi Kopi ini.</p>\r\n<p>Hal senada diungkap Chef Jerry Andrean yang menyebut kopi sebagai salah satu minuman favorit masyarakat Indonesia yang bisa dinikmati dengan berbagai cara dan kesempatan.</p>\r\n<p>Kopi instan Caffino menurut Jerry bisa menjadi pilihan yang tepat bagi masyarakat untuk membuat sendiri minuman kopi secara mudah tanpa harus kehilangan kualitas yang kerap diidentikkan oleh sajian kopi kafe.</p>\r\n<p>&ldquo;Sama seperti memasak, membuat kopi yang dianggap enak tidak harus selalu dengan metode atau teknik yang rumit. Ada kalanya dengan cara sederhana kita pun bisa membuat sajian kopi yang enak. Misalnya dengan kopi Caffino Dark Cappucino, selama suhu dan takaran airnya tepat dan cara menyeduhnya benar, maka segelas kopi yang dihasilkannya sudah pasti terasa mantap,&rdquo; papar Chef Jerry.</p>\r\n<p>Kenikmatan kopi Caffino juga diakui oleh sosok yang tenar di media sosial belakangan ini, Livy Renata. Sosok yang populer karena kepolosan dan gaya hidupnya yang high class ini bahkan mengaku hampir tidak pernah mencicipi kopi instan sepanjang hidupnya. Terbiasa dengan sajian kopi di kafe atau restoran, Livy terkejut ketika pertama kali menyesap kopi Caffino.</p>\r\n<p>&ldquo;Terus terang Livy jarang banget minum kopi instan, Livy kalau minum kopi itu ya biasanya di kafe. Baru tahu sekarang kalau ternyata kopi instan Caffino rasanya bisa seenak ini. Kayaknya kalau gampang begini, Livy juga bisa nih bikin sendiri dan pasti enak. Maybe next time Livy bakal beneran jadi Baristan,&rdquo; ungkapnya tertawa.&nbsp;<strong>(ziz)</strong></p>',1,'2022-08-15 11:27:13','2022-06-03 11:27:43','2022-08-15 11:27:13','source/artikel/IMG-20220322-WA0029.jpg'),
(82,1,'Baristan, Cara Baru Minun Kopi Senikmat Racikan Ahli','baristan-cara-baru-minun-kopi-senikmat-racikan-ahli','<p>Pecinta kopi kini tak perlu ribet harus ke kafe untuk menikmati minuman kesukaan di kala sibuk bekerja, atau ingin bersantai di rumah.</p>\r\n<p>Sebab, ada baristan alias barista kopi instan yang bisa dibuat sendiri di rumah maupun kantor.</p>\r\n<p>Istilah baristan sendiri merupakan cara Caffino agar masyarakat bisa menikmati secangkir kopi bekualitas premium dengan membuat sendiri.</p>\r\n<p>&ldquo;Varian Dark Cappucino rasanya tak kalah denagn kopi yang dijual di kedai atau kafe,&rdquo; ujar CEO PT Sumber Kopi Prima, Ihsan Mulia Putri.</p>\r\n<p>Tak hanya itu, para pecinta kopi juga bisa membuat kreasi berbeda, seperti yang diperagakan barista profesional Muhammad Aga, Chef Jerry Andrean, dan selebgram Livy Renata.</p>\r\n<p>Dalam jumpa pers virtual &lsquo;Baristan &ndash; Solusi Ngopi Berkualiatas di Rumah&rsquo;, Aga membuat minuman kopi sederhana.</p>\r\n<p>&ldquo;Bagi saya, untuk menghasilkan minuman kopi berkualitas, utamanya harus menggunakan bahan-bahan yang juga punya kualitas,&rdquo; Kata Aga.</p>\r\n<p>Chef Jerry mengkreasikan minuman kopi dingin. Kemudian Livy berkreasi mencapur Caffino Dark Cappucino dengan biskuit.</p>',1,'2022-08-15 11:27:30','2022-06-03 13:43:04','2022-08-15 11:27:30','source/artikel/IMG-20220322-WA0030.jpg'),
(83,1,'Baristan, Ngopi Instan Berkualitas Senikmat Racikan Ahli!','baristan-ngopi-instan-berkualitas-senikmat-racikan-ahli','<p>Belakangan ini, polemik akronim &lsquo;Baristan&rsquo; cukup ramai di media sosial. Baristan atau Barista&nbsp;Kopi Instan,&nbsp;merujuk pada mereka yang meracik isi dari kopi instan kemasan.</p>\r\n<p>Kata &lsquo;Baristan&rsquo; memang sebelumnya dipopulerkan oleh merek kopi&nbsp;Caffino&nbsp;milik PT Sumber Kopi Prima. Hal itu terkait dengan situasi pandemi yang membatasi mobilitas masyarakat sehingga menghambat minum kopi di cafe-cafe maupun warung kopi. Karena itu, Caffino bercita-cita menghadirkan sensasi menyeduh kopi instan sendiri yang terbuat dari bahan-bahan premium dan berkualitas.</p>\r\n<div id=\"attachment_580\" class=\"wp-caption aligncenter\"><img class=\"wp-image-580\" src=\"https://caffino.id/wp-content/uploads/2022/06/Caffino-20220323101903-300x167.jpg\" sizes=\"(max-width: 566px) 100vw, 566px\" srcset=\"https://caffino.id/wp-content/uploads/2022/06/Caffino-20220323101903-300x167.jpg 300w, https://caffino.id/wp-content/uploads/2022/06/Caffino-20220323101903.jpg 700w\" alt=\"Barista profesional Muhammad Aga, chef Jerry Andrean, dan Livy Renata sedang menyeduh Caffino (DOK.CAFFINO)\" width=\"566\" height=\"315\" aria-describedby=\"caption-attachment-580\" />\r\n<p id=\"caption-attachment-580\" class=\"wp-caption-text\"><em>Barista profesional Muhammad Aga, chef Jerry Andrean, dan Livy Renata sedang menyeduh Caffino (DOK.CAFFINO)</em></p>\r\n</div>\r\n<p>&ldquo;Baristan atau Barista Kopi Instan sesungguhnya adalah semangat yang kami sebarkan untuk semua pecinta kopi di Indonesia. Bahwa siapa saja boleh dan pasti bisa membuat segelas minuman kopi instan yang enak sama seperti kopi di kafe,&rdquo; terang CEO PT Sumber Kopi Prima, Ihsan Mulia Putri, dalam Konferensi Pers &ldquo;Baristan &ndash; Solusi Ngopi Berkualitas di Rumah&rdquo; yang digelar daring pada Selasa (22/3/2022).</p>\r\n<p>Dengan semakin berkembangnya konsep Baristan, masyarakat tentu akan semakin mampu untuk menyeduh kopi enak di rumah masing-masing.</p>\r\n<p>Hal itu pun disetujui oleh ketiga bintang tamu yang hadir, termasuk Barista profesional,&nbsp;Muhammad Aga. Ia menilai kebiasaan minum kopi seharusnya tidak perlu membedakan apakah kopi tersebut racikan profesional maupun instan.</p>\r\n<p>&ldquo;Bagi saya, untuk menghasilkan minuman kopi yang berkualitas, utamanya harus menggunakan bahan-bahan yang juga punya kualitas. Ini berlaku untuk barista profesional maupun orang awam,&rdquo; tutur Juara Indonesia Championship 2018 tersebut.</p>\r\n<p>Hal yang sama juga disetujui oleh Chef&nbsp;Jerry Andrean&nbsp;yang turut menghadiri konferensi pers tersebut. Menurutnya, yang terpenting adalah kualitas dan rasa dari kopi yang diseduhnya.</p>\r\n<p>Selebgram sekaligus selebriti media sosial,&nbsp;Livy Renata&nbsp;juga mengaku menyukai rasa kopi instan yang dicobanya saat konferensi pers tersebut. &ldquo;Terus terang Livy jarang banget minum kopi instan, Livy kalau minum kopi itu ya biasanya di kafe. Baru tahu sekarang kalau ternyata kopi instan Caffino rasanya bisa seenak ini,&rdquo; tutur Livy.</p>\r\n<p>Terkait dengan varian Caffino yang direkomendasikan oleh para bintang tamu, varian Caffino Dark Cappucino dengan tambahan&nbsp;<em>topping granule&nbsp;</em>sepertinya masih jadi favorit, Kawula Muda! Lo berniat mencoba nggak?</p>',1,'2022-08-15 11:28:35','2022-06-03 17:27:40','2022-08-15 11:28:35','source/artikel/IMG-20220322-WA0029.jpg'),
(84,1,'Kopi Instan Kemasan Caffino Perkenalkan Istilah Baristan','kopi-instan-kemasan-caffino-perkenalkan-istilah-baristan','<p>PT. Sumber Kopi Prima yang berdiri tahun 2018 menjadi produsen kopi di Indonesia dengan model bisnis yang fokus di FMCG (Fast Moving Consumer Goods). Pada tahun 2019, PT Sumber Kopi Prima meluncurkan Brand DelizioCaffino atau Caffino, sebuah produk kopi latte instan 3-in-1. Meski menjadi kopi instan, namun Caffino menghadirkan bahan natural, yakni kopi asli dan juga susu asli.</p>\r\n<p><img class=\"wp-image-559 aligncenter\" src=\"https://caffino.id/wp-content/uploads/2022/06/Virtual-Press-Conference-Caffino-300x168.jpg\" sizes=\"(max-width: 521px) 100vw, 521px\" srcset=\"https://caffino.id/wp-content/uploads/2022/06/Virtual-Press-Conference-Caffino-300x168.jpg 300w, https://caffino.id/wp-content/uploads/2022/06/Virtual-Press-Conference-Caffino-768x430.jpg 768w, https://caffino.id/wp-content/uploads/2022/06/Virtual-Press-Conference-Caffino.jpg 1024w\" alt=\"\" width=\"521\" height=\"292\" /></p>\r\n<p>Caffino sendiri lahir dari sebuah mimpi yang sederhana yang bertujuan agar seluruh masyarakat Indonesia bisa mendapatkan dan merasakan kopi berkualitas. Sampai saat ini, kopi berkualitas identiknya dengan kopi yang hanya bisa dinikmati di kafe atau kedai kopi tertentu. Melihat keadaan itu, maka Caffino dihadirkan untuk bisa memenuhi keinginan masyarakat yang ingin menikmati kopi berkualitas kapan saja dan di mana saja dalam bentuk sachet.</p>\r\n<p>Belum lama ini, Caffino memperkenalkan konsep dan istilah &lsquo;Baristan&rsquo; yang memiliki artian &lsquo;Barista Kopi Instan&rsquo;. Istilah dan konsep &lsquo;Baristan&rsquo; ini adalah cara Caffino untuk memfasilitasi pecinta kopi agar tetap dapat menikmati segelas kopi berkualitas premium dengan cara membuat sendiri di rumah. Bahkan tanpa harus punya keahlian khusus, dengan menyajikan Caffino maka siapa pun bisa merasakan sensasi membuat segelas kopi dengan kualitas yang tak kalah dengan segelas kopi di kafe.</p>\r\n<p>&ldquo;Baristan atau Barista Kopi Instan sesungguhnya adalah semangat yang kami sebarkan untuk semua pecinta kopi di Indonesia. Siapa saja boleh dan pasti bisa membuat segelas minuman kopi instan yang sama enak seperti kopi di kafe. Setiap varian dari Caffino memiliki keunggulan dari citarasa kopinya yang lebih kuat karena terbuat dari bahan premium yaitu kopi asli dan susu asli. Caffino, khususnya varian Dark Cappucino bisa menjadi pilihan tepat untuk menjadi Barista Kopi Instan dan menikmati kopi berkualitas. Caffino Dark Cappucino ini memiliki tambahan topping granule dari kopi asli,&rdquo; terang Ihsan Mulia Putri selaku CEO PT. Sumber Kopi Prima.</p>\r\n<p>Di kesempatan yang sama, juga turut hadir Muhammad Aga salah satu Barista Profesional, Chef Jerry Andrean yang merupakan Juara MasterChef Indonesia Season 7, hingga selebgram yang kini tengah popular dan juga penikmat kopi yakni Livy Renata. Ketiganya berkesempatan untuk menikmati kreasi kopi Caffino yang nikmat dan berkualitas layaknya ngopi di coffee shop.</p>',1,'2022-08-15 11:27:58','2022-06-03 17:27:40','2022-08-15 11:27:58','source/artikel/polemik-baristan-terkuak-salah-satu-sol-4c2048.jpg'),
(85,1,'Siapapun Bisa Jadi Baristan, Caffino Tawarkan Ngopi Instan di Rumah Senikmat Racikan Ahli','siapapun-bisa-jadi-baristan-caffino-tawarkan-ngopi-instan-di-rumah-senikmat-racikan-ahli','<p>Istilah &lsquo;Baristan&lsquo; jika dibaca sekilas mirip dengan kata &lsquo;Barista&rsquo; atau profesi peracik minuman kopi. Hal ini ramai menjadi perdebatan di media sosial dalam beberapa waktu terakhir.</p>\r\n<p>Nama Baristan sendiri merupakan konsep dan istilah yang diperkenalkan produk kopi instan kemasan dari PT Sumber Kopi Prima atau yang lebih dikenal sebagai Caffino bagi para penikmat kopi di Indonesia yang merupakan akronim dari &lsquo;Barista Kopi Instan&rsquo;.</p>\r\n<p>CEO PT Sumber Kopi Prima, Ihsan Mulia Putri mengatakan, istilah dan konsep &lsquo;Baristan&rsquo; adalah cara Caffino memfasilitasi pecinta kopi agar tetap dapat menikmati segelas kopi berkualitas premium dengan membuatnya sendiri di rumah.</p>\r\n<p>&ldquo;Tanpa harus punya keahlian khusus, dengan Caffino siapapun bisa merasakan sensasi membuat segelas kopi dengan kualitas yang tak kalah dengan kopi di kedai atau kafe favorit,&rdquo; ujarnya pada Konferensi Pers &lsquo;Baristan-Solusi Ngopi Berkualitas di Rumah&rsquo; yang digelar secara daring melalui aplikasi ZoomMeeting, Selasa (22/3/2022).</p>\r\n<p>Ditambahkan Ihsan, konsep dan istilah tersebut awalnya terinspirasi dari minum kopi enak dan berkualitas. Banyak orang ingin minum kopi enak dan berkualitas itu harus ke cafe dan hasil racikan para barista, tapi di situasi pandemi ini kan tidak banyak orang yang bisa keluar rumah apalagi beberapa cafe pun dibatasi.</p>\r\n<p>&ldquo;Karena itu kita keluarkan istilah baristan atau sosok yang ahli meracik kopi instan, sehingga tidak perlu lagi ke kafe namun bisa minum kopi enak melalui Caffino di rumah,&rdquo; tegasnya.</p>\r\n<p>Lebih jauh, Ihsan menerangkan jika semangat &lsquo;Baristan&rsquo; yang diusung Caffino tidak terlepas dari situasi pandemi yang memaksa masyarakat untuk mengurangi aktivitas keluar rumah seperti pergi ke kedai kopi. Menyeduh kopi instan sendiri di rumah dianggap bisa menjadi solusi sekaligus sensasi dalam menikmati kopi. Namun, agar rasanya tidak mengecewakan diperlukan produk kopi instan yang memiliki bahan-bahan premium dan berkualitas.</p>\r\n<p><img class=\"aligncenter wp-image-608\" src=\"https://caffino.id/wp-content/uploads/2022/06/IMG-20220322-WA0031-300x167.jpg\" sizes=\"(max-width: 550px) 100vw, 550px\" srcset=\"https://caffino.id/wp-content/uploads/2022/06/IMG-20220322-WA0031-300x167.jpg 300w, https://caffino.id/wp-content/uploads/2022/06/IMG-20220322-WA0031-1024x570.jpg 1024w, https://caffino.id/wp-content/uploads/2022/06/IMG-20220322-WA0031-768x427.jpg 768w, https://caffino.id/wp-content/uploads/2022/06/IMG-20220322-WA0031-890x496.jpg 890w, https://caffino.id/wp-content/uploads/2022/06/IMG-20220322-WA0031.jpg 1280w\" alt=\"\" width=\"550\" height=\"306\" /></p>\r\n<p>Setiap varian dari Caffino memiliki keunggulan dari cita rasa kopinya yang lebih kuat karena terbuat dari bahan premium yaitu kopi asli dan susu asli. Bahkan untuk yang fanatik dengan cita rasa kopi, varian Caffino Dark Cappucino memiliki tambahan topping granule dari kopi asli. Sehingga dalam setiap sesapan, kopinya akan terasa strong seperti kualitas kopi ala barista di kafe,&rdquo; pungkasnya.</p>\r\n<p>Barista Profesional, Muhammad Aga yang hadir pada sesi konferensi pers pun ikut angkat bicara. Terlepas dari perdebatan yang muncul, minum kopi sudah merupakan budaya yang mengakar di sebagian besar masyarakat Indonesia.</p>\r\n<p>&ldquo;Jadi kalau konsep baristan itu tentang bagaimana menikmati kopi enak, itu tidak masalah. Varian Dark Cappucino yang diluncurkan Caffino pun enak dan bisa dibuat dengan mudah di rumah,&rdquo; kata Aga.</p>\r\n<p>Juara Indonesia Barista Championship 2018 menambahkan, banyak hal dan dampak positif yang terbentuk dari kebiasaan minum kopi, tanpa harus membeda-bedakan tentang pilihan jenis kopi racikan profesional ataupun kopi instan. Untuk menghasilkan minuman kopi yang berkualitas, yang paling utama yakni harus menggunakan bahan-bahan yang juga punya kualitas.</p>\r\n<p>Ini berlaku untuk barista profesional maupun orang awam. &ldquo;Saya melihat Caffino sudah terjamin dari kualitas bahan dasar kopi dan susunya. Jadi orang awam pun bisa punya pilihan dan cara untuk membuat sendiri kopi yang hasilnya juga enak dan berkualitas,&rdquo; kata barista yang juga ikut bermain di film Filosofi Kopi ini.</p>\r\n<p><img class=\"aligncenter wp-image-609\" src=\"https://caffino.id/wp-content/uploads/2022/06/Virtual-Press-Conference-Caffino-1-300x168.jpg\" sizes=\"(max-width: 550px) 100vw, 550px\" srcset=\"https://caffino.id/wp-content/uploads/2022/06/Virtual-Press-Conference-Caffino-1-300x168.jpg 300w, https://caffino.id/wp-content/uploads/2022/06/Virtual-Press-Conference-Caffino-1-768x430.jpg 768w, https://caffino.id/wp-content/uploads/2022/06/Virtual-Press-Conference-Caffino-1-890x496.jpg 890w, https://caffino.id/wp-content/uploads/2022/06/Virtual-Press-Conference-Caffino-1.jpg 1024w\" alt=\"\" width=\"550\" height=\"308\" /></p>\r\n<p>Hal senada juga diungkapkan Juara MasterChef Indonesia Season 7, Chef Jerry Andrean. Dia menyebut kopi sebagai salah satu minuman favorit masyarakat Indonesia yang bisa dinikmati dengan berbagai cara dan kesempatan.</p>\r\n<p>Chef Jerry menilai, kopi instan Caffino bisa menjadi pilihan yang tepat bagi masyarakat untuk membuat sendiri minuman kopi secara mudah tanpa harus kehilangan kualitas yang kerap diidentikkan oleh sajian kopi kafe.</p>\r\n<p>&ldquo;Sama seperti memasak, membuat kopi yang dianggap enak tidak harus selalu dengan metode atau teknik yang rumit. Ada kalanya dengan cara sederhana, kita bisa membuat sajian kopi yang enak. Misalnya dengan kopi Caffino Dark Cappucino, selama suhu dan takaran airnya tepat dan cara menyeduhnya benar, segelas kopi yang dihasilkannya sudah pasti terasa mantap,&rdquo; kata Chef Jerry.</p>\r\n<p>Hal yang sama juga diungkapkan sosok selegram, Livy Renata. Mengaku belum pernah mencoba kopi instan dan terbiasa dengan sajian kopi di kafe, selegram ini langsung &lsquo;jatuh cinta&rsquo; dengan rasa yang ditawarkan kopi Caffino.</p>\r\n<p>&ldquo;Terus terang Livy jarang banget minum kopi instan, kalau minum kopi itu ya biasanya di kafe. Baru tahu sekarang kalau ternyata kopi instan Caffino rasanya bisa seenak ini. Bikinnya juga gampang, Livy juga bisa bikin sendiri dan pasti enak,&rdquo; terangnya sambil tertawa lepas.</p>',1,'2022-08-15 11:29:04','2022-06-06 10:17:47','2022-08-15 11:29:04','source/artikel/IMG-20220322-WA0030.jpg'),
(86,1,'Media Sosial Sempat Heboh Soal Baristan, Ternyata Ini Artinya','media-sosial-sempat-heboh-soal-baristan-ternyata-ini-artinya','<p>Baristan, istilah yang sempat menuai polemik bagi kalangan pecinta&nbsp;kopi&nbsp;di media sosial ternyata memiliki makna dibaliknya. Istilah ini sekilas mirip dengan kata &lsquo;Barista&rsquo;, profesi yang ahli meracik minuman kopi.</p>\r\n<p>Melalui Virtual Press Confference&nbsp;Caffino&nbsp;&ndash; Baristan : Solusi Ngopi Berkualitas Di Rumah via IG Live dan Zoom pada Selasa (22/03/2022) lalu, akhirnya, publik dikenalkan soal &lsquo;Baristan&rsquo; yang merupakan akronim dari &lsquo;Barista Kopi Instan&rsquo;.</p>\r\n<p>Konsep dan istilah &lsquo;Baristan&rsquo; ini diperkenalkan oleh produk kopi instan kemasan dari PT Sumber Kopi Prima, Caffino untuk para penikmat kopi di Indonesia.</p>\r\n<p>CEO PT Sumber Kopi Prima, Ihsan Mulia Putri, mengungkapkan, istilah dan konsep &lsquo;Baristan&rsquo; adalah cara Caffino untuk memfasilitasi pecinta kopi agar dapat menikmati segelas kopi kualitas premium dengan cara membuat sendiri di rumah.</p>\r\n<p>&ldquo;Baristan atau Barista Kopi Instan sesungguhnya adalah semangat yang kami sebarkan untuk semua pecinta kopi di Indonesia. Bahwa siapa saja boleh dan pasti bisa membuat segelas minuman kopi instan yang enak sama seperti kopi di kafe. Caffino, khususnya varian Dark Cappucino bisa menjadi pilihan tepat untuk menjadi Barista Kopi Instan dan menikmati kopi berkualitas,&rdquo; terang Ihsan.</p>\r\n<p>Ihsan menerangkan, semangat &lsquo;Baristan&rsquo; yang diusung Caffino tidak terlepas dari situasi pandemi yang memaksa masyarakat untuk mengurangi aktivitas keluar rumah seperti pergi ke kedai kopi.</p>\r\n<p>Menyeduh kopi instan sendiri di rumah dianggap bisa menjadi solusi sekaligus sensasi dalam menikmati kopi. Namun, agar rasanya tidak mengecewakan diperlukan produk kopi instan yang memiliki bahan-bahan premium dan berkualitas.</p>\r\n<p>&ldquo;Setiap varian dari Caffino memiliki keunggulan dari cita rasa kopinya yang lebih kuat karena terbuat dari bahan premium yaitu kopi asli dan susu asli. Bahkan untuk yang fanatik dengan cita rasa kopi, varian Caffino Dark Cappucino memiliki tambahan topping granule dari kopi asli. Sehingga dalam setiap sesapan, kopinya akan terasa strong seperti kualitas kopi ala barista di kafe,&rdquo; ungkapnya.</p>\r\n<p>Dalam kesempatan yang sama, Barista Profesional Muhammad Aga, menilai, minum kopi merupakan budaya yang sudah mengakar bagi sebagian besar masyarakat Indonesia sejak dulu.</p>\r\n<p>Menurut Juara Indonesia Barista Championship 2018 ini banyak hal dan dampak positif yang terbentuk dari kebiasaan minum kopi, tanpa harus membeda-bedakan tentang pilihan jenis kopi racikan profesional ataupun kopi instan.</p>\r\n<p>&ldquo;Bagi saya, untuk menghasilkan minuman kopi yang berkualitas, utamanya harus menggunakan bahan-bahan yang juga punya kualitas. Ini berlaku untuk barista profesional maupun orang awam. Saya melihat Caffino sudah terjamin dari kualitas bahan dasar kopi dan susunya. Jadi orang awam pun bisa punya pilihan dan cara untuk membuat sendiri kopi yang hasilnya juga enak dan berkualitas,&rdquo; terang sosok yang juga ikut bermain dalam film Filosofi Kopi ini.</p>\r\n<p>Hal senada seperti dengan Juara MasterChef Indonesia Season 7, Chef Jerry Andrean yang menyebut kopi sebagai salah satu minuman favorit masyarakat Indonesia yang bisa dinikmati dengan berbagai cara dan kesempatan.</p>\r\n<p>Kopi instan dari Caffino ini menurut Jerry bisa menjadi pilihan yang tepat bagi masyarakat untuk membuat sendiri minuman kopi secara mudah tanpa harus kehilangan kualitas yang kerap diidentikkan oleh sajian kopi kafe.</p>\r\n<p>&ldquo;Sama seperti memasak, membuat kopi yang dianggap enak tidak harus selalu dengan metode atau teknik yang rumit. Ada kalanya dengan cara sederhana kita pun bisa membuat sajian kopi yang enak,&rdquo; terang Chef Jerry.</p>\r\n<p>Kenikmatan kopi Caffino juga diakui oleh selebgram yang tengah populer dan sekaligus penikmat kopi, Livy Renata. Sosok yang populer karena kepolosan dan gaya hidupnya yang high class ini bahkan mengaku hampir tidak pernah mencicipi kopi instan sepanjang hidupnya. Terbiasa dengan sajian kopi di kafe atau restoran, Livy terkejut ketika pertama kali menyesap kopi Caffino.</p>\r\n<p>&ldquo;Terus terang Livy jarang banget minum kopi instan, Livy kalau minum kopi itu ya biasanya di kafe. Baru tahu sekarang kalau ternyata&nbsp;kopi instan Caffino&nbsp;rasanya bisa seenak ini. Kayaknya kalau gampang begini, Livy juga bisa nih bikin sendiri dan pasti enak. Maybe next time Livy bakal beneran jadi Baristan,&rdquo; ungkapnya tertawa.</p>\r\n<p>Berangkat dari pemahaman atas keinginan konsumen untuk bisa menikmati kopi berkualitas kapan saja dan di mana saja, PT Sumber Kopi Prima dengan Brand Caffino bertekad untuk menghadirkan kopi yang berkualitas dalam bentuk sachet.</p>\r\n<p>Adapun Caffino juga tersedia dalam berbagai varian, serperti kopi latte Classic, kopi latte Mocca dan kopi latte Choco Hazelnut. Kopi latte premium Caffino Bold, kopi dan varian terbaru Caffino Dark Cappuccino dengan topping Kopi Asli bisa menjadi pilihan buat kalian yang menyukai rasa kopi yang kuat.</p>',1,'2022-08-15 11:29:21','2022-06-06 10:37:25','2022-08-15 11:29:21','source/artikel/IMG-20220322-WA0029.jpg'),
(87,1,'Polemik ‘Baristan’ Terkuak, Salah Satu Solusi Menikmati Racikan Kopi di Rumah Saja Selama Masa Pandemi','polemik-baristan-terkuak-salah-satu-solusi-menikmati-racikan-kopi-di-rumah-saja-selama-masa-pandemi','<p>Selama ini, mungkin masih banyak yang beranggapan jika kopi sachetan itu rasanya tidak akan seenak kopi bikinan para barista di kafe-kafe atau kedai kopi. Namun jangan salah, ternyata kalian semua juga bisa jadi seorang Baristan handal loh. Ya, Baristan, sebutan untuk si paling ahli racik kopi instan.</p>\r\n<p>Buat kalian yang belum tahu, istilah &lsquo;Baristan&rsquo; ini sempat juga jadi sebuah perdebatan loh di media sosial. Banyak yang mengira jika istilah ini adalah sebuah typo belaka dari kata &lsquo;Barista&rsquo;. Padahal tidak. Istilah yang diperkenalkan oleh Caffino ini memang punya arti sebagai sosok yang ahli meracik kopi instan.</p>\r\n<p>CEO PT Sumber Kopi Prima, Ihsan Mulia Putri, mengungkapkan, istilah dan konsep &lsquo;Baristan&rsquo; adalah cara Caffino untuk memfasilitasi pecinta kopi agar tetap dapat menikmati segelas kopi berkualitas premium dengan cara membuat sendiri di rumah. Tanpa harus punya keahlian khusus, dengan Caffino siapapun bisa merasakan sensasi membuat segelas kopi dengan kualitas yang tak kalah dengan kopi di kedai atau kafe favorit.</p>\r\n<p>&ldquo;Baristan atau Barista Kopi Instan sesungguhnya adalah semangat yang kami sebarkan untuk semua pecinta kopi di Indonesia. Bahwa siapa saja boleh dan pasti bisa membuat segelas minuman kopi instan yang enak sama seperti kopi di kafe. Caffino, khususnya varian Dark Cappucino bisa menjadi pilihan tepat untuk menjadi Barista Kopi Instan dan menikmati kopi berkualitas,&rdquo; terang Ihsan Mulia Putri dalam Konferensi Pers &lsquo;Baristan &ndash; Solusi Ngopi Berkualitas di Rumah&rsquo; yang digelar daring pada Selasa (22/3).</p>\r\n<p>Lebih jauh, Ihsan menerangkan jika semangat &lsquo;Baristan&rsquo; yang diusung Caffino tidak terlepas dari situasi pandemi yang memaksa masyarakat untuk mengurangi aktivitas keluar rumah seperti pergi ke kedai kopi. Menyeduh kopi instan sendiri di rumah dianggap bisa menjadi solusi sekaligus sensasi dalam menikmati kopi. Namun, agar rasanya tidak mengecewakan diperlukan produk kopi instan yang memiliki bahan-bahan premium dan berkualitas.</p>\r\n<p>&ldquo;Setiap varian dari Caffino memiliki keunggulan dari cita rasa kopinya yang lebih kuat karena terbuat dari bahan premium yaitu kopi asli dan susu asli. Bahkan untuk yang fanatik dengan cita rasa kopi, varian Caffino Dark Cappucino memiliki tambahan topping granule dari kopi asli. Sehingga dalam setiap sesapan, kopinya akan terasa strong seperti kualitas kopi ala barista di kafe,&rdquo; ungkapnya.</p>',1,'2022-08-15 11:29:33','2022-06-06 10:50:22','2022-08-15 11:29:33','source/artikel/polemik-baristan-terkuak-salah-satu-sol-4c2048.jpg'),
(88,1,'Baristan Sebarkan Semangat Pecinta Kopi di Indonesia','baristan-sebarkan-semangat-pecinta-kopi-di-indonesia','<p>Kalangan pecinta&nbsp;kopi&nbsp;di media sosial beberapa waktu lalu dihebohkan perdebatan menanggapi munculnya istilah Baristan. Sekilas mirip dengan kata Barista yang merupakan profesi ahli meracik minuman kopi. Belakangan diketahui Baristan merupakan singkatan dari Barista Kopi Instan.</p>\r\n<p>CEO PT Sumber Kopi Prima, Ihsan Mulia Putri mengatakan Baristan atau Barista Kopi Instan sesungguhnya adalah semangat yang disebarkan untuk semua pecinta kopi di Indonesia.</p>\r\n<p>&ldquo;Sekarang membuat sajian kopi berkualitas yang bisa disuguhkan para pecinta kopi semakin mudah. Caffino, khususnya varian Dark Cappucino bisa menjadi pilihan tepat untuk menjadi Barista Kopi Instan dan menikmati kopi berkualitas,&rdquo; ungkap Ihsan dalam keterangan persnya, Kamis (24/3/2022).</p>\r\n<p>Ditambahkannya, semangat Baristan yang diusung Caffino tidak terlepas dari situasi pandemi yang memaksa masyarakat untuk mengurangi aktivitas keluar rumah seperti pergi ke kedai kopi.</p>\r\n<p>&ldquo;Setiap varian dari Caffino memiliki keunggulan dari cita rasa kopinya yang lebih kuat karena terbuat dari bahan premium yaitu kopi asli dan susu asli. Bahkan untuk yang fanatik dengan cita rasa kopi, varian Caffino Dark Cappucino memiliki tambahan topping granule dari kopi asli. Sehingga dalam setiap sesapan, kopinya akan terasa strong seperti kualitas kopi ala barista di kafe,&rdquo; lanjutnya.</p>\r\n<p>Sedangkan Barista Profesional, Muhammad Aga mengaku minum kopi merupakan budaya yang sudah mengakar bagi sebagian besar masyarakat Indonesia sejak dahulu. Banyak hal dan dampak positif yang terbentuk dari kebiasaan minum kopi, tanpa harus membeda-bedakan tentang pilihan jenis kopi racikan profesional ataupun kopi instan.</p>\r\n<p>&ldquo;Bagi saya, untuk menghasilkan minuman kopi yang berkualitas, utamanya harus menggunakan bahan-bahan yang juga punya kualitas. Ini berlaku untuk barista profesional maupun orang awam. Saya melihat Caffino sudah terjamin dari kualitas bahan dasar kopi dan susunya. Jadi orang awam pun bisa punya pilihan dan cara untuk membuat sendiri kopi yang hasilnya juga enak dan berkualitas,&rdquo; tandasnya.</p>',1,'2022-08-15 11:29:44','2022-06-07 09:43:34','2022-08-15 11:29:44','source/artikel/IMG-20220322-WA0031.jpg'),
(89,1,'Mengenal Profesi Baristan Yang Tengah Ramai Diperdebatkan','mengenal-profesi-baristan-yang-tengah-ramai-diperdebatkan','<p>Beberapa waktu lalu media sosial dihebohkan dengan perdebatan istilah &lsquo;Baristan&rsquo; karena sekilas mirip dengan kata &lsquo;Barista&rsquo; yang merupakan profesi ahli meracik minuman kopi. Belakangan ini baru diketahui bahwa &lsquo;Baristan&rsquo; merupakan akronim dari &lsquo;Barista Kopi Instan&rsquo;. Konsep dan istilah &lsquo;Baristan&rsquo; nyatanya diperkenalkan oleh produk kopi instan kemasan dari PT Sumber Kopi Prima atau yang lebih dikenal sebagai Caffino, untuk para penikmat kopi di Indonesia.</p>\r\n<p>Dalam sebuah konferensi pers, Ihsan Mulia Putri, selaku CEP PT Sumber Kopi Prima, mengutarakan konsep &lsquo;Baristan&rsquo; merupakan cara Caffino untuk mendukung para pecinta kopi agar tetap bisa menikmati secangkir kopi berkualitas premium dengan cara membuatnya sendiri di rumah. Proses membuat secangkir kopi ini pun tidak memerlukan keahlian khusus layaknya Barista pada umumnya.</p>\r\n<p>Semangat &lsquo;Baristan&rsquo; yang diusung oleh Caffino juga menjadi solusi bagi pecinta kopi di tengah situasi pandemi yang membatasi ruang gerak untuk pergi ke kafe dan menyeruput secangkir kopi favorit dalam keadaan segar. Tak perlu lagi melangkahkan kaki keluar dari rumah, cukup membuatnya sendiri di rumah dan secangkir kopi berkualitas premium pun siap untuk dinikmati.</p>\r\n<p>&ldquo;Setiap varian dari Caffino memiliki keunggulan dari cita rasa kopinya yang lebih kuat karena terbuat dari bahan premium yaitu kopi asli dan susu asli. Bahkan untuk yang fanatik dengan cita rasa kopi, varian Caffino Dark Cappucino memiliki tambahan topping granule dari kopi asli. Sehingga dalam setiap sesapan, kopinya akan terasa strong seperti kualitas kopi ala barista di kafe,&rdquo; ungkap Ihsan.</p>\r\n<p>Dalam kesempatan yang sama, turut hadir juga sosok Barista Profesional Muhammad Aga, Chef Jerry Andrean yang merupakan Juara MasterChef Indonesia Season 7, hingga selebgram yang tengah populer dan juga penikmat kopi Livy Renata. Beberapa waktu lalu Muhammad Aga dan Chef Jerry Andrean sempat berdebat sengit di media sosial perihal profesi &lsquo;Baristan&rsquo; ini.</p>\r\n<p>Terlepas dari segala perdebatan ini, keduanya sepakat bahwa kopi merupakan budaya yang sudah mengakar bagi sebagian besar masyarakat Indonesia dan kerap dinikmati dalam setiap kesempatan. Mereka juga sependapat bahwa sebuah kopi berkualitas harus terbuat dari bahan-bahan yang berkualitas baik.</p>\r\n<p>&ldquo;Saya melihat Caffino sudah terjamin dari kualitas bahan dasar kopi dan susunya. Jadi orang awam pun bisa punya pilihan dan cara untuk membuat sendiri kopi yang hasilnya juga enak dan berkualitas,&rdquo; ujar Aga. &ldquo;Sama seperti memasak, membuat kopi yang dianggap enak tidak harus selalu dengan metode atau teknik yang rumit. Ada kalanya dengan cara sederhana kita pun bisa membuat sajian kopi yang enak. Misalnya dengan kopi Caffino Dark Cappucino, selama suhu dan takaran airnya tepat dan cara menyeduhnya benar, maka segelas kopi yang dihasilkannya sudah pasti terasa mantap,&rdquo; tambah Chef Jerry.</p>\r\n<p>Kenikmatan kopi Caffino juga diakui oleh sosok yang tenar di media sosial belakangan ini, Livy Renata. Sosok yang populer karena kepolosan dan gaya hidupnya yang high class ini bahkan mengaku hampir tidak pernah mencicipi kopi instan sepanjang hidupnya. Terbiasa dengan sajian kopi di kafe atau restoran, Livy terkejut ketika pertama kali menyesap kopi Caffino.</p>\r\n<p>&ldquo;Terus terang Livy jarang banget minum kopi instan, Livy kalau minum kopi itu ya biasanya di kafe. Baru tahu sekarang kalau ternyata kopi instan Caffino rasanya bisa seenak ini. Kayaknya kalau gampang begini, Livy juga bisa nih bikin sendiri dan pasti enak. Maybe next time Livy bakal beneran jadi Baristan,&rdquo; ungkapnya tertawa.</p>\r\n<p>Keseruan acara tak berhenti sampai disesi bincang-bincang. Aga, Chef Jerry, dan Livy pun turut mendemokan cara mereka menikmati Caffino Dark Cappuccino. Dimulai dari Chef Jerry yang memperagakan betapa mudahnya untuk membuat Caffino varian original yang cukup diseduh dengan air panas. Diikuti dengan Aga yang membuat Ice Shaken Caffino dan tersaji dengan tampilan manis berkat tambahan edible flower di atasnya. Aga dan Chef Jerry pun turut berkolaborasi menyajikan hidangan Ice Biscoff Caffino dengan mencampurkan biskuit spekulos dengan racikan kopi tersebut. Tak ketinggalan Livy juga memperagakan cara favoritnya dalam menikmati kopi, yakni dengan tambahan whipping cream di atasnya.</p>\r\n<p>Caffino sudah memiliki beberapa varian rasa, seperti Kopi Latte Classic, Kopi Latte Mocca, Kopi Latte Choco Hazelnut, Kopi Latte Premium Caffino Bold bagi pecinta rasa kopi yang kuat, dan varian yang terbaru Caffino Dark Cappuccino dengan topping kopi asli. &ldquo;Kami akan senantiasa untuk terus mengikuti perkembangan zaman agar dapat terus memberikan varian-varian kopi yang lebih menarik bagi konsumen kami dan tentunya dengan cara yang mudah, cukup diseduh saja&rdquo;, tutup Ihsan mengakhiri acara.</p>',1,'2022-08-15 11:30:01','2022-06-07 09:46:48','2022-08-15 11:30:01','source/artikel/IMG-20220322-WA0030.jpg');

/*Table structure for table `e_commerce` */

CREATE TABLE `e_commerce` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `e_commerce` */

/*Table structure for table `failed_jobs` */

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `failed_jobs` */

/*Table structure for table `faq` */

CREATE TABLE `faq` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `index` int(11) DEFAULT NULL,
  `questions` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `faq` */

insert  into `faq`(`id`,`index`,`questions`,`answer`,`created_at`,`updated_at`) values 
(1,1,'Apa itu Caffino?','<p>Caffino adalah kopi latte instant 3 in 1 dengan perpaduan Kopi Asli dan Susu Asli serta gula yang sempurna untuk mengawali harimu yang istimewa.</p>','2022-08-12 14:23:12','2022-08-16 11:10:19'),
(2,2,'Apa yang membedakan Caffino dengan kopi instant lainnya?','<p>Caffino mudah dikenali dari foam latte yang tebal ketika diseduh seperti kopi latte ala Cafe. karena menggunakan Kopi Asli (bukan perisa kopi/flavor) dan Susu Asli (Skim Milk Powder).</p>','2022-08-12 14:28:29','2022-08-16 11:10:17'),
(3,3,'Apakah Caffino mengandung pemanis buatan?','<p>Tidak, Caffino menggunakan Gula asli dan pemanis Alami Steviol.</p>','2022-08-12 14:54:40','2022-08-16 11:10:19'),
(5,4,'Darimana kita dapat mengetahui umur produk Caffino?','<p>Dari tanggal &ldquo;Best before&rdquo; yang tercantum pada kemasan. Untuk kemasan Renteng, tanggal dicantumkan di bagian belakang bungkus/scahet kemasan (dekat barcode). Untuk kemasan Pouch tanggal dicantumkan di bagian belakang kemasan pouch (dekat barcode). Sedangkan untuk kemasan Box, tanggal dicantumkan sebelh kanan box kemasan (dekat barcode).</p>','2022-08-12 15:07:03','2022-08-16 11:10:19'),
(6,5,'Kenapa Caffino tidak boleh disimpan dibawah panas matahari langsung?','<p>Yang tidak disarankan adalah disimpan dibawah sinar matahari langsung karena volume bubuk kopi dalam kemasan akan mengeras.</p>','2022-08-12 15:08:25','2022-08-16 11:10:20'),
(7,6,'Kapan kita harus minum Caffino?','<p>Caffino dapat diminum kapan saja, apapun aktifitasnya; dalam ruangan, luar ruangan, maupun saat bersantai.</p>','2022-08-12 15:09:18','2022-08-16 11:10:20'),
(8,7,'Dimanakah Caffino dapat dibeli?','<p>Caffino dapat di beli di toko-toko terdekat dalam kemasan renteng, di modern market dalam kemasna pouch dan di E-Commerce dalam kemasan box yang ekslusif dengan hadiah menarik.</p>','2022-08-12 15:09:44','2022-08-16 11:10:19');

/*Table structure for table `inboxes` */

CREATE TABLE `inboxes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `inboxes` */

insert  into `inboxes`(`id`,`name`,`email`,`phone`,`subject`,`message`,`read`,`created_at`,`updated_at`) values 
(1,'Shayna Ritchie','Colleen_Stroman@gmail.com','085161111197','test','test',1,'2022-08-10 17:18:27','2022-08-11 11:21:53'),
(2,'Lyric Crona','Imani64@hotmail.com','0812324325954','Temporibus quaerat quaerat beatae impedit excepturi ipsum qui possimus.','Et ipsa pariatur aspernatur quidem tenetur est eveniet maxime. Saepe suscipit repellat eligendi suscipit impedit debitis iusto. Qui perferendis itaque doloremque nobis maxime eligendi autem. Ea inventore eum consequatur saepe et temporibus.\r\n\r\nTemporibus assumenda reiciendis velit deserunt est. Illum a in eveniet voluptate quas impedit repellendus blanditiis. Ut quis esse magni et.\r\n\r\nEt repudiandae sit quo et natus dolor nisi. Doloribus adipisci et voluptatem at eveniet ea unde. Veniam velit qui adipisci omnis perferendis et voluptas.',1,'2022-08-10 17:52:58','2022-08-11 11:31:09'),
(3,'frima','frima@gmail.com','085161111197','Temporibus quaerat quaerat beatae impedit excepturi ipsum qui possimus.','Et ipsa pariatur aspernatur quidem tenetur est eveniet maxime. Saepe suscipit repellat eligendi suscipit impedit debitis iusto. Qui perferendis itaque doloremque nobis maxime eligendi autem. Ea inventore eum consequatur saepe et temporibus.\r\n\r\nEt ipsa pariatur aspernatur quidem tenetur est eveniet maxime. Saepe suscipit repellat eligendi suscipit impedit debitis iusto. Qui perferendis itaque doloremque nobis maxime eligendi autem. Ea inventore eum consequatur saepe et temporibus.\r\n\r\nEt ipsa pariatur aspernatur quidem tenetur est eveniet maxime. Saepe suscipit repellat eligendi suscipit impedit debitis iusto. Qui perferendis itaque doloremque nobis maxime eligendi autem. Ea inventore eum consequatur saepe et temporibus.',1,'2022-08-11 11:34:13','2022-08-11 11:48:10'),
(4,'satria kharisma nagara test saru dua tiga','frimasatria347@gmail.com','085161111197','Et repudiandae sit quo et natus dolor nisi. Doloribus adipisci et voluptatem at eveniet ea unde. Veniam velit qui adipisci omnis perferendis et voluptas.','Et ipsa pariatur aspernatur quidem tenetur est eveniet maxime. Saepe suscipit repellat eligendi suscipit impedit debitis iusto. Qui perferendis itaque doloremque nobis maxime eligendi autem. Ea inventore eum consequatur saepe et temporibus.\r\n\r\nTemporibus assumenda reiciendis velit deserunt est. Illum a in eveniet voluptate quas impedit repellendus blanditiis. Ut quis esse magni et.\r\n\r\nEt repudiandae sit quo et natus dolor nisi. Doloribus adipisci et voluptatem at eveniet ea unde. Veniam velit qui adipisci omnis perferendis et voluptas.',1,'2022-08-11 11:37:42','2022-08-11 11:38:04'),
(5,'frima satria kharisma nagara kharisma nagara','frimasatria347@gmail.com','085161111197','Temporibus quaerat quaerat beatae impedit excepturi ipsum qui possimus.','Et ipsa pariatur aspernatur quidem tenetur est eveniet maxime. Saepe suscipit repellat eligendi suscipit impedit debitis iusto. Qui perferendis itaque doloremque nobis maxime eligendi autem. Ea inventore eum consequatur saepe et temporibus.\r\n\r\nTemporibus assumenda reiciendis velit deserunt est. Illum a in eveniet voluptate quas impedit repellendus blanditiis. Ut quis esse magni et.\r\n\r\nEt repudiandae sit quo et natus dolor nisi. Doloribus adipisci et voluptatem at eveniet ea unde. Veniam velit qui adipisci omnis perferendis et voluptas.',1,'2022-08-11 11:39:05','2022-08-11 11:48:52'),
(6,'frima','admin@admin.com','1234567890123','Temporibus quaerat quaerat beatae impedit excepturi ipsum qui possimus.','test',1,'2022-08-11 11:44:27','2022-08-11 15:03:00');

/*Table structure for table `link_sosmed` */

CREATE TABLE `link_sosmed` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_instagram` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_tiktok` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_facebook` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_youtube` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_twitter` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `link_sosmed` */

insert  into `link_sosmed`(`id`,`link_instagram`,`link_tiktok`,`link_facebook`,`link_youtube`,`link_twitter`,`created_at`,`updated_at`) values 
(1,'https://www.instagram.com/caffino.id/','https://www.tiktok.com/@caffino.id','https://www.facebook.com/caffinobrand','https://www.youtube.com/c/CaffinoID','https://twitter.com/Caffino_ID','2022-08-15 14:16:54','2022-08-15 14:37:52');

/*Table structure for table `migrations` */

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values 
(1,'2014_10_12_000000_create_users_table',1),
(2,'2014_10_12_100000_create_password_resets_table',1),
(3,'2019_08_19_000000_create_failed_jobs_table',1),
(4,'2019_12_14_000001_create_personal_access_tokens_table',1),
(5,'2020_02_25_034148_create_permission_tables',1),
(6,'2020_05_25_021239_create_announcements_table',1),
(7,'2020_05_29_020244_create_password_histories_table',1),
(8,'2020_07_06_215139_create_activity_log_table',1),
(9,'2021_04_05_153840_create_two_factor_authentications_table',1),
(10,'2022_06_10_034418_create_products_table',1),
(11,'2022_06_10_035620_create_product_fakta_nutrisi_table',1),
(12,'2022_06_10_041319_create_product_buy_now_table',1),
(13,'2022_07_01_100508_create_articles_table',1),
(14,'2022_07_20_131114_add_image_in_article_table',1),
(15,'2022_08_03_215141_create_inboxes_table',1),
(16,'2022_08_08_142437_create_faq_table',1),
(17,'2022_08_08_150403_create_pages_table',1),
(18,'2022_08_08_150658_create_page_detail_table',1),
(19,'2022_08_08_172848_create_e_commerce_table',1),
(20,'2022_08_15_141330_create_link_sosmed_table',2);

/*Table structure for table `model_has_permissions` */

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `model_has_permissions` */

/*Table structure for table `model_has_roles` */

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `model_has_roles` */

insert  into `model_has_roles`(`role_id`,`model_type`,`model_id`) values 
(1,'App\\Domains\\Auth\\Models\\User',1);

/*Table structure for table `page_detail` */

CREATE TABLE `page_detail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` bigint(20) unsigned NOT NULL,
  `index` int(11) DEFAULT NULL,
  `code` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lable` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('text','texteditor','textarea','file') COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `page_detail_page_id_foreign` (`page_id`),
  CONSTRAINT `page_detail_page_id_foreign` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `page_detail` */

insert  into `page_detail`(`id`,`page_id`,`index`,`code`,`lable`,`type`,`value`,`created_at`,`updated_at`) values 
(7,3,NULL,'about-us','Tentang Kami','texteditor','<p>Berdiri pada tahun 2018,&nbsp;<strong>PT Sumber Kopi Prima</strong>&nbsp;dengan bangga mempersembahkan produk kopi yang menggabungkan kualitas bahan baku terbaik dengan rasa yang mantap. Semangat untuk menghasilkan kopi terbaik mendorong kami untuk mencari bahan baku dengan kualitas terbaik untuk menciptakan Caffino, kopi instan 3 in 1 dibuat dengan kopi asli dan susu asli.</p>\r\n<p>&nbsp;</p>\r\n<p>Brand Caffino dimulai dari sebuah mimpi bahwa semua orang harus bisa mendapatkan segelas kopi yang paling memuaskan kapanpun mereka mau. Karena itu Caffino hadir untuk mengangkat pengalaman menikmati kopi untuk semua orang, dan kapan saja, karena kopi yang luar biasa menciptakan moment yang luar biasa juga.</p>\r\n<p>&nbsp;</p>\r\n<p>Setiap gelas Caffino dapat dengan mudah dibedakan dari foam tebal nya. Dari sisipan pertama, dapat langsung dirasakan kualitas bahan baku terbaik &ndash; rasa yang authentic yang sebenarnya.</p>\r\n<p>&nbsp;</p>\r\n<p>Caffino datang dengan tiga variants yang menggoda untuk menyenangkan semua pencinta kopi: Kopi Latte Classic , Kopi Latte Choco Hazelnut, dan Kopi Latte Mocca.</p>\r\n<p>&nbsp;</p>\r\n<p>Kami sangat bersemangat untuk seluruh Indonesia dapat menikmati kopi instan 3 in 1 authentic yang sebenarnya , yang layak mereka dapatkan &ndash; Nikmati setiap moment dengan segelas Caffino.</p>','2022-08-11 16:24:06','2022-08-15 17:37:01');

/*Table structure for table `pages` */

CREATE TABLE `pages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `pages` */

insert  into `pages`(`id`,`code`,`label`,`created_at`,`updated_at`) values 
(3,'about-us','Tentang Kami','2022-08-11 16:23:05','2022-08-11 16:23:06');

/*Table structure for table `password_histories` */

CREATE TABLE `password_histories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_histories` */

insert  into `password_histories`(`id`,`model_type`,`model_id`,`password`,`created_at`,`updated_at`) values 
(1,'App\\Domains\\Auth\\Models\\User',1,'$2y$10$LkySaa3yjWmQ3mBsTBemWOV5FLS0maLnYu.ApwPMhryNg0hVESD8.','2022-08-09 15:34:54','2022-08-09 15:34:54'),
(2,'App\\Domains\\Auth\\Models\\User',2,'$2y$10$D2ZMNO3IEPHjuRbaLH9jGulP/bnzfVWca0L9mVSGpzcc8FsT.VSzy','2022-08-09 15:34:54','2022-08-09 15:34:54'),
(3,'App\\Domains\\Auth\\Models\\User',1,'$2y$10$M9Nl2MX8qH4Xm93Q0sM1jOT53eoz2LQNESSQn6pI.gNnboO116Kda','2022-08-10 10:39:39','2022-08-10 10:39:39'),
(4,'App\\Domains\\Auth\\Models\\User',1,'$2y$10$mN8N/T1T5fHRMk7RncjqaOl2SRXafALc4YrBXHuCj8nAKamGGRAtC','2022-08-10 16:14:00','2022-08-10 16:14:00'),
(5,'App\\Domains\\Auth\\Models\\User',1,'$2y$10$5oSU.5n8z5G2KylATW9KvOCwETnfs.XtNv0N1Wiy6NCijykpiSgeu','2022-08-11 10:37:29','2022-08-11 10:37:29'),
(6,'App\\Domains\\Auth\\Models\\User',1,'$2y$10$K2sFZ34hYx5s7ZZ44ULX5.eknazAMlagNeUflyFvb98GZenZ4KiXK','2022-08-11 14:53:51','2022-08-11 14:53:51'),
(7,'App\\Domains\\Auth\\Models\\User',1,'$2y$10$uzfDgP0c2oKr2r0zaVgSp.LNVTjO2tMk8UY5MGFd6hTmDX9yjeb0q','2022-08-11 19:02:31','2022-08-11 19:02:31'),
(8,'App\\Domains\\Auth\\Models\\User',1,'$2y$10$YrWF83uRr3eXWJLuxWCGneWTIuMFNMrnjZHHivB4lWNAZo2VRu.j6','2022-08-12 13:54:39','2022-08-12 13:54:39'),
(9,'App\\Domains\\Auth\\Models\\User',1,'$2y$10$kLrHd7zSScRssm5n/e4FfexFR9j0LJNj3HgIGxGp1CFMMuQqx4LfK','2022-08-15 10:17:51','2022-08-15 10:17:51'),
(10,'App\\Domains\\Auth\\Models\\User',1,'$2y$10$JTeCEM1v42BfXPXeEFS6terhIDj2SFjd.K.gmaX45vpVkIaMoMUc.','2022-08-16 10:52:03','2022-08-16 10:52:03');

/*Table structure for table `password_resets` */

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

/*Table structure for table `permissions` */

CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('admin','user') COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` bigint(20) unsigned DEFAULT NULL,
  `sort` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_parent_id_foreign` (`parent_id`),
  CONSTRAINT `permissions_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `permissions` */

insert  into `permissions`(`id`,`type`,`guard_name`,`name`,`description`,`parent_id`,`sort`,`created_at`,`updated_at`) values 
(1,'admin','web','admin.access.user','All User Permissions',NULL,1,'2022-08-09 15:34:54','2022-08-09 15:34:54'),
(2,'admin','web','admin.access.user.list','View Users',1,1,'2022-08-09 15:34:54','2022-08-09 15:34:54'),
(3,'admin','web','admin.access.user.deactivate','Deactivate Users',1,2,'2022-08-09 15:34:54','2022-08-09 15:34:54'),
(4,'admin','web','admin.access.user.reactivate','Reactivate Users',1,3,'2022-08-09 15:34:55','2022-08-09 15:34:55'),
(5,'admin','web','admin.access.user.clear-session','Clear User Sessions',1,4,'2022-08-09 15:34:55','2022-08-09 15:34:55'),
(6,'admin','web','admin.access.user.impersonate','Impersonate Users',1,5,'2022-08-09 15:34:55','2022-08-09 15:34:55'),
(7,'admin','web','admin.access.user.change-password','Change User Passwords',1,6,'2022-08-09 15:34:55','2022-08-09 15:34:55');

/*Table structure for table `personal_access_tokens` */

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `personal_access_tokens` */

/*Table structure for table `product_buy_now` */

CREATE TABLE `product_buy_now` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_tokped` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_shopee` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_blibli` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_bukalapak` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
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
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
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
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `index` int(11) DEFAULT NULL,
  `brand` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bg_color` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `renteng_reguler` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pouch_reguler` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `published` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `products` */

insert  into `products`(`id`,`index`,`brand`,`name`,`slug`,`icon`,`image`,`bg_color`,`description`,`renteng_reguler`,`pouch_reguler`,`published`,`created_at`,`updated_at`) values 
(1,2,'CAFFINO BOLD','DARK CAPPUCCINO','dark-cappuccino','source/product/dark-cappuccino/CAFFINO-FAMILY-PACK-DARKCAPPU.jpg','source/product/dark-cappuccino/PRODUCT-CAFFINO-DARK-CAPPU.png','#bb9f64','Kopi latte 3 in 1 dengan rasa Dark Cappuccino yang premium. Terbuat dari kopi asli dan susu asli yang berkualitas.\r\n\r\nNikmati Caffino Dark Cappuccino yang pasti rasa kopinya.','Isi/karton: 12 renteng x 10 sachet\r\nUkuran karton: 355 x 255 x 188 mm\r\nNet weight: 25gt/sachet\r\nShelf life: 18 months','Isi/karton: 20 pouch x 6 sachet\r\nUkuran karton: 488 x 270 x 267 mm\r\nNet weight: 25gt/sachet\r\nShelf life: 18 months',0,'2022-08-10 12:44:04','2022-08-12 15:10:59'),
(2,1,'Caffino Bold','PREMIUM LATTE','premium-latte','source/product/premium-latte/CAFFINO-FAMILY-PACK-BOLD.jpg','source/product/premium-latte/PRODUCT-CAFFINO-BOLD.png','#e29541','Kopi latte 3 in 1 dengan rasa Dark Cappuccino yang premium. Terbuat dari kopi asli dan susu asli yang berkualitas.\r\n\r\nNikmati Caffino Dark Cappuccino yang pasti rasa kopinya.','Isi/karton: 12 renteng x 10 sachet\r\nUkuran karton: 355 x 255 x 188 mm\r\nNet weight: 25gt/sachet\r\nShelf life: 18 months','Isi/karton: 20 pouch x 6 sachet\r\nUkuran karton: 488 x 270 x 267 mm\r\nNet weight: 25gt/sachet\r\nShelf life: 18 months',0,'2022-08-10 13:11:01','2022-08-12 15:10:59'),
(3,3,'Caffino','KOPI LATTE CLASSIC','kopi-latte-classic','source/product/kopi-latte-classic/CAFFINO-FAMILY-PACK-CLASSIC.jpg','source/product/kopi-latte-classic/PRODUCT-CAFFINO-CLASSIC.png','#512f2e','Kopi latte 3 in 1 dengan rasa Dark Cappuccino yang premium. Terbuat dari kopi asli dan susu asli yang berkualitas.\r\n\r\nNikmati Caffino Dark Cappuccino yang pasti rasa kopinya.','Isi/karton: 12 renteng x 10 sachet\r\nUkuran karton: 355 x 255 x 188 mm\r\nNet weight: 25gt/sachet\r\nShelf life: 18 months','Isi/karton: 20 pouch x 6 sachet\r\nUkuran karton: 488 x 270 x 267 mm\r\nNet weight: 25gt/sachet\r\nShelf life: 18 months',0,'2022-08-10 13:12:53','2022-08-12 15:10:59'),
(4,4,'Caffino','KOPI LATTE MOCCA','kopi-latte-mocca','source/product/kopi-latte-mocca/CAFFINO-FAMILY-PACK-MOCCA.jpg','source/product/kopi-latte-mocca/PRODUCT-CAFFINO-MOCCA.png','#b7312c','Kopi latte 3 in 1 dengan rasa Dark Cappuccino yang premium. Terbuat dari kopi asli dan susu asli yang berkualitas.\r\n\r\nNikmati Caffino Dark Cappuccino yang pasti rasa kopinya.','Isi/karton: 12 renteng x 10 sachet\r\nUkuran karton: 355 x 255 x 188 mm\r\nNet weight: 25gt/sachet\r\nShelf life: 18 months','Isi/karton: 20 pouch x 6 sachet\r\nUkuran karton: 488 x 270 x 267 mm\r\nNet weight: 25gt/sachet\r\nShelf life: 18 months',0,'2022-08-10 13:14:59','2022-08-12 14:01:43'),
(5,4,'Caffino','KOPI LATTE HAZELNUT','kopi-latte-hazelnut','source/product/kopi-latte-hazelnut/CAFFINO-FAMILY-PACK-HAZELNUT.jpg','source/product/kopi-latte-hazelnut/PRODUCT-CAFFINO-HAZELNUT.png','#317042','Kopi latte 3 in 1 dengan rasa Dark Cappuccino yang premium. Terbuat dari kopi asli dan susu asli yang berkualitas.\r\n\r\nNikmati Caffino Dark Cappuccino yang pasti rasa kopinya.','Isi/karton: 12 renteng x 10 sachet\r\nUkuran karton: 355 x 255 x 188 mm\r\nNet weight: 25gt/sachet\r\nShelf life: 18 months','Isi/karton: 20 pouch x 6 sachet\r\nUkuran karton: 488 x 270 x 267 mm\r\nNet weight: 25gt/sachet\r\nShelf life: 18 months',0,'2022-08-10 13:16:35','2022-08-12 15:10:59');

/*Table structure for table `role_has_permissions` */

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `role_has_permissions` */

/*Table structure for table `roles` */

CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('admin','user') COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `roles` */

insert  into `roles`(`id`,`type`,`name`,`guard_name`,`created_at`,`updated_at`) values 
(1,'admin','Administrator','web','2022-08-09 15:34:54','2022-08-09 15:34:54');

/*Table structure for table `two_factor_authentications` */

CREATE TABLE `two_factor_authentications` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `authenticatable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `authenticatable_id` bigint(20) unsigned NOT NULL,
  `shared_secret` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled_at` timestamp NULL DEFAULT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `digits` tinyint(3) unsigned NOT NULL DEFAULT '6',
  `seconds` tinyint(3) unsigned NOT NULL DEFAULT '30',
  `window` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `algorithm` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sha1',
  `recovery_codes` json DEFAULT NULL,
  `recovery_codes_generated_at` timestamp NULL DEFAULT NULL,
  `safe_devices` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `2fa_auth_type_auth_id_index` (`authenticatable_type`,`authenticatable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `two_factor_authentications` */

/*Table structure for table `users` */

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('admin','user') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password_changed_at` timestamp NULL DEFAULT NULL,
  `active` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `timezone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_login_at` timestamp NULL DEFAULT NULL,
  `last_login_ip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `to_be_logged_out` tinyint(1) NOT NULL DEFAULT '0',
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`type`,`name`,`email`,`email_verified_at`,`password`,`password_changed_at`,`active`,`timezone`,`last_login_at`,`last_login_ip`,`to_be_logged_out`,`provider`,`provider_id`,`remember_token`,`created_at`,`updated_at`,`deleted_at`) values 
(1,'admin','Super Admin','admin@admin.com','2022-08-09 15:34:54','$2y$10$JTeCEM1v42BfXPXeEFS6terhIDj2SFjd.K.gmaX45vpVkIaMoMUc.',NULL,1,'America/New_York','2022-08-16 10:52:03','127.0.0.1',0,NULL,NULL,NULL,'2022-08-09 15:34:54','2022-08-16 10:52:03',NULL),
(2,'user','Test User','user@user.com','2022-08-09 15:34:54','$2y$10$D2ZMNO3IEPHjuRbaLH9jGulP/bnzfVWca0L9mVSGpzcc8FsT.VSzy',NULL,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2022-08-09 15:34:54','2022-08-09 15:34:54',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
