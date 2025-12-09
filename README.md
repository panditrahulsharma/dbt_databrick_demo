# DBT Setup & Resources

## 📚 Helpful Articles

* [https://medium.com/@reshma.varghese.tech/how-i-built-a-mini-data-pipeline-using-dbt-sqlite-e3692288f974](https://medium.com/@reshma.varghese.tech/how-i-built-a-mini-data-pipeline-using-dbt-sqlite-e3692288f974)
* [https://medium.com/dbsql-sme-engineering/how-to-build-an-end-to-end-testing-pipeline-with-dbt-on-databricks-cb6e179e646c](https://medium.com/dbsql-sme-engineering/how-to-build-an-end-to-end-testing-pipeline-with-dbt-on-databricks-cb6e179e646c)

## 🎓 Course Guide

* [https://www.udemy.com/course/dbt-on-databricks/?couponCode=IND21PM](https://www.udemy.com/course/dbt-on-databricks/?couponCode=IND21PM)

---

## 🛠️ DBT Installation Guide

### Install DBT (Core + Databricks Adapter)

```bash
python3 -m pip install dbt-core==1.8 dbt-databricks
```

### Confirm Installation

```bash
dbt --version
```

---

## 🚀 Initialize a New DBT Project

```bash
dbt init
```

## Update `profiles.yml` Location

Move the auto-generated profile into your project directory:

```bash
cat /Users/abc/.dbt/profiles.yml >> ./profiles.yml
rm -rf /Users/abc/.dbt/profiles.yml
```

---

## 🔧 Test DBT Setup

```bash
dbt debug
```

## 📥 Load Seed Data into Databricks

```bash
dbt seed
```

## 🏆 Run Gold Layer Models

```bash
dbt run --select project_1
```

## 📘 DBT Documentation Site

```bash
dbt docs generate
dbt docs serve
```

---

## 📌 Project Phase 1 (P1) Required Steps

A strong DBT project should include the following:

* **Test Cases** (generic + custom + unit testing)
* **column level tagging and discription**
* **freshness test**
* **Table Descriptions & Documentation**
* **Generic Test Cases** (unique, not null, relationships, accepted values)
* **Deployment Steps** (Dev → QA → Prod)
* **Multiple Architecture Patterns** (Medallion architecture: Bronze → Silver → Gold)
* **Incremental Models & Snapshots**
* **Multi‑environment Profiles (`profiles.yml`)**
* **Schema Documentation Example:**
  [https://github.com/reshmavarghese15/data-pipeline-dbt-aws-demo/blob/main/data_pipeline_dbt_aws_demo/models/example/schema.yml](https://github.com/reshmavarghese15/data-pipeline-dbt-aws-demo/blob/main/data_pipeline_dbt_aws_demo/models/example/schema.yml)
* **Freshness Checks** (`sources:` with `freshness:` block)
* **Data Quality Checks**
* **CI/CD Pipeline Setup** (GitHub Actions / Azure DevOps / GitLab CI)

---
