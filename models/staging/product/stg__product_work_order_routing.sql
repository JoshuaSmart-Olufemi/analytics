with cte as (
    SELECT *
    FROM {{ source('sales', 'work_order_routing')}}
)

SELECT * FROM cte 