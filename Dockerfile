# Use a lightweight Python image as the base image
FROM python:3.10-slim

# Set environment variables to prevent Python from writing .pyc files
# and to ensure output is sent directly to the terminal
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory in the container
WORKDIR /src

# Install system dependencies required for psycopg2 (PostgreSQL adapter)
# and clean up apt cache to keep the image size down
RUN apt-get update \
    && apt-get install -y --no-install-recommends libpq-dev gcc \
    && rm -rf /var/lib/apt/lists/*

# Copy the requirements file and install Python dependencies
# We copy it separately to leverage Docker's layer caching
COPY requirements.txt /src/
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Copy the rest of your Django project code into the container
COPY . /src/

# Expose the port your Django application will run on
EXPOSE 8000

# Define the command to run your Django application
# Using runserver for development. For production, you would typically use Gunicorn or uWSGI.
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

