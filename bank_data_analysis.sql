-- QUESTION 1: TOTAL LOAN AMOUNT FUNDED
-- Purpose: Calculate the total amount funded for loans.
USE bank_data_analytics;
SELECT
    SUM(`Funded Amount`) AS total_loan_amount_funded
FROM `bank data analytics`;


-- QUESTION 2: TOTAL LOANS
-- Purpose: Count the total number of loans.
-- ==========================================
SELECT
    COUNT(*) AS total_loans
FROM `bank data analytics`;



-- QUESTION 3: TOTAL COLLECTION
-- Purpose: Calculate total loan repayments.
-- ==========================================
SELECT
    SUM(`Total Pymnt`) AS total_collection
FROM `bank data analytics`;



-- QUESTION 4: TOTAL INTEREST
-- Purpose: Calculate total interest collected.
-- ==========================================
USE bank_data_analytics;
SELECT
    SUM(`Total Rrec Int`) AS total_interest
FROM `bank data analytics`;



-- QUESTION 5: TOTAL LOAN AMOUNT
-- Purpose: Calculate the total loan amount requested by customers.
SELECT
    SUM(`Loan Amount`) AS total_loan_amount
FROM `bank data analytics`;


-- QUESTION 6: STATE-WISE LOAN AMOUNT
-- Purpose: Calculate the total loan amount for each state.
SELECT
    `State Name`,
    SUM(`Loan Amount`) AS total_loan_amount
FROM `bank data analytics`
GROUP BY `State Name`
ORDER BY total_loan_amount DESC;



-- QUESTION 7: RELIGION-WISE LOAN AMOUNT
-- Purpose: Calculate total loan amount by religion.
SELECT
    `Religion`,
    SUM(`Loan Amount`) AS total_loan_amount
FROM `bank data analytics`
GROUP BY Religion
ORDER BY total_loan_amount DESC;



-- QUESTION 8: PRODUCT GROUP-WISE LOAN AMOUNT
-- Purpose: Calculate total loan amount for each product group.
SELECT
    `Product Code`,
    SUM(`Loan Amount`) AS total_loan_amount
FROM `bank data analytics`
GROUP BY `Product Code`
ORDER BY total_loan_amount DESC;



-- QUESTION 9: LOAN STATUS-WISE LOAN AMOUNT
-- Purpose: Calculate total loan amount for each loan status.
SELECT
    `Loan Status`,
    SUM(`Loan Amount`) AS total_loan_amount
FROM `bank data analytics`
GROUP BY `Loan Status`
ORDER BY total_loan_amount DESC;



-- QUESTION 10: LOAN STATUS-WISE LOAN COUNT
-- Purpose: Count the number of loans for each loan status.
SELECT
    `Loan Status`,
    COUNT(*) AS total_loans
FROM `bank data analytics`
GROUP BY `Loan Status`
ORDER BY total_loans DESC;



-- QUESTION 11: STATE-WISE LOAN COUNT
-- Purpose: Count the total loans in each state.
SELECT
    `State Name`,
    COUNT(*) AS total_loans
FROM `bank data analytics`
GROUP BY `State Name`
ORDER BY total_loans DESC;



-- QUESTION 12: RELIGION-WISE LOAN AMOUNT
-- Purpose: Calculate the total loan amount for each religion.
SELECT
    Religion,
    SUM(`Loan Amount`) AS total_loan_amount
FROM `bank data analytics`
GROUP BY Religion
ORDER BY total_loan_amount DESC;



-- QUESTION 13: RELIGION-WISE TOTAL LOANS
-- Purpose: Count the number of loans for each religion.
SELECT
    Religion,
    COUNT(*) AS total_loans
FROM `bank data analytics`
GROUP BY Religion
ORDER BY total_loans DESC;



-- QUESTION 14: AGE-WISE LOAN AMOUNT
-- Purpose: Calculate total loan amount by age group.
SELECT
    CASE
        WHEN Age < 25 THEN 'Below 25'
        WHEN Age BETWEEN 25 AND 34 THEN '25-34'
        WHEN Age BETWEEN 35 AND 44 THEN '35-44'
        WHEN Age BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55 and above'
    END AS age_group,
    SUM(`Loan Amount`) AS total_loan_amount
FROM `bank data analytics`
GROUP BY age_group
ORDER BY total_loan_amount DESC;



-- QUESTION 15: LOAN STATUS-WISE LOAN
-- Purpose: Analyze loan amounts by loan status.
SELECT
    `Loan Status`,
    COUNT(*) AS total_loans,
    SUM(`Loan Amount`) AS total_loan_amount
FROM `bank data analytics`
GROUP BY `Loan Status`
ORDER BY total_loan_amount DESC;



-- QUESTION 16: AGE GROUP-WISE LOAN
-- Purpose: Analyze total loan amount by borrower age groups.
SELECT
    CASE
        WHEN CAST(Age AS UNSIGNED) < 25 THEN 'Below 25'
        WHEN CAST(Age AS UNSIGNED) BETWEEN 25 AND 34 THEN '25-34'
        WHEN CAST(Age AS UNSIGNED) BETWEEN 35 AND 44 THEN '35-44'
        WHEN CAST(Age AS UNSIGNED) BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55 and above'
    END AS age_group,
    COUNT(*) AS total_loans,
    SUM(`Loan Amount`) AS total_loan_amount
FROM `bank data analytics`
WHERE Age IS NOT NULL
GROUP BY age_group
ORDER BY total_loan_amount DESC;



-- QUESTION 17: LOAN MATURITY
-- Purpose: Analyze loans by repayment term.
SELECT
    Term,
    COUNT(*) AS total_loans,
    SUM(`Loan Amount`) AS total_loan_amount
FROM `bank data analytics`
WHERE Term IS NOT NULL
GROUP BY Term
ORDER BY total_loans DESC;



-- QUESTION 18: NO VERIFIED LOANS
-- Purpose: Identify loans without proper verification.
SELECT
    `Verification Status`,
    COUNT(*) AS total_unverified_loans,
    SUM(`Loan Amount`) AS total_loan_amount
FROM `bank data analytics`
WHERE `Verification Status` IS NULL
   OR LOWER(TRIM(`Verification Status`)) IN ('no', 'not verified', 'unverified', 'pending')
GROUP BY `Verification Status`;