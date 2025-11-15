
select
    s.orders_id,
    s.date_date,
    s.products_id,
    s.revenue,
    s.quantity,
    p.purchase_price,
    -- Satın alma maliyeti hesaplama kodu
    ROUND(s.quantity * purchase_price,2) as purchase_cost,
    --Margin hesaplama kodu
    ROUND(s.revenue - (s.quantity * purchase_price),2) as Margin
from {{ ref("stg_raw__sales")}} as s
left join {{ref("stg_raw__product")}} as p
on s.products_id = p.products_id