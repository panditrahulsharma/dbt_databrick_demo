select * from {{ source('bronze_database', 'order_items') }}
