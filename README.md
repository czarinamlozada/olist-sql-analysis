# Olist E-Commerce SQL Analysis

## Overview

The Olist Brazilian E-Commerce dataset contains transactional information on customers, orders, products, payments, sellers, and reviews. The dataset covers September 2016 to October 2018 and was analyzed using SQL to understand revenue trends, customer spending, purchasing behavior, and product performance.

Some data-quality issues were identified, including missing product category values and unusually low revenue in the final months, which may indicate incomplete data.

## Business Questions

1. Who are the top 10 customers by total amount spent?
2. What is the monthly revenue trend across the dataset?
3. What is the month-over-month change in revenue?
4. Which product categories generate the most revenue?
5. What are the top 3 products within each category by revenue?
6. How can customers be segmented into Low, Medium, and High spend tiers?
7. How many customers are repeat vs. one-time buyers?
8. What percentage of total revenue comes from the top category?

## Key Findings

- The highest-spending customer spent $13,664.08.
- Monthly revenue grew significantly, reaching approximately $1.16 million in April 2018.
- 95.32% of customers were in the Low or Medium spending tiers, while only 4.67% were in the High spending tier.
- 96.88% of customers were one-time buyers, while only 3.12% were repeat buyers.
- Health & Beauty (`beleza_saude`) was the highest-revenue product category, generating $1,258,681.34, or 9.26% of total product revenue.
- Revenue showed significant month-to-month fluctuations, including a $415,204.92 increase in November 2017 and a $316,481.32 decrease in December 2017.

## Recommendations

### 1. Improve Customer Retention

The very low repeat-purchase rate of 3.12% indicates a major customer retention opportunity. The business could introduce post-purchase campaigns, personalized product recommendations, loyalty rewards, and targeted discounts to encourage customers to return.

### 2. Increase Customer Spending

Since most customers fall into the Low and Medium spending tiers, the business could increase customer value through product bundles, cross-selling, upselling, and personalized promotions.

### 3. Leverage High-Performing Categories

The Health & Beauty category generated the highest product revenue. The business could use targeted promotions and complementary-product recommendations to further increase sales in high-performing categories.

## Tools & Skills

### Tools

- MySQL
- DataGrip
- GitHub

### SQL Skills

- SELECT
- JOIN
- GROUP BY
- ORDER BY
- LIMIT
- SUM()
- COUNT()
- CASE WHEN
- Common Table Expressions (CTEs)
- Window Functions
- LAG()
- ROW_NUMBER()
- PARTITION BY
- SUM() OVER()
- Percentage calculations
- Customer segmentation

## Files

| File | Description |
|---|---|
| [q1_top_customers.sql](q1_top_customers.sql) | Top 10 customers by total spending |
| [q2_monthly_revenue_trend.sql](q2_monthly_revenue_trend.sql) | Monthly revenue trend |
| [q3_month_over_month_revenue_change.sql](q3_month_over_month_revenue_change.sql) | Month-over-month revenue change |
| [q4_revenue_by_product_category.sql](q4_revenue_by_product_category.sql) | Revenue by product category |
| [q5_top_3_products_by_category.sql](q5_top_3_products_by_category.sql) | Top 3 products within each category |
| [q6_customer_spend_tiers.sql](q6_customer_spend_tiers.sql) | Customer spending segmentation |
| [q7_repeat_vs_one_time_customers.sql](q7_repeat_vs_one_time_customers.sql) | Repeat vs. one-time customers |
| [q8_top_category_revenue_share.sql](q8_top_category_revenue_share.sql) | Top category's share of total product revenue |
