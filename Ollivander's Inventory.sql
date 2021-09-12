select (
    select id
    from Wands_property as wp
    join wands as w
    on wp.code = w.code
    where w.coins_needed = temp.coin and w.power = temp.power and wp.age = temp.age
) as id
,temp.*
    from
    (select age,min(coins_needed) as coin,power
    from Wands_property as wp join wands as w on wp.code = w.code
    where wp.is_evil <> 1
    group by age,power) as temp
order by power desc, age desc