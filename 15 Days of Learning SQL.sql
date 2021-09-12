WITH RE AS
(
    SELECT submission_date, hacker_id FROM Submissions
    WHERE day(submission_date) = '01'
    UNION ALL
    SELECT s.submission_date, s.hacker_id FROM RE as ri
    JOIN Submissions s ON ri.hacker_id = s.hacker_id and s.submission_date = DATEADD(DAY, 1, ri.submission_date)
)

SELECT temp1.submission_date,temp1.counter,temp2.hacker_id, temp2.name
FROM
    (SELECT submission_date as submission_date,count(distinct hacker_id) as counter
        FROM RE
        GROUP BY submission_date) as temp1
    JOIN
    (
    SELECT submission_date,ac.hacker_id,hk.name from(
        SELECT submission_date, hacker_id,count(*) as counter,
        row_number() over(partition by submission_date order by count(*) desc,hacker_id) as rownumber
        FROM submissions
        GROUP BY submission_date, hacker_id) as ac
        JOIN hackers as hk on ac.hacker_id = hk.hacker_id
    WHERE rownumber = 1) as temp2
ON temp1.submission_date = temp2.submission_date
ORDER BY temp1.submission_date