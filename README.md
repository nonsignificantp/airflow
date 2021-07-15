# Apache Airflow

## Getting started

### Installing

Pull directly from the github container registry on this repo by typing on the terminal:

```{bash}
docker pull ghcr.io/nonsignificantp/airflow:latest
```

### Use

### Docker run

Run the `docker run` command to create a container

```{bash}
docker run -it --rm -p 8080:8080 -v ${PWD}/dags:/opt/airflow/dags ghcr.io/nonsignificantp/airflow:latest
```

Create a port mapping on port 8080 to access Airflow's webserver by going to [http://localhost:8080/](http://localhost:8080/) on your browser. Export DAGs definition from your working environment by binding a volumne pointing to `/opt/airflow/dags` inside the container.

Optionally `-e AIRFLOW__WEBSERVER__EXPOSE_CONFIG=True` to expose airflow configurations and `-e AIRFLOW__SCHEDULER__DAG_DIR_LIST_INTERVAL=10` to reload DAG registry every 10 seconds.

```{bash}
docker run -it --rm \
    -p 8080:8080 \
    -v ${PWD}/dags:/opt/airflow/dags \
    -e AIRFLOW__SCHEDULER__DAG_DIR_LIST_INTERVAL=10 \
    -e AIRFLOW__WEBSERVER__EXPOSE_CONFIG=True \
    ghcr.io/nonsignificantp/airflow:latest
```

### Docker Compose

Add `nonsignificantp/airflow:latest` as a service on your `docker-compose.yml` file in the following way:

```{bash}
version: "3"
services:
    airflow:
        image: ghcr.io/nonsignificantp/airflow:latest
        ports:
            - 8080:8080
        volumnes:
            - ${PWD}/dags:/opt/airflow/dags
        environment: 
            AIRFLOW__SCHEDULER__DAG_DIR_LIST_INTERVAL: "10"
            AIRFLOW__WEBSERVER__EXPOSE_CONFIG: "True"
```