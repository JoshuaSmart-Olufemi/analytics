with cte as (
    SELECT *
    FROM {{ source('sales', 'product_work_order_routing')}}
)

SELECT * FROM cte 