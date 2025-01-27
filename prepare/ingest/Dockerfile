FROM python:3.12

WORKDIR /app

COPY ingest.py .

RUN [ "pip", "install", "pandas"]
RUN [ "pip", "install", "sqlalchemy"]
RUN [ "pip", "install", "psycopg2"]
RUN [ "apt-get", "update" ]
RUN [ "apt-get", "install", "libpq-dev" ]
RUN [ "apt-get", "install", "wget"]
ENTRYPOINT [ "python", "ingest.py" ]