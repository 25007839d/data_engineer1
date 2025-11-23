# dataproc_pyspark_dag.py
from datetime import datetime
from airflow import DAG
from airflow.providers.google.cloud.operators.dataproc import (
    DataprocCreateClusterOperator,
    DataprocDeleteClusterOperator,
    DataprocSubmitJobOperator,
)
from airflow.operators.dummy import DummyOperator
from airflow.providers.google.cloud.transfers.gcs_to_bigquery import GCSToBigQueryOperator

PROJECT_ID = 'euphoric-axiom-475504-f3'
REGION = 'us-central1'
CLUSTER_NAME = 'dev-euphoric-axiom-475504-f3-{{ ds_nodash }}'
GCS_STAGING_BUCKET = 'gs://socourse_de_1/staging'
GCS_INPUT_PATH = 'gs://socourse_de_1/input'
GCS_OUTPUT_PATH = 'gs://socourse_de_1/output'
# PySpark writes Parquet to: gs://socourse_de_1/output/employee_department/...
PARQUET_PREFIX = 'output/employee_department/*'

BQ_TABLE = f"{PROJECT_ID}.dev_staging.employee_department"
BQ_TEMP_BUCKET = 'gs://socourse_de_1/tmp'
PYSPARK_FILE = 'gs://socourse_de_1/jars/app.py'  # upload app.py to this path

default_args = {
    'owner': 'airflow',
    'depends_on_past': False,
    'start_date': datetime(2025, 1, 1),
    'email_on_failure': False,
    'email_on_retry': False,
    'retries': 0,
}

with DAG(
    'dataproc_pyspark_pipeline_bq',
    default_args=default_args,
    schedule_interval='59 * * * *',
    catchup=False,
) as dag:
    start = DummyOperator(task_id='start_task')

    start