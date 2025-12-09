
{{ config(materialized='table') }}

with order_details as (
    select
        o.order_id,
        o.customer_id,
        c.name as customer_name,
        p.product_id,
        p.name as product_name,
        p.category,
        p.price,
        oi.quantity,
        (p.price * oi.quantity) as total_amount,
        o.order_date
    from {{ source('bronze_database', 'orders') }} o
    join {{ source('bronze_database', 'order_items') }} oi on o.order_id = oi.order_id
    join {{ source('bronze_database', 'products') }} p on oi.product_id = p.product_id
    join {{ source('bronze_database', 'customers') }} c on o.customer_id = c.customer_id
)

select *
from order_details
