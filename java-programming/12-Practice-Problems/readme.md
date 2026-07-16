Java Core Practice Problems (SDET/QA Automation Edition)

This directory serves as your hands-on coding sandbox. It maps out 15 structured coding challenges designed to build and test your core Java fluency. Each challenge targets specific core programming concepts and maps directly to real-world test automation scenarios (such as parsing data matrices, managing isolated threads, or filtering elements using functional pipelines).

🗺️ Practice Path Matrix

01 | ExponentialBackoff (Difficulty: Easy)

Target Java Concepts: Java Basics, Loops, Operators

Automation/SDET Application Context: Explicit Wait Polling Mechanics

02 | WebPageScraper (Difficulty: Easy)

Target Java Concepts: Arrays, Strings, Loop Control

Automation/SDET Application Context: Extracting and sanitizing dynamic UI labels

03 | EncapsulatedBank (Difficulty: Medium)

Target Java Concepts: OOP (Encapsulation, Abstraction)

Automation/SDET Application Context: Modeling secure, valid state objects

04 | PolymorphicDriver (Difficulty: Medium)

Target Java Concepts: OOP (Polymorphism, Inheritance)

Automation/SDET Application Context: Structuring cross-browser Driver Factories

05 | ElementSorter (Difficulty: Medium)

Target Java Concepts: Collections (List, Set), Strings

Automation/SDET Application Context: Verifying unique items and alphabetical sorting

06 | ConfigParser (Difficulty: Medium)

Target Java Concepts: File Handling, Maps, Exceptions

Automation/SDET Application Context: Safely reading external test environments

07 | UniqueWindowTracker (Difficulty: Easy)

Target Java Concepts: Collections (Set), Strings

Automation/SDET Application Context: Tracking and switching browser tabs

08 | FailureLogger (Difficulty: Medium)

Target Java Concepts: Exception Handling, File Writing

Automation/SDET Application Context: Capturing failure traces to external logs

09 | TestDataMatrix (Difficulty: Easy)

Target Java Concepts: Multi-dimensional Arrays

Automation/SDET Application Context: Data-driven test matrices (TestNG DataProviders)

10 | DynamicWaiter (Difficulty: Hard)

Target Java Concepts: Lambdas, Functional Interfaces

Automation/SDET Application Context: Writing custom explicit wait conditions

11 | UiFilterPipeline (Difficulty: Hard)

Target Java Concepts: Streams, Lambdas, Predicates

Automation/SDET Application Context: Clean, functional sorting of web element lists

12 | ThreadIsolatedState (Difficulty: Hard)

Target Java Concepts: Multithreading, ThreadLocal

Automation/SDET Application Context: Ensuring thread-safe parallel execution

13 | ApiPayloadValidator (Difficulty: Medium)

Target Java Concepts: Strings, Regex, Exception Handling

Automation/SDET Application Context: Validating contract formats in REST responses

14 | RegistryFactory (Difficulty: Hard)

Target Java Concepts: OOP (Factory & Singleton Patterns)

Automation/SDET Application Context: Managing driver creation & runtime execution

15 | DataDeDuplicator (Difficulty: Medium)

Target Java Concepts: Streams, Sets, Collections

Automation/SDET Application Context: Merging and cleaning massive system datasets

🛠️ Detailed Practice Specifications & Starter Skeletons

Challenge 01: Dynamic Wait with Exponential Backoff

Concepts: Java Basics, loops, primitive variables, relational operators.

Automation Context: Simulates checking for an element that takes time to render on a slow network.

Specification: Write an algorithm that checks for an element up to $N$ times. Each time it fails, double the sleep duration ($T_{new} = T_{old} \times 2$) to optimize polling cycles.

Expected Output:

[POLLING] Checking DOM... Attempt 1. Not found. Waiting 500ms...
[POLLING] Checking DOM... Attempt 2. Not found. Waiting 1000ms...
[POLLING] Checking DOM... Attempt 3. Element located!


package basics;

public class ExponentialBackoff {
    public static boolean pollElement(int maxRetries, int baseWaitMs) {
        // TODO: Implement the exponential backoff polling logic.
        // Loop up to maxRetries. Double baseWaitMs on each retry attempt.
        return false;
    }

    public static void main(String[] args) {
        boolean result = pollElement(4, 500);
        System.out.println("Wait result: " + result);
    }
}


Challenge 02: E-Commerce Product Label Sanitizer

Concepts: Strings, Immutability, char arrays, Type Parsing.

Automation Context: Cleaning raw, messy text captured from a web UI before running mathematical checks.

Specification: Parse a raw string (e.g., "  Item Price: $1,250.99 USD  "), remove all whitespace, currency symbols, commas, and trailing characters, and return it as a pure double value of 1250.99.

package strings;

public class LabelSanitizer {
    public static double sanitizeAndParse(String rawLabel) {
        // TODO: Clean flanking whitespace, strip non-numeric symbols, and cast to double.
        return 0.0;
    }

    public static void main(String[] args) {
        String testLabel = "  Sale Price: $2,499.50 USD  ";
        double price = sanitizeAndParse(testLabel);
        System.out.println("Parsed Double: " + price); // Expected: 2499.5
    }
}


Challenge 03: Secure User Session State

Concepts: OOP (Encapsulation, Constructor Validation).

Automation Context: Protecting test user state data from unauthorized modification inside a testing framework.

Specification: Create a UserSession class. Make variables like username, accessToken, and userRole strictly private. Add public getters but no setters (immutability). Throw an IllegalArgumentException in the constructor if the accessToken is null or does not start with "Bearer ".

package oops;

public class UserSession {
    // TODO: Declare private final fields
    
    public UserSession(String username, String accessToken, String userRole) {
        // TODO: Add input validations and bind state.
    }
    
    // TODO: Write getters only to secure encapsulation.
}


Challenge 04: Polymorphic Test Runner

Concepts: OOP (Polymorphism, Inheritance, Interfaces).

Automation Context: Abstracting browser setups so tests can run on any browser using the same steps.

Specification: Define a TestEngine interface with a runTest() method. Create two concrete subclasses, ApiTestEngine and WebTestEngine, that implement runTest() with their own logic. Write a runner method that accepts a list of TestEngine objects and executes them polymorphically.

package oops;

import java.util.List;

interface TestEngine {
    void runTest();
}

// TODO: Create ApiTestEngine and WebTestEngine implementing TestEngine

public class PolymorphicRunner {
    public static void executeSuite(List<TestEngine> suite) {
        // TODO: Loop and run each polymorphic engine.
    }
}


Challenge 05: UI Catalog Sort Validator

Concepts: Collections (List), Strings, Comparator utilities.

Automation Context: Verifying that a website's "Sort Alphabetically" filter actually works.

Specification: Capture an unsorted list of product names. Sort them using a standard Java Collections utility. Then, verify if a second list (scraped after applying the UI filter) matches the sorted baseline.

package collections;

import java.util.List;

public class SortValidator {
    public static boolean isSortedAlphabetically(List<String> actualUiList) {
        // TODO: Create a copy of the list, sort it, and compare it with the original.
        return false;
    }
}


Challenge 06: Environment Configurations Loader

Concepts: File Handling, Properties/Maps, Exception Handling.

Automation Context: Decoupling test settings (URL, timeout) from the codebase.

Specification: Write an environment loader utility that reads an external key-value properties file. Store these settings in a Map<String, String>. Safely catch and handle file-not-found exceptions using Try-With-Resources, falling back to a default configuration map if the file is missing.

package files;

import java.io.IOException;
import java.util.Map;

public class ConfigLoader {
    public static Map<String, String> loadProperties(String filePath) {
        // TODO: Use try-with-resources to load properties. Fall back to defaults on IOException.
        return null;
    }
}


Challenge 07: Browser Tab Switch Tracker

Concepts: Collections (Set, LinkedHashSet), iteration.

Automation Context: Tracking and switching across multiple open browser tabs.

Specification: Create a window-handle tracking utility. It should receive a collection of window handles (containing duplicates) and return a list containing only unique, ordered handles to prevent double-processing.

package collections;

import java.util.Set;

public class WindowTracker {
    public static Set<String> filterUniqueHandles(String[] rawHandles) {
        // TODO: Ingest raw string array and extract uniquely preserved window IDs.
        return null;
    }
}


Challenge 08: Test Run Failure Logger

Concepts: Exception Handling, File Writing, Stack Traces.

Automation Context: Archiving full stack trace logs to local files when a test fails.

Specification: Intercept a runtime automation failure (e.g., AssertionError or TimeoutException) using a try-catch block. Format the exception message alongside a timestamp and write it to a physical .log file on disk.

package exceptions;

public class FailureLogger {
    public static void logExceptionToDisk(Throwable throwable, String logPath) {
        // TODO: Write exception details and stack traces dynamically to a file.
    }
}


Challenge 09: TestNG DataProvider Generator

Concepts: Multidimensional Arrays (Object[][]), index looping.

Automation Context: Preparing parameters for data-driven login tests.

Specification: Initialize a 2D Object[][] matrix containing three test rows with three columns each: [Username, Password, ExpectedResult]. Write a nested loop that parses this data and prints each row to the console.

package arrays;

public class DataProviderMatrix {
    public static Object[][] getLoginData() {
        // TODO: Instantiate and return a 3x3 Object matrix.
        return null;
    }

    public static void main(String[] args) {
        Object[][] matrix = getLoginData();
        // TODO: Write a nested loop to print all data rows.
    }
}


Challenge 10: Dynamic Explicit Wait Evaluator

Concepts: Lambdas, Custom Functional Interfaces.

Automation Context: Building a dynamic wait utility that accepts custom conditions as arguments.

Specification: Create a @FunctionalInterface named ExpectedCondition with a single method: boolean evaluate(). Write a utility method waitUntil(ExpectedCondition condition, int timeoutSeconds) that periodically runs the condition's logic until it returns true or times out.

package lambdas;

@FunctionalInterface
interface ExpectedCondition {
    boolean evaluate();
}

public class ExplicitWaiter {
    public static boolean waitUntil(ExpectedCondition condition, int timeoutSec) {
        // TODO: Periodically run condition.evaluate() in a loop up to timeoutSec.
        return false;
    }

    public static void main(String[] args) {
        // TODO: Call waitUntil using an inline Lambda expression (e.g., checking if a spinner disappears)
    }
}


Challenge 11: Web Element Stream Filtration Pipeline

Concepts: Streams API, Lambdas, Predicates, Collectors.

Automation Context: Filtering list results on a webpage using clean, functional pipelines.

Specification: Create a method that processes a list of raw product strings (e.g., "Shoe - $120", "Laptop - $1200"). The pipeline must:

Filter out empty or null rows.

Map strings into a clean domain object Product with fields for name and price.

Filter out products priced below $100.

Collect and return the remaining items as a list.

package streams;

import java.util.List;

class Product {
    String name;
    double price;
    public Product(String name, double price) { this.name = name; this.price = price; }
}

public class StreamFilterPipeline {
    public static List<Product> processUiElements(List<String> rawElements) {
        // TODO: Use Java Streams to filter, transform, and collect target products.
        return null;
    }
}


Challenge 12: Thread-Isolated WebDriver Manager

Concepts: Multithreading, ThreadLocal, Synchronization.

Automation Context: Ensuring that parallel tests run in isolated browser instances without thread collisions.

Specification: Implement a thread-safe static driver registry. Use a ThreadLocal<String> variable to hold a mock driver session ID. Add methods to set the session ID for the current thread, get it, and clean up the reference when the test finishes.

package multithreading;

public class ThreadLocalDriverRegistry {
    // TODO: Declare a private static final ThreadLocal container.

    public static void setDriver(String driverSession) {
        // TODO: Set thread-local reference.
    }

    public static String getDriver() {
        // TODO: Get thread-local reference.
        return null;
    }

    public static void clear() {
        // TODO: Remove thread-local reference to prevent memory leaks.
    }
}


Challenge 13: API Response Contract Matcher

Concepts: Strings, Regex Patterns, Validation Exceptions.

Automation Context: Validating API response fields (e.g., verifying a UUID format).

Specification: Write a regex matcher utility that checks if an API's returned payload key (like "id") strictly matches the standard UUID format. Throw a ServiceContractMismatchException if the regex check fails.

package strings;

public class ContractMatcher {
    private static final String UUID_REGEX = "^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[4][0-9a-fA-F]{3}-[89abAB][0-9a-fA-F]{3}-[0-9a-fA-F]{12}$";

    public static void validateUuid(String uuidValue) {
        // TODO: Match uuidValue against UUID_REGEX. Throw a custom RuntimeException on mismatch.
    }
}


Challenge 14: Polymorphic Driver Singleton Factory

Concepts: OOP (Factory Pattern, Singleton Pattern), ThreadLocal.

Automation Context: Creating a centralized, thread-safe, and polymorphic browser driver manager.

Specification: Combine Singleton and Factory patterns. Create a WebDriverFactory class that returns the correct browser instance (CHROME, FIREFOX) based on an environment property, while using ThreadLocal to keep instances isolated across parallel execution threads.

package designpatterns;

enum BrowserType { CHROME, FIREFOX }

public class WebDriverFactory {
    // TODO: Create a ThreadLocal-isolated singleton driver manager.
    // Return a thread-safe mock driver string based on the BrowserType.
}


Challenge 15: Bulk Ingestion Data De-duplicator

Concepts: Java Streams, Collections (Set), Object Equality (hashCode/equals).

Automation Context: Cleaning database records to ensure no duplicate test entries exist before running assertions.

Specification: Create a custom class named Record with fields for id and payload. Implement equals() and hashCode() methods based on the id field. Write a stream utility that takes a list of Record objects (containing duplicates) and returns a unique set.

package streams;

import java.util.List;
import java.util.Set;

class Record {
    int id;
    String payload;

    public Record(int id, String payload) {
        this.id = id;
        this.payload = payload;
    }

    // TODO: Override equals() and hashCode() using the 'id' field.
}

public class DataDeDuplicator {
    public static Set<Record> deDuplicate(List<Record> rawRecords) {
        // TODO: Filter duplicates out using Streams and collect to a Set.
        return null;
    }
}


🎯 Verification and Review

To verify your practice code, compile and run each completed class inside your local IDE (such as IntelliJ IDEA or Eclipse). Ensure that:

Compilation Completes: Your code compiles with zero errors under JDK 11 or JDK 17.

Assertions pass: Incorporate print statements or basic JUnit assertions to verify that actual outcomes match expected values.

No Memory Leaks: Always call .remove() on your ThreadLocal variables during teardown phases.