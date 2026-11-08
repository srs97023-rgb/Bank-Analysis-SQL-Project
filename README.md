# Bank Analysis – SQL Project

SQL analysis of bank loan data using **MySQL**. The project answers 18 business questions about loan amounts, collections, interest, loan status, borrower age groups, loan terms and verification status.

## Project Files

| File | Description |
|---|---|
| `sql/bank_analytics_database_backup.sql` | MySQL dump of the `bank_data_analytics` database (table `bank data analytics`) |
| `sql/bank_data_analysis.sql` | 18 business questions answered with SQL queries |

## Tools Used
- MySQL 8.0
- MySQL Workbench

## Database

- Database: `bank_data_analytics`
- Table: `bank data analytics` (loan-level data)
- Key columns: Account ID, Age, Bank Name, Branch Name, State Name, Region Name, Religion, Product Code, Purpose Category, Grade, Loan Status, Verification Status, Term, Loan Amount, Funded Amount, Total Pymnt, Total Rrec int, Total Fees, Is Delinquent Loan, Is Default Loan

## Questions Answered

| # | Question | SQL concepts used |
|---|---|---|
| 1 | Total loan amount funded | `SUM` |
| 2 | Total number of loans | `COUNT` |
| 3 | Total collection (repayments) | `SUM` |
| 4 | Total interest collected | `SUM` |
| 5 | Total loan amount requested | `SUM` |
| 6 | State-wise loan amount | `GROUP BY`, `ORDER BY` |
| 7, 12 | Religion-wise loan amount | `GROUP BY`, `ORDER BY` |
| 8 | Product group-wise loan amount | `GROUP BY` |
| 9 | Loan status-wise loan amount | `GROUP BY` |
| 10 | Loan status-wise loan count | `COUNT`, `GROUP BY` |
| 11 | State-wise loan count | `COUNT`, `GROUP BY` |
| 13 | Religion-wise total loans | `COUNT`, `GROUP BY` |
| 14, 16 | Age group-wise loan amount and count | `CASE WHEN`, `CAST` |
| 15 | Loan status-wise loans and amount | `COUNT`, `SUM` |
| 17 | Loan maturity (by term) | `GROUP BY`, `WHERE` |
| 18 | Loans without verification | `LOWER`, `TRIM`, `IN` |

## Sample Queries

**Total loan amount funded**
```sql
SELECT
    SUM(`Funded Amount`) AS total_loan_amount_funded
FROM `bank data analytics`;
```

**State-wise loan amount**
```sql
SELECT
    `State Name`,
    SUM(`Loan Amount`) AS total_loan_amount
FROM `bank data analytics`
GROUP BY `State Name`
ORDER BY total_loan_amount DESC;
```

**Loan status-wise loans and amount**
```sql
SELECT
    `Loan Status`,
    COUNT(*) AS total_loans,
    SUM(`Loan Amount`) AS total_loan_amount
FROM `bank data analytics`
GROUP BY `Loan Status`
ORDER BY total_loan_amount DESC;
```

## How to Run

1. Create the database:
   ```sql
   CREATE DATABASE bank_data_analytics;
   ```
2. Import the backup:
   ```bash
   mysql -u root -p bank_data_analytics < sql/bank_analytics_database_backup.sql
   ```
3. Open `sql/bank_data_analysis.sql` in MySQL Workbench and run the queries one by one.

## Key Insights
- [Which state has the highest loan amount]
- [Which loan status has the most loans]
- [Which age group takes the most loans]
- [Which loan term is most common]

## Skills Demonstrated
SQL aggregation (`SUM`, `COUNT`), `GROUP BY` and `ORDER BY`, `CASE WHEN` logic, data type conversion (`CAST`), text cleaning (`TRIM`, `LOWER`), `NULL` handling, database import and export

## Author
**Shafiq Shaikh** – Mumbai, India

