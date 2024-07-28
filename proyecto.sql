-- Active: 1721290976752@@127.0.0.1@3306@Proyecto
USE Proyecto;

SELECT *
FROM cars LIMIT 10;

SELECT *
FROM technique LIMIT 10;

SELECT ID, COUNT(*)
FROM cars
GROUP BY ID
HAVING COUNT(*) > 1;

-- TOP 5 coches más caros

SELECT  CONCAT(c.Manufacturer," ",c. Model), c.Price
FROM cars AS c
ORDER BY c.Price DESC
LIMIT 5;

--Calcular la moda del color--
SELECT c.Color
FROM cars AS c
GROUP BY Color
ORDER BY COUNT(*) DESC
LIMIT 2;

--Porcentage de color--
WITH TotalCount AS (
    SELECT COUNT(*) AS Total
    FROM cars
),
ColorCounts AS (
    SELECT Color, COUNT(*) AS Count
    FROM cars
    GROUP BY Color
)
SELECT
    Color,
    Count,
    (Count * 100.0 / Total) AS Percentage
FROM
    ColorCounts,
    TotalCount;

-- Media del año de producción de los coches
SELECT ROUND(AVG(c.Prod_year))
FROM cars AS c;

-- Tabla con el precio medio según el tipo de combustible y media de km--

SELECT t.Fuel_type, ROUND(AVG(c.Price),0) AS "Average Price", ROUND(AVG(c.Mileage),0) AS "Average Mileage"
FROM cars AS c
JOIN technique as t
ON c.ID = t.ID
GROUP BY t.Fuel_type
ORDER BY AVG(c.Price) DESC;

-- Tabla con el precio según el fabricante --
SELECT c.Manufacturer, ROUND(AVG (c.Price),0)
FROM cars as c
GROUP BY c.Manufacturer
ORDER BY AVG(c.Price) ASC
LIMIT 10;

-- Tabla con la categoría con más precio según los km --

SELECT c.Category, ROUND(AVG(c.Price), 0) AS Average_Price, ROUND(AVG(c.Mileage), 0) AS Average_Mileage
FROM cars AS c
GROUP BY c.Category
ORDER BY AVG(c.Price) DESC;

-- Seleccionar los coches que estén por debajo de la media de km del total

SELECT CONCAT(c.Manufacturer, " " ,c.Model) AS Model, c.Price, t.Fuel_type, c.Mileage
FROM cars AS c
JOIN technique AS t
ON c.ID = t.ID
WHERE t.Fuel_type = 'Petrol' AND c.Mileage 
ORDER BY c.Mileage ASC;



