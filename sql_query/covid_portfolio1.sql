SELECT location,date,total_cases,new_cases,total_deaths,new_deaths
FROM CovidDeath 
ORDER BY 1,2

--PROCEDUR TO FIND THE DATE OF A NATION WHEN THE INFECTION WAS SKY HIGH
CREATE PROCEDURE FIND_DATE
as
SELECT  TOP 1 date   FROM CovidDeath
order by total_cases DESC

-- Total_cases VS total_deaths
SELECT location,date,population,total_cases,total_deaths,(total_deaths/total_cases*100) pct_death_per_cases
FROM CovidDeath 
ORDER BY 1,5 DESC;

--COUNTRIES with infection rates
SELECT location
,population,MAX(total_cases) highest_infected_count,MAX(total_cases/population)*100 highest_pct_infection_rate
FROM CovidDeath 
WHERE continent is not null
GROUP BY location,population
ORDER BY 3 DESC;

--COUNTRIES WITH DEATH_COUNT_PER_POPULATION
SELECT location
,population,MAX(total_deaths) highest_death_count,MAX(total_deaths/population)*100 highest_pct_death_rate
FROM CovidDeath 
WHERE continent is not null
GROUP BY location,population
ORDER BY  3 DESC;

--Break down into continent

SELECT location
,population,MAX(total_cases) highest_infected_count,MAX(total_cases/population)*100 highest_pct_infection_rate
FROM CovidDeath 
WHERE continent is  null
GROUP BY location,population
ORDER BY 3 DESC;

SELECT location
,population,MAX(total_deaths) highest_death_count,MAX(total_deaths/population)*100 highest_pct_death_rate
FROM CovidDeath 
WHERE continent is  null
GROUP BY location,population
ORDER BY  3 DESC;

--GLOBAL NUMBERS
SELECT date,SUM(new_cases) total_cases_of_day,SUM(new_deaths) total_deaths_of_day, SUM(new_deaths)/SUM(new_cases)*100 from CovidDeath
where continent is not null
GROUP BY date
ORDER BY date DESC;

---infection adn death toll right now
SELECT SUM(new_cases) total_cases_of_day,SUM(new_deaths) total_deaths_of_day, SUM(new_deaths)/SUM(new_cases)*100 from CovidDeath
where continent is not null

--SELECT * FROM CovidDeath





