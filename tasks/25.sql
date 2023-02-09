SELECT
    c.company_code,
    c.founder,
    COUNT(DISTINCT l.lead_manager_code),
    COUNT(DISTINCT s.senior_manager_code),
    COUNT(DISTINCT ma.manager_code),
    COUNT(DISTINCT e.employee_code)
FROM company c
    RIGHT JOIN lead_manager l ON l.company_code = c.company_code
    RIGHT JOIN senior_manager s ON s.company_code = c.company_code
    RIGHT JOIN manager ma ON ma.company_code = c.company_code
    RIGHT JOIN employee e ON e.company_code = c.company_code
GROUP BY c.company_code, founder