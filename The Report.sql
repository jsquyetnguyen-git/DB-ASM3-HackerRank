select iif(grade<8,NULL,name), grade, marks
from students as st
join grades as gd
on marks between min_mark and max_mark
order by grade desc, name, marks