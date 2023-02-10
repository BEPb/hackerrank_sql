SELECT
    h.hacker_id,
    h.name
FROM Submissions s
    INNER JOIN Challenges c on s.challenge_id = c.challenge_id
    INNER JOIN Difficulty d on d.difficulty_level = c.difficulty_level
    INNER JOIN Hackers h on s.hacker_id = h.hacker_id
WHERE d.score = s.score
GROUP BY h.hacker_id,h.name
HAVING COUNT(s.hacker_id) > 1
ORDER BY COUNT(s.challenge_id) desc,s.hacker_id;