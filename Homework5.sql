CREATE DATABASE IF NOT EXISTS homework_5;
USE homework_5;

DROP TABLE IF EXISTS cars;

CREATE TABLE cars
(
	id INT NOT NULL PRIMARY KEY,
    name VARCHAR(45),
    cost INT
);

INSERT cars
VALUES
	(1, "Audi", 52642),
    (2, "Mercedes", 57127 ),
    (3, "Skoda", 9000 ),
    (4, "Volvo", 29000),
	(5, "Bentley", 350000),
    (6, "Citroen ", 21000 ), 
    (7, "Hummer", 41400), 
    (8, "Volkswagen ", 21600);
    
-- Задание 1
CREATE VIEW cars_copy AS
(
	SELECT *
    FROM cars
    WHERE cost < 25000
);

SELECT *
FROM cars_copy;

-- Задание 2
ALTER VIEW cars_copy AS
(
	SELECT *
    FROM cars
    WHERE cost < 30000
);

SELECT *
FROM cars_copy;

-- Задание 3
DROP VIEW IF EXISTS cars_copy;
CREATE VIEW cars_copy AS
(
	SELECT *
    FROM cars
    WHERE name IN ("Skoda", "Audi")
);

SELECT *
FROM cars_copy;


-- Задание 4

DROP TABLE IF EXISTS trains;
CREATE TABLE trains(
	train_id INT NOT NUll,
    station VARCHAR(20) NOT NUll,
    station_time TIME NOT NUll
);

INSERT INTO trains
VALUES
(110, "San Francisco", '10:00:00'),
(110, "Redwood City", '10:54:00'),
(110, "Palo Alto", '11:02:00'),
(110, "San Jose", '12:35:00'),
(120, "San Francisco", '11:00:00'),
(120, "Palo Alto", '12:49:00'),
(120, "San Jose", '13:30:00');

SELECT 
	trains.*,
	TIMEDIFF (LEAD(station_time) OVER (PARTITION BY train_id), station_time) AS test
FROM trains;