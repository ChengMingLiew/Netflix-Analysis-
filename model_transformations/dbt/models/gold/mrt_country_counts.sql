SELECT

    country,
    COUNT(DISTINCT show_id) AS total_titles

FROM {{ ref('fct_netflix_title') }}

GROUP BY
    country

ORDER BY
    total_titles DESC