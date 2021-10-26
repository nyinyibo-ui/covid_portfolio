SELECT * FROM CovidVacination

--Join coviddeath db with covidvacination db
SELECT * FROM CovidDeath CD
JOIN CovidVacination CV
ON CD.location=CV.location
	and CD.date=CV.date

;

c
WITH popvsvac as
(
SELECT CV.location,population,CV.date,new_vaccinations,
SUM(convert(int,new_vaccinations)) OVER(partition by CV.location order by CD.date) rollingPeopleVaccinated
FROM CovidDeath CD
JOIN CovidVacination CV
ON CD.location=CV.location
	and CD.date=CV.date
WHERE CD.continent is not null 
--order by 3 DESC
)
SELECT location,population,date,new_vaccinations,rollingPeopleVaccinated,rollingPeopleVaccinated/population*100 pct_vaccinated_per_day 
FROM popvsvac
order by location,date DESC
;


--LOOK AT TOTAL POPULATION VS VACINATION(WITH temp table)
DROP TABLE IF exists #peop_VS_vac_temp;
CREATE TABLE #peop_VS_vac_temp
(location nvarchar(550),
population float,
date nvarchar(255),
new_vaccinations nvarchar(255),
rollingPeopleVaccinated  nvarchar(255),
)

insert into #peop_VS_vac_temp
SELECT CV.location,population,CV.date,new_vaccinations,
SUM(convert(int,new_vaccinations)) OVER(partition by CV.location order by CD.date) rollingPeopleVaccinated
FROM CovidDeath CD
JOIN CovidVacination CV
ON CD.location=CV.location
	and CD.date=CV.date
WHERE CD.continent is not null 

SELECT location,population,date,new_vaccinations,rollingPeopleVaccinated,rollingPeopleVaccinated/population*100 pct_vaccinated_per_day 
FROM #peop_VS_vac_temp
order by location,date 
;