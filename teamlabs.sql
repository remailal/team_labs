-- Скрипт сгенерирован Devart dbForge Studio for MySQL, Версия 5.0.37.1
-- Домашняя страница продукта: http://www.devart.com/ru/dbforge/mysql/studio
-- Дата скрипта: 27.09.2018 14:02:26
-- Версия сервера: 5.5.5-10.1.28-MariaDB
-- Версия клиента: 4.1

-- 
-- Отключение внешних ключей
-- 
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

-- 
-- Установка кодировки, с использованием которой клиент будет посылать запросы на сервер
--
SET NAMES 'utf8';

-- 
-- Установка базы данных по умолчанию
--
USE teamlabs;

--
-- Описание для таблицы publications
--
DROP TABLE IF EXISTS publications;
CREATE TABLE publications (
  id INT(11) NOT NULL AUTO_INCREMENT COMMENT 'идентификатор публикации',
  name VARCHAR(255) DEFAULT NULL COMMENT 'название',
  `date` DATE DEFAULT NULL COMMENT 'дата публикации',
  magazine VARCHAR(255) DEFAULT NULL COMMENT 'журнал',
  PRIMARY KEY (id)
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET utf8mb4
COLLATE utf8mb4_general_ci;

--
-- Описание для таблицы teachers
--
DROP TABLE IF EXISTS teachers;
CREATE TABLE teachers (
  id INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор преподавателя',
  fio VARCHAR(255) DEFAULT NULL COMMENT 'фио',
  rang VARCHAR(50) DEFAULT NULL COMMENT 'должность',
  PRIMARY KEY (id)
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET utf8mb4
COLLATE utf8mb4_general_ci;

--
-- Описание для таблицы teachers_publications
--
DROP TABLE IF EXISTS teachers_publications;
CREATE TABLE teachers_publications (
  id_t INT(11) NOT NULL COMMENT 'идентификатор преподавателя',
  id_p INT(11) NOT NULL COMMENT 'идентификатор публикации',
  INDEX FK_teachers_publications_publications_id (id_p),
  INDEX FK_teachers_publications_teachers_id (id_t),
  CONSTRAINT FK_teachers_publications_publications_id FOREIGN KEY (id_p)
    REFERENCES publications(id) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT FK_teachers_publications_teachers_id FOREIGN KEY (id_t)
    REFERENCES teachers(id) ON DELETE RESTRICT ON UPDATE RESTRICT
)
ENGINE = INNODB
CHARACTER SET utf8mb4
COLLATE utf8mb4_general_ci;

-- 
-- Вывод данных для таблицы publications
--
-- Таблица не содержит данных

-- 
-- Вывод данных для таблицы teachers
--
-- Таблица не содержит данных

-- 
-- Вывод данных для таблицы teachers_publications
--
-- Таблица не содержит данных

-- 
-- Включение внешних ключей
-- 
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;