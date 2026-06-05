# Modern-Data-Warehouse-with-SQL-Server

Welcome to the **Modern-Data-Warehouse-with-SQL-Server** repository
This project demonstrates the implementation of a modern Data Warehouse using SQL Server and the Medallion Architecture approach. Data from CRM and ERP systems is ingested into the Bronze Layer, transformed and validated in the Silver Layer, and prepared for reporting and analytics in the Gold Layer.

The project includes:
- **Data Quality Checks**
- **Data Cleansing & Standardization**
- **ETL Stored Procedures**
- **Incremental Data Processing**
- **Dimensional Data Modeling**
- **Reporting-Ready Data Structures**

The objective is to build a scalable, maintainable, and analytics-ready data platform following industry best practices.

## Architecture
<img width="967" height="578" alt="image" src="https://github.com/user-attachments/assets/39b52d02-6a93-4456-a123-221600d5d158" />

The warehouse is organized into three layers:

## Bronze Layer
Raw data ingestion layer.
This layer stores source system data exactly as received from CRM and ERP systems without any business transformations.

#### Source Tables

1- CRM
- crm_sales_details
- crm_cust_info
- crm_prd_info

2- ERP
- erp_cust_az12
- erp_loc_a101
- erp_px_cat_g1v2
- Silver Layer

Cleansed and standardized data layer.

Activities performed:
- Data cleaning
- Null handling
- Standardization
- Deduplication
- Data quality validation
- Business rule implementation

#### Gold Layer
Business presentation layer.
Contains dimensional models used for reporting and analytics.

Tables:
- fact_sales
- dim_customer
- dim_product
