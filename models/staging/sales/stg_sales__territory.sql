with cte as (
    SELECT *
    FROM {{ source('sales', 'territory')}} as th
)

SELECT * FROM cte 