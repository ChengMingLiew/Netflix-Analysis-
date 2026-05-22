SELECT
    t.release_year,
    g.genre,

    COUNT(DISTINCT t.show_id) AS total_titles

FROM {{ ref('fct_netflix_title') }} t
LEFT JOIN {{ ref('dim_genre') }} g
    ON t.show_id = g.show_id

WHERE g.genre IS NOT NULL

GROUP BY
    t.release_year,
    g.genre

ORDER BY
    t.release_year,
    total_titles DESC