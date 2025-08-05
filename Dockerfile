FROM prefecthq/prefect:2.14-python3.10

WORKDIR /opt/prefect

COPY requirements.txt ./

RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt && \
    pip list | grep pandas

COPY . .

RUN python -c "import pandas; print('pandas successfully imported')"

CMD ["prefect", "worker", "start", "--pool", "ecs-pool"]