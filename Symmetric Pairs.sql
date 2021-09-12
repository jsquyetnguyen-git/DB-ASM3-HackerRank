select F.X,F.Y
from Functions as F
join Functions as Ftemp
on F.X = Ftemp.Y and F.Y = Ftemp.X and F.X <F.Y
union
select X,Y
from Functions
where X = Y
group by X,Y
having count(X) > 1
order by F.X;