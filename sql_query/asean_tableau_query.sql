--Q1 total-cases, total-deaths and pct-deth in ASEAN nations
------Brunei, Cambodia, Indonesia, Laos, Malaysia, Myanmar, the Philippines, Singapore, Thailand, and Vietnam
SELECT SUM(new_cases) total_cases,SUM(new_deaths)  total_deaths,SUM(new_deaths)/SUM(new_cases)*100  death_pct 
FROM CovidDeath
where location ='Brunei' or location ='Cambodia' or location ='Indonesia'  or location ='Laos' or location ='Malaysia'  
or location='Myanmar' or location='Philippines' or location='Singapore' or location='Thailand' or location='Vietnam'
;

--Q2 total_cases,total-deaths and death-pct for each country
SELECT location,SUM(new_cases) total_cases,SUM(new_deaths) total_deaths,SUM(new_deaths)/SUM(new_cases)*100  death_pct 
FROM CovidDeath
where location ='Brunei' or location ='Cambodia' or location ='Indonesia'  or location ='Laos' or location ='Malaysia'  
or location='Myanmar' or location='Philippines' or location='Singapore' or location='Thailand' or location='Vietnam'
Group by location
ORDER BY 4 Desc
;


--Q3 highest invection count vs population 
SELECT location,population,MAX(total_cases) highest_infection_count,MAX(total_cases/population) *100 pct_population_infected
FROM CovidDeath
where location ='Brunei' or location ='Cambodia' or location ='Indonesia'  or location ='Laos' or location ='Malaysia'  
or location='Myanmar' or location='Philippines' or location='Singapore' or location='Thailand' or location='Vietnam'
group by location,population
ORDER BY 4 DESC;


--Q4
SELECT location,population,date,MAX(total_cases) highest_infection_count,MAX((total_cases/population)) *100 pct_population_infected
FROM CovidDeath
where location ='Brunei' or location ='Cambodia' or location ='Indonesia'  or location ='Laos' or location ='Malaysia'  
or location='Myanmar' or location='Philippines' or location='Singapore' or location='Thailand' or location='Vietnam'
group by location,population,date
ORDER BY 1,3 ;
