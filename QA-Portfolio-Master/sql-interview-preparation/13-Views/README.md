# 13-Views
Views

A virtual table based on a query.

Create View

CREATE VIEW EmployeeView AS

SELECT Name,
Salary

FROM Employee;

Query

SELECT *
FROM EmployeeView;

Advantages

Security
Reusability
Simplifies complex queries