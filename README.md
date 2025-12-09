## Github links
https://medium.com/@reshma.varghese.tech/how-i-built-a-mini-data-pipeline-using-dbt-sqlite-e3692288f974

https://medium.com/dbsql-sme-engineering/how-to-build-an-end-to-end-testing-pipeline-with-dbt-on-databricks-cb6e179e646c

## Course Guide
https://www.udemy.com/course/dbt-on-databricks/?couponCode=IND21PM

## DBT INSTALLATION GUIDE
>>> python3 -m pip install dbt-core==1.8 dbt-databricks

-- confirm the installation
>>> dbt --version 

---INITIALIZING DBT PROJECT
>>> dbt init

--- change the profiles.yml file location delete it from your installed location and created files under your project directory 

>>> cat /Users/abc/.dbt/profiles.yml >> ./profiles.yml 
>>> rm -rf /Users/abc/.dbt/profiles.yml

--- now test the connection and files 
>>> dbt debug

--- Load Data into Databricks Table
>>> dbt seed


## write steps which is p1
exm:
     test cases
     description of table     
     genric test case
     how to deploy
     multiple archeticture meddalian
     increamental and snapshot 
     multi env files or profiles
     schema description: https://github.com/reshmavarghese15/data-pipeline-dbt-aws-demo/blob/main/data_pipeline_dbt_aws_demo/models/example/schema.yml
     freshness check
     quality check
     ci.cd pipeline