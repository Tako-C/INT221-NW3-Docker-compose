-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';


SET NAMES utf8mb4;
-- SET time_zone = '+00:00';
SET GLOBAL time_zone = '+00:00';

CREATE USER 'user'@'%' IDENTIFIED BY 'mysql';
GRANT ALL ON *.* TO 'user'@'%';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema kradan_kanban_itb_kk
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema kradan_kanban_itb_kk
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `kradan_kanban_itb_kk` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `kradan_kanban_itb_kk` ;

-- -----------------------------------------------------
-- Table `kradan_kanban_itb_kk`.`statuss`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `kradan_kanban_itb_kk`.`statuss` (
  `id` INT NOT NULL  AUTO_INCREMENT,
  `name` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `kradan_kanban_itb_kk`.`mytasks`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `kradan_kanban_itb_kk`.`mytasks` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(100) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NOT NULL,
  `description` VARCHAR(500) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NULL DEFAULT NULL,
  `assignees` VARCHAR(30) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NULL DEFAULT NULL,
  -- `status` ENUM('NO_STATUS', 'TO_DO', 'DOING', 'DONE') NOT NULL DEFAULT 'NO_STATUS',
  `createdOn` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedOn` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `statuss_id` INT NOT NULL,
  PRIMARY KEY (`id`, `statuss_id`),
  INDEX `fk_mytasks_statuss_idx` (`statuss_id` ASC) VISIBLE,
  CONSTRAINT `fk_mytasks_statuss`
    FOREIGN KEY (`statuss_id`)
    REFERENCES `kradan_kanban_itb_kk`.`statuss` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
SET GLOBAL time_zone = '+00:00';
SET time_zone = '+00:00';


SET NAMES utf8mb4;
use kradan_kanban_itb_kk;

insert into statuss (name,description) values("No Status","The default status");
insert into statuss (name,description) values("To Do",null);
insert into statuss (name,description) values("Doing","Being worked on");
insert into statuss (name,description) values("Done","Finished");


INSERT INTO mytasks (title, description, assignees,createdOn,updatedOn,statuss_id)
VALUES ('TaskTitle1TaskTitle2TaskTitle3TaskTitle4TaskTitle5TaskTitle6TaskTitle7TaskTitle8TaskTitle9TaskTitle0',
 'Descripti1Descripti2Descripti3Descripti4Descripti5Descripti6Descripti7Descripti8Descripti9Descripti1Descripti1Descripti2Descripti3Descripti4Descripti5Descripti6Descripti7Descripti8Descripti9Descripti2Descripti1Descripti2Descripti3Descripti4Descripti5Descripti6Descripti7Descripti8Descripti9Descripti3Descripti1Descripti2Descripti3Descripti4Descripti5Descripti6Descripti7Descripti8Descripti9Descripti4Descripti1Descripti2Descripti3Descripti4Descripti5Descripti6Descripti7Descripti8Descripti9Descripti5',
 'Assignees1Assignees2Assignees3',
 '2024-04-22 09:00:00',
 '2024-04-22 09:00:00',
 1);
INSERT INTO mytasks (title, description, assignees,createdOn,updatedOn,statuss_id)
VALUES ('Repository', null, null,'2024-04-22 09:05:00','2024-04-22 14:00:00', 2);

INSERT INTO mytasks (title, description, assignees,createdOn,updatedOn,statuss_id)
VALUES (' ดาต้าเบส','ສ້າງຖານຂໍ້ມູນ', 'あなた、彼、彼女 (私ではありません)','2024-04-22 09:10:00','2024-04-25 00:00:00',3);

INSERT INTO mytasks (title, description, assignees,createdOn,updatedOn,statuss_id)
VALUES (' _Infrastructure_ ', ' _Setup containers_ ', 'ไก่งวง กับ เพนกวิน' ,'2024-04-22 09:15:00','2024-04-22 10:00:00',4);
