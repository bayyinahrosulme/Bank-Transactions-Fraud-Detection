CREATE TABLE transactions (
    TransactionID VARCHAR(50),
    AccountID VARCHAR(50),
    TransactionAmount NUMERIC(10,2),
    TransactionDate TIMESTAMP,
    TransactionType VARCHAR(50),
    Location VARCHAR(100),
    DeviceID VARCHAR(50),
    IPAddress VARCHAR(50),
    MerchantID VARCHAR(50),
    Channel VARCHAR(50),
    CustomerAge INT,
    CustomerOccupation VARCHAR(100),
    TransactionDuration INT,
    LoginAttempts INT,
    AccountBalance NUMERIC(10,2),
    Is_fraud INT
);

SELECT table_name 
FROM information_schema.tables 
WHERE table_schema = 'public';

DROP TABLE IF EXISTS transactions;


CREATE TABLE transactions (
    TransactionID VARCHAR(50),
    AccountID VARCHAR(50),
    TransactionAmount NUMERIC(10,2),
    TransactionDate TIMESTAMP,
    TransactionType VARCHAR(50),
    "Location" VARCHAR(100),
    DeviceID VARCHAR(50),
    IPAddress VARCHAR(50),
    MerchantID VARCHAR(50),
    Channel VARCHAR(50),
    CustomerAge INT,
    CustomerOccupation VARCHAR(100),
    TransactionDuration INT,
    LoginAttempts INT,
    AccountBalance NUMERIC(10,2),
    is_fraud INT
);


DROP TABLE IF EXISTS transactions;


CREATE TABLE transactions (
    TransactionID VARCHAR(50),
    AccountID VARCHAR(50),
    TransactionAmount NUMERIC(10,2),
    TransactionDate TIMESTAMP,
    TransactionType VARCHAR(50),
    "Location" VARCHAR(100),
    DeviceID VARCHAR(50),
    IPAddress VARCHAR(50),
    MerchantID VARCHAR(50),
    Channel VARCHAR(50),
    CustomerAge INT,
    CustomerOccupation VARCHAR(100),
    TransactionDuration INT,
    LoginAttempts INT,
    AccountBalance NUMERIC(10,2),
    Is_fraud INT
);


SELECT COUNT(*) FROM transactions;
SELECT * FROM transactions LIMIT 5;


-----Fraud Rate by Transaction Type----

SELECT transactiontype,
COUNT(*) AS total_transactions,
SUM(is_fraud) AS fraud_count,
ROUND(SUM(is_fraud) * 100.0 / COUNT(*), 2) AS fraud_rate_pct
FROM transactions
GROUP BY transactiontype
ORDER BY fraud_rate_pct DESC;



----High-Frequency Account Detection----
SELECT accountid,
COUNT(*) AS transaction_count,
SUM(transactionamount) AS total_amount
FROM transactions
GROUP BY accountid
HAVING COUNT(*) > 10
ORDER BY transaction_count DESC;


-----Off-Hours Transaction Analysis---

SELECT *
FROM transactions
WHERE EXTRACT(HOUR FROM transactiondate) NOT BETWEEN 6 AND 22
AND is_fraud = 1
ORDER BY transactiondate;
-----what hours the fraud is actually clustering at---
SELECT EXTRACT(HOUR FROM transactiondate) AS hour_of_day,
COUNT(*) AS fraud_count
FROM transactions
WHERE is_fraud = 1
GROUP BY hour_of_day
ORDER BY fraud_count DESC;


-----Duplicate / Near-Duplicate Detection----

SELECT accountid, transactionamount,
COUNT(*) AS duplicate_count,
MIN(transactiondate) AS first_occurrence,
MAX(transactiondate) AS last_occurrence
FROM transactions
GROUP BY accountid, transactionamount
HAVING COUNT(*) > 1
ORDER BY duplicate_count DESC;


----Fraud Summary by Month---
SELECT DATE_TRUNC('month', transactiondate) AS month,
COUNT(*) AS total_transactions,
SUM(is_fraud) AS fraud_cases,
ROUND(SUM(is_fraud) * 100.0 / COUNT(*), 2) AS fraud_rate_pct
FROM transactions
GROUP BY month
ORDER BY month;


