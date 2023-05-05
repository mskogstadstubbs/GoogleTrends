select
    score,
    rank,
    refresh_date,
    dma_name as designated_market_area,
    dma_id as designated_market_area_id,
    term,
    week

from {{ source('google_trends', 'top_terms') }}