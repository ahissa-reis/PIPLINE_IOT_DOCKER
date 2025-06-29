import pandas as pd
from sqlalchemy import create_engine

DB_USER = 'postgres'
DB_PASS = 'sua_senha'
DB_HOST = 'localhost'
DB_PORT = '5432'
DB_NAME = 'iot_db'

def process_and_insert_data():
    engine = create_engine(f'postgresql://{DB_USER}:{DB_PASS}@{DB_HOST}:{DB_PORT}/{DB_NAME}')
    df = pd.read_csv('temperature.csv')
    df.to_sql('temperature_readings', engine, if_exists='replace', index=False)
    print("Dados inseridos com sucesso!")

if __name__ == '__main__':
    process_and_insert_data()
