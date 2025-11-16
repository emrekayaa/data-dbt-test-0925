select
    orders_id,
    date_date,
    SUM(ROUND(revenue,2)) as revenue,
    SUM(ROUND(quantity,2)) as quantity,
    SUM(ROUND(purchase_cost,2)) as purchase_cost,
    SUM(ROUND(Margin,2)) as Margin
from {{ref("int_sales_margin")}}
group by 
    orders_id,
    date_date
order by orders_id desc