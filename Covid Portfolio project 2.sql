

Select *
From PortfolioProject..covidDeaths
order by 3,4

--Select *
--From PortfolioProject..covidVaccinations
--order by 3,4
--select data that we are going to be using

Select Location, date, total_cases, new_cases,total_deaths, Population
From PortfolioProject..covidDeaths
order by 1,2

--Looking at the total cases vs total deaths
Select Location, date, total_cases,total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
From PortfolioProject..covidDeaths
order by 1,2

--looking at the total cases vs the population
--Shows what percentage of population got covid
Select Location, date, Population, total_cases, (total_cases/Population)*100 as PecentPopulationInfected
From PortfolioProject..covidDeaths
--Where Location like '%states%'
order by 1,2

--Looking at countries with highest infection rate compared to population
Select Location, population, MAX(total_cases) as HighestInfectionCount, MAX((total_cases/population))*100 as PercentPopulationInfected
From PortfolioProject..CovidDeaths
--Where Location like '%states%'
Group by Location, population
order by PercentPopulationInfected desc

--showing the countries with the highest death count per population
Select Location, MAX(cast(total_deaths as int)) as TotalDeathCount
From PortfolioProject..CovidDeaths
--Where Location like '%states%'
Group by Location
order by TotalDeathCount desc
