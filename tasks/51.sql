SELECT
    id,
    age,
    coins_needed,
    power
FROM WANDS AS W INNER JOIN WANDS_PROPERTY AS P
ON W.code = P.code
WHERE P.is_evil = 0 AND
W.coins_needed = (SELECT MIN(coins_needed)
                  FROM WANDS AS W1 INNER JOIN WANDS_PROPERTY AS P1
                  ON W1.code = P1.code
                  WHERE W.power = W1.power AND P.age = P1.age)
ORDER BY W.POWER DESC, P.AGE DESC;