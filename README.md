# Pipeline de Dados com IoT e Docker

## Objetivo
Criar um pipeline de dados que processa leituras de temperatura de dispositivos IoT, armazena em um banco PostgreSQL e exibe em um dashboard interativo com Streamlit.

## Pré-requisitos
- Conta no [Kaggle](https://www.kaggle.com)
- Docker e Docker Compose
- Python 3.10+
- Banco de dados PostgreSQL

## Instalação
```bash
# Clone o repositório
https://github.com/SEU_USUARIO_IOT/pipeline-iot-docker.git
cd pipeline-iot-docker

# Crie a imagem Docker
docker build -t iot-pipeline .

# Execute o PostgreSQL
docker run --name postgres-iot -e POSTGRES_PASSWORD=sua_senha -p 5432:5432 -d postgres

# Acesse o container e crie o banco
docker exec -it postgres-iot psql -U postgres
CREATE DATABASE iot_db;
\q
```

## Pipeline de Dados
```bash
# Execute o script para inserir os dados
python pipeline.py

# Crie as views SQL no PostgreSQL
psql -U postgres -d iot_db -f views.sql
```

## Executando o Dashboard
```bash
docker run -p 8501:8501 --network="host" iot-pipeline
# ou localmente
streamlit run dashboard.py
```

## Views SQL
- `avg_temp_por_dispositivo`: média de temperatura por dispositivo.
- `leituras_por_hora`: total de leituras por hora do dia.
- `temp_max_min_por_dia`: máximas e mínimas temperaturas por dia.

## Resultados
O dashboard exibe:
1. **Média de temperatura por dispositivo** (gráfico de barras).
2. **Contagem de leituras por hora** (linha temporal).
3. **Temperatura máxima e mínima por dia** (linha múltipla).

## Insights
- Identificação de dispositivos com temperaturas anômalas
- Padrões de leitura ao longo do dia
- Tendências climáticas ao longo do tempo

## Publicação
```bash
git add .
git commit -m "Projeto inicial: Pipeline de Dados IoT"
git remote add origin https://github.com/SEU_USUARIO_IOT/pipeline-iot-docker.git
git push -u origin main
```

---

**Autor**: Ahissa — 2025
