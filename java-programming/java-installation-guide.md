# Java Installation & Environment Setup Guide (Windows)

*A Complete Beginner-to-Professional Setup Guide for QA Automation Engineers*

---

# Table of Contents

1. Introduction
2. Java Versions Explained
3. System Requirements
4. Downloading Java
5. Installing Java
6. Verifying Installation
7. Setting Environment Variables
8. Configuring PATH
9. Verifying JAVA_HOME & PATH
10. Installing Multiple Java Versions
11. Switching Between Java Versions
12. Installing Java in Eclipse
13. Installing Java in VS Code
14. Installing Java in IntelliJ IDEA
15. Installing Maven
16. Common Installation Errors
17. Troubleshooting Guide
18. Best Practices
19. Useful Commands
20. FAQ

---

# 1. Introduction

Java is one of the world's most popular programming languages and is widely used for:

* Selenium Automation
* TestNG
* REST Assured
* Appium
* Spring Boot
* Android Development
* Enterprise Applications

Most automation frameworks are built using Java.

---

# 2. Java Versions Explained

| Version | LTS | Recommended         |
| ------- | --- | ------------------- |
| Java 8  | ✅   | Legacy Projects     |
| Java 11 | ✅   | Enterprise Projects |
| Java 17 | ✅   | Most Recommended    |
| Java 21 | ✅   | Latest LTS          |

### Which version should you install?

For Selenium Automation:

* Java 17 ✅ (Recommended)
* Java 21 ✅ (Latest LTS)

Avoid installing Java 22+ unless your project specifically requires it.

---

# 3. System Requirements

| Requirement  | Minimum       |
| ------------ | ------------- |
| RAM          | 4 GB          |
| Disk Space   | 500 MB        |
| OS           | Windows 10/11 |
| Architecture | 64-bit        |

---

# 4. Download Java

Recommended distributions:

* Oracle JDK
* Eclipse Temurin (Adoptium)
* Amazon Corretto
* Microsoft OpenJDK

### Recommended

**Eclipse Temurin JDK 17**

Download:

[https://adoptium.net/](https://adoptium.net/)

Choose:

```
Operating System:
Windows

Architecture:
x64

Package:
JDK

Version:
17 LTS
```

Download the MSI Installer.

---

# 5. Install Java

Run the installer.

Example:

```
OpenJDK17U-jdk_x64_windows_hotspot.msi
```

Click

```
Next
```

Accept License

```
Next
```

Installation Path

```
C:\Program Files\Eclipse Adoptium\jdk-17
```

Click

```
Install
```

Wait until installation completes.

Click

```
Finish
```

---

# 6. Verify Installation

Open CMD

Run

```cmd
java -version
```

Expected

```text
openjdk version "17.0.x"
```

Now check

```cmd
javac -version
```

Expected

```text
javac 17.0.x
```

---

# 7. Configure JAVA_HOME

Search

```
Environment Variables
```

Open

```
Edit the system environment variables
```

Click

```
Environment Variables
```

Under

System Variables

Click

```
New
```

Variable Name

```
JAVA_HOME
```

Variable Value

```
C:\Program Files\Eclipse Adoptium\jdk-17
```

Click OK.

---

# 8. Configure PATH

Under

System Variables

Find

```
Path
```

Click

```
Edit
```

Click

```
New
```

Add

```
%JAVA_HOME%\bin
```

Click OK

Click OK

Click OK

Restart CMD.

---

# 9. Verify JAVA_HOME

Run

```cmd
echo %JAVA_HOME%
```

Output

```
C:\Program Files\Eclipse Adoptium\jdk-17
```

Now verify PATH

```cmd
where java
```

Example

```
C:\Program Files\Eclipse Adoptium\jdk-17\bin\java.exe
```

Verify compiler

```cmd
where javac
```

---

# 10. Verify Everything

Run

```cmd
java -version
```

```cmd
javac -version
```

```cmd
echo %JAVA_HOME%
```

```cmd
where java
```

```cmd
where javac
```

Everything should point to the same JDK installation.

---

# 11. Install Multiple Java Versions

Example

```
Java 8

C:\Java\jdk1.8.0_441
```

```
Java 17

C:\Java\jdk17
```

```
Java 21

C:\Java\jdk21
```

Only change

```
JAVA_HOME
```

between versions.

Never add multiple Java `bin` directories directly to the `Path`. Instead, keep `%JAVA_HOME%\bin` in `Path` and update `JAVA_HOME` when switching versions.

---

# 12. Configure Eclipse

Open Eclipse

Go to

```
Window
```

↓

```
Preferences
```

↓

```
Java
```

↓

```
Installed JREs
```

Click

```
Add
```

Choose

```
Standard VM
```

Browse

```
C:\Program Files\Eclipse Adoptium\jdk-17
```

Click

```
Finish
```

Tick the new JDK as the default.

---

# 13. Configure VS Code

Install

* Extension Pack for Java
* Language Support for Java by Red Hat
* Debugger for Java
* Test Runner for Java
* Maven for Java

Restart VS Code.

Open Terminal

Run

```cmd
java -version
```

---

# 14. Configure IntelliJ IDEA

Open IntelliJ

New Project

Select

```
JDK
```

Choose

```
C:\Program Files\Eclipse Adoptium\jdk-17
```

Finish.

---

# 15. Install Maven

Download Maven Binary ZIP from the official Apache Maven website.

Extract

```
C:\Maven
```

Create

```
MAVEN_HOME
```

```
C:\Maven
```

Add to PATH

```
%MAVEN_HOME%\bin
```

Verify

```cmd
mvn -version
```

---

# 16. Common Errors

## Error

```
java is not recognized
```

Reason

PATH not configured.

---

## Error

```
javac is not recognized
```

Reason

JDK not installed or `bin` folder missing from PATH.

---

## Error

```
Unsupported major.minor version
```

Reason

Wrong Java version.

---

## Error

```
JAVA_HOME is not defined correctly
```

Reason

Incorrect JAVA_HOME path.

---

## Error

```
No compiler is provided
```

Reason

JRE installed instead of JDK.

---

# 17. Troubleshooting Checklist

* Confirm a JDK (not just a JRE) is installed.
* Verify `JAVA_HOME` points to the JDK root folder, not the `bin` directory.
* Ensure `Path` contains `%JAVA_HOME%\bin`.
* Close and reopen the terminal after changing environment variables.
* Check for multiple Java installations using:

  ```cmd
  where java
  where javac
  ```
* Remove stale Java paths if an older version is being used unexpectedly.

---

# 18. Best Practices

* Use **Java 17 LTS** for most Selenium/TestNG projects.
* Keep only one active JDK through `JAVA_HOME`.
* Avoid spaces or special characters in custom installation paths where possible.
* Verify Java after every update.
* Keep Java and Maven versions compatible with your project's requirements.
* Use a version manager or document your team's Java version to ensure consistency.

---

# 19. Useful Commands

```cmd
java -version
```

Displays the installed Java runtime version.

```cmd
javac -version
```

Displays the Java compiler version.

```cmd
java --version
```

Alternative version command (Java 9+).

```cmd
echo %JAVA_HOME%
```

Displays the configured `JAVA_HOME`.

```cmd
where java
```

Shows the location(s) of `java.exe`.

```cmd
where javac
```

Shows the location(s) of `javac.exe`.

```cmd
set JAVA_HOME
```

Displays the current `JAVA_HOME` value in the session.

```cmd
mvn -version
```

Verifies Maven installation.

---

# 20. Frequently Asked Questions (FAQ)

### Q1. What is the difference between JDK and JRE?

* **JDK (Java Development Kit):** Includes tools to develop, compile, and run Java applications.
* **JRE (Java Runtime Environment):** Only runs Java applications. It does not include the compiler (`javac`).

For development and Selenium automation, always install the **JDK**.

---

### Q2. Can I install multiple Java versions?

Yes. You can install Java 8, 11, 17, and 21 side by side. Switch between them by updating `JAVA_HOME`.

---

### Q3. How do I know which Java version my project uses?

Check:

* `pom.xml` (`maven.compiler.source` / `maven.compiler.target` or `maven.compiler.release`)
* `build.gradle`
* Project documentation or team standards.

---

### Q4. Why does `java -version` show a different version than expected?

Run:

```cmd
where java
```

If multiple paths are listed, an older Java installation may appear earlier in your `Path`. Update your environment variables or remove unused entries.

---

### Q5. Do I need to restart my computer after setting environment variables?

Usually no. Closing and reopening your terminal or IDE is sufficient. If changes are not recognized, signing out or restarting Windows can help.

---

# Repository Structure Suggestion

```
java-installation-guide/
│
├── README.md
├── images/
│   ├── 01-download-jdk.png
│   ├── 02-install-jdk.png
│   ├── 03-environment-variables.png
│   ├── 04-java-home.png
│   ├── 05-path-variable.png
│   ├── 06-cmd-verification.png
│   ├── 07-eclipse-jre.png
│   ├── 08-vscode-java-extension.png
│   └── 09-intellij-jdk.png
├── troubleshooting/
│   └── common-errors.md
└── commands/
    └── java-commands.md
