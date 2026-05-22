SELECT

    g.genre,
    COUNT(DISTINCT t.show_id) AS total_titles

FROM {{ ref('fct_netflix_title') }} t
LEFT JOIN {{ ref('dim_genre') }} g
    ON t.show_id = g.show_id

GROUP BY
    g.genre

ORDER BY
    total_titles DESC