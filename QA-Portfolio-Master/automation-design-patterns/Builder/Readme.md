package builder;

/**
 * Builder Pattern implementation modeling a test execution User Profile.
 * Solves the telescoping constructor anti-pattern and enforces object immutability.
 */
public class UserProfile {
    // Immutable parameters declared as final
    private final String username;
    private final String email;
    private final String role;
    private final boolean isSsoEnabled;

    // Private constructor ensures the object can only be created via the Builder
    private UserProfile(Builder builder) {
        this.username = builder.username;
        this.email = builder.email;
        this.role = builder.role;
        this.isSsoEnabled = builder.isSsoEnabled;
    }

    // Getters only - no setters to preserve immutability
    public String getUsername() { return username; }
    public String getEmail() { return email; }
    public String getRole() { return role; }
    public boolean isSsoEnabled() { return isSsoEnabled; }

    @Override
    public String toString() {
        return String.format("UserProfile [Username=%s, Email=%s, Role=%s, SSO=%b]", 
            username, email, role, isSsoEnabled);
    }

    /**
     * Entry point to instantiate a new builder configuration.
     */
    public static Builder builder() {
        return new Builder();
    }

    /**
     * Nested static Builder class.
     */
    public static class Builder {
        private String username;
        private String email;
        private String role = "STANDARD"; // Default value
        private boolean isSsoEnabled = false; // Default value

        public Builder username(String username) {
            this.username = username;
            return this; // Returns builder reference to enable fluent method chaining
        }

        public Builder email(String email) {
            this.email = email;
            return this;
        }

        public Builder role(String role) {
            this.role = role;
            return this;
        }

        public Builder enableSso(boolean isSsoEnabled) {
            this.isSsoEnabled = isSsoEnabled;
            return this;
        }

        /**
         * Validates constraints and constructs the final immutable UserProfile.
         * * @return A fully built, validated UserProfile instance
         * @throws IllegalStateException if critical parameters are missing
         */
        public UserProfile build() {
            if (this.username == null || this.username.isEmpty()) {
                throw new IllegalStateException("Mandatory field 'username' cannot be null or empty.");
            }
            if (this.email == null || !this.email.contains("@")) {
                throw new IllegalStateException("Invalid or missing email address.");
            }
            return new UserProfile(this);
        }
    }
}