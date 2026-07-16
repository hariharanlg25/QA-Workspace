# 06-Joins
Joins
What are Joins?

Joins combine rows from multiple tables using a related column.

Types
INNER JOIN

Returns matching records only.

SELECT *
FROM Employee E
INNER JOIN Department D
ON E.DeptID = D.DeptID;
LEFT JOIN

Returns all records from the left table.

RIGHT JOIN

Returns all records from the right table.

FULL JOIN

Returns all matching and non-matching rows.

CROSS JOIN

Returns every possible combination.

SELF JOIN

Joins a table with itself.

Applications

Employee and Department
Orders and Customers
Students and Courses