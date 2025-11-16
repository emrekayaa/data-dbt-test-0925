{{ config(materialized='view') }}

select
    products_id,
    cast(purchse_price as float64) as purchase_price,
from {{ source('raw', 'product') }}