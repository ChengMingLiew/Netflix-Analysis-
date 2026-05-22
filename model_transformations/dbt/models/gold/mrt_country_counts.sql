WITH countries AS (
    SELECT
        TRIM(UNNEST(STRING_TO_ARRAY(country, ',')))    AS country_name

    FROM {{ ref('staging_netflix_titles') }}
    WHERE country != 'Unknown'
)

SELECT
    country_name,
    COUNT(*)                                           AS total_titles

FROM countries

GROUP BY country_name
ORDER BY total_titles DESC

LIMIT 20