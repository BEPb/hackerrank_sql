SELECT
    DISTINCT CITY
FROM STATION
WHERE
    (CITY not LIKE 'a%' and
     CITY not LIKE 'e%' and
     CITY not LIKE 'i%' and
     CITY not LIKE 'o%' and
     CITY not LIKE 'u%')
     OR
     (CITY not LIKE '%a' and
      CITY not LIKE '%e' and
      CITY not LIKE '%i' and
      CITY not LIKE '%o' and
      CITY not LIKE '%u')