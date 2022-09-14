CREATE TABLE `users`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `passwd` VARCHAR(255) NOT NULL,
    `address` VARCHAR(255) NOT NULL,
    `phone` VARCHAR(255) NOT NULL,
    `sex` TINYINT NOT NULL,
    `role` TINYINT NOT NULL,
    `credit` DECIMAL(8, 2) NOT NULL,
    `created_at` DATETIME NOT NULL,
    `modified_at` DATETIME NOT NULL
);
ALTER TABLE
    `users` ADD PRIMARY KEY `users_id_primary`(`id`);
CREATE TABLE `products`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `made` VARCHAR(255) NOT NULL,
    `delivery_method` VARCHAR(255) NULL,
    `delivery_charge` DECIMAL(8, 2) NULL,
    `delivery_info` INT NULL,
    `created_at` DATETIME NOT NULL,
    `modified_at` DATETIME NOT NULL
);
ALTER TABLE
    `products` ADD PRIMARY KEY `products_id_primary`(`id`);
CREATE TABLE `product_details`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `product_id` INT NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `price` DECIMAL(8, 2) NOT NULL,
    `count` INT NOT NULL
);
ALTER TABLE
    `product_details` ADD PRIMARY KEY `product_details_id_primary`(`id`);
CREATE TABLE `cart`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_id` INT NOT NULL,
    `product_id` INT NOT NULL,
    `count` INT NOT NULL,
    `price` INT NOT NULL
);
ALTER TABLE
    `cart` ADD PRIMARY KEY `cart_id_primary`(`id`);
CREATE TABLE `payments`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_id` INT NOT NULL,
    `product_id` INT NOT NULL,
    `count` INT NOT NULL,
    `price` DECIMAL(8, 2) NOT NULL,
    `orderer` VARCHAR(255) NOT NULL,
    `phone` VARCHAR(255) NOT NULL,
    `address` VARCHAR(255) NOT NULL,
    `status` VARCHAR(255) NOT NULL DEFAULT 'order_completed',
    `created_at` DATETIME NOT NULL,
    `modified_at` DATETIME NOT NULL
);
ALTER TABLE
    `payments` ADD PRIMARY KEY `payments_id_primary`(`id`);
CREATE TABLE `likes`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_id` INT NOT NULL,
    `product_id` INT NOT NULL
);
ALTER TABLE
    `likes` ADD PRIMARY KEY `likes_id_primary`(`id`);
CREATE TABLE `product_images`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `product_id` INT NOT NULL,
    `main_img` VARCHAR(255) NOT NULL,
    `detail_img` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `product_images` ADD PRIMARY KEY `product_images_id_primary`(`id`);
CREATE TABLE `reviews`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_id` INT NOT NULL,
    `product_id` INT NOT NULL,
    `content` TEXT NOT NULL,
    `created_at` DATETIME NOT NULL,
    `modified_at` DATETIME NOT NULL
);
ALTER TABLE
    `reviews` ADD PRIMARY KEY `reviews_id_primary`(`id`);
CREATE TABLE `review_images`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `review_id` INT NOT NULL,
    `img` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `review_images` ADD PRIMARY KEY `review_images_id_primary`(`id`);
ALTER TABLE
    `payments` ADD CONSTRAINT `payments_product_id_foreign` FOREIGN KEY(`product_id`) REFERENCES `products`(`id`);
ALTER TABLE
    `product_details` ADD CONSTRAINT `product_details_product_id_foreign` FOREIGN KEY(`product_id`) REFERENCES `products`(`id`);
ALTER TABLE
    `payments` ADD CONSTRAINT `payments_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `cart` ADD CONSTRAINT `cart_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `cart` ADD CONSTRAINT `cart_product_id_foreign` FOREIGN KEY(`product_id`) REFERENCES `products`(`id`);
ALTER TABLE
    `likes` ADD CONSTRAINT `likes_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `likes` ADD CONSTRAINT `likes_product_id_foreign` FOREIGN KEY(`product_id`) REFERENCES `products`(`id`);
ALTER TABLE
    `product_images` ADD CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY(`product_id`) REFERENCES `products`(`id`);
ALTER TABLE
    `reviews` ADD CONSTRAINT `reviews_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `reviews` ADD CONSTRAINT `reviews_product_id_foreign` FOREIGN KEY(`product_id`) REFERENCES `products`(`id`);
ALTER TABLE
    `review_images` ADD CONSTRAINT `review_images_review_id_foreign` FOREIGN KEY(`review_id`) REFERENCES `reviews`(`id`);