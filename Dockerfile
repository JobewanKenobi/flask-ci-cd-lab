# Use official Python image
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Copy project files
COPY . .

# Set up environment
RUN pip install --no-cache-dir flask

# Expose port
EXPOSE 5000

# Run the app
CMD ["python3", "run.py"]
