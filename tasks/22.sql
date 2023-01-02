SELECT
    CONCAT(name,'(',LEFT(occupation,1),')') AS Name
FROM OCCUPATIONS
ORDER BY name;

SELECT
    CONCAT('There are a total of ',COUNT(*),' ',LOWER(occupation),'s.')
FROM OCCUPATIONS
GROUP BY occupation
ORDER BY COUNT(*) ASC;