select convert(decimal(18,4),long_w)
from station
where lat_n = (select min(lat_n) from station where lat_n > 38.7780);