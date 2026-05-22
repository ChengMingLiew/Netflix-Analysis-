# Netflix ELT Pipeline, Analysis and Visualisation

This project was done by using Kaggle API to download Netflix data. The purpose of this project is to ingest, process and conduct an analysis of the data in order to build a competitive edge against Netflix. An ELT (Extract, Load and Transform) pipeline was created to ingest the data with the Medallion architecture. Furthermore, the data was loaded into Metabase for visualisation, which can then be customised by the end user to create different graphs and charts based on the tables in the gold layer of the architecture.

Tech stack:
- Docker
- PostgreSQL
- dbt
- Metabase

Repository Structure
1. docker-compose.yml.: This file contains the configuration for Docker Compose which is used to orchestrate multiple containers. It defines a few services listed down below:
   - postgres_db: Our PostgreSQL database, where it will store all our layers of data.
   - ingestion: Runs the python ingestion code that will download the data with an API call.
   - dbt: Runs the dbt transformations for our data to go through the Medallion architecture.
   - metabase: Hosts metabase locally so that we can access it through the web browser and run our visualisations.
2. source_init/init.sql: This initialises the SQL tables in our Postgres database.
3. model_transformations: This is where all our dbt transformations happen between the layers of our architecture.
4. ingestion: Holds all of our python scripts that will load the Netflix data into our Postgres database.

Getting Started
1. Ensure that you have docker installed in your machine.
2. Clone this repository and navigate to the project directory.
3. Make sure to configure your environment variables in a .env file:
   - POSTGRES_USER: This can be configured to be anything.
   - POSTGRES_PASSWORD: This can be configured to be anything.
   - POSTGRES_DB: This can be configured to be anything.
   - POSTGRES_SERVICE: This has to be the same as the postgres service in the docker-compose.yml.
   - POSTGRES_PORT: This can configured to be anything, I would recommend 5432.
5. Run `docker compose up --build`
6. After Metabase has started to run, we can access localhost:3000 in our web browser to do our visualisations.
7. Go through steps 1 - 4 of the Metabase Login.
   - Choose PostgreSQL when prompted 'Add your data'.
   - The 'Display Name' can be up to the users choosing.
   - The 'Host' should be the same as the name of our PostgreSQL service in docker.
   - The 'Port' should be the same as the one in our .env file.
   - 'User' and 'Password' are referring to the PostgreSQL database user and password we have configured in the .env file.
8. Complete! Now you can create your own visualisations.
