SELECT
    t.release_year,
    c.cast_member,

    COUNT(DISTINCT t.show_id) AS total_titles

FROM {{ ref('fct_netflix_title') }} t
LEFT JOIN {{ ref('dim_casts') }} c
    ON t.show_id = c.show_id

GROUP BY
    t.release_year,
    c.cast_member

ORDER BY
    t.release_year,
    total_titles DESC