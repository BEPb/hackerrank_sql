SELECT
    ROUND(LAT_N,4)
FROM
    (SELECT
        LAT_N,
        PERCENT_RANK()
        OVER (ORDER BY LAT_N) AS PERCENTILE
     FROM STATION) AS A
WHERE PERCENTILE = 0.5;