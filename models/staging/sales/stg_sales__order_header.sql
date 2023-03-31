with cte as (
    SELECT *
    FROM {{ source('sales', 'order_header')}}
)

SELECT * FROM cte 