SELECT
    P3.sd,P3.ed
FROM
    (SELECT
        MIN(P1.Start_Date) AS sd,
        P2.End_Date  AS ed
    FROM Projects AS P1
    INNER JOIN Projects AS P2
    ON  p2.End_Date
        NOT IN (SELECT
                    Start_Date
                FROM Projects)
    AND
    (SELECT
        COUNT(*)
     FROM Projects
     WHERE Start_Date BETWEEN P1.Start_Date AND P2.End_Date ) = DATEDIFF(P2.End_Date,P1.Start_Date)
    GROUP BY P2.End_Date) AS P3
ORDER by DATEDIFF(P3.ed, P3.sd), P3.sd ;