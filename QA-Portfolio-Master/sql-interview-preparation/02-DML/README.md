# 02-DML
. DML (Data Manipulation Language)
What is DML?

DML is used to insert, update, delete, and retrieve data stored in tables.

Common Commands
INSERT

Adds new records.

INSERT INTO Employee
VALUES (101,'Hari',50000);
UPDATE

Updates existing records.

UPDATE Employee
SET Salary = 60000
WHERE EmployeeID = 101;
DELETE

Deletes records.

DELETE FROM Employee
WHERE EmployeeID = 101;
SELECT

Retrieves data.

SELECT *
FROM Employee;
Characteristics
Works with data
Can be rolled back before commit
Most frequently used SQL commands