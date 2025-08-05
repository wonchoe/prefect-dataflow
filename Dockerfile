FROM prefecthq/prefect:2.14-python3.10

WORKDIR /opt/prefect

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["prefect", "worker", "start", "--pool", "ecs-pool"]
