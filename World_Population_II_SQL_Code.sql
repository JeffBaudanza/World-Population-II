# How many entries in the database are from Africa?
SELECT COUNT(*) FROM countries
WHERE continent = 'Africa';

# -- What was the total population of Oceania in 2005?
SELECT continent, Round(SUM(population),2)
FROM countries 
LEFT JOIN population_years
ON countries.id = population_years.country_id
WHERE continent ='Oceania' and year = 2005;

# -- What is the average population of countries in South America in 2003?

SELECT ROUND(AVG(population),2)
FROM countries
LEFT JOIN population_years
ON countries.id = population_years.country_id
WHERE countries.continent = 'South America' and population_years.year = 2003;

#-- What country had the smallest population in 2007?

SELECT MIN(population)
FROM countries 
LEFT JOIN population_years
ON countries.id = population_years.country_id
WHERE population_years.year = 2007;

#-- What is the average population of Poland during the time period covered by this dataset?

SELECT countries.name, Round(AVG(population),2)
FROM countries 
LEFT JOIN population_years
ON countries.id = population_years.country_id
WHERE countries.name = 'Poland';

#-- How many countries have the word "The" in their name?

SELECT COUNT(*)
FROM countries
LEFT JOIN population_years
ON countries.id = population_years.country_id
WHERE countries.name LIKE '%The%';

#-- What was the total population of each continent in 2010?

SELECT continent, year, ROUND(SUM(population),2)
FROM countries
LEFT JOIN population_years
ON countries.id = population_years.country_id
WHERE year= 2010
GROUP BY 1;