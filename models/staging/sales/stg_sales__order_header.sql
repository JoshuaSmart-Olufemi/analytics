with cte as (
    SELECT *
    FROM {{ source('sales', 'order_header')}} as J
)

SELECT * FROM cte 