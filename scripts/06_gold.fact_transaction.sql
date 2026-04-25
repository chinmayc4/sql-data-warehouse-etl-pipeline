CREATE VIEW gold.fact_transactions
AS
SELECT
    t.txn_id,
    t.user_id,
    t.merchant_id,
    t.txn_date,
    t.amount,
    ISNULL(f.total_fee, 0) AS total_fee,
    ISNULL(r.refund_amount, 0) AS refund_amount,    
    t.amount - ISNULL(r.refund_amount, 0) AS net_amount,
    t.status,
    t.fraud_flag,
    CASE WHEN r.refund_id IS NOT NULL THEN 1 ELSE 0 END AS is_refunded,
    CASE WHEN t.status = 'success' THEN 1 ELSE 0 END AS is_success,
    ISNULL(fs.risk_score, 0) AS risk_score
FROM silver.erp_transactions t
LEFT JOIN silver.erp_fees f
    ON t.txn_id = f.txn_id
LEFT JOIN silver.erp_refunds r
    ON t.txn_id = r.txn_id
LEFT JOIN silver.erp_fraud_signals fs
    ON t.txn_id = fs.txn_id;
