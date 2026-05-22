SELECT
    rating,
    COUNT(*)        AS total_titles

FROM {{ ref('staging_netflix_titles') }}

WHERE rating != 'Unrated'

GROUP BY rating
HAVING COUNT(*) > 5
ORDER BY total_titles DESC
