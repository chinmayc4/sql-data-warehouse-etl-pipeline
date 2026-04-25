-- Insert Data to bronze tables

--CRM Tables
--Trunckate table before insert (Full Load)
TRUNCATE TABLE bronze.crm_users;
--Insert data in bronze.crm_users table
BULK INSERT bronze.crm_users
FROM 'C:\Users\squar\Desktop\D\SQL\Dataset\CRM\users.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK 
);

--Trunckate table before insert (Full Load)
TRUNCATE TABLE bronze.crm_user_activity;
--Insert data in bronze.crm_users table
BULK INSERT bronze.crm_user_activity
FROM 'C:\Users\squar\Desktop\D\SQL\Dataset\CRM\user_activity.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK 
);

--ERP Tables
--Trunckate table before insert (Full Load)
TRUNCATE TABLE bronze.erp_fees;
--Insert data in bronze.crm_users table
BULK INSERT bronze.erp_fees
FROM 'C:\Users\squar\Desktop\D\SQL\Dataset\ERP\fees.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK 
);

--Trunckate table before insert (Full Load)
TRUNCATE TABLE bronze.erp_fraud_signals;
--Insert data in bronze.crm_users table
BULK INSERT bronze.erp_fraud_signals
FROM 'C:\Users\squar\Desktop\D\SQL\Dataset\ERP\fraud_signals.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK 
);

--Trunckate table before insert (Full Load)
TRUNCATE TABLE bronze.erp_fraud_signals;
--Insert data in bronze.crm_users table
BULK INSERT bronze.erp_fraud_signals
FROM 'C:\Users\squar\Desktop\D\SQL\Dataset\ERP\fraud_signals.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK 
);

--Trunckate table before insert (Full Load)
TRUNCATE TABLE bronze.erp_merchants;
--Insert data in bronze.crm_users table
BULK INSERT bronze.erp_merchants
FROM 'C:\Users\squar\Desktop\D\SQL\Dataset\ERP\merchants.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK 
);

--Trunckate table before insert (Full Load)
TRUNCATE TABLE bronze.erp_refunds;
--Insert data in bronze.crm_users table
BULK INSERT bronze.erp_refunds
FROM 'C:\Users\squar\Desktop\D\SQL\Dataset\ERP\refunds.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK 
);


--Trunckate table before insert (Full Load)
TRUNCATE TABLE bronze.erp_transactions;
--Insert data in bronze.crm_users table
BULK INSERT bronze.erp_transactions
FROM 'C:\Users\squar\Desktop\D\SQL\Dataset\ERP\transactions.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK 
);

