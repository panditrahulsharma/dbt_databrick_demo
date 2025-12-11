{# https://docs.getdbt.com/docs/build/incremental-models #}
{# https://docs.getdbt.com/reference/resource-configs/databricks-configs#partition_by #}
select  *,
    current_timestamp() as _source_created_at
    
from {{ref('bronze_orders')}} 

{% if is_incremental() %}

where order_date > (select max(order_date) from {{ this }})

{% endif %}