# Prac3 - Apache Docker on Port 8002

A lightweight Docker project that runs the official Apache HTTP Server and exposes it on **localhost:8002**.

## Project Structure

```
apache-docker-8002/
├── Dockerfile
├── docker-compose.yml
├── README.md
└── html/
    └── index.html
```

## Prerequisites

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

## Setup Instructions

1. Clone this repository:
   ```bash
   git clone <repository-url>
   cd apache-docker-8002
   ```

2. Build and start the container:
   ```bash
   docker compose up --build -d
   ```

3. Open your browser and navigate to:
   **[http://localhost:8002](http://localhost:8002)**

## Stopping the Container

```bash
docker compose down
```
