import os
import kagglehub
import shutil

path = kagglehub.dataset_download("shivamb/netflix-shows", output_dir='./netflix_data', force_download=True)
csv_file = os.path.join(path, "netflix_titles.csv")

dest_folder = "/app/model_transformations/seeds"
shutil.copy("./netflix_data/netflix_titles.csv", os.path.join(dest_folder, "raw_netflix_titles.csv"))

print("Successfully completed download of Netflix Title dataset!")
