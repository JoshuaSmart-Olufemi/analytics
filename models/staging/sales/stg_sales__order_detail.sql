with cte as (
    SELECT *
    FROM {{ source('sales', 'order_detail')}}
)

SELECT * FROM cte 