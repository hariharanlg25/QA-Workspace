# Windows PowerShell Script to generate your complete QA portfolio structure

$TEMPLATE_CONTENT = @"
# Concept Name

## 1. Definition
## 2. Why is it needed?
## 3. Key Characteristics
## 4. Architecture / Internal Working
## 5. Types
## 6. Syntax / Configuration
## 7. Parameters
## 8. Rules / Constraints
## 9. Advantages
## 10. Disadvantages
## 11. Best Practices
## 12. Common Mistakes
## 13. Real-World Use Cases
## 14. Example with Explanation
## 15. Code Example(s)
## 16. Output / Result
## 17. Diagram / Flowchart
## 18. Interview Questions
## 19. References
## 20. Summary
"@

Write-Host "======= Starting QA GitHub Portfolio Skeleton Generation (Windows) =======" -ForegroundColor Cyan

# 1. QA Study Material
New-Item -ItemType Directory -Force -Path "qa-study-material"
$study_folders = @(
  "01-Manual-Testing", "02-Automation-Testing", "03-Java", "04-Selenium", 
  "05-TestNG", "06-JUnit", "07-SQL", "08-API-Testing", "09-Postman", 
  "10-Git", "11-GitHub", "12-CI-CD", "13-Jenkins", "14-Docker", 
  "15-Allure", "16-Design-Patterns", "17-Agile", "18-Scrum", 
  "19-STLC", "20-SDLC", "21-Bug-Life-Cycle", "22-Interview-Questions"
)
foreach ($f in $study_folders) {
    New-Item -ItemType Directory -Force -Path "qa-study-material\$f\code" | Out-Null
    New-Item -ItemType Directory -Force -Path "qa-study-material\$f\images" | Out-Null
    New-Item -ItemType Directory -Force -Path "qa-study-material\$f\diagrams" | Out-Null
    Set-Content -Path "qa-study-material\$f\README.md" -Value $TEMPLATE_CONTENT
}
Write-Host "[✓] Generated: qa-study-material" -ForegroundColor Green

# 2. Java Programming
New-Item -ItemType Directory -Force -Path "java-programming"
$java_folders = @("01-Java-Basics", "02-OOP", "03-Collections", "04-Strings", "05-Arrays", "06-Exception-Handling", "07-Multithreading", "08-File-Handling", "09-Streams", "10-Lambda", "11-Functional-Interfaces", "12-Practice-Problems", "13-Interview-Programs")
foreach ($f in $java_folders) { 
    New-Item -ItemType Directory -Force -Path "java-programming\$f" | Out-Null
    Set-Content -Path "java-programming\$f\README.md" -Value "# $f"
}
Write-Host "[✓] Generated: java-programming" -ForegroundColor Green

# 3. SQL Interview Prep
New-Item -ItemType Directory -Force -Path "sql-interview-preparation"
$sql_folders = @("01-DDL", "02-DML", "03-DCL", "04-TCL", "05-Basic-Queries", "06-Joins", "07-Aggregate-Functions", "08-Group-By", "09-Having", "10-Subqueries", "11-CTE", "12-Window-Functions", "13-Views", "14-Indexes", "15-Stored-Procedures", "16-Triggers", "17-Practice-Questions", "18-Solutions")
foreach ($f in $sql_folders) { 
    New-Item -ItemType Directory -Force -Path "sql-interview-preparation\$f" | Out-Null
    Set-Content -Path "sql-interview-preparation\$f\README.md" -Value "# $f"
}
Write-Host "[✓] Generated: sql-interview-preparation" -ForegroundColor Green

# 4. Postman Collections
$postman_folders = @("Collections", "Environments", "Mock-APIs", "JSON-Samples", "API-Documentation")
foreach ($f in $postman_folders) { New-Item -ItemType Directory -Force -Path "postman-collections\$f" | Out-Null }
Set-Content -Path "postman-collections\README.md" -Value "# Postman Collections"
Write-Host "[✓] Generated: postman-collections" -ForegroundColor Green

# 5. Test Case Library
$tc_folders = @("Login", "Registration", "Forgot-Password", "User-Profile", "Search", "Shopping-Cart", "Checkout", "Payment", "Admin")
foreach ($f in $tc_folders) { New-Item -ItemType Directory -Force -Path "test-case-library\$f" | Out-Null }
Set-Content -Path "test-case-library\README.md" -Value "# Test Case Library"
Write-Host "[✓] Generated: test-case-library" -ForegroundColor Green

# 6. QA Templates
$tpl_folders = @("Test Plan", "Test Strategy", "Test Case", "RTM", "Bug Report", "Test Summary")
foreach ($f in $tpl_folders) { New-Item -ItemType Directory -Force -Path "qa-templates\$f" | Out-Null }
Set-Content -Path "qa-templates\README.md" -Value "# QA Industrial Templates"
Write-Host "[✓] Generated: qa-templates" -ForegroundColor Green

# 7. Jenkins CI/CD
$jenkins_folders = @("Pipelines", "Build-Scripts", "Reports")
foreach ($f in $jenkins_folders) { New-Item -ItemType Directory -Force -Path "jenkins-selenium-ci\$f" | Out-Null }
Set-Content -Path "jenkins-selenium-ci\README.md" -Value "# Jenkins CI/CD Configurations"
Write-Host "[✓] Generated: jenkins-selenium-ci" -ForegroundColor Green

# 8. Selenium Grid Docker
$docker_folders = @("Grid-Setup", "Compose-Files")
foreach ($f in $docker_folders) { New-Item -ItemType Directory -Force -Path "selenium-grid-docker\$f" | Out-Null }
Set-Content -Path "selenium-grid-docker\README.md" -Value "# Selenium Grid Container Infrastructure"
Write-Host "[✓] Generated: selenium-grid-docker" -ForegroundColor Green

# 9. Automation Design Patterns
$pattern_folders = @("Page Object Model", "Page Factory", "Singleton", "Builder", "Strategy")
foreach ($f in $pattern_folders) { New-Item -ItemType Directory -Force -Path "automation-design-patterns\$f" | Out-Null }
Set-Content -Path "automation-design-patterns\README.md" -Value "# Automation Architectural Design Patterns"
Write-Host "[✓] Generated: automation-design-patterns" -ForegroundColor Green

# 10. Dedicated Notes Reference
$notes_folders = @("java", "selenium", "testng", "git-github")
foreach ($f in $notes_folders) { New-Item -ItemType Directory -Force -Path "quick-notes-reference\$f" | Out-Null }
Set-Content -Path "quick-notes-reference\README.md" -Value "# Quick Reference Cheat Sheets"
Write-Host "[✓] Generated: quick-notes-reference" -ForegroundColor Green

Write-Host "======= Setup Complete! All 10 repository structures are ready. =======" -ForegroundColor Cyan