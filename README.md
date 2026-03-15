# Coffee Portfolio: Profitability & Pricing Analysis (2023-2025)


## 📌 Project Overview


This project addresses a critical business challenge: a significant decrease in profit margins due to rising costs of sales and tariffs. By analyzing multi-year transactional data (2023-2025), this analysis identifies underperforming products and provides data-backed recommendations for a revamped pricing strategy.

## 🛠️ Technical Stack


Database: Microsoft SQL Server

Techniques: Common Table Expressions, Recursive Joins, Data Imputation, Type Casting, and Aggregate Filtering.

Visualization: Power BI (Year-over-Year margin tracking).

## 🏗️ Data Architecture
The project utilizes a relational schema consisting of a central Fact table (Orders) and Dimension tables (Products, Customers).

Key SQL Implementations:
Data Consolidation: Utilized UNION ALL within a CTE to unify fragmented annual order files (2023, 2024, and 2025) into a single longitudinal dataset.

Advanced Data Imputation: Implemented CASE logic to handle NULL values in Revenue and COGS by dynamically calculating values based on Master Product price lists.

Data Normalization: Standardized heterogeneous date formats using CAST and CONVERT functions to ensure compatibility with Power BI Time Intelligence functions.

Precision Handling: Applied decimal(18,2) casting to all financial metrics to prevent rounding errors during multi-stage calculations.

## 🎯 Business Logic & KPIs
The primary objective was to isolate "Troublemaker" products that failed to meet the organization's profitability benchmarks.

Key Performance Indicators (KPIs):
Gross Margin % (GMP): Calculated as (Revenue - COGS) / Revenue.

Profitability Threshold: 30% GMP.

Period of Interest: Q3 2025 (July–September).

## 🔍Findings
The analysis identified a specific subset of products in Q3 2025 with a Gross Margin % below 30%. These products are the primary drivers of the overall margin decline and are the focus of the following recommendations.

### 💡 Strategic Recommendations
Based on the SQL analysis, the following actions are proposed:

Price Adjustments: Increase prices for high-volume products currently sitting in the 20-29% margin bracket.

Portfolio Pruning: Discontinue low-volume products with consistently high COGS that fall below the 15% margin floor.

Supplier Negotiation: Target product categories with the highest "Rise in Cost of Sales" for bulk-buy discounts or alternative sourcing.

### How to use this repository:
SQL_Analysis.sql: Contains the full end-to-end script from data union to final business query.

Data/: Contains the raw CSV files for Customers, Products, and annual Orders.

Dashboard/: (Coming Soon) The Power BI .pbix file visualizing these insights.
