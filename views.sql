CREATE OR REPLACE VIEW avg_temp_por_dispositivo AS
SELECT device_id, ROUND(AVG(temperature), 2) AS avg_temp
FROM temperature_readings
GROUP BY device_id;

CREATE OR REPLACE VIEW leituras_por_hora AS
SELECT EXTRACT(HOUR FROM timestamp) AS hora, COUNT(*) AS contagem
FROM temperature_readings
GROUP BY hora
ORDER BY hora;

CREATE OR REPLACE VIEW temp_max_min_por_dia AS
SELECT DATE(timestamp) AS data,
       MAX(temperature) AS temp_max,
       MIN(temperature) AS temp_min
FROM temperature_readings
GROUP BY data
ORDER BY data;
