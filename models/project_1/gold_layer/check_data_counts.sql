{{ config(materialized='table') }}

-- Model: check_data_counts
-- Purpose: Quick validation check to confirm seed tables loaded correctly

with table_counts as (
    select 'customers' as table_name, count(*) as record_count from {{ source('bronze_database', 'customers') }}
    union all
    select 'products', count(*) from {{ source('bronze_database', 'products') }}
    union all
    select 'orders', count(*) from {{ source('bronze_database', 'orders') }}
    union all
    select 'order_items', count(*) from {{ source('bronze_database', 'order_items') }}
)

select * from table_counts
order by table_name;
