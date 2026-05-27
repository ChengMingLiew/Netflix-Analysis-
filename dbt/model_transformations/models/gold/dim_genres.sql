WITH exploded AS (
    SELECT
        show_id,
        TRIM(genre.value) AS genre
    FROM {{ ref('staging_netflix_titles') }}
    LATERAL VIEW EXPLODE(SPLIT(genres_list, ',')) genre AS value
    WHERE genres_list IS NOT NULL
)

SELECT
    {{ dbt_utils.generate_surrogate_key(['show_id', 'genre']) }}  AS genre_key,
    show_id,
    genre

FROM exploded
WHERE genre IS NOT NULL
ORDER BY show_id