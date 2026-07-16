package singleton;

/**
 * Enterprise-grade, thread-safe Singleton WebDriver Manager.
 * Utilizes Java's ThreadLocal wrapper to ensure that parallel test execution threads
 * run in complete isolation with distinct driver instances, avoiding collisions.
 */
public class WebDriverManager {

    // ThreadLocal container guarantees driver instance isolation per thread
    private static final ThreadLocal<String> driverThreadLocal = new ThreadLocal<>();

    // Private constructor prevents direct instantiation from outside the class
    private WebDriverManager() {}

    /**
     * Retrieves the thread-safe driver instance. Initializes a new instance
     * if none exists for the active thread (Lazy Initialization).
     * * @param browser The target browser type (e.g., "Chrome", "Firefox")
     * @return The active thread's driver instance
     */
    public static String getDriver(String browser) {
        if (driverThreadLocal.get() == null) {
            synchronized (WebDriverManager.class) {
                if (driverThreadLocal.get() == null) {
                    System.out.println("[SINGLETON] Initializing a new " + browser + " instance on Thread: " + Thread.currentThread().getId());
                    driverThreadLocal.set("MockWebDriver-" + browser + "-Thread-" + Thread.currentThread().getId());
                }
            }
        }
        return driverThreadLocal.get();
    }

    /**
     * Safely terminates the driver instance associated with the current thread
     * and removes it from memory to avoid severe memory leaks on worker nodes.
     */
    public static void quitDriver() {
        if (driverThreadLocal.get() != null) {
            System.out.println("[SINGLETON] Tearing down driver on Thread: " + Thread.currentThread().getId());
            driverThreadLocal.remove(); // Removes reference completely from ThreadLocal map
        }
    }
}