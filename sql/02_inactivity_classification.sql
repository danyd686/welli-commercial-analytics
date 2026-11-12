
-- 02. Location Inactivity Classification
-- Classify each location using its latest available record.

WITH latest_record AS (
    SELECT
        sede_id,
        aliado_id,
        hunter_asignado,
        mes,
        dias_sin_app,
        ROW_NUMBER() OVER (
            PARTITION BY sede_id
            ORDER BY mes DESC
        ) AS row_num
    FROM sedes
),

classified AS (
    SELECT
        sede_id,
        aliado_id,
        hunter_asignado,
        mes,
        dias_sin_app,
        CASE
            WHEN dias_sin_app IS NULL THEN 'Nunca activada'
            WHEN dias_sin_app > 120 THEN 'Dead'
            WHEN dias_sin_app > 90 THEN 'Cemetery'
            WHEN dias_sin_app > 60 THEN 'Risk'
            ELSE 'Active'
        END AS estado_actual
    FROM latest_record
    WHERE row_num = 1
)

SELECT
    COALESCE(hunter_asignado, 'Sin Hunter') AS hunter,
    estado_actual,
    COUNT(*) AS cantidad_sedes
FROM classified
GROUP BY
    COALESCE(hunter_asignado, 'Sin Hunter'),
    estado_actual
ORDER BY
    hunter,
    cantidad_sedes DESC;
