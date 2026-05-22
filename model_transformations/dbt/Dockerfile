FROM ghcr.io/dbt-labs/dbt-postgres:1.7.4

WORKDIR /app/dbt

COPY model_transformations/dbt .

RUN dbt-deps