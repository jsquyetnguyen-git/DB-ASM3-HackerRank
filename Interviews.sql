with tbl_totalView as(
    select challenge_id, sum(total_views) as total_views,
    sum(total_unique_views) as total_unique_views
    from View_Stats group by challenge_id),
    tbl_totalSm as(
    select challenge_id, sum(total_submissions) as total_submissions,sum(total_accepted_submissions) as total_accepted_submissions
    from Submission_Stats group by challenge_id )

select ct.contest_id,ct.hacker_id,ct.name,sum(tblS.total_submissions),
    sum(tblS.total_accepted_submissions),
    sum(tblV.total_views),
    sum(tblV.total_unique_views)
from Contests as ct
    join Colleges as cl on ct.contest_id = cl.contest_id
    join Challenges as ch on ch.college_id = cl.college_id
    left join tbl_totalView as tblV on tblV.challenge_id = ch.challenge_id
    left join tbl_totalSm as tblS on tblS.challenge_id = ch.challenge_id
group by ct.contest_id,ct.hacker_id,ct.name
having (sum(tblS.total_submissions)
    +sum(tblS.total_accepted_submissions)
    +sum(tblV.total_views)+sum(tblV.total_unique_views))!=0
ORDER BY ct.contest_ID