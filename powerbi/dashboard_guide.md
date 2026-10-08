# Power BI Dashboard Guide

## Import
1. Open Power BI Desktop.
2. Get Data -> Text/CSV -> data/superstore_sales.csv.
3. Confirm Order_Date and Ship_Date are Date types.
4. Load the data.

## Measures (create these in DAX)
```DAX
Total Sales = SUM(superstore_sales[Sales])

Total Profit = SUM(superstore_sales[Profit])

Total Orders = DISTINCTCOUNT(superstore_sales[Order_ID])

Profit Margin % = DIVIDE([Total Profit], [Total Sales], 0)

Average Discount % = AVERAGE(superstore_sales[Discount])
```

## Recommended one-page dashboard
Top cards:
- Total Sales
- Total Profit
- Total Orders
- Profit Margin %

Charts:
1. Sales & Profit by Region — clustered column chart
2. Profit by Category — bar chart
3. Monthly Sales & Profit — line chart
4. Profit by Sub-Category — bar chart
5. Discount vs Profit — scatter chart

Slicers:
- Region
- Category
- Customer Segment
- Ship Mode
- Order Date

## Dashboard title
Superstore Sales & Profit Analysis
