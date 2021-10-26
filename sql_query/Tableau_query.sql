SELECT * FROM CovidDeath
SELECT * FROM CovidVacination


--Q1 total_cases, total_deaths, death_pct
SELECT SUM(new_cases) total_cases, Sum(new_deaths) total_deaths, Sum(new_deaths)/Sum(new_cases) *100 death_percentage
from CovidDeath
WHERE continent is not null;

--Q2 total_death_counts for each cotintent
SELECT continent,SUM(new_deaths) death_counts FROM CovidDeath
where continent is not null
GROUP BY continent
ORDER BY 2 DESC;


--Q3 highest invection count vs population 
SELECT location,population,MAX(total_cases) highest_infection_count,MAX(total_cases/population) *100 pct_population_infected
FROM CovidDeath
WHERE continent is not null
group by location,population
ORDER BY 4 DESC;

--Q4
SELECT location,population,date,MAX(total_cases) highest_infection_count,MAX((total_cases/population)) *100 pct_population_infected
FROM CovidDeath
WHERE continent is not null 
group by location,population,date
ORDER BY 5 DESC;