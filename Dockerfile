FROM apache/airflow:1.10.10

COPY scripts/start.sh /start.sh

USER root
RUN chmod +x /start.sh

USER airflow
ENTRYPOINT [ "bash", "-c" ]
CMD [ "/start.sh" ]