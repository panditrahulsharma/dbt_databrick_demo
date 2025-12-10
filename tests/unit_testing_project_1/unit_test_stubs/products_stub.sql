select * from {{ source('bronze_database', 'products') }}
