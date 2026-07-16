# 11-CTE
CTE (Common Table Expression)

A temporary named result set.

Syntax

WITH HighSalary AS
(
SELECT *
FROM Employee
WHERE Salary > 50000
)

SELECT *
FROM HighSalary;

Advantages

Improves readability
Simplifies complex queries
Supports recursive queries