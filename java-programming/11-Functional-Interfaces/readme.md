Functional Interfaces in Test Automation

1. Definition

Functional Interfaces are Java interfaces containing exactly one abstract method (annotated with @FunctionalInterface). They provide the target types for lambda expressions. The standard JDK includes a suite of built-in functional interfaces inside the java.util.function package:

Predicate<T>: Takes an argument of type T and returns a boolean value.

Function<T, R>: Takes an argument of type T and returns a transformed output of type R.

Consumer<T>: Takes an argument of type T and performs an action, returning nothing.

Supplier<T>: Takes no inputs and returns a generated object of type T.

2. Advantages

Standardized Codebases: Eliminates the need to write custom single-method interfaces for basic actions like filtering, mapping, or data generation.

Decoupled Architecture: Separates core testing logic from dynamic validations, resulting in cleaner, more modular code.

3. Disadvantages

Complex Generic Signatures: Nested generic parameters inside functional method signatures (e.g., Function<String, Map<String, List<Integer>>>) can be difficult to read and maintain.

4. When to Use in Automation Testing

Predicate: Evaluating whether page states, HTTP status codes, or database rows match target validation rules.

Function: Mapping raw selectors based on environment variables (e.g., generating localized locator paths dynamically).

Consumer: Building custom reporting listeners that capture and process metadata from failed tests.

Supplier: Lazy-loading driver contexts, randomizing credentials, or dynamically generating fake email addresses for registrations.

5. Automation Example

package interfaces;

import java.util.function.Consumer;
import java.util.function.Function;
import java.util.function.Predicate;
import java.util.function.Supplier;

public class FunctionalInterfaceDemo {
    public static void main(String[] args) {
        // 1. Predicate: Check if an API response status code represents success
        Predicate<Integer> isSuccessStatus = (statusCode) -> statusCode >= 200 && statusCode <= 299;

        // 2. Function: Take a raw element ID and generate a localized xpath selector
        Function<Integer, String> xpathGenerator = (elementId) -> String.format("//input[@id='input-field-%d']", elementId);

        // 3. Consumer: Custom logging block that formats error messages
        Consumer<String> testFailureLogger = (errorMessage) -> System.err.println("[FAIL-LOGGER] Assertion Alert: " + errorMessage);

        // 4. Supplier: Dynamically generate mock email addresses on-demand
        Supplier<String> emailGenerator = () -> "test_persona_" + System.currentTimeMillis() + "@staging-sandbox.com";

        // Execute and demonstrate functional interfaces
        System.out.println("[INTERFACE] Is 201 Created Success? " + isSuccessStatus.test(201));
        System.out.println("[INTERFACE] Resolved Locator: " + xpathGenerator.apply(408));
        System.out.println("[INTERFACE] Generated Unique Test Email: " + emailGenerator.get());

        testFailureLogger.accept("HTTP 504 Gateway Timeout on /payments/authorize callback.");
    }
}
