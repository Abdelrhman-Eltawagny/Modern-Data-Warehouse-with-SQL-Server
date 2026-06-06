# Sales Data Warehouse using Medallion Architecture

Welcome to the **Sales Data Warehouse using Medallion Architecture** repository.

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

#### Bronze Layer
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

## Data Flow Diagram
The diagram below illustrates the complete data movement from source systems through the Bronze, Silver, and Gold layers.

<img width="922" height="631" alt="Data Flow" src="https://github.com/user-attachments/assets/8fdc28bb-bce3-4640-9c4d-34c2d4010162" />

## Data Warehouse Data Flow
#### Source Systems
The warehouse consumes data from:

#### 1- CRM System
- Customer Information
- Product Information
- Sales Transactions

#### 2- ERP System
- Customer Master Data
- Location Data
- Product Categories

### Data Movement 
CRM + ERP
    ↓
Bronze Layer
    ↓
Silver Layer
    ↓
Gold Layer


## Dimensional Modeling
The final Gold Layer is designed using a Star Schema.

1- Fact Table
**fact_sales**

Stores transactional sales records.

Measures:
- Sales Amount
- Quantity
- Price

Business Calculation:
Sales Amount = Quantity * Price

2- Dimension Tables
**dim_customer**

Contains customer descriptive attributes:
- Customer ID
- Customer Number
- First Name
- Last Name
- Country
- Gender
- Marital Status

**dim_product**

Contains product descriptive attributes:
- Product ID
- Product Name
- Product Number
- Category
- Subcategory
- Product Line
- Cost
- Country

## Data Model Diagram
<img width="1020" height="701" alt="Data Modeling" src="https://github.com/user-attachments/assets/5c90593a-f716-4b57-97c2-f3b38f2e139c" />

## ETL Process
#### Extract
Data extracted from CRM and ERP source systems.

#### Transform 
Data transformations include:

- Data cleansing
- Type conversions
- Standardization
- Surrogate key generation
- Data quality checks

#### Load
Data loaded into:

- Dimension Tables
- Fact Tables

## Technologies Used
- SQL Server
- T-SQL
- Data Warehouse Design
- Star Schema Modeling
- ETL Development
- Data Quality Validation
- Git
- GitHub

## Project Outcome

Successfully built an end-to-end Data Warehouse solution that:
- Consolidates CRM and ERP data
- Improves data quality
- Provides a unified analytical model
- Supports business intelligence and reporting
- Enables scalable future analytics workloads
