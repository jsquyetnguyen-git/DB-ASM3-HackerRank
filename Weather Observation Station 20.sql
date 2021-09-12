with st as(
select lat_n, (select count(lat_n) from station) as max, row_number() over(order by lat_n) as rown
from station) 

select TOP 1 case
    when (max%2=0) then (select convert(numeric(18,4),0.5*((select lat_n from st where rown = max/2)+(select lat_n from st where rown=1+(max/2)))))
    else
    (select convert(numeric(18,4),lat_n) as Y from st where rown = 1+(max/2))
    end
from st
