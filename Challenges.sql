select c.hacker_id, name,count(c.hacker_id) as c_created
from hackers as h
join challenges as c
on h.hacker_id = c.hacker_id
group by name, c.hacker_id
having
    count(c.hacker_id) = (
        select top(1) count(*)
        from challenges
        group by hacker_id
        order by count(*) desc
    )
    or
    count(c.hacker_id) in (
        select challenge_counter.ct
        from(
            select count(hacker_id) as ct
            from challenges
            group by hacker_id
        ) as challenge_counter
    group by challenge_counter.ct
    having count(challenge_counter.ct)=1
    )
order by c_created desc,c.hacker_id;








