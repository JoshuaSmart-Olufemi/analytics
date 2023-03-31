with cte as (
    SELECT *
    FROM {{ source('sales', 'territory')}}
)

SELECT * FROM cte 