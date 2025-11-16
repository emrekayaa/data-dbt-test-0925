
select
    orders_id,
    logCost,
    cast(shipping_fee as float64) as shipping_fee,
    cast(ship_cost as float64) as ship_cost
from {{ source('raw', 'ship') }}