CREATE DATABASE ecommerce_sales;
USE ecommerce_sales;
SHOW DATABASES;
CREATE TABLE sales (
    order_id INT PRIMARY KEY,
    order_date DATE,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    product VARCHAR(100),
    category VARCHAR(50),
    quantity INT,
    unit_price DECIMAL(10,2),
    payment_method VARCHAR(30),
    customer_rating DECIMAL(2,1)
);
DESCRIBE sales;
INSERT INTO sales
(order_id, order_date, customer_name, city, product, category, quantity, unit_price, payment_method, customer_rating)
VALUES
(1, '2026-08-01', 'Aman', 'Delhi', 'Laptop', 'Electronics', 1, 55000, 'UPI', 4.5),
(2, '2026-08-02', 'Riya', 'Noida', 'Phone', 'Electronics', 2, 25000, 'Card', 4.2),
(3, '2026-08-03', 'Shivam', 'Delhi', 'Shoes', 'Fashion', 1, 3000, 'COD', 4.0),
(4, '2026-08-04', 'Neha', 'Gurgaon', 'Headphones', 'Electronics', 3, 2000, 'UPI', 4.8),
(5, '2026-08-05', 'Rahul', 'Noida', 'T-Shirt', 'Fashion', 2, 1200, 'Card', 3.9),
(6, '2026-08-06', 'Priya', 'Delhi', 'Watch', 'Accessories', 1, 5000, 'UPI', 4.6),
(7, '2026-08-07', 'Arjun', 'Gurgaon', 'Backpack', 'Accessories', 2, 1800, 'COD', 4.1),
(8, '2026-08-08', 'Karan', 'Delhi', 'Phone', 'Electronics', 1, 27000, 'Card', 4.3),
(9, '2026-08-09', 'Simran', 'Noida', 'Shoes', 'Fashion', 2, 3200, 'UPI', 4.7),
(10, '2026-08-10', 'Meera', 'Gurgaon', 'Laptop', 'Electronics', 1, 60000, 'Card', 4.9);
SELECT * FROM sales;
SELECT
    order_id,
    customer_name,
    product,
    quantity,
    unit_price,
    quantity * unit_price AS revenue
FROM sales;
SELECT SUM(quantity * unit_price) AS total_revenue
FROM sales;
SELECT 
    product,
    SUM(quantity) AS total_units_sold
FROM sales
GROUP BY product
ORDER BY total_units_sold DESC;
SELECT
    product,
    SUM(quantity * unit_price) AS total_revenue
FROM sales
GROUP BY product
ORDER BY total_revenue DESC;
SELECT
    city,
    SUM(quantity * unit_price) AS total_revenue
FROM sales
GROUP BY city
ORDER BY total_revenue DESC;
SELECT
    payment_method,
    COUNT(*) AS total_orders
FROM sales
GROUP BY payment_method
ORDER BY total_orders DESC;
SELECT
    category,
    SUM(quantity * unit_price) AS total_revenue
FROM sales
GROUP BY category
ORDER BY total_revenue DESC;
SELECT
    product,
    ROUND(AVG(customer_rating), 2) AS average_rating
FROM sales
GROUP BY product
ORDER BY average_rating DESC;
SELECT
    order_id,
    customer_name,
    product,
    quantity * unit_price AS revenue
FROM sales
WHERE quantity * unit_price > 20000
ORDER BY revenue DESC;
SELECT
    customer_name,
    SUM(quantity * unit_price) AS total_spent
FROM sales
GROUP BY customer_name
ORDER BY total_spent DESC;
SELECT
    city,
    SUM(quantity * unit_price) AS total_revenue
FROM sales
GROUP BY city
HAVING SUM(quantity * unit_price) > 70000
ORDER BY total_revenue DESC;
SELECT
    customer_name,
    product,
    city,
    customer_rating
FROM sales
WHERE customer_rating >= 4.5
ORDER BY customer_rating DESC;
SELECT
    customer_name,
    product,
    category,
    payment_method,
    quantity * unit_price AS revenue
FROM sales
WHERE category = 'Electronics'
  AND payment_method = 'UPI';
  SELECT
    order_id,
    customer_name,
    product,
    quantity * unit_price AS revenue
FROM sales
ORDER BY revenue DESC
LIMIT 3;
SELECT COUNT(*) AS total_rows
FROM sales;
SELECT
    order_id,
    customer_name,
    product,
    quantity * unit_price AS revenue
FROM sales
ORDER BY revenue DESC
LIMIT 3;
SELECT
    product,
    SUM(quantity * unit_price) AS total_revenue
FROM sales
GROUP BY product
ORDER BY total_revenue ASC
LIMIT 3;
SELECT
    ROUND(
        SUM(quantity * unit_price) / COUNT(DISTINCT order_id),
        2
    ) AS average_order_value
FROM sales;
SELECT
    category,
    SUM(quantity * unit_price) AS category_revenue,
    ROUND(
        SUM(quantity * unit_price) * 100.0 /
        (SELECT SUM(quantity * unit_price) FROM sales),
        2
    ) AS revenue_percentage
FROM sales
GROUP BY category
ORDER BY category_revenue DESC;
SELECT
    city,
    category,
    SUM(quantity * unit_price) AS revenue
FROM sales
GROUP BY city, category
ORDER BY revenue DESC;
SELECT
    order_id,
    customer_name,
    product,
    quantity * unit_price AS revenue
FROM sales
WHERE quantity * unit_price BETWEEN 5000 AND 30000
ORDER BY revenue DESC;
SELECT
    customer_name,
    city,
    product,
    quantity * unit_price AS revenue
FROM sales
WHERE city IN ('Delhi', 'Noida')
ORDER BY revenue DESC;
SELECT
    customer_name,
    city,
    product
FROM sales
WHERE customer_name LIKE 'R%';
SELECT DISTINCT city FROM sales;
SELECT product, ROUND(AVG(customer_rating), 2) AS avg_rating
FROM sales
GROUP BY product
ORDER BY avg_rating DESC;
SELECT
    order_id,
    customer_name,
    quantity * unit_price AS revenue,
    CASE
        WHEN quantity * unit_price >= 30000 THEN 'High Value'
        WHEN quantity * unit_price >= 10000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS order_segment
FROM sales;
