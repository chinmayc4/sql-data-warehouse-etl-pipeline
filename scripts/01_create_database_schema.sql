/*
===============================================================================
File Name   : 01_create_datawarehouse.sql
Author      : Chinmay Pisu
Created Date: 2026-04-25
Description : 
    This script creates the DataWarehouse database and initializes 
    Bronze, Silver, and Gold schemas following Medallion Architecture.

Usage:
    - Run in SQL Server (SSMS / Azure Data Studio)
    - Safe to re-run (idempotent)

===============================================================================
*/

-- =============================================
-- STEP 1: Create Database (Idempotent)
-- =============================================
IF NOT EXISTS (
    SELECT 1 
    FROM sys.databases 
    WHERE name = 'DataWarehouse'
)
BEGIN
    CREATE DATABASE DataWarehouse;
    PRINT 'Database DataWarehouse created successfully.';
END
ELSE
BEGIN
    PRINT 'Database DataWarehouse already exists.';
END
GO

-- =============================================
-- STEP 2: Switch Context
-- =============================================
USE DataWarehouse;
GO

-- =============================================
-- STEP 3: Create Schemas (Idempotent)
-- =============================================

-- Bronze Layer (Raw Data)
IF NOT EXISTS (
    SELECT 1 
    FROM sys.schemas 
    WHERE name = 'bronze'
)
BEGIN
    EXEC('CREATE SCHEMA bronze');
    PRINT 'Schema bronze created.';
END
ELSE
BEGIN
    PRINT 'Schema bronze already exists.';
END
GO

-- Silver Layer (Cleaned Data)
IF NOT EXISTS (
    SELECT 1 
    FROM sys.schemas 
    WHERE name = 'silver'
)
BEGIN
    EXEC('CREATE SCHEMA silver');
    PRINT 'Schema silver created.';
END
ELSE
BEGIN
    PRINT 'Schema silver already exists.';
END
GO

-- Gold Layer (Business Ready Data)
IF NOT EXISTS (
    SELECT 1 
    FROM sys.schemas 
    WHERE name = 'gold'
)
BEGIN
    EXEC('CREATE SCHEMA gold');
    PRINT 'Schema gold created.';
END
ELSE
BEGIN
    PRINT 'Schema gold already exists.';
END
GO

-- =============================================
-- END OF SCRIPT
-- =============================================
PRINT 'Data Warehouse setup completed successfully.';
