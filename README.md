# 🏬 Inventory Management Analysis 📊🧾  

This project focuses on **analyzing inventory data** using SQL and CSV datasets.  
It demonstrates how businesses can manage products, suppliers, sales, and stores efficiently through queries and insights.  

---

## 📁 Project Structure  
- `inventory control management.sql` → SQL script for database setup & queries  
- `inventory.csv` → Inventory dataset  
- `products.csv` → Product details  
- `sales.csv` → Sales records  
- `stores.csv` → Store information  
- `suppliers.csv` → Supplier details  
- `README.md` → Project documentation  

---
## 📊 Dataset Overview  

| **Table Name** | **Columns** |
|----------------|-------------|
| **stores** | `store_id`, `store_name`, `location`, `store_size`
| **sales** | `sale_id`, `store_id`, `product_id`, `sale_date`, `units_sold`, `sales_amount`
| **suppliers** | `supplier_id`, `supplier_name`, `country`, `contact_email`
| **products** | `product_id`, `product_name`, `category`, `unit_price`, `supplier_id`
| **inventory** | `inventory_id`, `store_id`, `product_id`, `stock_quantity`, `last_updated`
| **weather** | `weather_id`, `location`, `weather_date`, `temperature`, `rainfall`, `snowfall`

---

## 🔍 Key Business Questions Answered  
📌 Basic Retrieval

List all store locations and their sizes

Show all products with their categories and prices

Display supplier details from a specific country

Retrieve all sales transactions for a specific date

Show the inventory status of a specific product across stores

📊 Aggregations & Summaries

Find the total sales amount per store

Identify the Top 5 best-selling products by quantity sold

Find the average unit price per product category

Calculate total revenue per month for the last year

Show total quantity sold for each supplier’s products

🔗 Join-Based Analysis

Find the store with the highest total sales

List products with supplier names and inventory levels

Show sales data along with weather conditions

Identify stores that sold more than 1,000 units in a single month

Analyze the relationship between rainfall and sales quantity

📦 Inventory & Supplier Insights

List products that have less than 50 units in stock

Show suppliers who provide more than 5 different products

Identify products that have never been sold

Find products where stock is below the average stock level

Estimate how many days of stock remain based on average daily sales

📅 Time-Based & Comparative Analysis

Compare sales between weekdays and weekends

Find the top product category contributing to total revenue
---

## ⚙️ Technologies Used  
- **SQL (MySQL)** – Joins, aggregations
- **Excel** – Data cleaning and formatting  

---

## 🧠 Key SQL Concepts Applied  
- `JOIN` (inner joins across multiple tables)  
- `GROUP BY`, `ORDER BY`, `HAVING`  
- Aggregate functions → `SUM()`, `COUNT()`, `AVG()`   
- Data filtering with `WHERE` & `CASE WHEN`  

---

## 📌 Insights

🔹 Store 48 recorded the highest total sales, making it the top-performing location.  
🔹 Top 5 products by units sold account for the majority of overall sales.  
🔹 Several products are below the average stock level and a few have never been sold.  
🔹 Weekend sales generated higher revenue than weekdays.  
🔹 Grocery emerged as the highest revenue-generating category.


---


## 🚀 How to Use
1. Import the SQL script into your database MySQL.  
2. Load the CSV files into their respective tables.  
3. Run queries to analyze sales, suppliers, and inventory performance.  

---

## 👩‍💻 Author
**Akanksha kasana**  
📧 reddyakanksha75@gmail.com  
🔗 https://github.com/akanksha4354

---
🌟 If You Like This Project

⭐ Star this repo on GitHub
