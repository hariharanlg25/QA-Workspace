# =============================================================================
# Selenium 4 Grid Custom Configuration File
# Workspace: selenium-grid-docker
# Filepath: Grid-Setup/config.toml
# This configuration adjusts the internal behaviors of the Selenium Grid hub.
# =============================================================================

[node]
# Set the absolute maximum number of concurrent test execution threads permitted on a node
max-sessions = 4

# Sets the polling frequency (in seconds) used to detect browser process drops
heartbeat-period = 60

# Determines how long a node will wait (in seconds) for a connection to establish before timing out
connection-timeout = 120

[session-queue]
# Defines the absolute capacity limit for the execution command queue
session-request-timeout = 300

# The interval (in seconds) at which the queue attempts to retry pairing requests
session-retry-interval = 5

[logging]
# Configures the server-side log output level (Options: INFO, FINE, WARNING, SEVERE)
log-level = "INFO"

# Sets whether system execution logs are formatted into a clean, readable single-line format
structured-logs = false

# Enable tracing log formats to support downstream debugging inside CI pipelines
tracing = true