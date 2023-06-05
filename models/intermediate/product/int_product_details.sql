with cte as (
    SELECT
    d.product_id
    , d.product_name
    , d.color
    , d.standard_cost
    , d.list_price
    , d.days_to_manufacture
    , wo.order_qty
    , wo.stocked_qty
    , wo.scrapped_qty
    , wo.start_date :: date 
    , wo.end_date
    , wo.due_date
    , wor.scheduled_start_date
    , wor.scheduled_end_date
    , wor.actual_start_date
    , wor.actual_end_date
    , wor.actual_resource_hrs
    , wor.planned_cost
    , wor.actual_cost
    FROM {{ ref("stg__product_details")}} as d 
    LEFT JOIN {{ ref("stg__product_work_order")}} as wo
    ON d.product_id = wo.product_id 
    INNER JOIN {{ ref("stg__product_work_order_routing")}} as wor 
    ON d.product_id = wor.product_id 
    
)

SELECT * FROM cte 