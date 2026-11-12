
-- 01. Commercial Segment Ranking
-- Ranking by sector, acquisition channel and partner size.

WITH ally_size AS (
    SELECT
        aliado_id,
        COUNT(DISTINCT sede_id) AS total_sedes
    FROM sedes
    GROUP BY aliado_id
),

classified AS (
    SELECT
        s.*,
        CASE
            WHEN a.total_sedes = 1 THEN '1 sede'
            WHEN a.total_sedes BETWEEN 2 AND 3 THEN '2-3 sedes'
            ELSE '4+ sedes'
        END AS tamano_aliado
    FROM sedes s
    JOIN ally_size a
        ON s.aliado_id = a.aliado_id
),

segment_metrics AS (
    SELECT
        sector,
        canal_origen,
        tamano_aliado,
        COUNT(DISTINCT aliado_id) AS aliados,
        COUNT(DISTINCT sede_id) AS sedes,
        SUM(apps) AS solicitudes,
        SUM(aprobadas) AS aprobaciones,
        SUM(desembolsos) AS desembolsos,
        ROUND(
            100.0 * SUM(desembolsos) / NULLIF(SUM(apps), 0), 2
        ) AS conversion_pct,
        SUM(monto_desembolsado) AS monto_desembolsado,
        SUM(desembolsos_en_mora) AS desembolsos_en_mora,
        ROUND(
            100.0 * SUM(desembolsos_en_mora)
            / NULLIF(SUM(desembolsos), 0), 2
        ) AS mora_pct
    FROM classified
    GROUP BY sector, canal_origen, tamano_aliado
),

ranked AS (
    SELECT
        *,
        RANK() OVER (
            ORDER BY conversion_pct DESC
        ) AS ranking_conversion,
        RANK() OVER (
            ORDER BY monto_desembolsado DESC
        ) AS ranking_monto,
        RANK() OVER (
            ORDER BY
                CASE WHEN mora_pct IS NULL THEN 1 ELSE 0 END,
                mora_pct ASC
        ) AS ranking_calidad
    FROM segment_metrics
)

SELECT *
FROM ranked
ORDER BY ranking_calidad, ranking_conversion;
