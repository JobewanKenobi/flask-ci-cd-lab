# 🚀 Flask CI/CD Lab – GitHub Actions + Docker

This lab demonstrates a CI/CD pipeline using GitHub Actions to automatically build and deploy a Flask web application inside a Docker container when code is pushed to the repository.

---

## 🗂 Project Structure

```bash
flask-ci-cd-lab/
├── app/
│   └── __init__.py
├── .github/
│   └── workflows/
│       └── deploy.yml
├── Dockerfile
├── .dockerignore
├── run.py
├── README.md
└── ci-cd-setup.md
```

---

## ✅ Workflow Summary

- A simple Flask app is created.
- Code is containerized using Docker.
- GitHub Actions automatically builds the container on push.
- CI/CD steps are version-controlled and repeatable.

---

## 🛠 Setup Steps

### 1. Create a virtual environment and install Flask

```bash
python3 -m venv venv
source venv/bin/activate
pip install flask
```

---

### 2. Create the Flask app

**app/__init__.py**
```python
from flask import Flask

app = Flask(__name__)

@app.route("/")
def home():
    return "Hello CI/CD World!"
```

---

### 3. Create the entry point

**run.py**
```python
from app import app

if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0")
```

---

### 4. Create the Dockerfile

**Dockerfile**
```Dockerfile
FROM python:3.10-slim

WORKDIR /app

COPY . .

RUN pip install --no-cache-dir flask

CMD ["python3", "run.py"]
```

---

### 5. Add .dockerignore

**.dockerignore**
```
venv
__pycache__
*.pyc
*.pyo
*.pyd
.Python
.env
```

---

### 6. Create GitHub Actions Workflow

**.github/workflows/deploy.yml**
```yaml
name: Deploy Flask App

on:
  push:
    branches:
      - main

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout code
      uses: actions/checkout@v3

    - name: Set up Python
      uses: actions/setup-python@v4
      with:
        python-version: '3.10'

    - name: Install dependencies
      run: |
        python -m pip install --upgrade pip
        pip install flask

    - name: Run tests (placeholder)
      run: echo "Tests go here"

    - name: Build Docker image
      run: docker build -t flask-ci-cd-lab .
```

---

## 🧪 Testing Locally

```bash
docker build -t flask-ci-cd-lab .
docker run -p 5000:5000 flask-ci-cd-lab
```

---

## 📌 Notes

- Ensure Docker is installed and the Docker daemon is running.
- GitHub Actions runners have Docker pre-installed, so no extra setup is needed for builds.
