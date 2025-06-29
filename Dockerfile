FROM python:3.10-slim

WORKDIR /app

RUN apt-get update && \
    apt-get install -y gcc libpq-dev && \
    apt-get clean

COPY requirements.txt requirements.txt
COPY . .

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8501

CMD ["streamlit", "run", "dashboard.py"]
