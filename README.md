# Zepto_inventory_analysis
SQL-based data exploration, cleaning, and business analysis on Zepto inventory data using PostgreSQL.

## Overview
This project performs end-to-end **data exploration, cleaning, and business analysis**
on Zepto inventory data using **PostgreSQL**.

The analysis focuses on product pricing, discounts, stock availability, revenue,
and inventory weight metrics.

## Tech Stack
- PostgreSQL
- pgAdmin
- SQL

## Dataset
The dataset contains product-level inventory data with the following key attributes:
- SKU ID
- Product name & category
- MRP and discount percentage
- Selling price
- Available quantity
- Product weight (in grams)
- Stock availability status

## Key Analyses Performed

### Data Exploration
- Total row count
- Sample data preview
- Distinct product categories
- Stock vs out-of-stock analysis
- Duplicate product name detection

### Data Cleaning
- Identified and removed invalid pricing data
- Converted prices from paise to rupees
- Handled NULL values
- Ensured pricing consistency

### Business Insights
- Top discounted products
- High-MRP out-of-stock products
- Revenue estimation by category
- Average discount analysis by category
- Price-per-gram value comparison
- Product weight categorization (low / medium / bulk)
- Total inventory weight by category
