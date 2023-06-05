with base_cte as (

    SELECT * FROM {{ ref("int_product_details") }}
)

SELECT 
COUNT(order_qty) AS count_order_qty
, date_trunc('day', start_date) as date_per_day
FROM base_cte
GROUP BY 2
ORDER BY 2 ASC