Test Case & Edge-Case Matrix Template

A Test Case is a highly structured document that specifies the inputs, execution preconditions, testing steps, expected results, and actual outcomes for a single validation target.

📊 Standard Functional Test Case Format

Test Case ID: TC_AUTH_012

Module / Feature: User Authentication / Login

Priority: High

Test Type: Functional / Negative

Preconditions:

The user possesses an active, registered account with username testuser_01 and password SecurePassword123!.

The browser is opened on the /login page endpoint in a clean, incognito session.

Execution Steps & Assertions

Step #

User Action

Expected System Response

Actual Result

Pass / Fail

1

Enter valid username testuser_01 into the username field.

Username field displays the input value with no validation errors.

As expected.

Pass

2

Enter an invalid password string WrongPassword99 into the password field.

Password characters are masked. No validation alert is shown yet.

As expected.

Pass

3

Click the 'Login' action button.

1. Page redirects to /login with an error alert.



2. Alert displays: "Invalid credentials."



3. Security JWT token is NOT generated.

As expected.

Pass

4

Inspect the HTTP network tab.

Network trace returns an HTTP 401 Unauthorized status code payload.

As expected.

Pass

Postconditions: The browser session remains unauthenticated. The user is blocked from viewing /dashboard.

🎯 Boundary Value Analysis (BVA) & Equivalence Partitioning (EP) Matrix

When verifying numerical or range inputs, utilize this matrix to design high-density, risk-optimized input values.

Scenario: Product Order Quantity Selector (Accepts Integers 1 to 10 inclusive)

Equivalence Partition:
[ Invalid: <= 0 ] <----- [ Valid Range: 1 to 10 ] -----> [ Invalid: >= 11 ]


Input Value

Partition / Boundary Class

Expected System Behavior

Test Case ID Reference

-5

Invalid Partition (Negative boundary)

System blocks input, showing: "Quantity must be at least 1."

TC_QTY_EP_001

0

Boundary Point ($B-1$) - Invalid

System blocks transaction, showing: "Quantity must be at least 1."

TC_QTY_BVA_002

1

Boundary Point ($B$) - Valid (Minimum)

Quantity updates to 1. Total order value adjusts correctly.

TC_QTY_BVA_003

2

Boundary Point ($B+1$) - Valid

Quantity updates to 2.

TC_QTY_BVA_004

5

Valid Partition (Typical Value)

Quantity updates to 5.

TC_QTY_EP_005

9

Boundary Point ($B-1$) - Valid

Quantity updates to 9.

TC_QTY_BVA_006

10

Boundary Point ($B$) - Valid (Maximum)

Quantity updates to 10.

TC_QTY_BVA_007

11

Boundary Point ($B+1$) - Invalid

System blocks input, showing: "Maximum order limit is 10."

TC_QTY_BVA_008

100

Invalid Partition (Extreme value)

Input truncated or blocked instantly.

TC_QTY_EP_009

"abc"

Invalid Partition (Data-Type Mismatch)

Strips non-numeric inputs instantly, defaulting field to 1.

TC_QTY_EP_010