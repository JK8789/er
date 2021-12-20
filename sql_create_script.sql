SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema Cinema_tickets
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Cinema_tickets
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Cinema_tickets` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `Cinema_tickets` ;

-- -----------------------------------------------------
-- Table `Cinema_tickets`.`CinemaHall`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cinema_tickets`.`CinemaHall` (
  `number` INT NOT NULL,
  `id` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Cinema_tickets`.`Movies`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cinema_tickets`.`Movies` (
  `name` VARCHAR(20) NOT NULL,
  `description` VARCHAR(500) NOT NULL,
  `movieId` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`movieId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Cinema_tickets`.`FilmSession`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cinema_tickets`.`FilmSession` (
  `dateTime` DATETIME NOT NULL,
  `filmSessionId` INT NOT NULL AUTO_INCREMENT,
  `Id` INT NOT NULL,
  `movieId` INT NOT NULL,
  PRIMARY KEY (`filmSessionId`),
  INDEX `fk_FilmSession_2_idx` (`Id` ASC) VISIBLE,
  INDEX `fk_FilmSession_1_idx` (`movieId` ASC) VISIBLE,
  CONSTRAINT `fk_FilmSession_1`
    FOREIGN KEY (`movieId`)
    REFERENCES `Cinema_tickets`.`Movies` (`movieId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FilmSession_2`
    FOREIGN KEY (`Id`)
    REFERENCES `Cinema_tickets`.`CinemaHall` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Cinema_tickets`.`Seats`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cinema_tickets`.`Seats` (
  `number` INT NOT NULL,
  `row` INT NOT NULL,
  `seatId` INT NOT NULL AUTO_INCREMENT,
  `cinemaHallId` INT NOT NULL,
  PRIMARY KEY (`seatId`),
  UNIQUE INDEX `id_UNIQUE` (`seatId` ASC) VISIBLE,
  INDEX `fk_Seats_1_idx` (`cinemaHallId` ASC) VISIBLE,
  CONSTRAINT `fk_Seats_1`
    FOREIGN KEY (`cinemaHallId`)
    REFERENCES `Cinema_tickets`.`CinemaHall` (`number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Cinema_tickets`.`Tickets`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cinema_tickets`.`Tickets` (
  `price` INT NOT NULL,
  `availability` VARCHAR(20) NOT NULL,
  `ticketId` INT NOT NULL AUTO_INCREMENT,
  `seatId` INT NOT NULL,
  `filmSessionId` INT NOT NULL,
  PRIMARY KEY (`ticketId`),
  INDEX `fk_Tickets_2_idx` (`seatId` ASC) VISIBLE,
  INDEX `fk_Tickets_1_idx` (`filmSessionId` ASC) VISIBLE,
  CONSTRAINT `fk_Tickets_1`
    FOREIGN KEY (`filmSessionId`)
    REFERENCES `Cinema_tickets`.`FilmSession` (`filmSessionId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tickets_2`
    FOREIGN KEY (`seatId`)
    REFERENCES `Cinema_tickets`.`Seats` (`seatId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
