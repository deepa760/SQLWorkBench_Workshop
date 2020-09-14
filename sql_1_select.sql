# SQL select query exercise
#
# World database layout:
# To use this database from a default MySQL install, type: use world;
#
# Table: City
# Columns: Id,Name,CountryCode,District,Population
#
# Table: Country
# Columns: Code, Name, Continent, Region, SurfaceArea, IndepYear, Population, LifeExpectancy, GNP, Capital
#
# Table: CountryLanguage
# Columns: CountryCode, Language, IsOfficial,Percentage
#
#
use world;
# 1: Get a query to return "Hello World", 123
# (Hint: 1 row, 2 columns)countrylanguage
select  "Hello World",123 from dual;
#
desc countrylanguage;

#
# 2: Get everything from the city table
# (Hint: Many many rows)
select * from city;
#
#
# 3: Get everything on the cities whose district is "aceh"
# (Hint: 2 rows)
select * from city where district like "%aceh%";
#
desc city;
# 4: Get only the name of the cities where the countrycode is "bfa"
select   distinct name FROM city where countrycode="bfa";

#
#
# 5: Get both the name and district of the cities where the countrycode is "tto"
select name and district from city where countrycode="tto";
#
#
# 6: Get the name and district named as nm,dist from the cities where the countrycode is "arm"
#
#select name and district as nm
# 7: Get the cities with a name that starts with "bor"
#
select  name from city where name like  "bor%";
# 8: Get the cities with a name that contains the string "orto"
select name  from city where name like "%orto%";
#
# 9: Get the cities that has a population below 1000
SELECT  name,COUNT(Population)from city where population<1000;

# 10: Get the unique countrycodes from the cities that has a population below 1000
SELECT DISTINCT CountryCode from city where population <1000;

# 11: Get the cities with the countrycode UKR that has more than 1000000 (one million) in population

select name,CountryCode from city where  countryCode = "UKR" and population > 1000000;

# 12: Get the cities with a population of below 200 or above 9500000 (9.5 million)
 
select c.name,c.CountryCode,c.population from city c where  population > 9500000 or population < 200;

# 13: Get the cities with the countrycodes TJK, MRT, AND, PNG, SJM
SELECT c.name, c.CountryCode from city c where c.countryCode in ( 'TJK', 'MRT', 'AND', 'PNG', 'SJM')
#
# 14: Get the cities with a population between 200 and 700 inclusive
select c.* from city c where c.population >=200 and c.population <=700
#
# 15: Get the countries with a population between 8000 and 20000 inclusive
select cr.* from country cr where cr.population between 8000 and 20000
#
# 16: Get the name of the countries with a independence year (indepyear) before year 0
select cr.Name, cr.IndepYear from country cr where cr.IndepYear < 0
#
# 17: Get the countries that has no recorded independence year and a population above 1000000
select cr.Name, cr.IndepYear,cr.Population from country cr where cr.IndepYear is null and cr.population >1000000
#
# 18: Get countries with a SurfaceArea below 10 and a defined LifeExpectancy
select cr.Name, cr.SurfaceArea,cr.LifeExpectancy,cr.* from country cr where cr.SurfaceArea < 10 and cr.LifeExpectancy is not null

