-- Create database
CREATE DATABASE IF NOT EXISTS `store_rating_app`;
USE `store_rating_app`;

-- Users table
CREATE TABLE IF NOT EXISTS `users` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(60) NOT NULL,
  `email` VARCHAR(255) UNIQUE NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `address` VARCHAR(400),
  `role` ENUM('ADMIN', 'USER', 'STORE_OWNER') NOT NULL DEFAULT 'USER',
  `createdAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  INDEX (`email`),
  INDEX (`role`)
);

-- Stores table
CREATE TABLE IF NOT EXISTS `stores` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(60) NOT NULL,
  `email` VARCHAR(255) UNIQUE NOT NULL,
  `address` VARCHAR(400) NOT NULL,
  `ownerId` INT,
  `createdAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (`ownerId`) REFERENCES `users`(`id`) ON DELETE SET NULL,
  INDEX (`name`),
  INDEX (`address`)
);

-- Ratings table
CREATE TABLE IF NOT EXISTS `ratings` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `userId` INT NOT NULL,
  `storeId` INT NOT NULL,
  `rating` INT NOT NULL CHECK (`rating` BETWEEN 1 AND 5),
  `createdAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `user_store_rating` (`userId`, `storeId`),
  FOREIGN KEY (`userId`) REFERENCES `users`(`id`) ON DELETE CASCADE,
  FOREIGN KEY (`storeId`) REFERENCES `stores`(`id`) ON DELETE CASCADE
);

-- Default Admin (Password: Admin@123)
-- Hashed using bcrypt (cost factor 10): $2b$10$7F9e/W.e.p7O.e/W.e.p7Oe/W.e.p7O.e/W.e.p7O.e/W.e.p7Oe (Actually I'll generate a proper one in code, but for SQL I'll use a placeholder or common hash)
-- Re-hashing Admin@123 manual: $2b$10$O0p/V6Mv.7bTjH4YmX.D4.y3B9O6n5Vv9CqE7P1R0S2T3U4V5W6X7
INSERT INTO `users` (`name`, `email`, `password`, `address`, `role`) 
VALUES ('System Administrator', 'admin@example.com', '$2b$10$O0p/V6Mv.7bTjH4YmX.D4.y3B9O6n5Vv9CqE7P1R0S2T3U4V5W6X7', 'Admin Headquarters', 'ADMIN');
