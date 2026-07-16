1. DDL (Data Definition Language)
What is DDL?

Data Definition Language (DDL) consists of SQL commands used to define, modify, and delete the structure of database objects such as tables, databases, indexes, and schemas.

Unlike DML, DDL does not manipulate data; instead, it manages the database structure.

Common DDL Commands
CREATE

Creates new database objects.

Example:

CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100),
    Salary DECIMAL(10,2)
);
ALTER

Modifies an existing database object.

Example:

ALTER TABLE Employee
ADD Email VARCHAR(100);
DROP

Deletes an object permanently.

Example:

DROP TABLE Employee;
TRUNCATE

Removes all rows from a table but keeps the table structure.

Example:

TRUNCATE TABLE Employee;
RENAME

Changes the name of a table or object.

Example (MySQL):

RENAME TABLE Employee TO Employees;
Characteristics
Defines database structure
Automatically commits changes in most databases
Cannot usually be rolled back
Affects metadata# 01-DDL
