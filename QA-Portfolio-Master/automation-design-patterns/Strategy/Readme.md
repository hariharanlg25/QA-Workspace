package strategy;

/**
 * Strategy Pattern definition.
 * Models interchangeable, clean execution pipelines for different authentication behaviors.
 */
interface AuthStrategy {
    void authenticate(String username);
}

/**
 * Concrete strategy demonstrating standard username/password authentication.
 */
class StandardAuthStrategy implements AuthStrategy {
    @Override
    public void authenticate(String username) {
        System.out.println("[STRATEGY] Standard UI Authentication executed for: " + username);
    }
}

/**
 * Concrete strategy demonstrating dynamic API-token bypass authentication.
 */
class ApiTokenAuthStrategy implements AuthStrategy {
    private final String apiToken;

    public ApiTokenAuthStrategy(String apiToken) {
        this.apiToken = apiToken;
    }

    @Override
    public void authenticate(String username) {
        System.out.println("[STRATEGY] API Authentication executed for user: " + username + " utilizing token: " + apiToken);
    }
}

/**
 * Context runner class that holds and triggers the selected authentication strategy.
 */
public class AuthenticationStrategy {
    private AuthStrategy authStrategy;

    // Strategy is injected via the constructor
    public AuthenticationStrategy(AuthStrategy authStrategy) {
        this.authStrategy = authStrategy;
    }

    // Allows swapping strategies dynamically at runtime (Open/Closed Principle)
    public void setStrategy(AuthStrategy authStrategy) {
        this.authStrategy = authStrategy;
    }

    public void executeLogin(String username) {
        if (this.authStrategy == null) {
            throw new IllegalStateException("Authentication strategy has not been configured.");
        }
        this.authStrategy.authenticate(username);
    }
}