-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Услуга`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`service` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` NVARCHAR(60) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Салон оптики`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`optical_shop` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `address` NVARCHAR(200) NOT NULL,
  `timetable` TEXT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Врач`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`doctor` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `FIO` NVARCHAR(150) NOT NULL,
  `specialty` NVARCHAR(100) NOT NULL,
  `fk_optical_shop_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_doctor_optical_shop1_idx` (`fk_optical_shop_id` ASC) VISIBLE,
  CONSTRAINT `fk_doctor_optical_shop1`
    FOREIGN KEY (`fk_optical_shop_id`)
    REFERENCES `mydb`.`optical_shop` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`оказывает`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`provide` (
  `doctor_id` INT UNSIGNED NOT NULL,
  `service_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`doctor_id`, `service_id`),
  INDEX `fk_service_idx` (`service_id` ASC) VISIBLE,
  INDEX `fk_doctor_idx` (`doctor_id` ASC) VISIBLE,
  CONSTRAINT `fk_doctor1`
    FOREIGN KEY (`doctor_id`)
    REFERENCES `mydb`.`doctor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_service1`
    FOREIGN KEY (`service_id`)
    REFERENCES `mydb`.`service` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Пользователь`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`user` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `FIO` NVARCHAR(150) NOT NULL,
  `phone` INT UNSIGNED NOT NULL,
  `birthdate` DATE NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Прием`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`reception` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `date` DATE NOT NULL,
  `time` TIME NOT NULL,
  `fk_doctor_id` INT UNSIGNED NOT NULL,
  `fk_user_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_reception_doctor1_idx` (`fk_doctor_id` ASC) VISIBLE,
  INDEX `fk_reception_user1_idx` (`fk_user_id` ASC) VISIBLE,
  CONSTRAINT `fk_reception_doctor1`
    FOREIGN KEY (`fk_doctor_id`)
    REFERENCES `mydb`.`doctor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reception_user1`
    FOREIGN KEY (`fk_user_id`)
    REFERENCES `mydb`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Рецепт`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`prescription` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `number` INT UNSIGNED NOT NULL,
  `detail` TEXT NOT NULL,
  `duration` VARCHAR(45) NOT NULL,
  `fk_reception_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_prescription_reception1_idx` (`fk_reception_id` ASC) VISIBLE,
  CONSTRAINT `fk_prescription_reception1`
    FOREIGN KEY (`fk_reception_id`)
    REFERENCES `mydb`.`reception` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Товар`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`goods` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `photo_url` NVARCHAR(200) NOT NULL,
  `title` NVARCHAR(100) NOT NULL,
  `description` TEXT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`имеется`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`there_is` (
  `fk_optical_shop_id` INT UNSIGNED NOT NULL,
  `fk_goods_id` INT UNSIGNED NOT NULL,
  `count` INT UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`fk_optical_shop_id`, `fk_goods_id`),
  INDEX `fk_there_is_goods1_idx` (`fk_goods_id` ASC) VISIBLE,
  INDEX `fk_there_is_optical_shop1_idx` (`fk_optical_shop_id` ASC) VISIBLE,
  CONSTRAINT `fk_there_is_optical_shop1`
    FOREIGN KEY (`fk_optical_shop_id`)
    REFERENCES `mydb`.`optical_shop` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_there_is_goods1`
    FOREIGN KEY (`fk_goods_id`)
    REFERENCES `mydb`.`goods` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Характеристика товара`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`attribute` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` NVARCHAR(40) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Значение`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`value` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `numeric` FLOAT NULL,
  `string` NVARCHAR(100) NULL,
  `fk_attribute_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_value_attribute_idx` (`fk_attribute_id` ASC) VISIBLE,
  CONSTRAINT `fk_value_attribute1`
    FOREIGN KEY (`fk_attribute_id`)
    REFERENCES `mydb`.`attribute` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Товар_has_Значение`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`goods_has_value` (
  `fk_goods_id` INT UNSIGNED NOT NULL,
  `fk_value_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`fk_goods_id`, `fk_value_id`),
  INDEX `fk_goods_has_value_value1_idx` (`fk_value_id` ASC) VISIBLE,
  INDEX `fk_goods_has_value_goods1_idx` (`fk_goods_id` ASC) VISIBLE,
  CONSTRAINT `fk_goods_has_value_goods1`
    FOREIGN KEY (`fk_goods_id`)
    REFERENCES `mydb`.`goods` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_goods_has_value_value1`
    FOREIGN KEY (`fk_value_id`)
    REFERENCES `mydb`.`value` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

ALTER TABLE `mydb`.`user` 
CHANGE COLUMN `phone` `phone` BIGINT(11) UNSIGNED NOT NULL ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
