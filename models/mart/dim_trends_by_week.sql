with international_top_terms as (
    SELECT 
        term,
        week,
        score,
        rank,
        country_name

    FROM {{ ref('stg_intl_top_terms') }}
), 

usa_top_terms as (

    SELECT 
        score as usa_score,
        rank as usa_rank,
        term as usa_term,
        week
    FROM {{ ref('stg_top_terms') }}
),

joined_top_terms as (
    SELECT * 
    FROM international_top_terms 
    JOIN usa_top_terms using (week)
),

final as (
    SELECT 
        *
    FROM 
        joined_top_terms
    GROUP BY 
        week
    ORDER BY 
        week, rank 
    LIMIT 100
)

SELECT * FROM final
