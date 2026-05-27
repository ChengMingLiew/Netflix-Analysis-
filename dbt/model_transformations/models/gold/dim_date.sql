WITH dates AS (
    SELECT DISTINCT date_added AS full_date
    FROM {{ ref('staging_netflix_titles') }}
    WHERE date_added IS NOT NULL
)

SELECT
    CAST(DATE_FORMAT(full_date, 'yyyyMMdd') AS INT)     AS date_key,
    full_date,
    CAST(YEAR(full_date) AS INT)                        AS year,
    CAST(QUARTER(full_date) AS INT)                     AS quarter,
    CAST(MONTH(full_date) AS INT)                       AS month,
    DATE_FORMAT(full_date, 'MMMM')                      AS month_name,
    CAST(DAY(full_date) AS INT)                         AS day_of_month,
    CAST(DAYOFWEEK(full_date) AS INT)                   AS day_of_week,
    DATE_FORMAT(full_date, 'EEEE')                      AS day_name,
    DAYOFWEEK(full_date) IN (1, 7)                      AS is_weekend

FROM dates
ORDER BY full_date