with cte as (
    SELECT *
    FROM {{ source('sales', 'product_details')}}
)

SELECT * FROM cte 