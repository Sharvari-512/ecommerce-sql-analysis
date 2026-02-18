Ecommerce SQL Data Analysis Project

Project Overview
This project demonstrates SQL-based data analysis on an Ecommerce database.
The objective was to extract meaningful business insights using structured queries and relational database concepts.
The project was completed using MySQL Workbench.

Database Structure
The database consists of three tables:
1. Customers
- CustomerID (Primary Key)
- CustomerName
- Region
- SignupDate

2. Products
- ProductID (Primary Key)
- ProductName
- Category
- Price

3. Transactions
- TransactionID (Primary Key)
- CustomerID (Foreign Key)
- ProductID (Foreign Key)
- TransactionDate
- Quantity
- TotalValue
- UnitPrice

Database Design Features
- Primary Keys defined for all main tables
- Foreign Key constraints implemented
- Indexes added for performance optimization
- Data types corrected (TEXT → VARCHAR, DATE, DATETIME)
- Referential integrity enforced

SQL Concepts Used
- SELECT, WHERE, ORDER BY
- GROUP BY with aggregate functions (SUM, AVG, COUNT)
- INNER JOIN, LEFT JOIN
- Subqueries
- Views for analytical summaries
- Index creation for optimization

Key Business Insights Generated
- Total Revenue
- Revenue by Region
- Revenue by Product Category
- Top 5 Customers by Spending
- Monthly Revenue Trend
- Identification of Inactive Customers

Files Included
- ecommerce_analysis.sql → All SQL queries used
- Screenshots of query outputs
- Dataset files

How to Run
- Create database in MySQL
- Create tables using provided schema
- Import CSV data
- Execute queries from ecommerce_analysis.sql

Learning Outcome
- This project demonstrates practical knowledge of:
- Relational database design
- Query optimization

Data cleaning and transformation

Business-focused SQL analysis
