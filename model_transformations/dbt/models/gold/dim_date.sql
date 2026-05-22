WITH dates AS (
    SELECT DISTINCT date_added AS full_date
    FROM {{ ref('staging_netflix_titles') }}
    WHERE date_added IS NOT NULL
)

SELECT
    TO_CHAR(full_date, 'YYYYMMDD')::INT           AS date_key,
    full_date,
    EXTRACT(YEAR  FROM full_date)::INT            AS year,
    EXTRACT(QUARTER FROM full_date)::INT          AS quarter,
    EXTRACT(MONTH FROM full_date)::INT            AS month,
    TO_CHAR(full_date, 'Month')                   AS month_name,
    EXTRACT(DAY   FROM full_date)::INT            AS day_of_month,
    EXTRACT(DOW   FROM full_date)::INT            AS day_of_week,   
    TO_CHAR(full_date, 'Day')                     AS day_name,
    EXTRACT(DOW   FROM full_date) IN (0, 6)       AS is_weekend

FROM dates
ORDER BY full_date