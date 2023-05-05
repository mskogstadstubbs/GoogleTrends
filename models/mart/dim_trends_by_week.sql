with international_top_terms as (
    SELECT 
        term,
        week,
        rank,
        country_name

    FROM {{ ref('stg_intl_top_terms') }}
    GROUP BY week, rank, term, country_name
), 

usa_top_terms as (

    SELECT 
        rank as usa_rank,
        term as usa_term,
        distinct week
    FROM {{ ref('stg_top_terms') }}
    GROUP BY week, rank, term
),

joined_top_terms as (
    SELECT *
    FROM international_top_terms 
    JOIN usa_top_terms using (week)
    LIMIT 100
)

select DISTINCT * from joined_top_terms
ORDER BY week, rank, usa_rank
