# Loan Default Risk Analysis: Identifying Credit Risk & Defaulted Loan Exposure

## Table of Contents
- [Project Overview](#project-overview)
- [Data Source](#dataset-source)
- [Business Problem](#business-problem)
- [Project Objectives](#project-objectives)
- [Dataset Overview](#dataset-overview)
- [Tools and Technologies](#tools-and-technologies)
- [Project Workflow](#project-workflow)
- [Key Performance Indicators](#key-performance-indicators)
- [Key Findings](#key-findings)
- [Power BI Dashboard](#power-bi-dashboard)
- [Business Recommendations](#business-recommendations)
- [Project Structure](#project-structure)
- [How to Run the Project](#how-to-run-the-project)
- [Limitations](#limitations)
- [Future Improvements](#future-improvements)

## Project Overview

This project analyzes historical loan data to identify patterns associated with loan defaults, assess credit-risk segments, and evaluate defaulted loan principal exposure.

The analysis combines SQL, Python, and Power BI to examine borrower credit grades, debt-to-income (DTI) ratios, interest rates, loan amounts, and loan purposes.

The goal is to translate historical loan data into actionable insights that can support portfolio monitoring and credit-risk assessment.

## Dataset Source

- **Source:** [Kaggle — Loan Default Prediction](https://www.kaggle.com/competitions/loan-default-pred)
- **File used:** `loan_train.csv`
- **Description:** Historical loan applicant and loan-status data used to analyze default patterns across credit grades, debt-to-income ratios, interest rates, loan amounts, and loan purposes.
- **License:** Subject to Kaggle competition rules. Refer to the original competition page for applicable terms.
- **Data availability:** The dataset is not included in this repository. Users must obtain it from the original source and comply with its applicable terms.

## Business Problem

Lenders need to understand which borrower segments exhibit higher observed default rates and which categories contribute most to defaulted loan principal exposure.

This project investigates the following questions:

- What proportion of loans in the dataset are classified as defaults?
- How do observed default rates vary across credit grades?
- How are defaults associated with DTI and interest-rate bands?
- Which loan amount bands and loan purposes show higher observed default rates?
- Which credit grades and loan purposes contribute most to defaulted principal exposure?
- How can these findings inform portfolio monitoring?

## Project Objectives

- Analyze loan performance using SQL.
- Perform data-quality checks and exploratory data analysis in Python.
- Create risk bands for loan amount, DTI, and interest rate.
- Compare observed default rates across individual and combined risk segments.
- Build an interactive Power BI dashboard.
- Develop business recommendations based on the findings.
- Validate key metrics across SQL, Python, and Power BI.

## Dataset Overview

The project uses a loan dataset containing **27,003 records and 47 columns**.

| Dataset Metric | Value |
|---|---:|
| Total loan records | 27,003 |
| Unique loan IDs | 27,003 |
| Non-defaulted loans (`loan_status = 0`) | 23,026 |
| Defaulted loans (`loan_status = 1`) | 3,977 |
| Observed default rate | 14.73% |
| Total original loan principal | 299,407,825 |
| Original principal associated with defaulted loans | 48,489,975 |

### Target Variable

- `loan_status = 0`: Non-defaulted loan.
- `loan_status = 1`: Defaulted loan.

The observed default rate is calculated as the number of defaulted loans divided by the total number of loans.

## Tools and Technologies

- **MySQL:** Data validation, aggregation, segmentation, and analytical queries.
- **Python:** Data inspection, data-quality analysis, feature engineering, exploratory data analysis, and visualization.
- **Pandas and NumPy:** Data manipulation and numerical analysis.
- **Matplotlib:** Charts and heatmap visualization.
- **Power BI:** Interactive dashboard development and KPI reporting.
- **Jupyter Notebook:** Documenting and executing Python analysis.
- **Git and GitHub:** Version control and project documentation.

## Project Workflow

1. Loaded and inspected the loan dataset.
2. Validated row counts, unique identifiers, and target-variable distribution.
3. Examined missing values and data quality.
4. Created risk categories for DTI, interest rate, and loan amount.
5. Analyzed default rates by credit grade, DTI, interest rate, loan amount, and loan purpose.
6. Examined combined credit-grade and DTI segments.
7. Calculated defaulted principal exposure by credit grade and loan purpose.
8. Built a multi-page Power BI dashboard.
9. Cross-checked overall portfolio metrics between SQL and Python and verified that the Power BI dashboard reports the same key metrics.
10. Prepared findings, limitations, and business recommendations.

## Key Performance Indicators

- Total Loans
- Non-Defaulted Loans
- Defaulted Loans
- Observed Default Rate
- Total Loan Principal
- Defaulted Loan Principal

**Important distinction:** Defaulted loan principal is the sum of the original loan amounts for defaulted accounts. It is not the same as actual lender losses, outstanding balances, or loss given default.

## Key Findings

- **Overall portfolio:** 27,003 loans are represented in the dataset, with 3,977 classified as defaults and an observed default rate of 14.73%.
- **Credit grade:** Observed default rates generally increase toward lower credit grades.
- **DTI:** Higher DTI bands show higher observed default rates overall, although the pattern varies across credit grades.
- **Interest rate:** Higher interest-rate bands exhibit higher observed default rates in the analyzed dataset.
- **Loan amount:** The Very High loan amount band has the highest observed default rate among the four loan amount bands.
- **Loan purpose:** Debt consolidation contributes the largest defaulted principal exposure among loan purposes.
- **Combined segmentation:** Examining credit grade and DTI together reveals differences in observed default rates that may not be apparent when analyzing each factor separately.

These findings describe observed historical associations and do not establish causation.

## Power BI Dashboard

The Power BI report presents an overview of loan performance and a deeper analysis of default risk.

### Page 1: Loan Default Risk Analysis

Includes portfolio KPIs, observed default rates by credit grade and DTI band, a credit-grade-by-DTI risk matrix, and interactive slicers.

![Loan Risk Overview](Images/loan_risk_overview.png)

### Page 2: Loan Default Risk Deep Dive

Includes analysis of loan purposes, interest-rate bands, loan amount bands, and defaulted principal exposure across credit grades.

![Loan Risk Exposure](Images/loan_risk_exposure.png)

## Business Recommendations

1. **Monitor credit-grade risk:** Review underwriting and portfolio performance across credit grades with higher observed default rates.
2. **Combine risk indicators:** Assess DTI alongside credit grade and other available borrower information rather than relying on one variable alone.
3. **Monitor interest-rate segments:** Investigate higher-default-rate interest bands while accounting for borrower characteristics and loan terms.
4. **Track principal exposure:** Monitor both observed default rates and the original principal associated with defaults.
5. **Review loan-purpose exposure:** Investigate categories that contribute substantial defaulted principal, including debt consolidation.
6. **Validate segment sizes:** Review loan counts alongside default rates, especially for small segments, before making policy decisions.

These recommendations are analytical suggestions, not proof that changing a particular lending policy will reduce defaults.

## Project Structure

```text
Loan-Default-Risk-Analysis/
│
├── Data/
│   └── loan_train.csv
│
├── Images/
│   ├── loan_risk_overview.png
│   └── loan_risk_exposure.png
│
├── Notebook/
│   └── loan_default_risk_analysis.ipynb
│
├── SQL/
│   └── loan_default_analysis.sql
│
├── Dashboard/
│   └── loan_default_risk_analysis.pbix
│
├── .gitignore
└── README.md
```

## How to Run the Project

### SQL Analysis
1. Set up a MySQL database.
2. Import the dataset into a table with compatible column types.
3. Open `SQL/loan_default_analysis.sql`.
4. Execute the queries against the full dataset.

### Python Analysis
1. Install Python and Jupyter Notebook.
2. Install the required libraries:

   ```bash
   pip install pandas numpy matplotlib
   ```

3. Ensure the CSV file is located in the `Data/` directory.
4. Open `Notebook/loan_default_risk_analysis.ipynb`.
5. Run the notebook cells in order.

### Power BI Dashboard
1. Open `Dashboard/loan_default_risk_analysis.pbix` in Power BI Desktop.
2. Configure the data source if necessary.
3. Refresh the report after verifying the underlying dataset.

## Limitations

- The analysis is based on historical data and does not establish causal relationships.
- Observed default rates may vary with sample size and the characteristics of the dataset.
- Small segments may produce unstable default-rate estimates.
- Defaulted original principal is not a measure of realized financial loss.
- Results may not generalize to other lenders, products, or time periods.
- The dataset's definitions and coverage should be verified before using the findings in real lending decisions.

## Future Improvements

- Conduct statistical hypothesis tests to assess differences between risk segments.
- Explore logistic regression or other predictive methods for default-risk estimation.
- Evaluate model performance using appropriate validation methods.
- Investigate additional borrower characteristics and repayment behavior.
- Add time-based portfolio trends if reliable origination and repayment dates are available.
- Extend the analysis with explainability and model-monitoring techniques.

---

**Project focus:** Credit-risk analysis, loan default segmentation, SQL analytics, Python EDA, and Power BI reporting.
