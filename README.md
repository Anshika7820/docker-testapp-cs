# Docker Test App

## Overview
This project is a containerized full-stack application built using Docker and Docker Compose.
It demonstrates how to package an application along with its database and supporting services into isolated containers.

The system consists of:

- Backend Application (Node.js)
- Database (MongoDB)
- Database UI (Mongo Express)

## Architecture
This project uses a multi-container setup managed via Docker Compose.

Services:

- testapp -> Main application
- mongo -> Database service
- mongo-express -> Web UI to manage MongoDB

## Docker Hub Image
The application image is available on Docker Hub:

https://hub.docker.com/r/anshi1008/docker-testapp-cs

Pull the image:

```bash
docker pull anshi1008/docker-testapp-cs:latest
```

## Prerequisites
Make sure Docker is installed and running.

## How to Run the Project

### Option 1: Run Without Docker Compose (Easy - Recommended)

Step 1: Run MongoDB

```bash
docker run -d -p 27017:27017 --name mongo \
-e MONGO_INITDB_ROOT_USERNAME=mongoadmin \
-e MONGO_INITDB_ROOT_PASSWORD=secret \
mongo
```

Step 2: Run Mongo Express

```bash
docker run -d -p 8081:8081 --name mongo-express \
--link mongo \
-e ME_CONFIG_MONGODB_ADMINUSERNAME=mongoadmin \
-e ME_CONFIG_MONGODB_ADMINPASSWORD=secret \
-e ME_CONFIG_MONGODB_SERVER=mongo \
mongo-express
```

Step 3: Run Application

```bash
docker run -d -p 5050:5050 --name testapp \
--link mongo \
anshi1008/docker-testapp-cs:latest
```

### Option 2: Run Using Docker Compose (Full Setup)

Clone or fork this repository, open it in terminal, and run:

```bash
docker compose -f mongodb.yaml up -d
```

This will:

- Start all services (app + database + UI)
- Automatically create network between containers

## Access the Application
| Service | URL |
| --- | --- |
| Application | http://localhost:5050 |
| Mongo Express | http://localhost:8081 |
| MongoDB | Port 27017 |

## Learning Outcomes
- Understanding Docker images and containers
- Working with Docker Compose
- Multi-container application setup
- Container networking

## Repository
GitHub: https://github.com/Anshika7820/docker-testapp-cs

## Author
Anshika
