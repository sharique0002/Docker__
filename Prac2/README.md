# 🐳 Dockerized Python Flask Application

[![Docker](https://img.shields.io/badge/Docker-Containerized-blue?logo=docker)](https://www.docker.com/)
[![Python](https://img.shields.io/badge/Python-3.11-green?logo=python)](https://www.python.org/)
[![Flask](https://img.shields.io/badge/Flask-3.0.0-lightgrey?logo=flask)](https://flask.palletsprojects.com/)

A simple, production-ready Python Flask web application containerized with Docker.

**GitHub Repository:** [https://github.com/sharique0002/Docker__](https://github.com/sharique0002/Docker__)

---

## 📋 Project Overview

This is a lightweight Flask web application that demonstrates how to containerize a Python application using Docker. The application runs a basic web server that responds to HTTP requests on port 5000.

### Features

- Simple Flask web server with a welcome page
- `/health` endpoint returning JSON health status
- Fully containerized with Docker using `python:3.11-slim` base image
- Lightweight and production-ready configuration

---

## 📁 Project Structure

```
Docker__/
├── Prac1/
│   └── push-docker.ps1        # PowerShell script to push image to Docker Hub
├── Prac2/
│   ├── app.py                 # Main Flask application
│   ├── requirements.txt       # Python dependencies (Flask, Werkzeug)
│   ├── Dockerfile             # Docker image configuration
│   └── README.md              # Project documentation (this file)
```

---

## 🐳 Docker Setup

### Dockerfile Breakdown

| Instruction | Purpose |
|---|---|
| `FROM python:3.11-slim` | Uses a lightweight Python 3.11 base image |
| `WORKDIR /app` | Sets the working directory inside the container |
| `COPY requirements.txt .` | Copies dependency file first (for layer caching) |
| `RUN pip install --no-cache-dir -r requirements.txt` | Installs Python dependencies |
| `COPY app.py .` | Copies the application source code |
| `EXPOSE 5000` | Documents that the container listens on port 5000 |
| `CMD ["python", "app.py"]` | Starts the Flask application |

### Build the Docker Image

```bash
docker build -t flask-app .
```

### Run the Docker Container

```bash
docker run -d -p 5000:5000 --name flask-container flask-app
```

| Flag | Description |
|---|---|
| `-d` | Run in detached (background) mode |
| `-p 5000:5000` | Map host port 5000 to container port 5000 |
| `--name flask-container` | Name the container for easy reference |

### Push to Docker Hub

Use the included PowerShell script in `Prac1/`:

```powershell
.\Prac1\push-docker.ps1 -Tag v1
```

---

## 🌐 Accessing the Application

Once the container is running, open your browser:

| Endpoint | URL | Description |
|---|---|---|
| Home | [http://localhost:5000](http://localhost:5000) | Welcome page |
| Health Check | [http://localhost:5000/health](http://localhost:5000/health) | Returns `{"status": "healthy"}` |

---

## 🚀 Quick Start

1. **Clone the repository**
   ```bash
   git clone https://github.com/sharique0002/Docker__.git
   cd Docker__/Prac2
   ```

2. **Build the Docker image**
   ```bash
   docker build -t flask-app .
   ```

3. **Run the container**
   ```bash
   docker run -d -p 5000:5000 --name flask-container flask-app
   ```

4. **Verify it's running**
   ```bash
   docker ps
   ```

5. **View logs**
   ```bash
   docker logs flask-container
   ```

6. **Stop and remove the container**
   ```bash
   docker stop flask-container
   docker rm flask-container
   ```

---

## 🛠️ Development (without Docker)

1. Create and activate a virtual environment:
   ```bash
   python -m venv venv
   # Windows
   venv\Scripts\activate
   # Linux/Mac
   source venv/bin/activate
   ```

2. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```

3. Run the application:
   ```bash
   python app.py
   ```

---

## 📦 Dependencies

| Package | Version |
|---|---|
| Flask | 3.0.0 |
| Werkzeug | 3.0.1 |

---

## 👤 Author

**Sharique** — [github.com/sharique0002](https://github.com/sharique0002)

## 📄 License

This project is open source and available for educational purposes.

---

> **Note:** This uses Flask's built-in development server. For production, consider using a WSGI server like **Gunicorn** or **uWSGI**.
