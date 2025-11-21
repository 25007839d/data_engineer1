# dataproc_pyspark_dag.py
from datetime import datetime
from airflow import DAG
from airflow.providers.google.cloud.operators.dataproc import (
    DataprocCreateClusterOperator,
    DataprocDeleteClusterOperator,
    DataprocSubmitJobOperator,
)
from airflow.operators.dummy import DummyOperator

PROJECT_ID = 'euphoric-axiom-475504-f3'
REGION = 'us-central1'
CLUSTER_NAME = 'dev-euphoric-axiom-475504-f3-{{ ds_nodash }}'
GCS_STAGING_BUCKET = 'gs://socourse_de_1/staging'
GCS_INPUT_PATH = 'gs://socourse_de_1/input'
GCS_OUTPUT_PATH = 'gs://socourse_de_1/output'
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

with DAG('dataproc_pyspark_pipeline', default_args=default_args, schedule_interval='59 * * * *', catchup=False) as dag:
    start = DummyOperator(task_id='start_task')

    create_cluster = DataprocCreateClusterOperator(
        task_id='create_cluster',
        project_id=PROJECT_ID,
        cluster_name=CLUSTER_NAME,
        region=REGION,
        cluster_config={
            # GCE + Service Account
            'gce_cluster_config': {
                'service_account': 'dataproc-service-account@euphoric-axiom-475504-f3.iam.gserviceaccount.com',
                'service_account_scopes': ['https://www.googleapis.com/auth/cloud-platform'],
            },

            # Single-node cluster setup
            'master_config': {
                'num_instances': 1,
                'machine_type_uri': 'n1-standard-4',  # or e2-standard-4 for lower cost
                'disk_config': {'boot_disk_size_gb': 100},
            },
            'worker_config': {
                'num_instances': 0,  # ✅ No worker nodes
            },

            # Spark + BigQuery connector
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
                '--bq_output_table', BQ_TABLE,
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


    delete_cluster = DataprocDeleteClusterOperator(
        task_id='delete_cluster',
        project_id=PROJECT_ID,
        cluster_name=CLUSTER_NAME,
        region=REGION,
        trigger_rule='all_done',
    )

    end = DummyOperator(task_id='end')

    start >> create_cluster >> submit_pyspark>> delete_cluster >> end
