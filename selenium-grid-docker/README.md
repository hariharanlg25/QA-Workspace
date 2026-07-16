version: "3.8"

services:
  # Centralized Hub Router coordinating session allocations
  selenium-hub:
    image: selenium/hub:4.18.1
    container_name: selenium-hub
    ports:
      - "4444:4444"
    volumes:
      # Mount custom TOML grid configurations directly to the hub
      - ../Grid-Setup/config.toml:/opt/selenium/config.toml
    environment:
      - SE_OPTS=--config /opt/selenium/config.toml
    networks:
      - selenium-grid-net
    healthcheck:
      test: ["CMD", "curl", "-f", "http://localhost:4444/wd/hub/status"]
      interval: 10s
      timeout: 5s
      retries: 3

  # Isolated Chrome Execution Node
  selenium-chrome-node:
    image: selenium/node-chrome:4.18.1
    container_name: selenium-chrome-node
    shm_size: 2gb # Crucial: Allocates ample shared memory to prevent browser page crashes
    depends_on:
      selenium-hub:
        condition: service_healthy # Wait for Event Bus Router to be fully healthy before booting
    environment:
      - SE_EVENT_BUS_HOST=selenium-hub
      - SE_EVENT_BUS_PUBLISH_PORT=4442
      - SE_EVENT_BUS_SUBSCRIBE_PORT=4443
    ports:
      - "5900:5900" # VNC port to visually monitor real-time execution steps
    networks:
      - selenium-grid-net

  # Isolated Firefox Execution Node
  selenium-firefox-node:
    image: selenium/node-firefox:4.18.1
    container_name: selenium-firefox-node
    shm_size: 2gb
    depends_on:
      selenium-hub:
        condition: service_healthy
    environment:
      - SE_EVENT_BUS_HOST=selenium-hub
      - SE_EVENT_BUS_PUBLISH_PORT=4442
      - SE_EVENT_BUS_SUBSCRIBE_PORT=4443
    ports:
      - "5901:5900" # Map to unique host VNC port to avoid port conflicts
    networks:
      - selenium-grid-net

networks:
  selenium-grid-net:
    driver: bridge