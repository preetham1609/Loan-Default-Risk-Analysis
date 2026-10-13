use loan_risk_analysis;

SELECT COUNT(*) 
FROM loan_data_full;

SELECT *
FROM loan_data_full
LIMIT 5;

DESCRIBE loan_data_full;
SHOW COLUMNS FROM loan_data_full;

SELECT DISTINCT loan_status
FROM loan_data_full;

select loan_status, count(*) as total_records
from loan_data_full
group by loan_status;

SELECT loan_status,
COUNT(*) AS total_loans,
ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM loan_data_full), 2) AS percentage
FROM loan_data_full
GROUP BY loan_status;

SELECT loan_status, loan_amnt, int_rate, grade, sub_grade, dti
FROM loan_data_full
LIMIT 10;

select count(*) as total_loans,
sum(loan_status) as defaulted_loans,
round (sum(loan_status) * 100 / count(*), 2) as default_rate
from loan_data_full;

select grade, count(*) as total_loans,
sum(loan_status) as defaulted_loans,
round (sum(loan_status) * 100 / count(*), 2) as default_rate
from loan_data_full
group by grade
order by default_rate desc;

select
case
when dti <10 then 'Low'
when dti >=10 and dti <20 then 'Moderate'
when dti >=20 and dti <30 then 'High'
else 'Very High'
end as dti_band,
count(*) as total_loans,
sum(loan_status) as defaulted_loans,
round(sum(loan_status) *100 / count(*),2) as default_rate
from loan_data_full
group by dti_band
order by default_rate;

SELECT
    int_rate,
    CAST(REPLACE(int_rate, '%', '') AS DECIMAL(5,2)) AS interest_rate
FROM loan_data_full limit 10;

ALTER TABLE loan_data_full
ADD COLUMN interest_rate DECIMAL(5,2);

UPDATE loan_data_full
SET interest_rate = CAST(REPLACE(int_rate, '%', '') AS DECIMAL(5,2));

SELECT int_rate, interest_rate
FROM loan_data_full
LIMIT 10;

SELECT
    CASE
        WHEN interest_rate < 8
            THEN 'Low'
        WHEN interest_rate >= 8
             AND interest_rate < 12
            THEN 'Moderate'
        WHEN interest_rate >= 12
             AND interest_rate < 16
            THEN 'High'
        ELSE 'Very High'
    END AS interest_rate_band,
    COUNT(*) AS total_loans,
    SUM(loan_status) AS defaulted_loans,
    ROUND(SUM(loan_status) * 100 / COUNT(*), 2) AS default_rate
FROM loan_data_full
GROUP BY interest_rate_band
ORDER BY default_rate DESC;

SELECT DISTINCT purpose
FROM loan_data_full;

SELECT
    purpose,
    COUNT(*) AS total_loans,
    SUM(loan_status) AS defaulted_loans,
    ROUND(SUM(loan_status) * 100 / COUNT(*), 2) AS default_rate
FROM loan_data_full
GROUP BY purpose
ORDER BY default_rate DESC;

select grade, 
case 
when dti < 10 then 'Low'
when dti >= 10 and dti <20 then 'Moderate'
when dti >=20 and dti <30 then 'High'
else 'Very High'
end as dti_band,
count(*) as total_loans,
sum(loan_status) as defaulted_loans,
round(sum(loan_status) *100 / count(*),2) as default_rate
from loan_data_full
group by grade, dti_band
order by default_rate desc;

select grade, 
case 
when dti < 10 then 'Low'
when dti >= 10 and dti <20 then 'Moderate'
when dti >=20 and dti <30 then 'High'
else 'Very High'
end as dti_band,
count(*) as total_loans,
sum(loan_amnt) as total_amount,
sum(loan_status) as defaulted_loans,
sum( case
when loan_status =1 then loan_amnt
else 0 end) as defaulted_loan_amount,
round(sum(loan_status) *100 / count(*),2) as default_rate
from loan_data_full
group by grade, dti_band
order by defaulted_loan_amount desc;

SELECT
    MIN(loan_amnt) AS min_loan_amount,
    MAX(loan_amnt) AS max_loan_amount,
    AVG(loan_amnt) AS avg_loan_amount
FROM loan_data_full;

select case
when loan_amnt < 5000 then 'Low'
when loan_amnt >=5000 and loan_amnt <10000 then 'Medium'
when loan_amnt >=10000 and loan_amnt <20000 then 'Large'
else 'Very Large' end as loan_amount_band,
count(*) as total_loans,
sum(loan_status) as defaulted_loans,
round(sum(loan_status)*100/count(*),2) as default_rate
from loan_data_full
group by loan_amount_band
order by default_rate;