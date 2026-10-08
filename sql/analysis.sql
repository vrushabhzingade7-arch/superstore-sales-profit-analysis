-- Superstore Sales & Profit Analysis
-- Dialect: MySQL 8+ / PostgreSQL-compatible with minor date-function changes

CREATE DATABASE IF NOT EXISTS superstore_analysis;
-- Import data/superstore_sales.csv into a table named superstore_sales.

-- 1. Overall KPIs
SELECT
    COUNT(DISTINCT Order_ID) AS total_orders,
    ROUND(SUM(Sales),2) AS total_sales,
    ROUND(SUM(Profit),2) AS total_profit,
    ROUND(SUM(Profit)/NULLIF(SUM(Sales),0)*100,2) AS profit_margin_pct,
    ROUND(AVG(Discount)*100,2) AS avg_discount_pct
FROM superstore_sales;

-- 2. Sales and profit by region
SELECT Region,
       ROUND(SUM(Sales),2) AS sales,
       ROUND(SUM(Profit),2) AS profit,
       ROUND(SUM(Profit)/NULLIF(SUM(Sales),0)*100,2) AS margin_pct
FROM superstore_sales
GROUP BY Region
ORDER BY profit DESC;

-- 3. Category performance
SELECT Category,
       COUNT(DISTINCT Order_ID) AS orders,
       ROUND(SUM(Sales),2) AS sales,
       ROUND(SUM(Profit),2) AS profit
FROM superstore_sales
GROUP BY Category
ORDER BY profit DESC;

-- 4. Loss-making sub-categories
SELECT Sub_Category,
       ROUND(SUM(Sales),2) AS sales,
       ROUND(SUM(Profit),2) AS profit
FROM superstore_sales
GROUP BY Sub_Category
HAVING SUM(Profit) < 0
ORDER BY profit;

-- 5. Discount vs profit
SELECT
    Discount,
    COUNT(*) AS orders,
    ROUND(SUM(Sales),2) AS sales,
    ROUND(SUM(Profit),2) AS profit
FROM superstore_sales
GROUP BY Discount
ORDER BY Discount;

-- 6. High-discount orders
SELECT *
FROM superstore_sales
WHERE Discount >= 0.40
ORDER BY Profit ASC;

-- 7. Monthly trend
SELECT
    EXTRACT(YEAR FROM Order_Date) AS order_year,
    EXTRACT(MONTH FROM Order_Date) AS order_month,
    ROUND(SUM(Sales),2) AS sales,
    ROUND(SUM(Profit),2) AS profit
FROM superstore_sales
GROUP BY EXTRACT(YEAR FROM Order_Date), EXTRACT(MONTH FROM Order_Date)
ORDER BY order_year, order_month;

-- 8. CTE: rank sub-categories by profit
WITH subcategory_profit AS (
    SELECT Sub_Category,
           SUM(Sales) AS sales,
           SUM(Profit) AS profit
    FROM superstore_sales
    GROUP BY Sub_Category
)
SELECT Sub_Category,
       ROUND(sales,2) AS sales,
       ROUND(profit,2) AS profit,
       RANK() OVER (ORDER BY profit DESC) AS profit_rank
FROM subcategory_profit
ORDER BY profit_rank;
