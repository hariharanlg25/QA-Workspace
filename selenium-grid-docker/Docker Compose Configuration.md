version: "3"

services:
  # Centralized Hub Coordinator Node
  selenium-hub:
    image: selenium/hub:4.18.1
    container_name: selenium-hub
    ports:
      - "4444:4444"
    environment:
      - GRID_MAX_SESSION=12                     # Absolute maximum concurrent sessions allowed across grid
      - GRID_SESSION_TIMEOUT=300                # Automatically kill orphaned driver sessions after 5 minutes
    healthcheck:
      test: ["CMD", "curl", "-f", "http://localhost:4444/status"]
      interval: 10s
      timeout: 5s
      retries: 3
    networks:
      - selenium-grid-net

  # Epstein Chrome Node Container
  chrome:
    image: selenium/node-chrome:4.18.1
    shm_size: "2gb"                            # CRITICAL: Prevent Chrome render engine from crashing
    depends_on:
      selenium-hub:
        condition: service_healthy              # Wait for Hub to stabilize before booting node
    environment:
      - SE_EVENT_BUS_HOST=selenium-hub          # Connects node to central Event Bus publisher
      - SE_EVENT_BUS_PUBLISH_PORT=4442          # Event bus registration port
      - SE_EVENT_BUS_SUBSCRIBE_PORT=4443        # Event bus subscription port
      - SE_NODE_MAX_SESSIONS=2                  # Concurrency allocation threshold inside this container
      - VNC_NO_PASSWORD=1                       # Disable security locks on live VNC preview stream
    ports:
      - "7900:7900"                             # Direct browser stream endpoint: http://localhost:7900
    networks:
      - selenium-grid-net

  # Firefox Node Container
  firefox:
    image: selenium/node-firefox:4.18.1
    shm_size: "2gb"                            # Prevents Firefox layout memory exhaustion
    depends_on:
      selenium-hub:
        condition: service_healthy
    environment:
      - SE_EVENT_BUS_HOST=selenium-hub
      - SE_EVENT_BUS_PUBLISH_PORT=4442
      - SE_EVENT_BUS_SUBSCRIBE_PORT=4443
      - SE_NODE_MAX_SESSIONS=2
      - VNC_NO_PASSWORD=1
    ports:
      - "7901:7900"                             # Mapped to a unique port to avoid host port collision
    networks:
      - selenium-grid-net

  # Edge Node Container
  edge:
    image: selenium/node-edge:4.18.1
    shm_size: "2gb"
    depends_on:
      selenium-hub:
        condition: service_healthy
    environment:
      - SE_EVENT_BUS_HOST=selenium-hub
      - SE_EVENT_BUS_PUBLISH_PORT=4442
      - SE_EVENT_BUS_SUBSCRIBE_PORT=4443
      - SE_NODE_MAX_SESSIONS=1                  # Lower allocation for heavier Edge engine threads
      - VNC_NO_PASSWORD=1
    ports:
      - "7902:7900"
    networks:
      - selenium-grid-net

# Define a shared bridged network for isolated container-to-container communication
networks:
  selenium-grid-net:
    driver: bridge