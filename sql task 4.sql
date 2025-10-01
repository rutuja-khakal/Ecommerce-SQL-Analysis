create database Ecommerce;
use Ecommerce;

## table creation
 
CREATE TABLE ecommerce_data (
    InvoiceNo VARCHAR(20),
    StockCode VARCHAR(20),
    Description VARCHAR(255),
    Quantity INT,
    InvoiceDate DATETIME,
    UnitPrice DECIMAL(10,2),
    CustomerID VARCHAR(20),
    Country VARCHAR(50)
);

# Basic SELECT & Filtering

SELECT * FROM ecommerce_data LIMIT 10;
SELECT * 
FROM ecommerce_data 
WHERE Country = 'United Kingdom' 
ORDER BY InvoiceDate DESC;

# Aggregation & GROUP BY

SELECT Country, SUM(Quantity * UnitPrice) AS TotalSales
FROM ecommerce_data
GROUP BY Country
ORDER BY TotalSales DESC;

# Subquery 

SELECT InvoiceNo, CustomerID, TotalAmount
FROM (
    SELECT InvoiceNo, CustomerID, SUM(Quantity * UnitPrice) AS TotalAmount
    FROM ecommerce_data
    GROUP BY InvoiceNo, CustomerID
) AS invoice_totals
WHERE TotalAmount > 1000;

-- Example customers table
CREATE TABLE customers (
    CustomerID VARCHAR(20) PRIMARY KEY,
    CustomerName VARCHAR(100)
);

# Customer Table And Joins

CREATE TABLE customers (
    CustomerID VARCHAR(20) PRIMARY KEY,
    CustomerName VARCHAR(100)
);

INSERT INTO customers (CustomerID, CustomerName)
VALUES 
('17850', 'Alice'),
('14911', 'Bob'),
('13047', 'Charlie');

SELECT e.CustomerID, c.CustomerName, SUM(e.Quantity * e.UnitPrice) AS TotalSpent
FROM ecommerce_data e
JOIN customers c ON e.CustomerID = c.CustomerID
GROUP BY e.CustomerID, c.CustomerName
ORDER BY TotalSpent DESC
LIMIT 10;


# Top Customers View 
CREATE VIEW top_customers AS
SELECT CustomerID, SUM(Quantity * UnitPrice) AS TotalSpent
FROM ecommerce_data
GROUP BY CustomerID
ORDER BY TotalSpent DESC
LIMIT 10;

# top 10 customers by total spending
SELECT CustomerID, SUM(Quantity * UnitPrice) AS TotalSpent
FROM ecommerce_data
WHERE CustomerID IS NOT NULL
GROUP BY CustomerID
ORDER BY TotalSpent DESC
LIMIT 10;

CREATE INDEX idx_customer ON ecommerce_data(CustomerID);
CREATE INDEX idx_invoice_date ON ecommerce_data(InvoiceDate);

SELECT * FROM ecommerce_data LIMIT 10;
SELECT * 
FROM ecommerce_data 
WHERE Country = 'United Kingdom' 
ORDER BY InvoiceDate DESC
LIMIT 10;
SELECT Country, SUM(Quantity * UnitPrice) AS TotalSales
FROM ecommerce_data
GROUP BY Country
ORDER BY TotalSales DESC;

SELECT InvoiceNo, CustomerID, TotalAmount
FROM (
    SELECT InvoiceNo, CustomerID, SUM(Quantity * UnitPrice) AS TotalAmount
    FROM ecommerce_data
    GROUP BY InvoiceNo, CustomerID
) AS invoice_totals
WHERE TotalAmount > 1000
LIMIT 10;

SELECT e.CustomerID, c.CustomerName, SUM(e.Quantity * e.UnitPrice) AS TotalSpent
FROM ecommerce_data e
JOIN customers c ON e.CustomerID = c.CustomerID
GROUP BY e.CustomerID, c.CustomerName
ORDER BY TotalSpent DESC
LIMIT 10;

SELECT * FROM top_customers;
SELECT CustomerID, SUM(Quantity * UnitPrice) AS TotalSpent
FROM ecommerce_data
WHERE CustomerID IS NOT NULL
GROUP BY CustomerID
ORDER BY TotalSpent DESC
LIMIT 10;