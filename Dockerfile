FROM python:3.9-slim

WORKDIR /app

# Install system dependencies required for Pillow (images) and ReportLab (PDFs)
# Your project uses these libraries, so these system tools are mandatory.
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of your project files into the container
COPY . .

# Expose port 5051 (The port your app uses)
EXPOSE 5051

# Start the application using Gunicorn
# 'app:app' refers to your app.py file and the 'app' flask object inside it
CMD ["gunicorn", "--bind", "0.0.0.0:5051", "app:app"]