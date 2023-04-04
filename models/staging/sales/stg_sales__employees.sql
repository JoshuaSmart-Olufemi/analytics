with cte as (
    SELECT *
    FROM {{ source('sales', 'employees')}}
)

SELECT * FROM cte 