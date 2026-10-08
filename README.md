# Superstore Sales & Profit Analysis

## Project Overview
An end-to-end data analytics project analyzing 10,000 retail orders to understand sales performance, profitability, regional/category trends, and the effect of discounts on profit.

## Business Objectives
- Identify high- and low-performing regions and categories.
- Measure sales, profit, orders, and profit margin.
- Examine the relationship between discount and profitability.
- Identify loss-making sub-categories and high-discount orders.
- Build an interactive dashboard for business reporting.

## Tools
- SQL — querying, aggregation, joins/CTEs, KPI calculations
- Python — pandas, NumPy, Matplotlib, exploratory data analysis
- Excel — Pivot Tables and validation
- Power BI — dashboard and interactive reporting

## Repository Structure
```text
data/          Dataset
sql/           SQL analysis queries
python/        Python EDA notebook
excel/         Excel analysis workbook
powerbi/       Power BI dashboard instructions and DAX
screenshots/   Project visuals
```

## Workflow
Data -> Cleaning/Validation -> SQL Analysis -> Python EDA -> Excel Validation -> Power BI Dashboard -> Business Recommendations

## Key Metrics
- Total Orders
- Total Sales
- Total Profit
- Profit Margin
- Average Discount

## Important Note
This repository uses a generated retail dataset with a Superstore-style schema for portfolio/interview practice. If presenting it as an actual external/public Sample Superstore dataset, replace `data/superstore_sales.csv` with the genuine dataset and rerun the analysis.

## How to Run
### Python
```bash
pip install pandas numpy matplotlib jupyter
jupyter notebook python/analysis.ipynb
```

### SQL
Import `data/superstore_sales.csv` into a table named `superstore_sales`, then run `sql/analysis.sql`.

### Power BI
Follow `powerbi/dashboard_guide.md` to create the dashboard and DAX measures.
