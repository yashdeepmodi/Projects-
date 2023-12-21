use pizza_db;
select round(sum(total_price),2) as Total_Revenue 
from pizza_sales;
SELECT round((SUM(total_price) / COUNT(DISTINCT order_id)),2) AS Avg_order_Value FROM pizza_sales;

SELECT SUM(quantity) AS Total_pizza_sold FROM pizza_sales;

SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales;

SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS Avg_Pizzas_per_order
FROM pizza_sales;

SELECT
  DATE_FORMAT(STR_TO_DATE(order_date, '%m/%d/%Y'), '%W') AS order_day,
  COUNT(DISTINCT order_id) AS total_orders
FROM
  pizza_sales
GROUP BY
  1;
  
 SELECT
  DATE_FORMAT(STR_TO_DATE(order_date, '%m/%d/%Y'), '%Y') AS Year,
  COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY 1;

select month(date_format(order_date, '%m/%d/%Y')) as Month_name,
COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY 1;   -- Why month name is not coming 

SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_category;

SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size;

SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM pizza_sales
WHERE MONTH(order_date) = 2
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC;

SELECT pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC
limit 5;

SELECT pizza_name, cast(SUM(total_price) as decimal(10,2)) AS Total_Revenue  
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC
limit 5;

SELECT  pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC
limit 5;

SELECT pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold 
limit 5;

select  pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC
limit 5;

select  pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders 
limit 5;



