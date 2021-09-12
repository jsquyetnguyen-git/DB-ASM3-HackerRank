select hk.hacker_id, hk.name, sum(maxs)
from hackers as hk
join (
    select hacker_id, challenge_id, max(score) as maxs
    from submissions
    where score > 0
    group by hacker_id, challenge_id
) as sm
on hk.hacker_id = sm.hacker_id
group by hk.hacker_id, hk.name
order by sum(maxs) desc, hk.hacker_id