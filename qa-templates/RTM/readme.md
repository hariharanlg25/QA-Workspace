Requirements Traceability Matrix (RTM) Template

The Requirements Traceability Matrix (RTM) is a grid document that maps high-level business requirements and user stories directly to their corresponding test scenarios and defect logs. This ensures 100% test coverage and makes it easy to assess the quality impact of code changes.

🔍 Why RTM is Vital

Gap Analysis: Instantly highlights any requirements that lack corresponding test coverage.

Impact Analysis: Helps determine which test cases need to be run when a specific requirement is modified.

Release Readiness: Provides stakeholders with a visual representation of requirement pass rates.

📈 RTM Execution Traceability Grid

This grid maps business requirements down to manual test scenarios, automated test methods, execution states, and open defect tickets.

Req ID

User Story Description

Manual Test Case ID

Automated Test Method Reference

Execution Status

Defect ID Link

REQ_AUTH_01

User can authenticate using standard email and password credentials.

TC_AUTH_001



TC_AUTH_002

com.qa.tests.LoginTest.verifyValidLogin()

PASSED

None

REQ_AUTH_02

User can authenticate via corporate Google Single Sign-On (SSO).

TC_AUTH_005



TC_AUTH_006

com.qa.tests.SsoTest.verifyGoogleSsoRedirect()

FAILED

BUG-1089

REQ_CART_01

Dynamic price calculation and tax aggregation on checkout updates.

TC_CART_010



TC_CART_011

com.qa.tests.CartTest.verifyTaxCalculation()

PASSED

None

REQ_CART_02

User can apply a valid promo coupon code to receive discount percentages.

TC_CART_015



TC_CART_016

com.qa.tests.CartTest.verifyCouponCode()

BLOCKED

BUG-1122

REQ_PAY_01

Payments must execute securely over authorized gateway routes.

TC_PAY_020



TC_PAY_021

Pending Automation

PASSED

None

💡 Legend & Status Definitions

PASSED: The linked manual and automated test runs completed with zero assertion failures.

FAILED: An assertion failed during execution, triggering an active defect ticket in the tracking system.

BLOCKED: The test case could not be executed due to an upstream environment or configuration issue.

UNCOVERED: A requirement has been identified but lacks any corresponding manual or automated test cases.