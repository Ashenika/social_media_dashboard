FROM python:3.9

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory
WORKDIR /app

# Copy the requirements file
COPY requirements.txt .

# Install Python dependencies
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Expose the port the app runs on (default for Flask is 5000)
EXPOSE 5000

# Define the command to run Gunicorn with your app
CMD ["gunicorn", "--config", "gunicorn-cfg.py", "run:app"]
# Add a second CMD to run 'flask run' (for development)
CMD ["flask", "run", "--host=0.0.0.0"]