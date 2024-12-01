-- 1. KPI’s

-- a. Total Revenue
select sum(unit_price*quantity) as Total_Revenue from [PizzaSales Dataset];

-- b. Average Order Value
select (sum(total_price)/count(distinct order_id)) as Avg_Order_Value from [PizzaSales Dataset]

-- c. Total Pizzas Sold
select sum(cast(quantity AS DECIMAL)) as Total_Pizza_Sold from [PizzaSales Dataset]

-- d. Total Orders
select count(distinct cast(order_id as decimal)) Total_Orders from [PizzaSales Dataset]

-- e. Average Pizzas Per Order
select round(sum(cast(quantity AS DECIMAL))/count(distinct cast(order_id as decimal)),0) from [PizzaSales Dataset]

-- 2. Daily Trend for Total Orders
select datename(DW, order_date) AS order_day, count(distinct order_id) AS total_orders 
from [PizzaSales Dataset]
group by datename(DW, order_date)
order by total_orders;

-- 3. Monthly Trend for Orders
select datename(MM ,order_date) as month_name, count(distinct order_id) as total_orders
from [PizzaSales Dataset]
group by datename(mm, order_date)
order by total_orders;

-- 4. % of Sales by Pizza Category
select 
pizza_category, 
cast(sum(total_price) AS DECIMAL) as total_revenue,
cast(sum(total_price) * 100 / (select sum(total_price) from [PizzaSales Dataset]) AS DECIMAL) AS PCT
FROM [PizzaSales Dataset]
GROUP BY pizza_category

-- 5. % of Sales by Pizza Size
SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from [PizzaSales Dataset]) AS DECIMAL(10,2)) AS PCT
FROM [PizzaSales Dataset]
GROUP BY pizza_size
ORDER BY pizza_size

-- 6. Total Pizzas Sold by Pizza Category
select pizza_category, SUM(CAST(quantity AS DECIMAL)) as Categorywise_PizzaSold from [PizzaSales Dataset]
group by pizza_category
order by Categorywise_PizzaSold

-- 7. Top 5 Pizzas by Revenue
select top 5 pizza_name, sum(total_price) as Pizza_Revenue from [PizzaSales Dataset]
group by pizza_name
order by Pizza_Revenue desc;

-- 8. Bottom 5 Pizzas by Revenue
select top 5 pizza_name, sum(total_price) as Pizza_Revenue from [PizzaSales Dataset]
group by pizza_name
order by Pizza_Revenue asc;

-- 9. Top 5 Pizzas by Quantity
select top 5 pizza_name, sum(cast(quantity as decimal)) as Pizza_Revenue from [PizzaSales Dataset]
group by pizza_name
order by Pizza_Revenue desc;

-- 10. Bottom 5 Pizzas by Quantity
select top 5 pizza_name, sum(cast(quantity as decimal)) as Pizza_Revenue from [PizzaSales Dataset]
group by pizza_name
order by Pizza_Revenue asc;

-- 11. Top 5 Pizzas by Total Orders
select top 5pizza_name, count(distinct order_id) total_orders from [PizzaSales Dataset]
group by pizza_name
order by total_orders desc;

-- 12. Bottom 5 Pizzas by Total Orders
select top 5pizza_name, count(distinct order_id) total_orders from [PizzaSales Dataset]
group by pizza_name
order by total_orders asc;