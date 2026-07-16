# 12-Window-Functions
Window Functions

Perform calculations without collapsing rows.

Common Functions

ROW_NUMBER()

Assigns unique numbers.

SELECT *,
ROW_NUMBER() OVER
(
ORDER BY Salary DESC
)
FROM Employee;
RANK()

Handles ties.

DENSE_RANK()

Ranks without gaps.

LEAD()

Looks ahead.

LAG()

Looks behind.

NTILE()

Divides rows into groups.

Running Total
SUM(Salary)
OVER
(
ORDER BY EmployeeID
)

Applications

Rankings
Pagination
Running totals
Trend analysis