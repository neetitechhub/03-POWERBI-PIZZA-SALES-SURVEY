SELECT * FROM pizza_sales;
SELECT SUM(TOTAL_PRICE) FROM pizza_sales;
SELECT (SUM(TOTAL_PRICE) / COUNT(DISTINCT ORDER_ID)) AS AVG_ORDER_VALUE FROM pizza_sales;
SELECT SUM(QUANTITY) AS TOTAL_PIZZAS_SOLD FROM pizza_sales;
SELECT COUNT(DISTINCT ORDER_ID) AS TOTAL_ORDERS FROM PIZZA_SALES;
SELECT ROUND((SUM(QUANTITY) / COUNT(DISTINCT ORDER_ID)),2) AS AVG_PIZZA_PER_ORDER FROM pizza_sales;

update pizza_sales
set order_date = str_to_date(order_date, "%d-%m-%Y");

desc pizza_sales;

ALTER TABLE pizza_sales
modify COLUMN order_date date;

SELECT dayname(ORDER_DATE) AS ORDER_DAY, COUNT(DISTINCT ORDER_ID) AS TOTAL_ORDERS FROM pizza_sales
GROUP BY ORDER_DAY;

select monthname(order_date) as Month_Name, COUNT(DISTINCT order_id) as Total_Orders
from pizza_sales
GROUP BY Month_Name;

SELECT pizza_category, ROUND(SUM(total_price),2) AS TOTAL_REVENUE, 
ROUND((SUM(total_price)*100) / (SELECT SUM(total_price) FROM pizza_sales),2) AS PCT
FROM pizza_sales
GROUP BY pizza_category
ORDER BY PCT DESC;

SELECT pizza_size, ROUND(SUM(total_price),2) AS TOTAL_REVENUE, 
ROUND((SUM(total_price)*100) / (SELECT SUM(total_price) FROM pizza_sales),2) AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size;

SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM pizza_sales
-- WHERE DAYOFMONTH(order_date) = 2
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC;

SELECT PIZZA_NAME FROM pizza_sales;

SELECT PIZZA_NAME, SUM(QUANTITY) AS TOTAL_QUANTITY
FROM pizza_sales
GROUP BY pizza_name
ORDER BY TOTAL_QUANTITY DESC
LIMIT 5;

SELECT PIZZA_NAME, SUM(QUANTITY) AS TOTAL_QUANTITY
FROM pizza_sales
GROUP BY pizza_name
ORDER BY TOTAL_QUANTITY 
LIMIT 5;

SELECT PIZZA_NAME, SUM(total_price) AS TOTAL_REVENUE
FROM pizza_sales
GROUP BY pizza_name
ORDER BY TOTAL_REVENUE DESC
LIMIT 5;

SELECT PIZZA_NAME, SUM(total_price) AS TOTAL_REVENUE
FROM pizza_sales
GROUP BY pizza_name
ORDER BY TOTAL_REVENUE 
LIMIT 5;

SELECT PIZZA_NAME, COUNT(DISTINCT order_id) AS TOTAL_ORDERS
FROM pizza_sales
GROUP BY pizza_name
ORDER BY TOTAL_ORDERS DESC
LIMIT 5;

SELECT PIZZA_NAME, COUNT(DISTINCT order_id) AS TOTAL_ORDERS
FROM pizza_sales
GROUP BY pizza_name
ORDER BY TOTAL_ORDERS 
LIMIT 5;
 