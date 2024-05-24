FROM apache/airflow:2.9.1

USER root
RUN pip install apache-airflow[postgres] psycopg2-binary

COPY data_collection /opt/airflow/data_collection
COPY data_preprocessing /opt/airflow/data_preprocessing
COPY sources.json /opt/airflow/sources.json
COPY airflow/dags /opt/airflow/dags


RUN chown -R airflow: /opt/airflow

USER airflow

