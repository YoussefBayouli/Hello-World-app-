FROM python:3.12.3
WORKDIR /app
COPY . .
CMD ["python", "hello-world.py"]
