CREATE TABLE cities (
id SERIAL PRIMARY KEY,
city VARCHAR(30) NOT NULL,
state VARCHAR(30) UNIQUE,
population INT,
crime_rate FLOAT DEFAULT 0	
);

INSERT INTO cities (city,state,population,crime_rate) VALUES
('Alameda','California',79000,0.8),
('Mesa','Arizona',500000,0.7),
('Boerne','Texas',160000,NULL);

SELECT *
FROM cities;

DROP TABLE cities;

SELECT city,population
FROM cities;

SELECT *
FROM cities
WHERE population >= 100000;

SELECT city,crime_rate,population
FROM cities
WHERE state = 'Texas' AND population >= 100000;

--update
UPDATE cities
SET crime_rate = 0.8
WHERE id = 3

SELECT *
FROM cities;

--update
UPDATE cities
SET population = 100000
WHERE city = 'Alameda';

DELETE FROM cities
WHERE id = 3