1. Show alternate records from the table.

Solution 1-

SELECT Id, Name
FROM Employee
WHERE Id % 2 = 0

Solution 2 - If Id columns is not available

SELECT e.Name, e.Salary
FROM (
    SELECT Name, Salary, Row_Number() OVER(ORDER BY Name) AS RowNumber 
    FROM Employee
) e
WHERE e.RowNumber % 2 = 0

Solution 3 -  CTE

With CTERow(
 SELECT Name, Salary, Row_Number() OVER(ORDER BY Name) AS RowNumber 
    FROM Employee)
SELECT *
FROM CTERow
WHERE RowNumber % 2 = 0;
