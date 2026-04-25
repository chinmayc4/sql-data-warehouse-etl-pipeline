# Data Warehouse ETL Project (SQL Server)

## Overview
This project implements an end-to-end Data Warehouse ETL pipeline using SQL Server, following the Medallion Architecture (Bronze, Silver, Gold). It processes data from CRM and ERP systems and transforms it into analytics-ready datasets.

## Architecture
Bronze Layer:
- Raw data ingestion using BULK INSERT from CSV files
- No transformations, acts as source of truth

Silver Layer:
- Data cleaning and standardization (TRIM, LOWER, UPPER)
- Deduplication using ROW_NUMBER()
- Data type casting using TRY_CONVERT
- Data validation and business rule enforcement

Gold Layer:
- Planned for analytics and reporting

## ETL Pipeline
Bronze Load:
- Full load using TRUNCATE + BULK INSERT

Silver Load:
- Data cleaning, transformation, and validation
- Joins across CRM and ERP datasets
- Removal of duplicates and invalid records

## Project Structure
sql-data-warehouse/
├── bronze/
│   ├── bronze_tables.sql
│   └── load_bronze.sql

├── silver/
│   ├── silver_tables.sql
│   └── load_silver.sql

├── datasets/
│   ├── CRM/
│   └── ERP/
└── README.md

## Tech Stack
- SQL Server
- T-SQL
- BULK INSERT
- Stored Procedures

## Key Features
- Layered architecture (Bronze, Silver)
- Bulk data ingestion
- Data cleaning and transformation
- Deduplication using window functions
- Data validation
- Stored procedure-based ETL
- Basic logging and error handling

## How to Run
1. Create database and schemas:
   CREATE DATABASE DataWarehouse;
   CREATE SCHEMA bronze;
   CREATE SCHEMA silver;

2. Run table creation scripts for Bronze and Silver

3. Execute ETL:
   EXEC bronze.load_bronze;
   EXEC silver.load_silver;

## Data Sources
CRM:
- Users
- User Activity

ERP:
- Transactions
- Fees
- Merchants
- Refunds
- Fraud Signals

## Notes
- Uses full load strategy (TRUNCATE + INSERT)
- File paths are local and should be updated for production
- Gold layer not yet implemented

## Author
Chinmay Pisu
