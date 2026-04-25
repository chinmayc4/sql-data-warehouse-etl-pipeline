/*
===============================================================================
File Name   : gold.revenue_summary.sql
Project     : DataWarehouse - Gold Layer (Aggregate View)
Author      : Chinmay Pisu

Description : 
    This script creates the Gold layer aggregate view 'gold.revenue_summary',
    which provides a daily summary of transaction and revenue metrics for
    business reporting and analytics.

    Purpose:
        - Deliver pre-aggregated KPIs at daily granularity
        - Enable quick reporting on revenue, transactions, and refunds
        - Serve as a source for dashboards and executive insights

    Data Source:
        - gold.fact_transactions

    Key Transformations:
        - Aggregates transactional data at date level
        - Computes key business metrics:
            * total_transactions
            * gross_revenue
            * total_fees
            * total_refunds
            * net_revenue
        - Derives operational KPIs:
            * successful_txns
            * refunded_txns

    Output Columns:
        - txn_date (daily granularity)
        - total_transactions
        - gross_revenue
        - total_fees
        - total_refunds
        - net_revenue
        - successful_txns
        - refunded_txns

    Use Cases:
        - Daily revenue tracking
        - Financial performance monitoring
        - Refund and failure rate analysis
        - Dashboarding (Power BI, Tableau)
        - Executive reporting

Notes:
        - This is a view (not a physical table), ensuring real-time aggregation
        - Assumes fact_transactions contains cleaned and validated data
        - Can be extended with additional KPIs (AOV, success rate, etc.)

Dependencies:
        - gold.fact_transactions must be available

Usage:
        SELECT * FROM gold.revenue_summary;

===============================================================================
*/

CREATE OR ALTER VIEW gold.revenue_summary
AS
SELECT
    CAST(txn_date AS DATE) AS txn_date,
    COUNT(*) AS total_transactions,
    SUM(amount) AS gross_revenue,
    SUM(total_fee) AS total_fees,
    SUM(refund_amount) AS total_refunds,
    SUM(net_amount) AS net_revenue,
    SUM(is_success) AS successful_txns,
    SUM(is_refunded) AS refunded_txns
FROM gold.fact_transactions
GROUP BY CAST(txn_date AS DATE);
