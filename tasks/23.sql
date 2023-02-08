WITH temp AS (
SELECT
    CASE
        WHEN occupation='doctor' THEN name
    END AS doctor,
    CASE
        WHEN occupation='professor' THEN name
    END AS professor,
    CASE
        WHEN occupation='singer' THEN name
    END AS singer,
    CASE
        WHEN occupation='actor' THEN name
    END AS actor,
    row_number() over (partition by occupation ORDER BY name) as ran
FROM occupations)
SELECT
    min(doctor),
    min(professor),
    min(singer),
    min(actor)
FROM temp
GROUP BY ran