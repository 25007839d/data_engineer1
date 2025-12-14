# dataproc_pyspark_dataflow_dag.py

from datetime import datetime
from airflow import DAG
from airflow.operators.dummy import DummyOperator

from airflow.providers.google.cloud.operators.dataproc import (
    DataprocCreateClusterOperator,
    DataprocDeleteClusterOperator,
    DataprocSubmitJobOperator,
)

from airflow.providers.google.cloud.operators.dataflow import (
    DataflowStartFlexTemplateOperator
)

# ------------------------
# Constants
# ------------------------

PROJECT_ID = 'euphoric-axiom-475504-f3'
REGION = 'us-central1'

CLUSTER_NAME = 'dev-euphoric-axiom-475504-f3-{{ ds_nodash }}'

GCS_STAGING_BUCKET = 'gs://socourse_de_1/staging'
GCS_INPUT_PATH = 'gs://socourse_de_1/input'
GCS_OUTPUT_PATH = 'gs://socourse_de_1/output'

BQ_TABLE = f"{PROJECT_ID}.dev_staging.employee_department"
BQ_TEMP_BUCKET = 'gs://socourse_de_1/tmp'

PYSPARK_FILE = 'gs://socourse_de_1/jars/app.py'

# Dataflow Flex Template
DATAFLOW_TEMPLATE = 'gs://socourse_de_1/templates/csv_join.json'
DATAFLOW_TEMP = 'gs://socourse_de_1/temp'
DATAFLOW_STAGING = 'gs://socourse_de_1/staging'
DATAFLOW_SA = 'composer1@euphoric-axiom-475504-f3.iam.gserviceaccount.com'

# ------------------------
# Default args
# ------------------------

default_args = {
    'owner': 'airflow',
    'depends_on_past': False,
    'start_date': datetime(2025, 1, 1),
    'email_on_failure': False,
    'email_on_retry': False,
    'retries': 0,
}

# ------------------------
# DAG Definition
# ------------------------

with DAG(
    dag_id='dataproc_pyspark_with_dataflow_flex',
    default_args=default_args,
    schedule_interval='59 * * * *',
    catchup=False,
    tags=['dataproc', 'dataflow', 'flex-template'],
) as dag:

    # ------------------------
    # Start
    # ------------------------
    start = DummyOperator(task_id='start')

    # ------------------------
    # Create Dataproc Cluster
    # ------------------------
    create_cluster = DataprocCreateClusterOperator(
        task_id='create_cluster',
        project_id=PROJECT_ID,
        cluster_name=CLUSTER_NAME,
        region=REGION,
        cluster_config={
            'gce_cluster_config': {
                'service_account': 'dataproc-service-account@euphoric-axiom-475504-f3.iam.gserviceaccount.com',
                'service_account_scopes': [
                    'https://www.googleapis.com/auth/cloud-platform'
                ],
            },
            'master_config': {
                'num_instances': 1,
                'machine_type_uri': 'n1-standard-4',
                'disk_config': {'boot_disk_size_gb': 100},
            },
            'worker_config': {
                'num_instances': 0,  # single-node cluster
            },
            'software_config': {
                'properties': {
                    'spark:spark.jars.packages':
                        'com.google.cloud.spark:spark-bigquery-with-dependencies_2.12:0.30.0'
                }
            },
        },
    )

    # ------------------------
    # Submit PySpark Job
    # ------------------------
    job_id = f"pyspark-job-{{{{ ts_nodash }}}}"

    pyspark_job = {
        'reference': {'job_id': job_id},
        'placement': {'cluster_name': CLUSTER_NAME},
        'pyspark_job': {
            'main_python_file_uri': PYSPARK_FILE,
            'args': [
                '--gcs_input_path', GCS_INPUT_PATH,
                '--gcs_output_path', GCS_OUTPUT_PATH,
                '--bq_output_table', BQ_TABLE,
                '--temp_gcs', BQ_TEMP_BUCKET,
            ],
            'jar_file_uris': [
                'gs://socourse_de_1/spark-bigquery-latest_2.12.jar'
            ],
        }
    }

    submit_pyspark = DataprocSubmitJobOperator(
        task_id='submit_pyspark',
        project_id=PROJECT_ID,
        region=REGION,
        job=pyspark_job,
    )

    # ------------------------
    # Run Dataflow Flex Template
    # ------------------------
    run_dataflow_flex = DataflowStartFlexTemplateOperator(
        task_id='run_dataflow_csv_join',
        project_id=PROJECT_ID,
        location=REGION,
        body={
            "launchParameter": {
                "jobName": "csv-join-{{ ds_nodash }}",
                "containerSpecGcsPath": DATAFLOW_TEMPLATE,
                "parameters": {
                    "input_employees": "gs://socourse_de_1/input/employees.csv",
                    "input_departments": "gs://socourse_de_1/input/departments.csv",
                    "output": "gs://socourse_de_1/output/joined/{{ ds_nodash }}"
                },
                "environment": {
                    "serviceAccountEmail": DATAFLOW_SA,
                    "tempLocation": DATAFLOW_TEMP,
                    "stagingLocation": DATAFLOW_STAGING
                }
            }
        }
    )

    # ------------------------
    # Delete Dataproc Cluster
    # ------------------------
    delete_cluster = DataprocDeleteClusterOperator(
        task_id='delete_cluster',
        project_id=PROJECT_ID,
        cluster_name=CLUSTER_NAME,
        region=REGION,
        trigger_rule='all_done',
    )

    # ------------------------
    # End
    # ------------------------
    end = DummyOperator(task_id='end')

    # ------------------------
    # DAG Dependencies
    # ------------------------
    start >> create_cluster >> submit_pyspark >> run_dataflow_flex >> delete_cluster >> end
