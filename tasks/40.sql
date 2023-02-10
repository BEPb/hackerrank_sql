SELECT
    ROUND((Max(Lat_N)-Min(Lat_N))+(Max(LONG_W)-Min(LONG_W)), 4)
FROM STATION