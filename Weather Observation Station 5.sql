select top(1) city, len(city)
from station
where len(city) = (select min(len(city)) from station)
order by city asc;

select top(1) city, len(city)
from station
where len(city) = (select max(len(city)) from station)
order by city asc;