1. Show max salary per department

SELECT d.deptid, MAX(Salary)
FROM Department d JOIN Employee e
ON e.deptid = d.id
GROUP BY d.deptid

Note that sometimes departments may not have employees so consider LEFT JOIN.
