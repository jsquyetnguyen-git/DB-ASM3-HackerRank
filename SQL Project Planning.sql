select start_date, min(end_date)
from
    (select start_date from Projects where start_date not in (select end_date from Projects)) as s
inner join (select end_date from Projects where end_date not in (select start_date from Projects)) as e
on s.start_date < e.end_date
group by start_date
order by datediff(day,start_date,min(end_date)),start_date;