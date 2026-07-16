High-Density Bug Report Template

A Bug Report is a technical document that logs a software anomaly. It must provide development teams with clear, objective, and reproducible steps to isolate and resolve the defect quickly.

🪪 Defect Summary Block

Defect ID: BUG-1089

Title: [AUTH] [GOOGLE-SSO] Redirection hangs throwing HTTP 502 Bad Gateway during first-time registration

Module / Component: Authentication Microservice (OAuth2 Portal)

Severity: S1 - Blocker (Blocks registration for new users)

Priority: P1 - High (Impacts customer acquisition)

Reporter: [Your Name/Title, e.g., Senior QA Engineer]

Assigned To: [Backend Team Lead]

🌐 Environment Specifications

Environment: QA Staging Sandbox

Build / Version String: v2.4.1-rc3

Browser / OS: Chrome v124.0.5 (64-bit) on macOS Sonoma v14.4

API Version Endpoint: /api/v2/auth/oauth2/google

Test Data Account: qa_new_user_9901@gmail.com

👣 Steps to Reproduce

Follow these exact steps to reproduce the issue:

Open the Chrome browser and navigate to the landing page: https://staging.enterprise-retail.com

Click the "Register" link in the top-right navigation menu.

On the registration modal, click the "Continue with Google" action button.

Authenticate using the valid test credentials: qa_new_user_9901@gmail.com / SecurePass123!.

Grant profile reading permissions on the Google Consent dialog.

Observe the redirection behavior as the app routes back to the staging landing page.

🔍 Expected vs. Actual Results

+---------------------------------------------------------------------------------+
| Expected Result:                                                                |
| 1. System parses Google identity token.                                         |
| 2. App directs user to dashboard (/dashboard) as authenticated.                 |
| 3. Dashboard displays: "Welcome, QA Tester!" within < 1.5 seconds.              |
+---------------------------------------------------------------------------------+
| Actual Result:                                                                  |
| 1. Redirection routes to /auth/callback and hangs for 30 seconds.               |
| 2. Browser displays a raw white screen: "HTTP 502 Bad Gateway."                 |
| 3. Session state remains unauthenticated.                                       |
+---------------------------------------------------------------------------------+


📎 Technical Attachments & Logs

Console Stack Trace (Chrome Developer Tools)

Uncaught (in promise) Error: Authentication pipeline terminated unexpectedly.
    at oauth2-callback.js:45:12
    at async processCallback (oauth2-callback.js:12:4)
[HTTP-ERROR] GET [https://staging.enterprise-retail.com/api/v2/auth/oauth2/callback?code=4%2F0AdQty](https://staging.enterprise-retail.com/api/v2/auth/oauth2/callback?code=4%2F0AdQty)... failed. Status: 502 (Bad Gateway)


Backend Microservice Error Log Capture

2026-07-13T23:05:01.042Z [ERROR] [auth-service] - Failed to exchange auth code with Google API.
java.net.SocketTimeoutException: Read timed out connecting to [accounts.google.com/o/oauth2/token](https://accounts.google.com/o/oauth2/token)
  at java.base/java.net.PlainSocketImpl.socketAccept(Native Method)
  at java.base/java.net.AbstractPlainSocketImpl.accept(AbstractPlainSocketImpl.java:474)
  at java.base/java.net.ServerSocket.implAccept(ServerSocket.java:565)


Visual References

[Capture_Screenshot_502_Error.png] (Attached in the defect ticket directory)