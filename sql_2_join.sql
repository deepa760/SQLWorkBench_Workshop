# SQL Join exercise
use world;

#
# 1: Get the cities with a name starting with ping sorted by their population with the least populated cities first
select c.Name,c.* from city c where c.Name like 'ping%' order by c.population asc
#
# 2: Get the cities with a name starting with ran sorted by their population with the most populated cities first

Select c.Name,c.* from city c where c.Name like 'ran%' order by c.population desc
#
# 3: Count all cities
select count(*) from city
#
# 4: Get the average population of all cities
select avg(population) from city
#
# 5: Get the biggest population found in any of the cities
select max(c.Population) from city c 
#
# 6: Get the smallest population found in any of the cities
select min(c.Population) from city c
#
# 7: Sum the population of all cities with a population below 10000
select sum(Population) from city where Population < 10000
#
# 8: Count the cities with the countrycodes MOZ and VNM
select count(*) "City Count" from city where countrycode in ('MOZ','VNM')
#
# 9: Get individual count of cities for the countrycodes MOZ and VNM
select count(*) "City Count", countrycode from city where countrycode in ('MOZ','VNM') group by countrycode
#
# 10: Get average population of cities in MOZ and VNM
select avg(population) "Average Population", countrycode from city where countrycode in ('MOZ','VNM') group by countrycode
#
# 11: Get the countrycodes with more than 200 cities

select count(name),countrycode from city group by countrycode having count(name) > 200

# 12: Get the countrycodes with more than 200 cities ordered by city count
select count(name), countrycode from city group by countrycode having count(name) > 200 order by count(name)
#
# 13: What language(s) is spoken in the city with a population between 400 and 500 ?
select c.name,l.Language from city c, countrylanguage l where c.CountryCode = l.countryCode
and c.Population between 400 and 500
#
# 14: What are the name(s) of the cities with a population between 500 and 600 people and the language(s) spoken in them
select c.Population,c.name,l.Language from city c, countrylanguage l where c.CountryCode = l.countryCode
and c.Population between 500 and 600
#
# 15: What names of the cities are in the same country as the city with a population of 122199 (including the that city itself)
select * from city where Population = 122199
#
# 16: What names of the cities are in the same country as the city with a population of 122199 (excluding the that city itself)
select * from city where Population != 122199
#
# 17: What are the city names in the country where Luanda is capital?
select cr.*,c.* from country cr, city c where cr.Code = c.CountryCode and cr.capital = 'Luanda'
#
# 18: What are the names of the capital cities in countries in the same region as the city named Yaren
#
#
# 19: What unique languages are spoken in the countries in the same region as the city named Riga
#
#
# 20: Get the name of the most populous city

select name, max(population) from 
select (name, count(population) from city group by population)
