WITH exploded AS (
    SELECT
        show_id,
        TRIM(actor.value)  AS actor
    FROM {{ ref('staging_netflix_titles') }}
    LATERAL VIEW EXPLODE(SPLIT(actors, ',')) actor AS value
    WHERE actors IS NOT NULL        
)

SELECT
    {{ dbt_utils.generate_surrogate_key(['show_id', 'actor']) }}  AS actor_key,
    show_id,
    actor

FROM exploded
WHERE actor IS NOT NULL
ORDER BY show_id