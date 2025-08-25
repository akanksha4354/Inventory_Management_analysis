-- creating database
create database inventory_management_system;
-- using databse
use inventory_management_system;
-- 1.List all store locations and their sizes.
select store_name,location,store_size 
from stores;
-- 2.Show all products with their categories and prices.
select product_name,category,unit_price 
from products;
-- 3.Display the details of all suppliers from a specific country.
select * from suppliers
 where country='usa';
-- 4.Retrieve all sales transactions for a specific date.
select * from sales 
where sale_date='2022-01-15';
-- 5.Show the inventory status of a specific product in all stores.
select * from inventory 
where product_id='p004';
-- 6.Find the total sales amount per store.
select store_id,sum(sales_amount) as total_sales 
from sales
 group by store_id;
-- 7.Find the top 5 best-selling products by quantity sold.
select product_id,sum(units_sold) as quantity_sold 
from sales
group by product_id 
order by quantity_sold desc 
limit 5;
-- 8.Find the average unit price per product category.
select category,avg(unit_price) as average_price 
from products 
group by category;
-- 9.Calculate total revenue per month for the last year.
select date_format(sale_date, '%y-%m') as month, sum(sales_amount) as total_revenue 
from sales 
where sale_date>=date_sub(curdate(),interval 1 year)
group by date_format(sale_date, '%y-%m')
order by month;
-- 10.Show the total quantity sold for each supplier’s products.
select p.supplier_id,p.product_id, sum(s.units_sold)  as total_quantity 
from products p inner join sales s on p.product_id=s.product_id 
group by p.supplier_id,p.product_id;
-- 11.Find the store with the highest total sales.
select sum(s.sales_amount) as total_sales,st.store_id,st.store_name  
from sales s inner join stores st on s.store_id=st.store_id
group by st.store_id,st.store_name 
order by total_sales 
limit 1;
-- 12.List products with their supplier names and inventory levels.
select p.product_id,
       p.product_name,
       s.supplier_name,
       i.stock_quantity as inventory_level
from products p
join suppliers s on p.supplier_id = s.supplier_id
join inventory i on p.product_id = i.product_id;
-- 13.Show sales data along with weather conditions for those dates.
select 
    s.sale_id,
    s.sale_date,
    s.store_id,
    s.sales_amount,
    w.temperature, 
    w.rainfall,
    w.snowfall
from sales s
inner join wheather w 
    on s.sale_date = w.weather_date;
-- 14.Identify stores that sold more than 1,000 units in a single month.
select 
    st.store_id,
    st.store_name,
    date_format(s.sale_date, '%Y-%m') as sale_month,
    sum(s.units_sold) as total_units_sold
from sales s
join stores st on s.store_id = st.store_id
group by st.store_id, st.store_name, date_format(s.sale_date, '%Y-%m')
having sum(s.units_sold) > 1000
order by sale_month, total_units_sold desc;
-- 15.	Find the relationship between rainfall and sales quantity.
select s.sale_date,sum(s.units_sold) as total_units_sold,w.rainfall
from sales s join wheather w 
on s.sale_date=w.weather_date
group by s.sale_date,w.rainfall
order by w.rainfall;
-- 16.List products that have less than 100 units in stock.
select product_id,stock_quantity 
from inventory 
where stock_quantity>'100';
-- 17.Show suppliers who provide more than 1 different products.
select s.supplier_id,s.supplier_name,count(p.product_id) as no_of_items_providing 
from suppliers s inner join products p on s.supplier_id=p.supplier_id
group by s.supplier_id,s.supplier_name
having count(p.product_id)>1;
 -- 18.Identify products that have never been sold.
 select p.product_id,p.product_name 
 from products p left join sales s on p.product_id=s.product_id 
 where sale_id is null;
-- 19.Find products where stock is below the average stock level.
 select product_id,stock_quantity 
 from inventory 
 where 
 stock_quantity<(select avg(stock_quantity) from inventory);
 -- 20.Calculate how many days of stock are left based on average daily sales.
 select p.product_id,p.product_name,i.stock_quantity as current_stock,
 round(i.stock_quantity/(avg(s.units_sold)*1.0),2) as no_of_days_stock_left
 from products p inner join sales s on p.product_id=s.product_id inner join inventory i on p.product_id=i.product_id
 group by p.product_id,p.product_name,i.stock_quantity;
 -- 21.Compare sales between weekdays and weekends.
SELECT 
    CASE 
        WHEN DAYOFWEEK(sale_date) IN (1, 7) THEN 'Weekend'   -- Sunday=1, Saturday=7
        ELSE 'Weekday'
    END AS day_type,
    SUM(sales_amount) AS total_sales
FROM sales
GROUP BY day_type;
-- 22.Find the top product category contributing to total revenue.
select p.category,sum(s.sales_amount) as total_sales_amount 
from products p inner join sales s on p.product_id= s.product_id group by p.category 
order by total_sales_amount desc 
limit 1;