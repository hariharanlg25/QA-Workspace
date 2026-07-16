# Agile Methodologies & Scrum Framework

## 1. Definition
**Agile** is a conceptual software development philosophy based on iterative development, team collaboration, and adaptive planning, guided by the Agile Manifesto. 

**Scrum** is a specific, lightweight process framework within Agile used to manage complex engineering tasks through structured ceremonies, defined roles, and incremental deliverables called Sprints.

## 2. Why is it needed?
* **Market Adaptability:** Allows companies to pivot feature priorities rapidly based on shifting competitor movements and user reviews.
* **Fast Time-To-Market:** Ships functional, high-value code increments to real production environments every 2 weeks instead of every 2 years.

## 3. Key Characteristics
* **Cross-Functional Autonomy:** Teams contain developers, QA engineers, and designers working together, removing external dependencies.
* **Incremental Evolution:** Focuses on shipping a Minimal Viable Product (MVP) and refining it continuously based on real user data.

## 4. Architecture / Internal Working
The Scrum execution engine runs on recursive sprint cycles driven by constant communication checkpoints:



```mermaid
graph TD
    A[Product Backlog: Master Requirements] --> B[Sprint Planning: Commitments]
    B --> C[Sprint Backlog: Active Tasks]
    C --> D[2-Week Sprint Cycle]
    D -->|Daily Standup Calibration| D
    D --> E[Increment: Shippable Code Feature]
    E --> F[Sprint Review: Demo to Client]
    F --> G[Sprint Retrospective: Team Process Optimization]
    G --> B
5. Types
Scrum: Fixed timeboxes, clear individual roles, focused on strict sprint delivery commitments.

Kanban: Continuous flow model, no fixed dates or defined roles, managed via Work-In-Progress (WIP) limit constraints on boards.

6. Syntax / Configuration
(Theoretical Guide. Agile project epics, points, and boards are configured within project planning applications like Jira).

7. Parameters
Story Points: Relative units of effort estimation calculated via Fibonacci sizing arrays (1, 2, 3, 5, 8, 13).

Sprint Velocity: Total story points a squad successfully completes during a single sprint timeline.

8. Rules / Constraints
Role Separation: The Scrum Master protects the process, the Product Owner manages requirement value, and the Development Team owns the technical execution. No individual should hold multiple core roles simultaneously.

9. Advantages
Maximizes collaboration, breaking down silos between QA and development tracks.

Greatly reduces project risk, as flaws are caught within a two-week window rather than deep into the project timeline.

10. Disadvantages
Can lead to Scope Creep if the Product Owner fails to set firm boundaries around backlog updates.

Requires a strong cultural shift; legacy organizations often struggle with self-organizing engineering dynamics.

11. Best Practices
Definition of Done (DoD): Enforce strict quality gates before marking a task complete (e.g., Code reviewed, unit tests passing, automated tests executed, no open blockers).

QA-Dev Pairing: QA engineers should review developer logic during active coding cycles to spot interface bugs before local builds are pushed.

12. Common Mistakes
Treating the Daily Standup as a rigid status report for management rather than a collaborative huddle for the team to sync and flag engineering blockers.

13. Real-World Use Cases
Streaming Media Platform Feature: Developing a new user profile layout, breaking the requirements into bite-sized user stories, and delivering a functional, production-ready release within a single 2-week sprint cycle.

14. Example with Explanation
User Story Definition Format: "As a [User Role], I want to [Perform Action] So that [Achieve Business Value]."

Example: "As a retail customer, I want to filter products by price range so that I can quickly discover items within my budget limits."

15. Code Example(s)
(Theoretical Structure. Framework automation setups align test executions with the active sprint pipeline configuration).

16. Output / Result
Plaintext
[JIRA SPRINT BURN-DOWN DATA]
Sprint Name: Sprint 55
Committed Points: 40 | Completed Points: 38
Open Defect Roll-over Count: 1 (Low Severity)
Sprint Quality Target Status: HEALTHY
17. Diagram / Flowchart
Code snippet
stateDiagram-v2
    [*] --> ProductBacklog
    ProductBacklog --> SprintBacklog : Sprint Planning
    SprintBacklog --> InProgress : Sprint Starts
    InProgress --> InQA : Dev Check-in
    InQA --> Done : Validated against DoD
    InQA --> InProgress : Bug Found / Reopened
    Done --> [*] : Production Release
18. Interview Questions
What is the explicit purpose of the Sprint Retrospective?

Answer: The Sprint Retrospective is a private meeting held at the end of every sprint for the Scrum team to look back at their processes. The goal is to identify what went well, what went wrong, and commit to 1-2 actionable process improvements for the upcoming sprint.

What does the QA engineer do when there is no build available to test during the first week of a Sprint?

Answer: A professional QA engineer uses this time to shift left. They review the requirements for upcoming user stories, write comprehensive test cases, build automated test scripts based on wireframes, map out data sets, and collaborate with developers on unit test strategies.

19. References
The Scrum Guide - Ken Schwaber and Jeff Sutherland

User Stories Applied - Mike Cohn

20. Summary
Agile and Scrum frameworks break down massive development risks into predictable, collaborative milestones. Embracing clear quality benchmarks like the Definition of Done allows teams to deliver robust software increments safely and adaptively.