SELECT

    c.cast_member,
    COUNT(DISTINCT t.show_id) AS total_titles

FROM {{ ref('fct_netflix_title') }} t
LEFT JOIN {{ ref('dim_casts') }} c
    ON t.show_id = c.show_id

WHERE c.cast_member != 'Unknown'

GROUP BY
    c.cast_member

ORDER BY
    total_titles DESC

LIMIT 20