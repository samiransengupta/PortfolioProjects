select * from covid_deaths$
order by date 

select * from covid_vaccination$
order by date 

select location, date, total_cases, new_cases, total_deaths, population
from covid_deaths$
order by location,date

-- Total Cases VS Total Deaths (likelyhood of getting infected and dying)

select location, date, total_cases,  total_deaths, (total_deaths/total_cases)*100 as Death_Percentage
from covid_deaths$
--where location like 'India'
order by location,date

-- Total Cases vs Population

select location, date, population, total_cases, (total_cases/population)*100 as Infected_Percentage
from covid_deaths$
where location like 'India'
order by location,date

-- Countries with highest infection rate compared to population

select location, population, max(total_cases) as highest_infected_count, max((total_cases/population))*100 as Infected_Percentage
from covid_deaths$
group by location,population
order by Infected_Percentage desc

-- Countries with higest Death count per Population

select location,max(cast(total_deaths as int)) as Total_death_count 
from [dbo].[covid_deaths$]
where continent is not null
group by location
order by Total_death_count desc

-- Countries with higest Death count per Population
select location,max(cast(total_deaths as int)) as Total_death_count 
from [dbo].[covid_deaths$]
where continent is null
group by location
order by Total_death_count desc

-- vaccination

-- Population VS Vaccination

select D.continent,D.location, D.date, D.population, V.new_vaccinations
from covid_deaths$ as D
join covid_vaccination$ as V
on D.location = V.location
and D.date = V.date
where D.continent is not null


