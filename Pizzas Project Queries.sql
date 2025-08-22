CREATE DATABASE pizzahut;
USE pizzahut;

-- #1 Retrieve the total number of orders placed. 
SELECT 
    COUNT(order_id) AS total_order
FROM
    orders;

-- #2 Calculate the total revenue generated from pizza sales. 
SELECT 
    SUM(order_details.quantity * pizzas.price) AS total_sales
FROM
    order_details
        JOIN
    pizzas ON pizzas.pizza_id = order_details.pizza_id;
    
-- #3 Identify the highest-priced pizza.
SELECT 
    MAX(price)
FROM
    pizzas;
    
SELECT pizzas.price, pizza_types.name
FROM pizza_types
JOIN pizzas
ON pizza_types.pizza_type_id = pizzas.pizza_type_id 
ORDER BY pizzas.price DESC LIMIT 1;
    
-- #4 Identify the most common pizza size ordered.
SELECT pizzas.size,  count(order_details.order_details_id) as a
FROM pizzas 
JOIN order_details
ON pizzas.pizza_id  = order_details.pizza_id
GROUP BY pizzas.size
ORDER BY a DESC LIMIT 1;

-- #5 List the top 5 most ordered pizza types along with their quantities.

SELECT 
    pizza_types.name, SUM(order_details.quantity) AS a
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.name
ORDER BY a DESC
LIMIT 5;

-- #6 Join the necessary tables to find the total quantity of each pizza category ordered.

SELECT pizza_types.category,  SUM(order_details.quantity) AS a
FROM pizza_types
JOIN pizzas
ON pizza_types.pizza_type_id = pizzas.pizza_type_id
JOIN order_details
ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category
ORDER BY a DESC;


-- #7 Determine the distribution of orders by hour of the day.

SELECT HOUR(time) AS hour, count(order_id) as order_count
FROM orders 
GROUP BY HOUR(time);

-- #8 Join relevant tables to find the category-wise distribution of pizzas.

SELECT category, COUNT(category)
FROM pizza_types
GROUP BY category;

-- #9 Group the orders by date and calculate the average number of pizzas ordered per day.
SELECT avg(total_order) FROM
(SELECT orders.date, sum(order_details.quantity) as total_order 
FROM orders
JOIN order_details
ON orders.order_id = order_details.order_id
GROUP BY orders.date ) as order_quantity;

-- #10 Determine the top 3 most ordered pizza types based on revenue.

SELECT pizza_types.name, sum(order_details.quantity * pizzas.price) as revenue
FROM pizza_types 
JOIN pizzas
ON pizzas.pizza_type_id = pizza_types.pizza_type_id
JOIN order_details
ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.name
ORDER BY revenue desc LIMIT 3;

-- #11 Calculate the percentage contribution of each pizza type to total revenue.

SELECT 
    pizza_types.category,
    SUM(order_details.quantity * pizzas.price) / (SELECT 
            SUM(order_details.quantity * pizzas.price) AS total_sales
        FROM
            order_details
                JOIN
            pizzas ON pizzas.pizza_id = order_details.pizza_id) * 100 AS revenue
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category
ORDER BY revenue DESC;


-- #12  Determine the top 3 most ordered pizza types based on revenue for each pizza category.

select name, revenue from
(select category, name, revenue,
rank() over(PARTITION BY category ORDER BY revenue desc ) as rn 
from
(SELECT 
    pizza_types.category,
    pizza_types.name,
    SUM(order_details.quantity * pizzas.price) AS revenue
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category , pizza_types.name) AS A) as b
where rn <= 3
order by name desc;

