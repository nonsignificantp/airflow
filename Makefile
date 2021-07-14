.PHONY: build run airflow

build:
	@echo "=========== Updating image ==========="
	@docker rmi app/airflow:latest || exit 0
	@docker build -t teco/airflow .

run:
	@echo "=========== Start Airflow ==========="
	docker run -it --rm -p 8080:8080 teco/airflow:latest

service: build run
