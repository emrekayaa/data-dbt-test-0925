WITH orders_per_day AS (
    select
        date_date,
        count(distinct orders_id) as nb_transactions,
        ROUND(sum(revenue),0) as revenue,
        ROUND(sum(Margin),0) as Margin,
        ROUND(sum(operational_margin),0) as operational_margin
		,ROUND(SUM(purchase_cost),0) AS purchase_cost
		,ROUND(SUM(shipping_fee),0) AS shipping_fee
		,ROUND(SUM(logCost),0) AS logCost
		,ROUND(SUM(ship_cost),0) AS ship_cost
		,SUM(quantity) AS quantity
	FROM {{ref("int_orders_operational")}}
	GROUP BY date_date
)
SELECT
date_date
, revenue
, margin
, operational_margin
, purchase_cost
, shipping_fee
, logCost
, ship_cost
, quantity
, ROUND(revenue/NULLIF(nb_transactions, 0), 2) AS average_basket
FROM orders_per_day
ORDER BY date_date DESC