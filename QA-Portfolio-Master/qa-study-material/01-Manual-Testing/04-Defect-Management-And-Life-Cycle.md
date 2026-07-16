# Defect Management and the Bug Life Cycle

## 1. Definition
A **Defect** (or Bug) is an anomaly, flaw, or imperfection in a software component or system that causes it to fail to perform its required function or deviate from specified business requirements. 

The **Bug Life Cycle** refers to the specific, step-by-step psychological states and operational workflow transitions an identified defect undergoes from its initial discovery by QA until its verified closure and archival.

## 2. Why is it needed?
* **Accountability & Tracking:** Ensures no discovered software vulnerability or functional flaw is overlooked, lost, or left unaddressed.
* **Process Transparency:** Minimizes operational friction between development and QA tracks by establishing unambiguous ownership of code issues.
* **Metrics & Analytics:** Enables engineering leaders to analyze historical defect trends, density maps, and fix turnaround times to assess build health.

## 3. Key Characteristics
* **State Machine Nature:** Operates as a strict behavioral state machine where state transitions must follow predefined corporate governance workflows.
* **Bi-Dimensional Severity/Priority:** Decouples the structural impact on technical architecture from the commercial impact on business timelines.

## 4. Architecture / Internal Working
The lifecycle of a bug maps the structured movement of an issue between QA Engineers, Product Managers, and Software Developers:



[Image of the bug life cycle flowchart]


```mermaid
graph TD
    A[NEW: Logged by QA] --> B[ASSIGNED: Dispatched to Dev]
    B --> C{Dev Evaluation}
    C -->|Valid Bug| D[OPEN: Work In Progress]
    C -->|Duplicate/Invalid| E[REJECTED/REJECTED]
    C -->|Postponed Release| F[DEFERRED]
    D --> G[FIXED: Code Checked-In]
    G --> H[RETESTING: Claimed by QA]
    H --> I{QA Verification}
    I -->|Fix Verified| J[CLOSED: Final State]
    I -->|Fix Failed| K[REOPENED]
    K --> B
5. Types
Defects are primarily classified across two distinct, objective scales:

Severity (Technical Impact): Catastrophic/Blocker, Major, Moderate, Minor.

Priority (Business Urgency): High, Medium, Low.

6. Syntax / Configuration
(Theoretical Chapter. Production ticketing configurations are executed via Jira workflow schemas or GitHub Issues YAML configurations).

7. Parameters
A comprehensive defect log schema must contain the following parameters:

Defect ID: Unique cryptographic or sequential identity tag (e.g., BUG-4021).

Summary/Title: Highly concise declaration of the failure condition.

Environment Specs: OS version, browser engine build, network constraints, or test data parameters.

Steps to Reproduce: Unambiguous step-by-step user input logs.

Expected Result: The specification compliant system behavior.

Actual Result: The observed runtime failure behavior.

Attachments: Isolated log captures, network payloads, or video recordings.

8. Rules / Constraints
Immutability Rule: Once a bug is marked as CLOSED, it should never be modified. If the defect re-emerges in a subsequent development branch, it must be tracked under a new Defect ID to preserve historical metric telemetry.

Isolation Constraint: One bug report must capture exactly one single underlying problem. Merging separate errors into a single report ruins team metric data and slows down verification.

9. Advantages
Maximizes clarity, preventing broken code arguments between engineering teams.

Accelerates code resolution by providing developers with clear instructions to reproduce errors.

Provides historic regression tracking profiles for downstream automation target analysis.

10. Disadvantages
Maintaining high tracking quality can generate administrative overhead if teams over-complicate ticket schemas.

Poorly written bug reports can slow things down by forcing back-and-forth communication loops over missing reproduction details.

11. Best Practices
The Golden Rule of Bug Writing: Write a clear title that concisely answers three core questions: What broke, Where did it occur, and Under what conditions?

Isolate Root Causes: Perform exploratory analysis to find the exact boundary condition before logging a defect. Do not just report "App Crashed"; report the precise input threshold that caused the crash.

12. Common Mistakes
Emotional Reporting: Using subjective language in tickets (e.g., "The button layout looks terrible" or "Dev broke the feature again"). Keep reports purely factual, objective, and reference specifications directly.

Confusing Severity and Priority: Mistakenly treating engineering severity and business priority as the same thing.

13. Real-World Use Cases
Severity vs. Priority Matrices
High Severity / High Priority: The checkout button on an e-commerce site throws an HTTP 500 server error, preventing all customer sales.

High Severity / Low Priority: A native mobile application crashes instantly, but only when executed on a rare, obsolete version of an OS used by less than 0.01% of the target market.

Low Severity / High Priority: The company logo displayed on the primary public login screen is completely misspelled. This doesn't break any system logic, but it compromises public brand credibility and must be fixed immediately.

14. Example with Explanation
Defect Title: [AUTH] [DESKTOP] App crashes on /login when password exceeds 500 characters

Explanation: The technical severity is high because it causes a buffer overflow or app crash. The priority depends on the sprint state, but the title clearly calls out the exact module (AUTH), platform (DESKTOP), and functional breaking boundary condition.

15. Code Example(s)
(Theoretical Chapter. Code-level tracking examples are implemented inside TestNG assertion scripts).

16. Output / Result
Plaintext
[JIRA WEBHOOK DISPATCH]
Status Change: OPEN -> FIXED
Developer Notes: "Resolved pointer overflow exception inside StringSanitizer.java by enforcing max character constraint at controller layer."
Assignee Reverted: QA_Lead
Action: Automated Retest Suite Initialized...
17. Diagram / Flowchart
Code snippet
sequenceDiagram
    autonumber
    QA Engineer->>Project Management Tool: Log Defect (Status: NEW)
    Project Management Tool->>Triage Board: Route to Queue
    Product Owner->>Developer: Assign Bug (Status: ASSIGNED)
    Developer->>Developer: Fix Code & Deploy
    Developer->>Project Management Tool: Update State (Status: FIXED)
    Project Management Tool->>QA Engineer: Prompt Verification
    QA Engineer->>Application: Execute Retest Scenario
    QA Engineer->>Project Management Tool: Resolve Ticket (Status: CLOSED)
18. Interview Questions
What is the exact distinction between Defect Severity and Defect Priority?

Answer: Severity refers to the technical impact of the defect on the software system’s operations (e.g., data corruption vs. text misalignment). Priority refers to the business urgency of fixing the defect based on release timelines, marketing commitments, and commercial impact.

What steps do you take if a developer marks a legitimate bug you logged as "Not Reproducible"?

Answer: I double-check that my local test environment matches the build version used by the developer. Then, I re-verify my steps against the target test data profile. If it still fails, I update the ticket with network logs, console traces, or a short video recording. Finally, I set up a quick sync with the developer to look at the issue together in their local setup.

19. References
IEEE 829 Standard for Software Test Documentation

Lessons Learned in Software Testing - Cem Kaner

20. Summary
Defect tracking serves as a clear, data-driven window into software quality. By maintaining objective standards for reporting errors and decoupling technical severity from business priority, QA teams keep engineering tracks aligned and prevent broken code from slipping into production.