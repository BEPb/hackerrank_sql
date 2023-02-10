SELECT
    b.submission_date, COALESCE(a.contSub,0), b.id, c.name
FROM (
    SELECT o.submission_date, MIN(o.hacker_id) AS id
    FROM (
        SELECT n.submission_date, n.hacker_id,COUNT(n.submission_id)
        FROM Submissions n
        GROUP BY submission_date, hacker_id
        HAVING COUNT(submission_id)>= ALL(
              SELECT COUNT(m.submission_id)
              FROM Submissions m
              GROUP BY m.submission_date, m.hacker_id
              HAVING m.submission_date=n.submission_date
          )
    ) AS o
    GROUP BY submission_date
    ) AS b
LEFT JOIN (
    SELECT aa.submission_date, COUNT(DISTINCT aa.hacker_id) AS contSub
    FROM Submissions AS aa
    WHERE aa.submission_date='2016-03-01'
    OR submission_date<ALL(
        SELECT bb.submission_date
        FROM (
            SELECT tdy.hacker_id, tdy.submission_date, ytd.submission_date AS SubmittedYtd
            FROM Submissions tdy LEFT JOIN Submissions ytd
            ON DATE_ADD(tdy.submission_date, INTERVAL -1 DAY)= ytd.submission_date
            AND ytd.hacker_id=tdy.hacker_id
        ) AS bb
        WHERE aa.hacker_id=bb.hacker_id AND bb.submission_date<> STR_TO_DATE('2016-03-01', '%Y-%m-%d') AND bb.SubmittedYtd IS NULL
    )
    GROUP BY aa.submission_date
) AS a
ON a.submission_date=b.submission_date
JOIN Hackers c ON b.id=c.hacker_id
ORDER BY a.submission_date ASC