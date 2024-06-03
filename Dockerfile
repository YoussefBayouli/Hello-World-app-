FROM python:3.10-slim

#  non-root user and group
RUN groupadd -r appgroup && useradd -r -g appgroup appuser

# Setting the working directory in the container
WORKDIR /app

# Copying the current directory contents into the container at /app
COPY . /app/

# Changing the ownership of the /app directory to the non-root user
RUN chown -R appuser:appgroup /app

# Switching to the non-root user
USER appuser

# Installing any needed packages specified in requirements.txt
RUN pip install --no-cache-dir Flask==2.0.3 Werkzeug==2.0.3

# Making port 5000 available to the world outside this container
EXPOSE 5000

# Environment variable
ENV NAME World

# Running flask-hello-world.py when the container launches
CMD ["python", "flask-hello-world.py"]
