-- Создайте таблицу “workers” (“id”, “birthday”, “name”, “salary”).
DROP TABLE workers;
CREATE TABLE workers
(
  "id" SERIAL PRIMARY KEY,
  "name" VARCHAR(20),
  "birthday" DATE,
  "salary" DECIMAL(6)
);

-- Задачи на INSERT

INSERT INTO workers (name, birthday, salary) 
VALUES ('Никита', '1990-11-11', 300);

INSERT INTO workers (name, salary) 
VALUES ('Светлана', 1200);

INSERT INTO workers (name, birthday, salary) 
VALUES 
('Ярослав', '1980-11-11', 1200),
('Пётр', '1993-11-11', 1000);

INSERT INTO workers (name, birthday, salary) 
VALUES 
('Вася', '1980-11-11', 500),
('Женя', '1983-11-11', 1000),
('Юра', '1980-11-11', 400),
('Пётр', '1993-11-11', 1000),
('Лиза', '1999-11-11', 1200),
('Алиса', '1993-11-11', 500);


-- Задачи на UPDATE

-- Поставьте Васе зарплату в 200$.
UPDATE workers
SET salary = 200
WHERE name = 'Вася';

-- Работнику с id=4 поставьте год рождения 87й.
UPDATE workers
SET birthday = '1987-11-11'
WHERE id = '4';

-- Всем, у кого зарплата 500$ сделайте ее 700$.
UPDATE workers
SET salary = 700
WHERE salary = 500;

-- Работникам с id больше 2 и меньше 5 включительно поставьте год 99.
UPDATE workers
SET birthday = '1999-11-11'
WHERE id > 2 AND id <= 5;

-- Поменяйте Васю на Женю и прибавьте ему зарплату до 900$.
UPDATE workers
SET name = 'Женя', salary = 900
WHERE name = 'Вася';

-- Задачи на SELECT

-- Выбрать работника с id = 3.
SELECT * FROM workers
WHERE id = '3';

-- Выбрать работников с зарплатой более 400$.
SELECT * FROM workers
WHERE salary >= 400;

-- Узнайте зарплату и возраст Жени.
SELECT salary, birthday FROM workers
WHERE name = 'Женя';

-- Выбрать работников с именем Петя.
SELECT * FROM workers
WHERE name = 'Петя';

-- Выбрать всех, кроме работников с именем Петя.
SELECT * FROM workers
WHERE name <> 'Петя';

-- Выбрать всех работников в возрасте 27 лет или с зарплатой 1000$.
SELECT * FROM workers
WHERE extract('year' from age("birthday")) = 27 AND salary = 1000;

-- Выбрать работников в возрасте от 25 (не включительно) до 28 лет (включительно).
SELECT * FROM workers
WHERE extract('year' from age("birthday")) BETWEEN 26 AND 28;

-- Выбрать всех работников в возрасте от 23 лет до 27 лет или с зарплатой от 400$ до 1000$.
SELECT * FROM workers
WHERE extract('year' from age("birthday")) BETWEEN 23 AND 27 OR salary BETWEEN 400 AND 1000;
