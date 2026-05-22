WITH staging AS (
    SELECT * FROM {{ ref('staging_netflix_titles') }}
)

SELECT
    show_id,
    TO_CHAR(date_added, 'YYYYMMDD')::INT    AS date_key,
    title,
    type,
    director,
    country,
    rating,
    release_year,
    duration_minutes,
    duration_seasons,
    loaded_at

FROM staging