create database kradan_kanban_itb_kk;
use kradan_kanban_itb_kk;
SET NAMES utf8mb4;
SET time_zone = '+00:00';
SET character_set_results = 'utf8mb4';

-- Create the table
CREATE TABLE mytasks (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(108) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    description VARCHAR(518) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    assignees VARCHAR(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
	status ENUM('NO_STATUS', 'TO_DO', 'DOING', 'DONE') NOT NULL,
    createdOn DATETIME NOT NULL,
    updatedOn DATETIME NOT NULL ,
    CHECK (CHAR_LENGTH(title) <= 100),
    CHECK (CHAR_LENGTH(description) <= 500)
);

-- Create Trigger for Insert
DELIMITER $$
CREATE TRIGGER before_insert_mytasks
BEFORE INSERT ON mytasks
FOR EACH ROW
BEGIN
	SET time_zone = '+00:00';
    IF NEW.status IS NULL THEN
        SET NEW.status = 'NO_STATUS';
    END IF;
    SET NEW.createdOn = CURRENT_TIMESTAMP;
    SET NEW.updatedOn = CURRENT_TIMESTAMP;
END$$
DELIMITER ;

-- Create Trigger for Update
DELIMITER $$
CREATE TRIGGER before_update_mytasks
BEFORE UPDATE ON mytasks
FOR EACH ROW
BEGIN
	SET time_zone = '+00:00';
    IF NEW.status IS NULL THEN
        SET NEW.status = 'NO_STATUS';
    END IF;
    SET NEW.updatedOn = CURRENT_TIMESTAMP;
END$$
DELIMITER ;

-- Check Trigger
SHOW TRIGGERS;
SHOW TRIGGERS LIKE 'mytasks';

CREATE USER 'user'@'%' IDENTIFIED BY 'mysql';
GRANT ALL ON *.* TO 'user'@'%';


INSERT INTO mytasks (title, description, assignees, status,createdOn,updatedOn) 
VALUES ('TaskTitle1TaskTitle2TaskTitle3TaskTitle4TaskTitle5TaskTitle6TaskTitle7TaskTitle8TaskTitle9TaskTitle0',
 'Descripti1Descripti2Descripti3Descripti4Descripti5Descripti6Descripti7Descripti8Descripti9Descripti1Descripti1Descripti2Descripti3Descripti4Descripti5Descripti6Descripti7Descripti8Descripti9Descripti2Descripti1Descripti2Descripti3Descripti4Descripti5Descripti6Descripti7Descripti8Descripti9Descripti3Descripti1Descripti2Descripti3Descripti4Descripti5Descripti6Descripti7Descripti8Descripti9Descripti4Descripti1Descripti2Descripti3Descripti4Descripti5Descripti6Descripti7Descripti8Descripti9Descripti5',
 'Assignees1Assignees2Assignees3',
 'NO_STATUS',
 '2024-04-22 09:00:00',
 '2024-04-22 09:00:00');

INSERT INTO mytasks (title, description, assignees, status,createdOn,updatedOn) 
VALUES ('Repository', null, null, 'TO_DO','2024-04-22 09:05:00','2024-04-22 14:00:00');

INSERT INTO mytasks (title, description, assignees,status,createdOn,updatedOn)
VALUES (' ดาต้าเบส','ສ້າງຖານຂໍ້ມູນ', 'あなた、彼、彼女 (私ではありません)','DOING','2024-04-22 09:10:00','2024-04-25 00:00:00');

INSERT INTO mytasks (title, description, assignees,status,createdOn,updatedOn) 
VALUES (' _Infrastructure_ ', ' _Setup containers_ ', 'ไก่งวง กับ เพนกวิน' ,'DONE','2024-04-22 09:15:00','2024-04-22 10:00:00');
-- Drop Trigger 
-- DROP TRIGGER IF EXISTS before_insert_mytasks;
-- DROP TRIGGER IF EXISTS before_update_mytasks;

-- -- EX update
-- UPDATE mytasks
-- SET title = 'Task sasaki'
-- where id = 2;

-- -- EX Delete 
-- delete from mytasks
-- where id =1;
