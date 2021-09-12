SELECT E.company_code,C.founder,COUNT(distinct lead_manager_code), COUNT(distinct senior_manager_code), COUNT(distinct manager_code), COUNT(distinct employee_code)
FROM employee as E
JOIN company as C
ON E.company_code = C.company_code
GROUP BY E.company_code, C.founder
ORDER BY company_code