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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `articles` */

insert  into `articles`(`id`,`user_id`,`title`,`slug`,`content`,`is_published`,`published_at`,`created_at`,`updated_at`,`image`) values 
(1,1,'Ipsum ut.','explicabo-fugiat-rerum-dolorem-sequi-minus','<p>Cupiditate nihil aliquam ipsam tempore quas. Cupiditate ut ipsam officiis suscipit est nostrum. Quibusdam necessitatibus et atque sapiente ducimus reiciendis possimus. Similique voluptatem quia ad adipisci exercitationem molestias.</p><p>Debitis assumenda vero libero impedit est aut. Voluptatem molestias consequuntur perspiciatis. Velit dolorum quaerat molestiae.</p><p>Modi eligendi molestias sed et harum molestiae deleniti. Ea ut eos est.</p><p>Omnis itaque recusandae eius magni autem rerum aut. Amet ut vitae et nobis aut voluptate. Nesciunt quam sapiente blanditiis id laboriosam.</p><p>Quibusdam quia expedita ut praesentium. Deleniti cum iste ullam totam. Rerum sint exercitationem quisquam sit sit. Eos quia harum rem dicta aut culpa est.</p>',1,'2022-08-09 15:34:56','2022-08-09 15:34:56','2022-08-09 15:34:56',NULL),
(2,1,'Delectus vel.','velit-quidem-dolores-eaque-iure','<p>Repudiandae iure voluptatibus harum velit ut quis qui. Vero nemo doloribus numquam inventore. Est adipisci odit ipsam excepturi minus. Qui necessitatibus et rerum voluptatem eos.</p><p>Unde deserunt inventore error et quidem est. Facere provident sint eaque excepturi. Voluptatibus magnam a et placeat. Totam et voluptatem architecto porro sint qui voluptas.</p><p>Voluptas consequatur qui dignissimos. Blanditiis nostrum corrupti rerum rerum sunt. Dolorem enim illum quasi. Veniam sit et quisquam saepe eveniet tenetur.</p><p>Officia tempora voluptas laboriosam consequatur non veniam. Id ipsam veniam error. Aliquam culpa excepturi expedita dicta.</p><p>Odit corrupti nisi quam necessitatibus aspernatur qui quam. Adipisci nostrum ut omnis unde. Maiores error quo ea veniam magni vero quisquam perferendis.</p><p>Beatae perspiciatis tenetur quibusdam unde voluptatem non. Nisi excepturi iusto aut rerum ea. Amet minima id est totam deserunt facilis. Et cum voluptatum architecto in quis.</p><p>Est autem inventore dolores. Accusantium unde voluptas non.</p><p>Quisquam dolores quod quidem deserunt eos cum aliquam. Quibusdam facere possimus est sed aut accusamus necessitatibus nihil. Nihil iste velit soluta sequi et ea sequi deserunt.</p><p>Deleniti fuga labore omnis aut. Tempora error eum aperiam aut sunt a. Porro et illo impedit officiis non quas aliquam. Deserunt optio et ut molestias. Delectus numquam dicta eveniet.</p><p>Ex dignissimos dolore dolorum qui nemo facere vero sed. Eum natus tempora voluptas occaecati minus. Voluptates et magnam consequuntur consequuntur.</p>',1,'2022-08-09 15:34:56','2022-08-09 15:34:56','2022-08-09 15:34:56',NULL),
(3,1,'Tempore hic similique est.','qui-vel-nemo-voluptas-cumque-aliquam-eius','<p>Aut quibusdam rerum eos blanditiis. Repudiandae amet iste autem. Ut impedit est doloremque aspernatur fugit incidunt eum.</p><p>Autem dolorem reiciendis ut quo a. Dolore ipsa pariatur perspiciatis quo ut rerum veniam. Recusandae nostrum perferendis labore at porro id. Eveniet corporis corporis dolore eum.</p><p>Est ad vel corporis qui quam fuga culpa. Laboriosam sint repellat nesciunt dicta vitae. Ex excepturi voluptate blanditiis perferendis adipisci quia debitis et. Commodi vitae aut et ut quaerat tenetur.</p><p>Voluptatum veniam deserunt excepturi nisi et cum. Dolorum delectus necessitatibus aut et neque quo occaecati debitis. Totam pariatur nulla repudiandae sapiente. Explicabo sed vel perspiciatis.</p><p>Quidem et expedita sint est. Cum molestiae ullam quia sed. Voluptates in recusandae consequatur ipsam fugit voluptas. Vitae doloremque voluptate quaerat omnis ducimus repellendus adipisci voluptas.</p><p>Officia explicabo blanditiis magni culpa corrupti. Sint dolore reiciendis rerum placeat.</p><p>Illo maxime deleniti sunt sed et voluptate. Qui nihil assumenda qui iste rem. Harum officiis veritatis minus minus.</p><p>Fuga est aliquid aut non laudantium. Odio optio placeat expedita non quas. Ex itaque beatae esse voluptatibus. Reiciendis libero non eaque magni aperiam asperiores.</p><p>Totam sunt ut et unde suscipit esse. Sed qui veritatis consequatur ducimus quod cupiditate fugit. Eveniet accusantium at placeat.</p>',1,'2022-08-09 15:34:56','2022-08-09 15:34:56','2022-08-09 15:34:56',NULL),
(4,1,'Et qui corporis qui porro dolorem repellendus illo.','ut-est-voluptas-labore','<p>Sint illum ipsa laudantium. Est illo ipsum autem iusto sed debitis. Quo suscipit consequuntur ipsum accusantium unde.</p><p>Vitae ex dolor dolore rem nobis sunt. Quos cum explicabo necessitatibus dicta. Maxime numquam rerum quos. Sit harum sit iure nam numquam repellat beatae quibusdam.</p><p>Est aut fugit reiciendis rerum asperiores et. Possimus sint qui dolore rerum ipsa eaque. Ipsa sit reiciendis illo soluta natus quis ut. Accusantium saepe minus nesciunt doloribus unde.</p><p>Quam voluptates eum aut eum ratione. Neque eos natus quia iusto ex. Itaque animi necessitatibus et sit dolor optio aperiam. Et sapiente laboriosam quidem hic.</p><p>Quia non corrupti quis eveniet. Id sunt nihil sint non quibusdam optio. Eius quibusdam fugiat illum sit.</p><p>Perspiciatis totam nihil iusto ratione est voluptatem. Minima quod enim voluptatibus occaecati nostrum ad minus. Nulla nobis debitis et qui repudiandae aperiam sequi.</p><p>Aspernatur et fuga quisquam perferendis a. Esse reiciendis architecto nobis commodi architecto omnis. Doloribus quam quia autem omnis. Corporis est dolores iure in ex aut cupiditate.</p><p>Non ea non et repellendus. Veritatis voluptas cum consequuntur aliquam animi voluptatibus ex.</p><p>Est voluptates similique nihil pariatur. Dolore nostrum non nihil dolor architecto. Recusandae officia mollitia et aspernatur.</p><p>Ad et impedit at modi. Dolorem consequatur velit velit id et. Distinctio ullam voluptates inventore ipsam omnis dolores atque. Ut id ut iure voluptas quis labore doloremque.</p>',1,'2022-08-09 15:34:56','2022-08-09 15:34:56','2022-08-09 15:34:56',NULL),
(5,1,'Temporibus quaerat quaerat beatae impedit excepturi ipsum qui possimus.','esse-eligendi-accusamus-aut-cumque-ipsa','<p>Eum illo non doloremque placeat et reiciendis quia consequatur. Nisi dolorem et consectetur sint enim voluptatem. Sit non quia repellendus saepe optio ut. Architecto veniam in velit quos consequuntur neque sint. Eveniet dolorum numquam qui blanditiis.</p><p>Accusantium asperiores rerum ipsa est cupiditate impedit. Dolore dolores distinctio sapiente dolorem nisi. Aliquid voluptatem in doloremque tempore.</p><p>Ratione quidem repudiandae repellendus excepturi asperiores repellat. Voluptatibus culpa ratione debitis aliquid deleniti dolore optio. Sunt mollitia aperiam qui est sint.</p><p>Et ipsa pariatur aspernatur quidem tenetur est eveniet maxime. Saepe suscipit repellat eligendi suscipit impedit debitis iusto. Qui perferendis itaque doloremque nobis maxime eligendi autem. Ea inventore eum consequatur saepe et temporibus.</p><p>Temporibus assumenda reiciendis velit deserunt est. Illum a in eveniet voluptate quas impedit repellendus blanditiis. Ut quis esse magni et.</p><p>Et repudiandae sit quo et natus dolor nisi. Doloribus adipisci et voluptatem at eveniet ea unde. Veniam velit qui adipisci omnis perferendis et voluptas.</p><p>Est similique iste eligendi magni commodi voluptatem quis labore. Cum quibusdam explicabo facere aut. Dolores iusto molestias voluptate iste aperiam. Aut vero eos reprehenderit eum.</p><p>Eligendi rerum iste deleniti aspernatur velit sit. Soluta excepturi omnis qui quo quis. Quos autem ea soluta iure. Suscipit dolorem sit cumque porro ducimus esse rerum aut.</p><p>Similique delectus ducimus est. Minima et tenetur qui deleniti. Nam et mollitia aut aliquid aut.</p>',1,'2022-08-09 15:34:56','2022-08-09 15:34:56','2022-08-09 15:34:56',NULL),
(6,1,'Expedita officiis.','delectus-voluptas-et-consectetur-blanditiis-modi-omnis','<p>Quod magni similique voluptatem in molestias labore qui. Exercitationem mollitia architecto laborum cum corporis ipsa. Corporis aut omnis voluptates a. Fugit sequi et dolorem et sit nam quisquam.</p><p>Est debitis odio voluptatem autem veniam corporis. Ut qui eaque omnis modi quas doloribus. Quas aut perspiciatis ea architecto corrupti.</p><p>Repellendus voluptatem deleniti nobis. Molestiae voluptas velit harum consequuntur officiis omnis. Similique quasi neque sapiente. Omnis et reiciendis in earum nesciunt illo saepe.</p><p>Aliquid ut unde illum vel libero. Sapiente voluptatem aut iste autem. Veritatis aliquam et sapiente dignissimos qui maxime inventore.</p><p>Quam est quo officia. Porro incidunt quam veniam similique. Doloribus laborum repudiandae nulla quos similique. Sequi nesciunt sed voluptatum vel.</p><p>Omnis mollitia sed rerum. Aliquam voluptatibus et voluptatum cumque. Incidunt non aut distinctio.</p>',1,'2022-08-09 15:34:56','2022-08-09 15:34:56','2022-08-09 15:34:56',NULL),
(7,1,'Numquam non eum consequatur sed aut.','voluptatem-quae-nemo-nisi-veritatis-non-dignissimos-sed-perspiciatis','<p>Fugit nulla est eos enim aliquam architecto non commodi. Exercitationem molestiae ducimus nihil laudantium ea dolor. Quia aperiam quis sed doloremque et sint quaerat. Deserunt sint omnis dolore laboriosam. Atque voluptas iure voluptate perspiciatis.</p><p>Cupiditate asperiores et voluptas voluptatem et est. Ut sit sunt quos mollitia dicta.</p><p>Omnis modi quaerat est odio quidem voluptatem. Quo voluptas veritatis dignissimos ducimus. Qui ipsum doloribus excepturi explicabo voluptas fuga est esse. Voluptas et exercitationem excepturi voluptatem vitae reiciendis in.</p><p>Placeat veniam ipsum similique voluptatem delectus libero. Autem eos distinctio consectetur iste odio. Fugiat earum asperiores cupiditate consectetur non dolores. Esse expedita odio sed voluptatem voluptatem quia debitis.</p><p>Magni nulla sed voluptatem. Officiis distinctio consectetur est vel quia cumque. Voluptas natus illum aspernatur voluptatibus et in tempora. Voluptas ducimus placeat maxime repellat.</p><p>Nostrum officiis aliquam necessitatibus placeat voluptas doloremque eos. Maxime illo molestiae illo. Commodi sunt velit ullam qui qui est velit. Ea consequatur ad reiciendis aut autem rem non et.</p>',1,'2022-08-09 15:34:56','2022-08-09 15:34:56','2022-08-09 15:34:56',NULL),
(8,1,'Qui reprehenderit nostrum.','totam-voluptas-praesentium-qui','<p>Est laboriosam est et consequuntur est alias neque. Libero in eum autem doloribus maxime ipsum. Quos unde distinctio in officiis et voluptas et.</p><p>Hic aut necessitatibus harum tenetur. Autem maiores fugiat et fugit assumenda exercitationem voluptate ut. Voluptas impedit nemo quos consectetur aut possimus in. Voluptatem tenetur quis accusantium rerum sed.</p><p>Consequatur qui quibusdam architecto placeat velit voluptatem. Aliquam labore in voluptas voluptates illum. Consequatur vel beatae saepe doloremque facere quam. Dolorem velit sint a est.</p><p>Impedit laudantium cum facilis in eveniet iusto eveniet. Labore eaque nihil eligendi quia illo incidunt rerum quasi. Dolor eum commodi velit consequuntur neque dolorum neque laboriosam.</p><p>Doloremque ut sed ut eius. Laborum voluptate beatae repellendus rerum quaerat quam soluta voluptate.</p>',1,'2022-08-09 15:34:56','2022-08-09 15:34:56','2022-08-09 15:34:56',NULL),
(9,1,'Est mollitia facilis nam ut dolor nihil corporis tenetur ut.','voluptatem-numquam-et-sequi-nihil-deserunt-in-rerum','<p>Laudantium temporibus ab explicabo nulla ab ab. Sed dolor quaerat fuga magni aut cupiditate iure. Voluptates est architecto sequi impedit nihil et. Consequatur rerum qui tempora sit ut.</p><p>Dignissimos et doloremque illo est aspernatur molestiae. Est expedita qui doloremque adipisci possimus quo. Eum culpa aspernatur eum ducimus adipisci eligendi. Asperiores praesentium rerum sit enim voluptas repellat.</p><p>Dolorum veritatis ut blanditiis est sapiente minima. Labore omnis excepturi dolorum. Quis ut quo aut fugiat eos impedit quia eum. Veniam fugiat incidunt incidunt vero rem beatae optio. Magnam amet porro numquam a inventore qui eligendi.</p><p>Suscipit voluptas voluptatem sunt cumque pariatur tempora ipsa. Accusantium eligendi amet qui libero. Voluptatem quisquam eligendi consequuntur et est. Earum suscipit est ea explicabo illo. Dolor vel doloribus vel natus sit magni qui.</p><p>Neque similique rerum quod itaque saepe. Et et eius occaecati et praesentium qui quia. Quae veritatis fuga nam perferendis non rerum doloribus. Tenetur provident nobis nemo non odit voluptas sunt.</p><p>Ut blanditiis ex natus eos fugit qui vitae. Culpa ratione reiciendis culpa aut quam.</p>',1,'2022-08-09 15:34:56','2022-08-09 15:34:56','2022-08-09 15:34:56',NULL),
(10,1,'Fugit rerum ut eaque minus cumque saepe.','et-quasi-inventore-rerum-cupiditate-explicabo','<p>Id quibusdam voluptatem necessitatibus sit adipisci. Nobis corrupti et et numquam rem. Ex eius est ut sit occaecati.</p><p>Sunt ut non est ut. Consequuntur nisi quia adipisci harum et asperiores ut. Reiciendis quae nisi sit consectetur. Nobis rerum magnam illo animi deserunt fuga aperiam.</p><p>Illo ut autem et laborum voluptatem totam aut. Dolore et illum ea modi laudantium fugit. Soluta dignissimos qui vel quas. Porro ad dolore aut voluptas.</p><p>Molestiae delectus eius recusandae. Aut quasi amet sit. Expedita vel fugiat dignissimos fugit nihil voluptas.</p><p>Debitis quas blanditiis hic. Illum corrupti reiciendis nihil nesciunt numquam ut. Aspernatur eos quaerat et beatae aut maxime laborum voluptatibus. Quod illo et et porro eius qui.</p>',1,'2022-08-09 15:34:56','2022-08-09 15:34:56','2022-08-09 15:34:56',NULL),
(11,1,'Nam sed neque.','magnam-suscipit-deserunt-facere-quasi-et-omnis-nesciunt','<p>Facilis delectus omnis velit consequatur velit velit rerum. Nihil sed placeat labore. Incidunt id velit quia. Pariatur qui praesentium fugiat exercitationem sed.</p><p>Hic nesciunt dolore error magni. Veritatis aperiam sunt autem praesentium qui deleniti enim.</p><p>Necessitatibus molestias aspernatur officiis veritatis. Dolorem deserunt nihil temporibus. Iure enim qui eaque adipisci ut. Distinctio est ut nihil est veniam doloribus.</p><p>Eveniet sed qui error. Dolorem nulla et corporis in. Libero numquam voluptatem cupiditate aperiam fugit. Omnis eveniet et quia saepe exercitationem doloremque cumque.</p><p>Debitis ut fugiat optio harum quod rem. Quas et odit qui modi nobis illum. Ut quia aut et dolores molestiae est architecto.</p><p>Magni incidunt inventore maxime iusto sed. Eligendi tempore reprehenderit inventore illo velit. Consequatur cupiditate rerum natus non. Voluptatum esse quia consequatur qui aut.</p><p>Autem dolor veritatis repudiandae aut id. Et nostrum id nulla. Voluptatem perferendis aliquam mollitia id.</p>',1,'2022-08-09 15:34:56','2022-08-09 15:34:56','2022-08-09 15:34:56',NULL),
(12,1,'Qui quia aliquid eum porro possimus nulla.','minima-asperiores-quisquam-qui-sunt','<p>Nostrum nihil animi modi illum ullam. Iusto illo quos qui ad alias. Aut vitae delectus sapiente consequatur repellendus sapiente. Voluptas perferendis necessitatibus voluptatum et.</p><p>Nam ea quos et est accusamus inventore similique. Quia aliquid alias illo.</p><p>Nostrum eos repellat debitis. Provident id sint consequatur ea quis soluta sunt. Est perferendis itaque nisi et. Pariatur velit distinctio ad perspiciatis eligendi qui corrupti id.</p><p>Voluptas ut adipisci nesciunt qui sint. Ducimus et voluptatem ducimus dolores omnis velit dolores. Facilis fugiat facilis non rerum perferendis adipisci nihil aliquam. Exercitationem natus natus autem ab.</p><p>Porro magni provident quia delectus dolorum quia doloribus. Nostrum voluptatibus ab voluptas voluptatum voluptatum deserunt.</p><p>Aliquid cumque cum non ut. Qui natus perspiciatis incidunt saepe dolorem quis est. Nisi accusantium est fugiat voluptates.</p><p>Numquam quod numquam sed occaecati natus id. Molestiae voluptatem et autem sint sint. Culpa ipsa sapiente libero commodi a dicta et.</p><p>Est eum et perferendis autem eius voluptas veritatis sed. Aut repellat nihil molestiae.</p><p>Exercitationem architecto cum sed consequatur illum. Vel eius deserunt praesentium. Soluta quaerat sapiente quo quidem sed est. Nam repudiandae delectus voluptatibus velit.</p>',1,'2022-08-09 15:34:56','2022-08-09 15:34:56','2022-08-09 15:34:56',NULL),
(13,1,'Natus nostrum non dolorem eos commodi.','voluptatibus-voluptatem-excepturi-distinctio-ut-quibusdam-dolorem','<p>Et officia vel consequatur eligendi dolore minus accusantium. Consectetur eum voluptatibus dolorem id. Eos sapiente asperiores est veritatis hic laboriosam. Voluptates mollitia vel magnam quia perspiciatis aut omnis.</p><p>Sed consequatur assumenda officia omnis numquam eum. Doloremque architecto dolorem pariatur ut incidunt quaerat velit iste. Itaque iure dolore alias maxime dolore ipsam est.</p><p>Distinctio consequuntur quis saepe commodi vitae placeat odit sit. Qui unde quam repellat et et aliquid. Sit vitae magnam quia vitae enim dolor. Dolorum ab aut odio officiis ipsa. Velit consectetur dolorem eos atque aspernatur inventore sit.</p><p>Ea non praesentium voluptates omnis. Aspernatur aliquid dolorum labore debitis nemo aspernatur qui. Ab et aut nisi et laborum fugiat. Laudantium veritatis et vel sint.</p><p>Animi totam soluta dolores est eum sunt quidem temporibus. Nesciunt ipsum non dolorem perferendis. Et et nobis et illo quaerat ex illo. Illo aspernatur quas sit qui nam.</p>',1,'2022-08-09 15:34:56','2022-08-09 15:34:56','2022-08-09 15:34:56',NULL),
(14,1,'Sint quia quo.','dolor-assumenda-maiores-recusandae-ut-ea','<p>Saepe ut vitae voluptatem consequatur ipsa nihil. Soluta ea est earum qui sint. Eligendi vel in asperiores neque. Necessitatibus assumenda vitae id et.</p><p>Illo libero et et. Assumenda enim commodi praesentium. Inventore occaecati totam reiciendis hic. Ut aut voluptate ut rem.</p><p>Soluta quia veniam explicabo aspernatur vel rerum doloribus voluptatem. Eum ratione quam molestiae atque. Excepturi ipsum odit error qui sunt quod dignissimos quos. Et est rerum nostrum consequuntur minus.</p><p>Assumenda sed vel voluptatum adipisci sed. Et qui sed placeat et accusantium aut totam nulla. Dolor a et eos ut rem.</p><p>Accusantium sequi ab dolores. Qui harum veritatis deserunt facilis iure ducimus ex quis. Pariatur doloremque eligendi ut sed iusto tempore sit. Consequatur cum nemo fugiat.</p><p>Ipsam officiis voluptates quia asperiores est. Architecto quas inventore corrupti eaque quibusdam nostrum dolores. Ullam et velit rerum dolorem ut aspernatur.</p>',1,'2022-08-09 15:34:56','2022-08-09 15:34:56','2022-08-09 15:34:56',NULL),
(15,1,'Neque sint nemo alias amet voluptas tenetur.','quos-non-eum-dignissimos-id','<p>Accusamus impedit exercitationem et sunt qui dolorem. Esse voluptas velit sunt totam beatae tempore. Quidem dignissimos ut est voluptas nisi quibusdam.</p><p>Voluptas explicabo dolore sed omnis nostrum. Magni et voluptate dolor minus reiciendis et voluptatem. Voluptatem quos qui est eos.</p><p>A adipisci odio voluptatibus eos dicta quia. Id velit ut aut sed suscipit sed nostrum et. Sequi sequi voluptatem maiores quas qui. Nemo cum magni officia necessitatibus dolores.</p><p>Ullam exercitationem veritatis cumque et sit necessitatibus in. Cum quam iure sed sed et. Sit et voluptate et fugiat.</p><p>Officia consequatur consequatur eum numquam ut odio modi distinctio. Quas ut nisi provident nulla. Quia enim autem pariatur aut. Itaque sit et rerum sint et.</p><p>Voluptas tenetur dignissimos itaque ut eaque. Unde dolor officia ex iste eius placeat sunt voluptates. Impedit dolorem error facilis omnis eaque molestias nihil eum. Quaerat voluptas tenetur sint quis aliquid fuga ullam.</p><p>Voluptatem sint sit ut itaque. Et consequuntur facere voluptatem quo. Necessitatibus sint eaque culpa et dolor ipsa. Aliquam recusandae neque voluptatem molestias voluptatem voluptate.</p><p>Aut quasi accusantium numquam ut quibusdam aperiam. Saepe in vero et officiis explicabo asperiores optio. Aperiam quisquam alias consequatur ut qui porro totam. Sunt commodi odit debitis corporis aliquam. Nam at ipsam non accusantium mollitia.</p><p>Facere vitae animi dolore vitae at ipsa. Similique atque architecto quaerat quasi. Sunt et natus voluptatem dolor sint. Eius error vero sint minima.</p><p>Fugit sit sed ut eaque non. Voluptatem necessitatibus quidem reiciendis laboriosam et. In aspernatur voluptatem sunt consequatur.</p>',1,'2022-08-09 15:34:56','2022-08-09 15:34:56','2022-08-09 15:34:56',NULL),
(16,1,'Eius id nulla quasi ad aliquid.','fuga-unde-maiores-vitae-similique-nam-et-voluptas','<p>Velit expedita quasi eveniet soluta. Aut autem minima cupiditate beatae ea sed cumque doloribus. Possimus repellat labore perspiciatis tenetur exercitationem vitae aut aut.</p><p>Nam ut debitis quam quaerat ad facilis. Quas velit omnis dolor reprehenderit illum quisquam excepturi. Consequatur velit delectus aut voluptas dolorum neque quidem.</p><p>Sunt et qui vel. Numquam iure molestias officia aliquid. Asperiores cum est corrupti porro.</p><p>Natus excepturi dolorem molestiae numquam esse. Velit voluptas facere animi libero numquam. Voluptatibus sequi autem dolores. Laudantium enim eum aliquam consectetur saepe veniam eum labore.</p><p>Doloremque qui voluptatem expedita eius dicta nulla. Quis commodi illo libero quod sit. Ut consequuntur dolorem necessitatibus totam nostrum voluptatibus suscipit. Similique sint ducimus dolores ullam sed maxime.</p><p>Veniam fugiat vitae occaecati et quia ut. Dolor sed mollitia quia veritatis odit vero maxime. Veritatis modi placeat est necessitatibus doloremque soluta ipsam. Occaecati tenetur voluptatem repudiandae consequatur iste assumenda eligendi.</p><p>Quia facilis et est. Et corporis quae minima nihil qui amet. Exercitationem esse est sapiente occaecati eius maxime.</p>',1,'2022-08-09 15:34:56','2022-08-09 15:34:56','2022-08-09 15:34:56',NULL),
(18,1,'Quis nesciunt dolore ducimus.','cum-molestiae-consequuntur-dolorum-et-qui-rerum','<p>Harum ab illum nostrum quod ea voluptates. Dolorem ut nemo iure. Molestiae blanditiis iste ullam explicabo praesentium odio mollitia.</p><p>Doloremque rem et qui amet saepe fuga. Fugiat minima odit repellendus porro tempore commodi. Voluptas possimus repellat non provident. Qui voluptas dolores et et nihil omnis et ea.</p><p>Est ut asperiores reiciendis aspernatur id dignissimos. Ipsam provident autem officia consequuntur vero maxime nihil quisquam. Est tempore qui ut rerum porro debitis. A reiciendis autem dolorem omnis ex molestiae necessitatibus.</p><p>Occaecati voluptas vel est voluptates fuga numquam iure. Explicabo libero et eligendi fuga rem. Eligendi consequuntur rerum eos consequuntur aliquid provident. Id sequi et quod quod.</p><p>Modi quis at voluptatem. Sit mollitia eius vitae voluptates natus facilis non. Voluptate consequuntur qui error fugiat consectetur. Excepturi dicta voluptas recusandae qui reiciendis.</p><p>Nulla qui nesciunt voluptas quam laboriosam. Provident aspernatur explicabo rerum voluptas reiciendis non. Aperiam odit iure sequi et et velit nihil occaecati. Possimus aut quod perspiciatis corrupti est. Voluptatum dolorum error quia.</p><p>Quod voluptas rem vel dolorem. Quia nam non commodi et quia sapiente quia dolorem. Quaerat magnam est et amet.</p>',1,'2022-08-09 15:34:56','2022-08-09 15:34:57','2022-08-09 15:34:57',NULL),
(19,1,'Ut dolorem quia eius.','expedita-harum-doloribus-dolor-accusamus-sunt-doloremque-non','<p>Voluptatem similique architecto repellendus iste impedit facilis voluptates. Et quam eos consequatur. Et quisquam maiores voluptates consequatur et at.</p><p>Non unde cum exercitationem ut et. Possimus repellendus autem sequi distinctio nemo. Corrupti mollitia eius repellendus et. Voluptatum repellendus mollitia quidem voluptatibus.</p><p>Exercitationem omnis mollitia et. Quis reiciendis omnis voluptatem inventore sequi. Labore ducimus nostrum fugit soluta enim doloremque et. Earum omnis voluptas enim consequatur quis.</p><p>Saepe ea quas aut non et iure molestiae. Nam sunt quos deserunt. Consequatur qui totam aut veritatis temporibus fuga.</p><p>Ipsam aut recusandae quis ut. Dolorem rerum aut numquam quos. Ut voluptas et tempora optio excepturi blanditiis officia rerum. Doloremque qui rem aut nostrum voluptates et.</p><p>Ratione ea inventore qui in velit dolore in. Quia eius aut dolores optio quaerat. Iusto non et ad sint voluptatem. Cumque id sed rem totam vel voluptatem cumque suscipit.</p><p>Ex id omnis dolorum. Accusantium eum quae autem dolorem sunt eveniet qui. Aut ut cupiditate voluptatibus sit repudiandae harum qui.</p><p>Vel quaerat odit perferendis et soluta expedita non. Eveniet minus cumque minima ipsam dolorum earum molestias. Aut aut minus facilis numquam eveniet dolor voluptates. Quia laboriosam expedita maiores expedita.</p>',1,'2022-08-09 15:34:56','2022-08-09 15:34:57','2022-08-09 15:34:57',NULL),
(20,1,'Eaque iure excepturi dolores sit est.','soluta-dolor-magnam-ut-autem-molestiae-enim-id','<p>A veniam et necessitatibus dolorum esse nisi dolores deserunt. Minima sunt voluptatem ea ducimus qui et. Voluptatibus excepturi sequi nisi ut. Consequatur qui sapiente natus deserunt culpa tempore velit.</p><p>Voluptatem et consequatur sunt magni commodi corrupti voluptatem et. Eum non quas sed exercitationem. Quas consequatur velit omnis.</p><p>Rerum dignissimos sit rem voluptas. Sit ratione esse soluta ipsam exercitationem rerum. Facilis repellat id quia voluptas ipsum pariatur.</p><p>Animi id delectus debitis. Laudantium eius neque doloremque iusto sint quas necessitatibus quas. Laborum a iste dolorem est explicabo quasi. Tempora magnam nihil est laborum maiores.</p><p>Quas ut et deserunt asperiores in voluptate. Ad commodi ex dolorem accusantium id. Ut exercitationem itaque dolorem vel voluptas non similique.</p><p>Vel voluptatibus iure est illum quis. Perspiciatis quae repudiandae perferendis ut qui voluptas. Alias non quaerat sint aut ipsum. Rerum sint qui consequatur.</p><p>Magnam iure earum ad ut optio. Assumenda sint tempore doloremque inventore dolorem ut consequatur deserunt. Et sint doloremque voluptatem. Assumenda perspiciatis quasi omnis atque harum quaerat. Soluta quos sit dolor aut earum aperiam quaerat.</p>',1,'2022-08-09 15:34:56','2022-08-09 15:34:57','2022-08-09 15:34:57',NULL);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `faq` */

/*Table structure for table `inboxes` */

CREATE TABLE `inboxes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `inboxes` */

/*Table structure for table `migrations` */

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(19,'2022_08_08_172848_create_e_commerce_table',1);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `page_detail` */

/*Table structure for table `pages` */

CREATE TABLE `pages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `pages` */

/*Table structure for table `password_histories` */

CREATE TABLE `password_histories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_histories` */

insert  into `password_histories`(`id`,`model_type`,`model_id`,`password`,`created_at`,`updated_at`) values 
(1,'App\\Domains\\Auth\\Models\\User',1,'$2y$10$LkySaa3yjWmQ3mBsTBemWOV5FLS0maLnYu.ApwPMhryNg0hVESD8.','2022-08-09 15:34:54','2022-08-09 15:34:54'),
(2,'App\\Domains\\Auth\\Models\\User',2,'$2y$10$D2ZMNO3IEPHjuRbaLH9jGulP/bnzfVWca0L9mVSGpzcc8FsT.VSzy','2022-08-09 15:34:54','2022-08-09 15:34:54'),
(3,'App\\Domains\\Auth\\Models\\User',1,'$2y$10$M9Nl2MX8qH4Xm93Q0sM1jOT53eoz2LQNESSQn6pI.gNnboO116Kda','2022-08-10 10:39:39','2022-08-10 10:39:39');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `product_buy_now` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `product_fakta_nutrisi` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `products` */

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
(1,'admin','Super Admin','admin@admin.com','2022-08-09 15:34:54','$2y$10$M9Nl2MX8qH4Xm93Q0sM1jOT53eoz2LQNESSQn6pI.gNnboO116Kda',NULL,1,'America/New_York','2022-08-10 10:39:39','127.0.0.1',0,NULL,NULL,NULL,'2022-08-09 15:34:54','2022-08-10 10:39:39',NULL),
(2,'user','Test User','user@user.com','2022-08-09 15:34:54','$2y$10$D2ZMNO3IEPHjuRbaLH9jGulP/bnzfVWca0L9mVSGpzcc8FsT.VSzy',NULL,1,NULL,NULL,NULL,0,NULL,NULL,NULL,'2022-08-09 15:34:54','2022-08-09 15:34:54',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
