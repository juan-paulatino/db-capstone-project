-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema capstone
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema capstone
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `capstone` DEFAULT CHARACTER SET utf8 ;
USE `capstone` ;

-- -----------------------------------------------------
-- Table `capstone`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `capstone`.`Customer` (
  `idCustomer` INT NOT NULL AUTO_INCREMENT,
  `CustomerName` VARCHAR(45) NOT NULL,
  `CustomerPhone` INT NOT NULL,
  `CustomerEmail` VARCHAR(45) NULL,
  PRIMARY KEY (`idCustomer`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `capstone`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `capstone`.`Bookings` (
  `idBookings` INT NOT NULL AUTO_INCREMENT,
  `BookingsTable` INT NOT NULL,
  `BookingsDate` DATE NOT NULL,
  `Customer_idCustomer` INT NOT NULL,
  PRIMARY KEY (`idBookings`),
  INDEX `fk_Bookings_Customer_idx` (`Customer_idCustomer` ASC) VISIBLE,
  CONSTRAINT `fk_Bookings_Customer`
    FOREIGN KEY (`Customer_idCustomer`)
    REFERENCES `capstone`.`Customer` (`idCustomer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `capstone`.`MenuItems`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `capstone`.`MenuItems` (
  `idMenuItems` INT NOT NULL,
  `MenuItemsStarter` VARCHAR(45) NULL,
  `MenuItemsCourse` VARCHAR(45) NULL,
  `MenuItemsDessert` VARCHAR(45) NULL,
  `MenuItemsDrinks` VARCHAR(45) NULL,
  PRIMARY KEY (`idMenuItems`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `capstone`.`Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `capstone`.`Menu` (
  `idMenu` INT NOT NULL,
  `MenuCuisine` VARCHAR(45) NOT NULL,
  `MenuItems_idMenuItems` INT NOT NULL,
  PRIMARY KEY (`idMenu`),
  INDEX `fk_Menu_MenuItems1_idx` (`MenuItems_idMenuItems` ASC) VISIBLE,
  CONSTRAINT `fk_Menu_MenuItems1`
    FOREIGN KEY (`MenuItems_idMenuItems`)
    REFERENCES `capstone`.`MenuItems` (`idMenuItems`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `capstone`.`Order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `capstone`.`Order` (
  `idOrder` INT NOT NULL AUTO_INCREMENT,
  `OrderDate` DATE NOT NULL,
  `OrderQty` INT NOT NULL,
  `TotalCost` DECIMAL NOT NULL,
  `Bookings_idBookings` INT NOT NULL,
  `Menu_idMenu` INT NOT NULL,
  `Customer_idCustomer` INT NOT NULL,
  PRIMARY KEY (`idOrder`),
  INDEX `fk_Order_Bookings1_idx` (`Bookings_idBookings` ASC) VISIBLE,
  INDEX `fk_Order_Menu1_idx` (`Menu_idMenu` ASC) VISIBLE,
  INDEX `fk_Order_Customer1_idx` (`Customer_idCustomer` ASC) VISIBLE,
  CONSTRAINT `fk_Order_Bookings1`
    FOREIGN KEY (`Bookings_idBookings`)
    REFERENCES `capstone`.`Bookings` (`idBookings`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Order_Menu1`
    FOREIGN KEY (`Menu_idMenu`)
    REFERENCES `capstone`.`Menu` (`idMenu`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Order_Customer1`
    FOREIGN KEY (`Customer_idCustomer`)
    REFERENCES `capstone`.`Customer` (`idCustomer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `capstone`.`Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `capstone`.`Staff` (
  `idStaff` INT NOT NULL AUTO_INCREMENT,
  `StaffName` VARCHAR(45) NOT NULL,
  `StaffRole` VARCHAR(45) NOT NULL,
  `StaffSalary` DECIMAL NULL,
  PRIMARY KEY (`idStaff`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `capstone`.`OrderDelivery`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `capstone`.`OrderDelivery` (
  `idOrderDelivery` INT NOT NULL AUTO_INCREMENT,
  `DeliveryDate` DATE NOT NULL,
  `DeliveryStatus` VARCHAR(45) NULL,
  `Order_idOrder` INT NOT NULL,
  `Staff_idStaff` INT NOT NULL,
  PRIMARY KEY (`idOrderDelivery`),
  INDEX `fk_OrderDelivery_Order1_idx` (`Order_idOrder` ASC) VISIBLE,
  INDEX `fk_OrderDelivery_Staff1_idx` (`Staff_idStaff` ASC) VISIBLE,
  CONSTRAINT `fk_OrderDelivery_Order1`
    FOREIGN KEY (`Order_idOrder`)
    REFERENCES `capstone`.`Order` (`idOrder`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrderDelivery_Staff1`
    FOREIGN KEY (`Staff_idStaff`)
    REFERENCES `capstone`.`Staff` (`idStaff`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
