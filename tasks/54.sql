WITH recursive temp_table AS (
    SELECT
        1 AS u,
        CAST('*' as CHAR(50)) AS result
        UNION ALL
    SELECT u + 1,
    repeat('* ', u + 1) AS result
    FROM temp_table WHERE u < 20
)

SELECT result FROM temp_table;