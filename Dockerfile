FROM apache/airflow:2.9.1

USER root
RUN pip install apache-airflow[postgres] psycopg2-binary

WORKDIR /app

COPY data_collection /opt/airflow/scripts
COPY sources.json /opt/airflow/sources.json
COPY airflow/dags /opt/airflow/dags


RUN chown -R airflow: /opt/airflow

USER airflow

