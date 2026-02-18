# Dockerized Python Flask Application

A simple, production-ready Python Flask web application containerized with Docker.

## 📋 Project Overview

This is a lightweight Flask web application that demonstrates how to containerize a Python application using Docker. The application runs a basic web server that responds to HTTP requests on port 5000.

### Features
- Simple Flask web server
- Health check endpoint
- Fully containerized with Docker
- Production-ready configuration

## 📁 Folder Structure

```
dockerfile/
│
├── app.py                 # Main Flask application
├── requirements.txt       # Python dependencies
├── Dockerfile            # Docker configuration
├── README.md            # Project documentation
└── .gitignore           # Git ignore rules
```

## 🐳 Docker Commands

### Build Docker Image

```bash
docker build -t flask-app .
```

This command builds a Docker image with the tag `flask-app` using the Dockerfile in the current directory.

### Run Docker Container

```bash
docker run -d -p 5000:5000 --name flask-container flask-app
```

Parameters explained:
- `-d`: Run container in detached mode (background)
- `-p 5000:5000`: Map port 5000 on host to port 5000 in container
- `--name flask-container`: Assign a name to the container
- `flask-app`: The image to use

## 🌐 Accessing the Application

Once the container is running, access the application at:

**http://localhost:5000**

### Available Endpoints

- `/` - Home page with welcome message
- `/health` - Health check endpoint (returns JSON status)

## 🚀 Quick Start

1. **Clone the repository**
   ```bash
   git clone <your-repo-url>
   cd dockerfile
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

6. **Stop the container**
   ```bash
   docker stop flask-container
   ```

7. **Remove the container**
   ```bash
   docker rm flask-container
   ```

## 🛠️ Development

### Running Locally (without Docker)

1. Create a virtual environment:
   ```bash
   python -m venv venv
   ```

2. Activate the virtual environment:
   - Windows: `venv\Scripts\activate`
   - Linux/Mac: `source venv/bin/activate`

3. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```

4. Run the application:
   ```bash
   python app.py
   ```

## 📦 Dependencies

- Flask 3.0.0
- Werkzeug 3.0.1

## 📄 License

This project is open source and available for educational purposes.

## 👤 Author

Created as a demonstration of Docker containerization with Python Flask.

---

**Note**: This is a development configuration. For production deployments, consider using a production WSGI server like Gunicorn or uWSGI instead of Flask's built-in development server.
