WITH source AS (
    SELECT * FROM {{ ref('raw_netflix_titles') }}
),

cleaned AS (
    SELECT
        show_id,
        INITCAP(TRIM(type))                                 AS type,
        TRIM(title)                                         AS title,
        COALESCE(TRIM(director), 'Unknown')                 AS director,
        COALESCE(TRIM(cast), 'Unknown')                     AS actors,
        COALESCE(TRIM(country), 'Unknown')                  AS countries,
        TO_DATE(TRIM(date_added), 'MMMM d, yyyy')           AS date_added,
        CAST(release_year AS INT)                           AS release_year,
        COALESCE(TRIM(rating), 'Unrated')                   AS rating,
        duration                                            AS duration,
        CASE WHEN UPPER(TRIM(type)) = 'MOVIE'
            THEN CAST(SPLIT_PART(duration, ' ', 1) AS INT)
        END                                                 AS duration_minutes,
        CASE WHEN UPPER(TRIM(type)) = 'TV SHOW'
            THEN CAST(SPLIT_PART(duration, ' ', 1) AS INT)
        END                                                 AS duration_seasons,
        TRIM(listed_in)                                     AS genres_list,
        TRIM(description)                                   AS description,
        CURRENT_TIMESTAMP                                   AS loaded_at

    FROM source
)

SELECT * FROM cleaned