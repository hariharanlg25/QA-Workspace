Let's target 09-Postman inside your qa-study-material repository next.

Open File: qa-study-material/09-Postman/README.md
Replace its template placeholder with this comprehensive master guide detailing Postman for API lifecycle validation and test automation:

Markdown
# Postman API Client and Collection Automation Engineering

## 1. Definition
Postman is an enterprise-grade API collaboration platform and client runtime environment used to build, mock, test, document, and automate the verification of HTTP/HTTPS web services and microservices.

## 2. Why is it needed?
* **Rapid Interface Exploration:** Provides a visual sandbox to quickly craft requests, configure auth tokens, and audit responses without writing heavy boilerplate automation framework code.
* **Built-in Sandbox Scripting:** Features an internal JavaScript execution engine to run data-driven validation logic, check response properties, and chain variables between dynamic endpoints.

## 3. Key Characteristics
* **Variable Scope Hierarchies:** Evaluates dynamic properties sequentially through distinct layers: Global, Collection, Environment, and Local Data variables.
* **Headless Suite Orchestration:** Integrates seamlessly with continuous integration channels using **Newman**, Postman's native CLI runtime engine.

## 4. Architecture / Internal Working
The Postman client leverages a sandbox environment that intercepts requests and runs custom scripting hooks before and after payloads hit the remote service:



```mermaid
graph TD
    subgraph Client Sandbox [Postman Runtime Engine]
        A[Trigger Request Engine] --> B[Pre-request Script: Set dynamic parameters]
        B --> C[Construct Network Payload]
    end
    subgraph Network [Target Infrastructure]
        C -->|HTTP REST Call| D[Target API Endpoint Server]
        D -->|Return Data Stream| E[Capture Response Payloads]
    end
    subgraph Assertions [Validation Layer]
        E --> F[Test Scripts Execution: JavaScript Sandbox]
        F --> G[Test Results Dashboard / Chai Assertion Metrics]
    end
5. Types
Core parameter execution scripts handled by the Postman runtime sandbox:

Pre-request Scripts: JavaScript blocks executed before the request is sent (e.g., calculating a cryptographic signature or generating a current timestamp).

Test Scripts: JavaScript execution blocks executed after the server response is received, used to perform structural validations using built-in Chai libraries.

6. Syntax / Configuration
Standard programmatic assertion layout inside the Postman JavaScript sandbox:

JavaScript
pm.test("Verify HTTP Success Status", function () {
    pm.response.to.have.status(200);
});
7. Parameters
Key global utility objects used to inspect message states inside the sandbox:

pm.response.json() — Parses a raw JSON response stream into a navigable JavaScript object hierarchy.

pm.environment.set("key", "value") — Dynamically writes token properties to an active Environment data bucket.

8. Rules / Constraints
The Asynchronous Newman Constraint: When running collection automated tests via Newman inside a terminal, you must provide any referenced environment configurations as a separate, updated JSON file export. Postman does not sync cloud variables to localized command-line runs automatically.

9. Advantages
Extremely low technical barrier to entry for performing complex functional API testing.

Exceptional tools for creating professional, automated, interactive API markdown documentation sets directly from collection histories.

10. Disadvantages
Large-scale collaborative testing scripts can become harder to maintain when stored inside dense GUI text panes instead of traditional Git-tracked IDE class files.

Free tiers impose strict run limits for automated mock server calls and monitoring schedulers.

11. Best Practices
Never Commit Plaintext Secrets: Keep API tokens, client secrets, and database passwords completely out of "Initial Value" collection parameters. Use "Current Value" fields to limit sensitive data to local runtime memory profiles.

Use pm.collectionVariables to store static configurations like tenant route names, reserving pm.environment for switching backend target base URLs.

12. Common Mistakes
Hardcoding the domain URL across individual folder endpoints instead of utilizing an environment variable marker ({{baseUrl}}), which prevents running the collection against local or staging pipelines.

13. Real-World Use Cases
Chained Authorization End-to-End Validation: Running a multi-step collection flow where request 1 posts login credentials, a test script extracts a short-lived bearer token, writes it to an environment variable, and request 2 automatically reads that variable to test protected user endpoints.

14. Example with Explanation
Dynamic Property Chain Script:

JavaScript
// Inside the 'Tests' panel of an authentication step:
var JSONData = pm.response.json();
pm.test("Ensure Token Is Issued", function () {
    pm.expect(JSONData.token).to.not.be.null;
});
// Captures and saves the token variable for subsequent downstream requests
pm.environment.set("authToken", JSONData.token);
15. Code Example(s)
(Theoretical Domain Architecture. Raw exported JSON collections and environment profiles are housed inside your dedicated postman-collections repository).

16. Output / Result
Plaintext
┌──────────────────────────────────────────────────────────┐
│ Newman Collection Run Summary                            │
│                                                          │
│ ✔  Status code is 200                                    │
│ ✔  Response time is less than 200ms                      │
│ ✔  JSON schema complies with configuration requirements   │
│                                                          │
│ Executed: 3 Requests | 3 Assertions Passed | 0 Failed     │
└──────────────────────────────────────────────────────────┘
17. Diagram / Flowchart
Code snippet
graph LR
    subgraph Variable Resolution Priority
    A[Global] --> B[Collection]
    B --> C[Environment]
    C --> D[Local / Data Matrix]
    end
    style D fill:#f9f,stroke:#333,stroke-width:2px
18. Interview Questions
What is the difference between "Initial Value" and "Current Value" in Postman variables?

Answer: Initial Value is synced to the Postman cloud servers and is visible to all team collaborators shared on the workspace. Current Value is kept strictly in local session storage and is never synced to the cloud, making it the ideal field for holding secure access keys, passwords, and personal developer tokens.

How do you integrate a Postman collection into a Jenkins CI/CD pipeline?

Answer: I export the Postman Collection and its corresponding Environment as standard .json configuration files. I then configure the Jenkins workspace agent to execute the tests headlessly using the Newman CLI framework via a simple shell command: newman run my_collection.json -e my_env.json -r cli,html.

19. References
Postman Learning Center Developer Documentation Manual Specs

API Testing with Postman - Dave Westerveld

20. Summary
Postman provides a powerful toolset for both rapid API exploration and automated collection testing. By combining an intuitive request engine with a JavaScript validation sandbox and the Newman CLI runner, it enables teams to deploy and protect backend microservices with confidence