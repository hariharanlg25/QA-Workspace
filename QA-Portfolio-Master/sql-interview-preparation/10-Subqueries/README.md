# 10-Subqueries
Subqueries

A query inside another query.

Types

Single Row
SELECT *
FROM Employee
WHERE Salary >
(
SELECT AVG(Salary)
FROM Employee
);
Multiple Row
SELECT *
FROM Employee
WHERE DepartmentID IN
(
SELECT DepartmentID
FROM Department
);
Correlated Subquery

Executes once for every outer row.  