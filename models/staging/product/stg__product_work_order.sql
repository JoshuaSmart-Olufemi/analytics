with cte as (
    SELECT *
    FROM {{ source('sales', 'product_work_order')}}
)

SELECT * FROM cte 