SELECT * FROM CovidDeath
ORDER BY date;
SELECT * FROM CovidVacination
ORDER BY date;

--JOIN COVIDDEATH AND COVIDVACINATION
SELECT * from CovidDeath dea
JOIN CovidVacination vac
ON  dea.location=vac.location and dea.date=vac.date
Order by vac.location,vac.date;

--Hospital patients VS icu_patients
SELECT location,SUM(CAST(icu_patients as int)) total_icu_patients,SUM(CAST(hosp_patients as int)) total_hospital_patients
,SUM(CAST(icu_patients as float))/SUM(CAST(hosp_patients as float))*100 pct_avg_patients_icu
from CovidDeath
WHERE continent is not null 
GROUP BY location,population
order by 4 DESC;

--half-vaccinated VS fully vaciated(COUNTRIES WITHOUT  BOOSTER SHOT)
SELECT location,SUM(cast(total_vaccinations AS float)) total_vaccinations
,SUM(CAST(people_vaccinated as float)) half_vaccinated,SUM(CAST(people_vaccinated as float))/SUM(cast(total_vaccinations AS float))*100 pct_half_vaccinated,
SUM(Cast(people_fully_vaccinated AS float)) fully_vaccinated,SUM(CAST(people_fully_vaccinated as float))/SUM(cast(total_vaccinations AS float))*100 pct_fully_vaccinated
FROM CovidVacination
where  continent is not null AND CAST(total_boosters as int) is null and location='Myanmar'
GROUP BY location
ORDER BY 6 DESC;


