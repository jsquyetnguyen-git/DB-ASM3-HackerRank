select convert(decimal(18,4),long_w)
from station
where lat_n = (select max(lat_n) from station where lat_n < 137.2345);