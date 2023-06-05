with cte as (
    SELECT *
    FROM {{ source('sales', 'order_details')}}
)

SELECT * FROM cte 