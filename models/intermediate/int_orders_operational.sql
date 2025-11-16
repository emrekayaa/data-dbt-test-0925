select
    o.orders_id,
    o.date_date,
    ROUND(o.Margin + s.shipping_fee -(s.logCost + s.ship_cost),2) as operational_margin,
    o.quantity,
	o.revenue,
	o.purchase_cost,
	o.margin,
	s.shipping_fee,
	s.logCost,
	s.ship_cost
from {{ref("int_orders_margin")}} as o
left join {{ref("stg_raw__ship")}} as s
on o.orders_id=s.orders_id
ORDER BY orders_id desc
