WITH source AS (
    SELECT * FROM {{ source('destination_postgres_db', 'raw_netflix_titles') }}
),

cleaned AS (
    SELECT
        show_id,
        INITCAP(TRIM(type))                         AS type,
        TRIM(title)                                 AS title,
        COALESCE(TRIM(director), 'Unknown')         AS director,
        COALESCE(TRIM(casts), 'Unknown')            AS casts,
        COALESCE(TRIM(country), 'Unknown')          AS country,
        CAST(TRIM(date_added) AS DATE)              AS date_added,
        release_year::INT                           AS release_year,
        COALESCE(TRIM(rating), 'Unrated')           AS rating,
        duration                                    AS duration,
        CASE WHEN UPPER(TRIM(type)) = 'MOVIE'
            THEN SPLIT_PART(duration, ' ', 1)::INT
        END                                         AS duration_minutes,
        CASE WHEN UPPER(TRIM(type)) = 'TV SHOW'
            THEN SPLIT_PART(duration, ' ', 1)::INT
        END                                         AS duration_seasons,
        TRIM(listed_in)                             AS genres_list,
        TRIM(description)                           AS description,
        CURRENT_TIMESTAMP                           AS loaded_at

    FROM source
)

SELECT * FROM cleaned