package javabasics;

/**
 * VariableSandbox demonstrates primitive variable scopes, casting mechanisms,
 * and safe primitive narrowing conversions.
 * Real-world QA Application: Converting raw text inputs from Web elements into numeric types.
 */
public class VariableSandbox {

    // Member variable (Instance Scope)
    private final String scopeIdentifier = "INSTANCE_SCOPE";

    public void runDemo() {
        System.out.println("=== [01-JAVA-BASICS] Scope and Variable Demonstration ===");
        
        // Local variable (Method Scope)
        int defaultTimeout = 10;
        System.out.println("Local Method Scope Variable (defaultTimeout): " + defaultTimeout);

        // Primitive Casting Mechanics
        double preciseWaitTime = 15.95;
        
        // Explicit Narrowing (Double to Int) -> Risks decimal truncation
        int truncatedWaitTime = (int) preciseWaitTime;
        System.out.printf("Explicit Narrowing: Source double (%f) cast to int (%d)%n", preciseWaitTime, truncatedWaitTime);

        // Safe Widening (Int to Double) -> Automatic
        double wideningValue = defaultTimeout;
        System.out.printf("Implicit Widening: Source int (%d) auto-widened to double (%f)%n", defaultTimeout, wideningValue);

        // Practical Utility: Parsing Numeric elements from Web UI text
        String uiPriceText = "$120.45";
        try {
            // Strip currency symbols and parse
            double cleanedPrice = Double.parseDouble(uiPriceText.replace("$", ""));
            System.out.printf("Web UI Data Harvesting: Raw Text '%s' parsed into clean double: %f%n", uiPriceText, cleanedPrice);
        } catch (NumberFormatException e) {
            System.err.println("Failed to parse non-numeric string: " + e.getMessage());
        }
    }

    public static void main(String[] args) {
        new VariableSandbox().runDemo();
    }
}