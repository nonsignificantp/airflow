#!/usr/bin/env bash

if [[ ! -f /opt/airflow/airflow.db ]]; then
    airflow initdb > /dev/null
fi

airflow scheduler &
exec airflow webserver --host 0.0.0.0