# Bank-Analysis-SQL-Project
# Bank Analysis – SQL & Power BI Project

Bank loan analysis using **MySQL** for querying and **Power BI** for interactive dashboards. The project covers loan portfolio data (funded amounts, defaults, delinquency, collections) and debit / credit transaction data.

## Screenshots

### Loan Overview
![Loan Overview](screenshots/loan_overview.png)

### Credit and Debit Analysis
![Credit and Debit Analysis](screenshots/credit_debit_analysis.png)

## Project Files

| File | Description |
|---|---|
| `sql/bank_analytics_database_backup.sql` | MySQL dump of the `bank_data_analytics` database (table `bank data analytics`) |
| `sql/bank_data_analysis.sql` | 18 business questions answered with SQL queries |
| `Bank_Analysis_Dashboard.pbix` | KPI-by-KPI build (one page per KPI) plus a combined **Dashboard** page for loans, and 12 KPI pages for credit/debit transactions |
| `Power_Bi_Bank_Analysis_Dashoard_2.pbix` | Final 4-page dashboard with navigation buttons, bookmarks and slicers |

## Tools Used
- MySQL 8.0 (data storage and analysis)
- Power BI Desktop
- Power Query (data cleaning and transformation)
- DAX (measures and KPIs)
- Excel (source data)

## SQL Analysis

### Database
- Database: `bank_data_analytics`
- Table: `bank data analytics` (loan-level data)
- Key columns: Account ID, Age, Bank Name, Branch Name, State Name, Region Name, Religion, Product Code, Purpose Category, Grade, Loan Status, Verification Status, Term, Loan Amount, Funded Amount, Total Pymnt, Total Rrec int, Total Fees, Is Delinquent Loan, Is Default Loan

### Questions Answered (`sql/bank_data_analysis.sql`)

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

### Sample Query
```sql
SELECT
    `State Name`,
    SUM(`Loan Amount`) AS total_loan_amount
FROM `bank data analytics`
GROUP BY `State Name`
ORDER BY total_loan_amount DESC;
```

### How to Run the SQL
1. Create the database:
   ```sql
   CREATE DATABASE bank_data_analytics;
   ```
2. Import the backup:
   ```bash
   mysql -u root -p bank_data_analytics < sql/bank_analytics_database_backup.sql
   ```
3. Open `sql/bank_data_analysis.sql` in MySQL Workbench and run the queries.

## Power BI Dashboards

### Data Model

**Banking Data** (loan data)
Account ID, Bank Name, Branch Name, Region Name, State Name, Product Code, Purpose Category, Grade, Loan Status, Term, Age, Religion, Caste, Funded Amount, Total Payment, Total Received Interest, Total Fees

**Sheet1** (credit / debit transactions)
Transaction Date, Bank Name, Branch, Transaction Method, Amount, High Risk Flag

### Dashboard 2 – Page Overview

#### Page 1 – Loan Overview
- KPI cards: Funded Amount, Account count, Total Payment, Total Received Interest, Default Loans, Default Loan Ratio, Delinquent Loans, Delinquent Loan Ratio, Not Verified Loans
- Loan Status funnel
- Funded Amount by Product Code, by Grade, by Religion
- Funded Amount trend (line chart)
- Slicers: Region, Branch, Bank, Religion

#### Page 2 – Loan Distribution
- State-wise loan distribution map
- Branch-wise Total Interest, Total Payment and Total Fees table
- Loans by Age group (treemap) and by Term (column chart)
- Slicers: Grade, Branch, Term, State

#### Page 3 – Credit and Debit Analysis
- KPI cards: Credit Amount, Debit Amount, Net Transaction Amount, Credit to Debit Ratio, Account Activity Ratio
- Transactions per day / month trend
- Amount by Bank (stacked area), by Branch (bar), by Transaction Method (donut)
- Slicers: Bank, Branch, Transaction Method, High Risk Flag, Transaction Date

#### Page 4 – Risk and Growth
- High Risk Flag count by Transaction Method
- Suspicious transactions over time (stacked area)
- Branch Growth % table
- Slicers: Transaction Method, Transaction Date, Branch, Bank

### Dashboard 1 – Key Measures Built

**Loans:** Total Loan Amount Funded, Total Loan, Total Collection, Total Interest, Total Revenue, Count of Default Loan, Count of Delinquent Client, Default Loan Rate, Delinquent Loans Rate, No Verified Loans

**Transactions:** Total Credit Amount, Total Debit Amount, Credit to Debit Ratio, Net Transaction Amount, Account Activity Ratio, Transactions per Day/Week/Month, Branch Growth %, Suspicious Transactions

## Key Insights
- [Add 3 to 5 findings from your own results, e.g. which state has the highest loan amount]
- [Default / delinquent loan rate and which grade drives it]
- [Which transaction method has the most high-risk flags]

## How to Use the Power BI Files
1. Clone or download this repository
2. Open a `.pbix` file in Power BI Desktop
3. The data is stored inside the file, so no extra setup is needed. If you reconnect to the source data, update the path in **Transform data → Data source settings**, then click **Refresh**

## Skills Demonstrated
SQL (aggregation, grouping, CASE logic, data cleaning functions), data cleaning (Power Query), data modelling, DAX measures, KPI design, interactive slicers, bookmarks and navigation buttons, dashboard layout, risk and growth analysis

## Author
**Shafiq Shaikh** – Mumbai, India
[LinkedIn link] | [Email]
