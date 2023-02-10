SELECT
    CONCAT(2, '&', REPLACE(GROUP_CONCAT(T2.n ORDER BY T2.n), ',', '&'))
FROM
    ( SELECT
        T.n FROM ( WITH recursive counter AS (
            SELECT
                2 AS n
                UNION SELECT
                    n + 1
                FROM counter
                WHERE n < 1000 )
             SELECT
                c1.n AS n,
                MOD(c1.n, c2.n) AS r
                FROM counter AS c1,
        counter AS c2
        WHERE c1.n > c2.n ) AS T
        GROUP BY T.n
        HAVING MIN(T.r) > 0
        ORDER BY T.n ) AS T2;
