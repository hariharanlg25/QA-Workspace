/**
 * Repository: java-programming
 * Folder: 01-Java-Basics
 * File: VariableDemo.java
 * Purpose: Demonstrates Java primitive data types, operators, and type casting.
 */
public class VariableDemo {

    public static void main(String[] args) {

        System.out.println("=== Java Execution Output Sandbox ===");

        // 1. Primitive Data Type Declarations
        int baseTimeout = 45;
        double precisionRatio = 98.75;
        boolean isElementVisible = true;

        System.out.println("Timeout Threshold configured: " + baseTimeout + " seconds");
        System.out.println("Precision Automation Metric: " + precisionRatio + "%");
        System.out.println("System Integrity Check Status: " + isElementVisible);

        // 2. Implicit Type Casting (Widening Conversion: int -> double)
        int initialValue = 100;
        double widenedValue = initialValue;

        System.out.println("Implicit Casting (int -> double): " + widenedValue);

        // 3. Explicit Type Casting (Narrowing Conversion: double -> int)
        double targetScore = 98.99;
        int narrowedScore = (int) targetScore; // Decimal portion is truncated

        System.out.println("Explicit Casting (double -> int): " + narrowedScore);
    }
}