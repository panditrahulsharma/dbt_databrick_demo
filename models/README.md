## Features
    1. Multi Environment Support
    2. ci/cd pipeline support
    3. Load Data from External source 
    4. Gold Layer for Business

## 🚀 Project Overview
![Alt text](./images/lineage1.png)

```
The project simulates a small e-commerce dataset:

Customers
Orders
Products
Order items
It demonstrates:

🗂 dbt seed → Load CSV files into SQLite
🧮 SQL transformations → Stage, join, aggregate
🧪 Data tests → Record counts and validation
📊 Analytics outputs → Customer-level summaries
⚙️ Modular model design → Reusable SQL
🔄 CI-ready structure → dbt run, dbt ls, dbt test

```

## 🧩 Architecture / Data Flow

    CSV Seeds → dbt seed → Transform Models → Summary Models → Outputs


## 📁 Project Structure
    dbt_databrick_demo/
    │
    ├── seeds/
    │   ├── customers.csv
    │   ├── products.csv
    │   ├── orders.csv
    │   └── order_items.csv
    │
    ├── models/
    │   └── example/
    │       ├── my_orders_summary.sql
    │       ├── customer_sales_summary.sql
    │       └── check_data_counts.sql
    │
    ├── dbt_project.yml
    └── README.md

## Commands
    >>> source .env
    >>> dbt seed (first time create table)
    for production
    >>> dbt seed --target project1_prod  # first time only

    >>> dbt test
    
    >>> dbt run --select project_1 (run project_1)

    >>> dbt run --select project_1 --target project1_prod

    >>> dbt run -m daily_orders_increamental --full-refresh #first time run full refresh

    >>> dbt run -m daily_orders_increamental

    -- Insert some records in bronze_orders table and then again verify the data

    >>> dbt run -m daily_orders_increamental




## Increamental Model Validation
```sql
-- Step 1: Check existing records in the orders table
SELECT * FROM unified_data_platform.landing.orders;

-- Current Data:
-- order_id | customer_id | order_date
--    1     |      1      | 2024-04-01
--    2     |      2      | 2024-04-03
--    3     |      1      | 2024-04-04

! dbt run -m daily_orders_increamental

-- Step 2: Validate existing records in the incremental table
-- (daily_orders_increamental)
-- order_id | customer_id | order_date    | _source_created_at
--    2     |      2      | 2024-04-03    | 2025-12-11T08:27:12.809+00:00
--    3     |      1      | 2024-04-04    | 2025-12-11T08:27:12.809+00:00
--    1     |      1      | 2024-04-01    | 2025-12-11T08:27:12.809+00:00


-- Step 3: Insert a new record into the orders table
INSERT INTO unified_data_platform.landing.orders (order_id, customer_id, order_date)
VALUES (4, 1, '2024-04-05');

-- Verify the updated source table
SELECT * FROM unified_data_platform.landing.orders;

-- order_id | customer_id | order_date
--    1     |      1      | 2024-04-01
--    2     |      2      | 2024-04-03
--    3     |      1      | 2024-04-04
--    4     |      1      | 2024-04-05


-- Step 4: Run the incremental model
! dbt run -m daily_orders_increamental


-- Step 5: Validate the results in the incremental table
SELECT * FROM unified_data_platform.landing.orders;

-- order_id | customer_id | order_date    | _source_created_at
--    1     |      1      | 2024-04-01    | 2025-12-11T08:27:12.809+00:00
--    2     |      2      | 2024-04-03    | 2025-12-11T08:27:12.809+00:00
--    3     |      1      | 2024-04-04    | 2025-12-11T08:27:12.809+00:00
--    4     |      1      | 2024-04-05    | 2025-12-11T08:32:50.294+00:00
```
