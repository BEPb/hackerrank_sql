SELECT
    CITY
FROM STATION
WHERE
    CITY LIKE 'a%' or
    CITY LIKE 'e%' or
    CITY LIKE 'i%' or
    CITY LIKE 'o%' or
    CITY LIKE 'u%'
GROUP BY CITY;