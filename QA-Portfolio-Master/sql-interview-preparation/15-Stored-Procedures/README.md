# 15-Stored-Procedures
Stored Procedures

A stored procedure is a precompiled collection of SQL statements stored in the database.

Example

CREATE PROCEDURE GetEmployee

AS

BEGIN

SELECT *

FROM Employee;

END;

Execute

EXEC GetEmployee;

Advantages

Reusable
Better performance
Secure
Easy maintenance