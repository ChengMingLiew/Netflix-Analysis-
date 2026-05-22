import os
import kagglehub
import pandas as pd
from sqlalchemy import create_engine

DB_USER     = os.getenv('POSTGRES_USER')
DB_PASSWORD = os.getenv('POSTGRES_PASSWORD')
DB_NAME     = os.getenv('POSTGRES_DB')
DB_HOST     = os.getenv('POSTGRES_SERVICE')
DB_PORT     = os.getenv('POSTGRES_PORT')

engine = create_engine(
    f"postgresql+psycopg2://{DB_USER}:{DB_PASSWORD}@{DB_HOST}:{DB_PORT}/{DB_NAME}"
)

path = kagglehub.dataset_download("shivamb/netflix-shows", output_dir='./netflix_data', force_download=True)
csv_file = os.path.join(path, "netflix_titles.csv")

netflix_df = pd.read_csv("./netflix_data/netflix_titles.csv")

netflix_df.rename(columns={'cast': 'casts'}, inplace=True)

netflix_df.to_sql(
    con=engine,
    name="raw_netflix_titles",
    schema="bronze",
    index="False",
    if_exists="replace"
)

print("Successfully completed download of Netflix Title dataset!")