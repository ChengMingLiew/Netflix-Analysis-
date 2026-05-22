FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .
COPY netflix_title_ingestion.py .

RUN pip install --no-cache-dir -r requirements.txt

CMD ["python", "netflix_title_ingestion.py"]
