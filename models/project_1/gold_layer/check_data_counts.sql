{{ config(materialized='table') }}

-- Model: check_data_counts
-- Purpose: Quick validation check to confirm seed tables loaded correctly

with table_counts as (
    select 'customers' as table_name, count(*) as record_count from {{ref('bronze_customers')}}
    union all
    select 'products'  as table_name, count(*) as record_count from {{ref('bronze_products')}}
    union all
    select 'orders'  as table_name, count(*) as record_count from {{ref('bronze_orders')}} 
    union all
    select 'order_items'  as table_name, count(*) as record_count from {{ref('bronze_order_items')}}
)

select * from table_counts
order by table_name
