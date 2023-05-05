select
    score,
    rank,
    refresh_date,
    dma_name,
    dma_id,
    term,
    week

from {{ source('google_trends', 'top_terms') }}