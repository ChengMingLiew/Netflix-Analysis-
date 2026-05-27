# Netflix ELT Pipeline, Analysis and Visualisation

This project was done by using Kaggle API to download Netflix data. The purpose of this project is to ingest, process and conduct an analysis of the data in order to build a competitive edge against Netflix. An ELT (Extract, Load and Transform) pipeline was created to ingest the data with the Medallion architecture. Furthermore, the data was loaded into Databricks for visualisations and querying of the fact and dimension tables that can be found in the gold layer.

Tech stack:
- Docker
- dbt
- Databricks

Repository Structure
1. docker-compose.yml.: This file contains the configuration for Docker Compose which is used to orchestrate multiple containers. It defines a few services listed down below:
   - ingestion: Runs the python ingestion code that will download the data with an API call.
   - dbt: Runs the dbt transformations for our data to go through the Medallion architecture and load our data onto Databricks.
3. model_transformations: This is where all our dbt transformations happen between the layers of our architecture.
4. ingestion: Holds all of our python scripts that will load the Netflix data under the 'seed' folder in our dbt/model_transformations directory.

Getting Started
1. Ensure that you have docker installed in your machine.
2. Clone this repository, git checkout to this branch and navigate to the project directory.
3. Make sure to configure your profiles.yml file under dbt/model_transformations such that it is pointing to your Databricks Unity Catalog:
5. Run `docker compose up --build`
6. Ensure the transformations and test has been ran and no issues arise for the dbt transformations.
7. You can now log into your Databricks account and find the data under 'Catalog' in the catalog and schemas that you have configured in step 3.
