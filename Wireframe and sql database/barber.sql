-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema barber_app
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `barber_app` ;

-- -----------------------------------------------------
-- Schema barber_app
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `barber_app` DEFAULT CHARACTER SET utf8 ;
USE `barber_app` ;

-- -----------------------------------------------------
-- Table `barber_app`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `barber_app`.`Customer` (
  `email` VARCHAR(50) NOT NULL,
  `password` VARCHAR(60) NULL,
  `first_name` VARCHAR(20) NULL,
  `last_name` VARCHAR(20) NULL,
  `phone_number` VARCHAR(20) NULL,
  PRIMARY KEY (`email`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `barber_app`.`Barber`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `barber_app`.`Barber` (
  `email` VARCHAR(50) NOT NULL,
  `password` VARCHAR(60) NULL,
  `first_name` VARCHAR(20) NULL,
  `last_name` VARCHAR(20) NULL,
  `phone_number` VARCHAR(20) NULL,
  `location` VARCHAR(50) NULL,
  PRIMARY KEY (`email`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `barber_app`.`Appointment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `barber_app`.`Appointment` (
  `id_appointment` INT NOT NULL,
  `Customer_email` VARCHAR(50) NOT NULL,
  `Barber_email` VARCHAR(50) NOT NULL,
  `status` VARCHAR(10) NULL,
  `complaint` VARCHAR(250) NULL,
  `date_appointment` DATE NULL,
  `time_appointment` TIME NULL,
  PRIMARY KEY (`id_appointment`, `Customer_email`, `Barber_email`),
  INDEX `fk_Appointment_Customer_idx` (`Customer_email` ASC) VISIBLE,
  INDEX `fk_Appointment_Barber1_idx` (`Barber_email` ASC) VISIBLE,
  CONSTRAINT `fk_Appointment_Customer`
    FOREIGN KEY (`Customer_email`)
    REFERENCES `barber_app`.`Customer` (`email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Appointment_Barber1`
    FOREIGN KEY (`Barber_email`)
    REFERENCES `barber_app`.`Barber` (`email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `barber_app`.`Slot`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `barber_app`.`Slot` (
  `id_slot` INT NOT NULL,
  `Barber_email` VARCHAR(50) NOT NULL,
  `time` TIME NULL,
  `available_slot` TINYINT NULL,
  PRIMARY KEY (`id_slot`, `Barber_email`),
  INDEX `fk_Slot_Barber1_idx` (`Barber_email` ASC) VISIBLE,
  CONSTRAINT `fk_Slot_Barber1`
    FOREIGN KEY (`Barber_email`)
    REFERENCES `barber_app`.`Barber` (`email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
