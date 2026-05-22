WITH exploded AS (
    SELECT
        show_id,
        TRIM(UNNEST(STRING_TO_ARRAY(casts, ','))) AS cast_member
    FROM {{ ref('staging_netflix_titles') }}
    WHERE casts IS NOT NULL
)

SELECT
    {{ dbt_utils.generate_surrogate_key(['show_id', 'cast_member']) }}  AS cast_key,
    show_id,
    cast_member

FROM exploded
WHERE cast_member IS NOT NULL
ORDER BY show_id