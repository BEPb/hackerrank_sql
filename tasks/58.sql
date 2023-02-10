SELECT std.name
FROM students std
JOIN friends frnd ON std.id=frnd.id
JOIN packages std_pkg ON std.id=std_pkg.id
JOIN packages frnd_pkg ON frnd.friend_id=frnd_pkg.id
WHERE frnd_pkg.salary > std_pkg.salary
ORDER BY frnd_pkg.salary;