# 09-Having
HAVING

Filters grouped data.

Difference

WHERE filters rows before grouping.

HAVING filters groups after grouping.

Example

SELECT DepartmentID,
COUNT(*)
FROM Employee
GROUP BY DepartmentID
HAVING COUNT(*) > 5;