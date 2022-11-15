# Dockerfile
FROM postgres:15.0

ENV POSTGRES_USER postgres
ENV POSTGRES_PASSWORD password
ENV POSTGRES_DB company

COPY init_docker_db.sql /docker-entrypoint-initdb.d/