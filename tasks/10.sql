SELECT
    city,
    LENGTH(city) AS city_length
FROM STATION
WHERE LENGTH(city) = (SELECT
                        MIN(LENGTH(city))
                        FROM STATION)
    OR
      LENGTH(city) = (SELECT
                        MAX(LENGTH(city))
                        FROM STATION)
ORDER BY
    length(city)desc,
    city ASC
limit 2;