# Ecommerce-SQL-Analysis
SQL analysis of Ecommerce dataset using MySQL

# SmartEcommerceInsights

## Overview
**EcommerceInsights** is a project designed to demonstrate advanced SQL techniques for analyzing ecommerce data. The purpose of this project is to extract meaningful insights from a structured dataset using SQL queries, aggregations, subqueries, joins, and views. This project is suitable for learners aiming to strengthen their data analysis and database querying skills.

The project uses a sample **Ecommerce dataset** containing transaction-level data such as invoices, products, quantities, prices, and customer information.

---

## Objective
The main objectives of this project are:

1. To learn how to manipulate and query structured data in SQL.
2. To perform basic and advanced data filtering and selection.
3. To calculate aggregate metrics such as total sales, average sales, and top customers.
4. To use subqueries and joins to combine data from multiple tables.
5. To create views for repeated analysis and optimized queries for performance.
6. To generate actionable insights from ecommerce transactions.

---

## Dataset 
- **Columns:**
  - `InvoiceNo` – Unique invoice number
  - `StockCode` – Unique product code
  - `Description` – Product description
  - `Quantity` – Number of items purchased
  - `InvoiceDate` – Date and time of transaction
  - `UnitPrice` – Price per unit
  - `CustomerID` – Unique customer ID
  - `Country` – Country of customer
---

## Methodology

The project involves the following steps:

### 1. Database and Table Creation
- Created `Ecommerce` database.
- Defined table `ecommerce_data` with appropriate data types.
- Created a `customers` table for join operations.

### 2. Data Import
- Imported `ecommerce_data.csv` into MySQL Workbench.

### 3. SQL Queries
- **Basic SELECT & Filtering:**  
  Previewed data and filtered by conditions such as country.
  
- **Aggregation & GROUP BY:**  
  Calculated total sales by country, average sales, and other metrics.
  
- **Subqueries:**  
  Identified invoices with total amounts exceeding a certain threshold.
  
- **Joins:**  
  Combined `ecommerce_data` with `customers` to calculate total spending per customer.
  
- **Views:**  
  Created a view `top_customers` to list top 10 customers by total spend.
  
- **Optimizations:**  
  Added indexes on frequently queried columns like `CustomerID` and `InvoiceDate`.

### 4. Insights Generated
- Top-selling countries by revenue.
- Top customers based on total spending.
- High-value invoices and product-level sales analysis.
- Daily and monthly sales trends.

---
