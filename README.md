# Bank-Transactions-Fraud-Detection
**Tools:** SQL | Power BI | Excel  
**Domain:** Financial Services | Fraud Operations

## Business Problem
Financial institutions need exception reporting pipelines to flag 
anomalous transactions and surface fraud patterns at scale. This 
project replicates that workflow end to end.

## Dataset
50,000 bank transactions including TransactionID, AccountID, 
TransactionAmount, TransactionDate, TransactionType, LoginAttempts, 
and AccountBalance.

## Key Findings
- **4,158 fraud transactions at midnight** — automated bot activity 
  targeting off-hours monitoring gaps
- **Card testing detected** — $0.26 charged 12 times to one account, 
  a classic low-value probe attack
- **Top flagged account** — 249 transactions totaling $103K, 
  a potential money laundering case
- **Fraudsters transact 3x higher** — avg fraud amount $772 vs 
  $252 legitimate
