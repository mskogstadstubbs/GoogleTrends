select
    region_name,
    term,
    week,
    score,
    rank,
    refresh_date,
    country_name,
    country_code,
    region_code

from {{ source('google_trends','international_top_terms') }}