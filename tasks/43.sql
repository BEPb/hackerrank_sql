SELECT
    h.hacker_id,
    h.name,
    sum(s.max_score) as total_score
FROM Hackers h
JOIN (
    SELECT
        hacker_id,
        challenge_id,
        MAX(score) as max_score
    FROM Submissions
    GROUP BY 1,2) s
ON h.hacker_id = s.hacker_id
GROUP BY 1,2
HAVING sum(s.max_score) > 0
ORDER BY sum(s.max_score) DESC, h.hacker_id ASC