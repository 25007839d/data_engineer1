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
    'dataproc_pyspark_pipeline',
    default_args=default_args,
    schedule_interval='59 * * * *',
    catchup=False,
) as dag:
    start = DummyOperator(task_id='start_task')

    create_cluster = DataprocCreateClusterOperator(
        task_id='create_cluster',
        project_id=PROJECT_ID,
        cluster_name=CLUSTER_NAME,
        region=REGION,
        cluster_config={
            'gce_cluster_config': {
                'service_account': 'dataproc-service-account@euphoric-axiom-475504-f3.iam.gserviceaccount.com',
                'service_account_scopes': ['https://www.googleapis.com/auth/cloud-platform'],
            },
            'master_config': {
                'num_instances': 1,
                'machine_type_uri': 'n1-standard-4',
                'disk_config': {'boot_disk_size_gb': 100},
            },
            'worker_config': {
                'num_instances': 0,
            },
            'software_config': {
                'properties': {
                    'spark:spark.jars.packages':
                        'com.google.cloud.spark:spark-bigquery-with-dependencies_2.12:0.30.0'
                }
            },
        },
    )

    job_id = f"pyspark-job-{datetime.now().strftime('%Y%m%d%H%M%S')}"
    pyspark_job = {
        'reference': {'job_id': job_id},
        'placement': {'cluster_name': CLUSTER_NAME},
        'pyspark_job': {
            'main_python_file_uri': PYSPARK_FILE,
            'args': [
                '--gcs_input_path', GCS_INPUT_PATH,
                '--gcs_output_path', GCS_OUTPUT_PATH,
                '--bq_output_table', BQ_TABLE,   # optional if you stop writing to BQ in app.py
                '--temp_gcs', BQ_TEMP_BUCKET,
            ],
            'jar_file_uris': ['gs://socourse_de_1/spark-bigquery-latest_2.12.jar'],
        }
    }

    submit_pyspark = DataprocSubmitJobOperator(
        task_id='submit_pyspark',
        project_id=PROJECT_ID,
        region=REGION,
        job=pyspark_job,
    )

    # 🔹 NEW TASK: Load Parquet files from GCS to BigQuery
    load_parquet_to_bq = GCSToBigQueryOperator(
        task_id='load_parquet_to_bq',
        bucket='socourse_de_1',
        source_objects=[PARQUET_PREFIX],  # output/employee_department/*
        destination_project_dataset_table=BQ_TABLE,
        source_format='PARQUET',
        write_disposition='WRITE_APPEND',  # or WRITE_TRUNCATE if you want to overwrite
        autodetect=True,
        # location='US',  # uncomment if your BQ dataset is in a specific location
    )

    delete_cluster = DataprocDeleteClusterOperator(
        task_id='delete_cluster',
        project_id=PROJECT_ID,
        cluster_name=CLUSTER_NAME,
        region=REGION,
        trigger_rule='all_done',
    )

    end = DummyOperator(task_id='end')

    # Pipeline order:
    # Dataproc cluster -> PySpark job -> Load to BQ -> delete cluster
    start >> create_cluster >> submit_pyspark >> load_parquet_to_bq >> delete_cluster >> end
