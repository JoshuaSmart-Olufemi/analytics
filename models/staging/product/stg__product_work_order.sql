with cte as (
    SELECT *
    FROM {{ source('sales', 'work_order')}}
)

SELECT * FROM cte 