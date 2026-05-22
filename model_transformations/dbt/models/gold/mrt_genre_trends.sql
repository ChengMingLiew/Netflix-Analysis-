WITH titles AS (

    SELECT
        show_id,
        release_year
    FROM {{ ref('fct_netflix_title') }}

),

genres AS (

    SELECT
        show_id,
        genre
    FROM {{ ref('dim_genre') }}

)

SELECT
    t.release_year,
    g.genre,
    COUNT(*) AS genre_count

FROM titles t
LEFT JOIN genres g
    ON t.show_id = g.show_id

GROUP BY
    t.release_year,
    g.genre

ORDER BY
    genre_count DESC