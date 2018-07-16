1. Get second highest salary among all employees.

Solution 1 - 

SELECT MAX(Salary) 
FROM Employee
WHERE Salary NOT IN (SELECT MAX(Salary) FROM Employee);

Solution 2 -

SELECT TOP 1 Salary 
FROM Employee
WHERE Salary IN ( SELECT TOP 2 Salary FROM Employee ORDER BY Salary DESC)
ORDER BY Salary ASC;

Solution 3 -

SELECT Salary 
FROM Employee e 
WHERE N=(SELECT COUNT(DISTINCT Salary) FROM Employee p WHERE e.Salary<=p.Salary)

To find Nth highest salary - Inner query will be executed for each execution of outer query. Returns the number of records 
records having salary < current salary. For second highest salary, the query will stop when inner query will return 2. 


