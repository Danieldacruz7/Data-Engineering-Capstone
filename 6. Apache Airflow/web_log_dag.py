# import the libraries

from datetime import timedelta
# The DAG object; we'll need this to instantiate a DAG
from airflow import DAG
# Operators; we need this to write tasks!
from airflow.operators.bash_operator import BashOperator
# This makes scheduling easy
from airflow.utils.dates import days_ago

#defining DAG arguments

# You can override them on a per-task basis during operator initialization
default_args = {
    'owner': 'Daniel',
    'start_date': days_ago(0),
    'email': ['daniel@somemail.com'],
    'email_on_failure': True,
    'email_on_retry': True,
    'retries': 1,
    'retry_delay': timedelta(minutes=5),
}

# defining the DAG
dag = DAG(
    dag_id='process_web_log',
    default_args=default_args,
    description='Apache Airflow Capstone',
    schedule_interval=timedelta(days=1),
)

# define the first task
extract_data = BashOperator(
    task_id='extract_data',
    bash_command='cut -d" " -f1 accesslog.txt > extracted_data.txt',
    dag=dag,
)

# define the second task
transform_data = BashOperator(
    task_id='transform_data',
    bash_command='sed -e "s/198.46.149.143//g" accesslog.txt > transformed_data.txt',
    dag=dag,
)

# define the third task
load_data = BashOperator(
    task_id='load_data',
    bash_command='tar cvzf weblog.tar.gz transformed_data.txt',
    dag=dag,
)

# task pipeline
extract_data >> transform_data >> load_data