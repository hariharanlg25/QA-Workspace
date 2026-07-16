# 08-Group-By
GROUP BY

Groups records with the same values.

Example

SELECT DepartmentID,
COUNT(*)
FROM Employee
GROUP BY DepartmentID;

Common Uses

Sales by city
Employees by department
Orders by customer