-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema little-lemon-db-model
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema little-lemon-db-model
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `little-lemon-db-model` DEFAULT CHARACTER SET utf8 ;
USE `little-lemon-db-model` ;

-- -----------------------------------------------------
-- Table `little-lemon-db-model`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little-lemon-db-model`.`customers` (
  `customer_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little-lemon-db-model`.`bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little-lemon-db-model`.`bookings` (
  `booking_id` INT NOT NULL,
  `date` DATE NOT NULL,
  `table_number` INT NOT NULL,
  `customer_id` INT NOT NULL,
  PRIMARY KEY (`booking_id`),
  INDEX `customer_id_idx_idx` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `customer_id_idx`
    FOREIGN KEY (`customer_id`)
    REFERENCES `little-lemon-db-model`.`customers` (`customer_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little-lemon-db-model`.`roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little-lemon-db-model`.`roles` (
  `role_id` INT NOT NULL,
  `role` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`role_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little-lemon-db-model`.`staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little-lemon-db-model`.`staff` (
  `staff_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `salary` INT NOT NULL,
  `role_id` INT NOT NULL,
  PRIMARY KEY (`staff_id`),
  INDEX `role_id_idx_idx` (`role_id` ASC) VISIBLE,
  CONSTRAINT `role_id_idx`
    FOREIGN KEY (`role_id`)
    REFERENCES `little-lemon-db-model`.`roles` (`role_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little-lemon-db-model`.`contact_details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little-lemon-db-model`.`contact_details` (
  `contact_id` INT NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `phone_number` INT NOT NULL,
  `address` VARCHAR(255) NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `customer_id` INT NOT NULL,
  `staff_id` INT NOT NULL,
  PRIMARY KEY (`contact_id`),
  INDEX `customer_id_idx_idx` (`customer_id` ASC) VISIBLE,
  INDEX `staff_id_idx_idx` (`staff_id` ASC) VISIBLE,
  CONSTRAINT `customer_id_idx`
    FOREIGN KEY (`customer_id`)
    REFERENCES `little-lemon-db-model`.`customers` (`customer_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `staff_id_idx`
    FOREIGN KEY (`staff_id`)
    REFERENCES `little-lemon-db-model`.`staff` (`staff_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little-lemon-db-model`.`menus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little-lemon-db-model`.`menus` (
  `menu_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `cuisine` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`menu_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little-lemon-db-model`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little-lemon-db-model`.`orders` (
  `order_id` INT NOT NULL,
  `date` DATE NOT NULL,
  `quantity` INT NOT NULL,
  `total_cost` DECIMAL NOT NULL,
  `customer_id` INT NOT NULL,
  `menu_id` INT NOT NULL,
  PRIMARY KEY (`order_id`),
  INDEX `customer_id_idx_idx` (`customer_id` ASC) VISIBLE,
  INDEX `menu_id_idx_idx` (`menu_id` ASC) VISIBLE,
  CONSTRAINT `customer_id_idx`
    FOREIGN KEY (`customer_id`)
    REFERENCES `little-lemon-db-model`.`customers` (`customer_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `menu_id_idx`
    FOREIGN KEY (`menu_id`)
    REFERENCES `little-lemon-db-model`.`menus` (`menu_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little-lemon-db-model`.`order_delivery_status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little-lemon-db-model`.`order_delivery_status` (
  `delivery_id` INT NOT NULL,
  `date` DATE NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  `order_id` INT NOT NULL,
  `staff_id` INT NOT NULL,
  PRIMARY KEY (`delivery_id`),
  INDEX `order_id_idx_idx` (`order_id` ASC) VISIBLE,
  INDEX `staff_id_idx_idx` (`staff_id` ASC) VISIBLE,
  CONSTRAINT `order_id_idx`
    FOREIGN KEY (`order_id`)
    REFERENCES `little-lemon-db-model`.`orders` (`order_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `staff_id_idx`
    FOREIGN KEY (`staff_id`)
    REFERENCES `little-lemon-db-model`.`staff` (`staff_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little-lemon-db-model`.`menu_items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little-lemon-db-model`.`menu_items` (
  `item_id` INT NOT NULL,
  `course` VARCHAR(45) NOT NULL,
  `starter` VARCHAR(45) NOT NULL,
  `desert` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`item_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `little-lemon-db-model`.`menu_content`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little-lemon-db-model`.`menu_content` (
  `menu_id` INT NOT NULL,
  `item_id` INT NOT NULL,
  INDEX `menu_id_idx_idx` (`menu_id` ASC) VISIBLE,
  INDEX `item_id_idx_idx` (`item_id` ASC) VISIBLE,
  CONSTRAINT `menu_id_idx`
    FOREIGN KEY (`menu_id`)
    REFERENCES `little-lemon-db-model`.`menus` (`menu_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `item_id_idx`
    FOREIGN KEY (`item_id`)
    REFERENCES `little-lemon-db-model`.`menu_items` (`item_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
