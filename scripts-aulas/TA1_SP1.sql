USE world;

SHOW TABLES;

SHOW COLUMNS FROM city;


/*nomes de todas as cidades na tabela cidade com
nomes iniciados por ‘Sor’”:*/
SELECT Name
FROM city
WHERE Name LIKE "Sor%";

/*Encontrar nomes e a população de todas as cidades com
nomes iniciados por ‘Sor’”:*/
SELECT Name, Population
FROM city
WHERE Name LIKE "Sor%";

/*nomes, sua população e os países em que se
encontram, para todas as cidades com nomes iniciados por ‘Sor’”:*/
SELECT city.Name, city.Population,
country.Name
FROM city, country
WHERE city.Name LIKE 'Sor%' AND city.CountryCode = country.Code;