FROM python:3.10-slim

WORKDIR /opt/prefect

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Prefect в контейнері буде запускати твій flow сам — нічого вручну не треба
CMD ["prefect", "worker", "start", "--pool", "ecs-pool"]
