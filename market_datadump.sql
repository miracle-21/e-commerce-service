-- MySQL dump 10.13  Distrib 8.0.31, for Linux (x86_64)
--
-- Host: localhost    Database: market
-- ------------------------------------------------------
-- Server version	8.0.31-0ubuntu0.20.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `modified_at` datetime(6) NOT NULL,
  `count` int NOT NULL,
  `price` decimal(13,2) NOT NULL,
  `product_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_product_id_508e72da_fk_products_id` (`product_id`),
  KEY `cart_user_id_1361a739_fk_users_id` (`user_id`),
  CONSTRAINT `cart_product_id_508e72da_fk_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `cart_user_id_1361a739_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'contenttypes','contenttype'),(11,'payments','cart'),(10,'payments','like'),(9,'payments','payment'),(7,'payments','review'),(8,'payments','reviewimage'),(4,'products','product'),(6,'products','productdetail'),(5,'products','productimage'),(2,'sessions','session'),(3,'users','user');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-09-11 22:32:02.142628'),(2,'contenttypes','0002_remove_content_type_name','2022-09-11 22:32:02.364935'),(3,'users','0001_initial','2022-09-11 22:32:02.497063'),(4,'products','0001_initial','2022-09-11 22:32:03.161933'),(5,'payments','0001_initial','2022-09-11 22:32:05.821170'),(6,'sessions','0001_initial','2022-09-11 22:32:06.001180'),(7,'products','0002_alter_product_delivery_info','2022-09-13 16:49:05.860408'),(8,'users','0002_alter_user_role','2022-09-13 16:49:05.914470'),(9,'payments','0002_remove_payment_method','2022-09-14 13:17:47.380842'),(10,'users','0003_user_credit','2022-09-14 13:17:47.533581'),(11,'payments','0003_payment_count_alter_payment_status','2022-09-14 22:13:44.783631'),(12,'payments','0004_alter_payment_count','2022-09-14 22:16:50.774428');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `like`
--

DROP TABLE IF EXISTS `like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `like` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `modified_at` datetime(6) NOT NULL,
  `product_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `like_product_id_f10b2bbc_fk_products_id` (`product_id`),
  KEY `like_user_id_318aef4d_fk_users_id` (`user_id`),
  CONSTRAINT `like_product_id_f10b2bbc_fk_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `like_user_id_318aef4d_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `like`
--

LOCK TABLES `like` WRITE;
/*!40000 ALTER TABLE `like` DISABLE KEYS */;
/*!40000 ALTER TABLE `like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `modified_at` datetime(6) NOT NULL,
  `price` decimal(13,2) NOT NULL,
  `orderer` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `address` varchar(300) COLLATE utf8mb4_general_ci NOT NULL,
  `status` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `product_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `count` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `payments_product_id_7afb07c2_fk_products_id` (`product_id`),
  KEY `payments_user_id_189b9948_fk_users_id` (`user_id`),
  CONSTRAINT `payments_product_id_7afb07c2_fk_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `payments_user_id_189b9948_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,'2022-09-14 13:56:47.949675','2022-09-14 21:35:51.209964',39800.00,'minha2','010-9999-9999','서울특별시 영등포구 국제금융로','결제완료',11,2,2),(7,'2022-10-28 15:25:12.489247','2022-10-28 15:30:39.496043',84500.00,'minha2','010-7777-7777','서울특별시 영등포구 국제금융로','배송중',15,2,5),(8,'2022-10-28 15:31:18.955182','2022-10-28 15:31:33.046844',13900.00,'minha2','010-222-2222','서울특별시 영등포구 국제금융로','배송중',13,2,1);
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_details`
--

DROP TABLE IF EXISTS `product_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_details` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(300) COLLATE utf8mb4_general_ci NOT NULL,
  `price` decimal(13,2) NOT NULL,
  `count` int NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_details_product_id_ba410f7b_fk_products_id` (`product_id`),
  CONSTRAINT `product_details_product_id_ba410f7b_fk_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_details`
--

LOCK TABLES `product_details` WRITE;
/*!40000 ALTER TABLE `product_details` DISABLE KEYS */;
INSERT INTO `product_details` VALUES (3,'옥수수 1kg',19900.00,48,11),(4,'감자 3kg',11000.00,100,12),(5,'고구마 5kg',13900.00,28,13),(6,'옥수수 1kg',19900.00,49,14),(7,'감자 2kg',16900.00,45,15);
/*!40000 ALTER TABLE `product_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_images`
--

DROP TABLE IF EXISTS `product_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_images` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `main_img` varchar(1000) COLLATE utf8mb4_general_ci NOT NULL,
  `detail_img` varchar(1000) COLLATE utf8mb4_general_ci NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_images_product_id_28ebf5f0_fk_products_id` (`product_id`),
  CONSTRAINT `product_images_product_id_28ebf5f0_fk_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_images`
--

LOCK TABLES `product_images` WRITE;
/*!40000 ALTER TABLE `product_images` DISABLE KEYS */;
INSERT INTO `product_images` VALUES (8,'https://images.unsplash.com/photo-1531171000775-75f0213ca8a0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Y29ybnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=400&q=60','https://images.unsplash.com/photo-1634467524884-897d0af5e104?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Y29ybnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=400&q=60',11),(9,'https://images.unsplash.com/photo-1561635741-c416a5193b6e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cG90YXRvfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60','https://images.unsplash.com/photo-1590165482129-1b8b27698780?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cG90YXRvfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',12),(10,'https://media.istockphoto.com/photos/the-sweet-potato-or-sweetpotato-is-a-dicotyledonous-plant-that-to-picture-id1279926570?b=1&k=20&m=1279926570&s=170667a&w=0&h=2vWNUyt6lAsupSHK-YSVFwQDdgf8DqbiGi07CEGNuOc=','https://media.istockphoto.com/photos/sweet-potatoes-picture-id689993544?b=1&k=20&m=689993544&s=170667a&w=0&h=wLWbLet5TYcjzrxnyNeJzxJQNMJy8pJNIne0cRI1uek=',13),(11,'https://images.unsplash.com/photo-1531171000775-75f0213ca8a0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Y29ybnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=400&q=60','https://images.unsplash.com/photo-1634467524884-897d0af5e104?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Y29ybnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=400&q=60',14),(12,'https://cdn.pixabay.com/photo/2016/09/01/19/30/potatoes-1637280_960_720.jpg','https://cdn.pixabay.com/photo/2017/07/27/01/09/potatoes-2543686_960_720.jpg',15);
/*!40000 ALTER TABLE `product_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `modified_at` datetime(6) NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `made` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `delivery_mothod` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `delivery_charge` decimal(13,2) DEFAULT NULL,
  `delivery_info` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (11,'2022-09-13 17:31:40.584053','2022-10-28 14:30:35.110127','옥수수','강원도','택배',3500.00,NULL),(12,'2022-09-13 17:50:12.770252','2022-09-13 17:50:12.770281','감자','강원도','택배',0.00,NULL),(13,'2022-09-13 18:03:06.640831','2022-09-13 18:03:06.640866','고구마','해남','택배',3500.00,NULL),(14,'2022-09-13 21:55:15.032855','2022-10-28 14:30:56.317634','냉동찰옥수수','곡성','택배',0.00,NULL),(15,'2022-10-28 14:33:48.375120','2022-10-28 14:33:48.375149','왕감자','강원도','택배',0.00,NULL);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_images`
--

DROP TABLE IF EXISTS `review_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_images` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `modified_at` datetime(6) NOT NULL,
  `img` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `product_id` bigint NOT NULL,
  `review_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `review_images_product_id_3a978a16_fk_products_id` (`product_id`),
  KEY `review_images_review_id_9c7a1455_fk_reviews_id` (`review_id`),
  KEY `review_images_user_id_871e5cfa_fk_users_id` (`user_id`),
  CONSTRAINT `review_images_product_id_3a978a16_fk_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `review_images_review_id_9c7a1455_fk_reviews_id` FOREIGN KEY (`review_id`) REFERENCES `reviews` (`id`),
  CONSTRAINT `review_images_user_id_871e5cfa_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_images`
--

LOCK TABLES `review_images` WRITE;
/*!40000 ALTER TABLE `review_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `modified_at` datetime(6) NOT NULL,
  `content` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `product_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `reviews_product_id_d4b78cfe_fk_products_id` (`product_id`),
  KEY `reviews_user_id_c23b0903_fk_users_id` (`user_id`),
  CONSTRAINT `reviews_product_id_d4b78cfe_fk_products_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `reviews_user_id_c23b0903_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `modified_at` datetime(6) NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `passwd` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `address` varchar(300) COLLATE utf8mb4_general_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sex` tinyint(1) NOT NULL,
  `role` tinyint(1) NOT NULL,
  `credit` decimal(13,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'2022-09-11 23:37:30.078146','2022-09-15 00:14:43.877248','minha1','minha1@google.com','$2b$12$li8/S1rp7ozeQvE/6QVyn.dYWq9CgkBl5uR/6UtQMr0F5htILeecG','서울특별시 중구 동호로','010-123-2222',1,0,132000.00),(2,'2022-09-11 23:39:57.895479','2022-10-28 15:31:18.984822','minha2','minha2@google.com','$2b$12$QNleLUOrmPtt9ca/WuEvAuRc6j440SPAfTCiTnOqLUQlra61QGegW','서울특별시 영등포구 국제금융로','010-222-2222',0,1,846600.00),(3,'2022-09-13 13:39:21.862195','2022-09-13 14:59:52.918118','관리자1','manager1@naver.com','$2b$12$MMTIziw6SyT.WrU/fUei3uuIc4ifia/9XtTaW5FXUgDeSHEosvzZm','부산 해운대구 해운대해변로','010-522-6331',0,0,0.00),(5,'2022-09-13 14:30:23.355492','2022-10-27 18:34:56.187165','minha3','minha3@naver.com','$2b$12$dh6F5vMFszZ8eg/MJc13Xe5YQwL134KJ6Of78RbihZYgyC5Gwz63q','인천광역시 중구 영종해안남로','010-417-5548',1,1,44200.00),(6,'2022-09-13 14:31:01.951766','2022-09-13 14:31:01.951796','minha4','minha4@naver.com','$2b$12$Mif4/87arBBYAgm3iDSqsOT..VDrdgJKhiOw9FOtlYzm5hjaML6my','인천광역시 연수구 송도동','010-741-0011',0,1,0.00),(9,'2022-09-15 00:13:26.612049','2022-09-15 00:13:26.612079','minha5','minha5@google.com','$2b$12$Jzl.OURFsjVCQjtahXpeseUCntd.SXOuhPMTdkEONXKTvtroqsUrW','서울특별시 영등포구 국제금융로','010-2225-2222',0,1,0.00);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-28 15:58:05
