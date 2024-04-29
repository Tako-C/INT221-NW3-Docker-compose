create database kradan_kanban_itb_kk;

use kradan_kanban_itb_kk;
SET NAMES utf8mb4;

SET character_set_results = 'utf8mb4';
SET time_zone = '+00:00';

CREATE TABLE mytasks (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    description VARCHAR(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    assignees VARCHAR(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
	status ENUM('NO_STATUS', 'TO_DO', 'DOING', 'DONE') NOT NULL DEFAULT 'NO_STATUS',
    create_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    update_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CHECK (CHAR_LENGTH(title) <= 100),
    CHECK (CHAR_LENGTH(assignees) <= 30 AND assignees != ' '),
    CHECK (CHAR_LENGTH(description) <= 500)
);

CREATE USER 'user'@'%' IDENTIFIED BY 'mysql';
GRANT ALL ON *.* TO 'user'@'%';


-- INSERT INTO mytasks (title, description, assignees, status,create_time,update_time) 
-- VALUES ('TaskTitle1TaskTitle2TaskTitle3TaskTitle4TaskTitle5TaskTitle6TaskTitle7TaskTitle8TaskTitle9TaskTitle0',
-- 'Descripti1Descripti2Descripti3Descripti4Descripti5Descripti6Descripti7Descripti8Descripti9Descripti1Descripti1Descripti2Descripti3Descripti4Descripti5Descripti6Descripti7Descripti8Descripti9Descripti2Descripti1Descripti2Descripti3Descripti4Descripti5Descripti6Descripti7Descripti8Descripti9Descripti3Descripti1Descripti2Descripti3Descripti4Descripti5Descripti6Descripti7Descripti8Descripti9Descripti4Descripti1Descripti2Descripti3Descripti4Descripti5Descripti6Descripti7Descripti8Descripti9Descripti5',
-- 'Assignees1Assignees2Assignees3',
-- 'NO_STATUS',
-- '2024-04-22 09:00:00',
-- '2024-04-22 09:00:00');

-- INSERT INTO mytasks (title, description, assignees, status,create_time,update_time) 
-- VALUES ('Repository', null, null, 'TO_DO','2024-04-22 09:05:00','2024-04-22 14:00:00');

-- INSERT INTO mytasks (title, description, assignees,status,create_time,update_time)
-- VALUES (' ดาต้าเบส','ສ້າງຖານຂໍ້ມູນ', 'あなた、彼、彼女 (私ではありません)','DOING','2024-04-22 09:10:00','2024-04-25 00:00:00');

-- INSERT INTO mytasks (title, description, assignees,status,create_time,update_time) 
-- VALUES (' _Infrastructure_ ', ' _Setup containers_ ', 'ไก่งวง กับ เพนกวิน' ,'DONE','2024-04-22 09:15:00','2024-04-22 10:00:00');

-- docker run --name mysql_itb_kk -e MYSQL_ROOT_PASSWORD=mysql -p 3000:3306 -d mysql/mysql-server:8.0
