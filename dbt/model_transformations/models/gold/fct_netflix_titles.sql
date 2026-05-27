WITH staging AS (
    SELECT * FROM {{ ref('staging_netflix_titles') }}
)

SELECT
    show_id,
    CAST(DATE_FORMAT(date_added, 'yyyyMMdd') AS INT)  AS date_key,
    title,
    type,
    director,
    countries,
    rating,
    release_year,
    duration_minutes,
    duration_seasons,
    loaded_at

FROM staging