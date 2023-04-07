with cte as (
    SELECT 
    od.sales_order_id
    , od.order_qty
    , od.product_id
    , od.unit_price
    , od.line_total as revenue
    , oh.order_date
    , oh.due_date
    , oh.ship_date
    , case when oh.order_status = 1 then  'in process'
           when oh.order_status = 2 then  'approved'
           when oh.order_status = 3 then  'backordered' 
           when oh.order_status = 4 then   'rejected' 
           when oh.order_status = 5 then   'shipped' 
           else 'cancelled'
           end as order_status
    , case when oh.online_order_flag = 0 then 'reseller' else 'online' end as sales_channel
    , oh.customer_id
    , oh.territory_id
    , case when s.country = 'Southeast' then 'United States of America'
           when s.country = 'Southwest' then 'United States of America'
           when s.country = 'Central' then 'United States of America'
           when s.country = 'Northwest' then 'United States of America'
           when s.country = 'Northeast' then 'United States of America'
           when s.country = 'France' then 'France'
           when s.country = 'Canada' then 'Canada'
           when s.country = 'Germany' then 'Germany'
           when s.country = 'Australia' then 'Australia'
           else 'United Kingdom'
           end as country 
    , s.region
    , s.sales_year_to_day
    , s.sales_last_year
    FROM {{ ref("stg_sales__order_detail")}} as od 
    LEFT JOIN {{ ref("stg_sales__order_header")}} as oh 
    ON oh.sales_order_id = od.sales_order_id 
    LEFT JOIN {{ ref("stg_sales__territory")}} as s
    ON oh.territory_id = s.territory_id 
)

SELECT * FROM cte