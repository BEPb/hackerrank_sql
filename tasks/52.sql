WITH count_challenge AS (
    SELECT
        Hackers.hacker_id,
        name,
        COUNT(challenge_id) AS num_of_chal
    FROM Hackers, Challenges
    WHERE Hackers.hacker_id = Challenges.hacker_id
    GROUP BY Hackers.hacker_id, name),
max_challenge AS (
    SELECT
        MAX(count_challenge.num_of_chal) AS max_count
    FROM count_challenge),
count_num_challenge AS (
    SELECT
        DISTINCT num_of_chal,
        COUNT(num_of_chal) AS count_num
    FROM count_challenge
    GROUP BY num_of_chal
)

SELECT
    Hackers.hacker_id,
    Hackers.name,
    cc.num_of_chal
FROM Hackers, count_challenge cc, count_num_challenge cnc, max_challenge
WHERE   Hackers.hacker_id = cc.hacker_id &&
        cc.num_of_chal = cnc.num_of_chal &&
        (count_num > 1 && cnc.num_of_chal = max_challenge.max_count || count_num = 1)
ORDER BY num_of_chal DESC, hacker_id;